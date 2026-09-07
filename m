Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6657A4279E3
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 07:58:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788767937; cv=none; b=pGTSd8MTrQloEUQhm0tZvN5/J+ioP7GbzOydeHEn4yQJpvKddfRnwhOhi3YwZ6ZfmPd2fPYjn+KRq9hdGwXzRRVSkFa/GlVmCYAlWfBNckbj2RVPQCaHlCs5xbChdHawLo9IQ64nV0hU+uTdsMYsElJJJTIURxmttLPbpwAh4fs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788767937; c=relaxed/simple;
	bh=y+BKA/RD4U8D0pkVHR30bN2c+9yOk5iGeepHr0HLGn4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=f8AMX7iJKg90U37LvPNi2vTrsLF8jXGFVxHSgWF9D8LT3YzPl/tu4HswfDYstf94WN0XOsiPSxf+tPAhM21BU4KSYY94hhr+QE5BhIoB8A9gt1lqFIgBik5DrOHekpA3q+SWz7HecGNSU/6hNpbvWW/a7w43V/dvA7g0CMOlckY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=i/bOgsdq; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="i/bOgsdq"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2d8f265cbe6so23814175ad.0
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 00:58:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788767935; x=1789372735; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KuHltOQMtvIyLbH/3yCpfQv67OgWo+va2cml6EO5eig=;
        b=i/bOgsdqUnJPDVyhp+B8Er/UUqw3aAaPqy/Mhp8NjZllVUcyQu0q9wJlqS2ecdz7/D
         xPEQ+m2aXsEDR3twb9ZPr7f7TZl5J6THBp9s77X4gFYApSAcwucVWFbgsesAUhLYzMy4
         KWfTHXBZwAWfgI2vM2ADgv2Vua7JkJ3bC3zTkCGGr2+GIqHA3mM0aDWE+QJ4x297XZXF
         2xt38x00Q3Ya1ihZz4inxVXFd1J56bfoAkVBLtzIax0X2eIT5dqxuTZp8e1/wUInAxli
         xHoxiTJFGWx/efVcSUZpTJ088K8juqn5rS+Rb66ickN5N5QroCu0hBRrajfMmi0Pmb7s
         RSzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788767935; x=1789372735;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=KuHltOQMtvIyLbH/3yCpfQv67OgWo+va2cml6EO5eig=;
        b=PHCn8ikzMBMbfOalitynId/h8FTs9K9yEwmAnqx4Hwr266NqkElo8GBXiivaDHyvt9
         tQJL7Zqbg3kb/HWQROjbw7eOeACK8/ewnZjLrCj2yMiaXZoWOXnTwFy/Zqn933osADF8
         z7+y7HtqW3OxgIAD5I97RZnYE5yPLN+afFg//PvtqD6/6GrT+iuBQF7aUB7KmQ0vETe+
         jtWEy0bKuNmBYII0qQ4K9cW4aONAtPsEvJWgTci+aH5o+OxA1QBJXAfslclt5YboOlkv
         Zv0QD5+7Y9UlLNpGTZkjfxdnwoac6nWWWdTd/bCrdIO+cx7lStTXZwtuhcVyfZZcvBen
         4uuw==
X-Forwarded-Encrypted: i=1; AKwUvBy3Bmss27QjAInUDGI4hObsguGiWx/92W1KxVONTzTHoDq5jr6vzaetLIPo61Sl4DtwnH3YtuH3quSwHRg=@vger.kernel.org
X-Gm-Message-State: AFuF++nzu5bBYH4pgLcxhofFR8qgOzIDCHS85OJHKxH1zuYJCYSUzWn8
	Ap0UedSRoMoOJmhRYtU6Yml6h4VQqg2LY/LjNe2On4CGvPF2z3VTpXs6
X-Gm-Gg: AYBFou108xRguE4nxr7HwFL9czp8DK250ZET067EPRysl7rffu073awgpiriD0LDzhv
	3/ZWwnWnsWkASlPy6AE/lUNuIUnsXcHjLAOE5XOf3obRW608UaYq5NN8z+QqDCCs8E5DW/rZDId
	DGQFhu/lLf0rxcKhpwfM7uqfhQ3bN7HRA337KKMdu3tI3M7zsvJ6DQjXmc/NGB3QHt/ycfmhXhC
	wMck8gS/gIrclQ5bXEDuMlS7uzB7SqF3ODm5b6J0gXOEgSSCDHcb8ovOkuyt2/8RapcmgM2OAQm
	uSrVCs3eAmUHXAhDAE+I/9JDtSMhVacKuZQMIc95bI23ZHtO1JLUPXaRh1mHOWP+Of2AIDTDcyS
	uCQNhw2w7z3Yk4L9ginaD3KQhCAUXcAEZ4mY9R42GguHJAzgwmGGBvReKHL1tD3nzJIBbKPhgJ6
	lTdW7IpK+e7rbzSX8o1d0fynDSIJrQrc20vTPJOsfKT5PBBoOBhonZ3FImllK3oG55K6dW5MXyr
	0jRgqg=
X-Received: by 2002:a17:902:b114:b0:2d9:1dee:43e3 with SMTP id d9443c01a7336-2db12757f17mr202313705ad.18.1788767934067;
        Mon, 07 Sep 2026 00:58:54 -0700 (PDT)
