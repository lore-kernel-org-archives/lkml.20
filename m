Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792492034;
	b=OLu2FGH+dL0iwIyE3h8o+evpWYMGzyuLZx0scb00F8K3wO63y9pdAebdPRh7ROFjOSPN
	 0k78N+DWgQr76vCbzr6ZkeGb/C/J0WbRL+3xubsO1Fi/g1RFceeq4FAMV+bekcQH+75pq
	 +EICZzOliWnL7Bpv2OTGBJJZFLkSocm8UPJTzwVQodWIdzdH2g4CCmkONkDnPmFILunuT
	 vykHpjG2NC+Aw6pINuWj93e5R/eFp+/sF050XMgkP8AV/5BZUF1Kiq9kvXXQH1v53w7Os
	 Q5NOEdvvetLGqXpvVZ8SAOqjHBAxNB4aZEv2vgN5SUtisVCzoCSqToIPleVyCKcvabA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792492034;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=tOO8LLtus8o6/inhpe0YWQcXC1mwDs28nW+1hVPanPk=;
	b=G3hggDmh7goybAndhkvBgLZW4vaii6hkxu86YGktCnAE5udIqMi8wPBocEojRMk7m087
	 97e1nwf36sSbZ5kMGXgUeIFa+JQhCBSRNtluf8R3K+6hJiwGYzmQQMTPt0v89uol4ylTK
	 0OBexqgqEIaJqtaN7rL57v2Vzqb0frgMLRKrUVtscujK60BAGRY+WpIcJbUfbVEXSrtlP
	 60qVKya7iHBmqmxmuQ59B4DfuBZwEcCFiHQ75rHyoflyc3Kc6eIB0WJGQmGQscL6hEiXO
	 yA50m2fxFTgFa0MlxTwpgBD04eHSslNzxM83x7lFc9gLWYkrSkG8hEThLysAHCCp96g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=IHFfeuOY;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAB31606A327
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 10:27:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=IHFfeuOY
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A83FE1F000C4;
	Tue, 20 Oct 2026 10:27:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792492033;
	bh=tOO8LLtus8o6/inhpe0YWQcXC1mwDs28nW+1hVPanPk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=IHFfeuOYfTjW3gN9EhnLWsivF0HIylOHGifum4OnPuXEPnRR82ya3dduk0zuncUan
	 6QFEn86yHdsVGWI9XZSR9jJsqMJ7j4K4ZJN/bWUQL+2FHNc7w/lUDGmc+4UD5EEb98
	 OSSLuAy7MIkNp2BdgLjnWmYVjDgkga9NVSkNrZS2EIbFKcAOVmaPgxjU2KJ2bAvwc9
	 /Rgr6YOi2euNWxCS0c+xX+WiyB/ywWpZpwNVjCaMRk69EwqCkGzEURQqiYx10Ja7Kn
	 7q2IAZSx0/3RhaiV+p3Fo75iYGTGr4hGXeSm3j8X2DZv8sY3hKA/OYMYTOkBqSiGCU
	 hAxxv7xmYkMjA==
Date: Tue, 20 Oct 2026 11:27:09 +0100
From: Lee Jones <lee@kernel.org>
To: a0282524688@gmail.com
Cc: linux-kernel@vger.kernel.org
Subject: Re: [PATCH v9 00/12] mfd: nct6694: Refactor transport layer and add
 HIF (eSPI) support
Message-ID: <20261020102709.GG1206986@google.com>
References: <20261013063259.2734757-1-a0282524688@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261013063259.2734757-1-a0282524688@gmail.com>

On Tue, 13 Oct 2026, a0282524688@gmail.com wrote:

> From: Ming Yu <a0282524688@gmail.com>
> 
> The Nuvoton NCT6694 is a peripheral expander that provides GPIO, I2C,
> CAN-FD, Watchdog, HWMON, PWM, and RTC sub-devices. Currently, the
> driver only supports USB as the host transport interface.
> 
> This series refactors the NCT6694 MFD driver to support multiple
> transport backends and adds a Host Interface (HIF) transport driver
> that communicates over eSPI using Super-I/O shared memory.
> 
> Patches 1-4 fix pre-existing bugs in the current driver. They carry a
> Fixes tag and can be picked up independently of the rest of the series.
> 
> Patches 5-11 isolate the USB transport, extract the transport-agnostic
> core into nct6694-core.c and wrap the firmware command interface behind
> regmap, so that the sub-device drivers no longer depend on the
> transport. Patch 12 adds the HIF transport on top.

Please fix or respond to the Sashkio reviews on patches 6, 9 and 12.

-- 
Lee Jones
