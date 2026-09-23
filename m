Received: from out203-205-221-190.mail.qq.com (out203-205-221-190.mail.qq.com [203.205.221.190])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37EE537F012
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 02:29:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.205.221.190
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790130554; cv=none; b=s6tZUFZnuYqvKVYGvtaEk164kdAmLkUFvs6UKvtikikLA8Dx5miu6FBXcp6wV6nEtWzRRqof4q20uyu+Xjn6NoCM+9po3YnhpddTL1iHi7OZk2Um8K/PKxidnABO9C8renuX0d20B+i9/30ewB24+sQZ9Al/AW1l1zqawbugFSQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790130554; c=relaxed/simple;
	bh=yMEwt1rd72vvI7ix0NOlhWhW5Z9rtg3SFmOD3WjCF3w=;
	h=Message-ID:From:To:Cc:Subject:Date:MIME-Version; b=Wja1VscoxEvpv+eSr4ea2Nc17mCjVi57kPhlr+pOfTS9JRLTz71P2OxG16Us5C2XqYlzoesl43LAHOiWHJYUZ9Xv2obIHopAQlmwVJwi3QazN6Z7UTRaUzvQ6H7+1JNC5ETw37HCg6xl300J6Su/wPlSXYNmSMSEI9ZyDshpeN8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com; spf=pass smtp.mailfrom=qq.com; dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b=vz2vN8vm; arc=none smtp.client-ip=203.205.221.190
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b="vz2vN8vm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1790130546; bh=c2/UpacLji4hUGx/IMN7tFqHhex9cxgusaR9P8+O/3I=;
	h=From:To:Cc:Subject:Date;
	b=vz2vN8vm0Tw+loz/KZ5PjYSA6gRneWt5g0MKzmoPCv1OX6p9zR0YWVbza4TQA5BdY
	 zuj1AxxMIIlHnYji3+oHL3l12Ur7ysf3QfLrFXCpkbmjkpaVx/2rKlw5P+xYXtP0aF
	 bRk2b4S+XdD4frJWQtDWUV2dj4O6sgpXpdGhhUi8=
Received: from XJSH01426.meizu.com ([61.169.203.203])
	by newxmesmtplogicsvrsza73-0.qq.com (NewEsmtp) with SMTP
	id 7441BCFD; Wed, 23 Sep 2026 10:29:04 +0800
X-QQ-mid: xmsmtpt1790130544t34ssj30y
Message-ID: <tencent_AA61551D1F50E61F46C8542F5C8874512C05@qq.com>
X-QQ-XMAILINFO: OUHdjnmRxhl6BrhFTxZKSInajEwOTmtmJoO2V5moqyaxr8nL4Mf/Oyq1lHw+eA
	 pr/MHUc9WZpFzxT7r3vdWoVGksgTLf1bfd8dvUbeyY+veYXedXRGHFYlEVrw0zM6QSTjL3k2Ghmz
	 kYEXoRVQV68W+Cq8fandcWFZnlJLev53nKFcTavqQY/tsd707MmdcAxkd5IepEwI8LHJ0RXP5vyY
	 HXl/7wEoK6v+sit6crTStbXGUFpt8ZhhdNJNVYksgkrRVqArhiBLZNhRWQRgbyZhMYMmUFmI/Jp7
	 7E6OqmajEcLawJM2DOlLr/7QQOldvPVBGAimcBmnOMjLwTYAP+I8L+pEDrsyh39u4lMNaKgNaf1b
	 VlEoWLAgenHMFLfaG9r5a9XlE6Q5ibWUULVPbvdRtXcUInuY/+1NfEEBkPqFbsrgT0LqzUS+9bcM
	 3sKCNpVBtswt5AAooBSIs+fXNOZpWN0EA2LqBiOp9xdhZ5sXZmX77uUVw2gCPDdEWhRhGy4sOAMG
	 CZOd5SjAadGkoIglI6ECanXGkDIWd0HMUzRFTutgaOCrELwWMhNMe96ZCIsIL8TuJT2PsdcgdAFf
	 GzrrLwkcLeHQeu1YKTc5V94hPQ17sJb+tXPkjfhvU3ILc+LIiZaZ/hW/mgVdlNVs9YtUJpS0LvRm
	 cXwHD7s2J7vb7Rt9+vYPX3UGtxN5domOhBGJ+jYuTzMqhJAQ/hH3eg0IeSKIs9TGQTcrpPkfgbgy
	 hM/0epZ0du/0sEdy/6Isgvr9sI70+PFqtQjGISYaned20O69r4HlVDQlh1VEwOotWFivlAGqDwLn
	 w+afkpMDNuHC5qMXl3IEFrN2HTi737Ufq5LDuK7CK8+VRb7toEmcqGeDxIoNGUB7uNIUdFaNnBVf
	 nWYMprVUmZcZFK2vPcp16hI27SAMt963w2sX2yIaOG6YekEsOzhY/FRaQHRUxJc1Fe8LX68vfkue
	 UU9vigAVk9Wsz/O9mp/rgL5rGmCtpAhD3mJlmQvVvWtgyT9mc8OIC35TAD3K/VpEvOaJyDIbc42A
	 rcygEDXJZB5SIH7pJFtc9D+6aPKc7YThLTOirIiD11Id8y4qYiXtYCzQWJePVQSv64Xe5iOTCfJE
	 XBptFeu6ZJLlFo/vogTY7jntjk88RNGg6D3/h7I2q7oem0F50JZ68dVHgG7Q==
