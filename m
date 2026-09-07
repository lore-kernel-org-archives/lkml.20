Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41E67448BA3
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 08:41:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788770520; cv=none; b=WGJdE3ww69zmCYVUYEcCnfGEL2gd/Rlzi31x+KYDa7Yd9bP2YsR7qmPumuDowyG7GSqWH26niT0W3DVP0YCKgu1OJYyiVoNBhzCB86vDA2uYHb5yQmoZRka7lgJL5Ev0R+v/kPnt5s9Hag59PUkeZ3XGKAkMOij4ncM9uasjb2A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788770520; c=relaxed/simple;
	bh=ZTmmndy7/AcjbfShhrBZFEsnXBPekn0HGXjSLaxXqJQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Ph4savWCErgAE2wmrznXm0bAOxtqmgALZETbHAYyfRb7bl2SEkw6v6PHTjl7oCnaPK/tkWJzbM2yPnixooeMh6OiRCGYQs+BqGssB62cOtd9fVbMLUnOLXpa/A3cNOOItaum9++0q9dQVhbIspmure9EBMX31YFcZLsRmYiFlIY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TQDJs4WU; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TQDJs4WU"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-48586861639so2403725f8f.0
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 01:41:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788770516; x=1789375316; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tH/kRPPDD2gV1vMx/S94hLYP+9/dPU1ymPrzNYM8wtg=;
        b=TQDJs4WUSr5+TPt3zpY5rOWZpcV5bM935d68lM1XOHz5qNX3W3eXESHHiwUemH/KSB
         TcmTeNYMCSty8pzGKl2Txbt/Wb/sY5r8hCUzLcepg94OEW4MJtO3Ln229n1BZMEFT6y4
         DGwZ6F4gcxIiJelOgb/Pbx5aHZGgzbHjkyqCcWC7ZUw/A4c+wVO+ae7ouesJrj+fDjTX
         dm5F3uRzcEvf9ENTvj9u4qcicI0L6W9eKjBK/Qiv5//ECUFrMgrQl488qGhcdPY97TJF
         8va9td9AyjIBMQchuV2T7eyqMCu4K+kn+aISMzUznexW5b4P3dN7IMn/+JFpufachwuC
         RGCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788770516; x=1789375316;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=tH/kRPPDD2gV1vMx/S94hLYP+9/dPU1ymPrzNYM8wtg=;
        b=lKApyoKUYMzTwSCFMAAHsiXTjtWwEOTeEdlTdsSE8v+AmLOBalmm3obrkyrmhVFclg
         3zRnK3zDwsgGzR8LVqoEz/0BElt9APcXRRqTCrHuYvNgAL0Gok+1DkoetTQAtqNizJ4o
         eiWM4+HI7YLf+1I5unBPKIC/bGZPhu7kMjVMXE8Cx4ywNt1yIUmOPiz4Q1CA1usPP0wo
         sK3h70HUaS8va6XbAeKa4hXWQXLp/GEe6/N58hxSLTg9Jdip05OvhJ8XJMar0W7q7wGf
         DNuDOhEUCrhj/cTjjzMSedbQOCUQ14apbhkCARQZ9VaD4y5EOdhlWRDCwfvwbIwpL091
         xQPA==
X-Forwarded-Encrypted: i=1; AKwUvBwyjvyl0wfl0Mx0YnBYYghHgas//rHJg25KjsiAf8Lq5Kqx9i7Oq5Bp/VVwIVkJ7SkUb1N4xE/d6VdiZ0E=@vger.kernel.org
X-Gm-Message-State: AFuF++mJUXwPvh8bswJPtoSVNpXJ8f0yJi9quRNF4TDz3Ir+4Z63CK36
	hd86GI/OJK+IaPvF1NqK81QbutoM7U3ITLnZAqEmRfzigDLNI4nZm8Bl
