Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794018552;
	b=CRTqyI4LJk0L55l7MWyU6+n4OliVrEuVSb6YxrJnLeIwOXyAJ1JfY+gtQDv/QA9cUOFK
	 MLUN8AuO5ObWL4w2iEgFvaQXgnrWK86mQr4fLG630YnmmSXV8kU5Bes8G640hryVEWDkL
	 W7ZO61nrwUH5o+bBoqW8a3+VOBkV8O5Q34VTIF5YxtAF1l6dT9rM7VrGiwqFBfJGZNyLV
	 kjLqRc6+2asVwUvhBtOXrzLf7hWZ1vGoJTKygkPK3MHGwBP6DgBW2mxWNJM3tO/PwxqDT
	 5twCBc97s7dCuG/RaOEdUINqzqZUqN7WUeMAbSVwT9rKXsDTON0cL5BgC/bx2TmFn+Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794018552;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=7sMnTr3y994wfcbimt+l9yBgD/ZKDtjQNzqbWZRRBzE=;
	b=q6WGpSN8v8D+O25lmoF1zh+wu3KR0tOFyurzwOnTPOWfQQnofYp2AU726DpamsJ1V9Ec
	 rYgWg5yrHf0JnaOO5mJ7pK8WMV9Be+SNSMODeJyiQpIK6WOpk/ShRwWzTGGg4N1BwcOYk
	 T2JGdN3EUqeUs7qZrqG+B1ZjcJDAB+Xb9KDwmg5o44wWIF1ToMnR1GQbV7RhShIB8Ojo+
	 2CGZtdcwojRHBLtrcdt2DGB7scKEgA9Ws+Am+ama3e3bnAFcjj80UNDvRmc9cT2B+TPTf
	 tS+CjJ1JRJXqiKnj37C4o9FTKfKwUBs5mB3ORKnRXA9CuTlAP2GIZHtfOgJNfKzh8zA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bytedance.com;
	spf=pass smtp.mailfrom=bytedance.com;
	dkim=pass header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=DlKA0eRn;
	arc=none smtp.remote-ip=74.125.82.169
Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92442606A32D
	for <linux-kernel@vger.kernel.org>; Sat,  7 Nov 2026 02:29:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 92442606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=DlKA0eRn
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-36eb1cb7aabso1898473eec.0
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 18:29:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1794018550; x=1794623350; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=7sMnTr3y994wfcbimt+l9yBgD/ZKDtjQNzqbWZRRBzE=;
        b=DlKA0eRnRK5NDtVFOtMol4Er9h/u5VBXLx2kMdBwQXV6NwTU8SGmCz+JIqaN1St3jT
         rhwHRz2HZGB3VkVnZmBqp6t9+UwgnyEQxvDoHoCOfUismMHUoLpIkXjOGCcVeSwBa/Ei
         DT/tamP+w6cxDN3NacE+tid2RXdgEg8dsbGFTnaUa1kmIpUAcDPbH8bVK5+PDBNe4eEY
         bjRE3kBjBqSjWOGafOLTAJt1b/yfdW5xQ7Jn1fDsRbygcgki2YE0Nfzx2zRyl7uZDnuA
         EAXBLRy5QsFLA6S9LjDuADNj90tKUILhTQQ4i1QiFnHeAgpVptzObxMB1heJURCRhJ41
         IV+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794018550; x=1794623350;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7sMnTr3y994wfcbimt+l9yBgD/ZKDtjQNzqbWZRRBzE=;
        b=MtkS/QHYPGkP/YBYKjTKr69EccPa7MIetMzQcpn07H8h0Eo9ugmrGTtIdCgI+QoMop
         +mIaeIwFZoarknq10+rJz3U9qsbJW8SsO04P9qTEOiEvG4+WoIz7T7+sS37cyUfygzeE
         vdE+45/UaUfBTnMiZzzjmHJii7teuuV7qUwUkIwbkomPOIbdDB4Bs8KnCreIJw/0VSzs
         el/kvlJObg6cznhCuWtaCvAKjzwWMsSIoxuOmEJ+I4H6/OgNbJNZ01avdZcTDu6UcZ8W
         nddz8wh/fXMMrQekpoWyjLpDq6dKPjbHd1chia7MU9JJ5roqPgOpaKpA4AFsE/uOtm6I
         Elbg==
