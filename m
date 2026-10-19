Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.81
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792426841;
	b=eXhW+M6Wv37eTUEFHw/vCzjqS7VmvyjJt1c12FgGeKdpXMTwxvExC9sfT0f0ELi2l7s2
	 E3Fjg7UTN3AIS97Sn+2LPtQNidjDF0MVdteuVmlE5CQ21M8m+x0x3H8hu9612WwwJSpfc
	 wwQo9mp0YuIijXjX8TyG93MudUjir3g6UJfeWgvfgTHP57QPjKPSc4Qw6QS+UMxq17DSf
	 /NpB4nrZF6hy33q3G+RyJHmSmYdbKo17G1VMg0x0maPUDAoE8M8MPDSKgzBeJ9tsyarph
	 rU0mO1nTwZ+h9SKUGx6m/EzWPTXn13W+AVOQGZ22prweo1HhyyqOtj5NYFVLsFMh92w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792426841;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=ifPegrFwKeuR20glcd9bdriukmk7u4OjwQO0HUNZiH4=;
	b=VndeLzLsAzCOOBqFJe4K59Ubw0jv32zTFTqHE0w5HEhdiMX3ouZinBAajei4pT2uGn/A
	 ocXQbHsfaqabDXx3SY5L9EQ/OkDigH9Kt2G0p54prmpVlHJcDfwqdQUQn3YjMQYumEwK1
	 Ih1Ag7oZH0o3N0mSA57ypwVPQ186ZvwbHVOuNwtxPMc6KNBiXIw026u9yKmHB5MA5vBCN
	 cwvsfgu9CmbjwoVMuZuV9bT3DvkTidsl28ywaZgEI0NSnjP9/LrDqc7wSSEimQlaVp8kv
	 RNVcSJjlB9ksJVR3iKrX+V6SlTz8dd0gq9EsMZMq+PdoxF0OJ+Trn6GHY8IXrFnCnnA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=IajvSsVF;
	arc=none smtp.remote-ip=95.215.58.81
Received: from mta1.migadu.com (out-81.mta1.migadu.com [95.215.58.81])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5242606A31C
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 16:20:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E5242606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=IajvSsVF
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=Ll78rnmuwRI9wIbvpSsCG8uEaQpmaTggmYNaTLfLFlM=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1792426833; v=1; x=1793031633;
 b=IajvSsVFJx+fZfVvWUlPRLTNmJ3jJRge2t0CAgXipH/4Wwl19HiGgzGquu6LiSaOYHOlpjDS
 2KyAtUfovnfOOe1u4Dgdstqvla6WvHLjvmrJARZOfMDMsIyO1UVk/Hei7M3an2f8vZlFLMkYsrX
 RezPgl8qHfjHFVifqZ70O00c=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id dfba00eb11b236da;
	Mon, 19 Oct 2026 16:20:30 +0000
X-Mizu-Trace-ID: dfba00eb11b236da
X-Migadu-Flow: FLOW_OUT
Message-ID: <bdc967fd-c056-492d-b970-db5630f21b95@linux.dev>
Date: Mon, 19 Oct 2026 17:56:51 +0200
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
Subject: Re: [PATCH 1/3] ASoC: tas2783-sdw: keep the volume settings across
 resets
To: Matthew Schwartz <matthew.schwartz@linux.dev>, broonie@kernel.org
Cc: Lee Mann <leepaulmann@gmail.com>, Shenghao Ding <shenghao-ding@ti.com>,
 Kevin Lu <kevin-lu@ti.com>, Baojun Xu <baojun.xu@ti.com>,
 Sen Wang <sen@ti.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Andrey Golovko <andrey.golovko@gmail.com>, linux-sound@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20261018200009.1493438-1-matthew.schwartz@linux.dev>
 <20261018200009.1493438-2-matthew.schwartz@linux.dev>
