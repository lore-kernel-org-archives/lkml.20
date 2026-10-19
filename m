Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792427568;
	b=x/aG5aBa0yRg6oTDaAWNV08eqyF92p5/cUYuF86RZVrrreBJI1gMSqtLiJnChoXgWhyW
	 DWw49X3Ygh6ehnCct+vmg+WEV0Yn7bd+h9APAu97G/hFw1ijz0oSc4i/Iz3iqcnyDgi2C
	 mVhsUGOEZuPfnUFof1PszsRxI0LL0eJMBUiZtfJH2wYmeaHKj3JJwfvW9n2j0ku03LS9n
	 ohm+ZNnFRc7wOKZe2m0sU9q8RavjflKTnV+D+rSJvfCt57rXksjHrtMzMgw7ImZy+ANIs
	 1RHVeBwrlpxSJJCNOsd61YYGYOcrK+POXw1HKM5Xhv/shBg91o8OQjUIvp3Ak3E9AjQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792427568;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=BWj6P+5N+9+xj86kghtIJTrYQUXSGty1irTiTrrFBnA=;
	b=k160ZDg371ZQJ1zgPZJ0E7tcZojQLOeg/NLF53JEs8L2XSY6vRtUXUSBgAcXWbyK2802
	 jG45TysgxBhxM4iRskj5hcC11cFHa9BrgoXmlDWnlr6CYhlNmM6qH8zYbfOuCP/N7wijW
	 QYuuVsQsIgiedxw4ZLMwt8tC/gil0uQaumCtEvXFr1p9nwS2gmpDERZym7DYZODOX1yfY
	 R7BHTWu+Bs1pKowuVu6yMQSSK2HiBYvTtA0YoVeh0xG6CgfXw7e9ktI0tMOeFWOyupnsS
	 /NZBxVZvHdvJCBU/+Vp6Q81b+BcWWFHgk9u5kgSkVFnXrjNCP0FmV/QaQer2lO5RXPQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=uihAlf9K;
	arc=none smtp.remote-ip=209.85.128.49
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04C05606A31A
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 16:32:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 04C05606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=uihAlf9K
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4a1b07c3c5fso25021385e9.1
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 09:32:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1792427565; x=1793032365; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BWj6P+5N+9+xj86kghtIJTrYQUXSGty1irTiTrrFBnA=;
        b=uihAlf9KMF1E7leWuq2ziF+jrvFzjVQh7yDYYwzmE3kGwVMD/K26Cbe/WTxyj+aj7T
         mAesrIGwyR4p4Ql43E484qxEkEgCc0OkE9YMJdVzd0q1ccVEqcLEq3T7yJPl0GDq5V2M
         VjoLaMO1/sSM9Xw0782GHEKPJDIi+C135kZe6YY73odVwoBYIbX6GUimHcMSomwtinBM
         qKmut9yiRk+wIbHsrkMrx1UWH7snwPL6op9IUbn8BCco5lV+VMY0sdLxsYG91VuGKJcF
         hK4ft3UJvUPrYuW9Afwdl5axq6UN2qcIMClH3N+BNIuY2d/Yl/VQCVizt+5p/aBByBlZ
         V6Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792427565; x=1793032365;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BWj6P+5N+9+xj86kghtIJTrYQUXSGty1irTiTrrFBnA=;
        b=Oltl89+r6/f8J1UnUNDEq26pwGdk7QxSUEQ0u7lE1H+4TIjVAZWYlWmFXKdy11xFyi
         RpQ6+X0R6cKQsW/3TTm2f25Z+l6/3xrurHfMqW3zPRjWaGJftYxYpPhvmWAjD5QTO+18
         dZhLGW3wvBVZnbbvutHmX+xi9Q/E1EE1qjBUQ1xAy9BkyR3OXq8OawtDuWaBjIpazzXo
         4AlL7ObvRTkUo50z9/Wd9xLtsgh9YXgWDiSygKnTCBzZcZZR/Egawf8jD6gocaYXeyin
         yDbW8PLQxvPty2BPGX2tyHi4udi3gAISFKEQ0B83XEq4YvOj3VOcSaqc4mVD20ZfsXss
         Y0yg==
X-Forwarded-Encrypted: i=1; AKwUvBzgf82v2QTSFeV2JqbaMERWPfXR2heAGaCJu/h1umyDrKkbCH58hYbqIEZw05lFt7eoDmdsd/UImO3N/OA=@vger.kernel.org
X-Gm-Message-State: AFq9FYJjtEkKYENbMKVJel0UJeUrpKpW94GnPJzgHXAdkUInp78j2BtT
	HMsufSXXXJ/PBA3GBTkzxolqDcTpPrwDKlpLC4Li2zMiiKSfVCPcC+m1jSAEDgkM7hs=
X-Gm-Gg: AYBFou1mwqrr5R//gKMxugjpeqkrkEqOXJq/YRr8ykRXyPgVnnLAHz4Pb4prDdaCIQE
	/wGS4sdnZq7lF1WcaDItElrnqBOvGu9G61vZv9vOPkIJ2dulREafd3TwdnCKn3eqSlfZ8m91+6k
	5U0UIKGEuIaIFrdaFHm/jaxPBFLo1bVahNgZSCHUfDSb/RdSSk51t6L5rEMOMCDACpc5fwO5OiI
	473ip5ZfMdd6rXGkqnzHk3ySt3hpHirVmM/EANRuJEENhnvQXVog+mZwQjJmwC91I8uS3l2ZO2z
	2/z/0gG5LE4x9V09Y29GWhcb5i0nVwJ76n7DOfntUBIhiE3RAIuE7Mm00LmzYvkyVNywygO/ktT
	/jm0YsgWUywqUacK0jeg8ClKzNlL8lQiNJvghByW1Pe9p3UVuRPzAlDGVlHlHWG7gqe0QBC/pG/
	3yz+isdoYUWBV8qw8vPRExMsBfcvrZCELXCa9I2BiMjYOCdNdMbib3Z145L5JKMkyycxZ13CHQJ
	8oQKHhUqEIq4skWXL8AgYjpowj3YIkS1DV/LlZtTOI6e8XCRD98anbBPcAesg==