X-Forwarded-Encrypted: i=1; AL+hErG0CmFExpgIEsvlpsxqkLAtcyyr23Od5gD6aQ7CxTl5CAtIi7aye30Ht76AkVk/yGrKPLl8+s9Elj8DnCk=@vger.kernel.org
X-Gm-Message-State: APuU4Z8QBDBxHa5FozHn1MMBVrbS2swG1cnlDnbY5En+9NI2DqnNXUOU
	MTcnny2M2fjfdLPcAImaLRm5ebtJ0DQHi1r8iMYDg6McFpwOlYDS8y4y3Yle6SsQ3zk=
X-Gm-Gg: AYBFou3BCEFoxEdkKHYnkWNtILzIFS3TeKE9Fk4bRFO/WaNBmBLxP7kBQeFnPDSLRJ7
	JewybXiXpXKjaF7YJHvWoUgULNjszTbGsHSu8H1zroX7c8jqu4rHjEgzjX6z5gIvLXdisf/chbA
	EJDsnCk2Y5wTektdYQOYI7Llg1QVWLmyz9Jp862BDFvmQ7NdigAyLhdFGUbFyYVYXX+mCU2onOk
	Ar6tinLuz0SJ8uF1EDFePkurXb0S2un12VMugQNHefhdh4KAkaF4G2gyj3aESEnGzlkpKIb3lHC
	ERkUZjsB+tglMsF4EvKXVR2lfBVTs87IbVmN5O3f3tQXYnQPI+zMcGu1CiGPzwMAFN1Xik35TGp
	s6Veh/JA9haBOBarvnPwLzBmVork66nMIhGXcI5GrR/QNoItkxCaE/P1wyLsL3QpaB0GI62/ZZg
	UAgLua7D5d8b1e7ekBxom9rrnwjcXCXnufKTooPlM42yTSdT/vRBWz241M9UBTDS33nAnGtFrEr
	XhdZe/9e7xy3oUM+mdFbuiHshj+Ear12oBfZjdOjqefuBdrtVYLzQ4qc9go0iKTcTX7ZXkLV4bV
	8PLBjDFffy3dhxziSNi3itJaJCX5RjM1z4aIcXkLiUs1wJBPhBnEJrkkUEHm
X-Received: by 2002:a05:693c:88cd:20b0:370:1333:5e84 with SMTP id 5a478bee46e88-37013335ee3mr3852383eec.11.1794018550307;
        Fri, 06 Nov 2026 18:29:10 -0800 (PST)
Received: from G6L4RL2QG9 ([2409:8a00:1832:6900:c8de:13da:804b:a0fa])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36faa4b8aacsm10457077eec.23.2026.11.06.18.29.05
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 06 Nov 2026 18:29:09 -0800 (PST)
From: Muchun Song <songmuchun@bytedance.com>
To: Oscar Salvador <osalvador@suse.de>,
	Andrew Morton <akpm@linux-foundation.org>,
	Mike Rapoport <rppt@kernel.org>
Cc: Qi Zheng <qi.zheng@linux.dev>,
	Lance Yang <lance.yang@linux.dev>,
	James Houghton <jthoughton@google.com>,
	David Hildenbrand <david@kernel.org>,
	Muchun Song <muchun.song@linux.dev>,
	Yili Zhang <zhangyili01@baidu.com>,
	Kiryl Shutsemau <kas@kernel.org>,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	Muchun Song <songmuchun@bytedance.com>
Subject: [PATCH v4 00/13] mm: Decouple folio-based vmemmap optimization from HugeTLB
Date: Sat,  7 Nov 2026 10:27:43 +0800
Message-ID: <20261107022756.77731-1-songmuchun@bytedance.com>
X-Mailer: git-send-email 2.54.0
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

Hi,

Section-based vmemmap optimization is implemented in sparse-vmemmap.c,
while folio-based optimization currently lives in hugetlb_vmemmap.c.
The latter is tightly coupled to HugeTLB-specific state even though the
underlying page-table remapping operates on one folio at a time.

To make these interfaces easier to maintain, the folio-based remapping
mechanics first need a boundary that is independent of HugeTLB-specific
state and raw address ranges. This will allow the mechanics to be moved
into a common vmemmap optimization layer alongside the section-based
interface.

