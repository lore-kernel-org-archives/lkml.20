Received: from mail-m49198.qiye.163.com (mail-m49198.qiye.163.com [45.254.49.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00F93391E51
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 06:19:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.254.49.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787897978; cv=none; b=qZa9LMFspn+tZmP/bWU4cGkOGZ88PlZlLaWg7jTr/7RjG3CQPFWyMoum6+hBwD0OKR1Z8KSRr1gQqqMWHdUWCanVZawWsMx7cAPRagRUVdaMfxej7Bp0rodYkhAIFMzleD2SJrWVkXvfIxE0mVhWjsDw5NDvSW/r2xKVO6sMcFk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787897978; c=relaxed/simple;
	bh=s19rYMTeqmv36EVTMHvq7RI0gfaUCDNK2hBn23OD6GA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Gufk/wwj4/k+rRKnjWo1EfUOkPi6x44OeuAd8sVsKj6Vmdn57l8cG4ZgN8WbKqHHVyqePdjaqoOXCqx6z10THJxS9LVHnTP7gsSXypEq+j2wNC+x4M4jXid0TC/fU0DKZm35WP+p0hckmV6PKHBHptl4Wy0DZ/bd63fd5u2x2+g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=whut.edu.cn; spf=pass smtp.mailfrom=whut.edu.cn; arc=none smtp.client-ip=45.254.49.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=whut.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=whut.edu.cn
Received: from Mogu.localdomain (unknown [223.73.65.69])
	by smtp.qiye.163.com (Hmail) with ESMTP id 4ba921c5a;
	Fri, 28 Aug 2026 14:19:31 +0800 (GMT+08:00)
From: MoGGuU <Naixumogu@whut.edu.cn>
To: Tomeu Vizoso <tomeu@tomeuvizoso.net>
Cc: Oded Gabbay <ogabbay@kernel.org>,
	Jeff Hugo <jeff.hugo@oss.qualcomm.com>,
	Sidong Yang <sidong.yang@furiosa.ai>,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 3/3] accel/rocket: Propagate job submission errors
Date: Fri, 28 Aug 2026 14:19:16 +0800
Message-ID: <20260828061916.20405-4-Naixumogu@whut.edu.cn>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260828061916.20405-1-Naixumogu@whut.edu.cn>
References: <20260828061916.20405-1-Naixumogu@whut.edu.cn>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0aa04706026b03a1kunmbcc13c968b1eb
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUtXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVkZGElPVhgaSh0ZSUNCTh5NQlYeHw
	5VEwETFhoSFyQUDg9ZV1kYEgtZQVlJSUhVTEhVTU5VTUJZV1kWGg8SFR0UWUFZS1VLVUtVS1kG

rocket_ioctl_submit() discards each job's return value and reports success
even when every job fails.

Return the first error and stop submitting the remaining jobs. Jobs queued
before an error remain queued, giving the ioctl ordered partial-submit
semantics.

Fixes: 0810d5ad88a1 ("accel/rocket: Add job submission IOCTL")
Tested-by: Sidong Yang <sidong.yang@furiosa.ai>
Reviewed-by: Sidong Yang <sidong.yang@furiosa.ai>
Signed-off-by: MoGGuU <Naixumogu@whut.edu.cn>
---
 drivers/accel/rocket/rocket_job.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/accel/rocket/rocket_job.c b/drivers/accel/rocket/rocket_job.c
index b55e12aecfe64..8f1bdf4a57f20 100644
--- a/drivers/accel/rocket/rocket_job.c
+++ b/drivers/accel/rocket/rocket_job.c
@@ -646,8 +646,11 @@ int rocket_ioctl_submit(struct drm_device *dev, void *data, struct drm_file *fil
 	}
 
 
-	for (i = 0; i < args->job_count; i++)
-		rocket_ioctl_submit_job(dev, file, &jobs[i]);
+	for (i = 0; i < args->job_count; i++) {
+		ret = rocket_ioctl_submit_job(dev, file, &jobs[i]);
+		if (ret)
+			goto exit;
+	}
 
 exit:
 	kvfree(jobs);
-- 
2.43.0

