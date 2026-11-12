Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.199
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794464264;
	b=yfZuyKQv5zlzIsj/VbKVistUykzdouGwc+azQczoRlFDUS/ZLNoZgWsQZxFtba/hR86r
	 1+/JYL4iKg6l7KBXIraiJcaMzFoUNlWLVIrjLJZjC6YL+ZYoCK3I+Pswsgh1P1e+l6sR7
	 1UgUDMLwd2MQLqFXb9I9WrFDwPIupnjrJQ8MqnckFtRSCytuhm7hp35K8J8U7dAkmuF/j
	 LnaUv9QMXk0Iz6E/DUXBDpQrlnopqzDgqh1NfwWuR+dWIWRnfOUPUO0ofY+M6CIQgPSbP
	 S1d5+74dUqgn14mxLL5D2cilq8X6/i2RlmiLBkgHpZcFLlgQNjUWZmu4wWOYnyaEymg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794464264;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:Mime-Version:
	 X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=njjyBXz9L58T+lg+LdB1WaYpD3pBpeVCDltq1wefIsE=;
	b=11j0XiGhCx0leHK+cSgzOV2cQg6P0AzfyiS73jQmnPusBUr3cwGbynKMbQxXqMdtMQHm
	 vkUIjNpHzIWeIxVe1onbMw+JRd+XpGqwrOiv15K8R2RmRZFsEJjQ3/TNcwsJ2VC3aeqBx
	 lNnawKE2ocq2mg23HiVC1LCIBC0eKixaC/TPY/9bM+Wzb/XZnlLQTONaKwhvKuSzQGZhJ
	 dghIJwu8EKfBQxh2p0LdPSssTecNfqbCSls7+PYZrYnA+eRrtDckVmBy9QrDbrBQWdVR9
	 wxyzrsDfETO0f6K/kLS+oXWWi672HXxHu8Rhhsp9Ega9cJfP2ZHk9/b/M8fzxUDRn9A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--yidilin.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=SPRgMWhb;
	arc=none smtp.remote-ip=209.85.215.199
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04799606A327
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 06:17:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 04799606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--yidilin.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=SPRgMWhb
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cdd48746a49so2260187a12.0
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 22:17:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794464263; x=1795069063; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=njjyBXz9L58T+lg+LdB1WaYpD3pBpeVCDltq1wefIsE=;
        b=SPRgMWhblnd+Ga/qY57+ocGprUbNr7GYnQWOcGtuNm4qKxURRcq/aXuGVEbr6R0n44
         V2a93kCqR2azy3Mg1vkWU9uI8pNOb83JObpH3cFSd4wAVk2xshDpJM/Q2f5Qj0Am3sk+
         mzAZvGWRIbcCIoIDLIdWakagn8ozTgiWhQ1h+i/axrOvZdDmd1NmBoxOyni8IWRv5wPB
         MuiaBaFna+S57Zxe12b3zGrHjHH5POsNudJ3mVSjSV71LrUQDeR9zBPf/ecH9No7ecqa
         6qglTgoCMB0SRpoCUG6xk7JfRmEDFo80snEDyiOqowG6FmNwSdHKDD8sWNiiUwOMZYgI
         3fHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794464263; x=1795069063;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=njjyBXz9L58T+lg+LdB1WaYpD3pBpeVCDltq1wefIsE=;
        b=HiXuT+2vQfnY2hs5KBsCAgOmTN08xEfYWB4KGVEqyePK4qWs16kG81sp+cg1odJCll
         jREt8/mmCaVJtq1gn9t/kMFFDR9QtNpftxGtyM+i/baJ+zemk2gFYUtlcImjFU7HX9Gg
         HM0XF3PMqdbwFPDeXOwDo4xaXHdRB65wNbnbtmYI+39qNNtAEFNvG2De/oeUjukRrv2k
         wgz/pQtMJH2ZCFwgPqAsAQXznfAsEELgCMucLJnACucijI3lccOnoeTpx5DkvwHT6iHA
         /cokxMC7u5mpYxFKgYXC4CQrP1bA+2iC+LakavdfVVhdzoR3azhq8TXTql/FWUMcxdSy
         rypA==
