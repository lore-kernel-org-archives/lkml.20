Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.217.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793147231;
	b=G8KTa8ndOg7OZtcoBE74meJlil/sjHVBzSXSFY4Xq+iOsvSPVw0BFXsho676X63npPpg
	 Qx+m+56vEK4n7hy3WHHvYxW9nIAiN177jY+Ua6+blRtH4ayv1dtY1Gk0FXobGeYx6Mpx9
	 tylXR0er0wnkQKW9x7xsj92jycRhGkzRg+zmfKOaKPaKGvTS8TbfcVKVScQ7NUTupU2Z3
	 kEx1H6cXd8ZZDA4pyrqij/09NEUnzK6qxCrfqiX1oqromK5VPtvMApXQGhRbXzEwOk2+o
	 fIGH6RrdWw2vPAUJ/04dgG9LweBdMrHJNzIKRVihebr7wbbdjDD23r9rsNp7wqOj3RA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793147231;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=SbDo/FtxogKJkv2z+Ra3BUUKwOLYjP3PXcdhiKWABBE=;
	b=oMQRgzVfFnxM0NAPhvkpYBT+XXuHbXLxwQr78oEd++e1ga1PQGDsZgfqPuqivHguWFL8
	 5Eg9yKyAq9gqIabZnj59Ue4C+35lHN3943zy4do/ruaYH5/HWH9TujxpQPqeQtaBOIhrQ
	 CAlH1MXjBqUkXBdmDdEmaRJUyOW8BE1tMLfkVu3Quu6i3pCQCiUvGEnnmRJxVykuJ5rAp
	 g53XsVfhDmN4BPNmXZxmB/sr3B5PjNgvZPuVZqr4ke7+1ViQCYELBYhYeG68W38P6s9LB
	 RgZ+HvV3QPgVcZeUuOWyT4DDLJU+3VM8gl+ZhXYvDMBrjxQbC8M6NqcNpbGT7BOiJ/w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lfNtr6Pi;
	arc=none smtp.remote-ip=209.85.217.48
