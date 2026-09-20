Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 628053E4107;
	Sun, 20 Sep 2026 10:25:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789899907; cv=none; b=nCLS05t2bdZ72neRuKBk5NcTL/USUqk1r9ImKNuEXhB4BZF+amEuehOOBU828DutRnlDOM4yleOxIY6Qmr4AFpgDg60rne55gtu8a1/H5/MPbgP1I05b7qt8U72iURnk/FtAIrn3EK1d47qR5qvFmA3eaEj4AB1n75RtH47IEpg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789899907; c=relaxed/simple;
	bh=FTANwXrpGcZhLdDebjS70tAHx07labgED5H/7r+H0Dk=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=aPua/yERCkoQrI4bflWyei10xy+a5C/1HPPeLBmnTG7f3aV3/qrT9wzc4vr2V/M+peGj8PUeFtlRPsDWRgZEqUoutRvXwVXYsW3O/bCu0McDBnBLgwjIzYxKlCUzaFNGv/gApjej1Rf9Yt7OXk1L0nQE4dVu3QFpxonOLY8YpSg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QC2XbdKn; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QC2XbdKn"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 0059AC2BCB3;
	Sun, 20 Sep 2026 10:25:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1789899907;
	bh=FTANwXrpGcZhLdDebjS70tAHx07labgED5H/7r+H0Dk=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=QC2XbdKn4vjeXGC6hrvhDOG/77Ji/5orNxkqfu5sQPNEHXNuL1joZVhwl0SmHDGfK
	 CKV8fWnHXyZ89ygPaQfmLi2NdJPJTltnddHqICPN4KN34CEpUo2uyIjP0uOo7CuYj+
	 nH2Yp3JqiTDiQ6AODxygUo/CBSaPg2IQ3OzyhZxSvhOTI6JEYgSZ1eEC4y5TRgHZmc
	 vQM4ODR+qvJ9OZZIckrJqIFZAudnz4uvHoxCA/3wyErcVby3vpXG81nGTBHNdbkuOs
	 3o4xCLLizufjWEU/tkkYehy08JJg6JtaNbod/tWfBOdACd1wGQdTw+gsiJ4gCx9cPX
	 LwZAd3ezrXahg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0624C982DA;
	Sun, 20 Sep 2026 10:25:06 +0000 (UTC)
From: Chuan Liu via B4 Relay <devnull+chuan.liu.amlogic.com@kernel.org>
Subject: [PATCH v2 00/12] soc: amlogic: clk-measure: Add support for more
 SoCs
Date: Sun, 20 Sep 2026 18:25:02 +0800
Message-Id: <20260920-more-socs-to-support-clk_measure-v2-0-224382a429e8@amlogic.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAH60r2oC/4WNQQ6CMBBFr0K6dkzbaKWuvIchptYBGilDOkA0h
 Ltb8QAu3//Je4tgTAFZnItFJJwDB+oz6F0hfOv6BiE8MgsttZEnJSFSQmDyDCMBT8NAaQTfPW8
 RHU/586U2denuFk0psmZIWIfXlrhWmdvAI6X3VpzVd/3JrVL/5bMCCfYgURvr3FHXFxc7aoLfe
 4qiWtf1A4kYWQ/SAAAA
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Chuan Liu <chuan.liu@amlogic.com>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789899904; l=3172;
 i=chuan.liu@amlogic.com; s=20240902; h=from:subject:message-id;
 bh=FTANwXrpGcZhLdDebjS70tAHx07labgED5H/7r+H0Dk=;
 b=+lRg6PWFN2RLQCPiESGgdpZI0F2zHAa+dnqwUIn55GLENxdSIr9ertnmnl6ayM1Zywp64iIZi
 cdDCwKjniePC2pBsoZFpw2s+V8P3ZZYlVgG3W5qy48xWxHfwigx8Hae
