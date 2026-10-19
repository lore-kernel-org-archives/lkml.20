Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792422119;
	b=093ojuAKLf+zQr19OUiBIrSMpPf1K4byXXsZaGKwPYvWv1AkOLhlZN7sGHRZn9tytkar
	 3eewxWjvn6otWXb6AEP+MCtdFnpmkE7i7Qwa8c8+Cc+YsEfV6CUGHmsCXkcFfNxKl1gZq
	 2IGIaQ+T7X3pxuE4PSd60fx/7UHw8one/fbKvi/GNm8OCvw6ko4RKSrHoNWsBCWktP1pp
	 I6Jfi5S653vsRvaI0KmZmTJiOo/zvT/E7ahIza0Olg6ldOsGobKlT67YoUtpFjLid65yH
	 vy3s+vvKmjHXNeKUKj+Fs/GRoS1PQoSZMCcHQNIdJMg4ZZtyvc7yAyXM51ceOrTa4aw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792422119;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=V5Scv+S8IrXgj+5/CeTTqsxC/iiG0yrpaL3kmiKglBQ=;
	b=3/tiuSib9PQUtJo7BrCWEaVR7Q8qMS3EEr3kkEdTKkV8HWQ5p73TAbqohlDD45jtdd2K
	 F3YamIiXtidZC9FPl6WmY+eT6IOfrMs/CHBKyBpxTb7dfleBliFbMiu0IuPVSKKKSw0hf
	 +CzAjsZgdW3DKWguslnbe3WtdfTgD6uykmdoquEyeGD+0ot1do9G1o5vcmMd6/N6NMB1a
	 Ia7wDtyuntxOXtms2NNifhkdTrw2eh0iUtFtD/cg/IL10W3VBP8Zlzr2VXgMkLwJp0Ttw
	 Y3nkKLU1Yo2nSr2WBD5ifBPgV3qCrhkiowu02t54B3MrqBfY/8x1B0qf4psk0+JEMag==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux-m68k.org;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.221.172
