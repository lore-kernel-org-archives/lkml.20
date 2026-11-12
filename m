Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=57.103.72.107
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794444437;
	b=cXQ09nxlmoY1QrUbds2MYh7qLQWh7hkEKL4yXfTqrWGr2YjXI/FFIQtKZ4AoQ2ASyGlr
	 oTVS0ZvwOwe592hDfrNcyMobJgvDDI2cWIvWzwfsqIgMzb5FPkY7EHhSff1joG+mvB+Q9
	 EWexm12/jfM2LwdN5S6vz1CHztJJyeEQ1Jw8XxXu27HIpZAhgE3AQyR+lS04SmvdGU+nr
	 8vP6j8dGIlnIRKYeEbe8HtjlW+QwWwNY3ogBSWOFr2vudUox+CVWbdZ/3cSMZiUnnIlcq
	 /Q393+WTe8F5dhl51aRwoqCSa6Fg4KnpgJYiGNo/mRCqQ6ADiZYC+6bN2ja4viS3N4g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794444437;
	h=DMARC-Filter:Received:X-ICL-RepId:Dkim-Signature:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:X-Authority-Info-Out:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:X-JNJ;
	bh=w1MSemEJM1D/SKYXOB78QWPp3WbL5Fkt44BuJYa+ISY=;
	b=oRBWwLZgqN1W1D2jjagdp4JLKjNHiFEZfxkvQ3ypHmF+DpAMnVO2+FU/w7cVahWJpE1U
	 vfvsVfeXer401tjj1F5CWTIjLvUQVK8Y4b+FN+ovw4EGuMFENO0uPLMQI6aFMpP0RhTk+
	 L0puGLv0zv13qJDn3IxmWx3kzqhFAtHEfQ1I57p0hEompqwu4HSM6pHw1qJaIZnluvdCW
	 Abr221wWZjIYO9SH9Gtx/mqNOWLBZaNowbkqCi0TcK/Xc2qaDxJbE8KdJ3T7p5hAB6+oK
	 zy1y1dTqb9txze3DwAP98Int+au77FJhN4Rn8cUTUUQvjBXAvBMbr/oNzBHM7pMoKoQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=icloud.com;
	spf=pass smtp.mailfrom=icloud.com;
	dkim=pass header.d=icloud.com header.i=@icloud.com header.a=rsa-sha256 header.s=1a1hai header.b=kmKcYj5f;
	arc=none smtp.remote-ip=57.103.72.107
Received: from outbound.ms.icloud.com (ms-2005k-snip4-4.eps.apple.com [57.103.72.107])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DB1C60A2603
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 00:47:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1DB1C60A2603
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=icloud.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=icloud.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=icloud.com header.i=@icloud.com header.a=rsa-sha256 header.s=1a1hai header.b=kmKcYj5f
Received: from outbound.ms.icloud.com (unknown [127.0.0.2])
	by p00-icloudmta-asmtp-us-west-3a-20-percent-0 (Postfix) with ESMTPS id 35A611800111;
	Thu, 12 Nov 2026 00:47:13 +0000 (UTC)
