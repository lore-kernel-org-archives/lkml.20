Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4648388879;
	Sat,  3 Oct 2026 08:09:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791014956; cv=none; b=AqgneLnKhol7x3geatXa25YqEQl7Zk8LfskhDurSO7ENDvClhMGmnbvaqBsbnRavokRNNhNWG7EIRfjROzZbj2zUpXYS1RfKqcONbF8kTKBnl579fYOYFVNNqgqpR1gLv/RaSk3kGNaiezuSRVE4EmiS2St5hNJZTanw0pmsZtM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791014956; c=relaxed/simple;
	bh=0w3Wvf/VIFOEvTx/vJYUz5ISvmg+7hP18tZo3gXALes=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Afjb8cEZQ2NKgLtkSfZmSXSLBECoAiPSt9BlbAuu23tnKGwXi6i6xoebTlIG1VZPzTUPUA6h1vtxbpLXalkpvAxp5R4nGy4UTZXvG4weg8RCHGTYDJ9kvSEs7Na6zoqV1hpqEoEIdNaqTV2OGG+0KYu/Ys7RkaYD2UJDqnIn65Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=NPSe9HrJ; arc=none smtp.client-ip=117.135.210.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="NPSe9HrJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=v9
	IoNz14Qd5KyfyGYOXZLgaW7TyYXO5QTVlDylikqOY=; b=NPSe9HrJWNKWp90s+O
	2T94Bn4R1kB9w2lBI1cLbLSO0G1etB5ZwTTisY8IlQtON8zLfl1eHm1cO2T6wboM
	LuRC1qsdswSP0FkQaeg+A20tAC+/5Pz/PM4Vd28tLakrEEIxSPnHjnnSkzOpzndl
	wvxNGEUQSEegN09IdT9Ve87kM=
Received: from pc.localdomain (unknown [])
	by gzsmtp4 (Coremail) with SMTP id PygvCgAXUUoWuMBqJEyNCg--.37657S6;
	Sat, 03 Oct 2026 16:08:59 +0800 (CST)
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
Subject: [PATCH 4/4] media: wave5: release runtime PM reference on encoder close errors
Date: Sat,  3 Oct 2026 16:08:52 +0800
Message-Id: <20261003080853.430099-5-yaojiale02@163.com>
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
X-CM-TRANSID:PygvCgAXUUoWuMBqJEyNCg--.37657S6
X-Coremail-Antispam: 1Uf129KBjvJXoW7Zw4ftrWDAF1fCF1xGF4fGrg_yoW8ZrW8pF
	W0ganFyry8tw1qqw1jyw47Zas093yvqayDuF97uayxA34rJw12yr4UXF1YvF18trWkZayD
	Xr47X3yfCF45tFJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0pEtxhLUUUUU=
X-CM-SenderInfo: x1dryxhdohiji6rwjhhfrp/xtbC8Bv+OWrAuBtL3gAA3w

wave5_vpu_enc_close() acquires a runtime PM reference before taking the
hardware lock, but three error paths call pm_runtime_resume_and_get()
again instead of releasing that reference. Each failure therefore
increments the usage count and can prevent the VPU from suspending.

Use pm_runtime_put_sync() on the error paths, matching the successful
path and the decoder close implementation.

Fixes: 2092b3833487 ("media: chips-media: wave5: Support runtime suspend/resume")
Signed-off-by: Jiale Yao <yaojiale02@163.com>
---
 drivers/media/platform/chips-media/wave5/wave5-vpuapi.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/chips-media/wave5/wave5-vpuapi.c b/drivers/media/platform/chips-media/wave5/wave5-vpuapi.c
index 42bc737c6980..062f0b5c318b 100644
--- a/drivers/media/platform/chips-media/wave5/wave5-vpuapi.c
+++ b/drivers/media/platform/chips-media/wave5/wave5-vpuapi.c
@@ -758,7 +758,7 @@ int wave5_vpu_enc_close(struct vpu_instance *inst, u32 *fail_res)
 
 	ret = mutex_lock_interruptible(&vpu_dev->hw_lock);
 	if (ret) {
-		pm_runtime_resume_and_get(inst->dev->dev);
+		pm_runtime_put_sync(inst->dev->dev);
 		return ret;
 	}
 
@@ -766,14 +766,14 @@ int wave5_vpu_enc_close(struct vpu_instance *inst, u32 *fail_res)
 		ret = wave5_vpu_enc_finish_seq(inst, fail_res);
 		if (ret < 0 && *fail_res != WAVE5_SYSERR_VPU_STILL_RUNNING) {
 			dev_warn(inst->dev->dev, "enc_finish_seq timed out\n");
-			pm_runtime_resume_and_get(inst->dev->dev);
+			pm_runtime_put_sync(inst->dev->dev);
 			mutex_unlock(&vpu_dev->hw_lock);
 			return ret;
 		}
 
 		if (*fail_res == WAVE5_SYSERR_VPU_STILL_RUNNING &&
 		    retry++ >= MAX_FIRMWARE_CALL_RETRY) {
-			pm_runtime_resume_and_get(inst->dev->dev);
+			pm_runtime_put_sync(inst->dev->dev);
 			mutex_unlock(&vpu_dev->hw_lock);
 			return -ETIMEDOUT;
 		}
-- 
2.34.1

