Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=185.203.200.13
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794909149;
	b=ZqjmCa354SUEHZw8a+4ZD/5RMDzKTrMKTHu02WnuctBMOC04QwnEKJMiaEJVkZHERfgW
	 1QN4FenTbiRveNor2AluaqCybDO8JAG9vT55HOUjFFubXkamkEnxNwToN19pS2ow7s+M+
	 KOGzdxkzFK5R6kx/LXF2QU2r4Yt0QDrSbnzfLiBCaaN6OC944BswMmWYxySTHXpsNbQ4i
	 98XVf8wYS4rism9MGtd5FTOTrrElvvw+BAcjXgfXclsHwN2Lws6vGTkrPeMhrHXYUHsPk
	 kzTQp7VT8VWuZzPTjCipwNfSysp8SsY7OXGFfR3WyQf3qDHe589QEDj7nB133bNzofw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794909149;
	h=DMARC-Filter:Received:DKIM-Signature:Message-ID:Subject:From:To:Cc:
	 Date:In-Reply-To:References:Content-Type:Content-Transfer-Encoding:
	 User-Agent:MIME-Version;
	bh=bYyhq2g9GW6Daj57foPe9lZBcRmom318RZsPjUOH7DM=;
	b=Ac8kUYXbwlx9KAWeijlmEckD6oYDJYZFcffdM+4gf+nsik8UT6SFmuHkuSa8ZhmSO2yp
	 TvOjjb1O8Y8IXtf3qPKKwLGro0dEZ1/oJkUcJsDoriNCChaliUSMWYE48jLuVvLaet77P
	 5VrOwlWeAtCZE7qTCFZrLLlPIqIwQ3LL6I+tI3Ot+mhgtU/0kAJL69k849AzXtuj28zy0
	 1Uf0AtvbrtljGehogikmsceDls+t5VVtzMup7/HpBCkEyoPZHoW25KXOW5iSvmolqEQZD
	 GlKnvSb2Xh02ZrsKevCZ0C5Aq5EVmdy6p72Mz1iLhXKWST1AtGs1iKSEzIk+EHcLdAg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=pengutronix.de;
	spf=pass smtp.mailfrom=pengutronix.de;
	dkim=pass header.d=pengutronix.de header.i=@pengutronix.de header.a=rsa-sha256 header.s=20260414 header.b=JceQ8P1Y;
	arc=pass header.oldest-pass=0 smtp.remote-ip=185.203.200.13
Received: from mx1.white.stw.pengutronix.de (mx1.white.stw.pengutronix.de [185.203.200.13])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3312606A323;
	Tue, 17 Nov 2026 09:52:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D3312606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pengutronix.de header.i=@pengutronix.de header.a=rsa-sha256 header.s=20260414 header.b=JceQ8P1Y
