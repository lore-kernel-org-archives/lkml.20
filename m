Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DE4F585991
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 15:57:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788883056; cv=none; b=tPvkNTHzHO2GYX9Cld4kr280Ymlr2pjSyNkvU/Mf2azfnvuRUxYiRn9krWRXTqHaj3VvGTq4vaczjrOsqpPgyWa0uaDFbNAvtIriG4Bcfa1Q3gP3OXuTK9A0hjQ3b9hcVAjw0eoGG/H5NMNLNRr7xUKbCq9StxsKUnqC/QM4hLw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788883056; c=relaxed/simple;
	bh=HBWvCAZsji+1twwZVNYuOelKJosbMRBfHiL92lNvrNo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=DTrfFh4ckXwTpgQQce3gqq+9r24OAY1R7q1rj0gc7OgM51ae3MiTi7rHmuS7vU1D7O6xgfKwNiHQUPvw2p/+qc77R7ltmRQtGCxvmSPAdNpT2BjtpoJcDYsO5Hz0gGMAvp9vu+SQF7a5CuBUjWm97X3G/scLeoJ0YbD5x/xNTbo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lex.la; spf=pass smtp.mailfrom=lex.la; dkim=pass (2048-bit key) header.d=lex.la header.i=@lex.la header.b=DFkQfJmb; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lex.la
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lex.la
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lex.la header.i=@lex.la header.b="DFkQfJmb"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-49ccfbe062eso46425015e9.3
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 08:57:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=lex.la; s=google; t=1788883051; x=1789487851; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=0nErCJukAez6AxOj7DnAFUW4AUJgwQIezqJ03VKNT4U=;
        b=DFkQfJmb7PH3Dm5r8mKqT0oCbPM/lGdVbfxtP5SEe/NLNkA6UnLJbO9uU8Gs9HZRdR
         a8ylJSfqoRHC1Rt1bP7dJM6zBfmYj5NkY/9bv0m1iTVPXC6SJY49myyiGwJyUKGt7B7V
         eE7OGnB6+hflcomFSTLeEI5URCcwvEz8Tm3jSLdtme+PTaC1I+Lw76766gGXrxu5ZTRP
         nG7sz6odTYvQXEDM2qFX1o9rwGFMJSIir70HnCacyauZRr1qvl0bRqvh8LISiMyznM+u
         HHp5iP8bxcqG0k+ttgObkpRZbFuu05KCGHp5QthzUhY6eoAtKddcfcv2L7Yxq9B0mMRx
         0C7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788883051; x=1789487851;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0nErCJukAez6AxOj7DnAFUW4AUJgwQIezqJ03VKNT4U=;
        b=gelzPPAhd+5YDnl/9yeb2mpmYawBTrvaOZnUR5Ug5F5t5Mj3aCl3DSFvcUsPNhLimq
         9lKoOrYtyhRlhAp8NdNQxyfceG78fXYESw9KO2UKF/Ob0mm6tKQnvpTLiT+OOokH3IzM
         ouNwCBQ4j3l9GXvKCnqboKA/F45oUM+dmZPn4GsVZr0BzWaZTwAB9l+b+UXWH+KyLYUf
         Nw0m9gAJp3AI3mOBets+dYq4Qj3T7vWKXMq/bfaUXTX+iKeMfA3Z6xE9geDR7QK9ZPyD
         DiUz02rJ/2tIgHD3T9miBx/WIAgXciXJdyNYmOFa64XuEC1QnILzvAqT1msk5adGt6Hn
         tK4Q==
X-Forwarded-Encrypted: i=1; AKwUvBxl7BQ6ANsYETspidW/IDqyp6nzoKqi+4+7j7Pe8Iim2ILKTf+IXZjEWLPfqhrLVGSNVfhs2G5AS0vH1zM=@vger.kernel.org
X-Gm-Message-State: AFuF++mm/V3g+WunzrL/w4UMEMSPInm2s8b2tcVMXCowOeQKWvrhC5rn
	pBZFJtDgAPW+7lQwLmGRVCqW2I/5M0Uf4gVWrMy6w1PT++kfXD9vNrexTmRenu4qLlU=
