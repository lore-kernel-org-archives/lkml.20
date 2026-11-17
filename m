Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=117.135.210.5
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794907247;
	b=YnzmVQgIeC5lexEUqCqy8UkK4fIH0HvlJJ7G2PDNj6SZGms9XNeUL9k/l8DSG+VOFttJ
	 1o8xqrP0ueyYOEEtyLIBeAwQPIju3CXwFzfbKM5DOBra//vAjsgbjrbivz3/UwWnHV2D6
	 Vz4I0OSDy3+Gy6JKL3xC6qvSpjpa3sUNVSsUea8zrtmCe+kuNP2cKH0aTqESldCP0lUFo
	 uvaJ+tLvDZ9NzKrcr/I//76X6maPmjgES1iPqdv+lWzxAFll4TeNhLN92FTida2ihrXAW
	 aGTUYFDqC8VbFhq56XC26G7uTaIMr01rkfl0AvLOflO+7YRBd0f4yR6To4wMX54LGIw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794907247;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 X-CM-TRANSID:X-Coremail-Antispam:X-Originating-IP:X-CM-SenderInfo;
	bh=JLqMyRjI44rQfOPu6Ra8q4h7mQJKrbB0IM+NTsPndY0=;
	b=diL5/5ItkfnEyPD0fqfdWUhyq577AHYFnj5PA4ppM/1UJbMuuBnGQvsWGj7m5jxcoSEs
	 8VSnh/jjL+xiz0QynEBytyELkRj0l56LeedDrQuHTEmhhje+xzUY9sSnFcj1bAazwwz5P
	 +bJkLHhuNBqlRIQtCM9FqaEx5KbsZ1lESJLx1a7EqF/D+5a8K5deYWu+hJrhFWiNwKART
	 JuEtLvEr92Sw12Gz9zqhvEztY/H6PxLDLIjKWaiGksGBGvZ1ykINLw+uJPSVUEBWYIWxU
	 qdu/yPsotrA+m9rKut67IfgSQdfhZiGCulkDjn4Yrw8fn7nJVScxT2KD7RJitQ3y0PQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=163.com;
	spf=pass smtp.mailfrom=163.com;
	dkim=pass header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b="L/lF966g";
	arc=none smtp.remote-ip=117.135.210.5
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AEA6606A31C
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 09:20:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5AEA6606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=L/lF966g
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=JL
	qMyRjI44rQfOPu6Ra8q4h7mQJKrbB0IM+NTsPndY0=; b=L/lF966gC8+FQhenqa
	tSqNhLFB7elPTalPH0NxQIKGiY5P6sxVAJhqkkqSqJ9ZuXJSNRhv3VuWfcySp9Hu
	vCqXaFzwAq4HBudyHOnShiS7TloKJzvBcTqxWmt7q6TD09myFUOEgDF3iOVbfxvV
	deiKaGlLB9uVSMUVVUM+kkKrE=
Received: from SYPC (unknown [])
	by gzsmtp3 (Coremail) with SMTP id PigvCgBHt0IuHPxqNdcdGg--.34441S2;
	Tue, 17 Nov 2026 17:19:43 +0800 (CST)
From: Yang Siyuan <hsyysy@163.com>
To: Chen-Yu Tsai <wens@kernel.org>
Cc: Jernej Skrabec <jernej.skrabec@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Simona Vetter <simona@ffwll.ch>,
	Samuel Holland <samuel@sholland.org>,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH RESEND] drm/sun4i: report coverage pixel blending for alpha-capable planes
Date: Tue, 17 Nov 2026 17:19:32 +0800
Message-ID: <20261117091932.12063-1-hsyysy@163.com>
X-Mailer: git-send-email 2.56.1
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
X-CM-TRANSID:PigvCgBHt0IuHPxqNdcdGg--.34441S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxWryktrWkCFy8CrWxtr4rGrg_yoW5CFy5pF
	WrGFW5C34UCr4ava43Ary8ZF43Wa1FgFW8Kry7J3sxXr1qqF9ak3s8Caya9ryUArs7Ar42
	gw15WF4q9F4DCw7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07j0GQDUUUUU=
