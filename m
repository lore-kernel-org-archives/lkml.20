Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794388666;
	b=Azu+HX3N/FFsGF0iiFhHEwmqiJ2CDX5oOghnBACEMjRX3Pf7Dx9EZ96+OgIe1FiAe/N+
	 0NK4nM2GhEABpmQjhIZO1fxoz953WMM3w+jZMPLfuaawxsVjaiATSJgmiUtUnrrKAvyyz
	 rsqlZZiMFS9XC3m6mz7OdcTDYfHSRXlqh7VM0APGOYwUt4HY4vzrYIFgFX1JfsK4BBDd/
	 Vcqg+rUGp7PS/NmR5uMhxXnfN6cFwCaqEdYw/IDm9YA1rtkiJ7s8WWGJL8X13Ln/gKMzK
	 UZk7Pb4xxNy8v9/WT0qBqssHM2JT7H52G+BsIjN9vcYP0BG6tNvN8EYI0+HbUsWsYYQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794388666;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=aPNp2WgpgPHRfZu0DFCm+CGOWcM+7olBPXi5wHu617Q=;
	b=G8+gdPy8gVO6vX3mGuEzpApfEP0BL6dBdSprHt60Ua/8cWeim8qwECsE7O/eePDRwKn7
	 qwLdlkdTJ3ssWlt+IeTGS7/SRhHaL0x8TATjAUQjtDKt/dVfm8yeDS1fhfFB71AfRFcAL
	 qrXb0OXy1bEUPD1FRj49SttRSMq7rwx09lErZpnUNk4Zpyc7w5gGS7L0nfWuDejm2dFid
	 nqBjeM7B0qy5ey1ju1gkn4rDVp3MblccX+Kv2QX+Hrvwuzb6F2aCnAYOy5yxgGQiBU74e
	 Eu73QDB6ZYYwE/jGLb6mZHEpet1Z7y5HwnptkhEoGTfwdi3GAjhBgjQl1F7PlqRkdwQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jKX6NVZN;
	arc=none smtp.remote-ip=74.125.82.177
Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5182E606A324
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 09:17:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5182E606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jKX6NVZN
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-36f6295304dso3791943eec.1
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 01:17:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794388665; x=1794993465; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=aPNp2WgpgPHRfZu0DFCm+CGOWcM+7olBPXi5wHu617Q=;
        b=jKX6NVZNw1uXNnffh/MRSTKG72UpipJB1RmTou87Sz/ovtnkneTDYdHzEWYde+rcqo
         lV4ywopn0vb4Yqvo/qlDiCqDmTNsS7D3sjFLlNijGpfxgEOLsO84Xr5QffWdmoRyKLZF
         nyuJCpIbnQmlvld0IKHHKfWZA7gZ6nqkPobtbQdkh92pKoghNiwOOKeEUSI8gLsXBXLE
         Xq4Uv6dfzNzFFUUlH9jIxHnHWO2uJzCsEuTzcxiZtZ6tz9wZMFEeqw88Y7Sc6YbnDNeT
         zqUx+we2i005dqyhfKkdql2cHp6VViEYZ7motGmAdjUDaS8f+Fe23/vPAk/ZIoJKhbUf
         3xdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794388665; x=1794993465;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aPNp2WgpgPHRfZu0DFCm+CGOWcM+7olBPXi5wHu617Q=;
        b=EmHw3AYddedRw9owOQQGr0kCY9j1NOzi6ShGO+4vP2oH7jRmM1Axv/hnbAFYnxFH6f
         YBbsufo/UUERLf9td5pgqXBbADyd9RM5IocLjnP32kZ+JfPRgfRcqA6ORPSYVf0oANrO
         jgZFML3uzbqxk/lcBz57qEAp6kYsWljXpryhbZIctUxAhJ04zY8VYJUVF7gl8pQ6nYnn
         1OVdq8+cgeuanRiysA2aFse3Ah9VRhzG3wrfMehwHNTyONgwCnM5qmvNbfGdQLdSL+3U
         dFOicHUGVHw/26xbrYZbfGXPForLbgfbHq8iOTqZMOFj7RUitgnMltsiNx1lPUcOC4Fn
         wJ1w==
X-Forwarded-Encrypted: i=1; AL+hErGKrjPrVJRH3/CunSjFCi649W975DqoWXcSXd5en++XPqHXYoanjYrhX3nS6X89evFF95kKOsfvXQtoRdY=@vger.kernel.org
X-Gm-Message-State: APuU4Z9+TaZ4BrGIub82o4WHlSGyRTyNWK67U3gNe/z0cAm77oMN6EMU
	o4qNgYTuaoG4QyK+mCfJRp2a6qYWYJ1jFmu8hLEvpwPDlcR05/PKZH9s
