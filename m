Received: from mail-ej2-f19.google.com (mail-ej2-f19.google.com [74.125.228.147])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31773396D0D
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 21:59:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.147
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790200757; cv=none; b=LjHOrM5nrNehPBJSDytpxFKFqfCH5S5hm+HYoBSgU1S22UuZ8UILB3OQcebR1Ek9pS6NLu91qNQOIx10AoaAdQpq0HwVrVKEv1UItQEwMmj8HGOZJdyEIVHeFIAjGZyWAo8TEc2n0bZzS8oJzEt/kQEvHlOTZJhJjM7SI5qUH9E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790200757; c=relaxed/simple;
	bh=8RGeXtjXxObOBlh27DtryI+xEEeTDaHvX+2W2+vTgIQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=D2EdkBeB3lOL6aoyxl6FP3pLFflNFaVzZhOwf7xYEZGoR7FuflTMnmFQQfVQc2ZZYfRrQTzE2NiPcxSEuKiA9M9ZO1NVO8OnbK6xCk5gFdpCQ6AtxvoVPuzO1BkGCQrltzmA3xkMVeC75ZsFWsLTwDubL8+TGI+8RLK7xYWn2iA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OVaHzNiK; arc=none smtp.client-ip=74.125.228.147
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OVaHzNiK"
Received: by mail-ej2-f19.google.com with SMTP id a640c23a62f3a-c2940ff2313so93530166b.1
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 14:59:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790200753; x=1790805553; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=25b6rXxcvDVFluQ29z+eb44YMWbVsajT92YPOJsFwDw=;
        b=OVaHzNiKBqx/cr/Ll3JDJZ7dYL3Fn+7fMw4pizbJCd9e3P40Sj0XPMLtiS8YLUCxsf
         /9+X3fr5DoXx8vCjvQSK/L3M10gdbQe+dnXTCyNDIOxmnvfPBnpVLKmJSLuly1qDNlcl
         o1mZJav7Fm6NxxbCDbOVPWIaWv/P1sFvsLlEAayLut3ZyWi6kpWFaRWCCSh7FqaVcJum
         lihbTEfqe/g265nj6v38zxEuHNz7LLuTvES2CpLeo4JDKx+yc1r0U2hQA7aPdXsiruDA
         p05nESDNvkzAHiLJoo4I0m6ZxSl9YAAfDXfDexdWg2pyWkKCDHsmPZTTrGC7Jd2XxOsL
         1uHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790200753; x=1790805553;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=25b6rXxcvDVFluQ29z+eb44YMWbVsajT92YPOJsFwDw=;
        b=s5EVqvXz7pD1DN0eq+6hrmkkUUQKRR2R4Y8axazAEb10beVWns+r4Im5TlSq//wSBP
         qM9FtgqAkvHbvviHlYri8H+jU3MTB8s5LkSmn+kR0Ud4xsfj9CYLwWArpgUPy+8mTlR1
         ZbugN3HnsALhqct4mKq4BrcHwqSJSQ/qOb39Lohsa+o9P7M+5ERhpPzVdiimRO3DHZ/k
         pRQ7gRhlKWkOb2qvcVEQhU34d3CVhDtOk4EtT+zJ095kNevl//bEBvWZlAYnnEFqU2Jy
         Ph5zXQQK0PxfmsRNe/lyly4vW1aON4C0k5k8ZkA6n2oxAymwSNcbPtNdQZP8kszHMc5f
         WHnQ==
X-Forwarded-Encrypted: i=1; AKwUvBzWt52b25BfJ+YFOll+ETEOQ9AlycKP8xdcKOpW+zHb7q00R84MINt+FCklIKisDsM8OoLn5tJs1HT81s4=@vger.kernel.org
X-Gm-Message-State: AFuF++l+44m2hyPPmneJpKxu/EGp086C3dXS93Zeqmx/mGQ0R4dNlDth
	gwOdgZoWoxKGZXN91560BmFRaea+QQke9Gm74diSg9HaHTjBsFkUKkfB
