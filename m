Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E328C22F01;
	Thu, 17 Sep 2026 08:11:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.27.42.3
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789632687; cv=none; b=NuLlBiKVW0Bizm/lwygPnZb7vXiQWvAcwAWqliEJmVZ6ebMQSBR+CtNCunETG1O5EL4kQ1jmgBLUIyBFHk05w3QvVKF/UTXVxLF8aXrYV31y1oJxsPio6/eKd9nv2gh7mc7MS3zHLw8eHBFcoe40PyFKttrugcuSnd3c7XYkK6w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789632687; c=relaxed/simple;
	bh=cfCoYpGqmiDJPutSUQU1zm2/la0SsnFiEnQLjHY8IXU=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=p3Xoam/Bq2K2eVtweMu6B5DBAes18H7h7XEPLT3laXq2Sd5aBLv/62tHpZloKare/JI+lDHnsxyb7rPwJ5jZm4371YaB90Q5LfhPYhDr92qmzI45wJbnahXQjfXDwPn3/04ePiyIlJQcMIftSUmoSLmQ28IScGh3XsdWmlWWAU0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=lht.dlh.de; spf=pass smtp.mailfrom=free.fr; arc=none smtp.client-ip=212.27.42.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=lht.dlh.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=free.fr
Received: from albans-vm.. (unknown [213.61.137.106])
	(Authenticated sender: albeu@free.fr)
	by smtp3-g21.free.fr (Postfix) with ESMTPSA id 6E35913F8A9;
	Thu, 17 Sep 2026 10:11:12 +0200 (CEST)
From: Alban Bedel <alban.bedel@lht.dlh.de>
To: linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Johan Hovold <johan@kernel.org>,
	Alban Bedel <alban.bedel@lht.dlh.de>
Subject: [PATCH] USB: serial: Support attaching serdev devices
Date: Thu, 17 Sep 2026 10:11:03 +0200
Message-Id: <20260917081103.1917665-1-alban.bedel@lht.dlh.de>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use tty_port_register_device_serdev() to allow attaching serdev
devices to USB serial ports. Also set the ACPI companion device on the
USB serial device to let the serdev matching work on ACPI systems.

Signed-off-by: Alban Bedel <alban.bedel@lht.dlh.de>
---
 drivers/usb/serial/bus.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/serial/bus.c b/drivers/usb/serial/bus.c
index 9e2a18c0b2183..0b0a5ea1ba5aa 100644
--- a/drivers/usb/serial/bus.c
+++ b/drivers/usb/serial/bus.c
@@ -6,6 +6,7 @@
  */
 
 #include <linux/kernel.h>
+#include <linux/acpi.h>
 #include <linux/errno.h>
 #include <linux/tty.h>
 #include <linux/slab.h>
@@ -49,9 +50,13 @@ static int usb_serial_device_probe(struct device *dev)
 			goto err_autopm_put;
 	}
 
+	ACPI_COMPANION_SET(dev, ACPI_COMPANION(&port->serial->dev->dev));
+
 	minor = port->minor;
-	tty_dev = tty_port_register_device(&port->port, usb_serial_tty_driver,
-					   minor, dev);
+	tty_dev = tty_port_register_device_serdev(&port->port,
+						  usb_serial_tty_driver,
+						  minor, dev,
+						  &port->serial->dev->dev);
 	if (IS_ERR(tty_dev)) {
 		retval = PTR_ERR(tty_dev);
 		goto err_port_remove;
-- 
2.39.5

