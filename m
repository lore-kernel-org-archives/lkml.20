Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794472592;
	b=128IClCkVL39VDBujPBYhyKycGn4B7c+G0tQgehn8PvBaNhCXW7vdWvI9lGqAsKVrkme
	 oyIgo7wRIDZEOyjFRl5mTVezFVWq9cVgvu2LZZ1p7kkKpY7lXFk5WoPgiuLagd2dbVpCG
	 7rkhR8RvBIJHuTmXjHXRwn3X4jXKCHIo0x7//uikogoAVw88S4ArJYTuklvzO6POx0HXx
	 dWRK/3vJ3tk49co0t8E1t8/lqC+VarS4Q97QMRyGerLL1hIvQKHELV4UhsFaJ48ihzFaE
	 ITT5juyZCg9AwPxQ/vVUGRWjTUdJxQQPxml4ZBkEqYdgPjWEOj6K+DUS78QV1u/PEdQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794472592;
	h=Received:DKIM-Signature:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:From:Content-Language:Autocrypt:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=I+sEPjXXQLeDN3SpqN0+DAeLGovC+TFrrKzlORkSB20=;
	b=SRP0FHXL4tvKdIaCsOX5WBDnRb2GVwiR6wl+INeYwtFQY2ENC43nQFPRwBwWQiwBD1+7
	 7FhPhPAlS8HVKj1Guv4lJSVLopggKk0WfvJoiGb8hk4PEScUYUqH3zED3gcYjjELmstGc
	 Rs1r8pifi1w/XYkXboOOb3e5bCucUHt1dOEQ3tOxl9f/l4RC7L6H2tPZwxk/wN2ZVOTgq
	 dnf31DeZ6lhCFhSuhaBXRW+pCrJQXtBBF7VPEFgQPQfTZWeWvSDAzm7POda/RtUL+avAB
	 ecwQN6NWJC7SZy7itJVkEmcu2Sk7gpL+e8vduFXv5grgz1wr/NvQ01p3HRWjNYvVONw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XQmdJMAW;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC2A3606D2EE;
	Thu, 12 Nov 2026 08:36:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XQmdJMAW
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7A8661F00A05;
	Thu, 12 Nov 2026 08:36:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794472592;
	bh=I+sEPjXXQLeDN3SpqN0+DAeLGovC+TFrrKzlORkSB20=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=XQmdJMAW7pfIMkIU6Q6ruhs5/uBhQKnm9chtrsMTBILm0E6rTejACCQfzMN1ZmfZx
	 N59M5lJKyl8Nwf6Mb07zHQKLSAnzDyWdCJp3stApnvo7yqsaNXhn/V+CO1Ua7JzrVk
	 gOTqepvRcWSKab+RPUH2BVPIdyxUooFX3V5jMkqORRWUN2WhcuQouTLvQdRiXSbWJF
	 gppQY17uIKyCbnCXWX3gQeec1busURWOcPhittwCpWwc93gWgTBw8hxFsN5h3Z8TSd
	 aNySMGUqsXeK9FmQh9vNuDt7AkrMmSfKmX8dSA7homAW86D9TgXuLK4oZWIO3xz+wq
	 FQAOrGitHzs0g==
Message-ID: <aace0569-b502-448e-acea-751381b47dd5@kernel.org>
Date: Thu, 12 Nov 2026 09:36:24 +0100
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
Subject: Re: [PATCH v2 08/28] dt-bindings: gpu: mali-gen5-am: Add Mali 5th-Gen
 AM schema
To: Karunika Choo <karunika.choo@arm.com>
Cc: dri-devel@lists.freedesktop.org, nd@arm.com,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 linux-kernel@vger.kernel.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org
References: <20261110153907.3241978-1-karunika.choo@arm.com>
 <20261110153907.3241978-9-karunika.choo@arm.com>
 <20261111-accelerated-pretty-spoonbill-0afdcc@quoll>
 <3a63f0dc-9939-4c9f-8050-303cdcaad2d5@arm.com>
 <05a92dfc-c74f-46a3-ba44-60f7ef1c1a54@kernel.org>
 <ede1710b-cc07-4201-8937-b8420259d512@arm.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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
In-Reply-To: <ede1710b-cc07-4201-8937-b8420259d512@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/11/2026 12:04, Karunika Choo wrote:
> On 11/11/2026 10:41, Krzysztof Kozlowski wrote:
>> On 11/11/2026 11:32, Karunika Choo wrote:
>>> On 11/11/2026 08:33, Krzysztof Kozlowski wrote:
>>>> On Tue, Nov 10, 2026 at 03:38:29PM +0000, Karunika Choo wrote:
>>>>> Add a separate device-tree schema for Mali 5th-Gen AM GPUs.
>>>>>
>>>>> AM_GOVERNOR controls GPU frequency. The GPU node does not accept OPP,
>>>>> cooling or GPU supply properties.
>>>>>
>>>>> Signed-off-by: Karunika Choo <karunika.choo@arm.com>
>>>>> ---
>>>>> v2:
>>>>> - Move arm,mali-gen5-am support from arm,mali-valhall-csf.yaml to a
>>>>>   separate arm,mali-gen5-am.yaml schema.
>>>>> - Move the AM GPU example to the new schema and add the interrupt
>>>>>   binding headers.
>>>>> - Add the new schema to the Panthor MAINTAINERS entry.
>>>>>
>>>>>  .../bindings/gpu/arm,mali-gen5-am.yaml        | 90 +++++++++++++++++++
>>>>>  MAINTAINERS                                   |  1 +
>>>>>  2 files changed, 91 insertions(+)
>>>>>  create mode 100644 Documentation/devicetree/bindings/gpu/arm,mali-gen5-am.yaml
>>>>>
>>>>> diff --git a/Documentation/devicetree/bindings/gpu/arm,mali-gen5-am.yaml b/Documentation/devicetree/bindings/gpu/arm,mali-gen5-am.yaml
>>>>> new file mode 100644
>>>>> index 0000000000000..6349888e1ae2a
>>>>> --- /dev/null
>>>>> +++ b/Documentation/devicetree/bindings/gpu/arm,mali-gen5-am.yaml
>>>>> @@ -0,0 +1,90 @@
>>>>> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
>>>>> +%YAML 1.2
>>>>> +---
>>>>> +$id: http://devicetree.org/schemas/gpu/arm,mali-gen5-am.yaml#
>>>>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>>>>> +
>>>>> +title: ARM Mali 5th Gen AM GPU
>>>>> +
>>>>> +maintainers:
>>>>> +  - Liviu Dudau <liviu.dudau@arm.com>
>>>>> +  - Boris Brezillon <boris.brezillon@collabora.com>
>>>>> +
>>>>> +properties:
>>>>> +  $nodename:
>>>>> +    pattern: '^gpu@[a-f0-9]+$'
>>>>
>>>> Same comments as last time.
>>>
>>> Sorry, do you mean that 'gpu' not generic enough?
>>
>> I asked to drop the node name completely.
>>
> 
> ah! Understood. Will do that in v3.
> 
>>>
>>>>> +
>>>>> +  compatible:
>>>>> +    const: arm,mali-gen5-am
>>>>
>>>> Same comments as last time. Seems like you just ignore review, so I will
>>>> finish here.
>>>>
>>>
>>> Hi, we are trying to provide initial support for v15. The vendor 
>>> identifiers will be added once there is an available device.
>>>
>>
>> So how can this initial support be run? Which board has it? I received
>> only three patches of entire thread, but if there was DTS I would be
>> cc-ed. I can't find such patch.
> 
> Apologies for the trouble. This was tested on internal FPGAs, but let
> me try to see if I can add a representative DTS for one of our publicly
> available FVP platforms in v3.

So it cannot run on its own, because internal FPGA is a not a complete
and final system. I assume you need some SoC integration, so you need a
front compatible. If it is unknown, then it has to be {} (see other
cases how we represented unknown integration).

Best regards,
Krzysztof
