Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A8093C3F44
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 07:52:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787903537; cv=none; b=DkElL5opEnFdSj2Uo4a52j9son6kMBYVAXepE5MNwXxSg5ZG8gW/dthe3PLHift7KphiZnW53vRykgC90V81NY+HHaGgbjs8JgSkwJ2a/+XDk2OgtshEnxBeQdQ65eXO+8JIe65bWEGDyFcgDoXqB3K1tCcK84Pamj1kK+saBjk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787903537; c=relaxed/simple;
	bh=u/tGPPqBBEVd8O2Hj/FgEbwAVUSqAv9cUQZB1DooYEY=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=hvCpetPlUJWVBERFM3fOW0YgGA7+E2/mPKz94MGF+zbwtnbFTKu7aIbo7zlvywxio4e2tOMW6Ped7cvK9wb6EBdtIQQUQLYG1evb2KnKkXgb9C0+ihvSblbSWeJiCRtAC5bwcKxTZ0xLIA3Q07o6bESzsfh6dIi4lHgiDiZWqR8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=R3ET67Qs; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="R3ET67Qs"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-49b9320423cso4597595e9.0
        for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 00:52:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787903534; x=1788508334; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=dg/MQ8inXuFFEbvgK+mHsA3iNLAg+xiUDh4PfNOolRQ=;
        b=R3ET67QsKid4vT9n2O7ME6lEU8POFOsUYhTBii/jaWWOR1rZ0fhEm1eIr8Rrtk76GJ
         2BlbQi+qxpVDdqWKhdsbLEMm8sXCpcmUjm2OSKxsgxoIKK1TrqxOO2YHUBfKnOiAKzVX
         suJRjRJXFMPl7qsOoTkzLQiseFoqc9CR6k75QBPui/Pa+LP8zhVUYiUKneAM/poRpxGM
         NLMhLKjdFJIxr+JIYpSbSQ0u1VYx6gkDUME3PyjmAGGr3W5xM8joFxl6Ai3db2ElMlH+
         dEJj+1ruIueBcFh3lE2aeP7skP2IWXJjjJDrnxFcXMr1mERP4tTaPKm34yYou1w+jB4S
         WTeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787903534; x=1788508334;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dg/MQ8inXuFFEbvgK+mHsA3iNLAg+xiUDh4PfNOolRQ=;
        b=a0f0cVFkzxLDcvzooX0LmbiP8Z9CEkJAQj1lKIEdfVN9ZkqVTAbq8Q5eyFaFWZcjdn
         5tUvR5bzsQKgVzU7PxYWbvKf0/149Q6ZG1jEinh12ayWs5qCDkWTUz9HBcFDhP2PFJtL
         XkhfIH09+o70M9wcBxQ/ixmMXOjJPqP7myy3/0ZkkJ6dpjqJmkdCWhG5BBltlFwm5K2l
         NP4Eh/y0NWPUhd0+GSTxoJ+EMuBTY3siMtzC10or5F/BLHYZpqTyv1S3ShRRQlT2RGuk
         EzQY13UA8rCiUii8hRriQTtnrU9qX8OacykDnWgERWBdgaVCkG44u6Ab7da0SNaiUxmb
         pDaA==
X-Forwarded-Encrypted: i=1; AHgh+Ro0FN0ndAsDTUYanpyrTSyO8m4pUrKi3b+R01hBunTNwJmxY5ILIfsAiQca28Bg34ieGglR2vqMsrdDuv8=@vger.kernel.org
X-Gm-Message-State: AFuF++knZuQyD0R0PEuZ5MaB5OyaY6Qq0bBGpMnYZ5KIPf72L9Oox5jQ
	+X2ISSr6Hf+d43aoN6Rm5HDX3HiDT0vTzKIjQ12zeKcIJRi62mOsQcvH
