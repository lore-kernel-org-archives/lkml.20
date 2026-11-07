Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794082438;
	b=LxePJ2hHuzmhGMU5wuJ4RKSSqYkuji0n7j2VS60SjHtQBoGeH2sl0HNK1AP8cckSyEYp
	 xx90OJvO5vcLYeqykAae2XjGXln9gQ5LW23c+AAwT5Vh4/F1u7XxDWJDP7pydkKpAWh8h
	 Pd5DOSNV29njc7WpV4D9slCIsGiBj1TD96uKycdQvJtRpVoWtCi4jREF/B7NjlKI8RVy3
	 0ndcGN8/GQdjhyONUAf2M8f/u1ExNgFDSXpZ1llK4ZTDjPXS+IhyF8e8G7Kty/29xp8IM
	 C0/aYjsZS7No+1VMnwr3YSXZbPA1BsMv6utBEFxWjZ5ho3lmuNhwTK26C5jM+taWXzA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794082438;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer;
	bh=Au1rwh2obm9uwGdEt+TtwG7FPc9AMzgCv64EazeTRGE=;
	b=b6h22VF14lLCq9P707BFM9rhmRYqdl7Y4M6Ug30jlLNe6KK5E65Nm5+qVGnIERP+UTEA
	 TRdO0ZMO7Ru05VuJ2Whrv9JTKOg61gx6/rxth3d10hnciu9+2lS75BEwv4z1hTZbJ+m7a
	 4hHx7AwNTCjlbTcmD3MurSX6H4oajzJtVj76kFDj5Zb3RHCxD/0u4O0JLBcWQQIP4fs8W
	 E/4h5HuXc/mUwULjUwMtjQeIMK2wY2OXYOUWVWfMTZHrOdd/7QPSCxTZ5fEHQWDXoloQJ
	 /6CHGNxaiGSrFdAiehFxPQJT3tk1IQFGLghLNZGcriscOjDiLwxLMK7nQyath373MhA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=gmail.com;
	spf=pass smtp.mailfrom=upstreamdata.ca;
	arc=none smtp.remote-ip=209.85.160.54
