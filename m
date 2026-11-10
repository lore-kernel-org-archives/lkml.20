Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794280958;
	b=P0zNJdVQ4aDhOCb/rNg0W4dpQ2qjOc4bqY0+oTS3VSdZWPg66xl4hMu4wmT7OGG+zP+Y
	 x8E2IeKSamP6BeN8wlMFAchiIVkaPb5HEuHbMJtm2qO2c6NM6A9gucMSovHwC/bq4K+sU
	 st0o98oN6tdtXJFqreyRTfw7edVPiCRnuWabi7UqN64vHycYvycNvpYYnKMGxZRLD6aNu
	 /g3pNCn8ePI+JnsSA3VQq4pWc5z0peH1yCU44kH0CJcgJAdBgA03zyn6a5qwVDVlvJVqT
	 bZaqraWTiTQcbF1QFz+VsiuCfl8I6n2tqFpZfvqyvif26P7kh+/c0d9YVrIqWE+UFug==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794280958;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:In-Reply-To:Date:Message-ID:References:
	 MIME-version:Content-type:Content-Transfer-Encoding;
	bh=W/wp6KJO63iMMRJlz6HcbO/i7czGvSk/CyVD5tv8Mv8=;
	b=tpJWmBlVyklYhJCJp5jVqJKAdBef/6+NZqyccuSI8q1csTwdi82R17x+m7KkPoPNkvMV
	 UIbjI9F3LRKqLNGhgVqvFbI6FWcf6lWHAU4GoGWpNxocm+waudogbmFF6EzcUO3ZhtKor
	 nEbLa55LMz8A46xXEeZcmASx804iDWuTvYAbKyFjAKMtb0Ao8XZK5+rmIi/qpbBmhfLhi
	 al0pNIsd1ZFTn7pVybpHXp7kkWq1u8iLIU/2vFK9SVSTpJTBEPwuCcPKmcJRcrFJSCNVD
	 CD6zlHOlysdvNU69iZb1xoR+/2mwQhfJ2xc1MvQw1F50ctR0zn5o4M+Onk+nSaPLgtA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kAzOutwB;
	arc=none smtp.remote-ip=74.125.82.173
Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3070160A260F
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 03:22:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3070160A260F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kAzOutwB
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-36f8cdd30beso1939345eec.1
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 19:22:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794280957; x=1794885757; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :message-id:date:in-reply-to:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=W/wp6KJO63iMMRJlz6HcbO/i7czGvSk/CyVD5tv8Mv8=;
        b=kAzOutwBbsGWqT4Ps+ofgIDVt+iyD96+XCm0s0L4jv9uqf18bCIviyx6+M9zbsc6SI
         8X1ZjCWVGQD+HlZX/izasG92PKp2gGRL+1m9xZ4/G2DA1KaEny9dB3RgvRPM/yBrNVnn
         Nbm9ydQ8fVSb0oH050aZ7CrqvCGABRiLVmwRuQw7PkzLUVj5O7FMJuM7IfuK7Kc6WOYV
         iICSs1lxRXims8EHylU+gVJzg7KJi7MiLC+u/UEOLc6/bRaWi3EAajKLcL2don8+2QZZ
         LLNTTlKFy3l7+4tWgUsGSpbFNfjC/rBLsJC8m3Cb/J6wSQWUa12BPqVwIu/9oE1JUIqX
         C3Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794280957; x=1794885757;
        h=content-transfer-encoding:content-type:mime-version:references
         :message-id:date:in-reply-to:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=W/wp6KJO63iMMRJlz6HcbO/i7czGvSk/CyVD5tv8Mv8=;
        b=HLI3HnoqE3wXntW2vmRpBSk/rnyWgeLvc2AfUN/FV+us+ar0eepXLz/cXnpp0oDcem
         lG0zC2es5OGBobJ8JL6WQ8aQiZzLKsCsLn/2ZeCMUKbE2eX8B9hkaDEfgE8CzLrOgbyL
         DMnlUDGvUZ+ffdgbXAeOyNvoFhsPADwGQVDFmlNq6+43s8lYs8IzvXwm+0preB7u4mvQ
         nWSo9K92xgO7SJ3haYQMP8YClSy/2e6u7JlG4XTIg51Ve3Gl1VoRT9AAsNC+zjZV0QwG
         gQK4WaV3VQzd7fedherYzl628nj+ypoETOro7Zx03kWRYcQyikSLdphgJJenCdXsxxya
         Hacg==
