Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794046646;
	b=cJbjkUG0akAAa+zP1azWWDuvZEPbWzakFChrqV7O5iwEtzufHZMInhEAic2ZT5hPGXWd
	 RRZUQlixA1Wi/9TnzG88yKKAFDmXCUA94eJNLORoTJBnucjhLXRgpMP0TLoPUfI9no3x4
	 7JDGv1RSffKMiV9E6BRT5zFNqpohBhCQloyhwmmeidpxLIP9iUJo1rZuQarxKo3HzQmkR
	 9fzsZpwqf7vha/p/jyXvKt3OP+ZrdriiMZkGOSHQrdHzvISKEu41ATeJET6l/YFBEbUqK
	 3TrgA9BvjIYb7gupMH7JJxHywG6x94g75jSLfq2AqEsc3d7vlDqHHQhRfpq0AUJ4mrQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794046646;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=+X9Wh0VhZwdXQo9xIloNpny3dCBPLPixF7cRCMQpCJE=;
	b=aNfpE47mSf5ZcM4QXpqu0TTdzB7rseQnOiNU40lz3C8Bw5LQbgjxhROyO+5KvbRO6DGE
	 22i4uLZpS1f+jGsN/BBxfiG9jisamWx7n6RKaylHxp6XepV0Euf0J3MdtTduLRhSdn79K
	 LaHhy5eyRJfFsxA+I+ov/0J0rCrANX/wrqmuLEQkkiZu5zWRtHCn2gOtXajs85hi+Nlaj
	 me+SE5fgfMYeHLm6+tV8erX4wBqIYZA6U0eDVY+dN0/v+I00k4TWiqXP6EO0EW0lQT7wR
	 5ypzYVcRigTI3VeVp+oBKdEysLdK9bj0kPaZKMZ9rJx0YPsOOYKZ18TN1htID0EVxxQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wv+CUEiY;
	arc=none smtp.remote-ip=209.85.210.45
