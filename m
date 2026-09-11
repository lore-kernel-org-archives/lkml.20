Received: from mail-m155101.qiye.163.com (mail-m155101.qiye.163.com [101.71.155.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 476EF3F44EC
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 06:09:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=101.71.155.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789106975; cv=none; b=BNBMQtJbEpzbDW1dv8PyYgCeBGYNVtWniwisrVpj48EwjTUKVtsK/9B+Z/1QK7cOxlxf0Pa4rL//cYU6kEJqpvrPAlCg1E3dtjpOtItXIP0ZVs/v+JOX8hMwYNZdFuOdQYEQnTOijyw5PLCPC9TrnsLl0yWu4ZcLNHAXwhu9P9A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789106975; c=relaxed/simple;
	bh=2OstD2KgN10ZVUaRhS3ZKqMOOytJWXhaPI28fRHfwck=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=jBbhzYjSNWkZXuUDGiGZ634tECWv3bOoLhzjqh3OMtyx9RmhO957SlevNJzP4WH54m30J446ZtBHj4tluH2j/OlORbHeD2Oykt1kel363CIy6VmsGotPWpCURDq/aGXuDb8vJYbVW6ts5kirMGYkeSyOkyZlsk1qle0q3wsPvyc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=seu.edu.cn; spf=pass smtp.mailfrom=seu.edu.cn; dkim=pass (1024-bit key) header.d=seu.edu.cn header.i=@seu.edu.cn header.b=ZKRSq79p; arc=none smtp.client-ip=101.71.155.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=seu.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=seu.edu.cn
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=seu.edu.cn header.i=@seu.edu.cn header.b="ZKRSq79p"
Received: from seu.edu.cn (unknown [221.228.238.82])
	by smtp.qiye.163.com (Hmail) with ESMTP id 4d62c4fc0;
	Fri, 11 Sep 2026 14:09:28 +0800 (GMT+08:00)
From: Slavin Liu <bolin.liu@seu.edu.cn>
To: dpenkler@gmail.com,
	gregkh@linuxfoundation.org
Cc: linux-kernel@vger.kernel.org,
	bolin.liu@seu.edu.cn
Subject: [PATCH RFC] gpib: hp82335: check the register mapping before requesting IRQ
Date: Fri, 11 Sep 2026 14:09:27 +0800
Message-Id: <20260911060927.94461-1-bolin.liu@seu.edu.cn>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0aa08f15d63b03a1kunm7b13e27d1c7373
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUtXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVlCTksfVh9IThpLThpDT0kYTlYeHw
	5VEwETFhoSFyQUDg9ZV1kYEgtZQVlJSUpVSUlDVUlIQ1VDSVlXWRYaDxIVHRRZQVlLVUtVS1VLWQ
	Y+
DKIM-Signature: a=rsa-sha256;
	b=ZKRSq79pkVa8qv4JeDOwe+XwpwQaGqOSmKmLmDIh7Qx7El4NEJJuEgLBj7AornwqC9f9lgOgx/4cyAHUa3HaMuZDEHZtY9cvX54l8VLoIoeLtDcjD7M68S4tjhMc6/7b+uIdm0+3Enk/KfVVn75J0OuziLOa1ZSbE8SKA7tZTG8=; c=relaxed/relaxed; s=default; d=seu.edu.cn; v=1;
	bh=R2W5g1VuDXI9ptj4cLOneuF56/zpuUz+vcLKGX9Am2Y=;
	h=date:mime-version:subject:message-id:from;

Stop attach on mapping failure before board reset or register access.
The existing detach path handles the reserved region and private state.

Detected by static analysis and reviewed with AI-assisted source auditing.

Fixes: 76319a9d234f ("staging: gpib: Add hp82335x GPIB driver")
Assisted-by: LLM
Signed-off-by: Slavin Liu <bolin.liu@seu.edu.cn>
---
 drivers/gpib/hp_82335/hp82335.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpib/hp_82335/hp82335.c b/drivers/gpib/hp_82335/hp82335.c
index b7544b3c15c6..b1ef3dbdcdab 100644
--- a/drivers/gpib/hp_82335/hp82335.c
+++ b/drivers/gpib/hp_82335/hp82335.c
@@ -290,6 +290,8 @@ static int hp82335_attach(struct gpib_board *board, const struct gpib_board_conf
 	}
 	hp_priv->raw_iobase = upper_iomem_base;
 	tms_priv->mmiobase = ioremap(upper_iomem_base, hp82335_upper_iomem_size);
+	if (!tms_priv->mmiobase)
+		return -ENOMEM;
 
 	retval = request_irq(config->ibirq, hp82335_interrupt, 0, DRV_NAME, board);
 	if (retval) {
