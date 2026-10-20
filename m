Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.10
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792513306;
	b=jpCcgQ3weN0hOzA/ab5HS3vTvJG2Tjv+cUhC6xnW9W77xOFzQfFOgekKH0CcqtLnG7hz
	 xaEK+6wv27zjxdJ6KRtzL6OdsU8ZBD9WQjCWwd7Ee3Od+LQLKKrXglUKEnppxFYhka+ag
	 TYMFXI4/3ui4O9LjOPm8I0ZCRsM7RuPYy6FHq16AcPnVRqlwk8yDUTxQkxOKEcLJ7uaIX
	 L7n9zEKvJ5gr5ArNmDrOIbrmx2bF5XIyrmZv1s/c2Fs8yXzTj0ieWxCi3vEv+W1Ya9M6M
	 zVHZOqAqy0I7t4xENKmzAy2on3P3ybEg4q//axGGaarOCVJlICCALVlzpfRvHswwYpw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792513306;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=RfwO9tgN7ez1T253edCPhj0bp4XlcsqyEGYjLjHWF/0=;
	b=4Cew6zTeBBk0V6Cwo51WgwaHwJ9Hm7+aPrh371Cn6SbJOczsOM6bxrVlpA2s6QNH/9GB
	 MKqtyNsZmrwt5f96KLXDQGQ4tLzY90LjbH4uYQctnrZageVywqbrHknebETgo+56t/iig
	 CkOg5zQhPXOOOBE9qZip3Vc17yFQhLgXJBvMD4Yh3JqX2reSwSXXVhl3dwz4G8w51VA8D
	 cv4eHYcWk8QVkB4KQLOkPvGrvPDg/1/tGnTs73BjHmjnaesvxo7mdtyqkM4t/dDp/Qesa
	 yNX7l1aLHRJrKPwgTvDsyty7op8KzOgomq0sK5t8EHxuwRicmT9TyWmmIjBLddnkQJg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=packett.cool;
	spf=pass smtp.mailfrom=packett.cool;
	dkim=pass header.d=packett.cool header.i=@packett.cool header.a=rsa-sha256 header.s=key1 header.b=CffDxPqQ;
	arc=none smtp.remote-ip=91.218.175.10
Received: from mta0.migadu.com (out-10.mta0.migadu.com [91.218.175.10])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54E28606A33D
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 16:21:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 54E28606A33D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=packett.cool
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=packett.cool header.i=@packett.cool header.a=rsa-sha256 header.s=key1 header.b=CffDxPqQ
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=InBxeZxzWjwbgkvY1E+iSxsB5FWxINEZ9Un0Nq8a7Fk=;
 c=simple/simple; d=packett.cool;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1792513303; v=1; x=1793118103;
 b=CffDxPqQ/Cw4tVbjhgRmEMMXArbE4f+owepM2HCxSmR+nCbPHOz1rebxw75DjQOxbPig5g+j
 HdbpuaXspKEcdTOSoBV/eBJM8jhfQ4vz8VYTt+HTa3S5K/OnVvFDhQ9JKP+9MpJsxyRRTqAg3xB
 Lnvr64ygH5VPBWtBxhKE/ap1a3S3X/ZLuXEXnudBzbo/KHIcM1CBtFS7SBSgULTiN+PLK5j15O9
 OuWAkywGpVwmOQ9J9A+/IlreSrAV6h6mYdR1Hc+bmikIGecbLyjRBzXpV65oUq82UqyEZtWi9jF
 Nyw/niplzcuX6YMEi+3slU7HGk37i8EdaEAueTEJamfZA==
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 37fbbd58ca8087f7;
	Tue, 20 Oct 2026 16:21:43 +0000
X-Mizu-Trace-ID: 37fbbd58ca8087f7
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
Subject: [PATCH v3 2/2] usb: typec: fsa4480: Report switch & mux events to codec
Date: Tue, 20 Oct 2026 13:20:31 -0300
Message-ID: <20261020162101.1527014-3-val@packett.cool>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261020162101.1527014-1-val@packett.cool>
References: <20261020162101.1527014-1-val@packett.cool>
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

From: Luca Weiss <luca.weiss@fairphone.com>

In the Type-C graph, the FSA4480 switch is in between the USB-C connector
and the audio codec, but the audio codec also needs to receive the
switch and mux events from the FSA4480.

Update the driver to get an Type-C mux on the next endpoint and
broadcast the recevied mux & switch state to it.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
[val: enable the SENSE/MIC bits; put the refs in fsa4480_remove]
Signed-off-by: Val Packett <val@packett.cool>
---
 drivers/usb/typec/mux/fsa4480.c | 57 +++++++++++++++++++++++++++++----
 1 file changed, 50 insertions(+), 7 deletions(-)

diff --git a/drivers/usb/typec/mux/fsa4480.c b/drivers/usb/typec/mux/fsa4480.c
index bea0c1deec94..3c12d17a25a2 100644
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
@@ -333,6 +373,9 @@ static void fsa4480_remove(struct i2c_client *client)
 
 	typec_mux_unregister(fsa->mux);
 	typec_switch_unregister(fsa->sw);
+
+	typec_mux_put(fsa->codec);
+	typec_switch_put(fsa->codec_switch);
 }
 
 static const struct i2c_device_id fsa4480_table[] = {
-- 
2.55.0

