Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793600213;
	b=TSOBP79BMgPdsWIFxowCdIFN6lDiU33ZUman1oVygKf46npvpIR1NHWY+cQ2n/2dh/2t
	 4Oe5dA60cAI67WJoqTAV2ZhZDMFq+/PDupOlVXUVfAKeuGD1iAJrbmXL6W+arelkj/pDU
	 EHNJd1Mf4NqgdsApTh0bjliKOczr7CBdKG07GaC9JLkEhn4wXwfwR7lb2aDT5EM9upM/n
	 MboO0R2hyGveJ/+K0Wu1/Y0fZ+8sVnUnc4FntHLPCCjT9cagt2vjMP3IzHOf9TGzWhEBH
	 2tBuQEn6aU9fOQYLBUJR0RiVaYVbngqj2/3oIwqHe2UJacfJEwanU8AjOBN9Y4tqtyg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793600213;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=lb2kJheomVmYz2wSo6iR+pYm0QqTiB9gTDVpHHBWxiY=;
	b=IzYmmADAWAmxrttG/GmFqjjuGNBafFRXRpupXcRgmUK6jUGd4/uBcNhelPbT+9XhsDX8
	 SkBYehafsYkxrjCgkcdntml9hp6bcHhaFqw6JzOE+aMxgnP6DFVIu7yxRjgT0+stOngkT
	 n3c4OxDT6IEs6li9qsDBmxglRVZHJQFX7WUn/G2jkeTYveCdfGUrKXmpk893AlLI1OyrL
	 QqM/ANQ423ibTVegbkfhscxncFDbSmvToQ/EAddo+rY3z0UbQiQVQL7S6Tkk1SgxLzWmm
	 OhXgnuGbk6fp4tX3ibQItb2VadmMta9mBVZTXcCr7bTnZYtmuWr9T7w+ryLicTFJ/YQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=isslab.korea.ac.kr;
	spf=none smtp.mailfrom=isslab.korea.ac.kr;
	dkim=pass header.d=isslab-korea-ac-kr.20260707.gappssmtp.com header.i=@isslab-korea-ac-kr.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=e7lHhy2p;
	arc=none smtp.remote-ip=209.85.210.175
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39B7A606A334
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 06:16:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 39B7A606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=isslab-korea-ac-kr.20260707.gappssmtp.com header.i=@isslab-korea-ac-kr.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=e7lHhy2p
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-8a594d313a3so1480947b3a.1
        for <linux-kernel@vger.kernel.org>; Sun, 01 Nov 2026 22:16:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=isslab-korea-ac-kr.20260707.gappssmtp.com; s=20260707; t=1793600211; x=1794205011; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lb2kJheomVmYz2wSo6iR+pYm0QqTiB9gTDVpHHBWxiY=;
        b=e7lHhy2pwsV/suNqTsLmiGHI4aKK9XU10ChfG1g0+hlOPkSrMeba0Ix7ZrE8Idj7VY
         xJLet9Ak1J7clKBfMJP0qe2aM0CGAzxMtv5DhiJExha0jbYvjYB668F3GRkKHXuPt67a
         5JXxchhR9n8VbvDkqXA+abHtLdX9qhQkwnh6qKIjK8ZfEGPTjK5XVQdl5C3bOhFKla/t
         cvzD2CYal3OMxuw8SFCI07gUr77cajZ9vsuw7wNPwkJ2aS+XP0JcmuBc1SF9KZozI4O2
         1b7Ybst3AI7iNuTWngJ2+cNF0oADPs3VaCLhw/W/9QQpXwNN5GN3RYqMc6InCXPktXl0
         RCgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793600211; x=1794205011;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=lb2kJheomVmYz2wSo6iR+pYm0QqTiB9gTDVpHHBWxiY=;
        b=a6Qh6h07abeAOw4RqhC5c8wcz3/uHxT6O9y0+XtFBmse5DCJyA9hnsQPHNujuWbg2N
         FPZz4RjJRuEgmKbaK6i6gBeGvMPl/+uAn90rqeSU9ZhbMdbn9ZVuFzdLi9lvsL3rVUJ2
         +9iauCNTp3a7kKFoUcP9ScD0r9jaXPs5HYJqeWIqkUXGmuwmgOu9BIr8TK2eXB7d7skD
         QBRA0fFCsbfkuuc4nlFLR91OBALJeXkICiy0PiS3X59yp8+3kwcqbpwTaI/ul9Ape4U/
         MhOKcQdMF0bUZfbwDnPNA3Vcna9xMcCvUP2Ih2N/gKbBAgePNqM1mDN0IXAXmhyDE0P/
         sWIQ==