X-Gm-Gg: AYBFou1ve5HWA0L8U6z95KRUjKuKuqY4i8IgTNZIAB6JXt/3DtIGykSh2n5L0rP/e5Z
	kezL5HPjq2yFM2OcP562FqPJq6mxZKxDD33foi02ksAKpSZ1xGB0z5Ewl/IFHFTtgDaqIncDRiq
	wuliROhxjlls17T8I42FNro5PDwA3ZggzerN8i+Yf5bHael/ArpJjSfG+fECP2p5HWhLOUq+wzp
	0l3b3Z1Avz8rcZjlNNsms5F5K85zCZeHNGFUB1xA9kfellY6KHWinRLcD8EzIPaBQ3PZFuL/Ytx
	5TxVmUmll0oH7yyfyyY81ZKhPZA7jdLlDXfODckzl8dDi+j6nJgWOjNmzzwIkm6QnnxNY/TLaDC
	wEdn61DXOifraQJBWNJmqT1LCMNZSvOD9uC/WMI9zoGg1nsCw/5SXcht3A4+DRbTM5t2PdlX+9g
	pHstXno5iwf3MFdpex5YkUZSlnRkODI9vJO4c7wGiqI5mbePejX12P6FcEoOnKfny2WWprXEJhF
	wQTDXObGG7xR/i/whae7cDqF6+xiY9KXNMep7rGm6Cjcp9nLSCMFXM93uMle5/bfREk2ZdLgfw1
	LVl3H9nuzVh1H5FE8thH
X-Received: by 2002:a17:907:6a11:b0:c25:f7db:4beb with SMTP id a640c23a62f3a-c2ac236053emr38359966b.17.1790200753378;
        Wed, 23 Sep 2026 14:59:13 -0700 (PDT)
Received: from localhost.localdomain (83-233-130-25.cust.bredband2.com. [83.233.130.25])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2aae6dcf0dsm197647666b.61.2026.09.23.14.59.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 14:59:12 -0700 (PDT)
From: Yongzhao Chen <yongzhao.derek@gmail.com>
To: netdev@vger.kernel.org
Cc: "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
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
	Christian Marangi <ansuelsmth@gmail.com>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	Ziyang Huang <hzyitc@outlook.com>
Subject: [RFC PATCH net-next v3 0/5] net: dsa: qca8k: add a QCA8337 CPU PHY consumer
Date: Wed, 23 Sep 2026 23:58:52 +0200
Message-ID: <20260923215858.1653-1-yongzhao.derek@gmail.com>
X-Mailer: git-send-email 2.45.2.windows.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The qca83xx PHY driver is already in net-next. This series allows
passing PHY flags on DSA shared ports and adds support for a QCA8337
internal CPU PHY. It implements CPU port selection, serializes MAC state
across global MTU updates, and proposes disabling SmartSpeed prior to
CPU PHY resets.

The first patch extends the DSA core interface; the qca8k patches
provide its concrete user. No board-name matching or board-specific DT
properties are introduced.

The minimal topology uses a single CPU link: a conduit PHY connects over
MDI to QCA8337 PHY4 on switch port 5, with each endpoint having its own
phy-handle. A reduced devicetree fixture based on Redmi AX5400 wiring
passed dtc and validation against the complete net-next schema set. This
is a binding fixture rather than a bootable board description. Because
the pinned base tree lacks the IPQ5018 Ethernet MAC driver and RA74
board support, this series has not been boot-tested on RA74 under pure
net-next.

On one RA74 board, diagnostic boot logs showed PHY4 advertising
1000BASE-T full duplex after generic config_aneg() succeeded, but a
later read found the advertisement missing. No intervening write was
found through the instrumented Clause 22 BMCR/CTRL1000 path; other paths
were not excluded. The exact trigger remains unknown. Clearing
SmartSpeed before the initial reset preserved the 1 Gb/s internal link
during the tested boot sequence. Runtime testing did not establish
late-peer causality, a broken pair, or successful fallback to 100 Mb/s.

Two scope questions remain for this RFC:

