Received: from smtpbgeu2.qq.com (smtpbgeu2.qq.com [18.194.254.142])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D4D149363C;
	Fri,  9 Oct 2026 07:31:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=18.194.254.142
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791531120; cv=none; b=khWbAd/kHNtUUSLo/RwQl+D4NUCuoZYoEOvqIWor9O0m9Q+Wcp8UF95QJV6WmxlDGgFK+0EssZngH6RxbsheWyldGV2ppdqhoncHzEFGJFcxGeu8t968Y5gUPFe3ScSIi9BF8G5zmGLQVi85M0JYseLFW4UUzfmGTKLzFnwRVdA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791531120; c=relaxed/simple;
	bh=txZmXDmZ4fEAn4wkzFilsJj8fTRbaRKTLQltkbAyT3c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fa68i0siA1sq6DJ3kKtxTCjd220p7f3Myo62d66Eteaq+lQqSgurIUyA9tGB5iAQ32bL6n9vdqO7rT0D0CZsaGQQFx/s0U2kbogMy4Jc7ksUz9URCVxOXpOWkd7LEpG9Rpt1HkbQwKT1DSOgjUJNLKD4gKngCYAg6pXCQgSsg5A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com; spf=none smtp.mailfrom=linux.spacemit.com; dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b=hWQuC3Ri; arc=none smtp.client-ip=18.194.254.142
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b="hWQuC3Ri"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1791531050;
	bh=ZMyO9DMu1Nm9dSmgwxt0ejtLMywosE13lfl6hV6tPig=;
	h=From:Date:Subject:MIME-Version:Message-Id:To;
	b=hWQuC3RiM1X0X65axmDdrCgKA1JWBmhLTZSKJjZcI7BpYCCCVs8xJoQgzczzMuoUc
	 q0yBZqgSDcAPCLoqSy//Y0EsidJRz9j9rPBhqg2AtMmqT6adkDFoPWK7TAAf1EedGy
	 0Yj45A+roBPw+Cb2awQ975RwlrwDGoLQKL7H6N6Y=
X-QQ-mid: esmtpgz13t1791531044t571e5ad4
X-QQ-Originating-IP: ARQRvAw81GnPIU+KOVF48BwyPaC7ZDKv6x30ADrfyag=
Received: from LT-PANJUNZHONG.dc.com ( [120.237.158.181])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Fri, 09 Oct 2026 15:30:42 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 12809261890574411570
EX-QQ-RecipientCnt: 20
From: Junzhong Pan <panjunzhong@linux.spacemit.com>
Date: Fri, 09 Oct 2026 15:30:28 +0800
Subject: [PATCH v4 5/8] riscv: dts: spacemit: add USB2.0 controller nodes
 for K1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261009-b4-spacemit-k1-usb2-v4-5-2d98e5324d9a@linux.spacemit.com>
References: <20261009-b4-spacemit-k1-usb2-v4-0-2d98e5324d9a@linux.spacemit.com>
In-Reply-To: <20261009-b4-spacemit-k1-usb2-v4-0-2d98e5324d9a@linux.spacemit.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>, 
 Xu Yang <xu.yang_2@nxp.com>, Peng Fan <peng.fan@nxp.com>, 
 Peter Chen <peter.chen@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, Junzhong Pan <panjunzhong@linux.spacemit.com>, 
 Ze Huang <huang.ze@linux.dev>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791531025; l=2186;
 i=panjunzhong@linux.spacemit.com; s=20260306; h=from:subject:message-id;
 bh=txZmXDmZ4fEAn4wkzFilsJj8fTRbaRKTLQltkbAyT3c=;
 b=HagwBT9/T8GYdyTPe5YzlFbQG3hmmV21QjTtGj7nC4gCbNbz3VSQN03kZJbmlhE87HTuCXGjB
 pHF+B/dVK5CC/8ZdoP7qJGiORlXr0/cFqZgJCg0iXEumRa8CfXC3LdB
X-Developer-Key: i=panjunzhong@linux.spacemit.com; a=ed25519;
 pk=bY08BOg2T9H93/jG8fEE/tVmdXoQQMp9M2rtzPFoyJg=
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpgz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz5b-2
X-QQ-XMAILINFO: OOO9dHjlsLs7aH3/HZqx/InKiJeCcqqGUpsMcX7VqscU3xi3H/jptIdh
	Ir0MIIl7DBupIzgkl+NVWIusFcceZldzPnvT9a4RBbpqZqemrd3K3b2m0OaVm8E4TEfawJe
	POOi6ppY2FggCYL5uvLr6WO0+DDmHQW0K2uV+efeCCwx4PLV3LjFYPrgFgUBdm4mM+HwERb
	pLobzjvNKHZSvTZugZmYHhElWdFPMC0v3lvIllPFA4w09Sm6UBiWmpH4YkH58x0e2YKtcK+
	5oAdnDptdJdYhu/zFHBak010Erz9OhiHXp+vnVuUbwjfEEoGZEZAIM5p2Wgmdh62RrC56xy
	X6n+SSrWbtfO12dZV6n22VmDqtONf98pe/yNMZJpjgwcWepsN0QMi3q8DjfSzVkIeVBu3+x
	5jHAVfVMRhoVVOcYXv1kmmZTvZzI8LB/stZXxT5I3burqCqwlqorsNKtk2+teV9OYmFLDez
	bvO+KtlhGzgxkl7+bIO4pnn1giN06k5QVUgNL2eP58ROgeHwMwNG2BWYCrHyK07jfRh1LzZ
	W+UDa0WqDMTe012B+9Ya0Up9Azv12oSbAHA83dI9k7ar+tiUGQBbvO8FAQpn/xNYx0H8q1s
	ndQzbfHySISxoiTC644Y0JuJVwvn4Dwj7s1m0zkiqeW10g45asrYviPltfBJxLDOrRGsWfB
	HP7PATs6jlD6Q3G77XF6JHSdnEq4kq5s26dxwhCPSFsMSQN0VDGEBQz04sTIFlJEaIV8FSX
	wzXqisomiKhh8pc8LpiNrSIuzVQosUxFCPG5uRmhOKSvBY593vZwN29lB8MaGZ8TPdGMTrE
	WZx5ND1mmN4ngBhBH1m+gWkKZTz59gOFIbOAphoclZOvq29BuTHeChlVhkZvVQUpwBOVE8Y
	aXjG1TxMBdcro7teupIVRH8PMXAWIu67PhoVh+bkEG6IM61m1R9I183x595dlkIWPfdc4qN
	ySySNdFWeLwrVtU/+V4PSl3SfQtvEzfYkQ+OqHo/gzrWsRD7eK0100ofOziY/diLF6KnxtG
	c8MEutx3vVaQGHWL+Fmv0bt76uj4TWFbP8NAFWtBAbNlaX5GeuqPMZNSAr3rasXEDEXwJrB
	8yXvNKnk2/uAyWR5NXX6QkinrsguuI4tB753XpA88so
X-QQ-XMRINFO: MPJ6Tf5t3I/ylTmHUqvI8+Wpn+Gzalws3A==
X-QQ-RECHKSPAM: 0

The SpacemiT K1 SoC has two ChipIdea USB2.0 controllers.
- USB2.0 Dual-Role
- usb2.0 Host Only

Add the controller and PHY nodes.

Tested-by: Ze Huang <huang.ze@linux.dev>
Reviewed-by: Yixun Lan <dlan@kernel.org>
Signed-off-by: Junzhong Pan <panjunzhong@linux.spacemit.com>
---
 arch/riscv/boot/dts/spacemit/k1.dtsi | 40 ++++++++++++++++++++++++++++++++++++
 1 file changed, 40 insertions(+)

diff --git a/arch/riscv/boot/dts/spacemit/k1.dtsi b/arch/riscv/boot/dts/spacemit/k1.dtsi
index 3fabfd34114b..22896e757dbb 100644
--- a/arch/riscv/boot/dts/spacemit/k1.dtsi
+++ b/arch/riscv/boot/dts/spacemit/k1.dtsi
@@ -459,6 +459,22 @@ syscon_rcpu2: system-controller@c0888000 {
 			#reset-cells = <1>;
 		};
 
+		usbphy0: phy@c0940000 {
+			compatible = "spacemit,k1-usb2-phy";
+			reg = <0x0 0xc0940000 0x0 0x200>;
+			clocks = <&syscon_apmu CLK_USB_AXI>;
+			#phy-cells = <0>;
+			status = "disabled";
+		};
+
+		usbphy1: phy@c09c0000 {
+			compatible = "spacemit,k1-usb2-phy";
+			reg = <0x0 0xc09c0000 0x0 0x200>;
+			clocks = <&syscon_apmu CLK_USB_P1>;
+			#phy-cells = <0>;
+			status = "disabled";
+		};
+
 		usbphy2: phy@c0a30000 {
 			compatible = "spacemit,k1-usb2-phy";
 			reg = <0x0 0xc0a30000 0x0 0x200>;
@@ -1301,6 +1317,30 @@ storage-bus {
 			#size-cells = <2>;
 			dma-ranges = <0x0 0x00000000 0x0 0x00000000 0x0 0x80000000>;
 
+			usb2_0: usb@c0900000 {
+				compatible = "spacemit,k1-usb2";
+				reg = <0x0 0xc0900000 0x0 0x4100>;
+				interrupts = <105>;
+				clocks = <&syscon_apmu CLK_USB_AXI>;
+				resets = <&syscon_apmu RESET_USB_AXI>;
+				phys = <&usbphy0>;
+				phy-names = "usb-phy";
+				dr_mode = "otg";
+				status = "disabled";
+			};
+
+			usb2_1: usb@c0980000 {
+				compatible = "spacemit,k1-usb2";
+				reg = <0x0 0xc0980000 0x0 0x4100>;
+				interrupts = <118>;
+				clocks = <&syscon_apmu CLK_USB_P1>;
+				resets = <&syscon_apmu RESET_USBP1_AXI>;
+				phys = <&usbphy1>;
+				phy-names = "usb-phy";
+				dr_mode = "host";
+				status = "disabled";
+			};
+
 			usb_dwc3: usb@c0a00000 {
 				compatible = "spacemit,k1-dwc3";
 				reg = <0x0 0xc0a00000 0x0 0x10000>;

-- 
2.34.1

