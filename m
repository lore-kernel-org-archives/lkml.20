Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7B6F35C686;
	Thu, 17 Sep 2026 06:02:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789624974; cv=none; b=ghfT3GH/hePNZOuRI9H7ud1ljSlSWlqbs88+TG4TtdMuaBWRE7fibSiqHs3PnOxYc2ZTBEizXFS/nOvDyy+EmUk2s84gaD/BHcxh4TVqmQtm2NROPyJDoKeoJ6jpQuFHMzjPOkQ29cgCl9yWMZmL4YT8RoCwIJSPfdt3SPZUCxM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789624974; c=relaxed/simple;
	bh=UdJ4KMJPX9gV4GQQy2noPDVAqMPjqn1VS2B/Bht6dQA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ID7jFy3qcznT1aVWRJx/xJbVEdxzC74NHGYZ4VqCKEZd348MXEbxOWXrpFtTDqIT9kSJaawZ5MRPySP2OApPQjIjA65kU3n4fLQcwQGpHn/1p5jJe3orSc7XRMRf9xHkbMj4Po+e+uOoO33iezWUfIq/IVF2XG/p9RKESQ8P2rs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=g5q4ADcs; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="g5q4ADcs"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A6BB91F000FF;
	Thu, 17 Sep 2026 06:02:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789624973;
	bh=7bSiMSCEzJHVGbF2y5IbvpKJPc+IlGdFpPiZbAoOXa8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=g5q4ADcsvZP0IaR+4h0/O4Bnwpuza5aJe2t59YQy47ERg6k2tOsWYvodfwRTexJsS
	 gOAv63NAZfokKAlSgvb20h6aQTFer1aglYrF0Zd4mySk8m9nzgaL4LtgKBNlO1JUpf
	 EPf/GZur54xNXCMqCA2KX7kpXEIBGila6bdF7F2dwBKOfVyoQp8OF+0QNfZ0xV6vo8
	 ZZw3A8eve50hwOQPzF0Yszt7N2OHsvyAAhBax/YKhUfrzG/7b5OPLlUkpcy88XR5U3
	 9W2aYr5x4a6CEoLVXxQszIhb665HhO0Pg9+TD+iHIHL/MUsuo0XI75RIYE4IcvlDPI
	 f0nREJc/XgUOw==
Message-ID: <05189f26-1d24-47a7-abef-ea4c25d2964f@kernel.org>
Date: Thu, 17 Sep 2026 08:02:46 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 3/6] media: dt-bindings: Add Amlogic V4L2 video decoder
To: Zhentao Guo <zhentao.guo@amlogic.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org
References: <20260914-b4-s4-vdec-upstream-v9-0-72fdb0d71b02@amlogic.com>
 <20260914-b4-s4-vdec-upstream-v9-3-72fdb0d71b02@amlogic.com>
 <20260916-fat-enthusiastic-termite-44b2e2@quoll>
 <37bbcf5c-644a-4388-ba8b-11608f444ae3@amlogic.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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
In-Reply-To: <37bbcf5c-644a-4388-ba8b-11608f444ae3@amlogic.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 17/09/2026 05:07, Zhentao Guo wrote:
> Hi Krzysztof,
> 
>> On Mon, Sep 14, 2026 at 04:10:20PM +0800, Zhentao Guo wrote:
>>> Describe the initial support for the V4L2 stateless video decoder
>>> driver used with the Amlogic S4 (S805X2) platform.
>> Drop driver. Describe the hardware instead.
> OK，got it.
>>> Signed-off-by: Zhentao Guo <zhentao.guo@amlogic.com>
>>> ---
>>>   .../devicetree/bindings/media/amlogic,s4-vdec.yaml | 114 +++++++++++++++++++++
>>>   1 file changed, 114 insertions(+)
>>>
>>> diff --git a/Documentation/devicetree/bindings/media/amlogic,s4-vdec.yaml b/Documentation/devicetree/bindings/media/amlogic,s4-vdec.yaml
>>> new file mode 100644
>>> index 000000000000..d350b3e68a38
>>> --- /dev/null
>>> +++ b/Documentation/devicetree/bindings/media/amlogic,s4-vdec.yaml
>>> @@ -0,0 +1,114 @@
>>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>>> +# Copyright (C) 2025 Amlogic, Inc. All rights reserved
>>> +%YAML 1.2
>>> +---
>>> +$id: http://devicetree.org/schemas/media/amlogic,s4-vdec.yaml#
>>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>>> +
>>> +title: Amlogic Video Decode Accelerator
>>> +
>>> +maintainers:
>>> +  - Zhentao Guo <zhentao.guo@amlogic.com>
>>> +
>>> +description:
>>> +  The Video Decoder Accelerator present on Amlogic SOCs.
>>> +  It supports stateless h264 decoding.
>>> +
>>> +properties:
>>> +  compatible:
>>> +    const: amlogic,s4-vdec
>>> +
>>> +  reg:
>>> +    maxItems: 2
>>> +
>>> +  reg-names:
>>> +    items:
>>> +      - const: dos
>>> +      - const: dmc
>>> +
>>> +  interrupts:
>>> +    maxItems: 2
>>> +
>>> +  interrupt-names:
>>> +    items:
>>> +      - const: core_hvdec
>>> +      - const: core_vdec
>> Drop "core_" from both... or rather some consistency would be more
>> useful. Below you call them core_v and core_h, but there is also:
>>
>>> +
>>> +  clocks:
>>> +    items:
>>> +      - description: Clock for dos core
>> core dos?
> 
> To explain this, I would like to show you the structure diagram of the 
> Amlogic hardware decoder IP:
> 
> +-----------+------------------------+
> |           |                        |
> |           |        vdec            |
> |           |                        |
> |    dos    +------------------------+
> |           |                        |
> |           |        hvdec           |
> |           |                        |
> +-----------+------------------------+
> 
> The IP consists of three cores. Dos core is in the front of the IP, 
> which controls the rest two cores. The actual hardware decoding is 
> handled by the two cores vdec and hvdec.
> 
> Each of the three cores has its own independent clock source.

So everything could be called consistently "dos", "vdec" and "hvdec" in
all properties (clocks, interrupts etC).

Best regards,
Krzysztof
