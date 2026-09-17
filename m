Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CC033BE15D;
	Thu, 17 Sep 2026 08:08:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789632503; cv=none; b=HjpCAMJPuQ6xg1BBK7rTqYM1fDhsUJrSRtyjP0IZINOERG0TK/xjFHZVXgXUQDh7Z+4njFK4UO8MWIXOXrSL0WGjshASKm78y4w6TpoGNUho4XbqtUuOR4dNBs0PG6wnf9/6rTyvQVsNvlyb/0i9c4bbbB4kmrvm8ZFDr5ni+hc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789632503; c=relaxed/simple;
	bh=vhf5piC22ZWCFlMZ2ATTaUHfnBXyo4sL9HrWZeEdcu4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KViNAUMSZkxN6U4KZD2IqvOunk4hs/G27ScqPy84FrHX/qKSAWP0n8SFEp9khIe2BjapZjh+mMhaRVqy8+t5Ttd+0FEg4IguClZF58NNb3/A2VgAzL47V61TpW9Tfd6uXjVecYc8+Eu5I0HAHxTv6Av9mcSL0aYO2M9fYl0pJzE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mdxFP2xg; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mdxFP2xg"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F32D71F000FF;
	Thu, 17 Sep 2026 08:08:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789632502;
	bh=FxGbpQZOpER6eaPdVmeHfSDiG9Gr7rWU/1yQhczygfk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=mdxFP2xget++tNik41E8Hf7okuEYfVV7LN/EEP5KoEapIK+bXaMcTD89ATNEgSFCW
	 zIWTjNLJldSvcpHbQCDwEpVmB7VkAy3Hjj7b7Gs9+npnsuepbiKLLFYX1unOGLzb3Q
	 cRNCY+xfsVv/beyIDSg9eWdUiKzFlFgdFRv7hs7yB93ctSYEgCFkbc/DksxjVXMMmF
	 Fim4aKvC2zXpKJmxP2C/QBFoaEZpbb7drHtzmvOygxXPPVdK+HZzuu2mohrebeB7QI
	 kN0um8oTCkXBXbU8yE5JfLwrlXRR5qNGqHeKeAX6dNgzVOL3s+3RNPTwNYg+M1rNNQ
	 v8x+lln70ET9w==
Message-ID: <3dc63afd-ab21-4e3c-b6da-0fb51584ca9a@kernel.org>
Date: Thu, 17 Sep 2026 10:08:15 +0200
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
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Alexander Stein <alexander.stein@ew.tq-group.com>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org
References: <20260915-vc-mipi-ctrl-v1-0-8a42b693d889@linux.dev>
 <20260915-vc-mipi-ctrl-v1-2-8a42b693d889@linux.dev>
 <20260916-daft-relaxed-mouse-9bfaf4@quoll> <aqpC8fxO4F3bFjF4@bombadil>
 <45fd8255-6ba8-4488-acc8-4f7fc9c85ade@kernel.org> <aqpYqrtKTY20IW_0@bombadil>
 <a46e3ea2-8a21-4b9c-a112-99d249f46e99@kernel.org>
 <20260916165244.GB191870@killaraus.ideasonboard.com>
 <f20daf57-88cf-44e1-a2af-8769d3500176@kernel.org> <aquan_6JiKkEw-Kp@bombadil>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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
In-Reply-To: <aquan_6JiKkEw-Kp@bombadil>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 17/09/2026 09:55, Richard Leitner wrote:
>> There is no "clocks" property in the binding. If there is input, then
>> there is a "clocks".
>>
>> Then we never describe external oscillators with "clock-frequency"
>> property. ACPI does, but not DT.
> 
> So how would that be best solved in DT?
> 
> Should there be a "fixed-clock" child node for that external oscillator?
> Something like:
> 
> vc_mipi_ctrl: controller@10 {
>   ...
> 
>   vc_mipi_clk: clock {
>     compatible = "fixed-clock";
>     #clock-cells = <0>;
>     clock-frequency = <37125000>;
>   };
> 

Oh, wait, I misread. The external oscillator is not external to the
module? Below...


>   i2c-tunnel {
>     ...
> 
>     vc_mipi_sensor: camera@60 {
>       ...
> 
>       clocks = <&vc_mipi_clk>;
>       clock-names = "inck";
>     };
> };
> 
> Or should (as discussed in the other branch of this thread) there be a
> separate compatible for every vc-mipi sensor variant board? Then this
> could also be part of the compatible-dependent driver data.
> 
> Or are there any other/better approaches to this?
> 
>>
>>
>>> uses it for internal purpose, and also to provide a clock to the sensor.
>>> Very roughly speaking, and ignoring power supplies as we focus on the
>>> clocks, the camera module is architectured this way:
>>>
>>> Connector
>>>    ||                                       +--------+
>>>    || <------------ MIPI CSI-2 ------------ |        |
>>>    ||               +-------+               |        |
>>>    || <--- I2C ---> |       | <--- I2C ---> | Sensor |
>>>    ||               | FPGA  |               |        |
>>>    ||               |       | --- Clock --> |        |
>>>    ||               +-------+               +--------+
>>>                         ^
>>>                         |
>>>                     +-------+
>>>                     | Clock |
>>>                     | Osc.  |
>>>                     +-------+
>>>
>>> The frequency of the external clock oscillator is what the
>>> clock-frequency models.
>>>


... this sentence confused me. If the oscillator is part of the module,
then clock-frequency property is applicable or it is implied by the
compatible.


Best regards,
Krzysztof
