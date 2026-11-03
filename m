Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=136.143.188.112
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793711102;
	b=HbmqRcvWdJpDCg+lyPeUQVPChTVRqNqzGRjtLlrrU+KVmF5xpWOUXph6vQzV2iYyBE1A
	 mAXw5LrFtzotUuVnEduopYuWN6r29/MwvOHFG8gH63Au44z+HPQt1Nb307D3fyXjA5TtA
	 LFAFHLJVZMi7xbJihQG8nwVYqFnm1mCA8fDFEP367hCR285WsXjE3W0f1e10SgpVxAGj7
	 0LA0VE8uWGrtXBLfDYNvAb5fxrbZ6oX4R0nCOM2K3XglqUcWeE292fPr9F+Zy0YCKMXzf
	 jHBIihF04GnPQhnCMdDwb6c6sX12dayc+tmed6nNCoziy6hCfJD+QVgqBfxbVnv/Kxg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793711102;
	h=DMARC-Filter:DKIM-Signature:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-ZohoMailClient;
	bh=sdEbF/CdcFTeewgIOfs6NnkfjTHWigrh08gtk/yhio4=;
	b=Hv5YWz/j6xz4wR1o6z7nxt8QpZq68p6333DQnI0gIK2KEbAmhJfP/2QEOcMx1Ek3Iakk
	 jL5DS3CgLRTY9LKe1g1jg0vNkUEzgUnr06kkth+DHocaYDdfDz8YnHJprxbM0F7b1vgNG
	 dD40Iv7iyt9te4QQ8eLbqo/mrovZ3zqI1JQ+iFWrjfKnCE9+Vll8GoEHsouz7gxiz/FZu
	 ugcKRCRJtzPad2Kncd8P+yDb3AssMUUOLoViX21Y8iRB6CeyOmFiIU0aO5HiiRIAXWv+5
	 uz5p/Sx3KIu2S+maoK3uJusimqXOJHgOGXtqcQpxkDjlqPqtjY8pbUxoPPq8wf9G4qg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=collabora.com;
	spf=pass smtp.mailfrom=collabora.com;
	dkim=pass header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=zohomail header.b=TDNlPvDd;
	arc=pass header.oldest-pass=0 smtp.remote-ip=136.143.188.112
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6698C606A327;
	Tue,  3 Nov 2026 13:05:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6698C606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=zohomail header.b=TDNlPvDd
ARC-Seal: i=1; a=rsa-sha256; t=1793711082; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=cH64I3HYKwXkyDHsGMQ08l/OCv9IcVronFRoMHJmLjsCUMLPgeR0slE5LZPuBOGW27/prbUmS9JPhyftHq8Kh1g/toGrkpdwyi/gApWtuenRWMT4GbS2rsTZ7o/mliy4ToZJf/GGPymSEfdOFeFTtcvEMWut3Wxa1CX/m542krw=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1793711082; h=Content-Type:Content-Transfer-Encoding:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To:Cc; 
	bh=sdEbF/CdcFTeewgIOfs6NnkfjTHWigrh08gtk/yhio4=; 
	b=URt9ABoH8lXbOV+Dr5/eiBlcYncKy1wGqRMwEjMEhAlL2b9enS3vcSs0fkW3FsOJ1zUVAVJus7Yyd89F5P70OqpgXtD53B16cuiPLuCJLpf56M5cmWON2DwnDwimn2NSmrfemzsO+QjHJrfM8ch3ogoteObSJzzQSkxRhoNebhU=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=michael.riesch@collabora.com;
	dmarc=pass header.from=<michael.riesch@collabora.com>
DKIM-Signature: a=rsa-sha256; b=TDNlPvDdR52Uynh5TxQXKHhjrfjeJn5CX+S6g8Jyg4tPpnIjEuGOxOtA2kzpcysfvE/P8x3TLbV6a1nsJKMrc3/QTO00V6dXopO7/eO67fy1YNSXl0lVT25i1u0lvUdSj3n1+M5s33Ed7TCZdUd5d9/lv2b8rtPKo94z0HZxDYQ=; c=relaxed/relaxed; s=zohomail; d=collabora.com; v=1; bh=sdEbF/CdcFTeewgIOfs6NnkfjTHWigrh08gtk/yhio4=; h=Content-Description:Content-ID:Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:List-Subscribe:List-Post:List-Owner:List-Id:List-Archive:List-Help:List-Unsubscribe:MIME-Version:Message-ID:Resent-Sender:Resent-Cc:Resent-Date:Resent-To:Reply-To:Resent-Message-ID:Resent-From:Sender:Subject:To:Date:From:Message-Id:Reply-To:Subject:To:Cc;
Received: by smtp.zohomail.com with SMTPS id 1793711079043560.9418675221888;
	Tue, 3 Nov 2026 05:04:39 -0800 (PST)
Message-ID: <2e3ca852-03c1-4825-87ea-0a3decad8d6c@collabora.com>
Date: Tue, 3 Nov 2026 14:04:34 +0100
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
Subject: Re: [PATCH 1/6] media: rockchip: rkcif: mask MIPI interrupts when
 powered
To: Daniel Golle <daniel@makrotopia.org>,
 Mehdi Djait <mehdi.djait@linux.intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Heiko Stuebner
 <heiko@sntech.de>, Hans Verkuil <hverkuil+cisco@kernel.org>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>, linux-media@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <cover.1793702189.git.daniel@makrotopia.org>
 <24332831989fde000959b3d3037333f511b95ece.1793702189.git.daniel@makrotopia.org>
