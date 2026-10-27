Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793081373;
	b=sV0WOMQKZEAXaEYb49wtQqReqoNANqEC11XZsaoCvDPKzo8/AkTUDFmR/QT7xfqFe7m6
	 zPVfxPuQAMtDzpQ2KZd1h58bFznVBB/Ky6aDkJGY6qKXoQU3EPred6UrTGlFXMa0Qgj02
	 NrEd6lNpNB/4+u4rxm09bA8bqfwSl9V41nGW4ZQsIFapkl87hB/5x6fppU00qG//NXe7x
	 S4AMhXvndr0Po0m6V2EZJ0mFdXZlM7RWyOyllYUw6CTNsUcA4ygSvZFwYODF5Sa2MNZkx
	 JccyvhdTb2IVmCTMtdkfqwM/x8P9FGwpyAVYnoxTdlp6+JCDGgX1n3IAntH2hWRXBKQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793081373;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=fB6Whtak24taZDZv6ZtTz72XfGauaIchm99YUmKfUiw=;
	b=mhbZt7oTBagd8p33igUHQvItiM2QYSsT1Mkok5yWAmp+CgTS59pXlTmIJvAJxkcWAJHG
	 aanFMjSpH9QlVe82WhQN8ZHAEhsmULBV6ZGVD9bqzDeBE6JNgGdCaJV38entAE3A+8Rs4
	 vlFdBkpTeXn+gPLanAeN1z8Xul0r9PIsefS2m/e2F7em9Hav8AgMwKUasIzU/C52Am3EG
	 XHJnu7YsB6erxNpLVrirRcDlQY7aDqYjtHUxUzLVNcxxx472wduUqjFkx9SnM3BGuleCs
	 TmGHVwomYLwX66PK3bJ1Z8t0L1ajzHPitAcD9HEKYnuURpLdQK6mRc0d+YytXHA/VDg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b="JiIbL/+a";
	arc=none smtp.remote-ip=209.85.216.46
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE23B606A31D
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 06:09:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BE23B606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=JiIbL/+a
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-3aded3c6103so1236553a91.0
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 23:09:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793081372; x=1793686172; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=fB6Whtak24taZDZv6ZtTz72XfGauaIchm99YUmKfUiw=;
        b=JiIbL/+arHNQTGQ9N7KClbrBKj0pG6pjrvIUesXD/l1dR3Dy4Mxakyojzy6jPFX5LY
         Nuysek6kceyz8PK1Vxw8leKH+Kb38H9yyHclIBvBzC1KKsFAdFAW0kv7W2teKVWuwb00
         8/0PgFxeRX9r3i5KIzcXnkexSflg1I+Mcljh/7rc/OQxz4u21JHW8ADMyWBilgUpTlYN
         UZbeB53gwu9Sino0pOl7paUJ9Vc8bpV7RiL6lPVDRRo17qulkrKAOxofcgw8rDV1Ry93
         j/6/syDapGnd51exiPXlW/Jt+tSged5MYWmQGi4aPjAXHEhlFujF/wNcTAceQbQmlyqK
         dFQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793081372; x=1793686172;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fB6Whtak24taZDZv6ZtTz72XfGauaIchm99YUmKfUiw=;
        b=q8sfEamPNJm9MgCMDsn3bTaRtrpDXQwswGW5PSm3DGvcb6FKzt7vhSRSMh4Yeys1Qi
         2l7EanH5+O1T7gH8Q+PSIr2AOvVwZXol8LE8tDYgn0DX8md0zq0NQzPmWFv6VMopCaJX
         bFs21MbiVTX6BpDB3xAJOIQKX7pOhtB0Yej69kLNMNndlHdCuFWiVE6F3lBGP6JsSRf4
         +SUNdsOvzqbyner3EEG4SbmlTjn8SWYFZZaGg0DmQnvH+wJM8SfeFbAVjkk8eC4TEYVS
         U/dDPekKu8vTqYRzRa2L7Cb6dvrr2+c1JsXakNXsmtL+l8UWfhyM/yp5fmbXiBlo2zql
         OnzA==
X-Forwarded-Encrypted: i=1; AKwUvBy1ADcMmLW22lmmJQ7LpoL2/eoG8ffqorCCMY1g5NYTBeB3cISqYw9JjjyKBQZ+XjRqdwLMYSP77bTaMoc=@vger.kernel.org
X-Gm-Message-State: AFq9FYLx6PG9y/SnWs/M6j/E3CMbwcWMOgzm/6cZ1GHonLmP/VdIUsik
	UNe3rItSdOc6UsNMPHprmPEXZZfpNZYllXLHfHHw3Jtv67tSnI+IXK6B
