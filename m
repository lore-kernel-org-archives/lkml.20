Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00F554DEC3E
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 19:48:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789674496; cv=none; b=d8BaI4D5gRZxeHJyg7kQAeI/QDBNUihOYvruopCx/3lhZQnnwa3BAVXGIQx7e+xQTjLziQNrYrO4yqAKVRKGdc6RISyP1ca0gRzSeMeStfC3XqQsc46NzZ00Z5P4kC84H4Tk8PCX1/JB9JfnOnqgUixNCrVJpXLNx68N/ZJtEXY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789674496; c=relaxed/simple;
	bh=vloWjrSgn5PFdU4AaKDJGM/wu9+6TuZ0V219iHLmchc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dc6oZ80IxWknQjBSBUeqFuGotshogMfchy0d0sIh9YcTAAaSMdi9a/uaFJkItLOthmAPgKT1YeO1SQn0bvyBM0Tzpce10OLHs7uKf+uLYAJGS3fucS9rnn70Yleb7xF0yAI4oLKHl6dRyUVmGo3n3/tzz4TLiAxm9a4jjVY4FJU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ND4CNBlX; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ND4CNBlX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3F6AA1F00893;
	Thu, 17 Sep 2026 19:48:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789674494;
	bh=62s9qkXq6r17IuwiNPx+api5etWusepzLRBx4u3FLR4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=ND4CNBlXtyj77nav8hEVmG2jfavMgyjiDYBFcaBqvISYMRdlgUaKK6dKJGLKPlL/S
	 f82ud7i4gFmufXGzFcFLWIi46VHHpl3s0qzWO+XjQnzdFN2sATVOFuAQuJCUQAKHEz
	 3Bc26ykBomOzbOTFyEVOyTKRhlJW2n6T1Na7HsxTUcHh7v+2t3v3SG/57As6y+VoTY
	 QqCahhK9tkOyyYEH5kiSpzMlS8NQAFK/2pRn5UE4f84BV7TbXLwbn58jPWEDgVG75O
	 PRYca0Zyqe8QzejEXH9GnqM6le8kZ9GIOxqlnHMMRvzZfWBOQ8jEGMBhydcayxh8tp
	 XbOuCFDlFrrYA==
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Date: Thu, 17 Sep 2026 20:47:41 +0100
Subject: [PATCH v3 1/3] mm/vma: const-ify vma_assert_stabilised() and
 associated functions
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260917-vma-is-faulted-v3-1-5c22314a72e7@kernel.org>
References: <20260917-vma-is-faulted-v3-0-5c22314a72e7@kernel.org>
In-Reply-To: <20260917-vma-is-faulted-v3-0-5c22314a72e7@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>, 
 Suren Baghdasaryan <surenb@google.com>, 
 "Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, 
 Shakeel Butt <shakeel.butt@linux.dev>, David Hildenbrand <david@kernel.org>, 
 Zi Yan <ziy@nvidia.com>, Baolin Wang <baolin.wang@linux.alibaba.com>, 
 Nico Pache <nico.pache@linux.dev>, Ryan Roberts <ryan.roberts@arm.com>, 
 Dev Jain <dev.jain@arm.com>, Barry Song <baohua@kernel.org>, 
 Lance Yang <lance.yang@linux.dev>, Usama Arif <usama.arif@linux.dev>, 
 Kiryl Shutsemau <kas@kernel.org>, Mike Rapoport <rppt@kernel.org>, 
 Michal Hocko <mhocko@suse.com>, Xu Xin <xu.xin16@zte.com.cn>, 
 Chengming Zhou <chengming.zhou@linux.dev>, Jann Horn <jannh@google.com>, 
 Pedro Falcato <pfalcato@suse.de>, Rik van Riel <riel@surriel.com>, 
 Harry Yoo <harry@kernel.org>, Chris Li <chrisl@kernel.org>, 
 Kairui Song <kasong@tencent.com>, Kemeng Shi <shikemeng@huaweicloud.com>, 
 Nhat Pham <nphamcs@gmail.com>, Baoquan He <baoquan.he@linux.dev>, 
 Youngjun Park <youngjun.park@lge.com>, Peter Xu <peterx@redhat.com>, 
 Muchun Song <muchun.song@linux.dev>, Oscar Salvador <osalvador@suse.de>, 
 Matthew Brost <matthew.brost@intel.com>, 
 Joshua Hahn <joshua.hahnjy@gmail.com>, Rakie Kim <rakie.kim@sk.com>, 
 Byungchul Park <byungchul@sk.com>, Gregory Price <gourry@gourry.net>, 
 Ying Huang <ying.huang@linux.alibaba.com>, 
 Alistair Popple <apopple@nvidia.com>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
 "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=3347; i=ljs@kernel.org;
 h=from:subject:message-id; bh=vloWjrSgn5PFdU4AaKDJGM/wu9+6TuZ0V219iHLmchc=;
 b=owGbwMvMwCV2fu7ZrsZH9SKMp9WSGLLWOL9c29Prv+7T2mnMn/Q4Vv77selyisGDM7/iMmTXh
 hyOuqvO0lHKwiDGxSArpsjy/Iv4/iCRsHmdF/zdYOawMoEMYeDiFICJhAkxMmx7e5P7qg3P67sr
 uy+xvwjSk1u579IWk+pLDudzc1ZmT7vP8FfqR/KNbXaF8ybPnMpzdLH4sVOHm+ZM9DhaFC18dH/
 ERjVOAA==
