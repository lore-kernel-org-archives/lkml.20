Received: from extorris.mess.org (extorris.mess.org [92.243.27.206])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA5DF576EA8;
	Tue,  8 Sep 2026 15:54:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=92.243.27.206
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788882863; cv=none; b=ImWkv1/5raEuDQgl7QK8VIC+wgqdyAlrVSHAzdrw9R86/Hnj532r4NWWSyB9zoWQAdsWakQnTIC3WuhD8kUWezEEsqJ3HxGqT9pGB9a7yTmHF0i7K1IBWnUt+uHZWXhYn4EaAqqk30J3Y7GyStCNuxgjZS7NRGkCh1X++0ii/x4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788882863; c=relaxed/simple;
	bh=dgS6qoOZxZot5S+8F5Q1R8+ZsKap0Nd0zhfEpH0rzDE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eBYDpK0ila+TdplchRKBhjtP3Z4FeGg3xmxNoFZLrp91Hf3+Lx7P9HWwVMsAEsbZJ1g+MgQw7pQNPYdHW/l7RtjjyxQ64xHpxtH49rdcn1/glknBmg5m+imb3Dd7X+bVq7H6OXIMbYifsC35dHb8hmahwjtg38QbwcIgIxPeQ4s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mess.org; spf=pass smtp.mailfrom=mess.org; dkim=pass (2048-bit key) header.d=mess.org header.i=@mess.org header.b=iqKtwDZM; dkim=pass (2048-bit key) header.d=mess.org header.i=@mess.org header.b=hXk+AOFD; arc=none smtp.client-ip=92.243.27.206
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mess.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mess.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mess.org header.i=@mess.org header.b="iqKtwDZM";
	dkim=pass (2048-bit key) header.d=mess.org header.i=@mess.org header.b="hXk+AOFD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mess.org; s=2020;
	t=1788882855; bh=dgS6qoOZxZot5S+8F5Q1R8+ZsKap0Nd0zhfEpH0rzDE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=iqKtwDZMb5nueZePcDRgUezxNArwv+Nodq0xI3YoETFQqsUDifkKkYUb5+McnO1vD
	 APN8yiybYX+cBhBbKmKR8Ut6PJhW90++sUEolN9s2LGL9pNUl1DsTAgfyydJRZZrqu
	 DCdw01jP7yGB1QisOqJnrWVEoI6hQEFtqNgvhEBjOearkZEDNvL2nXTY1H3Wumf8dy
	 /88g2Cdyn1nM5Es1WLpdgohnq9VBcPAtqI6pnO3qNJu7dVHvDa4zfeB8ZMVsYffQg4
	 Y5rNUnbKEIi+cPPaSHHV3PZvGDcJwiUq8Dyn76nRaAO0r1sbGM1xgPz02qjkp4W1vL
	 mphGj3Oi4Jo0w==
Received: by extorris.mess.org (Postfix, from userid 1004)
	id 2BB6441470; Tue, 08 Sep 2026 16:54:15 +0100 (BST)
X-Spam-Level: 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mess.org; s=2020;
	t=1788882854; bh=dgS6qoOZxZot5S+8F5Q1R8+ZsKap0Nd0zhfEpH0rzDE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=hXk+AOFDbwiBIQRfbgRyyBj3sDrpZw/LwtoEBbKvIF3/jpUll6XKUIrNzmIWWUxbt
	 JV3vUzR9WX8/ExKv0/y6nSWnIYxmodkDEsrggu20CRoYsGz1JTiJtDh5P2l6cvtvfl
	 xsQLfHYU6iTV6uaUOAMpriC3l3wLVNcYyUVYNAWuSPIlWomPRx/dthrl8aET2BKP57
	 y6imFEqLMCb9CwywtGJTC9jHf0Mpky0WXqYnpF2gAlM8n7jQNaIs4ppdIkhZWKzxv8
	 DlkaFlzLDZZ0QHvPlwEZ6KLPVqKOchWjeeXKIYQ0HNKRh7dkteB5p8hlVUAfdD8WXK
	 08rktmXm9xmJw==
Received: from maru.home (host86-150-50-53.range86-150.btcentralplus.com [86.150.50.53])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by extorris.mess.org (Postfix) with ESMTPSA id 757574146D;
	Tue, 08 Sep 2026 16:54:14 +0100 (BST)
From: Sean Young <sean@mess.org>
To: linux-media@vger.kernel.org,
	Sean Young <sean@mess.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Rik van Riel <riel@surriel.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 12/19] media: ite-cir: Removed unused struct field
Date: Tue,  8 Sep 2026 16:52:00 +0100
Message-ID: <2aae6ba38e123c8a4c55184530d00aca22e578f8.1788882189.git.sean@mess.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1788882189.git.sean@mess.org>
References: <cover.1788882189.git.sean@mess.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Never assigned or read.

Signed-off-by: Sean Young <sean@mess.org>
---
 drivers/media/rc/ite-cir.c | 1 -
 drivers/media/rc/ite-cir.h | 1 -
 2 files changed, 2 deletions(-)

diff --git a/drivers/media/rc/ite-cir.c b/drivers/media/rc/ite-cir.c
index 1fbafcd8219e..d0e98095d1b6 100644
--- a/drivers/media/rc/ite-cir.c
+++ b/drivers/media/rc/ite-cir.c
@@ -1359,7 +1359,6 @@ static int ite_probe(struct pnp_dev *pdev, const struct pnp_device_id
 
 	/* set driver data into the pnp device */
 	pnp_set_drvdata(pdev, itdev);
-	itdev->pdev = pdev;
 
 	/* initialize waitqueues for transmission */
 	init_waitqueue_head(&itdev->tx_queue);
diff --git a/drivers/media/rc/ite-cir.h b/drivers/media/rc/ite-cir.h
index 4b4294d77555..a8382aa9dc35 100644
--- a/drivers/media/rc/ite-cir.h
+++ b/drivers/media/rc/ite-cir.h
@@ -76,7 +76,6 @@ struct ite_dev_params {
 
 /* ITE CIR device structure */
 struct ite_dev {
-	struct pnp_dev *pdev;
 	struct rc_dev *rdev;
 
 	/* sync data */
-- 
2.55.0

