Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794082430;
	b=TMZe16+gvJXq3WhqI96/4C/QaUHKZLJK9pUfpvGUvWi3o+n71UtVzoOBsgdT4AEiA8aD
	 /MHdbDr/k3uVb80qjnRqyWWbq681bWrzuWcgH86kXbODOUZxGI3ZEJWCJVnAOOEeb6YdY
	 aDzj9iDozbZM7F/A/+8Ck65lnJ2bXxRk/9ScoctjSyDVDW877kbDp31/+Ztug8m0DzkBG
	 t30nCU/87qa5YJe+6Q2VUPiCHpklzjYpooH4Ia4P3bPtjQpsg8AFwRlbxTpuUl4ZfqowB
	 B4jD3PYr96KFb0ZDzdRxo+dvsNE5Kz3bhopyKeqIQWxvyXxbISDBBHdaYD1cBcKLy6Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794082430;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer;
	bh=/yprO6XgRby+OSfTwdMKpRwveM3NGLFtGf1sI+fdoJg=;
	b=vFj7HuDZj7YMFxq+rF/yknim6WDPX19EvjH0geBEt36K77FYtZvdRhnqjiTcAvK49eb6
	 9umb3VRQHe+0y36NVNut4F0eCejkdxRq82iLU80RwvndoLO1cVYcKBN+ORwWaFLJgpsZF
	 6k6VpJxj4SxdG40IPTeqg8kqnt02bOHwWyzEl7woyMqv9U5kcrdFVuVib3aXqf8F+R40s
	 Pr+ZCMy760doAD257Vs/oWU4KlnReguoQ+5h1q0yAehLHiQ3aWBiBeCf+z3sCLqvecxrH
	 1m+53tnPaX1lywE+fhW6/GCUgM7IOfA6Bm0G21e2+ztDuam4r7xGyIja+gCWnWUbdOw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=gmail.com;
	spf=pass smtp.mailfrom=upstreamdata.ca;
	arc=none smtp.remote-ip=209.85.161.41