X-Developer-Key: i=ljs@kernel.org; a=openpgp;
 fpr=E7F417BF5214569E89D04F46CF9DCD8A81E27F14

The vma pointers are not modified in any of these functions so make it
official by const-ify them.

Propagate this throughout the call stack.

No functional change intended.

Signed-off-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>
---
 include/linux/mmap_lock.h       | 12 ++++++------
 tools/testing/vma/include/dup.h |  2 +-
 2 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/include/linux/mmap_lock.h b/include/linux/mmap_lock.h
index 00eae65b74bd..03e1eb136111 100644
--- a/include/linux/mmap_lock.h
+++ b/include/linux/mmap_lock.h
@@ -273,7 +273,7 @@ static inline void vma_end_read(struct vm_area_struct *vma)
 	vma_refcount_put(vma);
 }
 
-static inline unsigned int __vma_raw_mm_seqnum(struct vm_area_struct *vma)
+static inline unsigned int __vma_raw_mm_seqnum(const struct vm_area_struct *vma)
 {
 	const struct mm_struct *mm = vma->vm_mm;
 
@@ -288,7 +288,7 @@ static inline unsigned int __vma_raw_mm_seqnum(struct vm_area_struct *vma)
  *
  * Returns true if write-locked, otherwise false.
  */
-static inline bool __is_vma_write_locked(struct vm_area_struct *vma)
+static inline bool __is_vma_write_locked(const struct vm_area_struct *vma)
 {
 	/*
 	 * current task is holding mmap_write_lock, both vma->vm_lock_seq and
@@ -344,7 +344,7 @@ int vma_start_write_killable(struct vm_area_struct *vma)
  * vma_assert_write_locked() - assert that @vma holds a VMA write lock.
  * @vma: The VMA to assert.
  */
-static inline void vma_assert_write_locked(struct vm_area_struct *vma)
+static inline void vma_assert_write_locked(const struct vm_area_struct *vma)
 {
 	if (!IS_ENABLED(CONFIG_MMU)) {
 		mmap_assert_write_locked(vma->vm_mm);
@@ -359,7 +359,7 @@ static inline void vma_assert_write_locked(struct vm_area_struct *vma)
  * lock and is not detached.
  * @vma: The VMA to assert.
  */
-static inline void vma_assert_locked(struct vm_area_struct *vma)
+static inline void vma_assert_locked(const struct vm_area_struct *vma)
 {
 	unsigned int refcnt;
 
@@ -410,7 +410,7 @@ static inline void vma_assert_locked(struct vm_area_struct *vma)
  * With lockdep disabled we may sometimes race with other threads acquiring the
  * mmap read lock simultaneous with our VMA read lock.
  */
-static inline void vma_assert_stabilised(struct vm_area_struct *vma)
+static inline void vma_assert_stabilised(const struct vm_area_struct *vma)
 {
 	/*
 	 * If another thread owns an mmap lock, it may go away at any time, and
@@ -445,7 +445,7 @@ static inline void vma_assert_stabilised(struct vm_area_struct *vma)
 	vma_assert_locked(vma);
 }
 
-static inline bool vma_is_attached(struct vm_area_struct *vma)
+static inline bool vma_is_attached(const struct vm_area_struct *vma)
 {
 	return refcount_read(&vma->vm_refcnt);
 }
diff --git a/tools/testing/vma/include/dup.h b/tools/testing/vma/include/dup.h
index 16c09dac59d9..17505bcf9cf6 100644
--- a/tools/testing/vma/include/dup.h
+++ b/tools/testing/vma/include/dup.h
@@ -1179,7 +1179,7 @@ static inline struct vm_area_struct *vma_next(struct vma_iterator *vmi)
 	return mas_find(&vmi->mas, ULONG_MAX);
 }
 
-static inline bool vma_is_attached(struct vm_area_struct *vma)
+static inline bool vma_is_attached(const struct vm_area_struct *vma)
 {
 	return refcount_read(&vma->vm_refcnt);
 }

-- 
2.55.0

