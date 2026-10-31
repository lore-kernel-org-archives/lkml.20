Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793477392;
	b=0eKRo8jd+qdhijL2+HFx0JymjzjGzzwDmF15DdNd7Krc6EhjEUEtn6v4Ift+7N/8mvCY
	 26xlGm7faZYG5ZsgR86CJpe8ytGp7/uglPd/pBVUvBp4Z25/K6tu3BlS03s/uljC1j5dc
	 xhztXCEUnXVtfhc8R8rcbZ/YYApUsY5p7KlHtqB3vriqtAJ5QiBHs6wO/llILfvLE0BiX
	 R3NPyYGvJtfPlhFwkYYIKMvNrrhjHv7YGLt1LW87tRNQON9DPvrgtyW3tRdZWCuj3h9y0
	 X5kMbkhCAySxbMUG7fsiun2rPHSX3Qq4+ieLjksL0rLQ3GU/JWppFs1nyJUHtgxtvUg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793477392;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=lLEWRWhxY0X5Qhcbz/EtLWHCv/8fQ6WLPeE028PNRtE=;
	b=ZzpXcCR2jL/6i3NDCPHe0o7UyYopl6lXJti1hMMmd3MhfP13niY2E8BHXjy+VZDtQk1e
	 LWzlJeDedzSs72nsmrcRKlMCu9Rvul9FlwGkKDbxPxbyRhmED9MgX1oZrlZ793J4cI8pw
	 Hfc1NAur+Ouph0TQscaeIJ5i6WPVsihiVN//+mcTLBhycOxi2eAdA+ZRas7eLkBggJtXz
	 1MtHVklvrXzT7FTW+A3AJMiYWDdnoB3O+GpeYwleSiU3IaKWDmuYWmg8YywEJwZhVYBP2
	 XOSJUiNwPEwkMB6aluXx9lPBgERP3VJHsB8Xkd+05IzTv7mn3HGODPc1gF7J9bi+yug==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CbtMv+6t;
	arc=none smtp.remote-ip=209.85.214.178
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94D50606A31A
	for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 20:09:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 94D50606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CbtMv+6t
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2e5fb79ce82so11521995ad.0
        for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 13:09:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793477391; x=1794082191; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=lLEWRWhxY0X5Qhcbz/EtLWHCv/8fQ6WLPeE028PNRtE=;
        b=CbtMv+6tVi+YwbO05VX4MX3xi17SxPRBMehNfhFsfSd5w5pGlIPYbV2XiMwoNAwOeA
         XVTxnlDZzPcDuacdcrm1zgvIrvsHJDqJH7BgrwjSJFMPKtJRaxt9huS4QGMPd+DoIGDh
         90K5VVSoBRXd8qNBcfxFuM9G0eai3WhF4VBVtYmYxqSBHyRfAa2ACmonrLG/zsEwOQoE
         ArtcUXG/HP1vWz6VMs+Skir18o2+SehT1oOwgWjUXktxg2f2Hgd/d4hCbS5qvMuHxMvL
         AbNj930SsDWHtx/YaQdZaAiZ66lonq4hnJBaN5qgVJfyzZ8B//j0Bqfuf++vGZ/MGhM8
         hQQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793477391; x=1794082191;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lLEWRWhxY0X5Qhcbz/EtLWHCv/8fQ6WLPeE028PNRtE=;
        b=Ou89p6g4IW+xvHoCPiGR7CUnk/DUtJSM1AKdKFuRsMunek75Ewk/Mmelh9taYMbjfL
         hKh6tEll9Rnz1lfZ8UsL5hLylZ1M1AdXlRTV+axnCzBqgJw/99a8sDdp2mofh51kRkmY
         rvc0WMTulMvYmpLuA6ecdUzQjfey9DZ2B5Kf5hfWnmzkwZcUOescTqpHxqcGK90qx6M0
         Hrp3DEOBTRiNaASDA5TrnkgMdGnMc1S7J3fTv8YOl5FmLzMQ7KCP4r1znf/MBlB+yQAu
         1w1yA6sEHGCzubQGUn2w5hrbBHX2iyUewO3xD49ggjkWq1f3CInMJI5FLcgHs06VSfCx
         y7hw==