X-Gm-Gg: AYBFou0q9Oj3AkFnREiwuXFOERzcKpMmWj9Uy5c/+NDR+LEQVfjBZIBuFM6Xic1cvDh
	DE3tqUKV0Tgff5awQ7hWN9MhRPOPrYr3tk7NNDi2NAg0QGWOuCbThp0AFJr16FDruWP15Mjy0jl
	grWcBHftWNpB6eY/brvWablZv5SRdJWmEDRmtMnGhZOCMT60XkkzcLgnn22FQlEEKSTl+5lh3Rf
	7G44vH026IP0A3tGLinedCTniIAt0b+5b+a4hocLtSiMTgVn4ZdsDACC6qvFJ7PgsJpilLGVxtq
	d9IWT3iRkNRue9GDrYr2VOdfomRRRRgQJ7rBI4xCoIE6AuKaVOEOJLMG+ljlB/Cn7y8oY2KJQTY
	gYzKQ6wD/3QrgBlgLfvAUg+AkXQ5cCy8kZStXuviiAiVanhDLsTLHcJvIWaYNHjXiW9BY9F+qkx
	l8EPwEAWfZFQwdZksyvqyahW5qxC9LbGMQRFMshksfA+pipZ/If0B0SDKHXaK8DhJ8a2eEVAFVq
	AqZm4l4ujCWiec0GUeB7Kt58vhre0p7opDjrzgnWslG0w==
X-Received: by 2002:adf:edc8:0:b0:482:e658:7a39 with SMTP id ffacd0b85a97d-4857e5171femr23993264f8f.11.1788770516418;
        Mon, 07 Sep 2026 01:41:56 -0700 (PDT)
