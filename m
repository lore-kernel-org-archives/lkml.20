Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792595050;
	b=m5Jo1rZ+TqWmGxdWnsI4E+Cqu19gb0QVTXWfPSLtYx4YpxvBj+zT8xzsREvEIf9Q4Hp/
	 OyRRJsrhPMY/5ujq6W5sei2AB1HeTUHxSNGn7WX+1IkMupQEpwGLDu+5xYaLtHirm0YDK
	 n8aY3dEJwA1cPDZ1Y+Tct51YXU/KlUlSicAx3BBLo2O/vRPW01mxoJ56jK2NiKFlCzG4C
	 w8ryQ20MEv/SVmALeL1+hMiL8Zi58DkUGkCZjjcnKCj5dBeZHEBhzFtYEzWX1AR4yeg2c
	 ORFbu0JdyqUaafS+aEbiIN/j/Ij+y3CBiuM7F/f+LYBoLfNEy0v1SSIAOm8zKLjt9AA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792595050;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=H2whTFX5ouPL2hUuwdfjxOIwfbFlRbLM+ZVtzNCmR9k=;
	b=u/rRI+x88sz4q2uD6toCMYhdMUN0cT3t/OCnz3y9PeU+tI8GmsPV3bROZYNU9V+H6a3y
	 HuubOsRYUrickGAGcWZbQengy86T0bBU3fNixczNGzywu2oJxF6XOmQpM2ZE+bVW+GgZo
	 fkhd3ZkCS4Ieyp6cIco5p6c9eV4tFLG3/OaAcuE3tPhrFVsL+OOvQ90WZ6XBLXom4pzKY
	 VFp99Qx+nrXBLKlzvR4hZdc1WKpxltvKlyD6yviOHRWFUMEvO2tWn7GKjUX+xqvvsMhIX
	 +1lhdrNsjfOjhhVgPWZqtErRkw5qEwdJfseGdf0jzbB600wke81shaUQnPotdD8FIew==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=F8w9YBSo;
	arc=none smtp.remote-ip=209.85.128.54
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7F92606A31A
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 15:04:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B7F92606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=F8w9YBSo
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4a2001dd4e7so7428765e9.3
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 08:04:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792595048; x=1793199848; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=H2whTFX5ouPL2hUuwdfjxOIwfbFlRbLM+ZVtzNCmR9k=;
        b=F8w9YBSoMr7xqb+0QTAUTxj1/zVqAtwOSTI7cUFFeN06YT5II/1YzDd5R7VyY/g+i+
         sgTn4YjJNqtZLOOHojP0KPh9pCx5kA//mtURao8XOyuW6eOw5GLMCQRYKJvrP8qum0EE
         bRaketirz5DmmqCFEcWyu05o7wlCqxsSSfYdd/nafRjaSi4yyXCtqmsu9mWWJFttpHMf
         H9X7JiPmlj4Z5GZZPtVcU45W211G2kIq6a0+jSbUFvsDBu19KOmHAVjOBLtzyEB9FM0S
         1mTssagfIrLn7EOMK0CPtUbpWMGGmkcuTN6vvdyF/qT4Q23ZOgk03fxS350V/sZz5IUi
         vcDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792595048; x=1793199848;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=H2whTFX5ouPL2hUuwdfjxOIwfbFlRbLM+ZVtzNCmR9k=;
        b=CoENAbr+OOyn3wXTjJIzyGlGRc1uxqh9CskUsuz5RsVN5mR08+CtvLr44d8bVNyINf
         NvF6sx+8aXZrPbY10dCV2iCva1i+lbyfFWA01XftwbTSBLag3onofgqDNsMi0Kj1A5Ks
         0NmR2hGRt+1L6V25JMzsOk3uqGp3ftQbcTx6ghptX6uyOqLYsRnCZp4O/kVXkyuqpXmM
         Cp//WQAd5+tCacz9LRe1MAsFV3oemGlLe3DvkPtLLRGFKMauTj+Dt4j+gYuV8osCuNDx
         A3G098mZcgJLwfF/uHkaCh1ZuIblKds1J0NCqrywM+8OAkmwb4G60OJ6V25n6Es6pJjG
         XKXw==
