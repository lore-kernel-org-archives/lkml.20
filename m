Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794586741;
	b=gtbTBO1xLDZaX0aiBNN7TYXJw5aPzVfj+DYv18uOPqy7heMnbzN79x/x7XmX68X9//ns
	 /CSCnRIkcI3UYsD2RiNp1BDio16IzMo8RBKgxU5e54iBbhM+/pazQT59Z1dEq8Jtsi1et
	 xv886pQz7lax86l3VN5iR2m6O4lUzGhoFg5TDVJkoS0G6D0LOeO0/rGe87vr4XU3jOfuU
	 AcQ9Fv18jh0ZBMxX/2Otm7mC1jWBBq0KWDy9D7puacFeoSUOe84pduo/5E91w+PAaKs2S
	 Vj+0q7vGw7nRfndHLG+bzqUss9HK0JcF0I1b7GTf2+gGDj1zc/gmdbcUTjobILLdtcg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794586741;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=mQWld2rf0aUSCLxpuKReQRUF3uIzkNsM8ey4gCHu/88=;
	b=MwqEPQ6Apdq5EK04Yqwelp78wmqvB8qyxVrhEXlchbpY3QgDpAziSaDW9I4aseI2p4yE
	 ZthpDZjtyujMI2u/a/hmv+D5ium6PCaFbGvHn9eWLSw6fHonRYTyx5kEeubD/+57kxoGz
	 yGGiQDXusM4SGKL2Fyvf/lp+A4uqG1t2AXrz6t2uK/8HxgIgLPLRFLHxaXZl8uWd4H5fo
	 eWRRmrukwhlGSIppNReZeaWqLr29Zcd961C9PGKIIexLpEWNuoZY7yrXJGsMah8KS6I2v
	 TlIGjEf/oTDuR13bfDXvnPrdObURGm6MY/Ka816R2k6hu0LRDBzIFbIOfvRusiovphw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zBoKHbol;
	arc=none smtp.remote-ip=209.85.218.44
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A392660A5BEB
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 16:19:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A392660A5BEB
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zBoKHbol
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-c4d30639709so216228266b.0
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 08:19:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794586739; x=1795191539; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mQWld2rf0aUSCLxpuKReQRUF3uIzkNsM8ey4gCHu/88=;
        b=zBoKHbol8hBa0KV2wud8WvoWYPMHijCP/AHfQ0kMIp/6nPm9ZaoEu2nKj95ohh3y3f
         0BYTtjsu2BUiYwW6SfUG6OIZskQRV2qU5Sk95UAT0pbqgd4Lrp26EzInaCiUioNkUf3/
         h+iDrnMt1l3lqRjsvei3eOHp4NIpRha13RsA28lWMePHnmFRqiTyoNtz5ZiSaVXNOYjX
         IDgi7UnJgGeMGlP0uUBbibrMI57N7dejvOcEN/WNNEaYuWZqag0H9AddQrF+iZk2zkSo
         4W9pu+W3+a2f16KDUBXQ2Ma5P2jC5w7NdtoTqp3ey+qq6U5d9pVlQV2ZYjHYwgOxAoOD
         DwBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794586739; x=1795191539;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=mQWld2rf0aUSCLxpuKReQRUF3uIzkNsM8ey4gCHu/88=;
        b=nUQ67AraHVP7Yy1vqKPrGEm57651dIa5NcQSBp/aeaQWA8kZ5FUX0K8xnbyworYZwA
         YAhWVOxV6joR7oP25z9Iru9Md8RDnwDc4ghQ+AQPG1QQnI9HMW4JJ42xCnG01jGxKhJF
         8Z1vr3CtPEZ2r0eJA+N41BdziFZvOrNF/ZKDnQNtZKjYhMof69CsnUQjOp3nXG9f7maq
         aWM7+88KBzKjke/gAutMI4qw0lG6e9tb0KSe8jMutr0Rjztv6xMPMMGM0qjbTCf8VTYW
         ypk+PL5BwGN4FsB59aHhXAm+fqMeXrMuE3vLFU62Zo71Tmg2tLvUHObyQhS8uupaRGL5
         cG9g==
X-Forwarded-Encrypted: i=1; AL+hErHEiJ7OtnWUfY3fXPNo4ZetaDbB5wADWOCKZ9kv1caSIayMSM/iUEWz041brGd1BT8r5qIhCn7ebxCb8xo=@vger.kernel.org
X-Gm-Message-State: APuU4Z9UHuf0UYKVwBLEoLbQLsBgluSnGl+oEuBcipFw0D7PUVgxVxgJ
	0P54MYwVBG15FOgM2i0Y8PybAXiyM7BMBvjSiUSCNhKwtBhlr6a2ZUPN
