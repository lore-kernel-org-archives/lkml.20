Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793789328;
	b=AZVSWmmNfTeW0B/+AVpca31+koLJ6HFjm/le5qfM0jzO/1mJ15eN8y0Z9+OKjkZlpE70
	 XzmTDUAEJYj+X93yjTXue7Q9OshineqqnCZuqeMtWqLwfOJ4FcOZVksXKDEYaNmyUqApX
	 LL+hegVDFbDjpuxy1GLOPymcv3QOj85B1AT/O7/E9zzj002jL9Fqgd1O3ivEmi9GPHhjL
	 XaiZ0a9BPWs4lw9z3fPvGwfmPWS7uQg8aBN7wUziOKEKZ47o5vb0xxMZMV3WlqRk0230X
	 UJ2Y9FKi9oTpptZay53A5131RKs7yW781njg8IHcSARBCw6b8fYUP+PEJ+gpRjhh7XA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793789328;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=QtbqG07ZqasrjsOtWvFMIUfN1oH5l3jO6rDIKIN7V9s=;
	b=fJbFMiWmKS8A7RSq8+Jt1yNW3U0Wa7C8L0o4cHwjgTeKAbLGQVxXnwJZWwI7OnN1Mg3Y
	 QtDCY7VwLXWE9b5OEussOHyvhYFAvjdzI9moeat9tHezDuV8aXyU7zJQv8i9OkKzWW8G2
	 75aomwF4h+163hl/EKfCA0FjN3g+iRYoARKslckijf+7I7sn8TdmyRkB5AYbFwLJhqlxM
	 jjbb+5T4kuz7XRhWvGKRsNlEooUwrtf6FzGMYifIb7XmSOwtCaldPMQU4id4A33NHWuI/
	 G5jRJs/XFTM4Cq+dsUL2c+hk5Tk0RRg2YMoGykKj6Ht1zqqGFHNerjfywbtrSOXw3IQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b="XVFARjT/";
	arc=none smtp.remote-ip=209.85.128.49
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63C46606A32C
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 10:48:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 63C46606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=XVFARjT/
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4a2153c8525so3277275e9.3
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 02:48:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1793789326; x=1794394126; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=QtbqG07ZqasrjsOtWvFMIUfN1oH5l3jO6rDIKIN7V9s=;
        b=XVFARjT/H9wLsEjRYnPy1ANnD5h8SM/r9beRnFGPeyqSu3TPzFW3EZn9Z9RrtvOvJm
         Nba6QWsAJ4vCslFBJ0/xHTgz+C2BBHtl2VdxlNifeLh2ztuTUMzTG8nckVKE1KZkERGC
         dMlMhS/g7iiVnB3vKbl+AUJfZJkUO1NKXVObWvOGOPBDW8MYiK/dbibWGDqpbALgoC6o
         M3I16C86rb1nHXkuw9MteB1JybBkzemohApabxVxFJ2FajLf5BVeWyaT3XlyiHicX21m
         dXkArf6ni591Snly3rfXk32U/T9OkXrN+RgkscOwyFSaF2qTjBJAoYAb2TeajpYOfanJ
         clZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793789326; x=1794394126;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=QtbqG07ZqasrjsOtWvFMIUfN1oH5l3jO6rDIKIN7V9s=;
        b=GtyIdCkF/zmX6OMLPKuVjdl6HdH1NeTAHjGXptp+wJiCTh4rvruS/HZU816j7SlPUw
         axgydeF4g5KERHDygpKrQNbZE1B7TLWvNsgEyV5oCRI6eOxnAFgppxs3W4VHVmKkwJxv
         n6dJ/7KHWhUrmMThuWCiwws/N97TzEs63o0GHqO2/2Kl/ApMyxrWT94x6PaT/pYZZY/n
         Ljb2b59w29B//BEEN2lPyEvD0IA6JlgDZVnhzF4X5Yd6scB5ve0zWM15NQU4N0t2amH2
         vuyiGxhNsnPpp01GFSSG2uPj7EzIkyCCV//2KzNwt4R3FRmvpFaabd/eV+dVlb5tM2R0
         SK/g==
X-Forwarded-Encrypted: i=1; AKwUvBxafX5rb7RyzW41oeRJvU36gqfT+p81mNsa0jlqEh+tYcZJpUmVBAl/OYoncs2ng3apLm3CuU7IafCJ36Y=@vger.kernel.org
X-Gm-Message-State: APuU4Z9BQ49ZaDNJ26AQWlgGHzyB3z3IMH7kdwYy2H6JMOISlNbgn67Q
	KuErowvuNoizecvXnQNKmvIxpUZBoWFaHQaePWc46qNn4e/uLST7PPJ71E0QRJh6TzU=
