Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.127.231.38
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794819683;
	b=44XGiqRArtGQ5LBE90GWAk3tdpZPWqcAnjD9gGQcyLn/WNLKJEs7nf+VsGyoeEb+O+Yg
	 n+rsR6xFmAFxPm6B6NY1nHpVWWuUCbKjF25qOOGsrqZStGYMX/t2H9LOf4GBNClRN34+1
	 9kEk16O72bj3m6ztxYf2AkYwuAgiY41gd2r4o1hinXwyA4JqlEYIcCWUX5ss7wUqLZoYI
	 ikt9bxWDafSskl5Xotp6+h4AIAsCQ1jrOsCUfJ7ZrPpkBdfK6yXPQVwyj9YuVap/6KUeO
	 9Erk+OGxxYjlh3n0+dtpRYelfVfZAdws66M0QBOoaIcQSHIb+A/28lvn8VpUkkrfOOw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794819683;
	h=DMARC-Filter:DKIM-Signature:Subject:Mime-Version:
	 Content-Transfer-Encoding:In-Reply-To:Content-Type:From:
	 X-Original-From:Received:Date:Message-Id:References:To:X-Mailer:
	 X-Lms-Return-Path:Cc;
	bh=K+SHc+Dz2bu6gR+hGPRdpnsUFNLQ0kuFmQnGIRcMA1w=;
	b=J5YhhKtnvZhp92a897+svV+bGBbFba+sR7Dr6V7tY/edU+nQBZyh7K/xefa4O97GsKPI
	 2kIvCRKK+cXwNmeGTAQfL5OM+xuCxDtSezTy7vwi5uXiQhoFJuJ4b5RefYk+9RUQtr5VN
	 w/1qAhBLcWh3Xk0j6bGAfBDw+inCu5E8QOYZIhFRBQ4WPv7exo2zDMEVjyx1m2Y/XTCm6
	 lxw6L4yG+eT0KGnVkTC/uW57YYHELCbk55zegj7T5tMcMbpnNUL0z7Y3D8pbFqc321xTr
	 +cDF8obTT2ugObaV+QUY767rntwvgBPFB3xs5Cc81eFhGrEoIbNNHOPR3VCONBUBPJA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=deepcomputing.io;
	spf=pass smtp.mailfrom=deepcomputing.io;
	dkim=pass header.d=deepcomputing-io.20200927.dkim.feishu.cn header.i=@deepcomputing-io.20200927.dkim.feishu.cn header.a=rsa-sha256 header.s=s1 header.b=NZTsXlwV;
	arc=none smtp.remote-ip=209.127.231.38
Received: from va-2-38.ptr.blmpb.com (va-2-38.ptr.blmpb.com [209.127.231.38])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA7AB606A329
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 09:01:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AA7AB606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=deepcomputing.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=deepcomputing.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=deepcomputing-io.20200927.dkim.feishu.cn header.i=@deepcomputing-io.20200927.dkim.feishu.cn header.a=rsa-sha256 header.s=s1 header.b=NZTsXlwV
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=s1; d=deepcomputing-io.20200927.dkim.feishu.cn; t=1794819673;
  h=from:subject:mime-version:from:date:message-id:subject:to:cc:
 reply-to:content-type:mime-version:in-reply-to:message-id;
 bh=K+SHc+Dz2bu6gR+hGPRdpnsUFNLQ0kuFmQnGIRcMA1w=;
 b=NZTsXlwV1/8y0dMYpbj7jsnyOwig07G0v4leFBjY4Jl+jvM80j9waNWZibLlnXivWgq6yZ
 /b1lETNxVoa66RCCSJV6lDkn5YDjOgFm8gCwi5NdrL9s3DtPGE2tvqrOK09qoKDEV+TB//
 W9g6Vg673CBqPmZEJ0t20rz5BTwAU9WR/KQHvWFOZY56Dy5i2RkJKqt66V/03AMf4tUyzZ
 EREdERxy1A4RsnnMNothf1nGm13bsYGqKKHG6ROfO5liR1PmGrFWvZMweuiPCeDMPV9Ksm
 I7knEMO3+dmhhL+SjFQh9chS8DtW8ns+Bftr+PKrYk1NZzvbEPFxPB1L+rEE5A==