X-Forwarded-Encrypted: i=1; AL+hErHPLFqxeJ/QJhbH926dp4vrnJwAhVNtPrHijPgiia757ZmG2nVCkhEjAR6H7WW8e0K0GnI6VtMdAFM/hi8=@vger.kernel.org
X-Gm-Message-State: APuU4Z96egLji69eRaugbKftXtO3mDFyOiq7sIhSXSsy1z5W4tv0Qhld
	5BRIukMw4klDafrvwq069vg2tYVFADHgydjqdUpuaa7ld3wcwwQEQkLB
X-Gm-Gg: AYBFou2s1zwF9VgrxexTE40R18X583SY5fPDKC5UJlGVgWRhyILRKFjTIAOYTTow+Ro
	RiNxxLcdrfh/iGeGJh6laGSNrEJvDtx5Do5ML97mhPm7f7F4qKykkmFj9/8pWtHrXMdKcZfyGo2
	OCdtbeLi07qzKIbJ4hilMjGHaUii6byQafo2nRzHpzrXdxDjdn3pzvgyI+OKNee3fZx2ugNeE4L
	s20HlcCRSac3iLXCDAE+89VzvQe9ULo8JNcEyU/cWDoDwwKWBd0OpW07tZxY6Gc9P8BSsAdEBy4
	CbjkAdqingr5A0cmTm64LGpuYtUwVC3iWnPqOAJ2JZOLA6CC41wua1Jb+5UulPlwdIqKo/tbHL0
	DNBkUKKnsz9VTuBWeUex6hqFejxjraZSNf9wDO0qpSCrdsvkTMXPFdhRVtGwse4R82+7tnthm0o
	6rU5juzxy0hwngkFybzjCxTFpveQK+gU6dtouDSbnA8OOsaN9H2wmxdT3nBBUCwC7MYdQ8SLPiF
	CDX2RAAs24plHfv378+fCqeXN89duPVVP+gpnMLDteOlytIoQ7D/FoeDrSWf2a3M3FXGpIwmePv
	1qL8Vb94TmHlqnEMrFOssB/h5/Iw
X-Received: by 2002:a05:7300:3b03:b0:366:2893:7421 with SMTP id 5a478bee46e88-3751e6acd4cmr2378114eec.10.1794280957102;
        Mon, 09 Nov 2026 19:22:37 -0800 (PST)
Received: from pve-server ([49.205.216.49])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37520bf3e18sm4159008eec.16.2026.11.09.19.22.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 19:22:36 -0800 (PST)
From: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
To: Konstantin Khorenko <khorenko@virtuozzo.com>, Andrew Morton <akpm@linux-foundation.org>, "David Hildenbrand (Arm)" <david@kernel.org>, Zi Yan <ziy@nvidia.com>, Baolin Wang <baolin.wang@linux.alibaba.com>, "Liam R. Howlett" <liam@infradead.org>, Nico Pache <nico.pache@linux.dev>, Ryan Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>, Barry Song <baohua@kernel.org>, Lance Yang <lance.yang@linux.dev>, Usama Arif <usama.arif@linux.dev>, Kiryl Shutsemau <kas@kernel.org>, Peter Xu <peterx@redhat.com>
Cc: Alex Williamson <alex@shazbot.org>, kvm@vger.kernel.org, =?utf-8?Q?Lo?=
 =?utf-8?Q?=C3=AFc?= Molinari <loic.molinari@collabora.com>, Lorenzo Stoakes
 <ljs@kernel.org>, Shuah Khan <shuah@kernel.org>,
 linux-kselftest@vger.kernel.org, dri-devel@lists.freedesktop.org, Madhavan
 Srinivasan <maddy@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org, Konstantin Khorenko
 <khorenko@virtuozzo.com>, Jason Gunthorpe <jgg@ziepe.ca>,
 stable@vger.kernel.org, Sashiko <sashiko-bot@kernel.org>
