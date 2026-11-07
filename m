Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794082433;
	b=PwsWhMI6A4jstmLYDXet4qUnJr+I6YJcUcULRM6+AIVxyqCgAxipIhKrwOuNZSCfWgTN
	 YekaOxAPwz5th6I2gDyywtxhjq5Ono8UTuL8wDbnckz/r5rgIs9gaRZFkSA4KIXnT8A0F
	 ABZZ2QBnWsFHr0UTtx9fES11jVypJDqSj/124KoAHJxXOOhhilsbf0CMk+0WcFZQQCO8l
	 wnmrBCH1Jb5bg1zb5lM9no1FLZ5qzgJuveLRfxFXL3fcMBRAiJu4e7pie5kDH3YTKhlNj
	 lMTjeoHpUTzaej/gK6g+RJ608bLqbDAO1JO671VLsn35E4+1IePGrHYgAib+asZx3Og==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794082433;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer;
	bh=z5AWpefGP8ugvxCrGcFnv88cfzYJY+wSyEyfHqNeTTo=;
	b=mg5w+qfSbiek2pZUg93qcEp1XYJCUNhCEI2JDsyJ/OyItzj9hgjxm2d5xXU3Fs+HlAsI
	 tSkh+xbwJKWSslQvGyNhGR4VyCAsP8qgmKDyQcDJrNoQl0wmmXU6T0yu838gRq5nAP++D
	 6g7pgbVcCs4DwxOqIsPZnlZuY+k9PqifiOT4b7NKzsSiRZQCkYcm6YsNUl+ez/q6MuE8j
	 hKNAuXuZKgIWAnHhJhepoCRw0mXtAhvl3idrfWp5ezzNFGxPgy2a445JeDjRRXDE7xDRC
	 faCI3zrG6AtVmdWqnlgn5KRGhzV74B6fyi2LCWBwlGJMI6T8eTosYNoIOKa7Oct7JjQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=gmail.com;
	spf=pass smtp.mailfrom=upstreamdata.ca;
	arc=none smtp.remote-ip=209.85.160.47
