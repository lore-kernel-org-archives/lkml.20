Received: from out-2z4y-a135.jellyfish.systems (out-2z4y-a135.jellyfish.systems [198.54.127.135])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E52A3356771
	for <linux-kernel@vger.kernel.org>; Sun,  6 Sep 2026 14:46:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.54.127.135
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788706008; cv=none; b=JDerzlvJ60TYPzMg2l3RTV/IwB4k/oUR3Txoo6uQhRZhGqoNFR5KgfGRl5rAntwJd/3/8Vq+dqR0djWUekELVcdPejq3w6C7bKC3nFQxGLFxtT/m48Z7RvPJrcdIBBgUZ4PiKAop/CzvP8fxALDMN5LuaC0INwwDh3ra+WND3ZU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788706008; c=relaxed/simple;
	bh=WrNRVm5RGaSQs+DmqRDf6tKoYIKl+hzKmxJlGARYPj0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=sRmNZVGuhWpMJElue2MSH8rPMIsfaqKmEqqoJstaplu/PkpOuQkX5uzh9HoIRr3aiK8Dy5XuC33XO+tK2nF/wz2vpJ31yp56pSVS+d4BsxMT6pCoB+cXlSTYlJLiwL+fROyQ6zIQy/p64WSN+Up6E7oZHw0B7aTmRZAVeHx8100=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tychen.cc; spf=pass smtp.mailfrom=tychen.cc; dkim=pass (2048-bit key) header.d=tychen.cc header.i=@tychen.cc header.b=HeP+2KOE; arc=none smtp.client-ip=198.54.127.135
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tychen.cc
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tychen.cc
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tychen.cc header.i=@tychen.cc header.b="HeP+2KOE"
Received: from fedora (unknown [69.5.53.41])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.spacemail.com (Postfix) with ESMTPSA id 4hdCYy1G73z2xBH;
	Sun, 06 Sep 2026 14:41:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tychen.cc;
	s=spacemail; t=1788705673;
	bh=BMfLqBwWKBeYU1egJqEuEAvuOmS9JC9iK50RUqn+x44=;
	h=From:To:Cc:Subject:Date:From;
	b=HeP+2KOEVEQwsAKbaTMLXL4OIo8jhFeapg2UDWFk/ihtHhBlMn0G7rLDNZQb0RUZg
	 oG4fQ96wIcnDA1bVrRudHsIg+0JF0CXebElLDaqeTDNRjE3UZO2oniUBtwvAVS/R1U
	 p6+IoLYu9X2dZZ6Eiv1DpMqdlpwhgSeYLUcl2/LOqyDZc8ba44BB7N26ig3QGrnPrW
	 I74xQgrzk7yd8GJtYvSucSMgxghZOn44uos8PAAJbO+3C1+5VQntUEeOC47mdpB9gl
	 RiMWukYLciZ9B8viExOLR88mODHjcckRaDLnGK3nYqCQ6oS6c3tj4bevfKTDopCWKb
	 MCXN60d00Op6Q==
From: Tianyi Chen <hi@tychen.cc>
To: ljs@kernel.org,
	"Liam R . Howlett" <liam@infradead.org>,
	Andrew Morton <akpm@linux-foundation.org>
Cc: Tianyi Chen <hi@tychen.cc>,
	Vlastimil Babka <vbabka@kernel.org>,
	Jann Horn <jannh@google.com>,
	Pedro Falcato <pfalcato@suse.de>,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] tools/testing/vma: cover hole filling through __mmap_region()
Date: Sun,  6 Sep 2026 22:41:00 +0800
Message-ID: <20260906144100.849288-1-hi@tychen.cc>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Envelope-From: hi@tychen.cc

The mmap tests extend existing mappings one neighbor at a time, while
merge tests construct merge state directly. Neither exercises filling
a hole between compatible mappings through the mmap setup and completion
path.

Fill a gap through __mmap_region() and require both neighbors to merge
into one VMA. Repeat with only the new mapping's execute permission set
and require three separate VMAs. Check boundaries, permissions, page
offsets, map_count and tree lookups across the mapped pages.

The full VMA test suite passes all 28 tests with ASan and UBSan enabled.

Assisted-by: LLM
Signed-off-by: Tianyi Chen <hi@tychen.cc>
---
 tools/testing/vma/tests/mmap.c | 75 ++++++++++++++++++++++++++++++++++
 1 file changed, 75 insertions(+)

