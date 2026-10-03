Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD953266B72
	for <linux-kernel@vger.kernel.org>; Sat,  3 Oct 2026 00:45:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790988316; cv=none; b=WqbxDpNgjBzVTJxlusu6CwNF73U9kNMF4uTWwHee9sip5RShQgAhj3GLybm+FyI2KoWr2HZdivh8ufsCARErGsWx3AjhzQxC6Wx52XkPAEqJPr/fp8zyXjT6YvC5IjOyAiKIqv4Q4aTIk6Xeh8crDAbqgD2K7WDqDln5upgheGM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790988316; c=relaxed/simple;
	bh=Km65y6j8OXz3zhnSmujtsXUAycl2EwJ7u+NwVjTVncU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UmDFwLtnutUj3ddSYqcBnIcD0Tqcdind4leDjD7dZ102s5/mz76xBmJoRwf5mzBSqhTJlpNWNzpsIoNt8j7FdcAhB2JAM0pOlxIILti11FNgnMCVrwkvpvJZwn6zc5f4VKpqKs9arf+46aVxcxBQv9dwmgCHNQeLir0M/L9mN7E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=fail (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=XhCEnh1E reason="signature verification failed"; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="XhCEnh1E"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id D67E040E00E8;
	Sat,  3 Oct 2026 00:44:53 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=fail (4096-bit key)
	reason="fail (body has been altered)" header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id u6cfPEp_P3H2; Sat,  3 Oct 2026 00:44:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1790988282; bh=BIRXiscMiC6WH7YL5koRp+cKjmId4UuCyYadpJEgPQI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XhCEnh1E4ogpyvWcLmiBQeqBne6HhpLeIw23Yl/KPhN5olyOlEIFg7gpASBe44ScH
	 M2q+zEGuZdF4sslTJapRw2+vyIteoG3clZE61B7mbPcx7ocd15QnihlL0RrU3aXUs1
	 GdUFked243VX8Cg2mBUtSvn/7yRbfc4AYe22ZSbIeFKChz/PeXp6yGqnSR0NfiT4xf
	 GKcyVxkofreAzp+OAFBsgVoHVNAUbJbqaE5U8Sl2TA3jEz18Ue5UsHSdQfeiUA9jgK
	 AxCA+rwkWpt/y+25qFqV/uDeL2+piQ5jHZnX2/dn+Kpkp2JCPNPf4KPDJVlI/5MEsZ
	 nBhe2TeisFOluQImdy3khpmbJdRnSz1+T12T+AxYLV70GQ2XdlghUDkt4EOac2caNk
	 jI7KZPUI2UUY9Q//A8lj9J1Co/FN1zFSjTU+MZ9RvEMTVfQEdobyFpLPnbO1eMRKvD
	 unezsWo2MiFohw0oh5+2yC8zAQCc96cfnNkPakvQsODSeqZXt4Q+6oF6gU+gHuIrbh
	 wiGJUV9Vy62L1KvlCXFmB4+62m9yS7znQC0xL+WT5fxD7ax2aTZCC7Z3D303FQeDU6
	 exfV9wPcFhawCRnx4e4eIQ122/x6Oo4jLQ+6bxbcbkRS5hKDRoRDcQxvcLGIPcKL0/
	 7+E557FOKz6z0q4mdXr5vhis=
Received: from stx.tnic (unknown [IPv6:2600:1700:38ca:c00::3a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 796A240E01CD;
	Sat,  3 Oct 2026 00:44:36 +0000 (UTC)
Date: Fri, 2 Oct 2026 17:44:33 -0700
From: Borislav Petkov <bp@alien8.de>
To: Rik van Riel <riel@surriel.com>
Cc: Borislav Petkov <bp@kernel.org>, X86 <x86@kernel.org>,
	LKML <linux-kernel@vger.kernel.org>, stable@kernel.org
Subject: Re: [PATCH] x86/CPU/AMD: Fix AMD TLBI Erratum #1718
Message-ID: <20261003004433.GBasBP8bFFG2bIFgUu@fat_crate.local>
References: <20261002211617.1001617-1-bp@kernel.org>
 <4746af392d093deb08101530be1c870f277a182b.camel@surriel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <4746af392d093deb08101530be1c870f277a182b.camel@surriel.com>
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 02, 2026 at 08:31:30PM -0400, Rik van Riel wrote:
> This same change fell out of my testing with
> a reproducer earlier this year, so I know it
> works, at least for the test case I have.
>=20
> I am surprised that it was good enough to be=C2=A0
> a real workaround, but I'll take it ;)

Me too, but it really is - there's a good reason why :)

But the most proper workaround is for everyone to update microcode anyway=
 - it
is released too, so we don't even need the sw fallback.

> Tested-by: Rik van Riel <riel@surriel.com>
> Reviewed-by: Rik van Riel <riel@surriel.com>

Thanks, my plan is to queue it next week so that we have it in 7.3 and it
percolates to stable.

--=20
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
