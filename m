Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86E58486B89
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 15:08:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789052911; cv=none; b=PXzTYaVEBcLq4D8PGth08tsVIJA+uyHN/DVx0w4qRs7DY4jnSYIzg91XA1gS5pPk9EXGyGTOXkKTAEV5/l3GhS+JH8jWMp10vGVv4/YUtZi2ug6QhNjTnerJyHGOYgRnT9zk1hR+k1orqF6mU0CHBUYxEbDKK+hrSxQe5lHRZW0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789052911; c=relaxed/simple;
	bh=YSYs9LbmZU0PYWfoZXs1bLGfoTvd1+eohtoxmTIiqW8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZS23whwhsLMItFHDV9u35RBQHsG2ix6FmAIg52Yr3Ueb010lJyt+Ye/v5X0AbPAh9Z7SxeL5sHLHunZIdA4RlHzjfVXvEE5dC5PJqoH55wgc9PiidFB/JT0Xos0QldKncPzxbTVq6ENdLhWqd/yNFNkOEFH/ULIYoCZzFS5/lTU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aQuUBOek; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aQuUBOek"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-49954b88fffso53118395e9.0
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 08:08:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789052903; x=1789657703; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/O88mD56SBzt1YvJ4sXCFFpkOs3XAqa1P/dxdZfqCQY=;
        b=aQuUBOeksgHQbypXJpEW/M+bAEGXXM99yx4WFvRTQhDu8R0N/Dr1a8yfdVL52H2WAu
         aSycI7wZ9reOyZ6xGDEsSYWShV7XzQSQ0JPQAePAlVN9xzu3udfWpaFXoNhB8kGGTOrH
         5Mtgu5iXS64sEd46lvnWttwBwk0xxO9iER8xqSGWRNiXYMOqGum5+io+uJimfnaqYO95
         WjUmjI5jFmkQYp12g2MFrCScqBYTh/QvOGfW7jasl9bFMyTc/02G8ibaNqEmvhQlBeyB
         YcHtzLaY740pupKq0+vo5zg6t4yoT/i85DzCdH1IhbcW4FMb0d44F7r8mcbJt6hQdBCf
         /JYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789052903; x=1789657703;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/O88mD56SBzt1YvJ4sXCFFpkOs3XAqa1P/dxdZfqCQY=;
        b=SwIlIlbSzQjvvoS7s2Slzc+XZUMBTQzwkIz3Dv5Huoqtp7DR7IroHPMaidlhtx+dQ0
         sRry+6SQxRoBWsfZsiImtWLjuEc9ifWwlEhfTMSGLP5wUg2Q5oRUzrrGrE31OPoAdgxt
         5hBlaUasEQ5ER8x2qiyStV36E5PVTp0MzIDAc9n1Wvg9VV8mCW58YcZxyqfr3dA0kaqL
         iCgdx0/e3Na0OwPQozK6eQZkw061bMeiSthLy6v44cX1HsYdanCEymTU8QrtwbOqtYCu
         ns+LMGo5ipexNFje5s5ozCprX1y6xGPTRArtC2FuxKl4s4be6FWDrS8BBiUK4mCkZvrp
         5HWw==
X-Forwarded-Encrypted: i=1; AKwUvBz6Pma1h9279PP2OFegslpoB+xB5uUpb3QZe4rNOgLQQRWBOb8tEmZWh8C3Al7QSYHQz73/pXVDQS3mdiY=@vger.kernel.org
X-Gm-Message-State: AFuF++kg9CPZjvjPsHoTsaXgWOhOrPOso29BiTxGUc7utrnJuCtu9+4+
	vzPBF3hykTNS+olMSfGDZRe9qQp1gJbjVabsaHP1Wod3oLYu4nqC+Z8E
X-Gm-Gg: AYBFou06j9RCtE7kTYIWJ62OLfpMZCGmqTbCAghkWz6uOeB4E4WVUzCe5RyB2ma3YOZ
	p2xeKJhtZo2kFA6xN7wvQhlTrae3RFz0/7rP+W4Ae8Jm7dhBGEDrpBpeOhYwukXqBVx26PWAsPO
	vmpJ9nzY0U5N4YovjlOntRCFiQ7qGFUSEZzD20hJ4iDiZKo46NO2pBGyBK5w/7EI34FXzxiP5EY
	62NKvChT2VqALb0Xeg28y12e4PuyT2wzIP0WHhIB5m9WWQQmAOZiLmI2lN0hxgsJAT8YnJGuSnh
	dpQ7QUXAx0+y2+aM9xmrYN/ohQkb/FAFL9gcoGqYZyZ+OI9HECpybe9jhw6oarQ2UQVGmG8tI68
	4HdamEo+glS/tBDhd40mRmbHxcCKPjxU22FqxPSuuIKhxN8AsM/k1w7yEY+oAXidIwzJjyqTcY5
	psNe4pWefMJOi2ByGrh5L+JENKTms7kNZ8rpphoti0jfATkw6asvGIuSjxTRLT9+pOXcvKtWIEi
	O21sKzpkXWgBmbFjdQkmw9ue7NKqEOu
