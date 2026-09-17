Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA09542CB1C;
	Thu, 17 Sep 2026 06:30:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789626613; cv=none; b=Os2TNliwn3NRU8BMnJLoxYiLLmxcgoxgBe0bArH20Y3xrAv3FW3hS7BTzZVkzFhufy+XJpwfmnOrhtW7CSjA+8sHIUebzjKMPNAQCSNfZmpfQGwweYWrsHyg+/xsLYzNI9PcdvXq7GuVvCnJVePtmG/bdn8VLYcYfqvA9cNlry8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789626613; c=relaxed/simple;
	bh=YPFScX46dtVLDesKTpQRZ9ioRFLBFLWabeKMFUo9qbU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LIbG0t6T6sZLSLaWhE/5bVHDrh1nj++70kGK81AFJ3CksIQzth3bqqN2uUHg6uyA1CksHryRQV7elz9JnoeJ4n6uKjnZrvQIkU6PL5l+OS9i6lfh14JID8AyDsXKEJsi1GpofVU5Rchfk7PfYeemqPClIrVeiTzCEgyMgdhBihw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oooFHmiv; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oooFHmiv"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 954FA1F000FF;
	Thu, 17 Sep 2026 06:30:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789626612;
	bh=oKDdQH52kiSlciqgtYxCmcuJEJK3Y5PtNH05w6trem0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=oooFHmivbNrUmmukkNgg8PKnovs1OSWmNvh3STCGeEi/fgjzfaUiY4i22qRdagcg6
	 KHWHzY+CFlS0R90WWAzWQhYBMV2ODEsO6RTGfaTt/IQEEkAnKfDZJp2ilTEXCH2se0
	 i4nZjCyhRgjmpkqHAiI/b095BHaRNIud+0jIMj/GoUs0AdO0HYhr3jXM13TXnun90D
	 iCPW7HvrtUQgOAzpv7KWUaxf8byR8PtYOaimTC8ds8x9Wjb2rOrsM+T2u4keYdx3Mt
	 rUfeNIKCoHOWyDaK6H2j6ti8362HWHCDr96AG8HxLN91umHWJW9GeOorv1oX6/HjDA
	 NHtwLpi+OMRNQ==
Message-ID: <accdb907-67ee-45ee-b06a-173e49a3ca00@kernel.org>
Date: Thu, 17 Sep 2026 08:30:05 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] dt-bindings: media: i2c: Add
 vision-components,mipi-module-controller
To: Richard Leitner <richard.leitner@linux.dev>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Alexander Stein <alexander.stein@ew.tq-group.com>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org
References: <20260915-vc-mipi-ctrl-v1-0-8a42b693d889@linux.dev>
 <20260915-vc-mipi-ctrl-v1-2-8a42b693d889@linux.dev>
 <20260916-daft-relaxed-mouse-9bfaf4@quoll> <aqpC8fxO4F3bFjF4@bombadil>
 <45fd8255-6ba8-4488-acc8-4f7fc9c85ade@kernel.org> <aqpYqrtKTY20IW_0@bombadil>
 <a46e3ea2-8a21-4b9c-a112-99d249f46e99@kernel.org> <aqqtG31q_nNxzme1@bombadil>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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
In-Reply-To: <aqqtG31q_nNxzme1@bombadil>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 16/09/2026 16:57, Richard Leitner wrote:
>>>>>>> +  vcc-supply:
>>>>>>> +    description: Power supply of the module (3.3V)
>>>>>>> +
>>>>>>> +  '#address-cells':
>>>>>>> +    const: 1
>>>>>>> +
>>>>>>> +  '#size-cells':
>>>>>>> +    const: 0
>>>>>>
>>>>>> No children allowed, so why these two?
>>>>>
>>>>> Based on your and the bot feedback I would suggest for v2 to change this
>>>>> "generic i2c bus" to a simple "i2c-tunnel" property which has
>>>>> "$ref: /schemas/i2c/i2c-controller.yaml".
>>>>>
>>>>> This would better reflect the actual hardware, as there is only this one,
>>>>> in firmware hard-coded I2C downstream bus.
>>>>>
>>>>> Would this be a sane approach?
>>>>
>>>> If the underlying I2C bus and sensor are important, then yes. But I have
>>>> doubts that you need to describe the sensor if it is truly
>>>> unadressable/invisible to the OS.
>>>
>>> Yes, the I2C bus and sensor is important. The device driver of the sensor
>>> talks (via the tunneled I2C interface) directly to the sensor.
>>>
>>> The separate I2C controller/bus description is necessary as the tunneled
>>> I2C bus has some quirks unfortunately. Those need to be addressed as 
>>> otherwise the sensor drivers do not work.
>>>
>>> So the idea is to not have a vc-mipi module binding per "sensor variant"
>>> of the camera modules, but provide a common controller driver which
>>> provides the I2C bus for the sensor driver.
>>
>> Bindings must accurately describe the device and so far - based on the
>> website - there is no device as mipi-module-controller alone.
>>
>> I don't get why you assume that all of the variants are exactly
>> identical, thus sensor variant is not applicable.
>>
>> If they are identical in all aspects, then why clock-frequency property?
>> That's obviously rhetorical question, because they are not identical in
>> all aspects and must produce different clock at least.
> 
> From that point of view, of course all variants are different.
> But the interface towards the host is (according to vision components)
> stable. This is why I aimed for a separate device.

What makes you think that interface is stable and the same? Is the
stable aspect or its versioning documented anywhere in the docs?

I can easily imagine that FPGA synthesis actually differs on some
sensors or they ship a new, updated version, thus at some point the
interface might change or already changed between models.

> 
> So what's your suggestion on how to best solve this?
> Provide a per sensor compatible like e.g. "vc-mipi-ov9281"?
> 
> Nonehteless this device must then provide a i2c sub node to place the
> actual imaging sensor on.
> 
> If that's fine with you I'm personally fine with this approach too.
If you have certainty, like documented spec somewhere telling this, that
programming interface of FPGA to the OS is the same, then go with a
generic fallback compatible like you have and add front compatibles
specific to the sensor.

If you do not have certainty, then I would go only with sensor-specific
compatibles for both front and fallbacks, so:

vc-mipi-ov9281, vc-mipi-imx297

It does feel a bit odd, but that is usual way to handle any future
differences when two vc-mipi modules turn out not to be compatible.

Best regards,
Krzysztof
