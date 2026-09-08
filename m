Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4C74511218
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 09:08:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788858491; cv=none; b=ZhUCHAnpadUAWOZ7iS6evtnd4M7GTKgBPNh2IgeZWJsiTUPxYvORdl1C1TX4RG5cJcgBDyLBrLY3IQ4TvDdqZmfKJXt/e+wxkVetSmJGi76WMbswF7ZJidRHPsOfGxsCUquI/qmFkyFr1+hEJl/aHsg1yESHvJXs5EFJBg19QQU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788858491; c=relaxed/simple;
	bh=xMbO6EhJUi/RdJ3ufWkeSaYG56Ls5TGr7006uLTOZQw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BgIbFu2laaKO8S+Dai29fAJeWM7l6CxJZB4+lomahtqk8qxuQgwhCC3+vjzFaeE3jD+eug1qKcFe7YycgPpVoGIfX5htbdPmV8fjVEfD1zLKIlerc7IiBv/qwbFp/oHmEBHMCud2NIgWiEVNRuoysZYb8tA/A9+zNqad/lXJ3M0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=niUkD29j; arc=none smtp.client-ip=209.85.215.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="niUkD29j"
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-c96c92c0980so2333432a12.3
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 02:08:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1788858488; x=1789463288; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EZHoy8f3OpVjs16q22My2K8o0ZC/itaQqMauUbs1Www=;
        b=niUkD29j+ocgb+VJodWgsfyZ6FBfa51mJd7qwUCkp/haBaiZWWbvtyDmr1oj7xoziR
         flGubBpOylntQVUW5SI0LSXeDfpsPzWfDVGWBsYjfrUvknGbSVKNY4xKt6krm+N0N2Al
         hBMLh1PcY4pQuHg4iqm0n0aH5/m94N44YR7vU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788858488; x=1789463288;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=EZHoy8f3OpVjs16q22My2K8o0ZC/itaQqMauUbs1Www=;
        b=g39QV7oiCJxERfRVZATWRCC8ksLKHM0GTnzSB1h97SAHB91NMjYKUc6+N1Tg/RkJPF
         L6hOBQoaPGI2I6Yz9Hz0Z9tuqa9283gZZ4HmrFkStpUGANZl5NOdpQPaa7l6+tSLeVsj
         lgDNIVZKpHqE+z9yV2PtLU3TA4JVKc0jMDUIdUrXcIehQfY86SNyRQGUiw6qZNm7JA0r
         WGHRR6nNsioXoBfy+j+eJ7+iTDnWk1o1VCQHN0QTOuAGyzSL8b/rqb5SKT5GNjP0WJBc
         Dg/HgYXz7NOQuCqYeKd8XWG8p1ssxXilermMi/8VG3Zj2/12aTaCpFB0C1RZTPQRt/D+
         NsSw==
X-Forwarded-Encrypted: i=1; AKwUvBxv1rBWqGsj0MXZxW2tG84ttRvOB/LJbCftHM+ILWlQE9mb28mnrYlFEGcIm59SwwWlWLH4nw4XdZdvNI0=@vger.kernel.org
X-Gm-Message-State: AFuF++k+n1BaWZ49AsE6OWszKiFK/LTrK/kQsBFDaZR42z34OHq2fwMO
	E9bK6CtfR+fmLI5TVR96wnJwhNinB5/UATgqEfHzDBIRooWoVbqW0cWFQM0gzvYA5g==
