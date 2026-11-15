Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.143.172.20
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794752762;
	b=QrikrxTwm25bFx6NH1A9byGFVQYkAEGL51Do2PglaVZZo76I/eRADXYNwP1132jzCokA
	 C2FZLxxQf13tDLPXr+CzqWqRIuM+S7lZvdGQ/GFe9KTXPrWD5iZijGLbxZUSEcwEqfN+B
	 BTLo73zyPoSGpi8tpbn9xeuiV5IaiaMJlQkVeW1u09t+9KjqGArpZtWn4s1WFRWjcmLhw
	 NYsiWWyzUsiRNt9uKAzBmn58Q8/23XmUZ1EIkyxj+OqCKjhdc1zmetAU/UQmhyqBsy/qn
	 +NgAMXUprSiz3gY9yPQTbNhPC1YR1x+P3HKRVpwU6bK+LXUGcNUe+zqaYnP1wlMj7Pg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794752762;
	h=DMARC-Filter:Received:Received:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Rspamd-Bar:X-Rspamd-Report:X-Rspamd-Score:
	 DKIM-Signature;
	bh=ShjgCvqqZNLaBDF7Bo4oAbg7L5sjoWh7XMVc+AD2/Yw=;
	b=xVqB3hyvBUgCCcuukZbeI+VSxSSp5F+jxhNLDW4/OYgnl7fFAeLFHb5ZpGir9z5Rf7M4
	 fu/e65xmn/CVT1gDRa/udqZh0fUX5Pc90YK1OLzM0pq7/LX8+vO09XeKKZKdE51gzCs9t
	 lyN3ERHeCBapV3634/4XmIcdiblgAFNV0IIezvMPjsXl4MkokbpHAqnK3atgxfohkWHF5
	 tQYzyMvakUTirviqRMVw79vcx7KYEBiINqHR3AzV/3fajg6AEF+zKIXwng6ITJYG7kgVF
	 zzLdy2aGZ9t6r7nlV9eUllKBye4L9dyk+sGpEu0cnws3a0jBFBWqC9sKusqjYSLOCQQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=lausen.nl;
	spf=pass smtp.mailfrom=lausen.nl;
	dkim=pass header.d=lausen.nl header.i=@lausen.nl header.a=rsa-sha256 header.s=uberspace header.b=Fijdk6XF;
	arc=none smtp.remote-ip=95.143.172.20
Received: from mailgate01.uberspace.is (mailgate01.uberspace.is [95.143.172.20])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B43D1606A31D
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 14:26:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B43D1606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lausen.nl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lausen.nl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=lausen.nl header.i=@lausen.nl header.a=rsa-sha256 header.s=uberspace header.b=Fijdk6XF
Received: from devico.uberspace.de (devico.uberspace.de [185.26.156.185])
	by mailgate01.uberspace.is (Postfix) with ESMTPS id 3F02A60D4F
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 15:26:00 +0100 (CET)
Received: (qmail 24959 invoked by uid 990); 15 Nov 2026 14:26:00 -0000
Authentication-Results: devico.uberspace.de;
	auth=pass (plain)
Received: from unknown (HELO unknown) (::1)
	by devico.uberspace.de (Haraka/3.1.1) with ESMTPSA; Sun, 15 Nov 2026 15:25:59 +0100
From: Leonard Lausen <leonard@lausen.nl>
To: Ping-Ke Shih <pkshih@realtek.com>
Cc: leonard@lausen.nl,
	Shawn Lin <shawn.lin@rock-chips.com>,
	Heiko Stuebner <heiko@sntech.de>,
	linux-wireless@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] wifi: rtw88: sdio: combine free TX page register reads