X-Gm-Gg: AYBFou3D+AvinPDOl34Zg85Bd6wL9tZdDs9S6U3IJ8SUg+sO9+mMSUVlCWzHHiTzYnC
	Wwvzp8aPwQgkg5uqZLRWFF9BQd6UvtHcbbIUmXgxnMpzc0YEDapqYfsY6eCTFO2bBT28xLfZyeS
	9IOvM8ZZq57xh4r3ImyBj6B6l0d02CtjbvYtTvZJR1vzG8QDd4B4/415zk5S8enbvKhEm5FWw/Y
	+gzo7Xyw6kD+6O3neCfafyx+/JDnLe6NeMofbVfVBvPmrvYrZ9icUBBa5s5wLdhwduELrATemMA
	RlsAAfomZLKzGz1OrdWDwp4n+X4jAws2xXnCWX9dpOpDcH00NYWG6UeSF26wWcai2+4s9fOYtVA
	YQVl5DiIRhnlq1hMeBwR7yaJNoZhkw0uY5xeUvTo4dIVYvlYDJP3gVA6oddX5jtM1m7ew7yrfql
	KhdtXUbU32J1MGJB5NtvjMI+8FfhWojHD3VuUG9jI3RLpb8R/uQRqik9ytxnty0rhNZvUowlhsM
	jotjs+AdT/a251phYUeYAOd9uxVSMOviTqQam4cWA6K7MjrS9WYJg9eJcOOJob/gL9aycAq3fqh
	nYitXg9W4c/l1XR2opcS478q6mL54SO+1UQoZe/lFI5Plg==
X-Received: by 2002:a17:90b:1d09:b0:3ac:8dfe:8ec9 with SMTP id 98e67ed59e1d1-3adeb0fbe41mr6633907a91.47.1793081371921;
        Mon, 26 Oct 2026 23:09:31 -0700 (PDT)
Received: from localhost ([111.228.63.84])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae4041fafcsm2798694a91.0.2026.10.26.23.09.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 23:09:31 -0700 (PDT)
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
Subject: [PATCH v3] ocfs2/dlm: serialize migration MLE cleanup on failure
Date: Tue, 27 Oct 2026 14:09:23 +0800
Message-Id: <pm-ocfs2-objects-candidate-0038-v7-7a0bd8f07ba98784f6b7@gmail.com>
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
ALL_DONE packet, so its finishing assertion can arrive while the sender
still waits for the status, or after dlm_send_one_lockres() has
returned a connection error for that very packet:

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

An assertion that got there first has also made the target the owner.
Treating the attempt as failed at that point would leave the lockres
owned by the target while this node still holds the other nodes' locks
and refmap bits, so it could neither be purged nor migrated again, and
recovery of the target would send those locks to its recovery master.
The same half handed-over state exists for a moment in the normal
completion, where the handler switches the owner and the sender drops
the locks later under a second spinlock section.

Hand the lockres over in one res->spinlock section instead: the handler
drops the other nodes' locks and refmap bits together with the owner
switch, and the sender only does the same if the handler has not reached
that point yet. Recovery takes res->spinlock before it looks at the
owner, so it sees either the old master with every lock or the new
master with only our own locks. An attempt that failed after the
assertion then has nothing left to do but recalculate the usage.

Ignore a finishing assertion from a node that is no longer in the domain
map. Recovery has already cleaned the lockres up with this node as the
owner, and the sender fails the attempt once it sees the death; handing
the lockres over to a dead node would leave it unowned forever.

For a send that failed with a connection error, wait for the target to
die before deciding, while the MLE is still published. The target may
have received the packet and may still assert; an assertion that finds
no MLE for a lockres we still own is fatal in the handler. The wait is
bounded as before, and an assertion that arrives even later meets that
check as it did before this change.

Use the same cleanup for the pre-send failure, the send failure and the
target-death failure paths. The sender's in-use reference keeps the MLE
alive until its final put outside the nested locks.

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

 fs/ocfs2/dlm/dlmmaster.c | 98 +++++++++++++++++++++++++++++++++-------
 1 file changed, 82 insertions(+), 16 deletions(-)

diff --git a/fs/ocfs2/dlm/dlmmaster.c b/fs/ocfs2/dlm/dlmmaster.c
index 612969867ff9..94ebae4a450a 100644
--- a/fs/ocfs2/dlm/dlmmaster.c
+++ b/fs/ocfs2/dlm/dlmmaster.c
@@ -1823,6 +1823,20 @@ int dlm_assert_master_handler(struct o2net_msg *msg, u32 len, void *data,
 				spin_unlock(&dlm->master_lock);
 				spin_unlock(&dlm->spinlock);
 				goto done;
+			} else if (!test_bit(assert->node_idx, dlm->domain_map)) {
+				/*
+				 * The target died after sending this. Recovery
+				 * has cleaned the lockres up with us as the
+				 * owner and the sender fails the attempt once
+				 * it sees the death; do not hand the lockres
+				 * over to a dead node.
+				 */
+				mlog(0, "%s:%.*s: finishing assert from dead node %u, ignoring\n",
+				     dlm->name, namelen, name, assert->node_idx);
+				__dlm_put_mle(mle);
+				spin_unlock(&dlm->master_lock);
+				spin_unlock(&dlm->spinlock);
+				goto done;
 			}
 		}
 	}
