Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794922163;
	b=CwzI+hKxwB8yeMBVf2yD9BuDXt7bSrqcjtPGXCFeRD3CT6LpSGQGdSN8LcTS5y+7jqbP
	 rNxpJoaiuPcH/RJ+QF5reSBKrbjea7Z+0VAuhsR4rmz8a3dQ3XDUzrA3WPDVp9pETJ1kA
	 s/FZEeSmB8OZV3nUDcPTzpF48AEAKruwXSCnXHR1Zz1vtXuE4uIAu7KFmA5sTUW6m5jtb
	 E40ucGOtL9BSZLqVGYAiFOvmZI5hGi44n5eYBIIOH0W5oiU06W/rqLpnQQoxnTmD/wx1x
	 S7Md0P9yAhkCkATBf9TI0rTuL+GwhNibXJ/FTk/BetU6L3TD1R0ttB2rrFVnNJBgpUw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794922163;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=VIRjmYOXU4N+Y9CyQYs3jWDHtZ5Tq6SefAgjXNe/Yvs=;
	b=LNrWsGz15rmmt3t+1G2nhimX0Is15lcwqbHNDQLYwHfGBUk/pgTjKc3oFnc+V9wzelKG
	 NjGxx0zDai3XHDgHAZngN48nLD7P5IFhkp6mwS1LqdO9ySNHfVudJkFLtYwmJyS6/udkS
	 RMRjIehFfiotGILJ4ozZ1SWMezHREsQPOlGL+m35fakBhwZGcurZ9SpHzUn67wurr3+vJ
	 GKepvkvM/v8CwBvtBFGXyy2G3XkmiehBng/3F6rvU7r2FLhQPltgxDjmB2Mzao9x6qp+A
	 LW86JIzU3YBIeGKRuoNM3e0iJdgZ/WmgrWs3vKlHyiAxDFvtumxwVmgzihgTg2/Gd3Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Vwpia829;
	arc=none smtp.remote-ip=192.198.163.18
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54974606A31C;
	Tue, 17 Nov 2026 13:29:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 54974606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Vwpia829
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794922163; x=1826458163;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=5w7nCuhd5TO4rsmvfXAk7zN8k8PNfTo0oC4dCz6E/kE=;
  b=Vwpia829nJXTB7/3H6lIVZiXh8z7gpXTmIYUQIqXDPYrhf/HnYmXCVH8
   A5sVGuLhC5ZlSachmcY+2x1ZXbout2Woba+3ST8mTJ4FpiekpG9G0NF3Q
   HXztnP35jeooQoagIAaSu6KMjgXir7Bgda0TrUN+7iS71W52AaCnDl4sf
   PN1TU/PnZBVbZOnhKhgz8a5BwT/GgbuJFUxTFuKIXOXq/xuhVvALQwPPT
   LlUFvMaaGp0bpu2IkcI/A7V3MKvCQEq/dl22Qeu7m5CA1rZNzHtwZHkpe
   08X76PZLuc2GvHrwZilWB6lh72XLacB1iD+Tqt9bOnM8menGcQJwJHP9N
   Q==;
X-CSE-ConnectionGUID: VZxmqny/QRexhBu623vVZw==
X-CSE-MsgGUID: IFo+5LvdTOyaVKL9o+FHcg==
X-IronPort-AV: E=McAfee;i="6800,10657,11969"; a="3720959"
X-IronPort-AV: E=Sophos;i="6.27,218,1787036400"; 
   d="scan'208";a="3720959"
Received: from fmviesa013.fm.intel.com ([10.60.135.153])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Nov 2026 05:29:14 -0800
X-CSE-ConnectionGUID: UhIcM4MDQXCQCqChubeh9w==
X-CSE-MsgGUID: HnCy17q3R2S6Ek3YexrTeA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,218,1787036400"; 
   d="scan'208";a="11767290"
Received: from smoticic-mobl1.ger.corp.intel.com (HELO [10.245.245.246]) ([10.245.245.246])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Nov 2026 05:29:03 -0800
Message-ID: <a73265bb-5644-414b-ad4a-2c71b50626a8@linux.intel.com>
Date: Tue, 17 Nov 2026 15:29:42 +0200
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
Subject: Re: [PATCH] ASoC: SOF: control: Reject out of range volume and switch
 values
