Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792429566;
	b=t2v3VJCfEhUzlJden1rjhQBW1Tkvu8XOzHd6yhynKchAAAc19VUZiFlOlI6mcyLQgila
	 C+sHI/ie6dneIgwwRVbA5B2brr4ZZuoSmclEn7fg1NEizF/vGL2SJUenFkLFqjNidu2yA
	 jcB4xfT+LYUIzWoakZQD5KyuC4vGSoW0+dgNKFS5tcg40bLSnrqPhuSV45ZruinMGI4Ud
	 FqQZOb/RIUbWEXP6ZLCWPEOJtZjVwu/DYlyuMvpdp+47b/UiHiuNAX8KR3VBCn74DXTAR
	 tRgchGWNe0nyakAG71n4F2nE8KaIClbFFiNoEXk2sczYZxXFzWGcQApXBIW/CfSPgLQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792429566;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=z7k9TuVV+IXStztuF//XuAzNkSqfI9bVeAMGeD1Iu/U=;
	b=b211LwUJ1lwyZf5enBnwlE+V/0neaoIqPamJ+M+uW/n+fvfp+WaODVQtWlpTuDJn9yH/
	 Zu5YFuVbVwxP+BnZbrG51aafsL3796hldF7IWPSrYi4CR5VogC1CYbdbHbxC+3dQw5Z91
	 dQ8iL25qCpuZe13hQL4UvZqXW151gc/YQ3G7tcNI3ULZlPvc2L5P49XCHex6bpa9qtdss
	 1mwfoHMf6F0fYvMkYgxhQsemkqvuNjBXReoy6NCFvPG0Vv5Z4eENb31HgehuO/dcwgEQo
	 0F5zy8g4fmAnVH24oAdDN3FW4AlxnSLwcvbDdDCNxAa+Ge59GP6FzpI6OlgWi2lSkgw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=pqulcYrP;
	arc=none smtp.remote-ip=209.85.218.53
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C190B606A31D
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 17:06:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C190B606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=pqulcYrP
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-c2dc63f8d8aso384062666b.0
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 10:06:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792429564; x=1793034364; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=z7k9TuVV+IXStztuF//XuAzNkSqfI9bVeAMGeD1Iu/U=;
        b=pqulcYrPSYpmsFx+zqD6O7xQbP2t0qODrzNSzNr6O3zDG31qwlciq4Tl4864z7pnOK
         wshvpAD3WZw7+151lYgI4cYUBd6rgpfD9eUHzgvYpQGjbEUrzpDQNqoD+FlChTM8HGkV
         LtSjkzOBW5A0Vc++jM24oGqMBJ+4gmS0EslWKc8mqXNhzRwg9x1PM3JUo5JKN5JWwZJa
         Aw4Rvf2l5mHerXPAFgeluqon9KYYKNIV0hO+aQzIs3WARsnhRYEjFr6w08ZZGTAsrZqz
         05ke3PH5x66iCw0Cd5OyEzdiku7vP11nY0L9ZQmnnvmvTwFP4OfCSCCzDvv+RvRBYjoa
         jFDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792429564; x=1793034364;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=z7k9TuVV+IXStztuF//XuAzNkSqfI9bVeAMGeD1Iu/U=;
        b=1jPLvSyl1cgwJoimnD24N8jt6+a8H6jRUaL4iF0P9Vx95utDeI2rv+fy+04wkigPJw
         eZYIzEuyl2Eul6RpxW2rqmllZjpymiTO2XJNMk+4q0GAf486FO8TevhqYFSF33qbWlKf
         no7mRlWM8U/zbwa/leVTdkySDTDnPnLpXSh5yFO21xTSg0WCjHh7T570Qf/zTfXFFwL6
         eoJvhKNnf5870KvUzcC0+wb1LKrOB8QuN+4QRfk24w8JCOjgom4odHJzi5T62VJfzdV6
         0Qvp6F1qeUmqCszLFizvVvApxmF1oZ7WgKvOFNdDMM4B1kkvN4eHOJf1+azYVa795PQO
         XjdQ==
X-Gm-Message-State: AFq9FYIcqNGMqA6pQza3JSMkBRNnobJhgM1VDQLQsibLhvvpQYOj1Vz7
	9YkxnuwyRc+khot6nqdiQ44ke+cu8zhAbSmNailfEgiPCzenxatTXMk0
