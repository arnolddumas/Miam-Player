#ifndef EQUALIZERDIALOG_H
#define EQUALIZERDIALOG_H

#include <QDialog>

#include "ui_equalizerdialog.h"

class EqualizerDialog : public QDialog, public Ui::EqualizerDialog
{
	Q_OBJECT
public:
	explicit EqualizerDialog(QWidget *parent = 0);

	virtual void setVisible(bool visible) override;

private:
	void toggle(bool b);

private slots:
	void applySelectedPreset();
};

#endif // EQUALIZERDIALOG_H
