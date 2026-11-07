Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794082421;
	b=G6zZvClu9W5vb7akLPYZVsaDFQfi1Cp4GlKqcQdz1jkGzQ9rejmjhEl95u/0wbSSlbVs
	 fWvcGncDs0IMlqcDXdtDOEGg2mkZXYAhDBmtkIVN3yx/ZZyWTKQ+0xdBlMsqStMc3S65D
	 MWY9uDdG0yruFHYZj7ijY6eSIctK8qbR1A7rt7s+tYcS3cZRBSlJM3h4fPQHuZ3SYDQTW
	 5I1YkBp4g2IVgCHyJXxfYnfb4YysDtjMDcnBKd1/w9cZ4CFVJjEbZsjDs5haLVOxqDssX
	 EKmqVo4down22kL5HF/bVgeTc2SB7uU4nFZuwHI2f+JausLrUrcUeyfWqnVjPFAefoA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794082421;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer;
	bh=oX/04PSyv+m9ZWIAwPwysaJo9a7lukovrgxtc3xymbg=;
	b=d4lN5h71x2G96LjzJxmg88DF7rfmvl99ABqEQYwIGk7WUpjqx0520tyftHbKpcOsaNj5
	 NFCW9KzeCIPU3w8W7e27I5sFLh29YdaGT+NhVfKev4p8xK626KsOAD7cRjBkKkjobDETU
	 vRJKG0+13rUUc41mM7y4qtRN+4Z+yOdmXKasT+jVSZmqiHsBSgLNOQZzhwT75ZAlWXLwF
	 Zt/uw4ov/TxMt//i8jEiy09p0q8jcg49DCtbB48h2mEb+SNwpxiJ8iRdhgKRh1VinBm8o
	 7+SoPvwxIsVPrAunaYwZXqB5sNd/+nkJjoWQsFA67EkQGBai1aYTo8n4jSHLtmM40fw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=gmail.com;
	spf=pass smtp.mailfrom=upstreamdata.ca;
	arc=none smtp.remote-ip=209.85.160.53
