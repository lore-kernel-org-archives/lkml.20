Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793872163;
	b=jTfExC97Op5EE7RKwka8zD4G/0/M19CwffghXJ84JNeJ8lz4R3n9iYIpqx3WHonNMlKB
	 CTxy3z0O2p8y+4dvLDr5Q9d8GIxGU5XKRYxr609R5e+zcWm50ygM2NRM12LZXwMn5cCjJ
	 Ypb2miKFjOVJPJa3MfzVkauYNfyvKpfsYIF9fQwsmhmBBsoP3wtd2EQcUgbYJHYl8mFuZ
	 Mk6qwT1uX+U7EUbk3gFfMyVdqNaNiYBW95YlZrBZTW4rAGYjuQy1tav617YseOTgDUI6Y
	 bP1cXQDQtCKc6eo3t+n3ex1JSWLfz/y4X1VVK3yTb6i2AJTmvany0RA5X8b1COS7rEQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793872163;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:X-B4-Tracking:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To;
	bh=xklg3CjbZrUzyh4Xo0rBGxi7VDiGIt84+18sPwP1vr8=;
	b=HCWOsfvl4PmmgrnklzWwgkXMkV+LPw4C8m2rf04j8UT+iLslZk1A6nEOEcLadfbt2lFu
	 Z/tzZpMQYHiawuDsFK/7c7v7pRNpDWmwTfnfQzEdN2nqvzpBZhDBoiIQ2FOzPvPCTcQ+A
	 QI9NfVd2I0gQLUXzpAmZzTluMsMRxqIp6zECUkRGlwXLvFy1+Ls28joazteltWe9znOqo
	 dFLFsqHYYuDUrDg6mxyJEyQizAQ9aOwOjCv0DCzydjI/yyp7doCerhmkXZR/ulvOYe8Dd
	 v3K/FDOItCUbG1bCfVJYOmHkrTc2Rv0Ul1dOXhJj0nf9VEj0Y8jdjhx8m5YfzmWGIew==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bTYMuv1C;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49F77606A32D;
	Thu,  5 Nov 2026 09:49:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bTYMuv1C
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1793872162;
	b=k6PNlmSXBSlArn+tCnzDgrPUy4GWcHKtOJtK0gViGki9l0CwJgRcLvt3oTuLswEqLDIr
	 Nd0AnSCjO4H0Yhb4E/XM8eS26IfHimbDikinWDqri1StKGP6o95bsCzst69td1Emmk0SB
	 85FSYjv36igYeJhvOg5ZIKEyoF0rOCvMh7638r2z387WrGNhFfwSTMAnbZ+O9rCM41A5x
	 Vgd7GIAdsB3cnYkQQ9Yd/2244T5VLx/LVdPKSN4/oQKFhyJq/8LMaorO6CWBxBFQ/EZln
	 VapOD26Bjf+w7fZhNpSADq/1OXRuMn/dcxB80CVzbYn8IMslF2gdVdTNukDlmN5uj1g==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1793872162;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:X-B4-Tracking:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To;
	bh=xklg3CjbZrUzyh4Xo0rBGxi7VDiGIt84+18sPwP1vr8=;
	b=aBWqPXSj65S5ntVjv7NFFiM65IoEVRbkLzQhaJ/FkGEK6fjGF3316GVglvQW1o/0aMYQ
	 7eFo3Mng8sD6CBpCC1uRLVDfNGfx5B261og0BeD85dMNptf5Rs4PE4OlAFPrtONkgaYYL
	 xR3nqW88CEAmTvnYsdrzwCXblDg2PA+mQkyndwFFj2P23L/mWT59KT1mHSK0nIYCL4JII
	 m4ciTca8mq/Hwtgzt5nyBRbYVDw3TkRMCD12gQsESx3B3ac8JyHjqSbj7H5Li8cYIhmG6
	 bNzJA5QEl4xLcAetIGyOLcDd9Oqjoa5xbboaZtVp7Zxi2jAall/28VTaeBVNk/aFefQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 4221D1F000C1;
	Thu,  5 Nov 2026 09:49:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793872162;
	bh=xklg3CjbZrUzyh4Xo0rBGxi7VDiGIt84+18sPwP1vr8=;
	h=From:Date:Subject:To:Cc:Reply-To;
	b=bTYMuv1CC/lOhj7xCXmd/z+E6F6qXaHfVZmkFzTZQlaf0SrOIGa1uPna5H3VhTpUX
	 +TUw2rPOlN89xq1BlW+L1P2tD2bBYnpPe0hV/r7fDa0O49rEi24An/sMEvmz2RFpHl
	 kuc4NZEITO+dYQ4dQERIgYPwG1RFlMR0Qhu0PDoNJ73mCxnM25hKJ93lVTEFMI0oRe
	 DBUHHvxkMrXEroO026uRElgwVzRpj5juade5Bp6ZpmvqnP+oiQyDo3ufaB6Ig/4z5H
	 h0pqBBmtcsJHcU7iRT5oeiu47nnK2IGZWlj6o+9La8dMmRxKafC0EaUAmVH5XvDqlJ
	 FRG3ukbJmH4TQ==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 9750E471A6;
	Thu,  5 Nov 2026 09:49:21 +0000 (UTC)
