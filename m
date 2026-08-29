Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11DF9146A66
	for <linux-kernel@vger.kernel.org>; Sat, 29 Aug 2026 08:21:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787991702; cv=pass; b=cFPwKhIm2m7vWmyKifWGKFKuZaeEke4Ih2zmtb/P/tHQI4QDyKSU78dp9wR+E6uQEJvSwOuleFO1m8B4G8RcOQlU+FJjnCkBPySxmkTw3zcHqP8nGP+8YyXwDQocO/c8GHhdddfC/K8v6sf0cHIJkWEUDsTE/zYBeznmdmuHRE0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787991702; c=relaxed/simple;
	bh=Xmt2LcEI0vicxCfw80JA2tKyBEMb7Ir+ZWVj1/6whi0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YN1KZlBfaqU5xNDEnsfi9HriDJWNQ0/TgC09XzLRCP8G84y6geXm6rMYViQUCsNqbN8tZCNinYH5+U0sbHGp1I0gtI2ukcjCd8UxJAWBzf+XLl79DMHnonFGyFDdbWqTAkgFn9Mfho43PFXo+ajiBq87vqUod5/3xeAna5JsKIk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EUZB4w3C; arc=pass smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EUZB4w3C"
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-6a5ded53570so2463005a12.3
        for <linux-kernel@vger.kernel.org>; Sat, 29 Aug 2026 01:21:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787991699; cv=none;
        d=google.com; s=arc-20260327;
        b=n646dEaRoa54B15NGaCwzUDw41h3FVp3B0Og8sZb2/eVxSp9s/3FTmv8b83RV4ZIKN
         Dd150mNVXBnt8nHjzRZPpGhnVrLUumZ4f9w47alsWoyAqTZpYVc6rd/p57R4sVm14ORn
         N9aEY7F9PPoR95FUji+t8O3FFIc5BJE7A9+f/Y8fHfGg6xoATivPvjIgQ08jwP44jN1l
         3C5qclwvGlx+ZHVtgPwxXcp+hagpK8PGMaR3/vhCBk5tbYxHu4QuFccQUnH+fgAc6xz3
         sWm1rQ4vW3NwjCbarl6ZSGo5vy7LafBuvGjW+PjHrqr30NAxUDGdHaSlljKzPU1Cmsct
         Kokw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=k1MZm2tWs3G68gpfTZLBsA7bA0jIxMZAYcuwV/qYMa8=;
        fh=aBGmZkc9FBDH0rqb1oLEPJS4m7b9eY4IsqUgz8ZQaK8=;
        b=Q6psn4xGSJgkpJyoC1ZNS0Ep6B7MDZwrBfrG6gnjp4PHAtnMAhlk94XfBzl/Mv/YZw
         EYx+QdZ+SuccnqkakcH0yrk7aq8zEQcHG3CZNcMueWrP1bCR87FawUMxlL6d0HPGNwAj
         P1cz8TwZYbNxyzdUaUZD1X4x/UdStrCmdpDWBbEzn132doGJCYxCIanyeWr1f6vcvuEU
         UgTY+diLpcyBlJTxsP2gcjUiPWUymdBF8hPGgKo1R9UOkHEjl2kO9vuCe8ke/lO2l980
         SyJ+QoBqrCWiJ2Zyc/zWlr/U+KEbe09NY/OIimv+p8yjgnsny1JNy39jL1M49zfJKQzs
         ChxQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787991699; x=1788596499; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=k1MZm2tWs3G68gpfTZLBsA7bA0jIxMZAYcuwV/qYMa8=;
        b=EUZB4w3CYcGfbJU3K+vM0L4z5ks3yuu+si6bqvpzkOW7auF/CkhXiv/GKZlqBrqx9w
         srQamFqer8NfMwAfL/Zhyon5jkVe0LoijnoK2709SpVIio5u3O4ou3xEaCnRgAt8T1sz
         +5G4Ao/mF2Kf6jFdiBKNseSZ5a8MPTqK1JUvtvn2gc032AH/FWZRpLrNTN1MT65aRg0J
         z+9vduLJb1tZCPKkd6/70B4GmOoLl8mlaPjg2uy//AwtIsO1b00sN9bGZ5G0Vr7HA2Mh
         dHTdSImHEsENTCL6Aj1SVorkxH64N5/R+nAo7Q9MrBikHyfMKmFeUqq+RsFdb/rVEfUo
         JmQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787991699; x=1788596499;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=k1MZm2tWs3G68gpfTZLBsA7bA0jIxMZAYcuwV/qYMa8=;
        b=kecUcIR6z/rXYpTqZHyfMbY+YRIepc4Cvb19nXidmJTKGvBN+EIQ0FJFYY0nSMII4c
         fIL+WQHQ/2m+sIKwqPjXgVat7xIcvHZbdpC/+iiV4+UOvrEIGwGwUq6a9v6WO3x3kvoz
         CeWk5+DokJaMSgbLUQ9ej7XrYDZLNqwo/W+cNZywtM4LCoXrHwGrB/n5ccXhzlowPZKY
         78b5bzyl/pLHptxPzxcztextA7tWQBi6wX9B7PLmtj7EnEScmuOU4V6bWR48kf+BNrV/
         JwAWgpVlOmltHLIZjKKHN7KOcTKK/87W/2F+DHnCHj0jFgaEO1aA2OE5nSXCqP3US6fj
         W4DA==
