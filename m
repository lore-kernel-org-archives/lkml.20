Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5897013A258
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 22:46:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791586001; cv=none; b=KlsaDt/ot6x1Ls2CRmnIldcGripTj/uJEhQrPkmK+Se1GS50mgnT99ZvaIxtrMAICvZANeIwguU31GDrWTzCsYSg2XEhEjnyhBGsYPCKCemotj5iMyeu/oc7/OkfS7rfbzSqk5D4y9QUIpqwNYYYCLhU9DbFL1G2FDaTgy7LGWU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791586001; c=relaxed/simple;
	bh=uL0R9u/TuDmdaDFVTV2QRD7krmZQrAIN2AqH4qoKCFQ=;
	h=Date:From:To:cc:Subject:Message-ID:MIME-Version:Content-Type; b=eXuREIohhOXvbdRrsuZxrbhs3AEUbV4sIC+tZQOS7VmHBrZb3y5F3VYukQ/ICzwwp/8zRFjVsuoqyhkmfxdzbIm7RGt9cV1nv9Y+GiCAbnDIHG0RfS/is9lzCFyUhtZvBn5LiifNHlirFZkzeH3dmnkdzgvwwB4ts7dRP4Uf7Ls=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=WFaSLdtr; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="WFaSLdtr"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2d8fd7a3f38so5375ad.1
        for <linux-kernel@vger.kernel.org>; Fri, 09 Oct 2026 15:46:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1791585999; x=1792190799; darn=vger.kernel.org;
        h=content-type:mime-version:message-id:subject:cc:to:from:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=z+EiZ+T8dkX6MNnL1h4wdxZ3B6URBkx58GDr4lvpDVM=;
        b=WFaSLdtr2mHuM9pBQfEZz08lgWnvivbKTMKRn/cZxEhKNiZCsu8F/Tzmp2EhubfLlC
         BB9Gou3oUyhFp904mhK2N60B6LtNULgJzZP24huQsTWdkJxzxzFECG8UznIz88ZtQGXm
         MNh/LHG9AKru2T8lHqbldU+QQwQzMeU4ykmL3nhBW/vNdVjpaCPYqlNeFZe9rAwlOMtb
         lbxOsRfDZUEh+e1fxEEA0creMYDvRoNpSE4Qf0EC0QEjvbIwwM4Zw3OmJ2uL+ig8d31f
         yL6u43dx4v/HNd1RjpY32HSde318f6co4vCKHkkPVUn7yRw31IYsUs6VLntczYNFpXsf
         sN8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791585999; x=1792190799;
        h=content-type:mime-version:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=z+EiZ+T8dkX6MNnL1h4wdxZ3B6URBkx58GDr4lvpDVM=;
        b=iTpToY0FQcvyAa5OML3qgRI46wO8Q/OB7qikVxB6OnRRuBXn0QkDEQxYMSkuhSyUba
         Addk4YjMYlXjX7SbWIcks6cuRrH/6dgXUTHiPbDKfN9Vf3gdDqXEgyT36NizOmI9LTmK
         lpfxLG0DXBYtkzfkHRlciOvSnAFOpwTF/Z/35tfiKaXY83eYLdAXpMdICcLt+zEKESRc
         YKo2ZiepsBuaEy0euqXGmNhah9X9p9Y/21Tqyyo9PaJUvQoTJLOtl9NsT6GygZ1frm0o
         3uGsIMKbY1j780D3SyANjyswy73yFk/UJxMiN9YX5IOjLuKuzCw+DmTgucooH7EAY6q6
         cE7A==
X-Forwarded-Encrypted: i=1; AKwUvBwXpBIim1P2hKS6TXpEf86dUQCsgEv+oci9+p0w35xGa5j1PWB2vK/GgRK12cIR/sxVUDMp+puuFeTYSDY=@vger.kernel.org
X-Gm-Message-State: AFq9FYLfFO1Fmc2LQcAORZD4WT1ObfkEhVkZmYVk4HyiBUNXLm8Y6cP3
	/Zh7CiwMoQvdp1op2gCGT+OrPCI622FH9nd73xaKPdlpp8cIlBvOoMSnFoLrYG98MDmWeRT8eMV
	QlAmsbRoH
