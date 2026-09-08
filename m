Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03FEE39D6D5;
	Tue,  8 Sep 2026 07:54:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788854062; cv=none; b=SbfuqqDQXScxqWIRdhIYgb8UzvKbPKo8lCMuBOYmXFQKaipEqNv8fTDblaX9fmTlGijhXE0NP0/HwKLIPFlmI51ktUBhR9jpU62OHn6OxJk+h4UN479pOHsrIJa6IaTAKJbaaOV/mzjJ0ya43HjgiVWUZfsGN6/dogmlzwgt9uI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788854062; c=relaxed/simple;
	bh=fkkDRb9iPNoDQ4BpJHf32cdtnBXQT9Lrjp/pNe/O+fI=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=jx11ogmuQLg0RBLz5IeEwoTHPO205AUP4U1V3hKNRWA2dH5w0tTuuutQCrKDwXhmlpYzjiEKB1hBuoWPrbkJxAmhV/6J0HQ7rUuO+zj/MKXJC/J5klOl79GbvhDodgcnsxApbs0MLjle9OoAtRRvQiTThal/K08Xk9eAKru+67I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PCw8grLa; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PCw8grLa"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BB82A1F00A3A;
	Tue,  8 Sep 2026 07:54:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788854060;
	bh=L1qEmTcOVOuSfD/klU2LHmtkM0DYfjcpcZLFwOyJ1M4=;
	h=From:Subject:Date:To:Cc;
	b=PCw8grLazHz8vtMr0TuSOLZilQ1rshOeMLiWWBggiD2BxNIWjugFVPV3ej6ckWqNK
	 vGpWu5ifOeMvQSbaX+4+DNfTxaeMIR+x43+Ugw+Z3n+O37Qm7T5Ie8QoLnsLR7uasj
	 YQwTGR8kdE2GqkvFH8qLaMhrZuKTXL0IqCQ2TmLUh0OdFD3WRsOfNVGq8ziC/O5a6N
	 ri0Zstk9d69zrurKu7yENnuR1K6CUAT75deP6TdCKTAnDd6dTdty68xCCR9s+10HHV
	 H+FGMMuoZh5scNluaAEPwALBko7SeAKJGjaetUJxt44GPuqGyd0ei7W04tPMkx+p1W
	 K1Ae1VhOPazsg==
From: Konrad Dybcio <konradybcio@kernel.org>
Subject: [PATCH v5 0/5] USB4 mode programming for QMMPHY on X1E
Date: Tue, 08 Sep 2026 09:54:04 +0200
Message-Id: <20260908-topic-usb4phy-v5-0-73aac69578ef@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/3XNQW7DIBAF0KtErEsEGAxk1XtEWcAw1FRNcI1tN
 Yp89+J0kaqpNyN96c/7N1JwSFjIYXcjA86ppHypQb3sCHTu8oY0hZqJYKJlihs65j4BnYqXfXe
 laFsuovKOMUPqTz9gTF9373j6yWXy7wjjiqyNLpUxD9f74MzX3pY9c8qo5sEIDdIGcK+5lP3n5
 D4gn8/7esg6MYsHosUTIiqigg1BcWkR9AbS/EIa9hdpKgIQWdTorPFqA5EPxIgnRFbEIdggwDc
 8tv8gy7J8A0/tXV6SAQAA
X-Change-ID: 20260518-topic-usb4phy-e9612f5ba008
To: Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 usb4-upstream@oss.qualcomm.com, 
 Raghavendra Thoorpu <rthoorpu@qti.qualcomm.com>, 
 Mika Westerberg <westeri@kernel.org>, Sven Peter <sven@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
 Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788854054; l=3119;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=fkkDRb9iPNoDQ4BpJHf32cdtnBXQT9Lrjp/pNe/O+fI=;
 b=EWeICC/b875dRogbIAADlm50H5+HF0KAPMSMsqHh2oDxqhgGzl0nye9hFSKOaGV5slYz7eltW
 pHoQtURq+UZAZ0r4vMVpuKku0KURDjrPgmYFVyQRj1wPmA/Puq/0QZw
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

The USB43DP QMP PHY, as the name suggests, supports USB4 in addition to
DP/USB. This series provides the necessary plumbing to switch to that
mode of operation on hamoa/purwa.

This is achieved by exposing a third `struct phy *` for the USB4 sub-
PHY, which will be toggled by the USB4 router driver, living within the
Thunderbolt framework, which will be posted separately.

Find more details in the individual commit messages. Tested on a
X1E80100 CRD.

No external dependencies.

Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
Changes in v5:
- Reabse on next-20260907 (NOP)
- By popular demand, wrap a comment at 80 lines
- Link to v4: https://patch.msgid.link/20260820-topic-usb4phy-v4-0-aec9d2cb31f6@oss.qualcomm.com

Changes in v4:
- Rebase on next-20260820
- Rename phy-tbt.h to phy-thunderbolt.h
- Add missing error unrolling in usb4 phy_init()
- Rename usb4phy_init_count to usb4_init_count
- Refactor the submode acceptance logic in usb4 phy_set_mode()
- Pick up tags
- Link to v3: https://patch.msgid.link/20260730-topic-usb4phy-v3-0-ccf0f7ea98b5@oss.qualcomm.com

Changes in v3:
- Fix up assisted-by tag
- Pick up tags
- Link to v2: https://patch.msgid.link/20260728-topic-usb4phy-v2-0-5d9dd5149ec7@oss.qualcomm.com

Changes in v2:
- Massage the bindings to only allow the p2rr2p clock on Hamoa
- Pick up tags
- Rebase (nop)
- Link to v1: https://patch.msgid.link/20260518-topic-usb4phy-v1-0-71d827c49dca@oss.qualcomm.com

To: Vinod Koul <vkoul@kernel.org>
To: Neil Armstrong <neil.armstrong@linaro.org>
To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
To: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-arm-msm@vger.kernel.org
Cc: linux-phy@lists.infradead.org
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org

---
Konrad Dybcio (5):
      dt-bindings: phy: qcom,qmp-usb3-dp: Extend X1E description for USB4
      phy: core: Define TBT phy_mode
      phy: qualcomm: qmp-combo: Add preliminary USB4 support
      phy: qualcomm: qmp-combo: Add USB4/TBT3 configuration data for Hamoa
      arm64: dts: qcom: hamoa: Extend QMPPHY description for USB4

 .../phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml         |  55 +-
 arch/arm64/boot/dts/qcom/hamoa.dtsi                |  18 +-
 drivers/phy/qualcomm/phy-qcom-qmp-combo.c          | 602 ++++++++++++++++++---
 drivers/phy/qualcomm/phy-qcom-qmp-pcs-aon-v6.h     |   2 +
 drivers/phy/qualcomm/phy-qcom-qmp-pcs-usb-v6.h     |  15 +
 .../phy/qualcomm/phy-qcom-qmp-qserdes-txrx-v6_n4.h |  45 ++
 include/dt-bindings/phy/phy-qcom-qmp.h             |   1 +
 include/linux/phy/phy-thunderbolt.h                |  14 +
 include/linux/phy/phy.h                            |   2 +
 9 files changed, 661 insertions(+), 93 deletions(-)
---
base-commit: 944a035ecca915ae947905dcfb03f2b9dc6d032c
change-id: 20260518-topic-usb4phy-e9612f5ba008

Best regards,
--  
Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

