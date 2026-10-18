Received: from mail.noirlang.tr (mail.noirlang.tr [217.18.210.29])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5856843B3EE
	for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 10:42:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.18.210.29
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792320152; cv=none; b=OSOon6eQ7lrwp26RxtAQudDNRwWP0StrB13k7Nmm5znohZPREsjtOm7QtDQ7zA2YergGu/4ySs6KSB6B6eyRgV6E7OAs/3MsWqnGVl7rKJImJUTjiF2F8WuniQBYekUxKEEJnj3oaIBD6ceqYfWNkYHLyoZuP2WhN1GSFJE9w74=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792320152; c=relaxed/simple;
	bh=fsQ/p1S6E+ZMDAQUaBeqCUjhO27/HQCkNXf7wPSEjiE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=MPXvLmc1NnNy2QukMTc0AdFvIXbONrjwBTgDVZHKAC72x9fhN6fOVoAbwSekkwDoTvqXFKY2Rp3H5HbXD0Nu56P4Ph4We/DpZOulD0PhmPVcKuxg+xgAkZk68bcI2eQ68RfLNwijaO1romB94aHrgklG777zjyyUh1iXTsMvDMw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=noirlang.tr; spf=pass smtp.mailfrom=noirlang.tr; dkim=pass (2048-bit key) header.d=noirlang.tr header.i=@noirlang.tr header.b=MGEsnsNn; arc=none smtp.client-ip=217.18.210.29
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=noirlang.tr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=noirlang.tr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=noirlang.tr header.i=@noirlang.tr header.b="MGEsnsNn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=noirlang.tr; s=mail;
	t=1792320145; bh=fsQ/p1S6E+ZMDAQUaBeqCUjhO27/HQCkNXf7wPSEjiE=;
	h=From:To:Cc:Subject:Date:From;
	b=MGEsnsNnKHGhvXxfTC9hnmm53FFnNFlZBVFYddOiOo4OyMYNX8PUjGwMSQrlGuM2u
	 y6ZyFVmOpWDQaJf+4eEL/ELNIMw/eYDVEUDRPtySSFZS1b+DKZtwpmUBgksGnjd9fk
	 l80iuelq2KLQKey1VRKfMFtsRs9TulyI6ne3HY7hCR7LBNfQ8cTpqlEMwANrQjWvpT
	 4AXmS4vetkwToZXQgk+cN9VTgwvKS0QnUeZ2X/KZ8xtXWPsCercdLt/5FLzo9GiEUI
	 SLlAKQzfsE/xFHnvshihelXyC+H6cqBKVYtteEix2+Davl3z7YTBnEkuD74+W/CIxv
	 ySdK7V8VPkfpg==
From: Melih Emik <melihemik@noirlang.tr>
To: parthiban.veerasooran@microchip.com,
	christian.gromm@microchip.com,
	gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] staging: most: dim2: remove redundant dev_err() calls
Date: Sun, 18 Oct 2026 13:42:23 +0300
Message-ID: <20261018104223.164776-1-melihemik@noirlang.tr>
X-Mailer: git-send-email 2.56.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Since commit 55b48e23f5c4 ("genirq/devres: Add error handling in
devm_request_*_irq()"), devm_request_threaded_irq() and
devm_request_irq() automatically log detailed failure diagnostics
including device name, IRQ number, handlers, and the error code via
dev_err_probe().

Consequently, driver-specific dev_err() calls immediately following
these requests produce duplicate error messages on failure and are
redundant. Remove the redundant dev_err() calls in dim2_probe().

Tested:
- Compiled with W=1 on x86_64 with zero warnings.
- Verified with lockdep and debug mutexes enabled
  (CONFIG_PROVE_LOCKING=y, CONFIG_DEBUG_MUTEXES=y).
- Boot-tested full bzImage in QEMU with initcall_debug, confirming
  successful driver registration (dim2_driver_init returned 0) and
  zero lockdep/kernel warnings.
- Verified with scripts/checkpatch.pl (0 errors, 0 warnings).

Signed-off-by: Melih Emik <melihemik@noirlang.tr>
---
 drivers/staging/most/dim2/dim2.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/most/dim2/dim2.c b/drivers/staging/most/dim2/dim2.c
index 0e2512d16632..d57e20d399c7 100644
--- a/drivers/staging/most/dim2/dim2.c
+++ b/drivers/staging/most/dim2/dim2.c
@@ -818,10 +818,8 @@ static int dim2_probe(struct platform_device *pdev)
 
 	ret = devm_request_threaded_irq(&pdev->dev, irq, dim2_ahb_isr,
 					dim2_task_irq, 0, "dim2_ahb0_int", dev);
-	if (ret) {
-		dev_err(&pdev->dev, "failed to request ahb0_int irq %d\n", irq);
+	if (ret)
 		goto err_shutdown_dim;
-	}
 
 	irq = platform_get_irq(pdev, MLB_INT_IDX);
 	if (irq < 0) {
@@ -831,10 +829,8 @@ static int dim2_probe(struct platform_device *pdev)
 
 	ret = devm_request_irq(&pdev->dev, irq, dim2_mlb_isr, 0,
 			       "dim2_mlb_int", dev);
-	if (ret) {
-		dev_err(&pdev->dev, "failed to request mlb_int irq %d\n", irq);
+	if (ret)
 		goto err_shutdown_dim;
-	}
 
 	init_waitqueue_head(&dev->netinfo_waitq);
 	dev->deliver_netinfo = 0;
-- 
2.56.0


