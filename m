Received: from mail-vs1-f45.google.com (mail-vs1-f45.google.com [209.85.217.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D08F73B2FC0
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 08:41:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791880915; cv=none; b=k4gKiPl5lmm+lwicoYJB2/Nk59ntfIuRU8ve9ME8StVuzUBrw1f9yPI6PqxHmCBCS5cxdJWvXL8wnMYMQwH8ktVlDs4PRXJgeO4k0guDSpsieT/iOEx1G/Rd//wLraVofvIMTXFwDYjAW8Dd3tpA0CsjcIPTBC07j2BgLfPQWrM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791880915; c=relaxed/simple;
	bh=iiLFboFitnzBHsaT+sxc8vk+RQSNGJRxx7TyVNfIINU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KhZHyQrvtuUGOXi7ub3RYgqUMZmltNzwMJgpkqRIcb5cndu3w7gDrmnHCMYRLaBLrl56wiaeu6uKeJ81e2x+UtaKz860uDvzcR3ivGhyS40kZ6Cs5+6gGD/cWBfVjTJ49uZf5307v23Dy0+e7IOxm1ZyPeaiReXSg9XF1i2QaFI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f45.google.com with SMTP id ada2fe7eead31-78fb9d46f0aso1434276137.0
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 01:41:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791880913; x=1792485713;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=7d2pO7Vy0vJkBeOnC8nnzEd3ICQOoYmzmIOgS10xlyA=;
        b=GrnPy9SY9m5InfM3lDHQzcwVsUovbyvRlzXiFkCHFDiqsgV2Xtp1c50AO4nROI4y//
         esTlhJ3XtaX+sVvoiOOsEDhBF9RuwNYqk7W9hTjaCz0FNFYemDQaXw8dG1hdU0Q9Jlac
         TmZ56kVaSOHSFokfnifxBF+nNGVKNUUkRiYEaTBwth54KA0gu/NDGgo+uJg4UbW91D79
         LIKICTmQOP+xNXEJkmousPyYd+T8WXXCxLJxJPnJ0U2qTfj+K/BMQ5FRXf2bzmFtQcm/
         l+rugnQO20v/NnwGbXVhH2azrB3l9SJIkZ90YzM/jWpulpR5KSQJa99h79jFdlP3doqP
         rxLQ==
X-Forwarded-Encrypted: i=1; AKwUvByEoEL2uzs77fsHa2/5O54ervSl+HaDb/TZXvxgN0iTjeI1nPmF4lSpVKKNuPTxZxQaX36K+5Fj/WOBB28=@vger.kernel.org
X-Gm-Message-State: AFq9FYLWlC6zBYCRqc7E10ZgJIN7gAxIXGGZdNpp1datygi4obtmXMQ0
	5kcP1XuhTOFBMdwBMvY2ALXCtZhLo4Zk/2sUzR/VZbeFtTIKb+f86MH6JXju1Grx
X-Gm-Gg: AYBFou1zgR6C1OjNBF4VL+ax8kgvi6MoswhEicCiZ9ecYIS7W+OkbLFEpij44v6lFDV
	j2c9sltMJk/YUkyWAXzJd1aLzJoQHvzuC1y9QaVyw5MzNtzOWY2oTbjZeDTtayh7LpwKBALMSoM
	k58AqBKIpfPv0HdMR5Ny3yoBnz6BVutaq3KkfjskxSRbxQdfXImwieDUfdEgflvntXaoZcR80V1
	LKt0YvTfNNzeXDFsJrjqRud82cLHZ1ELYfRu7e33Qg+PW8gsMK2et3m8IzX5Qbl9XGxWNfOizci
	NaR1kcoTkxUdI7DAgcrTvu3ZWIGriVJZYdV2D99yTY4cwsa6Zb37FMXebCi+LCfQF11/+/u+Xcy
	MMasaIt1hQukie4lw7s9DAXoYJ/J5p0CcCkjtWmLfpOZ1yfX1uCY4EMbNhyNpFXRahBT2KzII05
	jHhHFpQIcB5iiebSPeukPBczs3EfuintSHO4S0TDhAOekQmBajAo1WGYrOj6x+zy71vh56iw2OE
	g+nxxfhHT8iQlo1hT39/TDlcthROqY11VaP
X-Received: by 2002:a05:6102:f8c:b0:7c3:68c9:d20a with SMTP id ada2fe7eead31-7cb3a005996mr3569327137.8.1791880912705;
        Tue, 13 Oct 2026 01:41:52 -0700 (PDT)
Received: from mail-vs1-f41.google.com (mail-vs1-f41.google.com. [209.85.217.41])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7cb354681e4sm8474884137.10.2026.10.13.01.41.51
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Oct 2026 01:41:51 -0700 (PDT)
Received: by mail-vs1-f41.google.com with SMTP id ada2fe7eead31-7ca917f9f52so1578628137.1
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 01:41:51 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBxFqppf86ibSB/tIokZ7SxT/pTYxg1pQSe9vBuEjcWjsKwlANbWZBUsmCOuo485V2rHaLe28kttUUN6e84=@vger.kernel.org
X-Received: by 2002:a05:6102:f8c:b0:7c3:68c9:d20a with SMTP id
 ada2fe7eead31-7cb3a005996mr3569324137.8.1791880911423; Tue, 13 Oct 2026
 01:41:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261008150045.28905-1-jszhang@kernel.org> <20261008150045.28905-2-jszhang@kernel.org>
In-Reply-To: <20261008150045.28905-2-jszhang@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 13 Oct 2026 10:41:40 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVTwPuTXTg_e7OCM289ALmHQsS1Uz+0z5y=CgsPGZt8Yg@mail.gmail.com>
X-Gm-Features: AclHuK9fEs20wSyQEl5Tf_pA55385vtFfDZFH1OesZnNWKkOdRpWR450rrFg9KU
Message-ID: <CAMuHMdVTwPuTXTg_e7OCM289ALmHQsS1Uz+0z5y=CgsPGZt8Yg@mail.gmail.com>
Subject: Re: [PATCH v5 1/5] riscv: remove RISCV_ALTERNATIVE Kconfig option
To: Jisheng Zhang <jszhang@kernel.org>
Cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
	Andrey Ryabinin <ryabinin.a.a@gmail.com>, Alexander Potapenko <glider@google.com>, 
	Andrey Konovalov <andreyknvl@gmail.com>, Dmitry Vyukov <dvyukov@google.com>, 
	Vincenzo Frascino <vincenzo.frascino@arm.com>, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>
Content-Type: text/plain; charset="UTF-8"

Hi Jisheng.

On Thu, 8 Oct 2026 at 17:22, Jisheng Zhang <jszhang@kernel.org> wrote:
> riscv always selects RISCV_ALTERNATIVE now, so we can remove this
> Kconfig option and enable RISCV_ALTERNATIVE code unconditionally.
>
> Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
> Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

Thanks for your patch, which is now commit b924210f542e13c7 ("riscv:
remove RISCV_ALTERNATIVE Kconfig option") in riscv/for-next.

> ---
>  arch/riscv/Kconfig                          | 23 --------------------
>  arch/riscv/Kconfig.errata                   |  5 +----
>  arch/riscv/include/asm/alternative-macros.h | 24 ---------------------
>  arch/riscv/include/asm/alternative.h        | 10 ---------
>  arch/riscv/include/asm/cpufeature-macros.h  | 10 ++-------
>  arch/riscv/include/asm/cpufeature.h         |  6 ++----
>  arch/riscv/include/asm/vendor_extensions.h  | 18 ++++++----------
>  arch/riscv/kernel/Makefile                  |  2 +-
>  arch/riscv/kernel/cpufeature.c              |  2 --
>  9 files changed, 12 insertions(+), 88 deletions(-)

Unfortunately you forgot to remove all references outside arch/riscv/,
now making it impossible to enable support for RZ/Five.

I have submitted a fix "[PATCH] perf/renesas: Remove remaining
RISCV_ALTERNATIVE references"
https://lore.kernel.org/fe117dd44728fe7c96f3e4b3ec88c6ca83c5da9b.1791880574.git.geert+renesas@glider.be

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
