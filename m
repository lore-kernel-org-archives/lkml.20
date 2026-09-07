Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97826448BA0
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 08:41:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788770519; cv=none; b=ere+i6W7mjKonkNiyrx4Hgyl+K+0fc1ZdAx2j6Y3c4Szw0dZ3I4rZJ779l56x/whYyDP4kBx6QH76fuZ1m1j/jS7lAItfJUw81FLlfuZL3oWWqetjOywoRcdMsImKHa1UmZaxvzFdaq0jROxa0Y77dGME1l8FqG8ET31j9CN0Po=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788770519; c=relaxed/simple;
	bh=AeLsjWU05tP6qUzpR227GlkkcY3aVa0dNsWWq6l86OY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=d57NEjD7L+5wc/YNtUe3vMvMqe6RNXPreNr0lHdJ2fiCyTHJyR0TdiN9hkVylFrzCAy0W3BJyNfeYId072IuwP0U7mxff2pGVixCbZIBA9Z6CYTahW0p/ZQLi/M+5369YxvU+8XG03akdvpHaPbn2vYwgYZNWyjHHi8bnR18U5k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ebLnBjNI; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ebLnBjNI"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-482e4998d28so2547405f8f.2
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 01:41:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788770516; x=1789375316; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=izxSa6U3ciFYO1lIJ9QQ+OE/FD1/ZCd/7scZJPcwER4=;
        b=ebLnBjNIvUfpa4JDn0/FfnuyBSOwgNRQp0NxmfO8oOSdvOwkNKKC1mjEEYC49vaYKM
         QaM7gRfxE6Jv6mP/nj9d0+ZNy4GBq+AQMnvIO7AhVpwM+e8sdrpush3ExjsdsGN4uU34
         eDWIrfeuIFQTFTmNV0OjtWAq2/kHP0cJP2mloR12Mp2IJhhwcn/2bT3aMDTj0vcbg2or
         ISk05C/znfZTbAs4RVPgPOxiJWAPfFib1wDEzbfUJk3poE0kSQEl2gsX0cq3TAXWU8HP
         TNSQu79xhoSlb4nr8EY8m2FGtptn+gryq7Q/T5CbeFCUqkLLbVw+npFGOfD0f5QdbT2l
         KYeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788770516; x=1789375316;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=izxSa6U3ciFYO1lIJ9QQ+OE/FD1/ZCd/7scZJPcwER4=;
        b=UXJ8Onkz6AHJl9yW9qnHOzoQliZBs3hfqksHj+BIj9yS3jT3sdzdhEO34EKLZ/5eOA
         2LF+UQeGeD9x3qDqDid8YOhC+0r1K7caJjqIZtC73VL4FQJfF2HHVWe9JwPYuTQYLoqD
         wmd+PEiDvwdolBpNGOLeUX0WWaGwFW34j6OcPxbF8oGq225liycKrzVY6OAmvja8JSXV
         aiSlhgwbUelmqiEYnRu3KYfQrs6E2LMjBQMM2U1Rn8NjGLUkLbMxqIdnMK5UcPcOALCQ
         MJqjjWzUkz4l1gR3FgeQC9QjTujEsV8vmcLPFQYqfVIywa5tB3r4qZfiI6iGqAtmU/Bk
         zrQQ==
X-Forwarded-Encrypted: i=1; AKwUvBxx8J8q33jM7MP01X/fCfchApHJ12Ickycbk44N0zuLc5QeBJcLTHfQZLtCHtn3uxfP3Bgv7RZO5s+qfZE=@vger.kernel.org
X-Gm-Message-State: AFuF++mC8tbfmyaY7EL8jemD0UqxznPsx/Vopat780EWcymqMNS/J/nb
	DNjKTJCRqHSV5JLzxpYMYr8b2XSLPIlxZW2Z8TDvqqCtRLYmnx/rUB4b
X-Gm-Gg: AYBFou0/pWCYnf1bvXDBsICh4qXjCb0AvSvia7My1I4xvlV6KisuXLzRUK83Lriy1rw
	cD2DG0DLo0ArYhONke4ISwjNDSzM5b6lRsL7RXBdctR2hEwNrdET626vvZOwmDZNZ2LBLLbzqTb
	rU9filRsYQm7Ezd3/11Lxv6Ko4s53hptMJQCl9iMdJeX0PQ++uEyihiBwQlWoraM/Oo8Mhdw0kX
	tWsa/iCJdj4VTvQZszIBJrJxHWbr6NRIwyeIQOUpc4X1gccAK6hAHpO++lDqSEmHtjamXYALMLb
	8c956Y5/wK9F4RGdSqjuaTD+uWtj95mWutgQ8XXkt9kVQ7SKqimAjzge9H7JfogzP+b+q8HwiUC
	ZKBq/BgOaMl6vZg5wSoNDEG77/pBhugSZFvbmhCW/3m/0vMcudGVjCsLFo+8hld0uVdy1OiVMuK
	J2NxDcNPFK/gD6sIsAJm+HK4Gw0TbFBIa0TBGIAtTJaVnHYE7X7nvOF7JhhtSfC/bsm05k3OHih
	thuwGZghH0A6pVrWUcOAGlFfDM+g5IxPqVtVXGsaFzhN1OivwwHOEaf
X-Received: by 2002:a05:600c:8b88:b0:49c:fc6e:a3d8 with SMTP id 5b1f17b1804b1-49cffde8d95mr160935545e9.23.1788770515656;
        Mon, 07 Sep 2026 01:41:55 -0700 (PDT)
