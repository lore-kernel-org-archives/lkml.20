Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.143.172.20
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794862916;
	b=4/LvkSVuQeR7SwyZgkvwHrBy56WbQqaSY7DdHNv61bU7rshD0kx8OCngDFuPBCWaKMEh
	 dMpUVOtyBixXv69ACAj4NNBJ8r3qgBlZbob+5cMUXZK7DZMqHfC8nWo6psrDBwtU9+/Rd
	 QTK84lDaIuklMeUK8pUA4R1jVBl+v5iML5zYCZT4l3ZAI3X6yAo9ZMUcgEy6hYIl1GbqA
	 pyNlCro3O+yZoJm0ls9cgB+y8c/K/5h20Y8fAgEh7XYMKr5zGQ/8NHC5gDOMv8TNjoa34
	 iMkvqfoPSplstny2jGoy2tCINDL5gRMEOqba4RFks8Cj/NmEpojx4l8K1FXNFrCuGHA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794862916;
	h=DMARC-Filter:Received:Received:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Rspamd-Bar:X-Rspamd-Report:X-Rspamd-Score:
	 DKIM-Signature;
	bh=D2VoQ3mzn9IV/deL7z6q7kor82sRFzrWZnuI+dB14N0=;
	b=fVPnb5RQhKRT0Id14FhhPMeClO822TF4v9j6OLXCYYEQf3zitg7OlPIdm/tTPqRp7C2J
	 0dWBAxF1s4aqlGgh0wwAddraEfjgixUfV/qpKWBUNFhpabU6CT8lb4MaBJKaql7ekPffD
	 1ZGyxqYJth0WoWxa6q5OQ7AVz9hCdEclkdk+vFIOXDQPrkLRwHuNh4iy2vfXFZjEa0+i1
	 Xv4IT2FCUD1/djwltIfvq/qorKDZQp4ZhQK/B0wGwyyns9ee/7ALpCdlRkHoHeIhO07m6
	 erMREI2hqYTPHplpmnT5TY/YSKF4w7YYkBsHReQp2YwxZRQpK7Y9lVkNUCVrmG98HAQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=lausen.nl;
	spf=pass smtp.mailfrom=lausen.nl;
	dkim=pass header.d=lausen.nl header.i=@lausen.nl header.a=rsa-sha256 header.s=uberspace header.b=KZ1PmW7f;
	arc=none smtp.remote-ip=95.143.172.20
Received: from mailgate01.uberspace.is (mailgate01.uberspace.is [95.143.172.20])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 239DB606A322
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 21:01:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 239DB606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lausen.nl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lausen.nl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=lausen.nl header.i=@lausen.nl header.a=rsa-sha256 header.s=uberspace header.b=KZ1PmW7f
Received: from devico.uberspace.de (devico.uberspace.de [185.26.156.185])
	by mailgate01.uberspace.is (Postfix) with ESMTPS id B0D8F60E61
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 22:01:53 +0100 (CET)
Received: (qmail 15164 invoked by uid 990); 16 Nov 2026 21:01:53 -0000
Authentication-Results: devico.uberspace.de;
	auth=pass (plain)
Received: from unknown (HELO unknown) (::1)
	by devico.uberspace.de (Haraka/3.1.1) with ESMTPSA; Mon, 16 Nov 2026 22:01:53 +0100
From: Leonard Lausen <leonard@lausen.nl>
To: Ping-Ke Shih <pkshih@realtek.com>
Cc: leonard@lausen.nl,
	Luka Gejak <luka.gejak@linux.dev>,
	=?UTF-8?q?David=20H=C3=A4rdeman?= <david@hardeman.nu>,
	Shawn Lin <shawn.lin@rock-chips.com>,
	Heiko Stuebner <heiko@sntech.de>,
	linux-wireless@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH rtw-next v3 2/2] wifi: rtw88: sdio: combine free TX page register reads
