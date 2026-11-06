Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793953836;
	b=klbUPT0M4F2makzlUW+2cbUuHU9sWvo1fNx2QpyuxJkf+wp6NZ5EcynHDQM/CgDo69b4
	 Z9bqRL8CwBgw+B3KYaKRZ0W2bBSacZT5+Ncn2tOIA7+iYcw5fJQ989f5SdEr55kAbujEs
	 xyp+fQzoUObNI38PbT0EqLUw1aKWiX2P/CiKXxd1I3hESFeIQwzzunxd/Hrkq82a/ZFwm
	 6H6U29HYmvyP4AhfJPtyFBH3NuaiL7fssALHjTbPuUtdlGP8VvEOkEQF/8vhTmUtH1ztZ
	 oUd8vTJhbIHConSL7PggF5tgvRkaPO+su7iXocFdsSUeEOo25foXhpRRWXi6KHqICXA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793953836;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer;
	bh=bBvAlTqUUTVWwtpovytt9429b4fXz6tD1BdJt6T8kRk=;
	b=cn6u6YY1l/ZxaZwFn3etxJyV4yJ5l1gUi0cXM+eXIUaqPP4fmznC5WhiIoCwBN4a2qUU
	 kYu3IDNtq/RCBRm1ZJaF005XneIuOOngVl66v254RBPOFAwhG1EQPXyLcHfRkx+IOhMgK
	 sc0KmJc0jUG6JaLgqNW5ScJsRxXwV5aFSjmuLvAajxZW+9f7uDn47rKq3YCyV9z75gocf
	 rQNYHBJBd5YKWXOlbQ4BRNET1v55IVjLKBSf/1fUs4aZpvUj1E2tnnvaXPQ1CJq9zw+Jh
	 3KM/sRaHo1oypvrKGBofdV9GQeBu0S3FoJtY2AKWqVqzaPdvh5W1j3GskLX+agkHaQQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=KOpLB47E;
	arc=none smtp.remote-ip=209.85.128.48
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10976606D802
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 08:30:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 10976606D802
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=KOpLB47E
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4a35a60499eso2602735e9.0
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 00:30:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1793953833; x=1794558633; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=bBvAlTqUUTVWwtpovytt9429b4fXz6tD1BdJt6T8kRk=;
        b=KOpLB47Ed4bk+JKdsP7yqQLxUdlyrMVxvYibBOjeWaQanhi64o4SrNArejPjmdbfPb
         CtKq7OzYt9cdEl2TWRiaJvIzqSplkLYUu4gjXp0NF7LrIkcd+kP6/bZjNgSd9s94sj6+
         2vARPHzD7YWIO75zzdXzZStAR0ld+MhW58I6OxxxYI6O9hBppbLITOMiTYE9S+dcNfLb
         wNUvKeAX9ioMloEuyFyo6g8P97C/ozKkdv9WP4b1Oq/O4Z0FDA0dC42b3JTcUW1ZTjwN
         TSBygiPJMElMxgnaVcJ0lPcLM+UcLH5uVyr88bS2szahmOu85ZXCNunvq/UmxOD/exY0
         nY1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793953833; x=1794558633;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=bBvAlTqUUTVWwtpovytt9429b4fXz6tD1BdJt6T8kRk=;
        b=hlz1ckWi0JedwBMkpiijdJn+8pZ+kh2Oc4YzHX0aZ9eDolaRFLcoP/KshW8xxcOC0J
         BGerUAb7dH6JG9uZLTqB3hzEr73huyKQzdBbrZ/QP+fufGfn0hR4La82w8hb9w1fKABo
         bqsqyz4g3ulD0MLHvl8Vk4jk+zI4Df51buwixDAhRis7XKaWDbWNUkkh8wCfD27o1fZ1
         CNQg+3Sr6HdaV8x65ASiUENIVRokFqsTMCBzQ4z5S9A5qy/mGhTIcEXjKoOPac/Rgv8I
         OMHbXd75nYKcSfYJdiExM3VJp50PjN4coxl+UX+3QdIJ7wXbWiAcxFqhD36JLkVOxWxP
         U3rw==
X-Forwarded-Encrypted: i=1; AKwUvBy0KNWaH6ZdcfhKKZe3/bdlZMJvICKir7K1l2B0iV+jByGfiyVfrsrok7KYGmGyqez1wIfSTJ+TR5MEDCs=@vger.kernel.org
X-Gm-Message-State: APuU4Z8reqlv1nrRqHZyl8qntRS+OR0eD6JvTxBHurHl/rh41ES6ANKw
	MKnupfMB5iKBAPT6NyVGBYVlT4YdQIYKr3joXuejI0n8xISbviKZhQ8N8ZFpVp3FWFo=
