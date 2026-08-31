Received: from mx.nabladev.com (mx.nabladev.com [178.251.229.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C3B243933A;
	Mon, 31 Aug 2026 17:38:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.251.229.89
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788197913; cv=none; b=jRoTQA/1cQOG02pAdpaxLLQ+aBLBTsSbl3XRMt4euM2xsr/eusto9eM92PG7++v03Ev+DdrU1lRQYq3kIbJr+WCJPmYVbUe5maJ4q+mAc+2ibTtBXNoVBdxtV2N68U/6Spal2rEmnEz5LCiIr/N2s3a9+4RMTNHTle0mUzJzsvw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788197913; c=relaxed/simple;
	bh=S06L5y/4pqPPlaTWiOCyjdudTfx0L4w11fPBVdVg7pI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OmpmnxJ0Ta+8F8Sy+V15wXjS9PhvfTwtw6lWoARq8G7tzBmEGVfeFDHmdBGVHWMKhfNG3PR/r8Xo21ZH04zg8pCzpwoIpOxd3Q3iwqxDIPYO2YzBroCXw+JpWAqI6vqc6hK5j3x00CFIeY9eque/GaIJ/t6SM53hinnVK05C7fM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nabladev.com; spf=pass smtp.mailfrom=nabladev.com; dkim=pass (2048-bit key) header.d=nabladev.com header.i=@nabladev.com header.b=HGAt2tmA; arc=none smtp.client-ip=178.251.229.89
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nabladev.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nabladev.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nabladev.com header.i=@nabladev.com header.b="HGAt2tmA"
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 114D811C163;
	Mon, 31 Aug 2026 19:38:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
	s=dkim; t=1788197905;
	h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=l4IUfO6h9mR1fFTAYnECd9t+Cc7IsYQ4Tf/BvHAKE3Y=;
	b=HGAt2tmAYNlO5XCLvWy/gUf6NSID0r1oiv9CuZUf7LmP6xClMqEGilbl6ewiU0SvYeLNHG
	Yx3fOcjkWNSX7E7Yy4tmKGCzItfnQNUJ1pvS7eQK0uNLY5kqjdbSE1Ume3/8wq9g74ZAac
	3uQWUEhaioaZ7TtBP12uBiIPuk3afMfIwYO9uQ9NrIGND2hIMJhRpPDLmzgVBL3gAwD0vp
	vcmy9cK/PIiAZoONdk5lb3HlsDiVI3AZZ4gEAr40B43mikCaeZg8WQBBw9XeKbjarRZHE1
	uRXCXChMleqyV5WZHOaW8iI3j/nVbHk5zCFYc/RggjtlwccswAziI7hxyDVcow==
Message-ID: <2b11d8a8-9f4e-4032-bb41-279e16c69424@nabladev.com>
Date: Mon, 31 Aug 2026 19:38:21 +0200
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
Content-Language: en-US
From: Marek Vasut <marex@nabladev.com>
In-Reply-To: <20260831-craftily-operative-ac855bdbe897@spud>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3

On 8/31/26 7:13 PM, Conor Dooley wrote:

Hello Conor,

>>>>>>         then:
>>>>>>           required:
>>>>>>             - "#clock-cells"
>>>>>> +        - "#address-cells"
>>>>>> +        - "#size-cells"
>>>>>
>>>>> else, false? But I'm also not sure what the benefit is of requiring
>>>>> addr/size cells when the child node is not?
>>>> The subnodes of this syscfg node have reg property , see [PATCH v4 0/4]
>>>> arm64: dts: st: Add STM32MP2 USB support .
>>>
>>> Right, but I was questioning why the properties describing the reg
>>> property in children is required when the children (and thus the reg
>>> property in them) were not made required.
>>
>> Do you mean this patternProperties should be made required in here ?
>>
>> "
>> +patternProperties:
>> +  "^phy@[0-9a-f]+$":
>> "
>>
>> Could you please give me a hint how to do that ? git grep gives me nothing.
> 
> I mean, if the phys aren't going to be required I would not make the
> cells properties required. I seem to recall a warning that dtbs_check
> can emit when there are size/addr cells properties in a node where there
> are no children, which is why I questioned this in the first place.
> 
> Otherwise, if the phys are to be made required (no idea if they should
> be), I can only recall this being done with the non-pattern variant. IOW
> required:
>    - phy@0
>    - phy@1
The PHYs are part of the hardware and are (going to be) described in the 
SoC DT, so I would argue they should be described as required ?

Thank you for your help with this !
