Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 828E050C287;
	Wed, 16 Sep 2026 15:21:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789572120; cv=none; b=TZa96XtHkc37L/djQHG+V4M2851EsWMPNN+RZ4PRQSKrP9OQvWowDO6i9H61torWNteLAn6I69OOiW5k6qDcxiK6ViFjq6WwbLROWDod81LL19R8FfWG+IgUgvQgVnK75XEP2cJdmcs7UAU1Zpt3hk2Cc6pR/hJzLP8oasdK7BM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789572120; c=relaxed/simple;
	bh=QIyy0N04LfkgJYMMXXUHPODj1i7q6YwpTVR/0YmYeu8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FTPGvavTwq47yThjQPPw5Y6Jyl2aB3nyxhL+FH3FdBgIuhIY9+nvoElVNIixOY4cSReWhWvbKWW519S7umMJWMLhBKqPxkQ6QyTF6szTs8oeT0SGE2wu85SnH9OD0FPiXOSKc+xGjfFR4FwkU/1T4/V4LGXjMduIA0GrPDw9FBY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fQ/mnoAy; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fQ/mnoAy"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6C7101F00893;
	Wed, 16 Sep 2026 15:21:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789572113;
	bh=TlsZEJAiiH82j/Mx6kTCN96sqcmaljLGoEMImAFW9O8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=fQ/mnoAyoegvsCX7j37IkLXN5iVwvdZmpbmbNJrj/n2UusJHKt+UBNdAoo2EIvRrC
	 X63V26CHTn/jqU/9nngXJYpQyvPL87Km1zRSfxgiLw8XNY5O4khKbDWHIJapHhHQi0
	 k1h5GDt+LUEHS/7kCgs+msRgSbVPmcMgBABUyVEORHX+tvRY3kCzOximZbYNzYrkOh
	 ZKCA0GXMEJVpN35gTBPIK1GrMc4zdd0l3qtVqu0xtOSlpg6Iv99HEh6r33T8JamoVk
	 SUbnwCX7p7vxdAAS7Mk5rKH4eApvTeYNGgqi8vUv4b3NG9N+sqF595j8vWKjc4MCm4
	 PtoiYI26DtEYw==
Date: Wed, 16 Sep 2026 16:21:48 +0100
From: Lee Jones <lee@kernel.org>
To: Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: vkoul@kernel.org, yung-chuan.liao@linux.intel.com,
	pierre-louis.bossart@linux.dev, linux-sound@vger.kernel.org,
	patches@opensource.cirrus.com, mfd@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] mfd: cs42l43: Move to core detach helper
Message-ID: <20260916152148.GF1605367@google.com>
References: <20260831140157.1736905-1-ckeepax@opensource.cirrus.com>
 <20260831140157.1736905-3-ckeepax@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260831140157.1736905-3-ckeepax@opensource.cirrus.com>

On Mon, 31 Aug 2026, Charles Keepax wrote:

> Now the core has a helper to signal a device will detach from
> the SoundWire bus, there is no need for the cs42l43 driver code
> to separately track that. Switch to using the new core helper.
> 
> Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
> ---
> 
> No changes since v1.
> 
>  drivers/mfd/cs42l43-sdw.c   |  2 --
>  drivers/mfd/cs42l43.c       | 15 +--------------
>  include/linux/mfd/cs42l43.h |  1 -
>  3 files changed, 1 insertion(+), 17 deletions(-)
> 
> diff --git a/drivers/mfd/cs42l43-sdw.c b/drivers/mfd/cs42l43-sdw.c
> index 0a6999453f325..f0825d6bf7b38 100644
> --- a/drivers/mfd/cs42l43-sdw.c
> +++ b/drivers/mfd/cs42l43-sdw.c
> @@ -102,8 +102,6 @@ static int cs42l43_sdw_update_status(struct sdw_slave *sdw, enum sdw_slave_statu
>  		break;
>  	case SDW_SLAVE_UNATTACHED:
>  		dev_dbg(cs42l43->dev, "Device detach\n");

Is this now superfluous?

> -
> -		complete(&cs42l43->device_detach);
>  		break;
>  	default:
>  		break;
> diff --git a/drivers/mfd/cs42l43.c b/drivers/mfd/cs42l43.c
> index 4212ebcca60b5..f08ee598366d9 100644
> --- a/drivers/mfd/cs42l43.c
> +++ b/drivers/mfd/cs42l43.c
> @@ -30,7 +30,6 @@
>  #define CS42L43_RESET_DELAY_MS			20
>  
>  #define CS42L43_SDW_ATTACH_TIMEOUT_MS		5000
> -#define CS42L43_SDW_DETACH_TIMEOUT_MS		100
>  
>  #define CS42L43_MCU_BOOT_STAGE1			1
>  #define CS42L43_MCU_BOOT_STAGE2			2
> @@ -555,7 +554,7 @@ static int cs42l43_soft_reset(struct cs42l43 *cs42l43)
>  		{ CS42L43_SFT_RESET, CS42L43_SFT_RESET_VAL },
>  	};
>  
> -	reinit_completion(&cs42l43->device_detach);
> +	sdw_slave_signal_unattach(cs42l43->sdw);

If this call NULL safe?

>  	/*
>  	 * Apply cache only because the soft reset will cause the device to
> @@ -566,17 +565,6 @@ static int cs42l43_soft_reset(struct cs42l43 *cs42l43)
>  
>  	msleep(CS42L43_RESET_DELAY_MS);
>  
> -	if (cs42l43->sdw) {
> -		unsigned long timeout = msecs_to_jiffies(CS42L43_SDW_DETACH_TIMEOUT_MS);
> -		unsigned long time;
> -
> -		time = wait_for_completion_timeout(&cs42l43->device_detach, timeout);
> -		if (!time) {
> -			dev_err(cs42l43->dev, "Timed out waiting for device detach\n");
> -			return -ETIMEDOUT;
> -		}
> -	}
> -
>  	return -EAGAIN;
>  }
>  
> @@ -1115,7 +1103,6 @@ int cs42l43_dev_probe(struct cs42l43 *cs42l43)
>  	dev_set_drvdata(cs42l43->dev, cs42l43);
>  
>  	mutex_init(&cs42l43->pll_lock);
> -	init_completion(&cs42l43->device_detach);
>  	init_completion(&cs42l43->firmware_download);
>  	INIT_WORK(&cs42l43->boot_work, cs42l43_boot_work);
>  
> diff --git a/include/linux/mfd/cs42l43.h b/include/linux/mfd/cs42l43.h
> index 8e993fb535e68..798dc55149662 100644
> --- a/include/linux/mfd/cs42l43.h
> +++ b/include/linux/mfd/cs42l43.h
> @@ -86,7 +86,6 @@ struct cs42l43 {
>  	struct regmap_irq_chip_data *irq_data;
>  
>  	struct work_struct boot_work;
> -	struct completion device_detach;
>  	struct completion firmware_download;
>  	int firmware_error;
>  
> -- 
> 2.47.3
> 

-- 
Lee Jones
