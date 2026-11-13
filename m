Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=119.15.109.137
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794558197;
	b=iZNoE367rEV5z3PQQWMYQ4XharCnzch7kIZmIJ8/2uybne7i0y37u/hxfpsHfrawqf9w
	 bP4MccvEJQW4ipjhI+eAvSX/FqH/4qP9MZmcZFBrRocFlosSOQLY+IgNuGWfTm9IoimzB
	 bhmw4DLWo5oqOoEGPYN1waioEOBRsEvvlm3djXm1alg74or8a/cUIk2mL83B9bWMnGddC
	 8nZDRNYSJSAE9OV4ZlAkW1aSYiDYL8L1IHWDBajty775TJ1dhQOkTjSd2CN/IriiMuxtC
	 jgA0VEDjVqL9Gp3lPfAfn1lN821GYhy6Ty0dFRVDnnou3JtVuGVjznJ9Mqb+pxWSvPQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794558197;
	h=DMARC-Filter:Received:DKIM-Signature:X-GPT-Reason:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=Dl62qA8RPRg3DFAObvPL2Fn4f72QQhDJ3yuNQH7rz3s=;
	b=ZpCTzEGQoDQX/B9MffO/sslIFbpaD1HJ1URZ9sy1ZvWPCh/1qFYeuTJOCzUckDXYy9Xn
	 6R8LTtUZDpfdla65w+kV1kuRN3j4gVNvl/AMZE7xT9CfQ0Bsqm49+swDL03t4bPwbtlZ1
	 9ea8t7eIOSsMZ7/b1l8uQIE7Yrv51V9Bxax1nNzO9OleKhb8d+Z1NNyMGZ2QL+nAz75vu
	 4aKDXP7b/XBgPfOPRZIujT5xo2tkGUfDAxVQtG5aEg2tEbsg5h28/Pt1lurKhpsGWgKpV
	 iuoWlf8ddgkQW9LkFCTbRENYUXHtOYoBXeg38RLhPjK9r/CbtqCOH16nAKcHEzWZPxA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=d-silva.org;
	spf=pass smtp.mailfrom=d-silva.org;
	dkim=pass header.d=d-silva.org header.i=@d-silva.org header.a=rsa-sha256 header.s=2025a header.b=GA7hn9dE;
	arc=none smtp.remote-ip=119.15.109.137
