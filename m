Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CA873B95E9;
	Fri, 16 Oct 2026 19:37:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792179462; cv=none; b=nL7nyqGxcGs8b5/i3zFcMoCLy1QOfqO8oreg4wc8DFx74mSbjb1Mfpq4XXo5QxzunuQahsW9V6LNqbv4YHq/6nxONb0xPYgElEfIFoqvE2dKOGscEPRHxAyl18y2OxV7bf2vozDeT5DowhMUWyLH420fBeMGIPABWS/GjoCxOyY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792179462; c=relaxed/simple;
	bh=RAFhKdwU/ZLZZ4wlCCnNdhreSddlf7qDekDinE6g4aA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=CifQcELTtTHjFvF7koNoR1lXum7XnToofip+4ORfrK8swEqKdyj0LzVmOJImBBbC9xQ5MRmBfDQHWN5zaimWREXuJROGv0Kw+B+GEoTmX3Qcd6rgF4jRZwL3zImd8GjRC7U4i/u3zdO+6hCC9lug1d4jwepZi8LZCnlZEGOipe8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LX267mri; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LX267mri"
Received: by smtp.kernel.org (Postfix) with ESMTPS id E0012C2BCF5;
	Fri, 16 Oct 2026 19:37:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1792179462;
	bh=RAFhKdwU/ZLZZ4wlCCnNdhreSddlf7qDekDinE6g4aA=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=LX267mriyyLVVedgpNqnkUXj7lZS7YLLGVpCKGtC9ligGMgIBKfU+9dUCxXvE2tIf
	 ryiPCnhavYcRwPs4ggrAml9aRfkUrFd7ISbeWzeo74RgYMv53rQflYy4544ObGa8iB
	 +4h7gIDrpQo9E7wLAQLpQmtgCCmayMNAOtaM3UUYLO4GaqWbZ30fCqSTQywpH7vs3D
	 luI8511448wWgpyjiEMeV398gx2jWkiFSbGwdTjSEW2CVGMQLjPTQ2rJV6vHlcvf1i
	 FTiATz+d/MzwsqZvDpm4s2B0gI0Kog0ShIec1UdNIhqLge7WPdEFhiUM32XruL39JZ
	 KCiVqzJzBkiYQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA739CCF2C4;
	Fri, 16 Oct 2026 19:37:41 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Date: Fri, 16 Oct 2026 21:37:39 +0200
Subject: [PATCH] arm64: dts: qcom: sdm845-google: Configure qup_i2c2 pins
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261016-pixel3-i2c2-fix-v1-1-6a527d52c865@ixit.cz>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMQQqDMBCF4auEWTuQmUDQXqV0UeOoIyUNSVsE8
 e7GuvwevH+DIlmlwM1skOWnRd+xghoDYX7GSVCHamDLnix5TLrKy6FyYBx1RWc7ZqG2Jd9DfaU
 sdf4X74/L5dsvEj5nBvb9ABWz7ENzAAAA
X-Change-ID: 20261016-pixel3-i2c2-fix-30922e18816b
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Joel Selvaraj <foss@joelselvaraj.com>, 
 Vinod Koul <vkoul@kernel.org>, Amit Pundir <amit.pundir@linaro.org>
