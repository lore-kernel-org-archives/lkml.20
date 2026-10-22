Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792634276;
	b=zA/wmaztWJWomTvN1BPLr9/yI7Sp0X/nHbKzf96pKf2rWplUiO8HDtgTbUSmXT2JcIhj
	 KpSiJAcJB00wW+0Dm+1tXjf7g7d9zCrAiJHThoce9XTyUahRBMPsD0tOFrbQgtGFt5HGU
	 Vk2oZPdsxedgrjCpqYvlzhFWPeA5oXgC27pXY5YWxLy+nz3UuPr5cdAN51x2gHKl4QKQg
	 jf7liBGuxLPnaQSKZTUIwzg8jPRoQMs/9RlCvPGO/lbAhWIQGl4AKOPBYkilVxoHtNL0V
	 q0lbk3N7wWS9I8fmIVaDrLM9h4ZG9JfHPyczsfhoawSWps/a3+rNCNgpQi3OxaymPdw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792634276;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=fW9kk5xIMv5VRWKeoldYnyO29pC8D9VMf22Va3ehq2w=;
	b=o2EE/zvPF+s0Re+x2v6Uc/IvtkPmzwHoaSLGmQUr+Do8l9P46EZpKA163QSmMvTUks6H
	 VK8h0nRMOqyyIzPYDyUsBxGphC7oSG8Vuin9oLejNGlAnI/17ZCIhzptzhfnq85nc/FQG
	 r+ft5iWvMUo7kZR98v7tIKBTd/8pWfflD7/PffUulgf24HAydgs4z7pEwEl+Q2kcfWtp3
	 IoymulK3oNiWsqoZ0bOgNAygRTswNqVBX/z92pp0Qcz6LdwhVbvrIa5qcznXmZOa2zkr5
	 poOPDpfm8+mYE2hefk5WR2SPoeqIu7Qdxe8WpTOlNAr8lcGIke6yW0WSyT7Sk77kVLg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=kvZAYc+1;
	arc=none smtp.remote-ip=209.85.216.44
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDAAB606A31B
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 01:57:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DDAAB606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=kvZAYc+1
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-3ad41b47541so1137504a91.1
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 18:57:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792634275; x=1793239075; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fW9kk5xIMv5VRWKeoldYnyO29pC8D9VMf22Va3ehq2w=;
        b=kvZAYc+1CpoMf04ISXJf7cuLi7nULaJQjveKdR+IHz28RvsVivM0zvQyH+vdCLzIIi
         uk77pd2erzg1H4buNmrwCp0kZ6EbIzK3ITeVdgHUn1Hok/k3PdvjgtPUb+mAQqMeDNGT
         ghxMIfYFK3KZodMu5F/mdkyFvVwvmwHm2SGmb6YYPRdYJrNfqqQ9SRBLlxgai4WlA3xv
         rCy2iFIkprELx/qtFYFpdh6HCyM0Hu4nvIhHNHj2DYuHGA3uP2101ryOEthBQtrEZC99
         6UnsLSb4U4M9YPwGENfVVBL0JR+Z/ZXw57HFLsC434cFz4UqgxgCg58X/km8iSbsD2Kg
         4aRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792634275; x=1793239075;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=fW9kk5xIMv5VRWKeoldYnyO29pC8D9VMf22Va3ehq2w=;
        b=wRpUAN0hrCls2fne5zWlRR8IMZqAILblhiasxqWipOeUEj5hpPTqCebESHagQxYOkt
         ltNDCrHFgj75LFP7Hk7snslCMQkUShPcPtxDFnnAM8HVEraQuxBkeutevsx4zgjsPPl+
         Agdy1cmbZIuY3k3B2wokHd5oszauam74ogASukw64oYXrKJ4LgJOASGByQzpG29OF5NT
         mqSNjFXiTMU1iRNgWIjT722eVUJ2xKaa5ei1vW21Vrlb2b+Wpj/0qgPqS+K78Cbl1LGQ
         SQkn1rQJRreUsicur0dSzjfb8rULV5RSu7D0v6HiNysud9eNibPMGYfWRS0h0dl3Z0Z1
         rv8Q==
X-Forwarded-Encrypted: i=1; AKwUvBz3ByMqT/HAsOv/2+9zKRA8NKgj2PpT5JOSou800+Th1C79E8fB0e4XKxdrL4632Ks0x+SbEVz6OfZAa3A=@vger.kernel.org
X-Gm-Message-State: AFq9FYI4vYsL7C945duqpxc3LVeZwDXLvM12WUYqr4xMyL6oriR2aB9n
	qhhbODDPKzHLgjmE1tTDDPj1nvAavQfOB9tCauMT5Yi7Hl2BbkTGKcTs
