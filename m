Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794046649;
	b=RFTMGPO43Cq384qIXUAA1wlwIBrpxqO/EdM9iVhIGxnfLyqbc/JdpVpdx12NjEiYinXd
	 c0P5uMdTzfIeL9wCvWPqj0b48XsKrwE+hlOi34H9DdtuGO3O0tRMm/G6yzl1fYSE+I87d
	 kWYSfll9TFfSRhGgiVFroWl1Bct7uCzXV4/QkSLJ8ye7/VFQ5JUB+75JJ0sQKjiMcGqI7
	 LYFaxcKDR0cxDEbLN0ncbWvDOAbPeIN1/xH5m0ZLiU0le4N3vrQfrxZHbiOuX6X0+wKoz
	 0QVFfreDmcZQ0YrnfA4FgLyTFaAEYoS6taxMMqncCykEJdeJM3ii84Xg+goFARPDQfA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794046649;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=FiM3FdgX/n0U5FfSnJDnohTAFRzhZZoozip4F2zbWJU=;
	b=KNNIrVdmd7vBQMQ8YxLqNgKmx11pXmyDgj52nPdDza2QtNzI9dosZT55bngit3/LVSo9
	 Sderlq9xYMrwUop8MAjFb2/v9ZFiJcwmsS9Hx5c/KMghpBDy9hPwl6/mmaLJGQbQ4WHpC
	 AsSHHoXN0MOTdj+RqbSbHuH7AnsDOwe453kV2eFHeDPpTRxlRU6sCCTJLdTyK4m7MbXaJ
	 2DDv9AdxvZQT5lcvxwDn84THotCTmImVDDA+p/bkBMMZvcLqi+686dyoMnOALCEBEzBtX
	 RZvVPjmVLS83ViXNMXU0J+V5rP61IzZS7PVvjpK1BGbQ8uxdHkDLvqaeH5FyaD9c2mg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zQSJNtam;
	arc=none smtp.remote-ip=209.85.210.41
