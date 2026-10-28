Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793187318;
	b=wL3erq6Zs5/NlF6vJWWwH1/FRHz2Bn2WthON5VYI1PenwrG1cHPUkqi7RwwIbq9zs9ll
	 SQBJWsfBjwTGzIwGGDr0pgQ0iaJGvqBe7sqCIUcA7dO2CHx5sTq9dMtliOrA6yeaYybsy
	 saTBTTyUAi5ywIogH9d69X4XzCEsOeNiXkeChtB3kOvasFvKHdPrMTil5AyN0ZmsBW5wk
	 NLzjsUgP4Nl+ZkVNgIzD8c+v4gT9dBiUSypYdBYtEFR9t4Qx7156OK3Hr/MJgctJWlGxD
	 V6AkNJUSiKcmoq6BnHO9ESHP1b/bIaSdKwnoLQxcko9AbHCSzLwcf4GgPXM56rijA4g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793187318;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer;
	bh=kzgvlmTIhVHGThdIV5sswGrWTSAc2jljnSQn/BZ1riE=;
	b=vgKCTxXw/Hqw3lQVXSYefQtPB04pb1nKEoW87kMaOgzaSpfz6XisJc4nEd9OEVMGhSQ+
	 7kL7mCG0tz71g4pXbLNoD1x0R+8FyN+xeGJJTnY3rHer3YFLqarcbnfShBH1XgBX2WcSP
	 gAhU9Ex/yWZp4YZT4TKR0ezqGuEJJykc59vB6LdBiFOX/UVD1cHvSEh5RDzR9uJe/bzRa
	 h+8woSnKx+cuSpqkGCGZVxjCdUBAqsUo7SSQAjdslnnL9eDvQcnHt2rWdZCRdmcrqMQW8
	 2CLVuh+pCosik2vWLjNlhlYM5esF+0jXXodEwvWVA9IBaRce0DPgX5CYkS1Rzp4XPcw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tsLTzI9V;
	arc=none smtp.remote-ip=209.85.221.48
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D64DC606A31E
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 11:35:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D64DC606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tsLTzI9V
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-48e10a70540so529004f8f.1
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 04:35:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793187316; x=1793792116; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=kzgvlmTIhVHGThdIV5sswGrWTSAc2jljnSQn/BZ1riE=;
        b=tsLTzI9VZoKRk/q51Pu4eLBuLONVghSXvcYs1G8s2KfnLdohPn3EVuLGIBS7DZ3GNZ
         YiUkN+F+B0ViKPvNF6pq4YG0deuHd16A3W98OzWCeuA1dEu4G14Zk595Gz/I0UEFavoj
         rHs9Eft/lzswG4QoiO3hhHZlgL60ar7rjvWOeMn0kKPXwY3l8RS5xLOVa6Bx3bzBfinM
         JkPqJ9DQr/paZOzIFR5XleJ7bDbTzw5If/lKKQHlZcAotRx3bRuvnN9NSGhOXhUS5FfZ
         F2C7GjJv+pSQwII+k95KachwRtC24m9sujkGiM4uXi6o1Bm49d41r2fxseauI4c0gRDM
         dyAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793187316; x=1793792116;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=kzgvlmTIhVHGThdIV5sswGrWTSAc2jljnSQn/BZ1riE=;
        b=IKfBGUypgGBd/EVxH/8ZbXiygVYxH41078iJLI3XD/2bTEqAzqqif9Fu8JqQ3/f1I1
         l1IVjsdufUuk/PVX0BpxmstgFdOnLv6rqY0ey0HuLnE8QrsQXjfUKL/kjBpoZUkEFTnJ
         KX0hBqVbkS2Go2y7MASMEmfgPk6qNIX2ak47jJGtvUqo+bvYwiJCptL29BSZsiJoGJnq
         PlOQj2dgH3nAuk78PjgXTnzYrjgLTqCQIPpGtEqpT05rX+/PUF4XBo88yTVXisyQWb82
         HlINTAozUsRI2aTwAS0LjPCiMRINqXc3okqCZlie5wRWGu6AvT5mszeQJhPWMmv5tuwB
         cnPA==
X-Forwarded-Encrypted: i=1; AKwUvBweFEOrcCA/8gBgQfpJSgyZwCgZ+P/xnpY9q4QAzdI9iLXXbcTyxk8mJEXAWmu/pgphqjdGSsWpRLdNO+s=@vger.kernel.org
X-Gm-Message-State: AFq9FYLbDX+nsW5VxPIgTPBwZBKpTLpID9p2D1oElhb8Tjnko1tqIbHn
	y8fDdK56E2/5u0PXTt7hv4DtN7gB6adkizeBem7kah5mLZIQU1iszY/B
X-Gm-Gg: AYBFou36uiv0+zjwsqBdo65CdzxHSwhWrny4nDQS6YsEoK0kja9hRZpqOby13rWqxMc
	CXoB3bUAwYqQqBCJLoWcQ3FADwzD9ISQGNHirLI2K4Q5gUas2TeAnA0sfuhAWwvAXTIUbgLBafQ
	9Nnifa/cs8UVm/0g9TmGTM+fTGX5xEik32vHNXq2zmCZ188a+/qzem9gUKEvnUD4xXuQlwbeEV0
	6QMNFwi9HIBFBE56XIHm06b247BK65Xb7mtLOHM+MAJvfFHhtrXaUxmYKBFhec8i/lohJLR/JUW
	gxihPDGSsTa62uyD3YHLB4MVgA90AnvfdEWDwpB4dSdui8J97cKNQn6AU0RAEqoMZUziVq3LiIq
	r/7Q5LudWymcx8mTrzbPFfovzzO/bKaAPB3x9j4KC79HCo6B/okyhSz4erXOcFiYWniYguk43Xk
	XDwlBG5lYucH4XPk+XfvW2iGakapes/t2pqfScaH0+NxjBX8vTFwJEo7q39PwEK8f3hovkBGA7x
	mIZjoAEGgQJW/OEqvWzUdlp+A2P2T+kOWcGwz4xezrElrT114ZjVZTkxblV5ulIm94vczWpnpNz
	+n1v0WhN0cBt73mLzrOHUVQ39pkKWdip5ncCF71CWA2mWxHezJXlh766+l4fxkuCECi7qErfQ5F
	SvHu0yb3AaRokI2NJcLVkzviy2TTsiw==
