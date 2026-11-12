Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=57.103.72.83
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794444435;
	b=S1m3M6LeUOTNXoJD0PzSASzzio2n/aK5ez9pZVKGxYTNeyEQJ1gADiTdsoMmadvRCkoE
	 pw1d+cukCwNqkiH1U8sPS/S2srmYg+HtbHBWRfRUc8IuquLu57nGNYUvc41MfwMTgtlvP
	 1YXO1fgVQXGvS/z4kPkVRSuAUUlwcFaNA/QK1tqWXfwLr/tS5aQcOyfYIrbVBcWzXYK41
	 Jb8f6HktNgR0GEWKeTT79fOHtQd/IrMukvdNKO0FxIJJu/F2RpX/UGKWZpBQuc6+HhmQi
	 85h7eb9hENyJM2npGM4F0Ej3yb6GGKqmau8s1zlCydFmkZQGmEVZjt7gUB32IhN3iIw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794444435;
	h=DMARC-Filter:Received:X-ICL-RepId:Dkim-Signature:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Info-Out:X-JNJ;
	bh=6FnrMatbIm7w3exd0SYt59kCqIln8Ce3NVwV6c1+Ago=;
	b=qCVgSygwONLhmWTVsqEC/QV0xGHUxqTuszZl13gG2SuyHjrIoURKy6dYMGoW+w1zrj6+
	 8z7BpXU0kNDKSDrnrWOwNj8MNjHvQaLwk1+1FMtcRXiqkPFPq438AgIWSmaTj4BkBG1Hg
	 90ELZsLnZWnmX+XhkjW0GD9dv9GA1MJXtlEWTQ2lyJ4KPfTLm/Gt8GZIfySU26GYcV4ad
	 yFyUG8Z4eLp0QyMLCeYqCysr82aBLYmOmQskIUnk/PzpQ2v4Vd6xL6CoklGAJCgS3WQgI
	 HHslZ4MDSM9C+d36a/AjdxBYPGMgRVfxWAgDKbxIZjgeovWwlFdHqPuleFBtvFbZlCQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=icloud.com;
	spf=pass smtp.mailfrom=icloud.com;
	dkim=pass header.d=icloud.com header.i=@icloud.com header.a=rsa-sha256 header.s=1a1hai header.b=QEsCelNC;
	arc=none smtp.remote-ip=57.103.72.83
Received: from outbound.ms.icloud.com (ms-2005b-snip4-11.eps.apple.com [57.103.72.83])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5010B606A884
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 00:47:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5010B606A884
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=icloud.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=icloud.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=icloud.com header.i=@icloud.com header.a=rsa-sha256 header.s=1a1hai header.b=QEsCelNC
Received: from outbound.ms.icloud.com (unknown [127.0.0.2])
	by p00-icloudmta-asmtp-us-west-3a-20-percent-0 (Postfix) with ESMTPS id D9A5A1800340;
	Thu, 12 Nov 2026 00:47:09 +0000 (UTC)
X-ICL-RepId: 01a1cd39-09cd-769f-8328-3df42a1f331e
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=icloud.com; s=1a1hai; t=1794444433; x=1825980433; bh=6FnrMatbIm7w3exd0SYt59kCqIln8Ce3NVwV6c1+Ago=; h=From:To:Subject:Date:Message-ID:MIME-Version:x-icloud-hme; b=QEsCelNCQrdSjDD+nrgtKQXirtedyUqnXBJHp/e7RtMNMrOiF0c5jluHpcYBMY5hzSBD7GNJmYY9ktU9tnmwpMd6LTYQAnKZ3kLV14k12nkq46OS7qwfp2KEMqm4HRAG2JeVcTtRsJHpnPYUNpGmYf434n1uH8uKtrN9jUTrWWnlm0cQ9MjOLdTTVitdLQfvesBqADdjx2C1zUFyjYg7yZ2sm3X+I4CXNMHa7rmigUigfW5iVVJxWGNdffFe/MHtgFZl05byNUzoloMEvNTEETFhMfU24FLx2MguA7tMP2YMIVc20oGhCcDV3Aq2ldHWETueHqEHiVwskb8dcHQY6Q==
Received: from bigre.tail98293.ts.net (unknown [17.156.208.39])
	by p00-icloudmta-asmtp-us-west-3a-20-percent-0 (Postfix) with ESMTPSA id 8A992180049C;
	Thu, 12 Nov 2026 00:47:07 +0000 (UTC)
