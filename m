Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792634269;
	b=KDw0IvvJHcnYNpNneL2M/4gbxnHLyCIvi/YyWDgRJ3bB0RbK5NQKZGx3eM+U94X3GJap
	 mwvVOl8+jWF3j6v26bicEInkwUbXmRJ7H5Wy09ICV5S2pDRnGKPxurYs9JEZMht7d1CTN
	 lz5fTZmNEPbOMHuXapfJatJilj/RbV0lqXxWaKN2bXnZblcd8izSdvi5GRBTePtmHB/Pw
	 IJjbc7GGs/NbYxgsJIePUuhn+1S5zDcBMRCXZSCKxjUq1CVIYAwM6LrUhT1a6su0tdLlI
	 NEZCE9CiKitiUbM83SfTCm4kyeEyv0MxfiSL6MZV9QX13en2bf6lgFcS78jfl4WaQeg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792634269;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=t2IDhZYwVj7b9i7gM+96EPBlHJzaHOSETwMh33ACHTQ=;
	b=4iOHs4B7GouwER9zdtFRLCurU5WgJXCD6SOnsxkuyaCYhLsouT+wzEtVrotYv/os56wv
	 sWFs94/LPkVLWfGrKCCrA4ZGPXplkvk78tAoCMYmF/wSOsZEWaqMwyEg48VPenqp1yfKl
	 xBTZ2y1vV9PvhmnYqo35/7RAWJHR2E2B934bIIycc5NdUGGO7sjsHWvO+C2dm01iHBYze
	 RN63reFjNcxO9q8YVhvdnyitOSfQ5ldRE1AivkigTA0fJQ+WnwLgnAvxMRaadFsuZeCRY
	 lgR/eJ8Y9L9wLy8b3gkQNWMWaVUJJ7BdcoyqGdYMbLPgDm9vmkQKKUVCEOyMVh+SAOw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b="ROF1X/d1";
	arc=none smtp.remote-ip=209.85.210.171
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36C97606A31B
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 01:57:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 36C97606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=ROF1X/d1
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-8a06454116eso648245b3a.1
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 18:57:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792634269; x=1793239069; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=t2IDhZYwVj7b9i7gM+96EPBlHJzaHOSETwMh33ACHTQ=;
        b=ROF1X/d1WekqnaMVk96mEDwflKzYh2fsrnGt4rCvGBGRNpwJWRdk0xZxPOuMGGKCbQ
         KyFR2Mh664tt45toEYVejMc0bSFzRka5uSGduzyjn+GWeM6Vnlp3G3mOX8+F7cXlpKPd
         q16JiEASYf16l9dkzu775KWHM9Ms+dOUKtrc0pe2Fvwl0u39R9A+otjWPsYEZ7k3nte/
         z9Q4G8Sf4zKX6588OGIoE+q29h+3/DExU48NVEgI5pePjpqf+0c2snVW7uksJbgcnOBt
         svWBVRvkaDyBDExmddiPkiNucIFlTUE42aYn5n3Vkh/5tXDVVYo5SyQB+14I7K0s6DUy
         FwzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792634269; x=1793239069;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=t2IDhZYwVj7b9i7gM+96EPBlHJzaHOSETwMh33ACHTQ=;
        b=IL7YBHCJlZxV7enfkHf1MuTVaET2AXNcIfv/hwSWFxFQ7GoHVLr1ZFYjY4cbXMCmsR
         1mrvQ11bYphoxr5W9IeUgN1Tb/Jc0hi302qsa/LUPsQTAl3u6dT4P3It6Uekdp2O4Wyh
         UTplO7mKLGsWDYkTL2wtFokmheYrPM5W1kf1UxCSjFQ9lNA0DI0mM0xgm5cSN4Z1Mw9r
         sGjm/2PEWbJfCtjit+hKuGC4yh5ssgDgbKEfOIxPonhwr09Ai8yFQgdFle2Qixceayr2
         iCcqs3DamLICCvpxhhPe2KxMf94fdXmGF8DdGTDaRrN3y8lYpddg0jvVsOpBUTJoKTTy
         USRQ==
