Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794082418;
	b=FdkFztEzz+EfdjK2My5b9MVFYQoRTGA0MW1xuFQkjwBjZ8dTDbq6N8oVZn7NYpkW/6tS
	 sVxdTJqCXLRA6c2yn7C1EOijX2l3bwDx65t3Nc4yDnf8h/niNnt18q3gSG3UOnGW/ggal
	 +olvZs550A9DywEa9y0reWMcrTvX342qZTlDOqjcN9U6rT0/OPnbEohOafmY3oaMBbTK9
	 WQp7hzBcUTMbFpNVK1RqA5Ad4X/hSUYsusRlKzwgn7kA8Ny3/QJPxewMxHGyepYJtvEqB
	 cyqndtIge2diPl1i+ajL05tlY90UFWG3/M0r7kHKOF4FeqoEcqUB7KdjKB/RKVIX6gw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794082418;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer;
	bh=JrxepS2J9VPceqdGkgV52/qe1YoRSs0JHMfO/RKE6Vo=;
	b=aZTBWWDaEZafIdxXDwlvxP6vZfuZxDP5mkm0LfInnzcT8Z15/tC9jWw3yEI19A/3sdz2
	 1xNnXSbn2PkxX+r2YI0t9lpZlkIz3dN5FE2+RxL05wWOe3zwjOOMsN60CtdfO9n4ZnUN4
	 jXXbnPbp5Dy04/mvW75epAVb8OETSryJvWq49jRo3fY+cXZeGa2kFmnrODOb08pfyZ/J4
	 3sFq5uSapm2S/LOamryvuSOiBi7mvP3f+Rxsx/1ueInwUs/Rc6iQoeLljw5+JtjWNddmc
	 H09q6IMZyaNxQPIhB/4N5DTxf5PoPcIYH31k6Ywvp5/YHllR5lM0rEl+cbzMnDRztKw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=gmail.com;
	spf=pass smtp.mailfrom=upstreamdata.ca;
	arc=none smtp.remote-ip=209.85.210.44
