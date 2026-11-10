Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=111.22.67.139
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794297518;
	b=IqoKHyp2mPnhkqAcHO124tOM/3rIqGG5CVTPZ4YkK1goZnGe2q7VNhu+AmupH3TKCeUV
	 e9dYn/RwDjMF6IgFFtESDK8gFDl1w/Sb5iBkj+F0VsIr+AvX/EkQn5eOtUEtiLI5Ms+u5
	 WnbYBonrTdKUKVYFg5gWZ9RTVX3JODhM5Om6KBm4hNmTXTdf5ZjXOvJqqbAD97R5+uhRJ
	 o6IcfhmRuv5amMQNE/sGyH5i65DNbsOhF5epA7YuNtSPQeDz59gluTADafyDV/PkQmcHh
	 dpyvxgYOaxn/ymElLEOStdf1Ac4iVpBY6teMZA7VAYMkw0LMSWxxfQTy8UO+fhYtYmQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794297518;
	h=DMARC-Filter:DKIM-Signature:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:
	 X-RM-TRANSID:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:X-RM-TRANSID:From:
	 To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=TpoFMfBEKNmv/ZRxvPnDbtx47PzSrWE39balC9JkGA8=;
	b=oM2knc3QBU8UhZskXq7q33yGc2tM58TxxceZoDXsAGPernVet9BN5yYYf139mhvxTj3k
	 eVIF9d9cZu1SQqW0NSEn4LF2KYuhG39VPS67KwEz8LT46c3kpgNTsQYj5QRwzvEfg0svV
	 oYXFQptQmQ5qULooMK0V6M8xkqQuqwYQP7f4OMF6FFb83Z/VUNqYNtOliArCr2V33BvIP
	 VcnISp8CdU1tf0+fc9zJxFbtJ24L41/A4GUgbe0AeoFTvfYDZCh+8bweXzIzsPr+oNk08
	 6WZ9WOdprQ7vUAtKvyRux+oWM80tWgegyFtAB/LqUGjINeYfm1tM2IQoX12WbQqJKiA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cmss.chinamobile.com;
	spf=pass smtp.mailfrom=cmss.chinamobile.com;
	dkim=pass header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=wn9I1lEk;
	arc=none smtp.remote-ip=111.22.67.139
Received: from cmccmta6.chinamobile.com (cmccmta6.chinamobile.com [111.22.67.139])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 984A160A5BD1;
	Tue, 10 Nov 2026 07:58:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 984A160A5BD1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=wn9I1lEk
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=cmss.chinamobile.com; s=default; l=0;
	h=from:subject:message-id:to:cc:mime-version;
	bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
	b=wn9I1lEkZDcGN773uVFiP4Tj7DGCOrd7YTUdu79kPXSoHoxci3Q9OVAHPv9h8dkdlH6PlbtDHu0ta
	 W1vvPTU976Y1oHxL2PugZGSntO+QTbDS6+ZCun69V9cIAYoSXFq/+Qme9jILjoqljT6IyDukmQGIHV
	 /uf3WCYMKAab59ek=
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from spf.mail.chinamobile.com (unknown[10.188.0.87])
	by rmmx-syy-dmz-app05-12005 (RichMail) with SMTP id 2ee56af2ceacb3b-ca0ac;
	Tue, 10 Nov 2026 15:58:36 +0800 (CST)
X-RM-TRANSID:2ee56af2ceacb3b-ca0ac
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from  (unknown[223.108.79.97])
	by rmsmtp-syy-appsvr07-12007 (RichMail) with SMTP id 2ee76af2cea2027-acde3;
	Tue, 10 Nov 2026 15:58:36 +0800 (CST)
X-RM-TRANSID:2ee76af2cea2027-acde3
From: Shunbo Shi <shishunbo@cmss.chinamobile.com>
To: gregkh@linuxfoundation.org
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 14/22] usb: misc: fix a few spelling mistakes in comments
Date: Tue, 10 Nov 2026 07:58:17 +0000
Message-ID: <20261110075825.24946-15-shishunbo@cmss.chinamobile.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261110075825.24946-1-shishunbo@cmss.chinamobile.com>
References: <20261110064105.20335-1-shishunbo@cmss.chinamobile.com>
 <20261110075825.24946-1-shishunbo@cmss.chinamobile.com>
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



