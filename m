Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED90849B20B
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 13:15:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788354923; cv=none; b=qcVFQRavELHAu5NHYxAJniqHYNmQRSf+cMhJRsS/ykQPhB+iyu1Ds+eBbaMa9XzeFeeND3sl69/sRek/XZMDnIMJdIbm78QUjfmgzuS796tCldYNDPZMPVnYxKIeVpzQNVCe7JyCZ3G3AgaxqliHICbhrz+AgFsTV652+wNdUEI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788354923; c=relaxed/simple;
	bh=F9fzgHhX7KmLU7fZe0wIbc7xU5PLz76eTaG+y6Qicy8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=nF4/uPUJpmp380YezlZTHk4FHph66SP7CFbRcZrwTYoU9cNxSWsMF9A1am1AdqOg3k/lig+tl1edRon1Y/uFgbk0J07e5iQLVuJ+wx5dF3WAV2C0IbzzyJV2FyLRjcjFJoAbiTPDyoggz/Edsnm4yYg6rGpzipyrAWOT45cygJ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sy0KlJ41; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sy0KlJ41"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-8557c3f270eso501100b3a.3
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 06:15:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788354921; x=1788959721; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cejd0cZegTiU5eLrTw8z7B4m6z4YgdNMNLU4CE0opBk=;
        b=sy0KlJ41e/2wD4qyxI8BudEND+i9+Lw9Ts6HSM7ANhS5F/rsxq65/rbpxnSGBcdwE3
         PrHI1Er2mpVncRPkvJKSR2vmkcSThB9o/DOalRf1Ui9km/61+a8rbH55L3HN9lYATTzb
         PurPEaUbU0eSTzuCakXdtoO0GZQg54qfE3sS+mX5dovQ0ymf2drl5wDD7Kefz7LwtzPC
         JIiroLiPBj0nxCL9oTa0OQbpqqsOt7WmkPN2vkchYdnPI+5qed0jqmuxWRb7cL8ggQaB
         5Dj1fX0XY8S8A4OqOh38hKqdywHy/2zcjGT5zR1spVbqRL8tYPmXufvbh8UT3lL11vqr
         oQRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788354921; x=1788959721;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=cejd0cZegTiU5eLrTw8z7B4m6z4YgdNMNLU4CE0opBk=;
        b=V3GGE+8xU2p5nLmWYmtgvG4VfFbh983CYuHwS8o6A3ICy+87hPszPj05yX9GCAT2Q4
         03GijNyDuehxL707h1FFiXROMZEXLO090ElO+UjRIegmf6w7ibvK5YRARKYf4SyaO3Kg
         6QhAWy7vOLusmls4KHTwyJp2TtwRFeCc3Q5rC+kF9WnevJTNNViCAlhlqC+TisL5sm7f
         L+kNaboZN4p3sbmS66QpAvFno9osvQCNbT7AQsbgHrC5r7C66DMuvfQlkQ7VY4R0/G3w
         qGLz85rErNz+/aPn38C7gaIt3hiz8UBqPb7ePHooGiBnofgMmc0a2HjH8Weuo4Pq9Qnm
         gptw==
X-Forwarded-Encrypted: i=1; AKwUvByzXUV8pjJA2d+4UvVwSAX7AGo4xIiaH9wZHDzs/YE2CDqPwf+Oevy/8IaBbp+hqBcsiJtSmDjzZW5m6xQ=@vger.kernel.org
X-Gm-Message-State: AFuF++ljGMy/EskmehFZTWV6aCMUvg1tUWns+ueuEH608wHYhxEzd3KV
	pi2TPrre3xxDFGHzi9CTGRp+sM7H+TohVr5XZqitZGkXe+SLKukas0pE
X-Gm-Gg: AYBFou3U7HDBUaxzO6Uqq77zGxfUnUIjZIRUw5UX7QpLdWSFsQXX0l2vuqv1/o45tEy
	X260q1D+Tu8kIjolRSdyRWG8Yc6sVkp2PbKa8PX3vUIVqC+O0gevtJrefUJlAbuHmBW7l75Rm5y
	2kE24+jaqauJlmw2N5tvqA8luONQuLx8XcUsIWiOlExkWraPEiLGEwpsbB0zWS3700sEkm5Uhow
	EWR9XiNrrpIdtM74FLgg0XOmYIFekoKMKzPeAL2My+BIh3/BVI9p09N3Chq70jE/SEzbI4as9EZ
	gc+0D85EsnFQ8GSeKTNNp/5YIJ1JxlnmCnyfueMgU6dbwcSDazctQRBo+uJzkU4+nP4qz1IDSEK
	XZFN2v2PQ+Z1pJTsE/9bTg/C1TXpYc62fKylmrs6TrDE3A7iRSzN5rKcaUfYVpfMNOXWYUQYrO8
	wRBx1nV0640jA8qHZO11mX9OH/R0Fepxg2QZ0BYWs7WcKbzyJ4YwsIkNcVkto=
