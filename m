Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6829F3F105D;
	Thu, 27 Aug 2026 21:26:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787865985; cv=none; b=hlIw6wYAynpgvXZj6GT2KOnhwJnYYnb95LGA5jMag11SzDWBIR1lxfoCVfvGJXYYLvqTpt/7zAX1GD+hatVneRuDTpBFL93ANov3aqR6Q54O+FX1tpReuEW6rQ3pAk08npcAGzBx10j+PArFzqKVfOSvuFLk/QjAu1V8so9uF18=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787865985; c=relaxed/simple;
	bh=/TGNR/VRuLfaEEcj5Ib0NuMQgbaw/aSIid5PvwIQWbI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QCqBQ2FKOihs6c4fIJiAA4P6aVGofWT2xqD+8aezSfMHRFIP3NEdveVM9kjXJPEkCivs1nsnAJ/2LXbLOehRQM9iDAdiY6mniGODgD2vZRSy2rllt/zhcJ0Eww5iN/5MFa7EQ+gnFnz7Z3tVE3bzzrkNNyonkiQhM4BCtdl/arI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HreL+XwS; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HreL+XwS"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6FF211F000E9;
	Thu, 27 Aug 2026 21:26:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787865980;
	bh=5F+WGCC79kxIPTjWWeDjo4oecMi9lsR/vM/DFzsdBTk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=HreL+XwSaP2GYDFVBa3V3Dm/yCXoo9IDdYq/jaVqruw/MWZaCwjFpVi9zKkqsviaD
	 UYno1u7+rQOxEe6UVQk9Q/UKLjnTsCha8E2A8dKSGu6ksDrN5eIhAXm1I1iOMvMSU+
	 ZeMaqWG5sjR5yDOP/dV5MrC+5tQonwJCkPXVFAyP/dOm9jr1YhC8Z9b4b7CiNoPY7n
	 kmGyhxI4bGIqfH19f72szvo7J5Q9jjbs+d0MVTyTY5A21qWLTc3Ed3WdyXNFewNbPk
	 VjERcT48KnnL7zQ3DBvITmjN8rJXAK5yQzpLeOhTRtYxU61hDZRPwSRQaY4kKsy+2i
	 1piT+wN6ilxpg==
Message-ID: <fb86b050-c03a-483f-a4c8-cb71d8b2adac@kernel.org>
Date: Thu, 27 Aug 2026 23:26:12 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/2] ASoC: dt-bindings: cs35l45: Adds SYNC properties
To: Ricardo Rivera-Matos <rriveram@opensource.cirrus.com>,
 David Rhodes <david.rhodes@cirrus.com>,
 Richard Fitzgerald <rf@opensource.cirrus.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, patches@opensource.cirrus.com,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260821-sound-for-next-cs35l45-sync-v4-v4-0-20d3a07c3b8d@opensource.cirrus.com>
 <20260821-sound-for-next-cs35l45-sync-v4-v4-1-20d3a07c3b8d@opensource.cirrus.com>
 <12761d4c-3f06-43ac-9f22-5d13e95e935e@kernel.org>
 <6f621efb-c7ba-45e4-a700-45844b89b8ef@opensource.cirrus.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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
In-Reply-To: <6f621efb-c7ba-45e4-a700-45844b89b8ef@opensource.cirrus.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 27/08/2026 22:07, Ricardo Rivera-Matos wrote:
> 
> 
> On 8/27/26 7:31 AM, Krzysztof Kozlowski wrote:
>> On 22/08/2026 00:41, Ricardo Rivera-Matos wrote:
>>> Introduces support for the multidevice synchronization (SYNC)
>>> bus. The properties introduced allow for the configuration
>>> of the device's transmitter IDs.
>>>
>>> Signed-off-by: Ricardo Rivera-Matos <rriveram@opensource.cirrus.com>
>>> ---
>>>   .../devicetree/bindings/sound/cirrus,cs35l45.yaml  | 27 ++++++++++++++++++++++
>>>   1 file changed, 27 insertions(+)
>>>
>>> diff --git a/Documentation/devicetree/bindings/sound/cirrus,cs35l45.yaml b/Documentation/devicetree/bindings/sound/cirrus,cs35l45.yaml
>>> index 70f6c62aedca..20d758dc442f 100644
>>> --- a/Documentation/devicetree/bindings/sound/cirrus,cs35l45.yaml
>>> +++ b/Documentation/devicetree/bindings/sound/cirrus,cs35l45.yaml
>>> @@ -53,6 +53,29 @@ properties:
>>>       maximum: 3
>>>       default: 2
>>>   
>>> +  sync:
>>
>> Same comment. You did not respond to Sashiko report because "it
>> contradicts itself" is pointless. It did not... unless you meant
>> irrelevant part about example. But that is just irrelevant to the binding.
> 
> I will explain the contradiction again. Pay close attention to the word bus.
> 
> Sashiko says "This commit introduces support for the multidevice 
> synchronization (SYNC) bus".
> 
> Sashiko and I agree, it is a bus.
> 
> Sashiko then complains "Is it necessary to use a child node here just to 
> group configuration properties? In Device Tree design, child nodes 
> usually represent distinct hardware components, sub-devices, buses, or 
> standardized structural elements rather than serving as logical folders 
> to group related configuration properties."
> 
> I am confused, do buses merit a child node or not? This is a 
> contradiction without additional context. Do certain kinds of buses get 
> child nodes and others do not?
> 
> Sashiko is an automated review tool that is being ambiguous. I need a 
> human maintainer decision made here. Does a bus merit a child node, yes 
> or no?
> 

I understand now your judgment.

Skipping then whatever Sashiko invented, I do not see there a bus
represented by that "sync" node. Bus in DT comes with children, thus
sync would have children. Or your DEVICE is a bus, then sync would be a
child of that bus.

But your description clearly says it is not a bus. It is a "bus
configuration". Configuration is not a bus and configuration does not
receive separate device nodes.

Best regards,
Krzysztof
