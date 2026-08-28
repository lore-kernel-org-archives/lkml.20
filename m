Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F1E03E9C26
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 08:42:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787906536; cv=pass; b=VFBrTb2O/s1qynS9AoXh3uTbLb46PHk3caL173Dx6xMj0KzsfXO9pEXGcHIENg4iuIDMcW3Z223mBvV+CHOMpgYIYVeGkIhrH2kIH7T9e4FQmjQR1ZBbJD48xORTcUYyJn6XJ6bA5TFM4NJIXQRU4yCmSCfEMHsjE9+V+id5x1w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787906536; c=relaxed/simple;
	bh=fEE+65zMqX/ESlt+j6tEmMpTDakYWgxrcLiEmC0Yq0A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aRMnWZ9hiIYZmkjCoVsP/y0E4Ee8fPHUzNjtd6JIMfAj4skViI5gYWUHLEZqYYPzd5nZIZI5T+sOj5UERb1Jd8ebL6xt8HkfTT1PxH67UmHyLLNBh6SZyzQTzVAsS86VZbPgG0ZwGcY87g99kQuaPuzQ2Lx0PGDlzwDS0Qg3Efw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com; spf=pass smtp.mailfrom=sifive.com; dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b=JHHaZLXd; arc=pass smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sifive.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="JHHaZLXd"
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-c207cb16cf5so121479766b.1
        for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 01:42:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787906532; cv=none;
        d=google.com; s=arc-20260327;
        b=PUM7vhdLD69G7Vk8Q5vl5KtFwfokfVgRbEHOO2zlXEaEfBd8XBI4zrkseKHPio2apV
         6YUe+czCRv7MOhTqrrveqVGQxhXmp7Ox4Y2vs4nlbh+mYuAtp+DaL9Om8OZI321r9R7M
         ma2i9PT+UGpSCc9tEU4vL5xoL9+Iawkefz9nooOlKhf7EB7lADtq4h073hbjxOFn3PE3
         by9NctL+fhn378h+2H8g2kO2IAidFZH+JqoueTEH91CcH96orrf+Agx/hmXeNJKzd7c0
         rsOQGaAQ/OAJeDEUR2yYl9h1x9ayBVWoF32ibgxIBQGkXb+Dr/G+fGHfoBXUdpwwhIoP
         7X3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ezFi05tPQzp8t++/2HJlKxh2g0ZUNbvpyQdfBqWin94=;
        fh=cZhhWNexwcI8tgT+fJdED0KHnx8S853PD5oPCUQMfQ4=;
        b=esR19MfqZ4TXVaQvXwNODxNRokD7cZyb4v11RzTV8aG8fQaoUivGx06J+shj5U8kaA
         ojtK8KPgolfquSFEpBCiqyESIcrdVKTq8o5djk6Cpomq1Asy4ux/M2hh3LcrPtFVHOVg
         mARnTni/S6Zd2V7Hj5ULf0HgKw5KMlV9msbv0/oWv4PDQVXaSKKlYAr/f10KncWrjdZ9
         pQoxYA84vFSXJkzb/n1nvK2VFgSNmHtFoRcz9vmn7/M6qzwpcu9BZUTLICyNReVOfqSg
         AqbYbBxD9Ckol3/xMwKwB+CEkeGIV/TJwnjnoVKp9NDhA+Yqyds2UDmFEOCJeV5M+z7E
         Nu/Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1787906532; x=1788511332; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ezFi05tPQzp8t++/2HJlKxh2g0ZUNbvpyQdfBqWin94=;
        b=JHHaZLXdkYEXbeJ3HsbnpPmnqgw9kPKvGI6jsykuKzX+9Rc3dSFwx5qgk9q5hYp6u1
         BhquNc5u6GauamBVczBgNA1GnKBxFr34hwbKZk9IEbd9ZXO50q4KRS7CfS/rbbLnV9KI
         INaCgf7UQMYd3clcEqIQVyLdkIk/LnuT831rz0+PEC/brfpFWQOEOdq89Hl13AmqjNUX
         SBxYi0qb0zJ2Pil8rCwGwyhe9+Qa4TB4Aia6O+FJYe7wIyMQdcMJgumtrVNsaKBGhcBo
         rg6WYJMw0kn7OPLx5cm30rCT9rhwLFsQ4SOhYIikXjLk3NI5FD7gF0kxv2Onz/YdKoPK
         8Qlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787906532; x=1788511332;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ezFi05tPQzp8t++/2HJlKxh2g0ZUNbvpyQdfBqWin94=;
        b=n2RbX0Q8V+mvKscuIFBOF6ZPpaBA+/N+RnUTxdmFNVLfcJoqQrvqMunMI9FEIP1Dng
         diTj3QJmHOr24027/qnPLlymJs1J4TAZOkAJl2sxokMAsjDdzGndCf5SYGDkGun6Vfh6
         pZjPkzyCttaiWxp3CBQTentDFkPafrCzlx06mYHO86p6lBfGiZmJAc7owMOAsHgT7H7O
         KsIOf4jptXgcs726dUFMSYCldiRArQynSHGZ5a/S1qxrlka7RQmHO8nwMEbyhKblndGu
         iwN312WC/7YDebC+Tq8m3eHYgkIXi88pahiiX6s0vDDxtTo7dX9+63AkKY8wtlfMQuRX
         l84w==
