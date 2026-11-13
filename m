Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794537693;
	b=QeQDXEwWJKAdRgEdEAqqIR1Tco6dHLVysubGI85wY/bxMNOMsYo2zOUo7PVfwe6cOW1G
	 DW2psSr0EytzCsRjKprzcpGqhQJizNBFpS1dW34G1E71/VNEoffiJ0gSSZfGgqoVOkbZr
	 yJ7lTUctVoSwFCmpkz5sBW9dh68rmZ3C4mLk1J2YB0F5oDQEQHkeGBBBljtQ4Xx1jIIoZ
	 c3DR22jIVIoF7MkZE+Jk+N5AoInxDNvq+CXapc7cnna49/WcHdLL/a4VhgPgGSlTwLvbZ
	 hSHm2oJMdbUbAuNo7po+VuBub6ELiIhm+6d+Tb4uKP/w3lvRxj+4RKnVV6V412HXxEw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794537693;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=l+YEUGKtpd7aHWVPQy+x7Xh8BfSvHo7P8pWOf0o5lWw=;
	b=T+VXhegXSBg+dZwJCcU2dqoQjYFJ3s3/rbjpFJABTbyaShUyJZLqTzM/kw4doys/yC4N
	 ysazb8BWmPm46sMMFcHz7JpU4ss9ZbgHhAWuqME9v19eukqQrmrW235LdaSFju5pC5ypF
	 9E5RD6ORzuYSAUg1h0kL0Q5Xp/mAOtRtcXKeYUP9DXaPUmFPLM43MZeekymg+j4k0fI6y
	 uEBuCvaOn/b06dUqUgx/1d5pdyq1W7ZS9vmaoxGmdmWOpZIQW9AXz4gKLA7I12vEMzoGO
	 a2rarPm7KG1cdMGMCpjTIHR/F6WEqLH+EZvtKIZJ28fql1xN6VseOZ+4s74CxlgJXXw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="Ot/FDGmY";
	arc=none smtp.remote-ip=74.125.82.178
Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A56E606A332
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 02:41:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2A56E606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Ot/FDGmY
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-37605faade6so68570eec.3
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 18:41:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794537692; x=1795142492; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=l+YEUGKtpd7aHWVPQy+x7Xh8BfSvHo7P8pWOf0o5lWw=;
        b=Ot/FDGmYOX3fJkau+xRq/sVfSJlsKjLN+XTlP+8V0r6RREnevhSGv+69XCKO0JIEQe
         J9S8Mng770C21K/lp9YDxrEja7pw27r6aIonCdZOkiyFCHaTCwfZiDnHhd4gpWpNt1pk
         n0VJMq2nEWhS0QDmYEFrxyAIfj5dri47oszjn5WYhes2A+JcaA0VQxTUH6Jeh1WLJNUk
         DwH5RsuBAWJXC4q6avEYmf2aSWZBpts7f9DnpIouNYPJcRNnvEJD+F9J8jCzbv1PqJ5e
         ORk8llgBZ5GINCgd2mOic0Y9wG8QrvcyLN4uIFj6uAtXb8MTTIvmG1mGY7HBm+SUxCxO
         i8AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794537692; x=1795142492;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=l+YEUGKtpd7aHWVPQy+x7Xh8BfSvHo7P8pWOf0o5lWw=;
        b=YsgoogcTXo8i9jv4sxEVK38JpVt4RHbt621wtrYikFmF360R1QHGd4DF7qkave0nl3
         OIB9BQGr0L7PoPFMZbatDPtHrE5XebfASlld3TQ9keIodSPul/lXt+fIyjL9545kRPYl
         YyJPXPg4Rj92Wdh20pl6b9lsG54+bcjbQbpKw6M9VJe0QzRVgRIvXRUDgT+2o24+ln36
         wsPlHsO/TyShFtiEHeARMW147dEpNiUfhm72CXd+lFBjQZLp++y93j6QGeOUXP99Licu
         XMdNu2u1jn0zqgkYTSWTUKzswUKP2CKspycvNnj9F3zoaTVl5zNePLBDQ39YWXDmUDGD
         /CUg==
