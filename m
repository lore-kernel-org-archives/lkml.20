Received: from mx1.white.stw.pengutronix.de (mx1.white.stw.pengutronix.de [185.203.200.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D8913A3830;
	Tue,  6 Oct 2026 12:31:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=185.203.200.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791289896; cv=pass; b=Bx2Xu5pRkicwjNKbRElNY6H+DC5bqBVltEDYnbmK2WW6hJIhx5Hr8aXphFGX+3o0NM/eNIggGoFiEQXahXRPndYYCm1akgifciqSI4b9rLzKGlpPxJVJ6JKiVcntGFwAAH//13S3/h9dx0TW2JtuCF5tHN/hy4R5PonjszVCdOk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791289896; c=relaxed/simple;
	bh=HVpCV1dSvhbWxEosfGerz6ENZ22WIIhDql+i6Q3PvTE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HGuw/HJh0oK2b7owU0vZPzzJucuJ61+KJsODAHrBgQNZwqAL/tTxnTEf7DHn/tI8QFvRW/r4GG0Nt2xbvP0r9fpzPetJicOkPeFjPitBP1JX1kip0Ed7Fym3XBvekZ+t5HlCQzYuuWDTLMI3F3PJ9RrtHi8B3mlPeG8L75pKpV8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; dkim=pass (2048-bit key) header.d=pengutronix.de header.i=@pengutronix.de header.b=SxrQ6Nem; arc=pass smtp.client-ip=185.203.200.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pengutronix.de header.i=@pengutronix.de header.b="SxrQ6Nem"
Received: from drehscheibe.grey.stw.pengutronix.de (drehscheibe.grey.stw.pengutronix.de [IPv6:2a0a:edc0:0:c01:1d::a2])
	(Authenticated sender: relay-from-drehscheibe.grey.stw.pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id 3CE7520007C;
	Tue, 06 Oct 2026 14:31:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1791289885;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=L0im0PLnd/YQWswPiiTSbDga0Fh6LCwdsluiX50dWRM=;
	b=SxrQ6NemPuhYrNi4+/Yf2Yxl47V2+gFjQQtt/DahuxYDVusdBx/rvlKftRSj7TSeJGWp3M
	CPkd3/FJiuHaAQrsbAcbJStvJ1lfRiVlLWwISPTun4vWYBiqdpp+AfjhO4NYevJa38u74M
	Rn3XHvqJhCcLs5vgWFX/2RS5qACq9yamqz6bs0XRRVNkMFqaikgzpV1zz36/vJH0JIidiD
	ZaB+m5QARPcFcgvXTYZbG981mq1llcj4RxyOLSRHf8RL306NW3x4mvOvNxVWh38B/5Al7B
	HPDy+xC5TWgxr79B1J86ncppxVR0lwU7BgEi8Auccd2Wuo3NKChdhEfBTAENqA==
ARC-Seal: i=1; s=20260414; d=pengutronix.de; t=1791289885; a=rsa-sha256;
	cv=none;
	b=QQpFqpYQoI6ljM3LPhmpaaXuMma2e9b0Yima61sydTZpFgYLMT0+CTu47V+Wxc1JGx4dpq
	OOMbqRNDu2bMAtolO6ChgjaOujbI57pO3QYlJXUk+g1TnDy2Oy8qGwmCLkmfdnVEklCxgg
	V9EytpZ1m/sMkKJp87z1MiA0bjPl9PBt0WQ80tmzTr7DpGf73yIqr3YHhWFNMqZDzYJu97
	JOkCzk4fsOPrOTdPtbZTMO5xJ2qRHwFnCQZy0qmg3wFqEBwM9m6N/HhOwRscNI9bXPeuEi
	gbnAsm78WDuGXRYh4uCWsD+0CaBHmRSTlZ7ZpWzSSgojYMuCZtKgGr2TyOqsvw==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=relay-from-drehscheibe.grey.stw.pengutronix.de smtp.mailfrom=mkl@pengutronix.de
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1791289885;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=L0im0PLnd/YQWswPiiTSbDga0Fh6LCwdsluiX50dWRM=;
	b=bMwf5EpDBKKsyzoZV1ySq09i1hv3izdknkMLK4BY89PZYvPPsRhlljoU+dpyiEnI0APrXR
	yANYh07gBOXxsX295bo9ub8wbKP4HOUAzrxlhrsDe9od9u229Qf6jFmKyHpIvgJeAsoTvc
	2FjZHKo6h0DKpHQJvudJP2d9bo/X9QJ6DYQu8FIPQt9yG0PP2Vj+hz8yrHa99wvPjjRlzw
	bdG9JkSSthdmbr//37w8bfGxWFFZXACGgINai0J+JQCshnzOkDN5QxeCO5G3NEIOhIljmR
	2a+bNKA5DWGWgtPgrvbevypgLGAa9vxElfea39gJAX57P9Z4WRBWTsRCLfcaGA==
Received: from moin.white.stw.pengutronix.de ([2a0a:edc0:0:b01:1d::7b] helo=bjornoya.blackshift.org)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <mkl@pengutronix.de>)
	id 1xE4KL-004Y0D-0M;
	Tue, 06 Oct 2026 14:31:25 +0200
Received: from pengutronix.de (90-182-211-1.rcp.o2.cz [90.182.211.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	(Authenticated sender: mkl-all@blackshift.org)
	by smtp.blackshift.org (Postfix) with ESMTPSA id 7C99A5BAED6;
	Tue, 06 Oct 2026 12:31:24 +0000 (UTC)
Date: Tue, 6 Oct 2026 14:31:24 +0200
From: Marc Kleine-Budde <mkl@pengutronix.de>
To: Stefan Kerkmann <s.kerkmann@pengutronix.de>, arnd@arndb.de
Cc: Ian Rogers <irogers@google.com>, 
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, Helge Deller <deller@gmx.de>, Andy Lutomirski <luto@kernel.org>, 
	Thomas Gleixner <tglx@linutronix.de>, Vincenzo Frascino <vincenzo.frascino@arm.com>, 
	Arnaldo Carvalho de Melo <acme@redhat.com>, linux-parisc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Eric Biggers <ebiggers@google.com>, Al Viro <viro@zeniv.linux.org.uk>, 
	Christophe Leroy <christophe.leroy@csgroup.eu>, "Jason A. Donenfeld" <Jason@zx2c4.com>
Subject: Re: [Regression] [PATCH v5 2/4] vdso: Switch get/put unaligned from
 packed struct to memcpy
Message-ID: <20261006-dynamic-succinct-woodpecker-a36c7f-mkl@pengutronix.de>
References: <20251016205126.2882625-1-irogers@google.com>
 <20251016205126.2882625-3-irogers@google.com>
 <47f8c30b-e326-4ff0-a2bc-5683209a9e2d@pengutronix.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="46dqfjvqqwrasbbc"
Content-Disposition: inline
In-Reply-To: <47f8c30b-e326-4ff0-a2bc-5683209a9e2d@pengutronix.de>


--46dqfjvqqwrasbbc
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [Regression] [PATCH v5 2/4] vdso: Switch get/put unaligned from
 packed struct to memcpy
MIME-Version: 1.0

Cc+ Arnd

On 28.09.2026 17:39:15, Stefan Kerkmann wrote:
> Hi Ian,
>
> On 10/16/25 22:51, Ian Rogers wrote:
> > Type punning is necessary for get/put unaligned but the use of a
> > packed struct violates strict aliasing rules, requiring
> > -fno-strict-aliasing to be passed to the C compiler. Switch to using
> > memcpy so that -fno-strict-aliasing isn't necessary.
> >
> > Signed-off-by: Ian Rogers <irogers@google.com>
> > ---
> >  include/vdso/unaligned.h | 41 ++++++++++++++++++++++++++++++++++------
> >  1 file changed, 35 insertions(+), 6 deletions(-)
> >
> > diff --git a/include/vdso/unaligned.h b/include/vdso/unaligned.h
> > index ff0c06b6513e..9076483c9fbb 100644
> > --- a/include/vdso/unaligned.h
> > +++ b/include/vdso/unaligned.h
> > @@ -2,14 +2,43 @@
> >  #ifndef __VDSO_UNALIGNED_H
> >  #define __VDSO_UNALIGNED_H
> >
> > -#define __get_unaligned_t(type, ptr) ({							\
> > -	const struct { type x; } __packed * __get_pptr =3D (typeof(__get_pptr=
))(ptr);	\
> > -	__get_pptr->x;									\
> > +#include <linux/compiler_types.h>
> > +
> > +/**
> > + * __get_unaligned_t - read an unaligned value from memory.
> > + * @type:	the type to load from the pointer.
> > + * @ptr:	the pointer to load from.
> > + *
> > + * Use memcpy to affect an unaligned type sized load avoiding undefine=
d behavior
> > + * from approaches like type punning that require -fno-strict-aliasing=
 in order
> > + * to be correct. As type may be const, use __unqual_scalar_typeof to =
map to a
> > + * non-const type - you can't memcpy into a const type. The
> > + * __get_unaligned_ctrl_type gives __unqual_scalar_typeof its required
> > + * expression rather than type, a pointer is used to avoid warnings ab=
out mixing
> > + * the use of 0 and NULL. The void* cast silences ubsan warnings.
> > + */
> > +#define __get_unaligned_t(type, ptr) ({					\
> > +	type *__get_unaligned_ctrl_type __always_unused =3D NULL;		\
> > +	__unqual_scalar_typeof(*__get_unaligned_ctrl_type) __get_unaligned_va=
l; \
> > +	__builtin_memcpy(&__get_unaligned_val, (void *)(ptr),		\
> > +			 sizeof(__get_unaligned_val));			\
> > +	__get_unaligned_val;						\
> >  })
> >
> > -#define __put_unaligned_t(type, val, ptr) do {						\
> > -	struct { type x; } __packed * __put_pptr =3D (typeof(__put_pptr))(ptr=
);		\
> > -	__put_pptr->x =3D (val);								\
> > +/**
> > + * __put_unaligned_t - write an unaligned value to memory.
> > + * @type:	the type of the value to store.
> > + * @val:	the value to store.
> > + * @ptr:	the pointer to store to.
> > + *
> > + * Use memcpy to affect an unaligned type sized store avoiding undefin=
ed
> > + * behavior from approaches like type punning that require -fno-strict=
-aliasing
> > + * in order to be correct. The void* cast silences ubsan warnings.
> > + */
> > +#define __put_unaligned_t(type, val, ptr) do {				\
> > +	type __put_unaligned_val =3D (val);				\
> > +	__builtin_memcpy((void *)(ptr), &__put_unaligned_val,		\
> > +			 sizeof(__put_unaligned_val));			\
> >  } while (0)
> >
> >  #endif /* __VDSO_UNALIGNED_H */
>
> commit a339671db64b ("vdso: Switch get/put_unaligned() from packed struct=
 to
> memcpy()"), which landed in 7.0, causes a performance regression on an NXP
> i.MX25 (ARMv5TE) SoC.
>
> I found it while updating a client's board from 6.12 to 7.0. A fio 4k ran=
dwrite
> benchmark on a NAND storage with UBI and UBIFS filesystem was the only wo=
rkload
> that showed a clear regression between those two versions, so I bisected =
with
> it:
>
> perf stat -e irq:irq_handler_entry --filter 'irq =3D=3D 49' -a \
>     -- \
>     fio --name=3Drw \
>     --filename=3D/var/stat/testfile \
>     --size=3D8M \
>     --rw=3Drandwrite \
>     --bs=3D4k \
>     --direct=3D0 \
>     --fsync=3D1 \
>     --numjobs=3D4 \
>     --group_reporting
>
> | kernel | irq_handler_entry | fio bw   |
> | ------ | ----------------- | -------- |
> | 6.12   | 155783            | 401KiB/s |
> | 6.13   | 162317            | 395KiB/s |
> | 6.14   | 168741            | 392KiB/s |
> | 6.15   | 168556            | 401KiB/s |
> | 6.16   | 166090            | 403KiB/s |
> | 6.17   | 162541            | 385KiB/s |
> | 6.18   | 157527            | 386KiB/s |
> | 6.19   | 183675            | 381KiB/s |
> | 7.0    | 190372            | 297KiB/s |
>
> The bisect targeted the large drop between 6.19 and 7.0; the smaller 6.17
> regression predates this commit and is unrelated. Reverting a339671db64b
> restores throughput to the 6.17 level (~385 KiB/s). The commit is still
> present in 7.3-rc5, and the same codegen problem reproduces there.
>
> Digging deeper, I built 7.3-rc5 with my config and GCC 16.2, with and wit=
hout
> the commit, and compared the object files: 114 of them differ. As
> <vdso/unaligned.h> is included by <linux/unaligned.h>, every
> get/put_unaligned() call site depends on it transitively. GCC did not inl=
ine
> __builtin_memcpy() and turned it into a function call, e.g. in crypto/crc=
32c.c
> (__chksum_finup(), inlined into chksum_digest()):
>
> Without the commit:
>
> <chksum_digest>:
>                    str    lr, [sp, #-0x4]!
>                    sub    sp, sp, #12
>                    str    lr, [sp, #-0x4]!
>                    bl    0xc0 <chksum_digest+0xc> @ imm =3D #-0x8
>         R_ARM_CALL    __gnu_mcount_nc
>                    ldr    r0, [r0]
>                    str    r3, [sp, #0x4]
>                    ldr    r0, [r0, #0x20]
>                    bl    0xd0 <chksum_digest+0x1c> @ imm =3D #-0x8
>         R_ARM_CALL    crc32c
>                    mvn    r2, r0
>                    mov    r0, #0
>                    ldr    r3, [sp, #0x4]
>                    lsr    r12, r2, #8
>                    lsr    r1, r2, #16
>                    strb    r2, [r3]
>                    lsr    r2, r2, #24
>                    strb    r12, [r3, #0x1]
>                    strb    r1, [r3, #0x2]
>                    strb    r2, [r3, #0x3]
>                    add    sp, sp, #12
>                    ldr    pc, [sp], #4
>
> With the commit:
>
> <chksum_digest>:
>                    push    {r4, lr}
>                    sub    sp, sp, #8
>                    str    lr, [sp, #-0x4]!
>                    bl    0x124 <chksum_digest+0xc> @ imm =3D #-0x8
>         R_ARM_CALL    __gnu_mcount_nc
>                    ldr    r0, [r0]
>                    ldr    r12, [pc, #0x54]        @ 0x188 <chksum_digest+=
0x70>
>                    ldr    r0, [r0, #0x20]
>                    mov    r4, r3
>                    ldr    r12, [r12]
>                    str    r12, [sp, #0x4]
>                    mov    r12, #0
>                    bl    0x144 <chksum_digest+0x2c> @ imm =3D #-0x8
>         R_ARM_CALL    crc32c
>                    mvn    r3, r0
>                    mov    r2, #4
>                    mov    r0, r4
>                    mov    r1, sp
>                    str    r3, [sp]
>                    bl    0x15c <chksum_digest+0x44> @ imm =3D #-0x8
>         R_ARM_CALL    memcpy
>                    ldr    r3, [pc, #0x20]         @ 0x188 <chksum_digest+=
0x70>
>                    ldr    r2, [r3]
>                    ldr    r3, [sp, #0x4]
>                    eors    r2, r3, r2
>                    mov    r3, #0
>                    bne    0x184 <chksum_digest+0x6c> @ imm =3D #0x8
>                    mov    r0, #0
>                    add    sp, sp, #8
>                    pop    {r4, pc}
>                    bl    0x184 <chksum_digest+0x6c> @ imm =3D #-0x8
>         R_ARM_CALL    __stack_chk_fail
>      188: 00 00 00 00      .word    0x00000000
>         R_ARM_ABS32    __stack_chk_guard
>
> Is this an accepted trade-off? My understanding is that the kernel is alw=
ays
> built with -fno-strict-aliasing, so the packed-struct type punning was we=
ll
> defined there, and the __packed annotation is what lets GCC generate valid
> code for the unaligned access.
>
> Best regards,
> Stefan
>
> --
> Pengutronix e.K.                       | Stefan Kerkmann             |
> Steuerwalder Str. 21                   | https://www.pengutronix.de/ |
> 31137 Hildesheim, Germany              | Phone: +49-5121-206917-128  |
> Amtsgericht Hildesheim, HRA 2686       | Fax:   +49-5121-206917-9    |
>
>

--
Pengutronix e.K.                 | Marc Kleine-Budde          |
Embedded Linux                   | https://www.pengutronix.de |
Vertretung N=C3=BCrnberg              | Phone: +49-5121-206917-129 |
Amtsgericht Hildesheim, HRA 2686 | Fax:   +49-5121-206917-9   |

--46dqfjvqqwrasbbc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSl+MghEFFAdY3pYJLMOmT6rpmt0gUCasTqGQAKCRDMOmT6rpmt
0sATAQCuUqoDXwz3FLL1iSvZtB/zTTDquPjPdTsmy/l8zIvQLQD+MmWBoOSwXa8T
OA/IkaciJBP/n5ATomKIVwCGteYq4wk=
=wFXj
-----END PGP SIGNATURE-----

--46dqfjvqqwrasbbc--
