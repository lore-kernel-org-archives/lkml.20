Received: from mail-oa1-f69.google.com (mail-oa1-f69.google.com [209.85.160.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07925526AA4
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 11:38:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.69
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788953927; cv=none; b=YjvAiG+a0mpG7xzT+vRkx0Ulqpil8ouZjHdY0BUQBHCGQSFbDTIPXpXJSvdU5balGZIkog4nlAucf4Fpi2iI4OTI/3O86duig3H+Myf7Tz1rE/m5ztFt80J1oPOElgWwqyBfVL010ol5TMs4L8N9j0X6oe6EQIv+/QGr4vvhVko=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788953927; c=relaxed/simple;
	bh=Mhs810cizJKySl2mnFN2EMhZS8XcDJJuFGQZHuszD+0=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=gfUfdmM7CTp0P4FhUrvfvdksmvAP7miVoRyR50j5dQnvU9Eaxc2X2k0Y4t1zlZ7CJ19d1JO0U78BNVCh43mz2UEMbS340hVtiAXCv0MPnRnKrgpRzTL56//mu1/nWBJGwJ91njPETTu/9RmGNrHEKlLnRrHgTkkMIcddjMSLryA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.160.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oa1-f69.google.com with SMTP id 586e51a60fabf-45952ce9ee0so8251087fac.1
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 04:38:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788953925; x=1789558725;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=E8wZYV3Ikx8jqCP55tY3Hjb1bQaLE6QwiQrRHWceMT4=;
        b=TMi3NinHAKyOU3hRxVqV6ikcOH8Du26AOHBctWqsFHBWh3V8VqUVDhejD0YotPl3jW
         vAjAMxkMW3I8Y+Fnl5U5ozqxnNqRMdrF2qixkePgbLfUJWoeEprO4NMkMXAtxlN1jtjH
         NxpFr/r780CWB5A93BkcCEQsA/ocrvwwpGQi3RZTfnVG2pYdWKunYXE8xhlHFDfPouoS
         pqbPWLAbiEBPgVIPNlXpfDnlgeCn+Agg6xni6clZwrW6wg/Vxlkns5AMNBuQUdNOOkpF
         R2N0JPf4wUej58USkd4PN5HdibRDoLVU87HoOQD3mW1X43ewISQzEviluAtFsUjQYqyp
         +wRQ==
X-Gm-Message-State: AFuF++l0m39dvO4QZy8IdFBcvgHyh8IDxh8MTruvlksyqppk+WTcDfcx
	WzMJWWql8Qm/inMlBR/qA1Y8m0X0rQqFhEW89JWN2nU2laOgfVVOKRkr+btDE/Rq5MwXV0MhdUN
	/7a4OPoPrPTgFeMDHRHFp45XRHHFB5INU69A9TAsXHCrl86K/DYvL+D7LEJU=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:807:b0:6b7:46fc:1d2 with SMTP id
 006d021491bc7-6b746fc02e5mr19466380eaf.49.1788953924896; Wed, 09 Sep 2026
 04:38:44 -0700 (PDT)
Date: Wed, 09 Sep 2026 04:38:44 -0700
In-Reply-To: <6a73d173.5aeeccc9.207e63.000a.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6aa14544.f614420e.2bf292.0016.GAE@google.com>
Subject: Forwarded: [PATCH] test
From: syzbot <syzbot+2a3de29133b40e8f69f3@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

For archival purposes, forwarding an incoming command email to
linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com.

***

Subject: [PATCH] test
Author: adrianox@gmail.com

#syz test
---
 drivers/media/usb/as102/as102_drv.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/media/usb/as102/as102_drv.c b/drivers/media/usb/as102/as102_drv.c
index 6b1d3528a0a7..a6dd675689f5 100644
--- a/drivers/media/usb/as102/as102_drv.c
+++ b/drivers/media/usb/as102/as102_drv.c
@@ -287,6 +287,12 @@ int as102_dvb_register(struct as102_dev_t *as102_dev)
 	struct device *dev = &as102_dev->bus_adap.usb_dev->dev;
 	int ret;
 
+	/* init bus mutex for token locking */
+	mutex_init(&as102_dev->bus_adap.lock);
+
+	/* init start / stop stream mutex */
+	mutex_init(&as102_dev->sem);
+
 	ret = dvb_register_adapter(&as102_dev->dvb_adap,
 			   as102_dev->name, THIS_MODULE,
 			   dev, adapter_nr);
@@ -341,12 +347,6 @@ int as102_dvb_register(struct as102_dev_t *as102_dev)
 		goto efereg;
 	}
 
-	/* init bus mutex for token locking */
-	mutex_init(&as102_dev->bus_adap.lock);
-
-	/* init start / stop stream mutex */
-	mutex_init(&as102_dev->sem);
-
 	/*
 	 * try to load as102 firmware. If firmware upload failed, we'll be
 	 * able to upload it later.
-- 
2.51.0

