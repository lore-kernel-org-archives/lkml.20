Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794387000;
	b=xEdJeZGRhdmZXADe3lNtqsBmwQDDOCKWAkzcYSFaRud4IBhuNS4gnvJnpIt+VxiZbwHW
	 KVkcZDGMcFZm9kPOe16x609Ao0BIAv3Z33Xk+ac/Kbu8cpx+qFdxb1cVyOBr4DgxSmHKd
	 m1Spv8FDGZWATQLut6/PhmMo/7wRApToAWO1n9bremR9fpLGSlVuTaZqtnN21WdAF2FjM
	 c2yKl9Zu7/soWsGKsLNUipmLlSqg8oz4Gj82D2B2vUFu1hEh9fs95Z02s/asolX1A3srd
	 fQgH51W92Yw/ZZSrPnjg92zJmlxbNJI9yGDnbgBf7WlG80h9xSxxORfCS2h+DL8cmWQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794387000;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:X-Developer-Signature:X-Developer-Key:
	 Content-Transfer-Encoding;
	bh=DAjH7rhz1z4KSbnwHBvTiPD/Y54KnFcA/42ynmyzXDs=;
	b=16ef+2znaBcZPatnfkNn2DvMWIO/kSahxl3Mw3Md0ycZ5+F1FTbPp1d13qOGLJklqeBW
	 jQLAfzhDbOWx2hBHTM+LpKioFQSkxw/sUq2chkNPxrwkfS21RUaZVss12c7GG3X1Z5p+B
	 ASbrWZ/Y0MzzhMoCuYI9pzwCVbyvvTbkyUWwNz2x8xhg0jsqdBA6TlvcG7PlntKNyS0l2
	 MTHjQggEEU31RE8sx8QTexvAP75HPuOXQE5pR+AyftGf/qylY48pYca1lNLBg2Z03MuzZ
	 NcStgngGfiaIxUcw9DH9JIhYjOZKWq1LAnuaMeHpQXvFmsdgmj11cSWUKI/VJ9Knjpg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=Ac74ySGz;
	arc=none smtp.remote-ip=209.85.128.54
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E311606A326
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 08:50:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4E311606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=Ac74ySGz
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4a2167bd087so28960115e9.3
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 00:50:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1794386999; x=1794991799; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=DAjH7rhz1z4KSbnwHBvTiPD/Y54KnFcA/42ynmyzXDs=;
        b=Ac74ySGzTuM7oZAsEKqXbSljmo4v9LokH0ouJ21uXc4TaMkF/aVmsqD4lZXsNIomRP
         v0tJZsdAOxUwjJ4Ja4dzAvyKZ1RlYEBM+MyjaPelxxhYFaKWl2J6clbL3oI7YibIjHfP
         p80pAdYD+9do2KzxrOZSaAIJptusfk2qH7QJ0xKQfpcg/9RBqs6lU3Uj37MbepQlRuw1
         YXfh6YOWnyMJjGmcyMRWY/WZfIjD6qprKEs7gW/0Au/VUJ1e3h2rsCki27ty2fH9Wi2Q
         VYlzYr/PyPbrM22uG0/n84sBWRcx4k9IfzhdvjNIff2LFkmZ8iOLxhVDVxhoDvBS+eEv
         tUWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794386999; x=1794991799;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DAjH7rhz1z4KSbnwHBvTiPD/Y54KnFcA/42ynmyzXDs=;
        b=bgchHKSq2+Xj+W3S1Z3eRpAYIxnanzdjQI7GznSyUxva3o/HeQNRX2hnHKD12rSTdC
         oKl6Rqhc96QaG2WZ1mUYM/TxBI27MD3EvcjW/i1x84oBAnKcUNtBJKVw5+0rVac1BqCV
         AajyqGJWk/NT1H6GZsIy6zpWMCNr7jfEvsgSXdrz8tfYTyL3AFomo6BUSsAOcLA3iQhu
         woh22AbcpOYsRiiFP342b2ZiXxlAgl95WKsJnMOwH4z/0A9Isl0fCz8AxBP8lcaitGUp
         /Fug9indEOUPpxcUhl/oahkQKZe3VKM8ToxlTzIYlOMOTPUqne8sZ/62C2vgSxoSxpJB
         yQWA==
X-Forwarded-Encrypted: i=1; AL+hErH+aaHv9D8yAMY3PI3dLVgiahL7b6qs5FIeF5AVgXAGHyCk+tlndU1RMCgnXUD8CghbLszCOrpYnpTyvgw=@vger.kernel.org
X-Gm-Message-State: APuU4Z8cwACgOGlfgv/UMjHjZP9jUBeTn4+yezYN2Ql4qf/z1KyutAgr
	AZ5Jcps2ArkE2H4Ix0jy2dOaLsyOMP4wN2WfXR5eUcZSlB43NFb2TXK67MItS+vae8M=
