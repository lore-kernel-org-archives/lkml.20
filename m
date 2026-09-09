Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78509331EBE
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 02:36:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788921404; cv=none; b=GkdiSzJ/UD94fRNEuEDQtnu56tcIKA0vW/18ooJpBifj5R2Mlm8VdfQb68AYXCjNvU04eciL8p1BGgC4yIudBrKxBabhHimpxTTziEyxYn+E7BtVxEX+3Z/A4wh+vLnKswLkZojUsDedqRvqU+O874Zm1pGfS1Y86BZxvpmfJ60=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788921404; c=relaxed/simple;
	bh=YuS/5Fo7C95mugHRqUJPea8gdiCg8mTCok24xWc9Mko=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=QVISvswkILE9Pg/kv6FOffIbVsSmlgGQ2XPyhRKBtrfUF6HNyDvZEyUuXR4TnrDmoPB/5HUJhN33Gh597iBjIIGPxAEJmFhRwVewJoI4xtj/SbImZQD+Y37ft0ffWU1+qejYiS8e1EltnDWo/hizK8sdDEsNh1PwuisUI3dBbWM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=pu3+x7ze; arc=none smtp.client-ip=220.197.31.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="pu3+x7ze"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=3X
	7M8wd36LdkjWaRhem4HHD64AbWVsJuXoeZADo2jJE=; b=pu3+x7ze/ba44xU2s1
	QGQt/R5WsHwZiLHtTfXTFqYHE1Q0SbZwy4ZGgE7IIoce1t6SOYxzAFcYBQNLfKqw
	+U9AYyBFEzQ4Tu73QMImvHUDXHePQRnnN9ktFkRRJtIQYNc0aYoaNV5aRsEt4PjN
	s/fdtd5GrJ3bQoRe4wNhuix90=
Received: from XLL-9950X.localdomain (unknown [])
	by gzga-smtp-mtada-g1-0 (Coremail) with SMTP id _____wB38SYOxqBq_1b3BQ--.26192S2;
	Wed, 09 Sep 2026 10:36:00 +0800 (CST)
From: Longlong Xia <xialonglong2025@163.com>
To: akpm@linux-foundation.org,
	david@kernel.org,
	linux-mm@kvack.org
Cc: xu.xin16@zte.com.cn,
	chengming.zhou@linux.dev,
	linux-kernel@vger.kernel.org,
	Longlong Xia <xialonglong@kylinos.cn>
Subject: [PATCH 1/1] mm/ksm: trylock the mmap lock in the unstable tree walk
Date: Wed,  9 Sep 2026 10:35:07 +0800
Message-ID: <20260909023507.1408925-1-xialonglong2025@163.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wB38SYOxqBq_1b3BQ--.26192S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxCrW7Kw15uF4Dur4fur48WFg_yoW5Jw4xpF
	y7Ka4jkr48Jr15u3s2ya1kuFW5u3s7KFZxG3yfta43Arn8JwnrGrWftFy8WF1UWF1Skws0
	vr4jva4DKayDXaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07joGQDUUUUU=
X-CM-SenderInfo: x0ldz0pqjo00rjsqjki6rwjhhfrp/xtbC9xB4cWqgxhCKNQAA3N

From: Longlong Xia <xialonglong@kylinos.cn>

Every node that unstable_tree_search_insert() descends through is
revalidated by get_mergeable_page(), which takes the mmap_read_lock
of the mm the node's rmap_item belongs to. These are taken while
ksmd holds ksm_thread_mutex, so a single mm whose mmap lock is
being written to - a process busily mmap'ing or munmap'ing -
stalls the whole scanner, for every KSM user on the system.

Use mmap_read_trylock() instead. The trade-off is that pages of a
contended mm may need more full scans to merge; in return, ksmd
latency no longer depends on unrelated mmap activity of the
scanned processes.

Testing, on a 4 vCPU QEMU x86_64 guest with ksmd at
pages_to_scan=100000 and sleep_millisecs=0, 5 runs per kernel
(median reported; baseline is the parent commit):

1. A contender process registers a 64 MiB MADV_MERGEABLE area of
   unique pages and runs two threads looping mmap/munmap of
   256 MiB, so its mmap lock is held for writing much of the
   time.
2. Once that churn is running, a quiet victim process registers
   32 MiB of 2048 unique pages duplicated 4 times.
3. Sample /sys/kernel/mm/ksm counters and ksmd's /proc stats
   every 0.5 s for ~2 min of churn, then stop the churn and
   sample until the victim finishes merging.  The same phases
   run without the churn as an uncontended control.

Results (median of 5 runs):

- contended ksmd scan rate: 11,473 -> 58,397 pages/s (5.1x)
- contended victim merge time: 10.4 s -> 1.7 s; the contended
- contended ksmd CPU per scanned page: 13.4 us -> 3.5 us
- ksmd time in uninterruptible sleep under churn: 78% -> 57%;
- uncontended (control): merge time 0.65s vs 0.62s, scan rate
  259K vs 247K pages/s and ksmd CPU 3.9 vs 4.0 us per page,
  unchanged within ~5%.

Assisted-by: Zcode:GLM-5.3
Signed-off-by: Longlong Xia <xialonglong@kylinos.cn>
---
 mm/ksm.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/mm/ksm.c b/mm/ksm.c
index 49d48d1e0998..3cfb09a926ff 100644
--- a/mm/ksm.c
+++ b/mm/ksm.c
@@ -820,7 +820,14 @@ static struct page *get_mergeable_page(struct ksm_rmap_item *rmap_item)
 	struct folio_walk fw;
 	struct folio *folio;
 
-	mmap_read_lock(mm);
+	/*
+	 * We trylock because we don't want ksmd to wait for an mm that is
+	 * busy changing its memory layout: we prefer to skip this page and
+	 * let the next full scan retry it, like the folio trylock in
+	 * try_to_merge_one_page().
+	 */
+	if (!mmap_read_trylock(mm))
+		return NULL;
 	vma = find_mergeable_vma(mm, addr);
 	if (!vma)
 		goto out;
-- 
2.43.0

