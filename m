Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 101F53BCD01
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 06:46:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788936367; cv=none; b=R/P1xQUQgbVknGqSw4qPf47jqmY7lls1ta5SB34WII4jxINIRVdF8wkVOiWIKvP9Gl1yAsigFys8kDMGeA/XlqZxgs43fOzdm8wtVEyBt5QEFWCbJlA3gWdBPgrswn47S65utaa1bFahR+IDwXcGarzB9DrVS/TOhC7wB7A8lhM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788936367; c=relaxed/simple;
	bh=aw4Rhoh3RwfLskd+wz0l+G13x6bu+xwyiBwtb7+fPgc=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=qmn6b8DrJNA28IdPHDFO04sz+tAJy14lVEJ4rsYn6cltek0KG2NSMjOqxyNkSKDoVzqt56Ur+P31XBg3CqOj7j/u6kzMZfAvch/h1+TH6rfEm4kckV4Bi8Mf9p2irAvgYYJKTYoOEh4TnFA6mmC8TAwGbkKfS5Glo5tlTTzyX7Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ctS7YgEL; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ctS7YgEL"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-47ddf7b09e5so6314333f8f.1
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 23:46:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788936363; x=1789541163; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=IYl1RTu0H7T966MjgfIs9rrG8GCdvOEJmaLrbPw3sSg=;
        b=ctS7YgELjtx3ZBQ/TzWyUOTuX2/1Qkv0ivafG7k0s5vHBMwiHF0+Tv+qZqhWGL6nYk
         bx9ayfzupqOghxM/0czxl5jVmVdLGE3ogpFcD4vD4Nlx4VnUea5gZOpZh2+p/rjchWYx
         9BewLDl+iWsspYsX0JR1vScBE3zb0CkffqNeV23GNJqDoczDe1bUH6nxDJ/DTlJD/bS2
         AHRWN2H3ABb90NdpbF2tONd4bgKUDGqWnZAcaLKIPeBCv1FFTDVsg0uVaIRDTj9ypkD4
         8mbKChDxTebXjoyxco42M8MkdzPB8HSvbJb9pGLK5G+Z++ppGW5Jt4RLqBre8QMcA8z3
         zMUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788936363; x=1789541163;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IYl1RTu0H7T966MjgfIs9rrG8GCdvOEJmaLrbPw3sSg=;
        b=sKdcm2rghG5qsNwcd7DUEfwzi/R6J9KIoM8cs34npp0/k+LGQrlhAPjMPZoKXDn9Ds
         i8jQi9sNQF2VbRrUndmvzFMddgeVnzaIIC/hZXCFyzdlyZe9RtUMms6IWgk1e4AWX2Mm
         9U0NYCNuxFhEDpXWMzOnKd1YP7cUQt9vxavZr6jlnEVXcZkQfLVNFgWO8YhFN9NJQWie
         wUfBUnSwY9esL6T2nZXtLVRN4ikyYSEiQHf+FmsT/P7dlZqzbwG350YJlikNJmBqhsqL
         WdtBxW0U/WpzN7jr8D4jhAewhWajFAoxvgUFIXwozroqisdjvfA3q0vKyYtDA/JA0f3D
         KSjA==
X-Forwarded-Encrypted: i=1; AKwUvBxKsmRkhj2IjhH8/NFKoIoHAf+HVCpqkFUq5UuLj5wjhevVtdKaxW0jOd/Vc2IfCfrcN2yatoy9mIClY9Q=@vger.kernel.org
X-Gm-Message-State: AFuF++m3Mzau2VuLgwr766DD8SLIrR3GIF1nwg5zNhgfU9aZ7IF4x02f
	ah6jL4GHDSR1ipuGHHfmYsEoK5yAqL6cQd2ul/DG04g1EnBiLDOkMx6I
