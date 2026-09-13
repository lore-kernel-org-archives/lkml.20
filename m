Received: from mail-m49197.qiye.163.com (mail-m49197.qiye.163.com [45.254.49.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9A5C3E8330
	for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 12:51:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.254.49.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789303903; cv=none; b=DeFbNW/6DnAOZ7tWPzCewo/LuNogdrG1CgTDMhCqW6euZpTtNGeQnbT4eGnvyp8oSvfbT/ekPFXbKtxu5+g5UzB2vnTalAINMYs933HCdAXLHpATAGlBZcXT/lfJ78/qhVz55Px04cCKETRPZTmtDBcUtxn1aUvnOPerdS3/KmI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789303903; c=relaxed/simple;
	bh=UH5616wu5RryRpEU5Ncuklt1KDM5m4pewylLE951LMk=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=sZrx99NbskgvdsE3XGZEaJm3IV+tc/6A4bBOwjobiVtui8zODkhHVi3xw26gKJYZ4fn/nUwNukw2R1qdZ1jABZ8fbl7XjDT4loOiOfN6FyLtmmSyqNVkpYcVSdIbNmQ8H26snbRxZ0x+spifrd7F7DqcLCLqlWhcoW5+1HIwPK4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=seu.edu.cn; spf=pass smtp.mailfrom=seu.edu.cn; dkim=pass (1024-bit key) header.d=seu.edu.cn header.i=@seu.edu.cn header.b=ackSGboR; arc=none smtp.client-ip=45.254.49.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=seu.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=seu.edu.cn
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=seu.edu.cn header.i=@seu.edu.cn header.b="ackSGboR"
Received: from seu.edu.cn (unknown [58.241.16.34])
	by smtp.qiye.163.com (Hmail) with ESMTP id 4d907a3d7;
	Sun, 13 Sep 2026 20:51:34 +0800 (GMT+08:00)
From: Slavin Liu <bolin.liu@seu.edu.cn>
To: sven@kernel.org,
	j@jannau.net,
	kbusch@kernel.org,
	axboe@kernel.dk,
	hch@lst.de,
	sagi@grimberg.me
Cc: neal@gompa.dev,
	asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-nvme@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bolin.liu@seu.edu.cn
Subject: [PATCH] nvme: apple: tolerate missing power-domain arrays during cleanup
Date: Sun, 13 Sep 2026 20:51:33 +0800
Message-Id: <20260913125133.109849-1-bolin.liu@seu.edu.cn>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0aa09ad2b1bc03a1kunm9c0a61b5251170
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVlCSEhLVh1JGkkdSx1OQxhMQ1YeHw
	5VEwETFhoSFyQUDg9ZV1kYEgtZQVlOQ1VJT0pVSk1VSE9ZV1kWGg8SFR0UWUFZT0tIVUpLSUhOQ0
	NVSktLVUtZBg++
DKIM-Signature: a=rsa-sha256;
	b=ackSGboRSNuCuZ57sJ91HEbURwSUaVnCkWycMJT+AREczh5LIlb8KI25ixXy76OOTVDw4Gq+f9PKqqWhuhXEozzGvSknBczTyWIgtHekveabGeyQYP11Q/Dn+ymwhj3Uy07l8mxlt30MGhac2Hk4Asvgya0gqUKSwtlh67jUU5g=; c=relaxed/relaxed; s=default; d=seu.edu.cn; v=1;
	bh=eBO6SffKp663hVRNkIfFT8s2g2QggGSwKkRITL4bOqY=;
	h=date:mime-version:subject:message-id:from;

pd_count is set before either backing array is allocated. A failed
array allocation can therefore reach cleanup with a positive count but
a NULL array. Check each array before indexing it.

Detected by static analysis and reviewed with AI-assisted source auditing.

Fixes: eefa72a15ea0 ("apple-nvme: Release power domains when probe fails")
Assisted-by: LLM
Signed-off-by: Slavin Liu <bolin.liu@seu.edu.cn>
---
 drivers/nvme/host/apple.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/nvme/host/apple.c b/drivers/nvme/host/apple.c
index c63e28c75766..b7835e736d82 100644
--- a/drivers/nvme/host/apple.c
+++ b/drivers/nvme/host/apple.c
@@ -1398,9 +1398,9 @@ static void apple_nvme_detach_genpd(struct apple_nvme *anv)
 		return;
 
 	for (i = anv->pd_count - 1; i >= 0; i--) {
-		if (anv->pd_link[i])
+		if (anv->pd_link && anv->pd_link[i])
 			device_link_del(anv->pd_link[i]);
-		if (!IS_ERR_OR_NULL(anv->pd_dev[i]))
+		if (anv->pd_dev && !IS_ERR_OR_NULL(anv->pd_dev[i]))
 			dev_pm_domain_detach(anv->pd_dev[i], true);
 	}
 }
