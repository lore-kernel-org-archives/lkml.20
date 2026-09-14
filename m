Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC57139A06A;
	Mon, 14 Sep 2026 19:42:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789414949; cv=none; b=jQC92m8LIMhoJFrOctAqvYvAbmPQFBzu6yi2BcfZMersUfFDOvV1ZSdhSiEMbFIISxQazzQgHdmdSwZ/ygo+9RBk9tAf24XrJ+gNsm4blfAeA93ljtoeYeJYEXJP8rnvnhtBaGxWydYgzo19rPRdCZZsC4LamrEV7nOfPUXBKH8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789414949; c=relaxed/simple;
	bh=HC76wcK5ULVwD+LMba2Nz22Z5JvZJ4S2D7yoIjm/E6w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=FNtAlsDqWA8FzZ2WTx+wglFWqMdPjMCEcgdOjYeWQxY2IsWUO6HX+e85vl9Rntiy+Iex3FQs+kZuwY6gvA2vtIVr927jlsoyAIOIly+KsGJwtT8c8df49bozQMO7jsYoiz372o+2LqQNzyLYAakZHTby5eJrEq4yR2D+etQfPs4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gvl0M2pY; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gvl0M2pY"
Received: by smtp.kernel.org (Postfix) with ESMTPS id BE3DCC2BCB8;
	Mon, 14 Sep 2026 19:42:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1789414948;
	bh=HC76wcK5ULVwD+LMba2Nz22Z5JvZJ4S2D7yoIjm/E6w=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=gvl0M2pYygwjmzrNG+VbX6MASEcemVPDx9nQv52Ptxf2YXbkYcbH0gIPGLTBkZwaP
	 Q5Jq5b31yu3EXtC4oXdEVIm52gT7NIW9ooKtZmF8whMecg0vWNq748DeM7yRQaaGFg
	 AZ8bHGg3YhAnyaa5tbKp3ROO9HEy+4C9T7SSsZcHQxq13aGv7IYX8WgcN16KMza537
	 gdNbBM3Tr77iHuIMz7M0A7bcmm5Q55Fy1n8JTsJEC+GoQLHPV5d53gFsyO9EkFFTfZ
	 neXcCIA0PI1fqrVVEwMcUncg/ljp/y+Aa5Ko92qQjjYYGQ8spgxDRQOkKPN+0QX5Hn
	 ReWCzt5eLX+XA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A907C88E73;
	Mon, 14 Sep 2026 19:42:28 +0000 (UTC)
From: Jens Glathe via B4 Relay <devnull+jens.glathe.oldschoolsolutions.biz@kernel.org>
Date: Mon, 14 Sep 2026 21:42:21 +0200
Subject: [PATCH] arm64: dts: qcom: x1: split PAS remoteproc iommus out of
 x1-el2
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260914-x1-el2-unfuck-v1-1-00d8bc35a635@oldschoolsolutions.biz>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDU0MT3QpD3dQcI93SvLTS5Gxdg2QTM0Mzc1NjizQTJaCegqLUtMwKsHn
 RsbW1AE+96IRfAAAA
X-Change-ID: 20260514-x1-el2-unfuck-0c46167538f4
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Xin Liu <xin.liu@oss.qualcomm.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Nikita Travkin <nikita@trvn.ru>, Birk Skyum <birk.skyum@pm.me>, 
 Stephan Gerhold <stephan.gerhold@linaro.org>, 
 Xin Liu <xin.liu@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Jens Glathe <jens.glathe@oldschoolsolutions.biz>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789414947; l=3766;
 i=jens.glathe@oldschoolsolutions.biz; s=20240919;
 h=from:subject:message-id;
 bh=pcARbTPQLLzJMHpzrEgAxvpBCM84LLIQ4irIlV+wpRg=;
 b=hOgJH7ZgIKORaNu2PEFpC1fObpJibjTEqdFQTFW9H8XrKZERkN8v+deMZW7sbb2gJ32oTjs8Z
 AAVFcSOvpqNCwHIfuoQEyhX2V+6Edk0kynR4v99nFooF9+VBBRwViFL
X-Developer-Key: i=jens.glathe@oldschoolsolutions.biz; a=ed25519;
 pk=JcRJqJc/y8LsxOlPakALD3juGfOKmFBWtO+GfELMJVg=
X-Endpoint-Received: by B4 Relay for
 jens.glathe@oldschoolsolutions.biz/20240919 with auth_id=216
X-Original-From: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
Reply-To: jens.glathe@oldschoolsolutions.biz

From: Jens Glathe <jens.glathe@oldschoolsolutions.biz>

