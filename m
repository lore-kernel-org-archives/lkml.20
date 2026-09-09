Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org [80.241.56.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE719568FDF;
	Wed,  9 Sep 2026 16:52:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788972761; cv=none; b=cKLvENhHHhGSiE/JDpzm7cPiKP+GiV5B/1CqoLDfFReJcDTlYcGlUeWqR1s0VdD8MPS/NisFeGC0Uii2JewlsVialTni9BCYBnN4cc35GPOYNBvRtOwjMYVLizRI1KRtdLGi16zMAS1AUYT0bpBYDnyST99QnTM5VmZHoiZHFG4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788972761; c=relaxed/simple;
	bh=D8Xg7T6KqYH4/WUvkf9lj526uOKKiRcA2jkTEUin+E8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=O997wvWyYkzMqs0P64MTvksCBCjp/Wyx7gu5e5VczTumwdzz57e61GJzFZMO+8+dsMwNZ2fdxcTVVtm/dmzu4C/UyOWqSa/smJ2V5EcGy0cQqiEQCCsK711+qWQkRqREHwXZHRu/s6jeM8S71cyDXISCwdH8ZE322/ARJAKqXYk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=CEVMBYM2; arc=none smtp.client-ip=80.241.56.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="CEVMBYM2"
Received: from smtp202.mailbox.org (smtp202.mailbox.org [IPv6:2001:67c:2050:b231:465::202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4hg6LD3WqWzMlGK;
	Wed, 09 Sep 2026 18:52:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1788972756;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wANtG2Wck81u3ITB1BffycJAGPKSfj9OAY9Ew1PSRKk=;
	b=CEVMBYM2BnLkVG3JuEdeDg1EQxeHGPhwOfeiIlk5vHwGcD4wFkqW9UVpLX5BVTOh43eD/X
	hqjQAH3MFjIFQLnkEBTeoV2hCSKL4OtLmXeXBRp27LAP3+G5pY0WuCYHQ8OjNni/0q2oik
	0895QKLQvP74XrhzS+hRWPSf4/v8BxKQI5bFLQb986bJIRWNpHIpuMYdAG6WwJ9sz2OhKS
	c99QrIePvOm1sUGburFEw0VMapoqjDL/GOTjIrcVF835cnQD1Y9V535O3IMr7TxplN2meY
	bv62AL1LwjJX/EmWq1MrVu3crIWKYOOPK+zzyfVKiWS5671IfIEtFigi+e3LSA==
Message-ID: <3b345291-b14d-45a4-818e-355b487c46a9@mailbox.org>
Date: Wed, 9 Sep 2026 16:43:19 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
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
 <04bb7d78-4b0e-49ba-910a-6fa2b0a8c1a7@mailbox.org> <aqE11WTb6EMhn6Tb@squawk>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <aqE11WTb6EMhn6Tb@squawk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-META: kq35cnhos6bpsrynf31z5uqsc8hur51r
X-MBO-RS-ID: 4ad110d8ca3e4f81110

On 9/9/26 12:32 PM, Conor Dooley wrote:

Hello Conor,

>> I could make only the ones which are currently used available, but that
>> would be confusing the implementers by suggesting that the other quirks are
>> not applicable even if they might be ; and this would likely turn into an
>> endless stream of schema updates, with random users enabling random quirks
>> they just used. I don't think that would be helpful.
> 
> My understanding was that these things were effectively errata, so users
> should not be enabling them willy nilly - the vast majority of these are
> set in soc.dtsi files, and the couple dts users I checked were all SoCs
> for which there was only one board.

I agree with the careful application of these properties part.

However, I perceive them as tunables, not errata. If they were errata, I 
would argue the errata quirks that apply to each controller instance in 
each SoC should be derived from the compatible string. If they were 
tunables, they should be DT properties.

> IMO it's far more confusing to suggest
> that a user has to figure out which of these may apply on their platform.

The way I interpret this is, that the user should keep the defaults and 
not enable any of the additional quirks unless they really need them. 
But the DT checker should not warn the user that the quirk is invalid, 
because I do not think that is the case -- the quirk is not invalid, it 
is only not necessary in the majority of cases.

> But of course, do what you want, they're your users.

How shall we proceed here ?

-- 
Best regards,
Marek Vasut
