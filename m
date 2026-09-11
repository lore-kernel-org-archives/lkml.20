Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E2F046AA85;
	Fri, 11 Sep 2026 08:43:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789116237; cv=none; b=R0W6leOStnm/CRpR6kAeF692Fyvw5QAlAhYk/+GEf6wtvyslwb7iJZioOMKkXDjLfENPlu/wM47tSqneoib69eOVDmsqod5meWwB9uTbunU86UkjXxGzlp5qmPgl8JHaNfUPsUqD/TxUlIgxcPiEMJDzMaqqzC1Hzo1keHq9s1w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789116237; c=relaxed/simple;
	bh=2IBqPAqPjl1RxfMLyiUtUS0gt8YqNj+UtUwvRtNHx/4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=M7LOj56TkgHBbaQyQ1BtPSfwD9DPTxlQkcPWKc06bx0gU7FYyWBseM8s6tE463zu5mOPIk9cCZlSgmfiZBy67o8G1DB7hMfPWRi+4KPkhFnhLOUOAxIE39kw1q7QZGh/ZtHHGHHpOwYfiNlXPI7+ZTL1aPETQUCFXr9JxiklqQU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KLww74no; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KLww74no"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BD4BE1F000FF;
	Fri, 11 Sep 2026 08:43:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789116235;
	bh=ju22f4kGM/ljQr26IAQP0LJMv/6Rf0OzaOlVs5+VPI0=;
	h=From:Date:Subject:To:Cc;
	b=KLww74nociXNTdPYioz0QJTNHfwE/zHhHol+wAZCLOab6DB7WejmS0OGNZFRhBX88
	 qzNr877FY7TLtgOh1hrq+/lvuHISL5dCmVzT3a7bIb4LoqurZfXNTIQ+BZ/LuNZ3dD
	 uBaWsr0v/mouIXSn1SMRjZnSUJuU+I0kaZV1/4SWLap+lT1OqTgvmb6/DdCkSVp/6j
	 VPlXiM+MxVWw6LZLKOHRRcJraFvQUhzb8eEpyOj2OFmBNmrI4fi6c2L8SyLJfbNTAN
	 RJQ9Vy6SX0L4kizeq8XVIZ/W/7mPJvIiXgwmtGgJ9JQd5F0d+IWEEA1/pTHlxBpEkP
	 JAQJLzWflSt2w==
From: Konrad Dybcio <konradybcio@kernel.org>
Date: Fri, 11 Sep 2026 10:43:47 +0200
Subject: [PATCH] arm64: dts: qcom: msm8994-octagon: Remove ad7147_captouch
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260911-topic-lumia_drop_captouch-v1-1-6f92f1f3c6d3@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMTQqDMBBA4avIrA1MXAjpVUqRZDKtU1oT8iOCe
 HfTuvwW7+2QOQlnuHU7JF4lS1gadN8BzXZ5sRLfDAMOIxqtVQlRSH3qV+zkU4gT2VhCpVkReme
 MQz1ahNbHxE/Z/u/743Ku7s1UfkM4jhMq2tpFfQAAAA==
X-Change-ID: 20260911-topic-lumia_drop_captouch-c0db99b016a0
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789116233; l=1336;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=uBWotT1ktwbMnj7lhGiRKkk+3QyBYGOIWnG24TtVn6A=;
 b=u8IbdDc24dYcLD4ivQhhVjGpOhWLmjCPSTdqvH6fzC0EaGzr/qbgUm6RUte3ki6aKZllGKuUW
 ekJD8V9YNx9D5dGJwcrtz5QojYXzINtgu3fvXj+Q5ZKNjB/yGIt3xsJ
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

This node lacks dt-bindings, producing warnings and is reportedly only
present on prototype hardware.

Remove it to get rid of the warnings.

Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/msm8994-msft-lumia-octagon.dtsi | 13 -------------
 1 file changed, 13 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8994-msft-lumia-octagon.dtsi b/arch/arm64/boot/dts/qcom/msm8994-msft-lumia-octagon.dtsi
index 7ace3540ef0a..4da448f17133 100644
--- a/arch/arm64/boot/dts/qcom/msm8994-msft-lumia-octagon.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8994-msft-lumia-octagon.dtsi
@@ -377,19 +377,6 @@ &blsp1_uart2 {
 &blsp2_i2c1 {
 	status = "okay";
 
-	sideinteraction: touch@2c {
-		compatible = "adi,ad7147_captouch";
-		reg = <0x2c>;
-
-		pinctrl-names = "default", "sleep";
-		pinctrl-0 = <&grip_default>;
-		pinctrl-1 = <&grip_sleep>;
-
-		interrupts = <&tlmm 96 IRQ_TYPE_EDGE_FALLING>;
-
-		vcc-supply = <&vreg_l18a_2p85>;
-	};
-
 	/*
 	 * The QPDS-T900/QPDS-T930 is a customized part built for Nokia
 	 * by Avago. It is very similar to the Avago APDS-9930 with some

---
base-commit: f2bfbc3554ca6919484030729424b9dee2942d24
change-id: 20260911-topic-lumia_drop_captouch-c0db99b016a0

Best regards,
--  
Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

