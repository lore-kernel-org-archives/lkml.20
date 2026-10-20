Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.119
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792515863;
	b=SIxh5QthdX34lxk3k8Kp74m1XgTU3MMY8Ew3OTj8KcS7KDFF775cP1sJcRWxtrNDgPWI
	 jvW+uZZIbnYhx7x0sh/SXhEpehgyE/6m4l585j+VzI/smgHFfzM9vCM4i9oi4cXU/wSdR
	 Dfwhlwxb+Wr7seU6K3GOCC0WHY1MaviY2n4miBX4aFxO022eDW11giBni1Mdttncey1P8
	 Pn7enPQIyU2sjziV5Z+M6DNq0RHoXsr1VbsC5MLZ3WmCG/axj+VOW4Rp2PDplALK31wb0
	 ML5G1H2K0awRqEwiUw1/PYjD1jHZAMYjU4gHeeL+9XMG/wr4ysyr7il9KTv6gCvGrHg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792515863;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=8sR+zDzMi9HFrsdnqSgy6DAeaNbWllNx84H/JCpIZzw=;
	b=h2idtH0ROn54GBa/3N17aDT5rF3hpTKaOmJBNGtQVT6EHI7PojpBnJ7lE2XiBtxBezCI
	 H6OYmdGOavBl7UVfYqdnfmI42dUGwimTvlITXaYFga+0i9e63HI5v8uFRH7636Vo3Xehp
	 anp9LIqAsGncpYHyQn1S6q9Akv3aspoPD7rOTADzTcNWQnIfx0DvTXe0YluyLGcxyD/Qg
	 pA6ItwTNg+4BrpxivPhqNLQFTtmfBZv4ViIlObYzQyrbJN9zjJ/Cfjzk4T1YTKnp3XTtv
	 GHqYQLCjNbZT9Ta8nk+LXLXm0yL4jygXvc/UYOVYoUNnasA9FsubXyvoFRsFpBJeYbA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=packett.cool;
	spf=pass smtp.mailfrom=packett.cool;
	dkim=pass header.d=packett.cool header.i=@packett.cool header.a=rsa-sha256 header.s=key1 header.b=F+6g9+a6;
	arc=none smtp.remote-ip=95.215.58.119
Received: from mta1.migadu.com (out-119.mta1.migadu.com [95.215.58.119])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A5AF606A331
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 17:04:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6A5AF606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=packett.cool
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=packett.cool header.i=@packett.cool header.a=rsa-sha256 header.s=key1 header.b=F+6g9+a6
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=h7y1OEuGysqMDVk0RdcCkB7ieMe6BbeWyLj9fbcPZIY=;
 c=simple/simple; d=packett.cool;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1792515860; v=1; x=1793120660;
 b=F+6g9+a62CwMiy7K+Blyc3Im53Bi8PCt8BDwigujfXrnpSgOkNxLC8V9CIbvD9g1D9oLb75T
 tAh71WQMyKnsmaDEf5ZVtPeHmWbJ8l/T259KY0v93f0VdzCs36hpm3Iwla5Q+8TAlrwpS+uEJpW
 cxzHded2KGcPDLaAib3HyFjLq54pLz98GWG31fjUxHWsmMpzV8iiZk9RdGVy+2fgqL2UmLjtaAu
 Me5TrJpebsNDEN37J+chFLXDLse8CHkXhyBhyKGtWoqiHrCoEENBuzeU2GXu65UNsKiifvsPKga
 BIppkm+bIDaOrbDZZs6rXiCuiRxsFyFciQClVbK4mhqoA==
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 28b23032f6087e65;
	Tue, 20 Oct 2026 17:04:20 +0000
X-Mizu-Trace-ID: 28b23032f6087e65
X-Migadu-Flow: FLOW_OUT
From: Val Packett <val@packett.cool>
To: Srinivas Kandagatla <srini@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Val Packett <val@packett.cool>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	~postmarketos/upstreaming@lists.sr.ht,
	phone-devel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v3 1/4] ASoC: dt-bindings: qcom,wcd937x: Add USB-C graph properties
Date: Tue, 20 Oct 2026 14:03:25 -0300
Message-ID: <20261020170341.1641325-2-val@packett.cool>
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

This codec can be used with a USB-C SBU mux to support analog headphone
adapters. Describe the mode-switch, orientation-switch and port
properties similarly to wcd939x.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Val Packett <val@packett.cool>
---
 .../devicetree/bindings/sound/qcom,wcd937x.yaml   | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/qcom,wcd937x.yaml b/Documentation/devicetree/bindings/sound/qcom,wcd937x.yaml
index f94203798f24..f15b9a9d90b1 100644
--- a/Documentation/devicetree/bindings/sound/qcom,wcd937x.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,wcd937x.yaml
@@ -25,6 +25,21 @@ properties:
           - const: qcom,wcd9375-codec
           - const: qcom,wcd9370-codec
 
+  mode-switch:
+    description: Flag the port as possible handler of altmode switching
+    type: boolean
+
+  orientation-switch:
+    description: Flag the port as possible handler of orientation switching
+    type: boolean
+
+  port:
+    $ref: /schemas/graph.yaml#/properties/port
+    description:
+      A port node to link the WCD937x Codec node to an external USB-C MUX IC for
+      handling altmode muxing and orientation switching to detect and enable
+      Audio Accessory Mode.
+
   vdd-px-supply:
     description: A reference to the 1.8V I/O supply
 
-- 
2.55.0

