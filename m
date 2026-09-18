Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD6CB525A89
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 20:39:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789763997; cv=none; b=grE6l4YqDylFjiKVaa3arJaubEtZdAwv1anGEQsYI92IUH7iST7AHT4FcmMmJnbWq0nXGR+JFgws0QusC/JyiUokxQan5GeOeDZIQesfwgbdasdR/7sG1wk+vCjlGaW9Z4rn+3lST2BVdFpe+vo3Swv9xtLFmvyC4E69a+J7K1I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789763997; c=relaxed/simple;
	bh=nQpgMt+sddc2nCg7SsfNi0UcO1zTiKrhE5WItVPyK4I=;
	h=Date:From:To:cc:Subject:Message-ID:MIME-Version:Content-Type; b=gbfcx4inWid6TA8BDL56Ab6Y/Pk5WFWQUPz5up1rrKUXk0YhOjw4C2AzXh7JfSWUjh756Dslmo1Dli+c9/LQcA7eii5hvAnFWToDglU84weyeYaNf4V2qjNj5+lGepIaUiIiK47rPK5ndRp3PuEccMAfcn67TCSUtLPbKcgW5is=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ih+qcT2+; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ih+qcT2+"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2d8fd7a3f38so4765ad.1
        for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 13:39:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789763995; x=1790368795; darn=vger.kernel.org;
        h=content-type:mime-version:message-id:subject:cc:to:from:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Q25J0u4Do4scrtd+2dKCqirjY+QQh+2yWmp3SOTbUjw=;
        b=ih+qcT2+wAyY7WVY1M7qi8DgH9xXXLXBSCGmbtKsRkRtKFcMYqrmnmU9s1kmMGuhdN
         PwXHAXy5ByTC7Eyw/+YLyJU8LZon3ZGchGKBjbaGFXsH0KNTMjU7J4Ibo7lKTPicSDml
         Cdg8a5SiZ+YOoQCBoV6e8la4FIZtyidW3gRZNvL8aw+N4y8IUbx70V8aRmeknemvkO9n
         UwJuubvjeP8ezVjo+BmMcBGN6WWTrhYiO+PrbxA5B9Wwbu+VM+N/aEyw3KxeIToQkZ3m
         MJzHDUhseW/krm42DzPyKGGkuZOJA+Oy5vQeddCDCi2ZXc3kOrHl+5cZ+7VbAjLRlMbr
         fgFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789763995; x=1790368795;
        h=content-type:mime-version:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Q25J0u4Do4scrtd+2dKCqirjY+QQh+2yWmp3SOTbUjw=;
        b=PqwVbSwKc6+0RKifpgqmqUnMYF2oz/DYfXXWx9uQ5FDZ6jVM48FwfNXbqopiKDW6Fx
         HrfZJOq9HjY6/JzBMlkgbGNvYCRhi2WTUvqdvAhKQo/9tYbU8ycYfpY2X+4xfvxBxTqO
         8SVvz+WHEZB/ZOF95zToGwYGvCVMy6YN6pjw1xDHknrS8oTn/jjfB7cpwvwbZFd6OuZ/
         ANzhALivaBgHs7yt8Bko83MG2fU3tLUPp0T789NnDh5VY69hDBDPakVhezSJzHCZW2DO
         e/Z+MctjsBwcFHjE/QRFjAIzjs8cNbuP3MR5HwInoaZgcAuCYvbvAdG0ziV3+r8PTbCv
         5tKA==
X-Forwarded-Encrypted: i=1; AKwUvBwHYgBDpj2yEuIIJLRt0YuNVcxJqrBSoadfupEg5aMFSNuhNQvzG8X+n4Qx7nj7MvmJWgVQAP0c1rgIkUE=@vger.kernel.org
X-Gm-Message-State: AFuF++n9ZO92RcN8iz0e1S8CFI2lf85P/DoZDMd8Xv9urxJOrcvy6Jnr
	q3GGtDeWO4uQRCqKm2TyJiQJ93tQtGAvrCJmBMogXbBAbFg/+SNbzIFf5+zLEynySA==