Received: from mail-vs1-f48.google.com (mail-vs1-f48.google.com [209.85.217.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AC32606A31A
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 00:27:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5AC32606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lfNtr6Pi
Received: by mail-vs1-f48.google.com with SMTP id ada2fe7eead31-7cc1cf48a39so154059137.1
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 17:27:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793147230; x=1793752030; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=SbDo/FtxogKJkv2z+Ra3BUUKwOLYjP3PXcdhiKWABBE=;
        b=lfNtr6PiSAH1oHY9TFG7Lfa//lNYlxmMmDU6PmWLKQDnxVvzY3UUWMy36t8HTC2xKm
         q1wDGsnVJnFiQ4a8xNHlXxFcBaVp4txTtaYEoXxuUDCmHu6XaUVi5qWpTDPTSJLXOUwS
         VNGhguFxZmVnSp5HDKkXTR98FIc2w+kyeiQY83wVB1qQLgQU/unb3ou5RJ4QmTq4LTaQ
         Gv8M+JTndU0V/hQ7/zJuXk1I8h4MENi3BLNVKTMsjWHJtVYWhg6qsxVpDad+gnlu7hpV
         FAtWYn/e6h+Ab73Q+//7vMt2r0jQGaobQMNyV/cqNkDUJaEGiB1/6Oa/nKH5J2wlyxpl
         +IKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793147230; x=1793752030;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SbDo/FtxogKJkv2z+Ra3BUUKwOLYjP3PXcdhiKWABBE=;
        b=CMgtxVOGZU4t08rx1lOMiFkwVXjpCfjJSm2WhTv80jS0ZzLbyC7LFP7oyBL3s/Cf31
         Bm/BuqRYzzdVVFKXOc6i9geGKBda0dMoM8bfeEf0mJLz+bNIDEsjkL01zeK7fIpp4QfP
         Ks7Iy8/0t/mZyv27SGzXISA6AJpPZ3aspRAoJAohe9poUrCOUcsP/EmNzEEy64tEQjge
         n8Z7mf2crwuJjVG3zfP6jx/mUvbTM1tsL6Ud5/X1nCcxofqhrj9ZYhGZFyM8U//Zj9AX
         gkYIkBa8FRvMGYhZhxtzDXD6zasRLejx5gAiWMC5H1Cj5LBpew1q57Qb3laxmb9TqwlH
         WP1Q==
X-Forwarded-Encrypted: i=1; AKwUvByMOXaGRd96q2pncLFIJfkao3PhWOXG2pXu8K4N3umqpl7ejeIMo239lM9m8TrcpHzyXW0bn5IZUiq5FYU=@vger.kernel.org
X-Gm-Message-State: AFq9FYLrrfpIeuVXCxhV/MrV+HgFHn0ylfuBCgnxIA1zhfSWgPXFTKIT
	HQa3B40AxKOVtMpl+jQ8+uCT2E5OXSJUBdGymXRhoY1eEFeu7l+/Dthq
X-Gm-Gg: AYBFou1dZX64GZWFBDb9mgpMF3lvEtie0wMdKyDvch1VaaU/lJf73HowXIJgh9EFy7S
	+hKApGlG8b47SPl58qJSGhOM/McXy/WXqAZSfPxkd4plLKo3nQsvzpNxJTtckRMoZcKMZGnuq5M
	4CJEuoSCdMOTrMyISm61sVxpCkwz2vnYPRYDP/movhptvr6yO/KqLs28L2lGJdtokpfgHaJdDzm
	rIxhUKgKMOHzhh5PAdHT4tyY52hCB/x8pNTKkffU19GIO1oGw0MwqqBtaspyxlASql8Y2gTKhWu
	oBtW1hdKsVG4HZprgiwPdVBtApvJ2+kqbvkpapjztXT/xC8WgrRKiIjaks3SG0h6r1N2nbfAeRk
	yQRPXWPvJwlYYTsxxq5dIMKbIZPC0zbHG/GI3uYMORerbtivPJYf9yL2txqRU7o5O8gbB3xrT/P
	am6AqC1M12SAnyILyJA//7KnsoYaDHZOtMwksTykcRQumCqqhJbcXSLAHHyRQQu7NcrOUc+8Npm
	muEmMr11DpbxUaR5Q7B992BuIMrZ3xICofsLVca59AcHMIcW32VmDIlBgrKIZ8ePyaGz+Tb/vz1
	zWJPMlG8rQw=
X-Received: by 2002:a05:6102:f8b:b0:7c8:3b8c:82ba with SMTP id ada2fe7eead31-7d03a5ee504mr404653137.32.1793147230250;
        Tue, 27 Oct 2026 17:27:10 -0700 (PDT)
Received: from bridge.. ([2804:14d:ba6b:8339:260a:a9d6:ce02:aaa8])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7cea3c3b00fsm4156770137.5.2026.10.27.17.27.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 17:27:09 -0700 (PDT)
From: Christian Aurich Zanettini Martins <christian.aurichzm@gmail.com>
To: linux-nvme@lists.infradead.org
Cc: kbusch@kernel.org,
	axboe@kernel.dk,
	hch@lst.de,
	sagi@grimberg.me,
	hare@kernel.org,
	sgogte@purestorage.com,
	wagi@kernel.org,
	linux-kernel@vger.kernel.org,
	Christian Aurich Zanettini Martins <christian.aurichzm@gmail.com>
Subject: [PATCH] nvme-tcp: fix NULL queue->ctrl dereference on reconnect
Date: Tue, 27 Oct 2026 21:26:54 -0300
Message-ID: <20261028002654.1077190-1-christian.aurichzm@gmail.com>
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
the connection (ctrl, pf_cache_lock and both digests) and call it for
every queue when allocating the controller. Such requests are then
requeued like on any other queue that is not live.

Fixes: 61b0ed3be81b ("nvme-tcp: parallelize I/O queue allocation and startup")
Suggested-by: Keith Busch <kbusch@kernel.org>
Signed-off-by: Christian Aurich Zanettini Martins <christian.aurichzm@gmail.com>
---
Keith suggested the helper when applying "nvme-tcp: fix request PDU
size when header digest is enabled". Based on nvme-7.4 (9afc1b71d963)
with that patch on top.

Reproduced in QEMU with nvmet-tcp over loopback and
CONFIG_NVME_MULTIPATH=n: connect with attr_qid_max=2, keep direct reads
running on the CPUs that map to the new hw queues, then raise
attr_qid_max to 4. Before the patch the host oopsed as above within two
tries in each of three boots; after it, 8 of 8 tries went live. Digest
I/O, the 2 to 4 queue grow and 30 resets under I/O also pass, and the
grow and reset runs are clean with lockdep enabled.

 drivers/nvme/host/tcp.c | 31 ++++++++++++++++++-------------
 1 file changed, 18 insertions(+), 13 deletions(-)

diff --git a/drivers/nvme/host/tcp.c b/drivers/nvme/host/tcp.c
index 191e5811d25e..46816a9fb2bf 100644
--- a/drivers/nvme/host/tcp.c
+++ b/drivers/nvme/host/tcp.c
@@ -1977,6 +1977,22 @@ static int nvme_tcp_start_tls(struct nvme_ctrl *nctrl,
 	return ret;
 }
 
+/*
+ * The I/O tag set is allocated, and grown on reconnect, before the queues are
+ * connected, so blk-mq can initialize requests on a queue, and dispatch to it,
+ * before nvme_tcp_alloc_queue() has run for it. Set up the fields that do not
+ * depend on the connection once, when allocating the controller.
+ */
+static void nvme_tcp_init_queue(struct nvme_tcp_ctrl *ctrl, int qid)
+{
+	struct nvme_tcp_queue *queue = &ctrl->queues[qid];
+
+	queue->ctrl = ctrl;
+	mutex_init(&queue->pf_cache_lock);
+	queue->hdr_digest = ctrl->ctrl.opts->hdr_digest;
+	queue->data_digest = ctrl->ctrl.opts->data_digest;
+}
+
 static int nvme_tcp_alloc_queue(struct nvme_ctrl *nctrl, int qid,
 				key_serial_t pskid)
 {
@@ -1986,7 +2002,6 @@ static int nvme_tcp_alloc_queue(struct nvme_ctrl *nctrl, int qid,
 	struct file *sock_file;
 
 	mutex_init(&queue->queue_lock);
-	queue->ctrl = ctrl;
 	init_llist_head(&queue->req_list);
 	INIT_LIST_HEAD(&queue->send_list);
 	mutex_init(&queue->send_mutex);
@@ -2079,8 +2094,6 @@ static int nvme_tcp_alloc_queue(struct nvme_ctrl *nctrl, int qid,
 		}
 	}
 
-	queue->data_digest = nctrl->opts->data_digest;
-
 	rcv_pdu_size = sizeof(struct nvme_tcp_rsp_pdu) +
 			nvme_tcp_hdgst_len(queue);
 	queue->pdu = kmalloc(rcv_pdu_size, GFP_KERNEL);
@@ -3225,16 +3238,8 @@ static struct nvme_tcp_ctrl *nvme_tcp_alloc_ctrl(struct device *dev,
 		goto out_free_ctrl;
 	}
 
-	/*
-	 * The I/O tag set is allocated before the I/O queues, and initializing
-	 * its requests already allocates the PDUs from the page frag caches of
-	 * the queues, sized by their header digest setting, so set up the
-	 * locks and hdr_digest here.
-	 */
-	for (i = 0; i < ctrl->ctrl.queue_count; i++) {
-		mutex_init(&ctrl->queues[i].pf_cache_lock);
-		ctrl->queues[i].hdr_digest = opts->hdr_digest;
-	}
+	for (i = 0; i < ctrl->ctrl.queue_count; i++)
+		nvme_tcp_init_queue(ctrl, i);
 
 	ctrl->net = get_net(current->nsproxy->net_ns);
 
-- 
2.43.0

