Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28E6D558210
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 12:36:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788957421; cv=none; b=Zo0DwQQl3rjZiNNB2YkH3oEEqEEdXM6FHs/ytw6haT90JQPnlxRNrDekESakFfBdPkPGgh9ULDMWt7YjNRxVcxDrTCPxrWUW3tuQYWelTv2Fnnz4k6gOYe+EC8+v+6lwRR1oOLijn0jP/whFlP6aVriGfSnS/dM3trxzAiIA9dc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788957421; c=relaxed/simple;
	bh=XSCnxnw2vIKb1vWqNs/tkiIi/t1rD6/OK4yeDLOfxnI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nqM7DOhTCtnVjwEH21nNx6WbumTmH/KC9kvOEqS1YxuIALxoPFKNGqPAxu6BPDinLUubeKM7rliEbT1bVXvy3VuV88Glze2Xps0RQO2+YEV4d2L7DW4gl6vhVl5KsTWodcHpFP1gwJUEjpcFWJXJi9tFDtn8mbOe32OtKw0mqWE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=OhJqggxp; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="OhJqggxp"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 60B561A1A77;
	Wed,  9 Sep 2026 12:36:56 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 21BA760448;
	Wed,  9 Sep 2026 12:36:56 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id A071A11C7AF5C;
	Wed,  9 Sep 2026 14:36:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1788957410; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=5hSPgxCn/ZUJvH2rUgbxv1Y3vIU11P7lvbOo9zrImYM=;
	b=OhJqggxpTs7+mr88LdRjgSy8IUEUo7w9T4+Ri9PNp0fVsUEybhEwVLl+t20/sLoIPz5BTo
	5in5bGXCXtswxPMEgnYZD98V1PJJedA9VrBCIpaWQ11MjqNSDYPvKgubPLFJ+q80PWsS9U
	RQrr79ivkn9KhcJXrKxKTsxgGs8t1PkBv1TPt9u01akvjolH5uLGhXpYcUMLByeeR+WCsY
	kyQrrhyH9A8FrnejSgVMFxQbSoJ9zCkL/wxwr9ceBtxxJ0iASiuAiA/inzx0L31NwG0uBy
	vxpVzTZn9Mqop1Ftb3k2JpIcXHGq0kqc6iEtmb9UHsOPcRjEe/qsmNvPxeAo6w==
Message-ID: <eb8cf1f7-a272-47bb-b504-a91b8a9a2608@bootlin.com>
Date: Wed, 9 Sep 2026 14:36:37 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net 2/6] net: stmmac: selftests: Validate EEE based on the
 actual LPI timer value
To: Nicolai Buchwitz <nb@tipi-net.de>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, davem@davemloft.net,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Russell King <linux@armlinux.org.uk>,
 Heiner Kallweit <hkallweit1@gmail.com>,
 =?UTF-8?Q?Alexis_Lothor=C3=A9?= <alexis.lothore@bootlin.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Emil Renner Berthing <kernel@esmil.dk>,
 Minda Chen <minda.chen@starfivetech.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Jan Petrous <jan.petrous@oss.nxp.com>,
 Ovidiu Panait <ovidiu.panait.rb@renesas.com>, Jose.Abreu@synopsys.com,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 thomas.petazzoni@bootlin.com, linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, PKneuper@dspace.de,
 David Laight <david.laight.linux@gmail.com>
References: <20260909074740.1247762-1-maxime.chevallier@bootlin.com>
 <20260909074740.1247762-3-maxime.chevallier@bootlin.com>
 <00bfad8f52784677c6042ccd6c3fd6ed@tipi-net.de>
Content-Language: en-US
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
In-Reply-To: <00bfad8f52784677c6042ccd6c3fd6ed@tipi-net.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3



On 9/9/26 13:40, Nicolai Buchwitz wrote:
> On 9.9.2026 09:47, Maxime Chevallier wrote:
>> The EEE selftest is a 2-step test :
>>  - It validates that we enter in LPI mode with the
>>    irq_tx_path_in_lpi_mode_n counter
>>  - It then validates that we exit LPI when sending a frame, with the
>>    irq_tx_path_exit_lpi_mode_n counter.
>>
>> The current state of the test lacks 2 main things :
>>
>>  - We don't know exactly when was the previous frame sent (it's from the
>>    previous selftest)
>>
>>  - The timeout is hardcoded, while the LPI is entered after a
>>    user-configurable delay. On top of that, the timeout loop uses a
>>    pre-decrement iterator (--retries) that actually only iterate nine
>>    times, so 900ms while the default LPI value is 1 second.
>>
>> Let's therefore make it more deterministic :
>>
>>  - Send a frame at the beginning of the test
>>  - Wait for more than the lpi timer value, we timeout after about twice
>>    the value,
>>  - Then send another frame, and verify that we do go out of LPI, also
>>    with a timeout.
>>
>> Note that the test's goal isn't to validate the LPI timer value itself,
>> only that we enter/leave LPI mode.
>>
>> Fixes: 091810dbded9 ("net: stmmac: Introduce selftests support")
>> Signed-off-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
>> ---
> 
>> [...]
> 
> Forget to mention in my last comment:
> The series seems to be broken. I can't find patch 3 and also the cover
> letter is missing on lore and my inbox?

Huh that's strange indeed, it's on lkml but not netdev@ ?

https://lore.kernel.org/lkml/20260909074740.1247762-1-maxime.chevallier@bootlin.com/

meh I'll resend if need be

Maxime

> 
> Nicolai

