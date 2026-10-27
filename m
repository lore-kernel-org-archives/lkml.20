Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793096099;
	b=JNZKECNUSfhWum0nitwiDyMpehhiEvs7URZNm9PjfHx71eHQQ9AyHhkhXggFl5qzl6dt
	 RqJFNVHa40FiVu3F9PYVV6/Z807+i3z72v1c/qN7Nlql1ArEtT/BMI08PUFWWz085Kq4a
	 LdIo92lsDJjtfbyhsvhq/GF5g1EFHNAUPKlQOsGCiBB+7Pi7UUD+DsW8eMRgMFFB3bGxh
	 9lgaBJNr7ONd+aN19jqNDUWXLOXGAE4Lvr3bfV1YjP9QzTCyPgX9P4lwZCjOu0oltYTl3
	 1dpikrqeiM3BvQyBiwrk/BliAbxBrOXQryJDvIkxTN6tUbhklamJywgEahRdpggcW4w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793096099;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=kXnEM/aIQaVbmZP7KIZddh/r+yaXnXz850o6sIwpdkQ=;
	b=bnRIxn1PGmlfKrNrUrxDbL/vHAxxkyhCgNTaD7IEq/4ko9NXr73RuW8nGKqQNXtYNuqq
	 SKeCvzbRWW7kUVnQmqZdZzJL7BWNxEjf6dA4LAyKASIMRNW7YJ3cZqko90LrPIhSoAu/o
	 kGmrKEWAkVLJCxN9F4m5bVrf8Jxvpog4BmZc97gciaMku+hVmiImRGq4x9uPaRvfyhcMx
	 KzN59zc6fNY6m4JfJXhrMXTFM+f3o7GaN4UHa3Mh5+W3clG0hOcYGlVDuqIaXcfSWIRiY
	 c/zsVCERV83D+7wcNa0hFi3O+lTnscrhwJQoiP/LldhHeLaKKZpVX+qxy+EdIGjh/yQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=DJ4JD5oP;
	arc=none smtp.remote-ip=209.85.216.45
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5E80606A321
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 10:14:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C5E80606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=DJ4JD5oP
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-3adf5f6833cso1761371a91.0
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 03:14:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793096098; x=1793700898; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=kXnEM/aIQaVbmZP7KIZddh/r+yaXnXz850o6sIwpdkQ=;
        b=DJ4JD5oPh4znSBd5MjH0yzKd9gZovBRDtmMqJCWZvSOefnbAZfhLhhNHc5gd0SmNG9
         1rbBOqy8Fa3j2AadB2ypYyAARvg22x17Fj28rsbfO7bKc3HbXh5Xb5xnYp4/5C8dUYD1
         4zNaypqM6Cdb3DVInc7lzDt4YnfziCx01A5mso4wyDXYiNRjy1G07I0gCNEz9zC4qh1z
         aZeZcPR/P6iiIg/CgPDcgVLxg1Zh3NhoImzJPHoZ8ZuedH0WLpHHZXHcJdiW4rYWBEPZ
         0MdWU1bKeb80IPFNPrlymToLeHzbqp+yrNd8Jn4+HvpHcMi9jMhJVekxg/ZdwoHxZegV
         WmMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793096098; x=1793700898;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kXnEM/aIQaVbmZP7KIZddh/r+yaXnXz850o6sIwpdkQ=;
        b=tjSK6jczvbm2oisUT7jmv/OORSw034ypqsbFnSlmsl9ihxipLaLqUO9IUGcb+Y/jCq
         m/o1ThpWLN3WSw+fcUz5MB02WbxCtMIv05VNspzZttGeXsNYKN2sU5fqyL9O1XSN7xey
         0VSHlQotmz9t3F3kB+w0qgXgkF4vENKAh4/kAr3peSzMC+Cr4NZH+CDwBlsa8BnseRIT
         jImiPToG7AMwZ/Th5h2+6QubHdHMBfkRy0E+aPv8hRc6nkUwcxlNLs+WzgFVzHvE1f6r
         xzX18mebJfY0+k4OvGwx+1NNaVhgODxEOTSgVx/HH/BjfDXjDAYdD91TCNzWx2he6MwC
         +PMw==
X-Forwarded-Encrypted: i=1; AKwUvBy8o/Gx0kbT5LpewCxQTCpFYGRw3iQjBgxLismrCUgHYZiBbMejADy7tGaxuIqSavDQb+W0JSTbWH2d9fk=@vger.kernel.org
X-Gm-Message-State: AFq9FYJuvD2a4TsI7rnT4sl1kNqHKburYnr6pnQTYFtmfnbbuWueI5O0
	4oHyPFDO/8aPk4IGH8wgvN44+EkuM49u4Zuh80o/kJtxKGdQQc6SEDxA
