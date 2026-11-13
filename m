Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794557802;
	b=BC+NvtembSQboLs8PPuoMNR2dF5v0lUYnnXhl0txontUIggLm4FBg/z4vFFbUA6Y+1Im
	 ydEjOB2zwaycKEgT+QUe1lHmC9kPyONwoOqWmVB3jWXABbKEOcEyDvGFWkbcwhj7UIvWd
	 WQBOR+UaIuRKBak8VVTwkk3CNViPXyITWHrbTGyolWfYI1nYzu4ZG4WWDGPdAsggH69/C
	 W5Qmu8wIotL0Lc6cHRBfi/LHsbS36B3IBMHIni57LuXaDK1iVE0AqhkXclVX8b8MyRe2N
	 uhM58SdoT3aj2XJDPyIFxwx4zMeQu81bW37cua/Yqeyhz0lXZ65QgTQts00QpdqeDhQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794557802;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=iQFTvmXhc7Os6jgWWtbp3W0a+iCMVy4yMh4ovPL/AhI=;
	b=G8aN4mXwVapC5LUhWyd15IGkx7d4WkvusXIeAy7c6aOUSdDCxOigpN06VFItwRVDDXIv
	 alvguIFoJbwO2LTbYk1A3yBrDSjpXOKdLsI3ueDfXhZsWYiK7Q4TY8ZQZYtA4Xam32f2y
	 lnw0gV91XZhQ1hOpy39nXaUSM34El/w763K4S5R6QNowFbDWMJKY1I2jBsLKDgg4ah0Lf
	 1E6/K+TYKjNSbGMov1qZW4iWd9WegApNwITlxe9e/kZHLsH6tVo9mJoqH5UkGpr3sqOxg
	 pDINZ/QKRXxwUQkyLPNomZDmfOfhATu65UVL3L/KWD+hvGCvy4zi3kJNqDKmra2dpQw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=fairphone.com;
	spf=pass smtp.mailfrom=fairphone.com;
	dkim=pass header.d=fairphone.com header.i=@fairphone.com header.a=rsa-sha256 header.s=fair header.b=MSscyRQQ;
	arc=none smtp.remote-ip=209.85.218.49
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 531F3606A8A5
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 08:16:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 531F3606A8A5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.a=rsa-sha256 header.s=fair header.b=MSscyRQQ
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-c468bd799ecso122219666b.1
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 00:16:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1794557801; x=1795162601; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iQFTvmXhc7Os6jgWWtbp3W0a+iCMVy4yMh4ovPL/AhI=;
        b=MSscyRQQ4ju3BAXAXTqwR+KnoFm3xqXW+bk05zNcYmZZ/GU3BcPBJNmWgnFWB3+u/B
         2207JCdcECYzl3Ckdq9gwJKzEXaxeefn0qlLcWzFVGzJK8eHO/YGboT+aW22A5V9tieX
         vMyFzTi/kbdPCg6VtFGgFm0EZhbIZWpmbqZDi22qYLCcsstULFdSTExzs1E766mwH6J+
         JvQmD4DNikUfbjPN+QjlpF+aFFsjlkwu6YYXmzBDndXhYWTz+qGJPvZjD0zvi84ahmj+
         5fvUTnA2Kl/gLwBnCgHambLU/GmtoBf/G2OIVLHlMPH+spsKfIVgbHT39AVZ0PF6xvZ8
         lyLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794557801; x=1795162601;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iQFTvmXhc7Os6jgWWtbp3W0a+iCMVy4yMh4ovPL/AhI=;
        b=PhwXktKeNIo4K/LGCLegtkWNY87CHiuralX+X5ivFqT+kW/5f7+6azCQkQlYyno64e
         M1jNkZOvR+XhU2M78m9NYBEDL65Z9fxjqZUWk1bHVJDCl18bDVZ07j8SBz5F0BmSjYfM
         bOoQ0Hex6NGZ33Sr27rJYee7XNbwioZF8U0pFK81+Gcu2py/oYMZIy99xrXLCgCuVFD4
         RKYXLbwJpa2awqWkMKroCneKXN2ycA8leOe068Q3AVNAmFUXhX4WlcXQNmkQgyKcMbcr
         I3PmK1upiVu0CaE19MIMgr8pSIatgvAc+BhyMbuolA3CJa9GeFSvKv4dtoKse1wWPBwX
         WhRg==
X-Forwarded-Encrypted: i=1; AL+hErHsVLEVEDexgocQE3X8N9c9HXms8CUgzR/ybeuzm4gWQkYWXb0ogLWHCHm4P68v0+CEq5frfKG/30yC1fg=@vger.kernel.org
X-Gm-Message-State: APuU4Z8QphHEBSv0rhTJ6o8V00ojyY69omU/g+9m3M21c8JYcokGCtnR
	DZZFkZ0xt+Kp9dIexLy5VnI7Wj8r4VxtdRkxw5bXhV1cFRhaPxoDGiC5NWZWnv6cRDQ=
