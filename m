Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794472390;
	b=bGGq3tvAnvbH+geOWoPFw6oiRCEPUNXkOtR5YD7cWp3K/WcjZ3RsXjtmazpUwnqTbxfw
	 nrZ3S9fBzCwVuxs6q3CoUW1c0ir9VFttLGS6mWuBveEo4qSnk4EifxM2/7bAdnMow7nXU
	 e+WKf34/AK41xBAnL6xldhGExJ4SQU0EhjBbNLW2vYssrcZiuD7JUiLCrX+6aueKOHZcK
	 3YwzaEI9RshO2cfgl7XhmJEQaePnIgklx4ZcBiEtWzg6BbSl/z/tt1sU1ZxGTGGKZtUys
	 hrXzTsLmmrkG4RjkSUF5sL6NNFXjXrGwwOAHrHMvRTG21BFvx+5MUdErd7gobFYhT3g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794472390;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=1XKbNH2/KH99YbWTOs529XIXwoRw5zG3NS6qzqt74p8=;
	b=X0J1pTr1cYm6mI5vE7t57sqgsyxaxOulS4XQ3LUFgCjwrWK0PFnMwCqpXwXwvgZKRnTT
	 hg+B9n7SVfWj9qkkV6lkFdVidiZ1EbizgzK/LEHR/RbYM08cyIVnH8mUaMdioNObDdTTN
	 zsAsHSFuluI15btMbkQPn/jS4DNjdZVZUhe/D/NtHxmwgXX+UPP0+kJnkWdF28qB1aSYD
	 CbxxS+EIgaJQ00cv2BGhZRaVP0mUksi5B5/jBZpoYlpuPhD0M06Akg9BAjIjtRJY/NZRc
	 47wXFFfPtVOWJChcbxPXY0KtPZHjRKyvEcvrpWPYEVnmGH67i31Gmt9DX055MtzvWeQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=dvRoKTUe;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1CF2606D2EA
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 08:33:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=dvRoKTUe
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794472390;
	b=waCX05Diok23MLZF/zLOIQ52uvRtHzsQjFes/WBkDtDfzNuh+TriRJIZo17CePoZGK6v
	 ZLmRDFrTyINR4LW8/G/cgtImmex3RtV5RLhGLoaHsvQgIYjIKB9OLmRhE5248LLV9oShz
	 u7xDPVIxtLpxqyMKNfXZpSb74KOEwlHO66vLuxdgOiThXjHnWN7HJ/GMrjD9UsqH9vYgX
	 oOO2qcyfjZQToXDI2Qz2Dlwt9X0itedi5UM5UG5AKb7ERrcJvakcki6xgn39mKWWwCXad
	 frm29jH1JAVBGutPxLOK8VyZZ7IV3XdAePzpAlGN/RaOC2Qphvj3VWy4IOoY0XqaGkQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794472390;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=1XKbNH2/KH99YbWTOs529XIXwoRw5zG3NS6qzqt74p8=;
	b=osh3AJtbSd2jdnf/krpwJM4JHOsxKWklkahrXlmHPipWMoTWt49h6H5ns+3uQyJIah0v
	 7gpS1TcVseQCmD8l9aeJLbvzGTVDxhXp/MKD3TMW1FjRSr6UkPC5li27mCbO4HSW5zUeb
	 R2rANnaz5K3RRfev9f8Dp4IqWlq2SiPMGD30o0uejBtcBTif3ANcyvYjZWwXc5uXkeMT/
	 fEhDeXIBWMGL+yYgfD+IAetTLAoAwUtvI6D6D3F5trcBnpvDLNUs9d47qC5o8dDx8ZCOr
	 jP76Go4U/fE5qRc+oH8cng0ffqsAEA8aRKxzYJo8A4yphjv7BBs7Ne/omFGNDUpJVsg==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id F2C7D1F00A0E;
	Thu, 12 Nov 2026 08:33:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794472390;
	bh=1XKbNH2/KH99YbWTOs529XIXwoRw5zG3NS6qzqt74p8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=dvRoKTUe5c0tIh5y3rUyPYZVEdpcAMzud+1SnMbRvG2AAmBeDsf5rTMCi8jwkiNHW
	 9/LzT0jwXry8lokd0uxJo7vtApVzw/c/CF9IhN5ddPqU12W2VuuwrpDGHSy/feS9pQ
	 mR11l2iStfaRaqgbyB0NxEgnu9M672jK7dDEW7RKqm/uP4ynznRhHNVELvAUok9EoD
	 7d92mxN4bkfooFrzYJ2Eq+KeklZK94PWlW3XM20pDUGAIkROI/r9pEaT09ie5f2BOJ
	 O4lnJJn6spd6h42qQCjVvCV9O2bEJvS/wNCDBjb2vcDGGoRYumEp31mJTAD09OpXWS
	 OAqBQ6dd35Q8A==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id D9CC9493C2;
	Thu, 12 Nov 2026 08:33:06 +0000 (UTC)
