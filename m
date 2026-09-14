Received: from mta0.migadu.com (out-63.mta0.migadu.com [91.218.175.63])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69ECA266581
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 11:33:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.63
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789385608; cv=none; b=gvj1E57stq4tDXpfMLsePXd4rLMtQDh9fjQUBjpubupiwMoNP6dkezY6J1QaGpiTZTRO9qvGmuxlNNmAW8omsgZh2sFPrhaHgQZYwWbPiusX6/t9j0il3i6yL65vHHwrEEi/8yUu0rqA4FF4SmJfDCb//jiFEDZmcaohJPy1G/U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789385608; c=relaxed/simple;
	bh=6vJl8E8y2Jv1Fd46pBnggwUF5zwldxFjzqu7KY7Cla4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Owjy8GnOlJFLGSYKO8+e1WA8fWY4lC5h5tl83nVUXM0bkDgilFtkczD64Gx2JjfdLB4sASujukJ1SJt+AEHplWhQsCLv5zerClNNuLa+yKmJ4t//2XlmPm1L28/ykuytQ0xjEyDiGJ0ufSSfLS6uN6fRurMelGUeLm0W1UrRhQo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=W/3cWXol; arc=none smtp.client-ip=91.218.175.63
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="W/3cWXol"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=6vJl8E8y2Jv1Fd46pBnggwUF5zwldxFjzqu7KY7Cla4=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1789385591; v=1; x=1789990391;
 b=W/3cWXoljk6HqwBRMslSn1lRHJ8BlEwm+xx4Glw7zoywDCvj0RAr53+fqawOc/LaT4d+UuZQ
 0cMaXLkLC7U4A1snIgqSYPDYR/5MqFF2NHSeuXNMv0tN5apHvP2mg6JuDVLcS3z1TK7s7qVpaxv
 KNLxm7as1tVK4kBedZgvxj0U=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 545ecb2aac1ba300;
	Mon, 14 Sep 2026 11:33:01 +0000
X-Mizu-Trace-ID: 545ecb2aac1ba300
X-Migadu-Flow: FLOW_OUT
From: Jiayuan Chen <jiayuan.chen@linux.dev>
To: linux-mm@kvack.org
Cc: Jiayuan Chen <jiayuan.chen@shopee.com>,
	Zhou Yingfu <yingfu.zhou@shopee.com>,
	Jiayuan Chen <jiayuan.chen@linux.dev>,
	Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	"Liam R. Howlett" <liam@infradead.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	David Rientjes <rientjes@google.com>,
	Shakeel Butt <shakeel.butt@linux.dev>,
	linux-kernel@vger.kernel.org
Subject: [PATCH] mm/oom_kill: fix hung tasks queued on mmap_lock behind a long reap
Date: Mon, 14 Sep 2026 19:32:37 +0800
Message-ID: <20260914113239.367200-1-jiayuan.chen@linux.dev>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Jiayuan Chen <jiayuan.chen@shopee.com>

The oom reaper holds mmap_lock for read while it unmaps the whole
victim.  Anyone who wants that lock for write in the meantime sits in D
state until the reap is over.

With swap enabled the victim can be several times the size of RAM and
the reap runs for minutes.  LTP oom01 trips hung_task that way for the
victim and for ksmd, on 6.6 LTS and on 7.3.0-rc1:

Call Trace:
 <TASK>
 __schedule+0x487/0x1870
 schedule+0x28/0xb0
 schedule_preempt_disabled+0x16/0x30
 rwsem_down_write_slowpath+0x1d4/0x750
 down_write+0x60/0x70
 __ksm_exit+0xb4/0x230
 __mmput+0x12c/0x150
 mmput+0x1e/0x30
 do_exit+0x283/0xa30
 do_group_exit+0x34/0x90
 get_signal+0x952/0x960
 arch_do_signal_or_restart+0x41/0x250
 exit_to_user_mode_loop+0xd3/0x560
 do_syscall_64+0x385/0x470
 </TASK>

KSM is just the one LTP happened to hit: __khugepaged_exit() has the
same write lock cycle ahead of exit_mmap().

Backing off between vmas would not help either: the victim's memory is
a handful of huge vmas, LTP's mmap(3G) chunks merge into one, and
zap_vma_for_reaping() zaps a whole vma in one go.

So:

1. zap_vma_for_reaping() takes a range, and __oom_reap_task_mm() zaps
   each vma in 1G chunks.

2. After a chunk, if a writer is queued on mmap_lock, drop the lock and
   return -EAGAIN.  The caller retakes it with a trylock, checks
   MMF_OOM_SKIP as it always did, and starts over; what was reaped
   already is empty pagetables and walks fast.

3. A hand-over is not a failed attempt.  Only a failed trylock counts
   against MAX_OOM_REAP_RETRIES, so the reaper still never blocks on
   mmap_lock.

