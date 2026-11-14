Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=44.202.169.37
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794674029;
	b=v2QtOsqGa4GDKbm+/0Cc8LcdSPL3K8aFad+R87K5QcI69F9ILzUYnesYJRQiJGSfcFVF
	 ciqbMpAajU8wHgsT+o60Z/mDt7iW073cS+10VYELJLF9ZgGMS0QFyA8qSa5rJwooWpWdt
	 oNURp9lVZ25SqB8ApPOns6Y+xZpA2Jp9Z9CBVjuYMooi//dodQWXtDE57SOl4c1GG0IFk
	 lhRuVS1LZ2hPQVeYSMUH0oYMRHt5FSrURApgM7VGuSwVzwMVtmlKdqlns7GbhsIJVYhK/
	 QYFLWgNzf7G/g/HKp/AdFhdaHbdpfrIM+J/RxmWo03I41Bac8gC1EYo0woU4w+Zlblw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794674029;
	h=DMARC-Filter:Received:Received:X-Authority-Analysis:DKIM-Signature:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To:X-AntiAbuse:X-AntiAbuse:
	 X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:X-BWhitelist:X-Source-IP:
	 X-Source-L:X-Exim-ID:X-Source:X-Source-Args:X-Source-Dir:
	 X-Source-Sender:X-Source-Auth:X-Email-Count:X-Org:X-Source-Cap:
	 X-Local-Domain:X-CMAE-Envelope;
	bh=fNyL+rk9lcDERVVkgiJ1hFZnvfUFdxaQKSp5+Vw2bfY=;
	b=GezpKEIN9yR5MRoifgSPB6RRrwoXu77daDYp4WW7olW183S6ayEssDWW3I6CrrlZKyEq
	 QuMmIwimPACOjhGgI6ZixOz/d5i6efWOUIApow5JV7yBTOLa305bBbJkfaMEX2OrscjR/
	 yYyBGT6o0XhxrHOyeHmvxg4HfNtyW6QC+gl9VCt8dSU2gq9laFAQIBVEHx6/O6sOIDi28
	 9DCMHVH3ezL5L9Z+w7LRzf3A6Qo+iEwhk93VhwksxuKgCXX0CX4t67M/3rTmgREaqLHlP
	 dKrGlC4mmPClPfeWSM8ji2IY2ONR4tGMDhyVz5sjGuedKZLIV7VdAMXgOHIJIHqIKKg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=roeck-us.net;
	spf=fail smtp.mailfrom=roeck-us.net;
	dkim=pass header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=k1MFB5ZJ;
	arc=none smtp.remote-ip=44.202.169.37
Received: from omta038.useast.a.cloudfilter.net (omta038.useast.a.cloudfilter.net [44.202.169.37])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79C3D606A32D
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 16:33:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 79C3D606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=k1MFB5ZJ
Received: from eig-obgw-5001b.ext.cloudfilter.net ([10.0.29.181])
	by cmsmtp with ESMTPS
	id SDJRxzHMlJFmFSGhIxydgz; Sat, 14 Nov 2026 16:33:48 +0000
Received: from 162-215-252-36.unifiedlayer.com ([208.91.199.152])
	by cmsmtp with ESMTPS
	id SGhIxv22dxmi7SGhIx8n0G; Sat, 14 Nov 2026 16:33:48 +0000
X-Authority-Analysis: v=2.4 cv=KuFN2XWN c=1 sm=1 tr=0 ts=6af88d6c
 a=QNED+QcLUkoL9qulTODnwA==:117 a=2cfIYNtKkjgZNaOwnGXpGw==:17
 a=UZ1dQ18DKJ-JX__J:21 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=M0FbrtG7MMAA:10
 a=pGLkceISAAAA:8 a=_jlGtV7tAAAA:8 a=sd4MZqKXCaeUGLDD8YIA:9 a=CjuIK1q_8ugA:10
 a=nlm17XC03S6CtCLSeiRr:22 a=KPbNTLLc3YvdawN95zVk:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=roeck-us.net; s=default; h=In-Reply-To:Content-Type:MIME-Version:References
	:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding
	:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Unsubscribe-Post:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=fNyL+rk9lcDERVVkgiJ1hFZnvfUFdxaQKSp5+Vw2bfY=; b=k1MFB5ZJ1IF1n4tZWxr7ErfnpO
	/fkf32w0aMn8akniH/IeUhvze2zV3Ne/SIdTojEgS+1tzckqiHPcTToUVJAUX7y2bRkv5KkJknRgW
	xK+aPDulNM+0qe2xzBu1x9uAjU9Am0icrHrF6TwnbCjaZ3sc+D5z/KydrbMc52PNyHJ3qdoRcku3R
	ckdVo6/PVea65MGYqoycVDh/QI/Q+2Kx7CT2fmjkjPZf6mvIEfPAIxhwcu6DocdaMcSKgwcTOD6Ff
	NS+yBCBDAjUohkvsmJiwV+iRtYODRCfaXjRIvPTFK5qEYhUgipfNG7Nls1SXu2UXKi4kgbM8EPANr
	hcRbdXyw==;
