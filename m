Received: from mta0.migadu.com (out-237.mta0.migadu.com [91.218.175.237])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C1813AC0C0
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 08:06:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.237
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788854809; cv=none; b=KzFricjJnlvpQlYXFpdN6BtBBFl5+N5LPL0TLWGg0SnKeinxTIDIWBb5MUIDlt61cR+zmG5ExkYlpZK/CYXhi6ZswuhRBr32RKjXBs37LpkpEsPxW6tDJr7GjeGuAe5s5kjJqDWnqlct5omx7zk6lTtjhJrQK/5XazHzrkvPM5c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788854809; c=relaxed/simple;
	bh=z2Aui1gfVBqQER1RfDy8XUHJ416rxABvVZUfx6BuIb0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lE17q+PcV47DoxU3IbHWOzBa9NzKL6VT4AyrR2BrvBWBFx/++41VBXwJ1RwUXMIZHI4lx3vXM+jGxjpbp3srF7Pdbjga+mnQ9f3Hf8mnk7m/COpuWXgxEtWjMe+qFFeIT0WfJVpTKOHm8jDtjisB3zi9LKORlcKwub2eg59RMVY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=RhGhPaQh; arc=none smtp.client-ip=91.218.175.237
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="RhGhPaQh"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=z2Aui1gfVBqQER1RfDy8XUHJ416rxABvVZUfx6BuIb0=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1788854803; v=1; x=1789459603;
 b=RhGhPaQh/JAJ1DmPMqDRtkWhJ1FH9z3wLt6KpqYBBKnbJiZ6ubgYuzwCIhmZAMacoejWVpSL
 F/Ko6686HotrOuJjXKDr/E+aus57KnQf818uZ4hFgFUGo7bEOWzKb7Ni6/GW09CRERcm5xcJuD1
 y4cMR/fLpVXNbiWEaoy+uDjY=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 3872aa417a299e6d;
	Tue, 08 Sep 2026 08:06:33 +0000
X-Mizu-Trace-ID: 3872aa417a299e6d
X-Migadu-Flow: FLOW_OUT
Message-ID: <136b37a6-05ff-4ea1-8715-211a64040433@linux.dev>
Date: Tue, 8 Sep 2026 10:02:29 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/2] ASoC: tac5xx2-sdw: add tac5272 support
To: Niranjan Holalu Yogendra <niranjan.hy@ti.com>, linux-sound@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, broonie@kernel.org,
 ckeepax@opensource.cirrus.com, lgirdwood@gmail.com, perex@perex.cz,
 tiwai@suse.com, cezary.rojewski@intel.com, peter.ujfalusi@linux.intel.com,
 yung-chuan.liao@linux.intel.com, kai.vehmanen@linux.intel.com,
 baojun.xu@ti.com, shenghao-ding@ti.com, sandeepk@ti.com, v-hampiholi@ti.com
References: <20260908032757.389-1-niranjan.hy@ti.com>
Content-Language: en-US
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
In-Reply-To: <20260908032757.389-1-niranjan.hy@ti.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 9/8/26 05:27, Niranjan Holalu Yogendra wrote:
> From: Niranjan H Y <niranjan.hy@ti.com>
> 
>   Add support for tac5272 which is a UAJ
> only variant with no speaker and dmic.
> 
> Signed-off-by: Niranjan H Y <niranjan.hy@ti.com>
> Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>

this looks mostly ok at a high-level, but see below for improvement
suggestions

