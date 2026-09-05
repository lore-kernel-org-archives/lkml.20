Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B838631715F
	for <linux-kernel@vger.kernel.org>; Sat,  5 Sep 2026 21:33:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788644001; cv=none; b=SnuSTAVGGs7gebBM+ou3FimqOqi7QuMpzXwmWa6hrs5PHys+I8iaDnlQBJpo7ZphNXvLjz9vrkzey8jO4bC2DDXqmuQJFhiwDBxUqY8y1wNfOWqibtoQ6U/T+IPS+7MdEd0NLH5k9JjFtX588k+FO7ZV0300/kbBm5nBaIJlCJ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788644001; c=relaxed/simple;
	bh=u6r8H0pSqbZuRl447oiZjO+lUFL/LjDSOxn4d+FN7EQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BQuvtbBRdzXMiXkUxz7DW1wUuNKyUKPd0mPu2SIGECycTJAWDZx/Ia48GAkR/GCAZdJraAt3ka2c0o6Dqc5uTliqSKFBjxXhTJckVqzBJPYMVzXdKJ+HlB3DWEXqwDQgbMSDTYz5Nh+OmDzI/EmTuPQnqsPjv+fBP3nw+bJS7fQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=k8I4F3uL; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="k8I4F3uL"
Received: by mail-pj2-f12.google.com with SMTP id d9443c01a7336-2d6ff2f2c4dso1570915ad.0
        for <linux-kernel@vger.kernel.org>; Sat, 05 Sep 2026 14:33:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788643999; x=1789248799; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0lip8n6xP9eOpioWoISckMOq1UctyXUT+/l6I9kdKKU=;
        b=k8I4F3uLBGPAXocPXk7JSGmq24FNxNDftf5YXD4nDQ9hkmrF8gQPPsNTiGIa38IvOy
         hqN12AzIKk5MI2aG+pVUUK7FrOdc3cPzhIw3c7FucOgaVhaKN6yM1+1vRSjy3IHzwfKF
         kKJ6CbQky2OM/NZI+AiqB8yXBaCkjco+Od4wwJN4+tkgNyZQxESXNk3BpwHajwG/QbuD
         x2XsmZAqU49SlChSGdqQXLvzqTxMabD/8bKrZMJg+9dqSEEJYeoQIiOW5D0EEItlZSv/
         zgCwBhL9jNaxm+tH6rF1e8b11d4vfub3UtyUvkRytOKm8fjx73nKLJGz00sdRdXzL4aX
         I2YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788643999; x=1789248799;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0lip8n6xP9eOpioWoISckMOq1UctyXUT+/l6I9kdKKU=;
        b=Y4/qNPxI0FViA35nTT44if71iTTcos1uI6DSBc9KCA6BKLn8Mn8w3J9AdZYrk5IKkq
         sPP0uVktMJLSvgbcOuppP1aqIJXG+cXMHy+xzrKyjr7uo+yfI5TzzH+3foUe8xaEVQFg
         C93bPQiuQqohm6H/WC6N2Y1p5lddy0Ei6M8F/U/nkKIpN+1NfhuVoASTukhJNRcOoLnX
         FT/sHXB9pDpr55hGbJryoYbxhkmM3pfoi0ua/7hAveI9lEKG1a7Alqk3pB2E8aFvKa/I
         WgePafXcVEf0NQMHsw/PMDt8DRL09yuVvFMrr7wq2eBWE2EZwRnT3GPJgXnkcQmNrU8r
         XUyA==
X-Forwarded-Encrypted: i=1; AKwUvByFCMwSjUAN1N5QiMkZScy4igBuHa7+zJyu7AYFTOXxj9Ey9XuBY3WY13ToUyQw0WItCVM6AulBghQ5SBs=@vger.kernel.org
X-Gm-Message-State: AFuF++lIDLWukvE75vaocAroDG1oKNymMvQmwdvlVCl3bwJtYzjNWXtl
	9QnKPgMkDJnZ4WMOGTpIE7YAXStrRqxvaVivl8MrlgWFOJ4RxwUJe2UF
X-Gm-Gg: AYBFou2pMsPQ6I6oHEXcvUUm3JCxFmBcMjjfRnUf663L/KUhcn11eVioxZWpX3NtWqf
	kIdQ4JyYPae8TEqYz5svS89jPjf283FXmpkjUQ/ofRz0hrZyCe4aM7l8g/QORlvizU2Vd3+6/9y
	QluLTuLpTbLY05+O1s0MAA5JRnSX8+gmRmOxNe/S4iOfOsiam9xeBUnvSHyVFGUXkgEuc4knjaA
	ETe7JJrXXy9GjThKoRvsGqHFDBy3TSgVIHAD8JvcZwiCi3aLm0F274of6+xDr+2Q/2Y/wv918aA
	sQ2rlcuqUCIkIUgrP8eOXRkp8wh73Al6LpJsvPcXa6uBobYI92exR8b5ZqC1xm6U+oU9LsGZxQN
	wXO50WuCewfvQDQ5bTP/gswYGBBr8Qpm1fdHwWiYwFT02ojRY/UXBhpCjTTmpvW1tb1s32OlKJO
	FScUAzVZtxjgtPtEd6gd5uTVjTv1AWsyHOYmLYiO9bGB8q7P7KsiByG5CpDILFOINNosa6BmxA
X-Received: by 2002:a17:90b:4b0d:b0:38e:c140:2a0b with SMTP id 98e67ed59e1d1-39b3d78fb3bmr7308210a91.3.1788643999088;
        Sat, 05 Sep 2026 14:33:19 -0700 (PDT)
