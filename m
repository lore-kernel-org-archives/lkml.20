Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DF81422523
	for <linux-kernel@vger.kernel.org>; Tue,  6 Oct 2026 12:47:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791290867; cv=none; b=l3xKjLCTTZd9EQMXPl2v5YPG3N7AZ4fpQFeebUk4+3EGen1T+OESOJdARHzqak8vKZeRWZUVvripANsZ32yDOLG330Lmyz8ZJDnX36PgJHaIFVKLzKgr+38QG9bd/3r3l8QfeDeCX3lZpzKSAAxVW3EmGgYm6cFRlaSNZKMxlaA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791290867; c=relaxed/simple;
	bh=VPRvLKFU/4JwdFlsA07KHBhbQlgqiomdzFmD+vs2G1A=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Jk+56N/zBmwy+Btntij2kC3IFNlB1leIQyPoqrqg0rEN+sM1yIKyKePUS0/b/H08Ku6v4XUOF/26aF2X1t/cmCY3y7XRWO+YaE8JJwW4DFxAxYd3KADzJHhfvzLor00ZXFXhz0QQZ6r7VFyVb1dXCgFpu0xhyYZqc6/kDfbL6+Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lex.la; spf=pass smtp.mailfrom=lex.la; dkim=pass (2048-bit key) header.d=lex.la header.i=@lex.la header.b=YfQP7rJI; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lex.la
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lex.la
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lex.la header.i=@lex.la header.b="YfQP7rJI"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-48c4be28b82so516011f8f.2
        for <linux-kernel@vger.kernel.org>; Tue, 06 Oct 2026 05:47:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=lex.la; s=google; t=1791290859; x=1791895659; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=RSZxsBu5RBEC02GI587QjIyYZwSuYrJWfwAAHFHFZ+o=;
        b=YfQP7rJIMXYsbwKecRHmA1Bsbmn+Y1Q9dK8wkyzDbvW3D+Je15WIn3dIjTibuCpcs8
         h30LhDpYadoK0Wl9lW7IfQJsrozHMf9LN7bNXY4YhllC6BWh0VBGMDLarbsukI7pgm57
         ZsvnEvhTiNFuQGWCG0neEekeZr0u3tB7vPun8XJeSMHM9BABwM3v8T5NEQwqFLA4Y+Ci
         n0rM2l5zfdoRhCiEDILGU/4l3SIMeIqOLKpF3UtNLTJVxTx1uYHA9PMkdliOX+z82no7
         4x/WNd8+ETD7pmsqSZu57paxDVMlVq4O2CGx4aG88Hd8T5CJpsRa6IEDVUClAd6WdnsE
         gvtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791290859; x=1791895659;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RSZxsBu5RBEC02GI587QjIyYZwSuYrJWfwAAHFHFZ+o=;
        b=BnddRaoEkh3tzROVB30gIXrRGjln8KHc/HIgoRRNR4dkte0GzbuMGo1NA0Gwug284Z
         NlDrpBPBdcGSjqCd0SeQV0K59yocd+koUfapLsyZN5O9BxhgYio7hCAPhDUMdAzEz4Fj
         SK1YxKmDuVFHo74iOpEFH5Jlmc/FYkYum6Ntlu6Ss0rx69VDeKzn55UmP9GlqhMPEMe/
         40XY8Ey4UCcxLxSUssBfC9bMbBBCPgqo4JzSQcmrdAMMstTVS/JymjR2dhZoM0KEi6Ix
         MZg0nxm2BGSOppGl17NB8ErMF2ioOSveVhdtqkDbtmbw9ZLl97lj3yH9FCwoU/i9lJzq
         AqBw==
X-Forwarded-Encrypted: i=1; AKwUvBwr3vIBGpCVsy0tWERgctT84tAQYmD9ErW8JAviYuNiubMaYN88xypqjo9SMH/j7xCmZAQtK+o+1Iqn8XA=@vger.kernel.org
X-Gm-Message-State: AFq9FYKXsooYYOzjd2WMXJGQhMppbNgJzxPbRwPPyVxQ3AyS2ss/usAy
	g2h39wiAPpnubl6IVd7J1DqOTYpkeHOL2tQOmzBa9ox0X13Q1re8o9am7WSYTBqym6Y=
X-Gm-Gg: AYBFou1OoCxzvsjuTMxP8xfRxVtR01t50JzDG+fpry7Bq+ScOTAj1qjm3L9z2uw1tg4
	Wm6Bp3TmeuP34H/2sV+HnCOc2+c3lFCTHKQveBBPwIAD/fpLZ/BXfz4DD6rzZ3+ne5jDN/f38hJ
	T8KTePhzL6SKmlHFSEWdzmkx/PQE6Z0Q+Y1GjWsirEUqDMgV7UvBFucgLvR4ow2okauEjzpI8OE
	MWEPKBn10klkuZSkGfGHhWSH627Q4yRWan/NZWIzyfzHebCrP3o27Q/4NhHzezVa/DACqu4ssRo
	4LgGheptp1G+hr4KxEMdcYbGUUi+o7cd8/8hPhrWQIfUsH/O2bbwPBZOEGRZpQgwNKbppUa+71o
	fYqGGOT7kfvxgEsnmfCB5LbQbhGK3dB0fhbUUOlu9TpFHSl7G1vvNnkUf3IT6lIKDsoEbuG2dRp
	snWrEXLJ28uFLY7170Hrl3TIb3GSS/+l4esYdeCy8ypBJf7m2WUA==
