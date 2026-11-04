Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.67.36.66
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793815847;
	b=3o3LKdW2rnVXSfMfu7Z8mqOxT5jMD0Khq25iRHTiW5QlTcr+Z91H5VN2vEyxhEzPubVh
	 slQyHtOuBvhwU3wUnkuuhp2zqCRv9VTjxTUxgx45lVrR3UY98lNJoOlnoR8gw5nIS7CDc
	 YM+tJGuDvScj4Kkd2SnK3/SVn4DK0u2xbHyxenw8snfvnxuDXCdNwH3QgiEXTZxFVdyze
	 zRbmcIbFKMCG1J0zETp2qCMzRr73DVAHWElhEgYR9NHMp5vlj9O70dfuM/RiAZSkwNCfz
	 xZUSiywyjMdIGQw6iP6Ky4u89hnTNltIKXcFwBNoIu0r+rEOSzSpT/4hAKmb1euJrww==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793815847;
	h=DMARC-Filter:Received:DKIM-Signature:Received:MIME-Version:Date:From:
	 To:Cc:Subject:In-Reply-To:References:Message-ID:Content-Type:
	 Content-Transfer-Encoding;
	bh=9WkmYf7R4SGzBZAROx5aLx/oJoqChBMmnepUumVTYnk=;
	b=tt6UmVqBQzBbhLLWPwiKJVGk7djgJoC/vEO+na2xp8leyeubOtyxNXUREDLlFaj4mE5u
	 tworzj36XuQuh7Hl3b+l4L/MSL42sGBv7zHMM3g8tak0edsik17JioTnCgZ6EnSf4BPyl
	 WhlTyGNS6cFXSIXT9G4blVG7cV7bbcM4ofqMB9EOqv4DfkDF/0eTUKNjUIRf7LmYmDfFi
	 TE7qVgjvuUqARHmT8gi4opUYmYX27YqiGtrYl5o4+2i6KHCh0fwFIs4HW4Eli/MePJyp4
	 mCoh/HGvpr/WSGpIU0FDloAqUwZLaoDOAksf76icPpmBfTOK/0/DFIHfW6f7qZL0dXg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=posteo.net;
	spf=pass smtp.mailfrom=posteo.net;
	arc=none smtp.remote-ip=185.67.36.66
Received: from mout02.posteo.de (mout02.posteo.de [185.67.36.66])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34C63606A334
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 18:10:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 34C63606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=posteo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=posteo.net
Received: from submission (posteo.de [185.67.36.169]) 
	by mout02.posteo.de (Postfix) with ESMTPS id 8BB7224010C
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 19:10:38 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=posteo.net;
	s=1984.8680eb; t=1793815838;
	bh=9WkmYf7R4SGzBZAROx5aLx/oJoqChBMmnepUumVTYnk=;
	h=MIME-Version:Date:From:To:Cc:Subject:Message-ID:Content-Type:
	 Content-Transfer-Encoding:From;
	b=OF6qrx+wODiEsY1kg24OzHlmcY2J44GmixT/URw+Uy5VIKGWpJNE4lPIzbf2cFLm/
	 Z+1wptDWDG9bE6XRM249mIGrFXML9cOMdFAAx0AXXY3XxqgOP1RIdYu+Bc5tlrkLA+
	 cRcIOgaXaKt6PIet5xGHw6S85D+Krwh7O8KvduIrzB6LTDDrt2XtN/QuAul5MHtMNy
	 aJKd/8671w5XeTM4zQ2/wbHVuivELjBqUK3IrFHClTuHTPGiN9sicwsomGJsD3tJz3
	 CwVYHTFXWzPaQ8KTarQkS8fEPViApMpgRdRNyCpZsGqJthE9UZzGc5oANGK5WpeHGb
	 au9fPBHkeuUMA==
Received: from customer (localhost [127.0.0.1])
	by submission (posteo.de) with ESMTPSA id 4jKYQN2xfgz9rxN;
	Wed,  4 Nov 2026 19:10:36 +0100 (CET)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Date: Wed, 04 Nov 2026 18:10:37 +0000
From: mateusz.nowicki@posteo.net
To: Guenter Roeck <linux@roeck-us.net>
Cc: Wim Van Sebroeck <wim@linux-watchdog.org>,
 linux-watchdog@vger.kernel.org, Julius Werner <jwerner@chromium.org>, Evan
 Benn <evanbenn@chromium.org>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Maxime
 Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, Antonio Borneo <antonio.borneo@foss.st.com>,
 Marek Vasut <marex@nabladev.com>, devicetree@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH 0/3] watchdog: =?UTF-8?Q?arm=5Fsmc=5Fwdt=3A=20allo?=
 =?UTF-8?Q?w=20a=20list=20of=20SMC=20function=20ids?=
In-Reply-To: <c742c878-d4b2-48d8-972e-a09aa4d215c7@roeck-us.net>
References: <20261104161553.30115-1-mateusz.nowicki@posteo.net>
 <c742c878-d4b2-48d8-972e-a09aa4d215c7@roeck-us.net>
Message-ID: <37f9e5e73070972f224583bc1581e400@posteo.net>
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit

On 11/4/26 Guenter Roeck wrote:
> On 11/4/26 08:16, Mateusz Nowicki wrote:
>> My earlier patch, commit ae4d08bbe3f4 ("arm64: dts: st: fix arm,smc-id
>> of the SMC watchdog on stm32mp2"), switched the dtsi to 0xbc000000. 
>> That
>> made the watchdog work with current OP-TEE, but it broke boards that 
>> run
>> the older firmware. So today 6.18.y uses one id and 7.4 the other. 
>> When
>> the kernel and the firmware disagree, nobody pets the watchdog that 
>> the
>> bootloader started, and the board resets after 32 seconds. Marek hit
>> this even with a recovery kernel, which is about the worst place for 
>> it.
>> 
> 
> So the DT on the board is updated to use the new ID but the firmware 
> itself
> isn't ? That seems a bit odd; I would have assumed that the DT on a 
> board
> is kept in sync with its firmware. Is that not the case here ?

Not necessarily. On these boards the DTB is built from the kernel tree
and installed with the kernel, U-Boot just loads it from the boot
partition. TF-A and OP-TEE sit in the FIP and are updated separately, so
updating the kernel alone changes the ID. That's how Marek got hit: he
updated OP-TEE, but his recovery kernel still had the old DTB.

>> The idea from that thread: let arm,smc-id be a list. The driver tries
>> the ids one by one and keeps the first one the firmware accepts. Older
>> kernels only read the first cell, so they behave exactly as they do
>> now. For stm32mp2 the list is <0xbc000000 0xb200005a>. Calling an id
>> that belongs to some other firmware service would be bad, so the
>> binding says the list may only hold ids known to be this watchdog.
>> 
> 
> Would it possibly make sense to check keep a list of known IDs in the
> driver ? It already checks 0x82003D06, so it might as well check a 
> sequence.

Fine with me, and it avoids the binding issue. I'd just rather not try
the ST IDs on every platform, so how about making the list per
compatible:

   compatible = "st,stm32mp25-smc-wdt", "arm,smc-wdt";

with { 0xbc000000, 0xb200005a } as match data for it. arm,smc-id stays a
single u32 and, if present, is tried first. Older kernels just match
"arm,smc-wdt" and behave as today.

If that works for you and the DT folks, I'll send v2.

Thanks,
Mateusz

