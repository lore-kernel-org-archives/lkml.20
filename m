Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBB0044A40E;
	Mon, 14 Sep 2026 13:31:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789392661; cv=none; b=faaLyBhT8vTeGXxOGOImN/jFFIb1+hcZM1/JfBJz8qIsqTYxgRTYC1/82WPanww/wk/pTc0z9XXCPneOZVNJEK7f+a3zG5jffaQ0O2/A/VTrI3pIevpYcohwWnIt5YMVaFkDvp8fbqkChRcIwnY5hISc90Hd1wX1DSM/sucJXBg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789392661; c=relaxed/simple;
	bh=FZ93MFND4SZk1HkhbjKt6fLSIxoPV8LGoHAopPRUrH0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=rMgFuH8HT7O/2eKDDwBQ+fEV9EZe40Tmbnq67zQJDexTki+S1lkvf36ZkF3ccf7Rji7KbTEu9nlY9NAfm1cigpVXxKDZ9+J5IMeopNO6wwhmJc2MclnSBsUc1K58yksk+JooqCdt1FcAhUiO/8gPdDrv+PJts/kyFm+8oaUkk3Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=J00m7Nhg; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="J00m7Nhg"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 67BE9C2BCF5;
	Mon, 14 Sep 2026 13:31:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1789392661;
	bh=FZ93MFND4SZk1HkhbjKt6fLSIxoPV8LGoHAopPRUrH0=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=J00m7NhgRyXI+XMBNkxOggYYXeK5lmXV6TeNMOHvxYjKGkuHepuIkUaueDTV13o0N
	 Ao5sP1vj4XySZQL0ZYnKCkZhlbM50rN4q73xy+X65JStst4Y561QbWmmF0ORZ8D1Jb
	 qhftgzNP51MLYUxKTKMvEEY5F6feXFiG1LXLTRLZSxZL7V7XfCwvgdbPZkFIf21Qwj
	 vKW+ovafpj3lJ1eNyDzmahsq4fWPUMP6Ui/52aVPQ+bro7hp/XTQ01bmK1WqOvsYbK
	 lc/ZD+OppcuLZ3Pwj9ekL1AJ2qelF72zYFGiwRr0N6olLL2yTEWOLuIYxFpxTyyVO5
	 6sLZgtmAzBGbA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5285CC88E70;
	Mon, 14 Sep 2026 13:31:01 +0000 (UTC)
From: Avalon Vargas via B4 Relay <devnull+avalon.vargas.centeno.est.una.ac.cr@kernel.org>
Date: Mon, 14 Sep 2026 07:30:47 -0600
Subject: [PATCH] arm64: dts: qcom: Fix touchscreen address on Dell Inspiron
 7441
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260914-dell7441-touchscreen-v1-1-d79540ca5e81@est.una.ac.cr>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yWMyw7CIBBFf6WZtSSABB+/YlwAHWVMpWaGGpOm/
 y7o8tzcc1YQZEKB87AC45uE5tLA7AZIOZQ7Khobg9XW65NxasRpOjhnVJ2XlCUxYlE+eqvN3h1
 D9NDUF+ONPr/s5fpnWeIDU+2t/ohBUEUOJeU+PYNUZNi2Lxvirp6RAAAA
X-Change-ID: 20260914-dell7441-touchscreen-6b6201348ab6
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789392660; l=1937;
 i=avalon.vargas.centeno@est.una.ac.cr; s=avalon-una-20260914;
 h=from:subject:message-id;
 bh=cWKOXfSe8ZMCWag3Rxp781xh1Hgee6YPOPUmg88AEUg=;
 b=FayQ/FIpndcg5F9U82KQTUWBFChd9LE0wC09Rwqx5L/LbJmEocy1yRMpLDy6XxVvXCd7RqZO/
 e4kAxKsH227CfRIje3fiLIkNHHlW5RPRbbXXgsMdHh8llOfoxy/alhI
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
29BD:1103 and binds to hid-multitouch. Touch input and suspend/resume
have been verified on the affected Inspiron using Linux 7.2.4 with
the equivalent device-tree overlay.

Signed-off-by: Avalon Vargas <avalon.vargas.centeno@est.una.ac.cr>
---
This replaces the earlier report-plus-diff with a patch submission.
Only one unit has been tested. I have no evidence of double-sourcing
or a working Inspiron touchscreen at 0x10; a typo remains possible.

touch input and suspend/resume. The native upstream patch has not yet
undergone a full kernel DTB build or dtbs_check.

Validation: Linux 7.2.4 plus the equivalent local DT overlay, physical
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


