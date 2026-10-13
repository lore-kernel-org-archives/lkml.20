Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 180D02E06EF
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 03:32:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791862340; cv=none; b=QBf/R3b7fypDalt0HMjL/wqo7hV90+CQ33IA0FZwWEb4iRlzspKZCzIGs6ekhNN26g39KaXGVjr2vtrvvVK2RAZU8EszT7+ZJQ2OIy7WsCiA5GQbSk+XW12r0vUVwYc4RRlTG6cWpjY80I/dYo8TNbfeiVHyI+BWCA3mfQzFq1A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791862340; c=relaxed/simple;
	bh=qxQI7uzcQMRKF9/PAC53ttmhlmDJgApFacEgoHvUa2U=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=fsMfk1KGqpaBCh6FKcm6P1GhDZY1YWhs1fdar/NnPs3miHjGpCv2HFAUhLdWR7ZRoeTKB6O0+YxxbjNL3C4xUta2mk4ps7cto9prtewKVkPgJ17MY52Sbe47J7gOUd9sp2MR66lEtFXSn3nrYcVK6EebQ9J6Glen/oeoM9rf8+Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QVGpt1m3; arc=none smtp.client-ip=209.85.215.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QVGpt1m3"
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-cc4b62d118aso1474209a12.2
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 20:32:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791862338; x=1792467138; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=appfE2biJzgupkODLWKmH2RCHw/QKJ3ERvS4ShHq1T0=;
        b=QVGpt1m3v4aTh8sl3KolIh3nHxXploSu4u43XF88laGFd4Qp0gskualaMC+9wpRFE0
         wtmCGhri8uJreyZs+CGptvZ9/H8HkBknnmanrCeGcyxUY7e5PbipXlHp8Y8w1G811KIb
         Iq0RPJlxbLYgeb7s0XCKZPFuSHqr2B+HVyoAwYPS+XCIZ2c9nVgn6i9i5QdEnmkXnLNu
         BKI8UDN7I2bvyTLkZeUCFzqCyyKqv16/LZQUccB0b2FjnsIH/wl2jhLQVQDIVk8RE3Y4
         qzlR4FL5IQ5cy5mTki+/7lLVSiFJ+3vXoglF2gICSRycn6b/yId8G0vsJOEcmCOLjOid
         5E9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791862338; x=1792467138;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=appfE2biJzgupkODLWKmH2RCHw/QKJ3ERvS4ShHq1T0=;
        b=KX2Zu4tvYuB8VgN+RfI457LvD6goqU8A/YobpvC56gq1yBnPCCQmlFajJ0IOWWAxkv
         iQd//Ja+VCJFlHziZaQj2MrYMf5f3LexHR/mUkBAdWHtxAY4iYGFSNhw9yVcvtw5Z03o
         TgS6x0VwQXnMLQeHa2NFzrxBMulptV+7ShWdbmntWYUTgGTzvxemGIdGpm0+Bhexvcfr
         2ygVwudkPT+N4guCFVy3kzUiy0alDXOCfzffyFO+4NJHHyodylcPUJZ42kKbuZrGKhwx
         nYdegnhRp15aFpmiRc/ObKl3W7850K5atzKaT/WdKrtJgX1gR21QRFq0z4294U36OEA9
         d/jg==
X-Forwarded-Encrypted: i=1; AKwUvBykPiNG6T5VEnNtP/R5TRW7MZ0qWULZzOWc0Pbq/fvguAwds9fkEI9yd+W8X/ICjH6qhaNMwhjytCR0vvc=@vger.kernel.org
X-Gm-Message-State: AFq9FYLf7+yKKuPGPhXIzuLQTUe1Ev/1jkLaHkTjv7yAnS8PVPFki1tT
	L8qOPEKc2XOPrfN3ILbtjyjuTO8FtHbduN0u8hpiicwZNM5jdKJvw4Lo
X-Gm-Gg: AYBFou2JjN1KSMkhG113O5lSQFtlIM9DoS5XLSZkiXL7v3QR10uhCnSooVCk1GEU8FW
	N+EQl4yvJrhJYcPW8MpXyB6miQV8+04qqgnuxGOQi7vrhAetg05CVEYuB1LpCBWM0uvjE5twHAf
	X8AFvjZ+4YzENc5JMsTHu2NpbAjhR/paKYerox9t5nF0fp30hpozoxhMobMb5pIzHSPErPLGUaj
	BzzrV0115e4pH9NI0u+euFybUVYfKMO2s3iTRGXU/F0escn6/u3e6mi8eVe2+481neUDqJQHC26
	ShqMmqLXJ2z1dxKVC/ZQRLTb3WXttN5x7Pp9yBO10nKaCgBiObd/KmwwJq5FjJkV4K8GunskXtn
	sGBtt5Nf8Cj47XPuXzEnaUvP1kU8IfjRC0WJAdtOexQoIIMubWn9XFYK6vFHwbQZvhQ4Do9YRU+
	j8Dzyzuw+5XXja1XhldX8aPdajJJhxX9b/F/eUnnMWtAX76jy/BCm8lG+M5KjtH8hx+7L/nQ==
X-Received: by 2002:a17:90b:2e86:b0:3a0:9c9d:eb18 with SMTP id 98e67ed59e1d1-3abe5522014mr4067518a91.54.1791862338112;
        Mon, 12 Oct 2026 20:32:18 -0700 (PDT)
