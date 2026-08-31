Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2485F3D3CE6
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 09:13:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788167610; cv=none; b=om0tCVkoy6VM+9J5+BlifXlofCjymHdwZiq/ZB3P8TYy4abayYlqp9Dj+/VW88Y2HRN1tHq2MiQwwyZ9C5YeNoPSjIkbxLwxhSDPiBA7l1TxHXAAkxh+c2zYeGwPHbOSZCqeEjWHRDQWtK53nN09bEZWW9wqEtyj4wfjpx1HxjY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788167610; c=relaxed/simple;
	bh=3VtEgllYTwb9AoggrDrv0Lf/izwoIk49AtVszqcRoj8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=OaZ6ku9xvq5RcHj9PC+m1LAp6qFlTtPT1w8e+zdGtR8I/LhYacN1iJntjJWvJOpN1NJYkd1k9vNAEncjSzOaigdbFmel3Mjuv3z6MWXIqZq98+M29FITLvEClTlrLKDEd2fUOph3IfC712864ruyVuuFjrjvBYEXjZWdf3PUjJU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=lB0JQOzY; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="lB0JQOzY"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4980fe6b3beso26077105e9.0
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 02:13:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1788167606; x=1788772406; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RxyTrocUHcniU2MAXabytwb4iSzDNOnn1iZ50nJ9bdA=;
        b=lB0JQOzYPT+gW+PT1YwkZpMKE3CQkJT6hGk29L4RleX+LgxBD7q2fap902teCr+fWP
         aPpVzBWWwKEDSUniRNq2yxxtg0VO44+oOmy5rCrtlOxGQWXiT6E1wewGksTMyF+eq29M
         QGM1FeA/AzbLaiQhbznNohY/QqAiIQVmMQxKBiNO5GAMfYChueG76O9GwaCH39EJDaKH
         YcqILJhG/r68MOKqFix/zCQ5aYuuEh3mWbpuHwFf95ntzeK19Cw1F3TpNYWOx1wjeidN
         IW+r/NU3fs1bR5QbteBNQpmlfXLKePMeFZPvegNFHThAfdImixOlJVZadUYPCZwO5bm3
         bRqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788167606; x=1788772406;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RxyTrocUHcniU2MAXabytwb4iSzDNOnn1iZ50nJ9bdA=;
        b=obIser6rM1sJXJWPx9UqbM/Io2ePGQdDcAVXVzbkA2U/HO/wRMIDiuFEsF5P02WrVP
         5I4y5J9VIG+x+TGU6vkIq2y/PgTUA+YK4wt+mEB4v7ZEyAtDxvJkBG2JFagX4/Z69cSc
         I8ff31rPsoGduBpUEfve6P8CyVgRxWctDrNl/f6k7uCzahGmaZ+3E73eADxrCMaP5HP4
         GjKRuPoTDYzIf5ktsA7ohGLW8987eX9L+VOr6N5gMFords8C9tddDvpJLUklPXbM0x48
         m6/zRTCtnW70CGI7gXIRAItuJCeXmgFV5t2qSZaWAwfvciGvDSjMvs2tH42A10lqi5nz
         ZeAg==
X-Forwarded-Encrypted: i=1; AHgh+RoMk27eTSaIQZCveDQPiVmCdLx6iJP7ZIja8PWG2BFfP4gQEGtRf8vDyHymmN9CQv4vFzalBNNyTd92dxI=@vger.kernel.org
X-Gm-Message-State: AFuF++muOg6vPqPfnkZxca/dwSqILyKmGc2N62d9FiU23m7lp6GWGiGW
	xQtfmklncQv9pfagYDibUUqTD3fe8/j+IplJeR2bwmoUxe0zhGassFuMxJVl3LL5uSMuEqS6leY
	o9BTpQzA=
