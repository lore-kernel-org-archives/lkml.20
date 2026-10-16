Received: from smtp-190a.mail.infomaniak.ch (smtp-190a.mail.infomaniak.ch [185.125.25.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0F284C7557
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 13:40:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.25.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792158045; cv=none; b=o9FGHOWqzDoclv69apyqYjWDjxAnKYoXi5iO5Eiv3E/vP23IxFfEqrWvze4I6l9HmRJKxF6dvTxsc0PpSBK4KJp8t8h7Vddh5xLBFDCW/NUNHZ6e1nloTgZvj4+kk9Z4AUbvY4HGW7wIhEFq4uaMGsLcd37jdZZIfrkgHQR8riE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792158045; c=relaxed/simple;
	bh=35nCpYWPJIaRAIx4nDoi3bcgGVoV/ER1wkx6HE7uMN4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jyKJ28f/YcDDW6wm2QeP0Q4IMcj+AFigtJS4etkvp+mjzUBC+HdvMbTHHHJT6cfL7sf2655VBjHI//j8W0rww9cvEGygdTvQU0ZqC4vP4fi8Il3E5P8GL4xbwOKeTXw46zr3eAU0JIrRbE3jXG/3Mmd9oJ5RgVfwNwziEA46o24=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=0leil.net; spf=pass smtp.mailfrom=0leil.net; dkim=pass (2048-bit key) header.d=0leil.net header.i=@0leil.net header.b=Hh5149Du; arc=none smtp.client-ip=185.125.25.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=0leil.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=0leil.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=0leil.net header.i=@0leil.net header.b="Hh5149Du"
Received: from smtp-4-0001.mail.infomaniak.ch (unknown [IPv6:2001:1600:7:10::a6c])
	by smtp-3-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4j5mKc2PFjzcQp;
	Fri, 16 Oct 2026 15:40:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=0leil.net;
	s=20231125; t=1792158036;
	bh=Qy9U0bG4fRIRlqiXJDykXRQp/u4OIoI8vbmr2tAGcYc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Hh5149DuwUXmaq2dZwmroDWpjTHfh+z2s1E7viZ2WaxW2Yg9LBFxF0zDgJq06VNZp
	 OEhUGqo15ZRvRfYV88WV9xc/0TBFH19A/it4Hda42mVv+oVSUGHs056R7zoUZCyfm5
	 TnKuiMzBoD2NJlovJgc9rMD/pWFykIHLVJxvobM3m+cD7vTecqyi3at8VTyWlJrYu2
	 LPT1uVnJo4qG1utJPCGjK1VcZ6EYSuViRErt36PldsHYocZeWVQALc9QRoQDLivOmf
	 Ydt8cqN2GUsahMjfaE2vfRlsW/q6udthI2n86//lz5eURYZ+RBVBJcjKbvccmQ4KwT
	 J/C+x67+8+tzA==
Received: from unknown by smtp-4-0001.mail.infomaniak.ch (Postfix) with ESMTPA id 4j5mKb2J0nzFpT;
	Fri, 16 Oct 2026 15:40:35 +0200 (CEST)
From: Quentin Schulz <foss+kernel@0leil.net>
Date: Fri, 16 Oct 2026 15:39:59 +0200
Subject: [PATCH 3/3] media: synopsys: csi2rx: add support for Y8 and Y10
 bus formats
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261016-v4l-y8-y10-csi-vicap-v1-3-27bb87aa745d@cherry.de>
References: <20261016-v4l-y8-y10-csi-vicap-v1-0-27bb87aa745d@cherry.de>
In-Reply-To: <20261016-v4l-y8-y10-csi-vicap-v1-0-27bb87aa745d@cherry.de>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Mehdi Djait <mehdi.djait@linux.intel.com>, 
 Michael Riesch <michael.riesch@collabora.com>, 
 Heiko Stuebner <heiko@sntech.de>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 Quentin Schulz <quentin.schulz@cherry.de>
X-Mailer: b4 0.17-dev
X-Infomaniak-Routing: alpha

From: Quentin Schulz <quentin.schulz@cherry.de>

The OV9282 camera sensor driver can output in those two formats, but the
CSI2 RX controller driver didn't advertise support for them yet.

Suggested-by: Michael Riesch <michael.riesch@collabora.com>
Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
---
 drivers/media/platform/synopsys/dw-mipi-csi2rx.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/media/platform/synopsys/dw-mipi-csi2rx.c b/drivers/media/platform/synopsys/dw-mipi-csi2rx.c
index 41e48365167e5..d8c6377235506 100644
--- a/drivers/media/platform/synopsys/dw-mipi-csi2rx.c
+++ b/drivers/media/platform/synopsys/dw-mipi-csi2rx.c
@@ -198,6 +198,16 @@ static const struct dw_mipi_csi2rx_format formats[] = {
 		.depth = 16,
 		.csi_dt = MIPI_CSI2_DT_YUV422_8B,
 	},
+	{
+		.code = MEDIA_BUS_FMT_Y10_1X10,
+		.depth = 10,
+		.csi_dt = MIPI_CSI2_DT_RAW10,
+	},
+	{
+		.code = MEDIA_BUS_FMT_Y8_1X8,
+		.depth = 8,
+		.csi_dt = MIPI_CSI2_DT_RAW8,
+	},
 	/* RGB formats */
 	{
 		.code = MEDIA_BUS_FMT_RGB888_1X24,

-- 
2.56.0