Subject: [PATCH 5/5] riscv: dts: spacemit: k3-deepcomputing-fml13v05: enable PCIe
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
In-Reply-To: <20261116085725.951253-1-sandie.cao@deepcomputing.io>
Content-Type: text/plain; charset=UTF-8
From: "Sandie Cao" <sandie.cao@deepcomputing.io>
X-Original-From: Sandie Cao <sandie.cao@deepcomputing.io>
Received: from roma-Laptop-12th-Gen-Intel-Core.lan ([218.17.141.187]) by smtp.feishu.cn with ESMTPS; Mon, 16 Nov 2026 17:00:59 +0800
Date: Mon, 16 Nov 2026 17:00:44 +0800
Message-Id: <20261116090044.951354-1-sandie.cao@deepcomputing.io>
References: <20261116085725.951253-1-sandie.cao@deepcomputing.io>
To: "Yixun Lan" <dlan@kernel.org>, 
	"Troy Mitchell" <troy.mitchell@linux.spacemit.com>, 
	"Conor Dooley" <conor+dt@kernel.org>, "Rob Herring" <robh@kernel.org>, 
	"Krzysztof Kozlowski" <krzk+dt@kernel.org>, 
	"Paul Walmsley" <pjw@kernel.org>, "Palmer Dabbelt" <palmer@dabbelt.com>, 
	"Albert Ou" <aou@eecs.berkeley.edu>
X-Mailer: git-send-email 2.43.0
X-Lms-Return-Path: <lba+26afac64d+e6fd04+vger.kernel.org+sandie.cao@deepcomputing.io>
Cc: "Alexandre Ghiti" <alex@ghiti.fr>, <devicetree@vger.kernel.org>, 
	<linux-riscv@lists.infradead.org>, <spacemit@lists.linux.dev>, 
	<linux-kernel@vger.kernel.org>, 
	"Sandie Cao" <sandie.cao@deepcomputing.io>

The FML13V05 has two PCIe root complexes: pcie0 with four lanes on
combophy channels 0/1 for SSD and pcie4 with one lane on combophy
channel 5 for Wi-Fi. Add the 3.3V auxiliary regulator that powers
the PCIe slots and enable both controllers.

Signed-off-by: Sandie Cao <sandie.cao@deepcomputing.io>
---
 .../spacemit/k3-deepcomputing-fml13v05.dts    | 33 +++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/arch/riscv/boot/dts/spacemit/k3-deepcomputing-fml13v05.dts b/arch/riscv/boot/dts/spacemit/k3-deepcomputing-fml13v05.dts
index 2e1ad0929ee5..ea37981a86aa 100644
--- a/arch/riscv/boot/dts/spacemit/k3-deepcomputing-fml13v05.dts
+++ b/arch/riscv/boot/dts/spacemit/k3-deepcomputing-fml13v05.dts
@@ -23,6 +23,14 @@ memory@100000000 {
 		reg = <0x1 0x00000000 0x4 0x00000000>;
 	};
 
+	reg_aux_vcc3v3: regulator-aux-vcc3v3 {
+		compatible = "regulator-fixed";
+		regulator-name = "AUX_VCC3V3";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		regulator-always-on;
+	};
+
 	reg_aux_vcc5v: regulator-aux-vcc5v {
 		compatible = "regulator-fixed";
 		regulator-name = "AUX_VCC5V";
@@ -202,6 +210,31 @@ &combophy {
 	status = "okay";
 };
 
+&pcie0_rc {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pcie0_0_cfg>;
+	num-lanes = <4>;
+	status = "okay";
+
+	pcie@0 {
+		vpcie3v3-supply = <&reg_aux_vcc3v3>;
+		phys = <&combophy 0 PHY_TYPE_PCIE>,
+		       <&combophy 1 PHY_TYPE_PCIE>;
+	};
+};
+
+&pcie4_rc {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pcie4_0_cfg>;
+	num-lanes = <1>;
+	status = "okay";
+
+	pcie@0 {
+		vpcie3v3-supply = <&reg_aux_vcc3v3>;
+		phys = <&combophy 5 PHY_TYPE_PCIE>;
+	};
+};
+
 /*
  * Onboard SD card slot:
  * Please insert or remove the SD card while the device is powered off.
-- 
2.43.0
