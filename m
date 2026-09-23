Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 385C949EC4C
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 18:39:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790188758; cv=none; b=ew5NQwyRb/N2Xc9qRqp72GwryJZE6ZL3EHsdGhJRLgFyio8DoLZabQS+iuix1dgvKh3vLdh53HgLdNRcDoEDxDZmpxFjEgT9FJp+va7Inryri8z334jhqjxtFPOFFc4i3ir/DTIDmvUTQY1vNTVc+09ap6ND3B5iBbPBy0xWMZ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790188758; c=relaxed/simple;
	bh=GrDNSSO0nvFb2unWTPFRpJmvnJFmkqSGVidtNmo3vmw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=gTTJG+zm4OF3YurQg+6mtocwslVEYORt47DPfBVs2OYasJphcosktR65KpGh3RGFftG6TiGp/gEUcfkUz5uP9nBff5QTmrZajiMnY22kMYxK82x1VhCIchxjovG+kAPt27lDQSg0QgH3nLveh6uB/zJ93s9rzjBmwpea5lIdGxs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=i5qoEp5E; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="i5qoEp5E"
Received: by mail-pj2-f13.google.com with SMTP id d9443c01a7336-2dd88a115ebso8186675ad.2
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 11:39:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790188755; x=1790793555; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=8VWM3B8ZR2suQS0fAZFWbkbtS6he0VILtB/lGED1UXs=;
        b=i5qoEp5ELH292yx17My+lOGlk37sxh+HtVyZSCsfwPkGmbzOYfbxcB2Wel5I/BWwP0
         L6Qp4LINKRVlG0puGVQkIBp6YWnF6uwnvL86yrZrSWTaLnl8omE1PaLWoTH1qbnKQ353
         kQE3cmjssXjMJukAGHciLZd2ICkqFHmMcCGvdoyye9c/4CZNruJbKp3JgG8FMGeGfJGa
         AOQtvHTJR6xQVDJY+mPXGLQAEELrGsvTfPdjIFOzDTkVAzBMrn6z9PD95iYuhqf9lPnN
         6WEUONWmHvRQ69cg/GQTv2B/ijW6ozYyQ2ajDWeqze//gs9En0PEcKO7xPP+7bDBP9aa
         yf/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790188755; x=1790793555;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8VWM3B8ZR2suQS0fAZFWbkbtS6he0VILtB/lGED1UXs=;
        b=2fSPTaK2f+lS0uq4HIcgWC+JNNLOOuM01akMqFGSMS2gPobiw44rAIEPhOS436a/hn
         f6dVPtyKj6VRAcR6Nk8eM/YQNMcImhR6DEb1jX/vdpNHmf+ed1SKk/ZIU+H25oIHomxL
         yP4ed59R4a+kOFwmtbpfRbMJklh3IL/nuh0CfWz+cUZiPYhuiVEKZL1tPLuzYQcqALEt
         eEaNW3lfx+Wz+J110aKPSvCVDvoBhlay6d9SbKtbAe9AELImy1xXOnSNls3RkmtIPkzu
         rNuG64DyZEgEslitDxX9reNCDVn7cus+6iy895aNOoI0JShLsAnN/02LJheYuUqdx3s+
         lIkw==
X-Forwarded-Encrypted: i=1; AKwUvBx943XakSYpmjZY2rZrCPYKXbE9QX1iK9nCOAcTPyDMyw2CmxK5YGBfiWGRvHecC2X7OU9je1pwP8Hx2+k=@vger.kernel.org
X-Gm-Message-State: AFuF++nXqqBUqWe4wu9uau3WQ78IQDLh6jF4URP9bgcg/cjsjTAvFP8p
	KnKR+AJQr/XKZZJwoYtimOJjM7Qjms7LsUXw4alKkxeZS1avJvWeJwjU
X-Gm-Gg: AYBFou0eIpQUIA5rXdmZg9L67E4VO7LxxPa1swoMkw033CigJAm4RfpOKwlUxhyfSOQ
	JnTPSzGyUdVYQhnTUh9wzVw5AI4kUbOOjQsxLM2aVTqx36rVGhDrAx2D1Ujy+GUze3eXjvG9MWn
	Q+jHDgvInvbUEgiQqZGYRLntUqNV3vCpIQZbawAfV0u0Ab3VltdOOyqMedq1gkYCeEr0UFaOgnr
	yvCCEEpGm5eqNquBXhvvSmj+azgTntPxd4ctCsn+CX0ac2p0Utm6DOZZrC6QCoceB0KtOzFejKS
	V7RMGEqefzIQWiSoa9S3+7Sy0h3Mg5d2u5biO/x2RafA4gYH2uueSbZeQpW8QlwOWP/+fh7UOb1
	bOw1FlhdM721IOsa4fICqCUuCqJFWN573eqs1yHHYDm8Fa6dDuO+D6qh+DRFiUCUr7tzbhl0Uyh
	46C7vKT4Q4thGKPhEe4JAFRYtZCTPtaOvFKh0lpPdaRoTMovRnTkVH6UYgOfaJ3hfbrLyFYg7rE
	AwNenoVB1272qyoBkqfqp6FbXwc20WVowwbRuT4auveZ67f+RHC98mi5CV3bk6MUdAmAUnrzWvT
	FHX7tR5V3y47gBbJO8jvvsWIMqZIjhQO9igzYl5vSLizcElQ
