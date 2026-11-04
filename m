Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793807487;
	b=h2uoi0MAQqcNM/64BvTQnYoJCaLSrbKwmCNKavG4cSVLorLZl8+pcY1hwXogiGiSxuXf
	 u5cL++TAt8y8YzTfP/2gYmK0py9HArHYT6Y1U5TNIVEUCOgYLkuqRelwwQp2cOCZSmQbo
	 uSWHMNey2cAxjtrc3DOc9TyN7bhBncu9NnS5GVnPbjFioJCWMcBO/RTx3PrJ/F3OUlZT0
	 cuZAz1VJ2B+CV40+GARMlcZN3Vu6pOnEWfB4JTie5YSNlLZKLl4wq8+3IEvYogB/DnzX2
	 qH8x1QO7CVIW5HJoZbAAawfbLiLL6CEJr42dSiW6Td/dusdfjs3ueK9D9nq3bTwWdmQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793807487;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=5MryvWougc8oZCTNV6AOfjFxzrIHneZrJJ6z1cTNnJA=;
	b=RIJHbRfgDOLl6SjNuLsuydZNahtDVpcZwn9SkXm4Vtl49i0H426ixf9ZIN6fqsKL+vv8
	 V9HBADg2rnVukXt3RhWQ5Zgpvjk8yvO8lnwPil9vwPgkz/6+4I9/VqZMJfWcbfkL4RcpI
	 u3THM38EE4vgXuz1FskKY8E3g6ByD5MBA2DFzcspKe6S4ehLUXzxpJo1jC+qQcpzj+9w1
	 e8zA9ZLMruSJDyY3WlxiPads6pve0/RRv4QhmJkQU3t1bbaiC8wqydeeY11JNQNx6WBhP
	 PuLq8y+FQ2a2/RscWrcmvxvJqgEWKk/DSJ0TI1MMPM6aStbbdrepqAaidoBjLp6VzHQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VIULAb5y;
	arc=none smtp.remote-ip=209.85.221.52
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B9DC606A326
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 15:51:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3B9DC606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VIULAb5y
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-48b060ec084so582576f8f.0
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 07:51:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793807485; x=1794412285; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=5MryvWougc8oZCTNV6AOfjFxzrIHneZrJJ6z1cTNnJA=;
        b=VIULAb5yVkuv6TQbnjzqnOngGl4JcGT+1S/8o3vv5RqtiQSnnLtVZJrpINqLipQzGd
         JrPkubUx3qJ5ctUJyP+ALL0noCfW9Jq+stpkWW901FQ406oB7dCwPABSjLgpsHBVQAa2
         fdR0EJR8tQ9QNrHTxjcyoRP1PGrTWJMqPxFfKVZmL+heCENt5fgSRU1TZYmv7uldFp42
         ukYR7mlAjKzKxsN4egVaCgoax19w87lnY/6CCahhdpPtDDvqC81RewKH5i/Cg0wPaIt7
         P47TrxbD5Ax/ipVdQgVP6Sjc5UnTs1Ae79dwPl6Cxob4b0ZC+phJynfb3kKjVHAAVSc6
         Z8kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793807485; x=1794412285;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5MryvWougc8oZCTNV6AOfjFxzrIHneZrJJ6z1cTNnJA=;
        b=wOtCv/Vj0rLS4LgaEI/iggVQwyqDuT6bngdlZ/NsYvONebpKNK6DdsNM0tuQgnCv5Q
         GyEtW3q21M/XRdLUSUjbWjkK1Egd+YzbjweXtK7KYZHyU7/BMlg9OaCQxOlbNYpB2ofc
         rlhVL4sZqatBzvNyaXO/N8HTE05jBKWqVw6E2d40qyxnBoY+3fmuI7miOeN3MDi4lmpg
         Lxt0xLRX79r6BNlxkrq4YHLK5DHMpJ0eWIZHuq9ahENO+KMlwIjZekzjqYa2R8VAYQhJ
         +Y5RonnQ4O9dw7SyYR3ZUY/EYEyxOjx31O7tujh7pkaQkE48CrZceQUR8dpXvCD+OkEh
         5q/w==
X-Forwarded-Encrypted: i=1; AKwUvBzOfmhO+cK1bYj0Xqjs1zaZjpJVm4ZF35DSsjEWyj3zB7DdeQ7whqKzP+lGH+YpStC+NXxOU3ff37QhBCo=@vger.kernel.org
X-Gm-Message-State: APuU4Z/IqLj5nNay4gqfIj1dQvu6D6CKe5umlGyIgwXV4rFAdtgaF2J9
	qS24ia8ONthp1cNRgxOhidxYlEn9lOA/0mH2ruEEBpBLg16chcT8Qa2w
