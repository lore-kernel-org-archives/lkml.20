Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793283630;
	b=TLsMTLRWzmSDrZTynEoJMrlSNEthjl8pTUVQbJvOAjjGxlAW10jRLBbvl7TCN/Q/qLIj
	 e1HqboX3ytnRIKrc2enG8ympK9C7Wd86uRlstR1wZy1O+mnyE8ABlTNQ/WuYEVJ1A/aSK
	 soQL6BeBQKHCqpTwshhXHGy5Z7GjVdSMv8s0Y4QdUCNQDyirmTmqTM8BdMFjWHXPdcewc
	 CHjq2k7qMHc/YgQs2fJ4WaVA3fqlJhkTOBK4eJeEzAHIDODpsFyunt8GaLA6OlcqC+Epj
	 OEi6GgmMrSsMIoBPkSI+vLlcbFkEpg1oz34nHd8rcxCGTCY7dzSectd6JjO2tMzR0Vw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793283630;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=CEJgZSOIdMAj6jpTCSnhUIhLpKEk9BtwYmYBUge0rqk=;
	b=hI2GtJzqYh1vJgBu7X6wNZysC0VTFFTM8ls+An9izgeHszNp8D6/HPQShQsAHPP5WIxq
	 72Hpy3Z8S6wNyx8yKgs7/sX86ViV3FKEuB2EG1szi0eQiu6CKf62guXW4AIli+vh3Gc78
	 0HKsCK0lDLVhWdWDotjBm8xt6S0PQ8sM153+WCVBX+c8Nob8FPJDGRpeSjoibsx+q7dhy
	 DJo4voCpgWzAi5YCplp6EzGelheG+/gCJXy/KMfJadWo5MDr9CItrU3rufttdjbv5rxHG
	 6w8Uea99ZzqcBIZ72ZZwlRvlAxo1twntDpH0i4phSYpIEgrQWLgkmiYxkhwwauW0C7w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=AvEAmzU9;
	arc=none smtp.remote-ip=209.85.222.44