@@ -1924,6 +1938,13 @@ int dlm_assert_master_handler(struct o2net_msg *msg, u32 len, void *data,
 				wake = 1;
 				dlm_change_lockres_owner(dlm, res, mle->new_master);
 				BUG_ON(res->state & DLM_LOCK_RES_DIRTY);
+				/*
+				 * Hand the lockres over completely while the
+				 * spinlock is held: recovery must never find
+				 * the other nodes' locks or refmap bits on a
+				 * lockres that the target owns.
+				 */
+				dlm_remove_nonlocal_locks(dlm, res);
 			} else {
 				dlm_change_lockres_owner(dlm, res, mle->master);
 			}
@@ -2525,6 +2546,34 @@ static int dlm_is_lockres_migratable(struct dlm_ctxt *dlm,
  */
 
 
+/*
+ * Drop the sender's references on a migration MLE after the attempt has
+ * failed. The finishing assert from the target may already have unlinked
+ * the MLE and consumed its base reference; decide under the locks the
+ * assert handler holds, and only drop the base reference while the MLE is
+ * still hashed. Returns true when the assert got there first: it has handed
+ * the lockres over to the target, so the attempt must not count as failed.
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
 static int dlm_migrate_lockres(struct dlm_ctxt *dlm,
 			       struct dlm_lock_resource *res, u8 target)
 {
@@ -2609,9 +2658,10 @@ static int dlm_migrate_lockres(struct dlm_ctxt *dlm,
 
 	if (ret < 0) {
 		if (mle_added) {
-			dlm_mle_detach_hb_events(dlm, mle);
-			dlm_put_mle(mle);
-			dlm_put_mle_inuse(mle);
+			if (dlm_put_migration_mle(dlm, mle)) {
+				dlm_lockres_calc_usage(dlm, res);
+				ret = 0;
+			}
 		} else if (mle) {
 			kmem_cache_free(dlm_mle_cache, mle);
 			mle = NULL;
@@ -2639,17 +2689,25 @@ static int dlm_migrate_lockres(struct dlm_ctxt *dlm,
 	if (ret < 0) {
 		mlog(0, "migration to node %u failed with %d\n",
 		     target, ret);
+		/*
+		 * The target may still have received everything and may
+		 * finish the migration. Give it the chance to assert, or
+		 * to die, while the MLE is still published, so that a late
+		 * assert finds the MLE instead of a lockres we still own.
+		 */
+		if (dlm_is_host_down(ret))
+			dlm_wait_for_node_death(dlm, target,
+						DLM_NODE_DEATH_WAIT_MAX);
 		/* migration failed, detach and clean up mle */
-		dlm_mle_detach_hb_events(dlm, mle);
-		dlm_put_mle(mle);
-		dlm_put_mle_inuse(mle);
+		if (dlm_put_migration_mle(dlm, mle)) {
+			dlm_lockres_calc_usage(dlm, res);
+			ret = 0;
+			goto leave;
+		}
 		spin_lock(&res->spinlock);
 		res->state &= ~DLM_LOCK_RES_MIGRATING;
 		wake = 1;
 		spin_unlock(&res->spinlock);
-		if (dlm_is_host_down(ret))
-			dlm_wait_for_node_death(dlm, target,
-						DLM_NODE_DEATH_WAIT_MAX);
 		goto leave;
 	}
 
@@ -2686,9 +2744,11 @@ static int dlm_migrate_lockres(struct dlm_ctxt *dlm,
 				     res->lockname.name, target);
 				ret = -EINVAL;
 				/* migration failed, detach and clean up mle */
-				dlm_mle_detach_hb_events(dlm, mle);
-				dlm_put_mle(mle);
-				dlm_put_mle_inuse(mle);
+				if (dlm_put_migration_mle(dlm, mle)) {
+					dlm_lockres_calc_usage(dlm, res);
+					ret = 0;
+					goto leave;
+				}
 				spin_lock(&res->spinlock);
 				res->state &= ~DLM_LOCK_RES_MIGRATING;
 				wake = 1;
@@ -2700,11 +2760,17 @@ static int dlm_migrate_lockres(struct dlm_ctxt *dlm,
 			     dlm->name, res->lockname.len, res->lockname.name);
 	}
 
-	/* all done, set the owner, clear the flag */
+	/*
+	 * All done. The finishing assert hands the lockres over under
+	 * res->spinlock; if it has not reached that point yet, do it here
+	 * in the same way, so the lockres is never left half handed over.
+	 */
 	spin_lock(&res->spinlock);
-	dlm_set_lockres_owner(dlm, res, target);
-	res->state &= ~DLM_LOCK_RES_MIGRATING;
-	dlm_remove_nonlocal_locks(dlm, res);
+	if (res->state & DLM_LOCK_RES_MIGRATING) {
+		dlm_set_lockres_owner(dlm, res, target);
+		res->state &= ~DLM_LOCK_RES_MIGRATING;
+		dlm_remove_nonlocal_locks(dlm, res);
+	}
 	spin_unlock(&res->spinlock);
 	wake_up(&res->wq);
 
