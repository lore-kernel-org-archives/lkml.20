Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793676629;
	b=pmZcmBvdnTzLN3aYYQtS1nzYiaLDzH+KIEITgiFUTrSkXube8qfCDi4PPrFtClkX7fsM
	 OrJ595e/qD0qPVzNh6KhdMI3MTMnprBh9KneJFwaQUZ6sbuqDfESmtcBFKxRSJo7zUHI6
	 z8L1a/EjodFjcaZ6DJhGMGpVCxRVGVDmnbiV+ArfL/ubuIfGKpD010Fzldn4C3TTuTjZd
	 4RPNc4CJ35aX3Qdatd35mHYYBUzYZ8HTtcsRkOwRna2+z/fmCEPAL4HYs5z2Vh/MFPgLu
	 xf7aT9CANMHSv4eVxG7OxYspY8nsCxxCuueGlLmZxNOKtXKQjbFiikVy6+gYBLinFOw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793676629;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=HG7Is05GGnx6Xp1q3Juz1SqD92hs/Rh27uihZYQ1aPY=;
	b=KlVQtLrHLQJmxrccbqZ5KVSK1clDpHOsOZ7gDtS34dcShIru6Zruy09CDtjSI6A162M1
	 lF/XPFIjbzv5RnbMzzejHYB8vMYXB1epGTztNapV/EZk6IrXSOq2lnn+Gzcb2uuAAm1gn
	 ICcwh1HuD9zwW7JFnzy9388QJKoxj123fZsY83fxsri2uax+0Vh9B3AYtRis0CljwjXKJ
	 8Khys1T9HK7zttFHtm3j0zxOXui4h6h7gwvaROVCpUKvPD7+XiK4g1fZ0dLcVlGrPxsJy
	 cT2pR7GdQfJgyt8LcBJ1JIl7T7iaE4WncvSSlL/PEFQRfEnYxkzyV9NV2m6LxdzK8vQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=isslab.korea.ac.kr;
	spf=none smtp.mailfrom=isslab.korea.ac.kr;
	dkim=pass header.d=isslab-korea-ac-kr.20260707.gappssmtp.com header.i=@isslab-korea-ac-kr.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=DUd4qy6D;
	arc=none smtp.remote-ip=74.125.82.179
Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02454606A332
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 03:30:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 02454606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=isslab-korea-ac-kr.20260707.gappssmtp.com header.i=@isslab-korea-ac-kr.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=DUd4qy6D
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-36a0f27c9f4so7026518eec.1
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 19:30:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=isslab-korea-ac-kr.20260707.gappssmtp.com; s=20260707; t=1793676628; x=1794281428; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HG7Is05GGnx6Xp1q3Juz1SqD92hs/Rh27uihZYQ1aPY=;
        b=DUd4qy6DZN+6NgN4TKPkfhh3T+8GtYq4L5nVU1Lk+2iIZojVWAmkwsr4ii177FedAX
         tjY3SSZAq3HzYrKPm7UXQ6Hj7M7I7xlKxowSi7QImGHI/KCnKj4nAWrAJMGQpPCtZeIl
         U37geBGl1ps8GSi/6rn6xeexWcBwo7RE0HGkoNuifppnd4o8Jmfc6m2k4gsJn7+Dj//N
         4joxmyqh5XdfaI7psody1Z0VukugXIp/B0IoTkXt9FSVfH40AyaYy4jRwazuwBiJK4Jw
         97PsmMr2rbMoTFhB4mV6u7xekj1FBKbL0v3ZQ1TcK+X3Q37EEnwwq4lgcBy5BUoAIB+1
         T1ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793676628; x=1794281428;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=HG7Is05GGnx6Xp1q3Juz1SqD92hs/Rh27uihZYQ1aPY=;
        b=dGdcQIZOwMh2bTkgp4XwI3NSj0Do8cx/qEnnavaoiQfb2xEhCjtwn6noSxDnxkf33+
         7LYD1La/i9un5D9an7ZcvIjGuYjPwZ8fe58uLAucZcVwwKI/FMN5ye63baX7HhyemKn2
         kciHSXuHuFHoarj6h4Pp2mxEpZcIjnyz+AqUSbFsQL4IjfQgW0iWNc5Q2n90BAHKA7As
         JLBA5aL48rvoRuK0+4AYdwH3lr9Zoeg02Ekc2ARumd6jtNS9QXxsrltecFLR3NSOPTR5
         XdPNWykRMKoyWbgVrnVatSLRZ6BGJCmlmFc6Z9QszqO3pHXNVgG3V0IBWbCrd1QTNUTg
         y9Gg==
