Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 947A33DD866
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 15:38:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790609904; cv=none; b=dJqeCORO/r/MgyQGhLaAIgjiRZEDrMfsSOcBwM4ZyWhnE6kmVBz/9gciv4V72pLCSIqhEIFTVskaOiBlU5k8bbGuCPu4PtUwFqUcogBpxUpigFonXNL/9NHcqTyMKJaJYIimCCbG3Ify+dd0ZQMY/0TkfzuXNdPoSQgzEZ3zh7o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790609904; c=relaxed/simple;
	bh=XhEbxzOTRkAmA5AexQM2CcjEUVdr2JxncxkriFM2HX0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=pWLZ08PaM6J0rfHFiQ2kkOsGjJ+hl26xkvGzUlPEWjY8feOW3oll2WfIIGcHRHrm8b6m+i9EojO9O9xgRGCthJ48/5o0E7BySyGnJo6O0VLGshXA3+K/M4IO8J4whTB4aF1/EA1hUfUA3459yp9NUIfBp5ur06OUmGWwddp4L20=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=isslab.korea.ac.kr; spf=none smtp.mailfrom=isslab.korea.ac.kr; dkim=pass (2048-bit key) header.d=isslab-korea-ac-kr.20251104.gappssmtp.com header.i=@isslab-korea-ac-kr.20251104.gappssmtp.com header.b=s9qKBBN0; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=isslab-korea-ac-kr.20251104.gappssmtp.com header.i=@isslab-korea-ac-kr.20251104.gappssmtp.com header.b="s9qKBBN0"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2dd1dcdcf95so14994495ad.1
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 08:38:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=isslab-korea-ac-kr.20251104.gappssmtp.com; s=20251104; t=1790609900; x=1791214700; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=XBU2jM7DrC1QbY7mAZYFQZnTdG21byzKYq2Cu4WLBZU=;
        b=s9qKBBN0P5zcG5NxoFfmNpEfVwphwCsncEedOTPag7aJzDILn5m5itkvczaXAib0cL
         jA3TFPk07PbKNrbAHs12Z6ISAmsizc0hQoE4oqZMW7y9Of8vDTfrVhk4SG4mx39VLPdU
         5cPYqvx2oy4Ki2YDLhxbLxd1QQNUYamsFBBwaVqiKtalhKPG4QF046LWh8B6b3DA08FZ
         au19WPsKQHlYNYlZEMKG04pCJOXjBo8/nUg+f/RlFE0gJx6OBGFBjb3DZWvQWlBx0HqR
         k7kexMJOwuVWWjLsIPHOH6KKF8Di0cDTZ+COl8/uYstdDvWOQKwA5LqoV/NDpHlpBWdE
         2aQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790609900; x=1791214700;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XBU2jM7DrC1QbY7mAZYFQZnTdG21byzKYq2Cu4WLBZU=;
        b=UHQ0q+EBKybaAT4JUXcEXf3be0WQBPT4QkQB3yb4FljhdmEqAZUc3SGQrmV8pbkyxX
         jK0S3n4jrT0t84v5LXkna5xOP0/fSSZ1SeWeZyl8GIoLtxVgmC9xqHYTt65ertkTfFDz
         +yHhrW2NqQW8aZ8FeZmYDFFtSp/ytx+i+TQikkTqQLQ/kZot9zUkRRsX//rYwhjczQtJ
         MJi5umZ9cri8cflqYhkSyb+x/+C2ezZl164zHBA+Gwjmj61Z2FKhu/qBKsDTPHoNdxl8
         rYl0hEVHRgkpY7dI/+3gJajIROEjlIN5YJCVGku5HtbtSLqub/6OjePWLHUwNd/FW9Di
         0sxQ==
X-Gm-Message-State: AFq9FYK+uxzWN558IRE0ULFSYCmTtTnBQt/I2i9dLg5HrrFFCmtogvBT
	60ODMPCST/6etc4oxyrio41MBPaoZPKViVKGL/wWzHEfg19mL0r1SSoyFfvSbMI3Lgc=
X-Gm-Gg: AYBFou1ialvVJ3nxhrYLShVSNDqK3Jk1FH3kyWTjicmJlpuEmls2f4gE+Le9znfrOqD
	2rd86OKsr1DpuEiNdmpeSHculHHrdtFy8d7yQ8PpD06v+j2b2PWYxLawzXhfv9b2lGI1Y6nzqEW
	4vAH3MkW0cL6t5uoCuEZTJUwjBFL2Eu51e097tSNLoS++kU47rJdPEW02zb/4wrYwx5IQCqNHcP
	kuPcuEX2g/4X4nT7zf0yu+Vqu+8yKuZLT8+LaBxyirNXsH3DQ273bGAazo9pFjc13yfEV5eU9tu
	w1ZxVojp1ra3zAif7u1JQXzhCsxQF7lAPHBB7WhB+mhC/GkPaUWhKDzFU6UVI71fUP/TzUbsFal
	clyZbnUN0a8njPwO1iBkifYgV2MgT2BWu0m3CyQQ8bGiFDKtw6FfrYkOLAT9NGVZ4umt/V/1WkR
	FdwEEUluitElRv2nc0+Gq/mXDxF089mIynT2PNeOGf43pCK5s0p83VdZVDWt+c1s3flvfsNub6m
	ZF/NdaOj3JUCtVJrsOrBQ==