X-Forwarded-Encrypted: i=1; AKwUvBwvxZ5n40DlMagSL5qrKaJSgjz3fUFmlSAaedWm2Hg7NtW/axN/6p3INoXFbi4QkzCyYfFN0YfDSFYFx7o=@vger.kernel.org
X-Gm-Message-State: AFq9FYJWEtQP2zpiaCi1N9vMqiWd+vGYRmCCERsimTwen/cByUvZfxNk
	qxcaSF0EtbpQbFfyDoFCgR4EE66phpyiAYQwuByDOBELFOIJ8AdGNpor0TdKuf0pq58=
X-Gm-Gg: AYBFou34fRZK+aPhkt0JulJ/fwWXN4eIFZd9Zie6mvwxJ2lcIarYa9GUHahGyOqKC/s
	FITkHlP+5uTp7U9wDJOkjvFdfGw0aDkdDYJ3urAYGgNOVG5Usah+DGnff/HlMxh4u/1D2KCLoOe
	Nobd/pbF55ANjPLNv+nJ2VJ8Qa/KaJkoIeQGLAXoBepyMn5jQzUfJzVZb85yWxX4CpW+2PIjEDU
	zfRNqx6rGjCQaMogtl6FBAS26HJNUqb7GY0tSTRrqqsmxBgZr4qvZgu0ZFDtNCvc0ZN2SX5ni/A
	cY25Q68df9KG7I1phMzDuLY200+npqAm/dXyjhGoq1eta4nhc/e2niKtVHYiSmIvJZ6ipwPDXqO
	0ugoCsFTLaf5sWdDmuYAvroqHGMhK+ZZAN6EkcVFSn9aeZr6ZitR8YECLf77ABWeTd+yD1wfWfh
	OP7EuFzeB77mjgdJ6wMsg/zWYI3clXGIXHT7mgLq/s7Z2fqt24evYHICY5gMxHQg43u6YFyWCrN
	UHQ920VEiemDRXOM778vc/dCgPWrYQ82wWSsY5mQHwDq/rwpP6SrasgGw+rOd3s2jEG2A3DWEgl
	gpP3SPjk4RPRflO8R8DpWXUMhCL5bFxP1+1UIoP8GR022dVsPFy48UJBGQRR0WpmcJTdd5n0nl6
	Vnm7eUtI9ofjRfIVAwWCkrBeLvYy5+JNFmPsPxw==
X-Received: by 2002:a05:6a00:7443:b0:89f:53b8:9751 with SMTP id d2e1a72fcca58-8a9bd2f072amr6725379b3a.16.1793600211453;
        Sun, 01 Nov 2026 22:16:51 -0800 (PST)
Received: from yhlee-960QFG.Davolink ([2406:5900:1044:110c:d115:e4f4:23fd:61df])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8aad9d03be0sm1509071b3a.27.2026.11.01.22.16.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 22:16:51 -0800 (PST)
From: Yehyeong Lee <yhlee@isslab.korea.ac.kr>
To: Sagi Grimberg <sagi@grimberg.me>,
	Max Gurtovoy <mgurtovoy@nvidia.com>,
	Jason Gunthorpe <jgg@ziepe.ca>,
	Leon Romanovsky <leon@kernel.org>
Cc: "Martin K . Petersen" <martin.petersen@oracle.com>,
	Mike Christie <michael.christie@oracle.com>,
	linux-rdma@vger.kernel.org,
	target-devel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Yehyeong Lee <yhlee@isslab.korea.ac.kr>,
	stable@vger.kernel.org
Subject: [PATCH v3 1/2] IB/isert: do not publish connections being released on a second list
Date: Mon,  2 Nov 2026 15:16:06 +0900
Message-ID: <20261102061608.617186-2-yhlee@isslab.korea.ac.kr>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261102061608.617186-1-yhlee@isslab.korea.ac.kr>
References: <20261102061608.617186-1-yhlee@isslab.korea.ac.kr>
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

