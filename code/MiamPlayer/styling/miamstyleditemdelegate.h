#ifndef MIAMSTYLEDITEMDELEGATE_H
#define MIAMSTYLEDITEMDELEGATE_H

#include <QStyledItemDelegate>
#include <QTableView>

class MiamStyledItemDelegate : public QStyledItemDelegate
{
	Q_OBJECT
private:
	QAbstractItemView *_itemView;
	bool _fallback;

public:
	explicit MiamStyledItemDelegate(QAbstractItemView *parent, bool fallback);

	virtual void paint(QPainter *p, const QStyleOptionViewItem &opt, const QModelIndex &index) const;
};

#endif // MIAMSTYLEDITEMDELEGATE_H