X-Forwarded-Encrypted: i=1; AKwUvByFXoXP82reuaGy5tKoSTK10SbtQ3Ubp+SVZfMx3aY5bpbHA7b9chUruoBef0Ui11l9UuWmVcj1jfKNA/c=@vger.kernel.org
X-Gm-Message-State: APuU4Z+Emzg+3Bm60OKcFo9UKMutXaThPLQTyfClRifRgXWQePgeX80/
	w+52lQWumymxriDXPMCPXEbipeYRjC4V2rvWVfSiSHZj27DB1jtzyaXWiY9C2ybcP3U=
X-Gm-Gg: AYBFou1tcMKbx4xnv8UvyE361hUjczGB/FUR0jcLJ2ezxvGEwiBkmbG9iR5kqVBf02p
	DFZ2qBhj873ks9NKJ8wY7AX1LK1AUuv7m+TcAo8ulQ/JVFXPwafg6KdjWgQ/KD0I7Nb2MyBHwOv
	sTM8A6JHZJocyCVHfqZ03gv2jI1+fDQfAdu0U4HTBKHo0SR+94oWV0OizBPSN/wJyNuWwe/7Eiv
	U4zBLJwVt4NTWEfFsZ0NRiz9D35TLKMYLy5roMLWmIrMze/ItnkTYapnhcm1F1FZV2n2qG3GHGN
	D9z40tSWsdiIHcMEm3uwDLq7IBqvQ+ib2kdXlKrBkFKYJgOnOkYQZyks86k/fpEdr9SdV5hdN5p
	cxug7ouls0IrV4zfeANqmExXfStPiIPty56nUsgufeSg2pYSoQESiceSq1V82gsEKFXaFRTXLWV
	BL7eWOQA8HAXb6cnQfbzmCJT/Ia6p9yawYfYJRUqCe7JbVYTCuvf4ds43D3+gMa/Sg0Q0UOY3I1
	d7w8MwREN+P5UvGA694n+GPCVWMXwNz2XW4ED8d3EYhWkx1r/vkYiKhiXuDyksI4vrPG7jzgzBS
	e2wclKkHLH68z6GZNOfWFtrmWXY5VI1HVr5IfPT184eBxF9N4aod+RG3SzrtV6ICFuv9ojY6EqP
	xwZiVHFHCMWt1oLxgFDPJuMdaCY+COVzHXuBAVBQ=
X-Received: by 2002:a05:7300:c00f:20b0:36a:4ea9:19ad with SMTP id 5a478bee46e88-36a4ea91fd1mr15426433eec.9.1793676627433;
        Mon, 02 Nov 2026 19:30:27 -0800 (PST)
Received: from yhlee-960QFG.Davolink ([2406:5900:1044:110c:2da3:4696:4c5e:89c1])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a428af91bsm41498577eec.8.2026.11.02.19.30.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 19:30:26 -0800 (PST)
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
Subject: [PATCH v4 2/3] IB/isert: drain the QP without holding isert_conn->mutex
Date: Tue,  3 Nov 2026 12:29:23 +0900
Message-ID: <20261103032924.1073138-3-yhlee@isslab.korea.ac.kr>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261103032924.1073138-1-yhlee@isslab.korea.ac.kr>
References: <20261103032924.1073138-1-yhlee@isslab.korea.ac.kr>
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

isert_disconnected_handler() drains the QP with isert_conn->mutex held.
The drain waits for the flush completions of the send and receive
queues, and those are reaped by ib_cq_poll_work() on ib-comp-wq, where
isert_login_recv_done() takes isert_conn->mutex before it looks at the
connection state.  If a login receive completes while the handler holds
the mutex, the completion handler blocks on the mutex and the drain
blocks on the completion that handler would have reaped.

Return from isert_conn_terminate() whether this caller moved the
connection to ISER_CONN_TERMINATING, and do the drain and the unbound
connection release after dropping isert_conn->mutex.  Only one caller
sees true for a given connection, so the drain still runs once.

