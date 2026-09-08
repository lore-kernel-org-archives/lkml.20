Received: from out-zbxj-a75.jellyfish.systems (out-zbxj-a75.jellyfish.systems [198.54.127.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAE6D4AE8CB
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 09:55:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.54.127.75
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788861345; cv=none; b=M4AiTy4TM+DjiB77mme1Nl/C6qULpbt6v2/6HgqoanrI+YueFYSyeco4ix+VJktIsmlp+SA8mM3EHOByzlRMirQr/BobF2VnqqBdg170pCDPstmqq6ul5o3Ql4nhusnk6er+T15bpWawhCA75rfXgsCruc6VMZy/20E/M4mKpmQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788861345; c=relaxed/simple;
	bh=kI8BIenxP/oTBV6UvYvFBuaWTyWZQhInmhRnutyRURs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hhakf13Ii0IoQeQhEQD9TCIAK2GelvjoBaUa+0MX6K5t4e/7B4FrvX38R6cY+kxYkC4PYOT0Oq6FovJ32LT2mASKUSQgCvji4gezXerPYfW499gFvleM1UyBUEFSerSuozCq0X5+qwCCss7lLZjwoubWPwhaheqjvWtY6dqJrEA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tychen.cc; spf=pass smtp.mailfrom=tychen.cc; dkim=pass (2048-bit key) header.d=tychen.cc header.i=@tychen.cc header.b=YLHRykSU; arc=none smtp.client-ip=198.54.127.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tychen.cc
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tychen.cc
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tychen.cc header.i=@tychen.cc header.b="YLHRykSU"
Received: from fedora (unknown [69.5.53.41])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.spacemail.com (Postfix) with ESMTPSA id 4hfK7J4xm0z2xGX;
	Tue, 08 Sep 2026 09:55:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tychen.cc;
	s=spacemail; t=1788861328;
	bh=aqU3LuAqQb/xeTEGHX/5XlAw8+0+r7gANB1IqPfKmKs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=YLHRykSULgmfDk5NT2skjV+cSCpjsLrUbk5082TKlzhcXnapZrPytc9Ly2AncswY7
	 K3NIyvpmok1RCiIKsRz08/Qi4oOR6156KK2FM/AEbHFMq317NRxFDYJ45eJ4+33pLP
	 2ud9d7F54cEM2xSy2O2YNPYr5DTwXxNnki0iuoCNOK16Qw4/T/yUnD+4FBSIlSOTuU
	 PL9stulPqVy31efueRNvW2oEs9ykGp/OC4dWNXbDtX+GC4XrTwGpkIjUo5WCBUSJUb
	 9+AZLOL4Xw3KXi+UKjHgdEOnhn9VBxw8Fxg+hV5U1zgTxFVe4oIIH4DZTzxxWnHsvb
	 O/s5flGhQd6JA==
From: Tianyi Chen <hi@tychen.cc>
To: Lorenzo Stoakes <ljs@kernel.org>,
	"Liam R . Howlett" <liam@infradead.org>,
	Andrew Morton <akpm@linux-foundation.org>
Cc: vbabka@kernel.org,
	jannh@google.com,
	pfalcato@suse.de,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	hi@tychen.cc
Subject: [PATCH v2] tools/testing/vma: cover hole filling through __mmap_region()
Date: Tue,  8 Sep 2026 17:55:15 +0800
Message-ID: <178886112560.138404.17741948638665342936.vma-v2@tychen.cc>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260906144100.849288-1-hi@tychen.cc>
References: <20260906144100.849288-1-hi@tychen.cc>
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
offsets, map_count and cleanup.

Signed-off-by: Tianyi Chen <hi@tychen.cc>
Assisted-by: Codex:GPT-6
---
Changes in v2:
- Rebase onto mm-unstable, preserving the new /dev/zero test.
- Rename hole_flags to middle_flags and describe each mapping's address
  and length in its comment.
- Remove the redundant hole, per-page and outer-boundary iterator checks.
- Use const bounds and named booleans for the middle VMA's expected execute
  permission, and separate assertion groups for readability.

Validation: all 29 VMA tests passed with ASan and UBSan enabled, built
with clang 20 using the existing VMA Makefile.

v1: https://lore.kernel.org/r/20260906144100.849288-1-hi@tychen.cc
Review: https://lore.kernel.org/r/ap5pmX-RddQ-c90O@gremlin

 tools/testing/vma/tests/mmap.c | 68 ++++++++++++++++++++++++++++++++++
 1 file changed, 68 insertions(+)

diff --git a/tools/testing/vma/tests/mmap.c b/tools/testing/vma/tests/mmap.c
index fa73faff226..53e4abe6a63 100644
--- a/tools/testing/vma/tests/mmap.c
+++ b/tools/testing/vma/tests/mmap.c
@@ -45,6 +45,72 @@ static bool test_mmap_region_basic(void)
 	return true;
 }
 
+static bool mmap_region_fill_hole(bool merge)
+{
+	const vma_flags_t vma_flags = mk_vma_flags(VMA_READ_BIT, VMA_WRITE_BIT,
+			VMA_MAYREAD_BIT, VMA_MAYWRITE_BIT, VMA_MAYEXEC_BIT);
+	vma_flags_t middle_flags = vma_flags;
+	struct mm_struct mm = {};
+	struct vm_area_struct *vma;
+	unsigned long addr;
+	int count = 0;
+	VMA_ITERATOR(vmi, &mm, 0);
+
+	current->mm = &mm;
+	if (!merge)
+		vma_flags_set(&middle_flags, VMA_EXEC_BIT);
+
+	/* Map at 0x300000, length 0x3000. */
+	addr = __mmap_region(NULL, 0x300000, 0x3000, vma_flags, 0x300, NULL);
+	ASSERT_EQ(addr, 0x300000);
+
+	/* Map at 0x306000, length 0x3000, leaving a hole. */
+	addr = __mmap_region(NULL, 0x306000, 0x3000, vma_flags, 0x306, NULL);
+	ASSERT_EQ(addr, 0x306000);
+	ASSERT_EQ(mm.map_count, 2);
+
+	/* Map at 0x303000, length 0x3000, filling the hole. */
+	addr = __mmap_region(NULL, 0x303000, 0x3000, middle_flags, 0x303, NULL);
+	ASSERT_EQ(addr, 0x303000);
+	ASSERT_EQ(mm.map_count, merge ? 1 : 3);
+
+	vma_iter_set(&vmi, 0);
+	for_each_vma(vmi, vma) {
+		const unsigned long start = 0x300000 + count * 0x3000;
+		const unsigned long end = merge ? 0x309000 : start + 0x3000;
+		/* Only the middle VMA in the non-merge case has VMA_EXEC. */
+		const bool is_middle_vma = count == 1;
+		const bool expect_exec_vma = is_middle_vma && !merge;
+
+		ASSERT_EQ(vma->vm_start, start);
+		ASSERT_EQ(vma->vm_end, end);
+		ASSERT_EQ(vma_start_pgoff(vma), start >> PAGE_SHIFT);
+		ASSERT_EQ(vma_start_anon_pgoff(vma), start >> PAGE_SHIFT);
+
+		ASSERT_TRUE(vma_test_all(vma, VMA_READ_BIT, VMA_WRITE_BIT,
+					 VMA_MAYREAD_BIT, VMA_MAYWRITE_BIT,
+					 VMA_MAYEXEC_BIT));
+		ASSERT_EQ(vma_test(vma, VMA_EXEC_BIT), expect_exec_vma);
+
+		count++;
+	}
+
+	ASSERT_EQ(count, mm.map_count);
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
 static bool test_pure_anon_dev_zero(void)
 {
 	const vma_flags_t vma_flags = mk_vma_flags(VMA_READ_BIT, VMA_WRITE_BIT,
@@ -84,5 +150,7 @@ static bool test_pure_anon_dev_zero(void)
 static void run_mmap_tests(int *num_tests, int *num_fail)
 {
 	TEST(mmap_region_basic);
+	TEST(mmap_region_fill_hole_merge);
+	TEST(mmap_region_fill_hole_flags_mismatch);
 	TEST(pure_anon_dev_zero);
 }
-- 
2.55.0

