Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 012C13B47DD;
	Tue,  8 Sep 2026 21:35:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788903319; cv=none; b=ZZBnJYgb5cWra7OA8lZG4RG1DcRU3fLj5QazGdjDQdCOjv2pK1skrEGSv5CrS6AWCOybkRR0v4LBiR2c3rgdSx967B/IeaELG0dml0nchtBMV1XJAeI9KKMuzSGykL+ay0C84Tben7lDj6pcyZMvmrS/uncxHuTP8O2HjyBOx3Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788903319; c=relaxed/simple;
	bh=7dED9VlQyhxfU5aTA4RVVywCq7h7okq2ExZ8AYEGnkQ=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=S91ZkNXgdor9Ey8Bvw+jEG2FbCJaD2vZl3Du80xPfsxno4md6qA2ew93d5movvndX8sNLhx01cxKQ9Y1KYZCyOdJSRDazRsj4ALAgD75oArbGy0uxgZfudMSRCpbH7/aBgSgCGdspZjnqtbAXLO2j+E1LmGFRf/ryKThBNxiAO8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=LkoPSxJw; arc=none smtp.client-ip=80.241.56.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="LkoPSxJw"
Received: from smtp202.mailbox.org (smtp202.mailbox.org [IPv6:2001:67c:2050:b231:465::202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4hfcfn0FRnzMlFj;
	Tue, 08 Sep 2026 23:35:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1788903313;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lOGTJQPlzFJi+I64QoY7lgRUSu8jsaJ5Bcxlr6QsoJY=;
	b=LkoPSxJw6lej0FKmws6X3TWygzc21LZrjah+Xa97qjpdKKKz8o7Au7m3sZDFl9fHLPvDEe
	Ql0J9IJxG0sKO7sgIpB6kv1cQFIZo5I2q9u71ERg5MYNFamDsbEU/7ajuEaEMPK0nxgW1F
	Qw5MjkEcuGf3NjjMx58/MK1WtpK28L3t1BFwXgQNkrJB1ko2n1TjdezQyQ6F6kRfU83geF
	bsGOgEWU5VABbBQi0j1/gGx3k9HZodK76KZdod64XMHKWURsbamzG46VHfV5h4U5ynjuLw
	cZon2MU2dA0qZQqXbH3PWfLHe+nJhisoa/y8+xUO67g13kdsuJe0g4qqyz1Q0w==
Message-ID: <04bb7d78-4b0e-49ba-910a-6fa2b0a8c1a7@mailbox.org>
Date: Tue, 8 Sep 2026 22:58:48 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Marek Vasut <marek.vasut@mailbox.org>
Subject: Re: [PATCH v7 1/2] dt-bindings: usb: dwc3: Document Renesas R-Car
 Gen5 DWC3 xHCI USB controller
To: Conor Dooley <conor@kernel.org>
Cc: linux-usb@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>,
 Thinh Nguyen <Thinh.Nguyen@synopsys.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org
References: <20260903213031.314473-1-marek.vasut+renesas@mailbox.org>
 <20260904-colonial-wimp-b37c27657664@spud>
 <7771adfd-7447-4802-ad75-7c889ad32ee7@mailbox.org>
 <20260907-tassel-bargraph-836b6f41fc43@spud>
Content-Language: en-US
In-Reply-To: <20260907-tassel-bargraph-836b6f41fc43@spud>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-META: 76fgoyufaj7n5iey5o7j5f7ywhpc3gpt
X-MBO-RS-ID: 4c2b5ef6c21f7b5f70e

On 9/7/26 7:43 PM, Conor Dooley wrote:

Hello Conor,

>>>> +unevaluatedProperties: false
>>>
>>> I said this elsewhere today, but this binding has lots of "distasteful"
>>> properties for things that should be determined from the compatible
>>
>> Which properties would those be ? (it seems
>> reg/clocks/interrupts/phys/power-domains/resets really need to be there as
>> separate properties, but maybe I am missing the point?)
> 
> All the quirk properties is what I am talking about here. There's about
> 50 of them and I don't know if a single one should actually exist.

I cannot tell whether every one of them will ever be used or useful, but 
I also do not have a good argument to block most of them as they are 
tunables which apply to the DWC3 core itself.

I could make only the ones which are currently used available, but that 
would be confusing the implementers by suggesting that the other quirks 
are not applicable even if they might be ; and this would likely turn 
into an endless stream of schema updates, with random users enabling 
random quirks they just used. I don't think that would be helpful.

>>> , so I
>>> would appreciate it if you could use additionalProperties: false here
>>> cite the ones you need to use explicitly.
>>
>> May I ask, what exactly is the rule of thumb for additionalProperties:false
>> and unevaluatedProperties:false ? I seem to struggle with picking the right
>> one for a while now.
> 
> I would say, if all properties being imported apply to you device, use
> unevaluated. If only some do, and there are some that will be
> problematic or confusing if used, then additionalProperties: false and
> citing the good ones explicit is clearer for users and prevents the bad
> combos.

Thank you for this clarification, I will make a note of it.