Received: from kernel.tail6741c6.ts.net ([185.220.238.35])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2db14ae7637sm40945595ad.79.2026.09.07.00.58.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 00:58:53 -0700 (PDT)
From: Kunwu Chan <kunwu.chan@gmail.com>
X-Google-Original-From: Kunwu Chan <kunwu.chan@linux.dev>
To: paulmck@kernel.org,
	jiangshanlai@gmail.com,
	josh@joshtriplett.org
Cc: rostedt@goodmis.org,
	mathieu.desnoyers@efficios.com,
	rcu@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Kunwu Chan <kunwu.chan@gmail.com>
Subject: [PATCH 03/13] srcutree: Add reader-free fastpath to synchronize_srcu_atomic()
Date: Mon,  7 Sep 2026 15:58:19 +0800
Message-ID: <20260907075829.2073224-4-kunwu.chan@linux.dev>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260907075829.2073224-1-kunwu.chan@linux.dev>
References: <20260907075829.2073224-1-kunwu.chan@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Kunwu Chan <kunwu.chan@gmail.com>

synchronize_srcu_atomic() is restricted to srcu_read_lock_atomic() and
srcu_read_unlock_atomic(), whose read-side critical sections disable
preemption.  In the common case where there are no readers at all, the
grace period therefore need not do the index flip.  Add a fastpath
that sums both ranks of the per-CPU ->srcu_ctrs[] counters and, if the
lock counts match the unlock counts on both ranks, ends the grace
period immediately, skipping the srcu_advance_state() scans, mirroring
the similar Tiny SRCU fastpath.

Correctness requires the counter-sum proof to follow the grace-period
anchor written by srcu_gp_start(); placing it before the anchor could
let this grace period miss a pre-existing reader and return without
waiting for it.  The smp_mb() between the unlock and lock sums pairs
with the smp_mb() in __srcu_read_lock().  The grace period is ended
manually under ->lock and ->srcu_atomic_gp_flag.

Signed-off-by: Kunwu Chan <kunwu.chan@gmail.com>
---
 kernel/rcu/srcutree.c | 48 +++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 48 insertions(+)

diff --git a/kernel/rcu/srcutree.c b/kernel/rcu/srcutree.c
index 7dd705eec573..533607de5728 100644
--- a/kernel/rcu/srcutree.c
+++ b/kernel/rcu/srcutree.c
@@ -2113,6 +2113,8 @@ void synchronize_srcu_atomic(struct srcu_struct *ssp)
 {
 	unsigned long srcu_state;
 	struct srcu_usage *sup = ssp->srcu_sup;
+	unsigned long rdm0, rdm1;
+	unsigned long unlocks0, unlocks1;
 
 	// Initialize.	Either init_srcu_struct() was invoked or
 	// DEFINE_SRCU() or similar was used.  Therefore, no allocation
@@ -2149,6 +2151,52 @@ void synchronize_srcu_atomic(struct srcu_struct *ssp)
 	srcu_gp_start(ssp);
 	raw_spin_unlock_irq_rcu_node(sup);
 
+	//
+	// Fastpath:  If there are no readers at all, neither grace-period
+	// scan need wait, so both can be satisfied at once without doing
+	// the index flip.  The counter-sum proof is the same as that of
+	// srcu_readers_active_idx_check(), but spanning both indices.
+	// Atomic SRCU guarantees that all readers are of
+	// SRCU_READ_FLAVOR_ATOMIC, so the SLOWGP check never triggers and
+	// the ->srcu_reader_flavor masks returned by
+	// srcu_readers_unlock_idx() are unused.
+	//
+	// This proof must follow the grace-period anchor written by the
+	// srcu_gp_start() above, never precede it.  With the anchor first,
+	// a reader whose lock increment is missed by the sums below cannot
+	// have incremented its lock counter before the anchor, and therefore
+	// cannot be a pre-existing reader of this grace period.  Placing the
+	// proof before the anchor would let this grace period miss a
+	// pre-existing reader and return without waiting for it.
+	//
+	// The smp_mb() pairs with the smp_mb() in __srcu_read_lock()
+	// (store-buffering pattern), which guarantees that a lock is always
+	// counted if the corresponding unlock is counted, the same
+	// memory-ordering guarantee as is provided by
+	// srcu_readers_active_idx_check().
+	//
+	unlocks0 = srcu_readers_unlock_idx(ssp, 0, &rdm0);
+	unlocks1 = srcu_readers_unlock_idx(ssp, 1, &rdm1);
+	smp_mb(); /* A */
+	if (srcu_readers_lock_idx(ssp, 0, false, unlocks0) &&
+	    srcu_readers_lock_idx(ssp, 1, false, unlocks1)) {
+		// No readers, so end this grace period manually, skipping
+		// the index flip.  Advancing the sequence number via
+		// rcu_seq_start() in srcu_gp_start() above and rcu_seq_end()
+		// below keeps get_state_synchronize_srcu() and
+		// poll_state_synchronize_srcu() working, all under ->lock
+		// and ->srcu_atomic_gp_flag, which excludes concurrent
+		// sequence-number updates.
+		raw_spin_lock_irq_rcu_node(sup);
+		rcu_seq_end(&sup->srcu_gp_seq);
+		raw_spin_unlock_irq_rcu_node(sup);
+		WARN_ON_ONCE(!poll_state_synchronize_srcu(ssp, srcu_state));
+		atomic_set_release(&sup->srcu_atomic_gp_flag, 0);
+		preempt_enable();
+		non_block_end();
+		return;
+	}
+
 	// Wait for it to complete, helping it along.
 	while (!poll_state_synchronize_srcu(ssp, srcu_state)) {
 		cpu_relax();
-- 
2.43.0