X-Received: by 2002:a05:6a00:6c99:b0:84c:4b58:2cec with SMTP id d2e1a72fcca58-85ed8ed8ca3mr7824675b3a.15.1788354920846;
        Wed, 02 Sep 2026 06:15:20 -0700 (PDT)
Received: from server227.. ([39.170.101.209])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-85da342023asm1398533b3a.0.2026.09.02.06.15.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 06:15:20 -0700 (PDT)
From: Zxyan Zhu <zxyan0222@gmail.com>
To: andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com
Cc: mcoquelin.stm32@gmail.com,
	alexandre.torgue@foss.st.com,
	richardcochran@gmail.com,
	maxime.chevallier@bootlin.com,
	muhammad.nazim.amirul.nazle.asmade@altera.com,
	rohan.g.thomas@altera.com,
	netdev@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Zxyan Zhu <zxyan0222@gmail.com>
Subject: [PATCH net-next v4 2/2] net: stmmac: dwmac-socfpga: mask XGMAC_TSIE during cross-timestamp
Date: Wed,  2 Sep 2026 21:14:41 +0800
Message-Id: <20260902131441.322167-3-zxyan0222@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260902131441.322167-1-zxyan0222@gmail.com>
References: <20260902131441.322167-1-zxyan0222@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Agilex5 smtg_crosststamp() handler arms an internal auxiliary
snapshot, toggles GPO0 and then polls XGMAC_INT_STATUS for TSIS in
process context to learn that the snapshot is ready.  Unlike the Intel
cross-timestamp path it does not set STMMAC_FLAG_INT_SNAPSHOT_EN, so it
relies on nothing else consuming TSIS.

Once XGMAC_TSIE is unmasked (done by a companion change that enables it
in XGMAC_INT_DEFAULT_EN), the DWXGMAC2 timestamp interrupt handler runs
from hardirq on every timestamp event and clears TSIS by reading
XGMAC_TIMESTAMP_STATUS.  That read can win the race against the poll
loop, which then times out and makes PTP_SYS_OFFSET_PRECISE fail with
"Wait for time sync operation timeout".

Mask XGMAC_TSIE around the snapshot trigger and FIFO read so the hardirq
handler cannot clear TSIS while smtg_crosststamp() owns it, and restore
it on every return path.

Tested-by: Nazim Amirul <muhammad.nazim.amirul.nazle.asmade@altera.com>
Signed-off-by: Zxyan Zhu <zxyan0222@gmail.com>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-socfpga.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-socfpga.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-socfpga.c
index 1d7f0a57d288..a4d00bf81423 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-socfpga.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-socfpga.c
@@ -310,6 +310,13 @@ static int smtg_crosststamp(ktime_t *device, struct system_counterval_t *system,
 	if (priv->plat->flags & STMMAC_FLAG_EXT_SNAPSHOT_EN)
 		return -EBUSY;
 
+	/* The XGMAC timestamp interrupt handler clears TSIS by reading
+	 * XGMAC_TIMESTAMP_STATUS, which would race with the TSIS poll
+	 * below.  Mask XGMAC_TSIE for the duration of the cross-timestamp
+	 * so the handler does not run while we own the snapshot FIFO.
+	 */
+	stmmac_mac_irq_modify(priv, XGMAC_TSIE, 0);
+
 	mutex_lock(&priv->aux_ts_lock);
 	/* Enable Internal snapshot trigger */
 	acr_value = readl(ptpaddr + PTP_ACR);
@@ -329,6 +336,7 @@ static int smtg_crosststamp(ktime_t *device, struct system_counterval_t *system,
 		break;
 	default:
 		mutex_unlock(&priv->aux_ts_lock);
+		stmmac_mac_irq_modify(priv, 0, XGMAC_TSIE);
 		return -EINVAL;
 	}
 	writel(acr_value, ptpaddr + PTP_ACR);
@@ -353,6 +361,7 @@ static int smtg_crosststamp(ktime_t *device, struct system_counterval_t *system,
 	ret = readl_poll_timeout(priv->ioaddr + XGMAC_INT_STATUS, v,
 				 (v & XGMAC_INT_TSIS), 100, 10000);
 	if (ret) {
+		stmmac_mac_irq_modify(priv, 0, XGMAC_TSIE);
 		netdev_err(priv->dev, "%s: Wait for time sync operation timeout\n",
 			   __func__);
 		return ret;
@@ -375,6 +384,8 @@ static int smtg_crosststamp(ktime_t *device, struct system_counterval_t *system,
 		read_unlock_irqrestore(&priv->ptp_lock, flags);
 	}
 
+	stmmac_mac_irq_modify(priv, 0, XGMAC_TSIE);
+
 	get_smtgtime(priv->mii, SMTG_MDIO_ADDR, &smtg_time);
 	system->cycles = smtg_time;
 
-- 
2.34.1

