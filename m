Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5648A526AB2;
	Thu,  1 Oct 2026 15:24:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790868267; cv=pass; b=WcFvBkB3ndX3LITNd29JXwaFRvBkYxyM9k/roK5ggPp5eI1NyzDYdHUWcbdPrNZnpEzwOzTjDV4BuE2yyka8BegEwQuves7TjAQd3WvvQi2gY0K3Ay2F4+pRNUVDrtSJ+/YRT3k/r4UnToB257pEM+l7YJE3V83D3yPA6qbQvE8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790868267; c=relaxed/simple;
	bh=1eFiP54451WXXSImvkn64wyF5tkIYonC92hhp7gZjjk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MUkWTtJ0njiScsrmmVNsjRsL0juNncr7noT9g2Hnw9a7C8mnrRb0hJ0DQu/i4RTkiI1NFj0x5NKnNH8M2MaX7n7jG1OzKiW6YaRDB32wsblpgmV89v4ndFXa2jN1VmMr1Kqi2OdQ704xyJyOHu5HsjvW8hnxu+rL1yNPZOFoc6E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=michael.riesch@collabora.com header.b=kZkmnO/E; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=michael.riesch@collabora.com header.b="kZkmnO/E"
ARC-Seal: i=1; a=rsa-sha256; t=1790868249; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=LMZrb6afw3oTGtMbidMarR4ZugTRd9/Di361HWsDlGRonWw3O0uNRxEmQN6IpwmACv45Cs65Sa8IEgIifjt0Po36UnwZOgsQb050Qkq4VAQx/J7MpO4ph/Eq0mnWAzrBOcJWJkZ0xpYe6GBAJdnsUS278dnCCTyCbI8Rzzg3JfI=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1790868249; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=4N1vT/oJ/8DhtT1QnOcUoxN7apPGAdAxRz++doaHaNM=; 
	b=Zl7zcH4ikkOo6DgnF81jSNvxruHlKQ2lgYBaRZbiY0W8eiLXL1HViVnJgm92YzulCRZKQAF0nOOutiURxbpWWRiRpD9MeSwkZEU7YSmiF+28S9Or3Rg57GTLjjFZAY4b0Bxai3bS2SG51Rd2GDIRw876tcYqsCqZtIHLaJ+WRjg=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=michael.riesch@collabora.com;
	dmarc=pass header.from=<michael.riesch@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1790868249;
	s=zohomail; d=collabora.com; i=michael.riesch@collabora.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=4N1vT/oJ/8DhtT1QnOcUoxN7apPGAdAxRz++doaHaNM=;
	b=kZkmnO/E7PHbg9+/1rlpapaUnes2Lq0Zc4BJm+bzEi7E2kypViTOAtXsaewLunPe
	XLFyvPiSqPjIjxRuQ1ya0KStuFptK8Hi78oAvwx3k64ZHIlMOhnY534YI73hV2rN9BV
	y8AvcTS5nfNXeY69pyAG3VTEjXbD9SGbZmzC3LKI=
Received: by smtp.zohomail.com with SMTPS id 1790868247200454.79215717342186;
	Thu, 1 Oct 2026 08:24:07 -0700 (PDT)
Message-ID: <ead1a8dd-5cac-4fa4-bde5-ef0fadfd70e1@collabora.com>
Date: Thu, 1 Oct 2026 17:24:03 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/5] media: rockchip: rkcif: add a register index for
 the MIPI capture size
To: Amin Gattout <amin.gattout@gmail.com>,
 Mehdi Djait <mehdi.djait@linux.intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20260921-vicap-rk3576-v2-0-0a4582e20c72@gmail.com>
 <20260921-vicap-rk3576-v2-2-0a4582e20c72@gmail.com>
Content-Language: en-US
From: Michael Riesch <michael.riesch@collabora.com>
In-Reply-To: <20260921-vicap-rk3576-v2-2-0a4582e20c72@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External

Hi Amin,

Thanks for the patch!

On 9/21/26 17:29, Amin Gattout wrote:
> The RK3568 and RK3588 variants configure the MIPI capture size in the
> ID_CTRL1 register. The RK3576 has a dedicated ID_SET_SIZE register
> instead.
> 
> Add a register index for the capture size and write it through that
> index, in preparation for the RK3576 support. The RK3568 and RK3588
> mark the index as unsupported, so the write is a no operation for them
> and their behavior is unchanged.
> 
> Signed-off-by: Amin Gattout <amin.gattout@gmail.com>

Reviewed-by: Michael Riesch <michael.riesch@collabora.com>

Best regards,
Michael

