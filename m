Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 386E351EDED;
	Thu,  1 Oct 2026 15:27:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790868447; cv=pass; b=JVhP0JQ09dcsyJFaSfH0TsC4dX+zjYuLxcKV/vZqBNLRnExFthUwdegYK0py9zCncDHoye9kDjYylJ6Er7Z0xBVv9lMNRVw3UI8ts8yz3zoqeg9Fb8zCfHKlNiQ3pq5y0OoxYSvvRgYlBGnnYlihLjSeues+C/VU2vuX5Lxu6W4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790868447; c=relaxed/simple;
	bh=Lb3B+QIkAuqfmQFi5DKoD7+46Su1sNR1QoB/e875MGo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BXIV4OLMky+1YShA55VpL/vjtbvhdL7F1VQHZdrzxukGU6xFKOjb7KDfS/nL35oadThjg9H5bQNDdsOLUZbisnrfR7iHeeb3N9DRbPH5PRH1l7MFFq0kxQINsOWoMkEtxglWw3iK8W/m3TABW9zhNofamTdoRD/689CP74npDMI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=michael.riesch@collabora.com header.b=XhVKvi1l; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=michael.riesch@collabora.com header.b="XhVKvi1l"
ARC-Seal: i=1; a=rsa-sha256; t=1790868435; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=OEnktabidCH9CwBPTu/794mxiylq6seBdkVzuoNw4O3w/cQD7zxqe45kD0cGduAv9gMdSYNyFtnMcRN6G/jV5URr9cdYKnOIx37GkbSLH8ZmKQQlstExJYoVXCW7fJ4o04d1WlXqnbfalD2GXRIwUgxjzSdouwEmtNeHhKKjWlY=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1790868435; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=9MIFyjTdbFkPYvjiJxno57DESpuh1XxTRuPIy1Ls4Nw=; 
	b=WhlpOvDuJ7OQBbLdZMw8ob73KbnIj723v/yk2oiX/vT1ArFZA9rhHoyb+gemGPupTA2Bhh7FwddnGjDlOIskGGDynKKD+bpxRUSMUXEmVMXVn6ZeaQT4n47zMuNHdbI6vDiOfISew9uxRMvlwrP46P0z+Woe9s0cfJtebIF5tW4=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=michael.riesch@collabora.com;
	dmarc=pass header.from=<michael.riesch@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1790868435;
	s=zohomail; d=collabora.com; i=michael.riesch@collabora.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=9MIFyjTdbFkPYvjiJxno57DESpuh1XxTRuPIy1Ls4Nw=;
	b=XhVKvi1lH9IVaLXIsJRPQ2pm+0agplaqRt+lVAWiFnlozCosrivxrEdQ0Y+PxZqH
	mlNpB3s1JK+YpOr5RdZ5xauQqsJDFYeXecPBoZwVArhkX/glsWKE525oPJPRbL4iNSt
	FW+tNa4HC826FNHUZl1JjfEaofgO8OH7WMI+730M=
Received: by smtp.zohomail.com with SMTPS id 1790868433697191.01182532554424;
	Thu, 1 Oct 2026 08:27:13 -0700 (PDT)
Message-ID: <00deefd9-9e03-4375-bb1f-b41e8f04e43a@collabora.com>
Date: Thu, 1 Oct 2026 17:27:10 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/5] media: rockchip: rkcif: add a callback for the
 MIPI ID_CTRL1 register
To: Amin Gattout <amin.gattout@gmail.com>,
 Mehdi Djait <mehdi.djait@linux.intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20260921-vicap-rk3576-v2-0-0a4582e20c72@gmail.com>
 <20260921-vicap-rk3576-v2-3-0a4582e20c72@gmail.com>
Content-Language: en-US
From: Michael Riesch <michael.riesch@collabora.com>
In-Reply-To: <20260921-vicap-rk3576-v2-3-0a4582e20c72@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External

Hi Amin,

Thanks for the patch!

On 9/21/26 17:29, Amin Gattout wrote:
> The contents of the MIPI ID_CTRL1 register differ between variants. The
> RK3568 and RK3588 hold the capture size there, while the RK3576 uses it
> for the virtual channel and data type filter.
> 
> Let each variant provide a callback that builds the register value, in
> preparation for the RK3576 support. Variants that do not provide one
> keep writing the capture size, so their behavior is unchanged.
> 
> Signed-off-by: Amin Gattout <amin.gattout@gmail.com>

Reviewed-by: Michael Riesch <michael.riesch@collabora.com>

Best regards,
Michael

> ---
>  drivers/media/platform/rockchip/rkcif/rkcif-capture-mipi.c | 5 ++++-
>  drivers/media/platform/rockchip/rkcif/rkcif-common.h       | 2 ++
>  2 files changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/media/platform/rockchip/rkcif/rkcif-capture-mipi.c b/drivers/media/platform/rockchip/rkcif/rkcif-capture-mipi.c
> index e0acb9049ca1..432f47a1fc23 100644
> --- a/drivers/media/platform/rockchip/rkcif/rkcif-capture-mipi.c
> +++ b/drivers/media/platform/rockchip/rkcif/rkcif-capture-mipi.c
> @@ -749,7 +749,10 @@ static int rkcif_mipi_start_streaming(struct rkcif_stream *stream)
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
> diff --git a/drivers/media/platform/rockchip/rkcif/rkcif-common.h b/drivers/media/platform/rockchip/rkcif/rkcif-common.h
> index 4d9211ba9bda..f83c8099b78e 100644
> --- a/drivers/media/platform/rockchip/rkcif/rkcif-common.h
> +++ b/drivers/media/platform/rockchip/rkcif/rkcif-common.h
> @@ -207,6 +207,8 @@ struct rkcif_mipi_match_data {
>  	unsigned int regs_id[RKCIF_ID_MAX][RKCIF_MIPI_ID_REGISTER_MAX];
>  	u32 (*mipi_ctrl0)(struct rkcif_stream *stream,
>  			  const struct rkcif_output_fmt *active_out_fmt);
> +	u32 (*mipi_ctrl1)(struct rkcif_stream *stream,
> +			  const struct rkcif_output_fmt *active_out_fmt);
>  	struct {
>  		unsigned int offset;
>  	} blocks[RKCIF_MIPI_MAX - RKCIF_MIPI_BASE];
> 

