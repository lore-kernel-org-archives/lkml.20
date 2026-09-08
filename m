Received: from mout-p-103.mailbox.org (mout-p-103.mailbox.org [80.241.56.161])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E490258FD35;
	Tue,  8 Sep 2026 17:03:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.161
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788886983; cv=none; b=GYi03wNhPMYBxjPaFW2eiIyh1fYRtkGkm/tGqnVfsnZQ4BHoVvV0ta6bjNhXT1hvOF2WO//Jx/FsCudhOq/JltHdTgcmmU6ssRzB+Mhnq2bF1kiW4Sshq9X9GY6L8lZ4L8IWJSoEZksp3aA6kMayTbYdBHRy7VffBDF8TBBiX5I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788886983; c=relaxed/simple;
	bh=A8jHahRAPAI8OtrIcozqhucjV5m38jBXQ6O71Oa905I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DTDjhCDU6GmQ4hesm9oZevrURepzosOcUoaYQMb6JMFDLCaQ3JDHTrnXZVlx8/ckFawfU+t6EbMKhoBjIWfuy2YuC6ZVH33Mxv8YrgVTHvgO6yd2OripqI9PZg4VXjfi8KUOxgoHT/S0zv7NewFljcU3FVD+HsmUh1Z1w1uTC5E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=TqFlEQnk; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=btXuODU/; arc=none smtp.client-ip=80.241.56.161
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="TqFlEQnk";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="btXuODU/"
Received: from smtp202.mailbox.org (smtp202.mailbox.org [IPv6:2001:67c:2050:b231:465::202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4hfVcY4VJ0zKmBJ;
	Tue, 08 Sep 2026 19:02:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1788886973;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=AGYd+rQCgjkao3/yCaTGMnIYCgUWSxU7FIhmSF4cIF8=;
	b=TqFlEQnkWFqKxLex8B2wSekOTQcR6ayWhtXYsy6AXiWckFa6v/RTPfD9v3pCENsy9sxZuJ
	DAT0s4XhiDmmv+D+2W82cF37SJvOwNfNhhtVNcEoABUFMZ1s3aotqX5Wn4DDUA8ozNAd6K
	AnAoQ7ySQykkiOfpfUB5sBezRU3AFk9SiHXUGs5ui9VfJCgnQ6xrJP8HWBRB3v9KwN8gnZ
	6XWzY2GEScMJ7IRhrXdeMsTtuKeuTXnvlaN0gEtTJJY2MjQNAc2yD3bMyvjfESFAmovP1D
	xmyUbmZ5h9DwtLayOTx36bsK/8wfsNItc+s7QknPT6cxBT0FcnfEiFfU5nUmag==
Authentication-Results: outgoing_mbo_mout;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b="btXuODU/";
	spf=pass (outgoing_mbo_mout: domain of marek.vasut@mailbox.org designates 2001:67c:2050:b231:465::202 as permitted sender) smtp.mailfrom=marek.vasut@mailbox.org
Message-ID: <f82ae578-fbe7-4834-bdde-d11e194a507f@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1788886972;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=AGYd+rQCgjkao3/yCaTGMnIYCgUWSxU7FIhmSF4cIF8=;
	b=btXuODU/rON3VYbUzoq1r4Zc2wUGnIAZyui65W4IqOP5VfNQf/z+EJL6fB6rIj8HRoE96+
	7SHLRW7C4taIqEQaRWUGnYt257F22sFhlD4I+DlE/s0oawNnY+1XXmsxCBtsN0cbmhRq/n
	DM+Mh4c8v/vwVlkRdjWJiyGH6dFJZx0O9OzrYRZYphhtQf1cbBsRiAyBYn/UyvdMZapKQK
	GPTzhoi5BuAfxmAuSS+3pel2vaUucFi+ULeBEmRW1l0EREklsKoqNUp5YGuwqSjhfJ3rd0
	fia9me7c1b3mQN+ivWz+LqEub8TSyHigXuLcYdJvmdlKdTchUye9qrvhlu2X5w==
Date: Tue, 8 Sep 2026 19:02:48 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH] arm64: dts: renesas: sparrow-hawk: Add overlay for
 WaveShare 2CH CANFD HAT
To: Geert Uytterhoeven <geert@linux-m68k.org>,
 Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-arm-kernel@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Magnus Damm
 <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org
References: <20260808025724.131943-1-marek.vasut+renesas@mailbox.org>
 <CAMuHMdWvLX7OZSkfEBA34wKtnoZ4asB6rWFJiLa=2+=fezqsCA@mail.gmail.com>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <CAMuHMdWvLX7OZSkfEBA34wKtnoZ4asB6rWFJiLa=2+=fezqsCA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-ID: 482d1e84623c9fbc314
X-MBO-RS-META: nidfb7db56db5j1paino49m7hhpf1mit
X-Rspamd-Queue-Id: 4hfVcY4VJ0zKmBJ

On 9/8/26 2:02 PM, Geert Uytterhoeven wrote:

Hello Geert,

>> +&pfc {
>> +       msiof0_pins: spi-ws-2ch-canfd0 {        /* SPI_0 */
> 
> Node name should be "msiof0".

Do we also have to fix up 
arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk.dts this:

"
  755         msiof1_pins: sound {
                           ^^^^^
"
?

But I wonder, shouldn't the DTOs contain unique pinmux node names, which 
cannot accidentally overlap with the base DT or other DTO node names ?

>> +               groups = "msiof0_clk", "msiof0_txd", "msiof0_rxd";
>> +               function = "msiof0";
>> +       };
>> +};
>> +
>> +/*
>> + * PWM1 uses PWM1_B pin configuration for pin GP2_13. This conflicts
>> + * with SPI_1 CE_1 signal which is also on pin GP2_13. Disable PWM1
>> + * in case this hat is in use.
>> + */
>> +&pwm1 {
>> +       status = "disabled";
>> +};
> 
> Please move this node disabling pwm1 to the top, for compatibility
> with dynamic DT overlays.
Could you expand on that a bit ? What difference does the placement of 
this node make within the DTSO ? Please pardon my ignorance.

The rest of the review items are addressed in V2.

Thank you for your help!

-- 
Best regards,
Marek Vasut
