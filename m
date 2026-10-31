Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=220.197.31.3
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793447169;
	b=OcQeG1pJIrUUMTsEnGHAZA6rEhGu5AnvCOCsL5BsWVst+IGWKUrD8PHjP+7GonUT4ymW
	 OidaV0QQ48euesirv/csZVunkCVCbbfSgOFUPEQqtYVvGiOMhLo1lb3xR2O6qcscDfjzk
	 wbHjkQWu+tAjlVuuxqlH4//FE+CC/h/WUKpBXNCaBsTn3DX4tYKLLYBy/JEHYrzmANdhE
	 RvAb0zw+W107xngxO2x5ab9Mh++GuBSJFqoad7ItZ2IwymKc3axHXa4CqzKWs1k7GPHgt
	 aeMJqmIKtoPGAP4/0Wpv00rWAEC4g4ePY/7dQM7Nbt0tT7sIUeIWOSoK+iiWGMCVshQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793447169;
	h=DMARC-Filter:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-CM-TRANSID:X-Coremail-Antispam:
	 X-CM-SenderInfo;
	bh=9yLH4z5SuPSiBo6vqjLp3kNCi1UZ/Xaxh+x3gvmmR1U=;
	b=W3hwRIKMIfy3tlQrOWR+Ov3MDbY3+oc93QeazcTQBHjY6DBJYyJ6xLMsDpROsi/OmvIF
	 R1ZFBDSwc2QOeAS5evjESJP0hVzdTz+8NUxhXdOdinylF5FdOEKikMyLqhim6IiDZov3s
	 JFljmuh/uufkDRhfa3NVI1mHUITURLJg7tMFmdPd56g1Asw07TD8wmRDcAxCg86s1pPCe
	 RAOnDPrwdYNSJ2ve3BcremK+hccho5u0IRfwkXQkBTYQ4QtMjkQDieKC3P0oQMKPSHM6B
	 eqibfFXP5CaezRCn0Mbyu0mwOgQ9CgQfsUO8d0otgHAMvDSMrFnloeHjsb6RFyzO79g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=163.com;
	spf=pass smtp.mailfrom=163.com;
	dkim=pass header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=nDS50Yoo;
	arc=none smtp.remote-ip=220.197.31.3
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 645DF606A31A;
	Sat, 31 Oct 2026 11:46:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 645DF606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=nDS50Yoo
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Date:Subject:MIME-Version:Content-Type:
	Message-Id:To; bh=9yLH4z5SuPSiBo6vqjLp3kNCi1UZ/Xaxh+x3gvmmR1U=;
	b=nDS50YoorH7KsJxwaVfJI2r7JkH0BcuprYaSdchh5T/mvXcmUVO1wRVri1gLf0
	WKBOylMdeZGhOY9IhZfYW015pZ5UFsARG5YgDLMuy0lcK+fRvq4UyFMqDhkuoPge
	fNxTbsWW3cANV8dAlaL+uTmSHI/jWkrO4dI31/Wj+OguM=
Received: from 4F-GAME.localdomain (unknown [])
	by gzga-smtp-mtada-g1-4 (Coremail) with SMTP id _____wD3n9Pj1OVqq0aEDw--.53552S3;
	Sat, 31 Oct 2026 19:45:42 +0800 (CST)
From: Bob Hui <bg9oxa@163.com>
Date: Sat, 31 Oct 2026 19:45:36 +0800
Subject: [PATCH v4 1/2] ASoC: es8328: reset the codec at probe time
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
Message-Id: <20261031-es8328-vol-init-v4-1-5bdc00b25948@163.com>
References: <20261031-es8328-vol-init-v4-0-5bdc00b25948@163.com>
In-Reply-To: <20261031-es8328-vol-init-v4-0-5bdc00b25948@163.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Bob Hui <bg9oxa@163.com>
X-Mailer: b4 0.15.2
X-CM-TRANSID:_____wD3n9Pj1OVqq0aEDw--.53552S3
X-Coremail-Antispam: 1Uf129KBjvAXoW3Zw4xKF43WryUJF4fJr1DZFb_yoW8Gr45to
	W2qry3Ww47Ww1kXFyrtr1fWF17WF4rZ343tFsrCw4DZwn7JFy5Kws2qw15ta4aga4Y9rZ5
	Zw1DXFnxJrWxGF17n29KB7ZKAUJUUUU8529EdanIXcx71UUUUU7v73VFW2AGmfu7bjvjm3
	AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvj4i-B_UDUUUU
