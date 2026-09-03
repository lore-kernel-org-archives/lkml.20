Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 405D84B66E4;
	Thu,  3 Sep 2026 14:25:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788445566; cv=none; b=PzOkdYxCHZ0KQrlI7a2vsK2mv6dnjq845tYazUGMhTAsOqfXDoS2JPX1WRrvUXdI1EHz6gP3XtHLby3B9rhdVr1RdUNhtJXEM7aCvfLrlnD6jwnbPC4iYZm5+DNyBqypcoZUTsjzwkG0P5gDN59NFwvbSD+KgM5W46qHjp9c2IA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788445566; c=relaxed/simple;
	bh=jqqZebTnpEQ1fljwyxW1TH1t9ES5SnJoHG3eYTPQmPE=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=nJMDnseMb/uyvfZuC5GgkFj+vQqGYZunxizTJaqPfnvWhXzFnaX3j6E5qByDaT4flwsAEFIMG1/hBDgIWFq14sZN5I3Oq5bXWLuR5cqR5hSHz5gsHZqmpqcPPfygc3wJZ1Yawv3jzj0P3t7WFOwB0x3pr3BVhVObIAsNo3W/JYE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MjLn2UBw; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MjLn2UBw"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DA6981F00A3D;
	Thu,  3 Sep 2026 14:25:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788445553;
	bh=YQ/rFL5VnLHnIzTf6yfvW/jeW8RHEfIQjY1lU726wts=;
	h=From:Subject:Date:To:Cc;
	b=MjLn2UBw4ASOlLo7rUooqyPA0pevy8UOeoUaj+1OqXNrbrH6Yr9PYnW5gatoF89Zt
	 ZKMCMR4M74/9OcReDdwZZpctvJ4POLEPmti7eJRF3bKv1eg7jYknrys0ih/aUk0Oe6
	 +K4w2tGZBKT+tV9Vt6rheJVUfh/DOdSpsK3wbhm0J1nlghDAYcZLVw1iMx9jD2fL8B
	 yFNXjgyeO1pgTmtoerG/XZ4elfbrkTvDYLV8zMdgyNnKXQ2OKH83ZEasfSvHRBaVjw
	 ChfI1KnYaXoAAomUddJArpVUKbD8G8W42Lee7ahIhBzTteXkfotF0TnTTa1VAA0tZy
	 oL2adeWtABEpg==
From: Konrad Dybcio <konradybcio@kernel.org>
Subject: [PATCH v2 0/5] Fix up QUSB2 PHY description for MSM8996/SM61[12]5
Date: Thu, 03 Sep 2026 16:25:27 +0200
Message-Id: <20260903-topic-8996_61x5_qusb2phy-v2-0-4c3f980a4560@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/42NQQqDMBREryJZN5KkGE1X3qOIaPKtKdVovooi3
 r3RXqCbgQcz83aC4C0geUQ78bBYtK4PIG4R0W3Vv4BaE5gIJiSTnNHJDVbTTClZSr4m5ThjLYZ
 2o5VhiaiVAmWAhPngobHrdf0sfoxz/QY9nX9no7U4Ob9d7oWfvT80C6eMmpTfE5UxSLMmd4jxO
 Fcf7bouDkGK4zi+6z8mT9kAAAA=
X-Change-ID: 20260610-topic-8996_61x5_qusb2phy-ad052b99e9de
To: Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Wesley Cheng <quic_wcheng@quicinc.com>, 
 Iskren Chernev <me@iskren.info>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788445548; l=2016;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=jqqZebTnpEQ1fljwyxW1TH1t9ES5SnJoHG3eYTPQmPE=;
 b=+qfgvYG7nUs5HfR2LfR4q4DIDp2auUMorfIwwD6//8hCcmEflj79QIeanjlzIYXpZi36V/Xbd
 e5igQezEaGcDM2mIpY5r/tTJ4VNG+ghgA1fsYP8myZgBVFjG/g1+L6s
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

The MSM8996 QUSB2PHY was not being guaranteed a power source.
The SM6125's QUSB2PHY was believed to be idential as the 96 one. It
wasn't. This series tackles that, freeing us of some dt checker
errors about vdd-supply not found on MSM8996 boards.

Compile-tested only, but docs confirm my findings..

Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
Changes in v2:
- Pick up tags
- Add a code-janitory patch ("Remove _SHIFT defines")
- Link to v1: https://patch.msgid.link/20260610-topic-8996_61x5_qusb2phy-v1-0-d7135980e78f@oss.qualcomm.com

To: Vinod Koul <vkoul@kernel.org>
To: Neil Armstrong <neil.armstrong@linaro.org>
To: Manivannan Sadhasivam <mani@kernel.org>
To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
To: Wesley Cheng <quic_wcheng@quicinc.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Iskren Chernev <me@iskren.info>
To: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org
Cc: linux-phy@lists.infradead.org
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org

---
Konrad Dybcio (5):
      dt-bindings: phy: qcom,qusb2: Straighten out SM6125 and MSM8996
      phy: qcom-qusb2: Fix SM6115 init sequence
      phy: qcom-qusb2: Remove _SHIFT defines
      arm64: dts: qcom: msm8996: Add VDD_MX to QUSB2 PHYs
      arm64: dts: qcom: sm6125: Fix QUSB2 compatible

 .../devicetree/bindings/phy/qcom,qusb2-phy.yaml    | 31 ++++++++++++++++--
 arch/arm64/boot/dts/qcom/msm8996.dtsi              | 10 ++++++
 arch/arm64/boot/dts/qcom/sm6125.dtsi               |  3 +-
 drivers/phy/qualcomm/phy-qcom-qusb2.c              | 37 ++++++++++------------
 4 files changed, 58 insertions(+), 23 deletions(-)
---
base-commit: 32b6ef9a5d0eca44f9cd91f52f4faa89f145a0de
change-id: 20260610-topic-8996_61x5_qusb2phy-ad052b99e9de

Best regards,
--  
Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

