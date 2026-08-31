Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 612833BED18
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 07:49:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788162594; cv=none; b=qZkqAju1iKec2U2ApPWq9r8FOHq+G4R+iM5kfRmWR07+i1LKC5bhpVvbZeq5z6MrOoG6WaFuUUNY6MIZM3daKiK27yfYRe7nuohyKlXkgSrZI1csdh7nJDouG3dB1lPU0yzRoNzSX6CD2aLSq01uUh9I7kd0D6Up4zSMQmjRNg0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788162594; c=relaxed/simple;
	bh=BXkbLGwM9e3RJuJt2pa/P5gdLpxTj2pS4E1UpMktcko=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=JK+nEzeV4uVK959RoRS7r1ltAw3vsDVYUeEKHDZ2Em4mTwpnn3oUMnda4tscc9MbcYiif3++t99zwaHnjU1cf+4uXT5qMAxQusrXsAkkUCJ7HwYAU1Pcr7si2MaO0sdZ+o+EmoJ0mnSNT4D4Tz5+miSHnxK9IvvmtfDVQxXKZGQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ucf6BgwG; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ucf6BgwG"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2ce7d2adef4so47259715ad.3
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 00:49:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788162592; x=1788767392; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=6woGwI00ns4N8Eg+beukJR/mLo5Rut3WAQ70AzrcV6Q=;
        b=Ucf6BgwGT5uYJzLLYB5ibUXyGyEE3W5goR4/iOiPTBr1hMnyTXuJOBHFdYOVQtkLZG
         Qbqe54TMlBd7h/dI9KYi/O35G5ozhuSWadHKnZSlppOoiX0fuE/nqvsRYddqbS6+XVtL
         KuwjWU5G3LCCExqXY/trCdG+AKtXkg7/o1BcjeqM5caPidO9vM4647PntvleAajfpuFe
         B+RetegSzRxTjwJSOqKULUgNbNX+tedIJf67ORsmFY0WuWg+Clbxa/OpQrgFKFJvYW1a
         CjUR6iVvk/3bg0wB0idzHXnQCv0xQXVztHT0KHj3Vyp84BQdl6JUfP0n/OcgTm1xPnjE
         QNmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788162592; x=1788767392;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6woGwI00ns4N8Eg+beukJR/mLo5Rut3WAQ70AzrcV6Q=;
        b=D7AktnLULUFEltB3wRLAOSeD52Ky7FGfIRRwJf/nZavwkiKOxTvjZTsW1a81QInxWx
         Unfmzl5zVbyp+hwf6bPi66UexYMmjhIwJW8OfE2mp3QJZMU2q4XMFLr51JCpXq8XEC0B
         tB9nZnJGxJMId/+WJuhOzp5jkcuV9ZtHpyv7P9qKBsEKQ1AFJOLgsTbAzbBtyq1BsfMV
         9GucSnvcMBz0OOLbChcb88LXlSuJYC8U8Ge5lpLsmsxY9XDt/OqqqJ19x2eh7dLiLlnr
         EWY4/x5wzW16Grp0tCuN2tkbmb9h1i+cYPJdfTyuozkC4TSnEwASh1t2nSnd7oCRiG3W
         +fkw==
X-Forwarded-Encrypted: i=1; AKwUvBxQKru8D6HxMdGg+5dFu3TZIerfCK4AZoPt6P6I9cCVezoOqAcY+Ae/Z2qCv1p4ly0U4nQ9HSUAeDxKm6A=@vger.kernel.org
X-Gm-Message-State: AFuF++lZiVCz8zpxFZr2klDp5Eh408GKBL1/HCYY5lAkrwn7fyzi61co
	sjC3eIv8/3h55mp4lFc919TlQp0pjjlNiklzQA8mhdoOQzTK0feS2wnVklA6gQ==
X-Gm-Gg: AYBFou06jwtNf1Xk0dWUrGBpGKtC0Ts0ZxQyuc6vO8uhUl8iagZdU6xlo5FeDZbR1Ss
	nHp959IRvYF0km4ORjPEh8bkXUhRoVd7ifOnrfeP6/Zf6oSn01QK3bW+6XCjyf4GSB6fKH3WiDz
	tEJbFhPM5aXu1wY6kVhMmQoAo13X/TjhiV6Qj+EOtNpVLYYUtqGnPqjYAnLU/VC9NSMM+MwXM3v
	OWqBE50JPh+n4sVvTRmz0jhDUTdW64b8agbqSuFTMtqnJv6LzHGYA6241BYpoGrw99j2Ah+sQWW
	9kqJFZDd5vdhUb0tbEu7NTlBUcA3YsBjQQcRi4x98xoRoY3ivXuxvcy9SnaG/I2S2w9MajHe+xl
	rQiqtezorlN2f1QkcJu/wSby5N1BsFVzU2dRci/jPufQ3u7vlAgwzKn+dJyrgbhHfc52mIfNbUV
	VhVh+vOiuc3NTy9gY7hnSc2R3XiyJ1wU7w2DnuV6EmmnyTJ7dKBiMa0lkwTl0GENJjSeETN7oTU
	FwqhUinDGFvNNqqbw==
X-Received: by 2002:a17:902:f709:b0:2d9:3fa3:6141 with SMTP id d9443c01a7336-2d93fa3621fmr22401995ad.9.1788162591241;
        Mon, 31 Aug 2026 00:49:51 -0700 (PDT)
