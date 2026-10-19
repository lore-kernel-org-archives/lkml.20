Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792426744;
	b=BOqfiRUDY7FFAEyf4r91/xpNizEEab58Qw2OUR4+CRtFKsmUW8DpFisVcCCwl5aVNAMB
	 THrIc505ugNNje6tGiX52L2iQzBBQFJsyTy79r6RHS35mKiwGm2DFwVgHTic6905f9MVQ
	 ftBv/BggrYlt6lG1nw4OY6YzijRFNeuiUKLCq5B8FuC6Z/VCPmK0R8vMWjJSGpRjo47vA
	 0KSCDphMwUYtZ4E2fSJTVt1psTwDcAMtOlkIoTg3SaFX0eFgX40zeJ8uGvVFuisgJFjLM
	 4bW/4EisRcRURUkuU+Y+Z9rWL0qRTIc8ulyCvrOpwNCjyMpEixCAsZvHaQ0gl24CpFg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792426744;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=j9Tb0vIxGUTYeQFZpnnr31SkLxL+7bR6Ze3b3cjJEa0=;
	b=DvVPC7fDvn23CtIRBafLKV6XQaeSylFFIlneIn5f7AaEjsPIOmBiSgH1hKQpS6JoGWvw
	 8Rza61pM2yX3Pv7SEsDsjRubAgsPwLs/DJ4PQB5ND1U6BtVS6oBhuRcvJqi++liek+vn0
	 hcWMACkeFJeZUKOoSFvZHeE9wDOBjwPiAuByqWLMeS30Ek4AImSGXPnaG15oKqNGf1pII
	 X+bBdBELCki6nqKH7kJ514WuzikTz2s70RKpVyJ7rifZ5/ub7FfAYbK8iawhb6haQxokM
	 dGUdUQaLQIh4eijuC8TlKoPQZJZS/1/rpwLPIzdWKmDMQ3O62j+AXvmv+eLCYYwXiWQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=h4r7A4ZH;
	arc=none smtp.remote-ip=209.85.221.45
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83D8E606A338
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 16:19:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 83D8E606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=h4r7A4ZH
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-48b042c0728so639451f8f.1
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 09:19:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792426742; x=1793031542; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=j9Tb0vIxGUTYeQFZpnnr31SkLxL+7bR6Ze3b3cjJEa0=;
        b=h4r7A4ZH1fRI3Yb6rNse2FMtzC4DFj8ykC2kkudhwFmfv187b4+ypkU8VnUI7SBNC/
         6zdHnKxAG6hlkZ5yoh3Gqr+h6eM2ZjqoJd5MPfMakNCvipfK9XoQ7mGu5UVqQzcFEzxA
         J+Kf3CIyP60+jbmpIB214iYDRcAKjZfQK6OWPhi8st1vC1DFE1Jiw5VjJPI57BV3FRJ5
         BBcLfpgqVyGWmAfOmUQmDVwrgy1mLBfmm9rpkDFKJsHhDUrbm1GofEQA+oWtAO/mys8j
         UlPkI5P9+/+xYs37hpsU9majwWsNvjtXyOBneQM6kuE+1ysBvk0ckv1bepztBE6WeEa6
         S32g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792426742; x=1793031542;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=j9Tb0vIxGUTYeQFZpnnr31SkLxL+7bR6Ze3b3cjJEa0=;
        b=i+2HohI8yRMRDUExA/Al3u7iMjIZVqYUnU94D24nvyGtDzKuv30vnMtRYxx8wZ9imU
         tnPCeuGUcenZqPqbBoPzuudjAU+LhGxVxF31NQFrmAx3yM5bH5jJdfIs859GoEiu5Kb/
         oUgZyZjcxsVyKZ80+Ivu9aNDZ/TkUnt1a7/8mRdDUsE0eW1le/igBtinyAFtIMLAhtEd
         MhbaBtfU0rLDBjVkjwbubGp5CKd6VrJOpVMqvt5Hu4sjqq7qp4vOh6OGZEGhPyjf+vs1
         ZgnnSHH1BCXdUjoQmR8Ng45p6hoa3dUpuXjUQCUoAlBwLsQCupDWyuQPUDxymBja8y6B
         tgZg==
