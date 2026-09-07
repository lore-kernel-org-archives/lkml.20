Received: from mta1.migadu.com (out-235.mta1.migadu.com [95.215.58.235])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04FD8483BF7
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 11:32:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.235
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788780747; cv=none; b=TwAREORk/HuYfsoRaGoowgcNbytsjumKQRA3Z9sNHHwtvABumNbWVG9i/7tnsE9fDHt/qNUatIQ+lnz2xC5aOyY8+s++0omGktgP8pfgApY1ifSz0YarfMA/V6KR2L9xgzdwmC7ksp3/k8JYJumnQPAyBqFR73bMi0rKIz/zUJs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788780747; c=relaxed/simple;
	bh=Hz8ljkeaHoi/srntJZ5bqPlWtx4b46jV1nqKuoUSS/Y=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=SqBo538Lvab4Tuc9MRlThA0XGCEVAUeBP7SBp1J7xIHGyVTB75opDLbVNSp6m8ZzPBonCCYsbcsL5tzZ90U+w8/2/0VspihW3Pp+nNUYTxa56zBVxrHtWWqFqhqYEJlRpK+p2kV2hkTuuujNhJ+wFNZzrtTaRp1cfGC+HH9uw34=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=SXvbCLyC; arc=none smtp.client-ip=95.215.58.235
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="SXvbCLyC"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=Hz8ljkeaHoi/srntJZ5bqPlWtx4b46jV1nqKuoUSS/Y=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1788780742; v=1; x=1789385542;
 b=SXvbCLyChFZ3UxNg5lMw54RD3t2ZnpWX3CqsHgGjl6XzNh1AelKBlZGbM/qWG/Ic028pd0x6
 PwODOSdv3JF3rcWvm9jap/JyuVljxufo9GV/cx8hgDXAzKnKSYHxAYsVWDfuGCQJBGnUBdKNO5O
 5pIpID3CWlpAnUF9flMZJdm0=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id bad45750a42e1d03;
	Mon, 07 Sep 2026 11:32:22 +0000
X-Mizu-Trace-ID: bad45750a42e1d03
X-Migadu-Flow: FLOW_OUT
Message-ID: <836db10c-8d0e-4882-b0be-3add5069566b@linux.dev>
Date: Mon, 7 Sep 2026 13:31:58 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
Subject: Re: [PATCH v2 03/11] ASoC: SDCA: expose class SoundWire
 probe/remove/read_prop as library
To: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
 Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
 Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Bard Liao <yung-chuan.liao@linux.intel.com>, Jaroslav Kysela
 <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>,
 Maciej Strozek <mstrozek@opensource.cirrus.com>,
 Takashi Iwai <tiwai@suse.com>, Faiz Nabi Kuchay <fkuchay@oss.qualcomm.com>,
 Jorijn van der Graaf <jorijnvdgraaf@catcrafts.net>,
 patches@opensource.cirrus.com, linux-sound@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260907083727.733705-1-srinivas.kandagatla@oss.qualcomm.com>
 <20260907083727.733705-4-srinivas.kandagatla@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260907083727.733705-4-srinivas.kandagatla@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 9/7/26 10:37, Srinivas Kandagatla wrote:
> Split the internal class_sdw_probe/class_sdw_remove/class_read_prop
> functions into caller-friendly library helpers:
> 
>   sdca_class_read_prop(sdw)
>   sdca_class_probe(sdw, drv)
>   sdca_class_remove(drv)
> 
> The class_sdw_probe/class_sdw_remove callbacks of the built-in
> class_sdw_driver are now thin wrappers that allocate a bare
> sdca_class_drv, stash it in drvdata, and defer to the exported
> helpers.
> 
> The exported sdca_class_probe() takes a caller-owned struct
> sdca_class_drv * so codec-specific SoundWire drivers can embed the
> class state in their own priv struct, own dev_set_drvdata() themselves,
> and avoid a second allocation.  No functional change for the built-in
> driver.
> 
> This lays the groundwork for codec-specific SDCA SoundWire drivers
> that want to compose the class-side probe with their own quirks; the
> next patches add the hw_ops mechanism on top.

