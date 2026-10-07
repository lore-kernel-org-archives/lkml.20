Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4ADF63BE645
	for <linux-kernel@vger.kernel.org>; Wed,  7 Oct 2026 07:26:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791358015; cv=none; b=Hyocf8+VJ9ZFceFvSlVdFhzbJttlGdjBPFTjh7VGvHa+0xXX33L4qnmV8xJ1pwr4FOjGyUu53pb5jzyDjLOv+ad1bkl9HF0DCwLXrp8/emae2RoQROjjWNgkQkCXqg2B95lBeP/gDO1vqu0GZovL0Rmh+DITznaztt1kIRUgh9c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791358015; c=relaxed/simple;
	bh=1JFQJnNJb8HOzAJcaEyU8N13syfiBe5jP0AHNIkfpdA=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=fqropDWNJLOXkuB5lkF7a80Q+KCrXRXB4LWNNWpnoJR3NJSr8uT9w/4mRYdtkYQeBHptUuOgEgiUtVvArSzeCGGt1qullbmdlBqFGxNS6rpC36PlMkdYf8UpQZR8h7PWxQpM0c5agAEOKk2Cscn08Onp6Cuow4xwwMaoVEF4ER0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hRfQftHD; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hRfQftHD"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4a172eb31f0so12813465e9.1
        for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 00:26:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791358012; x=1791962812; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Xc/cMb4XXA+asGhPB5InH/DIUsg9LCc2YMy7yfxc9os=;
        b=hRfQftHDw5QhSEGI1CpgzG8h7nJX08b4SlC58sO/aXkNfUVpHBtNgmY+TIfZUdp1ti
         qgM1UN+eh1dSYQCnCimBB3cO/hyKfJmkU56QsGwUKrOIsWprhTPEN9dV9ABxMzM1iYtO
         X1tb31+RKY0ktwm/fTX43QGISly+us/ZMVZzGaouUb3QGoAcZrm1tFBxBogbaIIPboE6
         05zOqbzy4PjPeQ3ZH8ZdEDO6v/RSU8fohh/H5oUxLvFWwufLy62/4ubYyfFUwXtOXd5s
         CUrXNFWs1G82FoqSBiOIeVwGojN40xxLDZI0fdb4ToFrLFj17tw0JA7UoGtrZB0YPNpf
         /NUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791358012; x=1791962812;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Xc/cMb4XXA+asGhPB5InH/DIUsg9LCc2YMy7yfxc9os=;
        b=WEj3t3Y9O7I7aOw8WMezBo86LNAvYf5iqrYfxba+HyFrhp+BECIi40Ucs8TAO/73FN
         Kxq18C4c6gzc1mTEkzQA9Wl8DRfQJhLjGjQdmvW53XOS+5r3Us9Qaj4pFEsfILNQfPlq
         FrrdQuTLEPSxEBROGcgph/SJLvo9ADCyl/ofvSAHA/uV1PRf0LJSEg/4ckvC280xF1Jz
         P1Z01Gu92762pzAL+HjVZoKyOXyD6SKRkvMG1lYDn6bbn0daw2L3n/19rOgDQrs/mW5O
         hUk5UkkOOImY5ZkhK7b46Fg+4Y98wciBBUQEgGc1SbWmI1QlHGiGQNWbDRtXpO7ekbvr
         jmPw==
X-Forwarded-Encrypted: i=1; AKwUvBz8pbFNzBMV3C8JoZHeQOWOE9L81/0Gex8W5qbkePjoSCGMT0B2HQDE/zCSy4oG1TbZLvgRYmFLyu/2uNc=@vger.kernel.org
X-Gm-Message-State: AFuF++noPYdi0scuG71Fce3kNWUr5eF1r7LOCvmQ7LuMXP1mXwHNOguG
	J8Aa2EB2b29v27jx0Ejsqx9Kh1FETYkVwBjEDC5nUXvxrTWtqMvcILkE
X-Gm-Gg: AYBFou01pmxHR6iIs6W6zUIjAOe+xQ4ucpbtx/0zgaj66MniVQ/I0me0XAPMT9TnFlg
	tWM3Uw716LA7+bhJsldTf0x6hMLJt0l9B119j+KfIEGV1ykPZVdzljt3wCpNhULe8IYKfMA585W
	ekPJqwD9ReV7v813z5ZtN9ECTsGTC7k0+XWzun1fL6JApL+oU3yAVuwKPttDZhDyAmChocHFQSb
	s2kgoKcjSGl3U2/lGOBersj55ZtdTKVFskMxwnoTAV5GJtZ5x+vKpdwd97jmLmPUEyF5x/1Mqau
	g7oCsyjE6eMv+Xph2RrKUB4xopIyVj7pElWUoFk7Nm+n5fIh7F4+PLq9czhm+zllh6Jd9vX7uhs
	6eTNTWvEAXZl21VwfdPxaU0+7poq8u70YBaU4D/bPTnVzTyDa4JxtYQDqcwbC/pLRcBet5wzVHa
	ZvUinXlyvHnWUfb+nMK2lU4sovaBjYZOYmWpbTcGjzGnLypKtbMH5EiLNSSTl8g+ud0QvNFY6SG
	oWpga8NY5Gus5iQSlU=