X-Received: by 2002:a05:6000:4915:b0:48b:4c8:7b08 with SMTP id ffacd0b85a97d-48c6d19d048mr2285274f8f.34.1791290857366;
        Tue, 06 Oct 2026 05:47:37 -0700 (PDT)
Received: from remote-01 ([84.17.55.224])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48c622b4685sm9722003f8f.41.2026.10.06.05.47.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2026 05:47:36 -0700 (PDT)
From: Aleksei Sviridkin <f@lex.la>
To: Russell King <linux@armlinux.org.uk>,
	Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Vladimir Oltean <olteanv@gmail.com>,
	netdev@vger.kernel.org
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Conor Dooley <conor@kernel.org>,
	Florian Fainelli <f.fainelli@gmail.com>,
	"Chester A. Unal" <chester.a.unal@arinc9.com>,
	Daniel Golle <daniel@makrotopia.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH net-next v6 0/3] net: phylink: wait for a PHY that probes after the MAC
Date: Tue,  6 Oct 2026 15:47:28 +0300
Message-ID: <20261006124731.1528963-1-f@lex.la>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On the Keenetic KN-1012 (MT7981B with an MT7531 switch), the Airoha
EN8811H behind lan4 has its PHY driver built as a module on the root
filesystem. The switch sets up its ports before that filesystem is
mounted, so the port is validated against the generic driver, fails its
phy-mode and stays dead for the uptime. DSA does not retry it.

Patch 1 lets the PHY node say so with needs-host-firmware. Patch 2 makes
phylink poll for such a PHY instead of giving up, for a MAC that opts
in. Patch 3 opts in DSA user ports of switch drivers that set a flag,
and sets it in mt7530.

The poller can still lose a race against an unbind of the PHY driver,
between its readiness check and the attach. That window is phylib's:
any phy_attach_direct() caller racing an unbind has it. The attach
guard series [1] closes it.

Tested on that board with the series backported to its OpenWrt 6.18
kernel, together with a940003f44e7 and 07d995873960 (the mt7530
.get_stats64 atomic-context fix). The kernel had lockdep and
DEBUG_ATOMIC_SLEEP on. Local debug parameters, not part of the series,
drove the error paths. They fail the connect after a successful attach,
ignore the opt-in, fail the generic attach of a PHY with no driver, and
add a sleep after the switch shutdown.

 - boot: the PHY driver loaded its firmware at 8.7 s. lan4 attached at
   26.3 s, when the port was brought up. Link up at 1 Gb/s.
 - port kept down for 10 s with the PHY driver bound: no poll and no
   attach. "ip link set lan4 up" attached it a second later.
 - opt-in ignored: the old behaviour, the generic driver took the PHY.
 - two injected failures: "failed to connect late PHY: -EIO" twice, a
   second apart, and the third attempt attached. Link up at 1 Gb/s.
 - failures that do not stop: four attempts and one "giving up". No
   poll after that, also not after a down/up.
 - four failed generic attaches with no driver bound: nothing logged as
   a failure and no retry spent. The port attached once the driver
   bound.
 - switch unbound while the poller waited: nothing oopsed.
 - reboot with a 3 s sleep after the switch shutdown: the poll ran
   every second up to the shutdown and not once in the sleep. On v5 the
   same test polled 3 times in the sleep.

No in-tree device tree sets needs-host-firmware yet. The board is
supported out of tree, in OpenWrt.

Changes in v6 (since v5):
https://lore.kernel.org/r/20261001130208.105558-1-f@lex.la/
 - Defer only in PHY mode and without an SFP cage. In-band, the PCS
   could bring the carrier up with no PHY attached. An SFP PHY could
   take the port while the wait is armed, and its removal dropped the
   wait.
 - Poll only while phylink is started. A port that is down attaches at
   its next up, and nothing touches the PHY after a switch shutdown.
 - A failed attach after the PHY driver went away no longer counts as a
   failed connect.
 - The patch 2 message no longer says that MACs connecting from
   ndo_open recover on the next open. They do not when the PHY driver
   loads while the generic one holds the PHY.
 - The dsa.h comment states the rule: .port_enable must not use its phy
   argument.

[1] https://lore.kernel.org/r/20261001130120.104628-1-f@lex.la/

Aleksei Sviridkin (3):
  dt-bindings: net: ethernet-phy: add needs-host-firmware
  net: phylink: wait for PHYs that are known to probe late
  net: dsa: let user ports wait for a PHY that probes late

 .../devicetree/bindings/net/ethernet-phy.yaml |   6 +
 drivers/net/dsa/mt7530.c                      |   1 +
 drivers/net/phy/phylink.c                     | 232 +++++++++++++++++-
 include/linux/phylink.h                       |   5 +
 include/net/dsa.h                             |   5 +
 net/dsa/user.c                                |   1 +
 6 files changed, 242 insertions(+), 8 deletions(-)


base-commit: 47a1446725732cd3996edf607e8739334bbf4d78
-- 
2.53.0

