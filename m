Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 285B039E6C9;
	Sat,  3 Oct 2026 20:51:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791060669; cv=none; b=XcbXYsZ7pG2OaVh4RZ1vxGYAseZkzh4/i8CXQjeZOMmyXItNvXCz7O1qGxgHYmEGWVaGgZr3eK0ANFe+NsEOsyH/6zKv8DdXneXe3IBRAOIukmVqyh5Y07/Bci7ydCJmB6sgoFofuoq0jZQTkljRppwf03W+FSMMqOZjq34XzVA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791060669; c=relaxed/simple;
	bh=O9/xTiB/nsj+z0f4cAFHK8h8/BCndTASTlct8vI9OM4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Jtf0+aAD/cbqdZj9JdYTGXHN9PUF6gMxRehBGIf8DL45Oyq1ZmOGbZNCSX7rSXsddTAg6kKLZNLSpjn2k7CKDSzw1Vv7J43JRm0VE78dSyL81CJDdE2s3YuPflbfIxlIsD3JfRbBqKS+Bl4HbYnLzLi7sKBKA2HUgQVnP/XipyI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KCbjqoX+; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KCbjqoX+"
Received: by smtp.kernel.org (Postfix) with ESMTPS id C0800C4AF15;
	Sat,  3 Oct 2026 20:51:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1791060668;
	bh=O9/xTiB/nsj+z0f4cAFHK8h8/BCndTASTlct8vI9OM4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=KCbjqoX+TNWqjGaet8I7tig8e0ZVmOGOP+cT6OKc1VSQkq/A648qURUESVa9JweL3
	 j7WBaju8xvJLxpA4RHy2XG2HeI5ArXtKLexfPOSGLqyS1IwphLLCHNbLfLbZnMGrsm
	 6n46+c7+4R3LE+eOp+b/rILrUYCcMZZ/g6/jXcYqh4OecD3jmBAezH4C131B2cac/A
	 pkHA+det1F5w/T0KkuBL+f0656x218h3B94zWmsvqKblSZb1VIB7qOjk0B+r7gLZjU
	 8CZ9BXANogWWmK8IA0rNrco8KTYzlsG8qHWl79I7vsAojMsrniBBpK8kZ0rXlYOd7O
	 dy0WU3aLw3BYw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AECACCA5FDD;
	Sat,  3 Oct 2026 20:51:08 +0000 (UTC)
From: Sven Peter <sven@kernel.org>
Date: Sat, 03 Oct 2026 22:51:02 +0200
Subject: [PATCH v3 3/3] arm64: dts: apple: Add CIO reset controllers
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261003-b4-cio-reset-v3-3-e605f9e5c8a4@kernel.org>
References: <20261003-b4-cio-reset-v3-0-e605f9e5c8a4@kernel.org>
In-Reply-To: <20261003-b4-cio-reset-v3-0-e605f9e5c8a4@kernel.org>
To: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
 Neal Gompa <neal@gompa.dev>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>
Cc: Joshua Peisach <jpeisach@ubuntu.com>, asahi@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3435; i=sven@kernel.org;
 h=from:subject:message-id;
 bh=O9/xTiB/nsj+z0f4cAFHK8h8/BCndTASTlct8vI9OM4=;
 b=owGbwMvMwCXmIlirolUq95LxtFoSQ9bBrF3e36Xf65l2ygawfC77Hst9J+Cg45HnndzdByuPb
 Zcodf/UUcrCIMbFICumyLJ9v73pk4dvBJduuvQeZg4rE8gQBi5OAZjIrwmMDO9q3N+IaMxK0w89
 8lKvf2acaNHuR7JHBGtEEq4Vc3cUv2VkuHGsv/3MWnWz40c1eWdYPF2qcmim1Ww285m/o7MCz2y
 XZwAA
X-Developer-Key: i=sven@kernel.org; a=openpgp;
 fpr=A1E3E34A2B3C820DBC4955E5993B08092F131F93
X-Endpoint-Received: by B4 Relay for sven@kernel.org/default with
 auth_id=407

Add the reset controllers used to start the CIO (USB4/Thunderbolt)
blocks on t8103 and t600x. On t8103 each port comes with a dedicated
register page represented as a standalone node. On t600x a single
register shared by all ports of a die is located in the middle of the
PMGR MMIO region and represented as a sub-node of its syscon.

