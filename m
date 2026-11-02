Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793615905;
	b=hi/AM4UJmcJgzFHfpIWQPu3s7Ruzccdf6bMOJtS5BdhG2GrH7NjBjWwI7SZRRFpJmBPk
	 +GKFD0oeFjjkLPleNyhBbABosc4rbVAroMb9pe5y5R8/8NNG6q6sGXV7hK1Zhl6zGpTGy
	 McCeXq85kloTrG6tfJ3f4W857Ynf0dINSwLtkQzMD5kZpKI6yaXdzpLVSGmpyiavNRUEg
	 z07VZX56A7DrATIMWu5MMAejFlh1FgLG4RLFQ66HVK6sGpuQuEPzK4Qyz+LIf62RnGJ16
	 iMvxoSVp3G3mqxUm6Un68cXIYaK66vbctz5zvwqWGO7+LSlyjUYSnWTcMSqGEdHCm/Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793615905;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer;
	bh=nIaLyIlOqzSWlOX7liBCjVqH7iW6BW00x93u2nQ8ElU=;
	b=VoHkUIkTCkPMYvAlzdHSgNr6WjAhEKXgzYW5jk69ctjUzucRvIuEgnZwh54nWnrlb2z6
	 kNiGllyA0XrxiMSiampe5Rff5UUeeqSmuHaaWAqn2lVtImkbR/5TSfK7SJm6hX73TyTEX
	 KI2lF3lsnWh1xA5D3yaGV1RUFv28OPctbd9L4nJ+NKbnKJ7Bns6Ap8wymEwYgi9sDV9nX
	 6d+jr9bfm2CK4xzFkigjtKGxVER79iMvnh9/4z2dbwc5/9eeSDJ7BHZ1GbpRMQ/RjqQdy
	 AxyJQ9K2cuACK2kMewIo80AND076NzobjOpBhA4TfCfVMlYNCph3IzMbanV8zkiJbGg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=szB0Yr4R;
	arc=none smtp.remote-ip=209.85.128.48
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F552606A326
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 10:38:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5F552606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=szB0Yr4R
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4a2167bd087so23098225e9.3
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 02:38:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793615904; x=1794220704; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=nIaLyIlOqzSWlOX7liBCjVqH7iW6BW00x93u2nQ8ElU=;
        b=szB0Yr4RS7GVzNm6ov4UD6fvIgW8zvUVaq9qtRt3+5RK26LjawimA6ac29kSy8p1nX
         8FrJFAATcbLiy93Z1mVUiu2uO41XtaUvDYLymoD9AN5Q+KXplAKKmdqe5aX+CLJRhp0h
         cJNRIo9Uzm5NfYd4mcObcIpwospHuNEcPjFOwZmmYQ9YjMYm0qt2LgTACfSw0EgXtjms
         OcTWMQcdw88yrKaMksxQTy+1fAYTBbcMOHLc3rRcW1QSIWQVYitUOTzGASe8Qe4g/Dju
         Hmy0GD17gItr/i7g4OOrBfyeLoL6b+v+CcapjLYR7Oav62C/HX2YUXjObP4e3ljfJdwR
         YA9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793615904; x=1794220704;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=nIaLyIlOqzSWlOX7liBCjVqH7iW6BW00x93u2nQ8ElU=;
        b=X4FpHEoijqESOtndnNVBerPxUhkUjOHYt5atkqlVxfIw4qy4hslAZBefMYlyQ/MzCh
         GrqoN+qU+eJwXkW9tbDaJMEYOnviu7c+/BjaEGlxeL+yiMN3oog1aWLLJcXEUSiPgcvs
         13wPo/OYmgbu5Y2eBQDEYSKL+MbUYYCRLMoZn9thvzaACkfbyfvcBiXjW0Xl4PhRwYyJ
         Rtz8nuLh9URXteVavcU0YlBluuLr1NUTfgP0B06i6j8vTTIrbvh4hI+J2ay5Cjh2YL5c
         tHoLbzzJQSzVHLjKK6ic32TbEaL3l/4JPskamPgL7kWYj+DlYcXjiGAg14dNfNiYZy9g
         KTjQ==
X-Forwarded-Encrypted: i=1; AKwUvBwdt67thvQLHmGuzxxuNUOkceGG7vVggAGlF++KL7iIf5fG1dzCIyA875v5GhaOHzec5huXYy3e8Ecv0Q4=@vger.kernel.org
X-Gm-Message-State: AFq9FYLynxijVQfQQfnSXh+45jAGVucdouKaO/S+xBaI0/JptR2aP0+T
	nhUYUGSxNRWN8YnZ9GYa1ctYlc3vBzPB+VJaJh9VaPYLNW3mbpp1qiHsl1/tsDG/1L4=
