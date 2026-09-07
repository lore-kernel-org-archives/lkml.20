Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BD944432F6;
	Mon,  7 Sep 2026 09:01:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788771686; cv=none; b=evT1+QmEIicYjZxcw2YOCREBkLf1gM2FJky2FD77gDJ6X8bhLgwoCcgy+a8G4knrkcBuRKibtCRk6JqeKZZovJMqsIPx5F9gGtYty8LH6sn31knqcdcW/Lkbgu6kX0wxw0HCIGJG0zQpsfx3vq7vCaVZXuJJqfpotEnkAGmoZDU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788771686; c=relaxed/simple;
	bh=U83q0vy/ImUKk/Xt2yP295Vp7svH+tR4dOggNfpUJZI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=EAYK9VIhRlc1vAEJbyn10wvKcYGBI6WRgn69bAkosuADFL47GwAKMbcHn3Urx8MUhM2fpbvSupAGK5cH/FkeNfxesd5ardxYm008i2HZku1wDyREujUfiVm8gIZJ4MfcKN+SmvH/Gyca3VO8gD6S2Bfym1GpnohJ8aAfD24Cln4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UbNymfkX; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UbNymfkX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3FA1F1F00A3A;
	Mon,  7 Sep 2026 09:01:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788771685;
	bh=Lt4nlIuGr2FxfQolPX7cG+GfQkb7F+DkFeC+F7DrmTM=;
	h=From:Date:Subject:To:Cc;
	b=UbNymfkX8KDdY2a/fdnHNfgpBDjfT5z08fBgA+8uh6huc5QN6g0iwlFoenuQRv7R3
	 0cqDvSa6h/BNQP7usnOvSIyH/5pvCsF2yItuHIyzHAG+L9c/hINQkWcwyLihIKPC8M
	 bMH3KrTzShxvN+pP26bT52GysCyfPUIp+AMS+mFTKQjPySa2CUBHapG9jiINaeoDgB
	 WzYOzNKTbsZXRUvEzg8QuTaqc6ZZYIyYLAWpge6BoDEyZ1tS2sfIqbUUPXReQdhecI
	 JD68/vsbX0RdqN54+cvSUgsVGEeDt+DiuSNH1vApzxuzjayilrWUbT3rf0RctnhLEA
	 TxettPXpHXzrQ==
From: Konrad Dybcio <konradybcio@kernel.org>
Date: Mon, 07 Sep 2026 11:01:17 +0200
Subject: [PATCH] arm64: dts: qcom: x1e80100-medion-sprchrgd-14-s1: Drop NOP
 override
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260907-topic-medion_touchup-v1-1-10267ae55aae@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMWwqDMBCF4a3IPDcQI9jGrUgRHSd1CpqQiwjBv
 Zvaxw/O+TME8kwBuiqDp50D262gflSAy7h9SPBcDEqqVmr5FNE6RrHSXIZDtAmX5ISh2uhGqxe
 ihHJ1ngwfd7Z//x3S9CWMvxac5wXY584FeAAAAA==
X-Change-ID: 20260907-topic-medion_touchup-fe1f93928cc0
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788771681; l=1094;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=y3SDQsBfIkMjXsi51hGJUf8ud6ryoajNjkqk14IKJus=;
 b=OPY+QnyE7UnR9hg6QFI6eL0Y41jBElJ5w72NJat0IRmFBO8XkEIH9qfa/xVeCAQWs7a2IVa2Y
 Whr94efsXRrB2Fq4p5iDw9fLr+WBUjdRcn7hpO2PpC6Mmb7MiiApPIO
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Commit d12cd85a4ff4 ("arm64: dts: qcom: hamoa: Add sound DAI prefixes
for DP") took care of adding the prefixes for all Hamoa devices, drop
the unnecessary override.

Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/x1e80100-medion-sprchrgd-14-s1.dts | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/x1e80100-medion-sprchrgd-14-s1.dts b/arch/arm64/boot/dts/qcom/x1e80100-medion-sprchrgd-14-s1.dts
index 039f68807376..6d26d73c18fc 100644
--- a/arch/arm64/boot/dts/qcom/x1e80100-medion-sprchrgd-14-s1.dts
+++ b/arch/arm64/boot/dts/qcom/x1e80100-medion-sprchrgd-14-s1.dts
@@ -971,8 +971,6 @@ &mdss {
 };
 
 &mdss_dp0 {
-	sound-name-prefix = "DisplayPort0";
-
 	status = "okay";
 };
 
@@ -981,8 +979,6 @@ &mdss_dp0_out {
 };
 
 &mdss_dp2 {
-	sound-name-prefix = "DisplayPort2";
-
 	status = "okay";
 };
 

---
base-commit: 9d80aa4617b32f5054c5aa471d06b66704854935
change-id: 20260907-topic-medion_touchup-fe1f93928cc0

Best regards,
--  
Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

