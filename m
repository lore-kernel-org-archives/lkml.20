Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792693881;
	b=ZpuxqFUVLQbbqPaVMWLDFEbYTTo5gFGrl1fuZDX35e6NQqdgQ8vyIjnz5xxRlb+dcH0s
	 WlG695jzoU7VKEGjq+wIDOYPE00yQ7B1uZo5R1RbWq8iaxmShPQE/kSKvXLFNrP1Hklrt
	 fA4hFU9jeKC1nrCQLeRLxvR4FJlRNGeVCROicevU3Bxf8XghF0jiP2cxOQLUMaWEJw6U7
	 YGutyPxj9WhqISidVLJg14q67eCuLu6gBQMGRl73p329Yo47qiSyBoWlkW3hENwaYLcNA
	 S8g+Hjpi9MvEe0sOdhp1eo9mWuRxx1q4am6zW29Nl5YGIz+g3koqgw4iVBvb51IsF7w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792693881;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=5W7z1rOfIZVI61tKSTk21lKhK4AufBt6SAL9admKOgU=;
	b=Lcg5Eh9UsFO3IFdH+efaPY2mi/9Cc6/7itN5sQutD1ibs6cw+w+uBPD5wOCdjoRU22x8
	 RragnkWwjyjnRTk5OcLlt8ymRCWOFDMz2Yaoc2vv7X5r3YwrenhQGM0hbm5TBmAi7dCHk
	 dqb75jwqf1K8xR4bdFoMuCXdEr6zV7cpMMBid95s428LEgbTGXTeKf2bPUtCddcM7lwbZ
	 srqoB7g+X26s1YdRoQlW+WbEo/esYHhczEN9apup3jBo9wWDSPLcwZtPaGcTGidyT/z//
	 uEBfA+mfM1wWHdLokAixSHElU6v/W6gM53iM65JzeTpF1kJjewwPGlo+NmZ5DOdhJQA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=E6v5EUNN;
	arc=none smtp.remote-ip=209.85.128.41
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DE1B60A2628
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 18:31:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6DE1B60A2628
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=E6v5EUNN
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4a1df146015so967595e9.0
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 11:31:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1792693879; x=1793298679; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5W7z1rOfIZVI61tKSTk21lKhK4AufBt6SAL9admKOgU=;
        b=E6v5EUNN+5BOi9tYzKYtR70MmG42qdv9hKstpdGQA/R+qVFpX4fMODz8hdgvjkGRHk
         FgXR3Sa9H5bGq8M1zhZ79ejs5k7OHLATUeuW+6kuLnM3Wc47IEsBcaVFzz5nn6tgwnWd
         ywohLLatJKp6MdAiwAVngN24lW1hlJo/nixyjXmNqj05zZ48Yi/3UFfGf9ij0doDlZg4
         XdFPqs1OeDaSFG12wHLB1c7h/x9CVQj+6QtVbVpjXg+qMTrBc5hKgP2T3NndVRX2gqic
         m5Q6+oHwGzsLPC6pVln7HNN++7wa4qEbH7aSl338o2nqUoxmIoKEeqroOGH4qxDw1hU2
         ldMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792693879; x=1793298679;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5W7z1rOfIZVI61tKSTk21lKhK4AufBt6SAL9admKOgU=;
        b=0jT3KxtfUBjBVjYrlQKaHt8uEuQ28wtuxbpdy1ziA8pArQSdbmhKg8mBlkoUTMeTih
         xZlVYeHGxfbyJLWPSijB+LCzOO2MAvWiHjS/PPaRQzuKQKiAHllDrjQwjYn3k0yykhYv
         td2jEg9MySUF28MvpUD3yVgiDQQNh6DnhQ2NXlKWqNwSw5GSva0NkVKJ2JF8iRd+w9xE
         rbB6eKP23jKcW4fjuFmeMCK/ULANVjXC6NX7JMaaP/0BUhYdGmszbMOKQanLzMbLkrgu
         UzPYCqstGJDoDj1PdPQef1p/kWlOx0CsBBpHX5lb072aOtsZM7H+tboBYppuXzO3bBXB
         wQBA==
