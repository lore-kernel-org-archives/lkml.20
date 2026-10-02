Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39D043112BD;
	Fri,  2 Oct 2026 09:08:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790932096; cv=none; b=SHQ3533s2zevUnhPcP9FZME1CllHr44oQZM7RdR5e//pP24vEhQjWWyP4e7p6J1mITXzGxSD3ZBNvtUMFEQs1BCiMldAj69G62V2icNBkHqlysZIR8+JJoe/irE2eBrc3HNKM66DWDxdrSg4QK6gHRRNGb/8TdSxTaHehlfMuRQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790932096; c=relaxed/simple;
	bh=tXMfc1n+5iPcVl/5WaHRbFYbN4YDZ+VOl0gnQomBwiI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RPIkyX/nWfn9ebd9H3BAWwVdjUvZ6ZRjyICh3YBU9i1YAapWBaGapdhKmR/e1EyMNt3EuCZ9XST4cDo3VZky3gErfzTlqat74xJeK8+O+qNDveFDoCajU84xcz4kuG6vBSzl962OyXLFYHEc71bohNUuN4OrhoFY4kuV1iqWPi4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=c6Kcvms/; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="c6Kcvms/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 789D81F000FF;
	Fri,  2 Oct 2026 09:08:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790932094;
	bh=qYND9I0bLkoV1OIOcHctWDuYZniuT1XFMISc8X1RTAk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=c6Kcvms/zBEDquaJ9aYbjQKOrSRY+a9W/CiTq3XW0ZL8dwXyChYUTb7vZQJc8wIDg
	 uR98qdUBCwKUFXTlRDk/Z0R6FAv87jKt3emcG5kQAj1u0WQE5Y1CCkDY8uxo6JwzK/
	 GkaFfas904rt+JR8GfDctVKu0YV1Hi3KZBozvzMi8oAy2tgM797zV36Nf6xcsU+tNA
	 b5EWDfnFR/99C+5A/unLr+2T3FujwljHiCBpy283Bk9CqIeAPYEyk2J1xqVDCR2HGs
	 7+3pZY1aNZBWIGEdVPlR8jnSiIUCKDvJA1/WkBzByGyAeGlYtSpckimsXzy4bBrIuF
	 +6MF0xsLL7txQ==
Message-ID: <aeed36b9-2609-4312-86d3-b4ddca9148ee@kernel.org>
Date: Fri, 2 Oct 2026 11:08:06 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] dt-bindings: media: i2c: dw9800: Redocument
 DW9800K
To: Griffin Kroah-Hartman <griffin.kroah@fairphone.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, =?UTF-8?Q?Andr=C3=A9_Apitzsch?=
 <git@apitzsch.eu>, Luca Weiss <luca.weiss@fairphone.com>,
 Daniel Scally <dan.scally@ideasonboard.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org
References: <20260914-b4-dw9800k_cleanup-v2-0-6553273aaa33@fairphone.com>
 <20260914-b4-dw9800k_cleanup-v2-1-6553273aaa33@fairphone.com>
 <20260916-meek-qualified-penguin-fd8cea@quoll>
 <16efc0e1-8986-418c-87ba-9bf1ca4e4088@fairphone.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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
In-Reply-To: <16efc0e1-8986-418c-87ba-9bf1ca4e4088@fairphone.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 01/10/2026 15:17, Griffin Kroah-Hartman wrote:
> On 9/16/26 11:06, Krzysztof Kozlowski wrote:
>> On Mon, Sep 14, 2026 at 12:25:56PM +0200, Griffin Kroah-Hartman wrote:
>>> The DW9800K's properties are too different to justify sharing the same
>>> bindings file as the dw9719, Create a separate bindings documentation
>>> for the Dongwoon Anatech DW9800K with it's updated properties.
>>>
>>> More specifically:
>>>
>>> The DW9800K did not share the SAC1 and SAC6 modes
>>> that the DW9719 used.
>>>
>>> The DW9800K does not actually have a register that matches the property
>>> description of vcm-prescale, instead the description of the clock-presc
>>> in the DW9768 is much more applicable to the functionality required
>>> according to the DW9800K datasheet.
>>
>> I don't get why it does not match. You have exactly the same first part
>> of the description, look:
>>
> There is no inherent difference between the two property names, the 
> values that the previous binding was using was completely incorrect with 
> the hardware.
> 
> The reason for this discrepancy in the first place was us guessing which 
> properties that this driver would need based on the datasheets we had 
> for older dongwoon devices.
> 
>> dw9719:
>>    Indication of VCM switching frequency dividing rate select
>>
>> Your code:
>>    Indication of VCM internal clock dividing rate select,
>>
>> Both are dividing the VCM clock rate, no?
>>
> clock-presc is used in a different dongwoon binding (dw9768) which more 
> accurately matches the function of the hardware, So we concluded that it 
> was a more appropriate name.
> either way, the values we were using with this property was completely 
> incorrect, so it had to be changed either way.
> 
> If you'd really prefer us use the older property name we can change it.
> 

So the property describes the same thing? Then use the same property
name and type. Otherwise I really do not get how two same descriptions
can be different and one "is much more applicable".

Best regards,
Krzysztof
