Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0DEB3B8105
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 07:55:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.225.141
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790841359; cv=pass; b=OATu4ta7BVBVVcQCHffMwddAAiDHqe0rCzzPD8B30JT1Q/Nni/vhf4BdQDm/lni3jSmq5KbVfeKepPYojKTD+80GincBtr5MtocUXWwryhVz3euhwo//jgahzgQuvHh6ZGu+VN7OacDF4XpU7GIjZVbrNE0UTxPpCTFI7YH5REY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790841359; c=relaxed/simple;
	bh=ZM5OhHdfMen51kVPXITOzhuJvyPBbMPnp7OR5UAfWMk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gA1/GCA5LovOtJEOv23lP19FiqbsIuLvKkKBxSZsmCNRrsszi6WMkjBDVHNSN8EeS9m/S6VYvh43JlAXUDybMXF/RAboGVP7K7ySy/Mf8grlbfVBg6pxiYTkW2uAQdltFBkoZP1F+GQRJWCOBgyvcn9oTGTd9YxUPtY9JxEIK28=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gZ0qf5nQ; arc=pass smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gZ0qf5nQ"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49e721b5503so58146795e9.0
        for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 00:55:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790841356; cv=none;
        d=google.com; s=arc-20260327;
        b=Vg+futq6bRhW1j5dNcGhVq03kg1qUmKSrOovpM5FxgNeLEcsPxf+T7POdcaJj/Ual1
         rygrimLVGNIvjiDLPGlI1hKrvyCFb6KfD2PT3H0+ViulwTVpyFTMH7dNcRTuDd0lrtMJ
         Y8tYytWV3c1BvoNP8Xazdolcj8IULkncDa9D8dlfaI9fmqkKRBRfkQY+boIcMdxabDVf
         QStM+1A8q6szNa/o4jsDylLdrQwa2Ocda4nUZfyI9cbfhQWQukqIgPe+LaU3KHtp/CPM
         Tr88xNO6o6NJMP2/s6TwEC2FaVm9UC1h4+b2tTnFFLg7t19j0o5XD8du9nMRFZShCemP
         cMUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=1AHrAL5m9r+wBvSCXVxM17eZGx8eAClbgj8DyTpgrNA=;
        fh=FBSL1/S5h8lt8joDZGDWOHouZji54al4lqQ6cHpnNPY=;
        b=grxUgzprY2Ik/DTuFrMun5bRPQHgrq0NbAMnO1gBOaXu2NKt31yZtNitlM92kp9LVi
         rLqrNyy7rojJkp3mt7W6nxjfhk/q92R43faHenQKtgtw5isfFCkhqFjZFtIK+sYc3GV1
         ELQg89oGSfuahgTSOd/uKcJ2YCWEdS9skP6gl25bm+Fh+osV8UxslfmZPAS1LCROMxco
         BhRoQn2aVVq8sP49DCZd2fR3mTSPlzpR3qAa0Un3zdo6PJ8KGwSIeH159/SltElExw5s
         9wg4bxdAITzArb7eGevpsPL3pBUfWATZxJWGmBiwaUWUFOAyZhcy7Mk8SaMNsmMwoMKu
         OI7w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790841356; x=1791446156; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1AHrAL5m9r+wBvSCXVxM17eZGx8eAClbgj8DyTpgrNA=;
        b=gZ0qf5nQL3hxlLWhcoi/6ApYOoOR5Z3EshazcqY5TiJXC0d33n2nJzSqPgp3t5i3rp
         YceaS2uKz0CPhtoVDXjqElBvHx2Jxv8SQwdiBOheH0/734id4/PIh6AqPGgvHHzxN5ja
         jOC8oK2AtxX/ZOCt6kKyUf6lsfJw7JE5HFdWpMRdtMpFbvzCgcHrffRvY4FF1d2DzH+C
         2RbBUYseZGJq24Tj7NF9y6fI8cIkgG18bCAbnRYxqKir8iyKnwPxONvvM2hUrxh61IGW
         kEsYs1d16HSq+XSfaGH/hD/X/nDxisac8AIu7r0l/Ya7fzYacO5yxk9uRk8l5jABitH3
         ltKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790841356; x=1791446156;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=1AHrAL5m9r+wBvSCXVxM17eZGx8eAClbgj8DyTpgrNA=;
        b=WUs5uWiy8iSmisquq64kJYwP/gH/0YpuAGwgRA2/YLAXzjO0ieFQhDxvduCpCw062c
         c3+5O4VvXbghSDQ2n9EY0Rvt9TWBsr8zJLXeCZ/SLUobku3G8VHCbPYs/QKMcxHoqdSA
         ewxNStpHasT/mVYD20gdQtHLunS4D4j2Ka1bqloRYtzB3Q+JqSLxUeTqzrzSI2kIFDyr
         VTiDE+NQ6cV8SnGgzFsS4hNARqzvxDeSa8lpvvMCkrXpSzvAtPGb0Em1PE5/35ng06mc
         Nmc70ROtSFFMbm08TSdARVZ2+a3kH5rMh24QyvUc77Lex5Qc1n3GVJvEsY1d7BekOj8R
         WTeg==
