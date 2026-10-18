Received: from mta1.migadu.com (out-73.mta1.migadu.com [95.215.58.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70AE43A5443
	for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 17:02:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792342970; cv=none; b=F2vIADlBcH+RraxlSvIEyrlRoE4pEC5NV2U1r7sYH+h4OKvGB1EvaKN0tAkY2XBImmCctogw2TlUlNoQHFvsahP4qTMcUQ6is0t1KTMO3tNl8oOf8vv4tR39Gw+k2WF9Ba0HmvNwqzs3jS0unfsN0189q4myryugRNzvIjkwAM4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792342970; c=relaxed/simple;
	bh=lPEojixQlZu0XsdawGc9KMhpuxaWKjq69w52P0FToho=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=am/MnhV/PbFKKi85XtpkG/CcHyoAr4vW/5A0hs7lYn0IQfe5+9EVUI7epvOuL+DyYiBzxG+LgOY8hWaiu0FXznoW9E/Hv4STKpAUJs1SoLWA9qvlkGAW5fJ6Pfsu9eCE40NR3xNsi++GZ/3h2yW2vvKpk01qTIdFFPblNkDjmck=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=cyL7eESr; arc=none smtp.client-ip=95.215.58.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="cyL7eESr"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=lPEojixQlZu0XsdawGc9KMhpuxaWKjq69w52P0FToho=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1792342966; v=1; x=1792947766;
 b=cyL7eESro6G73kDFE3jvssKSrJuu9t39+Wj1RoTsoE44aLhUHA8vxv5h58JQwukqDdIkw1Wf
 1k7ljhnEbY9poJrvGJ6Ulwh0nY2H0KOBBh0EqooC2g3fgy8Q0jpHSSeLidKrfyOA+SKFB4t1k2W
 wXlNGC4ewHHDQOmEcTO5agIc=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id b4ec3a066f264b08;
	Sun, 18 Oct 2026 17:02:46 +0000
X-Mizu-Trace-ID: b4ec3a066f264b08
X-Migadu-Flow: FLOW_OUT
Message-ID: <94e1b390-903c-4a34-bd9e-9c128b6c1622@linux.dev>
Date: Sun, 18 Oct 2026 18:41:18 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V3 02/10] soundwire: amd: cache ping slave status to avoid
 spurious disconnect on timeout
To: Vijendar Mukunda <Vijendar.Mukunda@amd.com>, vkoul@kernel.org
Cc: broonie@kernel.org, alsa-devel@alsa-project.org,
 yung-chuan.liao@linux.intel.com, Basavaraj.Hiregoudar@amd.com,
 Sunil-kumar.Dommati@amd.com, venkataprasad.potturu@amd.com,
 Syed.SabaKareem@amd.com, Mario.Limonciello@amd.com, Richard.Gong@amd.com,
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261013085111.2009061-1-Vijendar.Mukunda@amd.com>
 <20261013085111.2009061-3-Vijendar.Mukunda@amd.com>
Content-Language: en-US
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
In-Reply-To: <20261013085111.2009061-3-Vijendar.Mukunda@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/13/26 10:49, Vijendar Mukunda wrote:
> Add ping_slave_stat to struct amd_sdw_manager to cache the slave_stat
> from the last successful ping response. On timeout,
> amd_sdw_read_ping_status() returns the cached value (or 0 if no
> successful response yet) to avoid the spurious "no peripherals
> attached" warning from sdw_show_ping_status().

I read this description multiple times and I don't get

a) in what cases you'd get a timeout on a PING command?

and

b) why the cached value of the last ping is a relevant concealment?
You'd still get an error message on a timeout...Maybe this makes the log
"cleaner" but still there was an error in the first place.

> ping_slave_stat is initialised to U32_MAX in probe and reset to
> U32_MAX under msg_lock on entry to the POWER_OFF_MODE resume path,
> before any hardware step that can fail and return early, so that a
> partially-failed resume cannot leave a stale pre-suspend value behind
> for a subsequent ping timeout to report.
> 
> Add lockdep_assert_held() in amd_sdw_read_ping_status() to document
> that the caller must hold msg_lock.

that lockdep_ add is a different improvement that should go in a
separate patch - it's not related to the timeout management and the
suggested use of a cached value.

> Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
> ---
>  drivers/soundwire/amd_manager.c   | 21 ++++++++++++++++++++-
>  include/linux/soundwire/sdw_amd.h |  4 ++++
>  2 files changed, 24 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/soundwire/amd_manager.c b/drivers/soundwire/amd_manager.c
> index fa3f4e797edd..a57b59609bfe 100644
> --- a/drivers/soundwire/amd_manager.c
> +++ b/drivers/soundwire/amd_manager.c
> @@ -453,6 +453,9 @@ static void amd_sdw_read_and_process_ping_status(struct amd_sdw_manager *amd_man
>  				    amd_manager->instance);
>  		return;
>  	}
> +	amd_manager->ping_slave_stat =
> +		FIELD_GET(AMD_SDW_MCP_SLAVE_STAT_0_3, response) |
> +		(FIELD_GET(AMD_SDW_MCP_SLAVE_STAT_4_11, response) << 8);
>  	amd_sdw_process_ping_status(response, amd_manager);
>  	mutex_unlock(&amd_manager->bus.msg_lock);
>  }
> @@ -463,15 +466,19 @@ static u32 amd_sdw_read_ping_status(struct sdw_bus *bus)
>  	u64 response;
>  	u32 slave_stat;
>  
> +	/* Called by sdw_show_ping_status() which holds msg_lock. */
> +	lockdep_assert_held(&bus->msg_lock);
> +
>  	if (amd_sdw_send_cmd_get_resp(amd_manager, 0, 0, &response)) {
>  		dev_err_ratelimited(amd_manager->dev, "SDW%x ping status timeout\n",
>  				    amd_manager->instance);
> -		return 0;
> +		return amd_manager->ping_slave_stat == U32_MAX ? 0 : amd_manager->ping_slave_stat;
>  	}
>  	/* slave status from ping response */
>  	slave_stat = FIELD_GET(AMD_SDW_MCP_SLAVE_STAT_0_3, response);
>  	slave_stat |= FIELD_GET(AMD_SDW_MCP_SLAVE_STAT_4_11, response) << 8;
>  	dev_dbg(amd_manager->dev, "slave_stat:0x%x\n", slave_stat);
> +	amd_manager->ping_slave_stat = slave_stat;
>  	return slave_stat;
>  }
>  
> @@ -1087,6 +1094,7 @@ static int amd_sdw_manager_probe(struct platform_device *pdev)
>  		dev_err(dev, "mmio not found\n");
>  		return -ENOMEM;
>  	}
> +	amd_manager->ping_slave_stat = U32_MAX;
>  	amd_manager->instance = pdata->instance;
>  	amd_manager->mmio = amd_manager->acp_mmio +
>  			    (amd_manager->instance * SDW_MANAGER_REG_OFFSET);
> @@ -1414,6 +1422,17 @@ static int __maybe_unused amd_resume_runtime(struct device *dev)
>  		}
>  	} else if (amd_manager->power_mode_mask & AMD_SDW_POWER_OFF_MODE) {
>  		writel(0x00, amd_manager->acp_mmio + ACP_SW_WAKE_EN(amd_manager->instance));
> +		/*
> +		 * POWER_OFF_MODE tears the bus down completely; invalidate the
> +		 * cached ping status on entry, before any step that can fail and
> +		 * return early, so that a partially-failed resume leaves the first
> +		 * post-resume ping timeout returning 0 rather than stale
> +		 * pre-suspend data. CLK_STOP_MODE leaves peripherals attached, so
> +		 * the cache remains valid there.
> +		 */
> +		mutex_lock(&amd_manager->bus.msg_lock);
> +		amd_manager->ping_slave_stat = U32_MAX;
> +		mutex_unlock(&amd_manager->bus.msg_lock);
>  		if (amd_manager->acp_rev >= ACP70_PCI_REV_ID) {
>  			ret = amd_sdw_host_wake_enable(amd_manager, false);
>  			if (ret)
> diff --git a/include/linux/soundwire/sdw_amd.h b/include/linux/soundwire/sdw_amd.h
> index 470360a2723c..d0e97007e3ff 100644
> --- a/include/linux/soundwire/sdw_amd.h
> +++ b/include/linux/soundwire/sdw_amd.h
> @@ -76,6 +76,9 @@ struct sdw_amd_dai_runtime {
>   * @acp_rev: acp pci device revision id
>   * @clk_stopped: flag set to true when clock is stopped
>   * @power_mode_mask: flag interprets amd SoundWire manager power mode
> + * @ping_slave_stat: cached slave status from the last ping
> + *		     transaction that returned a response;
> + *                   initialised to U32_MAX ("no valid reading yet")
>   * @dai_runtime_array: dai runtime array
>   */
>  struct amd_sdw_manager {
> @@ -105,6 +108,7 @@ struct amd_sdw_manager {
>  	u32 wake_en_mask;
>  	u32 power_mode_mask;
>  	u32 acp_rev;
> +	u32 ping_slave_stat;
>  	bool clk_stopped;
>  
>  	struct sdw_amd_dai_runtime **dai_runtime_array;

