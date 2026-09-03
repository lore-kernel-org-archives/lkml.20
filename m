Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACA144A4414
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 12:22:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788438130; cv=none; b=UFSkx9ZTz/RjwugyjhtsreDqLFQCkRG81AbnsQtYAZnMuvGvQEYWpvDfvyJiVWoRSNjwcvIHneOul9ih/1gC/0NJoD2/r3SXky73haPWC03BgcFiNtuki0zDY2r5LiWJkM3wpjLv8ATInFOBG49go3MliCo+FUDnQ+pNTfy1iXY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788438130; c=relaxed/simple;
	bh=Hr4ffWVPhBSeZxC4Gy1Y+eU1zBxu0o3ECl+FjVnr0+4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mhwH0/35j84R7B6bIb6o0v6fhPAdg1B4g2y+n0ZrhbcnBZwSWtyynTNSzFSfV6nrnP+09nc6BsvL2hyZngjQbXW4YHCC6sOkXqSyU+cOESo3+kAZvH04vA0lZNh0GUsm60KMufdtBdvu6CtLFgtlqizG2T0CL0k8jQvU50xaLr0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=fFO7tnnD; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="fFO7tnnD"
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-84e84a6c4bfso961076b3a.1
        for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 05:22:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1788438124; x=1789042924; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=M9z1xem6qEcuUVJMDQZaw5sCruZ2xCngKTtcTUgfBOA=;
        b=fFO7tnnDxTTCUkjZOG4JvdCV0i/1Zz3lsZuFqgBFxgNldaUN6MLzVcl5zIDpiA3xnN
         VxWl2cMTtWWoD+dHP8V79AJuchoWxjsked/qWQNHoLg8K9MWjoFlBPX3TO3W9fjikA7h
         4DxC02UULyhhor4jil23ePTAXAuMCndbYkatmY9H1vPhlnC3Ctx6z6vLTnaunZZGiRmA
         3mNBeK7JnT8lpyVw/WzRViXqVuZHFimCMZ/56HEDEDfcYASDG1ihOAtcgC1q19t9QotA
         GeZJjWrkbo8UIZqynnfzjYAcgzVDVGTVWNyIFcSDrTo10FE2kHHWfTwaoZNnI7dFI0lr
         iwQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788438124; x=1789042924;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=M9z1xem6qEcuUVJMDQZaw5sCruZ2xCngKTtcTUgfBOA=;
        b=e0IjfLQjC0dnzrK9Ffss6AvnJ/8FUQNvVjqqwNCT+Q42+3/90tZlP+9CGoAvvRhBqo
         m7//FpdQ/qmOSpw+Nio+arFx8VbHAGqhOy02uXfBWrWJ6B52MR6HQ1GfwKmnk8ewPNwW
         Y0lK/ux/I1pDVAjkvv/n/Q1GUORIoyO7x3p0yHbpyqTXX+Vh25dMPtq01lpGfdqkqmrj
         pC84Ra16KhaJE6h0EUjHLeYvXjUF/bpJaRx3iYvjy9uLQT8PJe3XsAHmlyWgiX5CZaLc
         yaV15w095s73Qw/4l16TZDP7XoCPcz2wTUgdF02BFSuDelKwFYq9FM82eQipGyMKZZXO
         IVYQ==
X-Forwarded-Encrypted: i=1; AKwUvBygAxZ/b6drLT0DV1DYi3w4rZjhdNJMYNs4o9hUcy8KL8oINl72Q6aAHjYtXeeoHKG/gc3MV3ASbox+pGE=@vger.kernel.org
X-Gm-Message-State: AFuF++kUEVFhD8zwmHFUyAPcW9c/3CZbjxa602Ci+MAVmDkYDFr1PNLP
	am+oq8IOOS3yXfS/kv/JwyIUxtKrrTE0dUFg/EkaJtYwG6gO4alFAwZjf9f/EP9QFFA=
X-Gm-Gg: AYBFou1Nq8uQEJtHsGPYPLPcfTdE+rKp6DtjUp3rBOd97W05jnt+aPyzUJcmtmoirTZ
	6pIy7p7PrdG4wB6J3SabeRXiSyM9gH4BxiHH8+oHWBizX2GZ2AkIm/y+MsnwtjMfD5khkxKH9z6
	vXDK5fcqncd1bj9e6+Zr+7Wjzk3xl2uk57y0yMsQmX8lCwNwarXGncrr/UHDbCMtkM8cdK/vnDD
	5gRn4/DG0YFB9M0WZD7jT6ToI0dkzkisbAnwDBUlGPEDh+UCeV1C1LZVSDns7af+qveWE4MvsYs
	9rBh4liuwGZE/h4JOHtD7nrie751YNTGugbi+qtmoZPIkh7Ia6be2Ijf/5Zt/pN+xSOL8/RlOds
	XmwNg9VtKg+kV/XMamSb/jz4GVAWVpHpxzbVY31+cBgWET4pJIckYQvzaiRWbVOXvShwTSQQUst
	6X/XYo6+ZTuyj3x25XZv/QicbqZ7wzLzqloD3wWFsxf87NJ/klxGhESRgXSxMI+9MfppkdDrRBI
	nAUMREPNSbRYqhn4rgBTliKog==
