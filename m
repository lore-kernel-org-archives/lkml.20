Received: from mta0.migadu.com (out-76.mta0.migadu.com [91.218.175.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0D5447FAE0
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 11:32:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788780744; cv=none; b=tNcDvlkWTr8CYv0EweO+PPlI/28LNOqqXLgS96whIFWylxNWi8sCCiLh3ohCvcragayr/OC4cjw7Fm7aqNH6WnW/sBLQJBUYV0Lc28AhXFUM0uyjdMr21w1OQJvwLmx5Y5EfyZX7EkBaTiTVvLN+dTfzAbQRaBAGVKVwJSFDTFo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788780744; c=relaxed/simple;
	bh=RtOjr2fYYcnqkVc4b9IcH2n1K5+OqQfEjWTPTdlM2S4=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=BDgTVTR6xoY4E00H/1HnPhJ5OlDyPcfXB62SWaPaK6vE+eCOYT2KD94jvcLeJs9r4AWaE1W6tu4GIZKMeDEI+gV6o5QZzkRQSWeRnTYjKrB6Fnt2SNSV40vtyQU+u7mVluVndDKMwxbdfjHWB+aL0pGenbqAg/nJyb/GPnLCAjw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=XRkZleIW; arc=none smtp.client-ip=91.218.175.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="XRkZleIW"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=RtOjr2fYYcnqkVc4b9IcH2n1K5+OqQfEjWTPTdlM2S4=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1788780740; v=1; x=1789385540;
 b=XRkZleIWhQs/fvTphZNENjcxQvKHyEat4YNTYtNu9ZAuwswbJB6uUv5gAFDBRsDrknIh2AKe
 +ySNAmMJTgm2BWc3HNs1I1xzVjYVctGjy6zeV+5sQ7VHR8lWWO3KWrr5DoumOmZ4yq++jCdJu9b
 /c34b4RfZkB837PKPvnc7WPc=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id c5c907cfa801a1f1;
	Mon, 07 Sep 2026 11:32:20 +0000
X-Mizu-Trace-ID: c5c907cfa801a1f1
X-Migadu-Flow: FLOW_OUT
Message-ID: <603a67c1-dcc6-469f-9420-5ffbf55000bf@linux.dev>
Date: Mon, 7 Sep 2026 13:29:18 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
Subject: Re: [PATCH v2 04/11] ASoC: SDCA: add hw_ops with hw_init hook
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
 <20260907083727.733705-5-srinivas.kandagatla@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260907083727.733705-5-srinivas.kandagatla@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 9/7/26 10:37, Srinivas Kandagatla wrote:
> Add struct sdca_class_hw_ops with a hw_init callback that runs from
> sdca_class_probe() before the class regmap is created.  Codec drivers
> use it to enable supplies, toggle reset GPIOs and program initial
> vendor register state.

It'd be good to clarify when this hw_init() is supposed to run. Probe
and hardware being available are usually two different things. I think
this relies on a behavior at the device level where the function
subdevices are only created after SoundWire device enumeration.

Also the 'hw_init' naming could be confusing, this is used in many codec
drivers to track if the hardware has previously been initialized.

> sdca_class_probe() gains an optional const struct sdca_class_hw_ops *
> argument (NULL for pure-generic SDCA parts) and stashes it on
> sdca_class_drv for later use.
> 
> No functional change for the built-in class_sdw_driver, which passes
> NULL.
> 
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
> ---
>  include/sound/sdca_class.h  | 17 ++++++++++++++++-
>  sound/soc/sdca/sdca_class.c | 15 +++++++++++++--
>  2 files changed, 29 insertions(+), 3 deletions(-)
> 
> diff --git a/include/sound/sdca_class.h b/include/sound/sdca_class.h
> index c6063f22be7a..3342937d09fd 100644
> --- a/include/sound/sdca_class.h
> +++ b/include/sound/sdca_class.h
> @@ -20,6 +20,17 @@ struct regmap;
>  struct sdw_slave;
>  struct sdca_function_data;
>  
> +/**
> + * struct sdca_class_hw_ops - optional codec hardware callbacks
> + * @hw_init: enable supplies, toggle reset, etc.  Runs from sdca_class_probe()
> + *           before the class regmap is created and before the slave is
> + *           ATTACHED; callers needing bus I/O must sdw_slave_wait_for_init()
> + *           first.
> + */
> +struct sdca_class_hw_ops {
> +	int (*hw_init)(struct sdw_slave *slave);
> +};
> +
>  struct sdca_class_drv {
>  	struct device *dev;
>  	struct regmap *dev_regmap;
> @@ -27,6 +38,8 @@ struct sdca_class_drv {
>  
>  	struct sdca_interrupt_info *irq_info;
>  
> +	const struct sdca_class_hw_ops *hw_ops;
> +
>  	struct mutex regmap_lock;
>  	/* Serialise function initialisations */
>  	struct mutex init_lock;
> @@ -35,7 +48,9 @@ struct sdca_class_drv {
>  
>  /* Library helpers used by codec-specific SDCA SoundWire drivers. */
>  int sdca_class_read_prop(struct sdw_slave *sdw);
> -int sdca_class_probe(struct sdw_slave *sdw, struct sdca_class_drv *drv);
> +int sdca_class_probe(struct sdw_slave *sdw,
> +		     struct sdca_class_drv *drv,
> +		     const struct sdca_class_hw_ops *hw_ops);
>  void sdca_class_remove(struct sdca_class_drv *drv);
>  
>  /*
> diff --git a/sound/soc/sdca/sdca_class.c b/sound/soc/sdca/sdca_class.c
> index b952fa6eb802..374de7d9e0b5 100644
> --- a/sound/soc/sdca/sdca_class.c
> +++ b/sound/soc/sdca/sdca_class.c
> @@ -153,6 +153,8 @@ static void class_boot_work(struct work_struct *work)
>   *       allocation and sets its own dev_set_drvdata() -- the framework
>   *       does not touch drvdata.  Typically embedded in the codec's own
>   *       priv struct so codec drivers can keep per-slave state.
> + * @hw_ops: optional device-specific hw_ops (may be NULL for pure-generic
> + *          SDCA parts that need no quirks)
>   *
>   * Codec-specific SoundWire drivers call this from their .probe after
>   * allocating a struct sdca_class_drv (usually embedded in their own
> @@ -160,7 +162,9 @@ static void class_boot_work(struct work_struct *work)
>   * sdca_class_drv fields, sets up the class regmap, and queues the
>   * deferred boot work.
>   */
> -int sdca_class_probe(struct sdw_slave *sdw, struct sdca_class_drv *drv)
> +int sdca_class_probe(struct sdw_slave *sdw,
> +		     struct sdca_class_drv *drv,
> +		     const struct sdca_class_hw_ops *hw_ops)
>  {
>  	struct device *dev = &sdw->dev;
>  	struct regmap_config *dev_config;
> @@ -178,9 +182,16 @@ int sdca_class_probe(struct sdw_slave *sdw, struct sdca_class_drv *drv)
>  
>  	drv->dev = dev;
>  	drv->sdw = sdw;
> +	drv->hw_ops = hw_ops;
>  	mutex_init(&drv->regmap_lock);
>  	mutex_init(&drv->init_lock);
>  
> +	if (hw_ops && hw_ops->hw_init) {
> +		ret = hw_ops->hw_init(sdw);
> +		if (ret)
> +			return dev_err_probe(dev, ret, "hw_init failed\n");
> +	}
> +

nit-pick: should the INIT_WORK be moved higher before this hw_init()? It
has nothing to do with regmap and we'd lose the requirement that
hw_init() be run before regmap inits.

>  	INIT_WORK(&drv->boot_work, class_boot_work);
>  
>  	dev_config->lock_arg = &drv->regmap_lock;
> @@ -222,7 +233,7 @@ static int class_sdw_probe(struct sdw_slave *sdw, const struct sdw_device_id *id
>  
>  	dev_set_drvdata(&sdw->dev, drv);
>  
> -	return sdca_class_probe(sdw, drv);
> +	return sdca_class_probe(sdw, drv, NULL);
>  }
>  
>  /**