X-Gm-Gg: AYBFou3v3qSAFKCnSCZXuecfBYEoU6WH5kETUHLc3KYCWY0/gA1Z6Mlc+Gy0bFC8CIr
	vYKDO7NaZQLbfj/5C6bSURNfBEve41ehXtyJ04giNYQk1vK6xIiO19OnNrgim/ijEmQz1fKiu+E
	YaRp1gefx7xDfpKBoAdKQFcZmkfio+sELS5dW67A8H1LpDUPva0gtKP/HkqsQVprQD4dEtuyt69
	SVAnY73ZO0OfgGDWYJmRh9PmDO1N8DlD/Cq5cZ2zyiKaq6KGJkii1I51gtM7iMzF6KFpHFkf1Kg
	0o8qp5zrVs6KGA+U6HMewb+qAN4/IbKGIChcQguKV9/gfUR1vOwhB+Gjef1/JaDNWYvKFL05g4s
	t2ZGzYkbnxEfunPaNfG7bxEcdBlyeLrLUzLIS8AjR6YUc8vE/pGN6ZFsmU+63pNWWTs1+mxiXqA
	HgOVMhz4apupTEaNI+efizb4KCRqPQo2uJwljf7ePGS3l7S034SxChlkfLUFQMmFM=
X-Received: by 2002:a17:907:d19:b0:c2a:6c3:9e98 with SMTP id a640c23a62f3a-c419fbf0da4mr577216266b.40.1792429563840;
        Mon, 19 Oct 2026 10:06:03 -0700 (PDT)
Received: from localhost ([2a03:2880:32ff:6::])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c40919bde49sm370822766b.55.2026.10.19.10.06.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 10:06:03 -0700 (PDT)
From: Vlad Poenaru <vlad.wing@gmail.com>
To: Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>,
	Will Deacon <will@kernel.org>,
	Boqun Feng <boqun@kernel.org>,
	Waiman Long <longman@redhat.com>
Cc: linux-kernel@vger.kernel.org,
	Breno Leitao <leitao@debian.org>,
	Eric Dumazet <edumazet@kernel.org>
Subject: [PATCH] lockdep: Walk only in-use lock chains in zap_class()
Date: Mon, 19 Oct 2026 10:06:01 -0700
Message-ID: <20261019170601.805087-1-vlad.wing@gmail.com>
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

remove_class_from_lock_chains() visits every bucket of chainhash_table,
which has MAX_LOCKDEP_CHAINS / 2 buckets however many chains exist. With
CONFIG_LOCKDEP_CHAINS_BITS=20 that is 512K buckets per zapped class,
walked with IRQs disabled under the graph lock, on every
lockdep_unregister_key().

That hurts users that unregister keys often. Almost every qdisc has a
dynamic key, so "tc qdisc replace dev eth0 root mq" on a multi-queue NIC
unregisters one key per TX queue, all under RTNL.

Iterate lock_chains_in_use instead. Scanning the bitmap costs
MAX_LOCKDEP_CHAINS / BITS_PER_LONG words (16K at CHAINS_BITS=20); the
rest of the cost follows the number of chains actually allocated. To
tell hashed chains apart from slots that are allocated but not hashed:

 - unhash with hlist_del_init_rcu(), so a chain waiting for its RCU
   grace period is hlist_unhashed(); RCU readers still follow ->next;
 - initialise ->entry in alloc_lock_chain(), so a slot orphaned when
   alloc_chain_hlocks() fails in add_chain_cache() is unhashed too;
 - have lockdep_reset() release the chain slots along with the hash
   buckets, and forget pending frees of them, instead of leaving them
   marked in use.

On an x86_64 KASAN + PROVE_LOCKING kernel with LOCKDEP_BITS=20 and
LOCKDEP_CHAINS_BITS=20 (64 vCPU KVM guest, mq on a 64-queue netdevsim
device), the chain walk per zap_class() drops from 7.3 ms to 0.09 ms
with 8K chains in use, and from 14.8 ms to 1.2 ms with 214K chains.

Signed-off-by: Vlad Poenaru <vlad.wing@gmail.com>
---
 kernel/locking/lockdep.c | 48 +++++++++++++++++++++++++++++-----------
 1 file changed, 35 insertions(+), 13 deletions(-)