X-Gm-Gg: AR+sD13CCvrBNkIal/xLq3v2f6vfRUvs376ekmIVvUlb6LuWHxpIDOX1hTT4UE5ErWT
	3r4VJzCUkqXW/dCFRNOeLI0zLEa6noATAkLijESgdJpJv4iOsFthdg9ereDlp53jMR4Fj3UGTVj
	cGeKr3kyLugQWA9ZASuWP9l/DnehZgwJ/lKcLn2ZNldSfW5lJLYTS7XRmZYTcLjGDG66wjlAJeP
	VAA7Rau42Gr/X9N/O9LS11cKZopJa1a/O85Hmsd8MDyFhV5nks2C2Sev+QRQ7hobQuz3Pwd+MtS
	rK6bP8cy0qgBNwbxhoQvP2NWh6qCBq1ze15yRsqOWA4JvrOdf+uLf/g1rWq7iksGeSYHu0xHVHP
	FYDvAUaw9z6UYcWWkOWDJ2APOEEwDIVTaqSEw9R1EVRcB0X0NOpiPQzl8DwG7yuXkph2uMsTEeB
	HZWgEi4rzfFa811iNM1aYKaZXy7ev+SAr25UXUw5224z5vsNEJexVfAqfYvmik+iD3bv2IHiSnD
	FMPhA+6JQ==
X-Received: by 2002:a05:600c:8b63:b0:49c:ced9:ab7f with SMTP id 5b1f17b1804b1-49cd53c438bmr107757695e9.8.1788167605939;
        Mon, 31 Aug 2026 02:13:25 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0e:1007:7be3:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49b4dfdf00csm320935205e9.14.2026.08.31.02.13.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 02:13:25 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Mon, 31 Aug 2026 11:13:19 +0200
Subject: [PATCH v4 1/3] arm64: dts: qcom: sm8450-hdk: Enable I2S for HDMI
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260831-topic-sm8x50-next-hdk-i2s-v4-1-a224aa073f9d@linaro.org>
References: <20260831-topic-sm8x50-next-hdk-i2s-v4-0-a224aa073f9d@linaro.org>
In-Reply-To: <20260831-topic-sm8x50-next-hdk-i2s-v4-0-a224aa073f9d@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=3043;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=3VtEgllYTwb9AoggrDrv0Lf/izwoIk49AtVszqcRoj8=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBqlUWxjG/ZjZ0MaAs7I+R0pZjX7XOs9M7nGf3DqTsv
 It1lt/yJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCapVFsQAKCRB33NvayMhJ0QK7D/
 9Pw8iHrd7g5JZVhX5YJLgbZNJTaHVhp3QrDrgVobEFQ0s/8cuAHKy1483slg5r66BIrzXmBwP+QigR
 PSbP33c6iI8ST58KaHixi1zzsxpCVm92E4Ny0GHAb3JA4x+SV4HVcAh0Y62Kg83+vcjuCoNAUIHcMb
 ujwnDpwGAS6toEsuOPKBYySYTxri+JYM3A2TCQKM2KXWufGEo/9hgs1kNzBmjXFo/6zOpQV5x+YFHY
 elJDLDrEC6NdMsaNuNoGvMTE8LoMMqpT7NFGtFYQcom0HbOPf5pvlTgS8Ttc2uq1XfqfFkfcLeME8/
 Ae+TIFTTK0YCYcwY0VNk/OJf6/tHRXfmd6I1KRIqQEHzIymcjk4ztdp76TZ6PhpCVUSJlkpFoXWXtn
 10d3VB8oulYCeNqPFfwaQ4Qzu1vq3MDjFwpisuY6xAI2GVrLyKJFYphjfzqcKhwNQ8ThLKsGMom71k
 44h1vuy3w0EJZnBd4YEHiYxJd1jzRdMnPPq70bqVtvZS/57OKm1p4j0GsoJ9iC9voEE4a0zyOABcSJ
 fTlEHxb0byuyxvJOYsXWY/XtoC2mezYZxtU3Qp9beIa1YetcOuLxZLgrCYOXl+v7eFeoFFoiWPSwG+
 c54BviMUaT4XISFhDoLiOwWP7CX0/3o0+y50HkrHgFhj8/Cki9m7HVMqFA5A==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