Signed-off-by: Sven Peter <sven@kernel.org>
---
 arch/arm64/boot/dts/apple/t600x-dieX.dtsi | 8 +++++++-
 arch/arm64/boot/dts/apple/t602x-dieX.dtsi | 8 +++++++-
 arch/arm64/boot/dts/apple/t8103.dtsi      | 6 ++++++
 arch/arm64/boot/dts/apple/t8112.dtsi      | 6 ++++++
 4 files changed, 26 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/apple/t600x-dieX.dtsi b/arch/arm64/boot/dts/apple/t600x-dieX.dtsi
index 9676d5127039..5e163d756a7f 100644
--- a/arch/arm64/boot/dts/apple/t600x-dieX.dtsi
+++ b/arch/arm64/boot/dts/apple/t600x-dieX.dtsi
@@ -28,7 +28,13 @@ DIE_NODE(pmgr): power-management@28e080000 {
 		compatible = "apple,t6000-pmgr", "apple,pmgr", "syscon", "simple-mfd";
 		#address-cells = <1>;
 		#size-cells = <1>;
-		reg = <0x2 0x8e080000 0 0x4000>;
+		reg = <0x2 0x8e080000 0 0x1c000>;
+
+		DIE_NODE(cio_reset): reset-controller@1a034 {
+			compatible = "apple,t6000-cio-reset";
+			reg = <0x1a034 0x4>;
+			#reset-cells = <1>;
+		};
 	};
 
 	DIE_NODE(pmgr_east): power-management@28e580000 {
diff --git a/arch/arm64/boot/dts/apple/t602x-dieX.dtsi b/arch/arm64/boot/dts/apple/t602x-dieX.dtsi
index ae3d535c5acb..fd4d572a04e7 100644
--- a/arch/arm64/boot/dts/apple/t602x-dieX.dtsi
+++ b/arch/arm64/boot/dts/apple/t602x-dieX.dtsi
@@ -27,7 +27,13 @@ DIE_NODE(pmgr): power-management@28e080000 {
 		compatible = "apple,t6020-pmgr", "apple,t8103-pmgr", "syscon", "simple-mfd";
 		#address-cells = <1>;
 		#size-cells = <1>;
-		reg = <0x2 0x8e080000 0 0x8000>;
+		reg = <0x2 0x8e080000 0 0xc000>;
+
+		DIE_NODE(cio_reset): reset-controller@a02c {
+			compatible = "apple,t6020-cio-reset", "apple,t6000-cio-reset";
+			reg = <0xa02c 0x4>;
+			#reset-cells = <1>;
+		};
 	};
 
 	DIE_NODE(pmgr_south): power-management@28e680000 {
diff --git a/arch/arm64/boot/dts/apple/t8103.dtsi b/arch/arm64/boot/dts/apple/t8103.dtsi
index 5b68bf0df4e6..985dbd8e68ca 100644
--- a/arch/arm64/boot/dts/apple/t8103.dtsi
+++ b/arch/arm64/boot/dts/apple/t8103.dtsi
@@ -730,6 +730,12 @@ pmgr: power-management@23b700000 {
 			reg = <0x2 0x3b700000 0 0x14000>;
 		};
 
+		cio_reset: reset-controller@23b784000 {
+			compatible = "apple,t8103-cio-reset";
+			reg = <0x2 0x3b784000 0x0 0x8000>;
+			#reset-cells = <1>;
+		};
+
 		pinctrl_ap: pinctrl@23c100000 {
 			compatible = "apple,t8103-pinctrl", "apple,pinctrl";
 			reg = <0x2 0x3c100000 0x0 0x100000>;
diff --git a/arch/arm64/boot/dts/apple/t8112.dtsi b/arch/arm64/boot/dts/apple/t8112.dtsi
index ec248ca052cb..2c3b59e05e01 100644
--- a/arch/arm64/boot/dts/apple/t8112.dtsi
+++ b/arch/arm64/boot/dts/apple/t8112.dtsi
@@ -737,6 +737,12 @@ pmgr: power-management@23b700000 {
 			/* child nodes are added in t8103-pmgr.dtsi */
 		};
 
+		cio_reset: reset-controller@23b790000 {
+			compatible = "apple,t8112-cio-reset", "apple,t8103-cio-reset";
+			reg = <0x2 0x3b790000 0x0 0x8000>;
+			#reset-cells = <1>;
+		};
+
 		pinctrl_ap: pinctrl@23c100000 {
 			compatible = "apple,t8112-pinctrl", "apple,pinctrl";
 			reg = <0x2 0x3c100000 0x0 0x100000>;

-- 
2.55.0