Content-Language: en-US
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
In-Reply-To: <20261018200009.1493438-2-matthew.schwartz@linux.dev>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/18/26 22:00, Matthew Schwartz wrote:
> The register cache is dropped when the amp attaches uninitialized and
> again after the firmware download, so the Amp Volume and Speaker Volume
> registers are not cached while the amp is runtime suspended, and every
> read or write of those controls fails with -EBUSY. On a platform that
> powers the SoundWire link off when idle, such as the ASUS ROG Xbox Ally
> X20, the amp is also reset and initialized again on every wake, so a
> volume set while it was awake is lost the next time the link idles.
> 
> Keep both settings in the driver, as the cache has to be dropped
> whenever the reset and the firmware download change registers behind
> it. Reads return the kept value, a write reaches the device only while
> it is runtime active and initialized, and the settings are programmed
> again after every init and resume. Until userspace sets a control, the
> value the firmware leaves after each init is adopted instead, so its
> tuning stays in effect. Waking the amp for a control access would
> instead cost a full init of both X20 amps, about 0.2 s each.
> 
> Fixes: b627da430357 ("ASoC: tas2783-sdw: drop stale regcache on uninitialized re-attach")

Erm, not sure what to think about this fix of a fix.

This commit b627da430357 introduced the regcache_drop_region() for all
kinds of reasons, and now this new patch introduces a manual management
of the volume registers - but why limit this management to volume
settings only? Shouldn't other features such as e.g. bass boost or EQ
also be restored?

It really feels like the problem is that the regmap is not properly
restored...at the end of the day, this driver is missing a
regcache_sync(), no?

