Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=65.109.113.108
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793854619;
	b=zEip8wwsK81ET8s6NHLtzEiin1Gjqo9qBzrZM9+u87dmEE1sWX23HKOywhECcK+OOymd
	 Gon9UdykTW+/5kX6q0vY1BwPkD0gHrA1IVpM+hgKZfXsshJzXv+x15bYKKTfOnlMMvKNE
	 bO3p/bZO5GUPqHPg7YV8QAKDdveGhw/2m3apsPzXu7ext5b0RB4POZnWVH9ZLNsB8L6CH
	 ppx1xOn9yS8h8RpTevGtJcybzWqXD6b0AhOKmFsdGsfeJbL2+8O9jDw+4A0DMyv/uNpb2
	 D3SvpeD7qvJyBx1pWRjurPPmfNqfeUTQq9ViCirJKFAgS9OuLJyGh1zhLvtCxghhhMQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793854619;
	h=DMARC-Filter:Received:X-Virus-Scanned:Received:DKIM-Signature:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=iu+wu+Zx/NtlCLRN5PCs/YxG7yDVrWiVNMra53EYeJw=;
	b=W4iBFSGgk9Ns+JbARNua/2vpfxKakpgIPs4twlZepQFGNW7h+gohHdxJBMY+lfEa5Hci
	 /ScAtx034zWZhd1ePfX/7AxNwa9BPZkUFl72+3z9FJ6c7AOHuorHZtE5S/uP6s744scTM
	 dZi7rlFAUuZAZ9ld5q0Wbbg5dnwkQm9tbTTtBbl67SvJDg/OWJGXPpaVHlvcvWWjSRFQh
	 HIlF6h/CdpWSUN3/y5XR1PDZ+RcCNvuTWOEA98+wjat0LALoQDkJBalbiRqh/38xogykO
	 MF5iWfaORhA4lzy7HPTzJdmI7zPM+lVc2k7fuBu3VjGADNx/0GR9nAjQKWGF1UIZl/g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=alien8.de;
	spf=pass smtp.mailfrom=alien8.de;
	dkim=pass header.d=alien8.de header.i=@alien8.de header.a=rsa-sha256 header.s=alien8 header.b=GF7ywrzT;
	arc=none smtp.remote-ip=65.109.113.108
Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35011606A328;
	Thu,  5 Nov 2026 04:56:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 35011606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key, unprotected) header.d=alien8.de header.i=@alien8.de header.a=rsa-sha256 header.s=alien8 header.b=GF7ywrzT
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id EBCA740E0299;
	Thu,  5 Nov 2026 04:56:55 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id wsGM9sTHQm2m; Thu,  5 Nov 2026 04:56:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1793854612; bh=iu+wu+Zx/NtlCLRN5PCs/YxG7yDVrWiVNMra53EYeJw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GF7ywrzTQZ6wEHZIFfdeWnirhkOvcOJFxiVrxYiRH0aY05M7xKyHS0sGBRA8n2s2M
	 dJd4WhV9WzQ7ochMxOUgRrEz5y0ZEpAJZEyg5fhjTFjQsbvQdbXiBsIDpPU+Z5SXwc
	 aX4fZUf1z9evJkNy1kfx+rK0gwfdlcYzYIkb6DzfqsK50kJZkmucFgt8Ds1QHsO7Ei
	 8HMFrbUKv9L3ljhBY6cGmdD1Uxbpofv7JdmHxvynTAT8c7WXMNnOPcxnHLvkSj4FGk
	 v1VMnL4Ubm+nit/kNnQRQ1eQn2Oa25hVosc1n4YQpXtCPYE07TuCORD1JdMEZRBva7
	 3/TbnXvQPR0LNPKgbOfsXm/X7oaLui5ok/ZO8UL1RM0pG7PnvI3cKS/jwReMNom5rB
	 SBNZB38/Te2XhJsQXjulGCVr2I2JhhMLoSUqFEtVPVf9fzTIX2E6WN33ScmJA78vMF
	 AzwexkNCTIW8c4d9d1R5GOAFi/mqLSCtnlfWONXnSaR7gbMmHJ4mZO1z1tXJk1vnjS
	 M4rJmM2CqEvRT5MdYzqeQBAZItq6Wd4AEqnlJlr+Ec9rIIgKDDQhvOmLiXmorhl+yx
	 khIdhO8MU5KywJeSCsJtkXM7qOc8DcSP5jM7bm/ejk9B0fV4bc9s7cM0DJRxU59RxO
	 C648Rd/lSWIroYXKWCf2ENgk=
Received: from stx.tnic (unknown [IPv6:2600:1700:38ca:c00::42])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id DAAA240E0184;
	Thu,  5 Nov 2026 04:56:37 +0000 (UTC)
Date: Wed, 4 Nov 2026 20:56:35 -0800
From: Borislav Petkov <bp@alien8.de>
To: Ryan Chen <ryan_chen@aspeedtech.com>
Cc: Stefan Schaeckeler <sschaeck@cisco.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	Tony Luck <tony.luck@intel.com>, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org, linux-edac@vger.kernel.org,
	Borislav Petkov <bp@suse.de>
Subject: Re: [PATCH v5 6/9] EDAC/aspeed: Replace regmap with direct register
 access
Message-ID: <20261105045635.GBauwMg0oqd2tVPH-4@fat_crate.local>
References: <20261007-edac-v5-0-5c31fc5df4cf@aspeedtech.com>
 <20261007-edac-v5-6-5c31fc5df4cf@aspeedtech.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261007-edac-v5-6-5c31fc5df4cf@aspeedtech.com>

On Wed, Oct 07, 2026 at 02:13:23PM +0800, Ryan Chen wrote:
> The driver instantiates its own regmap purely as an MMIO wrapper: it has
> no register cache, uses custom .reg_read()/.reg_write() callbacks, and is
> not shared as a syscon with other drivers. So it brings nothing here
> beyond the spinlock that regmap takes around each access when fast_io is
> set.
> 
> Drop the regmap and access the registers directly with readl()/writel()
> under an explicit raw spinlock, held across the whole read-modify-write so
> the controller is unlocked once around the grouped writes rather than on
> every register write.
> 
> Annotate the register base with __guarded_by() so that, under
> CONFIG_WARN_CONTEXT_ANALYSIS, the compiler checks at build time that every
> hardware register access is performed while holding the lock.
> 
> Assisted-by: Claude:claude-opus-4-8
> Signed-off-by: Ryan Chen <ryan_chen@aspeedtech.com>
> 
> ---
> Changes in v2:
> - Take the register lock with the irqsave variant in init_csrows() and in
>   aspeed_probe(); the interrupt handler takes the same lock in hardirq
>   context.
> - Move the dev_dbg() of the interrupt status register out of the
>   raw_spinlock critical section in the interrupt handler.
> - Opt aspeed_edac.o into context analysis in drivers/edac/Makefile, so
>   that the __guarded_by() annotation is actually checked.
> - Note in the interrupt handler that the counter and interrupt flag
>   fields are read-only, so writing back the read value is harmless.
> ---
>  drivers/edac/Makefile      |   1 +
>  drivers/edac/aspeed_edac.c | 131 +++++++++++++++++----------------------------
>  2 files changed, 51 insertions(+), 81 deletions(-)

https://lore.kernel.org/r/sashiko-outbox-162667@kernel.org

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
