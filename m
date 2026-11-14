Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794661422;
	b=C1ukw3r7uighkUmvEYKDv2BxEQeaM8TxFVCmCcd6nOLyWqAnwyb2AmLO23NAF/QXTdV3
	 T0kuy6vO89TFBAE30YkNfJcj64AlxLd3MhMTwYbLbtO+2c0Z3T8T3dkbyXPn49oCfWwnY
	 ezK3uAQeYtyQxiuZrSzI03GDL0jIMHmqDhh538esW7S1WhLnUg974FeXA/wH7leZMVZk3
	 L71+9ILRLRXoOOWjHcTRUdnSqlTMaN13P4B6L+Z7kL0zb44fDziNorMJCa4wFgzk/3ib6
	 BMDc+kqI0kYNUbjt9sC0Th/FkQUIzaOizD3EqMC3tVQ8HPGfp1O3PEpmk2iWaH2Q57w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794661422;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Endpoint-Received;
	bh=dh3nDHm657l2W/CzlusdswzzmcH3pGrEuZn9tsiXWpE=;
	b=RJKrsf2aLDqgzhfO91sKwLZBdL0ec/VbJiLWgZXvTLGL07T7uBvvG0DpYTwFgqUWkq8W
	 oTypLXZYaa8HkHO949viAN/6AlAXCbYR6secc22y5dNofdDMjkSD/ThCbc4vakS4hvglf
	 AIvN4ddIjF1O3tyGShjHdQL6XH5c2j+Dlswrxy4YsZKLcX1eE2Rq1uyZ0X/w2JP9jVH0Q
	 CJzbE+hgUsagEIbHHLODAoVsBuoVviHJsJ53ml64SBMVAc40HUH86551WE42h0CIUctNg
	 zWFSHM2T+uJIa/00bnzibOo4zYfQM0lsrlEciH+TxTshyaCKz8j3O4Ib87HGlr/qrjA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="O3dI+r/p";
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0B93606A323;
	Sat, 14 Nov 2026 13:03:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=O3dI+r/p
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794661422;
	b=lQEsKyeS1IDgYlgakB74ldqptmcZs1z9IobyCSWVu8bh/t5frHBTCf4zgjoUpb8EaHfq
	 rce3nSsY2dUH9IPAp/ZE6t/83SuV/nBRkzEqet5wtZ9jgmA5bMESoqJBy+TIn7Uezhdbk
	 gowB3TwVTSakM5WwQEZKwCd/sMOIO7P1AApdmrZFx7z2F1rL1xl7GmjgmZRHNhESxaiOr
	 CkUEIvG0iijmDw6B9LhDxkeWEiNgowWOJhXaNkPIfo/rMUOdZK869O6iBtM3PntaIAfOF
	 7Zr+nIZzw4WEwNKhDX2T3vtNqrXZMYhJB2eRVLF205UJonSPI65BoMMvBWTGMxc7hcQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794661422;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key:X-Endpoint-Received;
	bh=dh3nDHm657l2W/CzlusdswzzmcH3pGrEuZn9tsiXWpE=;
	b=NYWZM9ml2l3DCrKNmpS0tTf97NXISHvTgx/2Nal3MaZobZ2RlLSRAyRKAVJwkD2pmxYE
	 cbUjgO2a2tbQA3ICnPFCJ+emRVXpCIaJmrEyLWdDBYgrKELz1Uzl8/GuesUUb+eLnTS5q
	 2OvcYn45dg++KC97oiEL8bh8ZEzSEaCkzUOElGJ6I4DE3kqWkkCYGYUJ6gBPwqrBkkPie
	 /FNLawhKCgIqRFTO9NNvQqbx9OgszhrWsT+F7mIDZd2ZKIGSbGxlWT3Ihg6q3jUUElrYr
	 zUgo44KvruA3gffHHmgqkn6B8kF9bZQ7OJB547ELfSgVfBnbdetHAOcz34PoGXNPhQQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id A9D601F000C4;
	Sat, 14 Nov 2026 13:03:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794661422;
	bh=dh3nDHm657l2W/CzlusdswzzmcH3pGrEuZn9tsiXWpE=;
	h=From:Date:Subject:To:Cc;
	b=O3dI+r/p0xDA1UGPuVihwPmiAiQ6Vm48qaO5mEwWdTBSXDddDBK8Ql0ddb35anWXB
	 6ntvslVW54OxXPkykUJCaTrRdHDk1W12JCqu9gBZY4JhhlobTCKeP51dquNKynRQCY
	 0+1aqWGkOyf1c+OMnAZO+9gbNslNASgukxD+ijLAbK8o0uNngtLunDqqOkJ7OM8n+O
	 +wuN+C41eVLmOfmWV1lsdsTelaD0ZWgECyGlrhuAkYxgfEVzIU/4GePtnHgUWsh5m7
	 A530nR4a3sKYEwz8UW4xdBsN6eNiYBtBaZbh5MHFPXiM02KXSh/2Oa4e0lU/RK0xLm
	 EQz4IgxfpYHiA==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 088A849DA7;
	Sat, 14 Nov 2026 13:03:41 +0000 (UTC)