To: HyeongJun An <sammiee5311@gmail.com>, Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Daniel Baluta <daniel.baluta@nxp.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 sound-open-firmware@alsa-project.org, linux-sound@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20261114021730.2349347-1-sammiee5311@gmail.com>
From: =?UTF-8?Q?P=C3=A9ter_Ujfalusi?= <peter.ujfalusi@linux.intel.com>
Content-Language: en-US
In-Reply-To: <20261114021730.2349347-1-sammiee5311@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 14/11/2026 04:17, HyeongJun An wrote:
> The snd_sof_volume_put() and snd_sof_switch_put() pass the user values
> to the IPC put handlers without a range check. The switch handlers
> store any value and send it to the firmware, so on IPC3 writing 2 or -1
> to a switch reads back as 2 or 4294967295. The volume handlers convert
> the value to u32 and clamp it to the end of the volume table. Writing -1
> sets the maximum volume, and on 64-bit writing LONG_MIN sets the
> minimum, both without an error.
> 
> Return -EINVAL for values outside the range reported by the info
> callback, as snd_soc_put_volsw() does. This fixes the write_invalid
> failures in mixer-test, and the event_spurious failures caused by the
> events those writes generated.
> 
> Fixes: c3078f539704 ("ASoC: SOF: Add Sound Open Firmware KControl support")
> Signed-off-by: HyeongJun An <sammiee5311@gmail.com>

> ---
> Tested on a Dell Latitude 9420 (Tiger Lake, SOF IPC3): the out of range
> writes now fail with -EINVAL, in range writes still work, and the 9
> mixer-test failures on the SOF controls are gone. IPC4 was not tested.
> Its put handlers store the value the same way and now go through the
> same check.
> 
> Prepared with Claude Code (Claude Opus 5.5). Tested on x86_64.
> 
>  sound/soc/sof/control.c | 34 ++++++++++++++++++++++++++++++++++
>  1 file changed, 34 insertions(+)
> 
> diff --git a/sound/soc/sof/control.c b/sound/soc/sof/control.c
> index 74d997a4f620..b6497e50505b 100644
> --- a/sound/soc/sof/control.c
> +++ b/sound/soc/sof/control.c
> @@ -30,6 +30,30 @@ int snd_sof_volume_get(struct snd_kcontrol *kcontrol,
>  	return 0;
>  }
>  
> +/*
> + * Reject values outside the range the info callback reports, as
> + * snd_soc_put_volsw() does. The IPC put handlers do not check the range.
> + */
> +static int sof_mixer_check_values(struct soc_mixer_control *sm,
> +				  struct snd_sof_control *scontrol,
> +				  struct snd_ctl_elem_value *ucontrol)
> +{
> +	long max = sm->max - sm->min;
> +	unsigned int i;
> +
> +	if (sm->platform_max && sm->platform_max < max)
> +		max = sm->platform_max;

the volume_info() reports max to user space:
sm->platform_max - sm->min;

If for example: min=10, max=100, platform_max=80

here we accept up to 80, and report 70 via info for max, which is wrong.

Can you update the patch and align the info() call to do similar
calculation?

int max = sm->max - sm->min;

if (sm->platform_max && sm->platform_max < max)
    max = sm->platform_max;

uinfo->value.integer.min = 0;
uinfo->value.integer.max = max;

We don't have any volume control with min other than 0, but if we would
have, the put function disregard those and write the raw value.
Note to self to fix this.


> +
> +	for (i = 0; i < scontrol->num_channels; i++) {
> +		long val = ucontrol->value.integer.value[i];
> +
> +		if (val < 0 || val > max)
> +			return -EINVAL;
> +	}
> +
> +	return 0;
> +}
> +
>  int snd_sof_volume_put(struct snd_kcontrol *kcontrol,
>  		       struct snd_ctl_elem_value *ucontrol)
>  {
> @@ -38,6 +62,11 @@ int snd_sof_volume_put(struct snd_kcontrol *kcontrol,
>  	struct snd_soc_component *scomp = scontrol->scomp;
>  	struct snd_sof_dev *sdev = snd_soc_component_get_drvdata(scomp);
>  	const struct sof_ipc_tplg_ops *tplg_ops = sof_ipc_get_ops(sdev, tplg);
> +	int ret;
> +
> +	ret = sof_mixer_check_values(sm, scontrol, ucontrol);
> +	if (ret)
> +		return ret;
>  
>  	if (tplg_ops && tplg_ops->control && tplg_ops->control->volume_put)
>  		return tplg_ops->control->volume_put(scontrol, ucontrol);
> @@ -90,6 +119,11 @@ int snd_sof_switch_put(struct snd_kcontrol *kcontrol,
>  	struct snd_soc_component *scomp = scontrol->scomp;
>  	struct snd_sof_dev *sdev = snd_soc_component_get_drvdata(scomp);
>  	const struct sof_ipc_tplg_ops *tplg_ops = sof_ipc_get_ops(sdev, tplg);
> +	int ret;
> +
> +	ret = sof_mixer_check_values(sm, scontrol, ucontrol);
> +	if (ret)
> +		return ret;
>  
>  	if (tplg_ops && tplg_ops->control && tplg_ops->control->switch_put)
>  		return tplg_ops->control->switch_put(scontrol, ucontrol);

-- 
Péter

