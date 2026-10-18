Received: from mta1.migadu.com (out-213.mta1.migadu.com [95.215.58.213])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E5E23DD873
	for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 23:13:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.213
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792365200; cv=none; b=Rfz7E5L/IVYk77PTpi3+H+aU2i+subZamBSDK0B9Oda7G4GQVBtPOz89ALHrUIUim2/v0ocN64CuZmB6MMCOYCmu950Ejk3DOTuDnarbtZ+/jFuUB3Rn+dNTlXVACj64whjhBufUdcVC8E8M3SwPv6w3cS7NGs1Wzkdo5tdX9mk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792365200; c=relaxed/simple;
	bh=/PRZQM6JuizaH0s04HVkxAjklqfezh2PIg3JP0mEO/w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TKlp0TcJSPHlSNLhbNC4Misq2SjXKSdNGJR7J46z/k4lHhd8JDgnluxkp54QUSPCYPgFF41FBRbzh33ZnqwB0+sLsEZLMIbobmJUTf+9G+pjSH+AbmQb1G+V8ddV1a5J2HVtuqkvBDulDVuNxh+mWzZZdhLw9LOHkBeHiEmTdSs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool; spf=pass smtp.mailfrom=packett.cool; dkim=pass (2048-bit key) header.d=packett.cool header.i=@packett.cool header.b=V+g29J1i; arc=none smtp.client-ip=95.215.58.213
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=packett.cool
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=packett.cool header.i=@packett.cool header.b="V+g29J1i"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=/PRZQM6JuizaH0s04HVkxAjklqfezh2PIg3JP0mEO/w=;
 c=simple/simple; d=packett.cool;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1792365196; v=1; x=1792969996;
 b=V+g29J1iok/O2kUs0onlVaidCv/nNnVzUtAnp9iToY4ghGeFvTAxVEPNHlBVbR+rZ5lb9Keo
 Dg3mMqriV62cW90dVF9hlF8uoO9yv5YFuxregt9cwA+WIbw7OoMufrTMA/7R/HNrV9dMG9O1J7w
 449GTIusm1v3q4WmmxIzdtqC5J68khIFl4fp0bJsOhe1tMHc7KWyNIAkkNdwc9Tkui89stHfxKH
 XlPGJltwhEcCA5O6rHQYxP3EbgCnO4UJUb36eqYx8/HLBzC/q1/ty7bT7F46iTgKVU3f+vAJ7xW
 QpfHjA35vvSfjNgrs+Bp/DhYvluztMmoXHvBMli9poOMQ==
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 72debcc7559da829;
	Sun, 18 Oct 2026 23:13:16 +0000
X-Mizu-Trace-ID: 72debcc7559da829
X-Migadu-Flow: FLOW_OUT
From: Val Packett <val@packett.cool>
To: Srinivas Kandagatla <srini@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
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
Subject: [PATCH 2/2] ASoC: codecs: wcd937x: add USB Type-C analog audio mux support
Date: Sun, 18 Oct 2026 20:12:30 -0300
Message-ID: <20261018231244.1266926-3-val@packett.cool>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261018231244.1266926-1-val@packett.cool>
References: <20261018231244.1266926-1-val@packett.cool>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
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
 sound/soc/codecs/wcd937x.c | 151 ++++++++++++++++++++++++++++++++++++-
 1 file changed, 148 insertions(+), 3 deletions(-)

diff --git a/sound/soc/codecs/wcd937x.c b/sound/soc/codecs/wcd937x.c
index 7ffbb445f8ac..770f5925e89f 100644
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
@@ -2634,6 +2644,40 @@ static const struct snd_soc_component_driver soc_codec_dev_wcd937x = {
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
@@ -2644,6 +2688,13 @@ static bool wcd937x_swap_gnd_mic(struct snd_soc_component *component)
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
 
@@ -2761,10 +2812,24 @@ static int wcd937x_bind(struct device *dev)
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
@@ -2852,6 +2917,12 @@ static int wcd937x_bind(struct device *dev)
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
 
@@ -2874,6 +2945,61 @@ static const struct component_master_ops wcd937x_comp_ops = {
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
@@ -2907,6 +3033,9 @@ static int wcd937x_probe(struct platform_device *pdev)
 	struct device *dev = &pdev->dev;
 	struct wcd937x_priv *wcd937x;
 	struct wcd_mbhc_config *cfg;
+#if IS_ENABLED(CONFIG_TYPEC)
+	struct device_node *np;
+#endif /* CONFIG_TYPEC */
 	int ret;
 
 	wcd937x = devm_kzalloc(dev, sizeof(*wcd937x), GFP_KERNEL);
@@ -2951,6 +3080,22 @@ static int wcd937x_probe(struct platform_device *pdev)
 
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

