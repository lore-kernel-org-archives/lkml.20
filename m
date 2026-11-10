Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794295131;
	b=L5valugwbgzMi2sCq+IbpPhWMrZNtJY6cBJx+tki/sdX5tqkFRjcFxszbshzpt9B2hFf
	 u1gPcdUfQr8YmjtqvBSkwevknb7l+UAWlHnMaXRo5PA5PrCPL817sfjVHlwqg4SSqI6VK
	 9Zmb9mzNtkTkmnmYl0VnUYJwdiRYrjdu9blODl4FGfrTNDesg10E2XZlxB8m8YnZFlZ+B
	 DYcpBO8yrMZ6N+XRFjCLVDbwFWlJE7K/hDU+BGBcZxOtuVJAY5mexISu3E0nfcdXyZbGT
	 pwH69+9ypdZZbMyS2/PY7Wu/JW5EO7HEpsTWEabpEL1S/F8hXVbenn4ygm1ddmZzBvw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794295131;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=xf9jjECCHCJTLAEiaGfeK99eKdy6RyIXv+cYpPJ4C2s=;
	b=SsAT5sP1enPiJgGK0HW0qHtfnDO4hSA5Jq3bpHUVvz8nECAdHkWdi+ekB+PbGYVsGgyZ
	 VI9cP9qX6DbzVlZjyaZmUYH8aJgeuwzlRYZoj+CTAQ9BjK98uWTzRBN5+Zz7g33mfxWy6
	 ucp39Uggr1pO6jYdot3Trb7IdUfJkBJQvLmMCYGBda1rDI3+8ynu3R1hJLJlzO5oK7TTN
	 hsCRKBbGuNmoLP1Kj19dKF+vTDoFKHecpDCXhnhYukRe5e7PBxvycVEpS+A0nJbirg6rv
	 e6oUat4Bvank1E1zPFg/l6aW4QpMXGxizxqCwRoGQmHy5/RpwqTP7U4Hzk53+OSx0Ww==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=LXCdf5Oh;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45655606D623
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 07:18:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=LXCdf5Oh
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794295131;
	b=0LCTCimwYOuMsdudMrR/ZAsyxWartm9GN8T+0glBjNV9J0bgXN6cclQ19t0Ks96WWDrH
	 NKJwdsm064BGzjEy2OJoLAyO8qNksFy35izdy1GX9gQSNUmyQNVLs0nBCVXcCq5uWgKkB
	 cii5oOc272gO8eG850ApS5BihOomcbZ/N3RBuS86BLUpb6QK1YowoSgjFMYL8/hwCDieX
	 HBa4Uq9Jalf3O7R5sF8Xdyod6w5863hhEIxNBNKymDywr9UStbAB0uzGjMyRIZmeRZusc
	 LjiLAjHw2cFfgV6dm5QmdWW4UX8fcZJj4HtAd0ECxiHfuKCOFbrMj7Yabrck62YBDmg==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794295131;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=xf9jjECCHCJTLAEiaGfeK99eKdy6RyIXv+cYpPJ4C2s=;
	b=SgPa0D72IGrh28kE1wJYMhLIahJoIqS2GhS3A14Ay1woB691KxkLJkhqBJemPMfBhOM0
	 YoOUOr5CkhGRnHtqrsw0TtHRBZ7QMGyDsUBSekPeG6e+j2caSrSU62VIzML6QfRwbpMjr
	 AV0PYJejr+QNjWPptJEOG6jZDCIEIEnLmlV0Uh1764FMTMTUgBt11OGP9CWt9k0HrJpla
	 q9m80RLKp8V0P911Cq7BO3pZjkrZQzfOlltdIlMf31BZcAyzHuYbZ+LXTKZ2OKaXmrMot
	 SmpH9yoW5mhMOXKwLfIj4K4QpR3v5QuRgmX2rnrD2FL1qdvm4EFSKgPT+ZEB9Gi+quA==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 2B0771F008A6;
	Tue, 10 Nov 2026 07:18:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794295131;
	bh=xf9jjECCHCJTLAEiaGfeK99eKdy6RyIXv+cYpPJ4C2s=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=LXCdf5OhoTAyo43LI6ESJV/6YH2EQlk10j6+fXkgX80i1vn6mwRVfDWSC1DwUQqIG
	 ysqs1DPMYc7Ly0uGAo1gYhfMlrTPxKZ0tAQV+KkZn3BljTD30/2v9zHxXaSD2zV9AN
	 MqOsiff4NNvmsL2mH58n/+rslk6D30aD9FVhdh5VO8GDnKEKePkOVR6xBj+J29AFnH
	 kwM7pr/7XpR9vYJMwN839T6lKbwGXzY35J9+dlnqZVJFwJL4mVG7ydOV0ORTkUxTrL
	 vdwsGDrltwn3CQZ7clUcZOE+qsSa2vNi7k1a2HX0JUcgs4QoPTVEFMsne4IgSLy7jJ
	 K71ox7665UOBg==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id B4686489B8;
	Tue, 10 Nov 2026 07:18:49 +0000 (UTC)