This series establishes that boundary through three folio-oriented
operations, each with a distinct role:

  - vmemmap_optimize_folio() optimizes the vmemmap backing of a folio;
  - vmemmap_restore_folio() restores the vmemmap backing of a folio; and
  - vmemmap_pteify_folio() converts the vmemmap backing of a folio to
    PTE mappings.

Together, these operations encapsulate the address-range calculation and
remapping mechanics for a folio. HugeTLB wrappers retain policy decisions
such as eligibility, optimized state, batching and TLB flush handling.

Patch 1 is a standalone prerequisite fix for best-effort HVO head-page
allocation. Patches 2-9 generalize the underlying vmemmap remapping
infrastructure by removing HugeTLB-specific assumptions and simplifying
remap control and resource handling. Patches 10-13 then establish
folio-oriented operations for optimization, restoration and PTE
conversion.

The implementation remains in hugetlb_vmemmap.c for now. A follow-up can
move the folio-based operations into the common vmemmap optimization layer
once the interface boundary is in place.

v4:
- Rebase onto mm/mm-new at f735a2c21aa9
- Split the HVO head-page allocation fix into a standalone prerequisite
  and retain Yili Zhang as its author
- Add __GFP_NOWARN and pass caller-selected GFP masks through the
  generalized allocator and folio-oriented helpers
- Propagate alloc_vmemmap_page_list() errors directly (suggested by Oscar
  Salvador)
- Remove the redundant order check from vmemmap_pteify_folio() (suggested
  by Oscar Salvador)
- Collect Reviewed-by tags from Oscar Salvador and Mike Rapoport
- Collect Tested-by from Andrew Morton

v3: https://lore.kernel.org/20261104023510.260766-1-songmuchun@bytedance.com/
- Rebase onto mm/mm-new at 74d73ffcffe0
- Use two tabs for continued function parameters in modified declarations
  (suggested by Mike Rapoport)
- Rework vmemmap page allocation failure cleanup to free temporary pages
  directly while keeping accounting batched (suggested by Mike Rapoport)
- Collect Reviewed-by tags from Mike Rapoport

v2: https://lore.kernel.org/20261102032525.3597743-1-songmuchun@bytedance.com/
- Rebase onto mm/mm-new at d42dfde37af7
- Rename the unified TLB flag to VMEMMAP_DEFER_TLB_FLUSH and clarify that
  it defers only safely batchable flushes (suggested by Qi Zheng)
- Update the vmemmap page-list documentation to describe its input/output
  contract (suggested by Lance Yang and Qi Zheng)
- Use page_address() instead of page_to_virt() when copying a vmemmap
  replacement page
- Collect Reviewed-by tags from Lance Yang and Qi Zheng

v1: https://lore.kernel.org/20261020115306.813483-1-songmuchun@bytedance.com/

Muchun Song (12):
  mm: hugetlb_vmemmap: remove HugeTLB-specific vmemmap optimization
    macros
  mm: hugetlb_vmemmap: unify VMEMMAP_{SPLIT,REMAP}_NO_TLB_FLUSH
  mm: hugetlb_vmemmap: simplify vmemmap head page handling
  mm: hugetlb_vmemmap: generalize vmemmap page allocation
  mm: hugetlb_vmemmap: unify writable vmemmap page preparation
  mm: hugetlb_vmemmap: rename vmemmap_remap_pte() to
    vmemmap_optimize_pte()
  mm: hugetlb_vmemmap: simplify shared tail page handling
  mm: hugetlb_vmemmap: move alloc_vmemmap_page_list() next to its free
    helper
  mm: hugetlb_vmemmap: make vmemmap optimization folio-oriented
  mm: hugetlb_vmemmap: make vmemmap restoration folio-oriented
  mm: hugetlb_vmemmap: unify vmemmap range restoration
  mm: hugetlb_vmemmap: make vmemmap PTE conversion folio-oriented

Yili Zhang (1):
  mm: hugetlb_vmemmap: fix OOM during head page allocation

 include/linux/vmemmap-optimization.h |  10 +-
 mm/hugetlb.c                         |   4 +-
 mm/hugetlb_vmemmap.c                 | 379 ++++++++++++---------------
 mm/hugetlb_vmemmap.h                 |  10 +-
 mm/mm_init.c                         |   6 +-
 mm/sparse-vmemmap.c                  |   7 +-
 6 files changed, 186 insertions(+), 230 deletions(-)


base-commit: f735a2c21aa94b7b86a93d36f3b17eecc6d49aba
-- 
2.54.0

