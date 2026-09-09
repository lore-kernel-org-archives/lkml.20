Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org [80.241.56.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E15E54B1CF;
	Wed,  9 Sep 2026 15:16:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788966988; cv=none; b=HrcfJ7MENbtP2NzsV3hofjZEnB0KHNqS9rshpF1gHkzVYi8j9xLZw3+66bBUsyFOupu2QkWb3G3LZ8q5ICxIXMQHeMr4lQRVOh4eJqpB2CPJxFRgDbRW+Aje0x9+DAEVEVG4wvmyZ55JLjND8OMDnEMo19vGlOIzGlFurDi/hss=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788966988; c=relaxed/simple;
	bh=qRzXUreHuonI5ZVJGgFqYlpg1sFNJoyvmV7io+rg/bg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QjULAjndzi87AUAX+3yAnUlz8NWXYAxqsaXPNHmufhHxZAAVBgb5oL/MBpyBgtvRQl0PTQWzwJifIGxa/25Iq8bY8iS4e79McDa+8DUH9Vczykbw6hpnhvwKySy7EF8HAlGvJwLTPWXY6RLzFXbfCjny2RAaFD+7PBMs9DqeK48=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=oHcGB58P; arc=none smtp.client-ip=80.241.56.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="oHcGB58P"
Received: from smtp1.mailbox.org (smtp1.mailbox.org [IPv6:2001:67c:2050:b231:465::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4hg4CC4vN5zMlBf;
	Wed, 09 Sep 2026 17:16:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1788966983;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jiAuFX2yhbVwIrEUDOjZptkJ10gfAcRfLWBSK+Ulw8s=;
	b=oHcGB58PEAY/eEODVUCOsfVRTJnW1I9HX6A3MoE/KJeN/ZmBVbQ8bA0IzGAcVvUZPevYaE
	Eky9UDQPE5GKe6hb8RcOWAJm1KjwmpRYw5wvwCi4VoEk5fQdf2/hTrVXQoXA96Iob42dmp
	g41jXMpQyzrA88r9qZwlrZd6uM1Y4f/mgtILMJa8wqtexLnBEQh/yuD8HUbS0jslls54uA
	dW51cgs5oX3ICW8H4AmygyrlnHYP41rz0aR1/aooKWTVEUiJ4+7RZvmn7FTgAvMjo2zRKz
	BcfUmOMlYHDN5u6sfSAOiSaOlmYF7TPSfkAbKMS6M0lQ9ledeviikUbZuqyjWw==
Message-ID: <c784aab5-c0c9-424f-9f9d-a0330f60a0ef@mailbox.org>
Date: Wed, 9 Sep 2026 17:16:21 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH] arm64: dts: renesas: sparrow-hawk: Add overlay for
 WaveShare 2CH CANFD HAT
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-arm-kernel@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Magnus Damm
 <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org
References: <20260808025724.131943-1-marek.vasut+renesas@mailbox.org>
 <CAMuHMdWvLX7OZSkfEBA34wKtnoZ4asB6rWFJiLa=2+=fezqsCA@mail.gmail.com>
 <f82ae578-fbe7-4834-bdde-d11e194a507f@mailbox.org>
 <CAMuHMdXQKL_srr80mUmsnznqJ_qxAoh0TdwyvJ41=CN=2pDjCQ@mail.gmail.com>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <CAMuHMdXQKL_srr80mUmsnznqJ_qxAoh0TdwyvJ41=CN=2pDjCQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-META: yt4hfwetehfwg91nxg36oikoca5amr3u
X-MBO-RS-ID: 18cd9288ed520fa562f

On 9/9/26 9:56 AM, Geert Uytterhoeven wrote:

Hello Geert,

> On Tue, 8 Sept 2026 at 19:02, Marek Vasut <marek.vasut@mailbox.org> wrote:
>> On 9/8/26 2:02 PM, Geert Uytterhoeven wrote:
>>>> +&pfc {
>>>> +       msiof0_pins: spi-ws-2ch-canfd0 {        /* SPI_0 */
>>>
>>> Node name should be "msiof0".
>>
>> Do we also have to fix up
>> arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk.dts this:
>>
>> "
>>    755         msiof1_pins: sound {
>>                             ^^^^^
>> "
>> ?
> 
> Might be a good idea, to increase consistency.

Submitted as

[PATCH] arm64: dts: renesas: sparrow-hawk: Align MSIOF1 PFC node name 
with label

>> But I wonder, shouldn't the DTOs contain unique pinmux node names, which
>> cannot accidentally overlap with the base DT or other DTO node names ?
> 
> In general, the answer is yes.
> In this case it is about pin control subnodes. If the base DTS already
> uses msiof0, its original user needs to be disabled by the overlay
> anyway.

The original DTS does not use MSIOF0 .

I think the proper solution here would be DT connector ?

>>>> +               groups = "msiof0_clk", "msiof0_txd", "msiof0_rxd";
>>>> +               function = "msiof0";
>>>> +       };
>>>> +};
>>>> +
>>>> +/*
>>>> + * PWM1 uses PWM1_B pin configuration for pin GP2_13. This conflicts
>>>> + * with SPI_1 CE_1 signal which is also on pin GP2_13. Disable PWM1
>>>> + * in case this hat is in use.
>>>> + */
>>>> +&pwm1 {
>>>> +       status = "disabled";
>>>> +};
>>>
>>> Please move this node disabling pwm1 to the top, for compatibility
>>> with dynamic DT overlays.
>> Could you expand on that a bit ? What difference does the placement of
>> this node make within the DTSO ? Please pardon my ignorance.
> 
> In case of a dynamic overlay, pwm1 must be disabled before SPI_1 is
> probed.  Otherwise the latter will fail with -EBUSY due to the
> conflicting pin being still in use.

TIL, thank you.

-- 
Best regards,
Marek Vasut
