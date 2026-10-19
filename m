Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B44A494805;
	Mon, 19 Oct 2026 08:28:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792398494; cv=none; b=S0dDx0Pq2enVJlLwT/RhuUWzG/8FLQFmmFtiOt4VySqXe9Y7bf/Kz9U5S4/s7acdb3ZxYIdzO1c4JF8XoeF57iAG+AKDBjjv23KT9qONii/7nQPHO6M1l526VktHQjeZWEyZSDAWWeAbU8O8NZ6IsBhhYer9M/8wGUq59fNCcSE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792398494; c=relaxed/simple;
	bh=VgpZtmmZkaM7m7QTMmAut9B5U+QSyDYR3k7DX8Mq9mo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Qb46O2jWTqYabF4aMvPB0uflSzqRSpBYl8/ZHFQZjgInqPGAdyWOOJUKOEo4BgIL8dd/JhJWxMqoKGNAEgf15BGCmR2HPtMgW77N1l8qTBLBoQFpUXQGjocwo7yz8kvtpUk8g2FGmGv91zMfeNfqYD/i2io6DxmK8DmHTnwNzvM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=btuQY1+L; arc=none smtp.client-ip=117.135.210.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="btuQY1+L"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=Xa
	oazydP40FDQ4ADdpbzy4Luk3GD+RK3quaoJB69Z7Y=; b=btuQY1+LCkqHsL6aGt
	oYKQjxUaZW+loEsqviNe8M2HydeXs7amBDlf0VhggCOVDt32VjHqNND+8DNll+CW
	Vas36I8tVORlg1Pq0KKV8mDUJ9EjJ232M9SCkBQN4tdEtFiOz0/0ZeCSFddV6UW7
	jVKt+Ox8oejL33kUAf2sV24NA=
Received: from pc.localdomain (unknown [])
	by gzga-smtp-mtada-g0-4 (Coremail) with SMTP id _____wD3H8GM1NVqEBsIBQ--.60267S3;
	Mon, 19 Oct 2026 16:27:58 +0800 (CST)
From: Jiale Yao <yaojiale02@163.com>
To: Ming Qian <ming.qian@nxp.com>,
	Zhou Peng <eagle.zhou@nxp.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Jiale Yao <yaojiale02@163.com>
Subject: [PATCH 1/2] media: amphion: handle core runtime resume failures
Date: Mon, 19 Oct 2026 16:27:53 +0800
Message-Id: <20261019082754.1806443-2-yaojiale02@163.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261019082754.1806443-1-yaojiale02@163.com>
References: <20261019082754.1806443-1-yaojiale02@163.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wD3H8GM1NVqEBsIBQ--.60267S3
X-Coremail-Antispam: 1Uf129KBjvJXoW7Cw1xuF1UtFWfZFW3ur45KFg_yoW8WryUpr
	4DWayxAry0gw42qws3Ar1j9F98C3yrJFW7WFyfZ3s7ZF95ZF9Iyr1UXFyvvryDArWkJFs8
	Wr48tw4fCFWjvF7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0pMVbgXUUUUU=
X-CM-SenderInfo: x1dryxhdohiji6rwjhhfrp/xtbC7w5oomrV1I7hCQAA3m

The core request and resume paths continue with VPU state and hardware
access after pm_runtime_resume_and_get() fails. A failed runtime resume
leaves the device unavailable, so those accesses can fail and the later
runtime PM put does not match an acquired reference.

Check the runtime resume result before accessing the VPU. Release the
core lock and return without touching the hardware when resume fails.

Signed-off-by: Jiale Yao <yaojiale02@163.com>
---
 drivers/media/platform/amphion/vpu_core.c | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/amphion/vpu_core.c b/drivers/media/platform/amphion/vpu_core.c
index ad54f014d8..3d71442807 100644
--- a/drivers/media/platform/amphion/vpu_core.c
+++ b/drivers/media/platform/amphion/vpu_core.c
@@ -372,7 +372,12 @@ struct vpu_core *vpu_request_core(struct vpu_dev *vpu, enum vpu_core_type type)
 		goto exit;
 
 	mutex_lock(&core->lock);
-	pm_runtime_resume_and_get(core->dev);
+	ret = pm_runtime_resume_and_get(core->dev);
+	if (ret < 0) {
+		mutex_unlock(&core->lock);
+		core = NULL;
+		goto exit;
+	}
 
 	if (core->state == VPU_CORE_DEINIT) {
 		if (vpu_iface_get_power_state(core))
@@ -760,7 +765,11 @@ static int __maybe_unused vpu_core_resume(struct device *dev)
 	int ret = 0;
 
 	mutex_lock(&core->lock);
-	pm_runtime_resume_and_get(dev);
+	ret = pm_runtime_resume_and_get(dev);
+	if (ret < 0) {
+		mutex_unlock(&core->lock);
+		return ret;
+	}
 	vpu_core_get_vpu(core);
 
 	if (core->request_count) {
-- 
2.34.1

