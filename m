Received: from mout-p-103.mailbox.org (mout-p-103.mailbox.org [80.241.56.161])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 739B94E50AA;
	Wed, 16 Sep 2026 21:26:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.161
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789594029; cv=none; b=CneatjcToZbNq2g5ypw1J//GB2R5TnGOllS5b8gq+km/TMQUEktb2Xl7nob6btFSgJjKHJQa73qNx01sBdPYU1DJwWtZrweWmKGBUde0ZAImUyF4XHBEKsnQ0DwfymJWmWJFkS9dm4YQnnyWKS4lMGue5eWsvdD5obR5I0umvi0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789594029; c=relaxed/simple;
	bh=AsQqS9710lfvxj0MAvI/7hzneJ7P3AiAYoBeWGfNftk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Z5suS7NiCLRVS4J4bgZlu8fg/yOX43wwhPHRfHoKF9QY4Ik5dfaNI7MYjAStaf81bLiQJR6Dw9Q6ctJ9Omx4OBDXvAVvG9TKG2jtbfvyUWDWhvknSr5UvLouNPEtD4Xd2hkCbCkP1bpZ5YJzaMWsJ4mLiwKndAltuz6o7tyKouM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=im9OzdkX; arc=none smtp.client-ip=80.241.56.161
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="im9OzdkX"
Received: from smtp2.mailbox.org (smtp2.mailbox.org [IPv6:2001:67c:2050:b231:465::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4hlX5R3dNfzKnS3;
	Wed, 16 Sep 2026 23:26:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1789594011;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Awx/qSMJsfDp5YFKo98US/4IxChQqsFBIzOvN17lZ2g=;
	b=im9OzdkXDGajHZYTNlRcWyDBOZJholJgFLe9R9NjoSNZx9LsAyzSKTgO0N4qur+kW7FVMl
	6uIO5coBY64vQfHI19PRRAz8r9Y61KHNE6QiQXBOcvFp54qBdKnAzCwsSvO8p55VtbradN
	33PYThsRqzNNfr20VYG5IlfQc6JXCt7rlPbmPNm5xoXzqioeOqJL32KIFHVpUnS/0jiQSX
	8xpJezTHawYbzcHWLtZRW+GFNgpbWQiqmU8++1MKJIlx9JIC/2D0g2/fomqOwWBXQ7Kslt
	FsGHAhDPfX4KALihngTSnIZepHa4d+JYfNWSUo4Q47NSqAHusHdRhSPxJ6RU1g==
Message-ID: <805629d1-ba2b-4e59-8d29-c374528367f9@mailbox.org>
Date: Wed, 16 Sep 2026 23:26:47 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH v2] arm64: dts: renesas: sparrow-hawk: Add overlay for
 WaveShare 2CH CANFD HAT
To: Rob Herring <robh@kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-arm-kernel@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Magnus Damm
 <magnus.damm@gmail.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org
References: <20260909151423.28358-1-marek.vasut+renesas@mailbox.org>
 <CAMuHMdVVcbwz1OK9tL9zn5RR_4YyML6++OUVUgmswPpaxdmRSA@mail.gmail.com>
 <34f4c088-5268-4add-aef4-33b3d3623c12@mailbox.org>
 <CAL_JsqK8--7X5g4T05Y6bEGzsxrhTq2QyQRpE5E5uHBot3jLWA@mail.gmail.com>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <CAL_JsqK8--7X5g4T05Y6bEGzsxrhTq2QyQRpE5E5uHBot3jLWA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: h3pk3hdfad8iwfsccm1r6mrg3escspem
X-MBO-RS-ID: 442b280c29c53d01ed2

On 9/16/26 10:49 PM, Rob Herring wrote:
> On Wed, Sep 9, 2026 at 10:55 AM Marek Vasut <marek.vasut@mailbox.org> wrote:
>>
>> On 9/9/26 5:31 PM, Geert Uytterhoeven wrote:
>>
>> Hello Geert,
>>
>>>> +       /*
>>>> +        * SPI_1 is operated as GPIO SPI, because MSIOF5 can not be
>>>> +        * muxed on the pins allocated for SPI_1 on this CANFD HAT.
>>>> +        */
>>>> +       spi {   /* SPI_1 */
>>>
>>> As this lives at the root node, I'd rather change it back to
>>> spi-ws-2ch-canfd while applying, if you don't mind?
>> Please make sure the DT schema check does not complain about it,
>> otherwise it is fine, thank you.
> 
> It does complain:
> 
>        1 spi-ws-2ch-canfd (spi-gpio): Unevaluated properties are not
> allowed ('#address-cells', '#size-cells', 'can@0' were unexpected)
>        1 spi-ws-2ch-canfd (spi-gpio): $nodename:0: 'spi-ws-2ch-canfd'
> does not match '^spi(@.*|-([0-9]|[1-9][0-9]+))?$'
> 
> The 1st warning is a side effect of the 2nd warning.
> 
> "spi-1" like the comment says if just "spi" does not work.
Geert send this fix today:

[PATCH] spi: dt-bindings: Relax node name suffixes again

Maybe that works too ?
