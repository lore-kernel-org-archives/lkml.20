Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E3E24D9F7E
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 14:35:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792161325; cv=none; b=u7M/Iy8Qa2tuDTYQriMVB7nfriezOmp4K3bBFwdUJu8OsCHX943gL+833V+VkgRDoJ37AxmGbJCuuZBt9/O/GVPFVjn6t/hP4GcahYaNrrpI3VU85ryFGdYbtbYGB8Qn/qwHOLsoPLGMeuK8Ra2nUryIEBYgUyvKichxuluBtxA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792161325; c=relaxed/simple;
	bh=jfH/5nDXFBBYY1yRei31P++B9MGbaA0B0jygAz20OZ8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LrgSW89IYvBMIOfAi5UGxqbG9iLK92fj3B3pt1r6489fQh85yzD7HHppzabLGE9nw6KbXIaBE52yjo8ZaeFGFKFZ/zq79/h15n/cYML5K8PtBNEbtNcQzEfhVhPNVVCzXIrGOzYPO1xHNTA6A4wd4Jw8VZlfnRkpqmnSv0YnkYw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=K9r5OmDl; arc=none smtp.client-ip=74.125.82.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="K9r5OmDl"
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-35aa0cf7c40so6910377eec.1
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 07:35:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792161322; x=1792766122; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=G6Q8gG4c/qnKlMaH5pfvOOdUUEduyYXPZR3420tP37o=;
        b=K9r5OmDlKe8FvjPj6F4S67o9Uq41Z+LSiq7ddqIAkUbR9LRiN1QRgHWKsChvAHM2yZ
         6w35N8J6zFmnZ91HxFhK9RNNhTA/hsK4U4vZCknNP7vCQNg1DEtGyinTuc7u6rrCB6yv
         YzWqrDy3UO0SzvA7sy2HDvAtG4c9xHDOeHBQOzG2qpyfaZU8boAUpAc7NwUGf/BS727U
         KwlPUxuBntNtDMA9UfnyT91YO7du9IxNOqLtQiu+qk8YJBYzr0z27OW44QvGjTT+vQpX
         U/3YVU33iUYs8qmHw4vlvC5KkCdQHRAFOjNFn9cz7ymfdBiLYbH9r/AzgvpbuFMpGYzh
         /8yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792161322; x=1792766122;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=G6Q8gG4c/qnKlMaH5pfvOOdUUEduyYXPZR3420tP37o=;
        b=nz9ANPRz98mQDExYM1eYQV8nR40E+X5QQpPEZE2XeoWrfzGk19vzh1WMWzoCDCyK82
         6tNqFEbTGUzsDpMYUt/imXTnAw9/AYAfzTfsX2JGh/kRJYv9Zdh5UlckuRJOAe+4K3+R
         f6NFFgXRpzXoXIm+uHCJ72ro8fpIqwnNKsRn/kRdHvRtdjT2GV50S6pEO6r5RzsRopSc
         gbm6FWJChJBxmX5EfI7zCqP6tuyUZkC3Pnvdd3NaLMuitEYaAQUlKWT3mYBma9hiAyeo
         7N5mzyBiBFuSM9FAKaU2Y9S9XOV9NOD0DKUj2lJxgK2jiBXGOUNrTxuU1z065Dl5luMN
         GaUQ==
X-Forwarded-Encrypted: i=1; AKwUvBweDGhKhSi3xmkjL6AMMfP0gkbRSZLfYIEALsKl4NdvIzv4Ow8jrjhfd7W2xmU5x6IpO6bDNtdPutkFEPg=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ/l1gp9LxV49TpqR3Vfmt4vIFsTkhqlWChCNFpygfI4yEcmkLs
	YejqKixzDA/7rlVPyfDHdr1brCLjTuzG2ea5/GoCuhdzPs098h/VUM9D
