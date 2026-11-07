Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794082385;
	b=u0vKjHkpt6nmW+mamX0n7puLWXas0gM9SNs1wb/Hf4izIgzfsot4nsFPVEvH0UnUhp3z
	 lQsIlzrx4CpAQQrACV+24xuEqqEhOWQefPwjxFS6YgR8k+36ThsWkNujlEcrdNvmiHBaK
	 JrnVRzVisygBOkV/Mm8LJvnr1yLcOTagIc5iv1HYUNreH859Jx+MuScBMChNVBHyqKT+C
	 Y531JVeLymXsS5s3zOX+lQ83uGxM4fe6E8oAOMqDbYzFYzp2iJD0i8XPNMFklPP3oa5ki
	 v4jJMqLYnKaoTmsmEjxL7eEXMexMJkQPD2eL0k96Ha5qSy/1Bk3bBapPyojnx2T2zdg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794082385;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer;
	bh=XCEPTuAB8BTrLNvcVsDlta09WPBy7nz8SllM0LSIn30=;
	b=WbmYJ0HFLavWA/bcrhz/EsUSRgb5LVcytzZwR7p3mBi6uF6Pxnmxn6qeE2qzHGBrzP/P
	 u3i7Drfu2qNdBqlavE9br1JeUJNEJU1yWzoe0OI9ow1DE6nzeB/a+cP0o3m+KNMJmiAnj
	 zkVDMO+g8g+oYLrnYsEP4SmPXJTGbgLEENMgqWgwiZgKSDVngxlqe9JmKlkI+Mam5lU5c
	 5GMswivvgvDUNMhosvQjm7c1Tzvjmf1g441eY/q4NhssXHBEETJUmS8pceNTYJSgTOdDo
	 GWfx2L4wjAHlNlOMUkIR+YRFaYhIKVYBEAWGEcOSsK1VHE3MwoUVEl0iBOXnZak9jig==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=gmail.com;
	spf=pass smtp.mailfrom=upstreamdata.ca;
	arc=none smtp.remote-ip=209.85.167.178
