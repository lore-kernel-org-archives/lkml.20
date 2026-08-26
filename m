Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5240246AA94
	for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 17:49:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787766567; cv=none; b=WmLRfNxaKvZxHW7li8xb4u3ePPJ+msx2piak0AsMOe1Z1B7xIrHiW4L8zxBkaSm6e/0yHfPB7y5G8UIpabqF9qH5qbzSgKQELqqy6pejeyFQuXuh9XOpDmTqK/9bYBBAlQjOPn28FiYRFoEuNcVbaiTXJvs6dNw5fAcEJTFyEZs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787766567; c=relaxed/simple;
	bh=skBvxLh49SoooPdmm9rKFZkjaJowmW2KUOSBS4qAXPc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hbzlpghcul/IP9LCsC/26+LOg1w3LBaW6gzERzZFGzSTLzRikOEyQtOfBMADGant5vbM3DZq3atNFbw900xRF0jWi5H1MOQY8Sp2O+GAXIrgs5W2xWrs4V+4yVh/9pSuehoWBPUZjjGlID6Z2npqsiQ/wtnIKUxcrLScRkTlth4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ljEfFFEb; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ljEfFFEb"
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-c25344a8c6cso46272566b.0
        for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 10:49:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787766549; x=1788371349; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=n0Me3YVClny3tyUAJzGZc7ucjtkhZP3LdciOFdTRFRQ=;
        b=ljEfFFEbp2wMJMA0HU8A1T1T8Uvulf8WVqwe8XJ8SVA5uJdYogH4OSbUVNNj1voDWF
         G0rIVjSUKPrfkUAEjMpoZlcgW8/vAtb8Z05HBscxNRym5QHNuVPSQDYIJ0TsmBK1hZT3
         OeugCZjBx/byntlaOKMEnLLgHL4AqpsZCwC/Jhq5dPQj7XfhMR6+X7e04lMmbBUACdSb
         /JsH1W46k7jj/ekWSYlggOLlPCYcjoBcmGBpwj14OzE6XFKPjGdrJH4kfiI5tTbKwXRu
         j2FgBGm1jkTul6WtzOmJdn2dD17GQLxq7p+z2ysBFq4QKWOVOQkhHCv0Y5d3mlf1wbs5
         OJQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787766549; x=1788371349;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=n0Me3YVClny3tyUAJzGZc7ucjtkhZP3LdciOFdTRFRQ=;
        b=eEiOfgxTk+/kJTjnj/9I7wJYEG89jcqOJw6OLBdqVpkxX4kdiM/iUFeBC86Xoadu85
         wmMkVZX4mFDxeUgUEcAMTaN7o9mHmItcv6sfMIarn7RFlDSPAqRzXq3Kx4Pplt0dBfiA
         prs5h8YLL9UwMUJmkVcwp1PPj/3Hc0511StlfCrkDj6I+e5eJ/2tUgWfblQF26lmYGfs
         +N23nuCSkDUNIxy9oOPUKHvsmtn3M20T3GvQoXVrZQSsDVRZZHMrunNCAbuf21814ep2
         x9cB3BqabBD23NjV113lWDt7BAz78Zo+uNERkUamo8axRHQJmpEh07Zne5U73YJKB+Un
         X96g==
X-Forwarded-Encrypted: i=1; AHgh+RqBqqNhIpKbyXrMHCD8eMotVhJdHPFK6ULNPQiWLLOUvkOtF5WylV05DQNJZdKdN1Mu0P1RtI1YFAvGIOk=@vger.kernel.org
X-Gm-Message-State: AFuF++l2/XoB00ACYC84taj6bY9hVZDQVrrLAwWhBqZY/y9ituixqJ5r
	KyAduXK1p544IdM6CD+X+yJ4KRxxAz0ZoWC6MuJx0TXaxpVn43wF4WDL
