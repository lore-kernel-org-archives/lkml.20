Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794046640;
	b=ap6ujAOJNZ702YjYph4+OToH1dzz6Iz9USuCzCCrjy/C+46uHcKlu2pXUBUrtO3Ku9hB
	 ek+Dg/0pUzL8RF1kDX4sbUpuXnk2r51GOLKjPDNYZDdxsH1vRLNWe3iRqHRDTM0A2LBO0
	 WExCe0VBSmK03/x1as8SDiadgJCGkR1rNzL7IWY28wn4/mAOfTRHfeZi8pXfR7/3fC1A4
	 xq8fiMiHEv9OvxCBToDd2Ibytw4ZIwzGQlmEL93eoYzUkXnlfeBvbdne7gDwFsYgvc2be
	 VDF1VGtWD/YS0t+3Xg3YjJ2OlFOTMNPk/vzLMs/+DAhPK1hE5AWXd5ItPnyJ6PhhmUw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794046640;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=Z1GX3FC386wHtTixExxpffl4mL+VCVpguFEY1F+fIuc=;
	b=kVCKccz7BXbrmjAh4/zc6CBiYNaLNdCMlZbZDhk4gufaGLsazEcjHWMqROzosY98Nsrj
	 Y/rC8JSWoH/xN1vC3+gJmU0m0ZHzlomKOaV+bcUHV4hpxswlahqPkaMC+0kMIYkfgWwpX
	 6bGHpl6UHVX6a+KX+E56jupLd6MBFWBWaroVihevn7tCsTldBQrk1tEQWIZLa53I1nZA/
	 ZZNRKnozD2CfHptw+D1Xqv5u6jyfPR7dg6QZdr/mGdDiTcZW2mfNUaT0JUh/Ax/0FmPY8
	 QMZ5cAuH2Jn4nVSPInyWdwSb67UwEEhnxqJybjs7817aQCpm/kEx+msQUVNXmM/20dg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yHUgbn86;
	arc=none smtp.remote-ip=209.85.210.49
