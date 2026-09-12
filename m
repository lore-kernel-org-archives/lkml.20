Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57B774BEE51
	for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 01:08:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789175298; cv=none; b=KWKoTrS+cI6SrGc2e9xXSSa6sQO31ooSahbWJ+eIZvMZCgVlAE/IUkeLas/bC4OCacYFc5HLnRT99Cq3gzG9pbPz8MH63OGiH6S0zhjeE8mo31ZFQTF1CKs/vT1GHwldpC2I7DxvOKf6jMi129Zdgv1MhRuez3igPqAPFu9WzZU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789175298; c=relaxed/simple;
	bh=NGLQKUHrsnPyQdCe5xEwEtw3g/OSt3nfQXgLtfYJxiE=;
	h=Date:From:To:cc:Subject:Message-ID:MIME-Version:Content-Type; b=p1YepK1oXIoOUhFbWRMri0EGkZrwQmi3bxv7/+exJxatXMPQf6FqKi5yLp08axnVbcXiD7CDSrF41jucMTvs6x9FbJvEnhSHc33tTqZL1i4Wg+LIIRREMzqxLyu9CpjVAvpYmy4EMrTWciCMFbjHEc+QgRfymRYuCdy9sHbTatc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=B5z82m7a; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="B5z82m7a"
Received: by mail-pj2-f13.google.com with SMTP id d9443c01a7336-2dd4b917769so14205ad.1
        for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 18:08:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789175297; x=1789780097; darn=vger.kernel.org;
        h=content-type:mime-version:message-id:subject:cc:to:from:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=im53GbHEfLvUBZNrpRGu8UH4RSkvxvrAWZ/Fpm46ytA=;
        b=B5z82m7a0GoZWG8PgLFNxci04I7WsOxNbvl3UeqkYgtfcEfkkHw53BkrNfgwlNmf/4
         5QW1E6/NyesDtuY/cMJIvBzT+JZh19/FRCGrtdPURCex2aTSHvlEZntZ/FfkHlO2X8QE
         M3SbxXuwg6r5CxYoxw98dpBR+nXthQQjYnAPYxb/IMxFxovH3H0D3GEkRGmPgRoHOrJ2
         ROnRJA/lSCmniRs37T6ivFmY6UKOlCCQufsQp+AEdOZKBC6TXbaMDtzvhcssb2YS5zUh
         Gxuj97wuFXMM5AOb2mcYcs8ESazui+DEA+Lw98W/ds8qI67xtG2+m8DdXjJapseO3k5F
         kBAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789175297; x=1789780097;
        h=content-type:mime-version:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=im53GbHEfLvUBZNrpRGu8UH4RSkvxvrAWZ/Fpm46ytA=;
        b=h1cJ4xskUJE9CCbZ2WmNWVXKdOgDwFmuD9AIFf01bE7YXl3WhN9IKUxym8A9TOXpHK
         5MF/O97bbLeyLu7+GvMMB32H+XAS4nEIRp4bZDVQGYou1j+rkA+HKx5WhSkn6G1Gp0Xp
         isdioHI7xBW0zvQA6Pgddbc5PRWuS6hMkVjnMYH1IGYsH+1r5P5bP17gpD2Wr1JEWq5H
         gL9JK4DxyFKYCcgmiP0/HimPSz2J+Zx9ts+U8iN7lOy8YPaH7lxPgvnjIdSzH8gdilQJ
         yYgz5wyfN5EayiA4wrirypLuG2GsOEhzocIIdqb433pa/Jap8kOYMLRsv8GZeF5l+QgP
         zZcA==
X-Forwarded-Encrypted: i=1; AKwUvBwnqC1hqyXQ873Rv26GO7SRD6gVLK/cui++TPHeCakRFaNEiUxHvbi95TceRVFszh4i07Q5/sTSOirqW0Q=@vger.kernel.org
X-Gm-Message-State: AFuF++l8ZfCdrWM3Vz2umgry4pFzU94Xgj9tTBlPz4bI61IToyBtYMLB
	lgdIREZHLQ+aRQdFsPqsNgWMstSTpVUyKiBLwHfuX2glz9w5cQgu38PavZucvreHUMQVuqjhqWd
	eY6q2lnpD
X-Gm-Gg: AYBFou3aTOebRh6U+WyFMlWQbwNwreAR0VilQOiJSF/F8jmi3Zmxs3qBRIjf4jCvA8C
	i8HCslW2PTCMXOIXdGPNNE5zoN56dUsKmMcd9foAYuTBwqIPGet0quVFms2cdjZBRLU9CO0S/jA
	rZ7IIC76Dpj8ehLUFDb66ppuTPLH56Bg1FiY0VtL99q2UwPqJhEqlENNsNca0ndnSwntfiIHu0p
	hxNKm54o1NfSSqXRosVg3Ne7cOujA/1siAc50frWNIS/BZV4C6H2sWNSEX69lF1qdxriNO5jga7
	rOnrrPILj1H7DzM8XYBq0hurcYSPDM822eo6jTLI3A4uBGrM8joot2zJgZ70nlzHM9wlUIaHJMD
	DxsqM26DjPARPOOm57MiwiDc3pOKf10HqF/j4z614xaX670KPzREiXex3LhjouRvqw00aBgo3ms
	UpQTrJxhVJnG6tuN5pqAm3L7x9w8qI+OtTu4URNcq4TS7YMyOkRTwESq4HNL4VqAVkIl3l+ULBa
	QwRc5mlCtLnW+N9lKIfyipw2073jvRi3mYR/BYFLr2NyhkSG5oHWj90UL+gvwN3M0GcI14g+hic
	TRoOqE7cgxLa2HD+we7TebnwZgSs/C1Jow4CXfdQZJcSxXqOHKSlIGf0y1GFrLw6guyyMWSS4QE
	+HDyvKDiMOM1nROgmmg==