Received: from www.nmnhosting.com (watt.d-silva.org [119.15.109.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E5A9606A88F;
	Fri, 13 Nov 2026 08:23:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3E5A9606A88F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=d-silva.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=d-silva.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=d-silva.org header.i=@d-silva.org header.a=rsa-sha256 header.s=2025a header.b=GA7hn9dE
Received: from Hawking.lan (hawking.lan [10.0.1.4])
	by www.nmnhosting.com (Postfix) with ESMTP id 73A104572F;
	Fri, 13 Nov 2026 19:23:09 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=d-silva.org; s=2025a;
	t=1794558189;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Dl62qA8RPRg3DFAObvPL2Fn4f72QQhDJ3yuNQH7rz3s=;
	b=GA7hn9dEF5/cQsaPf1Y9eQ16v4GzRV1R6INqVnQ1hItWEUts4gFs+UcnnLkVMyEA5E5g02
	HXOKET9CNz1Q/goBuG9k/O7yt1f3CPxPqW+sDPhRj3uQc6zhcyJSjMI5fbzanUEIe13gHV
	SjhLq2QYH/xSU4chjJBVlICSAGn1SYiSsRTaOWVpqXiRWwLGPmgVHvmDdXQSrsdEFbbnjo
	0F1YcRTT32tevmMtAsHY2uUBva5ndp3JcyjNxgDlq1J5pspZCi8DAKHnAuzYRVQ/V9qhw+
	46bQbUE3UScxLfhSIjZw71rpZbXk22oi8AdoZpVkhU4l0QMgfjmOUO/ijCJHvg==
X-GPT-Reason: legitimate; the email is a technical patch submission
	for a Linux kernel driver (rtw88) which is consistent with the
	personal/professional context of the recipient alastair@d-silva.org;
	the From domain (d-silva.org) matches the sender's identity and
	the content; the message contains highly specific technical refactoring
	details (register sizes, HISR behavior) and standard Linux kernel
	mailing list metadata (Acked-by, Reviewed-by, Signed-off-by) with
	no signs of marketing, phishing, or urgency.
From: Alastair D'Silva <alastair@d-silva.org>
To: linux-wireless@vger.kernel.org,
	Ping-Ke Shih <pkshih@realtek.com>,
	Kalle Valo <kvalo@kernel.org>
Cc: Luka Gejak <luka.gejak@linux.dev>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Ulf Hansson <ulfh@kernel.org>,
	linux-kernel@vger.kernel.org,
	Alastair D'Silva <alastair@d-silva.org>
Subject: [PATCH rtw-next v10 4/4] wifi: rtw88: sdio: Split rtw_sdio_rx_isr into 8051 and 3081 variants
Date: Fri, 13 Nov 2026 19:22:42 +1100
Message-ID: <20261113082242.2773369-5-alastair@d-silva.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261113082242.2773369-1-alastair@d-silva.org>
References: <20261113082242.2773369-1-alastair@d-silva.org>
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

Split rtw_sdio_rx_isr() into separate 8051 and 3081 variants to be
clear. The two differences between the architectures are:
- Register size: REG_SDIO_RX0_REQ_LEN is 16-bit on 8051, 32-bit on 3081.
- HISR behavior: 8051 re-reads REG_SDIO_HISR on each iteration, while
  3081 drains based on rx_len without re-reading HISR.

This is a refactoring without any logic changes.

Assisted-by: LLM
Acked-by: Ping-Ke Shih <pkshih@realtek.com>
Reviewed-by: Luka Gejak <luka.gejak@linux.dev>
Signed-off-by: Alastair D'Silva <alastair@d-silva.org>
---
 drivers/net/wireless/realtek/rtw88/sdio.c | 58 +++++++++++++----------
 1 file changed, 33 insertions(+), 25 deletions(-)

diff --git a/drivers/net/wireless/realtek/rtw88/sdio.c b/drivers/net/wireless/realtek/rtw88/sdio.c
index 6100e691a5ca4..c26ce1b6b38b2 100644
--- a/drivers/net/wireless/realtek/rtw88/sdio.c
+++ b/drivers/net/wireless/realtek/rtw88/sdio.c
@@ -1473,17 +1473,13 @@ static int rtw_sdio_rxfifo_recv(struct rtw_dev *rtwdev, u32 rx_len)
 	return 0;
 }
 
-static void rtw_sdio_rx_isr(struct rtw_dev *rtwdev)
+static void rtw_sdio_rx_isr_8051(struct rtw_dev *rtwdev)
 {
 	u32 rx_len, hisr, total_rx_bytes = 0;
 	int ret;
 
 	do {
-		if (rtw_chip_wcpu_8051(rtwdev))
-			rx_len = rtw_read16(rtwdev, REG_SDIO_RX0_REQ_LEN);
-		else
-			rx_len = rtw_read32(rtwdev, REG_SDIO_RX0_REQ_LEN);
-
+		rx_len = rtw_read16(rtwdev, REG_SDIO_RX0_REQ_LEN);
 		if (!rx_len)
 			break;
 
@@ -1493,33 +1489,45 @@ static void rtw_sdio_rx_isr(struct rtw_dev *rtwdev)
 
 		total_rx_bytes += rx_len;
 
-		if (rtw_chip_wcpu_8051(rtwdev)) {
-			/* Stop if no more RX requests are pending, even if
-			 * rx_len could be greater than zero in the next
-			 * iteration. This is needed because the RX buffer may
-			 * already contain data while either HW or FW are not
-			 * done filling that buffer yet. Still reading the
-			 * buffer can result in packets where
-			 * rtw_rx_pkt_stat.pkt_len is zero or points beyond the
-			 * end of the buffer.
-			 */
-			hisr = rtw_read32(rtwdev, REG_SDIO_HISR);
-		} else {
-			/* RTW_WCPU_3081 chips have improved hardware or
-			 * firmware and can use rx_len unconditionally.
-			 */
-			hisr = REG_SDIO_HISR_RX_REQUEST;
-		}
+		/*
+		 * Stop if no more RX requests are pending, even if
+		 * rx_len could be greater than zero in the next
+		 * iteration. This is needed because the RX buffer may
+		 * already contain data while either HW or FW are not
+		 * done filling that buffer yet. Still reading the
+		 * buffer can result in packets where
+		 * rtw_rx_pkt_stat.pkt_len is zero or points beyond the
+		 * end of the buffer.
+		 */
+		hisr = rtw_read32(rtwdev, REG_SDIO_HISR);
 	} while (total_rx_bytes < SZ_64K && hisr & REG_SDIO_HISR_RX_REQUEST);
 }
 
+static void rtw_sdio_rx_isr_3081(struct rtw_dev *rtwdev)
+{
+	u32 rx_len, total_rx_bytes = 0;
+	int ret;
+
+	do {
+		rx_len = rtw_read32(rtwdev, REG_SDIO_RX0_REQ_LEN);
+		if (!rx_len)
+			break;
+
+		ret = rtw_sdio_rxfifo_recv(rtwdev, rx_len);
+		if (ret)
+			break;
+
+		total_rx_bytes += rx_len;
+	} while (total_rx_bytes < SZ_64K);
+}
+
 static void rtw_sdio_handle_interrupt_8051(struct rtw_dev *rtwdev, u32 hisr)
 {
 	if (hisr & REG_SDIO_HISR_TXERR)
 		rtw_sdio_tx_err_isr(rtwdev);
 	if (hisr & REG_SDIO_HISR_RX_REQUEST) {
 		hisr &= ~REG_SDIO_HISR_RX_REQUEST;
-		rtw_sdio_rx_isr(rtwdev);
+		rtw_sdio_rx_isr_8051(rtwdev);
 	}
 
 	/*
@@ -1549,7 +1557,7 @@ static void rtw_sdio_handle_interrupt_3081(struct rtw_dev *rtwdev, u32 hisr)
 	if (hisr & REG_SDIO_HISR_TXERR)
 		rtw_sdio_tx_err_isr(rtwdev);
 	if (hisr & REG_SDIO_HISR_RX_REQUEST)
-		rtw_sdio_rx_isr(rtwdev);
+		rtw_sdio_rx_isr_3081(rtwdev);
 
 	/*
 	 * Unmasking HIMR re-asserts the IRQ line if new packets arrived or if
-- 
2.53.0

