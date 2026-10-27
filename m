Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.65
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793113989;
	b=H046APdmDWcV34KNNxhq8dKykvFku/9gG3ayD7T9s8tmsNsh0BbdOgKK0xVoE/FT/8z8
	 b9E+osK/eVGgL+LVmge0toUqspSrHV/wpMkyBQtWRKxuutWKsKKgVNxg+/dVeBaT0DnEs
	 P+uxxBci6fdEbGbeJDU4X3Ujwju4Ne0B6AM2fboNicUTYT+xxtn6oyYF0cwkl7OV5UpZs
	 /clrGUoxU+2BwQaVngoOpa/ygDccye0TX2BWKliEY3aG2hiq6BsM5hBHd8bvd+X+1e1JJ
	 GbBaoD7D769pE+Yx37u1K64fQdCqKVNykfOhUjuN4XkF4OSzMNLIwJNmp89jGlXIs5Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793113989;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Message-ID:Date:MIME-Version:User-Agent:
	 Cc:Subject:To:References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=A11UcNxxpBKAvqXF0gV8apwz9UitmN7B7nDEh6KsEgg=;
	b=ejsZWZ9UNltfPPnkWTe0LCW8CwfVFRBZIIlYtTydCaVCJQPQP+sWI1++T1o09+5MQdAn
	 huGo6crJdnOj8sdIoIuzkZBISulwFd8lwzOPPnoT5wewwklJ8NPJN+KrWeCTFB3weMK30
	 nJSdmQXRNdgXHcOxQHUjgYmLONRaAW2Wp6Qvj9A5JbO28JRO246XYgltExQhZLr98qtGU
	 mjm8fbx3BKwwmMA8+Zw3fjADN/CYJc3IvOi8lKLoyrsSorRuGO886bTd3hj7a+hixDHvy
	 QWGdsx6XN0FGFHifcWQ/44IT6f1HjjaOVUrQoTE4/NhRFzIHEMtwQkRSlsBRwLLWlJg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=h2zPKxj9;
	arc=none smtp.remote-ip=91.218.175.65
Received: from mta0.migadu.com (out-65.mta0.migadu.com [91.218.175.65])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A5B1606A31E
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 15:13:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2A5B1606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=h2zPKxj9
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=Ot09Lr391s+gD9VJ0ej9HLZWHTp2K0z3o3CPA/71abg=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793113984; v=1; x=1793718784;
 b=h2zPKxj9hJ7iHcYoEOlylHGhe9wqrk7G6TbhNi592kKmxl11nUOM/uxiE7VVwGfy6A+YfTdm
 jR0UwC9PyVOu/vzkL5WW6OpKREhTcRCSENpZxlzsCfnaY2J3nCcmZWHkRVna9k/DYKcNXFq/Zl3
 QDoW2xSetQ2fILNwH3f+QYTY=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 86b784ba5ef37df9;
	Tue, 27 Oct 2026 15:13:04 +0000
X-Mizu-Trace-ID: 86b784ba5ef37df9
X-Migadu-Flow: FLOW_OUT
Message-ID: <a005dddd-a495-45f4-ac43-7d708eea009c@linux.dev>
Date: Tue, 27 Oct 2026 23:12:56 +0800
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
Subject: Re: [PATCH v10 4/6] mmc: core: Split sdio_set_host_pm_flags()
To: Ulf Hansson <ulf.hansson@oss.qualcomm.com>, linux-mmc@vger.kernel.org,
 Ulf Hansson <ulfh@kernel.org>
References: <20261027144051.249211-1-ulf.hansson@oss.qualcomm.com>
 <20261027144051.249211-5-ulf.hansson@oss.qualcomm.com>
From: Shawn Lin <shawn.lin@linux.dev>
In-Reply-To: <20261027144051.249211-5-ulf.hansson@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Ulf,

在 2026/10/27 星期二 22:40, Ulf Hansson 写道:
> To prepare for a subsequent change, let's split up sdio_set_host_pm_flags()
> allowing the second part of it to be used as an internal function for the
> core.
> 
> Signed-off-by: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
> ---
>   drivers/mmc/core/core.c    | 9 +++++++++
>   drivers/mmc/core/core.h    | 1 +
>   drivers/mmc/core/sdio_io.c | 7 +------
>   3 files changed, 11 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/mmc/core/core.c b/drivers/mmc/core/core.c
> index 677e445dc48c..49c0494932cc 100644
> --- a/drivers/mmc/core/core.c
> +++ b/drivers/mmc/core/core.c
> @@ -1422,6 +1422,15 @@ int mmc_handle_undervoltage(struct mmc_host *host)
>   	return host->bus_ops->handle_undervoltage(host);
>   }
>   
> +int mmc_set_host_pm_flags(struct mmc_host *host, mmc_pm_flag_t flags)
> +{
> +	if (flags & ~host->pm_caps)
> +		return -EINVAL;
> +
> +	host->pm_flags |= flags;
> +	return 0;
> +}
> +
>   /*
>    * Assign a mmc bus handler to a host. Only one bus handler may control a
>    * host at any given time.
> diff --git a/drivers/mmc/core/core.h b/drivers/mmc/core/core.h
> index 9be2875608ce..d3a2ff00b18f 100644
> --- a/drivers/mmc/core/core.h
> +++ b/drivers/mmc/core/core.h
> @@ -64,6 +64,7 @@ int mmc_handle_undervoltage(struct mmc_host *host);
>   void mmc_regulator_register_undervoltage_notifier(struct mmc_host *host);
>   void mmc_regulator_unregister_undervoltage_notifier(struct mmc_host *host);
>   void mmc_undervoltage_workfn(struct work_struct *work);
> +int mmc_set_host_pm_flags(struct mmc_host *host, mmc_pm_flag_t flags);
>   
>   static inline void mmc_delay(unsigned int ms)
>   {
> diff --git a/drivers/mmc/core/sdio_io.c b/drivers/mmc/core/sdio_io.c
> index 12716ec0e35d..99f857514b63 100644
> --- a/drivers/mmc/core/sdio_io.c
> +++ b/drivers/mmc/core/sdio_io.c
> @@ -726,12 +726,7 @@ int sdio_set_host_pm_flags(struct sdio_func *func, mmc_pm_flag_t flags)
>   
>   	host = func->card->host;
>   
> -	if (flags & ~host->pm_caps)
> -		return -EINVAL;
> -
> -	/* function suspend methods are serialized, hence no lock needed */

This is an API for sdio function driver, should we preserve this commet 
here?

> -	host->pm_flags |= flags;
> -	return 0;
> +	return mmc_set_host_pm_flags(host, flags);
>   }
>   EXPORT_SYMBOL_GPL(sdio_set_host_pm_flags);
>   

