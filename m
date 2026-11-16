Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=94.130.186.121
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794855724;
	b=X5BdkRXBU5UB9lCO8tM36NH9rZwKO1dV+IHa0+ZgmrKY4It9BtmofQPjfDWtI6GWjTdS
	 g0Nib2VfGdHGMzezozYeopSGmJ8CpHrwf3qa2+BGPdW8IiS3z8aWTx0nCnH51aNkq4DlK
	 AYJ8aNyvudjAaCfmabWBwnhdBuGOVQQCKIcnllzVGmAWjykoFqoThiGrp59zcQo9M8iiF
	 4HgH+SPwwvhf9rZrDFv7mI7fdt0dsRs9WSPC+bdRbLD1dCSr0E/DdjDpKyM5F04D7N5IU
	 xTNg7cWOdAF+13iQlEKbCnepRDMirDeupJug4JLt8255JxvEStvTv/AmQn2cOV8YJWQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794855724;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:Received:
	 Received:From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=X9ZyhegQvh3vBpL0rg//9sszJ6NQr01yidqBEBMB2Ps=;
	b=fnNlLnDeLe6oa8OdL9pGClD7czDq7MTuriw8bkJj2tTg66ZstmkhpUyGTm+GtQrbCH7x
	 SkuMC+HXwzvcY7FJ+AoVes5FG8IL3tVbpxoe9x+1cW1xltuwyH2rRh8gbjOpvf2galbft
	 e0eRzgMYG0GkRXEuQnvSqHJc0I6aXv3YYsH94mNpReIYd+v4JUEmJ+I6MnyCSvLHZHMQ5
	 dUzrLcSoUxUZ5k7n/EItdwgr51DCMiOrN/c2qK6lm1KpbuGEewQ/38gq1a/4l5/fYBWYG
	 HDf4KL/P9qVWpyX0toKDz9UkV5KdaVZrnY0c1ZT/XV9bRSu2jPBlV4a384oWaxFFvZA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=hardeman.nu;
	spf=pass smtp.mailfrom=hardeman.nu;
	arc=none smtp.remote-ip=94.130.186.121
Received: from thor.hardeman.nu (thor.hardeman.nu [94.130.186.121])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76208606A32A;
	Mon, 16 Nov 2026 19:02:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 76208606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hardeman.nu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hardeman.nu
