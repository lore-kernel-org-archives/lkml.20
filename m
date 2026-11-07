Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794046612;
	b=iHpLxjyMDEeldkiXFdRyS0WN5w0/wFQ0ItYjPFlIN/oOPNUc34mdPUq7aLy/tFQlyR2H
	 4a1higxELKj4ef62uvh6RvKQ2Xt/0hW6BQU0yCNkkegkGd216zCDmdtg/GEp7yCk3wG6o
	 v86c3qphFaYmOWJDvm5AtUGoDR/7sGJjQnGqg20C6YlzuxMT2b8n3b/xj9w7HJcnNpW20
	 3tq0gIGmiS7eWb7gu2N8NtXS/pF9QfYFjg7NdT+Jicgm5oj9Qk+1lKmgbCFF9F1p1yjoV
	 ZCuqNcbb+ImjMT3RJlTgT0Y72oTNoVYFvwz4iHE4rJvOdewexX+NCQ0x/gGY2JTVeZA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794046612;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=HKhvO/JDZmUi26rwGqJ96W9quTw5lImbNN+f783UF4k=;
	b=EI3ZAx2b54pcBKcEgq7CDWqAegdkDJZVtyCHPCtgMs8pketlPdHLPXiMCGoxJRgB2SMJ
	 7UiH+b3dQoL447oKUb2Ms9d8FN3hv34Kuhw4Jj7UZ4JXUyYy0sN1t0MuT9Cm/CDOgggPb
	 1V7rBnEjweSIQayh0WHO9L/77hGeboLzBnla1+0r5V5eOT22HrwXPQ/Dsv0V3zzKhVcg+
	 Z4QDPLfhCQkbKefbkCO2bbpoc/NgHiU7ifozjOK9D4tJeTZLKc5DAYvHFvob13nY7k+sE
	 FnuL03qBXa2LGj/REDFSPY+GmDfnJYqUOyZPJJi9CWWF+cZIIea4dWbuqzBLp9PHMRQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=KGXtLhLY;
	arc=none smtp.remote-ip=209.85.210.54
