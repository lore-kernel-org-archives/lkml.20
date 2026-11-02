Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.29
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793604046;
	b=JSvjUgrkjWIFO3bUFiMVxWPRut/P5a9nndx//T0XRVR65NO/qcx/9uTSDp9zUfy6JPqG
	 KrYKB+zhjdPpynHtGUwLh/3I7J+4uZ/oZT3jK9VOX0I/fV8C7gXVdS+SuP4zdvWxEnKxn
	 n/3DLO7GaiA7M0DBKliE9sUOKj2jun18rP95LVQEZ4BsXZkj8CCvWBHnpvDSLLMJCJNHc
	 GMQIjkmJSe0GD66mz8WqDg/5ARAX6/ViYRieBveVAYKZmj/9Ztaa5RHKVuwCDwms+UwJr
	 PHRSlK6bCQ0w6+PULD0kRxA7iR+Bhbpel3v0CKpc/RqETEdRnjCa+zLCOQmLEiNWyNw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793604046;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Message-ID:Date:MIME-Version:User-Agent:
	 Cc:Subject:To:References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=Gd+hGEGM2Vnn8hTbClRMrTy8v2VKZQsmXOh+wQ/G2aw=;
	b=VhDihSGjvCjtBR8R27cVlbENf50YSwpqTangVkSX62GUS5HKoPcJVAuGQnstusCKrCCX
	 rlOCTrq+8eC7fPUc9S/fhNsLGMEwOiQVDNVJwPTGP6pRQ08A9TK011MAQsvbjuBBa2qml
	 au4nVfk2b13DdBoNxqUUvq4XX6Mm0kTD1SsqCFasFp/RcvfxoQwu+E3tav8ZPXDnRt5X0
	 Muq1ZxTmS7LPtNdqmHGWxZhUrLELjUlSdEyy32uZT+wxzMdPQEOXHEOxa+eF8W1WOmdoX
	 ggoKuEavjI97Jd4L1ekFW5cCtLjFh/IfnAFyf/58mJrxPOjq9bn+xaxwE7rr1vgdFug==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=oJOUgkX1;
	arc=none smtp.remote-ip=95.215.58.29
Received: from mta1.migadu.com (out-29.mta1.migadu.com [95.215.58.29])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3355606A327
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 07:20:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E3355606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=oJOUgkX1
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=kLN6oli0AthDvizLE+0mZtojUTfv9uqFrmrnHc7+xQM=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793604043; v=1; x=1794208843;
 b=oJOUgkX1YY4tIy5pUlS9AKSxgSlTpiVK1kBfoBOGZQKppSRS243293DhYtr0o2YKj6OfcwxS
 C52K+hI8bWHjAzkR8jDDJmnQJvTvUq2dlHh8Cj4/Dsdhp1TyCPNoEXiyxMgQXYRCN3FUeZkVjOf
 awkKfMHMlz8IaKdjTaLK5I9E=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 20128cc2e629c35a;
	Mon, 02 Nov 2026 07:20:39 +0000
X-Mizu-Trace-ID: 20128cc2e629c35a
X-Migadu-Flow: FLOW_OUT
Message-ID: <e27b69ed-7444-49ac-99d2-dd78f2ef8b9c@linux.dev>
Date: Mon, 2 Nov 2026 15:20:28 +0800
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
Cc: shawn.lin@linux.dev, Ulf Hansson <ulf.hansson@oss.qualcomm.com>,
 Adrian Hunter <adrian.hunter@intel.com>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>,
 Oleksij Rempel <o.rempel@pengutronix.de>, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, Rob Herring <robh@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH v11 6/6] mmc: core: Add support for resetting an eMMC at
 system resume
To: Kamal Dasu <kamal.dasu@broadcom.com>, linux-mmc@vger.kernel.org,
 Ulf Hansson <ulfh@kernel.org>
References: <20261030181034.3811225-1-kamal.dasu@broadcom.com>
 <20261030181034.3811225-7-kamal.dasu@broadcom.com>
From: Shawn Lin <shawn.lin@linux.dev>
In-Reply-To: <20261030181034.3811225-7-kamal.dasu@broadcom.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

