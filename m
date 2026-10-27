Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793119134;
	b=nIfC9PsdVh3PLPtIgYd5FW9Kwf2BFOUkGRPD1TEwD/IQIcGQDpuRZBEH3UsnfDMVlagg
	 CPYzqe6bgvJaOy0aFCT6pkzTRwgZqrRLFgs0nHlE9X0uXWxIbmK/cTqJ45JgrZfgPl+yY
	 dHuyiL6s65vYioIyXQnNTXK3M2t8jE8LIdSxE75X5NsK++gYmilDEEB+o2gsdm+Z9Gplf
	 ptWwBVFy9mKjKUYU6KLKc26XvD5RtGvioPGjG9iDg/bVFGRj+k13WoWlUG5u9Jbl/+l8s
	 tOVmDiZpaCP4IATrKHzGlr7PWkfc24tN9ZiTHLTjITL6VvvICtJEnKGwVVpqP0GD8hw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793119134;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=u2vDv32MA81U0LmwErTlcthaqDxgBvR1wRAzc93ugyc=;
	b=HFjRgUTxEF/YW/gkock1zvC33qCOv7VpBPQRWGSmEym4ck07F5xadttxAc54TjN8ARx1
	 WkSkIhIxBa6h4IuCHxKJZV3BetjBMAzooN6vrIdCBAP+KKfaK16Dlgtrs/I8n2yPhgRVf
	 HTA4EbDcuOzRIKU+5g9fjHy/wdPq+ADRh/KbDVhIhpxqNd7FFWl0kQ9IhspSlSRrT/xSV
	 icAHBF8hh31hXWx/CBUFBlBPkrCUDM6FInR4Wa0f/RQ7sdaNWkC2ANjtEDycPoNs3vEZy
	 fubHmnS1peGPrNQAHDblzMhohiEsxlg7cCiIh03zbtaaVjrTY7Fq7SGWg5ugASJmCVg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vBf0RjX8;
	arc=none smtp.remote-ip=209.85.128.45
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6A5560A2604
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 16:38:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E6A5560A2604
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vBf0RjX8
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4a210470b49so258045e9.2
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 09:38:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793119132; x=1793723932; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=u2vDv32MA81U0LmwErTlcthaqDxgBvR1wRAzc93ugyc=;
        b=vBf0RjX8254h+5Ot1OzQFloa1ymqkVidegDxNaWxZ3l/i+MQQad2y+u6UTbY3PZP/F
         I/ztS4Z5IonE2D6IS4TXVBMFZYTXsy7/kaV4jYBBPu9SbI7YpHmavTjGlWNcjG94QyhE
         JAOHzau5GaTkz8T8dt0Lr5VG0nXRF3EGiV4z41Gvn0B3qSRsHzoe57V8NyUES+WVzb5m
         gGMBFU3TbvIzoXKyHLTMH2ugXK3tcJkzDgHD7KJiwqN5jStZok5v6jBKWr+iZvAE4riU
         P7GoCyjIeY/vBOolINx60BkfDRR/eS1f0K3bjO2ARdyMS2bgKpHLptxuhtG9agXIZkay
         6EhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793119132; x=1793723932;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=u2vDv32MA81U0LmwErTlcthaqDxgBvR1wRAzc93ugyc=;
        b=XgaGoG/Jcq8IHK8C71zoehTpKz/bNdGzmQCLEZVJaAyNa2E9U1xw6ZoJ+RrEgs5n0k
         xXwDaTClKGfbQWJpbvzskmM3QnFuVfSEqYuQFZisKGcP1+b8jfokTDlydi5fjH9RJnnI
         6+vromKmfh9ZoW2sksudeBBeE6rMO2oJ0ubtiOXhUC46k9GN7NCVAVEM1b3/2iUXuBtJ
         TwXqGkxhBxbicuK80ZfsbSGm4sYCDxXQmufS0AVYKVRXeh6+I6KbsD73yeSqUe4p1Jl7
         IAUglVkBBCxAurzeRPUm1oe/CKfKxL6NLlakct2ZC+ksNNUmlgTTB5K0YkNVcjZwlt5T
         wlZA==
X-Forwarded-Encrypted: i=1; AKwUvBxy7OnH4JuO1cx1N3oA7DgQIoragN5ysG5k7ZlfrqvnX9bwe0/OmABqWhxy4mKXCes81rmRACvWB+YG0Bg=@vger.kernel.org
X-Gm-Message-State: AFq9FYLRqUjiYJXE+JNl+vsEoYnWriLQj5zvKRyQwo/7KMFc+C6+umIm
	6Kwd7POOP9dwZHUWq5TRRHuulwN8XW9PAnAksmL1iH7inGtmRkegE+md
