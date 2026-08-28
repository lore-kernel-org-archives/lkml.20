Received: from mail-ua1-f47.google.com (mail-ua1-f47.google.com [209.85.222.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25F4D3A5435
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 17:21:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787937681; cv=none; b=TtUrsoYZO88fQwnZqBingiSni7ZbzU+2Sz0R3rXcQRd38M1L/NbafawgT79W3v+ySapTxMoU9rbHvKwWSECCZKxKhU6tcppWWB5V/gI68wmvZJTzkM1Rf57v8+5Aea/MyHZvSJagHg+Micq5SgQJg6trftjQZBEG+Qq55fVa9T8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787937681; c=relaxed/simple;
	bh=Xpsj3sNHf7YCaX2X/Mev6u16m0BiuWjf6tcRKQeCJ9o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QFEkBrzgy+xvsZhxwocse5JYm/CYGs+f0yKmfRUW82HCuwuoRPijwLyVWmkA3AipSyyjNjpDqNyFNQRvVtXhIpzneDJBiJ3uXEk4Gjc+FBx5I+IslIoA5ogyvMNbtXWjPyPAJfrH4AKwfV2VHezBIpiUMw5E7dBt71C6REKncBI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f47.google.com with SMTP id a1e0cc1a2514c-97caa212bf3so682930241.1
        for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 10:21:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787937679; x=1788542479;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=evpTKVZReIwvDgHYHGAoajVc7f3qpbEUisvP+F0+k+M=;
        b=b6A4MRhO+TQeRsmIIClKdvrN0hGgP988RoC41FTTd7LynaLMKkPN/+DtvYafgNw37p
         xyriYVF8vSvtJyjNoPSPvH2hhuWm/FmKollkn/QSuL0s4im+iNm7pX0Pzz+jN+5eOHL2
         87JSbErdPnjuZGFnBGTRgSJuaKeCf5ctj0bWhzg1318bGT4FGP6+OWzRofpHIEgEEKX+
         I/zyjbyASnw/aOCiS1/F1Ib+dobfIHgKAYn2zcItIzoFuwSgph+g84p6cqS5ZhS3znWi
         3UzwQRhTTAWn4Qi1OvZVsa7MdRPZpgh6/18gtASyAQU+nVZDnfixxI0JYX8orzOh8fqq
         ff3g==
X-Forwarded-Encrypted: i=1; AHgh+RoHYtgS8O6y2uNrZK8UATxaGg0YTPkFCy4KRUMPdH7JM9xQi8rQYIreXd5EABzwpDyQOvjVlRFhrflP3Ys=@vger.kernel.org
X-Gm-Message-State: AFuF++lDRDdMs6W60BsC6wdG3PuSXugb/OxNa9hI4cVBcK0FRagp6iJe
	UKfTgtH11RNxjOD5Rmi/AY2/eJswUKxxhJz7d4a8JFoY9E95eeMUhV5r6OzEaWzO
X-Gm-Gg: AR+sD10XH8V7RxOsBl7X6IQbWYUX00cmdDiL7O6MPTJ1h4eMlL4rn3uMgd2LWGh5aEv
	bIRC1UkU4hoB/hVCDT9VILf9FW8jfR36g8Rd76YIE7SGgCu3dymZ83PoPi96frNpKZNxTwcFXSc
	ACOYC4c+gyc7ZaXYV6i0BzHk3hN7N91zy/J1ymUGYTxZEd66Jqf0cFg5KUhLG48w5QMdi4gVJPa
	vRnLM7eEetbAgFnC7Kli4/m+lcuvUcwc+T5Xxs+02rE4Jp4MipohID2VXfyOILPubBWpfDp/p2t
	V9U7a+xTrJPk4PTnXaJzCFulM1RTmbaZ02q6cchNGZWjMOpvso4lTs/hovJkeEOW+G5/FALuvj8
	TQRpRerngs8IkVP1tTDDjZEDBL4jGIQw5Enh+rUgMeinIgCtlWtPUDXCOCFzDUueStyxe3kHCWv
	LL+NKLq0NFQ1EwGg8BCuXoWiVREVT91XhhWuG5DLux/0TWU1lWVhu1fE35mDKuYc+sAqZlPyte4
	XOTZJrf0u2zj0HM0+gFfmByKQ==
X-Received: by 2002:a05:6102:8094:b0:786:dfa:c5ea with SMTP id ada2fe7eead31-7860dfac7c1mr2132813137.5.1787937679081;
        Fri, 28 Aug 2026 10:21:19 -0700 (PDT)
Received: from mail-vs1-f51.google.com (mail-vs1-f51.google.com. [209.85.217.51])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-785f532aa2fsm1620959137.2.2026.08.28.10.21.18
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 28 Aug 2026 10:21:18 -0700 (PDT)
Received: by mail-vs1-f51.google.com with SMTP id ada2fe7eead31-7866d924eaaso376813137.2
        for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 10:21:18 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RqqmOipe5RRNw8drNu3VlzAdnFhWaoBBuhVQ5hBImmywX1t0kH+AwnpFWCBaP84Etc4ROTRZA4EMXj5yMk=@vger.kernel.org
X-Received: by 2002:a05:6102:54ab:b0:778:5bbb:b2d2 with SMTP id
 ada2fe7eead31-78599269b6amr3135505137.11.1787937678652; Fri, 28 Aug 2026
 10:21:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <c480ed6b8bf38822263e2c5b7cf32b28600f212d.1787219898.git.geert+renesas@glider.be>
 <CAMuHMdVyUAA3L4mUkSjmnuE3cvj-+N8z-Bhxsh1wa-FQWc=fjw@mail.gmail.com> <apGqg5a5I9g1CoF_@levanger>
In-Reply-To: <apGqg5a5I9g1CoF_@levanger>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 28 Aug 2026 19:21:07 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXwmCrzLZiPnQejJ+dTvVNf2zTzgKwTWEFEkfKRkZQpPQ@mail.gmail.com>
X-Gm-Features: AcwNN1XXn2qAoRTtHkxt_2I4cw2b47n5hgFTcYzlKhY5Mo5gPaW3qE-98baSbzY
Message-ID: <CAMuHMdXwmCrzLZiPnQejJ+dTvVNf2zTzgKwTWEFEkfKRkZQpPQ@mail.gmail.com>
Subject: Re: [PATCH] erofs: Fix EROFS_FS_ZIP_LZMA_DEFAULT_MAX_STREAMS default logic
To: Nicolas Schier <nsc@kernel.org>
Cc: Nathan Chancellor <nathan@kernel.org>, Gao Xiang <xiang@kernel.org>, Chao Yu <chao@kernel.org>, 
	Yue Hu <zbestahu@gmail.com>, Jeffle Xu <jefflexu@linux.alibaba.com>, 
	Sandeep Dhavale <dhavale@google.com>, Hongbo Li <hongbohbli@tencent.com>, 
	Chunhai Guo <guochunhai@vivo.com>, Michael Bommarito <michael.bommarito@gmail.com>, 
	linux-erofs@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
	linux-kbuild <linux-kbuild@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi Nicolas,

On Fri, 28 Aug 2026 at 17:47, Nicolas Schier <nsc@kernel.org> wrote:
> On Thu, Aug 20, 2026 at 12:15:33PM +0200, Geert Uytterhoeven wrote:
> > On Thu, 20 Aug 2026 at 12:01, Geert Uytterhoeven
> > <geert+renesas@glider.be> wrote:
> > > When NR_CPUS is less than 16, or when SMP is disabled, the default value
> > > of 16 is invalid.
> > >
> > > While actual configuration picks up a sensible and valid default
> > > (NR_CPUS or 1), "make savedefconfig" will still write a line like
> > >
> > >     CONFIG_EROFS_FS_ZIP_LZMA_DEFAULT_MAX_STREAMS=1
> > >
> > > to the defconfig file, even if that matches the sensible default.
> >
> > Is this a bug in kconfig?
>
> I am not able to reproduce that; this is what I see with ARCH=arm64
> (arm64 always has SMP=y):

[...]

> Thus, to me it looks as expected.  Do you still see the behaviour you
> described above?

Perhaps you cannot reproduce this because this fix is already
upstream as commit ab74edaeb1ae7c71 ("erofs: Fix
EROFS_FS_ZIP_LZMA_DEFAULT_MAX_STREAMS default logic")?

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
