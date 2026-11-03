Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793745515;
	b=SmVJnKcuts7ukmG5enlk9CJBf0/ip3bhNt7pZHQ/OddgZzF0X3GqZawkHcVsp7lcg7op
	 zlng+dIqezT3hwnPDdxPOZbzc49o/TgARvUCLFBYBhqFvY4Y5OJ6K4Tcjp7dqs+vsn/fN
	 hf8AgN2p8DwvMjloMo+AWpxKyLt1aP2PbPbpMKXVZ74LmXzPwUkW2MMkoVoPwzRvgFN03
	 +LYd/igksvIOBcl00SGLuMhiBbX7c6ZJ5tL6kCCmrY24QUrz74A1VBF9MYcCCBqeBdi4Q
	 Xi88zockJm708HHBNLkdOI8YmSUMWdkICnJR/w/pTuNkMpgIbuOOmWqu7WuBS1F+Dtg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793745515;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=A7XXBCX30Xg3KVcU/Qg7WxIOkAveBqd5SEDNjAUB0Uk=;
	b=d6P1Ec3UjNrQvDJaI7G2zUechpCOYprcJqG9jubO4PwF4Al+uR2QdVwdlKxSBPRq/T+k
	 L6wzyIC7K2Zw92THPQ7HhZl7ELaY39BOASEhRc2KcirkGPpYeYefJQ+S7ZeDpdMnNOQo2
	 LypW4xUgGgn2QMcQhdMKzMLYin+UVH1o55iiP41Q5f75ZdhvuLY8yPoTYaKQWzsGpQLvd
	 ykHp1UubVjsxdl5SUS51GPB50HDVP3MNF2PWy5dGd8FOJqW1cWzCFDViUYdACw+ziNPsY
	 kCc2ipA6xmGWWBXDWKrb8wpRrAM9ivE9Y3VSaTGP0T073JZT5tCX1dAoA5s37UZnw6A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=isslab.korea.ac.kr;
	spf=none smtp.mailfrom=isslab.korea.ac.kr;
	dkim=pass header.d=isslab-korea-ac-kr.20260707.gappssmtp.com header.i=@isslab-korea-ac-kr.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=fF3RbS9E;
	arc=none smtp.remote-ip=209.85.216.52
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBBAF606D817
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 22:38:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BBBAF606D817
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=isslab-korea-ac-kr.20260707.gappssmtp.com header.i=@isslab-korea-ac-kr.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=fF3RbS9E
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-3ac6794fe45so130376a91.0
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 14:38:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=isslab-korea-ac-kr.20260707.gappssmtp.com; s=20260707; t=1793745514; x=1794350314; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=A7XXBCX30Xg3KVcU/Qg7WxIOkAveBqd5SEDNjAUB0Uk=;
        b=fF3RbS9Ep6qmrVOnUoPxn/Yxr5j7JbRTNIKbWPTNQEPGNpnjZ7xOC1wQZbceJtp02x
         RKdZVZNjJGTEvxRkBhygNmM0YQXjBQuqfPlBr+72WaEYjf/DDUrfr05ENUwH7vMDo3mk
         CEmzl7xnREWEvlG9hxLvkjT0UJUUa+/GmJMfAA5mTRw/NhsP2iFIuQuw14Ph9m5vvEAR
         gm75nY1450I0uIaTtglSh3AEh1/QjqRk+yIVx7R+eYasMlpnXFNsri6s0krIwkl/GobT
         lmxp/lakUZycBYzot0U5nb8qSz3NRAK0CceQcIsSBvSo9vLGTLPc1/hHEJ0b5mzreOlm
         FOmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793745514; x=1794350314;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=A7XXBCX30Xg3KVcU/Qg7WxIOkAveBqd5SEDNjAUB0Uk=;
        b=FRRMpS7oc9AJw/lOk0/iGNZwrH9zoKihBAGvlA+qAMlmKI8hlAXW4U2659PEHuZAW+
         QvdL8MTn104xNNR2xV99mpnXunYrtaqvaafoN9dMsX9F0no0v4tDxpqBk1Uk3xJ/Tey5
         bCGaNsslupHyp4y0mlku+AOrVRD7mcYTGF6DVOF7cRot3jqNM9oeectFQVP8++WEAWMf
         POsUVf2kIOzAEnQIyYnMpSJ0x5G6ZrJihhnf5+0DZODLGwote4Kx1CEUywzN7b3fB+cF
         FiUkenDsMhjFhOSLnm5Ud96MtyY1F+sDeJO42yAveDri6e2R6eTk2BrZoQguRAGrpYER
         li3w==
