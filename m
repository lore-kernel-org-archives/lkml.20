Received: from sg-2-5.ptr.blmpb.com (sg-2-5.ptr.blmpb.com [71.18.227.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D3A3258EE9
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 01:50:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=71.18.227.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790646632; cv=none; b=HRn+UxpkaE2Hw2qekJ+X7ar3UGtFghXRalDf9byuR01dNGaxRKI8Sb0C64GtHL5GYRMMo+cksuF6hGvGJ+7kprsdSr9cAajuQDukVHs7E06pkJDg6vFpRXezR5UvFEcvJxC11IuERepoH2f9KbHgnC88+dTfzOEyjzOLHuje9c4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790646632; c=relaxed/simple;
	bh=yefuVjMK1ZYavhuEHMGRV0T3sUE22qFARYEmrVkxWlc=;
	h=To:Cc:Date:Content-Type:In-Reply-To:Subject:Mime-Version:
	 References:From:Message-Id; b=HCmgsb37tSt9bb2j5KcM+BNFrk5C/t6jL5fRqqNyhKkdp12CZRWhi7CvaFjoIa25kdVIgSlbbiGO0pL9Rg3L2Y9gfVgx63gOiLRQFHp0i+lnYySrNDnydwjJPHNvaCn5m5PEJCSLCsjV/bS/38bxycG0FgOKaNxIWny/sTu6GGg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cherr.cc; spf=pass smtp.mailfrom=cherr.cc; dkim=pass (2048-bit key) header.d=cherr.cc header.i=@cherr.cc header.b=HgmB5UDW; arc=none smtp.client-ip=71.18.227.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cherr.cc
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cherr.cc
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cherr.cc header.i=@cherr.cc header.b="HgmB5UDW"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=feishu2604220257; d=cherr.cc; t=1790646616; h=from:subject:
 mime-version:from:date:message-id:subject:to:cc:reply-to:content-type:
 mime-version:in-reply-to:message-id;
 bh=BxYVJVeargDdL2xWTmBHr9IS5rEuYql6GGXbaVald+g=;
 b=HgmB5UDW7/MIQxGcLLWsKK0n8AA51HDwQbdLMFx9RatJK7pHAKf8HK5HWq6Uu11vnyKjcP
 xjqiYfxAGbJB4Ow5th+fC7EgNXYUlw9XxYNgQqz/MxqeJ2Br4ZFMxlTuz5G+OhHmbJUR8T
 9oI0J0nDFOTjWxphdp5h8AEoiu8v0vCxAGOePuinWnOChGS+5xDhdKwXL5aH5DMNa65h30
 T5gLMCkohnbdsrFfd3yJPepFBwgmy0jKRWOYvafsLL2O25p1Pswo+gkraT+5WH496RyNbz
 /BNc3JvqP189Lie33WjeZkiYOMIAvPO46T14NptLL9qAMw+rL1VjfLl5r0/Rpg==
X-Lms-Return-Path: <lba+26abb1957+5f0ff3+vger.kernel.org+me@cherr.cc>
Content-Transfer-Encoding: 7bit
To: "Wei Fang" <wei.fang@nxp.com>, "Frank Li" <frank.li@nxp.com>, 
	"Shenwei Wang" <shenwei.wang@nxp.com>, 
	"Andrew Lunn" <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, 
	"Eric Dumazet" <edumazet@google.com>, "Jakub Kicinski" <kuba@kernel.org>, 
	"Paolo Abeni" <pabeni@redhat.com>, 
	"Richard Cochran" <richardcochran@gmail.com>, 
	"Troy Kisky" <troy.kisky@boundarydevices.com>, 
	"Fugang Duan" <fugang.duan@nxp.com>, 
	"Lucas Stach" <l.stach@pengutronix.de>
Cc: "Simon Horman" <horms@kernel.org>, "Phuc" <phucduc.bui@gmail.com>, 
	<imx@lists.linux.dev>, <netdev@vger.kernel.org>, 
	<linux-kernel@vger.kernel.org>, <stable@vger.kernel.org>, 
	"Shengzhuo Wei" <me@cherr.cc>
Date: Tue, 29 Sep 2026 01:50:06 +0000
Content-Type: text/plain; charset=UTF-8
In-Reply-To: <20260929-fec-ptp-pps-event-uaf-v4-0-f54208df8bff@cherr.cc>
Subject: [PATCH net-next v4 2/2] net: fec: free the PPS interrupt before tearing down the PHC and netdev
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Received: from [127.0.1.1] ([111.42.148.12]) by smtp.feishu.cn with ESMTPS; Tue, 29 Sep 2026 09:50:14 +0800
References: <20260929-fec-ptp-pps-event-uaf-v4-0-f54208df8bff@cherr.cc>
X-Mailer: b4 0.16.0
From: "Shengzhuo Wei" <me@cherr.cc>
Message-Id: <20260929-fec-ptp-pps-event-uaf-v4-2-f54208df8bff@cherr.cc>
X-Original-From: Shengzhuo Wei <me@cherr.cc>

The devm-managed PPS interrupt remains registered until after the
remove callback returns, outliving both the PHC and the netdev.
An in-flight handler can call ptp_clock_event() during PHC teardown,
and a later interrupt can dereference the freed netdev.

Use request_irq() and record the IRQ after a successful request,
then release it with free_irq() in fec_ptp_stop(), before
ptp_clock_unregister(). This removes the handler and waits for any
running instance to finish before the PHC and netdev are torn down.

Also free the IRQ if ptp_clock_register() fails: fec_probe() unwinds
that error through failed_reset, bypassing fec_ptp_stop().

Fixes: 4ad1ceec05e4 ("net: fec: Let fec_ptp have its own interrupt routine")
Cc: stable@vger.kernel.org
Assisted-by: GLM:5.3
Signed-off-by: Shengzhuo Wei <me@cherr.cc>
---
 drivers/net/ethernet/freescale/fec.h     |  1 +
 drivers/net/ethernet/freescale/fec_ptp.c | 12 ++++++++++--
 2 files changed, 11 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/freescale/fec.h b/drivers/net/ethernet/freescale/fec.h
index 8831da37326b..9a7ec5abc9db 100644
--- a/drivers/net/ethernet/freescale/fec.h
+++ b/drivers/net/ethernet/freescale/fec.h
@@ -670,6 +670,7 @@ struct fec_enet_private {
 
 	/* pps  */
 	int pps_channel;
+	int pps_irq;
 	unsigned int reload_period;
 	int pps_enable;
 	unsigned int next_counter;
diff --git a/drivers/net/ethernet/freescale/fec_ptp.c b/drivers/net/ethernet/freescale/fec_ptp.c
index 0574a1a18702..27603af95d00 100644
--- a/drivers/net/ethernet/freescale/fec_ptp.c
+++ b/drivers/net/ethernet/freescale/fec_ptp.c
@@ -790,10 +790,10 @@ int fec_ptp_init(struct platform_device *pdev, int irq_idx)
 	}
 
 	if (irq > 0) {
-		ret = devm_request_irq(&pdev->dev, irq, fec_pps_interrupt,
-				       0, pdev->name, ndev);
+		ret = request_irq(irq, fec_pps_interrupt, 0, pdev->name, ndev);
 		if (ret < 0)
 			return ret;
+		fep->pps_irq = irq;
 	}
 
 	fep->ptp_clock = ptp_clock_register(&fep->ptp_caps, &pdev->dev);
@@ -801,6 +801,10 @@ int fec_ptp_init(struct platform_device *pdev, int irq_idx)
 		ret = PTR_ERR(fep->ptp_clock);
 		fep->ptp_clock = NULL;
 		dev_err(&pdev->dev, "ptp_clock_register failed\n");
+		if (fep->pps_irq > 0) {
+			free_irq(fep->pps_irq, ndev);
+			fep->pps_irq = 0;
+		}
 		return ret;
 	}
 
@@ -869,6 +873,10 @@ void fec_ptp_stop(struct platform_device *pdev)
 
 	cancel_delayed_work_sync(&fep->time_keep);
 	hrtimer_cancel(&fep->perout_timer);
+	if (fep->pps_irq > 0) {
+		free_irq(fep->pps_irq, ndev);
+		fep->pps_irq = 0;
+	}
 	if (fep->ptp_clock)
 		ptp_clock_unregister(fep->ptp_clock);
 }

-- 
2.47.3