X-Forwarded-Encrypted: i=1; AKwUvBwJfC/WbPfXzxM8qbIV3uMVlNewZNP2JBcU9eGjPV9yjyKzNjAtJ016ugR86CTz0Pi2No8d3OUo/80kWKc=@vger.kernel.org
X-Gm-Message-State: AFq9FYKRM3ppRu97rptfxK/fRF0/GBav8GHZu7w5zWJ65asIMg7/bv9l
	jH+PxkRikE+/Qu7IDSY96DwPA3DMY2icNXYckramYO7U//1Yl1iKUqE/
X-Gm-Gg: AYBFou0rjHn3DTq5GN6H5TZbfgDjDPDQriUbwFTBG/910hshLxoqHn/BA9QxmxjRwG0
	EKn9aDSeSfgxkQuj+AXAbDiu+WvdSeGHFVDHum6AsIwbSi5xTo3esd5SsJyjUjrl0g1zNwQ/z17
	3dYsAVS8Fip+k4ZWKDYERZ4Q4GmEyU+KNReOiIqnneJrwTpMMb/oZ4ZRo54DN5fboB3g/qyEoGn
	X4/VbsRBOSFOQ9Blg3nOCyoAVEIOriVJQkupDb76C8M0xAq/Q2YIy6GuBnydZTfliVtc0p8tEaq
	tenU3HCkZGzFQ+/19L3VXOLrMu1gGpwCjeh3k6hyE4wBZfuShNlAdSJzEq5G/73TeoOGfHnrcVJ
	0D7sfIWmYW99nhudw1aJZ5361De90Vmy5KtCE8HsZQ7Ofhw9gbS+HLgEbHBTdJI+Ufzd437o4F1
	Nis9yNSrW7hHmKJ7clo9DpsZ+Dx2V6N8C1/g8z6/bgAt212fUH7uFXbG/B+hS8EU58rlT4wG+4f
	Ra2cPL9uMTCuRTrF/q6j2bTY6eXVNgY9g2KPh+Xfrr70fnP9BNJ+1Cx6LwyLS6lrbSCzm6yW9gA
	nGYy3PCXF2O4a4eHwasui6hts5Q9eL5TzugBMAQeuDFmwSyPUR8=
X-Received: by 2002:a17:903:1a08:b0:2e5:54b9:6b37 with SMTP id d9443c01a7336-2eb364bbb41mr60052995ad.28.1793477390781;
        Sat, 31 Oct 2026 13:09:50 -0700 (PDT)
Received: from ArchLinux-E5-Server.lan ([240e:3a2:ac01:77c0:1:3024:80c:fbbb])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eb38e9633fsm16660465ad.0.2026.10.31.13.09.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Oct 2026 13:09:49 -0700 (PDT)
From: ZHENPENG YUAN <yuanzhenpeng210@gmail.com>
To: linux-mmc@vger.kernel.org,
	ulfh@kernel.org
Cc: martin.blumenstingl@googlemail.com,
	neil.armstrong@linaro.org,
	khilman@baylibre.com,
	jbrunet@baylibre.com,
	linux-amlogic@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	ZHENPENG YUAN <yuanzhenpeng210@gmail.com>
Subject: [RFC PATCH] mmc: meson-mx-sdhc: add DMA bounce buffer support
Date: Sun,  1 Nov 2026 04:09:25 +0800
Message-ID: <20261031200925.3364-1-yuanzhenpeng210@gmail.com>
X-Mailer: git-send-email 2.56.0
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

The Meson MX SDHC controller uses a single DMA address for each
transfer. Since the driver leaves max_segs at the MMC core default
of 1, large I/O requests are split into single-segment requests,
typically 4 KiB each.

