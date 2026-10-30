Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=65.109.113.108
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793333087;
	b=amA6zKteQwWUlrbPIWnaf9N1/SF377iZojjc9wdoaDeHHgmnrWUSNS0QXfyIs5wcV/cX
	 7IXN5P6j4WolhhFkDeva4Oi29Bwvl8bm8y0pwb6TkpPvnHSMybLVoy4EehXCCNMnhHfGA
	 QbPTvOchK66UyZVpnf+JevBzMLgB983bf0zmlMuzBVH3vZrV/BG6sW8sGmoTG0B/K5SkZ
	 tgRdLXjmVQpeI0ZAdfKmfv9TMj1Z1pLv7Bbrv5m7Z2AD5DMNbacTm81Ap7O0yCIr3OQjx
	 oSWN5EdNr7ohg9OeuIkn42fDwIlYrSB8aFwUZDMsgZBZGBmUtWf1XvGpVe9+wnkO/ZQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793333087;
	h=DMARC-Filter:Received:X-Virus-Scanned:Received:DKIM-Signature:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=IJwZLQtVPfgayuwGY2sIxG0oBim9kB1OY7tPdQorlZQ=;
	b=mnqqPtXt/Ls8h58yNhHYeml3Dx8zUye9p1l/AgnS8AyM0uX13I+1XY7brobUIGVez166
	 Wz/48qmM26LYn6AKsFszWQqeY5UnfChFkDHJwB6O256n1esqDyqaTrdGRiUvLChrLz6fb
	 igpomKVeNEjLgBB67bHmRKAMJvYxlnaopO1b7TocTtyXapOSYcZmFtHfRH+Q2TIEcz/X9
	 wphflxNTu9WBsqEqaBak9x5hEJ2X9+PO2e3sP0RoAYJg0s6go1BlZ+GPoctuI+BwD2CDj
	 0boLs1Unf6ns1KO6a9nKONGbAYsq01qodJZ0Mmxq3A+y6Om0qhQ0TNN7j7QDLysLdww==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=alien8.de;
	spf=pass smtp.mailfrom=alien8.de;
	dkim=pass header.d=alien8.de header.i=@alien8.de header.a=rsa-sha256 header.s=alien8 header.b=VnZFNDg9;
	arc=none smtp.remote-ip=65.109.113.108
Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73316606A31A
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 04:04:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 73316606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key, unprotected) header.d=alien8.de header.i=@alien8.de header.a=rsa-sha256 header.s=alien8 header.b=VnZFNDg9
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 31E5840E04D6;
	Fri, 30 Oct 2026 04:04:44 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id bp2kwDEFwjbM; Fri, 30 Oct 2026 04:04:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1793333080; bh=IJwZLQtVPfgayuwGY2sIxG0oBim9kB1OY7tPdQorlZQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VnZFNDg9WLeRkel2U4CyvS6LBbWbA+1AjQAKUT08OMjDnY0TumDCUwv5gqmRnCHfa
	 LVESSUJOy2TEA1IpTJnBkLIVsnVZAjv52uxAoxGr+rOv28rGlJPx+QItG/RXLlurKe
	 elp9rMU+Jc1kkLJWnZfOddkrCAcofDfkbMrL2phqSya07RKU7AwqdQCPoQZV0hVipF
	 E4lx0mtGcGDZg2L24QiUAhmb48aSfEBDeXMPF+H2ab/WQkdul7vJoyM5rqHQrtY7Nu
	 JTM7JjG44lpTQVsSBMkY+nYt/DSQ2hMYjtHKUtVAIGACF1qqgSgNYoQuucDB2YVckK
	 z0+QHJKCfIg1Pm6PR29Bbrg07bHFpBBXlWrhi4UA3hzY+hw1BrAXsXsefVjR8VLtaJ
	 a+EoZagLQ2Dkf+5U8IFvmThjHE71mVWTG6xHRAOrnn6gvH5mBWJtpyrMlQYYOd3uqv
	 2wcaIctJueaE6UjbO8VVUu6tgAOdIJ5eUkSmotXvc2kFs3o0Hlc4ulTzwa0fLtGXvn
	 1berSeFzYFILe/SH8vc+mARLe1GsVf27EuqAEjgzHWNUiEMJ8GmQKdyDmnKL/8OGoz
	 nCkB24BqEHl1LxcdG0dBBc2l2fDVXoUy8X3fz0IN3WKZFUmp4LvKBxLdgVS8lh8VqY
	 iUuV+rV2XtJSFaN4Hr1NiHpc=
Received: from stx.tnic (unknown [IPv6:2600:1700:38ca:c00::48])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 24CCA40E03BE;
	Fri, 30 Oct 2026 04:04:28 +0000 (UTC)
Date: Thu, 29 Oct 2026 21:04:24 -0700
From: Borislav Petkov <bp@alien8.de>
To: Breno Leitao <leitao@debian.org>
Cc: Thomas Gleixner <tglx@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Josh Poimboeuf <jpoimboe@kernel.org>,
	Pawan Gupta <pawan.kumar.gupta@linux.intel.com>,
	Ingo Molnar <mingo@redhat.com>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>,
	David Kaplan <david.kaplan@amd.com>, linux-kernel@vger.kernel.org,
	kernel-team@meta.com
Subject: Re: [PATCH] x86/bugs: Keep BHI mitigation when only user->kernel is
 mitigated
Message-ID: <20261030040424.GHauQXSNvxCYJb8_pK@fat_crate.local>
References: <20261029-bhi-attack-vector-v1-1-29cfa697efb6@debian.org>
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
In-Reply-To: <20261029-bhi-attack-vector-v1-1-29cfa697efb6@debian.org>

On Thu, Oct 29, 2026 at 07:45:03AM -0700, Breno Leitao wrote:
> The BHI mitigation selection is inconsistent with the documentation
> (attack_vector_controls.rst), which lists BHI under both the
> user->kernel and guest->host attack vectors. bhi_select_mitigation()
> only enables it when CPU_MITIGATE_GUEST_HOST is set; otherwise it
> selects BHI_MITIGATION_OFF, even if CPU_MITIGATE_USER_KERNEL is set.
> 
> As a result, a kernel compiled with KVM disabled gets BHI automatically
> disabled, since CPU_MITIGATE_GUEST_HOST defaults to off without KVM.
> This is a bug, given that CPU_MITIGATE_USER_KERNEL still needs it: on
> affected Intel CPUs these kernels lose BHI_DIS_S or the BHB clearing
> loop by default. Booting with mitigations=auto,no_guest_host has the
> same effect.
> 
> Select BHI_MITIGATION_ON whenever user->kernel is mitigated, and keep
> BHI_MITIGATION_VMEXIT_ONLY for the guest->host-only case.
> 
> Fixes: ddcd4d3cb37c ("x86/bugs: Add attack vector controls for BHI")
> Cc: David Kaplan <david.kaplan@amd.com>
> Signed-off-by: Breno Leitao <leitao@debian.org>
> ---
>  arch/x86/kernel/cpu/bugs.c | 12 +++++-------
>  1 file changed, 5 insertions(+), 7 deletions(-)

Queued, thx.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
