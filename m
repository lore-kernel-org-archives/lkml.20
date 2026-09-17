Received: from mail-ua2-f43.google.com (mail-ua2-f43.google.com [74.125.226.235])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E78939C636
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 20:01:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.226.235
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789675302; cv=none; b=kXeBMhv3xxQFjDwrw5b/+PJO7EqYdF65tdiwrJNdsnBsV/B5VY+ILNhU50RxK12E2UFVqXVt8R92tzJlghzUtHYqyHx13ngblQ3GWZxkeayZk73cHiwHy+JPB/PkpVPqJzhahIJyNS8LgJhhi1ADFEH2BJvc6jHJSNHVcJwPxm8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789675302; c=relaxed/simple;
	bh=0Q16Ht0MTfviNMHmisL22rEElmqFEK7Bp57szaj0Eug=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=kplU4eXUbIi7Dubn9EbL+dJqjSp7Q5/wYtD1sYPAD67gzEwb4TIFN0OuPGp3HNqcLMthl3aRP/5JUN8Ua7fBROB81Fi5HgeUkbHL+74ocuIqvy5izNUACheQW6NV/zXWZw++AOIVr81aX9IIIjjNduN3H8vMcavkCYupJSKdMIE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MJBfrFeH; arc=none smtp.client-ip=74.125.226.235
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MJBfrFeH"
Received: by mail-ua2-f43.google.com with SMTP id a1e0cc1a2514c-98334af2ca0so17058241.3
        for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 13:01:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789675299; x=1790280099; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=mhGEf8mpyg4UxEKpmS5TYtXOZtm+XpKxy7o28279ww0=;
        b=MJBfrFeHP3cmlqzicT9VxeKkqHs1GPLj645KBnE8H3uzO6nXe4Jvn375Oijb0ED9uR
         8CdZB+FWJOnNOnX8WGX5h3FFzysgvWdzuNcBb9OKEkqObXhX+6BJe8eu5B2oAky1fIlq
         in6MQ7FyFT6umMS3LA9lToSwmF+K5wkAqAGi0YSs7P5h6dTQKeWrw/k6v2gTSx2dpZx+
         f63M8D4VGOeghbnBccKz8n2vRIk1qV5U0gd/MZP5iNQ5IV1sXrWg99Xet/OiGbiOzFWj
         LjTKu4EJYx0SFaawyrBxdwR5JhcmUZRXAOSJseiqk/lMxloIzK/YpuSNlYLoEfi7Z+f+
         BkiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789675299; x=1790280099;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mhGEf8mpyg4UxEKpmS5TYtXOZtm+XpKxy7o28279ww0=;
        b=wrcY8vCWSLztdn4CWgJ9lte+mQkYkM/Tg4YtUROr8CBYgFDNNI921H/Q8bF2Rgz2QL
         F75oPA2e7+zmy9htF/vTlIKrNu2LNcb6QbcL4CGUQp0VvEaxudVVZWzq31xu8Qcz9iPX
         AnSoTP+owavcEp8TCMuEtbQ8bsP1LOJT2SgVvMXxm8VDJSyBSVde0rnX+x0Z15wahOjG
         UhE9hZq86pA6fTMiEIWTldOYd/RmMGECsNEk9lGxNGoN4b7mTwrM5vEoEXXu4IzYNPLT
         D4oTt2OYpVyBJQvXqQl10bmlNgXs9V+ur2ClS+iKZS+LKpUekF7f8XCuMMRjfLOtmLe9
         XjeA==
X-Gm-Message-State: AFuF++kavJ1D4cZmZJ76MLycEwFdvRIxLIUjZX15gG1dfHwIH+qXMnB2
	7BaX7MCmJYCTLqYdZy54MPERsExHRBbOvg/aXZxD5pJx4yiu64mNP2Q=
