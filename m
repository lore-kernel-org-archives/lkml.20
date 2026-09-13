Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B91C9377EB2
	for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 04:50:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789275015; cv=none; b=DhlvUGOguRwjX6kmuqFIJ5MxVwrgu5l5jI85E5Fa4aS5g1BL0uV5i/7e2KSJ5MgxwsutYwGPmp61dheUl91n8bb93hvcnIWI4pyUACQV6CHW52rV3u9r4RGmYgU/s93gLzNO06O7FIDzVzHeRMNDUWhx/UETO38cfCT+ARmgnNg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789275015; c=relaxed/simple;
	bh=jiBek9fBBVmga54FLaDSIboQGEfdZWeiLHQR6tbPb3M=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=gsjUp2VsXyN/+WShgiF2eGSfBG0JU1pET2uqTRB0/ZvTKUZQvQOn9xY1o93uvE+GPtRkWCUwf+am82g5T8myjCF8I23bvGfM43fXpkNTOHiNOTERiUWTPiMOXUCyuBLoGjkQnZGwpc8to7bn+jBdkJ40Xgi+VvDNxsXzRmNtI78=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=krRxM2B3; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="krRxM2B3"
Received: by mail-pj2-f13.google.com with SMTP id d9443c01a7336-2d8fe517774so14321515ad.0
        for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 21:50:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789275013; x=1789879813; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=IcspykAp8b/TAa5Da1Y1EJbB5NATcWKA3cjbFzlW/ok=;
        b=krRxM2B3d7h8nG+kxu9QxzOMG/updkTHgHw/0T1IeNsoHQDLUsmZENNnTBruGjO7JF
         +DjgwdKTZv6HmD/QON8Cmb7OSPO1ad5F/bIO43j9/tyo5/q10Y+6EEo61RVdrQi4LoJr
         dgIhZ5R5R6J7YdswZIcRKzG2Ke2FB+2p1nunApljq4yWlTRZnzetEukodBvDLrekdLPd
         cHM/glQTAxMDIDp7GIyqUU4TLyfJTn6kxH0K1WG6+ba5hfXUEQzzL3F+4albtyUnwaQV
         2mWziu0eH7nJzB6jS+xO42XeF2ad4hVvR1yg9m1nYZ2ohws/QgDUk6FctUjUPDYD1fag
         cczw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789275013; x=1789879813;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IcspykAp8b/TAa5Da1Y1EJbB5NATcWKA3cjbFzlW/ok=;
        b=rSG7xlJP+Odfw91lHIoLZzwmqG9/GrwqY2Ggg8aGFEpCwL+aBzYdagSbIpiNK9bBuY
         EhSd0dnhz3/yOIMsOI2y20TvyurZ4E1jgHdmnU7FtlA76TPLFdxIfAu9qe8aMNqUASpy
         1wz8dk6dLZeK+hK3n6cejVtcO+NIQt+OltIbVqDKKySdwFzC32VbleBjFHkFVkYyUBjz
         2f6AV+f66ZdmrGGOFyCmx0qf8bFfwpB71a2SR4f16T7qbi4slTVYHVWKreYNQ145xwBj
         wHJNzqW1rsKOSec6vmxYE/su6C9hZL2ysETW3UyKvMA0046U5jpuBaYXOXCTRWvC/fNn
         vV9A==
X-Forwarded-Encrypted: i=1; AKwUvBwtXYf3z4uTuYE0XNNfZXs6uIt0WGhfJaODFnNEpsw6/tJ9T0AyvssIrnBnXWRMSytqqAgaWnEHC2qm3Hw=@vger.kernel.org
X-Gm-Message-State: AFuF++nNXhqtpmepOE8Ksrend/iKac4m6ISv10RLzbE5hg3ugE4C+wZ5
	6vpWI9LgkO4seCSA+9g4FCUw3Mr1YZ3tYZuD768fJijQiMBetJKE/ey0
X-Gm-Gg: AYBFou0PBsRnAJE2KQoFs4beoQuvUOMiK53qaqbrxZJzm2fPxOKS9wTBaCunkpZzirC
	OvldNdSaAwNCM9lwtAKgd8p09jI0JEBKhl0LcODU4e2yyAVZMlKDsfI2wMi/Q4xYDZRHx1f1vHZ
	fMm9k1c53ZXq9zFrbuzBOPipro8RsdKhdT+3ncYt1dYVfZRGdzIdSnjcCQdlnRBCEssgELKd6qE
	nYZcB3UvO8VwmapYtF+qb/upkg6vVqX3yPXUADBC74L5oe+VMe3QmG1+rmNERs8S0Oot+Y4Pl24
	rsl3TtYHOBrt/N8XxtiB8fVXWC4srh3jk0h7QO6A6NIbpcklW8CBASqWsUyN8cr1ifcQ18CxhON
	jg3+jxe+HsW5F+Zu5WfWGt5+5OX0oOZl1riEc0sD4u67c4jcRaaH+O/BGOI0458sNzbDIaJV3bO
	TEG8/9WfhmFU2xYw3bBd8zLlenBCM4x16on/C9WLboqFr1Nyh+m59eusI=
