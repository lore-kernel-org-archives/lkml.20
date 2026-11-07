Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794082394;
	b=oI7FYdXlscKVfFdNv0SaKgBRfSf80GzHG45k3uZKl35ztgx5zEc/iNJrruGcV05BShrO
	 xrpBAF7xmB45N7g+brWWnYK42KgHmobxDKq/Qv7amHdcfujzXciWYrprc5TDIktLn9j8v
	 kPiEBPkcshsXX59NyfhgP2GvsO+5F/5QbGW1jKmkmG/wIoJxFMKPlXurAIKuXUjvmGz7o
	 JEJ/jvqG3hHanOLMbhXk9tyKgkwaeENiRmGwIt+2fGLUyw40iIPfERXw+VR+MS7RYEbZF
	 DEO6q+I2hXWm+Ds89H4Ya84mRhV+E/h8KcX5+ZhzGUqVdSPVoNyl+qPdFmXOGxbhwUQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794082394;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer;
	bh=D4/Oq4wk36wTCL/qJN9660jECjYdA2Mdyi8GAjYIaGs=;
	b=Tb8U2O/SoqOpCNl2B1VgECCJTeyuvvhXtMs4GjDFGCajVwAssqBdJ09vI0pi+wsJdPVJ
	 Eumt74/WwXKjtGQ8owuXqiopqq5SzJ+/Ab5lgqq/9n2tPUiFIOibpi+RRqgNwdalXNPF/
	 TrKNQSFa47g3q/LmZTnnDnWdd6dPgPBHTBpdiurfvswZy4tkAozDkNa9O6AhWHZ7ZJ1ih
	 0cTYrVh3gg9xFJbUAUoPwX6iQymvZdNhayEEaetDfRqTq00qexdhQFfumP+58n0VFcSGZ
	 N1xyFdI005+yNtpIf2NcFZ7sqYIJ+cZqJ5lgFIG5TtboQHM2UIsQKIQVcqT4y8KEd3w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=gmail.com;
	spf=pass smtp.mailfrom=upstreamdata.ca;
	arc=none smtp.remote-ip=209.85.161.48