Received: from mail-ua1-f44.google.com (mail-ua1-f44.google.com [209.85.222.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C75B7606A326
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 14:20:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C75B7606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=AvEAmzU9
Received: by mail-ua1-f44.google.com with SMTP id a1e0cc1a2514c-99059bdcdeaso652439241.2
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 07:20:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793283629; x=1793888429; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=CEJgZSOIdMAj6jpTCSnhUIhLpKEk9BtwYmYBUge0rqk=;
        b=AvEAmzU9PZa9XvzOFEy1iP/VQZQU8MWIeGOIozABscZyaoQ3Ady4FpocZUkHEyAjF5
         a5UPDnaszexmuN+0ozyTgWu6mQxWrre8q5mQdIX7TqtjfYAH2NJT03zg6n2U4m8qXEcy
         8ALf+tfUkG5zW7h1MlfNkhtZB6OYURePrV/fTrUUjAHRagPcflpmx/la9+CQ9WIbhvA/
         GWdyLbnfmsP41O6VqIowi0PhIcKiosNCVxo88kG8sfi9T1gN7DHvLfP6IZhltgfv4X+8
         9JZzy5rOOGWR2jfGI19ZaoDhiMxAYTmiNTBpw/EyXiknxLoc26yk9gtgFIrfk6o4VsPf
         SyHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793283629; x=1793888429;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CEJgZSOIdMAj6jpTCSnhUIhLpKEk9BtwYmYBUge0rqk=;
        b=eHj3ISIECtHEXFVtfv+PILZRRJfTdtRGME4hb7Yvvh9r12cu8qeRAxx7H0Aagysgf+
         6cTxz9dNXy4+Wwyz+hzBpALqs2euvCTiP/4gMV8oGhmnUhMD1bKcMltZnbJ5KT3xib/Q
         5EE8/kWGoZOdULRQyy/QmNT7RmCF3zWLbvCP5Y5S5rSIkv8cwk8fLiZToknPmCI+ijL6
         L0EJdIU/n8rBXCU3w/edt2CMhH+MNKju2OHutItkvhtUaW+C5JefNtLLNtrMPJ1rTgf9
         kPGOLNHj4iIKxR39nPN9b0SVZGF2UlSZvvDx87IDRpsEJ4Z2Rr1q8rIF7xZTFADp/ljK
         sg3A==
X-Forwarded-Encrypted: i=1; AKwUvBy2sgvQzXcsn3SpI2VjmPbB1sbGV9oz4pAfIIxWpsVac+GzgaVslklsLuX/ygqwWkB2nEnNB1EqmKS5gLo=@vger.kernel.org
X-Gm-Message-State: AFq9FYK1lJDRScO7jt/qF6nxmDSwehlt2jSMJu/6HmZoyRlOkMIN0Rcv
	M1hHv8YpyDkC5HkY7s5YQHr9xe35rqGzBo5EBLy5sc2NSQIp2CGOGGG5
X-Gm-Gg: AYBFou1ZACA+D1hEqw5uH986fyXIM+VPSUzRYjhveQ1QaBeWAuCtsWE6ggxtXfY4kaz
	ACGTD4t0EzIrOiUhT81SYTf5YTf607l4B/fK5wZigk6ipadZOm3zMXKROId4BDq8Rk+ry7+VMfK
	G11Ny2ZvXszvmzS/CuK3xZMmjHIbkmjChI8vvIGQ/ARJCuRuXf9R0ybRzY2FYTPjvcCxFC6Md84
	s7rRoE14sNTN7XoV/AG2m1dFPomkcz6H6GyvIuDBzt6p0zdGvMBMRV8NSkh63sEElD32XBI0V4E
	ZREaTQEgwbNq81rfS6iu80z2UoDPeYhRggjVdizMixBbUHSye1PWGMNzL+5ySH3MPUFqDpmKwvF
	LVbwAF8myCTCMt14e99ZJYf1r1kFVbK/lW9cOj0dIQEqJJvX+VdOzxYOpRBpAInr38xaU8S3z0T
	Ue6kJ/UMjYJsw0WaSb0wBahaqclLX9HwzYyHBksTeMSVNbEy+iepK8sATonQKEhhnI7YjABEml6
	awMoj2TlcwfEAmtnilUbfG/6Rk1LjKk3QX10dMG/ZX6vRSFqIQWXUulfr8Yq6AQ60SqvjRAm6V9
	mAqsPIv8mdY3jji8OYGAd+2bYhfwqiCgzedFN0s=
X-Received: by 2002:a05:6102:6f07:b0:7c3:1d7:f234 with SMTP id ada2fe7eead31-7d03a294a6dmr2037964137.2.1793283628442;
        Thu, 29 Oct 2026 07:20:28 -0700 (PDT)
Received: from bridge.. ([2804:14d:ba6b:8339:e751:b7f8:a4ea:bd70])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-991eaee2e66sm11457241.2.2026.10.29.07.20.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 07:20:26 -0700 (PDT)
From: Christian Aurich Zanettini Martins <christian.aurichzm@gmail.com>
To: linux-nvme@lists.infradead.org
Cc: kbusch@kernel.org,
	axboe@kernel.dk,
	hch@lst.de,
	sagi@grimberg.me,
	sgogte@purestorage.com,
	hare@kernel.org,
	nilay@linux.ibm.com,
	wagi@kernel.org,
	linux-kernel@vger.kernel.org,
	Christian Aurich Zanettini Martins <christian.aurichzm@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH v2] nvme-rdma: fix NULL queue->ctrl dereference on reconnect
Date: Thu, 29 Oct 2026 11:19:57 -0300
Message-ID: <20261029141957.2068907-1-christian.aurichzm@gmail.com>
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

Since commit 2a8513091d2f ("nvme-rdma: parallelize I/O queue allocation
and startup"), a reconnect that gets more I/O queues than before grows
the tag set before the new queues are set up. queue->ctrl is only set
by nvme_rdma_setup_io_queues(), so I/O submitted in between reaches
nvme_rdma_queue_rq() on a queue that was never allocated and
dereferences a NULL queue->ctrl:

  BUG: kernel NULL pointer dereference, address: 000000000000034c
  RIP: 0010:nvme_rdma_queue_rq+0x52/0xb90

Set queue->ctrl for every queue when allocating the controller. Such
requests are then requeued like on any other queue that is not live.

Fixes: 2a8513091d2f ("nvme-rdma: parallelize I/O queue allocation and startup")
Cc: stable@vger.kernel.org
Signed-off-by: Christian Aurich Zanettini Martins <christian.aurichzm@gmail.com>
---
v2:
- Only move queue->ctrl. v1 also moved queue_lock, which needs the
  queue count in nvme_rdma_free_ctrl(), but opts can already be freed
  there when creating the controller fails (KASAN use-after-free on a
  failed connect with CONFIG_DEBUG_KOBJECT_RELEASE).
- Not carrying the Reviewed-by tags from Nilay and Christoph, as most
  of the patch changed

v1: https://lore.kernel.org/linux-nvme/20261029060521.1690223-1-christian.aurichzm@gmail.com/

Based on nvme-7.4 (89480d137bf0), also applies to mainline and v7.3.

Reproduced in QEMU with nvmet-rdma over rxe and
CONFIG_NVME_MULTIPATH=n: connect with attr_qid_max=2, keep direct reads
running on the CPUs that map to the new hw queues, then raise
attr_qid_max to 4. The window is short, so the readers run at
SCHED_FIFO with nvme-wq pinned to their CPUs. Without the patch the
host oopses within two tries in all six boots. With v2, 24 of 24 tries
go live and 30 resets under I/O pass, with and without lockdep, and
failed connects are clean under KASAN.

 drivers/nvme/host/rdma.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/nvme/host/rdma.c b/drivers/nvme/host/rdma.c
index 07216890f75c..32189fdfc0f5 100644
--- a/drivers/nvme/host/rdma.c
+++ b/drivers/nvme/host/rdma.c
@@ -735,7 +735,6 @@ static int nvme_rdma_setup_io_queues(struct nvme_rdma_ctrl *ctrl,
 	for (i = 0; i < nr_queues; i++) {
 		struct nvme_rdma_queue *queue = &ctrl->queues[first + i];
 
-		queue->ctrl = ctrl;
 		queue->queue_size = queue_size;
 
 		ctxs[i].queue = queue;
@@ -798,7 +797,6 @@ static int nvme_rdma_configure_admin_queue(struct nvme_rdma_ctrl *ctrl,
 	bool pi_capable = false;
 	int error;
 
-	ctrl->queues[0].ctrl = ctrl;
 	ctrl->queues[0].queue_size = NVME_AQ_DEPTH;
 	error = nvme_rdma_alloc_queue(&ctrl->queues[0]);
 	if (error)
@@ -2284,7 +2282,7 @@ static struct nvme_rdma_ctrl *nvme_rdma_alloc_ctrl(struct device *dev,
 		struct nvmf_ctrl_options *opts)
 {
 	struct nvme_rdma_ctrl *ctrl;
-	int ret;
+	int ret, i;
 
 	ctrl = kzalloc_obj(*ctrl);
 	if (!ctrl)
@@ -2343,6 +2341,9 @@ static struct nvme_rdma_ctrl *nvme_rdma_alloc_ctrl(struct device *dev,
 	if (!ctrl->queues)
 		goto out_free_ctrl;
 
+	for (i = 0; i < ctrl->ctrl.queue_count; i++)
+		ctrl->queues[i].ctrl = ctrl;
+
 	ret = nvme_init_ctrl(&ctrl->ctrl, dev, &nvme_rdma_ctrl_ops,
 				0 /* no quirks, we're perfect! */);
 	if (ret)

base-commit: 89480d137bf0d943a82c64f86ae2407a15276b5e
-- 
2.43.0