X-Forwarded-Encrypted: i=1; AKwUvBxh3muc4z14AGBseITbc+UwzOdHrhWfS+P02ILhcl1UfbqOPJCFLxkGBksMbgVVnC198CNS+yb6dNu0mnc=@vger.kernel.org
X-Gm-Message-State: AFq9FYIKS5UBjGuJbdIDqL4oBIm6LqZOw6LQ4qgx8RS8nWztt9qH8RCX
	0Fh4dU819n6YN8MOsHAWB4Aw4B9UvBkG1wsN1WqO6hHprtkxjz90Tc0UhTuugrdUfmI=
X-Gm-Gg: AYBFou3fEAj0t8aAgKt7NcB+FxsDzlU7Fjri7yY78vh5EJfo8qfrrZe8IRVdPF2alUf
	4BzqEE+nJlNmIaMF8sGv1mqt/+HK7/m9TuR1wNPB8RhBZtaxfdMJHHx5Y5f6ARcyXf6MDCm+UHf
	A2lPecmFTe3mdtObZSyW2ifPGvst8vMGJhg4D2UIaBp9JqHv9V17Qh1d3yMctHgev0kDdP6ftyN
	WfawlvRU2hBYVPtPMwZiYXavj32lWkujnOnt3u4BN4JsMeGydxEv+XDWBwPTOVEpQqefG1nIs9w
	CkoiZIDxWilWrzJ21tvsufzhAuFH4a9CZpv0h01RCGmDALZq18/QbqZwN7gIEkrgq88qhGC56hw
	KfYb3+C+sREScqhggNj+oWpZ7adZVyTenHWXn6Mhr3Vf06fpmmtgUc+Ea1J/fBtPC/Fz9KfuNZf
	WfMTHIhIj7Vs54zApaQuUAYWpktME05/6NgKJxKj0N8BqRaob2U4GCCk7cjkXniCsPEZO43arAf
	bglJYudiqKq4zunRp3mFehEihFkBwl1dnsG8nybROSZApKFwBP/xh3dm7G+c+HvDrmDynv0xwM7
	5XBbR8tpIGOqpNJ3HV6wwWkVJNWFo9B3BRDbwGHWYNigvD9szl8IwlFGjYlVGSY=
X-Received: by 2002:a05:600c:6094:b0:4a1:93fd:8f8 with SMTP id 5b1f17b1804b1-4a1fd89daa9mr116976045e9.4.1792693878853;
        Thu, 22 Oct 2026 11:31:18 -0700 (PDT)
Received: from [127.0.0.1] (host-79-21-165-229.retail.telecomitalia.it. [79.21.165.229])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a21143094fsm4556975e9.1.2026.10.22.11.31.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 11:31:18 -0700 (PDT)
From: Carlo Caione <ccaione@baylibre.com>
Date: Thu, 22 Oct 2026 20:30:28 +0200
Subject: [PATCH 2/4] arm64: dts: amlogic: s7d: fix the GIC CPU interface
 region size
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
Message-Id: <20261022-upstream-s7-s7d-gicc-size-v1-2-8285053cf4ee@baylibre.com>
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

The CPU interface of the GIC-400 spans 8 KiB, but the S7D device tree
describes only its first 256 bytes. The GIC driver then disables the
split priority drop and deactivation mode, which needs the GICC_DIR
register in the second 4 KiB page, and warns at boot that the range is
too small.

Describe the whole 8 KiB region, as the other Amlogic SoCs with a
GIC-400 at the same address do.

Fixes: 1a30661c20de ("arm64: dts: add support for S7D based Amlogic BM202")
Signed-off-by: Carlo Caione <ccaione@baylibre.com>
---
 arch/arm64/boot/dts/amlogic/amlogic-s7d.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/amlogic/amlogic-s7d.dtsi b/arch/arm64/boot/dts/amlogic/amlogic-s7d.dtsi
index 5593ff9e07eb..059a1bf37584 100644
--- a/arch/arm64/boot/dts/amlogic/amlogic-s7d.dtsi
+++ b/arch/arm64/boot/dts/amlogic/amlogic-s7d.dtsi
@@ -85,7 +85,7 @@ gic: interrupt-controller@fff01000 {
 			#address-cells = <0>;
 			interrupt-controller;
 			reg = <0x0 0xfff01000 0 0x1000>,
-			      <0x0 0xfff02000 0 0x0100>;
+			      <0x0 0xfff02000 0 0x2000>;
 			interrupts = <GIC_PPI 9 0xf04>;
 		};
 

-- 
2.56.0

