Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793008665;
	b=THIuHLlCn66w5Fea9sRyCpnn/j3bau26UhUAGwsMq2IalXf0rXVeURRcryDt5aX2hCBm
	 idubQIe+Jk7OcTG+bLhKgZGREnA7Dpd0c9ZJM/tHkNyKClTZZPEt4/ZyiG3lbBgQqV1kZ
	 He+EGenA1BhOoXd4oaEJ7SLOknaBuhSMEgDwSd5lV0wKeT3AVM6AyOsftQSje5ob+2ZuY
	 v+kBSm5R8k7Tbz+qfOmjWoYwsb09dOAB5p4Y6D4Lj/KAQ51vNjt0i4rOAllEAxII9RN+r
	 NT0WzWezoI81wxIMJM2uapBNMSObW2o2xdT90uvnABqLeoCkBS402YFs0BVCP85K4dA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793008665;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=HcffSPuimDSKjJ+Q27cp2ryrVy584pPTd3AryXWHadY=;
	b=1MFi73FtboaVJV8ypWRN3PMTIYsqJeaHewXicBEzRJ6SAbu2WEtbpmusaMIChCP1cNtb
	 9FKWEeL6NejIz5dfzFIPFq7Ug506aZao7fxSK4UeyJUVy517tIvSzaojerd9fghBaMDlX
	 z2FLIH059cPj7/JtJPu5PFeUW+LHwqLsBIdme+4SwCzvKyY99P5Ia90hkfvDFZyLuT0Zb
	 W5y71TtlDrkj4hxLWYbLevedKIJkBrTW3PPQvUZUqr+TlIvdnPAkWyoZG0snu8R9aZ2mc
	 YpsnNYFdYUgg+eom+lv9lcWYsshSDamMbv4BT7AiXS+zyVwOxwFGU08VdzrGLWIbiLA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=UfBxAXY+;
	arc=none smtp.remote-ip=209.85.128.49
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8847D60A2613
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 09:57:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8847D60A2613
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=UfBxAXY+
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-49d05d51553so18907615e9.2
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 02:57:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793008664; x=1793613464; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=HcffSPuimDSKjJ+Q27cp2ryrVy584pPTd3AryXWHadY=;
        b=UfBxAXY+OGWZtQVefhBi1aB08I/gReKZ9XZS8CwRRGO3FzKKvsV+LBS/MnfevyAzWI
         zCRA4t0rZ8178bcfqq1lpid9EPsDTWtUFP9viWFk4XYgT4oDTYXUX1buasJYsgrkLli9
         K6BQTcZEp4mRLti3+owSZoFrmqE8CfxzicTnKvNovEaTVvat4rPEkQFneTA6GZoEVCaW
         hLlUxXCdceLYd3aLTvIYVe1Srw6F5JKFyxd3esxHOcWnvdItGuU1CWbKYsOHgrI6uWma
         mblinzTFOaS4lXzfSKNX2chPgULg5Xuptok6ThdrvM5FCpwzo1nEt2pacYZ1iDp2gtEy
         JjVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793008664; x=1793613464;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=HcffSPuimDSKjJ+Q27cp2ryrVy584pPTd3AryXWHadY=;
        b=m3KMrAP+NnqWYF0CuOrECH4gc6ZLBOV4iz8WFFtxPRjYaUXFdkLGtbxMFroOuuQQ3L
         aKHbXEJMTaYfy58btx6dyNkRX2/qOC1r/s2gzvyAurGPqVd3U0oCKXu5jCc02HRyWv7H
         YX0c5qFR8yWWjq3HwpaQVlrvkOiMiHcOOaljDlb0KMQaK3XLQYOFKkRXLxQ1e94CvKVe
         RuMxzv+v9V5niMB1lKINrohWAQ1718RIG8mk9ZaxhVF06eRnuLq6F3CP8lgQjoFvb8ed
         4JzE3tJIziOr0RuYlW+NQ4s9qRHH+jKPh6Yenjx5KpUzesdp5gBAwc+sWqVbG0eOi+f4
         721A==
X-Forwarded-Encrypted: i=1; AKwUvBzauIRw/6SxFT+HzO38nZk2bzMljM8NpBXgR9NnDDfphZ/trmRBT/b6ck/7/1RcTStzD/gKz12jxPRQelU=@vger.kernel.org
X-Gm-Message-State: AFq9FYL3sPMXYVhHkHpp/O4imGzM7vhLf3+MSigPhCVEdVz/1+jVpmH/
	c3AHsreB4zCnAJXOJkkUNXH02kMkMdE5OPi+TAAjcno3nQHaEKHVL6ZV
