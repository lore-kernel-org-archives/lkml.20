Received: from smtpbg151.qq.com (smtpbg151.qq.com [18.169.211.239])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B28163A5E91;
	Tue, 15 Sep 2026 03:24:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=18.169.211.239
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789442701; cv=none; b=olPeTU36rCYWgFd76fmQcm8mlfZBnmAAui3U7s+1VTwwd4OvQCde5XfDz7m+m/VUJ4+fHEZogfERspUMomXr9UTPqHstoh442hGBlGGQYiS451WX4lZNK7UI/pHX8Xft8e5PUQnVN8Mymf+e75O0vjjZTxS6iNHIXfGrX1+cVS0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789442701; c=relaxed/simple;
	bh=KcpwYBN0v656aVhl3ztGJR39bksr+UoOydPaQj0fhEc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=oE3aJPsirNB8qjeZS/iUivRaPrDlOcSN5n6Rjj7E/+aoMGoRjm+t7QqhofkSoSfL79CGKA4ieEREpZ1YfK34bKVQa/4kcpDz1HwhP1mEpKZnO080wA9GaG+3JeCU1h80J2pXSxZjq4mRAoXssQz3MaBcrVWHxhRl5WZYW2/w4qY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com; spf=none smtp.mailfrom=linux.spacemit.com; dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b=Iud2nV9y; arc=none smtp.client-ip=18.169.211.239
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b="Iud2nV9y"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1789442610;
	bh=+KM03T8OGIZhi2BqLXpm7IJJnWeUR9grGqkJDXgV+ZU=;
	h=From:Date:Subject:MIME-Version:Message-Id:To;
	b=Iud2nV9yIjWXsC9eO9TTAm4Ie0DzM7Uwn84UVbNAoFhCzQj84mNxam57sUhn4ASrk
	 lEeI+9ZrY9wLO/HwlmSidVCDbVe93PiXq8p+o7IDBDg9r7bvzafLP/n/utp5aJhc4d
	 hyh2o3xMBIQljYtPz1RLKgyivi2exMLiaz4OD/II=
X-QQ-mid: esmtpgz13t1789442604ta8410a15
X-QQ-Originating-IP: YDAfJmTNnMvZ98ZdmVApthJYDm0OKpmCC9H6p5FzFzg=
Received: from = ( [120.237.158.181])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Tue, 15 Sep 2026 11:23:20 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 9021882996448671646
EX-QQ-RecipientCnt: 20
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Date: Tue, 15 Sep 2026 11:23:16 +0800
Subject: [PATCH v3] riscv: dts: spacemit: k3: add i2s0-i2s5 nodes
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260915-kx-i2s-dts-v3-1-cf0b90882a97@linux.spacemit.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/22Oyw6CMBBFf4V07RA6CFhX/odxQUvRUXnYFoIh/
 LsFTNTE5ZncOfeOzGpD2rJ9MDKje7LU1B7iTcDUJa/PGqjwzDDCNEp5ArcBCC0UzgLHOEu3Ski
 UyPxDa3RJwyI7nla2nbxq5WbDO2H0o/Mt7hO7kHWNeS4Tej5f17YM+XdbzyGCAlHJVJV5LpPDn
 epuCG2bK12RC1VTsdnX48chePTjQOAgeJn44WonRPHXMU3TCz3dSmUYAQAA
X-Change-ID: 20260615-kx-i2s-dts-123764c9b2b2
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Yixun Lan <dlan@kernel.org>, Jinmei Wei <weijinmei@linux.spacemit.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-sound@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, 
 Troy Mitchell <troy.mitchell@linux.spacemit.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=7360;
 i=troy.mitchell@linux.spacemit.com; h=from:subject:message-id;
 bh=KcpwYBN0v656aVhl3ztGJR39bksr+UoOydPaQj0fhEc=;
 b=owGbwMvMwCU2g/N9w09jE33G02pJDFkrdqkdDy0OUw1rl/P06Hur9bs460/uf/d3d1ebKmtP/
 67zd8POjlIWBjEuBlkxRZbuBzzbCnyibAsECn1h5rAygQxh4OIUgImcqWb4K2Gvtpbr1NzWNLU9
 C45uDZpW9e/ZlY8sq7drb2eZsnz9hCcM/2wmlPRF3VPfe2e2efBUsWmtV7JmfLF6aNbjvPHk3Ds
 Cl/kA
