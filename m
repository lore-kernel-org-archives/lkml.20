Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4112B4EC640
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 09:07:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788858477; cv=none; b=TsBPejFaTHk0O5XVUbDuJJCg7ZeTMfqTcipFDkGqccEoP98NEbeeEznERLaOOR9GxXP/CDne5WMzhCrUPiLjs+0ADm7aHLcbloW4NjqiC6IgL3SjnH9+q3+4oNHpcn4IsjcX12YNwY5X0Lpkeb7tRVgrh3AtD/RQHgHA7FO25R8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788858477; c=relaxed/simple;
	bh=eI7mygHg5Pp/gueDQ8IVUiOrphdwqMR4YUjhIN93PJE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=cnP61P8LW3MzFBKE95fBw3CHTgONTfoAz1H9p1gy8Fx7q5pCyZG3KaHgFkQNB24x6xB7d448V2djzrQXQqBzN/q4b+MCrUhPVhnrgdYypBjTEympZgftWboUXtcYNwxvcNFZfywnqiL7AgguvXSFAQnj8kl7OMn1Ehh7lMZyVg8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=k0QeJhYd; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="k0QeJhYd"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2db59f54ccfso10163085ad.2
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 02:07:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1788858474; x=1789463274; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=IMi1Y04Cowkyywav7yYVH94ClrmOV8qsvBcUcq9aXsA=;
        b=k0QeJhYdgMlCma/Ayq9mIo27F2fCuGA/3FEPQoS33lXErtFcveGAZDEmgvS2zmblIn
         1AG5WA50xwv3DlR9XS94iJCZGHkmZzNimamlMbedz5rdBdUohUXAvOcjHA4HHY2J/ZoR
         eDVx7NXIz6WR8UigeCl1ClLKdmE0So8OfeLcU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788858474; x=1789463274;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IMi1Y04Cowkyywav7yYVH94ClrmOV8qsvBcUcq9aXsA=;
        b=dkfIifC6PdrbpkL46Z7scxu4rzBcSmwGUJteDHUPXMKmVAudM3e6cheBFr18JuGPyR
         lD5lAyaQIwKxauQsM8HqmluKQ0Z9hOgEajXk4FZEFNDTBjzNh/JYRW6kEWW6O88tJkJ7
         AgYwLNx+wRniovxbb4r9hInKoG8a6pHfNaIKmQUaNt46tIh/1L1cwQeD3P/J1V0z7niU
         8Rr76qIKfm5jTiXMNwMPOauOI1JKFF3SJUyXiuUShPj+5QF48dZdMnhpy6xlNgO+4zyU
         8r3H0MM4InprnWh2PffgJUUjEzX0MRYCq0yecn+ZkA8JRatwXvzipaBGIftOkF6BwsUp
         XDgg==
X-Forwarded-Encrypted: i=1; AKwUvByUHOoIV3i+w4FC5csQ23L9A201YTCC+8pnYxlnvI+bk6XjnVbCZbWTPhHZXebE2IXolAbTL7lM7tlYmBM=@vger.kernel.org
X-Gm-Message-State: AFuF++mWiJD+3ZqUDjchN9t5mpzcxi9Kw/m7usHifcfETSRr1zG6IpbO
	IQht/ObVZmUXpk7ZkpMNbW7AQReuQGqUCFbr3sWNrdskPZdWic1W/jgavF09zf4r6g==
