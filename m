Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=213.167.242.64
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792491981;
	b=fAMMCbcR5+PlZ24IOkD8IzcEfk4ukvUiNvcbDGDD+SKFTb2jWB2s9LqFxRZkHr4lUICD
	 kr/fgKuwjZqPflHb6zGDwDUZNC7RgEgEEFvZw9yaw7EWKF/TwKXYPp/CDpdop2Wn7r2as
	 6X9ZoQA5GbdKsKuiSPo8qHtoBT31bGgm73X06jpJt0zyB9fhGE2rBF8E62Z0H87qYBpZD
	 kDLarK1evkyCp0Q/VGbUGYIEe+Zk4oKblgvFG34C7iX2k6AOHTO7SINDnqfA6KgHsPyUt
	 +/xYeE0EF0tW1zbhgLpxsRhJjUwp8RSAniZcDlpVD4H1Q679O+FD66PUb0YZLILl4Sg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792491981;
	h=DMARC-Filter:Received:DKIM-Signature:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:From:Content-Language:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=llOrQbjWBwChF/bms+1wpzziugp2meemnoJCfFS+62A=;
	b=E+cSpWrLWNWuzexztt4JbJyrHN5rdv3+/c0HU/ji5M53tiE5NZTJad9t9X5uEf+xixTV
	 Ag9/2gIFwWnQTBSj4y5YpmiPnKuc9qB3OeTt6UMiY3L/pv/5pqZxUsAm8bScClZi8vSp3
	 6LiFLfulXW22PxLiME+IfW3bXPdXoCLTuHoNPd88xJ5QzfaOAOX6j+W0UpTKb7LbZBvqz
	 OCMIFN1k+YaEJLUO/C6ivzJD0TM6Zs9CStG9iRwky2Z7wmNl/y6cb2TZzOLox/W6a3g2H
	 TNlsbXHNzzgPSUhiHY2rB6bSErkiOaksYHCgsA5zF9yZ7FzuHkTLCbgtRXMCus9fX3g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ideasonboard.com;
	spf=pass smtp.mailfrom=ideasonboard.com;
	dkim=pass header.d=ideasonboard.com header.i=@ideasonboard.com header.a=rsa-sha256 header.s=mail header.b=quDRCSqN;
	arc=none smtp.remote-ip=213.167.242.64
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70CDC606A31C;
	Tue, 20 Oct 2026 10:26:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 70CDC606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.a=rsa-sha256 header.s=mail header.b=quDRCSqN
Received: from [192.168.33.26] (185.221.141.235.nat.pool.zt.hu [185.221.141.235])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 1301AC1;
	Tue, 20 Oct 2026 12:24:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1792491851;
	bh=gwnotLY2CWbADHd3XCoiwAKtsuToKWBph9S5GuK8HhA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=quDRCSqNTfAl44e6dLS8J92oKjT6U0e4POPN9/BZPdhSqcauZEkzO1gmt2Y273gHD
	 FC/o5pUkOihqge6Fd8PVVFC9fer6xw2xkx3Fvc/1EdGZELFkdq41CWcjfqzc6YwDjA
	 cNV3TuZUZKbjjxMj2qCQFbTHIjawr/Tb2Ujh5mBA=
Message-ID: <ab5c5b03-0957-4ba4-82a2-56204dd7266d@ideasonboard.com>
Date: Tue, 20 Oct 2026 12:26:14 +0200
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] media: rcar-isp: ispcore: Look at number of planes
 when programming
To: =?UTF-8?Q?Niklas_S=C3=B6derlund?=
 <niklas.soderlund+renesas@ragnatech.se>,
 Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>,
 Jai Luthra <jai.luthra+renesas@ideasonboard.com>,
 =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>,
 =?UTF-8?Q?Barnab=C3=A1s_P=C5=91cze?=
 <barnabas.pocze+renesas@ideasonboard.com>,
 Yusuke Goda <yusuke.goda.sx@renesas.com>,
 Yuya Hamamachi <yuya.hamamachi.sx@renesas.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org
References: <20261019-v4l2-add-nv12-v1-0-4a84736803b6@ragnatech.se>
 <20261019-v4l2-add-nv12-v1-3-4a84736803b6@ragnatech.se>
From: =?UTF-8?Q?Barnab=C3=A1s_P=C5=91cze?= <barnabas.pocze@ideasonboard.com>
Content-Language: en-US, hu-HU
In-Reply-To: <20261019-v4l2-add-nv12-v1-3-4a84736803b6@ragnatech.se>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

2026. 10. 19. 21:35 keltezéssel, Niklas Söderlund írta:
> Instead of expanding a list of formats that uses two planes look at the
> format information directly.
> 
> Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> ---
>   drivers/media/platform/renesas/rcar-isp/core.c | 3 +--
>   1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/media/platform/renesas/rcar-isp/core.c b/drivers/media/platform/renesas/rcar-isp/core.c
> index 3e135e84b75b..cb9d9033d0cf 100644
> --- a/drivers/media/platform/renesas/rcar-isp/core.c
> +++ b/drivers/media/platform/renesas/rcar-isp/core.c
> @@ -126,8 +126,7 @@ static void risp_core_job_run_output(struct rcar_isp_core *core,
>   		mem = vb2_dma_contig_plane_dma_addr(&buf->vb.vb2_buf, 0);
>   		risp_core_write(core, reg, mem);
>   
> -		/* Only NV16 uses 2 planes. */
> -		if (fmt->fmt.pix_mp.pixelformat != V4L2_PIX_FMT_NV16M)
> +		if (fmt->fmt.pix_mp.num_planes != 2)
>   			continue;

Looks reasonable to me. Maybe `< 2` would be more future proof?

Reviewed-by: Barnabás Pőcze <barnabas.pocze+renesas@ideasonboard.com>


>   
>   		reg = ISPCORE_DMA_IMAGE_FRAME_BASE_ADDRESS_COMP1(0, frame);
> 

