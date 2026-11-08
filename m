Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794096117;
	b=XP9SBm+w3Cy1RoQulXHu0OotDCdN6NAXrEKn5v9UkLNlGOrzQOPwP9QZ/9MOPayVhQiD
	 ezIXtlHV4e591eLLXQfnwhgLoGWLPXgYcHkX6Kg4hvgZkh/I9Ir/fU95CRYAEA8jVYtXn
	 SrV3CCa1WmitOcK7MANntq2U+gVRxoqDq2bGK3OkJqejYvlEwjbOmbHkQA2hm0aE9VDIB
	 DxTEYz+r5oMheocCwKGtWMtsh8DAiEGZcN0xKQaZaD8TEFC1GNWn96xFubDsHdIyEv8wc
	 1GGzlQwDRu8gm6OLU5ZgC1iGdQIgwGeugpFawjg2NwbEsLj+F/MQykHpY30hQoPqqlA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794096117;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=HK+RKClxKHeBKDMXh9KyH2csGqniK+X/yXULXh9jPPA=;
	b=SdSLqT7cfcwXYKkLLYSiq7XfzkY4tRYIyVSpxd6gOmKZQuZwUHzbHJZCqmrcHaytAaEt
	 mYh56fejIjpDH3pQ/u4VxujFP1d8LggcbaY/o/gAmejzYeXoveUKoHTTOkXECeJnSJpUr
	 ekSeGDck/T+aWGHs2HZ2KQpuR9pJxAcy00GhlaPWyLM71ccVfqc75tjEzBx7zVB5C4yox
	 RZp5uXIL/HWwuflc4ybb8Fa0GcfX+Pwj0CvBrIU2wNRTVDF+VvmVJQl0qp9n6ixIJyjOK
	 TG4DSmvh4GAy+K5uTDD1j54XvyPASTtSF+0wu3Nelox8yHRvqyvHNr7xq8msMZKGM7A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lhqYwLJ1;
	arc=none smtp.remote-ip=209.85.128.42
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CC83606A32F
	for <linux-kernel@vger.kernel.org>; Sun,  8 Nov 2026 00:01:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9CC83606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lhqYwLJ1
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4a549cd7fd2so883555e9.0
        for <linux-kernel@vger.kernel.org>; Sat, 07 Nov 2026 16:01:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794096115; x=1794700915; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HK+RKClxKHeBKDMXh9KyH2csGqniK+X/yXULXh9jPPA=;
        b=lhqYwLJ1O8TH6RKDMfUkDP6mkNSAEiwpdiDwDIrol/sYROkRqTD/8j2b/HYfXEgLn9
         tKwlzpwf/cEsm9MfY6nqHWLqB2XVzNQWtgzjWGtyCkjkCklTZS9Dar5kYA0WeuVdO6Qn
         DYL4I0t7a8e0sARjvO6ovpP8kt+usM7FrTDy1BM6VXfz/ULPtAgowoPBaExyMha5VdU8
         u4gXCWAxgEllzavJzXKCia15534bVYssQX9hKjy5mBY4ZcfLTIGXFxSAoaBK2QqUJVGF
         gDcWDFhh0LsNxe2IF9HZ749Zb/pB9y8mF9wCVLAovjssHPrkaiG020c1jTz7eBhXSfwI
         sVPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794096115; x=1794700915;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=HK+RKClxKHeBKDMXh9KyH2csGqniK+X/yXULXh9jPPA=;
        b=RPZH29gW+W1llyXPEgubJ01C6OlurbYJGLnPUHv2sOFgKU4NX0weO4uGXOP3XLf2Yc
         b3z8EBPi5pRsp4mCA80M4cGscqPSbTa/r/CVNXcbf9l3X612MJcafVUcnjEyQTMqqYOA
         0g48x1mcOL8zU3uzvzqky3QrN4r9+sf8YT9gdKwCBhqZdLjeiSR1bwuis8eGxlf7vZ1b
         KJEmbPZIRQ7G8Ds786E/WKW2ts1sozojd9yd42pKrJPXH/pOhuO3ymDMOHTCsADoUKBi
         37iuIW6Dj50yQ/cShOQbI/Nebv/8n38tJLM1Fi3Uw7sTpgVq8yaUsEBgX65AKQeb4wiY
         Yn1A==
