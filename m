Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793198048;
	b=NC531P0a+RuuVqUjDOriHhCPYq2XMCpHnioHkOzqxHpEWYKrf7iJDNdbUMJrbHzBrF/h
	 7AM4yFIVEjkss0vVnNRpWoY4yvBSX9RkezfgjygcOEOqNP3V5k1d6q7IhezxzK9JihOhO
	 tYRR986ASRFtj2Cc8c5oCKtJJu/Pt6N80BklPBGXYNYIftyhvg8KHRc1IA0lQsQ+JVqC6
	 b9kGWS7DUVyU5gMEmrEXmp0okjJFQYD6nfrTdkRCMTUoOvHFo8rTgmd6yaUx7yekO+cxj
	 nIi5IB5VN/4JyWiWTnfApLYltUTrpLZQCXJzzyQEvcl2d/1LLxYOkBRjMZ1/tuRzC0Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793198048;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=Lnsy46Tk/2qSP0NGVnsKAYQcdnXJRqGYK3UfpyjKzYo=;
	b=OqNxTDPI8+BpNMuuG2nlEGape6qB4JYfq9sC8Se56rKTCPs855Mp7jDjZiSBUynre8pq
	 GYG1jpFyU1JbjP+3bMbkcm4N3f21KgKbte0KuBK3JxzbxgaxQEmHXN4P3eOuDWdv7qOFe
	 7VIfzWUHeykkY625KN7Q1yfa3PHdnWt/W2ogP3W7loiBCv9LB1WvQyziyirCGFVF3176u
	 nOjgwaHUYYcoCU7qs75yWszysoN/7n+w+53UiNxFU4YeUh4yoUcRkIUjyG3GVEbfLXPaZ
	 fD4QU+GHDAZKoRDFmBw5J2x4kJai0SBxGKt8+tLWWsBSDUNU7JdkrYdne1cx5RlHB5g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=edUsYxpp;
	arc=none smtp.remote-ip=209.85.222.43
