Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.67.36.66
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793808967;
	b=TpXqDcbBvjA4gOlNoaMvkr5a+fCPPQ+ktnCfpLGdZp0wJnyxLlSrTRVsjEMi6goJ5pt3
	 Mf4VTgw4wHo7HPzY11kszJDU/BpsyduFDOlm627pkyHf21aawda2ZZo8jCfehMGINPEVu
	 bdmsuMYhL4gEGJaEEfnyAtT5K6QgfQgWrUCkBc+OwTkSbTguce8LcoI5BS/dZSC3cNRkN
	 Cd4v8uXbDeoc3dRMX0H6llXzvvt7ZxXu3I3rAGYmYvRAlA2y8v4kYA2iycRa6jRYtLBpK
	 UymTRfUAMMHFHy2F0o2K7mUX19NMmkHSc81F71+TGpIhqNl84xH7ON1D960N7PStPsQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793808967;
	h=DMARC-Filter:Received:DKIM-Signature:Received:From:To:Cc:Subject:
	 Date:Message-ID:MIME-Version:Content-Transfer-Encoding;
	bh=uSL4WCFdu/8AH47XVLkok2dck+ry3uGzMw20szqHJBM=;
	b=4DpFD3fiHstED7unPSOBs9TS0e9UTC65qY50GzLLcS+NEtWHw3pX0IjiNucYSnSWG8hG
	 i0bG2d0YtVZ/nGskcorg42NLazWYvJ7HMiOChjF4qT1Mcm+R2LJyKClOe7BoQaLb5xy5T
	 1E0HZcE94BbjXOSjQJisu9FIm56FyYVzAac0oAZeFI6EgB/fUAqwyfFsPw682sdNkEf2i
	 WvxKf7w7tn5F0VW0hpkLXIAio3uDyDsI44Jma1z7ieOps2/2fR0yBopPWbxgiBFMhcGru
	 UJyzUtDeHsJY07KSR7A8++F/v3S2v28URk3vEsHmVcZqqYTS3M9l/8rBKIpacgNKGnQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=posteo.net;
	spf=pass smtp.mailfrom=posteo.net;
	dkim=pass header.d=posteo.net header.i=@posteo.net header.a=rsa-sha256 header.s=1984.8680eb header.b=jx7AZzau;
	arc=none smtp.remote-ip=185.67.36.66
Received: from mout02.posteo.de (mout02.posteo.de [185.67.36.66])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9973E606A328
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 16:16:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9973E606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=posteo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=posteo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=posteo.net header.i=@posteo.net header.a=rsa-sha256 header.s=1984.8680eb header.b=jx7AZzau
Received: from submission (posteo.de [185.67.36.169]) 
	by mout02.posteo.de (Postfix) with ESMTPS id 8160F240101
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 17:16:03 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=posteo.net;
	s=1984.8680eb; t=1793808963;
	bh=uSL4WCFdu/8AH47XVLkok2dck+ry3uGzMw20szqHJBM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:
	 Content-Transfer-Encoding:From;
	b=jx7AZzauITfBef6KYUAEf6GHPCWor4fyfgidwB+08Cc/9M2rKbMEedBDWBNCOQ+a5
	 uxCIUFJbyKDA0M72lUY/FXyq/miyk6yFZ3E0j3xxUojrtkOHZn2Tcv44DCtQGHJ97H
	 GHtt6ohVFl14a5eYc4nqTXX70bVyzH8bRbJfb7O7Tpu5KyXq9MLYP3a1WwE8ZX6Yx8
	 BryyChw3QaG95eW7bJI4tNzI3WhHWsGRX2YhPufltmJV9gZ0koOjhAhfOO0jIchDeq
	 c/yYGWSUKc6uLTUYCLZTAd76GHIA5ukKhpDHRH7xVWM/NEWtr8w44n0O2BKMmGcxkV
	 +D7CPHPffigEw==
