Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792634283;
	b=MzyjVBgdKmANqT1HNC9I/zj+fNvA8Ww1bMXPVkHXS3SNB+kqloaFv6fvroqXy3/MoaPa
	 f1etrCTo+9Y/8c/lVORjPDgf5NfQHT4p78wwa0k8aFHlAky6mSRg0iVzzm5PlHuJNUQdD
	 03WZnN2+5QZccshyOORZu4iYGhZysvoikrobVk8zWdmJYx6+ZlTjEtB0nMYx+axqcxPCd
	 ryWdTXCB7w8wYtIEvsex+h60EU6sFyMUyLwbcryHji1Wuvd5bKlfg8GRdDoojtasrMork
	 oh0iTI7Q+oGYOdr7hmq01pZLtLu7gx5MVptgeaPVpzP27ddUUpOWUlep78Vsm/MVc3w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792634283;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=erBvMxyeCCyC8K/1NyLhHI0mkOqFJyJCPxOLNLg56iI=;
	b=gpjIt6ecFqCIZsscpg1FZ/Y9q+ywfqVBITOxcu81n0Q2Z2YaCSulzCNMKowA6+/rdpwp
	 DAQOvpSLx7XTw32AMex2cB9s4zG+WLPaJcrbmTrirD907uUybkqZYAmJxdTfp77bKTAEp
	 1pQTNzEjGeW29iJ+5yYFXSBhhLwawmRKpwYcJs4VBHiBXtxRVY3TfvfY5Lfa08szm5Mb+
	 9sILgNQQdGyK9/dtYOba/IoTCJUf9E9YAscDfV96roRDiCEkfiJaQ503Zhq8303ukFEJa
	 y3pXpbSHMyAlXpA6nX89BOT+/+8ciMCrNCTLLdfql1bpRBbX8p9YuhKLioz/QVINZsw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=IFKEKRsq;
	arc=none smtp.remote-ip=209.85.214.170
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B240A606A31D
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 01:58:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B240A606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=IFKEKRsq
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2e940d5d2beso5285795ad.0
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 18:58:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792634282; x=1793239082; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=erBvMxyeCCyC8K/1NyLhHI0mkOqFJyJCPxOLNLg56iI=;
        b=IFKEKRsqFaZjucw+rqR4ryTGBSp6IDf1i5gaP/nvE9Wndr/QCOZn/7yv9UpaKZHjDW
         8/qyEA5iS19EeITAWkeyWrMT+JTRum1RMsLopl0wBBbhATjbhMHOkwMspb7/m6mO/BmT
         pfVK8W7BlQpeEkx7qfVaNeDcMUgnW4ewjeTmIoIFaKAue3DgHNDQZS/6PVOffg3EDz9t
         k9mZgSSMef4WmBGQmCR6sCoBnqW9r1Hm6mhecwOw4RqmvPO1etWZqFuPJzYWB7QaFvPK
         PNESNeRhCzNr+XEjblAL7LZO5n9/FCFC9VKwF+DgX0t7XnCL861klOfl4Nys4q4D2M7y
         OkIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792634282; x=1793239082;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=erBvMxyeCCyC8K/1NyLhHI0mkOqFJyJCPxOLNLg56iI=;
        b=b29Tl2E1MShISlxP0sCRypAYbJHJ++CnzJV2ZKlaaYvpHq2yqPIwpDyRWMR24jXtdQ
         8pxyF3qreUNMoRlQMlnA1H1gjZFWy9ppnWkgZGccVnDNwJhvI/GPnevGpkbl6fXv76vC
         NAz1NXxTB6JxjPVIZ/x9TEgtgy8r76NypMbdQo5eGchHVIolgoODGelyWXmZWZyh0LMy
         ictWogDw+p8r7KZZARxdhgBBS89hBVBup350f0DL8FX+wB2/KOWUE8FYnAjFgSx3KdT+
         1zdpEAwknqjMgiSJTXXbzwhe44+rjLXsO0gjt+0vyF8QJH1ytd4BxNYtBFsnHDawMTWD
         WPxg==
X-Forwarded-Encrypted: i=1; AKwUvBzBOOXiwUyGZZNVNPyTIZzyu0wiRz/st+JO4RQY4INiA+aSEl2i/0k7sNKjwFrQj83K0MlBr3M5tMI20ik=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ4Q3zMQ/4Kmbu6yy5uojq2r1jHmMZQ6vCIvuIVCgBZ2LzQbgZA
	gMJf4fnapsUim0NsMC4uns+8Z14CNcKz+y++gLRo7x/ewT10HHFXPqAv