diff --git a/kernel/locking/lockdep.c b/kernel/locking/lockdep.c
index c3dc84a7cef26..3a42811b37d39 100644
--- a/kernel/locking/lockdep.c
+++ b/kernel/locking/lockdep.c
@@ -3761,6 +3761,8 @@ static struct lock_chain *alloc_lock_chain(void)
 	if (unlikely(idx >= ARRAY_SIZE(lock_chains)))
 		return NULL;
 	__set_bit(idx, lock_chains_in_use);
+	/* Unhashed until add_chain_cache() succeeds, see zap_class(). */
+	INIT_HLIST_NODE(&lock_chains[idx].entry);
 	return lock_chains + idx;
 }
 
@@ -6279,15 +6281,22 @@ void lockdep_reset(void)
 	debug_locks = 1;
 	for (i = 0; i < CHAINHASH_SIZE; i++)
 		INIT_HLIST_HEAD(chainhash_table + i);
+#ifdef CONFIG_PROVE_LOCKING
+	/* The chains are gone from the hash, release their slots too. */
+	bitmap_zero(lock_chains_in_use, ARRAY_SIZE(lock_chains));
+	for (i = 0; i < ARRAY_SIZE(delayed_free.pf); i++)
+		bitmap_zero(delayed_free.pf[i].lock_chains_being_freed,
+			    ARRAY_SIZE(lock_chains));
+#endif
 	raw_local_irq_restore(flags);
 }
 
+#ifdef CONFIG_PROVE_LOCKING
 /* Remove a class from a lock chain. Must be called with the graph lock held. */
 static void remove_class_from_lock_chain(struct pending_free *pf,
 					 struct lock_chain *chain,
 					 struct lock_class *class)
 {
-#ifdef CONFIG_PROVE_LOCKING
 	int i;
 
 	for (i = chain->base; i < chain->base + chain->depth; i++) {
@@ -6309,29 +6318,42 @@ static void remove_class_from_lock_chain(struct pending_free *pf,
 	dec_chains(chain->irq_context);
 
 	/*
-	 * Note: calling hlist_del_rcu() from inside a
-	 * hlist_for_each_entry_rcu() loop is safe.
+	 * Use the _init variant so that hlist_unhashed() tells
+	 * remove_class_from_lock_chains() to skip this chain while it waits
+	 * for an RCU grace period. Concurrent RCU readers can still follow
+	 * ->next.
 	 */
-	hlist_del_rcu(&chain->entry);
+	hlist_del_init_rcu(&chain->entry);
 	__set_bit(chain - lock_chains, pf->lock_chains_being_freed);
 	nr_zapped_lock_chains++;
-#endif
 }
+#endif
 
-/* Must be called with the graph lock held. */
+/*
+ * Must be called with the graph lock held.
+ *
+ * Walk the lock_chains_in_use bitmap rather than every bucket of
+ * chainhash_table: the hash table has MAX_LOCKDEP_CHAINS / 2 buckets
+ * whether or not they are in use, so walking it costs the same with a
+ * nearly empty table as with a full one. That walk dominates
+ * lockdep_unregister_key() with large CONFIG_LOCKDEP_CHAINS_BITS values.
+ * Slots that are allocated but not hashed (being freed, or orphaned when
+ * chain_hlocks ran out) are skipped.
+ */
 static void remove_class_from_lock_chains(struct pending_free *pf,
 					  struct lock_class *class)
 {
+#ifdef CONFIG_PROVE_LOCKING
 	struct lock_chain *chain;
-	struct hlist_head *head;
-	int i;
+	unsigned long i;
 
-	for (i = 0; i < ARRAY_SIZE(chainhash_table); i++) {
-		head = chainhash_table + i;
-		hlist_for_each_entry_rcu(chain, head, entry) {
-			remove_class_from_lock_chain(pf, chain, class);
-		}
+	for_each_set_bit(i, lock_chains_in_use, ARRAY_SIZE(lock_chains)) {
+		chain = lock_chains + i;
+		if (hlist_unhashed(&chain->entry))
+			continue;
+		remove_class_from_lock_chain(pf, chain, class);
 	}
+#endif
 }
 
 /*
-- 
2.53.0-Meta

