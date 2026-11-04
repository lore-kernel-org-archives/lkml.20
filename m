Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793784774;
	b=T8UR/cTid7UjxwnJD/eQR9S4L6nJAVs0all8pe8zMMJuWbpDRkkRX+A86uBkEUdk8FIC
	 KHujSFASnKiO3BYlA0rYfrqGHOI5tIlq94Yp4cTysYDP/faB1TezNxuHg2pEg9HlWN364
	 OspGF9DfA+QOsgqXsl2cU6gzErzwpXjd+GG+yNIJFiM9t7BXLYEMjAzsFNrt10hki4Ie3
	 h8724BWaEyXtEA672uxprCAogniy9ClmpOMEVoLeDrx2KpDaW6SWc2pICrwm8wRixMFmi
	 kSIDSqnG+SUuDfIpX/5sLWHGaREFPS1QkxO11gr6gLsj49LeTJ3UEESTg5wXq0lbIBA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793784774;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:Autocrypt:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=SkhmiTU3L0W+PtMKZoljzuVT2by2BnJf0VMN53m+45o=;
	b=aKmHYVXbKyJ+lc6oRN+Ju5MJYMw9Ed7NYrlnPwwYI9zjSZGmsgAvUdtxNZ6o0fNfWcPg
	 zHHMEz0mgmrHVkNsHA8AQyjRWHGOJncb2DXEjc2W/+5BRjLsJRqaQx4TlzECYfyzTIED0
	 gJHoPgtGa3HhdaN5fWFo74hexO75Lf0oldp+fZff4YSZYsR3ZaZI/p6ONoVub4KHbbKgp
	 P1Rx+UY/q5aKtVbDifC9xkia19EVZRPCOii8j25yBYFDsVL/IKuqP05X9VPqqGojpyBgh
	 U/r8g+eRWbjRvzp+spXDCs/hIEfYlx6A6SUVM9d6bM6F2oOF10ggwIGpa4JWEhvP1OA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=PNEhKOfw;
	arc=none smtp.remote-ip=209.85.128.42
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67844606A31B
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 09:32:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 67844606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=PNEhKOfw
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4a208d93758so4369935e9.3
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 01:32:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1793784771; x=1794389571; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SkhmiTU3L0W+PtMKZoljzuVT2by2BnJf0VMN53m+45o=;
        b=PNEhKOfwl/GuGjZwc+xP+byiJz0jf2rJdMD9L0G10b/XBzi7OQLl0CeP8G8++Adrfz
         b0NzEvUlsGOGJKy8R8hFb6bxrhB/vOORhRPYfieI7ZqpbZOBO2U9906DVVgNDZFBxVh6
         ZapxX8CIv2VXXLDvnRhvjWvSDrN0V8aEgTcXnLgVG3W3iK92urgdkRcBjdv23Z9rqnHz
         CrfaHUH7T4R0O+AngDYsXzxUuTAa3yYpy/wOdnASGGrP55rnbnxgWDxkR7kpIK0wPqhS
         cbUiLiRZ/2MM24unVeOsnOh13omNn4DnhrJlLy0PX0Fdd/shUphEuKWGcaBEX2F6ovuv
         jbJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793784771; x=1794389571;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SkhmiTU3L0W+PtMKZoljzuVT2by2BnJf0VMN53m+45o=;
        b=zPKWxSdQfdRH0IRl6rWp7/ycv7201ndYc0UcFN7KnZKsWTI5kpdehGfFSI8Qoa/wMM
         YuhgDl4DIsomrOsHLGQI892LRXPexj3YYip4B0x0MM0+YtzOgrqvY9prgrwDbv2qDhwT
         M9DQzqDcKsKzj2Jmi8Nw+p27AqHs6LfgW+76wqM21ZgRHWeiyWRpBwxLwwf2ueh3q9qk
         P+2KoJbTO3qNg5GT1I518qFaRBKEmjwjWxB9ISEDnVxAFPVHPiEwcyG15/I8a1eD5xlx
         xxDePBFQAOjjJa8cRtfBNFQkfKxc29wnBUuUwts9CZgnYlCURPZQE1vh0ROH+diVyLFN
         0qrA==
X-Forwarded-Encrypted: i=1; AKwUvBwbHL/rYdAfOZNHPhbPgVrekYCB4TWwdsIXn39THHZklJtntuUD5MvI8LWIQbVwYFB5nOHWS9ymypftUrk=@vger.kernel.org
X-Gm-Message-State: APuU4Z/3E7A0/0Dp0MEKCU6XdbaNax6fPIJp0HbPWYfoRJRayUl7fDcH
	oQvUmImS9Z9fUB/wtPEtOcHZMWU9k9zb2mDhH6+CnepWlBpmulrllyP/RK174iyLd+w=
