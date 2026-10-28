Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=202.108.3.163
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793159315;
	b=zDBU4aa5y0rQL5FCjfBcsdFRbAlLADXXGo67Cexf741qc7CrC5Dr4sxAGmPPwb+0R/sV
	 NLArHxVJcfR9aIeteD3x5AZABkyd2R5rv8AW+oL/Mj4+I6Xx22IGbHolrlkIoD4U5LLDU
	 nvREQAojgKdnwiS33AsXa0O+VRFaWOfpeRJ1UAjkThuUVJaK/Od0sX02PAD8GT9YazrWr
	 im6ZmRhlEqTbhSq620KJbOS9Q4XWrAJDDb7GDPdR3/YzeU9u4e0So7Nq2liONxnA4rliH
	 Ja+sxVOBfn6JskgDxDomdo7xFOJOl0RFNuO4Vvh9nVO8wLQLWt+1GgC38lIx6Bi7+Cg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793159315;
	h=DMARC-Filter:DKIM-Signature:X-SMAIL-HELO:Received:X-Sender:X-Auth-ID:
	 X-SMAIL-MID:X-SMAIL-UIID:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=3h4MR3nL0t1nE+6n7GmokQaxXbH8Uo4p7Mg0kpMK6ZA=;
	b=uDr+ciPzbqlqhqtgVyAEIJJU/SbTu1wZP/ANkiW9dmdfFGBRlNTdcOzrxa5uZvPR4YDz
	 tAC9VJwXJhhrABVVW1oDVFYkpaFUW+ekypo2B+QxhZytYyO7PVB8zgLbxwWxlIh892AVL
	 Tk4R/Yobfj3qQ1pB9xRga9uYXcxldX0/KeS4uUBrYZJrQo4TfgH5qpY9ynMMZF6OPN+m7
	 nXOIJ6mpESHMjA8IVgMxtgedJPhB/O68yodm1qy+zjE5os+Jt1+PuBYdyVCCfSUqlW/fK
	 +TgbIXDTudnm6LkFrCDxMer/qGjljhgZJEELD3GRQQTWEB/YKE5VmIJ+6L5R7P12ZgQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=sina.com;
	spf=pass smtp.mailfrom=sina.com;
	dkim=pass header.d=sina.com header.i=@sina.com header.a=rsa-sha256 header.s=201208 header.b=V75mUkL6;
	arc=none smtp.remote-ip=202.108.3.163
Received: from mail3-163.sinamail.sina.com.cn (mail3-163.sinamail.sina.com.cn [202.108.3.163])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4A7D606A31A
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 03:48:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D4A7D606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sina.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sina.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=sina.com header.i=@sina.com header.a=rsa-sha256 header.s=201208 header.b=V75mUkL6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sina.com; s=201208; t=1793159313;
	bh=3h4MR3nL0t1nE+6n7GmokQaxXbH8Uo4p7Mg0kpMK6ZA=;
	h=From:Subject:Date:Message-ID;
	b=V75mUkL6tdsjJLGN4MAReBFbwERUG9W6DgDKXOPgXULqecvBNNO5vNHPVohuAE0Y7
	 H45V7t5Ya1kNupYRPON/VzsdzQlUqhHXkjPkt9PbmpZczyt6fdIuRjwt5dRKwhycpA
	 nB8EV+z2DJmM/sZWx24EkE5rlt3Ta2mcP8cmrQKA=
X-SMAIL-HELO: lxu-ped-host..
Received: from unknown (HELO lxu-ped-host..)([111.198.231.89])
	by sina.com (10.54.253.34) with ESMTP
	id 6AE17084000020FF; Wed, 28 Oct 2026 11:48:22 +0800 (CST)
X-Sender: eadavis@sina.com
X-Auth-ID: eadavis@sina.com
Authentication-Results: sina.com;
	 spf=none smtp.mailfrom=eadavis@sina.com;
	 dkim=none header.i=none;
	 dmarc=none action=none header.from=eadavis@sina.com
X-SMAIL-MID: 7979926292288
X-SMAIL-UIID: 6A993DD84A59491AB923A54801FD0B37-20261028-114822-1
From: Edward Adam Davis <eadavis@sina.com>
To: syzbot+2fcec0eca7f4cade53b2@syzkaller.appspotmail.com
Cc: linux-kernel@vger.kernel.org,
	syzkaller-bugs@googlegroups.com
Subject: Re: [syzbot] kernel BUG in remove_inode_hugepages (2)
Date: Wed, 28 Oct 2026 11:48:20 +0800
Message-ID: <20261028034820.267112-1-eadavis@sina.com>
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
diff --git a/mm/hugetlb.c b/mm/hugetlb.c
index b017ae1dfd6f..def6aebc44fd 100644
--- a/mm/hugetlb.c
+++ b/mm/hugetlb.c
@@ -134,7 +134,6 @@ static int __huge_pmd_unshare(struct mmu_gather *tlb,
 		bool check_locks);
 static void hugetlb_unshare_pmds(struct vm_area_struct *vma,
 		unsigned long start, unsigned long end, bool take_locks);
-static struct resv_map *vma_resv_map(struct vm_area_struct *vma);
 
 static inline bool subpool_is_free(struct hugepage_subpool *spool)
 {
@@ -1145,7 +1144,7 @@ static inline struct resv_map *inode_resv_map(struct inode *inode)
 	return HUGETLBFS_I(inode)->resv_map;
 }
 
-static struct resv_map *vma_resv_map(struct vm_area_struct *vma)
+struct resv_map *vma_resv_map(struct vm_area_struct *vma)
 {
 	VM_BUG_ON_VMA(!is_vm_hugetlb_page(vma), vma);
 	if (vma->vm_flags & VM_MAYSHARE) {
