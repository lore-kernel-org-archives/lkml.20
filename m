Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793075558;
	b=Y8O5/M23Jxe9XVnfARj2wHqbQzFGyu6HDY67osGve0hpM7yWImI3QMJnbOeFBBdxNpWh
	 fPZJXWfli1NfaDSOADdbJUSaOZOd6VB6aCZZgIfQxWxzP221pOECQpgsjHriakJXn0Npl
	 WZ4sdYiQKX2UAy4l14/yWxjz1W+gsjVgEd7JT09ZGD9uJWmDZDt/0CImDi5cOnczEoSKb
	 t2WmaO5pfAb8gYw4jQGXGo0SZzSsUDfbb33TJO0O5IFEf50DEkMyxCVshAi1eV3z76E61
	 0CPpJSr/5Ni/Rai/G9oU/38WdiAsnz1vOKP2WNzBmdZYhEGEWOK3jyZZlzToEkxMb4w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793075558;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=beH3LIXHCpnBC80V4Y086Pbi9jHjOQOYfz6A2+Xry6Q=;
	b=zlZ3CDbUepZeLJgm1JgGtJF7ZCY0kHOgmJJi6MNCLiX1949NYkVElIJoBWWgzBhKmxpj
	 +veTjZJYywnPk4jw3peU5P+BQ2Ipo3f5G8XovktErzieK+IRZM2026OZorw+g1l96RVY9
	 zAOKyqkAjCj+1Dzf5/lRZdiDdpaNBqxObN0ybJuXvmFOgFSlxoSL/a/6QaUSWZqQ1QwTi
	 fVuASDSSklGjfHYx8m6bqYHQQodHGeo2Lz81wWN9Roz2sZA5ceCBQ+64pHHdoa0M17wDP
	 zR2fhlBcCB4Nc1d4Wi434lZrpGaZJKHBTZw/hEEr3NDEn4wzmtFyeH6ZaZXi79fa6vA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=XHBn4wD5;
	arc=none smtp.remote-ip=209.85.210.171
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DAFA606A326
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 04:32:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8DAFA606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=XHBn4wD5
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-8a06c60065fso2849712b3a.1
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 21:32:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793075557; x=1793680357; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=beH3LIXHCpnBC80V4Y086Pbi9jHjOQOYfz6A2+Xry6Q=;
        b=XHBn4wD5E6Ny0jCWr3JPfbWRLzwMZ5tLXNjZkT2ky54AuNd7qG4AzH4QB1vNFTdl4h
         hgxnRW/tfL1d9MeRpJnvmaoiYVWWnf62I1/ieBrqdJfWS3z8LlFr35LO4bgR82OAMypu
         aVYeApSYRWLgZzaYDU2sIXbiWYDwnAQqV22esPZmIvC7ZRQSJS8P8jUEit4b0SUQa0BD
         I8/4jlmJQ7jcPEY8xx4RxWC4jVGTo9FJjp+LTxmLYlEkQ3FFJvGhDQZLcGxVmIajjzW3
         +lffpa8VmhjNoKnp1E9KpznKg6RL0ZgweD7id9DdKFk6hi6xBojcrpYYL/OZiTXz1mR/
         Lm3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793075557; x=1793680357;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=beH3LIXHCpnBC80V4Y086Pbi9jHjOQOYfz6A2+Xry6Q=;
        b=vN8oxTJFVZhEQasYFV9uN5uKTiwVCudAd4TrjS54lTKjr34di0tDTLmFSwZoLRJB5X
         CMMOeHgS4VWcOpNKJLW0vcG2yVu7o87E8j0IlV6yMFkwtGX+6mmUqui13wqsQ7XirRb2
         ojV2gQjyqvzxAIFJ0uaK9v5owzfhmmStQPa9XI9YnzbQjmfegUefOMs7Ags/2HiAmlY7
         bwE61v3z/FfKzf5Qzi3/Dps75OZyPvMwi5JQ4mowdlY/YujEIBL+c6ErTyFQQPbggetV
         ytAk+lZtnRTRtRgryfstUxq+zb++fFugeC/EdSlAztldydE5T8YjwJfRvIRDdd/thCEz
         82Hw==
X-Forwarded-Encrypted: i=1; AKwUvByfn+lptU+OG8wyQlrtTkiNYildFH8lOYaCivykA3hfybLSP+GKbeYPsvUXMImeh+PIdJ2DibYV+FqyU7I=@vger.kernel.org
X-Gm-Message-State: AFq9FYLYu+C1QPZC/3wivbuzQoAhl/r/BmwJiCWhpaIf2/IpVHQTsK5X
	I5byv+Cs7akqcxAm72U5IEq1UCYFsgO+e5D1Rdajy8REl4gc+nwFXkKM
