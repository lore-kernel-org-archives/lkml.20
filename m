Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794364138;
	b=Eyjfd+XDdRZg63n7wES/wCBk3yqXgLmeqOovwHTchFVbSBnfuUY7LrWCnvqMj1sx2eXD
	 XHUl54XoEQjIE+egtxIPZATSAn30T1bk/RH3en66yZ9+Pomtzc25pi3FSeQrqAeWNcqwT
	 pbL2gVocRL+ZoTGzOrs+C/urZPWweq95tW1e1UFkSfGOVHAxfuPy9k63/hbiy22nelGLh
	 X3Ija/DOYzOleEuuSOEkPqWo5MqeCh6JqriL6Fwg8whXnf71Ly/fHaX0FBK2ld2Z7WAHB
	 owzEwpKNojgzzD0DCfBSyv2RBMhsdqaE/O4+5RhC6NlHZJjmeMCjfekbWB+2yY1WgJg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794364138;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=O32a4AiJGMwcCR/+4zjDOYox+W85VRB2HAzvlPxTqmU=;
	b=Kp7Jaxb9ZmtRt8lX8icrtwYbVhLFcqYzLudpifT0h1rESTqns1ge1lG0gvW+sXe/+4Ib
	 Z3wadhY0Kb1jmJwIa0cQ2T733xXSR4mFvtQJOuuVyfGVvPMMixuYNiYTGfvWQDjD7gX19
	 WcEGui9ncdcIB6fpHSral2wErh86y7b63jZrhnkR5qhq1J5YoSRPAM9FovvuTgBe4RJp7
	 ZtqbHIst/g3mvsc7x/jBD9hAfBSWdHIJVqtCBKHuj/qHci9LrCkJxWtg1pUxkZyV0Oi/g
	 CoweLleF5k3T5ROZCHphZcjgSTKmZ68bRJHdoj6noi45AS/xU0SIIp5yIz+rgnc/kMQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=urm5Wpo6;
	arc=none smtp.remote-ip=209.85.210.169
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5463D606A335
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 02:28:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5463D606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=urm5Wpo6
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-8b5efadd183so1279182b3a.1
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 18:28:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794364137; x=1794968937; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=O32a4AiJGMwcCR/+4zjDOYox+W85VRB2HAzvlPxTqmU=;
        b=urm5Wpo6Von7lDwPbrmT6beI/5qJ2yfOmVRcyJ+2i8dsZ6ESf4IddCDDbBL0c8y1tC
         pPjicmjFC5T5hq2qggvLCEt1UKGW6C0q+T5/MR6tQO/jKK9UJKgutCAjP5P5/d3Vlk0A
         +yhecjBbh8df0sHq8o+xkbEMKhI320DFBCEEZ/IzxAeAPgc+jhuRjt1P+PElwuRuv/aZ
         sU0fl+38DOrn/z+fBBHgiIoUvew/KYyAG7TUTV2DbmNJuN5vvOHos3pOdWadbbVaaQ3I
         XlvAHZaHB7j2yikWdSELncKOxpYw8TOcVLNouBpJ0AKwjnJeeqVjdw+ITxGy3BABkY8q
         ppUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794364137; x=1794968937;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=O32a4AiJGMwcCR/+4zjDOYox+W85VRB2HAzvlPxTqmU=;
        b=mbZvp0jTFAO4s/FRf/buYEAGsDDg2abJbYqnMEzshRUVyThvT6Y1DsJox9vteMkFAs
         6JP1gX0MUDp/CnEI4i1jVIc/e8VqV4zwgfTqPbITLa7eeHW6BK9nBzA+cJBbAC9185Wx
         CSW04q8D66sNvq8jdJYshzTyX8/JSq9cjtLmOo4ohnH5GhJTuwSEk8j3DFIxXbq/mtVv
         02JT6MivNNSNc3ZkhnNk5cWJY4qf4Ixx2Ic9tYpQpPTlWyNLGKuP//gM2C801sQwbNce
         OXRiT/Wsws1AaTRzIaygF9oachlJf7ywk5VFJW+Zshph8K35rfVfbM76GjYNz4d/NOEo
         8cvg==
X-Forwarded-Encrypted: i=1; AL+hErGt041IxNHPg0wEQXRlhNC91sweVTv778cD/9IQTggPzHpUhHOOtbUsf13NIzdTeJRc3PViqo7F8WMROgA=@vger.kernel.org
X-Gm-Message-State: APuU4Z/dL8yeS+agjU+bEPiQNWPkgiQbxBv/3XMqsQiRC1cRLcomJsPv
	J1GLMBFh2EZzeT91wPcj3mmR1dlg9+tV3sRU66hPZ24OfwUqwQoWuqxw
