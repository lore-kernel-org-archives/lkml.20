Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792917580;
	b=JylBbDPSxlDjBRrPK/LxLT7p46S6D/1t2ylyJeYKZQ+XLH4Ddzz2khlFUpu2kbXNH1fn
	 E25sz9M/wnhbKtIf2becc6r3D9ps1rlzgs4YIEyW6qBEamFgjf7K7GqSGgZge5Zuh2VvD
	 z7eBND8V4Ex02tBG6s35Yd19Z3hCXe3u6iZG7ogXq1WVVzsu4nQYi6dSxM2KMc6R9yCB0
	 zDOV7p87147FpdHj1zSN7jc5ZNharfTw3M3lWlHYNhWhEYAYzfHDciOxEQrQPNkoyfNKr
	 tGhPKKpHsLj8gi6K/alAZNutwccy7d8kuZ4BSuxNPvTh7HYGR0/rQSmjw5u8+fb9vtg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792917580;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=aZgZnRh0aurROdQhtMg5ehI3tYqFA35O+N2pjyOvIwc=;
	b=SdiV8qcGJJ6TyP+BpPK15qq4QFjwWWW6Q8ke7jRUmokbCefHHvJGgL02wK3ZGaAYFzf2
	 WBE8GlriAcgX17/eh5sVuXmwH22VjryeG3q3bgAJHojMF3NOIZ3EnSpxxEZAG4Cw7Sbpu
	 2wr/rw9MnG/T3PAJcAeS0UScRdTeZoAEBhJQUN4T0HYmjsAC5YrTrPlwk4W48cz71WkfE
	 e59VbVxz4lFSvC78gZecyXVEkBhFJ3FnLh0tbzKQ9OfW3TuNJYWF96Nj96rSqmQDtB7Vt
	 rJO9foCC4n01AN0r/we7VQrQOQih5zVE1mT96CfXYVf+aIQHnSLbBkLBkqeRNb4iegA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=nVowlhw5;
	arc=none smtp.remote-ip=209.85.216.49
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CB0D606A31A
	for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 08:39:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9CB0D606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=nVowlhw5
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-38ec1402b05so1010322a91.2
        for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 01:39:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792917579; x=1793522379; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=aZgZnRh0aurROdQhtMg5ehI3tYqFA35O+N2pjyOvIwc=;
        b=nVowlhw5w3749vHvseTxbox5D9wvDbWlmIxnJfFFAvn/eVTcQfk8k3Fxue/AN/xh6R
         h4EU2FwFyNUZW1U8wWQKfiZERuGQujIelOXPRLIw4v4ee9vXMcrvvxEPyb5hHfa3l6T5
         2L88KJ2NYZ4d739vkxgLtOki+EGyrjkqyza0rASP3m/WN83DnL0vK4Yxrfj55gUjav28
         wMP/1dm0vTncLzEKWO7JVdT+YwrMcPSBy6E27Vi/eDDbLEmMoeQKJ3v+g2H3Ngq1qqqZ
         qLr33BSEZgauVZ7CfdKsF13/JHZGlqd/AxHhV88Io5XOHMx7SSLbv9r3iOCO+oRk7ffN
         Ce+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792917579; x=1793522379;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aZgZnRh0aurROdQhtMg5ehI3tYqFA35O+N2pjyOvIwc=;
        b=Ib69FbXstqiXbbUdQsliRKqMtemVv76dVz2HU9bEOWMmoa7nXqTlXNDpHChQ0DjUrE
         TcsjSKDkRhtQc6ErKIycmgJWJyeWN7EDg3zqgazvXH2ASegI2DoSSi9MTV1+YFDC/Zsa
         S49+HVs5CHcFeUQhdiPuZ7cUkNOTkuM9aY8TpWyLeDtAHLiGfJHB5gjOlGcQpQ9ApbOQ
         LHHhJH64y9yz3msXcvYmjnoR2x7S3m/11xVDLpOhEKksaUpykPJo8qbbQ3Li//CVtoVL
         BCpM2yLxjqmygbEVWPcbUPPMRjoZfEbdyo65ztWockBfeR4L13EoPgVCSBT1oO1U1HHY
         Uq5w==
X-Forwarded-Encrypted: i=1; AKwUvByI7wAw9kYCy4W9N3fTo6QRBLV09YOJXBMxktFTLUnnF+aEsc76fsoIfPv3GFqRGhRD0c6eB/Hkb0J8fwA=@vger.kernel.org
X-Gm-Message-State: AFq9FYI2LIHfFXaam10YEIQNOEA30wE84J/dWiY+cNeuFUWiizuUmQl0
	yuWSaJECsfdhzVioGBmAUnSDu7qeQ+w2A8cxXlv1Lyq41aU7+NiMs+Xa