Two test-only delay knobs open the window, one in
isert_login_recv_done() and one before the drain; it does not open on
its own in this setup.  With them, three runs of 7.4-rc1 plus patch 1 of
this series produced ten hung task warnings each, six, six and seven of
them waiting in ib_drain_qp() and four, four and three in
isert_login_recv_done().  Three runs with this patch produced none.

  INFO: task kworker/0:1:10 blocked for more than 10 seconds.
        Not tainted 7.4.0-rc1-B13-00002-g093ce9c311ad #47
  "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
  task:kworker/0:1     state:D stack:27392 pid:10    tgid:10    ppid:2      task_flags:0x4208060 flags:0x00080000
  Workqueue: ib_cm cm_work_handler
  Call Trace:
   <TASK>
   __schedule+0x180f/0x4bb0
   ? _raw_spin_lock_irq+0x1/0xe0
   ? __pfx___schedule+0x10/0x10
   ? __pfx__raw_spin_lock_irqsave+0x10/0x10
   schedule+0x70/0x1f0
   schedule_timeout+0x1cd/0x200
   ? __pfx_schedule_timeout+0x10/0x10
   ? rxe_qp_from_attr+0x1497/0x18c0
   ? __pfx__raw_spin_lock_irq+0x10/0x10
   ? __pfx__raw_spin_lock_irqsave+0x10/0x10
   ? _raw_spin_lock_irqsave+0x86/0xe0
   __wait_for_common+0x29e/0x420
   ? __pfx_schedule_timeout+0x10/0x10
   ? __pfx___wait_for_common+0x10/0x10
   __ib_drain_sq+0x251/0x340
   ? __pfx___ib_drain_sq+0x10/0x10
   ? __pfx_ib_drain_qp_done+0x10/0x10
   ? irq_work_queue+0x1c/0xb0
   ? __pfx__printk+0x10/0x10
   ? __pfx_process_timeout+0x10/0x10
   ib_drain_sq+0x146/0x1a0
   ib_drain_qp+0xd/0x50
   isert_disconnected_handler.isra.0+0xc4/0x3f0
   isert_cma_handler+0xd74/0x27f0
   ? ip6_finish_output2+0xc09/0x1bd0
   ? __pfx_isert_cma_handler+0x10/0x10
   ? __pfx_ip6_finish_output2+0x10/0x10
   ? _raw_spin_lock_irqsave+0x86/0xe0
   cma_cm_event_handler+0x3e/0x240
   cma_ib_handler+0x190/0x750
   ? __pfx_cma_ib_handler+0x10/0x10
   cm_process_work+0x41/0x330
   cm_work_handler+0x582b/0xc160
   ? _raw_spin_lock_irqsave+0x86/0xe0
   ? __pfx__raw_spin_lock_irqsave+0x10/0x10
   ? hrtimer_start_range_ns+0xa6/0x2c0
   ? __pfx_cm_work_handler+0x10/0x10
   ? finish_task_switch.isra.0+0x1d9/0xa70
   process_one_work+0x697/0x1060
   ? __pfx___schedule+0x10/0x10
   ? __pfx_process_one_work+0x10/0x10
   ? _raw_spin_lock_irq+0x81/0xe0
   ? __pfx_cm_work_handler+0x10/0x10
   ? assign_work+0x11d/0x370
   worker_thread+0x45b/0xd10
   ? __pfx_worker_thread+0x10/0x10
   ? __pfx_worker_thread+0x10/0x10
   kthread+0x2c8/0x3b0
   ? recalc_sigpending+0x15c/0x1e0
   ? __pfx_kthread+0x10/0x10
   ret_from_fork+0x36e/0x5a0
   ? __pfx_ret_from_fork+0x10/0x10
   ? __switch_to+0x572/0xdc0
   ? __pfx_kthread+0x10/0x10
   ret_from_fork_asm+0x1a/0x30
   </TASK>
  INFO: task kworker/0:0H:11 blocked for more than 10 seconds.
        Not tainted 7.4.0-rc1-B13-00002-g093ce9c311ad #47
  "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
  task:kworker/0:0H    state:D stack:29592 pid:11    tgid:11    ppid:2      task_flags:0x4208060 flags:0x00080000
  Workqueue: ib-comp-wq ib_cq_poll_work
  Call Trace:
   <TASK>
   __schedule+0x180f/0x4bb0
   ? _raw_spin_lock_irq+0x1/0xe0
   ? __pfx___schedule+0x10/0x10
   ? _raw_spin_lock+0x80/0xe0
   schedule+0x70/0x1f0
   schedule_preempt_disabled+0x11/0x20
   __mutex_lock.constprop.0+0xc2f/0x1910
   ? __pfx___mutex_lock.constprop.0+0x10/0x10
   ? _printk+0xba/0xf0
   mutex_lock+0xc2/0xd0
   ? __pfx_mutex_lock+0x10/0x10
   ? _raw_spin_lock_irqsave+0x86/0xe0
   isert_login_recv_done+0x2b9/0x590
   __ib_process_cq+0xe1/0x390
   ? __pfx__raw_spin_lock_irqsave+0x10/0x10
   ib_cq_poll_work+0x46/0x150
   process_one_work+0x697/0x1060
   ? __pfx_process_one_work+0x10/0x10
   ? _raw_spin_lock_irq+0x81/0xe0
   ? __pfx_ib_cq_poll_work+0x10/0x10
   ? assign_work+0x11d/0x370
   worker_thread+0x45b/0xd10
   ? __pfx_worker_thread+0x10/0x10
   kthread+0x2c8/0x3b0
   ? recalc_sigpending+0x15c/0x1e0
   ? __pfx_kthread+0x10/0x10
   ret_from_fork+0x36e/0x5a0
   ? __pfx_ret_from_fork+0x10/0x10
   ? __switch_to+0x572/0xdc0
   ? __pfx_kthread+0x10/0x10
   ret_from_fork_asm+0x1a/0x30
   </TASK>
  INFO: task kworker/0:0H:11 is blocked on a mutex likely owned by task kworker/3:0:34.

