Received: from mail-qv2-f42.google.com (mail-qv2-f42.google.com [74.125.230.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D53F7443C17
	for <linux-kernel@vger.kernel.org>; Mon,  5 Oct 2026 23:09:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791241775; cv=none; b=WUnplmsZW/e83gHH8foB9v0HtfxYp2XHl5+UXKaftbyEJNWPVyftza9A1Zc5KlwLIqnXYj0AwGSLhkrt5YN8z/DuD27VsAsYlLJycABqX36TbSYiYDX6XBMh2mw9Sc/7ZLbZx88+9+nVcruTHfHP4yKBYBrg2TJRO8sjUTfpJ2E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791241775; c=relaxed/simple;
	bh=b0bEVA86VyyHz5nQ+2UxZSzWxBoAP+zyISUZ3T8VRko=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=nP7iE/+6ylTL5K0SG0fYnDNOjoZC+s0oWlegINkcygMw8T3N3xeLu9rrNxBIGWVqnjq3ds0CblZiycAXTWfZX6fTiKH9mugIcpVOtyaKT2Sp8AWypeAA/e/KSJmOVfftkBVYx8jruw4Dgw9czFNEn8wrzk3kSQtaD3Myl7EoF3A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b=jhoHViT8; arc=none smtp.client-ip=74.125.230.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b="jhoHViT8"
Received: by mail-qv2-f42.google.com with SMTP id 6a1803df08f44-917bef0d531so41501536d6.3
        for <linux-kernel@vger.kernel.org>; Mon, 05 Oct 2026 16:09:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1791241771; x=1791846571; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=MQV3ii+qSfSea4Cw0bZn9/qaZsDG0gsTwXp5wwzAElo=;
        b=jhoHViT8B2A6av+l5LAX4BiDRkFbZgEUcVsOG2/zZ8Rfjs3RNTus0wwShhyCaf8pN9
         K9i1UbO/et/V/uCXrmhT3wIBxY563u1WJ9CUWx4uohNF5fmHBGjrVovOLm5w6AvvfM/q
         A0pDAavZ6Wl75qA24G9bB7z5fyz/BtSz+RTPgYGfEU4fDx/slaXoH1jN5UBmv1Wtrmzg
         L/GYuaLhCxkWykNSO+8NwRpqTBm/pP/p6KM/c+eyx5j/pXXwn1URHKKuZqlaM2U8yFIG
         3pWfLaJIOET+boIZFFWVaUtVbH1AEisNNPVu6lBa2zuPTm0LCNoq6p6Mw3aoEKFzfmrj
         KsSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791241771; x=1791846571;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MQV3ii+qSfSea4Cw0bZn9/qaZsDG0gsTwXp5wwzAElo=;
        b=c/ruBt/JWjPgYwiHljh1qpeEe1KqMrcd/AYLUPW43ASvUR41SrgdFZzsXvTbZLrCaJ
         omXDBj8DKmrY2FWAfJ2vW4e2fpTEwya4HsqMqKBwJuO9GJxXxevblNcSl/MkSvTi73I2
         uhFQP8ENZ6P5YeIKl/j4eMSE22xsIFW2Jr+4eNKQ0DqriMQmGKi4hghRKTVYkFr8xJmC
         j5JnA2wWenV0lSVdBZ8rW8ddijG7S77T+vvgIqfdQrFmwi3gOURTpZX+eBasWXFyjieA
         eD45kKbBqAOY/zlVYdmAV9SsQWDy9IOzXUbr9oacVjZWFUH4WYe8Z1Qql8gPca+EY7p0
         ISvw==
X-Forwarded-Encrypted: i=1; AKwUvBwetwWJxpAnpdn0UgP3xtzLgdTFq9ce/AvlAk8m7M/SnZLMLIYGs96nBWzmH0hs4tI5M0BDL2SkNbUwKI4=@vger.kernel.org
X-Gm-Message-State: AFq9FYLr1OwVkitbey9hEFzLk/oYYzUn4t0NGsLjLp/jjxku1VHHgf1O
	gXd8uDwdXAUfTrZ8wCWr33n1uJdotPzMs2oa6Y4YW5APAj6RF38kXmoC9lpCQ9OyUjw=
X-Gm-Gg: AYBFou3i+cLyT12C77wS1STSyv/3k/FX8hFLu/u9kaR4bDbO3rJSKkoNNbUNE8WdmkQ
	catXNOxofelpBU2Df82R/S8xixyG/szrm65ot0Jzwuk9xoHsbEJQs+nTgQ1ROHAsywK1n7h8E96
	EZ3vtsTw/29NmxLvad0OYDt9WdLk7HI/p3ylEcT9DDRHGetBQdsLBTzBlPEE6YGAqLgk4orvSeN
	aKjZetEkCT6OsINpEqpRrWMXGRxKwAK+CW94JS9pNkyhoT1TCGZ4v2oKVzQo0FWXZgwIvFrjSs/
	+Fzje7H/A0Wwb1Q2X9Ie83kCU1BD2FSGQdSIrAHCzB+Ush6UgT0TiqlS25gZUrd86tKiSuPSppB
	5ICPnVEM7W5Nb/jD9hwgSkgglkAbREP6nlfMZMQZ+xF/cs/pv6P5wJVcRP2qIY1sM3MejDASxtW
	pmM291hTAAxd9gl6tFiiQzsgv1QeHQxczhYGIMjgpodOy9Im6Cyt/ESxFf4rp2GGRzK1TSNp2dT
	CMBJeDdfiwYDA==
X-Received: by 2002:a05:6214:598b:b0:917:9f83:6540 with SMTP id 6a1803df08f44-917bff42ff8mr244696676d6.5.1791241771486;
        Mon, 05 Oct 2026 16:09:31 -0700 (PDT)
Received: from zippy.localdomain ([73.62.185.64])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-919442ce1c4sm89892116d6.3.2026.10.05.16.09.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 16:09:31 -0700 (PDT)
From: Alex Elder <elder@riscstar.com>
To: sboyd@kernel.org,
	bmasney+clk@redhat.com,
	jbrunet+clk@baylibre.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	andersson@kernel.org,
	konradybcio@kernel.org
Cc: abelvesa@kernel.org,
	kees@kernel.org,
	gustavoars@kernel.org,
	mohd.anwar@oss.qualcomm.com,
	lorenzo.bianconi@oss.qualcomm.com,
	danielt@kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-hardening@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/3] clk: introduce TC9564 clock support
Date: Mon,  5 Oct 2026 18:09:23 -0500
Message-ID: <20261005230927.2000398-1-elder@riscstar.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series adds support for the clock controller present within
the Toshiba TC9564 SoC.

This SoC attaches to a host system via PCIe.  It includes a PCIe
switch with three downstream ports.  To one of these ports an
embedded PCIe endpoint is attached, and it implements two PCI
functions.  BAR 4 for both PCI functions provides access to the
registers that enable or disable a set of clocks.

Both TC9564 PCI functions provide PCI endpoint buses via devicetree.
Each PCI endpoint bus provides access to one of the function's BARs.
Subordinate devices (like the clock controller) can then be defined
as nodes accessible on the endpoint bus.

Only one of the two PCI functions is permitted to define the clock
device node.

					-Alex

NOTE:
    This series is built upon linux-next, with this patch applied:
      https://lore.kernel.org/lkml/20261002181849.790275-1-elder@riscstar.com/
    It is available in this git branch:
      https://github.com/alexelder/linux/tree/outgoing/clock-v2

Between version 1 and version 2:
  - Previously, this driver also included reset functionality.  That
    is now in a separate reset (only) driver, which will be sent for
    review separately
  - Dropped the "config syscon" devicetree binding
  - Reworded the clock binding description to focus on hardware only
  - Clock IDs are now consecutive (no more commented-out values)
  - Get the definition of of_device_id from <linux/device_id/of.h>
    rather than <linux/platform_device.h>
  - Dropped a comma that followed a ternminating empty array entry
  - Config option COMMON_CLK_TC9564 now selects MFD_SYSCON
  - Clarified in config help text that the reset and stmmac drivers
    are the "others" that use the config syscon
  - Moved the clock devicetree node to be a peer (rather than a child) of
    the syscon node.

Version 1 is available here:
  https://lore.kernel.org/lkml/20260918165234.687224-1-elder@riscstar.com/

Alex Elder (3):
  dt-bindings: clock: introduce toshiba,tc9564-clock.yaml
  clk: toshiba: introduce a TC9564 SoC clock driver
  arm64: dts: qcom: qcs6490-rb3gen2: add the clock controller

 .../bindings/clock/toshiba,tc9564-clock.yaml  |  54 ++++
 MAINTAINERS                                   |   8 +
 arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts  |  16 +-
 drivers/clk/Kconfig                           |  12 +
 drivers/clk/Makefile                          |   1 +
 drivers/clk/clk-tc9564.c                      | 262 ++++++++++++++++++
 include/dt-bindings/clock/toshiba,tc9564.h    |  34 +++
 7 files changed, 386 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/devicetree/bindings/clock/toshiba,tc9564-clock.yaml
 create mode 100644 drivers/clk/clk-tc9564.c
 create mode 100644 include/dt-bindings/clock/toshiba,tc9564.h


base-commit: e8e67c48ac5cd9b0e7ba4ba2cef9decfa7327833
-- 
2.53.0

