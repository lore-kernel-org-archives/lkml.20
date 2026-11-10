Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=159.69.126.157
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794313541;
	b=GViurdNefIl8QgCLTA65JJLyPuUYByX1oLI+zuT/N7tQCewxaHRtYnCo1m6Mu7IHYl2l
	 vcRIdhjCWDLOmacE/B9MlMOOaHUUOIgZy1ln276QzfVNt1VhGwhgjihYL3Cm837+Syfbv
	 1TL6HCqqP/w9PEdnPY0/2Z25NbvNmbZZaFPYKhqXZ7j0oxz5NA3BSXUMltdbPToHh0kgk
	 CdJJfVyLwDTDziSpXdVgk6gBA0F3WGLVcddHR8RgvHxwJYMKnXpOnIE47KMZjjNn1rFvF
	 rx/q5FLWmpMDHWXJM4OlMMiHmwCMuOeCjWpqIZEzd7zK1mcCsI1dGKCmHJAlb22YTWQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794313541;
	h=DMARC-Filter:DKIM-Signature:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=zZXxM4HEyoaJX4T3a3caTpShXA4lo/iWwvyoGfJLbaY=;
	b=BzxUJCDHUhrSBeg9X6vifWBhVTfTTdPriFJtZ9eYLUB2hGnczOB0KabrGp7jLYfMYlw9
	 T8IIvfzS3KfrdJjL7U8q/QhGw7+FbBMnlsB/xX4phzwdsLJuV/OeZdYmOqzsbtW9NVzMj
	 Q6kg02TfiwgyOk3HG0aKahBqVnjxODE5XFMhJNvUmwcyzyarXHoPYm4CnTCudtRbVCQzw
	 V/adEZK2GbPtHMqpNJzXqllQJr3qLgZT0YjNsKOSW1ntkAtLIkyIivDwdxW5bsq5666FD
	 BRGfyA9tgUuWvlfREcxSn3d5LOIGabSJ9+kVExoDb3CiIUiq3g97q2ZWG6Rp+pbXohQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=weissschuh.net;
	spf=pass smtp.mailfrom=weissschuh.net;
	dkim=pass header.d=weissschuh.net header.i=@weissschuh.net header.a=rsa-sha256 header.s=mail header.b=Q4lY9wEt;
	arc=none smtp.remote-ip=159.69.126.157
Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 788AA606A325
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 12:25:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 788AA606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=weissschuh.net header.i=@weissschuh.net header.a=rsa-sha256 header.s=mail header.b=Q4lY9wEt
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1794313531;
	bh=ipM5fTfNI0Rmu8+MMBSJkTcic1CBXOK8H8okZwMxFBQ=;
	h=From:Date:Subject:To:Cc:From;
	b=Q4lY9wEtJY1vjDBi2B8lKmNQpRYIrOCWh5fLL4dsaww6Mx6o7EVCE/65RwBNzyj3w
	 tmI1cmyg9cATwb4wqwpsqga1jjQwIbnp1vt/ddI5cPzaS2GCD0NR1PdSsSsZCF+yzT
	 ccvk03IZbkJY4Zgmxz0A8ivn63HNPhyE26M0ydeM=
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Date: Tue, 10 Nov 2026 12:25:20 +0000
Subject: [PATCH] alarmtimer: Initialize the device wakeup after the RTC
 device was chosen
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20261110-alarmtimer-wakeup-v1-1-af4269645dec@weissschuh.net>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMQQ6CMBBG4auQWduEVgqJVzEuhvKLI4JkWtSEc
 HerLL/FeytFqCDSqVhJ8ZIozynDHgoKN556GOmyyZWuttaWhh+sY5IRat48YJmN99UxMGrfuEC
 5mxVX+fyf58vuuLR3hPQb0bZ9ATZuISl1AAAA
X-Change-ID: 20261110-alarmtimer-wakeup-5543cae6572c
To: John Stultz <jstultz@google.com>, Thomas Gleixner <tglx@kernel.org>, 
 Stephen Boyd <sboyd@kernel.org>, Miroslav Lichvar <mlichvar@redhat.com>
Cc: linux-kernel@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794313524; l=1246;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=ipM5fTfNI0Rmu8+MMBSJkTcic1CBXOK8H8okZwMxFBQ=;
 b=6qpcNBRkeufNTVfSv/Yr1uOyWgo0oOL9mPsgof8wH8i0HEFIsfKQIpP9z2ccpUsYWMfbGzwRE
 ZAv4FAHnyJpC4Y95bDb7I9ou+AFncpoif8FFBTp4JSTcqsoNcpZvuzu
X-Developer-Key: i=linux@weissschuh.net; a=ed25519;
 pk=KcycQgFPX2wGR5azS7RhpBqedglOZVgRPfdFSPB1LNw=

Currently device_init_wakeup() is called before try_module_get().
If try_module_get() fails the wakeup enablement has been pointless.

Only call device_init_wakeup() after the device has been chosen as RTC
device definitively.

Suggested-by: Thomas Gleixner <tglx@kernel.org>
Link: https://lore.kernel.org/lkml/878q31vl8g.ffs@fw13/
Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
---
 kernel/time/alarmtimer.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/kernel/time/alarmtimer.c b/kernel/time/alarmtimer.c
index ecf8c89f7eaf..da6b3024406c 100644
--- a/kernel/time/alarmtimer.c
+++ b/kernel/time/alarmtimer.c
@@ -91,13 +91,12 @@ static int alarmtimer_rtc_add_device(struct device *dev)
 	if (IS_ERR(pdev))
 		return PTR_ERR(pdev);
 
-	device_init_wakeup(&pdev->dev, true);
-
 	if (!try_module_get(rtc->owner)) {
 		platform_device_unregister(pdev);
 		return -1;
 	}
 
+	device_init_wakeup(&pdev->dev, true);
 	WRITE_ONCE(rtcdev, rtc);
 	/* Hold a reference so it doesn't go away */
 	get_device(dev);

---
base-commit: 0359ecff58853a491dd0f09792fea8e87235ae06
change-id: 20261110-alarmtimer-wakeup-5543cae6572c

Best regards,
--  
Thomas Weißschuh <linux@weissschuh.net>

