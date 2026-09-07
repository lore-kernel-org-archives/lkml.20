Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01CFE27FB18
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 11:25:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788780361; cv=none; b=MJLprWURLtOEJmsGwUqjo0FT+oIcRA8dZozEoHieqMkhle/jTefqeOs4zyCwf+UYun9Oadh5Y3t5S6R68LSW5FXwIL/xEGVbtdfaI+oLQ0GgrJPHfno7e6clJkeJLLosLvrRgWItygMCe3DhOLGmy3Ukh/c5fmkPBmtP4UNqz6g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788780361; c=relaxed/simple;
	bh=r5w4vZHxYOow+S9w69v8p+rm/PS+NwfbtQJFBtx0rXU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cr83Q6CrpkPqeP9YhN6GU2O3ZECd/2N5H+xGCx21eogN4UgsUke82OSiALqVuF9KSEM05HOBaQZ7EcUMRYtCOtd4Kz51Vj4ddDGem+KKoMhlI8+lBDCL2SMrj5prDjWw3uW9sLLdVFG0mYuZm0r4ECX73bAP0El6MTdE/PkMBdI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dGXRbyn6; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dGXRbyn6"
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-c247f6687dcso538208166b.2
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 04:25:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788780357; x=1789385157; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Rw9wEnmmRS9YsDudq+DNMbA6mN+2z8x1quln5q6huH8=;
        b=dGXRbyn6bnkA35cdpQzhxPErEc3K4NGPNckPg7j2FBrvwy6fFBJ4tGfINGBW/DQk+y
         m+mpZcUcjmljLaE5bE7Uocnedi5OAH3lFTLVNR9cMh6+YPxbzgY3enEf8exdmgph2x6P
         S+Oqkakqu68hqPvr54vifo0fXXK8mU3V/lfo34me9DWhDhyc83LRyzJSYI6vf2oEmDlj
         YR3USw0lYPv/4YprQkyCA9ulGEUzD650UO23aKhrQsM4ZJ/qLme8QdjyU7mzgNooFWDG
         FeqIxUF7xrmlLDSZ+7eqK6M06m+RVmPYUTuz1DuWQuWLKv2gZuF8U2+C7sDUdtybH1iH
         lM+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788780357; x=1789385157;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Rw9wEnmmRS9YsDudq+DNMbA6mN+2z8x1quln5q6huH8=;
        b=MSwNMIypTuFKc+lki+zYCPQQxPKrnU0C3aDZD5SMQTqowqlJNDTVpA+9jhDHicWTDh
         pcMEURLQbdviH2xGxkUdPhAl03ZIWS8FFYezltX7SP0PecbOwf9JQ8f25Y5p1quCdabs
         C2qHpH6yiaUojDliNrZrBV4zqZALUKVdHUkTVKn+L+/ZQgACxv+LdhDlgvymH9xV+HiJ
         D1QQANwKv4YIyD0RYPYB73ylUWNzATQ9hLQKvCvNTQcoKDJ0xW+ec/Zu+v+Z8xruhwAZ
         zwxmFk7A9YQaGCAH2hN3daEI1NIHy0y7p+R7Xv61MN/gSvKTtpxsPzPgSlMtVxGnVEmI
         Kp+w==
X-Forwarded-Encrypted: i=1; AKwUvByxg8zQTQ3Qgvq188h5tiSqEUT53iYDJOUt4mp3JUcgXbSCfVw2GlTTKfsy7xaOXqYADjpCduq5WTgBd8s=@vger.kernel.org
X-Gm-Message-State: AFuF++nYOEpM8YT3xoO1LxsviJn6hSfmwkpnPlNc91ukBOWRyzd9aFX4
	nlCn9bBQ5vRPjktPn7fkY0xRy5f4imYDHguiKG6zIeEWJQVPkLUHTh7t
X-Gm-Gg: AYBFou3v6CdFjoE0AMLIawM1h+dxD8PVwKh+6GCsG7My19qJUhd3SQApNj215hi5lXq
	WK0oulI/F9Sc0q3uV8nX00YjYQKDYHazWyskle0aOf4Ijo/nyPkbbm3QUdCko+0x2xN/cK4vjBi
	Rx1mr3O1RkGsGPCEuB/aKn8e3txbCDdhX+Y/PdOqJQpNfLoBwy0Y5XOPRC5LpwIUu5cKWvCrw8B
	nX2gXigvbnA/13GJPOAnrQwDoumJjzVNYMdr4Fi6OR9tm4mBPYCHlEtXCdk1EhcJFUwzrzshBQp
	N+mCOfm4U6dG3XkQEAtDNAmTV/gfp3LpbH0ymBVzDjnvd20cMtWzGq0exUkxI8AfrkMSH/RdnYo
	rymfE/vk2qYaCeSc5fmug7CeaWgql92Nn0dhPza6u63yyog8d6QA5f/DupN2iQA5vaJRKz9WvMV
	jU/QYZ8IxlTrbMXzhROFaWytPeXTnQMvRRwiMD6GUu0u2xV4xZxFY/VzqRRmNIByp7oE5xOuAZ
