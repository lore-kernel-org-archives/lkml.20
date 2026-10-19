Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792429357;
	b=Y/jZk/pjwBwRM78NmNQFBSbC91JMoiGSePZy4tfUSAM59CQUoUs1c3FIigj1evsB9xBQ
	 YKG2mOYSYgEOTC1Ea5pLLRPTsut06yiKBwwTwU2vMXNWavJ2hkpi3VThiwV6RLHbEw15E
	 /MfY8HjDD/OlH0MEvt/uSRdqr9bvZyigWAH/ELBNXVM2obok00xDkb/J4h7vn6E7L/Bhu
	 34DRrRygASz64QXj16RZohUdRhL4fMD+3A4o0VU/qq8tsypT9GAS5ZwnzhWi/5Q0KnyG/
	 HfYk5T+qMLQXdeAAxbk/2PHFioEzhtavOF5DiaGz0hFx2XAhpy0f+8bnYTvr2/zek0w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792429357;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=F45P4Gwx2Xhu7vkg2JA1MLPaW39/9SatqXVLFHFRMnI=;
	b=auUK2AfcUYrSkr5U0pxkiG9MWriWd6Ivg7vhTjTyD29FaSAIxOq13Z75S6JCXgChgqtc
	 7dLR0ar1fcUG/RwHx1jESoRlAVY+gYZDAIpLI3Zavzf9CQas6dkraXu4KC3dxWez15Zg1
	 mnXOFiRDQc1JdUrLvCM1YygfapnoqLw+N7kYa4e7aj/M55IiVpK+TX9B5S4s3S1+dpF95
	 SsZINHLsMqvnhsR6jBVpcLus6paHDNq3ssNLICavu8Wml66tIhrc/bVFOJvW9b37TgYw3
	 YgLJGxpWOVUVXQ3BMDIPWUCgZvHgmbEzRPNdOtGbjKSuUnZPZV0vsLXdjl6XbTCmyfQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=fS2fmV20;
	arc=none smtp.remote-ip=209.85.208.44
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92AAC60A263B
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 17:02:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 92AAC60A263B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=fS2fmV20
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-6b167ffd132so4034486a12.1
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 10:02:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792429355; x=1793034155; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=F45P4Gwx2Xhu7vkg2JA1MLPaW39/9SatqXVLFHFRMnI=;
        b=fS2fmV20/ff2TG+qvivCKDqz4VFNy94wJNKDrNEVsBsed16N6FENeK/APJJaVzSOnS
         QSKrrx8+JGpwWSyU3FpaaG5LVJaA2341+cnBWB3NAzU9LgTw31/8RmC87rhdFVj1exPH
         eLgoBFwAJiRkWgg+rJdvSEQdDUxwtyg9RK61zC/fAJMdzSzFhDRa9VGekteZwbEA1s1h
         lu/1MYuS/zLx5tc73Ev4lj8JxPZY9laA6Hxvr0dp8/FxOS6Da6W6aeYds8w5DquaaS4u
         qfG0Eq8fXB0YtQGNyiZL6hnqZ9uF64aWxWKNgbegAumN0cRCtQSRj3WUhTVZ3sCgSGAd
         aeaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792429355; x=1793034155;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=F45P4Gwx2Xhu7vkg2JA1MLPaW39/9SatqXVLFHFRMnI=;
        b=Ni6EzXSHqUucp3ASUWYA3gako3/GLEN2qULtN13SVub+21jl/ymJx66ATK1mBV4sM5
         BFujBkGCXLk7UHQ18avpOVBCSe9weUydewARHnzDhVpQABqzawMOohmtjCX9avqjga/O
         1e1RnK3KmB0X4NQSPzI6VyMsGxxOUTW5e5Y/UED+8FmU7UGyjIsdfpqefO/L7V+g+rph
         yWQTr6139FT2ogNTK/Vdnq3Dk+qzEH3SVY+42GOWn0evRRl1lxkKHU88XnKTEGIguiIl
         YcCdjkxTJ98Sqk0uSt3KTEdbfp6M49+6tnQZUU4mG9hyiRSIRzHCFdnR7241XkoRgtuQ
         9qZg==
