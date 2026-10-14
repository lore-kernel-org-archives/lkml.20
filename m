Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BD1B421226
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 05:13:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791954820; cv=none; b=AUWEzNSLvrV0WRX0Zohm+sBGhJaijxC/83WSzTcK5lL0dZ26KabF7IotCSKbeKruwDjOtfzUFHB80rISmVP8MUiaycgfhe3VQl82uWdkP840YvvU+3BoH6SbDsIciRmbMoSKI/jW3u7WcM6xTlMgSXchqwez8+hKUV7bmFOqJPI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791954820; c=relaxed/simple;
	bh=PCxxcn6JaCpLIK8BQyFUvhMSkm+HMXkbPHY3uUK4fNM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Y/wWyyuSh43zzXvco3RFrinkEt0f3nyjuYun8uOa2IrK+7qpBgYw2ggHmld9USxzfR+Ryu8pXtL/gVZ/ZSFB2na5x8Zbgez7+bbgMdKvzLfRumPyGgO4W9v1qoJY3CvF68w2PPKMSrUapFITw9rbR6Q1YfMvJsyfLuh3SlWpTEM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=C1qh8KF2; arc=none smtp.client-ip=74.125.82.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="C1qh8KF2"
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-35b2c599f43so4166996eec.0
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 22:13:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791954818; x=1792559618; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xrXU4zkPCMdeqO1j0v9Z1k0Agb/FJlpriDsHwaYaty0=;
        b=C1qh8KF2bfAD6f17ndVdVD/s7SaWiTNybP+P7lzTrUMfJzt+H1oeG4j+AHn5GNKBZF
         s0dkc3HLRCQoNvzezPdLeR2idU0ovM0zwaMNPq8JJrCP9MyFe8zo33JDxaxUhWF4wN7g
         EeDSnkAtoZ4a8hIndVXXEoFJ9lgIeUs93i2F4qmSYovHxZQVITK67WbW3MpVN1PMSxNa
         OTOAl/LYYIPixWbrzMBJq8ORuESRimPrrxl5tZQjG/ty2U6twRnY05uVv/ar8XMtdU7x
         aK0jXDM+eo9mc/G/f1BckNGNKrOTjPBI8xLYVlGw1u6kIQGVh0ZL1MqMHAVWuJUk05Rh
         93Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791954818; x=1792559618;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=xrXU4zkPCMdeqO1j0v9Z1k0Agb/FJlpriDsHwaYaty0=;
        b=1lFeiUYzdxCCPuW9Ios8BjEZOPh0QPn15h5iMu1FS4No/zy0bT0yZQxDavPJNEC3XE
         WXqFwkDNAsfgTDkLSe8dfyB2YH+PxIeHVCZuaTLwNpwKWQWXo3d266NYrvrHmNunOKJJ
         K6aYDUACK3EAYEMz8JZjFLW/6j5ncP2IruQ3XZXT48DsTAxC/XISyrxmkjJ0Mf8CAT3+
         lRR98uxABraXRLoJsyeokrbGFE65iBYi4zZiv+9J2ulMNHO7n2yh9jSE04bLR4GWIQD4
         SoJ9iH6ZERMZ5EyWALe5G3g98UhJuHFXQIZFN+koAZnObU5H48XvDocHkF/l5OYY9O0F
         83Zw==
X-Forwarded-Encrypted: i=1; AKwUvBy5O0Tl5dFqM4Z2f2NheMpY+QVJ2l6ou7jWYgiqFhBS+UpQW1/jUKbv9pW0UEFSma+y1dGzVbANSERai/g=@vger.kernel.org
X-Gm-Message-State: AFq9FYJqMae5gICyuU6LSeGGkUVU09xFbxfGFMd+wB7mVMV6YPZpiiTR
	lbvj7r3vEi3LguLqMt+b3xoq9D3NcmrT372rC3QpE8+BoMaJSrBjFAet
X-Gm-Gg: AYBFou2c9TRCLqlm4jumBcHORln0vK9qT1Q8pCOVo+oVXUP1f8lnzDnfGjg4JGgRDgI
	jgzVWJj/U0MU+Z1awKKu0FqDrQF6GfnRB7V5J3xn5SbYwdmiZR3y2nWDaVUPCKpixFiBF80BluP
	nT+7gRyhDhMxcCtJNv19SnpYabAqSmFD0TradnrBz0TD275NnjLs1nV5Vuie8oIrwCxCK6cVSyt
	BDCKTk7VaEDl6usQwZ/YPAc5jFjYf0u5XMmd/4vUpJ38uCkCXv2E0R35uu8KCgiBK5Lr5cMAXt1
	HDAkxLBYF+0XTakxWUnaGL0fVQkUGTBLc5Msr4WAntR5FtC3oyNj2pZLOOiQYu3vzwAe4vuNhPi
	PRd1uCp2gG1M2dKT5qANzuEndCGM+AIRO4X6Vm8iR0XoJB2YbClkf7YFCPepOecol6iGbZfyjFC
	VAjBW8Z3FXjWc4DTWAOx5dvm3NGPyYrQKjfSZ+hOA0AdhKojQsXRlQJaght95c5lTkAj3UdTh0+
	Nhqjp38UNU7uWUVHpumUMFR+aWDZGUtvk/MvSPZlJNLh8lEx0NSAJ7Ut4WDKY3WfOc5k3+1/A==