X-Gm-Gg: AYBFou3vsJsIqLs1Wnrlvnj+YF7tzSUXQ/flRI1UOQnYyMmrV2SURBh6FiOSKPtU/m+
	/9mzLOUrMEa7iMOtAm6u24BtMPXUUQCsu221widuhfnKs/6rLO1WA2xZYclisOr5gx1gIl32LcU
	E398kK7WuJW1uLNfonw7uMIYncKjWmL/icm9lE/ssawxa0/+0U2MLY8QAFJ4kEJWeyzc1m44DjF
	Ll7YkplvBkHgRo9cHvxj2Crj0TkZQQERfIs7hw7dOWzn6UH+/dCGeDw/efcLs9mAGcDKa25I0t4
	0Tgm1AkzIDXIjodXLFjpkSMgm3qH6Y6ytaC3ptW5iJTZIezKyljWqAY5+ORWSKjep0FbEuFy7M1
	vlDY/79vLGnuva4QaAxEiAfGY5LeVBbRo0bALfaHdgSLrfHPoQJRxLJSEwSqsZhbqNYmBLDuYvJ
	tDgdN0ksnEmSQ+DWNy8kGw9UWMI6aHKHyhgVNh7PrUUbd+XOAWVOuT3rBt9VVqYgmyXEu3JJRWZ
	koWpnZcXOvl6MNVketFTZg6K2cqxERbv/mECzz5F3szVtvKkIY4l7clTbqTmwZWF75iiq79d0c1
	VlRppVmJ3FIyQjSmXSvcfCIcvkHn8tbVlaVglndjIPAHscgNmJJODqXRdk//lUMOspTYgB7cOw8
	8RdsVo6PYdwAvL7PvLZOqYGicK6rWzEf3vnXMYr0Adq7OFQaxDIsoe9YTV8JWw9tWyxVXy9U/4l
	GMZA==
X-Received: by 2002:a05:6a21:1391:b0:3e1:9071:acb2 with SMTP id adf61e73a8af0-3f2ff2e0b6cmr821227637.33.1794364137319;
        Tue, 10 Nov 2026 18:28:57 -0800 (PST)
Received: from ryzen.lan ([2601:644:8000:37f::e34])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8baaa86ce5fsm1603153b3a.21.2026.11.10.18.28.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 18:28:56 -0800 (PST)
From: Rosen Penev <rosenp@gmail.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Dong Aisheng <aisheng.dong@nxp.com>,
	Guoniu Zhou <guoniu.zhou@nxp.com>,
	Jacopo Mondi <jacopo@jmondi.org>,
	Stefan Riedmueller <s.riedmueller@phytec.de>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Christian Hemp <c.hemp@phytec.de>,
	linux-media@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3] media: nxp: imx8-isi: remove kzalloc_objs
Date: Tue, 10 Nov 2026 18:28:22 -0800
Message-ID: <20261111022822.67474-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.56.0
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use a flexible array member to combine allocations.

It looks like pipes never gets freed anywhere. Meaning this effectively
fixes a memory leak.

Fixes: cf21f328fcaf ("media: nxp: Add i.MX8 ISI driver")
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 v3: use devm_kzalloc_flex
 v2: add fixes tag, fix typo, and move pdata assignment to original
 place.
 drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c | 10 ++++------
 drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h |  3 ++-
 2 files changed, 6 insertions(+), 7 deletions(-)

diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c
index 2005584a1215..dcf6c25d7faa 100644
--- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c
+++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c
@@ -473,24 +473,22 @@ static const struct dev_pm_ops mxc_isi_pm_ops = {
 
 static int mxc_isi_probe(struct platform_device *pdev)
 {
+	const struct mxc_isi_plat_data *pdata;
 	struct device *dev = &pdev->dev;
 	struct mxc_isi_dev *isi;
 	unsigned int dma_size;
 	unsigned int i;
 	int ret = 0;
 
-	isi = devm_kzalloc_obj(dev, *isi);
+	pdata = of_device_get_match_data(dev);
+	isi = devm_kzalloc_flex(dev, *isi, pipes, pdata->num_channels);
 	if (!isi)
 		return -ENOMEM;
 
 	isi->dev = dev;
 	platform_set_drvdata(pdev, isi);
 
-	isi->pdata = of_device_get_match_data(dev);
-
-	isi->pipes = kzalloc_objs(isi->pipes[0], isi->pdata->num_channels);
-	if (!isi->pipes)
-		return -ENOMEM;
+	isi->pdata = pdata;
 
 	isi->num_clks = devm_clk_bulk_get_all(dev, &isi->clks);
 	if (isi->num_clks < 0)
diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h
index 58b47335afc7..3165a65391c1 100644
--- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h
+++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h
@@ -297,7 +297,6 @@ struct mxc_isi_dev {
 	struct regmap			*gasket;
 
 	struct mxc_isi_crossbar		crossbar;
-	struct mxc_isi_pipe		*pipes;
 	struct mxc_isi_m2m		m2m;
 
 	struct media_device		media_dev;
@@ -305,6 +304,8 @@ struct mxc_isi_dev {
 	struct v4l2_async_notifier	notifier;
 
 	struct dentry			*debugfs_root;
+
+	struct mxc_isi_pipe		pipes[];
 };
 
 extern const struct mxc_gasket_ops mxc_imx8_gasket_ops;
-- 
2.56.0

