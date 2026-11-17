Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794903943;
	b=AbetzXgp9saUvR5epSwL+867dxBqbAR2u4tg2aNVT9wT/NGQjt3hqxQS+hBqcbuD7p2E
	 Y0crkbROLFYBOvftcnRdqocY8iGdwTiTgYAPOhF4+DAgYDLKeF0Ob83NHoK3MYzDizjXZ
	 rd5iO1wQjWm4dADZYt5H6FhmFuERX7Gi+2PBO2auoVxY9HVgDROU27FSXVqrRssA7xUOG
	 ouMsGT//lAgDOSGeNRT0bMrR3CUve3G46V7jx+GhHwahOur3LJdrxt4CLICb6HPJ3T+C4
	 iD1eReCGn+Oru4ZHQOlehs+0my8rxG9DDrVZXI+we/6StzUbo7Ayl3ha3rStiK0IsFw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794903943;
	h=Received:DKIM-Signature:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:From:Content-Language:Autocrypt:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=+hujyyJhAtV9+j0TPvcHHV2OIVquZfJfleCKzkG+n+Y=;
	b=ufM7L9ychmJhvbJ3ZrzUQnjuc9rzb7ML4h6X74TZNu8CJh0qTgrp42tEL2K1DNDOlbwB
	 YXi9sBUDbnKwE7Cw0o7BGs+Qpq2E9yGuQywkOmTkyiI2Gr3OITu7eeStGK+03BJOj/5KY
	 A8ZVw6ih1ryT5N9q7FA21A3J6D30+6uZsA5fMvA2GWI0exIV18AYmttH42+I5xEFTnShe
	 Zhlke9XBPLoTEM+RG8MIBdQLjBIHNtyztA+6cltLSlgsplQp878yRXXpexqZOc/stpeg9
	 e2qrH3uzY1Uwrbflr7Q/y3EJq8WQtUsEkd2EMTZ2ROhPm40oGBeLpO4TE05QjhpMBTg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="Ph5A7mc/";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3543606A880;
	Tue, 17 Nov 2026 08:25:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Ph5A7mc/
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D5E651F000C5;
	Tue, 17 Nov 2026 08:25:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794903942;
	bh=+hujyyJhAtV9+j0TPvcHHV2OIVquZfJfleCKzkG+n+Y=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=Ph5A7mc/DTICXLffxM//Teh42HusVR1+ZEw2K90Oe2JJ35j0et/QAQtx13zhz5FXR
	 jPn1TDkoxtDQat2UPHH1gn+PPTHKJAHcf04I/1TEYl68JGR3s5yoobb6KIsFknIotA
	 YOKjf+wA8CGQlFWMcGp5biKG1WUBFsTpnP5v4vUUhhPJrwJ4n0TEaeGdLMYMMw88tP
	 BSy2ccJivwOBwyZgEdF3nkH70HpiU/JCVtlQkwMt7wNdYIyQsBAmBw1hAC9cx5IFL8
	 KhFsu+574EiUUQyiro0r+xrcgKopOYBdfMq+JZWJDBH511MRixEF9aGjmB+liMljx3
	 8f6kJdO/+VsvQ==
Message-ID: <eaabb4ff-c748-4123-93b8-f49684600c71@kernel.org>
Date: Tue, 17 Nov 2026 09:25:36 +0100
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
Subject: Re: [PATCH v2 3/3] arm64: dts: rockchip: Add IEP2 deinterlacer to
 RK3588
To: =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>,
 Arun Iyengar <aiyengar1990@gmail.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Hans Verkuil <hverkuil@kernel.org>,
 Nicolas Dufresne <nicolas.dufresne@collabora.com>,
 Alex Bee <knaerzche@gmail.com>
References: <20261115-iep2-v2-0-3d8798cd9a55@gmail.com>
 <20261115-iep2-v2-3-3d8798cd9a55@gmail.com>
 <20261116-luminous-heavenly-guan-b20f2e@quoll>
 <yRxnTArhQFiS4u_tncJj-g@sntech.de>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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
In-Reply-To: <yRxnTArhQFiS4u_tncJj-g@sntech.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 16/11/2026 19:32, Heiko Stübner wrote:
> Am Montag, 16. November 2026, 13:35:28 Mitteleuropäische Normalzeit schrieb Krzysztof Kozlowski:
>> On Sun, Nov 15, 2026 at 08:47:44AM +0000, Arun Iyengar wrote:
>>> Add the IEP2 deinterlacer and its IOMMU to the RK3588 base dtsi. Both
>>> share GIC SPI 117 and sit in the VDPU power domain.
>>>
>>> Addresses, clocks, resets and the interrupt are taken from the Rockchip
>>> BSP rk3588s.dtsi (develop-6.1).
>>>
>>> Signed-off-by: Arun Iyengar <aiyengar1990@gmail.com>
>>> ---
>>>  arch/arm64/boot/dts/rockchip/rk3588-base.dtsi | 22 ++++++++++++++++++++++
>>>  1 file changed, 22 insertions(+)
>>>
>>> diff --git a/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi b/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi
>>> index aa69fd3793fd..5297519bd251 100644
>>> --- a/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi
>>> +++ b/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi
>>> @@ -1397,6 +1397,28 @@ vepu121_3_mmu: iommu@fdbac800 {
>>>  		#iommu-cells = <0>;
>>>  	};
>>>  
>>> +	iep: deinterlace@fdbb0000 {
>>
>> Why all these are outside soc node? That's more of a question to
>> existing code...
> 
> Many years back, during the RK3288 addition I got the comment from the
> arm-soc maintainer to drop the soc node [0]:
> 
> "[...] this isn't how we tend to do it any more (unless all devices
> are physically on a bus, but then it should probably be named something else
> than 'soc')."
> 
> So since then we didn't have soc nodes. Except in time for the RK3576, the
> tune has changed, so socs from then on have a soc node again ;-) .
> 

I think the comment was misplaced and misunderstood. Indeed non-MMIO
nodes were not supposed to be in soc. But the MMIO node are under
MMIO-bus, which usually we call soc.

It's documented also writing-bindings, since 2019, though :)

Well, not a blocker for this patch and I leave it to you what to do with
existing and new DTSI.

Best regards,
Krzysztof