X-Gm-Gg: AYBFou2uSmY+sBgS/Zj8NLItckxrDcTafYjiQ9oxXUgRgjgCYihYXNVLjBez0JETwIs
	OHSqexszuq/Ol7kNsS/pgNqmqnzBOaNOZ6xhmNi77BNVTLUU8q/GgGnpRUeAd81JA+MG2M2dZLK
	kN3k68aA3a3pPMpg9ambk0hQCecM5VivQVpZUMD0Mu+QhN4qkpvUBPhSzumTt7q4SlROjtjzjoh
	Anq6JOaIV3Lwm35k55VEHdEP1QVQCv5UJJ7dgk4sTRt7VPHAWEA9SnTZFhepyFBmKmxfZeIPQtX
	p4VTEGB9osAIiYbA8PGEU2FVKUMv9B1BF0gEdW0/E3omeIGEfHrAsgvktHQi062coyLPo2iOMXZ
	XSSxTfxOPseMMwRQOZvk+aoxkjKDpWc+i3VwVF5wtN8epSl0Jwala5VtgCZ/2mB0020RDrB0xT2
	vuDKH35aAlD2G06y5nC2QzuVJDXH0+POI3cXA7213AHdrzhLRLDrzSnx8NQRV4C1bHp60CgXYjD
	lhhrGjU6Y7u5Q4FIC4u4RvsH36/YjHy7CxMDMCcCwSixaIAm87guQIS7Jw30Pu/4+ArPFKYj2f5
	GIRBrnMWXbV/RY3jp6kCYUolrvt9gNODpIAjSRJf73ejoWHPyp0zTDAkvx8Xm8vgLIqJOYMJXs7
	wXIc7+zfbGD/IJn2DCCnIQv8D
X-Received: by 2002:a17:90a:e7c8:b0:3ab:d45c:59e2 with SMTP id 98e67ed59e1d1-3ad86f1b28fmr2821607a91.55.1792634281882;
        Wed, 21 Oct 2026 18:58:01 -0700 (PDT)
Received: from coder-ast-ast-dev-ml-0.tail2dda0.ts.net ([153.61.198.249])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ada490e5edsm1751706a91.8.2026.10.21.18.58.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 18:58:01 -0700 (PDT)
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
Subject: [PATCH bpf-next 7/9] fork: Let the new task point to its mm before uprobes can find it
Date: Thu, 22 Oct 2026 01:57:10 +0000
Message-ID: <20261022015712.1297331-8-alexei.starovoitov@gmail.com>
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

uprobe_perf_filter() compares event->hw.target->mm with mm. The target of
an inherited event is the new task. copy_mm() sets tsk->mm after dup_mm()
returned, but register_for_each_vma() can find the new mm as soon as
dup_mmap() releases dup_mmap_sem. No task points to this mm yet, so
the filter says that nobody wants it.

The walk that removes the breakpoint, because another consumer of the same
uprobe goes away, sees !filter_chain() and removes it from the child.
Nobody installs it again, and the inherited event doesn't see this child.

It's an old bug with a short window. The previous patch releases
dup_mmap_sem before dup_userfaultfd_complete(), so with UFFD_EVENT_FORK
the window is as long as the monitor likes.

Set tsk->mm at the end of dup_mmap() before it releases dup_mmap_sem.
Not earlier. The new task can be reached via its perf events and from bpf
progs. They shouldn't find mm that is half copied. Clear tsk->mm when
dup_mm() fails after dup_mmap(). Do both under task_lock() like exec_mmap()
and exit_mm().

The tasks with such event fork, while another consumer of the same uprobe
comes and goes. 5 cpu VM, 90 sec and 7000 children per run. The number of
children that the inherited event didn't see:

  without this series          11 to 24, 8 runs
  patches 1, 2, 5, 6 only      23, 12, 21
  this series                  0, 0, 0

With UFFD_EVENT_FORK monitor that reads the event after 5 sec the child
lost the breakpoint in 5 of 5 runs without this patch, and in 0 of 5 with.

Signed-off-by: Alexei Starovoitov <ast@kernel.org>
---
 kernel/fork.c |  9 ++++++++-
 mm/internal.h |  3 ++-
 mm/mmap.c     | 14 +++++++++++++-
 mm/nommu.c    |  3 ++-
 4 files changed, 25 insertions(+), 4 deletions(-)

