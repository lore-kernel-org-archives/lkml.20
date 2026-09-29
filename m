Received: from mail-pj2-f40.google.com (mail-pj2-f40.google.com [74.125.227.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 574773A7F49
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 07:37:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.168
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790667461; cv=none; b=rlV8q0OMoGfykilh3dBYDLsmkUlRn6FNaPZLq0q31ynYTByhFCBmdbp3VCP9g265dovdekpbVymlF5aIXoeFzgNZ/V8MaKg1wtnLLqSH9WZxm09XGGzylqKTWLGlCbJqgRXWAnzbj1pNpr8+A45UEEwDDr/1WusOQPvTQJimvN0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790667461; c=relaxed/simple;
	bh=E9eW/sjh+Ifk7dKy6piTjX8fMJ1UGiyziP59Z62dsoI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=RuuV5bIJQwN7ehvDNNlO5E+YKdlehewDbA9OK2Yf8c1iUh2qdQjlJ34YW++UBh3DXtTHoeS6kbn5Hhl2WGGufGb3V2sCE3QLvP8dqHggXCf+xVnhP93MvlVkrhWp8G2QVWu2JVGjSjZM8hStsdrhSd/ZNFusRvdqUPGJE4TnQw0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IS8JkakH; arc=none smtp.client-ip=74.125.227.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IS8JkakH"
Received: by mail-pj2-f40.google.com with SMTP id 98e67ed59e1d1-3a2adb9bc3cso1161476a91.2
        for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 00:37:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790667446; x=1791272246; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=o3vIaoJznmnC3QOQ//cFZXaZ2tH8nkehUMIldx+++xA=;
        b=IS8JkakHg9de5L1PZV59ELeDD6+64nnRVMrz1TRF7XICFnghWSEHW8f+hjjfDuSTnw
         t7lEHIZEozObHA7XoKOzrPo9HkUEapxA8n6ENqz49jqsi7YoKqxcdEdua60TxFjSC/e+
         ffxzMDxF0LfqmpB1Xr6Bp62TFuXEkOy3lqFck8WbqOw7n3cC3psZConAaRnT/7BO3Qn9
         1TXFBAwpVKMOcKCDHHdsURT8nflZTNAwkrjwjI6oU3AeA9xbwQ8dQ73JUQKoqaf9b9Uf
         xzKy42LhYtln95xQvV/uZscHQ/bSscNVMoAR5SC+k3CCzz4jQ+rzMtc139piwLi4Gnzd
         9Ytg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790667446; x=1791272246;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=o3vIaoJznmnC3QOQ//cFZXaZ2tH8nkehUMIldx+++xA=;
        b=UehmeFYFIfNc/kADi2mn3JyYzSogxUVY8KPDNpD0GJXQ8ugb4QOoRhpskC+o/TP+nG
         DXSj/FqkTFLVuGE7FIRjnXqbdP7T23rNQ+ghxTD2KYFDCzb/ao9xOc/TLfhfn0X59YU0
         Hbns4QpKeP02UpxJsg4fYE99ZBNNNsiblRkOJdNw62Bf1dLH5/LezAzQQpeIEIS6YegJ
         AeBeXaozTN0GtyVOo+oxl9eiGt8FTR1nHnO2qsAcxQGTw5nt5P/FQIUncViW7kI+dLNY
         E0n/Ac9zjLIWE1ejFl755HVKND0N7gck8tXbKwPefzbGoGzTr/gAkfpqOLq5JeCz9oKd
         aAnA==
X-Forwarded-Encrypted: i=1; AKwUvByojPNBu8LqT1BrvgoBUlPPLgd0+gApOoBHamhnvtPME3GGJy/uWfP6tC+aU6NYaWlFbM7K6AvlhxRy/Zs=@vger.kernel.org
X-Gm-Message-State: AFq9FYI4OiI5bZpFt954s0MgFX/gzUoO8vozz0TplY1kD6cUOF4Mhfcu
	GX7sCoZKe1jlfhhM++6UqLWBwWsaDaplE2TqqWAha5HrZu+T7bJ5753h
X-Gm-Gg: AYBFou0kG3FDLMAeVpznTeba8iKNWFch2puc6TWu1lJscm5150Eare3Fst4hHNmZwZJ
	5vizaddo4W0xcVFuLuT5hKqziLiaUln5445k4XG1shGlem0LkaQoXS4C6X8xzbozAdP7kqHUXu0
	lVQq7lfxlZ+gWlLbwHFc4dp73aPyQ3+h492Lw828zLi5j/CQf1vsvYq33VyrUWOQWBK2O8d0o/Y
	Z45RNYW71YH357thyUHrhSrnG6ohSI84fPbndbBWt/M9g0miqI7TRw2r7UpFsJf+SjFCaj6SEnF
	zYsMdG7US2DJ0YpLhZN6tiOaBxbwdL3I+YYpxrEy0CGiPyu+BNG/Kjk68UXdiA5DRJ65HdTjbba
	zcj5jC9yE9k6Geqc4iJNmKF9toPUQydnCwk0vQbU9VTvyHDaQEk+PtLV9PNU9MoHjkn00rTiaEs
	QFQN5o0A6BHjdSinuN85sDkmCYm1ycr9bwNQlCevScEeuC4fKipMxuTrNU9GdAOg7LimYFxg==
X-Received: by 2002:a17:90b:564d:b0:3a4:6ff6:413b with SMTP id 98e67ed59e1d1-3a46ff6485amr2002042a91.47.1790667445538;
        Tue, 29 Sep 2026 00:37:25 -0700 (PDT)
Received: from server227.. ([39.170.101.209])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a498ecc986sm1328708a91.3.2026.09.29.00.37.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 00:37:25 -0700 (PDT)
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
Subject: [PATCH net-next v6 3/3] net: stmmac: dwxgmac2: add XGMAC timestamp interrupt support
Date: Tue, 29 Sep 2026 15:35:53 +0800
Message-Id: <20260929073553.4136336-4-zxyan0222@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260929073553.4136336-1-zxyan0222@gmail.com>
References: <20260929073553.4136336-1-zxyan0222@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The DWXGMAC2 hwif entries use the generic stmmac_ptp hwtimestamp ops,
whose timestamp_interrupt callback reads the dwmac4 offset
GMAC_TIMESTAMP_STATUS (0xb20) instead of the XGMAC register at 0xd20,
and whose interrupt enable mask XGMAC_INT_DEFAULT_EN omits XGMAC_TSIE.
The PTP clock nevertheless advertises the auxiliary snapshot channels
on XGMAC, so PTP_EXTTS_REQUEST succeeds but no PTP_CLOCK_EXTTS event is
ever delivered.

Fix this with a dedicated DWXGMAC2 timestamp interrupt handler that
reads XGMAC_TIMESTAMP_STATUS and reports the pending auxiliary
snapshots as PTP_CLOCK_EXTTS events.  The handler deliberately does
not gate its status read on XGMAC_INT_TSIS: TSIS is an aggregate,
read-to-clear bit that the TX timestamp completion path (which polls
the same register for TXTSC) clears before the handler can observe
it, while ATSNS and the snapshot FIFO still hold the aux events.  A
dwmac4-style TSIS gate would silently drop them.

XGMAC_TSIE is not added back to XGMAC_INT_DEFAULT_EN, which
30300d9f9150 ("net: stmmac: xgmac: Disable the Timestamp interrupt by
default") deliberately keeps clear.  Instead it is armed on demand from
the PTP_CLK_REQ_EXTTS enable/disable path of stmmac_enable(), through a
new optional stmmac_ops->timestamp_interrupt_cfg() callback implemented
only for DWXGMAC2/DWXLGMAC2 (on top of dwxgmac2_irq_modify()), like
dwmac1000 does with dwmac1000_timestamp_interrupt_cfg().  This keeps
platforms that do not use EXTTS at their current interrupt load and
leaves the other cores untouched: stmmac_enable() is shared with
dwmac4/dwmac5, whose timestamp interrupt stays always-enabled and is
relied upon by intel_crosststamp(), so a direct irq_modify() call
there is not an option; cores that do not implement the callback keep
their current behaviour.

The interrupt is only touched after the PTP_ACR_ATSFC FIFO clear has
completed, and the handler refuses to drain entries while that clear
is still in flight, so a stale snapshot is never reported as an event;
if the clear times out, the error is returned without changing the
interrupt state.  The handler also leaves the snapshot FIFO alone
while an internal cross-timestamp owns it: smtg_crosststamp() sets
STMMAC_FLAG_INT_SNAPSHOT_EN for the duration of the cross-timestamp,
raised and dropped under aux_ts_lock so concurrent requests cannot
lose it, and the handler returns early when that flag is set, mirroring
the dwmac4 handler's treatment of intel_crosststamp().

The timestamp interrupt is also disarmed after
ptp_clock_unregister(), which drops STMMAC_FLAG_EXT_SNAPSHOT_EN as
well.  stmmac_hw_setup() reprograms
XGMAC_INT_EN from XGMAC_INT_DEFAULT_EN on resume, which drops
XGMAC_TSIE, so
stmmac_rearm_timestamp_irq() re-arms it there whenever an auxiliary
snapshot channel was left enabled.

Fixes: 4bb7aff9e6d0 ("net: stmmac: Add PTP support for XGMAC2")
Signed-off-by: Zxyan Zhu <zxyan0222@gmail.com>
---
 .../ethernet/stmicro/stmmac/dwmac-socfpga.c   |  5 ++
 .../ethernet/stmicro/stmmac/dwxgmac2_core.c   | 54 +++++++++++++++++++
 drivers/net/ethernet/stmicro/stmmac/hwif.c    |  4 +-
 drivers/net/ethernet/stmicro/stmmac/hwif.h    |  5 ++
 .../ethernet/stmicro/stmmac/stmmac_hwtstamp.c | 12 +++++
 .../net/ethernet/stmicro/stmmac/stmmac_main.c | 14 +++++
 .../net/ethernet/stmicro/stmmac/stmmac_ptp.c  |  9 ++++
 .../net/ethernet/stmicro/stmmac/stmmac_ptp.h  |  1 +
 8 files changed, 102 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-socfpga.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-socfpga.c
index c5f71bfc7cf4..9030cc1cc677 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-socfpga.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-socfpga.c
@@ -311,6 +311,7 @@ static int smtg_crosststamp(ktime_t *device, struct system_counterval_t *system,
 		return -EBUSY;
 
 	mutex_lock(&priv->aux_ts_lock);
+	priv->plat->flags |= STMMAC_FLAG_INT_SNAPSHOT_EN;
 	/* Enable Internal snapshot trigger */
 	acr_value = readl(ptpaddr + PTP_ACR);
 	acr_value &= ~PTP_ACR_MASK;
@@ -328,6 +329,7 @@ static int smtg_crosststamp(ktime_t *device, struct system_counterval_t *system,
 		acr_value |= PTP_ACR_ATSEN3;
 		break;
 	default:
+		priv->plat->flags &= ~STMMAC_FLAG_INT_SNAPSHOT_EN;
 		mutex_unlock(&priv->aux_ts_lock);
 		return -EINVAL;
 	}
@@ -344,6 +346,7 @@ static int smtg_crosststamp(ktime_t *device, struct system_counterval_t *system,
 	ret = readl_poll_timeout(ptpaddr + PTP_ACR, acr_value,
 				 !(acr_value & PTP_ACR_ATSFC), 10, 10000);
 	if (ret) {
+		priv->plat->flags &= ~STMMAC_FLAG_INT_SNAPSHOT_EN;
 		mutex_unlock(&priv->aux_ts_lock);
 		netdev_err(priv->dev, "%s: Failed to clear snapshot FIFO\n",
 			   __func__);
@@ -368,6 +371,7 @@ static int smtg_crosststamp(ktime_t *device, struct system_counterval_t *system,
 				 FIELD_GET(XGMAC_TIMESTAMP_ATSNS_MASK, v),
 				 100, 10000);
 	if (ret) {
+		priv->plat->flags &= ~STMMAC_FLAG_INT_SNAPSHOT_EN;
 		mutex_unlock(&priv->aux_ts_lock);
 		netdev_err(priv->dev, "%s: Wait for time sync operation timeout\n",
 			   __func__);
@@ -390,6 +394,7 @@ static int smtg_crosststamp(ktime_t *device, struct system_counterval_t *system,
 		read_unlock_irqrestore(&priv->ptp_lock, flags);
 	}
 
+	priv->plat->flags &= ~STMMAC_FLAG_INT_SNAPSHOT_EN;
 	mutex_unlock(&priv->aux_ts_lock);
 
 	get_smtgtime(priv->mii, SMTG_MDIO_ADDR, &smtg_time);
diff --git a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c
index 1a88cbaed70c..8a39028fa4bb 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c
@@ -42,6 +42,12 @@ static void dwxgmac2_irq_modify(struct mac_device_info *hw, u32 disable,
 	spin_unlock_irqrestore(&hw->irq_ctrl_lock, flags);
 }
 
+static void dwxgmac2_timestamp_interrupt_cfg(struct stmmac_priv *priv, bool en)
+{
+	stmmac_mac_irq_modify(priv, en ? 0 : XGMAC_TSIE,
+			      en ? XGMAC_TSIE : 0);
+}
+
 static void dwxgmac2_update_caps(struct stmmac_priv *priv)
 {
 	if (!priv->dma_cap.mbps_10_100)
@@ -1154,6 +1160,52 @@ static int dwxgmac2_get_mac_tx_timestamp(struct mac_device_info *hw, u64 *ts)
 	return 0;
 }
 
+void dwxgmac2_timestamp_interrupt(struct stmmac_priv *priv)
+{
+	u32 ts_status, pending_snapshots, acr_value, channel;
+	struct ptp_clock_event event;
+	unsigned long flags;
+	u64 ptp_time;
+	int i;
+
+	if (priv->plat->flags & STMMAC_FLAG_INT_SNAPSHOT_EN)
+		return;
+
+	/* Reading XGMAC_TIMESTAMP_STATUS clears the TSIS and AUXTSTRIG
+	 * bits, so the ATSNS count is the only reliable indication of
+	 * pending auxiliary snapshots.  TXTSC is cleared by
+	 * XGMAC_TXTIMESTAMP_SEC and is not affected by this read.
+	 */
+	ts_status = readl(priv->ioaddr + XGMAC_TIMESTAMP_STATUS);
+
+	if (!(priv->plat->flags & STMMAC_FLAG_EXT_SNAPSHOT_EN) || !priv->ptp_clock)
+		return;
+
+	pending_snapshots = FIELD_GET(XGMAC_TIMESTAMP_ATSNS_MASK, ts_status);
+	if (!pending_snapshots)
+		return;
+
+	acr_value = readl(priv->ptpaddr + PTP_ACR);
+	/* Entries observed while the FIFO is being flushed are stale. */
+	if (acr_value & PTP_ACR_ATSFC)
+		return;
+	channel = FIELD_GET(PTP_ACR_MASK, acr_value);
+	if (!channel)
+		return;
+	channel = ilog2(channel);
+
+	for (i = 0; i < pending_snapshots; i++) {
+		read_lock_irqsave(&priv->ptp_lock, flags);
+		stmmac_get_ptptime(priv, priv->ptpaddr, &ptp_time);
+		read_unlock_irqrestore(&priv->ptp_lock, flags);
+
+		event.type = PTP_CLOCK_EXTTS;
+		event.index = channel;
+		event.timestamp = ptp_time;
+		ptp_clock_event(priv->ptp_clock, &event);
+	}
+}
+
 static int dwxgmac2_flex_pps_config(void __iomem *ioaddr, int index,
 				    struct stmmac_pps_cfg *cfg, bool enable,
 				    u32 sub_second_inc, u32 systime_flags)
@@ -1413,6 +1465,7 @@ static int dwxgmac2_config_l4_filter(struct mac_device_info *hw, u32 filter_no,
 const struct stmmac_ops dwxgmac210_ops = {
 	.core_init = dwxgmac2_core_init,
 	.irq_modify = dwxgmac2_irq_modify,
+	.timestamp_interrupt_cfg = dwxgmac2_timestamp_interrupt_cfg,
 	.update_caps = dwxgmac2_update_caps,
 	.set_mac = dwxgmac2_set_mac,
 	.rx_ipc = dwxgmac2_rx_ipc,
@@ -1468,6 +1521,7 @@ static void dwxlgmac2_rx_queue_enable(struct mac_device_info *hw, u8 mode,
 const struct stmmac_ops dwxlgmac2_ops = {
 	.core_init = dwxgmac2_core_init,
 	.irq_modify = dwxgmac2_irq_modify,
+	.timestamp_interrupt_cfg = dwxgmac2_timestamp_interrupt_cfg,
 	.set_mac = dwxgmac2_set_mac,
 	.rx_ipc = dwxgmac2_rx_ipc,
 	.rx_queue_enable = dwxlgmac2_rx_queue_enable,
diff --git a/drivers/net/ethernet/stmicro/stmmac/hwif.c b/drivers/net/ethernet/stmicro/stmmac/hwif.c
index 265671170bf6..eba87410f985 100644
--- a/drivers/net/ethernet/stmicro/stmmac/hwif.c
+++ b/drivers/net/ethernet/stmicro/stmmac/hwif.c
@@ -258,7 +258,7 @@ static const struct stmmac_hwif_entry {
 		.dma = &dwxgmac210_dma_ops,
 		.mac = &dwxgmac210_ops,
 		.vlan = &dwxgmac210_vlan_ops,
-		.hwtimestamp = &stmmac_ptp,
+		.hwtimestamp = &dwxgmac2_ptp,
 		.ptp = &stmmac_ptp_clock_ops,
 		.mode = NULL,
 		.tc = &dwmac510_tc_ops,
@@ -280,7 +280,7 @@ static const struct stmmac_hwif_entry {
 		.dma = &dwxgmac210_dma_ops,
 		.mac = &dwxlgmac2_ops,
 		.vlan = &dwxlgmac2_vlan_ops,
-		.hwtimestamp = &stmmac_ptp,
+		.hwtimestamp = &dwxgmac2_ptp,
 		.ptp = &stmmac_ptp_clock_ops,
 		.mode = NULL,
 		.tc = &dwmac510_tc_ops,
diff --git a/drivers/net/ethernet/stmicro/stmmac/hwif.h b/drivers/net/ethernet/stmicro/stmmac/hwif.h
index fe18f98fae45..345bb8bdee86 100644
--- a/drivers/net/ethernet/stmicro/stmmac/hwif.h
+++ b/drivers/net/ethernet/stmicro/stmmac/hwif.h
@@ -317,6 +317,8 @@ struct stmmac_ops {
 	void (*update_caps)(struct stmmac_priv *priv);
 	/* Change the interrupt enable setting. Enable takes precedence. */
 	void (*irq_modify)(struct mac_device_info *hw, u32 disable, u32 enable);
+	/* Arm or disarm the timestamp interrupt on demand (optional) */
+	void (*timestamp_interrupt_cfg)(struct stmmac_priv *priv, bool en);
 	/* Enable the MAC RX/TX */
 	void (*set_mac)(void __iomem *ioaddr, bool enable);
 	/* Enable and verify that the IPC module is supported */
@@ -420,6 +422,8 @@ struct stmmac_ops {
 	stmmac_do_void_callback(__priv, mac, update_caps, __priv)
 #define stmmac_mac_irq_modify(__priv, __args...) \
 	stmmac_do_void_callback(__priv, mac, irq_modify, (__priv)->hw, __args)
+#define stmmac_mac_timestamp_interrupt_cfg(__priv, __args...) \
+	stmmac_do_void_callback(__priv, mac, timestamp_interrupt_cfg, __priv, __args)
 #define stmmac_mac_set(__priv, __args...) \
 	stmmac_do_void_callback(__priv, mac, set_mac, __args)
 #define stmmac_rx_ipc(__priv, __args...) \
@@ -672,6 +676,7 @@ extern const struct stmmac_desc_ops ndesc_ops;
 
 extern const struct stmmac_hwtimestamp stmmac_ptp;
 extern const struct stmmac_hwtimestamp dwmac1000_ptp;
+extern const struct stmmac_hwtimestamp dwxgmac2_ptp;
 
 extern const struct stmmac_mode_ops ring_mode_ops;
 extern const struct stmmac_mode_ops chain_mode_ops;
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_hwtstamp.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_hwtstamp.c
index 2a076e228e9a..4b906bc33d26 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_hwtstamp.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_hwtstamp.c
@@ -280,3 +280,15 @@ const struct stmmac_hwtimestamp dwmac1000_ptp = {
 	.get_ptptime = dwmac1000_get_ptptime,
 	.timestamp_interrupt = dwmac1000_timestamp_interrupt,
 };
+
+const struct stmmac_hwtimestamp dwxgmac2_ptp = {
+	.config_hw_tstamping = config_hw_tstamping,
+	.init_systime = init_systime,
+	.config_sub_second_increment = config_sub_second_increment,
+	.config_addend = config_addend,
+	.adjust_systime = adjust_systime,
+	.get_systime = get_systime,
+	.get_ptptime = get_ptptime,
+	.timestamp_interrupt = dwxgmac2_timestamp_interrupt,
+	.hwtstamp_correct_latency = hwtstamp_correct_latency,
+};
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 66ae365e1c89..357dd197298f 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -885,6 +885,19 @@ static int stmmac_init_tstamp_counter(struct stmmac_priv *priv,
 	return 0;
 }
 
+/**
+ * stmmac_rearm_timestamp_irq - re-arm the timestamp interrupt
+ * @priv: driver private structure
+ * Description: this re-arms the on-demand timestamp interrupt if an
+ * auxiliary snapshot channel was left enabled.
+ */
+static void stmmac_rearm_timestamp_irq(struct stmmac_priv *priv)
+{
+	if (priv->plat->flags & STMMAC_FLAG_EXT_SNAPSHOT_EN &&
+	    priv->ptp_clock)
+		stmmac_mac_timestamp_interrupt_cfg(priv, true);
+}
+
 /**
  * stmmac_init_timestamping - initialise timestamping
  * @priv: driver private structure
@@ -8314,6 +8327,7 @@ int stmmac_resume(struct device *dev)
 	}
 
 	stmmac_init_timestamping(priv);
+	stmmac_rearm_timestamp_irq(priv);
 
 	stmmac_init_coalesce(priv);
 	phylink_rx_clk_stop_block(priv->phylink);
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_ptp.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_ptp.c
index 960249960004..971cea455803 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_ptp.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_ptp.c
@@ -255,6 +255,12 @@ static int stmmac_enable(struct ptp_clock_info *ptp,
 		ret = readl_poll_timeout(ptpaddr + PTP_ACR, acr_value,
 					 !(acr_value & PTP_ACR_ATSFC),
 					 10, 10000);
+		/* Arm or disarm the timestamp interrupt only once the FIFO
+		 * clear has completed, so the handler does not observe a
+		 * snapshot that the clear is about to discard.
+		 */
+		if (!ret)
+			stmmac_mac_timestamp_interrupt_cfg(priv, on);
 		break;
 	}
 
@@ -395,6 +401,9 @@ void stmmac_ptp_unregister(struct stmmac_priv *priv)
 		pr_debug("Removed PTP HW clock successfully on %s\n",
 			 priv->dev->name);
 
+		stmmac_mac_timestamp_interrupt_cfg(priv, false);
+		priv->plat->flags &= ~STMMAC_FLAG_EXT_SNAPSHOT_EN;
+
 		mutex_destroy(&priv->aux_ts_lock);
 	}
 }
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_ptp.h b/drivers/net/ethernet/stmicro/stmmac/stmmac_ptp.h
index 3fe0e3a80e80..dade09614163 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_ptp.h
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_ptp.h
@@ -103,6 +103,7 @@ int dwmac1000_ptp_enable(struct ptp_clock_info *ptp,
 
 void dwmac1000_get_ptptime(void __iomem *ptpaddr, u64 *ptp_time);
 void dwmac1000_timestamp_interrupt(struct stmmac_priv *priv);
+void dwxgmac2_timestamp_interrupt(struct stmmac_priv *priv);
 
 extern const struct ptp_clock_info stmmac_ptp_clock_ops;
 extern const struct ptp_clock_info dwmac1000_ptp_clock_ops;
-- 
2.34.1