Received: from [10.63.138.252] ([2409:40c2:5007:4aea:63cc:914c:1243:e03c])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b08ce4221sm21538010a91.14.2026.09.05.14.33.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Sep 2026 14:33:18 -0700 (PDT)
From: Bhargav Joshi <j.bhargav.u@gmail.com>
Date: Sun, 06 Sep 2026 03:02:39 +0530
Subject: [PATCH v3 1/2] dt-bindings: clock: ti,dra7-atl-clock: convert to
 DT schema
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260906-ti-dra7-atl-v3-1-5962d8f608ed@gmail.com>
References: <20260906-ti-dra7-atl-v3-0-5962d8f608ed@gmail.com>
In-Reply-To: <20260906-ti-dra7-atl-v3-0-5962d8f608ed@gmail.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Peter Ujfalusi <peter.ujfalusi@ti.com>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, goledhruva@gmail.com, m-chawdhry@ti.com, 
 daniel.baluta@gmail.com, simona.toaca@nxp.com, j.bhargav.u@gmail.com
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788643973; l=3650;
 i=j.bhargav.u@gmail.com; h=from:subject:message-id;
 bh=u6r8H0pSqbZuRl447oiZjO+lUFL/LjDSOxn4d+FN7EQ=;
 b=M3fNS4yIIp7jbtVbfKEcIZDcNxe0nnEQnYIdXD+VhjyJvQQ64wRwj7mpabAE91nqRhYlrOkMq
 Uw8iZMeGyNMCu/kBFG9s/CUApyfKGHsL1gw3DXNDq0Mys8R64AHzAo4
X-Developer-Key: i=j.bhargav.u@gmail.com; a=ed25519;
 pk=IqNDwUZKECEA+n8wXctFLBbYL9NhFstZNbOznm/nX1k=

Convert the clock output portion of the DRA7 ATL (Audio Tracking Logic)
binding from text to DT schema. property clock-output-names is added
that is used by existing dts/dtsi.

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Bhargav Joshi <j.bhargav.u@gmail.com>
---
 .../devicetree/bindings/clock/ti/dra7-atl.txt      | 38 ----------------------
 .../bindings/clock/ti/ti,dra7-atl-clock.yaml       | 38 ++++++++++++++++++++++
 2 files changed, 38 insertions(+), 38 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/ti/dra7-atl.txt b/Documentation/devicetree/bindings/clock/ti/dra7-atl.txt
index 68504079f99f..e3c05844ae86 100644
--- a/Documentation/devicetree/bindings/clock/ti/dra7-atl.txt
+++ b/Documentation/devicetree/bindings/clock/ti/dra7-atl.txt
@@ -9,20 +9,6 @@ signals - can compensate the drift between the two ws signal.
 In order to provide the support for ATL and its output clocks (which can be used
 internally within the SoC or external components) two sets of bindings is needed:
 
-Clock tree binding:
-This binding uses the common clock binding[1].
-To be able to integrate the ATL clocks with DT clock tree.
-Provides ccf level representation of the ATL clocks to be used by drivers.
-Since the clock instances are part of a single IP this binding is used as a node
-for the DT clock tree, the IP driver is needed to handle the actual configuration
-of the IP.
-
-[1] Documentation/devicetree/bindings/clock/clock-bindings.txt
-
-Required properties:
-- compatible : shall be "ti,dra7-atl-clock"
-- #clock-cells : from common clock binding; shall be set to 0.
-- clocks : link phandles to functional clock of ATL
 
 Binding for the IP driver:
 This binding is used to configure the IP driver which is going to handle the
@@ -47,30 +33,6 @@ For valid word select signals, see the dt-bindings/clock/ti-dra7-atl.h include
 file.
 
 Examples:
-/* clock bindings for atl provided clocks */
-atl_clkin0_ck: atl_clkin0_ck {
-	#clock-cells = <0>;
-	compatible = "ti,dra7-atl-clock";
-	clocks = <&atl_gfclk_mux>;
-};
-
-atl_clkin1_ck: atl_clkin1_ck {
-	#clock-cells = <0>;
-	compatible = "ti,dra7-atl-clock";
-	clocks = <&atl_gfclk_mux>;
-};
-
-atl_clkin2_ck: atl_clkin2_ck {
-	#clock-cells = <0>;
-	compatible = "ti,dra7-atl-clock";
-	clocks = <&atl_gfclk_mux>;
-};
-
-atl_clkin3_ck: atl_clkin3_ck {
-	#clock-cells = <0>;
-	compatible = "ti,dra7-atl-clock";
-	clocks = <&atl_gfclk_mux>;
-};
 
 /* binding for the IP */
 atl: atl@4843c000 {
diff --git a/Documentation/devicetree/bindings/clock/ti/ti,dra7-atl-clock.yaml b/Documentation/devicetree/bindings/clock/ti/ti,dra7-atl-clock.yaml
new file mode 100644
index 000000000000..c0795f4abcfa
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/ti/ti,dra7-atl-clock.yaml
@@ -0,0 +1,38 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/ti/ti,dra7-atl-clock.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: TI DRA7 ATL (Audio Tracking Logic) clock output
+
+maintainers:
+  - Peter Ujfalusi <peter.ujfalusi@ti.com>
+
+properties:
+  compatible:
+    const: ti,dra7-atl-clock
+
+  "#clock-cells":
+    const: 0
+
+  clocks:
+    maxItems: 1
+
+  clock-output-names:
+    maxItems: 1
+
+required:
+  - compatible
+  - "#clock-cells"
+  - clocks
+
+additionalProperties: false
+
+examples:
+  - |
+    atl_clkin0_ck {
+        compatible = "ti,dra7-atl-clock";
+        #clock-cells = <0>;
+        clocks = <&atl_gfclk_mux>;
+    };

-- 
2.55.0

