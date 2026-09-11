Received: from mail-m49197.qiye.163.com (mail-m49197.qiye.163.com [45.254.49.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F4211F1534
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 06:09:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.254.49.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789106970; cv=none; b=INwSVz1t57CrbNqcXg91qAw4ZDUBDQhqddjOTp3u+I2rAYDsqxnP2jIGMY+YqZfoTYGDWS8Mxq3WvOzto9F4n4UxMBm2fKc7UE5fHgJwqiVmOx6bj/d4l/8xo2LNYkks6MRTiXLGJyusmKXBu1YfgxEUY1go9cbwWu7/kueQ6Pk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789106970; c=relaxed/simple;
	bh=SkX7nwJaN2CZXz0W3GZiHOtOPYAkWX5klGjmld+UJSI=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=tFfpGKhnXUBtlQH4zdpGX7bfTtuBtInIyu7eQXuJ2m93FyF6mTMURB6HDhsJd+oi7ltUKJJnsNA0MLcUjgORrDN0Ct5fq4COjCfFBFxqCd3H25VAi/Pe5DbCxthkTitozHgbJF0PbyQVwYlF1kgNFr2iHFfCppHMA0PDsteaPOo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=seu.edu.cn; spf=pass smtp.mailfrom=seu.edu.cn; dkim=pass (1024-bit key) header.d=seu.edu.cn header.i=@seu.edu.cn header.b=Tso/WePH; arc=none smtp.client-ip=45.254.49.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=seu.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=seu.edu.cn
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=seu.edu.cn header.i=@seu.edu.cn header.b="Tso/WePH"
Received: from seu.edu.cn (unknown [221.228.238.82])
	by smtp.qiye.163.com (Hmail) with ESMTP id 4d62c4fb3;
	Fri, 11 Sep 2026 14:09:17 +0800 (GMT+08:00)
From: Slavin Liu <bolin.liu@seu.edu.cn>
To: linusw@kernel.org,
	daniel.lezcano@kernel.org,
	tglx@kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bolin.liu@seu.edu.cn
Subject: [PATCH RFC] clocksource: dbx500-prcmu: check timer register mapping
Date: Fri, 11 Sep 2026 14:09:17 +0800
Message-Id: <20260911060917.94310-1-bolin.liu@seu.edu.cn>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0aa08f15adb303a1kunm43d905a81c733e
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVlDHktDVhkeHkpJTx9OQ0weSFYeHw
	5VEwETFhoSFyQUDg9ZV1kYEgtZQVlJSUpVSUlDVUlIQ1VDSVlXWRYaDxIVHRRZQVlPS0hVSktJQk
	NDTFVKS0tVS1kG
DKIM-Signature: a=rsa-sha256;
	b=Tso/WePHXZar7n1oxfb8dT2GEVS/faUUYqZIhlxIUAk9XJ3iJYU0WW78Q6eT84VIW/FDzVCz5g5WywVsnxGYfn/+OoDvqmrx/u2bJCLUiQHkWzIFW2OiBMAUncRny2/7lP+weQI8dgFuAREukIlfUjUC7WqVijXA66ndWDnV3+c=; c=relaxed/relaxed; s=default; d=seu.edu.cn; v=1;
	bh=4NxlkOWR/a1EQCe4p7DRvruEyNU88KPzFhMs/lAUuB8=;
	h=date:mime-version:subject:message-id:from;

Return -ENOMEM if of_iomap() fails, before reading or configuring
the timer register block.

Detected by static analysis and reviewed with AI-assisted source auditing.

Fixes: 9d2aa8c7961a ("ARM/clocksource: use automatic DT probing for ux500 PRCMU")
Assisted-by: LLM
Signed-off-by: Slavin Liu <bolin.liu@seu.edu.cn>
---
 drivers/clocksource/clksrc-dbx500-prcmu.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/clocksource/clksrc-dbx500-prcmu.c b/drivers/clocksource/clksrc-dbx500-prcmu.c
index 2fc93e46cea3..1af223b0e896 100644
--- a/drivers/clocksource/clksrc-dbx500-prcmu.c
+++ b/drivers/clocksource/clksrc-dbx500-prcmu.c
@@ -52,6 +52,8 @@ static struct clocksource clocksource_dbx500_prcmu = {
 static int __init clksrc_dbx500_prcmu_init(struct device_node *node)
 {
 	clksrc_dbx500_timer_base = of_iomap(node, 0);
+	if (!clksrc_dbx500_timer_base)
+		return -ENOMEM;
 
 	/*
 	 * The A9 sub system expects the timer to be configured as
