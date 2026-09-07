Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEFA34457C1
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 08:41:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788770516; cv=none; b=ZHK8cRDf25qoPM9tPs08DqEcpi/j1sE61C+0kNk60jREkm0sVM+hy8oLJEYHoOPPJL2zttut4dGOgSBB3rLXhZShLxzmE6Vahrv3BB5CQsfP7EhKeD9XMgnQZ6A8GGOZr6LSC9lAYzHuHWAKYC40vr160BooF//+gX191tOvBqg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788770516; c=relaxed/simple;
	bh=hv8cXECJvwqDma7vH6hzcBZWkB16/ALMDaQN28aqyGQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ij7ZlqEzIw57t3J732CivFIrHHF2bAzU2CJiXMZMsifrHYDLxjgEc2kgu94v1ZV2vdvDVn/LoYCwqHdi4MxbYQT/UFkQDANBLkmjBz3krAe/Xfk7MxinBib2m3pA+WaP/ZdEJT+h4hPuRKOmlrU/bEwZXpQSwsddLKZAIj4SmlU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hlun8uXA; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hlun8uXA"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-482e067e908so2707700f8f.2
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 01:41:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788770513; x=1789375313; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fGPUbzxQT9779lG2OcjBStlPVIZzNZS8ZPWK5ZjiNb0=;
        b=hlun8uXA6etLOBxaEBpNXe1CINSFpxbOGUOYlOXyTN4h8n8CeVSSzBcwmWqKeInKe/
         rLK2n3pzKV7le4DXPstsQa6qDlXbNQ+07f4YVUWl1ELffq7fNOrQ4WZczxvFbJ5sZqlW
         UO4pcHWSdYN/zDkJvcuZ9suKMmaNPyika6YZe/mchFX7c3m4gwZtsIz5HAV92mJm8G2P
         rStXxL4q0F9zDsFjtazrAnttMz6ziO7jQ/e18VcRnLneSmHp38r315vqizE1ca8AToe8
         qRjQZZqYIRCGo913Fsxrj4Au8xRyNINeeMtupFT7LPK8hskDjZC3kQ5Nsg8wdswmQlqY
         b64A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788770513; x=1789375313;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=fGPUbzxQT9779lG2OcjBStlPVIZzNZS8ZPWK5ZjiNb0=;
        b=HoJEPUACzKPf2Uv7SZsY+UPh4enztVwNR2eE+XRXtUU5qh9QNBHqWjOPgvT7WOOaXH
         fP3229seGt6Gm3YZBo3SnqzOgAvJn2Ij6uXlJmb8xjcWLsR6HyRv/QWrHvdhAl+Kikyd
         mcqT0btjR303tQ95WdSZ8khLY3uMlL5y+DFQVsbiRtq8s+7DGdXNinLq5SHQLpPRSG18
         tKZJvRFLdhqg7eDGTFKfmeaLLHf3eBLF+3kNrFqAjuruZy+Jyr2nsL/e0Q2FPGDIltII
         RxXKvyaoopirot/NCW0lPY8iX4UopK2alVH4SfzSpn9EPUsplUrAYRRfrtw2e8PsYa1G
         KulQ==
X-Forwarded-Encrypted: i=1; AKwUvBxVU91nxXPDn681YOYwidOcpIIsf1a7Qt5loLmQeBDasFX6a52NKOJN13E0XOWRyz+mqnnnPRwi43m0Rqs=@vger.kernel.org
X-Gm-Message-State: AFuF++k0sNlJA/1MJEYkKLVG5PLHKPujfeWnkI+au4SbdJz37EdOsibL
	79aFndNRC7QOUYkwlVVl8UidAqNwbkrWYhI59l8IFpyejN1P0OSDbeUs
X-Gm-Gg: AYBFou15nvC+IFy0WJHuD15FNHCwurqf7BRULgZrV6v+yFBT+dwLANOeAEOTU41Mr2B
	768pxTnDYN3wbOxax24I/CDGXBmpQZ6JyjEZtbZWSXsxm2nNeKuXrlYB8Pozg/PF1XDG/pYXkDa
	8RllbHOu3xezJGXooSB+6lkyN5Q5fma0lbVIj3wLTX/rxeIUwYRIJDgNsUfi8LT0tnFBJfS+VQZ
	G7p3x8M+IxWlyP0sn3JWyg3wvuKmmwmQIe1qDVqjxuodRZgHJxKZ5khg1+SkzHlsyEOxmWIaG01
	YD7UAj1xIQepsFj9eATgHVDZXupeJWPfqcxBoGxobP+auwgIlYOX4ckEVy+qUbxH2YSn68IQ1y5
	Uc09HCHrLYB5cBfG8Od4PflqtdTGFzRYLaWTDKkL6RqeOSuAGsIFaOx6xnDxW3gUpL0WZxDVSfn
	fJ2btOWbA4TxwWWPInq50M1TAs4Fl8UQbICOgFcdfVeLvj/IRGqXXmrsRfBcPsg/+lzQcWbm8hm
	allTMCS/4aOyPzskXCf2DbCDrDF/E4At4q0icF3M0OiLfrnE3MolnJL
X-Received: by 2002:a05:6000:4555:b0:482:e1ce:d45c with SMTP id ffacd0b85a97d-485872c2589mr16242555f8f.21.1788770512841;
        Mon, 07 Sep 2026 01:41:52 -0700 (PDT)