X-Forwarded-Encrypted: i=1; AKwUvBz+7/yvGMtfvGnv+3rX3ajbys7GxjYxUZmZibLrWJEGGFWAtRCdfH68l3a1VwtOeqJoAT6JGRKI67wW94M=@vger.kernel.org
X-Gm-Message-State: AFuF++nx0oT5JfSL42hI4thcXhzXWHBgzFb/YnGGPbyiyigyqHJE+ivS
	Pg92kKUu4cQNo8fJUTFNWzdpF2xuiYJvGg5qPcr90gqTZUQnYYZm/i8a7cAYJz7PQUGbulAxM8/
	j39Mi87O5hgRi7RaFeHjog35qwAqTrEw=
X-Gm-Gg: AYBFou3k3+FnaYF80e8BYxvuGflKBLllHAdrThqBKX+4av+neqhBFC+fEU8xM13Y733
	M4e+Ld9IXgknXT8TeYsBi8NPizgTjHIr4yIrP1OasSwxPk1DXXnJRpvp2AxfLvAyp2XP1DZsHQD
	OMGzJhlaGjzlOIrZPUSDJfcQI89othep/id4OscxI1YXM3MQi/3OEeAGJLkV/Rcvn8hyOay96GB
	f4BtfT5SFICwmAVlMoMBE8Fx7VtuPRYOYG6KXjb+tfDJVv5HpFnrSohbRdeXLMy/Yl4WLV35W6d
	cbcmq0JL724q04IKO90TVt9pKdiXG44n+DGQ+dVkduPIW/wgp+3pEcWhnw==
X-Received: by 2002:a05:600c:5020:b0:4a0:1efa:c746 with SMTP id
 5b1f17b1804b1-4a01efad733mr26833895e9.21.1790841355651; Thu, 01 Oct 2026
 00:55:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260923062832.479455-1-jiangwen6@xiaomi.com> <20260923062832.479455-6-jiangwen6@xiaomi.com>
 <ar0s14p8KPgmDKmR@milan>
In-Reply-To: <ar0s14p8KPgmDKmR@milan>
From: Wen Jiang <jiangwenxiaomi@gmail.com>
Date: Thu, 1 Oct 2026 15:55:44 +0800
X-Gm-Features: AclHuK_wExzN3hq35-9mtJ9Vi_bHjI_pv0wB1wZZplKSMEZ1VOjoAMFGpVzuuYY
Message-ID: <CAHKocdEF3RE5FA+LPRf_E0ns02a5akvUDKvSDvERoyTryV1X6Q@mail.gmail.com>
Subject: Re: [PATCH v9 05/10] arm64/vmalloc: allow arch_vmap_pte_range_map_size()
 to batch multiple CONT_PTE