X-Forwarded-Encrypted: i=1; AKwUvBxbeXTKhtZGwG4KqC5/mOI8qmn0L5TQOHSlA8UWFoe/XedC4AQp17e4uxkc0Y2Duxdz4/+B/hhDd05y45E=@vger.kernel.org
X-Gm-Message-State: AFq9FYJn2HfqDYK2+HWecAhGzcu7gGWLErEbVQBMv1jxzH+FsMpad8Y2
	uElrxlrdJ45pABNXwC2hnbKn0geZFMM1Tn6HiHYsvRCN4/j6mTSVIOks
X-Gm-Gg: AYBFou3H0i1wN+2Cx7cyZ8k/o/f6wheVe71hU5gnB8E2P58Ah+CQwNwoFoTek0rG0nb
	siQcMyygQEX/lnhx9cFjLrQFqnQ3fTFalJ0kXGvgti+6b+KF3FVqbc74SgYD3bWM8jZ1+h7LWxU
	wwnBDpUS2uXUy0/6Ha4TwBx7H2lBv58vJXaHTPTgQNAp0+sljxWhFTCTLHMpzLbTz139BvVTAlO
	75TF4VE0hMGrXHmCXdHgYRGtBEuUmGBg19m992WuKesZnN46OZjPkuD2qujsZyZYF0ZFC+5zGSs
	Tu6OpGL0JDmSF3d2WCa0UYsjNUCRSbiJd7ezraKaLf4+BxQSIPeOB1IXixS1SqVjWttl3k/7ThN
	/0gF0i/rwatUwVrcW9KWuW94xWC2G2qXbmbOoppQUo24yARatTjuOJmEaSBdS0fGQdpyTdKXDjK
	yOAWEuhNGtYdEsrYAcoUInkX8aF7FlQ0/7OehkOPob+s+gVjc7cLanH/80NukAnCqocDjtKir9B
	alH/5cMNOegQ2NkXmnjdLyX/Pago4KVT7GN9GLEPbhimIqWZfQieZMKQQIc3JF+3PNIBqbz6bQU
	9eUtVKlZ/QaVPbhJjckzQF/DE1guATsvKHHCaWm9U51VfI5y35x+usLFLhCp6qrE7oCoE8EXCXa
	JOkitO0/AFLa00CM2dcpGS/tb
X-Received: by 2002:a05:6a20:b096:b0:3e2:200b:dc25 with SMTP id adf61e73a8af0-3e287d875c5mr2712316637.30.1792634268485;
        Wed, 21 Oct 2026 18:57:48 -0700 (PDT)
Received: from coder-ast-ast-dev-ml-0.tail2dda0.ts.net ([153.61.198.249])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8a0895d8e49sm1408036b3a.33.2026.10.21.18.57.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 18:57:47 -0700 (PDT)
From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
To: bpf@vger.kernel.org
Cc: daniel@iogearbox.net,
	andrii@kernel.org,
	eddyz87@gmail.com,
	memxor@gmail.com,
	oleg@redhat.com,
	peterz@infradead.org,
	mhiramat@kernel.org,
	jolsa@kernel.org,
	akpm@linux-foundation.org,
	liam@infradead.org,
	ljs@kernel.org,
	surenb@google.com,
	david@kernel.org,
	vbabka@kernel.org,
	jannh@google.com,
	hughd@google.com,
	kees@kernel.org,
	mingo@redhat.com,
	tglx@kernel.org,
	x86@kernel.org,
	linux-trace-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	linux-perf-users@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH bpf-next 5/9] uprobes: Don't sleep on mmap_lock under dup_mmap_sem
Date: Thu, 22 Oct 2026 01:57:08 +0000
Message-ID: <20261022015712.1297331-6-alexei.starovoitov@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261022015712.1297331-1-alexei.starovoitov@gmail.com>
References: <20261022015712.1297331-1-alexei.starovoitov@gmail.com>
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