Received: from mail-oa1-f53.google.com (mail-oa1-f53.google.com [209.85.160.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03905606EEBC
	for <linux-kernel@vger.kernel.org>; Sat,  7 Nov 2026 20:13:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 03905606EEBC
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=upstreamdata.ca
Received: by mail-oa1-f53.google.com with SMTP id 586e51a60fabf-48eee44b908so4019fac.1
        for <linux-kernel@vger.kernel.org>; Sat, 07 Nov 2026 12:13:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794082420; x=1794687220;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oX/04PSyv+m9ZWIAwPwysaJo9a7lukovrgxtc3xymbg=;
        b=Mbjp0mzLorPNKgv89o60sVUD7zbc1815i5hffczej2CDxEcNdkzQn9ylx9XbpPi/6O
         Y34yxGnWO+UkZVT3uXRaC07H5N2RFyhOgdb7z0GRmkRbUrB0kWLMGp6l+D5MQvnyT4d5
         iadplsq8WSH/cghqO+DNsiJpNkJGW/2cx1vI4EtINm6fOFmZt7naUFJnrOD6UslhUC7O
         EFcVLkBCt8DklZDOsOtdnjI5qVSO72LRfNpN86Ux7mojVjBOYqZFA/ULPIBh7MfAV5xM
         wwFJUOGavu6s+OmnOOM3s2FiqCqfAJwfdk3ViYxgr8RGMtRSsk7jQFlbtNhML3XXRqbm
         Efcg==
X-Forwarded-Encrypted: i=1; AKwUvBxlVV2BPZ96OLqPppFBXEyPMwwdYL5eZqYiV8aNzu6nkP0SVnGv+SQIRtdq7DA55hveqZWa/WLRzDm5MCU=@vger.kernel.org
X-Gm-Message-State: APuU4Z/qG9oz99Glx1J05qBB8h0TZ2nc6NfCJ9PqMkRIAnlmN66qmREa
	BljbAw7cEPJ3ca0FAp09EjGI4IwetESFpuSHgB04UN9f6RZ5e5i5nV8A7a/Syij/psY=
X-Gm-Gg: AYBFou0xffEmnixOG0J2oWwCycs/o5xucBDj9y80hjKdxXQ0sVdaZYMoZv7jKRvBHDJ
	qUHORRLCFLXTCgeB7i3U+wqUgjalDWh0ZBxnnjga3U3Y6daDvfftPxYiZosBVDiazpEmlWJT0cl
	+KDN9AuWyPEBkDWIUt1hg1we7qqVVhoM5Aizpg9EAzI7VDIJpungJ1G213YnRGzSakUXRC16C+g
	g0CHTuYd+7h75xmlrFikOTb9tvVcyETspmcFz97LoB8c1/QXRMSfFBQPuE3NQ+Q2vUWgU8FK5EB
	B0iMPO4nbhsq3MgpGnPDRwBDl/rq7cdPMFgC5fYqZOTTZPohqKUVtWPN+n1b//GgNBHy9tPEaJj
	QE/ofomj5qF/KdxP1Pwi6aLQPnKfpyWiH9Oap+kL8+05bW1yk4YEcx67hh6fpRYCXqGrAXkYUX8
	+1EaZJOhm2/1BChc7GB6kbQr51za9nvBebAZ5yfe3F281gXMOss0Pz6v8RyaOMqNTJ8LVRwCM8U
	iUIwWytEVOc0ljMB9gjole5DIrNsZZQRMjVkIoSz6wCiy5bbgo4DtGZ0GpY9RIUK7XH62myM7u4
	F84DQJ3u2PWvIdUqgfOCeJTTo+zsroS+rIFaGdZmdbA04CDHp5gxC5E5F1ZP
X-Received: by 2002:a05:6870:d394:b0:4ad:8124:9235 with SMTP id 586e51a60fabf-4ad9881005emr3579674fac.9.1794082419546;
        Sat, 07 Nov 2026 12:13:39 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4ade68aa561sm226096fac.5.2026.11.07.12.13.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 12:13:38 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sat, 07 Nov 2026 03:16:40 -0700
Subject: [PATCH 43/58] mtd: rawnand: sharpsl: retain chip state across
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
Message-Id: <20261107-submit-rawnand-retained-handle-lifetime-v1-v1-43-0181ef0cc4c8@gmail.com>
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

Separate chip-select unmapping from chip storage reclamation.
Outstanding MTD references retain the scanned chip and layout metadata
after removal; new hardware operations fail once the chip is
disconnected.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/sharpsl.c | 25 ++++++++++++++++++-------
 1 file changed, 18 insertions(+), 7 deletions(-)

diff --git a/drivers/mtd/nand/raw/sharpsl.c b/drivers/mtd/nand/raw/sharpsl.c
index 4154ab74f169..1ffd2b210d20 100644
--- a/drivers/mtd/nand/raw/sharpsl.c
+++ b/drivers/mtd/nand/raw/sharpsl.c
@@ -114,6 +114,11 @@ static const struct nand_controller_ops sharpsl_ops = {
 	.attach_chip = sharpsl_attach_chip,
 };
 
+static void sharpsl_nand_release(struct nand_controller *controller)
+{
+	kfree(container_of(controller, struct sharpsl_nand, controller));
+}
+
 /*
  * Main initialization routine
  */
@@ -135,6 +140,9 @@ static int sharpsl_nand_probe(struct platform_device *pdev)
 	sharpsl = kzalloc_obj(struct sharpsl_nand);
 	if (!sharpsl)
 		return -ENOMEM;
+	err = devm_nand_controller_init(&pdev->dev, &sharpsl->controller, sharpsl_nand_release);
+	if (err)
+		return err;
 
 	r = platform_get_resource(pdev, IORESOURCE_MEM, 0);
 	if (!r) {
@@ -154,7 +162,6 @@ static int sharpsl_nand_probe(struct platform_device *pdev)
 	/* Get pointer to private data */
 	this = (struct nand_chip *)(&sharpsl->chip);
 
-	nand_controller_init(&sharpsl->controller);
 	sharpsl->controller.ops = &sharpsl_ops;
 	this->controller = &sharpsl->controller;
 
@@ -188,10 +195,16 @@ static int sharpsl_nand_probe(struct platform_device *pdev)
 	/* Register the partitions */
 	mtd->name = "sharpsl-nand";
 
-	err = mtd_device_parse_register(mtd, data->part_parsers, NULL,
-					data->partitions, data->nr_partitions);
+	err = nand_set_release(this, NULL);
 	if (err)
 		goto err_add;
+	err = mtd_device_parse_register(mtd, data->part_parsers, NULL,
+					data->partitions, data->nr_partitions);
+	if (err) {
+		nand_disconnect(this);
+		mtd_put_master(mtd);
+		goto err_scan;
+	}
 
 	/* Return happy */
 	return 0;
@@ -203,7 +216,6 @@ static int sharpsl_nand_probe(struct platform_device *pdev)
 	iounmap(sharpsl->io);
 err_ioremap:
 err_get_res:
-	kfree(sharpsl);
 	return err;
 }
 
@@ -221,12 +233,11 @@ static void sharpsl_nand_remove(struct platform_device *pdev)
 	WARN_ON(ret);
 
 	/* Release resources */
-	nand_cleanup(chip);
+	nand_disconnect(chip);
 
 	iounmap(sharpsl->io);
 
-	/* Free the driver's structure */
-	kfree(sharpsl);
+	mtd_put_master(nand_to_mtd(chip));
 }
 
 static struct platform_driver sharpsl_nand_driver = {

-- 
2.53.0

