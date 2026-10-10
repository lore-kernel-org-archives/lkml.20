Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C470132142B;
	Sat, 10 Oct 2026 21:52:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791669163; cv=none; b=Dvyj4zeC/VJhrkuV2ZZ2qvw1JGwPjv0UcPxxV8w29rHABstwFzmCG0yfX5U2AGB1z3mZBFfUkV7ZG9Tn9UQ+Y/zwjZh3M6IBftcWBuBDGHof5Ir8+fzFL4N4oFFDrq6by1Rhj+mlluW14ddPja+XH81/ka5f3o/Nsv5i2PKqB54=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791669163; c=relaxed/simple;
	bh=Jt9lrBGcJBOCbR0/BQca+PmH5rou2oQfF7483YIkgk8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=IkJpLoA36b4DlUvyFHRc7CcDV5bgVbzCDnCSQtzmBksFbVM7d+gZgoSGARz4JX7OSb4dxwu3X/BZQy3/DoyJPY7CZmS73C42mEjOEalWwGwsegow02bWTXOh7cMkl5wM3X2NWQMO00+bMzfhskGv8XdwBfboYkx82XSU1WbnCr0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QG8LxyBr; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QG8LxyBr"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 547F0C2BCB9;
	Sat, 10 Oct 2026 21:52:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1791669163;
	bh=Jt9lrBGcJBOCbR0/BQca+PmH5rou2oQfF7483YIkgk8=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=QG8LxyBrpbIixDBBGR/PFjkasgqHlKi3zumJcZqFHFAjZaMU8kM+b8ekN7MiDMsh+
	 BR1nyGiyaFPt7Tz1AombZje58t7vbev6lrYUGQarPBQbv/TLX8dXR8y4qhFCxqYkBZ
	 u2zPb+2EieIJQtSiYj1V0JaFbSuiPOa88mCApqa8KlvnTBhJ3ei+zTSEgLpAjoB5e0
	 mJXoJzKv+4otbhQTnL8ufNBCcHKlKZCpJJsEXnLY9JjdWQwsqlRR7CGRj3HEMjnz9y
	 W13ZXcEbfd1/ony2eyxPjDTao1SaJJpxo8MtXwjs7JPYKxnPo2jUQD2aSBl2IsK+9y
	 TKBZbLHqkiMBw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40C40CA9EC5;
	Sat, 10 Oct 2026 21:52:43 +0000 (UTC)
From: Igor Velkov via B4 Relay <devnull+iav.iav.lv@kernel.org>
Date: Sun, 11 Oct 2026 00:52:37 +0300
Subject: [PATCH] arm64: dts: rockchip: Enable HS400 enhanced strobe on
 Kobol Helios64 eMMC
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261011-b4-helios64-emmc-hs400-v1-1-36951d319229@iav.lv>
X-B4-Tracking: v=1; b=H4sIAKWzymoC/x3MSQqAMAxA0atI1gZareNVxIW20QacaECE4t0tL
 t/i/whCgUmgzyIEuln4PBJ0noH107ESskuGQhW1VlrjbNDTxqfUBmnfLXoxSmFnm9YsZeVa5yD
 FV6CFn388jO/7AYMeeiVoAAAA
To: Heiko Stuebner <heiko@sntech.de>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Igor Velkov <iav@iav.lv>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1561; i=iav@iav.lv;
 h=from:subject:message-id;
 bh=aUbqlnQGl5qV5hXARJBMfnnwJzS8qvfPcSClzVZ69Co=;
 b=owGbwMvMwCVmNH1q96v4SmbG02pJDFmnNq881tJuwHt9EyfLvruOpdqcDfvdVeuiflXl/ktc8
 2rFQi+DjlIWBjEuBlkxRZYJhzRuZSy5+tffw/wBzBxWJpAhDFycAjCRbfcY/gquX/Z359py5Ymr
 5X72q/Mvij4WlXK9+NzhgFV/zoisFTnC8D9W/unuafM1JZ4u7lc8aLNuWhVnouzOq8tPqN5vvhk
 izskCAA==
X-Developer-Key: i=iav@iav.lv; a=openpgp;
 fpr=90C228DA68A4D5FD4F4837E03297958BEA5F7903
X-Endpoint-Received: by B4 Relay for iav@iav.lv/default with auth_id=1060
X-Original-From: Igor Velkov <iav@iav.lv>
Reply-To: iav@iav.lv

From: Igor Velkov <iav@iav.lv>

The eMMC of Helios64 runs in HS200. Run it in HS400 enhanced strobe at
150 MHz, as on Gru. The strobe line goes straight from the SoC to the
DS pin of the eMMC with no pull-down on the board, so enable the one
in the eMMC PHY.

Assisted-by: LLM
Signed-off-by: Igor Velkov <iav@iav.lv>
---
Schematic, sheet 14:
https://wiki.kobol.io/helios64/files/schematics/Helios64_Schematics_Rev1.2.pdf

Tested on mainline with three 2 GiB write and read-back passes, no
errors. Raw reads go from 180 MB/s in HS200 to 247 MB/s. Without the
pull-down, writes dropped to about 1 MB/s with repeated
"mmc1: running CQE recovery".
---
 arch/arm64/boot/dts/rockchip/rk3399-kobol-helios64.dts | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3399-kobol-helios64.dts b/arch/arm64/boot/dts/rockchip/rk3399-kobol-helios64.dts
index 63ad79b4c8ac..f78482c4c285 100644
--- a/arch/arm64/boot/dts/rockchip/rk3399-kobol-helios64.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3399-kobol-helios64.dts
@@ -320,6 +320,7 @@ &cpu_l3 {
 };
 
 &emmc_phy {
+	rockchip,enable-strobe-pulldown;
 	status = "okay";
 };
 
@@ -586,8 +587,11 @@ &saradc {
 };
 
 &sdhci {
+	assigned-clock-rates = <150000000>;
 	bus-width = <8>;
 	mmc-hs200-1_8v;
+	mmc-hs400-1_8v;
+	mmc-hs400-enhanced-strobe;
 	non-removable;
 	vqmmc-supply = <&vcc1v8_sys_s0>;
 	status = "okay";

---
base-commit: d2abcbb905b0e4b2e06b257fa1e5bcf4faa6dbda
change-id: 20261011-b4-helios64-emmc-hs400-9c784f35d8dd

Best regards,
-- 
Igor Velkov <iav@iav.lv>


