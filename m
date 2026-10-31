Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.67.36.66
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793448041;
	b=bYJ3Ya0S/5k/QayYnxjGP80Bt0l5MAzomZC35MoFQCZ/RkcYeJ2auDSrqvuBqv9iO7zn
	 AVXANZqzR89NFO3pZIW2xDhx8Y/fW95hPuEeceCzAiFlIkzfke115D+eJ4IpeKA+ec9lr
	 s2rnhkpeKwYQ0wxY9w+6HWllBrldH2ooRHB5QJdISqPfxQBtOG9QxWmwIPNJ7wPo8WV3F
	 dTHtCQrWk2oGKhnRVv+CJ1CiTHouu9m6IngtkLXG8QdW4ScPFfmRG5hNw4HygkFmmWz45
	 O+PN6lbR4rXeEVf8VxJOK2o0m9IpfxT6pVoM2JQdmmqz7DSMO+8vv/oCfAK/S/SI+Mw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793448041;
	h=DMARC-Filter:Received:DKIM-Signature:Received:MIME-Version:Date:From:
	 To:Cc:Subject:In-Reply-To:References:Message-ID:Content-Type:
	 Content-Transfer-Encoding;
	bh=Z8M3dkO8VWTPT7niqbjTbaNM/dFwMeWR+hAhAlcZSaE=;
	b=ewljs1WSI0n+pCoZ0+iIwR8GlTPAOcAEAygdCfeDkrFNbm0oEEFgC3ZZhgoMR7MEEiXe
	 F76DFM4iOIjhdj/UnWkgXgyH0Z0IcCragVKG6jgKSktnwCOE5H6dLPs/IkrsmsyG3CiX2
	 4+pPyuVsTSCOrLbvGJ8SPhl6t2HO+YNQc39gDXtA98+X11YMMuWX8Yrwd92MGRyDHk3jf
	 NNRMkjgp6f13Aqq6855iVcecS88/W/vWu1AYpTz8icSw7384bLRp2UOoiz42PfnmwSHp1
	 9wuIyYb1BInXExVTNZrn7mB7alA7RkGTWjCHIflQoOpoRiCSTNcD+yUoPn+HXkPk46g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=posteo.net;
	spf=pass smtp.mailfrom=posteo.net;
	dkim=pass header.d=posteo.net header.i=@posteo.net header.a=rsa-sha256 header.s=1984.8680eb header.b=SViwAUTN;
	arc=none smtp.remote-ip=185.67.36.66
Received: from mout02.posteo.de (mout02.posteo.de [185.67.36.66])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 710E1606A31C
	for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 12:00:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 710E1606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=posteo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=posteo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=posteo.net header.i=@posteo.net header.a=rsa-sha256 header.s=1984.8680eb header.b=SViwAUTN
Received: from submission (posteo.de [185.67.36.169]) 
	by mout02.posteo.de (Postfix) with ESMTPS id 36F8C240137
	for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 13:00:28 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=posteo.net;
	s=1984.8680eb; t=1793448028;
	bh=Z8M3dkO8VWTPT7niqbjTbaNM/dFwMeWR+hAhAlcZSaE=;
	h=MIME-Version:Date:From:To:Cc:Subject:Message-ID:Content-Type:
	 Content-Transfer-Encoding:From;
	b=SViwAUTNyMNFROcqxCKLRZ0BtFCXJiGPVADeeukqK0di9ogIQr6ItJKkAOtqMinfj
	 kJOPr+SRIoX84L4pjzNcpN88oRx7Zbku6KEYRxIJp3LaxArjBSeLIR26098z+ag9Qg
	 ik5LPtm8qBGDMTNnvEttlTzHKIGUQf/Xo8Gvr0EK5xLCs6P5XRb8xifbAWBx5fPGda
	 Z/ZZS8/yDZkp1uf2LWL65M6lPPjZa5wHk/QhkeB3MqfVBdxuuykARKqwvd4bKpjnjb
	 hg7od82KozrRp63nx/D/aREhvwT0zhUe8KmxWzIHLQPErC9HCCVgzKnUk2ffxELqVM
	 +oQad9jwQoRqQ==
Received: from customer (localhost [127.0.0.1])
	by submission (posteo.de) with ESMTPSA id 4jGxP55GZcz6tsb;
	Sat, 31 Oct 2026 13:00:25 +0100 (CET)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Date: Sat, 31 Oct 2026 12:00:27 +0000