X-Gm-Gg: AR+sD12Dbfp9Oib5+PGjJawcqKPuOcg56C79mlOOWSCiWfmOxqnhrsPbaLUexUopWyF
	B2PdxasMi5kospe3xyavgDn0Cj82GtNsv21m4jKZs8oxIkqq8ynyTPLVyOIKFB7yowiBziKCxow
	2p3g5pemtYEdZrrblyEr3J0vFAkaBEXAHJpJWJ2qXZyit28pipIqh+V4KfUqQtAUbXpVb/v5OMy
	K4eYPGPA5O3mfT8ANWSVMsy4OZlSijzDXQ+DycZujsdGyjZHAZM7Cef2beUoIap0xLtamMdCaMt
	nu5XSeFX8XmHX9i9LbJHvDYnZGpawc2FzwM/66KbADf5b5gs9AeGSrdY0kELD8jYlmTwTJLREQF
	/zTttVi3xGi0Xgi1y94CqNYkESY9qUZ3OqMnO621mcGnQ2qzk2lXWwSF0N0oiO2JymL2ObhC9FO
	0Jfpq8iCU1Qo4WpmZ1/butEHDlZvWrjl+0rY3JwCXVNsxfeoWF8pxPIu+Rs4SuoAANmnxaj8mts
	ZDWiTOWB9Yqpmp6j3T3CqsuAw==
X-Received: by 2002:a05:600c:1394:b0:499:83f1:398 with SMTP id 5b1f17b1804b1-49b91c47b6bmr60078885e9.9.1787903533497;
        Fri, 28 Aug 2026 00:52:13 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49b95013d06sm41438895e9.12.2026.08.28.00.52.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Aug 2026 00:52:13 -0700 (PDT)
Date: Fri, 28 Aug 2026 08:52:11 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Zong Li <zong.li@sifive.com>
Cc: Guo Ren <guoren@kernel.org>, Vivian Wang <wangruikang@iscas.ac.cn>,
 zhangzhanpeng.jasper@bytedance.com, alex@ghiti.fr, aou@eecs.berkeley.edu,
 cuiyunhui@bytedance.com, iommu@lists.linux.dev, joro@8bytes.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 luxu.kernel@bytedance.com, palmer@dabbelt.com, pjw@kernel.org,
 robin.murphy@arm.com, tjeznach@rivosinc.com, will@kernel.org,
 yuanzhu@bytedance.com
Subject: Re: [PATCH v1] iommu/riscv: Support 32-bit register accesses
Message-ID: <20260828085211.2c8e6b74@pumpkin>
In-Reply-To: <CANXhq0qtt7U3jKEB4drvSn7gg55nwWm8VFnfY-NRGjBaWVr_MQ@mail.gmail.com>
References: <20260615064855.90316-1-zhangzhanpeng.jasper@bytedance.com>
	<20260615123821.373248-1-guoren@kernel.org>
	<7c490aeb-a3d9-4fe9-81de-f9662577851d@iscas.ac.cn>
	<CAJF2gTQ+-gpvUDtOh99aKP2-iDJy3MYOWti9k2Ntd0-J0MXqxQ@mail.gmail.com>
	<e051d822-d0be-4a88-ba86-ec9b5905fd1e@iscas.ac.cn>
	<CAJF2gTRH6x78A3J5HJ5kUM47aDv8R0yFr8LRP+7jiLX4GL3ssg@mail.gmail.com>
	<20260618143634.7f3dd6c5@pumpkin>
	<CANXhq0qtt7U3jKEB4drvSn7gg55nwWm8VFnfY-NRGjBaWVr_MQ@mail.gmail.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Fri, 28 Aug 2026 10:52:08 +0800
Zong Li <zong.li@sifive.com> wrote:

> On Fri, Jun 19, 2026 at 12:02=E2=80=AFAM David Laight
> <david.laight.linux@gmail.com> wrote:
> >
> > On Thu, 18 Jun 2026 17:51:34 +0800
> > Guo Ren <guoren@kernel.org> wrote:
> > =20
> > > Hi Vivian,
> > >
> > > As noted in the RISC-V IOMMU Specification, Chapter 6: =20
> > > > Whether an 8-byte access to an IOMMU register is single-copy atomic=
 is UNSPECIFIED, and such an access may appear, internally to the IOMMU, as=
 if two separate 4-byte accesses =E2=80=94 first to the high half and secon=
