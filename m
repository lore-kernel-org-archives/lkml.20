Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2C794E80BD
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 15:59:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.180
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790611154; cv=pass; b=s7ZDXlBKSrGIxk8yGI+OChziEkMb5akRuAj9p3QqPE/3310vfDJSOl7JtTw80J2PMC86EtisFAej3xoULDYo/xeVBtv1RdbRfgq6IUoSXnP44WGITj3j8nMbjKqhyWIughm8twBeDS8fRmRvQ+GP3uMdRSkbJpKt830CemKV5mA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790611154; c=relaxed/simple;
	bh=3R0bnUDCIfG5AB/zI6SVEdqlvDxRk1RhQmI3kuQGWBY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Hu+L6I6TM+nVbEcKXrcJRZJeBu32TnXb/uQmLYv4gVoUVrx+W6onmI0yd13x5WZunOKTZxDCyx/W6wT7xUro0rwsVsm537QSqWvK2zVfzIwAJUGKX6uEd+MQnzTvz2Ed27AxyDYuILCXc9xBETrJsZLS7HrWXYWedHjDZWLxahQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=A1GWxLDW; arc=pass smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="A1GWxLDW"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2d8facae850so96895ad.0
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 08:59:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790611151; cv=none;
        d=google.com; s=arc-20260327;
        b=pEHIpl9mDsKvbqP6lnbmxzCphkpOjDzqByfIfRwCTWo3lVTDi5SAwbYtG9zhwmuRP8
         Gc4cFj2CWzu4TKZzJqJBQnPA8Fol1lObtZOMoyOQEMqOXPNDjCOxBigkvD0mNl0OsuGN
         OMrVcODRz3YQggv0UAFeEMSr2NYDe3Q9Clz/mw0/FAEX3DHz2WS1Bd98u4opZfVirAmX
         yJRjF2J8yk6Syp0saujJ+HiqK5072puWUiCfmrqWvPV7/lVa2HS/azxy9ZDWpT45LV9S
         BTze3ddlDl5egJ+8wfHnYvr6E/+j2R0WVNOt5qrNjl1JRUGc5aTvErrnWzOe+bASPyY6
         bB9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=aePuW6SdMhb4ew66W72zQFU5ACf7q5ldJc5VJ/cdC7o=;
        fh=IaltTrLxx5gbz49C1nNKneldAej7O+xzFg0JPgGKdz4=;
        b=LQc6duS3mm/ykE2Y9y5W32B7HownNrAOPqZB0Y2gFekBeiUVBavRFQEuBHtOVUBMeM
         eweck6hJkLduquQoRYl2IgFQ6BNtM8zctBw1yrSXcIIWruiuxNuxaEXpdxpSEzVFaEr5
         bc5pE8KmJfr59Y6ub+DkzPQJJMgIoQ4/MBRkDfemdBO9L8NBBrxN2lumiA6NiVXFe1Kn
         Hhim4APhg0/S3vT30h317A/HdxKyc3y+ecL6bIPZbunJkwMpzK5OFHwqKNCxhSipcudt
         UsedtmKDMXpriHGTjDjP3StSE0j07Ia8NQtbCQYG3vS3wE8a8ycA90Si4u7q14vCErrs
         X8VQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790611151; x=1791215951; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=aePuW6SdMhb4ew66W72zQFU5ACf7q5ldJc5VJ/cdC7o=;
        b=A1GWxLDWXd6nns7krLcj8xc5CZo4eIiNay5RL+VWGElhMGdokhu/XwPQWezVjkc2M5
         jGEKz0C02tab/tRR60LZYSLMQKs9a3jcP93G/gOOjTc2C/lH6GkIWyWQrwHvLMEivR1V
         948wbqDPcOCic9IBpOQVEmsznrqVQOMwGXEpPVX9OAWNQUY6vlhxEa0yDqETDk8hi3NS
         clPc3NR8HKTgywslo2B8wO+foaqTumMtJUWl39k0VXP91VbcIfB8hBstev5lstKwbsAr
         C+ooj/DTgP1Ro5tHsTKgebQn3vpuivmTFiuaxXVsb96TwVFqU+eaQmwmWfDiKqSrkLw+
         dfGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790611151; x=1791215951;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aePuW6SdMhb4ew66W72zQFU5ACf7q5ldJc5VJ/cdC7o=;
        b=h1JoaTOEPMjRwwwlca8kKFLSOOPRZo9kOm1DXONiwDkgyOdfE0QeF/CAeRHQ0h4Drx
         JTQt0fKlWqI/zFc+Hhzd9OYV6yw9Jn1p+GpzhYAqCRmUiwOhQAsvyqA25j5i7ef1G89h
         XdlbxGDDcpB6UHc3+bXw6zy3NCsppMSH3v8u8jkETCGs8ZcLa9JwS7Ipxi//EzPGxHvd
         u5jBtPC48deBDQ0CtvxhHGFmXKuDsqXA0OZ4foC4+S+YRXmIfFxkHptPOVQ0KQBL3dvQ
         O+ZzQ2IVEm2ejVkx0QSNN0K7Veh3H1EpCzPLJSTn7LWJu8r7gaVwUEABkHQCHDZj0VjU
         y9yA==