Received: from snowdrop.snailnet.com (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-485885bbb51sm27883762f8f.30.2026.09.07.01.41.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 01:41:56 -0700 (PDT)
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
Subject: [PATCH v4 next 7/9] locking/osq: Use 'unsigned int' for next/prev/tail
Date: Mon,  7 Sep 2026 09:41:31 +0100
Message-Id: <20260907084133.3696-8-david.laight.linux@gmail.com>
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

Consistently use 'unsigned int' for all the 'offset by 1' cpu numbers.
This makes the code only use one set of xchg primitives.
The unsigned type gives marginally better code inside per_cpu_ptr().

Signed-off-by: David Laight <david.laight.linux@gmail.com>
---
 include/linux/osq_lock.h  |  8 ++++----
 kernel/locking/osq_lock.c | 31 +++++++++++++++----------------
 2 files changed, 19 insertions(+), 20 deletions(-)

diff --git a/include/linux/osq_lock.h b/include/linux/osq_lock.h
index ea8fb31379e3..9e637e265189 100644
--- a/include/linux/osq_lock.h
+++ b/include/linux/osq_lock.h
@@ -12,17 +12,17 @@ struct optimistic_spin_queue {
 	 * Stores an encoded value of the CPU # of the tail node in the queue.
 	 * If the queue is empty, then it's set to OSQ_UNLOCKED_VAL.
 	 */
-	atomic_t tail;
+	unsigned int tail;
 };
 
 #define OSQ_UNLOCKED_VAL (0)
 
 /* Init macro and function. */
-#define OSQ_LOCK_UNLOCKED { ATOMIC_INIT(OSQ_UNLOCKED_VAL) }
+#define OSQ_LOCK_UNLOCKED { OSQ_UNLOCKED_VAL }
 
 static inline void osq_lock_init(struct optimistic_spin_queue *lock)
 {
-	atomic_set(&lock->tail, OSQ_UNLOCKED_VAL);
+	WRITE_ONCE(lock->tail, OSQ_UNLOCKED_VAL);
 }
 
 extern bool osq_lock(struct optimistic_spin_queue *lock);
@@ -30,7 +30,7 @@ extern void osq_unlock(struct optimistic_spin_queue *lock);
 
 static inline bool osq_is_locked(struct optimistic_spin_queue *lock)
 {
-	return atomic_read(&lock->tail) != OSQ_UNLOCKED_VAL;
+	return READ_ONCE(lock->tail) != OSQ_UNLOCKED_VAL;
 }
 
 #endif
diff --git a/kernel/locking/osq_lock.c b/kernel/locking/osq_lock.c
index 0f68ee017b54..144eb446c867 100644
--- a/kernel/locking/osq_lock.c
+++ b/kernel/locking/osq_lock.c
@@ -34,8 +34,8 @@
  */
 
 struct optimistic_spin_node {
-	int next; /* CPU number offset by 1, 0 if no next */
-	int prev; /* CPU number offset by 1, 0 if lock held */
+	unsigned int next; /* CPU number offset by 1, 0 if no next */
+	unsigned int prev; /* CPU number offset by 1, 0 if lock held */
 } __aligned(8);
 
 static DEFINE_PER_CPU(struct optimistic_spin_node, osq_node);
@@ -44,16 +44,15 @@ static DEFINE_PER_CPU(struct optimistic_spin_node, osq_node);
  * We use the value 0 to represent "no CPU", thus the encoded value
  * will be the CPU number incremented by 1.
  */
-static inline int encode_cpu(int cpu_nr)
+static inline unsigned int encode_cpu(unsigned int cpu_nr)
 {
 	return cpu_nr + 1;
 }
 
-static inline struct optimistic_spin_node *decode_cpu(int encoded_cpu_val)
+static inline struct optimistic_spin_node *
+decode_cpu(unsigned int encoded_cpu_val)
 {
-	int cpu_nr = encoded_cpu_val - 1;
-
-	return per_cpu_ptr(&osq_node, cpu_nr);
+	return per_cpu_ptr(&osq_node, encoded_cpu_val - 1);
 }
 
 /*
@@ -72,17 +71,17 @@ static inline struct optimistic_spin_node *decode_cpu(int encoded_cpu_val)
  * When a lock request is being cancelled the caller needs 'next' to
  * set node->prev->next = next.
  */
-static inline int
-osq_unlink_from_next(struct optimistic_spin_queue *lock, int prev)
+static inline unsigned int
+osq_unlink_from_next(struct optimistic_spin_queue *lock, unsigned int prev)
 {
-	int curr = encode_cpu(smp_processor_id());
+	unsigned int curr = encode_cpu(smp_processor_id());
 	struct optimistic_spin_node *node;
-	int next;
+	unsigned int next;
 
 	for (;;) {
-		int tail = atomic_read(&lock->tail);
+		unsigned int tail = READ_ONCE(lock->tail);
 		if (curr == tail &&
-		    atomic_try_cmpxchg_release(&lock->tail, &tail, prev)) {
+		    try_cmpxchg_release(&lock->tail, &tail, prev)) {
 			/*
 			 * We were the last queued, lock->tail now references
 			 * prev (or is 0 if the list is now empty).
@@ -127,8 +126,8 @@ osq_unlink_from_next(struct optimistic_spin_queue *lock, int prev)
 bool osq_lock(struct optimistic_spin_queue *lock)
 {
 	struct optimistic_spin_node *node, *prev_ptr;
-	int curr = encode_cpu(smp_processor_id());
-	int next, prev;
+	unsigned int curr = encode_cpu(smp_processor_id());
+	unsigned int next, prev;
 
 	/*
 	 * We need both ACQUIRE (pairs with corresponding RELEASE in
@@ -136,7 +135,7 @@ bool osq_lock(struct optimistic_spin_queue *lock)
 	 * the node fields we just initialised) semantics when updating
 	 * the lock tail.
 	 */
-	prev = atomic_xchg(&lock->tail, curr);
+	prev = xchg(&lock->tail, curr);
 	if (prev == OSQ_UNLOCKED_VAL)
 		return true;
 
-- 
2.39.5

