Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793155408;
	b=kQJ9mUPtsc7jZoRYBHWhFK20+TCxJ60DnZUwVLcMmbGzKRaGx7GqXChJqz+Sxwph/Wjm
	 mc9o7mKJTA2qNB3mtNwGTKG388pWljms9GPOyHvo0lSMHqTn3x0CxsDX8VJr+MCE3yshh
	 B/YyPrRvOTE/e131yoF21CUMGr0dEkOklmv3pzdhM4QaQXTvooep21XCu2pNpR1cxTb1w
	 UmZls93XnJEacOvMCjcFmhtfe70JBSnjNXdNOBPfAr86Y0XfuhTB2B/zA5BKEK8sZFrzO
	 DIxD5oTq4rdYS511SCuKiOTqflrGtCFkhEFIpZtdRVbDqCFo6kElcf0yX0AJv8OD6PQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793155408;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=cMHMerKcPZRARUSKynguHBDpnKNX+DmYSxphWjqk6bI=;
	b=FyZ+ieN3mIKjXGVHUS+s4TiR2o6yU3AfaeTZvHTW+iaedv42yUtZcQN4UAseSF3H3j/e
	 /B1QaxaIHGuYLPFZx7Ib2Xs6nr+9FC/3mIyVb0MJ4CcfZiuOAwDO1kEezDW6sGsL9Gmbj
	 QASIeEtODLcGN56MT99Wjg4LGO6qq0XHQEwuYiv+f8z5HsiIkm5xD4hmUCJk94rBIw3a2
	 IPwks+nJiJvLoqsmCC3r0JasvE5ywGGRAJOm1b3GJKuRsv0PifRtevVVd+mP7ZMihFAhx
	 9nvrnNLxZUp0+EejRnBLxvX1PsePpPiFm3mFqe2AtPhPR2wKN7xdKQ1LEHgA2itqFmQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=k3Wgs0lq;
	arc=none smtp.remote-ip=209.85.222.44