X-Received: by 2002:a05:6000:2207:b0:48e:5df2:fd24 with SMTP id ffacd0b85a97d-48e5df2feb5mr4476377f8f.32.1793187315926;
        Wed, 28 Oct 2026 04:35:15 -0700 (PDT)
Received: from ernest.hoecke-nb (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3eb8f36asm28144706f8f.1.2026.10.28.04.35.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 04:35:15 -0700 (PDT)
From: Ernest Van Hoecke <ernestvanhoecke@gmail.com>
Date: Wed, 28 Oct 2026 12:35:09 +0100
Subject: [PATCH v4] arm64: dts: freescale: imx8mp-verdin: Add Cortex-M7
 remoteproc
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
Message-Id: <20261028-verdin-imx8mp-m7-v4-1-d4e23e62ebea@toradex.com>
X-B4-Tracking: v=1; b=H4sIAOzd4WoC/4XPMW7DMAwF0KsEmstApBRb6tR7FB1Uia41yA7kQ
 nAQ+O5lPBRtMmT4wyfAR/CqFq6ZF/V6uKrKLS95nqTYl4OKY5i+GHKSrkhTh5o0NK4pT5DL6so
 ZSg+h80yd61xvUcnaufKQ1518/5A+5uV7rpf9QsPbdMe0x3tslMRQuAaoHNIFGoIGE72xnmP69
 MObSCHxeoxzUTe80S+IWuNTkATsExprBJQ8guYPSPT4bjOAEAZylsmdDKb/xLZtP0UfMshUAQA
 A
X-Change-ID: 20261020-verdin-imx8mp-m7-a69e26868741
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
X-Mailer: b4 0.16.0

From: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>

Describe the Cortex-M7 remote processor available on the Verdin iMX8M
Plus SoM.

Signed-off-by: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
---
This patch was previously part of the Verdin iMX8M OV5640 series and is
now sent separately, as requested on v2.

I am away in November, replies may be delayed until December.
---
Changes in v4:
- Use IMX8MP_CLK_M7_CORE: IMX8MP_CLK_M7_DIV is not registered by the
  i.MX8MP clock driver, so the remote processor got no clock (Sashiko, Frank)
- Link to v3: https://lore.kernel.org/r/20261022-verdin-imx8mp-m7-v3-1-af284e28531d@toradex.com

Changes in v3:
- Split out of the Verdin iMX8M OV5640 series (Frank)
- Move the UART_4 overlay to the shared Toradex Cortex-M UART series:
  https://lore.kernel.org/r/20261022-v1-imx95-overlays-v2-0-c769d6eb54fd@toradex.com
- Link to v2: https://lore.kernel.org/r/20261001-verdin-imx8mp-hmp-camera-ready-v2-0-7d1343ecd3ec@toradex.com

Changes in v2:
- Rebase
- Link to v1: https://lore.kernel.org/r/20260910-verdin-imx8mp-hmp-camera-ready-v1-0-3c9349ecdb9f@toradex.com
---
 arch/arm64/boot/dts/freescale/imx8mp-verdin.dtsi | 33 ++++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-verdin.dtsi b/arch/arm64/boot/dts/freescale/imx8mp-verdin.dtsi
index 9fee2cf9ef54..8bffa4a27776 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-verdin.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mp-verdin.dtsi
@@ -77,6 +77,18 @@ key-wakeup {
 		};
 	};
 
+	imx8mp-cm7 {
+		compatible = "fsl,imx8mp-cm7";
+		clocks = <&clk IMX8MP_CLK_M7_CORE>;
+		mbox-names = "tx", "rx", "rxdb";
+		mboxes = <&mu 0 1
+			  &mu 1 1
+			  &mu 3 1>;
+		memory-region = <&vdev0buffer>, <&vdev0vring0>, <&vdev0vring1>,
+				<&rsc_table>;
+		syscon = <&src>;
+	};
+
 	sound_hdmi: sound-hdmi {
 		compatible = "fsl,imx-audio-hdmi";
 		model = "audio-hdmi";
@@ -185,6 +197,27 @@ reserved-memory {
 
 		/* Use the kernel configuration settings instead */
 		/delete-node/ linux,cma;
+
+		vdev0vring0: vdev0vring0@55000000 {
+			reg = <0 0x55000000 0 0x8000>;
+			no-map;
+		};
+
+		vdev0vring1: vdev0vring1@55008000 {
+			reg = <0 0x55008000 0 0x8000>;
+			no-map;
+		};
+
+		rsc_table: rsc-table@550ff000 {
+			reg = <0 0x550ff000 0 0x1000>;
+			no-map;
+		};
+
+		vdev0buffer: vdev0buffer@55400000 {
+			compatible = "shared-dma-pool";
+			reg = <0 0x55400000 0 0x100000>;
+			no-map;
+		};
 	};
 };
 

---
base-commit: 7f47e8eafbf55a2ad0697e5d28f5e6cff2fa42f9
change-id: 20261020-verdin-imx8mp-m7-a69e26868741

Best regards,
--  
Ernest Van Hoecke <ernest.vanhoecke@toradex.com>

