Received: from mail-106113.protonmail.ch (mail-106113.protonmail.ch [79.135.106.113])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F34273E0C6F
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 23:25:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.135.106.113
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792193161; cv=none; b=rSV68ra8636wCVH/ve+YwsrURhrn/ymJGijY6GUzRqBUw8OYoUBhTlASqXR4hDJQ8ztE4lLEO/xJ2x61ggFvsgK903QvGVDGxNZqyv8nl8kZnmISeoBtVHloGL6fl0G0DL0u3Qsfl1m4fJdmh5C6VIXjDaz1pZK1WrmPKWjQU4c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792193161; c=relaxed/simple;
	bh=/vM1Nm+a2vuJuTUZBQiHZJxDGDFOOoTuzqMw5VRoU70=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=CIJRSEcJKkYa+bco3/IeiN9nOpud2Np9QyJ+2ACwJV7NysjTi/2wVkY+eZfz0M3RuywU7qQPfF0n2Om2hT/T5hL54y/Hj2Q0zuzZCamnZ8zEI0uwfk+XTMHLywovRtGt70OaOV5RcrBJiYj2VJT5cdahfIg/FohljFDWxyTGwJk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=phorex.org; spf=pass smtp.mailfrom=phorex.org; arc=none smtp.client-ip=79.135.106.113
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=phorex.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=phorex.org
X-Pm-Submission-Id: 4j61Jq41QHz1DDrC
From: Luke Macken <luke@phorex.org>
To: andersson@kernel.org,
	konradybcio@kernel.org
Cc: abelvesa@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	srinivas.kandagatla@oss.qualcomm.com,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Luke Macken <luke@phorex.org>
Subject: [PATCH] arm64: dts: qcom: mahua-t14s: store the RTC offset in SDAM
Date: Fri, 16 Oct 2026 17:25:28 -0600
Message-ID: <20261016232528.4012876-1-luke@phorex.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The PMIC RTC registers on the Lenovo ThinkPad T14s Gen 7 are read-only,
so an offset needs to be stored in machine-specific non-volatile memory
which the RTC driver can take into account when reading or updating the
time.

The firmware on this machine does not provide the RTCInfo UEFI variable
that other Glymur based machines use for this purpose, so, as on
sc8280xp-crd and the QCS8550 boards, reserve four bytes in one of the
PMIC SDAM blocks to hold the RTC offset. SDAM 2 on PMK8850 is 128 bytes
and its last word is not used by the firmware.

Without this the RTC reports the time elapsed since the PMIC was first
powered, setting the time fails and the system clock starts in 1970 on
every boot until it is corrected from the network.

Assisted-by: LLM
Signed-off-by: Luke Macken <luke@phorex.org>
---
Note for reviewers: Qualcomm's "rtc: Add Qualcomm PMIC RTC-GLINK support
for Glymur" (August 2026) would move the RTC behind the charger firmware
on these machines, but it has not been resubmitted and needs firmware
that at least the ThinkPad does not ship yet. This patch uses the
existing rtc-pm8xxx nvmem offset mechanism in the meantime and does not
conflict with that work.

 .../boot/dts/qcom/mahua-lenovo-thinkpad-t14s-gen7-lcd.dts | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/mahua-lenovo-thinkpad-t14s-gen7-lcd.dts b/arch/arm64/boot/dts/qcom/mahua-lenovo-thinkpad-t14s-gen7-lcd.dts
index 35afcb5ae..28c2da5d9 100644
--- a/arch/arm64/boot/dts/qcom/mahua-lenovo-thinkpad-t14s-gen7-lcd.dts
+++ b/arch/arm64/boot/dts/qcom/mahua-lenovo-thinkpad-t14s-gen7-lcd.dts
@@ -941,9 +941,17 @@ &pmk8850_pwm {
 };
 
 &pmk8850_rtc {
+	nvmem-cells = <&rtc_offset>;
+	nvmem-cell-names = "offset";
 	qcom,no-alarm;
 };
 
+&pmk8850_sdam_2 {
+	rtc_offset: rtc-offset@bc {
+		reg = <0xbc 0x4>;
+	};
+};
+
 &remoteproc_adsp {
 	firmware-name = "qcom/glymur/LENOVO/22A8/qcadsp8480.mbn",
 			"qcom/glymur/LENOVO/22A8/adsp_dtbs.elf";
