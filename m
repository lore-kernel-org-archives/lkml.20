Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.119
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792515873;
	b=XTN5N9DEdVaxL1LMEsMH2ZUUnrsM/YEeDiLYaHtVGUh6ATJ0u/SN4Du6Ok5jqrByTRED
	 zsUiVBZg0EwN5qPng9m9nxQc2lE/2nLWuxjiXKKwSXTKyTNw7kzrKuOa83uM6Bc5ssCjg
	 ekHkFHH0ADr4hSsDnTtphaCOlNPgiIV0HfNLxlZb9G67mi9X9cySJItyDYs6mdHHxZCJh
	 Fr6hb1dXhtfd6QrsTynif2tGd5rs7TmQ6GUihNGFEDLJc5odkmQ6LhYc6ktu2gRkgNvAm
	 bAumQWAVIBiskib3BubyiE+oWFk3BgRxxjSncdFy073718vt/PtibKY/ZbDckl2jvyg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792515873;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=+v/4d4zAMt84INlpPQvpqMccBxtpkfpIGwx5gUHLE6g=;
	b=1kKE4msjd4zE2u3GoTZDg7wWCHliNLNnxaacgzoyiuCeJO2RKhtQbfEyNDp2oN6QETcT
	 P7B+LRoRynzaRdLf+kL7T1RXOzvK33KTyQ1NgV+R7UztKywmFh28sl0JV2sVea5iciuOf
	 L/vNOag95Fxe/YpPcwveKDfapOU1UfsoksofREI8qwG6D/9wlH28emevCBFrDimFts+fk
	 xf5rb/gDNAz/nC0FfK96n3b0Izb4vH19rL4CpPZCxg+byRiuRp58CotNoL7CVRvMtHFXo
	 n09Qq4OG4YgEB0u9ICIbcsdhvizTrU3RTNDM/dQmAf2CorbJwL0a4zUvgkvUKZZg8Yw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=packett.cool;
	spf=pass smtp.mailfrom=packett.cool;
	dkim=pass header.d=packett.cool header.i=@packett.cool header.a=rsa-sha256 header.s=key1 header.b=QxYYiJN7;
	arc=none smtp.remote-ip=91.218.175.119
Received: from mta0.migadu.com (out-119.mta0.migadu.com [91.218.175.119])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39BA260A2625
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 17:04:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 39BA260A2625
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=packett.cool
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=packett.cool header.i=@packett.cool header.a=rsa-sha256 header.s=key1 header.b=QxYYiJN7
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=4pQXu5QYXJpoC+NiAYXapPd9D68fQxQ3vzix3Vfadx0=;
 c=simple/simple; d=packett.cool;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1792515870; v=1; x=1793120670;
 b=QxYYiJN7Yvi1jn+zUNzAPeNlo8ZeTzeR/u1beeg7YS5HfxWAoKnaDX/MGF2iP9iXW4/BvOZE
 xS3HfoN6Jzakoo4T9uMNGHUPe6HQ+3Xkf1icOout113KZYG9ZwXNJEaSLawTaL6z2qiR0PnENi0
 CdCOBdd3pdRVpTpanBECWlhTe8hxPKNXvv3khFf1s69a7bO1ccE7NMQT32X8QLnRpkTruhEPEZf
 5LmNK+x1A1HdCeYb1896TrM/PhGQn81y5aUrSwlJwt7EkZ9WzozoR/IIOG/S5hYT+hCxsoOvB4c
 UyoAStq4ZZyB9bY1mGMYgJFe0uwmHGPly7DakBXUVGYNw==
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 83a9225097c5f65d;
	Tue, 20 Oct 2026 17:04:30 +0000
X-Mizu-Trace-ID: 83a9225097c5f65d
X-Migadu-Flow: FLOW_OUT
From: Val Packett <val@packett.cool>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Srinivas Kandagatla <srini@kernel.org>
Cc: Val Packett <val@packett.cool>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	~postmarketos/upstreaming@lists.sr.ht,
	phone-devel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 2/4] ASoC: codecs: wcd937x: add USB Type-C analog audio mux support
Date: Tue, 20 Oct 2026 14:03:26 -0300
Message-ID: <20261020170341.1641325-3-val@packett.cool>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261020170341.1641325-1-val@packett.cool>
References: <20261020170341.1641325-1-val@packett.cool>
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

On mobile devices, this codec is frequently paired with a USB-C SBU mux
like the FSA4480 to support analog headphone adapters. To support this,
register the codec in the Type-C graph whenever one is present in the
device tree, handle the hotplug notifications and report detected GND-MIC
pin swap back to the external mux as Type-C orientation.

Based on code from the wcd939x driver.