Subject: Re: [PATCH v5 3/4] mm/huge_memory: read a special PMD under the lock in copy_huge_pmd()
In-Reply-To: <20261104-b4-prep-vstor-149847-copy_huge_pmd-recheck-special-pmd-v5-3-c56d0d26f970@virtuozzo.com>
Date: Tue, 10 Nov 2026 08:30:44 +0530
Message-ID: <pkwd8k6b.ritesh.list@gmail.com>
References: <20261104-b4-prep-vstor-149847-copy_huge_pmd-recheck-special-pmd-v5-0-c56d0d26f970@virtuozzo.com> <20261104-b4-prep-vstor-149847-copy_huge_pmd-recheck-special-pmd-v5-3-c56d0d26f970@virtuozzo.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-version: 1.0
Content-type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit

Konstantin Khorenko <khorenko@virtuozzo.com> writes:

> copy_huge_pmd() reads a special PMD without the page table lock and
> copies that value to the child. The mmap write lock held by fork does
> not stop unmap_mapping_range(): it zaps under i_mmap_rwsem and the PMD
> lock.
>
> The zap visits the parent VMA before the child's, as dup_mmap() links
> the child right after the parent in i_mmap. If it clears the parent PMD
> after fork has read it, and passes the child before fork copies it, the
> child keeps a mapping the driver has revoked, for example:
>
> - vfio-pci: the child reaches the BAR after the device memory was
>   disabled or the device was reset, instead of getting SIGBUS;
> - panthor: the child maps the pages of an evicted buffer object after
>   the driver has released them.
>
> The same branch deposits no page table under the copy. ppc64 in hash
> mode keeps the hash slot array of every huge PMD in that table, so the
> child dereferences a NULL table on the first hash fault, in
> __hash_page_thp(), and on the zap, in hash__pmdp_huge_get_and_clear().
>
> Take the locks first and let vm_normal_page_pmd() tell a PFN mapping
> from a folio under them, as copy_present_ptes() does with
> vm_normal_page(). The zap clears the parent PMD under the same lock, so
> either fork finds it none and skips it, or the copy is in place before
> the zap reaches the child.
>
> The copy of a PFN mapping then goes through the same tail as a folio:
>
> - it gets a page table where the architecture needs one;
> - in a shared mapping it is marked clean in the child, as a PTE is;
> - in a CoW mapping, which only VM_MIXEDMAP allows, both sides are write
>   protected instead of a warning being printed.
>
> Fixes: bc02afbd4d73 ("mm/fork: accept huge pfnmap entries")
> Fixes: d1503aa9ab80 ("powerpc/64s: Add support for huge pfnmaps")

Thanks Konstantin, for fixing this. Without this patch I can reproduce the problem on Hash
on Power (on my test dev setup), after fork(), when child touches those pages.

[   62.543247][  T242] Kernel attempted to read user page (0) - exploit attempt? (uid: 0)
[   62.544992][  T242] BUG: Kernel NULL pointer dereference on read at 0x00000000
[   62.545335][  T242] Faulting instruction address: 0xc0000000000a0ee8
cpu 0x0: Vector: 300 (Data Access) at [c00000002035f9d0]
    pc: c0000000000a0ee8: __hash_page_thp+0x218/0x560
    lr: c0000000000a0e14: __hash_page_thp+0x144/0x560
    sp: c00000002035fc70
   msr: 8000000000009033
   dar: 0
 dsisr: 40000000
  current = 0xc00000001fb08480
  paca    = 0xc000000005010000   irqmask: 0x03   irq_happened: 0x09
    pid   = 242, comm = vfio-fork