4. process_mrelease() shares __oom_reap_task_mm(): on -EAGAIN it takes
   the lock again and carries on, still reaping the whole mm in one
   call.  Passing the -EAGAIN up to userspace instead would be the
   smaller change, if that is preferred.

__ksm_exit() and __khugepaged_exit() now wait for one chunk at most
instead of the whole reap.  And the exit path stops waiting for the
reaper altogether: once __ksm_exit() has had its turn, exit_mmap() runs
alongside the reaper and the two of them free the victim together, up
to twice the freeing rate and close to it in practice with LTP oom01,
so the machine gets its memory back that much sooner after an OOM kill.

The chunk is a fixed 1G rather than PUD_SIZE, which is 4T with 64K
pages on arm64.  Each chunk finishes its own mmu_gather; that is the
price of being able to drop the lock.

Reported-by: Zhou Yingfu <yingfu.zhou@shopee.com>
Cc: Jiayuan Chen <jiayuan.chen@linux.dev>
Signed-off-by: Jiayuan Chen <jiayuan.chen@shopee.com>
---
 mm/internal.h |  3 ++-
 mm/memory.c   | 13 ++++++----
 mm/oom_kill.c | 69 ++++++++++++++++++++++++++++++++++++++-------------
 3 files changed, 62 insertions(+), 23 deletions(-)

diff --git a/mm/internal.h b/mm/internal.h
index 05179c4b2090..7ac1728a57c2 100644
--- a/mm/internal.h
+++ b/mm/internal.h
@@ -593,7 +593,8 @@ struct zap_details;
 void zap_vma_range_batched(struct mmu_gather *tlb,
 		struct vm_area_struct *vma, unsigned long addr,
 		unsigned long size, struct zap_details *details);
-int zap_vma_for_reaping(struct vm_area_struct *vma);
+int zap_vma_for_reaping(struct vm_area_struct *vma, unsigned long start,
+			unsigned long end);
 int folio_unmap_invalidate(struct address_space *mapping, struct folio *folio,
 			   gfp_t gfp);
 
diff --git a/mm/memory.c b/mm/memory.c
index 926276d41920..25c35a28a39d 100644
--- a/mm/memory.c
+++ b/mm/memory.c
@@ -2207,15 +2207,18 @@ static void __zap_vma_range(struct mmu_gather *tlb, struct vm_area_struct *vma,
 }
 
 /**
- * zap_vma_for_reaping - zap all page table entries in the vma without blocking
+ * zap_vma_for_reaping - zap a range of the vma without blocking
  * @vma: The vma to zap.
+ * @start: The first address to zap.
+ * @end: One past the last address to zap.
  *
- * Zap all page table entries in the vma without blocking for use by the oom
- * killer. Hugetlb vmas are not supported.
+ * Zap the page table entries in [@start, @end) of the vma without blocking
+ * for use by the oom killer. Hugetlb vmas are not supported.
  *
  * Returns: 0 on success, -EBUSY if we would have to block.
  */
