Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A16A3A8722
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 08:05:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788336327; cv=none; b=soAGtTT9D4k3AkhCvN1c4+26iwa0e9XvpK50QW+TNOwLvY4mVOCq+tdxpVFOw0eD3dU29NZjAXlBA9DAYDbbnucGHv3TskvUA4uCJf4wkOX0UEwLRd/Pv7i1e9cWSu1wZZXulIulEwUj1eyK5Es8ZOr3pA7p5kH0/OC6pZQ2FIc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788336327; c=relaxed/simple;
	bh=bL/ConqBplm9zR+oBUNB/Av74itWWXQv9Z6EJMir7mg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=EMGhZlryOW5tmDTbBHhhvpFo9SD9yOpOOZ2jc6lBIAMAXedltxlkPk5JICraaQSeltl25nfVXUHGZ7EMaSk1Kq4QThX/pbCo3Pb7915t3YaBepRr6iXvt82DSPXKh9gObHR/ETCENRpghMBVF35xHoUSUfFapAgBZYadRNWLr0Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lex.la; spf=pass smtp.mailfrom=lex.la; dkim=pass (2048-bit key) header.d=lex.la header.i=@lex.la header.b=YlwTogtJ; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lex.la
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lex.la
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lex.la header.i=@lex.la header.b="YlwTogtJ"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-49cd9add88aso4374415e9.3
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 01:05:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=lex.la; s=google; t=1788336322; x=1788941122; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=aDeLBX9QBOTBJ5rFj/dwetIriA6+Uk+oY4WRGgHLJXU=;
        b=YlwTogtJnGBg+WcPgCVARYMd0TZJ+F8uvZh96XsYD5FSw20gH90sqVf27XQGLVAJ92
         o1nXNj4oWL38aDW8Es3qBijLnS74VNWO+5LhXXTg0LWnOK+A7mtJR5TUYydD3gq9fGMh
         8wgzt9db7s3Bt4kDN0wVQcXg50FzdZaShBFBW9rkSPdo0XHE9vBzXj9sYQGEKCY94bKo
         3REEGNCWUn5T14CpHq2+fdlXVEFNaY6Sm3PUVZVwV0/qbaJouh55DGHucTPQu+DVwEWB
         rWTpfA3t1GjbRW1U3FXn2ROzWXFa6+e+KqV3sjeq9bsUvp985apK0NX10kVRlcRkd0ev
         e8iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788336322; x=1788941122;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aDeLBX9QBOTBJ5rFj/dwetIriA6+Uk+oY4WRGgHLJXU=;
        b=V+xoSM2LlmKT1n0VrYAdy/NNbZRewOOw5VVrDUKXnQnx0hniEjjLS5YihlyNEP9dTd
         6rc72Pp2uRaK27Jpg6n+9PitVVTtubx9vVu8YfH3qU3LYama/3o798jFuo+wIE8qzBJl
         +4FeH8Yimr6CtvXHGlcqKyr5B1AyzD2KJf+ipaYf8uyeiC8KGQeXt+lVuWZ/Mo/hJMcb
         6OlZ07vdOMQ720Pd5hZMvg34hq8ojtPGxrzteETiBMeuRiLUXOMOTlLcTKRQTG5OJFYZ
         ALpfu/O5aB1ZppIRJdMMzdUcmnohQMxaj2HKZVotZJR1d61J45dooaCk16k68kHbZw1u
         /kjA==
X-Forwarded-Encrypted: i=1; AHgh+RpIBDu2Kkwh+QS8BDHro87C5On3FsaSCpnd/oOOVV8raaMuuw8021uZEq3FB/ir4X05c8fyHRDAErcRY/A=@vger.kernel.org
X-Gm-Message-State: AFuF++nIxJfuYyztOMwbZkkjhvzjQiVTVmcfByYpYUuXYRxLZcb1kyi6
	e0VihZ0rD2XToIP6KsKkmXCLeQhJW3OF7ETwcKFQD0AeNsrqJJj7D+tCboGO3nJtS88=