X-Forwarded-Encrypted: i=1; AKwUvBycv6FLRjpM4lULGB01Ocu2mX0DjfIkeENb2xcYlxJWsTbcOUJGpr365XlnyqSVsZ0aUDhsNaBuety5JQo=@vger.kernel.org
X-Gm-Message-State: APuU4Z/lauDedRoZRUezWSLPjz/m5XJSge+nr1zvKTdaWpHG04h0Tmwh
	eRY2JvdVuZEXawmVHaZdltJmGgMwcbknCZdTAjj4IY/6Yuxst7hPe6Hjfrj7WijRdyMZjw==
X-Gm-Gg: AYBFou2sp7cbasV5O2xWjPiE/HSoVKGDBLNd2ihug/MXKeAN3pCkmoVOQnV1tG4asoU
	fe2tX5C2h+hhKkBsieoNwS2rAIuy+Hai1cNZxYWkQxyDxuzWJvCIeEleomVUfs/EGykZnYB6J3f
	TM2R2BBOljLsU+BUqXULpy0z4yzin/dn/w98bnOTwK6FU7ajR2aAI9XMHDU4+VLfxjqgN772kBn
	nK5KG6+9yQttQ6mE1AvmO2G8mZAP3gYQlncWRX/TuoHmvG+vuO/M/5IIw1m6DHpyMVDWZjXVnql
	7J4vGi6WcVXWnXhlCJXqDmb2AfjNx9C5rR6TPYGyCXUDzMd+jk8ZGW4SfZHJb7UxBXIjnFtIXPb
	em4CN2jCk+hWbouQN4xT8ZZc4tEp/pxJQnSZNwK33UvNtu/D663snoRZEXluRnlVfEKvFtrX6Dj
	6CKQQ/A56Tj1TJGhre7tYCBEwp5lbvwteRVbkrUyAPjJVj3lXDps4FvivifNOlhFtE7z7XIHTL0
	aN+aqcS0ez9ifutmXGBt0SB0cnOJQ1B5IQBE5aZnQVu86yQ/XaulKmyLvOudXWqvg0G9dYqwrlS
	SavHvH3FDZaijwwLXXAkWi+09Q==
X-Received: by 2002:a05:600c:4e05:b0:4b2:4b5e:8141 with SMTP id 5b1f17b1804b1-4b963c662f4mr4462525e9.9.1794096114831;
        Sat, 07 Nov 2026 16:01:54 -0800 (PST)
Received: from metepc ([46.197.185.3])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b90ee247e9sm17430835e9.6.2026.11.07.16.01.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 16:01:54 -0800 (PST)
From: =?UTF-8?q?=C3=96mer=20Mete=20Kaya?= <omermetekaya0@gmail.com>
To: sven@narfation.org,
	marek.lindner@mailbox.org,
	sw@simonwunderlich.de,
	antonio@mandelbit.com
Cc: b.a.t.m.a.n@lists.open-mesh.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	davem@davemloft.net,
	syzbot+61b202fdc410840f0198@syzkaller.appspotmail.com,
	=?UTF-8?q?=C3=96mer=20Mete=20Kaya?= <omermetekaya0@gmail.com>
Subject: [PATCH batadv-next v3] batman-adv: tt: batch BH re-enable during TT hash walks
Date: Sun,  8 Nov 2026 03:01:11 +0300
Message-ID: <20261108000137.822325-1-omermetekaya0@gmail.com>
X-Mailer: git-send-email 2.56.0
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Each spin_unlock_bh() re-enables bottom halves and, when softirqs are
pending, processes them inline before returning. During a 1024-bucket
TT hash walk under network load, the purge worker can be repeatedly
interrupted by inline softirq processing at every bucket boundary.

