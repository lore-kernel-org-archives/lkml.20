Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.171.202.116
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793732224;
	b=iJpj5xLV6llFQyLPnqIOnN6cE2mpRs/CEUdjakg3im/PpLFJ8r1WYbUF1YM7U8q/OoF7
	 YRq8nRq7frtNcZ5vWXbcgMNa/dFbMkSKsa3OqPHHUaNa/0u7yKqRJFvJQGAQ5yhu01Aa7
	 fYc0psSyBBrODsK7nmb0t7Sv0McXVumyAw1r90DGwicZpPFaG19MneHMREQVKmadX2uRq
	 yOhoZKptCMO+EfP+R+8+b9/jY+gj0EI/KdQt65rNjEFMzw6t/dCeonbYa42UkbSNvnZeh
	 /sV7XjgGIQTwpbnIDNfzm3aROZpASB46Go7fee1JDViln8chFLiD8sKz4+DiPeFiPHw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793732224;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Last-TLS-Session-Version;
	bh=74r72HRpRA559V/nquUDmiH0Ij5L9Tuuw/PXNIqNzX0=;
	b=mtnbBM8XCNCvOWbVjvVcGj5rA8gUBE5c6qf3VjJ1Ocef2J0sWFLuS/tS6z53FUgfyaGK
	 3EvnfP8JZdT7Sa1eXFpxifpvzFSv+PQQUX6uS+4gWgoZWVtLqVf69SrgyESgVvktgjyHV
	 02OZP5sLiIMxz0dJJGA09k7Con23N1XCPCbJpV6OgE0tqwL1xXedd1gA/zun/se/pWtVs
	 /zwo+ScIQLmdIYWxGWI3TyCRkt+cYkSadzYr5CUU4kpn3dWNfppyXsbeHqo7BgUNm1LF8
	 zEjIILs0UPDEJMQEfe8QJ7f1ktZcMRv32SovANedSZ/abU8nseAvqbtn6eYG17hOQyQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=wJ+kGEGB;
	arc=none smtp.remote-ip=185.171.202.116
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 042D7606A326
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 18:57:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 042D7606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=wJ+kGEGB
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id DDCEFC49F4B;
	Tue,  3 Nov 2026 18:58:05 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 40D226046C;
	Tue,  3 Nov 2026 18:57:01 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 6204A103291D1;
	Tue,  3 Nov 2026 19:56:53 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1793732215; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=74r72HRpRA559V/nquUDmiH0Ij5L9Tuuw/PXNIqNzX0=;
	b=wJ+kGEGBNVZ89WuIxN3rnWCuCDQDU3XXjku/sCN/Ae+9+ekADeymkPJ2P8gPXkDjynwT43
	P7kNuPannoFLtJ/ZI7sgqbUZ23Ayk5Xkm3vPescXb7//nrek1uoVvQhWtl34D50L/NuduK
	olNBXdQLuPF8tDrOpOY89rJcnT6T4ohu7WPbDocXlbHD3MhejxB0ubsb3BiaM9X8pyyxsT
	KXDXjxtjoNUJEY5Eb0LNZDmlNop8VKRn9t8MnTzYwWzuYUam2hICvRkDMQ8NMpjMVzC3er
	fkiTTc4If7meLPfK86Sqz63ZhG++dOnyEl0d/Nnfsk0WI/07WxC4rKS3Y20v1g==
Message-ID: <750783ff-37d0-4b91-beaf-d36c8080a4d3@bootlin.com>
Date: Tue, 3 Nov 2026 19:56:52 +0100
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
Subject: Re: [PATCH net v2 1/5] net: mvneta: lift the per-queue TX rate limits
To: Josef Schlehofer <pepe.schlehofer@gmail.com>, netdev@vger.kernel.org
Cc: marcin.s.wojtas@gmail.com, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com, w@1wt.eu,
 linux-kernel@vger.kernel.org
References: <20261103125021.70845-1-pepe.schlehofer@gmail.com>
 <20261103125021.70845-2-pepe.schlehofer@gmail.com>
Content-Language: en-US
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
In-Reply-To: <20261103125021.70845-2-pepe.schlehofer@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3

Hi,

On 11/3/26 13:50, Josef Schlehofer wrote:
> The per-queue rate limits set by mqprio stay in effect after the
> shaper is turned off.
> 
> mvneta_disable_per_queue_rate_limit() only changes the mode bits in
> MVNETA_TXQ_CMD1_REG. The token buckets keep limiting the TX queues
> with that mode as well, and their refill rate still holds the old
> limit.
> 
> Refill the token buckets of all TX queues at full rate when the rate
> limit is disabled. Deleting the qdisc reaches this code only with the
> next patch.
> 
> Tested on a Turris Omnia (Armada 385) with 10 Mbit/s limits on a
> 100 Mbit/s link. When mqprio was set up again without a shaper, each
> TX queue stayed at 10 Mbit/s. With this patch the link reaches
> 94 Mbit/s.
> 
> Fixes: 2551dc9e398c ("net: mvneta: Add TC traffic shaping offload")
> Signed-off-by: Josef Schlehofer <pepe.schlehofer@gmail.com>

Reviewed-by: Maxime Chevallier <maxime.chevallier@bootlin.com>

Thanks for addressing this,

Maxime

> ---
>  drivers/net/ethernet/marvell/mvneta.c | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/drivers/net/ethernet/marvell/mvneta.c b/drivers/net/ethernet/marvell/mvneta.c
> index ea755cf05b9e..9b9efac2846e 100644
> --- a/drivers/net/ethernet/marvell/mvneta.c
> +++ b/drivers/net/ethernet/marvell/mvneta.c
> @@ -5204,9 +5204,16 @@ static int mvneta_enable_per_queue_rate_limit(struct mvneta_port *pp)
>  static void mvneta_disable_per_queue_rate_limit(struct mvneta_port *pp)
>  {
>  	u32 val = mvreg_read(pp, MVNETA_TXQ_CMD1_REG);
> +	int queue;
>  
>  	val |= (MVNETA_TXQ_CMD1_BW_LIM_SEL_V1 | MVNETA_TXQ_CMD1_BW_LIM_EN);
>  	mvreg_write(pp, MVNETA_TXQ_CMD1_REG, val);
> +
> +	/* The token buckets still limit the queues, refill them at full rate */
> +	val = (1 << MVNETA_TXQ_BUCKET_REFILL_PERIOD_SHIFT) |
> +	      MVNETA_TXQ_BUCKET_REFILL_VALUE_MAX;
> +	for (queue = 0; queue < txq_number; queue++)
> +		mvreg_write(pp, MVNETA_TXQ_BUCKET_REFILL_REG(queue), val);
>  }
>  
>  static int mvneta_setup_queue_rates(struct mvneta_port *pp, int queue,