X-Forwarded-Encrypted: i=1; AKwUvBwcQzMU9DSeEZq78LpaOvvEDSxkPXGrrFkdT2nHckI5BIA5D/o0E1D81Jm/6zw4lkrpA2mL0kjxeAhEh3k=@vger.kernel.org
X-Gm-Message-State: APuU4Z9U/h6MLWZuob3+EBCV4cJvToW6BRmecVv3Pc3zb78WBONr1nss
	tMl8cv8amcy/LHUHKkcULnnh8n162UXI9g8YEiBGxitpspLs5NNm76O82AevkSKAJbs=
X-Gm-Gg: AYBFou0gxb2lTQNQ0z+2HboYcjEVNEmDIp50/uivH8lmSA+HkznW3aXOM6Ta+uvgmCb
	kYbZGnV0EVpN3v8hA8/3j+NIx1u2ehu3rqbXBXiN8rn0V1SVkqgkoCmdV5BU829w+UHbeQF7zIQ
	uQ6y8eY+FBtfrNYgCx9iq9e42D0GKSQudsDAH42zuFAu95d2TmTkIlinsymhPgHtt6aIq61mCDQ
	+sXA21adBg4IbX6XwNRaF3t811lti9Bf5Fkg8Td5Oa1JVS6AMHaAAsX6Y1laYDMTIu5VCqgu176
	qRVpflAUMZkNTvHq0RykPEF3df3rN/sGm4Qpp7/X8T730xFat4v43MLddxtYqwpxucqe/bwufrx
	1F1YBsSwzDAIxYy364o0UH7sp49+aXBCo99pdOduw2NUnIm2rSd3yd+GIk2cV11yC9V412qTFmX
	hrwzl3QM8qFgwx4V7jvwbKSAbAr8ysn61FYmrmR4/FguDBA8l4zOTCFzYd2phjWLPw8434QLnc2
	NFTcj1WCFHzmZvuKlVZEZZ1B7Rbk7ORB+4m40V/rRAN7M/P2PX2KW8wn3nNluta4gHFeQMil7gf
	zETttjTN4fjlNmtxdQJsCUfEIRoYGIqrJ/4dQUPGKwVWSxe5aSnzpaqtLw4YVyec8VG0a2jsNv8
	jjSc8AQDGyGjWNjctVN2QavU4mdLVHq5/EZD4H03V4EAHK7CgBW6ert4A2w==
X-Received: by 2002:a17:90a:c2d0:b0:3ad:eb34:4c6c with SMTP id 98e67ed59e1d1-3ae897c886amr12337321a91.13.1793745514170;
        Tue, 03 Nov 2026 14:38:34 -0800 (PST)
Received: from yhlee-960QFG.Davolink ([2406:5900:1044:110c:744:cf40:a7b2:e78f])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b096b6116bsm223711a91.4.2026.11.03.14.38.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 14:38:33 -0800 (PST)
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
Subject: [PATCH v6 6/6] IB/isert: only reinstate a connection that reached full feature phase
Date: Wed,  4 Nov 2026 07:38:02 +0900
Message-ID: <20261103223802.1697607-7-yhlee@isslab.korea.ac.kr>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261103223802.1697607-1-yhlee@isslab.korea.ac.kr>
References: <20261103223802.1697607-1-yhlee@isslab.korea.ac.kr>
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
index 2057bb35af4cac..2564c9f5ea9a41 100644
--- a/drivers/infiniband/ulp/isert/ib_isert.c
+++ b/drivers/infiniband/ulp/isert/ib_isert.c
@@ -682,14 +682,14 @@ static void
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
@@ -701,7 +701,9 @@ isert_teardown_conn(struct isert_conn *isert_conn)
 		terminated = isert_conn_terminate(isert_conn);
 	} else if (bound) {
 		isert_conn_terminate(isert_conn);
-		iscsit_cause_connection_reinstatement(isert_conn->conn, 0);
+		if (full_feature)
+			iscsit_cause_connection_reinstatement(isert_conn->conn,
+							      0);
 	}
 	mutex_unlock(&isert_conn->mutex);
 
@@ -732,12 +734,13 @@ isert_connect_error(struct rdma_cm_id *cma_id)
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
@@ -749,7 +752,9 @@ isert_connect_error(struct rdma_cm_id *cma_id)
 		isert_conn->cm_id = NULL;
 	} else if (bound) {
 		isert_conn_terminate(isert_conn);
-		iscsit_cause_connection_reinstatement(isert_conn->conn, 0);
+		if (full_feature)
+			iscsit_cause_connection_reinstatement(isert_conn->conn,
+							      0);
 	}
 	mutex_unlock(&isert_conn->mutex);
 
-- 
2.43.0

