Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=117.135.210.5
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793418050;
	b=rBy3Jw+aw9HwHSQH4Chv3QZ26fj1ixSrJKB7CgUs3aKRWCcsjK0kH33xhzvjAcACjJ2/
	 hmkpg6bEKYBD8XNYWEt5xaW0vZD1yJIukmYC20/2EWffgJ03XCibZiBp1+sFYUAWNtRE6
	 leTiB2RiDFvo0Ed/ou5+ftMhwZdkUhFLPXWx/kbp3U6Dt8GFmwLa+Aq5sw/OFycXifO+r
	 QKkHWJqOw4BLyiAZ51iZdNb7oIhq3okGowod4/FHtwAWQrkYOQ3cdDj7d+v0lTjrZhlas
	 vGqLpmxgIK+b8oHNTcJnJKCOga5OwNxE2YrcUuLckHOl/QpXBRzvZ0mpHLv68CvYPCg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793418050;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 X-CM-TRANSID:X-Coremail-Antispam:X-CM-SenderInfo;
	bh=3dxr/8PguZyVf6pN+W3kq1oumxAvIQqUFP4HyBpPUZE=;
	b=ZPqDhgZsD5utGR27N1rDhN3W6PGl84PhcSLsJ1jcNoS/6v43bfq4UgXghjlh3s8fDvig
	 8O02DWshwEurvFQquROA9Lx/EwOsG3DtIbRz98EI9GFa3qx45vxTmcYEnCx+g7EPL4cMS
	 0LpclQJlbMy19mZfWBmCOM1dampIskEKsISsv3WtIuO6IrFfdcYPciNw18cAv96Um7VqW
	 JmAnamsTLi8AAyCdQY4Wae+LuipotTopSPkl9X8ynRDmUR6okwfaEqbbUHuTlxike5z2U
	 uJcA4u8W2O7OAwzlB4pUNSdYm4aQoPaEh2rakwMyKe2EdQNgBVx+xALX/HW8fT5+oBg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=163.com;
	spf=pass smtp.mailfrom=163.com;
	dkim=pass header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=fgNvs0zJ;
	arc=none smtp.remote-ip=117.135.210.5
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E0ED606A31A
	for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 03:40:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1E0ED606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=fgNvs0zJ
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=3d
	xr/8PguZyVf6pN+W3kq1oumxAvIQqUFP4HyBpPUZE=; b=fgNvs0zJrvIGtohxFr
	CsL6UX4hjr80NCesA+JgmEZRg2u2FGK907w/Kbh2pc/7ZrI7bmyzrzy6sIVnSe5x
	0fmlxlYj3X/9RYw3ozXlT5vbmtqzDfdOpKhe5jW96DjY4kisxKSRAuvRAikWvRSi
	fiHftYjjNihkJoe8/kTbzYCTw=
Received: from mm (unknown [])
	by gzga-smtp-mtada-g0-1 (Coremail) with SMTP id _____wD3fxX7YuVqwv03EA--.41986S2;
	Sat, 31 Oct 2026 11:39:46 +0800 (CST)
From: Qi Xi <xiqi5703@163.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	linux-mm@kvack.org
Cc: David Hildenbrand <david@kernel.org>,
	Zi Yan <ziy@nvidia.com>,
	Matthew Brost <matthew.brost@intel.com>,
	Joshua Hahn <joshua.hahnjy@gmail.com>,
	Byungchul Park <byungchul@sk.com>,
	Gregory Price <gourry@gourry.net>,
	Ying Huang <ying.huang@linux.alibaba.com>,
	Alistair Popple <apopple@nvidia.com>,
	Qiliang Yuan <odys.yuan@gmail.com>,
	linux-kernel@vger.kernel.org,
	wangkefeng.wang@huawei.com,
	sunnanyong@huawei.com,
	xiqi2@huawei.com
Subject: [PATCH] mm/migrate: fix softlockup in do_pages_stat() with huge page arrays
Date: Sat, 31 Oct 2026 11:33:30 +0800
Message-ID: <20261031033330.3416326-1-xiqi5703@163.com>
X-Mailer: git-send-email 2.53.0
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
X-CM-TRANSID:_____wD3fxX7YuVqwv03EA--.41986S2
X-Coremail-Antispam: 1Uf129KBjvdXoWruw43uFykCr48tr48Wr4UJwb_yoWDWwb_Zw
	4rKr1xCr4kXF1IyF9xAws3X3W3ta48GFWDAw4jqrW7AFy8AFyvqFW0vF98WryDZFZrCFZ0
	kwn2qw4q9r9YkjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IU0YLvJUUUUU==
X-CM-SenderInfo: 50ltxkqxqtqiywtou0bp/xtbC7QLsI2rlYwJtqQAA3K

From: Qi Xi <xiqi2@huawei.com>

do_pages_stat() walks the user page array in 16-page chunks but never
reschedules, so a huge nr_pages can hold a CPU past the watchdog
threshold on non-preemptible kernels. Add cond_resched() to the loop so
long move_pages() node-query calls yield periodically.

With KASAN and function tracing enabled, a move_pages() node query
(nodes == NULL) over 10 million page entries (~40GB) can trigger the
softlockup on a PREEMPT_NONE kernel.

Fixes: 80bba1290ab5 ("mm: no get_user/put_user while holding mmap_sem in do_pages_stat?")
Signed-off-by: Qi Xi <xiqi2@huawei.com>
---
 mm/migrate.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/mm/migrate.c b/mm/migrate.c
index 7bdcdb57652f..6c2371020cc5 100644
--- a/mm/migrate.c
+++ b/mm/migrate.c
@@ -2545,6 +2545,7 @@ static int do_pages_stat(struct mm_struct *mm, unsigned long nr_pages,
 
 		chunk_offset += chunk_nr;
 		nr_pages -= chunk_nr;
+		cond_resched();
 	}
 	return nr_pages ? -EFAULT : 0;
 }
-- 
2.53.0