X-Gm-Gg: AYBFou1r9bCRu1fTzckrpkKXg6UhtuA4eYGYWGRmDqjPpbmziJ0vA13uEttniXJKQv7
	1tdc04Xg4KFAEz6gm2RnKSBK1QtLkmmwFZlrTYyDcqeFBRMkJ/tN93F6KbsWxmQi0BIdVTMRkxN
	7LIhbCGr2B2bbEX58ERf0cp09qAUE11wx9ghbGvZU5bc09hJdOX9Br72mOd8H1Xmpu0+K2yybBL
	TLLSBGZkZTLfcW/HgsqywLr+Hg6vPdcm2xfr+2RmFlXQFaVhDE7MDsWN9hc+ZbuApDYVVRLunGF
	GIrDvOgnI5FwnjActMDvfxKdR1Xozlj+tIQuUYHRpcERCtHtEy/mxqEU2YqR0t6zw5OkkOWcCJC
	6drguNSarOJYS+NKfksbZAG2ac9sLUQtOadzDHh+kQRlxkwUeU26mgJXyNnALjp4i5+Vg4yH3j+
	tQW569BFVNvhzp888l8BcXpkqnh/w4+9zZAObUx62qbeFGcDT0V7cEEJ7RHdyAR5ci1g==
X-Received: by 2002:a05:7301:da84:b0:35d:3370:d8e7 with SMTP id 5a478bee46e88-3619ed12158mr57587eec.2.1792161318630;
        Fri, 16 Oct 2026 07:35:18 -0700 (PDT)
Received: from [127.0.1.1] ([23.254.208.9])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3608297f4f7sm7611812eec.23.2026.10.16.07.35.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 07:35:18 -0700 (PDT)
From: Qiliang Yuan <odys.yuan@gmail.com>
Date: Fri, 16 Oct 2026 22:34:57 +0800
Subject: [PATCH 2/2] selftests/mm: cover merging KSM pages aged by smart
 scan
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261016-bug-mm-ksm-smart-scan-align-skips-v1-2-2f91d76416be@gmail.com>
References: <20261016-bug-mm-ksm-smart-scan-align-skips-v1-0-2f91d76416be@gmail.com>
In-Reply-To: <20261016-bug-mm-ksm-smart-scan-align-skips-v1-0-2f91d76416be@gmail.com>
To: Andrew Morton <akpm@linux-foundation.org>, 
 David Hildenbrand <david@kernel.org>, Xu Xin <xu.xin@linux.dev>, 
 Chengming Zhou <chengming.zhou@linux.dev>, Stefan Roesch <shr@devkernel.io>, 
 Lorenzo Stoakes <ljs@kernel.org>, "Liam R. Howlett" <liam@infradead.org>, 
 Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>, 
 Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, 
 Shuah Khan <shuah@kernel.org>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, Qiliang Yuan <odys.yuan@gmail.com>
X-Mailer: b4 0.13.0

ksm_functional_tests checks merging and unmerging with ksmd's default
settings, but nothing there exercises smart scan, which skips pages KSM
has failed to merge for a while.

Smart scan used to time those skips per page, so two identical pages
that became mergeable some scans apart could end up never being looked
at in the same scan, and were never merged. "mm/ksm: align smart scan
skips with the scan number" fixed that.

Add a case that lets sixteen unique pages age for a dozen scans, then
makes a duplicate of each mergeable one scan apart, and expects every
pair to be merged 32 scans later:

  kernel               failures
  before the fix       20/20
  with the fix          0/20

Signed-off-by: Qiliang Yuan <odys.yuan@gmail.com>
---
 tools/testing/selftests/mm/ksm_functional_tests.c | 108 +++++++++++++++++++++-
 1 file changed, 107 insertions(+), 1 deletion(-)

diff --git a/tools/testing/selftests/mm/ksm_functional_tests.c b/tools/testing/selftests/mm/ksm_functional_tests.c
index 31c06c72203fd..71d9b3cbdb8c1 100644
--- a/tools/testing/selftests/mm/ksm_functional_tests.c
+++ b/tools/testing/selftests/mm/ksm_functional_tests.c
@@ -695,6 +695,111 @@ static void test_fork_ksm_merging_page_count(void)
 	munmap(map, size);
 }
 
