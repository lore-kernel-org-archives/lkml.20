Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792429932;
	b=G15BeDNU2D/vA+JJ3h3/5/WO1DhEi3RdvRNDSfY7XUnNltlkpNc5tvBR9cOouGV/hJ2o
	 Z1IoIt9VYO3mQFeBd4bf7MOQ6kn+ElyEIaD0p5xJeiSZvG81S1Do+nX1mJmch81ts3VHH
	 uZ7mv+TPaXVLdvEhg/svotWOJ2ZhFQCz1QId7zFu3PqYWuDl2IRGVIVa7yY4DIW0jJLTM
	 U871+K3j7Ea88NsxgK4tNRcbHYG4Ll+Zv4y31BDK7756zXghKZsXp2FMvJsyHYDOsvKHi
	 MLdSXuKmtptafDDKdpoFWZuQdCs637k2gvoKxzaGuEMdM0WTl0canB2T0wJbRWy9FOQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792429932;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=T2WxJgHgDzroGnytVGNcEvJQJx/gBKIgnv1e37nYxNU=;
	b=QrphEWmJg28axUyxwyGjcQaO6m4YkE3ffACottDozOl+1875DtN6qvm6c4haJvYFvgWf
	 5vCzbqkjatT0D2S5PBCXT7K1i3EM+XjlJmA+de+lH5/DxZOKkwcbdweyYYduCBK14iunc
	 S2N17jGx6ML4VprUQL+JxGejdGSSeukvKJAhXX0NMHXSz3T9RPWRDLC1xRPvRbhwDRSDe
	 fZv/kDNTymeZ1IWXJtvw42i3L13/jAAIfy5cKLCeqHIKDRLidVHGU4ipKSjWOg2PKkWWT
	 qsagoVo/XbNGysBDlmPfoHBvXsdbu3RnZ/+WzgnGGBmXRPulNhL6pcZxFZX8+Jr9Brg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=gourry.net;
	spf=pass smtp.mailfrom=gourry.net;
	dkim=pass header.d=gourry.net header.i=@gourry.net header.a=rsa-sha256 header.s=google header.b=d4D8pFak;
	arc=none smtp.remote-ip=209.85.219.42
Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com [209.85.219.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7584606A327
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 17:12:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D7584606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gourry.net header.i=@gourry.net header.a=rsa-sha256 header.s=google header.b=d4D8pFak
Received: by mail-qv1-f42.google.com with SMTP id 6a1803df08f44-9178d514951so19855286d6.0
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 10:12:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1792429931; x=1793034731; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=T2WxJgHgDzroGnytVGNcEvJQJx/gBKIgnv1e37nYxNU=;
        b=d4D8pFak6EEpud9Iqn7WQu1I+pcezu7vCK4cTU5VeXAIWnwFj4A6xeJ3OBE1CjT3wX
         FFLZ+2IlYaAqj35LkYm/K7veUVslrU+jPkeCfs4ZlKzm/IIKp/BUsSjfuBt9mFG+Lq8J
         3b0ZAd+QNK2peD3uYe3R9z+TCOupELjG2GeM/xA+xaLzTHaEv2w4MkKgNZD+dRBbeKaj
         fYquoMvAugP6yUc3phgbX7zFt2O+igQfRyCjN7ET7tifVwfxGT3vmSn5rOmkgcVtFx8G
         kh+jx5BHN51749Tm/S/XeBN2yuh/cQ7Sb8Wlt11rh26gyOc0NEej1cLBMRavNaNF/Dps
         JeUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792429931; x=1793034731;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=T2WxJgHgDzroGnytVGNcEvJQJx/gBKIgnv1e37nYxNU=;
        b=TEcCI/P8YzFWmUgmwMp5gB4ncTckOLUPpyYaDJlg4l1OoCFF3LaG8dhAiKQtr3XEQI
         JGDJC6LWvZaTz9wl4EkFPIvWe0L5AdgX0/Q48Fwefd7n/fCtuYdkUYZI2R2gIKyHQQ71
         GDB5GPHLh62Sl8BZxt4GRMEKeZvZpWLC+4JE5+D2AWc2lGXNcMdZZWOFfUKhRazyvSa9
         tyTPM9G5Sut2gZ7GGw4V+KDIelvXCefqLPZtUEUq1R7kf2EOS+HqBH9Gzs9IexxFjk6K
         q2G/O/jd0d+JqZNrqqr7SQuZAw/ZYJv3N4iOTzN0WEEIdf3YHMY/cnLfC87F2/ff7Zbo
         Yy+A==
X-Forwarded-Encrypted: i=1; AKwUvBwkGE+VIk6V550upnWo3pgoX5PPAfQjMpLRAXNkzPP4L/alpZjDKBY5Xhmo3rlgpUEwTKaUleYLDkJxQJ4=@vger.kernel.org
X-Gm-Message-State: AFq9FYK1OuabuzGWfbsNSdVcyMQ9je4362IH7HXngtwZjZDXUcb1oLYD
	YrTiKpERpyVZ89Pd77wHV8pfukL2Gb0OyecjvpgYHsEZFv/9nNsqykY+1hjnYVNInpw=
X-Gm-Gg: AYBFou3Ixf3osf9O2FJ5u2aLfjLlLR1WxNKyRKC1Ac8RJladVosTl6cC8xPMPBSAB3V
	FAKnqaVZSd3LLQYcPn0zCPYjkgfJQrnL1y4UOyv0pcEXutVA1eOrZcWUERshmkvuZy3pGVoJFKY
	iTsoUW9Jq0N/nI3T86/bL4PESqbCSu2jTexMalmP9wJuHtvBxMWA6+mdPfNI6ektscUkv+IEp9l
	E2HNs3jRZhjM6pG7LApOcSTAIFle/9OTt7AmoEJ36tit1hZ2eXhQgCyvIdGTcqUUVrILp6PRqve
	EJlO4rHOC+Kfl96XQoJ3rgdYc+xzBjvVBi4q7eEf0UmDaSFZjnaFnnxN4Im2TSLzFIUKRv/yf6u
	0caqf40vuRGQXunTVzC/Zuj0a8n7JC9y84ivybqjadQ+LfdkrU8a1Nsy3qdRl62bSHzMaGmMu+C
	yQJAmt5KhvmAsF2rnXYcN2skRf3uE/iZE9LWDRdZ9JKNhWHA/Otvv8B6C53AFFtWi1cIyTD41Bs
	Fml6pBrIGRQqqhh/sOgB/gVuXP1+IknQKURYZiTTq4xIslPCI3PKYwbov7j
X-Received: by 2002:a05:6214:53c7:b0:91b:53e5:9263 with SMTP id 6a1803df08f44-91bdf0f40c2mr157703266d6.21.1792429930552;
        Mon, 19 Oct 2026 10:12:10 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F.lan (pool-173-79-60-52.washdc.fios.verizon.net. [173.79.60.52])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91c040d4cedsm723116d6.34.2026.10.19.10.12.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 10:12:10 -0700 (PDT)
From: "Gregory Price (Meta)" <gourry@gourry.net>
To: linux-kselftest@vger.kernel.org
Cc: linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	kernel-team@meta.com,
	akpm@linux-foundation.org,
	david@kernel.org,
	ljs@kernel.org,
	liam@infradead.org,
	vbabka@kernel.org,
	rppt@kernel.org,
	surenb@google.com,
	mhocko@suse.com,
	shuah@kernel.org
Subject: [PATCH v3 1/7] selftests/mm: add MADV_COLD and MADV_PAGEOUT contract tests
Date: Mon, 19 Oct 2026 13:12:00 -0400
Message-ID: <20261019171206.3331374-2-gourry@gourry.net>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261019171206.3331374-1-gourry@gourry.net>
References: <20261019171206.3331374-1-gourry@gourry.net>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

MADV_COLD and MADV_PAGEOUT share a page-table walker covering ordinary
PTEs, PTE-mapped large folios and huge PMDs. Existing selftests use
MADV_PAGEOUT mostly to swap memory out for other tests, and check only
special mappings (PFNMAP, guard regions, droppable memory), not the
walker's range, folio and permission handling.

Add a kselftest harness test for both hints, starting with the most basic
behavior userspace relies on: neither hint populates a PTE hole or faults
a swapped page back in, and neither may be applied to a locked VMA.

Before running the tests, pin the process to the CPU it starts on,
so that the LRU batch MADV_COLD and MADV_PAGEOUT drain holds the
folios a test faulted in.

Signed-off-by: Gregory Price (Meta) <gourry@gourry.net>
---
v3: Dropped Sarthak's Reviewed-by from v2 1/8 and 2/8, which are folded
here, since this patch now adds main() with the CPU pinning and the
one-time reclaim check, and the swapped-page tests fail rather than skip.
---
 tools/testing/selftests/mm/Makefile           |   2 +
 .../selftests/mm/ksft_madv_cold_pageout.sh    |   4 +
 .../testing/selftests/mm/madv_cold_pageout.c  | 209 ++++++++++++++++++
 tools/testing/selftests/mm/run_vmtests.sh     |   5 +
 4 files changed, 220 insertions(+)
 create mode 100755 tools/testing/selftests/mm/ksft_madv_cold_pageout.sh
 create mode 100644 tools/testing/selftests/mm/madv_cold_pageout.c

diff --git a/tools/testing/selftests/mm/Makefile b/tools/testing/selftests/mm/Makefile
index beacc0f87304..c7fc20c153b8 100644
--- a/tools/testing/selftests/mm/Makefile
+++ b/tools/testing/selftests/mm/Makefile
@@ -68,6 +68,7 @@ TEST_GEN_FILES += hugetlb-read-hwpoison
 TEST_GEN_FILES += hugetlb-shm
 TEST_GEN_FILES += hugetlb-soft-offline
 TEST_GEN_FILES += khugepaged
+TEST_GEN_FILES += madv_cold_pageout
 TEST_GEN_FILES += madv_populate
 TEST_GEN_FILES += map_fixed_noreplace
 TEST_GEN_FILES += map_populate
@@ -154,6 +155,7 @@ TEST_PROGS += ksft_kmemleak_confirm.sh
 TEST_PROGS += ksft_kmemleak_dedup.sh
 TEST_PROGS += ksft_ksm.sh
 TEST_PROGS += ksft_ksm_numa.sh
+TEST_PROGS += ksft_madv_cold_pageout.sh
 TEST_PROGS += ksft_madv_guard.sh
 TEST_PROGS += ksft_madv_populate.sh
 TEST_PROGS += ksft_memfd_secret.sh
diff --git a/tools/testing/selftests/mm/ksft_madv_cold_pageout.sh b/tools/testing/selftests/mm/ksft_madv_cold_pageout.sh
new file mode 100755
index 000000000000..502d3fb387aa
--- /dev/null
+++ b/tools/testing/selftests/mm/ksft_madv_cold_pageout.sh
@@ -0,0 +1,4 @@
+#!/bin/sh -e
+# SPDX-License-Identifier: GPL-2.0
+
+./run_vmtests.sh -t madv_cold_pageout
diff --git a/tools/testing/selftests/mm/madv_cold_pageout.c b/tools/testing/selftests/mm/madv_cold_pageout.c
new file mode 100644
index 000000000000..5d451d409937
--- /dev/null
+++ b/tools/testing/selftests/mm/madv_cold_pageout.c
@@ -0,0 +1,209 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * MADV_COLD and MADV_PAGEOUT tests.
+ */
+#define _GNU_SOURCE
+#include <errno.h>
+#include <fcntl.h>
+#include <sched.h>
+#include <stdbool.h>
+#include <sys/mman.h>
+#include <unistd.h>
+
+#include "kselftest_harness.h"
+#include "vm_util.h"
+
+/* Reclaim can fail transiently, so retry for up to a second. */
+#define PAGEOUT_RETRIES 100
+
+static size_t page_size;
+/* Whether MADV_PAGEOUT can swap out anonymous memory, see main(). */
+static bool can_swap;
+
+/*
+ * Keep this task on one CPU, so that draining that CPU's LRU batches drains
+ * the folios this task faulted in.
+ */
+static void pin_to_current_cpu(void)
+{
+	int cpu = sched_getcpu();
+	cpu_set_t *mask;
+	size_t size;
+
+	if (cpu < 0)
+		ksft_exit_fail_perror("sched_getcpu");
+	/* CPU numbers can exceed CPU_SETSIZE, so size the mask to fit. */
+	mask = CPU_ALLOC(cpu + 1);
+	if (!mask)
+		ksft_exit_fail_perror("CPU_ALLOC");
+	size = CPU_ALLOC_SIZE(cpu + 1);
+	CPU_ZERO_S(size, mask);
+	CPU_SET_S(cpu, size, mask);
+	if (sched_setaffinity(0, size, mask))
+		ksft_exit_fail_perror("sched_setaffinity");
+	CPU_FREE(mask);
+}
+
+FIXTURE(madv_cold_pageout)
+{
+	int pagemap_fd;
+};
+
+FIXTURE_SETUP(madv_cold_pageout)
+{
+	self->pagemap_fd = open("/proc/self/pagemap", O_RDONLY);
+	ASSERT_GE(self->pagemap_fd, 0);
+}
+
+FIXTURE_TEARDOWN(madv_cold_pageout)
+{
+	close(self->pagemap_fd);
+}
+
+/* Page out the range until its first page is swapped, or madvise() fails. */
+static bool pageout_until_swapped(char *mapping, size_t size, int pagemap_fd)
+{
+	int retry;
+
+	for (retry = 0; retry < PAGEOUT_RETRIES; retry++) {
+		if (madvise(mapping, size, MADV_PAGEOUT))
+			return false;
+		if (pagemap_is_swapped(pagemap_fd, mapping))
+			return true;
+		usleep(10000);
+	}
+
+	return false;
+}
+
+/*
+ * Both hints are best effort, so these tests check what userspace can rely
+ * on: which mappings are accepted, which pages must never be reclaimed, and
+ * that neither hint changes memory contents or populates the range. main()
+ * checks once whether reclaim works at all. A test that needs a page to be
+ * reclaimed skips if it does not, and fails if the page is then not reclaimed.
+ */
+
+/* Neither hint may populate a hole between two populated pages. */
+static void check_skips_pte_hole(struct __test_metadata *_metadata,
+				 int pagemap_fd, int advice)
+{
+	char *mapping;
+
+	mapping = mmap(NULL, 3 * page_size, PROT_READ | PROT_WRITE,
+		       MAP_PRIVATE | MAP_ANONYMOUS, -1, 0);
+	ASSERT_NE(mapping, MAP_FAILED);
+	/*
+	 * Keep a large folio from covering the hole. Without THP there are no
+	 * large anonymous folios, and this fails harmlessly.
+	 */
+	madvise(mapping, 3 * page_size, MADV_NOHUGEPAGE);
+	mapping[0] = 1;
+	mapping[2 * page_size] = 1;
+	ASSERT_FALSE(pagemap_is_populated(pagemap_fd, mapping + page_size));
+
+	ASSERT_EQ(madvise(mapping, 3 * page_size, advice), 0);
+	ASSERT_FALSE(pagemap_is_populated(pagemap_fd, mapping + page_size));
+	ASSERT_EQ(mapping[0], 1);
+	ASSERT_EQ(mapping[2 * page_size], 1);
+
+	ASSERT_EQ(munmap(mapping, 3 * page_size), 0);
+}
+
+TEST_F(madv_cold_pageout, cold_skips_pte_hole)
+{
+	check_skips_pte_hole(_metadata, self->pagemap_fd, MADV_COLD);
+}
+
+TEST_F(madv_cold_pageout, pageout_skips_pte_hole)
+{
+	check_skips_pte_hole(_metadata, self->pagemap_fd, MADV_PAGEOUT);
+}
+
+/* Neither hint may be applied to locked memory. */
+TEST_F(madv_cold_pageout, locked_vma_is_rejected)
+{
+	char *mapping;
+
+	mapping = mmap(NULL, page_size, PROT_READ | PROT_WRITE,
+		       MAP_PRIVATE | MAP_ANONYMOUS, -1, 0);
+	ASSERT_NE(mapping, MAP_FAILED);
+	mapping[0] = 1;
+	if (mlock(mapping, page_size))
+		SKIP(return, "could not lock a page");
+
+	ASSERT_EQ(madvise(mapping, page_size, MADV_COLD), -1);
+	ASSERT_EQ(errno, EINVAL);
+	ASSERT_EQ(madvise(mapping, page_size, MADV_PAGEOUT), -1);
+	ASSERT_EQ(errno, EINVAL);
+	ASSERT_EQ(mapping[0], 1);
+
+	ASSERT_EQ(munmap(mapping, page_size), 0);
+}
+
+/* Neither hint may fault a swapped page back in. */
+static void check_skips_swapped_pte(struct __test_metadata *_metadata,
+				    int pagemap_fd, int advice)
+{
+	char *mapping;
+
+	if (!can_swap)
+		SKIP(return, "MADV_PAGEOUT cannot swap");
+	mapping = mmap(NULL, page_size, PROT_READ | PROT_WRITE,
+		       MAP_PRIVATE | MAP_ANONYMOUS, -1, 0);
+	ASSERT_NE(mapping, MAP_FAILED);
+	mapping[0] = 1;
+	ASSERT_TRUE(pageout_until_swapped(mapping, page_size, pagemap_fd));
+
+	ASSERT_EQ(madvise(mapping, page_size, advice), 0);
+	ASSERT_TRUE(pagemap_is_swapped(pagemap_fd, mapping));
+	ASSERT_EQ(mapping[0], 1);
+
+	ASSERT_EQ(munmap(mapping, page_size), 0);
+}
+
+TEST_F(madv_cold_pageout, cold_skips_swapped_pte)
+{
+	check_skips_swapped_pte(_metadata, self->pagemap_fd, MADV_COLD);
+}
+
+TEST_F(madv_cold_pageout, pageout_skips_swapped_pte)
+{
+	check_skips_swapped_pte(_metadata, self->pagemap_fd, MADV_PAGEOUT);
+}
+
+/* Swap out an anonymous page, to see whether swap works at all. */
+static bool probe_swap(int pagemap_fd)
+{
+	bool swapped;
+	char *page;
+
+	page = mmap(NULL, page_size, PROT_READ | PROT_WRITE,
+		    MAP_PRIVATE | MAP_ANONYMOUS, -1, 0);
+	if (page == MAP_FAILED)
+		ksft_exit_fail_perror("mmap");
+	page[0] = 1;
+	swapped = pageout_until_swapped(page, page_size, pagemap_fd);
+	munmap(page, page_size);
+
+	return swapped;
+}
+
+int main(int argc, char **argv)
+{
+	int pagemap_fd;
+
+	page_size = getpagesize();
+	/* The harness forks each test, which inherits this. */
+	pin_to_current_cpu();
+
+	pagemap_fd = open("/proc/self/pagemap", O_RDONLY);
+	if (pagemap_fd < 0)
+		ksft_exit_fail_perror("open /proc/self/pagemap");
+	can_swap = probe_swap(pagemap_fd);
+	if (!can_swap)
+		ksft_print_msg("MADV_PAGEOUT cannot swap\n");
+	close(pagemap_fd);
+
+	return test_harness_run(argc, argv);
+}
diff --git a/tools/testing/selftests/mm/run_vmtests.sh b/tools/testing/selftests/mm/run_vmtests.sh
index a1b45a3dedae..782b3ae4b2d2 100755
--- a/tools/testing/selftests/mm/run_vmtests.sh
+++ b/tools/testing/selftests/mm/run_vmtests.sh
@@ -53,6 +53,8 @@ separated by spaces:
 	test madvise(2) MADV_GUARD_INSTALL and MADV_GUARD_REMOVE options
 - madv_populate
 	test memadvise(2) MADV_POPULATE_{READ,WRITE} options
+- madv_cold_pageout
+	test madvise(2) MADV_COLD and MADV_PAGEOUT
 - memfd_secret
 	test memfd_secret(2)
 - process_mrelease
@@ -330,6 +332,9 @@ CATEGORY="madv_guard" run_test ./guard-regions
 # MADV_POPULATE_READ and MADV_POPULATE_WRITE tests
 CATEGORY="madv_populate" run_test ./madv_populate
 
+# MADV_COLD and MADV_PAGEOUT tests
+CATEGORY="madv_cold_pageout" run_test ./madv_cold_pageout
+
 # PROCESS_MADV test
 CATEGORY="process_madv" run_test ./process_madv
 
-- 
2.56.0