Date: Mon, 16 Nov 2026 20:57:40 +0000
Message-ID: <20261116205739.462458-6-leonard@lausen.nl>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261116205739.462458-2-leonard@lausen.nl>
References: <20261116205739.462458-2-leonard@lausen.nl>
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
X-Rspamd-Report: REPLY(-4) BAYES_HAM(-3) MID_CONTAINS_FROM(1) MIME_GOOD(-0.1) FUZZY_BULK(0.099999) R_MISSING_CHARSET(0.5)
X-Rspamd-Score: -5.5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=lausen.nl; s=uberspace;
	h=from:to:cc:subject:date;
	bh=u9zBG78NfuqjnWbNtLn07MUPutjuv/dSBbMhffUUwS0=;
	b=KZ1PmW7fDHjXhhn4bQ81uyNP9B6k/7SP81W5TgD7gfpkpqhy4ITvCLyYcOKCYFMMrJqewTMm+A
	CfJOVtnzLftAjm++4Umo1glEKFzGBLXWsMIrH8mJzaBvoa5P9p6S4FQbjgX4dY8HpcqnaX3LDx4I
	EUE3e2+DCOVP14/s09Z3m2AamxPHcY5a/VaIZ3QSWEZjfPU90Bk91+B0SzA1/6ngojU4Drc/w1jy
	nJgbUsw6vPEujy84+oo0eUEnYv0O+qXelOejXfjz7x5Wyn4RAeevPRuAOxYaT0JsQssKgK5ZqsoC
	au7DotyJgYdXaend+quo+Zl54V8xf6vKvdYsbQaEperQVWQVtOCAKRZ0IveBXb4dgky9zovQO7Up
	y7diWy2PWXa+erfFnFe3Zdm+mj8vLqezutTbrvU89N6NBWo5lPpE0fwOSYd9DxbALDzmAC0A165u
	FrTZLbt9j/hQ3N8XcTxxjJiYpFCYDrTZIpFVGBtc/x+AxdQ0J34+kuzXt+4b7dfmh+aPnID3lRDc
	ug8jBrgGUZQJ2mNs2IMAGciGpsVmI/CqA9cZFGiexWA/PBHXWhtxFY/nBKZBdcnRtnd+CdV0Jtr1
	8Db9NFNu4fmBs6GNzdOyZsVW/GsyxxVX/XK2bYw6UyoLiDP9OR2C3y+QKCZCemoiuHLobqKiu/Q0
	w=

TX capacity checks on non-8051 chips read three adjacent 32-bit registers
in separate SDIO requests. Combine them into one 12-byte CMD53 read when
the existing power/alignment check permits it, with the per-register
fallback otherwise. Propagate read errors before checking queue capacity.

Allocate a DMA-safe buffer at probe and copy its little-endian values
into the caller's array before releasing the host. Holding the host
through the read and copy serializes access to the shared buffer.

Signed-off-by: Leonard Lausen <leonard@lausen.nl>
---
 drivers/net/wireless/realtek/rtw88/sdio.c | 64 +++++++++++++++++++++--
 drivers/net/wireless/realtek/rtw88/sdio.h |  1 +
 2 files changed, 61 insertions(+), 4 deletions(-)

diff --git a/drivers/net/wireless/realtek/rtw88/sdio.c b/drivers/net/wireless/realtek/rtw88/sdio.c
index ecd4d751c05a5..09337acb76749 100644
--- a/drivers/net/wireless/realtek/rtw88/sdio.c
+++ b/drivers/net/wireless/realtek/rtw88/sdio.c
@@ -26,6 +26,7 @@
 #define RTW_SDIO_TX_FIFO_HIWATER			16
 #define RTW_SDIO_TX_FIFO_LOWATER			8
 #define RTW_SDIO_TX_RETRY_DELAY			msecs_to_jiffies(1)
+#define RTW_SDIO_FREE_TXPG_COUNT			3
 
 static bool rtw_sdio_is_bus_addr(u32 addr)
 {
@@ -675,6 +676,43 @@ static atomic_t *rtw_sdio_8723bs_free_txpg(struct rtw_dev *rtwdev, u8 queue)
 	}
 }
 