From: mateusz.nowicki@posteo.net
To: Arnd Bergmann <arnd@arndb.de>
Cc: Marek Vasut <marex@nabladev.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Thomas BOURGOIN <thomas.bourgoin@st.com>, Rob Herring <robh@kernel.org>,
 krzk+dt@kernel.org, Conor Dooley <conor+dt@kernel.org>, Lionel DEBIEVE
 <lionel.debieve@foss.st.com>, Amelie DELAUNAY <amelie.delaunay@foss.st.com>,
 Patrice Chotard <patrice.chotard@foss.st.com>, devicetree@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, kernel
 <kernel@dh-electronics.com>, Geert Uytterhoeven <geert+renesas@glider.be>,
 "laurent.pinchart" <laurent.pinchart@ideasonboard.com>, Fabrice GASNIER
 <fabrice.gasnier@foss.st.com>, Stefano Babic <sbabic@nabladev.com>, Etienne
 Carriere <etienne.carriere@foss.st.com>
Subject: Re: [PATCH] arm64: dts: st: fix arm,smc-id of the SMC watchdog on
 stm32mp2
In-Reply-To: <cbcb8d78-51f3-41ab-80d6-fe3f0623da5c@app.fastmail.com>
References: <20260907091400.55954-1-mateusz.nowicki@posteo.net>
 <7ee09655-2fef-4334-b0aa-b56f7ae03f74@foss.st.com>
 <1b14e1e4-962f-4391-91fd-b09143641643@nabladev.com>
 <cbcb8d78-51f3-41ab-80d6-fe3f0623da5c@app.fastmail.com>
Message-ID: <f7010f07fdcdb4ff04a0dbfac1cc5421@posteo.net>
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit

Hi Arnd, Marek,

On Sat, Oct 31, 2026, Arnd Bergmann wrote:
> I think for the kernel it's pretty clear, we have to revert it
> to avoid the regression on old firmware, at least for boards
> that have ever shipped with that version. I count eight boards
> for stm32mp2 in upstream Linux, do we know how many of them
> are affected by the ABI break?

As the author of the patch, I looked at where both IDs come from.

0xb200005a only ever matched ST's *downstream* OP-TEE 3.19.0-stm32mp,
the base of the first OpenSTLinux releases for stm32mp25 (last update
2024-11-25). No *upstream* OP-TEE release ever used it on stm32mp2.

0xbc000000 is used by:
- ST's downstream OP-TEE since 4.0.0-stm32mp-r1 (2024-11-04), the base
   of the current OpenSTLinux releases, up to 4.8.0-stm32mp-r1
   (2026-10-27)
- upstream OP-TEE since 4.8.0 (2025-10-24), commit 11d68b6754
   ("plat-stm32mp2: enable watchdog SMC service"). Before 4.8.0
   upstream OP-TEE has no watchdog SMC service on stm32mp2 at all.

On the Linux side:
- 89fca38168c9 (v6.7, 2023-09) added the node with 0xb200005a, which
   matched the 3.19 based firmware of that time.
- 7a57b1bb1afb and e9b03ef21386 (v6.15, 2025-03) added stm32mp21 with
   0xbc000000 and stm32mp23 with 0xb200005a on the same day.
- ae4d08bbe3f4 (v7.4 merge window) moved stm32mp23 and stm32mp25 to
   0xbc000000.

So from v6.7 to v7.3 the watchdog never worked with upstream OP-TEE,
nor with ST's own firmware since November 2024: arm_smc_wdt fails to
probe with -EIO and an IWDG started by the boot loader is never
refreshed. That is how I found it on a STM32MP257F-DK with upstream
OP-TEE 4.10.

A revert would move the breakage to everybody running current
firmware. For stm32mp23 there is nothing to restore: ST's OP-TEE
supports stm32mp21 and stm32mp23 only since 4.0.0-stm32mp, so
0xb200005a never matched any stm32mp23 firmware.

About the boards: arm_wdt is enabled on all eight.
- stm32mp215f-dk is not affected, stm32mp211.dtsi always had
   0xbc000000.
- stm32mp235f-dk and stm32mp23xx-dhcos-bb can only run firmware with
   0xbc000000.
- That leaves the stm32mp25 boards: stm32mp257f-dk, stm32mp257f-ev1,
   stm32mp257d-engicam-microgea-rmm, stm32mp255c-dhcos-dhsbc and
   stm32mp25xx-dhcos-bb. Only those still shipping a 3.19 based OP-TEE
   need the old ID.

So I would suggest the opposite direction: keep 0xbc000000 in the SoC
dtsi, which matches upstream OP-TEE and current ST firmware, and let
the boards that shipped with the old firmware override it in their
board dts:

&arm_wdt {
         arm,smc-id = <0xb200005a>;
};

Marek, would that work for the DHCOS boards? I can send the patch if
you tell me which of them ship the old OP-TEE. Your OP-TEE change to
accept both IDs is a good mitigation on top of it for anybody who
updates the firmware.

Best regards,
Mateusz