Received: from server227.. ([39.170.101.209])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ab36fdc75esm19541303a91.12.2026.10.12.20.32.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 20:32:17 -0700 (PDT)
From: Zxyan Zhu <zxyan0222@gmail.com>
To: andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	maxime.chevallier@bootlin.com
Cc: mcoquelin.stm32@gmail.com,
	alexandre.torgue@foss.st.com,
	richardcochran@gmail.com,
	muhammad.nazim.amirul.nazle.asmade@altera.com,
	rohan.g.thomas@altera.com,
	netdev@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Zxyan Zhu <zxyan0222@gmail.com>
Subject: [PATCH net-next v8 1/3] net: stmmac: dwmac-socfpga: complete cross-timestamp on ATSNS
Date: Tue, 13 Oct 2026 11:32:05 +0800
Message-Id: <20261013033207.1684328-2-zxyan0222@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261013033207.1684328-1-zxyan0222@gmail.com>
References: <20261013033207.1684328-1-zxyan0222@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Agilex5 smtg_crosststamp() handler polls XGMAC_INT_STATUS for TSIS
to learn that the auxiliary snapshot is latched.  TSIS is a transient,
read-to-clear status bit, so the poll is racy in two ways: a stale TSIS
from an unrelated event satisfies it before the snapshot is latched,
leaving *device unwritten while the call reports success, and a
concurrent reader of XGMAC_TIMESTAMP_STATUS can clear it and make the
poll time out.

The FIFO level is also reported by the ATSNS count in
XGMAC_TIMESTAMP_STATUS, which reading the register does not disturb.
Poll ATSNS instead of TSIS, after waiting for the PTP_ACR_ATSFC FIFO
clear, so a stale ATSNS cannot satisfy the poll before the new snapshot
is latched.

Hold aux_ts_lock across the whole sequence so a concurrent
PTP_CLK_REQ_EXTTS request cannot flush the FIFO between the poll and
the drain loop.

Fixes: fd8c4f645496 ("net: stmmac: socfpga: Add hardware supported cross-timestamp")
Signed-off-by: Zxyan Zhu <zxyan0222@gmail.com>
---
 .../ethernet/stmicro/stmmac/dwmac-socfpga.c   | 29 ++++++++++++++-----
 1 file changed, 22 insertions(+), 7 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-socfpga.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-socfpga.c
index 6d4bc1fe8f75..ee79b74bf21b 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-socfpga.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-socfpga.c
@@ -337,8 +337,18 @@ static int smtg_crosststamp(ktime_t *device, struct system_counterval_t *system,
 	acr_value = readl(ptpaddr + PTP_ACR);
 	acr_value |= PTP_ACR_ATSFC;
 	writel(acr_value, ptpaddr + PTP_ACR);
-	/* Release the mutex */
-	mutex_unlock(&priv->aux_ts_lock);
+
+	/* Wait for the FIFO clear, so the poll only sees snapshots from
+	 * this trigger.
+	 */
+	ret = readl_poll_timeout(ptpaddr + PTP_ACR, acr_value,
+				 !(acr_value & PTP_ACR_ATSFC), 10, 10000);
+	if (ret) {
+		mutex_unlock(&priv->aux_ts_lock);
+		netdev_err(priv->dev, "%s: Failed to clear snapshot FIFO\n",
+			   __func__);
+		return ret;
+	}
 
 	/* Trigger Internal snapshot signal. Create a rising edge by just toggle
 	 * the GPO0 to low and back to high.
@@ -349,10 +359,14 @@ static int smtg_crosststamp(ktime_t *device, struct system_counterval_t *system,
 	gpio_value |= XGMAC_GPIO_GPO0;
 	writel(gpio_value, ioaddr + XGMAC_GPIO_STATUS);
 
-	/* Poll for time sync operation done */
-	ret = readl_poll_timeout(priv->ioaddr + XGMAC_INT_STATUS, v,
-				 (v & XGMAC_INT_TSIS), 100, 10000);
+	/* Poll ATSNS instead of the transient TSIS: the ATSNS count is
+	 * the FIFO level and is not cleared by reading the register.
+	 */
+	ret = readl_poll_timeout(ioaddr + XGMAC_TIMESTAMP_STATUS, v,
+				 FIELD_GET(XGMAC_TIMESTAMP_ATSNS_MASK, v),
+				 100, 10000);
 	if (ret) {
+		mutex_unlock(&priv->aux_ts_lock);
 		netdev_err(priv->dev, "%s: Wait for time sync operation timeout\n",
 			   __func__);
 		return ret;
@@ -364,8 +378,7 @@ static int smtg_crosststamp(ktime_t *device, struct system_counterval_t *system,
 		.use_nsecs = false,
 	};
 
-	num_snapshot = FIELD_GET(XGMAC_TIMESTAMP_ATSNS_MASK,
-				 readl(ioaddr + XGMAC_TIMESTAMP_STATUS));
+	num_snapshot = FIELD_GET(XGMAC_TIMESTAMP_ATSNS_MASK, v);
 
 	/* Repeat until the timestamps are from the FIFO last segment */
 	for (i = 0; i < num_snapshot; i++) {
@@ -375,6 +388,8 @@ static int smtg_crosststamp(ktime_t *device, struct system_counterval_t *system,
 		read_unlock_irqrestore(&priv->ptp_lock, flags);
 	}
 
+	mutex_unlock(&priv->aux_ts_lock);
+
 	get_smtgtime(priv->mii, SMTG_MDIO_ADDR, &smtg_time);
 	system->cycles = smtg_time;
 
-- 
2.34.1

