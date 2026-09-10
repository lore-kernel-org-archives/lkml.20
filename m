Received: from mail-yx2-f8.google.com (mail-yx2-f8.google.com [74.125.224.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3DC754CF50
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 17:16:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789060607; cv=none; b=qxVHIm3IrsyPesM4F0PQ+KEJoqFI8zlG2RBnIwqN19Ux/3w1WLPcFBNRwtdNlD3rnbo1IlC95YZlqs6K8raTnq5JUIfCN77D7WoV0xnoE/hovfNQzZx08mOjzVW/nUptVMAQzfPfs+FKw2ainXopkpUdZM1xEkbJ2VzyyGoUp8U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789060607; c=relaxed/simple;
	bh=A8owNqUmKrddFiv3sxwqZAYgp8IhOnZKxvxLH1qdKhM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=o1p/rf/081pqci9XXeoG5FaX7rL8Cd3bS86ztf5ljCB3PQ/3Pg4JO7L18/zRtd4o4nPA12ye/Ai1SC6/rVD4UrD1DesheRC49mhelXyIYGwxs10DKPgTPJxv1pnUDYr258FKKt0waVOnt6mx/XCDEV9rno0pVmRN1Y9HYzhACj4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qrJ3CWhm; arc=none smtp.client-ip=74.125.224.136
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qrJ3CWhm"
Received: by mail-yx2-f8.google.com with SMTP id 00721157ae682-854f090ff98so38506087b3.0
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 10:16:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789060590; x=1789665390; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=U8F+pCWHvp6Bk2nFVk5sf15ui0cPT96FgZ/ARqD+0QM=;
        b=qrJ3CWhmkn+hm8I336WdOty0svct7OmSILWZLxrHDDy7NUGJOpZloBtMYQOH/b7qIp
         vv2qRQQqROTCQw3XTlo63pdiHS0AEHQ+r2kmfh2oQ0mbOFN4+z14TrulZPg8SbHfbHrV
         /eIYyCXTIys/nPYQNPPrXA3gCZGciItADMyvop4QD4H9bLdyiHoqaQzjyDILQukabRJe
         qPMZsROyEdWWLuqz1PqM7aGXUiEOFVstwWt6ISvnd5bpNrmA117S9S7Fq8+MpJDMYt+G
         LUB6R80h1TEZ8pRG9l86GGObZLK5buzl3ZTfUHVzymtZr2elxh2HICSaeka84rRR78/8
         KwEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789060590; x=1789665390;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=U8F+pCWHvp6Bk2nFVk5sf15ui0cPT96FgZ/ARqD+0QM=;
        b=nm8Eb42BJX2b1qqPfYVuctld77D+YDgsL3y9BUW6P4ZjKP4ezSLqwBFpY8ORsLh16D
         ZaxeDAZnzaWhsMGOmXxjiD8sVCXN0LpVMavumWIhHuIjz1NRqmPpMnYdYp6xloOQJy92
         fL5H4+hbtuQMweGp+EVxdw9daWmgCtuefjkMFQmOKJZZ2L67xHwVmTDrbHAiSbNqXGOu
         DzykMDiqMIKnE/QoYIX6oozUhxFfcTCB/AMKFoQTWerzXyg9Et7Ftp7HoqXeN1fwt7+p
         lprCu6mew+lLnYly3dSL/G39ttAXbAwKNajPgGS1RAyZnPENKZMV1VAZeU88Pme8p6P3
         w7UA==
X-Forwarded-Encrypted: i=1; AKwUvBxLMP3xSSHMxbwHKLZE4iLd3tsqfU0KTxD+klW5tiVB4vdXj1sFyeg2Ie5R5waNI3E+Xg5bh+Zy47qzw5U=@vger.kernel.org
X-Gm-Message-State: AFuF++mmGSXlm91dmJa0PdFCTzTR7nMTV+Pi2HraeKrCxmZdh4HxYvqG
	bMsjp4gbkfGojertKh36O/b7hcDMhlZ2GWBOHH783JwW1Y3K5q4ZEUg=
X-Gm-Gg: AYBFou0L9kXcGjjj/BgPvnBGvy713Vd/S1dNmad0GPiCiyF1Wjtq4EixGWWKQAFOg6M
	DzjG+ezBn5XLniY+rr7eylf1y8yIzMf3GEBVjSjXLs0W7lAUFKa5dWHUf+tvlQep1kfaOK3FNOo
	syLx2ZeFl0yTcnqz2NPN/bd0vQCBsT2FTT2KiMaTPvQfuwWgG0ciszMjN8Q5kPhfJRDMwZVI5La
	kZDzsAqfwXezdMLP67iBLrV7TCFBCj/nSvYsYppJTDp9wPMUPCU+b4oOiw6R3e51/9lndwjBdPS
	IhZPK/fyv4Lu34GR/oDhzNRZbKCF/jAZ3L00YbaKBHR5cZYtB2TQxBh0ZuwhJeoQPTAv+XC57CA
	ihiWYnHbJ3wlBwu9VF0VZb7bIXCGlmnwVko/+rI01nVDulNZXkO3P2O0rUvNnU4raKU46AJG0JD
	5NdQK3BUH27YO24zBzt6XxpHTHzaes/BTu0cEKVvnuw9/E46P1CqQTC94R2Dnum1EXpUBBaYCo3
	9LchA3ZKbNpOc10wWJGC84BEA7MPpKG5UvLuFy23m8PviB+RHMhATTgWiBd
X-Received: by 2002:a05:690c:d83:b0:865:838f:485b with SMTP id 00721157ae682-884ad14f632mr2358197b3.4.1789060590335;
        Thu, 10 Sep 2026 10:16:30 -0700 (PDT)
Received: from localhost (23-116-43-216.lightspeed.sntcca.sbcglobal.net. [23.116.43.216])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-884890160bbsm2241007b3.42.2026.09.10.10.16.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 10:16:29 -0700 (PDT)
From: Ravi Jonnalagadda <ravis.opensrc@gmail.com>
To: sj@kernel.org,
	akinobu.mita@gmail.com,
	damon@lists.linux.dev,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org
Cc: akpm@linux-foundation.org,
	corbet@lwn.net,
	bijan311@gmail.com,
	ajayjoshi@micron.com,
	honggyu.kim@sk.com,
	yunjeong.mun@sk.com,
	ravis.opensrc@gmail.com,
	rientjes@google.com,
	weixugc@google.com,
	jic23@kernel.org,
	gourry@gourry.net
Subject: [RFC PATCH v2 1/9] mm/damon/vaddr: support page fault access check primitive
Date: Thu, 10 Sep 2026 10:16:15 -0700
Message-ID: <20260910171623.6638-2-ravis.opensrc@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260910171623.6638-1-ravis.opensrc@gmail.com>
References: <20260910171623.6638-1-ravis.opensrc@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The page-fault sampling primitive was implemented for the physical
address space only, so a virtual address space context had no way to
enable it.

Implement it for the virtual address space.  The prep installs the marker
whose fault reports the access on the sampling address of each region,
mirroring the physical address space primitive, and prepare_access_checks()
now dispatches on the enabled primitive as the physical address space one
does.

The target mm and the vma of the sampling address are both available
here, so the marker is installed on the mapping directly.  The physical
address space primitive has only a physical address and reaches its
mappings through a reverse mapping walk.

Signed-off-by: Ravi Jonnalagadda <ravis.opensrc@gmail.com>
---
 mm/damon/vaddr.c | 65 +++++++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 64 insertions(+), 1 deletion(-)

diff --git a/mm/damon/vaddr.c b/mm/damon/vaddr.c
index d5dde97b3cd0d..1f2d923e569d6 100644
--- a/mm/damon/vaddr.c
+++ b/mm/damon/vaddr.c
@@ -13,6 +13,7 @@
 #include <linux/pagemap.h>
 #include <linux/pagewalk.h>
 #include <linux/sched/mm.h>
+#include <asm/tlb.h>
 
 #include "../internal.h"
 #include "ops-common.h"
@@ -329,7 +330,8 @@ static void __damon_va_prepare_access_check(struct mm_struct *mm,
 	damon_va_mkold(mm, r->sampling_addr);
 }
 
-static void damon_va_prepare_access_checks(struct damon_ctx *ctx)
+/* Use page table accessed bits */
+static void damon_va_prepare_access_checks_abit(struct damon_ctx *ctx)
 {
 	struct damon_target *t;
 	struct mm_struct *mm;
@@ -345,6 +347,67 @@ static void damon_va_prepare_access_checks(struct damon_ctx *ctx)
 	}
 }
 
+/*
+ * Install the page table marker whose fault reports the access.  The target
+ * mm and the vma of the address are available here, so the marker is set on
+ * the mapping directly, without a reverse mapping walk.
+ */
+static void damon_va_change_protection(struct mm_struct *mm,
+		unsigned long addr)
+{
+	struct vm_area_struct *vma;
+	struct mmu_gather tlb;
+
+	/*
+	 * The sampling address is a random offset within the region, so round
+	 * it down to the page it falls in.  change_protection() walks whole
+	 * page table entries and expects a page aligned range.
+	 */
+	addr = ALIGN_DOWN(addr, PAGE_SIZE);
+
+	mmap_read_lock(mm);
+
+	vma = vma_lookup(mm, addr);
+	if (!vma || !vma_is_accessible(vma) || (vma->vm_flags & VM_PFNMAP))
+		goto unlock;
+
+	tlb_gather_mmu(&tlb, mm);
+	/* todo: batch or remove tlb flushing */
+	change_protection(&tlb, vma, addr, addr + PAGE_SIZE, MM_CP_DAMON);
+	tlb_finish_mmu(&tlb);
+
+unlock:
+	mmap_read_unlock(mm);
+}
+
+/* Use page faults */
+static void damon_va_prepare_access_checks_faults(struct damon_ctx *ctx)
+{
+	struct damon_target *t;
+	struct mm_struct *mm;
+	struct damon_region *r;
+
+	damon_for_each_target(t, ctx) {
+		mm = damon_get_mm(t);
+		if (!mm)
+			continue;
+		damon_for_each_region(r, t) {
+			r->sampling_addr = damon_rand(ctx, r->ar.start,
+					r->ar.end);
+			damon_va_change_protection(mm, r->sampling_addr);
+		}
+		mmput(mm);
+	}
+}
+
+static void damon_va_prepare_access_checks(struct damon_ctx *ctx)
+{
+	if (ctx->sample_control.primitives_enabled.page_table)
+		damon_va_prepare_access_checks_abit(ctx);
+	if (ctx->sample_control.primitives_enabled.page_fault)
+		damon_va_prepare_access_checks_faults(ctx);
+}
+
 struct damon_young_walk_private {
 	bool young;
 };
-- 
2.43.0