X-Gm-Gg: AYBFou0Rk7KyWDUaQ3baWer4mIS/18YRjPdoDcGAELwuywYFr+QS7ulggZmSjARU36y
	l9RMcVEGEmWjMeasITKp2QXhLPBLPCgNXWxDmyIKhObPS0/wQK7904Rj1+FoHhPeywwfIfdHu27
	vDL9nPTX5RqE2/rDzNbKFmKzZW4x4fb4gcbbLN5b1ne7/neSfCKT/4/KhyPYXpGtYIwdH6zWSDD
	C2JiPzpJp8NBYDlefZVWOfEMAxW1xJwQZFVrHmPfZr4JVOre3H9VC3NJe7MsgJBtzBFj6rSSM++
	1AAA25D1PMIJPDmgVuteiIctKgztgbOBzrsk0mUm68ym18wXv1IL911oMe+HwGmHreKNGQ5gKCK
	V1Yaq5oxVz6T7TmNaogc9iieTRk6lrvCDAmjpLdZgcq6j9O5zOp8s2P1VGM4Ub43R7S+LHoyWpF
	0PFx/V+pkOyiH2jC33qfLsI/qyDVtQZSaOpYDWz1Ud9otw3q+rPfJaG+nHJz/01XKNEDdLWg7ji
	tYDoL07HjhYIypC6+Fv4c6PTdlDBqflQ7Kvs8CGONNsaNL9SPbHvqvu2Pow/UIkTK09hbJ67zCP
	9X20Z+n4qKuLBBaeqNuIVKWc
X-Received: by 2002:a05:6a00:ad02:b0:881:cbb0:6a90 with SMTP id d2e1a72fcca58-8a36772bf53mr6311975b3a.58.1793075556731;
        Mon, 26 Oct 2026 21:32:36 -0700 (PDT)
Received: from localhost ([111.228.63.84])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8a36bb2a7e8sm1735435b3a.39.2026.10.26.21.32.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 21:32:36 -0700 (PDT)
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
Subject: [PATCH v2] ocfs2/dlm: serialize migration MLE cleanup on failure
Date: Tue, 27 Oct 2026 12:32:30 +0800
Message-Id: <pm-ocfs2-objects-candidate-0038-v6-44416f9847751914bacc@gmail.com>
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

An assertion that got there first has also made the target the owner
and cleared DLM_LOCK_RES_MIGRATING. Treating the attempt as failed at
that point would leave the lockres owned by the target while this node
still holds the other nodes' locks, so it could neither be purged nor
migrated again and would be misread by recovery. Complete our side the
way a successful migration does instead, unless recovery has taken the
lockres over in the meantime.

For a send that failed with a connection error, wait for the target to
die before deciding, while the MLE is still published. The target may
have received the packet and may still assert; an assertion that finds
no MLE for a lockres we still own is fatal in the handler. The wait is
bounded as before, and an assertion that arrives even later meets that
check as it did before this change.

Use the same cleanup for the pre-send failure, the send failure and the
target-death failure paths. The sender's in-use reference keeps the MLE
alive until its final put outside the nested locks. Successful
migration retains its existing in-use-only put.

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
Changes in v2:
- Complete the migration instead of failing it when the finishing assert has
  already switched the owner, so the lockres is not left owned by the target
  with the other nodes' locks still held here (Sashiko review).
- On a connection error from the send, wait for the target's death before
  the MLE is dropped, so a late assert finds the MLE instead of hitting the
  handler's check (Sashiko review).

Link to v1: https://lore.kernel.org/r/pm-ocfs2-objects-candidate-0038-v5-5e414ac0c701d2ccd4b3@gmail.com

 fs/ocfs2/dlm/dlmmaster.c | 82 ++++++++++++++++++++++++++++++++++------
 1 file changed, 70 insertions(+), 12 deletions(-)

diff --git a/fs/ocfs2/dlm/dlmmaster.c b/fs/ocfs2/dlm/dlmmaster.c
index 612969867ff9..a96060b87b9f 100644
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
+ * The finishing assert switched the owner to the target and cleared
+ * DLM_LOCK_RES_MIGRATING while the attempt was failing. Complete our side
+ * as a successful migration does, unless recovery has taken the lockres
+ * over since.
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
@@ -2639,17 +2686,25 @@ static int dlm_migrate_lockres(struct dlm_ctxt *dlm,
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
+			dlm_migrate_lockres_asserted(dlm, res, target);
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
 
@@ -2686,9 +2741,12 @@ static int dlm_migrate_lockres(struct dlm_ctxt *dlm,
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
