Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07E9452845E;
	Thu,  1 Oct 2026 15:30:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790868643; cv=pass; b=nz31r/bKdvn6Zg//eR7POgpkeQGjfQHmyU23xPDZWEyPelWLs9Rpr1vdzK6cUvZGXfK7VcZq1IuNWz7JzRAXQ5SC9SqVTw31P4xtD94EzBo7yEBHizwrznl9EsX6G/sF8nLOQuAsOzzODSA2OlpbPOOf3QeT0WFdUqIyAkK+ENI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790868643; c=relaxed/simple;
	bh=yo9SQTE4+2pTz4rAceFRj18cP63ckV20v4/FkKW3mD8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SP0FFZa+bnPmCgfMzUUMrN72FNxPZV4MMHo+bddofc27u8RPqIJ96EVHEVSeiy2Ifzc/UWriRffcbBHhSxrsSt3UrxQV4SU4ZnFEYh/xPeXJ0pgdf1M6La4iWKB/zVekVuDQiZA1QMN2xvz4CrYaX+U+2LjdxhcgAvWjA4XId50=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=michael.riesch@collabora.com header.b=WYHLkrJJ; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=michael.riesch@collabora.com header.b="WYHLkrJJ"
ARC-Seal: i=1; a=rsa-sha256; t=1790868626; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=XUgeEb3gNoxnt1XzcxOvhPvkfSd2suARWDp6D+NlkVMci0aO/Io7dIaDwfbnyzDQeWK7mqu3kbTJX6wqp/u8/ftfWVbnIR0F0OIjxowLRBCwOOQPT0YTFHyLDRW3Ns2i1rMpxAH61L8UwoAKub4QEnpSnPsdt99wkOSKYx28z+Y=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1790868626; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=n4qkix7dZvZjzdXjV58aFtwAsoYI5IyUdaFVc+NF8I8=; 
	b=JYiBANQxSGCKWIBYig/nlk0aZpeNXXy3/puE2qgs15DrgwC4n8AoVuu/6EyhGNpMECW2YpHXoLPEVrmPglOmulUjNVJmSQp4nVj4zSlcMOt7rZ/QAObIaW3n68khA78DIIj3LWzOp2pki8wZyYtVf6R9bk8oSQ74Nm/Mujalpew=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=michael.riesch@collabora.com;
	dmarc=pass header.from=<michael.riesch@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1790868626;
	s=zohomail; d=collabora.com; i=michael.riesch@collabora.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=n4qkix7dZvZjzdXjV58aFtwAsoYI5IyUdaFVc+NF8I8=;
	b=WYHLkrJJQwGtVsWH3fDUgmmHGwySrgSfdE2zx3VPHqehnrwaj9YotOQuX2+f71VK
	pla1RVcYmMb2TjAMBLWX69aaACdq7yYLxALAYZ8EruWEQNs+rh2W4hADofm7Hu+mFhP
	oXADJ+mKOiXFVydxR6jtjB21Ym+ouDFi2jWE5jWc=
Received: by smtp.zohomail.com with SMTPS id 1790868624762694.0539957154162;
	Thu, 1 Oct 2026 08:30:24 -0700 (PDT)
Message-ID: <74d65aee-043e-42a1-bdb8-c1889c4c19a8@collabora.com>
Date: Thu, 1 Oct 2026 17:30:21 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/5] media: rockchip: rkcif: add support for rk3576
 vicap mipi capture
To: Amin Gattout <amin.gattout@gmail.com>,
 Mehdi Djait <mehdi.djait@linux.intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20260921-vicap-rk3576-v2-0-0a4582e20c72@gmail.com>
 <20260921-vicap-rk3576-v2-4-0a4582e20c72@gmail.com>
Content-Language: en-US
From: Michael Riesch <michael.riesch@collabora.com>
In-Reply-To: <20260921-vicap-rk3576-v2-4-0a4582e20c72@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External

Hi Amin,

Thanks for the patch!

On 9/21/26 17:30, Amin Gattout wrote:
> The RK3576 Video Capture (VICAP) unit features a Digital Video Port
> (DVP) and five MIPI CSI-2 capture interfaces. Compared to the RK3588
> variant, the MIPI register blocks are laid out differently (there is
> no block at offset 0x200), the ID_CTRL0 bit layout has changed, and
> the VC/DT filter has moved from ID_CTRL0 to ID_CTRL1. The capture
> size, which the other variants configure in ID_CTRL1, lives in the
> ID_SET_SIZE register.
> 
> On the RK3576 the pixel clock of each MIPI port enters the VICAP
> through a dedicated CRU gate (CLK_VICAP_I0CLK to CLK_VICAP_I4CLK),
> so the variant claims these five clocks in addition to aclk, hclk
> and dclk.
> 
> Signed-off-by: Amin Gattout <amin.gattout@gmail.com>

Reviewed-by: Michael Riesch <michael.riesch@collabora.com>

(and with that, for the complete patch series)

Best regards,
Michael

> ---
>  .../platform/rockchip/rkcif/rkcif-capture-mipi.c   | 140 +++++++++++++++++++++
>  .../platform/rockchip/rkcif/rkcif-capture-mipi.h   |   1 +
>  .../media/platform/rockchip/rkcif/rkcif-common.h   |   2 +-
>  drivers/media/platform/rockchip/rkcif/rkcif-dev.c  |  21 ++++
>  4 files changed, 163 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/media/platform/rockchip/rkcif/rkcif-capture-mipi.c b/drivers/media/platform/rockchip/rkcif/rkcif-capture-mipi.c
> index 432f47a1fc23..53e62d059764 100644
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
> @@ -490,6 +498,138 @@ const struct rkcif_mipi_match_data rkcif_rk3568_vicap_mipi_match_data = {
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
> index f83c8099b78e..08a213438d34 100644
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
> 

