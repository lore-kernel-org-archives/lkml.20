Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793318870;
	b=KOgWRJ04FdCMS59mZ+cKmoRcBvSA5XAzSs1TI4b6vv8XfV+C97pJlnInc1CUbvf+bwVQ
	 aejpjVy5utyedCRxCjIPFX+GFXix/7N/uFQOoO8ESCYA7Ki8utmfAjgpArCGIzH4nDBMW
	 ZgC7IyMP9FfNxNuwuCKkM1k0Vcw/GmabRco805Ez7qfga/ds+UlqOuOWjtzm33n9tiNZD
	 7yCyuPUPrOURmGhzssY3e7Ulu+vzSk8IOpfgYG8faxg7KLmAjn8WA0tWizoKw1pPpb3i/
	 ofdC4PSLlXJnb5GnLV3rI2ZdJ9PJQN6Bw5PlMEytKBbHM8EYVXv9uaQgwTIKtvSlPTQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793318870;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=jVUIageg/XI3VA6PRbnnsPlVRr/N3qezw2iOOgJuil4=;
	b=mBiVobZAHNlVm2seX4oLPPmQYFXl7NuFzj+dXctwuwcYORP08vaGaFwJmVq3UWFAjKX5
	 C09jOjfge6gNoOzTAJZ8sYSHf+u2EHAAeDh3TZaUbmtJFqMsQ48CS5xYwT9sET8SPJsam
	 YPPjXua3ERdK4Nz9tqc9lSZJnbZaszf1gJKTNEvrXxTnUG23T82lAZtJwVWkY2uinSniv
	 Y/n2wEUBsQ/F4rUwX3KF3skV/9dNdnB+tHS5iIHVVnWGDD3/bU7LrunghsJsrlwO31CIY
	 PO+7v72Kb77wd89zGmBRS5J8GL2BrX6sDDVsSGfNvmfwT3SJziUC7VRs18PRMl9H2GQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BPPcZbB4;
	arc=none smtp.remote-ip=74.125.82.169
Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39D8C606A31A
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 00:07:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 39D8C606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BPPcZbB4
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-369f33df08eso414519eec.0
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 17:07:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793318869; x=1793923669; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=jVUIageg/XI3VA6PRbnnsPlVRr/N3qezw2iOOgJuil4=;
        b=BPPcZbB4Zy7KpXetvwhzI6B0CmamDQam9ZIgVhzQAF4kcQ0uhOYJ3y+2iQq9Nqkbxa
         q654tgHknSUW1x1NtkuHzu1u02u6onXKCej18a9MI29EQZgOouvP5Aa93Glfa4pSEMlm
         7QpL5ATUl9uD74JHOlwpRAgbpqIc5yuimJrMSs1fUHj72mTQ1xnOwRB+aKv+oJD3Ixxm
         DNAjcAuValiGlClfalwsHXiEE/cRiCELDyMQjHLk54OiTdrSc5pMlF6dqPj3lT5PNk/W
         u579jBjfVuWwTse1tMktsJ0x1LXsTDp05oLnWa7biyJesplxYRAX2nANsPTlnfymapsZ
         s9KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793318869; x=1793923669;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jVUIageg/XI3VA6PRbnnsPlVRr/N3qezw2iOOgJuil4=;
        b=wCcA4+pHGfdOG0P+k4O0DCIAPPf5uXfo4M7MeEhXIIYqnTdYQGu80DGWUvEYyaswfj
         cqFR7lYNTP6ABfcq/bclV9TLbp3TTni8tunoYJArPgSmW8kQz0shkdTBWOXw7KQMcuAF
         1wD1GrwTBVJvmLqE5GD3NuuvaMv2FjSZuyFxSEkG/+KIZU/AGjsGUADG96in2Ncrv5FH
         ZXDkszXajgdlSvcDQAAqbdTQchuwV/jC2YRg9MT/Xr80cSBa1rwZcu7wmDpfqeuJQYLQ
         986JQdSEa4T0QRHX27TQH3iKK2pxQjzgN7yyfDPn2/z0QkKDzoX93yVYxNbqmGEGk4F9
         nNBw==
X-Forwarded-Encrypted: i=1; AKwUvBzKpm8h+jgL6nHjxdtGzJHhAYDll87OJ2EKHGxvTUjjluGELdOH76uMp7jG1r1jX0Rl9abMAT/f1VsyLJg=@vger.kernel.org
X-Gm-Message-State: AFq9FYISGqqRMzw+hOhjYb7/Mtz5u0jQWBv6AIDVdHViZL3EZvR1+6vZ
	kowLGndO5Xg0a820Nmi7Ed+i77vhFpQOPxkJ/sq1T2WMc/dTThQJ7FFk
