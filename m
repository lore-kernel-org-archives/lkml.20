Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EC263B4E95
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 06:47:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788936453; cv=none; b=aq+Jk10uHzzBJRN4Bhet55MrkRmncp195OFoZ1WI27e5YL6ChJqu2I1mdHc1o/xm1FyUw2+ii9MgLiJ6WBrsiCPokVG6HeGE2YPyWjcO+/xgu+AHmpWnH03rjNZ9xILTiPTZaSr5E3D7xydM6lY3LLSyOANRFpLPa6r6pn/fW2E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788936453; c=relaxed/simple;
	bh=EI7VM2ON6KRamJJXbdW6fU/u4YqvVqUrHz6Cnhh+u2c=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=FfhVxCtGLI/+W1TbROy00hxngMa07y0WRLFbczrlHd30T+g/CskRXGbrYbmnepXDMDkdUw0AO3lyZyY0azHxKcVZQBxE8xyFHaTnWqXchU8l1dVkKDoH4TYyeY9bsObf/mQTzTMXvrJIHtI4LXbLR4TZ0m2by/OuXwRflE0WPrc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=j/+8ThQc; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="j/+8ThQc"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-8525efa7274so3890384b3a.2
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 23:47:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788936450; x=1789541250; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Ik3KL7+y0N41oCb2NNpKID6MgBInjAT4MHxvZUuDwnk=;
        b=j/+8ThQcQvcNAuIII6/S43rjMk6N6RDqIDO7Mqz1z0C1bKV6GzWghwt5tO2JCLNnjp
         FycZ0ppjkmPBPNn3v6JftMcZc/U7yu+NLnixrBITxfxkh84xq77NhWLPqQ57/5tAY35T
         F7UF4L7PsRQd98ugYyAGpR7iAbSkwj8BFIZCNw8vsDOcMMHZqlPqBhO1DmIDtTL8yv72
         OnHxjMNO2at+5aCsAhqap5BLNdUz64KbkaIcl0GmWB9DFEFU4HOFUbpA0ffdyWbbvxKU
         rCPIf19RU3JY3k06Iodya/kqed7cKl7ddhzeJmlEjAUUdkqRmjiH2u80ySRJQkJo0Ifv
         AZRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788936450; x=1789541250;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ik3KL7+y0N41oCb2NNpKID6MgBInjAT4MHxvZUuDwnk=;
        b=esjkiz1o+19bLaIx4QqHQqO4Kq4XdPJ+LCxKqHd97WipfgeTKj1W2cJG6+ZlsJWaAO
         i/SesvJXnKYIDoly1tPbUkpm+aN8qvIYylaZxXHsd+KdIyXbdAwK56PCGWWud3dgEOaC
         BFOVqUHfjJYFN5ZtrwwEgmIBdaAT0FnslBqzA8gzeucfFlgj/6Drk/cCq7ZAI6bpm4NK
         vDIxTRCVeS1wNYyDmmi+RDJQHdelRh17e9xEt+9lr3bNIajlnMZh1S+RrF0T7W+2YOTf
         RCQG8siTHs6uextMG62XwlzvKHeXgYZ76bvOId01sKhVBDR+4pI8eIZVBI+siM62IoqP
         aVqQ==
X-Forwarded-Encrypted: i=1; AKwUvBz/z/lpP8hLocy5LbbLuB/iATP3VkLDJxatkjTZiO3hwG15CDTtBJhepDF9GRq1k6t1/Pq+FtaU9ol00Cc=@vger.kernel.org
X-Gm-Message-State: AFuF++mujDEXlU+A80OXSutjTxl/S6ej25CZOoWu2qI2IIgHE9t8VH2c
	6/RuevH4ZNRydJjofNuEzJ9SAoT3UOHC2hTaeViVu5BSbUoP/WCnONb8
