Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D831F4FDA68;
	Fri, 18 Sep 2026 21:10:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789765824; cv=pass; b=JYVAbCuth7JUJzXCA6I9H7V8V44VbEkSOKpwskJrD4+tCtV41PNlBqjCpfzIlQDRbv79LjdRR8XTNnDLbo28axDd7Zhy2X55/FJ3q2h/kl4mHWUX4cBFH1VhQVdA9+g9xZ45eClWX+8x3SMfFv1l90n8Za8eNrmEs3zZB14UviQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789765824; c=relaxed/simple;
	bh=lvibJjpeYfcWAhFauMUh1CLi1IrwBxmtogKCZIsbUnY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OMfSpFEmINfWQxvod+LPTWfSyAmLnd+lhIAJZtewN4/QprQIKwGiikoe0nf6xZl2NkmvLru5+AuDiknAHQrkNiXiGRx1eEgowFDg5RmNBno4t9hqLm7L0bmsIyhLZZ4OPesKCGgYhqR5O8xa5gcu+gfh0CRw4+JrJLeVy9cCkiA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=michael.riesch@collabora.com header.b=CAw8vRhq; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=michael.riesch@collabora.com header.b="CAw8vRhq"
ARC-Seal: i=1; a=rsa-sha256; t=1789765811; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=KfzdaYEuNyj1kkPs9fOrD9qid4ogQyvTEGpM8fmTHQMKKWYKYHGdBq2wV96ygHOHDOMm7fTdcBbCwCWdPLJRuIWqmfRyr8ZLg3aOUud3r40q2bWal2yEKUk2Cv9LYh+yAWXewEIrH8fw1TlKmWXwLhLz2nLQLRYP2Cd1uj9mg1M=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1789765811; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=yCqAAGCRaKyKbA6L0iqL0evYa1gqVXWAMF104PXXbrA=; 
	b=EKuXDJl37KzKXCFBfIEHQdD7kbzkq0Dth2SSMYvKI4Nhq4HGUWrNgxtzHs6vKf6v2KE0RGgn7YQU8aMuYy1Z8Wl0F+StvcjIxEbl7xl3Sxnv5+XfPgqoL3ImQDOgmgOl7qI7hB8ndWcX19pCufDt3IGv9xG7pdPCOUkOdE1EO3A=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=michael.riesch@collabora.com;
	dmarc=pass header.from=<michael.riesch@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1789765811;
	s=zohomail; d=collabora.com; i=michael.riesch@collabora.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=yCqAAGCRaKyKbA6L0iqL0evYa1gqVXWAMF104PXXbrA=;
	b=CAw8vRhqK7EMiCWaD9F3u0A3sjEDJd+rWzJ6K5k3LAZojGdLvpcYqMCLDHRS4eAY
	NpiGQ12g7kKO3eIdR2wfzqQdMBxt7BXR2dVrubzJ7sP4GyDlQE8DUUdufAMHNNfldhE
	4nke1y/oHBNBkBVSA/oRjP3zaL8N2Sx0e9jaRzk8=
Received: by smtp.zohomail.com with SMTPS id 1789765810707942.0672893166937;
	Fri, 18 Sep 2026 14:10:10 -0700 (PDT)
Message-ID: <5fac8efb-f8e6-46d0-8063-49f3914efaf3@collabora.com>
Date: Fri, 18 Sep 2026 23:10:06 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] media: rockchip: rkcif: add support for rk3576 vicap
 mipi capture
To: Amin Gattout <amin.gattout@gmail.com>,
 Mehdi Djait <mehdi.djait@linux.intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20260915-vicap-rk3576-v1-0-d3f5eb58a0b5@gmail.com>
 <20260915-vicap-rk3576-v1-2-d3f5eb58a0b5@gmail.com>
Content-Language: en-US
From: Michael Riesch <michael.riesch@collabora.com>
In-Reply-To: <20260915-vicap-rk3576-v1-2-d3f5eb58a0b5@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External

