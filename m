Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92105EADC
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 02:32:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788316325; cv=none; b=AUz76V+MoP4cL0grIohpJHp7Trfs1Q2n0ucw5hCI4O8T5CZknvfZFeqRdCoUA+kLwDHAvRqvU1V3m4BFG5gtmHwWJF8Y6be6DPdyIyK9DBENtazvurS+YDvvZlolh4uSQa6VfXqNoJf3LJsGLARmUqQXrKh8k4INuVlL7opNN6g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788316325; c=relaxed/simple;
	bh=hxN+dzdsYawccnVqp+aEd8OuPV/f4MQo7nBrztoBLfE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oE3VFeVXUvWy0yuZvyDzP8F5Yt/rB09+QOApxOwIjVuXv8h2F8AEX9N3quKd2yDzzJ+vb+aseIqrqWypDdf7orlphJ5Y0fhUedHFy/CnlS2pij5WE2RQUKquNHuhsdkJOC2OTWieEuJVXz4jYuDvU3VC2eKR56GlReNB2rNA2lM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=fail (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=GeTACKuq reason="signature verification failed"; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="GeTACKuq"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 1841A40E027F;
	Wed,  2 Sep 2026 02:32:00 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=fail (4096-bit key)
	reason="fail (body has been altered)" header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id grKAqAkDQxBF; Wed,  2 Sep 2026 02:31:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1788316308; bh=EwFLC8HpYmRJXjFrVbfRa0roHEFDXarZtMTpmdyIJIo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GeTACKuq4sfjSafQmtL/mNU2DMZXKongg2aWLsv445YZFwuPNMcN+3RYV3NEAuRTn
	 Ocvt51Ehh163Yijix3A+3MFWpRBxGI8cuGfjtzNc5vA93trT/wR8flmDeQR9rSLd4j
	 C48FS45t2RylDIHjK3HGbQrqshjQxmcRFjxrDy8tMYbMUVVrWzLu/pvkRddhCEQbJj
	 5+cX0AnpQIZtV+OekTI6CVjkjbsNxLrbFgJ2X1QkWcUchDFGTOra1fUG54M+Fiq2Nb
	 IOUyQtwGnMyd5iyvbtGo4OxbbiZ2Atb0OgMN3bSILdSij1m/IG3cmWck7RxYNUJnrd
	 8cmsvDrlwyWHFOs90dB+12JWYp2kGKrz3arXahns0uS0wl7I4S6o+swbv36rMIu2O+
	 jiLBHQ2x3Z6hCcicGUyPSPWfx5AZu0yzptnrvgcIRGofB9w2U0iK6z1i1cQ10xthkt
	 XPMwTm7/Ld7QLSlrLcQTdbNCDrxxdl54HVaoN+bi3L7T+6C4eQPws/IZoLLDBI+YZU
	 AE2GZyfvie0is6REKzz249vK0NDF/oK6Hr311S9Gnvng8k705nwsOe5huyRNqIsZ9t
	 Lc5GQh1/6AIQS+sqOt815w2sq4nN8dmuJLcXhU2uJ/twqG8fMFReBXh6LIcHgKOLJU
	 T3i5k14MW/o20cT4ih1nIrlg=
Received: from stx.tnic (unknown [IPv6:2600:1700:38ca:c00::e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id F350E40E02C2;
	Wed,  2 Sep 2026 02:31:31 +0000 (UTC)
Date: Tue, 1 Sep 2026 19:31:29 -0700
From: Borislav Petkov <bp@alien8.de>
To: Mauricio Faria de Oliveira <mfo@igalia.com>,
	Michael Matz <matz@suse.de>, Richard Biener <rguenther@suse.de>
Cc: Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>, Juergen Gross <jgross@suse.com>,
	Alexey Dobriyan <adobriyan@gmail.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Jan Beulich <jbeulich@suse.com>, Brian Gerst <brgerst@gmail.com>,
	kernel-dev@igalia.com, linux-kernel@vger.kernel.org,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH v9 1/5] x86/boot: Remove "cc" clobber from memcmp()
Message-ID: <20260902023129.GGapeKgVlL2WgHcJcb@fat_crate.local>
References: <20260822-pvh-kasan-inline-v9-0-e70ef3b75b6a@igalia.com>
 <20260822-pvh-kasan-inline-v9-1-e70ef3b75b6a@igalia.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260822-pvh-kasan-inline-v9-1-e70ef3b75b6a@igalia.com>
Content-Transfer-Encoding: quoted-printable

On Sat, Aug 22, 2026 at 03:33:17PM -0300, Mauricio Faria de Oliveira wrot=
e:
> According to the GCC documentation, conditions in the flags register
> (e.g., "=3D@ccnz") are output operands [1] and the compiler is aware [2=
].
>=20
> Also, clobbers (e.g., "cc") may not overlap with an output operand [2].
>=20
> Thus, remove the "cc" clobber as it is redudant, and overlaps with, the
> "=3D@ccnz" output operand.
>=20
>     """
>     6.11.2.4 Flag Output Operands
>=20
>         On some targets, a special form of output operand exists by whi=
ch
>         conditions in the flags register may be outputs of the asm. [..=
.]
>=20
>     6.11.2.6 Clobbers and Scratch Registers
>=20
>         While the compiler is aware of changes to entries listed in the
>         output operands, [...]
>=20
>         Clobber descriptions may not in any way overlap with an input o=
r
>         output operand. [...]
>     """
>=20
> Reported-by: "H. Peter Anvin" <hpa@zytor.com>
> Link: https://lore.kernel.org/all/5e19b195-0ca2-4510-81cb-497b40e4aaf5@=
zytor.com/
> Fixes: a8c171c107c0 ("x86/boot: Add volatile, clobbers and zero-length =
test in memcmp()")
> Signed-off-by: Mauricio Faria de Oliveira <mfo@igalia.com>
> Link: https://gcc.gnu.org/onlinedocs/gcc/Extended-Asm.html#Flag-Output-=
Operands [1]
> Link: https://gcc.gnu.org/onlinedocs/gcc/Extended-Asm.html#Clobbers-and=
-Scratch-Registers-1 [2]
> ---
>  arch/x86/boot/string.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/arch/x86/boot/string.c b/arch/x86/boot/string.c
> index 1632d40e1f545ae0665597069b568ea6b6c263e5..03278b4393887cb71cb0638=
18d3378c4f52b06f8 100644
> --- a/arch/x86/boot/string.c
> +++ b/arch/x86/boot/string.c
> @@ -40,7 +40,7 @@ int memcmp(const void *s1, const void *s2, size_t len=
)
>  	asm volatile("test %3, %3\n\t"
>  		     "repe cmpsb"
>  		     : "=3D@ccnz" (diff), "+D" (s1), "+S" (s2), "+c" (len)
> -		     : : "cc", "memory");
> +		     : : "memory");
>  	return diff;
>  }

So far, so good.

But then I'd expect that gcc would enforce that. I know it can't have it =
when
the clobbers contain input or output regs:

In function =E2=80=98__memcmp=E2=80=99,
    inlined from =E2=80=98main=E2=80=99 at memcmp.c:25:6:
memcmp.c:11:9: error: =E2=80=98asm=E2=80=99 operand has impossible constr=
aints or there are not enough registers
   11 |         asm volatile("test %3, %3\n\t"
      |         ^~~

but with "cc" clobbers it works.

That's gcc-16 btw.

Micha, Richi?

--=20
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