X-Forwarded-Encrypted: i=1; AKwUvBxPK055jyHjIFjjxDRVmAD5qvM+dvW3k+J/OwOpql0rG7Akf6YUqW9fP4HShCsltIWkY2ob6/BYKcDZcQs=@vger.kernel.org
X-Gm-Message-State: AFq9FYKwnMz3gtqH+ZsFc9L/2EEn94zr4suTFqZJWPmUFa3TlDDhsM/r
	A8qWRMnGxfaDGyQ1wENW0RnS0+aIzZZN65ij34evW1xGLNEpRy7i2lB1
X-Gm-Gg: AYBFou1T+/lyDrO1FXYCZEnl8BZwIvujxtp5+mfKGxbjniW+DgG7PCMLCeCZJ12pTBj
	9TXEIhQbcfIrl9uuGaYeebXQoj1WTyLGN6vjVyQAl9Eon6KZZw1crnUQFtLvCSr1dl/PTb2Dorn
	eYkzkuDjt7USYHK20bW+mzvBpGcfbntGZcku9wVHW2ydXxuAmfU47OLAPdq7qZPZ0TjeGr8TzUx
	z1oFB7wrkZ+9pDL1tFPnlxJvbFHgPnpvaojlRKeL/rSm9nV1tQODXd6iYmI6NPIxGJQGsb7DmXr
	bveslQ2QpMPcTIYtiO9e6rNPomkJbcG2BfsEqri09ckvwQSu67tVbSKE7eJ3WgWRC5jBjqr4EI9
	LF02veeewcY6XME51Q/wvyEnRNVzH0xGlmFQuaQIR1p2BLTo9TMS0MvtNBkfKpyV561GmDFY8df
	wu1/CVYLwKKkjbWRnH5ghX891nPYLVg2Q4zpaRxKagmn92XsXF90ppGGmLC/ZVtAgdelKNrINnV
	yeFbj90F0jUfKBL8dz55NShPNn0pXeCxIMAwX2XVM8WjQ0Y8iA4NZ4xZFTug14Vx3PvKc80Or2o
	rD/W0lXKSH1TF29Wm9BQdqYtOCQkjN6LNfusG4OOX7w5YPdh5N3hO+vHvA==
X-Received: by 2002:a05:600c:4713:b0:4a1:6992:f861 with SMTP id 5b1f17b1804b1-4a1fd8a675emr51336125e9.1.1792595047719;
        Wed, 21 Oct 2026 08:04:07 -0700 (PDT)
Received: from FLK-B04Q314.fortive.net (217.97.98.50.ipv4.supernova.orange.pl. [217.97.98.50])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1f2e8daffsm179698705e9.4.2026.10.21.08.04.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 08:04:07 -0700 (PDT)
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
	Krzysztof Kaszubski <sympthicode@gmail.com>
Subject: [PATCH v2] ARM: dts: imx7ulp: Add TMP6 PWM node to i.MX7ULP
Date: Wed, 21 Oct 2026 17:03:31 +0200
Message-ID: <20261021150403.71569-1-sympthicode@gmail.com>
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

Add the Low Power Timer/Pulse Width Modulation Module 6 (TPM6)
node to the i.MX 7ULP device tree.

TPM6 is located in the Application Domain (Cortex-A7) at base
address 0x40a10000. This enables PWM and timer support for
peripherals connected to this domain, such as display backlight
controllers.

Signed-off-by: Krzysztof Kaszubski <sympthicode@gmail.com>
---
v2:
 - sort TPM6 node by unit address

 arch/arm/boot/dts/nxp/imx/imx7ulp.dtsi | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm/boot/dts/nxp/imx/imx7ulp.dtsi b/arch/arm/boot/dts/nxp/imx/imx7ulp.dtsi
index 39e37ae9b2b1..6240750b84dc 100644
--- a/arch/arm/boot/dts/nxp/imx/imx7ulp.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx7ulp.dtsi
@@ -366,6 +366,16 @@ ahbbridge1: bus@40800000 {
 		reg = <0x40800000 0x800000>;
 		ranges;
 
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
 		lpi2c6: i2c@40a40000 {
 			compatible = "fsl,imx7ulp-lpi2c";
 			reg = <0x40a40000 0x10000>;
-- 
2.43.0

