Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794082379;
	b=KuTrowi9go9B0DkJMsaGH68GckVsAYnZsMjARqakAoS+Zdz53dake/6Hl4JooZfV9uzv
	 0h1PT51TaQcKIA4Uij0BlsiCSxbC1CyfmPoljg1Kcio5hRThYmFZ07nVb1Ztw4Fe1Arnm
	 kQt3nukaIjHY0Wx4YAg7ZkH6mRve0ErNNAQwnzIgDikf3MINf5pa0G1Pg5dp/cR7nQ8zY
	 4n/hWFTmH8TbpWsIDieXnTJ48tqtXQLvmu+HCYBtvsSqx9/pJ+HYHbQxZXOiW3n1o/546
	 YEv15HSjMDM1YWYN7f16Dmo1yWefmllx1PN+SDtMdBAd3rw9iesimxg0yMbJuqiAGSQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794082379;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer;
	bh=ITiDeBlYByumad4I/LuK3iRUkjJJZT9G1thTcrVXBwo=;
	b=uE1jh/rRe5wmcoLcgwNHmBlzAcykwHBovm8xfdzNHLmf27EVJrbUdV4Z9ERTnClWW4xr
	 xiAI5XRoMkt454gLAIqCNcAJ54kDXB7YpH2eYXte8FJ8LKM5rxDdn6tWtzhnZVpVkqJMn
	 TMP8w4g+OBhu+eYiV+eCF/A825K2T/koNiMXz5oMgRjvgutp23K9ga92CmfF6cS7hUa/t
	 RIYbk52F3L4hNdb6jCJBOkJHP+hhtl3pi88js2EnejICf8GXadBJCR+eM1n6FgVaQiN47
	 fpIcRWbMS1pNNuNbLI5dM0tQpGfBiQhHChWiAaMZuuC+4d4hJCiGA15w7zkhp05VXFw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=gmail.com;
	spf=pass smtp.mailfrom=upstreamdata.ca;
	arc=none smtp.remote-ip=209.85.160.50
