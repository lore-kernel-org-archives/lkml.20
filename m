Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.142.180.65
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794654606;
	b=mHaMlTy2aMS5FdIYfb/5zCrlX2VuVl+vd4vBcvO5701K3RESRHMXeM1Fbba8RBWfZxKn
	 X3ULzX2+F34nWynRa8hPm/d2foU7ApCTAB//4P1Jiu12kSPgasjFpzHsVosjpQ99uZ0Aq
	 M1qvf1USodwx6MJ5BQQKqpWT+YugpmMEuuUHhliW1O149SmNPVfymm2Rj8FZOiqm3Y9x2
	 VM5vkwdOUMzYWJeHqlu4Dv7OulH2QszX32C7jSw7m3598VmpHI2OkyWDrOdzA7xZCTXdA
	 bNPotMjqbG9fcKRTkad/mdR8e4Cl+igvhKGctZJ5V7N7yAlhClAAmdeLO+5xkzvgkTQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794654606;
	h=DMARC-Filter:Received:Date:From:To:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=ndpdHJphGTxw6Zav2QmvJAHca0FB0X3iruS8oSVZXNE=;
	b=TLxR34bHoRqAJpYbY54+uPQNccBvOP9lU6wuQ2caanpCtQ0a2wTWWbi0VsqGlZ8fs/vE
	 XslC5y7sk+tZrfAwyKOuIoXech5yMPgh+ouJouaWZC/05LcsU6oyWKNYryUYMo21Q6VF7
	 b7fmz1NwXjRv2O4c5Ka8c26d0utLB3IT99CFIsSEgzKJifbqSaa/G0FFSqjoyGV1YLE1f
	 Xr9lQ0jN1+3Zsl8cDFl4WPN4Z+VwjfhdExxCHNRpZkrT88jFQbOJWCeJh3WGhtxVynni7
	 SpAov+2lFGsATafQ5R4cVmKsxGunHATD+zRIzgu3U5rIw+4339808LtOo7YB8yf6OmA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=makrotopia.org;
	spf=pass smtp.mailfrom=makrotopia.org;
	arc=none smtp.remote-ip=185.142.180.65
Received: from pidgin.makrotopia.org (pidgin.makrotopia.org [185.142.180.65])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DA78606A8A1;
	Sat, 14 Nov 2026 11:10:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1DA78606A8A1
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=makrotopia.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=makrotopia.org
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256:X25519MLKEM768)
	 (Exim 4.100.1)
	(envelope-from <daniel@makrotopia.org>)
	id 1xSBds-000000003yQ-3YrY;
	Sat, 14 Nov 2026 11:09:56 +0000
Date: Sat, 14 Nov 2026 11:09:53 +0000
From: Daniel Golle <daniel@makrotopia.org>
To: Detlev Casanova <detlev.casanova@collabora.com>,
	Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Shawn Lin <shawn.lin@rock-chips.com>,
	Michael Riesch <michael.riesch@collabora.com>,
	David Heidelberg <david@ixit.cz>,
	Christian Hewitt <christianshewitt@gmail.com>,
	Daniel Golle <daniel@makrotopia.org>, Marc Zyngier <maz@kernel.org>,
	linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 4/7] media: rkvdec: vdpu381: Program the read caches
Message-ID: <c052b9e59c9871315a24bbf129457b4dccbe3030.1794654074.git.daniel@makrotopia.org>
References: <cover.1794654074.git.daniel@makrotopia.org>
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
In-Reply-To: <cover.1794654074.git.daniel@makrotopia.org>

The "cache" register block of the VDPU381 and VDPU346 holds the
configuration of three read caches. The driver leaves the block
unmapped and the caches in their reset state.

The vendor kernel driver, in rkvdec2_run() and in its link mode,
permits cacheable access and read allocation with 64 byte lines and
clears all three caches before every decode. Map the block and write
the same configuration before each H.264 and HEVC run.

On the RK3568 the HEVC conformance vectors RAP_B_Bossen_2,
WPP_D_ericsson_MAIN_2, WPP_D_ericsson_MAIN10_2 and
WPP_E_ericsson_MAIN_2 and the H.264 vectors CAPM3_Sony_D, MR8_BT_B,
MR9_BT_B and NRF_MW_E decode with wrong output while the caches are
in their reset state, and pass once they are configured.

Signed-off-by: Daniel Golle <daniel@makrotopia.org>
---
v4: new patch

---
 .../rockchip/rkvdec/rkvdec-vdpu381-h264.c      |  2 ++
 .../rockchip/rkvdec/rkvdec-vdpu381-hevc.c      |  2 ++
 .../rockchip/rkvdec/rkvdec-vdpu381-regs.h      |  9 +++++++++
 .../media/platform/rockchip/rkvdec/rkvdec.c    | 18 ++++++++++++++++++
 .../media/platform/rockchip/rkvdec/rkvdec.h    |  2 ++
 5 files changed, 33 insertions(+)

diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec-vdpu381-h264.c b/drivers/media/platform/rockchip/rkvdec/rkvdec-vdpu381-h264.c
index b961fddc8583a..40db8ba3856a7 100644
--- a/drivers/media/platform/rockchip/rkvdec/rkvdec-vdpu381-h264.c
+++ b/drivers/media/platform/rockchip/rkvdec/rkvdec-vdpu381-h264.c
@@ -445,6 +445,8 @@ static int rkvdec_h264_run(struct rkvdec_ctx *ctx)
 
 	rkvdec_schedule_watchdog(rkvdec, h264_ctx->regs.common.reg032_timeout_threshold);
 
+	rkvdec_vdpu381_config_cache(rkvdec);
+
 	/* Start decoding! */
 	writel(VDPU381_DEC_E_BIT, rkvdec->regs + VDPU381_REG_DEC_E);
 
diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec-vdpu381-hevc.c b/drivers/media/platform/rockchip/rkvdec/rkvdec-vdpu381-hevc.c
index e1936e87f45be..8afb13866d0bb 100644
--- a/drivers/media/platform/rockchip/rkvdec/rkvdec-vdpu381-hevc.c
+++ b/drivers/media/platform/rockchip/rkvdec/rkvdec-vdpu381-hevc.c
@@ -617,6 +617,8 @@ static int rkvdec_hevc_run(struct rkvdec_ctx *ctx)
 
 	rkvdec_schedule_watchdog(rkvdec, hevc_ctx->regs.common.reg032_timeout_threshold);
 
+	rkvdec_vdpu381_config_cache(rkvdec);
+
 	/* Start decoding! */
 	writel(VDPU381_DEC_E_BIT, rkvdec->regs + VDPU381_REG_DEC_E);
 
diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec-vdpu381-regs.h b/drivers/media/platform/rockchip/rkvdec/rkvdec-vdpu381-regs.h
index 6da36031df2dc..b23b47217d43b 100644
--- a/drivers/media/platform/rockchip/rkvdec/rkvdec-vdpu381-regs.h
+++ b/drivers/media/platform/rockchip/rkvdec/rkvdec-vdpu381-regs.h
@@ -41,6 +41,15 @@
 #define VDPU381_STA_INT_TIMEOUT		BIT(5)
 #define VDPU381_STA_INT_SOFTRESET_RDY	BIT(9)
 
+/* base: "cache" register block */
+#define VDPU381_CACHE_COUNT		3
+#define VDPU381_REG_CACHE_CLR(i)	(0x010 + (i) * 0x40)
+#define VDPU381_CACHE_CLR		BIT(0)
+#define VDPU381_REG_CACHE_SIZE(i)	(0x01c + (i) * 0x40)
+#define VDPU381_CACHE_PERMIT_CACHEABLE_ACCESS	BIT(0)
+#define VDPU381_CACHE_PERMIT_READ_ALLOCATE	BIT(1)
+#define VDPU381_CACHE_LINE_SIZE_64_BYTES	BIT(4)
+
 /* base: OFFSET_COMMON_REGS */
 struct rkvdec_vdpu381_regs_common {
 	struct {
diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec.c b/drivers/media/platform/rockchip/rkvdec/rkvdec.c
index ba61e373b4342..5673c5205bfcd 100644
--- a/drivers/media/platform/rockchip/rkvdec/rkvdec.c
+++ b/drivers/media/platform/rockchip/rkvdec/rkvdec.c
@@ -1249,6 +1249,20 @@ void rkvdec_schedule_watchdog(struct rkvdec_dev *rkvdec, u32 timeout_threshold)
 	schedule_delayed_work(&rkvdec->watchdog_work, msecs_to_jiffies(watchdog_time));
 }
 
+void rkvdec_vdpu381_config_cache(struct rkvdec_dev *rkvdec)
+{
+	u32 cfg = VDPU381_CACHE_PERMIT_CACHEABLE_ACCESS |
+		  VDPU381_CACHE_PERMIT_READ_ALLOCATE |
+		  VDPU381_CACHE_LINE_SIZE_64_BYTES;
+	unsigned int i;
+
+	for (i = 0; i < VDPU381_CACHE_COUNT; i++)
+		writel(cfg, rkvdec->cache + VDPU381_REG_CACHE_SIZE(i));
+
+	for (i = 0; i < VDPU381_CACHE_COUNT; i++)
+		writel(VDPU381_CACHE_CLR, rkvdec->cache + VDPU381_REG_CACHE_CLR(i));
+}
+
 static void rkvdec_device_run(void *priv)
 {
 	struct rkvdec_ctx *ctx = priv;
@@ -1910,6 +1924,10 @@ static int rkvdec_probe(struct platform_device *pdev)
 		rkvdec->link = devm_platform_ioremap_resource_byname(pdev, "link");
 		if (IS_ERR(rkvdec->link))
 			return PTR_ERR(rkvdec->link);
+
+		rkvdec->cache = devm_platform_ioremap_resource_byname(pdev, "cache");
+		if (IS_ERR(rkvdec->cache))
+			return PTR_ERR(rkvdec->cache);
 	}
 
 	ret = dma_set_coherent_mask(&pdev->dev, DMA_BIT_MASK(32));
diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec.h b/drivers/media/platform/rockchip/rkvdec/rkvdec.h
index a24be6638b6b7..54e6f50c0ff9f 100644
--- a/drivers/media/platform/rockchip/rkvdec/rkvdec.h
+++ b/drivers/media/platform/rockchip/rkvdec/rkvdec.h
@@ -136,6 +136,7 @@ struct rkvdec_dev {
 	struct clk *axi_clk;
 	void __iomem *regs;
 	void __iomem *link;
+	void __iomem *cache;
 	struct mutex vdev_lock; /* serializes ioctls */
 	struct delayed_work watchdog_work;
 	struct gen_pool *sram_pool;
@@ -180,6 +181,7 @@ void rkvdec_run_preamble(struct rkvdec_ctx *ctx, struct rkvdec_run *run);
 void rkvdec_run_postamble(struct rkvdec_ctx *ctx, struct rkvdec_run *run);
 void rkvdec_memcpy_toio(void __iomem *dst, void *src, size_t len);
 void rkvdec_schedule_watchdog(struct rkvdec_dev *rkvdec, u32 timeout_threshold);
+void rkvdec_vdpu381_config_cache(struct rkvdec_dev *rkvdec);
 
 void rkvdec_quirks_disable_qos(struct rkvdec_ctx *ctx);
 
-- 
2.56.0
