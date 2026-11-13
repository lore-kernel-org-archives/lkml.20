Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794598234;
	b=Jxi9RuAsIGnwcN6/WWeXgqW3oH0fRVwPmkc6iXnDuL5yzOGhmDeRbQsKBY3YgUUY8R8g
	 xNMmh1DBOIGhVWmBgG44aBdfAp0rpi/FuAGgW9zt5PRnfDkqr7lyvxz6V/n5IuIks4KJn
	 sL+Ubt5s3PYJrmdmcT6lH+MJnEJJgigklIfcp3LVZPpZ4y7VrwNqW9A3IihZZjHqAQQio
	 8DoGDzFeiaw4YYfbZutdVXMUwgWGwJzOGv1Ghi8SXw1ugJpO4mnPq/NnvffScqb8gu8H1
	 wC5/36onlFivDwlkhobwDw0swJJF3P63YUeZt7cRe0KDMFRcd0qs1mUAaT+oZNUf9zQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794598234;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To:
	 X-AI-Review-Draft;
	bh=5czRHff+aktsKZ6lzb+WbE0mUTG272hnVZ/DWb+/MmM=;
	b=GIV7gjEowMtM2xuHIQ0gb4rV6PjyLmRUXM/eXTQePUW0kDCcKwOGkPc4I6NQuK2ToJCa
	 Uz8JTO8CNZLZoqHJaDJIlKZFK2cBBh+jQqYMxZyDhDhR5aKb7x1rUoVrmqG8h8Deu8j3t
	 WgoXiKqz4qQ2UVb/4YbIjBf/zG24YAJjfdF0zzKZBc0J0a/Z4OCbnNHVKHTqAOcJrba+g
	 KJfo1Ajr4Nq3O8bmDB/N54V4M+D+Lwx+5HwxTXYitCQacZ18Bktr8Sf/9oPa0Ta1iZBaY
	 GH38gWxo40/CZNn3QUsQAUorO4aWyw1G/P4Ir+zNrn1S9rtVDjgJVcB8qyoZW1EcK1A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bNv3d4aO;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08E3C606A333;
	Fri, 13 Nov 2026 19:30:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bNv3d4aO
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F1CBD1F000C4;
	Fri, 13 Nov 2026 19:30:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794598233;
	bh=5czRHff+aktsKZ6lzb+WbE0mUTG272hnVZ/DWb+/MmM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=bNv3d4aODpkDmeWQI3BCBzpd1odQTaMrx2LEcQ9mK2idzy29UBP4w7R5H8GvNpSqf
	 TNzkoFtDp4Ow0XDPoX7a5O85VvPvqwyvBj8R6jph+vAQU9aBRN7rew59pkxJkrnJwf
	 1argNAkKAZQ5sc705eTHG1+3mZR2EhGZ1wXqoDRujprBlOx5M0vaoP04y1LpqFcqW4
	 JLoo4cIkhIGhCNeFIXWsTCgSIyCA6Ub8+hWlxkUuI5p31anihoLkbeMxkNYe+zVrXW
	 0AcKgnXbQi0gtg9MThSSsQIowq/bJL2Odnn9haGIedUxLaw+f0WRLCcLV4sm9lOP5I
	 jMVUHwe++GTWg==
Date: Fri, 13 Nov 2026 19:30:29 +0000
From: Lee Jones <lee@kernel.org>
To: Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: vkoul@kernel.org, yung-chuan.liao@linux.intel.com,
	pierre-louis.bossart@linux.dev, linux-sound@vger.kernel.org,
	mfd@lists.linux.dev, linux-kernel@vger.kernel.org,
	patches@opensource.cirrus.com
Subject: Re: [PATCH v2 RESEND 2/2] mfd: cs42l43: Move to core detach helper
Message-ID: <179370028929.793788.4070701675472724398@kernel.org>
References: <20261102164157.4010002-1-ckeepax@opensource.cirrus.com>
 <20261102164157.4010002-3-ckeepax@opensource.cirrus.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261102164157.4010002-3-ckeepax@opensource.cirrus.com>
X-AI-Review-Draft: <20261102164157.4010002-3-ckeepax@opensource.cirrus.com>

On Mon, 02 Nov 2026, Charles Keepax wrote:

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
>
> diff --git a/drivers/mfd/cs42l43-sdw.c b/drivers/mfd/cs42l43-sdw.c
> index 22e4c1fe92984..7e4a23aa22556 100644
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
> index a83b62064dae6..341722e4c5276 100644
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

Isn't 'cs42l43->sdw' NULL when the device is connected via I2C?

Also, doesn't the comment in cs42l43_soft_reset() still claim that this
function waits for the device to detach from the bus?

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
> @@ -1125,7 +1113,6 @@ int cs42l43_dev_probe(struct cs42l43 *cs42l43)
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