Signed-off-by: Val Packett <val@packett.cool>
---
 sound/soc/codecs/Kconfig   |   2 +
 sound/soc/codecs/wcd937x.c | 170 +++++++++++++++++++++++++++++++++++--
 2 files changed, 165 insertions(+), 7 deletions(-)

diff --git a/sound/soc/codecs/Kconfig b/sound/soc/codecs/Kconfig
index ba59dabeeccd..b77e62b0b517 100644
--- a/sound/soc/codecs/Kconfig
+++ b/sound/soc/codecs/Kconfig
@@ -2497,11 +2497,13 @@ config SND_SOC_WCD937X
 	depends on SND_SOC_WCD937X_SDW
 	tristate
 	depends on SOUNDWIRE || !SOUNDWIRE
+	depends on TYPEC || !TYPEC
 	select SND_SOC_WCD_CLASSH
 	select SND_SOC_WCD_COMMON
 
 config SND_SOC_WCD937X_SDW
 	tristate "WCD9370/WCD9375 Codec - SDW"
+	depends on TYPEC || !TYPEC
 	select SND_SOC_WCD937X
 	select SND_SOC_WCD_MBHC
 	select REGMAP_IRQ
diff --git a/sound/soc/codecs/wcd937x.c b/sound/soc/codecs/wcd937x.c
index 7ffbb445f8ac..9d5d1df41c36 100644
--- a/sound/soc/codecs/wcd937x.c
+++ b/sound/soc/codecs/wcd937x.c
@@ -8,12 +8,15 @@
 #include <linux/gpio/consumer.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
+#include <linux/of_graph.h>
 #include <linux/of.h>
 #include <linux/platform_device.h>
 #include <linux/pm_runtime.h>
 #include <linux/regmap.h>
 #include <linux/regulator/consumer.h>
 #include <linux/slab.h>
+#include <linux/usb/typec_mux.h>
+#include <linux/usb/typec_altmode.h>
 #include <sound/jack.h>
 #include <sound/pcm_params.h>
 #include <sound/pcm.h>
