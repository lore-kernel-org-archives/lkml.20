Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9618B3BF684
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 08:41:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788770515; cv=none; b=ovAKQshHgo5TW73QnbBGRWBNrMzbbPik7+uxD3G+AVLa8joFaENknMzAIBzAp1oCmcDdK0O6gdPmkZJlgzATp1IdooMcVf7P/8nbxgw54WBEpwO2kILsTDokBnXiomr5FTETgN6dGoPRtJ+lReqOt4ZMOMnu6lFCynVDGKzHCxA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788770515; c=relaxed/simple;
	bh=lfF6QCpuhc2Dos0ZBBGQ0V6zVcntqow7aVKgsPvrhvg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Gp/qB6avDu84z7XZaHZSHpT41ZguSYenCZ//SzG8WTvGT3IO/aY6wXQhachjlzQ4dqCveV4K4dv16a4cczkiTiZjNuQz8/AdensMVGHxMM1DhiIIop5P0o5fybhoh8MZ4+kQP4Iv1qyNChYezMyGAWrv6XasYgh49Hu6zniSmAc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=tJrDSHuK; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="tJrDSHuK"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-485843aeab8so3631237f8f.1
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 01:41:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788770512; x=1789375312; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AK0HAdhUgdaBbUhHuXj+SBu9juYJIyCoUjyrh+fGc6A=;
        b=tJrDSHuKTQ83vbmSS/+AaBHFLta+0E0adnEVR2kf208nL0mMo4RDxyPJEIBjZP+xlm
         Jwh1grW3B2nOzGdWTGEnXzUzoV90oxHsau+ltcrS1UUEcucCtey70QsVyek5ED+lslV7
         4D1+W4RM4ho2uJyJr5dt00SXsM7ItbAjem91juDS0IK3q/SVw1gYLGXhVgaLVaF1SLg8
         gZnlUCMQAB6AApmFvzJbsoEYqXVjAyik1PgtljpCpUBtqdnEbrOduAQCyJGdMbovwd2X
         y/KDnOI1QTNvhT+2wSxl8r9caiZAeaR+QjKWKrza86KDATNzMnzRu/tco+eyp2eRe/kK
         zulQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788770512; x=1789375312;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=AK0HAdhUgdaBbUhHuXj+SBu9juYJIyCoUjyrh+fGc6A=;
        b=eq7YOv8OGODfMJkRoIjYohsrsdyx3JHlHHTRxE0oB4tbzOeR1iSsLkuRtWZ/51HMOn
         tP34NBodtBofDHYhCCi/g+UbTw+vZHsl0wB0X30hLKqhiGQvppbk8yKEyIUFOsQHpP/i
         jmLGsdELMKxevbvW6HsgnMDFb+9+IQ07wZk1dy6OMOYIX4mUaJEn3Oid/nMFxK59JTiV
         mIJuJjKTEsMBhlF54WUXqOL1MEZuRWz92ZwrpUmNtVuvMctd4bg3PH3zkHuaVKUToAPs
         5+x+0uQY+3xrNIE+cJ22vx32ZhlBcMQahYPO9ZwlGcGbn1AO/0LHoj2gN93vCNXbICDi
         p0eg==
X-Forwarded-Encrypted: i=1; AKwUvBw6G+CS/3PAqDtOhRxf/PrmHQMg619Bgka85J3KglplxbXXhW2SPhOjiItHZ7jCPYh3RswJvY3WwVaxBOQ=@vger.kernel.org
X-Gm-Message-State: AFuF++kN6GtKmwt0eVrhxk1u5R8H6PwrhW5C6Egfot5BNASWc4fHcOHR
	1cH4jhAbd/y1FwAFS7rnml7SAlyTkxU9rcJgcM2Jt6cjHUT/adAgkNj6
X-Gm-Gg: AYBFou0ZRPkXHZxCwnM3p6h8Pt7qf1rTyX0yZHBCLiJ5RBaRcsG8bcwwhyMUkASAdPr
	AjNGybZndxygNiNvf9NIsgo5Aw8WqoeGz/eFJkC1RDBaw8V7ohfgLjRwjIs0u5PWiuWeKk3xUV6
	DUCljy0vKIK1/2jdY0hG7cVIVVNJgYoybutS+dxJSxqFezJo2TO/gLdn1Hddh3plAoR1aOFNhf3
	cEcFpQqH0BPNdeQWCU2jx17pQ9v/fSM2ogmBuO7e6wV2tP8XePN9Lndcw1DU9N3YCWcehdfPaHm
	nLzpV2DX/MAJDhY+8XoQIO1KLdeZKPP6IYRSMo2s2C7oqv7/7mEK2vxPWJ+r6liG19yRSFCmYt5
	kuGXoPdxA8N4MMTopgsB68CHDt+4nBzixJwK3hUvMK7/ZZknluQHWvVBiy7qHkZ21DmZGNozOnh
	/awZMIiU4RPb/uEbzhxmwT9XgytK6xbNxvhP3hmDs8o7+/JZm4OnBb6vaogwo5YkMwrbt1eVbwu
	2/7bps+J6SqOYJc1qgF+7ql7/46OwRT+CkSrShAL+UM1w==
X-Received: by 2002:a05:6000:41d4:b0:484:3310:c4fc with SMTP id ffacd0b85a97d-48587090793mr44242185f8f.23.1788770511730;
        Mon, 07 Sep 2026 01:41:51 -0700 (PDT)
