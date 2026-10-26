Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=117.135.210.4
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793026152;
	b=x23uspcvQ9oS+pbDcofnePamUGLaImAgRDxJD+lL8/tBqBG5+ZMUWy8CNZs6gTgaeooA
	 g7pFtHsR6zqAsC++0wqvTFkaz+MRyuQ2rEqu/gktLr4gOivB20+jWeyAjP6Rz/mE9qe41
	 CHRaoWTKGIJSkCjQIAGlShLsFYux6qPXDRA/trQUx55IvZ+MsIPn4caLrhIkEE2ZD8gnH
	 IJSh2yWq5J39GAFPuZTuwUfeVQco0PqG46Ky0vsFV7C/JLy2OgqcPNQ4GjJNB4YvjfO/C
	 G/LK/bOKs3N3LWLNUxrjH7lwW7IYUtFpjVfkO/c3UvLtdScPe8hXsCfTuZikF/EYpWw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793026152;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 X-CM-TRANSID:X-Coremail-Antispam:X-Originating-IP:X-CM-SenderInfo;
	bh=q1uPJJujBlQwMDVIEbVRHxhSYFea8SfgoWYItKkXDG8=;
	b=21a+mkjyVfA7sU2Aw7KPYXpNZX9V+/o/SurN4zR/j0RcfOJZ4KLa55km+xldwztnR7P3
	 gt7VD6qE/yCC+3P/RXzcKdjoBXZqUq9yt4vql3MdV1JUHWqVhoRNapvD/slY4wjRv5G7/
	 OUxYCCLAF8AdM5u+SheM6rrc+bItKI536oLyEMWGJ6WooXDxulE4FPfLlcVViBpVXH2Cl
	 4NE4vWergfLwq4NbtWF439ib9FDvQuMxeh3H3A6+2upYtcWeB+fIMi0oFDQ19MMINxoRd
	 MYJTe/hN0Z4GomGsUODIks2fTlF2v7t57/a+mzUjKCaPFPRBgkoT3hZo+QR2aaLZ5Wg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=163.com;
	spf=pass smtp.mailfrom=163.com;
	dkim=pass header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=puC9kj1L;
	arc=none smtp.remote-ip=117.135.210.4
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A02B606A31B
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 14:49:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0A02B606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=puC9kj1L
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=q1
	uPJJujBlQwMDVIEbVRHxhSYFea8SfgoWYItKkXDG8=; b=puC9kj1LBRzDwPO2+K
	KrVZv1iCMDAqvE7ItxjUiJXBIF7cnYD65P+vsusW8BIMHBtEbA2BVf1grt2L1l1f
	ZpxEsWX//eaFZpJWWyOL0GrftKs3CmpBVhg03As4ltAYTr2kdEJVBnTKRJJpmizX
	BpSmCLfnE8092eznbbnCZwSQg=
Received: from SYPC (unknown [])
	by gzga-smtp-mtada-g0-2 (Coremail) with SMTP id _____wD3P6kmaN9qcCfOCw--.2131S2;
	Mon, 26 Oct 2026 22:48:07 +0800 (CST)
From: hsyysy@163.com
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
	linux-kernel@vger.kernel.org,
	Yang Siyuan <hsyysy@163.com>
Subject: [PATCH] drm/sun4i: report coverage pixel blending for alpha-capable planes
Date: Mon, 26 Oct 2026 22:47:42 +0800
Message-ID: <20261026144742.1392695-1-hsyysy@163.com>
X-Mailer: git-send-email 2.56.0
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
X-CM-TRANSID:_____wD3P6kmaN9qcCfOCw--.2131S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxWryktrWkCFy8CrWxtr4rGrg_yoW5Cw4rpF
	WrGFW5C34UCr4ava43ArW8ZF43Wa1FgFWFgry7J3s3Xr1qqF9ak3s8Caya9ryUArs7Ar42
	gw15WFsF9F4DCw7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0pEpVbDUUUUU=
X-CM-SenderInfo: 5kv152r16rljoofrz/xtbC7ge16WrfaCcAFgAA3Z

From: Yang Siyuan <hsyysy@163.com>

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

