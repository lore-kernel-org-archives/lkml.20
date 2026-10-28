Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=202.108.3.19
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793158091;
	b=WY9geyd6yThiSI1fxkSMOW9BMtXgUbyCp+IZBOlEGwgOPlzU9TtCYzYz9O72uC0dTOZm
	 uhmoorrfeBVLzj/Q3J7PpFgBzlSZyW44oLZ+zErePTO6gz/cK56/jGXvArr4ZmQQ1rzjG
	 q1kx/XcCFgW/EVPjtwIof1YC//MtMhXOmrxYAPy5lWSajke2fw8fuNLwxm6sS52bJypc/
	 qfQzPMGPhHw/mtrrWYqu+AL5Eda30maP2rdi/10+1tTBRJrQeCJQXWBam83RCPUZ+T/6A
	 p+U4L1GKfknU5cIO1dPQrpNMEyu2TN6uYipElWV6zrzNN98ZxFQEpz6+qSKoHApRHCg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793158091;
	h=DMARC-Filter:DKIM-Signature:X-SMAIL-HELO:Received:X-Sender:X-Auth-ID:
	 X-SMAIL-MID:X-SMAIL-UIID:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=ZnpV6IHe1qNdmgVEwfuEDwkYPc+n89FYPgrH6JA5/kk=;
	b=olEfpLm00zCLDMyuC/w84t3zlJA5pJ4n7G5iL8ek0k8EH1jOjFFGHAH4KBWa69Br92La
	 jF5nDkhjXpGp9ScI5iL1WFTmHiQjQ0torMGJszzE0oZeXL837F+s5FklUyjOZUqT2rrWX
	 zlnIODWLem1kKHY4ZGYwaupNyORRygBns5c/+YIBhrFAFih/rh6CDgYhHtTrG11ZdrWRf
	 3fO/BGZ4lameWd2lb5Fc6WQLkC9HspN3WtMyU1PjJiVZaHnTw781VyWogCI1QK/6eXLbs
	 GcTG+d+SQa7jofeT//T+uuNcuVHbnzxsdvi5IQpHZupzNAitMhSdjFnPFFPiMGLeUyw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=sina.com;
	spf=pass smtp.mailfrom=sina.com;
	dkim=pass header.d=sina.com header.i=@sina.com header.a=rsa-sha256 header.s=201208 header.b="vO0/sVRV";
	arc=none smtp.remote-ip=202.108.3.19
Received: from r3-19.sinamail.sina.com.cn (r3-19.sinamail.sina.com.cn [202.108.3.19])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA9FF606A31D
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 03:28:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EA9FF606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sina.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sina.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=sina.com header.i=@sina.com header.a=rsa-sha256 header.s=201208 header.b=vO0/sVRV
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sina.com; s=201208; t=1793158089;
	bh=ZnpV6IHe1qNdmgVEwfuEDwkYPc+n89FYPgrH6JA5/kk=;
	h=From:Subject:Date:Message-ID;
	b=vO0/sVRV2kdviMOfimuuHm5HVZu+EdGPNGfKZOvyt3lH4pM9HwZut+/AdV4Qu0Upn
	 CZmHg4TgEbOt8DSqN6KQDB+sN8JSNFktHFgwrCioslFeJWqj0sLcnjRskw0QCc7cGt
	 CdfRCZvsGMWQj5tY48SVLrSAR7+q901MDSwulBZ0=
X-SMAIL-HELO: lxu-ped-host..
Received: from unknown (HELO lxu-ped-host..)([111.198.231.89])
	by sina.com (10.54.253.32) with ESMTP
	id 6AE16BBC00000874; Wed, 28 Oct 2026 11:27:59 +0800 (CST)
X-Sender: eadavis@sina.com
X-Auth-ID: eadavis@sina.com
Authentication-Results: sina.com;
	 spf=none smtp.mailfrom=eadavis@sina.com;
	 dkim=none header.i=none;
	 dmarc=none action=none header.from=eadavis@sina.com
X-SMAIL-MID: 6342744456607
X-SMAIL-UIID: 1054F1EC2B684440AC7D057B75234E22-20261028-112759-1
From: Edward Adam Davis <eadavis@sina.com>
To: syzbot+2fcec0eca7f4cade53b2@syzkaller.appspotmail.com
Cc: linux-kernel@vger.kernel.org,
	syzkaller-bugs@googlegroups.com
Subject: Re: [syzbot] kernel BUG in remove_inode_hugepages (2)
Date: Wed, 28 Oct 2026 11:27:56 +0800
Message-ID: <20261028032756.265251-1-eadavis@sina.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <6adf3170.a6443767.132891.0077.GAE@google.com>
References: <6adf3170.a6443767.132891.0077.GAE@google.com>
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

From: Edward Aadm Davis <eadavis@sina.com>

#syz test: git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git 9ba46df34488

