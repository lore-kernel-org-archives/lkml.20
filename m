Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794046609;
	b=Q4pIYA5K16MKqjGiBJ99hZW4suOUH9/D7Dk082BOFmKHElkaanZSwWqONqQBHceDKfQC
	 h9fmuB9u2UXNRjL9l4gaIbuo4g2QebAgbPUOiCoAVgfC7zYC/P0Cz+5YimSxaPFR/atSU
	 SaRxIB4Cj0XQNUEsCk8Kd6CnNbH6oCcUjvmm/odVkk/8la86af/Uvxglvbb7sJlBmI9rQ
	 gv1kTEXgGjhTp54gP1nt/E4GHePBm+sJY9q+8DUKXUe4sGsuEzKu07BLJOYjCTDNPAHSu
	 HjHe6rDpevlmO65KajQq2cqeT3rTFDprK4oiFn20nFo0cBO6xo+L3H9mcYRMG6Z8nDA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794046609;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=kjPwaFDbZuTJvqjQ+cQB8B42nBaUa83lSo+JE+gssUA=;
	b=uYhrOt5ONd0NQxLny5qFlgP3srgy1Hi1em3tmuLkAw3vOftMkXjTye7oKaOKIV4iaqJz
	 fLoSx7kHsCl5btEreQ6C4+lZrggAQTaljwPfKtnHezZ38t8APnxgx+xkxYluUJoUUr6Kl
	 q/knE1+BV49bMYx5uAAV+GF9t/dsv4NNgAn5sCnQX8anzLyu7qpcpz/Mk7qwRLn0RR7Jm
	 MmHCs+2ehry5hnrwKtYtOmBYQxmMhxi6fxW/Gd1P4gk9N05auCuverSW10gGFGC2k0YgR
	 2A/uL+RmWz4O54QW2mcUGR4scbCPf3QSg1Uf/V6769ODnmzTM5TXWYk3D9b5Vp73g4Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=a27Vni2U;
	arc=none smtp.remote-ip=209.85.210.51
