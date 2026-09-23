Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75E3D391832
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 14:36:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790174216; cv=none; b=WSxd8VDfWs8aiA6a9YlCjVHUIYOn2QjZRDhFXpdz8z4hsJXeqWPR30ICKZFj6jieYbefy24U2NIV2OP7+B6CRuT4VDoc2IyYbICUC/Dke5nc0/LYTEWWJKTY7y0tI7e8wqNwn9gDdbepV7Y6d3V6OHIU51uK56ruZZ6QZaBhYVo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790174216; c=relaxed/simple;
	bh=OyiV9rMkvu1Jy8aWRg6sMe/+zI3reMyCNwVjzvrPocA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=AzNPrFpBK7WxW5LU4xLNNiwy+ArzsqJibMbUVf61Oj/+dxE9VoO8X1JqoMg9wCcTfShZpTXYbQpKWA5tyCsd6GPay69JaMcey1dYYnedXuuwhDc1DAqLvpF+Veymy7b0A77uuSwChay6LjKhrnrkoVbV1IY3LOConHYs24e41fY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qAFTfHZr; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qAFTfHZr"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49e7bcb94d3so6950285e9.2
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 07:36:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790174214; x=1790779014; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=C/jXk2YYyHPMkVqRrGY/FRmIlGWuOA8HLRzHk1PaDVE=;
        b=qAFTfHZrBWnXuPhScadcMExR/tZ+yMMwWx8RudH1EKMfqNsNt52GYOhPKZDqFGb5FN
         ka16ZDyXTDuZ2ZLXgmU3WQCdcAVBd5s9vWWls5f6phDgoCJ3XbWLtUQKqHmtIkhMBW0h
         w2eOEOV0jcUzZR9aDc1Dm7+anqoird+2bh/q+kHsCLIOhBMzZ0vz4fB6YM6R+XFdjQD+
         5b7W3layKrN7HLG1zD3Yx7HDTYQ9elquhXLcCPimq47s6yM2tRafwh0C5/3mXRLYMCVZ
         OmyNHJYEiEBNAzL9dRtQjsiX4s/bfzt0rMHjOiB115ReQRxnNQZ6Ruh/LMsCHYD6iFI2
         RmRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790174214; x=1790779014;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=C/jXk2YYyHPMkVqRrGY/FRmIlGWuOA8HLRzHk1PaDVE=;
        b=FQwdXabcEw+uF8QaD1wErwE1ToiA8hAgA6nMi14NGvX5e5Km2VlCEaBXwao/cwMLia
         S3yNLUvk9h9dVUGNQb4NZFOe7mNb1l2eRdGqlQXDsD1r8LVfTu8v5JsAAocq+g6AHd+q
         cr8lewjAJNaPTMXDwBAbIgR2ID346KFZUBMJ/AGnkDsXBSvL8Q622kxIc0SR1riIWNSA
         4toxiQaHYsuIEXyiCT97WTAR817JHpE7Fv5Qfk/Uy0J2CkZ+pWqBtchWUtEXHHK3sluY
         yO9k4PSh9ab4EwHY3bnVCAXwPg3CTZTV7djrlgJbso0ex+amVQbEUGKsZhTVpl1DmUsz
         vpaA==
X-Forwarded-Encrypted: i=1; AKwUvBzxDL613axUHzwRkuZi9jvi2ufVzsThonAXLcy3wM/INsAAmubWc8GPiJqemvf8LrNYKVIMkUBU92/ITHc=@vger.kernel.org
X-Gm-Message-State: AFuF++lnB1O36RtR1HkTsvl2rODh9fwkAK2+iJjC8mB+Qq2yc65XN1+s
	eRdIoKCLrUq/hyHq57qlp4I2u1etXxwVivKxq+mXEu5Q0iVAyIQLhfTt