X-Gm-Gg: AYBFou3lNWN0374e8IUBFBACwUoe4a8vO6NbGXynHWlIdFDDu7L7k9TJbH3GbeRohoB
	r1XGTIuZcI2dlezjjljQrOQV14ksOfhySyLTJB4DLf3PdiWtnf0AIZRUwfIVEuGAOHnMjnio69R
	Itikq/rS03bSiS59WNjszeOa/t3tpTSiq7kFR6LeynFrnKqt2MUBUuPdyyvw4YfaQ1YxYm8sV2w
	7DblAXUoiIKVjQY7DIkiqtkQdYMgsHMWEwvZbqClVpuy2xL8oHq54GsgGnut7GYgl9X+j1U79cn
	9hmPUsIZQhIbcY5UK5T2t2oFw8bmSHsGkJDs/F2jKZn04p7/4VUz8V6n0PrI8w4+4Htiz2OH8mu
	4Cd6I1M5mRZWii2KKpczEPFlL+ZbECYBC7UWCtzLFpErtPh2XP0dU7Jav8M+DC0aJSp8sJSq+o/
	HJTScRx/qZc5+7uvVMtcLc1Ww9RCcDjQkM/pUEPLSfHrt9ezAyc6oiCZnAlWA2hIVmFq4874zmF
	8SSRom2FblTZlt0OjdbPauE+ZViJlnDn6lemPQihvA87jIHoqncH8NEi10g2zqt7LBYYWfeTufy
	3CaiRlwWAkXpiH5dGYIsXd92sWEXdCWmQRj2YO7mVlFAt39iitu2Qbe24qZsH4r1u2KDV4ZPSCj
	6z3oN7A8=
X-Received: by 2002:a17:907:72c8:b0:c4c:fd37:bb0c with SMTP id a640c23a62f3a-c509642fa91mr120493666b.29.1794557800810;
        Fri, 13 Nov 2026 00:16:40 -0800 (PST)
Received: from [172.16.240.104] (144-178-202-142.static.ef-service.nl. [144.178.202.142])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c5095b4214fsm65243866b.35.2026.11.13.00.16.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 00:16:40 -0800 (PST)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Fri, 13 Nov 2026 09:16:38 +0100
Subject: [PATCH 4/4] arm64: dts: qcom: sm7225-fairphone-fp4: Wire up
 PM6150L LCDB
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261113-lcdb-enablement-v1-4-1dc40b49ed82@fairphone.com>
References: <20261113-lcdb-enablement-v1-0-1dc40b49ed82@fairphone.com>
In-Reply-To: <20261113-lcdb-enablement-v1-0-1dc40b49ed82@fairphone.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Val Packett <val@packett.cool>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794557797; l=1746;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=KjTKTH9Miq+8wMoPpDn8TAAfkWHtiUZa4QdKBZGsgPQ=;
 b=0gEdfshP1PkmZVEL/h2v+0KFiWjmOvW0x74d6gZcB7Mc88ZUGZl6AjEnXDATqUxlfd90qJxBn
 i6waAEMPGQbC+r+RZ5r+EKzsjOrbv6MuRFlWCZp+Cz6OAfHYIEskU9Z
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

Since Linux has gained LCDB support now, wire up the LCDB regulators so
we can turn them off and on as desired.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dts | 26 ++++++++++++++---------
 1 file changed, 16 insertions(+), 10 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dts b/arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dts
index 37aa272019cc..d592bede6a61 100644
--- a/arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dts
+++ b/arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dts
@@ -72,14 +72,6 @@ key-volume-up {
 		};
 	};
 
-	/* Dummy regulator until PM6150L has LCDB VSP/VSN support */
-	lcdb_dummy: regulator-lcdb-dummy {
-		compatible = "regulator-fixed";
-		regulator-name = "lcdb_dummy";
-		regulator-min-microvolt = <5500000>;
-		regulator-max-microvolt = <5500000>;
-	};
-
 	reserved-memory {
 		/*
 		 * The rmtfs memory region in downstream is 'dynamically allocated'
@@ -784,8 +776,8 @@ panel@0 {
 		reset-gpios = <&pm6150l_gpios 9 GPIO_ACTIVE_LOW>;
 
 		vdd1-supply = <&vreg_l1e>;
-		vsn-supply = <&lcdb_dummy>;
-		vsp-supply = <&lcdb_dummy>;
+		vsn-supply = <&pm6150l_lcdb_ncp>;
+		vsp-supply = <&pm6150l_lcdb_ldo>;
 
 		port {
 			panel_in: endpoint {
@@ -925,6 +917,20 @@ pm6150l_adc_default: adc-default-state {
 	};
 };
 
+&pm6150l_lcdb {
+	status = "okay";
+};
+
+&pm6150l_lcdb_ldo {
+	regulator-min-microvolt = <5500000>;
+	regulator-max-microvolt = <5500000>;
+};
+
+&pm6150l_lcdb_ncp {
+	regulator-min-microvolt = <5500000>;
+	regulator-max-microvolt = <5500000>;
+};
+
 &pm6150l_wled {
 	qcom,switching-freq = <800>;
 	qcom,current-limit-microamp = <20000>;

-- 
2.56.1