To: Uladzislau Rezki <urezki@gmail.com>
Cc: akpm@linux-foundation.org, catalin.marinas@arm.com, linux-mm@kvack.org, 
	will@kernel.org, Xueyuan.chen21@gmail.com, ajd@linux.ibm.com, 
	anshuman.khandual@arm.com, baohua@kernel.org, chleroy@kernel.org, 
	david@kernel.org, dev.jain@arm.com, jiangwen6@xiaomi.com, leo.yan@arm.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, maddy@linux.ibm.com, mpe@ellerman.id.au, 
	npiggin@gmail.com, rppt@kernel.org, ryan.roberts@arm.com
Content-Type: text/plain; charset="UTF-8"

On Wed, 30 Sept 2026 at 23:38, Uladzislau Rezki <urezki@gmail.com> wrote:
>
> On Wed, Sep 23, 2026 at 02:28:27PM +0800, Wen Jiang wrote:
> > From: "Barry Song (Xiaomi)" <baohua@kernel.org>
> >
> > Allow arch_vmap_pte_range_map_size to batch across multiple CONT_PTE
> > blocks, reducing both PTE setup and TLB flush iterations.
> >
> > For CONT_PTE_SIZE-aligned ranges, return a mapping size that may cover
> > multiple CONT_PTE blocks, capped below PMD_SIZE. These sizes are vmalloc
> > mapping spans, not HugeTLB hstate sizes.
> >
> > Signed-off-by: Barry Song (Xiaomi) <baohua@kernel.org>
> > Signed-off-by: Wen Jiang <jiangwen6@xiaomi.com>
> > Tested-by: Xueyuan Chen <xueyuan.chen21@gmail.com>
> > Tested-by: Leo Yan <leo.yan@arm.com>
> > ---
> >  arch/arm64/include/asm/vmalloc.h | 8 +++++++-
> >  1 file changed, 7 insertions(+), 1 deletion(-)
> >
> > diff --git a/arch/arm64/include/asm/vmalloc.h b/arch/arm64/include/asm/vmalloc.h
> > index 4ec1acd3c1b34..4053b1ec1902e 100644
> > --- a/arch/arm64/include/asm/vmalloc.h
> > +++ b/arch/arm64/include/asm/vmalloc.h
> > @@ -23,10 +23,14 @@ static inline unsigned long arch_vmap_pte_range_map_size(unsigned long addr,
> >                                               unsigned long end, u64 pfn,
> >                                               unsigned int max_page_shift)
> >  {
> > +     unsigned long size;
> > +
> >       /*
> >        * If the block is at least CONT_PTE_SIZE in size, and is naturally
> >        * aligned in both virtual and physical space, then we can pte-map the
> >        * block using the PTE_CONT bit for more efficient use of the TLB.
> > +      * The returned mapping size may cover multiple CONT_PTE_SIZE blocks,
> > +      * capped below PMD_SIZE.
> >        */
> >       if (max_page_shift < CONT_PTE_SHIFT)
> >               return PAGE_SIZE;
> > @@ -40,7 +44,9 @@ static inline unsigned long arch_vmap_pte_range_map_size(unsigned long addr,
> >       if (!IS_ALIGNED(PFN_PHYS(pfn), CONT_PTE_SIZE))
> >               return PAGE_SIZE;
> >
> > -     return CONT_PTE_SIZE;
> > +     size = min3(end - addr, 1UL << max_page_shift, PMD_SIZE >> 1);
> >
> Capped below PMD_SIZE? It is half of PMD_SIZE. Where is that limitation
> comes from? I think the commit message should be improved in that sense.
>

Hi Uladzislau,

You're right, and the "half" is a leftover that can be dropped entirely.

Before this series decoupled vmalloc from the HugeTLB, the value
returned here was fed into ilog2, which reconstructs pagesize as
1UL << shift. That forced the size to be a power of two, and PMD_SIZE >> 1
was then the largest power of two strictly below PMD_SIZE,

How that pte_set_huge() takes the size directly, the size only needs
CONT_PTE_SIZE alignment. And this function is only ever called for
a range that the caller has already confined to a single PMD via
pmd_addr_end(), so no explicit PMD cap is needed at all. I'll
simplify it to:

        size = min2(end -addr, 1UL << max_page_shift);

and update the commit message accordingly.

Thanks,
Wen