From: Alexei Starovoitov <ast@kernel.org>

register_for_each_vma() takes dup_mmap_sem for writing, collects mms that
map the file and takes mmap_lock of every mm. fork() takes dup_mmap_sem for
reading. When mmap_lock of one mm is busy every fork() in the system waits
for it:

  A:       mmap(MAP_POPULATE) -> mmap_read_lock(A)
  tracer:  percpu_down_write(&dup_mmap_sem), mmap_write_lock(A) sleeps
  others:  fork() -> percpu_down_read(&dup_mmap_sem) sleeps

Only trylock mmap_lock under dup_mmap_sem. Leave mms with busy mmap_lock in
the list, drop dup_mmap_sem and then wait for them.

dup_mmap_sem makes sure that mm doesn't fork between build_map_info() and
install_breakpoint() or remove_breakpoint(). Otherwise the child misses
the breakpoint, or inherits the breakpoint of uprobe that is gone and gets
SIGTRAP. Now mm in the list can fork. dup_mmap() holds mmap_lock of
the parent, so uprobe_dup_mmap() does what the walk is going to do to this
mm before vmas are copied. The walk sees info->done and skips it.

The error in uprobe_dup_mmap() is the error of the walk, unless fork() is
being killed. Such fork() fails in copy_process() and there is no child, so
leave mm to the walk. With ref_ctr_offset the walk can update the counter
twice in this case.

dup_mmap_sem protects the list of walks. mm in the list is kept by
mm_count. The walk takes mm_users only for the visit, so the process that
exits meanwhile frees its memory.

Busy mms are visited last. The tracer that is killed while it waits for one
of them has installed the breakpoint in all other mms and cannot remove it.
"uprobes: Don't leak the breakpoints if the unregistering task is killed"
fixes that.

Process A loops over mmap(4G, MAP_POPULATE) and munmap(). A and 10 idle
processes map the file. Process B calls fork() in a loop. 32 cpu VM.
Median (max) of 15-25 runs, msec:

                         the longest fork() in B    attach
                         before      after          before  after
 uprobe_multi, 1 uprobe  197 (209)   0.33 (0.70)       210    233
 uprobe_multi, 4 uprobes 421 (429)   0.38 (0.60)      1467   1532
 perf_event, 4 uprobes   422 (439)   0.43 (0.59)      3135   3289

During detach: 264-423 -> 0.35-0.47. Attach and detach still wait for
mmap_lock of A. B doesn't.

The tracer pays when traced processes fork all the time. mm that forks
holds its mmap_lock, so the walk sleeps on many mms in turn. Fork storms of
1200, 2000 and 5000 processes, 6 cpu VM, msec, without and with the series:

 enable uprobe event    105 -> 205   201 -> 481   207 -> 784
 disable uprobe event   225 -> 294   354 -> 579   407 -> 893

Signed-off-by: Alexei Starovoitov <ast@kernel.org>
---
 kernel/events/uprobes.c | 178 ++++++++++++++++++++++++++++++++--------
 1 file changed, 143 insertions(+), 35 deletions(-)

diff --git a/kernel/events/uprobes.c b/kernel/events/uprobes.c
index 6792004be6fa..a9274016c55d 100644
--- a/kernel/events/uprobes.c
+++ b/kernel/events/uprobes.c
@@ -1192,8 +1192,29 @@ struct map_info {
 	struct map_info *next;
 	struct mm_struct *mm;
 	unsigned long vaddr;
+	bool done;
 };
 