X-CM-SenderInfo: lejz05rd6rljoofrz/xtbC+gaC72rl1OZfEwAA3g

Nothing brings the codec into a known state when the driver probes: the
supplies may already be on, a warm reboot or a kexec keeps the registers
alive, and a driver rebind leaves whatever the previous instance
programmed.  Everything that reads a register back and writes it again,
from the DAI format to the mute control, then works from a value the
hardware never had.

Issue a control port reset while probing so the codec always starts from
its documented defaults.  SCP_RESET is not self-clearing, so the reference
and the VMID divider are written back afterwards, which is the documented
default value of the register.

The cache outlives a component rebind, so rebuild it from the same table
after the reset instead of dropping it: a drop would send every later
read-modify-write to the bus, and this part does not read back reliably
everywhere.

Describe those defaults in the regmap as well, one table per supported
part, so the cache describes the codec instead of being filled in lazily
on first access.  The two parts differ in eleven registers, so one table
cannot describe both; the variant is looked up from the match data in the
I2C and SPI glue, which also makes the driver work on ACPI systems.  The
SPI glue gains an ES8388 entry and an id table of its own, so a part
behind SPI resolves the same way and the id table lookup never runs off a
NULL table.

The values come from the ES8328 datasheet, Revision 1.0, sections 6.1.1
to 6.3.30, and from the ES8388 datasheet, Revision 5.0, same sections.

Tested on a QuarkPi-CA2 (RK3588S, ES8388, I2C): a register deliberately
modified before a warm reboot comes back at its reset value once the
driver probes, so it is the reset rather than a power cycle that restores
the state.

Assisted-by: Hermes:deepseek-v4-flash
Signed-off-by: Bob Hui <bg9oxa@163.com>
---
 sound/soc/codecs/es8328-i2c.c |  18 ++--
 sound/soc/codecs/es8328-spi.c |  20 ++++-
 sound/soc/codecs/es8328.c     | 192 ++++++++++++++++++++++++++++++++++++++++--
 sound/soc/codecs/es8328.h     |   9 +-
 4 files changed, 222 insertions(+), 17 deletions(-)

