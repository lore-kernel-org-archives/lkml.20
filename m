Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CE5E35B657;
	Fri, 28 Aug 2026 17:23:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.75.144.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787937816; cv=none; b=ASBHWpD4Db/EZgRRiXDxQ/Ob9Yi5y6ivOmJubVARw6qmotr0gVhGNNrsw2slehB0Duqq+JvJOZ6FMja4GWekKiAcR0n/yGPRelG+X7kKMTWoLAy/Iibmq43f/eE/wqBVjysG8tG0tkfZIHhgnALDibbhsoLI+bOSbeZAeieua2M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787937816; c=relaxed/simple;
	bh=zt1XgfBYDToU5ACacQ5Lf/pz/NYouIZ9PFa7iR1U33c=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=tkcdvnqYkkUk+Bfyk2+N4OwvK3DVjxrEfD8Bhp05bgZX5ZhvrIsooesIxpTGmC5H3D3G1VVbBZ9Due5cgScwoIF7Cinb654Q/oIPrJpEccH0H6jSfHSdPgCX1Kb8GsHRV1TIf4Sdbu2YHgjWZ+QjafLthsZnzMTYNYcPnds0QDQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org; spf=pass smtp.mailfrom=mainlining.org; dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=OaYXau98; dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=7eIUnkLk; arc=none smtp.client-ip=5.75.144.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="OaYXau98";
	dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="7eIUnkLk"
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=To:Subject:From:Date:Message-ID; t=1787937763; bh=71TbQImMfFfI/D/THrkhbwl
	jjF273bJxzq49ZpLZxt4=; b=OaYXau98FP5RGBV9OL/fOMT2HZxYhrYlwJaWJ7wtA8ekTlH32/
	+vzP5FOqlcd7slh1PX+MLcA4piZ027BVmM0reWHWkE34yPAcp/PIWIafoRHezEONMZok2XlQe8Q
	SHVopehiU2hrllYp+ASl+Ts8lhHClGjYh/sNY32rXtsATyxFgC4mJsdu56dkQBKFrxs/sN1yYxY
	/ZzGg+Ib6y90tnTfsP+5SSzMh3QJ07+hi+lO+AXFyW5MZkQ/jnE3H/ciY0oNQhI2bEe4rvNpsiO
	+IoohpoX4b9liccVIgb1o3M1ZPtL3jsiceXMFizv9gvGoWx68qTI4yNWIBcLcWMMsKA==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=To:Subject:From:Date:Message-ID; t=1787937763; bh=71TbQImMfFfI/D/THrkhbwl
	jjF273bJxzq49ZpLZxt4=; b=7eIUnkLk1BlgxbzHteYiRu8kMYE6cSMWDf4b9xHe4tie5kPifq
	EnPJVwYfGGkXsLaUkejBmHrfDRWHAr1v+KAQ==;
Message-ID: <7e5d41c0-247d-45bf-97fd-1c1414588936@mainlining.org>
Date: Fri, 28 Aug 2026 20:22:42 +0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Muzaffer Kadir <muzafferkadir@mainlining.org>
Subject: Re: [PATCH] media: i2c: imx258: Add reset-gpio support
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, git@luigi311.com,
 pavel@ucw.cz, tomm.merciai@gmail.com, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org,
 =?UTF-8?Q?Ond=C5=99ej_Jirman?= <megi@xff.cz>
References: <20260828-imx258-add-reset-gpio-patch-v1-1-633972d2a700@mainlining.org>
 <apF5oxsCf7MJt1lk@kekkonen.localdomain>
Content-Language: en-US
In-Reply-To: <apF5oxsCf7MJt1lk@kekkonen.localdomain>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Thanks for review

On Fri, 28 Aug 2026 15:05:55 +0300, Sakari Ailus wrote:

>>  	if (ret) {
>>  		dev_err(dev, "failed to enable clock\n");
>>  		regulator_bulk_disable(IMX258_NUM_SUPPLIES, imx258->supplies);
>> +		return ret;
>> +	}
>> +
>> +	if (imx258->reset_gpio) {
>> +		ret = gpiod_set_value_cansleep(imx258->reset_gpio, 0);
>> +		if (ret) {
>> +			dev_err(dev, "failed to deassert reset\n");
>> +			clk_disable_unprepare(imx258->clk);
>> +			regulator_bulk_disable(IMX258_NUM_SUPPLIES, imx258->supplies);
>> +			return ret;
> 
> This warrants reworking error handling; please use gotos and move it to the
> end of the function. Same for clock error handling.
I will move error handling to goto by sending a v2.

>> +		usleep_range(400, 500);
> 
> The delay seems right. Can you use fsleep()?
I am going to replace it with fsleep(400) by v2

> In fact the delay should always have been there so this is a bugfix. It
> should go to a separate patch.
Then I will split this by making delay first patch
and reset handling second patch for v2.

>>  	struct v4l2_subdev *sd = dev_get_drvdata(dev);
>>  	struct imx258 *imx258 = to_imx258(sd);
>>  
>> +	gpiod_set_value_cansleep(imx258->reset_gpio, 1);
>>  	clk_disable_unprepare(imx258->clk);
>>  	regulator_bulk_disable(IMX258_NUM_SUPPLIES, imx258->supplies);
>>  
>> @@ -1382,6 +1397,11 @@ static int imx258_probe(struct i2c_client *client)
>>  		return ret;
>>  	}
>>  
>> +	imx258->reset_gpio = devm_gpiod_get_optional(imx258->dev, "reset", GPIOD_OUT_HIGH);
> 
> Over 80, please wrap (there's another earlier, too).
I am going to wrap this by v2 but I couldn't spot the second one.
I think it is regulator_bulk_disable in error handling.
It should be lower than 80 after moving it to goto error handling.

-- 
Best Regards,

Muzaffer Kadir