Received: from mail-oa1-f54.google.com (mail-oa1-f54.google.com [209.85.160.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35F8A606EE93
	for <linux-kernel@vger.kernel.org>; Sat,  7 Nov 2026 20:13:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 35F8A606EE93
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=upstreamdata.ca
Received: by mail-oa1-f54.google.com with SMTP id 586e51a60fabf-4ad60ec5eaaso21599fac.0
        for <linux-kernel@vger.kernel.org>; Sat, 07 Nov 2026 12:13:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794082437; x=1794687237;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Au1rwh2obm9uwGdEt+TtwG7FPc9AMzgCv64EazeTRGE=;
        b=pakQp57cl3wVWWRH+bx/W5elyu5cLZnKowXql+nfGshXlyJ8uXwuSi7tixfC+IBX4u
         K+zgmyxwRSsK1qFMVDthTr7rDTX5Z7zJ5TsgwJ0CWehwQmx2wptu9qxiRMZvfbSulllu
         NkhYMc9dQVbpAEs2BOaACDdxlsRi8BOzEm/G1R5ap9d6rOlxZTBXBGk5ZBtyrypCg/rB
         m4jR1iE9rkd1VFJR0mbH/56S5nMO0OQcPELOBtDLL5HmG0klHsdzyqRYxl3gcLkoBvYd
         cN8BHjRRkSfVEhI88hW7v+2c0Z01iAhuPzzOqI6ar65pGUfvGQFTvGk4l35XolvoUUQE
         Z8ag==
X-Forwarded-Encrypted: i=1; AL+hErEgRqRvM0S3yW6bB87uBYcZb/DLu7sAUusOdU7qnn1gZ2Xo3GaMPpa5Wto7/9RXLWSS2fB63AD8watYfO0=@vger.kernel.org
X-Gm-Message-State: APuU4Z8/f9qzita1IduIoK23B3vBX3NVO5hrpKhkzva2fYFOpQRgMkBN
	Mwtw+DLwpjxZbvJqyWNPwxiJlQGS+5UFQkrBFgQneL7rSpLiTu5DW/s7LUJLppLAops=
X-Gm-Gg: AYBFou12EQvB1evHMxVJWMQxQVDgYuaX37JxZ++JQX/Bop4NhDqLGSoWmD1cA8lhhwN
	S0Q6cstmxPnBFEND/8u312O6VkzLODx6tbTnOHXONCBcjZsTOboV6L467/mEdTczKXXG66EttFl
	kl5a+tb+i2zvook+GNM+IUzVZXCjP6azS3RP+Ar7NpUIQXWkirMxUKd2cdvOd4I4zXFv2h472pL
	oufHMmMHGMyqsV8pMT6tpaFx2LLJ58OraguKpIj5kEa1x0ltoQoKRPSOa9IWYLyS3UBOm3O/cUG
	n4ltk/Cgwdauckx9/hLzkXhVq6/3CoChYv2ePOQqz/3DJqGklUDQ+p32aXR5S/TnQcnypIQlle3
	TJbK2SoblGHDw5qO7QlskrSDGZiGDW/URm+gB5Y2PgHZvWuioGAP7sQIg4hBYv2Wna/1kThirPT
	iHsTANxCbv+Sdctl709QabVIT9MOobM9d8+8X6FUvC8kLlGHMMsyUUkzC6QeNJNT9WVhgeO3SzO
	fe2by85t8n5jCHosJyRDpCU52HU/rBMLXHq6y0rzw2vGZOA3uwVWr+vxVtPjBpJdFM85j0z+Bbr
	OdVdB2bmy/p4e+MKA/wQY1zGpcOKUAyUNCxclZYwzX14CK88qkmngkqD3sBC
X-Received: by 2002:a05:6870:9f0d:b0:48f:e0f6:bd51 with SMTP id 586e51a60fabf-4adc11d6d6amr1203868fac.38.1794082437088;
        Sat, 07 Nov 2026 12:13:57 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4ade68aa561sm226096fac.5.2026.11.07.12.13.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 12:13:56 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sat, 07 Nov 2026 03:16:46 -0700
Subject: [PATCH 49/58] mtd: rawnand: txx9ndfmc: retain chip state across
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
Message-Id: <20261107-submit-rawnand-retained-handle-lifetime-v1-v1-49-0181ef0cc4c8@gmail.com>
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

Retain each chip and its shared controller while MTD references remain.
Unregister and disconnect before dropping driver ownership, and check
MTD registration failure without publishing partially initialized chip
slots.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/txx9ndfmc.c | 42 +++++++++++++++++++++++++++++++---------
 1 file changed, 33 insertions(+), 9 deletions(-)

diff --git a/drivers/mtd/nand/raw/txx9ndfmc.c b/drivers/mtd/nand/raw/txx9ndfmc.c
index 4cc6e91dbc23..9eae5002e389 100644
--- a/drivers/mtd/nand/raw/txx9ndfmc.c
+++ b/drivers/mtd/nand/raw/txx9ndfmc.c
@@ -276,17 +276,33 @@ static const struct nand_controller_ops txx9ndfmc_controller_ops = {
 	.attach_chip = txx9ndfmc_attach_chip,
 };
 
+static void txx9ndfmc_chip_release(struct nand_chip *chip)
+{
+	struct txx9ndfmc_priv *priv = nand_get_controller_data(chip);
+
+	kfree(priv->mtdname);
+	kfree(priv);
+}
+
+static void txx9ndfmc_release(struct nand_controller *controller)
+{
+	kfree(container_of(controller, struct txx9ndfmc_drvdata, controller));
+}
+
 static int txx9ndfmc_probe(struct platform_device *dev)
 {
 	struct txx9ndfmc_platform_data *plat = dev_get_platdata(&dev->dev);
 	int hold, spw;
-	int i;
+	int i, ret;
 	struct txx9ndfmc_drvdata *drvdata;
 	unsigned long gbusclk = plat->gbus_clock;
 
-	drvdata = devm_kzalloc(&dev->dev, sizeof(*drvdata), GFP_KERNEL);
+	drvdata = kzalloc_obj(*drvdata);
 	if (!drvdata)
 		return -ENOMEM;
+	ret = devm_nand_controller_init(&dev->dev, &drvdata->controller, txx9ndfmc_release);
+	if (ret)
+		return ret;
 	drvdata->base = devm_platform_ioremap_resource(dev, 0);
 	if (IS_ERR(drvdata->base))
 		return PTR_ERR(drvdata->base);
@@ -306,7 +322,6 @@ static int txx9ndfmc_probe(struct platform_device *dev)
 	dev_info(&dev->dev, "CLK:%ldMHz HOLD:%d SPW:%d\n",
 		 (gbusclk + 500000) / 1000000, hold, spw);
 
-	nand_controller_init(&drvdata->controller);
 	drvdata->controller.ops = &txx9ndfmc_controller_ops;
 
 	platform_set_drvdata(dev, drvdata);
@@ -361,7 +376,18 @@ static int txx9ndfmc_probe(struct platform_device *dev)
 		}
 		mtd->name = txx9_priv->mtdname;
 
-		mtd_device_register(mtd, NULL, 0);
+		ret = nand_set_release(chip, txx9ndfmc_chip_release);
+		if (ret) {
+			nand_cleanup(chip);
+			txx9ndfmc_chip_release(chip);
+			continue;
+		}
+		ret = mtd_device_register(mtd, NULL, 0);
+		if (ret) {
+			nand_disconnect(chip);
+			mtd_put_master(mtd);
+			continue;
+		}
 		drvdata->mtds[i] = mtd;
 	}
 
@@ -376,18 +402,16 @@ static void txx9ndfmc_remove(struct platform_device *dev)
 	for (i = 0; i < MAX_TXX9NDFMC_DEV; i++) {
 		struct mtd_info *mtd = drvdata->mtds[i];
 		struct nand_chip *chip;
-		struct txx9ndfmc_priv *txx9_priv;
 
 		if (!mtd)
 			continue;
 		chip = mtd_to_nand(mtd);
-		txx9_priv = nand_get_controller_data(chip);
 
 		ret = mtd_device_unregister(nand_to_mtd(chip));
 		WARN_ON(ret);
-		nand_cleanup(chip);
-		kfree(txx9_priv->mtdname);
-		kfree(txx9_priv);
+		nand_disconnect(chip);
+		drvdata->mtds[i] = NULL;
+		mtd_put_master(mtd);
 	}
 }
 

-- 
2.53.0

