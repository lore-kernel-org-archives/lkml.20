Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792706295;
	b=tPQHdGBJTXjMRs731fRSAOoeXLcGXv77GLAqkX+Ylgz+E85Qe9OddYugM2vlnway6aoF
	 wXp2a6hE1i1Lnd34eYFAg0c1dB/gJfrJ1fikmR/BJBjyNhZbTyEXuWXYebcRHBwmN+KEk
	 lisIVGJztCRpocTEWZ/LCll6CXs5s1KxnLeaq7eX6kNKvN5v3guxwruMHa2dyiHm9qqs9
	 XGuXMboXZLgiFob5YpOj5nrvOn9m373qDv1QdabZGbQYBreNGC50h0eyTX6rMGNzEdCU5
	 4jm+Zy/YPWr9vOB/rhYGdTD6JoelyhE3+NdBqfH/gleoO2/9/0U/YGN1IRYA5lVfYzw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792706295;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=6eqn12NWtCMzBotu+Ik94sYsNYAT7Cdm0Ga9zAnTZZI=;
	b=QOAtoYTc1VgjIOwwTJBGC6okITG1E/a1JNvMl+gtbhalfMsSET73uCPSruuAzNzIZ/Rt
	 rSWG/H3QDjym2rWKTqyvxuE8pWdtAZYwYCPjuK6cRGGweeVsNCl39clH9fOyZwLGLEjyR
	 jTQRwou/Pd1zHY865gZJinVxZNj2JaCcvPe6WKCn/U0tDXO5D68YO3LfASMsVf517P0rK
	 ni9WFWSEfE8oh2EViWwPL3k+x63zJMxZ6q0bm5jyGuwqYTSB+oysPiW3A8WEbeOJkZQdE
	 y02Kj1LPYxMzLFTj6QVaJS0qAq93Boak/0RaODPKJP54yL880sDI2d6wAkT0SgxgGBg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=dbYnZ6p7;
	arc=none smtp.remote-ip=209.85.221.49
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36950606A319
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 21:58:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 36950606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=dbYnZ6p7
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-48b001cd92bso130251f8f.2
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 14:58:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792706294; x=1793311094; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=6eqn12NWtCMzBotu+Ik94sYsNYAT7Cdm0Ga9zAnTZZI=;
        b=dbYnZ6p7KNI2eB0lP2GYAyrI/dSU0zd6A64J8f4D53ArlhpPUM1pJKm3y36LLyHc1x
         l+OVl352DNT+wQUr60HX/NUZrtm5KOnG7e7eqm8hd0PkTqHKjgb+q9tn1pmTSNNNG5Ah
         wxrr/adLCNOrs5x0wWWb9UfhuoJHub135Gl30LXQFrnEunZkiOsEf0uxJqOZEhU1oPks
         XkGUR1anIsZEJtUNdpdO3jMbr/lgLOPNPlkFI3UvQMqM4JG39+qJqBN9Tx8YaV/9zywi
         sFkhDApjo/bHtLX+GSLBX6+k3OcqMvIj5KwpOfZzPvdfxPjykD50sHHU7gevPjAHbYqm
         PR9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792706294; x=1793311094;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6eqn12NWtCMzBotu+Ik94sYsNYAT7Cdm0Ga9zAnTZZI=;
        b=YL5iwFwDZe5r1OSjMwyZeX42uYEGCYh7D6UqE85dlgkJYpIqz+dIwDQ8UaYAWcbft9
         XsATUYULcrzr51zPFPXwAtVRO0cutzNwFjFS7O0iO6WEK1sVpyxB2tk4FiMe7fTlA4SL
         4z+GQBTn+QMwkJj+SqyIiy38XlOvVETxlJ58A0Tjww02IWV0+asueeBij0laix0AZ9Bp
         YgqBma1zk6/e39ecJDgOU76uWG6CzUohh551htJ7pD0MSpZijY7x4+qMj+4E1Rc1Oj8G
         ffUMav4FcwOsI9Z9UvO8i7AVxH+iyWuvOqaZR+MK6XvXy1iyWdQhcFdTnPCg02yWJy83
         4NQQ==
X-Forwarded-Encrypted: i=1; AKwUvBxVsbQ/fftyG6QSNd8LMgsxzueEYxVtnafs7U5cmWnm7laTCqJmd7fSQfCq1gHliWgGblDjwhQxD4wYaPU=@vger.kernel.org
X-Gm-Message-State: AFq9FYKcgnJXWOfaVRw5j8lwOLWvDQ0hzH6grLxRmvEiGzXCbUhcXfkv
	30sTssyLV7XinEx6x0pz3qjthWOjpfdQ2evLNOjOk4wfP4Fcb1IxA37f