From: Vincent Cloutier <vincent.cloutier@icloud.com>
To: linux-media@vger.kernel.org
Cc: devicetree@vger.kernel.org,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Purism Kernel Team <kernel@puri.sm>,
	Vincent Cloutier <vincent@cloutier.co>
Subject: [PATCH v2 1/3] dt-bindings: media: i2c: Add Samsung S5K3L6 image sensor
Date: Wed, 11 Nov 2026 19:46:34 -0500
Message-ID: <20261112004636.739749-2-vincent.cloutier@icloud.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261112004636.739749-1-vincent.cloutier@icloud.com>
References: <20261112004636.739749-1-vincent.cloutier@icloud.com>
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
X-Proofpoint-GUID: mCkIAs5iizF8qSrwxp7-xExqekHrwKfG
X-Proofpoint-ORIG-GUID: mCkIAs5iizF8qSrwxp7-xExqekHrwKfG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEyMDAwMiBTYWx0ZWRfXyJBuCkS/WpMK
 +AuHTlkLVAKu9hPL3T5qn/nGHhO0SulWVOovX1L2PZuXbgD/roc5/c5G+DhXdD+HQYhhdRRU0dp
 bEPIPYwwiuK7N/LJNGGQjV5qTXz/+hNIyWpuI9Yw2LFNgW6mhCkdZoyzcIDxPUaO5JcQ593ECW5
 j+k/98X8LPIMMta4eM1JwI6v9L7Y/IlZzJJfn+QdxTiSwHECF8Myo8fjDM1SBlywmrMnoHEzryd
 XMTJ5s004My4KF7Dq6yW2Z13fHOEf6zkwS/NmgXwI4qBTMPrdjnXWb31lgzvOynsTyNJdovPgYU
 H1slGuTc/ZqIwnmIcJBMozBKYH+Rt2LQYs6zfFZCEpM7+FaNU+RXKPt6V3gYDQ=
X-Authority-Info-Out: v=2.4 cv=CKonnBrD c=1 sm=1 tr=0 ts=6af50c90
 cx=c_apl:c_pps:t_out a=kRaGL2Q7qLiahLf3O6OaIA==:117
 a=kRaGL2Q7qLiahLf3O6OaIA==:17 a=zJRp6_cAMcgA:10 a=x7bEGLp0ZPQA:10
 a=5j__JWfIoqoA:10 a=VkNPw1HP01LnGYTKEx00:22 a=gEfo2CItAAAA:8
 a=PATYgFbvzVY5AvWytYoA:9 a=sptkURWiP4Gy88Gu7hUp:22
X-JNJ: AAAAAAABRrZqAteUHqI2jmCDYGTolY80O6enx2RfnqMv2dKoHsOZH17FkSi7/z+1Os9+5X
 g3VPGd6PNhwgCTN2wjHyiNEXYZBIgVWD9qdhvbwJYVuVQjCRV5AiTgUiq1fDbPiRYV01sa
 CQrjHhM711VzRL/4NbM9ztjcA+HC79Mu3l7l1EwuXv35mbQvBiruhZDgylimbKfSA9pN1X
 PTqrTWxWR46nEwpahDrNmMl6wRF+xRIIQkRhyQuSrF0Dhrj6lPWFb5JEJYPTpxEsKI+rC/
 3crmDO8E68UWsVvGHcFR4t0mUtTLx64vj/sanDtEmiQhREXKWl2lu3O6hxlAg9l/+S94Bd
 o1WxVV0d60gKM0A1muAZKcCZ8gLa35Kk0SlAPR7IVHKypHwXjwN49FStDBSeMFX/S0XERl
 XnZ6FB7OoGq+Qqp6ZiUvejy4fx4zl3rOpNZPhsuZ4C3a3oN8Fgn/7fgrsH6MQU854s2aKK
 DZ6TErzcIwSEWvGATQWuZTuXvuszECxM+k94D4sR/4BAhyYBEqP96xSqV4ScsEz39c0DZL
 FayuBLqc2vAKVXlYN/WjxW7LxYZQsxgcST8Ramg8Pd/jRBUQL1QKzz28IQcI5/13ddjlWM
 HcSYT/pInbSH57Q0ILA0/UQsuOe22LkTfAco1RS6mP/LHYJiPq6IassfuClBCqEJShKIXB
 AseJuqVgNRfTij96sIXAJVswX7EVskVJZFSAhg6Q83SVJiar2yaJOda5Hh8Ykp6cNGaZFu
 StKpWxjVhdIPSFGNV4Lg27CtmD9pxB8MpfAZksPzg2ULe6B6cYv5jeSu9T9tQ2Xv/3sxzx
 H9+KyO6gvQjeIUVslNxj/b0x1vXmCAW64643M3MPqn2xIGrpxEWYb9SvK+9nXw9pT6r3NF
 FuL9g9oDQXccxWLImOS0Gvkb/A6czNgHOHoiGFWQ+sE/UMEZWju0MW+YVd/pL2EmDQ1vsQ
 Fg9BfQ==