X-Forwarded-Encrypted: i=1; AHgh+RpQrzXqokIIqhP1E9mCv+yTkAwUqaTMAvWizYAUNvAMJrrt176aPfYONplXJfdt1jR8NSIWhb/2WK0QRYs=@vger.kernel.org
X-Gm-Message-State: AFuF++nsie/0DfwYOniaWS5irT7HN8VjTrQwrkvwcg68GJK59cD83p/d
	8CkGkB9DJXVH9KReeRUPviV7Pr6KdtTTzPwe+UoEfw85qc9s7sByjQGLLACP+AEz+bAaPf+5tLq
	lt8/EEfOh6lePOUYbswU3IJv1PRZBhyg2IWV+p//E5g==
X-Gm-Gg: AR+sD11zMZC0rBVu0rNTdwkRuTNvMu4ux1aK0z4pouAi48x4Dk6KY0C9ChA+q/CWt//
	QudRUxsLs9hG81ytBODcBJZNCvXwAm6clReZAQ4aYeZ3ATOqaFyan28mfRyW2IypA/fvqtOfHJs
	T7SBPn3hfQhEgBFHinP7eHS4WssrAWXH4kxQvycZtZWzTCyoNf3ipW3QAo5+0i8POjZUzrC1Ktp
	SOlD+prHhdNFUxe3kGFZlmHMeeELrxiqJD7/10kMiBzJOqrrLxgqKqhZ1//ZASRT6JaDvYtaBNR
	jzc1ml9Z5yuHVAH438t8VtWMb3q3LxU6RX1QI58hIlH8Cn0=
X-Received: by 2002:a17:906:f596:b0:c24:c22c:6372 with SMTP id
 a640c23a62f3a-c2556bc89ddmr380599066b.5.1787906532051; Fri, 28 Aug 2026
 01:42:12 -0700 (PDT)
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
 <20260618143634.7f3dd6c5@pumpkin> <CANXhq0qtt7U3jKEB4drvSn7gg55nwWm8VFnfY-NRGjBaWVr_MQ@mail.gmail.com>
 <20260828085211.2c8e6b74@pumpkin>
In-Reply-To: <20260828085211.2c8e6b74@pumpkin>
From: Zong Li <zong.li@sifive.com>
Date: Fri, 28 Aug 2026 16:41:57 +0800
X-Gm-Features: AcwNN1Vs0PjxxPtn0TUC_KuzAnVZJvtJ55ltk6ptl2Y2t9swn9PGcyLQJdEC5LA
Message-ID: <CANXhq0q0pRXbL3sA9hFoFh6YGJh+M8SDUcXNhsHDA433mFb8+w@mail.gmail.com>
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

