Received: from mta0.migadu.com (out-12.mta0.migadu.com [91.218.175.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B61C93DA5BA
	for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 22:59:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792364388; cv=none; b=KMiP7HHhcnjNtAbuYCQzTtuFqOfmf8prAKFOmWyncmbymVSBMhz/M6sIIPpkVt7PrgBEEfMdPprqzHeY5rot339jI2YedSEv79u5Q1+nOVZwFyQtNbf400t2Ki4IVKq7KbeuXUS+Pa8s2CpXjOb4dDA4wbm3FNVLw2hGwjTRP8k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792364388; c=relaxed/simple;
	bh=+q0hVlvafA4QiYolYDkICRT9kiULSpPM+sjC3Bx5vzg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=enpGtMOQQ2/iETVmQAqbIZSh6UXz4Ur1j3bPQHwuTjCx7AaKLBCPR/qv+WvyCY3SB9Gr7XbCU60+DLNAgv+rOTEeaFt1rT2qAP2oD7NA7IrCSa89ri/SqKlcAIbhsqA6GLwmuhSVvjNifXY/b+KrujQNJ/B3dEHPRmvmzEP9yd4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool; spf=pass smtp.mailfrom=packett.cool; dkim=pass (2048-bit key) header.d=packett.cool header.i=@packett.cool header.b=cfh4hLu1; arc=none smtp.client-ip=91.218.175.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=packett.cool
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=packett.cool header.i=@packett.cool header.b="cfh4hLu1"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=+q0hVlvafA4QiYolYDkICRT9kiULSpPM+sjC3Bx5vzg=;
 c=simple/simple; d=packett.cool;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1792364383; v=1; x=1792969183;
 b=cfh4hLu1RGBG3zjWxM5la0dsvvRgmvh3mhoFH1/j8Z3h3Vbvq3pTOX39X82QPxWTffKXs5eC
 u6VKcvauL0fwTOCH5hltXZ2cyhrojJ/NP11BqlrOQ/PNs4Jd0cTZXynvtMK7LTsWJkU+ZeBN5tZ
 wton1JNFMpOT+4CAPtDHSmXa5GPuL2Mp4UJcRFdj8ciXcQwUn/oSLt3gs2DN6OQ1wdrVjV+6OM0
 5kr7NdSMWQeZJcEqAHOI8DYzCtvsA5lUQlYmLhnSEm8Xuiy1AS7b0iSX2nJObL7SPeahXWoOy7X
 Xl2FE41PPBfdROUQb6gOV0//VaIYyDXWyVm58+Doh/IWA==
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 883fbb2e3d35ca04;
	Sun, 18 Oct 2026 22:59:43 +0000
X-Mizu-Trace-ID: 883fbb2e3d35ca04
X-Migadu-Flow: FLOW_OUT
From: Val Packett <val@packett.cool>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Luca Weiss <luca.weiss@fairphone.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	~postmarketos/upstreaming@lists.sr.ht,
	phone-devel@vger.kernel.org,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	Val Packett <val@packett.cool>
Subject: [PATCH 2/2] usb: typec: fsa4480: Report switch & mux events to codec
Date: Sun, 18 Oct 2026 19:58:57 -0300
Message-ID: <20261018225906.1265299-3-val@packett.cool>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261018225906.1265299-1-val@packett.cool>
References: <20261018225906.1265299-1-val@packett.cool>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Luca Weiss <luca.weiss@fairphone.com>

In the Type-C graph, the FSA4480 switch is in between the USB-C connector
and the audio codec, but the audio codec also needs to receive the
switch and mux events from the FSA4480.

Update the driver to get an Type-C mux on the next endpoint and
broadcast the recevied mux & switch state to it.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
[val: enable the SENSE/MIC bits used downstream, they do improve detection]
Signed-off-by: Val Packett <val@packett.cool>
---

Originaly in the WIP tree Luca sent me, the chunk with the two enable bits
was in a separate debug commit. I have tested the difference, without them
the codec does detect the headphones but complains in the process:

wcd937x_codec audio-codec: Impedance detect ramp error, c1=0, x1=0x0
wcd937x_codec audio-codec: Impedance detect ramp error, c1=0, x1=0x0
wcd937x_codec audio-codec: Impedance detect ramp error, c1=0, x1=0x0
wcd937x_codec audio-codec: wcd937x_mbhc_get_result_params: d1=30, c1=3, x1=0xb69, z_val=19776 (milliohm)

With FSA4480_ENABLE_SENSE | FSA4480_ENABLE_MIC set, there are no complaints,
the headset is detected on the first iteration:

wcd937x_codec audio-codec: wcd937x_mbhc_get_result_params: d1=5, c1=3, x1=0x2d31, z_val=33984 (milliohm)
wcd937x_codec audio-codec: wcd937x_mbhc_get_result_params: d1=5, c1=3, x1=0x2dc7, z_val=33380 (milliohm)
wcd937x_codec audio-codec: wcd937x_mbhc_get_result_params: d1=5, c1=3, x1=0x2d57, z_val=33829 (milliohm)

---
 drivers/usb/typec/mux/fsa4480.c | 54 ++++++++++++++++++++++++++++-----
 1 file changed, 47 insertions(+), 7 deletions(-)

diff --git a/drivers/usb/typec/mux/fsa4480.c b/drivers/usb/typec/mux/fsa4480.c
index bea0c1deec94..d992a7e1887c 100644
--- a/drivers/usb/typec/mux/fsa4480.c
+++ b/drivers/usb/typec/mux/fsa4480.c
@@ -60,6 +60,9 @@ struct fsa4480 {
 
 	struct regmap *regmap;
 
+	struct typec_mux *codec;
+	struct typec_switch *codec_switch;
+
 	enum typec_orientation orientation;
 	unsigned long mode;
 	unsigned int svid;
@@ -115,7 +118,8 @@ static int fsa4480_set(struct fsa4480 *fsa)
 		}
 	} else if (fsa->mode == TYPEC_MODE_AUDIO) {
 		/* Audio Accessory Mode, setup to auto Jack Detection */
-		enable |= FSA4480_ENABLE_USB | FSA4480_ENABLE_AGND;
+		enable |= FSA4480_ENABLE_USB | FSA4480_ENABLE_AGND |
+			 FSA4480_ENABLE_SENSE | FSA4480_ENABLE_MIC;
 	} else
 		return -EOPNOTSUPP;
 
@@ -162,7 +166,11 @@ static int fsa4480_switch_set(struct typec_switch_dev *sw,
 
 	mutex_unlock(&fsa->lock);
 
-	return ret;
+	if (ret)
+		return ret;
+
+	/* Report orientation to codec after switch has been done */
+	return typec_switch_set(fsa->codec_switch, orientation);
 }
 
 static int fsa4480_mux_set(struct typec_mux_dev *mux, struct typec_mux_state *state)
@@ -185,7 +193,11 @@ static int fsa4480_mux_set(struct typec_mux_dev *mux, struct typec_mux_state *st
 
 	mutex_unlock(&fsa->lock);
 
-	return ret;
+	if (ret)
+		return ret;
+
+	/* Report event to codec after switch has been done */
+	return typec_mux_set(fsa->codec, state);
 }
 
 enum {
@@ -287,6 +299,19 @@ static int fsa4480_probe(struct i2c_client *client)
 		FIELD_GET(FSA4480_DEVICE_ID_REV_ID, val),
 		FIELD_GET(FSA4480_DEVICE_ID_VENDOR_ID, val));
 
+	/* Get Codec's MUX & Switch devices */
+	fsa->codec = fwnode_typec_mux_get(dev->fwnode);
+	if (IS_ERR(fsa->codec))
+		return dev_err_probe(dev, PTR_ERR(fsa->codec),
+				     "failed to acquire codec mode-switch\n");
+
+	fsa->codec_switch = fwnode_typec_switch_get(dev->fwnode);
+	if (IS_ERR(fsa->codec_switch)) {
+		ret = dev_err_probe(dev, PTR_ERR(fsa->codec_switch),
+				    "failed to acquire codec orientation-switch\n");
+		goto err_put_mux;
+	}
+
 	/* Safe mode */
 	fsa->cur_enable = FSA4480_ENABLE_DEVICE | FSA4480_ENABLE_USB;
 	fsa->mode = TYPEC_STATE_SAFE;
@@ -310,8 +335,11 @@ static int fsa4480_probe(struct i2c_client *client)
 	sw_desc.set = fsa4480_switch_set;
 
 	fsa->sw = typec_switch_register(dev, &sw_desc);
-	if (IS_ERR(fsa->sw))
-		return dev_err_probe(dev, PTR_ERR(fsa->sw), "failed to register typec switch\n");
+	if (IS_ERR(fsa->sw)) {
+		ret = dev_err_probe(dev, PTR_ERR(fsa->sw),
+				    "failed to register typec switch\n");
+		goto err_put_switch;
+	}
 
 	mux_desc.drvdata = fsa;
 	mux_desc.fwnode = dev_fwnode(dev);
@@ -319,12 +347,24 @@ static int fsa4480_probe(struct i2c_client *client)
 
 	fsa->mux = typec_mux_register(dev, &mux_desc);
 	if (IS_ERR(fsa->mux)) {
-		typec_switch_unregister(fsa->sw);
-		return dev_err_probe(dev, PTR_ERR(fsa->mux), "failed to register typec mux\n");
+		ret = dev_err_probe(dev, PTR_ERR(fsa->mux),
+				    "failed to register typec mux\n");
+		goto err_unregister_switch;
 	}
 
 	i2c_set_clientdata(client, fsa);
 	return 0;
+
+err_unregister_switch:
+	typec_switch_unregister(fsa->sw);
+
+err_put_switch:
+	typec_switch_put(fsa->codec_switch);
+
+err_put_mux:
+	typec_mux_put(fsa->codec);
+
+	return ret;
 }
 
 static void fsa4480_remove(struct i2c_client *client)
-- 
2.55.0

