Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794655581;
	b=tvX9XHEfWAOZgCN3oNnMzRTzx+H3Eh7y2VoKp4o89nZZRSNPT6aSn174IvQxqKk7voRd
	 gtYqtlexQVjkZA7WxqMMgFQa9CANqSCO3gkRPSgrd+MxGiX8gOlWkhgERTb9JEJhPvs4W
	 DsA9+basBPutw7tX4wsjtIlRXx1FJ21Eyp/mgGjF4Oc98Wk6Lo0RnyZeogauF+YbA+BI4
	 EAi7h8naxl1noJuTqQmiEeNx/XT/Uu47MHH795i/AGKrhS0XNpVZuAfbVej+zTM96oNkK
	 EXoUHDsl5usRyx7nvo9Hc8eO6qvTb35SLAbj8V95JG+GfvuMEhsJ4MEFDMJOQRsBMPA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794655581;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=tmdYvPt7kTC8oms8BNF2txsi8vvN5s8/xh5Ms39wPok=;
	b=QHBsZFZvBMPrgktztpjODMHyVxhk0MzfO1fHdc8ts4xcjHLy40mjAzZvcZ+OtrfcvNoe
	 fKXDw4SQE25k0tJPA3BvuVMIrXFUbo2g5wK6H82W/B+1L1rJjaLQ7dO62eFUeK8bFKBG3
	 +AjJnrq7w2icdDoa2eoHfyHlV030ldJRne5GWAk06t1/ZTtGxW+nv7XHpmBj0j8owBkFP
	 XLX5h4/EEceYbNJzndWLZgkb5rHt/C5jjmj0qMMKRroHZREYay+RGpHvK8lCB3LEooHy8
	 2MkmuqYij+SBeygXyEv6XzEph+vBC4DF8qHCuTkMFJD/KBvVABqKq9c/Z0hj7IBgLzA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bytedance.com;
	spf=pass smtp.mailfrom=bytedance.com;
	dkim=pass header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=j5PF2d+t;
	arc=none smtp.remote-ip=74.125.82.182
Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C2E2606A323
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 11:26:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8C2E2606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=j5PF2d+t
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-3720addb068so2985094eec.1
        for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 03:26:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1794655581; x=1795260381; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tmdYvPt7kTC8oms8BNF2txsi8vvN5s8/xh5Ms39wPok=;
        b=j5PF2d+tiObrXoiqmds8cCaHxVxgQc7yIm0XnZIXWqe/YdfdyCdbXCm+p2dzr8nDBR
         FwcLXNauooXs/aySU3Qlhe4yzrq6goLUUyG2L/P58irz2cFqsIyNoHb8Cjq+f/DdbtlP
         bvGxuWHuLzqKGNa4dFfN9aKKHsnXwp4iAixdfYsfiZOcdS8UkC4mxmwWRUYOWa1Fm46w
         K7r5ZLd+RxWUgfo+roLkXXKymXb63EdHIeMKJR4vIkp58vmkzfUhJuSDCU/c9/S5CuN3
         ZA2RvcMq4f0W/K/jd8Dygvn57oJijCvD3gaE5I60KnXPJB3rmlp8sLWanjFwPzDOZ0o5
         gdzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794655581; x=1795260381;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=tmdYvPt7kTC8oms8BNF2txsi8vvN5s8/xh5Ms39wPok=;
        b=RC5P5II1Mogg/PdFwKnOfF9hw5YQHrr7ldwRDrmtPbDqUWbomGYYZpunyO32b4Ce+i
         I3XUyQBvdq5/IYpOJZ2+As6LGVK0s4HTMiVieJnb5h1sOajIcHoVvhCAqDZLGH2FDWW+
         JBn5Hlr5hZ9Co5JRlT5CVX3IkEylQUOq2qp4Q/JeUcdS7gdwLrUfRLJ5neOfwHOmtrVj
         fERJqA0jPw5umdi4kxniAPJqxKMx2Gng1vZoVyga5In5t9jJFmMoS5YTMOxywBNh+9AU
         jW4ywI3W2zcstsmaFLfLUEaJMzcZ0TEclh8wz7i7LooXmlhkU+wH5alhgoX0M4n4mH4B
         i4pQ==
X-Forwarded-Encrypted: i=1; AL+hErGnDQurAA3YGRa2FVbn3HfANYkutvl72Nlc9OZsAlxEzzjkukM2qssajAk5vIVh4HSzHATV3QUP+ai7tuo=@vger.kernel.org
X-Gm-Message-State: APuU4Z9/9LWdXuAkhNb5b2jKcVI8TZ73MIvsgNaw6XtSZDoP8DZp1qQh
	XMrBAazZGk5URaESV0mD1m+R9ADLNLMd0nCcMNDfW3Ci6e0zcGNFsIdZrRDjg69oCNg=
