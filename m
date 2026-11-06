Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.39.247.168
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793999079;
	b=VmqDDTFXRaJ74cL54SKzLEmONoMhmGSKD/bCqWMH1x64LqSYFELUPO5QtCJ/dfdOnx79
	 6/ucB51uBGBlLjcJtbeoi4fofm425SqvgwkSeDx3Q+neb8818S7FXaClD/cxUqwe3lEvK
	 o3gGxmg2lABv6fnbvrHxd2miforXc+xKwB/iD92jiEcLUGTDsFRS7dwHgrVLj1mmqMT83
	 I/ga3kqFVZ+wEtUjzn3/pfUqd+NIzcdGNjAcmtztgYwULib8zj03Pa8R0s4OKup7HAOXu
	 eoQC76jtoDl9lOPDoBKJztwQRyo8FUp4kSXGEXiU+lRzgpw4RdN1KlcvyLB7FpIkOwQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793999079;
	h=DMARC-Filter:From:DKIM-Signature:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc;
	bh=hX3xdruN8caOfgHo4tlWQ2jg/6Z3Qzk8H8WdcuYaXgs=;
	b=2Mh6CJhX8rHjMtPmIZ0WblsesybDaO9JhDheZDbgVyzzaJA7hscdLNrq/AxGO18ipizV
	 IHxg8LzAuHmV1js/BXT77l41BLLQYmQF+KHozG2+LthU+erGdXXm4n/dcynbo8bE7hqRf
	 2buiHihEVvz1j1ow5otCWO8sttgy3wC77CcVbmAzv5iEXbNtDVT1DKpQOBenORSjUFHPv
	 goPSaRN0sjfdmshoJQ5BDXCxb8GPTSbtqwwTCwqsX5AyXiFJdqHKVy+m+yVxlqvyAbydP
	 q2aaHnqv6CyYNbKZXdoynzgX8EpWWjMCvg840328GBotnr7QdS3IlxTZ7FvBkiNK12w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cyberchaos.dev;
	spf=pass smtp.mailfrom=cyberchaos.dev;
	dkim=pass header.d=cyberchaos.dev header.i=@cyberchaos.dev header.a=rsa-sha256 header.s=mail header.b=4gBDhyjH;
	arc=none smtp.remote-ip=195.39.247.168
Received: from mail.cyberchaos.dev (mail.cyberchaos.dev [195.39.247.168])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3728D606EEBD;
	Fri,  6 Nov 2026 21:04:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3728D606EEBD
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cyberchaos.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cyberchaos.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=cyberchaos.dev header.i=@cyberchaos.dev header.a=rsa-sha256 header.s=mail header.b=4gBDhyjH
From: Yureka Lilian <yureka@cyberchaos.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cyberchaos.dev;
	s=mail; t=1793999077;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hX3xdruN8caOfgHo4tlWQ2jg/6Z3Qzk8H8WdcuYaXgs=;
	b=4gBDhyjH4oTieu2J+BiE7I2yJKH1zSQYZeMWBizUR61G0+rw0k8qTNprGOz8KUqGRlLfmS
	dejimdIOiX1wKbh2+U7yDbrXExJpPjOTFihvMUoFXedNluiP4rv7n3EVqvULHSu/02psc8
	G9kXi6aGmfbmExpc1uXMHMbjursBxyM=
Date: Fri, 06 Nov 2026 22:04:24 +0100
Subject: [PATCH 15/15] arm64: dts: apple: t8142: Add NVMe nodes
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
Message-Id: <20261106-apple-dts-m4-m5-nvme-v1-15-22f4827b4ece@cyberchaos.dev>
References: <20261106-apple-dts-m4-m5-nvme-v1-0-22f4827b4ece@cyberchaos.dev>
In-Reply-To: <20261106-apple-dts-m4-m5-nvme-v1-0-22f4827b4ece@cyberchaos.dev>
To: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
 Neal Gompa <neal@gompa.dev>, Jassi Brar <jassisinghbrar@gmail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Hector Martin <marcan@marcan.st>, 
 "Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>, 
 Robin Murphy <robin.murphy@arm.com>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 iommu@lists.linux.dev, Yureka Lilian <yureka@cyberchaos.dev>