From: Sven Peter <sven@kernel.org>
Date: Sat, 14 Nov 2026 14:03:35 +0100
Subject: [PATCH] arm64: dts: apple: Lowercase hwmon node names
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
Content-Transfer-Encoding: 7bit
Message-Id: <20261114-b4-hwmon-nodes-v1-1-7d0a9674e3ae@kernel.org>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMTQqDMBBA4avIrB1wgj/YqxQXiU7rCCYlY6sg3
 t1Yl9/ivR2Uo7DCI9sh8k9Ugk+gPIN+tP7NKEMymMLURFSiK3Fc5+DRh4EVbd06Y7ki0zSQok/
 kl2z/4bO7rV83cb9cFziOE8WxGmpyAAAA
X-Change-ID: 20261114-b4-hwmon-nodes-a69b2ae51277
To: Janne Grunau <j@jannau.net>, Neal Gompa <neal@gompa.dev>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Sven Peter <sven@kernel.org>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3915; i=sven@kernel.org;
 h=from:subject:message-id;
 bh=gizQ5l+OSD2VXAgRLhGonhOWVto+Q+V1PVlMy8YyyeE=;
 b=owGbwMvMwCXmIlirolUq95LxtFoSQ9aPGK2cp18Wd4gIKraF7DoZdXqjU03KfZOlBw9NcVO2F
 3+5fMrkjlIWBjEuBlkxRZbt++1Nnzx8I7h006X3MHNYmUCGMHBxCsBENrswMrywFs4xb9fdcOLL
 gx9pz9b+/vthYdl1n587BPWaK1SmFU5h+KedY96V4nrGJ9I8Y+pkIbaQe0fO1TT5BqtJR/y//MA
 skgsA
X-Developer-Key: i=sven@kernel.org; a=openpgp;
 fpr=A1E3E34A2B3C820DBC4955E5993B08092F131F93
X-Endpoint-Received: by B4 Relay for sven@kernel.org/default with
 auth_id=407

Fix the following dt-check-style strict warnings by using lower-case for
hwmon node names:

  arch/arm64/boot/dts/apple/hwmon-common.dtsi:9: [node-name] node name "power-PSTR" is using discouraged style

Signed-off-by: Sven Peter <sven@kernel.org>
---
 arch/arm64/boot/dts/apple/hwmon-common.dtsi   | 12 ++++++------
 arch/arm64/boot/dts/apple/hwmon-fan-dual.dtsi |  4 ++--
 arch/arm64/boot/dts/apple/hwmon-fan.dtsi      |  2 +-
 arch/arm64/boot/dts/apple/hwmon-laptop.dtsi   | 12 ++++++------
 arch/arm64/boot/dts/apple/hwmon-mini.dtsi     |  2 +-
 5 files changed, 16 insertions(+), 16 deletions(-)

