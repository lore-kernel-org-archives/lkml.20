Received: from mxhk.zte.com.cn (mxhk.zte.com.cn [160.30.148.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D4B23537F9
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 08:12:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=160.30.148.35
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789114341; cv=none; b=jueirFBKnG+45iHwYQo88eU10Pn+W3pTbkfSZCYC9MO9qEo3bmWJUPHvBTnklLPZGrhe7lR8IRuvcR/qg8BkvStDDf7wkfh0mb2iP4yiqu/iz5cPeEN7KSCMBxkff/85+Ujt9Md31UbzNZdsbQTbjxN90hUuWtdFnG3Da5Jt9Cc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789114341; c=relaxed/simple;
	bh=xyiHQ4GfGPTe8remfAx9trjKNYwZbt2KB++GbUbhKmc=;
	h=Message-ID:In-Reply-To:References:Date:Mime-Version:From:To:Cc:
	 Subject:Content-Type; b=g1NCw2Z2XXJZWy0f4JoDEoYtwEz8nZRH9mimXOuPpvohUPv23+3j2PIQMqsdVVoNQZjl6yP/HH8XGsmr8PedXzDQEbxS/X3cfKjr9QNfoJxXa2e71EXm5NmHF8m+qVKCyDZIHAsaHtPA9UmHTseK9ZIR0Fni3AV/ejZtFZuyqg0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zte.com.cn; spf=pass smtp.mailfrom=zte.com.cn; arc=none smtp.client-ip=160.30.148.35
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zte.com.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zte.com.cn
Received: from mse-fl2.zte.com.cn (unknown [10.5.228.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mxhk.zte.com.cn (FangMail) with ESMTPS id 4hh6hx5Fzxz8XrrX;
	Fri, 11 Sep 2026 16:12:17 +0800 (CST)
Received: from xaxapp04.zte.com.cn ([10.99.98.157])
	by mse-fl2.zte.com.cn with SMTP id 68B8C7Bo036013;
	Fri, 11 Sep 2026 16:12:08 +0800 (+08)
	(envelope-from xu.xin16@zte.com.cn)
Received: from mapi (xaxapp01[null])
	by mapi (Zmail) with MAPI id mid32;
	Fri, 11 Sep 2026 16:12:10 +0800 (CST)
X-Zmail-TransId: 2af96aa3b7da071-c2054
X-Mailer: Zmail v1.0
Message-ID: <20260911161210082WKOqK1dumByDY7jeEOdPF@zte.com.cn>
In-Reply-To: <20260911160421076_KNXun8Mpp9Xj7fxHG0i7@zte.com.cn>
References: 20260911160421076_KNXun8Mpp9Xj7fxHG0i7@zte.com.cn
Date: Fri, 11 Sep 2026 16:12:10 +0800 (CST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
From: <xu.xin16@zte.com.cn>
To: <akpm@linux-foundation.org>, <david@kernel.org>, <ljs@kernel.org>,
        <surenb@google.com>
Cc: <linux-mm@kvack.org>, <linux-kernel@vger.kernel.org>,
        <chengming.zhou@linux.dev>
Subject: =?UTF-8?B?W1BBVENIIDMvNF0gbW0va3NtOiBtYWtlIGJyZWFrX2tzbSgpIG1vcmUgc2NhbGFibGU=?=
Content-Type: text/plain;
	charset="UTF-8"
X-MAIL:mse-fl2.zte.com.cn 68B8C7Bo036013
X-TLS: YES
X-ENVELOPE-SENDER: xu.xin16@zte.com.cn
X-SOURCE-IP: 10.5.228.133 unknown Fri, 11 Sep 2026 16:12:17 +0800
X-CLEAN: YES
X-Fangmail-Anti-Spam-Filtered: true
X-Fangmail-MID-QID: 6AA3B7E1.000/4hh6hx5Fzxz8XrrX

From: Xu Xin (ZTE) <xu.xin@linux.dev>

Currently the last argument 'walk_lock' of break_ksm() is used to
indicate whether the page_walk is protected by mmap_read_lock or
mmap_write_lock. If 'walk_lock' is true, we suppose its context to
be under mmap_write_lock() protection, then mark it PGWALK_WRLOCK and
make its vma be write-locked during the walk; If 'walk_lock' is
false, we suppose its context to be mmap_read_lock(), then mark it
PGWALK_RDLOCK.

This change is prepared for the latter patch to enable VMA
read-locking where break_ksm() might be under the third new proctecion
way: VMA read-locking, so we have to replace the boolean variable to
the enum 'page_walk_lock', but without any function changed.

No functional change intended.

Signed-off-by: Xu Xin (ZTE) <xu.xin@linux.dev>
---
 mm/ksm.c | 21 ++++++++-------------
 1 file changed, 8 insertions(+), 13 deletions(-)

diff --git a/mm/ksm.c b/mm/ksm.c
index 8df66b4e5de0..dda105681d7f 100644
--- a/mm/ksm.c
+++ b/mm/ksm.c
@@ -660,16 +660,11 @@ static int break_ksm_pmd_entry(pmd_t *pmdp, unsigned long addr, unsigned long en
 	return found;
 }

-static const struct mm_walk_ops break_ksm_ops = {
+static struct mm_walk_ops break_ksm_ops = {
 	.pmd_entry = break_ksm_pmd_entry,
 	.walk_lock = PGWALK_RDLOCK,
 };

-static const struct mm_walk_ops break_ksm_lock_vma_ops = {
-	.pmd_entry = break_ksm_pmd_entry,
-	.walk_lock = PGWALK_WRLOCK,
-};
-
 /*
  * Though it's very tempting to unmerge rmap_items from stable tree rather
  * than check every pte of a given vma, the locking doesn't quite work for
@@ -696,11 +691,11 @@ static const struct mm_walk_ops break_ksm_lock_vma_ops = {
  * protection keys here anyway.
  */
 static int break_ksm(struct vm_area_struct *vma, unsigned long addr,
-		unsigned long end, bool lock_vma)
+		unsigned long end, enum page_walk_lock walk_lock)
 {
 	vm_fault_t ret = 0;
-	const struct mm_walk_ops *ops = lock_vma ?
-				&break_ksm_lock_vma_ops : &break_ksm_ops;
+	struct mm_walk_ops *ops = &break_ksm_ops;
+	ops->walk_lock = walk_lock;

 	do {
 		int ksm_page;
@@ -807,7 +802,7 @@ static void break_cow(struct ksm_rmap_item *rmap_item)
 	mmap_read_lock(mm);
 	vma = find_mergeable_vma(mm, addr);
 	if (vma)
-		break_ksm(vma, addr, addr + PAGE_SIZE, false);
+		break_ksm(vma, addr, addr + PAGE_SIZE, PGWALK_RDLOCK);
 	mmap_read_unlock(mm);
 }

@@ -1245,7 +1240,7 @@ static int unmerge_and_remove_all_rmap_items(void)
 		for_each_vma(vmi, vma) {
 			if (!(vma->vm_flags & VM_MERGEABLE) || !vma->anon_vma)
 				continue;
-			err = break_ksm(vma, vma->vm_start, vma->vm_end, false);
+			err = break_ksm(vma, vma->vm_start, vma->vm_end, PGWALK_RDLOCK);
 			if (err)
 				goto error;
 		}
@@ -2885,7 +2880,7 @@ static int __ksm_del_vma(struct vm_area_struct *vma)
 		return 0;

 	if (vma->anon_vma) {
-		err = break_ksm(vma, vma->vm_start, vma->vm_end, true);
+		err = break_ksm(vma, vma->vm_start, vma->vm_end, PGWALK_WRLOCK);
 		if (err)
 			return err;
 	}
@@ -3037,7 +3032,7 @@ int ksm_madvise(struct vm_area_struct *vma, unsigned long start,
 			return 0;		/* just ignore the advice */

 		if (vma->anon_vma) {
-			err = break_ksm(vma, start, end, true);
+			err = break_ksm(vma, start, end, PGWALK_WRLOCK);
 			if (err)
 				return err;
 		}
-- 
2.25.1
