Received: from mail-pz2-f41.google.com (mail-pz2-f41.google.com [74.125.228.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B2843C81B2
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 11:14:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789989282; cv=none; b=Jxkc6cO77b2ivQpVPUymT7ANAJw+i6tuqfdsb1EYWodirlRdsSF5XcNqPPoNkasGZBizxjqrZma19nREMa1HTK0ULpyBzLDP0zM5ctkW4UKvEgxNTxJE3+B6WA8XkVaekAirHIs8cDWq3v+uXn217mgyOrUA1DVvtOH+RMqwkRs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789989282; c=relaxed/simple;
	bh=fLdKnRFefQ7xNBf+MaSnVN+wrnJPV8J62ru1s6a3Yfc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Nh7dJykOiruviVMR9zo3DdRl0rTXHnAVv/Sdpj/Xs5vFh0b1LzX1vtgm9TNDqO4tj/3Sqv2FYFODkxV4QhMzVmohSh4+Ozp+moTT+3unusl6hZVdftVXgJB5glM2OQH4tr/DDDpbcXaK00G24zcc99vA5d+MQhZovXZ4D88ix6U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eK7Jzu0k; arc=none smtp.client-ip=74.125.228.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eK7Jzu0k"
Received: by mail-pz2-f41.google.com with SMTP id d2e1a72fcca58-8631d0023daso2032051b3a.2
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 04:14:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789989278; x=1790594078; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=XG6ZJcQO7Cvak2rHk7+0ID/dwXbMAp8I99Tm0qAbV6Y=;
        b=eK7Jzu0kSUPN+6t0UVG/JeJbZqfOMa0Mi+Gmimp0zGUGhGViVjsqJOYoz1ShYFxvwO
         t9GRc42I3GJgXMYFfYOHBibCQpULEEJIG3haTcnDIHajcVtwJrrrwkB62V2ICtXgOmx+
         ndo4H7ULIiGy/CP3tm+MEbDCyN+RhzkqMRJgeRBerYOOJozgq2g9nJr09wGS5zREo6jn
         Ns3P4qJfwI8+elD73RTKNgi+VhwFyzHGV5Y37Q6cDpy+pqhDghzmryeXtlWxG/Wi7MHw
         V4hrTIdlRzRw51ICJv4rLgX+uqqNZt4CiCu2OG9N1wMTeNEm6H0Mr9JHZOwDGCrFbzP+
         NKEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789989278; x=1790594078;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XG6ZJcQO7Cvak2rHk7+0ID/dwXbMAp8I99Tm0qAbV6Y=;
        b=ERVc/+Y5fLDzclTks+ac1zGjwvbN+u4xZARX7i2HWVK83flmzZQcklcig1Ltsy0eL+
         kH8hXcPXvACRwulJZYdFfsBoAJ61Pc2BxFpHbJDoVa7L2e7K0C504KrXYCfZTnBQD1A7
         iXMigAPbmsJVsEO3vAcFtNtYT4dFl49elfeEaDqRfnOcOVq5S0fhdP1IuqaPJUYOTWrA
         Fvf7SGKIy+b+eH4BgpAdpk74EnYYmvRIVJtjNi+S+Or0wOyG7G2jEi+VknMdxYt+uIMP
         FmckCoiQcQseXiAjRyjQCzhdlD4KRJnUwxCgDOFQpwoUxdpastFYhBtuHPstZ6S9phsa
         pcxQ==
X-Forwarded-Encrypted: i=1; AKwUvBzqJx9zy8gfUYLnoiMMoBYvYpDYSqCzUmFkTnGA/DZhPCu4JrSB7GEpSfac6fK2AbY0Us31iftX7gdbvOA=@vger.kernel.org
X-Gm-Message-State: AFuF++kZ+Jm5Shp2clkkn9+YAknWQpXNEEKR3O7tZx64vlENpZCV3Bhf
	+IsBpAs5ohHqz2G1TyziS1G/u59B0Qh5jw2F2FDhi0qLdWVgMJloq8Os
X-Gm-Gg: AYBFou2AfKcm5Xdi6V8O0tmgPqe2Av+0g9UGEhtLXnLYLQihBN2OBXBijtoUU3rYCZg
	+CwgN+AlAWr8KUlVDf6vgysI0uYGzoIhZHk7cMQu+REbZdYfp5YFv75S93AyWuch1RceFPGkcaC
	ip7sBx/AupOKPGmqHEyY9o9QSaPlAzy3GGRz5iArtPjILyw5Xtdxd6bsN5AXqTutdvd1jVkHU4Z
	Iu+1VCXgGsgPY/1giesK8U1A7DZAmty0tM0XNbRsz3feWpL/S6ZrfgWrxQnevW/zzLNgu/h3jLr
	VbcObE7YF+Jm0+2PVHyb7kvUf/UM22uIIn44V7mdsG1pDhcut+P3SEBch40gb+YCO5ViEtuZUP9
	8VurlkxE/4UrL3krv22x7RMxxXZlHsqBmykFxRMQcNtYwEOHMcDIHXC0gBqvsBBhMRLP8KsFV2V
	ZYiTbWmFINx/isTihTDknmaho3Xi/4zpD7Dn5/Ewwbfo3+d8jM7eMpyw==
X-Received: by 2002:aa7:88c3:0:b0:878:3783:8a4b with SMTP id d2e1a72fcca58-87837839351mr7344642b3a.51.1789989277939;
        Mon, 21 Sep 2026 04:14:37 -0700 (PDT)
Received: from lgs.. ([2001:250:5800:1002::de93])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-877a8dfe201sm3112714b3a.18.2026.09.21.04.14.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 04:14:37 -0700 (PDT)
From: Guangshuo Li <lgs201920130244@gmail.com>
To: Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>,
	Kees Cook <kees@kernel.org>,
	Guangshuo Li <lgs201920130244@gmail.com>,
	Peng Ma <peng.ma@nxp.com>,
	dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: stable@vger.kernel.org
Subject: [PATCH v2] dmaengine: fsl-dpaa2-qdma: fix ppriv memory leaks
Date: Mon, 21 Sep 2026 19:14:24 +0800
Message-ID: <20260921111424.378477-1-lgs201920130244@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

dpaa2_qdma_setup() allocates priv->ppriv, but failures after the
allocation can return from the function without releasing it. The
existing probe cleanup for priv->ppriv is only reached when a later
initialization step fails.

The normal remove path does not release priv->ppriv either, causing the
allocation to be leaked when the driver is unbound.

Since dpaa2_qdma_setup() is only called from probe, allocate priv->ppriv
with devm_kcalloc(). This automatically releases the memory on probe
failure and driver removal. Remove the now redundant manual cleanup from
the probe error path.

Fixes: 7fdf9b05c73b ("dmaengine: fsl-dpaa2-qdma: Add NXP dpaa2 qDMA controller driver for Layerscape SoCs")
Cc: stable@vger.kernel.org
Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
---
v2:
  - Use devm_kcalloc() for priv->ppriv, as suggested by Frank Li.
  - Remove the now redundant manual cleanup from the probe error path.
 drivers/dma/fsl-dpaa2-qdma/dpaa2-qdma.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/dma/fsl-dpaa2-qdma/dpaa2-qdma.c b/drivers/dma/fsl-dpaa2-qdma/dpaa2-qdma.c
index bf771251264d..d6843da29122 100644
--- a/drivers/dma/fsl-dpaa2-qdma/dpaa2-qdma.c
+++ b/drivers/dma/fsl-dpaa2-qdma/dpaa2-qdma.c
@@ -353,7 +353,8 @@ static int __cold dpaa2_qdma_setup(struct fsl_mc_device *ls_dev)
 	}
 
 	priv->num_pairs = min(priv->dpdmai_attr.num_of_priorities, prio_def);
-	ppriv = kzalloc_objs(*ppriv, priv->num_pairs);
+	ppriv = devm_kcalloc(dev, priv->num_pairs, sizeof(*ppriv),
+			     GFP_KERNEL);
 	if (!ppriv) {
 		err = -ENOMEM;
 		goto exit;
@@ -757,7 +758,6 @@ static int dpaa2_qdma_probe(struct fsl_mc_device *dpdmai_dev)
 	dpaa2_dpmai_store_free(priv);
 	dpaa2_dpdmai_dpio_free(priv);
 err_dpio_setup:
-	kfree(priv->ppriv);
 	dpdmai_close(priv->mc_io, 0, dpdmai_dev->mc_handle);
 err_dpdmai_setup:
 	fsl_mc_portal_free(priv->mc_io);
-- 
2.43.0

