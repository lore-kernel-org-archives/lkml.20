Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F5993C9EEE
	for <linux-kernel@vger.kernel.org>; Sat, 29 Aug 2026 18:41:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788028900; cv=none; b=grFm60+NqLF7Y0pkVqjuXUngAx2vk+4JtPErPlIeJlkq4Z6QhjIXIypuLIiwH64/mV1f0y+/W950Ni4xf05JbUecveraIYLhfKVXE5x3wqR1NdIpqfaQ65DAc3FReAT9NPNTeSQEKvE1RMaGqR78WnEk2gXa/Vk2dhalqCC+5T8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788028900; c=relaxed/simple;
	bh=gjh1l+NNPC/cZ6uQzI1O65AFFuEkwTycyBvCBbn0TTY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=u4E7A+c17bNymXitkvyL4YArmKAV3O/SA5bjnXj+DcA6rObzgRh0gMMgtoHeOGni1CXqMYF/xNvRLvIQ/kqOdbSnjFobAtkNpaR3EFyyVqoA3bd9LnJRBvd4d7jS5MNZ/sl6kMeZUkwmVPWNfGVQRQikG037xRaSLKUoh5lLoxs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PgyLkuXw; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PgyLkuXw"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4995b0343c1so19578145e9.3
        for <linux-kernel@vger.kernel.org>; Sat, 29 Aug 2026 11:41:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788028897; x=1788633697; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=0H8PyiwPo+CDsOXKQ6pG40Z5MKHjfZ12JW+zPqmUMOM=;
        b=PgyLkuXwccJ/iB5spApIN4v1aYJaXlKq1yg12HCq4KtSCkXDaTlT8BwJ+wVROxeWwJ
         Khcw6xQ8XmNcfEdtkWhRJEp56KDmfHwVRe/uz8E/FilsZOzb3qiX4IduS1sn8/V1ubVl
         hBL9nHMtfJma6+qu3aHPh+cbts9I5wisLc3GT+2jVcNBhq8lWyfaOsCUlJ2tjdaDfkIn
         LcOAbgeo2ynjHz/5x+pjf108/ijktlIYno4UbPpBEdJ0sApCvwxC5ik9dThSFZyTSgpU
         5zz3AUcSblasQjX+e2GQtvEKCmv/UyE4Vtlm9koKIhY2JGuP1dDj21LdIZB2Y3hZt9yW
         u/Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788028897; x=1788633697;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=0H8PyiwPo+CDsOXKQ6pG40Z5MKHjfZ12JW+zPqmUMOM=;
        b=jQYNKJC96yg7njhDCvG9PDo6ggIydaiBwxDSWA+0TKQvx3QoVbi6SZTcbRxwm06eY0
         cHc4MmCrki/W6gdpPUta166Sf8b0drfKigkaMhUuzOMVnhncrMzwY33rzotf4aU4XEmB
         Tcdx+DFQhb6oyhVXObzL2otUu35VvHWwfr6FHqshe3GSiTCxGckiaXT2OnZqxIvAhdkM
         qk2QZwU5g0+t2BZxHx7NkP2AP4786HaGHrJ9hg17G5yYX8U2zb34jeNtgToiMsH8FtZx
         eW1y1yFZeE3lUf6vMSwCz+WV1xfBXpa1SahCImVkSMnurnks1EP9hElufjNTuU/pXGmu
         AWHw==
X-Forwarded-Encrypted: i=1; AHgh+RpCw4Btf4BGsl81hL2RGU7P3+p5Vwk/R+X3xbJ6nqvtLBrGqIet6e5JuQMEUO1nkNbGOiy7vJTB3Xqex0k=@vger.kernel.org
X-Gm-Message-State: AFuF++msaWCh1TDNXAEs3ir1XvOxrL8i4SPac0NXiRhDYdBGMftblu3k
	85uxAMox1dvlN0EJ4Xg6s8oZlGW1IJGjVODCJdcH8quwu07ce4KwxxCLuMd0/CMdjC2b+DbW
X-Gm-Gg: AR+sD12F4JWQUyCD3zztutSGRFQwwmWxefVNXvZpQ5iOesaxDebR2IrqX7zXGsF8gre
	XJBv8UFTe1f73ZnBAifdRoVoEtcoikGi1PixRn/xS87hdD1dkqL2JiM1HhzdTmDLwr4cMkEqt9S
	UaKPKoWY4HNmEKo8BIq8IiDPPsKfj8wUGfIEbEiwY7mX/ACIIlvv45UzYh9dZVnf0Vbvqx9NJDn
	4TszH061su8MCUUwvpzPfpdWAUx/lgsLO53/t63qGv494lI+T+xsZF1mlGhs9qeqLxLZOdCZoqH
	u6PwW11W77+0MXRlxidJOADOA+AjwqtzgCt5tJPcWejHQU5Ys/dwNmThtydvE0SdPLJl0n3xniP
	MhiYq1sa5waB0t8TNdU0e18SsJedadUAqqKWe75tIgRlxVIEvW49BXm84Srs8HRO520uczzDlbU
	eD4+zpvQaShFuLrku2P04DNvzXUoStUqt7zKR+qzpQICnTGSozC1c3oVwin+29Zk9Q9KLxtFuDs
	EwaYG9OF2b+AZRP/GyIeQ==
