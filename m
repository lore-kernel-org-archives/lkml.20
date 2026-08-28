Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F35079CD
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 02:52:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787885544; cv=pass; b=QoNnjpemtzVP2xLKTxhzRVbt/k0CgtEaoh5ntyUnVWmezuyNvZiq2pyncJN6uLVaGhhwUcsAgjfAZLv/3FBRXD7Y6k5bID8jWVIP5QIjzPBZB9rfcgx0kYHLN5IUUG+sxdDN5r0WazFg001AF4qPhtxDyoyB5nJDtiXUTlfrx7s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787885544; c=relaxed/simple;
	bh=jVA0PcZIH71MOyCtuzwmqMkCrpkwsifi0+vB2mTyXio=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gXmu0i8MR3e70aoHLb+0MhL6yPHdKY/sltOyLWiviDdLMUriBomPRR7NfgUBeLUwPZyi6pzzP3J9iVdY6JR9apKUHLK7CMdGLusM7T9h3erXfsSAkwAMxx64H+bAIwiHN5g+RJhbcO12A/kazOqZxfIlC//9CNX+88aFjPQVCPE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com; spf=pass smtp.mailfrom=sifive.com; dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b=WvWcjvx8; arc=pass smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sifive.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="WvWcjvx8"
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-c15e2dab83eso91014966b.1
        for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 19:52:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787885541; cv=none;
        d=google.com; s=arc-20260327;
        b=C2Eme5rVII3hx6vbl8IXSUpgBAAD6iXSAOXqSFzCTbnllIsT3KoRKTlqgl7XoTA6ka
         bYj8nLNSSRH5e8ZaUNoMvy3ICpwgYvQ6aWfwDtDnpaLd/ZeqLYjmIQic72jX3HKlQbVZ
         lVjZlwtA58PgAjeAu+pflB8svLXVTZCImeGvyoD7PjP3QP2U+C8IZYeQwlnrLV3xYB+5
         IjT8F4yXNkGshcfm3FFLN7y77qCLI8zJkjS+Lx3IadfyH4N263jb5ja7nuXwYvIb451/
         RfR2oX8Nv+gJKcx3p5TvsFgBnJsF9qttN/WDEh/MCqKAsSWrw0ncZBbpyqZuWIH9xjxW
         zYvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=8h8ajQ5iXnMhCt1P+yDUVUP4cBmcnCV7lKhnpULiS68=;
        fh=W74kPeekkYjuHC1/uU0HP26KOMWrp9v/osHqL4dGnjc=;
        b=UXWCRe90Jz9U3uoBBjgrNnOT4lcYooMUN+Y213L92NWDIEBwP/lvQy05uHBXri9wSM
         X0Xij+NwVKBubB7ONITh5uY7JBUYTI7P6RmSZZD1o/uWcN3uO+3rVdP4KeE+8eT3X6Bu
         gOVjhab6mU9GxJFcCbD9eQ84K2eIRESSO6OA0PoPbUTNHZmlFmNroyQJa17WL90cUOkZ
         2+t/i1L203LoHtqApTZ8FhWYv0abJdMqnmxzfd6HKyTwfzK0jmO5IPJPesbpYuIdopzp
         N2aoKjvMwM7zjpLHppq7BZe4CkhfY/eXnouJvZsFxK70Z1mTpoWaSo6ghkRJ+NPHlJeH
         rOYA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1787885541; x=1788490341; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=8h8ajQ5iXnMhCt1P+yDUVUP4cBmcnCV7lKhnpULiS68=;
        b=WvWcjvx81XclzV5Do9eIZ280uPAP2vLyME9CUGQMTVluMGDZBQnqdJrvE0mcNP2i6n
         bwa8biKkgc8BjLhh1EQhYogYU57JCaXJ/5xEs7r2oeeMDfx7TsgAdaYKvgamAWsr1HD2
         uHvkDNzCYaTIMJ3XbouEomb5DOdBdq1IsgcHIUUznJ+jnYYxihFvPb3hvpB+Qgej2X6X
         6ezODTdjU5M08II/5V9l5HFKw6+ZulVYgvDoAiZ8BHp8aD484IfimC2AtLuLWxKqBfiT
         IarqQpdGJcoe/ZtWZ5nW6XF3BuKhlTidcmRl78+yvna1t8G8S30+GN5jGGWd+Xo7jeSB
         9dDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787885541; x=1788490341;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8h8ajQ5iXnMhCt1P+yDUVUP4cBmcnCV7lKhnpULiS68=;
        b=HsXZ1Fcis3PRAeGA/CQvcYp+lowphdMnnU4qIqTzlDd78QtgfFMAk+jwwuz7gw+f0k
         DzV2kwJs+fPZE7QhfqCPPLl+5G+yu5XGqNVLgRYbPMatCCha9ypqqkMlkIxRPoDh3apQ
         X5X0PX5W+XFc/G96fGvGdyPFRYl+H2O99g5E5VC3uk+sr0ciBbSePhdhrJ0KyclsMHau
         qn6EzDgHCMA2cf8wykySTgsF64VeHB/oIwx7houJw/rNA6tp1+qz6qu2puzVBe34qzWv
         3ZsPbOxvNm3GaJb/Nq6nK3uqC080ey65fD8eEIRa5Ge2uAE29WYMsyJHGhv45luJUbP2
         B88A==
