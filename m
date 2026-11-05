Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793843613;
	b=2urJFWe2W6YPnsjP85jp7PeSfjvMsdgML08ZXPx1KyZNCtj1/9dQpF4B1A7oYkFwn6VL
	 gwKYmnx2d6pnZ/Lt3WiD8AbogYgNA+826NGxv88bt6esF9wR66LXawP7StZoyAy9xEO0S
	 To4hR63t1QFnS8c2szvvuQjSpBYBZLfwC0hOyvv7M5jBPG7e2zPdaRYsdFWDkGjGPnPor
	 GGTDtD5msDeI85SQDa7+1gnNBPdwaGWK5Ih1auh9jEqu9ZiXFs75nWo0icMmkS4oEJsqp
	 FV7SCpSALb4XTB/nXBZhfqUCRqS4dqgP8qnqbvo4EunWZYEsdDjnBWz32UAdxVfJiFA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793843613;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:cc:Subject:Message-ID:MIME-Version:Content-Type;
	bh=+1mhMcZ6wBwJDhXjji70I1zijmhMiV3vbRPegD9QPv4=;
	b=thAbD8Wl9lIteasHvZ93OvdrmLXBICfvOfxpqytBScR9af9uHl35TDxtXX15kJlYtliX
	 6VRPrWL6S7+P/HaFjfqhN5JhTxm4B/qEqe5Z+A3j3cL1M1zJVBxrGh9GnGOoLOeDpioF0
	 I0Tzy28r+qL6V9+7RzUNYVZShqyldRhzqMlnFZqbi9NjKsmgiemau/i+g+jzWSIyE2Ylc
	 8hNY3bz3iL7b2vF+hZeX/lOdf+hkxV19dMQa2uMDu+6KqfgcnqYQo7MpfrHyzvdgksKSD
	 ir13tPetOmsuOw6gJopV3aatifuFYpJlg4NNqSVwVcImcYBU4Y+prFbz39/U6fqEOIA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b="h5Oiu/xd";
	arc=none smtp.remote-ip=209.85.214.173
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD444606A31B
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 01:53:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AD444606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=h5Oiu/xd
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2e8d6fcbba0so21795ad.1
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 17:53:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793843612; x=1794448412; darn=vger.kernel.org;
        h=content-type:mime-version:message-id:subject:cc:to:from:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=+1mhMcZ6wBwJDhXjji70I1zijmhMiV3vbRPegD9QPv4=;
        b=h5Oiu/xdeigVnRvcPmbVOsCoqmUfcxHW6qb2Ai3gRFgovGfPVxkP+y3NgGHpk5Ir1X
         /FI2PaNbYecw6YmQ8sTlV5DyYI8DuzOepiPQFbu0dqJqpmT6W1UEe3n2e8yxbEeh8oUL
         7G/4ISaSo5TBT+yQb0dTKfnfX4dqHhO3benWFXZ+M7lPiy18K7Na7PZ5xDsciUDokJfZ
         mMdIrGlS05sm84ch/GYuiotzD1kSNh5s0P3f7tpGTqyqCzB/KH6YgKZHwqeSh/ReI8kD
         shlVVTeLPdhqh0d0NI0N2NSMBLGUahNqr7jaNl1Jr20SMl9R1GqKc1pQM/wOJ83puqO0
         q8GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793843612; x=1794448412;
        h=content-type:mime-version:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=+1mhMcZ6wBwJDhXjji70I1zijmhMiV3vbRPegD9QPv4=;
        b=QSwl1TrI8ZZEBwqXqlERaW/YALF+wu0Ksj47KpRuWIXVWg2awchgpo31WV1iberjxZ
         3DtpmnbVBRafzCicV+nKnI1jsXAW/tl46R/JkJ5N8sen9gEVoFEeUzxTVxosN6KP9uyo
         4T1S5PRcuEVOJx8c698cjC9tfcwTp2UX2/Bfh4C0gZ2wFwoxZxzGncde/YvTMcHHwvvv
         qZ0zcSQdNX2JFUTWIBFHwhejySywHsy1Mks9mSL7XsLu9DPrWqopAxYAt/qMGmvK0Nv/
         KeTPnipw989tPxgTdnCnRRLyiTxUtUBuzMls5ZYyuBTyETlV6WFVcSXLJ5e49Cz6ahVj
         4V4Q==
X-Forwarded-Encrypted: i=1; AKwUvBx+iD0thTEGywGHKSAQXFw26G5lg6O0YeJL6jdApX34dJT1nlSbjVgZ/qv0hqmlZ+B4JV35tHK0O+tcZ9E=@vger.kernel.org
X-Gm-Message-State: APuU4Z/ph1+a3B62W4LoBLqtxjjk+JZrWdse5835ZqUZOTxhK2SarhDK
	wCiTS3s4t48FxQodTfFCxbN8N+m7RP1fV5lmxt/v1EWeVsUZq6YeaIg09wb7dS78nw==