X-Gm-Gg: AYBFou2Ni6TVvJGcyk12YDp1OqyakdjRbPa/JXBBIPdhzduHFG9BJiaiNfQZ2QkWiZK
	szNXXnQBX8pr/6sgeh1ctlKfH/TGDqeQvDNQALsWSYJ5FKvMwGPjxgdYahBfDl6j/u3YYxCFRxs
	6zOVHfXrTxILHBzX6IzXXHWFdhVGVZvBXt7hB1ZFCQGLi6ocEh73tgMWQ1lU7xRqMfwcE+wwl1q
	i2+2EmWpImZ7xyLK5aHDoFYEcVUwO+Bb0bfPxuMAeNOUbYLmF1mXQcf2e1cbbBe4zqxP11H9k+o
	73KiEyEUtGDjdu84wdX9UzgrYx57Q/yGc5+3UukvWjiBK0Um5+ssO+QBcm0phXnMmsqY2Ou8Ng9
	dYjQXvNogSzLZWx+ox0btYxoE167I3yeN5cNVwf+K2Buoaiki/+3LKd1IN5AGHPE8m3ZHgnvoKE
	aH2c/M+joVVAf9u5iydeU7d1WOZq+G+2H7gHQ2FENs2nUgdsNaHB/vqo2lQwnFQJ6NB2TzLLIOi
	UKyvzB9WFZr+3/Y6X4YxHfbPn4A0XEZ5ln2YxW9GBSSiXxr0Tg=
X-Received: by 2002:a17:90b:2e8c:b0:3ac:8897:7b9f with SMTP id 98e67ed59e1d1-3adeae77a16mr7444135a91.43.1793096097910;
        Tue, 27 Oct 2026 03:14:57 -0700 (PDT)
Received: from localhost ([111.228.63.84])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae404274b2sm3188284a91.5.2026.10.27.03.14.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 03:14:57 -0700 (PDT)
From: Cen Zhang <zzzccc427@gmail.com>
To: mark@fasheh.com,
	jlbec@evilplan.org,
	joseph.qi@linux.alibaba.com
Cc: heming.zhao@suse.com,
	ocfs2-devel@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	baijiaju1990@gmail.com,
	jjzuming@gmail.com,
	zzzccc427@gmail.com
Subject: [PATCH v4] ocfs2/dlm: serialize migration MLE cleanup on failure
Date: Tue, 27 Oct 2026 18:14:49 +0800
Message-Id: <pm-ocfs2-objects-candidate-0038-v9-659f247ea980d5f3fbeb@gmail.com>
X-Mailer: git-send-email 2.34.1
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

A migration MLE has a base reference for the mastering answer and an
in-use reference held by dlm_migrate_lockres(). The finishing assertion
consumes the base reference, but migration failure drops it again
without checking whether the assertion already consumed it.

The target queues its migration worker before it acknowledges the
ALL_DONE packet, so its finishing assertion can be handled while the
sender still waits for the status. If the connection fails before the
status arrives, dlm_send_one_lockres() returns an error for a migration
that the target has already completed:

  Old-master sender                  Finishing assertion
  -----------------                  -------------------
  publish MLE; take in-use reference
  send ALL_DONE; wait for status
                                     take lookup reference
                                     unlink MLE
                                     put lookup and base references
  send returns a connection error
  put base reference again; free MLE
  put in-use reference; access freed MLE

dlm_assert_master_handler() holds dlm->spinlock from the MLE lookup to
the final puts, and it takes dlm->master_lock around the unlink and the
puts. Decide under the same locks: if the MLE is already unhashed, the
assertion consumed the base reference, so drop only the sender's in-use
reference. Otherwise unlink it before consuming the base reference so a
later assertion no longer finds it.

An assertion that got there first has also made the target the owner
and cleared DLM_LOCK_RES_MIGRATING. Treating the attempt as failed at
that point would leave the lockres owned by the target while this node
still holds the other nodes' locks and refmap bits, so it could neither
be purged nor migrated again. Finish our side as a completed migration
does instead: drop those locks under res->spinlock if the target still
owns the lockres, and recalculate its usage.

Use the same cleanup for the pre-send failure, the send failure and the
target-death failure paths. The sender's in-use reference keeps the MLE
alive until its final put outside the nested locks. Successful
migration retains its existing in-use-only put.

A target that has died cannot assert after the sender has seen its
death. The o2net node-down callback runs before the DLM one; it
disconnects the node and flushes the workqueue that runs the message
handlers, so an assertion already received has been handled by the time
the DLM removes the node from the domain map. A node that leaves the
domain cleanly sends its exit message only after its assertions have
been answered.