Received: from mail-oa1-f47.google.com (mail-oa1-f47.google.com [209.85.160.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A1BF6082BC1
	for <linux-kernel@vger.kernel.org>; Sat,  7 Nov 2026 20:13:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4A1BF6082BC1
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=upstreamdata.ca
Received: by mail-oa1-f47.google.com with SMTP id 586e51a60fabf-46556b9e02cso12751fac.1
        for <linux-kernel@vger.kernel.org>; Sat, 07 Nov 2026 12:13:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794082431; x=1794687231;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=z5AWpefGP8ugvxCrGcFnv88cfzYJY+wSyEyfHqNeTTo=;
        b=Vh739m/0JNy2xNeipCB1XRtRdFEP9aEm/ShECDpoyjgFeVkdLPxPHI0x/Pdsc2cXqn
         p+HcElqucQ3MQlvjtRzZCQd4S+HW+CrWcSM5du/0EYHoBDjuxj7BK+TJgd61pdZdHt/Q
         ArQr1iAMBN0UmSoKHp/ZlxrL3pWsXBfOfqZBTIe7xjmI8c8PN87ZHBaX9kmejGZTmffp
         28r3bpEiJt5+CwQNv8pY7/Fqd4QSPXPfsTC9lKLDW4no5oAXCnFJl6Qj7PA38AvBu5H9
         vaL1BbxzJKvOLROjQ+qhAO7vBeM97yuOEbqgHa5PtS3xtWltgs8Rqm6WBck00Iu3b0QK
         7Ibg==
X-Forwarded-Encrypted: i=1; AL+hErHoY5F+o+pHPWzwdeEQzvOH4tN9zde9k45KIrJNPmGqaa0IJysnphKUs/3JIbGEhuY1YschLCGegwemsWE=@vger.kernel.org
X-Gm-Message-State: APuU4Z9rfDKRJrOX2YSPEszef94Y9+XkI1ebOCw56+Ow8hM3lyBGtmdD
	Kd6ZhHW4Sde2DlJgdoD1G+EHfKwHCVpF2i5bjNpa8mRJYH9Wk94ZriiYmaaVnhL1BOo=
X-Gm-Gg: AYBFou2v7PjmuQjJZ3Oo0pnSHDgMLvG82Q739WadnmqRLslDN35476hgKSYYapySJST
	lIHo7Qixczn77XWYEIcZcLJGu2yiUBYgmSBzP2lAw+gGrrTgnQ2b9/z/efGhUdvgg7c7EWm/H54
	Vo1lAfYAwS3Tv4MBL1b0AQK2Qmurfivs+DfvptT9+D5P4PD8FTlONu2aC+3s+FaKnvPryo8dxqE
	K0cd7D+DN6xlUlzOeBBdEX0YIX4Zuk9DHYBVMrv0nxxvS3V0ZLlLbIF8/xZuqitvT7O5gaYvLdg
	K/aGgfv1fxNzxpcAXb5Y+tCwAS2AfSL7nXWxCsN6O2ARz9yjkenQ27NicTo0vDBnT0KeLDVMjv4
	euX1y54JuRtPlIbpGxD13wV4G+tfPn3DUyvLAOPq/3m04mQ6o/UXeTftscJWlhbiy31/x77bm32
	8y21O4nWuNyxjQEexcqRANFk2eGLSqfASGNHhXwAtRjT73atO6DTkcYhbSREulG8K1RfxFvFFOc
	UKRWsCcc6BnYTiW4uqEBrxzrVTD9COTj58DYXWAX8jWo+trKpTq07UEvWqtw4Dkj4PtcXV7QJD0
	n/6EVD0nkKiN0dJkt1ieJ7L12bdWBKlCmIbbb/R/eHHDiqHSxCfVVM6U5cjRSpIIfH+ZAFK1x2/
	k7vNB7Q==
X-Received: by 2002:a05:6870:2418:b0:4a7:20e8:8d1c with SMTP id 586e51a60fabf-4adc106e03bmr1313869fac.27.1794082431205;
        Sat, 07 Nov 2026 12:13:51 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4ade68aa561sm226096fac.5.2026.11.07.12.13.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 12:13:50 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sat, 07 Nov 2026 03:16:44 -0700
Subject: [PATCH 47/58] mtd: rawnand: lpc32xx_mlc: retain chip state across
 removal
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261107-submit-rawnand-retained-handle-lifetime-v1-v1-47-0181ef0cc4c8@gmail.com>
References: <20261107-submit-rawnand-retained-handle-lifetime-v1-v1-0-0181ef0cc4c8@gmail.com>
In-Reply-To: <20261107-submit-rawnand-retained-handle-lifetime-v1-v1-0-0181ef0cc4c8@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
  Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
  Brian Norris <computersforpeace@gmail.com>,
  Boris Brezillon <bbrezillon@kernel.org>,
  Arseniy Krasnov <AVKrasnov@sberdevices.ru>, Chen-Yu Tsai <wens@kernel.org>,
  Jernej Skrabec <jernej.skrabec@gmail.com>,
  Samuel Holland <samuel@sholland.org>, Thomas Gleixner <tglx@kernel.org>,
  Vitaly Wool <vitalywool@gmail.com>, David Woodhouse <dwmw2@infradead.org>,
  Russell King <rmk+kernel@arm.linux.org.uk>,
  David Woodhouse <David.Woodhouse@intel.com>,
  Mike Rapoport <rppt@kernel.org>,
  Maxime Coquelin <mcoquelin.stm32@gmail.com>,
  Alexandre Torgue <alexandre.torgue@foss.st.com>,
  Christophe Kerello <christophe.kerello@st.com>,
  Jason Roberts <jason.e.roberts@intel.com>,
  Michal Simek <michal.simek@amd.com>,
  Boris Brezillon <boris.brezillon@collabora.com>,
  Mason Yang <masonccyang@mxic.com.tw>,
  Ramuthevar Vadivel Murugan <vadivel.muruganx.ramuthevar@linux.intel.com>,
  Stefan Agner <stefan@agner.ch>, Lucas Stach <dev@lynxeye.de>,
  Thierry Reding <thierry.reding@kernel.org>,
  Jonathan Hunter <jonathanh@nvidia.com>, Dmitry Osipenko <digetx@gmail.com>,
  Matthias Brugger <matthias.bgg@gmail.com>,
  AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
  Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>,
  Heiko Stuebner <heiko@sntech.de>, Yifeng Zhao <yifeng.zhao@rock-chips.com>,
  Nicolas Ferre <nicolas.ferre@microchip.com>,
  Alexandre Belloni <alexandre.belloni@bootlin.com>,
  Claudiu Beznea <claudiu.beznea@tuxon.dev>,
  Keguang Zhang <keguang.zhang@gmail.com>, Jacky Huang <ychuang3@nuvoton.com>,
  Shan-Chun Hung <schung@nuvoton.com>, Frank Li <Frank.Li@nxp.com>,
  Sascha Hauer <s.hauer@pengutronix.de>,
  Pengutronix Kernel Team <kernel@pengutronix.de>,
  Fabio Estevam <festevam@gmail.com>, Han Xu <han.xu@nxp.com>,
  Liang Yang <liang.yang@amlogic.com>,
  Neil Armstrong <neil.armstrong@linaro.org>,
  Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
  Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
  Manivannan Sadhasivam <mani@kernel.org>,
  Kamal Dasu <kamal.dasu@broadcom.com>,  Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>,  Vladimir Zapolskiy <vz@mleia.com>,
  Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>,
  Paul Cercueil <paul@crapouillou.net>,
  Harvey Hunt <harveyhuntnexus@gmail.com>,
  Maxim Levitsky <maximlevitsky@gmail.com>, Michael Walle <michael@walle.cc>,
  Srinivas Kandagatla <srini@kernel.org>
Cc: Tze Yee Ng <tze.yee.ng@altera.com>, linux-mtd@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-tegra@vger.kernel.org, 
 linux-mediatek@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-mips@vger.kernel.org, imx@lists.linux.dev, 
 linux-renesas-soc@vger.kernel.org, linux-amlogic@lists.infradead.org, 
 linux-arm-msm@vger.kernel.org, James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2

Drain chip operations before releasing interrupts, DMA and controller
resources. Retain the embedded NAND chip and controller until the final
MTD reference releases their metadata.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/lpc32xx_mlc.c | 26 ++++++++++++++++++++++----
 1 file changed, 22 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/nand/raw/lpc32xx_mlc.c b/drivers/mtd/nand/raw/lpc32xx_mlc.c
index 8436015edcb4..93ee8cfc0345 100644
--- a/drivers/mtd/nand/raw/lpc32xx_mlc.c
+++ b/drivers/mtd/nand/raw/lpc32xx_mlc.c
@@ -675,6 +675,12 @@ static const struct nand_controller_ops lpc32xx_nand_controller_ops = {
 	.attach_chip = lpc32xx_nand_attach_chip,
 };
 
+static void lpc32xx_nand_release(struct nand_controller *controller)
+{
+	kfree(container_of(controller, struct lpc32xx_nand_host,
+			   nand_chip.legacy.dummy_controller));
+}
+
 /*
  * Probe for NAND controller
  */
@@ -687,9 +693,14 @@ static int lpc32xx_nand_probe(struct platform_device *pdev)
 	int res;
 
 	/* Allocate memory for the device structure (and zero it) */
-	host = devm_kzalloc(&pdev->dev, sizeof(*host), GFP_KERNEL);
+	host = kzalloc_obj(*host);
 	if (!host)
 		return -ENOMEM;
+	nand_chip = &host->nand_chip;
+	nand_chip->controller = &nand_chip->legacy.dummy_controller;
+	res = devm_nand_controller_init(&pdev->dev, nand_chip->controller, lpc32xx_nand_release);
+	if (res)
+		return res;
 
 	host->pdev = pdev;
 
@@ -794,10 +805,16 @@ static int lpc32xx_nand_probe(struct platform_device *pdev)
 
 	mtd->name = DRV_NAME;
 
-	res = mtd_device_register(mtd, host->ncfg->parts,
-				  host->ncfg->num_parts);
+	res = nand_set_release(nand_chip, NULL);
 	if (res)
 		goto cleanup_nand;
+	res = mtd_device_register(mtd, host->ncfg->parts,
+				  host->ncfg->num_parts);
+	if (res) {
+		nand_disconnect(nand_chip);
+		mtd_put_master(mtd);
+		goto free_irq;
+	}
 
 	return 0;
 
@@ -830,7 +847,7 @@ static void lpc32xx_nand_remove(struct platform_device *pdev)
 
 	ret = mtd_device_unregister(nand_to_mtd(chip));
 	WARN_ON(ret);
-	nand_cleanup(chip);
+	nand_disconnect(chip);
 
 	free_irq(host->irq, host);
 	if (use_dma)
@@ -841,6 +858,7 @@ static void lpc32xx_nand_remove(struct platform_device *pdev)
 
 	lpc32xx_wp_enable(host);
 	gpiod_put(host->wp_gpio);
+	mtd_put_master(nand_to_mtd(chip));
 }
 
 static int lpc32xx_nand_resume(struct platform_device *pdev)

-- 
2.53.0

