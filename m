Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794046651;
	b=3iHR3axt76WpQXxFgvQhcQpSYbX/r5tPs7rI1LK0laYU8Af/SixhguPeQ+tI00553Tna
	 pXIOIcIHy8VSbq4tMPN7E/8EV3AVEL7oXNrlPEOyx3OwmvNypKjlaUDAi6PCMJbND4vOj
	 l55qxoh4At3bEhtNZjg/gtOUJQyRzQ8B3MJ0QfwfssEIeYgp/EyTxxvMuYW/8LyVdwNjk
	 ejiJO0wKSjPGTY6RCziL+RvK6qqV5s3hAhUGNokHtHudP3ULBIVKIPcAqEfCb1+A05j4h
	 iFrdF3F1+534YnM44Jkl7lPMUlDjl+Ngc2zNAOFd7ObQkLU5rW8ed+j6IFTRKbzu9Og==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794046651;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=Kq/spd0nl7HRarcKCTMCG6UXne9OBTV31uGO58RYFdk=;
	b=1tHxn4Jmf1fmr3BpkUOwH40EFeFXNehejf0QOSLykcxDY+ZqpGiFc80nHaU9EzILERUo
	 p22AFcn7TnO+6Z0+XhxAfhsQPXwnsMCaDGFngGsfeCR68Eld6gxCCg+aPAYihZI3y+HsM
	 wLuTNnvKSta/sKjvmhpTqYO+ZthhXkzR6K2B+lkSPAe16/7WJtFW3eMPT6q+IVWEWsBcR
	 QaGXeGZIWKxjzzRmaiT+ULaeMrw19+Yk6pAR4v3tsSQO2yiIUuuOXsfL4eu/HL0cRLHdE
	 fVufNC9sW/8gmUWSAbPFdzjHI6aQboAc+8uIOvhSP1PhJMh2Gl3vsiRMa1LL6uEULRQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xPzMA4JD;
	arc=none smtp.remote-ip=209.85.210.50