X-Gm-Gg: AYBFou34RptVqAWUATjZjXbnxLT6J/vASAgFwmWAqez+j84BsSSSBwQNhBysyEvvCBW
	Pq8Janv3k+pGTv9le9LzGYAWiNNOd/ro6UTWMKUJyc18Tg7uvwM16LdWsXpSp9Ly5HIWRZksXTu
	YQVFnMxZUvKFXR2bHThqYuGlQPWooH8EcAHD7zcl3ZTnigrAzEgGZxNj5/fVk8V5crLBxwANTbZ
	cElGIae3uWwG8y+UqNS9jJj+keQojaA+5rqFs0QAESbKC0O9Lj91ZNbCPbEpcvu1q8irvkqV9Pa
	xFW150IqyrehsrnIlJ/FcLr05ZaOkP8RCUQh8XecPFJqm1Av1lhwitDwKRuPsCrf4kOjUKEUI8Z
	HChn2vsohrkhb8e4A+YUVp1ch+3x5sdp3IElwRv48MdEBCJw+U/V65bSdn2GqFy7hWoXI0MsjB2
	lYpHYZSw5dlfkSqzVgFmnmbYFHqScfQvZLstBf3DGPZ49Z0PiCITpEZINXMHArxRYfIX87xNhyD
	F/hzXXpkoaFqAOVgtH+2SPuZVL5wJSOJUB+Rr55fjFVx+XLOB2MgmU/+f82IrmJ6o1Va/KLnmQk
	Blym4aPzQ9b55uJDBCZNWBmcxFl0VnB6MxXuhtWqubA+wcc3RisFsZx5jdU8Xs8HWHjPz2fU1Z9
	BXmPHGIgexH8lwJHG7IaYRzwF
X-Received: by 2002:a17:90b:4b0a:b0:3ac:8446:c1b5 with SMTP id 98e67ed59e1d1-3ad86f45340mr3130506a91.31.1792634275135;
        Wed, 21 Oct 2026 18:57:55 -0700 (PDT)
Received: from coder-ast-ast-dev-ml-0.tail2dda0.ts.net ([153.61.198.250])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ada490d4bfsm1991495a91.10.2026.10.21.18.57.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 18:57:54 -0700 (PDT)
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
Subject: [PATCH bpf-next 6/9] uprobes: Don't sleep on mmap_lock with dup_mmap_sem held in dup_mmap()
Date: Thu, 22 Oct 2026 01:57:09 +0000
Message-ID: <20261022015712.1297331-7-alexei.starovoitov@gmail.com>
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

dup_mm() takes dup_mmap_sem for reading and then dup_mmap() sleeps on
mmap_lock of the parent. When another thread keeps that mmap_lock busy
register_for_each_vma() waits for the reader, and every other fork() in
the system waits for the writer. The parent doesn't have to map the file:

  A thread 1:  mmap(MAP_POPULATE) -> mmap_read_lock(A)
  A thread 2:  fork() -> percpu_down_read(&dup_mmap_sem),
               mmap_write_lock_killable(A) sleeps
  tracer:      percpu_down_write(&dup_mmap_sem) sleeps
  others:      fork() -> percpu_down_read(&dup_mmap_sem) sleeps

dup_mmap() needs both locks. Don't sleep on one of them while holding
the other. Sleep on mmap_lock and trylock dup_mmap_sem. If that fails sleep
on dup_mmap_sem and trylock mmap_lock, and so on. Taking mmap_lock and then
sleeping on dup_mmap_sem is simpler, but then all threads of the parent
wait for mmap_lock as long as the writer holds dup_mmap_sem.