X-Gm-Gg: AYBFou0djNZrh0Qo7oYXIzjI50l9OATPwfyQbBd/zgfdNipIYJ2pCnVDGOtXsXosQtp
	McL+x/XqrOF2EgPfyCav5K6y8D8s5H+/LW1CYAteFoYbvGcajIg+RIFnoJcfMaeA+znSkn4CrQL
	OF+cIO8yTIvCwRL9i479YcnO5pgj23juuRgbnkMHUNW+AkLlvfwdUxTyYLvOyvdrPML0PyHQtih
	MUEKYrZyvnQZPlNuTvqbRP8WuWAhCTBBNFd473T0V+13kFYkpsU0RG+vEzuyJbJIP0Gk+ICoTvj
	eaSJgZs4H5l01essUcP/SUtp9j2YDKV8+0JBA3wY6FEbxKhm0nj8ixZVt/dXqMSgF68INcRsLsq
	rTmM/mpRb2xxpvrXj1LGzIharQUj36aZRJLs2AIaFT8VonOVaW7nNycRFW8ICIu9K9/gyUakW80
	qjN55rQ6VhujBl8tL+NExumRyYGgnE7qb/WoVzodybNsVMxR6HcdmTO60ldnCuNIruwIXLj4G8Y
	2MHhGDPEstpPsTnTl9OOWnCHSvwNKFdR3i+bgQIkzdfWxOI7B0yIf+BjZiZKfrUb09CehaPuX6q
	jg9m1L+No4ddLcFkEnEAgQZS+cxsXXpHNRRaPIvRcuWPZJ2R
X-Received: by 2002:a05:600c:1c23:b0:4a2:47:b79c with SMTP id 5b1f17b1804b1-4ac180f2addmr415568325e9.32.1793789325659;
        Wed, 04 Nov 2026 02:48:45 -0800 (PST)
Received: from [127.0.1.1] ([151.61.248.197])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b2a80e184esm136455625e9.2.2026.11.04.02.48.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 02:48:43 -0800 (PST)
From: Valerio Setti <vsetti@baylibre.com>
Date: Wed, 04 Nov 2026 11:48:35 +0100
Subject: [PATCH] ASoC: fsl: imx-sgtl5000: release codec clock right after
 reading its rate
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
Message-Id: <20261104-imx-sgtl5000-cleanup-v1-1-62739fbb4a25@baylibre.com>
X-B4-Tracking: v=1; b=H4sIAIIN62oC/yXMSwqDQBBF0a1IjS2oNn7ArQQHpn0xFbQjXRoEc
 e/pJMMzuPcgQ1QYtdlBEW81fYUEl2fkH30YwTokUyFF7ZyUrPPONq5TJSLsJ/RhW/jSODRSohp
 QU0qXiLvuv+21+9u22xN+/b7oPD8+32steAAAAA==
X-Change-ID: 20261104-imx-sgtl5000-cleanup-371e704e5de6
To: Shengjiu Wang <shengjiu.wang@gmail.com>, Xiubo Li <Xiubo.Lee@gmail.com>, 
 Fabio Estevam <festevam@gmail.com>, Nicolin Chen <nicoleotsuka@gmail.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>
Cc: linux-sound@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Valerio Setti <vsetti@baylibre.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3504; i=vsetti@baylibre.com;
 h=from:subject:message-id; bh=ioLvTLPQ9whgkMJcbvVWkeDAXZlfFZobCdzIe0dI7xo=;
 b=owGbwMvMwCV2z3ty7kUrRgbG02pJDFmvedtyLG/E7rQ9UKBp77CEsZNvw7oJec4JDyW+H73J6
 9v/OHBPRykLgxgXg6yYIgvL9Hu/C0rVHhonnCyAmcPKBDKEgYtTACZyXoLhD7fllU59pXtZbBOD
 lT4ud685XSI5347ReNq5A1fjTNf+usfwT2NDfkjp8+tNc9Z93pHCG8nwgMk66xf/V4fK3NnJUcw
 P+AE=
X-Developer-Key: i=vsetti@baylibre.com; a=openpgp;
 fpr=0497DEFB707526E13360C970DE4B936DD13A0100

