Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E8913E3177;
	Sat,  5 Sep 2026 09:29:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788600558; cv=none; b=YyY8m+6XB7QRGWHZ2vlX7B7GZutu97zvJkcerWJgHgSS5c6fYCZldDTbhh6JK2aCZKF24J0FtfBigAHXudGWzNUEgOFiPbbtHRskYKEAiHYvCwlPoMIpwCeMVXXOMhOf5VefKzs8WGLsBLNTIWOntUPGAHD99+/Ap0Rz5VMY3vU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788600558; c=relaxed/simple;
	bh=+qytr/j630twvH1iyHjstSEfyt64Mm6Enh/EMMJrlhY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mpiJY31pa1BuM65JDYCzebeFvnqrlHdIgzko/zPjGJRibav67HDAp9njgbmmj3i2BrLh81QmJ/21T9UIW/d8s417/jqSxCTfzmOm4M0hnh9nSQiTWf80BJubhPeQzmPKkrAloneA92JAvsfs1oTDmyOOKniQr1WwxefoBkgC4HI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=C13ck7rM; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="C13ck7rM"
Received: by smtp.kernel.org (Postfix) with ESMTPS id DFC7DC4AF1C;
	Sat,  5 Sep 2026 09:29:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1788600557;
	bh=+qytr/j630twvH1iyHjstSEfyt64Mm6Enh/EMMJrlhY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=C13ck7rMDwYrj+bSXQ90vm5hnsfBS3ROKZrlN0IOMVVfHCFQTtZiBlnDqbI1XQiGx
	 oe01P4Wb6iVcDqqi4c1aMHuknmMF0defZFGk/xQ7WvWY2hctJ8hadXqgY5OjFHYuzV
	 Oy9pmDkKXR2pj8NG0MLG9EBKVhNoTBhxlkys/ZvNbUc1Hm6Et4NabxrcC67CMoytBr
	 QmqIwEUrfpWgK7tfIHUdDII0lh/BnXEB/1zU6CbC5u3+qAD41tVKeHHvNof/j3u7iB
	 B5llOWve0blYdmekFMK7G5FDJHfvpTYxw7BayOZQktQlvvh/GphaIcA1pbRgxA8xXl
	 qEnhzbGmMtXFg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD88CC624D3;
	Sat,  5 Sep 2026 09:29:17 +0000 (UTC)
From: Jens Glathe via B4 Relay <devnull+jens.glathe.oldschoolsolutions.biz@kernel.org>
Date: Sat, 05 Sep 2026 11:29:01 +0200
Subject: [PATCH 6/7] arm64: dts: qcom: ideacentre-mini: Wire up DP sound
 names and VA macro
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260905-x1-ideacentre-mini-prettify-v1-6-9a87882973bb@oldschoolsolutions.biz>
References: <20260905-x1-ideacentre-mini-prettify-v1-0-9a87882973bb@oldschoolsolutions.biz>
In-Reply-To: <20260905-x1-ideacentre-mini-prettify-v1-0-9a87882973bb@oldschoolsolutions.biz>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Jens Glathe <jens.glathe@oldschoolsolutions.biz>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788600555; l=1496;
 i=jens.glathe@oldschoolsolutions.biz; s=20240919;
 h=from:subject:message-id;
 bh=q0Klq8CCwMTL3nScIUXlwBoWcQQvy4wXunu4Khr0rQQ=;
 b=CeYlvvFJxoUQ8DkappLev9pCIMW7NeGVqZGEVMJNa9pd3Hw1dymUmif6pV12uoZx8y6CdSQtA
 bsV/OJt0exGC/IaNpHVwOYepSsjz8tGrbQ5uNWcfo9k3/EgMYSgG2z1
X-Developer-Key: i=jens.glathe@oldschoolsolutions.biz; a=ed25519;
 pk=JcRJqJc/y8LsxOlPakALD3juGfOKmFBWtO+GfELMJVg=
X-Endpoint-Received: by B4 Relay for
 jens.glathe@oldschoolsolutions.biz/20240919 with auth_id=216
X-Original-From: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
Reply-To: jens.glathe@oldschoolsolutions.biz

From: Jens Glathe <jens.glathe@oldschoolsolutions.biz>

mdss_dp0/1/2 had no sound-name-prefix, so the three DisplayPort
backends were not distinct DAIs on the card. Add the prefixes.

Enable the LPASS VA macro with the 2.4 MHz rate. This chassis has no
onboard DMICs; the node still provides the fsgen clock to tx_macro and
rx_macro. Without it both codecs fail to probe (-ENOENT).

Tested-on: IdeaCentre Mini 01Q8X10, Purwa (X1-26-100)

Assisted-by: Grok 4.5 (xAI)
Signed-off-by: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
---
 .../arm64/boot/dts/qcom/x1-lenovo-ideacentre-mini-01q8x10.dtsi | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/x1-lenovo-ideacentre-mini-01q8x10.dtsi b/arch/arm64/boot/dts/qcom/x1-lenovo-ideacentre-mini-01q8x10.dtsi
index 76a9f745b279d..5a2db91d5e587 100644
--- a/arch/arm64/boot/dts/qcom/x1-lenovo-ideacentre-mini-01q8x10.dtsi
+++ b/arch/arm64/boot/dts/qcom/x1-lenovo-ideacentre-mini-01q8x10.dtsi
@@ -665,6 +665,10 @@ eusb6_repeater: redriver@4f {
 	};
 };
 
+&lpass_vamacro {
+	qcom,dmic-sample-rate = <2400000>;
+};
+
 &gpu {
 	status = "okay";
 };
@@ -674,6 +678,8 @@ &mdss {
 };
 
 &mdss_dp0 {
+	sound-name-prefix = "DisplayPort0";
+
 	status = "okay";
 };
 
@@ -682,6 +688,8 @@ &mdss_dp0_out {
 };
 
 &mdss_dp1 {
+	sound-name-prefix = "DisplayPort1";
+
 	status = "okay";
 };
 
@@ -690,6 +698,8 @@ &mdss_dp1_out {
 };
 
 &mdss_dp2 {
+	sound-name-prefix = "DisplayPort2";
+
 	status = "okay";
 };
 

-- 
2.53.0