I am not sure I fully understand what you mean by "compose the
class-side probe with their own quirks".

The existing SDCA mechanism is that there's a top-level SoundWire
device, whose driver creates auxiliary subdevices for each function. We
currently probe drivers for those function devices based on naming. So
how would the 'composing' work then?

I guess part of the confusion is also the recurring 'codec specific'
term used in several patch, but we are talking about functions which are
subsets of a codec, no? maybe use hardware specific.

Note that if you need customization to the base class mechanism, there's
another option that's currently in use in the other OS that shall not be
named. Codec providers are not allowed to change the class drivers,
which are owned and distributed as part of the base OS. Codec vendors
can however provide extension drivers. The premise was that the sound
would be 'acceptable' with class drivers, and the extensions would
unlock the secret sauce algorithms for the best audio quality. If we are
talking about 'composing class-side probe with quirks', it'd be good to
clarify the rationale and objectives...

edit: I think the idea is really to use the class function drivers as
is, but with the function data provided to and used by the subdevice
driver probe. But the hw_init doesn't seem required to me, you already
have the .status callback that can be used to perform device-level
initializations.



> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
> ---
>  include/sound/sdca_class.h  |  5 +++
>  sound/soc/sdca/sdca_class.c | 75 +++++++++++++++++++++++++++++++------
>  2 files changed, 69 insertions(+), 11 deletions(-)
> 
> diff --git a/include/sound/sdca_class.h b/include/sound/sdca_class.h
> index 15a180385202..c6063f22be7a 100644
> --- a/include/sound/sdca_class.h
> +++ b/include/sound/sdca_class.h
> @@ -33,6 +33,11 @@ struct sdca_class_drv {
>  	struct work_struct boot_work;
>  };
>  
> +/* Library helpers used by codec-specific SDCA SoundWire drivers. */
> +int sdca_class_read_prop(struct sdw_slave *sdw);
> +int sdca_class_probe(struct sdw_slave *sdw, struct sdca_class_drv *drv);
> +void sdca_class_remove(struct sdca_class_drv *drv);
> +
>  /*
>   * PM helpers.  Codec drivers embed sdca_class_drv in their own priv,
>   * own dev_set_drvdata(), and compose these into their own dev_pm_ops:
> diff --git a/sound/soc/sdca/sdca_class.c b/sound/soc/sdca/sdca_class.c
> index 88a29116a334..b952fa6eb802 100644
> --- a/sound/soc/sdca/sdca_class.c
> +++ b/sound/soc/sdca/sdca_class.c
> @@ -24,7 +24,15 @@
>  
>  #define CLASS_SDW_ATTACH_TIMEOUT_MS	5000
>  
> -static int class_read_prop(struct sdw_slave *sdw)
> +/**
> + * sdca_class_read_prop - fill SDCA-common SoundWire slave properties
> + * @sdw: SoundWire slave
> + *
> + * Exported so codec-specific SoundWire drivers can invoke the SDCA
> + * common property setup from their own sdw_slave_ops.read_prop, and
> + * then apply codec-specific overrides inline.
> + */
> +int sdca_class_read_prop(struct sdw_slave *sdw)
>  {
>  	struct sdw_slave_prop *prop = &sdw->prop;
>  
> @@ -36,9 +44,10 @@ static int class_read_prop(struct sdw_slave *sdw)
>  
>  	return 0;
>  }
> +EXPORT_SYMBOL_NS_GPL(sdca_class_read_prop, "SND_SOC_SDCA_CLASS");
>  
>  static const struct sdw_slave_ops class_sdw_ops = {
> -	.read_prop	= class_read_prop,
> +	.read_prop	= sdca_class_read_prop,
>  };
>  
>  static void class_regmap_lock(void *data)
> @@ -136,18 +145,31 @@ static void class_boot_work(struct work_struct *work)
>  	pm_runtime_put_sync(drv->dev);
>  }
>  
> -static int class_sdw_probe(struct sdw_slave *sdw, const struct sdw_device_id *id)
> +/**
> + * sdca_class_probe - SDCA class SoundWire slave probe helper
> + * @sdw: SoundWire slave
> + * @drv: caller-allocated sdca_class_drv storage.  The caller (a codec
> + *       driver, or the built-in class_sdw_driver in this file) owns the
> + *       allocation and sets its own dev_set_drvdata() -- the framework
> + *       does not touch drvdata.  Typically embedded in the codec's own
> + *       priv struct so codec drivers can keep per-slave state.
> + *
> + * Codec-specific SoundWire drivers call this from their .probe after
> + * allocating a struct sdca_class_drv (usually embedded in their own
> + * priv) and setting drvdata to their priv.  The framework fills in the
> + * sdca_class_drv fields, sets up the class regmap, and queues the
> + * deferred boot work.
> + */
> +int sdca_class_probe(struct sdw_slave *sdw, struct sdca_class_drv *drv)
>  {
>  	struct device *dev = &sdw->dev;
>  	struct regmap_config *dev_config;
> -	struct sdca_class_drv *drv;
>  	int ret;
>  
>  	sdca_lookup_swft(sdw);
>  
> -	drv = devm_kzalloc(dev, sizeof(*drv), GFP_KERNEL);
>  	if (!drv)
> -		return -ENOMEM;
> +		return -EINVAL;
>  
>  	dev_config = devm_kmemdup(dev, &class_dev_regmap_config,
>  				  sizeof(*dev_config), GFP_KERNEL);
> @@ -159,8 +181,6 @@ static int class_sdw_probe(struct sdw_slave *sdw, const struct sdw_device_id *id
>  	mutex_init(&drv->regmap_lock);
>  	mutex_init(&drv->init_lock);
>  
> -	dev_set_drvdata(drv->dev, drv);
> -
>  	INIT_WORK(&drv->boot_work, class_boot_work);
>  
>  	dev_config->lock_arg = &drv->regmap_lock;
> @@ -185,14 +205,47 @@ static int class_sdw_probe(struct sdw_slave *sdw, const struct sdw_device_id *id
>  
>  	return 0;
>  }
> +EXPORT_SYMBOL_NS_GPL(sdca_class_probe, "SND_SOC_SDCA_CLASS");
>  
> -static void class_sdw_remove(struct sdw_slave *sdw)
> +static int class_sdw_probe(struct sdw_slave *sdw, const struct sdw_device_id *id)
>  {
> -	struct device *dev = &sdw->dev;
> -	struct sdca_class_drv *drv = dev_get_drvdata(dev);
> +	struct sdca_class_drv *drv;
>  
> +	/*
> +	 * Pure-generic SDCA parts: no codec priv to embed, so allocate a
> +	 * bare sdca_class_drv here and stash it in drvdata for the
> +	 * built-in PM ops to fetch.
> +	 */
> +	drv = devm_kzalloc(&sdw->dev, sizeof(*drv), GFP_KERNEL);
> +	if (!drv)
> +		return -ENOMEM;
> +
> +	dev_set_drvdata(&sdw->dev, drv);
> +
> +	return sdca_class_probe(sdw, drv);
> +}
> +
> +/**
> + * sdca_class_remove - SDCA class SoundWire slave remove helper
> + * @drv: caller-owned sdca_class_drv (the one handed to sdca_class_probe()).
> + *
> + * Cancels the deferred boot work so devres can safely free @drv and the
> + * embedding codec priv without racing class_boot_work.  Codec-specific
> + * SoundWire drivers that call sdca_class_probe() must call this from
> + * their .remove with the same drv pointer they passed to probe.
> + */
> +void sdca_class_remove(struct sdca_class_drv *drv)
> +{
>  	cancel_work_sync(&drv->boot_work);
>  }
> +EXPORT_SYMBOL_NS_GPL(sdca_class_remove, "SND_SOC_SDCA_CLASS");
> +
> +static void class_sdw_remove(struct sdw_slave *sdw)
> +{
> +	struct sdca_class_drv *drv = dev_get_drvdata(&sdw->dev);
> +
> +	sdca_class_remove(drv);
> +}
>  
>  /**
>   * sdca_class_system_suspend - SDCA class system suspend helper

