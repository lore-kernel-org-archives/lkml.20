Received: from adishatz.org (ns314768.ip-37-187-26.eu [37.187.26.192])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8491449F132;
	Tue, 22 Sep 2026 19:49:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=37.187.26.192
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790106551; cv=none; b=Cs0J2P1/4O2cpJXbpFT/Zzy59oz3kaOvhrEnQMcSdMFR8xbxAa0LlfPh8H7tkvym5BLc1V2QO0frvjrWJrRGr1F3UGFp9MyGlLrBwgD8CEzwq8MHCslaBfn/wwTXWCPDsUL2SS8PA1MhuSquV93RWUQ/FiJLRM+Ufqm+ySJP4fI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790106551; c=relaxed/simple;
	bh=YoEEUuRI6691UX/tIKQx9uNVNJ9B7AcQkU1ymq7HQ0s=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=YTHvasWQAoyTXset1Z59k1iWShyE4oSI4P5Ze3wAHSpkqAN0wnArY9qFhEG1rVVJlq9VcdLXjpT7SNC5cq2CnipJ2LoKihauxOLrMNLx7iU2rluUVCqNcB3NEvDd3f7NUy5qPh5jYc3qWFdBgG4ft1Om+JotSn9NQSjEdf6fXEo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=adishatz.org; spf=pass smtp.mailfrom=adishatz.org; dkim=pass (2048-bit key) header.d=adishatz.org header.i=@adishatz.org header.b=R+Xtgodc; arc=none smtp.client-ip=37.187.26.192
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=adishatz.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=adishatz.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=adishatz.org header.i=@adishatz.org header.b="R+Xtgodc"
Received: from [192.168.1.197] (88-165-227-194.subs.proxad.net [88.165.227.194])
	by adishatz.org (Postfix) with ESMTPSA id C97C74C022F;
	Tue, 22 Sep 2026 21:48:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=adishatz.org;
	s=mail; t=1790106505;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=1jv40DTBjObGb5Uny3NuOxw9UrYwrYBzV7l9G7nolcI=;
	b=R+XtgodccYINOViyDbCnZjP2Tq/8H3fk3s8VRNip7pylld1ohYxJMJ7NZM8rIPf3j0etnS
	ob528SSS61HfSgK5ezRQkLdagjhZ+rAg1FNWVcQrCZAci81YcSyusio5pb9KrgR08wm+mV
	ErzEdyuurufZOi4cw2cFmAAYHKXBd1mLVvmEgXGHTpof5zyd29AcVqUDMZ5d2rrFj4o0+x
	Fk+7QwnoLpOKpTs0BwUHMKkSm7i3N0SrZYiVFSsN+cus7u+kIXEd1tZ78+AFXDy034v7rV
	3IcEn06D7c1jC3geD2NpX+s/5My1FcFxvQPuK34o0ks0pTwkkopzxNQ71Nn0uQ==
Authentication-Results: ORIGINATING;
	auth=pass smtp.auth=cedric.bellegarde smtp.mailfrom=cedric.bellegarde@adishatz.org
From: =?utf-8?q?C=C3=A9dric_Bellegarde?= <cedric.bellegarde@adishatz.org>
Date: Tue, 22 Sep 2026 21:48:13 +0200
Subject: [PATCH] arm64: dts: qcom: sdm845-oneplus-common: Configure MBHC
 thresholds
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260922-mbhc-v1-1-bd123e7fb899@adishatz.org>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDSyMj3dykjGRdYxMjQxOLJOO0FNMkJaDSgqLUtMwKsDHRsbW1AFOmKzB
 WAAAA
X-Change-ID: 20260922-mbhc-342148b3fd5b
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org, 
 =?utf-8?q?C=C3=A9dric_Bellegarde?= <cedric.bellegarde@adishatz.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790106497; l=1147;
 i=cedric.bellegarde@adishatz.org; s=20260922; h=from:subject:message-id;
 bh=YoEEUuRI6691UX/tIKQx9uNVNJ9B7AcQkU1ymq7HQ0s=;
 b=Gmul3B8QsYq1Oh//v8sU1nvAHFDNQmfcl8w5zAdcLWKtS2LlUoxcsH/AXIBx2+x2zxsFNlGkp
 KqLAJrRG7kmAaIo8UPsbBbHJr+CsktorfyL9bwnMfARPCrIMKIJ8for
X-Developer-Key: i=cedric.bellegarde@adishatz.org; a=ed25519;
 pk=CV2g510IJ+UwW/Jd9MIio7NF2st3gLrxcN5YzVnMuMA=

Configure the Multi-Button Headset Control (MBHC) thresholds for the
WCD9340 audio codec to match the vendor downstream calibration.

Signed-off-by: Cédric Bellegarde <cedric.bellegarde@adishatz.org>
---
 arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi b/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi
index 439779f308e3..8a99c3f55bf6 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi
@@ -1099,6 +1099,10 @@ &wcd9340 {
 	vdd-tx-supply = <&vreg_s4a_1p8>;
 	vdd-rx-supply = <&vreg_s4a_1p8>;
 	vdd-io-supply = <&vreg_s4a_1p8>;
+	qcom,mbhc-buttons-vthreshold-microvolt = <75000 150000 237000 500000
+						  500000 500000 500000 500000>;
+	qcom,mbhc-headset-vthreshold-microvolt = <1700000>;
+	qcom,mbhc-headphone-vthreshold-microvolt = <50000>;
 };
 
 &wifi {

---
base-commit: fe2ec83746e501645709761605c2464a44fd2929
change-id: 20260922-mbhc-342148b3fd5b

Best regards,
-- 
Cédric Bellegarde <cedric.bellegarde@adishatz.org>