X-Forwarded-Encrypted: i=1; AKwUvByRl7343UYJ4EzZjQFAm3Y1n5sXS55DrjMz9W7s+Rv5Ti7KMaVvUlclGmaUHyJCMV04+RGkkRtfmGiS+FI=@vger.kernel.org
X-Gm-Message-State: AFq9FYLkF+tjg2TSUKQ9w8THp9vgVO4kHkVsPGg7DKNdwvH+qfxgSydr
	GdpVDsCDNBqz5cSJcSrbZmS2mp3B6f4qEsNn3Jv1kb2v5Vp80aJHdCC7
X-Gm-Gg: AYBFou1omnmFQ1f63Oc5LDe+5abh7y+9nGLdiFC1QpDfBBYKihtyqK96EhO2cTuFd8q
	zlH7PgNm5p4/lnq38QfAiHtTxc9vtNNR6fpK38I5YaN+PFyZ8vQqzAS2ziU8fUKoSoKDbfBOIrY
	JTW0N9fYHSjKqMZB/Uo4zr+RAAq4qioc/KjABfQ3KW6FedlDS+mnbEOk1ktz2ziTqDLKJg5c41e
	eH2xHFXI3qzHc5Kqvkg6VlQLYz8/w+Caq7SZHFSy9lhRj25DND/ZxQ5D7mXOGNhB+3sy3T8ODHm
	Tc4Zm2Xb+XFoT3x5fBL76ZHYTaIm5HzNmqkeikSlw4a5DCqroqPu1cqdihUebBZKKiO/ZV9qQqh
	YPFHAER56MDpCNWLCZaDqBXxzJh1CX6bdAgbh5RLo6Ynv6hmZSTiCJbbkINAJeWpzIiF4OzyEVq
	zq1JX878UzIy0yPjKOEhWSguxqDJnU4ud8QZhd8BvZxRVyD4U9KvJzJPgosPQcxfn5
X-Received: by 2002:a05:6402:4582:b0:6b1:b97b:74f with SMTP id 4fb4d7f45d1cf-6b3a8191599mr5429579a12.31.1792429354819;
        Mon, 19 Oct 2026 10:02:34 -0700 (PDT)
Received: from localhost ([2a03:2880:32ff:42::])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b38a1b14besm3998320a12.6.2026.10.19.10.02.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 10:02:33 -0700 (PDT)
From: Vlad Poenaru <vlad.wing@gmail.com>
To: netdev@vger.kernel.org,
	Jamal Hadi Salim <jhs@mojatatu.com>,
	Jiri Pirko <jiri@resnulli.us>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>,
	Will Deacon <will@kernel.org>,
	Boqun Feng <boqun@kernel.org>,
	Waiman Long <longman@redhat.com>,
	Bart Van Assche <bvanassche@acm.org>,
	Davide Caratti <dcaratti@redhat.com>,
	Breno Leitao <leitao@debian.org>,
	Nilay Shroff <nilay@linux.ibm.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH net-next 1/2] lockdep: Introduce lockdep_unregister_key_nosync()
Date: Mon, 19 Oct 2026 10:02:24 -0700
Message-ID: <20261019170225.729789-2-vlad.wing@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261019170225.729789-1-vlad.wing@gmail.com>
References: <20261019170225.729789-1-vlad.wing@gmail.com>
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

From: Bart Van Assche <bvanassche@acm.org>

Add a variant of lockdep_unregister_key() that neither sleeps nor waits
for an RCU grace period. Instead the caller must make sure that a grace
period elapses after the call before the memory holding the key is
freed or reused.

That lets callers that already free the key's memory with call_rcu() or
kfree_rcu() avoid waiting for a second grace period. The qdisc code is
such a caller: all qdiscs except ingress, clsact and noqueue embed a
dynamic lockdep key and are freed with call_rcu(), and replacing an mq
root on a multi-queue NIC destroys one qdisc per TX queue under RTNL,
each currently waiting for its own expedited grace period.

Cc: Peter Zijlstra <peterz@infradead.org>
Cc: Ingo Molnar <mingo@redhat.com>
Cc: Will Deacon <will@kernel.org>
Cc: Waiman Long <longman@redhat.com>
Cc: Boqun Feng <boqun@kernel.org>
Link: https://lore.kernel.org/all/20250203175939.3133477-2-bvanassche@acm.org/
Signed-off-by: Bart Van Assche <bvanassche@acm.org>
[vlad: rebase onto synchronize_rcu_expedited(), spell out the grace
 period requirement in the comments and changelog, describe the qdisc
 use case]
