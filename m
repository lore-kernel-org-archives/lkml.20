Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792432484;
	b=Xn4VnH4IAK+5Bfis0gb80A7yDrL9pOyCSGDWMiOhDn30ud/lS0l6W5z0Ibk1frZa92JP
	 /SwnzTzbT32bF2WIgvkm+aD4QXSx+R/yAjzwHHp4oHEsKbyKgySivwGhlnmu9vBI5NAAO
	 n2LwGdP6rCt1ZSJAvQL8ocQruFWPhySa9N70sPBHUh6LuRsYQ6X8jGIShYFDELTZ46j3q
	 FU/NU8uPzMpMFur3IDdSRBUYj4kCyi3sMUNwhadIhFqRwGiaqzWI6FwfRuFq3GBQEFu++
	 g2cOQhdo4jo6RdkGTnaCEdOt41v7Fguy7mWrvezGtcpM9/Kiu78cE2sAjMg5jfag1HA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792432484;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=C7azmWjrPYssETtnPifTR3vECEnxH6JPytoZCfuGPLk=;
	b=Jx8uFkmn6+rEt2y5eKqmwz8CJ6rWRZUHgmS0OtY0o7IieS7B4zWHk4Lw87EnuCY8vj+Q
	 8tcC1/5Ns39+5syOQC0VyiTM6yW/daWFmJQDrLqZAuninVwkiZ0U/E9XJ7w3e5++UUvqm
	 4SpFE0Pr9rwjPv09V6rF4wRWgKmoOMYmo5j3+Coqx0pDLkAvRMQBM2/nHmKQkPjv+3doL
	 YQ6G3lRAYjwZDK+gAb3sikwBNHhpp3AjE9YJkIxwpZc7QdNTJrDkCpiwsRycmCKX2Eat8
	 T2kyKlMmvR5mMpRiL8ov/qGlqqUojVP6z4RGEpJpzZp+T/a9Bzp1gaG97oHnLckTnvw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=CFQWBLTH;
	arc=none smtp.remote-ip=74.125.82.41
