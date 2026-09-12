Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40CA147CC8A
	for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 13:04:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789218281; cv=none; b=X3itk6W+PfOdTq8n2acXtac30QM7ezz7jcHrGWecLon1QsZ3HTOLGeuURkHT4P9WUOx8gz7jxZuDa3Nqyhk/fIMBbtmWQhUWzcEMYqcrWl5H5VV3RUEzdA5dAazt5T/ZDxWbpYI6gTACpWPFVDJv2bofC8495n/tM1WAMieimz4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789218281; c=relaxed/simple;
	bh=lrJDZYIesz5lfa3S1SNxpOdY8ktjqo7PFji8Pr9jH20=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=QvYiw/KYNAvZjQdATHT0eXrpZUuNJyNOW9+1U03aDb3mm22cS+ostWr9028qtbJ8aigLodVQFynu1zk2zWC3G8NGkSINUeZJFHrMy6Eqr8XKCdoBN4ksjlAkh+1rtTO5HfBQuiPfHIQVaa5dBP6v/8KJIJsbcK39t4lm7EgQZjE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lex.la; spf=pass smtp.mailfrom=lex.la; dkim=pass (2048-bit key) header.d=lex.la header.i=@lex.la header.b=CTSKV41j; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lex.la
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lex.la
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lex.la header.i=@lex.la header.b="CTSKV41j"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-4858bc96fabso329168f8f.3
        for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 06:04:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=lex.la; s=google; t=1789218276; x=1789823076; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=M9Wf4msTC5//vRbQpoM2ZlYbsILyRTETawQ26GHJe0Y=;
        b=CTSKV41j4DkW/BHwDXM7O9yzjY8cc3jddw+sHbk2sd/QQB41UrfOKiQvprxQF5HfaJ
         /GcPcJ90bGF8OA5vKzJC60rAm4sK77UMNGiMCndLL6nvIoaN780NtRC/zGn7EMMuFcT7
         fvp1Ua1zgDEjb7ZC6CvkmjD47TIVFqY+tfRElyB0Ymcc/kZaBc6/KdIjF1EniNz/1UeD
         8Jsfr9kS15VhYshgD4QY9Dr2A0FpxRfVjmEGRHH/4K1pk7jUatQ8KgGxi+2/uytVGDiQ
         2E8C6VkNEwKMt0YUtMZoqnEQzelASiH7PN7f9epk02oLAbMcjno/I6b5FCULGVR1x8HW
         WrSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789218276; x=1789823076;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=M9Wf4msTC5//vRbQpoM2ZlYbsILyRTETawQ26GHJe0Y=;
        b=VbZvoJw8V3ddXS6s9611FT61JSxdamwzB1MSPoipoSgA8+PXMdSerM1oDKKPeiNt2p
         H65HLsKoqjR6nTJZZnTeCLsvfQUiG79V+jZ/F/GIS9jIXSZsqd26XymTIiVYXF82GrDE
         s+ezp6PaPVb9DkVn5IMP+paH+7lAn7drlieZeRoAewXxxloZisEWDgN/YUPP6TGb2g8g
         2AYz9JnYh6FyezYQSNAx+P5ge7OGgjTnPYY0EhJvLWKO7v5aNygUwCwjKRHZtXwGTAxI
         Nyh7/JR30eb1P5Z1YxbbcXTnTQ6JyjJCwhCZCwk9mqmaoaDGrgI31KDjSw0Z7RYJvI9h
         rgAw==
X-Forwarded-Encrypted: i=1; AKwUvBwQrwHxcnr5suW23+nkhzu89NoQmTqTomLZCHsE8l5tjJQm8dfsJWhsaIYA1nRlFkCawfUUgHJkSsucpTc=@vger.kernel.org
X-Gm-Message-State: AFuF++liaqW8oLOO3OJhKARJgOMNSBKyrijRrSxEyPjtKFerGCrjOz37
	1voYmfBDYZ7RoE6p59yweRria+d/5OpXeV4aX3y/9HThkQosgkBWEDQOfdU2QCxqkYjeiBJBfxr
	YnYnkMHrejMskOaA=
