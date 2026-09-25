Received: from mail-ej2-f12.google.com (mail-ej2-f12.google.com [74.125.228.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D0E54DE73F
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 19:17:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790363839; cv=none; b=THj9QmLQMJI5NfMklHDhN7NZah4k7zt+Nu0zULtqZ5D7iUJP2Kz51uu4f8KNSJ5CzysfWQqCT9ydNAM5/E5le05pBQr4xAyqwxmkwuYDe4IQRTHsey8Ba/oM7n4U47RtzC2fZwi1vv2Sb9IAx3yqHxEGbnAKwKAGXUL+A9TMiAc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790363839; c=relaxed/simple;
	bh=eut8Cv4jfu2+xcxUpOFcKOIZy7il2Fd4FaptjLAhI0c=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=nXnqw64kHWTwXbrFsoJTBwvBL4NU4FW1qw2iaFOQL4zhrGwIlvr4POvkDWCeLg2n/pNwMLEpvPa1udCLkvTAA6aYY1/UjslXFhGudwhCeGxngJwJepgAp86vPR+/MnhsckSk1nLk6T9xYIAEXBNcuAktnCqaYVlSzf1AOG4xFoM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sartura.hr; spf=pass smtp.mailfrom=sartura.hr; dkim=pass (2048-bit key) header.d=sartura.hr header.i=@sartura.hr header.b=JTNXrVcG; arc=none smtp.client-ip=74.125.228.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sartura.hr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sartura.hr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sartura.hr header.i=@sartura.hr header.b="JTNXrVcG"
Received: by mail-ej2-f12.google.com with SMTP id a640c23a62f3a-c29d50b7cf9so201464366b.2
        for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 12:17:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura.hr; s=sartura; t=1790363835; x=1790968635; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=GIUbYqTz3s4MkcnIs81Mp9c9fGlqFAgb/HyFW+foZ1Y=;
        b=JTNXrVcGYtuPL/Jr+fr/lve9oCbNKcV3IWLq/7Rpnd0cWmGqjZZIkZKCE5GwZhS2nC
         yv1qtmlZA5qK6G+z7IJzZItxloPMzKXsplpSbmYDjZrXAdqt9hBoXToP0DxJ7T8LMt1A
         Hwo3PgtV5UIgTyy7oOUWwfGNTE+E8JpYJ2j8hTnk1qwlvedvje9Y9x0BbrzUPgKR/ene
         3MAdatgW3BjE8gjBsOwpQjKI6FaQ6Lm2IYDYyvl1+Rs/wXbQYUDQJc+3E2bSJf2Q+j8k
         d6wvrFzatjuMwgvYGX+82ox4m5BzmbuuFrM1cngyRjLutu2CcV9WpW/NFZnYT/kL1889
         +20w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790363835; x=1790968635;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GIUbYqTz3s4MkcnIs81Mp9c9fGlqFAgb/HyFW+foZ1Y=;
        b=KGP2cD2rJo2/9Py7PsWAsdxNqhVRu0SNVV4oBieCn64dpRjp6K4kvCMna9zBg/Un1z
         wXYV0k9wYAPxUEhFHopa0YbKI8LXaeCEFonhgsf0T/DWcJBrrdvxwrlwdy6XNua352WN
         Pa8yutjpPuvIx0EEqim/HTczzkT/Or+bk90Ft4zU1cIAUTIx2EFBZeLwL/0IsApWRTZf
         C5qrdtMavhq9Gs0lwTI2BKIXAH/L+8M565HdbhmxFalM/q8nU25kUpmum6kapLzV1sWg
         CX55CNIwWOFdJz+KW7nTziKIRKVAWszJ0yXXPNqGkrPsyvV5p3ITuQ0XAiowSvbcqghK
         1qhw==
X-Forwarded-Encrypted: i=1; AKwUvBwMen1oDVm/q7+KUuylZsq3o/XkE26yoNMcCwsqAabcgcSd6eg33U+lX7y9wvzVeuZnGdGiQwHc5iL+/0I=@vger.kernel.org
X-Gm-Message-State: AFuF++n5mbK2rnS9yfm114POovFLftvo6KUOeWfD6Ce/79PfnWXPk7PH
	gAxPBmOErqLG7iCW+rxQSwkdvoi/9hdiUoQfNWYEGbD+FmKPQuakglgu6Vm0RPmWjQE=
X-Gm-Gg: AYBFou2JNdtaUDO+SpnKVwGSJYDd47A1LaXJV+4dFLG64PzRzAbWc4IVJmoF873C5ae
	rEFk8EUHySqIsETBZIKAeC37bdmKt27QPnPudNuSlGDAViVSFiB51GZIwXkc7DQzFCrNZ/MxMSw
	dkIWLzPaVjuGNsbKoQi6o0WPi0Vb8YpqOskZ8J79UtEPoeorBLUmqjb+ii6cUlplKjyo+HafVJ3
	UVqMimsiO5TtmU6zbjpbmk+Z2zOyLsLE7T9VZk0v7e0dr+w1CG+WC3Zc53KFNDPpI6pffGz6oU6
	5dUkQlfIlVaygdfnvxkQ4jepQU1sHlyqQZI2v5XL657sbWhSPkxtDtcBQVBd/sXEYeGZQ+Fpkie
	h1ve170V4za9ghYkLuQkw0jtJPdLdCUiEgTx+AbxGjC1OsyUCPgcoKcvINTwtHV1eHkmWB12Bqz
	VhNkrrVpPm2pAkJv1YTDjrVUPxVLjomECSCasMbFoCmx0YOsoitqGfK0mZ7iPVX0CTz8OM8ifd0
	bxuPo6MMwsuK/8O+NYeuHd2W309gkDf6UtNyV3qHI15AlLbJTmI9slLSp5qkNZqN5kg/UqKtxsx
	48KkzSdAwSRHyX8jbgTQ3pponQhmgrqS
X-Received: by 2002:a17:907:c23:b0:c29:659e:2fd6 with SMTP id a640c23a62f3a-c2ac23dcbfemr638910066b.10.1790363834719;
        Fri, 25 Sep 2026 12:17:14 -0700 (PDT)
Received: from threadripper-fedora-workstation (d-zg2-212.globalnet.hr. [213.149.37.212])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2ae782a309sm160881566b.62.2026.09.25.12.17.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 12:17:14 -0700 (PDT)
From: Robert Marko <robert.marko@sartura.hr>
To: andersson@kernel.org,
	konradybcio@kernel.org,
	abelvesa@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: luka.perkov@sartura.hr,
	Robert Marko <robert.marko@sartura.hr>
Subject: [PATCH] arm64: dts: qcom: ipq9574: add reset to SDHC
Date: Fri, 25 Sep 2026 21:16:34 +0200
Message-ID: <20260925191706.1579990-1-robert.marko@sartura.hr>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add reset to SDHCI controller so it can be reset to avoid timeout issues
after software reset due to bootloader set configuration.

Signed-off-by: Robert Marko <robert.marko@sartura.hr>
---
 arch/arm64/boot/dts/qcom/ipq9574.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/qcom/ipq9574.dtsi b/arch/arm64/boot/dts/qcom/ipq9574.dtsi
index 5a5bda5f21a11..ecafd4cda6e7a 100644
--- a/arch/arm64/boot/dts/qcom/ipq9574.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq9574.dtsi
@@ -471,6 +471,7 @@ sdhc_1: mmc@7804000 {
 				 <&xo_board_clk>,
 				 <&gcc GCC_SDCC1_ICE_CORE_CLK>;
 			clock-names = "iface", "core", "xo", "ice";
+			resets = <&gcc GCC_SDCC_BCR>;
 			non-removable;
 			supports-cqe;
 			pinctrl-0 = <&sdc_default_state>;
-- 
2.55.0

