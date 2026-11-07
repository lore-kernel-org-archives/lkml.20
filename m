Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794082427;
	b=hC5XVsqjsigwWIkqqENvZltSTfuM3tdxrep4E/6BztNzzptst6PIYxEY7vW9EQcj55aZ
	 It6NS8RwiED6vM798FDWlTyP9r1ECMQHED/t3LeHa8OPzfYAyyz+IF3rFBUx034jkBGbg
	 oxJQJqS/zUVutj9IskDr3QhqXplebkBeapLy1n2Fjhz0ePRoa90KicoKLsGy0sxUClZzc
	 dIxHjp+H5ma6DH+YSMKmkGfPffl6CgokwG6Nysh2mYfo1jQ7j3ZAw3ekGvCzS+OlcmzIl
	 fsQl4SJxZ16/gUmwwzAvoPi4EmPoOLaTylF7Vs9ouTPxUX/2gC8thWhCu4ejByhl69Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794082427;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer;
	bh=Hvi6UIajIglEhxrzqUdlsFCj9Wr9GC9WiHiI7xVbplA=;
	b=Zdxj7/dZtzEjmn75tkKlIrEBbBbXsUE71CyQAD3Nxz6GQi2k3AIGradsgn/OYa3nTsnB
	 TdXv/xwQfbF3iJhOHHJD53cTJX6PamfPc4kSNPX86A2xDlsVGFBY1X+9A4qq+EKoYj5Dk
	 cmecrV8GSsNicN1psQTx4qF7Biw6ZF8IFsFopLTIDAwLuD7gx4qkaD2laTjqo07Cqb9Bj
	 LsdI9TCym1dEczotQbpvuMDYGho/PqZMs3+gXuOC/3YQkwMDx6XUFzsQC5B72w5QgJcKS
	 izY1VUJg23wYFPtAQrTFz5cMvLujWsmyrZwkP9Yh1WbkHAUmvQLN4Dv9CMo4UH5f5JQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=gmail.com;
	spf=pass smtp.mailfrom=upstreamdata.ca;
	arc=none smtp.remote-ip=209.85.210.52
