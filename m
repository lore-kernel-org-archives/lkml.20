Received: from mail-pf1-f228.google.com (mail-pf1-f228.google.com [209.85.210.228])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35E90577E40
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 15:59:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.228
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788969570; cv=none; b=IG31yHW9sm3SfpxQ8YA0/7cwI7L8sgOlk1fz2KBvVgsJujIkvhNMN2d5MvIHRGa0B1xRr5A2cWZkJbjL9d4T7k7P+sUHl0JI6gHAwtXD56WEhZumdctC9fUR/k59DtYGd2m12uSy72DwY7nuBqPThtve4W6qhWj9+WlR8JsTm6k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788969570; c=relaxed/simple;
	bh=bEvi/DEoVPBnBzRmjBL5T1wZVH3yYVUQrrL2S5FKD7I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=adr8EXglSR3LTEjT0wg+NWKQxipH25sRDzh7gA9noLwj9NLgbx8NlOkNPRyv9zOumvsxzMJTH2XYW3iqbHbOiAazD9ej1OznpQoZu3ATKcgV3vP19TOj/6YhIUmAo1uEvWc7cSFBPDAn7bMhiy0PMx538qJQapc5WRz0DQ99tA8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com; spf=pass smtp.mailfrom=purestorage.com; dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b=aqbousLQ; arc=none smtp.client-ip=209.85.210.228
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=purestorage.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b="aqbousLQ"
Received: by mail-pf1-f228.google.com with SMTP id d2e1a72fcca58-851d4de33a3so57832b3a.2
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 08:59:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=purestorage.com; s=google2022; t=1788969568; x=1789574368; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=i/dqMqkRLXLgOf/iN7bfg+WtTxgpBe43DRYOg5f23zY=;
        b=aqbousLQnASyesH09S41Dyl7emS5lAbvtd8XpMpsSozZwcZvfs2Hz3P9OcSr4Btr3l
         LydVgT7raO2n/bB6k1d5swHFyfEacTjkmjZEWXbteSODN7g+7FB8u0p2WZxkpwh/0oyW
         RaypetFSz2GB9tMQ/IdNyRmByL297FJDPI3fwsXzP0k3xukhS94KaUHakjdNkVM84a16
         I7XEaeAOYpxOorpBkO5v/CWd40vl7SazFcLKIfUDK7vWAuiFCUH1HEjE4L871+q+A3Zo
         fSyHxSKNUKKrLpT8GNuphyUvLJT2ZgbZ/XC71oyW8snKPtYh6wsWA6aWl/1CFocTMinK
         sN3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788969568; x=1789574368;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=i/dqMqkRLXLgOf/iN7bfg+WtTxgpBe43DRYOg5f23zY=;
        b=cJRXu8g+UYX8RDToL747SiAXNYPjD1IZloIHyIEqT0WyxnKYL07CHUPeS+mKD/MWS1
         ZvNRnHasF5WwGk2XHFo33XiZX7EgnKKD+oe8mqSfaT1NeulkvlgmG2pAbGH7EX94kfdQ
         G3EMcwM7elSltNrAbZpoMPEns+htrQVHqnbsk1Prf5WySutgqGYJUm9HF402vdtRBt39
         xlSqyv1f+JQnD/IbRN3wLEwgImC/QWsmfCQumgzs5T964o1M8C7WEUFYv3jqqkO3U5oB
         3QlmaLz0Tov0f0iXTiYim8FyeLeR/gbg5WmLiXPY/nmYnpO+O7rEseYDzjxhh6rOO4zg
         TRBg==
X-Forwarded-Encrypted: i=1; AKwUvByY83uWbL2nEhds9NYq26/XzvJvIe7p9rlwZTwARlmlSYZ0e/bQ085uw/CLN1XnFmeFj2UxtZ4N3MSjans=@vger.kernel.org
X-Gm-Message-State: AFuF++ksfZpxsw0QMyBGRjqvuGnJpW0FDp6h+4OB0ogBjnSJ8M5ZRBHw
	NRFCMdCtYv+DO4iS9QN0uFEZ6qfcD8SLiGskhd643Z07vpZMdUW8//XkvgGx23SvGMtiOj6mdKO
	8zdGtx5OjnCL//75rshMR6jNTwBOhUVJZEVSjQQYFhs7nMSeIcRjh
X-Gm-Gg: AYBFou0CecRpDTCSUHdhGt3bz9jY8kGOICB0TTkd7sJByH/eM2vRN30WxAN/O1XgOdq
	iUVWW4bYdG3R+cuXN+cAyXLdqcKdVz+ewgJnAjaZ59Ea6rP8/OTencaef0ZG0qY63yRyLaDWJAU
	QncXgFQ66Rg11G69pwvlRYQHgG7Gy9FLxSjz+AgNwoceM4kjdIFDa/1o972miRr/9gQcMWJcqQH
	BtLRnK9m1P4/UHc43IahcuVbMpli5dGLSeZC5YGBYDjJOUQEqp0ZwkEo/I1j7Z+v6XDmxRA50vo
	6Keumdz4u+3fwlKcPgQyUJJdLzljfK2n1oqLJmfAe+kTYx3mYk5gXSNHHB2QyLDQrClXrnwXts2
	XcM6EOxSeBEwCnKyYbg==
X-Received: by 2002:a05:6a00:7186:b0:869:2a17:bd35 with SMTP id d2e1a72fcca58-8692a2706b3mr1512386b3a.3.1788969568156;
        Wed, 09 Sep 2026 08:59:28 -0700 (PDT)