X-Gm-Gg: AYBFou3KkePv+e5nD6ZXD5U4Gxm+OSvY6zR5Y5cOFi4bSlZNy/QKgDkeTZY4HXEu/R8
	j/km3Rho0RH/iXcoEobrJhmN0XhuGCpGSEwpc0f2Ycxy863koSUFvzQ1vKejycsnSf7vgTxHPYv
	F1l0Q2uhWPOb1/ONkahkKL9d2k+bUCJW7zHv3DqGfy33bsnxcTOOVKg0a9Ib5M77a4YPmu4V0x3
	byx0rXjjyoaRVZ+ZmMRbqzlWhY+1O7pWD8z/FkUqzlz0DPcuAqvRmM2AGg5Cw5tvCNx8dRc0ECf
	fsYcjI5fNBRyRtJM1VLes4yLxAB+CNYF4hv4iKuUk3jagosdPeMCUolLO7OrAnEJcs/8a0gPpOb
	BUU+nOc8F+WjHNLXdjhxVJvTCLVnD58QhTmE0V0McH/M+y2Ek4Sehh9uHdazWc4EYxQ0rkfXxqH
	evJF9CZ4UjSHfsy8Q4dfGSdRzfziNg5TcU4dNbApcxDWeH/z9t3vQjG9DVQMk+vbLhN8nzcbnOc
	WUi0tjkJdtOtCTXHGzF9cKeXobJbw4tS5KFatvm6UiLkwTzDHwTjkwKXqZyA/rfP2wz/tajhUXT
	j9X+FpuB3u34MT2hlSq1hDtmpeymOIdGB7eynDKQIU+RAIgkpun/HLWdeT4KeG1+To8Tmv9wRIM
	9x/aZBnhpKIQlzEXT4F853xJsjaxT6DZ8w94=
X-Received: by 2002:a17:90b:5906:b0:3ad:1841:6f8b with SMTP id 98e67ed59e1d1-3adead0bdc7mr3144482a91.37.1792917578985;
        Sun, 25 Oct 2026 01:39:38 -0700 (PDT)
Received: from alanhc-14700.tailb22ec2.ts.net (180-177-138-120.dynamic.kbronet.com.tw. [180.177.138.120])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3adebe69478sm4585051a91.3.2026.10.25.01.39.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2026 01:39:38 -0700 (PDT)
From: Hung-Chun Tseng <alan.tseng.cs@gmail.com>
To: Yixun Lan <dlan@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	E Shattow <e@freeshell.de>,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 0/2] riscv: dts: spacemit: mark K1 boot nodes bootph-pre-ram
Date: Sun, 25 Oct 2026 16:39:31 +0800
Message-ID: <20261025083933.26066-1-alan.tseng.cs@gmail.com>
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

On the SpacemiT K1 the BootROM loads the next boot stage into SRAM, and
that stage sets up DRAM. This series marks the nodes it needs for that
bootph-pre-ram: the SoC clocks, UART, boot media and the two I2C buses
in k1.dtsi, and the board EEPROM (which holds the DRAM configuration),
the PMIC rails and the SPI NOR in the board files.

The vendor confirmed that the BootROM itself does not access the
EEPROM [1]. It is tagged because bootph-pre-ram covers the phase that
sets up SDRAM, and DRAM cannot be trained without it.

Testing: all K1 DTBs build, and dtbs_check is clean for them with and
without this series.

I used Claude to help read the U-Boot SPL and the device trees. I
checked the changes and ran dtbs_check myself.

Changes in v3:
- Reword both commit messages to describe the hardware instead of what
  an SPL does, and drop the U-Boot paragraph from patch 1 (E)
- Tag i2c2 in k1.dtsi too, as every K1 board has the EEPROM there
- Tag eeprom@50 on the OrangePi RV2 and R2S, missed in v2 (Sashiko)
- Drop the Assisted-by tags, see commit 1e035297ffda
- Keep E's Reviewed-by on both patches, as the changes are the ones
  discussed on v2
- Link to v2: https://lore.kernel.org/all/20261017180141.3477743-1-alan.tseng.cs@gmail.com/

Changes in v2:
- Tag i2c8 in k1.dtsi instead of in every board file (Yixun)
- Rebase onto the spacemit dt-for-next branch
- Link to v1: https://lore.kernel.org/all/20261012235624.77993-1-alan.tseng.cs@gmail.com/

[1] https://lore.kernel.org/all/20261021083425-GKA125937@kernel.org/

Hung-Chun Tseng (2):
  riscv: dts: spacemit: k1: mark boot-critical SoC nodes bootph-pre-ram
  riscv: dts: spacemit: mark K1 board boot devices bootph-pre-ram

 arch/riscv/boot/dts/spacemit/k1-bananapi-cm6.dtsi |  5 +++++
 arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts   |  5 +++++
 arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dts |  6 ++++++
 arch/riscv/boot/dts/spacemit/k1-musepi-pro.dts    |  6 ++++++
 arch/riscv/boot/dts/spacemit/k1-orangepi-r2s.dts  |  5 +++++
 arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts  |  6 ++++++
 arch/riscv/boot/dts/spacemit/k1.dtsi              | 14 ++++++++++++++
 7 files changed, 47 insertions(+)


base-commit: d05c6236496071916e19012cda7149465f15e66e
-- 
2.43.0