Received: from thor.hardeman.nu (thor.hardeman.nu [IPv6:fd27:2a41:8fcb:2::a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature ECDSA (secp384r1) client-digest SHA384)
	(Client CN "thor.hardeman.nu", Issuer "Hardeman Internal Mail Relay CA" (verified OK))
	(Authenticated sender: nullmailer@odin.hardeman.nu)
	by thor.hardeman.nu (Postfix) with ESMTPSA id 4jSy083V73zFpmb;
	Mon, 16 Nov 2026 20:02:00 +0100 (CET)
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=hardeman.nu;
	s=202608-ed25519; t=1794855720;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=X9ZyhegQvh3vBpL0rg//9sszJ6NQr01yidqBEBMB2Ps=;
	b=aaC3VbZcoKTNi+oQUoAdxJXPj2EiEUwYuXSJk02UZ2/u2cbwZCNuBK3Xxt/CFGxiX5K+cY
	bH/Y7k6OJrJch/Cg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hardeman.nu; s=202608-rsa;
	t=1794855720;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=X9ZyhegQvh3vBpL0rg//9sszJ6NQr01yidqBEBMB2Ps=;
	b=VXSnFUMKF7PN2aif5NfgnLINhIVv1/WIgUE/LOhOBxvAtxha7xzJu2QX8pGE8aETSFS9DH
	X3oCF5PVw/0dLh7VTqdLs7obCpLDZ+D+Y8Pxavm96Fyb+LtfTybOZJ2Pc5KwdDyHljPn9v
	qLKwRlJbkd+04ojmd9p6No5u1gElTh1TtUzo68U70nYwujGU1xSMCU8d6CGKzRBgO7D4uu
	aJOSlagXa8nwPWbh5JbNre5oE1YNKIfJI6fvqLqXI3mMRRmh3W75bRusyKilKTkrKRSyOD
	VE3nhasU5e4s1lA5OkVtNFP45bQbsAqXJFnhfEnEwzQmvyCAt+JbWn5Oz28L0Q==
Received: from odin.hardeman.nu ([fd27:2a41:8fcb:2::a])
	by thor.hardeman.nu with ESMTPSA
	id 1XYJGyhT+2r68ygAWTs42w
	(envelope-from <david@odin.hardeman.nu>); Mon, 16 Nov 2026 20:02:00 +0100
Received: (nullmailer pid 2736576 invoked by uid 2002000001);
	Mon, 16 Nov 2026 19:01:58 -0000
From: =?UTF-8?q?David=20H=C3=A4rdeman?= <david@hardeman.nu>
To: Ping-Ke Shih <pkshih@realtek.com>, linux-wireless@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Leonard Lausen <leonard@lausen.nl>, Alastair D'Silva <alastair@d-silva.org>, Luka Gejak <luka.gejak@linux.dev>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Jernej Skrabec <jernej.skrabec@gmail.com>, Bitterblue Smith <rtl8821cerfe2@gmail.com>, =?UTF-8?q?David=20H=C3=A4rdeman?= <david@hardeman.nu>
Subject: [PATCH rtw-next 5/5] wifi: rtw88: sdio: read neighbouring registers of the 88xx chips at once
Date: Mon, 16 Nov 2026 20:01:45 +0100
Message-ID: <20261116190145.2736364-6-david@hardeman.nu>
In-Reply-To: <20261116190145.2736364-1-david@hardeman.nu>
References: <20261116190145.2736364-1-david@hardeman.nu>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Every register access costs a full SDIO command, about 40 us on a NanoPi
R76S (RTL8822CS, SDR104), no matter how many bytes it moves. The
interrupt handler reads HISR and then RX0_REQ_LEN, which follows it, and
a free page sync reads the three REG_SDIO_FREE_TXPG words one by one.

Read HISR together with RX0_REQ_LEN, and the three free page words, with
one transfer each, as Realtek's driver does. As in rtw_sdio_readl(),
this is only done while the chip is powered on; before that, and if the
small DMA-safe buffers this needs could not be allocated, the registers
are read one by one as before.

On the R76S acting as an AP, TCP throughput to a client goes from about
170 to about 190 Mbit/s, the other directions are unchanged.

Signed-off-by: David Härdeman <david@hardeman.nu>
---
 drivers/net/wireless/realtek/rtw88/sdio.c | 84 ++++++++++++++++++++---
 drivers/net/wireless/realtek/rtw88/sdio.h |  4 ++
 2 files changed, 78 insertions(+), 10 deletions(-)

diff --git a/drivers/net/wireless/realtek/rtw88/sdio.c b/drivers/net/wireless/realtek/rtw88/sdio.c
index a7664486613..76309405b4e 100644
--- a/drivers/net/wireless/realtek/rtw88/sdio.c
+++ b/drivers/net/wireless/realtek/rtw88/sdio.c
@@ -700,16 +700,59 @@ static atomic_t *rtw_sdio_8723bs_free_txpg(struct rtw_dev *rtwdev, u8 queue)
  * keep them and read the registers again only when they say a transfer does
  * not fit.
  */
+/*
+ * Read consecutive SDIO local registers with one transfer instead of one per
+ * register. buf must be DMA-safe. Like rtw_sdio_readl(), this only uses CMD53
+ * while the chip is powered on; otherwise it fails with -EAGAIN and the caller
+ * reads the registers one by one.
+ */
+static int rtw_sdio_read_local_regs(struct rtw_dev *rtwdev, u32 addr,
+				    __le32 *buf, unsigned int num)
+{
+	struct rtw_sdio *rtwsdio = (struct rtw_sdio *)rtwdev->priv;
+	bool bus_claim;
+	int ret;
+
+	if (!rtw_sdio_use_memcpy_io(rtwdev, addr, 4))
+		return -EAGAIN;
+
+	bus_claim = rtw_sdio_bus_claim_needed(rtwsdio);
+
+	if (bus_claim)
+		sdio_claim_host(rtwsdio->sdio_func);
+
+	ret = sdio_memcpy_fromio(rtwsdio->sdio_func, buf,
+				 rtw_sdio_to_io_address(rtwdev, addr, true),
+				 num * sizeof(*buf));
+
+	if (bus_claim)
+		sdio_release_host(rtwsdio->sdio_func);
+
+	if (ret)
+		rtw_warn(rtwdev, "sdio read of %u registers at 0x%x failed: %d",
+			 num, addr, ret);
+
+	return ret;
+}
+
 static void rtw_sdio_88xx_sync_free_txpg(struct rtw_dev *rtwdev)
 {
 	struct rtw_sdio *rtwsdio = (struct rtw_sdio *)rtwdev->priv;
+	__le32 *regs = rtwsdio->txpg_regs;
 	u32 free_txpg[3];
 
 	lockdep_assert_held(&rtwsdio->tx_credit_lock);
 
-	free_txpg[0] = rtw_sdio_read32(rtwdev, REG_SDIO_FREE_TXPG);
-	free_txpg[1] = rtw_sdio_read32(rtwdev, REG_SDIO_FREE_TXPG + 4);
-	free_txpg[2] = rtw_sdio_read32(rtwdev, REG_SDIO_FREE_TXPG + 8);
+	if (regs && !rtw_sdio_read_local_regs(rtwdev, REG_SDIO_FREE_TXPG,
+					      regs, 3)) {
+		free_txpg[0] = le32_to_cpu(regs[0]);
+		free_txpg[1] = le32_to_cpu(regs[1]);
+		free_txpg[2] = le32_to_cpu(regs[2]);
+	} else {
+		free_txpg[0] = rtw_sdio_read32(rtwdev, REG_SDIO_FREE_TXPG);
+		free_txpg[1] = rtw_sdio_read32(rtwdev, REG_SDIO_FREE_TXPG + 4);
+		free_txpg[2] = rtw_sdio_read32(rtwdev, REG_SDIO_FREE_TXPG + 8);
+	}
 
 	atomic_set(&rtwsdio->free_pg_high, free_txpg[0] & 0xfff);
 	atomic_set(&rtwsdio->free_pg_normal, (free_txpg[0] >> 16) & 0xfff);
@@ -1633,12 +1676,15 @@ static bool rtw_sdio_rx_budget_left(struct rtw_dev *rtwdev, u32 rx_bytes)
 	       !rtw_sdio_tx_pending(rtwdev);
 }
 
-static void rtw_sdio_rx_isr(struct rtw_dev *rtwdev)
+/* rx_len: the RX request length if it was read together with HISR, or 0 */
+static void rtw_sdio_rx_isr(struct rtw_dev *rtwdev, u32 rx_len)
 {
-	u32 rx_len, hisr, total_rx_bytes = 0;
+	u32 hisr, total_rx_bytes = 0;
 
 	do {
-		if (rtw_chip_wcpu_8051(rtwdev))
+		if (rx_len)
+			;
+		else if (rtw_chip_wcpu_8051(rtwdev))
 			rx_len = rtw_read16(rtwdev, REG_SDIO_RX0_REQ_LEN);
 		else
 			rx_len = rtw_read32(rtwdev, REG_SDIO_RX0_REQ_LEN);
@@ -1649,6 +1695,7 @@ static void rtw_sdio_rx_isr(struct rtw_dev *rtwdev)
 		rtw_sdio_rxfifo_recv(rtwdev, rx_len);
 
 		total_rx_bytes += rx_len;
+		rx_len = 0;
 
 		if (rtw_chip_wcpu_8051(rtwdev)) {
 			/* Stop if no more RX requests are pending, even if
@@ -1676,20 +1723,28 @@ static void rtw_sdio_handle_interrupt(struct sdio_func *sdio_func)
 	struct ieee80211_hw *hw = sdio_get_drvdata(sdio_func);
 	struct rtw_sdio *rtwsdio;
 	struct rtw_dev *rtwdev;
-	u32 hisr;
+	u32 hisr, rx_len = 0;
 
 	rtwdev = hw->priv;
 	rtwsdio = (struct rtw_sdio *)rtwdev->priv;
 
 	rtwsdio->irq_thread = current;
 
-	hisr = rtw_read32(rtwdev, REG_SDIO_HISR);
+	/* RX0_REQ_LEN follows HISR, read both at once where possible */
+	if (rtwsdio->rx_regs &&
+	    !rtw_sdio_read_local_regs(rtwdev, REG_SDIO_HISR,
+				      rtwsdio->rx_regs, 2)) {
+		hisr = le32_to_cpu(rtwsdio->rx_regs[0]);
+		rx_len = le32_to_cpu(rtwsdio->rx_regs[1]);
+	} else {
+		hisr = rtw_read32(rtwdev, REG_SDIO_HISR);
+	}
 
 	if (hisr & REG_SDIO_HISR_TXERR)
 		rtw_sdio_tx_err_isr(rtwdev);
 	if (hisr & REG_SDIO_HISR_RX_REQUEST) {
 		hisr &= ~REG_SDIO_HISR_RX_REQUEST;
-		rtw_sdio_rx_isr(rtwdev);
+		rtw_sdio_rx_isr(rtwdev, rx_len);
 	}
 
 	/*
@@ -2127,9 +2182,14 @@ static int rtw_sdio_init_tx(struct rtw_dev *rtwdev)
 	 * that only the non-8051 chips keep; without the buffer, frames are
 	 * sent one by one.
 	 */
-	if (!rtw_chip_wcpu_8051(rtwdev))
+	if (!rtw_chip_wcpu_8051(rtwdev)) {
 		rtwsdio->tx_agg_buf = kmalloc(RTW_SDIO_TX_AGG_MAX_SIZE +
 					      RTW_SDIO_BLOCK_SIZE, GFP_KERNEL);
+		/* without these, the registers are read one by one */
+		rtwsdio->rx_regs = kmalloc_array(2, sizeof(__le32), GFP_KERNEL);
+		rtwsdio->txpg_regs = kmalloc_array(3, sizeof(__le32),
+						   GFP_KERNEL);
+	}
 
 	for (i = 0; i < RTK_MAX_TX_QUEUE_NUM; i++) {
 		skb_queue_head_init(&rtwsdio->tx_queue[i]);
@@ -2146,6 +2206,8 @@ static int rtw_sdio_init_tx(struct rtw_dev *rtwdev)
 
 err_destroy_wq:
 	kfree(rtwsdio->tx_agg_buf);
+	kfree(rtwsdio->rx_regs);
+	kfree(rtwsdio->txpg_regs);
 	mutex_destroy(&rtwsdio->tx_credit_lock);
 	destroy_workqueue(rtwsdio->txwq);
 	return -ENOMEM;
@@ -2164,6 +2226,8 @@ static void rtw_sdio_deinit_tx(struct rtw_dev *rtwdev)
 		ieee80211_purge_tx_queue(rtwdev->hw, &rtwsdio->tx_queue[i]);
 
 	kfree(rtwsdio->tx_agg_buf);
+	kfree(rtwsdio->rx_regs);
+	kfree(rtwsdio->txpg_regs);
 	mutex_destroy(&rtwsdio->tx_credit_lock);
 }
 
diff --git a/drivers/net/wireless/realtek/rtw88/sdio.h b/drivers/net/wireless/realtek/rtw88/sdio.h
index ab366f82d92..6aa59ed3db2 100644
--- a/drivers/net/wireless/realtek/rtw88/sdio.h
+++ b/drivers/net/wireless/realtek/rtw88/sdio.h
@@ -188,6 +188,10 @@ struct rtw_sdio {
 	bool free_txpg_valid;
 	/* TX aggregation buffer of the non-8051 chips, under tx_credit_lock */
 	u8 *tx_agg_buf;
+	/* non-8051 chips: HISR + RX0_REQ_LEN, read by the interrupt handler */
+	__le32 *rx_regs;
+	/* non-8051 chips: the REG_SDIO_FREE_TXPG words, under tx_credit_lock */
+	__le32 *txpg_regs;
 	/* one writer at a time between the credit check and the accounting */
 	struct mutex tx_credit_lock;
 };
-- 
2.47.3