X-Received: by 2002:a17:903:11c3:b0:2ce:b436:272a with SMTP id d9443c01a7336-2dd4b1042cfmr2077635ad.3.1789175295970;
        Fri, 11 Sep 2026 18:08:15 -0700 (PDT)
Received: from [2a00:79e0:2eb4:9:add7:30d3:d3cf:4f91] ([2a00:79e0:2eb4:9:add7:30d3:d3cf:4f91])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2dd2cfcf48dsm18379755ad.57.2026.09.11.18.08.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 18:08:15 -0700 (PDT)
Date: Fri, 11 Sep 2026 18:08:14 -0700 (PDT)
From: David Rientjes <rientjes@google.com>
To: "David Hildenbrand (Arm)" <david@kernel.org>, 
    Andrew Morton <akpm@linux-foundation.org>, 
    Christoph Lameter <cl@gentwo.org>
cc: Vlastimil Babka <vbabka@kernel.org>, 
    Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, linux-mm@kvack.org, 
    linux-kernel@vger.kernel.org, Sarthak Sharma <sarthak.sharma@arm.com>
Subject: [patch v3] mm: test_vmstat: add synthetic benchmark for vm stats
Message-ID: <014ef68b-6312-bcdc-f432-34c31476fe77@google.com>
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

Assisted-by: Gemini:gemini-3.8-flash
Signed-off-by: Christoph Lameter <cl@gentwo.org>
Signed-off-by: David Rientjes <rientjes@google.com>
---
 v3:
  - switch to KUnit per David

 MAINTAINERS             |   1 +
 mm/Kconfig              |  11 +++
 mm/Makefile             |   1 +
 mm/tests/vmstat_kunit.c | 160 ++++++++++++++++++++++++++++++++++++++++
 4 files changed, 173 insertions(+)
 create mode 100644 mm/tests/vmstat_kunit.c

diff --git a/MAINTAINERS b/MAINTAINERS
index cc6a2d0e0d38..885c68a79490 100644
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
index 000000000000..5462e3d02800
--- /dev/null
+++ b/mm/tests/vmstat_kunit.c
@@ -0,0 +1,160 @@
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
+	int rem;
+
+	page = alloc_page(GFP_KERNEL);
+	KUNIT_ASSERT_NOT_NULL(test, page);
+	KUNIT_ASSERT_EQ(test, kunit_add_action_or_reset(test, vmstat_test_free_page, page), 0);
+
+	/* Benchmark inc_zone_page_state() */
+	time1 = get_cycles();
+	t1_ns = ktime_get_ns();
+	for (i = 0; i < TEST_COUNT; i++)
+		inc_zone_page_state(page, NR_FREE_CMA_PAGES);
+	t2_ns = ktime_get_ns();
+	time2 = get_cycles();
+
+	time = time2 - time1;
+	inc_cycles = div_u64_rem(time, TEST_COUNT, &rem);
+	inc_ns = div_u64(t2_ns - t1_ns, TEST_COUNT);
+
+	/* Benchmark dec_zone_page_state() */
+	time1 = get_cycles();
+	t1_ns = ktime_get_ns();
+	for (i = 0; i < TEST_COUNT; i++)
+		dec_zone_page_state(page, NR_FREE_CMA_PAGES);
+	t2_ns = ktime_get_ns();
+	time2 = get_cycles();
+
+	time = time2 - time1;
+	dec_cycles = div_u64_rem(time, TEST_COUNT, &rem);
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
+	int rem;
+
+	page = alloc_page(GFP_KERNEL);
+	KUNIT_ASSERT_NOT_NULL(test, page);
+	KUNIT_ASSERT_EQ(test, kunit_add_action_or_reset(test, vmstat_test_free_page, page), 0);
+
+	time1 = get_cycles();
+	t1_ns = ktime_get_ns();
+	for (i = 0; i < TEST_COUNT; i++) {
+		inc_zone_page_state(page, NR_FREE_CMA_PAGES);
+		dec_zone_page_state(page, NR_FREE_CMA_PAGES);
+	}
+	t2_ns = ktime_get_ns();
+	time2 = get_cycles();
+
+	time = time2 - time1;
+	avg_cycles = div_u64_rem(time, TEST_COUNT, &rem);
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
+	int rem;
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
+	avg_cycles = div_u64_rem(time, TEST_COUNT, &rem);
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
