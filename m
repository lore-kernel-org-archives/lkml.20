Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793205977;
	b=fKvUIaJHGiXvK7zz1pqlChY3JV86h5J4c0n/iORqdCfXipstWSDvLJCsxfpPzoqu5DvF
	 Im8150pLWSllKiSBYJThJL6meEynka8m2ENYHSXYQMgIvjssPaK5LhhqB05ytUUyIoEid
	 muGrKA2/HOnFOQRSYbTtMXuYIz89Li9mZRIr6D/SVbuFTmg7OcwXdeJmb51mJ+5VLSgvI
	 d1fcHjb4gHaoWo1XwOFJOgL+8KJp8VC+wxHF6uDfu/tj7wzzy4FEs/uusJUcbFgeptqnu
	 vpCUZh73ZXwZyEbxCG8LjuHcbuJudNMvlNiMl54bBLXvhTTRikW1jw3cyjc4+FRrbww==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793205977;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=nVp2xwOFbAzbZYwoIV/veWLs6VENy+j34lM3/5MySVY=;
	b=vifGNmpUuzVoQ+/3wLTftf3vrOjKOHPF7gPrUdDd02ngJn6wO39kV4cxPG215dWLV9Dg
	 B1Ho8AwwgaPzY4RLSimdg6mbKmdDxwztEBxZLlVraykCAQdYpVROTx9K42oQPiLWkGMLk
	 PKlIgnMeb0THqMSIOnlJdX9q+BsNy2wdlQfiKtiR/+O5sjkEkcsrIkzTBojI1nR1bPp55
	 D4Ki73cUVpHkz79dMJ7FWAaNm0hRGdP6mby7qCEL0WyE2DjDPrbocpfGc/Lgtw6XNKjCl
	 Q5JNW8e+cAdlIEMpSLYgSRGNciCx4YoYKMWWxM88nVmZzysfZEe+pGfBCOVHSvNsftg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wtirVuXs;
	arc=none smtp.remote-ip=74.125.82.178
Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26B7960A2618
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 16:46:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 26B7960A2618
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wtirVuXs
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-33bf40b0c8bso66678eec.0
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 09:46:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793205976; x=1793810776; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nVp2xwOFbAzbZYwoIV/veWLs6VENy+j34lM3/5MySVY=;
        b=wtirVuXsTWwU7Rs+zeuJK8tbRBa6ybFVxL8HPRD/ROASFhQ2XIv9dY5vC4pWmphcLs
         SdJX9YLXePgDKUpw9H5MAc+5L6Y0DNArD91w7rs6lY8N9YF5sMq1W2rhSTtYrwE05jLp
         aZ+t0yjy7RoiZa7pIN3OXUzvN1+FfJ5WZXKLiiepIkWeQXe6efdppWI89/Bd/F/ulzkW
         twkwKNrn0vPgAg4Fr1y9qI08x9/AZ02aBv5G6xW7WoM33DfXpDflBsZk7AWSYJ6RxczI
         Fdy1qiPefhVusUIeTxRP4JqSxvhGwckXqmeuP9z6JBYGOM0VbqsjLgs+YJkWKRctsxmv
         qkxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793205976; x=1793810776;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=nVp2xwOFbAzbZYwoIV/veWLs6VENy+j34lM3/5MySVY=;
        b=kMBrTBKIdoMcG+dmRXgAmPeVI3vxiNzvra+qx3LSFW6GGyQ9JNfOEmyZOSaxeZ7Fw8
         K7SErjb2g6yri0JV//9fuSZW9SJjUm8cHuGdAknEc7oYJtBG68nPXmhSZvIoU/u5ldC4
         viUCwncqi3hHpwfETfS8n6GkA6I421pyY6MStLKXud7eU88XCyXomdweuGCL3VQ2oqL1
         dYE+8D5ed6F7/e5mZVItMPffIfXCOxhGYgBg+32VWbPeDgBugjs8/AKD1jGvncMwhh5s
         SxYB4J8ftJo0dPZZ9tH0kX1RaxPsLxNLFD1maKAD0w6qWnWfeC4LBB0GilAKHFYky/LW
         qq/w==
X-Forwarded-Encrypted: i=1; AKwUvByVB3qOIWH6fJ4ubnj3lLdewSLVVlP7PKd9ZuBVUzySVJ08EFwRhx+E9fdrwS1HdZjtklvmx5pN8l3Zug4=@vger.kernel.org
X-Gm-Message-State: AFq9FYKpr+JwWm4cbg98xQhR6cIqAnvSW4ssF4Ljvh08phyWnYe004Rk
	QEeWq0e7dKRhbYOeUYSzaW/Zo/oC/o9RodLwa/VwqxgbSD19hpgbT+n0
X-Gm-Gg: AYBFou1Wv+9cuj0sdu/uvu77eLu6GI5aqpu85RfsvREITVbNY9HTXMpKhXLykdRaEIQ
	NtK1lDjdr7ThWmU/JfRs7iT6d+TnzDz8a46Rv6GuM39sOt41fAXLFxfAorGiQyZkzKWaGpTOKzg
	rFTFsSSa2patW4Xrcpopjfa5+reWs/gznvLDQ1VHcG7UnirWTCNdkAd6l6YQwTQRPZPvCu6tCuG
	Wi0+wilEmw/+ZzdfeCAE4cRXcYl0vORC7jIZvhspxDYdVwC/SWmtxX1hik6alvZf9DyBKqfM9bs
	dx+F9Q3oRljnVIndv3rLOIkriP5AWrhDAeqPXB5SaggjOGp7N8k/vkXTzXlg+as0xJL5kyLrM3M
	S3t4rb9v4FhJ7z6CVqYsJYCgN9rF2z92g9uzMOeJYdd+aOE9XIRNa//IvUUZvjD4IGNrAwZStxA
	/G1A9Pc7nT5P0ZKKLju4tMI9bxG2iVXemLaRlBYQjOMoe7DJUmoNCBIIfGFXgFOQlJkC8MrQpRj
	Ga0q5CsQYOtgyzp//OXtmKjq6pPjDVDLoywn6/MitKPjfzHeM9Sm9vxL2+N2iNL+UIJrr8gNO+e
	wNwy93xfOOMoXQtjaggUm/yz1JSRSCfT10cwUFw+wvQl4R8Rx0+mpH9arNfrj4o+IXhULZo=
X-Received: by 2002:a05:693c:60c6:b0:369:fd32:79fe with SMTP id 5a478bee46e88-36a203cd26cmr4554102eec.17.1793205976186;
        Wed, 28 Oct 2026 09:46:16 -0700 (PDT)
Received: from localhost.localdomain ([136.126.251.209])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a23908449sm7821964eec.11.2026.10.28.09.46.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 09:46:15 -0700 (PDT)
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
Subject: [PATCH v4 2/5] drm/vc4: dsi: Don't return error reports as read data
Date: Wed, 28 Oct 2026 09:45:27 -0700
Message-ID: <20261028164539.3471833-3-henryzhang62@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261028164539.3471833-1-henryzhang62@gmail.com>
References: <20261028164539.3471833-1-henryzhang62@gmail.com>
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

Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
Signed-off-by: Henry Zhang <henryzhang62@gmail.com>
---
 drivers/gpu/drm/vc4/vc4_dsi.c | 22 ++++++++++++++++++++--
 1 file changed, 20 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_dsi.c b/drivers/gpu/drm/vc4/vc4_dsi.c
index aa2b46fb0..1eea60aec 100644
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

