Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=80.241.56.152
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792992936;
	b=RYDTD63Htv5gjh5Oc2QfgdjyadSgBiq1OZbBoykqcDnpROt0MdaO5FQ16EMUmAFfH+Wp
	 8eQdD3MkE0cpDaxoXO3M9SG68qpE7tZvIgIrUNrv62S0cl5QRdN03w+Wn/WBXG9uH7dZ6
	 HRN2TSrm/PfDwcXw+rlQgp5sbReJUM7My9dQp8kBxO17SBdMkBA/HTh0akyNpXzZm9G/G
	 ndSqzPgEIUPKOOsMusZ30YQqdlmHLWdz/R3PoO7SzkvRDb+u32YMUyWNcMHxfI7l1iQQ3
	 ZQnV30D+dOKh+jQMbsmBj5odqsdeva5AS92zk/ucLRo3Taqtyjdkim6Etkh4AoukjJQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792992936;
	h=DMARC-Filter:Received:DKIM-Signature:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-MBO-RS-META:X-MBO-RS-ID;
	bh=xK2Yoj5Thgad4mvdaQ+MAFsyfOOZz37JLZyMZhNEMzI=;
	b=uhwVDjGRKG+1wdCSms+AJ/C1PCcHm7+4BNE6azez4MuQun+/WwUrby2EsJKo3y/HN+Tw
	 685RwgLxXRyhnGZ9e5OQRfHZFAqecBICVHcmZo0dGhwi9oK9K5GedRX0Qp0j6Djraf4VU
	 QLzNtgsl8/HDq+JFvYkBK3GceZPI43ntDa0k4Sdl1FJ1gkFAsul4bormdviCyXiqN6bY1
	 9TfjtVVY1C7sU1DOh3vfkbiue651Fr1q15RH6E3B0vikw6eIcTEPABCQb4zwKeDzPZIvG
	 EfrZYEhlWqJVNXfOAnfRPQsdifPt76yYis8yDr8mcIL1RPUjcw4M5IHw7FXWrks0Qew==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mailbox.org;
	spf=pass smtp.mailfrom=mailbox.org;
	dkim=pass header.d=mailbox.org header.i=@mailbox.org header.a=rsa-sha256 header.s=mail20150812 header.b=WURGT8vB;
	arc=none smtp.remote-ip=80.241.56.152
Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org [80.241.56.152])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09AB3606A31D;
	Mon, 26 Oct 2026 05:35:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 09AB3606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=mailbox.org header.i=@mailbox.org header.a=rsa-sha256 header.s=mail20150812 header.b=WURGT8vB
Received: from smtp202.mailbox.org (smtp202.mailbox.org [IPv6:2001:67c:2050:b231:465::202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519MLKEM768 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4jCj5B3LFhzKn8w;
	Mon, 26 Oct 2026 06:35:26 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1792992926;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xK2Yoj5Thgad4mvdaQ+MAFsyfOOZz37JLZyMZhNEMzI=;
	b=WURGT8vB+fqRYGWtm4M/rzXv0f/1gr3F1ko9okNFa0twOEjXi/WAhdb3AEKfHJJQ54RiEA
	irQx8Qd+84rJ4oxWvS9Rfch3fYZeDQ2b7xvuBp4v0udh1ygfZ3WEQNjR4vrXa0BbwCeS+G
	E9rtIWInb30xa5LmAJVUmOauW6JRFPpqp81ZtgLQPhYb38VpVPUvDDofxtmH6wQbFc+ned
	kD/rW+2XmExHj3aV2bLBWyCBQY7zwmK8GywKRNZYuukCO0pX+utEEngeMICg5ImuqdUljW
	d3ZrJ/JBP4cv52yNWcuQELz81UzbmO83QrLDKHtaiaDmn3BOr/YCA4OB+Zjmxw==
Message-ID: <1d48649e-cf7d-421b-bcd9-3a896064375c@mailbox.org>
Date: Mon, 26 Oct 2026 06:35:09 +0100
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: renesas: spider: Add overlay for PCIe ch0
 endpoint mode
To: Koichiro Den <den@valinux.co.jp>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
 linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20261022082113.3163666-1-den@valinux.co.jp>
 <4c0b2b15-7e5f-4dc1-bf49-c762de48853e@mailbox.org>
 <yxguu4obyspgkq5f2coa6kjrnxjeij3yduhwd4qd4gpamw25fp@quii5c75uxhn>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <yxguu4obyspgkq5f2coa6kjrnxjeij3yduhwd4qd4gpamw25fp@quii5c75uxhn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-META: bf3h9ei6sdootpihgza9o6h6rbt6p6u3
X-MBO-RS-ID: ca93ed98a89a64c447c

On 10/26/26 4:08 AM, Koichiro Den wrote:
> On Fri, Oct 23, 2026 at 02:58:38AM +0200, Marek Vasut wrote:
>> On 10/22/26 10:21 AM, Koichiro Den wrote:
>>
>> Hello Den-san,
>>
>> [...]
>>
>>> +++ b/arch/arm64/boot/dts/renesas/r8a779f0-spider-pcie0-ep.dtso
>>> @@ -0,0 +1,15 @@
>>> +// SPDX-License-Identifier: (GPL-2.0 OR MIT)
>>> +/*
>>> + * Copyright (C) 2026 Renesas Electronics Corp.
>>
>> Is this header correct ?
> 
> I checked with Renesas just in case, and confirmed it is fine.

Thank you for checking.

>> Would it be possible to include a brief "example usage" comment in the
>> header ? An example of such a comment is available in e.g.
>> arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk-fan-argon40.dtso "Example
>> usage:" . If this would be too complicated, then please ignore this request.
> 
> I would personally perfer to stay aligned with other in-tree PCIe endpoint
> overlays (e.g. freescale/imx*, rockchip/*, ti/k3-*) rather than adding
> fan/HAT-style examples here.
> 
> The typical (long-standing) usage would just be the standard configfs steps for
> pci-epf-test (documented in Documentation/PCI/endpoint/pci-test-howto.rst)

How about adding modified form of this ^ sentence into the header ?
(please see below)

> , so I
> suspect duplicating those generic instructions in this file might not add much
> value.
> 
> That said, keeping the header completely bare might look too terse.
> How about something like this:
> 
>    // SPDX-License-Identifier: (GPL-2.0 OR MIT)
>    /*
>     * DT Overlay for enabling PCIe channel 0 in Endpoint Configuration with the
>     * R-Car S4-8 Spider board.
>     *
>     * Copyright (C) 2026 Renesas Electronics Corp.

How about adding this here:

*
* Please follow the standard configfs steps for pci-epf-test documented in
* Documentation/PCI/endpoint/pci-test-howto.rst to set the endpoint up.

This would steer users toward the documentation. What do you think ?

[...]

-- 
Best regards,
Marek Vasut
