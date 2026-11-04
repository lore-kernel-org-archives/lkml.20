Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793765028;
	b=uiy0zaBuPlMZCJkg62trk6fRAcxoblxas87z4HfIdh0ZXezhT+lqEbQSK94tbSYSsALc
	 WCxZjoB4Lx9FmU+ULwGwcxI7OeS6bOYKC+/lkgzXwv+yHq9LpDqfJF5ezFHESBGC1qfxv
	 H7BkICI7ij43JTM5Q8r3u3WXcOCJNjfwBybM2NqSiOBm54TAQzjLrYrsaj1I/ZFw5aFAF
	 agA+lK6CDY1rQ1lbpE+Hr8VHVCT+MjT4DrwIWyTYx5i6Xg5hqrrsHgTYFglkADdPnIphY
	 BeEeUBUo+OT2r46SCjIoT2MzN8Z1H/8cCbHgjVIE1Kz5p2sk8ZSvNEiVf+P8J1fNqBQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793765028;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=7r7ntsGL0qhXgajGalx/+IeSzGK/9oHP89GVUm5LmrY=;
	b=Irh5oex/81g+U8umMVcZ3OPt4U7rvaT04orKYOwCtoBJTqiguayUa8bHjngKRmtAh4VG
	 QgSEoxn2BjYH3/xN8c/Jo4c7KSgqARHDms5Cf5OhYyA6MHP+TrmCddWfXL701wY8feppg
	 ayrUmLZaHdpcNhhaoqiccXAny09PEo3wlvoq6rwPRXsq9ZqEgCtM4EsqAmK0PvEoywFTB
	 c/F3BM2xCR9w26nQX4oqiktAAbpyFCOSNvhG5Muq/QbmYhl5qU1uNrSwn8hifEUBEgPBF
	 i/U1k24rMtLHknip4h0YKWmcbUHlsE/j8ifuntDmEqDolrr8ZCeKTwpjDPndtQhTbbw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=isslab.korea.ac.kr;
	spf=none smtp.mailfrom=isslab.korea.ac.kr;
	dkim=pass header.d=isslab-korea-ac-kr.20260707.gappssmtp.com header.i=@isslab-korea-ac-kr.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=UfImakkD;
	arc=none smtp.remote-ip=209.85.216.48
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9703606D801
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 04:03:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C9703606D801
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=isslab-korea-ac-kr.20260707.gappssmtp.com header.i=@isslab-korea-ac-kr.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=UfImakkD
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-3ac9f49b984so117513a91.1
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 20:03:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=isslab-korea-ac-kr.20260707.gappssmtp.com; s=20260707; t=1793765027; x=1794369827; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7r7ntsGL0qhXgajGalx/+IeSzGK/9oHP89GVUm5LmrY=;
        b=UfImakkD7cyq3KfkTy0HyX2ms2YCEgVubjsRneTJQhxPKoKl03EO6Eko4RLjppItPs
         8WIR+/JA4JtuuXqdAqsar7hNxX3EG6DM2mfZ+HIUbZjqvw3Cw1jAcPYOOEOXCPntsgYS
         uOgtBKz65lmOyy4Ln2zDd3YIilC6MZOyavWzoDotpkq9qDpDvg/iOaxyJGDLrKggvOyH
         MoxB3K9PyHIEm/Up6bBm4+IDF1bURisM5YhC6qL51MDBuz1cQ0u8lTX53XUsNYPnIYi+
         2IDnOk2b5sFNBaoRl+ot9l0UEuqc+PYP/HgkwNZnkSoLSmZTE00ETtuxlwydKohUsc91
         RYrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793765027; x=1794369827;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=7r7ntsGL0qhXgajGalx/+IeSzGK/9oHP89GVUm5LmrY=;
        b=u8I2zp4+awi+uax9F4EW27bhAHPLQWzSrsHPMsfV+jPEV7DEZAOsUdpaSEol8lt1ch
         eUcQaw/RcLCJqya33xoSoKxufuOR/EGBkySIBrbr2pW5+rGMulyzi5t44r8w2qXNz7hc
         2QMQ+GObd3c+umcm/XYWu/HmhyOfxPX5ws1RjHzZr9EDeyI2VQL8NC0kDxPo6abX2BUV
         9H3P+fIipu67gUs9WXzyPTrJ5OrwAMnwRVHiso+8O2V62bi9tGra/yjoa/bGlfOwosEY
         K+iQZHKO/pJutixW8B+EF+aQAoZAgY2Iz/zvZj+Y/gXoRffpnRp1H3xrRo23+lB4azjh
         UqWg==
