Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794082392;
	b=QezyPrWnikabiKoR89ztiYSiO4RWRQFsCdtNz3M41WMZIT9ker3UWCZN/NIpu2DkFKjC
	 jWEbZOYuAkeH8TPfnH5oQHPsSBCYLPBgFYMdYirzzmLMK9NIsmf3hmVmQmnQLnxn6G94x
	 t71ZpAS7DrbszsT/mNXe1GNg/C/pyR+w4fx9F6McZdoy6IkvUF1ge996uqwbnk2IaG+vt
	 sXmRn5e5DjUBPDZXs7PnKyQPLHKrKvlq9QWtcJ1L/hGa7tbzTcGVO2LReDdtyJD+TFcfy
	 w3O5McOB3GS2CegsBbIjgc+k59zbXe2RWZhG6gl7eUjSG4UeajwpftRI2bd0VAz5iSw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794082392;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer;
	bh=VloKSurmIYFY1UFfVkwmy64gkSHDogGYCar5RGOv9NU=;
	b=mbnTJZz7b8rokXv4wY+5991xE8S92AH4G4TyRl3w4r5EWP9yHeL1Fg+g49fF5u9fE5Nr
	 +eX/gGEdJjfbJecv1YYjIIB9izE47iO3y2ehgf0pJW2FpoFMfKRpgVhFh1GNFYawCfX7k
	 xuQGl/hgdK/bCbv5Lb0FsRu/SSHGSEZMy3Wqh4OXAvmbu7lbtuq2oEuEl4JO1sd+cIpt3
	 GQElEZlYzGMfEya2kBVQYJ6KV78FDbPPOiNIeFtPGPAfHbLugwPfJMekjJYPqK2VGfvo8
	 /n7gdBqFGnCnYQjxaTi4J3XjzJd6Ebx5pjnTBP1ExSmTm+GtvWCvIAwwOPU7ktVsdBQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=gmail.com;
	spf=pass smtp.mailfrom=upstreamdata.ca;
	arc=none smtp.remote-ip=209.85.161.42
