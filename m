Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=65.109.113.108
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793162826;
	b=WYtc8pUsSmGcyt/YERA+4tZ578o9VPMR/alG5mi2aEpApSTT6Y1P6/WhNFtIY6T6pLmc
	 ZTvM896h7flJXRKm2ahRY7VMulw1OMMeEUydIWAiS7iD5tfNlNkJt1JWqazDQG5V5lCLr
	 spIZW9O18936pnd5hro7gqXzOeKu0eNLw9h7ONUo11XpsZQrrpppFaOp6ViG4Pk2BLCIU
	 ipssYL3mKJp5sUGReAStmWSiSS9mg2SJwOFbuYwx1+1CCOjnLPLXNIH+eXL53WfRQGNXW
	 F0s2uIQ9pJA8tr490m5WWbb4C1+JVX5gE70K+h719pLAi9euizKNJPBTlwteLyCOnDw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793162826;
	h=DMARC-Filter:Received:X-Virus-Scanned:Received:DKIM-Signature:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=8hS5aSDmglPlOzdV8fa+sBCGIad1pvPJBWV+r0mWLyk=;
	b=sbLlnK0J1L+bCyqBjNAbyJYUlWrBOpgUWCtia4YPBgDz5hqXDoyhX3yBvK8F7segjC9G
	 YY1zFPidP3fkCM3WPxKuATQZyBBM5vMLCE8s0/KB5euHqIPuhej7OwFyuC9yumlDAGzhk
	 IlzaEQDGoX7zRswpxbTQe78sw6rUwVOwxFBmpFN62glMH+qWmwtcortbwvmbGRjCSHDZn
	 YU1R579fDs5ogO0U/7rDengN1cYf93q3kQX4rGB8d8hIvRSOaHt6O5EbDv7beP2tGkWRO
	 2Yy+O4d+eFY44i/b3tPc1pz/5sSAuuW5QOCCcIN3PTI0s+TlyhcR7yP6KAL5EmoRWnA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=alien8.de;
	spf=pass smtp.mailfrom=alien8.de;
	dkim=pass header.d=alien8.de header.i=@alien8.de header.a=rsa-sha256 header.s=alien8 header.b=fneUV2Df;
	arc=none smtp.remote-ip=65.109.113.108
Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B401E606A31A
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 04:47:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B401E606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key, unprotected) header.d=alien8.de header.i=@alien8.de header.a=rsa-sha256 header.s=alien8 header.b=fneUV2Df
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 2ACB640E040C;
	Wed, 28 Oct 2026 04:47:03 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id 3n4QpbmJ79ud; Wed, 28 Oct 2026 04:47:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1793162820; bh=8hS5aSDmglPlOzdV8fa+sBCGIad1pvPJBWV+r0mWLyk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fneUV2Df7BeitxzrYDavLS+RCS7vel2rSVg/JOw7J/ED+4Kq0eMBB9xVcP7dbmXGM
	 ZgYSKfTFhu9985ItEx9UPeoLMuxR2lB3Mi3/8koLUQVrQUSPCx352kUYyUXBzil8+B
	 oRogjonqMzV2HmczE8gjUXCR81bevn/0xakOokR8GrggRpkFyYw3DdlITnMMM/Yzwg
	 h3xrPtR8A8doSUxgzzbNzTrENYuXmryYhh2qsPQh1tBHefBShkfi/IKJO5gwXvpC45
	 Gh0IfDQFRY0PUz/HiAKqEXCeuEqqyuMoyhdHA/uNOUlsjbcuCvboTis/YVLMg/sDhc
	 4Vs90hL2xX8+xjGRGtJ+i5y2wUL6qY7CaHrwAK2bn0aQsjxK3JDQj0/PCAxBQuCm1W
	 tEdqn8f8c6fzOPBMOPkKIOVfK1puSmJag76rguy/X8JQlLJ1g/EEGPOQSlqeURf2ux
	 lu6oiuroZ93Shuup9G2NtddQ8aJeZjd53NEE0cYhmrxkVnewoERfPN0sv7NPN/mdq8
	 mMmUr38+8s7T+59AQqA88d/41wKZ49g2Y5KEBY+FSELz6xaXsRknAiYPYIZcGEvemc
	 vgoKJ4I/MrKxGSnuRyzhAy8FvY1pai+hj0NkQ2R39GHy4AF/hvfAjUvzKckQgvAbPb
	 viXg68PE9Dl/dSguz7Mr3uR0=
Received: from stx.tnic (unknown [IPv6:2600:1700:38ca:c00::a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 76E6F40E016C;
	Wed, 28 Oct 2026 04:46:56 +0000 (UTC)
Date: Tue, 27 Oct 2026 21:46:53 -0700
From: Borislav Petkov <bp@alien8.de>
To: Sean Christopherson <seanjc@google.com>
Cc: x86-ML <x86@kernel.org>, LKML <linux-kernel@vger.kernel.org>
Subject: Re: [RFC PATCH] x86/cpu: Change AMD uarch detection
Message-ID: <20261028044653.GBauF-PdTS6gsOOozC@fat_crate.local>
References: <20261022040047.GDatmKb9L_fwqBGQ0_@fat_crate.local>
 <auDBUQQ9Ympsobkh@google.com>
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
In-Reply-To: <auDBUQQ9Ympsobkh@google.com>

On Tue, Oct 27, 2026 at 08:20:49AM -0700, Sean Christopherson wrote:
> This is better than X86_FEATURE_ZENx, as I always found the lack of inclusivity,
> e.g. ZEN4 not lighting up ZEN3, to be confusing/surprising.

Yeah, I didn't think of this simple scheme back then.

> But why invent another scheme?  What stops AMD from implementing precise macros
> as arch/x86/include/asm/intel-family.h does?  Providing range-based checks would
> "just" require more macros, no?

That's exactly the reason - moar macros. I wanna keep it simple and instead of
having at least 5 OR_LATER macros, I wanna simply do:

	if x86_uarch >= AMD_UARCH...

And who knows, if in the future the scheme becomes even simpler, like it was
before, we won't need those either.

But I might keep the uarch checks even then because this is a lot more telling
- we want the microarchitecture version, not some family, model or stepping.

And mapping f/m/s to uarch we already do.

Thx.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