isert_free_np() moves the connections left on isert_np->pending and
isert_np->accepted onto a stack-local list, drops isert_np->mutex and
releases them from there.  isert_conn->node is then linked into that
local list instead of being empty, which is the test
isert_handle_unbound_conn() uses to decide whether a connection still
needs cleaning up.  It runs from the RDMA CM handler, which is not
serialised against isert_free_np(), so it unlinks the connection from a
list it does not own and queues a second release for it.

Take the connections off isert_np one at a time, so that
isert_conn->node is empty once isert_np->mutex is dropped.  The release
keeps running with no mutex held, which commit 691b0480933f ("IB/isert:
Fix dead lock in ib_isert") needs: releasing a connection destroys its
cm_id, and rdma_destroy_id() waits for the handler_mutex that the CM
handler holds while it waits for isert_np->mutex.

Reproduced with a test-only delay added inside isert_free_np()'s release
loop: 36 reports in each of three unpatched runs, none in three patched
runs.

  BUG: KASAN: slab-use-after-free in isert_free_np+0x6a4/0xab0
  Read of size 8 at addr ffff888109249040 by task rmdir/193

  CPU: 1 UID: 0 PID: 193 Comm: rmdir Not tainted 7.3.0-BASET-13248-g103b309e2033 #15 PREEMPT(full)
  Hardware name: QEMU Ubuntu 24.04 PC v2 (i440FX + PIIX, arch_caps fix, 1996), BIOS 1.16.3-debian-1.16.3-2 04/01/2014
  Call Trace:
   <TASK>
   dump_stack_lvl+0x53/0x70
   print_report+0xd0/0x630
   ? __pfx__raw_spin_lock_irqsave+0x10/0x10
   ? isert_free_np+0x6a4/0xab0
   kasan_report+0xce/0x100
   ? isert_free_np+0x6a4/0xab0
   isert_free_np+0x6a4/0xab0
   ? __pfx_isert_free_np+0x10/0x10
   iscsit_del_np+0x163/0x340
   iscsit_tpg_del_network_portal+0x3c3/0x530
   ? mutex_unlock+0x7b/0xd0
   lio_target_call_delnpfromtpg+0x40/0x60
   config_item_cleanup+0x115/0x190
   configfs_rmdir+0x7c7/0x9f0
   ? __pfx_configfs_rmdir+0x10/0x10
   vfs_rmdir+0x291/0x770
   ? lookup_one_qstr_excl+0x1a/0x1d0
   filename_rmdir+0x35d/0x4f0
   ? __pfx_filename_rmdir+0x10/0x10
   ? kasan_save_track+0x14/0x30
   ? __kasan_slab_alloc+0x6e/0x70
   ? strncpy_from_user+0x2b/0x1c0
   __x64_sys_rmdir+0x41/0x60
   do_syscall_64+0xdd/0x4a0
   entry_SYSCALL_64_after_hwframe+0x77/0x7f
   </TASK>

  Allocated by task 10:
   kasan_save_stack+0x33/0x60
   kasan_save_track+0x14/0x30
   __kasan_kmalloc+0x8f/0xa0
   __kmalloc_cache_noprof+0x148/0x360
   isert_cma_handler+0x1e3/0x2840
   cma_cm_event_handler+0x3e/0x240
   cma_ib_req_handler+0x17d9/0x4480
   cm_process_work+0x41/0x330
   cm_work_handler+0x5727/0xc160
   process_one_work+0x697/0x1060
   worker_thread+0x45b/0xd10
   kthread+0x2c8/0x3b0
   ret_from_fork+0x36e/0x5a0
   ret_from_fork_asm+0x1a/0x30

  Freed by task 43:
   kasan_save_stack+0x33/0x60
   kasan_save_track+0x14/0x30
   kasan_save_free_info+0x3b/0x60
   __kasan_slab_free+0x43/0x70
   kfree+0x121/0x390
   process_one_work+0x697/0x1060
   worker_thread+0x45b/0xd10
   kthread+0x2c8/0x3b0
   ret_from_fork+0x36e/0x5a0
   ret_from_fork_asm+0x1a/0x30

  Last potentially related work creation:
   kasan_save_stack+0x33/0x60
   kasan_record_aux_stack+0x8c/0xa0
   __queue_work+0x7a1/0x15e0
   queue_work_on+0x5d/0x70
   isert_disconnected_handler.isra.0+0x20b/0x380
   isert_cma_handler+0xd71/0x2840
   cma_cm_event_handler+0x3e/0x240
   cma_ib_handler+0x190/0x750
   cm_process_work+0x41/0x330
   cm_work_handler+0x582b/0xc160
   process_one_work+0x697/0x1060
   worker_thread+0x45b/0xd10
   kthread+0x2c8/0x3b0
   ret_from_fork+0x36e/0x5a0
   ret_from_fork_asm+0x1a/0x30

  The buggy address belongs to the object at ffff888109248000
   which belongs to the cache kmalloc-8k of size 8192
  The buggy address is located 4160 bytes inside of
   freed 8192-byte region [ffff888109248000, ffff88810924a000)

Fixes: 691b0480933f ("IB/isert: Fix dead lock in ib_isert")
Cc: stable@vger.kernel.org
Signed-off-by: Yehyeong Lee <yhlee@isslab.korea.ac.kr>
---
 drivers/infiniband/ulp/isert/ib_isert.c | 54 ++++++++++++++-----------
 1 file changed, 31 insertions(+), 23 deletions(-)

diff --git a/drivers/infiniband/ulp/isert/ib_isert.c b/drivers/infiniband/ulp/isert/ib_isert.c
index efa8d7b7844c97..5371bba71ba3cb 100644
--- a/drivers/infiniband/ulp/isert/ib_isert.c
+++ b/drivers/infiniband/ulp/isert/ib_isert.c
@@ -2479,12 +2479,29 @@ isert_accept_np(struct iscsi_np *np, struct iscsit_conn *conn)
 	return 0;
 }
 
