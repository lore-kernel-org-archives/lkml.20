Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=111.22.67.151
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794292883;
	b=2IIRApB1i010iFAUu1QACmyPBFGTgllbOu/0W4kyeAO69aW930imMm5a3VBUw16KuExb
	 MGj2BNZ6KUFUjehdbqeFACoZ4C0Iv+5ag47iMbjH2wSkQWatc4qu/39yfMxA6NjMwqIvP
	 vb4fXcWFpKRpnssUHJzhNOCgi+GCvgi8drqxOE7zJKK2wDda9WjSSP/kiq0OPLVODVtsS
	 +AEZhLYOOQGk76nABouxAtTwdN7dl/+r9pViokFuKVGllQyy9QqJg4Me+pR4wd/IN7ns2
	 l9w8B24DCcXy4xWwukFu+9KcWoSJD2KykQEFbt5hCFfZhccdG/tADrxXtTJ96lK5x3Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794292883;
	h=DMARC-Filter:DKIM-Signature:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:
	 X-RM-TRANSID:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:X-RM-TRANSID:From:
	 To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=XlqmMTmdQY0yvkWH+OmhyR8vbh/qufmYoAUMw4jsvAE=;
	b=CboP+Il15gvmNg2zqkHLozaZ9/xuvbKuYvm+qiDQzWIe5hobLzA4yYYaJOlcNkfRnV/X
	 85tF4fBRrDXdrsQHtwfaa0d8H0Mg5/pujqqOEKNhXwi+aJwvEqwFyLgLNPixKfLh3BYRc
	 wd3STpyyc8fOJvKg1XEnDW4WkPtdnDnH2xLzW8Lzv7c1hlo3ku3r1k9Hly5z2+XZaH8yk
	 qoKC9B9SYl3G2M5VSQa2L7x+y41ItJwjy6TgQxIZ3c7DXqpyEAn33osrvUUtdaOpMM4Ry
	 ny7vowj/mSz5JYioJzAma+CiPMdXQ6rxLyktz7Lo5FNw5tnFZmoXFb2spIsqqpu8i/w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cmss.chinamobile.com;
	spf=pass smtp.mailfrom=cmss.chinamobile.com;
	dkim=pass header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=PFF9s9J0;
	arc=none smtp.remote-ip=111.22.67.151
Received: from cmccmta8.chinamobile.com (cmccmta8.chinamobile.com [111.22.67.151])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6FA4C60A5BCB;
	Tue, 10 Nov 2026 06:41:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6FA4C60A5BCB
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=PFF9s9J0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=cmss.chinamobile.com; s=default; l=0;
	h=from:subject:message-id:to:cc:mime-version;
	bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
	b=PFF9s9J05KcO8+Uch4nlglJSypF8jLy9dQzyVdnVnfcveUtihqlKoSo/ubJTnxBgUlITEfiScfFf0
	 A7S49/F80Jg6CoG64uUsSF+LAPf+lHj+eFA5aCUfNiocEgC82jrdtmEHiXbpnCa98kuX18NtuT3MaB
	 beJN4Nlq8nTkZYSw=
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from spf.mail.chinamobile.com (unknown[10.188.0.87])
	by rmmx-syy-dmz-app06-12006 (RichMail) with SMTP id 2ee66af2bc8f83c-983db;
	Tue, 10 Nov 2026 14:41:20 +0800 (CST)
X-RM-TRANSID:2ee66af2bc8f83c-983db
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from  (unknown[223.108.79.97])
	by rmsmtp-syy-appsvr10-12010 (RichMail) with SMTP id 2eea6af2bc812f6-aa12c;
	Tue, 10 Nov 2026 14:41:20 +0800 (CST)
X-RM-TRANSID:2eea6af2bc812f6-aa12c
From: Shunbo Shi <shishunbo@cmss.chinamobile.com>
To: gregkh@linuxfoundation.org
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 22/22] usb: usbip: fix a few spelling mistakes in comments
Date: Tue, 10 Nov 2026 06:41:05 +0000
Message-ID: <20261110064105.20335-23-shishunbo@cmss.chinamobile.com>
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
 drivers/usb/serial/ftdi_sio.h | 2 +-
 drivers/usb/usbip/stub.h      | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/serial/ftdi_sio.h b/drivers/usb/serial/ftdi_sio.h
index b053e038bda4..55ea61264f91 100644
--- a/drivers/usb/serial/ftdi_sio.h
+++ b/drivers/usb/serial/ftdi_sio.h
@@ -15,7 +15,7 @@
  * USB on the other.
  *
  * Thanx to FTDI (http://www.ftdichip.com) for so kindly providing details
- * of the protocol required to talk to the device and ongoing assistance
+ * of the protocol required to talk to the device and ongoing assistence
  * during development.
  *
  * Bill Ryder - bryder@sgi.com formerly of Silicon Graphics, Inc.- wrote the
diff --git a/drivers/usb/usbip/stub.h b/drivers/usb/usbip/stub.h
index d11270560c24..1fea0190de7f 100644
--- a/drivers/usb/usbip/stub.h
+++ b/drivers/usb/usbip/stub.h
@@ -29,7 +29,7 @@ struct stub_device {
 	 * It is allocated as stub_priv_cache and assigned to urb->context.
 	 *
 	 * stub_priv is always linked to any one of 3 lists;
-	 *	priv_init: linked to this until the comletion of a urb.
+	 *	priv_init: linked to this until the completion of a urb.
 	 *	priv_tx  : linked to this after the completion of a urb.
 	 *	priv_free: linked to this after the sending of the result.
 	 *
-- 
2.53.0