X-Gm-Gg: AYBFou1WqxWZu1xNundcZ9c8FEaf2tiKB0rYqrdV7Maau7Ew3bY3q6rcEXPpMNavbQR
	3tNHMJ/aKySTsDtop8dD8tRzBTbaLyVY4Tk19FeHb092PZA38rOlCUGT0yWUkd2iq7FMrr9fSv/
	IKEoBy4jY4h3vsormNjerFTUHSpI35Wjh75NTMkqXM2ozzQSm9YmQOpfg9XRWhPUjFCzwPApqnA
	B2b9ClMAj0OnfJf6d2yxzC1k06XNnfGZqJeTOYxqJF5QjfJoFbytSx1YIKR4WIdEVpzdrshUrJm
	QzZums3Y37IC5W9e6kMXdqEuaosdHeCwh8Kj2KVffMRRybAU8wNfYghz/g/4b9x2ySE09AKm7+f
	VHMJ7oOcCSfrHfdiUSgbJ4ECHIDhpel0ZDsfnytCZMHT9xj0V6yzk1OxruT3h2ZrfoVu70HEnkm
	2uLpYhZ2vNojWwJVR7YlmMfyog3ev4IWeNuT9J4WY=
X-Received: by 2002:a05:600c:4e49:b0:49c:fa20:cc05 with SMTP id 5b1f17b1804b1-49cfa20ccd2mr278520785e9.28.1788883051188;
        Tue, 08 Sep 2026 08:57:31 -0700 (PDT)
Received: from remote-01 ([84.17.55.227])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cf7703cefsm542370045e9.5.2026.09.08.08.57.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 08:57:30 -0700 (PDT)
From: Aleksei Sviridkin <f@lex.la>
To: linux@armlinux.org.uk,
	andrew@lunn.ch,
	andrew+netdev@lunn.ch,
	hkallweit1@gmail.com,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: conor@kernel.org,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Aleksei Sviridkin <f@lex.la>
Subject: [RFC PATCH net-next v2 0/2] net: phylink: wait for a PHY that probes after the MAC
Date: Tue,  8 Sep 2026 15:57:26 +0000
Message-ID: <20260908155729.4164814-1-f@lex.la>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

A PHY whose driver or firmware lives on a filesystem cannot be
connected when the MAC probes, because the files become readable long
after the MDIO bus was scanned. Today the port that names such a PHY is
dropped at probe and stays dead for the whole uptime, and nothing
retries it.

Let the PHY declare that with needs-host-firmware and poll for the
PHY instead of failing. Patch 1 adds the property, patch 2 does the
waiting.

This is one half of an RFC last posted whole as v2 [1]. The other half
describes the chip that drove it - the Airoha EN8811H, an MD32
microcontroller that answers a PHY ID from power-on and becomes a PHY
only once the host writes firmware into its volatile RAM - as an MDIO
device that owns the download and the reset line. The halves touch no
common file and go to different reviewers, so they are posted apart; the
other one is posted alongside this, and its v1 thread is at
https://lore.kernel.org/r/cover.1788711797.git.f@lex.la/
They are not alternatives: this half alone carries a board whose chip
answers its ID before firmware and whose PHY driver is a module, and the
other buys the cases that are not that - chips mute before firmware, a
built-in PHY driver whose probe fails once on missing files and is never
retried, and reset ownership. The last one matters here, and I say why
below.

The poller waits for a driver that has bound, not for a device that
exists, because the generic driver would otherwise
bind and cannot drive such a PHY. The test cannot be made to hold past
its own return: the device lock that would freeze it cannot be taken
under rtnl, and phy_attach_direct()'s own failure path takes it again.
What is caught instead is the outcome one step later, where the attach
bound the generic driver and returned success, and the poll puts that
back. The window before it, where phy_attach_direct() meets a NULL
phydev->drv, is open - see the questions at the end.