Received: from mail-ot1-f49.google.com (mail-ot1-f49.google.com [209.85.210.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DF11606EEA6
	for <linux-kernel@vger.kernel.org>; Sat,  7 Nov 2026 10:17:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1DF11606EEA6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yHUgbn86
Received: by mail-ot1-f49.google.com with SMTP id 46e09a7af769-8490a7d6696so973892a34.3
        for <linux-kernel@vger.kernel.org>; Sat, 07 Nov 2026 02:17:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794046639; x=1794651439; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Z1GX3FC386wHtTixExxpffl4mL+VCVpguFEY1F+fIuc=;
        b=yHUgbn86YqwQOiacZRyNmE3TVXyFkyf52wf/O92NFm1zTow3d+AyXnqY0kBJeOc1G+
         Mqqm7a1TeUjxxtja/U+7P2iWNyv8qfVOQ+5MhpVeB1MWUn1YhWkLJ75VQhX0oP4ZKmmG
         HpVOkjzToiDMSp21/T6J2W3tUI7a5IWD7+8riPB3ao0kFfp8br44JNVpwIpThD36x1qV
         Tu8oFiHQysf6s8JSKzCJy7K/y9z7JOM8nNzjbuHEoAmvCcXb/B6AjUpOOWjauTd6mWCo
         iWqOCBaWxoAHrN0VJXziRKXPl+bfyFJQbb3wRxMBezXITPUyyGNE9Hm6BiOmIybX/KE1
         D/Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794046639; x=1794651439;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Z1GX3FC386wHtTixExxpffl4mL+VCVpguFEY1F+fIuc=;
        b=ttD0fubku1KedvP5vJkw+ek0C6D4ScrRfzuC6D5t3vwbFPw0vqZDAzPXyAxPGlzyDi
         LjXY4h1lPfXvOMxIxv3fEREzLVLghxauJrLD4lJSORVy3SBoaAuRdxEyyKX0ICqsRw0L
         u6NQhjABBEuz+5Osr0kcyX2uO8H3SqfmcBXa/Oey2lefs6Hst76SCKzqIIDSxgcqhGWS
         fnfCSoq4sFQBVQ5e2omd6ooytTrbm11Een/AQFhsAeMLcHpMsir3yV6XpYrRDYeyKMwt
         vUN/0gCTN+txU8WzH5U7GpU0/0GoHok25kz8MoZSlXcOrPVMwJLEtb+KNOo4bRhEDyTb
         2D+A==
X-Forwarded-Encrypted: i=1; AKwUvBxDyMAnMTBp25a14AEBPzYYhXQokGBQkOZuFKIs1doyRQ786uBgbY66MUY0GpfGUXmJOF0b4MBlvHaOzJs=@vger.kernel.org
X-Gm-Message-State: APuU4Z8tY8IRW4wHWsyyrlFBLm00FvPz+NPhNBVq4e/7tEecdHsg7N9U
	mmrUpLbOcz7BJC0HsayIjCePEvhHahZqOawyIWvpy+eY9nurr6SBH8DW
X-Gm-Gg: AYBFou3tg52Tub6kMt3RWPHvRqWTmT0sxJq9kUCfTRyM9n2nnNJownPiKI/C2ImR10D
	1OVGZovuraGSjU5IwBLefkc6AsjDStZt0+ygoYE3obmho7PDrkFXJGeTh3LQb1wXHK/FNZ0AMV2
	c+JNBlkldDK0dlS6H4V3klcDAWd0SsH/ywtulVCGf6YEe3cdz2D5B1kKwm3CiVb181joij3Nasr
	z8ub5ZpvB1nAkVO2susG1LE95QAqhreeoqmE+6t3W/YK+BYvDcM1liT6s3cmvMhNWx+j/NZiEM+
	oykthgD8nD7Owd7GbqLttUwSy0Y25qgS40358DRVXDwWjr0tjXLO27SoIRF0YYqh7lJT9VXSXEb
	2h57Z5IItk7oF1AqRAh/3Q+OHq2tDe+Y85Gau0vdCxMcEF4LsQsRh1A3DgS2Eew8SiwMahCWwQ0
	uCHSv+W+PqX7Z5nPemNn3VLxsfO0JA4bPZrzlAnMYYG2Dx+k6me0uYW7OCWKt2FlQW2fU9KqB8o
	/in7rliz5XUr3wAMJUppQv60hlT/l4FAtfDJLaR0eJVIcs48gK6DD1gIAsw7N4BfdIt4B0gko/S
	7fNsrJmKzThTnQqmZQBUb8MZkgEuvrNy0jjB6u3VG4rFWd93iOAV3BK5bDN7HOwX5M1DowRSotM
	ogMdw2PsztbNuuw9gp6pjwKcGqOWvW0TdyyczCDR3+TVJFyaE/SKFU5yFn10TmE4cx4KhOrTK+I
	z2sn/jwEyx0j5fZkQG1HsBxRzZuDF5Vbtav8hHHw4e4OrLlFNWSkO78Q==
X-Received: by 2002:a05:6830:34a6:b0:85d:44ee:607d with SMTP id 46e09a7af769-85f1cbf2fa6mr4361234a34.0.1794046639191;
        Sat, 07 Nov 2026 02:17:19 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-85f1dbef224sm3990269a34.12.2026.11.07.02.17.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 02:17:18 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sat, 07 Nov 2026 03:16:16 -0700
Subject: [PATCH 19/58] mtd: rawnand: orion: retain open-handle state on
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
Message-Id: <20261107-submit-rawnand-retained-handle-lifetime-v1-v1-19-0181ef0cc4c8@gmail.com>
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

Retain the embedded chip and its copied name through the shared
allocation.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/orion_nand.c | 27 ++++++++++++++++++++-------
 1 file changed, 20 insertions(+), 7 deletions(-)

diff --git a/drivers/mtd/nand/raw/orion_nand.c b/drivers/mtd/nand/raw/orion_nand.c
index 47e80d5e58c5..aae054e47db5 100644
--- a/drivers/mtd/nand/raw/orion_nand.c
+++ b/drivers/mtd/nand/raw/orion_nand.c
@@ -96,6 +96,11 @@ static const struct nand_controller_ops orion_nand_ops = {
 	.attach_chip = orion_nand_attach_chip,
 };
 
+static void orion_nand_release(struct nand_controller *controller)
+{
+	kfree(container_of(controller, struct orion_nand_info, controller));
+}
+
 static int __init orion_nand_probe(struct platform_device *pdev)
 {
 	struct orion_nand_info *info;
@@ -106,15 +111,15 @@ static int __init orion_nand_probe(struct platform_device *pdev)
 	int ret = 0;
 	u32 val = 0;
 
-	info = devm_kzalloc(&pdev->dev,
-			sizeof(struct orion_nand_info),
-			GFP_KERNEL);
+	info = kzalloc_obj(*info);
 	if (!info)
 		return -ENOMEM;
+	ret = devm_nand_controller_init(&pdev->dev, &info->controller, orion_nand_release);
+	if (ret)
+		return ret;
 	nc = &info->chip;
 	mtd = nand_to_mtd(nc);
 
-	nand_controller_init(&info->controller);
 	info->controller.ops = &orion_nand_ops;
 	nc->controller = &info->controller;
 
@@ -186,9 +191,16 @@ static int __init orion_nand_probe(struct platform_device *pdev)
 		return ret;
 
 	mtd->name = "orion_nand";
-	ret = mtd_device_register(mtd, board->parts, board->nr_parts);
-	if (ret)
+	ret = nand_set_release(nc, NULL);
+	if (ret) {
 		nand_cleanup(nc);
+		return ret;
+	}
+	ret = mtd_device_register(mtd, board->parts, board->nr_parts);
+	if (ret) {
+		nand_disconnect(nc);
+		mtd_put_master(mtd);
+	}
 
 	return ret;
 }
@@ -202,7 +214,8 @@ static void orion_nand_remove(struct platform_device *pdev)
 	ret = mtd_device_unregister(nand_to_mtd(chip));
 	WARN_ON(ret);
 
-	nand_cleanup(chip);
+	nand_disconnect(chip);
+	mtd_put_master(nand_to_mtd(chip));
 }
 
 #ifdef CONFIG_OF

-- 
2.53.0

