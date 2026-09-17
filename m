Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB3322E738B
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 05:30:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789623029; cv=none; b=EX2P9vNqF7q+/ZhUstGozeq/4dJ4YV0/+w80QPYI8r9+1seSVfjwtLcV6v7DiluACEreIrJvvqyK1TafbVQh4TfUvUlm6OjP+6pLj68vCATVbFlDRoxGaxbX2YfzsSUmoztNtYXUgoB4QFmAMwOzaHp+QEO+N0QD7DpHgW+Ltf4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789623029; c=relaxed/simple;
	bh=nu9CVlYrXHpgLjfI48yaYuzW8VfJM48VdD20onjBsno=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=GQW99xHfLPh6c4TN0va5xs0VhoQa3F5gBefumJZ3bfTnZvsFgpkV/2ul/XO8bcgpVC7wbNFo2ZE/85ymH0LaK3uQnFUUOt4hIqvnUQ7+b2xiu4tQdnGK5Ic+etYduQ9s3UDaJCwsH/JlTlLHutuxzrHEaejpLfN8bSWrycoa8zs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Xl/3/k1r; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Xl/3/k1r"
Received: by mail-pj2-f13.google.com with SMTP id 98e67ed59e1d1-39e03468a5fso389478a91.0
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 22:30:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789623027; x=1790227827; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=G8iXtJFaILHaNQYB7TRtsKAUY5yHxckNGkamGztIiuQ=;
        b=Xl/3/k1rTS2dlblvy8eSmme3m0mekQJKVrf8rOI6c3EBgAMou/d7odx3V3Q5udnm2A
         3Zqdyscdxv68Gm/OisCy/55ofJXMk99tUU+XB5pg4l04aEyiuZ8GnbqZXB97qEHJjOzt
         Zty0ZfpLZi9QPoF8USDd3raPrG97iS722YSiX8ooFNbqyN+s7BgiV0ycRGHIfvGq2n3Z
         O74GPXFK7eewT+sZfT0/NC8uq2GIii0UJrBJJVmsjIYci8XTNkBCtpf5NK4k2vzR4ceS
         zAKs18TkdO33ksY3J+AVwfN+Y5+N3obociagDe5NZxSorMzLF9cVcGatudATeA9oTN9w
         or3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789623027; x=1790227827;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=G8iXtJFaILHaNQYB7TRtsKAUY5yHxckNGkamGztIiuQ=;
        b=I/UNgSUA75xUH5HhDl7hVzKmHlc4y2mnPtSrwFDyxMpU+MBpbBiEr/HGuqcvgz8PGC
         CkY8weoSo+OhdEZS9pM6KfEdsHk+78Tnoq3FOay4tJlRFuKJtMzrA7ylYykQMDBXJ+37
         RhXanbwv+9OZjfEb5zcVdApBufdkqNsIxHWWqRg7PCgcwc+9ZQ9uqFjCNDTs03q3l6Q/
         G+GwpVAzVpKDsW19KYM1Lcf85LuARTJ3lmE2GovUE4+0DVG3Aj2qkWmy1CskzYp8Rehk
         0BqQWJ6XdUyvYE7YMpcoS+sksHppkG1twPhrJJkVgrsvXZRMGbCuPmG5jhUe7aMmMA+D
         IQmQ==
X-Forwarded-Encrypted: i=1; AKwUvBy8ThTiqhNStVdos04BQAxJjNLtG07wAvGipMNF2JHrRJrJ5x42g1JY5mTYw7iRc+PCYJEiFdYmyP26KBs=@vger.kernel.org
X-Gm-Message-State: AFuF++mZJfRbqBQ2Ic0WEajYudSdySg+4eyHRpytQQcXEyOcrk/N7uVW
	xY8dZvOD84qVv/m8BeLuLaJ04MX4Ex7HRDmlPBi97vjQwlhzS87HLtqy
X-Gm-Gg: AYBFou32H/1UtOWKwSiQ+y+vtXZgAc2ZYyP2PvyQ3/JJNQcCLBaD2vQfty8U7dOCtxI
	mwMlhMVjK0ls71t+Fr2GAe9EhsIjtO4WdgURTe40gPR5Gi4FDeJnZ0tvvBN81TCZbO2UgGYMQK0
	4XrrKz2xnkBiZPJKUqqNOvOZFU5BRvplGi/xkA/9am0Wka4FL9E8dcfX61uVrrjchCDq3ARm2yX
	vUm2hLLwtGRotoZ/LAusCAN5NBLRaUMShzFJAay4/AX3Odf6uNEWYljOKv7bSB0JAD7dzse1pqW
	W2pPcoyC4u13LGT8T+bMyxR1BLQxn9Ctfy9R1JmbVks3Yf2ayyihlDiOTp+Vjrb08xUK5fjTzAw
	4o/4zomHiwXn/Cc/GSUVS9eBxMn04UgG/r9Vz0ENLge3CNpYFrlJSBU7k39hhucObkPNUwf8VpB
	2ZUt0tSF/8PDpE3cErGZ/Cjkok1jRtccl5ZsKRY5EH5ApoJ3VEWmHyx1DAH4yJYhEHYbj5tbsBj
	4SOu87cP9nt5QqFTK6pXwCO+tw=