X-Forwarded-Encrypted: i=1; AKwUvBxef5EAfFEMfLzMGYMYL5M/Od11dZV1lbmItFBTjHaMzrG5yauAkjokQyyGXmNN+AkWjbwMcZd+6AEcTPY=@vger.kernel.org
X-Gm-Message-State: AFq9FYIT2KXms20STDWEsM2tWH6ykrQFod4UJijzUsQmMztsCLEy9ajD
	9TZICnei8/f1A0uXDRhChd7Y+dOAst5Rgwk5W7/sHgNxJ7ciY/LoT8ZsgZ9qeFLFUOq41wFTvSh
	OZKA3yhIIGXfKIecFWapK1EPI8+5mNe6nvVqtTKai
X-Gm-Gg: AYBFou2gMF8jzUPdVmzBQgBxcUPnqdWHjL/xxelBgmJpfAorMWp+LmoAwto1Jo4eh4K
	j9YENobN5vX8nMnKjLjXs32uPYu6IUqEC4U1XPZY4Z+HJOk/yGb55b2MMRPwu3YrVSUMyzR2MsP
	vMYfsfy1g4Fn7IiTofzgt6CKXUnOxO6t+umbeAgHTao7S33sTGuRaPl+/VB7qg1ZRXVF0YKc+W8
	L6udqrB7FpTwbqGYTBors6NS6BRU/UbnHlRKrfdPdjsn3zTl53OrcHqCUHDUtny5HyjN0XrWApl
	z7s5TORANBBbU6hkn/PdCGXHn8qXLVoSVq9bUL3UpAsMo/bXsGJ0ifCvbYlcN8w0Xa2V6k886cQ
	C1gXRNoOI
X-Received: by 2002:a17:903:1aa3:b0:2d5:db38:800f with SMTP id
 d9443c01a7336-2dfa6227507mr7954595ad.14.1790611150463; Mon, 28 Sep 2026
 08:59:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251016205126.2882625-1-irogers@google.com> <20251016205126.2882625-3-irogers@google.com>
 <47f8c30b-e326-4ff0-a2bc-5683209a9e2d@pengutronix.de>
In-Reply-To: <47f8c30b-e326-4ff0-a2bc-5683209a9e2d@pengutronix.de>
From: Ian Rogers <irogers@google.com>
Date: Mon, 28 Sep 2026 08:58:57 -0700
X-Gm-Features: AclHuK8PY4tYRy8xE2PQkLwp-Hd2yqHo30sGWzuk88EQmRBlMd_99GCwO19cbdY
Message-ID: <CAP-5=fVBLzMG7bPAHAiYtfx-NLUTgUo+fxP87SrQ=eH2saKzxA@mail.gmail.com>
Subject: Re: [Regression] [PATCH v5 2/4] vdso: Switch get/put unaligned from
 packed struct to memcpy
