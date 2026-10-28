Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=65.109.113.108
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793201711;
	b=sWk2kfqkHaEBi836uUV+sa3in6uVvnG+k9xTzYn8+Y6g9pMJi4Z4+zondn9gr4wvY7Kc
	 OYlKVl8/58hW780QdjlBWZVRK3S7QsgSCAw/B15zoIoXwL46W5uADFAMwt23qmFEERFzd
	 qnSGpFlGN2fcNBm8aV8/Kb5djbiZ0GRl8U+DGyOOaV1aBpxzqcLkizyMC9U9/5GoxxOlE
	 V3E7KOyM8YrF3Mqm02f8Ki9aaKxr1lsuJe8zAfl3X3cyjAMvlytNkf+6ZOJz4rA2ssPa9
	 GbcfNEZ4tjuIHhFoq46KGCgAydKUyf8Nekl/EwuvGtRsmS6NqxrMZZ4jgYf38KH+MnA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793201711;
	h=DMARC-Filter:Received:X-Virus-Scanned:Received:DKIM-Signature:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=KURjpTOH0FrngnsPypLY2qHIx42UwRanEUEh6dqoJh4=;
	b=d4t8lgEDPO7/039JxwKEmANgT9D0heOC6Javs2mKsxlcsnxBJZDjgi799KYxZEJruusl
	 kpOGsfs6RwYtAKAm5fJG+raAivxqiDmMeyE3UrotAqOCeUIo50VcPhSI/PMVv1OSuGuU2
	 GjzN8BX8nEoUGvFZn0X6LX/S/jhIfuF6eBCar9JYKXGEZ6iIdJ6GsAOzLF77qkQxFnUCm
	 QPkbmr6rRjkLIsl9jTdfKtw4i4T/edoZZxFSny1iwIjT+d9PdeT/iGEnoYVNyQHMfgfwb
	 jw+9bask0KgIrCcJrN2Aa3lLHgwr9hRFTkCxy6MZXrWvl00JiTlSb+w/5FpwHz81rfg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=alien8.de;
	spf=pass smtp.mailfrom=alien8.de;
	dkim=pass header.d=alien8.de header.i=@alien8.de header.a=rsa-sha256 header.s=alien8 header.b=ORwPZgTy;
	arc=none smtp.remote-ip=65.109.113.108
Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3C58606A31E
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 15:35:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D3C58606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key, unprotected) header.d=alien8.de header.i=@alien8.de header.a=rsa-sha256 header.s=alien8 header.b=ORwPZgTy
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 5FF4540E04D1;
	Wed, 28 Oct 2026 15:35:08 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id pznaP6Lf8aFJ; Wed, 28 Oct 2026 15:35:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1793201705; bh=KURjpTOH0FrngnsPypLY2qHIx42UwRanEUEh6dqoJh4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ORwPZgTyN3gWScOuwIv53gb90oyJLTODV+EudUcD9aB4NNfUO+78YOgey3OFpqHOc
	 nBGubOWrTGjljuFYyrPvU6orJkwPEIBz/dn/991FKY3nGpSG9uib+wh6uoScG9IP+T
	 toMOADvUcDkU0QKMEiBQzX9hRsrhauYTXQD7KGggiSYo6opliX+AGuuOsp0bX7KIKZ
	 A5XtKoovk8Ta0d6BSe4or/ZGHMNJn/gtJ6hxMbi9CDRlMTRV1nO7WA7kWyvw+o2Dd7
	 vpTXjykjxuOgwmS92AwpUkZIGBGJ5G6oKA3yn2u54NhzBsLgKBZwKzOGAIPYOSm/S4
	 DpgNUCIB3g1bxICRAdmsBhO+aT3Iqeoerzhc3aLJfrjyz6v1qVv6dS0HmEmOu1Q3Fj
	 to/C7IbAZ6GLeAgI+klvRT7qW+zRB9PH1wPrahjCKGOgKNNGCmTdNzfFrzN7l7EVdo
	 wj/nsLz31vNQqhb0laWTQv9FGu5nki/5PjygT8rR+NuKBF6b668FXxG5n0XD0aAj8w
	 I7fTGh6/23Z0YPvz62KXQWqcb06+uOAfqAds1/fbMndNQoI3iLcYVbuKahTp7cfgIY
	 UOu9DDTxHH6H3fuwOVcpih0hQ0yQsZYz9wX5I4guEau8ilnIkA39IdraOyldWpmTKk
	 MlkrdoywFLaKsolFL060pG9c=
Received: from stx.tnic (unknown [IPv6:2600:1700:38ca:c00::48])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id D930D40E04CF;
	Wed, 28 Oct 2026 15:35:01 +0000 (UTC)
Date: Wed, 28 Oct 2026 08:34:58 -0700
From: Borislav Petkov <bp@alien8.de>
To: Sean Christopherson <seanjc@google.com>
Cc: x86-ML <x86@kernel.org>, LKML <linux-kernel@vger.kernel.org>
Subject: Re: [RFC PATCH] x86/cpu: Change AMD uarch detection
Message-ID: <20261028153458.GBauIWIhGKCYhaxl2_@fat_crate.local>
References: <20261022040047.GDatmKb9L_fwqBGQ0_@fat_crate.local>
 <auDBUQQ9Ympsobkh@google.com>
 <20261028044653.GBauF-PdTS6gsOOozC@fat_crate.local>
 <auIBRhu4Zs3UgsQ7@google.com>
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
In-Reply-To: <auIBRhu4Zs3UgsQ7@google.com>

On Wed, Oct 28, 2026 at 07:05:58AM -0700, Sean Christopherson wrote:
> I don't particularly care what the interface is, but as a "downstream" user, it
> would be helpful if Intel and AMD used the same scheme(s).

If you mean ->x86_vfm, then

git grep x86_vfm arch/x86/

shows only exactly one user in arch/x86/kvm :).

And then there's the X86_MATCH_VFM() gunk.

But I guess I can take a look and see whether I can use that thing on AMD too.
It'll have a different meaning but at least it is the same cpuinfo_x86 field.

> And FWIW, providing the human-friendly codenames is very helpful even if they're
> almost never used in code.  E.g. effectively documenting that Turin is Zen5, Genoa
> is Zen4, Milan is Zen3, and so on is helpful, because even with search+AI, it's
> hard to find information you don't realize you're missing.  Though that's probably
> orthogonal to the interface.

Yeah, try talking to the marketing wankers with their frenzy for naming
everything in the dumbest and most unintuitive way possible...

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