X-Gm-Gg: AR+sD13aJ9o6dSTT6sS0YZbKeqJ2Jrq69UTMNumJ7PXOjW5Del+MXVzwLsB+904Qr1X
	OSEnrbH+B+51cU+WlOUAGRk2yhNEkP4nNO2DSanYX6FAtNn+COSVM9UTNxHFKx9m+Ia1SduItRI
	JBoi0QOHT/FH5y6887/LspMVFgsUlJwEEpkocTX2Ls5fY5y4NtIuuBIzZE/Z75Uvh2UbD7fM5Gv
	Mj7FoKNnpHMOJvg6QLrEDIQRHykWqz1nk/WV81x3Wt+4hlFa07CXcpCIttkXC6a3rVV8/JBZnbP
	rx+3MZ6VsXuOGbimPXYNMcJTxB8+gU0QRkFY6dUy4xNjuyRwTT/YB9hRGoSu92sQnZm16ABPzCI
	PXXseq+2G8H0xairw4Smm0Gp48XUHuD/2vdZwbQWtys0HhxXu97/wb28RMd2B8mPGiMz1GO0lEh
	jgnXcxbCru3ytVgnQ+XZfRwmGA616RRoMNpQiQxiIsl0kSDLhuk1m4DNKzZhNdRrRSawmXkzEB0
	zEywU68MQr8Ecj5Jf56X1bG
X-Received: by 2002:a17:907:1c99:b0:c20:fed2:898b with SMTP id a640c23a62f3a-c250c38520emr1078858166b.23.1787766549069;
        Wed, 26 Aug 2026 10:49:09 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a702:d301:aa64:3da0:a259:ecd5])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c250a88ac7fsm777752766b.30.2026.08.26.10.49.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2026 10:49:08 -0700 (PDT)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH v3 11/13] arm64: dts: renesas: r9a08g046: Add LVDS node
Date: Wed, 26 Aug 2026 18:48:45 +0100
Message-ID: <20260826174854.199139-12-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260826174854.199139-1-biju.das.jz@bp.renesas.com>
References: <20260826174854.199139-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Biju Das <biju.das.jz@bp.renesas.com>

Add LVDS node to RZ/G3L SoC DTSI.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v2->v3:
 * No change.
v1->v2:
 * No change.
---
 arch/arm64/boot/dts/renesas/r9a08g046.dtsi | 37 ++++++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r9a08g046.dtsi b/arch/arm64/boot/dts/renesas/r9a08g046.dtsi
index cc8bfb24da87..f652ad3f1d1a 100644
--- a/arch/arm64/boot/dts/renesas/r9a08g046.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a08g046.dtsi
@@ -794,6 +794,43 @@ port@1 {
 
 				port@2 {
 					reg = <2>;
+					du_out_lvds: endpoint {
+						remote-endpoint = <&lvds_in>;
+					};
+				};
+			};
+		};
+
+		lvds: lvds@108a0000 {
+			compatible = "renesas,r9a08g046-lvds";
+			reg = <0 0x108a0000 0 0x10000>;
+			clocks = <&cpg CPG_MOD R9A08G046_MIPI_DSI_PCLK>,
+				 <&cpg CPG_MOD R9A08G046_LVDS_PLLCLK>,
+				 <&cpg CPG_MOD R9A08G046_LVDS_CLK_DOT0>;
+			clock-names = "pclk", "phyclk", "dotclk";
+			resets = <&cpg R9A08G046_LVDS_RESET_N>,
+				 <&cpg R9A08G046_MIPI_DSI_PRESET_N>,
+				 <&cpg R9A08G046_MIPI_DSI_CMN_RSTB>,
+				 <&cpg R9A08G046_MIPI_DSI_ARESET_N>;
+			reset-names = "lvdrst", "prst", "rst", "arst";
+			power-domains = <&cpg>;
+			status = "disabled";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+					lvds_in: endpoint {
+						remote-endpoint = <&du_out_lvds>;
+					};
+				};
+
+				port@1 {
+					reg = <1>;
+					lvds_out: endpoint {
+					};
 				};
 			};
 		};
-- 
2.43.0

