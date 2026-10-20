Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792475490;
	b=CEaJ7CYP+M9+6DQDkrNBYfvjjNOh/epEFOgs/s0aUroAbeflAF9mMjKsa+mrqBIldlGy
	 xnNsHsM5PkUfmOnXdWNuxZKa78vXj+VaYmj3CPmkM/shc2pUzPWD96HM8+9GB9Q/NonIM
	 NSm+JnGmTMrSJOa2VZzgl5wQQ24OWaWjWjCM5Q6jII+N3gmBCGUv47TKQsD+VRD1uHvE+
	 26vuJ1s6c1lsDU9JlOYJWtY0+du5QEFXklYPb1Twb/hJC7RjRPcXsY5w+ZBTiQCJYmkPY
	 vQ2VvnKPS5Esf7wEqQ7h3cH8cEE0IMB0rDGGcQHRpSfagZXKjZQVPm6dLaG+YvIp8jQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792475490;
	h=Received:DKIM-Signature:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:From:Content-Language:Autocrypt:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=zaYBirqJlNFDhtYAAgAIyKmleW4oIeh64C/jr9gyqY8=;
	b=sW+SsNt4pBcjgfzygca1Fy+kQ66J3P/1AV1p5YqAwj4PPiY0v7IXeAum11mWChiBp6e/
	 6p8MoYck7bEmH8xC1eNmCj5ylDMMN4lJ3OyFeA9vKWkGIPFgtyGr5ph33GqRc4PKsBswX
	 ocyNu8lYFRiAdPdK+ZQ0PTYyRTyV4dJfAiYaQPbdr1+fEqPIrywk+t0TZzBX43qZLOvmr
	 G71e8l18pOgEopJJobVqOws9oRGeTJJtd6cVnU3UZDPcLD8k5TjEaoFVZd5hLhopGEkia
	 50Rtb75bGERZg9+rBBLaxtMl3oBE+nblq0jI7WsToA3fXxTbjmVQZxooBhUj0ERNYFQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="BqazRWI/";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D6C5606A319;
	Tue, 20 Oct 2026 05:51:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=BqazRWI/
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 362F41F000C4;
	Tue, 20 Oct 2026 05:51:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792475490;
	bh=zaYBirqJlNFDhtYAAgAIyKmleW4oIeh64C/jr9gyqY8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=BqazRWI/99gjeaPDDsQq8NwfyYs8JIXl/7d5eH2+9GFwYgpQGLhn8E4AU2LuofPzJ
	 jqhgjFmoEPkUDiOZMvy6evFjCpVrVbDCCIPtTg/TBuMjDJrmAco+Ku/FksGklP3JnL
	 wTPw2DX/Fyrpz1s64jW+33oqxhVUvHTp70NtitRXpoNcN/eCQf8hmXTn7HV57hq8w7
	 DhTyC7e1r4d61gdMWmNZZ+4rV/YXkC0+HcZ3thehHqGpiaika1Gt+BDj4W5qGwmGk8
	 wXxzrfzZWNmN0tIRJmdYAZbLIFn++cNHV+Oeq9TMSpp6VDxZk50vRqkEoEVnSSNH6w
	 VA0tqZ67iUSCA==
Message-ID: <d6d7c3ba-5329-4c90-8994-ea29cedd7c53@kernel.org>
Date: Tue, 20 Oct 2026 07:51:23 +0200
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
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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
In-Reply-To: <b12ff328ebca405f96a9b25decdb7c81@realtek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 19/10/2026 13:19, Yu-Chun Lin [林祐君] wrote:
> Hi Krzysztof,
> 
>> On Mon, Oct 19, 2026 at 12:06:48AM +0800, Yu-Chun Lin wrote:
>>> Allow an interrupt controller as a child node by referencing the
>>> rtd1319-intc-iso schema, update additionalProperties to
>>> unevaluatedProperties, and append a usage example.
>>
>> I do not see that "update".
>>
> 
> Sorry about this. I updated the diff but missed updating the commit
> message. Will fix.
> 
>>>
>>> Signed-off-by: Yu-Chun Lin <eleanor.lin@realtek.com>
>>> ---
>>>  .../bindings/mfd/realtek,rtd1xxx.yaml         | 28
>> +++++++++++++++++++
>>>  1 file changed, 28 insertions(+)
>>>
>>> diff --git
>>> a/Documentation/devicetree/bindings/mfd/realtek,rtd1xxx.yaml
>>> b/Documentation/devicetree/bindings/mfd/realtek,rtd1xxx.yaml
>>> index 717e29c37b36..b21e14df2879 100644
>>> --- a/Documentation/devicetree/bindings/mfd/realtek,rtd1xxx.yaml
>>> +++ b/Documentation/devicetree/bindings/mfd/realtek,rtd1xxx.yaml
>>> @@ -65,6 +65,10 @@ properties:
>>>      const: 1
>>>
>>>  patternProperties:
>>> +  "^interrupt-controller":
>>> +    $ref: /schemas/interrupt-controller/realtek,rtd1319-intc-iso.yaml
>>> +    unevaluatedProperties: false
>>> +
>>>    '@[0-9a-f]+$':
>>>      type: object
>>
>> What is this for then? Should it be removed?
>>
> 
> The original syscon compatible has other child nodes that do have 'reg'
> properties and unit addresses, so this pattern is still needed for them.
> 
>>>
>>> @@ -76,3 +80,27 @@ required:
>>>    - reg
>>>
>>>  additionalProperties: false
>>> +
>>> +examples:
>>> +  - |
>>> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
>>> +    #include <dt-bindings/interrupt-controller/irq.h>
>>> +
>>> +    syscon@7000 {
>>> +        compatible = "realtek,rtd1625-iso", "syscon", "simple-mfd";
>>> +        reg = <0x7000 0x1000>;
>>> +        ranges = <0x0 0x7000 0x1000>;
>>> +        #address-cells = <1>;
>>> +        #size-cells = <1>;
>>
>> Why do you have cells it your child has no addressing?
>>
>>> +
>>> +        interrupt-controller {
>>
>> So the binding requires children with unit address, yes?
>>
> 
> The interrupt-controller does not need a unit address because it accesses
> the registers via the parent's regmap.

That's not really relevant. Child drivers still access via parent's
regmap and have unit address. This binding has bus addressing for
children, so use it. Do not add random or inconsistent code.

> 
> Will update the example to remove the unnecessary properties from the
> parent as follows:
> 
> syscon@7000 {
>     compatible = "realtek,rtd1625-iso", "syscon", "simple-mfd";
>     reg = <0x7000 0x1000>;
> 

Still incomplete. Where are other devices?


Best regards,
Krzysztof
