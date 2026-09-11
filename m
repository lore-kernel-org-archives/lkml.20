Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EE7337189C
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 04:03:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789099388; cv=none; b=NMLbFuVR1QX5OPAWuzsXkOxhaCOAZSgijWD7DzIxYe8qkfCPh2jBAWszC1F3f9RIGz2QE1SDOcsTZXlluViA3CnIToe6/odOw1zYrIKEgoUN0SlcfWzBzJOUKTVP+C0YAyqc1JRcm8TXa8DGEQ9LjZdF6ypNvYka15SHhJZMyVk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789099388; c=relaxed/simple;
	bh=IgwObzddcAie/4ssXOHw1non08WFLdP49gahv5W1gZs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=QAL131QlkPeSrhlg+sXtAho8nwUC1zWBBq0xJPJxOw4JYfSVRFzVCQ7ENCx+YQQpwSCuiMjDMIf1kQ3375dLIBhbGJEpzco1i98H4sJds2asfAzIo/hbByp35ioQSC5rzC1sCtKOvVsKhEuUte4Z4YWFKivjfvthkelywgUqdKA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=a7AJLMwF; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="a7AJLMwF"
Received: by mail-pj2-f12.google.com with SMTP id d9443c01a7336-2d90ba1d807so4919285ad.3
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 21:03:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789099386; x=1789704186; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=tl/50LVPPebfYkiCoTtA5M0k+XWm+DREmFNMY14yWU8=;
        b=a7AJLMwFsswUbr04Q4Fj2x5nrm7i3fxQBWauKDBW4OgK4662FyMD790uM+OZSjUwSK
         E60+HBPw0eCnzm6w7cTauDAkRzx7jZEB27NZNzPsSoNPwIdnZhdj2RR8/wc8fLXhpS3g
         kDNzh4yd5n0qQ65biOYLgMtBhPufMY4fOAOZudFKRkdBhuYVPcujmjyhjN3OynHDF6wN
         Jg2C/qYcB7qBepSTLLLwZFxubhrvPZss+L1ORs64qcImgIeQWDASndrNkAzeJkSOceWN
         EcQAuhYsPffBv0Hjrz0rF/K14ovGBXXmsxy/faZb0xJBaw1VVuudsdjJnG3M8KRYlFwb
         /fYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789099386; x=1789704186;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tl/50LVPPebfYkiCoTtA5M0k+XWm+DREmFNMY14yWU8=;
        b=d8531uXZYv76dAejKjr3vwuY2eH+j1xzF97XhbSUCgrNlokSEogqSDvC8bdlsvW4Qy
         Ji1NOKjB7psSxbVYBD263Eok8iYahEDfPOIvsQOJ4THimQbxzFX0D8jFEobDZhtmpImS
         sxSvi2s0nLY7H+XOzdr05krfQajm0WVaKxOiN9S5iRUe317zGz0dCfSsTnZn11KbSj3w
         gVTFIRx1dxEj0iBFL98vIRbmxNZSBVMdYnkCLMGkmejit1sNNfTDZx6PV9aAOFBOi6km
         3K8CKCvhCFSnQGudl+0KUM1pY4qGbmVA5hyb7WkG5xSgsFFbaLshNLTOKBTvd5yE3fg4
         gR6g==
X-Forwarded-Encrypted: i=1; AKwUvBwsO7DZncBgGrlER7D0Ica7Hs+8r0f4hd5vohQguSwwoCqAGtun8yqB41goKq7FH+3ml63/8Rn+9zlapaU=@vger.kernel.org
X-Gm-Message-State: AFuF++k3e80az4wEehcBkpqkhRxjfjVs3uQjP5Y3V+cLxjPmLJB5bZA6
	XS+mNNXCEr3ijoA6OiUWFvmK+QctmHibahqLyLH6lWVyOvIDQyuox/Up