X-Gm-Gg: AYBFou1rHRy9T7waKKHq5Tbf+bY0DrrL4Ms3reD5fDH5tpFLLbi8rAP8f+tAntc4tVJ
	L0qS6gZGfqPvN3ov60hBDfZSOzse3FdViBqN0XEuW9s1sHGu6QdbhCVqTY2oKOhmBLrfzrEgsPF
	mMKn36r/hEIgWaFipPCtzPbgUntIjQAkVoT9wjwujfOpbFe6dUTBrTFn0p1MRKUDhzehVa+4Q/H
	8KR+fAUIGkEo47mEFt+4JPGV4nrQk5dKWlafWsbQ6T0mKyfhFa/tSCD+7XUOBGCtZJkPIDIdvsB
	p7G0oBkbiaDiYxkpxDTz7+hSbk1OoyxWbHPX7Yie3+4CwlKaG3AV2iuV6B9p3m3ZKNGvZw5ldvl
	ihjNc4zrxInXCQtHFKhNXdQiO1Mbx5X3GAyeH2YV/YEPHIgSO7fABvyN9PD9X2WVi4nAIGTmzx4
	fVX3T/X4BAcUP8ProJaPTsCehwyhA3Dy4mAKlZWTBy0PaIn5+F5kgKbYXabNbL3o8nqSgQdkEPs
	CseO9txPD5QoGKdYBnMK6l/L/AHYIsgJpNIq6FmlIbz2CR0LSFMIT9FUhPDq7tIVLeoptqIrkRP
	nwTPEQbnmb7WddntxQJ8D1wJiOrWHED3cxtWPeHQ+QV+1bYhxXb58mkpEGAXmHz4r+0Sytp/7ws
	c5bqeueA=
X-Received: by 2002:a17:903:1a2f:b0:2d5:c090:3810 with SMTP id d9443c01a7336-2e87b1611e7mr478225ad.2.1791585998636;
        Fri, 09 Oct 2026 15:46:38 -0700 (PDT)
Received: from [2a00:79e0:2eb4:9:7802:e7b9:d594:8bbc] ([2a00:79e0:2eb4:9:7802:e7b9:d594:8bbc])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ab55e41eefsm3674314a91.10.2026.10.09.15.46.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 15:46:38 -0700 (PDT)
Date: Fri, 9 Oct 2026 15:46:36 -0700 (PDT)
From: David Rientjes <rientjes@google.com>
To: Andrew Morton <akpm@linux-foundation.org>, 
    "David Hildenbrand (Arm)" <david@kernel.org>
cc: Christoph Lameter <cl@gentwo.org>, Vlastimil Babka <vbabka@kernel.org>, 
    Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
    Sarthak Sharma <sarthak.sharma@arm.com>, linux-mm@kvack.org, 
    linux-kernel@vger.kernel.org
Subject: [patch v5] mm: vmstat_kunit: add synthetic benchmark for mm stats
Message-ID: <920ba123-077e-c42d-ebdf-a5effccf2073@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

From: Christoph Lameter <cl@gentwo.org>

Add a synthetic benchmark that can be used to measure performance of MM
statistics.  This is used to analyze any improvements or regressions in
functions that are frequently used in hot code paths.

This is the first of three tests that measure the execution times of
critical MM functions anticipated to be used by developers to measure the
impact of any core changes that would end up causing workload performance
issues.  Vmstats are embedded into MM hotpaths, so any regression can
cause performance and scalability impact for users.  Google has carried
these tests internally and kept them updated since Christoph posted them
back in 2009 for this purpose.

This can also be used to detect regressions over time, from kernel
version to kernel version, independent of development use cases.

The test is run by KUnit or doing modprobe vmstat_kunit directly.

Sample output:
 KTAP version 1
 1..1
 KTAP version 1
 # Subtest: vmstat
 # module: vmstat_kunit
      1..3
      # vmstat_test_inc_dec_zone_page_state: 10000 ops: inc_zone_page_state -> 8 cycles (4 ns/op), dec_zone_page_state -> 9 cycles (4 ns/op)
      ok 1 vmstat_test_inc_dec_zone_page_state
      # vmstat_test_interleaved_zone_page_state: 10000 ops: inc/dec pair -> 17 cycles (8 ns/op)
      ok 2 vmstat_test_interleaved_zone_page_state
      # vmstat_test_count_vm_event: 10000 ops: count_vm_event -> 4 cycles (2 ns/op)
      ok 3 vmstat_test_count_vm_event
 # vmstat: pass:3 fail:0 skip:0 total:3
 # Totals: pass:3 fail:0 skip:0 total:3
 ok 1 vmstat

Assisted-by: Gemini:gemini-3.8-flash
Signed-off-by: Christoph Lameter <cl@gentwo.org>
Signed-off-by: David Rientjes <rientjes@google.com>
---
v5:
 - added dependency on CONFIG_VM_EVENT_COUNTERS
 - expanded commit description

