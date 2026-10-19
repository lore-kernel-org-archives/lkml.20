Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792429938;
	b=EJ/Xff4zLfwnBWL+0bKPAMlSJNVOFmlbcpIrLRtJhNC1f4ZmBZzgknLm53B4uhPnGH9g
	 LmwGCANDjs0ry0g2/Fihpn5gosEpSrzK/zmAiUq5WbceAfXj1A3msZGtNZKLEfsfO1lJw
	 Yv8fpa0uv8DvCaBMZPALT9xgY6qzcU0x2XZqu4+Jua1ozZ0mVcYqBtvgzlO3cE9DorecK
	 5EcIHqABXfFxwbwhmC84/m/N6WLJyWsxN3pHNzddqMrGenZdjKuHI1vmROK2wxynGsZXR
	 qRjxhU3ZPbpHOvSSlM+GruKcGUHCC65DGpScqCVUEdhAPDjTZWWlRPQthVq+BCNFhgw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792429938;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=TjpbZTGan3B30P6ZyrSjX5pZ5tCnJRUq6rHSDYdsfAw=;
	b=sVCJIGehvhVioejhNiJDmD4dOHRE1OlZxU0MOSAbeHHyMMZmfc0lud8h23di9fujTzKl
	 zsI6YV4fcaIyNEiekpWC/D8cjeA+cG6g5dXQRChXOOZOUb96hMOhCrz5LmF1B/xDQiYXw
	 VXVCIKiobfJ9+OqpZTfqBdBMxLk+crVhsJBacl0LAiVhtLL3F+otbe7LmJD7dPRbveNKc
	 v3kQVBzGDCDm1G6n5inHkWdifNYl/uJ2wqS92GYdpzDvmy0QSSKVwPuNTEptW2ikn+SRF
	 PnRtrlrZVc0MWraFtQO1kCOaC5h6XEtazrxVgjt3ogSEu0cve5g/0fY2OGbIws599CQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=gourry.net;
	spf=pass smtp.mailfrom=gourry.net;
	dkim=pass header.d=gourry.net header.i=@gourry.net header.a=rsa-sha256 header.s=google header.b=f+Rj2LlI;
	arc=none smtp.remote-ip=209.85.160.181
Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80ED360A262A
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 17:12:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 80ED360A262A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gourry.net header.i=@gourry.net header.a=rsa-sha256 header.s=google header.b=f+Rj2LlI
Received: by mail-qt1-f181.google.com with SMTP id d75a77b69052e-53664b4860bso14070331cf.1
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 10:12:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1792429937; x=1793034737; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TjpbZTGan3B30P6ZyrSjX5pZ5tCnJRUq6rHSDYdsfAw=;
        b=f+Rj2LlIJ7Ib2ZLPAgwPRaMlrkj+ouHwCdgYOI3Dj2nGWcKEnBzJ+N6wckysF3gZl+
         b9i9opRR5koPDjQmDtBbArg+GiKUO3LbAMOt6WhQ5niQDXBtQkBCDtiRNNXd4lYk1y1F
         FLY6uCqgS6dgV94vXT3OdrugFx2umS+GCbbykTj9Ufdpi4sRhLk8ijKWSTrw6vuq4pKv
         WGj0e5o6KNfegrPFxc7RWZBQ3wg+urCWspTTSmMT1rhCMfL9S9JxVPxYRnwtdfpg3EHX
         xV9zqo5caL49ntO5iYH8C/3PxuylUpKoTCFvHzGyeriycCoN+hnPa0Oow3lwEmbnVRrk
         kF1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792429937; x=1793034737;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=TjpbZTGan3B30P6ZyrSjX5pZ5tCnJRUq6rHSDYdsfAw=;
        b=J3d7sxzEfdXFHYTMW1CDjAfqZhXfHaCtb4bNVt6v/1+qMdVQ5Tzck9yf9Sc3rdGCls
         II2qvxi/u0PQTIpCuYlohXOxey4zoNgoIQVFVFUqK+J8jMxR4gW9hN4EeVXJB1tXquhg
         Wfb3gZtEknEL7q1WfDgTMJDnXZLfiN7AqgtZACBbVq+61bFwovlrvGL+3sQNOjLT7OKC
         CaufLyGFokYJjsDUdxkyl8k1+o2LV17+wuasvbd0Fe8vDlYqTITTWD8j3BD/4qNPrBxa
         1aMHeVDrOEXfjEVeqe81etNMgWiumMJiO7RnfzJlHUfCJWXLWQNIP/5z07vMUW+3nIa9
         k2kg==
X-Forwarded-Encrypted: i=1; AKwUvBx1n1qS4kH5/vbdFENkYmuWIe68klSzkMGfKmFf3vo/LOki0HJR6tEBgELUeL2eHMsWV+qtg0NRTps28Xk=@vger.kernel.org
X-Gm-Message-State: AFq9FYKqJlZvCOpUfwfeaeq2LR4UY0Kkc1dxENvbulcL3lpn55XztzDx
	byG0IxgihbXA8Z73l15PRSBZAeUnQFNhfP282N57Ks3xzE+pV86KIdKgn+VjDLsz8oM=