X-Gm-Gg: AYBFou1HxUshq2DoN/ha8HFrp6Hx8zr5f9fqD5Prc74LxM2U+K0CfRHRus4CyNAyGHk
	9+Bo+JwHOxHjTcCLIvzUC8dTtd9hmDlvUAyXJoY6MBFtHeA0QDNrgqKUJ6Y6K0adY98au+nQ01C
	y+PrFmL6RomxhQahg+ea9YZQuz2kmWdP9uQpUeEfRvlNbISTVWTjIcx4+3bShpvDNsNDtha6x7p
	PLVBf447pjpZjPf2EUBbPXy+DeEYWDUwWl1avN9SG5R9LWUoZ5SMtMbm14eCYB4jskN2yuFERQP
	jH3ZPeDdYfQyt1PeCgxxPhOM8YWxvafOlDvT6DC6n6hrseHW34n0O0OQZHfVQqV5O8v0OdiGera
	hiaMH76oeJIhhWERM6KC2QoRNvejt+1hMUrIUsPQwN3G+HH1O/g7HrPxfXZibr3TM9JRq6tN2Vz
	4mX9J9gKim+UgkzrVthioBrNzvHI4fTAZWlvF0CXJwOVSQOpIDMgqTmsHGg516cSKsQztOBk2ON
	5qd34sVMatH8M6hThT1v5dTQp8ZH/O6P+LKwhCNCufrry2juXBp4c0PuxYZ34ZgpmN7u+7p549Y
	dFWimIRzTc67nJC4R03oPjenxl10gWfLwMCu8THY6hUrEye6eu8GNDsCAAagffXjgZsojqWt+dC
	kzQ==
X-Received: by 2002:a05:600c:840e:b0:4a1:813f:2a60 with SMTP id 5b1f17b1804b1-4ac17d168b1mr393740865e9.11.1793784771558;
        Wed, 04 Nov 2026 01:32:51 -0800 (PST)
Received: from [192.168.1.62] (140.30.66.37.rev.sfr.net. [37.66.30.140])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48fedc09675sm2799433f8f.55.2026.11.04.01.32.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Nov 2026 01:32:51 -0800 (PST)
Message-ID: <1995c873-084e-462c-83eb-5bc454882c18@baylibre.com>
Date: Wed, 4 Nov 2026 10:32:50 +0100
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
Subject: Re: [PATCH 04/11] pinctrl: scmi: report an off setting as not set
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Sudeep Holla <sudeep.holla@kernel.org>,
 Cristian Marussi <cristian.marussi@arm.com>,
 Linus Walleij <linusw@kernel.org>, Peng Fan <peng.fan@nxp.com>,
 Oleksii Moisieiev <oleksii_moisieiev@epam.com>,
 Andy Shevchenko <andy@kernel.org>, Dhruva Gole <d-gole@ti.com>,
 Bartosz Golaszewski <brgl@kernel.org>, arm-scmi@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20261030-clegoffic-pinctrl-scmi-gpio-v1-0-52d92843ad97@baylibre.com>
 <20261030-clegoffic-pinctrl-scmi-gpio-v1-4-52d92843ad97@baylibre.com>
 <aunHoe9PfumHp0Gh@ashevche-desk.local>
Content-Language: en-US, fr
From: =?UTF-8?Q?Cl=C3=A9ment_Le_Goffic?= <clegoffic@baylibre.com>
Autocrypt: addr=clegoffic@baylibre.com; keydata=
 xjMEafx9bxYJKwYBBAHaRw8BAQdAtc85GIwDXLz0rh9thWXC80Lji0otVDVncXT4qaS4j1fN
 K0Nsw6ltZW50IExlIEdvZmZpYyA8Y2xlZ29mZmljQGJheWxpYnJlLmNvbT7ClgQTFgoAPhYh
 BJjMiHuM4ZUwFqUPr36EW4KtCh6TBQJp/H1vAhsDBQkJZgGABQsJCAcCBhUKCQgLAgQWAgMB
 Ah4BAheAAAoJEH6EW4KtCh6Tt+sA/jVC35rY1npFlOy7YnncTdrID8Qf855JA78IzXgvzpGp
 AP9FkuuT80m66PP3DvgYX9kVnG17mSDKO0+v2W18v6ZgCM44BGn8fW8SCisGAQQBl1UBBQEB
 B0DMwF4u//aQyzsFlO8rPJ/cqsAuPH80IeIA3HOEo5mlVgMBCAfCfgQYFgoAJhYhBJjMiHuM
 4ZUwFqUPr36EW4KtCh6TBQJp/H1vAhsMBQkJZgGAAAoJEH6EW4KtCh6TdSgBAMDS0MiWCivt
 LjzZc9bs+P/xdXywUjDKq3lpQGJ6vZ0GAP9vI6DnN7vwVK6jt6/+0aBGkog5Ura9+WwRFEdM
 vLfPDQ==
In-Reply-To: <aunHoe9PfumHp0Gh@ashevche-desk.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Andy,

On 11/3/26 12:38 PM, Andy Shevchenko wrote:
> On Fri, Oct 30, 2026 at 04:58:35PM +0100, Clément Le Goffic wrote:
>> A get of a setting that is on or off, the flags and the pulls, returned
>> 0 as a value, so every one of them showed as set on every pin. Return
>> -EINVAL when the platform answers 0, which is how pinconf reports a
>> setting that is not active.
> 
> ...
> 
>> +static int pinctrl_scmi_map_pinconf_arg_get(enum pin_config_param param,
>> +					    u32 *value)
> 
> I would dare to keep it on a single line.

Alright, I'll do it here and wherever in the serie.

> 
>> +{
>> +	if (pinctrl_scmi_pinconf_inactive_flag(param, *value))
>> +		return -EINVAL;
>> +
>> +	if (param == PIN_CONFIG_DRIVE_STRENGTH)
>> +		*value /= MILLI;
> 
>> +	return 0;
>>  }
> 

Thanks,

Best regards,
Clément
