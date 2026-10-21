Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792572371;
	b=TwNQ7JQhAe923N0rEl2uUDo3T14lyyRU7PNu5qGNMHlWzfunWZd1cJU8A49bOzl1bVX0
	 RBFTZ8AWR5WjCn1Pm7nSnqiV0/X1MEZRtIHMUS6gLoqrTWxM2LHPWpA2IAQr+0SzyCCa8
	 hYWzQoWXaWwti5dcTgCNKcAbGH3AN9TqxoZTgroo669pBwQ8zDU78xdD8X2h/Mx2CZpVq
	 parRrevx9GZxtqcn0bQEj2UuO9iRJsGx892st2fs95Mfeg2ssBsdHsbbFktINPIA4255i
	 oBacJPwC8oHUcqnAgRVhgXhXA1AUPSF6Oh8xlglB7zP5ZSUMOI0O7zU937Yq2Wc17jg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792572371;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=cYjE70VK9dQOuYVSDX1vCeqjSSE/jR55HkQy4/7ye/I=;
	b=Yvd3QQ6ksHw9Iuti+VBBgDRD0sB5kur3pKWewaowNhBsKYUp2wdaDveKYNUZuetVv1ui
	 XE78N1eFkmpJspNmLJ5Bq6/6d86auosAhVGwOmYzReZvuHlxh+Q2euaNATYhwSSiRaNUS
	 s7fx1jgqA6o8AFHy4K7Tkxarvy4XwMjrrEmieNSBmZbuAdFWZ2zNV3RUxf1fKUYIc1p/8
	 kcWxynzy6nf7zT+aMib+bkM50dkxFpfDJ8/A6Z0P/weU0nqPXBEFtYnBmpk318OlafQF8
	 c6J7+0U1TD+QZRcrWaxG1k3sf9hpMf+hiQiLnuw2hB0kVzUJPCmxkmIISkm1l/Z1cfA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=L+TEqmEQ;
	arc=none smtp.remote-ip=209.85.210.181
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B668606A32D
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 08:46:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9B668606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=L+TEqmEQ
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-8a070755c8cso222948b3a.0
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 01:46:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792572370; x=1793177170; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=cYjE70VK9dQOuYVSDX1vCeqjSSE/jR55HkQy4/7ye/I=;
        b=L+TEqmEQlPVsZuo1fkvPl++sMPQwiPUJII2p1B+u3s4pc9VFskc6MpsD09l8NXlJtT
         LdCsasMDuloH36mlimuT9VkfVrLxn9XSoIVYJ70sIeYz+N0Lg+vsqg6Xg12fNgNliz4P
         irrSbM0J13u675IX4EncRuJ11PnbjOgxOOBTnoPN6LugVKvqv+24OJRN0zmFAoxZ+kzx
         WD9xlw+Ovp8BwBXDRPWcED3vMn0s/irMPnCx2noc0t2Uo3UdnotNF5Om65iUY8X0idXD
         2SrKmRmRrrBaN6eiMv5f1d+CUKzP4+yIBmDbfKLlLS3QAwnpCzgloSL4ox2crMlE1N7+
         4ITA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792572370; x=1793177170;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cYjE70VK9dQOuYVSDX1vCeqjSSE/jR55HkQy4/7ye/I=;
        b=0bF0dmDcUz9KHoNphReIeVCSpo639OJgql5viPibYzkP3vZjqSBj/CRt9MmgvAaRjN
         cyS/ROIY+KEUHNVrWqzRFmtvsFQs9mGOE3eQJAq7WkMlyKXXm9nPtB7djGARWcdeUnxl
         JylmDBVB7FZ4WUBF8KlqAFK6LHdsmb89YUscX/ZJADNXjdfoqdWl8ys7GRqiuE90bV83
         x4DhiPisvtToHWHJ1WiJlYw/w0FX1ghRXKcsRd1d625vH+IVB1BAUgeUmsxGWGzRTI96
         +//4CsPZvhUF5NEVRTxivXQGp0ULcIwDEXc6ZcSlMWigNw40HQE8MxZjVC/zaqwZPPhb
         aKJg==
X-Forwarded-Encrypted: i=1; AKwUvBzYm6gw9K5L7lCZzg+3/MEv4zMfsWJteTcE5BkV+9ndHpKta3Nuw6+KFbPun4EI28VyQ2R9VkzIIXspFb8=@vger.kernel.org
X-Gm-Message-State: AFq9FYI/abZGINFX3keql8jW5Fea375Sy6kzx2dCqg4ULRbWQxIVz/Uw
	7b7vJRToGQ1pESGY9RhKSIAUKj6f/cbVktDEzMvjMmOmgwMc4HFjuCTac7+aSskD/tA=
