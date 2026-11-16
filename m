Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=94.130.186.121
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794855724;
	b=rwwCq/Iha2AkfU8AKU8A30jyixpbhzOdTpxT90W3JvW/ipoW09rI1fut1QXr2q6SLpQb
	 pjtga73/ZGBMwyhE97v+CCLymnEygTxEsgmrYMfYk2qlsxRr5aOVu4s1PQPtfpHtRw9Rk
	 M6E3LLhVM4m8qALP2KjaXfLV2ymHIHjz+duNrQMG1HE9LtYZ1hMFyJqGlNQS1oWm6RRT2
	 W4/4VE77wA4HJvtbXh+++pqb3olI8W8kJDElsI+GefonhW3PpB/dai9Qq4RQx9SykVOUl
	 +ikp7oM0UbAZOfU9rEyV9DHyvBZIoEA6RqDW8r7fDSdzeQbAWcLYDjHGQQVE3WjwusA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794855724;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:Received:
	 Received:From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=rvejCAA/hAz7QxpPKjqR1cL+yFmDi/ZT+ldIPP8PaMM=;
	b=v4ivgboW5LoIx7OP4cLeZLpvFN03bnTEVU/VBUTm4G2XymV0wyN3A31rEK7K/eAoue42
	 q8yXhDpy5DtVbBt925vrUvv4vpzTb4sU/woVMwEe7ev/hQHCfs2bg1S5s9RLB12wRgraO
	 l+IZIpG7lrxfQZ9ZStJp40FMIpo/gH5v+K+nzKYiA6HZHYmt0Dvq5I8GwHGPV/bISzDp/
	 xC1MP2gYkveL74dwpoNI92qNAr5tR90hxZbf9wpo0eJd4Hbm6h0GbHNqM2l9BRXHmsmje
	 KWgqvp//Qhnju2adJjp0Z3R7T+PY7uceTDfEP3QaahWiN84V9qUVfxUIUnck/ZG0Ugg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=hardeman.nu;
	spf=pass smtp.mailfrom=hardeman.nu;
	arc=none smtp.remote-ip=94.130.186.121
Received: from thor.hardeman.nu (thor.hardeman.nu [94.130.186.121])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10F0E606A32F;
	Mon, 16 Nov 2026 19:02:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 10F0E606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hardeman.nu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hardeman.nu
