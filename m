Received: from mail-pj1-f97.google.com (mail-pj1-f97.google.com [209.85.216.97])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBC06318ED6
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 22:57:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.97
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788389842; cv=none; b=tBS96OJ3LwfQjZSHiBumUBCmpbwDZGzl6Sn6dcIzPqykNru1Me8FuN6LfOp52H1T08ohJvsNa8b5v8XQoMjVU2DVxyrHmkixW6GW1LZFvEvsWMxpEtzH0g+qIswDzkehydCwCq2VnRM9sFt+kzSdQ/GOK+HeMYhmq3h4C9tz11I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788389842; c=relaxed/simple;
	bh=bEvi/DEoVPBnBzRmjBL5T1wZVH3yYVUQrrL2S5FKD7I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=i1xzsPgcDE+rQ6lQVAhPg1pUvl/JjspSX8yTJXFwd9vYphZynp0fWOnHeotmzZBm3pQYRSkrnFJcnjP3s9Uwzw2+x3YejBnfPbxH4bKZJqfr5q/6vj5oOyUS1L/8JidAVI+vI+5VXSu2dzzHfHI81zvhbz10lyJdFiiM2RxD6oo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com; spf=pass smtp.mailfrom=purestorage.com; dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b=HcWt5kM3; arc=none smtp.client-ip=209.85.216.97
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=purestorage.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b="HcWt5kM3"
Received: by mail-pj1-f97.google.com with SMTP id 98e67ed59e1d1-398b9f77e03so214152a91.0
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 15:57:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=purestorage.com; s=google2022; t=1788389834; x=1788994634; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=i/dqMqkRLXLgOf/iN7bfg+WtTxgpBe43DRYOg5f23zY=;
        b=HcWt5kM32WJql329Rbi6Vdcrp4krDm5BWR4DoVInroEgyqhqJOPaI4fP025MytzRrO
         CwPQkkPce/0Hosv9xprmX4/X7dIEed9dgCX2o50qjoXO+S4ig87/z8kUMTk60X7J2kUy
         F4SgengeQJ65hClX2ADLKxhFMblNcqXwPDOrhbcDtYkRjhjkR/iHzcrqaNrba5ATTBY2
         Im+0+SSXlhZJ9BTHqGSduzdBUMZi3x5H9fRGAy4mcPhQDhXshy+6ULtGUAAVCEN94Y+R
         akxO5l4f8QPvFdVZBVDfjp64AxorN7T52QnUndBdj4W2aARdZtbIgzN99WCXFKHHzY7r
         ErLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788389834; x=1788994634;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=i/dqMqkRLXLgOf/iN7bfg+WtTxgpBe43DRYOg5f23zY=;
        b=FJCkzhEs5iEKbllIvKBfx6Ao/j14D6W8m8g7pJvMthOhHAJn1cHilG2Na1BErab4/D
         DM20vvEdcb0ieJLutARVHqHKXeEQDXJu7XPNFET23m1TeP6GFNStDixxetoF7rpphpkl
         POOmDlfpILUzfLRrbt34FOcN04dy4fz/iMhaVH2PlIyNnHR04s/MpiHnzJeFY1B9cPwF
         4X9FDhFUqf/wskbGaSr6HW65gNjS4J4bWiA1LzqoV5bk25C+2uomgj0AyjJeLzgossPQ
         xI6010g+h3IeRkzupDwiWkQwWmLFUtED7iwgkasMBXcbx9oIy5GHTj5WaHzfXte59/9V
         EYyw==
X-Forwarded-Encrypted: i=1; AKwUvBwZ0F6GMdTl+3dcfpi8XRR+UcorQUQmynC7LvIAFChp849uLZe1CSfbLUaEvw4RMyGpqH8nbeabshNH6OQ=@vger.kernel.org
X-Gm-Message-State: AFuF++mbr6JaCh2k95UAn+WfsDG3C6tngWeRRXgW6Dx9FxY/ZPT48Vyl
	2VVZzkSLbyLcKyo1R9jOf4Ba5tSpE0G+EGHYTcGyZHC4ZBWuDIv1NlndU9xEe7xKFk8NnSSsyf8
	iYGOCXqWk1PwXlTqsQuAREmlQISP5DL5p1qLwfCVo9TedhtL/Nm9d
X-Gm-Gg: AYBFou1dsA/UxEVOfn+S88b3ATSm6D0CHlxRWuKscjMsiFZFBkrtl5w438yv1QsDjpS
	vwFgB2AvR77P7bj/FoWWAJ+0tak63WnwE4PeEg2OeGaUXsK36V30AGNugl5XtmSz+PNShbw6PBY
	bCXmTYUtPH/g8PYpRTT9sEYNdaL2HmzR9ZinI9QdrpCqm9TUAWfn+wtj7CEIodbufXq77WsUvGQ
	cWbS8CakrFhbUs0Qa5ovd5lp0zzMj4gONXxsDcy+/ABXWzIjXm7Uo1RpXynZu3xwI2jg0C0vVFb
	EXgCGFOadRyYgWB60xWmiB0AILMD+PileP1KI9UP2Ku0r/FeQXATTfV6eMt/S1xc073TNAlWWLF
	QocXeE6Irj0Eao6ig
X-Received: by 2002:a17:90a:e7d1:b0:38e:6d4c:14df with SMTP id 98e67ed59e1d1-39aedec8443mr7525746a91.1.1788389834532;
        Wed, 02 Sep 2026 15:57:14 -0700 (PDT)
Received: from c7-smtp-2026.dev.purestorage.com ([2620:125:9017:12:36:3:6:0])
        by smtp-relay.gmail.com with ESMTPS id 5a478bee46e88-3325680a589sm24784eec.3.2026.09.02.15.57.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 15:57:14 -0700 (PDT)
X-Relaying-Domain: purestorage.com
Received: from dev-csander.dev.purestorage.com (dev-csander.dev.purestorage.com [10.112.12.104])
	by c7-smtp-2026.dev.purestorage.com (Postfix) with ESMTP id A7B4540423;
	Wed,  2 Sep 2026 16:57:13 -0600 (MDT)
Received: by dev-csander.dev.purestorage.com (Postfix, from userid 1557716354)
	id A1AC3E40404; Wed,  2 Sep 2026 16:57:13 -0600 (MDT)
From: Caleb Sander Mateos <csander@purestorage.com>
To: Keith Busch <kbusch@kernel.org>,
	Jens Axboe <axboe@kernel.dk>,
	Christoph Hellwig <hch@lst.de>,
	Sagi Grimberg <sagi@grimberg.me>
Cc: Joanne Koong <joannelkoong@gmail.com>,
	linux-nvme@lists.infradead.org,
	io-uring@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Caleb Sander Mateos <csander@purestorage.com>
Subject: [PATCH v2 2/2] nvme/ioctl: call io_uring_cmd_set_res32() in ->end_io()
Date: Wed,  2 Sep 2026 16:57:08 -0600
Message-ID: <20260902225708.2379840-3-csander@purestorage.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260902225708.2379840-1-csander@purestorage.com>
References: <20260902225708.2379840-1-csander@purestorage.com>
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

