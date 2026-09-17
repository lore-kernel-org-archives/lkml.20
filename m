Received: from sender6-op-o15.zoho.com (sender6-op-o15.zoho.com [165.173.180.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0084502787;
	Thu, 17 Sep 2026 16:31:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=165.173.180.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789662703; cv=pass; b=EnnC7ZThGQCy7J0gJVQSowSnhEND2ZRhcKfixIjo5udHBAghdNmTf1xvSglyeGu+in7BbqXg9SgpTroA0KWzdO0DrGzRMrRT417Iq5NMNvLY6mJ+3YvvZDfRn11S3G+40h0Y0ZnggZNgmUe/7J7fukliygzaFfuaGP+eCCZkRAc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789662703; c=relaxed/simple;
	bh=lv+0gzWeeU7rN8DL91wNG8xuNseGSCdetCC/tUM2Gp8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cQegY4gZK+hCMbWXkEznQoqNDlI3AC/99V5uRl1vKcm+Q2MyrJgdYaNfz22vSXkkT353oWeBfCfM6h/UE25qvRv0MBgR8xqh2CFiAJweYKP0U8M17+Ikb7ULFAgMcp8jmHOl65aLSWNJ0UIjZF+/sZIjWcQXAUkC1/Kwk5TmqV8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pigmoral.tech; spf=pass smtp.mailfrom=pigmoral.tech; dkim=pass (1024-bit key) header.d=pigmoral.tech header.i=junhui.liu@pigmoral.tech header.b=FwyKG36g; arc=pass smtp.client-ip=165.173.180.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pigmoral.tech
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pigmoral.tech
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=pigmoral.tech header.i=junhui.liu@pigmoral.tech header.b="FwyKG36g"
ARC-Seal: i=1; a=rsa-sha256; t=1789662681; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=S5UeVzkete6+mf/pyYkS6UUQN02sqvper2o6VsmEBJq2Z1bQEb/un8d8wgsEmY+aiym+aZAj4Xyc6DWibtYvPlaKrVqnZo2Ncs52rcl0FREnAW93B2FV1mhqzE3XCperdyzIzVNrzepGx9SRKv/f9EVXUqo//bgi/ytvTUU0XZI=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1789662681; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=qMmT5efrU6GEbjbyFNwSWTd358YOBsZsuMTs5gYFVmQ=; 
	b=TEJ5RVdqFL/g92cvS0HirTYRuwXHgTBzd85xp2aSdDTVDeUekoA9Ilx4mi7wasLrRchwtWJFbbcSwdTVqpuiPxhIe1sIzYbg13n0zGlz6A8IVaWleXKdIyknz7Lw4N5UwxQkCTHEEInED9q/35nb7Q2jqJaH1BouAf9etEuXEZY=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=pigmoral.tech;
	spf=pass  smtp.mailfrom=junhui.liu@pigmoral.tech;
	dmarc=pass header.from=<junhui.liu@pigmoral.tech>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1789662681;
	s=zmail; d=pigmoral.tech; i=junhui.liu@pigmoral.tech;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=qMmT5efrU6GEbjbyFNwSWTd358YOBsZsuMTs5gYFVmQ=;
	b=FwyKG36gf9ed0oStLwhWnLK6rCbzYXkdjnGU7m2k/KEosMbTK2ZNXME0VFh3onsK
	/j+JxYGFrVg6G4EuQePoxrN6QAlq9FFRcCUrVPm5egBWO6txfHKLPfqwuupHN+w9yMg
	2iMRVLN6IfRGw8oNa2Er/plroKf71qM4j6wcUVSg=
Received: by smtp.zohomail.com with SMTPS id 1789662680445265.30275018758016;
	Thu, 17 Sep 2026 09:31:20 -0700 (PDT)
From: Junhui Liu <junhui.liu@pigmoral.tech>
Date: Fri, 18 Sep 2026 00:29:38 +0800
Subject: [PATCH v3 6/6] riscv: dts: spacemit: k3: Replace incorrect CLINT
 node with ACLINT nodes
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260918-k3-aclint-v3-6-cf4fd4050e14@pigmoral.tech>
References: <20260918-k3-aclint-v3-0-cf4fd4050e14@pigmoral.tech>
In-Reply-To: <20260918-k3-aclint-v3-0-cf4fd4050e14@pigmoral.tech>
To: Daniel Lezcano <daniel.lezcano@kernel.org>, 
 Thomas Gleixner <tglx@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>, 
 Inochi Amaoto <inochiama@outlook.com>, Radu Rendec <radu@rendec.net>, 
 Paul Walmsley <pjw@kernel.org>, Samuel Holland <samuel.holland@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Anup Patel <anup@brainfault.org>, 
 Guodong Xu <docular.xu@gmail.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
 Conor Dooley <conor.dooley@microchip.com>, Bo Gan <ganboing@gmail.com>, 
 Junhui Liu <junhui.liu@pigmoral.tech>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3276;
 i=junhui.liu@pigmoral.tech; h=from:subject:message-id;
 bh=lv+0gzWeeU7rN8DL91wNG8xuNseGSCdetCC/tUM2Gp8=;
 b=owGbwMvMwCWWvDb1VEXc8j+Mp9WSGLLWiE5cXnzsyIcP1xNmh01hWnlD+uceLe3l/d9dLb7o5
 c2uMBS/01HKwiDGxSArpsjC5S/+z1qH59sRgdb7MHNYmUCGMHBxCsBEJBIYGTZsNf61k3PNEhs/
 q4XBunPc4x9X/2To5jf8kLKkYt3qdw8YGSawOF87wvphY+/lz96bNoRMfcLc/fHN1zt7Evx8rK8
 tPswIAA==
X-Developer-Key: i=junhui.liu@pigmoral.tech; a=openpgp;
 fpr=15B30CC69C4BF0CC3C08F85A2A90CDC122DF37BF
X-ZohoMailClient: External

The K3 implements separate ACLINT MSWI, MTIMER and SSWI devices. The
existing CLINT node at 0xe081c000 incorrectly describes the SSWI
register space in the non-secure window as a legacy CLINT.

The ACLINT register space is mapped at two base addresses: a secure
window at 0xf1810000 and a non-secure window at 0xe0810000. The
secure window exposes all three components, while the non-secure
window only exposes SSWI; the MSWI and MTIMER offsets are reserved
there. Moreover, depending on the eFuse configuration, the non-secure
window may be entirely inaccessible, whereas the secure window is
always available.

Replace the CLINT node with the three ACLINT devices, all using
secure-window addresses: MSWI and MTIMER for machine-level firmware
such as OpenSBI, and SSWI for supervisor software interrupts.

Fixes: 56f37e391a62 ("riscv: dts: spacemit: add initial support for K3 SoC")
Signed-off-by: Junhui Liu <junhui.liu@pigmoral.tech>
---
 arch/riscv/boot/dts/spacemit/k3.dtsi | 43 +++++++++++++++++++++++++-----------
 1 file changed, 30 insertions(+), 13 deletions(-)

diff --git a/arch/riscv/boot/dts/spacemit/k3.dtsi b/arch/riscv/boot/dts/spacemit/k3.dtsi
index c3f2dce0969c..74831974435e 100644
--- a/arch/riscv/boot/dts/spacemit/k3.dtsi
+++ b/arch/riscv/boot/dts/spacemit/k3.dtsi
@@ -1261,19 +1261,6 @@ saplic: interrupt-controller@e0804000 {
 			riscv,num-sources = <512>;
 		};
 
-		clint: timer@e081c000 {
-			compatible = "spacemit,k3-clint", "sifive,clint0";
-			reg = <0x0 0xe081c000 0x0 0x4000>;
-			interrupts-extended = <&cpu0_intc 3>, <&cpu0_intc 7>,
-					      <&cpu1_intc 3>, <&cpu1_intc 7>,
-					      <&cpu2_intc 3>, <&cpu2_intc 7>,
-					      <&cpu3_intc 3>, <&cpu3_intc 7>,
-					      <&cpu4_intc 3>, <&cpu4_intc 7>,
-					      <&cpu5_intc 3>, <&cpu5_intc 7>,
-					      <&cpu6_intc 3>, <&cpu6_intc 7>,
-					      <&cpu7_intc 3>, <&cpu7_intc 7>;
-		};
-
 		/* sec_i2c3: 0xf0614000, not available from Linux */
 
 		mimsic: interrupt-controller@f1000000 {
@@ -1305,5 +1292,35 @@ maplic: interrupt-controller@f1800000 {
 			riscv,num-sources = <512>;
 			status = "reserved";
 		};
+
+		aclint_mswi: interrupt-controller@f1810000 {
+			compatible = "spacemit,k3-aclint-mswi";
+			reg = <0x0 0xf1810000 0x0 0x4000>;
+			interrupts-extended = <&cpu0_intc 3>, <&cpu1_intc 3>,
+					      <&cpu2_intc 3>, <&cpu3_intc 3>,
+					      <&cpu4_intc 3>, <&cpu5_intc 3>,
+					      <&cpu6_intc 3>, <&cpu7_intc 3>;
+		};
+
+		aclint_mtimer: timer@f1814000 {
+			compatible = "spacemit,k3-aclint-mtimer";
+			reg = <0x0 0xf1814000 0x0 0x8000>;
+			reg-names = "mtimecmp";
+			interrupts-extended = <&cpu0_intc 7>, <&cpu1_intc 7>,
+					      <&cpu2_intc 7>, <&cpu3_intc 7>,
+					      <&cpu4_intc 7>, <&cpu5_intc 7>,
+					      <&cpu6_intc 7>, <&cpu7_intc 7>;
+		};
+
+		aclint_sswi: interrupt-controller@f181c000 {
+			compatible = "spacemit,k3-aclint-sswi";
+			reg = <0x0 0xf181c000 0x0 0x4000>;
+			#interrupt-cells = <0>;
+			interrupt-controller;
+			interrupts-extended = <&cpu0_intc 1>, <&cpu1_intc 1>,
+					      <&cpu2_intc 1>, <&cpu3_intc 1>,
+					      <&cpu4_intc 1>, <&cpu5_intc 1>,
+					      <&cpu6_intc 1>, <&cpu7_intc 1>;
+		};
 	};
 };

-- 
2.55.0

