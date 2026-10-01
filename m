Received: from mail-ed2-f35.google.com (mail-ed2-f35.google.com [74.125.228.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE79D3BFAED
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 15:48:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790869701; cv=none; b=izMEC+76bkwe49MtHSb5RDw9U/MznBtAUEIhL79GXrp+E19rc8M+6oKGNQufwkA+cQSg+bC6lQeLoLmfQ93TipQCL+OzMpv1bS8OyQ0xY5ivsxRfEFDiFDO2+T4GACbpoZEPMlb9TPGtsuxjGwXTojRZeAV76uF6TORVz+lxBDY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790869701; c=relaxed/simple;
	bh=EDmGxkrIz1zl4b6PYaAgr/KW3mD7e7xXhwPBUF4b6+o=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dI6wb9lL5oqY/2iPkQWQVHy/vCgvK8RyHceRHXxinGp09qBEB7kIaEyiScbvw21TV0yCLjB7anSXlol4LvGhhV91jV/CrsET7N9wBi+TcHo3dYx5zKSCxdwivhnrjBO3laVsZgpepWptC6RMHL/ZS+xb2LRgRMb5P0THcK0GntI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nATOhURN; arc=none smtp.client-ip=74.125.228.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nATOhURN"
Received: by mail-ed2-f35.google.com with SMTP id 4fb4d7f45d1cf-6a605c198fdso10587551a12.2
        for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 08:48:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790869698; x=1791474498; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:date
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=1YG6o6wTRxoEQtd5iQEcu4HXOz2uoJ4yfyWYLykx9lM=;
        b=nATOhURNgJNhvAAHpdEgUQ2jAXh7VRacNQSibWGV6AXm7TNkayg2gmDCThPSFOQ5V2
         L20PjBwElyrMcPJrnSZpkoSYN7KrNiqcWIKNqTbJ0xxventExLu/IVMMwlpIQ7kPfvpe
         AktMMrc130ucl4uVk4luINhgANVchXFnGTticwoPv+MENvO96zrp1Jln6h8R6X7xtIPn
         8WMwlJ+2KW2ArvsUzabM59/1ArGg0f1Kvh7WMw58lgY69O98YBzK/kjPclB4cOa7aU3r
         H5xFL6psQG7fGiX7NM+CbKXjfbm7JYyXzLHrdlng0cRwALGWawjXdc8V/xeNubscuw1z
         BU8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790869698; x=1791474498;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:date
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=1YG6o6wTRxoEQtd5iQEcu4HXOz2uoJ4yfyWYLykx9lM=;
        b=Vj5zqcg9qbmWuP38NlgiUzc/sdBB0qJbWGu4zpzRyGDVImr1ANTujxiJ32B2ebUBE/
         UDBFBqzN645+9Y5IkKZhsrLKvzz2KSQS6UiNL4nT+9stjCIjnosspjwS2FQ1OpbYTsp4
         jYrDu7zE8P8I6VSZwwKHkC9Pu4vljtfN10q4QawhTVizDS+ReRoha4jXHf80k11QI8tT
         tFls8LJ5no0pgCpgQpM24K0cHAowulAlw5sXL2HEZjKsoESHUA676A65YJeZYKYMSXLq
         xWjCMpd/dqmwH61ZjiKcZr3VtwHDyF8N2yq6ICTWS/iLtQaC8WhICjEDrJHf3EGoCLdl
         uyXQ==
X-Forwarded-Encrypted: i=1; AKwUvBw5C7bl8q2GRYPHBCMciEf2qMvVNejwjpnkIxDFmKQizFh8rc9avhonY71Xrhr8+0+CwgohNB3V96otVZ8=@vger.kernel.org
X-Gm-Message-State: AFuF++kfKhRIeb4tYDguyWGwCEbsi/NckQNzCeglIwhlns406pB5ogXv
	NZMOK9MTtt1474D8nQ9v7aLlu3Loh/8H2aZjmDILmqMeSa1ZYcBnbJ7Q
X-Gm-Gg: AYBFou2mIBCYq6ELKo9hbg9SHenPZbHAjm04EDYSLDf8ceJ/Sx74W2sO3m8RRAsuaAS
	hf6ExVWMFXSOnLBbClWCo4/IjA9NwfWXB1fVIDDK0IhxNQ6z4uCRwwnBRnEAxSIYWvSSnklqoCF
	pbI8elhConq37eRaCVNsJfCev3t9S8orcvawrBIB70Ok0VPatEJ321MMhnyjsfiE9C0df9YQ7dy
	DqEoRgo/zG1r4ov/hBsbFxh3CG/sBgbyo5DZnDpEDEpaqzDpdzREfmzOaNgmfTCfzwjsYifK41K
	Vhee/GiTYZXK53rNc9corUGUzETmoyG3WZdThZMz7zl+JUgTMDErZ4YqUNK0YENLbqdjyN8q7kT
	FrH1JuR6bZhTgkk4FXeFPGXs431Y01OYSv9SYkz2Nck02RpRw3GqyjzzFD/q8lqhN7joLiN5Glv
	iDieUSau00VV+2ehWI2842iPbmH76Q0an7xUI=
X-Received: by 2002:a17:907:3f87:b0:c2e:856:2a08 with SMTP id a640c23a62f3a-c2e4a9b37a6mr2297866b.1.1790869697837;
        Thu, 01 Oct 2026 08:48:17 -0700 (PDT)
Received: from milan ([2001:9b1:d5a0:a500::24b])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2e31d87bdfsm180664666b.57.2026.10.01.08.48.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 08:48:05 -0700 (PDT)
From: Uladzislau Rezki <urezki@gmail.com>
X-Google-Original-From: Uladzislau Rezki <urezki@milan>
Date: Thu, 1 Oct 2026 17:48:00 +0200
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
Subject: Re: [PATCH v9 09/10] mm/vmalloc: map contiguous pages in batches for
 vmap() if possible
Message-ID: <ar6AsIvAviFFQjEh@milan>
References: <20260923062832.479455-1-jiangwen6@xiaomi.com>
 <20260923062832.479455-10-jiangwen6@xiaomi.com>
 <ar0lMkKxugZV7xyw@milan>
 <CAHKocdEqnCCyW1TgmiRotFO0hQdHt7pXP1sdqzZ7Up6wc+-Bsw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAHKocdEqnCCyW1TgmiRotFO0hQdHt7pXP1sdqzZ7Up6wc+-Bsw@mail.gmail.com>

On Thu, Oct 01, 2026 at 04:09:24PM +0800, Wen Jiang wrote:
> On Wed, 30 Sept 2026 at 23:05, Uladzislau Rezki <urezki@gmail.com> wrote:
> >
> > On Wed, Sep 23, 2026 at 02:28:31PM +0800, Wen Jiang wrote:
> > > From: "Barry Song (Xiaomi)" <baohua@kernel.org>
> > >
> > > In many cases, the pages passed to vmap() may include high-order
> > > pages. For example, the systemheap often allocates pages in descending
> > > order: order 8, then 4, then 0. Currently, vmap() iterates over every
> > > page individually—even pages inside a high-order block are handled
> > > one by one.
> > >
> > > This patch detects physically contiguous pages (regardless of whether
> > > they are compound or non-compound) by scanning with
> > > num_pages_contiguous(), and maps them as a single contiguous block
> > > whenever possible. The mapping order is determined by taking the
> > > minimum of the contiguous page count and the pfn alignment, allowing
> > > graceful degradation when pfn alignment is less than the contiguous
> > > range.
> > >
> > > Pages with the same page_shift are coalesced and mapped via
> > > vmap_pages_range_noflush_walk() to avoid page table rewalk.
> > >
> > > As users typically allocate memory in descending orders (e.g.
> > > 8 → 4 → 0), once an order-0 page is encountered, we stop scanning
> > > for contiguous pages since subsequent pages are likely order-0 as well.
> > >
> > > Signed-off-by: Barry Song (Xiaomi) <baohua@kernel.org>
> > > Co-developed-by: Dev Jain <dev.jain@arm.com>
> > > Signed-off-by: Dev Jain <dev.jain@arm.com>
> > > Signed-off-by: Wen Jiang <jiangwen6@xiaomi.com>
> > > Tested-by: Xueyuan Chen <xueyuan.chen21@gmail.com>
> > > Tested-by: Leo Yan <leo.yan@arm.com>
> > > ---
> > >  mm/vmalloc.c | 82 ++++++++++++++++++++++++++++++++++++++++++++++++++--
> > >  1 file changed, 80 insertions(+), 2 deletions(-)
> > >
> > > diff --git a/mm/vmalloc.c b/mm/vmalloc.c
> > > index a43965016eb4d..37cddb7f45a4f 100644
> > > --- a/mm/vmalloc.c
> > > +++ b/mm/vmalloc.c
> > > @@ -3576,6 +3576,85 @@ static inline unsigned int vm_shift(pgprot_t prot, unsigned long size)
> > >       return arch_vmap_pte_supported_shift(size);
> > >  }
> > >
> > > +static inline int get_vmap_batch_order(struct page **pages,
> > > +             pgprot_t prot, unsigned int nr_pages)
> > >
> > get_vmap_mapping_order()?
> >
> 
> Agreed, that's a clearer name.
> 
> > > +{
> > > +     unsigned long pfn;
> > > +     unsigned int nr_contig;
> > > +     int order;
> > > +
> > > +     if (!IS_ENABLED(CONFIG_HAVE_ARCH_HUGE_VMAP))
> > > +             return 0;
> > > +
> > > +     /* Limit nr_pages by pfn alignment */
> > > +     pfn = page_to_pfn(*pages);
> > > +     if (pfn > 0)
> > > +             nr_pages = min_t(size_t, nr_pages, 1UL << __ffs(pfn));
> > > +
> > > +     nr_contig = num_pages_contiguous(pages, nr_pages);
> > > +     if (nr_contig < 2)
> > > +             return 0;
> > > +
> > > +     order = ilog2(nr_contig);
> > > +
> > > +     if (vm_shift(prot, PAGE_SIZE << order) == PAGE_SHIFT)
> > > +             return 0;
> > > +
> > > +     return order;
> > > +}
> > > +
> > > +static int vmap_pages_range_batched(unsigned long addr, unsigned long end,
> > > +             pgprot_t prot, struct page **pages)
> > > +{
> > > +     const unsigned int nr_pages = (end - addr) >> PAGE_SHIFT;
> > > +     unsigned int prev_shift = 0, batch_idx = 0;
> > > +     unsigned long batch_start = addr, batch_end = addr;
> > > +     int err;
> > > +
> > > +     err = kmsan_vmap_pages_range_noflush(addr, end, prot, pages,
> > > +                                          PAGE_SHIFT, GFP_KERNEL);
> > > +
> > > +     if (err)
> > > +             goto out;
> > > +
> > > +     for (unsigned int i = 0; i < nr_pages; ) {
> > > +             unsigned int shift = PAGE_SHIFT +
> > > +                     get_vmap_batch_order(pages + i, prot, nr_pages - i);
> > > +
> > > +             if (!i)
> > > +                     prev_shift = shift;
> > > +
> > > +             if (shift != prev_shift) {
> > > +                     err = vmap_pages_range_noflush_walk(batch_start, batch_end,
> > > +                                     prot, pages + batch_idx, prev_shift);
> > > +                     if (err)
> > > +                             goto out;
> > > +                     prev_shift = shift;
> > > +                     batch_start = batch_end;
> > > +                     batch_idx = i;
> > > +             }
> > > +
> > > +             /*
> > > +              * Once we fail to batch pages, we expect to fail batching
> > > +              * for all remaining pages, so just give up.
> > > +              */
> > > +             if (shift == PAGE_SHIFT)
> > > +                     break;
> > > +
> > > +             batch_end += 1UL << shift;
> > > +             i += 1U << (shift - PAGE_SHIFT);
> > > +     }
> > > +
> > > +     /* Remaining */
> > > +     if (batch_start < end)
> > > +             err = vmap_pages_range_noflush_walk(batch_start, end, prot,
> > > +                             pages + batch_idx, prev_shift);
> > > +
> > > +out:
> > > +     flush_cache_vmap(addr, end);
> > > +     return err;
> > >
> > On error, if kmsan_vmap_pages_range_noflush() succeed you do not do a
> > proper cleanup?
> >
> > i.e. to cleanup KMSAN metadata: kmsan_vunmap_range_noflush(addr, end);
> >
> 
> The KMSAN metadata is cleaned up by the caller: on error vmap calls
> vunmap(area->addr), which reaches kmsan_vunmap_range_noflush() through
> remove_vm_area() -> free_unmap_vmap_area() -> vunmap_range_noflush().
> That is the same contract as the pre-existing vmap_pages_range() path,
> which likewise relied on the caller's vunmap() to clean up. So there
> is no behavioral
> change here.
> 
Right. With better naming:

Reviewed-by: Uladzislau Rezki (Sony) <urezki@gmail.com>

--
Uladzislau Rezki


