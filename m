Received: from mail-dl1-f42.google.com (mail-dl1-f42.google.com [74.125.82.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D0A14D7D37
	for <linux-kernel@vger.kernel.org>; Wed,  7 Oct 2026 18:03:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791396201; cv=none; b=C+K3xE/z8vvW8cW4pKmn8fA+N3TSf/No7JbyGfPkYfDvZTPJ/ceg62tmfQnPdRXU0vLipGK6+njmgPRgu/zhFVXIlOvQlHZibi0vLOtU2SUOvhBdRQWXfh8pEktALTUuztLBTUffE9OVBwUXW00UBiOPhlaRsM3GfytF5Rb2S1k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791396201; c=relaxed/simple;
	bh=Ltv/RLIwQoMYY8n388CV2rbSvSpwVLlUtRxsUfEVhTk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=dajLheYHOPmcRVowRJkSCe7HTClrQ5NVon4CKfpqXEBuwKhze5jrye6D8eDppPUIGpQj6fVO6XdWItVkCGX0o7G1Mp3Zz8fG+45xvwy5XIIUlJRQ8GunGalxWBBM7hxQ3mpr/8qH9jjIBJiA4wtdKeyrqnlA6TTtWhKYD4rJROE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=nuro.ai; spf=pass smtp.mailfrom=nuro.ai; dkim=pass (2048-bit key) header.d=nuro.ai header.i=@nuro.ai header.b=agSw48Eo; arc=none smtp.client-ip=74.125.82.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=nuro.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nuro.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nuro.ai header.i=@nuro.ai header.b="agSw48Eo"
Received: by mail-dl1-f42.google.com with SMTP id a92af1059eb24-15354aa70e8so142460c88.1
        for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 11:03:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nuro.ai; s=google; t=1791396199; x=1792000999; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=qgm5+nCeTJXdCx0TLpkqzAsPIchFKXrgB4ZQJsFcySE=;
        b=agSw48EoTLB3BFbR8/BWVUc2YkroUUm6eFvSSB5J/7f7YrMvStz5HeyI7F8y3Yigrh
         r2Jjhfn7Vz0XEUkTIW1gYEVQ/9C2MlFJ0Lh9biA63mfYm/i3ITJdq9rOxGlNtUBtbqu2
         v7supWllaRBqroWlBlvliWf8XM1X8gCrm+cKTpZmBHiNpA5h7WTq9g0QmdX5nFbfFi39
         f95ciZmtCI12b8AkO1saClzN4OBVmLDCV7dqf4lhgFUcjlyJtEMOd4hRZJ/RGtDjluub
         oR7P3hqpyjL78fKqTbvFjEypJ1aAdL75mkgz3Kje+gi+48oT2CI3oP3yVn/sSa6iDlfh
         AqWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791396199; x=1792000999;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qgm5+nCeTJXdCx0TLpkqzAsPIchFKXrgB4ZQJsFcySE=;
        b=HDHlH2Tc2hh/d71KYOYcRduGV4ZHnAnM3+YKkPZRj3CJdfkbe6Y5trFFRURZb2VOFq
         PxajDyhzyorQXoJQKOgcGGpsIBjth5Z3MqSQMmQj4PCHfppfYPnfObOjql5MU+4SRCdn
         g7/Q6nMGxz8kvJw8vfzDeF0lx/AFoHJ21VQdzSlkXMM6GTKDXrhDEN3nm8ENuEZgUUw2
         GPn6Grbjn8bpGpAacd4ahszhhE5F/5wbiCsJXezTW71cxW0e/ysp/t6kcTGGf4mL9xig
         C8erv+8bUCi1l7zcci7sUxwbZqGJMDL7mLcMz3nrL2xOd+zB1zgnRhApHkDGyfIQTQI5
         NJlQ==
X-Forwarded-Encrypted: i=1; AKwUvByr9IxCpfsTAeAj7pI0hSavVfR5QyKmyAqJdEzfpBj3r83PxGFSnpyCGyXMcSz0SQNJIYasos0cgCQwt2o=@vger.kernel.org
X-Gm-Message-State: AFuF++nr974NVAKFz0QjvGuOOsDAFr2BbaKbBB11hPJYU1yLIyPJp8Gt
	qH0VCEDflvyxcso1N9d1nhJM2nqNOOt/sw1qpzhIcc4WMde49Yz9hGuOEsysMW6s4nM=
X-Gm-Gg: AYBFou3frC+2jGA76+fqS6po10LtI7hmTFE0o+C76G1nIT42LN/8gHQ5VxX/k/hNLJq
	cau2ikbFyQPLggNF3jNFD6nN+1kVlE+5CMXncS1M96rYxGNCkZYx6fbqQv8UUJ4oiwPj4uopjO5
	8i4XzSLn/3p2AyVasIbxoUN8YN/FrXD5UCN9wGv9xr0i1VkjK0TjpuOlNRzfTuPQPy1hQd3c+2I
	OiLko++roIuoRIkUbAzPNyEILpA+p1iK/yxM5W2+NP7YicD3JIJKKvpaI9AFzHfLnuvrZ2UWZB8
	X6d4MQe4s7w9IWJVRyuo95t2tKLijy0wJYt6c8g4FTTGNH9yjK5iZQfvi12imhf4z6ch947Tn5W
	oe7ASu0/qaolIKLgkVOby8338C85+457NC9y4vpLngcfzKMw0T5baDh++Hh9g98BaSPrG03YlVG
	boZcmMxwSPOlqGYGWmQVbH826tu2bpMmn7S7JIPQ6mgefytaaF/nFLQzFJJnLIqarjTU0f6TayQ
	brZKpVwZik=
X-Received: by 2002:a05:7023:a56:20b0:148:4522:560c with SMTP id a92af1059eb24-16205bcce04mr3445142c88.11.1791396196809;
        Wed, 07 Oct 2026 11:03:16 -0700 (PDT)
Received: from jkain-desktop.corp.nuro.team ([64.124.43.154])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1616602b33asm7842425c88.3.2026.10.07.11.03.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 11:03:16 -0700 (PDT)
From: Joseph Kain <jkain@nuro.ai>
To: netdev@vger.kernel.org
Cc: edumazet@kernel.org,
	davem@davemloft.net,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	bigeasy@linutronix.de,
	clrkwllms@kernel.org,
	rostedt@goodmis.org,
	linux-rt-devel@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Joseph Kain <jkain@nuro.ai>
Subject: [PATCH net] net: do not let defer_count outlive an empty defer_list
Date: Wed,  7 Oct 2026 11:00:56 -0700
Message-ID: <20261007180056.1394868-1-jkain@nuro.ai>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

__skb_defer_free_flush() can leave defer_count at or above skb_defer_max
with an empty defer_list. That state is absorbing: every producer then
takes the nodefer path without queueing, so the list never refills, and
the flush keeps returning early without clearing. Deferred freeing stays
off for that (cpu, node) until reboot, and cross-CPU frees fall back to
the page allocator, which is the contention deferral exists to avoid.

Two changes from commit 844c9db7f7f5 ("net: use llist for sd->defer_list")
combine to produce it.

skb_attempt_defer_free() now increments before testing the limit and does
not undo the increment when it rejects, so a rejected free leaves the
counter raised with nothing queued.

The flush clears defer_count before llist_del_all() rather than together
with it under defer_lock as it did before. A remote producer that queues
between the two has its skb drained by that same llist_del_all() but its
increment retained, so the counter drifts upward until it reaches the
limit.

Neither needs PREEMPT_RT. The drift needs no preemption at all: the
flush normally runs in NAPI poll on the CPU that owns the list, while
skb_attempt_defer_free() only ever defers to a remote CPU, so producers
cannot be excluded by disabling preemption on the flusher. PREEMPT_RT
only widens the window, because local_bh_disable() does not disable
preemption, so the flusher can be scheduled out between the clear and
the drain.

The latch is also reachable with no race at all:

  sysctl -w net.core.skb_defer_max=1    # frees increment, then reject
  sysctl -w net.core.skb_defer_max=128  # does not recover

skb_defer_max has .extra1 = SYSCTL_ZERO and no .extra2, so 1 is settable.
0 is safe, because proc_do_skb_defer_max() flips skb_defer_disable_key
and the producer returns before incrementing, but that guard covers 0
only. Recovering from the latched state needs a skb_defer_max above the
accumulated count, which an operator has no way to determine.

Drain before clearing, so the error can only under-read, is bounded by
the producers in flight, and self-heals on the next flush. Clear the
counter on the empty-list path as well, so no count can outlive an empty
list and an already-stranded counter recovers.

llist_empty() has already loaded that cache line, so the added read is
free; the unlikely() keeps the store off the hot path, where it would
otherwise bounce the line against remote producers.

Found on an arm64 PREEMPT_RT system running the two commits backported to
6.1. With skb_defer_max lowered, defer_count reached 788,888 on one host
and 122,399 on another with the list empty throughout, and restoring the
default did not re-enable deferral.

Fixes: 844c9db7f7f5 ("net: use llist for sd->defer_list")
Signed-off-by: Joseph Kain <jkain@nuro.ai>
---
 net/core/dev.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/net/core/dev.c b/net/core/dev.c
index 18dc88990510..043a7f9166a9 100644
--- a/net/core/dev.c
+++ b/net/core/dev.c
@@ -6938,10 +6938,13 @@ static void __skb_defer_free_flush(struct skb_defer_node *sdn, int budget)
 	struct llist_node *free_list;
 	struct sk_buff *skb, *next;
 
-	if (llist_empty(&sdn->defer_list))
+	if (llist_empty(&sdn->defer_list)) {
+		if (unlikely(atomic_long_read(&sdn->defer_count)))
+			atomic_long_set(&sdn->defer_count, 0);
 		return;
-	atomic_long_set(&sdn->defer_count, 0);
+	}
 	free_list = llist_del_all(&sdn->defer_list);
+	atomic_long_set(&sdn->defer_count, 0);
 
 	llist_for_each_entry_safe(skb, next, free_list, ll_node) {
 		prefetch(next);
-- 
2.55.0

