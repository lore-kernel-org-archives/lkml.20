Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794426031;
	b=DtZeFTljUXn1Q6i0qJsZJDL19EJLQbevo6+bGgfzkj8zxLN+ddYNj1B/Hb6ovu+haLfv
	 jjhxd4YHz4FTVv0/qQQKyu0cx6YFqWdPDj9sOLCAE4E3q0O/qLvJktV8+oO8yJHd9AyHg
	 GgJ87riqiRCU9Zq5qiUapNhwFtcNpbvsS1jYM2FQmUiqKDKxq2xvDOaUauRVY3eFoymqp
	 TE4Qbug4veXmX3tjMFC+HRagzLhrgp4F6SAAwzN47xcfR7mjwxvq/KFuzQTiptPUhbAaO
	 c+XlYiqiSOl39HGdJvzDbJRC1oWDnrbntyifsG9OiiHyuf7dgNYiQeyNJMX6a1Bhc+w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794426031;
	h=Received:DKIM-Signature:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer;
	bh=xfIMJABMJNp7QfwugcM4fcD/xpFndn0xBvRbdTIn/Sc=;
	b=kSuFkd6DOHYLqvcrxeCwyHf5+0zd0SxPpU1kvMnYsFQlS8G/zGDFIz4C9z8xby6XmVwo
	 7MZWNx0Lc3UY4iffdvJGqLMPgXgwR6PrQyEMeaRwE+k1+Z5b3VHvvCOLP8xQRxnr1zKMr
	 OuRtEPk2lBFUU/FZtV7NEVRxtYh9NKAtnotl+JtBkwv14CdSrx8nswhpjqXStdSci+rT0
	 UzqAaOqZVYzy4G/EhvNkC4hzKOS/Ht63SH9lLPF4opprn1nOs5qABGO37BENlkjqG9mCc
	 vZeB7pPLrKwlbsoeBCFIgizFOB3Q+iZtLuOjEnDs0mXymc0ayk5SFWB+8GvaCw8nRAg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=eqKj3Ioi;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 772FB606A8AB;
	Wed, 11 Nov 2026 19:40:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=eqKj3Ioi
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1062B1F00A10;
	Wed, 11 Nov 2026 19:40:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794426031;
	bh=xfIMJABMJNp7QfwugcM4fcD/xpFndn0xBvRbdTIn/Sc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=eqKj3IoihIJtj+pHl6B8puHU40wNPYe2V2gaPVH3AOkaOMoeTzbdkSeUT6encYtG0
	 wiH/FgZU5F+65y/CYibJDFk07vfQJQu4/AcxJP1YjJFR55Fdt70JVgpIUmNm74xV8H
	 QaUaJOG58G7MZEqxd+7Slv4Dn+/GvJQevPD+UPxoaK+9gnS47bormzdOPbSEeCnjUA
	 NMsZi2MF1KjfiC3qCxj9jH5D/Q9H/BrCq8ey89ko8aZ0ww42h6uWYqbi60xF8JhxXP
	 oF1+9qJF1Bp6VGyCnZoCNSeDt1IyAuuSbJZHBAfyTwOatY5gJ//LfRO8IvktPd4Xy0
	 pG5tpebrYJASQ==
From: "Rob Herring (Arm)" <robh@kernel.org>
Date: Wed, 11 Nov 2026 13:40:14 -0600
Subject: [PATCH 04/12] arm64: dts: hisilicon: Describe ADV7533 supplies
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
Message-Id: <20261111-dtbs-hisi-v1-4-6c9f5f80716c@kernel.org>
References: <20261111-dtbs-hisi-v1-0-6c9f5f80716c@kernel.org>
In-Reply-To: <20261111-dtbs-hisi-v1-0-6c9f5f80716c@kernel.org>
To: Lee Jones <lee@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Guodong Xu <guodong.xu@linux.dev>, 
 Wei Xu <xuwei5@hisilicon.com>
Cc: mfd@lists.linux.dev, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.16-dev

Add the ADV7533 power supply phandles for HiKey and HiKey960. Both
boards have a dedicated HDMI 1.8-V supply. HiKey has a 1.2-V PMIC rail,
while the ADV7533 on HiKey960 uses its HDMI 1.8-V supply for V1P2.
Describe the respective 3.3-V rails as well.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 arch/arm64/boot/dts/hisilicon/hi3660-hikey960.dts | 14 ++++++++++++++
 arch/arm64/boot/dts/hisilicon/hi6220-hikey.dts    |  6 ++++++
 2 files changed, 20 insertions(+)

diff --git a/arch/arm64/boot/dts/hisilicon/hi3660-hikey960.dts b/arch/arm64/boot/dts/hisilicon/hi3660-hikey960.dts
index acecd2dfeeba..1b0ba3dd2cde 100644
--- a/arch/arm64/boot/dts/hisilicon/hi3660-hikey960.dts
+++ b/arch/arm64/boot/dts/hisilicon/hi3660-hikey960.dts
@@ -192,6 +192,14 @@ wlan_en: wlan-en-1-8v {
 		enable-active-high;
 	};
 
+	fixed_3v3: regulator-3v3 {
+		compatible = "regulator-fixed";
+		regulator-name = "fixed-3.3V";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		regulator-always-on;
+	};
+
 	firmware {
 		optee {
 			compatible = "linaro,optee-tz";
@@ -571,6 +579,12 @@ adv7533: adv7533@39 {
 		status = "okay";
 		compatible = "adi,adv7533";
 		reg = <0x39>;
+		avdd-supply = <&ldo3>;
+		dvdd-supply = <&ldo3>;
+		pvdd-supply = <&ldo3>;
+		a2vdd-supply = <&ldo3>;
+		v3p3-supply = <&fixed_3v3>;
+		v1p2-supply = <&ldo3>;
 		adi,dsi-lanes = <4>;
 		ports {
 			#address-cells = <1>;
diff --git a/arch/arm64/boot/dts/hisilicon/hi6220-hikey.dts b/arch/arm64/boot/dts/hisilicon/hi6220-hikey.dts
index 229116477f1d..5f31569cf494 100644
--- a/arch/arm64/boot/dts/hisilicon/hi6220-hikey.dts
+++ b/arch/arm64/boot/dts/hisilicon/hi6220-hikey.dts
@@ -505,6 +505,12 @@ &i2c2 {
 	adv7533: adv7533@39 {
 		compatible = "adi,adv7533";
 		reg = <0x39>;
+		avdd-supply = <&ldo15>;
+		dvdd-supply = <&ldo15>;
+		pvdd-supply = <&ldo15>;
+		a2vdd-supply = <&ldo15>;
+		v3p3-supply = <&reg_vdd_3v3>;
+		v1p2-supply = <&ldo22>;
 		interrupt-parent = <&gpio1>;
 		interrupts = <1 2>;
 		pd-gpios = <&gpio0 4 0>;

-- 
2.53.0

