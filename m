Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E147B274FDF;
	Sun, 20 Sep 2026 11:05:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789902348; cv=none; b=mk68Zip7STq7mfsYvAgRrTAfoRgXB9U1RZjyYsKbj1RXFTKfBy+v6tuP5hoKDq7WSkhR+MjzcA6dr4c6RAM8UxUxVocgoVupyVYm5V0Bmp9hr8jmCmAw8Bt0+A+g460lwU6UIXgiI1G0u0/dEX+UitzP/F7fBmeQ+UrTxQ1giqE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789902348; c=relaxed/simple;
	bh=rtR6voWlBp6nmy7r/Mw5s0EqVFPdv3nDJeJ4GzojCQ4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LFuWhr5ePpAmJ1mw9SZ37pCj/39ZhL9TNrU44snU3lZKEFoVxG/KS1C0SlR59I/dhJg1vNooaxt4UU/xtK0lYXsyAsr58oHksXyxcS69BZSGyQppllq10PwmC2VDrdo4QtSVq+DZtqmT6zjROVcLzh9gn7KmS8cWhRHkvQqJaNg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fd0j7+4y; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fd0j7+4y"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 8C4F0C2BCFB;
	Sun, 20 Sep 2026 11:05:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1789902347;
	bh=rtR6voWlBp6nmy7r/Mw5s0EqVFPdv3nDJeJ4GzojCQ4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=fd0j7+4y2WOMxKiwEfQmUS+Xv9TbAqzvIBRj9c850+4jcd/KN4aiAPH0HrxDZ6bXu
	 kEMHNXq0uiwWlz0AEs/+jwJvRuoQ93vsiRmeHdX4jvrWTRwTN0A/IpDrOCCjvaRZ3Q
	 3WLnnHsX3q7LZmubslfFCJshJgpUHbkm4+PXygDOnq3AB+PL6VHJmCvPWCKcSBgGDB
	 mMob6BeD8ldmwZPhwUoggOxYKEaPf4DC+Hk912Ue2ZdoTPrUdToBkwsIeUtVbQ1AEm
	 /lmVT1vbFzCiraex+LKkfoRW2hQtw+o32k+iFiA04gmwoOdHeWrmraDvGOAPHJz4lO
	 qsipwLP8cTMjg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A8F5C982EB;
	Sun, 20 Sep 2026 11:05:47 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Date: Sun, 20 Sep 2026 13:05:45 +0200
Subject: [PATCH 02/11] dt-bindings: display: panel: samsung,s6e3ha8: Add
 AMB630QY01 panel
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260920-crosshatch-panel-v1-2-de6e9512da96@ixit.cz>
References: <20260920-crosshatch-panel-v1-0-de6e9512da96@ixit.cz>
In-Reply-To: <20260920-crosshatch-panel-v1-0-de6e9512da96@ixit.cz>
To: Dzmitry Sankouski <dsankouski@gmail.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <jesszhan0024@gmail.com>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 phone-devel@vger.kernel.org, David Heidelberg <david@ixit.cz>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2442; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=K2rs3ud3gazsmGeLP5fMP4q2yS8qRIDd3AISDM3ybSU=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBqr74I3rDmLkqGSsIZDN+9uz4f1LGgo8qyM3CXq
 6B0H9X7JeyJAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCaq++CAAKCRBgAj/E00kg
 clSTD/9L6pf3JrF6YXl/a7X0d8gmOHJJqwinoKrwkOWltUBnw4VeXVFWZjcQzUn1B2DQPdNxpQR
 ioxQZgv0HUr5ZakzEM1S9lA/FdNe0jhbX+xl+YrCviYo24ktRsXwfmqQDHViNWwwChbgLI2n1KM
 SajESGv2o3jkrZO/LqKFwvCEdA6MNu9YETzljzqfv9szIWxSfdAK7ZPA+I9c6r8j/UwayF/1cqG
 4ddsf+6pV7dfBFH2xueh7wVGTEKzlghixT5BgqmGb20TIr4s3Fc4Sj1e+a+vxSIakc0Yw8ORL8r
 fvAlPP4lZSRRGTip/uCQgDweHM8TtuSW1gY8/X7D7dWOelvCr9Svza6SzOaoA5unTtN4kYSNZ35
 bL7jh4dnR1o5jnUrXHRSegnMZUL3hxd0SqRUWsxR7g7Tb4bnzq/Y2IGult4UafC/+LZm4BAiz12
 UnyZoGcMCJVRSTf+5T54ZD25LLzLSEmSSjHRDs9NVck3gnmXINAIh4GnFRC5M5vGI83i8qqDUqg
 RXkzeo8m9Kb3fmCymS0pTBWfGTK90VGy3r1vEGKnsuCvZg+4KxgAbB4Z0Y2wqKSyR0OxEs92gOm
 wO+B9j1+C1zsTELPlgVqAARJ/Ls3LMcFtP23GuqWmccwKPqcVRtIrYJlsLMoeD4b7m+WZ6qMsDo
 3HHk5Wg22gQUnlQ==
