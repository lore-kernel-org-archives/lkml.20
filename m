Received: from mail.noirlang.tr (mail.noirlang.tr [217.18.210.29])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6ADC941F7ED
	for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 11:01:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.18.210.29
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792321264; cv=none; b=OH96t4Y+MJOS6S/3OR3OnoRc/f4dZybjtyou6+YH+v4Al2viwOYKWgyfWt/uEIiG3gPjeJ0PWL/uFgx+cXsFlIeM2L9KJQ+qfHieHkahcXLosUp5OoO1iettHTjX5/6kmXtVuxDng7a8Ino/4gAgiTycfOqphzpJ1muJGQiAMLk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792321264; c=relaxed/simple;
	bh=sckhLDZ+rS3Ng7rkHz41xhALoIJyJ4i2X4X0DpBBlMY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=sOCERzRcyzxNNm3PjH85AjTprLtVS3KDGXqWcSst+3aqiJzQjx0+gqjQ3lfGGlGWq3EHyv4/8apr293782h1gm5kT+Ylhadj20j1KUUgiKSxLAIHMkc7AIWxxI1bVuXOTvlEMxWHur43tm35yrbYV8YWv18CJK78EyfEdaukYNs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=noirlang.tr; spf=pass smtp.mailfrom=noirlang.tr; dkim=pass (2048-bit key) header.d=noirlang.tr header.i=@noirlang.tr header.b=MS8hBxw2; arc=none smtp.client-ip=217.18.210.29
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=noirlang.tr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=noirlang.tr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=noirlang.tr header.i=@noirlang.tr header.b="MS8hBxw2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=noirlang.tr; s=mail;
	t=1792321260; bh=sckhLDZ+rS3Ng7rkHz41xhALoIJyJ4i2X4X0DpBBlMY=;
	h=From:To:Cc:Subject:Date:From;
	b=MS8hBxw22HdM+GNYKTenvxIZ2Kax/deWKk+ydWbQK/lug61iUJ5y/ApihdnLca19Z
	 NtwQEVWPwU2PlcgEEsRCnaUBuwLa8IpzcdadN6K3l+F3DXaZVs0kKFt0iT8ex6dV56
	 baQfKL96A4d8fyqGBHhTI3AavEc0EjE7qrHEfCVTBT9sBuyCDdDOEeDphyGwCgvErn
	 QYHKUrfe+eVuQZA84zzwriM5diDmDDGeCz34XOwzt5Hh+0bzLcJ113o64ttOUsbDip
	 OMYD7pwgecF61yHKP2JPnHuj2EJZ1bYAygSk0q8reFyxuAlrP/WIt2yVIumbOTyQRu
	 TTioLTs6HX9kw==
From: Melih Emik <melihemik@noirlang.tr>
To: parthiban.veerasooran@microchip.com,
	christian.gromm@microchip.com,
	gregkh@linuxfoundation.org
Cc: error27@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] staging: most: dim2: remove redundant dev_err() calls
Date: Sun, 18 Oct 2026 14:00:58 +0300
Message-ID: <20261018110058.296436-1-melihemik@noirlang.tr>
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

Signed-off-by: Melih Emik <melihemik@noirlang.tr>
---
v2:
- Drop "Tested:" meta commentary from the commit message as suggested
  by Dan Carpenter.

Test notes:
- Compiled with W=1 on x86_64 with zero warnings.
- Verified with lockdep and debug mutexes enabled
  (CONFIG_PROVE_LOCKING=y, CONFIG_DEBUG_MUTEXES=y).
- Boot-tested full bzImage in QEMU with initcall_debug, confirming
  successful driver registration (dim2_driver_init returned 0) and
  zero lockdep/kernel warnings.
- Verified with scripts/checkpatch.pl (0 errors, 0 warnings).

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