Received: from mail-ua1-f44.google.com (mail-ua1-f44.google.com [209.85.222.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11AA3606A31E
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 02:43:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 11AA3606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=k3Wgs0lq
Received: by mail-ua1-f44.google.com with SMTP id a1e0cc1a2514c-9912c47367cso321963241.1
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 19:43:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793155407; x=1793760207; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=cMHMerKcPZRARUSKynguHBDpnKNX+DmYSxphWjqk6bI=;
        b=k3Wgs0lqQV7TGcgeOMnHdXA2navr8717d4MzDdeKgNM3Oznh8hl+k8/+EQ4YTx88vk
         V/INgDaWKAHfqi9RX/mmRowCweBaZAETAgEHHm9rU4SW4nukeQ5E9vOhFTelG0HNfDPr
         0Fx6YS21Kd3z1KwROiZDcHWbzRWUiJdGi4c2x8UMR60BybkcsJ5BNlurz+h4Hga/N4ar
         MSC9rwblFmy4QqG8kK4GXuaatfCp8SWV4RHLnxqrJ8/qfuymD5PuJwP2fR0DMie9rBcH
         5rKh1rbd1By5YiPchTJEbLS9/xCL02ddOTMsx+d0ZjFMZTvbvUMHLlkWwAQsuZDX+Jwn
         CLzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793155407; x=1793760207;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cMHMerKcPZRARUSKynguHBDpnKNX+DmYSxphWjqk6bI=;
        b=bdqHcu/Efsq3W9eDoyGN+m/7tHvhBXgu6eyU50q3vAk0/TOKSm/jn+LxHHdAajDjG8
         Mzihlp+K3tea3S0VL/at+Ut7U8tE3/hoqESLio1ctlW9o5c8AanJ6OCGCwelWu8/+aUm
         6LmXcQvDolb1NNLeUdIU/llbTtZeBaFWaeDTmmuJxFa1HmsM/t1duygJREvsRFFpYe1S
         VgVMBNBcu33Ky/WouKq0YBGrp6uQkqwoVED/zeh3YfDUo7QVAF3tMJ7D7B9JeT5uFDOf
         /DTMuDHjVXyMAAUAubUfdgImWZUF6ca4KxI1Q/Ymkz1QzCOU/fbPcOlqJ6svFhB9qWdi
         CmUw==
X-Forwarded-Encrypted: i=1; AKwUvBy+Su0CmSEzbkKk+Gh6MvvhMTrspMEYNis2P9hq02CK4PeoNZE+bDvOpxl1Q+JLK4nGQVglt7nkMRRMeWU=@vger.kernel.org
X-Gm-Message-State: AFq9FYJDGv1XXJ00bmGwluTD6FpsdJdPar9KTF69ggdUiUj/wPSGCe/i
	BeYaMrDGZuX6sqZuQ7j4zrWqXN7qtJSB3Lv2/dVXoHa2NCHLA5kGvhUa
X-Gm-Gg: AYBFou2PGHBjFPFUtFNjulfHYwvEOOZIWKX4M/kA1TFePMetKzT6AC+8sztNJ/th7s3
	RCi/3OWafMLSTEDkogx/e7IXL27DsUsVEHhcL56pDCbEGV8NWThP3fnz/gmZohrKjVmodKKMBsz
	wyezPPQC0prtpsyG+UTjPNaMaBzbZG9iBboWaSdsp7L0l19qxxdYiO2VnoAivlW5G/FHDQNhSpa
	RBNtMHZ75PoH7y4VRXL9VWTyOI00ntoZwVF7zh67lRtw0N19+EURAk7XUMDIVO2Az7zsMIySMxi
	OtGWYRUnvx9BpwsaeU+oQ1KoL/rSQ7AaMg2v7bpjNHmNNsRkltMwwfKQhEi0IVQ1n1vr5cYXPYU
	8NsCCbIz8SFePXSYmem7RB0rkxadjhiL4mFYCav2ZWLydSeyycRVjz9u1fv6JeLuRZ9iagL3ec5
	L/jEDaZ6v3Qm3RjFeXsxrUdWm9Cz+QDYQ487rCcrHVbL5g+dOo02zPhkb+Cyd8zlr8Udd1XwQRc
	dzE/rlIbRdKLkXHwK2JRBOiIzJRt8L//2tdDT9lXschTSoLpXWUUxKV5Ug5ZWAhLEns0tYXYTbj
	rMDTRCFr+ldIQsrDHErjYeRzrIWXq69QkT6wbYg=
X-Received: by 2002:a05:6102:6e8a:b0:7cb:cfcf:3d01 with SMTP id ada2fe7eead31-7cea15c6056mr1537851137.33.1793155406886;
        Tue, 27 Oct 2026 19:43:26 -0700 (PDT)
Received: from bridge.. ([2804:14d:ba6b:8339:260a:a9d6:ce02:aaa8])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-9912589778fsm4765241241.0.2026.10.27.19.43.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 19:43:25 -0700 (PDT)
From: Christian Aurich Zanettini Martins <christian.aurichzm@gmail.com>
To: linux-nvme@lists.infradead.org
Cc: kbusch@kernel.org,
	axboe@kernel.dk,
	hch@lst.de,
	sagi@grimberg.me,
	hare@kernel.org,
	sgogte@purestorage.com,
	wagi@kernel.org,
	kanie@linux.alibaba.com,
	nilay@linux.ibm.com,
	linux-kernel@vger.kernel.org,
	Christian Aurich Zanettini Martins <christian.aurichzm@gmail.com>
Subject: [PATCH v2] nvme-tcp: fix NULL queue->ctrl dereference on reconnect
Date: Tue, 27 Oct 2026 23:43:09 -0300
Message-ID: <20261028024309.1398623-1-christian.aurichzm@gmail.com>
X-Mailer: git-send-email 2.43.0
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

Since commit 61b0ed3be81b ("nvme-tcp: parallelize I/O queue allocation
and startup"), a reconnect that gets more I/O queues than before grows
the tag set before the new queues are allocated. queue->ctrl is only
set by nvme_tcp_alloc_queue(), so I/O submitted in between reaches
nvme_tcp_queue_rq() on a queue that was never allocated and
dereferences a NULL queue->ctrl:

  BUG: kernel NULL pointer dereference, address: 00000000000002ac
  RIP: 0010:nvme_tcp_queue_rq+0x33/0x3b0

Add nvme_tcp_init_queue() for the queue fields that do not depend on
the connection and call it for every queue when allocating the
controller. Such requests are then requeued like on any other queue
that is not live. send_mutex and io_work move there as well, and the
helper's mutexes are all destroyed when the controller is freed, like
queue_lock already is.

Fixes: 61b0ed3be81b ("nvme-tcp: parallelize I/O queue allocation and startup")
Suggested-by: Keith Busch <kbusch@kernel.org>
Signed-off-by: Christian Aurich Zanettini Martins <christian.aurichzm@gmail.com>
---
v2:
- Rebase on Guixin's v4 "nvme-tcp: Validate the queue state under the
  queue lock in the address attribute" and move its queue_lock init
  into the helper
- Also move send_mutex and io_work into the helper, and destroy
  send_mutex and pf_cache_lock next to queue_lock in
  nvme_tcp_free_ctrl() (Keith)
- Left in nvme_tcp_alloc_queue(): req_list and send_list, as resetting
  them drops entries left over from the previous connection, and the
  lockdep keys, which are per socket instance since commit 19bdb70c77d3
  ("nvme-tcp: lockdep: use dynamic lockdep keys per socket instance")

Based on nvme-7.4 (9afc1b71d963) with "nvme-tcp: fix request PDU size
when header digest is enabled" and Guixin's v4 on top. The last hunk
assumes the conflict between those two in nvme_tcp_alloc_ctrl() is
resolved by keeping both loop bodies and both comments. I can resend on
top of nvme-7.4 once both are there.

Reproduced in QEMU with nvmet-tcp over loopback and
CONFIG_NVME_MULTIPATH=n: connect with attr_qid_max=2, keep direct reads
running on the CPUs that map to the new hw queues, then raise
attr_qid_max to 4. Before the patch the host oopsed as above within two
tries in each of three boots; with v2, 8 of 8 tries went live, with and
without lockdep. 30 resets under digest I/O, with a reader looping on
the address attribute, also pass and are clean with lockdep.

 drivers/nvme/host/tcp.c | 58 ++++++++++++++++++++---------------------
 1 file changed, 29 insertions(+), 29 deletions(-)

diff --git a/drivers/nvme/host/tcp.c b/drivers/nvme/host/tcp.c
index 4ada1ff120e2..77bc530ae0a6 100644
--- a/drivers/nvme/host/tcp.c
+++ b/drivers/nvme/host/tcp.c
@@ -1559,7 +1559,6 @@ static void nvme_tcp_free_queue(struct nvme_ctrl *nctrl, int qid)
 	memalloc_noio_restore(noio_flag);
 
 	kfree(queue->pdu);
-	mutex_destroy(&queue->send_mutex);
 
 #ifdef CONFIG_DEBUG_LOCK_ALLOC
 	lockdep_unregister_key(&queue->nvme_tcp_sk_key);
@@ -1987,6 +1986,26 @@ static int nvme_tcp_start_tls(struct nvme_ctrl *nctrl,
 	return ret;
 }
 
+/*
+ * The I/O tag set is allocated, and grown on reconnect, before the queues are
+ * connected, so blk-mq can initialize requests on a queue, and dispatch to it,
+ * before nvme_tcp_alloc_queue() has run for it. Set up the fields that do not
+ * depend on the connection once, when allocating the controller, and keep them
+ * until the controller is freed.
+ */
+static void nvme_tcp_init_queue(struct nvme_tcp_ctrl *ctrl, int qid)
+{
+	struct nvme_tcp_queue *queue = &ctrl->queues[qid];
+
+	queue->ctrl = ctrl;
+	mutex_init(&queue->queue_lock);
+	mutex_init(&queue->send_mutex);
+	mutex_init(&queue->pf_cache_lock);
+	INIT_WORK(&queue->io_work, nvme_tcp_io_work);
+	queue->hdr_digest = ctrl->ctrl.opts->hdr_digest;
+	queue->data_digest = ctrl->ctrl.opts->data_digest;
+}
+
 static int nvme_tcp_alloc_queue(struct nvme_ctrl *nctrl, int qid,
 				key_serial_t pskid)
 {
@@ -1995,11 +2014,8 @@ static int nvme_tcp_alloc_queue(struct nvme_ctrl *nctrl, int qid,
 	int ret, rcv_pdu_size;
 	struct file *sock_file;
 
-	queue->ctrl = ctrl;
 	init_llist_head(&queue->req_list);
 	INIT_LIST_HEAD(&queue->send_list);
-	mutex_init(&queue->send_mutex);
-	INIT_WORK(&queue->io_work, nvme_tcp_io_work);
 
 	if (qid > 0)
 		queue->cmnd_capsule_len = nctrl->ioccsz * 16;
@@ -2013,14 +2029,12 @@ static int nvme_tcp_alloc_queue(struct nvme_ctrl *nctrl, int qid,
 	if (ret) {
 		dev_err(nctrl->device,
 			"failed to create socket: %d\n", ret);
-		goto err_destroy_mutex;
+		return ret;
 	}
 
 	sock_file = sock_alloc_file(queue->sock, O_CLOEXEC, NULL);
-	if (IS_ERR(sock_file)) {
-		ret = PTR_ERR(sock_file);
-		goto err_destroy_mutex;
-	}
+	if (IS_ERR(sock_file))
+		return PTR_ERR(sock_file);
 
 	sk_net_refcnt_upgrade(queue->sock->sk);
 
@@ -2088,8 +2102,6 @@ static int nvme_tcp_alloc_queue(struct nvme_ctrl *nctrl, int qid,
 		}
 	}
 
-	queue->data_digest = nctrl->opts->data_digest;
-
 	rcv_pdu_size = sizeof(struct nvme_tcp_rsp_pdu) +
 			nvme_tcp_hdgst_len(queue);
 	queue->pdu = kmalloc(rcv_pdu_size, GFP_KERNEL);
@@ -2136,8 +2148,6 @@ static int nvme_tcp_alloc_queue(struct nvme_ctrl *nctrl, int qid,
 	lockdep_unregister_key(&queue->nvme_tcp_sk_key);
 	lockdep_unregister_key(&queue->nvme_tcp_slock_key);
 #endif
-err_destroy_mutex:
-	mutex_destroy(&queue->send_mutex);
 	return ret;
 }
 
@@ -2838,8 +2848,11 @@ static void nvme_tcp_free_ctrl(struct nvme_ctrl *nctrl)
 	nvmf_free_options(nctrl->opts);
 free_ctrl:
 	put_net(ctrl->net);
-	for (i = 0; i < nr_queues; i++)
+	for (i = 0; i < nr_queues; i++) {
 		mutex_destroy(&ctrl->queues[i].queue_lock);
+		mutex_destroy(&ctrl->queues[i].send_mutex);
+		mutex_destroy(&ctrl->queues[i].pf_cache_lock);
+	}
 	kfree(ctrl->queues);
 	kfree(ctrl);
 }
@@ -3238,21 +3251,8 @@ static struct nvme_tcp_ctrl *nvme_tcp_alloc_ctrl(struct device *dev,
 		goto out_free_ctrl;
 	}
 
-	/*
-	 * The I/O tag set is allocated before the I/O queues, and initializing
-	 * its requests already allocates the PDUs from the page frag caches of
-	 * the queues, sized by their header digest setting, so set up the
-	 * locks and hdr_digest here.
-	 *
-	 * The queue locks are owned by the controller, not the queues:
-	 * they outlive the per-queue connect/disconnect cycles so that
-	 * sysfs readers can never race their destruction.
-	 */
-	for (i = 0; i < ctrl->ctrl.queue_count; i++) {
-		mutex_init(&ctrl->queues[i].pf_cache_lock);
-		ctrl->queues[i].hdr_digest = opts->hdr_digest;
-		mutex_init(&ctrl->queues[i].queue_lock);
-	}
+	for (i = 0; i < ctrl->ctrl.queue_count; i++)
+		nvme_tcp_init_queue(ctrl, i);
 
 	ctrl->net = get_net(current->nsproxy->net_ns);
 	ret = nvme_init_ctrl(&ctrl->ctrl, dev, &nvme_tcp_ctrl_ops, 0);
-- 
2.43.0

