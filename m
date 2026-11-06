Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.11.138.130
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793968061;
	b=ORLjIqYvN9fHLQOOYKAR7EGrr0AJZo7+2aCZlzxwAOX8RhkSBasvabMeuVNd10KsSKyz
	 SPwzK+cZPevNkdUENk7g1ec9kRuKqY6P8GFnhcplI+iAJLJ89z637+I7V/xVQnaUqgDrr
	 UEZBYcoYLrXKsM4mUT0QZOn7zJyl3rNnFuFGiWtozzc+VmuLDZoVlxEkOlNIUH0dD5jQ5
	 We2ABMta+FAGnUPtnUBOFGj9RFouoOs2ggXaX5KHsTi/dTEmkmJFitFRfioa5URw9cqqH
	 Ffp/UOMwEoPXfGoA/Y/DWsMyqi2d0V6Xxbctr+fCMs660oc1TSEJSvrdojxI2nuKLUQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793968061;
	h=DMARC-Filter:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=iC1G3JxUI9CHkJmI4Q8KQjR5+g3muYzWduWPCxUVDN8=;
	b=yuFKmRB4bhs7mNCdFVwO69oPCAn2SXKtuOJBwdfc5xsAp1oiTzP/uyK7O42Y9ttD7U8N
	 KIeBPGbm+jnDl+2ivsMVzXItqUfZ04H3+98XJeMmryQyz9T5iz3yDjgCO/w3x7JdOyUe2
	 GnfADrgBZiALTfs9+1mhjrOP/N7kjaZccfz4+tsTJy1gohdY47dc4Mebxb53l3DVGe521
	 7yx/bdhfnrteeWLwTCXtib9k5goMXQvI1SoAQ4z7tzz6nUnLPU/5Yn003bWpCwWj2HUKO
	 pQvvFxEEhOmOcVjlPJgmXXPRJDSDsSLcaamTqHMugmBS6gmTvIwZPt0dh9nuWXHV/PA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=sntech.de;
	spf=pass smtp.mailfrom=sntech.de;
	dkim=pass header.d=sntech.de header.i=@sntech.de header.a=rsa-sha256 header.s=gloria202408 header.b=EsMB1AEs;
	arc=none smtp.remote-ip=185.11.138.130
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E278606A32F;
	Fri,  6 Nov 2026 12:27:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5E278606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=sntech.de header.i=@sntech.de header.a=rsa-sha256 header.s=gloria202408 header.b=EsMB1AEs
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=iC1G3JxUI9CHkJmI4Q8KQjR5+g3muYzWduWPCxUVDN8=; b=EsMB1AEsVbddRhEkNqtxR4Dku/
	fCd8WF3c9UeC7SvcAmlG/+G5YdOXXAUvdsppn12hLTNUVaxiyhPP2elO38AJpkk28kZhJfjQzzgSs
	AfwrA/Q3BBUQ8AQ9RK5Drp+P6yV/9tE3PIHdGJU0xdxFqcNoFHjbbPWqTpGrTrR8Z/ELyMnl0DlLd
	Jua0m1uTJGsz3uIUAsrBVa4/u5Firs3XRnoyUiiKZdSluT2LLlf7NW3tLTANbAD6R/sAzqp+GbWmK
	9oiEiVsHQ/IJWB41oycCsZX1vojJV6wZRy6RSeZdgNHokRv2kuk40u4H3se5kmXJ9grK4DAVSE8RA
	QrUz+FuQ==;
From: Heiko Stuebner <heiko@sntech.de>
To: Sandy Huang <hjc@rock-chips.com>,
	Andy Yan <andyshrk@163.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Daniel Stone <daniels@collabora.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Daniel Stone <daniel@fooishbar.org>,
	Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
	Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Cc: Heiko Stuebner <heiko@sntech.de>,
	kernel@collabora.com,
	dri-devel@lists.freedesktop.org,
	linux-rockchip@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	Sashiko <sashiko-bot@kernel.org>,
	Igor Paunovic <royalnet026@gmail.com>,
	Sebastian Reichel <sebastian.reichel@collabora.com>
Subject: Re: (subset) [PATCH v6 00/15] Support 10-bit YUV422 and 8/10-bit YUV420 color format on DW HDMI QP
Date: Fri,  6 Nov 2026 13:27:00 +0100
Message-ID: <179396799756.1259812.6287557543031614029.b4-ty@b4>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261105-dw-hdmi-qp-yuv-v6-0-1bb63ef5766e@collabora.com>
References: <20261105-dw-hdmi-qp-yuv-v6-0-1bb63ef5766e@collabora.com>
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
Content-Transfer-Encoding: 8bit


On Thu, 05 Nov 2026 03:00:34 +0200, Cristian Ciocaltea wrote:
> This series extends the output color format support of the Rockchip DW
> HDMI QP controller to cover 10-bit YUV 4:2:2 and 8/10-bit YUV 4:2:0.
> 
> Patches 1, 7 & 15 improve VOP2 robustness on RK3588, helping recover
> from exceptions and preventing random display output glitches observed
> when switching modes that also change the color format, e.g. from RGB to
> YUV 4:2:0 and vice versa.
> 
> [...]

Applied, thanks!

[01/15] dt-bindings: display: vop2: Add missing reset properties
        commit: be1734125b3e1c598c6ce35b4731d80e7acb7329
[02/15] drm/rockchip: vop2: Fix resource leak on vop2_enable() error path
        commit: b571f72ef923c31427f7058dd40a876023e75f32
[03/15] drm/rockchip: vop2: Disable core clocks before dropping runtime PM reference
        commit: ceb90f6ef6d5039189d4be7872eae33a8c635a0a
[04/15] drm/rockchip: vop2: Balance state on atomic_enable() error paths
        commit: b0e41d0609ce58e69ac43a2406bd3d6945454a8a
[05/15] drm/rockchip: vop2: Avoid division by zero when computing max_dclk
        commit: d0b0039a9a579dc4504a9af68e197c47187770dc
[06/15] drm/rockchip: vop2: Fix VOP2_MAX_DCLK_RATE overflow on 32-bit
        commit: 2cc46e2ca621923bd14fce6617000c218ea8b16f
[07/15] drm/rockchip: vop2: Reset AXI and DCLK to improve robustness
        commit: 67a391e50271e4e6cee833d31a7846de6a5717ab
[08/15] drm/rockchip: vop2: Consolidate HDMI PHY PLL clock parent switch
        commit: 99bd1f8ae90101f25c65f544a3dfed2ad01824d3
[09/15] drm/rockchip: vop2: Use TMDS character rate to select DCLK source
        commit: ae98bc626336af920ecaee18c3b1d962b4e40d3e
[10/15] drm/rockchip: vop2: Switch to enum vop_csc_format
        commit: 95642d0e806d2fb97a02daf6caa657009a76ca13
[11/15] drm/bridge: dw-hdmi-qp: Log resolution and refresh rate in atomic_enable()
        commit: c1681020b47bec265f8c5b06de7b321139f3f545
[12/15] drm/rockchip: dw_hdmi_qp: Do not mask error code in atomic_check()
        commit: a6cc582884f78f0fdd6345eba9bbad32ddb5734a
[13/15] drm/rockchip: dw_hdmi_qp: Support 10-bit YUV422 output format
        commit: 6352f4538ef03eda8346e79e4eb63bdead6c9a38
[14/15] drm/rockchip: dw_hdmi_qp: Enable YUV420 output format
        commit: 09b4318c0e8a3d27b1fe6a2765163c1c52e321fb

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>
