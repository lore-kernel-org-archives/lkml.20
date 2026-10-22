Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792693883;
	b=emmsrImmpRbVllKlc3EWLQB+z/vGkI/6LXZGvjfrHDsn6ENAKAAVyPRZHfE4ZsMiCI3x
	 voK6to/lCRZSyTqP5HPwmeXfTb9HM40HkedOkJolnbgiX243C+fDO9sd3SCRehqNFMu7e
	 qtHVamWQIa/3WOnvZyvcpw5Jw7vFEwbewWPHBy87PBkzjL9Df/D1Yflp4amGKU2L7Es3o
	 mmbYK6ZfkhijqPlrx5nRHUUruEiJl/lkDGXRBpUogc6KdxBtEkEH5ICkxaarKi3k0frxq
	 F1J80G65Jx13jS1iDSG/x6+JsqOYOr6kQnpxjFE7DikjLEZLFmzAGVmaefb2Pi7igcQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792693883;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=NKtpVjHIm1REdWtopBuEh9y7AbksNfVL8iL7r2iisCc=;
	b=O9AgeLkUE66HCQepuyysL7O4uRx7WtK8kvc1SoEHXd+6iJQQM7ZuJFGxUC1yIFdFBMQd
	 DwzLdrp4ZVycAimzLVh+vcixLVBvnw/VEYEJlXr9aSplvvp2Xyt95pDHJzESax0We+8oo
	 w20c3KwbbYN47ZZwM8GKuU+2/2AZB1SItTb/CeL5T9HZ2b6c8RdliNQXnUCOjddTHKrED
	 QA15Zms4GDx02qP7JMEYAVhACjveQHOgWBy1CBUkpgb1D9But1n3RKUHgY+wdhWo/SqEb
	 m8FbPTBuPUJbCvGNLlINXk5pW3JOILQcKX9WFlqmBFmStpDQQrgWY8JiGMYcuTsg+xQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b="dr1HzYN/";
	arc=none smtp.remote-ip=209.85.128.45
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38ED860A382D
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 18:31:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 38ED860A382D
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=dr1HzYN/
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4a20bde60a0so1093065e9.3
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 11:31:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1792693881; x=1793298681; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NKtpVjHIm1REdWtopBuEh9y7AbksNfVL8iL7r2iisCc=;
        b=dr1HzYN/SRSFFtZut4drAPOoyQBzUnp1haH/4vq07K3/iczUJeVACY5zrGWTsSZiAm
         HJ2lsyTUwYIIYgiE1Kr0ZiC1yvXzSLHbDhziUv5L+u58X5eCGwNhknfp2TA1+m+y2iAu
         3KxSktsthy5+BxjWG97Vk/FG3uxy3wEb3qQ+hPYhSyI05WEy+C9POpC8W7vE2y1JfNAH
         EWdvgG3zyYUU/IpaELpngB899AwrCcW2ipOb7gFydMFJFerAxggjSB6fEXC4bzzLgnAT
         TCtsECEx2s4qGXite2AiIS58Hs6MUBubNrzS4Fiiis1eO6Z09w6thsBsR2gZmwn+Pazl
         V9Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792693881; x=1793298681;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NKtpVjHIm1REdWtopBuEh9y7AbksNfVL8iL7r2iisCc=;
        b=c74IrhDGIT37to87e/k/WXS//BlIY4PVUYZckc6YcleuF6ikD1r58llUCUAyk5rr83
         69+C4q0wu4wFpAr5+f4tIBJqR8thbM43OjwuMUrrObYADV8Bl/DtFc8ACekBDhWkT4t0
         UVqazk+qSizPsoK4UVu6wH3Y4eDQtwvek5Ey+Xa5pnvFTZT6/p+E+gA/wDWL/yfkh4wz
         zWIRJHO95OVHIeyOjL0QiwCTm0PcEXRsrtdhmxFMW7FwuXScDW5ylBzM8c6WvkNd8fRp
         EqddBr4AY4mf9g6dyrrHJZv9H32fr/Fco4lBNyEXtAFBnw9zlUkgAW45mPpKDQDX1X4L
         G0HQ==
X-Forwarded-Encrypted: i=1; AKwUvBzJSjToWwaovNfOWuur59QC+6xn0WYfcipDKFKdNpEPU1muiTdIXqabRMgG53d4DCslTHjnpcvANldR2io=@vger.kernel.org
X-Gm-Message-State: AFq9FYLQeUva0iRrt2R4n59y/t7TBqvqgAmrWARC68KxUobjNX65orSU
	pWto3+uCEa+VyMNuItQ82XCBb7HxrkPjauQyKAQ1XPRFC9XZhwxLmOedPHq0x2MFLxo=