@@ -82,6 +85,13 @@ struct wcd937x_priv {
 	struct regmap *regmap;
 	/* micb setup lock */
 	struct mutex micb_lock;
+	/* typec handling */
+	bool typec_analog_mux;
+#if IS_ENABLED(CONFIG_TYPEC)
+	enum typec_orientation typec_orientation;
+	unsigned long typec_mode;
+	struct typec_switch *typec_switch;
+#endif /* CONFIG_TYPEC */
 	/* mbhc module */
 	struct wcd_mbhc *wcd_mbhc;
 	struct wcd_mbhc_config mbhc_cfg;
@@ -1869,7 +1879,7 @@ static void wcd937x_mbhc_moisture_config(struct snd_soc_component *component)
 {
 	struct wcd937x_priv *wcd937x = snd_soc_component_get_drvdata(component);
 
-	if (wcd937x->mbhc_cfg.moist_rref == R_OFF) {
+	if (wcd937x->mbhc_cfg.moist_rref == R_OFF || wcd937x->typec_analog_mux) {
 		snd_soc_component_write_field(component, WCD937X_MBHC_NEW_CTL_2,
 					      WCD937X_M_RTH_CTL_MASK, R_OFF);
 		return;
@@ -1905,7 +1915,7 @@ static bool wcd937x_mbhc_get_moisture_status(struct snd_soc_component *component
 	struct wcd937x_priv *wcd937x = snd_soc_component_get_drvdata(component);
 	bool ret = false;
 
-	if (wcd937x->mbhc_cfg.moist_rref == R_OFF) {
+	if (wcd937x->mbhc_cfg.moist_rref == R_OFF || wcd937x->typec_analog_mux) {
 		snd_soc_component_write_field(component, WCD937X_MBHC_NEW_CTL_2,
 					      WCD937X_M_RTH_CTL_MASK, R_OFF);
 		goto done;
@@ -2005,6 +2015,7 @@ static int wcd937x_mbhc_init(struct snd_soc_component *component)
 {
 	struct wcd937x_priv *wcd937x = snd_soc_component_get_drvdata(component);
 	struct wcd_mbhc_intr *intr_ids = &wcd937x->intr_ids;
+	struct wcd_mbhc *mbhc;
 
 	intr_ids->mbhc_sw_intr = regmap_irq_get_virq(wcd937x->irq_chip,
 						     WCD937X_IRQ_MBHC_SW_DET);
@@ -2021,9 +2032,12 @@ static int wcd937x_mbhc_init(struct snd_soc_component *component)
 	intr_ids->hph_right_ocp = regmap_irq_get_virq(wcd937x->irq_chip,
 						      WCD937X_IRQ_HPHR_OCP_INT);
 
-	wcd937x->wcd_mbhc = wcd_mbhc_init(component, &mbhc_cb, intr_ids, wcd_mbhc_fields, true);
-	if (IS_ERR(wcd937x->wcd_mbhc))
-		return PTR_ERR(wcd937x->wcd_mbhc);
+	mbhc = wcd_mbhc_init(component, &mbhc_cb, intr_ids, wcd_mbhc_fields, true);
+	if (IS_ERR(mbhc))
+		return PTR_ERR(mbhc);
+
+	/* May be accessed by platform dev typec callbacks, only set if valid */
+	wcd937x->wcd_mbhc = mbhc;
 
 	snd_soc_add_component_controls(component, impedance_detect_controls,
 				       ARRAY_SIZE(impedance_detect_controls));
@@ -2036,8 +2050,11 @@ static int wcd937x_mbhc_init(struct snd_soc_component *component)
 static void wcd937x_mbhc_deinit(struct snd_soc_component *component)
 {
 	struct wcd937x_priv *wcd937x = snd_soc_component_get_drvdata(component);
+	struct wcd_mbhc *mbhc = wcd937x->wcd_mbhc;
 
-	wcd_mbhc_deinit(wcd937x->wcd_mbhc);
+	/* May be accessed by platform dev typec callbacks, clear it first */
+	wcd937x->wcd_mbhc = NULL;
+	wcd_mbhc_deinit(mbhc);
 }
 
 /* END MBHC */
@@ -2634,6 +2651,40 @@ static const struct snd_soc_component_driver soc_codec_dev_wcd937x = {
 	.endianness = 1,
 };
 
+#if IS_ENABLED(CONFIG_TYPEC)
+/* Get USB-C plug orientation to provide swap event for MBHC */
+static int wcd937x_typec_switch_set(struct typec_switch_dev *sw,
+				    enum typec_orientation orientation)
+{
+	struct wcd937x_priv *wcd937x = typec_switch_get_drvdata(sw);
+
+	wcd937x->typec_orientation = orientation;
+
+	return 0;
+}
+
+static int wcd937x_typec_mux_set(struct typec_mux_dev *mux,
+				 struct typec_mux_state *state)
+{
+	struct wcd937x_priv *wcd937x = typec_mux_get_drvdata(mux);
+	unsigned int previous_mode = wcd937x->typec_mode;
+
+	if (!wcd937x->wcd_mbhc)
+		return -EINVAL;
+
+	if (wcd937x->typec_mode != state->mode) {
+		wcd937x->typec_mode = state->mode;
+
+		if (wcd937x->typec_mode == TYPEC_MODE_AUDIO)
+			return wcd_mbhc_typec_report_plug(wcd937x->wcd_mbhc);
+		else if (previous_mode == TYPEC_MODE_AUDIO)
+			return wcd_mbhc_typec_report_unplug(wcd937x->wcd_mbhc);
+	}
+
+	return 0;
+}
+#endif /* CONFIG_TYPEC */
+
 static bool wcd937x_swap_gnd_mic(struct snd_soc_component *component)
 {
 	int value;
@@ -2644,6 +2695,13 @@ static bool wcd937x_swap_gnd_mic(struct snd_soc_component *component)
 	value = gpiod_get_value(wcd937x->us_euro_gpio);
 	gpiod_set_value(wcd937x->us_euro_gpio, !value);
 
+#if IS_ENABLED(CONFIG_TYPEC)
+	if (wcd937x->typec_analog_mux && wcd937x->typec_switch)
+		typec_switch_set(wcd937x->typec_switch,
+				 wcd937x->typec_orientation == TYPEC_ORIENTATION_REVERSE ?
+					TYPEC_ORIENTATION_NORMAL : TYPEC_ORIENTATION_REVERSE);
+#endif /* CONFIG_TYPEC */
+
 	return true;
 }
 
@@ -2761,10 +2819,24 @@ static int wcd937x_bind(struct device *dev)
 	/* Give the SDW subdevices some more time to settle */
 	usleep_range(5000, 5010);
 
+#if IS_ENABLED(CONFIG_TYPEC)
+	/*
+	 * Get the USB Type-C switch to send GND/MIC swap events.
+	 * typec_switch is fetched now to avoid a probe deadlock since
+	 * the switch depends on the typec_mux register in wcd937x_probe()
+	 */
+	if (wcd937x->typec_analog_mux) {
+		wcd937x->typec_switch = fwnode_typec_switch_get(dev->fwnode);
+		if (IS_ERR(wcd937x->typec_switch))
+			return dev_err_probe(dev, PTR_ERR(wcd937x->typec_switch),
+					     "failed to acquire orientation-switch\n");
+	}
+#endif /* CONFIG_TYPEC */
+
 	ret = component_bind_all(dev, wcd937x);
 	if (ret) {
 		dev_err(dev, "Slave bind failed, ret = %d\n", ret);
-		return ret;
+		goto err_put_typec_switch;
 	}
 
 	wcd937x->rxdev = of_sdw_find_device_by_node(wcd937x->rxnode);
@@ -2852,6 +2924,12 @@ static int wcd937x_bind(struct device *dev)
 	put_device(wcd937x->rxdev);
 err_component_unbind:
 	component_unbind_all(dev, wcd937x);
+err_put_typec_switch:
+#if IS_ENABLED(CONFIG_TYPEC)
+	if (wcd937x->typec_analog_mux)
+		typec_switch_put(wcd937x->typec_switch);
+#endif /* CONFIG_TYPEC */
+
 	return ret;
 }
 
@@ -2867,6 +2945,10 @@ static void wcd937x_unbind(struct device *dev)
 	mutex_destroy(&wcd937x->micb_lock);
 	put_device(wcd937x->txdev);
 	put_device(wcd937x->rxdev);
+#if IS_ENABLED(CONFIG_TYPEC)
+	if (wcd937x->typec_analog_mux)
+		typec_switch_put(wcd937x->typec_switch);
+#endif /* CONFIG_TYPEC */
 }
 
 static const struct component_master_ops wcd937x_comp_ops = {
@@ -2874,6 +2956,61 @@ static const struct component_master_ops wcd937x_comp_ops = {
 	.unbind = wcd937x_unbind,
 };
 
+#if IS_ENABLED(CONFIG_TYPEC)
+static void wcd937x_typec_mux_unregister(void *data)
+{
+	struct typec_mux_dev *typec_mux = data;
+
+	typec_mux_unregister(typec_mux);
+}
+
+static void wcd937x_typec_switch_unregister(void *data)
+{
+	struct typec_switch_dev *typec_sw = data;
+
+	typec_switch_unregister(typec_sw);
+}
+
+static int wcd937x_add_typec(struct wcd937x_priv *wcd937x, struct device *dev)
+{
+	int ret;
+	struct typec_mux_dev *typec_mux;
+	struct typec_switch_dev *typec_sw;
+	struct typec_mux_desc mux_desc = {
+		.drvdata = wcd937x,
+		.fwnode = dev_fwnode(dev),
+		.set = wcd937x_typec_mux_set,
+	};
+	struct typec_switch_desc sw_desc = {
+		.drvdata = wcd937x,
+		.fwnode = dev_fwnode(dev),
+		.set = wcd937x_typec_switch_set,
+	};
+
+	typec_mux = typec_mux_register(dev, &mux_desc);
+	if (IS_ERR(typec_mux))
+		return dev_err_probe(dev, PTR_ERR(typec_mux),
+				     "failed to register typec mux\n");
+
+	ret = devm_add_action_or_reset(dev, wcd937x_typec_mux_unregister,
+				       typec_mux);
+	if (ret)
+		return ret;
+
+	typec_sw = typec_switch_register(dev, &sw_desc);
+	if (IS_ERR(typec_sw))
+		return dev_err_probe(dev, PTR_ERR(typec_sw),
+				     "failed to register typec switch\n");
+
+	ret = devm_add_action_or_reset(dev, wcd937x_typec_switch_unregister,
+				       typec_sw);
+	if (ret)
+		return ret;
+
+	return 0;
+}
+#endif
+
 static int wcd937x_add_slave_components(struct wcd937x_priv *wcd937x,
 					struct device *dev,
 					struct component_match **matchptr)
@@ -2907,6 +3044,9 @@ static int wcd937x_probe(struct platform_device *pdev)
 	struct device *dev = &pdev->dev;
 	struct wcd937x_priv *wcd937x;
 	struct wcd_mbhc_config *cfg;
+#if IS_ENABLED(CONFIG_TYPEC)
+	struct device_node *np __free(device_node) = NULL;
+#endif /* CONFIG_TYPEC */
 	int ret;
 
 	wcd937x = devm_kzalloc(dev, sizeof(*wcd937x), GFP_KERNEL);
@@ -2951,6 +3091,22 @@ static int wcd937x_probe(struct platform_device *pdev)
 
 	wcd_dt_parse_mbhc_data(dev, &wcd937x->mbhc_cfg);
 
+#if IS_ENABLED(CONFIG_TYPEC)
+	/*
+	 * If the node has a port and a valid remote endpoint,
+	 * consider HP lines as connected to a USB-C SBU mux
+	 */
+	np = of_graph_get_remote_node(dev->of_node, 0, 0);
+	if (np) {
+		wcd937x->typec_analog_mux = true;
+		cfg->typec_analog_mux = true;
+
+		ret = wcd937x_add_typec(wcd937x, dev);
+		if (ret)
+			return ret;
+	}
+#endif /* CONFIG_TYPEC */
+
 	ret = wcd937x_add_slave_components(wcd937x, dev, &match);
 	if (ret)
 		return ret;
-- 
2.55.0