X-Developer-Key: i=troy.mitchell@linux.spacemit.com; a=openpgp;
 fpr=3FE5535CF1B0E658E57DB59BAE1C2FBEA7DB42E1
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpgz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: MKlHOMKcIlKnQ82dFtogqWWkJgxNOIWo7YV/P2a3/PQVfNwuFDBExamU
	+urEiiY2XiZ0XCeIuni37PdTQC40v833t1E8lGsEK1HOS9zCXh8gdyL02EY5C15iQn48wCv
	daJ6D7yN8Qf4+PFcgwh07aiWjz5hqOXDTAxhOnWanN5LbixUZaIGPgVH/V8YsjJ5Kli80G8
	fYTMkxDiQdQhMOSf/o3UM35jqvCU59XMQtlRX5yhm9aGgxsYqhJKfrQHHFl1ChODr0qmi2q
	WRUYbhHh+LXLe1WJDjRSQIRbo1Su5e1fcWjvOkMOE/AshW5DMXZ22s3SSNUJ7MJInfWXUDW
	qVII48tZQWJNoPy1JOBaCRyia/HsCxlLAxLeVXkpxvlPRcfZRqxwNwSEdlNF0oRo6GJELzQ
	WUuiA1CApXVPkQt4FqMNroiHTwAEaR27JkviAzm+9/oQSnNQfLjUfE4aXqYZcvt11vPap4U
	QdbKDVIQNZhvBn6Tubo+VCSDwxnpla6yMLsBn25jkxw4e1RJjj0XY+l+QmAc11u6qRaDrHw
	H4LgvsxD3wzwQoqKHo2rN7v+Ne4bxWVn4YopohrNwWrXgwLKdMERuVi3vvKu+aFfd4w+4dT
	FWC8XETSj3gawDVtVmELNVJDQHlKwjc1Pkrex0E/glkKZwT6HplNB3+VFFr40c6MQs9Rjgi
	c0/GznTBl5pEAEgksuB4kDifO5F5qYiQbEIT5FNCtD2DTmaxwbdipDzfAAFcNPknNJx9c4G
	75tZIKVeHuwUjG6dJVL4z7R79GwpMin1oPlvdWi2sd9+QImytqZjsx5ZhY4QZ5cj8zVxfFN
	/KNE0XQyEEtBuAw0fqjl3/hBL8lmOVenc1sYXg7a36w+4hp6xL6farrwjHqZfbBOf3gbPc9
	OkQps5ua2bL74+nLI1ULDnRHW/ayhI/B5HhO0VgDd2U8byOUO1E/MjSsc6EDc78MF4W9WZj
	pv9Gt8pMadaDqDMU5zCsTAJCa37z4NrbkOBHyY++Vaqhm7M2DHq7CxSSG/xOGmBm+MpDXU6
	spOwyU2lItlCq/pvJx3tOpncU5H6JXWfHiwO33XZwqqeHiLijBIvlSO9AEf5E3g3HlCjPtr
	TDd60ZEtho4QKlrtnKyAIn+vei73asxom4OLrHGJpvDR5hfxb3nVG9sADGJv/l5i9KTACDR
	Y/KdwYZ7JJFEv0ulEKinVPLZ6j3b8TGVUhm+baLa2uEsKgA=
X-QQ-XMRINFO: Mp0Kj//9VHAxzExpfF+O8yhSrljjwrznVg==
X-QQ-RECHKSPAM: 0

Add the six SSPA-based I2S controller nodes for the K3 SoC.

i2s0 and i2s2-i2s5 each have a dedicated per-controller sysclk
divider, so they use the published 7-clock layout (sysclk, bclk, bus,
func, sysclk_div, c_sysclk, c_bclk).

i2s1 uses 6 clocks (sysclk, bclk, bus, func, c_sysclk, c_bclk) because
its sysclk is driven directly by a DDN (ISCCR0) and has no separate
divider stage.

Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Reviewed-by: Yixun Lan <dlan@kernel.org>
---
The DTS patch was applied as cd01c677869a and reverted by
1f5d8228ca2c because the SoC DT branch lacked CLK_MPMU_I2S_SYSCLK.
The clock binding, clock driver and ASoC dependencies are now all
included in v7.3-rc1, so this submission has no cross-tree dependencies.

Arnd requested resubmission after -rc1:
https://lore.kernel.org/all/cec87950-f0e1-49f8-9a2c-f8b87b460da2@app.fastmail.com/
---
Changes in v3:
- Replace numeric DMA request IDs for I2S0-I2S5 with the existing
  K3_PDMA_SSPA*_TX/RX macros from k3-pdma.h, as suggested by Sashiko.
  The DMA request IDs and TX/RX ordering are unchanged.
- Link to v2: https://patch.msgid.link/20260910-kx-i2s-dts-v2-1-91f5376c899d@linux.spacemit.com

Changes in v2:
- Rebase onto v7.3-rc1, which includes all prerequisite clock changes.
- Drop the already merged ASoC clock-name fix (4c69d04958ec) and
  six-clock binding update (ec926b3bcb49); retain only the DTS patch.
- Resolve the insertion conflict with the new SPI nodes by placing
  I2S0-I2S3 before SPI0/SPI1 and I2S4-I2S5 after them, in address order.
  The I2S node contents are unchanged from v1.
- Carry Yixun Lan's Reviewed-by from v1.
- Link to v1: https://lore.kernel.org/all/20260721-kx-i2s-dts-v1-0-d22cb6cfaab5@linux.spacemit.com/

To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
To: Yixun Lan <dlan@kernel.org>
To: Paul Walmsley <pjw@kernel.org>
To: Palmer Dabbelt <palmer@dabbelt.com>
To: Albert Ou <aou@eecs.berkeley.edu>
To: Alexandre Ghiti <alex@ghiti.fr>
Cc: devicetree@vger.kernel.org
Cc: linux-riscv@lists.infradead.org
Cc: spacemit@lists.linux.dev
Cc: linux-kernel@vger.kernel.org
---
 arch/riscv/boot/dts/spacemit/k3.dtsi | 119 +++++++++++++++++++++++++++++++++++
 1 file changed, 119 insertions(+)

diff --git a/arch/riscv/boot/dts/spacemit/k3.dtsi b/arch/riscv/boot/dts/spacemit/k3.dtsi
index c3f2dce0969c0..75782caeaaa85 100644
--- a/arch/riscv/boot/dts/spacemit/k3.dtsi
+++ b/arch/riscv/boot/dts/spacemit/k3.dtsi
@@ -1140,6 +1140,85 @@ uart10: serial@d401f000 {
 			status = "disabled";
 		};
 
