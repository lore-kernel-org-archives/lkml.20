Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24BF2494819
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 12:52:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788353563; cv=none; b=oML0NqUv5Yw8igJ+4QMFeTCTKPJDJZgr2TIK2m2w/XsK5A+g7QT3SsXxsLKH7AWpZhA3LzipsA80cqYLcfnggT7QU4QNZf3MVPjP8qbKxkZDEeOt8crwt1CcFElm+kQV8h6GwvCRHIEMQyax5/a8RFvYtJGTvfK2IllMLgRnp4A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788353563; c=relaxed/simple;
	bh=P3B9n1ngSJPYECqzlUnSk21jaEUvILK91iJ3Q8IaZOI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=MdvkibvJVq+3GmmzT2Yt+R7EjY3a9dU3pW05tkzzpQtP73EMGFgrKYqQTCuqhY+w2GlfotjgawwrhpXkg3bfqTogPnSzxyCJNLiodTK33sRuNsAswx6pdqNBghCw9ZsT2bmyErFaQa612uC7ikeOVfCQK6F0QtLB72e9Sj0orfo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aeclux+C; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aeclux+C"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-47f96c5b722so740280f8f.0
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 05:52:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788353559; x=1788958359; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=xdaO6fBuGjaq2cQRe9XXSfpY5l3FVnBSWeRbf2wTLJQ=;
        b=aeclux+CBPIKVw/lnVDOo0P0c4oVnuQGulcIQ19BqW+vresYMXSo0uTiZ1cSUrFLik
         8C7tKtTDt2fj5GwAaq5eSEwhzAipPzN8Zt14DoUSVcY1k4EfWDMxNV0U5y3prdRlnLA1
         ruXdHeORbAnl0ZZC5Zarga11OToRJlN9KyhADnJkqxLHwygEo/M4qXKnixY0TMim71a5
         5czPE1w4bHjx1RwxBXWOlrePTNYj0qhcf3Ifk+IsqM9uRht4PS/X8XyR7MZBSE70XLYc
         bSA8Tq0M8Ko3nW4tRShNRZJQlEo3QngBPDDuntPDn/QtMst+AfauRq959UCBoMyNqZhD
         1gwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788353559; x=1788958359;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=xdaO6fBuGjaq2cQRe9XXSfpY5l3FVnBSWeRbf2wTLJQ=;
        b=VWlJ1l/DWW+a2lrPDF3AkeV0zQcNa8G+kSCYu9VH9qZ1SJI7v1K30zEgidH8uMH9YB
         rDH0YV7acGSeCXj6dk367gd0iasooKMvvk0Rz35kAsHTpOXC0KoMdsVP2k9k5kRM/wqG
         jrnkRpMFHPSCh94H6vodwO+KlH/KKX8SrF4M3od6dS70ybtF13rKLLKkk6UT28Mbprd2
         UyjflWAIrYuElYYWJYwb0qvBNZOxzxMa5lzb2RJdVDQ5Lghqc0kBnDL7XLapwlLc4suX
         PGNB6lybfOAqTsEAB3/rsrJ8wlWDRJWYI1Y1zP5q4ypKi5ocAr3HaIQ+IRDvnoUfAm5/
         KzVg==
X-Forwarded-Encrypted: i=1; AKwUvBzxpq1dY3crzo+kM1SYjpTmr3p9HIWc2cFPUhH9JwgYnTFVd52DreidkT7ITunxzxcSdte/DDRIOvfTxIg=@vger.kernel.org
X-Gm-Message-State: AFuF++lhq6r/1gmHlm4zqgHjb+Wrcs34vGvgiCT08r0aJmssHWzVjOCW
	KyMhRv3QRY2EfHEWbCeiAe7oxnEKUztOIEVpG3GLessqT5bqY23z8QtS
X-Gm-Gg: AYBFou1NFRrRq3r+DF8RH16+WWLmcKvu9JAPB0DViABWushK74Z2wd43nIdVy0uwSAh
	MPVPptafd5/jzix09Pw5fZj+nQPn4/csfxN0S/q7Y9UMYrsVQ8WnSiqAc9nNXZP6Aycjn79RV/2
	u1q6+f+v8E6XBnl7yeyAwsmseNOjN/9PoJ3/+xY6F+7gmxoo7SIaR+/n/jwGNHP/343lvk2ha5V
	1UCmVgq2vNvglpB3wXEarVhWw7CLY6+pATTKFf42LdpftmFzPPAtnPPThd44dsFTvU/YX7vetH7
	u3kdYIoER1OC1P8b4efrxz7BeKpkbrVw7BGukr0sNPwOiiWOJ49PPjyH4aGHVJQpclcjTcXszl2
	CMW/vX8sbtOpZ7FrulJR7hsCDh+OjZuffEkBOjFDn0f8Vb0izF4PM2AgHR13/iU/mNaSv6bD3/i
	m1KjKqJXtl8yggbBOvi+Gzj0g4ZwjXIu6nnfSM/wdFPpT3PcwJnr/u2AafA68GoqmN/0cVRQVvz
	cC3o8s8/km64NRjn0d2r4hlcwhq