X-Received: by 2002:a05:600c:4f12:b0:49c:fc6c:be00 with SMTP id 5b1f17b1804b1-49cfc6cbfcamr388041945e9.23.1789052902962;
        Thu, 10 Sep 2026 08:08:22 -0700 (PDT)
Received: from [10.25.218.197] ([128.77.115.158])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49d24e01c66sm48739535e9.1.2026.09.10.08.08.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 08:08:21 -0700 (PDT)
Message-ID: <a41510f0-8906-4698-9919-b65b40cc9b89@gmail.com>
Date: Thu, 10 Sep 2026 08:08:18 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/2] arm64: dts: freescale: add MR-NAVQ95 basic board
 support
To: Ahmad Fatoum <a.fatoum@pengutronix.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Frank Li <Frank.Li@nxp.com>, Fabio Estevam <festevam@gmail.com>,
 elena.popa@nxp.com, consmin.stoica@nxp.com
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Pengutronix Kernel Team
 <kernel@pengutronix.de>, imx@lists.linux.dev
References: <20260909153943.1048-1-laurentiumihalcea111@gmail.com>
 <20260909153943.1048-3-laurentiumihalcea111@gmail.com>
 <f0136c29-e372-4ae9-972a-23d7a60d75e4@pengutronix.de>
Content-Language: en-US
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
In-Reply-To: <f0136c29-e372-4ae9-972a-23d7a60d75e4@pengutronix.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit


Hi Ahmad,

On 9/9/2026 9:20 AM, Ahmad Fatoum wrote:
> Hi,
> 
> On 9/9/26 5:39 PM, Laurentiu Mihalcea wrote:
>> From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
>>
>> Add basic support for NXP's MR-NAVQ95 board. This board is designed for
>> robotics applications (e.g. drones, rovers, humanoids, etc..) and has the
>> following hardware feats (list is not exhaustive):
>>
>> * based on i.MX95 19x19 SoC
>> * 64GB eMMC
>> * up to 16GB of LPDDR5 memory
>> * 1 x USB 2.0 TypeC
>> * 1 x USB 3.0 TypeC
>> * 1 x RJ45 port with RTL8211 PHY
>>
>> The support targets revision B of the board.
>>
>> Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
>> ---
> 
>> +	chosen {
>> +		stdout-path = &lpuart1;
> 
> I would recommend instead "serial0:115200n8" here. This introduces no
> change for Linux, but for other consumers of the device tree, they will
> be able to agree on a common baudrate.

ACK, seems fine. If there's no other objections to this I'll make the switch
in V5.

> 
>> +	memory@80000000 {
>> +		device_type = "memory";
>> +		/* actual size filled in by the bootloader */
>> +		reg = <0x0 0x80000000 0 0x80000000>;
> 
> If the board has at least 2G always, this is fine.

the board only ships with 16GB LPDDR5 so yes, it'll always have at least 2GB.
While the current size is fine, maybe it would be better to change it to 16GB?
Will have to update the commit message as well since "up to 16GB of LPDDR5 memory"
might be a bit misleading.

my other option was to leave the size set to 0x0 like some QCOM DTSIs seem to do.
Not sure what the preferred way of handling this is?

> 
>> +&usdhc2 {
>> +	bootph-pre-ram;
>> +	bus-width = <4>;
>> +	cd-gpios = <&gpio3 0 GPIO_ACTIVE_LOW>;
>> +	pinctrl-0 = <&pinctrl_usdhc2>, <&pinctrl_usdhc2_gpio>;
>> +	pinctrl-1 = <&pinctrl_usdhc2>, <&pinctrl_usdhc2_gpio>;
>> +	pinctrl-2 = <&pinctrl_usdhc2>, <&pinctrl_usdhc2_gpio>;
>> +	pinctrl-3 = <&pinctrl_usdhc2>, <&pinctrl_usdhc2_gpio>;
>> +	pinctrl-names = "default", "state_100mhz", "state_200mhz", "sleep";
> 
> Looks unexpected to have same pinctrl groups for the higher speeds.
> Are higher speed modes even possible on this board?
> 
> If not, I would suggest dropping the extra states.

The pin configuration is chosen to meet the timing requirements of the 200MHz
state. Because of this, I would expect the configuration to be appropriate for
lower frequencies as well.

The intention is to use the same configuration as MX95-19x19-EVK since, from what
I've been told, the trace lengths are similar to those of the EVK.

Thanks for taking the time to review this! :)