diff --git a/kernel/fork.c b/kernel/fork.c
index 8fd6be932afe..5a2f571b64b7 100644
--- a/kernel/fork.c
+++ b/kernel/fork.c
@@ -1539,7 +1539,7 @@ static struct mm_struct *dup_mm(struct task_struct *tsk,
 	if (!mm_init(mm, tsk))
 		goto fail_nomem;
 
-	err = dup_mmap(mm, oldmm);
+	err = dup_mmap(tsk, mm, oldmm);
 	if (err)
 		goto free_pt;
 
@@ -1552,6 +1552,13 @@ static struct mm_struct *dup_mm(struct task_struct *tsk,
 	return mm;
 
 free_pt:
+	/*
+	 * dup_mmap() has set it if it succeeded. get_task_mm() must not find
+	 * it after the mmput() below.
+	 */
+	task_lock(tsk);
+	tsk->mm = NULL;
+	task_unlock(tsk);
 	/* don't put binfmt in mmput, we haven't got module yet */
 	mm->binfmt = NULL;
 	mm_init_owner(mm, NULL);
diff --git a/mm/internal.h b/mm/internal.h
index 9e3be236f18c..70e40306d881 100644
--- a/mm/internal.h
+++ b/mm/internal.h
@@ -1520,7 +1520,8 @@ int walk_page_range_debug(struct mm_struct *mm, unsigned long start,
 			  pgd_t *pgd, void *private);
 
 void dup_mm_exe_file(struct mm_struct *mm, struct mm_struct *oldmm);
-int dup_mmap(struct mm_struct *mm, struct mm_struct *oldmm);
+int dup_mmap(struct task_struct *tsk, struct mm_struct *mm,
+	     struct mm_struct *oldmm);
 
 int remap_pfn_range_prepare(struct vm_area_desc *desc);
 int remap_pfn_range_complete(struct vm_area_struct *vma,
diff --git a/mm/mmap.c b/mm/mmap.c
index 6ce654e33e3b..3167272a77ad 100644
--- a/mm/mmap.c
+++ b/mm/mmap.c
@@ -46,6 +46,7 @@
 #include <linux/pkeys.h>
 #include <linux/oom.h>
 #include <linux/sched/mm.h>
+#include <linux/sched/task.h>
 #include <linux/ksm.h>
 #include <linux/memfd.h>
 
@@ -1705,7 +1706,8 @@ bool mmap_read_lock_maybe_expand(struct mm_struct *mm,
 	return true;
 }
 
-__latent_entropy int dup_mmap(struct mm_struct *mm, struct mm_struct *oldmm)
+__latent_entropy int dup_mmap(struct task_struct *tsk, struct mm_struct *mm,
+			      struct mm_struct *oldmm)
 {
 	struct vm_area_struct *mpnt, *tmp;
 	int retval;
@@ -1897,6 +1899,16 @@ __latent_entropy int dup_mmap(struct mm_struct *mm, struct mm_struct *oldmm)
 	mmap_write_unlock(mm);
 	flush_tlb_mm(oldmm);
 	mmap_write_unlock(oldmm);
+	if (!retval) {
+		/*
+		 * As soon as dup_mmap_sem is released uprobes can find mm via
+		 * the rmap tree and ask the consumers if they want it. The
+		 * filter of an inherited perf event looks for mm in tsk->mm.
+		 */
+		task_lock(tsk);
+		tsk->mm = mm;
+		task_unlock(tsk);
+	}
 	uprobe_end_dup_mmap();
 	if (!retval)
 		dup_userfaultfd_complete(&uf);
diff --git a/mm/nommu.c b/mm/nommu.c
index 68b05565e15a..7529e03d3f2c 100644
--- a/mm/nommu.c
+++ b/mm/nommu.c
@@ -1885,7 +1885,8 @@ static int __meminit init_admin_reserve(void)
 }
 subsys_initcall(init_admin_reserve);
 
-int dup_mmap(struct mm_struct *mm, struct mm_struct *oldmm)
+int dup_mmap(struct task_struct *tsk, struct mm_struct *mm,
+	     struct mm_struct *oldmm)
 {
 	mmap_write_lock(oldmm);
 	dup_mm_exe_file(mm, oldmm);
-- 
2.55.0

