Received: from mail-m49198.qiye.163.com (mail-m49198.qiye.163.com [45.254.49.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEDFD4746C8;
	Tue, 15 Sep 2026 08:26:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.254.49.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789460820; cv=none; b=fsHrYvPPAKUKr9mL4mtcAKpXA/vxltCC0E4V/mkNbdT7uI3otr7Qfhkjy4a0Hc159upK1EzD/A9KytnULIILP2ThunLxi1XoFPAeIASnwJJpfg04YMn2jlGhY3Zz7tOq+UCY8vi6ajT9mJppHq94kO7CnGHLAnUL7IBRA/PMGC0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789460820; c=relaxed/simple;
	bh=k/kXBbvUnsR2JZE7L5PkepCXLAnreHT5OcvsBEAggn4=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=DaPjcFCBhxTGSLTXfllXKt2i9kKhSvBXwHJkpi3h7LoW1qY1bFRk7QSVQppx8MqDS5qsF2kP6FBJTA65B6+FIuQMA8N0+o/NrMWUvcSwk4GOAM2orlrE1tyqFQUm4Cm6TrQejq24U4tZjMnklwZPHDlCtB0ozhG0pJQNXfgacdI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=seu.edu.cn; spf=pass smtp.mailfrom=seu.edu.cn; dkim=pass (1024-bit key) header.d=seu.edu.cn header.i=@seu.edu.cn header.b=O37J8NVR; arc=none smtp.client-ip=45.254.49.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=seu.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=seu.edu.cn
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=seu.edu.cn header.i=@seu.edu.cn header.b="O37J8NVR"
Received: from PC-202605011814.localdomain (unknown [223.112.146.162])
	by smtp.qiye.163.com (Hmail) with ESMTP id 4dd202c5e;
	Tue, 15 Sep 2026 16:26:44 +0800 (GMT+08:00)
From: Runyu Xiao <runyu.xiao@seu.edu.cn>
To: Lars-Peter Clausen <lars@metafoo.de>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hans.verkuil@cisco.com>,
	Federico Vaga <federico.vaga@gmail.com>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Runyu Xiao <runyu.xiao@seu.edu.cn>,
	jianhao.xu@seu.edu.cn
Subject: [PATCH] media: adv7180: Initialize mutex before ancillary clients
Date: Tue, 15 Sep 2026 16:26:38 +0800
Message-Id: <20260915082638.1319954-1-runyu.xiao@seu.edu.cn>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0aa0a42cf3e103a1kunmab96dc082cab21
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVlDGk9PVk4aGU5KHUsaQhpLHlYeHw
	5VEwETFhoSFyQUDg9ZV1kYEgtZQVlJSUhVSkpJVUpPTVVKTUlZV1kWGg8SFR0UWUFZT0tIVUpLSE
	pPSExVSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
	b=O37J8NVRpE0hIv8XdkWxdyI9wVehzOR9TI3pBmGql6Hr/E1wOAVzEDWfZKORRt0GLb9onNMO5f/ntFdVmPugTg1nDp4A81y8aGoIMsuvFxn6U/eNrMIPO/TkMvZ/ZK4d1PeVIf0rIZ+wBeUwa5Ph6DpX2c9NsfcHI46Y0C5VgvE=; c=relaxed/relaxed; s=default; d=seu.edu.cn; v=1;
	bh=2hxudm3/8OerbnXxJeguxeo2vni+wS29uEEipI4Ld0w=;
	h=date:mime-version:subject:message-id:from;

The VPP ancillary-client error path unregisters the CSI client before
destroying state->mutex. For I2P variants, the failure can occur before
mutex_init(), so cleanup destroys an uninitialized mutex.

Initialize the mutex immediately after allocating the driver state, before
creating any ancillary clients. This keeps every cleanup path matched with
a completed mutex initialization.

A QEMU x86_64 test using an i2c-stub bus instantiated an ADV7280 client
at address 0x21 and occupied its VPP ancillary address 0x42. This forced
i2c_new_ancillary_device() to return -EBUSY. An instrumentation oracle
observed an uninitialized mutex on the buggy kernel and an initialized
mutex on the fixed kernel. The failure was deliberately injected to
exercise the error path; no natural crash was observed.

Fixes: 851a54effbd8 ("[media] adv7180: Add I2P support")
Assisted-by: LLM Codex
Signed-off-by: Runyu Xiao <runyu.xiao@seu.edu.cn>
---
 drivers/media/i2c/adv7180.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/i2c/adv7180.c b/drivers/media/i2c/adv7180.c
index a1c7f6822..8c2cf3f53 100644
--- a/drivers/media/i2c/adv7180.c
+++ b/drivers/media/i2c/adv7180.c
@@ -1454,6 +1454,7 @@ static int adv7180_probe(struct i2c_client *client)
 	if (state == NULL)
 		return -ENOMEM;
 
+	mutex_init(&state->mutex);
 	state->client = client;
 	state->field = V4L2_FIELD_ALTERNATE;
 	state->chip_info = i2c_get_match_data(client);
@@ -1497,7 +1498,6 @@ static int adv7180_probe(struct i2c_client *client)
 	}
 
 	state->irq = client->irq;
-	mutex_init(&state->mutex);
 	state->curr_norm = V4L2_STD_NTSC;
 
 	state->input = 0;
-- 
2.34.1

