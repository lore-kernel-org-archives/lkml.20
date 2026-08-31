Received: from smtpbgau2.qq.com (smtpbgau2.qq.com [54.206.34.216])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EA9239D3FC;
	Mon, 31 Aug 2026 10:19:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.206.34.216
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788171576; cv=none; b=fx1I54LVgzLxhjn14+DQweZ9jxkcrd8p09kpPE6VnnAimvAYiz0AlyatAj3r//SY+svgSVqMYv4lQU4yNT8DnkQP/FlCiYsPnUexwZrke+pWDkZ/2f1pV/0OlrUVzwTACZ4wJfdeJqT1ohifE/GhkouiXiMEYIiaTSL+10CfGI8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788171576; c=relaxed/simple;
	bh=e77Wo0ufNuFz/vOZ1pFDGlRG9L+yE0VFWrqX3lvVwdQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=rxFuV7A/Zp8OTKeYMCggPNtqPYyjP1qCfbT1X4Ju3TpFz3ulooKhsDv/VS5fqnPaTxeh3iArWp7pV+w1hkStuTbyXizJt831F0h2ganN9bdFiE9hI6GMCTgFspFgcut5rZRdPk/snuBE0UmwTeYMG5vRwUC3BiSiu2KmxtFXObE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=radxa.com; spf=pass smtp.mailfrom=radxa.com; arc=none smtp.client-ip=54.206.34.216
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=radxa.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=radxa.com
X-QQ-mid: zesmtpip4t1788171549t42981cf8
X-QQ-Originating-IP: 82v4pSrQiTwhlzJSrSxk98GTfl6F3C0TdjDxtZgeStU=
Received: from [192.168.30.32] ( [localhost])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Mon, 31 Aug 2026 18:19:06 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 17464348635550385603
EX-QQ-RecipientCnt: 9
From: Xilin Wu <sophon@radxa.com>
Date: Mon, 31 Aug 2026 18:19:06 +0800
Subject: [PATCH v2] arm64: dts: qcom: sc8280xp: Add more thermal zones
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260831-sc8280xp-thermal-zones-v2-1-8c2b89b4c9c5@radxa.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/4WNQQ6CMBBFr0Jm7Zi2gIAr72FYtGWUGmlJBwlKu
 LuAB3D5kvffn4EpOmI4JzNEGh274FdQhwRsq/2d0DUrgxLqJHJRINtSlWLqcWgpdvqJn+CJUWV
 FZo0SWhYa1nEf6eamPXytf8wv8yA7bLXNaB0PIb7351Fu3t+TUaLANG2ytMqNNFRdom4mfbShg
 3pZli8g2APlzgAAAA==
X-Change-ID: 20260507-sc8280xp-thermal-zones-2474cb20a17a
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Xilin Wu <sophon@radxa.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=12436; i=sophon@radxa.com;
 h=from:subject:message-id; bh=e77Wo0ufNuFz/vOZ1pFDGlRG9L+yE0VFWrqX3lvVwdQ=;
 b=owGbwMvMwCVmdFg0fe08Iz/G02pJDFlTQ6UffzYK5PJ+WOY648iN+jMxRvcP2pivKHS5ZSu/I
 rE9w6ygo5SFQYyLQVZMkUUhnmEue2XutadipXowc1iZQIYwcHEKwERmBjEy7BP97HfOfs9zQyHj
 p5LP8m+w3twkkuyhdfMX4wqujvCVHYwMH75GmKi2Pzqu8vH/81Y/k6smbyYU/TIrqqs5Mav/ShU
 vFwA=
