Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=35.89.44.33
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794149456;
	b=AZ4a50csnm3rNoGPfVERgq01gLjqbkuC0pECrnf3Cmuk+ZppySsMIU3kqGCnV3I9an5Z
	 YzsHhzFGIXOu8TrZDesZ5pDMGqd9D5CVc37ymte0Y9hxsSXPVF9mQUsUnqADCOgO+oczv
	 kS/8DKMOfG1f3Q1a+aYZ3Cz375UNij9sDUaGIbmwBf5ZMtlyqnr1chU91pmGYiPFHctL/
	 Py1FcDLLrY7NLURvxW8lICRbT1D17ngFspgwKDgmPcPtfkzV4jk0CPPtbJEorr1zO1PUl
	 L3xRZtK7S8wcVvtlgNQJhK+Y3xzIbZE6pYixQxns4dbczKDS4gfMeYWgmviOGBZnHiA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794149456;
	h=DMARC-Filter:Received:Received:X-Authority-Analysis:DKIM-Signature:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To:X-AntiAbuse:X-AntiAbuse:
	 X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:X-BWhitelist:X-Source-IP:
	 X-Source-L:X-Exim-ID:X-Source:X-Source-Args:X-Source-Dir:
	 X-Source-Sender:X-Source-Auth:X-Email-Count:X-Org:X-Source-Cap:
	 X-Local-Domain:X-CMAE-Envelope;
	bh=ZFlWh8q1FXbeFZVs9nVlhIoGr1Dnquy6NqDJrKTW2P0=;
	b=xHTyhZNdONbqCBPQa5h756II5mpt7heeMDiOJwB7uhGcnXJKEZ6BONoNFMRCMAxrcTlL
	 mN4FDfDkAB1BTR/oB8/J6jRBoFWKpgnQBxDZKr2x1yvQnlzoaQVDWvuFEp4tGW1Y1i/N1
	 FfIh44sZvfLu0GFrrG+g9Pe3RDv/7AIPNWVpvz3q9ig1vuCe7uC3ru6oC0XaIyXFoyNYM
	 t7HH/ps+tfip3DPuE2cqTZtDvtXraebxgbh9TW17+zBOpElaVlgjqI6vqF8d+Bbb7CC03
	 0I27CAlYMvQnQINRc3sB+J685iM4DHTK774rrAQaz1f1I4y6WrD8iOkKSs5tsDMuwrA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=roeck-us.net;
	spf=fail smtp.mailfrom=roeck-us.net;
	dkim=pass header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=lMWWvh03;
	arc=none smtp.remote-ip=35.89.44.33
Received: from omta34.uswest2.a.cloudfilter.net (omta34.uswest2.a.cloudfilter.net [35.89.44.33])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83B18606A31C
	for <linux-kernel@vger.kernel.org>; Sun,  8 Nov 2026 14:50:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 83B18606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=lMWWvh03
Received: from eig-obgw-6005b.ext.cloudfilter.net ([10.0.30.162])
	by cmsmtp with ESMTPS
	id PyjIxJzBZAR1iQ4EMxOpII; Sun, 08 Nov 2026 14:50:50 +0000
Received: from 162-215-252-36.unifiedlayer.com ([208.91.199.152])
	by cmsmtp with ESMTPS
	id Q4ELxQDe10288Q4EMx5rKl; Sun, 08 Nov 2026 14:50:50 +0000
X-Authority-Analysis: v=2.4 cv=a5Iw9VSF c=1 sm=1 tr=0 ts=6af08c4a
 a=QNED+QcLUkoL9qulTODnwA==:117 a=2cfIYNtKkjgZNaOwnGXpGw==:17
 a=UZ1dQ18DKJ-JX__J:21 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=M0FbrtG7MMAA:10
 a=pGLkceISAAAA:8 a=EJN59OTSmWfVsbul1mkA:9 a=CjuIK1q_8ugA:10
 a=9ZlKDEqW8j0_VKCLas2V:22 a=KPbNTLLc3YvdawN95zVk:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=roeck-us.net; s=default; h=In-Reply-To:Content-Type:MIME-Version:References
	:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding
	:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Unsubscribe-Post:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=ZFlWh8q1FXbeFZVs9nVlhIoGr1Dnquy6NqDJrKTW2P0=; b=lMWWvh0319TJg2EOT8Uh5zgoOe
	qLfnJ9Ww64cVeAnksSVjO8ICdWIEs5HxLsZGSuxZiX6R/FG7NTZNi8MuLF6l+jrEnv15JzNePIdiZ
	w01qPdFjOlCDvAv9/Y0ePR0iEcYVLSAH4xpUNmw7jpoXlh4DbBkX3QrbMSgxcbPAp6V2Zn/xsOfLZ
	DjxDzc42HJdiB1Kslgtv1vr8WOn/q1ym0YQQ8athBKgCmeh3GT3899MmWtPdg/hA0nb8L/DhZxK+w
	aL5wLcToRj5jeNuBXQJWAVok3DQvkwMUQH+N08xVBUuP1aPkeqgdlte83Y43iPDw0tluv9uA3t4wD
	904QG7MA==;
Received: from 108-223-40-66.lightspeed.sntcca.sbcglobal.net ([108.223.40.66]:60202 helo=server.roeck-us.net)
	by bh-25.webhostbox.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <linux@roeck-us.net>)
	id 1xQ4EL-000000004pa-2saW;
	Sun, 08 Nov 2026 20:20:49 +0530