X-Gm-Gg: AYBFou33kOdM0DaWmrY4yCBmaWbLY3bE/iGuNz7DKyOIp+oc71LwkjE6b4YvLTLfReT
	KH9cjlrnLSZCkYYZrIHYz9zo1oWYV9VXRXTxuF4+IuhZ0xT1nYeKyu/c3uObEYNsLOLD9ZIe/kN
	ojknj1SXhN8S3HBHUP2uxa/wsHfpb87teypCX55E+M7bbbB/5HGEOnli9enQiXi20OghRf4v7kK
	XLpqzmwfEWx8+Hm6/k5YSYrhvNg6SvEYLYOUR93RU7cP+8yGLJUBNoBv+fG1YvMfM5xE9XPr8Xr
	/f+Gu/skTyAZKFMs7+bD6vvlm8iyOByCUYQn9UpULmeFFbL1svY8S2igygHu7jdDlpZC/qdRBGx
	YTDDV7ROcjRf4gf1ySFAqDBtVOwU/LNwTZgJufXjqB1KUnUWZd5Jv2pnnu8SL3OExgAqVBGSCBQ
	E8D8fL1qPJfB2SVzWHRS50WK603wu4eYQijMN5kK136elCtmZjHzAVs+yrBOcmxgE8iP3qKEwIW
	er1n4cRDSODf6eTVCDLdUkdFOaC2TtAticdm4/MTDY+Dn6Du6r+rNsA2weYAl7NrlDdQvU9VtZi
	qbvIYGM=
X-Received: by 2002:aa7:8887:0:b0:89f:129a:9590 with SMTP id d2e1a72fcca58-8a089ebacf3mr1029844b3a.48.1792572369847;
        Wed, 21 Oct 2026 01:46:09 -0700 (PDT)
Received: from FLK-B04Q314.global.tektronix.net ([87.58.102.86])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8a0895c08c8sm604998b3a.25.2026.10.21.01.46.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 01:46:09 -0700 (PDT)
From: Krzysztof Kaszubski <sympthicode@gmail.com>
To: Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Fabio Estevam <festevam@gmail.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Alice Guo <alice.guo@nxp.com>,
	Peng Fan <peng.fan@nxp.com>,
	imx@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kaszubski <simpthicode@gmail.com>
Subject: [PATCH] ARM: dts: imx7ulp: add "tpm6" pwm node to i.MX7ULP
Date: Wed, 21 Oct 2026 10:45:59 +0200
Message-ID: <20261021084602.121087-1-sympthicode@gmail.com>
X-Mailer: git-send-email 2.43.0
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

From: Krzysztof Kaszubski <simpthicode@gmail.com>

Add the Low Power Timer/Pulse Width Modulation Module 6 (TPM6)
node to the i.MX 7ULP device tree.

TPM6 is located in the Application Domain (Cortex-A7) at base
address 0x40a10000. This enables PWM and timer support for
peripherals connected to this domain, such as display backlight
controllers.

Signed-off-by: Krzysztof Kaszubski <simpthicode@gmail.com>
---
 arch/arm/boot/dts/nxp/imx/imx7ulp.dtsi | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm/boot/dts/nxp/imx/imx7ulp.dtsi b/arch/arm/boot/dts/nxp/imx/imx7ulp.dtsi
index 39e37ae9b2b1..f5ec5e9d65de 100644
--- a/arch/arm/boot/dts/nxp/imx/imx7ulp.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx7ulp.dtsi
@@ -216,6 +216,16 @@ tpm5: tpm@40260000 {
 			clock-names = "ipg", "per";
 		};
 
+		tpm6: pwm@40a10000 {
+			compatible = "fsl,imx7ulp-pwm";
+			reg = <0x40a10000 0x1000>;
+			assigned-clocks = <&pcc3 IMX7ULP_CLK_LPTPM6>;
+			assigned-clock-parents = <&scg1 IMX7ULP_CLK_SOSC_BUS_CLK>;
+			clocks = <&pcc3 IMX7ULP_CLK_LPTPM6>;
+			#pwm-cells = <3>;
+			status = "disabled";
+		};
+
 		usbotg1: usb@40330000 {
 			compatible = "fsl,imx7ulp-usb", "fsl,imx6ul-usb", "fsl,imx27-usb";
 			reg = <0x40330000 0x200>;
-- 
2.43.0