Received: from mail-ot1-f44.google.com (mail-ot1-f44.google.com [209.85.210.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFA4B606EE92
	for <linux-kernel@vger.kernel.org>; Sat,  7 Nov 2026 20:13:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AFA4B606EE92
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=upstreamdata.ca
Received: by mail-ot1-f44.google.com with SMTP id 46e09a7af769-845788309b4so807971a34.1
        for <linux-kernel@vger.kernel.org>; Sat, 07 Nov 2026 12:13:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794082416; x=1794687216;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JrxepS2J9VPceqdGkgV52/qe1YoRSs0JHMfO/RKE6Vo=;
        b=tnTUjf+NsJV9gtRtodPJXqoPLwWbPEWtuUN3/malEskc/CzwaPfy+wGYKYOvNQqisz
         5PX8TjNVUgsSXxSLRKwNocBNjplNhC8wdoMWnt6//Esn3tgILpbzVHi8cd8Zy5KFd3/o
         EKnLY1gZxmHjMGPSbkRWd0IptGY/Qb2rPhjj9uXR2uXzyf9fWET/rsusZtBcm1TDppAA
         4KbwxTSX4oLbZAN8+2T+ve5DvrGSEWdf5URq29pylDUd2jgr7Lpt16mxXwOCVBRgLNyi
         y9hIk59xiQdwuKMZHInoZZlCP7C5TapwiUG+4P0Lwy8mvH7zKwYYzPtieFlBUiDPnj6s
         2k/w==
X-Forwarded-Encrypted: i=1; AKwUvBxALTFyOxwyHDNDHw5iNhOf2NqINJpeMbvzGNwnHtL60E6OAoKwoavXs6C5E8RNK1npmH97J5W6NdmVl7s=@vger.kernel.org
X-Gm-Message-State: APuU4Z9z8LhnKbqFLLtX5BKFRUX3FH9iAV+fLGVyS2Dv2nXCCFOZ6ERF
	hu2wh9sDgGEUKiOYWcJUpWxn3nngssaIMc2FcCYYPrH8ph/pfQMftU2cM0z6Pe2CUvs=
X-Gm-Gg: AYBFou0Juc0jiZa68KsYrGcdePlwlpH/u9ArAAgbiO/7NbWNNTwK3buiWKdPZb3jcH+
	A8m+JJkv0nTXENR6m5cieenv6tNBiny5Nf53No/9ApvcbtzwUDrL8PpR0P7hFwDw3VFXLfwyCxL
	TF/7btt7XBpivzsu5ElOAwVYnhpRfZASY5cXvyMo5+SHUW3xuT2wgS7CFsENsc2K1HK0UCsDC25
	1VOpFwX789u2B1iaStgEpgDq7aNO9AYH5GsXoFqHZgzlJP5+sOVw78c6tuH+jMlROqc95kqzMcX
	GmHAH7HGcad1HyXKpTvWM/GrkoHCvIhUBJIJKhjkNPI0G7u8sOn6mPQ3s2mADCnDgKgxqfl+xlv
	D7xaFQyTjNoRzZZYQM5ApHZmYxr0N/Yr6IRlDXodLBQe9qx9b6CUSRPD0lWHG8xst+AMqJVrcf4
	VdKW79KRRkqC/FzWQKvw18Dyyy49t8nJVO/zdPvSH+y9Ufpwtiq/MwLhj/BchwKLnNR1g7FSCVa
	+6BZsLVQWERq7ohdU9HQQ9kwKGaJ27B4FBdzzHV7yOPj3nwf0PrOM6fXfCqMWNNczYO3t5CAexH
	z+VO5ZDBujXIgB5sxRc87DP5QsTZETwoJ3qLyBghqD3V9DTGzWtP4cu09zAZ
X-Received: by 2002:a05:6820:60b:b0:6b7:46fa:1693 with SMTP id 006d021491bc7-7170f2e8271mr15281eaf.40.1794082416544;
        Sat, 07 Nov 2026 12:13:36 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4ade68aa561sm226096fac.5.2026.11.07.12.13.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 12:13:36 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sat, 07 Nov 2026 03:16:39 -0700
Subject: [PATCH 42/58] mtd: rawnand: au1550nd: retain chip state across
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
Message-Id: <20261107-submit-rawnand-retained-handle-lifetime-v1-v1-42-0181ef0cc4c8@gmail.com>
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

Drain NAND access before unmapping the chip-select window, and retain
the chip and controller until the final MTD reference is released. Check
MTD registration errors so unsuccessful publication releases the same
ownership.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/au1550nd.c | 26 +++++++++++++++++++++-----
 1 file changed, 21 insertions(+), 5 deletions(-)

diff --git a/drivers/mtd/nand/raw/au1550nd.c b/drivers/mtd/nand/raw/au1550nd.c
index f1e99197ab84..bd78bcc84282 100644
--- a/drivers/mtd/nand/raw/au1550nd.c
+++ b/drivers/mtd/nand/raw/au1550nd.c
@@ -251,6 +251,11 @@ static const struct nand_controller_ops au1550nd_ops = {
 	.attach_chip = au1550nd_attach_chip,
 };
 
+static void au1550nd_release(struct nand_controller *controller)
+{
+	kfree(container_of(controller, struct au1550nd_ctx, controller));
+}
+
 static int au1550nd_probe(struct platform_device *pdev)
 {
 	struct au1550nd_platdata *pd;
@@ -269,6 +274,9 @@ static int au1550nd_probe(struct platform_device *pdev)
 	ctx = kzalloc_obj(*ctx);
 	if (!ctx)
 		return -ENOMEM;
+	ret = devm_nand_controller_init(&pdev->dev, &ctx->controller, au1550nd_release);
+	if (ret)
+		return ret;
 
 	r = platform_get_resource(pdev, IORESOURCE_MEM, 0);
 	if (!r) {
@@ -302,7 +310,6 @@ static int au1550nd_probe(struct platform_device *pdev)
 	}
 	ctx->cs = cs;
 
-	nand_controller_init(&ctx->controller);
 	ctx->controller.ops = &au1550nd_ops;
 	this->controller = &ctx->controller;
 
@@ -322,7 +329,17 @@ static int au1550nd_probe(struct platform_device *pdev)
 		goto out3;
 	}
 
-	mtd_device_register(mtd, pd->parts, pd->num_parts);
+	ret = nand_set_release(this, NULL);
+	if (ret) {
+		nand_cleanup(this);
+		goto out3;
+	}
+	ret = mtd_device_register(mtd, pd->parts, pd->num_parts);
+	if (ret) {
+		nand_disconnect(this);
+		mtd_put_master(mtd);
+		goto out3;
+	}
 
 	platform_set_drvdata(pdev, ctx);
 
@@ -333,7 +350,6 @@ static int au1550nd_probe(struct platform_device *pdev)
 out2:
 	release_mem_region(r->start, resource_size(r));
 out1:
-	kfree(ctx);
 	return ret;
 }
 
@@ -346,10 +362,10 @@ static void au1550nd_remove(struct platform_device *pdev)
 
 	ret = mtd_device_unregister(nand_to_mtd(chip));
 	WARN_ON(ret);
-	nand_cleanup(chip);
+	nand_disconnect(chip);
 	iounmap(ctx->base);
 	release_mem_region(r->start, 0x1000);
-	kfree(ctx);
+	mtd_put_master(nand_to_mtd(chip));
 }
 
 static struct platform_driver au1550nd_driver = {

-- 
2.53.0

