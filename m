Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B470374E46
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 03:17:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788405429; cv=none; b=ny7AyEgH292x24lE+J9f7/jaZ5AaN9zEzM7smv0iUGvX6ca0qga+mZ5RP0wA7fNNPb++0B41lgnQFR3Z0LH+rVsxeIN4bmSkBjj7zi3awl/sC8zrS6ip2N83jdWmqPOfcIGYnxkBka2hqPkE1VVHM3zLbAnZNHZ2KDkxert7P3E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788405429; c=relaxed/simple;
	bh=xfLwN1G+HlsExvrUNsOEe+WbN3dPn7HjsbyOumjvMds=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oFL9iFol9BZX2mqwWJxTGpwFmygoGd4VhRndrJSZcpAXv5QzTFMYz+G7z1M9b+dhtitFo6nIsLSBADRPtkyewaEAEy9YVHT69gJCAkiFyLCsdWuk5J6buCniCyOEiXBGUpG9EI6dPH95twKIzOxDZ4R53zhOJwAdDVvzXOfFXQY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=i7Jxqm/7; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="i7Jxqm/7"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2d032846c95so22632825ad.1
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 20:17:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788405427; x=1789010227; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2YOr/QpJoSwvrQj9qbBH1jCsIxrm/W8lOOhFj883C40=;
        b=i7Jxqm/7WejyZskOpJrAagtpU2wqeTz1tqP3fa3PYs9LEQdZQ1zs4FfkNomU0ik+vn
         +gz27rJdwbWxFQjlAtw0vD9u/E6A5IqSiQuRwM8QAWME+2d74icpgdNOzEsabnMsD2Eg
         NcIJS0I6t7/npRJDkKDiGtF/0I0F3JyDx9LCwwOdMPM7+e8ANV3YnGbZoONfxPYdMO8R
         BPqA24pzoxKIVziMUtzOuRQdw7R57T1KCCT0HbF3WMjShCVyy6K3rV+FRwM76IhDUFKy
         3Ncn5cFMDsDL30utsWGuHzxCPnR5/ZXsUHYm/f1tX0Orny+DPUpK07m2EQ6HSkv+7Rcs
         u/RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788405427; x=1789010227;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=2YOr/QpJoSwvrQj9qbBH1jCsIxrm/W8lOOhFj883C40=;
        b=nUMWsgMNvctn9imBrhM+S0/Y2v8OZIwkAg90Qo7vOGTKhSnOY761PdkBm6gtdZsJsf
         yAZRhWaOu6JoLFXnjuDqyRWv8f5d/QTfbwtd8rrh81P42U2qK9nxvQ4NB+i2YkoYFaFF
         DmHqxOJMNMmgJw++44LMegLl8sajhJn+XT1rhEGB34YSKLkrdIoQZDidAqLf3v/uJv5/
         Wvd/lfL3D4dExiGFxhhw+cQ5rbFtd46dbwRlFCUTskF52mKRHw00Ei7saHcHTsl25k5k
         eCm+/5FvKyzVQP1dV1v8IuwoerXgtujS66ouQ05iuycCWclxumGWEku0NfPn6zglblYN
         JC0g==
X-Forwarded-Encrypted: i=1; AKwUvBxipFfuVChyLT64bJijR9XRCx0drKtko4WQHoKkHf8VzHFHvj+472r+o4GjzPYutIR10eJjpW0d5oxbdNs=@vger.kernel.org
X-Gm-Message-State: AFuF++lBTRZWaVy3cY/fn97odFEGJgx+wYC0bTlFIuMHToe4U88Rvem3
	c97GaaiCzbwtV3vL1FmmkeO2piSYvudvLAm8dzMYM3DTbzhpr5GVe6g9