Date: Sun, 8 Nov 2026 06:50:49 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Pablo Mazzini <pmazzini@gmail.com>
Cc: Alistair Francis <alistair@alistair23.me>,
	Andreas Kemnade <andreas@kemnade.info>, linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 4/5] hwmon: sy7636a: read the temperature only while
 the rails are on
Message-ID: <d9035966-07f3-4758-9074-7fb94375c40b@roeck-us.net>
References: <20261108093602.329554-1-pmazzini@gmail.com>
 <20261108093602.329554-5-pmazzini@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261108093602.329554-5-pmazzini@gmail.com>
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - bh-25.webhostbox.net
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - roeck-us.net
X-BWhitelist: no
X-Source-IP: 108.223.40.66
X-Source-L: No
X-Exim-ID: 1xQ4EL-000000004pa-2saW
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 108-223-40-66.lightspeed.sntcca.sbcglobal.net (server.roeck-us.net) [108.223.40.66]:60202
X-Source-Auth: guenter@roeck-us.net
X-Email-Count: 1
X-Org: HG=direseller_whb_net_legacy;ORG=directi;
X-Source-Cap: cm9lY2s7YWN0aXZzdG07YmgtMjUud2ViaG9zdGJveC5uZXQ=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfHGSJvvpydwZ2fEnMZFLnq9D+0EGY+s3twuEMvIabiC98rW2WPHrchzsNLqStv7Rt5sD/p+TJCTphN8RfqSGSvxKwF9edkxmE7zOkyHCdj8Q5efNifOS
 CGiG4O2d/b4JM7mnbY2Dqio8zJUc+CLKEG1SxYR/Kmndl2lDRT5G1IDhoyfrYk9yh4uZIfkVdBS4Z1GJ1zMUi0WkynyhIMpWA59JkOj3TI7Qb0yzpF2uVchA

On Sun, Nov 08, 2026 at 09:36:01AM +0000, Pablo Mazzini wrote:
> The driver enables VCOM at probe, which keeps the panel's high voltage
> rails on for good. Read the temperature only while the rails are on, when
> the chip samples it, and return -ENODATA otherwise. Read power good with
> it in one transfer, so the value can not be from before the first sample
> or after the rails went off. Register it under the chip name, as the
> TPS65185 and FP9931 drivers do.
> 
> Signed-off-by: Pablo Mazzini <pmazzini@gmail.com>
> ---
>  drivers/hwmon/sy7636a-hwmon.c | 37 +++++++++++++++++++++++------------
>  1 file changed, 25 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/hwmon/sy7636a-hwmon.c b/drivers/hwmon/sy7636a-hwmon.c
> index a6b47452e29e..0c0601d47b87 100644
> --- a/drivers/hwmon/sy7636a-hwmon.c
> +++ b/drivers/hwmon/sy7636a-hwmon.c
> @@ -9,26 +9,43 @@
>   */
>  
>  #include <linux/auxiliary_bus.h>
> +#include <linux/bits.h>
>  #include <linux/err.h>
>  #include <linux/hwmon.h>
>  #include <linux/module.h>
>  #include <linux/regmap.h>
> -#include <linux/regulator/machine.h>
>  
> -#define SY7636A_REG_TERMISTOR_READOUT	0x08
> +#define SY7636A_REG_FAULT_FLAG		0x07
> +#define SY7636A_FAULT_FLAG_PG		BIT(0)
>  
>  static int sy7636a_read(struct device *dev, enum hwmon_sensor_types type,
>  			u32 attr, int channel, long *temp)
>  {
>  	struct regmap *regmap = dev_get_drvdata(dev);
> -	int ret, reg_val;
> -
> -	ret = regmap_read(regmap,
> -			  SY7636A_REG_TERMISTOR_READOUT, &reg_val);
> +	u8 buf[2];
> +	int ret;
> +
> +	/*
> +	 * The thermistor is sampled while ON_OFF is set, but the first sample
> +	 * is only ready after the ADC sampling and conversion time (ADC_SPL +
> +	 * ADC_DEL in the datasheet); until then it holds its reset value, 0.
> +	 * PG is only set once all rails are up, after the first sample, so
> +	 * read it in the same transfer and report the temperature only while
> +	 * it is set.
> +	 *
> +	 * With ON_OFF set but PG low (rails still ramping up, or a fault), no
> +	 * temperature is reported even if one may be available. That is
> +	 * accepted: the display driver reads the temperature only while it
> +	 * holds the rails on, after power good.
> +	 */
> +	ret = regmap_bulk_read(regmap, SY7636A_REG_FAULT_FLAG, buf, sizeof(buf));
>  	if (ret)
>  		return ret;
>  
> -	*temp = (s8)reg_val * 1000;
> +	if (!(buf[0] & SY7636A_FAULT_FLAG_PG))
> +		return -ENODATA;
> +
> +	*temp = (s8)buf[1] * 1000;
>  
>  	return 0;
>  }
> @@ -72,12 +89,8 @@ static int sy7636a_sensor_probe(struct auxiliary_device *adev,
>  	if (!regmap)
>  		return -ENODEV;
>  
> -	err = devm_regulator_get_enable(&adev->dev, "vcom");
> -	if (err)
> -		return err;
> -
>  	hwmon_dev = devm_hwmon_device_register_with_info(&adev->dev,
> -							 "sy7636a_temperature", regmap,
> +							 "sy7636a", regmap,

This change is neither related to this patch nor necessary. Other drivers (unnecessarily)
doing the same is not an argument.

Guenter

>  							 &sy7636a_chip_info, NULL);
>  
>  	if (IS_ERR(hwmon_dev)) {
