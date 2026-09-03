Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 316BB3F4830
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 09:25:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788427513; cv=none; b=kn2gezOO4LNLqNRxoANJaT/frTcN27gzg/nPV7YW5LCeTAPM7WQdJm+RmPqutU5da2QMuHQfM8KYVvvkHN+RvHgz02UFFC6HlbOeFYKqxJrkv/Nn0wfNWaRIKmacKk8O4BQrNfr8GAm26KfLQ51cIu/JsrQwxjelRrAq7Q+hAhc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788427513; c=relaxed/simple;
	bh=94yqjhsBr5rPIKFH2AgXcHWBJxd83fBZ4CFS7MZdBlc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Wrc72cW8sBG+920iXOpwR66Kd1No9OY7zprqdhtD9Xi7/kulyxZO8AEhxL6sJm0eJOUb81ixy+wIi1fViHcSUTaIosjkihaIx1SknK2u9qS2stWLi3zq9Lhaqx9R2KrSBZMEZi70FG2l7Zw+6Ft4cplwAH4j4eolNKC/+aalfmg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZVvOk50o; arc=none smtp.client-ip=209.85.215.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZVvOk50o"
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-cbee846deecso2756696a12.1
        for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 02:25:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788427509; x=1789032309; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=fOIXCrUO/IV1dzZwAc5lm4gP31IHeNSIKWytFXngFg0=;
        b=ZVvOk50oaPxhQ8avb6EVuokYV+8HBhrI6x3FFNCoFU++O8M8rfFkT4KiUiVK6D6Klh
         suzVEzSLx/S5fDWfT8DLmg+0R5MXmxLxzldECN3Mqy7ntEOkt8jxCGH0TajG6TXxNxID
         RqIJbdq7ipB1UTQG0onERh+aHa/dJOYang54EiSkmivBmG8PkeUfEdrx7dZn2Q6PP9JQ
         FDTCdeWYozkAg9nrIXMMTp3NDESLvISZVUGEbL0uDlxoQgqiIKhX49zgIpf8TSRBrThp
         YcCjU46kdyXZaIakLf75OYb6yDBQa/FqXCVzJbJPSrDo55K7nv+4AmZMNe3qZDCi11vc
         ZoJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788427509; x=1789032309;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fOIXCrUO/IV1dzZwAc5lm4gP31IHeNSIKWytFXngFg0=;
        b=PU5nhmOfUBLe4sm6BoNEZL/HCn5W1LW13+MxFUBuNLG4N6r5w+2XrW35E3GVdyczAZ
         je4qL/fRtYRVICk3JwGx4OJoeWbscF4QeWm6LKOs35ahVkNCafCt3QJlpXK0P+fBZ9zu
         TpyVMR/dZaU2z5nSElr+NGdZojOXhJbXndiHAWZmv4z4i4AQCAd8S//NVi/HGBw21C75
         gylE8MM4G3xeN0z0L0bfQpHHyZn6k3R+GViTI4Y8QPCKiIufnGefkUwLwBdUCBI9WolA
         hqnD0Uz99cy5cd8O0dDb5SKbuyrHzpgLJBZSBRl+pSP1DO4ThZ63sG3Zvfmch6+fF29U
         O3KQ==
X-Forwarded-Encrypted: i=1; AKwUvBxGZP9MFy90LxcEHfV6KlPTp984aNnHa5N8W5kLUJvZjXpjPboQzvnxtNEboAj3jxhl1wg8kRA2Qlanj2E=@vger.kernel.org
X-Gm-Message-State: AFuF++m8hxaG/wF/exwUWejERn95/P6iaOBhfeU53+E8U3FVIHqH7XhI
	l1VhFJTjVEiBKyPsUCnFZmH1f7UBxVh5gglrFp8wclhlkhI+V+g2Y4r1
X-Gm-Gg: AYBFou3MQfP2AOTJEqQYnO3wgww3HQN3X3kt1vOy0WWlqju8HTmF7iMvEfkNVgshA5q
	6+nkOW9mkLc3KJ3HL5b/fFpAxxFApbbqAkMzllCRTVTIUnILnnji+PLlqxaHdhQHWSGagT/gk/K
	jQjhAZIFNyD+WcdNcgQhgfZEAZL7BJCco6JBfaskj0mWi1GlWqvhrnLKk2VxEILQRRY84teWe16
	doQGDknE/H8P4ok50b7kXh9Nvcc1uippZxHMUh9+u7QvEp0Y6ngIyGrMnvKBxxUadatekkr1CBr
	jLZM7J601qKI8O2e3JN8etLdWPPbqiChr8ov423J419eYNFhS7vJ0v58kxBSvZY6ASl+8Ubm2Et
	QVITAxMkJ2mpk8NN06gwiGNaYWlbh9iQjUtfbGVVWAMb4rgEM5gDa0/3vIuiBgFNDrLwaL305Lg
	9Dv/AwPAXLM4Q1av89WyYUaFdkU3ghB6oUlDDs4FnI3qw4TcXGXmmsENQ/JBpQzl6p9AUknww7B
	ZsnplRYcs3l7lyALTD0TBiiLves65TAT8yNPCvQxEpuH41BxpMaN3jsJOxFKQ7TNRwlnBIAKlfx
	HWa0
X-Received: by 2002:a05:6a20:d502:b0:3c4:1493:6822 with SMTP id adf61e73a8af0-3d9b1f5e8edmr19128499637.18.1788427509232;
        Thu, 03 Sep 2026 02:25:09 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc43d3a33a7sm675376a12.11.2026.09.03.02.25.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 02:25:08 -0700 (PDT)
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
	Fugang Duan <fugang.duan@nxp.com>,
	Anson Huang <Anson.Huang@nxp.com>,
	Stephen Boyd <swboyd@chromium.org>,
	imx@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH net-next v2] net: fec: Propagate PTP initialization errors
Date: Thu,  3 Sep 2026 16:24:30 +0700
Message-ID: <20260903092430.354186-1-phucduc.bui@gmail.com>
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

Also propagate failures from devm_request_irq() and ptp_clock_register().

Update the function declaration in fec.h accordingly.

Found by manual code inspection.

Fixes: b86bcb299092 ("net: fec_ptp: Use platform_get_irq_xxx_optional() to avoid error message")
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---

Link v1: 
https://lore.kernel.org/all/20260820111416.97917-1-phucduc.bui@gmail.com/
Changes in v2:
 - Squash the two patches into one.
 - Add error handling for platform_get_irq_byname_optional().
 - Fix error handling for ptp_clock_register().

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