X-Gm-Gg: AYBFou3kADvdqSxFBGc41nwekHp7Jk9V1kZlqAxLzd6Qk/dUBedLUdhw9cwKTib7l9W
	a0fDg2EDy+bZnUpHQuZVgZIKNeF6m0jVrsL7iSBYZOehSgn2Rct9qLW5IH0NsqSPZ9mEj/4skPU
	ZgLWkBeGw9PiHHiHTnwR0X+XcOQ8H75ZUr9NMBZhwbH7ABqJjgJXJbkt/T6wdFW8bRrevpYpS9H
	plInIRLCVMBaElBKjIxm1mpWin09shk0/IAOgcBoxbYigywdytvPs15H79/QsbWLf4//xW78jog
	KbmGgrd+as9eq+vFimqfsLABGswHNaqzxeRYiZK0fRwd9hREghPKtVN1EXTcZCmZTx2GnoAWZX/
	JSH33Tbai97dEzDwzfAb74TOZtI3u59mIZwgyG2GBBDez1Y2QchllPKd0EfAtdtBY7eK7XPc0sX
	cPOWrrE7Ko5wpEYSN99Fe4XwZeoREMeHRogS92izqQKnlHNFo0EbuLYAEYChNNUZHe6AMZvqenh
	M4tQ52htCqU4g0pNGMwVEixR1pXBdXMbhEabXXREPuFJkJGaH/7Q3wHNXF+ZJKhySEmMzO65y/L
	QcmFRNVHVPppe5w=
X-Received: by 2002:a05:6a00:13a2:b0:858:6307:5f7d with SMTP id d2e1a72fcca58-86166dbb899mr46400530b3a.8.1788936449696;
        Tue, 08 Sep 2026 23:47:29 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-86152045e8dsm6406973b3a.20.2026.09.08.23.47.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 23:47:29 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Wei Fang <wei.fang@nxp.com>,
	Frank Li <frank.li@nxp.com>,
	Shenwei Wang <shenwei.wang@nxp.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	Simon Horman <horms@kernel.org>,
	davem@davemloft.net,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Richard Cochran <richardcochran@gmail.com>,
	Stephen Boyd <swboyd@chromium.org>,
	imx@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH net v5 1/2] net: fec: Propagate PTP initialization errors
Date: Wed,  9 Sep 2026 13:47:11 +0700
Message-ID: <20260909064712.22539-1-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

Change fec_ptp_init() to return an error code instead of silently
ignoring failures during PTP initialization.

The PPS IRQ is not required for the FEC/PTP functionality, so its
absence should not make the probe fail. However, an unavailable
optional IRQ should be distinguished from an actual error returned
during the IRQ lookup.

If a platform does not support the PPS IRQ, it can omit the IRQ from
its device tree and the optional lookup will return -ENXIO. Propagate
other errors from the IRQ lookup instead of silently ignoring them.
In particular, silently ignoring -EPROBE_DEFER can cause the driver to
continue probing instead of deferring as required.

Also propagate failures from devm_request_irq() and ptp_clock_register().

Update the function declaration in fec.h accordingly.

Found by manual code inspection.

Fixes: b86bcb299092 ("net: fec_ptp: Use platform_get_irq_xxx_optional() to avoid error message")
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---

Link v1: 
https://lore.kernel.org/all/20260820111416.97917-1-phucduc.bui@gmail.com/
Link v2:
https://lore.kernel.org/all/20260903092430.354186-1-phucduc.bui@gmail.com/
Link v3:
https://lore.kernel.org/all/20260904105542.70540-1-phucduc.bui@gmail.com/
Link v4: 
https://lore.kernel.org/all/20260907034502.12619-1-phucduc.bui@gmail.com/

Changes in v2:
 - Squash the two patches into one.
 - Add error handling for platform_get_irq_byname_optional().
 - Fix error handling for ptp_clock_register().
Changes in v3:
 - Retarget the patch to the net tree instead of net-next.
 - Add error handling for platform_get_irq_byname_optional() 
   in fec_probe() for the fec_enet_interrupt IRQ.
Changes in v4:
 - Use a goto label for cleanup instead of returning directly on errors 
   from platform_get_irq_byname_optional() in probe().
 - Update the commit message.
Changes in v5:
 - Split the optional IRQ handling in fec_main.c into a separate patch.

 drivers/net/ethernet/freescale/fec.h      |  2 +-
 drivers/net/ethernet/freescale/fec_main.c |  7 +++++--
 drivers/net/ethernet/freescale/fec_ptp.c  | 22 ++++++++++++++--------
 3 files changed, 20 insertions(+), 11 deletions(-)