+static int rtw_sdio_read_free_txpg(struct rtw_dev *rtwdev, u32 *free_txpg)
+{
+	u32 addr = rtw_sdio_to_bus_offset(rtwdev, REG_SDIO_FREE_TXPG);
+	struct rtw_sdio *rtwsdio = (struct rtw_sdio *)rtwdev->priv;
+	bool bus_claim = rtw_sdio_bus_claim_needed(rtwsdio);
+	int i, ret;
+
+	if (bus_claim)
+		sdio_claim_host(rtwsdio->sdio_func);
+
+	if (!rtw_sdio_use_memcpy_io(rtwdev, addr, sizeof(u32))) {
+		for (i = 0; i < RTW_SDIO_FREE_TXPG_COUNT; i++) {
+			free_txpg[i] = rtw_sdio_readl(rtwdev,
+						      addr + i * sizeof(u32),
+						      &ret);
+			if (ret)
+				break;
+		}
+		goto out;
+	}
+
+	ret = sdio_memcpy_fromio(rtwsdio->sdio_func,
+				 rtwsdio->free_txpg_buf, addr,
+				 RTW_SDIO_FREE_TXPG_COUNT * sizeof(__le32));
+	if (!ret) {
+		/* Copy the shared DMA buffer before releasing the host. */
+		for (i = 0; i < RTW_SDIO_FREE_TXPG_COUNT; i++)
+			free_txpg[i] = le32_to_cpu(rtwsdio->free_txpg_buf[i]);
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
@@ -727,11 +765,15 @@ static int rtw_sdio_check_free_txpg(struct rtw_dev *rtwdev, u8 queue,
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
+			rtw_warn(rtwdev, "Failed to read free TX pages: %d\n",
+				 ret);
+			return ret;
+		}
 
 		switch (queue) {
 		case RTW_TX_QUEUE_BCN:
@@ -1782,6 +1824,7 @@ static void rtw_sdio_deinit_tx(struct rtw_dev *rtwdev)
 int rtw_sdio_probe(struct sdio_func *sdio_func,
 		   const struct sdio_device_id *id)
 {
+	struct rtw_sdio *rtwsdio;
 	struct ieee80211_hw *hw;
 	struct rtw_dev *rtwdev;
 	int drv_data_size;
@@ -1805,6 +1848,19 @@ int rtw_sdio_probe(struct sdio_func *sdio_func,
 	if (ret)
 		goto err_release_hw;
 
+	rtwsdio = (struct rtw_sdio *)rtwdev->priv;
+	if (!rtw_chip_wcpu_8051(rtwdev)) {
+		rtwsdio->free_txpg_buf =
+			devm_kmalloc_array(rtwdev->dev,
+					   RTW_SDIO_FREE_TXPG_COUNT,
+					   sizeof(*rtwsdio->free_txpg_buf),
+					   GFP_KERNEL);
+		if (!rtwsdio->free_txpg_buf) {
+			ret = -ENOMEM;
+			goto err_deinit_core;
+		}
+	}
+
 	rtw_dbg(rtwdev, RTW_DBG_SDIO,
 		"rtw88 SDIO probe: vendor=0x%04x device=%04x class=%02x",
 		id->vendor, id->device, id->class);
diff --git a/drivers/net/wireless/realtek/rtw88/sdio.h b/drivers/net/wireless/realtek/rtw88/sdio.h
index 6e7e6009744b0..5c2337ccffb2a 100644
--- a/drivers/net/wireless/realtek/rtw88/sdio.h
+++ b/drivers/net/wireless/realtek/rtw88/sdio.h
@@ -181,6 +181,7 @@ struct rtw_sdio {
 	atomic_t tx_oqt_free;
 	/* one writer at a time between the credit check and the accounting */
 	struct mutex tx_credit_lock;
+	__le32 *free_txpg_buf;
 };
 
 extern const struct dev_pm_ops rtw_sdio_pm_ops;
