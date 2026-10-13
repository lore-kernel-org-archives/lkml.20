Received: from morty.yoxcu.de (morty.yoxcu.de [194.36.144.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE0EB54937D;
	Tue, 13 Oct 2026 20:37:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.36.144.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791923877; cv=none; b=d1+TJoZ08Jub/OAjZfAFDz2b6hfXXZBrKf7z7Xj0XNbI+U/yZJm2rz2qoecXg2TrQPpv3DpGQaUc/KpNitEcl9UlIaluJyduOXoIV8c0atPayICpDsp2AwFrLT3cHTguw/JhFdMsnJQxd5kaPDKVTQ1SkN4yA/o/pdFjcZSqRlQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791923877; c=relaxed/simple;
	bh=zJDPswvdV38+wZyUOcFP0cfl8pWDEEKI1yECeNJCX74=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=tBKzvYpoP4ptrZX4gboqtLXtH9FiLyTlmkgVsHRXd7Yjffbpkiq/aKvpvlfGwXOM1iIpm7LRNTbxysVhVtGbutQmfb9mgomChCigVwgFBtJgSUp/sqisP++311+NqB1vMpcX7sLT0Wiqdbpgp6vgCwnTS4aJ4BBwgfzJIa+39K4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=yoxcu.de; spf=pass smtp.mailfrom=yoxcu.de; dkim=pass (2048-bit key) header.d=yoxcu.de header.i=@yoxcu.de header.b=b/yg/U84; arc=none smtp.client-ip=194.36.144.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=yoxcu.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yoxcu.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=yoxcu.de header.i=@yoxcu.de header.b="b/yg/U84"
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 8DFF91D810FF;
	Tue, 13 Oct 2026 22:37:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yoxcu.de; s=dkim;
	t=1791923873; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding; bh=H+Q2geISUaun3omivoI+pI/U8UsVgRnQuYQULnXRiyU=;
	b=b/yg/U84ckEucoDS01BJTjcr2xS4fA9GOhq7qYkmyyai4sULm4X021h2MXO6xayi9W3G8f
	OBjU7TyjSfAZjFov/Ekw/Sj0jxtJNkPl7evVyPTlVCnU+RhsE32vNpxH/GDvyrDjRqfMbt
	e2iUww9BIzM7DnFu/an5TvhDvIxzkqvnGSOQc8wBwYAHydu0CJQWuEiWM88B94vMduhfdr
	lM64nXw+AjNIcuagTLabm5j59X2feu1CrKOf/Es/Attu+L7I1bVVaqI8RKUwNaVxUB+FdI
	nyhgQB3UUDblmNjwXoGe/In2raSkGysaC7cQ/woWYhqT8Arj9z0lqLJZjTYVlQ==
From: yoxcu <mick@yoxcu.de>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>
Cc: Abel Vesa <abelvesa@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Michael Auer <mick@yoxcu.de>
Subject: [PATCH] arm64: dts: qcom: sdm845: Route the SPMI interrupt through the PDC
Date: Tue, 13 Oct 2026 22:37:49 +0200
Message-ID: <20261013203749.3078262-1-mick@yoxcu.de>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

From: Michael Auer <mick@yoxcu.de>

The SPMI arbiter interrupt (PMIC RTC alarm, power key, charger) goes
directly to GIC SPI 481. In CX collapse the GIC does not detect
interrupts, so only interrupts routed through the PDC can wake the SoC.

SPI 481 is PDC pin 1. Route the interrupt through the PDC, as sc7180,
sm8250 and sc8280xp already do.

On a OnePlus 6 in CX collapse, a 60 s RTC alarm did not end s2idle. The
phone slept for 456 s, until the modem woke it. With this change the
alarm wakes it on time (after 62 s), and the power key wakes it too.

Assisted-by: LLM
Signed-off-by: Michael Auer <mick@yoxcu.de>
---
Tested on a OnePlus 6 with an sdm845-mainline 7.1-rc1 based kernel.
On qcom/for-next only the DTB build and dtbs_check (W=1) were run, for
all sdm845 and sdm850 boards.
On this phone CX collapse also needs the sdm845 ALC interconnect RFC,
sent separately.

 arch/arm64/boot/dts/qcom/sdm845.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi b/arch/arm64/boot/dts/qcom/sdm845.dtsi
index 844b840bc546..52059ba75893 100644
--- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
@@ -5176,7 +5176,7 @@ spmi_bus: spmi@c440000 {
 			      <0 0x0c40a000 0 0x26000>;
 			reg-names = "core", "chnls", "obsrvr", "intr", "cnfg";
 			interrupt-names = "periph_irq";
-			interrupts = <GIC_SPI 481 IRQ_TYPE_LEVEL_HIGH>;
+			interrupts-extended = <&pdc_intc 1 IRQ_TYPE_LEVEL_HIGH>;
 			qcom,ee = <0>;
 			qcom,channel = <0>;
 			#address-cells = <2>;

base-commit: d628f8fa591e8e78995afd179e6ee021135cba6c
-- 
2.43.0

