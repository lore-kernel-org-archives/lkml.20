Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793114406;
	b=wV8UMQ1kd8xkjLLDLlF3572hxID66A1vJEY54FF5CY+WJ+K9x7topbGuTmfUDTl6M3yJ
	 KZuzSr4zaDMBkjvrIB+oNsvVZPMdRg/0tWUpRkbARrBRsFlRShJ27rtHYTuMOq6jrtUIa
	 Q8rGJAz8qWnITzUeKet7tQnPobb2TqR1x9PtXzkRy49kef2LDtb1MlX5PCbHtcp6FR6I1
	 rngpNjkdfkPEB1LpZ7ORHCIXXSHEBnrUVkWlECm5kIQiEZ0vEZb0r/YYFzRIXiw2vbjhU
	 2odUNVExSd+31C4qSaKWaoG5Cs1nFS9b8Sd5IGURCxyADAXEIPYq9ErAQK6esitJxSA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793114406;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Message-ID:Date:MIME-Version:User-Agent:
	 Cc:Subject:To:References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=kiI7xiDE1+GC/ICbGmBqxRV2LL1HNZJxrtHdqD0244w=;
	b=BVzvmZZwjttlSmDkyrWFwC3+PJVtt/yjmkFLA7ip2eDqPrGskli/MqcqHUUQ9wQrk2yC
	 bZIYl96AcZxPjxz3jNEo9uIg9KyJIepiOL+Zrga/igutJzCBf5YN7l4Blz3F7PiYTPzuT
	 2CA0dgmZGf66tfliLyoNX5YPCdi0XP/H4el7nzPwHx4YxMsc26HEWxXug08XtH42jCqCj
	 8+kS7sxXTP8kSNxqgadg8dICiFBrW2nHpsdx9o89i7ioB4wmthT8q1AFOcdZhvHPZSBDl
	 HeSN3JKqaz57vjM2iCmY+ty0UGLxAd0wtW29IRgcWiQrcX1x0XwZk1BYxBUj0Hj0KRA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=G2oSc18j;
	arc=none smtp.remote-ip=95.215.58.180
