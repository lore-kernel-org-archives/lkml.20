Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793696341;
	b=Omo0v4n6qzoQk4z6Z9GIFRBV2DZvtbzpohE4IOBFBSyEoOTiuCL3x2t3lj5LakDmv3M/
	 DlaJbs616BXIjnkSmK5mqPyDu9KepDl0qeDwC+HTZBj9zMuhkGY6qaYmLnheyf82jWhjp
	 CYClB6qAt0sc9Rwu8we6SBOV3JLiDakY1VGsjcTxoqJh8gTlaPLqgf/W+xOf10KKEIqBD
	 SaPuPd58WvSUNuguKP8tPrxkrlkB/YOJf2nacvYigR3qZscZR7fnkbp2L7mRkmGP6Ilgz
	 Yxe5P04Tjs24/1qyiXaYP/n+5DmkOyhb5ZL+kMgiQ0d8HVcDGb9Mj5liAKqxe33GmWg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793696341;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=QJ9UD3j1pW2fYURqdT7DSwvvSglFpr3UgftmmRZbYoI=;
	b=mgbxAIYoGDux1u35jZS7qLGOv8RFnNjlgogvGtzafo1lXpJtW4cthMAyW5QoogCCRdcc
	 FToO7Y4qdt8t6vodDN5lPWU9W/TozVcrHYu1Cc0GErlSjotrx6HDQCMzYed6SbLls3eRH
	 60Kn9teME/lT3iyMVYUp6dYbXZxapUIOND8R8yLFRkx5jFj7HamDivsIE/KXH5DWC8rAv
	 CnLPJgahpp4Mdty2EXwNefnqpH8WTwVGp+HfB/Gc/O12AWTAldtwbRwpj/WQAM7tjM3H4
	 uxbo9FXXY2I5UAJH0u2B6ir61C5RNk55Cd7p5pzfIKHLMqbFy7OJt+DTo8aqUrKeYEw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bpe2h8g8;
	arc=none smtp.remote-ip=209.85.214.172
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE907606A324
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 08:59:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CE907606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bpe2h8g8
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2eb4a9a580eso4676065ad.3
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 00:59:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793696340; x=1794301140; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=QJ9UD3j1pW2fYURqdT7DSwvvSglFpr3UgftmmRZbYoI=;
        b=bpe2h8g86nOiHBcro9Ih8i+RodoxuZxwg3cSZSur2eOr1X9Ya7gBdgad936dNdue9p
         H9GSjKdGDIV2CC/MEF+GpBMrzRRLaf5ZvxJmfwxUuKBrlojmyPrKwNWETBkT+nlhZcF5
         nqo/jR+5+Dsv3Sr2H2/FTh4Kk7uzWRHgNHl/G3mHehiQgcS/7tUeuPAVbmmUQVhjNOzN
         PRFtPJ0V+nXMOjOzk+L6HEIqEls8lDb6tifeJZveHIg2BdOz9kh+OZrq9fLIQSRUWNTe
         LafRZqzvv1QYW1jJt6FBKN+6Fg7TvDYLngI6DDtF2wy3CbtMV36zijdQ1OmeDmbmPunb
         hwkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793696340; x=1794301140;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QJ9UD3j1pW2fYURqdT7DSwvvSglFpr3UgftmmRZbYoI=;
        b=GtqyqwbZ2l2M2JEzkOGL+HjiLi5duc8OpSZbisl+iW6G/lafQ2nyi7NtwSSZ9bEXLS
         3XOarvzn3DlANRLCmdqY5XJGvge7SLFPKKbVIqSJzJY3fNdc7eakweQRxfRhlpOPFCPZ
         kD0jGNu6qlKhI48o8JALJwt56k6EuV+s1wR1zKptYWl6EnYfQJr2IqWtm7cacGIo9XE5
         ouQ4AZq4vg8QQ2gYwj0t+ZGga6F8tbYdKN5lG/gK4AeMyxeJZ6aYPJPG5R/K9JHgN5qi
         pouEHJ32+oU0iYHp+DybDiA/F1HQytXR/HxHo/v5RrRtvYj7VQCKyae0vfLI9zclmw1p
         d3rw==
X-Forwarded-Encrypted: i=1; AKwUvBzAHFEUjI9Me/WKDvp3gOt84zbIzbPYP43JeEBHFauIxOc1Kjg4v2AQPjbPAfTq/WIPr7qXvtF4/jM8yrg=@vger.kernel.org
X-Gm-Message-State: APuU4Z96GSfMo544L7/Eq8Idae6lSyfAQtaNR9zDiW64xEGDwNL/8x0P
	pap5njpD62kJov0/ByEai0E56jEgE3aBc5XQIjh3rV/Z0X8gCL74B3WT