X-Gm-Gg: AYBFou3o5pilnalG0ilMK1CLRcC7Yx00nDxLY8ZNROh9v4DhQi0ZGG8gaTosXo2UJ33
	UQA+ShtghRsxxNsEB7lbHmaPCX+pNkQ6/tr/wT2Dy2UyrIc4O7fsKD0Ct7qlQ6SL9r/tOVOEQRz
	VQ8nk2cNVuizyEmT4eKIHlS1YMBvqWeU7zFxXGhtvM6WZgsfufwN1EA2dIsygDhuwYZu1EespGk
	I0qgXvCd9ExztBsGTyFWX/byrdGjigkgXTUZDon5MCj5ixjD5QDhFpa5JpxGq64TN7/fkMidbt6
	GAvfClz1BBfE2D27KQ5CDrq8/nYAmoOIkABpC1oe4jhCXMo5wNkhibvUFIqKERhZ+c6U76Vrm9j
	ydASexXvkR1T32mCQ/sWwpPhF2HDFtebAfSV4ZwTk3n1+odILBYk1CkpBS2DzWK5TBvulYdY+dB
	94yJokuIeS7jwhvlkEzho/JfBjLENkceOANefEebA/OCRQggT0oQ==
X-Received: by 2002:a05:600c:19c9:b0:49e:6c9b:4e94 with SMTP id 5b1f17b1804b1-49e6cc11409mr23637875e9.28.1789218276314;
        Sat, 12 Sep 2026 06:04:36 -0700 (PDT)
Received: from remote-01 ([84.17.55.229])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e6a06cfb8sm80985785e9.5.2026.09.12.06.04.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Sep 2026 06:04:35 -0700 (PDT)
From: Aleksei Sviridkin <f@lex.la>
To: andrew@lunn.ch,
	andrew+netdev@lunn.ch,
	hkallweit1@gmail.com,
	linux@armlinux.org.uk,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: ericwouds@gmail.com,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Aleksei Sviridkin <f@lex.la>
Subject: [RFC PATCH net-next v3 0/6] net: mdio: an MDIO device driver for the Airoha EN8811H
Date: Sat, 12 Sep 2026 16:04:24 +0300
Message-ID: <20260912130430.2246285-1-f@lex.la>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Last version, not for application, sorry for the noise. The other
option was to drop this quietly. I would rather have the reviewed state
on lore for whoever has a board that needs it; I don't.

The board it was written for does not need it. With the EN8811H
described the ordinary way, the phylink half [1] carries the port: the
PHY driver is a module that arrives after the switch has probed, and
the firmware sits on the squashfs, readable by the time the module
loads.

The second reason v2 [2] gave, a PHY node whose detach wipes the loaded
image, is wrong. I tried it: reset-gpios on the PHY node, the 10 ms
assert delay the Bananapi BPI-R3 Mini and OpenWrt One describe, a
switch unbind that reaches phy_detach(). The MD32 image stays. A marker
written into its RAM reads back unchanged, and the port comes back
after rebind. v2 states the opposite in two places.

What is left is the one-shot probe: -ENOENT at .probe() is not retried,
so a board whose firmware is not readable at that moment either loads
the driver after the filesystem or embeds 144 KB of blobs. That is the
case this driver is for, and I have no such board. Rather stop than
send code I cannot run.

For whoever searches for this later: in-tree the chip is on the
OpenWrt One (mt7981b-openwrt-one) and the Bananapi BPI-R3 Mini
(mt7986a-bananapi-bpi-r3-mini), both with the PHY on a MAC that
attaches at ifup, so neither is that board. Nothing
builds AIR_EN8811H_PHY in by default, so the case is a custom config
with the driver built in and the firmware on a filesystem mounted
later. Out of tree the chip also sits behind the MT7530 DSA bus on
EN7581, mdio-airoha on AN7583 and the SiFlower xgmac; a DSA port losing
a module that arrives late is what the phylink half is for. The
AN8811HB shares the download code touched here and I have none.