X-Forwarded-Encrypted: i=1; AKwUvBzzl9aCumGxHrma/kTui0EVdKItwkTvIdQjBUrbsefC/f8b5Y6znIBWtP3PgCqVhN58jQVowTomXGuhXMA=@vger.kernel.org
X-Gm-Message-State: AFq9FYJJpqixpPyXL2BChCLJgxn181Dkh9IHqMWNem/BcgXC6YZziHqw
	+am3eMSZZDP7Go74sz5vNOJI74cBhECXJbAVJWS32oON6VKOlb7oBmPL
X-Gm-Gg: AYBFou2L+4olXtg68S1Z/ldoD+cro1grUw1ZSx6/JzJOojYi/75ukjp6i4CAie5kLlv
	GTcQ8m6gkLvIXkHmJ+6DAB6dBO0BZYV7eOKWcrB5/NlUGG0wHQhyBAGOm8lifkd/Pp9hJmE2yVZ
	mHT/aBXbCyftwtCmAW8iUhl6HQP8CEGV9Y5JGI9WJ14YC+5HsIvG4L6PMDAA+OBe8Eq14Xej/PV
	Jgm6hfCrCDOkQ5IhI5O2plZPpdsmBwp9yZ+jhTvwKzCRf0t537P6xp+qmwqGU1fdGOyjKMN0R7D
	w65sCEXrfNGsQq35yorLsfRSYyKoD9oqcJGLH1p7emhskreJiqoetMMIK9MJLNAoFvJqLppvn+I
	GSm87HAFyqJy+CWs4GK+jYkPdyAkXGSUL2WEgf50K2kDv9wkDYLS3mjvavciWj6CtfqgUcAlv6C
	+JztiX3mLAPCLDRYg5y8wbo/pESk5/Gp319lmF1nVmLkjAKLeqQ4hw1wd0ya030umf/1MaCMajq
	IJ635A8NjQeWhLZv9e+2IkN7zAfDzKkZH+QEHeL+7xaYv7A3VCm6Q==
X-Received: by 2002:a05:6000:260a:b0:486:f9ea:796f with SMTP id ffacd0b85a97d-48e07fa67d5mr16626694f8f.41.1792426741547;
        Mon, 19 Oct 2026 09:19:01 -0700 (PDT)
Received: from andreayoga.wind3.hub ([151.76.51.95])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd471a72sm25961466f8f.4.2026.10.19.09.19.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 09:19:01 -0700 (PDT)
From: Andrea Parri <parri.andrea@gmail.com>
To: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	"Paul E. McKenney" <paulmck@kernel.org>
Cc: Andrea Parri <parri.andrea@gmail.com>,
	Boqun Feng <boqun@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	Bradley Morgan <brads@mainlining.org>,
	Kunwu Chan <kunwu.chan@gmail.com>,
	rcu@vger.kernel.org,
	lkmm@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH RFC -rcu/dev] hazptr: Record per-CPU slot owner after claiming the slot
Date: Mon, 19 Oct 2026 18:18:48 +0200
Message-ID: <20261019161852.12783-1-parri.andrea@gmail.com>
X-Mailer: git-send-email 2.53.0
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

An interrupt that uses a hazard pointer while the interrupted task is
in the acquire slow path can leave its own context recorded as the
owner of the per-CPU slot the task then publishes into.  The next
context switch promotes the task's pointer with the interrupt's
context.

hazptr_get_free_percpu_slot() records the owner when it picks an empty
slot, but only Store B in __hazptr_try_acquire() claims the slot.  An
interrupt in between picks the same slot, as the lowest free one:

  Task on CPU 0                        IRQ on CPU 0
  -------------                        ------------
  hazptr_acquire(ctx)
    fast path fails
    __hazptr_acquire(ctx)
      picks item k (empty)
      item k->ctx.ctx = ctx
                                       hazptr_acquire(irq_ctx)
                                         claims item k
                                         item k->ctx.ctx = irq_ctx
                                       hazptr_release(irq_ctx)
                                         clears slot k
      __hazptr_try_acquire()
        Store B into slot k
      (item k still names irq_ctx)
  sleeps holding the pointer
  hazptr_note_context_switch()
    promotes item k with irq_ctx

The task gets there with k > 0 when it already holds an outer hazard
pointer in slot 0; no other task can, as its slot is promoted when it
is switched out.

The task gets there with k == 0 when the fast path leaves slot 0
empty: either its ptr_eq() check fails because an updater changed the
pointer, or the pointer is NULL and an updater publishes a non-NULL one
before the slow path loads it.

The promotion moves the task's pointer into irq_ctx's backup slot,
which nothing unchains, so hazptr_synchronize() on that pointer never
returns.  The task's ctx->slot still names slot k, so its
hazptr_release() clears whatever another reader on that CPU has since
published there.