X-Received: by 2002:a17:902:d549:b0:2db:56da:6a0b with SMTP id d9443c01a7336-2dd2a34638bmr217738655ad.13.1789275013002;
        Sat, 12 Sep 2026 21:50:13 -0700 (PDT)
Received: from lgs.. ([2001:250:5800:1002::de93])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2dd2ceb1c94sm29276815ad.31.2026.09.12.21.50.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Sep 2026 21:50:12 -0700 (PDT)
From: Guangshuo Li <lgs201920130244@gmail.com>
To: Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>,
	Kees Cook <kees@kernel.org>,
	Guangshuo Li <lgs201920130244@gmail.com>,
	Peng Ma <peng.ma@nxp.com>,
	dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: stable@vger.kernel.org
Subject: [PATCH] dmaengine: fsl-dpaa2-qdma: fix ppriv memory leaks
Date: Sun, 13 Sep 2026 12:50:01 +0800
Message-ID: <20260913045001.1126563-1-lgs201920130244@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

dpaa2_qdma_setup() allocates priv->ppriv separately from priv, but the
allocation is not released on all teardown paths.

If dpdmai_get_rx_queue() or dpdmai_get_tx_queue() fails after
priv->ppriv has been allocated, dpaa2_qdma_setup() returns through the
error path without freeing it.

The normal remove path has the same issue. dpaa2_qdma_remove() frees
priv without first releasing priv->ppriv, losing the only reference to
the separately allocated array.

Free priv->ppriv on setup failures that occur after its allocation and
during normal driver removal before freeing priv.

This issue was found by manual code inspection.

Fixes: 7fdf9b05c73b ("dmaengine: fsl-dpaa2-qdma: Add NXP dpaa2 qDMA controller driver for Layerscape SoCs")
Cc: stable@vger.kernel.org
Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
---
 drivers/dma/fsl-dpaa2-qdma/dpaa2-qdma.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/dma/fsl-dpaa2-qdma/dpaa2-qdma.c b/drivers/dma/fsl-dpaa2-qdma/dpaa2-qdma.c
index bf771251264d..0f0fe0291a06 100644
--- a/drivers/dma/fsl-dpaa2-qdma/dpaa2-qdma.c
+++ b/drivers/dma/fsl-dpaa2-qdma/dpaa2-qdma.c
@@ -365,7 +365,7 @@ static int __cold dpaa2_qdma_setup(struct fsl_mc_device *ls_dev)
 					  i, 0, &priv->rx_queue_attr[i]);
 		if (err) {
 			dev_err(dev, "dpdmai_get_rx_queue() failed\n");
-			goto exit;
+			goto err_free_ppriv;
 		}
 		ppriv->rsp_fqid = priv->rx_queue_attr[i].fqid;
 
@@ -373,7 +373,7 @@ static int __cold dpaa2_qdma_setup(struct fsl_mc_device *ls_dev)
 					  i, 0, &priv->tx_queue_attr[i]);
 		if (err) {
 			dev_err(dev, "dpdmai_get_tx_queue() failed\n");
-			goto exit;
+			goto err_free_ppriv;
 		}
 		ppriv->req_fqid = priv->tx_queue_attr[i].fqid;
 		ppriv->prio = DPAA2_QDMA_DEFAULT_PRIORITY;
@@ -382,6 +382,9 @@ static int __cold dpaa2_qdma_setup(struct fsl_mc_device *ls_dev)
 	}
 
 	return 0;
+
+err_free_ppriv:
+	kfree(priv->ppriv);
 exit:
 	dpdmai_close(priv->mc_io, 0, ls_dev->mc_handle);
 	return err;
@@ -787,6 +790,7 @@ static void dpaa2_qdma_remove(struct fsl_mc_device *ls_dev)
 	dpaa2_dpdmai_free_channels(dpaa2_qdma);
 
 	dma_async_device_unregister(&dpaa2_qdma->dma_dev);
+	kfree(priv->ppriv);
 	kfree(priv);
 	kfree(dpaa2_qdma);
 }
-- 
2.43.0