On Fri, Aug 28, 2026 at 3:52=E2=80=AFPM David Laight
<david.laight.linux@gmail.com> wrote:
>
> On Fri, 28 Aug 2026 10:52:08 +0800
> Zong Li <zong.li@sifive.com> wrote:
>
> > On Fri, Jun 19, 2026 at 12:02=E2=80=AFAM David Laight
> > <david.laight.linux@gmail.com> wrote:
> > >
> > > On Thu, 18 Jun 2026 17:51:34 +0800
> > > Guo Ren <guoren@kernel.org> wrote:
> > >
> > > > Hi Vivian,
> > > >
> > > > As noted in the RISC-V IOMMU Specification, Chapter 6:
> > > > > Whether an 8-byte access to an IOMMU register is single-copy atom=
ic is UNSPECIFIED, and such an access may appear, internally to the IOMMU, =
as if two separate 4-byte accesses =E2=80=94 first to the high half and sec=
ond to the low half =E2=80=94 were performed.
> > > >
> > > > Therefore, the atomicity of 64-bit MMIO accesses is UNSPECIFIED and
> > > > not clearly defined in the current ratified RISC-V IOMMU
> > > > specification. To handle this correctly, the Linux RISC-V IOMMU dri=
ver
> > > > should fall back to 32-bit MMIO accesses when reading 64-bit regist=
ers
> > > > (e.g., performance counters). The behavior of 32-bit MMIO accesses =
is
> > > > more precisely defined in the RISC-V IOMMU specification.
> > > >
> > > > Thus, many hardware vendors implement 32-bit MMIO (rather than 64-b=
it
> > > > MMIO) based on the current ratified RISC-V IOMMU specification, and
> > > > this driver does not appear to benefit from 64-bit MMIO access eith=
er.
> > > > Performance is fundamentally constrained by bus latency; assuming t=
hat
> > > > simply reducing the number of accesses will improve performance is =
an
> > > > oversimplification that ignores the underlying hardware
> > > > characteristics.
> > >
> > > If the bus latency is significant it is almost certainly worth using
> > > memory accesses to avoid re-reading the hi register.
> > >
> > > Something like this might work:
> > >
> > > static volatile u32 hi_prev, lo_prev;
> > >
> > >         u32 hi =3D read_reg_hi();
> > >         u32 lo =3D read_reg_lo();
> > >
> > >         if (lo <=3D lo_prev || hi !=3D hi_prev) {
> > >                 u32 hi_tmp =3D read_reg_hi;
> > >                 if (hi_tmp !=3D hi) {
> > >                         hi =3D hi_tmp;
> > >                         lo =3D 0;
> > >                 }
> > >                 lo_prev =3D ~0u;
> > >                 hi_prev =3D hi;
> > >         }
> > >         lo_prev =3D lo;
> > >         return (u64)hi << 32 | lo;
> > >
> >
> > Hi Daivd,
> >
> > I included this in my v5 of the IOMMU PMU series, but we noticed that
> > sashiko-bot AI reported two issues:
>
> I did say 'something like this' might work....
>

Got it! Thanks for clarifying. Just to share with you and everyone
here, I will go with the previous version. Thanks again!

> David
>
> >
> > 1: The lo_prev is immediately overwritten:
> > The trailing 'pmu->lo_prev[idx] =3D lo;' is outside the if block and
> > runs unconditionally, so the 'lo_prev =3D ~0u' is clobbered before the
> > function even returns. It never survives to the next call. lo_prev
> > ends up holding the guessed value (typically 0) instead, which is a
> > perfectly ordinary small number, and the intended "always re-verify
> > next time" behaviour never happens. The sentinel write was effectively
> > dead code.
> >
> > 2: The wrap check itself can miss a wrap
> > Here is a concrete sequence. Assume a previous call left hi_prev =3D 1
> > and lo_prev =3D 5, i.e. the counter was 0x1_00000005. Some time later
> > the counter has advanced close to 0x1_FFFFFFFF:
> >
> >   1. hi =3D readl(addr + 4)  -> counter is 0x1_FFFFFFF0, so hi =3D 1
> >   2. the counter crosses the boundary and becomes 0x2_00000008
> >   3. lo =3D readl(addr)      -> lo =3D 8
> >
> > The check then evaluates:
> >
> >   lo (8) <=3D lo_prev (5)   -> false
> >   hi (1) !=3D hi_prev (1)   -> false
> >
> > Both are false, so the fast path is taken and 0x1_00000008 is
> > returned. The true value is 0x2_00000008, so the result is short by
> > 2^32 and the third read of the high half never even executes.
> >
> > Both situations share the same root cause: It puts the reliable check
> > (the third read) inside an if guarded by the unreliable cross-call
> > heuristic 'lo <=3D lo_prev || hi !=3D hi_prev)'
> > Case 1 is an issue in the bookkeeping that heuristic depends on, and
> > case 2 shows that even with correct bookkeeping the heuristic is not
> > sound.
> >
> > To make everything simpler, I would use your first version for the
> > latest IOMMU PMU series:
> >
> >         hi =3D read_hi();
> >         lo =3D read_lo();
> >         if (hi !=3D read_hi()) {
> >                 // Pick a value that happened while doing the reads.
> >                 hi++;
> >                 lo =3D 0;
> >         }
> >
> > > It shouldn't need any locking but the accesses do need to be ordered.
> > >
> > >         David
> > >
> > >
> > >
> > > _______________________________________________
> > > linux-riscv mailing list
> > > linux-riscv@lists.infradead.org
> > > http://lists.infradead.org/mailman/listinfo/linux-riscv
>