X-Gm-Gg: AYBFou0KQinYiL/kYJq3Ru3veUMPlnYpp85YdzMcSP9e0VxNVLvht+9Na+eyAgd93Ll
	1eC84kc4uO7Y+pBKcrki0J2qM/AlyKUPik21gxD3XnQ9kzaafX5cnAu3Mbm6wxEm1ma85Ui6idq
	VLYTNNlOqLL37RsYSTK+37cCqhBgDsXeNUIJmO82r/3ybWn+/dzmRlogERAx/IrtDgOSG0IGhu0
	F+8yxh7RnzAsdApptf7+jnRbGl+/CNEJ6wuXmzm1PRxafcbVgd81YrI8CMmGJ87H3jQR6IPvsWt
	yjZsPWkjTeIYfipDDVdUu58nlbKXoGYi7oNkfzOtM9oGr7nN7vJfcR6GZzK47hlWHNWLANkSe6t
	K73AkUK6PHTDGFtPgkWcGUhKw/MpmOJhC2b3h73WQmujbdfB0QtVwu1L5UyJUAFgDLtL18D67YU
	6L/BTlc5v1MTfwtHQTw5b/q5phuDpPCn6kefTakBH7an6+5Q+eHngvjrqNLicxEMuiyfrfzjvsC
	HBg7Y9DWVPkVdl/6F7APLzEog==
X-Received: by 2002:a17:90a:f94f:b0:398:bacb:1137 with SMTP id 98e67ed59e1d1-39aee21a4demr15444319a91.19.1788405427390;
        Wed, 02 Sep 2026 20:17:07 -0700 (PDT)
Received: from d.home.yangfl.dn42 ([2a09:bac5:661d:3050::4d0:16])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b08c397b1sm2244114a91.8.2026.09.02.20.17.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 20:17:07 -0700 (PDT)
From: David Yang <mmyangfl@gmail.com>
To: netdev@vger.kernel.org
Cc: David Yang <mmyangfl@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Vladimir Oltean <olteanv@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net-next v12 5/5] dt-bindings: net: dsa: yt921x: Add LEDs definition example
Date: Thu,  3 Sep 2026 11:16:26 +0800
Message-ID: <20260903031630.356840-6-mmyangfl@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260903031630.356840-1-mmyangfl@gmail.com>
References: <20260903031630.356840-1-mmyangfl@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add LEDs definition example for yt921x to describe how they should be
defined for a correct usage.

Signed-off-by: David Yang <mmyangfl@gmail.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 .../bindings/net/dsa/motorcomm,yt921x.yaml    | 23 +++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/dsa/motorcomm,yt921x.yaml b/Documentation/devicetree/bindings/net/dsa/motorcomm,yt921x.yaml
index 33a6552e46fc..93ba5b181205 100644
--- a/Documentation/devicetree/bindings/net/dsa/motorcomm,yt921x.yaml
+++ b/Documentation/devicetree/bindings/net/dsa/motorcomm,yt921x.yaml
@@ -21,6 +21,9 @@ description: |
 
   Any port can be used as the CPU port.
 
+  Each port has at most 3 LEDs connected and can be declared using the standard
+  LEDs structure.
+
 properties:
   compatible:
     const: motorcomm,yt9215
@@ -59,6 +62,7 @@ unevaluatedProperties: false
 examples:
   - |
     #include <dt-bindings/gpio/gpio.h>
+    #include <dt-bindings/leds/common.h>
 
     mdio {
         #address-cells = <1>;
@@ -113,6 +117,25 @@ examples:
                     label = "lan1";
                     phy-mode = "internal";
                     phy-handle = <&sw_phy0>;
+
+                    leds {
+                        #address-cells = <1>;
+                        #size-cells = <0>;
+
+                        led@0 {
+                            reg = <0>;
+                            color = <LED_COLOR_ID_WHITE>;
+                            function = LED_FUNCTION_LAN;
+                            default-state = "keep";
+                        };
+
+                        led@1 {
+                            reg = <1>;
+                            color = <LED_COLOR_ID_AMBER>;
+                            function = LED_FUNCTION_LAN;
+                            default-state = "keep";
+                        };
+                    };
                 };
 
                 ethernet-port@1 {
-- 
2.53.0

