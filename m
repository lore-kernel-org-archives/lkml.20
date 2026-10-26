Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793007115;
	b=rvyPU/x8SnrSpQYekfaQoh1BdpShjzVfr9E9bRCf94qErAdJQyT+dQyiKxazTxUw8xqM
	 bxad0T7kb+PMEiIPQpEXEcVf1kXa92EAspynLfJK4ULaOw/M+g6t2o8SW0ZMMbQFg0xCH
	 MEJ9Xa/jRpC+0wJRrpUtOyN+3mU9p3+djzjXPLfbkF0guD9Ve2icGdw1pADWNmLK1mUEV
	 PdsLKXxCjS+OdeibaWMRjr9emvVRVvET+/5E5H7VFb+q0jFCgIVzqHBdxugxyoETvymRC
	 OyzFqLm8UxxzRxS7kaM2+NSgaaI6/4ChEBO6en2MwtmpNEqtiKCCmjOEaudcLfe/Rog==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793007115;
	h=Received:DKIM-Signature:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:From:To:Cc:References:Content-Language:Autocrypt:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=fTHiEsQJS5VYBz3EM1bA5RuDNtGEG5MQKrJP6RK0j7M=;
	b=1Wp5EGRlIQOe6846KNlv/zl2hjEih7EDNkc7IGTDr6QH2sEIAoM418yxZZnl8eLHX5k3
	 fw8kwUF3JKOVCGKceU0V7Y2Vkjw12TrS8/hKi9XqU9cWZQlzTLIsF3EH5+Nn+bXE1kII9
	 z9uKFxuGe4ci6FTZTptQXUV4HqreXQxWCVjmukAmAewKSNoKJG7CaDICtO/LdxEic8h52
	 GbEGBbzwxz6hmFyBDtBaDnf3HsYrg7eWK/+MpAkvDW/zLGuTyg9F9aR0eG1UGJqatHjsH
	 XQ48Jl1FeNIENdb2eH8zCb/3dtq6294W3WVuNI5h0F9YZEyqcPd+vY0NZwBGv9ypleQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=I2ITqUwV;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 827DA606A31A;
	Mon, 26 Oct 2026 09:31:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=I2ITqUwV
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 508B61F01825;
	Mon, 26 Oct 2026 09:31:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793007115;
	bh=fTHiEsQJS5VYBz3EM1bA5RuDNtGEG5MQKrJP6RK0j7M=;
	h=Date:Subject:From:To:Cc:References:In-Reply-To;
	b=I2ITqUwVfg8GjqCMCjq+3mJjbj6NU+OAQAJ83ZXHpa7YzCDT65BDCp21TR992rQyj
	 D2+OZne55iCMA7Ors5Tvn5gOvYNstmlix+QT02y97seXNw9PDJrmM05nU7Od0MJ4QZ
	 h/J3v2fSvYnenx1UCAFCm6mi2isfviv8RWe0dCkJJJlyYlrQclflkNvTI9l4SnoEO7
	 7YdLQ0uVXzcpiZZbDuZPWR3p3im4ryzG4a+8IUaBi3aMAnqfzN8JqBzHi4sEdfiUHR
	 yOjeYiwBk7T2ZW8F1Fc6SBTzSg1ksWs1EoCamm5aEKaQUISPCdmmHqkM0QMKS2gn8i
	 WvRhfG0jn1rmg==
Message-ID: <104e41a2-3451-4f7b-9723-3c05ceaa64af@kernel.org>
Date: Mon, 26 Oct 2026 10:31:51 +0100
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
Subject: Re: [PATCH 1/7] dt-bindings: mfd: x-powers,axp152: Add the AXP2101
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Olivier Louvignes <olivier@mgcrea.io>
Cc: Lee Jones <lee@kernel.org>, Chen-Yu Tsai <wens@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, mfd@lists.linux.dev,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261023100401.67592-1-olivier@mgcrea.io>
 <20261023100401.67592-2-olivier@mgcrea.io>
 <20261026-brawny-gleaming-grasshopper-813f7d@quoll>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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
In-Reply-To: <20261026-brawny-gleaming-grasshopper-813f7d@quoll>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 26/10/2026 10:30, Krzysztof Kozlowski wrote:
> On Fri, Oct 23, 2026 at 12:03:55PM +0200, Olivier Louvignes wrote:
>> The AXP2101's interrupt line is optional, as for the AXP313A and the
>> AXP15060: the driver then registers only the regulators. It has no DCDC
>> frequency setting.
>>
>> Signed-off-by: Olivier Louvignes <olivier@mgcrea.io>
>> ---
>>  Documentation/devicetree/bindings/mfd/x-powers,axp152.yaml | 3 +++
>>  1 file changed, 3 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/mfd/x-powers,axp152.yaml b/Documentation/devicetree/bindings/mfd/x-powers,axp152.yaml
>> index 45f015d63df1..f5e2c8232581 100644
>> --- a/Documentation/devicetree/bindings/mfd/x-powers,axp152.yaml
>> +++ b/Documentation/devicetree/bindings/mfd/x-powers,axp152.yaml
>> @@ -68,6 +68,7 @@ allOf:
>>            compatible:
>>              contains:
>>                enum:
>> +                - x-powers,axp2101
> 
> Why breaking the order? Keep natural sorted.
> 
>>                  - x-powers,axp15060
>>                  - x-powers,axp305
>>                  - x-powers,axp313a
>> @@ -84,6 +85,7 @@ allOf:
>>              enum:
>>                - x-powers,axp313a
>>                - x-powers,axp323
>> +              - x-powers,axp2101
> 
> Sorting is broken in original code but you placed it completely odd.
> Neither keeping sorting of 3xx variants nor, between 15060 and 717.
> What's the logic?
> 
>>                - x-powers,axp15060
>>                - x-powers,axp717
>>  
>> @@ -108,6 +110,7 @@ properties:
>>            - x-powers,axp806
>>            - x-powers,axp809
>>            - x-powers,axp813
>> +          - x-powers,axp2101
> 
> Placement of these entries makes no sense.

Ah, this one is actually sorted by natural sort.

Best regards,
Krzysztof