X-ICL-RepId: 01a1cd39-16e1-7950-8021-524aa0ca467e
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=icloud.com; s=1a1hai; t=1794444436; x=1825980436; bh=w1MSemEJM1D/SKYXOB78QWPp3WbL5Fkt44BuJYa+ISY=; h=From:To:Subject:Date:Message-ID:MIME-Version:x-icloud-hme; b=kmKcYj5fXvMBhQHP6XnuMRQN+dESlVF7BUNKj35oA06sINDxWCNuxVU5EggWUVDZK/9eBvPtkc2wfLlr3+NuTWOLTDGEEU0F9bY7DK0E1KUUbExGRjU6xtpAk1Ip1V4izoz9h9RhXl5LpeD5HqHn1ptw+lPUTQZUq6XWCrHPRIKMGP0DDr1gxQFRIeht+gfEBle1uEyjvQI3pGFkFsB8nTvCG0E7BJjglnvfmE7hoZy5QOimGAWVyAhfd8R0zFhJvymWrtMczGlpeE/Eh3DDF6ywxsJYQjMDh6HyD/0npDKWDMLLBuTSuF6LVIETPPci3B3UhSe0bQbm03T/dFAL3w==
Received: from bigre.tail98293.ts.net (unknown [17.156.208.39])
	by p00-icloudmta-asmtp-us-west-3a-20-percent-0 (Postfix) with ESMTPSA id F275E18004AF;
	Thu, 12 Nov 2026 00:47:10 +0000 (UTC)
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
Subject: [PATCH v2 3/3] arm64: dts: imx8mq-librem5: Add rear camera
Date: Wed, 11 Nov 2026 19:46:36 -0500
Message-ID: <20261112004636.739749-4-vincent.cloutier@icloud.com>
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
X-Proofpoint-ORIG-GUID: OCFqYr7Pjo1O7WVFNgRWk5-Ja6V15d8B
X-Authority-Info-Out: v=2.4 cv=EOcLElZC c=1 sm=1 tr=0 ts=6af50c93
 cx=c_apl:c_pps:t_out a=kRaGL2Q7qLiahLf3O6OaIA==:117
 a=kRaGL2Q7qLiahLf3O6OaIA==:17 a=zJRp6_cAMcgA:10 a=x7bEGLp0ZPQA:10
 a=5j__JWfIoqoA:10 a=VkNPw1HP01LnGYTKEx00:22 a=44ESNHm707DTucqp3sAA:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEyMDAwMiBTYWx0ZWRfX8Y3k0/Cx0Vhb
 Inccjb37r6h2jFAvXC+1/3v0R+NkiA3XyhJmUqfT712fzny47j7oHVcwk+Vgjp75v9XNHDBpz7z
 W82zOr0Ry/pa9+ECowoAtLu+q39HxLDXVwezp6zes0NujzhjuKkxfgBI/6zAEPKnAb5nX0d/WXc
 0QgvPpHQtmQqFKe03ltAlYTfVWm2mwAft0lQIS0ku1GtFWLLTk3yaEVn4UO+2bA+4Qi+l8S173W
 LAweMsRxKGSCw+82BOYVwuPJ6t2MIhfaXshbA6ZzIYx7Mj7LMvN2hm63Bd93XYXP51OH3P0C7gj
 2bof0472kWkHnoQjIFlRbJDNyT0eM58Upf9oxB91A9ejHRXmAA2LwPUR8HPsyg=
X-Proofpoint-GUID: OCFqYr7Pjo1O7WVFNgRWk5-Ja6V15d8B
X-JNJ: AAAAAAABT0bWZgp92u068rDpBd1Os7N/dqlUxUsAYPTvb3Tenj77CpnC3vU+9EeHCXcFsC
 6Y3JpWFPj1XVodEZb14XtghgH6qXCtQKF3gjzhVaW73rj5iiWTG0o25NuJqerOUodGGWfN
 k4nHVF/xP0mndIPb5kMoT6tDu0Gp89eVfUCu9PzEeihNU8hXI7EzwAf4q+8DYnDS6QARBW
 7dKSK88xHPcleXYFRY9NgBdMKArd9MdE3n5KdyyV+lLdnjxOMP5J1h0LwVFI9nRDP0RKPe
 BQ4V4C4RVh/nhm6+hJ9rUSclaPWc0wjSSdpgsQUYCDwoIbp6zE6Xv9DrUzdFORpa84N/D3
 auLjHjlrJqne95GIw3PTZA/ReYXqK57p7roKGUiNKcXwPO0yORGbzN6Ul6qVXnftnWXXZ0
 coz75iwVXG8oKE+GYilGcfyQgkxnLRk80JNAPkcpBcz+jOsJGua4ZB+cPMXrAex02VcP+8
 7PBEkmWrPB+m2BcZOY0Esq2KskSXiNEULeuy9h9iT9uG7VS1SDBIqvEBXRgTA+Q5FBJjz3
 VBRLSRxcRxAMefylufoGd1K5l74V+BvYC3gKrrpqacf5VcSWUwsW0HnKXpTBYe6F43a5So
 j5Q3RjqBLYqjLTCs5EfI5E3tmw5TI88Vaxwri7934nVaL5zn30ED/FFWRDsdRMlDpilrUA
 09FXRoZc4XNsvqXOhaDuNVYwQwq81bk7nCtyDDgALq/nYhTELDU8YINpLASkgdjh5e9VVR
 Ew3z2NnXmKDXSxyGQUdc3ZDZ2/iJX8cA17Wl+LIJkYA8tQRvFKBAu7gWcKuskLR/kmplW2
 GUHFx/XEYHdJ1rISLhwx3c36APk8XDr2t4yqcUl9bGwtmjCyMR9MtIy5UGAN+6sxiymq14
 wNBB2F3kHJI3Nq2TSgMstHpC+zBw==