Received: from thor.hardeman.nu (thor.hardeman.nu [IPv6:fd27:2a41:8fcb:2::a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature ECDSA (secp384r1) client-digest SHA384)
	(Client CN "thor.hardeman.nu", Issuer "Hardeman Internal Mail Relay CA" (verified OK))
	(Authenticated sender: nullmailer@odin.hardeman.nu)
	by thor.hardeman.nu (Postfix) with ESMTPSA id 4jSy092M3yzFq20;
	Mon, 16 Nov 2026 20:02:01 +0100 (CET)
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=hardeman.nu;
	s=202608-ed25519; t=1794855721;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rvejCAA/hAz7QxpPKjqR1cL+yFmDi/ZT+ldIPP8PaMM=;
	b=sTQKjDSZfGycn3nOmjZUIk/G5YYX6p74bSOSrs0KQWkuajk1wiMAHXLVfO5wMNQlFJKGNY
	XpGf49lhJDE+m6Cg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hardeman.nu; s=202608-rsa;
	t=1794855721;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rvejCAA/hAz7QxpPKjqR1cL+yFmDi/ZT+ldIPP8PaMM=;
	b=n6yHvgcIazJh/BeBgaQ/bIMqx7MaU3EzovxXuuLK5GORtIWOM7lHBNk4OEvmLpJZPC3DR4
	uclUhwVWTw6t09GitBB02Lyd4j46istsYqIOuld8VqJA1irNdbEcpSPPL8Mqzku+1Sv/w2
	S2iPVks+08VsHyvs93woJZ6BPea8X9MBrINf8bA2XKIw29/o3CqrYN4HkLl0KSOcBHzWJI
	4II2PdubEcKjPsH+7R8KH0ROuYR14Xj+UzXfTe3eMcUMMmZHIyeP/GvFd7i7/4wOmKXbrq
	NO2m9V8fgMEhr7G2vqx2E+mzLoiKDq4ZIyX86fBOkn+yvU8MmPfn+8rXrnXShA==
Received: from odin.hardeman.nu ([fd27:2a41:8fcb:2::a])
	by thor.hardeman.nu with ESMTPSA
	id 2KFdDylT+2oO9CgAWTs42w
	(envelope-from <david@odin.hardeman.nu>); Mon, 16 Nov 2026 20:02:01 +0100
Received: (nullmailer pid 2736573 invoked by uid 2002000001);
	Mon, 16 Nov 2026 19:01:58 -0000
From: =?UTF-8?q?David=20H=C3=A4rdeman?= <david@hardeman.nu>
To: Ping-Ke Shih <pkshih@realtek.com>, linux-wireless@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Leonard Lausen <leonard@lausen.nl>, Alastair D'Silva <alastair@d-silva.org>, Luka Gejak <luka.gejak@linux.dev>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Jernej Skrabec <jernej.skrabec@gmail.com>, Bitterblue Smith <rtl8821cerfe2@gmail.com>, =?UTF-8?q?David=20H=C3=A4rdeman?= <david@hardeman.nu>
Subject: [PATCH rtw-next 4/5] wifi: rtw88: sdio: let TX in while receiving on the 88xx chips
Date: Mon, 16 Nov 2026 20:01:44 +0100
Message-ID: <20261116190145.2736364-5-david@hardeman.nu>
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

The interrupt handler reads RX data for up to 64 KiB per interrupt while
it holds the host, and the TX work waits for the host meanwhile. At
SDR104 speeds an RTL8822CS spends most of the bus time on the per
transfer overhead, so when a client sends at full rate, the RX path
takes about 80% of the bus and leaves too little for TX. On a NanoPi
R76S acting as an AP, with TCP traffic in both directions, the AP sends
at only 20-35 Mbit/s while it receives at 165-220 Mbit/s.

When frames are waiting to be sent, stop reading after 8 KiB, about one
RX aggregate, so the TX work gets the host between reads; the handler
runs again for the rest. Without TX frames waiting, it still reads up
to 64 KiB. The 8051 chips keep their behaviour.

With traffic in both directions, the R76S now sends at 70-85 Mbit/s
while receiving at 100-120 Mbit/s, steadily over each run. The sum is
somewhat lower, as sending costs more bus time than receiving, and
one-way throughput doesn't change. Realtek's driver shows the same
imbalance as before (about 40 + 180 Mbit/s on the same setup).

Signed-off-by: David Härdeman <david@hardeman.nu>
---
 drivers/net/wireless/realtek/rtw88/sdio.c | 39 ++++++++++++++++++++++-
 1 file changed, 38 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/realtek/rtw88/sdio.c b/drivers/net/wireless/realtek/rtw88/sdio.c
index cced6fdfa6d..a7664486613 100644
--- a/drivers/net/wireless/realtek/rtw88/sdio.c
+++ b/drivers/net/wireless/realtek/rtw88/sdio.c
@@ -34,6 +34,14 @@
 #define RTW_SDIO_88XX_TX_FIFO_LOWATER			32
 #define RTW_SDIO_TX_RETRY_DELAY			msecs_to_jiffies(1)
 
+/*
+ * The interrupt handler holds the host while it reads RX data. Bound how much
+ * it reads per interrupt, and with frames waiting to be sent, let the TX path
+ * have the host after a smaller amount.
+ */
+#define RTW_SDIO_RX_BUDGET				SZ_64K
+#define RTW_SDIO_RX_BUDGET_TX_PENDING			SZ_8K
+
 static bool rtw_sdio_is_bus_addr(u32 addr)
 {
 	return !!(addr & RTW_SDIO_BUS_MSK);
@@ -1597,6 +1605,34 @@ static void rtw_sdio_rxfifo_recv(struct rtw_dev *rtwdev, u32 rx_len)
 	}
 }
 
+static bool rtw_sdio_tx_pending(struct rtw_dev *rtwdev)
+{
+	struct rtw_sdio *rtwsdio = (struct rtw_sdio *)rtwdev->priv;
+	int queue;
+
+	for (queue = 0; queue <= RTW_TX_QUEUE_VO; queue++)
+		if (!skb_queue_empty(&rtwsdio->tx_queue[queue]))
+			return true;
+
+	return false;
+}
+
+static bool rtw_sdio_rx_budget_left(struct rtw_dev *rtwdev, u32 rx_bytes)
+{
+	if (rx_bytes >= RTW_SDIO_RX_BUDGET)
+		return false;
+
+	/*
+	 * The 8051 chips send one frame per transfer and are not limited by
+	 * the bus in the same way, keep their behaviour.
+	 */
+	if (rtw_chip_wcpu_8051(rtwdev))
+		return true;
+
+	return rx_bytes < RTW_SDIO_RX_BUDGET_TX_PENDING ||
+	       !rtw_sdio_tx_pending(rtwdev);
+}
+
 static void rtw_sdio_rx_isr(struct rtw_dev *rtwdev)
 {
 	u32 rx_len, hisr, total_rx_bytes = 0;
@@ -1631,7 +1667,8 @@ static void rtw_sdio_rx_isr(struct rtw_dev *rtwdev)
 			 */
 			hisr = REG_SDIO_HISR_RX_REQUEST;
 		}
-	} while (total_rx_bytes < SZ_64K && hisr & REG_SDIO_HISR_RX_REQUEST);
+	} while (rtw_sdio_rx_budget_left(rtwdev, total_rx_bytes) &&
+		 hisr & REG_SDIO_HISR_RX_REQUEST);
 }
 
 static void rtw_sdio_handle_interrupt(struct sdio_func *sdio_func)
-- 
2.47.3