X-Gm-Gg: AR+sD11SJRRlD3ZXLqJB3FwXncHWHe4Er31GF6UmJgaYUvvwxU4vZOWCpYuy9RXEzpu
	qV8AE3fs5cmo9XPHVR7GKfTYBNFQQSmFtZsK2QNo+fGRQQcRlOxQ0HUduf5QCjyB2Qty3vSjC5r
	sPrGNhOnLAust2rD+rGwNGJCdgyf9DAPKe5I2tJWjF/Xt5FmQ50UyuV79JbOm8D3ziB+aYh343V
	kLA793S187PNldekPb6TTctNr5FgkLNvyGf4u80tjg5iQDn2GJ0RY5W5CSEola+bXK+u4/3OTy6
	NprBKSVZuyQLxWDrlzNP7f43oE3EQw9clKNVeCTNFOUH9JlHVQe6y8g9cHjjxXpb4NhkXSPMTGy
	ckWw9GG7/82B+M1JF8bRB3YPep6I0X8cBTzfi1t3ELlNw0Cl48nrnSIh6+nbI7vdJ4nMzMQxR14
	5/A8FxFxDtjSvKSIpkTBn9VbUlmvpA6NnfHymibekr9QWSNKkIUw==
X-Received: by 2002:a05:600c:4e93:b0:499:cd34:100d with SMTP id 5b1f17b1804b1-49ce57f5235mr48830435e9.7.1788336322158;
        Wed, 02 Sep 2026 01:05:22 -0700 (PDT)
Received: from remote-01 ([84.17.55.226])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ce309e418sm72781715e9.13.2026.09.02.01.05.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 01:05:21 -0700 (PDT)
From: Aleksei Sviridkin <f@lex.la>
To: chester.a.unal@arinc9.com,
	daniel@makrotopia.org,
	andrew@lunn.ch,
	olteanv@gmail.com,
	nbd@nbd.name,
	lorenzo@kernel.org,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	netdev@vger.kernel.org
Cc: linux@armlinux.org.uk,
	dqfext@gmail.com,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH net v4 0/2] net: restore EEE on MediaTek switches and SoC MACs
Date: Wed,  2 Sep 2026 08:05:17 +0000
Message-ID: <20260902080519.2211373-1-f@lex.la>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Both drivers fill in phylink_config.lpi_capabilities and
lpi_timer_default but never lpi_interfaces. phylink treats a MAC as
supporting managed EEE only when the tx_lpi methods are implemented and
BOTH bitmaps are non-empty, which phylink_create() decides once and for
all, so EEE has been off on every mt753x port and on every mtk_eth_soc
MAC that uses mtk_phylink_ops since the two commits named in the
Fixes: tags. Because the tx_lpi methods ARE implemented, phylink takes
the other branch and calls phy_disable_eee(), which fills
eee_disabled_modes - so userspace cannot enable EEE either.

On an MT7981B board with an MT7531 switch, before these patches:

  == lan1
  Cannot get EEE settings: Not supported
  == lan2
  Cannot get EEE settings: Not supported
  == lan3
  Cannot get EEE settings: Not supported
  == lan4
  Cannot get EEE settings: Not supported
  == wan
  Cannot get EEE settings: Not supported

lan1-3 are the MT7531 internal PHYs, lan4 is an EN8811H on switch port
5 whose MAC side runs 2500BASE-X rate matched to a 1 Gbps media link,
and wan is the mtk_eth_soc MAC with its directly attached 1 Gbps PHY -
so both drivers are covered.

Each patch fills lpi_interfaces from supported_interfaces and leaves
2.5 Gbps out of both bitmaps for now. LPI above 1 Gbps is unvalidated
rather than unsupported: both MACs fold 2.5 Gbps onto their 1 Gbps
speed encoding, so the 1 Gbps EEE force bit is what would govern it.
MediaTek's SDK driver sets the force bits for 100 Mbps and 1 Gbps only,
EEE signalling on 2500BASE-X is outside 802.3, and the 1 us unit of the
wakeup timers is undocumented at 2.5 times the port clock.

The SoC MAC patch fills lpi_interfaces only on SoCs carrying a new
MTK_GMAC_EEE capability. mtk_mac_enable_tx_lpi() programs wake-up times
taken from MT7531's reset values, and the capability marks the SoCs
where those have been measured to work: MT7981 for now. The others keep
today's behaviour, EEE unreachable from userspace, until someone with
the hardware confirms them.

Neither driver sets eee_enabled_default, so LPI stays off until
userspace asks for it with ethtool --set-eee. The EEE advertisement is
a different matter: phylink stops force-clearing it, so a PHY that
advertises EEE out of reset advertises it again and the link may
negotiate EEE, without this MAC asserting LPI. MT7531's internal PHYs
and EN7528 are the exceptions, for the reasons in patch 1. Devicetree
eee-broken-* marks act at the PHY level and keep working, so a board
that already distrusts its PHYs stays protected: OpenWrt marks all
modes broken on MT7621's internal PHYs.

