Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92E593ED3CE
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 23:58:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788393540; cv=none; b=QDTgY87MhljENssF5QmDnMPjWMyWShl0/poDu06uHoixeslBYjpqR6t8jENTz/v3EKIQ2g2pW+iWdOEc8mkVVM/t6Xd5jFzDG3uB2Is1fvAke8CHkEVTs4w1XBSPxk5f9ptZiPP/B1HeEVyakr80Dy85XVdfeguKDzw0CY1RKd4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788393540; c=relaxed/simple;
	bh=AsdYeVXmF3uMB+TvH8uJow6MovMZfFVMBCxO5aiWbOw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pCJuYRWFoovgL9d8F3vOZNFmRiGD0jr2Am91qr1Qn4GcxRp6MKw1hqBGnXrnvWmUCaMg/FdRb2XirXM/znXP/8FJhHhFH4f10i/nbMmwfBiD+RIM/UEAg3nXIqYvZJ7u2Dx6mRR2E6chOo0kpm8PeYO/LJSPlc0i+yfL5cbKTAY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=fail (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=d4bG1cCB reason="signature verification failed"; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="d4bG1cCB"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id D19CE40E02C2;
	Wed,  2 Sep 2026 23:58:54 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=fail (4096-bit key)
	reason="fail (body has been altered)" header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id jG-GqP5vWJ92; Wed,  2 Sep 2026 23:58:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1788393524; bh=+jWmLQ4BfUUKZhN5+qVeHxA0IEBsmEBT9F0I2pHfjyk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=d4bG1cCB94QPj0niyzXG8MNmgx3y3WOEuXe9C3t69kjXgtKUnMe6Hey+5Hk48TPVY
	 MmaaTKTEhZK7KZZJeP53hr24rIYJVuS9qYLSvkcyLBiw/XMFuXZl20ErnXEMYp2zLZ
	 NnqHeREW9WsvHr9BgMrSDSewEXHykF92bpAlOCF53fB5bGlfME2wZ4ynQf/tZJ+8Fe
	 kvVhBBbL6woidJziqW8+YT28wcVvcA95GVDQUywbs54huukI2vLQ1vufc0OQPbm0un
	 +yFvEA9bknSj/+bvRL7+ZLiFH9M7p6UQCSWTzq3GyGUxSB32i0durPFqQ4Cq86yiwZ
	 sTxhnWDkVzaOLuzTTdc6Tt5/gyzk9TO0k4obCOvZFNpn4P5y5wA7FI8eobqYVPTMBM
	 EyvxibscDFmhmLWDgAk/jd9jvhkOZXvmZh4bJVsJVRrsm52k2/GqmlT5YgrERwLUiy
	 76roRpxt1xTRzBZpOeOfWKGtUXRD/jPhPzx5uEVsBTnnmKo+2sg7meOvfSfFm2imxP
	 hlRh9Gpg5cSepG0d1NkOIHoCrzJuoh4ifzQcVoFqFyMGG2b/PWKEMCDKDn2is3Svrx
	 84IV3lzud+919ADjMiLvWVeo44N7+oCnf+xUfhsWFS5yRvk+UrbD7sv1S4taWDRDLs
	 JkBMFI46WOwdIoMhyKJrRm2A=
Received: from stx.tnic (unknown [IPv6:2600:1700:38ca:c00::a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id EDC6240E027F;
	Wed,  2 Sep 2026 23:58:27 +0000 (UTC)
Date: Wed, 2 Sep 2026 16:58:24 -0700
From: Borislav Petkov <bp@alien8.de>
To: Michael Matz <matz@suse.de>
Cc: Mauricio Faria de Oliveira <mfo@igalia.com>,
	Richard Biener <rguenther@suse.de>,
	Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>, Juergen Gross <jgross@suse.com>,
	Alexey Dobriyan <adobriyan@gmail.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Jan Beulich <jbeulich@suse.com>, Brian Gerst <brgerst@gmail.com>,
	kernel-dev@igalia.com, linux-kernel@vger.kernel.org,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH v9 1/5] x86/boot: Remove "cc" clobber from memcmp()
Message-ID: <20260902235824.GFapi4ICSFCUiPSWVG@fat_crate.local>
References: <20260822-pvh-kasan-inline-v9-0-e70ef3b75b6a@igalia.com>
 <20260822-pvh-kasan-inline-v9-1-e70ef3b75b6a@igalia.com>
 <20260902023129.GGapeKgVlL2WgHcJcb@fat_crate.local>
 <57b0d188-b256-bde4-43e6-99dae4f59d60@suse.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <57b0d188-b256-bde4-43e6-99dae4f59d60@suse.de>
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 02, 2026 at 03:29:44PM +0200, Michael Matz wrote:
> Strictly speaking, on x86, the '=3D@ccXY' constraints are register outp=
uts=20
> into normal random integer registers (though they are of course=20
> initialized in a funny way), while the 'cc' clobber is not a register a=
t=20
> all, but rather a fuzzy idea of "state" in old cc0-based compilers (whi=
ch=20
> the x86 backend isn't anymore since, ... well, about forever, 1999).  A=
s=20
> such they both really don't conflict and ...
>=20
> > But then I'd expect that gcc would enforce that. I know it can't have=
 it=20
> > when the clobbers contain input or output regs:
> >=20
> > In function =E2=80=98__memcmp=E2=80=99,
> >     inlined from =E2=80=98main=E2=80=99 at memcmp.c:25:6:
> > memcmp.c:11:9: error: =E2=80=98asm=E2=80=99 operand has impossible co=
nstraints or there are not enough registers
> >    11 |         asm volatile("test %3, %3\n\t"
> >       |         ^~~
> >=20
> > but with "cc" clobbers it works.
>=20
> ... hence there's nothing to report.=20

Aaaha, so the enforcement is solely documentation-based. :-)

> In fact what an explicit 'cc' clobber once meant in cc0 backends (that
> indiscriminated flag "state") is manufactured by the non-cc0 backends (=
all
> of them now) automatically whenever an asm has no flag output constrain=
ts at
> all.  (On x86 that means it adds the "flags" register (internal name fo=
r the
> collection of flag status bits) to the clobber set automatically when t=
here
> are no =3D@ccXY constraints).
>=20
> You can regard all 'cc' clobbers as pure source compatibility, they hav=
e=20
> no meaning anymore.  But as they are so ubiquitous (even in our own doc=
u),=20
> they remain recognized.

Ah ok, I see. so we'll simply forget them.

Thanks Micha!

--=20
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