The connect returns 0 and not -ENODEV, because DSA reads
-ENODEV as permission to look for the PHY on the switch's internal MDIO
bus, which is the wrong device.

Waiting never gives up, since firmware or a module can arrive at any
time: a port with the property and no PHY polls at the 30 s ceiling for
the uptime, after one warning at the end of the first minute. A connect
that fails with the real driver bound stops there instead, for the
reason patch 2 gives. A port left in either state reports itself as
still waiting and nothing restarts it: DSA connects once, at port
setup, so an ifdown and ifup do not re-arm the poller - only unbinding
the switch driver does.

rtnl is taken with trylock so the poller never blocks on it, which
keeps it from parking a shared workqueue worker while another thread
holds rtnl. The attach lands within one poll interval of the PHY
becoming ready when rtnl is free; contention pushes it out by another
interval each time the trylock loses.

While the poll runs the port has no PHY, so it must not report the
MAC's own link modes as if they were the port's - that describes a link
that cannot come up, and ethtool would accept settings for it. The
pending path reports an empty set, stamps the unknown speed and duplex
over the ethtool core's zeroing, and refuses ksettings_set,
set_pauseparam and nway_reset. Reading pause parameters is left alone,
because it reports the configured request rather than a capability, and
the EEE calls already return -EOPNOTSUPP with no PHY attached.

Why not -EPROBE_DEFER and fw_devlink: there is no supplier link to wait
on. drivers/of/property.c parses no phy-handle, so fw_devlink never
builds one, and a deferral would park the MAC until something else
triggers the pending list - which need not coincide with the firmware
files appearing. Deferring the MAC's own probe is worse anyway: it
takes every port with it, including the one needed to mount the
filesystem that holds the firmware.

Cost in struct phylink: a delayed_work plus the fwnode, the connect
flags and the wait's own counters, appended at the end.

The flag sits on the PHY node, because that is what it describes.
phylink resolves phy-handle to a fwnode before it needs the device, so
reading it from there costs nothing, and a PCS could carry its own the
same way.

The flag is also a request for a dedicated PHY driver: a PHY meant to
run on the generic driver must not carry it, or the wait never ends.

Tested on an MT7981B board (MT7531 switch, EN8811H on a 2500base-x
port), warm boots only - I have no remote way to cut power. The board
runs OpenWrt, so what booted is these patches backported onto its 6.18
tree, not the mailed text byte-for-byte. What the board showed:

 - the case this exists for, a PHY arriving while the port is already
   running: attach at 67.44 s, carrier at 71.93 s, and the PHY's
   interrupt fires without any port bounce. This needs [3]; without it
   the same path left the port dead
 - an ifdown/ifup cycle disconnects and reconnects cleanly
 - the stopped-port path, reached by booting with the firmware out of
   reach and putting the port down while the PHY cannot exist: the PHY
   attaches to the stopped port, sits there attached and carrier-less,
   and the later up starts it, with the link three seconds behind
 - the wait itself: one warning at 65 s naming the property and the
   missing PHY, then a 29.19 s gap between the PHY becoming usable and
   the poller noticing - the ceiling doing its job, where the initial
   one-second interval would have attached within a second

Not exercised: the retry after a failed connect, though nothing rules
it out. The validation route into it is closed on this chip, since the
EN8811H reports RATE_MATCH_PAUSE and phylink_validate_phy() then never
intersects the port's line-rate modes with the PHY's copper ones - but
any failure inside phy_attach_direct() reaches the same retry, and MDIO
accesses can fail. Neither is the lost-race branch, which needs an
unbind between the readiness test and the attach.

No in-tree device tree sets needs-host-firmware yet. The board I
tested is supported out of tree, in OpenWrt; the in-tree
mt7986a-bananapi-bpi-r3-mini carries the same chip and would be the
first candidate, but I have no such board to test the conversion on.