The shared x1-el2 overlay currently attaches apps_smmu streams to
remoteproc_adsp/cdsp so Linux can program those SIDs when PAS is
used to authenticate and reset the DSPs.

That is wrong for the common WoA EL2 path (slbounce + shipping
UEFI). There the DSPs are already running from the bootloader and
the SMMU probe path leaves their SIDs in bypass. Describing iommus
on the remoteproc nodes replaces that bypass with a translated
context that is never set up, and boot dies in an SMMU fault storm
on SID 0x1000 before userspace.

Move the remoteproc iommus into a new x1-el2-pas overlay and apply
it only on hamoa-iot-evk, which is the platform that actually needs
PAS-managed remoteproc under EL2. Other x1e/x1p -el2 DTBs stay on
the generic overlay.

Tested on:
  Lenovo Yoga Slim 7x (83ED, BIOS NHCN62WW) by Birk
  Lenovo Thinkpad T14s G6 (21N1, Hamoa)
  Lenovo IdeaCentre Mini 01q8x10 (91B6, Purwa)
  Lenovo Ideapad 5 2in1 14Q8X9 (83GH, Purwa)

Fixes: 47c88db49f6c ("arm64: dts: qcom: hamoa: Add remoteproc IOMMUS in EL2 device trees")
Link: https://lore.kernel.org/all/20260130073113.3091884-1-xin.liu@oss.qualcomm.com/
Suggested-by: Nikita Travkin <nikita@trvn.ru>
Assisted-by: Grok(xAI):4.6
Tested-by: Birk Skyum <birk.skyum@pm.me>
Signed-off-by: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
---
 arch/arm64/boot/dts/qcom/Makefile        |  2 +-
 arch/arm64/boot/dts/qcom/x1-el2-pas.dtso | 21 +++++++++++++++++++++
 arch/arm64/boot/dts/qcom/x1-el2.dtso     |  8 --------
 3 files changed, 22 insertions(+), 9 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index d6547fb18edf0..1d1cdf057fd99 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -22,7 +22,7 @@ dtb-$(CONFIG_ARCH_QCOM)	+= glymur-hp-elitebook-x-g2q.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= glymur-lenovo-yoga-slim7x.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= hamoa-iot-evk.dtb
 
-hamoa-iot-evk-el2-dtbs	:= hamoa-iot-evk.dtb x1-el2.dtbo
+hamoa-iot-evk-el2-dtbs := hamoa-iot-evk.dtb x1-el2.dtbo x1-el2-pas.dtbo
 
 dtb-$(CONFIG_ARCH_QCOM)	+= hamoa-iot-evk-el2.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= hamoa-lenovo-ideacentre-mini-01q8x10.dtb
diff --git a/arch/arm64/boot/dts/qcom/x1-el2-pas.dtso b/arch/arm64/boot/dts/qcom/x1-el2-pas.dtso
new file mode 100644
index 0000000000000..05364b439182a
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/x1-el2-pas.dtso
@@ -0,0 +1,21 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Extra EL2 overlay for platforms where Linux programs remoteproc
+ * IOMMU streams because PAS is available.
+ *
+ * Do not apply this on current WoA firmware. Those DSPs are started
+ * by the bootloader and rely on the SMMU SID bypass set up in
+ * qcom_smmu_cfg_probe(). Attaching iommus here replaces that bypass
+ * with an empty translated context and faults SID 0x1000.
+ */
+
+/dts-v1/;
+/plugin/;
+
+&remoteproc_adsp {
+	iommus = <&apps_smmu 0x1000 0x80>;
+};
+
+&remoteproc_cdsp {
+	iommus = <&apps_smmu 0x0c00 0x0>;
+};
diff --git a/arch/arm64/boot/dts/qcom/x1-el2.dtso b/arch/arm64/boot/dts/qcom/x1-el2.dtso
index ee006742d6f3b..175679be01eba 100644
--- a/arch/arm64/boot/dts/qcom/x1-el2.dtso
+++ b/arch/arm64/boot/dts/qcom/x1-el2.dtso
@@ -52,14 +52,6 @@ &pcie_smmu {
 	status = "okay";
 };
 
-&remoteproc_adsp {
-	iommus = <&apps_smmu 0x1000 0x80>;
-};
-
-&remoteproc_cdsp {
-	iommus = <&apps_smmu 0x0c00 0x0>;
-};
-
 /*
  * The "SBSA watchdog" is implemented in software in Gunyah
  * and can't be used when running in EL2.

---
base-commit: 1a1de54f7369cd2b5bac0f265910e60ad3a6b4c3
change-id: 20260514-x1-el2-unfuck-0c46167538f4

Best regards,
-- 
Jens Glathe <jens.glathe@oldschoolsolutions.biz>


