Received: from mail-vk1-f181.google.com (mail-vk1-f181.google.com [209.85.221.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3098F4A3F10
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 07:43:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792050238; cv=none; b=nBNdNdfEcRbXbturg1ZBbooUH1PcYG/Irabubc8WuIUDX6SUf5NX67li1pZG9Gu3eZSnaEl48BM/fYZzXQexDz+xBPoAmeibeL8DvGhf827Hdcd0CLbbQ1JIasFRvKhQNj9naFNnsZgi1dcrz/BQNYeLC/Yeo8r/7WsiHzc5q3s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792050238; c=relaxed/simple;
	bh=jheufsaItJg8X30Daxkpbu4x2q2CtICRoS1ysWOctKM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=i6LPRier1RuS2JM945TWCxDl9nOy5upNvrEPqUZnjqZGVE7SgaAXWxpAxHdB56VedR761Qbl/KYBaeABvM7FRB5BF6e6AQv5b09Od5+0UeCVLiIAwKivxwFAL/rEHfZ27N5nh1+k1jXktmzVDKofAaeX1I0b6N0qSxpZ6IU6UXg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f181.google.com with SMTP id 71dfb90a1353d-5d7daf06158so1757873e0c.3
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 00:43:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792050233; x=1792655033;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=MWnD86zYx5Fi/h60ALOJLdZBIY9AH1R0FwDBQQX0QEY=;
        b=Kr+FnUDPKrg1OER5s5tYS+J+LA8AAlxWhZ2WajmqbiOYF1Vh449w4oWx9px8ubxFus
         Fx8rqi5zq8gc6EQFKmt+N16uxpfeH6Ze/g0N0B45JfIUVE+4gjU8EyERzM6FSxbTXYpZ
         IVbVuw7VP8sZJzdF9KEdwnyVM6HOOJOfE3RJdKyxWMpULi6N6XVkz8XjBxa2CQZShZWg
         7LtNIkAdtMF5ZVTd1mXkPh+dL4lGjkbn475ph/gCDbHFzNIPlQ3SfsQwRcB6xP4gKN5I
         G13QKlhq9gZyodSB08YWiyqcruuXKCrFz/l77GjmowSbt8CJVi+iwY3tIqgm1sHc5scY
         N31g==
X-Forwarded-Encrypted: i=1; AKwUvBzuxOasm5qVCvAwjO/QawYjsJjyUW5DbNOFtzDSejWReC0PW3hz1uhNjFP7TQmhqgTMRcba0U0vGvEm2aY=@vger.kernel.org
X-Gm-Message-State: AFq9FYLzoba/jfXrBZJmZyKVoN2XDmZnB7f/gofYih6q55cdIMu4hdkT
	kmu0XCnQVL7yqS8MJPPHFvjLSA7IZxiZfDN+tjRLQiAhNqT335RFCtxCqussAYrK6+I=
X-Gm-Gg: AYBFou2/Gqlt4n856wRpEGwZLea5UEClfNPnU1L9CVy6/2wl9S5jcuEYr/9P8OtDWOq
	SpBOz6nOfSbKoKB/i1deYaNDUmgQqp8H5vziTVyyOgcqrR5kwKNYeXQWX03GiC+Ju/3mdH1seP/
	sL5DSNW6cFOOQK4BXzY/l7mRQs9Xzb8PMmQYofTjN1ZJly1bEN3TjJwG5Gy+Mpjt5wQmNR1Ncnk
	792R6Dx3kwHimOYg5cpqllBO2pf1tIMBJ1vXirMNGPt5sd6ScnZXT1+aFS3pkswHDWOf9sz6oK2
	1NE6LwsvhASnRxO9TqsUvAZ45EgGF2aXoaFW6AOQ6tQ0/bnCjMfzDJMDGXoMABCgdfdA+OgMCGk
	Q4gsAAm6M9CAw1xmfoSuaUmO0C5FH8oxmV3gfaA/Ky14Fe/y2gC5pkRN33fHok+LafBfUsCfgxq
	NSdN3ksCAXHE/Dd/c0KD/6NEv41LpqQXRZMeh58aCIPG8EKEBOafPDeDAw3CBVqg+45CD+zGxGH
	wL3J3u43TImxoA0Sy0e2Fz6uE+lGWwDG+lhNJe6
X-Received: by 2002:a05:6122:1829:b0:5c9:ef0d:155d with SMTP id 71dfb90a1353d-5e91f4ad95dmr5433637e0c.10.1792050232879;
        Thu, 15 Oct 2026 00:43:52 -0700 (PDT)
Received: from mail-vk1-f177.google.com (mail-vk1-f177.google.com. [209.85.221.177])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5e93683455csm10045893e0c.13.2026.10.15.00.43.51
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Oct 2026 00:43:51 -0700 (PDT)
Received: by mail-vk1-f177.google.com with SMTP id 71dfb90a1353d-5da7a39e584so1808477e0c.2
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 00:43:51 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBycbcHOlD2gu0t2xICXwAdpFlrksYe0u7ZVg70buYUb3b91Hkzj52iteql0wAKZ2lSrtu5Z5K8IsUOMB18=@vger.kernel.org
X-Received: by 2002:a05:6122:e227:b0:5d7:2918:c644 with SMTP id
 71dfb90a1353d-5e91f467355mr5297458e0c.7.1792050231577; Thu, 15 Oct 2026
 00:43:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <1b1ca4208d725ae0bb834a61636e48728d79cf80.1791973171.git.geert+renesas@glider.be>
 <atAQAI0WWtwh8kvf@xhacker>
In-Reply-To: <atAQAI0WWtwh8kvf@xhacker>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 15 Oct 2026 09:43:40 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWB+Aj7HK3YaHgo8VcypBamN9Yqi-M8WYtKpRu+ZG7yFA@mail.gmail.com>
X-Gm-Features: AclHuK_NnFzMt1DDd6TB7oeGfNmK13LCeslMF3_46vtqG5udz87FbhnlGksCQmQ
Message-ID: <CAMuHMdWB+Aj7HK3YaHgo8VcypBamN9Yqi-M8WYtKpRu+ZG7yFA@mail.gmail.com>
Subject: Re: [PATCH] riscv: RISCV_ISA_SV48 and RISCV_ISA_SV57 should depend on MMU
To: Jisheng Zhang <jszhang@kernel.org>
Cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
	Conor Dooley <conor.dooley@microchip.com>, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Jisheng,

On Thu, 15 Oct 2026 at 01:48, Jisheng Zhang <jszhang@kernel.org> wrote:
> On Wed, Oct 14, 2026 at 12:20:39PM +0200, Geert Uytterhoeven wrote:
> > These options are irreleant for nommu systems.
> >
> > Fixes: 36de74049ec8cb1a ("riscv: introduce RISCV_ISA_SV48 and RISCV_ISA_SV57")
> > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

> > --- a/arch/riscv/Kconfig
> > +++ b/arch/riscv/Kconfig
> > @@ -605,7 +605,7 @@ config RISCV_ISA_SSQOSID
> >
> >  config RISCV_ISA_SV48
> >       bool "Page-Based 48-bit Virtual-Memory System"
> > -     depends on 64BIT
> > +     depends on 64BIT && MMU
> >       default y
> >       help
> >         Add support for the Page-Based 48-bit Virtual-Memory System.
> > @@ -617,7 +617,7 @@ config RISCV_ISA_SV48
> >
> >  config RISCV_ISA_SV57
> >       bool "Page-Based 57-bit Virtual-Memory System"
> > -     depends on 64BIT
> > +     depends on 64BIT && MMU
>
> hmm, I think we also need to make RISCV_ISA_SV57 depend on
> RISCV_ISA_SV48. Otherwise, there's a case: RISCV_ISA_SV57 &&
> !RISCV_ISA_SV48. Human won't make this wrong combination, but
> the random config can.

Is that really an issue?
If I build a kernel for an SV57-system, do I really need to enable
support for SV48, too? It builds fine without...

> with that change,
> Reviewed-by: Jisheng Zhang <jszhang@kernel.org>

Thanks!

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
