Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794141156;
	b=iHdnOd8s76FIZa7lCt7pt4z8L/ZamC06suEYvcc3UaJi717m9KzXQsAFCVMpEoShvu/n
	 NdQDjDXb/Xr6+vaExciFXqB3HUoGRcW0JAxZgQScNtJ+dwktHryhD7bTIZNGCpeN78QO3
	 dHhGxTnkKFa3VZtW/Cacohd8PKPeQwZxhlHc744bmcpmY2dsMwDZZUDQA4S+WubHd0tYp
	 iE7qW0w8hXWmzTj047xWWqkIdcE0qZOuPqrTBc5qdQu0/ztOLKjXgKfHZdNN9imVy15KH
	 hC2RnBWvgRGFZPg/ZQ86zgVuUgGPHs6x9tXDuQ0hJCmnd4Gpe+sf50DVtdMfteakD2g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794141156;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=GLLe1braUPSUPaaRYUmJAkJ9EHEZF9eAse/xx5jlc48=;
	b=esSin81YLBIPrp47hMeibdYh2e3iDWzOpXfcr4G19xypPBlrSmHtZbCh9Rhd7goBg+5T
	 RP1orhMide47V0+ldw2wQAv1DF3pDkdnO7T8AZqSHPZKvcYyi1Z86lY4plBfbn7NQpDco
	 2b9ZTq3ZXAtkD6lkowHbYDkE40zy4DPZBOtab+K4KyUJL47QKesjKTld8lWJXG+dxI51u
	 Duq2nBa0CTDwICefMClihrY34IrLsor+vN2hZuRCw1YtlAljqXru9lKm3xzOhVBSX4Taf
	 CIHoab+hgh8AbDaS1T5fzgc8GDurijWE8ZLXCxqrlC4luOgrAchUGS9/N7OVoCJ9DVQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=oP8f41Q8;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6003606D802;
	Sun,  8 Nov 2026 12:32:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=oP8f41Q8
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794141155;
	b=CVyb2Tyoa5Y87TlUOF9zUvloXelHSD8kp+cQYrSSqcLAIOm5X5CgpUKzzGWTggYVLjgk
	 GT8KruJyCOkTMXhVyjqNfoogGunc1qCDSwcaI4ySCIvpjXkJb+VQPbeW94FiHmrn+j/TR
	 CT358qxD2vuQsUSxjEJMGY6tzSFZyNE39t8OJ6i/3bqhobRL02jJQmRhhGr1lp8c+ONQP
	 /pUNMAFa6ixvXrPKEFaSVbz09Ogcwspre+lKTRF5EEN3d3tDPKyn6nNLhaVIS1CgYISEF
	 oS+7p0OlBfE7zFsxRnJogfNg8vVhdHDFAe757IHHYGmonuiUIdkN//+BPXjT/h9hWCQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794141155;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=GLLe1braUPSUPaaRYUmJAkJ9EHEZF9eAse/xx5jlc48=;
	b=fJOw3qqvY5iz/lwkqVsLq0HcmhtKb3/DwXvIdcyQ7SD88mluWebRkglzLjUJGoPXIv4L
	 h4ulkDpDSK8xMpFFqkdkP8cpU67sy4CfzlDSxQLkDzG62wptm+diaSfX6Jlisn5/X7xaR
	 uZUIoXuI+0uhPfrsN6nKA1ijHt9B5oj3YAgRSkFKJWbXH7GqMkI2DaHauwsJrsnjBjhTz
	 vin/r4QpGbP0G8sR3Veh+eL+BaQTng0H2zKHq6AuQ2PS0egz4Er3GO0D5AKaARIjM3nlC
	 VmW+eIrfH4ux9s3PqRdG/0V8ot+2OMq9OBYUzJUkPTSTkaWP5M28fEQEfTUjxTopKJA==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id C22101F008A2;
	Sun,  8 Nov 2026 12:32:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794141155;
	bh=GLLe1braUPSUPaaRYUmJAkJ9EHEZF9eAse/xx5jlc48=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=oP8f41Q8lQjbJTDn4kGvs2yetRGhwNRli/1iZoToKMxyCkHamPz5GSL+wkJZjkNkF
	 VeA/3mJDAXi9AwFNocH2NqHOfYrmKVg/RUv5bjAOpWiCPxosUG2teqkHq4GYc2rBXN
	 8mxKzVfz69o1udpRV9GSvLtrNjBTAXsX38vZ2jo9H/RwgKhAaRWUf3hgwKhjFLxphL
	 9YUuMoet/wvA5MjP5ek31pSY/sVjrYwnS0MRQ5PA/dJ9rbsQ1HsveiXvwREZnyCa/R
	 +146J1x1doK8fpYZG2LMOUSObAkDJuez+v44AzEwAEcEUsdXk9rdwUQ6q3v8NG+tHI
	 Kt8oqipkZN/qA==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 3513B47F64;
	Sun,  8 Nov 2026 12:32:32 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Date: Sun, 08 Nov 2026 12:32:22 +0000
