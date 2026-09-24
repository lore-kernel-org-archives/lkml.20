Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6949445ACF
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 09:06:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790240810; cv=none; b=eG8MX8ZRVGm8lRHFQy4C6U3lZHd7OjlS9VGBDiX18K4IuSWujOsiHrComEDz6mvqtwAMjHUYzdy5FBJz1uSpLSVef8zKzh4H88BP/Rlsr8r7JEnhjqSTXDdHPbtzZqu0OIAkhE0B/9oifVqTqQ9Q/XLntlkZjDdebICwHldlvg0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790240810; c=relaxed/simple;
	bh=wHxFYx3mvxdbbx6m35zMlL0fF8roDcjXviwsUf6LpAk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SLcmtpg+Gy1zTwBi1aXYPTxgvPiaO8AOQ6hnhV3h7eldqDFBsPsRxtEG9vruvwxfipfAQxTXOBQdvaAiVlX19LxMGBZiUbWYf8YIi0nGpTxXxgDoR8RcuEl3eTCx8rPuLpZOD79rTMFTc2iA/85nKOxYLjnY2X5PcUyDkk1fDYk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KiURavtV; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KiURavtV"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-482f6351831so1137315f8f.1
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 02:06:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790240807; x=1790845607; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pb/qIibv3qYKIWDbEUPNel9PVjN1RHSn4ca2JUKNgIk=;
        b=KiURavtVn2DFmp0ldOPf/axQ1sh6xjW86vWn1FSBx01LIwph7HA+WvERql+h9p3rR7
         K0V6NRqpFTXPV68LPGo+RBKsoNqP5o/osYobQ2n+58RrPXMGmNY4CTMz6lJri0XFBoh2
         tgvqVikiaf7wG4hbrP8jfIkBiozqFoaW0BIhxXvFP/I8/vGNaawhI+lM7+q6kEsWNpSo
         /C1YJwIf2jqXX19DyBXiZMzg94jjPyWBFzJVG1ZDn/YDMj3kKu6jKkAlrHBySjETp8sQ
         +YyRO+652QT08AfO/cr9OX9QvHTzgO77EvX+T5GEVgSFXDkYuBzbuS9r+95gBio/TUQx
         LFHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790240807; x=1790845607;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=pb/qIibv3qYKIWDbEUPNel9PVjN1RHSn4ca2JUKNgIk=;
        b=NXmt8Wokf8LiXOllvS980rzvWwab247mvXsaIOPTetJvBLM/htik2wCKRA/tRbayNN
         YWWMSZrvNU6wbPxX95S779fHNKuwmaI3zmN2Cgxtp5gLGX867ZtPeqHGizvEu4JP7CYY
         qhuOaLAsB9sAXzaYL4ZbQM8R/LTxKLfyHFM4+lUJZNVP4qaZTD5oYCnfkloKWKmIwnrg
         BISrw5TAGZ0wZjHRrREBFZkyRQTc4n1pwjydjzURPwGfDvPsYjYm6wwc1IpTUN27Rh3w
         jrRCqoMwGozBJck/+95JhttZTpMoPB0HNPV+Bu1I0zViSdQpYAGyLShgZUWM3TANTuPX
         24WQ==
X-Forwarded-Encrypted: i=1; AKwUvByldkIqPAcJWtojWYEM4ypIAsEamB50aF7oxCJx4Bu2bxTrAwlERZs6S/l0ZnQ/ib1smU+Q+LriEcSae4k=@vger.kernel.org
X-Gm-Message-State: AFuF++ntP7XOb/EJpU0Zing9q5FceJf0WjejpgD0K4DKVNtVoqNonhje
	3Rc8yVNkNX1no5tG+rSE56a+wyxg57VNAa1Y1v3kV56GnJbcOZfPoalN
X-Gm-Gg: AYBFou3qiO/Z04HQAJj7eL6X89i6+V00h/rATp/Hz16FtObJJaSZiD8usraxl4PThP3
	cCbHYcKCjw+skp0KnBjUevVYweR5JXNrGLHp/b2ptz4aNXLBccnxn0OHjYEHqhb9XwTM8ykZ7tj
	8tHRvgR9bV+74wVUfIhfWlsUEH1OyNxiVvX85Xg621W7sel8WVvdVelngovP2tLSd0KYQYmuQ/Q
	q+PfWkcdvhejvyS3KF9ZsqaaLBkMylOXl0SdDaIZZLOh14CTzBJzmGr/3nPzojiCV/hwSrif9dK
	bfdyhgTlmYCmjbdpF8/1a/G/sCZtzGofn6d8zbXVaNRC8BFmjcUP+0GnLQVfo8CeDaYH5NELjf5
	SpzMuHHCzTom02XsSWfnCqDMi1XB2eeyY10vcfqc0C2qRy1McLToVD4is68V1gr2mWSDSK26Cut
	kevEdYldRko5bvkCfLJtPgNjMod/kDrLIaf5iJPh0fs9cXm+u6XrSUYUI8aRaqwag5RFoyJ0ZFu
	+vmsamk7pMa8Vmd3I/b3Sq1h/f4Kg==
X-Received: by 2002:a05:600c:34d4:b0:495:6e68:5df2 with SMTP id 5b1f17b1804b1-49fe66d07c9mr28228545e9.12.1790240805477;
        Thu, 24 Sep 2026 02:06:45 -0700 (PDT)
Received: from xeon ([188.163.112.76])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4886877c379sm12875561f8f.29.2026.09.24.02.06.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 02:06:44 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	Ion Agorria <ion@agorria.com>
Cc: devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 6/7] ARM: tegra: lg-x3: Add haptic engine node
Date: Thu, 24 Sep 2026 12:06:07 +0300
Message-ID: <20260924090608.28734-7-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260924090608.28734-1-clamor95@gmail.com>
References: <20260924090608.28734-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add node for Imagis ISA1200 haptic motor driver used in this device.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 arch/arm/boot/dts/nvidia/tegra30-lg-x3.dtsi | 24 +++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/arch/arm/boot/dts/nvidia/tegra30-lg-x3.dtsi b/arch/arm/boot/dts/nvidia/tegra30-lg-x3.dtsi
index a59539f36a316..bd82a3f7951a4 100644
--- a/arch/arm/boot/dts/nvidia/tegra30-lg-x3.dtsi
+++ b/arch/arm/boot/dts/nvidia/tegra30-lg-x3.dtsi
@@ -1614,6 +1614,30 @@ power-sensor@40 {
 			vs-supply = <&vdd_3v0_sen>;
 		};
 
+		haptic-engine@49 {
+			compatible = "imagis,isa1200";
+			reg = <0x49>;
+
+			control-gpios = <&gpio TEGRA_GPIO(H, 1) GPIO_ACTIVE_HIGH>;
+
+			pwms = <&pwm 3 53000>;
+
+			vdd-supply = <&vdd_3v3_vbat>;
+			vddp-supply = <&vdd_1v8_vio>;
+
+			imagis,clk-div = <128>;
+			imagis,pll-div = <1>;
+
+			imagis,mode = <0>; /* LRA_MODE */
+			imagis,duty-cycle-ns = <1250>;
+
+			ldo {
+				regulator-name = "vdd_vib";
+				regulator-min-microvolt = <2300000>;
+				regulator-max-microvolt = <2300000>;
+			};
+		};
+
 		nct72: temperature-sensor@4c {
 			compatible = "onnn,nct1008";
 			reg = <0x4c>;
-- 
2.53.0