X-Received: by 2002:a05:600c:a403:b0:49b:924e:9a28 with SMTP id 5b1f17b1804b1-49b924e9b14mr211725925e9.1.1788028897076;
        Sat, 29 Aug 2026 11:41:37 -0700 (PDT)
Received: from [192.168.1.11] ([148.252.146.192])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49b49cc61cfsm252044895e9.6.2026.08.29.11.41.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Aug 2026 11:41:36 -0700 (PDT)
From: Dale Whinham <daleyo@gmail.com>
Date: Sat, 29 Aug 2026 19:41:30 +0100
Subject: [PATCH] arm64: dts: qcom: x1-denali: Add volume up/down GPIO keys
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260829-surface-pro-11-volume-buttons-v1-1-ace589343a68@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMwQrCMAwA0F8ZORtoyxzqr4iHNaZa0XYk7RiM/
 bvVHd/lraAskRUu3QrCc9SYU4M9dEDPMT0Y470ZnHGDObkzapUwEuMkGa3FOb/rh9HXUnJSDL3
 vDbsjMXloxyQc4vL/r7fdWv2LqfxS2LYvAJTkYYEAAAA=
X-Change-ID: 20260829-surface-pro-11-volume-buttons-f4b40e25cecb
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 =?utf-8?q?J=C3=A9r=C3=B4me_de_Bretagne?= <jerome.debretagne@gmail.com>, 
 Dale Whinham <daleyo@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788028895; l=2043;
 i=daleyo@gmail.com; s=20251214; h=from:subject:message-id;
 bh=gjh1l+NNPC/cZ6uQzI1O65AFFuEkwTycyBvCBbn0TTY=;
 b=3g5gzi2RSLoc0SXrt332SzG91tDDODYz0ZGabjDixgUXJYo5rQau/5fDMmno3A9Wonyf6rJwC
 eAw2VtwPBI6DBPkvaqSbzF1UX5DQUjN7ZtPr6l+iXHfYAx2LjZOXzeO
X-Developer-Key: i=daleyo@gmail.com; a=ed25519;
 pk=M4mvgx1TB2TniKaedTDsO3PbLKgFosJuegXRXPbn2Ds=

Configure gpio6 and gpio8 as volume up and volume down respectively, to
enable the volume rocker located at the top of the screen.

Signed-off-by: Dale Whinham <daleyo@gmail.com>
---
 arch/arm64/boot/dts/qcom/x1-microsoft-denali.dtsi | 36 ++++++++++++++++++++++-
 1 file changed, 35 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/x1-microsoft-denali.dtsi b/arch/arm64/boot/dts/qcom/x1-microsoft-denali.dtsi
index 7559557610ed..c467f61545cb 100644
--- a/arch/arm64/boot/dts/qcom/x1-microsoft-denali.dtsi
+++ b/arch/arm64/boot/dts/qcom/x1-microsoft-denali.dtsi
@@ -20,7 +20,7 @@ aliases {
 	gpio-keys {
 		compatible = "gpio-keys";
 
-		pinctrl-0 = <&hall_int_n_default>;
+		pinctrl-0 = <&hall_int_n_default>, <&vol_down_n>, <&vol_up_n>;
 		pinctrl-names = "default";
 
 		switch-lid {
@@ -30,6 +30,24 @@ switch-lid {
 			wakeup-source;
 			wakeup-event-action = <EV_ACT_DEASSERTED>;
 		};
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
+		key-vol-up {
+			debounce-interval = <15>;
+			gpios = <&pm8550_gpios 6 GPIO_ACTIVE_LOW>;
+			label = "Volume Up";
+			linux,can-disable;
+			linux,code = <KEY_VOLUMEUP>;
+			wakeup-source;
+		};
 	};
 
 	pmic-glink {
@@ -995,6 +1013,22 @@ rtmr0_3p3_reg_en: rtmr0-3p3-reg-en-state {
 		function = "normal";
 		power-source = <1>; /* 1.8V */
 	};
+
+	vol_down_n: vol-down-n-state {
+		bias-pull-up;
+		input-enable;
+		pins = "gpio8";
+		function = "normal";
+		power-source = <1>; /* 1.8V */
+	};
+
+	vol_up_n: vol-up-n-state {
+		bias-pull-up;
+		input-enable;
+		pins = "gpio6";
+		function = "normal";
+		power-source = <1>; /* 1.8V */
+	};
 };
 
 &pm8550ve_9_gpios {

---
base-commit: 8d3ae59288f1e7d58d76558a6ee96d533bc5019f
change-id: 20260829-surface-pro-11-volume-buttons-f4b40e25cecb

Best regards,
--  
Dale Whinham <daleyo@gmail.com>

