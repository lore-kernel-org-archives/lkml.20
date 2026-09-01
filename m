Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAA83429814
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 15:18:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788275920; cv=none; b=jST7mB6VWW7+UeA3g6/LiUn2fEi1rNJ7Nsua0MmwElutHSewQjhwMKwwWmWNmMeIM8J8tLmrwRV86EWUi+nWDtpKtdKV/YSHZw1HyoouSiq9kiNc9aX4FQ3OrAizj4/bVlr7bMXdUAq1bMjJiA5tnkOrGO57KUsh6ez+ydiqgOQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788275920; c=relaxed/simple;
	bh=1wXFGDG6cAKDXZGR0JwrmUYryha2jneMA/xG+0CvoBc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VmC8oOh6sY39GMw2vBDwNyX+hSsw/rjQ9G8AnGVIXAsGjvdZCw4pZslJpymBio0gbv3VVv9NzyXJicjxngoR/cMToijq6RHiwV70dewajKQPzrn3wTUEl4ixXVwn5z4ztvUh3IqFra+Ipci0+24ASgfF9XBj9ztW1dbMh/o3QQo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EX4pBAg6; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EX4pBAg6"
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-84e4e98d2cfso207321b3a.0
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 08:18:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788275918; x=1788880718; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EcnqIGbKAVtdyFI4AnAxKNCEqkoHQsPJ+QMG1G+XIUo=;
        b=EX4pBAg6r9iawr/amwIpE8L8GdD/OTc0+YW9my/IAx9PBLUfSGEM4JGbXiTKzp00JO
         GyjWWRz27slNBUNHHD5r2cyr7pk3LRUVSuPJYVXxva9At4G5b9GwCHu0+ATYFppUp+Wf
         DBbrELeYeDcIj2rYri2GmC1MN7CutVSDa6si3xkJofemAxgcX42bkQGnC0xMWXYsyOib
         qpceOERlOWOqBfU7exteS6Sf+SzekfHbI8mLVJjNpAj+xiDlGFFnA4+MPwLWgsPuicQ6
         Lg53iqsrbkX++2IgaT8FNE8NMwpovkzgFzHryIbLi0S4Dp6LCMetQc0SNYQsXFBokSf3
         b5Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788275918; x=1788880718;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=EcnqIGbKAVtdyFI4AnAxKNCEqkoHQsPJ+QMG1G+XIUo=;
        b=XP0+R9/2x61ARCjlql9N5oPzCRMSX5iZ5ynAuO85QkzucCEyv+HFLCaW8kofksx9Rb
         HQ1ZedsxzD6F0CJB+YByA4ge8dMHJlJ5GnP9MZGtbdyMY8uZAIPQ2Ma8D35LqWCtRITe
         QJ5LxKwdGLgsRSK/l7BaC/6zcUvoWG5rocvfTw97bkZn3J4j/SJjqCQSNI6zPGWi+l5z
         Vnm0dgZ8RNedQCRPH6ZS3hUrhWlXvtVDKSrcthFFKbIJd//J4Y8OJyQmyqXboMCMpUwn
         BK0loPxzf7ZU5VCwJzCPI4yCdvnDuGhTDRcvKmXsWirIOlGsAaWMYiLGBMumWs9x6uf2
         P2Hw==
X-Forwarded-Encrypted: i=1; AHgh+Rp3Gxi0OvlV6SnOsn1SviX+eK+014aBaT+8UrW6ODJRON4x3H4OqIPSn+obZgLsDZ7628eFBiljPqUN+6s=@vger.kernel.org
X-Gm-Message-State: AFuF++n6vjhm6xQIHg4qMboP3SadGMW1QZmz7Q+oPjzcuGkEcLtvCryO
	f1N6xhq7DIJF3mEp7A83yfA+1cHrnf0VBWYwrA8CZK7FEhXfZjs+rXuU
X-Gm-Gg: AR+sD13fvD5p+wRrvgAUf+bb658Pvitv4fGiitZzBzio9lECXQUnJhY0uf2FUOOdjg9
	HbfH1oKnzxMmTpQU/CIlWRoEj1Zg8ovOj2A5S5zo386qyAu34kds3GnWj/EtzFmWfy3SbS5lx/P
	lMb6S6zvame8DSr1xN0NfD268NKLFmI4RDSS6EkJT8uDVQyfvH7P4RgfV7jtSykIBu9v1W2RNjs
	Cq0VTG+HCUIzPp7DZzCSl5pZWUy7FSk9VyjJ2j/kzLBJVO36h3Yz1sx4A+Rl5h2NDNRHiDyMWSn
	AL1f9ET68X1nPbA1L6+h8J/KVg6icPLpS9ulv0yUSU6003mea905uGNaFha3Cf89US6WQwPyDdf
	+VOHDdGu3S96j8DB+H4171QLi4ArtcvqFk6lqIpZ3xboG81/o9aZCC5jyB1SxABfyLTD0kiQj9V
	FMlshileqtkiBzvRyL2cFGx+Nc8gMTTptoRHMLltqf4idtMEwfc1sW9nqqNjnKhNv0qIU5BVl6M
	4evZFzidTG7p5UF35rdQt1XTG5gLjS0dKiB
X-Received: by 2002:a05:6a20:7f82:b0:3bf:b228:10b4 with SMTP id adf61e73a8af0-3d26795f2e7mr31819840637.2.1788275917973;
        Tue, 01 Sep 2026 08:18:37 -0700 (PDT)
