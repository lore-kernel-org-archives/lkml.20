Received: from mout01.posteo.de (mout01.posteo.de [185.67.36.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E928D3E3C4D
	for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 12:41:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.67.36.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789303267; cv=none; b=DDMxJmGZNTtbqxf9jORpo2jga1OYJ40rrErA1LRJARVEjWcVRqU6/neos3p9s8L8f2fjSeeoHmzD2i1ssMjkyvvQkLvGesnySdJR3YU7A7fZ/oWqKsdvmBGAS/yFunqC5G/R0rv5BpuXHJB8ImhkRclDzfXNNq3iKHX4dYjSafo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789303267; c=relaxed/simple;
	bh=TqvVUMSpxGeiNltUSnqSgc8CQ2Xn/XE362Q+jKCwZCM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=QjRuoS1AFo4VWd5va04B2inSu+cgYxLArbpYLWBq9MDPVTdDA/dcTZbtpGC2rdvVx0ax7CW4jJgzLkUK5hvtXuRWJWYgRGJ6hut3ZkShbn6m0LKL3hfZez606Zsda1ClxuM3UyeEejjDRtF3A/sD4oTmqSHm9QKhNHr4l8D8ZY0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=posteo.net; spf=pass smtp.mailfrom=posteo.net; dkim=pass (2048-bit key) header.d=posteo.net header.i=@posteo.net header.b=mgWMC8jW; arc=none smtp.client-ip=185.67.36.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=posteo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=posteo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=posteo.net header.i=@posteo.net header.b="mgWMC8jW"
Received: from submission (posteo.de [185.67.36.169]) 
	by mout01.posteo.de (Postfix) with ESMTPS id 1CDD8240028
	for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 14:41:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=posteo.net;
	s=1984.8680eb; t=1789303262;
	bh=1T1xM7WvsaSnz4vjGfPeE2GotheQaGRQND+mjnN9Juw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:
	 Content-Transfer-Encoding:From;
	b=mgWMC8jWqV1KQJBg3F+NNXzy66cZ5aXATPlecKHCMLbZ051CkVZaP3CQ3icr7NnXd
	 f4snslPG9QIMMw41nhPoKrWQchHlp3l+rNeDS/zd4pvvx1zpA5AjB7h0vWVDdwivJo
	 1yotGpb/aEeV/maPNek+JPUXMYV+VaQa+bKpFd4iKoF5wjnrMS6zABbMcqxhc5Bb1g
	 /7MbH6U6sbNviAVpd+GoJ9PBHG/RYyE/FpZg4HFHuxKPJPsu/o2giIvsRokeOHprh5
	 L3GdYsk8OQA1cDuiLt5woxRs2pSbLryjy/j68beA2I4NOsu7sHj3qmLw8N/oA7fBCC
	 vrj1tCW/dbaRQ==
Received: from customer (localhost [127.0.0.1])
	by submission (posteo.de) with ESMTPSA id 4hjSZ44614z6tw8;
	Sun, 13 Sep 2026 14:41:00 +0200 (CEST)
From: Mateusz Nowicki <mateusz.nowicki@posteo.net>
To: kbusch@kernel.org,
	axboe@kernel.dk,
	hch@lst.de,
	sagi@grimberg.me
Cc: linux-nvme@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Mateusz Nowicki <mateusz.nowicki@posteo.net>
Subject: [PATCH] nvme: bump genctr when cancelling a request
Date: Sun, 13 Sep 2026 12:41:01 +0000
Message-ID: <20260913124053.86565-1-mateusz.nowicki@posteo.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

nvme_find_rq() rejects a completion whose genctr does not match the
request, so a command completed once cannot be completed again by a
stale CQE. nvme_try_complete_req() bumps genctr for that reason.
nvme_cancel_request() completes the command too, but leaves genctr
alone. A CQE the controller posts for the cancelled command later still
matches and gets applied.

The cancel path is taken when the host stopped waiting for the
controller: CSTS.CFS set (dead path in nvme_dev_disable(), no CC.EN=0,
no wait), or CSTS.RDY not cleared within CAP.TO. Nothing stops the
controller from posting completions after that, and the second
nvme_dev_disable() from nvme_reset_work() reaps them in
nvme_reap_pending_cqes().

The cancelled request sits on the requeue list after the RETRY
disposition. The late CQE ends and frees it from there, and the next
dispatch hits req->mq_hctx == NULL:

  BUG: kernel NULL pointer dereference, address: 0000000000000158
  RIP: nvme_prep_rq+0x1a6
  nvme_queue_rq
  blk_mq_dispatch_rq_list
  __blk_mq_sched_dispatch_requests
  blk_mq_run_work_fn

Bump genctr in nvme_cancel_request() like a real completion does.

Reproduced with vnvme (https://github.com/Mateusz-Nowicki-Embedded/vnvme),
a virtual NVMe endpoint that holds completions back under I/O, sets
CSTS.CFS, and releases them after the tagset was cancelled.

Signed-off-by: Mateusz Nowicki <mateusz.nowicki@posteo.net>
---
 drivers/nvme/host/core.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/nvme/host/core.c b/drivers/nvme/host/core.c
--- a/drivers/nvme/host/core.c
+++ b/drivers/nvme/host/core.c
@@ -532,6 +532,8 @@ bool nvme_cancel_request(struct request *req, void *data)
 	if (blk_mq_rq_state(req) != MQ_RQ_IN_FLIGHT)
 		return true;
 
+	if (!(nvme_req(req)->ctrl->quirks & NVME_QUIRK_SKIP_CID_GEN))
+		nvme_req(req)->genctr++;
 	nvme_req(req)->status = NVME_SC_HOST_ABORTED_CMD;
 	nvme_req(req)->flags |= NVME_REQ_CANCELLED;
 	blk_mq_complete_request(req);