Received: from snowdrop.snailnet.com (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-485885bbb51sm27883762f8f.30.2026.09.07.01.41.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 01:41:51 -0700 (PDT)
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
Subject: [PATCH v4 next 2/9] locking/osq_lock: Save the cpu number for 'prev' not the node address
Date: Mon,  7 Sep 2026 09:41:26 +0100
Message-Id: <20260907084133.3696-3-david.laight.linux@gmail.com>
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

The cpu number of node->prev is needed for both the vcpu_is_preempted()
test and to update lock->tail.
This saves reading the cache line for the other cpu's per-cpu data.

The cpu member of optimistic_spin_node is no longer needed.

Merges patches 2 and 3 from v3.

Signed-off-by: David Laight <david.laight.linux@gmail.com>
---
 kernel/locking/osq_lock.c | 33 ++++++++++++++-------------------
 1 file changed, 14 insertions(+), 19 deletions(-)

diff --git a/kernel/locking/osq_lock.c b/kernel/locking/osq_lock.c
index b17aa704c449..01988d00c480 100644
--- a/kernel/locking/osq_lock.c
+++ b/kernel/locking/osq_lock.c
@@ -34,9 +34,9 @@
  */
 
 struct optimistic_spin_node {
-	struct optimistic_spin_node *next, *prev;
+	struct optimistic_spin_node *next;
 	int locked; /* 1 if lock acquired */
-	int cpu; /* encoded CPU # + 1 value */
+	int prev; /* CPU number offset by 1 */
 };
 
 static DEFINE_PER_CPU_SHARED_ALIGNED(struct optimistic_spin_node, osq_node);
@@ -50,11 +50,6 @@ static inline int encode_cpu(int cpu_nr)
 	return cpu_nr + 1;
 }
 
-static inline int node_cpu(struct optimistic_spin_node *node)
-{
-	return node->cpu - 1;
-}
-
 static inline struct optimistic_spin_node *decode_cpu(int encoded_cpu_val)
 {
 	int cpu_nr = encoded_cpu_val - 1;
@@ -114,13 +109,12 @@ osq_wait_next(struct optimistic_spin_queue *lock,
 bool osq_lock(struct optimistic_spin_queue *lock)
 {
 	struct optimistic_spin_node *node = this_cpu_ptr(&osq_node);
-	struct optimistic_spin_node *prev, *next;
+	struct optimistic_spin_node *prev_ptr, *next;
 	int curr = encode_cpu(smp_processor_id());
-	int old;
+	int prev;
 
 	node->locked = 0;
 	node->next = NULL;
-	node->cpu = curr;
 
 	/*
 	 * We need both ACQUIRE (pairs with corresponding RELEASE in
@@ -128,11 +122,11 @@ bool osq_lock(struct optimistic_spin_queue *lock)
 	 * the node fields we just initialised) semantics when updating
 	 * the lock tail.
 	 */
-	old = atomic_xchg(&lock->tail, curr);
-	if (old == OSQ_UNLOCKED_VAL)
+	prev = atomic_xchg(&lock->tail, curr);
+	if (prev == OSQ_UNLOCKED_VAL)
 		return true;
 
-	prev = decode_cpu(old);
+	prev_ptr = decode_cpu(prev);
 	node->prev = prev;
 
 	/*
@@ -147,7 +141,7 @@ bool osq_lock(struct optimistic_spin_queue *lock)
 	 */
 	smp_wmb();
 
-	WRITE_ONCE(prev->next, node);
+	WRITE_ONCE(prev_ptr->next, node);
 
 	/*
 	 * Normally @prev is untouchable after the above store; because at that
@@ -165,7 +159,7 @@ bool osq_lock(struct optimistic_spin_queue *lock)
 	 * polling, be careful.
 	 */
 	if (smp_cond_load_relaxed(&node->locked, VAL || need_resched() ||
-				  vcpu_is_preempted(node_cpu(node->prev))))
+				  vcpu_is_preempted(node->prev - 1)))
 		return true;
 
 	/* unqueue */
@@ -182,8 +176,8 @@ bool osq_lock(struct optimistic_spin_queue *lock)
 		 * cpu_relax() below implies a compiler barrier which would
 		 * prevent this comparison being optimized away.
 		 */
-		if (data_race(prev->next) == node &&
-		    cmpxchg(&prev->next, node, NULL) == node)
+		if (data_race(prev_ptr->next) == node &&
+		    cmpxchg(&prev_ptr->next, node, NULL) == node)
 			break;
 
 		/*
@@ -201,6 +195,7 @@ bool osq_lock(struct optimistic_spin_queue *lock)
 		 * case its step-C will write us a new @node->prev pointer.
 		 */
 		prev = READ_ONCE(node->prev);
+		prev_ptr = decode_cpu(prev);
 	}
 
 	/*
@@ -210,7 +205,7 @@ bool osq_lock(struct optimistic_spin_queue *lock)
 	 * back to @prev.
 	 */
 
-	next = osq_wait_next(lock, node, prev->cpu);
+	next = osq_wait_next(lock, node, prev);
 	if (!next)
 		return false;
 
@@ -223,7 +218,7 @@ bool osq_lock(struct optimistic_spin_queue *lock)
 	 */
 
 	WRITE_ONCE(next->prev, prev);
-	WRITE_ONCE(prev->next, next);
+	WRITE_ONCE(prev_ptr->next, next);
 
 	return false;
 }
-- 
2.39.5

