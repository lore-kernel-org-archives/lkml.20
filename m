Received: from mx1.white.stw.pengutronix.de (mx1.white.stw.pengutronix.de [185.203.200.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9548936A01A;
	Mon,  5 Oct 2026 13:28:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=185.203.200.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791206913; cv=pass; b=asYXFFHJnHjuvRDi4HBNPPg93OWm+WjgBfqdKJYvTttHBUHOMckIRLr0oXXw5prou8LO3TK0WLNPG3LVWZnkqCcVvbISHQRikWCuHZkXWUqpcF9IvsZuKf6oBsNwCY9IMEF2UcwM/rS67opRa5MwA06L2XLn2Tr/05MARikCwdA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791206913; c=relaxed/simple;
	bh=BDX7bV7uRXxeOd8hnoC74kDZeU97deA6YAaZvloyshE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gs/rW8clauc1l7GemDSfBg5LZZ27PjXRizNvnBx+aACMtQ66tibik5UPvji46vVWc9F8dT71Hl9BYLMYCKBfhdixWYAF1mu8DHwHA4KfM5qAe3T2dWgrIuKAlBMGK4TP6SkWkdgRAXCIsq6oDp1WoTav4BLwRvh7Bx8UDkhaIpQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; dkim=pass (2048-bit key) header.d=pengutronix.de header.i=@pengutronix.de header.b=Z16ECvK/; arc=pass smtp.client-ip=185.203.200.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pengutronix.de header.i=@pengutronix.de header.b="Z16ECvK/"
Received: from [127.0.1.1] (unknown [IPv6:2a02:560:5ca5:d100:9ebf:dff:fe00:fdb5])
	(Authenticated sender: sha@pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id 81CD8202340;
	Mon, 05 Oct 2026 15:28:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1791206902;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HyERwnxIqFJwaJuqYjVDaqQvvACrYm++uN4i9C0H3lg=;
	b=Z16ECvK/EC1fwV5Lh+L008d8peMl+FJuVI0uA1Ap5IyHXEbAJoWk6fnZFRxOmmlIPv+Z3F
	o+O6dpri46sCzazEYZo9uOvWRWWyyAnU9Ki/NqgVbfKdK1W+EdQTZdD19F99g2TkfDsQZM
	OE+HFUwuNDcOKhpupBPKsoueBPkfKOdhpvOFH5BlhxdvLn3JS16JCpYnTezML0Q8zHi6Gm
	RzrEGaybMNOVyw3IFWJ7l109rJYR0VxxEHlaRORZW4Sh0rC+DTPzrYA5Rk82dtEuRqL4gB
	v313KvGLdSg9AUN/0x+gk95hvjah/MGFiP5ThGqQhoEuIHLE2+B/rZlRAnCS0A==
ARC-Seal: i=1; s=20260414; d=pengutronix.de; t=1791206902; a=rsa-sha256;
	cv=none;
	b=fdjyWCQMWhqwQaIeLQjgxPZShEHUCqvyVutPPoOywOfawFFLBlzKcv43W/3aVSN+BvqDfE
	kFkeSRbxwP+InqhN7CIaDqSampXrp0xt1RWGbbXHZZzEDUxl07dDP1covl/+91o+Gjk3T0
	ns1Kj2WmPws5WIGRCclu59j0Hw9yFZlCbba8qEk+L9mntn25s6M0vRBzf3rjw0CgiKBPgL
	SBHewKTkLKQCQT55aQBdJ8RJ9wAPBZ4XLTLVgv4+918AXqZg0AJiqIUh0tf1rA8gxJLnTZ
	Ohoe80CtNi2LxHky+07GkkdSeX/FM42SupBvEYqtC1HimsRYqnBBb2RkpJdLfQ==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=sha@pengutronix.de smtp.mailfrom=s.hauer@pengutronix.de
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1791206902;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HyERwnxIqFJwaJuqYjVDaqQvvACrYm++uN4i9C0H3lg=;
	b=d2OrhL73f5JAZwyWPi/C22U60k51D8RDQSWP5eqr7ARK6Yt4Jil3OCbFT4UlK45Chym4td
	/PaCVTI8txjvOAEckivaX02yM/uTI1ObKzLxqkhGIBtxkKEdOJsEcb81ERsuhTUNxA9izT
	o2ogG+csG0Z0gTdmttr3522OhomaLrOZccJg9/2tuyaMbLfdNAFM/lxwKFsxKMqLVaBv0N
	wzbuu7z46gu3kUZp/8EMlykTH9L4BjbtgdQVYU6vAranoJKIZ5tw7hRzx4uKaxftYAI+Xk
	h0Cf4WK1L8xeu4sjZ9czYKOUZOtRrdib299qvqYcscDP5P9HXlFNU+7wjL511g==
From: Sascha Hauer <s.hauer@pengutronix.de>
Date: Mon, 05 Oct 2026 15:28:23 +0200
Subject: [PATCH v3 04/10] dt-bindings: media: snps,dw-hdmi-rx: add a port
 for a bridge in front
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261005-hdmirx-media-v3-4-71a11a2e3e76@pengutronix.de>
References: <20261005-hdmirx-media-v3-0-71a11a2e3e76@pengutronix.de>
In-Reply-To: <20261005-hdmirx-media-v3-0-71a11a2e3e76@pengutronix.de>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791206902; l=2457;
 i=s.hauer@pengutronix.de; s=20230412; h=from:subject:message-id;
 bh=BDX7bV7uRXxeOd8hnoC74kDZeU97deA6YAaZvloyshE=;
 b=NeVcQYVeh9Ju2n0fOS2eQPiePaOEPTFijuW8lLFiKB4eJOLQLCtUPsXcZFCylvy2NVafF1EBS
 Ur1rtZmVcJxCK2c5Jna1I6gG1cpVGINukUbwgZwWrIBRQgkJuig8vCG
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

Assisted-by: LLM
Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
---
 .../devicetree/bindings/media/snps,dw-hdmi-rx.yaml  | 21 +++++++++++++++++++--
 1 file changed, 19 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/snps,dw-hdmi-rx.yaml b/Documentation/devicetree/bindings/media/snps,dw-hdmi-rx.yaml
index b7f6c87d0e06a..896f8ffbb5bf9 100644
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
@@ -88,7 +100,12 @@ required:
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
 
 additionalProperties: false
 

-- 
2.47.3