X-Received: by 2002:a17:907:9622:b0:c21:34a3:4df9 with SMTP id a640c23a62f3a-c260c69a59cmr891010466b.3.1788780357031;
        Mon, 07 Sep 2026 04:25:57 -0700 (PDT)
Received: from [172.24.138.145] ([137.71.226.102])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c262f97f1a3sm285317866b.19.2026.09.07.04.25.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Sep 2026 04:25:56 -0700 (PDT)
Message-ID: <21704002-3bc7-474a-9e27-dd9b7f01a4bb@gmail.com>
Date: Mon, 7 Sep 2026 13:25:53 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 05/17] iio: adc: Add AD7768 and AD7768-4 core support
To: Jonathan Cameron <jic23@kernel.org>,
 Janani Sunil <janani.sunil@analog.com>
Cc: =?UTF-8?Q?Nuno_S=C3=A1?= <nuno.sa@analog.com>,
 Michael Hennerich <Michael.Hennerich@analog.com>,
 David Lechner <dlechner@baylibre.com>, Andy Shevchenko <andy@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Olivier Moysan <olivier.moysan@foss.st.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Linus Walleij <linusw@kernel.org>,
 Bartosz Golaszewski <brgl@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 Shuah Khan <skhan@linuxfoundation.org>, Michael Walle <mwalle@kernel.org>,
 Randy Dunlap <rdunlap@infradead.org>, linux@analog.com,
 linux-iio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-doc@vger.kernel.org, =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?=
 <u.kleine-koenig@baylibre.com>
References: <20260904-ad7768-driver-v6-0-e4378f946bfb@analog.com>
 <20260904-ad7768-driver-v6-5-e4378f946bfb@analog.com>
 <178866660277.3402141.13365217395986099796.b4-review@b4>
Content-Language: en-US
From: Janani Sunil <jananisunil.dev@gmail.com>
In-Reply-To: <178866660277.3402141.13365217395986099796.b4-review@b4>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 9/6/26 05:50, Jonathan Cameron wrote:
>> Add core support for the AD7768 and AD7768-4 simultaneous sampling ADCs.
>> Configure supplies, clock and reset, use a custom regmap bus for the SPI
>> protocol, and parse the enabled channels and input buffer settings from
>> devicetree.
>>
>> Connect the converter to an IIO backend for buffered capture with CRC,
>> provide a fixed safe wideband sampling configuration and add runtime
>> power management.
>>
>> Signed-off-by: Janani Sunil <janani.sunil@analog.com>
> ...
>
>> +
>> +static int ad7768_get_enable_vref(struct device *dev, unsigned int index)
>> +{
>> +	const char * const *supply = ad7768_vref_supply_names[index];
>> +	int refp_uV;
>> +	int refn_uV;
>> +
>> +	refp_uV = devm_regulator_get_enable_read_voltage(dev, supply[0]);
>> +	if (refp_uV < 0)
>> +		return dev_err_probe(dev, refp_uV,
>> +				     "Failed to get %s supply voltage\n", supply[0]);
>> +
>> +	refn_uV = devm_regulator_get_enable_read_voltage(dev, supply[1]);
>> +	if (refn_uV == -ENODEV)
>> +		refn_uV = 0;
>> +	else if (refn_uV < 0)
>> +		return dev_err_probe(dev, refn_uV,
>> +				     "Failed to get %s supply voltage\n", supply[1]);
>> +
>> +	if (refp_uV <= refn_uV)
>> +		return dev_err_probe(dev, -EINVAL,
>> +				     "Invalid reference %u voltage\n", index + 1);
>> +
>> +	return refp_uV - refn_uV;
> Do we never care about the offset inherent in where the negative sits?

The absolute REFx- voltage does not introduce an offset into the ADC transfer function. The datasheet defines VREF as REFx+ - REFx- and the LSB size as (2 * VREF)/2^24. Zero code remains at AINx+ - AINx- = 0.

Regards,
Jan