X-Developer-Key: i=chuan.liu@amlogic.com; a=ed25519;
 pk=fnKDB+81SoWGKW2GJNFkKy/ULvsDmJZRGBE7pR5Xcpo=
X-Endpoint-Received: by B4 Relay for chuan.liu@amlogic.com/20240902 with
 auth_id=203
X-Original-From: Chuan Liu <chuan.liu@amlogic.com>
Reply-To: chuan.liu@amlogic.com

This patch series adds clk-measure support for the Amlogic A5, A4, S7,
S7D, S6 and A9 SoCs, listed in the order of their release.

The clock names for the clk-measure channels are kept consistent with
those used by the clock driver as much as possible, making it easier to
identify the relationship between the clk-measure channels and the
corresponding clocks in the clock driver.

This patchset also includes an additional patch to optimize memory usage:
  - soc: amlogic: clk-measure: Optimize CLK_MSR_ID to reduce memory usage

To avoid requiring everyone to spend additional effort on a separate
patchset, I have included it in this series. Please feel free to point
out if this is not appropriate for this series.

To improve maintainability, this patchset also includes a patch to reorder
the dt-binding and the compatible entries in the driver.

To minimize unrelated changes, the existing clk-measure channel tables in
the driver are left in their original order. The tables for the newly
supported SoCs are ordered alphabetically.

Signed-off-by: Chuan Liu <chuan.liu@amlogic.com>
---
Changes in v2:
- Reorder the dt-binding and the compatible entries in the driver
  alphabetically.
- Order the clk-measure channel tables for the newly supported SoCs
  alphabetically.
- Add the const qualifier to the A9 clk-measure channel table.
- Rename "exit_Tsin_B_CLK_IN" to "ext_Tsin_B_CLK_IN" in the A9 clk-measure
  channel table.
- Link to v1: https://lore.kernel.org/r/20260911-more-socs-to-support-clk_measure-v1-0-940e269aa52f@amlogic.com

---
Chuan Liu (12):
      dt-bindings: soc: amlogic: Reordering compatible of clk-measure
      dt-bindings: soc: amlogic: Add clk-measure compatible to support more SoCs
      soc: amlogic: clk-measure: Support more measurement channels
      soc: amlogic: clk-measure: Align compatible entries with DT bindings
      soc: amlogic: clk-measure: Add support for more SoCs
      soc: amlogic: clk-measure: Optimize CLK_MSR_ID to reduce memory usage
      arm64: dts: amlogic: a5: Add clk-measure controller node
      arm64: dts: amlogic: a4: Add clk-measure controller node
      arm64: dts: amlogic: s7: Add clk-measure controller node
      arm64: dts: amlogic: s7d: Add clk-measure controller node
      arm64: dts: amlogic: s6: Add clk-measure controller node
      arm64: dts: amlogic: a9: Add clk-measure controller node

 .../soc/amlogic/amlogic,meson-gx-clk-measure.yaml  |  16 +-
 arch/arm64/boot/dts/amlogic/amlogic-a4.dtsi        |   5 +
 arch/arm64/boot/dts/amlogic/amlogic-a5.dtsi        |   5 +
 arch/arm64/boot/dts/amlogic/amlogic-a9.dtsi        |   5 +
 arch/arm64/boot/dts/amlogic/amlogic-s6.dtsi        |   5 +
 arch/arm64/boot/dts/amlogic/amlogic-s7.dtsi        |   5 +
 arch/arm64/boot/dts/amlogic/amlogic-s7d.dtsi       |   5 +
 drivers/soc/amlogic/meson-clk-measure.c            | 927 ++++++++++++++++++++-
 8 files changed, 953 insertions(+), 20 deletions(-)
---
base-commit: a2530c83c458a503e55219966217dfd1c36a385e
change-id: 20260710-more-socs-to-support-clk_measure-c826f8ab9e68

Best regards,
-- 
Chuan Liu <chuan.liu@amlogic.com>