X-Gm-Gg: AYBFou2ynQRCLAqTP8HZUp/V8UDlekvq8bSqP5huVBA25C06gHmpudSMmsycVz4OPDx
	GR0fwVJbK43bFSLyd13qgDFGbZUYL9y8Cj7naNonCth6NVd0q9/s1o6ZHe7mdG83DG+dddXyMk1
	LbdlKh4EKkUt8YM0mTcUVZtHYfDUXpJnrpNWy0D1TIq1uZqTHZ3K/1KXxz+ZufSU4VzUfemjH4w
	IR1soFKBj1lIw3kU+s77UPFjQnsPJHzG3I+siYq+BCyFxVTh76rfdDCVC/IS8mrg7oqJ+57CAk6
	F42KrFBs/wqfYlkw0cgn3/8kAbfruZADblTzS90PEeY6KfAmH96bDEdbaOm610ywT/37diPu4Mj
	zWiGt/P+H6zvoLYXvvaQNtKx5iMC9nE0BlSnUlfQufvZG5v9DxCS0ACKAp42hUeTfYfmJIbeJsi
	lWGlRmmEUR5Xl6t48McZ0aFrey+mCasoowlNfODx0P3Hy6T08suk2ebTjhseZVC9ZpPQOedZl0S
	QMGF2vTKefFXceYsutSMxXaiGN2q4HNuj0W549nWY/G8LHFvK2MXPxFd+aa
X-Received: by 2002:a5d:5d0e:0:b0:48d:ffce:6cef with SMTP id ffacd0b85a97d-48e384e63f6mr300522f8f.0.1792706293644;
        Thu, 22 Oct 2026 14:58:13 -0700 (PDT)
Received: from ArchOarora ([2001:19f0:6c01:2c43:5400:5ff:fef6:1b30])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e37e5dfb6sm701704f8f.0.2026.10.22.14.58.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 14:58:12 -0700 (PDT)
From: Oarora Etimis <oaroraetimis@gmail.com>
To: Louis Chauvet <louis.chauvet@bootlin.com>
Cc: Haneen Mohammed <hamohammed.sa@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Melissa Wen <melissa.srw@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Harry Wentland <harry.wentland@amd.com>,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	Oarora Etimis <oaroraetimis@gmail.com>
Subject: [PATCH] drm/vkms: use the gamma LUT of the state being composed
Date: Fri, 23 Oct 2026 05:58:03 +0800
Message-ID: <20261022215803.621996-1-oaroraetimis@gmail.com>
X-Mailer: git-send-email 2.55.0
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

Compose a frame from crtc_state, but take the gamma LUT from crtc->state,
which may already be newer: the worker runs from the vblank timer and can
fall behind a commit. Such a frame combines the planes of one state with
the LUT of another; the CRC and the writeback output can then be wrong.

Read crtc_state->base.gamma_lut instead, and clear the derived fields when
there is no LUT.

Fixes: db1f254f2cfa ("drm/vkms: Add support to 1D gamma LUT")
Signed-off-by: Oarora Etimis <oaroraetimis@gmail.com>
---
 drivers/gpu/drm/vkms/vkms_composer.c | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/vkms/vkms_composer.c b/drivers/gpu/drm/vkms/vkms_composer.c
index 0fc915a954ba..ed3c8f1a8db6 100644
--- a/drivers/gpu/drm/vkms/vkms_composer.c
+++ b/drivers/gpu/drm/vkms/vkms_composer.c
@@ -609,6 +609,7 @@ void vkms_composer_worker(struct work_struct *work)
 							  struct vkms_crtc_state,
 							  composer_work);
 	struct drm_crtc *crtc = crtc_state->base.crtc;
+	struct drm_property_blob *gamma_lut = crtc_state->base.gamma_lut;
 	struct vkms_writeback_job *active_wb = crtc_state->active_writeback;
 	struct vkms_output *out = drm_crtc_to_vkms_output(crtc);
 	bool crc_pending, wb_pending;
@@ -625,19 +626,22 @@ void vkms_composer_worker(struct work_struct *work)
 	crtc_state->frame_end = 0;
 	crtc_state->crc_pending = false;
 
-	if (crtc->state->gamma_lut) {
+	/* crtc->state may be newer than the state this frame is built from. */
+	if (gamma_lut && gamma_lut->length) {
 		s64 max_lut_index_fp;
 		s64 u16_max_fp = drm_int2fixp(0xffff);
 
-		crtc_state->gamma_lut.base = (struct drm_color_lut *)crtc->state->gamma_lut->data;
+		crtc_state->gamma_lut.base = (struct drm_color_lut *)gamma_lut->data;
 		crtc_state->gamma_lut.lut_length =
-			crtc->state->gamma_lut->length / sizeof(struct drm_color_lut);
+			gamma_lut->length / sizeof(struct drm_color_lut);
 		max_lut_index_fp = drm_int2fixp(crtc_state->gamma_lut.lut_length - 1);
-		crtc_state->gamma_lut.channel_value2index_ratio = drm_fixp_div(max_lut_index_fp,
-									       u16_max_fp);
+		crtc_state->gamma_lut.channel_value2index_ratio =
+			drm_fixp_div(max_lut_index_fp, u16_max_fp);
 
 	} else {
 		crtc_state->gamma_lut.base = NULL;
+		crtc_state->gamma_lut.lut_length = 0;
+		crtc_state->gamma_lut.channel_value2index_ratio = 0;
 	}
 
 	spin_unlock_irq(&out->composer_lock);
-- 
2.55.0