Received: from mail-ot1-f54.google.com (mail-ot1-f54.google.com [209.85.210.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D06A26083611
	for <linux-kernel@vger.kernel.org>; Sat,  7 Nov 2026 10:16:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D06A26083611
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=KGXtLhLY
Received: by mail-ot1-f54.google.com with SMTP id 46e09a7af769-84a248254f4so881764a34.0
        for <linux-kernel@vger.kernel.org>; Sat, 07 Nov 2026 02:16:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794046611; x=1794651411; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HKhvO/JDZmUi26rwGqJ96W9quTw5lImbNN+f783UF4k=;
        b=KGXtLhLY4/Y9dF950dN43n4TeFvCnD3q/hYowhMCzMuob6nih1BChoNV05vj2XYuCS
         B08M43QBn+KPN9O0miEQ6HdflDVIgT7IbN5AB9x+9i0se1jH0rCwvfAbBPkwpj8mNg/P
         zCvFJKoPoX4KfY9sosN80pS7W0peF91H2z8PWbQpLtOZRg60HG3UGLIa446OBOBy6KI7
         3hwLqP4xaYSLiMI3VyAYh8XqdipLKqaVvToQkdMVrBYOfWdf7tGz/54oPjNqzEoS2h/O
         YKBP8Eec4x+uApYBgFZ08C0QYd/aehU/4lfFdQZDVLf/YFM3ooG/H2Udd/TQFvTyxR9V
         2Cug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794046611; x=1794651411;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HKhvO/JDZmUi26rwGqJ96W9quTw5lImbNN+f783UF4k=;
        b=vT8D+2+ITdZYpxQ1Cor8GAl6vvd41Bl3otKjHdqsWLctKMYehIPoVMQcgnNXvYUn9m
         onewZ4CsuwhgbLw0/5KcVH1xfSVb29OiHXCiHldZ9RkDF+Msg1+qXdjTF5x9vYeqws1i
         FDG64I7t+dqSQxagarIas759ekmAEPDiSmxDQvN4MHzqarQNaShI9ZR2E0rDJrg1Hgkc
         kR8AxUgqBOxe616VcWwVxmZSH97oRUr1xNUHatTKdkyWcbbiaaSEirSGNqvx/ttZ8KW+
         xI6ZWU/tBv+fd1TJJpW17CH0QEx1Q8uaD37Mu3bLDPZZtCUpDTl3wyULcAjwhWH5CMU/
         khsw==
X-Forwarded-Encrypted: i=1; AKwUvBy8tpQkR3ChYWnd/2VkJTNR+ro/DjbX50c8pybZMJXna5p8ynXO+39yqi22fVIjvVLvMSGNzl+5xneMyGA=@vger.kernel.org
X-Gm-Message-State: APuU4Z9Rxc13RPa5tDphJnv8UBLnGhXJlR7VVEnkLv/NY3vb6MxE0bs+
	8dtnL6opF959jUhjL6Qxc9yyOpgm0+PlBKQohh41i4PaFvb3r2hH/+w/
X-Gm-Gg: AYBFou2BZRAJoY5UdBwpB2cZNK8DBfyge1lY/gF3F6KrK3+DbgfzPoNkUIoHl/LxG0r
	Avx7XeJWCuy8lOjF6PMV/kh5qgn3/PttshrqPETZCeKa4GvX/qIiWGzh04/TEVip0BE7zn+W7gA
	rtahaW5ZEQZJKtySMVZ83cKyBd+A97kqS8UatOIL/574vne78xiJ+kiMm7xWuW0d3z2PwDfO+FW
	McYh3bt6vyHVhRpW28vod47YftOEAakVX5k/+qXIfElvR84aONnKOKeaogXe5W/5syzdZe/nGRS
	imFsDDexod8HbmVhxY/6h9TH8ywQusOmXFNrP+weiSMm9rqHh4G7nuWKSqSNs5Wnahj6Oz4gZcS
	uLDNLEZ9glNZEilQsKDstlU+AnxWAiQT6pxOVSW6yLop7/OoYL24/SyOTXCnHAceAx9gRl5Qal1
	Rnlmpqfq/H600+8Po5438UAwYYEdKp8bRTHJ+mKNTnHbG38EFk6lEHfSGjTmADiVa4nSbnRqVp/
	BRW+PXk7fa5x7t+csX8PfxtQ7bJ3wstQMs+gGcCYPNOjQzzftn+wyNJIPuaOk8sy0tYdT+UvGi2
	/RJT++3geXlB2+202uaoXFEpoywGpo9JikEg8KVXFivdQ3PJGw477ylZ1G8xsO85tlKFNj25SMF
	SAa8v2wOYXuAnBskuHtC8ZTWd+T5D2phAbkQ/PMENc62xcawu1044XbMUR6wLcOTu67JQYcO0p6
	QtwG0sKl/MOhEt3sWZZ+8HO6CAcdeiSKEqK9HsYHuQFCCcBCF+kUCX3pGXTYFPDg3nIiETxb+dc
	A==
X-Received: by 2002:a05:6830:82ee:b0:828:d647:332c with SMTP id 46e09a7af769-85f1d0facf2mr4771818a34.25.1794046610805;
        Sat, 07 Nov 2026 02:16:50 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-85f1dbef224sm3990269a34.12.2026.11.07.02.16.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 02:16:50 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sat, 07 Nov 2026 03:16:06 -0700
Subject: [PATCH 09/58] mtd: rawnand: gpio: retain open-handle state on
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
Message-Id: <20261107-submit-rawnand-retained-handle-lifetime-v1-v1-9-0181ef0cc4c8@gmail.com>
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
 Kamal Dasu <kamal.dasu@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Vladimir Zapolskiy <vz@mleia.com>, 
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

A retained MTD handle can outlive GPIO NAND unbind. Drain and disconnect
NAND operations before disabling the chip, and keep the chip metadata
and controller lock alive until the final MTD reference is released.
GPIO and MMIO resources are still released during unbind.

Also release scanned NAND metadata when MTD registration fails, using
retained ownership once a device could have been published.

Fixes: aaf7ea200004 ("[MTD] [NAND] GPIO NAND flash driver")
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/gpio.c | 21 ++++++++++++++++++---
 1 file changed, 18 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/nand/raw/gpio.c b/drivers/mtd/nand/raw/gpio.c
index 69e5e43532a4..b6c98c374e39 100644
--- a/drivers/mtd/nand/raw/gpio.c
+++ b/drivers/mtd/nand/raw/gpio.c
@@ -265,6 +265,11 @@ gpio_nand_get_io_sync(struct platform_device *pdev)
 	return platform_get_resource(pdev, IORESOURCE_MEM, 1);
 }
 
+static void gpio_nand_release(struct nand_controller *controller)
+{
+	kfree(container_of(controller, struct gpiomtd, base));
+}
+
 static void gpio_nand_remove(struct platform_device *pdev)
 {
 	struct gpiomtd *gpiomtd = platform_get_drvdata(pdev);
@@ -273,13 +278,14 @@ static void gpio_nand_remove(struct platform_device *pdev)
 
 	ret = mtd_device_unregister(nand_to_mtd(chip));
 	WARN_ON(ret);
-	nand_cleanup(chip);
+	nand_disconnect(chip);
 
 	/* Enable write protection and disable the chip */
 	if (gpiomtd->nwp && !IS_ERR(gpiomtd->nwp))
 		gpiod_set_value(gpiomtd->nwp, 0);
 	if (gpiomtd->nce && !IS_ERR(gpiomtd->nce))
 		gpiod_set_value(gpiomtd->nce, 0);
+	mtd_put_master(nand_to_mtd(chip));
 }
 
 static int gpio_nand_probe(struct platform_device *pdev)
@@ -294,9 +300,12 @@ static int gpio_nand_probe(struct platform_device *pdev)
 	if (!dev->of_node && !dev_get_platdata(dev))
 		return -EINVAL;
 
-	gpiomtd = devm_kzalloc(dev, sizeof(*gpiomtd), GFP_KERNEL);
+	gpiomtd = kzalloc_obj(*gpiomtd);
 	if (!gpiomtd)
 		return -ENOMEM;
+	ret = devm_nand_controller_init(dev, &gpiomtd->base, gpio_nand_release);
+	if (ret)
+		return ret;
 
 	chip = &gpiomtd->nand_chip;
 
@@ -345,7 +354,6 @@ static int gpio_nand_probe(struct platform_device *pdev)
 		goto out_ce;
 	}
 
-	nand_controller_init(&gpiomtd->base);
 	gpiomtd->base.ops = &gpio_nand_ops;
 
 	nand_set_flash_node(chip, pdev->dev.of_node);
@@ -374,11 +382,18 @@ static int gpio_nand_probe(struct platform_device *pdev)
 
 	if (gpiomtd->plat.adjust_parts)
 		gpiomtd->plat.adjust_parts(&gpiomtd->plat, mtd->size);
+	ret = nand_set_release(chip, NULL);
+	if (ret) {
+		nand_cleanup(chip);
+		goto err_wp;
+	}
 
 	ret = mtd_device_register(mtd, gpiomtd->plat.parts,
 				  gpiomtd->plat.num_parts);
 	if (!ret)
 		return 0;
+	nand_disconnect(chip);
+	mtd_put_master(mtd);
 
 err_wp:
 	if (gpiomtd->nwp && !IS_ERR(gpiomtd->nwp))

-- 
2.53.0