Received: from mail-oo1-f42.google.com (mail-oo1-f42.google.com [209.85.161.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC746606D835
	for <linux-kernel@vger.kernel.org>; Sat,  7 Nov 2026 20:13:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AC746606D835
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=upstreamdata.ca
Received: by mail-oo1-f42.google.com with SMTP id 006d021491bc7-716ea2598eeso980389eaf.0
        for <linux-kernel@vger.kernel.org>; Sat, 07 Nov 2026 12:13:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794082390; x=1794687190;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VloKSurmIYFY1UFfVkwmy64gkSHDogGYCar5RGOv9NU=;
        b=zCd3ZsueZ3xRlcMwoZ9olzsiPdEjLrLA/xM4Br6jM3cdv5hjHul8G3kVp8grQONsfH
         AGAOcfyLrrrXqFJZ1DgAtbU5B/tu4p+puCvJqNxILBtr+irtuysh5lg9gnbx1D1/SqbW
         bdwtTxcFn1JiNL9J/Fl8mGpSbYx8SyeKPY/0uIrVYLmL/U7hUl4Sev1wKhTXT8d86Pbp
         xLcNfo6NhCx7NJGmj2ObGaeDHG2otXWre+Ye3KK7COxnQ0NErQ1GjUs2ODXLtMTTEJXC
         jTVi5rGuC1W+XnBqdSmpO8lu/qgw0Zf2R2MqFP+IBPGppE4HsJTtBIfu+kbeSemQKR6w
         vFYQ==
X-Forwarded-Encrypted: i=1; AKwUvBxUz5I4iuOcrIC7AwR+fnESX0EesdQ2UZB1cV10bZsRr8fTJbE4R0iGnQp0oSy2qvniEfzswz8fx04GHj4=@vger.kernel.org
X-Gm-Message-State: APuU4Z/aDaYoP3PMwbl/01yYLMugTRNY8ROGgjIDilvWa8KkAOIa5drW
	oUiniyxqUGVwlbPtdUiaJrn2PF4T+iYr8kKMJP/Qpx9Pv02QWPaRI0Mrrx+J9xt5ENs=
X-Gm-Gg: AYBFou3A+upLgaO9+wxJNu4eYrOvZLCviYQGqTqN53Uh5uVTLTD/DCCWyiZ/NMkkfUI
	yeDP3058ugYZ1iaASDaaG4pJ6395GYOrrzdQpd8tgNQ71jyHjvjHjoxa1GNji0kJiOSQ0TRYznG
	lgHqDRRn/9LqE5fYcASQzHMAHP2cXo9ldQFmzpiqlfbhOkQg6JHV0yfJuXuQK55lfy5RWzpLvtJ
	eTyOoKNsywGJWFQrPSkjCy8tfATs/M7SnqN8+2W77iqlePJ/UAj6LZcEFttMhp5xXUPEUDWMbVO
	dQPEdiR4QFPh9gjcaK9fu82Mk/kKhjanmQDQcrp0yj8wpL0UCQNEjPhhGVEmeud1sj0ioRQCb/Y
	Gx2LsbSGH7UTp9WV7z/sh4iwXGOyRud1YYN8mJ+rVtfdWQkrbZ06uJs3sWWfenV3io8mLJZZ4+n
	uoARQHYiywrhtyxWtY2LW3g7tVcpOs6fqH5gLRi2ez+Z+jp0E2E/kuRtFpceW6GJNJddS5/ANcw
	Hy/dbF5YK2ccUXgp9mzcyn7yILQ949VkZT6IG/hmngIw+8R4FqzzuY37dEzTaSBCsVW+K/LXLGf
	MoEOIvaYrc5O6cFuJWYpz7fQ3TNSypF+2WTiaIup/lFtFrbSP0kjXD6dvXQk
X-Received: by 2002:a05:6820:838a:b0:716:c53c:3f4b with SMTP id 006d021491bc7-7170f35914amr8104eaf.88.1794082390463;
        Sat, 07 Nov 2026 12:13:10 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4ade68aa561sm226096fac.5.2026.11.07.12.13.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 12:13:09 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sat, 07 Nov 2026 03:16:30 -0700
Subject: [PATCH 33/58] mtd: rawnand: gpmi: retain open-handle state on
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
Message-Id: <20261107-submit-rawnand-retained-handle-lifetime-v1-v1-33-0181ef0cc4c8@gmail.com>
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

Keep chip metadata and controller storage alive until the final MTD
reference is released. Unregister and disconnect each published chip
before releasing the resources used by its hardware operations.

Keep geometry available after removal while releasing DMA and clocks.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c | 22 ++++++++++++++++++----
 1 file changed, 18 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c b/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c
index 527165ccc839..cda3bbdca928 100644
--- a/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c
+++ b/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c
@@ -2744,7 +2744,6 @@ static int gpmi_nand_init(struct gpmi_nand_data *this)
 	if (ret)
 		return ret;
 
-	nand_controller_init(&this->base);
 	this->base.ops = &gpmi_nand_controller_ops;
 	chip->controller = &this->base;
 
@@ -2759,9 +2758,15 @@ static int gpmi_nand_init(struct gpmi_nand_data *this)
 	if (ret)
 		goto err_nand_cleanup;
 
-	ret = mtd_device_register(mtd, NULL, 0);
+	ret = nand_set_release(chip, NULL);
 	if (ret)
 		goto err_nand_cleanup;
+	ret = mtd_device_register(mtd, NULL, 0);
+	if (ret) {
+		nand_disconnect(chip);
+		mtd_put_master(mtd);
+		goto err_out;
+	}
 	return 0;
 
 err_nand_cleanup:
@@ -2782,14 +2787,22 @@ static const struct of_device_id gpmi_nand_id_table[] = {
 };
 MODULE_DEVICE_TABLE(of, gpmi_nand_id_table);
 
+static void gpmi_nand_release(struct nand_controller *controller)
+{
+	kfree(container_of(controller, struct gpmi_nand_data, base));
+}
+
 static int gpmi_nand_probe(struct platform_device *pdev)
 {
 	struct gpmi_nand_data *this;
 	int ret;
 
-	this = devm_kzalloc(&pdev->dev, sizeof(*this), GFP_KERNEL);
+	this = kzalloc_obj(*this);
 	if (!this)
 		return -ENOMEM;
+	ret = devm_nand_controller_init(&pdev->dev, &this->base, gpmi_nand_release);
+	if (ret)
+		return ret;
 
 	this->devdata = of_device_get_match_data(&pdev->dev);
 	platform_set_drvdata(pdev, this);
@@ -2838,7 +2851,7 @@ static void gpmi_nand_remove(struct platform_device *pdev)
 
 	ret = mtd_device_unregister(nand_to_mtd(chip));
 	WARN_ON(ret);
-	nand_cleanup(chip);
+	nand_disconnect(chip);
 	gpmi_free_dma_buffer(this);
 	release_resources(this);
 	pm_runtime_dont_use_autosuspend(&pdev->dev);
@@ -2846,6 +2859,7 @@ static void gpmi_nand_remove(struct platform_device *pdev)
 #ifndef CONFIG_PM
 	gpmi_disable_clk(this);
 #endif
+	mtd_put_master(nand_to_mtd(chip));
 }
 
 static int gpmi_pm_suspend(struct device *dev)

-- 
2.53.0

