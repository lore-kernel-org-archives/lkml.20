Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1D594E50BF;
	Thu, 17 Sep 2026 08:19:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789633186; cv=none; b=sYRqs34x/6qbyYdKQPOs2c3a+u8Qjo5MQamJ3z7BcckS27lGkdN2CmxmM39WJp9Y5JhUhqE1w4HNYFEYOXIITJKPnnWoJ5je+pR1TUvx5l8FL1liaiysxE4XIwT1FGxyImC3MRmEyHhyNKXydFneEX7aPtuQaN4iR2Vtqrf4RZg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789633186; c=relaxed/simple;
	bh=QVeuPbpk81HCqCH5q/JU/r4nmt5LWXXbzEDa3F/FCag=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EdqM/adStPgG9tHTCuu9FcRB9a9bADZCI6YLktdUkEOXG7ELtKPIhSPtVQVzcN+6ytzrkDN+La8XYtNVYnD121emkD3GgELbotPA5VCgKLqvtYIJPfFGJc7lvTA8UxdBG14N4/zIh/Aw7euh8tgZV+Z9004I0YoOOEsExeZxUfs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eEqQTprY; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eEqQTprY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A6C781F000FF;
	Thu, 17 Sep 2026 08:19:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789633181;
	bh=h0zm856Sds7/Jevh8ra9Omnxami6oc8p7GzrqrBXCf8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=eEqQTprYFUMyjt04Fp/eZenarzoghCA1IANYr5WAYQrOHPdmYBrwzJgSHCCtJQQhG
	 ArOIwr2ToN8h3TunD3px2mp+AW+tbdKR+EleenMHV98rlx4ZtD9prTsZUzSFHO556s
	 QLIAJ3nivBrgSPHNdwBnWOL51V/DMvhgwxQRBifOYLN52tNlF0PVDMmjYnT6cgG9Z/
	 daWw6+0Gd/mUBPrWaDGuBwANQO8iGWTFGpDTLugNrexJ1UHR5Pn5vharxpMAQC/nzv
	 xjKeUtCSYkRkfzBXuF7dVDvsuX0affjK0lM93aWflyT2KbYXWZdd6BRgNyaYSOfSrT
	 CzQtXMKTb9d+A==
Date: Thu, 17 Sep 2026 10:19:37 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Sascha Hauer <s.hauer@pengutronix.de>
Cc: Lucas Sinn <lucas.sinn@wolfvision.net>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Heiko Stuebner <heiko@sntech.de>, Philipp Zabel <p.zabel@pengutronix.de>, 
	linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/4] media: dt-bindings: Add Rockchip JPEG decoder
Message-ID: <20260917-dangerous-friendly-booby-d2ebe4@quoll>
References: <20260914-rockchip-jpegdec-v3-0-3583c376d0d2@pengutronix.de>
 <20260914-rockchip-jpegdec-v3-1-3583c376d0d2@pengutronix.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260914-rockchip-jpegdec-v3-1-3583c376d0d2@pengutronix.de>

On Mon, Sep 14, 2026 at 02:19:04PM +0200, Sascha Hauer wrote:
> Add a devicetree binding schema for the JPEG hardware decoder Rockchip
> integrates into a number of its SoCs.  Documents the single register
> window (task registers plus the LLP link-table block at offset 0x300),
> the decode interrupt, the AXI and AHB clocks and resets, the IOMMU and
> the power domain.
> 
> The core is not tied to one SoC.  Downstream it is known as the VDPU720
> and the same block sits on the RK3528, RK3562, RK356x, RK3576, RK3588 and
> RV1126B, with only the clocks, the resets and the power domain differing,
> none of which this schema constrains.  A compatible per SoC is all it
> takes to cover them; the RK3568 and the RK3588 are the two that have been
> tested and are enabled here.
> 
> The resets and the power domain are required.  The block cannot be
> reached with its domain off, and the driver falls back to pulsing the
> reset lines when a frame times out and the in-block soft reset does not
> complete, which a node without them would leave with no way to recover.
> 
> The IOMMU stays optional.  The driver never refers to it, it is a platform
> integration detail, and rockchip-vpu.yaml does not require it for the
> other codec blocks on these SoCs either.
> 
> Assisted-by: Claude:claude-opus-5
> Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
> ---
>  .../bindings/media/rockchip,rk3568-jpegd.yaml      | 92 ++++++++++++++++++++++
>  MAINTAINERS                                        |  8 ++
>  2 files changed, 100 insertions(+)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