+static struct isert_conn *
+isert_np_take_conn(struct isert_np *isert_np)
+{
+	struct isert_conn *isert_conn;
+
+	lockdep_assert_held(&isert_np->mutex);
+
+	isert_conn = list_first_entry_or_null(&isert_np->pending,
+					      struct isert_conn, node);
+	if (!isert_conn)
+		isert_conn = list_first_entry_or_null(&isert_np->accepted,
+						      struct isert_conn, node);
+	if (isert_conn)
+		list_del_init(&isert_conn->node);
+
+	return isert_conn;
+}
+
 static void
 isert_free_np(struct iscsi_np *np)
 {
 	struct isert_np *isert_np = np->np_context;
-	struct isert_conn *isert_conn, *n;
-	LIST_HEAD(drop_conn_list);
+	struct isert_conn *isert_conn;
 
 	if (isert_np->cm_id)
 		rdma_destroy_id(isert_np->cm_id);
@@ -2497,31 +2514,22 @@ isert_free_np(struct iscsi_np *np)
 	 * up in accepted and pending lists.
 	 */
 	mutex_lock(&isert_np->mutex);
-	if (!list_empty(&isert_np->pending)) {
+	if (!list_empty(&isert_np->pending))
 		isert_info("Still have isert pending connections\n");
-		list_for_each_entry_safe(isert_conn, n,
-					 &isert_np->pending,
-					 node) {
-			isert_info("cleaning isert_conn %p state (%d)\n",
-				   isert_conn, isert_conn->state);
-			list_move_tail(&isert_conn->node, &drop_conn_list);
-		}
-	}
-
-	if (!list_empty(&isert_np->accepted)) {
+	if (!list_empty(&isert_np->accepted))
 		isert_info("Still have isert accepted connections\n");
-		list_for_each_entry_safe(isert_conn, n,
-					 &isert_np->accepted,
-					 node) {
-			isert_info("cleaning isert_conn %p state (%d)\n",
-				   isert_conn, isert_conn->state);
-			list_move_tail(&isert_conn->node, &drop_conn_list);
-		}
-	}
 	mutex_unlock(&isert_np->mutex);
 
-	list_for_each_entry_safe(isert_conn, n, &drop_conn_list, node) {
-		list_del_init(&isert_conn->node);
+	for (;;) {
+		mutex_lock(&isert_np->mutex);
+		isert_conn = isert_np_take_conn(isert_np);
+		mutex_unlock(&isert_np->mutex);
+
+		if (!isert_conn)
+			break;
+
+		isert_info("cleaning isert_conn %p state (%d)\n",
+			   isert_conn, isert_conn->state);
 		isert_connect_release(isert_conn);
 	}
 
-- 
2.43.0