X-Forwarded-Encrypted: i=1; AL+hErFT/iszx1oWuvuAEwJHC9txFht7efqzQNKIfQlD6fc842+Qa9z4DNdOYv3pG3+467PNaxDDqbrrLqng5yA=@vger.kernel.org
X-Gm-Message-State: APuU4Z+MUWirYzWltuwBDn9RD/0gOegiKju5XKmYymI4Z0gWkKIfh0RA
	FldDXG/Mu6Ie+B+7qy1tbBH1XZIQ51a2M9oWsoEGWQnkgcmTcjpfQkSuCURNKrw1VO9bmF1QiCZ
	3l6JG/YLFig==
X-Received: from pjbga7.prod.google.com ([2002:a17:90b:387:b0:3ab:3979:1be4])
 (user=yidilin job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:2584:b0:3ac:7556:8eed
 with SMTP id 98e67ed59e1d1-3b182f8532dmr4081954a91.44.1794464263018; Wed, 11
 Nov 2026 22:17:43 -0800 (PST)
Date: Thu, 12 Nov 2026 14:17:36 +0800
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.0.611.g1030f0b940-goog
Message-ID: <20261112061736.4014993-1-yidilin@google.com>
Subject: [PATCH] drm/mediatek: dp: Wait for the complete AUX reply before
 reading it
From: Yidi Lin <yidilin@google.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>
Cc: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Fei Shao <fshao@chromium.org>, 
	dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	Yidi Lin <yidilin@google.com>
Content-Type: text/plain; charset="UTF-8"

mtk_dp_aux_wait_for_completion() returns for a read as soon as the RX
FIFO write pointer is non-zero, i.e. when the first byte of the reply
has arrived. The rest of the reply is still on the AUX line, so
mtk_dp_aux_read_rx_fifo() sleeps 500-1000 us before reading each byte
of an I2C-over-AUX reply and 100-200 us before each byte of a native
reply. The FIFO is drained this way even for DEFER replies, which carry
no data.

A 16-byte EDID read therefore takes about 16 ms, although the reply is
complete within about 300 us of the request.

Wait for the AUX receive-complete (or 400 us timeout) interrupt status
instead, which the write path already relies on, and drain the RX FIFO
without delays. Poll every 20 us instead of every 100-500 us.

Reading the 256-byte EDID through the DP AUX DDC adapter drops from 266
to 6.5 ms on an MT8189 Chromebook, and from 547 to 23 ms on an MT8196
Chromebook whose panel defers every 16-byte read once. A 16-byte DPCD
read drops from about 4.7 to 0.5 ms.

Signed-off-by: Yidi Lin <yidilin@google.com>
---
 drivers/gpu/drm/mediatek/mtk_dp.c | 64 ++++++++++++-------------------
 1 file changed, 25 insertions(+), 39 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_dp.c b/drivers/gpu/drm/mediatek/mtk_dp.c
index f656b85b84212..b2f7f42cbe715 100644
--- a/drivers/gpu/drm/mediatek/mtk_dp.c
+++ b/drivers/gpu/drm/mediatek/mtk_dp.c
@@ -45,7 +45,8 @@
 #define MTK_DP_4P1T 4
 #define MTK_DP_HDE 2
 #define MTK_DP_PIX_PER_ADDR 2
-#define MTK_DP_AUX_WAIT_REPLY_COUNT 20
+#define MTK_DP_AUX_POLL_US 20
+#define MTK_DP_AUX_TIMEOUT_US 10000
 #define MTK_DP_TBC_BUF_READ_START_ADDR 0x8
 #define MTK_DP_TRAIN_VOLTAGE_LEVEL_RETRY 5
 #define MTK_DP_TRAIN_DOWNSCALE_RETRY 10
@@ -825,20 +826,18 @@ static void mtk_dp_aux_fill_write_fifo(struct mtk_dp *mtk_dp, u8 *buf,
 }
 
 static void mtk_dp_aux_read_rx_fifo(struct mtk_dp *mtk_dp, u8 *buf,
-				    size_t length, int read_delay)
+				    size_t length)
 {
 	int read_pos;
 
 	mtk_dp_update_bits(mtk_dp, MTK_DP_AUX_P0_3620,
 			   0, AUX_RD_MODE_AUX_TX_P0_MASK);
 
+	/* The complete reply is in the RX FIFO, so read it without delays. */
 	for (read_pos = 0; read_pos < length; read_pos++) {
 		mtk_dp_update_bits(mtk_dp, MTK_DP_AUX_P0_3620,
 				   AUX_RX_FIFO_READ_PULSE_TX_P0,
 				   AUX_RX_FIFO_READ_PULSE_TX_P0);
-
-		/* Hardware needs time to update the data */
-		usleep_range(read_delay, read_delay * 2);
 		buf[read_pos] = (u8)(mtk_dp_read(mtk_dp, MTK_DP_AUX_P0_3620) &
 				     AUX_RX_FIFO_READ_DATA_AUX_TX_P0_MASK);
 	}
@@ -864,33 +863,28 @@ static void mtk_dp_aux_set_length(struct mtk_dp *mtk_dp, size_t length)
 	}
 }
 