From: Eric Yang via B4 Relay <devnull+eric.yang.wiwynn.gmail.com@kernel.org>
Date: Thu, 05 Nov 2026 09:49:21 +0000
Subject: [PATCH] ARM: dts: aspeed: yosemite4: Remove Floating Falls board
 nodes
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
Message-Id: <20261105-yv4-remove-ff-nodes-v1-1-aa707a9577b7@gmail.com>
X-B4-Tracking: v=1; b=H4sIACBR7GoC/x3MQQqDMBBG4auEWXcgGUWwVxEXxfxpZ2FSEghK8
 O4Gl9/ivUYFWVHobRplVC2aYod7Gdp+n/gFq+8msTI5Zwc+68gZe6rgEDgmj8IzxDo7ehkmoV7
 +M4Iez3VZr+sGsiT61WUAAAA=
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>, 
 Ryan Chen <ryan_chen@aspeedtech.com>, 
 Billy Tsai <billy_tsai@aspeedtech.com>, patrick@stwcx.xyz
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
 Sean He <sean.he.wiwynn@gmail.com>, Eric Yang <eric.yang.wiwynn@gmail.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793872161; l=4662;
 i=eric.yang.wiwynn@gmail.com; s=20260911; h=from:subject:message-id;
 bh=T4XeuvV+KGamPG2baiyhX3Us0yn42pCuMdWIPVBaYz8=;
 b=L/oFlGYm96Adbk9JS+0cKrrf3+UCzEcvN0mp8Rny3aSD0XxKxLi5JYtosxQ6OaB05Ra+llXYm
 vmNZ0Uw3r65CjqW8GIlH6H/vGm8XPD3/HCNcfF8oaSDnA0xgoNGXcAX
X-Developer-Key: i=eric.yang.wiwynn@gmail.com; a=ed25519;
 pk=XYQiwgPZNUCt1JCbsO7zX8ODEiRKocz7fYwt+aWnXBs=
X-Endpoint-Received: by B4 Relay for eric.yang.wiwynn@gmail.com/20260911
 with auth_id=1023
X-Original-From: Eric Yang <eric.yang.wiwynn@gmail.com>
Reply-To: eric.yang.wiwynn@gmail.com

From: Sean He <sean.he.wiwynn@gmail.com>

The Floating Falls (FF) board carries a pca9537 GPIO expander at address
0x49 and a FRU EEPROM at address 0x50 on each slot I2C bus. FF was
planned in the early Yosemite 4 design but has not been used since the
DVT stage, so these addresses never acknowledge. The pca953x driver
fails to probe all eight pca9537 nodes on every boot, and the at24
driver does not bind to the eight EEPROM nodes either. Remove the nodes
for both devices.

Signed-off-by: Sean He <sean.he.wiwynn@gmail.com>
Signed-off-by: Eric Yang <eric.yang.wiwynn@gmail.com>
---
The changelog was drafted with an AI assistant (Claude Code) and
reviewed by the submitter.

Tested on two Yosemite 4 BMCs, baseline vs patched image: the eight
pca9537 nodes and the sixteen 0x49/0x50 slot-bus clients are gone, while
the 0x51/0x54 clients, gpio chips and FRU objects are unchanged.
CHECK_DTBS=y W=1 shows no new warnings and the DTB diff is exactly the
sixteen removed nodes.
---
 .../dts/aspeed/aspeed-bmc-facebook-yosemite4.dts   | 96 ----------------------
 1 file changed, 96 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