diff --git a/tools/testing/vma/tests/mmap.c b/tools/testing/vma/tests/mmap.c
index c85bc000d1c..b66ec932a75 100644
--- a/tools/testing/vma/tests/mmap.c
+++ b/tools/testing/vma/tests/mmap.c
@@ -45,7 +45,82 @@ static bool test_mmap_region_basic(void)
 	return true;
 }
 
+static bool mmap_region_fill_hole(bool merge)
+{
+	const vma_flags_t vma_flags = mk_vma_flags(VMA_READ_BIT, VMA_WRITE_BIT,
+			VMA_MAYREAD_BIT, VMA_MAYWRITE_BIT, VMA_MAYEXEC_BIT);
+	vma_flags_t hole_flags = vma_flags;
+	struct mm_struct mm = {};
+	struct vm_area_struct *vma;
+	unsigned long addr;
+	int count = 0;
+	VMA_ITERATOR(vmi, &mm, 0);
+
+	current->mm = &mm;
+	if (!merge)
+		vma_flags_set(&hole_flags, VMA_EXEC_BIT);
+
+	/* Leave a hole between two otherwise mergeable mappings. */
+	addr = __mmap_region(NULL, 0x300000, 0x3000, vma_flags, 0x300, NULL);
+	ASSERT_EQ(addr, 0x300000);
+	addr = __mmap_region(NULL, 0x306000, 0x3000, vma_flags, 0x306, NULL);
+	ASSERT_EQ(addr, 0x306000);
+	ASSERT_EQ(mm.map_count, 2);
+	vma_iter_set(&vmi, 0x303000);
+	ASSERT_EQ(vma_iter_load(&vmi), NULL);
+	vma_iter_set(&vmi, 0x305fff);
+	ASSERT_EQ(vma_iter_load(&vmi), NULL);
+
+	/* A single flag difference must prevent merging with either neighbor. */
+	addr = __mmap_region(NULL, 0x303000, 0x3000, hole_flags, 0x303, NULL);
+	ASSERT_EQ(addr, 0x303000);
+	ASSERT_EQ(mm.map_count, merge ? 1 : 3);
+
+	vma_iter_set(&vmi, 0);
+	for_each_vma(vmi, vma) {
+		unsigned long start = 0x300000 + count * 0x3000;
+		unsigned long end = merge ? 0x309000 : start + 0x3000;
+		VMA_ITERATOR(lookup, &mm, start);
+
+		ASSERT_EQ(vma->vm_start, start);
+		ASSERT_EQ(vma->vm_end, end);
+		ASSERT_EQ(vma_start_pgoff(vma), start >> PAGE_SHIFT);
+		ASSERT_EQ(vma_start_anon_pgoff(vma), start >> PAGE_SHIFT);
+		ASSERT_TRUE(vma_test_all(vma, VMA_READ_BIT, VMA_WRITE_BIT,
+					VMA_MAYREAD_BIT, VMA_MAYWRITE_BIT,
+					VMA_MAYEXEC_BIT));
+		ASSERT_EQ(vma_test(vma, VMA_EXEC_BIT), !merge && count == 1);
+		for (addr = start; addr < end; addr += PAGE_SIZE) {
+			vma_iter_set(&lookup, addr);
+			ASSERT_EQ(vma_iter_load(&lookup), vma);
+			vma_iter_set(&lookup, addr + PAGE_SIZE - 1);
+			ASSERT_EQ(vma_iter_load(&lookup), vma);
+		}
+		count++;
+	}
+	ASSERT_EQ(count, mm.map_count);
+	vma_iter_set(&vmi, 0x2fffff);
+	ASSERT_EQ(vma_iter_load(&vmi), NULL);
+	vma_iter_set(&vmi, 0x309000);
+	ASSERT_EQ(vma_iter_load(&vmi), NULL);
+
+	ASSERT_EQ(cleanup_mm(&mm, &vmi), count);
+	return true;
+}
+
+static bool test_mmap_region_fill_hole_merge(void)
+{
+	return mmap_region_fill_hole(true);
+}
+
+static bool test_mmap_region_fill_hole_flags_mismatch(void)
+{
+	return mmap_region_fill_hole(false);
+}
+
 static void run_mmap_tests(int *num_tests, int *num_fail)
 {
 	TEST(mmap_region_basic);
+	TEST(mmap_region_fill_hole_merge);
+	TEST(mmap_region_fill_hole_flags_mismatch);
 }
-- 
2.55.0