X-Forwarded-Encrypted: i=1; AKwUvBwmHKNLl6qbuEvL5atIHCT0u9QyyMOOKhtTALWf89MiXkuniHx0vWIGCVFOLjYXnMgYOkD0lMoFyTiruYA=@vger.kernel.org
X-Gm-Message-State: APuU4Z9XoQqha5osFMIK8pVrCVMTySjKxO/ba95YBdR9xzTRV/W7GnJ6
	2g9fyR3/fQhfYKRl/LT+4dtjk3Gu9Klp9MjrtCG9h5S5QbyJVLTwIxUZk3piCRqyPQk=
X-Gm-Gg: AYBFou2Yyzus5uc2zQmg7Pza5gqIMT3RKXxg4cHOG6PAOu/7pOZptKAaM+UKkxmc6/0
	3wgm4Y03QpLePv9wyoFsCa1z1jNoqzZYv5S+cczR3JRSTrB+MN1+KFIVOgn4cvTGIVoDlPPuXSM
	SXiLa0sirSTLH9MgP0ReaTCDKSa5gMyl9l5TAXkxeXDIZ/VU9YukC4Ee8z+i12wxwA/j5yqHVb0
	tjIKJXs5uc3kHQLNjvwXZh4UyCXrL0nQ2vnoUPnl7GLJIal6JcPXL/q6wkQAWlbrINFXyHg7h72
	whNCP1DAdch7XcG+Oet8Qu1L1iIcAhJko+u9gw3aHwEv3tbzw56PigiljCmJ6i6s1Fhb21XUXv+
	pVdbrrgBFrb96/iiSkTn0IiJ9gk8r/bidFrNRF6Ox2cnKdbEOppArNkjH44r8vZpWWFcw0JNBcY
	mblnN6UaGj9IOkVJpCPKIZFVgsQiN/zg0wKpI6pFWF9oooPeuYSNrG6gdqY1hP09cmtbQS+7sfa
	V0xXfXRY8jVQKWjwXvM8QEcL4O3KKzb/+LmyY58aWCMWOzko9joCpIVtByvF+YKUzkpkgn/nNYX
	CV7lpP0LTPJVx9QOdEvNus8DaCxNo6CCV14dwYKAXVjAzssjnSVqhQrUubtyRj/nsV72xcZCqai
	nTLZwLQyowTyZMSsoZ6BVqXIrysazyC5bq1+O
X-Received: by 2002:a17:90b:2b47:b0:3ac:860e:1af9 with SMTP id 98e67ed59e1d1-3ae897cfe6dmr8834316a91.41.1793765027150;
        Tue, 03 Nov 2026 20:03:47 -0800 (PST)
Received: from yhlee-960QFG.Davolink ([2406:5900:1044:110c:744:cf40:a7b2:e78f])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b093d481a3sm1817053a91.1.2026.11.03.20.03.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 20:03:46 -0800 (PST)
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
Subject: [PATCH v8 6/6] IB/isert: only reinstate a connection that reached full feature phase
Date: Wed,  4 Nov 2026 13:03:17 +0900
Message-ID: <20261104040318.1844865-7-yhlee@isslab.korea.ac.kr>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261104040318.1844865-1-yhlee@isslab.korea.ac.kr>
References: <20261104040318.1844865-1-yhlee@isslab.korea.ac.kr>
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

isert_teardown_conn() and isert_connect_error() ask iscsi to reinstate the
connection whenever it is bound, ISER_CONN_BOUND included.  A connection
stays BOUND from isert_accept_np() until isert_get_rx_pdu(); during the
final login response the rx thread is already running but still waits for
its login completion.  iscsit_cause_connection_reinstatement() sends it
SIGINT, that wait fails, and iscsi_target_rx_thread() returns without the
connection exit path, so isert_remove_one() waits for ever.