Subject: [PATCH v3 01/10] dt-bindings: display: panel: s6e3ha8: Adjust to
 reflect the DDIC and panel used
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
Message-Id: <20261108-crosshatch-panel-v3-1-87dd4ec4f7cc@ixit.cz>
References: <20261108-crosshatch-panel-v3-0-87dd4ec4f7cc@ixit.cz>
In-Reply-To: <20261108-crosshatch-panel-v3-0-87dd4ec4f7cc@ixit.cz>
To: Dzmitry Sankouski <dsankouski@gmail.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <jesszhan0024@gmail.com>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Petr Vorel <petr.vorel@gmail.com>, dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, phone-devel@vger.kernel.org, 
 David Heidelberg <david@ixit.cz>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2975; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=bCI70Ma/U+zJcvXa1KpwjrQ7vo8FAFDbk7uYrnm4lLI=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBq8GveaIquAhkhLur3qjLmroRnwzNbiX0IWIrKO
 X9wyEQbbRCJAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCavBr3gAKCRBgAj/E00kg
 cjOfEACZu0LbqU0L/NPEBB6vyHGfjXGHAZJUr+mtaLnBVo855ftQx/u5mX6GoxNm48MYITeqhFf
 UN/CwEYcnjP428NT1KPPeaDgdJbuvGp/FEvAyW1sscC+3tiKuMM154elYaNcKRSW1YMbm58ztJq
 pZe/pNVKgTZCz0w0+UtQ1NZj+cOf92o1lANd6XinlyUEMsILRGxS40Z4xD2MuCuSbRQIult0lEV
 rgV4Nq22kXgMVbHk9uwZsKN6iXe2+fiPKjM5VQjLwk2TIvuJx97ShTTvQLAU1OBBlQ81v/jKJUO
 cCakLiNRUDlLGCiKfddNbrGkyXKweu+4Ac3SU8zu1HwAS5hj4fxvYM83iOjLWKSAIky3H79vbpd
 r5bFmxn04rmfDL3frHplZyn6aeUb+liNDUlQFu6lezNsApmMeX3sYNAjDqTBq/73ae7rLRDBsGP
 mJ3sWcb71qb6sGpvAVR5idL9xGb0mqCevTleJInpgrtVm2uTbp+2E9SxFlM44HHNquvc1uS6QQ+
 5tl+zakpziPYC6szDb3dg0hDCg41RE0BnJzqIPfdsVVxoNzPxGCe/kvFiFfpu9Hy4PurkaLRPCc
 6sQl8QC0Mm3PcBMFJdOdcqdtGcHLWOD54CbNOCvP7iGAHeTFx630UH1pz7xTNrQSEw49kKmw6kr
 Ux5vCfVG3UQVaJA==