X-Gm-Gg: AYBFou0TlyvSgMRvNFOuBYZqmoLuR6u5ie+vUvoKE7QRoN+CGUel4LrPDqBVpcX87On
	re0p1ueUThZdPbbeGsgSCp8q4sXCH+ppCu+MM8ev+RkjBJ5vU7qlkGnQwL8676TJZ/plNb1gCtt
	YpSQzFBDE6AbR2p575y5kTC6tbHEh0VNoV8qMUzW5lHSAr0zAUUf0IE4GrfgOk8eri/03/HeHBK
	pMxnMTflVVNgIW7+WK0Oj10ucoWGBWzdrwnJUWflKSGXlOVTG9SvM3U4ea4hIfa/azOJT16IM+V
	sTqtYGccukOOWr4Q2AixLJOPncmkF3/w2+bBiSweOoqXfwl+NY3VQKhqHS7FzcH7svtD7y+1WWb
	AF8YwT1DxowlYbhVIzrL7ObXgSAUPPbKL0Xl+6RbEOTi7/zvWT6Lg6IoiqjcL3vo3lPov5puYuo
	5D0pgy8uyxVQ81RYseZCTRv44en4ghQMONUa0OT9TDaAFE+O7EO1ogPy4jVaGaFkky2fcfDEnIw
	xENZ2XeVvXxV331wNxXXACsFos96+eVldDcq2chFOQAwCxCIUhD+Ik0tjpaA/CvJT3Amr5c8XFk
	iaV86KAYzr0URlBVVfxxCnDrIBmFlROYyJKUKg6s8YcNpxc=
X-Received: by 2002:a05:600c:3acb:b0:4a1:992f:d0e7 with SMTP id 5b1f17b1804b1-4a35aca4fe1mr202598135e9.16.1793119131961;
        Tue, 27 Oct 2026 09:38:51 -0700 (PDT)
Received: from andreayoga.wind3.hub ([31.189.68.219])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a92c21df84sm2358195e9.15.2026.10.27.09.38.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 09:38:51 -0700 (PDT)
From: Andrea Parri <parri.andrea@gmail.com>
To: "Paul E. McKenney" <paulmck@kernel.org>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
Cc: Andrea Parri <parri.andrea@gmail.com>,
	Frederic Weisbecker <frederic@kernel.org>,
	Neeraj Upadhyay <neeraj.upadhyay@kernel.org>,
	Joel Fernandes <joelagnelf@nvidia.com>,
	Josh Triplett <josh@joshtriplett.org>,
	Boqun Feng <boqun@kernel.org>,
	Uladzislau Rezki <urezki@gmail.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Lai Jiangshan <jiangshanlai@gmail.com>,
	Zqiang <qiang.zhang@linux.dev>,
	Gary Guo <gary@garyguo.net>,
	Bradley Morgan <brads@mainlining.org>,
	Kunwu Chan <kunwu.chan@gmail.com>,
	rcu@vger.kernel.org,
	lkmm@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH -rcu/dev 2/4] hazptr: Check per-CPU slot owner with CONFIG_HAZPTR_DEBUG
Date: Tue, 27 Oct 2026 17:38:04 +0100
Message-ID: <20261027163811.2470569-3-parri.andrea@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261027163811.2470569-1-parri.andrea@gmail.com>
References: <20261027163811.2470569-1-parri.andrea@gmail.com>
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

When a per-CPU slot records the wrong hazptr_ctx as its owner, nothing
reports it where it happens.  If the task is switched out before
releasing the slot, hazptr_note_context_switch() promotes it through the
wrong context, and if that context is detached,
hazptr_chain_backup_slot() adds its backup slot to an overflow list
again.

