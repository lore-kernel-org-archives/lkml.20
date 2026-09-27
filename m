Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42EB53B7B83
	for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 05:57:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790488653; cv=none; b=SiFbJqrlxw+VSLgr5hJmHCHBji9A4gD5re00SVjJn1g0XdJSyd6rdxghQsteH72qIZIUv/ZH5bzXVTStjiQplrILsrYPwPYq8f2NlNrOnkYLaesScPOPNB+3eUH6NfgLtzudUek8kaJrkJf9fRu3jRZaGoymj4BjtH8IIZjCozc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790488653; c=relaxed/simple;
	bh=ECdwrOZLPkUOYEi3CxYF+G8aKAMwCDUFpNPHlXQV3q4=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=kvtNz1XXCzly7stRfKcea84mvNbGBRLN2wGdDesKxv17JqXuIezSO+AWmKh/+PrTyUSIyltMI5yhMyxTtEmCbJIXKfXgQZ/7bn2CWS7AG95WhL1yZfoI9IS4VT5fsdrGcRToFK+MzhFnVtQqTLkWp71VfB/Goad3KfkLFDozK24=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Yl/qUxFa; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Yl/qUxFa"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-48449f62b93so672299f8f.0
        for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 22:57:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790488650; x=1791093450; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=1/dti4dnFF8A+Oe+aVgDqPONYPNqgjuPnqR3/MJboFA=;
        b=Yl/qUxFa7Tx2nQP2me8C5oI47YhyRa7p5f5n0MpjoEcZ4ynyJt/Jj63B9Jn1QkkPhm
         HBlSqt24fA57tV8i+/3zidKiOVfaWYHqQhK4vkbsaucscn7UTrQMs5yOZd9UvYL0x5g8
         uqaKawPj/dohUmnjv9cmaOCY1kdKlDNAgWFpcbt7nYh5RdCUJETb1sAiAFvPFKoWcQyz
         cLBtkrxPa6kJVpf89GSAlkGLqvCNpZzbLLOMMqBZAC4h9vM/53WaMGoejUuZz6UqrcaH
         y21IE6L6Ho2KUG42Q5C9P6OlroZHI7QXrHBu9VBUSyNO5bf4JJE+aFJL75Znoulk3hd9
         yL4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790488650; x=1791093450;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1/dti4dnFF8A+Oe+aVgDqPONYPNqgjuPnqR3/MJboFA=;
        b=m6lsjM3cDH7Z+xLgittjavM/FhNmEeoK/yS2fo5JZ5NJPSsqvLAC3kvgZ2zQEgmJmg
         hUW+ZdC8QowvGfbFwrAG94372ypKIXSipDnrd91emouKJTWG7fTee5JhX3LvWaaiv+IY
         bwlWdkeOKePw7AS8iyMOqXe39RQpzVLfSQPzzl2T8/AJhmMFE+PJUmKzioHFKnKQ6ejc
         2Gr/SazvcPBJNdqzMkZeubCbE6Ayazmvu1koUVkUvWr+ofVGAiyLnj4wdXJFkEl6+Tm3
         b+HV6T0KWyASQpfv4tZ9duwenU0/IDiHml+Z9s0KU4wlVug0Kt+UVhV2exgsmNvooybS
         MB6Q==
X-Forwarded-Encrypted: i=1; AKwUvBxrHyZQdjXlMdedh3kWXrytq7shAHEECR5hfRNF1sbQJVHxB8hfmeb0ZhtMEPv0sMxsSd5wqRhur0QI2w4=@vger.kernel.org
X-Gm-Message-State: AFq9FYK93pJRYH0tkF706JcKH0SmpCNnkwFuDYv0DWheEqgqidtuQ1JF
	H0D7+l1q+YWwip1yAQzKZzXVaqYx0QkW0JjBt7IzA0pU7ZjK1Ji0TQUJ
X-Gm-Gg: AYBFou28S4ITMx1yqfMtmV/MEGuW69VpWkJ61HG2KsW0ud7iR78d2ursDtTQSfPf4HZ
	FhpWCMs00L8N4c4c2aDRy4amvaW+qzFhgtWIDVlZddYrWE13qDVOHYkvtosxPnvFWp34rWg7uXD
	8mmS9gGOYBJwGTKllJ7vjgR+iLmr7bApQxJsdVF+bwb0SU0xo+DLWTyqibvl+xyyhEK+XSHSZy5
	BqavZ/KmvfaL0FGt9gb/6/7Ka0JQOxrfh4vbpwGCqf3vsfeUlWbR20K8hNvmj1sOO+fUpdeoejk
	o2suO63Kya/SHH4Ak4bDLsa77SNnMqqeZUHWVCoFsyGYiM01UjFIVXp2YewXP4/JnWBSrqU+m6J
	GnYFG1FAOLLHgK0z5PNeGYdQ2krup1t6vA+HeyurJesskGFxaYaFjw/1SgmcDwEo3CKDTU5VcHs
	5FP33HV4CWxKU9VbbxRWH1l3Op+6lNdxz3g/7DNaZlplnz76//ynffOejzjegi761WJP7hKItoA
	+3SDFZFqHwUUzVu6uehwoB/TfDWQIIdmV5LkBmb6ViSzw==
