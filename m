Received: from mta0.migadu.com (out-196.mta0.migadu.com [91.218.175.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCED33890F8
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 18:29:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789410560; cv=none; b=H+IHK1evJZFLsiFFjEI7wMWXXrSYMdf0ShUV/v3CYjntUKcLmE6Ub/cDi+nd/RTsrIRhFxKpeJDFtihSnsvSNsQyhvlFLzUney+BzXf2C49Ykf+HQb20GvVfpbFgD5IN0aYxG717NXbH+krJf7tqBUbPcqmnqYLVM2mB0MX5CJY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789410560; c=relaxed/simple;
	bh=SbOf+X7P5Uk1jXdMKZgWyQenep8GU8iSruKsda0GEqM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=f9anWYOdCZpI7YyO65eTdQScyTgtBaoKki1Pefh3hFJMoV8S7CapHY3r5Obsy3dgc65z/pS+QCUYRyRNP9dLWQCaRCB9Fym7CokfSM07DRQlVkW7bD3de4lMYzhvpk5IasB5jXY8uSN7SGz5JLAaoubVQERNlfExA/h5Vj02+2w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=q8n230uE; arc=none smtp.client-ip=91.218.175.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="q8n230uE"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=SbOf+X7P5Uk1jXdMKZgWyQenep8GU8iSruKsda0GEqM=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1789410554; v=1; x=1790015354;
 b=q8n230uEVbuXf2wwGAurx7pKUn5do+Z1U1xwD70rxTWWHYoL0S1L1Kii1HdDZiprAtF89D7+
 pF3zsvqCAwaf4BZ9ssepvAkoTA+DnEABSBtUQXkvxkzoOTcSHwUyaudxqFRwfVfqe5uyVmxhjsy
 MOkNJZlRG7LYfG9E6eWvAK0Y=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id aa833c5d9575ff90;
	Mon, 14 Sep 2026 18:29:13 +0000
X-Mizu-Trace-ID: aa833c5d9575ff90
X-Migadu-Flow: FLOW_OUT
Message-ID: <ac77dc6c-a216-42a3-a858-8fcfff65e364@linux.dev>
Date: Mon, 14 Sep 2026 19:55:19 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ASoC: codecs: rt712-sdca-dmic: fix uninitialized
 stream_config->type
To: Jiangshan Yi <yijiangshan@kylinos.cn>, oder_chiou@realtek.com,
 lgirdwood@gmail.com, broonie@kernel.org, perex@perex.cz, tiwai@suse.com
Cc: shumingf@realtek.com, linux-sound@vger.kernel.org,
 linux-kernel@vger.kernel.org, 13667453960@163.com, stable@vger.kernel.org
References: <20260914104712.379574-1-yijiangshan@kylinos.cn>
Content-Language: en-US
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
In-Reply-To: <20260914104712.379574-1-yijiangshan@kylinos.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 9/14/26 12:47, Jiangshan Yi wrote:
> stream_config is not initialized before being passed to
> sdw_stream_add_slave().  The type field may contain garbage and is
> later copied to stream->type by sdw_config_stream().
> 
> Zero-initialize stream_config so type defaults to SDW_STREAM_PCM.
> 
> While at it, use snd_sdw_params_to_config() helper instead of
> open-coding the same logic.
> 
> Fixes: 63a511284c9e ("ASoC: rt712-sdca: Add RT712 SDCA driver for Mic topology")
> Cc: stable@vger.kernel.org
> Signed-off-by: Jiangshan Yi <yijiangshan@kylinos.cn>
> ---
>  sound/soc/codecs/rt712-sdca-dmic.c | 14 +++++---------
>  1 file changed, 5 insertions(+), 9 deletions(-)

This change looks correct, and there are quite a few other codecs in the
same directory where the same change could be applied. Just look for
"struct sdw_stream_config stream_config;"

For this patch here's my

Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>


> 
> diff --git a/sound/soc/codecs/rt712-sdca-dmic.c b/sound/soc/codecs/rt712-sdca-dmic.c
> index 8860d81134e7..a9f3aa4e143a 100644
> --- a/sound/soc/codecs/rt712-sdca-dmic.c
> +++ b/sound/soc/codecs/rt712-sdca-dmic.c
> @@ -13,6 +13,7 @@
>  #include <sound/core.h>
>  #include <sound/pcm.h>
>  #include <sound/pcm_params.h>
> +#include <sound/sdw.h>
>  #include <sound/tlv.h>
>  #include "rt712-sdca.h"
>  #include "rt712-sdca-dmic.h"
> @@ -632,10 +633,10 @@ static int rt712_sdca_dmic_hw_params(struct snd_pcm_substream *substream,
>  {
>  	struct snd_soc_component *component = dai->component;
>  	struct rt712_sdca_dmic_priv *rt712 = snd_soc_component_get_drvdata(component);
> -	struct sdw_stream_config stream_config;
> +	struct sdw_stream_config stream_config = {0};
>  	struct sdw_port_config port_config;
>  	struct sdw_stream_runtime *sdw_stream;
> -	int retval, num_channels;
> +	int retval;
>  	unsigned int sampling_rate;
> 
>  	dev_dbg(dai->dev, "%s %s", __func__, dai->name);
> @@ -647,13 +648,8 @@ static int rt712_sdca_dmic_hw_params(struct snd_pcm_substream *substream,
>  	if (!rt712->slave)
>  		return -EINVAL;
> 
> -	stream_config.frame_rate = params_rate(params);
> -	stream_config.ch_count = params_channels(params);
> -	stream_config.bps = snd_pcm_format_width(params_format(params));
> -	stream_config.direction = SDW_DATA_DIR_TX;
> -
> -	num_channels = params_channels(params);
> -	port_config.ch_mask = GENMASK(num_channels - 1, 0);
> +	/* SoundWire specific configuration */
> +	snd_sdw_params_to_config(substream, params, &stream_config, &port_config);
>  	port_config.num = 2;
> 
>  	retval = sdw_stream_add_slave(rt712->slave, &stream_config,
> --
> 2.25.1
> 
> 