Content-Language: en-US
From: Michael Riesch <michael.riesch@collabora.com>
In-Reply-To: <24332831989fde000959b3d3037333f511b95ece.1793702189.git.daniel@makrotopia.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External

Hi Daniel,

Thanks for the patch.

On 11/3/26 11:45, Daniel Golle wrote:
> The MIPI interrupt enable register comes out of every reset with all
> 27 sources enabled. Of those only the frame end bits are handled, so

That seems highly unusual. How did you analyze this behavior? Feel free
to throw any patch over the fence that reproduces/displays it.

> the line stays asserted at about a thousand interrupts per second
> while the block is powered. The kernel then reports the interrupt as
> unhandled and disables it, after which frame completion only happens
> from the spurious interrupt poll. The poll can also call the handler
> while the block is clock gated.
> 
> Clear the enable register and the status bits after the block has been
> reset and clocked, and after the reset in runtime suspend. Treat any
> status bit that the handler has read and cleared as handled.

Can we configure the interrupt in rkcif_mipi_start_streaming instead?
This feels a bit more natural IMHO.

Best regards,
Michael


> 
> Assisted-by: LLM
> Signed-off-by: Daniel Golle <daniel@makrotopia.org>
> ---
>  .../rockchip/rkcif/rkcif-capture-mipi.c       | 19 +++++++++++++++++++
>  .../rockchip/rkcif/rkcif-capture-mipi.h       |  2 ++
>  .../media/platform/rockchip/rkcif/rkcif-dev.c |  3 +++
>  3 files changed, 24 insertions(+)
> 
> diff --git a/drivers/media/platform/rockchip/rkcif/rkcif-capture-mipi.c b/drivers/media/platform/rockchip/rkcif/rkcif-capture-mipi.c
> index bc9518f8db507..686b995525b9b 100644
> --- a/drivers/media/platform/rockchip/rkcif/rkcif-capture-mipi.c
> +++ b/drivers/media/platform/rockchip/rkcif/rkcif-capture-mipi.c
> @@ -810,6 +810,23 @@ static void rkcif_mipi_set_crop(struct rkcif_stream *stream, u16 left, u16 top)
>  	rkcif_mipi_stream_write(stream, RKCIF_MIPI_CROP_START, val);
>  }
>  
> +void rkcif_mipi_irq_mask(struct rkcif_device *rkcif)
> +{
> +	if (!rkcif->match_data->mipi)
> +		return;
> +
> +	for (unsigned int i = 0; i < rkcif->match_data->mipi->mipi_num; i++) {
> +		struct rkcif_interface *interface =
> +			&rkcif->interfaces[RKCIF_MIPI_BASE + i];
> +
> +		if (!interface->rkcif)
> +			continue;
> +
> +		rkcif_mipi_write(interface, RKCIF_MIPI_INTEN, 0);
> +		rkcif_mipi_write(interface, RKCIF_MIPI_INTSTAT, ~0);
> +	}
> +}
> +
>  irqreturn_t rkcif_mipi_isr(int irq, void *ctx)
>  {
>  	struct device *dev = ctx;
> @@ -823,6 +840,8 @@ irqreturn_t rkcif_mipi_isr(int irq, void *ctx)
>  
>  		intstat = rkcif_mipi_read(interface, RKCIF_MIPI_INTSTAT);
>  		rkcif_mipi_write(interface, RKCIF_MIPI_INTSTAT, intstat);
> +		if (intstat)
> +			ret = IRQ_HANDLED;
>  
>  		for (unsigned int j = 0; j < interface->streams_num; j++) {
>  			struct rkcif_stream *stream = &interface->streams[j];
> diff --git a/drivers/media/platform/rockchip/rkcif/rkcif-capture-mipi.h b/drivers/media/platform/rockchip/rkcif/rkcif-capture-mipi.h
> index 7edaca44f653c..167b43756929b 100644
> --- a/drivers/media/platform/rockchip/rkcif/rkcif-capture-mipi.h
> +++ b/drivers/media/platform/rockchip/rkcif/rkcif-capture-mipi.h
> @@ -21,4 +21,6 @@ void rkcif_mipi_unregister(struct rkcif_device *rkcif);
>  
>  irqreturn_t rkcif_mipi_isr(int irq, void *ctx);
>  
> +void rkcif_mipi_irq_mask(struct rkcif_device *rkcif);
> +
>  #endif
> diff --git a/drivers/media/platform/rockchip/rkcif/rkcif-dev.c b/drivers/media/platform/rockchip/rkcif/rkcif-dev.c
> index be3a174b9aab0..fbc8ed78d99ea 100644
> --- a/drivers/media/platform/rockchip/rkcif/rkcif-dev.c
> +++ b/drivers/media/platform/rockchip/rkcif/rkcif-dev.c
> @@ -281,6 +281,7 @@ static int rkcif_runtime_suspend(struct device *dev)
>  	reset_control_assert(rkcif->reset);
>  	udelay(5);
>  	reset_control_deassert(rkcif->reset);
> +	rkcif_mipi_irq_mask(rkcif);
>  
>  	clk_bulk_disable_unprepare(rkcif->clks_num, rkcif->clks);
>  
> @@ -298,6 +299,8 @@ static int rkcif_runtime_resume(struct device *dev)
>  		return ret;
>  	}
>  
> +	rkcif_mipi_irq_mask(rkcif);
> +
>  	return 0;
>  }
>  