X-Gm-Gg: AYBFou0kxDsDNkSWTU1tEZEdbVo3kOnRe52NEFMbmoJ4HFRmCz2k8i5yVRIe6QoHNPt
	bHS9DgJPRFJc0FMrNqJnzmblzBZAzR0iJzFvDkrsasbYHJnQKvRq7lJfi13mEHqjDawAw1n+x+l
	fYGsqjnxVsXh/j7lwpjGvVXedPMx/jgOsut7TuIPoSUFAZ6UVEHcHMl6BAqhHwAjOFVCOHGI+RM
	4TltAheQ9temtkYGTKbheNX5VV1EdF8BuLOwYP7qs1Y+LULZTwtYQE85vXlxEfYKBuLI3cL18us
	7Dz452nH+XX2IJML3WTSCicKELNzFPfgJJxxxl2iTk4hjkvfNF7aDGd/H7xn2tueRDy1XbpP9NN
	NtK6pvE0q1tOy81LqOOUKyrAcec7mkQfMlGt6Ms/F7/kX4fVfvbywvAc1ouLC7ftJPy2U8K0b2j
	Wq2iA/k6Msx1RSwMPmeg258hTrCeLdEwvS+qmgYqmTQpOm2lKl3E3v7Z6tMp/aVL1Fy5LtDiel8
	4LzZ/3u2JnZhY+znbxvj8VxBGwGYzurcErZMpuDaBXL7qymbn+/EaYS7MTeLEuylY1aeJ3yGVxV
	iVE3ggvnr8dLjoeIDTIlSLtJhv1U5s9gsuxW8waJgpWRWYnDOGugY1auXZDZweSAHnO43yfa9Av
	I75UHWLX03VQRZ2Ir6yFivysQsltHduRgIH0+jZ/CCnCOkII4jcEP1i9P2bcrALoTm5w=
X-Received: by 2002:a05:600d:8408:b0:4a2:526b:d410 with SMTP id 5b1f17b1804b1-4b6f7374730mr17693885e9.13.1793953832731;
        Fri, 06 Nov 2026 00:30:32 -0800 (PST)
Received: from macbook.homenet.telecomitalia.it (host-95-246-144-141.retail.telecomitalia.it. [95.246.144.141])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-492d8472969sm2366839f8f.58.2026.11.06.00.30.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 00:30:32 -0800 (PST)
From: Carlo Caione <ccaione@baylibre.com>
Subject: [PATCH 0/7] Add Amlogic S7 clock controllers
Date: Fri, 06 Nov 2026 09:30:23 +0100
Message-Id: <20261106-upstream-s7-clk-v1-0-7d501d62621f@baylibre.com>
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
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzNDINYtLSguKUpNzNUtNtdNzsnWNU5LSjVLMzY2MzVKUQLqKihKTcusAJs
 YHQvhF5cmZaUml4CMgaooSi0sBVpVAlVWWwsAYXNdmIgAAAA=
X-Change-ID: 20261026-upstream-s7-clk-3fbe6f33652d
To: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Jerome Brunet <jbrunet@baylibre.com>, Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Carlo Caione <ccaione@baylibre.com>
Cc: Jian Hu <jian.hu@amlogic.com>, Chuan Liu <chuan.liu@amlogic.com>, 
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.16.0

This series adds the clock controllers of the Amlogic S7 SoC family
(S905Y5, S805X3): the IDs of the clocks the firmware exposes over SCMI,
the PLL clock controller and the peripherals clock controller.

The peripherals controller is close to the S4 one. Two changes to the
common code come with the PLL controller: clk-pll handles PLLs without
a pre-divider and PLLs with an active-low reset, like the HDMI PLL.

The new clock headers are covered by MAINTAINERS once [1] is applied.

[1] https://lore.kernel.org/all/20261022-upstream-maintainers-clk-headers-v1-1-d09dd4db01d6@baylibre.com/

---
Carlo Caione (7):
      dt-bindings: clock: Add Amlogic S7 SCMI clock IDs
      clk: meson: pll: Support PLLs without a pre-divider
      clk: meson: pll: Support active-low resets
      dt-bindings: clock: Add Amlogic S7 PLL clock controller
      clk: amlogic: Add S7 PLL clock controller driver
      dt-bindings: clock: Add Amlogic S7 peripherals clock controller
      clk: amlogic: Add S7 peripherals clock controller driver

 .../clock/amlogic,s7-peripherals-clkc.yaml         |  126 ++
 .../bindings/clock/amlogic,s7-pll-clkc.yaml        |   73 +
 drivers/clk/meson/Kconfig                          |   30 +
 drivers/clk/meson/Makefile                         |    2 +
 drivers/clk/meson/clk-pll.c                        |   52 +-
 drivers/clk/meson/clk-pll.h                        |    1 +
 drivers/clk/meson/s7-peripherals.c                 | 2149 ++++++++++++++++++++
 drivers/clk/meson/s7-pll.c                         |  648 ++++++
 .../clock/amlogic,s7-peripherals-clkc.h            |  245 +++
 include/dt-bindings/clock/amlogic,s7-pll-clkc.h    |   42 +
 include/dt-bindings/clock/amlogic,s7-scmi-clkc.h   |   27 +
 11 files changed, 3380 insertions(+), 15 deletions(-)
---
base-commit: 363f97a1ce635b86be7fd263d56a040fbd87bdbb
change-id: 20261026-upstream-s7-clk-3fbe6f33652d

Best regards,
--  
Carlo Caione <ccaione@baylibre.com>