Received: from c7-smtp-2026.dev.purestorage.com ([2620:125:9017:12:36:3:6:0])
        by smtp-relay.gmail.com with ESMTPS id d2e1a72fcca58-8652a30058bsm2816265b3a.8.2026.09.09.08.59.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 08:59:28 -0700 (PDT)
X-Relaying-Domain: purestorage.com
Received: from dev-csander.dev.purestorage.com (dev-csander.dev.purestorage.com [10.112.12.104])
	by c7-smtp-2026.dev.purestorage.com (Postfix) with ESMTP id 5FD82402B4;
	Wed,  9 Sep 2026 09:59:27 -0600 (MDT)
Received: by dev-csander.dev.purestorage.com (Postfix, from userid 1557716354)
	id 5A45BE4026F; Wed,  9 Sep 2026 09:59:27 -0600 (MDT)
From: Caleb Sander Mateos <csander@purestorage.com>
To: Jens Axboe <axboe@kernel.dk>,
	Keith Busch <kbusch@kernel.org>,
	Christoph Hellwig <hch@lst.de>,
	Sagi Grimberg <sagi@grimberg.me>
Cc: Joanne Koong <joannelkoong@gmail.com>,
	Ming Lei <tom.leiming@gmail.com>,
	io-uring@vger.kernel.org,
	linux-nvme@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Caleb Sander Mateos <csander@purestorage.com>
Subject: [PATCH v3 3/3] nvme/ioctl: call io_uring_cmd_set_res32() in ->end_io()
Date: Wed,  9 Sep 2026 09:58:48 -0600
Message-ID: <20260909155848.2069290-4-csander@purestorage.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260909155848.2069290-1-csander@purestorage.com>
References: <20260909155848.2069290-1-csander@purestorage.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

io_uring_cmd_set_res32() only performs loads and stores to the io_uring
request state, so it's safe to call in interrupt context. Move the call
from the nvme_uring_task_cb() task work to nvme_uring_cmd_end_io(). This
unifies the 2 places setting the NVMe status and result on the uring_cmd
and removes the need to pass them through struct nvme_uring_cmd_pdu,
saving 16 bytes and a couple memory accesses.

Signed-off-by: Caleb Sander Mateos <csander@purestorage.com>
---
 drivers/nvme/host/ioctl.c | 19 +++++++++----------
 1 file changed, 9 insertions(+), 10 deletions(-)

diff --git a/drivers/nvme/host/ioctl.c b/drivers/nvme/host/ioctl.c
index 6539d4750098..3aa5d2f2dfbb 100644
--- a/drivers/nvme/host/ioctl.c
+++ b/drivers/nvme/host/ioctl.c
@@ -421,12 +421,10 @@ struct nvme_uring_data {
  * Expect build errors if this grows larger than that.
  */
 struct nvme_uring_cmd_pdu {
 	struct request *req;
 	struct bio *bio;
-	u64 result;
-	int status;
 };
 
 static inline struct nvme_uring_cmd_pdu *nvme_uring_cmd_pdu(
 		struct io_uring_cmd *ioucmd)
 {
@@ -438,29 +436,30 @@ static void nvme_uring_task_cb(struct io_tw_req tw_req, io_tw_token_t tw)
 	struct io_uring_cmd *ioucmd = io_uring_cmd_from_tw(tw_req);
 	struct nvme_uring_cmd_pdu *pdu = nvme_uring_cmd_pdu(ioucmd);
 
 	if (pdu->bio)
 		blk_rq_unmap_user(pdu->bio);
-	io_uring_cmd_done32(ioucmd, pdu->status, pdu->result,
-			    IO_URING_CMD_TASK_WORK_ISSUE_FLAGS);
+	__io_uring_cmd_done(ioucmd, IO_URING_CMD_TASK_WORK_ISSUE_FLAGS);
 }
 
 static enum rq_end_io_ret nvme_uring_cmd_end_io(struct request *req,
 						blk_status_t err,
 						const struct io_comp_batch *iob)
 {
 	struct io_uring_cmd *ioucmd = req->end_io_data;
 	struct nvme_uring_cmd_pdu *pdu = nvme_uring_cmd_pdu(ioucmd);
+	u64 result = le64_to_cpu(nvme_req(req)->result.u64);
+	int status;
 
 	if (nvme_req(req)->flags & NVME_REQ_CANCELLED) {
-		pdu->status = -EINTR;
+		status = -EINTR;
 	} else {
-		pdu->status = nvme_req(req)->status;
-		if (!pdu->status)
-			pdu->status = blk_status_to_errno(err);
+		status = nvme_req(req)->status;
+		if (!status)
+			status = blk_status_to_errno(err);
 	}
-	pdu->result = le64_to_cpu(nvme_req(req)->result.u64);
+	io_uring_cmd_set_res32(ioucmd, status, result);
 
 	/*
 	 * For IOPOLL, check if this completion is happening in the context
 	 * of the same io_ring that owns the request (local context). If so,
 	 * we can complete inline without task_work overhead. Otherwise, we
@@ -469,11 +468,11 @@ static enum rq_end_io_ret nvme_uring_cmd_end_io(struct request *req,
 	 */
 	if (blk_rq_is_poll(req) && iob &&
 	    iob->poll_ctx == io_uring_cmd_ctx_handle(ioucmd)) {
 		if (pdu->bio)
 			blk_rq_unmap_user(pdu->bio);
-		io_uring_cmd_done32(ioucmd, pdu->status, pdu->result, 0);
+		__io_uring_cmd_done(ioucmd, 0);
 	} else {
 		io_uring_cmd_do_in_task_lazy(ioucmd, nvme_uring_task_cb);
 	}
 	return RQ_END_IO_FREE;
 }
-- 
2.55.0

