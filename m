Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C8C33DAACC;
	Sun,  6 Sep 2026 04:47:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788670021; cv=none; b=lGW2i22KIWaQLDsQoUlQIc54uUOVfSD5dLNzHkgRp0arSjadg7tnhDLpDqmo0Fj9/x1hHWqAn3jPrzF8jU5Gv1UiqR4PJjchZy3PHS6eOQSP0akG7W1IfnMyZbFMGQmaYVPGW5WICwUHGsreCB7V65RSpHEiphvc52YhhYBSi34=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788670021; c=relaxed/simple;
	bh=vhWe7/HcgAuehC0kK45iZo13Fxi5NJFXU0j5hQ1NcrM=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=nmT9DJiPbjX8igCM7BVbqOfKMZ9bhU3a/EKJO/hdEsI3Ejc54Q3KCldmS+K4DWDvDaEtAIJx6rE0Zyd1s6K4f4EY8+Ko/U+BlTa479i1OBbr+R8U2GFAYMIy5Cu8z9CCvzxUumCEpe7RKxY/XyyN5VQigP2SgCgCtyGccjSEFAQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Zwd0vKUs; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Zwd0vKUs"
Received: by smtp.kernel.org (Postfix) with ESMTPS id D0B4CC2BCB8;
	Sun,  6 Sep 2026 04:47:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1788670020;
	bh=vhWe7/HcgAuehC0kK45iZo13Fxi5NJFXU0j5hQ1NcrM=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=Zwd0vKUsPkQ7OGgyVxZBzAAUgEAZrmvAOKvyQKWH9LacS1reS7ejPvFtT5hR5mFzv
	 tAIGqAggXi7nPdimtpV8WcyKHnXOLClkF3x8hi786+55BJHGD/w7zSjCQ7EVTrNNQN
	 h8eH+ZVPSpm78kmfEXH9fPIvbDZhsPwe9an3apfegkr0cP3TmrsEkbuyTxcz1RbjQR
	 Vqaugg8D4q/lkx6+56+s0+uJSnPn3aa+OOYIvoeDZ03g5GwabJ6Xv8clOkLHjiIjnF
	 eNLxutnCy7UDISHd/duBE27EFSuQcgxzgWVqNX1JmIYWLipKHU/XtwAx+aEdjewIcI
	 rKSAkTyajpflA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D88DC79F8C;
	Sun,  6 Sep 2026 04:47:00 +0000 (UTC)
From: George Moussalem via B4 Relay <devnull+george.moussalem.outlook.com@kernel.org>
Subject: [PATCH v3 00/10] Flatten USB Controller Nodes on IPQ SoCs
Date: Sun, 06 Sep 2026 08:46:39 +0400
Message-Id: <20260906-ipq-flatten-usb-v3-0-13e4e0f63123@outlook.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/3XN0Q6CIBTG8VdxXEfjwETtyvdoXQBCskwMkNWc7
 x5601rr8v9t53cWFLS3OqBTsSCvkw3WjTnYoUCqF+NVY9vlRpRQTmpaYjs9sBlEjHrEc5BYVV1
 loDSs4Rzlq8lrY5+7eL7k7m2Izr/2Bwm29b+VABNcKjAMKiKlblo3x8G521G5O9q0RD9CQ/ivQ
 LPQCVkzoEQCEd/Cuq5vc0rmZPIAAAA=
X-Change-ID: 20260825-ipq-flatten-usb-c7d7f15f3966
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Wesley Cheng <quic_wcheng@quicinc.com>, 
 Thinh Nguyen <Thinh.Nguyen@synopsys.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>, 
 George Moussalem <george.moussalem@outlook.com>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788670018; l=3797;
 i=george.moussalem@outlook.com; s=20250321; h=from:subject:message-id;
 bh=vhWe7/HcgAuehC0kK45iZo13Fxi5NJFXU0j5hQ1NcrM=;
 b=ocE8kBtwBnuSVMwdaIISlnnlxKaBHc1JypXZlkCoeswV9RohXHla7fAybGxCUfhEye4fFo8Jx
 eOuRBXXh2UHCEt+nJe5OHSXyjj+vILHzfzDwmpJdgAR6A7NhMXYbQIv
X-Developer-Key: i=george.moussalem@outlook.com; a=ed25519;
 pk=/PuRTSI9iYiHwcc6Nrde8qF4ZDhJBlUgpHdhsIjnqIk=
X-Endpoint-Received: by B4 Relay for george.moussalem@outlook.com/20250321
 with auth_id=364
