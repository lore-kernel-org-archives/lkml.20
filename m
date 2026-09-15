Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FCA93F4107
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 15:16:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789485389; cv=none; b=p3IKrKJnnpW7tvaoEXHjUCXWelqDm33EAKAPGVq218hnwMLD8ezgblDJDrb0jcr0KPqssP+XajywO7yJ01mnHJCpeNUjGYw5b90VkcvPJ7nlvwxS1kLUkMgeneitW05oGw3zIPfuN8OIi39blU1qGEAvPkgstM0hILiNHApbtik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789485389; c=relaxed/simple;
	bh=ROX/NZoJ0Yun5NqYbfi84Llo8lUeua9+0fOa6pSBguE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qA02cFvljGsnaT/S3rabJ5FUocHle9wtLMCKO+PCJXk828Do8Rf6AUh5TdyfAcQZjB83aKnnQvvuuACCFqrWNVkTGpDE4JNVOKiL0ddbi242xafQGI+qLvzmOhbZoF+q0IOqa+xjbY+H9FhYvIPmY0cqsavcb/cD4mcWn2O8xjw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=nC9IA8+f; arc=none smtp.client-ip=117.135.210.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="nC9IA8+f"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=DU
	V0qCujnR7jWHBaxK501gzxqQAOmB8+/waa59ibNAo=; b=nC9IA8+fgnp4jEwOZJ
	DYHAny8HHu0tA3npvXPX41a8ZLTtxmknXGmZGu62lTlIXVODecETdYWEqC5ku4fr
	RKQ06VpqzER0bCTgb7FMDXqn96JNE4uGeqD/1iHUMCxXFXMbdyRYkWQu2gkt4tWY
	QLi3zXT61hqaoNImfIbpP2Cy0=
Received: from VM-0-3-ubuntu.. (unknown [])
	by gzga-smtp-mtada-g0-1 (Coremail) with SMTP id _____wAn2xWOYKlqc0VUAw--.40469S9;
	Tue, 15 Sep 2026 23:13:22 +0800 (CST)
From: Longlong Xia <xialonglong2025@163.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	linux-mm@kvack.org
Cc: Longlong Xia <xialonglong@kylinos.cn>,
	David Hildenbrand <david@kernel.org>,
	Xu Xin <xu.xin@linux.dev>,
	Chengming Zhou <chengming.zhou@linux.dev>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 07/14] mm/ksm: reuse the zero page pointer for merge tracing
Date: Tue, 15 Sep 2026 23:12:21 +0800
Message-ID: <20260915151236.5200-8-xialonglong2025@163.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260915151236.5200-1-xialonglong2025@163.com>
References: <20260915151236.5200-1-xialonglong2025@163.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wAn2xWOYKlqc0VUAw--.40469S9
X-Coremail-Antispam: 1Uf129KBjvJXoWruFWDZFWxWryDGFy8Gr43GFg_yoW8Jr45pa
	92yFWUur47JrWxZrWxZw4kZr43ta98KayxJrWUt398A3sxtry2yFWfKFW8Cr10qryfA3ya
	kF4UAF1xKr45A37anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07j2RRiUUUUU=
X-CM-SenderInfo: x0ldz0pqjo00rjsqjki6rwjhhfrp/xtbC+BJBOmqpYJJV-AAA3J

From: Longlong Xia <xialonglong@kylinos.cn>

Cache ZERO_PAGE() in try_to_merge_with_zero_page() for use by both the
merge attempt and its tracepoint.

No functional change intended.

Assisted-by: Zcode:GLM-5.3
Signed-off-by: Longlong Xia <xialonglong@kylinos.cn>

---
 mm/ksm.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/mm/ksm.c b/mm/ksm.c
index 78040ed99ccf..7fc9dac5d67c 100644
--- a/mm/ksm.c
+++ b/mm/ksm.c
@@ -1580,15 +1580,14 @@ static int try_to_merge_with_zero_page(struct ksm_rmap_item *rmap_item,
 	 */
 	if (ksm_use_zero_pages && (rmap_item->oldchecksum == zero_checksum)) {
 		struct vm_area_struct *vma;
+		struct page *zero_page = ZERO_PAGE(rmap_item->address);
 
 		mmap_read_lock(mm);
 		vma = find_mergeable_vma(mm, rmap_item->address);
 		if (vma) {
-			err = try_to_merge_one_page(vma, page,
-					ZERO_PAGE(rmap_item->address));
-			trace_ksm_merge_one_page(
-				page_to_pfn(ZERO_PAGE(rmap_item->address)),
-				rmap_item, mm, err);
+			err = try_to_merge_one_page(vma, page, zero_page);
+			trace_ksm_merge_one_page(page_to_pfn(zero_page),
+						 rmap_item, mm, err);
 		} else {
 			/*
 			 * If the vma is out of date, we do not need to
-- 
2.43.0