On an Amlogic S805, this limits eMMC sequential read throughput
to approximately 15 MiB/s despite using HS200 timing.

Add a 128 KiB DMA bounce buffer for multi-segment requests and
advertise up to 64 scatterlist segments. Single-segment requests
continue to use direct DMA. If buffer allocation fails, fall back
to the original single-segment limit.

Testing on a Xunlei OneCloud (Meson8b, Samsung 8GME4R eMMC)
running Linux 7.3.1:

  Block size       Before       After
  4 KiB            14.47        14.69 MiB/s
  64 KiB           15.06        63.21 MiB/s
  128 KiB          15.08        75.13 MiB/s
  1 MiB            15.07        75.93 MiB/s

For a 128 MiB sequential read, block requests decreased from
32768 to 1024.

Direct I/O SHA256 readback verification and fio CRC32C write
verification passed. No MMC errors were observed.

Assisted-by: LLM
Signed-off-by: ZHENPENG YUAN <yuanzhenpeng210@gmail.com>
---
 drivers/mmc/host/meson-mx-sdhc-mmc.c | 165 ++++++++++++++++++++++++---
 1 file changed, 149 insertions(+), 16 deletions(-)

diff --git a/drivers/mmc/host/meson-mx-sdhc-mmc.c b/drivers/mmc/host/meson-mx-sdhc-mmc.c
index fb49ea712..c62583a80 100644
--- a/drivers/mmc/host/meson-mx-sdhc-mmc.c
+++ b/drivers/mmc/host/meson-mx-sdhc-mmc.c
@@ -16,6 +16,7 @@
 #include <linux/property.h>
 #include <linux/regmap.h>
 #include <linux/regulator/consumer.h>
+#include <linux/scatterlist.h>
 #include <linux/types.h>
 
 #include <linux/mmc/host.h>
@@ -29,6 +30,12 @@
 #define MESON_SDHC_MAX_BLK_SIZE					512
 #define MESON_SDHC_NUM_TUNING_TRIES				10
 
+/*
+ * A 128 KiB request spans at most 33 pages when it is not page aligned.
+ * The extra entries give the block layer room to merge a full request.
+ */
+#define MESON_SDHC_MAX_SEGS					64
+
 #define MESON_SDHC_WAIT_CMD_READY_SLEEP_US			1
 #define MESON_SDHC_WAIT_CMD_READY_TIMEOUT_US			100000
 #define MESON_SDHC_WAIT_BEFORE_SEND_SLEEP_US			1