> ---
>  sound/soc/codecs/tac5xx2-sdw.c | 50 ++++++++++++++++++++++++++++++++--
>  1 file changed, 47 insertions(+), 3 deletions(-)
> 
> diff --git a/sound/soc/codecs/tac5xx2-sdw.c b/sound/soc/codecs/tac5xx2-sdw.c
> index a5f654cde..fe6d3f981 100644
> --- a/sound/soc/codecs/tac5xx2-sdw.c
> +++ b/sound/soc/codecs/tac5xx2-sdw.c
> @@ -146,6 +146,8 @@ struct tac5xx2_prv {
>  	struct device *dev;
>  	bool hw_init;
>  	bool first_hw_init_done;
> +	bool support_spk;
> +	bool support_dmic;
>  	u32 part_id;
>  	u32 rev_id;
>  	struct snd_soc_jack *hs_jack;
> @@ -1168,6 +1170,28 @@ static int tac_interrupt_callback(struct sdw_slave *slave,
>  	return 0;
>  }
>  
> +static struct snd_soc_dai_driver tac5272_dai_driver[] = {
> +	{
> +		.name = "tac5xx2-aif3",
> +		.id = TAC5XX2_UAJ,
> +		.playback = {
> +			.stream_name = "DP4 UAJ Speaker Playback",
> +			.channels_min = 1,
> +			.channels_max = 2,
> +			.rates = TAC5XX2_DEVICE_RATES,
> +			.formats = TAC5XX2_DEVICE_FORMATS,
> +		},
> +		.capture = {
> +			.stream_name = "DP7 UAJ Mic Capture",
> +			.channels_min = 1,
> +			.channels_max = 2,
> +			.rates = TAC5XX2_DEVICE_RATES,
> +			.formats = TAC5XX2_DEVICE_FORMATS,
> +		},
> +		.ops = &tac_dai_ops,
> +	},
> +};
> +
>  static struct snd_soc_dai_driver tac5572_dai_driver[] = {
>  	{
>  		.name = "tac5xx2-aif1",
> @@ -1409,8 +1433,16 @@ static const struct snd_soc_component_driver soc_codec_driver_tacdevice = {
>  	.endianness = 1,
>  };
>  
> +static const struct snd_soc_component_driver soc_codec_driver_tac5272 = {
> +	.probe = tac_component_probe,
> +	.remove = tac_component_remove,
> +	.idle_bias_on = 0,
> +	.endianness = 1,
> +};

This essentially removes the controls, widget and routes that were for
the 'default' tacdevice, which assumed the presence of speaker+dmic,
with UAJ optional.

	.num_controls = ARRAY_SIZE(tac5xx2_snd_controls),
	.dapm_widgets = tac5xx2_common_widgets,
	.num_dapm_widgets = ARRAY_SIZE(tac5xx2_common_widgets),
	.dapm_routes = tac5xx2_common_routes,
	.num_dapm_routes = ARRAY_SIZE(tac5xx2_common_routes),

Now that speaker+dmic become optional, you could remove these
initializations and dynamically add the controls/widgets/routes for
speaker and dmic if they are present, as you currently do for UAJ in
tac_component_probe(). That way you would treat all 3 options separately
and can handle whichever variations creative hardware designers come up
with.


> +
>  static s32 tac_init(struct tac5xx2_prv *tac_dev)
>  {
> +	const struct snd_soc_component_driver *template;
>  	struct snd_soc_component_driver *component_driver;
>  	struct snd_soc_dai_driver *dai_drv;
>  	int num_dais;
> @@ -1419,21 +1451,30 @@ static s32 tac_init(struct tac5xx2_prv *tac_dev)
>  	dev_set_drvdata(tac_dev->dev, tac_dev);
>  
>  	switch (tac_dev->part_id) {
> +	case 0x5272:
> +		dai_drv = tac5272_dai_driver;
> +		num_dais = ARRAY_SIZE(tac5272_dai_driver);
> +		template = &soc_codec_driver_tac5272;
> +		break;
>  	case 0x5572:
>  		dai_drv = tac5572_dai_driver;
>  		num_dais = ARRAY_SIZE(tac5572_dai_driver);
> +		template = &soc_codec_driver_tacdevice;
>  		break;
>  	case 0x5672:
>  		dai_drv = tac5672_dai_driver;
>  		num_dais = ARRAY_SIZE(tac5672_dai_driver);
> +		template = &soc_codec_driver_tacdevice;
>  		break;
>  	case 0x5682:
>  		dai_drv = tac5682_dai_driver;
>  		num_dais = ARRAY_SIZE(tac5682_dai_driver);
> +		template = &soc_codec_driver_tacdevice;
>  		break;
>  	case 0x2883:
>  		dai_drv = tas2883_dai_driver;
>  		num_dais = ARRAY_SIZE(tas2883_dai_driver);
> +		template = &soc_codec_driver_tacdevice;
>  		break;
>  	default:
>  		dev_err(tac_dev->dev, "Unsupported device: 0x%x\n",
> @@ -1446,7 +1487,7 @@ static s32 tac_init(struct tac5xx2_prv *tac_dev)
>  	if (!component_driver)
>  		return -ENOMEM;
>  
> -	memcpy(component_driver, &soc_codec_driver_tacdevice, sizeof(*component_driver));
> +	memcpy(component_driver, template, sizeof(*component_driver));
>  	if (tac_has_uaj_support(tac_dev))
>  		component_driver->set_jack = tac5xx2_set_jack;
>  
> @@ -1756,7 +1797,7 @@ static int tac_io_init(struct device *dev, struct sdw_slave *slave, bool first)
>  		}
>  	}
>  
> -	if (tac_dev->sa_func_data) {
> +	if (tac_dev->sa_func_data && tac_dev->support_spk) {
>  		ret = sdca_regmap_write_init(dev, tac_dev->regmap,
>  					     tac_dev->sa_func_data);
>  		if (ret) {
> @@ -1775,7 +1816,7 @@ static int tac_io_init(struct device *dev, struct sdw_slave *slave, bool first)
>  		}
>  	}
>  
> -	if (tac_dev->sm_func_data) {
> +	if (tac_dev->sm_func_data && tac_dev->support_dmic) {

this looks weird, is there a case where sm_func_data is not NULL but
support_dmic is false?

The addition of those support_ booleans doesn't seem quite right, why
not skip over the functions if they are not implemented?

It's not just arguing about the code for the sake of arguing, such
messages could become confusing for users/testers:

dev_dbg(dev, "SDCA functions enabled: SA=%s SM=%s UAJ=%s HID=%s",
		tac_dev->sa_func_data ? "yes" : "no",
		tac_dev->sm_func_data ? "yes" : "no",
		tac_dev->uaj_func_data ? "yes" : "no",
		tac_dev->hid_func_data ? "yes" : "no");

because they don't rely on the support_speaker boolean...

In general using ONE source of information is better...

>  		ret = sdca_regmap_write_init(dev, tac_dev->regmap,
>  					     tac_dev->sm_func_data);
>  		if (ret) {
> @@ -1995,6 +2036,8 @@ static s32 tac_sdw_probe(struct sdw_slave *peripheral,
>  	tac_dev->first_hw_init_done = false;
>  	tac_dev->part_id = id->part_id;
>  	tac_dev->rev_id = 0x0;
> +	tac_dev->support_spk = (id->part_id != 0x5272);
> +	tac_dev->support_dmic = (id->part_id != 0x5272);
>  	dev_set_drvdata(dev, tac_dev);
>  
>  	regmap = devm_regmap_init_sdw_mbq_cfg(&peripheral->dev, peripheral,
> @@ -2045,6 +2088,7 @@ static void tac_sdw_remove(struct sdw_slave *peripheral)
>  }
>  
>  static const struct sdw_device_id tac_sdw_id[] = {
> +	SDW_SLAVE_ENTRY(0x0102, 0x5272, 0),
>  	SDW_SLAVE_ENTRY(0x0102, 0x5572, 0),
>  	SDW_SLAVE_ENTRY(0x0102, 0x5672, 0),
>  	SDW_SLAVE_ENTRY(0x0102, 0x5682, 0),

