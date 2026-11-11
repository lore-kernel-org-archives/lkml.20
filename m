Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794387003;
	b=ljzzAbHfwEtYs2Kf0dIY3IrBHqH/0nlalxB2540EqkP+iLMFu/E6RCkwd5B8gRLKm2j8
	 GpgL9++ixEaOvjXnuSAidtuRyNbn94TDhk1oTRG0n1MyEjarXQ8JLVCwnVTfhbdOHXWgH
	 fwrOwaOVk9F9gzmTXAHMF5xjeudw+TMg0oi2pVRKy5ntzkgkoWzY3ocFSNlPKP5hCxaQ8
	 VHVqWCwv+c6ivnFEXCyaLMFhsyTht7807124urc+MyLTcq5hJNqUPDt7ASj0/TwLNrZre
	 PDCi3St239T6zhClnul4NS0oBu5T4tXJs8EvI5rqSkWFY0KtgSci74fs4WCbUZmKYLQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794387003;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:X-Developer-Signature:X-Developer-Key:
	 Content-Transfer-Encoding;
	bh=Mcw8tiKH/WX7VEn2tZaWKJlFFwouAMdTGd/w0+U3Fi0=;
	b=Ri3uTkX533QkcYyViiRFVjcJbeNWnSYcc0m6gJI1VKjfsHCzs/0i+51vGY45IcigOPrP
	 Bl9w+IrPua8AW1d68A6RMBbYcn5soGsNOJ5vd5K+zDPGG2xZxBXOgD0f2SSicY/jCUQ0D
	 WCtz9nQpHo0Pu5xFPw+vQsPueGdRGqz5cfYOlelrZ6tKqI1KtXpmpC+n1/0IaeYrKX5RX
	 Md0BcXBZhzsGtndlN2N03Y+VdWiitoMOGOMt2cOTYgGn5eJuVK7+EiakH5K/DwdHMJhUU
	 /uh0oXA2nozzrk0a6r+Fjs2C1wumHvw2rtAq2Vqxj09Gxo/aI6oQ7uNtrNuIr3nQXcw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=gf8nWC3q;
	arc=none smtp.remote-ip=209.85.128.45
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98E6560A2605
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 08:50:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 98E6560A2605
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=gf8nWC3q
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4a59100fa83so25451525e9.0
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 00:50:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1794387001; x=1794991801; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Mcw8tiKH/WX7VEn2tZaWKJlFFwouAMdTGd/w0+U3Fi0=;
        b=gf8nWC3qrBissTaP6xZ0VLzOaIClm/jbI1xkcTvZaqZpawM+w33S/Jc7EA0EUDXwkO
         o1Zl30LQpHv0bBPMPh3JeZgllZT002/ks0v1ggwjyJ8yuaQPXI/GvuhZJXA70J+Js5AN
         UNXEUZak44qbSnejm8n0yLjp3827ttzJPiP8E8TwTvV2JVVRRJ0P2rfLYkDxMJdYrtyO
         UXKG0s4kcWcozk2qsl/oIMbts9vRWnpbvistdxhEOBIoKfu1uWKpteotQxwEtLJ0SwIb
         6ekIbjuUxSozrU0tAVePC9ztzewOqlueB8IYp0y9T5Uhqi9VGJfCu5K/AyQ/9mWMmzon
         tgHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794387001; x=1794991801;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Mcw8tiKH/WX7VEn2tZaWKJlFFwouAMdTGd/w0+U3Fi0=;
        b=SA09c4RdMQazgmNvvpKAjNsijjN1ogfNTXUrTpol4xWDCGqyO2t75yrUrELUwDu912
         Lgo2WQtfBQmqX8LqXXyfzim2CNwyJTUn8Ed8DeBT+ZdPyrPVcpHyArTDqcAc3KrA9Rd6
         8pxpAC3t9Ny3Icqc0cw6poy83AAjXJLpGw507xG+UCuCgv9TbZ5o2u3jaDH7CpkHQKF8
         vnQikk6WyaLA+c5m3oN0yyLZXKKVTWPFl4XRbzlngr23d4Gt56BiwtJFyQol+VyReiRA
         7P7+Mer7Rmx79ER80YCHho8mQevwieeNENqyWH1xvgHZK3088ke7FGNb21OKMYl2vp7o
         7JsQ==
X-Forwarded-Encrypted: i=1; AL+hErGLKRwd3Pg0V6GhXpMbgPM78G1AaXcFaWOFT5XUhdrBJ3wfIGC3sX57XaqIJEzKT6OHtagWB1mAbzQIjko=@vger.kernel.org
X-Gm-Message-State: APuU4Z956eOgVjXFR029DO6kvbv0iHWb+6iFtOQM6yIsWTRdGwQW6eBB
	nSusmh9UnaCxOkBs6mCd7NRzcvxhVGQegTcQUFlsIMUVjzH+GQkXr9NkHhEXzGkG9mA=