X-Gm-Gg: AYBFou0GtXNWhdtGGTFQmLC3YNZdYy0F8HMy1Jz5bDbeEzqw07BcqfgPulQKwXKEHLq
	HcW1uDU04FxTAO+6msCNPsshWwZlHONT5kq85v4dxXOePj97N3IqbKkFdfRmlLSpJl+jhddKiDz
	aXy8kMedjY7TUmunNOp0R5dkMU9rQ+8ZoM+kkdvIngmRw64U9iYPbdxqh+mYX4ZXQ360b5CfEMM
	K13DqheJz/R8l3us7Qm2Lc/GC9BJ5mSkujN70WLh3BjlddljIJ3jBf0XuHUievGnYlgmWt4Hovp
	sM/H45cvmGSDbsiuqJODHrFrJMVGOJODxYW6XunT/sy3o7w2wNESw8ufIpHM6LHwZzt1R95bO0t
	j1Ly28ZC9NLaE3khOBVXDH2SZr9v+FeHVzrhnLaJtraZBkQncNX3BLmwECsZKHntav1bcz6bL7q
	Rbhi6Ul1ElRYOpJTcKUO7S9mnTi0eJrgyguOhVPtmsWps6lndvPxSqx0XsBNrSV6ufvKA7nuNqk
	pSwDr9oB0AEYo73t2b5BfVkTfRB/8cumKdWmhRRUvzc968GCJZnk5pFyA==
X-Received: by 2002:a17:90a:d003:b0:398:ba9e:75ff with SMTP id 98e67ed59e1d1-39b26273a40mr43384810a91.21.1788858488251;
        Tue, 08 Sep 2026 02:08:08 -0700 (PDT)
Received: from wenst-7875.tpe.corp.google.com ([2a00:79e0:201d:8:e541:8c2f:4ce9:823a])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b4b72f62esm19718804a91.5.2026.09.08.02.08.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 02:08:06 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Liu Ying <victor.liu@nxp.com>,
	Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>,
	Lucas Stach <l.stach@pengutronix.de>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej@kernel.org>,
	Samuel Holland <samuel@sholland.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	linux-sunxi@lists.linux.dev,
	imx@lists.linux.dev,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH 3/4] drm/imx/dc: plane: Switch to drm_fb_dma_get_gem_clipped_addr()
Date: Tue,  8 Sep 2026 17:07:42 +0800
Message-ID: <20260908090745.1089143-4-wenst@chromium.org>
X-Mailer: git-send-email 2.55.0.979.g7e5102b832-goog
In-Reply-To: <20260908090745.1089143-1-wenst@chromium.org>
References: <20260908090745.1089143-1-wenst@chromium.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The hardware is programmed with clipped source and destination dimensions,
but the framebuffer address is calculated using drm_fb_dma_get_gem_addr(),
which uses the full source dimensions. This will not match the source
offset if the top and/or left sides are clipped.

Switch to the new drm_fb_dma_get_gem_clipped_addr(), which provides the
buffer address starting at the clipped boundary.

Fixes: 711a3b878366 ("drm/imx: Add i.MX8qxp Display Controller KMS")
Cc: <stable@vger.kernel.org> # Needs drm_fb_dma_get_gem_clipped_addr()
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 drivers/gpu/drm/imx/dc/dc-plane.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/imx/dc/dc-plane.c b/drivers/gpu/drm/imx/dc/dc-plane.c
index dea7404fe659..7bab75d5dedd 100644
--- a/drivers/gpu/drm/imx/dc/dc-plane.c
+++ b/drivers/gpu/drm/imx/dc/dc-plane.c
@@ -65,7 +65,7 @@ static int dc_plane_check_max_source_resolution(struct drm_plane_state *state)
 static int dc_plane_check_fb(struct drm_plane_state *state)
 {
 	struct drm_framebuffer *fb = state->fb;
-	dma_addr_t baseaddr = drm_fb_dma_get_gem_addr(fb, state, 0);
+	dma_addr_t baseaddr = drm_fb_dma_get_gem_clipped_addr(fb, state, 0);
 
 	/* base address alignment */
 	if (baseaddr & 0x3) {
@@ -146,7 +146,7 @@ dc_plane_atomic_update(struct drm_plane *plane, struct drm_atomic_commit *state)
 	src_w = drm_rect_width(&new_state->src) >> 16;
 	src_h = drm_rect_height(&new_state->src) >> 16;
 
-	baseaddr = drm_fb_dma_get_gem_addr(fb, new_state, 0);
+	baseaddr = drm_fb_dma_get_gem_clipped_addr(fb, new_state, 0);
 
 	fu_ops = dc_fu_get_ops(dplane->fu);
 
-- 
2.55.0.979.g7e5102b832-goog