X-Gm-Gg: AYBFou2O9exap9mq/6gCIXnilCR6tAca+zciC1kLOIjYReVUlKlAaW8IQv+zv1Zz315
	s48WmNNe5hdKYLsXhMnedOGBeDsZySnu1ZnGdOHY9Hz+oSjzcPz60fRuYBrXi7biSImdTnVH4+0
	8Whz2xizU6MYjSi5n/ltIZX8ZFsbQW561yLZViH06k8eir6ylXPDUnjxwNmJfr0/+FoUb1SQyV+
	sLXJ4qB6ctKsJTcL3wEO4EmiOKJaan/0k2dc5rQocfFYtE0deofMDS5yoEU23r3mAQZId240p9Z
	06jMousxlk+YSFxYH6b6kURzLy4NOPS5jL1m+mWaodc3u2vxmcVhn2mu1LU7Wl6hgISr0rG03hO
	5lxEs7S6s4+9E1MX86ILQd9cNNldzLJ3KmFiISEYjr5fVXJeJTT+08NiZvqscxs8RGICIa8X08v
	TzMQsC0mnLun6UPHaSfLGF9qFg2d2U43rtuajJgI3+qyfvBst63xmlabTJjIwxtLI376VKdOC6Q
	/80yG1GpZNvHRjWAHwJC9tKtxS0TJlftIsUHOt0nv7QvuTNRDQXOSbBYSpxcsWN4RJQosGcTQa4
	nfk3x8QU4ZCjJ4o7geATcgB5siqT+ip547NjqUzaY+QY0fHKVP6Kr8rotJHZUyoH7u60mLvJgNj
	M1YYqSc8LC6SxDYGzqbMTFSpU4Pik7mTY9jlerMl82w0t6pPE9BQ=
X-Received: by 2002:a05:600d:e:b0:4ad:181a:4350 with SMTP id 5b1f17b1804b1-4ad181a44a0mr139552635e9.21.1793615903562;
        Mon, 02 Nov 2026 02:38:23 -0800 (PST)
Received: from localhost.localdomain (80-108-121-211.cable.dynamic.surfer.at. [80.108.121.211])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4abf6c76507sm282109515e9.10.2026.11.02.02.38.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 02:38:22 -0800 (PST)
From: Christian Gmeiner <christian.gmeiner@gmail.com>
Date: Mon, 02 Nov 2026 11:38:17 +0100
Subject: [PATCH] drm/etnaviv: Fix NULL dereference on unbind without PPU
 flop reset
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
Content-Transfer-Encoding: 7bit
Message-Id: <20261102-etnaviv-unbind-flop-fix-v1-1-588fd16f6768@igalia.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x2MQQqAIBAAvxJ7biElE/pKdChdayG20JIg+nvSc
 QZmHkgUmRL01QORMifepYCqK3DrJAsh+8KgG90p1WikU6bMGS+ZWTyGbT8w8I3GWRus8dSaAKU
 +IhX9n4fxfT8KF+MpaQAAAA==
X-Change-ID: 20261102-etnaviv-unbind-flop-fix-5c77f75de45f
To: Lucas Stach <l.stach@pengutronix.de>, 
 Russell King <linux+etnaviv@armlinux.org.uk>, 
 Christian Gmeiner <christian.gmeiner@gmail.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Gert Wollny <gert.wollny@collabora.com>
Cc: etnaviv@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, Christian Gmeiner <cgmeiner@igalia.com>, 
 stable@vger.kernel.org
X-Mailer: b4 0.14.3

From: Christian Gmeiner <cgmeiner@igalia.com>

flop_reset_data_ppu is only allocated on GPUs that need the PPU flop
reset. However, etnaviv_unbind(..) frees it unconditionally, and
etnaviv_cmdbuf_free(..) dereferences cmdbuf->suballoc before checking
whether cmdbuf is NULL.

As a result, unloading the driver on GPUs that do not need the PPU
flop reset causes a NULL pointer dereference at address 0.

Fixes: 85ba57ad88cf ("drm/etnaviv: Add PPU flop reset")
Cc: stable@vger.kernel.org
Signed-off-by: Christian Gmeiner <cgmeiner@igalia.com>
---
 drivers/gpu/drm/etnaviv/etnaviv_drv.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/etnaviv/etnaviv_drv.c b/drivers/gpu/drm/etnaviv/etnaviv_drv.c
index 08aca9035fc1..ec1352c1b09f 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_drv.c
+++ b/drivers/gpu/drm/etnaviv/etnaviv_drv.c
@@ -601,8 +601,10 @@ static void etnaviv_unbind(struct device *dev)
 
 	component_unbind_all(dev, drm);
 
-	etnaviv_cmdbuf_free(priv->flop_reset_data_ppu);
-	kfree(priv->flop_reset_data_ppu);
+	if (priv->flop_reset_data_ppu) {
+		etnaviv_cmdbuf_free(priv->flop_reset_data_ppu);
+		kfree(priv->flop_reset_data_ppu);
+	}
 
 	etnaviv_cmdbuf_suballoc_destroy(priv->cmdbuf_suballoc);
 

---
base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
change-id: 20261102-etnaviv-unbind-flop-fix-5c77f75de45f

Best regards,
-- 
Christian Gmeiner <cgmeiner@igalia.com>

