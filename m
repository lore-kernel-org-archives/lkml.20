Received: from mail-ej2-f43.google.com (mail-ej2-f43.google.com [74.125.228.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 793CF3D34BB
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 15:56:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790870177; cv=none; b=sK7ICUpzngHYgFb9T9ts+bQ4ETGTW4UIU+SVfvXdFX4X2dwS3pMj0ciMg6Ni7/IuZEj2FH2KVd7jpGC8AIPqnRpln2Yc+GSzRWhWEh8B7jIGpbvL5d6KIYPmlKX0DZiy0303LiUzqTMUNYGUDPYfVNKD8+tfEOIwIVD1R7qTUGk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790870177; c=relaxed/simple;
	bh=soHWGimngASpNC5I55Pu9aDC3ObZmGZzEBwPXjj52N4=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TEcG4hKy/7HVygz/Mf1lEc9EGcgzjzpcFRDL3m+ZclF9HnOQNg7NU4HclQVxW3vOFZCJrzyjAJJqeJzkvVyXAgUnuS1qKQNBPA7wrg0XvFK7OdJyt3BPYZUbccmnzamUCxlkZjViGIvrL/p8fFRpdy6e3elwMJA8RJ8XhYic3NU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=B0k6FXwP; arc=none smtp.client-ip=74.125.228.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="B0k6FXwP"
Received: by mail-ej2-f43.google.com with SMTP id a640c23a62f3a-c2e20bb4583so305324666b.3
        for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 08:56:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790870174; x=1791474974; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:date:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=mZXyBZOxPP9aVP1iLcONa2ADo5uyWcMjFEkbOU3Yh9w=;
        b=B0k6FXwPzWwN34p/HNn8yTENCujhgxLpaaPp0b+vOwc5Jq198rUoD3OU080HOwxK5j
         kDiCNPDb+l8VsPNXvSGBYO8L8ve7NwQOk1Ti3Tg8h7sQqzU70xles3SfrtlxUsy8auR4
         cJGaPkz5AyX2qwGBkRriKqYpWP1qD1OsRBe99uFeTf3FJ13ywMyv1rtQ7oJeLnnPi197
         vXuzKHDmahqO6JwFkRiDUvU7TdB2uD4HGgRC3U7lRQ+E3WQkfPZKyk5KgG8U6uKSN2tG
         cWPi7+m9PwXUjHnEKThhRhSpLxS8CfPSsPbpKH/xmtDMKvbj4IeN6Pxz2ak4r72s68Vj
         WW1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790870174; x=1791474974;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mZXyBZOxPP9aVP1iLcONa2ADo5uyWcMjFEkbOU3Yh9w=;
        b=ZObzNk2iXA2QvqxgO5wRwMz5q8xQMZ/OBtpz2U6kij1gocqL/9EuFIbIbDIXDAF2IQ
         Q/ezbCydSmhqrUpHLI+/8GHUS7CalaBjkZi97CM8BLNhwwfzh2zIJa22WsStaFgMbm+M
         DuZQogQySMf2jzpucOnanYIhmP1+k5GLDg/w9rsct5JgMMmyyxm9PK/z9Y4V3xExxEPR
         +Rdm/W40aFk/vJ6mcxF3YpfabSvxr6waliTZTGQkyjbL00skTndfbFCGpuT9bnpOBnAp
         YP7c1ue+8f0GRpLuvV1scHV6ukyGmU8BxsWdO6D16ghfy5i1rFjoAOJfAdoPRwI0cDII
         ZibQ==
X-Forwarded-Encrypted: i=1; AKwUvByWHVGyFOU/oHjAfo7kd9XEBoKhhh+RfbVeHqPhuh2/KIfliITQauFuRpJtA0/aDWjF/1EJQ3ASU7Zkhmo=@vger.kernel.org
X-Gm-Message-State: AFuF++lZktfSqNmGVVtwu4u2KzQ3Y+M9mDsTSkk/fQFlSUUsm25MLuF1
	Kd2ZOWDYLIbjZ/6hWL88Iabtp+ray3GEVmkXP+9WO0HHHoPgqtdT4HRF
X-Gm-Gg: AYBFou2UQyStAJQLLn/QBoYRtXvrtg0nKcBYAP7pHp7GCU+c9Q0bY2DvGij1G5AR+Nn
	bemL5aJKgNifYoVrMDaoiRugeKb945UVSx1L9WMC3qe4cOa/PNzQ2z2zKeTUB1TSZLZgW8fI+eO
	A7C5x1cllD+n6fhbPdLs5rY/CdkC9Vc0C7a4A1kVi2MLDLUqdtZHKVglD4w7r3Hn+SLBbTMdOJt
	Aq9uGOi8RtUgJSNy/j2NCQUHh4jgGgBkZOIoWWLB7Z5ceHkweGk9eae5Z+eym178jVF/rncDEpj
	r0BxIwtk3NMhlccY/p33AgNVfwS/crBuM4cpaP5rlNIENjDzzUg4Yq75QTJSAPY8yy7awNX0fTC
	HvO6bhKo3U+Lnq/CwY4uy9pDMCvs4m1OnSGbqOfWKiUA+ddbGkmY8zuY2DorzynRZ2FxQosjvdz
	YmOB51xBn9C0cm7BO60isSzy4fbaTvgQLGkeQ=
X-Received: by 2002:a17:907:96a0:b0:c26:3566:5b47 with SMTP id a640c23a62f3a-c2e4ad55c07mr1700466b.12.1790870173588;
        Thu, 01 Oct 2026 08:56:13 -0700 (PDT)
Received: from milan ([2001:9b1:d5a0:a500::24b])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2e31d96628sm181851866b.62.2026.10.01.08.56.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 08:56:13 -0700 (PDT)
From: Uladzislau Rezki <urezki@gmail.com>
X-Google-Original-From: Uladzislau Rezki <urezki@milan>
Date: Thu, 1 Oct 2026 17:56:10 +0200
To: Wen Jiang <jiangwenxiaomi@gmail.com>
Cc: Uladzislau Rezki <urezki@gmail.com>, akpm@linux-foundation.org,
	catalin.marinas@arm.com, linux-mm@kvack.org, will@kernel.org,
	Xueyuan.chen21@gmail.com, ajd@linux.ibm.com,
	anshuman.khandual@arm.com, baohua@kernel.org, chleroy@kernel.org,
	david@kernel.org, dev.jain@arm.com, jiangwen6@xiaomi.com,
	leo.yan@arm.com, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	maddy@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com,
	rppt@kernel.org, ryan.roberts@arm.com
Subject: Re: [PATCH v9 05/10] arm64/vmalloc: allow
 arch_vmap_pte_range_map_size() to batch multiple CONT_PTE
Message-ID: <ar6CmpPkwu1VgZ22@milan>
References: <20260923062832.479455-1-jiangwen6@xiaomi.com>
 <20260923062832.479455-6-jiangwen6@xiaomi.com>
 <ar0s14p8KPgmDKmR@milan>
 <CAHKocdEF3RE5FA+LPRf_E0ns02a5akvUDKvSDvERoyTryV1X6Q@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHKocdEF3RE5FA+LPRf_E0ns02a5akvUDKvSDvERoyTryV1X6Q@mail.gmail.com>

On Thu, Oct 01, 2026 at 03:55:44PM +0800, Wen Jiang wrote:
> On Wed, 30 Sept 2026 at 23:38, Uladzislau Rezki <urezki@gmail.com> wrote:
> >
> > On Wed, Sep 23, 2026 at 02:28:27PM +0800, Wen Jiang wrote:
> > > From: "Barry Song (Xiaomi)" <baohua@kernel.org>
> > >
> > > Allow arch_vmap_pte_range_map_size to batch across multiple CONT_PTE
> > > blocks, reducing both PTE setup and TLB flush iterations.
> > >
> > > For CONT_PTE_SIZE-aligned ranges, return a mapping size that may cover
> > > multiple CONT_PTE blocks, capped below PMD_SIZE. These sizes are vmalloc
> > > mapping spans, not HugeTLB hstate sizes.
> > >
> > > Signed-off-by: Barry Song (Xiaomi) <baohua@kernel.org>
> > > Signed-off-by: Wen Jiang <jiangwen6@xiaomi.com>
> > > Tested-by: Xueyuan Chen <xueyuan.chen21@gmail.com>
> > > Tested-by: Leo Yan <leo.yan@arm.com>
> > > ---
> > >  arch/arm64/include/asm/vmalloc.h | 8 +++++++-
> > >  1 file changed, 7 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/arch/arm64/include/asm/vmalloc.h b/arch/arm64/include/asm/vmalloc.h
> > > index 4ec1acd3c1b34..4053b1ec1902e 100644
> > > --- a/arch/arm64/include/asm/vmalloc.h
> > > +++ b/arch/arm64/include/asm/vmalloc.h
> > > @@ -23,10 +23,14 @@ static inline unsigned long arch_vmap_pte_range_map_size(unsigned long addr,
> > >                                               unsigned long end, u64 pfn,
> > >                                               unsigned int max_page_shift)
> > >  {
> > > +     unsigned long size;
> > > +
> > >       /*
> > >        * If the block is at least CONT_PTE_SIZE in size, and is naturally
> > >        * aligned in both virtual and physical space, then we can pte-map the
> > >        * block using the PTE_CONT bit for more efficient use of the TLB.
> > > +      * The returned mapping size may cover multiple CONT_PTE_SIZE blocks,
> > > +      * capped below PMD_SIZE.
> > >        */
> > >       if (max_page_shift < CONT_PTE_SHIFT)
> > >               return PAGE_SIZE;
> > > @@ -40,7 +44,9 @@ static inline unsigned long arch_vmap_pte_range_map_size(unsigned long addr,
> > >       if (!IS_ALIGNED(PFN_PHYS(pfn), CONT_PTE_SIZE))
> > >               return PAGE_SIZE;
> > >
> > > -     return CONT_PTE_SIZE;
> > > +     size = min3(end - addr, 1UL << max_page_shift, PMD_SIZE >> 1);
> > >
> > Capped below PMD_SIZE? It is half of PMD_SIZE. Where is that limitation
> > comes from? I think the commit message should be improved in that sense.
> >
> 
> Hi Uladzislau,
> 
> You're right, and the "half" is a leftover that can be dropped entirely.
> 
> Before this series decoupled vmalloc from the HugeTLB, the value
> returned here was fed into ilog2, which reconstructs pagesize as
> 1UL << shift. That forced the size to be a power of two, and PMD_SIZE >> 1
> was then the largest power of two strictly below PMD_SIZE,
> 
> How that pte_set_huge() takes the size directly, the size only needs
> CONT_PTE_SIZE alignment. And this function is only ever called for
> a range that the caller has already confined to a single PMD via
> pmd_addr_end(), so no explicit PMD cap is needed at all. I'll
> simplify it to:
> 
>         size = min2(end -addr, 1UL << max_page_shift);
> 
> and update the commit message accordingly.
> 
Thank you!

--
Uladzislau Rezki
