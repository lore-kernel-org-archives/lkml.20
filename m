Received: from mail-ej2-f43.google.com (mail-ej2-f43.google.com [74.125.228.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33BD9501F25
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 22:08:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790633316; cv=none; b=gWcQ6e920sziAoHHQsALTOGauuxNWlc7ukjfAoIwjVTdvYXzsfYy+l2iL8mtWKiN6uWF2YQVkMJAKyeoMtlNv2tcrogMmFCcJcV0+4Jg8YMRwrBYIG43QA5zfI5jCKS0ZXcWFzm9o1tPhOFJTmQeNTW6Iift4pbMQunAWhrigwY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790633316; c=relaxed/simple;
	bh=x+hWyRoyhHhbspYBDjpmI6qUB3yfCUUjCZlGN/fhFa4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=MBZWfNrZrXdItjj4kbDMSYNx2ZB5olp54E0+Sn2WNTVddHXt2d49hgkUbJ0odvjdgJKbEymfdZblEP0zDDSHS0p4e/pgn2FeRa73RO5tM2se9QfRsnDd3aiPaN1Qw+pEEhzHu4uzZ+41VyUCeAU6TQ1Ba0Kej1JKEhl11wY69ME=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=l9ko8ozC; arc=none smtp.client-ip=74.125.228.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="l9ko8ozC"
Received: by mail-ej2-f43.google.com with SMTP id a640c23a62f3a-c2af3a4f193so385238466b.3
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 15:08:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790633311; x=1791238111; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=UYwPqqXGdVDSD+JHw7yX4svUwm+9ZLe0XAdsXLTCAek=;
        b=l9ko8ozCfegx1zaOMZfDrxOMKT0kG8AMNaoK4PlZqVSL1pqFRbrOkXicnwszzUeZ1K
         D12f55Hv9Z6pxZNSsS4ZWeKaUQuqHD8/UR/SOMhzLZ5/rjihkPfM0bVu/YrjvTy0F4yN
         ka3IwmLUAwPwKhRvuEHBa+8vvP+U7i9jedXwtb0Vi4ZAjWst3jtUdtadGpQjZj3Ps7KI
         NmqxG57hI94ViK4zkoGMVLW/ZEDzWeDtdoHuWbOWIw2ZMCmhYmntG3FduYYP4Q+znV/t
         K1qNZ1DK5HNl9GLTJstIWnub516mNlBnLxI6ZGe4NSKEOAp//JUGlS9GbloIBILBKPbQ
         aKrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790633311; x=1791238111;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UYwPqqXGdVDSD+JHw7yX4svUwm+9ZLe0XAdsXLTCAek=;
        b=WWbPMADgKtaeq/pSQJITTMinwm9h+Sdwp0xgQMtusSU9TvIZDmfw+Rt+EYQZGohp0u
         IF1oQlhvrZZszwBg1GG6K64ggayvQL3GIThjNSC0eYZAfKSXTJJ2AN900hSRFzUkSjEi
         Vrk6FnTCA4bpUrl4iHqnlH7lW/iskDhP7yFWPQ1jKEc9Ce3UpLf3q1DamT3OiHKdehW4
         1XhyHkaCFyo7ciHM+D3Sibfz6hr5BYXBEunEAXqJxJdZn364AvFSaxF+DS2We/XJbw4b
         XL23Lru4vI1jfin4kT34OlRCjsW9B2fohpk8wU1wbzz0ZMSofr9pchN19C+r/sso8RuH
         KHQg==
X-Forwarded-Encrypted: i=1; AKwUvBwf4Mxxv2MDDtV46trMWxxu9wIjQ5A1qb9QzYPWJ22sov9zSDD3U+SsKVVEtkZ/1gKLh5bz4z/4CyJFDdQ=@vger.kernel.org
X-Gm-Message-State: AFuF++kBza77ikruGdtlhaazXMijZ8e4WRsRNEEuPUCBQNmXzr9999Vr
	h3GRa2g5Zd67Fz9p7ICYMxEF0qLNs/Xy4g/srp9GBuX3lm8FGKyf8oIs
X-Gm-Gg: AYBFou1gTPVXjgXmMtScQqS7JgeU1jPj1ykGAyHYhjZplYXNT/lzTNz6OHltVD24BcY
	/+jZ7ooyn4OgENoWYFq4d7BFIFhcv481yiaWzPMRB1AgcC9T4DaEj72ibBp8LS22uc4Goo8Qtuj
	fvmOR+hUew+YkhSrznch2m8g9eergYdBK1gO4/TLGfxx4cvWDiFjJwZ1wenHYEhI+YxMEidT/Pd
	2C3w2uGRD/oAySO4h4p2vuQrLXEX+flEFyZuPK+6oBZwjRsbP+8+AZKKzXzn4mxZvuVfGaeLhSS
	Q16+NXsW6ixx4KLyN6CIPEulGkkx8qaGmLV93rSKrjISPxsgAdKk9ZJfYOH5K+PelEZSdAEEo0L
	mCEEeVRsseNVco2vk5e3osk78skWTncfj3hXixH/jkh3kWYNUFsKPd6uNuxkODHDx0UjbCl3eqU
	Bb3Jq/mkrjD1MeM8YNU+IXrFjMaN1t9oiS/jkP9sTgQBpuPVkBKm6HnXk1fa9fihETDjrooPjVr
	uP8LPuUfNnzArkq4zsQc9Xkqvkm9oLWtkA1jolwD+EwC9qrBuQkS3T8
X-Received: by 2002:a17:907:a08c:b0:c29:4634:5c99 with SMTP id a640c23a62f3a-c2ac241d641mr1144931166b.4.1790633311274;
        Mon, 28 Sep 2026 15:08:31 -0700 (PDT)
Received: from localhost.localdomain ([2a00:801:793:68fd:c07a:9093:1956:b4bf])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2dbd3bcacfsm345002466b.74.2026.09.28.15.08.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 15:08:30 -0700 (PDT)
From: Yongzhao Chen <yongzhao.derek@gmail.com>
To: netdev@vger.kernel.org
Cc: "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Jonas Gorski <jonas.gorski@gmail.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Vladimir Oltean <olteanv@gmail.com>,
	Woojung Huh <woojung.huh@microchip.com>,
	UNGLinuxDriver@microchip.com,
	Russell King <linux@armlinux.org.uk>,
	linux-doc@vger.kernel.org,
	Christian Marangi <ansuelsmth@gmail.com>,
	linux-kernel@vger.kernel.org,
	Ziyang Huang <hzyitc@outlook.com>
Subject: [PATCH net-next v4 0/3] net: dsa: qca8k: add a QCA8337 CPU PHY consumer
Date: Tue, 29 Sep 2026 00:08:08 +0200
Message-ID: <20260928220811.1880-1-yongzhao.derek@gmail.com>
X-Mailer: git-send-email 2.45.2.windows.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series lets a QCA8337 use one of its internal PHYs (ports 1-5) as
the CPU port, with a PHY-to-PHY connection to the SoC's own PHY.

Patch 1 makes DSA pass get_phy_flags() to PHYs on CPU and DSA ports, so
that the internal CPU PHY receives the switch revision and gets the same
revision-specific initialization as the user ports. Patch 2 pauses
internal CPU ports as well as ports 0 and 6 during MTU changes and
serializes that sequence with reg_mutex. Patch 3 accepts an internal PHY
as the CPU port on QCA8337.

Changes since v3:
- Dropped v3 patches 4/5 and 5/5, which disabled SmartSpeed on internal
  CPU PHYs, and did not add the DT workaround property discussed in the
  v3 4/5 thread. The lost 1000BASE-T advertisement on the RA74 CPU link
  came from the IPQ5018 GE PHY's initialization order, not from the
  QCA8337. The IPQ5018 driver writes its analog settings (LDO, EEE, MSE,
  DAC) only in config_init() when the MAC attaches, about 38 s after
  PHY4 starts autonegotiating. Until then the IPQ5018 PHY negotiates with
  its reset defaults, 1000BASE-T does not come up, and SmartSpeed on
  both sides drops the 1000BASE-T advertisement. Nothing restores it on
  PHY4. On RA74, applying the settings at probe brought the CPU link up
  at 1 Gb/s with SmartSpeed left enabled. That fix is a separate net
  series:
    net: phy: qcom: at803x: Fix IPQ5018 short-cable DAC values
    net: phy: qcom: at803x: Apply IPQ5018 analog settings at probe
    <https://lore.kernel.org/netdev/20260928220717.939-1-yongzhao.derek@gmail.com/>
- Patch 1: removed the SmartSpeed reference from the commit message.
  The code is unchanged, so I kept Florian's Reviewed-by.
- Patch 3: the commit message no longer refers to an RFC. Internal CPU
  port selection is still limited to QCA8337; QCA8327 support has not
  been established. The code is unchanged.
- Patch 2 is unchanged.
- Posted as a regular patch series instead of an RFC.

Dependencies:
This series depends on the net series "[PATCH net v2 0/3] net: dsa:
qca8k: fix MDIO error handling" <https://lore.kernel.org/netdev/20260928220629.238-1-yongzhao.derek@gmail.com/>. It applies to
net-next without that series, but patch 2 aborts and restores the
paused ports only when register writes report MDIO failures, which
needs its first patch. Please take the net series first.

Brandon Mahdavi's multi-CPU RFC v2 [1] also replaces
qca8k_find_cpu_port() and restricts CPU ports to 0 and 6. It is not
merged. Whichever series lands second will need to handle the other's
CPU port selection.

Testing:
Each patch builds with W=1 for arm64 (drivers/net/dsa/qca, net/dsa,
drivers/net/phy/qcom, bcm_sf2, microchip) on the net-next base below
with the MDIO series, and checkpatch --strict is clean apart from
sign-offs.
The MTU/pause model test from v3 passes on patch 2 on top of the MDIO
series. A model test of patch 3 checks CPU port selection for every
CPU port mask on QCA8337 and QCA8327, and which ports count for the
MDIO bus choice. The code of all three patches is unchanged from v3.

On hardware, a Redmi AX5400 (IPQ5018 GE PHY to QCA8337 PHY4 as the CPU
port, plus port 6 as a second CPU port) was tested on OpenWrt's Linux
6.18.52 with a backport of all three patches, the MDIO series and the at803x
fixes, and no SmartSpeed change. OpenWrt's multi-CPU patches stay on
top and remove qca8k_find_cpu_port(), so on this board patch 3 only
contributes its MDIO scope change; its CPU port fallback is covered by
the model test only. The CPU link was verified at 1 Gb/s with SmartSpeed
enabled after a first boot, three reboots, a power-off cold boot, three
interface down/up cycles, three renegotiations and a network restart.
During a separate 10-minute observation, sampled link status remained
at 1 Gb/s with SmartSpeed enabled and no new CPU PHY link-down events
were logged. Raising a user port MTU to 1504 and back exercises patch
2's pause sequence. After each change, WAN HTTPS through CPU port 5
and SSH through CPU port 6 worked. Packet loss during the changes was
not measured. An MTU above the maximum was rejected. The switch
registers are not readable on that image, so MAX_FRAME_SIZE and the
MAC enable bits were not checked directly. There is no net-next boot
on this board, as it has no upstream DTS.

Thanks to Andrew Lunn for his detailed reviews of v3 4/5, and to Ziyang
Huang for the OpenWrt PHY-to-PHY CPU port code that patch 3 is based on
and for pointing me at the IPQ5018 DAC settings.

v3: https://lore.kernel.org/netdev/20260923215858.1653-1-yongzhao.derek@gmail.com/
v2: https://lore.kernel.org/netdev/20260922202653.1153-1-yongzhao.derek@gmail.com/
v1: https://lore.kernel.org/netdev/20260919085406.1395-1-yongzhao.derek@gmail.com/

[1] https://lore.kernel.org/netdev/20260802034701.3339052-1-brandon.mahdavi@mahcom.com/

Yongzhao Chen (2):
  net: dsa: pass PHY flags when connecting shared ports
  net: dsa: qca8k: serialize CPU MAC pause during MTU changes

Ziyang Huang (1):
  net: dsa: qca8k: support QCA8337 internal PHY CPU links

 Documentation/networking/dsa/dsa.rst |  2 +
 drivers/net/dsa/bcm_sf2.c            |  4 ++
 drivers/net/dsa/microchip/ksz8.c     |  4 ++
 drivers/net/dsa/qca/qca8k-8xxx.c     | 20 +++++--
 drivers/net/dsa/qca/qca8k-common.c   | 79 ++++++++++++++++++++++------
 net/dsa/port.c                       |  6 ++-
 6 files changed, 94 insertions(+), 21 deletions(-)


base-commit: 014d795c73837ea2339a4ea8e8f82c6e959b845d
prerequisite-patch-id: aad3a7fefa50cc4a8d29711256b182827e5b3bf2
prerequisite-patch-id: 92a623b4a20a1d2d516476558e3904d7a1c17b8f
prerequisite-patch-id: 2819bb7310717899a1fb577b9f4c71a6443a4340
-- 
2.43.0