X-Developer-Key: i=sophon@radxa.com; a=openpgp;
 fpr=205F009D07796DD6E516752E32C31567AD9E324E
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpip:radxa.com:qybglogicsvrsz:qybglogicsvrsz3b-0
X-QQ-XMAILINFO: Mdc3TkmnJyI/2MGg9btL7c29AyyiL+Ds7bIDEgkD9TGuCnoe2NST1Q3Q
	A4RvPivLOPD9e9IsCbLZTlZcKpEpLwz1FS5t+Hipt4Vvig9xDx0bSDpNjS54YEmr6dCSo5w
	d3Xsk7s1h7uRGmOK42wf02Ni4G+hDlLy+QTjroY3ChgVP8AQYAMvs0uCwNJrh73LH2G3XRX
	vda+gDPZ5w7ub5sofqYk9lV7sjVBjgR5OEocRuId+UzzcNG0aXrxb2+Bmqf3QNEHlWwfwpt
	PSuWlfWwa1q0P3nVQc9c9st++n+XCLYAz1IaxG8kuN4Hx3yuY14SD6Oz9gG/y5cn9Ym346t
	t1NZuJ2bPvFLm9w1brC7uLc2otM8eZHwT+2EhCYucPIi0Tioql07YRxWionqixmf5dKRgpB
	SuexUPl/vR8DYho/DJf6CPBQTq+kL5srTNr10d7iwOXmZb7G/q8OIUApmgJy4Cs0LimfLmd
	pXZcuwd/koSJQytyO2NzmHX4eVuXqr4zUT6fI7pjeztTbQ4UXhxzN4fVb2lelEBLY8Cnrd0
	nOSBrmljGK5Hz+iBfYBjkXbk2pyFEQixdxNylDo9y95ZolD0ieHJJqGUaDm9JlkaXAZo5m4
	cyC3vl5R8OrJFBzvFQjKsXOdVNqeOpimweql6/Iiks/QB9RlncRXKOoy9g10//Gv2RIngtL
	883zn74aq73QvzQ+1wIZIIZMydvoDEBv/l+FwhKJl7D78PJY2dd9cZdIQq91R13tvCAN1VD
	yTdCO6O1anQ7tyHE9evhYWbfqiJB+INQOvI5LFHc6HdlLdmy/GjzLr9Q+gazLJWMs/gRrRh
	FZUW2s/ZUO8TyJ/JOt91cHiAuYDby1IRF9TH4lgXtB62yHrRBY3/Ez49uy4kzy1CRyqdBjS
	AMIaNQoBNqV5ozko/DnHvviF5lcjdC84miKFbOjNP5UFxxFu2Y7vvl1rNGEt6F/OfxeTzLa
	EWr4mW+qwohTeXyoD5K1ybwOZETltnReUoj5hV/JuxJ/K1/JcwVi1kNrx4PyrTpXgdc/G5J
	Uxhc0S12kN+cTtgZIAeAuiKjNQBnk/9M4djrz3Ig==
X-QQ-XMRINFO: NI4Ajvh11aEjEMj13RCX7UuhPEoou2bs1g==
X-QQ-RECHKSPAM: 0

The SC8280XP contains a lot of TSENS sensors which are not yet described.
Add the thermal zones for them.

Signed-off-by: Xilin Wu <sophon@radxa.com>
---
Changes in v2:
- Rebased onto next-20260828
- Dropped applied patch 1
- Add missing NSP1 thermal zones and rename CPUSS and DDRSS thermal zones.
- Link to v1: https://patch.msgid.link/20260507-sc8280xp-thermal-zones-v1-0-33d4395b1be9@radxa.com

To: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>
To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
---
 arch/arm64/boot/dts/qcom/sc8280xp.dtsi | 551 ++++++++++++++++++++++++++++++++-
 1 file changed, 538 insertions(+), 13 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sc8280xp.dtsi b/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
