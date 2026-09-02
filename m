Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DF8D4A64E6
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 19:07:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788376051; cv=none; b=XrjzyeiTOGXbwrpBesF99SHWXDl1Snms29WzAm8plATsZ/ZLWtWLT24r69V9ZTvcPFX0PgOZ26JPqUxNqB/Uq5V9g46DGgnRrmxRHU+O+1i7xCbBJ3S3Ab0sKLmtYn83tp3Xglokkxrs8Qm5IkQFZBXg8asMTdmZiqY+6C4TN3c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788376051; c=relaxed/simple;
	bh=/GqE7tbYa2dWg0FxwYbCrxOWd45I2GVxpnOL6juTks4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=IutdcbJtE7flmVmz8pFkKYphRe+8roqk6+4a77gd/od2oZAGbtQ7F+b099VA1TiQGZSbzdlm1/57oRIGiL2JitOd7y3gJS20JYzihMYSZfPQQsjizEIrRsC82SL8YqRdc0rJQ5CIiAE5llWHEwYNJz3GR+O30YUsbli5mjwS12I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=G7ifNw4F; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="G7ifNw4F"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-484374f54d0so950883f8f.3
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 12:07:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788376047; x=1788980847; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=zwE2z/0B3pciqCcOK64iCEKBwjRy6GchQ2Bx4KSJSo8=;
        b=G7ifNw4FFa7dTgAGk8gfSlNcC+9QOPIoUvLBs2fu4cpOcDHQ69KI93kKDLzOUh/q1I
         ujN2HLAsEYQ3B+EtQDHC4gQBi9igQuF1Po8skDnt3w4TbbVImQBSd0+TzW35xy/uRumq
         mYiucOndnlTHN9k1A98z6lFk+/66VrgE3fUSDRxbToJY3IC5NatIosr8AitCc/cFbHeP
         gPfGVSo6XMX9+SDEuIRxuHaasVvrq+5+/JEH39KGA3oh8S8Iu8XRS00kKSWBd9jjwi2R
         6jVjbOI+dsrfumese3ktC8IotjLt5St4lFPk7A51b7FMQc4dIjM9Mnz0VmdX0HO2qiS1
         wOPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788376047; x=1788980847;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=zwE2z/0B3pciqCcOK64iCEKBwjRy6GchQ2Bx4KSJSo8=;
        b=qr9Ahc/u08QuhRSx3xcdlEtq/oNhRcyxgm5evpXF6T/fW3m6MYqrUi9wO0Dxyfgty/
         crSPklom87xPfufdfyLpWPACZqfscc6snGsM2hwFbPTzGLd2PqnK2tuCcVugYHpqCYBf
         Kuw3ddcN+4QytnTIG0Bb3R4nzgSTbDcYtUjuuILSNl/X6c6KaV9NwAiKRHbaLctKAsHy
         +1IHG2pCtV918XSSvXMPm+4CeuB+ZLca54dqTbFfwL3OrcMDz/RRL5iSnEra758jK6jp
         DNoWTx1+4/eLDfoOKTBbzhOC02WHewXyMmaYm5yS0CbKrVkYngQGvqakpii0o5WJrw+/
         WJzw==
X-Forwarded-Encrypted: i=1; AKwUvBzE3Xp21RkhXxa68YEzr6eESQM7kW8vQgGryAs8RDRH8EOcENrvjiuACRsHMwgm+TyhpAz8lhTIOsF90dM=@vger.kernel.org
X-Gm-Message-State: AFuF++k+9lfU02cYUYyxJtsDPv7P+bjHqyyLVJWtkBtTST2iiwiXU82c
	sokOwehPoXRt1bq2MhzOP85SJKeprhUhoTcaonRfzrdg+hE/QYmhEQV58nzcBaLt
X-Gm-Gg: AYBFou2qxF+lB99XxL4o+5HMq7lb+K6SExF7cONTslKXXWwV0yr+6hWMtarqGm2DBqh
	Qd2GtzLUov4rAYgY2+7l/n0II3Jne5TdqAPVHWqhy7U3C1A/uT8XwpYSsc3O0KFe9GsMPiXSVbS
	Bnj7SpCwaevUF6qB7MzxXgKyYlOyhLGiGIGc5ZYwWoWJ5ZwlBUgAtLIAVViaAkrP1S8UplyUJ3A
	lN4vqFzVr5S4dBEvDRHpS8H7O4YcDaELzUn71uBVy7nEkmsaTU0/w+lwPL9h0ZH1tv3O4MlI2xf
	nyNfCStNUA2KE0zdMl4UcTZpHhXKBVcN7Qp8ZXzzhrx5q+8lKx5flXk/lWU1Mq80pgJaK/LoH2g
	oQGiSZf2YBM5P6Kfw9ssfYu1Fbt9A6XrpKC0nJQQRclOfNXEh0VyJ7SvntlZ5eWfCDfht6ACVp7
	IORi4+GO219xEWpVRG7ag3wnKtPrrmbU4EVofu8A8Q9nV8ULheXOhBjc8oqB9sHDKLZo8G5UYFh
	b1mOsCgLFarf4SSGlBgRJdMFRR+
X-Received: by 2002:a05:6000:491a:b0:482:ea08:8c97 with SMTP id ffacd0b85a97d-48488e0392dmr13325516f8f.2.1788376047145;
        Wed, 02 Sep 2026 12:07:27 -0700 (PDT)
