Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAC8133064D;
	Fri,  9 Oct 2026 14:17:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791555425; cv=none; b=RD6fOIQMhbuq2qazbT2yGss9+PZBmiarb7CeIiMmD/OCVFT/NA6GylPdjmhxcZy6BPNMoou0Y1QbpwWGQf1DdB5bPmGDafI1mgIGGlSs5Kp97pro2RGbAw2pHOVr4BL7Pqsy25Nn6U7H1BO8He/R3X7s3HHcwzqsa3YSJ/BGAyw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791555425; c=relaxed/simple;
	bh=2GftN3Em5sqmcePRRo24BS7O5sMYGNlo/eJ1GnYoSrA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=HNnUK12v5ShpQk2F7jOeCtAo947NEHBrcKBr3VslMnl1dUES/cBK6uwUrBVtz9uHSi/Ymm6Xa5imPWoblp4y03VC+buLH+fVW3AR7a2RQLMVdwpYEyC6YUhiVPCfWdorfhRkBOhTZIBQlDWDg6UAdu+y4p8mc5klzE5rOMOy9RE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=m7AX7is2; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="m7AX7is2"
Received: from pb-laptop.local (185.221.142.67.nat.pool.zt.hu [185.221.142.67])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id CB73D346;
	Fri,  9 Oct 2026 16:15:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1791555301;
	bh=2GftN3Em5sqmcePRRo24BS7O5sMYGNlo/eJ1GnYoSrA=;
	h=From:To:Cc:Subject:Date:From;
	b=m7AX7is2d4M6der+mnXBIaXyltT/57PvqYfV3Gceyzvl7CTubyhpnDPB+fpVUAmqQ
	 gnHaYtWhOpmXs40D1fVYFuqDe616ZJn+Ifr1JtJE6CRDPN/f5Lx5ZPUNCY8aUxq3J6
	 Iv1r/m6BbpIE7tLeDPv+2GsCauFb7cFQpdLZ+BeQ=
From: =?UTF-8?q?Barnab=C3=A1s=20P=C5=91cze?= <barnabas.pocze+renesas@ideasonboard.com>
To: Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>,
	Jai Luthra <jai.luthra+renesas@ideasonboard.com>,
	=?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Barnab=C3=A1s=20P=C5=91cze?= <barnabas.pocze+renesas@ideasonboard.com>
Subject: [PATCH v2] media: rppx1: lsc: Fix and use LSC_SIZE_VALUE()
Date: Fri,  9 Oct 2026 16:16:52 +0200
Message-ID: <20261009141652.252872-1-barnabas.pocze+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.56.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Firstly, the size values are defined as 10-bit unsigned integers, and there
doesn't appear to be an additional upper limit in the hardware documentation,
so the upper limit should be 1023. Testing also shows that a value of 1023
is accepted and works as expected. So the correct mask to use is 0x3ff (1023),
not 0x1ff (511).

Secondly, actually use `LSC_SIZE_VALUE()` when populating the size registers
instead of using the `LSC_GRAD_VALUE()` macro.

Fixes: b39656efb71a ("media: rppx1: lsc: Add support for lens shade correction")
Signed-off-by: Barnabás Pőcze <barnabas.pocze+renesas@ideasonboard.com>
Reviewed-by: Jai Luthra <jai.luthra+renesas@ideasonboard.com>
Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
 .../platform/dreamchip/rppx1/rppx1_lsc.c      | 34 +++++++++----------
 1 file changed, 17 insertions(+), 17 deletions(-)

diff --git a/drivers/media/platform/dreamchip/rppx1/rppx1_lsc.c b/drivers/media/platform/dreamchip/rppx1/rppx1_lsc.c
index 8badeca23e249..ffc52ca23dd99 100644
--- a/drivers/media/platform/dreamchip/rppx1/rppx1_lsc.c
+++ b/drivers/media/platform/dreamchip/rppx1/rppx1_lsc.c
@@ -57,7 +57,7 @@
 
 #define LSC_R_TABLE_DATA_VALUE(v1, v2) (((v1) & 0xfff) | (((v2) & 0xfff) << 12))
 #define LSC_GRAD_VALUE(v1, v2) (((v1) & 0xfff) | (((v2) & 0xfff) << 16))