X-Gm-Gg: AYBFou1hoIGtAnuqeBR1gpHGZLMQcqII93iBSIk/e0yI71UtVQgY2LhLqudZNaTjyiB
	omehJVjwnN969ope9iWvMYiUn09kGT3OFbnGapkFA4X8IOaMXr1NhYVgc6oZ9GxxO+y4ZTsbEHu
	e0cQS7f6fRWItKnVhxpySUCG5w2lUfJEwQdJvyhLLdLf3wCRT1HSBRCnNbMCjr/1sA55SiuyTSe
	VCRxitt1IYV6GUKyvtGyuq06zFyc7OIP9Ff3on6xjqM7NB4HlgGsMO+l7TQQEz92dglA75pkK2k
	Mj3t+tDEdVSU3IDLOx/t6qScXZmrlXP0kS/nbAJ8qxYOqbCMGTy8TudCHv8lFp37RZFbwaSm7G3
	FN0s05dxjCkKyrL1KhSyjUgz30iQO591iRpRbc0y0Ic/j/oJy8P6vbeM4/JXpeX/8mYHAUEv2jW
	2FYV73SgER5CE5Aja1TL1HWYkBd6Zbmn7BoBKOiqL6H58+vKf6IqgqtlGYYRF8GdVNCweBgoLZn
	qV9KfljYR2ouUcpkq6HtjMt5JpGRH6EInF7Voc47HwwKvOnMhqRoEIfwO1rF6JSoORh5daDo1gt
	GMjgpezH58DImhIDLsd7aZq0stFA+OUvoFNpt6qBM6gi/Q==
X-Received: by 2002:a05:6000:402c:b0:48e:76ab:7906 with SMTP id ffacd0b85a97d-48e76ab7f39mr33469456f8f.9.1793807485352;
        Wed, 04 Nov 2026 07:51:25 -0800 (PST)
Received: from localhost.localdomain ([79.117.198.103])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48fecac2772sm4394985f8f.18.2026.11.04.07.51.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 07:51:24 -0800 (PST)
From: Jose Nieto <jnieto.alaber@gmail.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	dri-devel@lists.freedesktop.org
Cc: Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	linux-amlogic@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Jose Nieto <jnieto.alaber@gmail.com>
Subject: [PATCH] drm/meson: plane: add pixel blend mode property
Date: Wed,  4 Nov 2026 16:51:19 +0100
Message-ID: <20261104155119.284708-1-jnieto.alaber@gmail.com>
X-Mailer: git-send-email 2.47.3
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

The primary plane exposes ARGB8888, a format with alpha, but never set up
the pixel blend mode property. This makes the DRM core warn at boot:

  [PLANE:...:meson_primary_plane] pixel format with alpha exposed but
  blend mode not setup. Please fix.

Advertise PIXEL_NONE and COVERAGE and derive OSD_REPLACE_EN from the
requested blend mode. Formats without alpha (e.g. XRGB8888) keep the
previous opaque behaviour.

Signed-off-by: Jose Nieto <jnieto.alaber@gmail.com>
---
 drivers/gpu/drm/meson/meson_plane.c | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/meson/meson_plane.c b/drivers/gpu/drm/meson/meson_plane.c
index cf8c90158fcf..115849a0b0c8 100644
--- a/drivers/gpu/drm/meson/meson_plane.c
+++ b/drivers/gpu/drm/meson/meson_plane.c
@@ -233,18 +233,13 @@ static void meson_plane_atomic_update(struct drm_plane *plane,
 		}
 	}
 
-	switch (fb->format->format) {
-	case DRM_FORMAT_XRGB8888:
-	case DRM_FORMAT_XBGR8888:
-		/* For XRGB, replace the pixel's alpha by 0xFF */
+	if (!fb->format->has_alpha ||
+	    new_state->pixel_blend_mode == DRM_MODE_BLEND_PIXEL_NONE)
+		/* Ignore the pixel's alpha */
 		priv->viu.osd1_ctrl_stat2 |= OSD_REPLACE_EN;
-		break;
-	case DRM_FORMAT_ARGB8888:
-	case DRM_FORMAT_ABGR8888:
-		/* For ARGB, use the pixel's alpha */
+	else
+		/* Use the pixel's alpha */
 		priv->viu.osd1_ctrl_stat2 &= ~OSD_REPLACE_EN;
-		break;
-	}
 
 	/* Default scaler parameters */
 	vsc_bot_rcv_num = 0;
@@ -536,6 +531,7 @@ int meson_plane_create(struct meson_drm *priv)
 	struct drm_plane *plane;
 	const uint64_t *format_modifiers = format_modifiers_default;
 	int ret;
+	unsigned int blend_modes = BIT(DRM_MODE_BLEND_PIXEL_NONE) | BIT(DRM_MODE_BLEND_COVERAGE);
 
 	meson_plane = devm_kzalloc(priv->drm->dev, sizeof(*meson_plane),
 				   GFP_KERNEL);
@@ -566,6 +562,10 @@ int meson_plane_create(struct meson_drm *priv)
 	/* For now, OSD Primary plane is always on the front */
 	drm_plane_create_zpos_immutable_property(plane, 1);
 
+	ret = drm_plane_create_blend_mode_property(plane, blend_modes);
+	if (ret)
+		return ret;
+
 	priv->primary_plane = plane;
 
 	return 0;
-- 
2.47.3