From: Vincent Cloutier <vincent@cloutier.co>

Add a devicetree binding for the Samsung S5K3L6 13MP raw Bayer image
sensor.

Describe the validated two-lane MIPI CSI-2 configuration used by the
Librem 5 rear camera, including its supplies, input clock, reset GPIO and
three link frequencies. Require the endpoint and reset GPIO: the driver
uses hardware reset to stop the sensor if an I2C standby write fails.

Signed-off-by: Vincent Cloutier <vincent@cloutier.co>
Assisted-by: OpenCode:GPT-6.1 Sol
---
 .../bindings/media/i2c/samsung,s5k3l6.yaml    | 118 ++++++++++++++++++
 1 file changed, 118 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/samsung,s5k3l6.yaml

diff --git a/Documentation/devicetree/bindings/media/i2c/samsung,s5k3l6.yaml b/Documentation/devicetree/bindings/media/i2c/samsung,s5k3l6.yaml
new file mode 100644
index 000000000000..097593d74780
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/i2c/samsung,s5k3l6.yaml
@@ -0,0 +1,118 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/i2c/samsung,s5k3l6.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Samsung S5K3L6 13MP MIPI CSI-2 image sensor
+
+maintainers:
+  - Vincent Cloutier <vincent@cloutier.co>
+
+description: |-
+  The Samsung S5K3L6 is a raw Bayer image sensor with a MIPI CSI-2 image
+  data interface and an I2C-compatible control bus.
+
+allOf:
+  - $ref: /schemas/media/video-interface-devices.yaml#
+
+properties:
+  compatible:
+    const: samsung,s5k3l6
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    description: Reference to the sensor input clock.
+    maxItems: 1
+
+  reset-gpios:
+    description: Active-low reset GPIO, also used to recover from I2C errors.
+    maxItems: 1
+
+  vdda-supply:
+    description: Analog power supply.
+
+  vddd-supply:
+    description: Digital core power supply.
+
+  vddio-supply:
+    description: Digital I/O power supply.
+
+  port:
+    $ref: /schemas/graph.yaml#/$defs/port-base
+    unevaluatedProperties: false
+
+    properties:
+      endpoint:
+        $ref: /schemas/media/video-interfaces.yaml#
+        unevaluatedProperties: false
+
+        properties:
+          data-lanes:
+            items:
+              - const: 1
+              - const: 2
+
+          link-frequencies:
+            items:
+              - const: 537500000
+              - const: 600000000
+              - const: 625000000
+
+        required:
+          - data-lanes
+          - link-frequencies
+
+    required:
+      - endpoint
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - reset-gpios
+  - vdda-supply
+  - vddd-supply
+  - vddio-supply
+  - port
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/imx8mq-clock.h>
+    #include <dt-bindings/gpio/gpio.h>
+
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        camera@2d {
+            compatible = "samsung,s5k3l6";
+            reg = <0x2d>;
+
+            clocks = <&clk IMX8MQ_CLK_CLKO2>;
+            assigned-clocks = <&clk IMX8MQ_CLK_CLKO2>;
+            assigned-clock-rates = <25000000>;
+
+            reset-gpios = <&gpio1 26 GPIO_ACTIVE_LOW>;
+            vdda-supply = <&reg_camera_vdda>;
+            vddd-supply = <&reg_camera_vddd>;
+            vddio-supply = <&reg_camera_vddio>;
+
+            orientation = <1>;
+            rotation = <270>;
+
+            port {
+                camera_out: endpoint {
+                    data-lanes = <1 2>;
+                    link-frequencies = /bits/ 64
+                        <537500000 600000000 625000000>;
+                    remote-endpoint = <&mipi_csi2_in>;
+                };
+            };
+        };
+    };
+...

base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
-- 
2.56.0