-#define LSC_SIZE_VALUE(v1, v2) (((v1) & 0x1ff) | (((v2) & 0x1ff) << 16))
+#define LSC_SIZE_VALUE(v1, v2) (((v1) & 0x3ff) | (((v2) & 0x3ff) << 16))
 
 static int rppx1_lsc_probe(struct rpp_module *mod)
 {
@@ -157,24 +157,24 @@ rppx1_lsc_fill_params(struct rpp_module *mod,
 	write(priv, mod->base + LSC_YGRAD_1415_REG, LSC_GRAD_VALUE(v[14], v[15]));
 
 	v = cfg->x_sect_size;
-	write(priv, mod->base + LSC_XSIZE_01_REG, LSC_GRAD_VALUE(v[0], v[1]));
-	write(priv, mod->base + LSC_XSIZE_23_REG, LSC_GRAD_VALUE(v[2], v[3]));
-	write(priv, mod->base + LSC_XSIZE_45_REG, LSC_GRAD_VALUE(v[4], v[5]));
-	write(priv, mod->base + LSC_XSIZE_67_REG, LSC_GRAD_VALUE(v[6], v[7]));
-	write(priv, mod->base + LSC_XSIZE_89_REG, LSC_GRAD_VALUE(v[8], v[9]));
-	write(priv, mod->base + LSC_XSIZE_1011_REG, LSC_GRAD_VALUE(v[10], v[11]));
-	write(priv, mod->base + LSC_XSIZE_1213_REG, LSC_GRAD_VALUE(v[12], v[13]));
-	write(priv, mod->base + LSC_XSIZE_1415_REG, LSC_GRAD_VALUE(v[14], v[15]));
+	write(priv, mod->base + LSC_XSIZE_01_REG, LSC_SIZE_VALUE(v[0], v[1]));
+	write(priv, mod->base + LSC_XSIZE_23_REG, LSC_SIZE_VALUE(v[2], v[3]));
+	write(priv, mod->base + LSC_XSIZE_45_REG, LSC_SIZE_VALUE(v[4], v[5]));
+	write(priv, mod->base + LSC_XSIZE_67_REG, LSC_SIZE_VALUE(v[6], v[7]));
+	write(priv, mod->base + LSC_XSIZE_89_REG, LSC_SIZE_VALUE(v[8], v[9]));
+	write(priv, mod->base + LSC_XSIZE_1011_REG, LSC_SIZE_VALUE(v[10], v[11]));
+	write(priv, mod->base + LSC_XSIZE_1213_REG, LSC_SIZE_VALUE(v[12], v[13]));
+	write(priv, mod->base + LSC_XSIZE_1415_REG, LSC_SIZE_VALUE(v[14], v[15]));
 
 	v = cfg->y_sect_size;
-	write(priv, mod->base + LSC_YSIZE_01_REG, LSC_GRAD_VALUE(v[0], v[1]));
-	write(priv, mod->base + LSC_YSIZE_23_REG, LSC_GRAD_VALUE(v[2], v[3]));
-	write(priv, mod->base + LSC_YSIZE_45_REG, LSC_GRAD_VALUE(v[4], v[5]));
-	write(priv, mod->base + LSC_YSIZE_67_REG, LSC_GRAD_VALUE(v[6], v[7]));
-	write(priv, mod->base + LSC_YSIZE_89_REG, LSC_GRAD_VALUE(v[8], v[9]));
-	write(priv, mod->base + LSC_YSIZE_1011_REG, LSC_GRAD_VALUE(v[10], v[11]));
-	write(priv, mod->base + LSC_YSIZE_1213_REG, LSC_GRAD_VALUE(v[12], v[13]));
-	write(priv, mod->base + LSC_YSIZE_1415_REG, LSC_GRAD_VALUE(v[14], v[15]));
+	write(priv, mod->base + LSC_YSIZE_01_REG, LSC_SIZE_VALUE(v[0], v[1]));
+	write(priv, mod->base + LSC_YSIZE_23_REG, LSC_SIZE_VALUE(v[2], v[3]));
+	write(priv, mod->base + LSC_YSIZE_45_REG, LSC_SIZE_VALUE(v[4], v[5]));
+	write(priv, mod->base + LSC_YSIZE_67_REG, LSC_SIZE_VALUE(v[6], v[7]));
+	write(priv, mod->base + LSC_YSIZE_89_REG, LSC_SIZE_VALUE(v[8], v[9]));
+	write(priv, mod->base + LSC_YSIZE_1011_REG, LSC_SIZE_VALUE(v[10], v[11]));
+	write(priv, mod->base + LSC_YSIZE_1213_REG, LSC_SIZE_VALUE(v[12], v[13]));
+	write(priv, mod->base + LSC_YSIZE_1415_REG, LSC_SIZE_VALUE(v[14], v[15]));
 
 	/* Enable module. */
 	write(priv, mod->base + LSC_CTRL_REG, LSC_CTRL_LSC_EN);
-- 
2.56.0