From: Arun Iyengar via B4 Relay <devnull+aiyengar1990.gmail.com@kernel.org>
Date: Thu, 12 Nov 2026 08:33:12 +0000
Subject: [PATCH v2 8/9] drm/rockchip: vop2: Keep the other LUT_PORT_SEL
 fields on gamma LUT updates
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
Message-Id: <20261112-vop2-fixes-v2-8-8218c1cf8ac8@gmail.com>
References: <20261112-vop2-fixes-v2-0-8218c1cf8ac8@gmail.com>
In-Reply-To: <20261112-vop2-fixes-v2-0-8218c1cf8ac8@gmail.com>
To: Sandy Huang <hjc@rock-chips.com>, 
 =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Andy Yan <andyshrk@163.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Sascha Hauer <s.hauer@pengutronix.de>
Cc: Piotr Zalewski <pZ010001011111@proton.me>, 
 Chaoyi Chen <chaoyi.chen@rock-chips.com>, dri-devel@lists.freedesktop.org, 
 linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Arun Iyengar <aiyengar1990@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794472385; l=1484;
 i=aiyengar1990@gmail.com; s=20261110; h=from:subject:message-id;
 bh=WoObJhqQCguUZVQZS4V4CMddVbsfxO9PvoIdXFATrrs=;
 b=v7uDMm0D5IZjEF8Q5Kr1g/6NEsROZFDbJNyG8T4DzjiDBiH8wCp30u+EhYBiyuDF763+7vlzQ
 bJgLrzzMHGNCZcwDdpAx1LSPmEsbt8swnR9cpsqp3RGWTLsr2tvXF0n
X-Developer-Key: i=aiyengar1990@gmail.com; a=ed25519;
 pk=zXpRgUTrhaFe6jLyPqbBy3ccfkj04w0g2690Wv3mg+0=
X-Endpoint-Received: by B4 Relay for aiyengar1990@gmail.com/20261110 with
 auth_id=1480
X-Original-From: Arun Iyengar <aiyengar1990@gmail.com>
Reply-To: aiyengar1990@gmail.com
Content-Transfer-Encoding: 7bit

From: Arun Iyengar <aiyengar1990@gmail.com>

On RK3588 the gamma LUT of a video port is written through a window that
GAMMA_AHB_WRITE_SEL in SYS_CTRL_LUT_PORT_SEL selects. The register also
holds the dclk source selection of video ports 0 and 2 and the enable of
the video port 0/1 merge for modes wider than 4096 pixels, which writing
the whole register clears.

Only update the write select field.

Fixes: 4f537776340d ("rockchip/drm: vop2: add support for gamma LUT")
Reviewed-by: Chaoyi Chen <chaoyi.chen@rock-chips.com>
Signed-off-by: Arun Iyengar <aiyengar1990@gmail.com>
---
 drivers/gpu/drm/rockchip/rockchip_drm_vop2.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
index c59e270739b6..259e30ebb9cb 100644
--- a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
+++ b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
@@ -2015,8 +2015,9 @@ static void vop2_crtc_atomic_set_gamma_seamless(struct vop2 *vop2,
 						struct vop2_video_port *vp,
 						struct drm_crtc *crtc)
 {
-	vop2_writel(vop2, RK3568_LUT_PORT_SEL,
-		    FIELD_PREP(RK3588_LUT_PORT_SEL__GAMMA_AHB_WRITE_SEL, vp->id));
+	regmap_update_bits(vop2->map, RK3568_LUT_PORT_SEL,
+			   RK3588_LUT_PORT_SEL__GAMMA_AHB_WRITE_SEL,
+			   FIELD_PREP(RK3588_LUT_PORT_SEL__GAMMA_AHB_WRITE_SEL, vp->id));
 	vop2_vp_dsp_lut_enable(vp);
 	vop2_crtc_write_gamma_lut(vop2, crtc);
 	vop2_vp_dsp_lut_update_enable(vp);

-- 
2.55.0


