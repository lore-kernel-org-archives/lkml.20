Received: from mta0.migadu.com (out-12.mta0.migadu.com [91.218.175.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4E57331EBD
	for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 16:35:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791736541; cv=none; b=oa5oX5GHbMInHnYNIMBc1pSJ7udvo09WJdfRbu3xy3mRX+mxRyOYhvYj1HUhgbADK7BteI7rnGlklWcXlYxxczJFN1CQJZOZLHf8BaUecZz0JRUdggMwHLivQdVBXTxj8WxcPtnJidsvTyUWdAmf2ZChBJRBOhYV0WyzMTiwKYk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791736541; c=relaxed/simple;
	bh=+gn9/2Bwxj4iX6rrRLRwzG9R3E2EKBjO0B+oBS9nPDw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=HFPeKRg3YULazBT/nPJZzg4pI2xMj5RBZpCrJivJVjBPdEl0ZWt/Cn+Be4+tg2bgSryREDZsVq4eniqsDvuts5ceB977w40clxKKLly6cQFIGMWUkOV8/Mv5mrzOHe6hG0M31QS+xvKn8BcnftHqiqlMpNtXL9b+JgXrubsJI7I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=mwPPj2pF; arc=none smtp.client-ip=91.218.175.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="mwPPj2pF"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=+gn9/2Bwxj4iX6rrRLRwzG9R3E2EKBjO0B+oBS9nPDw=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1791736535; v=1; x=1792341335;
 b=mwPPj2pFB5DKGLBu3jh+gT4BrpnqWwJODEZmBfuRg+zp6ivXF8isgzDfskZK8Cs79ZOBeVPS
 1KPp8doKmBzelzO7kh+bWHA6W3o0xedcKMB/e/fP9Qw2KMZ+F8m0BqIu6CvI8/AKVjP+NfZnK1/
 8n9itD8Xl1rBbCyMR98t7ZPY=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id ae541d04c9977309;
	Sun, 11 Oct 2026 16:35:35 +0000
X-Mizu-Trace-ID: ae541d04c9977309
X-Migadu-Flow: FLOW_OUT
From: Zenghui Yu <zenghui.yu@linux.dev>
To: linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Cc: akpm@linux-foundation.org,
	rppt@kernel.org,
	peterx@redhat.com,
	david@kernel.org,
	ljs@kernel.org,
	liam@infradead.org,
	vbabka@kernel.org,
	surenb@google.com,
	mhocko@suse.com,
	"Zenghui Yu (Huawei)" <zenghui.yu@linux.dev>
Subject: [PATCH] selftests/mm: fix uffd move-pmd test crash on 64K base page systems
Date: Mon, 12 Oct 2026 00:35:27 +0800
Message-ID: <20261011163527.95988-1-zenghui.yu@linux.dev>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "Zenghui Yu (Huawei)" <zenghui.yu@linux.dev>

uffd_move_pmd_test()/uffd_move_test_common() splits the test area into
chunks of chunk_size and moves them one by one.  On arm64 with 64K base
pages the chunk_size (read_pmd_pagesize()) is 512MB, which is larger than
the whole 32MB (UFFD_TEST_MEM_SIZE) test area:

  step_count = nr_pages / (chunk_size / page_size) == 0

Because chunk_size > page_size, the test then aligns both areas up to
512MB, which points far outside of the 32MB mappings, and decrements
step_count, which underflows to ULONG_MAX.  The verification loop then
runs away and the first dereference of area_src faults with a SIGSEGV.

Skip the test when a single chunk cannot fit into the test area.

Fixes: a2bf6a9ca805 ("selftests/mm: add UFFDIO_MOVE ioctl test")
Signed-off-by: Zenghui Yu (Huawei) <zenghui.yu@linux.dev>
---
 tools/testing/selftests/mm/uffd-unit-tests.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/tools/testing/selftests/mm/uffd-unit-tests.c b/tools/testing/selftests/mm/uffd-unit-tests.c
index ef9b3956bdcf..2a97ba1d6feb 100644
--- a/tools/testing/selftests/mm/uffd-unit-tests.c
+++ b/tools/testing/selftests/mm/uffd-unit-tests.c
@@ -1937,6 +1937,11 @@ uffd_move_test_common(uffd_global_test_opts_t *gopts,
 
 	args.gopts = gopts;
 
+	if (chunk_size > gopts->nr_pages * gopts->page_size) {
+		uffd_test_skip("chunk size does not fit in the test area");
+		return;
+	}
+
 	/* Prevent source pages from being mapped more than once */
 	if (madvise(gopts->area_src, gopts->nr_pages * gopts->page_size, MADV_DONTFORK))
 		err("madvise(MADV_DONTFORK) failure");
-- 
2.53.0

