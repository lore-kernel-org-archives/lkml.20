Received: from out30-112.freemail.mail.aliyun.com (out30-112.freemail.mail.aliyun.com [115.124.30.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAD283B3BF2
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 09:21:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.112
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788427319; cv=none; b=bFpGuY2uRBUC/7RKpOH+Ff6eIYHJcZC5N1gZtm9PTKHwtD5YiCSfYX5bXXOROb8grE+vWqL6VJXIsuLOPg4FsdZjBeMAK/CNczCXMNU4ZxvLIioLLVL9Vvyt+hJ6HkvoYlNZdegdPqp8n/UWoPTyioTYajZijDh13WMfPuustw0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788427319; c=relaxed/simple;
	bh=prQclw0BwLJt7CrgxvK1TPTxE24h/szC7g+QzEWgwYg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=hAmab+YSspfbQgDG8tqB/ATk2f+xsidwz22tCpk8/gKimUnL6Q07J9NanGwwo4uMQWQrTLdIYRe/cizPepZaz423Th6zt/7HTJLSRvuMEpIBI0YqD19MncYLmEbvcV3VE/XRztjz51dTu5kOeYBCeX2iIoy8STE9J4yemqs/wX4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=qz5FEF1C; arc=none smtp.client-ip=115.124.30.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="qz5FEF1C"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1788427313; h=From:To:Subject:Date:Message-ID:Content-Type:MIME-Version;
	bh=CBxetM8Kk2Bnt4sFsfcKSYEvEp6Vx8ejB37+3DF4GfE=;
	b=qz5FEF1Cfa+F+nMJD3IUuUZFjY++f8JOzl0MKyV70zSKqNxBlLuK/1pJQpM7sWx89roHgt0FlrSu8oPN76w4qCgrHhVh6Lyf9M6JCQqFOHa5jOv9yKXEKNi5F/lYf1LctvEB1ZzZO70gtj9HnHWXNTCdaiRIaE9ckXKycZccAWY=
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R191e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam011083073210;MF=chuyf26@linux.alibaba.com;NM=1;PH=DS;RN=8;SR=0;TI=SMTPD_---0XAFYvCO_1788427311;
Received: from x31j07255.sqa.na131(mailfrom:Chuyf26@linux.alibaba.com fp:SMTPD_---0XAFYvCO_1788427311 cluster:ay36)
          by smtp.aliyun-inc.com;
          Thu, 03 Sep 2026 17:21:52 +0800
From: Yifei Chu <Chuyf26@linux.alibaba.com>
To: kbusch@kernel.org
Cc: axboe@kernel.dk, hch@lst.de, sagi@grimberg.me, roys@lightbitslabs.com,
 yhlee@isslab.korea.ac.kr, linux-nvme@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v2] nvme-tcp: reject C2HData for a non-read command
Date: Thu, 03 Sep 2026 17:20:01 +0800
Message-ID: <178842720109.1034236.7954869548413684234@linux.alibaba.com>
In-Reply-To: <0a6b07e8-3ea6-4458-95eb-4a63b6108823@grimberg.me>
References: <178730451245.442148.11684394617763960186@linux.alibaba.com>
 <20260822014037.1978918-1-yhlee@isslab.korea.ac.kr>
 <0a6b07e8-3ea6-4458-95eb-4a63b6108823@grimberg.me>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

A malicious or buggy controller can send C2HData PDUs in response to a
WRITE command.  nvme_tcp_handle_c2h_data() accepts them as long as the
request has payload bytes and a current bio, which is true for writes,
so the receive path ends up copying the incoming data into the
request's iterator.  That iterator was initialized from rq_data_dir(rq)
in nvme_tcp_init_iter(), i.e. ITER_SOURCE for a write, and
_copy_to_iter() refuses to copy into a source iterator: it triggers its
WARN_ON_ONCE() and returns 0, the short copy fails with -EFAULT, and
the connection is torn down into error recovery.  The write never
completes: every reconnect reissues it and a malicious target answers
with C2HData again, keeping the controller in a permanent
reset/reconnect loop.  With panic_on_warn this is an outright crash.

C2HData carries data transferred from the controller to the host and
is only valid for commands that read data from the device; write data
travels host to controller in H2CData PDUs solicited by R2T.  This was
reproduced against a target modified to reply to a WRITE with C2HData:
the host logs

    WARNING: CPU: 0 PID: ... at lib/iov_iter.c _copy_to_iter
    Workqueue: nvme_tcp_wq nvme_tcp_io_work [nvme_tcp]

and the controller cycles through reset/reconnect without the write
ever completing.

Reject C2HData for any non-read command.  This is the symmetric case
of commit 6efbc52237fa ("nvme-tcp: fix host memory disclosure on R2T
for a read command"), which added the mirror-image direction check to
nvme_tcp_handle_r2t().

Fixes: 3f2304f8c6d6 ("nvme-tcp: add NVMe over TCP host driver")
Cc: stable@vger.kernel.org
Reported-by: Abaci <abaci@linux.alibaba.com>
Assisted-by: abaci:qwen3.8-max
Signed-off-by: Yifei Chu <Chuyf26@linux.alibaba.com>
---
v2: move the direction check before the req assignment (Sagi).
    Keep -EPROTO (Sagi: "EPROTO is more appropriate").

 drivers/nvme/host/tcp.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/nvme/host/tcp.c b/drivers/nvme/host/tcp.c
index 5fda966..60d7c37 100644
--- a/drivers/nvme/host/tcp.c
+++ b/drivers/nvme/host/tcp.c
@@ -684,6 +684,13 @@ static int nvme_tcp_handle_c2h_data(struct nvme_tcp_queu=
e *queue,
 		return -ENOENT;
 	}
=20
+	if (unlikely(rq_data_dir(rq) !=3D READ)) {
+		dev_err(queue->ctrl->ctrl.device,
+			"req %d unexpected c2hdata for a non-read command\n",
+			rq->tag);
+		return -EPROTO;
+	}
+
 	req =3D blk_mq_rq_to_pdu(rq);
 	if (!blk_rq_payload_bytes(rq) || !req->curr_bio || !req->data_len) {
 		dev_err(queue->ctrl->ctrl.device,
--=20
2.43.5
