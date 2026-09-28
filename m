Received: from mail-dy2-f43.google.com (mail-dy2-f43.google.com [74.125.229.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82B4D4CDA27
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 13:34:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790602444; cv=none; b=egNDl8nzZarbGV709mB8puPj3rOZMIb+jV2ebcHVCcpTDnFi/HVzoyrxXngUKVNu5B2deKevGnW7oQK02khnuNdWTYhuojbypn4AiX8O/Y4CfOToddcLw3iEsrGXqjODJM/jPl4ZN33LUsMM7A+5I8rIEKFwQgt+V4udfmvBLvM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790602444; c=relaxed/simple;
	bh=U0tDZoC4k08uW3oumYEg8H04tsX+8Kc7CtPw4IeX8Hk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=OsH7umM/ycwln2x+5KZ1XTjn/PsAeiDUmjq6Ql0Tj104C2wk7XEPQwmo9EECIz9L2Pzgg+TuTH9Y9wbHZz4gcV1mQQH0/E3SbMrcML9pxUqN3WAlLPTyhtGldN/a62S/kmp4tnNmuzY28hVTVcwWrEK/q7yAUDWGmHEea8ub4S4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BkF95KFp; arc=none smtp.client-ip=74.125.229.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BkF95KFp"
Received: by mail-dy2-f43.google.com with SMTP id 5a478bee46e88-33e46a15703so2833144eec.0
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 06:34:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790602441; x=1791207241; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=04zF2FI3ks9ijzxTon/jOlW/MRpUNEFnXuYcdiYKF2c=;
        b=BkF95KFpy6I+WyEBG7O18T1RsB+BmIqk/s6Qt+BDKkA8tcXYGkKgVHXa0/etA7Lr1K
         6/kL/iN2SvFWCrYFIry7XY1vHKMlwuI02FWl2F3fYdHx3p1qZ/pBG1wg88p5+BJT99ub
         p3AdaXvxTKzC4lC9+ek/9PmdUB6IKtlXUDDdMVmmWdvIyRMt6vO+o4pqF6WrjV0OgYvs
         rV0AgBm70IRn0EaG9KaEqcVYsaZeY37bhhDWjht9vva1GsBx3qkAmcCo1x5jpOvlmgid
         TvTbP8dzvEkTW5e1s4GuspBLXd/WgZsgbTCSTCzEr4NYEOmA26oE2QUSeEDB8oOjtOtz
         ydKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790602441; x=1791207241;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=04zF2FI3ks9ijzxTon/jOlW/MRpUNEFnXuYcdiYKF2c=;
        b=SWMatkMo8BgP3RBBuzm9T4zOvVFCuCqrKRe0FkEe4AAsAI2ebtYF0odaPKp4TGnl/h
         LRhktoInYjd2ecWoOBMsy5BUkMVS9q2hm/mrGXZdyls/6HAY1+69Pj7KRQbX1FX0g5w+
         7OcDU0E0QCvwYozl40X+QsiookHfqvvefAtdS2G4Rfm7tM0OW3yN9LtQp28STWGuFjTM
         K6gdBF4ppTERotiI2MvyFNE/LitfhYuVdUzs5sTaSQVQLDvJgtIBZ02ynyyEuBsGSMqH
         EV5emnC55yneGCVAlMNjle29PLNA9cED2HdDI8GCbcwQjfjr3HnBV+oLRPl01Ns3ETFc
         yFCg==
X-Forwarded-Encrypted: i=1; AKwUvByi7nxmqyYolITnhX45xtB39Lr2Tkev/7W9VxrbHcLocuft6He9oSIw7TGmIDp9yNSBIhCgfkQo1mXy7xw=@vger.kernel.org
X-Gm-Message-State: AFuF++nyY+Y2YKo4f7r9oodC3Eu7wVwKnCXyRWce/Jr9Of58uwsb3ll7
	fz05aHhS3Y2fr8wE2nl5fNkvkgSnAXUjbnx6J1D2onidbMEuSRVUjR1xBZIWwnkt
X-Gm-Gg: AYBFou1Ty+NKKlrkk/KsLCa03cIpdtm5aRX6iwRy7BvMXKwGi7cNEqzB+GzDobLKRAu
	f//SDSnpKvOb3QMZrToU0QuwZyg/u6SNoJFE0kY8chHa2zvxhJbRRLp2oNKz8BrVnwDU1fT4bBr
	UbmImo4/rJk5FVAXwg+5jwYwLZrHQJuvKqZevdc9haV18+ZWI2Ju6gukiqh1OHqzxLJnSBKvdaf
	9Q27lL0Kv6kS5DmiyMFbvO4nEJkeWjWYP+Fn54tbgvsi8WEaWtXHtZ2WR/CJyAMo1eGNLB3GZBz
	xQEsbuGHlAAI3KfKOpezeleQ375am7I570rK7ebWm8zyk0iyeVHF651R1LsrZfdVVDtel75HpaI
	TCgPqAyrN/BiM1VXPvQpqoKpo3Z5rH0d64+hDiaFBf+1o/F+IbH9zLVP9z7ieJ/vkDC98eRu1DV
	h57yw3KzJc+tnIc8T0LShJ6M8+fZpoWb68yfeoyxh4Y+1eRCT7ytUFTVS6J4ojXIs1dtM=
X-Received: by 2002:a05:7300:e11c:b0:339:85bf:dd89 with SMTP id 5a478bee46e88-34272b3c01emr10981938eec.35.1790602441175;
        Mon, 28 Sep 2026 06:34:01 -0700 (PDT)
Received: from [127.0.1.1] ([23.254.208.9])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-34144f4eb9esm28278959eec.19.2026.09.28.06.33.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 06:34:00 -0700 (PDT)
From: Qiliang Yuan <odys.yuan@gmail.com>
Date: Mon, 28 Sep 2026 21:33:55 +0800
Subject: [PATCH v2] jbd2: fix shrinker scan budget accounting in
 jbd2_journal_shrink_scan()
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260928-fix-jbd2-shrink-scan-nr-scanned-v2-1-7e1efec3afdf@gmail.com>
X-B4-Tracking: v=1; b=H4sIAMJsumoC/42NQQ7CIBBFr9LM2jGAhhRX3sN0UWHajlowYIim4
 e4iJ3D1837y398gUWRKcOo2iJQ5cfAV1K4Du4x+JmRXGZRQWhjV48RvvF2dwrRE9ndMdvToY0t
 PDu1BmN46IyQpqJZnpDppD5eh8sLpFeKnHWb5a/93Z4kSSU9HITVZbcx5Xkd+7G1YYSilfAFjn
 sKlzgAAAA==
To: Theodore Ts'o <tytso@mit.edu>, Jan Kara <jack@suse.com>
Cc: linux-ext4@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Qiliang Yuan <odys.yuan@gmail.com>
X-Mailer: b4 0.13.0

jbd2_journal_shrink_scan() never updates sc->nr_scanned, so
do_shrink_slab() always assumes a full batch was examined and keeps
calling scan_objects() until the one-shot budget derived from the
(possibly stale) percpu checkpoint count is drained, even when the
checkpoint list has nothing left to offer.

journal_shrink_one_cp_list() also conflates buffers examined with
buffers freed: it walks every journal_head in a transaction's list,
including ones skipped as busy, but only counts the ones it frees.

Add an nr_scanned output parameter to journal_shrink_one_cp_list()
that counts every journal_head examined, and use it to decrement the
scan budget in jbd2_journal_shrink_checkpoint_list() instead of the
freed count. Derive sc->nr_scanned from that examined count in
jbd2_journal_shrink_scan().

Trigger SHRINK_STOP on nr_shrunk == 0 (nothing freed) rather than
sc->nr_scanned == 0 (nothing examined): a checkpoint list full of
busy buffers can honestly report a full batch scanned while freeing
nothing, and retrying immediately will not speed up in-flight
writeback.

Tested by creating 20000 small files without an explicit sync and
dropping caches, tracing jbd2_shrink_*:

              scan_objects() calls   calls with nr_shrunk == 0
  before             168                    168 (100%)
  after                7                      6 (86%)

Signed-off-by: Qiliang Yuan <odys.yuan@gmail.com>
---
V1 -> V2:
- Count examined buffers, not just freed ones, in
  journal_shrink_one_cp_list() (Sashiko AI review finding).
- Trigger SHRINK_STOP on nr_shrunk == 0 instead of
  sc->nr_scanned == 0.

v1: https://lore.kernel.org/r/20260928-fix-jbd2-shrink-scan-nr-scanned-v1-1-e6f4016ec699@gmail.com
---
 fs/jbd2/checkpoint.c | 23 +++++++++++++++++------
 fs/jbd2/journal.c    | 17 +++++++++++++++++
 2 files changed, 34 insertions(+), 6 deletions(-)

diff --git a/fs/jbd2/checkpoint.c b/fs/jbd2/checkpoint.c
index 1508e2f544621..3569e32500b7c 100644
--- a/fs/jbd2/checkpoint.c
+++ b/fs/jbd2/checkpoint.c
@@ -361,27 +361,35 @@ int jbd2_cleanup_journal_tail(journal_t *journal)
  * Find all the written-back checkpoint buffers in the given list
  * and try to release them. If the whole transaction is released, set
  * the 'released' parameter. Return the number of released checkpointed
- * buffers.
+ * buffers. Store the number of buffers this function actually looked
+ * at, whether or not they were released, in '*nr_scanned' (a busy
+ * buffer skipped via JBD2_SHRINK_BUSY_SKIP still counts here, since
+ * walking it is real work, unlike the freed count).
  *
  * Called with j_list_lock held.
  */
 static unsigned long journal_shrink_one_cp_list(struct journal_head *jh,
 						enum jbd2_shrink_type type,
+						unsigned long *nr_scanned,
 						bool *released)
 {
 	struct journal_head *last_jh;
 	struct journal_head *next_jh = jh;
 	unsigned long nr_freed = 0;
+	unsigned long nr_examined = 0;
 	int ret;
 
 	*released = false;
-	if (!jh)
+	if (!jh) {
+		*nr_scanned = 0;
 		return 0;
+	}
 
 	last_jh = jh->b_cpprev;
 	do {
 		jh = next_jh;
 		next_jh = jh->b_cpnext;
+		nr_examined++;
 
 		if (type == JBD2_SHRINK_DESTROY) {
 			ret = __jbd2_journal_remove_checkpoint(jh);
@@ -404,6 +412,7 @@ static unsigned long journal_shrink_one_cp_list(struct journal_head *jh,
 			break;
 	} while (jh != last_jh);
 
+	*nr_scanned = nr_examined;
 	return nr_freed;
 }
 
@@ -424,7 +433,7 @@ unsigned long jbd2_journal_shrink_checkpoint_list(journal_t *journal,
 	tid_t first_tid = 0, last_tid = 0, next_tid = 0;
 	tid_t tid = 0;
 	unsigned long nr_freed = 0;
-	unsigned long freed;
+	unsigned long freed, scanned;
 	bool first_set = false;
 
 again:
@@ -458,9 +467,10 @@ unsigned long jbd2_journal_shrink_checkpoint_list(journal_t *journal,
 		tid = transaction->t_tid;
 
 		freed = journal_shrink_one_cp_list(transaction->t_checkpoint_list,
-						   JBD2_SHRINK_BUSY_SKIP, &released);
+						   JBD2_SHRINK_BUSY_SKIP, &scanned,
+						   &released);
 		nr_freed += freed;
-		(*nr_to_scan) -= min(*nr_to_scan, freed);
+		(*nr_to_scan) -= min(*nr_to_scan, scanned);
 		if (*nr_to_scan == 0)
 			break;
 		if (need_resched() || spin_needbreak(&journal->j_list_lock))
@@ -502,6 +512,7 @@ void __jbd2_journal_clean_checkpoint_list(journal_t *journal,
 					  enum jbd2_shrink_type type)
 {
 	transaction_t *transaction, *last_transaction, *next_transaction;
+	unsigned long __always_unused scanned;
 	bool released;
 
 	WARN_ON_ONCE(type == JBD2_SHRINK_BUSY_SKIP);
@@ -516,7 +527,7 @@ void __jbd2_journal_clean_checkpoint_list(journal_t *journal,
 		transaction = next_transaction;
 		next_transaction = transaction->t_cpnext;
 		journal_shrink_one_cp_list(transaction->t_checkpoint_list,
-					   type, &released);
+					   type, &scanned, &released);
 		/*
 		 * This function only frees up some memory if possible so we
 		 * dont have an obligation to finish processing. Bail out if
diff --git a/fs/jbd2/journal.c b/fs/jbd2/journal.c
index 09efa337649e2..e35d488cbfd23 100644
--- a/fs/jbd2/journal.c
+++ b/fs/jbd2/journal.c
@@ -1262,10 +1262,27 @@ static unsigned long jbd2_journal_shrink_scan(struct shrinker *shrink,
 	trace_jbd2_shrink_scan_enter(journal, sc->nr_to_scan, count);
 
 	nr_shrunk = jbd2_journal_shrink_checkpoint_list(journal, &nr_to_scan);
+	sc->nr_scanned = sc->nr_to_scan - nr_to_scan;
 
 	count = percpu_counter_read_positive(&journal->j_checkpoint_jh_count);
 	trace_jbd2_shrink_scan_exit(journal, nr_to_scan, nr_shrunk, count);
 
+	/*
+	 * Give up on this reclaim pass if this call didn't manage to free
+	 * anything. This is deliberately based on nr_shrunk, not on
+	 * sc->nr_scanned: a checkpoint list can be full of buffers that are
+	 * still busy being written back, in which case a call can
+	 * legitimately scan (and correctly report through sc->nr_scanned)
+	 * a full batch of them without freeing a single one. Retrying
+	 * immediately within the same synchronous reclaim pass is not going
+	 * to let any of that in-flight writeback complete any sooner, so
+	 * there is nothing to gain from letting do_shrink_slab() keep
+	 * calling us against the same stale freeable count until its
+	 * one-shot scan budget for this priority level is exhausted.
+	 */
+	if (nr_shrunk == 0)
+		return SHRINK_STOP;
+
 	return nr_shrunk;
 }
 

---
base-commit: 502d801f0ab03e4f32f9a33d203154ce84887921
change-id: 20260928-fix-jbd2-shrink-scan-nr-scanned-c3098cd901e2

Best regards,
-- 
Qiliang Yuan <odys.yuan@gmail.com>