Two windows of the hand-over itself are left as they are: the handler
switches the owner and the sender drops the other nodes' locks moments
later, and an assertion from a live target that arrives after the
sender has given up still meets the owner check in the handler. Waiting
for the target before giving up would only stretch the first window
into the time in which recovery of the target can observe it.

KASAN report, only the relevant frames are kept:

BUG: KASAN: slab-use-after-free in dlm_put_mle_inuse+0xce/0xe0
Read of size 8 at addr ffff8881190e3c20 by task umount/593

Call Trace:
 <TASK>
 dlm_put_mle_inuse+0xce/0xe0
 dlm_migrate_lockres+0x16af/0x20d0
 dlm_empty_lockres+0x60a/0xbd0
 dlm_unregister_domain+0x53b/0x11d0
 o2cb_cluster_disconnect+0xa5/0x110
 ocfs2_cluster_disconnect+0x73/0xc0
 ocfs2_dlm_shutdown+0x311/0x440
 ocfs2_dismount_volume+0x696/0x940
 generic_shutdown_super+0x15f/0x490
 kill_block_super+0x40/0xa0
 deactivate_locked_super+0xae/0x120
 deactivate_super+0xa2/0xc0
 cleanup_mnt+0x217/0x450
 task_work_run+0x144/0x230
 </TASK>

Allocated by task 593:
 kmem_cache_alloc_noprof+0x20b/0x5c0
 dlm_migrate_lockres+0x20e/0x20d0
 dlm_empty_lockres+0x60a/0xbd0
 dlm_unregister_domain+0x53b/0x11d0
 o2cb_cluster_disconnect+0xa5/0x110
 ocfs2_cluster_disconnect+0x73/0xc0
 ocfs2_dlm_shutdown+0x311/0x440
 ocfs2_dismount_volume+0x696/0x940

Freed by task 593:
 kmem_cache_free+0x242/0x580
 __dlm_put_mle+0x4b2/0x660
 dlm_migrate_lockres+0x1690/0x20d0
 dlm_empty_lockres+0x60a/0xbd0
 dlm_unregister_domain+0x53b/0x11d0
 o2cb_cluster_disconnect+0xa5/0x110
 ocfs2_cluster_disconnect+0x73/0xc0
 ocfs2_dlm_shutdown+0x311/0x440

The buggy address belongs to the object at ffff8881190e3c00
 which belongs to the cache o2dlm_mle of size 480
The buggy address is located 32 bytes inside of
 freed 480-byte region [ffff8881190e3c00, ffff8881190e3de0)

Fixes: 6714d8e86bf4 ("[PATCH] OCFS2: The Second Oracle Cluster Filesystem")
Cc: stable@vger.kernel.org
Assisted-by: LLM
Signed-off-by: Cen Zhang <zzzccc427@gmail.com>
---
Changes in v4:
- Drop the v3 hand-over in dlm_assert_master_handler(): removing the other
  nodes' locks there races with dlm_send_one_lockres() still walking the
  lock lists when the last message was sent from inside the loop. The sender
  drops the locks as before, right away when the assertion got there first
  (Sashiko review).
- Drop the v2 wait for the target's death before the MLE is dropped; it
  stretched the half handed-over window that recovery of the target can
  observe. The failure paths decide right away as before (Sashiko review).
- Drop the v3 domain map check on finishing assertions. The o2net node-down
  callback runs before the DLM one and flushes the message handlers, so an
  assertion from the target is always handled before the node leaves the
  domain map and the late assertion from a dead target asked about in the
  Sashiko review cannot occur.

Changes in v3:
- Hand the lockres over in one res->spinlock section:
  dlm_assert_master_handler() drops the other nodes' locks and refmap bits
  together with the owner switch, and the sender only does the same if the
  handler has not reached that point; the failed-but-asserted paths just
  recalculate usage. This removes the window in which recovery of the target
  saw a lockres it owned with other nodes' locks still attached (Sashiko
  review).
- Ignore a finishing assert from a node that is no longer in the domain map,
  so a late assert from a dead target cannot hand the lockres over after
  recovery has cleaned it up (Sashiko review).

Changes in v2:
- Complete the migration instead of failing it when the finishing assert has
  already switched the owner, so the lockres is not left owned by the target
  with the other nodes' locks still held here (Sashiko review).
- On a connection error from the send, wait for the target's death before
  the MLE is dropped, so a late assert finds the MLE instead of hitting the
  handler's check (Sashiko review).

Link to v1: https://lore.kernel.org/r/pm-ocfs2-objects-candidate-0038-v5-5e414ac0c701d2ccd4b3@gmail.com
Link to v2: https://lore.kernel.org/r/pm-ocfs2-objects-candidate-0038-v6-44416f9847751914bacc@gmail.com
Link to v3: https://lore.kernel.org/r/pm-ocfs2-objects-candidate-0038-v7-7a0bd8f07ba98784f6b7@gmail.com

 fs/ocfs2/dlm/dlmmaster.c | 70 ++++++++++++++++++++++++++++++++++------
 1 file changed, 61 insertions(+), 9 deletions(-)

