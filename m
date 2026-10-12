Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC8C94B95C7
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 19:03:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791831812; cv=none; b=m0Hry9ErmCW2GVdpKVv43k+o1R9raZTfcw2H/lG+bQvabrNDZh4x1od9FXHhWCNLffyrAE86owAE3qATdERJPZNvLsaRo8a1LasNUeMit8mRlha4ctwIwsi0gUr49WfYVXNFsZyj62uxt7CLIHYcN15bDZtBTWXDqiKfHjN51E4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791831812; c=relaxed/simple;
	bh=S0QQomXR7smCIOTruBVujfvKbomsJ6OoPOS2tKTjoBE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ixOJlJrzjeESuxaACAhhFUVZtiDCzgOIAwLN9xBZvR9RVnbddTqA5FKuaiudf2Qn950tlbB+jcrEkUOcaZ1fR2mwr3vd/O3n3bTMqgL3ZZ/X6mNjVZMb/HsPw94dinel3ut2wng+q4pJgYIL57za/ez8E5gUxzsU5ymjAZcwauY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Qdb2/sIW; arc=none smtp.client-ip=74.125.82.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Qdb2/sIW"
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-3115c4451c8so2304541eec.1
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 12:03:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791831810; x=1792436610; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gg30uP+2zT7F4nzhITDGMjokMeqKShVAiesVP2byYZ8=;
        b=Qdb2/sIWhWKEN3UGtUzEp3llQBuw14HZJB6MB41Fd45ltLaeTfeQzltE8pUBseTsQh
         wQJb4NwyR8jVdYyJyz4QT2BU6g5X/15Ms5LxziYJEShCdirat2pxI6n13oCDJwqUhz+A
         +/oONnI2IRP/+SIzI78fz3P+Eaa5YRhII91nXnH7FVKIVZIlvTXxc0aWiJgoBmeU+3iF
         YAReYTG4RRLPbKM9MWFCvDbuxeiLGnLKywyJeZjdiM/prbxhyW7KyTxiZ4q7yDzdT6aj
         1Mc1pvPpCbty+yfKJ4TKUBkvws13NJ6W7MvXVBnWWFgTm0xsNrelUrhOpulljk6VeSwh
         vlNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791831810; x=1792436610;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=gg30uP+2zT7F4nzhITDGMjokMeqKShVAiesVP2byYZ8=;
        b=PYfOgl7EbD2hh7zclLtT/vvehATAgcHeRN9ymhIsJzAg02xk7uSxxXgfp7/npso1LG
         MpSX9X1IiRftNSOM8sYbYlUfxjFnWZd5yYvLz4Pv2I7m8sEkUx7aCeaGHvwsaZsCwIeW
         t//xH/Qa6Yp4dl/OpIFOruKaerz1HGYNZ7zWb1i/Js3KSFI8u300mk0YbFoOS+a6qPAe
         XKANjct6B/OqCgGiB2FyLxyeASTaGUNgTwSoUhAI3cg4MNT6zvSGYZXyqj9H6KmVz9th
         bRzBoxiZlR0iEMghEJPA0+3TkUA01KnHcg7KRI0LuvvAKCbNTPXfYJBJ1vvAftOs/uF8
         PUGw==
X-Forwarded-Encrypted: i=1; AKwUvBz2HsuBaYAMTR7s9xMc95xSwCFaCb3y5TCgu3zKlnbVzkR/VzkZkcrTklOrOfdnVJpAUYMa8nZ3I8r3YyY=@vger.kernel.org
X-Gm-Message-State: AFq9FYL5gluJNl5bILN1R9uOF5MpCmJA19TY+GR89rS0bVpgBnkTdpts
	6xBs1/HY6E0E0ezevYwqOXISh4Ua/S8gKFPQvchm3/dX4pMoiyZwhrE9Z2Q90CaM
X-Gm-Gg: AYBFou1DXEzP/XSm1J0iI1Q/6Zn5xFGEzv2Ws28HhAEJdht56gOtRyp82SI6Vhapzrv
	oigTYIv+/i7dEg0uRFGZAk9siNIt8iO5EX1p8RtxZ4ep0ArOq3xBSjpMwt6qgjZz4NCzX0zgBrj
	ASB4z4oSna7F73zsVJXffsiSuU+Zqu3LhJ54SZ/VoNLcxISxP0z+orjkxmSsqh/pfLs2vMfGw5y
	2KkNopAxkx5kXLS1mZHfJCah//TPe0pj/1BW7yH6GbnV+Elvkh3R3TXEpXatOqQO1XhcktjjxJ8
	P2cCqlo+X0N7/4C3khgB4cBYOHvFBue1xl95uDPs+JFN159vJaePNPHSdDsjTNcvLHHwkxKB/WN
	Q+24AOkRPV9Vq3+0HZ+DRs4pWiChiybIEj35AZgxTLefZ5MfI1goZ5nIGlRVe02gO+PvR1Zsnqd
	YYpvbPC/eR1YxIemL4WYfCr2cIU7U/g4NRzBlY2dYkRBCcD2NsrGNwFIo03d0cz3+4LySqlGVNR
	ons4MsZLL3HOqT4svhY2+shTD05vi1zN+oVrTw=
X-Received: by 2002:a05:7301:6794:b0:351:606f:2832 with SMTP id 5a478bee46e88-3537df77e03mr19422574eec.3.1791831809517;
        Mon, 12 Oct 2026 12:03:29 -0700 (PDT)
Received: from localhost.localdomain ([136.126.251.209])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3537cb6a279sm35501602eec.30.2026.10.12.12.03.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 12:03:29 -0700 (PDT)
From: Henry Zhang <henryzhang62@gmail.com>
To: Maxime Ripard <mripard@kernel.org>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc: Henry Zhang <henryzhang62@gmail.com>,
	=?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>,
	Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] drm/vc4: dsi: Don't return error reports as read data
Date: Mon, 12 Oct 2026 12:02:42 -0700
Message-ID: <20261012190249.3167-2-henryzhang62@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261012190249.3167-1-henryzhang62@gmail.com>
References: <20261012190249.3167-1-henryzhang62@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
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
 drivers/gpu/drm/vc4/vc4_dsi.c | 22 ++++++++++++++++++++--
 1 file changed, 20 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_dsi.c b/drivers/gpu/drm/vc4/vc4_dsi.c
index 0148f2b..c092a1a 100644
--- a/drivers/gpu/drm/vc4/vc4_dsi.c
+++ b/drivers/gpu/drm/vc4/vc4_dsi.c
@@ -40,6 +40,8 @@
 #include <drm/drm_probe_helper.h>
 #include <drm/drm_simple_kms_helper.h>
 
+#include <video/mipi_display.h>
+
 #include "vc4_drv.h"
 #include "vc4_regs.h"
 
@@ -1300,6 +1302,24 @@ static ssize_t vc4_dsi_host_transfer(struct mipi_dsi_host *host,
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
@@ -1314,8 +1334,6 @@ static ssize_t vc4_dsi_host_transfer(struct mipi_dsi_host *host,
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