X-Gm-Gg: AYBFou3gywMYwFU969FWkcaZDHP64AeqV40H6Bs9Q2990nPX1AcVTV/qfDMCHLHKMSq
	Ub6XLLBJUoQuENWXWH6ikMrFC9P7YZzRKHUxrqK+3oNiIBlNY4kbnAhCifCPBYVDSpPPg4cabwN
	BHTRHsEJuHWyr4970ITFtkK6s5fOf5ujqbbY+xkVWQsJFqwAzF6jubRHL5HppwvkD2ccvPwiO9M
	fUh151F2chDgusRKLXenvBAWxsnPhWkmC0XFRMbm9G9zN99nQloIvhywyJx1/f6oX+3QwG6dtFL
	mTJS/FeVkpgFt4BEkd/vFHr8gW+HazevOQ9UhiuZobM4b6uzhDKIPXa1+ZJUcohalGFZyQA4Ol6
	nFT5LS52l21HJajPFkqj4zqhFpxZADJdnoNdQ8ofP+RzJqqB+eRNXwjqMK4iAB1g7GxyVySVtMB
	n+5/eyV0+SPwlMBAtl59uV1cUl2V+YJYU/9sPmI/Ll99wKHU+FI64IA+6OtKi/zMQKTmE4NxNlH
	5D65vTQl1REkoRvJ1kDB6DsXbdi9jHHHZp8HDS0ACxSdopb5AbBLrTRIfNwhvehRaK4bvx4RtZx
	f/vmOjNIfbUlPgCeJ+1XLDCTCuvSncjdjkAP2kAveKlLiW5+T6btg8UD2H8fsliERSGrFutcV4c
	lnGUPwmZ+t3JP+q+haHzExdHpgVM0rJxLCLwntv8CjBkqqx1HRlpdSy0BqbtKBKCJUcA/rl3t0+
	mgiKaTYszXW93G6YSmrPADO/VV1Fzu58ooKQFNTWFdSLnB
X-Received: by 2002:a17:903:32cd:b0:2e9:5a0b:9f3 with SMTP id d9443c01a7336-2ed27dd6431mr1871075ad.7.1793843611246;
        Wed, 04 Nov 2026 17:53:31 -0800 (PST)
Received: from [2a00:79e0:2eb4:9:d9a2:1982:1881:ce82] ([2a00:79e0:2eb4:9:d9a2:1982:1881:ce82])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b0b90def97sm539539a91.7.2026.11.04.17.53.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 17:53:30 -0800 (PST)
Date: Wed, 4 Nov 2026 17:53:29 -0800 (PST)
From: David Rientjes <rientjes@google.com>
To: Andrew Morton <akpm@linux-foundation.org>, 
    "David Hildenbrand (Arm)" <david@kernel.org>
cc: Christoph Lameter <cl@gentwo.org>, Vlastimil Babka <vbabka@kernel.org>, 
    Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
    Sarthak Sharma <sarthak.sharma@arm.com>, linux-mm@kvack.org, 
    linux-kernel@vger.kernel.org
Subject: [patch v6] mm: vmstat_kunit: add synthetic benchmark for mm stats
Message-ID: <21183f5b-2697-cbe6-6370-dbd27c5e2b60@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
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
v6:
 - rebase on top of 7.4-rc1
 - resend per akpm

DavidH said "Works for me. The tests are rather small and I see value in
them." and I was this >< close to infering that as his Acked-by, but will
leave it to him to do that explicitly.

Once we're happy with this change, I'll apply the same treatment to the
proposed pgalloc and slab tests.

 MAINTAINERS             |   1 +
 mm/Kconfig              |  12 +++
 mm/Makefile             |   1 +
 mm/tests/vmstat_kunit.c | 157 ++++++++++++++++++++++++++++++++++++++++
 4 files changed, 171 insertions(+)
 create mode 100644 mm/tests/vmstat_kunit.c

diff --git a/MAINTAINERS b/MAINTAINERS
index 93abbb315065..c6aa67db55cd 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -17551,6 +17551,7 @@ F:	mm/mmzone.c
 F:	mm/pagewalk.c
 F:	mm/pgtable-generic.c
 F:	mm/ptdump.c
+F:	mm/tests/vmstat_kunit.c
 F:	mm/util.c
 F:	mm/vmpressure.c
 F:	mm/vmstat.c
diff --git a/mm/Kconfig b/mm/Kconfig
index afff1b25b543..33f269f6e8da 100644
--- a/mm/Kconfig
+++ b/mm/Kconfig
@@ -1490,6 +1490,18 @@ config LAZY_MMU_MODE_KUNIT_TEST
 
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
 config ARCH_HAS_CHECK_WX
 	bool
 
diff --git a/mm/Makefile b/mm/Makefile
index 2a3ec53d62ee..b671c5060a3a 100644
--- a/mm/Makefile
+++ b/mm/Makefile
@@ -148,4 +148,5 @@ obj-$(CONFIG_SHRINKER_DEBUG) += shrinker_debug.o
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
