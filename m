Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D56AB3EAC75;
	Fri, 28 Aug 2026 08:57:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787907453; cv=none; b=KeMrPjAc64OlwAqIh0KOTyTbc9RPtTiWnJaa9KN8XI9w5RoCS0WGy7q7DnVl0kq53k1yAm9ewlXNJdbBBQL86ynT4atGbRVo+2y/1xnQuUahqGJQOTd3ctTMKaW77Y0ZrAC8orELkWkj0erqtfalKJ/a7AL+WdiarhZLmnNs7XY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787907453; c=relaxed/simple;
	bh=9oZuALq8vSYw5A/D2r1U3soSJveGU994jbKQeL7EI10=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IdAWSh7DJiMY8aKxJMtDFZOhcUSBATyApYzUq7U2jK7wlfuGFH+9j8DzWbUwQh1j1hx1GtAroQZiy4urbwEXDKNBPS0nDqiAaIIKn9f+/MxuNfBIio6WO20isjViwyppmrftpKhLxixBzenAn+mi5PgPPnnzWUCnuy0Lgl2FGoQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YpcghXFJ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YpcghXFJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AD9CF1F000E9;
	Fri, 28 Aug 2026 08:57:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787907451;
	bh=NmNecgl3dEzKBo0fcB6CQFFLk25RGo+EtO4spFjNam0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=YpcghXFJe57+wbV2gel+51M9vulZC77E62BkdAgeapDSkF7bd0ihZ7OA/kf1tX2fD
	 KArAMN4BsdazzdKOY8CdY8NIBHTNsB0bGvKLB9ec2kL27m9oRZh0lfdwB/TYW1pH7+
	 ev9AAxIvYdrYa/s/kD/viEp6mtSZ87mFvKSQiimhB0SOziFOM2hYMl/JSZzR+g+46X
	 8UdSLKYhm2Gu1dJllDel0cl87goNOFsFL0D3p8A1VD4IKmd5r5erzeeySMFCAJAYWM
	 owYQmDgIqtmM0EdJqCtcnwxO2v87AO71D197A5NdpWYDq+bAzLB8mjVyKLR7hCb1PH
	 sFeV5h6DwkTHw==
Date: Fri, 28 Aug 2026 10:57:27 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Sascha Hauer <s.hauer@pengutronix.de>
Cc: Nicolas Dufresne <nicolas.dufresne@collabora.com>, 
	Benjamin Gaignard <benjamin.gaignard@collabora.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
	Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, Andrzej Pietrasiewicz <andrzej.p@collabora.com>, 
	Hans Verkuil <hverkuil@kernel.org>, Chen-Yu Tsai <wenst@chromium.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Lucas Sinn <lucas.sinn@wolfvision.net>, Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, 
	linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 4/7] media: dt-bindings: Add Rockchip RK3588 VPU720 JPEG
 decoder
Message-ID: <20260828-chubby-armadillo-of-discourse-13db7a@quoll>
References: <20260819-rk3588-jpegdec-v1-0-33d74cdf369c@pengutronix.de>
 <20260819-rk3588-jpegdec-v1-4-33d74cdf369c@pengutronix.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260819-rk3588-jpegdec-v1-4-33d74cdf369c@pengutronix.de>

On Wed, Aug 19, 2026 at 12:37:33PM +0200, Sascha Hauer wrote:
> Add a devicetree binding schema for the VPU720 JPEG hardware decoder on
> the RK3588, driven by the hantro V4L2 driver.  Documents the single
> register window (task registers plus the LLP link-table block at offset
> 0x300), the JPEG decode interrupt, the aclk/hclk clocks, the AXI/AHB
> resets, the IOMMU and the power domain.
> 
> The resets and the power domain are required.  The block sits in
> RK3588_PD_VDPU and cannot be reached with the domain off, and the driver
> takes the resets with reset_control_array_get_optional(), so a node
> without them probes and the hard reset fallback in its error recovery
> silently does nothing.
> 
> The IOMMU stays optional.  The driver never refers to it, it is a platform
> integration detail, and rockchip-vpu.yaml does not require it for the
> other codec blocks on this SoC either.
> 
> Assisted-by: Claude:claude-opus-5
> Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
> ---
>  .../bindings/media/rockchip,rk3588-vpu720.yaml     | 93 ++++++++++++++++++++++
>  MAINTAINERS                                        |  1 +
>  2 files changed, 94 insertions(+)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

