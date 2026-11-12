Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=45.254.49.197
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794498792;
	b=Uo3qBkpxZV/fEvFawvo56+K/BKrrnuY7DB21F5iTlo0or3gsmx53keNb6yXUGUXKo1yJ
	 xwas26kLoSUV77IyRpDrDZ3agcxHFAtxU3I0kTEwjfYhmxST0syfJDkXyUjG8rnbxlse4
	 qQhx2MWJOv4y2x1907XA5852iqLZuSfOTO5XVNpm48crm90E0qh7ZYNfPV6lTf2PPqe3f
	 4jLmvBFgPARqfNJMbiHdTuxZdHZPNBuzFYaPExKuLxB0UtYKWK64oyFDSre8lle8XjSpx
	 YmC5eUoy4CKNhDlOSD+VjlUMPMBAMspTpBrPJP3kgiutWe9X4IfEG1vjD3Trpf03JeQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794498792;
	h=DMARC-Filter:Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding:X-HM-Tid:X-HM-MType:
	 X-HM-Spam-Status;
	bh=c+np+Xd0I/hXH0zU12ECwbLh7vS9VjIre4LIOHAqNCE=;
	b=GVd89nqMDbo1W5nq2060PVvVyF2DKjjlPWaWCz7Wb5ptB1lFjLeBChH4TozswHliGu8C
	 uHH109PtMPnhrj86NdVg0vJvXDrVH6qHHS89WqQ8wXN49+mc8mJbl4ua32YiSno7ss8+M
	 AnpsuHTI0DJUCXwreHNNdGB3Kqn1EFJDnMRhFTbhTCsphFyh+YXmGWOcvm+z+a9ebtsn6
	 TiR53MtewT2tq3ttjFcQE9Kw7X3kZhqbfpAZAwxV/T5uVsS2qO0ZDBZoKpdg6YtblavVY
	 +NAulJ7xMwJCalNtB9n1tt2ChVdE59pNSySCh1SBC5uJfQB6NXnHUxCExGpGx9VOKtg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=whut.edu.cn;
	spf=pass smtp.mailfrom=whut.edu.cn;
	arc=none smtp.remote-ip=45.254.49.197
Received: from mail-m49197.qiye.163.com (mail-m49197.qiye.163.com [45.254.49.197])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BBBD606A31C
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 15:53:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8BBBD606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=whut.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=whut.edu.cn
Received: from Mogu.localdomain (unknown [220.168.84.219])
	by smtp.qiye.163.com (Hmail) with ESMTP id 5479c1088;
	Thu, 12 Nov 2026 23:53:04 +0800 (GMT+08:00)
From: Haoming Gao <Naixumogu@whut.edu.cn>
To: tomeu@tomeuvizoso.net
Cc: heiko@sntech.de,
	ogabbay@kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	Naixumogu@whut.edu.cn
Subject: [PATCH drm-misc-fixes] accel/rocket: publish read fences for input buffers
Date: Thu, 12 Nov 2026 23:53:00 +0800
Message-ID: <20261112155300.299899-1-Naixumogu@whut.edu.cn>
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
X-HM-Tid: 0aa1d0766ad503a1kunm90ffcb87766e
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUtXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVlCQxoaVk0ZQ0NCH01LTUlDS1YeHw
	5VEwETFhoSFyQUDg9ZV1kYEgtZQVlJSUtVSk1DVUNPVUlKQllXWRYaDxIVHRRZQVlLVUtVS1VLWQ
	Y+

Fix the bug that a fence is not attached to a BO reservation when the BO is
read. An exported input buffer can appear writable while an accepted Rocket
job is still reading it, allowing a later writer to overwrite data in use.

Fixes: 0810d5ad88a1 ("accel/rocket: Add job submission IOCTL")
Signed-off-by: Haoming Gao <Naixumogu@whut.edu.cn>
---

Notes (rocket-submit):
    Based on drm-misc-fixes at bafda823590ddf7031ecb765d673572fae7ab44a.
    

 drivers/accel/rocket/rocket_job.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/accel/rocket/rocket_job.c b/drivers/accel/rocket/rocket_job.c
index c3edb94355a3..7aa7bbfce036 100644
--- a/drivers/accel/rocket/rocket_job.c
+++ b/drivers/accel/rocket/rocket_job.c
@@ -201,12 +201,13 @@ static int rocket_acquire_object_fences(struct drm_gem_object **bos,
 
 static void rocket_attach_object_fences(struct drm_gem_object **bos,
 					int bo_count,
-					struct dma_fence *fence)
+					struct dma_fence *fence,
+					enum dma_resv_usage usage)
 {
 	int i;
 
 	for (i = 0; i < bo_count; i++)
-		dma_resv_add_fence(bos[i]->resv, fence, DMA_RESV_USAGE_WRITE);
+		dma_resv_add_fence(bos[i]->resv, fence, usage);
 }
 
 static int rocket_job_push(struct rocket_job *job)
@@ -248,7 +249,10 @@ static int rocket_job_push(struct rocket_job *job)
 		drm_sched_entity_push_job(&job->base);
 	}
 
-	rocket_attach_object_fences(job->out_bos, job->out_bo_count, job->inference_done_fence);
+	rocket_attach_object_fences(job->in_bos, job->in_bo_count,
+				    job->inference_done_fence, DMA_RESV_USAGE_READ);
+	rocket_attach_object_fences(job->out_bos, job->out_bo_count,
+				    job->inference_done_fence, DMA_RESV_USAGE_WRITE);
 
 err_unlock:
 	drm_gem_unlock_reservations(bos, bo_count, &acquire_ctx);

base-commit: bafda823590ddf7031ecb765d673572fae7ab44a
-- 
2.43.0