X-Gm-Gg: AYBFou01LvrsRXgRt/j7e81P0FAC41/3G+lpJDyB4L1gIqM16al5Zz2yDzXoUXz38ye
	N4pdLAEEoJ8MjY4dM0q6QBNfrU+50GQp1IIoFbpYeSMEJrcbmhC/bvoIQc5Uee0kInREZlgELFl
	zLyWbZ/wGgCk8XYUTLff4K3HH3EE0CZxTjAXa6d/L82sppxM6A7fh14CKw8gC3f5CDnS0Y76xJz
	MbaS+0AQDTHfJzecM4YvytFMv8yewEM19waKSf2rnL5J4u4+Ppl89oqT9F4AmfiF1Flc/fhmFs9
	5y1q/3IVHae/R2Q9CaGEfuUDGXu1a9hZv/z9IJBGSlvry6FW4p53syTORbfwx5hfm4QYXOom1Pf
	P0DUi0S3FeKPe0rQqlBd86bvBGO3Nw44eaOwHQ5zgP8/ZjR90WurypbddAlpeMr0oxSS8izjJtC
	KwM4bdl8kFlD6yWOPNehAW3F1jzVZKiDcY6UDYFnbtmoDJ0MyuDV6n/rj5JFKPdj1KJ7OFHtQB0
	HIfc6UV+y+VD3z72LrKyJfjdIVsvxpF66YjXj4og59reI7tZmdwNsC0uLBoS0YHuW7p9eeKqjVQ
	eX2HhGL6yVcDgZSqR+BQkxAaJZnHYqUiSP/d
X-Received: by 2002:a05:6102:e0e:b0:79f:eeb7:d630 with SMTP id ada2fe7eead31-7a55a226309mr83581137.6.1789675298545;
        Thu, 17 Sep 2026 13:01:38 -0700 (PDT)
Received: from localhost.localdomain ([104.39.169.225])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91252c7cb8bsm5425606d6.20.2026.09.17.13.01.37
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 17 Sep 2026 13:01:37 -0700 (PDT)
From: Myeonghun Pak <mhun512@gmail.com>
To: Ioana Ciornei <ioana.ciornei@nxp.com>,
	Christophe Leroy <chleroy@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org,
	Ijae Kim <ae878000@gmail.com>,
	Myeonghun Pak <mhun512@gmail.com>
Subject: [PATCH] soc: fsl: dpio: Free the IRQ before releasing the I/O object
Date: Thu, 17 Sep 2026 16:01:36 -0400
Message-ID: <20260917200136.75721-1-mhun512@gmail.com>
X-Mailer: git-send-email 2.47.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The DPIO interrupt handler accesses priv->io, but dpaa2_dpio_remove()
releases that object before tearing down the interrupts. The IRQ was
requested with devm_request_irq(), and unregister_dpio_irq_handlers()
only clears its affinity hint. fsl_mc_free_irqs() returns IRQ resources
to the MC resource pool without freeing the handler. An interrupt can
therefore access the freed I/O object before devres releases the IRQ.

Explicitly free the managed IRQ before returning its resource to the
pool, and perform IRQ teardown before releasing the I/O object. This
also waits for an in-flight handler while the object is still valid.

This issue was identified during our ongoing static-analysis research
while reviewing kernel code.

Fixes: 993fec7e11ca ("bus: fsl-mc: dpio: add the DPAA2 DPIO object driver")
Assisted-by: LLM
Co-developed-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Myeonghun Pak <mhun512@gmail.com>
---
 drivers/soc/fsl/dpio/dpio-driver.c |    6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/soc/fsl/dpio/dpio-driver.c b/drivers/soc/fsl/dpio/dpio-driver.c
index d5198ffc4455..fa82cdcc4922 100644
--- a/drivers/soc/fsl/dpio/dpio-driver.c
+++ b/drivers/soc/fsl/dpio/dpio-driver.c
@@ -263,6 +263,8 @@ static int dpaa2_dpio_probe(struct fsl_mc_device *dpio_dev)
 static void dpio_teardown_irqs(struct fsl_mc_device *dpio_dev)
 {
 	unregister_dpio_irq_handlers(dpio_dev);
+	devm_free_irq(&dpio_dev->dev, dpio_dev->irqs[0]->virq,
+		      &dpio_dev->dev);
 	fsl_mc_free_irqs(dpio_dev);
 }
 
@@ -276,10 +278,10 @@ static void dpaa2_dpio_remove(struct fsl_mc_device *dpio_dev)
 	priv = dev_get_drvdata(dev);
 	cpu = dpaa2_io_get_cpu(priv->io);
 
-	dpaa2_io_down(priv->io);
-
 	dpio_teardown_irqs(dpio_dev);
 
+	dpaa2_io_down(priv->io);
+
 	cpumask_set_cpu(cpu, cpus_unused_mask);
 
 	err = dpio_open(dpio_dev->mc_io, 0, dpio_dev->obj_desc.id,
-- 
2.47.1
