Received: from out-2z4y-a135.jellyfish.systems (out-2z4y-a135.jellyfish.systems [198.54.127.135])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E537F248880
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 01:21:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.54.127.135
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788744063; cv=none; b=PL272JyWsOPOiuW7lQb4eEYV740f+EiD1qWl4MH/vAe0gNkI4X8D1ullc/LoWbIKxPd34xV/x0D8z1ZY/dsAF0D+RsKOynRu8gtCDSRCdcGZyrf3NcOTbPuO+9FBihEB7237yQKN1O/ObWuGeSvF5V8ShI9CC4x/sVheNLv4QvA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788744063; c=relaxed/simple;
	bh=LMGzWJiBaFKeUmagq7X11c6Lx0jBfZy0uGxegtdaMwk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MLJt1mCZfbY3nEBew6I2sab/gtkQbheI2tmyGGol6u1jL0BCnWN/s2Iuma51fIdcab9vZH5qCZtAjHv0017rGJtEF5BmMriL125nqWtp0M8gJ5k/gX6gIntd7bCZ39/QK8Fn4z+drazQB12LFNa5xCz4v+XRTkA1yAhSXjOsnJs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tychen.cc; spf=pass smtp.mailfrom=tychen.cc; dkim=pass (2048-bit key) header.d=tychen.cc header.i=@tychen.cc header.b=izxF9O+b; arc=none smtp.client-ip=198.54.127.135
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tychen.cc
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tychen.cc
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tychen.cc header.i=@tychen.cc header.b="izxF9O+b"
Received: from 192.168.5.3 (unknown [69.5.53.41])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.spacemail.com (Postfix) with ESMTPSA id 4hdTlt1r8xz6tlq;
	Mon, 07 Sep 2026 01:20:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tychen.cc;
	s=spacemail; t=1788744045;
	bh=GJ8Ln+jyy31Wa7u6fUJJyoQB3HH2yJgGsQqYaXNmcak=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=izxF9O+bpDX4/r9946K3Xd+qZc+pi3R1kKotELCUFrBqjOCH1OQ6Zp4C3hAnmlNf4
	 I3sfdsBOLwNjgDem4khzok9OL68+JITX9jArTPV8r6Y3vNkVG7vPKbsH/oHbIbBGcc
	 iX2Mt5JmemokecGVQH+GWS4dTey9msbcLvfTIvSHTKd5UiY+Zf1sKudFEr/joQxaWa
	 BFb+s68TWUVO9Oabeg41mg1sxBNwyYX9x8uz1IDz9P61bh1MpyolZkrYiWB3ZkEdjt
	 LG7MrK/eFpAaQz6cfcD+uOfwubL+mVRj1y7xI5prC4fXWL7y6tKj6077OKCbQRuIic
	 2i0C9FF/KeW8A==
From: Tianyi Chen <hi@tychen.cc>
To: rppt@kernel.org
Cc: Tianyi Chen <hi@tychen.cc>,
	Andrew Morton <akpm@linux-foundation.org>,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/2] memblock tests: cover allocations below the low address limit
Date: Mon,  7 Sep 2026 09:20:33 +0800
Message-ID: <178874362959.1415955.5009708808960886376.memblock-v2-2@tychen.cc>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <178874362959.1415955.18132997964995947947.memblock-v2-0@tychen.cc>
References: <20260906144011.848898-1-hi@tychen.cc> <178874362959.1415955.18132997964995947947.memblock-v2-0@tychen.cc>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Envelope-From: hi@tychen.cc

Add memblock_alloc_low() coverage using the simulator's low address
limit. Exercise aligned allocation, an allocation whose last byte is
immediately below the limit, an alignment constraint that prevents
fitting below it, and fully reserved low memory with high memory still
available.

Run each case with bottom-up and top-down allocation. Check zeroing
and reserved-region accounting as well as returned addresses. Verify
that an unrestricted allocation can use the free high memory after
the low allocation fails.

Document the registered memory range and its simulated limit, clarify
the allocation boundary, and remove the completed TODO.