X-Gm-Gg: AYBFou3UlA8qzvVmiwMYtWOgjNg5uEjEWispCL+SxeXf63TdVJxlCL2RX+yHZ3/XFR6
	PBuhX9n/1LUJY0o6v32/5wHo77jeCeT1RNatjAtZ/++xgJ1RcCWXYgBXCNUojEAbcif57p/jJa4
	s2W1YAlLPDlEJ2sH+L9aCZ1tpXfiTpN6BHGxt2CIA2+NLd8S7Rz1F0TbArHwiNR7ULT/K/1ips8
	dUOvRd+4CKeBHT22eDdqNefDQFHQuBCsYyIXNTV55xYWkQm+UlRHqhTH6N23Kdb4xKs/c20l9by
	i9J6hJcCIM7MOHevDO11/jJoOMGOOz1nb9HgM7ALAP3kXEu5LZUfT9DDjMv0MR7vEx9y9PO+abQ
	Y7AZhMze7TAlly40rglOPUjkMeyH6iMPfiGtC9H9/i2Jb9w2pfdhaLzg7qxvNXORXrVI+Vhbl2b
	F//6svMvS+dYDOEC0CVlGqU3E9dzaru3x+gTHujbyLX3fd/TxZ+ZQHMp6WW2EGu9PPdDakFd1A1
	TZs1j6+mIbFRUPITqP0KlzbLbbMBLyVfDMYJenzhHgmN/xNQN31Ycpc9BSc0zbvpy/wQ7uZ74cL
	BRtw3i0i3L5h4ZvigbQHm8Cpp6gLkNytF1ZdL8opYI6NFUR0P1UrXhNU5Ccd43EDmVgo9+mnfC3
	UECH3zm0TQHiXwzZMaonTAC1DVWg4mxjuOw==
X-Received: by 2002:a17:90b:1652:b0:3ac:a7ee:6785 with SMTP id 98e67ed59e1d1-3ae895a0406mr17203844a91.1.1793696340127;
        Tue, 03 Nov 2026 00:59:00 -0800 (PST)
Received: from chenyou.. ([140.116.39.229])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b07c6740a1sm3345662a91.10.2026.11.03.00.58.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 00:58:59 -0800 (PST)
From: Chen-Yu Yeh <chenyou910331@gmail.com>
To: Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Inochi Amaoto <inochiama@gmail.com>,
	Chen Wang <chen.wang@linux.dev>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Hiago De Franco <hfranco@baylibre.com>,
	linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	sophgo@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Chen-Yu Yeh <chenyou910331@gmail.com>
Subject: [PATCH 0/3] phy: sophgo: Add USB role switch for CV18XX/SG200X
Date: Tue,  3 Nov 2026 16:58:44 +0800
Message-ID: <20261103085847.338613-1-chenyou910331@gmail.com>
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

This makes one DTB work as both USB host and USB device on the Milk-V
Duo 256M, following the discussion in the thread "Milk-V Duo 256M: USB
peripheral mode works on mainline, how should dr_mode be handled?" on
the sophgo list. There, Inochi pointed out that a dual-role switch is the
right way and that the default should match the vendor image.

The usb-role-switch support in dwc2 hangs on this SoC. It clears B-valid
through the GOTGCTL session overrides while VBUS is present, and
GOTGINT.SesEndDet then fires back to back. The vendor kernel writes only
the ID override in the top syscon and lets dwc2 follow the Connector ID
change, and this works on mainline too, without any change to dwc2. So
the role switch lives in the PHY driver, which already owns those bits.

Test setup
==========

Milk-V Duo 256M, vendor buildroot rootfs, loaded by hand from U-Boot.
Tree: v7.3-rc5 with these changes, CONFIG_USB_DWC2_DUAL_ROLE=y,
CONFIG_USB_ETH=y. The series itself is based on current master; the files
touched by patches 1 and 2 are the same in both trees.

Tests 1 to 3 ran with CONFIG_USB_DWC2_DEBUG=y and the DT properties
applied through an overlay. Test 4 ran with debug disabled and the
board DTS from patch 3.

In the logs below, 
R=/sys/class/usb_role/3000000.syscon:phy@48-role-switch