Received: from mail-ot1-f52.google.com (mail-ot1-f52.google.com [209.85.210.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6D95606A333
	for <linux-kernel@vger.kernel.org>; Sat,  7 Nov 2026 20:13:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A6D95606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=upstreamdata.ca
Received: by mail-ot1-f52.google.com with SMTP id 46e09a7af769-8256106635eso415a34.0
        for <linux-kernel@vger.kernel.org>; Sat, 07 Nov 2026 12:13:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794082425; x=1794687225;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Hvi6UIajIglEhxrzqUdlsFCj9Wr9GC9WiHiI7xVbplA=;
        b=IhT2YNnk3Bbsh614xaC7gAHrknzgn8xUZVP5CW6GCUi1fSNdzkeuFRx7W6ZtdguF27
         jFl5TVINZwS0cI7lnAKBgvzNHgqcOHyggx+HxpROyNWdPq0Zskas9xKvKFPF0ZGKuCAU
         Abc31mLe+ynSP/0NCC0h+bKrJZo4zMgy+1F30KPOonYO74qp35YGcoUstkLYZ2LdOEZZ
         PMMzrHPIcNYmFisUHN0CT/+RhT3GmFFV62KtlvtoorpCumuxYXMLyDfV9mL26qzxTI8A
         n5fpC/6t+P/anTbcWKUwbaitJ2RMlEOSLWlkQXczX38oRihBU/x91zU8AD5MZUsYmy7Q
         cy0g==
X-Forwarded-Encrypted: i=1; AKwUvBwBjjVFZEtQSb8V7OvxTHN4Iw9ScKJBOu4jep3qCEcOhODoyuUfV5Ayduc4xTo0mqp3d4IdCovF0sqyep8=@vger.kernel.org
X-Gm-Message-State: APuU4Z/8To+1UB2cc8VZ5T2SgZih+LnakgqknaEX5S5JLw8JJTpJoObm
	mJJs7DDIeaP4u4DMgJJ/DEWacq5oEPQCdx6oiqxk6knzGJYuP4zr24ajq9Ne8TVfuzI=
X-Gm-Gg: AYBFou2Dyh9HLVoKcF2HE1dUp2b9A/iwduzR1R6KvPecI1bMjQZFrajze45XeJcdd66
	c272b5t2yOFlPA57kIXnSwtPdhGjgGS0YT70smIK6mWYpNVS1tGPfrvO6bZ3rQy4+joaZcBqGgz
	78rqpig5of+ckjknN6YALC0gqFSoZ68pQdJ/Y7jIVYkwnYIkcM5aEc8xCIVQHkuRpwaDWMPGAWh
	kB9URoHvz6Ih4rsvIcPnKA8YAUSZJQ/SIOT6Z3eHd10XiE4QSOqrByfCWB3XjWJT2Fv+exLjQrm
	cNpbxt4gtD2s34NXyZTwFESPrgyvAoLy9hXoBxKZZZ78ZcF8Yk7538eds0UMVL41rn2K3pYXArs
	bhHb67xOpC0IFw5dIM2EvsiF9cPRhK/NBQh100s3QLcPgWtPjsgkHN2wZgZWaZAOfVFZKg9VaTD
	HGv2ZbvU6r7PQ9vld4vHM8oHwwDaEEn6t4fxO89VPT5ryVHPE3yNXQzsgi9ua5NfUdi4NYquub7
	7nQSuDnPhsaPhxqeXxRPh5dlMqvKBMqq2/f6KcKfvwmeULU3DXgxpAslj45+6Rt9Iie+W7/yPVe
	OplChG91jmHIPpxxSpsYsEiZh9QQ3nNkXrRNecxicGlJd01H05ukkJREq535
X-Received: by 2002:a05:6808:1985:b0:55c:8ee:a9c4 with SMTP id 5614622812f47-567e115e036mr4539353b6e.43.1794082425397;
        Sat, 07 Nov 2026 12:13:45 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4ade68aa561sm226096fac.5.2026.11.07.12.13.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 12:13:44 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sat, 07 Nov 2026 03:16:42 -0700
Subject: [PATCH 45/58] mtd: rawnand: sh_flctl: retain chip state across
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
Message-Id: <20261107-submit-rawnand-retained-handle-lifetime-v1-v1-45-0181ef0cc4c8@gmail.com>
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

Unregister and disconnect the NAND chip before releasing the DMA
channel. Retain chip and controller storage until the last MTD reference
is dropped.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/sh_flctl.c | 25 +++++++++++++++++++++----
 1 file changed, 21 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/nand/raw/sh_flctl.c b/drivers/mtd/nand/raw/sh_flctl.c
index 97f733e481ff..291d809d0ea1 100644
--- a/drivers/mtd/nand/raw/sh_flctl.c
+++ b/drivers/mtd/nand/raw/sh_flctl.c
@@ -1109,6 +1109,11 @@ static struct sh_flctl_platform_data *flctl_parse_dt(struct device *dev)
 	return pdata;
 }
 
+static void flctl_release(struct nand_controller *controller)
+{
+	kfree(container_of(controller, struct sh_flctl, chip.legacy.dummy_controller));
+}
+
 static int flctl_probe(struct platform_device *pdev)
 {
 	struct resource *res;
@@ -1119,9 +1124,14 @@ static int flctl_probe(struct platform_device *pdev)
 	int ret;
 	int irq;
 
-	flctl = devm_kzalloc(&pdev->dev, sizeof(struct sh_flctl), GFP_KERNEL);
+	flctl = kzalloc_obj(*flctl);
 	if (!flctl)
 		return -ENOMEM;
+	nand = &flctl->chip;
+	nand->controller = &nand->legacy.dummy_controller;
+	ret = devm_nand_controller_init(&pdev->dev, nand->controller, flctl_release);
+	if (ret)
+		return ret;
 
 	flctl->reg = devm_platform_get_and_ioremap_resource(pdev, 0, &res);
 	if (IS_ERR(flctl->reg))
@@ -1187,9 +1197,15 @@ static int flctl_probe(struct platform_device *pdev)
 	if (ret)
 		goto err_chip;
 
-	ret = mtd_device_register(flctl_mtd, pdata->parts, pdata->nr_parts);
+	ret = nand_set_release(nand, NULL);
 	if (ret)
 		goto cleanup_nand;
+	ret = mtd_device_register(flctl_mtd, pdata->parts, pdata->nr_parts);
+	if (ret) {
+		nand_disconnect(nand);
+		mtd_put_master(flctl_mtd);
+		goto err_chip;
+	}
 
 	return 0;
 
@@ -1207,11 +1223,12 @@ static void flctl_remove(struct platform_device *pdev)
 	struct nand_chip *chip = &flctl->chip;
 	int ret;
 
-	flctl_release_dma(flctl);
 	ret = mtd_device_unregister(nand_to_mtd(chip));
 	WARN_ON(ret);
-	nand_cleanup(chip);
+	nand_disconnect(chip);
+	flctl_release_dma(flctl);
 	pm_runtime_disable(&pdev->dev);
+	mtd_put_master(nand_to_mtd(chip));
 }
 
 static struct platform_driver flctl_driver = {

-- 
2.53.0