X-Gm-Gg: AYBFou0d1DqI2Ycw880FW8vHMZEhfx8Kv4px+op8dN3V+76efmImcXowsBdjqLcck3m
	nGLRWWUMSi5bOg4Wtrl0mZWkKcxEIaC8s0626E1Ymqr26ymZbglEpjoBMv6qB0U/OmDDxfYpLre
	yFS+DdK8znBNfz1sCACt534V5xTaNMcGGqL0hXFPsrrn3co2CZg+HsLvbfqgKvemyM32DugZYPj
	crauVeaVhCRl4nywYO7sBeWo5tlLV1MwoN6HPbR6L0fH/LgCXn71R32Lg59TS3H0CZg+Dsz2fkZ
	2zTd75BNqe9Vk2jfj1nMrtvGDkCOPplsA4RONoUYZDNXvbKvJiCGutSM54ef4+a3rfo9Ahfzq7h
	9iXVxvS6GdhHMMcfW/P5pifLUb7qB0B8YkbbM/ghQAInaaNDRNcdWlDkUpX8zDFq/Da0HS59L2S
	LqtO/bP4ZZzZqIuvK6Oo1A1F5DseEdlp36pn8WSUPlUhJfdzi7Ryjbi/xS7rJ0UeRPiFSAaQjz+
	07Jjt+uWeilk++K845M1YxPEXg7h6qM/ZyFyk15mc4s
X-Received: by 2002:a05:600c:c493:b0:49d:15f8:2bdb with SMTP id 5b1f17b1804b1-49fdee0a968mr39819935e9.7.1790174213402;
        Wed, 23 Sep 2026 07:36:53 -0700 (PDT)
Received: from andreayoga.wind3.hub ([31.189.116.68])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fde1aca52sm81960045e9.14.2026.09.23.07.36.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 07:36:52 -0700 (PDT)
From: Andrea Parri <parri.andrea@gmail.com>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>
Cc: Andrea Parri <parri.andrea@gmail.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Ard Biesheuvel <ardb@kernel.org>,
	Kevin Brodsky <kevin.brodsky@arm.com>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Dev Jain <dev.jain@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH] arm64: mm: Fix the break-before-make flush range for erratum 2645198
Date: Wed, 23 Sep 2026 16:36:32 +0200
Message-ID: <20260923143636.89480-1-parri.andrea@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

modify_prot_start_ptes() performs the break-before-make TLB invalidation
required by erratum 2645198 with __flush_tlb_range(), whose third
argument is the end address of the range.  It passes nr * PAGE_SIZE
instead of addr + nr * PAGE_SIZE, so __do_flush_tlb_range() computes the
page count as (nr * PAGE_SIZE - addr) >> PAGE_SHIFT.

For addr > nr * PAGE_SIZE that subtraction underflows, the page count
exceeds the batching limit and the flush degenerates to flush_tlb_mm(),
so a single-page mprotect broadcasts an ASID-wide invalidation and a
full-range mmu notifier call.

For addr <= nr * PAGE_SIZE only [addr, nr * PAGE_SIZE) is invalidated,
and when the cleared batch starts below nr * PAGE_SIZE the tail is left
in the TLB.  The workaround then no longer covers the whole batch, and
for addr == nr * PAGE_SIZE the flush is empty.

On affected Cortex-A715 CPUs, this can corrupt ESR_ELx and FAR_ELx on the
next instruction abort caused by a permission fault.

Pass addr + nr * PAGE_SIZE as the end address.

Fixes: 7efa1cd5f89b5 ("arm64: add batched versions of ptep_modify_prot_start/commit")
Cc: stable@vger.kernel.org
Assisted-by: LLM
Signed-off-by: Andrea Parri <parri.andrea@gmail.com>
---
 arch/arm64/mm/mmu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/mm/mmu.c b/arch/arm64/mm/mmu.c
index 79d90226fd5dc..d4384131e10d8 100644
--- a/arch/arm64/mm/mmu.c
+++ b/arch/arm64/mm/mmu.c
@@ -2295,7 +2295,7 @@ pte_t modify_prot_start_ptes(struct vm_area_struct *vma, unsigned long addr,
 		 * in cases where cpu is affected with errata #2645198.
 		 */
 		if (pte_accessible(vma->vm_mm, pte) && pte_user_exec(pte))
-			__flush_tlb_range(vma, addr, nr * PAGE_SIZE,
+			__flush_tlb_range(vma, addr, addr + nr * PAGE_SIZE,
 					  PAGE_SIZE, 3, TLBF_NOWALKCACHE);
 	}
 
-- 
2.53.0