在 2026/10/31 星期六 2:10, Kamal Dasu 写道:
> From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
> 
> The DT property reset-card-at-resume specifies that we need to make a reset
> of an eMMC card at system resume, assuming it also has stayed powered on
> during system suspend.
> 
> To implement support for this, let's start by parsing for the new DT
> property and set the new bit MMC_CAP2_RESET_AT_RESUME if it's found. Based
> on the property, we must also set MMC_PM_KEEP_POWER in the pm_flags for the
> host, to keep the eMMC powered on during system suspend.
> 
> Finally, to manage the actual reset during system resume, let's extend
> mmc_resume() to support the needed behaviour.
> 
> The property only makes sense together with keep-power-in-suspend, as the
> card would otherwise be powered off and system suspend is refused. Warn
> about that while parsing the DT properties, to flag the misconfiguration
> upfront. While at it, claim the host around the reset in mmc_resume(), as
> it sends commands to the card.
> 
> Signed-off-by: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
> Co-developed-by: Kamal Dasu <kamal.dasu@broadcom.com>
> Signed-off-by: Kamal Dasu <kamal.dasu@broadcom.com>
> ---
>   drivers/mmc/core/host.c  | 13 +++++++++++++
>   drivers/mmc/core/mmc.c   |  8 ++++++++
>   include/linux/mmc/host.h |  1 +
>   3 files changed, 22 insertions(+)
> 
> diff --git a/drivers/mmc/core/host.c b/drivers/mmc/core/host.c
> index 8e9e61839198..8b38ff45d20f 100644
> --- a/drivers/mmc/core/host.c
> +++ b/drivers/mmc/core/host.c
> @@ -48,6 +48,14 @@ static int mmc_host_class_prepare(struct device *dev)
>   	if (host->bus_ops->pre_suspend)
>   		return host->bus_ops->pre_suspend(host);
>   
> +	/*
> +	 * If it's required to make a reset of the card at system resume, this
> +	 * indirectly also means that we must keep the card powered on during
> +	 * system suspend.
> +	 */
> +	if (host->caps2 & MMC_CAP2_RESET_AT_RESUME)
> +		return mmc_set_host_pm_flags(host, MMC_PM_KEEP_POWER);
> +
>   	return 0;
>   }
>   
> @@ -375,6 +383,11 @@ int mmc_of_parse(struct mmc_host *host)
>   		host->pm_caps |= MMC_PM_KEEP_POWER;
>   	if (device_property_read_bool(dev, "wakeup-source"))
>   		host->pm_caps |= MMC_PM_WAKE_SDIO_IRQ;
> +	if (device_property_read_bool(dev, "reset-card-at-resume")) {
> +		host->caps2 |= MMC_CAP2_RESET_AT_RESUME;
> +		if (!(host->pm_caps & MMC_PM_KEEP_POWER))
> +			dev_warn(dev, "reset-card-at-resume without keep-power-in-suspend, system suspend will fail\n");

No strong opinion on this log, but we set MMC_PM_KEEP_POWER if
reset-card-at-resume is present anyway, could the suspend fail?

> +	}
>   	if (device_property_read_bool(dev, "mmc-ddr-3_3v"))
>   		host->caps |= MMC_CAP_3_3V_DDR;
>   	if (device_property_read_bool(dev, "mmc-ddr-1_8v"))
> diff --git a/drivers/mmc/core/mmc.c b/drivers/mmc/core/mmc.c
> index 026003ba507d..a9e3cf7ae039 100644
> --- a/drivers/mmc/core/mmc.c
> +++ b/drivers/mmc/core/mmc.c
> @@ -2320,6 +2320,14 @@ static int mmc_resume(struct mmc_host *host)
>   	}
>   
>   	pm_runtime_enable(&host->card->dev);
> +
> +	if (mmc_card_keep_power(host) &&
> +	    host->caps2 & MMC_CAP2_RESET_AT_RESUME) {
> +		mmc_claim_host(host);
> +		_mmc_hw_reset(host);
> +		mmc_release_host(host);
> +	}
> +
>   	host->pm_flags &= ~MMC_PM_KEEP_POWER;
>   	return 0;
>   }
> diff --git a/include/linux/mmc/host.h b/include/linux/mmc/host.h
> index 032c018650e0..3c0ea74e3e35 100644
> --- a/include/linux/mmc/host.h
> +++ b/include/linux/mmc/host.h
> @@ -430,6 +430,7 @@ struct mmc_host {
>   	u32			caps2;		/* More host capabilities */
>   
>   #define MMC_CAP2_BOOTPART_NOACC	(1 << 0)	/* Boot partition no access */
> +#define MMC_CAP2_RESET_AT_RESUME BIT(1)	/* Reset the card at system resume */
>   #define MMC_CAP2_FULL_PWR_CYCLE	(1 << 2)	/* Can do full power cycle */
>   #define MMC_CAP2_FULL_PWR_CYCLE_IN_SUSPEND (1 << 3) /* Can do full power cycle in suspend */
>   #define MMC_CAP2_HS200_1_8V_SDR	(1 << 5)        /* can support */