Received: from o6.lan ([240e:391:ed0:47d0::1])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-85db24f33a0sm89911b3a.9.2026.09.01.08.18.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 08:18:37 -0700 (PDT)
From: Xueyuan Chen <xueyuan.chen21@gmail.com>
To: akpm@linux-foundation.org
Cc: david@kernel.org,
	ljs@kernel.org,
	usama.arif@linux.dev,
	ziy@nvidia.com,
	baolin.wang@linux.alibaba.com,
	liam@infradead.org,
	nico.pache@linux.dev,
	ryan.roberts@arm.com,
	dev.jain@arm.com,
	baohua@kernel.org,
	lance.yang@linux.dev,
	kas@kernel.org,
	rppt@kernel.org,
	catalin.marinas@arm.com,
	will@kernel.org,
	mark.rutland@arm.com,
	linux-arm-kernel@lists.infradead.org,
	tglx@kernel.org,
	mingo@redhat.com,
	bp@alien8.de,
	dave.hansen@linux.intel.com,
	x86@kernel.org,
	hpa@zytor.com,
	luto@kernel.org,
	peterz@infradead.org,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v7 1/3] mm: make persistent huge zero folio read-only
Date: Tue,  1 Sep 2026 23:18:16 +0800
Message-ID: <20260901151818.3191443-2-xueyuan.chen21@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260901151818.3191443-1-xueyuan.chen21@gmail.com>
References: <20260901151818.3191443-1-xueyuan.chen21@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The persistent huge zero folio is shared globally and should stay zero
after initialization. As Jann Horn pointed out [1], kernel bugs have
ended up writing to pages that were meant to be read-only, including in
security-sensitive cases. Making the folio read-only in the direct map
turns such writes into faults instead of silent zero-page corruption.

Add a page-based helper consistent with the existing direct-map interfaces.
Handle TLB invalidation in the architecture implementation; unsupported
architectures retain their current behavior.

Protect the folio after initialization. Skip highmem folios, which have no
permanent direct-map mapping.

Inspired by Jann Horn's read-only zero page work [1] and follow-up
discussion [3] with Yang Shi.

Link: https://lore.kernel.org/r/20260508-ro-zeropage-v1-1-9808abc20b49@google.com [1]
Link: https://lore.kernel.org/r/0e5b23a6-4895-454a-9dfa-6dc21adc2991@kernel.org [2]
Link: https://lore.kernel.org/r/CAHbLzkrXXe7r3n3jXgDKtwZhRqj=jDx9E6dLOULohnhBguvi9A@mail.gmail.com [3]

Suggested-by: David Hildenbrand <david@kernel.org>
Suggested-by: Usama Arif <usama.arif@linux.dev>
Co-developed-by: Lance Yang <lance.yang@linux.dev>
Signed-off-by: Lance Yang <lance.yang@linux.dev>
Signed-off-by: Xueyuan Chen <xueyuan.chen21@gmail.com>
---
 include/linux/set_memory.h | 17 +++++++++++++++++
 mm/huge_memory.c           | 13 ++++++++++---
 2 files changed, 27 insertions(+), 3 deletions(-)

diff --git a/include/linux/set_memory.h b/include/linux/set_memory.h
index 3fe293cfed8c..ed9ce04b18a1 100644
--- a/include/linux/set_memory.h
+++ b/include/linux/set_memory.h
@@ -54,6 +54,23 @@ static inline bool can_set_direct_map(void)
 #endif
 #endif /* CONFIG_ARCH_HAS_SET_DIRECT_MAP */
 
+#ifndef set_direct_map_ro
+/**
+ * set_direct_map_ro - make a direct-map range read-only
+ * @page: first page in the direct-map range
+ * @nr: number of pages in the range
+ *
+ * Make the direct-map range starting at @page read-only and invalidate stale
+ * writable translations before returning.
+ *
+ * Return: 0 on success, or a negative error code on failure.
+ */
+static inline int set_direct_map_ro(struct page *page, unsigned int nr)
+{
+	return 0;
+}
+#endif
+
 #ifdef CONFIG_X86_64
 int set_mce_nospec(unsigned long pfn);
 int clear_mce_nospec(unsigned long pfn);
diff --git a/mm/huge_memory.c b/mm/huge_memory.c
index 54494c3fa983..742283b36d74 100644
--- a/mm/huge_memory.c
+++ b/mm/huge_memory.c
@@ -42,6 +42,7 @@
 #include <linux/pgalloc_tag.h>
 #include <linux/pagewalk.h>
 #include <linux/cleanup.h>
+#include <linux/set_memory.h>
 
 #include <asm/tlb.h>
 #include "internal.h"
@@ -291,10 +292,16 @@ static int __init huge_zero_init(void)
 	huge_zero_folio = alloc_huge_zero_folio();
 	if (!huge_zero_folio) {
 		pr_warn("Allocating persistent huge zero folio failed\n");
-	} else {
-		huge_zero_pfn = folio_pfn(huge_zero_folio);
-		count_vm_event(THP_ZERO_PAGE_ALLOC);
+		return 0;
 	}
+
+	huge_zero_pfn = folio_pfn(huge_zero_folio);
+	count_vm_event(THP_ZERO_PAGE_ALLOC);
+
+	/* Highmem folios have no permanent direct-map mapping to protect. */
+	if (!folio_test_highmem(huge_zero_folio))
+		set_direct_map_ro(folio_page(huge_zero_folio, 0), HPAGE_PMD_NR);
+
 	return 0;
 }
 
-- 
2.47.3

