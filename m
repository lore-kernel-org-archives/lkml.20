Received: from mx.nabladev.com (mx.nabladev.com [178.251.229.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAA36220687;
	Tue,  1 Sep 2026 11:53:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.251.229.89
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788263640; cv=none; b=oSaMLx8s7JnnSA/jcarUkBQCsmgRpjrNu1JWTehT6XW/2XDAw/trXdLJG3TGPj/1+b8bVtWQ5TzEH4b8r4ri7+5EDjRO34sJ9r7WntwokUw9jGiUS7CtmNnLUcFSN91hg5JvWNvqEuzFy7nzufiZLgextD44lOPFfaJI58jX0BE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788263640; c=relaxed/simple;
	bh=xmJZ/mShlQC/J2zci2a1aCYzI93Zew2RrN4CmfcvQEg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EDnpXqISvlmzNPhhdx2pk6HR+hpNuv/7t4xC4cdDYEW9+9BUJurhLYihSKI/fXn5Jrx7ANbYvTkC+3J5Fwr4yQHaFRIpShwQk7QQzFvOUYxbtHrdC+2beoQ3HYqok+at5i4REVJ5BnQd0uSp6meoNClf7INXAw8yU8lEzKLMLpU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nabladev.com; spf=pass smtp.mailfrom=nabladev.com; dkim=pass (2048-bit key) header.d=nabladev.com header.i=@nabladev.com header.b=S5nmsS61; arc=none smtp.client-ip=178.251.229.89
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nabladev.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nabladev.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nabladev.com header.i=@nabladev.com header.b="S5nmsS61"
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id C673911C2CB;
	Tue, 01 Sep 2026 13:53:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
	s=dkim; t=1788263632;
	h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=wTlH2NBlwIO3VYPYi8tEIfLnOFWhkadxiZvBE2R/S4o=;
	b=S5nmsS61xcu7YNgBme+JkN6P9uxe7dMh1g2OBEEFx+SOQH9j5jLOpT4TkU38fTSdGC0RQS
	jULLSUIK7UOrwLI/Kd6efpZrOIcuuYhyrigkcJw6tkv7deB6hgHWtl2hZGwnNC0jwXc8hL
	OOroxkb+8z9uj0Y7O6yZd8pILU8qZha2RPjcs3vKcCaA3zUbJF8kEAVAmpYrlU6gsO9J3d
	dkHE/ed0KCu1UiHkqQfHZAQKC6D94IlhCgD3cNVLz10kAvD1JKLwjAtx3+z4/1dfIn92tL
	0eLivBTc/A7fG58GuVI8rzGqBKQhRrgwNwhiqe5qGjkV8sPyHEjVLal8bLdP0w==
Message-ID: <6d9d37d1-1f9e-4533-bfab-5a070c444a4a@nabladev.com>
Date: Tue, 1 Sep 2026 13:53:49 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/2] dt-bindings: arm: stm32: Document
 st,stm32mp23/25-syscfg subnodes and cells
To: Conor Dooley <conor@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Christophe Roullier <christophe.roullier@foss.st.com>,
 Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>,
 Rob Herring <robh@kernel.org>, Yannick Fertre <yannick.fertre@foss.st.com>,
 devicetree@vger.kernel.org, kernel@dh-electronics.com,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com
References: <20260828151216.175020-1-marex@nabladev.com>
 <20260828-target-operable-ebc87e0bf30a@spud>
 <0f959651-34d9-4fb2-9e07-238f731c5342@nabladev.com>
 <20260831-clustered-margarine-80bf19005aad@spud>
 <2b09012a-3cae-4589-b42d-f61d33f2f876@nabladev.com>
 <20260831-craftily-operative-ac855bdbe897@spud>
 <2b11d8a8-9f4e-4032-bb41-279e16c69424@nabladev.com>
 <20260831-attentive-headpiece-c14d7d4086cb@spud>
Content-Language: en-US
From: Marek Vasut <marex@nabladev.com>
In-Reply-To: <20260831-attentive-headpiece-c14d7d4086cb@spud>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3

On 8/31/26 9:56 PM, Conor Dooley wrote:
> On Mon, Aug 31, 2026 at 07:38:21PM +0200, Marek Vasut wrote:
>> On 8/31/26 7:13 PM, Conor Dooley wrote:
>>
>> Hello Conor,
>>
>>>>>>>>          then:
>>>>>>>>            required:
>>>>>>>>              - "#clock-cells"
>>>>>>>> +        - "#address-cells"
>>>>>>>> +        - "#size-cells"
>>>>>>>
>>>>>>> else, false? But I'm also not sure what the benefit is of requiring
>>>>>>> addr/size cells when the child node is not?
>>>>>> The subnodes of this syscfg node have reg property , see [PATCH v4 0/4]
>>>>>> arm64: dts: st: Add STM32MP2 USB support .
>>>>>
>>>>> Right, but I was questioning why the properties describing the reg
>>>>> property in children is required when the children (and thus the reg
>>>>> property in them) were not made required.
>>>>
>>>> Do you mean this patternProperties should be made required in here ?
>>>>
>>>> "
>>>> +patternProperties:
>>>> +  "^phy@[0-9a-f]+$":
>>>> "
>>>>
>>>> Could you please give me a hint how to do that ? git grep gives me nothing.
>>>
>>> I mean, if the phys aren't going to be required I would not make the
>>> cells properties required. I seem to recall a warning that dtbs_check
>>> can emit when there are size/addr cells properties in a node where there
>>> are no children, which is why I questioned this in the first place.
>>>
>>> Otherwise, if the phys are to be made required (no idea if they should
>>> be), I can only recall this being done with the non-pattern variant. IOW
>>> required:
>>>     - phy@0
>>>     - phy@1
>> The PHYs are part of the hardware and are (going to be) described in the SoC
>> DT, so I would argue they should be described as required ?
> 
> Yeah, and there's almost certainly no chance of them being required
> being problematic is there, since they don't impact existing code, but
> have a new (or at least a previously unused on this platform) driver.

I fixed that in V5, which I already sent yesterday.

Thank you for your help with this topic.