Received: from mail-oi1-f178.google.com (mail-oi1-f178.google.com [209.85.167.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B70D7606D804
	for <linux-kernel@vger.kernel.org>; Sat,  7 Nov 2026 20:13:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B70D7606D804
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=upstreamdata.ca
Received: by mail-oi1-f178.google.com with SMTP id 5614622812f47-4d7034a99a9so4948b6e.3
        for <linux-kernel@vger.kernel.org>; Sat, 07 Nov 2026 12:13:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794082384; x=1794687184;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XCEPTuAB8BTrLNvcVsDlta09WPBy7nz8SllM0LSIn30=;
        b=O7zDVaw4ilKhFzqhJ8JPUgxOkmXmwMYTBhfjYIPPOsGR1iNZbuJdCPum7PgqHeBGgO
         QoViDcBj9ltENYlxybwz/IcBhZPbldRrOre2gaxqOr5sx+vNtpu/DyBMqh0ndeUoM7XR
         j2S+TC58SH2CEWR/laq7Y1+ojL7wHnml5clBUaQtP7Fw2KzMgtoumSWRVRJgpN5TAZ0r
         UFsT49E8ixB9wSqR2mmSlfwlHYr6+Tz2bZTi9B/9knToZ19rZlhwlNLGWW2x4JAhRLrK
         BvNHXcf+QRM7FjuJkATaLy79yKvo6QTv/1+IIsbXMucKekBu06dI1fv6ESWkVUnxyo4o
         b+WA==
X-Forwarded-Encrypted: i=1; AKwUvBzXe//iYTzLg9hEN4p3n01N6Rz9X5oClgpip/kaUk7dzjuG+kvZrnMpoOcKWKUgRWZZhuNYJm1MtNc8vlU=@vger.kernel.org
X-Gm-Message-State: APuU4Z+ZuR1k6iLmZmNIp1PEmmqoMQDCL68M9Mm6m9ngZ+VzzuHBfrBD
	bJkYVitciSxfwXbSCZz2cwajFwrYnRxHbaEuV9zpkOfmCVUXu9/7qzV21acj3RkYjnQ=
X-Gm-Gg: AYBFou2pGXVdwIODjIj82NMRgNUenNaG8uWRLfO1BZGRfwvcK7e7FeDxcohoRvdJrNo
	1Iixei/P36eR4YZMfcxUVFkUUQPLwoqzSy8FHqwq2dvhHhruU6Y8oXzE8QTNvk0nI6k1oZ4zOQf
	Z5e+4o4Km0tpn3rpm4NIQUec9T6as2uW73+VP+hejQeeNAcFhizj+52iDs3q2sxDGOUpcBGJMSr
	vxFOqgUJR90Q/FuavQ0Caa1xcB8rVlknoeP6cyz1U85/URqPn2NXcIQ0zYe0k+K53FWrkYOmjCx
	268hFkgEfguX3ytO0JfKzwVcgR3aN78fBSyZtbaOKJZxlwYzADqA0zkEmzcfxN52hxa78SPlXtD
	fNvyri/oVRCxami8izO1aZpCR/kBWrd3nV1nJNqaTsSeQNbHCKOGBUmQfxgu/mE1514ymuI5/pz
	EnwiDDi8AGAie65/lwYALGy8VvjvpWGu6cukUUhbbuRmTZN41h0LLGjaH2WB6awYP/2yfDjw2X5
	OA7IHLaPBwsBcd5z4/tUoD19nNKjmmH9TJpZu+69Jf7BaLU6d0wYEjC8mQMLrZBu6buVADFYR6j
	T/73Qar3KuwQRmo5j51SwbR7yK/gvLKgvv0l5dp51eY//5KSZPseb6yMcXqG
X-Received: by 2002:a05:6808:238c:b0:4f1:c824:fd06 with SMTP id 5614622812f47-567e14c28c5mr4851806b6e.14.1794082383637;
        Sat, 07 Nov 2026 12:13:03 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4ade68aa561sm226096fac.5.2026.11.07.12.13.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 12:13:03 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sat, 07 Nov 2026 03:16:28 -0700
Subject: [PATCH 31/58] mtd: rawnand: mxc: retain open-handle state on
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
Message-Id: <20261107-submit-rawnand-retained-handle-lifetime-v1-v1-31-0181ef0cc4c8@gmail.com>
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

Retain the embedded legacy controller and drain I/O before clock
disable.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/mxc_nand.c | 24 ++++++++++++++++++++----
 1 file changed, 20 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/nand/raw/mxc_nand.c b/drivers/mtd/nand/raw/mxc_nand.c
index 4d8b92e7e672..d9f1e57c1ebf 100644
--- a/drivers/mtd/nand/raw/mxc_nand.c
+++ b/drivers/mtd/nand/raw/mxc_nand.c
@@ -1686,6 +1686,11 @@ static const struct nand_controller_ops mxcnd_controller_ops = {
 	.exec_op = mxcnd_exec_op,
 };
 
+static void mxcnd_release(struct nand_controller *controller)
+{
+	kfree(container_of(controller, struct mxc_nand_host, nand.legacy.dummy_controller));
+}
+
 static int mxcnd_probe(struct platform_device *pdev)
 {
 	struct nand_chip *this;
@@ -1694,10 +1699,14 @@ static int mxcnd_probe(struct platform_device *pdev)
 	int err = 0;
 
 	/* Allocate memory for MTD device structure and private data */
-	host = devm_kzalloc(&pdev->dev, sizeof(struct mxc_nand_host),
-			GFP_KERNEL);
+	host = kzalloc_obj(*host);
 	if (!host)
 		return -ENOMEM;
+	this = &host->nand;
+	this->controller = &this->legacy.dummy_controller;
+	err = devm_nand_controller_init(&pdev->dev, this->controller, mxcnd_release);
+	if (err)
+		return err;
 
 	/* allocate a temporary buffer for the nand_scan_ident() */
 	host->data_buf = devm_kzalloc(&pdev->dev, PAGE_SIZE, GFP_KERNEL);
@@ -1796,9 +1805,15 @@ static int mxcnd_probe(struct platform_device *pdev)
 		goto escan;
 
 	/* Register the partitions */
-	err = mtd_device_parse_register(mtd, part_probes, NULL, NULL, 0);
+	err = nand_set_release(this, NULL);
 	if (err)
 		goto cleanup_nand;
+	err = mtd_device_parse_register(mtd, part_probes, NULL, NULL, 0);
+	if (err) {
+		nand_disconnect(this);
+		mtd_put_master(mtd);
+		goto escan;
+	}
 
 	platform_set_drvdata(pdev, host);
 
@@ -1821,9 +1836,10 @@ static void mxcnd_remove(struct platform_device *pdev)
 
 	ret = mtd_device_unregister(nand_to_mtd(chip));
 	WARN_ON(ret);
-	nand_cleanup(chip);
+	nand_disconnect(chip);
 	if (host->clk_act)
 		clk_disable_unprepare(host->clk);
+	mtd_put_master(nand_to_mtd(chip));
 }
 
 static struct platform_driver mxcnd_driver = {

-- 
2.53.0