diff --git a/fs/hugetlbfs/inode.c b/fs/hugetlbfs/inode.c
index 6656807ce437..166183b7ee36 100644
--- a/fs/hugetlbfs/inode.c
+++ b/fs/hugetlbfs/inode.c
@@ -382,6 +382,7 @@ static void hugetlb_unmap_file_folio(struct hstate *h,
 					struct folio *folio, pgoff_t index)
 {
 	struct hugetlb_vma_lock *vma_lock;
+	struct resv_map *resv_map;
 	unsigned long pfn = folio_pfn(folio);
 	struct vm_area_struct *vma;
 	unsigned long v_start;
@@ -394,6 +395,7 @@ static void hugetlb_unmap_file_folio(struct hstate *h,
 	i_mmap_lock_write(mapping);
 retry:
 	vma_lock = NULL;
+	resv_map = NULL;
 	mapping_rmap_tree_foreach(vma, mapping, start, end - 1) {
 		v_start = vma_offset_start(vma, start);
 		v_end = vma_offset_end(vma, end);
@@ -402,15 +404,21 @@ static void hugetlb_unmap_file_folio(struct hstate *h,
 			continue;
 
 		if (!hugetlb_vma_trylock_write(vma)) {
-			vma_lock = vma->vm_private_data;
-			/*
-			 * If we can not get vma lock, we need to drop
-			 * immap_sema and take locks in order.  First,
-			 * take a ref on the vma_lock structure so that
-			 * we can be guaranteed it will not go away when
-			 * dropping immap_sema.
-			 */
-			kref_get(&vma_lock->refs);
+			if (vma->vm_flags & VM_MAYSHARE) {
+				vma_lock = vma->vm_private_data;
+				/*
+				 * If we can not get vma lock, we need to drop
+				 * immap_sema and take locks in order.  First,
+				 * take a ref on the vma_lock structure so that
+				 * we can be guaranteed it will not go away when
+				 * dropping immap_sema.
+				 */
+				kref_get(&vma_lock->refs);
+			} else {
+				resv_map = vma_resv_map(vma);
+				kref_get(&resv_map->refs);
+			}
+
 			break;
 		}
 
@@ -421,25 +429,28 @@ static void hugetlb_unmap_file_folio(struct hstate *h,
 
 	i_mmap_unlock_write(mapping);
 
-	if (vma_lock) {
+	if (vma_lock || resv_map) {
 		/*
 		 * Wait on vma_lock.  We know it is still valid as we have
 		 * a reference.  We must 'open code' vma locking as we do
 		 * not know if vma_lock is still attached to vma.
 		 */
-		down_write(&vma_lock->rw_sema);
+		hugetlb_vma_lock_write(vma);
 		i_mmap_lock_write(mapping);
 
-		vma = vma_lock->vma;
-		if (!vma) {
-			/*
-			 * If lock is no longer attached to vma, then just
-			 * unlock, drop our reference and retry looking for
-			 * other vmas.
-			 */
-			up_write(&vma_lock->rw_sema);
-			kref_put(&vma_lock->refs, hugetlb_vma_lock_release);
-			goto retry;
+		if (vma_lock) {
+			vma = vma_lock->vma;
+			if (!vma) {
+				/*
+				 * If lock is no longer attached to vma, then
+				 * just unlock, drop our reference and retry
+				 * looking for other vmas.
+				 */
+				up_write(&vma_lock->rw_sema);
+				kref_put(&vma_lock->refs,
+					 hugetlb_vma_lock_release);
+				goto retry;
+			}
 		}
 
 		/*
@@ -452,7 +463,10 @@ static void hugetlb_unmap_file_folio(struct hstate *h,
 			unmap_hugepage_range(vma, v_start, v_end, NULL,
 					     ZAP_FLAG_DROP_MARKER);
 
-		kref_put(&vma_lock->refs, hugetlb_vma_lock_release);
+		if (vma_lock)
+			kref_put(&vma_lock->refs, hugetlb_vma_lock_release);
+		else
+			kref_put(&resv_map->refs, resv_map_release);
 		hugetlb_vma_unlock_write(vma);
 
 		goto retry;
diff --git a/include/linux/hugetlb.h b/include/linux/hugetlb.h
index 80a5a03e9cee..f980191c651b 100644
--- a/include/linux/hugetlb.h
+++ b/include/linux/hugetlb.h
@@ -268,6 +268,7 @@ void hugetlb_vma_unlock_read(struct vm_area_struct *vma);
 void hugetlb_vma_lock_write(struct vm_area_struct *vma);
 void hugetlb_vma_unlock_write(struct vm_area_struct *vma);
 int hugetlb_vma_trylock_write(struct vm_area_struct *vma);
+struct resv_map *vma_resv_map(struct vm_area_struct *vma);
 void hugetlb_vma_assert_locked(struct vm_area_struct *vma);
 void hugetlb_vma_lock_release(struct kref *kref);
 long hugetlb_change_protection(struct vm_area_struct *vma,
@@ -392,6 +393,11 @@ static inline int is_hugepage_only_range(struct mm_struct *mm,
 	return 0;
 }
 
+static inline struct resv_map *vma_resv_map(struct vm_area_struct *vma)
+{
+	return NULL;
+}
+
 #ifdef CONFIG_USERFAULTFD
 static inline int hugetlb_mfill_atomic_pte(pte_t *dst_pte,
 					   struct vm_area_struct *dst_vma,
