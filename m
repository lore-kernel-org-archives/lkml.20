Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC3CE1E5B9F
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 03:33:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789529619; cv=none; b=ZZE+1mC7BDh4Qr20Lcl9bZQ0vChzYDdacrAqngsovspXx9k8g+mz1t+n5cZlBwIny2t9cVLaS9s036wrHdx84ihM/tESFuHMa3Lthg6XFhvbVy3SFRoq/4ygq+CjqekxQAee1pDFqa3kEiQIEGtJLsT3N8SIN8XHrmKMXkgo90s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789529619; c=relaxed/simple;
	bh=s5XVTbQ1oqig9WAX+D6K/Dw3nnCGDh9w9eKsg9hj0nc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=SputVVCwje6158isB1ZW90u3LUSVClxLKOF5YY46Fwo4bv+aB2tEKQ59qCKA5a+WxLLYJEYH2M7Bq28jGYTSNVwa7twmAfypZKxuSjmp8ExXk1MYgqSsHuM4UWh29BsIydhVkLCVN4/bpRD25P5wjMhLVH95jeKNzz2UQMVrpc0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=mj3Ev/7N; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="mj3Ev/7N"
Received: by mail-pj2-f13.google.com with SMTP id 98e67ed59e1d1-39b31b4281eso399111a91.2
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 20:33:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1789529617; x=1790134417; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=WW23/p8j1VrlcRbF/FlA+rOMTRyOj5YVS3I8yZ6IEcE=;
        b=mj3Ev/7NRi32eVRLEeyuGj7SWPEQxeHK8PKAG8OurIiAQg4nysa655YmhEpRXc06gt
         P8IiW/pr2pHNrJ2nwAVERnJWSUzwAxrIOaKBTy/unf5NbNx8yxLahy4A+n+a4eVl4ZZh
         oY7JKpDBMS0UOzEXvNJ0pcldiIIBByqD3k6+Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789529617; x=1790134417;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WW23/p8j1VrlcRbF/FlA+rOMTRyOj5YVS3I8yZ6IEcE=;
        b=ZbVHkxzUFwhrh42mcSw5yiAljBDP3JVheyNB5ths8akV+/r5qI8pZ3dsAQdABE3y1f
         kWEZeoZ/AwuVvwWosbp+3NhMmIUH0tjgnIO/A1Tk5FZocKJvSa0jOSOo1P0kSYYy5kfh
         sI0tHFxtpgjfo0WnG8YkFP4U4pifrCxlharqnzOQ0ZjZReG7BclQHsgy9NIrpPhhsSG0
         tYLqCQ3N30WvaAwVfh4M4osBsfNBfBdRQ3GSM0uMU+Wibuy07RSpU5Qd2IlsJI8xVJdP
         l4w2jWQNjCy4ftU/IUNr8bpawpyD0WFj6eLQl+quRpozvU1zpbyOXmrbTf8Rf1yayNHe
         r2Ug==
X-Forwarded-Encrypted: i=1; AKwUvBxCw1ddHelzozgOSe0UwN4T+rO5fNo3mAhWQisdANq4e39SML0DWNjfkz78eO5PTfl5FPCKZSAw2qm5f9g=@vger.kernel.org
X-Gm-Message-State: AFuF++nuIl2TI/yFM4HKoUI1hsQtKCg4Lk5gFU04/PV54gkPeyGyrz4A
	yennBTe8815wWcux1ylivvszA3BNqgxteW0Hs8N4qDfp9WFWisIvnUKyt0Xgh4IwKg==
X-Gm-Gg: AYBFou0yum6c2e+UVVNw/DKAobGGiTSNuxp9tq7OA0lgUpwJdsuDP4+C8CxVLYr4q1S
	UxX3vM750s+ayNtW3wJ86mimZCNWJWGT2VcHCNFU2lPeQefV2XpvDs2j4jKGnq7ZgaupPV250Ed
	//DbId84R0aBDuHYdlT5XOYBGbqP+MMlYWBE0ha5wMlkXSqbslcAtt6nsnhPqGiT84OxWQJawau
	RPSpnm/eCkgdLFCRB73zkvzYzOSQMpKV71A1UCrdxVZH/Q+RrMvbAlwycWU/IpX12ljN6vwfZSU
	sLj8PeuTE3OWeKLBHYmlmMQpFcXO8XjXaams3vntMp/B/VtUKXKJ6mAqYUkC2rlEA1lN6V2HLKp
	3NlH9IVLpgAHbN7IHTWbqWpQDqp1N9mcsMvRmfDszwsT81mqNSZi1f4qOm6J2mF4GxKZI/yH/Us
	jSaiaI3QMmOVLcmCIeBGU79Ya65Ki0wCgoXSPdE03zaFHljSqWFjGO91/+MCTmabWy1LqlNZai2
	j1g3Ra5DEKeGbwNpfN0e+rU9bYOF+kSuGEltAugQ2IWgF3gGuWU0dxILg==