The kernel can then crash later in hazptr_synchronize(), far from the
cause.  For example, from hazptrtorture with readers that nest a second
hazard pointer, as "hazptrtorture: Nest a second hazard pointer in
readers" makes them do, and without "hazptr: Record per-CPU slot owner
after claiming the slot":

    Oops: stack segment: 0000 [#1] SMP PTI
    CPU: 4 UID: 0 PID: 83 Comm: hazptr_torture_ Tainted: G        W           7.3.0-rc1-00107-ga2aa5148421f #2 PREEMPTLAZY
    RIP: 0010:hazptr_scan_overflow_list_period+0x94/0x100
    RBP: dead000000000100 R08: 00000000002fa6bc R09: 0000000000000004
    Call Trace:
     <TASK>
     hazptr_synchronize+0xb7/0xd0
     hazptr_torture_writer+0x181/0x3f0
     kthread+0xd1/0x100
     ret_from_fork+0x179/0x240
     ret_from_fork_asm+0x1a/0x30
     </TASK>

Check the recorded owner where it is used.  hazptr_release_debug() now
warns when the context releasing a per-CPU slot is not the one recorded
for it.  hazptr_note_context_switch() warns when the recorded owner's
->slot is not the slot being promoted.  In that run, the checks warned
1.3 and 0.08 seconds before the oops:

    Hazard Pointer (addr=000000006dd14922) released from a per-CPU slot recorded with another owner. Acquire: caller=hazptr_torture_read_lock+0x43/0xb0, pid=82, cpu=7.
    WARNING: ./include/linux/hazptr.h:304 at hazptr_torture_read_unlock+0x137/0x160, CPU#7: hazptr_torture_/82
    Call Trace:
     <TASK>
     hazptr_torture_reader_tail+0x80/0x220
     hazptr_torture_nested_reader+0x6c/0x90
     hazptr_torture_reader+0x2f5/0x530
     kthread+0xd1/0x100
     ret_from_fork+0x179/0x240
     ret_from_fork_asm+0x1a/0x30
     </TASK>

    Hazard Pointer (addr=00000000742d8665) in per-CPU slot 1 recorded with an owner that uses another slot.
    WARNING: ./include/linux/hazptr.h:185 at __schedule+0x7ba/0xf10, CPU#0: hazptr_torture_/82
    Call Trace:
     <TASK>
     preempt_schedule+0x2d/0x50
     preempt_schedule_thunk+0x16/0x40
     hazptr_torture_read_lock+0xaa/0xb0
     hazptr_torture_nested_reader+0x39/0x90
     hazptr_torture_reader+0x2f5/0x530
     kthread+0xd1/0x100
     ret_from_fork+0x179/0x240
     ret_from_fork_asm+0x1a/0x30
     </TASK>

hazptr_release_debug() reads the owner of ctx->slot only if that
per-CPU slot is in use, and skips the backup slot that a detached or
promoted ctx uses.  If ctx holds the per-CPU slot, no interrupt can
claim it between the ->addr check and the owner read, so the check warns
only if the slot records the wrong owner.

If ctx has already released the slot, which the hazptr_release()
kernel-doc permits, the slot is in use only if another hazard pointer
has claimed it since, and this second release would clear that hazard
pointer, so the check warns then too.

One case can escape both checks: an interrupt handler that acquires and
releases the slot instead of detaching it, then a context switch before
the task's release.  The stale owner's ->slot still names the slot, and
the promotion empties the task's per-CPU slot, so hazptr_release_debug()
warns only if another hazard pointer has claimed that slot by then.

The crash was found with the help of an LLM.

Signed-off-by: Andrea Parri <parri.andrea@gmail.com>
---
 include/linux/hazptr.h | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/include/linux/hazptr.h b/include/linux/hazptr.h
index 90d8d5a3d2443..d37792af34939 100644
--- a/include/linux/hazptr.h
+++ b/include/linux/hazptr.h
@@ -182,6 +182,9 @@ void hazptr_note_context_switch(void)
 		if (!slot->addr)
 			continue;
 #ifdef CONFIG_HAZPTR_DEBUG
+		WARN_ONCE(item->ctx.ctx->slot != slot,
+			"Hazard Pointer (addr=%p) in per-CPU slot %u recorded with an owner that uses another slot.",
+			slot->addr, idx);
 		item->ctx.ctx->detach_cpu = true;
 #endif
 		hazptr_promote_to_backup_slot(item->ctx.ctx, slot);
@@ -284,6 +287,8 @@ void hazptr_release_debug(struct hazptr_ctx *ctx, void *addr)
 	int pid = current->pid, cpu = smp_processor_id();
 	bool warn_remote_cpu = !ctx->detach_cpu && ctx->acquire_cpu != cpu,
 	     warn_remote_task = !ctx->detach_task && ctx->acquire_pid != pid;
+	struct hazptr_slot *slot = ctx->slot;
+	struct hazptr_slot_item *item;
 
 	WARN_ONCE(warn_remote_cpu || warn_remote_task,
 		"Hazard Pointer (addr=%p) released on remote %s without %s. Acquire: caller=%pS, pid=%d, cpu=%d. Release: pid=%d, cpu=%d.",
@@ -291,6 +296,14 @@ void hazptr_release_debug(struct hazptr_ctx *ctx, void *addr)
 		warn_remote_task ? "task" : "cpu",
 		warn_remote_task ? "being detached from task" : "context switch",
 		(void *) ctx->acquire_caller, ctx->acquire_pid, ctx->acquire_cpu, pid, cpu);
+
+	if (hazptr_slot_is_backup(ctx, slot) || !READ_ONCE(slot->addr))
+		return;
+	/* Whoever claimed a per-CPU slot must be recorded as its owner. */
+	item = container_of(slot, struct hazptr_slot_item, slot);
+	WARN_ONCE(item->ctx.ctx != ctx,
+		"Hazard Pointer (addr=%p) released from a per-CPU slot recorded with another owner. Acquire: caller=%pS, pid=%d, cpu=%d.",
+		addr, (void *) ctx->acquire_caller, ctx->acquire_pid, ctx->acquire_cpu);
 }
 #else
 static inline void hazptr_release_debug(struct hazptr_ctx *ctx, void *addr) { }
-- 
2.53.0

