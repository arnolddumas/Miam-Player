#include "equalizerdialog.h"
#include "ui_equalizerdialog.h"

#include "mediaplayer.h"

#include "vlc-qt/MediaPlayer.h"
#include "vlc-qt/Equalizer.h"

EqualizerDialog::EqualizerDialog(QWidget *parent) :
	QDialog(parent)
{
	setupUi(this);

	auto mediaPlayer = MediaPlayer::instance();
	auto equalizer = mediaPlayer->vlcMediaPlayer()->equalizer();

	// Connect each slider to VLC's equalizer
	for (QSlider *slider : findChildren<QSlider*>()) {
		QLabel *label = findChild<QLabel*>(slider->objectName().replace("slider", "label"));
		connect(slider, &QSlider::valueChanged, this, [=](int value) {
			float f = value / 10.0f;
			label->setText(QString::number(f, 'f', 1) + " db");
			if (slider == preamp_slider) {
				equalizer->setPreamplification(f);
			} else {
				int bandIndex = slider->objectName().mid(5, 2).toInt() - 1;
				equalizer->setAmplificationForBandAt(f, bandIndex);
			}
		});
	}

	// Fill Combo box with preset list
	for (uint i = 0; i < equalizer->presetCount(); i++) {
		//presetComboBox->addItem(QIcon(":/icons/track"), equalizer->presetNameAt(i));
		QListWidgetItem *item = new QListWidgetItem(QIcon(":/icons/track"), equalizer->presetNameAt(i));
		presetList->addItem(item);
	}

	connect(toggleEqualizer, &QCheckBox::toggled, this, &EqualizerDialog::toggle);
	//connect(presetComboBox, static_cast<void (QComboBox::*)(int)>(&QComboBox::currentIndexChanged), equalizer, &VlcEqualizer::loadFromPreset);
	connect(equalizer, &VlcEqualizer::presetLoaded, this, &EqualizerDialog::applySelectedPreset);
}

void EqualizerDialog::setVisible(bool visible)
{
	if (visible) {
		auto mediaPlayer = MediaPlayer::instance();
		auto playlist = mediaPlayer->playlist();
		if (playlist) {
			QMediaContent mc = playlist->currentMedia();
			toggleEqualizer->setEnabled(mc.canonicalUrl().isLocalFile());
		} else {
			this->toggle(false);
			toggleEqualizer->setEnabled(false);
		}
	}
	QDialog::setVisible(visible);
}

void EqualizerDialog::toggle(bool b)
{
	for (QSlider *slider : findChildren<QSlider*>()) {
		slider->setEnabled(b);
	}
	for (QLabel *label : findChildren<QLabel*>()) {
		label->setEnabled(b);
	}
	//presetComboBox->setEnabled(b);
	auto equalizer = MediaPlayer::instance()->vlcMediaPlayer()->equalizer();
	if (equalizer) {
		equalizer->setEnabled(b);
	}
}

void EqualizerDialog::applySelectedPreset()
{
	auto equalizer = MediaPlayer::instance()->vlcMediaPlayer()->equalizer();
	for (QSlider *slider : findChildren<QSlider*>()) {
		QLabel *label = findChild<QLabel*>(slider->objectName().replace("slider", "label"));
		if (slider == preamp_slider) {
			slider->setValue(equalizer->preamplification() * 10);
			label->setText(QString::number(equalizer->preamplification(), 'f', 1) + " db");
		} else {
			int bandIndex = slider->objectName().mid(5, 2).toInt() - 1;
			slider->setValue(equalizer->amplificationForBandAt(bandIndex) * 10);
			int i = equalizer->amplificationForBandAt(bandIndex) * 10;
			label->setText(QString::number(i / 10.0f, 'f', 1) + " db");
		}
	}
}