diff --git a/sound/soc/codecs/es8328-i2c.c b/sound/soc/codecs/es8328-i2c.c
index 36a4987e1a593..cb9392c0b8ea3 100644
--- a/sound/soc/codecs/es8328-i2c.c
+++ b/sound/soc/codecs/es8328-i2c.c
@@ -16,23 +16,29 @@
 #include "es8328.h"
 
 static const struct i2c_device_id es8328_id[] = {
-	{ .name = "es8328" },
-	{ .name = "es8388" },
+	{ .name = "es8328", .driver_data = ES8328_TYPE_ES8328 },
+	{ .name = "es8388", .driver_data = ES8328_TYPE_ES8388 },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, es8328_id);
 
 static const struct of_device_id es8328_of_match[] = {
-	{ .compatible = "everest,es8328", },
-	{ .compatible = "everest,es8388", },
+	{ .compatible = "everest,es8328", .data = (void *)ES8328_TYPE_ES8328 },
+	{ .compatible = "everest,es8388", .data = (void *)ES8328_TYPE_ES8388 },
 	{ }
 };
 MODULE_DEVICE_TABLE(of, es8328_of_match);
 
 static int es8328_i2c_probe(struct i2c_client *i2c)
 {
-	return es8328_probe(&i2c->dev,
-			devm_regmap_init_i2c(i2c, &es8328_regmap_config));
+	enum es8328_type type = (unsigned long)i2c_get_match_data(i2c);
+	const struct regmap_config *config;
+
+	config = type == ES8328_TYPE_ES8388 ? &es8388_regmap_config
+					    : &es8328_regmap_config;
+
+	return es8328_probe(&i2c->dev, devm_regmap_init_i2c(i2c, config),
+			    type);
 }
 
 static struct i2c_driver es8328_i2c_driver = {
diff --git a/sound/soc/codecs/es8328-spi.c b/sound/soc/codecs/es8328-spi.c
index 88e353ae52a10..93df788222ab6 100644
--- a/sound/soc/codecs/es8328-spi.c
+++ b/sound/soc/codecs/es8328-spi.c
@@ -13,16 +13,29 @@
 #include <sound/soc.h>
 #include "es8328.h"
 
+static const struct spi_device_id es8328_id[] = {
+	{ .name = "es8328", .driver_data = ES8328_TYPE_ES8328 },
+	{ .name = "es8388", .driver_data = ES8328_TYPE_ES8388 },
+	{ }
+};
+MODULE_DEVICE_TABLE(spi, es8328_id);
+
 static const struct of_device_id es8328_of_match[] = {
-	{ .compatible = "everest,es8328", },
+	{ .compatible = "everest,es8328", .data = (void *)ES8328_TYPE_ES8328 },
+	{ .compatible = "everest,es8388", .data = (void *)ES8328_TYPE_ES8388 },
 	{ }
 };
 MODULE_DEVICE_TABLE(of, es8328_of_match);
 
 static int es8328_spi_probe(struct spi_device *spi)
 {
-	return es8328_probe(&spi->dev,
-			devm_regmap_init_spi(spi, &es8328_regmap_config));
+	enum es8328_type type = (unsigned long)spi_get_device_match_data(spi);
+	const struct regmap_config *config;
+
+	config = type == ES8328_TYPE_ES8388 ? &es8388_regmap_config
+					    : &es8328_regmap_config;
+
+	return es8328_probe(&spi->dev, devm_regmap_init_spi(spi, config), type);
 }
 
 static struct spi_driver es8328_spi_driver = {
@@ -31,6 +44,7 @@ static struct spi_driver es8328_spi_driver = {
 		.of_match_table	= es8328_of_match,
 	},
 	.probe	= es8328_spi_probe,
+	.id_table = es8328_id,
 };
 
 module_spi_driver(es8328_spi_driver);
diff --git a/sound/soc/codecs/es8328.c b/sound/soc/codecs/es8328.c
index aaa6646ad4c5e..716a1ec4714bf 100644
--- a/sound/soc/codecs/es8328.c
+++ b/sound/soc/codecs/es8328.c
@@ -78,6 +78,7 @@ static const char * const supply_names[ES8328_SUPPLY_NUM] = {
 struct es8328_priv {
 	struct regmap *regmap;
 	struct clk *clk;
+	enum es8328_type type;
 	int playback_fs;
 	bool deemph;
 	int mclkdiv2;
@@ -812,6 +813,7 @@ static int es8328_component_probe(struct snd_soc_component *component)
 {
 	struct es8328_priv *es8328;
 	int ret;
+	const struct regmap_config *config;
 
 	es8328 = snd_soc_component_get_drvdata(component);
 
@@ -836,6 +838,46 @@ static int es8328_component_probe(struct snd_soc_component *component)
 		goto clk_fail;
 	}
 
+	/*
+	 * Put the codec into a known state: the supplies may already be on,
+	 * a warm reboot or a kexec keeps the registers alive, and a driver
+	 * rebind leaves whatever the previous instance programmed.  Without
+	 * this every read-modify-write in the driver works from a value the
+	 * hardware never had.  SCP_RESET is not self-clearing.
+	 */
+	ret = snd_soc_component_write(component, ES8328_CONTROL1,
+				      ES8328_CONTROL1_SCP_RESET);
+	if (ret) {
+		dev_err(component->dev, "unable to reset the codec\n");
+		clk_disable_unprepare(es8328->clk);
+		goto clk_fail;
+	}
+	usleep_range(1000, 5000);
+	ret = snd_soc_component_write(component, ES8328_CONTROL1,
+				      ES8328_CONTROL1_ENREF |
+				      ES8328_CONTROL1_VMIDSEL_500k);
+	if (ret) {
+		dev_err(component->dev, "unable to clear the codec reset\n");
+		clk_disable_unprepare(es8328->clk);
+		goto clk_fail;
+	}
+
+	/*
+	 * The reset put the codec back to its documented power-on values, so
+	 * rebuild the cache from the same table instead of dropping it: a
+	 * drop would send every later read-modify-write to the bus, and this
+	 * part does not read back reliably, registers 0x28 and 0x29 return
+	 * their power-on value whatever has been written to them.
+	 */
+	config = es8328->type == ES8328_TYPE_ES8388 ? &es8388_regmap_config
+						    : &es8328_regmap_config;
+	ret = regmap_reinit_cache(es8328->regmap, config);
+	if (ret) {
+		dev_err(component->dev, "unable to reinitialise the register cache\n");
+		clk_disable_unprepare(es8328->clk);
+		goto clk_fail;
+	}
+
 	return 0;
 
 clk_fail:
@@ -856,16 +898,150 @@ static void es8328_remove(struct snd_soc_component *component)
 			       es8328->supplies);
 }
 
+/*
+ * Power-on defaults from the ES8328 datasheet, Revision 1.0, sections
+ * 6.1.1 to 6.3.30.
+ */
+static const struct reg_default es8328_reg_defaults[] = {
+	{ ES8328_CONTROL1,	0x06 },
+	{ ES8328_CONTROL2,	0x1c },
+	{ ES8328_CHIPPOWER,	0xc3 },
+	{ ES8328_ADCPOWER,	0xfc },
+	{ ES8328_DACPOWER,	0xc0 },
+	{ ES8328_CHIPLOPOW1,	0x00 },
+	{ ES8328_CHIPLOPOW2,	0x00 },
+	{ ES8328_ANAVOLMANAG,	0x7c },
+	{ ES8328_MASTERMODE,	0x80 },
+	{ ES8328_ADCCONTROL1,	0x00 },
+	{ ES8328_ADCCONTROL2,	0x00 },
+	{ ES8328_ADCCONTROL3,	0x06 },
+	{ ES8328_ADCCONTROL4,	0x00 },
+	{ ES8328_ADCCONTROL5,	0x06 },
+	{ ES8328_ADCCONTROL6,	0x30 },
+	{ ES8328_ADCCONTROL7,	0x30 },
+	{ ES8328_ADCCONTROL8,	0xc0 },
+	{ ES8328_ADCCONTROL9,	0xc0 },
+	{ ES8328_ADCCONTROL10,	0x38 },
+	{ ES8328_ADCCONTROL11,	0xb0 },
+	{ ES8328_ADCCONTROL12,	0x32 },
+	{ ES8328_ADCCONTROL13,	0x06 },
+	{ ES8328_ADCCONTROL14,	0x00 },
+	{ ES8328_DACCONTROL1,	0x00 },
+	{ ES8328_DACCONTROL2,	0x06 },
+	{ ES8328_DACCONTROL3,	0x32 },
+	{ ES8328_DACCONTROL4,	0xc0 },
+	{ ES8328_DACCONTROL5,	0xc0 },
+	{ ES8328_DACCONTROL6,	0x08 },
+	{ ES8328_DACCONTROL7,	0x06 },
+	{ ES8328_DACCONTROL8,	0x1f },
+	{ ES8328_DACCONTROL9,	0xf7 },
+	{ ES8328_DACCONTROL10,	0xfd },
+	{ ES8328_DACCONTROL11,	0xff },
+	{ ES8328_DACCONTROL12,	0x1f },
+	{ ES8328_DACCONTROL13,	0xf7 },
+	{ ES8328_DACCONTROL14,	0xfd },
+	{ ES8328_DACCONTROL15,	0xff },
+	{ ES8328_DACCONTROL16,	0x00 },
+	{ ES8328_DACCONTROL17,	0x38 },
+	{ ES8328_DACCONTROL18,	0x38 },
+	{ ES8328_DACCONTROL19,	0x38 },
+	{ ES8328_DACCONTROL20,	0x38 },
+	{ ES8328_DACCONTROL21,	0x38 },
+	{ ES8328_DACCONTROL22,	0x38 },
+	{ ES8328_DACCONTROL23,	0x00 },
+	{ ES8328_LOUT1VOL,	0x00 },
+	{ ES8328_ROUT1VOL,	0x00 },
+	{ ES8328_LOUT2VOL,	0x00 },
+	{ ES8328_ROUT2VOL,	0x00 },
+	{ ES8328_MONOOUTVOL,	0x00 },
+	{ ES8328_DACCONTROL29,	0x00 },
+	{ ES8328_DACCONTROL30,	0x00 },
+};
+
+/*
+ * Power-on defaults from the ES8388 datasheet, Revision 5.0, sections
+ * 6.1.1 to 6.3.30.
+ */
+static const struct reg_default es8388_reg_defaults[] = {
+	{ ES8328_CONTROL1,	0x06 },
+	{ ES8328_CONTROL2,	0x5c },
+	{ ES8328_CHIPPOWER,	0xc3 },
+	{ ES8328_ADCPOWER,	0xfc },
+	{ ES8328_DACPOWER,	0xc0 },
+	{ ES8328_CHIPLOPOW1,	0x00 },
+	{ ES8328_CHIPLOPOW2,	0x00 },
+	{ ES8328_ANAVOLMANAG,	0x7c },
+	{ ES8328_MASTERMODE,	0x80 },
+	{ ES8328_ADCCONTROL1,	0x00 },
+	{ ES8328_ADCCONTROL2,	0x00 },
+	{ ES8328_ADCCONTROL3,	0x02 },
+	{ ES8328_ADCCONTROL4,	0x00 },
+	{ ES8328_ADCCONTROL5,	0x06 },
+	{ ES8328_ADCCONTROL6,	0x30 },
+	{ ES8328_ADCCONTROL7,	0x20 },
+	{ ES8328_ADCCONTROL8,	0xc0 },
+	{ ES8328_ADCCONTROL9,	0xc0 },
+	{ ES8328_ADCCONTROL10,	0x38 },
+	{ ES8328_ADCCONTROL11,	0xb0 },
+	{ ES8328_ADCCONTROL12,	0x32 },
+	{ ES8328_ADCCONTROL13,	0x06 },
+	{ ES8328_ADCCONTROL14,	0x00 },
+	{ ES8328_DACCONTROL1,	0x00 },
+	{ ES8328_DACCONTROL2,	0x06 },
+	{ ES8328_DACCONTROL3,	0x22 },
+	{ ES8328_DACCONTROL4,	0xc0 },
+	{ ES8328_DACCONTROL5,	0xc0 },
+	{ ES8328_DACCONTROL6,	0x08 },
+	{ ES8328_DACCONTROL7,	0x00 },
+	{ ES8328_DACCONTROL8,	0x1f },
+	{ ES8328_DACCONTROL9,	0xf7 },
+	{ ES8328_DACCONTROL10,	0xfd },
+	{ ES8328_DACCONTROL11,	0xff },
+	{ ES8328_DACCONTROL12,	0x1f },
+	{ ES8328_DACCONTROL13,	0xf7 },
+	{ ES8328_DACCONTROL14,	0xfd },
+	{ ES8328_DACCONTROL15,	0xff },
+	{ ES8328_DACCONTROL16,	0x00 },
+	{ ES8328_DACCONTROL17,	0x38 },
+	{ ES8328_DACCONTROL18,	0x28 },
+	{ ES8328_DACCONTROL19,	0x28 },
+	{ ES8328_DACCONTROL20,	0x38 },
+	{ ES8328_DACCONTROL21,	0x00 },
+	{ ES8328_DACCONTROL22,	0x00 },
+	{ ES8328_DACCONTROL23,	0x00 },
+	{ ES8328_LOUT1VOL,	0x00 },
+	{ ES8328_ROUT1VOL,	0x00 },
+	{ ES8328_LOUT2VOL,	0x00 },
+	{ ES8328_ROUT2VOL,	0x00 },
+	{ ES8328_MONOOUTVOL,	0x00 },
+	{ ES8328_DACCONTROL29,	0xaa },
+	{ ES8328_DACCONTROL30,	0xaa },
+};
+
 const struct regmap_config es8328_regmap_config = {
-	.reg_bits	= 8,
-	.val_bits	= 8,
-	.max_register	= ES8328_REG_MAX,
-	.cache_type	= REGCACHE_MAPLE,
-	.use_single_read = true,
-	.use_single_write = true,
+	.reg_bits		= 8,
+	.val_bits		= 8,
+	.max_register		= ES8328_REG_MAX,
+	.cache_type		= REGCACHE_MAPLE,
+	.reg_defaults		= es8328_reg_defaults,
+	.num_reg_defaults	= ARRAY_SIZE(es8328_reg_defaults),
+	.use_single_read	= true,
+	.use_single_write	= true,
 };
 EXPORT_SYMBOL_GPL(es8328_regmap_config);
 
+const struct regmap_config es8388_regmap_config = {
+	.reg_bits		= 8,
+	.val_bits		= 8,
+	.max_register		= ES8328_REG_MAX,
+	.cache_type		= REGCACHE_MAPLE,
+	.reg_defaults		= es8388_reg_defaults,
+	.num_reg_defaults	= ARRAY_SIZE(es8388_reg_defaults),
+	.use_single_read	= true,
+	.use_single_write	= true,
+};
+EXPORT_SYMBOL_GPL(es8388_regmap_config);
+
 static const struct snd_soc_component_driver es8328_component_driver = {
 	.probe			= es8328_component_probe,
 	.remove			= es8328_remove,
@@ -884,7 +1060,8 @@ static const struct snd_soc_component_driver es8328_component_driver = {
 	.endianness		= 1,
 };
 
-int es8328_probe(struct device *dev, struct regmap *regmap)
+int es8328_probe(struct device *dev, struct regmap *regmap,
+		 enum es8328_type type)
 {
 	struct es8328_priv *es8328;
 	int ret;
@@ -898,6 +1075,7 @@ int es8328_probe(struct device *dev, struct regmap *regmap)
 		return -ENOMEM;
 
 	es8328->regmap = regmap;
+	es8328->type = type;
 
 	for (i = 0; i < ARRAY_SIZE(es8328->supplies); i++)
 		es8328->supplies[i].supply = supply_names[i];
diff --git a/sound/soc/codecs/es8328.h b/sound/soc/codecs/es8328.h
index 9109f6b5b045a..3e2cfca050e2b 100644
--- a/sound/soc/codecs/es8328.h
+++ b/sound/soc/codecs/es8328.h
@@ -10,8 +10,15 @@
 
 struct device;
 
+enum es8328_type {
+	ES8328_TYPE_ES8328 = 1,
+	ES8328_TYPE_ES8388,
+};
+
 extern const struct regmap_config es8328_regmap_config;
-int es8328_probe(struct device *dev, struct regmap *regmap);
+extern const struct regmap_config es8388_regmap_config;
+int es8328_probe(struct device *dev, struct regmap *regmap,
+		 enum es8328_type type);
 
 #define ES8328_DACLVOL 46
 #define ES8328_DACRVOL 47

-- 
2.34.1

