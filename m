Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E0EB355F5F;
	Tue, 29 Sep 2026 06:00:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790661628; cv=none; b=bePIbxCDUsGDC+32vExUz3iBczdIqqy1dgsFPem785gkpjJ5ST0m3DhiUm96vwDSkEHgDCwPDMhfy0yqu8FAWKqEZuzkEV6kdtmhKcxzk/QG1bvIQbTQ101VZFVZSgwcYOqGLJpQHya357WxAaUEw1jhO+FRIoj/jBrLALIGwCA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790661628; c=relaxed/simple;
	bh=6zvgkwHGM3IYXt4bhTQK6rVG+b5tVzrDniAM/UIpvhc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dNikhNEa2Rv0Vuj8y/AGxkZbuuL47ULxshMdAH0E3MxgM2iCHng9cUFqaSp5fLnK61QVQ1ZpN0I+pCPoTUZnvbcer6jXzOClMZplXyWHqZuNGD0qgI7lFNkyElIgMYwVNwtXG6BGQUVKSRpP3jrNocuNTL3+n4JbScdvrTPTPd8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Fah8C/kZ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Fah8C/kZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4BB601F000FF;
	Tue, 29 Sep 2026 06:00:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790661626;
	bh=OVz0v9wYmsxbPEfBPKUnNadFzZc9eqoExIFQ5MnwmNY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=Fah8C/kZgpM9LCP6hJ536sx1XW4LVjuRMccBVIMt8kceYElOHtAf7MFtXdKMgEP+N
	 j2mxHXcdrtQ+co+0sTUZf86QgE5OuzFjZCMLjFoDifbfugTa0gVQtqxl0ETbuG4KYk
	 b+DF4NfGLzUQR2K9Is1WBQH3YH0xr3sjLtqok+58OYdz80j2UkMvgB8BYDDP98JDG1
	 QwcWDiHJ2ZfZvRTZkJQa/fvqrolUsUE87WV5m2/Y+ogJZtSWtvC8dBiVkED7h672Y2
	 MfRZHK6bwh0w8+sUA4v3YvzGY4H0ZUILncFvXogFJhpQFxY/4aGixnMTswmfs9CrEr
	 1678NXMqQrYJw==
Message-ID: <3b1e23f0-76d5-489c-a5eb-0774a21b0f63@kernel.org>
Date: Tue, 29 Sep 2026 08:00:19 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 3/6] media: dt-bindings: Add Amlogic V4L2 video
 decoder
To: Zhentao Guo <zhentao.guo@amlogic.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org
References: <20260924-b4-s4-vdec-upstream-v10-0-1289303a58a4@amlogic.com>
 <20260924-b4-s4-vdec-upstream-v10-3-1289303a58a4@amlogic.com>
 <20260928-efficient-secret-manatee-2fcca6@quoll>
 <7fe35ef7-e894-4137-975a-9a5f621a8156@amlogic.com>
 <33499600-5df7-48fb-a2ac-5a703df8dc2d@kernel.org>
 <59541a34-eba9-4699-ba19-69e7b5b1525a@amlogic.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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
In-Reply-To: <59541a34-eba9-4699-ba19-69e7b5b1525a@amlogic.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 29/09/2026 07:57, Zhentao Guo wrote:
> Hi Krzysztof,
>> On 29/09/2026 04:59, Zhentao Guo wrote:
>>> Hi Krzysztof,
>>>
>>>> On Thu, Sep 24, 2026 at 03:55:10PM +0800, Zhentao Guo wrote:
>>>>> Add bindings for Amlogic hardware decoder accelerator.
>>>>>
>>>>> Signed-off-by: Zhentao Guo <zhentao.guo@amlogic.com>
>>>>> ---
>>>>>    .../devicetree/bindings/media/amlogic,s4-vdec.yaml | 114 +++++++++++++++++++++
>>>>>    1 file changed, 114 insertions(+)
>>>>>
>>>>> diff --git a/Documentation/devicetree/bindings/media/amlogic,s4-vdec.yaml b/Documentation/devicetree/bindings/media/amlogic,s4-vdec.yaml
>>>>> new file mode 100644
>>>>> index 000000000000..751043c3d9cc
>>>>> --- /dev/null
>>>>> +++ b/Documentation/devicetree/bindings/media/amlogic,s4-vdec.yaml
>>>>> @@ -0,0 +1,114 @@
>>>>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>>>>> +# Copyright (C) 2025 Amlogic, Inc. All rights reserved
>>>>> +%YAML 1.2
>>>>> +---
>>>>> +$id: http://devicetree.org/schemas/media/amlogic,s4-vdec.yaml#
>>>>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>>>>> +
>>>>> +title: Amlogic Video Decode Accelerator
>>>>> +
>>>>> +maintainers:
>>>>> +  - Zhentao Guo <zhentao.guo@amlogic.com>
>>>>> +
>>>>> +description:
>>>>> +  The Video Decoder Accelerator present on Amlogic SOCs.
>>>>> +  It supports stateless h264 decoding.
>>>>> +
>>>>> +properties:
>>>>> +  compatible:
>>>>> +    const: amlogic,s4-vdec
>>>>> +
>>>>> +  reg:
>>>>> +    minItems: 2
>>>> What is happening here? Previous version was different.
>>> maxItems: 2 implies that a single items is also allowed,but the hardware actually requires at least two register regions (dos
>> Since when?
> It should have been minItems:2 ever since v1,I must admit that this is a 
> long-standing mistake.

No. Since when 1 item is allowed?

Best regards,
Krzysztof
