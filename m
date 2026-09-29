Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6CBD450B8AA
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 12:05:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790683538; cv=none; b=kdTrau4FzcbJyOILJaWhV0dTQr1jzoBHnXx3gseSsRh696YxNvV3Yujku6+3qcEoUzKqGRwpcnrEhzO0ylI3oHsqsikV3xlZRzSWLoevhwlePGDoVgAFJeb+f01h+xd/bDzkZxV6TMAdmRHgDkGwdvzkpw6TAg0nBbtnYk2Ttls=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790683538; c=relaxed/simple;
	bh=vUuie+qDqthHWW92rj4hGf4q1VZUQf2gLO+ErZoFFLg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=QGmFvNIQNBEiutrMkVoseeQupi9OI13EJgeVFyzdXPu6KYoW8a++smCul1HVuzj4cyNkKwIXqsFhyTRb0dIy32lUJf0QCcPzJ3XCcwfinahGAUaZQlhJnccnUbaEjkSzWlQ5fyco0EXQYKqLxRts8Bn5u6gXFip6KwkB33YxRcY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=g0qkdzdz; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="g0qkdzdz"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 17EEE1476;
	Tue, 29 Sep 2026 05:05:31 -0700 (PDT)
Received: from localhost (a085714.arm.com [10.164.19.28])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D15D63F86F;
	Tue, 29 Sep 2026 05:05:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1790683534; bh=vUuie+qDqthHWW92rj4hGf4q1VZUQf2gLO+ErZoFFLg=;
	h=From:To:Cc:Subject:Date:From;
	b=g0qkdzdzbsZeKr8noK/9BvgTQud9GeBvwH5RO9Gme6oQ8sI2NE6BsYFg8ZKPPBfci
	 7mLGsbZeU4mu5SC8BFqCJcrOzw0OBVESwX8bzh4xrEb7iaqyU3gotcutZ8Q0cHMPSe
	 m+WO6RXfTBZ3ySRefZOIAp1o2kNWXmR9FO6IBvNQ=
From: Anshuman Khandual <anshuman.khandual@arm.com>
To: linux-mm@kvack.org
Cc: Anshuman Khandual <anshuman.khandual@arm.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [RFC] mm: Add KUNIT test for ptval_bytes_to_hex_str()
Date: Tue, 29 Sep 2026 17:35:30 +0530
Message-ID: <20260929120530.3394073-1-anshuman.khandual@arm.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add KUnit tests for ptval_bytes_to_hex_str() to verify conversion of 32-bit
64-bit, and 128-bit (when supported) page table entry values into printable
hexadecimal strings.

Add a new PTVAL_HEX_STR_KUNIT_TEST option to enable the tests.

Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: David Hildenbrand <david@kernel.org>
Cc: Lorenzo Stoakes <ljs@kernel.org>
Cc: linux-kernel@vger.kernel.org
Cc: linux-mm@kvack.org
Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>
---
This patch applies on v7.3-rc5 after the following series

https://lore.kernel.org/linux-mm/20260831054331.625505-1-anshuman.khandual@arm.com/

 mm/Kconfig                        |  11 +++
 mm/Makefile                       |   1 +
 mm/tests/ptval_hex_string_kunit.c | 111 ++++++++++++++++++++++++++++++
 3 files changed, 123 insertions(+)
 create mode 100644 mm/tests/ptval_hex_string_kunit.c

diff --git a/mm/Kconfig b/mm/Kconfig
index 604c58199acbf..f68bf26b98c83 100644
--- a/mm/Kconfig
+++ b/mm/Kconfig
@@ -1511,6 +1511,17 @@ config LAZY_MMU_MODE_KUNIT_TEST
 
 	  If unsure, say N.
 
+config PTVAL_HEX_STR_KUNIT_TEST
+	bool "KUnit tests for pgtable entry string conversion" if !KUNIT_ALL_TESTS
+	depends on KUNIT
+	default KUNIT_ALL_TESTS
+	help
+	  Enable this option to check that ptval_bytes_to_hex_str() is able
+	  convert given pgtable entry value in bytes into hex strings which
+	  could be printed.
+
+	  If unsure, say N.
+
 source "mm/damon/Kconfig"
 
 endmenu
diff --git a/mm/Makefile b/mm/Makefile
index e7245cb88c665..d08b8bd01917b 100644
--- a/mm/Makefile
+++ b/mm/Makefile
@@ -147,4 +147,5 @@ obj-$(CONFIG_SHRINKER_DEBUG) += shrinker_debug.o
 obj-$(CONFIG_EXECMEM) += execmem.o
 obj-$(CONFIG_TMPFS_QUOTA) += shmem_quota.o
 obj-$(CONFIG_LAZY_MMU_MODE_KUNIT_TEST) += tests/lazy_mmu_mode_kunit.o
+obj-$(CONFIG_PTVAL_HEX_STR_KUNIT_TEST) += tests/ptval_hex_string_kunit.o
 obj-$(CONFIG_MEM_ALLOC_PROFILING) += alloc_tag.o