Once we're happy with this change, I'll apply the same treatment to the
proposed pgalloc and slab tests.

 MAINTAINERS             |   1 +
 mm/Kconfig              |  12 +++
 mm/Makefile             |   1 +
 mm/tests/vmstat_kunit.c | 157 ++++++++++++++++++++++++++++++++++++++++
 4 files changed, 171 insertions(+)
 create mode 100644 mm/tests/vmstat_kunit.c

diff --git a/MAINTAINERS b/MAINTAINERS
index f53047aa8d3c..ab65720521a5 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -17164,6 +17164,7 @@ F:	mm/ptdump.c
 F:	mm/sparse-vmemmap.c
 F:	mm/sparse.c
 F:	mm/sparse.h
+F:	mm/tests/vmstat_kunit.c
 F:	mm/util.c
 F:	mm/vmpressure.c
 F:	mm/vmstat.c
diff --git a/mm/Kconfig b/mm/Kconfig
index 604c58199acb..85817820f867 100644
--- a/mm/Kconfig
+++ b/mm/Kconfig
@@ -1511,6 +1511,18 @@ config LAZY_MMU_MODE_KUNIT_TEST
 
 	  If unsure, say N.
 
+config VMSTAT_KUNIT_TEST
+	tristate "KUnit test for VM statistics" if !KUNIT_ALL_TESTS
+	depends on VM_EVENT_COUNTERS
+	depends on KUNIT
+	default KUNIT_ALL_TESTS
+	help
+	  Enable this option to test and benchmark the performance of VM
+	  statistics updates (zone page state and VM event counters), which
+	  are used frequently in hot memory management code paths.
+
+	  If unsure, say N.
+
 source "mm/damon/Kconfig"
 
 endmenu
diff --git a/mm/Makefile b/mm/Makefile
index e7245cb88c66..3d4f2c43b8d3 100644
--- a/mm/Makefile
+++ b/mm/Makefile
@@ -147,4 +147,5 @@ obj-$(CONFIG_SHRINKER_DEBUG) += shrinker_debug.o
 obj-$(CONFIG_EXECMEM) += execmem.o
 obj-$(CONFIG_TMPFS_QUOTA) += shmem_quota.o
 obj-$(CONFIG_LAZY_MMU_MODE_KUNIT_TEST) += tests/lazy_mmu_mode_kunit.o
+obj-$(CONFIG_VMSTAT_KUNIT_TEST) += tests/vmstat_kunit.o
 obj-$(CONFIG_MEM_ALLOC_PROFILING) += alloc_tag.o