Two out-of-tree patches are needed, and only one of them is declared
below. Patch 1 of the pending pair [2] is applied on top of the base
and format-patch lists it as a prerequisite: a late bringup failure has
to leave pl->phydev clear, or every retry hits -EBUSY. The other, [3],
is a fix now on the list for net and is not in this mbox at all - a
forced major configuration can run over an uninitialised link_state,
and this poller reaches it on a port that is already up when the PHY
arrives, because the attach reports the not-yet-started PHY as down and
the resolve then takes the link-failed branch. Applying the mbox alone
gets the first and not the second.

System sleep is worth naming even though this half does not touch it.
On the shape this half targets alone - the PHY node owns reset-gpios
and the PHY driver downloads in .probe() - a suspend that cuts power
wipes the firmware, the PHY's own resume writes into a dead chip, and
this poller offers nothing: it only runs while no PHY is attached, and
after a resume one still is. The other half's MCU driver reloads the
firmware there, which is one more thing the phylink half does not buy
on its own.

The poller repeats the sequence phylink_fwnode_phy_connect() runs -
choose the interface, attach, bring up, detach on failure - with a
different point at which the reference is dropped. A shared helper is
the obvious ask and I have not written one; say if you want it before
the rest.

What I am asking:

 1. phylink_phy_is_usable() cannot stay true past its own return. An
    unbind between it and the attach leaves phy_attach_direct() reading
    a NULL phydev->drv, and the device lock that would close it cannot
    be taken under rtnl. A guard inside phy_attach_direct(), or the bus
    notifier this poll was always meant to become? The exact edge
    exists - BUS_NOTIFY_BOUND_DRIVER fires from driver_bound() after
    phy_probe() has set PHY_READY - so the follow-up is a notifier plus
    a one-shot work item. Polling first was the plan agreed in [4]; say
    if you want the notifier in this series instead.

 2. A connect that fails with the real driver bound is not retried.
    That is a policy borrowed from this chip: the failure path ends in
    phy_detach(), which asserts a PHY-node reset line, and firmware
    that lives in RAM does not survive it, so a retry loop would erase
    it once a cycle for the uptime. For any other late PHY the same
    rule turns a transient MDIO error into a port that is dead until
    the switch driver is rebound. Retry, stop, or retry unless the PHY
    node owns reset-gpios? And should the property be refused outright
    on such a node, so the board learns at boot that it converted to
    the wrong shape?

Changes since v1:

 - the flag moved from the controller node to the PHY node and lost the
   phy- prefix that named the entity it pointed at, so it is now
   needs-host-firmware on the PHY. Conor Dooley asked for this and the
   v1 cover had offered it as question 2, which is therefore gone.
 - phylink reads it from the phy-handle target rather than from the
   port.
 - v1: https://lore.kernel.org/r/cover.1788711837.git.f@lex.la/

[1] https://lore.kernel.org/r/cover.1788548229.git.f@lex.la/
[2] https://lore.kernel.org/netdev/20260902080511.2211261-1-f@lex.la/
[3] https://lore.kernel.org/netdev/20260904185540.2844261-1-f@lex.la/
[4] https://lore.kernel.org/netdev/a230d199-5d4d-4637-aff3-e725a37e1da1@lunn.ch/

Aleksei Sviridkin (2):
  dt-bindings: net: ethernet-phy: add needs-host-firmware
  net: phylink: wait for PHYs that are known to probe late

 .../devicetree/bindings/net/ethernet-phy.yaml |   8 +
 drivers/net/phy/phylink.c                     | 210 +++++++++++++++++-
 2 files changed, 211 insertions(+), 7 deletions(-)


base-commit: ab217fbb9b2169ce677b09a66558d5c3adcfbb76
prerequisite-patch-id: 293623f600b825505376e5c5bf72df2ac1f58e1e
-- 
2.53.0

