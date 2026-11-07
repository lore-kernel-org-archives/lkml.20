Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794079355;
	b=0vz5/oue/xid8JHrA2Bon+7DBh0NMwxeQy4HAUc+6TK/XjFk84Bwn0HgNWPthumw/8aX
	 UIfyjxS3MTMu0fh2MjXU0lLJ9Uy6C7SOCFeYSEdskkMgiLh63dLr4zfOePECszzwTiOOa
	 4nwYIX7y40gjrHisBPzc7dn2Vi4v2DlNS7tWHXkEeEfBziR6dqG4M2uU8Q3H/QBBOP8jm
	 Uzq4ulKQqbqsqysXLuj0wsQ1bCK4gDmgAJvHwPwg7HLLr26bGPB+osBF28FhSlU7EFF3K
	 NUVvWGva2WmzLlD2vXidKTP+zUxKc+Cdk1v3KVRCF6To7m7qdY5pgW/1vZy5OPoDWtg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794079355;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=0BAmvwUewoGLOJLuXxq6dZ5RycZKZl8yqwoNBMJWREA=;
	b=gH14iD4Jq48qJ+QlHm3sYzI0Gr93FIIm9jLkB8yBCn1CIAPIkhzFknhXfJZQ2wrGNLD3
	 l3yzETKVsPhdOyk//ThICF8vIukSUnTFOPohFvqKxx7Zlds4Go7bVtuznyc5oC1gA97HE
	 Ll+/sIde7Ybvq7+ZClGbpmykO7PXjj/ma4K0msyxRQwZzbWd8ES6gWOl0WeCYsdKkbRnW
	 UjRYUbNzJNtUuwIpaGQgFBsCJUJ5kDRCQmipqY0rboqlzrhPDW5FkCVW9hSP2j96wfnTS
	 +OWcVLlXltA+COIosBCJpDlHKE1gU40fZN6m/5eVAUVkUkqGjCrvm9F68DWs3DL8k4g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mdF0nwO3;
	arc=none smtp.remote-ip=209.85.160.49