Received: from mail-dl1-f41.google.com (mail-dl1-f41.google.com [74.125.82.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58642606A319
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 17:54:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 58642606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=CFQWBLTH
Received: by mail-dl1-f41.google.com with SMTP id a92af1059eb24-1517bda04a0so1839237c88.0
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 10:54:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792432483; x=1793037283; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=C7azmWjrPYssETtnPifTR3vECEnxH6JPytoZCfuGPLk=;
        b=CFQWBLTHrFVEGfoEhvAVJ9MNBeUNXbqD4XRKIRqrwSfwJwuUGAA3X7MKcytIWusf6n
         nVTy29OXDaMj8jcZbweXuRHOYhFqQItkFO9A0JLjydOxX/RJ5rEIU6xEt6FAGav7CaY0
         ICEgotfCqs51T1IsoIf8i2+P9jD5MuBe8u7H6I7qynm0epm+ww7eWdahUansVPE7zz2j
         3KZuXMHrlyTpcgCAUwPcf4XhxxNjckc5VkW8cMN9kWlMXkAK2bgl8xUeO47m1ll61ypu
         E4QHr8Cp07BBAFsYE8ZdMgXFHSzMf2QvDQ8vuseR8IX9VTdJ651bOVdeQbMSuF0tuz6c
         oCoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792432483; x=1793037283;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=C7azmWjrPYssETtnPifTR3vECEnxH6JPytoZCfuGPLk=;
        b=liUyW7XU5Ay/125nDIqjoPeC/yxTjSQq7diqfKirStEqby3RRSdRQOkn3raHHDkxX8
         gzt9uriM169Hn0oXpAxZLM5mJkzMXLA+wS3PdlYtYICOA6DuvRcJgZgzfCDZ/WLNJPsT
         WxNoHtPz+TyLH1mP1W4XQpPKfKQ8xjqK/FxAMffXeDhNdaBuYiTN/NCblSYOZIJpqKSo
         mpL0qDxYpX7pqxXyI8GQ/6LcVTxKQXh6f8c7CFpIMFEdcoarLc7w6rapZLuvqZBFpnez
         5YAOmQ++oVDFyOVDUquSt9CxXzPFvTM7g+HOHK0gobGW3WaR5frbkZhX70kj4+zTZxyL
         JNKQ==
X-Forwarded-Encrypted: i=1; AKwUvByh7A+ZyhdUQmQDVSZsGpfaFmWI75CfftyTdj5/hIhN6MCW8RJv5H6dOuW90ilMgKUkV33xSl+aU+Vw32k=@vger.kernel.org
X-Gm-Message-State: AFq9FYKYlxoVBtGWBiVq+1wkwQRLc4YpUYWfMGKxe+8PKa5Tee78ml++
	tW2xTWSqdzl8nhC1Fd9LWWtEet9zcCsArKfjXSiL+qdFD6p0+jLXccjb
X-Gm-Gg: AYBFou1RAe/txcfbWtkTRsiE+RUkBD0kazfltGhY0Vv8PcDSN1rSx4y7o1Rdiv1eGH2
	eBmWfapJh+115lS2Rld33j5Uv5sZNqHElE1oB2RCGmeG241MbhxpsXq+qAVg+N7j/1SSGzAVaPl
	/zqFr4B2XD6UJqrkBxHI9qulwwlX611AQoY3BT9cX+FDPIE1pM1Zknusv/0xMBLigycylLjAaPk
	xIdxnYuTa8VDgf/RbUeGio1F7bvZDqA2OQXFKwyHYYM78jc5n0Xc7wd0yH54UIONttNmKwexOgy
	xQVW5cC3B9JAXPwiuw6m3ICCCqoBd89tcLNTAkEL+8mQ1kLm+/qdovwwr2QZu9mRHrnpeAWGFCr
	BulBk5zOd9OwNO7B0rPnpm2zzq3A616/RNjgMwyJYl+drLl4VotSaNnYFBXIdxHvHx/K/m5lhWD
	HUFXU42lOQ2X/BoVXTnj6w5GwxiIHf95g0aJ0KfJKBmOLy2cfBrD5idtwxoE5plJKgnobRsZ4tv
	44qkg1RMuepemqxngYAnqEuRqyNmE7PihDlk9k=
X-Received: by 2002:a05:701b:2092:20b0:168:3243:c907 with SMTP id a92af1059eb24-1851238b3cbmr13066525c88.24.1792432483063;
        Mon, 19 Oct 2026 10:54:43 -0700 (PDT)
Received: from localhost.localdomain ([136.126.251.209])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1831c5cb39esm31837697c88.22.2026.10.19.10.54.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 10:54:42 -0700 (PDT)
From: Henry Zhang <henryzhang62@gmail.com>
To: henryzhang62@gmail.com,
	Maxime Ripard <mripard@kernel.org>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc: =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>,
	Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/3] drm/vc4: dsi: Don't return error reports as read data
Date: Mon, 19 Oct 2026 10:49:28 -0700
Message-ID: <20261019174930.7237-2-henryzhang62@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261019174930.7237-1-henryzhang62@gmail.com>
References: <20261019174930.7237-1-henryzhang62@gmail.com>
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

When a DSI peripheral detects an error, for example contention during
the bus turnaround, it may answer a read request with an Acknowledge
and Error Report short packet instead of the read response.

vc4_dsi_host_transfer() does not check the type of the received packet
(there is a FINISHME for it). It copies the two bytes of the error
report into the caller's buffer and returns success, so the caller
gets the error bits as if they were register contents. Packets
received with a checksum error, an uncorrectable ECC error or
incomplete are passed on the same way.

Return -EIO in these cases so that callers can tell a failed read from
data, and retry if they want to.

Signed-off-by: Henry Zhang <henryzhang62@gmail.com>
---

Notes:
    v2: no changes.

 drivers/gpu/drm/vc4/vc4_dsi.c | 22 ++++++++++++++++++++--
 1 file changed, 20 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_dsi.c b/drivers/gpu/drm/vc4/vc4_dsi.c
index 5ed3c35..5452b72 100644
--- a/drivers/gpu/drm/vc4/vc4_dsi.c
+++ b/drivers/gpu/drm/vc4/vc4_dsi.c
@@ -39,6 +39,8 @@
 #include <drm/drm_print.h>
 #include <drm/drm_probe_helper.h>
 
+#include <video/mipi_display.h>
+
 #include "vc4_drv.h"
 #include "vc4_regs.h"
 
@@ -1299,6 +1301,24 @@ static ssize_t vc4_dsi_host_transfer(struct mipi_dsi_host *host,
 		u32 rxpkt1h = DSI_PORT_READ(RXPKT1H);
 		u8 *msg_rx = msg->rx_buf;
 
+		/*
+		 * A peripheral that detected an error, e.g. contention during
+		 * the bus turnaround, may answer with an Acknowledge and Error
+		 * Report instead of the read response. Don't hand that, or a
+		 * packet received with errors, to the caller as read data.
+		 * Bits 7:6 of the Data ID are the virtual channel.
+		 */
+		if ((rxpkt1h & (DSI_RXPKT1H_CRC_ERR | DSI_RXPKT1H_DET_ERR |
+				DSI_RXPKT1H_INCOMP_PKT)) ||
+		    (!(rxpkt1h & DSI_RXPKT1H_PKT_TYPE_LONG) &&
+		     (VC4_GET_FIELD(rxpkt1h, DSI_RXPKT1H_DT_LP_CMD) & 0x3f) ==
+		     MIPI_DSI_RX_ACKNOWLEDGE_AND_ERROR_REPORT)) {
+			drm_dbg_driver(drm, "DSI read rejected, RXPKT1H 0x%08x\n",
+				       rxpkt1h);
+			ret = -EIO;
+			goto reset_fifo_and_return;
+		}
+
 		if (rxpkt1h & DSI_RXPKT1H_PKT_TYPE_LONG) {
 			u32 rxlen = VC4_GET_FIELD(rxpkt1h,
 						  DSI_RXPKT1H_BC_PARAM);
@@ -1313,8 +1333,6 @@ static ssize_t vc4_dsi_host_transfer(struct mipi_dsi_host *host,
 			for (i = 0; i < msg->rx_len; i++)
 				msg_rx[i] = DSI_READ(DSI1_RXPKT_FIFO);
 		} else {
-			/* FINISHME: Handle AWER */
-
 			msg_rx[0] = VC4_GET_FIELD(rxpkt1h,
 						  DSI_RXPKT1H_SHORT_0);
 			if (msg->rx_len > 1) {
-- 
2.47.3