The two patches are independent and touch different subsystems; they
are sent together because they are the same bug.

Targeted at net as a regression fix with an active userspace lockout;
can be retargeted at net-next if maintainers prefer.

Based on net-next at 91ec20351349. All three files touched are byte
identical in net/main and the series applies there unchanged.

After the series, all five ports report:

  EEE status: disabled
  Tx LPI: disabled
  Supported EEE link modes:  100baseT/Full
                             1000baseT/Full
  Advertised EEE link modes:  Not reported

No 2.5G mode is offered, which is the narrowed lpi_capabilities, and
nothing is advertised until userspace asks. On this board no PHY came
out of reset advertising EEE, so the case where the advertisement
returns once phylink stops clearing it is not exercised here.

Enabling it on lan1, whose partner advertises EEE at both speeds:

  # ethtool --set-eee lan1 eee on
  EEE status: enabled - active
  Advertised EEE link modes:  100baseT/Full 1000baseT/Full
  Link partner advertised EEE link modes:  100baseT/Full 1000baseT/Full

  # ethtool --set-eee lan1 eee on tx-lpi on
  EEE status: enabled - active
  Tx LPI: 30 (us)

With LPI armed, 30 parallel ICMPv6 streams of 1400-byte payload, 300
packets each one second apart - so every gap crosses the LPI threshold
and the link enters and leaves LPI thousands of times over 300 s - lost
nothing: 300/300 on every stream, tx and rx error counters unchanged,
carrier_changes unchanged, and no mac_enable_tx_lpi errors in dmesg.

On wan, cabled for this round to a partner that advertises EEE (a
BCM5720), the MT7981 GMAC's own LPI was exercised. With tx-lpi armed
the wan PHY's MMD 3.1 reads 0x0f44, Tx LPI indication set, so the MAC
is asserting LPI; it drops to 0x0044 with tx-lpi off and comes back
with it on. The same 30-stream test at 1 Gbps lost nothing over 9000
packets with the link cycling through LPI at every 1 s gap. At
100 Mbps the only losses were the first packet or two of some
streams, and those reproduce with EEE disabled on both ends:
neighbour discovery for 30 streams starting at once. The 17 and 36 that
mtk_mac_enable_tx_lpi() programs therefore hold on MT7981 against this
partner at both speeds. Its Tx LPI reads 1000 (us) against lan1's 30;
see the note below the scissors of patch 1.

lan4 keeps EEE disabled and never arms LPI, which is what dropping
2500BASE-X from lpi_interfaces is for. Forwarding through it was
lossless with no carrier change.

---
v4: patch 2: populate lpi_interfaces only on SoCs carrying a new
    MTK_GMAC_EEE capability, set for MT7981 after measuring its LPI
    exits; the other SoCs keep the current behaviour (Paolo Abeni).
    patch 1: lpi_capabilities is derived from mac_capabilities instead
    of asserting both speeds. Cover: the MT7981 GMAC LPI measurement.
    https://lore.kernel.org/netdev/20260827211652.63504-1-f@lex.la/
v3: both commit messages cut down to the Why, with the mechanism left
    to the diff and the detail below the scissors (Andrew Lunn); no
    code changes.
    https://lore.kernel.org/netdev/20260824024117.46154-1-f@lex.la/
v2: commit messages rewritten to carry the Why only, mechanism notes
    moved below the scissors (Andrew Lunn); comments and commit
    messages reworded so the 2.5 Gbps exclusion reads as unvalidated
    rather than impossible (Daniel Golle); no functional changes.
    https://lore.kernel.org/netdev/20260822195252.2934-1-f@lex.la/

Aleksei Sviridkin (2):
  net: dsa: mt7530: populate lpi_interfaces to fix EEE support
  net: ethernet: mtk_eth_soc: populate lpi_interfaces to fix EEE support

 drivers/net/dsa/mt7530.c                    | 25 +++++++++++++----
 drivers/net/ethernet/mediatek/mtk_eth_soc.c | 30 ++++++++++++++++++---
 drivers/net/ethernet/mediatek/mtk_eth_soc.h |  4 ++-
 3 files changed, 50 insertions(+), 9 deletions(-)

-- 
2.53.0