+/*
+ * Every fork() waits for dup_mmap_sem, so register_for_each_vma() must not
+ * sleep on mmap_lock while it holds dup_mmap_sem. It leaves mms with busy
+ * mmap_lock in ->busy, drops dup_mmap_sem, and only then waits for them.
+ *
+ * Such mm can fork before its turn comes. dup_mmap() holds its mmap_lock, so
+ * uprobe_dup_mmap() does what the walk is going to do to this mm, and
+ * the child has the same breakpoints as the child of mm that wasn't busy.
+ */
+struct uprobe_walk {
+	struct list_head list;
+	struct uprobe *uprobe;
+	struct uprobe_consumer *new;
+	struct map_info *busy;
+	int err;
+};
+
+/* dup_mmap_sem protects the list and ->busy of every walk in it */
+static LIST_HEAD(uprobe_walks);
+
 static inline struct map_info *free_map_info(struct map_info *info)
 {
 	struct map_info *next = info->next;
@@ -1242,6 +1263,7 @@ build_map_info(struct address_space *mapping, loff_t offset, bool is_register)
 
 		info->mm = vma->vm_mm;
 		info->vaddr = offset_to_vaddr(vma, offset);
+		info->done = false;
 	}
 	i_mmap_unlock_read(mapping);
 
@@ -1271,26 +1293,79 @@ build_map_info(struct address_space *mapping, loff_t offset, bool is_register)
 	return curr;
 }
 