Received: from kernel.tail6741c6.ts.net ([185.220.238.38])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d759869b05sm30386075ad.53.2026.08.31.00.49.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 00:49:50 -0700 (PDT)
From: Kunwu Chan <kunwu.chan@gmail.com>
X-Google-Original-From: Kunwu Chan <kunwu.chan@linux.dev>
To: jiangshanlai@gmail.com,
	paulmck@kernel.org,
	josh@joshtriplett.org,
	rostedt@goodmis.org,
	mathieu.desnoyers@efficios.com
Cc: rcu@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Kunwu Chan <kunwu.chan@gmail.com>
Subject: [PATCH] srcutiny: Add atomic SRCU operation checks and state
Date: Mon, 31 Aug 2026 15:49:37 +0800
Message-ID: <20260831074937.2380914-1-kunwu.chan@linux.dev>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Kunwu Chan <kunwu.chan@gmail.com>

Add atomic SRCU operation checks and the associated state to Tiny
SRCU.

An atomic SRCU domain does not use the normal SRCU callback and
grace-period machinery.  In particular, a callback queued with
call_srcu() would never be processed.  Use WARN_ON_ONCE() to reject
call_srcu() and srcu_barrier() on atomic SRCU domains.

For synchronize_srcu(), redirect atomic SRCU domains to
synchronize_srcu_atomic().

Add srcu_reader_flavor to the Tiny SRCU state for these checks.
Tiny SRCU does not currently set the flavor for atomic SRCU domains,
but keeping the flavor in the common state allows the operation
checks to enforce the restriction once atomic flavor tracking is
enabled.

Also initialize srcu_atomic_gp_flag, which was previously left
uninitialized.

Signed-off-by: Kunwu Chan <kunwu.chan@gmail.com>
---
 include/linux/srcutiny.h |  1 +
 kernel/rcu/srcutiny.c    | 12 ++++++++++++
 2 files changed, 13 insertions(+)

diff --git a/include/linux/srcutiny.h b/include/linux/srcutiny.h
index 47a368f945e3..2b293336525a 100644
--- a/include/linux/srcutiny.h
+++ b/include/linux/srcutiny.h
@@ -20,6 +20,7 @@ struct srcu_struct {
 	u8 srcu_gp_running;		/* GP workqueue running? */
 	u8 srcu_gp_waiting;		/* GP waiting for readers? */
 	u8 srcu_atomic_gp_flag;		/* Serialize atomic GP work.*/
+	u8 srcu_reader_flavor;		/* Values: SRCU_READ_FLAVOR_.*  */
 	unsigned long srcu_idx;		/* Current reader array element in bit 0x2. */
 	unsigned long srcu_idx_max;	/* Furthest future srcu_idx request. */
 	struct swait_queue_head srcu_wq;
diff --git a/kernel/rcu/srcutiny.c b/kernel/rcu/srcutiny.c
index 26ea4bfbeaf2..22f7716cbb0e 100644
--- a/kernel/rcu/srcutiny.c
+++ b/kernel/rcu/srcutiny.c
@@ -41,6 +41,7 @@ static int init_srcu_struct_fields(struct srcu_struct *ssp)
 	ssp->srcu_cb_tail = &ssp->srcu_cb_head;
 	ssp->srcu_gp_running = false;
 	ssp->srcu_gp_waiting = false;
+	ssp->srcu_atomic_gp_flag = 0;
 	ssp->srcu_idx = 0;
 	ssp->srcu_idx_max = 0;
 	INIT_WORK(&ssp->srcu_work, srcu_drive_gp);
@@ -289,6 +290,9 @@ EXPORT_SYMBOL_GPL(srcu_defer_drain);
 void call_srcu(struct srcu_struct *ssp, struct rcu_head *rhp,
 	       rcu_callback_t func)
 {
+	if (WARN_ON_ONCE(ssp->srcu_reader_flavor == SRCU_READ_FLAVOR_ATOMIC))
+		return;
+
 	if (should_rcu_defer()) {
 		/* A re-entrant call_srcu() during the drain would livelock it. */
 		if (READ_ONCE(srcu_defer_draining) && !in_nmi()) {
@@ -319,6 +323,11 @@ void synchronize_srcu(struct srcu_struct *ssp)
 {
 	struct rcu_synchronize rs;
 
+	if (WARN_ON_ONCE(ssp->srcu_reader_flavor == SRCU_READ_FLAVOR_ATOMIC)) {
+		synchronize_srcu_atomic(ssp);
+		return;
+	}
+
 	srcu_lock_sync(&ssp->dep_map);
 
 	RCU_LOCKDEP_WARN(lockdep_is_held(ssp) ||
@@ -415,6 +424,9 @@ EXPORT_SYMBOL_GPL(synchronize_srcu_atomic);
 /* Register any deferred callbacks, then wait for all in-flight ones. */
 void srcu_barrier(struct srcu_struct *ssp)
 {
+	if (WARN_ON_ONCE(ssp->srcu_reader_flavor == SRCU_READ_FLAVOR_ATOMIC))
+		return;
+
 	__srcu_defer_drain(ssp);
 	synchronize_srcu(ssp);
 }
-- 
2.43.0