X-Received: by 2002:a17:902:ebca:b0:2df:9e2d:8629 with SMTP id d9443c01a7336-2df9e2d8cf3mr52153435ad.16.1790609900356;
        Mon, 28 Sep 2026 08:38:20 -0700 (PDT)
Received: from yhlee-960QFG.Davolink ([2406:5900:1044:110c:d08e:5326:b1b4:da35])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2df90fbc951sm44209335ad.8.2026.09.28.08.38.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 08:38:19 -0700 (PDT)
From: Yehyeong Lee <yhlee@isslab.korea.ac.kr>
To: linux-nvme@lists.infradead.org,
	Keith Busch <kbusch@kernel.org>,
	Christoph Hellwig <hch@lst.de>,
	Sagi Grimberg <sagi@grimberg.me>,
	Jens Axboe <axboe@kernel.dk>
Cc: linux-kernel@vger.kernel.org,
	Yehyeong Lee <yhlee@isslab.korea.ac.kr>,
	stable@vger.kernel.org
Subject: [PATCH] nvme-rdma: don't complete a request after a bogus remote invalidation
Date: Tue, 29 Sep 2026 00:38:11 +0900
Message-ID: <20260928153811.1466359-1-yhlee@isslab.korea.ac.kr>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When a remote invalidation names an rkey that is not the one we handed out
for this request, nvme_rdma_process_nvme_rsp() logs and schedules error
recovery, then falls through to nvme_rdma_end_request().  The request is
completed with req->mr never invalidated, and nvme_rdma_unmap_data() hands
it back with ib_mr_pool_put(), which only puts it on a list.  The rkey
stays valid and still maps the pages the completed read filled, so a
controller that sent the bogus invalidation can write into those pages
after pread() has returned.

Return instead, the way the local invalidation path below already does,
and leave the request for error recovery to cancel.

Fixes: 3ef0279bb0031 ("nvme-rdma: Check remotely invalidated rkey matches our expected rkey")
Cc: stable@vger.kernel.org
Signed-off-by: Yehyeong Lee <yhlee@isslab.korea.ac.kr>
---
Reproduced on soft-RoCE (rxe), two nodes.  The target is modified to answer
one request with the rkey of another request that is still in flight, and
then to write 0xBD through the rkey the initiator has just reported as
bogus.  The NVMETHOSTILE lines are that scaffolding and are not part of
this patch.  The namespace holds 0x5A and the reader re-checks its buffer
after pread() has returned.

initiator:
  nvme nvme0: Bogus remote invalidation for rkey 0x35f4
target:
  nvmet_rdma: NVMETHOSTILE forcewr POST LEAKED rkey=0x35f4 addr=0xffff88807ffdd000 len=4096 ret=0 n=1
  nvmet_rdma: NVMETHOSTILE forcewr DONE ACCEPTED n=1
initiator:
  BCHECK[B] CORRUPT iter=350 poll=0ms pre_clean=1 off=0 p1_bytes=4096 p0_bytes=61440
  BCHECK[B] DONE iters=392 clean_p0=392 ioerr=0 CORRUPT_HITS=1 POST_COMPLETION=1

pre_clean=1 is the buffer intact at the instant pread() returned, and
p0_bytes=61440 is the remainder of it still holding 0x5A.  0x35f4 is the
rkey the initiator reported as bogus and the rkey the target then wrote
through.  With this patch POST_COMPLETION stayed 0 over five runs.

It is a race, so it is probabilistic rather than reliable, and every bogus
invalidation also trips error recovery, so the corruption arrives together
with a controller reset.  I only have rxe here; I have not checked how a
real RoCE HCA responder treats a write through an MR the ULP has stopped
using.  What I saw is an integrity violation on a buffer that is still
mapped, not a use-after-free.

Invalidating the MR locally before completing the request, which is what
the code did before 3ef0279bb0031, also closes it and is the other way to
go here.

 drivers/nvme/host/rdma.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/nvme/host/rdma.c b/drivers/nvme/host/rdma.c
index 9cb811a2ce1f7..5b9b540693b51 100644
--- a/drivers/nvme/host/rdma.c
+++ b/drivers/nvme/host/rdma.c
@@ -1748,6 +1748,7 @@ static void nvme_rdma_process_nvme_rsp(struct nvme_rdma_queue *queue,
 				"Bogus remote invalidation for rkey %#x\n",
 				req->mr ? req->mr->rkey : 0);
 			nvme_rdma_error_recovery(queue->ctrl);
+			return;
 		}
 	} else if (req->mr) {
 		int ret;
-- 
2.43.0