index fbcfd3883bbb..880570d0a41c 100644
--- a/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
@@ -7084,7 +7084,19 @@ sound: sound {
 	};
 
 	thermal-zones {
-		cpu0-thermal {
+		aoss-0-thermal {
+			thermal-sensors = <&tsens0 0>;
+
+			trips {
+				aoss-critical {
+					temperature = <110000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		cpu0-0-thermal {
 			thermal-sensors = <&tsens0 1>;
 
 			trips {
@@ -7096,7 +7108,7 @@ cpu-crit {
 			};
 		};
 
-		cpu1-thermal {
+		cpu1-0-thermal {
 			thermal-sensors = <&tsens0 2>;
 
 			trips {
@@ -7108,7 +7120,7 @@ cpu-crit {
 			};
 		};
 
-		cpu2-thermal {
+		cpu2-0-thermal {
 			thermal-sensors = <&tsens0 3>;
 
 			trips {
@@ -7120,7 +7132,7 @@ cpu-crit {
 			};
 		};
 
-		cpu3-thermal {
+		cpu3-0-thermal {
 			thermal-sensors = <&tsens0 4>;
 
 			trips {
@@ -7132,7 +7144,7 @@ cpu-crit {
 			};
 		};
 
-		cpu4-thermal {
+		cpu4-0-thermal {
 			thermal-sensors = <&tsens0 5>;
 
 			trips {
@@ -7144,7 +7156,7 @@ cpu-crit {
 			};
 		};
 
-		cpu5-thermal {
+		cpu5-0-thermal {
 			thermal-sensors = <&tsens0 6>;
 
 			trips {
@@ -7156,7 +7168,7 @@ cpu-crit {
 			};
 		};
 
-		cpu6-thermal {
+		cpu6-0-thermal {
 			thermal-sensors = <&tsens0 7>;
 
 			trips {
@@ -7168,7 +7180,7 @@ cpu-crit {
 			};
 		};
 
-		cpu7-thermal {
+		cpu7-0-thermal {
 			thermal-sensors = <&tsens0 8>;
 
 			trips {
@@ -7180,7 +7192,7 @@ cpu-crit {
 			};
 		};
 
-		cluster0-thermal {
+		cpuss0-thermal {
 			thermal-sensors = <&tsens0 9>;
 
 			trips {
@@ -7192,10 +7204,262 @@ cpu-crit {
 			};
 		};
 
-		gpu-thermal {
+		nsp0-0-thermal {
+			thermal-sensors = <&tsens0 10>;
+
+			trips {
+				nsp0-crit {
+					temperature = <110000>;
+					hysteresis = <1000>;
+					type = "critical";
+				};
+			};
+		};
+
+		nsp1-0-thermal {
+			thermal-sensors = <&tsens0 11>;
+
+			trips {
+				nsp1-crit {
+					temperature = <110000>;
+					hysteresis = <1000>;
+					type = "critical";
+				};
+			};
+		};
+
+		smss-0-thermal {
+			thermal-sensors = <&tsens0 12>;
+
+			trips {
+				smss-crit {
+					temperature = <110000>;
+					hysteresis = <1000>;
+					type = "critical";
+				};
+			};
+		};
+
+		camss-0-thermal {
+			thermal-sensors = <&tsens0 13>;
+
+			trips {
+				camss-crit {
+					temperature = <110000>;
+					hysteresis = <1000>;
+					type = "critical";
+				};
+			};
+		};
+
+		aoss-1-thermal {
+			thermal-sensors = <&tsens1 0>;
+
+			trips {
+				aoss-critical {
+					temperature = <110000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		cpu0-1-thermal {
+			thermal-sensors = <&tsens1 1>;
+
+			trips {
+				cpu-crit {
+					temperature = <110000>;
+					hysteresis = <1000>;
+					type = "critical";
+				};
+			};
+		};
+
+		cpu1-1-thermal {
+			thermal-sensors = <&tsens1 2>;
+
+			trips {
+				cpu-crit {
+					temperature = <110000>;
+					hysteresis = <1000>;
+					type = "critical";
+				};
+			};
+		};
+
+		cpu2-1-thermal {
+			thermal-sensors = <&tsens1 3>;
+
+			trips {
+				cpu-crit {
+					temperature = <110000>;
+					hysteresis = <1000>;
+					type = "critical";
+				};
+			};
+		};
+
+		cpu3-1-thermal {
+			thermal-sensors = <&tsens1 4>;
+
+			trips {
+				cpu-crit {
+					temperature = <110000>;
+					hysteresis = <1000>;
+					type = "critical";
+				};
+			};
+		};
+
+		cpu4-1-thermal {
+			thermal-sensors = <&tsens1 5>;
+
+			trips {
+				cpu-crit {
+					temperature = <110000>;
+					hysteresis = <1000>;
+					type = "critical";
+				};
+			};
+		};
+
+		cpu5-1-thermal {
+			thermal-sensors = <&tsens1 6>;
+
+			trips {
+				cpu-crit {
+					temperature = <110000>;
+					hysteresis = <1000>;
+					type = "critical";
+				};
+			};
+		};
+
+		cpu6-1-thermal {
+			thermal-sensors = <&tsens1 7>;
+
+			trips {
+				cpu-crit {
+					temperature = <110000>;
+					hysteresis = <1000>;
+					type = "critical";
+				};
+			};
+		};
+
+		cpu7-1-thermal {
+			thermal-sensors = <&tsens1 8>;
+
+			trips {
+				cpu-crit {
+					temperature = <110000>;
+					hysteresis = <1000>;
+					type = "critical";
+				};
+			};
+		};
+
+		cpuss1-thermal {
+			thermal-sensors = <&tsens1 9>;
+
+			trips {
+				cpu-crit {
+					temperature = <110000>;
+					hysteresis = <1000>;
+					type = "critical";
+				};
+			};
+		};
+
+		nsp0-2-thermal {
+			thermal-sensors = <&tsens1 10>;
+
+			trips {
+				nsp0-crit {
+					temperature = <110000>;
+					hysteresis = <1000>;
+					type = "critical";
+				};
+			};
+		};
+
+		nsp1-2-thermal {
+			thermal-sensors = <&tsens1 11>;
+
+			trips {
+				nsp1-crit {
+					temperature = <110000>;
+					hysteresis = <1000>;
+					type = "critical";
+				};
+			};
+		};
+
+		smss-1-thermal {
+			thermal-sensors = <&tsens1 12>;
+
+			trips {
+				smss-crit {
+					temperature = <110000>;
+					hysteresis = <1000>;
+					type = "critical";
+				};
+			};
+		};
+
+		camss-1-thermal {
+			thermal-sensors = <&tsens1 13>;
+
+			trips {
+				camss-crit {
+					temperature = <110000>;
+					hysteresis = <1000>;
+					type = "critical";
+				};
+			};
+		};
+
+		pcie-0-thermal {
+			thermal-sensors = <&tsens1 14>;
+
+			trips {
+				pcie-crit {
+					temperature = <110000>;
+					hysteresis = <1000>;
+					type = "critical";
+				};
+			};
+		};
+
+		ddrss-0-thermal {
+			thermal-sensors = <&tsens1 15>;
+
+			trips {
+				trip-point0 {
+					temperature = <90000>;
+					hysteresis = <2000>;
+					type = "hot";
+				};
+			};
+		};
+
+		aoss-2-thermal {
+			thermal-sensors = <&tsens2 0>;
+
+			trips {
+				aoss-critical {
+					temperature = <110000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		gpuss-0-thermal {
 			polling-delay-passive = <250>;
 
-			thermal-sensors = <&tsens2 2>;
+			thermal-sensors = <&tsens2 1>;
 
 			cooling-maps {
 				map0 {
@@ -7219,8 +7483,101 @@ trip-point1 {
 			};
 		};
 
-		mem-thermal {
-			thermal-sensors = <&tsens1 15>;
+		gpuss-1-thermal {
+			polling-delay-passive = <250>;
+
+			thermal-sensors = <&tsens2 2>;
+
+			cooling-maps {
+				map0 {
+					trip = <&gpu_alert1>;
+					cooling-device = <&gpu THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+				};
+			};
+
+			trips {
+				gpu_alert1: trip-point0 {
+					temperature = <85000>;
+					hysteresis = <1000>;
+					type = "passive";
+				};
+
+				trip-point1 {
+					temperature = <110000>;
+					hysteresis = <1000>;
+					type = "critical";
+				};
+			};
+		};
+
+		gpuss-2-thermal {
+			polling-delay-passive = <250>;
+
+			thermal-sensors = <&tsens2 3>;
+
+			cooling-maps {
+				map0 {
+					trip = <&gpu_alert2>;
+					cooling-device = <&gpu THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+				};
+			};
+
+			trips {
+				gpu_alert2: trip-point0 {
+					temperature = <85000>;
+					hysteresis = <1000>;
+					type = "passive";
+				};
+
+				trip-point1 {
+					temperature = <110000>;
+					hysteresis = <1000>;
+					type = "critical";
+				};
+			};
+		};
+
+		gpuss-3-thermal {
+			polling-delay-passive = <250>;
+
+			thermal-sensors = <&tsens2 4>;
+
+			cooling-maps {
+				map0 {
+					trip = <&gpu_alert3>;
+					cooling-device = <&gpu THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+				};
+			};
+
+			trips {
+				gpu_alert3: trip-point0 {
+					temperature = <85000>;
+					hysteresis = <1000>;
+					type = "passive";
+				};
+
+				trip-point1 {
+					temperature = <110000>;
+					hysteresis = <1000>;
+					type = "critical";
+				};
+			};
+		};
+
+		pcie-1-thermal {
+			thermal-sensors = <&tsens2 5>;
+
+			trips {
+				pcie-crit {
+					temperature = <110000>;
+					hysteresis = <1000>;
+					type = "critical";
+				};
+			};
+		};
+
+		ddrss-1-thermal {
+			thermal-sensors = <&tsens2 6>;
 
 			trips {
 				trip-point0 {
@@ -7230,6 +7587,174 @@ trip-point0 {
 				};
 			};
 		};
+
+		audio-thermal {
+			thermal-sensors = <&tsens2 7>;
+
+			trips {
+				audio-crit {
+					temperature = <110000>;
+					hysteresis = <1000>;
+					type = "critical";
+				};
+			};
+		};
+
+		video-thermal {
+			thermal-sensors = <&tsens2 8>;
+
+			trips {
+				video-crit {
+					temperature = <110000>;
+					hysteresis = <1000>;
+					type = "critical";
+				};
+			};
+		};
+
+		nsp0-1-thermal {
+			thermal-sensors = <&tsens2 9>;
+
+			trips {
+				nsp0-crit {
+					temperature = <110000>;
+					hysteresis = <1000>;
+					type = "critical";
+				};
+			};
+		};
+
+		nsp1-1-thermal {
+			thermal-sensors = <&tsens2 10>;
+
+			trips {
+				nsp1-crit {
+					temperature = <110000>;
+					hysteresis = <1000>;
+					type = "critical";
+				};
+			};
+		};
+
+		aoss-3-thermal {
+			thermal-sensors = <&tsens3 0>;
+
+			trips {
+				aoss-critical {
+					temperature = <110000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		gpuss-4-thermal {
+			polling-delay-passive = <250>;
+
+			thermal-sensors = <&tsens3 1>;
+
+			cooling-maps {
+				map0 {
+					trip = <&gpu_alert4>;
+					cooling-device = <&gpu THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+				};
+			};
+
+			trips {
+				gpu_alert4: trip-point0 {
+					temperature = <85000>;
+					hysteresis = <1000>;
+					type = "passive";
+				};
+
+				trip-point1 {
+					temperature = <110000>;
+					hysteresis = <1000>;
+					type = "critical";
+				};
+			};
+		};
+
+		gpuss-5-thermal {
+			polling-delay-passive = <250>;
+
+			thermal-sensors = <&tsens3 2>;
+
+			cooling-maps {
+				map0 {
+					trip = <&gpu_alert5>;
+					cooling-device = <&gpu THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+				};
+			};
+
+			trips {
+				gpu_alert5: trip-point0 {
+					temperature = <85000>;
+					hysteresis = <1000>;
+					type = "passive";
+				};
+
+				trip-point1 {
+					temperature = <110000>;
+					hysteresis = <1000>;
+					type = "critical";
+				};
+			};
+		};
+
+		gpuss-6-thermal {
+			polling-delay-passive = <250>;
+
+			thermal-sensors = <&tsens3 3>;
+
+			cooling-maps {
+				map0 {
+					trip = <&gpu_alert6>;
+					cooling-device = <&gpu THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+				};
+			};
+
+			trips {
+				gpu_alert6: trip-point0 {
+					temperature = <85000>;
+					hysteresis = <1000>;
+					type = "passive";
+				};
+
+				trip-point1 {
+					temperature = <110000>;
+					hysteresis = <1000>;
+					type = "critical";
+				};
+			};
+		};
+
+		gpuss-7-thermal {
+			polling-delay-passive = <250>;
+
+			thermal-sensors = <&tsens3 4>;
+
+			cooling-maps {
+				map0 {
+					trip = <&gpu_alert7>;
+					cooling-device = <&gpu THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+				};
+			};
+
+			trips {
+				gpu_alert7: trip-point0 {
+					temperature = <85000>;
+					hysteresis = <1000>;
+					type = "passive";
+				};
+
+				trip-point1 {
+					temperature = <110000>;
+					hysteresis = <1000>;
+					type = "critical";
+				};
+			};
+		};
 	};
 
 	timer {

---
base-commit: e30626823a406725ce29bc75cb8ec467d3e1e326
change-id: 20260507-sc8280xp-thermal-zones-2474cb20a17a

Best regards,
--  
Xilin Wu <sophon@radxa.com>

