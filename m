Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794919200;
	b=PDqC/I7qiORvQjn9BbUZ52cG6B1ABsRgPOHD3JYh48JKo0N1axqkGZ+/wN2oqgeIDaDW
	 J0lpl66t2uAm6Rm6msZeLeKH66gofCZuhN+QQgqDQ2LXywBp3+D5051u4T7n8sNbbmgSO
	 G0LuD9uGlVsvINTpzu5+YrmZg2dYcPih8rCD0Zqkz6cJvK8lp/8IJXlBSfT/L2Qauoz/e
	 DyCjDUA4YWl0GImSua1Fa1AJOGF4Gz71oJ2QjYuCHNDWlGiguI+kVrlX++lcYGTT9YYjQ
	 huSd+cdtoiRpLcn8mRJNRpV0waSHx6OC1cnq7EDxnbfEy5HVAWZiGST4/JPq24UAv4Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794919200;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=qFNx2PFwju3GpZX8sb85V+O1VlouegAUrn4ULDGVae0=;
	b=wTbsUOtAtZfj3y+nPVhoy0G0DQmX4YtdpLNP2fzi5sf6yLLeqMCJ3BYhx3veqNT1QNW/
	 ++il3JidqMbPN3ESeTkGqNH5c+1jWX2nS9bubjJGyftMdxIgvjF2AAeymBetEE75Tz7m5
	 WnqbPZZgeHbWDXATJkKoEfyszHE/dMdJROvrOWkEJbhagXkboumWv9ThtWpIlVEaeNWMs
	 Qo99bIRYv3IWhYac0MLJA+OObMSa7AzN3oxyZOKnI9nCLDTU83Ky0gGEhYzK4wxY40k3Y
	 TXxSg/59YoZ0p+OTBq7FyFf1Sk/N3yEJOxrzfgvGomN3qbFtBM8M+s24CN5eLm+vUGw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="V/lyBsh6";
	arc=none smtp.remote-ip=209.85.128.43
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBE4860A5BEB
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 12:39:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EBE4860A5BEB
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=V/lyBsh6
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4bb64ef5a00so19247385e9.3
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 04:39:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794919198; x=1795523998; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qFNx2PFwju3GpZX8sb85V+O1VlouegAUrn4ULDGVae0=;
        b=V/lyBsh6gxkoHD6nVXKA0TPVLKWRTocRRXjqbnr2UjPo3cTBWHTO1g+x2t0GJeWYtf
         OU6mnapdKuQQkEYZXdAa480Ab04nrv2nsuotmGGR/B8AaB1BF3P0Tvuwvf1I/bmAkAQ5
         knX0u9WEflKM814SXPtCWZ2DIYNtcp696loqmMdM4PwxMnhhneNpIFF/1ZO24hEtBmWh
         BxQ5oBDjpZihX2IPVo/C+sdINcMhL8oFFagr9WxGoMB2Pzlz0En+6QEp/TGmpR7Tu35n
         JwAzYpk0Au5oKmDb607M7ruAzarlKLI0jrfnU4ljGPXNcGpB3phlNdF9y/OkaGEEGfw2
         eP0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794919198; x=1795523998;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=qFNx2PFwju3GpZX8sb85V+O1VlouegAUrn4ULDGVae0=;
        b=V2RmmpLhreER9jeJm7yxvsU53woaSWS5m4mETZyGwzXGXGjZw3pI4PtAex2RdbJNdE
         YU4HGkh/GCt1G9cconnyOzdeTT0ZcYGIQqVMmalcCc7/oxjjUiyJZzm+ooi0mgjbNl0P
         DPhoSZkXk8+UcW3A/yCVPEFLY/QWs7yY5mot/lPol+cJYv2LgkSfvWrmLgLV0UBy6oeh
         VebRoxfezZdnvIg8sqUcJg/sUdcfQ2eeP94QHipR9Xtx11WMIPPtdggZ3hBcY7xrIBST
         Z9em2ncUKAfLVnMsKZHrHfkIBkmsZ4xczwUwXC7hknDK5pl4Uv8FqFISMWlIoH0WOHFC
         ovOA==
X-Forwarded-Encrypted: i=1; AL+hErGQ3RLyjeQ01CVmkF22C+RSBaHLqrHXJhsu8onHSrSBn/To8zvHGEjlnF649qJLigZA5UpifsFZDuaZmdc=@vger.kernel.org
X-Gm-Message-State: APuU4Z/VMVmXqdtO7ocPx0eqjKq8ubuumY7Jo72Ae4M9BygFJYO9piFi
	BdXIyprQJik3bzvq8gjUuYIqv0+bKA6jALz8ZpIWrAXrK0rqePfSpt/P