Received: from mta1.migadu.com (out-180.mta1.migadu.com [95.215.58.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75F40606A320
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 15:20:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 75F40606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=G2oSc18j
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=aZBjD2sq6zyiiszpJ6YLlUgF/xtCSZC/jb9y69QAG/0=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793114403; v=1; x=1793719203;
 b=G2oSc18j9E7Mfo1ps5IKbD2WNjYLd+U/2DrZMGXlTCHuGsF7mZjQae7S3UyA7HSDQ0v4Je+6
 L/Fy+si8v6CTB19p3RZScIuoogR1MutwjgMT4Jej66+C/3FxHjlhFa58hl+EE9RNA6+FTjuBGSZ
 u75B3dWEXJU2tb3xb5Cu+9Wg=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id da19e04c926c07a8;
	Tue, 27 Oct 2026 15:20:01 +0000
X-Mizu-Trace-ID: da19e04c926c07a8
X-Migadu-Flow: FLOW_OUT
Message-ID: <2872b4b5-49e3-4801-b96f-f6631aa13a22@linux.dev>
Date: Tue, 27 Oct 2026 23:19:46 +0800
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
Cc: shawn.lin@linux.dev, Adrian Hunter <adrian.hunter@intel.com>,
 Kamal Dasu <kamal.dasu@broadcom.com>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>,
 Oleksij Rempel <o.rempel@pengutronix.de>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v10 5/6] mmc: core: Move reset functions for eMMC
To: Ulf Hansson <ulf.hansson@oss.qualcomm.com>, linux-mmc@vger.kernel.org,
 Ulf Hansson <ulfh@kernel.org>
References: <20261027144051.249211-1-ulf.hansson@oss.qualcomm.com>
 <20261027144051.249211-6-ulf.hansson@oss.qualcomm.com>
From: Shawn Lin <shawn.lin@linux.dev>
In-Reply-To: <20261027144051.249211-6-ulf.hansson@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

在 2026/10/27 星期二 22:40, Ulf Hansson 写道:
> To prepare for a subsequent change and to simplify review, let's move the
> function for resetting the eMMC card a few lines up in the file.
> 

Reviewed-by: Shawn Lin <shawn.lin@rock-chips.com>

> Signed-off-by: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
> ---
>   drivers/mmc/core/mmc.c | 66 +++++++++++++++++++++---------------------
>   1 file changed, 33 insertions(+), 33 deletions(-)
> 
> diff --git a/drivers/mmc/core/mmc.c b/drivers/mmc/core/mmc.c
> index c936272bcd81..d4bf0f25bd74 100644
> --- a/drivers/mmc/core/mmc.c
> +++ b/drivers/mmc/core/mmc.c
> @@ -2271,6 +2271,39 @@ static int mmc_shutdown(struct mmc_host *host)
>   	return err;
>   }
>   
> +static bool mmc_card_can_reset(struct mmc_card *card)
> +{
> +	u8 rst_n_function;
> +
> +	rst_n_function = card->ext_csd.rst_n_function;
> +	return ((rst_n_function & EXT_CSD_RST_N_EN_MASK) == EXT_CSD_RST_N_ENABLED);
> +}
> +
> +static int _mmc_hw_reset(struct mmc_host *host)
> +{
> +	struct mmc_card *card = host->card;
> +
> +	/*
> +	 * In the case of recovery, we can't expect flushing the cache to work
> +	 * always, but we have a go and ignore errors.
> +	 */
> +	_mmc_flush_cache(host);
> +
> +	if ((host->caps & MMC_CAP_HW_RESET) && host->ops->card_hw_reset &&
> +	     mmc_card_can_reset(card)) {
> +		/* If the card accept RST_n signal, send it. */
> +		mmc_set_clock(host, host->f_init);
> +		host->ops->card_hw_reset(host);
> +		/* Set initial state and call mmc_set_ios */
> +		mmc_set_initial_state(host);
> +	} else {
> +		/* Do a brute force power cycle */
> +		mmc_power_cycle(host, card->ocr);
> +		mmc_pwrseq_reset(host);
> +	}
> +	return mmc_init_card(host, card->ocr, card);
> +}
> +
>   /*
>    * Callback for resume.
>    */
> @@ -2319,39 +2352,6 @@ static int mmc_runtime_resume(struct mmc_host *host)
>   	return 0;
>   }
>   
> -static bool mmc_card_can_reset(struct mmc_card *card)
> -{
> -	u8 rst_n_function;
> -
> -	rst_n_function = card->ext_csd.rst_n_function;
> -	return ((rst_n_function & EXT_CSD_RST_N_EN_MASK) == EXT_CSD_RST_N_ENABLED);
> -}
> -
> -static int _mmc_hw_reset(struct mmc_host *host)
> -{
> -	struct mmc_card *card = host->card;
> -
> -	/*
> -	 * In the case of recovery, we can't expect flushing the cache to work
> -	 * always, but we have a go and ignore errors.
> -	 */
> -	_mmc_flush_cache(host);
> -
> -	if ((host->caps & MMC_CAP_HW_RESET) && host->ops->card_hw_reset &&
> -	     mmc_card_can_reset(card)) {
> -		/* If the card accept RST_n signal, send it. */
> -		mmc_set_clock(host, host->f_init);
> -		host->ops->card_hw_reset(host);
> -		/* Set initial state and call mmc_set_ios */
> -		mmc_set_initial_state(host);
> -	} else {
> -		/* Do a brute force power cycle */
> -		mmc_power_cycle(host, card->ocr);
> -		mmc_pwrseq_reset(host);
> -	}
> -	return mmc_init_card(host, card->ocr, card);
> -}
> -
>   /**
>    * _mmc_handle_undervoltage - Handle an undervoltage event for MMC/eMMC devices
>    * @host: MMC host structure

