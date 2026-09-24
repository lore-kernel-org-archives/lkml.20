Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4918C30C345
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 13:10:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790255426; cv=none; b=QuYKtPmsk2biR3T2Iw6YUVIxfKbklhRQSIJq/xtFm3UwvDlCsqyydy2/P/mGiA7G7f5utoq7V9tSrC5VLHkZ6NSXpsgJ7qtbLeJXBHjc5qgbHr/63+59QIWTAeS0hzw4eFX/xgu7tqbbQuMqw/ncsVt+0nAOeHm3fMtgtEHmBYE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790255426; c=relaxed/simple;
	bh=ssAl/+k4jPnOyZvFEczhhMivxC5cY0K7XEWGExEoAHg=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=qd+XS+t3VHiGe7sw6exX1n5U2uzHoByXwY9BaYY+MLk28WVeNTUosdk8fY01q3AYuo8Sim0il79vsZ9o4jZ+aQA2tkmt9GRHFSPBb30wx17C4ZWABFmUf+EUeNEvA57KG6FQub5nrLGop73JdCThpa3fEY0H645DFfAzqKzWOkw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=Aq/rO3hi; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="Aq/rO3hi"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49cd38e0e5dso25841515e9.2
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 06:10:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1790255420; x=1790860220; darn=vger.kernel.org;
        h=content-type:mime-version:message-id:date:references:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yqY+VYU5NXGX1DIhJ+QOGA70yG14D0itgxaOKESe4N8=;
        b=Aq/rO3himUhZMcg4MqOX1jEGXNxbUpiJ7yuzBUb/GVXrmKWE4Bjya+Ueus1f1PbuOd
         5vFokEGxQ8EXGlfGjShckcOmBlyY4srFmpFFkol6wzsgDjNwj3QobDLjNp/QLhdQKoyd
         eKxps9DiO/xkwf71d4F2IEZDs+ZoA2J9ZftcKYakhrgnNUoJPIWjZ/f2GkzkAGbjfjQO
         RLbhDf47EFSiPkhSXTe5gizSWvlk8oaN0wxAGK+oCmFGxDUirX7itwNTZ11SW8PwzjyA
         /fGFICuPtXfmHCpfMIMim0PWqKL039FjiDQtXwX5iLXWapHjq3FdTMTHCwvo71jjaKvF
         BA9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790255420; x=1790860220;
        h=content-type:mime-version:message-id:date:references:in-reply-to
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=yqY+VYU5NXGX1DIhJ+QOGA70yG14D0itgxaOKESe4N8=;
        b=2C6kjsIh2vJG+zkqxQfCkjKHGiQf6vUb4Gq+tghYWtSD+BNXUhZKVLcAWem3frQ7gL
         dGCVBA4gqut5CIgpYSp6b5i3nSoQug3lvtJXeSZbiKWBFHgRpH9zD3XlD6oTUseG2vrt
         vJgc/pmB8yDmTUO8cqYXPUeoTeNWUmv6Bp2DipL8AQCnqsG1eiXYqMWhXEp6qap0CvMb
         kvnbzvbsMXPhb1AOAgAzOH4dcBWYoiVOjkjYwmajqlxNJ3X3lTtKeRlk0HSZe2hlnMQP
         MmcTYmK+ycTQ7BlT+mgt6urTZEyil/RO88jNNcxQ54pW7JJ35fuWjLeXA0FcjQxBRYDy
         1SGw==
X-Forwarded-Encrypted: i=1; AKwUvBzARButuHaElUf/uoHw2vTZf5XpssMeAqWWlsQR7bLo1TmSQ8GHSqwJQVrsT5aWdH0PMRS9wwfbpi7SCD8=@vger.kernel.org
X-Gm-Message-State: AFuF++mIKQDY3s0FgZ8ASSaogtVsWIXYv1vOpQEWdO7hsZoffJnQ9rcI
	PRIlOma82vo8DAF3e8koFZhTUpl5Ah6E1l9EBufpl+PunkGBv3MPIc9FAqgHGv6bC60=