X-Received: by 2002:a05:600c:524f:b0:4a1:6d35:779a with SMTP id 5b1f17b1804b1-4a1800d1ca4mr18145295e9.3.1791358012318;
        Wed, 07 Oct 2026 00:26:52 -0700 (PDT)
Received: from taln60.nuvoton.co.il ([212.199.177.18])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a180310c9fsm29912955e9.4.2026.10.07.00.26.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 00:26:51 -0700 (PDT)
From: Tomer Maimon <tmaimon77@gmail.com>
To: andrew@codeconstruct.com.au,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: openbmc@lists.ozlabs.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	avifishman70@gmail.com,
	tmaimon77@gmail.com,
	tali.perry1@gmail.com,
	venture@google.com,
	yuenn@google.com,
	benjaminfair@google.com
Subject: [PATCH RESEND v10 0/6] arm64: dts: nuvoton: add NPCM845 SoC and EVB support
Date: Wed,  7 Oct 2026 10:26:39 +0300
Message-Id: <20261007072645.1618147-1-tmaimon77@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series fixes the remaining timer binding issue and adds device tree
support for peripherals on the Nuvoton NPCM845 SoC and its Evaluation
Board (EVB).

The first patch drops the undocumented timer0 clock-names property.
The second patch splits the two APB address windows into separate bus
nodes before any peripheral nodes are added.
The third patch reorders timer0 and PECI so the APB child nodes stay in
ascending unit-address order.
The fourth patch introduces peripheral nodes for Ethernet, MMC, SPI,
USB, RNG, ADC, PWM-FAN, I2C, and OP-TEE firmware in the NPCM845 SoC
device tree.
The fifth patch cleans up the pre-existing NPCM845 EVB DTS property
ordering to match strict dt-check-style expectations.
The sixth patch enables the NPCM845-EVB peripherals, adding MDIO nodes,
reserved memory, aliases, and board-specific configurations such as PHY
modes and SPI flash partitions.

The NPCM8XX device tree was tested on the NPCM845 evaluation board.

Changes since version 9:
        - Split the F0000000 and FFF00000 APB address windows in a
          separate patch before adding any peripheral nodes.
        - Add peripheral nodes directly under their final APB bus.
        - Renumber the timer/PECI ordering and peripheral patches.
        - Renumber the EVB coding-style and peripheral patches.

Changes since version 8:
        - Split the EVB changes into a DTS coding-style cleanup patch
          for the pre-existing board file and a separate peripheral
          enablement patch.
        - Fix strict dt-check-style issues in the EVB DTS by reordering
          properties and nodes, normalizing blank lines and continuation
          alignment, and lowercasing hex literals.
        - Drop the unused tip_reserved label.
        - Keep patches 1-3 unchanged.
        - The remaining refclk unused-label report is a false positive
          because the label is referenced from the included common DTSI.

Changes since version 7:
        - Move timer0 to keep APB child nodes in unit-address order.
        - Add PSPI to the commit message.

Changes since version 6:
        - Remove IPMI I2C device.
        - Add FIX enable property.
        - Keep patches 1-3 unchanged.

Changes since version 5:
        - Add no-map to the tip_reserved firmware memory region.
        - Drop the unsupported snps,eee-force-disable property from
          gmac1.
        - Rework the FIU0 boot flash layout into nested fixed-partitions
          under the bmc container.
        - Keep patches 1-3 unchanged.

Changes since version 4:
        - Split the timer0 clock-names cleanup into a separate first
          patch.
        - Remove nuvoton,sysgcr from udc8 and udc9.
        - Rename apb: bus@f0000000 back to apb.
        - Rename spix-mode to nuvoton,spix-mode.
        - Keep cooling-levels as 32-bit cells while encoding fan-tach-ch
          as /bits/ 8.

Changes since version 3:
        - Remove tmp100.

Changes since version 2:
        - Fix DTS warning.
        - Arrange node order by ascending unit address.

Changes since version 1:
        - Fix commit message.
        - Fix dtbs_check warnings.

Tomer Maimon (6):
  arm64: dts: nuvoton: npcm845: Drop redundant timer clock-names
  arm64: dts: nuvoton: npcm845: Split APB address ranges
  arm64: dts: nuvoton: npcm845: Reorder timer0 and PECI nodes
  arm64: dts: nuvoton: npcm845: Add peripheral nodes
  arm64: dts: nuvoton: npcm845-evb: Fix DTS coding style
  arm64: dts: nuvoton: npcm845-evb: Add peripheral nodes

 .../dts/nuvoton/nuvoton-common-npcm8xx.dtsi   | 731 +++++++++++++++++-
 .../boot/dts/nuvoton/nuvoton-npcm845-evb.dts  | 441 ++++++++++-
 .../boot/dts/nuvoton/nuvoton-npcm845.dtsi     |   6 +
 3 files changed, 1155 insertions(+), 23 deletions(-)

-- 
2.34.1

