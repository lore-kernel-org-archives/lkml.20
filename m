Received: from mta0.migadu.com (out-109.mta0.migadu.com [91.218.175.109])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CA86479886
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 11:32:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.109
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788780756; cv=none; b=eDoOIiDVXN8AdhVV6t1IzjhxSGBSKftRFXQgJTNGnOlPaf4IU/5ytmux5t7UkIcEV0Q7S59xeDTwZskM6j4nssH608Z2YfFifVzVcKKrjQoZqx25xcyd490JprVU56SaWC4vG7zVajHsz90ZmSY9eSldf+ipDlWcz3mXsfd9Nas=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788780756; c=relaxed/simple;
	bh=rvLCnfgy6I04fD8/CycKcJZ6RfCiOFO7BcEMS03VEHM=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=uUDzFUnWR18HLsdtQFLHuCmFUdjL6kDsRj/8NgJA7paJH4cnE1oxayt9BNUXcgyS4cMh3PcGSaArnhNP5BELDl1txQJdIzghmvj4nnuDj/AcC2cwYgHIiFz8A+7pnyUJGf8OTetpJXh3tOKeTbNlV20N/zdiWD3IJOMbI7d8RmY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=tcPSf29m; arc=none smtp.client-ip=91.218.175.109
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="tcPSf29m"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=rvLCnfgy6I04fD8/CycKcJZ6RfCiOFO7BcEMS03VEHM=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1788780752; v=1; x=1789385552;
 b=tcPSf29mmTjAxfZIn6VxMPkF6UBu78cksWQXtKIjfe9KY4B1wS5nil7JTUxvHY92N4+ayF2Q
 yWmmFvvY8B1jJinyf7q8t7gwglaJt0y7SDGJXY+GzvJ5Lt6UUs38OlyqDqngL+jsQU85nSWVsNb
 Au93SzfZpUzJeMUZDcENl6yQ=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id c698de2c7da5b2c6;
	Mon, 07 Sep 2026 11:32:32 +0000
X-Mizu-Trace-ID: c698de2c7da5b2c6
X-Migadu-Flow: FLOW_OUT
Message-ID: <289d5485-44fa-4d74-8f69-7adc1507ac9e@linux.dev>
Date: Mon, 7 Sep 2026 13:32:30 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
Subject: Re: [PATCH v2 08/11] ASoC: SDCA: make find_sdca_control_reset()
 return void
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
 <20260907083727.733705-9-srinivas.kandagatla@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260907083727.733705-9-srinivas.kandagatla@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 9/7/26 10:37, Srinivas Kandagatla wrote:
> find_sdca_control_reset() only ever returns 0 -- it just sets
> control->has_reset / control->reset for the framework-known
> (entity type, control selector) mappings.  The int return + caller
> error check in find_sdca_entity_control() are dead code.
> 
> Convert to void and drop the check.  No functional change.
> 
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>

That looks also unrelated to DT stuff, not sure it belongs here as patch
08/11

Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>

> ---
>  sound/soc/sdca/sdca_functions.c | 10 +++-------
>  1 file changed, 3 insertions(+), 7 deletions(-)
> 
> diff --git a/sound/soc/sdca/sdca_functions.c b/sound/soc/sdca/sdca_functions.c
> index 25f95575c731..68a50552f4e4 100644
> --- a/sound/soc/sdca/sdca_functions.c
> +++ b/sound/soc/sdca/sdca_functions.c
> @@ -922,8 +922,8 @@ static int find_sdca_control_value(struct device *dev, struct sdca_entity *entit
>  	return 0;
>  }
>  
> -static int find_sdca_control_reset(const struct sdca_entity *entity,
> -				   struct sdca_control *control)
> +static void find_sdca_control_reset(const struct sdca_entity *entity,
> +				    struct sdca_control *control)
>  {
>  	switch (SDCA_CTL_TYPE(entity->type, control->sel)) {
>  	case SDCA_CTL_TYPE_S(FU, AGC):
> @@ -950,8 +950,6 @@ static int find_sdca_control_reset(const struct sdca_entity *entity,
>  	default:
>  		break;
>  	}
> -
> -	return 0;
>  }
>  
>  static int find_sdca_entity_control(struct device *dev, struct sdca_entity *entity,
> @@ -1032,9 +1030,7 @@ static int find_sdca_entity_control(struct device *dev, struct sdca_entity *enti
>  
>  	control->is_volatile = find_sdca_control_volatile(entity, control);
>  
> -	ret = find_sdca_control_reset(entity, control);
> -	if (ret)
> -		return ret;
> +	find_sdca_control_reset(entity, control);
>  
>  	ret = find_sdca_control_range(dev, control_node, &control->range);
>  	if (ret) {

