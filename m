Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D62443E9FE
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 22:12:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792102332; cv=none; b=m11Zd4gIoVocx92U5MESyJ9Q4kVkeQhxM5MsekcKNmrnSThm8yhw0CpCVJihgOkJGhqj1oBUJbLu/03ONEEc1lYJS4hyLsL67Ozm29W4KojfjPgEQrcFDdtJokfhcAO+hFRupcp1p3x+9Vc1BZzrww5Su+MiKFnwSYu8GDhrka4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792102332; c=relaxed/simple;
	bh=3qQG/95plwIqi2w/7IlIWZFQl+9tzFZ41n1TVRCYaNo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ciucEX5YAG1naahhT5c/H9vMi1M+c+mg19J7VpI6cofdujTj+d0bYIdHRNmMNxW1NLeZWSZQx15cyakWZDtJeSsl3BUf81Z/esLKQEFgKnUVTRpzKJ9ke9GavKL1YMSC572DJHkjmKv3W+mwM1mXDxnmXqSr0hFtlzuhRwe5Le4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=fail (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=DE1WeW4c reason="signature verification failed"; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="DE1WeW4c"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 1A6D540E0496;
	Thu, 15 Oct 2026 22:12:05 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=fail (4096-bit key)
	reason="fail (body has been altered)" header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id WZRZIFICunmD; Thu, 15 Oct 2026 22:12:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1792102321; bh=Q4zdkBmCJkwaNcqIWMyNxUTg7txukjH0ImGpHvk01HI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DE1WeW4c21ddS0G2EJm9nTmj+Ap1mfPM3cNEpil3tS7BjwoK3de0oLFrOBnE5s4Xe
	 otDlPSe4Qp7EKf3+uATAmamRUnw/aVRLh4VUcr3zRng46zwX5jRag0CaM2O9PFRrrd
	 2ffc25i9ikziYt8v1yraB5kAeZtDb4TFRadTyh/Cs+shDhFyCQs5rU4ICVKhGA3y98
	 ftetSmicF/70TGyLuRM5wEe9UMXCnBWBQfqjvZNWBn99flmKLB1NOuROSaZwU3j6ap
	 XUG18THI9XL5SpuulnsZqYHG2aB1lw0qG6/h6jjxMoOT1epD7YRLvB8CBX2jnKlW5w
	 sfjmUKt2phPVMRdDsCi24vH6JrHNnodZ0BxMXZf2krwK60vogdEGIgIyN7b9GC+fbe
	 aSWrPzYskFDbE5YqooVwMgZmqc9iYU/x7mbtxhPXUOiCyuc5FRAh2Ce+VS5SJhyHjl
	 7Jel/N7EL+ECp1bFwxmod+agJ7D5N1rhA4BVEk46wKqq61e7cH1RmYujXFJ7YmoKNc
	 xywkY5uCT0ByT/xkXgrC7Oca2OnOjs8lNZdsUkpdUQi5DU7CKlGpTm7/U3M96gBF4D
	 JQQHYsNIhOSwhZAWOMmTaof5kkRiAzo76KstNij1P2PdY+kVRmPcGVcbl9OcXicM3Q
	 SbKrT+MG6sCieCZPLrbFTc8k=
Received: from stx.tnic (unknown [IPv6:2600:1700:38ca:c00::3a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 29F3940E02B3;
	Thu, 15 Oct 2026 22:11:44 +0000 (UTC)
Date: Thu, 15 Oct 2026 15:11:41 -0700
From: Borislav Petkov <bp@alien8.de>
To: Nikola Ciprich <nikola.ciprich@linuxbox.cz>
Cc: David Laight <david.laight.linux@gmail.com>,
	Rik van Riel <riel@surriel.com>, ljs@kernel.org, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org, akpm@linux-foundation.org,
	david@kernel.org, Mike Rapoport <rppt@kernel.org>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Pedro Falcato <pfalcato@suse.de>, Kiryl Shutsemau <kas@kernel.org>,
	luizcap@redhat.com, pbonzini@redhat.com,
	Tal Zussman <tz2294@columbia.edu>,
	Matt Fleming <matt@readmodwrite.com>
Subject: Re: hunting memory corruption bug in 6.18.x
Message-ID: <20261015221141.GAatFPnVQafErlDX8v@fat_crate.local>
References: <asKdhWiJb3qXeopz@pcnci.linuxbox.cz>
 <bd8e9b01ad88cafb12da33331f32a1ce315f590b.camel@surriel.com>
 <20261005132113.43548696@pumpkin>
 <asP5xK4axiUk7jun@pcnci.linuxbox.cz>
 <aseMsMGpGPT/G548@pcnci.linuxbox.cz>
 <20261008182356.GBasffvDuTemTu1VUY@fat_crate.local>
 <20261009090042.39ba9c06@pumpkin>
 <aszH4vpXFAOQP1WG@pcnci.linuxbox.cz>
 <20261014235356.GBatAWFNsWaIA2HQ4M@fat_crate.local>
 <atCYcsfB4s5Anf1m@pcnci.linuxbox.cz>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <atCYcsfB4s5Anf1m@pcnci.linuxbox.cz>
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 15, 2026 at 11:10:24AM +0200, Nikola Ciprich wrote:
> I don=E2=80=99t have the vmcore for 20261008-lbxv1f (that box got fence=
d), but I have
> a full vmcore for 20260930-flev1c, which is the same bug: same crash in=
 the
> dcache hash walk, and the same bad value =E2=80=94 flev1c has 0x0ffffff=
f0c930020
> (top byte sheared),

Bah, I'm looking at the dmesg from that one:

[378185.135721] Oops: general protection fault, probably for non-canonica=
l address 0xfffffff0c930038: 0000 [#1] SMP NOPTI

and that says non-canonical but I cannot see that there are 7 leading f-s=
, not
8. :)

The register dump shows it better:

[378185.223709] RAX: 0fffffff0c930020 RBX: 0fffffff0c930020 RCX: 00000000=
0000000b
		     ^

...

> So on flev1c it looks less like =E2=80=9Ca dentry pointer went funky=E2=
=80=9D and more like
> =E2=80=9Csome other structure=E2=80=99s content got written into dcache=
 (and other) frames,
> one copy landing in a hash bucket.=E2=80=9D Does that header signature
> (0x00ff00ff00100010 / 0xbdcc802700060042) ring a bell for any structure=
?

No idea. It looks like some weird corruption happened somewhere and then =
that
propagated into the hash list... but what do I know.

> Happy to run anything else against this vmcore =E2=80=94 struct page du=
mps for the
> affected frames, the full record contents, the physical-search hit list=
, etc.

What you can do is, have AI go over all crash dumps you have and ask it t=
o
scour and find patterns in the dumps and perhaps give you theories how th=
at
corruption might've happen. And compare the dumps and see if there are co=
mmon
patterns...

From all the gibberish it would spit, sometimes there are interesting hin=
ts
there to chase forward.

Other than that, this looks really weird.

And I don't see any MCEs getting logged..., or? Anything related to hw er=
rors?


The 20261009-lbxv1g one looks even weirder:

[  938.693886] BUG: unable to handle page fault for address: 00068fff008b=
0058

Some funky pattern got eaten...

The top nybble zeroed is also present in the 20260905-adav2i case.

Strange...

Thx.

--=20
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