Fixes: 6d1fba0c2cc7 ("iser-target: Rework connection termination")
Cc: stable@vger.kernel.org
Signed-off-by: Yehyeong Lee <yhlee@isslab.korea.ac.kr>
---
 drivers/infiniband/ulp/isert/ib_isert.c | 26 +++++++++++++------------
 1 file changed, 14 insertions(+), 12 deletions(-)

diff --git a/drivers/infiniband/ulp/isert/ib_isert.c b/drivers/infiniband/ulp/isert/ib_isert.c
index 8255208e30c7d6..c6f417bb206901 100644
--- a/drivers/infiniband/ulp/isert/ib_isert.c
+++ b/drivers/infiniband/ulp/isert/ib_isert.c
@@ -578,21 +578,17 @@ isert_handle_unbound_conn(struct isert_conn *isert_conn)
  * isert_conn_terminate() - Initiate connection termination
  * @isert_conn: isert connection struct
  *
- * Notes:
- * In case the connection state is BOUND, move state
- * to TEMINATING and start teardown sequence (rdma_disconnect).
- * In case the connection state is UP, complete flush as well.
- *
- * This routine must be called with mutex held. Thus it is
- * safe to call multiple times.
+ * Returns true if this caller moved the connection to ISER_CONN_TERMINATING.
  */
-static void
+static bool
 isert_conn_terminate(struct isert_conn *isert_conn)
 {
 	int err;
 
+	lockdep_assert_held(&isert_conn->mutex);
+
 	if (isert_conn->state >= ISER_CONN_TERMINATING)
-		return;
+		return false;
 
 	isert_info("Terminating conn %p state %d\n",
 		   isert_conn, isert_conn->state);
@@ -601,6 +597,8 @@ isert_conn_terminate(struct isert_conn *isert_conn)
 	if (err)
 		isert_warn("Failed rdma_disconnect isert_conn %p\n",
 			   isert_conn);
+
+	return true;
 }
 
 static int
@@ -635,15 +633,14 @@ isert_disconnected_handler(struct rdma_cm_id *cma_id,
 			   enum rdma_cm_event_type event)
 {
 	struct isert_conn *isert_conn = cma_id->qp->qp_context;
+	bool terminated = false;
 
 	mutex_lock(&isert_conn->mutex);
 	switch (isert_conn->state) {
 	case ISER_CONN_TERMINATING:
 		break;
 	case ISER_CONN_UP:
-		isert_conn_terminate(isert_conn);
-		ib_drain_qp(isert_conn->qp);
-		isert_handle_unbound_conn(isert_conn);
+		terminated = isert_conn_terminate(isert_conn);
 		break;
 	case ISER_CONN_BOUND:
 	case ISER_CONN_FULL_FEATURE: /* FALLTHRU */
@@ -655,6 +652,11 @@ isert_disconnected_handler(struct rdma_cm_id *cma_id,
 	}
 	mutex_unlock(&isert_conn->mutex);
 
+	if (terminated) {
+		ib_drain_qp(isert_conn->qp);
+		isert_handle_unbound_conn(isert_conn);
+	}
+
 	return 0;
 }
 
-- 
2.43.0