From: Vincent Cloutier <vincent@cloutier.co>

Add the Librem 5 rear camera sensor node and enable the second CSI-2
capture path that receives data from it.

Describe the Samsung S5K3L6 sensor with the upstream binding property
names, including reset-gpios and the link frequencies used by the initial
two-lane RAW8/RAW10 driver modes.

Signed-off-by: Vincent Cloutier <vincent@cloutier.co>
Assisted-by: OpenCode:GPT-6.1 Sol
---
 .../boot/dts/freescale/imx8mq-librem5.dtsi    | 51 +++++++++++++++++++
 1 file changed, 51 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mq-librem5.dtsi b/arch/arm64/boot/dts/freescale/imx8mq-librem5.dtsi
index a212c031d4c6..25e3e6736181 100644
--- a/arch/arm64/boot/dts/freescale/imx8mq-librem5.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mq-librem5.dtsi
@@ -319,6 +319,10 @@ &csi1 {
 	status = "okay";
 };
 
+&csi2 {
+	status = "okay";
+};
+
 &ddrc {
 	operating-points-v2 = <&ddrc_opp_table>;
 	status = "okay";
@@ -435,6 +439,13 @@ MX8MQ_IOMUXC_ENET_RXC_GPIO1_IO25	0x83
 		>;
 	};
 
+	pinctrl_csi2: csi2grp {
+		fsl,pins = <
+			/* CSI2_NRST */
+			MX8MQ_IOMUXC_ENET_RD0_GPIO1_IO26	0x83
+		>;
+	};
+
 	pinctrl_charger_in: chargeringrp {
 		fsl,pins = <
 			/* CHRG_INT */
@@ -1176,6 +1187,31 @@ vcm@c {
 		vcc-supply = <&reg_csi_1v8>;
 	};
 
+	camera_rear: camera@2d {
+		compatible = "samsung,s5k3l6";
+		reg = <0x2d>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_csi2>;
+		clocks = <&clk IMX8MQ_CLK_CLKO2>;
+		assigned-clocks = <&clk IMX8MQ_CLK_CLKO2>;
+		assigned-clock-rates = <25000000>;
+		reset-gpios = <&gpio1 26 GPIO_ACTIVE_LOW>;
+		vdda-supply = <&reg_vcam_2v8>;
+		vddd-supply = <&reg_vcam_1v2>;
+		vddio-supply = <&reg_csi_1v8>;
+		rotation = <270>;
+		orientation = <1>;
+
+		port {
+			camera2_ep: endpoint {
+				data-lanes = <1 2>;
+				link-frequencies = /bits/ 64
+					<537500000 600000000 625000000>;
+				remote-endpoint = <&mipi2_sensor_ep>;
+			};
+		};
+	};
+
 	bat: fuel-gauge@36 {
 		compatible = "maxim,max17055";
 		reg = <0x36>;
@@ -1227,6 +1263,21 @@ mipi1_sensor_ep: endpoint {
 	};
 };
 
+&mipi_csi2 {
+	status = "okay";
+
+	ports {
+		port@0 {
+			reg = <0>;
+
+			mipi2_sensor_ep: endpoint {
+				remote-endpoint = <&camera2_ep>;
+				data-lanes = <1 2>;
+			};
+		};
+	};
+};
+
 &mipi_dsi {
 	#address-cells = <1>;
 	#size-cells = <0>;
-- 
2.56.0

