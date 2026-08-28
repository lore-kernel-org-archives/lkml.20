Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 982D9364058
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 15:35:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787931333; cv=none; b=qnb2L8x4J92aGRv7Z9clGczNRX/TY8XFI21pjktspvvI3LpuyNApoXwsNSm7IjFwKocazoeyjggNyaQ7snEDaJUvgpNIXiEfHB+39FdifCqwHfCtgCeHcQ79xwvFq94T2xh3jsyjsT+ZPf6icfuXPURaEkhcFYwA2V8/WZEb0EQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787931333; c=relaxed/simple;
	bh=csZZhW2kTQDC7OmCQK09jSOUeljVKRXJMg7XkzOcdAQ=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=lAjx76A+fX0GE/SVbK3R80BHDo8oj5DF8cSpJ5Ccz5uJbnyJ3DeughwYHspFmmOTMsQ/QoCdlVom5gCxdGkvNFOYD2s27T9xrT8fYudpMQUaYIHD3hOfHNDZtA4Bc+QJLWDVQ7g+p+saJfmikq1VK/ZJrdKFZHGms0bTLGs1ddo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=s9IITnGG; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="s9IITnGG"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2ceab75934dso10895525ad.2
        for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 08:35:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787931331; x=1788536131; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=rQup+UUtgEL0yAVMr8c4LZuaauGy5rlbpwT/5caEB14=;
        b=s9IITnGGGbMH83F3qNM3dRZ18d3Ovxh/siPs3/e7XeUC46rzDZnoOJy2o6518HMAgd
         IocSsgJgW24jRFtjfsDpeywkR8yEYWa6fkP8ii7HF5o3mIiKByxiU6Q5HdjstoyaEYn/
         6K+dgPyDSdsJfMokeUFDaFJG0T7OuyOZF6UqgNmt3qRgERIkX15xItEpjwQfJiaYhkVy
         0ZTSi5KuI0ySH5sot6IZGLSG3MTRyzT9qY4dWx9PFyWKgemFsE2KrxRUE1aVUgan8lnY
         CFkil7nHGVasUyhKkT19vgbVv9BnnuA6cPnL/ZKqSMinHAIfjK+i01Cf9jNZf1IX8Yrz
         SILg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787931331; x=1788536131;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rQup+UUtgEL0yAVMr8c4LZuaauGy5rlbpwT/5caEB14=;
        b=P0pS/nKONk1XDeR1W2GqpMHmXK7XAW9T7M+Kvi5fbsJFZmzV/Y7WMx6O4PFgrVsvOl
         /R1SK6cwViInpkbnkNuTd5D71nqkYrXL9Cst6gV2rQIQBUQ+bpjFw4hTJUVBjTLasOmL
         trp06amvk2FsNCAUGyRm9XNFTqeLiMId1ois0gqVnFhnP6AZtwFb2WMHzWOW15A777FW
         wUj4jzdMeZiGJ3GcLqwk9RAayNYbCYCgw/dCd8nEjMq18RRW8K5Q+qcyLxYEfQHAk229
         qpf/A2Hvj3dsbU8Qt8oTa6PNoJkFueFJQyNtVcFKhP2CwK0Wi7t1VzwbxXLmpJtm0L1h
         NnQQ==
X-Forwarded-Encrypted: i=1; AHgh+Ro22zNwfMzssdjYernJ+q2c30xJxghDCG50mZE7pw0P9rjmkVcK1wOZZM7EhMUJnrr/Wa45bOHRO0cxdTo=@vger.kernel.org
X-Gm-Message-State: AFuF++kdPjk0i/dwyzN/ok4eLOEvsVYPCZ95GoUeaUQiKJY35MFeehnM
	mXax2OxKOMRQjHazM9MmtlMsUbkgaiDobi67L/eK3e1MVCx88s0NxJNe
X-Gm-Gg: AR+sD12kRiMcpjCEB/zV5iU1b5K5gBTWyPbsPqUaB+/gcgX2yrkdTh7qQs2jkR/NYF0
	oEtTJJ6qcrcfwimKb/Fb7PZLGPPm0aq0WxhH25BGn28lyjiWbiBoMWRZ8lUC+jdU/rggoIFjInP
	6StUqXW335zpSIduMozVX7AAPBxOd9v1subLPmHuxF47ma/dfahDztdDrUUDnmI6f33BGGq0Ns3
	fwxxR4QgxAD75U5MUjI1yLBSA41UFlvzBZQRPhY81dJb85ulowY0JF0pnSwk9b+XDW5uaT5gDWg
	8XPbh2kmir4J4m2Z0P/ytnjBTN7EwL9HnQMjFMT5m8yNSEEqgl575yoaE3rbKOc4O+oaJb0OceJ
	CTO07vQlmV8IW1H5ExuZmgTIk+oOwx1/2ZO5WfSZPYwDUGIUk7mLBSlFrykFsV6v/2IYosq0vHt
	4sOP2HIOJK0ZnoTlB3NjoYBsyyqAJe+VLiBUTxLT2yj/G+AUA3iFh5MVkhUM6Cjl0HfHvhc2Spe
	jp2pNnMlwg=
X-Received: by 2002:a17:903:286:b0:2c8:248a:5dbb with SMTP id d9443c01a7336-2d74dcbe867mr167466245ad.7.1787931330475;
        Fri, 28 Aug 2026 08:35:30 -0700 (PDT)