Received: from [192.168.1.9] ([148.252.128.8])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48448e80388sm9518927f8f.14.2026.09.02.12.07.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 12:07:26 -0700 (PDT)
From: Dale Whinham <daleyo@gmail.com>
Date: Wed, 02 Sep 2026 20:07:16 +0100
Subject: [PATCH v3] arm64: dts: qcom: x1-denali: Add volume up/down GPIO
 keys
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260902-surface-pro-11-volume-buttons-v3-1-9d41987bcd75@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/43OQQ6CMBAF0KuQrh3TloLgynsYF7QMUAOUtNBoC
 He3xYXudPkzP+/PShxajY6ck5VY9NppM4aQHhKiumpsEXQdMuGU57TgJbjFNpVCmKwBxsCbfhk
 Q5DLPZnTQCCko8kyhkiQYk8VGP3b/entnt8g7qjmisdFpNxv73B/wLPb+3fIMGIRzVpSpSKu8u
 LRDpfujMgOJW55/tJLyXxoPGquDpU4yE4J+a9u2vQBGFsCFKgEAAA==
X-Change-ID: 20260829-surface-pro-11-volume-buttons-f4b40e25cecb
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 =?utf-8?q?J=C3=A9r=C3=B4me_de_Bretagne?= <jerome.debretagne@gmail.com>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Abel Vesa <abel.vesa@oss.qualcomm.com>, Dale Whinham <daleyo@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788376045; l=3391;
 i=daleyo@gmail.com; s=20251214; h=from:subject:message-id;
 bh=/GqE7tbYa2dWg0FxwYbCrxOWd45I2GVxpnOL6juTks4=;
 b=/L/FiUEdcMYd8AUfzRtemoMmvDtSWlNwWBtH0gnIoq5ej1LFSXauNVyUtRw4Hlr8kOMBuzEzI
 ELrUwGmIu+GBG2kBrkHsac8kpBUlrrh7+fjgsCYCYQX0r+Eosyuz6PI
X-Developer-Key: i=daleyo@gmail.com; a=ed25519;
 pk=M4mvgx1TB2TniKaedTDsO3PbLKgFosJuegXRXPbn2Ds=

Configure gpio6 and gpio8 as volume up and volume down respectively, to
enable the volume rocker located at the top of the screen.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Signed-off-by: Dale Whinham <daleyo@gmail.com>
---
Note: the DTS coding style says properties within a group shall use
natural sort order by name, which for the new pin state nodes would give
bias-pull-up, function, input-enable, pins, power-source. I've instead
led with pins and function, matching every other pin configuration group
in the x1* device trees. Happy to switch to the strict natural sort if
that's preferred.
---
Changes in v3:
- Sort the child nodes of gpio-keys alphabetically by name, and re-order
  the pinctrl-0 entries to match (Konrad, DTS style guide).
- Re-order the properties within the new pin state nodes to lead with
  pins and function, matching the other x1* pin state nodes.
- Link to v2: https://patch.msgid.link/20260902-surface-pro-11-volume-buttons-v2-1-1d893c7b5440@gmail.com

Changes in v2:
- Sort the new pin configuration nodes by controller and GPIO number (Konrad)
- Link to v1: https://patch.msgid.link/20260829-surface-pro-11-volume-buttons-v1-1-ace589343a68@gmail.com

To: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>
To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
---
 arch/arm64/boot/dts/qcom/x1-microsoft-denali.dtsi | 36 ++++++++++++++++++++++-
 1 file changed, 35 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/x1-microsoft-denali.dtsi b/arch/arm64/boot/dts/qcom/x1-microsoft-denali.dtsi
index 7559557610ed..c14a1b9b1130 100644
--- a/arch/arm64/boot/dts/qcom/x1-microsoft-denali.dtsi
+++ b/arch/arm64/boot/dts/qcom/x1-microsoft-denali.dtsi
@@ -20,9 +20,27 @@ aliases {
 	gpio-keys {
 		compatible = "gpio-keys";
 
-		pinctrl-0 = <&hall_int_n_default>;
+		pinctrl-0 = <&vol_down_n>, <&vol_up_n>, <&hall_int_n_default>;
 		pinctrl-names = "default";
 
+		key-vol-down {
+			debounce-interval = <15>;
+			gpios = <&pm8550_gpios 8 GPIO_ACTIVE_LOW>;
+			label = "Volume Down";
+			linux,can-disable;
+			linux,code = <KEY_VOLUMEDOWN>;
+			wakeup-source;
+		};
+
+		key-vol-up {
+			debounce-interval = <15>;
+			gpios = <&pm8550_gpios 6 GPIO_ACTIVE_LOW>;
+			label = "Volume Up";
+			linux,can-disable;
+			linux,code = <KEY_VOLUMEUP>;
+			wakeup-source;
+		};
+
 		switch-lid {
 			gpios = <&tlmm 2 GPIO_ACTIVE_LOW>;
 			linux,input-type = <EV_SW>;
@@ -984,6 +1002,22 @@ &pcie6a_port0 {
 };
 
 &pm8550_gpios {
+	vol_up_n: vol-up-n-state {
+		pins = "gpio6";
+		function = "normal";
+		bias-pull-up;
+		input-enable;
+		power-source = <1>; /* 1.8V */
+	};
+
+	vol_down_n: vol-down-n-state {
+		pins = "gpio8";
+		function = "normal";
+		bias-pull-up;
+		input-enable;
+		power-source = <1>; /* 1.8V */
+	};
+
 	rtmr0_default: rtmr0-reset-n-active-state {
 		pins = "gpio10";
 		function = "normal";

---
base-commit: 8d3ae59288f1e7d58d76558a6ee96d533bc5019f
change-id: 20260829-surface-pro-11-volume-buttons-f4b40e25cecb

Best regards,
--  
Dale Whinham <daleyo@gmail.com>