Replace per-bucket spin_lock_bh()/spin_unlock_bh() with an outer
local_bh_disable(), inner spin_lock()/spin_unlock(), and periodic
re-enable points via batadv_hash_bh_resched(). The helper re-enables
BH and calls cond_resched() every BATADV_HASH_BH_BUDGET (64) buckets.
The total softirq work is unchanged, but BH state transitions drop
from 1024 to ~16 per walk, reducing how often the purge loop is
interrupted.

The cond_resched() provides a voluntary preemption point on
non-PREEMPT kernels. Functions called under a spinlock or from
non-sleepable contexts cannot yield; these use the outer
local_bh_disable()/local_bh_enable() conversion without
batadv_hash_bh_resched().

The five converted hash-walking functions are:

  batadv_tt_local_purge():
    Accepts a new @may_sleep parameter. From workqueue context
    (batadv_tt_purge), may_sleep=true allows periodic yielding.
    From batadv_tt_local_resize_to_mtu(), may_sleep=false because
    the caller holds tt.commit_lock.

  batadv_tt_global_del_orig():
    Called from multiple contexts including under spinlocks
    (batadv_purge_orig_ref). Cannot yield. Converts to outer
    local_bh_disable()/local_bh_enable() with inner spin_lock()/
    spin_unlock() but does not use batadv_hash_bh_resched().

  batadv_tt_global_purge():
    Called from workqueue context; yields every 64 buckets.

  batadv_tt_local_transition_new():
  batadv_tt_local_purge_pending_clients():
    Called under tt.commit_lock. Convert to outer local_bh_disable()/
    local_bh_enable() with inner spin_lock()/spin_unlock() but do
    not use batadv_hash_bh_resched().

On PREEMPT_RT, local_bh_disable() maps to migrate_disable() and
softirqs run in dedicated kthreads, so the batching has no effect
on softirq latency but the reduced BH transition overhead still
applies.

Reported-by: syzbot+61b202fdc410840f0198@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=61b202fdc410840f0198
Signed-off-by: Ömer Mete Kaya <omermetekaya0@gmail.com>
---
Changes in v3:
  - Remove batadv_hash_bh_resched() from batadv_tt_global_del_orig():
    called under spinlocks (e.g. batadv_purge_orig_ref).
    Convert to outer local_bh_disable()/local_bh_enable() with
    inner spin_lock()/spin_unlock() only, like the commit_lock paths.
  - Fix reverse christmas tree ordering in batadv_tt_global_purge()
  - Fix Closes: URL (remove backslash escaping)

 net/batman-adv/hash.h              | 30 +++++++++++++++++++
 net/batman-adv/translation-table.c | 48 ++++++++++++++++++++++--------
 2 files changed, 65 insertions(+), 13 deletions(-)

diff --git a/net/batman-adv/hash.h b/net/batman-adv/hash.h
index 5d9a5ab..cf3ef70 100644
--- a/net/batman-adv/hash.h
+++ b/net/batman-adv/hash.h
@@ -10,10 +10,12 @@
 #include "main.h"

 #include <linux/atomic.h>
+#include <linux/bottom_half.h>
 #include <linux/compiler.h>
 #include <linux/list.h>
 #include <linux/lockdep.h>
 #include <linux/rculist.h>
+#include <linux/sched.h>
 #include <linux/spinlock.h>
 #include <linux/stddef.h>
 #include <linux/types.h>
@@ -167,4 +169,32 @@ static inline void *batadv_hash_remove(struct batadv_hashtable *hash,
 	return data_save;
 }

