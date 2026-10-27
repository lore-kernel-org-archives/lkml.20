Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793112632;
	b=ZRZ8P9fnkHBzN3JLOdYeJeREZux7Yuu9iqb/8pYIkFF8aDQ3HMtLegk/clYHUE8Tlg4Y
	 LPMgZpiAVaK3SogmvujCcKYddign/Fqmbxy0VIDthPqULk6HFiiIvxfRnAdmZNdELJZ1a
	 pd0a9mmQenBXYe+dsO6gZE1RXb3PAKv6ce6dy+QcUMINyy5boxY7lTb9MrhAr9MZCzQCE
	 DnAqaOfT5FGBVXa8dJdZGbpFwzZvMZBuvk7A4uMgBI0gY1rOsu9k0E4NGQ31XwzwcJmAK
	 J4RfuY/udGSO0BR1qcTRH6Os07KjryxpXe1E0QEWs0v+HUlVckOOxXManS7hrwc5Gjg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793112632;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=GrQrPLClmrsE+He4Exu1Cy0LMOiiaKKo07ZDQ53Bndk=;
	b=L/nbFmd9rV1ySOFDOFDkLXMyBSrkS1V8tcmqCzuOVKN6JCFfSCDA92FJz/54OQQ36Iau
	 eaOXNnGGNrbl5ETMETJQlC1JLiMTs0C0/mcQ/Rf/Z5TMD06iOmadNHeoya+N9Y+eMYvcd
	 M4k7c+hlempKxct3+gOuVDHVdAdpI6uHevujngjxpBJ1C61mpV4PLUioyv3797W0zbzLQ
	 mAit2Oy0RIh0DbDpRljRKlthKedpnzHDEXxekCQKdQyHfO7fRtBUZmpt3SXjj87WXt66b
	 velB2bvEWbfmhwq1uzP92rHghGcFWp60hzpjhn7LH/tJtLuQUGsUcWgw5+aBIKMmYzg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=b7UQYNp8;
	arc=none smtp.remote-ip=209.85.221.179