Signed-off-by: Vlad Poenaru <vlad.wing@gmail.com>
---
 include/linux/lockdep.h  |  5 +++++
 kernel/locking/lockdep.c | 36 +++++++++++++++++++++++++-----------
 2 files changed, 30 insertions(+), 11 deletions(-)

diff --git a/include/linux/lockdep.h b/include/linux/lockdep.h
index a6451ecbbe9a0..80b27973b7f72 100644
--- a/include/linux/lockdep.h
+++ b/include/linux/lockdep.h
@@ -117,6 +117,7 @@ do {							\
 } while (0)
 
 extern void lockdep_register_key(struct lock_class_key *key);
+extern void lockdep_unregister_key_nosync(struct lock_class_key *key);
 extern void lockdep_unregister_key(struct lock_class_key *key);
 
 /*
@@ -375,6 +376,10 @@ static inline void lockdep_register_key(struct lock_class_key *key)
 {
 }
 
+static inline void lockdep_unregister_key_nosync(struct lock_class_key *key)
+{
+}
+
 static inline void lockdep_unregister_key(struct lock_class_key *key)
 {
 }
diff --git a/kernel/locking/lockdep.c b/kernel/locking/lockdep.c
index c3dc84a7cef26..16c8480e282e3 100644
--- a/kernel/locking/lockdep.c
+++ b/kernel/locking/lockdep.c
@@ -6669,13 +6669,19 @@ void lockdep_reset_lock(struct lockdep_map *lock)
 }
 
 /*
- * Unregister a dynamically allocated key.
+ * Unregister a dynamically allocated key without waiting for RCU readers.
  *
  * Unlike lockdep_register_key(), a search is always done to find a matching
  * key irrespective of debug_locks to avoid potential invalid access to freed
  * memory in lock_class entry.
+ *
+ * is_dynamic_key() may still be walking past @key under RCU when this
+ * returns. The memory holding @key must not be freed or reused, including by
+ * registering @key again, until an RCU grace period that starts after this
+ * call has elapsed, e.g. by freeing it with call_rcu() or kfree_rcu() queued
+ * after this call. Does not sleep.
  */
-void lockdep_unregister_key(struct lock_class_key *key)
+void lockdep_unregister_key_nosync(struct lock_class_key *key)
 {
 	struct hlist_head *hash_head = keyhashentry(key);
 	struct lock_class_key *k;
@@ -6684,8 +6690,6 @@ void lockdep_unregister_key(struct lock_class_key *key)
 	bool found = false;
 	bool need_callback = false;
 
-	might_sleep();
-
 	if (WARN_ON_ONCE(static_obj(key)))
 		return;
 
@@ -6711,15 +6715,25 @@ void lockdep_unregister_key(struct lock_class_key *key)
 
 	if (need_callback)
 		call_rcu(&delayed_free.rcu_head, free_zapped_rcu);
+}
+EXPORT_SYMBOL_GPL(lockdep_unregister_key_nosync);
+
+/*
+ * Unregister a dynamically allocated key and wait for is_dynamic_key()
+ * readers, so that the memory holding @key may be freed as soon as this
+ * returns. May sleep.
+ */
+void lockdep_unregister_key(struct lock_class_key *key)
+{
+	might_sleep();
+
+	lockdep_unregister_key_nosync(key);
 
 	/*
-	 * Wait until is_dynamic_key() has finished accessing k->hash_entry.
-	 *
-	 * Some operations like __qdisc_destroy() will call this in a debug
-	 * kernel, and the network traffic is disabled while waiting, hence
-	 * the delay of the wait matters in debugging cases. Currently use a
-	 * synchronize_rcu_expedited() to speed up the wait at the cost of
-	 * system IPIs. TODO: Replace RCU with hazptr for this.
+	 * Expedited to keep the wait short, at the cost of IPIs. Callers that
+	 * free @key after a grace period anyway should use
+	 * lockdep_unregister_key_nosync() instead.
+	 * TODO: Replace RCU with hazptr for this.
 	 */
 	synchronize_rcu_expedited();
 }
-- 
2.53.0-Meta

