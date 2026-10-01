Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D3812BE053;
	Thu,  1 Oct 2026 07:53:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790841227; cv=none; b=qsbvu9LyXVoRUrJXG3YV+BS2ymRt5an7E5sZ+yJxcg687xpdE0eFyfloOpYFn0X8sVWMP+3ZTCntTqgTjFdX6dLeUnK85kLz/3D5h2LAF4r3aayFFTv8TptcHmHp8i8sJc8jL99jXvlYfe3w+fgIdytEx1AelpCV+21aWnqxJt4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790841227; c=relaxed/simple;
	bh=EVINqzp6xWaGFh5nsVvzl2MoeVgc9moWhUusgsXG0Yw=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=saLBUHMcHMX7ToWgDSjGdWghZ7BcdhrAqyeMmhueONpeM6Wdpv+7HURpE0SYqKTFpJMMFG+XjeCLyvT3LPMM3JvSTLrThQYa/Pl1KgqsgTVIQgvKJQu9/Fa1ugc+wuMbKG8Yqjrn9nGIK781mClLqsZn1JsNEisL7ZxZ8kv36h4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=G9g2LdNA; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="G9g2LdNA"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 18EE5C2BCC7;
	Thu,  1 Oct 2026 07:53:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1790841227;
	bh=EVINqzp6xWaGFh5nsVvzl2MoeVgc9moWhUusgsXG0Yw=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=G9g2LdNAoQXMZ3fRRXTDFr3MsdjNPC8174GJX2TPExjMAFkTTmltfXiHpgQ0E5+BR
	 f9S7hsJmHFw6RvwKvcvuZ8U2qNTZJZYyXfUkezD49RKdtO7tcwND4/Ac3pZG5UIJSv
	 G4THtZl2t1d4/lgV8qySW30+4PAiWJFdQlL32H+wMkAPL/hJWcFja8kgg7ocu0EOJf
	 WWQGUd1/CxDJDxCpKhZE/Dg6ef9MfDhiOzb9LIqa7HDgPACaLyVFFrbj2xfiv+vWxA
	 Pv/d8dEa+cxtFLT7uKMptcyvE+OdWVe7bIKtI3eWPnbckDxxddKbO2M3/wKxvCq7Ys
	 KEcFe40T3HBMQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DFF9FCA5FB3;
	Thu,  1 Oct 2026 07:53:46 +0000 (UTC)
From: George Moussalem via B4 Relay <devnull+george.moussalem.outlook.com@kernel.org>
Subject: [PATCH v4 0/8] Flatten USB Controller Nodes on IPQ SoCs
Date: Thu, 01 Oct 2026 11:53:43 +0400
Message-Id: <20261001-ipq-flatten-usb-v4-0-486a4d5ede30@outlook.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/4XNTQ6CMBCG4auQrq3pDxRw5T2Mixam0qgU29JoC
 He3sDGGGJfvl8wzE/LgDHh0yCbkIBpvbJ8i32Wo6WR/AWza1IgRJkjFCmyGB9Y3GQL0ePQKN2V
 balpoXguB0tXgQJvnKp7OqTvjg3Wv9UGky/rbihQTXDRUc1oSpaA+2jHcrL3uG3tHixbZR6iJ2
 AosCa1UFaeMKErkVuB/BJ4EyiEHokVS+Lcwz/MbYaOB3DQBAAA=
X-Change-ID: 20260825-ipq-flatten-usb-c7d7f15f3966
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Wesley Cheng <quic_wcheng@quicinc.com>, 
 Thinh Nguyen <Thinh.Nguyen@synopsys.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>, 
 Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>, 
 George Moussalem <george.moussalem@outlook.com>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790841224; l=3682;
 i=george.moussalem@outlook.com; s=20250321; h=from:subject:message-id;
 bh=EVINqzp6xWaGFh5nsVvzl2MoeVgc9moWhUusgsXG0Yw=;
 b=Yg7Qas+wFoBYDf3dERIqYRgd4m/P1+mkfZzkh/GSCqNqPVx7wa90ou4Zp43A0W2r6RBcrhDsl
 88HeSZwQp8VBi5DIm9XW2gcewxHiK5gR1toWotwKfEH8I0761SiiPVE
X-Developer-Key: i=george.moussalem@outlook.com; a=ed25519;
 pk=/PuRTSI9iYiHwcc6Nrde8qF4ZDhJBlUgpHdhsIjnqIk=
X-Endpoint-Received: by B4 Relay for george.moussalem@outlook.com/20250321
 with auth_id=364
X-Original-From: George Moussalem <george.moussalem@outlook.com>
Reply-To: george.moussalem@outlook.com

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
Changes in v4:
- Dropped patches to have the glue layer pass the reference clock rate
  to the core as they're no longer required since Kathiravan's patches
  updating the UTMI clock rates have been applied in next:
  commit 0fe2995196a5 ("clk: qcom: ipq5018: add 24MHz rate for USB UTMI clock")
  commit 33e6a4864ddc ("clk: qcom: ipq5332: add 24MHz rate for USB UTMI clock")
- Updated the dts patches for IPQ5018 and IPQ5332 accordingly to set the
  UTMI clock rate to 24 MHz.
- Link to v3: https://lore.kernel.org/r/20260906-ipq-flatten-usb-v3-0-13e4e0f63123@outlook.com

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
George Moussalem (8):
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
 12 files changed, 215 insertions(+), 268 deletions(-)
---
base-commit: 6c2cb8b8b843d216ab549b678a0d8831c43153e0
change-id: 20260825-ipq-flatten-usb-c7d7f15f3966

Best regards,
-- 
George Moussalem <george.moussalem@outlook.com>