Received: from mail-ot1-f50.google.com (mail-ot1-f50.google.com [209.85.210.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C634608D979
	for <linux-kernel@vger.kernel.org>; Sat,  7 Nov 2026 10:17:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7C634608D979
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xPzMA4JD
Received: by mail-ot1-f50.google.com with SMTP id 46e09a7af769-8439fe796ebso990717a34.3
        for <linux-kernel@vger.kernel.org>; Sat, 07 Nov 2026 02:17:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794046650; x=1794651450; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Kq/spd0nl7HRarcKCTMCG6UXne9OBTV31uGO58RYFdk=;
        b=xPzMA4JDHfPVpt3nzTwQL8PAdWdfJ5nM0l+kR+QKMn+kjijtsVxzrVwXMySszp2oAh
         pCQWKhevo3lOBJJ5fO/xTslFphOgvEsXd3ocI8c4ITLL2ntkGvFNwkJ200GSVJOcSCrj
         LJExb9VxnR/ynNGO1uiHNNNNTGBKG2rM1QEWhUWRXefcir3aqnCH/pfyOtp6wIlC0FHb
         PB73mRSS5s6MPlE54UVRuOc29Kf/g4E+kXm56xPIjwoOr9fcLIjGrjqYE83WrGszi2xF
         mvnM3DBB9G03gx2WhGPmSuWOWh3wNs4vFXMoJ34LZEHwWW8mHUw7hOoUzBSqdDn4p4Uz
         VHjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794046650; x=1794651450;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Kq/spd0nl7HRarcKCTMCG6UXne9OBTV31uGO58RYFdk=;
        b=BAHMejfuu2xYDrDsKx+K02MmoublHa8HkqbOwn4M9Y23Cf6k1q+bXuw55GQv8QYxNw
         OYcfkJRtZOO83kzXyR3dSGBfMKodAShlOHhc9RoF1qEviG0HTHPVyz4WWvbeTvxFlqZz
         yh99jat5yYkDav+iNTO6j8eeM+mdqDiLFN7u5gccvjs86v7O26gOD60OVWZY/rf5oVtg
         HGszBJcCoSuL39IITMb7eivdJ2SGYSyiBBa4IVnOjKx/3SX9uOJ8F/bDPQ9nRI30gnqa
         vmhY5/C1ckFmNzaRhdO4voqzARrMXLWVM1XENydsN8sgM0w1oZ9uqrYqCzjWJFDypP3F
         Gqew==
X-Forwarded-Encrypted: i=1; AKwUvBzYmOKrihYlckDNDV8gJJ8HkbIYzQm5Nun8nxWuJ4RgPT0My6jeg2WXn11MeiKQ2eVfp8eF1IngBvWcNWo=@vger.kernel.org
X-Gm-Message-State: APuU4Z9HHnfT4WNR2OWn4KLxNh4c9VswwCow98gxuWbUFvaRWtVYFFbh
	190gP0JJYbQLhipf44bdqLZmopYf1B+yKtZ+prx1+r1XTXuIqa5jdr46
X-Gm-Gg: AYBFou04f4LWbVZWIYCQBtRquGZ4qDCSVHs11TZ70OzdgYSMdA0ad/BSLUtjmkzBlj9
	cjB5tK3aENv5j1XaC+tCE7xMxQ6cDFOQ+7KxK4cEkfuOcGABBKtsuix24rCZhmK5VGszPZGaC37
	YQOVqRYj+IFlPoIbCBTBKONzi7aqhMhCR6voGk1lM/Wq2/mwcGvxLgnEzJ246zkxVU/hGMJcngb
	PnhXRraEA+eoAsh9r5uZv+lgb8Oy1ds1Mk1p8JIQ37j0vmpTWeDS7j7vSbB32JWyXPkxrBdpLsI
	K97gbx3g2QwZDIiWzyWI7CsLDyYSqlryAJ6fypLG3rKtuE/KYZZBbmky9FOO12LB/WxydXPA8rG
	inrwcLolQsdooQTe4yiJkSfq41WRss0M13J0zXjNy91HS8DBRCr7ZXzCfhEu46poWq/g9VSTaXw
	VewASzwio2FsPif8kwWy3e+xdq373yaF9Dun3UnugMxAdMIoby0yRswaXpuWCWd6/emV2Z08BYm
	ae8Lh96GnXS+37kqiujdK0ePmc18/7AUinYIS490GG4TPppr3pi53v1gRxpQg2oWWRq8UNVCWUR
	kt4CpjweisoIgFrYf0b3j8VWzzFPOGAdPoIxVLBM9ubrkTkV6GSdNh3kRUb/UJXaE+G9fjeXd+u
	rjeLuPH0HFRgmCQjJ7FMR3BTLkMkZUKK3DkZdMVYmRDqAJnvfL4cnQ/uqCuzJ/I0o2zfSGHohw8
	NTtCoIIMrKvVGMpfTgp/1VZlunwdZEzhlTBIFTuFuriwvmDr85eyhc/ydXAb9HN/tfwEAsT0PQA
	Mk=
X-Received: by 2002:a05:6830:6809:b0:829:2af1:a07d with SMTP id 46e09a7af769-85f1cf0ebb8mr4412683a34.5.1794046650417;
        Sat, 07 Nov 2026 02:17:30 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-85f1dbef224sm3990269a34.12.2026.11.07.02.17.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 02:17:29 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sat, 07 Nov 2026 03:16:20 -0700
Subject: [PATCH 23/58] mtd: rawnand: ams-delta: retain open-handle state on
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
Message-Id: <20261107-submit-rawnand-retained-handle-lifetime-v1-v1-23-0181ef0cc4c8@gmail.com>
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

Keep chip metadata and controller storage alive until the final MTD
reference is released. Unregister and disconnect each published chip
before releasing the resources used by its hardware operations.

Apply write protection after unregister notifiers finish their writes.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/ams-delta.c | 29 +++++++++++++++++++++--------
 1 file changed, 21 insertions(+), 8 deletions(-)

diff --git a/drivers/mtd/nand/raw/ams-delta.c b/drivers/mtd/nand/raw/ams-delta.c
index fb2b7db70297..ca3fd966c4ff 100644
--- a/drivers/mtd/nand/raw/ams-delta.c
+++ b/drivers/mtd/nand/raw/ams-delta.c
@@ -233,6 +233,11 @@ static const struct nand_controller_ops gpio_nand_ops = {
 /*
  * Main initialization routine
  */
+static void gpio_nand_release(struct nand_controller *controller)
+{
+	kfree(container_of(controller, struct gpio_nand, base));
+}
+
 static int gpio_nand_probe(struct platform_device *pdev)
 {
 	struct gpio_nand_platdata *pdata = dev_get_platdata(&pdev->dev);
@@ -250,10 +255,12 @@ static int gpio_nand_probe(struct platform_device *pdev)
 	}
 
 	/* Allocate memory for MTD device structure and private data */
-	priv = devm_kzalloc(&pdev->dev, sizeof(struct gpio_nand),
-			    GFP_KERNEL);
+	priv = kzalloc_obj(*priv);
 	if (!priv)
 		return -ENOMEM;
+	err = devm_nand_controller_init(&pdev->dev, &priv->base, gpio_nand_release);
+	if (err)
+		return err;
 
 	this = &priv->nand_chip;
 
@@ -355,7 +362,6 @@ static int gpio_nand_probe(struct platform_device *pdev)
 
 	/* Initialize the NAND controller object embedded in gpio_nand. */
 	priv->base.ops = &gpio_nand_ops;
-	nand_controller_init(&priv->base);
 	this->controller = &priv->base;
 
 	/*
@@ -382,9 +388,15 @@ static int gpio_nand_probe(struct platform_device *pdev)
 		return err;
 
 	/* Register the partitions */
-	err = mtd_device_register(mtd, partitions, num_partitions);
+	err = nand_set_release(this, NULL);
 	if (err)
 		goto err_nand_cleanup;
+	err = mtd_device_register(mtd, partitions, num_partitions);
+	if (err) {
+		nand_disconnect(this);
+		mtd_put_master(mtd);
+		return err;
+	}
 
 	return 0;
 
@@ -403,13 +415,14 @@ static void gpio_nand_remove(struct platform_device *pdev)
 	struct mtd_info *mtd = nand_to_mtd(&priv->nand_chip);
 	int ret;
 
-	/* Apply write protection */
-	gpiod_set_value(priv->gpiod_nwp, 1);
-
 	/* Unregister device */
 	ret = mtd_device_unregister(mtd);
 	WARN_ON(ret);
-	nand_cleanup(mtd_to_nand(mtd));
+	nand_disconnect(mtd_to_nand(mtd));
+
+	/* Apply write protection after draining outstanding operations. */
+	gpiod_set_value(priv->gpiod_nwp, 1);
+	mtd_put_master(mtd);
 }
 
 #ifdef CONFIG_OF

-- 
2.53.0