X-Gm-Gg: AYBFou0oDQPykoqUtd+c+vXopUccyZBma5aVKi2+0COb8OaGJt4+RW32Cf1tbQy2+kF
	MKL/ATmOTeOjf+wMksqgK3AWdSXUxL+wvjA+Ok7L76JXmf/kqrYFQH1wa/vnZrd7stpVDntXMG8
	lPDeMEtgWFnx8hNKSoHQu6pYjO9ytrwbJN6A6ebKyUARU9NSBu+YLlqVJQj62d96UImT0e68YzU
	F03+7PlabKa44PrX/95gzlYLkSC8KDWgDllfgyPnJfOBvbhZcVsaaGDxeE0DxF7OOYMQFVHb1bH
	oAkAvgrZIra3RQmplA/QWI69kgs/YGIkIUtejC4+8uWs/hkHLrlivWep6QC1N3Gh0SIuyEnuFjW
	nKYlwHUujkSIzQY+LulbICRi7y05Tp/88ds4rTDN/CjxEQrsw7Tq9TIx2y7ciNczxy8NMCa2hLC
	RkC1kFRQODS38T3CI5r6Cvz9JwpSTtfV2MtcU4SBNHblJf4PEpTS17Msh52e31tHGMdSpIh/L5J
	Ec86pb1QluhqNnNgFt0Le9dLG3tQMaPbsCA9QRU7HYR7Txyzg74kEuCh3CpiLSLtjB7dgVR1509
	XYDTHm/3L+4mcu3GoA43aWnGWBPjnLbttD7cT4P5bMhc6lGS+68fKTGGaatw6CqNuExqi64/Fc0
	V0hiv9Pbo8g==
X-Received: by 2002:a17:907:9304:b0:c46:9ee4:8f0 with SMTP id a640c23a62f3a-c50963d470fmr299547666b.10.1794586738923;
        Fri, 13 Nov 2026 08:18:58 -0800 (PST)
Received: from xeon ([188.163.112.62])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c5095b24b88sm122297266b.16.2026.11.13.08.18.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 08:18:58 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Sowjanya Komatineni <skomatineni@nvidia.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	Mikko Perttunen <mperttunen@nvidia.com>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Cong Nguyen <congnt264@gmail.com>,
	Faisal Mukhtar <mukhtarfaisal03@gmail.com>,
	Dan Carpenter <error27@gmail.com>,
	Hungyu Lin <dennylin0707@gmail.com>,
	Hao-Qun Huang <alvinhuang0603@gmail.com>,
	Yury Norov <ynorov@nvidia.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
Cc: linux-media@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH v1 10/10] ARM: tegra: Add CSI node for Tegra114
Date: Fri, 13 Nov 2026 18:18:19 +0200
Message-ID: <20261113161819.36847-11-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261113161819.36847-1-clamor95@gmail.com>
References: <20261113161819.36847-1-clamor95@gmail.com>
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

Add CSI node to Tegra114 device tree.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 arch/arm/boot/dts/nvidia/tegra114.dtsi | 34 +++++++++++++++++++++++++-
 1 file changed, 33 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/nvidia/tegra114.dtsi b/arch/arm/boot/dts/nvidia/tegra114.dtsi
index f2766c11ee6c3..61120658f0687 100644
--- a/arch/arm/boot/dts/nvidia/tegra114.dtsi
+++ b/arch/arm/boot/dts/nvidia/tegra114.dtsi
@@ -53,7 +53,7 @@ host1x@50000000 {
 
 		vi@54080000 {
 			compatible = "nvidia,tegra114-vi";
-			reg = <0x54080000 0x00040000>;
+			reg = <0x54080000 0x00000800>;
 			interrupts = <GIC_SPI 69 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&tegra_car TEGRA114_CLK_VI>;
 			resets = <&tegra_car 20>;
@@ -64,6 +64,38 @@ vi@54080000 {
 			iommus = <&mc TEGRA_SWGROUP_VI>;
 
 			status = "disabled";
+
+			#address-cells = <1>;
+			#size-cells = <1>;
+
+			ranges = <0x0 0x54080000 0x4000>;
+
+			csi@800 {
+				compatible = "nvidia,tegra114-csi";
+				reg = <0x800 0x200>;
+				clocks = <&tegra_car TEGRA114_CLK_CSI>,
+					 <&tegra_car TEGRA114_CLK_CSIA_PAD>,
+					 <&tegra_car TEGRA114_CLK_CSIB_PAD>,
+					 <&tegra_car TEGRA114_CLK_CILAB>,
+					 <&tegra_car TEGRA114_CLK_CILCD>,
+					 <&tegra_car TEGRA114_CLK_CILE>;
+				clock-names = "csi", "csia-pad", "csib-pad",
+					      "cilab", "cilcd", "cile";
+				power-domains = <&pd_venc>;
+
+				assigned-clocks = <&tegra_car TEGRA114_CLK_CILAB>,
+						  <&tegra_car TEGRA114_CLK_CILCD>,
+						  <&tegra_car TEGRA114_CLK_CILE>;
+				assigned-clock-parents = <&tegra_car TEGRA114_CLK_PLL_P>,
+							 <&tegra_car TEGRA114_CLK_PLL_P>,
+							 <&tegra_car TEGRA114_CLK_PLL_P>;
+				assigned-clock-rates = <102000000>, <102000000>, <102000000>;
+
+				status = "disabled";
+
+				#address-cells = <1>;
+				#size-cells = <0>;
+			};
 		};
 
 		epp@540c0000 {
-- 
2.53.0