-static int
-register_for_each_vma(struct uprobe *uprobe, struct uprobe_consumer *new)
+/*
+ * mmap_lock of info->mm is held for writing. info->done is set under it.
+ * The walk also tests it without mmap_lock, to skip mm.
+ */
+static void register_one_mm(struct uprobe_walk *walk, struct map_info *info,
+			    bool in_fork)
 {
+	struct uprobe_consumer *new = walk->new;
+	struct uprobe *uprobe = walk->uprobe;
+	struct mm_struct *mm = info->mm;
+	struct vm_area_struct *vma;
 	bool is_register = !!new;
-	struct map_info *info;
 	int err = 0;
 
+	if (info->done)
+		return;
+
+	if (is_register && READ_ONCE(walk->err))
+		goto done;
+
+	if (check_stable_address_space(mm))
+		goto done;
+
+	vma = find_vma(mm, info->vaddr);
+	if (!vma || !valid_vma(vma, is_register) ||
+	    file_inode(vma->vm_file) != uprobe->inode)
+		goto done;
+
+	if (vma->vm_start > info->vaddr ||
+	    vaddr_to_offset(vma, info->vaddr) != uprobe->offset)
+		goto done;
+
+	if (is_register) {
+		/* consult only the "caller", new consumer. */
+		if (consumer_filter(new, mm))
+			err = install_breakpoint(uprobe, vma, info->vaddr);
+	} else if (mm_flags_test(MMF_HAS_UPROBES, mm)) {
+		if (!filter_chain(uprobe, mm))
+			err = remove_breakpoint(uprobe, vma, info->vaddr);
+	}
+
+	if (err) {
+		/*
+		 * fork() was killed meanwhile. This is not the error of
+		 * the walk. See uprobe_dup_mmap().
+		 */
+		if (in_fork && fatal_signal_pending(current))
+			return;
+		WRITE_ONCE(walk->err, err);
+	}
+ done:
+	WRITE_ONCE(info->done, true);
+}
+
+static int
+register_for_each_vma(struct uprobe *uprobe, struct uprobe_consumer *new)
+{
+	struct uprobe_walk walk = { .uprobe = uprobe, .new = new };
+	struct map_info *info, *next;
+
 	percpu_down_write(&dup_mmap_sem);
-	info = build_map_info(uprobe->inode->i_mapping,
-					uprobe->offset, is_register);
+	info = build_map_info(uprobe->inode->i_mapping, uprobe->offset, !!new);
 	if (IS_ERR(info)) {
-		err = PTR_ERR(info);
-		goto out;
+		percpu_up_write(&dup_mmap_sem);
+		return PTR_ERR(info);
 	}
 
-	while (info) {
+	for (; info; info = next) {
 		struct mm_struct *mm = info->mm;
-		struct vm_area_struct *vma;
 
-		if (err && is_register)
+		next = info->next;
+		/* If install failed the caller is going to undo it */
+		if (new && walk.err)
 			goto free;
 		/*
 		 * We take mmap_lock for writing to avoid the race with
@@ -1299,38 +1374,56 @@ register_for_each_vma(struct uprobe *uprobe, struct uprobe_consumer *new)
 		 * is_trap_at_addr() true right after find_uprobe_rcu()
 		 * returns NULL in find_active_uprobe_rcu().
 		 */
-		mmap_write_lock(mm);
-		if (check_stable_address_space(mm))
-			goto unlock;
-
-		vma = find_vma(mm, info->vaddr);
-		if (!vma || !valid_vma(vma, is_register) ||
-		    file_inode(vma->vm_file) != uprobe->inode)
-			goto unlock;
-
-		if (vma->vm_start > info->vaddr ||
-		    vaddr_to_offset(vma, info->vaddr) != uprobe->offset)
-			goto unlock;
-
-		if (is_register) {
-			/* consult only the "caller", new consumer. */
-			if (consumer_filter(new, mm))
-				err = install_breakpoint(uprobe, vma, info->vaddr);
-		} else if (mm_flags_test(MMF_HAS_UPROBES, mm)) {
-			if (!filter_chain(uprobe, mm))
-				err |= remove_breakpoint(uprobe, vma, info->vaddr);
+		if (!mmap_write_trylock(mm)) {
+			/*
+			 * uprobe_dup_mmap() compares info->mm until list_del().
+			 * Keep mm_struct, but not the memory of the process.
+			 */
+			mmgrab(mm);
+			mmput_async(mm);
+			info->next = walk.busy;
+			walk.busy = info;
+			continue;
 		}
-
- unlock:
+		register_one_mm(&walk, info, false);
 		mmap_write_unlock(mm);
  free:
 		/* exit_mmap() of the last user must not run under dup_mmap_sem */
 		mmput_async(mm);
-		info = free_map_info(info);
+		kfree(info);
 	}
- out:
+
+	if (!walk.busy) {
+		percpu_up_write(&dup_mmap_sem);
+		return walk.err;
+	}
+
+	list_add(&walk.list, &uprobe_walks);
 	percpu_up_write(&dup_mmap_sem);
-	return err;
+
+	for (info = walk.busy; info; info = info->next) {
+		struct mm_struct *mm = info->mm;
+
+		/* Don't wait for mm if its fork() did it or if install failed */
+		if (READ_ONCE(info->done) || (new && READ_ONCE(walk.err)))
+			continue;
+		/* All users are gone, like in build_map_info() */
+		if (!mmget_not_zero(mm))
+			continue;
+		mmap_write_lock(mm);
+		register_one_mm(&walk, info, false);
+		mmap_write_unlock(mm);
+		mmput(mm);
+	}
+
+	percpu_down_write(&dup_mmap_sem);
+	list_del(&walk.list);
+	percpu_up_write(&dup_mmap_sem);
+
+	for (info = walk.busy; info; info = free_map_info(info))
+		mmdrop(info->mm);
+
+	return walk.err;
 }
 
 /**
@@ -1841,6 +1934,21 @@ void uprobe_end_dup_mmap(void)
 
 void uprobe_dup_mmap(struct mm_struct *oldmm, struct mm_struct *newmm)
 {
+	struct uprobe_walk *walk;
+	struct map_info *info;
+
+	list_for_each_entry(walk, &uprobe_walks, list) {
+		/*
+		 * fork() that is being killed fails in copy_process().
+		 * There will be no child. Leave oldmm to the walk.
+		 */
+		if (fatal_signal_pending(current))
+			break;
+		for (info = walk->busy; info; info = info->next)
+			if (info->mm == oldmm)
+				register_one_mm(walk, info, true);
+	}
+
 	if (mm_flags_test(MMF_HAS_UPROBES, oldmm)) {
 		mm_flags_set(MMF_HAS_UPROBES, newmm);
 		/* unconditionally, dup_mmap() skips VM_DONTCOPY vmas */
-- 
2.55.0

