Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=65.109.113.108
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793411716;
	b=vtPwVGi4PUADWBcpoA0acfEFxUxfVUTF3VmxLRzXKn09VBmg2dr/xsEogO9p2fiSSW2c
	 uHyzVqsp581xh+Wz9ktxJGoaNEgqfGmcSlWFEKe5zDnu0PqsdQlXD89+x37biCqgYfh3c
	 VIaV37rsHIbPoWtxemn1VmwbQqgbuKtOJShX7I97ZR47QH3zUOQI8lj9V9aYMeuJQTntm
	 NOmO78IFLKeivbkgD1Eg9v0pJ1uuwBAI+cd2BRlGfuNX35GmxSx/8WoxMumL5FAZbKvac
	 wOBiyzZSAo6ixwGqsFrkaIEaPUt9nv6lsAQfB1WhKysCB3bIZNwQR3MDARya43FZplA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793411716;
	h=DMARC-Filter:Received:X-Virus-Scanned:Received:DKIM-Signature:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=Jo6Fyya+KBbgIBwwi4lxJWXldvxfP6I6PjhdWLQx5Bg=;
	b=vJLYIWfxLC0jafWxzwLtmS4ZlBc1Xb3m9nmsnFxEIrX/zct7OB6zM0U2kkYVMXCXIONb
	 q6iiPIFQEQ+Aho4zhGeZaowyP4V+0Fu6dODbyY2bl9PmWcYGzUStAol+aPYFg0xiEiDcP
	 qctcLbbpBGkDrkeQzn7fhF4VqkaCtpGL2bQjBXpehr2YR3teDWhg5JrE6sQQEhHrEeOHy
	 yfTJP90QnRzqRGRzuqHRgtKa3PhlRc8u+o5XGvtTwLZlw7Fzh9ZqwJlGfUtdFe6ub9qjU
	 xvtisuaLzlVyxM03dOZCHQ4VinTZsInkAG+qnu/w0340dhE15gVkUZDPyZBrgZHQS+g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=alien8.de;
	spf=pass smtp.mailfrom=alien8.de;
	dkim=pass header.d=alien8.de header.i=@alien8.de header.a=rsa-sha256 header.s=alien8 header.b=ALP5j1lk;
	arc=none smtp.remote-ip=65.109.113.108
Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1ABBD606A31A
	for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 01:55:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1ABBD606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key, unprotected) header.d=alien8.de header.i=@alien8.de header.a=rsa-sha256 header.s=alien8 header.b=ALP5j1lk
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id D3E4340E03BE;
	Sat, 31 Oct 2026 01:55:13 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id UiTJ6x6FE9l7; Sat, 31 Oct 2026 01:55:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1793411710; bh=Jo6Fyya+KBbgIBwwi4lxJWXldvxfP6I6PjhdWLQx5Bg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ALP5j1lkmYoA46lH+DZ3GmPGnZ764z2ybhOsZTOtAFqMqwxtaI9siAACl9MCwIMgp
	 0ZiZoAfWdjH4jh2MWjDtNVkZzKHeXfraEPF1rI8wF53JvXFJMzCMPOdiSMDX5H8bW0
	 +P+232IHaCCb8eH1JJe/qUJTfATp6MrIRm7gL6ltxhZO9N/Jk4iEzTl42Hu8hM/93F
	 xpTIgGLEPk4hrSZvGyzfaX70zAVV+RJFr/IXb4pYPNPRYmcrvxMrljlXrrM8cQvJDN
	 RRs1wBEzQ3+5HOeGhc1BfvYqGg38qfzj3cZ0atrVkHe6aJW+adm0GV2NP2ubCTVc40
	 qHzce3TI+QH/zwEg4Dv3IoN60i0rM7vMFkuLvYPkNSL3/a6VKUrz7OMiSd7egi+u9G
	 2660C9jtT1c9YhAz/TwxtfKGFcZERBcWLSgCkX0xw2UV5Am4ZDMs9Zq7iAyoUCNeIV
	 +5T6IM5EpJnpxCK8fO5ua441R0goxF5BIziIqCCnl+zIeu0o+a4BcSVfJOw50EUEsN
	 /4mQVPJtfPMKbBiRzFZG35yoZhqMI4A8u5c5s8AVVNlSpFMBK1uSXLAVIIowMvHKoY
	 qnLG8zEsQV17oChuQPJfkPGSTfMlKKRTkw5JJZnyUDD7h/ojHNoqXb3S1MpTOdokex
	 vxfGG4PMfD2c5s7rAvmu9z14=
Received: from stx.tnic (unknown [IPv6:2600:1700:38ca:c00::42])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 31ED240E0298;
	Sat, 31 Oct 2026 01:55:04 +0000 (UTC)
Date: Fri, 30 Oct 2026 18:55:00 -0700
From: Borislav Petkov <bp@alien8.de>
To: Sohil Mehta <sohil.mehta@intel.com>
Cc: Sean Christopherson <seanjc@google.com>, x86-ML <x86@kernel.org>,
	LKML <linux-kernel@vger.kernel.org>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"Luck, Tony" <tony.luck@intel.com>
Subject: Re: [RFC PATCH] x86/cpu: Change AMD uarch detection
Message-ID: <20261031015500.GGauVKdGNWuqeo0MG_@fat_crate.local>
References: <20261022040047.GDatmKb9L_fwqBGQ0_@fat_crate.local>
 <auDBUQQ9Ympsobkh@google.com>
 <20261028044653.GBauF-PdTS6gsOOozC@fat_crate.local>
 <auIBRhu4Zs3UgsQ7@google.com>
 <20261028153458.GBauIWIhGKCYhaxl2_@fat_crate.local>
 <20261029175611.GEauOIu-Xi9_DGVXKe@fat_crate.local>
 <2a6f9c90-a6a3-4b4b-a77b-9a3b99d66d4a@intel.com>
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
In-Reply-To: <2a6f9c90-a6a3-4b4b-a77b-9a3b99d66d4a@intel.com>

On Fri, Oct 30, 2026 at 02:29:25PM -0700, Sohil Mehta wrote:
> Since x86_vfm is a union, wouldn't this clobber the vendor, family and
> model? This will set the x86_vendor to 0 and get detected as an Intel CPU.

Yah. That was the reason why I did this x86_uarch field initially.  But then
Sean complained and I forgot about it, thinking I can make this a lot more
unified.

I would've remembered again after testing it but yeah, thanks for reminding
me.

So, we're going back to the initial method because that's what this is
- x86_uarch is the microarchitecture number I am giving it and not x86_vfm
- a family/model/stepping tuple.

Who knows, if you guys decide you need an uarch enumeration, you could use it
too.

Thx.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