Assisted-by: Codex:GPT-6
Signed-off-by: Tianyi Chen <hi@tychen.cc>
---
 tools/testing/memblock/Makefile              |   3 +-
 tools/testing/memblock/README                |  14 +-
 tools/testing/memblock/TODO                  |   5 -
 tools/testing/memblock/main.c                |   2 +
 tools/testing/memblock/tests/alloc_low_api.c | 148 +++++++++++++++++++
 tools/testing/memblock/tests/alloc_low_api.h |   9 ++
 6 files changed, 168 insertions(+), 13 deletions(-)
 delete mode 100644 tools/testing/memblock/TODO
 create mode 100644 tools/testing/memblock/tests/alloc_low_api.c
 create mode 100644 tools/testing/memblock/tests/alloc_low_api.h

diff --git a/tools/testing/memblock/Makefile b/tools/testing/memblock/Makefile
index d80982ccdc2..20524fcbe3c 100644
--- a/tools/testing/memblock/Makefile
+++ b/tools/testing/memblock/Makefile
@@ -7,7 +7,8 @@ CFLAGS += -I. -I../../include -Wall -O2 -fsanitize=address \
 LDFLAGS += -fsanitize=address -fsanitize=undefined
 TARGETS = main
 TEST_OFILES = tests/alloc_nid_api.o tests/alloc_helpers_api.o tests/alloc_api.o \
-		  tests/basic_api.o tests/common.o tests/alloc_exact_nid_api.o
+		  tests/basic_api.o tests/common.o tests/alloc_exact_nid_api.o \
+		  tests/alloc_low_api.o
 DEP_OFILES = memblock.o lib/slab.o mmzone.o slab.o cmdline.o
 OFILES = main.o $(DEP_OFILES) $(TEST_OFILES)
 EXTR_SRC = ../../../mm/memblock.c
diff --git a/tools/testing/memblock/README b/tools/testing/memblock/README
index b435f48d8a7..13b7f58b2ee 100644
--- a/tools/testing/memblock/README
+++ b/tools/testing/memblock/README
@@ -67,13 +67,13 @@ memblock
 |-- tests
 |    |-- alloc_api.(c|h)         -- memblock_alloc tests
 |    |-- alloc_helpers_api.(c|h) -- memblock_alloc_from tests
