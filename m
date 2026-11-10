Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=111.22.67.137
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794292880;
	b=WAOIWpMp8i4d8ukSPoWQCom0uifRTtXzGgQF3lKzyTZEtZzooKxOFKaDtd629uJfH80W
	 3bRoJ3I4Bo0dslOjMqS5nbP94U9xaqZlrEDmnx53ZsEDlfn0vjE8Yyvqzb7rZo8T7PJU0
	 HsXUJqL8AEwrYtebr2yMbmK0iQk1+ujybWPF7rMWbpq2lf0GVWI6Y19Z1X1z6ZhF7xo+J
	 nDd9i/jdH2p/scfFaXP2Fxg4QQyli/i0LRq5+r6kX1hZiCYwmnbW617qrEB2SMeicn5Lr
	 HbXbYz4htlMTAwiJv3C3MbDYos/SMcvnrvpxv4yjQDvwCbYpRGviXHZDhTn8JcUcMgg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794292880;
	h=DMARC-Filter:DKIM-Signature:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:
	 X-RM-TRANSID:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:X-RM-TRANSID:From:
	 To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=TpoFMfBEKNmv/ZRxvPnDbtx47PzSrWE39balC9JkGA8=;
	b=ZwvVNiJo2HYTKpoqEsvNJtLkOeLUCXftD/5BH1knFIPIoUCShQYUZ+gAsILTRLSF4FxL
	 lwxwQi4xftJk1u6k2TgPwszBPd/LiEDXtkh0uVs1J8nJ/EXjS+v3pt3rG8iuRtSSuorub
	 QZqrW+rHT1aftjcvBLknW5MQAsq3SE6zy+jyrxENOwxqhmyJALOgg8fPS6lpNLpnj6E00
	 lg+e3/agO/Z6jwSlhEZ8sC8ld4u9gjCveYNgsx1mIx03wkns0bNG3nAIh/BTdw1OiC5+7
	 UFn+f/mIZ9rS4rMYIKKcu2Mfk9ST/7RFhexubETJ8b3ynHPnaKWsdhf0UiAwJNbJ7Qg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cmss.chinamobile.com;
	spf=pass smtp.mailfrom=cmss.chinamobile.com;
	dkim=pass header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=yqlQK6h+;
	arc=none smtp.remote-ip=111.22.67.137
Received: from cmccmta4.chinamobile.com (cmccmta4.chinamobile.com [111.22.67.137])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3F3DE60A2614;
	Tue, 10 Nov 2026 06:41:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3F3DE60A2614
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=yqlQK6h+
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=cmss.chinamobile.com; s=default; l=0;
	h=from:subject:message-id:to:cc:mime-version;
	bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
	b=yqlQK6h+NKVAlN2VMbiR+K0iRDNPIBM/WucNVnIPndkvTzSMdU25/R8RvV8xTF6KYXFrD3B1rVywm
	 MMur5Rt2aubk7XX8EFTcjbEQp4sa8HBmr8Ll30UFQrCXwagmMi6t2Y0LnPgq8U8bWPe5n9CDvemoyT
	 oWO1tpyq1x3dHZzY=
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from spf.mail.chinamobile.com (unknown[10.188.0.87])
	by rmmx-syy-dmz-app04-12004 (RichMail) with SMTP id 2ee46af2bc8d840-6b656;
	Tue, 10 Nov 2026 14:41:17 +0800 (CST)
X-RM-TRANSID:2ee46af2bc8d840-6b656
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from  (unknown[223.108.79.97])
	by rmsmtp-syy-appsvr10-12010 (RichMail) with SMTP id 2eea6af2bc812f6-aa11c;
	Tue, 10 Nov 2026 14:41:17 +0800 (CST)
X-RM-TRANSID:2eea6af2bc812f6-aa11c
From: Shunbo Shi <shishunbo@cmss.chinamobile.com>
To: gregkh@linuxfoundation.org
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 14/22] usb: misc: fix a few spelling mistakes in comments
Date: Tue, 10 Nov 2026 06:40:57 +0000
Message-ID: <20261110064105.20335-15-shishunbo@cmss.chinamobile.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261110064105.20335-1-shishunbo@cmss.chinamobile.com>
References: <20261110064105.20335-1-shishunbo@cmss.chinamobile.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

No functional changes.

Signed-off-by: Shunbo Shi <shishunbo@cmss.chinamobile.com>
---
 drivers/usb/misc/emi26.c | 2 +-
 drivers/usb/misc/emi62.c | 2 +-
 drivers/usb/misc/ldusb.c | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/misc/emi26.c b/drivers/usb/misc/emi26.c
index 24d841850e05..a0fd80082043 100644
--- a/drivers/usb/misc/emi26.c
+++ b/drivers/usb/misc/emi26.c
@@ -198,7 +198,7 @@ static int emi26_load_firmware (struct usb_device *dev)
 		goto wraperr;
 	msleep(250);	/* let device settle */
 
-	/* return 1 to fail the driver inialization
+	/* return 1 to fail the driver initialization
 	 * and give real driver change to load */
 	err = 1;
 
diff --git a/drivers/usb/misc/emi62.c b/drivers/usb/misc/emi62.c
index 3eea60437f56..d29b5312f627 100644
--- a/drivers/usb/misc/emi62.c
+++ b/drivers/usb/misc/emi62.c
@@ -211,7 +211,7 @@ static int emi62_load_firmware (struct usb_device *dev)
 
 	kfree(buf);
 
-	/* return 1 to fail the driver inialization
+	/* return 1 to fail the driver initialization
 	 * and give real driver change to load */
 	return 1;
 
diff --git a/drivers/usb/misc/ldusb.c b/drivers/usb/misc/ldusb.c
index 71132a15e771..1072abab9659 100644
--- a/drivers/usb/misc/ldusb.c
+++ b/drivers/usb/misc/ldusb.c
@@ -2,7 +2,7 @@
 /*
  * Generic USB driver for report based interrupt in/out devices
  * like LD Didactic's USB devices. LD Didactic's USB devices are
- * HID devices which do not use HID report definitons (they use
+ * HID devices which do not use HID report definitions (they use
  * raw interrupt in and our reports only for communication).
  *
  * This driver uses a ring buffer for time critical reading of
-- 
2.53.0