To: Stefan Kerkmann <s.kerkmann@pengutronix.de>
Cc: "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, Helge Deller <deller@gmx.de>, 
	Andy Lutomirski <luto@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, 
	Vincenzo Frascino <vincenzo.frascino@arm.com>, Arnaldo Carvalho de Melo <acme@redhat.com>, 
	linux-parisc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Eric Biggers <ebiggers@google.com>, Al Viro <viro@zeniv.linux.org.uk>, 
	Christophe Leroy <christophe.leroy@csgroup.eu>, "Jason A. Donenfeld" <Jason@zx2c4.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 28, 2026 at 8:39=E2=80=AFAM Stefan Kerkmann
<s.kerkmann@pengutronix.de> wrote:
>
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
> > -#define __get_unaligned_t(type, ptr) ({                               =
                       \
> > -     const struct { type x; } __packed * __get_pptr =3D (typeof(__get_=
pptr))(ptr);     \
> > -     __get_pptr->x;                                                   =
               \
> > +#include <linux/compiler_types.h>
> > +
> > +/**
> > + * __get_unaligned_t - read an unaligned value from memory.
> > + * @type:    the type to load from the pointer.
> > + * @ptr:     the pointer to load from.
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
> > +#define __get_unaligned_t(type, ptr) ({                               =
       \
> > +     type *__get_unaligned_ctrl_type __always_unused =3D NULL;        =
 \
> > +     __unqual_scalar_typeof(*__get_unaligned_ctrl_type) __get_unaligne=
d_val; \
> > +     __builtin_memcpy(&__get_unaligned_val, (void *)(ptr),           \
> > +                      sizeof(__get_unaligned_val));                  \
> > +     __get_unaligned_val;                                            \
> >  })
> >
> > -#define __put_unaligned_t(type, val, ptr) do {                        =
                       \
> > -     struct { type x; } __packed * __put_pptr =3D (typeof(__put_pptr))=
(ptr);           \
> > -     __put_pptr->x =3D (val);                                         =
                 \
> > +/**
> > + * __put_unaligned_t - write an unaligned value to memory.
> > + * @type:    the type of the value to store.
> > + * @val:     the value to store.
> > + * @ptr:     the pointer to store to.
> > + *
> > + * Use memcpy to affect an unaligned type sized store avoiding undefin=
ed
> > + * behavior from approaches like type punning that require -fno-strict=
-aliasing
> > + * in order to be correct. The void* cast silences ubsan warnings.
> > + */
> > +#define __put_unaligned_t(type, val, ptr) do {                        =
       \
> > +     type __put_unaligned_val =3D (val);                              =
 \
> > +     __builtin_memcpy((void *)(ptr), &__put_unaligned_val,           \
> > +                      sizeof(__put_unaligned_val));                  \
> >  } while (0)
> >
> >  #endif /* __VDSO_UNALIGNED_H */
>
> commit a339671db64b ("vdso: Switch get/put_unaligned() from packed struct=
 to
> memcpy()"), which landed in 7.0, causes a performance regression on an NX=
P
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
> defined there, and the __packed annotation is what lets GCC generate vali=
d
> code for the unaligned access.

Hi Stefan,

and sorry for the performance regression! I largely work on the perf
tool which is in the tools/ directory but uses kernel header files,
such as for unaligned accesses. My work was motivated by trying to
avoid using -fno-strict-aliasing in the perf tool.

As the compiler is given __builtin_memcpy of a fixed memory size then
the lowering should match that of using the packed struct. Are there
compiler flags you are using that disable compiler optimizations? This
feels like a compiler bug, a workaround is to use the packed struct
helpers in linux/unaligned/packed_struct.h

Thanks,
Ian

> Best regards,
> Stefan
>
> --
> Pengutronix e.K.                       | Stefan Kerkmann             |
> Steuerwalder Str. 21                   | https://www.pengutronix.de/ |
> 31137 Hildesheim, Germany              | Phone: +49-5121-206917-128  |
> Amtsgericht Hildesheim, HRA 2686       | Fax:   +49-5121-206917-9    |
>