X-Forwarded-Encrypted: i=1; AHgh+RotatrYZ6+Al7WHZRO9GA/zNcSCQTNH+VkPm3E1kgmamY/Zduincsen5Ip97w9yrIjHsWbKITVxPH5pz94=@vger.kernel.org
X-Gm-Message-State: AFuF++mRkVma4uAmyeMNtN9BeNMf++g+KbBfE6XK5VfpsAs9YRNYTbvt
	I/wTXzgwB/uO65T9QGlRiUaybfVtPYdGl337gqChcTJBRz67SIflxNLwsUrj23+hjJUnPaCsygr
	ZzM2HQyQDyg1zQMe5LFij9VLhtiFDMZv02eZ1tQZ6oA==
X-Gm-Gg: AR+sD12E1G2YBEio+rQgvdBBTSt5UkTi20fmJr4YFPSqffUpYcZ6ozUV1oFiRHh3WpK
	1xlw0TLziY+9cno9fytq0mDD3QLkiTdgVnqQx3gfRSSpLBPp2c/nbFCC6ZoIHja4Tx38XEgLt02
	oyvTTTd0PDAgAST9GRZ3rPgt0wb5POWVZCzzA+yjCFK9n6+AodQu6sTaMMz3knxvubl4cFUwCuX
	6JGdFDttoHsU1jHjinlbqPtdI9zwZziTqPImAu+VOeQVO9Tzn4g1/afj9C4MthkBeKfUFYRCY5L
	+rdevCN6APoUdfY2fNNZHGvcFt/cQ8AymMEj/c19zclDMUemdWlMAq+oYA==
X-Received: by 2002:a17:907:a091:b0:c16:8adf:f183 with SMTP id
 a640c23a62f3a-c255742f3e2mr190741766b.14.1787885540701; Thu, 27 Aug 2026
 19:52:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260615064855.90316-1-zhangzhanpeng.jasper@bytedance.com>
 <20260615123821.373248-1-guoren@kernel.org> <7c490aeb-a3d9-4fe9-81de-f9662577851d@iscas.ac.cn>
 <CAJF2gTQ+-gpvUDtOh99aKP2-iDJy3MYOWti9k2Ntd0-J0MXqxQ@mail.gmail.com>
 <e051d822-d0be-4a88-ba86-ec9b5905fd1e@iscas.ac.cn> <CAJF2gTRH6x78A3J5HJ5kUM47aDv8R0yFr8LRP+7jiLX4GL3ssg@mail.gmail.com>
 <20260618143634.7f3dd6c5@pumpkin>
In-Reply-To: <20260618143634.7f3dd6c5@pumpkin>
From: Zong Li <zong.li@sifive.com>
Date: Fri, 28 Aug 2026 10:52:08 +0800
X-Gm-Features: AcwNN1XwesBjMwTR7nVyOfHazvWEdcWRn6IE55RF21RXQf02dtzp-bwH5tm1dh0
Message-ID: <CANXhq0qtt7U3jKEB4drvSn7gg55nwWm8VFnfY-NRGjBaWVr_MQ@mail.gmail.com>
Subject: Re: [PATCH v1] iommu/riscv: Support 32-bit register accesses
To: David Laight <david.laight.linux@gmail.com>
Cc: Guo Ren <guoren@kernel.org>, Vivian Wang <wangruikang@iscas.ac.cn>, 
	zhangzhanpeng.jasper@bytedance.com, alex@ghiti.fr, aou@eecs.berkeley.edu, 
	cuiyunhui@bytedance.com, iommu@lists.linux.dev, joro@8bytes.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	luxu.kernel@bytedance.com, palmer@dabbelt.com, pjw@kernel.org, 
	robin.murphy@arm.com, tjeznach@rivosinc.com, will@kernel.org, 
	yuanzhu@bytedance.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 19, 2026 at 12:02=E2=80=AFAM David Laight
