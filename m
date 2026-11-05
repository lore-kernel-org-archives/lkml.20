Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=54.92.39.34
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793867049;
	b=x0qKZT1VJ/JdnHN52FLH6W6IiQSeNs5VOLJOrr3EJfXg211iCYaecLB/5ZLzj90IgBJ9
	 xT5OoWMobn0Ns39n7mSUsdIIHF1lUX2bvY5+OhxeMHIpGDl66CtDE5MjKPsy2Z08/1cc4
	 GYgCKKmVU4Oyr/fmfpsmH0bAED9nE7uekRoa6ZdhNTXD9fFjW86S4VNghWJZWdsIzgcrI
	 4WIrfbv/mq76hn6KgCmK3SlH5gsQuH3e+vophkb0qDaSxoDtxXTOVKzlLx0Q4FvO6M/xq
	 5ERcUd92uXxzLnEBviu38DOY1Ut+m+7SJgRh66MdKAzk5R1ESjnB6J420hySelp15bw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793867049;
	h=DMARC-Filter:DKIM-Signature:X-QQ-mid:X-QQ-Originating-IP:Received:
	 X-QQ-SSF:X-QQ-GoodBg:X-BIZMAIL-ID:EX-QQ-RecipientCnt:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-QQ-SENDSIZE:Feedback-ID:
	 X-QQ-XMAILINFO:X-QQ-XMRINFO:X-QQ-RECHKSPAM;
	bh=AP0zRsZ9xsH1/txX8W8F6xW2ty4IlAtLIMu5KyXAlxg=;
	b=TIsfsmAm3QVGInfsWaVy3PsQd3ZALVtAnwylOfOBbC3M85NCGfsx8fnytjjygwqL2Ev4
	 EjRVrpTOCX6doFGrczPLOtZINu7ivRTpieja/zUvq5O7BaDNYx37XDdN/e0WwX1K78aGA
	 1oMDcK/+CqVLjKH2T1gurbmdQ4E1t858Y3zVoijhgDHwQngUkMQf7wKxWEAWXZsf7dnDs
	 PdYQ+zRnIJcRb+7V5OAxvX4xlP9ldFCJpuE+50fyao1zb+1VHwspz2CYdjj3NnKvss6t2
	 VTDhdNZKxwkKQFSsoUercZWMUL4xQH0mE8Zn9eNzF6GwQ5NIMq4KZ+JAGVlpeoJO09g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux.spacemit.com;
	spf=none smtp.mailfrom=linux.spacemit.com;
	dkim=pass header.d=linux.spacemit.com header.i=@linux.spacemit.com header.a=rsa-sha256 header.s=mxsw2412 header.b=LYkf6rgj;
	arc=none smtp.remote-ip=54.92.39.34
Received: from smtpbgjp3.qq.com (smtpbgjp3.qq.com [54.92.39.34])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93BC6606A329;
	Thu,  5 Nov 2026 08:24:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 93BC6606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.a=rsa-sha256 header.s=mxsw2412 header.b=LYkf6rgj
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1793867045;
	bh=AP0zRsZ9xsH1/txX8W8F6xW2ty4IlAtLIMu5KyXAlxg=;
	h=From:Date:Subject:MIME-Version:Message-Id:To;
	b=LYkf6rgjNTretPRfnoi8/fR1RUHn/u9LFqXZQpztQ4zJ+QjVFI6ZIWs5Yck+yiu4U
	 73i70hevATpkluFfZLkg3QsiZw0MZ7GRVuZwUSOQ+qID2a76i9ZCprz0UhvscgpW9d
	 lLzjQk9UtveRYfmyn+qGeo8UArMEsGo5Us9QRs7Y=
X-QQ-mid: esmtpgz14t1793867044t097a89bc
X-QQ-Originating-IP: bfC0YRYM6S4tUriZljan2rXWt1UUFrNrbDpzva5BQSo=
Received: from = ( [58.254.68.27])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 05 Nov 2026 16:24:01 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 13664405851354263933
EX-QQ-RecipientCnt: 13
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Date: Thu, 05 Nov 2026 08:23:48 +0000
Subject: [PATCH 3/5] riscv: dts: spacemit: k3-com260: Add SPI NOR flash
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
Message-Id: <20261105-k3-com260-module-sd-nor-mac-v1-3-138b39d74602@linux.spacemit.com>
References: <20261105-k3-com260-module-sd-nor-mac-v1-0-138b39d74602@linux.spacemit.com>
In-Reply-To: <20261105-k3-com260-module-sd-nor-mac-v1-0-138b39d74602@linux.spacemit.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>, 
 Troy Mitchell <troy.mitchell@linux.spacemit.com>, 
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>
Cc: devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1757;
 i=troy.mitchell@linux.spacemit.com; h=from:subject:message-id;
 bh=BqkZaDMkvSW+3nj/8yfgq4f+zkX9e4PcXZEkcZcCU0M=;
 b=owGbwMvMwCU2g/N9w09jE33G02pJDFlvbEUm9z9SMv/FbyKj/Xzf16MNJ6R9XPhMmr63+VfP5
 fSoXMzaUcrCIMbFICumyNL9gGdbgU+UbYFAoS/MHFYmkCEMXJwCMBHLFkaGPcwxq+yWVZQsDPH2
 ZhTY+1O784t52t7WqIbUD/HL99tKMjIsTJeJWcTjKSU3zV0869bUbTyP2V7HTthjfSHCyHvhLSF
 OAA==
