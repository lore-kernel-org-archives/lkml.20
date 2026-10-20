Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=156.224.81.135
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792465779;
	b=NHZa/90hXtnbcAu5oDnKLKa1okc69dsTfMX5MjJYPEpAik3FX4t0N9thU800RVGKyYPu
	 fHhdVqSg2FPwutbLxc5bf/vgg7aDPZhtheHtpP9qmswdWRnAAEE/qoWiZf9ySz1BM7b19
	 nTHc7mbDEGmeGYc4mfmrZGm59BKOgUQY9L7HKCPAxbrt42jrx2IdS6ZZ2y+PTXUrEV0DV
	 gFI1HGi2uRgIIVtwmKfwpDR1nzNXlaKc19R8LJw44wG80hnKqLCHV5x8Q2PkXcO3S+8aK
	 Y84XuUiyS7wTPrxpihex3ZyY8GHaC6HlaLzXJHU5Or6oumzRjMLnMkZBynwqR73HiRw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792465779;
	h=DMARC-Filter:Received:From:To:Cc:Subject:Date:Message-Id:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:
	 X-HM-Tid:X-HM-MType:X-HM-Spam-Status:DKIM-Signature;
	bh=aqA05e3tEQzex5IV+W6xDQvoZ2RGk3y5IlP3Z09UWS0=;
	b=h6HhFizjPmnmX3zKiqtekpRaCCRYAdP5iMkzSzhXn2yVVblYNfOIkrFHc/MxKnmYdhvM
	 Cbw4ylkcqwmN/lm8dIhdtVxl0tDk68Xk6JDo/edgiNxJSi7ivG4ckMJxNOaoWrSbg5QX2
	 YvqpfYIYUZ47KYlktn4tJBeGCU2YVgT80vyKM3lplRYDUZXV/+MLorswjdhebV1AcPNHk
	 Plg6kwXeTe3yCRJ0idJzEeuNhsyCAcPGJvL1r6OOu+MBIUTtHBhWi9COETocN5/U4U6QF
	 q8jYbZuqDmIO/HBdUuK9fDRice4czi4g8sM5NUUHGij+6Cg0rJyWprfUobH3McEKuuQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=rock-chips.com;
	spf=pass smtp.mailfrom=rock-chips.com;
	dkim=pass header.d=rock-chips.com header.i=@rock-chips.com header.a=rsa-sha256 header.s=default header.b="f8b/MO0e";
	arc=none smtp.remote-ip=156.224.81.135
Received: from mail-m81135.xmail.ntesmail.com (mail-m81135.xmail.ntesmail.com [156.224.81.135])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B2E2606A31E;
	Tue, 20 Oct 2026 03:09:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8B2E2606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=rock-chips.com header.i=@rock-chips.com header.a=rsa-sha256 header.s=default header.b=f8b/MO0e
Received: from zyb-HP-ProDesk-680-G2-MT.. (unknown [61.154.14.86])
	by smtp.qiye.163.com (Hmail) with ESMTP id 51a4cee6e;
	Tue, 20 Oct 2026 11:09:26 +0800 (GMT+08:00)
From: Damon Ding <damon.ding@rock-chips.com>
To: Sandy Huang <hjc@rock-chips.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Andy Yan <andy.yan@rock-chips.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Vinod Koul <vkoul@kernel.org>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Robert Foss <rfoss@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Dave Jones <s.dave.jones@gmail.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	dri-devel@lists.freedesktop.org,
	linux-rockchip@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-phy@lists.infradead.org,
	Damon Ding <damon.ding@rock-chips.com>
Subject: [PATCH v3 1/6] dt-bindings: display: rockchip: analogix-dp: Add support for RK3568
Date: Tue, 20 Oct 2026 11:09:11 +0800
Message-Id: <20261020030916.3223833-2-damon.ding@rock-chips.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261020030916.3223833-1-damon.ding@rock-chips.com>
References: <20261020030916.3223833-1-damon.ding@rock-chips.com>
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
X-HM-Tid: 0aa15749095003a8kunmfd20f05334c736
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVlCQxkeVh1CSBgfT0MdGUpCHVYVFA
	kWGhdVEwETFhoSFyQUDg9ZV1kYEgtZQVlNSlVKTk9VSk9VQ01ZV1kWGg8SFR0UWUFZT0tIVUpLSE
	pKQk1VSktLVUpCWQY+
DKIM-Signature: a=rsa-sha256;
	b=f8b/MO0ehj3Q58MW0sg3fHABf8jei7ay2nU8Ptanbnxs50JXWxgjLWUKEOlA0DASlOICdM3O4p+J8upJFSHdaSbZrNoX7jykGQMWE7vbPFHHTd3dEv9mPNfcpUHxXgXfm7J4mysFjuckFMj5q+IHcqBde5VsZkw2UK0ARQ6tDp8=; c=relaxed/relaxed; s=default; d=rock-chips.com; v=1;
	bh=aqA05e3tEQzex5IV+W6xDQvoZ2RGk3y5IlP3Z09UWS0=;
	h=date:mime-version:subject:message-id:from;

Document the "rockchip,rk3568-edp" compatible.  Like RK3576/RK3588,
the RK3568 eDP controller has the dp/pclk/hclk clocks and dp/apb
resets, but unlike them it does not use GRF registers, so make the
"rockchip,grf" property conditional on the SoC.

Also document the optional avdd-0v9 and avdd-1v8 supplies, which are
needed by the RK3568 eDP controller.

Signed-off-by: Damon Ding <damon.ding@rock-chips.com>
---
 .../rockchip/rockchip,analogix-dp.yaml        | 25 ++++++++++++++++++-
 1 file changed, 24 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/display/rockchip/rockchip,analogix-dp.yaml b/Documentation/devicetree/bindings/display/rockchip/rockchip,analogix-dp.yaml
index 39dafe75a680..f8670a4e0430 100644
--- a/Documentation/devicetree/bindings/display/rockchip/rockchip,analogix-dp.yaml
+++ b/Documentation/devicetree/bindings/display/rockchip/rockchip,analogix-dp.yaml
@@ -15,6 +15,7 @@ properties:
     enum:
       - rockchip,rk3288-dp
       - rockchip,rk3399-edp
+      - rockchip,rk3568-edp
       - rockchip,rk3576-edp
       - rockchip,rk3588-edp
 
@@ -47,6 +48,16 @@ properties:
       - const: dp
       - const: apb
 
+  avdd-0v9-supply:
+    description:
+      A 0.9V supply that powers up the SoC internal circuitry. The actual
+      supply source varies between different boards.
+
+  avdd-1v8-supply:
+    description:
+      A 1.8V supply that powers up the SoC internal circuitry. The actual
+      supply source varies between different boards.
+
   rockchip,grf:
     $ref: /schemas/types.yaml#/definitions/phandle
     description:
@@ -61,11 +72,22 @@ required:
   - clock-names
   - resets
   - reset-names
-  - rockchip,grf
 
 allOf:
   - $ref: /schemas/display/bridge/analogix,dp.yaml#
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: rockchip,rk3568-edp
+    then:
+      properties:
+        rockchip,grf: false
+    else:
+      required:
+        - rockchip,grf
+
   - if:
       properties:
         compatible:
@@ -100,6 +122,7 @@ allOf:
         compatible:
           contains:
             enum:
+              - rockchip,rk3568-edp
               - rockchip,rk3576-edp
               - rockchip,rk3588-edp
     then:
-- 
2.34.1