X-Gm-Gg: AYBFou2ha2my7WwJwlU1IGzUvF4p7H4UDTzjXl4VsMNU97c6R+KXihEAekIpkxDRDKc
	NL70qTFSmlcDQ5qD8Iyjp0dX86xFCvfmUP7jlM7W+zAoef/cxM9n67v7fDZKlVjzINDek9KB+wS
	5RUYEd+q1LO2fuGFxTqCHWQnbZe0UyS4sXjP1Lvlaq3pR1gW5YhbYTLhbtWiOYC2fEB5iZQzFRT
	pAuYPGnezTxg+YwJGouc48DwSC1nIW0MmsNcRDcM4EbnH3Fkt/ecQK27JcRkamY84uKOFC2nvYB
	TAhMxmchXcBx9BO4jbMa0eEOs2uVCgJZ14NtxPqGjTebWVX9HZGRstQ3nm/TVUTTkFVufzmlqzF
	fxsSUz0YIPkHGQwW+HCcVK0X+y8KOfKff7JA5suQ6+GiinS7yeb/aGxHWB8iQPm0FComn6Z5PQa
	ZFqMDsSZytefKMIwd3PJC4We/klSixvzUUPSFczpyXhdlf+ZlEN9Gj4IPlQChwI9qHMARLaH4Nc
	jTd7+Sv4/2v7oWIpEixeDD/oUidef9XLeDiz857uhEoQXXQvWDB2WTw4IGTbQBDsLru88KNZVgm
	xxk5vXxUxsbWIWLLfM7tc9b/G5RL6WDGBrkmLIU2YR31i92A/WeWxiMedGVl9cDC87G39nuFNE1
	anPc8ZHg=
X-Received: by 2002:a17:903:26cc:b0:2ca:bf8e:360b with SMTP id d9443c01a7336-2dea2e93c73mr403255ad.9.1789763994508;
        Fri, 18 Sep 2026 13:39:54 -0700 (PDT)
Received: from [2a00:79e0:2eb4:9:9a8c:9370:b2fc:a09a] ([2a00:79e0:2eb4:9:9a8c:9370:b2fc:a09a])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-877a6be0d58sm260861b3a.7.2026.09.18.13.39.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 13:39:53 -0700 (PDT)
Date: Fri, 18 Sep 2026 13:39:52 -0700 (PDT)
From: David Rientjes <rientjes@google.com>
To: Andrew Morton <akpm@linux-foundation.org>, 
    "David Hildenbrand (Arm)" <david@kernel.org>
cc: Christoph Lameter <cl@gentwo.org>, Vlastimil Babka <vbabka@kernel.org>, 
    Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, linux-mm@kvack.org, 
    linux-kernel@vger.kernel.org, Sarthak Sharma <sarthak.sharma@arm.com>
Subject: [patch v4] mm: vmstat_kunit: add synthetic benchmark for vm stats
Message-ID: <cfc1edae-8aaa-8fd0-95de-af3d4774c6dd@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

From: Christoph Lameter <cl@gentwo.org>

Add a synthetic benchmark that can be used to measure performance of VM
statistics.  This is used to analyze any improvements or regressions in
functions that are frequently used in hot code paths.

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
v4:
 - included sample output in the commit description
 - switched to NR_MLOCK which is display only so no side effects
 - remove unnecessary "rem" variable

Once we're happy with this change, I'll apply the same treatment to the
proposed pgalloc and slab tests.

 MAINTAINERS             |   1 +
 mm/Kconfig              |  11 +++
 mm/Makefile             |   1 +
 mm/tests/vmstat_kunit.c | 157 ++++++++++++++++++++++++++++++++++++++++
 4 files changed, 170 insertions(+)
 create mode 100644 mm/tests/vmstat_kunit.c

diff --git a/MAINTAINERS b/MAINTAINERS
index 3b2eb2a7a89a..de09076d91b9 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -17161,6 +17161,7 @@ F:	mm/ptdump.c
 F:	mm/sparse-vmemmap.c
 F:	mm/sparse.c
 F:	mm/sparse.h
+F:	mm/tests/vmstat_kunit.c
 F:	mm/util.c
 F:	mm/vmpressure.c
 F:	mm/vmstat.c
diff --git a/mm/Kconfig b/mm/Kconfig
index 604c58199acb..2d021fb5ace6 100644
--- a/mm/Kconfig
+++ b/mm/Kconfig
@@ -1511,6 +1511,17 @@ config LAZY_MMU_MODE_KUNIT_TEST
 
 	  If unsure, say N.
 
+config VMSTAT_KUNIT_TEST
+	tristate "KUnit test for VM statistics" if !KUNIT_ALL_TESTS
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