1. Internal CPU port selection currently falls back to ports 1 through 5
   only on QCA8337. Dedicated ports 0 and 6 retain priority on all
   models, including mixed CPU port descriptions. AR8327 documentation
   describes per-port headers and destination bitmaps, but I have not
   established its internal CPU link behavior. Should this fallback
   remain limited to QCA8337, or can maintainers confirm the same support
   for QCA8327?

2. The proposed SmartSpeed policy applies to QCA8337 internal CPU PHYs.
   SmartSpeed is the hardware downshift feature, so disabling it removes
   that fallback behavior. Current hardware evidence is limited to PHY4
   on a single RA74 board. Is the internal CPU link role sufficient
   justification for this policy, or should the quirk be scoped more
   narrowly?

Changes since v2:
- Patch 2 uses reg_mutex across the MTU pause, frame-size write, and
  state restoration. Variable declarations now follow reverse
  Christmas-tree order. This patch precedes topology support so MTU
  protection is in place when internal CPU ports become available.
- Patch 3 adds internal CPU port fallback while retaining port 0 and 6
  priority, leaving QCA8327 support as an explicit RFC question.
- Patch 4 masks the revision before setting the CPU PHY flag, clarifies
  SmartSpeed downshift behavior, and drops the delayed-conduit causal
  claim.
- Patch 5 clarifies reset and config_aneg ordering along with hardware
  evidence limits, keeping generic config_aneg.

This series depends on the separate net patch "net: dsa: qca8k:
propagate MDIO errors":
https://lore.kernel.org/netdev/20260923215748.1336-1-yongzhao.derek@gmail.com/

Testing:
Fault injection against the actual MDIO/PHY functions and kernel polling
macros covered busy-read errors, timeouts and successful transactions.
The old polling code reproduced false success on read error; the fixed
path blocked SmartSpeed writes and initial/resume resets. Tests with
mocked hardware also covered flag scope, CPU-port selection and
MDIO-to-MTU error handling.

The changed qca8k-8xxx.o built with W=1 for x86_64 and ARM64 under
allyesconfig and allmodconfig, with no compiler diagnostics. Unchanged
qca8k-common.o and MTU locking retain the earlier build and concurrency
test results. Hardware tests used downstream RA74 firmware. This
revision has no full kernel image/modules build, pure net-next RA74 boot
or hardware lockdep run.

Original RFC:
https://lore.kernel.org/netdev/20260919085406.1395-1-yongzhao.derek@gmail.com/

v2:
https://lore.kernel.org/netdev/20260922202653.1153-1-yongzhao.derek@gmail.com/

Base: net-next 8830e65ed46de41f849eefb8ba227d4852c460f6.
Local prerequisite: 3ba847ea54227f704ee3b04f95d4b52d4e22d483.

Yongzhao Chen (4):
  net: dsa: pass PHY flags when connecting shared ports
  net: dsa: qca8k: serialize CPU MAC pause during MTU changes
  net: dsa: qca8k: flag QCA8337 internal CPU PHYs for SmartSpeed
  net: phy: qca83xx: disable SmartSpeed before resetting CPU PHYs

Ziyang Huang (1):
  net: dsa: qca8k: support QCA8337 internal PHY CPU links

 Documentation/networking/dsa/dsa.rst |  2 +
 MAINTAINERS                          |  1 +
 drivers/net/dsa/bcm_sf2.c            |  4 ++
 drivers/net/dsa/microchip/ksz8.c     |  4 ++
 drivers/net/dsa/qca/qca8k-8xxx.c     | 39 +++++++++-----
 drivers/net/dsa/qca/qca8k-common.c   | 79 ++++++++++++++++++++++------
 drivers/net/phy/qcom/qca83xx.c       | 32 +++++++++--
 include/linux/qca83xx.h              | 11 ++++
 net/dsa/port.c                       |  6 ++-
 9 files changed, 145 insertions(+), 33 deletions(-)
 create mode 100644 include/linux/qca83xx.h

-- 
2.43.0

