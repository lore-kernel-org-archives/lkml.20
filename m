Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.127.231.28
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794195183;
	b=kjRC2GJTDSXLYw2nfIEbCK2rztnjO9waafmNK1/vktHTOJMgGOukV9IIDi3UmHpPkmZs
	 tX39THOab6MAQmeMVRt1bILaj0VNhUfQVHngv2vRqIo64NY8FrCttW3lYFJWaIFghZKwH
	 HKsrFI735z+130TGMhLUmP34r/hjUtOR9YzKw2Sk5CyFaKq2Z0gdxJFLBnlAH+iubZ/ir
	 iiZ2T4KF6+BLR+xzevVSkve4OBIWGKUXPfWMO3sOjfC3CFSRYEPDooV8mZDHWaOVz6a4t
	 5DSEmNWWeHehXxcoF6QLzzHjuDIzTV7gwFbc6I7KkOBEV7qamxs+99ojFfr0R6MVtSg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794195183;
	h=DMARC-Filter:DKIM-Signature:To:Cc:From:Subject:Date:
	 X-Lms-Return-Path:X-Original-From:X-Mailer:In-Reply-To:Content-Type:
	 References:Content-Transfer-Encoding:Message-Id:Mime-Version:
	 Received;
	bh=PJxndX0XDADBhoVnQbXUa2d6kB9IkQ9K2h0BNMt2SW4=;
	b=qyRs/K2Gos0H+9Cz47MrtSaJFQWr3vIgF1dSqJrex9uKayzQbhHu34msH1ZAH5s4iccW
	 xdMDA27BbJxxduE483RsEPOI/F1mhgzgVsR21CkB1lgZwWkt/t3Kuo2dFa6n1RTxbje56
	 nM1SvjQNEJ334X/ZFWeCgzT1mGXLqWF8JohgsPqF4lwL1jVtJfT4zd8YGDW9iA2A+Vbk7
	 HzGxgT50S+sTy2Q11lhmvGvbEkHjjm3ly3oUCzcyVOvAMuxjY3/rI2gL0qUoQbIfLeibQ
	 eRFwpnw1VHa9jV2szXGmCE+ydfNi97RooSYxx9YfRFZreuDPhaOodVB7HE4WsEydw6A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=deepcomputing.io;
	spf=pass smtp.mailfrom=deepcomputing.io;
	dkim=pass header.d=deepcomputing-io.20200927.dkim.feishu.cn header.i=@deepcomputing-io.20200927.dkim.feishu.cn header.a=rsa-sha256 header.s=s1 header.b=UXyyR+zs;
	arc=none smtp.remote-ip=209.127.231.28
Received: from va-2-28.ptr.blmpb.com (va-2-28.ptr.blmpb.com [209.127.231.28])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54872606A33A
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 03:33:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 54872606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=deepcomputing.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=deepcomputing.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=deepcomputing-io.20200927.dkim.feishu.cn header.i=@deepcomputing-io.20200927.dkim.feishu.cn header.a=rsa-sha256 header.s=s1 header.b=UXyyR+zs
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=s1; d=deepcomputing-io.20200927.dkim.feishu.cn; t=1794195178;
  h=from:subject:mime-version:from:date:message-id:subject:to:cc:
 reply-to:content-type:mime-version:in-reply-to:message-id;
 bh=PJxndX0XDADBhoVnQbXUa2d6kB9IkQ9K2h0BNMt2SW4=;
 b=UXyyR+zsNpKPq7/jqJN4IDe60dz0NJSD2+cXIQQDAH6mmct9Ob6L1wUIgYSGT15k7bSQyR
 IsCpNpL3VaVkScrY2WnW0iHjdRqtiOAVCW/HRAjWdJYHPng/G2haW8GerV1SQgHdcTFF1n
 dzOCtSSl2r0CBb4m4h2tT1taojUt3v6XQ7kU0wE0ze/XFbDgFez+roFOU/OYmX0LFUxAI0
 5t4+DfYTj4YDG1n/9QMBiUWBvXeO4z7dTds0U952Xgtk3ieUFh/iqbxcsYp11IYzAFYM/4
 FaJevjHJFGKSGfoWsG5AlWxZeJ9ETt0PsufAEzDcgkEdIELXfLn/nYVKpAp7Cw==
To: "Yixun Lan" <dlan@kernel.org>, 
	"Troy Mitchell" <troy.mitchell@linux.spacemit.com>, 
	"Conor Dooley" <conor+dt@kernel.org>, "Rob Herring" <robh@kernel.org>, 
	"Krzysztof Kozlowski" <krzk+dt@kernel.org>, 
	"Paul Walmsley" <pjw@kernel.org>, "Palmer Dabbelt" <palmer@dabbelt.com>, 
	"Albert Ou" <aou@eecs.berkeley.edu>
Cc: "Alexandre Ghiti" <alex@ghiti.fr>, <devicetree@vger.kernel.org>, 
	<linux-riscv@lists.infradead.org>, <spacemit@lists.linux.dev>, 
	<linux-kernel@vger.kernel.org>, 
	"Sandie Cao" <sandie.cao@deepcomputing.io>
