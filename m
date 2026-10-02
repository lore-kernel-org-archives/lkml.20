Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B94E47044A;
	Fri,  2 Oct 2026 10:00:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790935237; cv=none; b=RtkH+y7wKupnciiyZe9+oICiBTIlY5QSrgUrnNmy49yOp40ZVodruaBEbM57Wj9vclezsUxmLA5F3C61OLd6S3jzRBuwPMLkga9uqpeHRIgsy67CWsZGl7EwEjbW9oPmDjJ7ZMse1l4jXG9LF3gx+UODq37fr2URneG9alGUEvY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790935237; c=relaxed/simple;
	bh=m9UQLqusrsbuB00CgLgByBupxlrqztiOZKNj6vHxlrQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HDr+o97H8ln6l1ZMxsz1uOF+yKSoYafaF0yG5ZnwYx/bE4ehKqs5HmCEqP+5D/zq87o7UTmZHT+GfDb/F1pn+qDog1CAUtcRbIlQ40mAorcQgQVRhzNxPGxYSkt+ahdKhB1HY7XsHSW/1+9klooQZ4t/CwtlZIvo46rsl2jMtPU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RWPjbqIW; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RWPjbqIW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 85C351F000FF;
	Fri,  2 Oct 2026 10:00:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790935236;
	bh=Zv+Yzqx6DsdGSD2oFM8VT12PHEpzSkVT9TOCD+GZP2k=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=RWPjbqIWjAu2zsKH644XlYKCB/5zP2d+eyVa9bodekD3uk2rLdVH6tt8lzHeMq38o
	 ENn2x7jo/HkcI0K5NIcAihVD6QbLqBd5wXG0m4508G1xAZ8zqtzIRGYSnefFL4VOPG
	 FzhNlttZFd5O3qP/+NxlcB2WS8X5zSI1dZKzMszMiSgcODKj9oOVn9ASWNozgAiGif
	 SrMMYBejgB85ZTyF1lSBPkY/PesxPw6iRcDgmttgTXMtJq6djjtLvkTAxQWCHSZ0la
	 3E6arBxmnhjWA8jle1iCe4ii42waa4XVlD27m4TYenHN+C89nk70DCpILK/5T1Yu+O
	 Fl41LZcTWAftQ==
Message-ID: <e8ce0c1c-32b2-4785-a3a7-99340c55d5f4@kernel.org>
Date: Fri, 2 Oct 2026 12:00:29 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/6] dt-bindings: arm: keystone: ti,sci: Update nodename
 pattern
To: "Padhi, Beleswar" <b-padhi@ti.com>
Cc: nm@ti.com, kristo@kernel.org, ssantosh@kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 afd@ti.com, u-kumar1@ti.com, vigneshr@ti.com, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, devicetree@vger.kernel.org
References: <20260930194131.117129-1-b-padhi@ti.com>
 <20260930194131.117129-2-b-padhi@ti.com>
 <20261002-rugged-nondescript-cheetah-8caa9b@quoll>
 <73326965-527b-4de7-85f6-ce3b458c0401@ti.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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
In-Reply-To: <73326965-527b-4de7-85f6-ce3b458c0401@ti.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 02/10/2026 11:56, Padhi, Beleswar wrote:
> 
> On 10/2/2026 11:57 AM, Krzysztof Kozlowski wrote:
>> On Thu, Oct 01, 2026 at 01:11:26AM +0530, Beleswar Padhi wrote:
>>> The $nodename pattern for TI-SCI controllers mandates specifying a unit
>>> address, which in turn requires a 'reg' property. This 'reg' is only
>>> used to describe an optional memory-mapped debug-messages region.
>>>
>>> Some controllers may not implement this debug region, so it has no 'reg'
>> Which ones?
> 
> 
> TDA54 PDM System Controller. I will add this in the commit message
> in patch revision.

There is no such:
git grep -i TDA54

Please organize your patches correctly. This change makes no sense alone.

> 
>>
>>> and unit address. Therefore, relax the $nodename pattern to allow the
>>> unit address to be omitted for such controllers. Keep the unit address
>>> mandatory for the existing ti,k2g-sci and ti,am654-sci controllers.
>>>
>>> Signed-off-by: Beleswar Padhi <b-padhi@ti.com>
>>> ---
>>> Note: This patch is independent can be applied directly.
>>>
>>> Cc: Nishanth Menon <nm@ti.com>
>>> Cc: Tero Kristo <kristo@kernel.org>
>>> Cc: Santosh Shilimkar <ssantosh@kernel.org>
>>> Cc: Rob Herring <robh@kernel.org>
>>> Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
>>> Cc: Conor Dooley <conor+dt@kernel.org>
>>> Cc: linux-arm-kernel@lists.infradead.org
>>> Cc: devicetree@vger.kernel.org
>>> Cc: linux-kernel@vger.kernel.org
>>>
>>>   .../devicetree/bindings/arm/keystone/ti,sci.yaml  | 15 ++++++++++++++-
>>>   1 file changed, 14 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/Documentation/devicetree/bindings/arm/keystone/ti,sci.yaml b/Documentation/devicetree/bindings/arm/keystone/ti,sci.yaml
>>> index 25a2b42105e54..67acce8a559a1 100644
>>> --- a/Documentation/devicetree/bindings/arm/keystone/ti,sci.yaml
>>> +++ b/Documentation/devicetree/bindings/arm/keystone/ti,sci.yaml
>>> @@ -30,7 +30,7 @@ description: |
>>>   
>>>   properties:
>>>     $nodename:
>>> -    pattern: "^system-controller@[0-9a-f]+$"
>>> +    pattern: "^system-controller(@[0-9a-f]+)?$"
>>>   
>>>     compatible:
>>>       oneOf:
>>> @@ -84,6 +84,19 @@ required:
>>>     - mbox-names
>>>     - mboxes
>>>   
>>> +allOf:
>>> +  - if:
>>> +      properties:
>>> +        compatible:
>>> +          contains:
>>> +            enum:
>>> +              - ti,k2g-sci
>>> +              - ti,am654-sci
>>> +    then:
>>> +      properties:
>>> +        $nodename:
>>> +          pattern: "^system-controller@[0-9a-f]+$"
>> Drop, not worth complexity.
> 
> 
> Why? We want to make sure dt_binding_check catches system controller
> nodes which have a debug region but omit the unit address.

As explained many times, individual device schemas are not supposed to
enforce names.

Best regards,
Krzysztof