1. Default peripheral, bare board on a PC, nothing done after boot
------------------------------------------------------------------

  # ls /sys/class/usb_role/
  3000000.syscon:phy@48-role-switch
  # cat $R/role
  device
  # devmem 0x03000048 32
  0x000003C0
  # cat /sys/class/udc/*/state
  configured

  PC$ lsusb | grep 0525
  Bus 003 Device 009: ID 0525:a4a2 Netchip Technology, Inc. Linux-USB Ethernet/RNDIS Gadget

2. Switching at runtime, same setup
-----------------------------------

  # echo host > $R/role
  # cat $R/role
  host
  # devmem 0x03000048 32
  0x00000142
  # echo device > $R/role
  # cat $R/role
  device
  # devmem 0x03000048 32
  0x000003C0
  # cat /sys/class/udc/*/state
  configured

The switch was repeated without an interrupt storm, then:

  # echo none > $R/role
  # cat $R/role
  device
  # devmem 0x03000048 32
  0x000003C0

3. Default host, on the USB & Ethernet IO board, nothing done after boot
------------------------------------------------------------------------

Only role-switch-default-mode differs from patch 3 here.

  [    3.409672] usb 1-1: new high-speed USB device number 2 using dwc2
  [    3.666655] hub 1-1:1.0: 4 ports detected
  [   72.484979] usb 1-1.1: new high-speed USB device number 3 using dwc2
  [   74.804484]  sda: sda1 sda2 sda3 sda4

The USB stick was plugged in by hand at about 72 s.

  # cat $R/role
  host
  # devmem 0x03000048 32
  0x00000142
  # devmem 0x04340018 32
  0xF300081E
  # devmem 0x04340440 32
  0x00001005
  # echo none > $R/role
  # cat $R/role
  host
  # ls /dev/sd*
  /dev/sda  /dev/sda1  /dev/sda2  /dev/sda3  /dev/sda4

4. Patch 3 as committed, debug disabled
---------------------------------------

Bare board on a PC, nothing done after boot:

  # cat $R/role
  device

  PC: usb 3-9: New USB device found, idVendor=0525, idProduct=a4a2
  PC: usb 3-9: Product: RNDIS/Ethernet Gadget

On the IO board, with a USB stick already plugged in at boot:

  # cat $R/role
  device
  # echo host > $R/role
  # cat $R/role
  host
  # dmesg | grep -E 'usb 1-1'
  [  415.464739] usb 1-1: new high-speed USB device number 2 using dwc2
  [  415.940738] usb 1-1.1: new high-speed USB device number 3 using dwc2

Before this series
==================

With usb-role-switch on the dwc2 node, "echo host" hangs the board in the
SesEndDet storm, and so does boot without role-switch-default-mode.

With dr_mode = "otg" and no role switch, writing the ID override by hand
worked:

  devmem 0x03000048 32 0x3C0  -> high-speed RNDIS gadget on the PC
  devmem 0x03000048 32 0x142  -> disconnects from the PC, host side starts

Three round trips were all correct, and ping over usb0 afterwards was
5/5. On the IO board, the hub and USB stick appeared after one toggle,
but not at boot, because usb_add_hcd() moved the PHY to host after dwc2
had already set up for device:

            at boot       after one toggle
  GINTSTS   0x05000023    0x04200021
  GINTMSK   0xd0bc3cd4    0xf300081e    (PrtInt masked -> unmasked)
  HPRT0     0x00021403    0x00001005    (ConnDet pending -> port enabled)

Test 3 above reaches the right-hand values at boot without a toggle.

Not tested
==========

 - A USB stick already plugged in at boot in the default host case.
 - Running on a master based tree: all tests used the v7.3-rc5 tree.
 - Boards other than the Duo 256M. Nothing changes on them, since the
   role switch is only registered when the PHY node has usb-role-switch.

Question
========

With patch 3, the hub on the IO board needs "echo host" after each boot.
Should the IO board overlay (sg2002-milkv-duo256m-eth.dtso) set
role-switch-default-mode = "host", or should it stay the same as the
vendor image?


Chen-Yu Yeh (3):
  dt-bindings: phy: sophgo,cv1800b-usb2-phy: Add USB role switch
    properties
  phy: sophgo: Add USB role switch support for CV18XX/SG200X
  riscv: dts: sophgo: sg2002-milkv-duo256m: Enable USB role switch

 .../bindings/phy/sophgo,cv1800b-usb2-phy.yaml |  11 ++
 .../boot/dts/sophgo/sg2002-milkv-duo256m.dts  |   7 +-
 drivers/phy/sophgo/Kconfig                    |   2 +
 drivers/phy/sophgo/phy-cv1800-usb2.c          | 107 ++++++++++++++++--
 4 files changed, 119 insertions(+), 8 deletions(-)


base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
-- 
2.43.0