X-Forwarded-Encrypted: i=1; AL+hErFK7oJpdrsJLxtsUdPdqrdvvgmfE/mG2Xo7UcjeEWDJqqYzkSw6iPRcLOmW/1cNNtIVwWO6eGvgN2ZEaAM=@vger.kernel.org
X-Gm-Message-State: APuU4Z9dAyuNRHQEpEGkchZSFcJ2KCTXGYrcHsoeCiBpzpMp+D1t3V3I
	2hDKYt6viLBtD5rP/PTzCQ03kb8rr/6BwygA+tFSdv+sWUomFY5u42rZQtmHhygecTw/zFV3
X-Gm-Gg: AYBFou20i7MyS6kPwyC7sHgGi2AfGdDAyvwNIZhNJckYo4BN0xJbQfHiZ8hdelBZYI3
	mY4SVfp7cW/ORqDsmcjxE4tMZBVw/Mq2tUsUM9tGvCK537XTaHd6s0GvjJVukC5pTx/b0B3z04S
	arr10P70RgG3EK6WVbQRKqsahDJzAafLx4WbigDDYlJ7PYmBIcpfd0x6TSHgA+t/JOlslhLo1K5
	mAZ2uKKs3hfdS15QPUDMOqAd+TJmyD7oTyGIlNsPb4P7snFFwiLaL+KO7jAZdA3/Nx+zqo1AgSJ
	q8WWYCI5cIh8ds6UdAhcnYAq+969kAKzg8nvXg3LxWaE5MitOa2PjZItLuyspRX0LcAUEA8cY/S
	rG2bApwWy9TWeFsO0r5YLH5/WdZI7zNiwBwq54RONFlV1XamvjWANVTp7OVNlbltrwiJIDcV8yU
	oaYn0CaVPgtF4QcMxOLJs14ZdOK6ec4L/ms1smmcgn3wW6in/AqFrTEDfhuA06WXcq0AcdInT9c
	0q6/ydwG+8FcC2g8exzxt77/Chqc/9pbiJlxeisR12em9DAuH123SyLt5qxRtEcsTsUtblqcXAF
	aMDprIuFtblLjfMGTOX0GM872pQAf8ynKavE5ruFCoaPFRadltiMHdY1AmYfutMrvc2tEOYuc2d
	rn3On3PJf03Q6SWGh/UoLVZ3iVuqyw0hstbnkCzxffODgYHyQMzPVJCwRrsIf7QhceTnuYoAlws
	HhymT2uRK5Fw==
X-Received: by 2002:a05:7300:7481:b0:36d:cd5d:d809 with SMTP id 5a478bee46e88-37964ff2d6emr1982567eec.1.1794537692295;
        Thu, 12 Nov 2026 18:41:32 -0800 (PST)
Received: from esteban.tail1178e6.ts.net ([240b:c020:623:52c6::44d])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-379565d07b3sm2334704eec.22.2026.11.12.18.41.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 18:41:31 -0800 (PST)
From: Antoine Pichot <antoine.pichot@gmail.com>
To: linux-media@vger.kernel.org
Cc: sakari.ailus@linux.intel.com,
	mchehab@kernel.org,
	hansg@kernel.org,
	andriy.shevchenko@linux.intel.com,
	dan.scally@ideasonboard.com,
	djrscally@gmail.com,
	dmanresa@gmail.com,
	dave.stevenson@raspberrypi.com,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH v3 3/9] media: i2c: ov7251: Report the pixel array rate for both link frequencies
Date: Fri, 13 Nov 2026 11:40:53 +0900
Message-ID: <20261113024059.1087031-4-antoine.pichot@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261113024059.1087031-1-antoine.pichot@gmail.com>
References: <20261113024059.1087031-1-antoine.pichot@gmail.com>
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

pixel_rates[] gives V4L2_CID_PIXEL_RATE 48 MHz for the 240 MHz link and
63.84 MHz for the 319.2 MHz link, which is the CSI-2 bus rate of each
link (one lane, 10 bits per pixel). The control is the pixel array rate,
and Documentation/driver-api/media/tx-rx.rst says the bus rate "is not
the same thing as the pixel rate on the camera sensor's pixel array
which is indicated by the V4L2_CID_PIXEL_RATE control".