X-Received: by 2002:a05:6000:2482:b0:484:3d35:5706 with SMTP id ffacd0b85a97d-484914b7e20mr8950452f8f.22.1788353559085;
        Wed, 02 Sep 2026 05:52:39 -0700 (PDT)
Received: from [192.168.1.5] ([148.252.128.8])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48448ed3716sm6543253f8f.22.2026.09.02.05.52.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 05:52:38 -0700 (PDT)
From: Dale Whinham <daleyo@gmail.com>
Date: Wed, 02 Sep 2026 13:52:36 +0100
Subject: [PATCH v2] arm64: dts: qcom: x1-denali: Add volume up/down GPIO
 keys
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260902-surface-pro-11-volume-buttons-v2-1-1d893c7b5440@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/42OTQ6DIBSEr2JY9zWCP9Gueo/GBdCn0qgYHpA2x
 rsX7QW6/DKTb2ZjhM4gsVu2MYfRkLFLAnHJmB7lMiCYZ2ImclHnjWiBguulRlidBc4h2inMCCp
 4bxeCvlRljqLSqBVLjtVhb96n/9H9mIJ6ofaH9GiMhrx1n/NA5Efv363IgUOKq6YtykLWzX2Yp
 Zmu2s6s2/f9C/fpPPbcAAAA
X-Change-ID: 20260829-surface-pro-11-volume-buttons-f4b40e25cecb
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 =?utf-8?q?J=C3=A9r=C3=B4me_de_Bretagne?= <jerome.debretagne@gmail.com>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Dale Whinham <daleyo@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788353557; l=2560;
 i=daleyo@gmail.com; s=20251214; h=from:subject:message-id;
 bh=P3B9n1ngSJPYECqzlUnSk21jaEUvILK91iJ3Q8IaZOI=;
 b=IaqaduQCaxmFfyKqat/Yx4CdX+AosmjnsVzKJdAcszI6FTzzNjK8qNsgOqqD7lxuRfMpnpwU8
 OusvjmzfxaGA7SSuaA8OSXY8qEipcr8cxUDig8XrvBMz2EJO8GskwIh
X-Developer-Key: i=daleyo@gmail.com; a=ed25519;
 pk=M4mvgx1TB2TniKaedTDsO3PbLKgFosJuegXRXPbn2Ds=

Configure gpio6 and gpio8 as volume up and volume down respectively, to
enable the volume rocker located at the top of the screen.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Dale Whinham <daleyo@gmail.com>
---
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
index 7559557610ed..6ed7db0ad53f 100644
--- a/arch/arm64/boot/dts/qcom/x1-microsoft-denali.dtsi
+++ b/arch/arm64/boot/dts/qcom/x1-microsoft-denali.dtsi
@@ -20,9 +20,27 @@ aliases {
 	gpio-keys {
 		compatible = "gpio-keys";
 
-		pinctrl-0 = <&hall_int_n_default>;
+		pinctrl-0 = <&vol_up_n>, <&vol_down_n>, <&hall_int_n_default>;
 		pinctrl-names = "default";
 
+		key-vol-up {
+			debounce-interval = <15>;
+			gpios = <&pm8550_gpios 6 GPIO_ACTIVE_LOW>;
+			label = "Volume Up";
+			linux,can-disable;
+			linux,code = <KEY_VOLUMEUP>;
+			wakeup-source;
+		};
+
+		key-vol-down {
+			debounce-interval = <15>;
+			gpios = <&pm8550_gpios 8 GPIO_ACTIVE_LOW>;
+			label = "Volume Down";
+			linux,can-disable;
+			linux,code = <KEY_VOLUMEDOWN>;
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
+		bias-pull-up;
+		input-enable;
+		pins = "gpio6";
+		function = "normal";
+		power-source = <1>; /* 1.8V */
+	};
+
+	vol_down_n: vol-down-n-state {
+		bias-pull-up;
+		input-enable;
+		pins = "gpio8";
+		function = "normal";
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