X-Gm-Gg: AYBFou0ik7xM1QLCdhQUGya6S9w2BwVNeGFtQBbftRxQvPxyPJGzjt542rnRT6QdHU8
	Fj8l6ZCPgYN39c5TZs/dxPNDgCBm3KELWpa7/kNCJG6dYqiTYoqeyL0Yqi8W7xLhLkLlpz2F5NH
	WmpF19NPRAdVU3M1vKVo9k2FKHRRuOdEK2ahfYP7f3xDMSZynZjgIM8djDkd4fZSGEjp2cNL0cA
	M6oy98CmY0O5cr0n/DjXQtOD1MlN5GwxnX8sbuBLsPiAgx3MTRkwvOBIXfHSk6n7Ad8sAGraLFu
	hWkQQzJqdxsk6VV1YSJ6lGQZWACLQ4Poih2NR2PKnU18ubjLOF4ig9gfuPoI+PVMsmK9La+1EJH
	fcW6lsVQ0zsCC2HltVAL3mmgcJmBGaSCncDtutooUvkosZ9lPvz1S7izicyIOzI/F7RKd/xQr5L
	CC6msY7+0Kuji5mY9intsDGpI4KT6vtKKZw0luN1ZFD5JNE5P/ScWIG2FVRhkM3SmQRVs5xf+dl
	B7GQ9PQALR55+RJhQ==
X-Received: by 2002:a05:600c:8b8b:b0:49c:f512:2361 with SMTP id 5b1f17b1804b1-49fe66d470emr42998155e9.14.1790255420471;
        Thu, 24 Sep 2026 06:10:20 -0700 (PDT)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fe0c77b8csm87532775e9.3.2026.09.24.06.10.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 06:10:18 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Lee Jones <lee@kernel.org>
Cc: Andre Przywara <andre.przywara@arm.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, Liam Girdwood
 <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Hans de Goede
 <hansg@kernel.org>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, mfd@lists.linux.dev,
 linux-sunxi@lists.linux.dev, Sashiko <sashiko-bot@kernel.org>
Subject: Re: [PATCH v8 2/5] mfd: axp20x-i2c: Fix i2c instantiation
In-Reply-To: <20260924082705.GO3864833@google.com>
References: <20260910-axp318-regulator-v8-0-e906a61a7f3d@baylibre.com>
 <20260910-axp318-regulator-v8-2-e906a61a7f3d@baylibre.com>
 <20260924082705.GO3864833@google.com>
Date: Thu, 24 Sep 2026 15:10:17 +0200
Message-ID: <1jy0cq94na.fsf@starbuckisacylon.baylibre.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On jeu. 24 sept. 2026 at 09:27, Lee Jones <lee@kernel.org> wrote:

> On Thu, 10 Sep 2026, Jerome Brunet wrote:
>
>> Apparently this device never really supported i2c instantiation via
>> sysfs, because the driver does not even look at the i2c device data,
>> which are not set. It would only probe if the device matched through DT.
>> 
>> Fix that for correctness, even-though it is probably useless.
>> Add the missing AXP323 while at it.
>> 
>> Reported-by: Sashiko <sashiko-bot@kernel.org>
>> Closes: https://lore.kernel.org/r/20260717090209.2A09B1F000E9@smtp.kernel.org
>> Fixes: 41751b033aaa ("mfd: axp20x-i2c: Add i2c-ids to fix module auto-loading")
>> Acked-by: Chen-Yu Tsai <wens@kernel.org>
>> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
>> ---
>>  drivers/mfd/axp20x-i2c.c   | 24 +++++++++++++-----------
>>  drivers/mfd/axp20x-rsb.c   |  1 +
>>  drivers/mfd/axp20x.c       |  1 -
>>  include/linux/mfd/axp20x.h |  3 +--
>>  4 files changed, 15 insertions(+), 14 deletions(-)
>> 
>> diff --git a/drivers/mfd/axp20x-i2c.c b/drivers/mfd/axp20x-i2c.c
>> index 5c93136f977e..a76bec5604c4 100644
>> --- a/drivers/mfd/axp20x-i2c.c
>> +++ b/drivers/mfd/axp20x-i2c.c
>> @@ -35,6 +35,7 @@ static int axp20x_i2c_probe(struct i2c_client *i2c)
>>  	axp20x->irq = i2c->irq;
>>  	dev_set_drvdata(axp20x->dev, axp20x);
>>  
>> +	axp20x->variant = (kernel_ulong_t)i2c_get_match_data(i2c);
>
> device_get_match_data() is bus agnostic and should still work from the
> core driver.  What's the purpose of splitting it out and adding
> additional call-sites?

Hi,

device_get_match_data() works when the data comes through that path,
which is generally the case.

i2c_get_match_data() calls device_get_match_data() then fallback to the
i2c_device_ids. It covers the instanciation from sysfs mainly, not
something usual.