X-Received: by 2002:a17:902:db05:b0:2df:556c:1581 with SMTP id d9443c01a7336-2df7e11a469mr224415ad.31.1790188754814;
        Wed, 23 Sep 2026 11:39:14 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e34])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2df6a5dc32csm15528625ad.53.2026.09.23.11.39.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 11:39:14 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: devicetree@vger.kernel.org
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	linux-arm-kernel@lists.infradead.org (moderated list:BROADCOM IPROC ARM ARCHITECTURE),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] ARM: dts: alamo: use qca8337 internal PHYs
Date: Wed, 23 Sep 2026 11:39:12 -0700
Message-ID: <20260923183912.13389-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The QCA8337 switch has a managed internal MDIO bus for its built-in
PHYs.  Move the PHY nodes from the external mdio@0 bus into a
subnode of the switch, and mark the connected switch ports with
phy-mode = "internal", so the ports are linked to the correct PHYs.

Assisted-by: LLM
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 .../dts/broadcom/bcm958625-meraki-alamo.dtsi  | 100 +++++++++++-------
 1 file changed, 60 insertions(+), 40 deletions(-)

diff --git a/arch/arm/boot/dts/broadcom/bcm958625-meraki-alamo.dtsi b/arch/arm/boot/dts/broadcom/bcm958625-meraki-alamo.dtsi
index c54451dde6dd..d0199c07707c 100644
--- a/arch/arm/boot/dts/broadcom/bcm958625-meraki-alamo.dtsi
+++ b/arch/arm/boot/dts/broadcom/bcm958625-meraki-alamo.dtsi
@@ -85,26 +85,6 @@ mdio@0 {
 			#address-cells = <1>;
 			#size-cells = <0>;
 
-			phy_port6: phy@0 {
-				reg = <0>;
-			};
-
-			phy_port7: phy@1 {
-				reg = <1>;
-			};
-
-			phy_port8: phy@2 {
-				reg = <2>;
-			};
-
-			phy_port9: phy@3 {
-				reg = <3>;
-			};
-
-			phy_port10: phy@4 {
-				reg = <4>;
-			};
-
 			switch@10 {
 				compatible = "qca,qca8337";
 				reg = <0x10>;
@@ -128,60 +108,70 @@ fixed-link {
 					port@1 {
 						reg = <1>;
 						label = "lan8";
+						phy-mode = "internal";
 						phy-handle = <&phy_port6>;
 					};
 
 					port@2 {
 						reg = <2>;
 						label = "lan9";
+						phy-mode = "internal";
 						phy-handle = <&phy_port7>;
 					};
 
 					port@3 {
 						reg = <3>;
 						label = "lan10";
+						phy-mode = "internal";
 						phy-handle = <&phy_port8>;
 					};
 
 					port@4 {
 						reg = <4>;
 						label = "lan11";
+						phy-mode = "internal";
 						phy-handle = <&phy_port9>;
 					};
 
 					port@5 {
 						reg = <5>;
 						label = "lan12";
+						phy-mode = "internal";
 						phy-handle = <&phy_port10>;
 					};
 				};
-			};
-		};
 
-		mdio-mii@2000 {
-			reg = <0x2000>;
-			#address-cells = <1>;
-			#size-cells = <0>;
+				mdio {
+					#address-cells = <1>;
+					#size-cells = <0>;
 
-			phy_port1: phy@0 {
-				reg = <0>;
-			};
+					phy_port6: ethernet-phy@0 {
+						reg = <0>;
+					};
 
-			phy_port2: phy@1 {
-				reg = <1>;
-			};
+					phy_port7: ethernet-phy@1 {
+						reg = <1>;
+					};
 
-			phy_port3: phy@2 {
-				reg = <2>;
-			};
+					phy_port8: ethernet-phy@2 {
+						reg = <2>;
+					};
 
-			phy_port4: phy@3 {
-				reg = <3>;
-			};
+					phy_port9: ethernet-phy@3 {
+						reg = <3>;
+					};
 
-			phy_port5: phy@4 {
-				reg = <4>;
+					phy_port10: ethernet-phy@4 {
+						reg = <4>;
+					};
+				};
 			};
+		};
+
+		mdio-mii@2000 {
+			reg = <0x2000>;
+			#address-cells = <1>;
+			#size-cells = <0>;
 
 			switch@10 {
 				compatible = "qca,qca8337";
@@ -206,33 +196,63 @@ fixed-link {
 					port@1 {
 						reg = <1>;
 						label = "lan3";
+						phy-mode = "internal";
 						phy-handle = <&phy_port1>;
 					};
 
 					port@2 {
 						reg = <2>;
 						label = "lan4";
+						phy-mode = "internal";
 						phy-handle = <&phy_port2>;
 					};
 
 					port@3 {
 						reg = <3>;
 						label = "lan5";
+						phy-mode = "internal";
 						phy-handle = <&phy_port3>;
 					};
 
 					port@4 {
 						reg = <4>;
 						label = "lan6";
+						phy-mode = "internal";
 						phy-handle = <&phy_port4>;
 					};
 
 					port@5 {
 						reg = <5>;
 						label = "lan7";
+						phy-mode = "internal";
 						phy-handle = <&phy_port5>;
 					};
 				};
+
+				mdio {
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					phy_port1: ethernet-phy@0 {
+						reg = <0>;
+					};
+
+					phy_port2: ethernet-phy@1 {
+						reg = <1>;
+					};
+
+					phy_port3: ethernet-phy@2 {
+						reg = <2>;
+					};
+
+					phy_port4: ethernet-phy@3 {
+						reg = <3>;
+					};
+
+					phy_port5: ethernet-phy@4 {
+						reg = <4>;
+					};
+				};
 			};
 		};
 	};
-- 
2.55.0

