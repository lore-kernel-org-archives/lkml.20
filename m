Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793770089;
	b=n0IWgbuu7rzwZJivXcGUAwo6mQVtsz9CcIfa8rV+R05B6dxnKFEuvwReqf1BuSqrtFub
	 Ev0wJwv/C8+VZAMtG0h1KL2wWNb2UIm5IlrHd18pBZ5LA97PvQ3e8IgGnPfRzFVWfCK1F
	 YHt2utMiL5SwfTJtgxTyCEiIBG1rAn/XBZp6WLPYr/TDePdsqnqKTpF2lpE0+wjvKTJl8
	 13FIAwa6waHcGGuPWJ4nZ8YBBbcXN0aoQPl176EhlJ8b/i3elx5kcFcOgb4cNmbKQbD8u
	 dwz9VtLlqhIaflNE5BFCZTuJ2cpKbRyriXMjgh0rhYi+M3AI4gZKU+U4wZ34t2bVEIg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793770089;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=irQAokomBOrEvq1E25b1/yaWaEKJedcNM9avak0rsxM=;
	b=jstwFn+7Ta+vU4H/A+z04y1KpshVNYArkCfBZt/3dXrTtYRPJb9un9fHdSnC/jYyXF7Z
	 BxdwiaIxKim95NM4DVw+CigLqzd0qcFRCqgl/M3LxTv80cqbxpnpiufEZJ1SSK0yCKJ3E
	 kf7Xj9K21+AQEd+vxE4A6By0odNpqG3LUF8WiOMyojED/LH9sE3kdgOnfaJlz/Gq/+cer
	 Tqyj48KBOMwyZ/ykXwbXgj3ANfHaDT54HoMd8b9LiR7Lgb6xY6O2GR4Su8aFmLhw08hkc
	 2Lob7J/3aKsMjf1CwRO9w8eF6heBuhoCBO/Q0aAXoOfF3HfiTjVPAN+VfmFblnIIJlg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=oAnu04eU;
	arc=none smtp.remote-ip=209.85.221.53
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70123606A326
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 05:28:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 70123606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=oAnu04eU
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-48fbe12cfdcso135845f8f.2
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 21:28:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793770087; x=1794374887; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=irQAokomBOrEvq1E25b1/yaWaEKJedcNM9avak0rsxM=;
        b=oAnu04eU+s3LGkUx1jwkqz7Twro5AjH5asleqtuon57Etq/k0ktcWSor0iWMB0/l3m
         fJ9E75NjnOf3htVo3Mixg2r95tpRcUZ5aPiupyVY7H+nuJbKLr3nB/AZ/LcopLRhFPTk
         l4/oooMuHStQY89DRz/4dC3LlbRlJPq9rY9ijo4IpoVZaKejlzAD6U7ZtMgLUYlakxe3
         JkFzpM+ndtOyjIsFDAWfOKQwsMqXL6lKHnRkqr/MeoRMW9UfqANYsTNdFdQBR2k7Ex6A
         VJ2jwbWIaT46VKs4uL6gotYb4fngQ1RtXzxNxYKkb97QymYrMszkXGOYcYCrIZdchKaN
         Wypg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793770087; x=1794374887;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=irQAokomBOrEvq1E25b1/yaWaEKJedcNM9avak0rsxM=;
        b=xhfHSDy1BGo01Z+kmqM2o/sKcJheTXV37X/06oJO2tF4gCfiIo504XlGKTSmX2rL8c
         szFS0FBpsRhB5e/DGBbcApRw54aqt4B0XYQ1P3u5DdceB2F0Cgs+Sf/KeY3pQlFRFvyK
         mmYRoUdfRCRGzdSMdyYMuEI3HL84IherPm5cCEcANkyNoteUVT2VrHT9GYfLjaAL/Xij
         zsa9E7d+z4+aZ1AaWkMnzWNkSKzCle7hFMf4Fi3tfoI8NrepBGCtE8/5GR31p1M5prdx
         XF4Oh7KrNaiLhvQHLgwZcQAQBZ46nVdklMl83VTOqa5oPKlIFKHrkw1WhGJlZQYXh7m5
         yAAw==
X-Forwarded-Encrypted: i=1; AKwUvBxqd3pw+E03lHbd+BnzdCJOqeOIUcUIfCTY01FypAKqnA1ZrJbedEAvrBIxOV2s6oE/Pbll6iiL3HlDVG4=@vger.kernel.org
X-Gm-Message-State: APuU4Z/uWkCRfhWyT/A5WwwdbuNCvJxUJ83/VWpY39J9GcNx1iPhdwDq
	2DVJ1ZsG4gKvRiEGoixWChwf6dSCUESpuPin77gVLoMxx9JmFh0FWV07
