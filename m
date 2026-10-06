Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4E242BCF46
	for <linux-kernel@vger.kernel.org>; Tue,  6 Oct 2026 17:41:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791308521; cv=none; b=fLNxeTtfi2J0LAJkl+SbLNipZkWxsIGlC0I0ci2RHHxhk2WNZGmJp50eph3PQi5vYUD3EDUXQiZ7W6foIiouLp5t+WrXndB6UKBhrmQRx4a4xjx2dCCWPMPnmFGEZCkCq71MMcsrw880j1QuilPu5QFCbVVEEKlDlELbDelb4Us=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791308521; c=relaxed/simple;
	bh=GDcNMrVLoFNBPvMfOqZBCsNTycLKXwKbd62d4/iwhmA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=rFonNPUx/ef3N2a/SWfxGwZMvikYnZ1l6VYYcLT6AjW2II1oJGkPsllKjcasPD2mkX2lig3ukWBPi4S7PWhAGSRRHI/rF5VmztS9gN4hGHFsFue39x7ABEOZ7CmUhDwSZLmnn2OTXECaXANbYL8BQm6WcYEPProoUam2lxNwR8U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KXb+DvP8; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KXb+DvP8"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-3a0a55fa355so469291a91.3
        for <linux-kernel@vger.kernel.org>; Tue, 06 Oct 2026 10:41:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791308519; x=1791913319; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Lu6UPU56XojwtTlY93c0x5oAiTN6ULY7h5s2JWarDPs=;
        b=KXb+DvP8AfRS/MEqoDyFDlIHxr3fGguK9lnSLgRLvi8u2z1G4ndCyt3bqr2upGc75p
         nvQT4wFqSkEXsF81aURZUbktTJUKggMKNgrQGor719iovw66do7AwUfWV3LK1BK6aYFi
         w+iAKcVlGralseammppkShJ8zIiRhWfMLfMtfD3kraQ/XDqOBmRn1alsism20B1jj1MS
         YtBlnr1L7xGVTa+UeG1ODhhmph1GePw1+C7GUl2y+myJi/gwyI1+LQ6k5BvlUmt55rLT
         I22MVnJHAfG4FS4pdVrNBxLB2fe6L7jxchPWwwjinDyFu9+FI3H/TbOeTjzRbjiu8obK
         6lFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791308519; x=1791913319;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Lu6UPU56XojwtTlY93c0x5oAiTN6ULY7h5s2JWarDPs=;
        b=n8TWN0a8W1+gOucCqyLnYaUNx3SUd4mAMvc/WbV41qTiVj7YPGJZwayD7ngCFhpg06
         bLxdRHNq+lUvPGES2TKA4nO0CNWFbsgKDBg+m6plNIxpWcyYMFmiW39K9ckayVCiI2JD
         BcP5RoXfr1ydNV36GUMzGBYkLbLVQs1DGl/VWxSwMOKNj2pTqok+8HmIEtub2VawJgEi
         KQAJqdVYJr3QshpzBsnN2rUMxgNrKKiTea5w5iYD/tGPCJeYcnN6DbpOqpajEZneHCMI
         Lt+xJnZsyqm8JGESND8qY+ptuZMZF7S1t0Zibyl4WRr3xKN1EiYwR3n5pr7h/69QBPZ+
         RX0Q==
X-Gm-Message-State: AFq9FYIVM6/zKvh8mAXj5q8WnbyibrzPqvNDMt2dyxEY/YSKmdz3ZnL+
	Y5wgZnEKzumwMePdJRhthvtcvTObI5dXyjyLcC7jPkN6eJAWcyM4jXFNIySHGQnC
X-Gm-Gg: AYBFou0gLyLMbWq86Tq4qdSzmQoo8VLBJLL3+JWeZcffj/dII6QXqtSeMBFbqrLrbwr
	+uhGMNUk03MNLGcSqDnp87DWTNCEqfbHYFQEv+UOUDGBgMC/PYUA5hRceaA9PK5rdtt7mjh6t2w
	6lJx0hUi6Vopi/t5hhwyJvnlHNmcu6MMKS4YXaZPOhhqcFsORdwFjVB3yrBSpypa6eLGXiuVaR1
	vJGDshWoO8sJWJUXpZ/nj3B97vetlfnsaxxQQ+qQXUS6V4lpaCm/WxIMFuCdRLMMXCWffvPurx+
	cAmt6bEeznWaOQ3zSZp67HDMr8/PY1qpHJ2HKiGZy/TnFcj3YTeZrnLNrWfaNVP2GtgLqDAPtFB
	h5FJSB/hX3QoHmWRxd7Ffs5LbAdauwHUrkmzFK46GavqEtRnzXrfRxsjR0tp5TPmNTRga0QZmQo
	xHeub10vLocTYDkZYBwEnVkbZYrVd+vrMvhxdM5nQNaYhPsUjQ1b8UCeoyw/Z4JSXYOsqxBWAOb
	M+19HMZMUjk++Wc5oklJtsV0X70S0uIO5qk1i7RJOgR6qrwWLC02xanQNCwNhGvjheA/Y2fVjhL
	qr8gsnaDU2om3tM9QS7ovcMnl42GfPMpyX0noLCA6sPz6k9d
X-Received: by 2002:a17:90b:2641:b0:3a7:92c9:eacd with SMTP id 98e67ed59e1d1-3a89e9f07d3mr35851a91.0.1791308519038;
        Tue, 06 Oct 2026 10:41:59 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e35])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a89b2814a0sm595266a91.8.2026.10.06.10.41.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2026 10:41:58 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-kernel@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rosen Penev <rosenp@gmail.com>
Subject: [PATCH] uio: fsl_elbc_gpcm: make irq variable signed
Date: Tue,  6 Oct 2026 10:41:57 -0700
Message-ID: <20261006174157.44710-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.56.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The conversion to platform_get_irq() missed making irq signed as errors
are returned as negative integers instead of 0.

Move variable to keep reverse christmas tree ordering.

Fixes: c8295feb756f ("uio: fsl_elbc_gpcm: use platform helpers for resource and IRQ")
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202610061847.h2hn65y5-lkp@intel.com/
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/uio/uio_fsl_elbc_gpcm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/uio/uio_fsl_elbc_gpcm.c b/drivers/uio/uio_fsl_elbc_gpcm.c
index 08cb150fb12f..73528e8d73f6 100644
--- a/drivers/uio/uio_fsl_elbc_gpcm.c
+++ b/drivers/uio/uio_fsl_elbc_gpcm.c
@@ -303,12 +303,12 @@ static int uio_fsl_elbc_gpcm_probe(struct platform_device *pdev)
 	char *uio_name = NULL;
 	struct resource *res;
 	void __iomem *base;
-	unsigned int irq;
 	u32 reg_br_cur;
 	u32 reg_or_cur;
 	u32 reg_br_new;
 	u32 reg_or_new;
 	int ret;
+	int irq;
 
 	if (!fsl_lbc_ctrl_dev || !fsl_lbc_ctrl_dev->regs)
 		return -ENODEV;
-- 
2.56.0

