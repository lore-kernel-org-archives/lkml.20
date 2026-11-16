Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=94.130.186.121
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794855726;
	b=093FDjmo5hU/xS0SWNKU1QAid/bl+YcJJ59qS6ZHA+BeLVxtlmlHztEHdFq7zjMLZzEG
	 9/oxcnNs7au6SbFPf9N8XQBjn4Xh2dYY7LcedLEJE8rj1cPW6BCOKbA3UYDjf/p2lpund
	 1yec4WytY6Rl/2r04OfMzgSBCL4qv1nGyFvYUYH474IVPyhKp9es2EUjodan+6eNS/T7C
	 AO+nPUIp/h5qydO1xYbY8R7/MMo6imE15Rx/OsSJWrEKDWlQdtWTcXHq3W1VyItBqKp4y
	 +P+FugtuPS+F0LeNDdkJ+jPf+EeYo5ulUQpF9SLfyjYMgu6YG10GlQVBU6490PodmyQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794855726;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:Received:
	 Received:From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=8GN4qtXPr0ygX2MVBuFNyGfBP+HwmL+0Uf8u2OXneSY=;
	b=jQMm7cE8NvEWUrEV6tkZDpM8Aqw0h6TqFi+IV9K1hhkM5W0oGymAzPNGfOqnL903ar7w
	 Eb2Y891hy2+GhDX2rID89A7uWxfQ4CVeRWg6hYIEe3bGb+181QAxZi5/RBypORbDU+CMP
	 /L2fv9WPAcnZnEl4fhuspXAS8xcjphy12f9+pZrrqGCXE366CbFpxCfaISucUutDXLfOw
	 /YTQbM8N1/tD7JMWsmS+649VY2MOv1SStG1n1oJi5Ec6QzGguTuNX/2+7ZZuPhkPsN68H
	 esskAbx5EHqlA5dLlkACbwOfa+INDArikUetk0zMwoP05NzycsLTSp8O+QwFWP6+HyQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=hardeman.nu;
	spf=pass smtp.mailfrom=hardeman.nu;
	arc=none smtp.remote-ip=94.130.186.121
