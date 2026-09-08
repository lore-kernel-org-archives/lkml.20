Received: from mta1.migadu.com (out-110.mta1.migadu.com [95.215.58.110])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 797CA3876CD
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 08:06:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.110
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788854802; cv=none; b=tHwnqcDgVTgrknYgslYEfxI7gUqIhSEsFuR7iBkyEsmm93U4/6UzmHXEpUxbqlzJai53ymqDxBotfqhKWj7n27pOgUcMq7xDhnqZ59Tgj8uesxJuiKCDBxQRtEkzSziGCxBWZyF36BVT5AXHMBBb12B83qCQmprvPuLZev03qeE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788854802; c=relaxed/simple;
	bh=X40NbP2VG3ynlCJ/mMCdKpCJsDLmQc6h9+cTEAWmcsE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YRC4Al3DSqfzR5+yGBLOh4VsVxL9zzzyhCKhSJnmlaKLVlw78dZ4TSDBG2t0OATet1lMfdsq1+bqIkWwn1cOHqMNN6xmXLgKwmkTqUX9awcgoBaQL6kFZEkeIEIEDTurfwMnF15dEVvoG58psY5yKs/8YECfkEfB+CwvV7cxBwM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=rhOU4HRn; arc=none smtp.client-ip=95.215.58.110
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="rhOU4HRn"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=X40NbP2VG3ynlCJ/mMCdKpCJsDLmQc6h9+cTEAWmcsE=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1788854798; v=1; x=1789459598;
 b=rhOU4HRngGezHIaW5x1C9VMF6X3WhwLxpat1O7zmmH9O4aG8TCmW1Gaj7bAe8B8Zh47Dypac
 kQAuW2o1qxlLKHUSUH+LOHgXRoOOV8gi9YpxWIR1xe07x+N+yAA95ST+pV7T20Yzyu5DtACkdwO
 d4VbrmqGO0yfLHqtVyurJnUc=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id d13c9dd9c39d3850;
	Tue, 08 Sep 2026 08:06:38 +0000
X-Mizu-Trace-ID: d13c9dd9c39d3850
X-Migadu-Flow: FLOW_OUT
Message-ID: <adbffefd-b921-48b5-b0dc-a5f4c26d0838@linux.dev>
Date: Tue, 8 Sep 2026 10:03:34 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 2/2] ASoC: sdw_utils: add tac5272 support
To: Niranjan Holalu Yogendra <niranjan.hy@ti.com>, linux-sound@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, broonie@kernel.org,
 ckeepax@opensource.cirrus.com, lgirdwood@gmail.com, perex@perex.cz,
 tiwai@suse.com, cezary.rojewski@intel.com, peter.ujfalusi@linux.intel.com,
 yung-chuan.liao@linux.intel.com, kai.vehmanen@linux.intel.com,
 baojun.xu@ti.com, shenghao-ding@ti.com, sandeepk@ti.com, v-hampiholi@ti.com
References: <20260908032757.389-1-niranjan.hy@ti.com>
 <20260908032757.389-2-niranjan.hy@ti.com>
Content-Language: en-US
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
In-Reply-To: <20260908032757.389-2-niranjan.hy@ti.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 9/8/26 05:27, Niranjan Holalu Yogendra wrote:
> From: Niranjan H Y <niranjan.hy@ti.com>
> 
>  Update soundiwre utils to support tac5272 which is
> UAJ only variant.
> 
> Signed-off-by: Niranjan H Y <niranjan.hy@ti.com>
> Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>

this one looks fine.

Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>

> ---
>  sound/soc/sdw_utils/soc_sdw_utils.c | 21 +++++++++++++++++++++
>  1 file changed, 21 insertions(+)
> 
> diff --git a/sound/soc/sdw_utils/soc_sdw_utils.c b/sound/soc/sdw_utils/soc_sdw_utils.c
> index 88031238c..ab0132031 100644
> --- a/sound/soc/sdw_utils/soc_sdw_utils.c
> +++ b/sound/soc/sdw_utils/soc_sdw_utils.c
> @@ -81,6 +81,27 @@ static const struct snd_kcontrol_new rt700_controls[] = {
>  };
>  
>  struct asoc_sdw_codec_info codec_info_list[] = {
> +	{
> +		.vendor_id = 0x0102,
> +		.part_id = 0x5272,
> +		.name_prefix = "tac5272",
> +		.dais = {
> +			{
> +				/* UAJ only - no speaker or DMIC */
> +				.direction = {true, true},
> +				.dai_name = "tac5xx2-aif3",
> +				.component_name = "tac5272",
> +				.dai_type = SOC_SDW_DAI_TYPE_JACK,
> +				.dailink = {SOC_SDW_JACK_OUT_DAI_ID, SOC_SDW_JACK_IN_DAI_ID},
> +				.controls = generic_jack_controls,
> +				.num_controls = ARRAY_SIZE(generic_jack_controls),
> +				.widgets = generic_jack_widgets,
> +				.num_widgets = ARRAY_SIZE(generic_jack_widgets),
> +				.rtd_init = asoc_sdw_ti_sdca_jack_rtd_init,
> +			},
> +		},
> +		.dai_num = 1,
> +	},
>  	{
>  		.vendor_id = 0x0102,
>  		.part_id = 0x5572,