X-Gm-Gg: AYBFou0gM9MiazG2ZHQ4rF6On3HQgq3qNSRSZakbNJgzzh8oaXm06qh0q/gG6seFEPw
	UwHtbb/Xvt2qSEXdvk0gpGoCB8oy53IgrQB7DqDnSPNOxbAeu4f19Wj5/ACf3ykF1B7Gx20/CgQ
	kiPD6SZGq3vSqrq9opIf0TMvy7Bn8Wndp3jb0lhPPBklAeSYe44wucBgapP3KhsABFQ284H+dd1
	YjSRQ0HxtioNl3fDb9vyj7XHa1RaUNxW5z2rv6a28MrSK1wyRlqLxpnreosshJJ9FdGqreQbNF6
	B7MUy1HvA8lRhTrHGW6n0guv1FVec/TO86gvuO3aguODBXFIeq9aeGvCYSy1Ky4m2We74TuLNmv
	O23D2kOnpjYO+YOYYinsi6iyTVmzR6JACmaBd1mSLjzJdT41/MFrYk5VyYn0BMuJF/AdsOFy9rD
	eOJDzzNN8CjMq92nqZz7BDwFC5bsmL/x5A0Rjiip7R/agat1cC9nU6J3OFmWpMW7q2xZqNEXzg8
	cDklh14pTSIaBo3ndTr1/QB/7AFS3KpaeS5rkPpJZnO2sy68HDE6/yB8OWb
X-Received: by 2002:a05:622a:514e:b0:530:42d4:4c9a with SMTP id d75a77b69052e-5364605937emr117819301cf.44.1792429936970;
        Mon, 19 Oct 2026 10:12:16 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F.lan (pool-173-79-60-52.washdc.fios.verizon.net. [173.79.60.52])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91c040d4cedsm723116d6.34.2026.10.19.10.12.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 10:12:16 -0700 (PDT)
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
	shuah@kernel.org,
	Sarthak Sharma <sarthak.sharma@arm.com>
Subject: [PATCH v3 5/7] selftests/mm: check MADV_COLD and MADV_PAGEOUT on partly advised THPs
Date: Mon, 19 Oct 2026 13:12:04 -0400
Message-ID: <20261019171206.3331374-6-gourry@gourry.net>
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

Check that paging out a whole PMD-mapped THP swaps it without corrupting
it, and that pages outside the range stay mapped after paging out a base
page or half of a PMD- or PTE-mapped THP.

Also check that MADV_COLD on half of either THP preserves its contents.

Tests skip when PMD-sized THPs cannot be allocated, and the MADV_PAGEOUT
tests also when MADV_PAGEOUT cannot swap. With /proc/kpageflags the
PTE-mapped cases also confirm that PTE-mapping left the folio large.

Signed-off-by: Gregory Price (Meta) <gourry@gourry.net>
Reviewed-by: Sarthak Sharma <sarthak.sharma@arm.com>
---
v3: Kept Sarthak's Reviewed-by; the MADV_PAGEOUT tests now skip only if
MADV_PAGEOUT cannot swap, and fail if reclaim then does not happen, as he
suggested for v2 7/8.
---
 .../testing/selftests/mm/madv_cold_pageout.c  | 238 ++++++++++++++++++
 1 file changed, 238 insertions(+)

diff --git a/tools/testing/selftests/mm/madv_cold_pageout.c b/tools/testing/selftests/mm/madv_cold_pageout.c
index 7d92f0ecbd27..b5eec490fb68 100644
--- a/tools/testing/selftests/mm/madv_cold_pageout.c
+++ b/tools/testing/selftests/mm/madv_cold_pageout.c
@@ -8,6 +8,7 @@
 #include <sched.h>
 #include <stdbool.h>
 #include <stdint.h>
+#include <string.h>
 #include <sys/ipc.h>
 #include <sys/mman.h>
 #include <sys/shm.h>
@@ -17,10 +18,15 @@
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
 /* Whether MADV_PAGEOUT can swap out anonymous memory, see main(). */
 static bool can_swap;
 