Received: from mail-ot1-f41.google.com (mail-ot1-f41.google.com [209.85.210.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5297608D966
	for <linux-kernel@vger.kernel.org>; Sat,  7 Nov 2026 10:17:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B5297608D966
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zQSJNtam
Received: by mail-ot1-f41.google.com with SMTP id 46e09a7af769-843b6f8e2c7so1882145a34.1
        for <linux-kernel@vger.kernel.org>; Sat, 07 Nov 2026 02:17:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794046647; x=1794651447; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FiM3FdgX/n0U5FfSnJDnohTAFRzhZZoozip4F2zbWJU=;
        b=zQSJNtamhK5SrvhCY6qJK7P2GezzcQ77DYD3sYjRLULvrn1hy8viO3/ptg4ahw+t+T
         gY1SnDZ/2WzQuZXBrp3PVyhaII0cm0UAlYH+eBsPIBTvDG6L1OVKkhg5Pm9jIb64ySGc
         xu98+BrvSRilZ8CztSrSAWXFFaUjRxRqV+EW3bNUbjJ4KLOXBQ4PPVQip4OBQGKbMLcE
         3+lBZD52VHWHZSRJS5mLRKEUEjHO8gKLRUT3Z57ftGTAlfnYbB9+UKvkuebdIHaBfT1D
         UPr0uCtIlKt4/eaYmPO/8uG/eH1/GH2IOqfax9dre5G/486CMtclECzKfyO0G7dg2MgW
         V/Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794046647; x=1794651447;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FiM3FdgX/n0U5FfSnJDnohTAFRzhZZoozip4F2zbWJU=;
        b=Li/7bqL5Fxi/tbLMO4rYleOtuBqEJIWcobFKExtnbR+TA2pX9JwKW+uCPXHb45VqOy
         zC/n4qEoma11GUMDTlbP942jPSDvSjpB3ihwSeJEKw7BS2FLW92zfAy3eX5KHM9S6eXb
         kGtnTZB2DN9WeeQ04wSz2LzKtmzcNfajevm2WXCgEf3CipBCR4QtbjwwbKle3YbP8opL
         8Wn89JII6f1T5uzXd5QAD7o4u5LjVqvVmQEEcEHLhSmvdd1HAof78aCtvEU78PUSI6pr
         IsVZOmzLQXsFefJ/YQqwyTJAIOOQzxhxjlAuAHiCkVEI97hrccwN5yEo6QXD4Ix318D+
         JOsw==
X-Forwarded-Encrypted: i=1; AKwUvBxqMBKCqfzf3inf+PlLi/68wdKumPyIEZP4OndCKKrJNachBjRmhMJKx2jZG30Gul5zKmayQVaKTV7W53s=@vger.kernel.org
X-Gm-Message-State: APuU4Z+Z2Q9BiuI8kjgLMVwJUOewGgS9wjxTzKe6O1FlQvTPftoJwV3/
	yN22Q38cMUe4rIHgYfuDOlw65DnJ0GCkUxMWHCk5VU8cRa+5TN7m8psM
X-Gm-Gg: AYBFou36KIdh3Fhc5PotFDztNMl3BqpTA+Y0NmQX5deMWTMezMLn3d4aj8EEzl2niV+
	UdgfsKPW54gGZOdTJV9UDQ/wQ/2zCuM+ejjegGC3fw/D4oFIbWhYF3fwA8DzHdfI84NUTSQj4I/
	r5b4TH7lYwpuZj9vislbbhxK3p73HRnKd1ylNN1z/PFVQZTGMRaeH9OuoJ/uxw8muHYC1x5uu/X
	PGmibUze2Fqxbh9hqLsL7kwH96lSKZ+eBr7AWpL+7aOVPwLE8hdesul9aSmXSuzd5b3xio7DuPV
	tDrTsbjpT2t1GtQnIKbM7MrceFyMB6hZysw58GKfXn1f0ksPzGrYYGK2fI1SRdDj41cQP4JtOCR
	e17ZuS32R6QsVsOxGFZLSZjuei+c0XHMK++LQIE0GPmcXjWx0lHGOyaCa3PnLUUXdbIF9sktuY0
	pUoFIQJHpGOrigryWrBc63ge+oxXfLyaA5SowHxFdVZSvGvlAuTEQhpuQogUdW0NNqLDbHAXJye
	a9I6+km8A0U6/rXxh6ZxOQo7/fNC0dqwWw5lExlnikAAoFZVZlXCM46DVvwSpNJFJAY8RWsm2Nf
	VenHfoHOGPVHb138dMhgftUssSSDxC/liTZbOuQE+xJC3tMx2wxxrotZhSEysqRB7yBSjb0EKY2
	a7sx6uQAXRvbGDpy8d72ztJp/rW07NMC0NWVwZksnfsmbZNVsMGD0HkggYEl50YA01O8YggOq8W
	NU0fDIrC2A0iSK2nfnKqgvARMGsGerXHGSwGugn3mVr2CEA0Q/VGgh
X-Received: by 2002:a05:6830:4c0e:b0:846:7d51:d9d7 with SMTP id 46e09a7af769-85f1d18bb98mr4287417a34.28.1794046647554;
        Sat, 07 Nov 2026 02:17:27 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-85f1dbef224sm3990269a34.12.2026.11.07.02.17.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 02:17:27 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sat, 07 Nov 2026 03:16:19 -0700
Subject: [PATCH 22/58] mtd: rawnand: pasemi: retain open-handle state on
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
Message-Id: <20261107-submit-rawnand-retained-handle-lifetime-v1-v1-22-0181ef0cc4c8@gmail.com>
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

Release the LPC region and NAND mapping after disconnection.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/pasemi_nand.c | 25 +++++++++++++++++--------
 1 file changed, 17 insertions(+), 8 deletions(-)

diff --git a/drivers/mtd/nand/raw/pasemi_nand.c b/drivers/mtd/nand/raw/pasemi_nand.c
index 09409b703d93..d00d57cbb0f1 100644
--- a/drivers/mtd/nand/raw/pasemi_nand.c
+++ b/drivers/mtd/nand/raw/pasemi_nand.c
@@ -93,6 +93,11 @@ static const struct nand_controller_ops pasemi_ops = {
 	.attach_chip = pasemi_attach_chip,
 };
 
+static void pasemi_nand_release(struct nand_controller *controller)
+{
+	kfree(container_of(controller, struct pasemi_ddata, controller));
+}
+
 static int pasemi_nand_probe(struct platform_device *ofdev)
 {
 	struct device *dev = &ofdev->dev;
@@ -122,8 +127,10 @@ static int pasemi_nand_probe(struct platform_device *ofdev)
 	chip = &ddata->chip;
 	controller = &ddata->controller;
 
+	err = devm_nand_controller_init(dev, controller, pasemi_nand_release);
+	if (err)
+		return err;
 	controller->ops = &pasemi_ops;
-	nand_controller_init(controller);
 	chip->controller = controller;
 
 	pasemi_nand_mtd = nand_to_mtd(chip);
@@ -136,7 +143,7 @@ static int pasemi_nand_probe(struct platform_device *ofdev)
 
 	if (!chip->legacy.IO_ADDR_R) {
 		err = -EIO;
-		goto out_mtd;
+		goto out;
 	}
 
 	pdev = pci_get_device(PCI_VENDOR_ID_PASEMI, 0xa008, NULL);
@@ -174,10 +181,15 @@ static int pasemi_nand_probe(struct platform_device *ofdev)
 	if (err)
 		goto out_lpc;
 
+	err = nand_set_release(chip, NULL);
+	if (err)
+		goto out_cleanup_nand;
 	if (mtd_device_register(pasemi_nand_mtd, NULL, 0)) {
 		dev_err(dev, "Unable to register MTD device\n");
 		err = -ENODEV;
-		goto out_cleanup_nand;
+		nand_disconnect(chip);
+		mtd_put_master(pasemi_nand_mtd);
+		goto out_lpc;
 	}
 
 	dev_info(dev, "PA Semi NAND flash at %pR, control at I/O %x\n", &res,
@@ -191,8 +203,6 @@ static int pasemi_nand_probe(struct platform_device *ofdev)
 	release_region(ddata->lpcctl, 4);
  out_ior:
 	iounmap(chip->legacy.IO_ADDR_R);
- out_mtd:
-	kfree(ddata);
  out:
 	return err;
 }
@@ -210,14 +220,13 @@ static void pasemi_nand_remove(struct platform_device *ofdev)
 	/* Release resources, unregister device */
 	ret = mtd_device_unregister(pasemi_nand_mtd);
 	WARN_ON(ret);
-	nand_cleanup(chip);
+	nand_disconnect(chip);
 
 	release_region(ddata->lpcctl, 4);
 
 	iounmap(chip->legacy.IO_ADDR_R);
 
-	/* Free the MTD device structure */
-	kfree(ddata);
+	mtd_put_master(pasemi_nand_mtd);
 }
 
 static const struct of_device_id pasemi_nand_match[] =

-- 
2.53.0