Received: from thor.hardeman.nu (thor.hardeman.nu [94.130.186.121])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5A98606A8A1;
	Mon, 16 Nov 2026 19:02:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E5A98606A8A1
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hardeman.nu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hardeman.nu
Received: from thor.hardeman.nu (thor.hardeman.nu [IPv6:fd27:2a41:8fcb:2::a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature ECDSA (secp384r1) client-digest SHA384)
	(Client CN "thor.hardeman.nu", Issuer "Hardeman Internal Mail Relay CA" (verified OK))
	(Authenticated sender: nullmailer@odin.hardeman.nu)
	by thor.hardeman.nu (Postfix) with ESMTPSA id 4jSy0958m0zFq2Z;
	Mon, 16 Nov 2026 20:02:01 +0100 (CET)
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=hardeman.nu;
	s=202608-ed25519; t=1794855721;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8GN4qtXPr0ygX2MVBuFNyGfBP+HwmL+0Uf8u2OXneSY=;
	b=2JRrRe2jbhGX/xeLIS6QTgXHTqqpqNWWpZbWH7gfCKgnbnwVApDJLDmIM1bgTulE2B1Bjy
	tOiSt7FtXRpeFbDA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hardeman.nu; s=202608-rsa;
	t=1794855721;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8GN4qtXPr0ygX2MVBuFNyGfBP+HwmL+0Uf8u2OXneSY=;
	b=aNj2xxt8nu/uTNdYRWZGQ5QIv26mAV9hDJRVQM+CTeNoQ4mmYCFIOMr2NkK74INWJMEP/J
	u3aqspkvtE2RG0C58yNpIw9nCLOOjKBz/1K2T7vQyehxEHRzVFDTkdFVvwQ+WTsMpYAzym
	j5w/zSCIIy43sp5FuQlt90SveLTDbuAqAlgFDsxCR4OE3IhcQjnhn7JP1vp3UD3mDCccjM
	OUwX3Vi/WgeIgl6AkWeDnsFiEB3OYUjR3sdL1RYB66DBseV6LTUtYiZoAjoNVrls083wsx
	V4YeD8egMUjVrJK4RkjXmPhqW2VN49z9pSAWcqjZtsSbbSP+5FQTgNC3JaNV0g==
Received: from odin.hardeman.nu ([fd27:2a41:8fcb:2::a])
	by thor.hardeman.nu with ESMTPSA
	id LinOKClT+2oY9CgAWTs42w
	(envelope-from <david@odin.hardeman.nu>); Mon, 16 Nov 2026 20:02:01 +0100
Received: (nullmailer pid 2736564 invoked by uid 2002000001);
	Mon, 16 Nov 2026 19:01:58 -0000
From: =?UTF-8?q?David=20H=C3=A4rdeman?= <david@hardeman.nu>
To: Ping-Ke Shih <pkshih@realtek.com>, linux-wireless@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Leonard Lausen <leonard@lausen.nl>, Alastair D'Silva <alastair@d-silva.org>, Luka Gejak <luka.gejak@linux.dev>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Jernej Skrabec <jernej.skrabec@gmail.com>, Bitterblue Smith <rtl8821cerfe2@gmail.com>, =?UTF-8?q?David=20H=C3=A4rdeman?= <david@hardeman.nu>
Subject: [PATCH rtw-next 1/5] wifi: rtw88: sdio: cache the free TX page counts of the 88xx chips
Date: Mon, 16 Nov 2026 20:01:41 +0100
Message-ID: <20261116190145.2736364-2-david@hardeman.nu>
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

Before every transfer, rtw_sdio_check_free_txpg() reads the three
REG_SDIO_FREE_TXPG registers of the RTL8822BS, RTL8822CS and RTL8821CS
to see whether the frame fits. That is three register reads per frame,
more bus time than the transfer of a small frame takes, and the main
reason why the RTL8822CS sends at only about a third of the rate it
receives at.

The chip only ever frees pages, so counts read earlier and reduced by
every transfer since then never exceed what is free. Keep the counts,
reserve each transfer's pages from them, and read the registers again
only when they say the frame does not fit, as the RTL8723BS path does
and as Realtek's driver does for these chips. Pages are taken from the
queue's dedicated pages first and then from the public ones, and the
management queue, which goes to the extra FIFO on these chips, has its
own count.

The same registers report the free entries of the AC output queue;
track them too, one per frame of an AC queue, so that a later change can
send several frames per transfer without overrunning it.

tx_credit_lock is held from the reservation until the transfer is done,
so the counts are never read back while a transfer they were reduced for
has not reached the chip yet. They are read again after start and stop,
and after a failed transfer.

On a NanoPi R76S (RTL8822CS, SDR104) acting as an AP, TCP throughput to
a client goes from about 87 to about 100 Mbit/s, and from the client from
about 160 to about 185 Mbit/s.

Signed-off-by: David Härdeman <david@hardeman.nu>
---
 drivers/net/wireless/realtek/rtw88/sdio.c | 201 ++++++++++++++++++----
 drivers/net/wireless/realtek/rtw88/sdio.h |   3 +
 2 files changed, 170 insertions(+), 34 deletions(-)

diff --git a/drivers/net/wireless/realtek/rtw88/sdio.c b/drivers/net/wireless/realtek/rtw88/sdio.c
index ecd4d751c05..49d733a5104 100644
--- a/drivers/net/wireless/realtek/rtw88/sdio.c
+++ b/drivers/net/wireless/realtek/rtw88/sdio.c
@@ -675,6 +675,135 @@ static atomic_t *rtw_sdio_8723bs_free_txpg(struct rtw_dev *rtwdev, u8 queue)
 	}
 }
 