+/* work which can be done in a hash walk before BH gets re-enabled */
+#define BATADV_HASH_BH_BUDGET 64
+
+/**
+ * batadv_hash_bh_resched() - re-enable BH after the work budget is used up
+ * @buckets_done: buckets processed since BH was disabled, reset when BH is
+ *  re-enabled
+ *
+ * A walk over all buckets of a hash disables BH only once instead of
+ * re-enabling it after each bucket. Otherwise, pending softirqs would be
+ * processed inline after each bucket. When @buckets_done reached
+ * BATADV_HASH_BH_BUDGET, BH is re-enabled to run the pending softirqs and to
+ * give other tasks a chance to run.
+ *
+ * Must be called with BH disabled, without any spinlock held and from a
+ * context which is allowed to sleep.
+ */
+static inline void batadv_hash_bh_resched(u32 *buckets_done)
+{
+	if (*buckets_done < BATADV_HASH_BH_BUDGET)
+		return;
+
+	local_bh_enable();
+	cond_resched();
+	local_bh_disable();
+	*buckets_done = 0;
+}
+
 #endif /* _NET_BATMAN_ADV_HASH_H_ */
diff --git a/net/batman-adv/translation-table.c b/net/batman-adv/translation-table.c
index b9407ad..ebeb486 100644
--- a/net/batman-adv/translation-table.c
+++ b/net/batman-adv/translation-table.c
@@ -36,6 +36,7 @@
 #include <linux/overflow.h>
 #include <linux/rculist.h>
 #include <linux/rcupdate.h>
+#include <linux/sched.h>
 #include <linux/skbuff.h>
 #include <linux/slab.h>
 #include <linux/spinlock.h>
@@ -1892,23 +1893,32 @@ static void batadv_tt_local_purge_list(struct batadv_priv *bat_priv,
  * @bat_priv: the bat priv with all the mesh interface information
  * @timeout: parameter deciding whether a given tt local entry is considered
  *  inactive or not
+ * @may_sleep: if true, periodically re-enable softirqs and yield the CPU.
+ *  Must be false when called with spinlocks held.
  */
 static void batadv_tt_local_purge(struct batadv_priv *bat_priv,
-				  int timeout)
+				  int timeout, bool may_sleep)
 {
 	spinlock_t *list_lock; /* protects write access to the hash lists */
 	struct batadv_hashtable *hash = bat_priv->tt.local_hash;
 	struct hlist_head *head;
+	u32 buckets_done = 0;
 	u32 i;

+	local_bh_disable();
 	for (i = 0; i < hash->size; i++) {
 		head = &hash->table[i];
 		list_lock = &hash->list_locks[i];

-		spin_lock_bh(list_lock);
+		spin_lock(list_lock);
 		batadv_tt_local_purge_list(bat_priv, head, timeout);
-		spin_unlock_bh(list_lock);
+		spin_unlock(list_lock);
+		buckets_done++;
+
+		if (may_sleep)
+			batadv_hash_bh_resched(&buckets_done);
 	}
+	local_bh_enable();
 }

 /**
@@ -2887,11 +2897,12 @@ void batadv_tt_global_del_orig(struct batadv_priv *bat_priv,
 	if (!hash)
 		return;

+	local_bh_disable();
 	for (i = 0; i < hash->size; i++) {
 		head = &hash->table[i];
 		list_lock = &hash->list_locks[i];

-		spin_lock_bh(list_lock);
+		spin_lock(list_lock);
 		hlist_for_each_entry_safe(tt_common_entry, safe,
 					  head, hash_entry) {
 			/* remove only matching entries */
@@ -2916,8 +2927,9 @@ void batadv_tt_global_del_orig(struct batadv_priv *bat_priv,
 				batadv_tt_global_entry_put(tt_global);
 			}
 		}
-		spin_unlock_bh(list_lock);
+		spin_unlock(list_lock);
 	}
+	local_bh_enable();
 	clear_bit(BATADV_ORIG_CAPA_HAS_TT, &orig_node->capa_initialized);
 }