Add the necessary nodes to configure the right I2S interface
to output audio via the DSI HDMI bridge.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8450-hdk.dts | 36 ++++++++++++++++++++++++++++-
 arch/arm64/boot/dts/qcom/sm8450.dtsi    | 40 +++++++++++++++++++++++++++++++++
 2 files changed, 75 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8450-hdk.dts b/arch/arm64/boot/dts/qcom/sm8450-hdk.dts
index 4ade28f40cae..9b55d17869b4 100644
--- a/arch/arm64/boot/dts/qcom/sm8450-hdk.dts
+++ b/arch/arm64/boot/dts/qcom/sm8450-hdk.dts
@@ -665,7 +665,12 @@ lt9611_codec: hdmi-bridge@2b {
 		vcc-supply = <&lt9611_3v3>;
 
 		pinctrl-names = "default";
-		pinctrl-0 = <&lt9611_irq_pin &lt9611_rst_pin>;
+		pinctrl-0 = <&lt9611_irq_pin>,
+			    <&lt9611_rst_pin>,
+			    <&i2s0_default_state>,
+			    <&audio_mclk0_default_state>;
+
+		#sound-dai-cells = <1>;
 
 		ports {
 			#address-cells = <1>;
@@ -947,6 +952,19 @@ channel@44b {
 	};
 };
 
+&q6apmbedai {
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	dai@10 {
+		reg = <PRIMARY_MI2S_RX>;
+		clocks = <&q6prmcc LPASS_CLK_ID_PRI_MI2S_IBIT LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
+			 <&q6prmcc LPASS_CLK_ID_MCLK_1 LPASS_CLK_ATTRIBUTE_COUPLE_NO>;
+		clock-names = "bclk",
+			      "mclk";
+	};
+};
+
 &remoteproc_adsp {
 	status = "okay";
 	firmware-name = "qcom/sm8450/adsp.mbn";
@@ -1079,6 +1097,22 @@ platform {
 			sound-dai = <&q6apm>;
 		};
 	};
+
+	prim-mi2s-dai-link {
+		link-name = "HDMI Playback";
+
+		cpu {
+			sound-dai = <&q6apmbedai PRIMARY_MI2S_RX>;
+		};
+
+		codec {
+			sound-dai = <&lt9611_codec 0>;
+		};
+
+		platform {
+			sound-dai = <&q6apm>;
+		};
+	};
 };
 
 &swr0 {
diff --git a/arch/arm64/boot/dts/qcom/sm8450.dtsi b/arch/arm64/boot/dts/qcom/sm8450.dtsi
index b8793482b181..a5d5eefa4e9e 100644
--- a/arch/arm64/boot/dts/qcom/sm8450.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8450.dtsi
@@ -4300,6 +4300,46 @@ qup_uart20_default: qup-uart20-default-state {
 				pins = "gpio76", "gpio77", "gpio78", "gpio79";
 				function = "qup20";
 			};
+
+			audio_mclk0_default_state: audio-mclk0-default-state {
+				pins = "gpio125";
+				function = "pri_mi2s";
+				drive-strength = <8>;
+				bias-disable;
+				output-high;
+			};
+
+			i2s0_default_state: i2s0-default-state {
+				sck-pins {
+					pins = "gpio126";
+					function = "mi2s0_sck";
+					drive-strength = <8>;
+					bias-disable;
+					output-high;
+				};
+
+				data0-pins {
+					pins = "gpio127";
+					function = "mi2s0_data0";
+					drive-strength = <8>;
+					bias-disable;
+				};
+
+				data1-pins {
+					pins = "gpio128";
+					function = "mi2s0_data1";
+					drive-strength = <8>;
+					bias-disable;
+				};
+
+				ws-pins {
+					pins = "gpio129";
+					function = "mi2s0_ws";
+					drive-strength = <8>;
+					bias-disable;
+					output-high;
+				};
+			};
 		};
 
 		lpass_tlmm: pinctrl@3440000 {

-- 
2.34.1