X-Gm-Gg: AYBFou2vMAvXyDgDd4LfBqZ6LtN+KWQAWbEgfKmCH/QwxmeNm2Ye8vt7ZibAyItQ2JM
	ZDSZ2cFkQnsDhju1i1om7zvoQ/Q9ASSkany8Bx5jw1Jl9T2FbN6DaluMhDDiupLO9T4a6LMNIJF
	JB7oTqsA08DcX/fLNKOtGQHMCNdxC+YJPAUQZGrehvRNX2er/B8rFOaLfjKT3iXM012mwkeWmLT
	qbXwUufEPWMKH6YHI6Q2/Z/EcdUTr6ewYA5GmwJc3VKEmyHlHhvqV/vjNmxkuAtS+oD4OiPOVUj
	QIusKmlg1bx1BQSW6mzIu+Z9HwLKI13kM2JAdpA6iVgo5EgNrpELZ6E/A7aWo1EfTrb9nbD9nVG
	D74uVY2bcOMbr18C1/o4sJ3gZ3UGK9mzdwv1dOGH73zXAL15lU4EC6C/FWmsdnIeJ9PtyN7Fgh2
	lZ/u8DYvC8j06wxBZvZ9OnvjoytyXEc6eRgG/pUlicsGgNaq8EvnGeH1MXQA9KiSjUkXr8xt9z9
	hEU4ZQh9YIYewZcQ5+9kIuCXIcjUaUAMpFC/LVldeyshL7XJBbzRMNIh3DDp3BoJlVmsaWwdWq6
	50CuHTkkA/xuQ4up1get9amCbheo8RwPnhPfy5tONf/55iMRKBmnY5kua2XD1twdehuvEUUJCTT
	ybNJcqA==
X-Received: by 2002:a05:693c:881a:10b0:35c:ba31:6fef with SMTP id 5a478bee46e88-37967cdd3c2mr4870211eec.36.1794655580476;
        Sat, 14 Nov 2026 03:26:20 -0800 (PST)
Received: from G6L4RL2QG9 ([2409:8a00:1832:6900:9d36:3b30:f4a3:7b5f])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-379553316fdsm16190627eec.5.2026.11.14.03.26.10
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 14 Nov 2026 03:26:19 -0800 (PST)
From: Muchun Song <songmuchun@bytedance.com>
To: Oscar Salvador <osalvador@suse.de>,
	Andrew Morton <akpm@linux-foundation.org>,
	Miaohe Lin <linmiaohe@huawei.com>
Cc: Muchun Song <muchun.song@linux.dev>,
	David Hildenbrand <david@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Naoya Horiguchi <nao.horiguchi@gmail.com>,
	Joao Martins <joao.m.martins@oracle.com>,
	Lorenzo Stoakes <ljs@kernel.org>,
	Sashiko <sashiko-bot@kernel.org>,
	Jiaqi Yan <jiaqiyan@google.com>,
	"Jose A . Perez de Azpillaga" <azpijr@gmail.com>,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Muchun Song <songmuchun@bytedance.com>
Subject: [PATCH v3 3/3] mm/hugetlb_vmemmap: fix deadlock during PMD split
Date: Sat, 14 Nov 2026 19:25:23 +0800
Message-ID: <20261114112523.75208-4-songmuchun@bytedance.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261114112523.75208-1-songmuchun@bytedance.com>
References: <20261114112523.75208-1-songmuchun@bytedance.com>
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

vmemmap_remap_range() currently walks vmemmap page tables under
init_mm.mmap_lock. If the walk reaches a leaf PMD, vmemmap_split_pmd()
allocates a PTE table with GFP_KERNEL and can enter direct reclaim:

hugetlb_vmemmap_optimize_folio()
  vmemmap_remap_range()
    mmap_read_lock(&init_mm)  <-- outer read lock
    ...
      vmemmap_split_pmd()
        pte_alloc_one_kernel(&init_mm)  /* GFP_KERNEL */
          <direct reclaim>
            ttm_pool_shrinker_scan()
              ...
                change_page_attr_set_clr()
                  mmap_read_lock(&init_mm)  <-- self-deadlock

Since commit d5d8b8662e6e ("x86/mm/pat: Acquire init_mm read lock on
attribute changes to avoid UAF"), reclaim through TTM can enter CPA,
which also takes init_mm.mmap_lock. If a writer is pending, the nested
read blocks behind it while the outer read cannot be released, causing a
self-deadlock.

HVO walks vmemmap ranges whose intermediate page tables remain present.
vmemmap_split_pmd() revalidates the PMD under init_mm.page_table_lock
before installing the PTE table. Use the lockless page-table walker so the
allocation no longer runs under init_mm.mmap_lock.

Fixes: d5d8b8662e6e ("x86/mm/pat: Acquire init_mm read lock on attribute changes to avoid UAF")
Cc: stable@vger.kernel.org
Signed-off-by: Muchun Song <songmuchun@bytedance.com>
Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://lore.kernel.org/sashiko-outbox-206969@kernel.org/
Reviewed-by: Jose A. Perez de Azpillaga <azpijr@gmail.com>
---
v3:
- Collect Reviewed-by from Jose A. Perez de Azpillaga
---
 mm/hugetlb_vmemmap.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/mm/hugetlb_vmemmap.c b/mm/hugetlb_vmemmap.c
index 6fba3184356c..5852b0a1c479 100644
--- a/mm/hugetlb_vmemmap.c
+++ b/mm/hugetlb_vmemmap.c
@@ -161,10 +161,8 @@ static int vmemmap_remap_range(unsigned long start, unsigned long end,
 
 	VM_BUG_ON(!PAGE_ALIGNED(start | end));
 
-	mmap_read_lock(&init_mm);
-	ret = walk_kernel_page_table_range(start, end, &vmemmap_remap_ops,
-				    NULL, walk);
-	mmap_read_unlock(&init_mm);
+	ret = walk_kernel_page_table_range_lockless(start, end, &vmemmap_remap_ops,
+						    NULL, walk);
 	if (ret)
 		return ret;
 
-- 
2.54.0