Received: from mail-ot1-f51.google.com (mail-ot1-f51.google.com [209.85.210.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A6966082BFA
	for <linux-kernel@vger.kernel.org>; Sat,  7 Nov 2026 10:16:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0A6966082BFA
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=a27Vni2U
Received: by mail-ot1-f51.google.com with SMTP id 46e09a7af769-823b938464fso1112577a34.2
        for <linux-kernel@vger.kernel.org>; Sat, 07 Nov 2026 02:16:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794046608; x=1794651408; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kjPwaFDbZuTJvqjQ+cQB8B42nBaUa83lSo+JE+gssUA=;
        b=a27Vni2U4vhty3zCHojWT/sjM3GihDhQuCWecmRAa+CezosijLlI6ibQxtsdw5MD3p
         AcflRduOvCCXFyIadx03kqn0gw1p5fKhRzK5uLg2x6aGDEoC0gdSmlJrdCtNHhb6DU1k
         uoHJFW/0WxgERqZ9NBv017koirznsDX09uFeboHHI0cN6zvnWaY0/R7nMP7jZKWIIENG
         PBbvpu474GVHbYwPijjL6xfyC4gggP8zn0hONQzmuQ6vCUMIu+LiqzOD5gNr/LUpI9eu
         IX0uk4EyFVH/XOrX07zaFiqgtR35V1w2cggBN07xSR7cBnRR0BlSxD68LknjJmA2Agu9
         ZASg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794046608; x=1794651408;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kjPwaFDbZuTJvqjQ+cQB8B42nBaUa83lSo+JE+gssUA=;
        b=0+Y+tLFVi/88h3QXzpFZFel+cYmOi6/FqrbOK/FZ+WyRBD901xeeAGMkhDobbicPov
         0RB5oSauU9yzXeGWA0j3UVh++PTcNi9mKGMBTv0wtiqG7nH9OU6vXyFmC+/1fz6LO8p7
         Jsl10hKml626PoROYUYJjDL31QHIovEulG2R4qwRNNozCg2RvfrQTUJcS/4CjXKzinEc
         t8+d6ZC+iL/jfd78l8wGqQZraO/504O9mzA8AvAmmRPUiG0pVrqzxWcy4EaFezuWeDm/
         F+v5TOh0WrVi019lkmgg1Yhj0/dLQjvs4A9GbCL9JEGil1qhH6Og++hcQbI0QRi0rk0W
         WDTg==
X-Forwarded-Encrypted: i=1; AKwUvBx3o3+h9JpjwwnPXcyWuG3Kd+1fw7qF5GNCPGKx5bRJxT+CYU1k33xrJGgSzUHN5ZU/3ZxEQ8IQlXS82eg=@vger.kernel.org
X-Gm-Message-State: APuU4Z8fOixwoGftELqr9ATvDx1c3EUdpNURdqNrSdgMJQO5ybgvQ7k5
	7r5qhLHwmnPcLTdZmJs7KeKNU3ZcK7U3rVqacSlY/yGHyAOVUNzjQeBc
X-Gm-Gg: AYBFou0Q4+Uwfhzxi6V4LAGsFxmV/TakbKcNFSAqYV2v1wK4q/mTiMdBNoZl3Ozh15s
	CoTYtKLjDrZXpZo/dBaGkRQte2d3h9Le6km/jUSfBwMM0erua6S/U4DGTGnheLFLLypNsryZ9UO
	/jiBWWy0sBjsgo+hr9OlG3G4bpfNkWr8JFr7cy/shPP9pjHlXFAJ/49bnoEygM9HWsL4dvUNrfx
	6S5FaPCa/g/pwZc60avhR9mLAOT/JmbJVz6YkUj+0yGEdrfHreDdB5laqnEJvTtm1qOZFzekItj
	a+zguztbQ5LrKdlVz4Usmsj8UnbstDhsKPmzS3c+VWHYRbC05PQH4mIu5blYDl5OIeyB1MSUkPb
	bUKDby78XbfS/2kd81ChkfU15OQCrE1wvVjrGfDsgBN7D5btcvpdBMnsL/r+oB2n+CChXIHlNMA
	CZKnP5Ps9crFVQI3E32qgEZ1BSCEptMOAf8TtmI8Vt+vD4OIi+3p9WTflXMBcN+JdBGH7hP0P62
	dA5YoqTsS4FDnxDWerQSqlx43M4nOH6ME3WbzS9W2ewlxjuJd1eHnDkmBVmc2oefiVFr7ZJ+b/e
	5vYITDfunb30aKOX3ECkX+Y9ZpUl15vCJg+LT21K/ok+Nb0k/hTk8eejfz0XsE/Y4MvGWo1jBDj
	2GAPYnPXKl89+81cgtSEWiaXyFgPhVi5WZEQ+INYYSRUhqb2DsCrGR39k0bgSE9XQzEvnI3rD+n
	wK4ykWDWDF4Qc1n80tdLxSgUhC+2t+yqZhP5oqMzNvOgAvL0Nf4z99
X-Received: by 2002:a05:6830:4486:b0:81f:b198:5b6c with SMTP id 46e09a7af769-85f1d060dacmr4931533a34.22.1794046607890;
        Sat, 07 Nov 2026 02:16:47 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-85f1dbef224sm3990269a34.12.2026.11.07.02.16.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 02:16:47 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sat, 07 Nov 2026 03:16:05 -0700
Subject: [PATCH 08/58] mtd: rawnand: plat_nand: retain open-handle state on
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
Message-Id: <20261107-submit-rawnand-retained-handle-lifetime-v1-v1-8-0181ef0cc4c8@gmail.com>
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

Unregister MTD while notifier clients can finish their I/O, then
disconnect the NAND chip before invoking the platform hardware teardown.
Keep the chip, controller lock and software ECC metadata until the last
MTD reference is dropped.

Handle registration failures through the same reference-counted cleanup,
since partitions can have become visible before registration fails.

Fixes: 711fdf627ce1 ("[MTD] [NAND] platform NAND driver: add driver")
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/plat_nand.c | 24 +++++++++++++++++++-----
 1 file changed, 19 insertions(+), 5 deletions(-)

diff --git a/drivers/mtd/nand/raw/plat_nand.c b/drivers/mtd/nand/raw/plat_nand.c
index fe31551bcf5f..8321667fae2f 100644
--- a/drivers/mtd/nand/raw/plat_nand.c
+++ b/drivers/mtd/nand/raw/plat_nand.c
@@ -21,6 +21,11 @@ struct plat_nand_data {
 	struct gpio_desc	*ready_gpio;
 };
 
+static void plat_nand_release(struct nand_controller *controller)
+{
+	kfree(container_of(controller, struct plat_nand_data, controller));
+}
+
 static int plat_nand_attach_chip(struct nand_chip *chip)
 {
 	if (chip->ecc.engine_type == NAND_ECC_ENGINE_TYPE_SOFT &&
@@ -65,10 +70,13 @@ static int plat_nand_probe(struct platform_device *pdev)
 	}
 
 	/* Allocate memory for the device structure (and zero it) */
-	data = devm_kzalloc(&pdev->dev, sizeof(struct plat_nand_data),
-			    GFP_KERNEL);
+	data = kzalloc_obj(*data);
 	if (!data)
 		return -ENOMEM;
+	err = devm_nand_controller_init(&pdev->dev, &data->controller,
+					plat_nand_release);
+	if (err)
+		return err;
 
 	data->ready_gpio = devm_gpiod_get_optional(&pdev->dev, "ready",
 						   GPIOD_IN);
@@ -77,7 +85,6 @@ static int plat_nand_probe(struct platform_device *pdev)
 				     "could not get READY GPIO\n");
 
 	data->controller.ops = &plat_nand_ops;
-	nand_controller_init(&data->controller);
 	data->chip.controller = &data->controller;
 	chip = &data->chip;
 	nand_set_controller_data(chip, data);
@@ -126,6 +133,11 @@ static int plat_nand_probe(struct platform_device *pdev)
 		goto out;
 
 	part_types = pdata->chip.part_probe_types;
+	err = nand_set_release(chip, NULL);
+	if (err) {
+		nand_cleanup(chip);
+		goto out;
+	}
 
 	err = mtd_device_parse_register(mtd, part_types, NULL,
 					pdata->chip.partitions,
@@ -134,7 +146,8 @@ static int plat_nand_probe(struct platform_device *pdev)
 	if (!err)
 		return err;
 
-	nand_cleanup(&data->chip);
+	nand_disconnect(chip);
+	mtd_put_master(mtd);
 out:
 	if (pdata->ctrl.remove)
 		pdata->ctrl.remove(pdev);
@@ -153,9 +166,10 @@ static void plat_nand_remove(struct platform_device *pdev)
 
 	ret = mtd_device_unregister(nand_to_mtd(chip));
 	WARN_ON(ret);
-	nand_cleanup(chip);
+	nand_disconnect(chip);
 	if (pdata->ctrl.remove)
 		pdata->ctrl.remove(pdev);
+	mtd_put_master(nand_to_mtd(chip));
 }
 
 static const struct of_device_id plat_nand_match[] = {

-- 
2.53.0

