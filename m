Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com [209.85.128.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DE51483837
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 11:01:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789988467; cv=none; b=b2eXRar1sJaYaQ9fMCN13V4Eje6tA0/oVnFYEV/7vJRzPcNze2T9cBU6Eia3yA676Fjb6RX9iZV3R90Ozf4kVkQeHMngnOL+NSMA+Xr1xb+yuaLH002DZ5kgpU+kh7taOxBnFZyX83CTr7tCVioOaTAakcE82ItwSbsVjnLrwu4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789988467; c=relaxed/simple;
	bh=T1lTuSns2JnhV92+IGU44xR9WvLQO0g0vxZhyWYcjGM=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=dTUGEWIdsRXbUXW4JQxoGS0Fj6HkgZi7xZ9OVc8OO2+fi2jU76CNJYcLhmx+V/wbOenwfcUeB7kaX3lSsf7po7zrRLOWxSKmn3/QGEEGWHqZHRx51SrlXMa8Crz6LhxL+hzUZ+H1DdlfbbUJAIgDu/zQEM4EMaVPkeS+ntGfT1Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--vdonnefort.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=dJjE6jgz; arc=none smtp.client-ip=209.85.128.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--vdonnefort.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="dJjE6jgz"
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-490a767b782so22849145e9.2
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 04:01:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789988461; x=1790593261; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PVYg8Lj489hznrzIM+7T33EpvHOqUo3+jajnUbYBZtQ=;
        b=dJjE6jgzqnd5fPoiiqzlhjdQ7VXwvxynHquySkUG0sCGiw3AXmrl0qbMv3QqcC/c/L
         Jq3N6XcoOTjk8JCLQTjHgw5W6IzhOKbtOTBsd1XXvsffp2YXz22noWJqhYw5jXqj0QNA
         plS/0i1oKW1FqGZgAr8vbnwXyIEME15J59OHexYXFCXuRUwVY3klcxcLF6J0q0fr59Yg
         59+SrGZz8UCg5YLjTWl2GYgulJvzEq7XXekj/5n2UzWL6nIf0dq8PXE7nI1cS/TMBnv+
         K3sxTBXTE/aKyMxtJJuw4phC0ErGys0pUIx2BXusgTdo4jJFtSH4n4nA9WWjyq0kMkg5
         97uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789988461; x=1790593261;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PVYg8Lj489hznrzIM+7T33EpvHOqUo3+jajnUbYBZtQ=;
        b=zzSyssGV917OHGTaVcPgxFk0pLwcPa/1ZW3UgJaQ3ff/RlSqMgzYGMWwiVnvVG26Q3
         hNiwftEj6MIyF0dHrOBvIzI2f8tYcRjftabZR6Y3g3o6jxPIHkRXer2knQsBVD7TYOE3
         ac71E1G4qaW/CLbDvkktJhPTPavB8EcQJmQc+gO8vGKqYzsQSFK65aUWKxjcwyHov9Zv
         N6aVLkCj/QI6aA6ZaPvsirVSjv/PgnPKIN0YypZimZwOC2ZgmtGCI9Kq1du3cQjzvyf3
         4LETb1BGXNkGJKFLwJ2kOP/VhzXor5ucfpG8+KKZNc0UgwlvePXXxP721szj7r0KhAG3
         CM2A==
X-Forwarded-Encrypted: i=1; AKwUvBxI/kPks5i1SXw9bC9anL4A57slu5E3nWsjK5sG08R93eeUHighEsMnFjIqEWXUgw2KV2ObWRV41J+e8Fs=@vger.kernel.org
X-Gm-Message-State: AFuF++lyQbuacqCIsyTQNlibI4OMX0JHDim2Zj1+jglMHZ10pZhxMofI
	4s3vdHhzqRwG0xD2+j7BQrFkM1+jX5dngKq9f8xti1WtnmVnHOvRdLHJrNMPxrBOmJnGwUdNHbl
	V34Ytt6TID+UIIfRmR7QMsw==
X-Received: from wmbd4.prod.google.com ([2002:a05:600c:58c4:b0:49e:81b9:5272])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:6217:b0:49e:8418:389d with SMTP id 5b1f17b1804b1-49fc571423dmr133093905e9.9.1789988461055;
 Mon, 21 Sep 2026 04:01:01 -0700 (PDT)
Date: Mon, 21 Sep 2026 12:00:46 +0100
In-Reply-To: <20260921110050.3977591-1-vdonnefort@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260921110050.3977591-1-vdonnefort@google.com>
X-Mailer: git-send-email 2.55.0.1082.g2b9226bbc0-goog
Message-ID: <20260921110050.3977591-5-vdonnefort@google.com>
Subject: [PATCH v2 4/8] arm64: Add support for MEMBLOCK_PTEMAP
From: Vincent Donnefort <vdonnefort@google.com>
To: catalin.marinas@arm.com, will@kernel.org, rppt@kernel.org, 
	akpm@linux-foundation.org, sudeep.holla@kernel.org, jenswi@kernel.org, 
	robh@kernel.org
Cc: mark.rutland@arm.com, sumit.garg@kernel.org, ardb@kernel.org, 
	thierry.reding@kernel.org, david@kernel.org, danielmentz@google.com, 
	linux-arm-kernel@lists.infradead.org, linux-mm@kvack.org, 
	op-tee@lists.trustedfirmware.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Vincent Donnefort <vdonnefort@google.com>
Content-Type: text/plain; charset="UTF-8"

With the MEMBLOCK_PTEMAP flag, force a PTE-level mapping.

Signed-off-by: Vincent Donnefort <vdonnefort@google.com>
---
 arch/arm64/mm/mmu.c | 23 ++++++++++++++++-------
 1 file changed, 16 insertions(+), 7 deletions(-)

diff --git a/arch/arm64/mm/mmu.c b/arch/arm64/mm/mmu.c
index 79d90226fd5d..6b22b43a5f77 100644
--- a/arch/arm64/mm/mmu.c
+++ b/arch/arm64/mm/mmu.c
@@ -1184,9 +1184,8 @@ static void __init map_mem(void)
 	phys_addr_t init_begin = __pa_symbol(__init_begin);
 	phys_addr_t init_end = __pa_symbol(__init_end);
 	phys_addr_t kernel_end = __pa_symbol(__bss_stop);
-	phys_addr_t start, end;
 	int flags = NO_EXEC_MAPPINGS;
-	u64 i;
+	struct memblock_region *r;
 
 	/*
 	 * Setting hierarchical PXNTable attributes on table entries covering
@@ -1226,9 +1225,13 @@ static void __init map_mem(void)
 		       flags);
 
 	/* map all the memory banks */
-	for_each_mem_range(i, &start, &end) {
+	for_each_mem_region(r) {
+		phys_addr_t start, end;
+
+		if (memblock_is_nomap(r))
+			continue;
 		/*
-		 * for_each_mem_range may return sub-page-aligned boundaries
+		 * for_each_mem_region may return sub-page-aligned boundaries
 		 * after memblock_mark_nomap() splits regions at byte precision.
 		 * __create_pgd_mapping_locked aligns phys down to PAGE_MASK,
 		 * which could accidentally map no-map memory on the boundary.
@@ -1237,17 +1240,23 @@ static void __init map_mem(void)
 		 * regions. The cost is at most one page of unmapped gap at
 		 * each boundary.
 		 */
-		start = PAGE_ALIGN(start);
-		end = end & PAGE_MASK;
+		start = PAGE_ALIGN(r->base);
+		end = (r->base + r->size) & PAGE_MASK;
 		if (start >= end)
 			continue;
+
+		int rflags = flags;
+
+		if (memblock_is_ptemap(r))
+			rflags |= NO_BLOCK_MAPPINGS | NO_CONT_MAPPINGS;
+
 		/*
 		 * The linear map must allow allocation tags reading/writing
 		 * if MTE is present. Otherwise, it has the same attributes as
 		 * PAGE_KERNEL.
 		 */
 		__map_memblock(start, end, pgprot_tagged(PAGE_KERNEL),
-			       flags);
+			       rflags);
 	}
 }
 
-- 
2.55.0.1082.g2b9226bbc0-goog