-static int mtk_dp_aux_wait_for_completion(struct mtk_dp *mtk_dp, bool is_read)
+static int mtk_dp_aux_wait_for_completion(struct mtk_dp *mtk_dp)
 {
-	int wait_reply = MTK_DP_AUX_WAIT_REPLY_COUNT;
-
-	while (--wait_reply) {
-		u32 aux_irq_status;
-
-		if (is_read) {
-			u32 fifo_status = mtk_dp_read(mtk_dp, MTK_DP_AUX_P0_3618);
-
-			if (fifo_status &
-			    (AUX_RX_FIFO_WRITE_POINTER_AUX_TX_P0_MASK |
-			     AUX_RX_FIFO_FULL_AUX_TX_P0_MASK)) {
-				return 0;
-			}
-		}
-
-		aux_irq_status = mtk_dp_read(mtk_dp, MTK_DP_AUX_P0_3640);
-		if (aux_irq_status & AUX_RX_AUX_RECV_COMPLETE_IRQ_AUX_TX_P0)
-			return 0;
+	u32 aux_irq_status;
+	int ret;
 
-		if (aux_irq_status & AUX_400US_TIMEOUT_IRQ_AUX_TX_P0)
-			return -ETIMEDOUT;
+	/*
+	 * Wait until the whole reply has been received. The RX FIFO write
+	 * pointer becomes non-zero as soon as the first byte of the reply
+	 * arrives, while the rest of the reply is still on the AUX line, so
+	 * it cannot be used to tell that the reply is complete.
+	 */
+	ret = regmap_read_poll_timeout(mtk_dp->regs, MTK_DP_AUX_P0_3640,
+				       aux_irq_status,
+				       aux_irq_status &
+				       (AUX_RX_AUX_RECV_COMPLETE_IRQ_AUX_TX_P0 |
+					AUX_400US_TIMEOUT_IRQ_AUX_TX_P0),
+				       MTK_DP_AUX_POLL_US, MTK_DP_AUX_TIMEOUT_US);
+	if (ret)
+		return ret;
 
-		/* Give the hardware a chance to reach completion before retrying */
-		usleep_range(100, 500);
-	}
+	if (aux_irq_status & AUX_RX_AUX_RECV_COMPLETE_IRQ_AUX_TX_P0)
+		return 0;
 
 	return -ETIMEDOUT;
 }
@@ -928,7 +922,7 @@ static int mtk_dp_aux_do_transfer(struct mtk_dp *mtk_dp, bool is_read, u8 cmd,
 	mtk_dp_aux_request_ready(mtk_dp);
 
 	/* Wait for feedback from sink device. */
-	ret = mtk_dp_aux_wait_for_completion(mtk_dp, is_read);
+	ret = mtk_dp_aux_wait_for_completion(mtk_dp);
 
 	*reply_cmd = mtk_dp_read(mtk_dp, MTK_DP_AUX_P0_3624) &
 		     AUX_RX_REPLY_COMMAND_AUX_TX_P0_MASK;
@@ -952,15 +946,7 @@ static int mtk_dp_aux_do_transfer(struct mtk_dp *mtk_dp, bool is_read, u8 cmd,
 				   AUX_TX_AUXTX_OV_EN_AUX_TX_P0_MASK |
 				   AUX_RESERVED_RW_0_AUX_TX_P0_MASK);
 	} else if (is_read) {
-		int read_delay;
-
-		if (cmd == (DP_AUX_I2C_READ | DP_AUX_I2C_MOT) ||
-		    cmd == DP_AUX_I2C_READ)
-			read_delay = 500;
-		else
-			read_delay = 100;
-
-		mtk_dp_aux_read_rx_fifo(mtk_dp, buf, length, read_delay);
+		mtk_dp_aux_read_rx_fifo(mtk_dp, buf, length);
 	}
 
 	return 0;
-- 
2.56.0.611.g1030f0b940-goog