Received: from mail-oo1-f48.google.com (mail-oo1-f48.google.com [209.85.161.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 529D3606A330
	for <linux-kernel@vger.kernel.org>; Sat,  7 Nov 2026 20:13:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 529D3606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=upstreamdata.ca
Received: by mail-oo1-f48.google.com with SMTP id 006d021491bc7-6df0b02fe91so449591eaf.0
        for <linux-kernel@vger.kernel.org>; Sat, 07 Nov 2026 12:13:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794082393; x=1794687193;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=D4/Oq4wk36wTCL/qJN9660jECjYdA2Mdyi8GAjYIaGs=;
        b=0VCUKC+Jxzk2yOMDk9CCbLBZjGWR+GsFDrO7y/1CQwG+mwsWNiI55EzdF0lYMYmkn7
         B+GbKehMq+46QhfbFJ7UOyvY3HfoDv79XBNWWHmcM83+nSdOdLgFhyoG1WZiI5lN60UA
         +0lLSk00KieBdPwPbbtBA5PFORIVXqDNsgoXRveLn74MP0CfJJ01fL8jTFVai7UqD/SX
         C0EyhOHQRd2a5rL4MqANT5LvRwGg2/4nOCeqJfavrroGXEco1dmeSMJGbX6s5Ouar1aA
         mop+YYzDezpaHfaaIQzJaRxX+AJjPit055uctxd/CfNJPDJFfaFXwYqbjXRhHLuA1xVG
         /6sw==
X-Forwarded-Encrypted: i=1; AKwUvBwx59wxlCO9LS+n7n3lN5nXr7FCECpm+u7Lms0VURv8mSIKvJdtm05k4FmM4IDe4Xhk28hJ7/Z/2r5bg0M=@vger.kernel.org
X-Gm-Message-State: APuU4Z/nEQEtPVeWovrxxsy/ROsH4q4QZeJASC5UKCzXzki0yJBmTCOh
	8BJrPKuvdQpMpenXJpa3rVlFWboKCaB3QSsgKXp6QutJOsrFTqpriI34ZkdAoxbiyAI=
X-Gm-Gg: AYBFou0CpNUcHf2wApr3KZ3UDTaTOalJaI2IQ7HAGs1wl7VEu5tZQ+hGfX4YWTXub/5
	I2h7nqhkf+dpu7fn6QV94dlxL9qd1yftPSgBN1cjP4VeG7RWQMxlFc5TxetkZHmG2/AcfYTuCq0
	Ug38UnUFgo64JHYi42KPvet9flyyuNoUrTSfFKr163quocAZxFL6ubyF4oPBIeBKyheppjdYtmS
	zxyMbERqSH1ny8cCtWnBZVZ0MshRh0OKXlZEuy0KWGKA2P/y0uQ/ls5ZQ28T3J1UCdMSkbJ+ew9
	48bTaP1PmqRdCwjR+/FtL4Y2JmYTVBToDUHJpN4c2Rr/ZXRVflrTmRaCoJ2AolEBMNQl5JVNTQk
	Mw1gxsKN2HMaQANBkxC5i56EvOKGF6vtFzC9t65zif09O+xM0rEIrdW1oe3UN/RZLm8mKTjHvCS
	oenyNQM8RQ8MK7axEttBS1ACsEu1fn+JCYr1enECz7Q7Ba5L/B3PR3xVxJ+C5CCYtnUYbum+zcJ
	6OtXqrNK+VMRMjyiiciYizgsohf2SFzvsm18SWtA+y36t9iPYWrOj722f2x/T7JeiNJ64rYr5sD
	ifBM1B7i3v1AQy6Wqk0VaIDNRMtpfXpoL7cmI0JIova/kBTGqplm9czNzAGnVw==
X-Received: by 2002:a05:6820:188b:b0:704:2628:b1ba with SMTP id 006d021491bc7-71700c850a0mr1064837eaf.23.1794082393182;
        Sat, 07 Nov 2026 12:13:13 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4ade68aa561sm226096fac.5.2026.11.07.12.13.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 12:13:12 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sat, 07 Nov 2026 03:16:31 -0700
Subject: [PATCH 34/58] mtd: rawnand: omap2: retain open-handle state on
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
Message-Id: <20261107-submit-rawnand-retained-handle-lifetime-v1-v1-34-0181ef0cc4c8@gmail.com>
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

Preserve the shared GPMC lock and separately retain each device's state.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/omap2.c | 45 ++++++++++++++++++++++++++++++++++++--------
 1 file changed, 37 insertions(+), 8 deletions(-)

diff --git a/drivers/mtd/nand/raw/omap2.c b/drivers/mtd/nand/raw/omap2.c
index 4909e62dc11e..9949d4d53299 100644
--- a/drivers/mtd/nand/raw/omap2.c
+++ b/drivers/mtd/nand/raw/omap2.c
@@ -142,6 +142,7 @@ static u_char bch8_vector[] = {0xf3, 0xdb, 0x14, 0x16, 0x8b, 0xd2, 0xbe, 0xcc,
 static u_char bch4_vector[] = {0x00, 0x6b, 0x31, 0xdd, 0x41, 0xbc, 0x10};
 
 struct omap_nand_info {
+	struct kref			refcnt;
 	struct nand_chip		nand;
 	struct platform_device		*pdev;
 
@@ -2208,6 +2209,24 @@ static const struct nand_controller_ops omap_nand_controller_ops = {
 static struct nand_controller omap_gpmc_controller;
 static bool omap_gpmc_controller_initialized;
 
+static void omap_nand_info_release(struct kref *ref)
+{
+	kfree(container_of(ref, struct omap_nand_info, refcnt));
+}
+
+static void omap_nand_info_put(void *data)
+{
+	struct omap_nand_info *info = data;
+
+	kref_put(&info->refcnt, omap_nand_info_release);
+}
+
+static void omap_nand_release(struct nand_chip *chip)
+{
+	rawnand_sw_bch_cleanup(chip);
+	omap_nand_info_put(mtd_to_omap(nand_to_mtd(chip)));
+}
+
 static int omap_nand_probe(struct platform_device *pdev)
 {
 	struct omap_nand_info		*info;
@@ -2218,10 +2237,13 @@ static int omap_nand_probe(struct platform_device *pdev)
 	struct device			*dev = &pdev->dev;
 	void __iomem *vaddr;
 
-	info = devm_kzalloc(&pdev->dev, sizeof(struct omap_nand_info),
-				GFP_KERNEL);
+	info = kzalloc_obj(*info);
 	if (!info)
 		return -ENOMEM;
+	kref_init(&info->refcnt);
+	err = devm_add_action_or_reset(dev, omap_nand_info_put, info);
+	if (err)
+		return err;
 
 	info->pdev = pdev;
 
@@ -2282,9 +2304,16 @@ static int omap_nand_probe(struct platform_device *pdev)
 	if (err)
 		goto return_error;
 
-	err = mtd_device_register(mtd, NULL, 0);
+	err = nand_set_release(nand_chip, omap_nand_release);
 	if (err)
 		goto cleanup_nand;
+	kref_get(&info->refcnt);
+	err = mtd_device_register(mtd, NULL, 0);
+	if (err) {
+		nand_disconnect(nand_chip);
+		mtd_put_master(mtd);
+		goto release_dma;
+	}
 
 	platform_set_drvdata(pdev, mtd);
 
@@ -2294,11 +2323,11 @@ static int omap_nand_probe(struct platform_device *pdev)
 	nand_cleanup(nand_chip);
 
 return_error:
+	rawnand_sw_bch_cleanup(nand_chip);
+release_dma:
 	if (!IS_ERR_OR_NULL(info->dma))
 		dma_release_channel(info->dma);
 
-	rawnand_sw_bch_cleanup(nand_chip);
-
 	return err;
 }
 
@@ -2308,12 +2337,12 @@ static void omap_nand_remove(struct platform_device *pdev)
 	struct nand_chip *nand_chip = mtd_to_nand(mtd);
 	struct omap_nand_info *info = mtd_to_omap(mtd);
 
-	rawnand_sw_bch_cleanup(nand_chip);
+	WARN_ON(mtd_device_unregister(mtd));
+	nand_disconnect(nand_chip);
 
 	if (info->dma)
 		dma_release_channel(info->dma);
-	WARN_ON(mtd_device_unregister(mtd));
-	nand_cleanup(nand_chip);
+	mtd_put_master(mtd);
 }
 
 static const struct of_device_id omap_nand_ids[] = {

-- 
2.53.0