Add the device nodes for the internal NVMe SSD on the Apple M5 (t8142)
SoC. Keep ps_apcie_phy_sw powered on and invert the ps_apcie_sys_st /
ps_apcie_phy_sw dependency to match t8122.

Signed-off-by: Yureka Lilian <yureka@cyberchaos.dev>
---
 arch/arm64/boot/dts/apple/t8142-pmgr.dtsi |  5 ++--
 arch/arm64/boot/dts/apple/t8142.dtsi      | 42 +++++++++++++++++++++++++++++++
 2 files changed, 45 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/apple/t8142-pmgr.dtsi b/arch/arm64/boot/dts/apple/t8142-pmgr.dtsi
index b89c7720cf23..3c4842ab55b2 100644
--- a/arch/arm64/boot/dts/apple/t8142-pmgr.dtsi
+++ b/arch/arm64/boot/dts/apple/t8142-pmgr.dtsi
@@ -801,7 +801,7 @@ ps_apcie_sys_st: power-controller@520 {
 		reg = <0x520 4>;
 		label = "apcie_sys_st";
 		#power-domain-cells = <0>;
-		power-domains = <&ps_ans>, <&ps_apcie_st>;
+		power-domains = <&ps_ans>, <&ps_apcie_st>, <&ps_st0_aus5>;
 		#reset-cells = <0>;
 	};
 
@@ -810,8 +810,9 @@ ps_apcie_phy_sw: power-controller@560 {
 		reg = <0x560 4>;
 		label = "apcie_phy_sw";
 		#power-domain-cells = <0>;
-		power-domains = <&ps_apcie_sys_st>, <&ps_apcie_sys_gp>;
+		power-domains = <&ps_apcie_sys_gp>;
 		#reset-cells = <0>;
+		apple,always-on;
 	};
 
 	ps_sys_st_ocla: power-controller@568 {
diff --git a/arch/arm64/boot/dts/apple/t8142.dtsi b/arch/arm64/boot/dts/apple/t8142.dtsi
index 3663677f7b14..c1a61e56e2b5 100644
--- a/arch/arm64/boot/dts/apple/t8142.dtsi
+++ b/arch/arm64/boot/dts/apple/t8142.dtsi
@@ -489,6 +489,48 @@ serial0: serial@3a5200000 {
 			status = "disabled";
 		};
 
+		ans_mbox: mbox@481608000 {
+			compatible = "apple,t8142-asc-mailbox",
+				     "apple,asc-mailbox-v4";
+			reg = <0x4 0x81608000 0x0 0x4000>;
+
+			interrupt-parent = <&aic>;
+			interrupts = <AIC_IRQ 1143 IRQ_TYPE_LEVEL_HIGH>,
+				     <AIC_IRQ 1144 IRQ_TYPE_LEVEL_HIGH>,
+				     <AIC_IRQ 1145 IRQ_TYPE_LEVEL_HIGH>,
+				     <AIC_IRQ 1146 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "send-empty", "send-not-empty",
+					  "recv-empty", "recv-not-empty";
+
+			#mbox-cells = <0>;
+			power-domains = <&ps_ans>;
+		};
+
+		sart: sart@485c50000 {
+			compatible = "apple,t8142-sart", "apple,t6000-sart";
+			reg = <0x4 0x85c50000 0x0 0x10000>;
+			power-domains = <&ps_ans>;
+		};
+
+		nvme: nvme@4c5cc0000 {
+			compatible = "apple,t8142-nvme-ans2",
+				     "apple,t8132-nvme-ans2";
+			reg = <0x4 0xc5cc0000 0x0 0x60000>,
+			      <0x4 0x81600000 0x0 0x4000>;
+			reg-names = "nvme", "ans";
+
+			interrupt-parent = <&aic>;
+			interrupts = <AIC_IRQ 1155 IRQ_TYPE_LEVEL_HIGH>;
+
+			mboxes = <&ans_mbox>;
+
+			power-domains = <&ps_ans>, <&ps_apcie_sys_st>;
+			power-domain-names = "ans", "apcie0";
+			resets = <&ps_ans>;
+
+			apple,sart = <&sart>;
+		};
+
 		pmgr_gfx: power-management@580e80000 {
 			compatible = "apple,t8142-pmgr", "apple,t8103-pmgr",
 			             "syscon", "simple-mfd";

-- 
2.56.0