X-Forwarded-Encrypted: i=1; AKwUvByOZS/stFaXCV9MrqCw333cB+t7H0T+CF7l2FOvAxQlKEBWkc5EoouLQ4u12FIopdt0PoXqxuOmHQXEWJ8=@vger.kernel.org
X-Gm-Message-State: AFuF++kymvDfbdJMEa2zJaVkNUUDN7BK0WF36jt+xec4X9CbSjyvlWlV
	kikDCD4ia315V0Fv3y19rfXNpPnWrSPzFel4slkzqzPMd3ZjfambPhag3EWA8dbSTlcQspcX4UH
	jfvxQQOdmHhInfJb6SzHwrh26rqkGWVi3JsQd
X-Gm-Gg: AYBFou0MSJGl/zha70Cm3fzQYU4BKQ419zBInsqeM8k3/caUE6nBQIvTjrY20BH80EF
	FXK7mpFxmBf6UmNyBVgsyIfPLHUtwS74bmNONa2lLAesgPjhBhP7q4ajc82SZigJ7jlNcBz4h4N
	jWw2WpurWkOLSxMxJ1vpTL4XcZNU9YWjEQvI1lGHQSw8utiGVH/5BBuz6m6h0qwYJpUxzEML6rr
	6LavFSYsDMIkvhNMXLhjB0Qof6CfCgeipCUKyPNjv9qbyoJT49VTZVL1PJ4nN/v3ojdw1jvm/Px
	/YHyRl6zcphMo66dZ3+uGN1LtL+wUhhh74wNg40DtdHr3ke6hxf6mkg9XBpUqIhbMAZ9tYv0OD2
	Q5aOYO0jyIN54yRkMQgOJlJJA9BWy9Gk=
X-Received: by 2002:a05:6402:a2cd:10b0:6a6:fe1:ab10 with SMTP id
 4fb4d7f45d1cf-6a60fe1ae0dmr6209217a12.6.1787991698907; Sat, 29 Aug 2026
 01:21:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260827182757.6856-1-linmag7@gmail.com> <20260827182757.6856-5-linmag7@gmail.com>
 <20260829062623.GA44338@ravnborg.org>
In-Reply-To: <20260829062623.GA44338@ravnborg.org>
From: Magnus Lindholm <linmag7@gmail.com>
Date: Sat, 29 Aug 2026 10:21:27 +0200
X-Gm-Features: AcwNN1Uqg3WNpv2SMeCAdSi_XoxXWJ1Qgmz64p5ll-3zF-vtkNvtYwWsshSym9U
Message-ID: <CA+=Fv5Qf1AmpVEfscnXPoVB9t1AHSwsPjFs65OzmEUMNER7ZrA@mail.gmail.com>
Subject: Re: [PATCH 4/5] sparc32: move early memory setup to setup_arch
To: Sam Ravnborg <sam@ravnborg.org>
Cc: sparclinux@vger.kernel.org, davem@davemloft.net, andreas@gaisler.com, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Sam,

On Sat, Aug 29, 2026 at 8:26=E2=80=AFAM Sam Ravnborg <sam@ravnborg.org> wro=
te:
>
> Hi Magnus
>
> On Thu, Aug 27, 2026 at 08:24:16PM +0200, Magnus Lindholm wrote:
> > Move the early memory configuration out of SRMMU paging setup and next =
to
> > the rest of setup_arch(). Derive the PFN limits from memblock, reserve =
the
> > kernel and initrd there, and retain mem=3D support with
> > memblock_enforce_memory_limit().
> >
> > When PAGE_OFFSET maps a relocated kernel, remove memory below phys_base
> > from memblock because it cannot be reached through the linear map. This
> > replaces the equivalent trimming of sp_banks.
> >
> Rebasing the relocate kernel patch on top of this would prevent the same
> code to be patched twice. But the end result would ofc be the same.
>

Doable, but as you say the end result would be the same. The relocate patch
is part of the phys_base series that's already posted and is a boot
prerequisite on my hardware, so pulling one patch out of it to re-land on
top of this while both are in flight felt like more churn than the tidier
history is worth.

> > -     for (i =3D 0; sp_banks[i].num_bytes !=3D 0; i++) {
> > -             unsigned long start =3D sp_banks[i].base_addr;
> > -             unsigned long end =3D start + sp_banks[i].num_bytes;
> > +     for_each_mem_range(i, &start, &end) {
> > +             unsigned long start_pfn =3D PFN_DOWN(start);
>
> Here for_each_mem_pfn_range() could be used.
>

Yes, that make sense

> > +     min_low_pfn =3D PFN_DOWN(memblock_start_of_DRAM());
> > +     pfn_base =3D phys_base >> PAGE_SHIFT;
> > +     max_pfn =3D PFN_DOWN(memblock_end_of_DRAM());
> > +     last_valid_pfn =3D max_pfn;
> last_valid_pfn can be replaced with max_low_pfn in all places.
> > +     max_low_pfn =3D max_pfn;
> Likewise, replace all uses of max_pfn with max_low_pfn.
>
> Code becomes easier to understand when the memblock defined variables
> are used.
>

I agree, I will fix this.


> > +     for_each_mem_range(i, &start, &end) {
> >               while (start < end) {
> >                       set_bit(start >> 20, sparc_valid_addr_bitmap);
> >                       start +=3D PAGE_SIZE;
> There are no users of sparc_valid_addr_bitmap, it would be better
> to drop the whole function in a preparation patch.
>
Well spotted, will do.


I'll get started on a v2 of this series and post it asap.

Regards

Magnus