<david.laight.linux@gmail.com> wrote:
>
> On Thu, 18 Jun 2026 17:51:34 +0800
> Guo Ren <guoren@kernel.org> wrote:
>
> > Hi Vivian,
> >
> > As noted in the RISC-V IOMMU Specification, Chapter 6:
> > > Whether an 8-byte access to an IOMMU register is single-copy atomic i=
s UNSPECIFIED, and such an access may appear, internally to the IOMMU, as i=
f two separate 4-byte accesses =E2=80=94 first to the high half and second =
to the low half =E2=80=94 were performed.
> >
> > Therefore, the atomicity of 64-bit MMIO accesses is UNSPECIFIED and
> > not clearly defined in the current ratified RISC-V IOMMU
> > specification. To handle this correctly, the Linux RISC-V IOMMU driver
> > should fall back to 32-bit MMIO accesses when reading 64-bit registers
> > (e.g., performance counters). The behavior of 32-bit MMIO accesses is
> > more precisely defined in the RISC-V IOMMU specification.
> >
> > Thus, many hardware vendors implement 32-bit MMIO (rather than 64-bit
> > MMIO) based on the current ratified RISC-V IOMMU specification, and
> > this driver does not appear to benefit from 64-bit MMIO access either.
> > Performance is fundamentally constrained by bus latency; assuming that
> > simply reducing the number of accesses will improve performance is an
> > oversimplification that ignores the underlying hardware
> > characteristics.
>
> If the bus latency is significant it is almost certainly worth using
> memory accesses to avoid re-reading the hi register.
>
> Something like this might work:
>
> static volatile u32 hi_prev, lo_prev;
>
>         u32 hi =3D read_reg_hi();
>         u32 lo =3D read_reg_lo();
>
>         if (lo <=3D lo_prev || hi !=3D hi_prev) {
>                 u32 hi_tmp =3D read_reg_hi;
>                 if (hi_tmp !=3D hi) {
>                         hi =3D hi_tmp;
>                         lo =3D 0;
>                 }
>                 lo_prev =3D ~0u;
>                 hi_prev =3D hi;
>         }
>         lo_prev =3D lo;
>         return (u64)hi << 32 | lo;
>

Hi Daivd,

I included this in my v5 of the IOMMU PMU series, but we noticed that
sashiko-bot AI reported two issues:

1: The lo_prev is immediately overwritten:
The trailing 'pmu->lo_prev[idx] =3D lo;' is outside the if block and
runs unconditionally, so the 'lo_prev =3D ~0u' is clobbered before the
function even returns. It never survives to the next call. lo_prev
ends up holding the guessed value (typically 0) instead, which is a
perfectly ordinary small number, and the intended "always re-verify
next time" behaviour never happens. The sentinel write was effectively
dead code.

2: The wrap check itself can miss a wrap
Here is a concrete sequence. Assume a previous call left hi_prev =3D 1
and lo_prev =3D 5, i.e. the counter was 0x1_00000005. Some time later
the counter has advanced close to 0x1_FFFFFFFF:

  1. hi =3D readl(addr + 4)  -> counter is 0x1_FFFFFFF0, so hi =3D 1
  2. the counter crosses the boundary and becomes 0x2_00000008
  3. lo =3D readl(addr)      -> lo =3D 8

The check then evaluates:

  lo (8) <=3D lo_prev (5)   -> false
  hi (1) !=3D hi_prev (1)   -> false

Both are false, so the fast path is taken and 0x1_00000008 is
returned. The true value is 0x2_00000008, so the result is short by
2^32 and the third read of the high half never even executes.

Both situations share the same root cause: It puts the reliable check
(the third read) inside an if guarded by the unreliable cross-call
heuristic 'lo <=3D lo_prev || hi !=3D hi_prev)'
Case 1 is an issue in the bookkeeping that heuristic depends on, and
case 2 shows that even with correct bookkeeping the heuristic is not
sound.

To make everything simpler, I would use your first version for the
latest IOMMU PMU series:

        hi =3D read_hi();
        lo =3D read_lo();
        if (hi !=3D read_hi()) {
                // Pick a value that happened while doing the reads.
                hi++;
                lo =3D 0;
        }

> It shouldn't need any locking but the accesses do need to be ordered.
>
>         David
>
>
>
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv
