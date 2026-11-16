Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=185.203.200.13
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794842369;
	b=NGPJgeEfzBNv/s4adDNgwpTaa7LyPu5kNJNerRstAbuTZ7nnHXuGG1J82K4AXklAcL4A
	 Ybdqg8Fy+H0FgkEfdwvGSXJcooQH0NIfOL4z+YOIM0P667D+RnXarru+0aq37GXeCr5nl
	 rXUYKmKAordBGWLIYocUGy/Teehz9GlTW/xRI+22Vnd1VOUcs0wWQqiotjmVVo4mq+J+t
	 rJ1SIf4wdAPSXmykJxUV76DwAC1a/2j3RCY9O8RRs8G0RCo7mDGi+qWXUfJBU0MLRYkx3
	 5uQXhgd3rbMn+hJj0EzUObsRvl9Qa31VEMwCntHqk1Wqht5z186lEaCBoUqldRfh5Gg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794842369;
	h=DMARC-Filter:Received:DKIM-Signature:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=OWCZ9/LgpLHaNz3W3rNc8qoJ2CKrJG3mW+ZV/dsmarI=;
	b=XWelHq8Ycrv0nTz51GUIQnuIwxT25j+/0USO7C4HnsRLPPCH99LD8HV23V31VKFOek/f
	 zg5WN8BqHKKSFAkxBsImOk/8KttMvji4M8rqlV8YGCnS3xzVgKO38+skU71fOqiwSf2He
	 9g+F6Z2wncvyzZ7ytClnlHHtfxMupxJZY4uUDZrjkYnsE61ZWASisHU8RPsQk1KQJ/n8L
	 64R0lxKcpUqDotY8uQ7XnOCvfifUKtaRy6XSU+Kph1sFSsY2aBmCCSTi40iLdpbKg5Gao
	 8GCIxZ7Y8K4UEgM60Ioh+fdAUavhDYNDAn8gV03WsVkqbmbhf55n4YGotRmIDAH8kxw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=pengutronix.de;
	spf=pass smtp.mailfrom=pengutronix.de;
	dkim=pass header.d=pengutronix.de header.i=@pengutronix.de header.a=rsa-sha256 header.s=20260414 header.b=SVHy1FPq;
	arc=pass header.oldest-pass=0 smtp.remote-ip=185.203.200.13
Received: from mx1.white.stw.pengutronix.de (mx1.white.stw.pengutronix.de [185.203.200.13])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81E60606A32C;
	Mon, 16 Nov 2026 15:19:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 81E60606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pengutronix.de header.i=@pengutronix.de header.a=rsa-sha256 header.s=20260414 header.b=SVHy1FPq