X-Developer-Key: i=david@ixit.cz; a=openpgp;
 fpr=D77A09CFEEDC2BBD53A7047460023FC4D3492072
X-Endpoint-Received: by B4 Relay for david@ixit.cz/default with auth_id=355
X-Original-From: David Heidelberg <david@ixit.cz>
Reply-To: david@ixit.cz
Content-Transfer-Encoding: 7bit

From: David Heidelberg <david@ixit.cz>

S6E3HA8 is the DDIC, while the panel used on the Samsung Galaxy S9 is
the Samsung AMB577PX01. Introduce a compatible reflecting that, adjust
the example, and deprecate the DDIC-only samsung,s6e3ha8 compatible.

We're going to introduce another panel with different sequence, so keep
calling original panel sequence just by the DDIC name is confusing.
While we at it, we can cleanly fix reversed GPIO polarity.

Update the polarity to better match newly introduced compatibles with
fixed logic.

Signed-off-by: David Heidelberg <david@ixit.cz>
---
 .../bindings/display/panel/samsung,s6e3ha8.yaml         | 17 ++++++++++++-----
 1 file changed, 12 insertions(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/panel/samsung,s6e3ha8.yaml b/Documentation/devicetree/bindings/display/panel/samsung,s6e3ha8.yaml
index 00ce5a4e1c6be..ca250b1b91712 100644
--- a/Documentation/devicetree/bindings/display/panel/samsung,s6e3ha8.yaml
+++ b/Documentation/devicetree/bindings/display/panel/samsung,s6e3ha8.yaml
@@ -1,28 +1,35 @@
 # SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
 %YAML 1.2
 ---
 $id: http://devicetree.org/schemas/display/panel/samsung,s6e3ha8.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
 title: Samsung s6e3ha8 AMOLED DSI panel
 
-description: The s6e3ha8 is a 1440x2960 DPI display panel from Samsung Mobile
-  Displays (SMD).
+description: |
+  The s6e3ha8 is a display driver IC used in 1440x2960 AMOLED panels from
+  Samsung Mobile Displays (SMD).
+
+  Known panels:
+    - AMB577PX01, 5.77", Samsung Galaxy S9 (samsung,s6e3ha8-amb577px01)
 
 maintainers:
   - Dzmitry Sankouski <dsankouski@gmail.com>
 
 allOf:
   - $ref: panel-common.yaml#
 
 properties:
   compatible:
-    const: samsung,s6e3ha8
+    oneOf:
+      - const: samsung,s6e3ha8-amb577px01
+      - const: samsung,s6e3ha8
+        deprecated: true
 
   reg:
     maxItems: 1
 
   vdd3-supply:
     description: VDD regulator
 
   vci-supply:
@@ -44,23 +51,23 @@ examples:
   - |
     #include <dt-bindings/gpio/gpio.h>
 
     dsi {
         #address-cells = <1>;
         #size-cells = <0>;
 
         panel@0 {
-            compatible = "samsung,s6e3ha8";
+            compatible = "samsung,s6e3ha8-amb577px01";
             reg = <0>;
             vci-supply = <&s2dos05_ldo4>;
             vddr-supply = <&s2dos05_buck1>;
             vdd3-supply = <&s2dos05_ldo1>;
             te-gpios = <&tlmm 10 GPIO_ACTIVE_HIGH>;
-            reset-gpios = <&tlmm 6 GPIO_ACTIVE_HIGH>;
+            reset-gpios = <&tlmm 6 GPIO_ACTIVE_LOW>;
             pinctrl-0 = <&sde_dsi_active &sde_te_active_sleep>;
             pinctrl-1 = <&sde_dsi_suspend &sde_te_active_sleep>;
             pinctrl-names = "default", "sleep";
 
             port {
                 panel_in: endpoint {
                     remote-endpoint = <&mdss_dsi0_out>;
                 };

-- 
2.55.0


