Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com [209.85.222.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A8223FF8A5
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 17:58:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792000695; cv=none; b=UEBK2yQYiDI6erocko6QrC2lN4XPvEY8aNpCfq18BxWJr9v0kzKNyYIx2S5ncM/G9tFU1LgNRFK7jyPHXtZNSTr5bd9UZXu5s2MGB2fhIa0MQthqrHIuDeiYeJj8ke1wjpj+UMwKp8oPkQfJLtSJxn4Onrk98H4fguRdR3lABF0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792000695; c=relaxed/simple;
	bh=dlcuU3U7kxkpYz+V0jcKknx4DN5ru6cIQ3AIuLKKTuI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WeA0yAlAkRQwc3dua+wkWfqeGJM050kTlgLhB89bGo/wG2aSsky7o20sGeoPK/pDIzL0ztnKgEu7emW2crHyGJsWeDlaxCH6bHBcGNIBS26fU34iKg0mZk7DbBTt0y3tWLEEzQk4NnRzR2C21N9GqQ9/iBdqD684wCnRGOYPNes=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=S8APnTGC; arc=none smtp.client-ip=209.85.222.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="S8APnTGC"
Received: by mail-qk1-f175.google.com with SMTP id af79cd13be357-93ef1a2948dso296547885a.3
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 10:58:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1792000693; x=1792605493; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pm6pPP6fM8ccbz50yd0Il8w295cC/To3qr6UZeKC5WE=;
        b=S8APnTGCi2T+aMz9P3J31VZh9zDg38u5PcZtMlf453G9OYqc3nbJuA7K/DqelM97ec
         0MHEHZtIdL913vKiEYhRgJM5RiH6nTXL2bZkEAw9DMdEE1ZDEBsVwKg27xSN0PBpYzZz
         WQ6RamEN0IK9oyaHtm8T0J42l5b0oJF0g8jvEP6v0GQIwU4B1Zt2LUvZw+oCe+to/r4l
         IBhRO2avN1qOuvjauXgU6CAATw2tkBnoHmvvYuQWtQDsBN+PxvYV2sGlObcpxzNVuosc
         ot8FOq3yHplKUzAcmnVe/vcgT64bznWW08r53okISX7DGSwsw9zOJx6SxjaK0/3Q0XWZ
         BdpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792000693; x=1792605493;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=pm6pPP6fM8ccbz50yd0Il8w295cC/To3qr6UZeKC5WE=;
        b=k9QG1IdqNu228SCUViFsIFZvlz3/kh5RouvmUkaRvzQ1glcgx93KwKZQnMyY6FYbZ1
         ZMFY0JlF3/FhLa5ySeP9Z7azi/QyWQ0HoqTkjaewMMFtftz9sInMpt6wwwVGsXKVIf9+
         hfe+xQ0JP9sp3C8Xko0xkQwywWCDFIBgN46tbY6NbtSB/vH/+eYEFb+zeyKaa/cgePVA
         1O1CLyCAkHQnvdH9r7tuVH4BmxWEcS1dxoq+N4TFzs0vF9TbgwKYV5pvYT7//6BU7ZgH
         k4kkGmFCUNbq/6jkpaxbxLlVDzYEqfMM05rF+QHoip0Wt7SXXfGsP30Pzr2HmFrrq1WI
         ZRTw==
X-Gm-Message-State: AFq9FYIKQ9yqPHhoB6c/uwGmIH7KD+TK63SCtRf+YDwmc2t67iIvuYkG
	M9zJhLgrFbQxknlUgzGCXbwMQ0AQfdQOcGnweDgLVLb5AL3NzI2lidUdaRCa/KNFpoA=
X-Gm-Gg: AYBFou23dKg4omVPjlF2lt8zeCtvHrPIMrudPbt7AC6aq8IFXrMx3z5a2t9kCUI/Mqt
	aZacLP2fejlAJxjuVA2MC8HOpkHVP1vGV16rMK3IiH4vcQTi8N/FVJttXNOc2dh6lyo7OPotwyx
	gypz9wRkHTB6tPasfcGbJ2R2+bGVE9Fn2DCk6sVq/Mf0qjNGTBihpz3o9VEHb/99dC4/Awvr9Z6
	eYH15Rkot4Wir+b+eWVDOuO7GjTRe8DVtzfamEJJIt3RMXwc3GWjrqX0/hpNF7xl3zpKbZbgBSv
	c/vQWKpIKKaiOLnmx/6eY2172YxWlbrf6KbG0iPqqnS6r53aCnAczLrPDaCv46vNECvzNytBpaq
	xMdYR14JxwBtFY6D9SHyC41RTUQ83hRdrV6jNMOcwCqof2IP3xusIqUagiutFxdevCHIE4UT4Gu
	KotchyfYrBMlyx0qw7KKP1nV9KnPyhtYYjnj7NyU7GCmvc1fVju4Nc17UumFl3es0w+Oe9rZapF
	65o/sj2UYIcsYS5pzGA2MDXZWc8KNbJJFuSs5rIK35RCyF+59pjIiOLB/Q9
X-Received: by 2002:a05:620a:3910:b0:93e:f9ba:690f with SMTP id af79cd13be357-93ef9ba7a6emr917103285a.73.1792000693012;
        Wed, 14 Oct 2026 10:58:13 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F.lan (pool-173-79-60-52.washdc.fios.verizon.net. [173.79.60.52])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91b97b95847sm58498006d6.32.2026.10.14.10.58.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 10:58:12 -0700 (PDT)
From: "Gregory Price (Meta)" <gourry@gourry.net>
To: linux-kselftest@vger.kernel.org,
	linux-mm@kvack.org
Cc: linux-kernel@vger.kernel.org,
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
Subject: [PATCH 6/8] selftests/mm: check MADV_COLD and MADV_PAGEOUT on partly advised THPs
Date: Wed, 14 Oct 2026 13:57:54 -0400
Message-ID: <20261014175756.2035176-7-gourry@gourry.net>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261014175756.2035176-1-gourry@gourry.net>
References: <20261014175756.2035176-1-gourry@gourry.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Paging out a THP that the advised range fully covers must not corrupt it.
A THP that the range only partly covers must be split before reclaim, or
skipped, so that no page outside the range is reclaimed. MADV_COLD takes
the same split path.

Check that a whole PMD-mapped THP is swapped intact, that pages outside
the range stay resident after paging out a base page or half of a PMD- or
PTE-mapped THP, and that MADV_COLD on half of either THP preserves its
contents. Tests skip when PMD-sized THPs cannot be allocated, and with
/proc/kpageflags the PTE-mapped cases also confirm the folio stayed large.

Signed-off-by: Gregory Price (Meta) <gourry@gourry.net>
---
 tools/testing/selftests/mm/madvise.c | 234 +++++++++++++++++++++++++++
 1 file changed, 234 insertions(+)

diff --git a/tools/testing/selftests/mm/madvise.c b/tools/testing/selftests/mm/madvise.c
index 0851f5428e3d..8822991eae4a 100644
--- a/tools/testing/selftests/mm/madvise.c
+++ b/tools/testing/selftests/mm/madvise.c
@@ -8,6 +8,7 @@
 #include <sched.h>
 #include <stdbool.h>
 #include <stdint.h>
+#include <string.h>
 #include <sys/ipc.h>
 #include <sys/mman.h>
 #include <sys/shm.h>
@@ -16,10 +17,15 @@
 #include "kselftest_harness.h"
 #include "vm_util.h"
 
+#ifndef MADV_COLLAPSE
+#define MADV_COLLAPSE 25
+#endif
+
 /* Reclaim can fail transiently, so retry for up to a second. */
 #define PAGEOUT_RETRIES 100
 
 static size_t page_size;
+static size_t pmd_size;
 
 FIXTURE(madvise)
 {
@@ -31,6 +37,7 @@ FIXTURE(madvise)
 FIXTURE_SETUP(madvise)
 {
 	page_size = getpagesize();
+	pmd_size = read_pmd_pagesize();
 
 	self->pagemap_fd = open("/proc/self/pagemap", O_RDONLY);
 	ASSERT_GE(self->pagemap_fd, 0);
@@ -44,6 +51,111 @@ FIXTURE_TEARDOWN(madvise)
 	close(self->pagemap_fd);
 }
 
+/*
+ * Reserve a PMD-aligned range, so that memory mapped over it with MAP_FIXED
+ * can be backed by PMD-mapped THPs.
+ */
+static char *reserve_aligned(struct __test_metadata *_metadata, size_t size)
+{
+	char *reservation, *aligned;
+
+	reservation = mmap(NULL, size + pmd_size, PROT_NONE,
+			   MAP_PRIVATE | MAP_ANONYMOUS, -1, 0);
+	ASSERT_NE(reservation, MAP_FAILED);
+
+	aligned = (char *)(((uintptr_t)reservation + pmd_size - 1) &
+			   ~(pmd_size - 1));
+	if (aligned != reservation)
+		ASSERT_EQ(munmap(reservation, aligned - reservation), 0);
+	ASSERT_EQ(munmap(aligned + size, reservation + pmd_size - aligned), 0);
+
+	return aligned;
+}
+
+/* Map PMD-aligned anonymous memory filled with 1s. */
+static char *map_aligned_pages(struct __test_metadata *_metadata, size_t size)
+{
+	char *mapping = reserve_aligned(_metadata, size);
+
+	ASSERT_EQ(mmap(mapping, size, PROT_READ | PROT_WRITE,
+		       MAP_PRIVATE | MAP_ANONYMOUS | MAP_FIXED, -1, 0),
+		  mapping);
+	memset(mapping, 1, size);
+
+	return mapping;
+}
+
+/*
+ * Collapse a PMD-aligned range into PMD-mapped anonymous THPs. MADV_COLLAPSE
+ * may fail transiently with EAGAIN.
+ */
+static bool collapse(char *mapping, size_t size)
+{
+	int nr_hpages = size / pmd_size;
+	int retry;
+
+	for (retry = 0; retry < 10; retry++) {
+		if (madvise(mapping, size, MADV_COLLAPSE)) {
+			if (errno != EAGAIN)
+				return false;
+		} else if (check_huge_anon(mapping, size, nr_hpages,
+					   pmd_size)) {
+			return true;
+		}
+		usleep(10000);
+	}
+
+	return false;
+}
+
+/* Map a PMD-mapped anonymous THP filled with 1s, or return NULL. */
+static char *map_thp(struct __test_metadata *_metadata)
+{
+	char *mapping;
+
+	if (!pmd_size)
+		return NULL;
+	mapping = map_aligned_pages(_metadata, pmd_size);
+	if (collapse(mapping, pmd_size))
+		return mapping;
+	ASSERT_EQ(munmap(mapping, pmd_size), 0);
+	return NULL;
+}
+
+/*
+ * Changing the protection of one page PTE-maps a THP. When /proc/kpageflags
+ * is readable, also check that the folio is still large.
+ */
+static void pte_map_thp(struct __test_metadata *_metadata, char *mapping,
+			int pagemap_fd, int kpageflags_fd)
+{
+	unsigned long pfn;
+	uint64_t flags;
+
+	ASSERT_EQ(mprotect(mapping + page_size, page_size, PROT_READ), 0);
+	ASSERT_EQ(mprotect(mapping + page_size, page_size,
+			   PROT_READ | PROT_WRITE), 0);
+	ASSERT_TRUE(check_huge_anon(mapping, pmd_size, 0, pmd_size));
+	if (kpageflags_fd < 0)
+		return;
+
+	pfn = pagemap_get_pfn(pagemap_fd, mapping);
+	ASSERT_NE(pfn, -1UL);
+	ASSERT_EQ(pageflags_get(pfn, kpageflags_fd, &flags), 0);
+	ASSERT_TRUE(flags & KPF_COMPOUND_HEAD);
+}
+
+static void assert_filled(struct __test_metadata *_metadata,
+			  const char *mapping, size_t size)
+{
+	size_t offset;
+
+	for (offset = 0; offset < size; offset += page_size) {
+		ASSERT_EQ(mapping[offset], 1)
+			TH_LOG("memory changed at offset %zu", offset);
+	}
+}
+
 /* Page out the range until its first page is swapped. */
 static bool pageout_until_swapped(struct __test_metadata *_metadata,
 				  char *mapping, size_t size, int pagemap_fd)
@@ -91,6 +203,11 @@ static void pin_to_current_cpu(struct __test_metadata *_metadata)
 	ASSERT_EQ(sched_setaffinity(0, sizeof(mask), &mask), 0);
 }
 
+static bool page_is_present(int pagemap_fd, char *addr)
+{
+	return pagemap_get_entry(pagemap_fd, addr) & PM_PRESENT;
+}
+
 /* Map a shared mapping of an unlinked, zero-filled temporary file. */
 static char *map_temp_file(struct __test_metadata *_metadata, size_t size)
 {
@@ -405,4 +522,121 @@ TEST_F(madvise, pageout_skips_unevictable_page)
 	ASSERT_EQ(shmdt(mapping), 0);
 }
 
+/* MADV_PAGEOUT of a whole THP must swap it without corrupting it. */
+TEST_F(madvise, pageout_swaps_thp)
+{
+	char *mapping;
+
+	mapping = map_thp(_metadata);
+	if (!mapping)
+		SKIP(return, "could not allocate a PMD-sized THP");
+
+	if (!pageout_until_swapped(_metadata, mapping, pmd_size,
+				   self->pagemap_fd))
+		SKIP(return, "MADV_PAGEOUT did not swap the THP");
+	assert_filled(_metadata, mapping, pmd_size);
+
+	ASSERT_EQ(munmap(mapping, pmd_size), 0);
+}
+
+/*
+ * MADV_PAGEOUT must not reclaim pages outside the advised range. kswapd or
+ * page migration could also unmap them, but neither should happen when the
+ * selftests run by themselves.
+ */
+TEST_F(madvise, pageout_stays_within_range)
+{
+	char *mapping;
+
+	mapping = mmap(NULL, 3 * page_size, PROT_READ | PROT_WRITE,
+		       MAP_PRIVATE | MAP_ANONYMOUS, -1, 0);
+	ASSERT_NE(mapping, MAP_FAILED);
+	memset(mapping, 1, 3 * page_size);
+	if (!pageout_until_swapped(_metadata, mapping + page_size, page_size,
+				   self->pagemap_fd))
+		SKIP(return, "MADV_PAGEOUT did not swap the page");
+
+	ASSERT_TRUE(page_is_present(self->pagemap_fd, mapping));
+	ASSERT_TRUE(page_is_present(self->pagemap_fd, mapping + 2 * page_size));
+	assert_filled(_metadata, mapping, 3 * page_size);
+
+	ASSERT_EQ(munmap(mapping, 3 * page_size), 0);
+}
+
+/*
+ * MADV_PAGEOUT must not reclaim the unadvised half of a THP: the THP must be
+ * split before reclaim, or skipped. See pageout_stays_within_range about
+ * other unmapping.
+ */
+static void pageout_half_thp(struct __test_metadata *_metadata, char *mapping,
+			     int pagemap_fd)
+{
+	size_t offset;
+
+	if (!pageout_until_swapped(_metadata, mapping, pmd_size / 2,
+				   pagemap_fd))
+		SKIP(return, "MADV_PAGEOUT did not swap the advised half");
+
+	for (offset = pmd_size / 2; offset < pmd_size; offset += page_size)
+		ASSERT_TRUE(page_is_present(pagemap_fd, mapping + offset));
+	assert_filled(_metadata, mapping, pmd_size);
+}
+
+TEST_F(madvise, pageout_stays_within_pmd_mapped_thp)
+{
+	char *mapping;
+
+	mapping = map_thp(_metadata);
+	if (!mapping)
+		SKIP(return, "could not allocate a PMD-sized THP");
+
+	pageout_half_thp(_metadata, mapping, self->pagemap_fd);
+
+	ASSERT_EQ(munmap(mapping, pmd_size), 0);
+}
+
+TEST_F(madvise, pageout_stays_within_pte_mapped_thp)
+{
+	char *mapping;
+
+	mapping = map_thp(_metadata);
+	if (!mapping)
+		SKIP(return, "could not allocate a PMD-sized THP");
+	pte_map_thp(_metadata, mapping, self->pagemap_fd, self->kpageflags_fd);
+
+	pageout_half_thp(_metadata, mapping, self->pagemap_fd);
+
+	ASSERT_EQ(munmap(mapping, pmd_size), 0);
+}
+
+/* MADV_COLD on part of a THP may split it, but must not change it. */
+TEST_F(madvise, cold_preserves_half_of_pmd_mapped_thp)
+{
+	char *mapping;
+
+	mapping = map_thp(_metadata);
+	if (!mapping)
+		SKIP(return, "could not allocate a PMD-sized THP");
+
+	ASSERT_EQ(madvise(mapping, pmd_size / 2, MADV_COLD), 0);
+	assert_filled(_metadata, mapping, pmd_size);
+
+	ASSERT_EQ(munmap(mapping, pmd_size), 0);
+}
+
+TEST_F(madvise, cold_preserves_half_of_pte_mapped_thp)
+{
+	char *mapping;
+
+	mapping = map_thp(_metadata);
+	if (!mapping)
+		SKIP(return, "could not allocate a PMD-sized THP");
+	pte_map_thp(_metadata, mapping, self->pagemap_fd, self->kpageflags_fd);
+
+	ASSERT_EQ(madvise(mapping, pmd_size / 2, MADV_COLD), 0);
+	assert_filled(_metadata, mapping, pmd_size);
+
+	ASSERT_EQ(munmap(mapping, pmd_size), 0);
+}
+
 TEST_HARNESS_MAIN
-- 
2.56.0