X-QQ-XMRINFO: MPJ6Tf5t3I/ylTmHUqvI8+Wpn+Gzalws3A==
From: Zhenghui Hao <zhenghui.hao@qq.com>
To: linux-mm@kvack.org
Cc: Muchun Song <muchun.song@linux.dev>,
	Oscar Salvador <osalvador@suse.de>,
	David Hildenbrand <david@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	linux-kernel@vger.kernel.org,
	Zhenghui Hao <zhenghui.hao@qq.com>
Subject: [PATCH] hugetlbfs: fix stale comment in hugetlbfs_file_mmap()
Date: Wed, 23 Sep 2026 10:28:58 +0800
X-OQ-MSGID: <20260923022858.263689-1-zhenghui.hao@qq.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The comment above the VMA flag setup in hugetlbfs_file_mmap() says the VMA
address alignment has already been checked by prepare_hugepage_range().
That function no longer exists: it was removed by commit eff41389d824
("mm/hugetlb: remove prepare_hugepage_range()"), and the check now lives in
hugetlb_get_unmapped_area().

The comment also mentions ia64, which was removed from the tree by commit
cf8e8658100d ("arch: Remove Itanium (IA-64) architecture").

Point the comment at the current function and drop the ia64 reference.  The
rest of the comment, which tells future edits to add any error return only
after VM_HUGETLB has been set, is still accurate and is left untouched.

No functional change.

Signed-off-by: Zhenghui Hao <zhenghui.hao@qq.com>
---
 fs/hugetlbfs/inode.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/fs/hugetlbfs/inode.c b/fs/hugetlbfs/inode.c
index 7611a8470ea2..e2aaf1b56e7f 100644
--- a/fs/hugetlbfs/inode.c
+++ b/fs/hugetlbfs/inode.c
@@ -106,11 +106,10 @@ static int hugetlbfs_file_mmap(struct file *file, struct vm_area_struct *vma)
 
 	/*
 	 * vma address alignment (but not the pgoff alignment) has
-	 * already been checked by prepare_hugepage_range.  If you add
-	 * any error returns here, do so after setting VM_HUGETLB, so
-	 * is_vm_hugetlb_page tests below unmap_region go the right
-	 * way when do_mmap unwinds (may be important on powerpc
-	 * and ia64).
+	 * already been checked by hugetlb_get_unmapped_area().  If you
+	 * add any error returns here, do so after setting VM_HUGETLB,
+	 * so is_vm_hugetlb_page tests below unmap_region go the right
+	 * way when do_mmap unwinds (may be important on powerpc).
 	 */
 	vma_set_flags(vma, VMA_HUGETLB_BIT, VMA_DONTEXPAND_BIT);
 	vma->vm_ops = &hugetlb_vm_ops;

base-commit: 93f51579e7df248780214094418f205253383cc5
-- 
2.53.0