X-Gm-Gg: AYBFou0XZN1pUIjmL26Scxpi0t2Rx05jL+j/OQiXxQTN/hrM+J4f+wMVXcSTAoGO54l
	xDfPl+k0brw5+NlocXoSqB3gfWJhG+nBomhCDNFd9Uq4Sf64REhHBTc84c/OIsXhY6wKAX555Y2
	xIxIAf4IO9Q2pJBSKq6wcIFrrj3kl8CApHKPB206kQecSovxWEdfze5DBQaS/A2/6+bDbAnplSU
	Ox7h12YlVDz0TP6C02RbOCFuIJnh4Q74ylCjfXU1rNGN6Jg/WGJj391lF7InuUcFMz/2CfpUk+v
	p7irMJSbA2jblHKOVrtEo+4t0wIIQyl73QCdjaZNnHdIMNlmRhJfYlUpjH/wx7rCmrpYU4HDKLW
	vwpIYDKtEp38Vp+MgWPfBZLRjdPav5mEdEeOdAN6zKmB7SwkJFlc/eLgiQz0GVcKRSn+/YrVjFo
	HMgBFnYXQ/i8cnEu2K0Myh2blC+ULvqh26ROXODcmiX7HnSZ+GzIX0p3QKQsgCuOrJTFYRuyq31
	NM4FDmk2zAhpAIWzDornGzzXdZHkm4G7KpdyuptcevSG2alY0MKoyzlRGvWQeTA6oDFLQjNtB6N
	q24jNXBQKMDgNNaNaLfRlFSakMZeZFyu0G/Qothp6Hels2oSvT6Q
X-Received: by 2002:a05:600c:1914:b0:499:60bf:c6f7 with SMTP id 5b1f17b1804b1-49cf8269fdfmr325273315e9.13.1788936362969;
        Tue, 08 Sep 2026 23:46:02 -0700 (PDT)
Received: from MacBook-Pro-von-Karl.localdomain (dynamic-095-114-212-219.95.114.pool.telefonica.de. [95.114.212.219])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49d20fc1be3sm17238355e9.4.2026.09.08.23.46.01
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 08 Sep 2026 23:46:02 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Russell King <linux@armlinux.org.uk>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	Nicolas Pitre <npitre@baylibre.com>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Robin Murphy <robin.murphy@arm.com>,
	Arnd Bergmann <arnd@arndb.de>,
	iommu@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ARM: dma-mapping: split cache maintenance at highmem boundary
Date: Wed,  9 Sep 2026 08:44:43 +0200
Message-Id: <20260909064443.90544-1-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

dma_cache_maint_page() processes highmem pages one at a time, but passes
the complete remaining range to a cache operation when the current page
is lowmem. If a physically contiguous range starts in lowmem and crosses
into highmem, the operation continues beyond high_memory through virtual
addresses which do not map the highmem pages.

On a Raspberry Pi 400 running an ARM32 LPAE kernel, an 8 KiB scatterlist
entry crossing this boundary caused a deterministic data abort at f0000000
in v7_dma_clean_range().

Limit the crossing lowmem iteration to the end of its page. Subsequent
iterations advance page by page until the existing highmem path takes
over. Keep the bulk operation for ranges contained in lowmem.

Fixes: 43377453af83 ("[ARM] introduce dma_cache_maint_page()")
Cc: stable@vger.kernel.org
Assisted-by: LLM
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
Testing:

- Raspberry Pi 400, ARM32 LPAE, 8 KiB scatterlist entry crossing the
  0x30000000 lowmem/highmem boundary: all four unpatched boots panicked at
  f0000000 in v7_dma_clean_range(). All four patched boots completed. Three
  100-iteration patched runs checked 409,600 bytes in each DMA direction
  with zero mismatches.
- W=1 builds of arch/arm/mm/dma-mapping.o passed with CONFIG_HIGHMEM=y and
  CONFIG_HIGHMEM=n. They emitted only five pre-existing kernel-doc warnings.

The hardware kernels used base 986c24e0fe44. dma-mapping.c is unchanged
between that commit and this patch's base, 893e11787f78.

 arch/arm/mm/dma-mapping.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm/mm/dma-mapping.c b/arch/arm/mm/dma-mapping.c
index 7761099dde9e..887209a09226 100644
--- a/arch/arm/mm/dma-mapping.c
+++ b/arch/arm/mm/dma-mapping.c
@@ -663,6 +663,9 @@ static void dma_cache_maint_page(phys_addr_t phys, size_t size,
 		} else {
 			phys += offset;
 			vaddr = phys_to_virt(phys);
+			if (IS_ENABLED(CONFIG_HIGHMEM) &&
+			    len > (unsigned long)high_memory - (unsigned long)vaddr)
+				len = PAGE_SIZE - offset;
 			op(vaddr, len, dir);
 		}
 		offset = 0;
-- 
2.53.0
