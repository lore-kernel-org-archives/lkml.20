Received: from mta0.migadu.com (out-70.mta0.migadu.com [91.218.175.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A344947D93C
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 11:32:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788780743; cv=none; b=pPOylcQBzAXLCrGiPjst2gXRbMX47AnKJc8veF5LswNP4nIYdIiEhXEOUXIhmbVZqbQ6RTuu1yIqKb9pbZBdzM//HytG3g9d+kwEL2BZkYGaWV5r504lPN39/g0RAApoHw1+uusTLX/O0J8dPv81HIhFp/pbXzgf/Gbl/7DEzdw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788780743; c=relaxed/simple;
	bh=D9d460/3ULsolCG6Pa1+OnOe6sImHxaaXYQqsdm9+0M=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=B4DBQo0iXo3JXqXx7ATddVossCcxazf/xxNe3XSJNDBNbugAuEu/ylPzWDNIGO18eXgSrqyuY0wt0NQkCF4spd6TM0ac+3iM4KEu7al39bD/Cx1kVbBfHfu1ts8FafAA/2AZk5HIbJ7Jx+uhMbbHIe0qbg+PVBw0dAr7bbh7+fg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=K65wqIE4; arc=none smtp.client-ip=91.218.175.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="K65wqIE4"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=D9d460/3ULsolCG6Pa1+OnOe6sImHxaaXYQqsdm9+0M=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1788780739; v=1; x=1789385539;
 b=K65wqIE45Rt2WOk7XAGMfVHzVZqwzjXrsxIj0pn2B3IpqEFOkpzW+oJpBnRZxcffpM9vBT9p
 rxtZoUbIie78UujACo7hu94t/YR0JGRpJleRN3aCH5HprPdkKI3dQjhde7QpUBwt8IywWs0GjRS
 XGEXKniBDxElwF/95hn0uW4Y=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 10c32f4f480421af;
	Mon, 07 Sep 2026 11:32:19 +0000
X-Mizu-Trace-ID: 10c32f4f480421af
X-Migadu-Flow: FLOW_OUT
Message-ID: <8403dfc5-858f-4212-ad13-7c00b3f7ee63@linux.dev>
Date: Mon, 7 Sep 2026 13:28:42 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
Subject: Re: [PATCH v2 05/11] ASoC: SDCA: add populate_function hw_op for DT
 function data
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
 <20260907083727.733705-6-srinivas.kandagatla@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260907083727.733705-6-srinivas.kandagatla@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 9/7/26 10:37, Srinivas Kandagatla wrote:
> sdca_parse_function() walks a firmware node, but on DT there is no
> DisCo node -- sdca_lookup_functions() is a no-op and the SDCA
> function descriptors come with a NULL fwnode.

It'd be good to have a link to an example set of DT properties for SDCA.
The way the functions were organized in ACPI is based on a DT-inspired
_DSD mechanism to have nested blocks.

edit: After reaching the last patch I realized there are no such
properties. The main problem is how to deal with board-specific
initialization data, the suggestion to encode all the tables in C seems
limited to me.

> Add a populate_function hw_op that the class function driver falls
> back to when @function->desc->node is NULL: it fills the caller-owned
> sdca_function_data (entities, clusters, init_table, delays) from the
> codec's static tables, matching by function type.  Leave
> @function->desc alone -- the framework owns the per-instance
> descriptor, so devices with more than one function of the same type
> keep their per-instance SoundWire address.

I wasn't able to understand that last sentence - and I don't remember
seeing a case with different functions of the same type. It's permitted
by the spec but it'd be fun to manage...

> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
> ---
>  include/sound/sdca_class.h           | 6 ++++++
>  sound/soc/sdca/sdca_class_function.c | 9 ++++++++-
>  2 files changed, 14 insertions(+), 1 deletion(-)
> 
> diff --git a/include/sound/sdca_class.h b/include/sound/sdca_class.h
> index 3342937d09fd..3a1b6d65048f 100644
> --- a/include/sound/sdca_class.h
> +++ b/include/sound/sdca_class.h
> @@ -26,9 +26,15 @@ struct sdca_function_data;
>   *           before the class regmap is created and before the slave is
>   *           ATTACHED; callers needing bus I/O must sdw_slave_wait_for_init()
>   *           first.
> + * @populate_function: fill @function (entities, clusters, init_table, ...)
> + *           from static tables in place of sdca_parse_function() on
> + *           DT/non-DisCo platforms.  Must leave @function->desc alone.
> + *           Return 0 on success or a negative errno.  May be NULL.
>   */
>  struct sdca_class_hw_ops {
>  	int (*hw_init)(struct sdw_slave *slave);
> +	int (*populate_function)(struct sdw_slave *slave,
> +				 struct sdca_function_data *function);
>  };

Erm, this populate_function() callback would not generate any hardware
access, would it? It's really different to hw_init which is supposed to
configure the codec and must run after enumeration.

I am struggling a bit with the 'hw_ops', it's really only a matter of
reading tables from platform firmware, and this could be done without
any dependency on hardware, couldn't it?
>  
>  struct sdca_class_drv {
> diff --git a/sound/soc/sdca/sdca_class_function.c b/sound/soc/sdca/sdca_class_function.c
> index 10a2b031b572..8bca88865a4d 100644
> --- a/sound/soc/sdca/sdca_class_function.c
> +++ b/sound/soc/sdca/sdca_class_function.c
> @@ -329,7 +329,14 @@ static int class_function_probe(struct auxiliary_device *auxdev,
>  	drv->core = core;
>  	drv->function = &sdev->function;
>  
> -	ret = sdca_parse_function(dev, drv->function);
> +	if (drv->function->desc->node) {
> +		ret = sdca_parse_function(dev, drv->function);
> +	} else if (core->hw_ops && core->hw_ops->populate_function) {
> +		ret = core->hw_ops->populate_function(core->sdw, drv->function);
> +	} else {
> +		dev_err(dev, "no firmware node and no populate_function hook\n");
> +		return -ENOENT;
> +	}
>  	if (ret)
>  		return ret;
>  

