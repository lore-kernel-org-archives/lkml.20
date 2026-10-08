Received: from cstnet.cn (smtp81.cstnet.cn [159.226.251.81])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35322495ADA;
	Thu,  8 Oct 2026 18:15:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791483316; cv=none; b=NqNlOvjie63scXlx1Jn77z/IFYmTNJt17rCcoomqHBNHAah8g6Lr8Q9nbNgJ4NY2PE0s617CQ2az5NkYsAExpYMYhg4N5fgxavpBFL6kSwmksjmFVOL/YsHxl9jf8EZ4eVOL7PK3H2zbuIuIkyvl5CF/18DAW7g72ejjg9UjzS8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791483316; c=relaxed/simple;
	bh=xZ21tFHp7RDtgsRmHOmx2jXa72tHxMUieL75IS+Ij2c=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=cNYz3z8Lha7nQYXE9rU/iCysr/AAmVR2vdB7iye24Rj/JaRhfpQ+VEIvNSMAG1qivbsW976e48VouyAxHA0DBAmtfvic0hpgKgZM1JzoCXHeWyYCYowSowVm+tiih6iJF8GvI1akHweK3c8F3Lf2JUawVeWddDaxs0hFa1Xc4kU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from fc87d0ffb700.home.arpa (unknown [36.110.52.2])
	by APP-03 (Coremail) with SMTP id rQCowADn5zWg3cdqJDUQCg--.13033S2;
	Fri, 09 Oct 2026 02:14:56 +0800 (CST)
From: Haotian Zhang <vulab@iscas.ac.cn>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Romain Perier <romain.perier@collabora.com>
Cc: linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ASoC: rockchip: fix device node reference leak in rk3288_hdmi_analog
Date: Fri,  9 Oct 2026 02:14:59 +0800
Message-Id: <20261008181459.2762862-1-vulab@iscas.ac.cn>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:rQCowADn5zWg3cdqJDUQCg--.13033S2
X-Coremail-Antispam: 1UD129KBjvJXoWxXryDuF4fXFy3XrW8Cry8Xwb_yoW5uw47pa
	s5GFWavry8Gr48uw1Fy3WfZayS9Fn7t3yUJr47Wa1Syw13trs7Xr48Xr1UZFZ5JF9YkF1U
	Zr48AayxCw45Za7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUU9jb7Iv0xC_Kw4lb4IE77IF4wAFF20E14v26r4j6ryUM7CY07I2
	0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
	A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xII
	jxv20xvEc7CjxVAFwI0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwV
	C2z280aVCY1x0267AKxVW8Jr0_Cr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVAC
	Y4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r106r15McIj6I8E87Iv67AKxVW8JV
	WxJwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41lFIxGxcIEc7CjxVA2Y2ka
	0xkIwI1lc7CjxVAaw2AFwI0_Jw0_GFyl42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7
	v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF
	1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIx
	AIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI
	42IY6I8E87Iv67AKxVW8JVWxJwCI42IY6I8E87Iv6xkF7I0E14v26r4UJVWxJrUvcSsGvf
	C2KfnxnUUI43ZEXa7IU5qeHPUUUUU==
X-CM-SenderInfo: pyxotu46lvutnvoduhdfq/1tbiDAEOA2rHpfV+uQAAs6

snd_rk_mc_probe() acquires references to the codec and CPU device nodes
with of_parse_phandle() and stores them in the static rk_dailink, but the
driver never calls of_node_put() on them. All error paths and the success
path simply return, and the driver has no remove callback, so the
references are leaked for the whole lifetime of the card and each failed
or repeated probe leaks another pair. The same pattern was fixed for the
sibling rockchip_rt5645.c driver.

Release the codec and CPU device nodes on every probe error path and in a
new remove callback, and also drop the extra reference placed in args.np
by of_parse_phandle_with_fixed_args().

Fixes: eaae2ea73593 ("ASoC: rockchip: Add machine driver for RK3288 boards that use analog/HDMI")
Assisted-by: DeepSeek-V4.1-Flash
Signed-off-by: Haotian Zhang <vulab@iscas.ac.cn>
---
 sound/soc/rockchip/rk3288_hdmi_analog.c | 42 +++++++++++++++++++------
 1 file changed, 33 insertions(+), 9 deletions(-)

diff --git a/sound/soc/rockchip/rk3288_hdmi_analog.c b/sound/soc/rockchip/rk3288_hdmi_analog.c
index 541163ed56fc..9bb02d41d901 100644
--- a/sound/soc/rockchip/rk3288_hdmi_analog.c
+++ b/sound/soc/rockchip/rk3288_hdmi_analog.c
@@ -201,36 +201,59 @@ static int snd_rk_mc_probe(struct platform_device *pdev)
 	if (ret) {
 		dev_err(&pdev->dev,
 			"Unable to parse property 'rockchip,audio-codec'\n");
-		return ret;
+		goto put_codec_of_node;
 	}
 
 	ret = snd_soc_get_dai_name(&args, &rk_dailink.codecs[0].dai_name);
-	if (ret)
-		return dev_err_probe(&pdev->dev, ret,
-				     "Unable to get codec_dai_name\n");
+	of_node_put(args.np);
+	if (ret) {
+		dev_err_probe(&pdev->dev, ret,
+			      "Unable to get codec_dai_name\n");
+		goto put_codec_of_node;
+	}
 
 	rk_dailink.cpus->of_node = of_parse_phandle(np, "rockchip,i2s-controller",
 						  0);
 	if (!rk_dailink.cpus->of_node) {
 		dev_err(&pdev->dev,
 			"Property 'rockchip,i2s-controller' missing or invalid\n");
-		return -EINVAL;
+		ret = -EINVAL;
+		goto put_codec_of_node;
 	}
 
 	rk_dailink.platforms->of_node = rk_dailink.cpus->of_node;
 
 	ret = snd_soc_of_parse_audio_routing(card, "rockchip,routing");
 	if (ret)
-		return ret;
+		goto put_cpu_of_node;
 
 	snd_soc_card_set_drvdata(card, machine);
 
 	ret = devm_snd_soc_register_card(&pdev->dev, card);
-	if (ret)
-		return dev_err_probe(&pdev->dev, ret,
-				     "Soc register card failed\n");
+	if (ret) {
+		dev_err_probe(&pdev->dev, ret,
+			      "Soc register card failed\n");
+		goto put_cpu_of_node;
+	}
 
 	return 0;
+
+put_cpu_of_node:
+	of_node_put(rk_dailink.cpus->of_node);
+	rk_dailink.cpus->of_node = NULL;
+put_codec_of_node:
+	of_node_put(rk_dailink.codecs[0].of_node);
+	rk_dailink.codecs[0].of_node = NULL;
+
+	return ret;
+}
+
+static void snd_rk_mc_remove(struct platform_device *pdev)
+{
+	of_node_put(rk_dailink.cpus->of_node);
+	rk_dailink.cpus->of_node = NULL;
+	of_node_put(rk_dailink.codecs[0].of_node);
+	rk_dailink.codecs[0].of_node = NULL;
 }
 
 static const struct of_device_id rockchip_sound_of_match[] = {
@@ -242,6 +265,7 @@ MODULE_DEVICE_TABLE(of, rockchip_sound_of_match);
 
 static struct platform_driver rockchip_sound_driver = {
 	.probe = snd_rk_mc_probe,
+	.remove = snd_rk_mc_remove,
 	.driver = {
 		.name = DRV_NAME,
 		.pm = &snd_soc_pm_ops,
-- 
2.25.1

