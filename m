Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A1654F30E3;
	Wed, 14 Oct 2026 15:18:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791991087; cv=none; b=ao9ZidxXaDuhaSF91Z9u1WCSCXawhMN6eTMttdoQHNL2e2eZdtsz8dW3BbzikjhHQunCgPu467k/YzRqGzZ5iTwMm8pZtpCTT1URXNvVZJ4z1x54ev8mGdZGbDp1AuDpzE8lpZ9dTYSw3iognMAD19QPlVRb/B0zp7pITpPs3tk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791991087; c=relaxed/simple;
	bh=K3ZQhjpkDCd10uGgn9bM3pWcndLwacUwSXCjp5I8Pho=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=u+yFuufH6yi3dXL9HkzNfU+GTvoJ+VAy6xJwvobKMleJ+/zSpwS0Xwdpk60nWOozeylhMG6Z8D6QsKwcWRme4peiw0yyRwDtm5CXz1E5SHfk1eYuOQM4fXt1YrsELXrnJ9LEaacpuZyRvL+jq2y4FhbJAIMdMa5i8SMY1/VKxBI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UXnrRgUC; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UXnrRgUC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E09871F000C4;
	Wed, 14 Oct 2026 15:18:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791991085;
	bh=7HzxTtSFTMkskMPYJB8U6e4H9U6jOaxLAn1OyG6O1Zg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=UXnrRgUCTuPoHFO1bsOIfq4XndwdFqNnP22yKTw5vnDn2nnIu4quNFs3szuaXq30d
	 TOLHRjuheGvmZ7PqutAVnrwAyJ74j9qCXCuB5vOLGyyaAXKxh9hERam2EMvsuc95iO
	 TEfNx5NX6GNoZ5oBWzBRc5FOWTN9q6uLOer4AUDorFku1IgFkSCcuK5MLpeFP0p++J
	 Q2cWFtUjE3ozoOqKKnGO4npD8tNdskeKLcT2T3Z0NcANSkdCrS6xkN5gFbNojt0GBN
	 hN31lqi5Et44orjniC3pSAPWXEkR2JeBWaUR+u5j2lSXmzpMUc6zHR0y/zCohgTV6m
	 GbCzfdLiimwpw==
Date: Wed, 14 Oct 2026 16:18:00 +0100
From: Lee Jones <lee@kernel.org>
To: Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: vkoul@kernel.org, yung-chuan.liao@linux.intel.com,
	pierre-louis.bossart@linux.dev, linux-sound@vger.kernel.org,
	patches@opensource.cirrus.com, mfd@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 RESEND 2/2] mfd: cs42l43: Move to core detach helper
Message-ID: <20261014151800.GA1182143@google.com>
References: <20260924120520.2511081-1-ckeepax@opensource.cirrus.com>
 <20260924120520.2511081-3-ckeepax@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260924120520.2511081-3-ckeepax@opensource.cirrus.com>

On Thu, 24 Sep 2026, Charles Keepax wrote:

> Now the core has a helper to signal a device will detach from
> the SoundWire bus, there is no need for the cs42l43 driver code
> to separately track that. Switch to using the new core helper.
> 
> Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
> Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
> ---
>  drivers/mfd/cs42l43-sdw.c   |  2 --
>  drivers/mfd/cs42l43.c       | 15 +--------------
>  include/linux/mfd/cs42l43.h |  1 -
>  3 files changed, 1 insertion(+), 17 deletions(-)

Does this need to go in as a set?

> diff --git a/drivers/mfd/cs42l43-sdw.c b/drivers/mfd/cs42l43-sdw.c
> index 0a6999453f325..f0825d6bf7b38 100644
> --- a/drivers/mfd/cs42l43-sdw.c
> +++ b/drivers/mfd/cs42l43-sdw.c
> @@ -102,8 +102,6 @@ static int cs42l43_sdw_update_status(struct sdw_slave *sdw, enum sdw_slave_statu
>  		break;
>  	case SDW_SLAVE_UNATTACHED:
>  		dev_dbg(cs42l43->dev, "Device detach\n");
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
>  
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
