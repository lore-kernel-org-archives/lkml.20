Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.142.180.65
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793702757;
	b=EIiuIXF1qx+AvEKIah8mbQfT70SwnbLDj6NXu2vVWlHzLTXygpmOLtbggkhxdINK4+Kv
	 fD9eWnGzkslyFcP5x0/9gZjYndrRUDs4GLD4GM3GLVNZoM2eGY6R23AIqhcGEP2qzT4Uu
	 UO+QVuHg5iANzFt/k8cYkRmwpUWz04yWS6cXUSNl0CVFmQ2Ae/3Y5YJyimmm/HFlpE0ad
	 gLsraozKq0LphH2qT0llsOu9l0D1WC+gXiX/1f5RguKd7/6L9gvZK8aTW/+CcFhm1gzIN
	 ms2XdEZsKfrCD6CYzFksS3i2gixz6alpTb1S+bGUGVpSsfO+MeR6oYGY8RMTYJL3cVA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793702757;
	h=DMARC-Filter:Received:Date:From:To:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=CnTGAzsEPJVKC2tZ84EFt0Wg+eAK2QZrF0H1p9wbIEA=;
	b=t/XmszUlv0OONppD2zdMjzmkK5u5CAMs8kZjAzhO6nqImKoK9ZGbCkPcHC3p1Aryrloy
	 aJn0Wz+45Bm+N0dUAXdwOUpRsx9sO7Fsz7inE/57W++pk4VOMIczdQVXTphbU/75qg+zI
	 ED1f4rnWGBJN7jmORfu729PVrxng2N0Nxf+1Ik92u7kyRJ3uQMvPu5UqFSycRmtzzbytn
	 1QdnLiIwSfVyM8s0IiDh8yZTVN6wRiLbLOZ/yOXadzlps/UwdMpS9aKHzc8Adx8AaQiPo
	 CoHSVdw3IzofPaNo45SoQSrJlUyh2nlZsDlUpJJ8QgkrU+KeK2Ow54vP5zCgPjlnh1Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=makrotopia.org;
	spf=pass smtp.mailfrom=makrotopia.org;
	arc=none smtp.remote-ip=185.142.180.65
Received: from pidgin.makrotopia.org (pidgin.makrotopia.org [185.142.180.65])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0287606C5AE;
	Tue,  3 Nov 2026 10:45:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B0287606C5AE
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=makrotopia.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=makrotopia.org
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256:X25519MLKEM768)
	 (Exim 4.100.1)
	(envelope-from <daniel@makrotopia.org>)
	id 1xOC1V-0000000032l-3BX5;
	Tue, 03 Nov 2026 10:45:49 +0000
Date: Tue, 3 Nov 2026 10:45:47 +0000
From: Daniel Golle <daniel@makrotopia.org>
To: Mehdi Djait <mehdi.djait@linux.intel.com>,
	Michael Riesch <michael.riesch@collabora.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH 5/6] media: rockchip: rkcif: raise the MIPI DMA write priority
Message-ID: <38f62ccfaf96bca1c79755cf393f89c6177fdd15.1793702189.git.daniel@makrotopia.org>
References: <cover.1793702189.git.daniel@makrotopia.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1793702189.git.daniel@makrotopia.org>

The MIPI control register holds the DDR urgency controls of the write
FIFO: a pressure level and a hurry level, each with its enable, and the
FIFO water line above which they apply. The driver sets only the water
line enable bit.

Program the values the vendor driver uses, pressure and hurry at level
three from a quarter-full FIFO, so that the capture raises its priority
on the memory bus as the FIFO fills. The bit layout is the same on the
RK3568, RV1126 and RK3588.

Assisted-by: LLM
Signed-off-by: Daniel Golle <daniel@makrotopia.org>
---
 .../rockchip/rkcif/rkcif-capture-mipi.c       | 20 ++++++++++++-------
 1 file changed, 13 insertions(+), 7 deletions(-)

diff --git a/drivers/media/platform/rockchip/rkcif/rkcif-capture-mipi.c b/drivers/media/platform/rockchip/rkcif/rkcif-capture-mipi.c
index 0cef1cc35eedd..a00fe64a1a9d4 100644
--- a/drivers/media/platform/rockchip/rkcif/rkcif-capture-mipi.c
+++ b/drivers/media/platform/rockchip/rkcif/rkcif-capture-mipi.c
@@ -37,7 +37,12 @@
 #define RK3588_MIPI_CTRL0_CROP_EN     BIT(4)
 #define RK3588_MIPI_CTRL0_PARSE(type) ((type) << 1)
 
-#define RK3588_MIPI_CTRL_CAP_EN       BIT(0)
+#define RKCIF_MIPI_CTRL_PRESS_VALUE(x) ((x) << 13)
+#define RKCIF_MIPI_CTRL_PRESS_ENABLE BIT(12)
+#define RKCIF_MIPI_CTRL_HURRY_VALUE(x) ((x) << 5)
+#define RKCIF_MIPI_CTRL_HURRY_ENABLE BIT(4)
+#define RKCIF_MIPI_CTRL_WATER_LINE_25 (0x2 << 1)
+#define RKCIF_MIPI_CTRL_WATER_LINE_ENABLE BIT(0)
 
 #define RKCIF_MIPI_CTRL0_DT_ID(id)    ((id) << 10)
 #define RKCIF_MIPI_CTRL0_VC_ID(id)    ((id) << 8)
@@ -891,12 +896,13 @@ static int rkcif_mipi_start_streaming(struct rkcif_stream *stream)
 	rkcif_mipi_stream_write(stream, RKCIF_MIPI_CTRL1, ctrl1);
 	rkcif_mipi_stream_write(stream, RKCIF_MIPI_CTRL0, ctrl0);
 
-	/*
-	 * TODO: This bit has a different meaning on the RK3568, but it is
-	 * set there by default anyway. While correct, this is not exactly
-	 * nice and shall be reworked during the next refactoring.
-	 */
-	rkcif_mipi_write(interface, RKCIF_MIPI_CTRL, RK3588_MIPI_CTRL_CAP_EN);
+	rkcif_mipi_write(interface, RKCIF_MIPI_CTRL,
+			 RKCIF_MIPI_CTRL_PRESS_VALUE(3) |
+				 RKCIF_MIPI_CTRL_PRESS_ENABLE |
+				 RKCIF_MIPI_CTRL_HURRY_VALUE(3) |
+				 RKCIF_MIPI_CTRL_HURRY_ENABLE |
+				 RKCIF_MIPI_CTRL_WATER_LINE_25 |
+				 RKCIF_MIPI_CTRL_WATER_LINE_ENABLE);
 
 	return 0;
 }
-- 
2.56.0