Received: from mail-oa1-f49.google.com (mail-oa1-f49.google.com [209.85.160.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DB52606A331
	for <linux-kernel@vger.kernel.org>; Sat,  7 Nov 2026 19:22:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3DB52606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mdF0nwO3
Received: by mail-oa1-f49.google.com with SMTP id 586e51a60fabf-4ad60ec5eaaso2804fac.0
        for <linux-kernel@vger.kernel.org>; Sat, 07 Nov 2026 11:22:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794079354; x=1794684154; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0BAmvwUewoGLOJLuXxq6dZ5RycZKZl8yqwoNBMJWREA=;
        b=mdF0nwO3y7oNPZ7zBn4Fn3kwYBHgxQIQwK8zVuKkEwuYQHGGsfxHLOli5wpZ9mL9Qg
         OmAfl8QpEU0Z382zIaaS7EiE0pcQV4IkfSf2cO2568UgRAUamivkF7yBLAzX1oLqF9nK
         1NhiXIfHo4HQ9cheT6rM/GTul1qqucLf3HC4Vsp7+NVXvVZQTHqeE+KdBHQ+M7JWVFaq
         s2WmOgNdtpk5vAdUMuisKqlxi2uX/qb8HeMjPzF3T83Y6uZeV6pDEzZJ3wJ9VwBoH0ew
         jByvNVus/fIVfVAEqfOIqTNS7yECH9iSb2HkvCu//5Ss+tRcfTeQnP8iTFvQPKWfD2IM
         2UPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794079354; x=1794684154;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0BAmvwUewoGLOJLuXxq6dZ5RycZKZl8yqwoNBMJWREA=;
        b=PDn/1rcnYsyUqoszSk2fbkk6mxIA5+H3pCCTAl5xKb0yHhwA1TJjlm6E2m+PULUfCH
         I8CI2/sCE9pya4JeEnARArszYbgeENVwxLY+Uj/3wnwVK40RtFX6j9+MCcV7Cpf6nvfX
         NEa7hPdjJYn/um5G/YKpn1co7nH3VHfS5GW5DuMUN87E35jCmJ7x/QQvbTdE5eyU97uR
         NuXbX+PTJb8c0vKYEtrCdDFXFBfBNxnznqmeAxQk0yR7y5Y0LL64+3Hsx7dSj9RPz7+z
         mPeth9eNuop3V6EsbPq822nawnnl3TQDzdEykdZ0Sg2uQ+MurVI4NnNwfnZSS3baraPd
         r5Zg==
X-Forwarded-Encrypted: i=1; AL+hErFJgDXQB3jRKwU0C8EGYszw0aOFRj2Xva9FpJ3HTJ2CF7RNRwYjt0J0rqaI7qo5D9FShr312HRidunr7qc=@vger.kernel.org
X-Gm-Message-State: APuU4Z/YCjBI0EeBOuJ8CvcPi0bR1JIF5ILaJYLaOF+ophaJcGWemZLk
	g99ilsCHcviqpqU0OKYQ20RkQvm4BA4hWLXhdk4E9f+LtLpRmHUGBfPa
X-Gm-Gg: AYBFou25bkJpwcnrldtCvDaQMfRi4VIgV4/crOMnIa9SbupwhamY8Lx+zA1ZCnepd+8
	PlNV5HptLdyj+iO6igSUHjUtTRcptQVweE7/LxjAZI7dI2v6bLXRQPyXqjr96hdpxAMh9n/aJ16
	QeKUEbndwfk8NG6a2+uJk8NDND7W4TaCEQNeaQFhsi7oEdvbuy7BlLLXN+WLlPBmbfKO8rBLPxT
	CFswvPdZvoozWiq9Eez+c/s4CKKXUcK0CQ8FXDf7C4HL8vo4UNUGi1txzJ1WMOAWFFdfaZrfmcD
	n5xfCCYFftU42VCZoNePyr0DAv57Ys7ftNT78XXwg/4aAhZ29RhSHyZP6egPJdsc7bfXuKI5/9/
	0BvRpjW6mbY4jC16zBIzHFMeXk68rjUHqcCxxQl0b9RoVdS2rjDVOZTVoJyr6/TnmE1hztfM1bY
	+La7LYmY86P2x2hcj/9YFE71KyB+5/sTqpdtyo8GOC8DsjCSerAP1IgWjY6h+Nh6k7zvrD9IgED
	BfeOORHj1XvPH0WCLI99CR3HgUH9lH4uNCjdf06Lr3g6iVv2oBX8j8bamOlvkHOLJN4gix8oohd
	ARCWmdSURqFF88ousn8fuLJaQdddh/E9b9/FImFWX4mljkv7r56Uec1N17b5TlVmB23YfDU7Igx
	v8drcbwiansG5y2HZNOwj6RACeWSrYBu/JjDZw9puUQQfAUkdaFacNqSc7V2GalR2fxYf5CSVEo
	lJlRYYAUI8KZ1pz0XwpE37dieMCRZGV37xR0kQOsiFhYxbKbWYtJG4
X-Received: by 2002:a05:6870:b909:b0:49d:c800:c431 with SMTP id 586e51a60fabf-4adc0db6cc1mr1204864fac.28.1794079354066;
        Sat, 07 Nov 2026 11:22:34 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4ade647f559sm167644fac.2.2026.11.07.11.22.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 11:22:33 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sat, 07 Nov 2026 03:16:22 -0700
Subject: [PATCH 25/58] mtd: rawnand: hisi504: retain open-handle state on
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
Message-Id: <20261107-submit-rawnand-retained-handle-lifetime-v1-v1-25-0181ef0cc4c8@gmail.com>
References: =?utf-8?q?=3C20261107-submit-rawnand-retained-handle-lifetime-v1?=
 =?utf-8?q?-v1-0-0181ef0cc4c8=40gmail=2Ecom=3E?=
In-Reply-To: =?utf-8?q?=3C20261107-submit-rawnand-retained-handle-lifetime-v?=
 =?utf-8?q?1-v1-0-0181ef0cc4c8=40gmail=2Ecom=3E?=
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

Retain the host through its embedded legacy controller.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/hisi504_nand.c | 23 ++++++++++++++++++++---
 1 file changed, 20 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/nand/raw/hisi504_nand.c b/drivers/mtd/nand/raw/hisi504_nand.c
index d97270ec1185..36427a242c2b 100644
--- a/drivers/mtd/nand/raw/hisi504_nand.c
+++ b/drivers/mtd/nand/raw/hisi504_nand.c
@@ -731,6 +731,11 @@ static const struct nand_controller_ops hisi_nfc_controller_ops = {
 	.attach_chip = hisi_nfc_attach_chip,
 };
 
+static void hisi_nfc_release(struct nand_controller *controller)
+{
+	kfree(container_of(controller, struct hinfc_host, chip.legacy.dummy_controller));
+}
+
 static int hisi_nfc_probe(struct platform_device *pdev)
 {
 	int ret = 0, irq, max_chips = HINFC504_MAX_CHIP;
@@ -740,9 +745,14 @@ static int hisi_nfc_probe(struct platform_device *pdev)
 	struct mtd_info   *mtd;
 	struct device_node *np = dev->of_node;
 
-	host = devm_kzalloc(dev, sizeof(*host), GFP_KERNEL);
+	host = kzalloc_obj(*host);
 	if (!host)
 		return -ENOMEM;
+	chip = &host->chip;
+	chip->controller = &chip->legacy.dummy_controller;
+	ret = devm_nand_controller_init(dev, chip->controller, hisi_nfc_release);
+	if (ret)
+		return ret;
 	host->dev = dev;
 
 	platform_set_drvdata(pdev, host);
@@ -788,10 +798,16 @@ static int hisi_nfc_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
+	ret = nand_set_release(chip, NULL);
+	if (ret) {
+		nand_cleanup(chip);
+		return ret;
+	}
 	ret = mtd_device_register(mtd, NULL, 0);
 	if (ret) {
 		dev_err(dev, "Err MTD partition=%d\n", ret);
-		nand_cleanup(chip);
+		nand_disconnect(chip);
+		mtd_put_master(mtd);
 		return ret;
 	}
 
@@ -806,7 +822,8 @@ static void hisi_nfc_remove(struct platform_device *pdev)
 
 	ret = mtd_device_unregister(nand_to_mtd(chip));
 	WARN_ON(ret);
-	nand_cleanup(chip);
+	nand_disconnect(chip);
+	mtd_put_master(nand_to_mtd(chip));
 }
 
 #ifdef CONFIG_PM_SLEEP

-- 
2.53.0