X-Developer-Key: i=david@ixit.cz; a=openpgp;
 fpr=D77A09CFEEDC2BBD53A7047460023FC4D3492072
X-Endpoint-Received: by B4 Relay for david@ixit.cz/default with auth_id=355
X-Original-From: David Heidelberg <david@ixit.cz>
Reply-To: david@ixit.cz

From: David Heidelberg <david@ixit.cz>

The Google Pixel 3 XL (crosshatch) uses a Samsung AMB630QY01 6.3"
1440x2960 flexible AMOLED panel.

Assisted-by: LLM
Signed-off-by: David Heidelberg <david@ixit.cz>
---
 .../bindings/display/panel/samsung,s6e3ha8.yaml    | 31 ++++++++++++++++++++--
 1 file changed, 29 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/panel/samsung,s6e3ha8.yaml b/Documentation/devicetree/bindings/display/panel/samsung,s6e3ha8.yaml
index ca250b1b91712..acc2ea2969298 100644
--- a/Documentation/devicetree/bindings/display/panel/samsung,s6e3ha8.yaml
+++ b/Documentation/devicetree/bindings/display/panel/samsung,s6e3ha8.yaml
@@ -7,48 +7,75 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
 title: Samsung s6e3ha8 AMOLED DSI panel
 
 description: |
   The s6e3ha8 is a display driver IC used in 1440x2960 AMOLED panels from
   Samsung Mobile Displays (SMD).
 
   Known panels:
     - AMB577PX01, 5.77", Samsung Galaxy S9 (samsung,s6e3ha8-amb577px01)
+    - AMB630QY01, 6.3", Google Pixel 3 XL (samsung,s6e3ha8-amb630qy01)
 
 maintainers:
   - Dzmitry Sankouski <dsankouski@gmail.com>
 
 allOf:
   - $ref: panel-common.yaml#
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - samsung,s6e3ha8
+              - samsung,s6e3ha8-amb577px01
+    then:
+      required:
+        - vddr-supply
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: samsung,s6e3ha8-amb630qy01
+    then:
+      required:
+        - vddpos-supply
+        - vddneg-supply
 
 properties:
   compatible:
     oneOf:
-      - const: samsung,s6e3ha8-amb577px01
+      - enum:
+          - samsung,s6e3ha8-amb577px01
+          - samsung,s6e3ha8-amb630qy01
       - const: samsung,s6e3ha8
         deprecated: true
 
   reg:
     maxItems: 1
 
   vdd3-supply:
     description: VDD regulator
 
   vci-supply:
     description: VCI regulator
 
   vddr-supply:
     description: VDDR regulator
 
+  vddpos-supply:
+    description: positive boost supply regulator (ELVDD)
+
+  vddneg-supply:
+    description: negative boost supply regulator (ELVSS)
+
 required:
   - compatible
   - reset-gpios
   - vdd3-supply
   - vci-supply
-  - vddr-supply
 
 unevaluatedProperties: false
 
 examples:
   - |
     #include <dt-bindings/gpio/gpio.h>
 
     dsi {

-- 
2.55.0