Date: Sun, 15 Nov 2026 14:23:32 +0000
Message-ID: <20261115142330.359247-6-leonard@lausen.nl>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261115142330.359247-2-leonard@lausen.nl>
References: <20261115142330.359247-2-leonard@lausen.nl>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Bar: -----
X-Rspamd-Report: REPLY(-4) BAYES_HAM(-3) MID_CONTAINS_FROM(1) MIME_GOOD(-0.1) R_MISSING_CHARSET(0.5)
X-Rspamd-Score: -5.6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=lausen.nl; s=uberspace;
	h=from:to:cc:subject:date;
	bh=qQro4BPyHAD9tgg6RcpreG2vwjlqZkQarO5Fq3srUEE=;
	b=Fijdk6XFsoszXGzwojm16N9Wwk5P6TWeHsr5PF6iwx1cMyostFAss2Eig7cimO/b0Zr2CRqNwO
	IXzLWzwAyAwv0mppekeJuMAEaurfsim/y6wrVfezxfEQKGHPch9OzGf1EFf4D/89el5vPgAlZdkI
	Y/nHeu16DLxcvQEC2pqB6p4WzRhA5uPcC7NvPLZF9dLseqoGMDTVFGaRNpcmIRI6UO8Bs90tHvys
	gpQCp1mUm8Snqv+uWm7eLCkornvrCmCLMVyiVlngusLdiyf4mDNlFwT44mnlLu9IxQ64t7yHXJ8a
	9f+3nXmIIAMDiiy6qvGc07v5TebtOKecjskmaOONycxyZ15GPea5IkBvz0GY4luhl6s116qcILEa
	A6QEE2tlDzzhp12rzkDZFdhSD1KVt05pavxNR7+dT3RUFDwD0FU+Say30WzivRFjrlFH+Ji+g3/5
	hSuaTxQjAauFh21YxebhwmoI822pxo+oiSEEgEgAxEyueE0GU6+lrPwoXdKDaSItooHL0cJNa1xt
	P3lKhFoIbpJFnWTLrirhNNdb0mSMCSlRQ5hJcpGlODTQULtBCAJUaPbbJkPaFY7sFPkJ77aDOKKU
	tGfWTK8P8KigXjHQ8raac0SiJAeAK4Pih5Q5MDJ/x9k/PApq43ZWIORgqWUPRkERtCw1bhg832DB
	Q=

TX capacity checks on non-8051 chips read three adjacent 32-bit registers
in separate SDIO requests. Combine them into one 12-byte CMD53 read when
the existing power/alignment check permits it, with the per-register
fallback otherwise. Propagate read errors before checking queue capacity.

Allocate a DMA-safe buffer at probe and copy its little-endian values
into the caller's array before releasing the host. Holding the host
through the read and copy serializes access to the shared buffer.

On RTL8822CS/NanoPi M5 at 198 MHz SDR104, median TCP upload increased
from 170 to 186 Mbit/s (+9%) with this patch alone, and from 258 to
287 Mbit/s (+11%) when added after control-frame filtering.

A separate download test  measured 241 to 262 Mbit/s (+8%) with this
patch alone, and 263 to 274 Mbit/s (+4%) when added after filtering.

Assisted-by: LLM
Signed-off-by: Leonard Lausen <leonard@lausen.nl>
---
 drivers/net/wireless/realtek/rtw88/sdio.c | 58 +++++++++++++++++++++--
 drivers/net/wireless/realtek/rtw88/sdio.h |  1 +
 2 files changed, 55 insertions(+), 4 deletions(-)

diff --git a/drivers/net/wireless/realtek/rtw88/sdio.c b/drivers/net/wireless/realtek/rtw88/sdio.c
index dc2fd0f8f9fff..4aeff250a6d6a 100644
--- a/drivers/net/wireless/realtek/rtw88/sdio.c
+++ b/drivers/net/wireless/realtek/rtw88/sdio.c
@@ -26,6 +26,7 @@
 #define RTW_SDIO_TX_FIFO_HIWATER			16
 #define RTW_SDIO_TX_FIFO_LOWATER			8
 #define RTW_SDIO_TX_RETRY_DELAY			msecs_to_jiffies(1)
+#define RTW_SDIO_FREE_TXPG_COUNT			3
 
 static bool rtw_sdio_is_bus_addr(u32 addr)
 {
@@ -675,6 +676,40 @@ static atomic_t *rtw_sdio_8723bs_free_txpg(struct rtw_dev *rtwdev, u8 queue)
 	}
 }
 
