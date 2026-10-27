Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.137
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793114379;
	b=g7p/9V++mDXnjcTqoZvZFjwDdICPqVsThn39HkeRE/puEZ10hUr0RpD/PDvVIBaiqrQz
	 I41F8jjiIT/vNDLOhSKusa8hNUi5dU0I2yZzkw6FYYFOHZZmoxx4lkPW7ch+Xy5fTag66
	 ijVqIfV1aCf5gYb8iCCNbn9X/E4NWXW+T+SnyI7hVv6XVhGXY4PV3A7b7QsmZMx4Cz+zn
	 4eFULsZrc8s5CWp9MoBBokrRrWjyLp8kGuzmK2Me+YrBSi3UTki8yqaDY7KaH92Y6n2o4
	 de6ZHfHNewdoUNtZt5JcxvPpfC0GjexmHVylNElShUVRdfsVjoxI4rvZPaqRd1FvDkw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793114379;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Message-ID:Date:MIME-Version:User-Agent:
	 Cc:Subject:To:References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=BOU4MU9brm6f0WifX02Z/bvAfud4ks27NzG9mJq6iqw=;
	b=eUaGJxtDZYSBlu38iEDDFfxJrpOnoGCxVoSoYCBaC/+4ZrZT6QNgCxwhIGbKMAwX/hHE
	 Nu90k1spaAi9QLZ1WVOz3yBdK25btAHTslU9hzn5hb+1SRpCDno6S77gLQlovhl3dE8jt
	 rIM+ScbmtKQQDvvI+OxDePCGSZ50Gy7SrlY5UvRA5N+K1Twta/hM/4Ewx4H+fniR1VALy
	 q7D6Y4l4QJBEK4FJs/LMSy9s5SW8cOPYUp9Q2jx3d/2m4BmVNohNeUv4QYyGN5MaTbimn
	 QTk2bTt4FmRTST50m/yJ+/bE/7SLuhVVoLeKhI+NuwIgjUGTR5d2VczpfJWMldklgDw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b="H4sn/Js1";
	arc=none smtp.remote-ip=95.215.58.137
Received: from mta1.migadu.com (out-137.mta1.migadu.com [95.215.58.137])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F58E606A31B
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 15:19:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1F58E606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=H4sn/Js1
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=gRH2J9qDSbTRcBgfMtEwLxNpHEfkk15phPzF8HTAcsk=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793114377; v=1; x=1793719177;
 b=H4sn/Js150C7xakz76mMDstv6j8Dak7y9kvXGSosDTU0IEFiYEJ5W6A7QH6kavZEUNv62NtD
 dpbz4KZVpM0rQIQg0mt3+ra5+OsHj1FG+/e9zszH7pJFj92zJhGYVkuahjOfw36Qz35QSICHpPb
 QzVp6DM8elk1NlmlAd2zv+QI=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 457dd02c034f76d0;
	Tue, 27 Oct 2026 15:19:37 +0000
X-Mizu-Trace-ID: 457dd02c034f76d0
X-Migadu-Flow: FLOW_OUT
Message-ID: <09d4c786-3551-4dcd-8f09-afa231d18dff@linux.dev>
Date: Tue, 27 Oct 2026 23:19:29 +0800
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
Subject: Re: [PATCH v10 3/6] mmc: core: Add option to keep an eMMC powered on
 at system suspend
To: Ulf Hansson <ulf.hansson@oss.qualcomm.com>, linux-mmc@vger.kernel.org,
 Ulf Hansson <ulfh@kernel.org>
References: <20261027144051.249211-1-ulf.hansson@oss.qualcomm.com>
 <20261027144051.249211-4-ulf.hansson@oss.qualcomm.com>
From: Shawn Lin <shawn.lin@linux.dev>
In-Reply-To: <20261027144051.249211-4-ulf.hansson@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

在 2026/10/27 星期二 22:40, Ulf Hansson 写道:
> The DT property keep-power-in-suspend, allows us to specify whether the
> platform is capable of keeping the power to the card during system suspend.
> Up until now, this has been restricted to be used for SDIO cards only, but
> let's add the initial support to allow this for eMMC too.
> 

Reviewed-by: Shawn Lin <shawn.lin@rock-chips.com>

> Signed-off-by: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
> ---
>   drivers/mmc/core/mmc.c | 24 +++++++++++++++++++++++-
>   1 file changed, 23 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/mmc/core/mmc.c b/drivers/mmc/core/mmc.c
> index a02b04938e1a..c936272bcd81 100644
> --- a/drivers/mmc/core/mmc.c
> +++ b/drivers/mmc/core/mmc.c
> @@ -38,6 +38,7 @@ enum mmc_poweroff_type {
>   	MMC_POWEROFF_SHUTDOWN,
>   	MMC_POWEROFF_UNDERVOLTAGE,
>   	MMC_POWEROFF_UNBIND,
> +	MMC_NO_POWEROFF_SUSPEND,
>   };
>   
>   static const unsigned int tran_exp[] = {
> @@ -2157,6 +2158,15 @@ static int _mmc_suspend(struct mmc_host *host, enum mmc_poweroff_type pm_type)
>   			goto out;
>   	}
>   
> +	if (pm_type == MMC_NO_POWEROFF_SUSPEND) {
> +		if (host->retune_period) {
> +			mmc_retune_timer_stop(host);
> +			mmc_retune_needed(host);
> +		}
> +		mmc_card_set_suspended(host->card);
> +		goto out;
> +	}
> +
>   	if (mmc_card_can_poweroff_notify(host->card) &&
>   	    mmc_host_can_poweroff_notify(host, pm_type))
>   		err = mmc_poweroff_notify(host->card, notify_type);
> @@ -2193,9 +2203,15 @@ static void mmc_remove(struct mmc_host *host)
>    */
>   static int mmc_suspend(struct mmc_host *host)
>   {
> +	enum mmc_poweroff_type pm_type = MMC_POWEROFF_SUSPEND;
>   	int err;
>   
> -	err = _mmc_suspend(host, MMC_POWEROFF_SUSPEND);
> +	if (mmc_card_keep_power(host)) {
> +		pm_runtime_resume(&host->card->dev);
> +		pm_type = MMC_NO_POWEROFF_SUSPEND;
> +	}
> +
> +	err = _mmc_suspend(host, pm_type);
>   	if (!err) {
>   		pm_runtime_disable(&host->card->dev);
>   		pm_runtime_set_suspended(&host->card->dev);
> @@ -2260,7 +2276,13 @@ static int mmc_shutdown(struct mmc_host *host)
>    */
>   static int mmc_resume(struct mmc_host *host)
>   {
> +	if (mmc_card_keep_power(host)) {
> +		pm_runtime_set_active(&host->card->dev);
> +		mmc_card_clr_suspended(host->card);
> +	}
> +
>   	pm_runtime_enable(&host->card->dev);
> +	host->pm_flags &= ~MMC_PM_KEEP_POWER;
>   	return 0;
>   }
>   