The 'codec_clk' is only used in 'probe' to read its rate, which is then
cached in clk_frequency and used by 'imx_sgtl5000_dai_init()'. Holding the
clk until 'remove()' serves no purpose.

Release the clock right after reading its rate. This allows turning
'codec_clk' into a local variable, simplifying the probe error path and
dropping the 'remove()' callback, which has nothing left to do.

Signed-off-by: Valerio Setti <vsetti@baylibre.com>
---
While reviewing [1] I realized that the driver could be simplified a bit.
'codec_clk' is only used in the 'probe()' function with 'clk_get_rate()',
so it can be a local variable there. Also it must be put when no more
used, still in the 'probe()' function.
This allows to remove 'imx_sgtl5000_remove()'.

This patch does not depend on [1] and they are addressing different things.
The two should apply cleanly on 7.4-rc1.

[1] https://lore.kernel.org/all/20261104022815.1484320-1-vulab@iscas.ac.cn/
---
 sound/soc/fsl/imx-sgtl5000.c | 24 +++++++-----------------
 1 file changed, 7 insertions(+), 17 deletions(-)

diff --git a/sound/soc/fsl/imx-sgtl5000.c b/sound/soc/fsl/imx-sgtl5000.c
index 8bcf54ef709e..032ea3e066bd 100644
--- a/sound/soc/fsl/imx-sgtl5000.c
+++ b/sound/soc/fsl/imx-sgtl5000.c
@@ -20,7 +20,6 @@ struct imx_sgtl5000_data {
 	struct snd_soc_card card;
 	char codec_dai_name[DAI_NAME_SIZE];
 	char platform_name[DAI_NAME_SIZE];
-	struct clk *codec_clk;
 	unsigned int clk_frequency;
 };
 
@@ -54,8 +53,9 @@ static int imx_sgtl5000_probe(struct platform_device *pdev)
 	struct device_node *ssi_np, *codec_np;
 	struct platform_device *ssi_pdev;
 	struct i2c_client *codec_dev;
-	struct imx_sgtl5000_data *data = NULL;
+	struct imx_sgtl5000_data *data;
 	struct snd_soc_dai_link_component *comp;
+	struct clk *codec_clk;
 	int int_port, ext_port;
 	int ret;
 
@@ -129,13 +129,14 @@ static int imx_sgtl5000_probe(struct platform_device *pdev)
 		goto put_device;
 	}
 
-	data->codec_clk = clk_get(&codec_dev->dev, NULL);
-	if (IS_ERR(data->codec_clk)) {
-		ret = PTR_ERR(data->codec_clk);
+	codec_clk = clk_get(&codec_dev->dev, NULL);
+	if (IS_ERR(codec_clk)) {
+		ret = PTR_ERR(codec_clk);
 		goto put_device;
 	}
 
-	data->clk_frequency = clk_get_rate(data->codec_clk);
+	data->clk_frequency = clk_get_rate(codec_clk);
+	clk_put(codec_clk);
 
 	data->dai.cpus		= &comp[0];
 	data->dai.codecs	= &comp[1];
@@ -185,22 +186,12 @@ static int imx_sgtl5000_probe(struct platform_device *pdev)
 put_device:
 	put_device(&codec_dev->dev);
 fail:
-	if (data && !IS_ERR(data->codec_clk))
-		clk_put(data->codec_clk);
 	of_node_put(ssi_np);
 	of_node_put(codec_np);
 
 	return ret;
 }
 
-static void imx_sgtl5000_remove(struct platform_device *pdev)
-{
-	struct snd_soc_card *card = platform_get_drvdata(pdev);
-	struct imx_sgtl5000_data *data = snd_soc_card_get_drvdata(card);
-
-	clk_put(data->codec_clk);
-}
-
 static const struct of_device_id imx_sgtl5000_dt_ids[] = {
 	{ .compatible = "fsl,imx-audio-sgtl5000", },
 	{ /* sentinel */ }
@@ -214,7 +205,6 @@ static struct platform_driver imx_sgtl5000_driver = {
 		.of_match_table = imx_sgtl5000_dt_ids,
 	},
 	.probe = imx_sgtl5000_probe,
-	.remove = imx_sgtl5000_remove,
 };
 module_platform_driver(imx_sgtl5000_driver);
 

---
base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
change-id: 20261104-imx-sgtl5000-cleanup-371e704e5de6

Best regards,
--  
Valerio Setti <vsetti@baylibre.com>