@@ -48,6 +55,17 @@ struct meson_mx_sdhc_host {
 	struct mmc_command		*cmd;
 	int				error;
 
+	/*
+	 * The controller has a single DMA address register, so requests that
+	 * are not physically contiguous have to be bounced through this
+	 * buffer.
+	 */
+	void				*bounce_buf;
+	size_t				bounce_buf_size;
+	dma_addr_t			dma_addr;
+	unsigned int			dma_len;
+	bool				dma_bounce;
+
 	struct regmap			*regmap;
 
 	struct clk			*pclk;
@@ -220,8 +238,7 @@ static void meson_mx_sdhc_start_cmd(struct mmc_host *mmc,
 			   FIELD_PREP(MESON_SDHC_CTRL_PACK_LEN, pack_len));
 
 	if (cmd->data)
-		regmap_write(host->regmap, MESON_SDHC_ADDR,
-			     sg_dma_address(cmd->data->sg));
+		regmap_write(host->regmap, MESON_SDHC_ADDR, host->dma_addr);
 
 	meson_mx_sdhc_wait_cmd_ready(mmc);
 
@@ -362,32 +379,97 @@ static void meson_mx_sdhc_set_ios(struct mmc_host *mmc, struct mmc_ios *ios)
 
 static int meson_mx_sdhc_map_dma(struct mmc_host *mmc, struct mmc_request *mrq)
 {
+	struct meson_mx_sdhc_host *host = mmc_priv(mmc);
 	struct mmc_data *data = mrq->data;
-	unsigned int dma_len;
+	enum dma_data_direction dir;
+	struct scatterlist *sg;
+	unsigned int len, total_len;
+	int i, nents;
 
 	if (!data)
 		return 0;
 
-	dma_len = dma_map_sg(mmc_dev(mmc), data->sg, data->sg_len,
-			     mmc_get_dma_dir(data));
-	if (!dma_len) {
-		dev_err(mmc_dev(mmc), "dma_map_sg failed\n");
+	dir = mmc_get_dma_dir(data);
+	len = data->blocks * data->blksz;
+	host->dma_len = len;
+	host->dma_bounce = false;
+
+	/*
+	 * A request that consists of a single scatterlist entry is already
+	 * contiguous from the controller's point of view and can be
+	 * programmed directly.  This is also the only case where transfers
+	 * larger than the advertised max_req_size may occur (SDIO).
+	 */
+	if (data->sg_len == 1 && data->sg->length >= len) {
+		nents = dma_map_sg(mmc_dev(mmc), data->sg, data->sg_len, dir);
+		if (!nents) {
+			dev_err(mmc_dev(mmc), "dma_map_sg failed\n");
+			return -ENOMEM;
+		}
+
+		host->dma_addr = sg_dma_address(data->sg);
+		return 0;
+	}
+
+	total_len = 0;
+	for_each_sg(data->sg, sg, data->sg_len, i)
+		total_len += sg->length;
+
+	if (!host->bounce_buf || len > host->bounce_buf_size ||
+	    total_len < len) {
+		dev_err(mmc_dev(mmc),
+			"cannot DMA %u bytes in %u segments\n",
+			len, data->sg_len);
+		return -EINVAL;
+	}
+
+	if (dir == DMA_TO_DEVICE) {
+		if (sg_copy_to_buffer(data->sg, data->sg_len, host->bounce_buf,
+				      len) != len) {
+			dev_err(mmc_dev(mmc),
+				"failed to copy data into the bounce buffer\n");
+			return -EIO;
+		}
+	}
+
+	host->dma_addr = dma_map_single(mmc_dev(mmc), host->bounce_buf, len,
+					dir);
+	if (dma_mapping_error(mmc_dev(mmc), host->dma_addr)) {
+		dev_err(mmc_dev(mmc), "dma_map_single failed\n");
 		return -ENOMEM;
 	}
 
+	host->dma_bounce = true;
+
 	return 0;
 }
 
+static void meson_mx_sdhc_unmap_dma(struct meson_mx_sdhc_host *host,
+				    struct mmc_data *data)
+{
+	struct device *dev = mmc_dev(host->mmc);
+
+	if (host->dma_bounce) {
+		dma_unmap_single(dev, host->dma_addr, host->dma_len,
+				 mmc_get_dma_dir(data));
+		host->dma_bounce = false;
+	} else {
+		dma_unmap_sg(dev, data->sg, data->sg_len,
+			     mmc_get_dma_dir(data));
+	}
+}
+
 static void meson_mx_sdhc_request(struct mmc_host *mmc, struct mmc_request *mrq)
 {
 	struct meson_mx_sdhc_host *host = mmc_priv(mmc);
 	struct mmc_command *cmd = mrq->cmd;
+	int ret = 0;
 
 	if (!host->error)
-		host->error = meson_mx_sdhc_map_dma(mmc, mrq);
+		ret = meson_mx_sdhc_map_dma(mmc, mrq);
 
-	if (host->error) {
-		cmd->error = host->error;
+	if (host->error || ret) {
+		cmd->error = host->error ? host->error : ret;
 		mmc_request_done(mmc, mrq);
 		return;
 	}
@@ -596,11 +678,6 @@ static irqreturn_t meson_mx_sdhc_irq_thread(int irq, void *irq_data)
 			regmap_update_bits(host->regmap, MESON_SDHC_PDMA, val,
 					   val);
 		}
-
-		dma_unmap_sg(mmc_dev(host->mmc), cmd->data->sg,
-			     cmd->data->sg_len, mmc_get_dma_dir(cmd->data));
-
-		cmd->data->bytes_xfered = cmd->data->blksz * cmd->data->blocks;
 	}
 
 	meson_mx_sdhc_wait_cmd_ready(host->mmc);
@@ -625,6 +702,40 @@ static irqreturn_t meson_mx_sdhc_irq_thread(int irq, void *irq_data)
 		 */
 		meson_mx_sdhc_clear_fifo(host->mmc);
 
+	if (cmd->data) {
+		struct mmc_data *data = cmd->data;
+		size_t len = data->blksz * data->blocks;
+		bool bounced = host->dma_bounce;
+
+		/*
+		 * Unmap the data after the controller has been quiesced so
+		 * that neither the reset nor the FIFO flush can race with an
+		 * ongoing DMA transfer.  dma_unmap_single() (for bounced
+		 * reads) also invalidates the CPU caches, so the copy below
+		 * sees the data written by the controller.
+		 */
+		meson_mx_sdhc_unmap_dma(host, data);
+
+		if (!data->error) {
+			if (bounced && data->flags & MMC_DATA_READ) {
+				size_t copied;
+
+				copied = sg_copy_from_buffer(data->sg,
+							     data->sg_len,
+							     host->bounce_buf,
+							     len);
+				if (copied != len) {
+					dev_err(mmc_dev(host->mmc),
+						"failed to copy data from the bounce buffer\n");
+					data->error = -EIO;
+				}
+			}
+
+			if (!data->error)
+				data->bytes_xfered = len;
+		}
+	}
+
 	meson_mx_sdhc_request_done(host);
 
 	return IRQ_HANDLED;
@@ -813,8 +924,17 @@ static int meson_mx_sdhc_probe(struct platform_device *pdev)
 
 	mmc->max_req_size = SZ_128K;
 	mmc->max_seg_size = mmc->max_req_size;
-	mmc->max_blk_count = FIELD_GET(MESON_SDHC_SEND_TOTAL_PACK, ~0);
 	mmc->max_blk_size = MESON_SDHC_MAX_BLK_SIZE;
+	/*
+	 * The controller has a single DMA address register.  Allowing the
+	 * block layer to merge more segments is only safe because requests
+	 * consisting of multiple segments are bounced through a contiguous
+	 * buffer.  Keep every request within max_req_size so that it always
+	 * fits into that buffer; SDIO uses max_blk_count to split transfers
+	 * as well.
+	 */
+	mmc->max_blk_count = mmc->max_req_size / mmc->max_blk_size;
+	mmc->max_segs = MESON_SDHC_MAX_SEGS;
 	mmc->max_busy_timeout = 30 * MSEC_PER_SEC;
 	mmc->f_min = clk_round_rate(host->sd_clk, 1);
 	mmc->f_max = clk_round_rate(host->sd_clk, ULONG_MAX);
@@ -823,6 +943,19 @@ static int meson_mx_sdhc_probe(struct platform_device *pdev)
 	mmc->caps |= MMC_CAP_WAIT_WHILE_BUSY | MMC_CAP_HW_RESET;
 	mmc->ops = &meson_mx_sdhc_ops;
 
+	host->bounce_buf = devm_kmalloc(dev, mmc->max_req_size, GFP_KERNEL);
+	if (host->bounce_buf) {
+		host->bounce_buf_size = mmc->max_req_size;
+	} else {
+		/*
+		 * Without the bounce buffer only physically contiguous
+		 * requests can be handled, so fall back to the old limit.
+		 */
+		mmc->max_segs = 1;
+		dev_warn(dev,
+			 "failed to allocate the DMA bounce buffer, using single-segment transfers\n");
+	}
+
 	ret = mmc_of_parse(mmc);
 	if (ret)
 		goto err_disable_pclk;
-- 
2.56.0

