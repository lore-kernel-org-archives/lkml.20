Received: from mail-m49198.qiye.163.com (mail-m49198.qiye.163.com [45.254.49.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78FAC3CF022
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 06:42:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.254.49.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787899333; cv=none; b=eiCxsWxIUwiK7sOvxmKi8b7TKUeDlMUNV4s5goEaPCN2ZxRqXP6O5ZsXKPLrZGlwnVujIrq9jO9Vz+ycG+sNw1BgaHDhmL7ZBanx8tRzzwv9ip6JtJzjE+xdh44W6Wzz04jbP0Z0ws/lM9V452tBkwXtd5ErTOrjNLBBSYk6xNQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787899333; c=relaxed/simple;
	bh=vGIRh1kqf7llqeCq0N9hLd8WSu9nf8rErsZuKeopqQI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iPphBJiF2XOG4jz0P+aFSy+Wz0m+G4GpLqRaka7/GDUK1i3PlRgdTjypdobD29nWYRRu2NSk6+teJZgoSeIruMgqBKQIRGiSBhvyZqoifuE/KyJqsadKuwSTj/tUWzRISD+dKc9dVI/pSO1poBNvLxGhVzL7B4K5zEjlxcWs54U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=whut.edu.cn; spf=pass smtp.mailfrom=whut.edu.cn; arc=none smtp.client-ip=45.254.49.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=whut.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=whut.edu.cn
Received: from Mogu.localdomain (unknown [223.73.65.69])
	by smtp.qiye.163.com (Hmail) with ESMTP id 4baa740db;
	Fri, 28 Aug 2026 14:42:06 +0800 (GMT+08:00)
From: Haoming Gao <Naixumogu@whut.edu.cn>
To: Tomeu Vizoso <tomeu@tomeuvizoso.net>
Cc: Oded Gabbay <ogabbay@kernel.org>,
	Jeff Hugo <jeff.hugo@oss.qualcomm.com>,
	Sidong Yang <sidong.yang@furiosa.ai>,
	Greg KH <greg@kroah.com>,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v5 3/3] accel/rocket: Propagate job submission errors
Date: Fri, 28 Aug 2026 14:41:52 +0800
Message-ID: <20260828064152.37822-4-Naixumogu@whut.edu.cn>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260828064152.37822-1-Naixumogu@whut.edu.cn>
References: <20260828064152.37822-1-Naixumogu@whut.edu.cn>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0aa0471ab19303a1kunmd9ea7a958c2b3
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUtXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVkZGEkeVh1KTkwYHUNJTktMQ1YeHw
	5VEwETFhoSFyQUDg9ZV1kYEgtZQVlJSUhVTEhVTU5VTUJZV1kWGg8SFR0UWUFZS1VLVUtVS1kG

rocket_ioctl_submit() discards each job's return value and reports success
even when every job fails.

Return the first error and stop submitting the remaining jobs. Jobs queued
before an error remain queued, giving the ioctl ordered partial-submit
semantics.

Fixes: 0810d5ad88a1 ("accel/rocket: Add job submission IOCTL")
Tested-by: Sidong Yang <sidong.yang@furiosa.ai>
Reviewed-by: Sidong Yang <sidong.yang@furiosa.ai>
Signed-off-by: Haoming Gao <Naixumogu@whut.edu.cn>
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