+/*
+ * The other chips with a non-8051 MCU (RTL8822BS, RTL8822CS, RTL8821CS) report
+ * their free pages in three registers, one 12 bit count per FIFO, and the
+ * free entries of the AC output queue in the third. Reading them for every
+ * transfer costs three register reads, more bus time than the transfer of a
+ * small frame. The chip only frees pages and entries, so counts read earlier
+ * and reduced by every transfer since then never exceed what is really free:
+ * keep them and read the registers again only when they say a transfer does
+ * not fit.
+ */
+static void rtw_sdio_88xx_sync_free_txpg(struct rtw_dev *rtwdev)
+{
+	struct rtw_sdio *rtwsdio = (struct rtw_sdio *)rtwdev->priv;
+	u32 free_txpg[3];
+
+	lockdep_assert_held(&rtwsdio->tx_credit_lock);
+
+	free_txpg[0] = rtw_sdio_read32(rtwdev, REG_SDIO_FREE_TXPG);
+	free_txpg[1] = rtw_sdio_read32(rtwdev, REG_SDIO_FREE_TXPG + 4);
+	free_txpg[2] = rtw_sdio_read32(rtwdev, REG_SDIO_FREE_TXPG + 8);
+
+	atomic_set(&rtwsdio->free_pg_high, free_txpg[0] & 0xfff);
+	atomic_set(&rtwsdio->free_pg_normal, (free_txpg[0] >> 16) & 0xfff);
+	atomic_set(&rtwsdio->free_pg_low, free_txpg[1] & 0xfff);
+	atomic_set(&rtwsdio->free_pg_pub, (free_txpg[1] >> 16) & 0xfff);
+	atomic_set(&rtwsdio->free_pg_extra, free_txpg[2] & 0xfff);
+	atomic_set(&rtwsdio->tx_oqt_free, (free_txpg[2] >> 16) & 0xff);
+
+	rtwsdio->free_txpg_valid = true;
+}
+
+static void rtw_sdio_88xx_invalidate_free_txpg(struct rtw_dev *rtwdev)
+{
+	struct rtw_sdio *rtwsdio = (struct rtw_sdio *)rtwdev->priv;
+
+	guard(mutex)(&rtwsdio->tx_credit_lock);
+
+	rtwsdio->free_txpg_valid = false;
+}
+
+static atomic_t *rtw_sdio_88xx_free_txpg(struct rtw_dev *rtwdev, u8 queue)
+{
+	struct rtw_sdio *rtwsdio = (struct rtw_sdio *)rtwdev->priv;
+
+	switch (queue) {
+	case RTW_TX_QUEUE_BCN:
+	case RTW_TX_QUEUE_H2C:
+	case RTW_TX_QUEUE_HI0:
+		return &rtwsdio->free_pg_high;
+	case RTW_TX_QUEUE_VI:
+	case RTW_TX_QUEUE_VO:
+		return &rtwsdio->free_pg_normal;
+	case RTW_TX_QUEUE_BE:
+	case RTW_TX_QUEUE_BK:
+		return &rtwsdio->free_pg_low;
+	case RTW_TX_QUEUE_MGMT:
+		return &rtwsdio->free_pg_extra;
+	default:
+		return NULL;
+	}
+}
+
+static bool rtw_sdio_queue_is_ac(u8 queue)
+{
+	return queue <= RTW_TX_QUEUE_VO;
+}
+
+static bool rtw_sdio_88xx_txpg_fits(struct rtw_dev *rtwdev, atomic_t *dedicated,
+				    u8 queue, unsigned int pages,
+				    unsigned int frames)
+{
+	struct rtw_sdio *rtwsdio = (struct rtw_sdio *)rtwdev->priv;
+
+	if (atomic_read(dedicated) + atomic_read(&rtwsdio->free_pg_pub) < pages)
+		return false;
+
+	/* every frame of an AC queue takes an entry of the output queue */
+	if (rtw_sdio_queue_is_ac(queue) &&
+	    atomic_read(&rtwsdio->tx_oqt_free) < frames)
+		return false;
+
+	return true;
+}
+
+/*
+ * Reserve the pages and output queue entries for a transfer of @frames frames
+ * needing @pages pages, from the queue's dedicated pages first and then from
+ * the public ones, as the chip charges them. The caller holds tx_credit_lock
+ * until the transfer is done, so that the counts are never read back from the
+ * chip while a transfer they were already reduced for has not reached it.
+ */
+static int rtw_sdio_88xx_reserve_txpg(struct rtw_dev *rtwdev, u8 queue,
+				      unsigned int pages, unsigned int frames)
+{
+	struct rtw_sdio *rtwsdio = (struct rtw_sdio *)rtwdev->priv;
+	atomic_t *dedicated;
+	unsigned int taken;
+
+	lockdep_assert_held(&rtwsdio->tx_credit_lock);
+
+	dedicated = rtw_sdio_88xx_free_txpg(rtwdev, queue);
+	if (!dedicated) {
+		rtw_warn(rtwdev, "Unknown mapping for queue %u\n", queue);
+		return -EINVAL;
+	}
+
+	if (!rtwsdio->free_txpg_valid ||
+	    !rtw_sdio_88xx_txpg_fits(rtwdev, dedicated, queue, pages, frames))
+		rtw_sdio_88xx_sync_free_txpg(rtwdev);
+
+	if (!rtw_sdio_88xx_txpg_fits(rtwdev, dedicated, queue, pages, frames)) {
+		rtw_dbg(rtwdev, RTW_DBG_SDIO,
+			"Not enough free pages (%u needed, %u free) or output queue entries (%u needed, %u free) in queue %u\n",
+			pages, atomic_read(dedicated) +
+			atomic_read(&rtwsdio->free_pg_pub), frames,
+			atomic_read(&rtwsdio->tx_oqt_free), queue);
+		return -EBUSY;
+	}
+
+	taken = min_t(unsigned int, pages, atomic_read(dedicated));
+	atomic_sub(taken, dedicated);
+	atomic_sub(pages - taken, &rtwsdio->free_pg_pub);
+
+	if (rtw_sdio_queue_is_ac(queue))
+		atomic_sub(frames, &rtwsdio->tx_oqt_free);
+
+	return 0;
+}
+
 static int rtw_sdio_check_free_txpg(struct rtw_dev *rtwdev, u8 queue,
 				    size_t count)
 {
@@ -727,40 +856,8 @@ static int rtw_sdio_check_free_txpg(struct rtw_dev *rtwdev, u8 queue,
 		/* add the pages from the public queue */
 		pages_free += (free_txpg >> 24) & 0xff;
 	} else {
-		u32 free_txpg[3];
-
-		free_txpg[0] = rtw_sdio_read32(rtwdev, REG_SDIO_FREE_TXPG);
-		free_txpg[1] = rtw_sdio_read32(rtwdev, REG_SDIO_FREE_TXPG + 4);
-		free_txpg[2] = rtw_sdio_read32(rtwdev, REG_SDIO_FREE_TXPG + 8);
-
-		switch (queue) {
-		case RTW_TX_QUEUE_BCN:
-		case RTW_TX_QUEUE_H2C:
-		case RTW_TX_QUEUE_HI0:
-			/* high */
-			pages_free = free_txpg[0] & 0xfff;
-			break;
-		case RTW_TX_QUEUE_VI:
-		case RTW_TX_QUEUE_VO:
-			/* normal */
-			pages_free = (free_txpg[0] >> 16) & 0xfff;
-			break;
-		case RTW_TX_QUEUE_BE:
-		case RTW_TX_QUEUE_BK:
-			/* low */
-			pages_free = free_txpg[1] & 0xfff;
-			break;
-		case RTW_TX_QUEUE_MGMT:
-			/* extra */
-			pages_free = free_txpg[2] & 0xfff;
-			break;
-		default:
-			rtw_warn(rtwdev, "Unknown mapping for queue %u\n", queue);
-			return -EINVAL;
-		}
-
-		/* add the pages from the public queue */
-		pages_free += (free_txpg[1] >> 16) & 0xfff;
+		/* the other chips use rtw_sdio_88xx_reserve_txpg() */
+		return -EINVAL;
 	}
 
 	pages_needed = DIV_ROUND_UP(count, rtwdev->chip->page_size);
@@ -889,6 +986,32 @@ static int rtw_sdio_write_port_8723bs(struct rtw_dev *rtwdev,
 	return 0;
 }
 
+static int rtw_sdio_write_port_88xx(struct rtw_dev *rtwdev,
+				    struct sk_buff *skb,
+				    enum rtw_tx_queue_type queue, u32 txaddr,
+				    size_t write_size)
+{
+	struct rtw_sdio *rtwsdio = (struct rtw_sdio *)rtwdev->priv;
+	unsigned int pages;
+	int ret;
+
+	/* the chip charges pages by frame length, not by the padded transfer */
+	pages = DIV_ROUND_UP(skb->len, rtwdev->chip->page_size);
+
+	guard(mutex)(&rtwsdio->tx_credit_lock);
+
+	ret = rtw_sdio_88xx_reserve_txpg(rtwdev, queue, pages, 1);
+	if (ret)
+		return ret;
+
+	ret = rtw_sdio_write_to_port(rtwdev, skb, queue, txaddr, write_size);
+	if (ret)
+		/* the pages may or may not have been used, read them again */
+		rtwsdio->free_txpg_valid = false;
+
+	return ret;
+}
+
 static int rtw_sdio_write_port_generic(struct rtw_dev *rtwdev,
 				       struct sk_buff *skb,
 				       enum rtw_tx_queue_type queue, u32 txaddr,
@@ -933,6 +1056,10 @@ static int rtw_sdio_write_port(struct rtw_dev *rtwdev, struct sk_buff *skb,
 		return rtw_sdio_write_port_8723bs(rtwdev, skb, queue, txaddr,
 						  write_size);
 
+	if (!rtw_chip_wcpu_8051(rtwdev))
+		return rtw_sdio_write_port_88xx(rtwdev, skb, queue, txaddr,
+						write_size);
+
 	return rtw_sdio_write_port_generic(rtwdev, skb, queue, txaddr,
 					   write_size);
 }
@@ -1067,6 +1194,9 @@ static int rtw_sdio_start(struct rtw_dev *rtwdev)
 			return ret;
 	}
 
+	if (!rtw_chip_wcpu_8051(rtwdev))
+		rtw_sdio_88xx_invalidate_free_txpg(rtwdev);
+
 	rtw_sdio_enable_rx_aggregation(rtwdev);
 
 	if (rtw_is_8723bs(rtwdev)) {
@@ -1083,6 +1213,9 @@ static int rtw_sdio_start(struct rtw_dev *rtwdev)
 static void rtw_sdio_stop(struct rtw_dev *rtwdev)
 {
 	rtw_sdio_disable_interrupt(rtwdev);
+
+	if (!rtw_chip_wcpu_8051(rtwdev))
+		rtw_sdio_88xx_invalidate_free_txpg(rtwdev);
 }
 
 static void rtw_sdio_deep_ps_enter(struct rtw_dev *rtwdev)
diff --git a/drivers/net/wireless/realtek/rtw88/sdio.h b/drivers/net/wireless/realtek/rtw88/sdio.h
index 6e7e6009744..57890533eec 100644
--- a/drivers/net/wireless/realtek/rtw88/sdio.h
+++ b/drivers/net/wireless/realtek/rtw88/sdio.h
@@ -178,7 +178,10 @@ struct rtw_sdio {
 	atomic_t free_pg_normal;
 	atomic_t free_pg_low;
 	atomic_t free_pg_pub;
+	atomic_t free_pg_extra;
 	atomic_t tx_oqt_free;
+	/* the non-8051 chips' counters hold what the chip last reported */
+	bool free_txpg_valid;
 	/* one writer at a time between the credit check and the accounting */
 	struct mutex tx_credit_lock;
 };
-- 
2.47.3