Cc: Sumit Semwal <sumit.semwal@linaro.org>, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 phone-devel@vger.kernel.org, Marco Mattiolo <marco.mattiolo@hotmail.it>, 
 David Heidelberg <david@ixit.cz>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1863; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=8F2FDAtyMGjBlCfXnVch0dchQePJ+YFwNeu8d37XgO0=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBq0n0Ejd6G2KZGoA5pQ/H8YhwgaKY6lt5YR78vk
 35DF/EHVAqJAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCatJ9BAAKCRBgAj/E00kg
 cn8OEACZ5vPBQ90lPLqneAwW0b9lvU/3btUX4VBUkbHDBDHSCoJMZ4yMiTPq9/6EiPT17yg95je
 VrEkfFZWpmC7s8YUd5uTEgVzFivHDhHGlm/gxhIFKrX1dlEUTsPRGn13m4kztbv6FDrVW5yFge/
 9B6iH6WD9+MKCeXZCaAs0acqp5pdyizySj14BA2KGtZyCfdEXdqOAXYDT8RqAbefTBuTc6nXKQZ
 iU2fpPDBV4G3Rq9QiKS8I3LrNku155wRgWwhBwS5w6neAgm2JqF4UN7egPUA9VrOdkt7zMKnmS1
 8zggGXujDwrVf0GzYNyciMO0Nr62aJ4zZbCAg4pEQpwNY0AZUm7bkoKraLLg5rOF/XVtq4CHDvv
 5F8SCL8FobVN5yobyE4xJS2CjGMI0QPswjc1AhyyRJ4cMIKP//hh4EmqjLHkXDjHTuhJLwqAS95
 9HjlwHfk7LHoQUgpDeAVHlQ/XCAn9WWkFMZ6l8d32mJcsS+skvqCf6OXh5b8VwfTB+Bd3TGcqMX
 wbk7kqw365OJ0dGvaMJdOz7IOmqQ1waexhAOpT2BcOPw3dHHWq75vinpjEDmi/+l8gGE81kGR8Q
 VQs+Cu/+hShwwgxUtXv3Z7o12tQIX9TaQ9/x6zHrwVMTeTWrNMRgmhqyKc8u8v+LquHaC0Rc4F2
 8h+cKqpenjnJkrg==
X-Developer-Key: i=david@ixit.cz; a=openpgp;
 fpr=D77A09CFEEDC2BBD53A7047460023FC4D3492072
X-Endpoint-Received: by B4 Relay for david@ixit.cz/default with auth_id=355
X-Original-From: David Heidelberg <david@ixit.cz>
Reply-To: david@ixit.cz

From: Marco Mattiolo <marco.mattiolo@hotmail.it>

Set drive strength and disable the pull on the touchscreen i2c pins by
amending the qup_i2c2_default state from sdm845.dtsi, as the other QUP
users on this board do, and drop the unused touchscreen_i2c_pins state
that duplicated the pins with the gpio function.

Fixes: a678adbf2d22 ("arm64: dts: qcom: Add support for Pixel 3 and Pixel 3 XL")
Suggested-by: David Heidelberg <david@ixit.cz>
Signed-off-by: Marco Mattiolo <marco.mattiolo@hotmail.it>
Signed-off-by: David Heidelberg <david@ixit.cz>
---
 arch/arm64/boot/dts/qcom/sdm845-google-common.dtsi | 12 +++++-------
 1 file changed, 5 insertions(+), 7 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-google-common.dtsi b/arch/arm64/boot/dts/qcom/sdm845-google-common.dtsi
index f1379857e2742..b019b57502a1a 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-google-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845-google-common.dtsi
@@ -459,16 +459,21 @@ &pmi8998_charger {
 &qupv3_id_0 {
 	status = "okay";
 };
 
 &qupv3_id_1 {
 	status = "okay";
 };
 
+&qup_i2c2_default {
+	drive-strength = <2>;
+	bias-disable;
+};
+
 &qup_uart9_rx {
 	drive-strength = <2>;
 	bias-pull-up;
 };
 
 &qup_uart9_tx {
 	drive-strength = <2>;
 	bias-disable;
@@ -510,23 +515,16 @@ touchscreen_reset: ts-reset-state {
 	};
 
 	touchscreen_pins: ts-pins-gpio-state {
 		pins = "gpio125";
 		function = "gpio";
 		drive-strength = <2>;
 		bias-disable;
 	};
-
-	touchscreen_i2c_pins: qup-i2c2-gpio-state {
-		pins = "gpio27", "gpio28";
-		function = "gpio";
-		drive-strength = <2>;
-		bias-disable;
-	};
 };
 
 &uart6 {
 	pinctrl-0 = <&qup_uart6_4pin>;
 
 	status = "okay";
 
 	bluetooth {

---
base-commit: 2efb7a11f1aa4d2dc285fe2680cca22cb9f72f64
change-id: 20261016-pixel3-i2c2-fix-30922e18816b

Best regards,
--  
David Heidelberg <david@ixit.cz>