Received: from mail-oa1-f50.google.com (mail-oa1-f50.google.com [209.85.160.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1587D606A337
	for <linux-kernel@vger.kernel.org>; Sat,  7 Nov 2026 20:12:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1587D606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=upstreamdata.ca
Received: by mail-oa1-f50.google.com with SMTP id 586e51a60fabf-4a77dcc4ca0so4162fac.2
        for <linux-kernel@vger.kernel.org>; Sat, 07 Nov 2026 12:12:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794082378; x=1794687178;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ITiDeBlYByumad4I/LuK3iRUkjJJZT9G1thTcrVXBwo=;
        b=vQwzCg4WzrNV+r+I1h6b9QSIskK7ewuuD6weOSntRlSyHkP/aKuu8EtYp9J1YcBEer
         5tvRhYRYqJbSyv1D0oWLiE8KjHyTpzT4ydkK9PSS1QuUzfEQz65ibH4ZQDm+XkIyDDG0
         u64+atY0TxjwffwGAgTCwwHItO9O3PpnFG0b1AegUeVLjiwD5ssmoSRapTp8fmTwroqH
         /ZhdkWUFKM4FM+Yx3Gg1vw+coJBGDeKVXKlMTPqQVUWL08TttlXkEcrcI2TG4UshO66c
         Nll1Xb10Vc04SZ4UxFV3mWgVmzvWGT0QVjLNZOsP1jV/MmLATtfsnrn2lbmou44se3WA
         vlJQ==
X-Forwarded-Encrypted: i=1; AL+hErENpXepQxBMB0WNvuLr802egWMScqRFBQQxLoSsQpk7XEBPBo9PgV8ioGNQUgMAicjHDP3zeoFnYjqfC/s=@vger.kernel.org
X-Gm-Message-State: APuU4Z+qLDMKH3CV+mpRwONhdYEGwxtK5v5uZa0kubniEFDO0eoE/Xxy
	b68C5SM6e2w/rQ3UMY/FUGk/6rX08Axhq3Qh5MZts8jz3Qn2X+whUJ2rco1+g1kzsP0=
X-Gm-Gg: AYBFou0SKEkfBkF1q4nsxhBBAwf8SmoEdxdfc82ER3Xy1i9pYgwLcgKOK15NyqQx0ce
	FOYmgIQmiS/6nFwl1Feg028J++2FoP0shxkt3XM5gbtL0N2fkJEaA4/cpZPuy9tqe7YrZf0xoA8
	WoCeUPGIsUhaSBZN7bEw7b3wQdmGxsdvcmjymUaDd4Wia8fQZ9fdkg7oYbsdcI9NOZ1yZSfUQRM
	eASWDWKrOGeJrdwaYsMu9AhNhI3aIDRW1f12uQLaf4X+J5eFLzsL8bsdKFv1ToTnVWznMNyCFmM
	zivIpP5jMvygnqqui0Xcmtdnacjy+FiulMpK5dfN/FoMct2CjTdljeyNLXQi5knPgp3B5HDXK2C
	qA8UyRgUXrycoZQyR76LTC+2W0yOULj4bTsV4kXx3g8adDG36LpJsLmgXMzvGVA0tHRHFCMEoRm
	4shZkr8OY8vpCbieKEno+hFjasv58+Vm2yCr//0vgUIwhh7OXsG0kcHh5OsN/NhxeUtoQHqHrS3
	Jyz3rtxvJNH0Dso9rX8OqpQ2OoTKJVfrTNB77Oz8jnZ86n1kDTJ5FEgCGLXcM7UX+3S1L6DRZCN
	PLpWrKcxFVVMNGXDPKhe19hGJ8A/WByJ09jhhbFeSWQZveY0hHr3FjRDLzkp
X-Received: by 2002:a05:6871:7426:b0:456:5d8b:5681 with SMTP id 586e51a60fabf-4ad9869f851mr4516599fac.1.1794082377926;
        Sat, 07 Nov 2026 12:12:57 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4ade68aa561sm226096fac.5.2026.11.07.12.12.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 12:12:57 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sat, 07 Nov 2026 03:16:26 -0700
Subject: [PATCH 29/58] mtd: rawnand: ma35d1: retain open-handle state on
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
Message-Id: <20261107-submit-rawnand-retained-handle-lifetime-v1-v1-29-0181ef0cc4c8@gmail.com>
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

Unlink each chip before dropping its initial lifetime reference.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 .../mtd/nand/raw/nuvoton-ma35d1-nand-controller.c  | 44 +++++++++++++++++-----
 1 file changed, 34 insertions(+), 10 deletions(-)

diff --git a/drivers/mtd/nand/raw/nuvoton-ma35d1-nand-controller.c b/drivers/mtd/nand/raw/nuvoton-ma35d1-nand-controller.c
index f659d3a6b9ef..90bdf2635a44 100644
--- a/drivers/mtd/nand/raw/nuvoton-ma35d1-nand-controller.c
+++ b/drivers/mtd/nand/raw/nuvoton-ma35d1-nand-controller.c
@@ -849,6 +849,11 @@ static const struct nand_controller_ops ma35_nfc_ops = {
 	.exec_op = ma35_nfc_exec_op,
 };
 
+static void ma35_nand_chip_release(struct nand_chip *chip)
+{
+	kfree(container_of(chip, struct ma35_nand_chip, chip));
+}
+
 static int ma35_nand_chip_init(struct device *dev, struct ma35_nand_info *nand,
 			       struct device_node *np)
 {
@@ -866,8 +871,7 @@ static int ma35_nand_chip_init(struct device *dev, struct ma35_nand_info *nand,
 		return -EINVAL;
 	}
 
-	nvtnand = devm_kzalloc(dev, struct_size(nvtnand, sels, nsels),
-			       GFP_KERNEL);
+	nvtnand = kzalloc(struct_size(nvtnand, sels, nsels), GFP_KERNEL);
 	if (!nvtnand)
 		return -ENOMEM;
 
@@ -876,17 +880,19 @@ static int ma35_nand_chip_init(struct device *dev, struct ma35_nand_info *nand,
 		ret = of_property_read_u32_index(np, "reg", i, &cs);
 		if (ret) {
 			dev_err(dev, "reg property failure : %d\n", ret);
-			return ret;
+			goto free_chip;
 		}
 
 		if (cs >= MA35_MAX_NSELS) {
 			dev_err(dev, "invalid CS: %u\n", cs);
-			return -EINVAL;
+			ret = -EINVAL;
+			goto free_chip;
 		}
 
 		if (test_and_set_bit(cs, &nand->assigned_cs)) {
 			dev_err(dev, "CS %u already assigned\n", cs);
-			return -EINVAL;
+			ret = -EINVAL;
+			goto free_chip;
 		}
 
 		nvtnand->sels[i] = cs;
@@ -905,17 +911,27 @@ static int ma35_nand_chip_init(struct device *dev, struct ma35_nand_info *nand,
 	mtd_set_ooblayout(mtd, &ma35_ooblayout_ops);
 	ret = nand_scan(chip, nsels);
 	if (ret)
-		return ret;
+		goto free_chip;
+	ret = nand_set_release(chip, ma35_nand_chip_release);
+	if (ret) {
+		nand_cleanup(chip);
+		goto free_chip;
+	}
 
 	ret = mtd_device_register(mtd, NULL, 0);
 	if (ret) {
-		nand_cleanup(chip);
+		nand_disconnect(chip);
+		mtd_put_master(mtd);
 		return ret;
 	}
 
 	list_add_tail(&nvtnand->node, &nand->chips);
 
 	return 0;
+
+free_chip:
+	kfree(nvtnand);
+	return ret;
 }
 
 static void ma35_chips_cleanup(struct ma35_nand_info *nand)
@@ -928,8 +944,9 @@ static void ma35_chips_cleanup(struct ma35_nand_info *nand)
 		chip = &nvtnand->chip;
 		ret = mtd_device_unregister(nand_to_mtd(chip));
 		WARN_ON(ret);
-		nand_cleanup(chip);
+		nand_disconnect(chip);
 		list_del(&nvtnand->node);
+		mtd_put_master(nand_to_mtd(chip));
 	}
 }
 
@@ -948,16 +965,23 @@ static int ma35_nand_chips_init(struct device *dev, struct ma35_nand_info *nand)
 	return 0;
 }
 
+static void ma35_nand_release(struct nand_controller *controller)
+{
+	kfree(container_of(controller, struct ma35_nand_info, controller));
+}
+
 static int ma35_nand_probe(struct platform_device *pdev)
 {
 	struct ma35_nand_info *nand;
 	int ret = 0;
 
-	nand = devm_kzalloc(&pdev->dev, sizeof(*nand), GFP_KERNEL);
+	nand = kzalloc_obj(*nand);
 	if (!nand)
 		return -ENOMEM;
 
-	nand_controller_init(&nand->controller);
+	ret = devm_nand_controller_init(&pdev->dev, &nand->controller, ma35_nand_release);
+	if (ret)
+		return ret;
 	INIT_LIST_HEAD(&nand->chips);
 	nand->controller.ops = &ma35_nfc_ops;
 

-- 
2.53.0