X-Gm-Gg: AYBFou0Qa2iw/zFO1TyGGI5auYxNjqBWqAQbgqrzjVDW5NIGMAt+sNTUsb3KLdn1HME
	dHE2VZihsfd4qGgmP4H1dL/79JRIwtAKMYcx4Xr15nmHALVoIRmgxeJBzzgIvcT3Dn7by+w//Vh
	BzjVkDRsOEnH+azvROzoHiG2ULdWBQRkho2Jd9WoE4MKTUNptsJo+hxNIBo3rPvSzd6fjA49vSa
	nhdxazXCwB6wRno4PbnnlRXCelQacyjXGtHBbJAf4s4V6Xk6Z2s4c8p7ggXwfsKZYtAHHoDLlmS
	1V7TbB4uIcSxpo3PwJPabLwWvALqhjwtbCvaNYwB8xIe/2W6ZAZjOcdgkJaiV1I+cmWO8KLqDGj
	W5h+XKOIR/W4xZ0dAFrjW1nvR9W1LtvqYJ/0zs26RSj4ZlCfOSxJUqblcru+uRhEXGUgwqed2j5
	+R/PuKjeZLb/NDqO1kjjBoQrt6kZUfPSaRtO6sNXeFlK0CMVHLNWIR4BZ+5QALBHpERDFtqbzKO
	yzRLaJgU3PnStEJ60RKrrfYM6qHycR2p5lQmGNyKA+X726yU+hkx54S4XNkicjVlId4euquSoPc
	LThe3WQZk6Hms7HGTKVll6Oimscmo0YKgWXO9TDP76wQADUFREafBe36LSjkNnWZn/30IV9ixnZ
	T/8GgwQ==
X-Received: by 2002:a05:6000:4301:b0:48d:ff0d:cfa5 with SMTP id ffacd0b85a97d-48e6e50049emr34787634f8f.47.1793770087179;
        Tue, 03 Nov 2026 21:28:07 -0800 (PST)
Received: from recorder.play.pl ([2a02:a31a:a1b6:b080:1f0e:f037:ff95:4265])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48fed92a753sm1917062f8f.45.2026.11.03.21.28.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 21:28:06 -0800 (PST)
From: Greg Sikorski <sikorski.grzegorz@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org
Cc: Hans Verkuil <hverkuil+cisco@kernel.org>,
	"Jiangong . Han" <jiangong.han@windriver.com>,
	linux-kernel@vger.kernel.org,
	Greg Sikorski <sikorski.grzegorz@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH] media: em28xx: fix NULL pointer dereference on disconnect of dual-TS devices
Date: Wed,  4 Nov 2026 06:28:00 +0100
Message-ID: <20261104052800.44551-1-sikorski.grzegorz@gmail.com>
X-Mailer: git-send-email 2.53.0
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

Commit 826915b6b65e ("media: em28xx: fix use-after-free of
dev_next->devlist on disconnect") made em28xx_close_extension() unlink
dev->dev_next->devlist from em28xx_devlist. On a regular dual-TS board
(e.g. Hauppauge WinTV-dualHD, 2040:8265) the secondary device is never
added to that list: em28xx_duplicate_dev() kmemdup()s the primary device
during probe, before request_modules() -> em28xx_init_extension() links
the primary one, so dev_next->devlist is { NULL, NULL }. With
CONFIG_LIST_HARDENED the inlined list_del() validity check dereferences
the NULL prev pointer and every disconnect oopses in usb_hub_wq with
em28xx_devlist_mutex held; the device never re-enumerates and the USB hub
thread stays stuck until reboot:

  BUG: kernel NULL pointer dereference, address: 0000000000000000
  Workqueue: usb_hub_wq hub_event
  RIP: 0010:em28xx_close_extension+0x80/0x130 [em28xx]
  Call Trace:
   em28xx_usb_disconnect.cold+0x87/0xed [em28xx]
   usb_unbind_interface+0x9b/0x2c0
   ...
   usb_disconnect+0xe7/0x300
   hub_port_connect+0x7f/0x930

Initialise the list head in em28xx_init_dev(), which runs for both
devices (for the secondary one after the kmemdup()), and unlink both
entries with list_del_init(). That is correct whether or not dev_next was
ever linked, so the use-after-free fixed by 826915b6b65e stays fixed.

Fixes: 826915b6b65e ("media: em28xx: fix use-after-free of dev_next->devlist on disconnect")
Cc: stable@vger.kernel.org

Signed-off-by: Greg Sikorski <sikorski.grzegorz@gmail.com>
---
 drivers/media/usb/em28xx/em28xx-cards.c | 1 +
 drivers/media/usb/em28xx/em28xx-core.c  | 4 ++--
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/media/usb/em28xx/em28xx-cards.c b/drivers/media/usb/em28xx/em28xx-cards.c
index 8440eafad..4d2ea2e27 100644
--- a/drivers/media/usb/em28xx/em28xx-cards.c
+++ b/drivers/media/usb/em28xx/em28xx-cards.c
@@ -3845,6 +3845,7 @@ static int em28xx_init_dev(struct em28xx *dev, struct usb_device *udev,
 	const char *chip_name = NULL;
 
 	dev->intf = intf;
+	INIT_LIST_HEAD(&dev->devlist);
 	mutex_init(&dev->ctrl_urb_lock);
 	spin_lock_init(&dev->slock);
 
diff --git a/drivers/media/usb/em28xx/em28xx-core.c b/drivers/media/usb/em28xx/em28xx-core.c
index 62a1c25a2..ab1e1e18b 100644
--- a/drivers/media/usb/em28xx/em28xx-core.c
+++ b/drivers/media/usb/em28xx/em28xx-core.c
@@ -1263,8 +1263,8 @@ void em28xx_close_extension(struct em28xx *dev)
 		}
 	}
 	if (dev->dev_next)
-		list_del(&dev->dev_next->devlist);
-	list_del(&dev->devlist);
+		list_del_init(&dev->dev_next->devlist);
+	list_del_init(&dev->devlist);
 	mutex_unlock(&em28xx_devlist_mutex);
 }
 
-- 
2.53.0