Ask for reinstatement only from ISER_CONN_FULL_FEATURE, read under
isert_conn->mutex.  There the rx thread is inside isert_get_rx_pdu() and
returns to the exit path, so the signal still helps.  In BOUND terminating
is enough: if the login completes, isert_get_rx_pdu() sees
ISER_CONN_TERMINATING and returns; if it fails,
iscsi_target_login_sess_out() calls isert_wait_conn() and
isert_free_conn().

A test-only delay in that gap, with the device deleted inside it,
reproduced this on all three runs of patches 1 to 5: the rx thread was
signalled and the delete did not return within 240 seconds.  Three runs
with this patch signalled nothing and the delete returned in 8 seconds.

  INFO: task rdma:194 blocked for more than 10 seconds.
        Not tainted 7.4.0-rc1-V7L5-00006-g4f59be58f97a #141
  "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
  task:rdma            state:D stack:26328 pid:194   tgid:194   ppid:1      task_flags:0x400100 flags:0x00080800
  Call Trace:
   <TASK>
   __schedule+0x180f/0x4bb0
   ? __pfx___schedule+0x10/0x10
   ? __pfx_complete_signal+0x10/0x10
   ? irq_work_queue+0x1c/0xb0
   schedule+0x70/0x1f0
   schedule_timeout+0x1cd/0x200
   ? __pfx_schedule_timeout+0x10/0x10
   ? vprintk_emit+0x200/0x2f0
   ? __pfx__raw_spin_lock_irq+0x10/0x10
   __wait_for_common+0x29e/0x420
   ? __pfx_schedule_timeout+0x10/0x10
   ? __pfx___wait_for_common+0x10/0x10
   ? mutex_lock+0x79/0xd0
   ? mutex_unlock+0x7b/0xd0
   ? __pfx_mutex_unlock+0x10/0x10
   isert_remove_one+0x554/0x740
   ? xas_load+0x1a/0x250
   ? __pfx_isert_remove_one+0x10/0x10
   ? xa_load+0xbf/0x120
   ? __pfx_xa_load+0x10/0x10
   ? __pfx_up_read+0x10/0x10
   remove_client_context+0xa4/0xf0
   disable_device+0x128/0x240
   ? __pfx_disable_device+0x10/0x10
   ? __pfx_mutex_lock+0x10/0x10
   __ib_unregister_device+0x226/0x3f0
   ? __pfx_mutex_unlock+0x10/0x10
   ib_unregister_device_and_put+0x50/0x70
   nldev_dellink+0x28e/0x3d0
   ? kernel_text_address+0xa7/0x130
   ? __pfx_nldev_dellink+0x10/0x10
   ? __pfx_down_read+0x10/0x10
   rdma_nl_rcv_msg+0x29c/0x4e0
   ? __pfx_rdma_nl_rcv_msg+0x10/0x10
   rdma_nl_rcv_skb.constprop.0.isra.0+0x21d/0x370
   ? __pfx_rdma_nl_rcv_skb.constprop.0.isra.0+0x10/0x10
   netlink_unicast+0x68f/0x940
   ? __pfx_selinux_socket_getpeersec_dgram+0x10/0x10
   ? __pfx_netlink_unicast+0x10/0x10
   netlink_sendmsg+0x810/0xf20
   ? __pfx_netlink_sendmsg+0x10/0x10
   ? __pfx__raw_spin_lock_irqsave+0x10/0x10
   ? selinux_socket_sendmsg+0x8c/0x270
   ? __sys_sendto+0x337/0x390
   __sys_sendto+0x337/0x390
   ? __pfx___sys_sendto+0x10/0x10
   ? fdget+0x53/0x3b0
   __x64_sys_sendto+0xdb/0x1b0
   ? fpregs_assert_state_consistent+0x56/0xe0
   do_syscall_64+0xdd/0x4a0
   entry_SYSCALL_64_after_hwframe+0x77/0x7f
  RIP: 0033:0x7f1de13200d7
  RSP: 002b:00007fff7f1dd9d8 EFLAGS: 00000202 ORIG_RAX: 000000000000002c
  RAX: ffffffffffffffda RBX: 0000563429332390 RCX: 00007f1de13200d7
  RDX: 0000000000000018 RSI: 00005634293312a0 RDI: 0000000000000004
  RBP: 00007fff7f1dda10 R08: 00007f1de1417200 R09: 000000000000000c
  R10: 0000000000000000 R11: 0000000000000202 R12: 00007fff7f1ddc00
  R13: 00007fff7f1dd9e4 R14: 00007fff7f1ddc20 R15: 00007fff7f1ddc00
   </TASK>