-int zap_vma_for_reaping(struct vm_area_struct *vma)
+int zap_vma_for_reaping(struct vm_area_struct *vma, unsigned long start,
+			unsigned long end)
 {
 	struct zap_details details = {
 		.reaping = true,
@@ -2224,7 +2227,7 @@ int zap_vma_for_reaping(struct vm_area_struct *vma)
 	struct mmu_gather tlb;
 
 	mmu_notifier_range_init(&range, MMU_NOTIFY_CLEAR, 0, vma->vm_mm,
-				vma->vm_start, vma->vm_end);
+				start, end);
 	tlb_gather_mmu(&tlb, vma->vm_mm);
 	if (mmu_notifier_invalidate_range_start_nonblock(&range)) {
 		tlb_finish_mmu(&tlb);
diff --git a/mm/oom_kill.c b/mm/oom_kill.c
index 5d48bd862c27..cee0a0f7b4f2 100644
--- a/mm/oom_kill.c
+++ b/mm/oom_kill.c
@@ -503,10 +503,17 @@ static DECLARE_WAIT_QUEUE_HEAD(oom_reaper_wait);
 static struct task_struct *oom_reaper_list;
 static DEFINE_SPINLOCK(oom_reaper_lock);
 
-static bool __oom_reap_task_mm(struct mm_struct *mm)
+/*
+ * Called with mmap_lock held for read.  Returns with it still held on 0
+ * (done) or -EBUSY (part could not be reaped, try again later), and drops
+ * it only on -EAGAIN, when it was handed over to a queued writer and the
+ * caller should retake it and start over.
+ */
+static int __oom_reap_task_mm(struct mm_struct *mm)
 {
 	struct vm_area_struct *vma;
-	bool ret = true;
+	unsigned long addr, end;
+	int ret = 0;
 	MA_STATE(mas, &mm->mm_mt, ULONG_MAX, ULONG_MAX);
 
 	/*
@@ -538,8 +545,25 @@ static bool __oom_reap_task_mm(struct mm_struct *mm)
 		 * count elevated without a good reason.
 		 */
 		if (vma_is_anonymous(vma) || !(vma->vm_flags & VM_SHARED)) {
-			if (zap_vma_for_reaping(vma))
-				ret = false;
+			/*
+			 * Zap in 1G chunks and hand mmap_lock over whenever a
+			 * writer is queued on it, so it does not wait for the
+			 * whole reap.
+			 */
+			end = vma->vm_end;
+			while (end > vma->vm_start) {
+				addr = max(vma->vm_start, ALIGN_DOWN(end - 1, SZ_1G));
+				if (zap_vma_for_reaping(vma, addr, end)) {
+					ret = -EBUSY;
+					break;
+				}
+				end = addr;
+				if (!mmap_lock_is_contended(mm))
+					continue;
+
+				mmap_read_unlock(mm);
+				return -EAGAIN;
+			}
 		}
 	}
 
@@ -549,16 +573,17 @@ static bool __oom_reap_task_mm(struct mm_struct *mm)
 /*
  * Reaps the address space of the given task.
  *
- * Returns true on success and false if none or part of the address space
- * has been reclaimed and the caller should retry later.
+ * Returns 0 when done, -EAGAIN if mmap_lock was handed over to a writer
+ * and the caller should start over, and -EBUSY if none or part of the
+ * address space has been reclaimed and the caller should retry later.
  */
-static bool oom_reap_task_mm(struct task_struct *tsk, struct mm_struct *mm)
+static int oom_reap_task_mm(struct task_struct *tsk, struct mm_struct *mm)
 {
-	bool ret = true;
+	int ret = 0;
 
 	if (!mmap_read_trylock(mm)) {
 		trace_skip_task_reaping(tsk->pid);
-		return false;
+		return -EBUSY;
 	}
 
 	/*
@@ -576,7 +601,9 @@ static bool oom_reap_task_mm(struct task_struct *tsk, struct mm_struct *mm)
 
 	/* failed to reap part of the address space. Try again later */
 	ret = __oom_reap_task_mm(mm);
-	if (!ret)
+	if (ret == -EAGAIN)	/* handed the lock over, already dropped */
+		return ret;
+	if (ret)
 		goto out_finish;
 
 	pr_info("oom_reaper: reaped process %d (%s), now anon-rss:%lukB, file-rss:%lukB, shmem-rss:%lukB\n",
@@ -595,15 +622,15 @@ static bool oom_reap_task_mm(struct task_struct *tsk, struct mm_struct *mm)
 #define MAX_OOM_REAP_RETRIES 10
 static void oom_reap_task(struct task_struct *tsk)
 {
-	int attempts = 0;
+	int attempts = 0, ret;
 	struct mm_struct *mm = tsk->signal->oom_mm;
 
-	/* Retry the mmap_read_trylock(mm) a few times */
-	while (attempts++ < MAX_OOM_REAP_RETRIES && !oom_reap_task_mm(tsk, mm))
+	/* Retry the mmap_read_trylock(mm) a few times; handing the lock over is not an attempt */
+	while ((ret = oom_reap_task_mm(tsk, mm)) &&
+	       (ret == -EAGAIN || ++attempts < MAX_OOM_REAP_RETRIES))
 		schedule_timeout_idle(HZ/10);
 
-	if (attempts <= MAX_OOM_REAP_RETRIES ||
-	    mm_flags_test(MMF_OOM_SKIP, mm))
+	if (!ret || mm_flags_test(MMF_OOM_SKIP, mm))
 		goto done;
 
 	pr_info("oom_reaper: unable to reap pid:%d (%s)\n",
@@ -1227,6 +1254,7 @@ SYSCALL_DEFINE2(process_mrelease, int, pidfd, unsigned int, flags)
 	if (!reap)
 		goto drop_mm;
 
+again:
 	if (mmap_read_lock_killable(mm)) {
 		ret = -EINTR;
 		goto drop_mm;
@@ -1235,8 +1263,15 @@ SYSCALL_DEFINE2(process_mrelease, int, pidfd, unsigned int, flags)
 	 * Check MMF_OOM_SKIP again under mmap_read_lock protection to ensure
 	 * possible change in exit_mmap is seen
 	 */
-	if (!mm_flags_test(MMF_OOM_SKIP, mm) && !__oom_reap_task_mm(mm))
-		ret = -EAGAIN;
+	if (!mm_flags_test(MMF_OOM_SKIP, mm)) {
+		ret = __oom_reap_task_mm(mm);
+		if (ret == -EAGAIN) {	/* a writer got the lock, queue up again */
+			ret = 0;
+			goto again;
+		}
+		if (ret == -EBUSY)
+			ret = -EAGAIN;
+	}
 	mmap_read_unlock(mm);
 
 drop_mm:
-- 
2.43.0