The series describes the chip as an MDIO device that owns the download
and the reset, and publishes the PHY on a child bus once the firmware
runs. Patch 4 leaves a running MD32 alone, so a board using the PHY
driver by itself keeps working as before.

Andrew, your points from v2 are answered in that thread. Two things
changed since. I said the next round would go without the RFC tag; it
keeps it, because this one is not for application. And the two
questions I left you there, whether to swap the Kconfig direction and
whether to add a MAINTAINERS record over both files, need no answer
now.

Tested on a Netcraze NC-1012, also sold as the Keenetic KN-1012
(MT7981B, EN8811H on a 2500base-x switch port), OpenWrt 6.18.44, the
series carried as target patches:

  - The MCU driver takes mdio-bus:0d, the PHY appears as mdio-bus:0d:0d
    from /soc/ethernet@15100000/mdio-bus/mcu@d/mdio/ethernet-phy@d,
    DSA attaches it to lan4 with irq=15, the interrupt fires, link up
    at 1Gbps. No bind or unbind in the driver's sysfs directory, rmmod
    of either module refused while the PHY is attached.
  - Download and late arrival, on an image with no firmware in the
    squashfs: the driver binds, publishes nothing, warns once at 61s of
    accumulated waiting naming both files and -ENOENT. Files copied in
    at 103s are taken on the next poll at 128s, the PHY is published,
    DSA attaches it with irq=15, link up at 160s.
  - A PHY node at an address the MCU does not answer: one error naming
    the node and both addresses, -EINVAL, no child bus.
  - Adoption of an already running MD32 has no hardware evidence. This
    board comes up needing firmware on every boot, warm or cold.

Changes since v2:
  - mdiodev_lock() helpers dropped, 7 patches became 6
  - wrong-address and empty-node checks moved into probe, so they fail
    once instead of on every retry
  - child bus lock taken once around the whole programming phase, the
    firmware read stays outside it
  - a failed bus registration keeps retrying on -EPROBE_DEFER
  - resume comment and commit text had the order backwards; the MCU
    resumes before the PHY
  - the detach-wipes-firmware reason is withdrawn

[1] https://lore.kernel.org/netdev/20260908155729.4164814-1-f@lex.la/
[2] https://lore.kernel.org/netdev/20260908155707.4164559-1-f@lex.la/

Aleksei Sviridkin (6):
  dt-bindings: net: add Airoha EN8811H PHY MCU
  net: phy: air: type the buckpbus core on the mdio device
  net: phy: air: move the EN8811H firmware download into the library
  net: phy: air: skip the download when the MD32 is already running
  net: mdio: add Airoha EN8811H MDIO device driver
  net: mdio: en8811h: add the nested bus

 .../bindings/net/airoha,en8811h-mcu.yaml      | 127 +++++
 MAINTAINERS                                   |   8 +
 drivers/net/mdio/Kconfig                      |  13 +
 drivers/net/mdio/Makefile                     |   1 +
 drivers/net/mdio/mdio-airoha-en8811h.c        | 378 +++++++++++++++
 drivers/net/phy/air_en8811h.c                 | 155 +-----
 drivers/net/phy/air_phy_lib.c                 | 440 ++++++++++++++++--
 drivers/net/phy/air_phy_lib.h                 |  27 ++
 include/linux/mdio/mdio-airoha-en8811h.h      |  29 ++
 9 files changed, 999 insertions(+), 179 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/net/airoha,en8811h-mcu.yaml
 create mode 100644 drivers/net/mdio/mdio-airoha-en8811h.c
 create mode 100644 include/linux/mdio/mdio-airoha-en8811h.h


base-commit: ab217fbb9b2169ce677b09a66558d5c3adcfbb76
-- 
2.53.0

