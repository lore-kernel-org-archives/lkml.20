Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792484057;
	b=MzIt5NVdMmvCAfUjfvCb42d5EEFm++wu3N6hfZp4pcAgBEPdYurJy9acXQGb6aBw/dms
	 CAgJV1TQr8+Ri5a4xp33LaKseFblioSpbpnMxdNtjYQK0giqmi0TRyDGel28xaS8iuYbs
	 R+Vv6dUFKbBhsQF+4IsHk15LMlIiLqFb7hW1nCF+zJu08cFU6D3pdnq0rvYd9WtQ2BtIj
	 ZC14ACSZLvlvV6T+Z7Fe56+kFgPxkrsNZjjgdt/vcd7gKwRy4e3BiHE+3qodbNg1kuDMC
	 MtdOPK61njpHahqyAiug1RlXO8zT7axCg81xbfXTnA0Cl++U0QWkqFeJCmpecjWun1g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792484057;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=qO3JqoryMuz3iGO1ugSkLq6Ey291hKQqWmHA9+oEZXs=;
	b=KQNDVvvEv+OLGUKALvra3EWJggizSOSpoUp/h259BoFXT9r7ddsl0pebLH1PbyP6oiAM
	 KpjlkxEFqe0BX8ktSRMiGMTuSKJe5s6WTE0MlKetjIcxTN0TDEYWtXQQO0SzoXWk098Sa
	 r6m/gYZY1pxZB9ZmFbh1cfbyzTh7KJ+Wqw6KIerkzNBlZmjXwjTqAHnNS6ZfJs/3QZRQ7
	 53rz2rJHPA5iZSzZQ4kiSAgZ+ylzpe2PHzJWPcjXm7AFwi6cGDxT1GpmhzzHZgmoYmGeT
	 qt+4urAkUBJHI2cPEIuawHoa0mlPZdP3VZkXmtnbj2kHZAZ0S4uh+bqNNs7jW6pTD0g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=packett.cool;
	spf=pass smtp.mailfrom=packett.cool;
	dkim=pass header.d=packett.cool header.i=@packett.cool header.a=rsa-sha256 header.s=key1 header.b=SLcI4GpH;
	arc=none smtp.remote-ip=91.218.175.43
Received: from mta0.migadu.com (out-43.mta0.migadu.com [91.218.175.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D2AE606A326
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 08:14:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5D2AE606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=packett.cool
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=packett.cool header.i=@packett.cool header.a=rsa-sha256 header.s=key1 header.b=SLcI4GpH
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=r7U2PL3f73XxI6tIOrwGXDDfc8aDPCW0xlVXmaXSGY8=;
 c=simple/simple; d=packett.cool;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1792484054; v=1; x=1793088854;
 b=SLcI4GpHA/sN5zzdKjfUNQ61moYOuP4b5L1DgHmyxTp2GjiN6Co0mRbqu+3i2S74wT6WAYCn
 bma2sjPmDuV4/Re4d/Efk4AcAc3+M+Br7btL3kSLtqYkG0ZzMT06NCrHZUaJQ0Nj6hrzHz6Z1Mc
 5KzHT1U570dLEUsi/MzeTdtwBTH0Kpx6kBv2HSgTS7yiyrYOIRzsP7WA1vvKoXQwhhrOAUmqdK3
 x01qUQvqNFlGy9syApCwRfL7/Y4O1yUA0QZWcW1MerTwSOS0cx12tCsJuKg+e1LvKc58+BhYPEW
 1VkeqF7OPrXLXZxPRIaA6l7PeNZImMbL3OEfF1hG5EG3w==
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 9afd8cc5e267956b;
	Tue, 20 Oct 2026 08:14:14 +0000
X-Mizu-Trace-ID: 9afd8cc5e267956b
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
Subject: [PATCH v2 2/2] usb: typec: fsa4480: Report switch & mux events to codec
Date: Tue, 20 Oct 2026 05:12:54 -0300
Message-ID: <20261020081343.1507986-3-val@packett.cool>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261020081343.1507986-1-val@packett.cool>
References: <20261020081343.1507986-1-val@packett.cool>
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
index bea0c1deec94..93faa81d0879 100644
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
@@ -319,18 +347,33 @@ static int fsa4480_probe(struct i2c_client *client)
 
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
 {
 	struct fsa4480 *fsa = i2c_get_clientdata(client);
 
+	typec_mux_put(fsa->codec);
+	typec_switch_put(fsa->codec_switch);
+
 	typec_mux_unregister(fsa->mux);
 	typec_switch_unregister(fsa->sw);
 }
-- 
2.55.0

