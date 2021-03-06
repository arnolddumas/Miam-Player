#ifndef LIBRARYFILTERLINEEDIT_H
#define LIBRARYFILTERLINEEDIT_H

#include "styling/lineedit.h"
#include <QPropertyAnimation>
#include <QShortcut>
#include <QTimer>

/**
 * \brief		The LibraryFilterLineEdit class
 * \details
 * \author      Matthieu Bachelier
 * \copyright   GNU General Public License v3
 */
class LibraryFilterLineEdit : public LineEdit
{
	Q_OBJECT

public:
	LibraryFilterLineEdit(QWidget *parent = 0);

	QShortcut *shortcut;

protected:
	virtual void focusInEvent(QFocusEvent *event);

	virtual void paintEvent(QPaintEvent *);

signals:
	void focusIn();

	void aboutToStartSearch(const QString &text);
};

#endif // LIBRARYFILTERLINEEDIT_H