> Reported-by: Lee Mann <leepaulmann@gmail.com>
> Link: https://lore.kernel.org/r/20261016102846.22908-1-leepaulmann@gmail.com
> Signed-off-by: Matthew Schwartz <matthew.schwartz@linux.dev>
> ---
>  sound/soc/codecs/tas2783-sdw.c | 159 +++++++++++++++++++++++++++++++--
>  1 file changed, 151 insertions(+), 8 deletions(-)
> 
> diff --git a/sound/soc/codecs/tas2783-sdw.c b/sound/soc/codecs/tas2783-sdw.c
> index a57230e01f75..ebb52efc1edf 100644
> --- a/sound/soc/codecs/tas2783-sdw.c
> +++ b/sound/soc/codecs/tas2783-sdw.c
> @@ -12,6 +12,7 @@
>  // Author: Baojun Xu <baojun.xu@ti.com>
>  // Author: Kevin Lu <kevin-lu@ti.com>
>  
> +#include <linux/bitfield.h>
>  #include <linux/cleanup.h>
>  #include <linux/unaligned.h>
>  #include <linux/crc32.h>
> @@ -89,6 +90,15 @@ struct tas2783_prv {
>  	struct mutex calib_lock;
>  	/* pde and firmware download */
>  	struct mutex pde_lock;
> +	/* volume settings, kept across resets */
> +	struct mutex vol_lock;
> +	unsigned int amp_level;
> +	unsigned int dvc_level;
> +	/* set by userspace, so program it instead of adopting it */
> +	bool amp_set;
> +	bool dvc_set;
> +	/* runtime active, so volume writes reach the device */
> +	bool vol_live;
>  	struct regmap *regmap;
>  	struct device *dev;
>  	struct class *class;
> @@ -530,36 +540,151 @@ static const struct regmap_sdw_mbq_cfg tas2783_mbq_cfg = {
>  	.mbq_size = tas2783_sdca_mbq_size,
>  };
>  
> +#define TAS2783_AMP_LEVEL_MAX	20
> +#define TAS2783_DVC_LVL_MAX	200
> +
> +/* forced, as a failed write leaves the new value in the cache */
> +static s32 tas2783_write_amp_level(struct tas2783_prv *tas_dev,
> +				   unsigned int level)
> +{
> +	return regmap_write_bits(tas_dev->regmap, TAS2783_AMP_LEVEL,
> +				 TAS2783_AMP_LEVEL_MASK,
> +				 FIELD_PREP(TAS2783_AMP_LEVEL_MASK, level));
> +}
> +
> +static s32 tas2783_write_dvc_level(struct tas2783_prv *tas_dev,
> +				   unsigned int level)
> +{
> +	return regmap_write(tas_dev->regmap, TAS2783_DVC_LVL,
> +			    TAS2783_DVC_LVL_MAX - level);
> +}
> +
> +/* program the volume settings userspace set, adopt the firmware ones */
> +static s32 tas2783_sync_volume(struct tas2783_prv *tas_dev)
> +{
> +	unsigned int val;
> +	s32 ret;
> +
> +	lockdep_assert_held(&tas_dev->vol_lock);
> +
> +	if (tas_dev->amp_set) {
> +		ret = tas2783_write_amp_level(tas_dev, tas_dev->amp_level);
> +	} else {
> +		ret = regmap_read(tas_dev->regmap, TAS2783_AMP_LEVEL, &val);
> +		if (!ret) {
> +			val = FIELD_GET(TAS2783_AMP_LEVEL_MASK, val);
> +			tas_dev->amp_level = umin(val, TAS2783_AMP_LEVEL_MAX);
> +		}
> +	}
> +	if (ret)
> +		return ret;
> +
> +	if (tas_dev->dvc_set)
> +		return tas2783_write_dvc_level(tas_dev, tas_dev->dvc_level);
> +
> +	ret = regmap_read(tas_dev->regmap, TAS2783_DVC_LVL, &val);
> +	if (!ret)
> +		tas_dev->dvc_level = TAS2783_DVC_LVL_MAX -
> +				     umin(val, TAS2783_DVC_LVL_MAX);
> +
> +	return ret;
> +}
> +
> +static bool tas2783_vol_valid(struct snd_kcontrol *kcontrol, long val)
> +{
> +	struct soc_mixer_control *mc =
> +		(struct soc_mixer_control *)kcontrol->private_value;
> +
> +	if (mc->platform_max && val > mc->platform_max)
> +		return false;
> +
> +	return val >= 0 && val <= mc->max;
> +}
> +
>  static s32 tas2783_digital_getvol(struct snd_kcontrol *kcontrol,
>  				  struct snd_ctl_elem_value *ucontrol)
>  {
> -	return snd_soc_get_volsw(kcontrol, ucontrol);
> +	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
> +	struct tas2783_prv *tas_dev = snd_soc_component_get_drvdata(component);
> +
> +	guard(mutex)(&tas_dev->vol_lock);
> +	ucontrol->value.integer.value[0] = tas_dev->dvc_level;
> +
> +	return 0;
>  }
>  
>  static s32 tas2783_digital_putvol(struct snd_kcontrol *kcontrol,
>  				  struct snd_ctl_elem_value *ucontrol)
>  {
> -	return snd_soc_put_volsw(kcontrol, ucontrol);
> +	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
> +	struct tas2783_prv *tas_dev = snd_soc_component_get_drvdata(component);
> +	long val = ucontrol->value.integer.value[0];
> +	s32 ret;
> +
> +	if (!tas2783_vol_valid(kcontrol, val))
> +		return -EINVAL;
> +
> +	guard(mutex)(&tas_dev->vol_lock);
> +	if (tas_dev->vol_live && tas_dev->hw_init) {
> +		ret = tas2783_write_dvc_level(tas_dev, val);
> +		if (ret)
> +			return ret;
> +	}
> +
> +	tas_dev->dvc_set = true;
> +	if (val == tas_dev->dvc_level)
> +		return 0;
> +
> +	tas_dev->dvc_level = val;
> +
> +	return 1;
>  }
>  
>  static s32 tas2783_amp_getvol(struct snd_kcontrol *kcontrol,
>  			      struct snd_ctl_elem_value *ucontrol)
>  {
> -	return snd_soc_get_volsw(kcontrol, ucontrol);
> +	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
> +	struct tas2783_prv *tas_dev = snd_soc_component_get_drvdata(component);
> +
> +	guard(mutex)(&tas_dev->vol_lock);
> +	ucontrol->value.integer.value[0] = tas_dev->amp_level;
> +
> +	return 0;
>  }
>  
>  static s32 tas2783_amp_putvol(struct snd_kcontrol *kcontrol,
>  			      struct snd_ctl_elem_value *ucontrol)
>  {
> -	return snd_soc_put_volsw(kcontrol, ucontrol);
> +	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
> +	struct tas2783_prv *tas_dev = snd_soc_component_get_drvdata(component);
> +	long val = ucontrol->value.integer.value[0];
> +	s32 ret;
> +
> +	if (!tas2783_vol_valid(kcontrol, val))
> +		return -EINVAL;
> +
> +	guard(mutex)(&tas_dev->vol_lock);
> +	if (tas_dev->vol_live && tas_dev->hw_init) {
> +		ret = tas2783_write_amp_level(tas_dev, val);
> +		if (ret)
> +			return ret;
> +	}
> +
> +	tas_dev->amp_set = true;
> +	if (val == tas_dev->amp_level)
> +		return 0;
> +
> +	tas_dev->amp_level = val;
> +
> +	return 1;
>  }
>  
>  static const struct snd_kcontrol_new tas2783_snd_controls[] = {
>  	SOC_SINGLE_RANGE_EXT_TLV("Amp Volume", TAS2783_AMP_LEVEL,
> -				 1, 0, 20, 0, tas2783_amp_getvol,
> +				 1, 0, TAS2783_AMP_LEVEL_MAX, 0, tas2783_amp_getvol,
>  				 tas2783_amp_putvol, tas2781_amp_tlv),
>  	SOC_SINGLE_RANGE_EXT_TLV("Speaker Volume", TAS2783_DVC_LVL,
> -				 0, 0, 200, 1, tas2783_digital_getvol,
> +				 0, 0, TAS2783_DVC_LVL_MAX, 1, tas2783_digital_getvol,
>  				 tas2783_digital_putvol, tas2781_dvc_tlv),
>  };
>  
> @@ -1116,6 +1241,9 @@ static s32 tas2783_sdca_dev_suspend(struct device *dev)
>  {
>  	struct tas2783_prv *tas_dev = dev_get_drvdata(dev);
>  
> +	scoped_guard(mutex, &tas_dev->vol_lock)
> +		tas_dev->vol_live = false;
> +
>  	if (!tas_dev->hw_init)
>  		return 0;
>  
> @@ -1148,6 +1276,14 @@ static s32 tas2783_sdca_dev_resume(struct device *dev)
>  		return ret;
>  	}
>  
> +	guard(mutex)(&tas_dev->vol_lock);
> +	if (tas_dev->hw_init) {
> +		ret = tas2783_sync_volume(tas_dev);
> +		if (ret)
> +			return ret;
> +	}
> +	tas_dev->vol_live = true;
> +
>  	return 0;
>  }
>  
> @@ -1245,11 +1381,14 @@ static s32 tas_io_init(struct device *dev, struct sdw_slave *slave)
>  
>  		/* Re-active AMP after resume. */
>  		regmap_write(tas_dev->regmap, TASDEV_REG_SDW(0, 0, 2), 0);
> +		if (!ret) {
> +			guard(mutex)(&tas_dev->vol_lock);
> +			ret = tas2783_sync_volume(tas_dev);
> +			tas_dev->hw_init = !ret;
> +		}
>  		if (ret)
>  			dev_err(tas_dev->dev,
>  				"init writes failed, err=%d", ret);
> -		else
> -			tas_dev->hw_init = true;
>  	}
>  
>  	return ret;
> @@ -1427,6 +1566,9 @@ static s32 tas_sdw_probe(struct sdw_slave *peripheral,
>  	tas_dev->fw_version = 0;
>  	mutex_init(&tas_dev->calib_lock);
>  	mutex_init(&tas_dev->pde_lock);
> +	mutex_init(&tas_dev->vol_lock);
> +	tas_dev->amp_level = TAS2783_AMP_LEVEL_MAX;
> +	tas_dev->dvc_level = TAS2783_DVC_LVL_MAX;
>  
>  	init_waitqueue_head(&tas_dev->fw_wait);
>  	dev_set_drvdata(dev, tas_dev);
> @@ -1452,6 +1594,7 @@ static void tas_sdw_remove(struct sdw_slave *peripheral)
>  	tas_remove(tas_dev);
>  	mutex_destroy(&tas_dev->calib_lock);
>  	mutex_destroy(&tas_dev->pde_lock);
> +	mutex_destroy(&tas_dev->vol_lock);
>  	dev_set_drvdata(&peripheral->dev, NULL);
>  }
>  