diff --git a/mm/tests/vmstat_kunit.c b/mm/tests/vmstat_kunit.c
new file mode 100644
index 000000000000..899c957091d1
--- /dev/null
+++ b/mm/tests/vmstat_kunit.c
@@ -0,0 +1,157 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * KUnit synthetic performance benchmark for VM statistics.
+ *
+ * (C) 2009 Linux Foundation, Christoph Lameter <cl@gentwo.org>
+ * (C) 2026 Google LLC, David Rientjes <rientjes@google.com>
+ */
+#include <kunit/test.h>
+#include <linux/mm.h>
+#include <linux/vmstat.h>
+#include <linux/timex.h>
+#include <linux/ktime.h>
+#include <linux/math64.h>
+
+#define TEST_COUNT 10000
+
+static void vmstat_test_free_page(void *arg)
+{
+	__free_page((struct page *)arg);
+}
+
+/*
+ * Test 1: Sequential inc_zone_page_state() followed by dec_zone_page_state().
+ * Net change to zone counters is 0.
+ */
+static void vmstat_test_inc_dec_zone_page_state(struct kunit *test)
+{
+	struct page *page;
+	cycles_t time1, time2, time;
+	u64 t1_ns, t2_ns;
+	u64 inc_cycles, dec_cycles;
+	u64 inc_ns, dec_ns;
+	unsigned int i;
+
+	page = alloc_page(GFP_KERNEL);
+	KUNIT_ASSERT_NOT_NULL(test, page);
+	KUNIT_ASSERT_EQ(test, kunit_add_action_or_reset(test, vmstat_test_free_page, page), 0);
+
+	/* Benchmark inc_zone_page_state() */
+	time1 = get_cycles();
+	t1_ns = ktime_get_ns();
+	for (i = 0; i < TEST_COUNT; i++)
+		inc_zone_page_state(page, NR_MLOCK);
+	t2_ns = ktime_get_ns();
+	time2 = get_cycles();
+
+	time = time2 - time1;
+	inc_cycles = div_u64(time, TEST_COUNT);
+	inc_ns = div_u64(t2_ns - t1_ns, TEST_COUNT);
+
+	/* Benchmark dec_zone_page_state() */
+	time1 = get_cycles();
+	t1_ns = ktime_get_ns();
+	for (i = 0; i < TEST_COUNT; i++)
+		dec_zone_page_state(page, NR_MLOCK);
+	t2_ns = ktime_get_ns();
+	time2 = get_cycles();
+
+	time = time2 - time1;
+	dec_cycles = div_u64(time, TEST_COUNT);
+	dec_ns = div_u64(t2_ns - t1_ns, TEST_COUNT);
+
+	if (inc_cycles || dec_cycles)
+		kunit_info(test, "%u ops: inc_zone_page_state -> %llu cycles (%llu ns/op), dec_zone_page_state -> %llu cycles (%llu ns/op)\n",
+			   TEST_COUNT, inc_cycles, inc_ns, dec_cycles, dec_ns);
+	else
+		kunit_info(test, "%u ops: inc_zone_page_state -> %llu ns/op, dec_zone_page_state -> %llu ns/op\n",
+			   TEST_COUNT, inc_ns, dec_ns);
+}
+
+/*
+ * Test 2: Paired inc_zone_page_state() and dec_zone_page_state().
+ * Net change to zone counters is 0.
+ */
+static void vmstat_test_interleaved_zone_page_state(struct kunit *test)
+{
+	struct page *page;
+	cycles_t time1, time2, time;
+	u64 t1_ns, t2_ns;
+	u64 avg_cycles, avg_ns;
+	unsigned int i;
+
+	page = alloc_page(GFP_KERNEL);
+	KUNIT_ASSERT_NOT_NULL(test, page);
+	KUNIT_ASSERT_EQ(test, kunit_add_action_or_reset(test, vmstat_test_free_page, page), 0);
+
+	time1 = get_cycles();
+	t1_ns = ktime_get_ns();
+	for (i = 0; i < TEST_COUNT; i++) {
+		inc_zone_page_state(page, NR_MLOCK);
+		dec_zone_page_state(page, NR_MLOCK);
+	}
+	t2_ns = ktime_get_ns();
+	time2 = get_cycles();
+
+	time = time2 - time1;
+	avg_cycles = div_u64(time, TEST_COUNT);
+	avg_ns = div_u64(t2_ns - t1_ns, TEST_COUNT);
+
+	if (avg_cycles)
+		kunit_info(test, "%u ops: inc/dec pair -> %llu cycles (%llu ns/op)\n",
+			   TEST_COUNT, avg_cycles, avg_ns);
+	else
+		kunit_info(test, "%u ops: inc/dec pair -> %llu ns/op\n",
+			   TEST_COUNT, avg_ns);
+}
+
+/*
+ * Test 3: count_vm_event() benchmark.
+ * Restores counter balance with count_vm_events(item, -TEST_COUNT).
+ */
+static void vmstat_test_count_vm_event(struct kunit *test)
+{
+	cycles_t time1, time2, time;
+	u64 t1_ns, t2_ns;
+	u64 avg_cycles, avg_ns;
+	unsigned int i;
+
+	time1 = get_cycles();
+	t1_ns = ktime_get_ns();
+	for (i = 0; i < TEST_COUNT; i++)
+		count_vm_event(SLABS_SCANNED);
+	t2_ns = ktime_get_ns();
+	time2 = get_cycles();
+
+	/* Restore balance */
+	count_vm_events(SLABS_SCANNED, -TEST_COUNT);
+
+	time = time2 - time1;
+	avg_cycles = div_u64(time, TEST_COUNT);
+	avg_ns = div_u64(t2_ns - t1_ns, TEST_COUNT);
+
+	if (avg_cycles)
+		kunit_info(test, "%u ops: count_vm_event -> %llu cycles (%llu ns/op)\n",
+			   TEST_COUNT, avg_cycles, avg_ns);
+	else
+		kunit_info(test, "%u ops: count_vm_event -> %llu ns/op\n",
+			   TEST_COUNT, avg_ns);
+}
+
+static struct kunit_case vmstat_test_cases[] = {
+	KUNIT_CASE(vmstat_test_inc_dec_zone_page_state),
+	KUNIT_CASE(vmstat_test_interleaved_zone_page_state),
+	KUNIT_CASE(vmstat_test_count_vm_event),
+	{}
+};
+
+static struct kunit_suite vmstat_test_suite = {
+	.name = "vmstat",
+	.test_cases = vmstat_test_cases,
+};
+kunit_test_suite(vmstat_test_suite);
+
+MODULE_LICENSE("GPL");
+MODULE_AUTHOR("Christoph Lameter <cl@gentwo.org>");
+MODULE_AUTHOR("David Rientjes <rientjes@google.com>");
+MODULE_DESCRIPTION("KUnit benchmark test for VM statistics");
