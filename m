Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793042219;
	b=5eDnU6Kvbq2jkXXQ3L/95+I3u7HojONT1xm8YI5WMrDvUzGOB0/Jd7FiRIjtixd2llDg
	 LUlrO/ZeTj5N8tN9lK1+UpHbzsop0lJwTwSPZX2TzqvVP42uIYg/MRRhVyEWI1mZyuMeK
	 Sjxfg+W9inY/pyxrkg3NzMBwlOOPHaihVXZGE33jtbNv8BC7PQILDN08qKDoJTebxOh3y
	 LU3CtBJTyN8jcz7rR40gRSUOA//hQt3KKYXVu2MdDq0KfW3kLDXN7gLx3mBO+Ypw5O/Fo
	 /w8XfKPvZugk0Ond/YeQjIqexZ89JCU2rZVS0PlYQ2Z4NAO/haao4eo0nhWRnCc1PEw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793042219;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=V7os7q6ROONwI3bHWhMjwfZ8GV54GUpgZwrMIsvJS9k=;
	b=SgE8COX0VtpAvqiNhPHx7BRlZYNG7AOh+vfrLLGmOBa+hufbdboVPU6M80LJ13MPuSCV
	 CuIr4PtqMLgILynaD8LqpjnUZhpYknLjKEUxjsjOA1mAt7Mz68J1XiHI/g7jixFG8XZCz
	 GeYDdzREH/MWykDh/uM7KWxKiijOY0BDkQCPL2RbJqPMk+fxuqORTXFfmRt3fvKNgf0kK
	 J3VdNRk2e0jxTPR9iuT4w/KvVmprdL5gsVeTMxR38SY33l/rhSecDvzaTKslc08HhPtkg
	 LLh+ZQ4Pq8PpYsJW6OxNSdu4pWkJ1SqygBv8aolaJSzS591MZ2WxopwYvWlj2eNAiqw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=ZpImfSiK;
	arc=none smtp.remote-ip=74.125.82.173
Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD385606A335
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 19:16:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BD385606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=ZpImfSiK
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-369f33df08eso3648714eec.0
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 12:16:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793042218; x=1793647018; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=V7os7q6ROONwI3bHWhMjwfZ8GV54GUpgZwrMIsvJS9k=;
        b=ZpImfSiKKiAqz9fc+p7Nz5I2hou0OU53qmd/nRSjpIg8AUG0rZ4wPoWNxJPqVBK0XW
         0WYrjy6OWxhdvEVGcw38DLRh0+O3/wOv0gwD23zGu6I2aUaaicOy92Uq0SP8pILDwXAR
         BVygJuwcOCnoHCg3StCRDYSb0L/ICi1bxDxwbj7KQaSXsen34Y6jzcXcl9RtHtRUw+uA
         DADCn4IzXUjdhQs+OBssM3F4MlFQYFrN/V0qTtUKzHq7DHKPQ2eHjPwsfs8QDUEFou/I
         87UBvNCjDHWUjKrLs/P22+Lp2GXMaBcc4NogtfAZX3xv4dkx/ujOT/Y2fpwPeHV1gbVi
         pTNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793042218; x=1793647018;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=V7os7q6ROONwI3bHWhMjwfZ8GV54GUpgZwrMIsvJS9k=;
        b=CWln9I6Ivn/bNGjVh54tc7pbB2Eo1Z1cFo1NsYbzJyVuHjA8wdb05oG1z0vT2xiIb7
         EJ+j5DrJaMSEsSXvdmWdeP+o/RM3SsE0tks1OwGcZUl9T/gtgzuoKUa+vglOtduXV8QM
         wwlLxbpk0chgStbrw3i3RO3/1jy3rbn1FLw7WY6ex38HJ2/ylO/a9JzRFCOThSuzpzBl
         CNWsT/ykZDR9YhYRnt0kfAG17hY4vIkU3luXZ9UChWYESbMW3NanSWFAuy7oXXf4juFg
         044qgJ9P+Im3pJuKjlEMylkoDBdsX3b+bGFhyAgAV1zj1glnwP346jVOP0SHhx+sox9Y
         RNlA==
X-Forwarded-Encrypted: i=1; AKwUvBz6kaoL/Z0Yk6iIXMaS3fZZYC0kebnSrkY7kl+lNVIl1Pr88LjEhkZxFjMTVl4SsrnQVV8nlhZumFX3a7o=@vger.kernel.org
X-Gm-Message-State: AFq9FYJLYA01phCObrmFNT8azrY19LPZCY5u1M/zhw+fihGuRnzriU5q
	GpRcOWfnXxcjkvS0Y9QWnSe9af9ALJF7lUBrQ9mmwR6v0iNHGtwMUTvH
X-Gm-Gg: AYBFou1MO4SPdchRYVZqMzCO/nXsOhF+KJgFyFKDbSYMnZ39/+WgkfSC0UBg5LDa2nl
	Ync7FBMvRpl1baV7xQP5f5wklhyadrhwe/FaK121mikNhIB/pY7/aQWmbd97+K3E131wJOeqwJ8
	N6XCyfF7/R5CMcgXEhz1kqrtnXExD+kIQ34OFCO9QbfhY60VWS/+zU5k9ncIrbPxdRTjeYwWrkE
	LSoHjJIy5uEHIwKCBLynZo92kmGltJnUTrtoKyW3ztQS1SvFFxfxzesWqnED5QHt/e2U83PBtWq
	JtwoNLQsdnnCzCO5I6m4RkOzdH9Vs+A1MawbGvSxoDq2HOAH6XJwx0jAneWa/UHbTMAnfQs7iqz
	m7Biz4TbynntyD27htn8mJWbmmnoaG8bHff8EW+FCLqI0anlICBVZVUZTTDiBgB/UDLYiD492Hq
	zK44YvXXQMw8HW9PuqXEn9XAJLM9zDXrOTDMhVAoQrFjkazMb1an6t/XLFFG+AguxRMh4RQJVHM
	twDNu09KJu7m7TTsQR9Af5mayGBJr9Tnj94IaWr6rzWja42d+kxQAEHYjntRKVK2mKM252/uZDj
	26+fuQ6kc3rljAd4ZAvA
X-Received: by 2002:a05:693c:4015:b0:369:d992:e3 with SMTP id 5a478bee46e88-369e8660a6bmr10838577eec.32.1793042217669;
        Mon, 26 Oct 2026 12:16:57 -0700 (PDT)
Received: from localhost.localdomain ([136.126.251.209])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a01fa4c58sm25348449eec.21.2026.10.26.12.16.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 12:16:57 -0700 (PDT)
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
Subject: [PATCH v3 1/4] drm/vc4: dsi: Don't return error reports as read data
Date: Mon, 26 Oct 2026 12:14:55 -0700
Message-ID: <20261026191618.9430-2-henryzhang62@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261026191618.9430-1-henryzhang62@gmail.com>
References: <20261026191618.9430-1-henryzhang62@gmail.com>
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
 drivers/gpu/drm/vc4/vc4_dsi.c | 22 ++++++++++++++++++++--
 1 file changed, 20 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_dsi.c b/drivers/gpu/drm/vc4/vc4_dsi.c
index 5ed3c35ee..5452b727a 100644
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