@@ -92,6 +98,111 @@ FIXTURE_TEARDOWN(madv_cold_pageout)
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
+ * Collapse a PMD-aligned range into PMD-mapped THPs, and confirm the result
+ * with check_huge(). MADV_COLLAPSE may fail transiently with EAGAIN.
+ */
+static bool collapse(char *mapping, size_t size,
+		     bool (*check_huge)(void *, size_t, int, uint64_t))
+{
+	int nr_hpages = size / pmd_size;
+	int retry;
+
+	for (retry = 0; retry < 10; retry++) {
+		if (madvise(mapping, size, MADV_COLLAPSE)) {
+			if (errno != EAGAIN)
+				return false;
+		} else if (check_huge(mapping, size, nr_hpages, pmd_size)) {
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
+	if (collapse(mapping, pmd_size, check_huge_anon))
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
 /* Page out the range until its first page is swapped, or madvise() fails. */
 static bool pageout_until_swapped(char *mapping, size_t size, int pagemap_fd)
 {
@@ -124,6 +235,11 @@ static bool pageout_until_unmapped(char *mapping, size_t size, int pagemap_fd)
 	return false;
 }
 
+static bool page_is_present(int pagemap_fd, char *addr)
+{
+	return pagemap_get_entry(pagemap_fd, addr) & PM_PRESENT;
+}
+
 /* Create an unlinked, zero-filled temporary file, or return -1. */
 static int create_temp_file(size_t size)
 {
@@ -452,6 +568,127 @@ TEST_F(madv_cold_pageout, pageout_skips_unevictable_page)
 	ASSERT_EQ(shmdt(mapping), 0);
 }
 
+/* MADV_PAGEOUT of a whole THP must swap it without corrupting it. */
+TEST_F(madv_cold_pageout, pageout_swaps_thp)
+{
+	char *mapping;
+
+	if (!can_swap)
+		SKIP(return, "MADV_PAGEOUT cannot swap");
+	mapping = map_thp(_metadata);
+	if (!mapping)
+		SKIP(return, "could not allocate a PMD-sized THP");
+
+	ASSERT_TRUE(pageout_until_swapped(mapping, pmd_size, self->pagemap_fd));
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
+TEST_F(madv_cold_pageout, pageout_stays_within_range)
+{
+	char *mapping;
+
+	if (!can_swap)
+		SKIP(return, "MADV_PAGEOUT cannot swap");
+	mapping = mmap(NULL, 3 * page_size, PROT_READ | PROT_WRITE,
+		       MAP_PRIVATE | MAP_ANONYMOUS, -1, 0);
+	ASSERT_NE(mapping, MAP_FAILED);
+	memset(mapping, 1, 3 * page_size);
+	ASSERT_TRUE(pageout_until_swapped(mapping + page_size, page_size,
+					  self->pagemap_fd));
+
+	ASSERT_TRUE(page_is_present(self->pagemap_fd, mapping));
+	ASSERT_TRUE(page_is_present(self->pagemap_fd, mapping + 2 * page_size));
+	assert_filled(_metadata, mapping, 3 * page_size);
+
+	ASSERT_EQ(munmap(mapping, 3 * page_size), 0);
+}
+
+/*
+ * MADV_PAGEOUT of half of a THP must split it, and reclaim only the advised
+ * half. See pageout_stays_within_range about other unmapping.
+ */
+static void pageout_half_thp(struct __test_metadata *_metadata, char *mapping,
+			     int pagemap_fd)
+{
+	size_t offset;
+
+	ASSERT_TRUE(pageout_until_swapped(mapping, pmd_size / 2, pagemap_fd));
+
+	for (offset = pmd_size / 2; offset < pmd_size; offset += page_size) {
+		ASSERT_TRUE(page_is_present(pagemap_fd, mapping + offset))
+			TH_LOG("page at offset %zu was unmapped", offset);
+	}
+	assert_filled(_metadata, mapping, pmd_size);
+}
+
+TEST_F(madv_cold_pageout, pageout_stays_within_pmd_mapped_thp)
+{
+	char *mapping;
+
+	if (!can_swap)
+		SKIP(return, "MADV_PAGEOUT cannot swap");
+	mapping = map_thp(_metadata);
+	if (!mapping)
+		SKIP(return, "could not allocate a PMD-sized THP");
+
+	pageout_half_thp(_metadata, mapping, self->pagemap_fd);
+
+	ASSERT_EQ(munmap(mapping, pmd_size), 0);
+}
+
+TEST_F(madv_cold_pageout, pageout_stays_within_pte_mapped_thp)
+{
+	char *mapping;
+
+	if (!can_swap)
+		SKIP(return, "MADV_PAGEOUT cannot swap");
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
+TEST_F(madv_cold_pageout, cold_preserves_half_of_pmd_mapped_thp)
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
+TEST_F(madv_cold_pageout, cold_preserves_half_of_pte_mapped_thp)
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
 /* Swap out an anonymous page, to see whether swap works at all. */
 static bool probe_swap(int pagemap_fd)
 {
@@ -474,6 +711,7 @@ int main(int argc, char **argv)
 	int pagemap_fd;
 
 	page_size = getpagesize();
+	pmd_size = read_pmd_pagesize();
 	/* The harness forks each test, which inherits this. */
 	pin_to_current_cpu();
 	/* Only root can reserve the page that hugetlb_vma_is_rejected maps. */
-- 
2.56.0