+|    |-- alloc_low_api.(c|h)     -- memblock_alloc_low tests
 |    |-- alloc_nid_api.(c|h)     -- memblock_alloc_try_nid tests
 |    |-- basic_api.(c|h)         -- memblock_add/memblock_reserve/... tests
 |    |-- common.(c|h)            -- helper functions for resetting memblock;
 |-- main.c        --------------.   dummy physical memory definition
 |-- Makefile                     `- test runner
 |-- README
-|-- TODO
 |-- .gitignore
 
 Simulating physical memory
@@ -101,12 +101,12 @@ There's no need to explicitly free the dummy memory from memblock via
 memblock_free() call. The entry will be erased by reset_memblock_regions(),
 called at the beginning of each test.
 
-Known issues
-============
-
-1. Tests for memblock_alloc_low() can't be easily implemented. The function uses
-   ARCH_LOW_ADDRESS_LIMIT marco, which can't be changed to point at the low
-   memory of the memory_block.
+The simulator defines ARCH_LOW_ADDRESS_LIMIT in asm/dma.h using the midpoint
+of the MEM_SIZE range registered by setup_memblock(), rather than the larger
+PHYS_MEM_SIZE backing buffer. This leaves registered memory both below and
+above the limit, even when malloc() returns an address above the kernel's
+default limit. The limit is the first address an allocation must not use;
+an allocation's base plus its size may equal the limit.
 
 References
 ==========
diff --git a/tools/testing/memblock/TODO b/tools/testing/memblock/TODO
deleted file mode 100644
index c13ad0dae77..00000000000
--- a/tools/testing/memblock/TODO
+++ /dev/null
@@ -1,5 +0,0 @@
-TODO
-=====
-
-1. Add tests for memblock_alloc_low() once the simulator can model
-   ARCH_LOW_ADDRESS_LIMIT against the low memory in memory_block
diff --git a/tools/testing/memblock/main.c b/tools/testing/memblock/main.c
index 278f9dec500..9a96e178551 100644
--- a/tools/testing/memblock/main.c
+++ b/tools/testing/memblock/main.c
@@ -4,6 +4,7 @@
 #include "tests/alloc_helpers_api.h"
 #include "tests/alloc_nid_api.h"
 #include "tests/alloc_exact_nid_api.h"
+#include "tests/alloc_low_api.h"
 #include "tests/common.h"
 
 int main(int argc, char **argv)
@@ -12,6 +13,7 @@ int main(int argc, char **argv)
 	memblock_basic_checks();
 	memblock_alloc_checks();
 	memblock_alloc_helpers_checks();
+	memblock_alloc_low_checks();
 	memblock_alloc_nid_checks();
 	memblock_alloc_exact_nid_checks();
 
diff --git a/tools/testing/memblock/tests/alloc_low_api.c b/tools/testing/memblock/tests/alloc_low_api.c
new file mode 100644
index 00000000000..1ea5a36fcf0
--- /dev/null
+++ b/tools/testing/memblock/tests/alloc_low_api.c
@@ -0,0 +1,148 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+#include "alloc_low_api.h"
+#include <linux/align.h>
+
+/* Allocate at the first or last aligned address below the low limit. */
+static int alloc_low_simple_check(void)
+{
+	struct memblock_region *rgn = &memblock.reserved.regions[0];
+	phys_addr_t size = SZ_64;
+	phys_addr_t expected;
+	void *allocated_ptr;
+
+	PREFIX_PUSH();
+	setup_memblock();
+
+	/* malloc() does not guarantee SMP_CACHE_BYTES alignment. */
+	if (memblock_bottom_up())
+		expected = ALIGN(memblock_start_of_DRAM(), SMP_CACHE_BYTES);
+	else
+		expected = ALIGN_DOWN(ARCH_LOW_ADDRESS_LIMIT - size,
+				      SMP_CACHE_BYTES);
+
+	allocated_ptr = memblock_alloc_low(size, SMP_CACHE_BYTES);
+
+	ASSERT_NE(allocated_ptr, NULL);
+	ASSERT_EQ((phys_addr_t)(uintptr_t)allocated_ptr, expected);
+	ASSERT_MEM_EQ(allocated_ptr, 0, size);
+	ASSERT_EQ(rgn->base, expected);
+	ASSERT_EQ(rgn->size, size);
+	ASSERT_LE(region_end(rgn), ARCH_LOW_ADDRESS_LIMIT);
+	ASSERT_EQ(memblock.reserved.cnt, 1);
+	ASSERT_EQ(memblock.reserved.total_size, size);
+
+	test_pass_pop();
+	return 0;
+}
+
+/* The last byte of the allocation is immediately below the low limit. */
+static int alloc_low_exact_limit_check(void)
+{
+	phys_addr_t limit = ARCH_LOW_ADDRESS_LIMIT;
+	phys_addr_t base = ALIGN_DOWN(limit - SZ_64, SMP_CACHE_BYTES);
+	phys_addr_t size = limit - base;
+	void *allocated_ptr;
+
+	PREFIX_PUSH();
+	setup_memblock();
+	ASSERT_EQ(memblock_remove(memblock_start_of_DRAM(),
+				  base - memblock_start_of_DRAM()), 0);
+
+	allocated_ptr = memblock_alloc_low(size, SMP_CACHE_BYTES);
+
+	ASSERT_NE(allocated_ptr, NULL);
+	ASSERT_EQ((phys_addr_t)(uintptr_t)allocated_ptr, base);
+	ASSERT_MEM_EQ(allocated_ptr, 0, size);
+	ASSERT_EQ(memblock.reserved.regions[0].base, base);
+	ASSERT_EQ(region_end(&memblock.reserved.regions[0]), limit);
+	ASSERT_EQ(memblock.reserved.cnt, 1);
+	ASSERT_EQ(memblock.reserved.total_size, size);
+
+	test_pass_pop();
+	return 0;
+}
+
+/*
+ * There are size bytes below the limit, but aligning the start makes the
+ * allocation cross it. Memory above the limit must not satisfy the request.
+ */
+static int alloc_low_alignment_crosses_limit_check(void)
+{
+	phys_addr_t limit = ARCH_LOW_ADDRESS_LIMIT;
+	phys_addr_t base = ALIGN_DOWN(limit, SMP_CACHE_BYTES) - 1;
+	phys_addr_t size = limit - base;
+	void *allocated_ptr;
+
+	PREFIX_PUSH();
+	setup_memblock();
+	ASSERT_EQ(memblock_remove(memblock_start_of_DRAM(),
+				  base - memblock_start_of_DRAM()), 0);
+
+	allocated_ptr = memblock_alloc_low(size, SMP_CACHE_BYTES);
+
+	ASSERT_EQ(allocated_ptr, NULL);
+	ASSERT_EQ(memblock.reserved.cnt, 0);
+	ASSERT_EQ(memblock.reserved.total_size, 0);
+	ASSERT_MEM_EQ((void *)(uintptr_t)base, 1, memblock_end_of_DRAM() - base);
+
+	test_pass_pop();
+	return 0;
+}
+
+/* Allocation must fail after reserving all low memory, with high memory free. */
+static int alloc_low_reserved_check(void)
+{
+	phys_addr_t limit = ARCH_LOW_ADDRESS_LIMIT;
+	phys_addr_t base = dummy_physical_memory_base();
+	phys_addr_t size = SZ_64;
+	void *allocated_ptr;
+
+	PREFIX_PUSH();
+	setup_memblock();
+	ASSERT_EQ(memblock_reserve(base, limit - base), 0);
+
+	allocated_ptr = memblock_alloc_low(size, SMP_CACHE_BYTES);
+
+	ASSERT_EQ(allocated_ptr, NULL);
+	ASSERT_EQ(memblock.reserved.cnt, 1);
+	ASSERT_EQ(memblock.reserved.regions[0].base, base);
+	ASSERT_EQ(memblock.reserved.regions[0].size, limit - base);
+	ASSERT_EQ(memblock.reserved.total_size, limit - base);
+	ASSERT_MEM_EQ((void *)(uintptr_t)base, 1, MEM_SIZE);
+
+	allocated_ptr = memblock_alloc(size, SMP_CACHE_BYTES);
+	ASSERT_NE(allocated_ptr, NULL);
+	ASSERT_LE(limit, (phys_addr_t)(uintptr_t)allocated_ptr);
+	ASSERT_MEM_EQ(allocated_ptr, 0, size);
+
+	test_pass_pop();
+	return 0;
+}
+
+static int alloc_low_checks(void)
+{
+	alloc_low_simple_check();
+	alloc_low_exact_limit_check();
+	alloc_low_alignment_crosses_limit_check();
+	alloc_low_reserved_check();
+
+	return 0;
+}
+
+int memblock_alloc_low_checks(void)
+{
+	prefix_reset();
+	prefix_push("memblock_alloc_low");
+	test_print("Running memblock_alloc_low tests...\n");
+
+	reset_memblock_attributes();
+	dummy_physical_memory_init();
+
+	run_top_down(alloc_low_checks);
+	run_bottom_up(alloc_low_checks);
+
+	dummy_physical_memory_cleanup();
+	prefix_pop();
+
+	return 0;
+}
diff --git a/tools/testing/memblock/tests/alloc_low_api.h b/tools/testing/memblock/tests/alloc_low_api.h
new file mode 100644
index 00000000000..2e3cbe336f5
--- /dev/null
+++ b/tools/testing/memblock/tests/alloc_low_api.h
@@ -0,0 +1,9 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+#ifndef _MEMBLOCK_ALLOC_LOW_H
+#define _MEMBLOCK_ALLOC_LOW_H
+
+#include "common.h"
+
+int memblock_alloc_low_checks(void);
+
+#endif
-- 
2.55.0