Received: from customer (localhost [127.0.0.1])
	by submission (posteo.de) with ESMTPSA id 4jKVt83CGdz6twJ;
	Wed,  4 Nov 2026 17:16:00 +0100 (CET)
From: Mateusz Nowicki <mateusz.nowicki@posteo.net>
To: Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	linux-watchdog@vger.kernel.org
Cc: Mateusz Nowicki <mateusz.nowicki@posteo.net>,
	Julius Werner <jwerner@chromium.org>,
	Evan Benn <evanbenn@chromium.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Antonio Borneo <antonio.borneo@foss.st.com>,
	Marek Vasut <marex@nabladev.com>,
	devicetree@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [RFC PATCH 0/3] watchdog: arm_smc_wdt: allow a list of SMC function ids
Date: Wed, 04 Nov 2026 16:16:02 +0000
Message-ID: <20261104161553.30115-1-mateusz.nowicki@posteo.net>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi all,

this follows up on Marek's report about the stm32mp2 watchdog [1].

A quick recap: the arm,smc-wdt driver talks to the firmware through one
SMC function id that it reads from the device tree, and there is no way
to ask the firmware which id it uses. On the STM32MP2 SoCs that id
changed over time. ST's OP-TEE from ecosystem v5 expects 0xb200005a,
their 4.0.0 fork accepts both, and the 4.8.0 fork as well as upstream
OP-TEE only accept 0xbc000000.

My earlier patch, commit ae4d08bbe3f4 ("arm64: dts: st: fix arm,smc-id
of the SMC watchdog on stm32mp2"), switched the dtsi to 0xbc000000. That
made the watchdog work with current OP-TEE, but it broke boards that run
the older firmware. So today 6.18.y uses one id and 7.4 the other. When
the kernel and the firmware disagree, nobody pets the watchdog that the
bootloader started, and the board resets after 32 seconds. Marek hit
this even with a recovery kernel, which is about the worst place for it.

The idea from that thread: let arm,smc-id be a list. The driver tries
the ids one by one and keeps the first one the firmware accepts. Older
kernels only read the first cell, so they behave exactly as they do
now. For stm32mp2 the list is <0xbc000000 0xb200005a>. Calling an id
that belongs to some other firmware service would be bad, so the
binding says the list may only hold ids known to be this watchdog.

Why RFC: arm,smc-id already exists in firmware/arm,scmi.yaml as a plain
uint32, and dt_binding_check complains when another binding turns it
into an array:

  arm-smc-wdt.yaml: arm,smc-id: multiple incompatible types: uint32-array
  arm,scmi.yaml: arm,smc-id: multiple incompatible types: uint32

DT folks, is there a way to keep the list in arm,smc-id that you would
be fine with? If not, I can move the extra ids into a new property,
something like:

  arm,smc-id = <0xbc000000>;
  arm,smc-alt-ids = <0xb200005a>;

The driver side would stay the same, it would just read the fallback
ids from the other property.

One more question: should patches 2 and 3 go to stable as well? Then
6.18.y would also work with both firmware generations. The 6.18.y
version of patch 3 would turn its 0xb200005a into the same list.

[1] https://lore.kernel.org/all/1b14e1e4-962f-4391-91fd-b09143641643@nabladev.com/

Mateusz Nowicki (3):
  dt-bindings: watchdog: arm-smc-wdt: allow a list of SMC ids
  watchdog: arm_smc_wdt: try every id of arm,smc-id
  arm64: dts: st: list both watchdog SMC ids on stm32mp23 and stm32mp25

 .../bindings/watchdog/arm-smc-wdt.yaml         |  9 +++++++--
 arch/arm64/boot/dts/st/stm32mp231.dtsi         |  2 +-
 arch/arm64/boot/dts/st/stm32mp251.dtsi         |  2 +-
 drivers/watchdog/arm_smc_wdt.c                 | 18 ++++++++++++------
 4 files changed, 21 insertions(+), 10 deletions(-)


base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
-- 
2.56.0