X-Received: by 2002:a05:6a00:17aa:b0:84e:c851:a058 with SMTP id d2e1a72fcca58-85ffcb616aamr4808528b3a.10.1788438123307;
        Thu, 03 Sep 2026 05:22:03 -0700 (PDT)
Received: from G6L4RL2QG9.bytedance.net ([61.213.176.13])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-85db24f2076sm2868126b3a.4.2026.09.03.05.21.58
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 03 Sep 2026 05:22:02 -0700 (PDT)
From: Muchun Song <songmuchun@bytedance.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	Dan Williams <djbw@kernel.org>,
	David Hildenbrand <david@kernel.org>
Cc: linux-mm@kvack.org,
	nvdimm@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-fsdevel@vger.kernel.org,
	linux-cxl@vger.kernel.org,
	Vishal Verma <vishal.l.verma@intel.com>,
	Dave Jiang <dave.jiang@intel.com>,
	Alison Schofield <alison.schofield@intel.com>,
	Mike Rapoport <rppt@kernel.org>,
	Oscar Salvador <osalvador@suse.de>,
	Ira Weiny <iweiny@kernel.org>,
	Jan Kara <jack@suse.cz>,
	Matthew Wilcox <willy@infradead.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	Michal Hocko <mhocko@suse.com>,
	Qi Zheng <qi.zheng@linux.dev>,
	Muchun Song <songmuchun@bytedance.com>,
	muchun.song@linux.dev
Subject: [PATCH 4/4] fsdax: materialize pmem vmemmap metadata on faults
Date: Thu,  3 Sep 2026 20:21:27 +0800
Message-ID: <20260903122128.12264-5-songmuchun@bytedance.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260903122128.12264-1-songmuchun@bytedance.com>
References: <20260903122128.12264-1-songmuchun@bytedance.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Pmem FS-DAX registers the device range as ZONE_DEVICE memory, and the
kernel normally allocates and initializes vmemmap storage for every
advertised PFN up front. Sparse backing storage and workloads that only use
the DAX direct-access path may never need writable per-PFN state for most
of that range, but still pay the memory and initialization cost.

Opt pmem FS-DAX into the shared read-only vmemmap mode and materialize
private metadata before inserting a PFN into a userspace mapping. PMD
faults materialize the whole PMD-sized metadata range. PFNs that are never
faulted continue to use the shared metadata.

This shifts private vmemmap allocation from device registration to the
first DAX fault for each metadata page, so the struct page overhead tracks
the faulted DAX working set instead of the full advertised pmem device
size.

Signed-off-by: Muchun Song <songmuchun@bytedance.com>
---
 drivers/nvdimm/pmem.c | 1 +
 fs/dax.c              | 5 +++++
 2 files changed, 6 insertions(+)

diff --git a/drivers/nvdimm/pmem.c b/drivers/nvdimm/pmem.c
index b14f75daeda7..5530b32163d3 100644
--- a/drivers/nvdimm/pmem.c
+++ b/drivers/nvdimm/pmem.c
@@ -543,6 +543,7 @@ static int pmem_attach_disk(struct device *dev,
 		pmem->pgmap.nr_range = 1;
 		pmem->pgmap.type = MEMORY_DEVICE_FS_DAX;
 		pmem->pgmap.ops = &fsdax_pagemap_ops;
+		pmem->pgmap.flags |= PGMAP_VMEMMAP_OPTIMIZATION;
 		addr = devm_memremap_pages(dev, &pmem->pgmap);
 		bb_range = pmem->pgmap.range;
 	} else {
diff --git a/fs/dax.c b/fs/dax.c
index 1fbba0d21c13..89377301d51b 100644
--- a/fs/dax.c
+++ b/fs/dax.c
@@ -13,6 +13,7 @@
 #include <linux/fs.h>
 #include <linux/highmem.h>
 #include <linux/memcontrol.h>
+#include <linux/memremap.h>
 #include <linux/mm.h>
 #include <linux/mutex.h>
 #include <linux/sched.h>
@@ -1877,6 +1878,10 @@ static vm_fault_t dax_fault_iter(struct vm_fault *vmf,
 	if (err)
 		return pmd ? VM_FAULT_FALLBACK : dax_fault_return(err);
 
+	err = vmemmap_materialize_page(pfn_to_page(pfn), pmd ? PMD_ORDER : 0);
+	if (err)
+		return dax_fault_return(err);
+
 	*entry = dax_insert_entry(xas, vmf, iter, *entry, pfn, entry_flags);
 
 	if (write && iomap->flags & IOMAP_F_SHARED) {
-- 
2.54.0