diff --git a/mm/tests/ptval_hex_string_kunit.c b/mm/tests/ptval_hex_string_kunit.c
new file mode 100644
index 0000000000000..45c203cfb49ae
--- /dev/null
+++ b/mm/tests/ptval_hex_string_kunit.c
@@ -0,0 +1,111 @@
+// SPDX-License-Identifier: GPL-2.0
+
+#include <kunit/test.h>
+#include <linux/pgtable.h>
+
+struct ptval_str {
+	u64 val;
+	const char *str;
+};
+
+static struct ptval_str ptval_u32_tests[] = {
+	{ .val = 0x1234abcd,	.str = "1234abcd"},
+	{ .val = 0x4455aabb,	.str = "4455aabb"},
+	{ .val = 0xccddeeff,	.str = "ccddeeff"},
+	{ .val = 0x12345678,	.str = "12345678"},
+	{ .val = 0x87654321,	.str = "87654321"},
+	{ .val = 0xaabbccdd,	.str = "aabbccdd"},
+	{ .val = 0xaa44cc66,	.str = "aa44cc66"},
+	{ .val = 0x11442266,	.str = "11442266"},
+};
+
+static struct ptval_str ptval_u64_tests[] = {
+	{ .val = 0x123456789abcdef0ULL,	.str = "123456789abcdef0"},
+	{ .val = 0x113355779abcdef0ULL,	.str = "113355779abcdef0"},
+	{ .val = 0xaabbccddeeffaabbULL,	.str = "aabbccddeeffaabb"},
+	{ .val = 0x1234567812345678ULL,	.str = "1234567812345678"},
+	{ .val = 0x0000000000000000ULL,	.str = "0000000000000000"},
+	{ .val = 0xffffffffffffffffULL,	.str = "ffffffffffffffff"},
+	{ .val = 0xaa00cc00ee00aa00ULL,	.str = "aa00cc00ee00aa00"},
+	{ .val = 0xc0ffeec0ffeedeadULL,	.str = "c0ffeec0ffeedead"},
+};
+
+static void ptval_hex_str_u32(struct kunit *test)
+{
+	char buf[PTVAL_STR_MAX];
+	int i;
+
+	for (i = 0; i < ARRAY_SIZE(ptval_u32_tests); i++) {
+		u32 val = ptval_u32_tests[i].val;
+
+		ptval_bytes_to_hex_str(buf, sizeof(buf), &val, sizeof(val));
+		KUNIT_EXPECT_STREQ(test, buf, ptval_u32_tests[i].str);
+	}
+}
+
+static void ptval_hex_str_u64(struct kunit *test)
+{
+	char buf[PTVAL_STR_MAX];
+	int i;
+
+	for (i = 0; i < ARRAY_SIZE(ptval_u64_tests); i++) {
+		u64 val = ptval_u64_tests[i].val;
+
+		ptval_bytes_to_hex_str(buf, sizeof(buf), &val, sizeof(val));
+		KUNIT_EXPECT_STREQ(test, buf, ptval_u64_tests[i].str);
+	}
+}
+
+#ifdef __SIZEOF_INT128__
+struct ptval_128_str {
+	u128 val;
+	const char *str;
+};
+
+static struct ptval_128_str ptval_u128_tests[] = {
+	{ .val = (u128)0x1122334455667788 << 64 |
+		 (u128)0x123456789abcdef0, .str = "1122334455667788123456789abcdef0"},
+	{ .val = (u128)0xaabbccddeeffaabb << 64 |
+		 (u128)0xaabbccddeeffaabb, .str = "aabbccddeeffaabbaabbccddeeffaabb"},
+	{ .val = (u128)0x0000000000000000 << 64 |
+		 (u128)0x0000000000000000, .str = "00000000000000000000000000000000"},
+	{ .val = (u128)0xffffffffffffffff << 64 |
+		 (u128)0xffffffffffffffff, .str = "ffffffffffffffffffffffffffffffff"},
+	{ .val = (u128)0x1234123412341234 << 64 |
+		 (u128)0xabcdabcdabcdabcd, .str = "1234123412341234abcdabcdabcdabcd"},
+	{ .val = (u128)0xc0ffeec0ffeedead << 64 |
+		 (u128)0xc0ffeec0ffeedead, .str = "c0ffeec0ffeedeadc0ffeec0ffeedead"},
+	{ .val = (u128)0xa5a5a5a5a55a5a5a << 64 |
+		 (u128)0xa5a5a5a55a5a5a5a, .str = "a5a5a5a5a55a5a5aa5a5a5a5a55a5a5a"},
+	{ .val = (u128)0x4455445544554455 << 64 |
+		 (u128)0x2233223322332233, .str = "44554455445544552233223322332233"},
+};
+
+static void ptval_hex_str_u128(struct kunit *test)
+{
+	char buf[PTVAL_STR_MAX];
+	int i;
+
+	for (i = 0; i < ARRAY_SIZE(ptval_u128_tests); i++) {
+		u128 val = ptval_u128_tests[i].val;
+
+		ptval_bytes_to_hex_str(buf, sizeof(buf), &val, sizeof(val));
+		KUNIT_EXPECT_STREQ(test, buf, ptval_u128_tests[i].str);
+	}
+}
+#endif
+
+static struct kunit_case ptval_hex_str_tests[] = {
+	KUNIT_CASE(ptval_hex_str_u32),
+	KUNIT_CASE(ptval_hex_str_u64),
+#ifdef __SIZEOF_INT128__
+	KUNIT_CASE(ptval_hex_str_u128),
+#endif
+	{}
+};
+
+static struct kunit_suite ptval_hex_str_test_suite = {
+	.name = "ptval-hex-str",
+	.test_cases = ptval_hex_str_tests,
+};
+kunit_test_suite(ptval_hex_str_test_suite);
-- 
2.43.0