@@ -2969,14 +2981,16 @@ static void batadv_tt_global_purge(struct batadv_priv *bat_priv)
 	struct batadv_tt_global_entry *tt_global;
 	struct hlist_node *node_tmp;
 	struct hlist_head *head;
+	u32 buckets_done = 0;
 	char *msg = NULL;
 	u32 i;

+	local_bh_disable();
 	for (i = 0; i < hash->size; i++) {
 		head = &hash->table[i];
 		list_lock = &hash->list_locks[i];

-		spin_lock_bh(list_lock);
+		spin_lock(list_lock);
 		hlist_for_each_entry_safe(tt_common, node_tmp, head,
 					  hash_entry) {
 			tt_global = container_of(tt_common,
@@ -2996,8 +3010,12 @@ static void batadv_tt_global_purge(struct batadv_priv *bat_priv)

 			batadv_tt_global_entry_put(tt_global);
 		}
-		spin_unlock_bh(list_lock);
+		spin_unlock(list_lock);
+		buckets_done++;
+
+		batadv_hash_bh_resched(&buckets_done);
 	}
+	local_bh_enable();
 }

 /**
@@ -4402,7 +4420,7 @@ static void batadv_tt_purge(struct work_struct *work)
 	priv_tt = container_of(delayed_work, struct batadv_priv_tt, work);
 	bat_priv = container_of(priv_tt, struct batadv_priv, tt);

-	batadv_tt_local_purge(bat_priv, BATADV_TT_LOCAL_TIMEOUT);
+	batadv_tt_local_purge(bat_priv, BATADV_TT_LOCAL_TIMEOUT, true);
 	batadv_tt_global_purge(bat_priv);
 	batadv_tt_req_purge(bat_priv);
 	batadv_tt_roam_purge(bat_priv);
@@ -4449,11 +4467,12 @@ static void batadv_tt_local_transition_new(struct batadv_priv *bat_priv)
 	if (!hash)
 		return;

+	local_bh_disable();
 	for (i = 0; i < hash->size; i++) {
 		head = &hash->table[i];
 		list_lock = &hash->list_locks[i];

-		spin_lock_bh(list_lock);
+		spin_lock(list_lock);
 		hlist_for_each_entry(tt_common_entry, head, hash_entry) {
 			bool cont = false;

@@ -4472,8 +4491,9 @@ static void batadv_tt_local_transition_new(struct batadv_priv *bat_priv)
 			batadv_tt_local_size_inc(bat_priv,
 						 tt_common_entry->key.vid);
 		}
-		spin_unlock_bh(list_lock);
+		spin_unlock(list_lock);
 	}
+	local_bh_enable();
 }

 /**
@@ -4497,11 +4517,12 @@ static void batadv_tt_local_purge_pending_clients(struct batadv_priv *bat_priv)
 	if (!hash)
 		return;

+	local_bh_disable();
 	for (i = 0; i < hash->size; i++) {
 		head = &hash->table[i];
 		list_lock = &hash->list_locks[i];

-		spin_lock_bh(list_lock);
+		spin_lock(list_lock);
 		hlist_for_each_entry_safe(tt_common, node_tmp, head,
 					  hash_entry) {
 			bool cont = false;
@@ -4536,8 +4557,9 @@ static void batadv_tt_local_purge_pending_clients(struct batadv_priv *bat_priv)

 			batadv_tt_local_entry_put(tt_local);
 		}
-		spin_unlock_bh(list_lock);
+		spin_unlock(list_lock);
 	}
+	local_bh_enable();
 }

 /**
@@ -4839,7 +4861,7 @@ void batadv_tt_local_resize_to_mtu(struct net_device *mesh_iface)
 		if (size_max >= table_size)
 			break;

-		batadv_tt_local_purge(bat_priv, timeout);
+		batadv_tt_local_purge(bat_priv, timeout, false);
 		batadv_tt_local_purge_pending_clients(bat_priv);

 		timeout /= 2;
--
2.56.0