Received: from snowdrop.snailnet.com (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-485885bbb51sm27883762f8f.30.2026.09.07.01.41.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 01:41:55 -0700 (PDT)
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
Subject: [PATCH v4 next 6/9] locking/osq: Use cpu number for 'next' pointer
Date: Mon,  7 Sep 2026 09:41:30 +0100
Message-Id: <20260907084133.3696-7-david.laight.linux@gmail.com>
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

There is only one write done through node->next (setting prev)
when 'node' is being removed.
So the code can consistently use the cpu numbers pretty much
throughout (this was suggested by Linux a while back).

This reduces struct optimistic_spin_node to 8 bytes.
This is currently padded out to a cache line which is silly.
Change to be __aligned(8) so that it isn't split between cache lines.

Accesses to 'other cpu' data are very limited and only happen during
the enque and deque operation.

Signed-off-by: David Laight <david.laight.linux@gmail.com>
---
 kernel/locking/osq_lock.c | 43 ++++++++++++++++++++-------------------
 1 file changed, 22 insertions(+), 21 deletions(-)

diff --git a/kernel/locking/osq_lock.c b/kernel/locking/osq_lock.c
index 2f92d3d63da9..0f68ee017b54 100644
--- a/kernel/locking/osq_lock.c
+++ b/kernel/locking/osq_lock.c
@@ -24,21 +24,21 @@
  * There is no equivalent pointer to the list head - the 'head' is the
  * osq_node of the CPU that acquired the osq lock.
  *
- * The 'next' pointer of the tail must be NULL, all the other 'next' pointers
- * must either be valid or transiently NULL.
- * The 'prev' pointers only need to be valid when node->prev makes sense and,
- * even then, can be transiently invalid (ie refer to the wrong node).
- * They are only used for the node->prev->next = node->next update when
- * 'node' is being removed. Atomically checking node->prev->next == node
+ * The 'next' pointer of the tail must be zero, all the other 'next' pointers
+ * must either be valid or transiently zero.
+ * The 'prev' pointer is zero unless the node is waiting for the lock, when
+ * waiting it may refer to the wrong node (node->prev->next != node).
+ * The 'prev' value is only needed for the node->prev->next = node->next update
+ * when 'node' is being removed. Atomically checking node->prev->next == node
  * ensures the list doesn't get corrupted.
  */
 
 struct optimistic_spin_node {
-	struct optimistic_spin_node *next;
-	int prev; /* CPU number offset by 1 */
-};
+	int next; /* CPU number offset by 1, 0 if no next */
+	int prev; /* CPU number offset by 1, 0 if lock held */
+} __aligned(8);
 
-static DEFINE_PER_CPU_SHARED_ALIGNED(struct optimistic_spin_node, osq_node);
+static DEFINE_PER_CPU(struct optimistic_spin_node, osq_node);
 
 /*
  * We use the value 0 to represent "no CPU", thus the encoded value
@@ -72,11 +72,12 @@ static inline struct optimistic_spin_node *decode_cpu(int encoded_cpu_val)
  * When a lock request is being cancelled the caller needs 'next' to
  * set node->prev->next = next.
  */
-static inline struct optimistic_spin_node *
+static inline int
 osq_unlink_from_next(struct optimistic_spin_queue *lock, int prev)
 {
 	int curr = encode_cpu(smp_processor_id());
-	struct optimistic_spin_node *node, *next;
+	struct optimistic_spin_node *node;
+	int next;
 
 	for (;;) {
 		int tail = atomic_read(&lock->tail);
@@ -88,9 +89,9 @@ osq_unlink_from_next(struct optimistic_spin_queue *lock, int prev)
 			 * If prev was spinning in this loop it can continue.
 			 *
 			 * Since we are the tail of the list, node->next
-			 * must be NULL.
+			 * must be zero.
 			 */
-			return NULL;
+			return 0;
 		}
 
 		node = this_cpu_ptr(&osq_node);
@@ -104,7 +105,7 @@ osq_unlink_from_next(struct optimistic_spin_queue *lock, int prev)
 		 * the concurrent unqueue completes.
 		 */
 		if (node->next) {
-			next = xchg(&node->next, NULL);
+			next = xchg(&node->next, 0);
 			if (next)
 				break;
 		}
@@ -118,16 +119,16 @@ osq_unlink_from_next(struct optimistic_spin_queue *lock, int prev)
 	 * When called while unqueueing in osq_lock() this completes the
 	 * backwards link, the forwards link is done by the caller.
 	 */
-	WRITE_ONCE(next->prev, prev);
+	WRITE_ONCE(decode_cpu(next)->prev, prev);
 
 	return next;
 }
 
 bool osq_lock(struct optimistic_spin_queue *lock)
 {
-	struct optimistic_spin_node *node, *prev_ptr, *next;
+	struct optimistic_spin_node *node, *prev_ptr;
 	int curr = encode_cpu(smp_processor_id());
-	int prev;
+	int next, prev;
 
 	/*
 	 * We need both ACQUIRE (pairs with corresponding RELEASE in
@@ -155,7 +156,7 @@ bool osq_lock(struct optimistic_spin_queue *lock)
 	 */
 	smp_wmb();
 
-	WRITE_ONCE(prev_ptr->next, node);
+	WRITE_ONCE(prev_ptr->next, curr);
 
 	/*
 	 * Normally @prev is untouchable after the above store; because at that
@@ -191,8 +192,8 @@ bool osq_lock(struct optimistic_spin_queue *lock)
 
 		prev_ptr = decode_cpu(prev);
 
-		if (data_race(prev_ptr->next) == node &&
-		    cmpxchg(&prev_ptr->next, node, NULL) == node)
+		if (data_race(prev_ptr->next) == curr &&
+		    cmpxchg(&prev_ptr->next, curr, 0) == curr)
 			break;
 
 		/*
-- 
2.39.5