X-Gm-Gg: AYBFou3rWv8m6sVQYc/TCf7RIAjP/zzxqPrCvcHB7I4tzV/V7hA3IV5a0xloomy/CnB
	WBXYcquWKIXpJAYZLeRe9rErR3Iq2jwOvhPqEKFFniMDkPnY+WRVrDikM0LrY7BT06aksAqNUD8
	WUgHH+ul6qB6vn7G+mbWOeT3y4AAYzH/qQKMUGY5S5wXP1838spK1rlzf/pf8JATaL3FCFWHoDt
	pG2ue/wR34WGkrdPSQZfgwdvPFxuie+44lTPl8FXoXUreph84RKatQB5S2GzUi8CQPWcHjKglHt
	x/Ricp98W3dCDoABVgEHNN7qNEt64ZEgsNHjT7nYEalbqwoBuBjpCDSwrMEtQFemEWa4AQ0FxWJ
	s7X4hZsvummT3EVWuIBi4L5xDgThufhmZSbG+3Mnu+mi/hMQtjpZ3YiCyNuZRzqpiW5L87N8KqM
	mHH3opZPXIXyRUVRgGzb8ZmTyHVZempWL39p8odllfUYUdWLKVWJYAsGXJoGK/kMRVMD69ZZm7e
	gppolKGVEk+kSnHbCKogGPdONuWYg5cQ4X8X3bVdcquhrD8YGCENPf+AonukSFPAYH6GHEvQ9eR
	3m0Da4o/R75qaWSU3ZnSO+L2lmspwhBt89t1WI1FP8JuIRkC4ni6+hX+RB44mgJ4kefvk6gN0hU
	ukCXx9zM8X5Nc1mgzk1mMRcznX5Xe5KL+ayBWQrvdby9CBmSB
X-Received: by 2002:a05:7300:d94a:b0:36d:4135:cd7 with SMTP id 5a478bee46e88-3768617ce1bmr2715415eec.18.1794388665237;
        Wed, 11 Nov 2026 01:17:45 -0800 (PST)
Received: from DESKTOP-DIIS71I ([5.18.141.223])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37520512ec1sm13540869eec.12.2026.11.11.01.17.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 01:17:44 -0800 (PST)
From: Rand Deeb <rand.sec96@gmail.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
	dri-devel@lists.freedesktop.org
Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Nicolas Belin <nbelin@baylibre.com>,
	linux-amlogic@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	deeb.rand@confident.ru,
	shda@confident.ru,
	lvc-project@linuxtesting.org,
	Rand Deeb <rand.sec96@gmail.com>
Subject: [PATCH] drm/meson: fix NULL pointer dereference in meson_drv_bind_master()
Date: Wed, 11 Nov 2026 12:16:57 +0300
Message-ID: <20261111091657.598-1-rand.sec96@gmail.com>
X-Mailer: git-send-email 2.55.0.windows.5
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

If the allocation of priv fails, meson_drv_bind_master() jumps to the
free_drm label, which calls meson_encoder_{dsi,hdmi,cvbs}_remove() with
a NULL priv. These functions dereference priv, so the error path oopses
instead of returning -ENOMEM.

Only the drm device has been allocated at that point, so put it and
return directly.

Found by Linux Verification Center (linuxtesting.org) with SVACE.
Compile tested only.

Fixes: 6a044642988b ("drm/meson: fix unbind path if HDMI fails to bind")
Signed-off-by: Rand Deeb <rand.sec96@gmail.com>
---
 drivers/gpu/drm/meson/meson_drv.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/meson/meson_drv.c b/drivers/gpu/drm/meson/meson_drv.c
index 38bf2811d..a9b707062 100644
--- a/drivers/gpu/drm/meson/meson_drv.c
+++ b/drivers/gpu/drm/meson/meson_drv.c
@@ -204,8 +204,8 @@ static int meson_drv_bind_master(struct device *dev, bool has_components)
 
 	priv = devm_kzalloc_obj(dev, *priv);
 	if (!priv) {
-		ret = -ENOMEM;
-		goto free_drm;
+		drm_dev_put(drm);
+		return -ENOMEM;
 	}
 	drm->dev_private = priv;
 	priv->drm = drm;

base-commit: b3dfbde62cf1981c4638939c159dfd087b7a72e9
-- 
2.39.5