Received: from mail-ua1-f43.google.com (mail-ua1-f43.google.com [209.85.222.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1146B606A31A
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 14:34:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1146B606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=edUsYxpp
Received: by mail-ua1-f43.google.com with SMTP id a1e0cc1a2514c-9906a5410f5so1674619241.0
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 07:34:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793198047; x=1793802847; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Lnsy46Tk/2qSP0NGVnsKAYQcdnXJRqGYK3UfpyjKzYo=;
        b=edUsYxppsMAK2vWVGN5wNZS/LEJMOmCoKoIGbhwphxOhF3uQd+bmvBiRIO2DUcaqvD
         ZAHXfYlxw+Ku39epHJsI+10bM+LzLp39KRDsOPStV8OSMtQB7dqNP+Mn3XJQUgEH74WK
         W4j37MDkUUPhVKeO4VT4I4POyDNjpzGvM/o3dcVNSjBerITK2i6KjntYG82keKbxSqQe
         oTwpJi4O6B4Fgnf6dLEyv58QTJEVhH3jEgNdIMUKEM0N8GqAXZv8z3N3hL3sRzcWv/WY
         RizgCg6WiseVkIOlCys2sWk09Q3y/3fTcJlD6FQfwqbW+s/PQj8UO3UNh9vMf4dXd0s9
         U9Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793198047; x=1793802847;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Lnsy46Tk/2qSP0NGVnsKAYQcdnXJRqGYK3UfpyjKzYo=;
        b=YK9yEVIKPgVu0F1csLArvt/RPB0RhcmfXRUkGuniD7hils8j/ESk482TpV50JNg2kJ
         in4T6r1Ez8nqrRC3qm47hWv0C2l25yPq9KyTF9zkuo6ADN1V6JBeS52twLNBeOz0ARp6
         8/9IWNjSrd0KZs26F5MOBDHJ1zSrAOwmb7IZqtwt+SqXFI1DjKFTgn+WkDBA4b2i5k3j
         yEAf6340Z9/tekMZrqrRabpJXJiyOJ9OcIYKaQ5TgwzP5JnnbQQPeI0xdRcgJon8whPg
         p39/wHDwncHwe7awDD4BwHg6wcOL7wbOV9bi22qEbczofL4o7VQBw+CvuqSCaSIjvDn9
         +etw==
X-Forwarded-Encrypted: i=1; AKwUvBxaiCagg48sj04iOF3px/SAT7H/vMtZYaG9ZVTWDT9FBLy/wRiRo8kAxhKAZzlR3pVXjfUfw8rZhAhiaVs=@vger.kernel.org
X-Gm-Message-State: AFq9FYKA3hNs4pFWTCGPZA/p1AtcB3Vi27JuJLdK/xYenpd400M+fxVu
	dHZjc+kXfXvBqiR1AHkPmZ043gsxgI+AltR8lJ/nzo2kazy0xaOjUcLs
X-Gm-Gg: AYBFou2ywGMrFORRL715iBpd/iSe1TPhKwxHbW+adSGXLQCaQV6xcKUnOqv6fpfMKtN
	ru80vnb5iW56dAEYOKQB2e1cETPovFnE+PzRsykwgjOftZYuFHrw9zp+Hvq4tz61483aZGeM75G
	HtUwey5MXeruTgtdzY9Suzl9ENi/TTSowotszDaimlMrco9TR7GkHtc0bAQwT/jwqaotu1+5FrZ
	VVO7C+K8BnKGW4gpIbPi3eqQVW1entOxJJRHSvONaDT4PlOOVkAOJ7wyf0b78p2O7X4Xyw4HDqD
	NRtVb1xcGSygr900ojl1plQpN99UF2l5tN1QJ43H15AcfeGIpYMR9rA010Ty6HUvUeZV0PjVEoo
	sn9O8t7gDLnoufxRmotZSPhuxGeGyg5IrVeKxVhVAosBR5oMbtc4TOeaAryigpcdZbkneKhMUbR
	j+QVGLlveVnE5k9DjhXCN138LRGcflawZT9+T4xz4bGaN6jAyAQn9BcZ5QnPOWEY0ugsZnLraLB
	0n3S1i4I/4hgM08+3X64murEosOdcZEvH2DZOvgwn8YFlmm9cwl4kXKUWPWohUF9Wt3QG7q9Jte
	ZM0eKOmtNDGOraCl6As5UJ3wybZ2e9/XNHjRRo//Nfz0CfhFuModnehwtmGg
X-Received: by 2002:a05:6102:3ec5:b0:7c0:115c:14ca with SMTP id ada2fe7eead31-7cea124bff8mr2043811137.5.1793198046891;
        Wed, 28 Oct 2026 07:34:06 -0700 (PDT)
Received: from bridge.. ([2804:14d:ba6b:8339:8b5e:397a:cdcb:e1d9])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7cea3caf553sm5653640137.7.2026.10.28.07.34.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 07:34:06 -0700 (PDT)
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
Subject: [PATCH v3] nvme-tcp: fix NULL queue->ctrl dereference on reconnect
Date: Wed, 28 Oct 2026 11:33:43 -0300
Message-ID: <20261028143343.221936-1-christian.aurichzm@gmail.com>
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
that is not live. send_mutex and io_work move there as well, and
nvme_tcp_exit_queue() destroys the helper's mutexes when the controller
is freed.

Fixes: 61b0ed3be81b ("nvme-tcp: parallelize I/O queue allocation and startup")
Suggested-by: Keith Busch <kbusch@kernel.org>
Reviewed-by: Nilay Shroff <nilay@linux.ibm.com>
Signed-off-by: Christian Aurich Zanettini Martins <christian.aurichzm@gmail.com>
---
v3:
- Add nvme_tcp_exit_queue() for the mutex_destroy() calls in
  nvme_tcp_free_ctrl() (Hannes)
- Keep Nilay's Reviewed-by, as the change is mechanical

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
attr_qid_max to 4. Without the patch the host oopses as above by the
second try; with v3, 8 of 8 tries go live, with and without lockdep.
30 resets under digest I/O, with a reader looping on the address
attribute, also pass and are clean with lockdep.

 drivers/nvme/host/tcp.c | 64 ++++++++++++++++++++++-------------------
 1 file changed, 35 insertions(+), 29 deletions(-)

diff --git a/drivers/nvme/host/tcp.c b/drivers/nvme/host/tcp.c
index 4ada1ff120e2..85f93b0238ce 100644
--- a/drivers/nvme/host/tcp.c
+++ b/drivers/nvme/host/tcp.c
@@ -1559,7 +1559,6 @@ static void nvme_tcp_free_queue(struct nvme_ctrl *nctrl, int qid)
 	memalloc_noio_restore(noio_flag);
 
 	kfree(queue->pdu);
-	mutex_destroy(&queue->send_mutex);
 
 #ifdef CONFIG_DEBUG_LOCK_ALLOC
 	lockdep_unregister_key(&queue->nvme_tcp_sk_key);
@@ -1987,6 +1986,35 @@ static int nvme_tcp_start_tls(struct nvme_ctrl *nctrl,
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
+static void nvme_tcp_exit_queue(struct nvme_tcp_ctrl *ctrl, int qid)
+{
+	struct nvme_tcp_queue *queue = &ctrl->queues[qid];
+
+	mutex_destroy(&queue->queue_lock);
+	mutex_destroy(&queue->send_mutex);
+	mutex_destroy(&queue->pf_cache_lock);
+}
+
 static int nvme_tcp_alloc_queue(struct nvme_ctrl *nctrl, int qid,
 				key_serial_t pskid)
 {
@@ -1995,11 +2023,8 @@ static int nvme_tcp_alloc_queue(struct nvme_ctrl *nctrl, int qid,
 	int ret, rcv_pdu_size;
 	struct file *sock_file;
 
-	queue->ctrl = ctrl;
 	init_llist_head(&queue->req_list);
 	INIT_LIST_HEAD(&queue->send_list);
-	mutex_init(&queue->send_mutex);
-	INIT_WORK(&queue->io_work, nvme_tcp_io_work);
 
 	if (qid > 0)
 		queue->cmnd_capsule_len = nctrl->ioccsz * 16;
@@ -2013,14 +2038,12 @@ static int nvme_tcp_alloc_queue(struct nvme_ctrl *nctrl, int qid,
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
 
@@ -2088,8 +2111,6 @@ static int nvme_tcp_alloc_queue(struct nvme_ctrl *nctrl, int qid,
 		}
 	}
 
-	queue->data_digest = nctrl->opts->data_digest;
-
 	rcv_pdu_size = sizeof(struct nvme_tcp_rsp_pdu) +
 			nvme_tcp_hdgst_len(queue);
 	queue->pdu = kmalloc(rcv_pdu_size, GFP_KERNEL);
@@ -2136,8 +2157,6 @@ static int nvme_tcp_alloc_queue(struct nvme_ctrl *nctrl, int qid,
 	lockdep_unregister_key(&queue->nvme_tcp_sk_key);
 	lockdep_unregister_key(&queue->nvme_tcp_slock_key);
 #endif
-err_destroy_mutex:
-	mutex_destroy(&queue->send_mutex);
 	return ret;
 }
 
@@ -2839,7 +2858,7 @@ static void nvme_tcp_free_ctrl(struct nvme_ctrl *nctrl)
 free_ctrl:
 	put_net(ctrl->net);
 	for (i = 0; i < nr_queues; i++)
-		mutex_destroy(&ctrl->queues[i].queue_lock);
+		nvme_tcp_exit_queue(ctrl, i);
 	kfree(ctrl->queues);
 	kfree(ctrl);
 }
@@ -3238,21 +3257,8 @@ static struct nvme_tcp_ctrl *nvme_tcp_alloc_ctrl(struct device *dev,
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