X-Gm-Gg: AYBFou1qYtJKB3C8Dw9KDDP72fys8LQg67H9sBP3xy5gmCyVWRYGsBNGHkFa/XaprKu
	VoRRKNLq2eBlFBvMZzSZ10YZ4Z1aOtzuVvMmPAxPqrBuff7VaIW1/CbWhd6SqR7FQVjeyhWOGb0
	ypp044aimMbT14dNEGNCmrMEfMth+lG+Q/Skv2M73RsjzZUhwSho1zYbBKEjZlXkVue/Qn2/bhl
	iL0P2UQs7OmhHq5dZlroGlZ8gaX+VpCj1mrPIWXYbOtBl9Q0Tglbsw+5RIpRL+fpJ7KQTNh8Yxz
	TbQFqQyLBRX1isEA/CmPaDZU+oObvLV59zhKMKkR0KegGYjdG/SEDI7BTzC8IzX3wzXpNSMVhBZ
	36tyS97xRVJvKPrKyl70UTw7WdEuzksK//48i45MNKNih1JFW6DXzoAiBP4T2fQCLHW3gddU47h
	YR/k8kKs3Mp/G6EcC5IqUAB8RBEL6LLB3hr1r5EcWE3UsC5i/7SwlLlvgouMbAlNHGYz7v4ydwW
	HgjiDiS9fmShwx9K+8K/0/PdqXHp/YZuzbGl+QWZ+oECyI=
X-Received: by 2002:a17:90a:d010:b0:38e:bbf1:de3f with SMTP id 98e67ed59e1d1-39b26272ef9mr45630109a91.12.1788858474627;
        Tue, 08 Sep 2026 02:07:54 -0700 (PDT)
Received: from wenst-7875.tpe.corp.google.com ([2a00:79e0:201d:8:e541:8c2f:4ce9:823a])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b4b72f62esm19718804a91.5.2026.09.08.02.07.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 02:07:53 -0700 (PDT)
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
Subject: [PATCH 0/4] drm: Add and use drm_fb_dma_get_gem_clipped_addr() helper
Date: Tue,  8 Sep 2026 17:07:39 +0800
Message-ID: <20260908090745.1089143-1-wenst@chromium.org>
X-Mailer: git-send-email 2.55.0.979.g7e5102b832-goog
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

This series adds a helper to retrieve the buffer starting address of a
"clipped" framebuffer. This contrasts with drm_fb_dma_get_gem_addr(),
which gives the address of the full buffer.

Some drivers program their hardware with clipped dimensions, so they
should be using the clipped buffer address as well, unless the hardware
can advance the scanout directly. (Side note: many drivers still use
the non-clipped dimensions.)

The sun4i driver was recently incorrectly converted to use the unclipped
drm_fb_dma_get_gem_addr() helper. This broke offsets into subsampled
pixel groups, but also exposed the mismatch between the dimensions used
vs the buffer address.


Patch 1 adds the new helper to return the buffer address based on
clipped coordinates.

Patch 2 switches the sun4i driver to the new helper, and fixes the
luma plane buffer address offset for subsampled YUV formats.

Patch 3 converts the imx/dc driver to use the new helper. This fixes a
mismatch between the programmed coordinates and the buffer address.

Patch 4 replaces the open coded buffer address calculation in the
imx/dcss driver with the new helper.


Please have a look.


Thanks
ChenYu


Chen-Yu Tsai (4):
  drm/fb-dma-helper: Add drm_fb_dma_get_gem_clipped_addr()
  drm/sun4i: layers: Fix VI buffer address for clipped offsets
  drm/imx/dc: plane: Switch to drm_fb_dma_get_gem_clipped_addr()
  drm/imx/dcss: plane: Switch to drm_fb_dma_get_gem_clipped_addr()

 drivers/gpu/drm/drm_fb_dma_helper.c    | 63 +++++++++++++++++++-------
 drivers/gpu/drm/imx/dc/dc-plane.c      |  4 +-
 drivers/gpu/drm/imx/dcss/dcss-plane.c  | 34 ++++++--------
 drivers/gpu/drm/sun4i/sun8i_ui_layer.c |  2 +-
 drivers/gpu/drm/sun4i/sun8i_vi_layer.c | 16 ++++++-
 include/drm/drm_fb_dma_helper.h        |  4 ++
 6 files changed, 83 insertions(+), 40 deletions(-)

-- 
2.55.0.979.g7e5102b832-goog