X-Gm-Gg: AYBFou31iRDX7GkD77ntBK2e8lvc6LJPpCH0ovGA/d1Pf4dnPplHlg1LulvyD53dJXa
	drlvRAAPGNLjBNarejBqkiXRuFoqgHYl0+s604wN0IgwOzYfJN2kLLwokmVbgjzLjn9zR3eEhp1
	J/JWdaXLJKjWDozCVyzn8T4XKP0C8wAR/iazg64MEcusvzdp9Z3lCMUcdPOEMuerphfxWJ6VwqD
	vit8RJSNRlp0EjfWINhI20GQxK4jVUaZhXhuRep0m6YZZ9njs9MHO6EHUMNuDqRRwAjJO+szttr
	UDWbEhzJM4AapLCNCqndPL+EbGuTsKZLQNeMUdoKobBCFmoMHTnnyoEN4VlJo+7aueOuKo9IDAQ
	h6UdI/+rBH746QfTqqiHqbWRTIGF86toiAdWRBsdznT+CoS06EdnZOR0zPWBmvYDhW9E7tzBy9Z
	yA2Cu24kfS19vtIeu0NMY63++qjzKzGMGprFz7FevP/kaeywzf+nvLfKfapXbWo3Z0pYS4dCxyf
	r1iLwynmUOAo8zfafOTYKa1k+uC5m0JzAwa9kc++nq1XZAhoHBxWmaym3SJmEqhJvs+OeCG7yA4
	VKoGF9g07pCxmQaukYM3NHPrUjreb7SHRA==
X-Received: by 2002:a05:693c:880d:10b0:34e:9923:e372 with SMTP id 5a478bee46e88-36a4241a810mr1410914eec.29.1793318868940;
        Thu, 29 Oct 2026 17:07:48 -0700 (PDT)
Received: from pve-server.rlab ([49.205.216.49])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a42669128sm2111682eec.3.2026.10.29.17.07.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 17:07:48 -0700 (PDT)
From: "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>
To: linux-mm@kvack.org,
	Andrew Morton <akpm@linux-foundation.org>
Cc: Madhavan Srinivasan <maddy@linux.ibm.com>,
	Venkat Rao Bagalkote <venkat88@linux.ibm.com>,
	linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	David Hildenbrand <david@kernel.org>,
	Muchun Song <muchun.song@linux.dev>,
	Zi Yan <ziy@nvidia.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	"Ritesh Harjani (IBM)" <ritesh.list@gmail.com>,
	Pavithra <pavrampu@linux.ibm.com>
Subject: [PATCHv2] mm/huge_memory: set the mmu_gather page size in zap_huge_pud()
Date: Fri, 30 Oct 2026 05:37:36 +0530
Message-Id: <8b853e5f9f16145859407b28af654b0f79e12642.1793318297.git.ritesh.list@gmail.com>
X-Mailer: git-send-email 2.39.5
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

Unmapping a device-dax mapping with 1G alignment on powerpc radix kernel
built with CONFIG_DEBUG_VM triggers this warning on every munmap:

    WARNING: mm/mmu_gather.c:176 at __tlb_remove_folio_pages_size+0x38/0x230
    NIP [c00000000063d508] __tlb_remove_folio_pages_size+0x38/0x230
    LR [c0000000006fb688] zap_huge_pud+0x1b8/0x2d0
    Call Trace:
     zap_huge_pud+0x170/0x2d0 (unreliable)
     __zap_vma_range+0x1604/0x1e20
     unmap_vmas+0xa0/0x1f0
     unmap_region+0xb0/0x130
     vms_complete_munmap_vmas+0x120/0x310
     do_vmi_align_munmap+0x1ec/0x240
     __vm_munmap+0x148/0x220
     sys_munmap+0x28/0x40

To trigger this - it is enough to mmap() /dev/dax0.0, touch the first
byte so that the whole 1G is mapped by a single PUD and then munmap()
it.

PowerPC needs MMU_GATHER_PAGE_SIZE in which mmu_gather needs to record
the page size for which tlb flush is needed. zap_huge_pmd(),
zap_pte_range(), change_huge_pud() etc all do this already. However,
since commit:
  dbe54153296d ("mm/huge_memory: add vmf_insert_folio_pud()")

a device-dax PUD maps a real folio and zap_huge_pud() now hands it to
tlb_remove_page_size(tlb, page, HPAGE_PUD_SIZE). At that point
tlb->page_size is still whatever the previous user left behind, which is
0 for the fresh gather set up by munmap() and so the check fires.

Fix this in the same way like how other similar paths do.

Fixes: dbe54153296d0 ("mm/huge_memory: add vmf_insert_folio_pud()")
Reported-by: Pavithra <pavrampu@linux.ibm.com>
Signed-off-by: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
---
[v1]->v2:
=========
- Split the 2 part patch series. Patch-1 is now superseded by a different patch
  from Muchun which he already posted [2].
- No difference in this patch from v1.

[v1]: https://lore.kernel.org/all/97f85592bb78a273be8519e6897e7f9b9bd31469.1793070429.git.ritesh.list@gmail.com/
[2]: https://lore.kernel.org/all/20261029063601.1961415-1-songmuchun@bytedance.com/

 mm/huge_memory.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/mm/huge_memory.c b/mm/huge_memory.c
index bd44d58e8684..7e589a2fb02d 100644
--- a/mm/huge_memory.c
+++ b/mm/huge_memory.c
@@ -3040,6 +3040,8 @@ int zap_huge_pud(struct mmu_gather *tlb, struct vm_area_struct *vma,
 	spinlock_t *ptl;
 	pud_t orig_pud;

+	tlb_change_page_size(tlb, HPAGE_PUD_SIZE);
+
 	ptl = __pud_trans_huge_lock(pud, vma);
 	if (!ptl)
 		return 0;
--
2.39.5