Received: from mail-oo1-f41.google.com (mail-oo1-f41.google.com [209.85.161.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6392D606A337
	for <linux-kernel@vger.kernel.org>; Sat,  7 Nov 2026 20:13:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6392D606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=upstreamdata.ca
Received: by mail-oo1-f41.google.com with SMTP id 006d021491bc7-716c0217635so30267eaf.0
        for <linux-kernel@vger.kernel.org>; Sat, 07 Nov 2026 12:13:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794082428; x=1794687228;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/yprO6XgRby+OSfTwdMKpRwveM3NGLFtGf1sI+fdoJg=;
        b=F4pJHtaF4xzcjSrsgh+ouuw4hmTGuKPSF+psJ2vCYkCDh1qjw27CgbiTrx0QB/QdbX
         wm2Csug9mOyNJuEkAr8HsYFffFM3gPKbKNVdNX4lS1Olsm5Vo08wGCzBiOywg+VihLA9
         1H1ccb/R7j6EbTIv0fDG+GMaRSRJblHwdEr4c51Z/jAIe49rvrVBZPT/or2GReSb2hwv
         CBYGwcKKJ0ftzF0XfHKmncRmxvnqz1JyrkPKmL9bZhoCFSqbBUQ3RAPgReRpT6vyb4qh
         j0iCjeeF0dhGrbGlZPB1b+/hwtSmKhUk5Fp3cqs17xw0gDXYMF7M/cxwknDV3iEEkGq7
         yEow==
X-Forwarded-Encrypted: i=1; AKwUvByAXUWUwvpLezosx0ieHRnAUq1YWRDNjgwTw05F/LSKpzlETVBg/jw33G4HZIzSmgnRBSNoR3WzISIw66A=@vger.kernel.org
X-Gm-Message-State: APuU4Z8ygsaTtnibwIa4cXoinX7qFA6PpCXw2sKWB+G/xpoFfWUams8k
	6PPjt/5+DZyvgcora1otzq1Rn586qaFN/WLY3IlLsVaNhccF4xIyPYHsJPx250Vc2Jw=
X-Gm-Gg: AYBFou0O9K0f4V8zVqjhn+qCSqUYNyLQed7oeotn//SUNXZVYE2EBNF/EzWxcBZYtQ6
	zZLStyf/4QaB1xdPGpkJSDBasfUvICDhCFWQ45gp+gLXR5xWsuRf6POtSUTZngVxSyPng8TDlSr
	HllzAilmMrtyGoL26NLoJ336w02Z8TcEWRQJwOZmCedWfZ5Zf4AoV2WdLAO/k1/YUDEjAZPA8+x
	VELBFcejOTEZ1aIATq1cjfhu3WK3Y2nxjusPBMvHHBiI4Jve72YL/Adkms8snDle0Bya4UKX80t
	oNtFwzvgCAxn22Iv1hS6X96ud6f/OG/YZK58XZQh0lOvpHFIAUOpp3gUOV6rseUKtcDKpymyLrn
	/rRxPes+OyPR2DptHT2uWSiH++Y3Z5F7lL0IsV4sLIccde7a3q7VhgNY7tZOT5MNYXI/CkaDYXs
	Bca/KLcQYjqJ91GytjOoqTcShPszZZZrPcQn+ZEEW3LPGA/nAibNC3392IcIVvf8klWeepS0C4s
	YjMCsoB7GWCTtJoyza7nDwRmH8s3uJ4nkVR2E+zlDVHLC2K3Fy0e88Awpult/UsJbMWZTWp8KZx
	pdudlHP10Jog5QUUfYdCNXIB05fy5yUXlZyHubkbkzWqDOj65p0n1k/Zc45X
X-Received: by 2002:a05:6820:c90:b0:70d:7461:973c with SMTP id 006d021491bc7-71700c853ddmr1078198eaf.17.1794082428281;
        Sat, 07 Nov 2026 12:13:48 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4ade68aa561sm226096fac.5.2026.11.07.12.13.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 12:13:47 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sat, 07 Nov 2026 03:16:43 -0700
Subject: [PATCH 46/58] mtd: rawnand: lpc32xx_slc: retain chip state across
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
Message-Id: <20261107-submit-rawnand-retained-handle-lifetime-v1-v1-46-0181ef0cc4c8@gmail.com>
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

Drain chip operations before releasing DMA and changing the controller
and write-protect signals. Retain the embedded NAND chip and controller
until the final MTD reference releases their metadata.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/lpc32xx_slc.c | 26 ++++++++++++++++++++++----
 1 file changed, 22 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/nand/raw/lpc32xx_slc.c b/drivers/mtd/nand/raw/lpc32xx_slc.c
index b4d90afa9267..85945e1dd25a 100644
--- a/drivers/mtd/nand/raw/lpc32xx_slc.c
+++ b/drivers/mtd/nand/raw/lpc32xx_slc.c
@@ -817,6 +817,12 @@ static const struct nand_controller_ops lpc32xx_nand_controller_ops = {
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
@@ -829,9 +835,14 @@ static int lpc32xx_nand_probe(struct platform_device *pdev)
 	int res;
 
 	/* Allocate memory for the device structure (and zero it) */
-	host = devm_kzalloc(&pdev->dev, sizeof(*host), GFP_KERNEL);
+	host = kzalloc_obj(*host);
 	if (!host)
 		return -ENOMEM;
+	chip = &host->nand_chip;
+	chip->controller = &chip->legacy.dummy_controller;
+	res = devm_nand_controller_init(&pdev->dev, chip->controller, lpc32xx_nand_release);
+	if (res)
+		return res;
 
 	host->io_base = devm_platform_get_and_ioremap_resource(pdev, 0, &rc);
 	if (IS_ERR(host->io_base))
@@ -915,10 +926,16 @@ static int lpc32xx_nand_probe(struct platform_device *pdev)
 		goto release_dma;
 
 	mtd->name = "nxp_lpc3220_slc";
-	res = mtd_device_register(mtd, host->ncfg->parts,
-				  host->ncfg->num_parts);
+	res = nand_set_release(chip, NULL);
 	if (res)
 		goto cleanup_nand;
+	res = mtd_device_register(mtd, host->ncfg->parts,
+				  host->ncfg->num_parts);
+	if (res) {
+		nand_disconnect(chip);
+		mtd_put_master(mtd);
+		goto release_dma;
+	}
 
 	return 0;
 
@@ -944,7 +961,7 @@ static void lpc32xx_nand_remove(struct platform_device *pdev)
 
 	ret = mtd_device_unregister(nand_to_mtd(chip));
 	WARN_ON(ret);
-	nand_cleanup(chip);
+	nand_disconnect(chip);
 	dma_release_channel(host->dma_chan);
 
 	/* Force CE high */
@@ -953,6 +970,7 @@ static void lpc32xx_nand_remove(struct platform_device *pdev)
 	writel(tmp, SLC_CTRL(host->io_base));
 
 	lpc32xx_wp_enable(host);
+	mtd_put_master(nand_to_mtd(chip));
 }
 
 static int lpc32xx_nand_resume(struct platform_device *pdev)

-- 
2.53.0