diff --git a/drivers/net/ethernet/freescale/fec.h b/drivers/net/ethernet/freescale/fec.h
index 7176803146f3..8831da37326b 100644
--- a/drivers/net/ethernet/freescale/fec.h
+++ b/drivers/net/ethernet/freescale/fec.h
@@ -692,7 +692,7 @@ struct fec_enet_private {
 	u64 ethtool_stats[];
 };
 
-void fec_ptp_init(struct platform_device *pdev, int irq_idx);
+int fec_ptp_init(struct platform_device *pdev, int irq_idx);
 void fec_ptp_restore_state(struct fec_enet_private *fep);
 void fec_ptp_save_state(struct fec_enet_private *fep);
 void fec_ptp_stop(struct platform_device *pdev);
diff --git a/drivers/net/ethernet/freescale/fec_main.c b/drivers/net/ethernet/freescale/fec_main.c
index 794ec427b0ee..c6e29b5c2abb 100644
--- a/drivers/net/ethernet/freescale/fec_main.c
+++ b/drivers/net/ethernet/freescale/fec_main.c
@@ -5384,8 +5384,11 @@ fec_probe(struct platform_device *pdev)
 		goto failed_reset;
 
 	irq_cnt = fec_enet_get_irq_cnt(pdev);
-	if (fep->bufdesc_ex)
-		fec_ptp_init(pdev, irq_cnt);
+	if (fep->bufdesc_ex) {
+		ret = fec_ptp_init(pdev, irq_cnt);
+		if (ret)
+			goto failed_reset;
+	}
 
 	ret = fec_enet_init(ndev);
 	if (ret)
diff --git a/drivers/net/ethernet/freescale/fec_ptp.c b/drivers/net/ethernet/freescale/fec_ptp.c
index 56801c2009d5..557a76797eba 100644
--- a/drivers/net/ethernet/freescale/fec_ptp.c
+++ b/drivers/net/ethernet/freescale/fec_ptp.c
@@ -736,7 +736,7 @@ static irqreturn_t fec_pps_interrupt(int irq, void *dev_id)
  * cyclecounter init routine and exits.
  */
 
-void fec_ptp_init(struct platform_device *pdev, int irq_idx)
+int fec_ptp_init(struct platform_device *pdev, int irq_idx)
 {
 	struct net_device *ndev = platform_get_drvdata(pdev);
 	struct fec_enet_private *fep = netdev_priv(ndev);
@@ -779,26 +779,32 @@ void fec_ptp_init(struct platform_device *pdev, int irq_idx)
 		      HRTIMER_MODE_REL);
 
 	irq = platform_get_irq_byname_optional(pdev, "pps");
-	if (irq < 0)
+	if (irq < 0 && irq != -ENXIO)
+		return irq;
+	if (irq == -ENXIO) {
 		irq = platform_get_irq_optional(pdev, irq_idx);
-	/* Failure to get an irq is not fatal,
-	 * only the PTP_CLOCK_PPS clock events should stop
-	 */
-	if (irq >= 0) {
+		if (irq < 0 && irq != -ENXIO)
+			return irq;
+	}
+
+	if (irq > 0) {
 		ret = devm_request_irq(&pdev->dev, irq, fec_pps_interrupt,
 				       0, pdev->name, ndev);
 		if (ret < 0)
-			dev_warn(&pdev->dev, "request for pps irq failed(%d)\n",
-				 ret);
+			return ret;
 	}
 
 	fep->ptp_clock = ptp_clock_register(&fep->ptp_caps, &pdev->dev);
 	if (IS_ERR(fep->ptp_clock)) {
+		ret = PTR_ERR(fep->ptp_clock);
 		fep->ptp_clock = NULL;
 		dev_err(&pdev->dev, "ptp_clock_register failed\n");
+		return ret;
 	}
 
 	schedule_delayed_work(&fep->time_keep, HZ);
+
+	return 0;
 }
 
 void fec_ptp_save_state(struct fec_enet_private *fep)
-- 
2.43.0