X-CM-SenderInfo: 5kv152r16rljoofrz/xtbC7RDsIWr8HDBgcQAA3b

Linux 7.3 added validate_blend_mode_for_alpha_formats(), which warns once
per plane that exposes a pixel format with an alpha channel but has no
blend mode property:

  sun4i-drm display-engine: [drm] [PLANE:35:plane-0] pixel format with
  alpha exposed but blend mode not setup. Please fix.

The mixer blends a layer using its own alpha channel: ALPHA_MODE is set
to PIXEL when plane alpha is opaque and to COMBINED otherwise, while
BLEND_PREMULTIPLY keeps its reset value. That is straight alpha, i.e. the
DRM "coverage" blending equation.

Advertise exactly DRM_MODE_BLEND_COVERAGE on every layer that can expose
an alpha format (UI always, VI on DE3 and later). This matches the
existing register programming, keeps userspace behaviour unchanged and
satisfies the new validation. Premultiplied blending would require
driving BLEND_PREMULTIPLY and is left as a follow-up.

Fixes: 860e748bddcc ("drm: ensure blend mode supported if pixel format with alpha exposed")
Signed-off-by: Yang Siyuan <hsyysy@163.com>
---
 drivers/gpu/drm/sun4i/sun8i_ui_layer.c | 13 +++++++++++++
 drivers/gpu/drm/sun4i/sun8i_vi_layer.c | 14 ++++++++++++++
 2 files changed, 27 insertions(+)

diff --git a/drivers/gpu/drm/sun4i/sun8i_ui_layer.c b/drivers/gpu/drm/sun4i/sun8i_ui_layer.c
index 7d894e1eb..ef059ac47 100644
--- a/drivers/gpu/drm/sun4i/sun8i_ui_layer.c
+++ b/drivers/gpu/drm/sun4i/sun8i_ui_layer.c
@@ -283,6 +283,19 @@ struct sun8i_layer *sun8i_ui_layer_init_one(struct drm_device *drm,
 		return ERR_PTR(ret);
 	}
 
+	/*
+	 * The mixer blends the layer using its own alpha channel with the
+	 * pixels not premultiplied (BLEND_PREMULTIPLY keeps its reset value),
+	 * which is the DRM "coverage" equation. Report it so that the blend
+	 * mode validation in drm_mode_config_validate() is satisfied.
+	 */
+	ret = drm_plane_create_blend_mode_property(&layer->plane,
+						   BIT(DRM_MODE_BLEND_COVERAGE));
+	if (ret) {
+		dev_err(drm->dev, "Couldn't add blend mode property\n");
+		return ERR_PTR(ret);
+	}
+
 	ret = drm_plane_create_zpos_property(&layer->plane, index,
 					     0, plane_cnt - 1);
 	if (ret) {
diff --git a/drivers/gpu/drm/sun4i/sun8i_vi_layer.c b/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
index 92dd5a97f..b6771576b 100644
--- a/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
+++ b/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
@@ -470,6 +470,20 @@ struct sun8i_layer *sun8i_vi_layer_init_one(struct drm_device *drm,
 		}
 	}
 
+	/*
+	 * Only DE3 and later expose pixel formats with an alpha channel, and
+	 * the mixer blends them with straight alpha (coverage), same as the UI
+	 * layer.
+	 */
+	if (layer->cfg->de_type >= SUN8I_MIXER_DE3) {
+		ret = drm_plane_create_blend_mode_property(&layer->plane,
+							   BIT(DRM_MODE_BLEND_COVERAGE));
+		if (ret) {
+			dev_err(drm->dev, "Couldn't add blend mode property\n");
+			return ERR_PTR(ret);
+		}
+	}
+
 	ret = drm_plane_create_zpos_property(&layer->plane, index,
 					     0, plane_cnt - 1);
 	if (ret) {
base-commit: 091b06388b117fefdcb63336ac09956a4914b961
-- 
2.56.0