If the interrupt detaches instead, as hazptr_torture_acquire() does,
the promotion chains irq_ctx's backup slot a second time while it is
still linked.  The overflow list then loops on that node, or follows
LIST_POISON1 once hazptr_unchain_backup_slot() removes it.

Record the owner after __hazptr_try_acquire() succeeds, as the fast
path in hazptr_acquire() does.  This should be safe because an
interrupt that used the slot has released or detached it by the time
the task resumes, and only hazptr_note_context_switch() reads the
owner, which cannot run before the task enables preemption.

Fixes: 50b568234163 ("hazptr: Implement Hazard Pointers")
Assisted-by: LLM
Signed-off-by: Andrea Parri <parri.andrea@gmail.com>
---

Notes:
    With this patch, hazptrtorture's NOPREEMPT scenario passes a 30-minute
    run on x86_64 with 8 CPUs.  PREEMPT runs clean for 30 minutes but can
    hang at shutdown, in hazptrtorture's release of deferred hazard
    pointers; that hang does not involve this patch, and is addressed by
    "hazptrtorture: Release all deferred hazard pointers before stopping",
    posted separately.
    
    With that fix also applied, 30-minute runs pass for PREEMPT, for
    NOPREEMPT with torture_type=hazptr, for PREEMPT with
    torture_type=hazptr-stack, and for PREEMPT with CONFIG_HAZPTR_DEBUG=n.
    
    PREEMPT and NOPREEMPT also pass without this patch: their readers hold
    one hazard pointer each, so they reach the slow path only when the
    ptr_eq() check fails or the pointer is NULL, which happens only before
    the writer publishes its first element and after it stops.
    
    A KUnit reproducer, with a test-only hook in __hazptr_try_acquire()
    between the free-slot check and Store B, fails on 940793b926aa and
    passes with this patch.  I can post it if useful.

 kernel/hazptr.c | 21 +++++++++++++--------
 1 file changed, 13 insertions(+), 8 deletions(-)

diff --git a/kernel/hazptr.c b/kernel/hazptr.c
index 3ca73b56a5c25..b15b84ebd4ceb 100644
--- a/kernel/hazptr.c
+++ b/kernel/hazptr.c
@@ -54,19 +54,16 @@ unsigned int flip_list_phase(unsigned int phase)
 }
 
 static
-struct hazptr_slot *hazptr_get_free_percpu_slot(struct hazptr_ctx *ctx)
+struct hazptr_slot_item *hazptr_get_free_percpu_slot_item(void)
 {
 	struct hazptr_percpu_slots *percpu_slots = this_cpu_ptr(&hazptr_percpu_slots);
 	unsigned int idx;
 
 	for (idx = 0; idx < NR_HAZPTR_PERCPU_SLOTS; idx++) {
 		struct hazptr_slot_item *item = &percpu_slots->items[idx];
-		struct hazptr_slot *slot = &item->slot;
 
-		if (!slot->addr) {
-			item->ctx.ctx = ctx;
-			return slot;
-		}
+		if (!item->slot.addr)
+			return item;
 	}
 	/* All slots are in use. */
 	return NULL;
@@ -78,6 +75,7 @@ struct hazptr_slot *hazptr_get_free_percpu_slot(struct hazptr_ctx *ctx)
  */
 void *__hazptr_acquire(struct hazptr_ctx *ctx, void * const *addr_p)
 {
+	struct hazptr_slot_item *item;
 	struct hazptr_slot *slot;
 	void *addr;
 
@@ -85,10 +83,17 @@ void *__hazptr_acquire(struct hazptr_ctx *ctx, void * const *addr_p)
 	 * In case we are called due to nested use of hazard pointers,
 	 * try a slot protection with per-CPU slots.
 	 */
-	slot = hazptr_get_free_percpu_slot(ctx);
-	if (likely(slot)) {
+	item = hazptr_get_free_percpu_slot_item();
+	if (likely(item)) {
+		slot = &item->slot;
 		addr = __hazptr_try_acquire(ctx, addr_p, slot);
 		if (addr) {
+			/*
+			 * Record the owner only once Store B has claimed the
+			 * slot, as hazptr_acquire() does: an interrupt may
+			 * have used this slot since it was chosen.
+			 */
+			item->ctx.ctx = ctx;
 			ctx->slot = slot;
 			return addr;
 		}

-- 
2.53.0