X-Gm-Gg: AYBFou1BMpyggOjvhqotCvpQcx7jBqirVC9afw+onIPiPW3a740wU2npFIgehgDOtKu
	4LiqcFj43I97xftRZS+kfC/O4mKsIy2MfrDTdxDDxSadL+bivWHGTKlLwtEA74Kd3JDfbg2O7VL
	RWouvk8XHQsL8o6e+lBCx4oi7cSHh+ezbkkeVwyEucNpygFFKTDosjzJV7V9N7U7mJJNsI4dW//
	FBxsgjVpzjEDCUqkH+ccxvFzMVWduBRz2tO3tVkavmOgp1CSZ7aL+v0TBd/YUuoI8xQ/ru5x/yU
	LJMRiuHyZFqGMQte6mufhE8jkiUIzDv949Zcu2TzI9hNUgzNSZGMlaIfiJW6n+Q1MoaTeBF8Vqa
	I+yf5MUyt03JjizLwQy/9c+oU/pmgnXIdRYrKay9Ai2YVHlVD0K0qrJxL+W2QpmolKfpMSwuU0r
	V9wgDM9Wqv6TIfb3bmLkTvNguePlVEFHUPeH6Pk2g3Oq7+3/TZslAC6jrFTFFm0GF5YNGf1fLB5
	hNBNSjP9AsB6Ac1CwBfW89EzmBUmopiK5L0QiYL4WT1RtGSEn5x+3Yr120xhckyjCQIxOqw/q12
	NhhscwJzSZ2O9TU=
X-Received: by 2002:a17:903:2451:b0:2db:7269:38ef with SMTP id d9443c01a7336-2dd2a3362camr46154855ad.14.1789099385731;
        Thu, 10 Sep 2026 21:03:05 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2dd2cfc2d3bsm4670925ad.48.2026.09.10.21.03.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 21:03:05 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Wei Fang <wei.fang@nxp.com>,
	Frank Li <frank.li@nxp.com>,
	Shenwei Wang <shenwei.wang@nxp.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	davem@davemloft.net,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Richard Cochran <richardcochran@gmail.com>,
	imx@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH net-next v6 1/2] net: fec: Propagate PTP initialization errors
Date: Fri, 11 Sep 2026 11:00:20 +0700
Message-ID: <20260911040021.12289-1-phucduc.bui@gmail.com>
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

Reviewed-by: Wei Fang <wei.fang@nxp.com>
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
Link v5: 
https://lore.kernel.org/all/20260909064712.22539-1-phucduc.bui@gmail.com/

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
Changes in v6:
 - Add a KDoc comment for fec_ptp_init().
 - Repost this series for net-next without the Fixes: tags.


 drivers/net/ethernet/freescale/fec.h      |  2 +-
 drivers/net/ethernet/freescale/fec_main.c |  7 +++++--
 drivers/net/ethernet/freescale/fec_ptp.c  | 24 +++++++++++++++--------
 3 files changed, 22 insertions(+), 11 deletions(-)

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
index 56801c2009d5..0574a1a18702 100644
--- a/drivers/net/ethernet/freescale/fec_ptp.c
+++ b/drivers/net/ethernet/freescale/fec_ptp.c
@@ -734,9 +734,11 @@ static irqreturn_t fec_pps_interrupt(int irq, void *dev_id)
  * This function performs the required steps for enabling ptp
  * support. If ptp support has already been loaded it simply calls the
  * cyclecounter init routine and exits.
+ *
+ * Return: 0 on success, or a negative error code on failure.
  */
 
-void fec_ptp_init(struct platform_device *pdev, int irq_idx)
+int fec_ptp_init(struct platform_device *pdev, int irq_idx)
 {
 	struct net_device *ndev = platform_get_drvdata(pdev);
 	struct fec_enet_private *fep = netdev_priv(ndev);
@@ -779,26 +781,32 @@ void fec_ptp_init(struct platform_device *pdev, int irq_idx)
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

