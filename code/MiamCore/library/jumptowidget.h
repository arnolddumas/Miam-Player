#ifndef JUMPTOWIDGET_H
#define JUMPTOWIDGET_H

#include <QAbstractItemView>
#include <QMouseEvent>
#include <QWidget>

#include "miamcore_global.h"

/**
 * \brief		The JumpToWidget class displays letters which can be clicked to jump to a particular position in your Library.
 * \author      Matthieu Bachelier
 * \copyright   GNU General Public License v3
 */
class MIAMCORE_LIBRARY JumpToWidget : public QWidget
{
	Q_OBJECT
private:
	QAbstractItemView *_view;

	QPoint _pos;

	QChar _currentLetter;

	QSet<QChar> _lettersToHighlight;

public:
	explicit JumpToWidget(QAbstractItemView *view);

	virtual bool eventFilter(QObject *obj, QEvent *event);

	inline void highlightLetters(const QSet<QChar> &letters) { _lettersToHighlight = letters; }

	void setCurrentLetter(const QChar &currentLetter);

	virtual QSize sizeHint() const;

protected:
	virtual void leaveEvent(QEvent *event) override;

	virtual void mouseMoveEvent(QMouseEvent *event) override;

	virtual void paintEvent(QPaintEvent *event) override;

	/** Reduce the font if this widget is too small. */
	virtual void resizeEvent(QResizeEvent *event) override;

signals:
	void aboutToScrollTo(const QString &letter);
	void displayItemDelegate(bool);
};

#endif // JUMPTOWIDGET_H