X-Received: by 2002:a05:7300:6822:b0:35b:bb89:231e with SMTP id 5a478bee46e88-35bbb892336mr8115364eec.29.1791954817958;
        Tue, 13 Oct 2026 22:13:37 -0700 (PDT)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:875a:117f:b9ea:5a08])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3537cacb61asm51629125eec.21.2026.10.13.22.13.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 22:13:37 -0700 (PDT)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>
Cc: Marcel Holtmann <marcel@holtmann.org>,
	Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
	Michael Zaidman <michael.zaidman@gmail.com>,
	Rishi Gupta <gupt21@gmail.com>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	David Barksdale <dbarksdale@uplogix.com>,
	Andrej Shadura <andrew@shadura.me>,
	Johannes Roith <johannes@gnu-linux.rocks>,
	linux-input@vger.kernel.org,
	linux-bluetooth@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 4/5] HID: Drop unused linux/hidraw.h includes
Date: Tue, 13 Oct 2026 22:13:24 -0700
Message-ID: <20261014051326.3784498-5-dmitry.torokhov@gmail.com>
X-Mailer: git-send-email 2.56.0.385.gd3acb90ef8-goog
In-Reply-To: <20261014051326.3784498-1-dmitry.torokhov@gmail.com>
References: <20261014051326.3784498-1-dmitry.torokhov@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Several HID transport and sub-drivers include linux/hidraw.h without
referencing any definitions from it. Drop these unnecessary includes.

In hid-ft260, replace the hidraw.h include with linux/hid.h directly to
preserve the declarations it previously relied on indirectly.

Assisted-by: LLM
Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/hid/hid-ft260.c       | 2 +-
 drivers/hid/hid-mcp2200.c     | 1 -
 drivers/hid/hid-mcp2221.c     | 1 -
 drivers/hid/hid-winwing.c     | 1 -
 drivers/hid/usbhid/hid-core.c | 1 -
 net/bluetooth/hidp/core.c     | 1 -
 6 files changed, 1 insertion(+), 6 deletions(-)

diff --git a/drivers/hid/hid-ft260.c b/drivers/hid/hid-ft260.c
index 70e2eedb465a..c4d13a6a575d 100644
--- a/drivers/hid/hid-ft260.c
+++ b/drivers/hid/hid-ft260.c
@@ -9,7 +9,7 @@
  */
 
 #include "hid-ids.h"
-#include <linux/hidraw.h>
+#include <linux/hid.h>
 #include <linux/i2c.h>
 #include <linux/module.h>
 #include <linux/usb.h>
diff --git a/drivers/hid/hid-mcp2200.c b/drivers/hid/hid-mcp2200.c
index dafdd5b4a079..9c82de069b8b 100644
--- a/drivers/hid/hid-mcp2200.c
+++ b/drivers/hid/hid-mcp2200.c
@@ -12,7 +12,6 @@
 #include <linux/err.h>
 #include <linux/gpio/driver.h>
 #include <linux/hid.h>
-#include <linux/hidraw.h>
 #include <linux/module.h>
 #include <linux/mutex.h>
 #include "hid-ids.h"
diff --git a/drivers/hid/hid-mcp2221.c b/drivers/hid/hid-mcp2221.c
index e4ddd8e9293b..bd6b92b5a09d 100644
--- a/drivers/hid/hid-mcp2221.c
+++ b/drivers/hid/hid-mcp2221.c
@@ -14,7 +14,6 @@
 #include <linux/completion.h>
 #include <linux/delay.h>
 #include <linux/hid.h>
-#include <linux/hidraw.h>
 #include <linux/i2c.h>
 #include <linux/gpio/driver.h>
 #include <linux/iio/iio.h>
diff --git a/drivers/hid/hid-winwing.c b/drivers/hid/hid-winwing.c
index 9cd25a77999e..5223baf2d020 100644
--- a/drivers/hid/hid-winwing.c
+++ b/drivers/hid/hid-winwing.c
@@ -8,7 +8,6 @@
 
 #include <linux/device.h>
 #include <linux/hid.h>
-#include <linux/hidraw.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/mutex.h>
diff --git a/drivers/hid/usbhid/hid-core.c b/drivers/hid/usbhid/hid-core.c
index 96b0181cf819..e398afce73fc 100644
--- a/drivers/hid/usbhid/hid-core.c
+++ b/drivers/hid/usbhid/hid-core.c
@@ -34,7 +34,6 @@
 #include <linux/hid.h>
 #include <linux/hiddev.h>
 #include <linux/hid-debug.h>
-#include <linux/hidraw.h>
 #include "usbhid.h"
 #include "hid-pidff.h"
 
diff --git a/net/bluetooth/hidp/core.c b/net/bluetooth/hidp/core.c
index 0e24c5e2955e..bb408599a28b 100644
--- a/net/bluetooth/hidp/core.c
+++ b/net/bluetooth/hidp/core.c
@@ -22,7 +22,6 @@
 #include <linux/module.h>
 #include <linux/file.h>
 #include <linux/kthread.h>
-#include <linux/hidraw.h>
 
 #include <net/bluetooth/bluetooth.h>
 #include <net/bluetooth/hci_core.h>
-- 
2.56.0.385.gd3acb90ef8-goog
