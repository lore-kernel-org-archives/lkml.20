Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794082435;
	b=P2Or2UB+LLUoHstnyoNzj+ZG/U7HpJqFsskalipPX4HpW0JHhxGpbh50PcnTwal1HNen
	 jwAspJkPYEYEcLQtL4VhnfsXXz1o4T/ni0qoDUzW9Qwhp8l1+r1lvyhsVTtZJUSMCkqDO
	 biZwUQiWlxied+HJO3TlWFigdtmeKaqY6+GvD4nWkYCdkP6EMWR3Kr0odVUS2Hvh8ZNOp
	 RhFbLL6LH2Rod3DcLZpH7qI11MUdC392QYLpuva6coA+arR+IHy0jSWTon26y63uoCs3f
	 tvWJyPvZNyg7ZuLpVfKUC7ILHG6Y1OYxySPZe1jDbFu1ue4ZfkgbwoF6AvbZFjwnxyQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794082435;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer;
	bh=qoIL+h3VRnDc2UQ+UqSvvQ4SKOAi/m0jcVk5/5iZOfM=;
	b=o1ZYAdeXDAmCSDYGnPzBna1nanqI18TI8FmbmgaORLEIMdSx1OTfE9Wo0a8LfMr+Y3uQ
	 afQB0bxKDDBsRWdSgOZxcbxTk163ot3Mbo+aRcfGi59Dl8udiB43WXv90vxiSOyh8DGhn
	 Zik7vXuPsb/tYOkJPus/78ghUMTCntYJpKDS53aNKM0902uN1H3Sg9g1UXSraELRJBQ/8
	 xMfjBJBmdNEaztueQcIQSMpSNz1qRsfVlAZq5c9OWvcCfL9avzu3QyLHEy1UI3dvfbwu7
	 syWVSSt0o2cOk9+4grCd6rIbcS88DBLu47Kv8r92wQqaOvjMpa9Dy8vjsy4zZPDZfHw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=gmail.com;
	spf=pass smtp.mailfrom=upstreamdata.ca;
	arc=none smtp.remote-ip=209.85.161.45