X-Developer-Key: i=troy.mitchell@linux.spacemit.com; a=openpgp;
 fpr=3FE5535CF1B0E658E57DB59BAE1C2FBEA7DB42E1
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpgz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: OMj855exJEG1DY/tb0ug0EdOvINO8CRgjOyTj2xv3zryrdiUnerpY9f5
	2dDgivBFdmR2Vp7bKc8+IubM/R943x+8I19q8vW3PY8jtqIevos/oN/dAMb9IqmEkrtsTM9
	yqL7qe4CRhW1ZXXIV2+eUNBIhRVDGo0kkJtP09XXmsUMaxSr9lk5Lt+FgHh1/6kOvidMbt3
	5b7/HKpkuax8ADlu4C4oeHNR2J/qiOfXhvFQ/9i8dCmE+C62id2qZWykfVEbOhVcO5iQ2s7
	1UDHm9XIBz0n7lpHqlvzrQpPp+dN+0P5l4xpvldOITjtUw/SS1h7d+pWfXOJu1nwzZDMOLe
	qkGmdzp4CjEGW9Mh55kA8YvBVl+h1t0WfGi8BUjWPHawmd0wd7dSCOC2mSYjacAdp24L/Iv
	h4/wzmNWA2idhnMHaoNUbi2XnaVLDRxbocQVMZjq5YDiDWeNyDwBSbSLyAQdPC7hHlNirmg
	kbEjRhFWbwGm7q+nSFwpl1J5M/RI68nVTQrZfOfKNAPOPOXJCluz9YJK9FgzMAme3qZ1TcF
	be0iCn2xAeAx8XnuHHXZhWNBJ77mzYHRFHthP5L7v5y+7mMJKTXbv8hIyG6vSLT2o3SUZGq
	t1mw7ow5wd/9UTxpMoEl3kYUU+qdToOzRiOc25eXrT93xTBdmq/BweEEsr4kF/gcGSNw2to
	PsVgcPdUssrsGeay5Ou0KANGFSp4zcqP78/caXb+7fwjU+nC02JkGv/PQMCiCW8W215coiI
	4bAqrRPXi+EOJ/y9Iy81PSwCIWxK5V2NS4FmAL4cpA+W9qjGL5VRafRrnRAABGW6CWj1j+8
	q2JRwFcYSRu+BP1Q2tWpPXyoC2zXjByeG7EcxQBmdKMKCskGHHg5E3xkUuiaiwcHUzxGpS6
	rjaRJu18ZrJhZM2w4oRxoPL3Dd2eJu6ERp+eI/S1gF12Ms+HErIJFahNEXxdTDWzBzCfOed
	FEzi9MusgTw6VqlPwZjLRuWijmLCg19seXQV7y/xAFMMutQqMXTElIDLcoW6W+fAtH/NACa
	uNr83muozhxcYEwLF8LmXqw7q3D4dQucKU0IYKpGREHDM+wtgMMZddivFRXTqioMHbSk8gG
	zShqwNhsqIRZ/PVv+Jp1/1cxKvbuesfoFjiz2ev9U1UZOVTD3PQDrHWYlsXUMbIh11OHyLN
	Fx9xOdPZHEdg+ZG0JBDJEnt9iw==
X-QQ-XMRINFO: NS+P29fieYNwqS3WCnRCOn9D1NpZuCnCRA==
X-QQ-RECHKSPAM: 0

The K3 CoM260 module carries the SPI NOR flash that holds the boot
firmware. Enable the QSPI controller with its 1.8 V pin configuration
and describe the flash together with the partition layout used by the
boot firmware, so that every carrier using the module gets access to
it.

Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
---
 arch/riscv/boot/dts/spacemit/k3-com260.dtsi | 55 +++++++++++++++++++++++++++++
 1 file changed, 55 insertions(+)

diff --git a/arch/riscv/boot/dts/spacemit/k3-com260.dtsi b/arch/riscv/boot/dts/spacemit/k3-com260.dtsi
index f2df797a2c80..f94607cb2eeb 100644
--- a/arch/riscv/boot/dts/spacemit/k3-com260.dtsi
+++ b/arch/riscv/boot/dts/spacemit/k3-com260.dtsi
@@ -233,6 +233,61 @@ phy1: ethernet-phy@1 {
 	};
 };
 
+&qspi_cfg {
+	qspi-pins {
+		power-source = <1800>;
+	};
+
+	qspi-cs0-pins {
+		power-source = <1800>;
+	};
+};
+
+&qspi {
+	pinctrl-names = "default";
+	pinctrl-0 = <&qspi_cfg>;
+	status = "okay";
+
+	flash@0 {
+		compatible = "jedec,spi-nor";
+		reg = <0>;
+		spi-max-frequency = <26500000>;
+		spi-rx-bus-width = <4>;
+		spi-tx-bus-width = <4>;
+		m25p,fast-read;
+
+		partitions {
+			compatible = "fixed-partitions";
+			#address-cells = <1>;
+			#size-cells = <1>;
+
+			bootinfo@0 {
+				reg = <0x0 0x20000>;
+			};
+
+			fsbl@20000 {
+				reg = <0x20000 0x80000>;
+			};
+
+			env@a0000 {
+				reg = <0xa0000 0x10000>;
+			};
+
+			esos@b0000 {
+				reg = <0xb0000 0x100000>;
+			};
+
+			opensbi@1b0000 {
+				reg = <0x1b0000 0x60000>;
+			};
+
+			uboot@210000 {
+				reg = <0x210000 0x5f0000>;
+			};
+		};
+	};
+};
+
 &sdhci0 {
 	pinctrl-names = "default","uhs";
 	pinctrl-0 = <&mmc1_cfg>;

-- 
2.56.0