X-Received: by 2002:a05:600c:3b13:b0:4a0:2150:55fb with SMTP id 5b1f17b1804b1-4a1d75ad08amr209137105e9.4.1792427565319;
        Mon, 19 Oct 2026 09:32:45 -0700 (PDT)
Received: from ?IPV6:2a0a:ef40:eb0:c501:2c4e:44f:2449:8978? ([2a0a:ef40:eb0:c501:2c4e:44f:2449:8978])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1f2cc809csm3538555e9.8.2026.10.19.09.32.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Oct 2026 09:32:44 -0700 (PDT)
Message-ID: <ee975969-e310-4950-af09-f57fb423a9f5@linaro.org>
Date: Mon, 19 Oct 2026 17:32:43 +0100
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
Subject: Re: [PATCH 06/10] ARM: dts: omap: dm816x: Update USB node
To: Andreas Kemnade <andreas@kemnade.info>
Cc: Ettore Chimenti <ettore.chimenti@linaro.org>,
 Paul Walmsley <paul@pwsan.com>, Aaro Koskinen <aaro.koskinen@iki.fi>,
 Kevin Hilman <khilman@baylibre.com>, Roger Quadros <rogerq@kernel.org>,
 Tony Lindgren <tony@atomide.com>, Russell King <linux@armlinux.org.uk>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Christopher Obbard <chris.obbard@oss.qualcomm.com>,
 Linus Walleij <linusw@kernel.org>,
 Rouven Czerwinski <rouven.czerwinski@linaro.org>,
 linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-gpio@vger.kernel.org
References: <20261016-patch-ektor5-dm8168-dts-v1-0-b4ce30217028@linaro.org>
 <20261016-patch-ektor5-dm8168-dts-v1-6-b4ce30217028@linaro.org>
 <20261017083957.7c2696f5@kemnade.info>
 <8a8313f1-d525-45d3-9044-b5f7a00b256d@linaro.org>
 <20261019154503.2111a89c@kemnade.info>
Content-Language: en-GB
From: Andrew Goodbody <andrew.goodbody@linaro.org>
In-Reply-To: <20261019154503.2111a89c@kemnade.info>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 19/10/2026 14:45, Andreas Kemnade wrote:
> On Mon, 19 Oct 2026 10:36:37 +0100
> Andrew Goodbody <andrew.goodbody@linaro.org> wrote:
> 
>> On 17/10/2026 07:39, Andreas Kemnade wrote:
>>> On Fri, 16 Oct 2026 16:41:21 +0200
>>> Ettore Chimenti <ettore.chimenti@linaro.org> wrote:
>>>    
>>>> From: Andrew Goodbody <andrew.goodbody@linaro.org>
>>>>
>>>> USB node was not working correctly with DMA enabled as the supporting
>>>> code had been updated without updating this SoC's device tree. Bring the
>>>> device tree more up to date so that it works with DMA enabled.
>>>>
>>>> Signed-off-by: Andrew Goodbody <andrew.goodbody@linaro.org>
>>>> Signed-off-by: Ettore Chimenti <ettore.chimenti@linaro.org>
>>>> ---
>>>>    arch/arm/boot/dts/ti/omap/dm816x.dtsi | 41 +++++++++++++++++++++--------------
>>>>    1 file changed, 25 insertions(+), 16 deletions(-)
>>>>
>>>> diff --git a/arch/arm/boot/dts/ti/omap/dm816x.dtsi b/arch/arm/boot/dts/ti/omap/dm816x.dtsi
>>>> index 7f3ef3a00ab8..5be9efc60785 100644
>>>> --- a/arch/arm/boot/dts/ti/omap/dm816x.dtsi
>>>> +++ b/arch/arm/boot/dts/ti/omap/dm816x.dtsi
>>>> @@ -574,18 +574,27 @@ uart3: serial@48024000 {
>>>>    		};
>>>>    
>>>>    		/* NOTE: USB needs a transceiver driver for phys to work */
>>>> -		usb: usb_otg_hs@47401000 {
>>>> -			compatible = "ti,am33xx-usb";
>>>> -			reg = <0x47401000 0x400000>;
>>>> -			ranges;
>>>> +		usb: target-module@47400000 {
>>>> +			compatible = "ti,sysc-omap4", "ti,sysc";
>>>> +			ti,hwmods = "usb_otg_hs";
>>>
>>> Why do we still need this? It is depcrecated.
>>>
>>> Regards,
>>> Andreas
>>
>> Without that line we get the following on boot and USB does not work
>>
>> [    0.110148] omap_hwmod: usb_otg_hs: no dt node
> 
> It is somewhat odd to use both ti-sysc and hwmod. It looks like a
> half conversion.
> 
> For an example how usb_otg_hs was converted to ti-sysc for omap3, look at
> 42a79edd4a3dc1bb8e89fd2849f9e8e1e1c13977...v6.1-rc1
> 
> It has no hwmod stuff left.
> 
> Regards,
> Andreas

Thank you. That was the pointer I needed to sort this out.

Andrew
