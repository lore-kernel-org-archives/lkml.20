Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792693882;
	b=ka5+d/r4jLl9vfCHTofinWFlh4nr1qn4ymNLK5/FN3BIGF57eRnruJt4TqA65RbidYd4
	 J/q2W61WyhJZdNWgyexJkrrxej1TrJpOz7H+g2ovg9JPXF5iz+MhN/YV8pRp0nyGvr8hN
	 CeCkTpUTIWlbj5Z7rIS4SUWY3P+MrFuW8Ndezq9uQLJ5DbCBFKOrqwUX4GRShg4XUiPjz
	 i7cQwI7HN/rdhRjOz+R9iAYgR8DE2AyCoMZAFrK/CHi2EBTY9+A5x/bnXNLJrgZjdyZ3g
	 ABK9uUZuD8tSORnO9Gj9tTX5brHu4lUfTu3doppVdhXkUI5avvALtMOptG7ie3jeYcw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792693882;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=IJuRgpS46PrkIeywrDiw2DHESA2FABKs2wGEh7ENPpA=;
	b=rKPLlV6FdD1L5MvSfhJJzuSYdqpJuaDPYMZXEFGe3LVESmzQ7iyQ0vRm/7sWZ43N+KyB
	 MK3t9FYq9AwvszMS8mGqYiDpY9Il957ycevr8/2ZDCFOPQRS03/+dkAxDL2/RoJBzIsuU
	 9W9kiyBiWu+5sTkdZjDrq/z5TzPv8j3CHLrsnQegIs40CeZoLqG4vVtpJiANvJYwJOg1T
	 mv9Sg990qfS544Zb2OFauOqkrYtHOWsu1CA72K1nZBaLDa6JC0wFfqaZcCukYDYBEIQ5f
	 ONYGNef+iiS3lJzOCGz3H9bhlUVLj77xzhsvuaJZYLr94mdhoDdPEKtyO9iMBkybJ/w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=KjKe+Bvz;
	arc=none smtp.remote-ip=209.85.128.48
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 472EC60A3814
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 18:31:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 472EC60A3814
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=KjKe+Bvz
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4a20bde60a0so1092925e9.3
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 11:31:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1792693881; x=1793298681; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IJuRgpS46PrkIeywrDiw2DHESA2FABKs2wGEh7ENPpA=;
        b=KjKe+BvzTptSN0K2ZmRLfVOyeFZqs8U5sGp16jW++fdAHsyQer/1PnfR4yfZ2lTeZZ
         FvJEpb9T+/Ofp+wHkOH7Wmltu/QgXkM6xlFY/s20AusszxB+cyPXJgI7dj0bttpcaKLG
         9kWJm6mqNaB0CTVojXgt9MEmvTWh2PFTbsbENTwsYGg/Vh28Ir+2t8towbuQLMt1EFWg
         Lqf7J5u44Bf+EVhhcN2FzIryqeY64QNWZqRNYRgfigOS0g1moYGP7yD4/vtd6Gp4cRly
         wLQnvFc7QlH17poZJyeFzyhJoPOrRqKukConU35IVFAiVA2YqahPfagXv0BW8SAQkzlO
         s2AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792693881; x=1793298681;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IJuRgpS46PrkIeywrDiw2DHESA2FABKs2wGEh7ENPpA=;
        b=Qt1AQW3Hwi5JuVGyKPGlV/O+7UDdSMg/HlD8Ek6ktMQKWKI2oVuhniO5R3i9xwHOKL
         0HpS4YQTEjQU9uCkpfw1EyxmKgGGqw/bYWntsq+8oIyY9GQr5RyVaScx1ZC9JcEUirnU
         eFgwxbIoA/auhVlMrGv2TLm7nMvvxLzaF5ONXYiRVPTvi7MnsvSMib27YjdqFz1sac77
         DsvKR9Ul93vojVMkNPySU8cYItagD1DM9uJFyeVLZ2iVDm3w7xmEbtYQMEHm2iz/u/KT
         4zNtO1jckHi4AwT4Ofj7dtuusqoUWaJDs2kmYhylPm31tGYN155RwrIVbRbwl2i8RZxg
         tL8A==
