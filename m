Received: from mta0.migadu.com (out-99.mta0.migadu.com [91.218.175.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E66C848C8CD
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 11:32:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788780750; cv=none; b=NsL3AH+OhAPhT76/UpBZPw3qdyxb0+GjOAc0GQk1lwFIbcsXLTUQ1bFLFn2oMK4LbiWrG9r28TLFVELjY22YYLMu8DLbdtzyOM0Cwk4YZn/hvr8yqaKxlfFdJ+rlP4ZFpIam51fY1nIZfr9ghuNNtvGz4rB96qn3WNqN42rcD5w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788780750; c=relaxed/simple;
	bh=n7XLZLvFH8fFq/iBcJ5zwauMK8eNcIP1h1M8aTfDUdU=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=sWSrjTqW8kWxvG69AV0CBCi1deo/gYicFfAhUec9GNVdocFVHsNCOrhHbmDi7uVkI1MyHodu+IdmoQ2Ipvc2u4o7vJ1oNbCx1XcVKgjk1Bvxs/yssyDp2sdQc9PM6usXDQ2wYTNRb0+KgY2VOt6LYZ4Jo12ucPN2Te7HzkphtRw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=Qj0/R4AP; arc=none smtp.client-ip=91.218.175.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="Qj0/R4AP"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=n7XLZLvFH8fFq/iBcJ5zwauMK8eNcIP1h1M8aTfDUdU=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1788780745; v=1; x=1789385545;
 b=Qj0/R4APLkZgB5f51N9IzsowIwks+APsfqDZ0rKeNp0gCov5g9M0GAus4kxzmkD/MwNnz34q
 JXAjTxAxiFu88AXbe2AkzVGr2dhkzCygVBwJU8S0zKWwGENQo5XWEtrNbvj4p/X0ZMPmV845CtL
 q6tfqHwM4Vf2fi1K7gM3+jUs=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 72705e4ad1561e59;
	Mon, 07 Sep 2026 11:32:25 +0000
X-Mizu-Trace-ID: 72705e4ad1561e59
X-Migadu-Flow: FLOW_OUT
Message-ID: <45905eff-fd40-420f-b2fd-7aa487aa4807@linux.dev>
Date: Mon, 7 Sep 2026 13:32:24 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
Subject: Re: [PATCH v2 07/11] ASoC: SDCA: register
 SDCA_FUNCTION_TYPE_SIMPLE_JACK in class function driver
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
 <20260907083727.733705-8-srinivas.kandagatla@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260907083727.733705-8-srinivas.kandagatla@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 9/7/26 10:37, Srinivas Kandagatla wrote:
> Add SDCA_FUNCTION_TYPE_SIMPLE_JACK to the class function driver's
> auxiliary id table so a SimpleJack auxdev is bound and enumerated as
> an ASoC component.  Wire set_jack for this function type so the machine
> driver can register an ASoC jack against it.
> 
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
> Reviewed-by: Charles Keepax <ckeepax@opensource.cirrus.com>

This should be submitted separately, there's no dependency on DT stuff?

Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>

> ---
>  sound/soc/sdca/sdca_class_function.c | 5 +++++
>  sound/soc/sdca/sdca_functions.c      | 2 ++
>  2 files changed, 7 insertions(+)
> 
> diff --git a/sound/soc/sdca/sdca_class_function.c b/sound/soc/sdca/sdca_class_function.c
> index ab043e23878e..713a34d5954a 100644
> --- a/sound/soc/sdca/sdca_class_function.c
> +++ b/sound/soc/sdca/sdca_class_function.c
> @@ -408,6 +408,7 @@ static int class_function_probe(struct auxiliary_device *auxdev,
>  	switch (drv->function->desc->type) {
>  	case SDCA_FUNCTION_TYPE_UAJ:
>  	case SDCA_FUNCTION_TYPE_RJ:
> +	case SDCA_FUNCTION_TYPE_SIMPLE_JACK:
>  		cmp_drv->set_jack = class_function_set_jack;
>  		break;
>  	default:
> @@ -593,6 +594,10 @@ static const struct auxiliary_device_id class_function_id_table[] = {
>  		.name = "snd_soc_sdca." SDCA_FUNCTION_TYPE_RJ_NAME,
>  		.driver_data = SDCA_FUNCTION_TYPE_RJ,
>  	},
> +	{
> +		.name = "snd_soc_sdca." SDCA_FUNCTION_TYPE_SIMPLE_NAME,
> +		.driver_data = SDCA_FUNCTION_TYPE_SIMPLE_JACK,
> +	},
>  	{},
>  };
>  MODULE_DEVICE_TABLE(auxiliary, class_function_id_table);
> diff --git a/sound/soc/sdca/sdca_functions.c b/sound/soc/sdca/sdca_functions.c
> index 47dedb62c24c..25f95575c731 100644
> --- a/sound/soc/sdca/sdca_functions.c
> +++ b/sound/soc/sdca/sdca_functions.c
> @@ -79,6 +79,8 @@ static const char *get_sdca_function_name(u32 function_type)
>  		return SDCA_FUNCTION_TYPE_SPEAKER_MIC_NAME;
>  	case SDCA_FUNCTION_TYPE_RJ:
>  		return SDCA_FUNCTION_TYPE_RJ_NAME;
> +	case SDCA_FUNCTION_TYPE_SIMPLE_JACK:
> +		return SDCA_FUNCTION_TYPE_SIMPLE_NAME;
>  	case SDCA_FUNCTION_TYPE_COMPANION_AMP:
>  		return SDCA_FUNCTION_TYPE_COMPANION_AMP_NAME;
>  	case SDCA_FUNCTION_TYPE_IMP_DEF:

