Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792652043;
	b=tzYx9YDOCh5OvHo0vpi2gn90ndmYwC8s+g0hECaku1G6QGgWe4UCxRtg/h53OhlyT7PQ
	 GzhHUOx2Rklnk0AIljNZmy8Aic0SOIDp2wkot5owai5mXnydRK33w8EDNzzeYLyj3va3s
	 tG25FoamsrSptEN6miGtDU20AffIejqpiycx6tHSWl9GuPGsnCy0QslDhK/qL+qLwGTuY
	 dOHxpWi58MvT+xA56AABwujx5AgdheZStI+6wLXJSfKJivc8KRjHWi+ZA0dkZt1jzkyzi
	 Q0AyUsS+3YocxhxOnEIVsrKzJHVUHhvkWGkzOeY3IFxk/9YrfoBPr7x4kxNyhUqQcxA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792652043;
	h=Received:DKIM-Signature:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:From:Content-Language:Autocrypt:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=yxdirAwaKLgp/l+nW4jbh+UPJE1umgnL6ghCcQXcC3M=;
	b=1TYeZ/AyLPGGlXzqJnxIuhOVDPnpt+WUWBVf91v64NCUSUcsYWrh4TvIjprf7YZdprMm
	 H6NgRSkT4vKcddDpV9B/EeADVDP0kF5M4tTROKoDERHZkREn9MUTyixcVqcm+ocwG/34r
	 yJBmjmYoj9CMPMM1lKhJdUOMG97LbQRGv6XRLr0QWMCTfKUx2U6zITZykfWpORYltm7y3
	 /jIyZxVhJMcq90E3n9e2gnpUeviDleaUmi+0qVEBtxJGuAWpOAaqWgOdxI9GdegZCZ3i8
	 gkKHD1u/3MdnlvvG3gxMi89rFppK3BiI3Xvdoif4JpGww+0c6RtZW2IkQVdRaF0KvXg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KVw2Zcb1;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEB32606A319;
	Thu, 22 Oct 2026 06:54:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KVw2Zcb1
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 03CAB1F000C1;
	Thu, 22 Oct 2026 06:53:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792652042;
	bh=yxdirAwaKLgp/l+nW4jbh+UPJE1umgnL6ghCcQXcC3M=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=KVw2Zcb19Slr14Hr4y92oVxgyQ2NvXh97GXBNp4VW3ttD88hNXeWrXq75gsoKgdcn
	 sKUtPVJ41I5fSq5WHkeTHJxFg477E6Cf9EIW81FN89epDuSAZR0ryaqQKr7msKjOua
	 17NeQLD2Z5AbuMwKyo4etHyyF1kqUec9k+w8P9zwzgb4FXdMhLEn7RwS6XqaRT4e/c
	 C8WpdeaeCA0ZBWGPXpKGfRSIKyRda2cG/jZzn59ga8BQTmLEgcMhYigUC786gN9pk0
	 V7dj+aBEoAMzNoywkLBQLf/mxydzYCVX5bGmppVRtJeGGO7apXKMb1SDHaFSLbh4q5
	 vpRtlJS3fT1zw==
Message-ID: <936769c6-c8e7-4bf2-b300-b287088c31af@kernel.org>
Date: Thu, 22 Oct 2026 08:53:55 +0200
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
Subject: Re: [PATCH v5 3/8] dt-bindings: mfd: realtek,rtd1xxx: Add interrupt
 controller child node
To: =?UTF-8?B?WXUtQ2h1biBMaW4gW+ael+elkOWQm10=?= <eleanor.lin@realtek.com>
Cc: "tglx@kernel.org" <tglx@kernel.org>, "radu@rendec.net" <radu@rendec.net>,
 "robh@kernel.org" <robh@kernel.org>, "krzk+dt@kernel.org"
 <krzk+dt@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>,
 "lee@kernel.org" <lee@kernel.org>, "afaerber@suse.com" <afaerber@suse.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "mfd@lists.linux.dev" <mfd@lists.linux.dev>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "linux-realtek-soc@lists.infradead.org"
 <linux-realtek-soc@lists.infradead.org>,
 =?UTF-8?B?SmFtZXMgVGFpIFvmiLTlv5fls7Bd?= <james.tai@realtek.com>,
 =?UTF-8?B?Q1lfSHVhbmdb6buD6Ymm5pmPXQ==?= <cy.huang@realtek.com>,
 =?UTF-8?B?U3RhbmxleSBDaGFuZ1vmmIzogrLlvrdd?= <stanley_chang@realtek.com>
References: <20261018160653.3940371-1-eleanor.lin@realtek.com>
 <20261018160653.3940371-4-eleanor.lin@realtek.com>
 <20261019-prophetic-moth-of-youth-40dbd6@quoll>
 <b12ff328ebca405f96a9b25decdb7c81@realtek.com>
 <d6d7c3ba-5329-4c90-8994-ea29cedd7c53@kernel.org>
 <ef63cc3df2424f888ba807701af0ce84@realtek.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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
In-Reply-To: <ef63cc3df2424f888ba807701af0ce84@realtek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 22/10/2026 08:44, Yu-Chun Lin [林祐君] wrote:
> Hi Krzysztof,
> 
>>>>>  patternProperties:
>>>>> +  "^interrupt-controller":
>>>>> +    $ref: /schemas/interrupt-controller/realtek,rtd1319-intc-iso.yaml
>>>>> +    unevaluatedProperties: false
>>>>> +
>>>>>    '@[0-9a-f]+$':
>>>>>      type: object
>>>>
>>>> What is this for then? Should it be removed?
>>>>
>>>
>>> The original syscon compatible has other child nodes that do have 'reg'
>>> properties and unit addresses, so this pattern is still needed for them.
>>>
>>>>>
>>>>> @@ -76,3 +80,27 @@ required:
>>>>>    - reg
>>>>>
>>>>>  additionalProperties: false
>>>>> +
>>>>> +examples:
>>>>> +  - |
>>>>> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
>>>>> +    #include <dt-bindings/interrupt-controller/irq.h>
>>>>> +
>>>>> +    syscon@7000 {
>>>>> +        compatible = "realtek,rtd1625-iso", "syscon", "simple-mfd";
>>>>> +        reg = <0x7000 0x1000>;
>>>>> +        ranges = <0x0 0x7000 0x1000>;
>>>>> +        #address-cells = <1>;
>>>>> +        #size-cells = <1>;
>>>>
>>>> Why do you have cells it your child has no addressing?
>>>>
>>>>> +
>>>>> +        interrupt-controller {
>>>>
>>>> So the binding requires children with unit address, yes?
>>>>
>>>
>>> The interrupt-controller does not need a unit address because it
>>> accesses the registers via the parent's regmap.
>>
>> That's not really relevant. Child drivers still access via parent's regmap and
>> have unit address. This binding has bus addressing for children, so use it. Do
>> not add random or inconsistent code.
>>
> 
> The registers for interrupt controller are quite scattered within the parent
> syscon block. Take rtd1625-intc-misc as an example, the offsets are 0x4,
> 0xc, 0x80, and 0x88 After adding unit-address and reg.
> It would be like:
> 
> interrupt-controller@4 {
>     compatible = "realtek,rtd1625-intc-misc";
>     reg = <0x4 0x4>,
>           <0xc 0x4>,
>           <0x80 0x4>,
>           <0x88 0x4>;
>     interrupt-controller;

That would mean that this device is instead part of the parent. If you
do not have separate address space, how is it a separate device?

>     ...
> };
> 
> Could you please confirm if this is the correct and preferred approach?
> 
>>>
>>> Will update the example to remove the unnecessary properties from the
>>> parent as follows:
>>>
>>> syscon@7000 {
>>>     compatible = "realtek,rtd1625-iso", "syscon", "simple-mfd";
>>>     reg = <0x7000 0x1000>;
>>>
>>
>> Still incomplete. Where are other devices?
>>
> 
> In the past, Andreas used a generic '@[0-9a-f]+$"' to match child nodes.
> Because of this, in older SoCs (e.g., rtd129x.dtsi, rtd16xx.dtsi,
> rtd139x.dtsi), devices like reset-controller, watchdog, and serial were
> allowed and placed under the iso or misc syscon nodes.
> 
> However, I have some doubts about continuing to use that exact structure:
> 
> 1. We previously discussed and agreed [1] that devices like serial should
> actually be placed under rbus, not syscon.
> 2. For the SoCs introduced in this patch (rtd1319,rtd1319d, rtd1325,
> rtd1625), the drivers for the other child devices (like watchdog) are not
> upstreamed yet.
> 
> To properly fix the "incomplete example" for the simple-mfd structure,
> could you please advise:
> 
> 1. Should I replace the generic '@[0-9a-f]+$' in the YAML binding with
> explicit device definitions for these specific child nodes?
> 2. For the example section, should I just populate it with placeholders
> (e.g., watchdog) referencing Andreas's older DTs (like rtd129x.dtsi) to
> illustrate the MFD structure?
> 
> [1] https://lore.kernel.org/lkml/15951264289d44f797ebd4e05238b380@realtek.com/

If you know that existing pattern is not really correct, please do not
grow it.

Best regards,
Krzysztof
