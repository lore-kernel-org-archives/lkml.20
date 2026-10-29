Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793277770;
	b=jQg0JyCd8KAOzdGWlRcLy27lPt65P0lY3es704xFpvseiadeJaeuyMyUPnGDgAJDky6w
	 tlMfb68Fni8mG+r+L075rBjGTrounsReSEPhbE15BmVa87sMlOE63iT8g9nhcnMXaxs8H
	 ejBw0SWS2LnnGGZms61/uuGaCpLFG2hgeCelro08fJOQ2unl+EWpAmuoYPyji8IBrLf4y
	 d31f8N0nc0bw0bxngIsejRUHfa5z+DfywxYRaDvqJGPWya7Ea96xE6C+qRzJqJe/em60D
	 9T1/6vAkRZW1jlzlQwykktVX3Nyj2WiM5wekZpzXZZX7NIo3Yz+T5gYDJr4AtWRzkJQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793277770;
	h=Received:DKIM-Signature:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:From:Content-Language:Autocrypt:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=yFOj634Jz7fYTYLV7GgV7IxF9/v/cUlantY0GP2jAx8=;
	b=BbG65oGh3krX1PxH/L3ietm7Y2J3orgFlIfqSaA53YPpQY5cF+1zXlO9ugrUUNwuN/Oe
	 ThvV9wZwjMYL3e2zE6Pg1VO69QI0BVNqmUyQiQZUNIYz2/zr3drqpkXWS1gvo+OExtXZX
	 hiXC/MxPBUFn0ZEGZOVKy2PoqeVGZAE4gQ3moeXkH74FiHFETkLVk6h8QMYjvtW7oeO3k
	 fuHnR+RjdRZ4yPNSrD1L4auR6aBOteH0EAxnnQpPxmTALajSSnaW1y6zj2sCJq3RIKYez
	 5I6FX8PU0aPJDdkOY/xqF5mXapjoKeq5KVpbXrDjVvsHlukAFew07xkyRBMN63GjABQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=F9FHVAlJ;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D55D9606A321;
	Thu, 29 Oct 2026 12:42:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=F9FHVAlJ
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1A5161F01825;
	Thu, 29 Oct 2026 12:42:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793277769;
	bh=yFOj634Jz7fYTYLV7GgV7IxF9/v/cUlantY0GP2jAx8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=F9FHVAlJF5W6nQrz5Zp7T+4UqFwy/LnFhZlN4+PCWgBuxBYkUUamYGEOl2KZlJksf
	 uETpvM/8s1Y+xOl/wArz2bbVp++cEb/NvmywL69cPfQcxhZXNFcWTkyF5ZGNLoLEZx
	 RfPXAKrMJ8pYVgHvErMYNTyz9ZoMvQol+tFGLVEIPhTffW0dYN4wMno0IVNMwOAoCN
	 zfJKIvFlJed5cDO47jL6TDFNeeEaZkXHrxjEursWfIyEDK/dMY6v/HlzzvNn0dGeGe
	 RRGOfZ1mGKaWBMT/55+/JkwqSzLlX0loVQHU5wa/j8EqgavjI08gFhpb5Wyxj1PufG
	 dEityO+VX/52w==
Message-ID: <a4a57e41-4e1c-4c94-8b92-6b50f8321ee9@kernel.org>
Date: Thu, 29 Oct 2026 13:42:43 +0100
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
Subject: Re: [PATCH v2 1/4] regulator: dt-bindings: Add TI LM51772 support
To: Paul Louvel <paul.louvel@bootlin.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Herve Codina <herve.codina@bootlin.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>
References: <20261027-paul-lm51772-v2-0-b2a767e34722@bootlin.com>
 <20261027-paul-lm51772-v2-1-b2a767e34722@bootlin.com>
 <20261029-indefinable-bustard-of-ampleness-44abaf@quoll>
 <DMH7AO649J2M.2XFQNV3VXL6UP@bootlin.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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
In-Reply-To: <DMH7AO649J2M.2XFQNV3VXL6UP@bootlin.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 29/10/2026 10:05, Paul Louvel wrote:
> Hi Krzysztof,
> 
> On Thu Oct 29, 2026 at 9:41 AM CET, Krzysztof Kozlowski wrote:
>> On Tue, Oct 27, 2026 at 10:39:23AM +0100, Paul Louvel wrote:
>>> +          regulator-temp-warn-kelvin:
>>> +            enum: [0, 1, 368, 383, 398, 413]
>>> +
>>> +          regulator-ramp-delay:
>>> +            enum: [40000, 20000, 1000, 500]
>>> +
>>> +          regulator-min-microvolt:
>>> +            minimum: 1000000
>>> +            maximum: 48000000
>>> +
>>> +          regulator-max-microvolt:
>>> +            minimum: 1000000
>>> +            maximum: 48000000
>>> +
>>> +          regulator-min-microamp:
>>> +            minimum: 500000
>>> +            maximum: 7000000
>>> +
>>> +          regulator-max-microamp:
>>> +            minimum: 500000
>>> +            maximum: 7000000
>>> +
>>> +        unevaluatedProperties: false
>>
>> Place this line after description, that's the convention for child nodes
>> for readability.
>>
>>> +
>>> +      vcc1:
>>> +        type: object
>>> +        $ref: regulator.yaml#
>>> +        description: |
>>> +          LDO regulator for auxiliary use.
>>> +          It can used to power, for example, a PD controller that will drive this PMIC.
>>> +
>>> +        properties:
>>> +          regulator-min-microvolt:
>>> +            minimum: 5000000
>>> +            maximum: 5000000
>>> +
>>> +          regulator-max-microvolt:
>>> +            minimum: 5000000
>>> +            maximum: 5000000
>>> +
>>> +        unevaluatedProperties: false
>>
>> Place this line after description, that's the convention for child nodes
>> for readability.
>>
>>> +
>>> +    additionalProperties: false
>>
>> Place this line after description (for relevant block), that's the
>> convention for child nodes for readability.
>>
>>> +
>>> +  ti,sync-pin:
>>> +    description: |
>>> +      Selects the function of the SYNC pin, used when several converters
>>> +      operate in parallel.
>>> +    $ref: /schemas/types.yaml#/definitions/string
>>> +    enum: [input-rising, input-falling, output-rising, output-falling]
>>> +    default: input-rising
>>> +
>>> +  ti,ivp-thres-microvolt:
>>
>> Use either existing over-voltage-threshold-microvolt from battery schema
>> or ti,ovp-microvolt from the other TI binding.
> 
> IVP is not the same as OVP.

... because? OVP is overv-oltage protection, so ivp is not input
over-voltage protection?

Best regards,
Krzysztof
