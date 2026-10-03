Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6717389E05;
	Sat,  3 Oct 2026 08:09:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791014956; cv=none; b=IgZog5Zb7jwff/EKRP13ZhSvAWRJ7LVwbBDOBDqlfLiiFwO2PpJc0CG59XlIX8dbqwmRbCxYQyArPol8TGPsnsEEzKbv83LiN8y3WfyyyLhQ4EAubn2At2FQy0jh/vM0ByUypp0YqYWNpu33l0NAD/9efcaZL8E8ka+WpDTkzbw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791014956; c=relaxed/simple;
	bh=ykcut/wr1nAfcLmA0hBUi15mg0M1QCDQ37f2DaNAN2Q=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Hgbi62vhN3Q6bZRMZEJ431iH1QHM4ihVU274qQzDYldg6bABAV875Eg811SgZZ6W/JqrLY5I9TsWDF54+QAeuz4l3yKI1kAICRB6k3t5fu26VvMHn2SxYkwh2uFeCunKToeD5O6yMHV5uxDoSy87wS+yVud1ADykkaRbM0YcprI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=bIuwgyvJ; arc=none smtp.client-ip=117.135.210.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="bIuwgyvJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=fy
	aBLmFmAItiu8OXej2xQPcvlUtwyCywvNzNpsiUAlc=; b=bIuwgyvJNJAt4YGBH2
	YCRkOsd/Ya5wR8QXaoAi134kwAm+sKMBeHNB+6xxWRSIt06xJl0H9eFuqmwHJGb+
	9Tmgj/QtDUlUn89q4IkMfuV7OriPbNq3ZW6B43Mk82VRNuU9L3AZXKrlghXGS/bc
	RO5vcQmto7SmkJfCWHW9Y9+CM=
Received: from pc.localdomain (unknown [])
	by gzsmtp4 (Coremail) with SMTP id PygvCgAXUUoWuMBqJEyNCg--.37657S5;
	Sat, 03 Oct 2026 16:08:57 +0800 (CST)
From: Jiale Yao <yaojiale02@163.com>
To: Nas Chung <nas.chung@chipsnmedia.com>,
	Jackson Lee <jackson.lee@chipsnmedia.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Sebastian Fricke <sebastian.fricke@collabora.com>,
	Hans Verkuil <hverkuil@kernel.org>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Jiale Yao <yaojiale02@163.com>
Subject: [PATCH 3/4] media: wave5: handle runtime resume failure when closing
Date: Sat,  3 Oct 2026 16:08:51 +0800
Message-Id: <20261003080853.430099-4-yaojiale02@163.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261003080853.430099-1-yaojiale02@163.com>
References: <20261003080853.430099-1-yaojiale02@163.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:PygvCgAXUUoWuMBqJEyNCg--.37657S5
X-Coremail-Antispam: 1Uf129KBjvJXoW7Zw1DXFyUCr4DGr4xXr4xWFg_yoW8WFyfpa
	y8W3ZrAryUGr10qr1vyw4xZF90k393WayUuas3uas7A3s5Jr40vr4jgFyYyFy8JrWkAasx
	tr4qv3yxCF4avF7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0zRorWrUUUUU=
X-CM-SenderInfo: x1dryxhdohiji6rwjhhfrp/xtbC7xr+OWrAuBpNpwAA3Q

The decoder and encoder close paths ignore runtime resume failures and
proceed to firmware commands. If enabling the VPU clocks failed, those
commands access unavailable registers, and the paths later drop a
runtime PM reference that was not acquired.

Return the resume error before taking the hardware lock or issuing
firmware commands.

Fixes: 2092b3833487 ("media: chips-media: wave5: Support runtime suspend/resume")
Signed-off-by: Jiale Yao <yaojiale02@163.com>
---
 drivers/media/platform/chips-media/wave5/wave5-vpuapi.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/chips-media/wave5/wave5-vpuapi.c b/drivers/media/platform/chips-media/wave5/wave5-vpuapi.c
index f77abd5e122a..42bc737c6980 100644
--- a/drivers/media/platform/chips-media/wave5/wave5-vpuapi.c
+++ b/drivers/media/platform/chips-media/wave5/wave5-vpuapi.c
@@ -220,7 +220,9 @@ int wave5_vpu_dec_close(struct vpu_instance *inst, u32 *fail_res)
 	if (!inst->codec_info)
 		return -EINVAL;
 
-	pm_runtime_resume_and_get(inst->dev->dev);
+	ret = pm_runtime_resume_and_get(inst->dev->dev);
+	if (ret < 0)
+		return ret;
 
 	ret_mutex = mutex_lock_interruptible(&vpu_dev->hw_lock);
 	if (ret_mutex) {
@@ -750,7 +752,9 @@ int wave5_vpu_enc_close(struct vpu_instance *inst, u32 *fail_res)
 	if (!inst->codec_info)
 		return -EINVAL;
 
-	pm_runtime_resume_and_get(inst->dev->dev);
+	ret = pm_runtime_resume_and_get(inst->dev->dev);
+	if (ret < 0)
+		return ret;
 
 	ret = mutex_lock_interruptible(&vpu_dev->hw_lock);
 	if (ret) {
-- 
2.34.1