diff --git a/fs/ocfs2/dlm/dlmmaster.c b/fs/ocfs2/dlm/dlmmaster.c
index 612969867ff9..ea48c013f7fb 100644
--- a/fs/ocfs2/dlm/dlmmaster.c
+++ b/fs/ocfs2/dlm/dlmmaster.c
@@ -2525,6 +2525,52 @@ static int dlm_is_lockres_migratable(struct dlm_ctxt *dlm,
  */
 
 
+/*
+ * Drop the sender's references on a migration MLE after the attempt has
+ * failed. The finishing assert from the target may already have unlinked
+ * the MLE and consumed its base reference; decide under the locks the
+ * assert handler holds, and only drop the base reference while the MLE is
+ * still hashed. Returns true when the assert got there first: the target
+ * has become the master, so the caller must complete the migration.
+ */
+static bool dlm_put_migration_mle(struct dlm_ctxt *dlm,
+				  struct dlm_master_list_entry *mle)
+{
+	bool asserted;
+
+	spin_lock(&dlm->spinlock);
+	spin_lock(&dlm->master_lock);
+	__dlm_mle_detach_hb_events(dlm, mle);
+	asserted = hlist_unhashed(&mle->master_hash_node);
+	if (!asserted) {
+		__dlm_unlink_mle(dlm, mle);
+		__dlm_put_mle(mle);
+	}
+	spin_unlock(&dlm->master_lock);
+	spin_unlock(&dlm->spinlock);
+
+	dlm_put_mle_inuse(mle);
+	return asserted;
+}
+
+/*
+ * The finishing assert got there first: it switched the owner to the
+ * target and cleared DLM_LOCK_RES_MIGRATING. Drop the other nodes' locks
+ * as a completed migration does, unless recovery has taken the lockres
+ * over since, and let the usage be recalculated.
+ */
+static void dlm_migrate_lockres_asserted(struct dlm_ctxt *dlm,
+					 struct dlm_lock_resource *res,
+					 u8 target)
+{
+	spin_lock(&res->spinlock);
+	if (res->owner == target)
+		dlm_remove_nonlocal_locks(dlm, res);
+	spin_unlock(&res->spinlock);
+
+	dlm_lockres_calc_usage(dlm, res);
+}
+
 static int dlm_migrate_lockres(struct dlm_ctxt *dlm,
 			       struct dlm_lock_resource *res, u8 target)
 {
@@ -2609,9 +2655,10 @@ static int dlm_migrate_lockres(struct dlm_ctxt *dlm,
 
 	if (ret < 0) {
 		if (mle_added) {
-			dlm_mle_detach_hb_events(dlm, mle);
-			dlm_put_mle(mle);
-			dlm_put_mle_inuse(mle);
+			if (dlm_put_migration_mle(dlm, mle)) {
+				dlm_migrate_lockres_asserted(dlm, res, target);
+				ret = 0;
+			}
 		} else if (mle) {
 			kmem_cache_free(dlm_mle_cache, mle);
 			mle = NULL;
@@ -2640,9 +2687,11 @@ static int dlm_migrate_lockres(struct dlm_ctxt *dlm,
 		mlog(0, "migration to node %u failed with %d\n",
 		     target, ret);
 		/* migration failed, detach and clean up mle */
-		dlm_mle_detach_hb_events(dlm, mle);
-		dlm_put_mle(mle);
-		dlm_put_mle_inuse(mle);
+		if (dlm_put_migration_mle(dlm, mle)) {
+			dlm_migrate_lockres_asserted(dlm, res, target);
+			ret = 0;
+			goto leave;
+		}
 		spin_lock(&res->spinlock);
 		res->state &= ~DLM_LOCK_RES_MIGRATING;
 		wake = 1;
@@ -2686,9 +2735,12 @@ static int dlm_migrate_lockres(struct dlm_ctxt *dlm,
 				     res->lockname.name, target);
 				ret = -EINVAL;
 				/* migration failed, detach and clean up mle */
-				dlm_mle_detach_hb_events(dlm, mle);
-				dlm_put_mle(mle);
-				dlm_put_mle_inuse(mle);
+				if (dlm_put_migration_mle(dlm, mle)) {
+					dlm_migrate_lockres_asserted(dlm, res,
+								     target);
+					ret = 0;
+					goto leave;
+				}
 				spin_lock(&res->spinlock);
 				res->state &= ~DLM_LOCK_RES_MIGRATING;
 				wake = 1;