Received: from [IPv6:2a0a:edc0:0:900:1d::4e] (lupine.office.stw.pengutronix.de [IPv6:2a0a:edc0:0:900:1d::4e])
	(Authenticated sender: pza@pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id 28C8B2010F9;
	Tue, 17 Nov 2026 10:52:27 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1794909147;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bYyhq2g9GW6Daj57foPe9lZBcRmom318RZsPjUOH7DM=;
	b=JceQ8P1YvvcAgYJe7ihzL79J+o4hSD5fBVrWZec7zdzGh1s8i2AJYtx2p/QzoWU6WjWaGL
	CwMgoajk/LFSC7yH8AzOb0z/1a9httn+J/kidbA0a1kD6ZW6hDpv6poXE2c0dMcPy4tbOe
	jaqfCFUWF8ydzcI+P3vpTb7ykPVuMEaw9OPraptgxdevsX4LE1U2qok29FkfiJB63DJyeD
	fiUAQPST64VUtQIqWMVlMx+93pwz7yPMc/LqXTn2BbzQmRnxCAQcuqShzS604eS+fKd6S4
	+BJuFZ+guxMflFI4PQOro7TUcQvJHm13dsWP2bAitTG+E0EU92y6Smx3ayJqLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1794909147;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bYyhq2g9GW6Daj57foPe9lZBcRmom318RZsPjUOH7DM=;
	b=XZQvq75YBL1+uEU3EaDlT52RCB43Byu8CLLP6R90nJivPase/iN90zEHO40pYvO/andz+j
	Jf7SMB2C1GqahaNNM4X7WkMcTCQZX2nJND0IAR1YkiSdJFIInKOvl+sdATPT64reO0s0Vl
	pH1xSG31jRUFcj9npZV3Hz6ZgILKQ3dgZIymtTFgRNSSWw2Dt12QHKQ74YrXA7zPzIq/+4
	0/NGs2rr8+Pto1MaF1qF7BEfTZY4eHu30ww+pCsw6wnhhRqYLMhOGb8I3epoGLtHFMnD/b
	AKVsAAPbpw+5P3FDLavMqxnZL3KjCs2HKe0bg2bNctrlSLFkNyuvKv24XeaRFQ==
ARC-Seal: i=1; s=20260414; d=pengutronix.de; t=1794909147; a=rsa-sha256;
	cv=none;
	b=VV9LGLlnv/oGiiBz0WfRrETpok+uxCmmgd+unQ0oAcBTjK4dailFv0RYDYI6hSYmbec1MR
	B7zP79noqz793nU12SNN+qYk4Tiy6OCdDlYcSG42TDQLGZCDhIuULZJGnKN0qVQBrkYbVv
	4+Ag2GICR7TlFXAcbtMWl1/KC0fJJNaRDM2TOy0hRby5QvRcWwWmcuADQVMw91BjQr1ZAt
	LN62xLqZxRpaFtidn6LVi9+FFBXKpL5t+ht+jFRmbsOmpNCNqzOXvwtKqabt/2MBtZpYpN
	uWgRydYQNROvPA/trSv+oidm5VlCrGeLSUBi8rbbPVbD/9rjEYrNdi9G/c05eA==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=pza@pengutronix.de smtp.mailfrom=p.zabel@pengutronix.de
Message-ID: <8b5be415e255b5387099d9f8a9b8f5f05d4cb038.camel@pengutronix.de>
Subject: Re: [PATCH v2 2/5] clocksource/drivers/spacemit: Add K1 timer
 support
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Troy Mitchell <troy.mitchell@linux.spacemit.com>, Daniel Lezcano	
 <daniel.lezcano@kernel.org>, Thomas Gleixner <tglx@kernel.org>, Rob Herring
	 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley	
 <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>, Paul Walmsley
 <pjw@kernel.org>,  Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
 <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev
Date: Tue, 17 Nov 2026 10:52:27 +0100
In-Reply-To: <20261117-spacemit-soc-timer-v2-2-9264d0ea7755@linux.spacemit.com>
References: 
	<20261117-spacemit-soc-timer-v2-0-9264d0ea7755@linux.spacemit.com>
	 <20261117-spacemit-soc-timer-v2-2-9264d0ea7755@linux.spacemit.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

On Di, 2026-11-17 at 09:45 +0000, Troy Mitchell wrote:
> SpacemiT K1 and K3 have APB timers that can provide a shared clockevent
> alongside the per-CPU RISC-V timer. Use counter 0 and its first match
> comparator as a oneshot device available to the tick broadcast framework.
>=20
> Counter enable changes cross clock domains. Wait for the synchronized
> counter value to stop changing before reprogramming the match register,
> and check interrupt acknowledgment through the status register rather
> than reading the write-only clear register. Bound all synchronization
> waits and propagate programming failures to the clockevent core.
>=20
> Obtain the counter rate from the functional clock and protect it against
> rate changes. Keep the clocks enabled for the clockevent lifetime and
> restore counter configuration through the tick resume callback without
> sleeping clock operations. Use a platform driver so clock and reset
> providers can probe before the timer is registered.
>=20
> Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
> ---
>  drivers/clocksource/Kconfig          |  11 ++
>  drivers/clocksource/Makefile         |   1 +
>  drivers/clocksource/timer-spacemit.c | 317 +++++++++++++++++++++++++++++=
++++++
>  3 files changed, 329 insertions(+)
>=20
> diff --git a/drivers/clocksource/Kconfig b/drivers/clocksource/Kconfig
> index da83483296d5..3e7dd5d628cd 100644
> --- a/drivers/clocksource/Kconfig
> +++ b/drivers/clocksource/Kconfig
> @@ -163,6 +163,17 @@ config RZN1_TIMER
>  	    - 2 32-bit timers
>  	  Two timers blocks are available in RZ/N1 SoCs.
> =20
> +config SPACEMIT_TIMER
> +	bool "SpacemiT K1/K3 timer"
> +	depends on ARCH_SPACEMIT || COMPILE_TEST
> +	depends on OF && COMMON_CLK && RESET_CONTROLLER && HAS_IOMEM

Drop the unnecessary RESET_CONTROLLER dependency,=C2=A0the reset controller
API has stubs for consumers.

regards
Philipp