index e4172be84..4c7c96ce4 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
@@ -604,18 +604,6 @@ imux16: i2c@0 {
 			reg = <0>;
 			#address-cells = <1>;
 			#size-cells = <0>;
-			gpio@49 {
-				compatible = "nxp,pca9537";
-				reg = <0x49>;
-				gpio-controller;
-				#gpio-cells = <2>;
-			};
-
-			eeprom@50 {
-				compatible = "atmel,24c128";
-				reg = <0x50>;
-			};
-
 			eeprom@51 {
 				compatible = "atmel,24c128";
 				reg = <0x51>;
@@ -631,18 +619,6 @@ imux17: i2c@1 {
 			reg = <1>;
 			#address-cells = <1>;
 			#size-cells = <0>;
-			gpio@49 {
-				compatible = "nxp,pca9537";
-				reg = <0x49>;
-				gpio-controller;
-				#gpio-cells = <2>;
-			};
-
-			eeprom@50 {
-				compatible = "atmel,24c128";
-				reg = <0x50>;
-			};
-
 			eeprom@51 {
 				compatible = "atmel,24c128";
 				reg = <0x51>;
@@ -658,18 +634,6 @@ imux18: i2c@2 {
 			reg = <2>;
 			#address-cells = <1>;
 			#size-cells = <0>;
-			gpio@49 {
-				compatible = "nxp,pca9537";
-				reg = <0x49>;
-				gpio-controller;
-				#gpio-cells = <2>;
-			};
-
-			eeprom@50 {
-				compatible = "atmel,24c128";
-				reg = <0x50>;
-			};
-
 			eeprom@51 {
 				compatible = "atmel,24c128";
 				reg = <0x51>;
@@ -685,18 +649,6 @@ imux19: i2c@3 {
 			reg = <3>;
 			#address-cells = <1>;
 			#size-cells = <0>;
-			gpio@49 {
-				compatible = "nxp,pca9537";
-				reg = <0x49>;
-				gpio-controller;
-				#gpio-cells = <2>;
-			};
-
-			eeprom@50 {
-				compatible = "atmel,24c128";
-				reg = <0x50>;
-			};
-
 			eeprom@51 {
 				compatible = "atmel,24c128";
 				reg = <0x51>;
@@ -726,18 +678,6 @@ imux20: i2c@0 {
 			reg = <0>;
 			#address-cells = <1>;
 			#size-cells = <0>;
-			gpio@49 {
-				compatible = "nxp,pca9537";
-				reg = <0x49>;
-				gpio-controller;
-				#gpio-cells = <2>;
-			};
-
-			eeprom@50 {
-				compatible = "atmel,24c128";
-				reg = <0x50>;
-			};
-
 			eeprom@51 {
 				compatible = "atmel,24c128";
 				reg = <0x51>;
@@ -753,18 +693,6 @@ imux21: i2c@1 {
 			reg = <1>;
 			#address-cells = <1>;
 			#size-cells = <0>;
-			gpio@49 {
-				compatible = "nxp,pca9537";
-				reg = <0x49>;
-				gpio-controller;
-				#gpio-cells = <2>;
-			};
-
-			eeprom@50 {
-				compatible = "atmel,24c128";
-				reg = <0x50>;
-			};
-
 			eeprom@51 {
 				compatible = "atmel,24c128";
 				reg = <0x51>;
@@ -780,18 +708,6 @@ imux22: i2c@2 {
 			reg = <2>;
 			#address-cells = <1>;
 			#size-cells = <0>;
-			gpio@49 {
-				compatible = "nxp,pca9537";
-				reg = <0x49>;
-				gpio-controller;
-				#gpio-cells = <2>;
-			};
-
-			eeprom@50 {
-				compatible = "atmel,24c128";
-				reg = <0x50>;
-			};
-
 			eeprom@51 {
 				compatible = "atmel,24c128";
 				reg = <0x51>;
@@ -807,18 +723,6 @@ imux23: i2c@3 {
 			reg = <3>;
 			#address-cells = <1>;
 			#size-cells = <0>;
-			gpio@49 {
-				compatible = "nxp,pca9537";
-				reg = <0x49>;
-				gpio-controller;
-				#gpio-cells = <2>;
-			};
-
-			eeprom@50 {
-				compatible = "atmel,24c128";
-				reg = <0x50>;
-			};
-
 			eeprom@51 {
 				compatible = "atmel,24c128";
 				reg = <0x51>;

---
base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
change-id: 20261103-yv4-remove-ff-nodes-9e20104d2362

Best regards,
-- 
Eric Yang <eric.yang.wiwynn@gmail.com>


