Received: from mx1.white.stw.pengutronix.de (mx1.white.stw.pengutronix.de [185.203.200.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75A3F3815E8;
	Wed, 16 Sep 2026 15:09:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.200.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789571394; cv=none; b=I7KK8b752HIQJX2wzeHukqa8owR1GD1uc+DRzWKPHyPlon98O7VrcOjOFULwbpAfdjAdR+UU9hqzYOc1ocwSCWD1uKLc/CCSBYLS4v2bUcGOy38qpzQoS80C1hE+tO29y8VTG7+8AxqgI1VUdxPe0IVPCt5HfoymBpVnqde1Ds8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789571394; c=relaxed/simple;
	bh=SaLfQm36VUoqbMuVy62pw9cRyJGDK8TihHHaeRK8jpg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WL9Phxaj5UPdGdsiQPTy86RpMhOuXKf5T3DNkzJVGgPQACz+kh7wMkn+RUiZJscOKfdz9n7bbIUw22pJCbNowccwZtCp/CsIyXj1LqA3Y5KR4ftYuUkQ6l6DvfYKbndEg94XDcdmzB+YJjI6AC5MHEMu1Yl5WilaJskr9PWS2Uk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.200.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
X-PTX-Original-Recipient: ezequiel@vanguardiasur.com.ar
X-PTX-Original-Recipient: jacob-chen@iotwrt.com
X-PTX-Original-Recipient: mchehab@kernel.org
X-PTX-Original-Recipient: detlev.casanova@collabora.com
X-PTX-Original-Recipient: heiko@sntech.de
X-PTX-Original-Recipient: linux-kernel@vger.kernel.org
X-PTX-Original-Recipient: linux-media@vger.kernel.org
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-PTX-Original-Recipient: linux-rockchip@lists.infradead.org
X-PTX-Original-Recipient: lgs201920130244@gmail.com
X-PTX-Original-Recipient: p.zabel@pengutronix.de
X-PTX-Original-Recipient: kernel@pengutronix.de
X-PTX-Original-Recipient: s.pueschel@pengutronix.de
X-PTX-Original-Recipient: m.tretter@pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de (drehscheibe.grey.stw.pengutronix.de [IPv6:2a0a:edc0:0:c01:1d::a2])
	(Authenticated sender: relay-from-drehscheibe.grey.stw.pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id 7EF132059F0;
	Wed, 16 Sep 2026 17:09:48 +0200 (CEST)
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77] helo=peter.mobile.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.96)
	(envelope-from <s.pueschel@pengutronix.de>)
	id 1x6rGe-001Fsx-1G;
	Wed, 16 Sep 2026 17:09:48 +0200
From: =?utf-8?q?Sven_P=C3=BCschel?= <s.pueschel@pengutronix.de>
Date: Wed, 16 Sep 2026 17:09:44 +0200
Subject: [PATCH v2 03/17] media: rockchip: rga: move early return into if
 condition in vidioc_enum_fmt
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260916-spu-rga3multicore-v2-3-23aa2cb74e61@pengutronix.de>
References: <20260916-spu-rga3multicore-v2-0-23aa2cb74e61@pengutronix.de>
In-Reply-To: <20260916-spu-rga3multicore-v2-0-23aa2cb74e61@pengutronix.de>
To: Jacob Chen <jacob-chen@iotwrt.com>, 
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Heiko Stuebner <heiko@sntech.de>, Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 kernel@pengutronix.de, Detlev Casanova <detlev.casanova@collabora.com>, 
 Michael Tretter <m.tretter@pengutronix.de>, 
 Guangshuo Li <lgs201920130244@gmail.com>, 
 =?utf-8?q?Sven_P=C3=BCschel?= <s.pueschel@pengutronix.de>
X-Mailer: b4 0.15.2

Instead of a doing an early return when we don't have a capture device,
merge the condition with the following if condition. This improves
readability, as the condition now explicitly contains a check for a
capture device instead of returning when we don't have a capture device.

Also use the V4L2_TYPE_IS_CAPTURE helper and improve the comment.

The early return if was copied from the vivid drivers
vivid_enum_fmt_vid function.

Signed-off-by: Sven Püschel <s.pueschel@pengutronix.de>
---
 drivers/media/platform/rockchip/rga/rga.c | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/drivers/media/platform/rockchip/rga/rga.c b/drivers/media/platform/rockchip/rga/rga.c
index efe5541078214..8c03422d669cf 100644
--- a/drivers/media/platform/rockchip/rga/rga.c
+++ b/drivers/media/platform/rockchip/rga/rga.c
@@ -372,12 +372,14 @@ static int vidioc_enum_fmt(struct file *file, void *priv, struct v4l2_fmtdesc *f
 	if (ret != 0)
 		return ret;
 
-	if (f->type != V4L2_BUF_TYPE_VIDEO_CAPTURE &&
-	    f->type != V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE)
-		return 0;
-
-	/* allow changing the quantization and xfer func for YUV formats */
-	if (v4l2_is_format_yuv(v4l2_format_info(f->pixelformat)))
+	/*
+	 * Allow changing the quantization and ycbcr_enc func for YUV formats
+	 * on the capture side for RGB -> YUV conversions.
+	 *
+	 * These flags are only relevant for capture devices.
+	 */
+	if (V4L2_TYPE_IS_CAPTURE(f->type) &&
+	    v4l2_is_format_yuv(v4l2_format_info(f->pixelformat)))
 		f->flags |= V4L2_FMT_FLAG_CSC_QUANTIZATION |
 			    V4L2_FMT_FLAG_CSC_YCBCR_ENC;
 

-- 
2.55.0