Received: from mail-ot1-f45.google.com (mail-ot1-f45.google.com [209.85.210.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E968760A6F6D
	for <linux-kernel@vger.kernel.org>; Sat,  7 Nov 2026 10:17:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E968760A6F6D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wv+CUEiY
Received: by mail-ot1-f45.google.com with SMTP id 46e09a7af769-85f39332862so80487a34.3
        for <linux-kernel@vger.kernel.org>; Sat, 07 Nov 2026 02:17:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794046645; x=1794651445; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+X9Wh0VhZwdXQo9xIloNpny3dCBPLPixF7cRCMQpCJE=;
        b=wv+CUEiY1sM4sElwKxgUv9NKbQeOUHHQn6wXuba3Ug2bjjWgLy70VK5Mnav3QXiTpd
         st353wsHMixSLpOEbAnDd4KltfBjgXcqeCGJ90BSEBvLIXpOp7ghomeOpMA/ulvH5Twl
         LBATyUbjnfix3lnx9grIZNQHGcQQEamRYWVO5YWKRIuWxtNmAcMLZ3ApaxWFMHpr1S7H
         HcjXfP5p1AYzItg8ogqolZD1K2/ETu4AN6OHLmQSiAt1DqRy4GHkSJL4UuKLR10PFkSy
         Q7tjalz5vhFdAnBuC57W301PSCHUgLoveAjI5l8OgHo3fwT7MrDevwqeFgrhBxyOOtlb
         exEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794046645; x=1794651445;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+X9Wh0VhZwdXQo9xIloNpny3dCBPLPixF7cRCMQpCJE=;
        b=JmrisDU25VlCYbzJcCGEnvODBnsffo86261oonbGxARGQ2mkxnNniT9j48Na+pNTMk
         fjbAx6W78xhiOcrurGn/utMM/ASyK+F7UIa9dPMxF+dOw/yLI2CMtRPptNf6p/M3A+gR
         FsD9CVnHG3tjW6Re5jvCGvl3v0gd+PoqZrgMdPqOiII6acH+3F/suVDuCAUysCsoNW6m
         qSWIz5C6wtj14n1SFmCfkn51C8oZ0CaAE2LoMuXsXS4UQ7hekM4k1/v2TKUvScZiF639
         24TVWngGhk2zlpHriwDh+M/Zzo5nfZLNKyxUuJsDR1dQ+F6kOWIw9YZFIL4eLQqQ2ms4
         lNAw==
X-Forwarded-Encrypted: i=1; AKwUvBxKNtvKcktaF8vsCin2IlGBd8/22NrbcONoJLH5SXNRsGDF3og1prCYLoXxfplOGDDV+9jxoPAA9I7BW2Y=@vger.kernel.org
X-Gm-Message-State: APuU4Z/5E59Zl3u85r0ZEnA+k31VKHkmc6C6nVtjGqPzxW71vOV+dkmw
	W8AkKLfw1fpmXsnuGJhGfWoaSCRnRKEjJomq09bLrDg87LoGBg22ttGG
X-Gm-Gg: AYBFou0w1FFcuMIW5HOZ2owDE6FtZcdc0wB5WxS0tNwPM0XQeD7pBJiCz8nyLFZa1IS
	NQw6H9eCKrsUK+QNRLXGAKa59uCSdDzceIxbrG1U+172LNFPjotmGq1vx9zHJpfGyrNsO65Ms2b
	Hmml3nop0xjBPWNooHaYSMf3hUdb6lg7foXR1VWVgCAfmDCHiar0b+hizRY77zAn80Mu7R1IZmq
	3FNZ+1fJyrnDhj5TRUU8Ic1phg+VlkfTXCqz53u94ZEVX3/kAN08bhZARahAffovDIAtYtlH2gX
	1EAVAjJ9wKQCydISqyfIM0vBRjFtp7ETPxbvX0F5a8z8bJWlp4HXjXMPt2yjWtLBF+yQj/g8Wvk
	4qDt81qCFEkaWvzX4no13qFZVMLWMKDdVovYS195Q2a4ygbhla+W7zoUr1ffRN/2UyQIMSoCD9M
	EQG/W0CgFu4qYBdXCcjabp9p+ZvcRRMq/tFldqjuH1WpGIIswqucXzYWy89wB3yoWncbun1qoD4
	8vXw1LpBjjWd+jrmWF0SDThQHAiJq6Rw9htLBlKDK/78vYvsGmxnY3EQwlzy8FmZKUp3RdxZuJx
	EPZFJYdqG5j0IcUeWGhZ4Vqf3k0gqvkeUxMwq/OeEPQIIXhatPsD8OW/zfHpq/x5bSaABE0wXSe
	MJZzA0KVH5ycoB+5amobj7taxWeQqY778Pou4psszzjalccrKX3jmkuFmAP7ue+N7JHb9bhCFIG
	AxDsIyDoEiFrlbfl6JV93CQlB1BFiA0+LhQ19z3YQkt8IECbgtdQeX
X-Received: by 2002:a05:6830:2546:b0:834:200b:49b7 with SMTP id 46e09a7af769-85f1cf63bedmr4454506a34.17.1794046644873;
        Sat, 07 Nov 2026 02:17:24 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-85f1dbef224sm3990269a34.12.2026.11.07.02.17.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 02:17:24 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sat, 07 Nov 2026 03:16:18 -0700
Subject: [PATCH 21/58] mtd: rawnand: fsl_upm: retain open-handle state on
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
Message-Id: <20261107-submit-rawnand-retained-handle-lifetime-v1-v1-21-0181ef0cc4c8@gmail.com>
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

Also clean up scanned chips when partition registration fails.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/fsl_upm.c | 23 ++++++++++++++++++++---
 1 file changed, 20 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/nand/raw/fsl_upm.c b/drivers/mtd/nand/raw/fsl_upm.c
index f4dc990a8da1..bfa4f450d7c6 100644
--- a/drivers/mtd/nand/raw/fsl_upm.c
+++ b/drivers/mtd/nand/raw/fsl_upm.c
@@ -69,7 +69,16 @@ static int fun_chip_init(struct fsl_upm_nand *fun,
 	if (ret)
 		goto err;
 
+	ret = nand_set_release(&fun->chip, NULL);
+	if (ret) {
+		nand_cleanup(&fun->chip);
+		goto err;
+	}
 	ret = mtd_device_register(mtd, NULL, 0);
+	if (ret) {
+		nand_disconnect(&fun->chip);
+		mtd_put_master(mtd);
+	}
 err:
 	of_node_put(flash_np);
 	return ret;
@@ -160,6 +169,11 @@ static const struct nand_controller_ops fun_ops = {
 	.exec_op = fun_exec_op,
 };
 
+static void fun_release(struct nand_controller *controller)
+{
+	kfree(container_of(controller, struct fsl_upm_nand, base));
+}
+
 static int fun_probe(struct platform_device *ofdev)
 {
 	struct fsl_upm_nand *fun;
@@ -169,9 +183,12 @@ static int fun_probe(struct platform_device *ofdev)
 	int size;
 	int i;
 
-	fun = devm_kzalloc(&ofdev->dev, sizeof(*fun), GFP_KERNEL);
+	fun = kzalloc_obj(*fun);
 	if (!fun)
 		return -ENOMEM;
+	ret = devm_nand_controller_init(&ofdev->dev, &fun->base, fun_release);
+	if (ret)
+		return ret;
 
 	fun->io_base = devm_platform_get_and_ioremap_resource(ofdev, 0, &io_res);
 	if (IS_ERR(fun->io_base))
@@ -222,7 +239,6 @@ static int fun_probe(struct platform_device *ofdev)
 		}
 	}
 
-	nand_controller_init(&fun->base);
 	fun->base.ops = &fun_ops;
 	fun->dev = &ofdev->dev;
 
@@ -244,7 +260,8 @@ static void fun_remove(struct platform_device *ofdev)
 
 	ret = mtd_device_unregister(mtd);
 	WARN_ON(ret);
-	nand_cleanup(chip);
+	nand_disconnect(chip);
+	mtd_put_master(mtd);
 }
 
 static const struct of_device_id of_fun_match[] = {

-- 
2.53.0