Received: from DESKTOP-TIT0J8O.dm.ae ([157.51.224.60])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3286f9e2a95sm6256824eec.23.2026.08.28.08.35.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Aug 2026 08:35:29 -0700 (PDT)
From: Ahmed Naseef <naseefkm@gmail.com>
To: linux-gpio@vger.kernel.org
Cc: Ahmed Naseef <naseefkm@gmail.com>,
	Benjamin Larsson <benjamin.larsson@genexis.eu>,
	Christian Marangi <ansuelsmth@gmail.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH v2 0/3] pinctrl: airoha: add EcoNet EN7528 pin controller support
Date: Fri, 28 Aug 2026 19:35:12 +0400
Message-Id: <cover.1787931313.git.naseefkm@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The EcoNet EN7528 is a MIPS SoC that uses the same pin controller and GPIO
IP as the Airoha SoCs, so it reuses the shared driver code introduced by
the split into per-SoC drivers. Its register layout differs from every
existing variant though: all IOMUX mode bits live in a single CHIP SCU
register plus a few spill-over bits in IOMUX Control 3, EJTAG has its own
enable register, and every pin configuration register is at a different
offset than on EN7523.

It also differs in a way the shared code did not model: only GPIO0-GPIO15
are wired to the interrupt controller, while the driver assumed all
AIROHA_NUM_PINS GPIOs could raise an interrupt. Patch 1 adds a
num_irq_pins field to the per-SoC match data to describe that, bounds the
interrupt callbacks and handler with it, and feeds it to gpiolib through
gpio_irq_chip::init_valid_mask so gpiod_to_irq() fails up front for a pin
that can never be an interrupt source. All existing SoCs pass
AIROHA_NUM_PINS and are unaffected.

Patch 2 documents the binding, patch 3 adds the driver.

The series is based on linux-pinctrl/for-next, as it depends on the
per-SoC driver split and on the CHIP SCU lookup by "airoha,chip-scu"
phandle that landed there.

Tested on a DASAN H660GM-A (EN7528, Airtel), booting OpenWrt.

Changes in v2:
- 2/3: move patternProperties after properties, and allOf to the end before
  additionalProperties (Krzysztof Kozlowski).
- Rebased on linux-pinctrl/for-next.
- Link to v1:
  https://lore.kernel.org/linux-gpio/cover.1786262697.git.naseefkm@gmail.com/

Ahmed Naseef (2):
  pinctrl: airoha: limit GPIO interrupts to interrupt-capable pins
  dt-bindings: pinctrl: Add EcoNet EN7528 pin controller

Benjamin Larsson (1):
  pinctrl: airoha: add support of en7528 SoC

 .../pinctrl/econet,en7528-pinctrl.yaml        |  190 +++
 drivers/pinctrl/airoha/Kconfig                |   15 +-
 drivers/pinctrl/airoha/Makefile               |    1 +
 drivers/pinctrl/airoha/airoha-common.h        |    3 +
 drivers/pinctrl/airoha/pinctrl-airoha.c       |   33 +-
 drivers/pinctrl/airoha/pinctrl-an7563.c       |    1 +
 drivers/pinctrl/airoha/pinctrl-an7581.c       |    1 +
 drivers/pinctrl/airoha/pinctrl-an7583.c       |    1 +
 drivers/pinctrl/airoha/pinctrl-en7523.c       |    1 +
 drivers/pinctrl/airoha/pinctrl-en7528.c       | 1204 +++++++++++++++++
 10 files changed, 1443 insertions(+), 7 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/econet,en7528-pinctrl.yaml
 create mode 100644 drivers/pinctrl/airoha/pinctrl-en7528.c

Range-diff against v1:
1:  5a7f97adbca7 ! 1:  420a5e385cf7 pinctrl: airoha: limit GPIO interrupts to interrupt-capable pins
    @@ Commit message
         instead of deferring the failure to request_irq().
     
         Signed-off-by: Ahmed Naseef <naseefkm@gmail.com>
    +    Reviewed-by: Benjamin Larsson <benjamin.larsson@genexis.eu>
     
      ## drivers/pinctrl/airoha/airoha-common.h ##
     @@ drivers/pinctrl/airoha/airoha-common.h: struct airoha_pinctrl {
2:  7e6150b186c2 ! 2:  c20005a81b40 dt-bindings: pinctrl: Add EcoNet EN7528 pin controller
    @@ Documentation/devicetree/bindings/pinctrl/econet,en7528-pinctrl.yaml (new)
     +  '#interrupt-cells':
     +    const: 2
     +
    -+allOf:
    -+  - $ref: pinctrl.yaml#
    -+
    -+required:
    -+  - compatible
    -+  - airoha,chip-scu
    -+  - interrupts
    -+  - gpio-controller
    -+  - gpio-ranges
    -+  - "#gpio-cells"
    -+  - interrupt-controller
    -+  - "#interrupt-cells"
    -+
     +patternProperties:
     +  '-pins$':
     +    type: object
    @@ Documentation/devicetree/bindings/pinctrl/econet,en7528-pinctrl.yaml (new)
     +
     +    additionalProperties: false
     +
    ++required:
    ++  - compatible
    ++  - airoha,chip-scu
    ++  - interrupts
    ++  - gpio-controller
    ++  - gpio-ranges
    ++  - "#gpio-cells"
    ++  - interrupt-controller
    ++  - "#interrupt-cells"
    ++
    ++allOf:
    ++  - $ref: pinctrl.yaml#
    ++
     +additionalProperties: false
     +
     +examples:
3:  c3b785d8463e = 3:  ea5b2ce92136 pinctrl: airoha: add support of en7528 SoC

base-commit: d067f0f4c96cb5402a111cf649b7bf9c5771ec74
-- 
2.34.1