Both are taken in dup_mmap() now, so release dup_mmap_sem there too.
Commit 8ac662f5da19 ("fork: avoid inappropriate uprobe access to invalid
mm") moved that to dup_mm() to hide the child from uprobes until mmput()
when dup_mmap() fails. Since commit 43873af772f8 ("mm: change dup_mmap()
recovery") dup_mmap() removes all vmas of such child before it drops
mmap_lock.

dup_mmap_sem is released before dup_userfaultfd_complete(), so the monitor
that doesn't read UFFD_EVENT_FORK no longer blocks every fork(). During
that wait register_for_each_vma() can find the child, while no task points
to its mm. The next patch deals with that.

Thread 1 of process A loops over mmap(4G, MAP_POPULATE) and munmap().
Thread 2 calls fork() in a loop. Nobody maps the file. Process B calls
fork() in a loop. 32 cpu VM. Median (max) of 15-25 runs, msec:

                         the longest fork() in B    attach
                         before      after          before  after
 uprobe_multi, 1 uprobe  206 (219)   0.10 (0.30)       220   11.7
 uprobe_multi, 4 uprobes 208 (428)   0.08 (0.32)       219   13.5
 perf_event, 4 uprobes   419 (424)   0.10 (0.44)       632   11.4

During detach: 265-293 -> 0.19-0.37.

Signed-off-by: Alexei Starovoitov <ast@kernel.org>
---
 include/linux/uprobes.h |  5 +++++
 kernel/events/uprobes.c |  5 +++++
 kernel/fork.c           |  4 ----
 mm/mmap.c               | 19 +++++++++++++++++--
 4 files changed, 27 insertions(+), 6 deletions(-)

diff --git a/include/linux/uprobes.h b/include/linux/uprobes.h
index d34dbc0fbbfe..6d74efa80d04 100644
--- a/include/linux/uprobes.h
+++ b/include/linux/uprobes.h
@@ -211,6 +211,7 @@ extern void uprobe_unregister_sync(void);
 extern int uprobe_mmap(struct vm_area_struct *vma);
 extern void uprobe_munmap(struct vm_area_struct *vma, unsigned long start, unsigned long end);
 extern void uprobe_start_dup_mmap(void);
+extern bool uprobe_try_start_dup_mmap(void);
 extern void uprobe_end_dup_mmap(void);
 extern void uprobe_dup_mmap(struct mm_struct *oldmm, struct mm_struct *newmm);
 extern void uprobe_free_utask(struct task_struct *t);
@@ -277,6 +278,10 @@ uprobe_munmap(struct vm_area_struct *vma, unsigned long start, unsigned long end
 static inline void uprobe_start_dup_mmap(void)
 {
 }
+static inline bool uprobe_try_start_dup_mmap(void)
+{
+	return true;
+}
 static inline void uprobe_end_dup_mmap(void)
 {
 }
diff --git a/kernel/events/uprobes.c b/kernel/events/uprobes.c
index a9274016c55d..92ccb730278f 100644
--- a/kernel/events/uprobes.c
+++ b/kernel/events/uprobes.c
@@ -1927,6 +1927,11 @@ void uprobe_start_dup_mmap(void)
 	percpu_down_read(&dup_mmap_sem);
 }
 
+bool uprobe_try_start_dup_mmap(void)
+{
+	return percpu_down_read_trylock(&dup_mmap_sem);
+}
+
 void uprobe_end_dup_mmap(void)
 {
 	percpu_up_read(&dup_mmap_sem);
diff --git a/kernel/fork.c b/kernel/fork.c
index 10f2d05d816a..8fd6be932afe 100644
--- a/kernel/fork.c
+++ b/kernel/fork.c
@@ -1539,11 +1539,9 @@ static struct mm_struct *dup_mm(struct task_struct *tsk,
 	if (!mm_init(mm, tsk))
 		goto fail_nomem;
 
-	uprobe_start_dup_mmap();
 	err = dup_mmap(mm, oldmm);
 	if (err)
 		goto free_pt;
-	uprobe_end_dup_mmap();
 
 	mm->hiwater_rss = get_mm_rss(mm);
 	mm->hiwater_vm = mm->total_vm;
@@ -1558,8 +1556,6 @@ static struct mm_struct *dup_mm(struct task_struct *tsk,
 	mm->binfmt = NULL;
 	mm_init_owner(mm, NULL);
 	mmput(mm);
-	if (err)
-		uprobe_end_dup_mmap();
 
 fail_nomem:
 	return NULL;
diff --git a/mm/mmap.c b/mm/mmap.c
index 4bf26b0f1e6e..6ce654e33e3b 100644
--- a/mm/mmap.c
+++ b/mm/mmap.c
@@ -1713,8 +1713,22 @@ __latent_entropy int dup_mmap(struct mm_struct *mm, struct mm_struct *oldmm)
 	LIST_HEAD(uf);
 	VMA_ITERATOR(vmi, mm, 0);
 
-	if (mmap_write_lock_killable(oldmm))
-		return -EINTR;
+	/*
+	 * Take mmap_lock of oldmm and dup_mmap_sem of uprobes.
+	 * Don't sleep on one of them while holding the other.
+	 */
+	for (;;) {
+		if (mmap_write_lock_killable(oldmm))
+			return -EINTR;
+		if (uprobe_try_start_dup_mmap())
+			break;
+		mmap_write_unlock(oldmm);
+
+		uprobe_start_dup_mmap();
+		if (mmap_write_trylock(oldmm))
+			break;
+		uprobe_end_dup_mmap();
+	}
 	flush_cache_dup_mm(oldmm);
 	uprobe_dup_mmap(oldmm, mm);
 	/*
@@ -1883,6 +1897,7 @@ __latent_entropy int dup_mmap(struct mm_struct *mm, struct mm_struct *oldmm)
 	mmap_write_unlock(mm);
 	flush_tlb_mm(oldmm);
 	mmap_write_unlock(oldmm);
+	uprobe_end_dup_mmap();
 	if (!retval)
 		dup_userfaultfd_complete(&uf);
 	else
-- 
2.55.0