X-Gm-Gg: AYBFou0dNaLDTy3s2YB5/BRbCo/MRNU1W6TVJdJwtP0PuLfOjLEvS6/eoHk8A2zQedq
	bepGPmMSVr2MLgQLRWt30zI1rVGTi28JTMiKZxvgEM4GwbgTinMzXOVWcKrUolPbf8zVoQkZmKM
	0JoE+lU99jRRg8T2nsJwguD1FJ3epKOws5b39wUiE9ZhZxIaYidSNkdMY0Bww81wem74yFmUmA6
	1Fcftu3CvQyf9K2jbuqv6v2+gGxEyKClc6ePkWJ+OI/7Cjk16nha3t8XTd81UVJc87U8UX7XsDJ
	/IXxCcopXAi9xP/ZXXAdtjaJWWrwQmf/lotYvovsaW2O+LqjgpwCndLryC0pOVxl62ZvY9jVrqn
	n0juNC7NauzocKHyKUIGyZOrZDvLPDXx7vHg0cgxyfa/s+H5FtskyERE2xPMyB3/503Qc8RUq8A
	0cr19qNMdWZxgDDkscvFiHQoA/TvQaiXd/4nwMEwkWt//oHMQ31pclZ1XB0d1uvo15w4Gel7CFY
	n9BcUkOwvegyVlX13JC95HpuF2/nrNaReDNYXz0UbAAcHvrpj2viMEDNaBYbhLqI+GXw8f23sLj
	WABAWYyzR0JhEKItwUtOPMVaV9/NGT17sYXmafAn0BgFCHqdDy+mKDn1C9AxbO6O6VSoSg==
X-Received: by 2002:a05:600c:354a:b0:4a2:18d4:f9e0 with SMTP id 5b1f17b1804b1-4bb55abaedcmr286510265e9.25.1794919198290;
        Tue, 17 Nov 2026 04:39:58 -0800 (PST)
Received: from DESKTOP-BJ3EVC4.lan (94-21-223-203.pool.digikabel.hu. [94.21.223.203])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb783f8154sm71474905e9.4.2026.11.17.04.39.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 04:39:57 -0800 (PST)
From: rofikkerneldev <rofikcoga@gmail.com>
To: linux-arm-msm@vger.kernel.org
Cc: devicetree@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	rofikkerneldev <rofikcoga@gmail.com>
Subject: [PATCH v1 09/11] arm64: dts: qcom: sm8250-lge-timelm: add SW42902 touchscreen
Date: Tue, 17 Nov 2026 13:39:44 +0100
Message-Id: <20261117123946.668557-10-rofikcoga@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20261117123946.668557-1-rofikcoga@gmail.com>
References: <20261117123946.668557-1-rofikcoga@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Describe the SW42902 on GENI I2C13 with its interrupt, reset,
power-enable GPIOs, pinctrl, and native 1080x2460 touch area.

Signed-off-by: rofikkerneldev <rofikcoga@gmail.com>
---
 .../arm64/boot/dts/qcom/sm8250-lge-timelm.dts | 36 +++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8250-lge-timelm.dts b/arch/arm64/boot/dts/qcom/sm8250-lge-timelm.dts
index fca48472f5dfe..a094aa81ad225 100644
--- a/arch/arm64/boot/dts/qcom/sm8250-lge-timelm.dts
+++ b/arch/arm64/boot/dts/qcom/sm8250-lge-timelm.dts
@@ -596,3 +596,39 @@ &mdss_dsi0_phy {
 	phy-type = <PHY_TYPE_DPHY>;
 	status = "okay";
 };
+
+&i2c13 {
+	clock-frequency = <400000>;
+	status = "okay";
+
+	touchscreen@28 {
+		compatible = "lg,sw42902";
+		reg = <0x28>;
+
+		pinctrl-names = "default";
+		pinctrl-0 = <&touch_reset_default &touch_irq_default>;
+		interrupt-parent = <&tlmm>;
+		interrupts = <39 IRQ_TYPE_LEVEL_LOW>;
+		reset-gpios = <&tlmm 38 GPIO_ACTIVE_LOW>;
+		vcl-gpios = <&tlmm 67 GPIO_ACTIVE_HIGH>;
+		vdd-gpios = <&tlmm 68 GPIO_ACTIVE_HIGH>;
+		touchscreen-size-x = <1080>;
+		touchscreen-size-y = <2460>;
+	};
+};
+
+&tlmm {
+	touch_reset_default: touch-reset-default-state {
+		pins = "gpio38";
+		function = "gpio";
+		drive-strength = <6>;
+		bias-pull-up;
+	};
+
+	touch_irq_default: touch-irq-default-state {
+		pins = "gpio39";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-pull-up;
+	};
+};
-- 
2.39.5

