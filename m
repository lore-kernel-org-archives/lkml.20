Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794426030;
	b=gUHn070gM7mNGH1liThgFZV27zx9OO2lmX3f3n/fyEnFlYh8RWmg/bPn6nh64tOUQJyZ
	 WMjtwf2w09YJ4dhwaDqgeajDNAKYRDpSIWTF/+bEPiGF6Qqz/0M09tCx5bDHnDspJa+9+
	 E7SMEapx2s63BpDDapn2Q8Ft0xcqkPdmZfkVNNiinTfqU4atd6h12NC/EvKxfs3bl3Cj+
	 gQbCg+y/qyflEPn4aUCMXRfxM3GqtCxmSWNHNx6P3Uj6jSw70ueq79os23nB+f+ZU/cXs
	 FKlaJ4OAz1qXrTnnX6w5ajdtg39S2ZDL/TcvuNUAicfq0SGb0/7giw1UXxAmGpdKK4g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794426030;
	h=Received:DKIM-Signature:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer;
	bh=Gg8Z3g5whr4qOTZSmsNEegQVriNO3ujPVFMlRk++Be4=;
	b=Rz4SZRa4S1+DAfCujA8oPzfrSuhSuoDDN4ZLFjduVoIc1yqYrVzrOUJQinBFjYejhnCC
	 6GautuV+EQyci/h2zzMsQVy7WkI0CH6uiVWAukT8tVnkaym9XgBrglo6AMJ/R48cEgSIg
	 X0X4LcbRtwdxqOaboY0fubndv97jkh9X4P3qPGcWae+COXax0j3XeHknyUv7a+gD78PIR
	 UXDZPyojiwOXR2bsBMV9omTMDCMU/Odfl/BQtpN0bobI/42n39YN85Pla7Yba8itSRIPP
	 uutoya/sbGp+rmpTQX++8IQpZUGBto3Ym1NZjpOhf1wPtxyOcyT811ORcA1tNa4H2Kw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=boxGcIGU;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 683BB60A2618;
	Wed, 11 Nov 2026 19:40:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=boxGcIGU
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C44581F00A09;
	Wed, 11 Nov 2026 19:40:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794426030;
	bh=Gg8Z3g5whr4qOTZSmsNEegQVriNO3ujPVFMlRk++Be4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=boxGcIGUIxsxUMoseU1zCR37pL1tKnYZIr9z2mFRKP/yDB58+klYq9Leqk5mw3whx
	 j2/6f31VFgGLAk55mWala/nHSvr7cjg085glh8tRjndGcXLfbT7DzfDODeEg/270Rz
	 q+PqvxuZAX5CAT9cXQURWxmIMQQqABN1235df8vLtmLN1MlnzcvuwOq+JTmU6FYIs5
	 N3m0JId1q8S8DHh54z+GqtT6ifGDEN2lpokE6Jtn4Vb+yCaeK28UOAcJFXTzaGQ2H/
	 nEMeglx93zjXHbqsO8OnF/e6t4d6Nd9N5nYA4jnOsEMR+RQfgowsFknqQJ/qe/cGT6
	 /FsKIiDH4aslQ==
From: "Rob Herring (Arm)" <robh@kernel.org>
Date: Wed, 11 Nov 2026 13:40:13 -0600
Subject: [PATCH 03/12] arm64: dts: hisilicon: Add specific syscon
 compatibles
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
Message-Id: <20261111-dtbs-hisi-v1-3-6c9f5f80716c@kernel.org>
References: <20261111-dtbs-hisi-v1-0-6c9f5f80716c@kernel.org>
In-Reply-To: <20261111-dtbs-hisi-v1-0-6c9f5f80716c@kernel.org>
To: Lee Jones <lee@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Guodong Xu <guodong.xu@linux.dev>, 
 Wei Xu <xuwei5@hisilicon.com>
Cc: mfd@lists.linux.dev, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.16-dev

Add specific compatibles for HiSilicon syscon nodes HiKey reboot mode,
Hi6220 media NOC ADE, HIP06/HIP07 SerDes, and DSA CPLD syscon.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 arch/arm64/boot/dts/hisilicon/hi3660-hikey960.dts | 3 ++-
 arch/arm64/boot/dts/hisilicon/hi6220-hikey.dts    | 3 ++-
 arch/arm64/boot/dts/hisilicon/hi6220.dtsi         | 2 +-
 arch/arm64/boot/dts/hisilicon/hip06.dtsi          | 2 +-
 arch/arm64/boot/dts/hisilicon/hip07.dtsi          | 4 ++--
 5 files changed, 8 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/boot/dts/hisilicon/hi3660-hikey960.dts b/arch/arm64/boot/dts/hisilicon/hi3660-hikey960.dts