From: Arun Iyengar via B4 Relay <devnull+aiyengar1990.gmail.com@kernel.org>
Date: Tue, 10 Nov 2026 07:18:49 +0000
Subject: [PATCH 1/8] drm/rockchip: vop2: Don't use uninitialised dividers
 on RK3588
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
Message-Id: <20261110-vop2-fixes-v1-1-d336e9dd90d3@gmail.com>
References: <20261110-vop2-fixes-v1-0-d336e9dd90d3@gmail.com>
In-Reply-To: <20261110-vop2-fixes-v1-0-d336e9dd90d3@gmail.com>
To: Sandy Huang <hjc@rock-chips.com>, 
 =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Andy Yan <andyshrk@163.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Sascha Hauer <s.hauer@pengutronix.de>
Cc: dri-devel@lists.freedesktop.org, linux-rockchip@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794295129; l=2150;
 i=aiyengar1990@gmail.com; s=20261110; h=from:subject:message-id;
 bh=+pfuSp1M99YrjvoyOVjakpSrJdneJ0OxzWPX/oIDiA8=;
 b=Ijs7lPZRCA6KdrR800EY6IwB81foe4E/RT1X3/IF8fwrzC3MnaeOGjcesbSuRis4oavX3TfY1
 ArfuXNwoZzbBKfToIyuwcVmpEGLigdMXgYvf1tYYxONrIeTigZJTUNV
X-Developer-Key: i=aiyengar1990@gmail.com; a=ed25519;
 pk=zXpRgUTrhaFe6jLyPqbBy3ccfkj04w0g2690Wv3mg+0=
X-Endpoint-Received: by B4 Relay for aiyengar1990@gmail.com/20261110 with
 auth_id=1480
X-Original-From: Arun Iyengar <aiyengar1990@gmail.com>
Reply-To: aiyengar1990@gmail.com
Content-Transfer-Encoding: 7bit

From: Arun Iyengar <aiyengar1990@gmail.com>

rk3588_calc_cru_cfg() converts all four dividers to their register
encoding with ilog2(), but only sets the ones the interface uses:
dclk_out_div is left uninitialised for HDMI, eDP and DPI, and
if_pixclk_div/if_dclk_div for DP and DPI. The garbage is then written to
RK3588_VP_CLK_CTRL; on an Orange Pi 5 the dclk_out divider of the HDMI
video port reads back as 3 (/8) in every mode.

Start all dividers at 1. dclk_out only feeds DP and MIPI (and HDMI with
DSC, which is not supported), so for the other interfaces keep it at the
dclk_core rate, as the vendor kernel does for HDMI with DSC, instead of
letting it run at the full DCLK rate.

Fixes: 5a028e8f062f ("drm/rockchip: vop2: Add support for rk3588")
Signed-off-by: Arun Iyengar <aiyengar1990@gmail.com>
---
 drivers/gpu/drm/rockchip/rockchip_vop2_reg.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/gpu/drm/rockchip/rockchip_vop2_reg.c b/drivers/gpu/drm/rockchip/rockchip_vop2_reg.c
index c44648e1bc0d..659fd0a3ab63 100644
--- a/drivers/gpu/drm/rockchip/rockchip_vop2_reg.c
+++ b/drivers/gpu/drm/rockchip/rockchip_vop2_reg.c
@@ -1579,6 +1579,15 @@ static unsigned long rk3588_calc_cru_cfg(struct vop2_video_port *vp, int id,
 	unsigned long if_pixclk_rate;
 	int K = 1;
 
+	/*
+	 * Not every interface uses every divider: dclk_out only feeds DP and
+	 * MIPI, the interface dividers are unused for DP. Start from 1 so that
+	 * no divider is left uninitialised when its value is converted below.
+	 */
+	*dclk_out_div = 1;
+	*if_pixclk_div = 1;
+	*if_dclk_div = 1;
+
 	if (vop2_output_if_is_hdmi(id)) {
 		/*
 		 * K = 2: dclk_core = if_pixclk_rate > if_dclk_rate
@@ -1648,6 +1657,9 @@ static unsigned long rk3588_calc_cru_cfg(struct vop2_video_port *vp, int id,
 	}
 
 	*dclk_core_div = dclk_rate / dclk_core_rate;
+	/* An unused dclk_out must not run faster than dclk_core */
+	if (!vop2_output_if_is_dp(id) && !vop2_output_if_is_mipi(id))
+		*dclk_out_div = *dclk_core_div;
 	*if_pixclk_div = ilog2(*if_pixclk_div);
 	*if_dclk_div = ilog2(*if_dclk_div);
 	*dclk_core_div = ilog2(*dclk_core_div);

-- 
2.55.0