Received: from mail-oo1-f45.google.com (mail-oo1-f45.google.com [209.85.161.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E3336083615
	for <linux-kernel@vger.kernel.org>; Sat,  7 Nov 2026 20:13:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4E3336083615
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=upstreamdata.ca
Received: by mail-oo1-f45.google.com with SMTP id 006d021491bc7-6f8a519e215so22921eaf.1
        for <linux-kernel@vger.kernel.org>; Sat, 07 Nov 2026 12:13:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794082434; x=1794687234;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qoIL+h3VRnDc2UQ+UqSvvQ4SKOAi/m0jcVk5/5iZOfM=;
        b=fMJ2ojnbxWglbEUWrR4tNpdjUQa+4C9Yib4Y3L1Y4D4+FXCE/lAIqr57aUKjIyCYP9
         st414PkzfhokuRc/JNggD/ekOtV+4zI8kuzy0CsCXUUGP5md02zbEycJhsSC6gZnYfJT
         kY2osDnF8pgphN7mn/ERq+GaSGM1l4j5nZ0tMs+PE2s+HZ8Y7+/6kI9i5V+h1j+mGUMf
         4A0jxlQlTmfAw2O2n16dvN1ZYmXTaryUlr2dwgyStvTnc4KKWKrsKLjvt2EXKzQmsGVk
         SbQTshXS4lxxfF6HNyBdVnkj/QKAkk4/gk4fPNTvgM6H3AXrXgyL9dT9ULGrVn/DEqNy
         ClXg==
X-Forwarded-Encrypted: i=1; AKwUvBwa4liIammCstww1Dmt34eyXf/UYMgD7hsFaYFDK988Hvc/gvMuEv9mBREURBposmDf7NQkQ7QEEiKyZ6c=@vger.kernel.org
X-Gm-Message-State: APuU4Z9MH/FJLJEerOTHiEG9CeVBqrxkjPAJ16Gkm9PvEwaxj2r4bR5l
	fQXHV9RgAM8ycPT1mQGjzVA2Qsjlq/8EMFx3qyiMLH4EGuFMXD/t4/Bk5F4bb7/RVOw=
X-Gm-Gg: AYBFou0T6RNO+CUay8Q0aOyS9Xwy9Hp/wYHxUBsZoD48Z77U28+Fuy6kaFv3e1SAau0
	S5IUMAfP5BoLLh416c5dCUrZVLAg492hTNgF80UDeg5Rw7AvxcRmsHFT7+OdV4OmFW5LwFtqUI9
	k0JB7S0OUuem99P16+hX3I5NeX3xhk3Qel3Ax1pglxFclNwH8ACEr/Q6dpn50cRlxJoZg2JVzfB
	BW3iIIyV7RTLG+Q5xahjU/fie1POyHpFZH1D/g5VhE9BP9HNLLD6/RiSLTDwFqOc/XBy6X37SAO
	mGZk/x57lN92dOaWdMVgwF0v/yXUec2W4/BEKs2IHL5WnwRplfJ+JbYv950pa6E/E2cE06Av+tI
	iRcGg3D+V44qWOVQJyjpEhGhJINMMrW/ijSZF2hJ6uz5BhjJ4gHgkr6X81Vr7x3cfE2pkVzMoJ+
	li8W8GFc7HwrolsyURSnQi2s4x14g/09w7EreQ6nYOfy4IYl6wXEaAAAxId6zv3mPvmwU5Jj4qm
	OMCAgHorOvGgjBmyseu0VDn35A4nZnf3c1AvlIiILQHXAp4hLxeYxjkUdkh3sXI0rNPFZKKCSSC
	ugIxDqcKV3+gnwROQz1BL06nt7aKahy1VLZV3ZpcjGTuDC3xmhxLXCfMBWoukz0MZG1GxO2TxFu
	/J+SFBg==
X-Received: by 2002:a05:6820:2910:b0:6f6:baee:3ccb with SMTP id 006d021491bc7-717009e3477mr1267617eaf.9.1794082434177;
        Sat, 07 Nov 2026 12:13:54 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4ade68aa561sm226096fac.5.2026.11.07.12.13.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 12:13:53 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sat, 07 Nov 2026 03:16:45 -0700
Subject: [PATCH 48/58] mtd: rawnand: ndfc: retain chip state across removal
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
Message-Id: <20261107-submit-rawnand-retained-handle-lifetime-v1-v1-48-0181ef0cc4c8@gmail.com>
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

Allocate controller state per binding instead of reusing the static
chip-select slots. A retained MTD handle must keep its original chip
state when the platform device is rebound. Disconnect the old chip
before device resources disappear and release its state at the final MTD
put.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/ndfc.c | 37 +++++++++++++++++++++++++++----------
 1 file changed, 27 insertions(+), 10 deletions(-)

diff --git a/drivers/mtd/nand/raw/ndfc.c b/drivers/mtd/nand/raw/ndfc.c
index d7b119028a71..50506ad87fd4 100644
--- a/drivers/mtd/nand/raw/ndfc.c
+++ b/drivers/mtd/nand/raw/ndfc.c
@@ -37,8 +37,6 @@ struct ndfc_controller {
 	struct nand_controller ndfc_control;
 };
 
-static struct ndfc_controller ndfc_ctrl[NDFC_MAX_CS];
-
 static void ndfc_select_chip(struct nand_chip *nchip, int chip)
 {
 	uint32_t ccr;
@@ -173,13 +171,27 @@ static int ndfc_chip_init(struct ndfc_controller *ndfc,
 	if (ret)
 		goto err;
 
+	ret = nand_set_release(chip, NULL);
+	if (ret) {
+		nand_cleanup(chip);
+		goto err;
+	}
 	ret = mtd_device_register(mtd, NULL, 0);
+	if (ret) {
+		nand_disconnect(chip);
+		mtd_put_master(mtd);
+	}
 
 err:
 	of_node_put(flash_np);
 	return ret;
 }
 
+static void ndfc_release(struct nand_controller *controller)
+{
+	kfree(container_of(controller, struct ndfc_controller, ndfc_control));
+}
+
 static int ndfc_probe(struct platform_device *ofdev)
 {
 	struct ndfc_controller *ndfc;
@@ -187,11 +199,7 @@ static int ndfc_probe(struct platform_device *ofdev)
 	const __be32 *reg;
 	u32 ccr;
 	u32 cs;
-	int len = 0;
-
-	ndfcbase = devm_platform_ioremap_resource(ofdev, 0);
-	if (IS_ERR(ndfcbase))
-		return PTR_ERR(ndfcbase);
+	int len = 0, ret;
 
 	/* Read the reg property to get the chip select */
 	reg = of_get_property(ofdev->dev.of_node, "reg", &len);
@@ -206,10 +214,18 @@ static int ndfc_probe(struct platform_device *ofdev)
 		return -EINVAL;
 	}
 
-	ndfc = &ndfc_ctrl[cs];
+	ndfc = kzalloc_obj(*ndfc);
+	if (!ndfc)
+		return -ENOMEM;
+	ret = devm_nand_controller_init(&ofdev->dev, &ndfc->ndfc_control, ndfc_release);
+	if (ret)
+		return ret;
+
+	ndfcbase = devm_platform_ioremap_resource(ofdev, 0);
+	if (IS_ERR(ndfcbase))
+		return PTR_ERR(ndfcbase);
 	ndfc->chip_select = cs;
 
-	nand_controller_init(&ndfc->ndfc_control);
 	ndfc->ofdev = ofdev;
 	dev_set_drvdata(&ofdev->dev, ndfc);
 
@@ -243,7 +259,8 @@ static void ndfc_remove(struct platform_device *ofdev)
 
 	ret = mtd_device_unregister(mtd);
 	WARN_ON(ret);
-	nand_cleanup(chip);
+	nand_disconnect(chip);
+	mtd_put_master(mtd);
 }
 
 static const struct of_device_id ndfc_match[] = {

-- 
2.53.0

