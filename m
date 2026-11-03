Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793725009;
	b=puwUzQEjR8OcNcKWTMgbENP80oB2eUDbRqiBgNPtbMxG0iGf5M50I7gmpIiT/eMe2RML
	 MzwKVNUsmdLDJEMf5eYkHKvcPZ8rit/ItYcRU/XZEot6T9j0OFyZy517Z3Ir1lgz4JTgS
	 xJe0EKK4gKs/tb52JmMuz72miEz8xr7hv56jwrY5k0F7HsO3QFZAbLsGrCL97xhjXRKze
	 BhWZliSDob/gIld4AO6TihbEtAZZAX7uEp+Yy+BRojFGLR+k3shmLbt2XXbKhFCMFzYwH
	 YaFZHM8icqnwRSpuxcReL/kvl1K/n6+1BYuX7N2LBNODbMFea2F5ztQrJ1Z6XuvEr4A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793725009;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=u00v9p+RUdxqIPRxo9/1l1Zn1bcxXIjHtPQI/MyY3yY=;
	b=cgY3YfnVAoD9eaZ5Me9Y2rbyyMYvUu4/+NyJ+ViEGbKqUwkDzONaySWLOjQp7iMJ8V2O
	 E7AacSxNnBiDWGTwarYiQ3/4C7NFn2kzdtXeJbRZw3fEZgzc3p2JiGSfcbZ7SqqRRQScf
	 rV3K4BzBLyGtbcdPzkITiJJDMZhKsq3P52Quunl/WTwDsBJU5pYwYS6z4ypNLeCX13doC
	 svGYhHDRlnjcm2HyxC+XCuESJPwlXeLbJPKHBAhlX4yk2Vll0EBFHGKqTTReEysO53d4n
	 67RgkReZyrPBtOqLXM2vCNcVXQsIfEt1dbctK7zu9hdqrumtdaAxtKgnnXUyIqGOgvw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TaGj5T09;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 143A4606A329
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 16:56:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TaGj5T09
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AB7DA1F00A15
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 16:56:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793725008;
	bh=u00v9p+RUdxqIPRxo9/1l1Zn1bcxXIjHtPQI/MyY3yY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=TaGj5T09XEEWEnyjikMKxMV1836N9QpBHuKWrweBYQpN3iKprg6L4fcTCpIdOXpYq
	 0mvicIGADIBHtz40mVAwdl+7pTgAyPL6EZlogJJGjUsXt8m7TBAxsqV8Hw2iDRBAR7
	 /LrJJAVttrwClFBLNedpfFGSeIjwzIVuNNZeKC0o8yWzT2324w44hz9URT22L/K52v
	 u4h59cBWjMIDX75dxvNGTqb53+7u5yjdxkn1V3O78APlGPEamdY2V/neW9jXTZVeBr
	 v9BmLRWBpY2eQ4FhBm62LBrAEWPMwaGMNODv5qgUCer1qD3FQtdxdMuFlLFrosT2Ul
	 RQ+ci67HBOEJA==
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5bcb0f245e0so4164968e87.3
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 08:56:48 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBxQA0Rm3iOmjb2QbTAInkuw4aJyCkbcaguUuwptHdIr+DlXsZHZPbVMbTIRb/7mAmlFeV8JCglZbSBal2U=@vger.kernel.org
X-Gm-Message-State: APuU4Z+zHdNXBSN6O6i2sS92UEjKN912bBrTFy/TH3JYLrMQprf1VXSI
	lScMYynEO1zHs3zOKQQwwlfSfi8YJfBEEhBpLo8Ufb7CDsknMOMYxkaLzloxShvm/wtn4cKMGWF
	zGl+ewgcv+dWGwXKkqfftNLiqIHsSqSQ=
X-Received: by 2002:a05:6512:10c2:b0:5be:4340:d588 with SMTP id
 2adb3069b0e04-5bfd9566e55mr4813488e87.31.1793725007020; Tue, 03 Nov 2026
 08:56:47 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261029035253.2333852-1-yaojiale02@163.com> <20261029035253.2333852-2-yaojiale02@163.com>
 <aunzRO9rxFUlC0Ym@red-moon>