Received: from mail-vk1-f172.google.com (mail-vk1-f172.google.com [209.85.221.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EA34607AF39
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 15:01:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9EA34607AF39
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f172.google.com with SMTP id 71dfb90a1353d-5ead9f60e26so131537e0c.1
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 08:01:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792422118; x=1793026918;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=V5Scv+S8IrXgj+5/CeTTqsxC/iiG0yrpaL3kmiKglBQ=;
        b=SaSGVgXXeaaoqKIn9PtDnhGsdfBHGAxMOoGW+0HAEPRERAJIQpf5LRJrbVvEm2p/7C
         V+6HS8jtMeXZ1OcG/xgBgywyhAbbJO9v8P6V4gsEm09DRTC2B8MvJFH0YrjPZ70bAlTM
         kv0sV1h5XjGV/KIEXzBcGu1H80bUSJwMrSb5Bf3WhUyGPlIqFlWyO8NWmVNbbPZOow/s
         kBnxvLcxUTXptPMgk5YVXDClFJ7WPNwspJ4TXlQkgpd9m0ulFaJ5f9SpPgPc0royuQ0f
         qF4OrtqhNt5y4QIUVH8D6lGQNoVssZM9bJ6i97uH3NuwAd6gW6wq5aoENfszEwo1+aM8
         /IhA==
X-Forwarded-Encrypted: i=1; AKwUvBxlyAy0W4HBlP6Lv4oPcfSMlPsFdWKA4DyNdWGivGMA29YFiPVGLWFHXKOUD5ZxvCq0ZG2spwU3qv3lQ7Q=@vger.kernel.org
X-Gm-Message-State: AFq9FYJb+GflvFE7meWvKNiskRwU045kpZt+jOLafjq6UVWVgctAeJEx
	9AGQ4bEdHYCiYPhR0NZyXgdQccab9Usxoae5CHSMkeIKYOY85hzUjJM3uGtohdGdnhI=
X-Gm-Gg: AYBFou2fCJqIwDUGUNNtsW/MugAqQcoHyI2NlWm+hwqzfMqFv7YELuxEdlDxZpg8QE2
	Qmy3biAJ1IeKkIk23wsnZJDx7Nhh7k/8svF9n6zxpKpjLiuR8F7rqWFsO/56ibackahs5Y61rt4
	Fx0y0ZmQk3JitJodY7La2UOLmoso3TzGewHMsv3RxUjErNBJmLou5xP+OP+ziAA/B5ZE0LhgUWf
	+Y2ybY28k550pBnDYHt60skxv6P6GsNohijr8JFV6RDb7ayqCe6VcxtP0auBI6EiG5gwIwy6Gqn
	lnsJQ4fINFbp8AKVbiF/ZiyuderQePGqtRnZugcVP8y4l3uZLIl/RyqJqp4MqMTxjNOivrZ6+Hn
	M2hZHAvgoD7niFxcnRkzMduSMgpWirZ+5hm9Xfsqbed93TTQjtIm/CVsouf64KRnjZ2HrFutojA
	Fx+7MVbMSZ2bu8VAddQIuchS+UIM9Yj/RAH6P/OeIW+AAbeoGr2fJc5R6DlKXHt05b+b09C82C7
	hsrgEhn4kubej31XgrUKbrg6NinSC5hdTNqe9af
X-Received: by 2002:a05:6122:6418:b0:5ea:d474:246b with SMTP id 71dfb90a1353d-5ead4742e8amr296014e0c.8.1792422117365;
        Mon, 19 Oct 2026 08:01:57 -0700 (PDT)
Received: from mail-vk1-f180.google.com (mail-vk1-f180.google.com. [209.85.221.180])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5eac2c68171sm4219938e0c.8.2026.10.19.08.01.54
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Oct 2026 08:01:55 -0700 (PDT)
Received: by mail-vk1-f180.google.com with SMTP id 71dfb90a1353d-5eaa1b5b84aso2618145e0c.0
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 08:01:54 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwgE/hCaVGCdvlqjTAhcXI2Nie9nP1naV68BNYZ7x6493iWfOqoX9wtuV2ATtn6kJGATlApVgFwyygUBQQ=@vger.kernel.org
X-Received: by 2002:a05:6122:25f9:b0:5ea:bc01:a2f9 with SMTP id
 71dfb90a1353d-5eabc01a9b5mr1023930e0c.0.1792422113935; Mon, 19 Oct 2026
 08:01:53 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261010065442.23780-1-rosenp@gmail.com> <202610131201.wWk11MLy-lkp@intel.com>
 <alpine.DEB.2.21.2610190013300.22065@angie.orcam.me.uk> <CAMuHMdVoAthYZFzuMmVb8awHUia4xeEfFKK=1PA23iCV0SsFbw@mail.gmail.com>
 <alpine.DEB.2.21.2610191519120.22065@angie.orcam.me.uk>
In-Reply-To: <alpine.DEB.2.21.2610191519120.22065@angie.orcam.me.uk>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 19 Oct 2026 17:01:41 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXCKXN5PiDwRJiEj9aBGcU0J+H=q5tQoO7OfPEboCWGJg@mail.gmail.com>
X-Gm-Features: AclHuK-kMNll2TJ6SQ0HmyWWYBoxtNWt2Z3yCcXPLPClFSyKDfXs1dfr7tIH4kE
Message-ID: <CAMuHMdXCKXN5PiDwRJiEj9aBGcU0J+H=q5tQoO7OfPEboCWGJg@mail.gmail.com>
Subject: Re: [PATCH] MIPS: lib: prefetch ahead in csum_partial()
To: "Maciej W. Rozycki" <macro@orcam.me.uk>
Cc: kernel test robot <lkp@intel.com>, Rosen Penev <rosenp@gmail.com>, linux-mips@vger.kernel.org, 
	oe-kbuild-all@lists.linux.dev, 
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Maciej,

On Mon, 19 Oct 2026 at 16:47, Maciej W. Rozycki <macro@orcam.me.uk> wrote:
> > >  So oddly enough we're missing Tx49 support in the toolchain and we've
> > > only managed to survive with CPU_HAS_PREFETCH enabled for CPU_TX49XX
> > > because it also implies DMA_NONCOHERENT via MACH_TX49XX -> MACH_TXX9,
> > > which in turn disables stuff in arch/mips/lib/memcpy.S.
> > >
> > >  Quite straighforward to fix in binutils since docs are available (as in:
> > > I have a copy), but do we have any users?  Geert?
> >
> > Yes, I still boot test rbtx4927 regularly.
>
>  Thanks for confirming.
>
> > I never touched binutils sources, though...
>
>  No worries, this seems straightforward: just PREF, MADD/U plus [D]MULT/U
> extensions, and DERET/SDBBP debug stuff, much of which shared with the
> Tx39 we already support, so just a matter of sticking another flag onto
> the existing opcode table entries.
>
>  I'd estimate it as one day worth of engineering effort plus maybe another
> one for machines to work through verification, for the binutils side and
> the associated changes needed for GCC, i.e. a `-march=' option update plus
> maybe enabling a couple of existing machine description patterns for the
> Tx49 too.  Would you be able to run GCC verification with your system?

The rbtx4927 is about the slowest system I still do regular testing on.
It uses a Debian 8 nfsroot (over 10 Mbps Ethernet), which is the latest
Debian release still supporting the instruction subset suppported
by TX49XX.
So as long as no native compilation of large packages is required,
it can be done.  I can also give you remote access?

Thanks!

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