d to the low half =E2=80=94 were performed. =20
> > >
> > > Therefore, the atomicity of 64-bit MMIO accesses is UNSPECIFIED and
> > > not clearly defined in the current ratified RISC-V IOMMU
> > > specification. To handle this correctly, the Linux RISC-V IOMMU driver
> > > should fall back to 32-bit MMIO accesses when reading 64-bit registers
> > > (e.g., performance counters). The behavior of 32-bit MMIO accesses is
> > > more precisely defined in the RISC-V IOMMU specification.
> > >
> > > Thus, many hardware vendors implement 32-bit MMIO (rather than 64-bit
> > > MMIO) based on the current ratified RISC-V IOMMU specification, and
> > > this driver does not appear to benefit from 64-bit MMIO access either.
> > > Performance is fundamentally constrained by bus latency; assuming that
> > > simply reducing the number of accesses will improve performance is an
> > > oversimplification that ignores the underlying hardware
> > > characteristics. =20
> >
> > If the bus latency is significant it is almost certainly worth using
> > memory accesses to avoid re-reading the hi register.
> >
> > Something like this might work:
> >
> > static volatile u32 hi_prev, lo_prev;
> >
> >         u32 hi =3D read_reg_hi();
> >         u32 lo =3D read_reg_lo();
> >
> >         if (lo <=3D lo_prev || hi !=3D hi_prev) {
> >                 u32 hi_tmp =3D read_reg_hi;
> >                 if (hi_tmp !=3D hi) {
> >                         hi =3D hi_tmp;
> >                         lo =3D 0;
> >                 }
> >                 lo_prev =3D ~0u;
> >                 hi_prev =3D hi;
> >         }
> >         lo_prev =3D lo;
> >         return (u64)hi << 32 | lo;
> > =20
>=20
> Hi Daivd,
>=20
> I included this in my v5 of the IOMMU PMU series, but we noticed that
> sashiko-bot AI reported two issues:

I did say 'something like this' might work....

David

>=20
> 1: The lo_prev is immediately overwritten:
> The trailing 'pmu->lo_prev[idx] =3D lo;' is outside the if block and
> runs unconditionally, so the 'lo_prev =3D ~0u' is clobbered before the
> function even returns. It never survives to the next call. lo_prev
> ends up holding the guessed value (typically 0) instead, which is a
> perfectly ordinary small number, and the intended "always re-verify
> next time" behaviour never happens. The sentinel write was effectively
> dead code.
>=20
> 2: The wrap check itself can miss a wrap
> Here is a concrete sequence. Assume a previous call left hi_prev =3D 1
> and lo_prev =3D 5, i.e. the counter was 0x1_00000005. Some time later
> the counter has advanced close to 0x1_FFFFFFFF:
>=20
>   1. hi =3D readl(addr + 4)  -> counter is 0x1_FFFFFFF0, so hi =3D 1
>   2. the counter crosses the boundary and becomes 0x2_00000008
>   3. lo =3D readl(addr)      -> lo =3D 8
>=20
> The check then evaluates:
>=20
>   lo (8) <=3D lo_prev (5)   -> false
>   hi (1) !=3D hi_prev (1)   -> false
>=20
> Both are false, so the fast path is taken and 0x1_00000008 is
> returned. The true value is 0x2_00000008, so the result is short by
> 2^32 and the third read of the high half never even executes.
>=20
> Both situations share the same root cause: It puts the reliable check
> (the third read) inside an if guarded by the unreliable cross-call
> heuristic 'lo <=3D lo_prev || hi !=3D hi_prev)'
> Case 1 is an issue in the bookkeeping that heuristic depends on, and
> case 2 shows that even with correct bookkeeping the heuristic is not
> sound.
>=20
> To make everything simpler, I would use your first version for the
> latest IOMMU PMU series:
>=20
>         hi =3D read_hi();
>         lo =3D read_lo();
>         if (hi !=3D read_hi()) {
>                 // Pick a value that happened while doing the reads.
>                 hi++;
>                 lo =3D 0;
>         }
>=20
> > It shouldn't need any locking but the accesses do need to be ordered.
> >
> >         David
> >
> >
> >
> > _______________________________________________
> > linux-riscv mailing list
> > linux-riscv@lists.infradead.org
> > http://lists.infradead.org/mailman/listinfo/linux-riscv =20