+static int ksm_wait_full_scans(long nr)
+{
+	long start, cur;
+
+	start = ksm_get_full_scans();
+	if (start < 0)
+		return start;
+	do {
+		cur = ksm_get_full_scans();
+		if (cur < 0)
+			return cur;
+	} while (cur < start + nr);
+
+	return 0;
+}
+
+static void test_merge_aged_pairs(void)
+{
+	const unsigned int pairs = 16;
+	const unsigned long size = 2 * pairs * pagesize;
+	char *map, old_smart_scan = '1';
+	int smart_scan_fd;
+	unsigned int i;
+
+	ksft_print_msg("[RUN] %s\n", __func__);
+
+	smart_scan_fd = open("/sys/kernel/mm/ksm/smart_scan", O_RDWR);
+	if (smart_scan_fd < 0) {
+		ksft_test_result_skip("smart_scan not supported\n");
+		return;
+	}
+	if (pread(smart_scan_fd, &old_smart_scan, 1, 0) != 1 ||
+	    pwrite(smart_scan_fd, "1", 1, 0) != 1) {
+		ksft_test_result_fail("Enabling smart_scan failed\n");
+		goto close_fd;
+	}
+
+	if (ksm_stop() < 0) {
+		ksft_test_result_fail("Disabling (unmerging) KSM failed\n");
+		goto restore;
+	}
+
+	map = mmap(NULL, size, PROT_READ | PROT_WRITE,
+		   MAP_PRIVATE | MAP_ANON, -1, 0);
+	if (map == MAP_FAILED) {
+		ksft_test_result_fail("mmap() failed\n");
+		goto restore;
+	}
+	if (madvise(map, size, MADV_NOHUGEPAGE) && errno != EINVAL) {
+		ksft_test_result_fail("MADV_NOHUGEPAGE failed\n");
+		goto unmap;
+	}
+
+	/*
+	 * Page i of the first half and page i of the second half form a
+	 * pair with content no other page shares.
+	 */
+	for (i = 0; i < pairs; i++) {
+		memset(map + i * pagesize, i + 1, pagesize);
+		memset(map + (pairs + i) * pagesize, i + 1, pagesize);
+	}
+
+	/* Let the first page of each pair age without a duplicate. */
+	if (madvise(map, size / 2, MADV_MERGEABLE)) {
+		ksft_test_result_fail("MADV_MERGEABLE failed\n");
+		goto unmap;
+	}
+	if (ksm_start() < 0 || ksm_wait_full_scans(12) < 0) {
+		ksft_test_result_fail("Running KSM failed\n");
+		goto unmap;
+	}
+
+	/*
+	 * Make the duplicates mergeable one scan apart so that each pair
+	 * starts out with a different distance in scans.
+	 */
+	for (i = 0; i < pairs; i++) {
+		if (madvise(map + (pairs + i) * pagesize, pagesize,
+			    MADV_MERGEABLE)) {
+			ksft_test_result_fail("MADV_MERGEABLE failed\n");
+			goto unmap;
+		}
+		if (ksm_wait_full_scans(1) < 0) {
+			ksft_test_result_fail("Running KSM failed\n");
+			goto unmap;
+		}
+	}
+
+	if (ksm_wait_full_scans(32) < 0) {
+		ksft_test_result_fail("Running KSM failed\n");
+		goto unmap;
+	}
+
+	ksft_test_result(ksm_get_self_merging_pages() == 2 * pairs,
+			 "Pages aged by smart scan got merged\n");
+unmap:
+	ksm_stop();
+	munmap(map, size);
+restore:
+	if (pwrite(smart_scan_fd, &old_smart_scan, 1, 0) != 1)
+		ksft_print_msg("Restoring smart_scan failed\n");
+close_fd:
+	close(smart_scan_fd);
+}
+
 static void init_global_file_handles(void)
 {
 	mem_fd = open("/proc/self/mem", O_RDWR);
@@ -720,7 +825,7 @@ static void init_global_file_handles(void)
 
 int main(int argc, char **argv)
 {
-	unsigned int tests = 9;
+	unsigned int tests = 10;
 	int err;
 
 	if (argc > 1 && !strcmp(argv[1], FORK_EXEC_CHILD_PRG_NAME)) {
@@ -753,6 +858,7 @@ int main(int argc, char **argv)
 	test_prctl_fork_exec();
 	test_prctl_unmerge();
 	test_fork_ksm_merging_page_count();
+	test_merge_aged_pairs();
 
 	err = ksft_get_fail_cnt();
 	if (err)

-- 
2.43.0