X-Original-From: George Moussalem <george.moussalem@outlook.com>
Reply-To: george.moussalem@outlook.com

Add ability to pass the UTMI clock rate to the DWC3 core to calculate
the right values for the period and frame length adjustment. This is
required for USB controllers on chipsets where the computed values for
the period and frame length adjustment differ from hardware defaults
based on the UTMI clock rate.

Flatten usb controller node and update to using latest bindings and
flattened driver approach.

In addition, set the right UTMI clock rate and override any clock
rate inherited from the bootloader.

I've split these patches from a larger patch set to add USB3 support on
IPQ5018 and IPQ5332 SoCs where these patches are required to ensure new
functionality is added to the new flattened driver and binding model.

link: https://lore.kernel.org/all/20260812-ipq5018-usb3-v2-0-8f355d7ff0ef@outlook.com/

Signed-off-by: George Moussalem <george.moussalem@outlook.com>
---
Changes in v3:
- Re-added dr_mode back to the controller node in ipq6018-cp01-c1.dts
  after having removed it in patch 6.
- Swap interrupts for dp_hs_phy_irq and dm_hs_phy_irq for ipq9574 as per
  order in updated binding.
- Only set the ref_clk_rate in the probe_data structure if the UTMI clock
  is available.
- Also referring to changes below in v2 (v2 wasn't reviewed yet).
- Link to v2: https://lore.kernel.org/r/20260906-ipq-flatten-usb-v2-0-dab83120b10a@outlook.com

Changes in v2:
- Dropped the "qcom,select-utmi-as-ref-clk" property from the binding
  and DTS nodes since it is no longer needed. If the UTMI clock is
  available, the glue layer will pass its clock rate to the core
  unconditionally.
- Added separate patches to move the DR mode to the relevant board DTS
  files as per Konrad's request.
- Picked up RB tags
- Link to v1: https://lore.kernel.org/r/20260825-ipq-flatten-usb-v1-0-5c1f3170bbe9@outlook.com

---
George Moussalem (10):
      usb: dwc3: core: Allow glue layer to pass reference clock rate
      usb: dwc3: qcom: Add support for selecting UTMI as reference clock
      arm64: dts: qcom: ipq5018: Flatten usb controller node
      arm64: dts: qcom: ipq5332: Flatten usb controller node
      arm64: dts: qcom: ipq5424: Flatten usb controller nodes
      arm64: dts: qcom: ipq6018: move DR mode to board DTS
      arm64: dts: qcom: ipq6018: Flatten usb controller nodes
      arm64: dts: qcom: ipq8074: move DR mode to board DTS
      arm64: dts: qcom: ipq8074: Flatten usb controller nodes
      arm64: dts: qcom: ipq9574: Flatten usb controller node

 arch/arm64/boot/dts/qcom/ipq5018-rdp432-c2.dts   |   6 +-
 arch/arm64/boot/dts/qcom/ipq5018.dtsi            |  51 +++++------
 arch/arm64/boot/dts/qcom/ipq5332-rdp468.dts      |   6 +-
 arch/arm64/boot/dts/qcom/ipq5332.dtsi            |  57 ++++++------
 arch/arm64/boot/dts/qcom/ipq5424-rdp466.dts      |  12 +--
 arch/arm64/boot/dts/qcom/ipq5424.dtsi            |  86 ++++++++----------
 arch/arm64/boot/dts/qcom/ipq6018-cp01-c1.dts     |   2 +
 arch/arm64/boot/dts/qcom/ipq6018.dtsi            |  95 +++++++++-----------
 arch/arm64/boot/dts/qcom/ipq8074-hk01.dts        |   4 +
 arch/arm64/boot/dts/qcom/ipq8074.dtsi            | 110 +++++++++++------------
 arch/arm64/boot/dts/qcom/ipq9574-rdp-common.dtsi |   6 +-
 arch/arm64/boot/dts/qcom/ipq9574.dtsi            |  48 +++++-----
 drivers/usb/dwc3/core.c                          |   6 ++
 drivers/usb/dwc3/core.h                          |   2 +
 drivers/usb/dwc3/dwc3-qcom.c                     |   9 ++
 drivers/usb/dwc3/glue.h                          |   4 +
 16 files changed, 236 insertions(+), 268 deletions(-)
---
base-commit: 32b6ef9a5d0eca44f9cd91f52f4faa89f145a0de
change-id: 20260825-ipq-flatten-usb-c7d7f15f3966

Best regards,
-- 
George Moussalem <george.moussalem@outlook.com>