X-Gm-Gg: AYBFou3koco+E/GZTXpOEXGwC49MtjfkLxNMwyXwI3Wn0/GkGbVwuUpIzBDyQ30s2Tx
	10rtL/oSL2pCbuptveXlmfIMHGrAyY9qWweBcDxhGhfiFluPvE/ReWYhN0teLfH/Wp1SYljYavE
	jGmxVlcpayPgR40VkStgMKJA3WnXxIAfypAJtUfYuq1jNI95WuJVKpmlcH6wwRqhm0JRnhQ42Td
	TKMnQFegkKPjeYj0sco/WECNdjjys3FFp7kwUM6fm4W0Lu66igZZJhnjm2G9WBCK6Yxqh+at/b9
	iKjcZHdBB28iuCx5gqK4pYm9WwWqYsZOEsODIJLGaSK4nvfgwlwfUaWDPapL7io17purpHMzMPs
	kRC7qZpj7jgZp6H3My+wQClLoylOz+dhlXOE0i7ybUdDBvWl0w6yaoL37kuQoV2ep/mqZt5dqTa
	8qBhjIPu8x4WPOn9OFXfAX0wWz6bEmFjB5hKLDrYO0iy8ET525yEQBoDr98/bc8yY4cSpoo4nrj
	WfhtFrEEkuaQiNvhnQkvdqHvv8jjG35KxSSwGgAl3z1Np+JWczhDLgJKAlNGVgy5GKjRA96PI5L
	Egct+mP1g28wyWu8WnAfGgfL18QLn241qnBnP5X6LB7h7pS9Frjk++R5G4ft
X-Received: by 2002:a05:600d:82c3:b0:4a5:1cf1:b7bd with SMTP id 5b1f17b1804b1-4a51cf1b880mr83369685e9.16.1793008663905;
        Mon, 26 Oct 2026 02:57:43 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (93-34-92-187.ip49.fastwebnet.it. [93.34.92.187])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4a35a0cc374sm190382825e9.9.2026.10.26.02.57.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 02:57:43 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Christian Marangi <ansuelsmth@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 7/9] arm64: dts: airoha: en7581: add nodes for all supported uart and hsuart
Date: Mon, 26 Oct 2026 10:57:13 +0100
Message-ID: <20261026095727.31708-8-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261026095727.31708-1-ansuelsmth@gmail.com>
References: <20261026095727.31708-1-ansuelsmth@gmail.com>
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

Add all the nodes to support the existing uart and hsuart present on the
SoC. Also update the compatible for the already defined uart to use the
more specific UART configuration.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 arch/arm64/boot/dts/airoha/en7581.dtsi | 46 +++++++++++++++++++++++++-
 1 file changed, 45 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/airoha/en7581.dtsi b/arch/arm64/boot/dts/airoha/en7581.dtsi
index 760f0c3e6090..ee1633f01068 100644
--- a/arch/arm64/boot/dts/airoha/en7581.dtsi
+++ b/arch/arm64/boot/dts/airoha/en7581.dtsi
@@ -470,13 +470,24 @@ fixed-link {
 			};
 		};
 
+		serial@1fbe1000 {
+			compatible = "airoha,an7581-hsuart";
+			reg = <0x0 0x1fbe1000 0x0 0x40>;
+			reg-io-width = <4>;
+			reg-shift = <2>;
+			interrupts = <GIC_SPI 54 IRQ_TYPE_LEVEL_HIGH>;
+			clock-frequency = <7372800>;
+
+			status = "disabled";
+		};
+
 		pbus_csr: syscon@1fbe3400 {
 			compatible = "airoha,en7581-pbus-csr", "syscon";
 			reg = <0x0 0x1fbe3400 0x0 0xff>;
 		};
 
 		uart1: serial@1fbf0000 {
-			compatible = "ns16550";
+			compatible = "airoha,en7523-uart";
 			reg = <0x0 0x1fbf0000 0x0 0x30>;
 			reg-io-width = <4>;
 			reg-shift = <2>;
@@ -517,6 +528,39 @@ en7581_pwm: pwm {
 			};
 		};
 
+		serial@1fbf0300 {
+			compatible = "airoha,en7523-uart";
+			reg = <0x0 0x1fbf0300 0x0 0x30>;
+			reg-io-width = <4>;
+			reg-shift = <2>;
+			interrupts = <GIC_SPI 32 IRQ_TYPE_LEVEL_HIGH>;
+			clock-frequency = <7372800>;
+
+			status = "disabled";
+		};
+
+		serial@1fbf0600 {
+			compatible = "airoha,en7523-uart";
+			reg = <0x0 0x1fbf0600 0x0 0x30>;
+			reg-io-width = <4>;
+			reg-shift = <2>;
+			interrupts = <GIC_SPI 61 IRQ_TYPE_LEVEL_HIGH>;
+			clock-frequency = <7372800>;
+
+			status = "disabled";
+		};
+
+		serial@1fbf0700 {
+			compatible = "airoha,en7523-uart";
+			reg = <0x0 0x1fbf0700 0x0 0x30>;
+			reg-io-width = <4>;
+			reg-shift = <2>;
+			interrupts = <GIC_SPI 18 IRQ_TYPE_LEVEL_HIGH>;
+			clock-frequency = <7372800>;
+
+			status = "disabled";
+		};
+
 		i2c0: i2c@1fbf8000 {
 			compatible = "mediatek,mt7621-i2c";
 			reg = <0x0 0x1fbf8000 0x0 0x100>;
-- 
2.55.0