Fixes: 6d1fba0c2cc7 ("iser-target: Rework connection termination")
Cc: stable@vger.kernel.org
Signed-off-by: Yehyeong Lee <yhlee@isslab.korea.ac.kr>
---
 drivers/infiniband/ulp/isert/ib_isert.c | 19 ++++++++++++-------
 1 file changed, 12 insertions(+), 7 deletions(-)

diff --git a/drivers/infiniband/ulp/isert/ib_isert.c b/drivers/infiniband/ulp/isert/ib_isert.c
index a9bd2cc786cebb..8989485001fc94 100644
--- a/drivers/infiniband/ulp/isert/ib_isert.c
+++ b/drivers/infiniband/ulp/isert/ib_isert.c
@@ -681,14 +681,14 @@ static void
 isert_teardown_conn(struct isert_conn *isert_conn)
 {
 	struct isert_np *isert_np = isert_conn->np;
-	bool owned = false, bound = false;
+	bool owned = false, bound = false, full_feature = false;
 	bool promoted = false, terminated = false;
 
 	mutex_lock(&isert_conn->mutex);
 	mutex_lock(&isert_np->mutex);
 	if (list_empty(&isert_conn->node)) {
-		bound = isert_conn->state == ISER_CONN_BOUND ||
-			isert_conn->state == ISER_CONN_FULL_FEATURE;
+		full_feature = isert_conn->state == ISER_CONN_FULL_FEATURE;
+		bound = full_feature || isert_conn->state == ISER_CONN_BOUND;
 	} else {
 		owned = true;
 		promoted = isert_conn->promoted;
@@ -700,7 +700,9 @@ isert_teardown_conn(struct isert_conn *isert_conn)
 		terminated = isert_conn_terminate(isert_conn);
 	} else if (bound) {
 		isert_conn_terminate(isert_conn);
-		iscsit_cause_connection_reinstatement(isert_conn->conn, 0);
+		if (full_feature)
+			iscsit_cause_connection_reinstatement(isert_conn->conn,
+							      0);
 	}
 	mutex_unlock(&isert_conn->mutex);
 
@@ -731,12 +733,13 @@ isert_connect_error(struct rdma_cm_id *cma_id)
 	struct isert_conn *isert_conn = cma_id->qp->qp_context;
 	struct isert_np *isert_np = cma_id->context;
 	bool owned = false, bound = false, promoted = false;
+	bool full_feature = false;
 
 	mutex_lock(&isert_conn->mutex);
 	mutex_lock(&isert_np->mutex);
 	if (list_empty(&isert_conn->node)) {
-		bound = isert_conn->state == ISER_CONN_BOUND ||
-			isert_conn->state == ISER_CONN_FULL_FEATURE;
+		full_feature = isert_conn->state == ISER_CONN_FULL_FEATURE;
+		bound = full_feature || isert_conn->state == ISER_CONN_BOUND;
 	} else {
 		owned = true;
 		promoted = isert_conn->promoted;
@@ -746,7 +749,9 @@ isert_connect_error(struct rdma_cm_id *cma_id)
 
 	if (bound) {
 		isert_conn_terminate(isert_conn);
-		iscsit_cause_connection_reinstatement(isert_conn->conn, 0);
+		if (full_feature)
+			iscsit_cause_connection_reinstatement(isert_conn->conn,
+							      0);
 	}
 	mutex_unlock(&isert_conn->mutex);
 
-- 
2.43.0