X-Received: by 2002:a17:90b:4e88:b0:398:cb56:e92 with SMTP id 98e67ed59e1d1-39e1e30ba45mr13210240a91.11.1789623025225;
        Wed, 16 Sep 2026 22:30:25 -0700 (PDT)
Received: from mi-OptiPlex-7060.mioffice.cn ([43.224.245.234])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e3abada87sm1955836a91.14.2026.09.16.22.30.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 22:30:24 -0700 (PDT)
From: Wen Jiang <jiangwenxiaomi@gmail.com>
To: akpm@linux-foundation.org,
	catalin.marinas@arm.com,
	linux-mm@kvack.org,
	urezki@gmail.com,
	will@kernel.org
Cc: Xueyuan.chen21@gmail.com,
	ajd@linux.ibm.com,
	anshuman.khandual@arm.com,
	baohua@kernel.org,
	chleroy@kernel.org,
	david@kernel.org,
	dev.jain@arm.com,
	jiangwen6@xiaomi.com,
	leo.yan@arm.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	maddy@linux.ibm.com,
	mpe@ellerman.id.au,
	npiggin@gmail.com,
	rppt@kernel.org,
	ryan.roberts@arm.com,
	Xueyuan Chen <xueyuan.chen21@gmail.com>
Subject: [PATCH v8 06/10] mm/vmalloc: extract vmap_set_ptes() to consolidate PTE mapping logic
Date: Thu, 17 Sep 2026 13:29:29 +0800
Message-Id: <20260917052933.188679-7-jiangwenxiaomi@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260917052933.188679-1-jiangwenxiaomi@gmail.com>
References: <20260917052933.188679-1-jiangwenxiaomi@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Wen Jiang <jiangwen6@xiaomi.com>

Extract the common PTE mapping logic from vmap_pte_range() into a
shared helper vmap_set_ptes(). This handles both CONT_PTE and regular
PTE mappings in a single function, preparing for the next patch which
will extend vmap_pages_pte_range() to also use this helper.

No functional change.

Signed-off-by: Wen Jiang <jiangwen6@xiaomi.com>
Tested-by: Xueyuan Chen <xueyuan.chen21@gmail.com>
Tested-by: Leo Yan <leo.yan@arm.com>
---
 mm/vmalloc.c | 36 +++++++++++++++++++++++++++---------
 1 file changed, 27 insertions(+), 9 deletions(-)

diff --git a/mm/vmalloc.c b/mm/vmalloc.c
index 025b3a848d564..a0508bdb7d36f 100644
--- a/mm/vmalloc.c
+++ b/mm/vmalloc.c
@@ -90,6 +90,29 @@ struct vfree_deferred {
 static DEFINE_PER_CPU(struct vfree_deferred, vfree_deferred);
 
 /*** Page table manipulation functions ***/
+
+/*
+ * Try contiguous mappings at the PTE level for arches which support them, and if
+ * requested by the caller. Fall back to PAGE_SIZE mappings otherwise.
+ *
+ * Return: mapping size.
+ */
+static __always_inline unsigned long vmap_set_ptes(pte_t *ptep,
+		unsigned long addr, unsigned long end, u64 pfn,
+		pgprot_t prot, unsigned int max_page_shift)
+{
+	unsigned long size;
+
+	size = arch_vmap_pte_range_map_size(addr, end, pfn, max_page_shift);
+	if (size != PAGE_SIZE) {
+		pte_set_huge(ptep, addr, PFN_PHYS(pfn), prot, size);
+		return size;
+	}
+
+	set_pte_at(&init_mm, addr, ptep, pfn_pte(pfn, prot));
+	return PAGE_SIZE;
+}
+
 static int vmap_pte_range(pmd_t *pmd, unsigned long addr, unsigned long end,
 			phys_addr_t phys_addr, pgprot_t prot,
 			unsigned int max_page_shift, pgtbl_mod_mask *mask)
@@ -98,6 +121,7 @@ static int vmap_pte_range(pmd_t *pmd, unsigned long addr, unsigned long end,
 	u64 pfn;
 	struct page *page;
 	unsigned long size;
+	unsigned int steps;
 
 	if (WARN_ON_ONCE(!PAGE_ALIGNED(end - addr)))
 		return -EINVAL;
@@ -118,15 +142,9 @@ static int vmap_pte_range(pmd_t *pmd, unsigned long addr, unsigned long end,
 			BUG();
 		}
 
-		size = arch_vmap_pte_range_map_size(addr, end, pfn, max_page_shift);
-		if (size != PAGE_SIZE) {
-			pte_set_huge(pte, addr, PFN_PHYS(pfn), prot, size);
-			pfn += PFN_DOWN(size);
-			continue;
-		}
-		set_pte_at(&init_mm, addr, pte, pfn_pte(pfn, prot));
-		pfn++;
-	} while (pte += PFN_DOWN(size), addr += size, addr != end);
+		size = vmap_set_ptes(pte, addr, end, pfn, prot, max_page_shift);
+		steps = PFN_DOWN(size);
+	} while (pte += steps, pfn += steps, addr += size, addr != end);
 
 	lazy_mmu_mode_disable();
 	*mask |= PGTBL_PTE_MODIFIED;
-- 
2.34.1