+		i2s0: i2s@d4026000 {
+			compatible = "spacemit,k3-i2s";
+			reg = <0x0 0xd4026000 0x0 0x30>;
+			clocks = <&syscon_mpmu CLK_MPMU_I2S0_SYSCLK>,
+				 <&syscon_apbc CLK_APBC_I2S0_BCLK>,
+				 <&syscon_apbc CLK_APBC_I2S0_BUS>,
+				 <&syscon_apbc CLK_APBC_I2S0>,
+				 <&syscon_mpmu CLK_MPMU_I2S0_SYSCLK_DIV>,
+				 <&syscon_mpmu CLK_MPMU_I2S_SYSCLK>,
+				 <&syscon_mpmu CLK_MPMU_I2S_BCLK>;
+			clock-names = "sysclk", "bclk", "bus", "func",
+				      "sysclk_div", "c_sysclk", "c_bclk";
+			dmas = <&pdma K3_PDMA_SSPA0_TX>, <&pdma K3_PDMA_SSPA0_RX>;
+			dma-names = "tx", "rx";
+			resets = <&syscon_apbc RESET_APBC_I2S0>;
+			#sound-dai-cells = <0>;
+
+			status = "disabled";
+		};
+
+		i2s1: i2s@d4026800 {
+			compatible = "spacemit,k3-i2s";
+			reg = <0x0 0xd4026800 0x0 0x30>;
+			clocks = <&syscon_mpmu CLK_MPMU_I2S1_SYSCLK>,
+				 <&syscon_apbc CLK_APBC_I2S1_BCLK>,
+				 <&syscon_apbc CLK_APBC_I2S1_BUS>,
+				 <&syscon_apbc CLK_APBC_I2S1>,
+				 <&syscon_mpmu CLK_MPMU_I2S_SYSCLK>,
+				 <&syscon_mpmu CLK_MPMU_I2S_BCLK>;
+			clock-names = "sysclk", "bclk", "bus", "func",
+				      "c_sysclk", "c_bclk";
+			dmas = <&pdma K3_PDMA_SSPA1_TX>, <&pdma K3_PDMA_SSPA1_RX>;
+			dma-names = "tx", "rx";
+			resets = <&syscon_apbc RESET_APBC_I2S1>;
+			#sound-dai-cells = <0>;
+
+			status = "disabled";
+		};
+
+		i2s2: i2s@d4027000 {
+			compatible = "spacemit,k3-i2s";
+			reg = <0x0 0xd4027000 0x0 0x30>;
+			clocks = <&syscon_mpmu CLK_MPMU_I2S2_SYSCLK>,
+				 <&syscon_apbc CLK_APBC_I2S2_BCLK>,
+				 <&syscon_apbc CLK_APBC_I2S2_BUS>,
+				 <&syscon_apbc CLK_APBC_I2S2>,
+				 <&syscon_mpmu CLK_MPMU_I2S2_SYSCLK_DIV>,
+				 <&syscon_mpmu CLK_MPMU_I2S_SYSCLK>,
+				 <&syscon_mpmu CLK_MPMU_I2S_BCLK>;
+			clock-names = "sysclk", "bclk", "bus", "func",
+				      "sysclk_div", "c_sysclk", "c_bclk";
+			dmas = <&pdma K3_PDMA_SSPA2_TX>, <&pdma K3_PDMA_SSPA2_RX>;
+			dma-names = "tx", "rx";
+			resets = <&syscon_apbc RESET_APBC_I2S2>;
+			#sound-dai-cells = <0>;
+
+			status = "disabled";
+		};
+
+		i2s3: i2s@d4027800 {
+			compatible = "spacemit,k3-i2s";
+			reg = <0x0 0xd4027800 0x0 0x30>;
+			clocks = <&syscon_mpmu CLK_MPMU_I2S3_SYSCLK>,
+				 <&syscon_apbc CLK_APBC_I2S3_BCLK>,
+				 <&syscon_apbc CLK_APBC_I2S3_BUS>,
+				 <&syscon_apbc CLK_APBC_I2S3>,
+				 <&syscon_mpmu CLK_MPMU_I2S3_SYSCLK_DIV>,
+				 <&syscon_mpmu CLK_MPMU_I2S_SYSCLK>,
+				 <&syscon_mpmu CLK_MPMU_I2S_BCLK>;
+			clock-names = "sysclk", "bclk", "bus", "func",
+				      "sysclk_div", "c_sysclk", "c_bclk";
+			dmas = <&pdma K3_PDMA_SSPA3_TX>, <&pdma K3_PDMA_SSPA3_RX>;
+			dma-names = "tx", "rx";
+			resets = <&syscon_apbc RESET_APBC_I2S3>;
+			#sound-dai-cells = <0>;
+
+			status = "disabled";
+		};
+
 		spi0: spi@d4040000 {
 			compatible = "spacemit,k3-spi", "spacemit,k1-spi";
 			reg = <0x0 0xd4040000 0x0 0x30>;
@@ -1170,6 +1249,46 @@ spi1: spi@d4040800 {
 			status = "disabled";
 		};
 
+		i2s4: i2s@d4041000 {
+			compatible = "spacemit,k3-i2s";
+			reg = <0x0 0xd4041000 0x0 0x30>;
+			clocks = <&syscon_mpmu CLK_MPMU_I2S4_SYSCLK>,
+				 <&syscon_apbc CLK_APBC_I2S4_BCLK>,
+				 <&syscon_apbc CLK_APBC_I2S4_BUS>,
+				 <&syscon_apbc CLK_APBC_I2S4>,
+				 <&syscon_mpmu CLK_MPMU_I2S4_SYSCLK_DIV>,
+				 <&syscon_mpmu CLK_MPMU_I2S_SYSCLK>,
+				 <&syscon_mpmu CLK_MPMU_I2S_BCLK>;
+			clock-names = "sysclk", "bclk", "bus", "func",
+				      "sysclk_div", "c_sysclk", "c_bclk";
+			dmas = <&pdma K3_PDMA_SSPA4_TX>, <&pdma K3_PDMA_SSPA4_RX>;
+			dma-names = "tx", "rx";
+			resets = <&syscon_apbc RESET_APBC_I2S4>;
+			#sound-dai-cells = <0>;
+
+			status = "disabled";
+		};
+
+		i2s5: i2s@d4041800 {
+			compatible = "spacemit,k3-i2s";
+			reg = <0x0 0xd4041800 0x0 0x30>;
+			clocks = <&syscon_mpmu CLK_MPMU_I2S5_SYSCLK>,
+				 <&syscon_apbc CLK_APBC_I2S5_BCLK>,
+				 <&syscon_apbc CLK_APBC_I2S5_BUS>,
+				 <&syscon_apbc CLK_APBC_I2S5>,
+				 <&syscon_mpmu CLK_MPMU_I2S5_SYSCLK_DIV>,
+				 <&syscon_mpmu CLK_MPMU_I2S_SYSCLK>,
+				 <&syscon_mpmu CLK_MPMU_I2S_BCLK>;
+			clock-names = "sysclk", "bclk", "bus", "func",
+				      "sysclk_div", "c_sysclk", "c_bclk";
+			dmas = <&pdma K3_PDMA_SSPA5_TX>, <&pdma K3_PDMA_SSPA5_RX>;
+			dma-names = "tx", "rx";
+			resets = <&syscon_apbc RESET_APBC_I2S5>;
+			#sound-dai-cells = <0>;
+
+			status = "disabled";
+		};
+
 		syscon_mpmu: system-controller@d4050000 {
 			compatible = "spacemit,k3-syscon-mpmu";
 			reg = <0x0 0xd4050000 0x0 0x10000>;

---
base-commit: cee9395acd8043be0644b25c34bfa86623f2b935
change-id: 20260615-kx-i2s-dts-123764c9b2b2

Best regards,
--  
Troy Mitchell <troy.mitchell@linux.spacemit.com>