X-Forwarded-Encrypted: i=1; AKwUvBxG8ZCnUq0tLUzqlCzz7CPr1nI71F6Vdmyje/mf1oSvYo0JwgwMnQ6/nkVrzW5ux/9buTRQNCgxRM9h9qU=@vger.kernel.org
X-Gm-Message-State: AFq9FYKTSgSFjJoc/ZFyg46LCSdg/pRHVd6isOSJwtlZ39v+SF9FtLOr
	bNa7N4dFad96m6IuK7J4yoK4fi0IyDCXG2BiEY/lKO4P6DjrJDBm6Uq/FupEk5Fk21Y=
X-Gm-Gg: AYBFou3cRDDm4O1uBzu9g5RDytW6FQSIA6ET35K3bMVyXwFuJJH+6DOmkEgMcMwwEsM
	8HveZ9KMMn5bMYb/yPfXwcxa/Jv5qqnD5472bklkeFVyJAnhTTiuBVFme/5DXCYIzxQpv+SDGMz
	n/Y/ixx+i59Gg9yFmcIGHOcp62vtBIA3gZNHrhndwRGbgiaO7ZnRcOdMU0wHt0/tHsoaX6z0fjN
	0ESrxgr9TP3YOlCjvXUJS3e8toIHGB/TR/MBgrYP7Ik6VA/Ysk0f8sGCwAdE8t3dINeqFf8sDTg
	3K6cUliEXwqXkHYC+b1/vW0WsFo6k6Bvs8GTcmicSBS3ZUUCX3mU8tswtfgTEfZuI3z5rB/i4BW
	PBy4HzeNWdtclKYl+iZhH0xaZz0iVLgxwmlrJ/2aP/dvrfwKP4LBKaTqB9A1Urcxk/yg+j8+8rJ
	Gpk22qe/I/NbCohU8y4XmjkOmr37NioK+1FJNqAQOewLE1D6xzMEQeHH0bdp2/lkme9bcp69ICT
	JWVXslSYyZ5QniEoxYwv3BTNzgcYcOzPCXgaMHsvdAi+8QAU+jIxymI+YdD554GeB8nHhENV0F7
	xsp0TOwhfUEojJXu0Ku+PrH1slDmsGpOarUT22XjTw==
X-Received: by 2002:a05:600c:19c7:b0:4a0:89:6727 with SMTP id 5b1f17b1804b1-4a1fdd2f2ecmr113114475e9.16.1792693880575;
        Thu, 22 Oct 2026 11:31:20 -0700 (PDT)
Received: from [127.0.0.1] (host-79-21-165-229.retail.telecomitalia.it. [79.21.165.229])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a21143094fsm4556975e9.1.2026.10.22.11.31.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 11:31:19 -0700 (PDT)
From: Carlo Caione <ccaione@baylibre.com>
Date: Thu, 22 Oct 2026 20:30:29 +0200
Subject: [PATCH 3/4] arm64: dts: amlogic: s7: describe the GIC
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
Message-Id: <20261022-upstream-s7-s7d-gicc-size-v1-3-8285053cf4ee@baylibre.com>
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

The S7 device tree describes the distributor and the CPU interface of
the GIC-400, but not its virtual interface control (GICH) and virtual
CPU interface (GICV) regions. Without them the GIC driver does not hand
the GIC over to KVM, which then runs without the in-kernel vGIC.

Describe both regions at their GIC-400 offsets, as S4 does for its
GIC-400 at the same address.

Signed-off-by: Carlo Caione <ccaione@baylibre.com>
---
 arch/arm64/boot/dts/amlogic/amlogic-s7.dtsi | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/amlogic/amlogic-s7.dtsi b/arch/arm64/boot/dts/amlogic/amlogic-s7.dtsi
index 89b75bec40f0..a337783c7783 100644
--- a/arch/arm64/boot/dts/amlogic/amlogic-s7.dtsi
+++ b/arch/arm64/boot/dts/amlogic/amlogic-s7.dtsi
@@ -121,7 +121,9 @@ gic: interrupt-controller@fff01000 {
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