index 27fb08d348c9..acecd2dfeeba 100644
--- a/arch/arm64/boot/dts/hisilicon/hi3660-hikey960.dts
+++ b/arch/arm64/boot/dts/hisilicon/hi3660-hikey960.dts
@@ -56,7 +56,8 @@ ramoops@32000000 {
 	};
 
 	reboot-mode-syscon@32100000 {
-		compatible = "syscon", "simple-mfd";
+		compatible = "hisilicon,hi3660-reboot-mode",
+			     "syscon", "simple-mfd";
 		reg = <0x0 0x32100000 0x0 0x00001000>;
 
 		reboot-mode {
diff --git a/arch/arm64/boot/dts/hisilicon/hi6220-hikey.dts b/arch/arm64/boot/dts/hisilicon/hi6220-hikey.dts
index 2d304efe081d..229116477f1d 100644
--- a/arch/arm64/boot/dts/hisilicon/hi6220-hikey.dts
+++ b/arch/arm64/boot/dts/hisilicon/hi6220-hikey.dts
@@ -69,7 +69,8 @@ linux,cma {
 	};
 
 	reboot-mode-syscon@5f01000 {
-		compatible = "syscon", "simple-mfd";
+		compatible = "hisilicon,hi6220-reboot-mode",
+			     "syscon", "simple-mfd";
 		reg = <0x0 0x05f01000 0x0 0x00001000>;
 
 		reboot-mode {
diff --git a/arch/arm64/boot/dts/hisilicon/hi6220.dtsi b/arch/arm64/boot/dts/hisilicon/hi6220.dtsi
index 61eaa7f8c1c9..21eb268b5731 100644
--- a/arch/arm64/boot/dts/hisilicon/hi6220.dtsi
+++ b/arch/arm64/boot/dts/hisilicon/hi6220.dtsi
@@ -294,7 +294,7 @@ acpu_sctrl: acpu_sctrl@f6504000 {
 		};
 
 		medianoc_ade: medianoc_ade@f4520000 {
-			compatible = "syscon";
+			compatible = "hisilicon,hi6220-medianoc-ade", "syscon";
 			reg = <0x0 0xf4520000 0x0 0x4000>;
 		};
 
diff --git a/arch/arm64/boot/dts/hisilicon/hip06.dtsi b/arch/arm64/boot/dts/hisilicon/hip06.dtsi
index 3d7285e6700e..823cd314dd32 100644
--- a/arch/arm64/boot/dts/hisilicon/hip06.dtsi
+++ b/arch/arm64/boot/dts/hisilicon/hip06.dtsi
@@ -450,7 +450,7 @@ pcie_subctl: pcie_subctl@a0000000 {
 		};
 
 		serdes_ctrl: sds_ctrl@c2200000 {
-			compatible = "syscon";
+			compatible = "hisilicon,hip06-serdes-ctrl", "syscon";
 			reg = <0 0xc2200000 0x0 0x80000>;
 		};
 
diff --git a/arch/arm64/boot/dts/hisilicon/hip07.dtsi b/arch/arm64/boot/dts/hisilicon/hip07.dtsi
index d175e242ee96..b815c1fff6ea 100644
--- a/arch/arm64/boot/dts/hisilicon/hip07.dtsi
+++ b/arch/arm64/boot/dts/hisilicon/hip07.dtsi
@@ -1229,7 +1229,7 @@ dsa_subctrl: dsa_subctrl@c0000000 {
 		};
 
 		dsa_cpld: dsa_cpld@78000010 {
-			compatible = "syscon";
+			compatible = "hisilicon,hip07-dsa-cpld", "syscon";
 			reg = <0x0 0x78000010 0x0 0x100>;
 			reg-io-width = <2>;
 		};
@@ -1240,7 +1240,7 @@ pcie_subctl: pcie_subctl@a0000000 {
 		};
 
 		serdes_ctrl: sds_ctrl@c2200000 {
-			compatible = "syscon";
+			compatible = "hisilicon,hip07-serdes-ctrl", "syscon";
 			reg = <0 0xc2200000 0x0 0x80000>;
 		};
 

-- 
2.53.0