The pixel array runs from PLL2's 48 MHz system clock at both link
frequencies: the PLL2 registers are the same in both tables, and the
measured frame rate is 48000000 / (928 x VTS) with either link. On a
Surface Book 2 at 319.2 MHz, VTS 1724 gives 30.0 fps; 63.84 MHz would
give 39.9 fps. A Surface Pro 7+ measures 30.01, 60.16 and 90.45 fps at
VTS 1724, 860 and 572, the same 48 MHz. Dave Stevenson reported the
same on a Raspberry Pi with a 24 MHz clock, where libcamera asked for
100 fps and got 75, the ratio of the two rates.

Report 48 MHz for both link frequencies and drop the table.

Fixes: ed9566ce1946 ("media: i2c: Add support for new frequencies to ov7251")
Cc: stable@vger.kernel.org
Reported-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
Closes: https://lore.kernel.org/linux-media/CAPY8ntBFJJPg3y46gC=bNq_55QifC7mKmeq8+pAEDVN42fGUXw@mail.gmail.com/
Signed-off-by: Antoine Pichot <antoine.pichot@gmail.com>
---
 drivers/media/i2c/ov7251.c | 16 +++++++---------
 1 file changed, 7 insertions(+), 9 deletions(-)

diff --git a/drivers/media/i2c/ov7251.c b/drivers/media/i2c/ov7251.c
index 1f30a01c85b3..65f3fc2d5889 100644
--- a/drivers/media/i2c/ov7251.c
+++ b/drivers/media/i2c/ov7251.c
@@ -18,10 +18,14 @@
 #include <linux/regulator/consumer.h>
 #include <linux/slab.h>
 #include <linux/types.h>
+#include <linux/units.h>
 #include <media/v4l2-ctrls.h>
 #include <media/v4l2-fwnode.h>
 #include <media/v4l2-subdev.h>
 
+/* PLL2 sys_clk: the pixel array clock at both link frequencies */
+#define OV7251_PIXEL_CLOCK_HZ	(48 * HZ_PER_MHZ)
+
 #define OV7251_SC_MODE_SELECT		0x0100
 #define OV7251_SC_MODE_SELECT_SW_STANDBY	0x0
 #define OV7251_SC_MODE_SELECT_STREAMING		0x1
@@ -633,11 +637,6 @@ static const s64 link_freq[] = {
 	[OV7251_LINK_FREQ_319_2_MHZ] = 319200000,
 };
 
-static const s64 pixel_rates[] = {
-	[OV7251_LINK_FREQ_240_MHZ] = 48000000,
-	[OV7251_LINK_FREQ_319_2_MHZ] = 63840000,
-};
-
 static const struct ov7251_mode_info ov7251_mode_info_data[] = {
 	{
 		.width = 640,
@@ -1567,7 +1566,6 @@ static int ov7251_detect_chip(struct ov7251 *ov7251)
 static int ov7251_init_ctrls(struct ov7251 *ov7251)
 {
 	int vblank_max, vblank_def;
-	s64 pixel_rate;
 	int hblank;
 
 	v4l2_ctrl_handler_init(&ov7251->ctrls, 7);
@@ -1586,12 +1584,12 @@ static int ov7251_init_ctrls(struct ov7251 *ov7251)
 				     ARRAY_SIZE(ov7251_test_pattern_menu) - 1,
 				     0, 0, ov7251_test_pattern_menu);
 
-	pixel_rate = pixel_rates[ov7251->link_freq_idx];
 	ov7251->pixel_clock = v4l2_ctrl_new_std(&ov7251->ctrls,
 						&ov7251_ctrl_ops,
 						V4L2_CID_PIXEL_RATE,
-						pixel_rate, INT_MAX,
-						pixel_rate, pixel_rate);
+						OV7251_PIXEL_CLOCK_HZ, INT_MAX,
+						OV7251_PIXEL_CLOCK_HZ,
+						OV7251_PIXEL_CLOCK_HZ);
 	ov7251->link_freq = v4l2_ctrl_new_int_menu(&ov7251->ctrls,
 						   &ov7251_ctrl_ops,
 						   V4L2_CID_LINK_FREQ,
-- 
2.56.0