Hi Amin,

Thanks for the patches. Thrilled to see this going forward!

On 9/15/26 14:27, Amin Gattout wrote:
> The RK3576 Video Capture (VICAP) unit features a Digital Video Port
> (DVP) and five MIPI CSI-2 capture interfaces. Compared to the RK3588
> variant, the MIPI register blocks are laid out differently (there is
> no block at offset 0x200), the ID_CTRL0 bit layout has changed, and
> the VC/DT filter has moved from ID_CTRL0 to ID_CTRL1. The capture
> size, which the other variants configure in ID_CTRL1, lives in the
> new ID_SET_SIZE register.
> 
> Introduce a mipi_ctrl1 callback and a SET_SIZE register index so that
> each variant can declare what ID_CTRL1 holds and where the capture
> size is configured. The RK3568 and RK3588 variants keep their
> previous behavior.

I feel these should go into separate patches, i.e.,
 - one patch introduces the SET_SIZE register
 - one patch introduces the callback
 - one patch introduces RK3576 support.

Apart from this, the changes LGTM!

Best regards,
Michael

> 
> On the RK3576 the pixel clock of each MIPI port enters the VICAP
> through a dedicated CRU gate (CLK_VICAP_I0CLK to CLK_VICAP_I4CLK),
> so the variant claims these five clocks in addition to aclk, hclk
> and dclk.
> 
> Signed-off-by: Amin Gattout <amin.gattout@gmail.com>
> ---
>  .../platform/rockchip/rkcif/rkcif-capture-mipi.c   | 155 ++++++++++++++++++++-
>  .../platform/rockchip/rkcif/rkcif-capture-mipi.h   |   1 +
>  .../media/platform/rockchip/rkcif/rkcif-common.h   |   4 +-
>  drivers/media/platform/rockchip/rkcif/rkcif-dev.c  |  21 +++
>  drivers/media/platform/rockchip/rkcif/rkcif-regs.h |   1 +
>  5 files changed, 180 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/media/platform/rockchip/rkcif/rkcif-capture-mipi.c b/drivers/media/platform/rockchip/rkcif/rkcif-capture-mipi.c
> index bc9518f8db50..53e62d059764 100644
> --- a/drivers/media/platform/rockchip/rkcif/rkcif-capture-mipi.c
> +++ b/drivers/media/platform/rockchip/rkcif/rkcif-capture-mipi.c
> @@ -30,6 +30,14 @@
>  #define RK3568_MIPI_CTRL0_CROP_EN     BIT(5)
>  #define RK3568_MIPI_CTRL0_WRDDR(type) ((type) << 1)
>  
> +#define RK3576_MIPI_CTRL0_HIGH_ALIGN  BIT(11)
> +#define RK3576_MIPI_CTRL0_WRDDR(type) ((type) << 8)
> +#define RK3576_MIPI_CTRL0_PARSE(type) ((type) << 4)
> +#define RK3576_MIPI_CTRL0_DMA_EN      BIT(3)
> +#define RK3576_MIPI_CTRL0_CROP_EN     BIT(1)
> +
> +#define RK3576_MIPI_CTRL1_DT(dt)      ((dt) << 2)
> +
>  #define RK3588_MIPI_CTRL0_DMA_EN      BIT(28)
>  #define RK3588_MIPI_CTRL0_HIGH_ALIGN  BIT(27)
>  #define RK3588_MIPI_CTRL0_WRDDR(type) ((type) << 5)
> @@ -438,6 +446,7 @@ const struct rkcif_mipi_match_data rkcif_rk3568_vicap_mipi_match_data = {
>  			[RKCIF_MIPI_FRAME1_VLW_Y] = 0x38,
>  			[RKCIF_MIPI_FRAME1_VLW_UV] = 0x40,
>  			[RKCIF_MIPI_CROP_START] = 0xbc,
> +			[RKCIF_MIPI_SET_SIZE] = RKCIF_REGISTER_NOTSUPPORTED,
>  		},
>  		[RKCIF_ID1] = {
>  			[RKCIF_MIPI_CTRL0] = 0x08,
> @@ -451,6 +460,7 @@ const struct rkcif_mipi_match_data rkcif_rk3568_vicap_mipi_match_data = {
>  			[RKCIF_MIPI_FRAME1_VLW_Y] = 0x58,
>  			[RKCIF_MIPI_FRAME1_VLW_UV] = 0x60,
>  			[RKCIF_MIPI_CROP_START] = 0xc0,
> +			[RKCIF_MIPI_SET_SIZE] = RKCIF_REGISTER_NOTSUPPORTED,
>  		},
>  		[RKCIF_ID2] = {
>  			[RKCIF_MIPI_CTRL0] = 0x10,
> @@ -464,6 +474,7 @@ const struct rkcif_mipi_match_data rkcif_rk3568_vicap_mipi_match_data = {
>  			[RKCIF_MIPI_FRAME1_VLW_Y] = 0x78,
>  			[RKCIF_MIPI_FRAME1_VLW_UV] = 0x80,
>  			[RKCIF_MIPI_CROP_START] = 0xc4,
> +			[RKCIF_MIPI_SET_SIZE] = RKCIF_REGISTER_NOTSUPPORTED,
>  		},
>  		[RKCIF_ID3] = {
>  			[RKCIF_MIPI_CTRL0] = 0x18,
> @@ -477,6 +488,7 @@ const struct rkcif_mipi_match_data rkcif_rk3568_vicap_mipi_match_data = {
>  			[RKCIF_MIPI_FRAME1_VLW_Y] = 0x98,
>  			[RKCIF_MIPI_FRAME1_VLW_UV] = 0xa0,
>  			[RKCIF_MIPI_CROP_START] = 0xc8,
> +			[RKCIF_MIPI_SET_SIZE] = RKCIF_REGISTER_NOTSUPPORTED,
>  		},
>  	},
>  	.blocks = {
> @@ -486,6 +498,138 @@ const struct rkcif_mipi_match_data rkcif_rk3568_vicap_mipi_match_data = {
>  	},
>  };
>  
> +static u32
> +rkcif_rk3576_mipi_ctrl0(struct rkcif_stream *stream,
> +			const struct rkcif_output_fmt *active_out_fmt)
> +{
> +	u32 ctrl0 = RKCIF_MIPI_CTRL0_CAP_EN | RK3576_MIPI_CTRL0_DMA_EN |
> +		    RK3576_MIPI_CTRL0_CROP_EN;
> +
> +	switch (active_out_fmt->mipi.type) {
> +	case RKCIF_MIPI_TYPE_RAW8:
> +		break;
> +	case RKCIF_MIPI_TYPE_RAW10:
> +		ctrl0 |= RK3576_MIPI_CTRL0_PARSE(0x1);
> +		if (!active_out_fmt->mipi.compact)
> +			ctrl0 |= RK3576_MIPI_CTRL0_WRDDR(0x1);
> +		break;
> +	case RKCIF_MIPI_TYPE_RAW12:
> +		ctrl0 |= RK3576_MIPI_CTRL0_PARSE(0x2);
> +		if (!active_out_fmt->mipi.compact)
> +			ctrl0 |= RK3576_MIPI_CTRL0_WRDDR(0x1);
> +		break;
> +	case RKCIF_MIPI_TYPE_RGB888:
> +		ctrl0 |= RK3576_MIPI_CTRL0_PARSE(0x7);
> +		break;
> +	case RKCIF_MIPI_TYPE_YUV422SP:
> +		ctrl0 |= RK3576_MIPI_CTRL0_WRDDR(0x4);
> +		break;
> +	case RKCIF_MIPI_TYPE_YUV420SP:
> +		ctrl0 |= RK3576_MIPI_CTRL0_WRDDR(0x5);
> +		break;
> +	case RKCIF_MIPI_TYPE_YUV400:
> +		ctrl0 |= RK3576_MIPI_CTRL0_WRDDR(0x3);
> +		break;
> +	default:
> +		break;
> +	}
> +
> +	return ctrl0;
> +}
> +
> +static u32
> +rkcif_rk3576_mipi_ctrl1(struct rkcif_stream *stream,
> +			const struct rkcif_output_fmt *active_out_fmt)
> +{
> +	return RK3576_MIPI_CTRL1_DT(active_out_fmt->mipi.dt);
> +}
> +
> +const struct rkcif_mipi_match_data rkcif_rk3576_vicap_mipi_match_data = {
> +	.mipi_num = 5,
> +	.mipi_ctrl0 = rkcif_rk3576_mipi_ctrl0,
> +	.mipi_ctrl1 = rkcif_rk3576_mipi_ctrl1,
> +	.regs = {
> +		[RKCIF_MIPI_CTRL] = 0x20,
> +		[RKCIF_MIPI_INTEN] = 0x74,
> +		[RKCIF_MIPI_INTSTAT] = 0x78,
> +	},
> +	.regs_id = {
> +		[RKCIF_ID0] = {
> +			[RKCIF_MIPI_CTRL0] = 0x00,
> +			[RKCIF_MIPI_CTRL1] = 0x04,
> +			[RKCIF_MIPI_FRAME0_ADDR_Y] = 0x24,
> +			[RKCIF_MIPI_FRAME0_ADDR_UV] = 0x2c,
> +			[RKCIF_MIPI_FRAME0_VLW_Y] = 0x34,
> +			[RKCIF_MIPI_FRAME0_VLW_UV] = RKCIF_REGISTER_NOTSUPPORTED,
> +			[RKCIF_MIPI_FRAME1_ADDR_Y] = 0x28,
> +			[RKCIF_MIPI_FRAME1_ADDR_UV] = 0x30,
> +			[RKCIF_MIPI_FRAME1_VLW_Y] = RKCIF_REGISTER_NOTSUPPORTED,
> +			[RKCIF_MIPI_FRAME1_VLW_UV] = RKCIF_REGISTER_NOTSUPPORTED,
> +			[RKCIF_MIPI_CROP_START] = 0x90,
> +			[RKCIF_MIPI_SET_SIZE] = 0xa0,
> +		},
> +		[RKCIF_ID1] = {
> +			[RKCIF_MIPI_CTRL0] = 0x08,
> +			[RKCIF_MIPI_CTRL1] = 0x0c,
> +			[RKCIF_MIPI_FRAME0_ADDR_Y] = 0x38,
> +			[RKCIF_MIPI_FRAME0_ADDR_UV] = 0x40,
> +			[RKCIF_MIPI_FRAME0_VLW_Y] = 0x48,
> +			[RKCIF_MIPI_FRAME0_VLW_UV] = RKCIF_REGISTER_NOTSUPPORTED,
> +			[RKCIF_MIPI_FRAME1_ADDR_Y] = 0x3c,
> +			[RKCIF_MIPI_FRAME1_ADDR_UV] = 0x44,
> +			[RKCIF_MIPI_FRAME1_VLW_Y] = RKCIF_REGISTER_NOTSUPPORTED,
> +			[RKCIF_MIPI_FRAME1_VLW_UV] = RKCIF_REGISTER_NOTSUPPORTED,
> +			[RKCIF_MIPI_CROP_START] = 0x94,
> +			[RKCIF_MIPI_SET_SIZE] = 0xa4,
> +		},
> +		[RKCIF_ID2] = {
> +			[RKCIF_MIPI_CTRL0] = 0x10,
> +			[RKCIF_MIPI_CTRL1] = 0x14,
> +			[RKCIF_MIPI_FRAME0_ADDR_Y] = 0x4c,
> +			[RKCIF_MIPI_FRAME0_ADDR_UV] = 0x54,
> +			[RKCIF_MIPI_FRAME0_VLW_Y] = 0x5c,
> +			[RKCIF_MIPI_FRAME0_VLW_UV] = RKCIF_REGISTER_NOTSUPPORTED,
> +			[RKCIF_MIPI_FRAME1_ADDR_Y] = 0x50,
> +			[RKCIF_MIPI_FRAME1_ADDR_UV] = 0x58,
> +			[RKCIF_MIPI_FRAME1_VLW_Y] = RKCIF_REGISTER_NOTSUPPORTED,
> +			[RKCIF_MIPI_FRAME1_VLW_UV] = RKCIF_REGISTER_NOTSUPPORTED,
> +			[RKCIF_MIPI_CROP_START] = 0x98,
> +			[RKCIF_MIPI_SET_SIZE] = 0xa8,
> +		},
> +		[RKCIF_ID3] = {
> +			[RKCIF_MIPI_CTRL0] = 0x18,
> +			[RKCIF_MIPI_CTRL1] = 0x1c,
> +			[RKCIF_MIPI_FRAME0_ADDR_Y] = 0x60,
> +			[RKCIF_MIPI_FRAME0_ADDR_UV] = 0x68,
> +			[RKCIF_MIPI_FRAME0_VLW_Y] = 0x70,
> +			[RKCIF_MIPI_FRAME0_VLW_UV] = RKCIF_REGISTER_NOTSUPPORTED,
> +			[RKCIF_MIPI_FRAME1_ADDR_Y] = 0x64,
> +			[RKCIF_MIPI_FRAME1_ADDR_UV] = 0x6c,
> +			[RKCIF_MIPI_FRAME1_VLW_Y] = RKCIF_REGISTER_NOTSUPPORTED,
> +			[RKCIF_MIPI_FRAME1_VLW_UV] = RKCIF_REGISTER_NOTSUPPORTED,
> +			[RKCIF_MIPI_CROP_START] = 0x9c,
> +			[RKCIF_MIPI_SET_SIZE] = 0xac,
> +		},
> +	},
> +	.blocks = {
> +		{
> +			.offset = 0x100,
> +		},
> +		{
> +			.offset = 0x300,
> +		},
> +		{
> +			.offset = 0x400,
> +		},
> +		{
> +			.offset = 0x500,
> +		},
> +		{
> +			.offset = 0x600,
> +		},
> +	},
> +};
> +
>  static u32
>  rkcif_rk3588_mipi_ctrl0(struct rkcif_stream *stream,
>  			const struct rkcif_output_fmt *active_out_fmt)
> @@ -549,6 +693,7 @@ const struct rkcif_mipi_match_data rkcif_rk3588_vicap_mipi_match_data = {
>  			[RKCIF_MIPI_FRAME1_VLW_Y] = RKCIF_REGISTER_NOTSUPPORTED,
>  			[RKCIF_MIPI_FRAME1_VLW_UV] = RKCIF_REGISTER_NOTSUPPORTED,
>  			[RKCIF_MIPI_CROP_START] = 0x8c,
> +			[RKCIF_MIPI_SET_SIZE] = RKCIF_REGISTER_NOTSUPPORTED,
>  		},
>  		[RKCIF_ID1] = {
>  			[RKCIF_MIPI_CTRL0] = 0x08,
> @@ -562,6 +707,7 @@ const struct rkcif_mipi_match_data rkcif_rk3588_vicap_mipi_match_data = {
>  			[RKCIF_MIPI_FRAME1_VLW_Y] = RKCIF_REGISTER_NOTSUPPORTED,
>  			[RKCIF_MIPI_FRAME1_VLW_UV] = RKCIF_REGISTER_NOTSUPPORTED,
>  			[RKCIF_MIPI_CROP_START] = 0x90,
> +			[RKCIF_MIPI_SET_SIZE] = RKCIF_REGISTER_NOTSUPPORTED,
>  		},
>  		[RKCIF_ID2] = {
>  			[RKCIF_MIPI_CTRL0] = 0x10,
> @@ -575,6 +721,7 @@ const struct rkcif_mipi_match_data rkcif_rk3588_vicap_mipi_match_data = {
>  			[RKCIF_MIPI_FRAME1_VLW_Y] = RKCIF_REGISTER_NOTSUPPORTED,
>  			[RKCIF_MIPI_FRAME1_VLW_UV] = RKCIF_REGISTER_NOTSUPPORTED,
>  			[RKCIF_MIPI_CROP_START] = 0x94,
> +			[RKCIF_MIPI_SET_SIZE] = RKCIF_REGISTER_NOTSUPPORTED,
>  		},
>  		[RKCIF_ID3] = {
>  			[RKCIF_MIPI_CTRL0] = 0x18,
> @@ -588,6 +735,7 @@ const struct rkcif_mipi_match_data rkcif_rk3588_vicap_mipi_match_data = {
>  			[RKCIF_MIPI_FRAME1_VLW_Y] = RKCIF_REGISTER_NOTSUPPORTED,
>  			[RKCIF_MIPI_FRAME1_VLW_UV] = RKCIF_REGISTER_NOTSUPPORTED,
>  			[RKCIF_MIPI_CROP_START] = 0x98,
> +			[RKCIF_MIPI_SET_SIZE] = RKCIF_REGISTER_NOTSUPPORTED,
>  		},
>  	},
>  	.blocks = {
> @@ -741,7 +889,10 @@ static int rkcif_mipi_start_streaming(struct rkcif_stream *stream)
>  	if (match_data->mipi_ctrl0)
>  		ctrl0 = match_data->mipi_ctrl0(stream, active_out_fmt);
>  
> -	ctrl1 = RKCIF_XY_COORD(width, height);
> +	if (match_data->mipi_ctrl1)
> +		ctrl1 = match_data->mipi_ctrl1(stream, active_out_fmt);
> +	else
> +		ctrl1 = RKCIF_XY_COORD(width, height);
>  
>  	int_mask |= RKCIF_MIPI_INT_FRAME0_END(stream->id);
>  	int_mask |= RKCIF_MIPI_INT_FRAME1_END(stream->id);
> @@ -759,6 +910,8 @@ static int rkcif_mipi_start_streaming(struct rkcif_stream *stream)
>  	rkcif_mipi_stream_write(stream, RKCIF_MIPI_FRAME0_VLW_UV, vlw);
>  	rkcif_mipi_stream_write(stream, RKCIF_MIPI_FRAME1_VLW_UV, vlw);
>  	rkcif_mipi_stream_write(stream, RKCIF_MIPI_CROP_START, 0x0);
> +	rkcif_mipi_stream_write(stream, RKCIF_MIPI_SET_SIZE,
> +				RKCIF_XY_COORD(width, height));
>  	rkcif_mipi_stream_write(stream, RKCIF_MIPI_CTRL1, ctrl1);
>  	rkcif_mipi_stream_write(stream, RKCIF_MIPI_CTRL0, ctrl0);
>  
> diff --git a/drivers/media/platform/rockchip/rkcif/rkcif-capture-mipi.h b/drivers/media/platform/rockchip/rkcif/rkcif-capture-mipi.h
> index 7edaca44f653..4e17cbc04b76 100644
> --- a/drivers/media/platform/rockchip/rkcif/rkcif-capture-mipi.h
> +++ b/drivers/media/platform/rockchip/rkcif/rkcif-capture-mipi.h
> @@ -13,6 +13,7 @@
>  #include "rkcif-common.h"
>  
>  extern const struct rkcif_mipi_match_data rkcif_rk3568_vicap_mipi_match_data;
> +extern const struct rkcif_mipi_match_data rkcif_rk3576_vicap_mipi_match_data;
>  extern const struct rkcif_mipi_match_data rkcif_rk3588_vicap_mipi_match_data;
>  
>  int rkcif_mipi_register(struct rkcif_device *rkcif);
> diff --git a/drivers/media/platform/rockchip/rkcif/rkcif-common.h b/drivers/media/platform/rockchip/rkcif/rkcif-common.h
> index 4d9211ba9bda..08a213438d34 100644
> --- a/drivers/media/platform/rockchip/rkcif/rkcif-common.h
> +++ b/drivers/media/platform/rockchip/rkcif/rkcif-common.h
> @@ -27,7 +27,7 @@
>  #include "rkcif-regs.h"
>  
>  #define RKCIF_DRIVER_NAME "rockchip-cif"
> -#define RKCIF_CLK_MAX	  5
> +#define RKCIF_CLK_MAX	  8
>  
>  enum rkcif_format_type {
>  	RKCIF_FMT_TYPE_INVALID,
> @@ -207,6 +207,8 @@ struct rkcif_mipi_match_data {
>  	unsigned int regs_id[RKCIF_ID_MAX][RKCIF_MIPI_ID_REGISTER_MAX];
>  	u32 (*mipi_ctrl0)(struct rkcif_stream *stream,
>  			  const struct rkcif_output_fmt *active_out_fmt);
> +	u32 (*mipi_ctrl1)(struct rkcif_stream *stream,
> +			  const struct rkcif_output_fmt *active_out_fmt);
>  	struct {
>  		unsigned int offset;
>  	} blocks[RKCIF_MIPI_MAX - RKCIF_MIPI_BASE];
> diff --git a/drivers/media/platform/rockchip/rkcif/rkcif-dev.c b/drivers/media/platform/rockchip/rkcif/rkcif-dev.c
> index be3a174b9aab..2a5758776b3e 100644
> --- a/drivers/media/platform/rockchip/rkcif/rkcif-dev.c
> +++ b/drivers/media/platform/rockchip/rkcif/rkcif-dev.c
> @@ -53,6 +53,23 @@ static const struct rkcif_match_data rk3568_vicap_match_data = {
>  	.mipi = &rkcif_rk3568_vicap_mipi_match_data,
>  };
>  
> +static const char *const rk3576_vicap_clks[] = {
> +	"aclk",
> +	"hclk",
> +	"dclk",
> +	"iclk",
> +	"iclk1",
> +	"iclk2",
> +	"iclk3",
> +	"iclk4",
> +};
> +
> +static const struct rkcif_match_data rk3576_vicap_match_data = {
> +	.clks = rk3576_vicap_clks,
> +	.clks_num = ARRAY_SIZE(rk3576_vicap_clks),
> +	.mipi = &rkcif_rk3576_vicap_mipi_match_data,
> +};
> +
>  static const char *const rk3588_vicap_clks[] = {
>  	"aclk",
>  	"hclk",
> @@ -76,6 +93,10 @@ static const struct of_device_id rkcif_plat_of_match[] = {
>  		.compatible = "rockchip,rk3568-vicap",
>  		.data = &rk3568_vicap_match_data,
>  	},
> +	{
> +		.compatible = "rockchip,rk3576-vicap",
> +		.data = &rk3576_vicap_match_data,
> +	},
>  	{
>  		.compatible = "rockchip,rk3588-vicap",
>  		.data = &rk3588_vicap_match_data,
> diff --git a/drivers/media/platform/rockchip/rkcif/rkcif-regs.h b/drivers/media/platform/rockchip/rkcif/rkcif-regs.h
> index 3cf7ee19de30..0460e963b154 100644
> --- a/drivers/media/platform/rockchip/rkcif/rkcif-regs.h
> +++ b/drivers/media/platform/rockchip/rkcif/rkcif-regs.h
> @@ -147,6 +147,7 @@ enum rkcif_mipi_id_register_index {
>  	RKCIF_MIPI_FRAME1_VLW_Y,
>  	RKCIF_MIPI_FRAME1_VLW_UV,
>  	RKCIF_MIPI_CROP_START,
> +	RKCIF_MIPI_SET_SIZE,
>  	RKCIF_MIPI_ID_REGISTER_MAX
>  };
>  
> 