enter ? for help
[c00000002035fc70] 0000000000000000 (unreliable)
[c00000002035fd30] c000000000098a40 hash_page_mm+0x688/0x8d0
[c00000002035fe10] c000000000098dc8 do_hash_fault+0x140/0x368
[c00000002035fe50] c000000000008be0 data_access_common_virt+0x210/0x220
---- Exception: 300 (Data Access) at 0000000010001b60
SP (7fffde6dd7b0) is in userspace

With this series, I see that the issue is fixed. Thanks for helping in
fixing it. Please feel free to add:

Tested-by: Ritesh Harjani (IBM) <ritesh.list@gmail.com> #PowerPC






> Cc: stable@vger.kernel.org
> Reported-by: Sashiko <sashiko-bot@kernel.org>
> Closes: https://sashiko.dev/#/patchset/20261014-b4-prep-vstor-149847-copy_huge_pmd-recheck-special-pmd-v1-1-d225c60bc316@virtuozzo.com?part=1
> Suggested-by: David Hildenbrand (Arm) <david@kernel.org>
> Acked-by: Kiryl Shutsemau (Meta) <kas@kernel.org>
> Acked-by: David Hildenbrand (Arm) <david@kernel.org>
> Signed-off-by: Konstantin Khorenko <khorenko@virtuozzo.com>
> ---
>  mm/huge_memory.c | 24 +++---------------------
>  1 file changed, 3 insertions(+), 21 deletions(-)
>
> diff --git a/mm/huge_memory.c b/mm/huge_memory.c
> index e00632edb3856..9cb5f99aba87f 100644
> --- a/mm/huge_memory.c
> +++ b/mm/huge_memory.c
> @@ -1961,25 +1961,6 @@ int copy_huge_pmd(struct mm_struct *dst_mm, struct mm_struct *src_mm,
>  	int ret = -ENOMEM;
>  	bool writable;
>  
> -	pmd = pmdp_get_lockless(src_pmd);
> -	if (unlikely(pmd_present(pmd) && pmd_special(pmd) &&
> -		     !is_huge_zero_pmd(pmd))) {
> -		dst_ptl = pmd_lock(dst_mm, dst_pmd);
> -		src_ptl = pmd_lockptr(src_mm, src_pmd);
> -		spin_lock_nested(src_ptl, SINGLE_DEPTH_NESTING);
> -		/*
> -		 * No need to recheck the pmd, it can't change with write
> -		 * mmap lock held here.
> -		 *
> -		 * Meanwhile, making sure it's not a CoW VMA with writable
> -		 * mapping, otherwise it means either the anon page wrongly
> -		 * applied special bit, or we made the PRIVATE mapping be
> -		 * able to wrongly write to the backend MMIO.
> -		 */
> -		VM_WARN_ON_ONCE(vma_is_cow_mapping(src_vma) && pmd_write(pmd));
> -		goto set_pmd;
> -	}
> -
>  	if (vma_is_anonymous(dst_vma) || arch_needs_pgtable_deposit()) {
>  		pgtable = pte_alloc_one(dst_mm);
>  		if (unlikely(!pgtable))
> @@ -2021,7 +2002,9 @@ int copy_huge_pmd(struct mm_struct *dst_mm, struct mm_struct *src_mm,
>  		goto copy_pmd;
>  	}
>  
> -	src_page = pmd_page(pmd);
> +	src_page = vm_normal_page_pmd(src_vma, addr, pmd);
> +	if (!src_page)
> +		goto copy_pmd;
>  	VM_BUG_ON_PAGE(!PageHead(src_page), src_page);
>  	src_folio = page_folio(src_page);
>  
> @@ -2061,7 +2044,6 @@ int copy_huge_pmd(struct mm_struct *dst_mm, struct mm_struct *src_mm,
>  	}
>  	if (src_vma->vm_flags & VM_SHARED)
>  		pmd = pmd_mkclean(pmd);
> -set_pmd:
>  	pmd = pmd_mkold(pmd);
>  	set_pmd_at(dst_mm, addr, dst_pmd, pmd);
>  
>
> -- 
> 2.43.0
