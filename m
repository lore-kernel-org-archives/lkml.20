Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD31947DD59;
	Mon, 14 Sep 2026 14:19:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789395558; cv=none; b=AWxqnONe2+UEFXhIJ7D9TavvFUaNh+m63fuhqrV+6dcp5K6D2ePX9Jlq8iPGKg8C9K/bDrbOmHg/2CyY5/Ek9/EWj9id9TKxsENnDi57t8IIfhHIKNSFOTHg+a5atfIjk/Z+BDPzeHXa9Y7l0cKsEwOhw89NeTR5SQhjbywdyeA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789395558; c=relaxed/simple;
	bh=fKyld9t6D/FMJyIZs8tLQZezDPQ3bZZpyrpcFezMKXo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:
	 In-Reply-To:References:To:Cc; b=ob9GU/mOND9EDGCvl4+G+XJvmv/UY9RNIRF4xacWluhfJ9GPMqkJtzboNzGGX2mxvOczhGVygldhO3jnZvB3PNNsnDFhEOqRraC+cok+tUrl0N9PvytLfhC4xx7IbCk/ZxY11FowlNZzOSA8olqCbKIJ52J0MKqrWtesnqGNAks=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=b4HRqQr5; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="b4HRqQr5"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 2837AC2BCB8;
	Mon, 14 Sep 2026 14:19:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1789395558;
	bh=fKyld9t6D/FMJyIZs8tLQZezDPQ3bZZpyrpcFezMKXo=;
	h=From:Date:Subject:In-Reply-To:References:To:Cc:Reply-To:From;
	b=b4HRqQr5dnfbWzKQC9koLO2TXDaTa8LAvDcIRaVR2nzCExWTodohylpw6ORBxUVqZ
	 R1ljAi8UoN+EnhTiNAxAh3rPWJPfK0iVOPRKPsgTrAeYA1dT6XknSUY9vG5rtpu9Vs
	 RIyrrEQb0uGa4C6biF3T5Hi1lIQOXxCnS2XvfF2qFgMVJ0NUNqJQ4SBtK25FIKhtde
	 vlutklImIjj+i8JVaKw3cfoZtCzFLE8fVYF6sRWUkskBGWI7PuJDLZIYOk9JjsOObP
	 S7kJPXcUdoYEYQw5jPdZmqhbZ54Xf/njk8FR6pnrYVnKeKGKFqyYgsvIsZwYv6UFRU
	 d7hZkphHiFSqg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BFBBCC88E73;
	Mon, 14 Sep 2026 14:19:17 +0000 (UTC)
From: Avalon Vargas via B4 Relay <devnull+avalon.vargas.centeno.est.una.ac.cr@kernel.org>
Date: Mon, 14 Sep 2026 08:19:12 -0600
Subject: [PATCH v2] arm64: dts: qcom: Fix touchscreen address on Dell
 Inspiron 7441
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260914-dell7441-touchscreen-v2-1-7f7224c0cce5@est.una.ac.cr>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/4WOQQ6CMBBFr0K6tqStpaAr72FYTMsoNVhMpxAN4
 e5SPIDL92fm/VkYYfRI7FwsLOLsyY9hA3UomOsh3JH7bmOmhDLiJDXvcBhqrSVP4+R6chExcGO
 NEvKoG7CGbaeviDf/3rXX9sc02Qe6lF15wwIhtxGC63P0BEoY86D3lMb42R+aZRb86Z4ll7yrT
 5UWDips5AUplVOAElzpImvXdf0CiCOKQecAAAA=
X-Change-ID: 20260914-dell7441-touchscreen-6b6201348ab6
In-Reply-To: <20260914-dell7441-touchscreen-v1-1-d79540ca5e81@est.una.ac.cr>
References: <20260914-dell7441-touchscreen-v1-1-d79540ca5e81@est.una.ac.cr>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Val Packett <val@packett.cool>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Avalon Vargas <avalon.vargas.centeno@est.una.ac.cr>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789395556; l=2302;
 i=avalon.vargas.centeno@est.una.ac.cr; s=avalon-una-20260914;
 h=from:subject:message-id;
 bh=6gBsV7jPIMZCPp+JlhmXPksh2uvU1i6L1e9XqSDCAiw=;
 b=ZYH8yQrfacLkBtsncjtGdW8vXgGgPM/evxGnTyhkeXzbHgAKY/9UTIj1I0W1UN3ejqHJIVqHR
 F8PySNTN4CFBhYR11IRgw1vhN6xRakWDEwqcTGHwkKCQlkME7BDLwbf
X-Developer-Key: i=avalon.vargas.centeno@est.una.ac.cr; a=ed25519;
 pk=I7FZ301yhA9Jl2LReBEqv+9LUrd5zi397CIT2gTB6RE=
X-Endpoint-Received: by B4 Relay for
 avalon.vargas.centeno@est.una.ac.cr/avalon-una-20260914 with auth_id=1032
X-Original-From: Avalon Vargas <avalon.vargas.centeno@est.una.ac.cr>
Reply-To: avalon.vargas.centeno@est.una.ac.cr

From: Avalon Vargas <avalon.vargas.centeno@est.una.ac.cr>

The LXST2021 touchscreen on the tested Dell Inspiron 14 Plus 7441
responds at I2C address 0x09, while the device tree specifies 0x10.
Probing the latter fails with -ENXIO and no touchscreen input device
is registered.

Use address 0x09, matching the LXST2021 configuration on the related
Dell Latitude 7455. With this address, the controller identifies as
29BD:1103 and binds to hid-multitouch.

Signed-off-by: Avalon Vargas <avalon.vargas.centeno@est.una.ac.cr>
---
This replaces the earlier report-plus-diff with a patch submission.
Only one unit has been tested. I have no evidence of double-sourcing
or a working Inspiron touchscreen at 0x10; a typo remains possible.

touch input and suspend/resume. The native upstream patch has not yet
undergone a full kernel DTB build or dtbs_check.

Validation: Linux 7.2.4 plus the equivalent local DT overlay, physical
---
Changes in v2:
- Drop the testing details from the commit message as requested.
- Link to v1: https://patch.msgid.link/20260914-dell7441-touchscreen-v1-1-d79540ca5e81@est.una.ac.cr

To: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>
To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
---
 arch/arm64/boot/dts/qcom/x1e80100-dell-inspiron-14-plus-7441.dts | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/x1e80100-dell-inspiron-14-plus-7441.dts b/arch/arm64/boot/dts/qcom/x1e80100-dell-inspiron-14-plus-7441.dts
index 75e10d9..0cf5716 100644
--- a/arch/arm64/boot/dts/qcom/x1e80100-dell-inspiron-14-plus-7441.dts
+++ b/arch/arm64/boot/dts/qcom/x1e80100-dell-inspiron-14-plus-7441.dts
@@ -25,9 +25,10 @@ &gpu_zap_shader {
 };
 
 &i2c8 {
-	touchscreen@10 {
+	/* LXST2021 */
+	touchscreen@9 {
 		compatible = "hid-over-i2c";
-		reg = <0x10>;
+		reg = <0x09>;
 
 		hid-descr-addr = <0x1>;
 		interrupts-extended = <&tlmm 51 IRQ_TYPE_LEVEL_LOW>;

---
base-commit: 704340f1cd0dcef829eb62f5b48ae95a2ce17bdf
change-id: 20260914-dell7441-touchscreen-6b6201348ab6

Best regards,
--  
Avalon Vargas <avalon.vargas.centeno@est.una.ac.cr>