X-Received: by 2002:adf:e198:0:b0:487:146f:7c88 with SMTP id ffacd0b85a97d-4887168d970mr16805103f8f.4.1790488650200;
        Sat, 26 Sep 2026 22:57:30 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4887a30bcdbsm17997084f8f.2.2026.09.26.22.57.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Sep 2026 22:57:29 -0700 (PDT)
Date: Sun, 27 Sep 2026 06:57:28 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Jim Cromie <jim.cromie@gmail.com>, Lorenzo Stoakes <ljs@kernel.org>,
 Kees Cook <kees@kernel.org>, Masahiro Yamada <masahiroy@kernel.org>, Jiri
 Olsa <olsajiri@gmail.com>, linux-kernel@vger.kernel.org,
 linux-kbuild@vger.kernel.org, bpf@vger.kernel.org, Petr Mladek
 <pmladek@suse.com>
Subject: Re: [PATCH v6 0/3] kallsyms: Accelerate symbol name lookups by ~7x
Message-ID: <20260927065728.7f159234@pumpkin>
In-Reply-To: <20260926133859.c8232c439184dfa17472b020@linux-foundation.org>
References: <20260926-ksyms-tune-v6-0-236620c65e98@gmail.com>
	<20260926133859.c8232c439184dfa17472b020@linux-foundation.org>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sat, 26 Sep 2026 13:38:59 -0700
Andrew Morton <akpm@linux-foundation.org> wrote:

> On Sat, 26 Sep 2026 13:40:11 -0600 Jim Cromie <jim.cromie@gmail.com> wrote:
> 
> > As measured by kernel/kallsyms_selftest across ~184k symbols,
> > kallsyms_lookup_names() binary search takes ~6.1 us per lookup due to
> > two inner-loop costs:  
> 
> We don't have a kallsyms maintainer afaik.  Petr is pretty active in
> there so let's give him a hopeful cc.
> 
> > 0. Candidate symbols are fully decompressed into a 512-byte stack buffer
> >    before calling strcmp(), even though non-matching steps could choose on the
> >    first differing character (0..N-1).
> > 
> > 1. Probes scan sequentially from 256:1 markers in kallsyms_names[],
> >    decoding an average of 127.5 symbols per probe (~2,170 hops across a
> >    17-step search).
> > 
> > This 3-patch series addresses both:
> > 
> > 0. Patch 1 introduces kallsyms_strcmp_symbol() to compare ASCII queries
> >    against compressed tokens on the fly, bailing out on first mismatch.
> >    Drops the 512-byte stack buffer and saves ~530 ns.
> > 
> > 1. Patch 2 increases marker density from 256:1 to 16:1, cutting average
> >    scan distance from 127.5 to 7.5 hops and dropping lookup latency from
> >    6,102 ns to 866 ns for +42.2 KiB of .rodata.
> > 
> > 2. Patch 3 inlines and unrolls get_symbol_seq() 24-bit reconstruction.
> > 
> > Results (kernel/kallsyms_selftest across ~184k symbols):
> > - Baseline (256:1):  6,102 ns
> > - Patch 1 (strcmp):  5,572 ns (-530 ns)
> > - Patch 2 (16:1):      866 ns (7.0x faster)
> > - Memory: +42.2 KiB .rodata, 0 bytes dynamic RAM  
> 
> Can you better explain the tradeoffs here?  Increased memory use?  If
> so how much?  Is any change in build time expected?

I've had a thought of a scheme that should give most of the ~19x
improvement of the original patch without increasing the data size and
with only a small increase in code size.
The downside is a slight slow down for sequential access.

The thing to do is replace the 24bit 'symbol number' in the 'sorted by name'
list with the offset of the beginning of the name.
(For very large kernels it may need to be 32bit.)
The binary search for the symbol name then doesn't need a linear scan
and also loses one level of indirection.
You then need to do another binary search over the 'offset of every 256th
entry' table, followed by a linear search to find the correct address.

For sequential access there is a reasonable chance the next symbol is in
the same 256 symbol block (in address order), that can be quickly checked.

I got the code to run in userspace yesterday (with a real kernel symbol
table), I might look at some changes later today.

David

> 
> 
> What isn't addressed in here (afaict) is "who cares".  Is there some
> workload which is kallsyms-intensive?
> 
> This info really should be right in the first para of the [0/N], and in
> detail.  What benefit does this work offer to our users?  Use cases,
> example scenarios, etc.
> 
> Apologies if I missed this in earlier discussions, but if it was in the
> [0/N] this wouldn't matter!

