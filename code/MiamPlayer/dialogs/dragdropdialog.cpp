#include "dragdropdialog.h"

#include <QFileInfo>
#include <QRadioButton>

#include "settings.h"

#include <QtDebug>

DragDropDialog::DragDropDialog(QWidget *parent) :
	QDialog(parent)
{
	setupUi(this);

	connect(toolButtonLibrary, &QToolButton::clicked, this, &DragDropDialog::addExternalFoldersToLibrary);
	connect(toolButtonPlaylist, &QToolButton::clicked, this, &DragDropDialog::addExternalFoldersToPlaylist);

	originalLabel = labelHowToProceed->text();
}

/** Is it necessary to redefined this from the UI class just for this init label? */
void DragDropDialog::retranslateUi(DragDropDialog *dialog)
{
	labelHowToProceed->setText("What would you like to do with %1?");
	Ui::DragDropDialog::retranslateUi(dialog);
}

void DragDropDialog::setMimeData(const QMimeData *mimeData)
{
	if (mimeData->hasUrls()) {
		QList<QUrl> urlList = mimeData->urls();
		QString newLabel;
		int folders = 0;
		int maxDisplayedInLabel = 3;

		_externalLocations.clear();
		labelHowToProceed->setText(originalLabel);

		for (int i = 0; i < urlList.size(); i++) {
			QFileInfo fileInfo = urlList.at(i).toLocalFile();
			if (fileInfo.isDir()) {
				// Builds the label as a concatenation of folders' name
				if (folders < maxDisplayedInLabel) {
					newLabel.append(fileInfo.fileName()).append(", ");
					folders++;
				}
				_externalLocations.append(fileInfo.absoluteFilePath());
			}
		}
		if (newLabel.length() > 2) {
			newLabel = newLabel.left(newLabel.length() - 2);
			if (folders >= maxDisplayedInLabel) {
				newLabel.append(", ... ");
			}
			labelHowToProceed->setText(labelHowToProceed->text().arg(newLabel));
		}
	}
}

void DragDropDialog::addExternalFoldersToLibrary()
{
	if (checkBoxRememberChoice->isChecked()) {
		Settings::getInstance()->setDragDropAction(Settings::DD_AddToLibrary);
	}
	emit aboutToAddExtFoldersToLibrary(_externalLocations);
	this->accept();
}

void DragDropDialog::addExternalFoldersToPlaylist()
{
	if (checkBoxRememberChoice->isChecked()) {
		Settings::getInstance()->setDragDropAction(Settings::DD_AddToPlaylist);
	}
	emit aboutToAddExtFoldersToPlaylist(_externalLocations);
	this->accept();
}