As explained in the description, this changes plugs a hole identified by
sashiko that technically exists but I highly doubt anyone will
instanciate the PMIC through that interface. Those things do not really
come as breakout boards ... That being said, it is cheap to fix.

>
>>  	ret = axp20x_match_device(axp20x);
>>  	if (ret)
>>  		return ret;
>> @@ -76,17 +77,18 @@ MODULE_DEVICE_TABLE(of, axp20x_i2c_of_match);
>>  #endif
>>  
>>  static const struct i2c_device_id axp20x_i2c_id[] = {
>> -	{ "axp152" },
>> -	{ "axp192" },
>> -	{ "axp202" },
>> -	{ "axp209" },
>> -	{ "axp221" },
>> -	{ "axp223" },
>> -	{ "axp313a" },
>> -	{ "axp717" },
>> -	{ "axp803" },
>> -	{ "axp806" },
>> -	{ "axp15060" },
>> +	{ .name = "axp152",	.driver_data = AXP152_ID },
>> +	{ .name = "axp192",	.driver_data = AXP192_ID },
>> +	{ .name = "axp202",	.driver_data = AXP202_ID },
>> +	{ .name = "axp209",	.driver_data = AXP209_ID },
>> +	{ .name = "axp221",	.driver_data = AXP221_ID },
>> +	{ .name = "axp223",	.driver_data = AXP223_ID },
>> +	{ .name = "axp313a",	.driver_data = AXP313A_ID },
>> +	{ .name = "axp323",	.driver_data = AXP323_ID },
>> +	{ .name = "axp717",	.driver_data = AXP717_ID },
>> +	{ .name = "axp803",	.driver_data = AXP803_ID },
>> +	{ .name = "axp806",	.driver_data = AXP806_ID },
>> +	{ .name = "axp15060",	.driver_data = AXP15060_ID },
>>  	{ }
>>  };
>>  MODULE_DEVICE_TABLE(i2c, axp20x_i2c_id);
>> diff --git a/drivers/mfd/axp20x-rsb.c b/drivers/mfd/axp20x-rsb.c
>> index 059656f2a1bd..8fdc870c1fe4 100644
>> --- a/drivers/mfd/axp20x-rsb.c
>> +++ b/drivers/mfd/axp20x-rsb.c
>> @@ -35,6 +35,7 @@ static int axp20x_rsb_probe(struct sunxi_rsb_device *rdev)
>>  	axp20x->irq = rdev->irq;
>>  	dev_set_drvdata(&rdev->dev, axp20x);
>>  
>> +	axp20x->variant = (kernel_ulong_t)device_get_match_data(axp20x->dev);
>>  	ret = axp20x_match_device(axp20x);
>>  	if (ret)
>>  		return ret;
>> diff --git a/drivers/mfd/axp20x.c b/drivers/mfd/axp20x.c
>> index 4d770e718716..de6946d4bb13 100644
>> --- a/drivers/mfd/axp20x.c
>> +++ b/drivers/mfd/axp20x.c
>> @@ -1267,7 +1267,6 @@ int axp20x_match_device(struct axp20x_dev *axp20x)
>>  	const struct mfd_cell *cells_no_irq = NULL;
>>  	int nr_cells_no_irq = 0;
>>  
>> -	axp20x->variant = (long)device_get_match_data(dev);
>>  	switch (axp20x->variant) {
>>  	case AXP152_ID:
>>  		axp20x->nr_cells = ARRAY_SIZE(axp152_cells);
>> diff --git a/include/linux/mfd/axp20x.h b/include/linux/mfd/axp20x.h
>> index b352661d99a1..1badb4868d17 100644
>> --- a/include/linux/mfd/axp20x.h
>> +++ b/include/linux/mfd/axp20x.h
>> @@ -997,8 +997,7 @@ static inline int axp20x_read_variable_width(struct regmap *regmap,
>>  /**
>>   * axp20x_match_device(): Setup axp20x variant related fields
>>   *
>> - * @axp20x: axp20x device to setup (.dev field must be set)
>> - * @dev: device associated with this axp20x device
>> + * @axp20x: axp20x device to setup (.dev and variant fields must be set)
>>   *
>>   * This lets the axp20x core configure the mfd cells and register maps
>>   * for later use.
>> 
>> -- 
>> 2.53.0
>> 
>
> -- 
> Lee Jones

-- 
Jerome