From: "Sandie Cao" <sandie.cao@deepcomputing.io>
Subject: [PATCH v4 1/3] riscv: dts: spacemit: k3-deepcomputing-fml13v05: add P1 PMIC regulator tree
Date: Mon,  9 Nov 2026 11:32:40 +0800
X-Lms-Return-Path: <lba+26af13ee8+16d5bb+vger.kernel.org+sandie.cao@deepcomputing.io>
X-Original-From: Sandie Cao <sandie.cao@deepcomputing.io>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261109033154.361399-1-sandie.cao@deepcomputing.io>
Content-Type: text/plain; charset=UTF-8
References: <20261109033154.361399-1-sandie.cao@deepcomputing.io>
Content-Transfer-Encoding: 7bit
Message-Id: <20261109033240.361416-1-sandie.cao@deepcomputing.io>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Received: from roma-Laptop-12th-Gen-Intel-Core.lan ([183.23.98.251]) by smtp.feishu.cn with ESMTPS; Mon, 09 Nov 2026 11:32:55 +0800

Add the P1 PMIC's regulator topology tree for DeepComputing FML13V05 board

Signed-off-by: Sandie Cao <sandie.cao@deepcomputing.io>
---
 .../spacemit/k3-deepcomputing-fml13v05.dts    | 148 ++++++++++++++++++
 1 file changed, 148 insertions(+)

diff --git a/arch/riscv/boot/dts/spacemit/k3-deepcomputing-fml13v05.dts b/arch/riscv/boot/dts/spacemit/k3-deepcomputing-fml13v05.dts
index b5d5112de358..e061233c15a3 100644
--- a/arch/riscv/boot/dts/spacemit/k3-deepcomputing-fml13v05.dts
+++ b/arch/riscv/boot/dts/spacemit/k3-deepcomputing-fml13v05.dts
@@ -22,6 +22,154 @@ memory@100000000 {
 		device_type = "memory";
 		reg = <0x1 0x00000000 0x4 0x00000000>;
 	};
+
+	reg_aux_vcc5v: regulator-aux-vcc5v {
+		compatible = "regulator-fixed";
+		regulator-name = "AUX_VCC5V";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		regulator-always-on;
+	};
+};
+
+&i2c8 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&i2c8_cfg>;
+	status = "okay";
+
+	pmic@41 {
+		compatible = "spacemit,p1";
+		reg = <0x41>;
+		interrupts = <64 IRQ_TYPE_LEVEL_HIGH>;
+		vin1-supply = <&reg_aux_vcc5v>;
+		vin2-supply = <&reg_aux_vcc5v>;
+		vin3-supply = <&reg_aux_vcc5v>;
+		vin4-supply = <&reg_aux_vcc5v>;
+		vin5-supply = <&reg_aux_vcc5v>;
+		vin6-supply = <&reg_aux_vcc5v>;
+		aldoin-supply = <&reg_aux_vcc5v>;
+		dldoin1-supply = <&buck4>;
+		dldoin2-supply = <&buck4>;
+
+		regulators {
+			buck1: buck1 {
+				regulator-min-microvolt = <1050000>;
+				regulator-max-microvolt = <1050000>;
+				regulator-ramp-delay = <5000>;
+				regulator-always-on;
+			};
+
+			buck2: buck2 {
+				regulator-min-microvolt = <1050000>;
+				regulator-max-microvolt = <1050000>;
+				regulator-ramp-delay = <5000>;
+				regulator-always-on;
+			};
+
+			buck3: buck3 {
+				regulator-min-microvolt = <800000>;
+				regulator-max-microvolt = <800000>;
+				regulator-ramp-delay = <5000>;
+				regulator-always-on;
+			};
+
+			buck4: buck4 {
+				regulator-min-microvolt = <2100000>;
+				regulator-max-microvolt = <2100000>;
+				regulator-ramp-delay = <5000>;
+				regulator-always-on;
+			};
+
+			buck5: buck5 {
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <1800000>;
+				regulator-ramp-delay = <5000>;
+				regulator-always-on;
+			};
+
+			buck6: buck6 {
+				regulator-min-microvolt = <500000>;
+				regulator-max-microvolt = <500000>;
+				regulator-ramp-delay = <5000>;
+				regulator-always-on;
+			};
+
+			aldo1: aldo1 {
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <3300000>;
+				regulator-always-on;
+				regulator-boot-on;
+			};
+
+			aldo2: aldo2 {
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <1800000>;
+				regulator-always-on;
+				regulator-boot-on;
+			};
+
+			aldo3: aldo3 {
+				regulator-min-microvolt = <500000>;
+				regulator-max-microvolt = <3400000>;
+			};
+
+			aldo4: aldo4 {
+				regulator-min-microvolt = <3300000>;
+				regulator-max-microvolt = <3300000>;
+				regulator-always-on;
+				regulator-boot-on;
+			};
+
+			dldo1: dldo1 {
+				regulator-min-microvolt = <1200000>;
+				regulator-max-microvolt = <1200000>;
+				regulator-always-on;
+				regulator-boot-on;
+			};
+
+			dldo2: dldo2 {
+				regulator-min-microvolt = <900000>;
+				regulator-max-microvolt = <900000>;
+				regulator-always-on;
+				regulator-boot-on;
+			};
+
+			dldo3: dldo3 {
+				regulator-min-microvolt = <800000>;
+				regulator-max-microvolt = <800000>;
+				regulator-always-on;
+				regulator-boot-on;
+			};
+
+			dldo4: dldo4 {
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <1800000>;
+				regulator-always-on;
+				regulator-boot-on;
+			};
+
+			dldo5: dldo5 {
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <1800000>;
+				regulator-always-on;
+				regulator-boot-on;
+			};
+
+			dldo6: dldo6 {
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <1800000>;
+				regulator-always-on;
+				regulator-boot-on;
+			};
+
+			dldo7: dldo7 {
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <1800000>;
+				regulator-always-on;
+				regulator-boot-on;
+			};
+		};
+	};
 };
 
 &uart0 {
-- 
2.43.0
