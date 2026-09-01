Received: from mail-oo1-f52.google.com (mail-oo1-f52.google.com [209.85.161.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 555D7449B2D
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 19:55:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788292530; cv=none; b=c4SrxZn2X2LNaayJGeBnebLZ2hYK1YFCz8GW4l5uAqnCEw5JzuGGUi9NVhLyziOBkwnt/G+/iWpNr4xjLxJO0j5eW91G7ht9CQjSF3IMEoDU/llS/5nxpRi0zLn9hoHnG61nxOkucYoTvTjb6ZGJ2dGnBfRi9nSJf+tWPNqzUIo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788292530; c=relaxed/simple;
	bh=TvjOuasMKcmLJ41E140O1JpOLWeLLgpHzmdhvAOXxX0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=rS6wDKEnidzdUaIsrDZ7uKFmct9Eu6lEnFy+KS/XQjfC2h6gsFf9eX6F/aJmxWcwKSkUTm3gKbrGtmgpXhjJgDsyvUuiiTODrtV9qcwBBHKFmqS+vdA1oY3Yc2qN72PTv/eXwPrhV/mfxcKBawgLXcNYB4jZ2dMvFeN5VaDTafE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hAIglYG5; arc=none smtp.client-ip=209.85.161.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hAIglYG5"
Received: by mail-oo1-f52.google.com with SMTP id 006d021491bc7-6b19e291cc6so192451eaf.2
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 12:55:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788292528; x=1788897328; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=jE7YeOTH+Slgx2JFrDNEXYntxMlmYaSvMdCwqmpupuI=;
        b=hAIglYG5YZPMjqn+mjdoINizK+v9Gr+xEK9Adeao9VaS2SGXiQBo7Gd9PziUYSk513
         qDCQzZvMhnm1gV+rVbtnjy6miGF3GJl6Y+LEhO/Wp6TMWyQ4fGMq9GsZZJzlq+pLOiJt
         7r1zkm1LCAVJPynALSd6HC2jj+uRnLyaKBt3h2nzbPq3wzBIhWu2D9S5jNZrOgnRbpn7
         OrXcIRIXXFyGi70DrvKVHa+9EnPsWgpEkA6hT7d5KYTX1QWSk5xRvCx5UNuVRX5Uueal
         se2r6/9bUs8lVTxo2VHLxWbgZCobLGDrnEjjbfJZoSjcafyjQDTIXSekEDodc7hL2W+f
         jykw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788292528; x=1788897328;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jE7YeOTH+Slgx2JFrDNEXYntxMlmYaSvMdCwqmpupuI=;
        b=BUQSkDD9mYvsdqj6x/YFLSQk2BkA7eyzOthN89vJLQUpM4klbeGTNPPN51XUGaGoIu
         tW7sKla3qjoMKpRfkd7xCnS72r7PaUyzvxZO8DKpXm/qhKdJE3xtl6mM6cvg+NNBxDoV
         UTuAOkFdqJkVo7xHl+KeDSVvf2zcXg+xzRmu9JuHnzovMi925eUFT3RWXbxxcBaJFCEx
         n/xiayGLxuOzl6FxqeA1gzubOYI4Sii0gexBvQoJ/cx9ma+7xBtTSKNRHxf7NI/GnZ3k
         9D3S+ILMSh6+ARwEvGMyEpToY2iGCKwxPQXvOwtjcbkNqCtlPGAeyJHN2ghvNka3N/xE
         Ltdg==
X-Forwarded-Encrypted: i=1; AHgh+RqBdA+ttLNCQNgiYAvqXjD9JxbfPEZtJx/Z+/xTO5czT4B6lrHfnbG6QAR60adrwKEXuc5tcOarzGXwTJE=@vger.kernel.org
X-Gm-Message-State: AFuF++mjpgxjIa3jSc2PbjvboKfejuTQg8aJ8pHRK++3sXS1UwMmZzme
	M9b+yxZ70UB2Vg8qcjzRnY6jJCqJhfYdjT/VfjfjtTokRSZOV7XkbXGu
X-Gm-Gg: AR+sD13ONEs7rSbBk4HTGR0wCDUK3TIHWEzZQGvEKTwOFBpuHmbL8TaLE+wHado6cSA
	eeqXZg9JxvwSmui9aiRwmy4XGmOzQE0hXniI0Qxz20MbQcu0583p648nwoQr3REuTP5g5n+LJMq
	ZIwqNlBmYq/5rak1BrLrLTwxlnHLld4hWOHd2jJKWzqWzGyw3F5p493ThMz6aq9fWuBrej5hiY+
	QMSbGiFNDINcxrSRb8qbOrT+b/R4sJvr3x66zTF3MY9rTjhBl3m6JV8hHkEKsMuw6dRjWd+Q506
	/6HyCbCTElqs7kTDhiNirB7+c8+LmVfPzRXSY7Q6y5mQ85sNMAmCemTUaqXUFhnnnUXxuFxufHa
	OA7exiqNSTWrY8HNN0K7RLw/jE4PEtsuuzs4q6MeMcJQEgCRH62CGM1P2PZcfgAWnDITwqnKoWS
	1WFh8+tgC8W7A9siVyDc5DW5XCCQV23Sc61qLM2Hc0OugmJi98kZs5SeDny1ZyU4WyVoY3tmKsT
	US7wx9T1SU1JtsXASmdHk6vk7jfq28jWu2McFSgpDsxLdg=
X-Received: by 2002:a05:6820:823:b0:6aa:cce3:ab61 with SMTP id 006d021491bc7-6b372d20e4fmr8604105eaf.9.1788292528131;
        Tue, 01 Sep 2026 12:55:28 -0700 (PDT)
Received: from memorizer.localdomain (47-163-111-11.bng01.bytw.tx.frontiernet.net. [47.163.111.11])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6b40f81f374sm868636eaf.14.2026.09.01.12.55.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 12:55:27 -0700 (PDT)
From: Yudi Yang <2000jedi@gmail.com>
To: Sandy Huang <hjc@rock-chips.com>,
	=?UTF-8?q?Heiko=20St=C3=BCbner?= <heiko@sntech.de>,
	Andy Yan <andy.yan@rock-chips.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Damon Ding <damon.ding@rock-chips.com>,
	dri-devel@lists.freedesktop.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Yudi Yang <2000jedi@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH] drm/rockchip: analogix_dp: bound endpoint name formatting
Date: Tue,  1 Sep 2026 14:55:11 -0500
Message-ID: <20260901195511.2761251-1-2000jedi@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

rockchip_dp_drm_encoder_enable() uses sprintf() to format a device tree
path into a 32-byte stack buffer. Device tree paths are not limited to
this size, so a sufficiently long path can overflow the buffer.

Use snprintf() with the destination size to truncate the generated name
and keep the writes within bounds.

Fixes: 729f8eefdcad ("drm/rockchip: analogix_dp: Add support for RK3588")
Cc: stable@vger.kernel.org
Signed-off-by: Yudi Yang <2000jedi@gmail.com>
---
 drivers/gpu/drm/rockchip/analogix_dp-rockchip.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c b/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c
index 587e60232ec7..efd5a98e80bd 100644
--- a/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c
+++ b/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c
@@ -241,10 +241,11 @@ static void rockchip_dp_drm_encoder_enable(struct drm_encoder *encoder,
 				of_graph_get_remote_port(endpoint.local_node);
 
 			of_property_read_u32(remote_port, "reg", &port_id);
-			sprintf(name, "%s vp%d", remote_port_parent->full_name, port_id);
+			snprintf(name, sizeof(name), "%s vp%d",
+				 remote_port_parent->full_name, port_id);
 		} else {
-			sprintf(name, "%s %s",
-				remote_port_parent->full_name, endpoint.id ? "vopl" : "vopb");
+			snprintf(name, sizeof(name), "%s %s",
+				 remote_port_parent->full_name, endpoint.id ? "vopl" : "vopb");
 		}
 
 		DRM_DEV_DEBUG(dp->dev, "vop %s output to dp\n", (ret) ? "LIT" : "BIG");
-- 
2.43.0