X-Gm-Gg: AYBFou22bQzmNiR+OsbcWK7GKghGGl64t5bUqWdyZimLWT/ZqhOBDbWfHZ2C9URUEc1
	6RypQC/rQcbE2f/jsqmBIq9jUmYNozZmyx3sd7jaGb7AtAyKTrmNlldf46auGkGgG0DtaB5FhNM
	S+0E1rIS87Z8/+atbW38O9gKhpMpKYgQBNoomK3IO6bDX9gW2N93D4Ss3LCUVslKxgY2xCLuvsl
	eDi3KuhGxXNkowSQtvNcD+duug0Tz9/qQR6/j13PIPt9XDfGy24fyMFnq/bMZxfBGnCf8Dn5rG1
	4PJMhRABlpJrSY5x+ktbB5fIr+YVx//TN8mqjZmV0xGBiKhVwsov8WxfiRvdzDiL74InUm5riw8
	0ZoiLiPXx02J0L23V7j71FbI35uverztpkWLKR8msgS/I60xrsF4wZ+khxM9rzc3d2ljXXKUTdI
	jH4KjGnVqK2tW8O5LTeXFJiO7b1/1N9LTFCoJhPJkwVyxHOd/hP/GfW7v7LOBUaXJZEF0kKywPp
	UVUk26arByJl2QgtlS7CZOk6EQ9vw990DX32QBBJtHSzFPcWzjPMdLr18q1ce+4u8gneU3Y9qro
	iSmUQBbTclh9et7ym6PRbhrX/3wngiiCKCaUCK3bDQ==
X-Received: by 2002:a05:600c:540f:b0:4a1:dfaf:f465 with SMTP id 5b1f17b1804b1-4a1fd8cde00mr114350305e9.4.1792693881668;
        Thu, 22 Oct 2026 11:31:21 -0700 (PDT)
Received: from [127.0.0.1] (host-79-21-165-229.retail.telecomitalia.it. [79.21.165.229])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a21143094fsm4556975e9.1.2026.10.22.11.31.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 11:31:21 -0700 (PDT)
From: Carlo Caione <ccaione@baylibre.com>
Date: Thu, 22 Oct 2026 20:30:30 +0200
Subject: [PATCH 4/4] arm64: dts: amlogic: s7d: describe the GIC
 virtualization regions
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
Message-Id: <20261022-upstream-s7-s7d-gicc-size-v1-4-8285053cf4ee@baylibre.com>
References: <20261022-upstream-s7-s7d-gicc-size-v1-0-8285053cf4ee@baylibre.com>
In-Reply-To: <20261022-upstream-s7-s7d-gicc-size-v1-0-8285053cf4ee@baylibre.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Xianwei Zhao <xianwei.zhao@amlogic.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Carlo Caione <ccaione@baylibre.com>
X-Mailer: b4 0.16.0

The S7D device tree describes the distributor and the CPU interface of
the GIC-400, but not its virtual interface control (GICH) and virtual
CPU interface (GICV) regions. Without them the GIC driver does not hand
the GIC over to KVM, which then runs without the in-kernel vGIC.

Describe both regions at their GIC-400 offsets, as S4 does for its
GIC-400 at the same address.

Signed-off-by: Carlo Caione <ccaione@baylibre.com>
---
 arch/arm64/boot/dts/amlogic/amlogic-s7d.dtsi | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/amlogic/amlogic-s7d.dtsi b/arch/arm64/boot/dts/amlogic/amlogic-s7d.dtsi
index 059a1bf37584..b77ac8898d16 100644
--- a/arch/arm64/boot/dts/amlogic/amlogic-s7d.dtsi
+++ b/arch/arm64/boot/dts/amlogic/amlogic-s7d.dtsi
@@ -85,7 +85,9 @@ gic: interrupt-controller@fff01000 {
 			#address-cells = <0>;
 			interrupt-controller;
 			reg = <0x0 0xfff01000 0 0x1000>,
-			      <0x0 0xfff02000 0 0x2000>;
+			      <0x0 0xfff02000 0 0x2000>,
+			      <0x0 0xfff04000 0 0x2000>,
+			      <0x0 0xfff06000 0 0x2000>;
 			interrupts = <GIC_PPI 9 0xf04>;
 		};
 

-- 
2.56.0

