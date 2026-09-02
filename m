Received: from mx.nabladev.com (mx.nabladev.com [178.251.229.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB09647D44B;
	Wed,  2 Sep 2026 12:03:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.251.229.89
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788350615; cv=none; b=SvE8QQ/QUV2n1Fw8dFVub0zVKRu0tcu1FVoQVg4wPCR5ouZ8SLH+m8+2OfQqD0sd8C875zpQrvXKrnRGIcATOAuqgpex8tJXhmPFWeYTBNAXdqNk2D9y+Ujrh1GvNcXMuH1ELbdBButeAMTHWjMqfmTzWGuKwfS7Vr+csIzLAX4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788350615; c=relaxed/simple;
	bh=+5jcyq3+d8Im4J2d8wIaIGW8c44g9l46CK05l5TEmDU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KeglbDenm02ayaoRERdHVH+4Q7Jtbx4RnIqu0PebOxB358NwZPdBM58cVNrrhhwZ7VP6yZjjaDaDDayVYGAfLqsflqJhabfe+Wl8ymW0h3Pln5umT4PBa4IhbKzLiuJjQ/r+fjZZThTNhleG4TzSyuOiLAh4+T9s7KQ3C3q8e10=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nabladev.com; spf=pass smtp.mailfrom=nabladev.com; dkim=pass (2048-bit key) header.d=nabladev.com header.i=@nabladev.com header.b=gyEFGtjE; arc=none smtp.client-ip=178.251.229.89
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nabladev.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nabladev.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nabladev.com header.i=@nabladev.com header.b="gyEFGtjE"
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 3AE31107AF4;
	Wed, 02 Sep 2026 14:02:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
	s=dkim; t=1788350584;
	h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=yRDozR9CA5cf4MGXA2Vmt/BC/L2ZUVuUBfpnwpPiwyo=;
	b=gyEFGtjERqBwEL/tao6ohapRRXoTPIu00k14Jc+WAiivcGlbvP/MvMnaPZnResbCMxpPgv
	ScSzSFCilANDS7CGXlSCeajqbmQV1cEP3agJu1q7t1RWlatD9Hn7GvRo3buLPY2cUMAaZI
	E0SWnkCi6XmwrbdGmbhI+PwDHSq4iSzq/g8WOx+2zR6lou9zZymVrjPB3l+bFECjLfCeer
	xU94yNLvWYHsIk440NnxuX9PxYgjPRtQKPxzq4y9QyuwNfCeQM9I2d5vU7waFhzQ4MrMvb
	1dyPvawnbFr6VouFfEIC8/fVIDAEmhIR4B6rG3csNkenYTKkYZIZvZt312R4rA==
Message-ID: <88c63929-611e-44f8-b18a-360d173c8925@nabladev.com>
Date: Wed, 2 Sep 2026 14:02:58 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [Linux-stm32] [PATCH v5 1/2] dt-bindings: arm: stm32: Document
 st, stm32mp23/25-syscfg subnodes and cells
To: Fabrice Gasnier <fabrice.gasnier@foss.st.com>,
 linux-arm-kernel@lists.infradead.org
Cc: Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org,
 Yannick Fertre <yannick.fertre@foss.st.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 Christophe Roullier <christophe.roullier@foss.st.com>,
 devicetree@vger.kernel.org, kernel@dh-electronics.com,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>
References: <20260831231359.136475-1-marex@nabladev.com>
 <43ea0c7e-44f2-4ec0-ae82-ee60203c8842@foss.st.com>
Content-Language: en-US
From: Marek Vasut <marex@nabladev.com>
In-Reply-To: <43ea0c7e-44f2-4ec0-ae82-ee60203c8842@foss.st.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3

On 9/2/26 10:55 AM, Fabrice Gasnier wrote:

Hello Fabrice,

>> @@ -57,10 +68,17 @@ allOf:
>>     - if:
>>         properties:
>>           compatible:
>> -          const: st,stm32mp25-syscfg
>> +          contains:
>> +            enum:
>> +              - st,stm32mp23-syscfg
>> +              - st,stm32mp25-syscfg
>>       then:
>>         required:
>>           - "#clock-cells"
>> +        - "#address-cells"
>> +        - "#size-cells"
>> +        - phy@2400
>> +        - phy@2800
> 
> Hi Marek,
> 
> Is just saw the discussing on V4 with Conor. That's mainly a thought:
> I'm not sure USB is required, e.g. mandatory for a product, even if not
> so likely (I don't know if this could exist out there).

I assume you have two use cases in mind:
A) A wall-mount HMI device with only display/touchscreen (No USB plug)
B) A RPi form evaluation kit with all kinds of plugs (Yes USB plug)
?

> Still, the nodes
> could be tweaked (deleted) in a board, to reduce dtb size in such case.
> I'd relax, e.g. let these 4 props as optional. Do you see any drawback ?
> That can also be relaxed later, if the case is seen.
DT is a hardware description. The PHY IP is not removed from the chip 
silicon only because the USB signals are not used on that specific 
product. Therefore, for device type:

A) without USB plug - no action is necessary, the PHYs are already 
disabled by default in SoC DTSI
B) with USB plug - board DT sets status = "okay" on the PHYs and 
controllers.

As for reducing the DT size, removing DT nodes for hardware that is 
present in the silicon negatively impacts the ability to apply DTOs 
outside of the kernel build process, so I would argue against 
preemptively removing any DT nodes from DTs to reduce size.

One exception is U-Boot, which adds additional generic bootph-* 
properties to a subset of DT nodes which should be available early on, 
and also contains a mechanism which reduces DT size for its U-Boot SPL 
which operates in severely size constrained environment. However, this 
is a special case, where removal of nodes from the DT is justified, 
because in that case, it is certain that those nodes would not and could 
not be used, and would only waste time.

On the contrary, the DTs that are used to boot Linux should be complete, 
because the user might enable an IP in there by setting status = "okay" 
after reaching U-Boot shell, and before booting Linux.