X-Received: by 2002:a17:90b:224b:b0:38e:57a3:f218 with SMTP id 98e67ed59e1d1-39e1e4246f7mr2337951a91.13.1789529616959;
        Tue, 15 Sep 2026 20:33:36 -0700 (PDT)
Received: from wenst-7875.tpe.corp.google.com ([2a00:79e0:203d:7:1f62:7622:5d61:2578])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e1bbe3e62sm1833477a91.10.2026.09.15.20.33.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 20:33:36 -0700 (PDT)
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
	linux-kernel@vger.kernel.org
Subject: [PATCH RFT v2 0/5] drm: Add and use drm_fb_dma_get_gem_clipped_addr() helper
Date: Wed, 16 Sep 2026 11:33:21 +0800
Message-ID: <20260916033327.3054126-1-wenst@chromium.org>
X-Mailer: git-send-email 2.55.0.1032.g73a4cd73de-goog
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

This is v2 of my drm_fb_dma_get_gem_clipped_addr() series.

Changes since v1:
- Add and use new drm_framebuffer_get_block_offset() helper (Thomas)


This series adds a helper to retrieve the buffer starting address of a
"clipped" framebuffer. This contrasts with drm_fb_dma_get_gem_addr(),
which gives the address of the full buffer.

Some drivers program their hardware with clipped dimensions, so they
should be using the clipped buffer address as well, unless the hardware
can advance the scanout directly. (Side note: many drivers still use
the non-clipped dimensions.)

While at it, also pull out the offset calculation of drm_fb_dma_get_gem_addr()
into a separate helper in drm_framebuffer.[ch], thereby separating
responsibilities.

The sun4i driver was recently incorrectly converted to use the unclipped
drm_fb_dma_get_gem_addr() helper. This broke offsets into subsampled
pixel groups, but also exposed the mismatch between the dimensions used
vs the buffer address. Two other drivers were also touched.


Patch 1 adds a new helper to return the byte offset into a framebuffer
for the start of the pixel block of the given pixel coordinates.

Patch 2 adds the new helper to return the buffer address based on
clipped coordinates.

Patch 3 switches the sun4i driver to the new helper, and fixes the
luma plane buffer address offset for subsampled YUV formats.

Patch 4 converts the imx/dc driver to use the new helper. This fixes a
mismatch between the programmed coordinates and the buffer address.

Patch 5 replaces the open coded buffer address calculation in the
imx/dcss driver with the new helper. Existing behavior, which might be
wrong, is preserved.


Please help test. The series is only compile tested on my end. The sun4i
changes should revert its behavior to before the drm_fb_dma_get_gem_addr()
was adopted. The imx/dcss changes should not have any behavioral
difference.


Thanks
ChenYu

Chen-Yu Tsai (5):
  drm: Split framebuffer pixel offset calculation from
    drm_fb_dma_get_gem_addr()
  drm/fb-dma-helper: Add drm_fb_dma_get_gem_clipped_addr()
  drm/sun4i: layers: Fix VI buffer address for clipped offsets
  drm/imx/dc: plane: Switch to drm_fb_dma_get_gem_clipped_addr()
  drm/imx/dcss: plane: Switch to drm_fb_dma_get_gem_clipped_addr()

 drivers/gpu/drm/drm_fb_dma_helper.c    | 61 ++++++++++++++------------
 drivers/gpu/drm/drm_framebuffer.c      | 45 +++++++++++++++++++
 drivers/gpu/drm/imx/dc/dc-plane.c      |  4 +-
 drivers/gpu/drm/imx/dcss/dcss-plane.c  | 34 ++++++--------
 drivers/gpu/drm/sun4i/sun8i_ui_layer.c |  2 +-
 drivers/gpu/drm/sun4i/sun8i_vi_layer.c | 16 ++++++-
 include/drm/drm_fb_dma_helper.h        |  4 ++
 include/drm/drm_framebuffer.h          |  3 ++
 8 files changed, 118 insertions(+), 51 deletions(-)

-- 
2.55.0.1032.g73a4cd73de-goog