Received: from [127.0.1.1] (unknown [IPv6:2a02:560:5d79:c700:9ebf:dff:fe00:fdb5])
	(Authenticated sender: sha@pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id B574B205A32;
	Mon, 16 Nov 2026 16:19:22 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1794842362;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OWCZ9/LgpLHaNz3W3rNc8qoJ2CKrJG3mW+ZV/dsmarI=;
	b=SVHy1FPqrLm8zPP8eBKCOTDnsA/oHt5dMi215P1STq9iDj17zNe3Ic0kZsIWfDHTD1/cBG
	cyuqfN1SF6AiaajNMIFlVlH741JmV3iJT2OpiDLSYlCkCtlCx4laCNeik2VKyOp8whOu/B
	Y1Gj1XlraYVWuIRg/R2Dk5tAh3ILDowevF8OpKvncU3Po79S0WI+SPGBDOS5h4u1W0LWDS
	mrwZUdAm8AE5xYJLH3c4e4PcknM9ovGf1610oKmOnvhvdGoXB06p6/NdXiGGfmTf2T6vYv
	qzMI/D8oA7nKlK09unse4bnPYJgV2eZv7YXzMNg08opgaw5godDN145jtaWuyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1794842362;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OWCZ9/LgpLHaNz3W3rNc8qoJ2CKrJG3mW+ZV/dsmarI=;
	b=E8g5E2iQN/JcU4PTt+YNGKYnL4fRq1ZwknOVHX1PaXp9snClxqTN3X5Ah9mkPyUviR0PBV
	D8EAIxRORINbJqxKgDeLqwq8jROERpHOFU50YItIgXyAh0umTzHOyvQAIr6MriKB1eMzDS
	qELdMN0V0j18ViWyJT23phoLi7AJEjd3nFMMzk+nGJpD/KQNzZ3UuVGQBEUHWliUcO5gbm
	SASZohPjJF4U+QIV90DkbCrF2UVdP1Mqc7TUCyGY6q2aUcXlGHGSzXXoD9OIPcutaEEjmH
	khNk6hqVRTgVmzcGydo05DgHnXb0WLkMso915ieu77/ZnGMN2wnw4kwh3wagSw==
ARC-Seal: i=1; s=20260414; d=pengutronix.de; t=1794842362; a=rsa-sha256;
	cv=none;
	b=PnqFGC4kFc6WQzZSFA3CKM4ncUmP3ewk6fJrbmQhHIELnwXpuOE3D6c71YvHlv4UEdjCHW
	KTvgPRUgtQkQnZ6unm6SfZsjC32O0gFeWMpz8woxf/9wMyb2GFfFJCfPv/wGCXsM0x4CpD
	uUkTbfaAljSD2aC0FgdT76LJ5/mprfkrhHa+xWTcod51ncbEsazSoyq27UE8RUhXpHtGHM
	GOfMBlkLJxJLIEJSbcNXve6ZCqWmp2eCafoHRNaZ3PUuzbK7qYCLdc6TSBzLvYrB0ndj/W
	zM5vgGegz1bpntdz+LXhe7bzmsIFoV5Ur63WUtiHtffZwvdl/aYDTXxOPyItLA==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=sha@pengutronix.de smtp.mailfrom=s.hauer@pengutronix.de
From: Sascha Hauer <s.hauer@pengutronix.de>
Date: Mon, 16 Nov 2026 16:19:03 +0100
Subject: [PATCH v4 3/9] dt-bindings: media: snps,dw-hdmi-rx: add a port for
 a bridge in front
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
Message-Id: <20261116-hdmirx-media-v4-3-7aee4a0a273e@pengutronix.de>
References: <20261116-hdmirx-media-v4-0-7aee4a0a273e@pengutronix.de>
In-Reply-To: <20261116-hdmirx-media-v4-0-7aee4a0a273e@pengutronix.de>
To: Dmitry Osipenko <dmitry.osipenko@collabora.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Hans Verkuil <hverkuil@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Dingxian Wen <shawn.wen@rock-chips.com>, 
 Shreeya Patel <shreeya.patel@collabora.com>
Cc: Gerald Loacker <gerald.loacker@wolfvision.net>, 
 Lucas Sinn <lucas.sinn@wolfvision.net>, linux-media@vger.kernel.org, 
 devicetree@vger.kernel.org, kernel@collabora.com, 
 linux-kernel@vger.kernel.org, Sascha Hauer <s.hauer@pengutronix.de>, 
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794842349; l=2518;
 i=s.hauer@pengutronix.de; s=20230412; h=from:subject:message-id;
 bh=O81aImaxAo88gdv3cWo0dJ3Qz6txOWMD5UhIrvBJMDo=;
 b=XvH2JFfGqCMSOP1MEbpjpfYldMay3CuSyJaUVK5mP2hfju6UkZ5cuS+rlb0l2SURgjYz0BX4g
 cvQjB6J9S0TD9aXsWZQZ2pGzEjJuaCzlOdkazb0DgubiFoRP7bebVF2
X-Developer-Key: i=s.hauer@pengutronix.de; a=ed25519;
 pk=4kuc9ocmECiBJKWxYgqyhtZOHj5AWi7+d0n/UjhkwTg=

Describe the OF graph port connecting the receiver to an HDMI bridge in
front of it. The schema sets additionalProperties: false, so without
this a device tree carrying the endpoint does not validate at all.

hpd-gpios is the +5V line of the HDMI connector, which the source drives
to announce itself. On a board whose HDMI connector belongs to such a
bridge, that line goes to the bridge and there is nothing for the
receiver to sense, so the property cannot be provided. The name is
unfortunate: the hot plug detect line the receiver drives back at the
source is a controller register, not this GPIO. Describe what it
actually carries.

A board has either the connector wired to the receiver or a bridge in
front of it, so require exactly one of hpd-gpios and port.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Acked-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
---
 .../devicetree/bindings/media/snps,dw-hdmi-rx.yaml  | 21 +++++++++++++++++++--
 1 file changed, 19 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/snps,dw-hdmi-rx.yaml b/Documentation/devicetree/bindings/media/snps,dw-hdmi-rx.yaml
index b80660da10505..c797aa7cc1698 100644
--- a/Documentation/devicetree/bindings/media/snps,dw-hdmi-rx.yaml
+++ b/Documentation/devicetree/bindings/media/snps,dw-hdmi-rx.yaml
@@ -63,9 +63,21 @@ properties:
     maxItems: 1
 
   hpd-gpios:
-    description: GPIO specifier for HPD.
+    description:
+      The +5V line of the HDMI connector, which the source drives to announce
+      itself. Despite the name this is an input to the receiver; the hot plug
+      detect line the receiver drives back at the source is handled inside the
+      controller. Absent when the connector belongs to a bridge in front of
+      this receiver rather than to the receiver itself.
     maxItems: 1
 
+  port:
+    $ref: /schemas/graph.yaml#/properties/port
+    description:
+      Connection to the HDMI source. Present when an HDMI bridge sits in
+      front of this receiver instead of the connector being wired straight
+      to it.
+
   rockchip,grf:
     $ref: /schemas/types.yaml#/definitions/phandle
     description:
@@ -95,7 +107,12 @@ required:
   - power-domains
   - resets
   - pinctrl-0
-  - hpd-gpios
+
+oneOf:
+  - required:
+      - hpd-gpios
+  - required:
+      - port
 
 allOf:
   - $ref: /schemas/sound/dai-common.yaml#

-- 
2.47.3