Received: from snowdrop.snailnet.com (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-485885bbb51sm27883762f8f.30.2026.09.07.01.41.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 01:41:52 -0700 (PDT)
From: David Laight <david.laight.linux@gmail.com>
To: Waiman Long <longman@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>,
	Will Deacon <will@kernel.org>,
	Boqun Feng <boqun@kernel.org>,
	linux-kernel@vger.kernel.org,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Yafang Shao <laoar.shao@gmail.com>,
	Steven Rostedt <rostedt@goodmis.org>
Cc: David Laight <david.laight.linux@gmail.com>
Subject: [PATCH v4 next 3/9] locking/osq_lock: Set prev_cpu=0 instead of locked=1
Date: Mon,  7 Sep 2026 09:41:27 +0100
Message-Id: <20260907084133.3696-4-david.laight.linux@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260907084133.3696-1-david.laight.linux@gmail.com>
References: <20260907084133.3696-1-david.laight.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

There is no need for separate prev_cpu and locked members of
struct optimistic_spin_node.
Using a single field simplifies the code slightly.
It also removes any possibility of the two values being out of sync.

When cancelling a lock request explicitly set prev_cpu to zero.
Nothing actually looks at the field, but it means that it will be zero
after a subsequent 'fast path' osq_lock() call making things consistent.
The cache line is likely to be dirty (or be dirtied) so there shouldn't
be a performance hit.

Signed-off-by: David Laight <david.laight.linux@gmail.com>
---
 kernel/locking/osq_lock.c | 57 +++++++++++++++++++--------------------
 1 file changed, 28 insertions(+), 29 deletions(-)

diff --git a/kernel/locking/osq_lock.c b/kernel/locking/osq_lock.c
index 01988d00c480..23f00c670507 100644
--- a/kernel/locking/osq_lock.c
+++ b/kernel/locking/osq_lock.c
@@ -35,7 +35,6 @@
 
 struct optimistic_spin_node {
 	struct optimistic_spin_node *next;
-	int locked; /* 1 if lock acquired */
 	int prev; /* CPU number offset by 1 */
 };
 
@@ -113,7 +112,6 @@ bool osq_lock(struct optimistic_spin_queue *lock)
 	int curr = encode_cpu(smp_processor_id());
 	int prev;
 
-	node->locked = 0;
 	node->next = NULL;
 
 	/*
@@ -158,46 +156,47 @@ bool osq_lock(struct optimistic_spin_queue *lock)
 	 * is implemented with a monitor-wait. vcpu_is_preempted() relies on
 	 * polling, be careful.
 	 */
-	if (smp_cond_load_relaxed(&node->locked, VAL || need_resched() ||
-				  vcpu_is_preempted(node->prev - 1)))
-		return true;
+	prev = smp_cond_load_relaxed(&node->prev, !VAL || need_resched() ||
+				     vcpu_is_preempted(VAL - 1));
 
-	/* unqueue */
 	/*
-	 * Step - A  -- stabilize @prev
+	 * Step - A
 	 *
-	 * Undo our @prev->next assignment; this will make @prev's
-	 * unlock()/unqueue() wait for a next pointer since @lock points to us
-	 * (or later).
+	 * Loop until either node->prev is zero (lock acquired) or we
+	 * atomically change prev->next from node to NULL (stopping prev
+	 * handing on the lock).
+	 * Note that 'prev' can unlink itself concurrently with this
+	 * test so that prev/prev_ptr can be stale, but since it
+	 * is per-cpu data the memory can always be read.
 	 */
 
-	for (;;) {
-		/*
-		 * cpu_relax() below implies a compiler barrier which would
-		 * prevent this comparison being optimized away.
-		 */
+	for (;; prev = READ_ONCE(node->prev)) {
+		if (!prev)
+			/* Lock acquired */
+			return true;
+
+		prev_ptr = decode_cpu(prev);
+
 		if (data_race(prev_ptr->next) == node &&
 		    cmpxchg(&prev_ptr->next, node, NULL) == node)
 			break;
 
 		/*
-		 * We can only fail the cmpxchg() racing against an unlock(),
-		 * in which case we should observe @node->locked becoming
-		 * true.
+		 * 'prev' must have unlinked (or be in the process of unlinking)
+		 * itself from the list.
 		 */
-		if (smp_load_acquire(&node->locked))
-			return true;
 
 		cpu_relax();
-
-		/*
-		 * Or we race against a concurrent unqueue()'s step-B, in which
-		 * case its step-C will write us a new @node->prev pointer.
-		 */
-		prev = READ_ONCE(node->prev);
-		prev_ptr = decode_cpu(prev);
 	}
 
+	/*
+	 * If 'prev' tries to remove itself from the list before we write
+	 * a new value to prev->next it will spin in osq_wait_next().
+	 */
+
+	/* Invalidate prev_cpu matching osq_unlock() */
+	node->prev = 0;
+
 	/*
 	 * Step - B -- stabilize @next
 	 *
@@ -240,11 +239,11 @@ void osq_unlock(struct optimistic_spin_queue *lock)
 	node = this_cpu_ptr(&osq_node);
 	next = xchg(&node->next, NULL);
 	if (next) {
-		WRITE_ONCE(next->locked, 1);
+		WRITE_ONCE(next->prev, 0);
 		return;
 	}
 
 	next = osq_wait_next(lock, node, OSQ_UNLOCKED_VAL);
 	if (next)
-		WRITE_ONCE(next->locked, 1);
+		WRITE_ONCE(next->prev, 0);
 }
-- 
2.39.5