In-Reply-To: <aunzRO9rxFUlC0Ym@red-moon>
From: "Rafael J. Wysocki (Intel)" <rafael@kernel.org>
Date: Tue, 3 Nov 2026 17:56:34 +0100
X-Gmail-Original-Message-ID: <CAJZ5v0jtab00kmvS_1RoQHr=PKV3hj=AEP5hS_B-udj5KrQjsg@mail.gmail.com>
X-Gm-Features: AclHuK9IaHYinCfEPEj9175Cpk8zU69uV-UMGla90QOFlwHtZeWz8-rFk4SmMeg
Message-ID: <CAJZ5v0jtab00kmvS_1RoQHr=PKV3hj=AEP5hS_B-udj5KrQjsg@mail.gmail.com>
Subject: Re: [PATCH v2 01/20] ACPI: irqchip: validate MADT entry bounds before probing
To: Lorenzo Pieralisi <lpieralisi@kernel.org>
Cc: Jiale Yao <yaojiale02@163.com>, "Rafael J. Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>, 
	Thomas Gleixner <tglx@kernel.org>, Marc Zyngier <Marc.Zyngier@arm.com>, 
	Hanjun Guo <guohanjun@huawei.com>, linux-acpi@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 3, 2026 at 3:44=E2=80=AFPM Lorenzo Pieralisi <lpieralisi@kernel=
.org> wrote:
>
> On Thu, Oct 29, 2026 at 11:52:32AM +0800, Jiale Yao wrote:
> > IRQ chip probing invokes validation and probe callbacks after the commo=
n
> > table walker has only established that a generic subtable header is
> > readable. A malformed length can leave callback field accesses outside
> > the MADT.
> >
> > Validate the generic header length and ensure the complete declared
> > entry is contained in the table before invoking IRQ chip callbacks.
> >
> > Fixes: e647b532275b ("ACPI: Add early device probing infrastructure")
> > Cc: stable@vger.kernel.org
>
> I don't think this patch fixes anything (actually you don't know, it
> might break kernels that are currently booting).
>
> Remove the stable tag (on the whole series, though others might have a
> different opinion). If this gets merged, goes to stable and then
> we discover it triggers a regression (on existing platforms whose
> ACPI tables are broken but the system is working) it would be very
> annoying.
>
> > Signed-off-by: Jiale Yao <yaojiale02@163.com>
> > ---
> >  drivers/acpi/scan.c | 7 +++++++
> >  1 file changed, 7 insertions(+)
> >
> > diff --git a/drivers/acpi/scan.c b/drivers/acpi/scan.c
> > index 0b17a7e51956..10e8d736f44b 100644
> > --- a/drivers/acpi/scan.c
> > +++ b/drivers/acpi/scan.c
> > @@ -2896,6 +2896,13 @@ static DEFINE_MUTEX(acpi_probe_mutex);
> >  static int __init acpi_match_madt(union acpi_subtable_headers *header,
> >                                 const unsigned long end)
> >  {
> > +     unsigned long start =3D (unsigned long)header;
> > +
> > +     if (start >=3D end || end - start < sizeof(header->common) ||
> > +         header->common.length < sizeof(header->common) ||
> > +         header->common.length > end - start)
> > +             return -EINVAL;
>
> This is a check that AFAICS could be done in acpi_parse_entries_array() o=
nce
> for all (where you also know header->common is what you need checking, bt=
w).
>
> Actually, what's missing there to avoid peppering the kernel with
> BAD_MADT_ENTRY checks is the entry size (that we could add with a LUT).
>
> The downsize is that by centralizing it, if anything breaks (which is
> possible) we have to revert it and therefore remove the check for all
> consumers.
>
> I don't know. Rafael, all, thoughts on this ?

I have concerns similar to yours: It may break systems that currently boot.

That said, I can imagine a hostile host trying to crash a CoCo guest
by exploiting this missing check.

It might be better to try to use the actual length instead of
header->common.length if the latter is too large though.