diff --git a/arch/arm64/boot/dts/apple/hwmon-common.dtsi b/arch/arm64/boot/dts/apple/hwmon-common.dtsi
index a35c7b14fec8..b5153332e819 100644
--- a/arch/arm64/boot/dts/apple/hwmon-common.dtsi
+++ b/arch/arm64/boot/dts/apple/hwmon-common.dtsi
@@ -6,32 +6,32 @@
  */
 
 &smc_hwmon {
-	power-PSTR {
+	power-pstr {
 		apple,key-id = "PSTR";
 		label = "Total System Power";
 	};
 
-	power-PDTR {
+	power-pdtr {
 		apple,key-id = "PDTR";
 		label = "AC Input Power";
 	};
 
-	power-PMVR {
+	power-pmvr {
 		apple,key-id = "PMVR";
 		label = "3.8 V Rail Power";
 	};
 
-	temperature-TH0x {
+	temperature-th0x {
 		apple,key-id = "TH0x";
 		label = "NAND Flash Temperature";
 	};
 
-	voltage-VD0R {
+	voltage-vd0r {
 		apple,key-id = "VD0R";
 		label = "AC Input Voltage";
 	};
 
-	current-ID0R {
+	current-id0r {
 		apple,key-id = "ID0R";
 		label = "AC Input Current";
 	};
diff --git a/arch/arm64/boot/dts/apple/hwmon-fan-dual.dtsi b/arch/arm64/boot/dts/apple/hwmon-fan-dual.dtsi
index e87997d21e22..771484ed5870 100644
--- a/arch/arm64/boot/dts/apple/hwmon-fan-dual.dtsi
+++ b/arch/arm64/boot/dts/apple/hwmon-fan-dual.dtsi
@@ -8,11 +8,11 @@
 #include "hwmon-fan.dtsi"
 
 &smc_hwmon {
-	fan-F0Ac {
+	fan-f0ac {
 		label = "Fan 1";
 	};
 
-	fan-F1Ac {
+	fan-f1ac {
 		apple,key-id = "F1Ac";
 		label = "Fan 2";
 		apple,fan-minimum = "F1Mn";
diff --git a/arch/arm64/boot/dts/apple/hwmon-fan.dtsi b/arch/arm64/boot/dts/apple/hwmon-fan.dtsi
index 180eb8d7441f..b36d0c9b6af3 100644
--- a/arch/arm64/boot/dts/apple/hwmon-fan.dtsi
+++ b/arch/arm64/boot/dts/apple/hwmon-fan.dtsi
@@ -6,7 +6,7 @@
  */
 
 &smc_hwmon {
-	fan-F0Ac {
+	fan-f0ac {
 		apple,key-id = "F0Ac";
 		label = "Fan";
 		apple,fan-minimum = "F0Mn";
diff --git a/arch/arm64/boot/dts/apple/hwmon-laptop.dtsi b/arch/arm64/boot/dts/apple/hwmon-laptop.dtsi
index cadffd000c76..674013b1f387 100644
--- a/arch/arm64/boot/dts/apple/hwmon-laptop.dtsi
+++ b/arch/arm64/boot/dts/apple/hwmon-laptop.dtsi
@@ -6,32 +6,32 @@
  */
 
 &smc_hwmon {
-	power-PHPC {
+	power-phpc {
 		apple,key-id = "PHPC";
 		label = "Heatpipe Power";
 	};
 
-	temperature-TB0T {
+	temperature-tb0t {
 		apple,key-id = "TB0T";
 		label = "Battery Hotspot";
 	};
 
-	temperature-TCHP {
+	temperature-tchp {
 		apple,key-id = "TCHP";
 		label = "Charge Regulator Temp";
 	};
 
-	temperature-TW0P {
+	temperature-tw0p {
 		apple,key-id = "TW0P";
 		label = "WiFi/BT Module Temp";
 	};
 
-	voltage-SBAV {
+	voltage-sbav {
 		apple,key-id = "SBAV";
 		label = "Battery Voltage";
 	};
 
-	voltage-VD0R {
+	voltage-vd0r {
 		apple,key-id = "VD0R";
 		label = "Charger Input Voltage";
 	};
diff --git a/arch/arm64/boot/dts/apple/hwmon-mini.dtsi b/arch/arm64/boot/dts/apple/hwmon-mini.dtsi
index 7fd86e911acf..ce61805dc879 100644
--- a/arch/arm64/boot/dts/apple/hwmon-mini.dtsi
+++ b/arch/arm64/boot/dts/apple/hwmon-mini.dtsi
@@ -9,7 +9,7 @@
 #include "hwmon-fan.dtsi"
 
 &smc_hwmon {
-	temperature-TW0P {
+	temperature-tw0p {
 		apple,key-id = "TW0P";
 		label = "WiFi/BT Module Temp";
 	};

---
base-commit: 7809dfc2040bd6b8808da2cb7b8ce429ce3df946
change-id: 20261114-b4-hwmon-nodes-a69b2ae51277

Best regards,
--  
Sven Peter <sven@kernel.org>