> ---
>  drivers/media/platform/rockchip/rkcif/rkcif-capture-mipi.c | 10 ++++++++++
>  drivers/media/platform/rockchip/rkcif/rkcif-regs.h         |  1 +
>  2 files changed, 11 insertions(+)
> 
> diff --git a/drivers/media/platform/rockchip/rkcif/rkcif-capture-mipi.c b/drivers/media/platform/rockchip/rkcif/rkcif-capture-mipi.c
> index bc9518f8db50..e0acb9049ca1 100644
> --- a/drivers/media/platform/rockchip/rkcif/rkcif-capture-mipi.c
> +++ b/drivers/media/platform/rockchip/rkcif/rkcif-capture-mipi.c
> @@ -438,6 +438,7 @@ const struct rkcif_mipi_match_data rkcif_rk3568_vicap_mipi_match_data = {
>  			[RKCIF_MIPI_FRAME1_VLW_Y] = 0x38,
>  			[RKCIF_MIPI_FRAME1_VLW_UV] = 0x40,
>  			[RKCIF_MIPI_CROP_START] = 0xbc,
> +			[RKCIF_MIPI_SET_SIZE] = RKCIF_REGISTER_NOTSUPPORTED,
>  		},
>  		[RKCIF_ID1] = {
>  			[RKCIF_MIPI_CTRL0] = 0x08,
> @@ -451,6 +452,7 @@ const struct rkcif_mipi_match_data rkcif_rk3568_vicap_mipi_match_data = {
>  			[RKCIF_MIPI_FRAME1_VLW_Y] = 0x58,
>  			[RKCIF_MIPI_FRAME1_VLW_UV] = 0x60,
>  			[RKCIF_MIPI_CROP_START] = 0xc0,
> +			[RKCIF_MIPI_SET_SIZE] = RKCIF_REGISTER_NOTSUPPORTED,
>  		},
>  		[RKCIF_ID2] = {
>  			[RKCIF_MIPI_CTRL0] = 0x10,
> @@ -464,6 +466,7 @@ const struct rkcif_mipi_match_data rkcif_rk3568_vicap_mipi_match_data = {
>  			[RKCIF_MIPI_FRAME1_VLW_Y] = 0x78,
>  			[RKCIF_MIPI_FRAME1_VLW_UV] = 0x80,
>  			[RKCIF_MIPI_CROP_START] = 0xc4,
> +			[RKCIF_MIPI_SET_SIZE] = RKCIF_REGISTER_NOTSUPPORTED,
>  		},
>  		[RKCIF_ID3] = {
>  			[RKCIF_MIPI_CTRL0] = 0x18,
> @@ -477,6 +480,7 @@ const struct rkcif_mipi_match_data rkcif_rk3568_vicap_mipi_match_data = {
>  			[RKCIF_MIPI_FRAME1_VLW_Y] = 0x98,
>  			[RKCIF_MIPI_FRAME1_VLW_UV] = 0xa0,
>  			[RKCIF_MIPI_CROP_START] = 0xc8,
> +			[RKCIF_MIPI_SET_SIZE] = RKCIF_REGISTER_NOTSUPPORTED,
>  		},
>  	},
>  	.blocks = {
> @@ -549,6 +553,7 @@ const struct rkcif_mipi_match_data rkcif_rk3588_vicap_mipi_match_data = {
>  			[RKCIF_MIPI_FRAME1_VLW_Y] = RKCIF_REGISTER_NOTSUPPORTED,
>  			[RKCIF_MIPI_FRAME1_VLW_UV] = RKCIF_REGISTER_NOTSUPPORTED,
>  			[RKCIF_MIPI_CROP_START] = 0x8c,
> +			[RKCIF_MIPI_SET_SIZE] = RKCIF_REGISTER_NOTSUPPORTED,
>  		},
>  		[RKCIF_ID1] = {
>  			[RKCIF_MIPI_CTRL0] = 0x08,
> @@ -562,6 +567,7 @@ const struct rkcif_mipi_match_data rkcif_rk3588_vicap_mipi_match_data = {
>  			[RKCIF_MIPI_FRAME1_VLW_Y] = RKCIF_REGISTER_NOTSUPPORTED,
>  			[RKCIF_MIPI_FRAME1_VLW_UV] = RKCIF_REGISTER_NOTSUPPORTED,
>  			[RKCIF_MIPI_CROP_START] = 0x90,
> +			[RKCIF_MIPI_SET_SIZE] = RKCIF_REGISTER_NOTSUPPORTED,
>  		},
>  		[RKCIF_ID2] = {
>  			[RKCIF_MIPI_CTRL0] = 0x10,
> @@ -575,6 +581,7 @@ const struct rkcif_mipi_match_data rkcif_rk3588_vicap_mipi_match_data = {
>  			[RKCIF_MIPI_FRAME1_VLW_Y] = RKCIF_REGISTER_NOTSUPPORTED,
>  			[RKCIF_MIPI_FRAME1_VLW_UV] = RKCIF_REGISTER_NOTSUPPORTED,
>  			[RKCIF_MIPI_CROP_START] = 0x94,
> +			[RKCIF_MIPI_SET_SIZE] = RKCIF_REGISTER_NOTSUPPORTED,
>  		},
>  		[RKCIF_ID3] = {
>  			[RKCIF_MIPI_CTRL0] = 0x18,
> @@ -588,6 +595,7 @@ const struct rkcif_mipi_match_data rkcif_rk3588_vicap_mipi_match_data = {
>  			[RKCIF_MIPI_FRAME1_VLW_Y] = RKCIF_REGISTER_NOTSUPPORTED,
>  			[RKCIF_MIPI_FRAME1_VLW_UV] = RKCIF_REGISTER_NOTSUPPORTED,
>  			[RKCIF_MIPI_CROP_START] = 0x98,
> +			[RKCIF_MIPI_SET_SIZE] = RKCIF_REGISTER_NOTSUPPORTED,
>  		},
>  	},
>  	.blocks = {
> @@ -759,6 +767,8 @@ static int rkcif_mipi_start_streaming(struct rkcif_stream *stream)
>  	rkcif_mipi_stream_write(stream, RKCIF_MIPI_FRAME0_VLW_UV, vlw);
>  	rkcif_mipi_stream_write(stream, RKCIF_MIPI_FRAME1_VLW_UV, vlw);
>  	rkcif_mipi_stream_write(stream, RKCIF_MIPI_CROP_START, 0x0);
> +	rkcif_mipi_stream_write(stream, RKCIF_MIPI_SET_SIZE,
> +				RKCIF_XY_COORD(width, height));
>  	rkcif_mipi_stream_write(stream, RKCIF_MIPI_CTRL1, ctrl1);
>  	rkcif_mipi_stream_write(stream, RKCIF_MIPI_CTRL0, ctrl0);
>  
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

