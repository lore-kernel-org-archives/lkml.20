Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D94EB266581;
	Fri,  2 Oct 2026 12:16:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790943412; cv=none; b=dDQG6T2NlvxN760mde2pmviJL6jNYPCUf761hzOw3hUwI6xEhyJQaamg/rtORB0APEH+1asY9dvKWQ9hI77HcWi/8mePTa6uPJM6yT/ChL1FuKthP4clUKS0PXFA75vmRGVoB8D16/XyLiB20OchUm0vh7e+TA954RoOYhT4k1M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790943412; c=relaxed/simple;
	bh=hWvROiBQkqgwYapnAaGEgy91XM4lZH3rX2b5rdYyUEM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=aGYd9jlRQYSSjQXAncKOTUhLoCHlzq1Zm9TSl70xI7dzZZHPq4YzxSJoGrgBzQQ56jOoQQVsnjkipBQaOjbmzUCG7DabPdP85rPkPRkJsMV6Yq5pS61KURy4rDABZnQ0499KFzyvSIcAGZatOkDwydG0aS+gMKvTkXODBqOPac0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=vZaNG2pj; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="vZaNG2pj"
Received: from pb-laptop.local (185.182.214.55.nat.pool.zt.hu [185.182.214.55])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 191DB5E;
	Fri,  2 Oct 2026 14:14:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1790943294;
	bh=hWvROiBQkqgwYapnAaGEgy91XM4lZH3rX2b5rdYyUEM=;
	h=From:To:Cc:Subject:Date:From;
	b=vZaNG2pjGZf5q/7aenUNXYfzavHTPGhlNCg+RFNYInDWfBCHZqIpTfby14tMTG8b0
	 rnTu7RvwnTp229SHWYoHInz17exaQl/qZTUZN9/K9J49gogSLg8pkcuzBw9AeHDLPs
	 dCw8oGQ/nDwS6U7EXhRloxN48C8KSzdLkAexRJoc=
From: =?UTF-8?q?Barnab=C3=A1s=20P=C5=91cze?= <barnabas.pocze+renesas@ideasonboard.com>
To: Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>,
	Jai Luthra <jai.luthra+renesas@ideasonboard.com>,
	=?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Barnab=C3=A1s=20P=C5=91cze?= <barnabas.pocze+renesas@ideasonboard.com>
Subject: [PATCH v1] media: rppx1: lsc: Fix and use LSC_SIZE_VALUE()
Date: Fri,  2 Oct 2026 14:16:43 +0200
Message-ID: <20261002121643.418200-1-barnabas.pocze+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.56.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Firstly, the size values are 10-bit unsigned integers, and there doesn't
appear to be an upper limit in the hardware documentation, and testing also
seems to confirm that 1023 works as expected, so the correct mask to use is
0x3ff (1023), not 0x1ff (511).

Secondly, actually use `LSC_SIZE_VALUE()` when populating the size registers
instead of using the `LSC_GRAD_VALUE()` macro.

Fixes: b39656efb71a ("media: rppx1: lsc: Add support for lens shade correction")
Signed-off-by: Barnabás Pőcze <barnabas.pocze+renesas@ideasonboard.com>
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

