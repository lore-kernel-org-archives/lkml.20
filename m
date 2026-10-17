Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F42C134CF;
	Sat, 17 Oct 2026 21:28:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792272521; cv=none; b=aMM9QpFhKDSKielv0eyIW11n9R+1YJtkSTdVpHaShiO3r032YCWfVYfB4dRILTUbQzO0SNPbWOGj0S5mCG1e5DueqoKRf5MXpxPg3Hh1fDNSmMa1BVBDdDojnWNfRvtCAO3L660G39/SBTIVPj+TfEbZxVElVpAeJX3mGRef8ag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792272521; c=relaxed/simple;
	bh=X+lKRu8sRWKE1hyitt1Q8JaNlh/A3yDu4gemrdN5gKc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dVmpTfv7OMy+uaCYbbzsH3lApaU/TcI7RBVUAlVv2Gq3/nxHyJzgKIMNXzX6++FknRNopIn3tsqpggIsE0jHyTwWsMpntSUfwrGmt4GkLz8eGZe3SHSj3VlxsPBB0hm32Pd0vCO7Hb2NQC3Jxt/KXameYhHbdtSr9iMAFR0AzH8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=I4D7HjH2; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="I4D7HjH2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D7EF21F000C4;
	Sat, 17 Oct 2026 21:28:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792272519;
	bh=q1BVkb5pmkK8UJqeVh978rmRoLp0JDE22LJYmcbLRJo=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=I4D7HjH2AS1v54dqU+OJHOXlhChdAc8jXe/P8Og6U6nQVeE34BjsxLv48T0qH4941
	 /W/qqdqljcF1RIXxxs/IHTwqEHv25tp8ze5se7acrAbdEknILi3RG1nf0PHnNgKttP
	 ZdI+n8SKuMzaQZIVbmmSanlHaImO2fSzrq4Oc9P0e0vlZlTbvpFOZDekHsz7Ev99hK
	 os8gGqBTu73sLleGMkSB1Z14voTmZIDADDNJUePfqdn0zAIChu/RU1fZhmVQDw2Y39
	 0XPm0KSxxU/aVI55uKsiTOT0lvBvyYAEej2dYXds6l6q1hyBY1taAsQalLfuefPcZj
	 wHy2zOrNLjuwA==
Message-ID: <e7c16b26-9525-4a54-8098-20148c8461a9@kernel.org>
Date: Sat, 17 Oct 2026 22:28:34 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dt-bindings: media: i2c: Add OmniVision OV13858
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: geocausa@gmail.com, Sakari Ailus <sakari.ailus@linux.intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Sergey Lebedev <lsa.uz@pm.me>,
 German Pablo Lindo <germanpapulindez@gmail.com>,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261015-ov13858-x1e-v1-0-acdd918f4fb6@gmail.com>
 <Tb0AcYbDPldfaB1S1ypqTPp6iFwxJVF_1Dh_7FJdavARv0U5KErpuPTQn6FNDYBoK206hZlqZHDsasGYmQx4zg==@protonmail.internalid>
 <20261015-ov13858-x1e-v1-1-acdd918f4fb6@gmail.com>
 <4359bff8-edb2-486a-8d41-38bd315a4430@kernel.org>
 <37my1V7zvAlADVEwmO3aSm1XZe6SLHeQnj8AYh3sVO_3mGc4_lWX-abstYbqLBYAZpvFXdbELWYmRoOF-HKavw==@protonmail.internalid>
 <20261017-successful-sturgeon-of-experiment-9d8caa@quoll>
From: Bryan O'Donoghue <bod@kernel.org>
Content-Language: en-GB
Autocrypt: addr=bod@kernel.org; keydata=
 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
In-Reply-To: <20261017-successful-sturgeon-of-experiment-9d8caa@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 17/10/2026 17:57, Krzysztof Kozlowski wrote:
> On Fri, Oct 16, 2026 at 09:49:16PM +0100, Bryan O'Donoghue wrote:
>> On 15/10/2026 22:48, George Neacsu via B4 Relay wrote:
>>> +  - clocks
>>> +  - avdd-supply
>>> +  - dovdd-supply
>>> +  - dvdd-supply
>>
>> The clocks, supplies and resets should all be optional as nothing says Linux
>> must control any of those on every system.
>>
>> i.e. you might have a co-processor or CPLD which owns the reset, power-rails
>> and the clock might not come from the SoC.
> 
> That would mean that every other binding/device would have them
> optional. What Linux controls or does not, is not really important here
> - these are required in the board design.
> 
> Best regards,
> Krzysztof

Yeah I take your point, they should be optional in the driver. Actually 
though we don't always know or represent a regulator for example or the 
regulator can be on a daughter board - as is common on Laptops.

What is the DT policy for that ? My own understanding was that it is 
better to not require all the regulators from the DT description and 
leave it up to the individual DTs to describe what can be described.

Should we have a fake regulator - or reuse one ?

OK the LLM tells me that I should have 'regulator-fixed' for that case 
always-on, no GPIO, so describing a regulator we know exists but can't 
actually control, hmm.

Fair enough, that's the answer.

---
bod