X-Gm-Gg: AYBFou2/Hn1gSZMQFo0Fj5mJ8YkKOl6gXU+zxVyHPUGDRdv8zVuDKf0OELxuS8Eb1gJ
	wHbxgcSQ1YAKG4EeevWeTeY8PuQHOgGcUjn70Q6WEcip49MtJEv4PIKLQL3Wit9z49UjdfyAFhu
	+h7qQ9+mtE/aZQxYezat9WbhCwxqm3wtOTwm6iOjq0KkSgpQW5ortZxYpcQCmG9mYfB2LFW/Ytd
	wY+bNwuJkgumJTW0qeVhf5gdVWqn1Kw12HhwG0WWq6huJ1RiPff6wrUVQPca/VQlt36+YWoElFI
	V+ixg6Mg2A1fzdqfz8NxiwTsFxzC3LQ2aqnnHvDxCXoknKFvyy+N+Nvv4sHmf2LsUieOsuSouDh
	jOW3HtUqZZnrfhSB1jaQ1MYAZP7awA3G0RYTP4+h39tGZkK03QX6jaWvIiAqigvUpPyEGI9u1FK
	MZxPs9CyC5m4HaXN53xgbN235VVX6GyrvCjLvWUpem36vDWHZn4Ezx6roeRMP2IZzmMvFvXb3Ny
	GLYM5G1N7Tgw+rhD47fFexh3NnBZTnRi1nRtFu+Rj5cFMHfett5Q8Jh/AeELrRsB/uqvLCEa+WP
	PddkmjmVYK5Nt2pxKMNR2WZtQxzJ8fTiPW4G/7jJ7ztPpaleWWbUbUuJSIiIQ4WjjAVQFKQZYVt
	7lhwBTL4TAzbB0Q==
X-Received: by 2002:a05:600c:8b31:b0:4a1:dadf:9876 with SMTP id 5b1f17b1804b1-4ba0938e3aamr26912035e9.23.1794386998742;
        Wed, 11 Nov 2026 00:49:58 -0800 (PST)
Received: from localhost (p200300f65f19a90460510dd506fc51af.dip0.t-ipconnect.de. [2003:f6:5f19:a904:6051:dd5:6fc:51af])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4ba020485bcsm116471585e9.11.2026.11.11.00.49.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 00:49:58 -0800 (PST)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>
To: Marcus Folkesson <marcus.folkesson@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>
Cc: David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	Luca Ceresoli <luca.ceresoli@bootlin.com>
Subject: [PATCH v3 1/2] drm/sitronix/st7571-i2c: Drop unused assignment of i2c_device_id driver data
Date: Wed, 11 Nov 2026 09:49:44 +0100
Message-ID:  <f83da708ef041941601961d0016c5313e97f110b.1794386771.git.u.kleine-koenig@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1012; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=fg2QklYtm/9gXlEzyJ8j9Z7yTECu6swZ3dSAWb+zMrI=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBq9CwtlavBHc3+gfrAfS+A5Z9uBMlkdiYKbks+G ss6woPjcgGJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCavQsLQAKCRCPgPtYfRL+ TrOdB/0eHbAOSDst1e5C3c/X85agF6KTSm6bDzf2JtV3R+CeVU3Zj/X4KJH6oRSoQCY43Ars6vL MBmbW5JvCnJKQqJurY6au0cFhtVJJWFMS1jHFDfLTaam+nsA7PJpu8f+6P9FXRRYG5isRPwYhxt RpklF64MRFVxr5/Mo/1JKjHdLf5MH767jHRZNs4P60pjYE/u/BYxKwyyd2gviKX3yZ4g5HSE1vO 8TWZhgBpNm9Nxwnp5svVP66uN8/5E9I4ZM0ffv4WtC/nPbSjBKoqG3c44Z8AwzGv5OzZdzdTzGr Aqq4f0D25zd7Lgd3HpYyGbMGKjQrg7dyx+QmzeLbOiw8z9UP
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

The driver explicitly set the .driver_data member of struct
i2c_device_id to zero without relying on that value. Drop this unused
assignment.

While touching this array use a named initializer for .name.

Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Signed-off-by: Uwe Kleine-König (The Capable Hub) <u.kleine-koenig@baylibre.com>
---
 drivers/gpu/drm/sitronix/st7571-i2c.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/sitronix/st7571-i2c.c b/drivers/gpu/drm/sitronix/st7571-i2c.c
index 44bc94be33d6..be6fbed8adaa 100644
--- a/drivers/gpu/drm/sitronix/st7571-i2c.c
+++ b/drivers/gpu/drm/sitronix/st7571-i2c.c
@@ -134,8 +134,8 @@ static const struct of_device_id st7571_of_match[] = {
 MODULE_DEVICE_TABLE(of, st7571_of_match);
 
 static const struct i2c_device_id st7571_id[] = {
-	{ "st7567", 0 },
-	{ "st7571", 0 },
+	{ .name = "st7567" },
+	{ .name = "st7571" },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, st7571_id);
-- 
2.56.0.rc1

