Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.239
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792426844;
	b=fEdsIRwsByFVo/ulrZm2eWiN3myOb2WsmRrGH8N4TF26O8mmNvTR+XyJh9Tg9PRwi2xw
	 hAt1rU051KSDV4BvXU3f5nWM081kINL0Qv0sf5NHPE4NP7xMHMCJEAAG2L7YDWQ15wPwo
	 uHanhrOx99uCCbBU8zy7w0xQ4dF7oGAWUVm1JDwm0FDb9n+MRJUvcfQucOgzLuHrinu1M
	 GLKxuBervrjSCfEI9lISPm6k0u1BUJp4Cas8nQ6kzNGzSlooXX7ff+JfFlSEzWUlQKJMN
	 mw49EnkIrRvjXNJlT59laJ1dvHzZ6chvaFIVD/c+1f8BPeI+IXFZIyqDElRA/3pZWmw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792426844;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=KmfnkkHX/Kv9eAERPcnx9bL8/gx+whzTWWHRBtgqcMI=;
	b=m2WD2q89GWfTMPjhfHpMxdFo4/Gnm92qIz5xFu/Z6Z8hj3zjIeM21W8zd6tfvAQ0lRK5
	 Xgdjw1smTg2k95elZcL1IJtcFTMnwGDT1J5rgqBsxCYM+OdUK0yPVGdCYH+4h8dIJsp4Y
	 /pdbLdCMFs6c/NyTbMpU0+t7bdkp8K19mZps3Z2MSWIbfpI/x5eodUBF5l077JtEhIc4B
	 aOOjeYEK/H2zU2b42KFP+pu92cLug9lRZx86myLZasbkjadAoXynHl04Bkr5NsDEt/2Wv
	 DmGzPcho5tPrJNWuVxjUMztpX7a9nxz4O5PQGW/BHkJVgL3+tKocPjjRcOrUZKIMHCg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b="bzN/+NVk";
	arc=none smtp.remote-ip=91.218.175.239
Received: from mta0.migadu.com (out-239.mta0.migadu.com [91.218.175.239])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 061FF606A31E
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 16:20:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 061FF606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=bzN/+NVk
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=991sY+KJBHw/7WxxkSUJihXz0hlJOC6Uox8AFK1O9Sg=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1792426842; v=1; x=1793031642;
 b=bzN/+NVkOze89gVGjdJaVOa9X67VAMO1PQaI9UzYOWYa1vBrQzutPlnoLwOv5p2dHkTsHQIl
 F9VtpmKRipyraGOS0uQYOVcLUR3wFZJmxq6EqN0nBllwLIhp7Wh+PgszYhlnXjWsBT2/Sk/CnUS
 Ciwt5J+pvVjsB+cD0iQXZV0s=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 6ed66b5cad0514f7;
	Mon, 19 Oct 2026 16:20:41 +0000
X-Mizu-Trace-ID: 6ed66b5cad0514f7
X-Migadu-Flow: FLOW_OUT
Message-ID: <3ef796a7-33f5-4b9c-9a18-476acf39c7ac@linux.dev>
Date: Mon, 19 Oct 2026 18:10:41 +0200
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
Subject: Re: [PATCH 3/3] ASoC: tas2783-sdw: refuse playback when the init
 writes failed
To: Matthew Schwartz <matthew.schwartz@linux.dev>, broonie@kernel.org
Cc: Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>,
 Baojun Xu <baojun.xu@ti.com>, Sen Wang <sen@ti.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Charles Keepax
 <ckeepax@opensource.cirrus.com>, Niranjan H Y <niranjan.hy@ti.com>,
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261018200009.1493438-1-matthew.schwartz@linux.dev>
 <20261018200009.1493438-4-matthew.schwartz@linux.dev>
Content-Language: en-US
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
In-Reply-To: <20261018200009.1493438-4-matthew.schwartz@linux.dev>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/18/26 22:00, Matthew Schwartz wrote:
> When the SDCA function initialization writes fail, tas_io_init() leaves
> hw_init false, but the firmware download has already set fw_dl_success,
> so tas_sdw_hw_params() goes on to play through an amp that is missing
> part of its setup. On the ASUS ROG Xbox Ally X20 those writes come from
> the ACPI DisCo initialization table and include the posture, which the
> BIOS sets differently on each amp.
> 
> Refuse playback until the init writes have completed as well, and log
> which of the two steps is missing. A stream that is only prepared again
> after a resume does not go through hw_params, so check in the port
> prepare as well.

Same comment as the previous patch. This patch logs an error message for
a critical error, which seems fine, but what does it take to make the
init writes succeed in the first place?
IOW, this patch flags an incorrect setup without giving information on
what possible corrective actions could be taken.

> Fixes: ca8f3611dcf8 ("ASoC: tas2783A: use acpi initialisation table")
> Signed-off-by: Matthew Schwartz <matthew.schwartz@linux.dev>
> ---
>  sound/soc/codecs/tas2783-sdw.c | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/sound/soc/codecs/tas2783-sdw.c b/sound/soc/codecs/tas2783-sdw.c
> index 8e7376889b6d..6c4cc8868415 100644
> --- a/sound/soc/codecs/tas2783-sdw.c
> +++ b/sound/soc/codecs/tas2783-sdw.c
> @@ -1055,6 +1055,11 @@ static s32 tas_sdw_hw_params(struct snd_pcm_substream *substream,
>  		return -EINVAL;
>  	}
>  
> +	if (!tas_dev->hw_init) {
> +		dev_err(tas_dev->dev, "error playback without init writes");
> +		return -EINVAL;
> +	}
> +
>  	sdw_stream = snd_soc_dai_get_dma_data(dai, substream);
>  	if (!sdw_stream)
>  		return -EINVAL;
> @@ -1427,6 +1432,12 @@ static int tas_port_prep(struct sdw_slave *slave, struct sdw_prepare_ch *prep_ch
>  	addr = SDW_DPN_PREPARECTRL(prep_ch->num);
>  	switch (pre_ops) {
>  	case SDW_OPS_PORT_PRE_PREP:
> +		if (!tas_dev->hw_init) {
> +			dev_err(dev, "error port %d prepare without init writes\n",
> +				prep_ch->num);
> +			return -EINVAL;
> +		}
> +
>  		/*
>  		 * The Function has to be powered before the port can complete
>  		 * channel preparation.  hw_params() does that when a stream is

