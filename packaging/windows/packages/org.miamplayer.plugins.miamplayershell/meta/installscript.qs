/**************************************************************************
**
** Copyright (C) 2013 Digia Plc and/or its subsidiary(-ies).
** Contact: http://www.qt-project.org/legal
**
** This file is part of the Qt Installer Framework.
**
** $QT_BEGIN_LICENSE:LGPL$
** Commercial License Usage
** Licensees holding valid commercial Qt licenses may use this file in
** accordance with the commercial license agreement provided with the
** Software or, alternatively, in accordance with the terms contained in
** a written agreement between you and Digia.  For licensing terms and
** conditions see http://qt.digia.com/licensing.  For further information
** use the contact form at http://qt.digia.com/contact-us.
**
** GNU Lesser General Public License Usage
** Alternatively, this file may be used under the terms of the GNU Lesser
** General Public License version 2.1 as published by the Free Software
** Foundation and appearing in the file LICENSE.LGPL included in the
** packaging of this file.  Please review the following information to
** ensure the GNU Lesser General Public License version 2.1 requirements
** will be met: http://www.gnu.org/licenses/old-licenses/lgpl-2.1.html.
**
** In addition, as a special exception, Digia gives you certain additional
** rights.  These rights are described in the Digia Qt LGPL Exception
** version 1.1, included in the file LGPL_EXCEPTION.txt in this package.
**
** GNU General Public License Usage
** Alternatively, this file may be used under the terms of the GNU
** General Public License version 3.0 as published by the Free Software
** Foundation and appearing in the file LICENSE.GPL included in the
** packaging of this file.  Please review the following information to
** ensure the GNU General Public License version 3.0 requirements will be
** met: http://www.gnu.org/copyleft/gpl.html.
**
**
** $QT_END_LICENSE$
**
**************************************************************************/

// Constructor
function Component()
{
	var programFiles = installer.environmentVariable("PROGRAMW6432");
	if (programFiles !== "") {
		installer.setValue("TargetDir", programFiles + "/MiamPlayer");
	}
}

Component.prototype.isDefault = function()
{
	// select the component by default
	return true;
}

// called after everything is set up, but before any file is written
Component.prototype.beginInstallation = function()
{
    // call default implementation which is necessary for most hooks in beginInstallation case it makes nothing
    component.beginInstallation();
}

Component.prototype.createOperations = function()
{
	try {
		// call the base create operations function
		component.createOperations();
		
		if (installer.value("os") == "win") { 
			try {
				// Register DLL
				component.addElevatedOperation("Execute", "{0,3}", "regsvr32", "@TargetDir@\\MiamPlayerShell.dll", "/s",
												"UNDOEXECUTE", "regsvr32", "/u", "@TargetDir@\\MiamPlayerShell.dll", "/s");
			} catch (e) {
				
			}
		}
	} catch (e) {
		print(e);
	}
}