+static int rtw_sdio_read_free_txpg(struct rtw_dev *rtwdev, u32 *free_txpg)
+{
+	struct rtw_sdio *rtwsdio = (struct rtw_sdio *)rtwdev->priv;
+	bool bus_claim = rtw_sdio_bus_claim_needed(rtwsdio);
+	u32 addr = rtw_sdio_to_bus_offset(rtwdev, REG_SDIO_FREE_TXPG);
+	int i, ret;
+
+	if (bus_claim)
+		sdio_claim_host(rtwsdio->sdio_func);
+
+	if (!rtw_sdio_use_memcpy_io(rtwdev, addr, sizeof(u32))) {
+		for (i = 0; i < RTW_SDIO_FREE_TXPG_COUNT; i++) {
+			free_txpg[i] = rtw_sdio_readl(rtwdev, addr + i * sizeof(u32), &ret);
+			if (ret)
+				break;
+		}
+		goto out;
+	}
+
+	ret = sdio_memcpy_fromio(rtwsdio->sdio_func, rtwsdio->free_txpg, addr,
+				 RTW_SDIO_FREE_TXPG_COUNT * sizeof(__le32));
+	if (!ret) {
+		/* Copy the shared DMA buffer before releasing the host. */
+		for (i = 0; i < RTW_SDIO_FREE_TXPG_COUNT; i++)
+			free_txpg[i] = le32_to_cpu(rtwsdio->free_txpg[i]);
+	}
+
+out:
+	if (bus_claim)
+		sdio_release_host(rtwsdio->sdio_func);
+
+	return ret;
+}
+
 static int rtw_sdio_check_free_txpg(struct rtw_dev *rtwdev, u8 queue,
 				    size_t count)
 {
@@ -727,11 +762,14 @@ static int rtw_sdio_check_free_txpg(struct rtw_dev *rtwdev, u8 queue,
 		/* add the pages from the public queue */
 		pages_free += (free_txpg >> 24) & 0xff;
 	} else {
-		u32 free_txpg[3];
+		u32 free_txpg[RTW_SDIO_FREE_TXPG_COUNT];
+		int ret;
 
-		free_txpg[0] = rtw_sdio_read32(rtwdev, REG_SDIO_FREE_TXPG);
-		free_txpg[1] = rtw_sdio_read32(rtwdev, REG_SDIO_FREE_TXPG + 4);
-		free_txpg[2] = rtw_sdio_read32(rtwdev, REG_SDIO_FREE_TXPG + 8);
+		ret = rtw_sdio_read_free_txpg(rtwdev, free_txpg);
+		if (ret) {
+			rtw_warn(rtwdev, "Failed to read free TX pages: %d\n", ret);
+			return ret;
+		}
 
 		switch (queue) {
 		case RTW_TX_QUEUE_BCN:
@@ -1777,6 +1815,7 @@ int rtw_sdio_probe(struct sdio_func *sdio_func,
 {
 	struct ieee80211_hw *hw;
 	struct rtw_dev *rtwdev;
+	struct rtw_sdio *rtwsdio;
 	int drv_data_size;
 	int ret;
 
@@ -1798,6 +1837,17 @@ int rtw_sdio_probe(struct sdio_func *sdio_func,
 	if (ret)
 		goto err_release_hw;
 
+	rtwsdio = (struct rtw_sdio *)rtwdev->priv;
+	if (!rtw_chip_wcpu_8051(rtwdev)) {
+		rtwsdio->free_txpg = devm_kmalloc_array(rtwdev->dev,
+							RTW_SDIO_FREE_TXPG_COUNT,
+							sizeof(*rtwsdio->free_txpg), GFP_KERNEL);
+		if (!rtwsdio->free_txpg) {
+			ret = -ENOMEM;
+			goto err_deinit_core;
+		}
+	}
+
 	rtw_dbg(rtwdev, RTW_DBG_SDIO,
 		"rtw88 SDIO probe: vendor=0x%04x device=%04x class=%02x",
 		id->vendor, id->device, id->class);
diff --git a/drivers/net/wireless/realtek/rtw88/sdio.h b/drivers/net/wireless/realtek/rtw88/sdio.h
index 6e7e6009744b0..8310bf6d54b59 100644
--- a/drivers/net/wireless/realtek/rtw88/sdio.h
+++ b/drivers/net/wireless/realtek/rtw88/sdio.h
@@ -181,6 +181,7 @@ struct rtw_sdio {
 	atomic_t tx_oqt_free;
 	/* one writer at a time between the credit check and the accounting */
 	struct mutex tx_credit_lock;
+	__le32 *free_txpg;
 };
 
 extern const struct dev_pm_ops rtw_sdio_pm_ops;