X-Gm-Gg: AYBFou2QGKy+4hMn3ereYrK9p4SllM87LoawTBuOQv895F447DdvezUozIclkZi8+r9
	qd7jG5tgW6l98gQ2Gt6uhaWKxeVS2zyEDLqXTD9GvllBcWHSzQmF/1CTEvlYItvEgR9aEW4PCw8
	mHAkImbPQ6+Bap1jEqeJMysfD/+JHuWfH9asuPFPt/NRUBOMLxWIoma0u8m+bzoUWi5jTD+7hcC
	u6CAzw2I+k3SDtoEb17NDg292tsQuQzZkB73YLS42sZppWjhmV9lQmjkGUKzjK6jqBJxm8Bg/58
	i2XKbwOkByhLKS4Ej6tWvW8crotiKt6lqURECcKgvxZHvOVdWIguU5uq452bnpRwCvVCKEHr+z/
	GQW5ZL/mLccPyvOiNbGcBJYeLfo3mmLuAW5Yi84YVAsNV/1atYK3TjON0o96sLjyT3UKO9AjVjI
	Wy4rM3ELix3RGJM7Jl8Ss5GpvIEJ8zZLfBDod4WhTVOpyFXOJ9x2JcUSWhLh2/HX/CR0LVAPJu1
	3QJiPP1JPs+x+cXpgteBWHXpeUZ3a1yrefrAzUyAYes/koadpipuyB5whXKD8ySOAG6ZaeJAS9P
	6wUX67aDYfV2e4azufzWtFviUn+EbS0gIVpuvzne7VFofISyFFYzPjUmg+gNMqrTYa7D7dmhc6u
	tv+5PxMCSspLvig==
X-Received: by 2002:a05:600c:1d28:b0:4a1:e6c8:ff74 with SMTP id 5b1f17b1804b1-4ba0939db75mr30427005e9.29.1794387001054;
        Wed, 11 Nov 2026 00:50:01 -0800 (PST)
Received: from localhost (p200300f65f19a90460510dd506fc51af.dip0.t-ipconnect.de. [2003:f6:5f19:a904:6051:dd5:6fc:51af])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4ba01ff3428sm142236795e9.15.2026.11.11.00.49.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 00:50:00 -0800 (PST)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>
To: Lyude Paul <lyude@redhat.com>,
	Danilo Krummrich <dakr@kernel.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	dri-devel@lists.freedesktop.org,
	nouveau@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 2/2] drm/nouveau: Use named initializers for i2c_device_id arrays
Date: Wed, 11 Nov 2026 09:49:45 +0100
Message-ID:  <3dd75434da3c0e4b5ade3b802b4ab00a404e8bba.1794386771.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.56.0.rc1
In-Reply-To: <cover.1794386771.git.u.kleine-koenig@baylibre.com>
References: <cover.1794386771.git.u.kleine-koenig@baylibre.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1714; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=L8VndumebZ2MRoqro0RnaUijRD3vijSdtnwN+w0pZyc=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBq9Cwv5LPQnzIxzz7hUpMPuIVPQccUHI3t5AUhf LUDPxo2ybGJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCavQsLwAKCRCPgPtYfRL+ Tkl9B/4tAll/ivGhonm0x9hqXABDz27C1LzXwKQ99PbJYQrZBYY+O5PpHY1m1fFVrWzFGedo6Yk vDO7Up0laCDvG4i2E38rwthFyFcoYsodI0MyYiHrxekWaiOO3klqdFkhUdwZq5f2MDuibrXoIf8 AeP0wNKhbojgXXe3ZP9MB6HugJr+1doDFSrs1wRPHewnh6pZoyww2mhXKwWyTXgv43vvRj8rEHz cWyarlxT7ZQT8MaLjkYzS/F68BnIcYoUaKiTJazI1g6s4G3su8PDhFAP5h4tndnxvLJ/OjOmYhZ kH+cA4S+D7FFwqJTuWKVmNQChQwkbcuI86iBs5x5T8BIyn2Z
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

Named initializers are better readable and more robust to changes of the
struct definition. This robustness is relevant for a planned change to
struct platform_device_id replacing .driver_data by an anonymous union.
(Though these drivers don't use .driver_data, so this patch isn't
strictly needed, but still good for consistency.)

Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Acked-by: Danilo Krummrich <dakr@kernel.org>
Signed-off-by: Uwe Kleine-König (The Capable Hub) <u.kleine-koenig@baylibre.com>
---
 drivers/gpu/drm/nouveau/dispnv04/i2c/ch7006_drv.c | 2 +-
 drivers/gpu/drm/nouveau/dispnv04/i2c/sil164_drv.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/dispnv04/i2c/ch7006_drv.c b/drivers/gpu/drm/nouveau/dispnv04/i2c/ch7006_drv.c
index 976ed59a86e4..96dabdb38c4b 100644
--- a/drivers/gpu/drm/nouveau/dispnv04/i2c/ch7006_drv.c
+++ b/drivers/gpu/drm/nouveau/dispnv04/i2c/ch7006_drv.c
@@ -486,7 +486,7 @@ static int ch7006_encoder_init(struct i2c_client *client,
 }
 
 static const struct i2c_device_id ch7006_ids[] = {
-	{ "ch7006" },
+	{ .name = "ch7006" },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, ch7006_ids);
diff --git a/drivers/gpu/drm/nouveau/dispnv04/i2c/sil164_drv.c b/drivers/gpu/drm/nouveau/dispnv04/i2c/sil164_drv.c
index 7f402b901977..2324507eb5f3 100644
--- a/drivers/gpu/drm/nouveau/dispnv04/i2c/sil164_drv.c
+++ b/drivers/gpu/drm/nouveau/dispnv04/i2c/sil164_drv.c
@@ -414,7 +414,7 @@ sil164_encoder_init(struct i2c_client *client,
 }
 
 static const struct i2c_device_id sil164_ids[] = {
-	{ "sil164" },
+	{ .name = "sil164" },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, sil164_ids);
-- 
2.56.0.rc1