Received: from mail-vk1-f179.google.com (mail-vk1-f179.google.com [209.85.221.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24DA8606A31A
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 14:50:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 24DA8606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=b7UQYNp8
Received: by mail-vk1-f179.google.com with SMTP id 71dfb90a1353d-5eaaa9b1591so2670494e0c.3
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 07:50:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793112630; x=1793717430; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GrQrPLClmrsE+He4Exu1Cy0LMOiiaKKo07ZDQ53Bndk=;
        b=b7UQYNp8E/kEmytO3Y9Gqj8smg5X/tk9yms2FJ5kVGiJct5g9ceUxwasa/E6dvgMfU
         UBwL1K5AgdOnZXU7ebsPH0LS99mpimvsLY+omC8GG+le/erm6EnryqpScrLFzy4+19RF
         zdoKsR2ueRCaoAIJzh298BVFGE1dRC5+c6dCqGnjlLHOg+dDTM9Evf6G7aikyp4ylQnZ
         5yq7fdJ7PYqHg3B2lZYjlE+Ypvvk6Bia/lJmWi/3zy0HUZb0YLjFJFgJTZWiCGdX5N3z
         dTdzfUtqZc3KRS0pWodlfokykCMEqCacqQLgHYwPkrmrVE0HmM/ui0Sh5RTKv/7FHBb3
         +RvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793112630; x=1793717430;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=GrQrPLClmrsE+He4Exu1Cy0LMOiiaKKo07ZDQ53Bndk=;
        b=j5Ay39AC+nawMe8XansdYddo2zYz1ftpk0VoFAluBRIdF19qE5yCwTPGvbrFE/65ee
         w/Y0vdiYKmzF1ftAzLNtvcE8XvCHEGV2v3/CpVnJANOobRzg05I1bh/GMj0QFjqbNMpQ
         HiH8Y02aKCz/G2U6xfLHZmOgIZmEX+k8Ry2MRdDw0Q+wjRMsC5DQtMKCG3VwA3HLmp1/
         PUFa2w7lsvwd5yquwvczESAODpaym657EC6cBxFPmpPk1edxgLCJ8pzh+MoSGBnEkka3
         FO/4UCSxWF/y1UOILv1+GR3Y3lGSKodSRFnmUOkzqucJXzROxCUFKKQJcIbYL5wDc3+9
         aijQ==
X-Forwarded-Encrypted: i=1; AKwUvBwr16eLWn8GcFSHcx6LqNcyuxd/n+MeRDJKGModtswkIaneP5pzDmv7isGEli0tWzRl/1L+H0lJgjPsxiY=@vger.kernel.org
X-Gm-Message-State: AFq9FYJl0NyrzB+6p9gLBlm1+3KRV5BTVPu9gkJpTRUvWx6iPn5HMpzi
	/ZMXmuQOh4S3HHQfuYNYzdy2CkkSptccgF3avIoNggn9Kwebvd4GlFQR
X-Gm-Gg: AYBFou3UzuonOjnDYY/41kHtCvfUDAi1qbiWeXjq8ajc4MlCNu9JTHsc37D4rEc1ngo
	CwOQashQXdJLoX5sRzfYLOGRpEiXJsuasa5MvSv315i7PReJsjx/XM0SbmXMWSUBkcsIv+Mv7lR
	ig57HOVCIHcRShE+fND5h8eSlO2lL9Y3DorxdMc0mXtJVZVbjWgWKKW2nAT2cuM7ET3E1MEoLNG
	9ym7bLM3KPqDZpBxbZnji78o1BtqC11Ha5MC6aHKHJSXKlQaI1hgNquSyk7gNO9ShboqrAYMi5d
	gazsx8YGyPNXntSM87eonZQTh07eNssaBHeaGm12EzPO0wc2k1EbcacZkd+lMb8q5hjyv1ptOyP
	tp5Yvm6GZcLsRS2DWb18JCweX1fjMUPj1/g9KDjWGTPSIQM6VoYFIM6csp1U5z2DHfuJ5dXgORG
	86jxF3ALWbtiLPxl84TmYlc11ytfhYK84TTVeQdb2C93PtkV2KWPAYY8HkpujiswagJXaBV2yPF
	YTR8fUOKTDPmO4wEEs4V6UVTEBEnMbncarFOEXlD+ihzCrAayEUwQ+HdFgs46YdfnKeCKyQGNNx
	qqCWFQ1yJuoHpZhEgtpiE/a/Fp/xhfzt82sVkNtZvLV1PcRpk6IXe3f0
X-Received: by 2002:a05:6102:5809:b0:7c3:c0b9:8d50 with SMTP id ada2fe7eead31-7ce5cd9de6emr3685058137.21.1793112630369;
        Tue, 27 Oct 2026 07:50:30 -0700 (PDT)
Received: from fedora ([187.120.134.44])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5ec4a4b4b09sm110371e0c.3.2026.10.27.07.50.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 07:50:29 -0700 (PDT)
From: Guilherme Giacomo Simoes <trintaeoitogc@gmail.com>
To: trintaeoitogc@gmail.com
Cc: akpm@linux-foundation.org,
	david@kernel.org,
	liam@infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	ljs@kernel.org,
	mhocko@suse.com,
	rppt@kernel.org,
	surenb@google.com,
	vbabka@kernel.org
Subject: Re: [PATCH] mm: clear pmd in pmdp_invalidate()
Date: Tue, 27 Oct 2026 11:50:15 -0300
Message-ID: <20261027145015.1338865-1-trintaeoitogc@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20261027140950.1337359-1-trintaeoitogc@gmail.com>
References: <20261027140950.1337359-1-trintaeoitogc@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Guilherme Giacomo Simoes <trintaeoitogc@gmail.com> wrote:
> "David Hildenbrand (Arm)" <david@kernel.org> wrote:
> > > when attempt to do a madvise in a chunk of memory allocated by mmap, the
> > > folio_split is called to split a portion of memory, and despite the path
> > > leads to pmd_mkinvalid() they do not clear the pmd and clearer wording,
> > > leading to a BUG_ON inside page_table_check_set() because the map count
> > > is more than 1.
> > >
> > > Call the page_table_check_pmd_clear() inside pmdp_invalidate() generic
> > > function to ensure that the pmd will have they map count decrement.
> > >
> >
> > The subject + description is rather confusing: you are not "clearing the pmd",
> > you tell page-table-check that the PMD was cleared.
> >
> > This is all about apge-table-check.
> Yes, you are right, i'm not clearing the pmd, I will improve this.
> 
> >
> > Can you post the actual kernel splat you ran into? Or is this generated by an LLM?
> Of course, the stack trace of error is (already decoded):
> page_table_check_set (mm/page_table_check.c:118)
> __page_table_check_ptes_set (mm/page_table_check.c:223)
> remove_migration_pte (include/linux/page_table_check.h:83 arch/riscv/include/asm/pgtable.h:642 mm/migrate.c:448)
> rmap_walk_anon (mm/rmap.c:3053)
> rmap_walk_locked (mm/rmap.c:3169 mm/rmap.c:3164)
> remove_migration_ptes (mm/migrate.c:483)
> __folio_split (mm/huge_memory.c:3640 mm/huge_memory.c:4289)
> split_folio_to_list (mm/huge_memory.c:4435 include/linux/huge_mm.h:416 mm/huge_memory.c:4499)
> madvise_cold_or_pageout_pte_range (mm/madvise.c:420)
> walk_pgd_range (mm/pagewalk.c:147 mm/pagewalk.c:237 mm/pagewalk.c:278 mm/pagewalk.c:319)
> __walk_page_range (mm/pagewalk.c:427)
> walk_page_range_vma_unsafe (mm/pagewalk.c:737)
> walk_page_range_vma (mm/pagewalk.c:747)
> madvise_cold (mm/madvise.c:594 mm/madvise.c:614)
> madvise_vma_behavior (mm/madvise.c:1364)
> madvise_walk_vmas (mm/madvise.c:1721)
> madvise_do_behavior (mm/madvise.c:1916)
> do_madvise (mm/madvise.c:2014)
> __riscv_sys_madvise (mm/madvise.c:2023 mm/madvise.c:2021 mm/madvise.c:2021)
> syscall_handler (arch/riscv/include/asm/syscall.h:112)
> do_trap_ecall_u (arch/riscv/kernel/traps.c:341)
> handle_exception (arch/riscv/kernel/entry.S:237)
> 
> And the repro.c that I writed to reproduce bug:
> ```
> #include <stdio.h>
> #include <stdlib.h>
> #include <string.h>
> #include <unistd.h>
> #include <sys/mman.h>
> #include <sys/syscall.h>
> #include <errno.h>
> #include <linux/mman.h>
> 
> #ifndef MADV_COLD
> #define MADV_COLD 20
> #endif
> 
> #define HPAGE_PMD_SIZE (2 * 1024 * 1024)  // 2MB huge page on RISC-V
> 
> int main(void)
> {
>         char *addr;
>         size_t len = HPAGE_PMD_SIZE * 2;  // 4MB - two huge pages
>         int ret;
> 
>         printf("Testing page_table_check bug with madvise(MADV_COLD)...\n");
>         printf("Huge page size: %zu MB\n", HPAGE_PMD_SIZE / (1024*1024));
> 
>         // Fallback: try without MAP_HUGETLB (kernel will use THP)
>         printf("starting THP...\n");
>         addr = mmap(NULL, len, PROT_READ | PROT_WRITE,
>                     MAP_PRIVATE | MAP_ANONYMOUS, -1, 0);
>         if (addr == MAP_FAILED) {
>                 perror("mmap failed");
>                 return 1;
>         }
>         // Enable THP for this mapping
>         ret = madvise(addr, len, MADV_HUGEPAGE);
>         if (ret) {
>                 perror("madvise(MADV_HUGEPAGE) failed");
>                 return 1;
>         }
> 
>         printf("Allocated memory at %p\n", addr);
> 
>         // Write to the pages to ensure they're mapped
>         memset(addr, 'A', len);
>         memset(addr + HPAGE_PMD_SIZE, 'B', HPAGE_PMD_SIZE);
> 
>         // Touch pages to ensure huge page allocation
>         for (size_t i = 0; i < len; i += HPAGE_PMD_SIZE) {
>                 addr[i] = 'X';
>         }
> 
>         printf("Memory initialized, calling madvise(MADV_COLD) on partial range...\n");
> 
>         // Call madvise(MADV_COLD) on a partial range of the first huge page
>         // This should trigger the huge page split and the bug
>         ret = madvise(addr + 4096, HPAGE_PMD_SIZE - 8192, MADV_COLD);
>         if (ret) {
>                 perror("madvise(MADV_COLD) failed");
>                 // Don't return - the kernel might have crashed
>         }
> 
>         printf("madvise returned: %d (errno: %d)\n", ret, errno);
> 
>         // If we get here without kernel crash, the bug might be fixed
>         // or the conditions weren't met
>         printf("Test completed (if kernel didn't crash, bug may be fixed or not triggered)\n");
> 
>         munmap(addr, len);
>         return 0;
> }
> ```
> 
> I see this BUG here:
> https://lore.kernel.org/all/69851c62.a00a0220.37c87e.002e.GAE@google.com/T/
> 
> Yes, I'd should mencioned "Reported-by: syzbot+227179d5a8a87e9df90d@syzkaller.appspotmail.com", my bad

At first, I suspected of pmd_user_accessible_pages() and I started analyze this
function. In a brief search I found a CVE that fix similar bug:
https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/?id=21e5eca0ac9046da9918a919bc92b7b5a78d27e7
They do this:
```
-	return pmd_leaf(pmd) && (pmd_user(pmd) || pmd_user_exec(pmd));
+	return pmd_leaf(pmd) && !pmd_present_invalid(pmd) && (pmd_user(pmd) || pmd_user_exec(pmd));
```

but, inside riscv-dependent code (where this fix happen), the pmd_user_accessible_page() is:
```
static inline bool pmd_user_accessible_page(struct mm_struct *mm, unsigned long addr, pmd_t pmd)
{
	return pmd_leaf(pmd) && pmd_user(pmd);
}
```

and the pmd_leaf() do:
```
	return pmd_present(pmd) && (pmd_val(pmd) & _PAGE_LEAF);
```

and pmd_present, do:
```
#ifdef CONFIG_TRANSPARENT_HUGEPAGE
	(pmd_val(pmd) & (_PAGE_PRESENT | _PAGE_PROT_NONE | _PAGE_LEAF))
#else
	(pmd_val(pmd) & (_PAGE_PRESENT | _PAGE_PROT_NONE));
```

So , the pmd_leaf() looks like good enough to check if the pmd is accessible to
page_table_check.

... Too , I suspected of PAGE_PROT_NONE, because the doc above they declaration say:
```
/*
 * _PAGE_PROT_NONE is set on not-present pages (and ignored by the hardware) to
 * distinguish them from swapped out pages
 */
```
And this lead me to think "if set a not-present pages, so maybe this not should
return true inside pmd_user_accessible_page".... 

So I check the `git log` to see when and why this is introduced. But how is
mentioned by git commit message:
```
commit e3613bb8afc2a9474c9214d65c8326c5ac02135e
Author: Stefan O'Rear <sorear2@gmail.com>
Date:   Sun Dec 16 13:03:36 2018 -0500

    riscv: Add pte bit to distinguish swap from invalid
    
    Previously, invalid PTEs and swap PTEs had the same binary
    representation, causing errors when attempting to unmap PROT_NONE
    mappings, including implicit unmap on exit.

    ...
```

So , they is introduced to distinguish between swap and invalid ptes.

So , I concluded that this is not the problem, but maybe the documentation is
not good enought about the PAGE_PROT_NONE flag.

And, after a lot of thoughts, I try to call page_table_check_pmd_clear() ,
inside pmdp_invalidate(). I attempt to do this because, I see any architecture
dependent pmdp_invalidate() calling this function and think that probably this
is the solution... 
I apply , test with my repro.c and , this WORK. 

I implement this inside generic pmdp_invalidate() because, in my mind this is a
generic problem and can happen in any architecture not inside riscv specific.


thanks,
guilherme