Received: from 108-223-40-66.lightspeed.sntcca.sbcglobal.net ([108.223.40.66]:54794 helo=server.roeck-us.net)
	by bh-25.webhostbox.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <linux@roeck-us.net>)
	id 1xSGhH-00000000FSq-48lw;
	Sat, 14 Nov 2026 22:03:48 +0530
Date: Sat, 14 Nov 2026 08:33:47 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Pablo Mazzini <pmazzini@gmail.com>
Cc: Alistair Francis <alistair@alistair23.me>,
	Andreas Kemnade <andreas@kemnade.info>,
	Mark Brown <broonie@kernel.org>, linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 1/2] hwmon: sy7636a: read the temperature only while
 the rails are on
Message-ID: <9bd10826-7684-462a-808b-91b72c9d5689@roeck-us.net>
References: <20261112205228.42630-1-pmazzini@gmail.com>
 <20261112205228.42630-2-pmazzini@gmail.com>
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
In-Reply-To: <20261112205228.42630-2-pmazzini@gmail.com>
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - bh-25.webhostbox.net
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - roeck-us.net
X-BWhitelist: no
X-Source-IP: 108.223.40.66
X-Source-L: No
X-Exim-ID: 1xSGhH-00000000FSq-48lw
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 108-223-40-66.lightspeed.sntcca.sbcglobal.net (server.roeck-us.net) [108.223.40.66]:54794
X-Source-Auth: guenter@roeck-us.net
X-Email-Count: 65
X-Org: HG=direseller_whb_net_legacy;ORG=directi;
X-Source-Cap: cm9lY2s7YWN0aXZzdG07YmgtMjUud2ViaG9zdGJveC5uZXQ=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfGUfNPQhdGHVjtVJkcgj0flJk5GQNBva/AsnoFFq9io9PmLVUFTqEtrTj5enluxz28ME2IKoOKefxXEFYyNvaBMD6kCmfW7XRdk+7leAUwRweg3r7XOH
 Jgb2N73KDDePceoIlK1DuJiWdds49mcZu7pA3X66LJHhYf9E4KjMa1e9PXgKbx/EfYbVloeap/V7CaROrvws9IOO4CDGHYf4eDrGMEhlubS84C2qQ9pDzPGU

On Thu, Nov 12, 2026 at 08:52:27PM +0000, Pablo Mazzini wrote:
> The driver enables VCOM at probe, which keeps the panel's high voltage
> rails on for good. Read the temperature only while the rails are on, when
> the chip samples it, and return -ENODATA otherwise. Read power good with
> it in one transfer, so the value can not be from before the first sample
> or after the rails went off.
> 
> Signed-off-by: Pablo Mazzini <pmazzini@gmail.com>

This patch depends on the rest of the patch series, so I can not apply it
to a hwmon branch. Assuming it will be applied to some other branch,

Acked-by: Guenter Roeck <linux@roeck-us.net>

Thanks,
Guenter

> ---
>  drivers/hwmon/sy7636a-hwmon.c | 35 ++++++++++++++++++++++++-----------
>  1 file changed, 24 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/hwmon/sy7636a-hwmon.c b/drivers/hwmon/sy7636a-hwmon.c
> index a0d0b4119bb3..a8bfbf1716a1 100644
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
> -	*temp = reg_val * 1000;
> +	if (!(buf[0] & SY7636A_FAULT_FLAG_PG))
> +		return -ENODATA;
> +
> +	*temp = (s8)buf[1] * 1000;
>  
>  	return 0;
>  }
> @@ -72,10 +89,6 @@ static int sy7636a_sensor_probe(struct auxiliary_device *adev,
>  	if (!regmap)
>  		return -ENODEV;
>  
> -	err = devm_regulator_get_enable(&adev->dev, "vcom");
> -	if (err)
> -		return err;
> -
>  	hwmon_dev = devm_hwmon_device_register_with_info(&adev->dev,
>  							 "sy7636a_temperature", regmap,
>  							 &sy7636a_chip_info, NULL);
