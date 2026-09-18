Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CECAC4A0921;
	Fri, 18 Sep 2026 08:40:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789720819; cv=none; b=oynzi43jKcNxLWT/4Y91AuftYGuA4L8TXhm99O3app3EKt3xWFrWStBfAZN+pTBvvc8jw57yFo4kt5eoLEYC01bVs/vWa4BfRG2UyXimZyofyMhUtDRMZxmhzGNfdg7WhPDYWJlRXEL2U11VFjgHpR5U7ucnfLDjKIK/+zHpDzE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789720819; c=relaxed/simple;
	bh=/cN8uyQZ9nDnHW8G5wdiabquj0TfX4E7hMc2JFryRE4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WVgMP587gkqA3pgGCfMtlez6P7otSVo0iiyFPfw2EEJzQkhz5v760LrMbTtOFbTQ39unvxpBd90rupgHq1WerfczFr0T9DaZhmPsvz823dZxFAIzW7oOTj3V0zP4ElTX2nIL/ZgsxfzxVCKhY+GOQgWNQ2lDs5iyDl+EfCf7tf8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NbsGideP; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NbsGideP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A94751F000FF;
	Fri, 18 Sep 2026 08:40:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789720818;
	bh=gUKkL/xmF5f394jyQDECLCZfFEXGSwufYWfevSsRYy0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=NbsGidePkrOEfa1hkwsufe7o/scVFbF32GHeCoZVuyKYNLxpCAWwvIB1k+nJWMHTd
	 FMhRjiJnhSWFTMqF3wJfJty+HC2KTs+bXP9OFKkrbZvoU8InwXGO9LpyR3po/1uVNO
	 tyy3N2IVQWuuG4z2pjHcWd5pgD4sNO8QZksLlBBGbNqS0dDICDhp4FXKUpcNZHzkfK
	 DTec91szBuv97WarSiFKeSP0hWkXZcTSRropMi1PTDuiCRbdXppp7O8hLs2Bcniwh+
	 VK1g772ZrgqwoqXeSqyFMGccuQVb/Owu/iKCe0rI3x2nSFqEq8eDH4kno2EeTYtTd4
	 hsKaTXtLEOHpQ==
Message-ID: <0fd3e0a5-33f7-4bc6-9146-dcaf035c3ef5@kernel.org>
Date: Fri, 18 Sep 2026 10:40:11 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] dt-bindings: arm: qcom: Add Xiaomi Mi 8 family
 compatibles
To: David Heidelberg <david@ixit.cz>
Cc: Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Kees Cook <kees@kernel.org>,
 Tony Luck <tony.luck@intel.com>, "Guilherme G. Piccoli"
 <gpiccoli@igalia.com>, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 phone-devel@vger.kernel.org
References: <20260915-dipper-v2-0-cbade54919ee@ixit.cz>
 <20260915-dipper-v2-1-cbade54919ee@ixit.cz>
 <20260917-heavenly-weasel-of-criticism-1add6b@quoll>
 <b324f0b8-0875-457f-936c-89b858d082fa@ixit.cz>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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
In-Reply-To: <b324f0b8-0875-457f-936c-89b858d082fa@ixit.cz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 17/09/2026 12:25, David Heidelberg wrote:
> On 17/09/2026 12:21, Krzysztof Kozlowski wrote:
>> On Tue, Sep 15, 2026 at 04:32:24PM +0200, David Heidelberg wrote:
>>> +      - description: Xiaomi Mi 8 family
>>> +        items:
>>> +          - enum:
>>> +              - xiaomi,dipper
>>> +              - xiaomi,equuleus
>>> +              - xiaomi,ursa
>>> +          - const: xiaomi,dipper-common
>>
>> We do not make "common" compatibles.
>> git grep common -- Documentation/devicetree/bindings/arm/qcom.yaml
> 
> TBH I have mental issue with calling it xiaomi,dipper-dipper
> 
> All three devices are branded as own devices, just based on 99.9% same base.
> 
> I'm not aware of any internal name which group these devices.
> 
> I could call it like xiaomi,common, but there is the polaris and beryllium, 
> which aren't "that common" with these three.
> 
> Do you have idea what to do in this situation?

Just don't use "common" or "generic" or anything close to it, because it
confuses future contributors thinking "common" compatible is allowed.
It's not.

Except above, the actual names of compatibles are irrelevant, they just
need to uniquely identify the device. Personally, I would not use
nicknames at all for devices because they tell me nothing. Maybe they
tell to you because you read internal source code, but not to me.

And if you google for Xiaomi Dipper, you will find first forks of code,
so again not source information but derivative. Only fifth result is
gsmarena website, but weirdly it does not have even "dipper" text
mentioned. So basically using such names is counter productive to me,
confusing and bringing downstream - postmarketos or lineageos -
practices to upstream. Basically downstream forks create some codename
and you push it to the usptream. You can, but I don't find it useful.

I would use proper model names, e.g. "xiaomi,mi-8" for final
compatibles. Codename for family is fine, because simply there is no
product which we could identify as common base...


Best regards,
Krzysztof
