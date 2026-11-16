Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=5.135.140.105
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794854048;
	b=YMtRKEIa1c6NQIwzfOu0u79mn42uyWd4Ql5q/VtgUfbO7tsK6+CPagBlcSsHkYRyT0Ln
	 RE+21evhJDXTUg/jAluyDCU7wmkouW83RmzmGZ9Cb7tFg6DTQ2IcZcYBazibnHNxM+I2R
	 QbL3JaHUm3hvUwyk0Jn+bZQ49rOje1Rx30LSsV/0gpqcK4RJrsnSjaMTODmrYa8BN2cxZ
	 CN16r68sqygdPWZUfoA39y+e8IrrqvpEymbgqBI9bpWfBneoHglrPBdYiuPyArM2zol/7
	 7PizhVFau8lbyxhsnDPAikrNaCo0225FkBm2WiDeevF2UrLYsxp6i10duZ/h6LGLPNQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794854048;
	h=DMARC-Filter:Received:DKIM-Signature:From:To:Cc:Subject:Date:
	 Message-Id:MIME-Version:Content-Transfer-Encoding:
	 X-Last-TLS-Session-Version;
	bh=B/3a5RONDuuZMGMV6Q0tQ9hy4n2J6HprX0jDPD3gb+8=;
	b=AiFoEk2qVVSS7twUis+IDOiwQQ5Gi/F0VhN/LwSzRkeufpWIAeLb3nMjdvVn/ia4XVRd
	 Dp0/1AmB3ty42jJufXipNQaFObjKtYeOWgXirHmaPJXKb6z8QWDMtw565xPo1vTg74l2p
	 K7Zx7AF/yxRBGO38ZQryl/DHRTZCW8KoPxLpiDCI+cMfVM+bSosIs3XCViprINbNViJ8D
	 juLdw2oj9XbAJBYgha0SBTu6ZA2PnY9ychBKhW8ZZqmJf0/QpttlPcrgqlda0npvc5Hto
	 NJa7qU5WgBZaIPU/2qz/dYiXBYscNM69Q3xRHu7JTgtl8bs9jhs4YpMCIHd8L+/U7yA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cjdns.fr;
	spf=pass smtp.mailfrom=cjdns.fr;
	dkim=pass header.d=cjdns.fr header.i=@cjdns.fr header.a=rsa-sha256 header.s=dkim header.b=PR5EgkKa;
	arc=none smtp.remote-ip=5.135.140.105
Received: from mail.cjdns.fr (mail.cjdns.fr [5.135.140.105])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D2D8606A322;
	Mon, 16 Nov 2026 18:34:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1D2D8606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cjdns.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cjdns.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=cjdns.fr header.i=@cjdns.fr header.a=rsa-sha256 header.s=dkim header.b=PR5EgkKa
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 7914A4F9DBE;
	Mon, 16 Nov 2026 19:33:38 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cjdns.fr; s=dkim;
	t=1794854036; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding; bh=B/3a5RONDuuZMGMV6Q0tQ9hy4n2J6HprX0jDPD3gb+8=;
	b=PR5EgkKasWTpXvXzLEw/tljvxn4hUXlrZY2tvwDWMz7HvOwdOToUVYvarbPlcjneFaluxL
	ufNGmQX2AdUJE9HqJHDwv8UrAIRnWUy7WLmWttp2EvmBrL+KJMCw7xkYaWjSR+JL/1bc9K
	UAAiGtFrRYXVL+xVtXMVS7LxCbFfHkaJePyocUXCFSu72WxLU9+WhoZv7jTDyqJY2uZvA6
	vnoxOlyK0proIOGKDBVkT5rw4y5Ig5Peo0soG93xwBAIdMUlK34osuaVLutJ3l4ICs/EMy
	O24EQxH1jPSJVKnOQOyKRJfiC8UVszW+Hq/lHxUG/D13xY5qc2Frcw7PxN+yVA==
From: Caleb James DeLisle <cjd@cjdns.fr>
To: netdev@vger.kernel.org
Cc: andrew@lunn.ch,
	olteanv@gmail.com,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	chester.a.unal@arinc9.com,
	daniel@makrotopia.org,
	linux@armlinux.org.uk,
	arinc.unal@arinc9.com,
	Landen.Chao@mediatek.com,
	dqfext@gmail.com,
	sean.wang@mediatek.com,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	naseefkm@gmail.com,
	b.larsson@gmx.com,
	Caleb James DeLisle <cjd@cjdns.fr>
Subject: [net-next v5 0/7] net: dsa: mt7530: support EcoNet EN751221
Date: Mon, 16 Nov 2026 18:33:25 +0000
Message-Id: <20261116183332.168858-1-cjd@cjdns.fr>
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
X-Last-TLS-Session-Version: TLSv1.3

The EcoNet EN751221 has a unique switch configuration. Every chip made
with an EN751221 die has at least one on-die MT7530 that is MMIO based.
This switch has 3x 10/100 ports and 1x gigabit port.

Some popular chip packages such as the EN7513G and EN7526G have another
MT7530 implemented as a multi-chip-module that connects to port 5 of
the on-die switch and is controlled via the MDIO controller integrated
in the on-die MT7530.

In this configurations, the upstream switch is put into a "passthrough"
mode in which all traffic is forwarded between port 5 and port 6
without altering its DSA tags.

Furthermore, since the DSA core does not call mt753x_setup until all
switches are present, and the downstream switch only becomes available
when the upstream switch has configured its MDIO controller, the MDIO
controller setup on MMIO implementations must be done before
mt753x_setup, or else it will never complete.

Finally, the on-die switch and the MCM switch connect via a TRGMII link
which requires calibration. In order to calibrate this, PLL adjustment
must be possible on the on-die switch, necessitating changes to the
core_(set|clear|write|rmw) functions to support MMIO implementations.

Solve all of these issues, add the TRGMII calibration, and add support
for both switches.

Since this patchset will probably be subject to some discussion, please
consider accepting any patches that are non-controversial since it will
make future re-submissions easier.

Thanks!

Changes since v4:

Updated to net-next 2026-11-11 and applied multiple changes per Sashiko
notes:

Patch 2:
* Added note that in passthrough configurations, the fully-featured
(downstream) switch must use DSA index 0.
Following Sashiko note: http://lore.kernel.org/netdev/2928da24-a379-4d1e-baae-a5ae68acdf46@cjdns.fr

Patch 3:
* add mt753x_upstream_port_index() which is consistent with change of
conduit.
* skip mt753x_trap_frames() if passthrough
* mt753x_check_passthrough() now returns true when there is 1 CPU port,
1 DSA port and no other ports, and does not return error in any
configuration.
Following Sashiko notes: http://lore.kernel.org/sashiko-reviews/3624a201-be82-423f-ac96-7ab530e7918e@cjdns.fr

Patch 5:
* Early call to mt7530_setup_mdio() now conditioned on "mdio" child DT
node.
* mt7530_setup_irq() now called from within mt7530_setup_mdio() so that
PHYs requiring interrupts from switch can start.
* MT7530_TOP_SIG_CTRL set for IRQ moved to mt7530_setup() so it runs
post-reset.
* Lockdep keys added to mutex to distinguish MDIO and MMIO switch.
* Early call to mt7530_setup_mdio() returns ret in case of error.
Following Sashiko notes: http://lore.kernel.org/sashiko-reviews/6b8a44ad-2795-45f4-9248-bdd5ead0e66f@cjdns.fr
NOTE: Move the content of mt7988_setup to mt7988_probe per above email
was NOT implemented.

Patch 7:
* Two calls to en751221_trgmii_calibrate_direction() had inverted
defaults.
* Set MT7530_CHG_TRAP | MT7530_PHY_INDIRECT_ACCESS on MMIO EN751221
switch.

v4: http://lore.kernel.org/netdev/20261029184202.1859843-1-cjd@cjdns.fr

Changes since v3:
* Fix "econet,en751221-gswitch" not correctly used in driver
* "support MDIO switch downstream of MMIO switch" - clearer comments
* mt7530_port_change_mtu prefer moved function to forward declaration
* dt binding "passthrough mode" documentation, clarify it is a
restricted case of switch hierarchy
* Use different dsa_switch_ops for passthrough rather than short
circuiting in each function.
v3: https://lore.kernel.org/netdev/20261028011317.1557238-1-cjd@cjdns.fr/

Changes since v2:
* The MCM switch previously identified as econet,en751221, similarly to
mediatek,mt7621, however since econet,en751221 is already used for the
SoC compatible, is it changed to econet,en751221-gswitch. The name
"gswitch" is chosen as there's apparently no standard and for EN751221
this is intuitive because it is the gigabit switch used in
implementations with a "G" in the chip name.

* Do not use a special mt7530_switch_ops for passthrough mode, instead
detect passthrough mode in each function and exit early so as to avoid
errors when trying to make a configuration switch-tree wide.

Changes since v1:
* Move mt7530_setup_mdio_irq out of mt7530_setup_mdio because
mt7530_setup_mdio may be called before mt753x_setup

* Do not return error in mt7988_probe if mt7530_setup_mdio fails because
doing so leaks the DSA switch registration, and in any case
mt7530_setup_mdio will be called again.

* default_taps_ondie not being used en751221_trgmii_cal_ok unused args

* Use clk_drvp / clk_drvp instead of drvp / drvn (typo)

* en751221_set_tx_drive ext values too large for fields - values taken
from reference implementation, reduced from 16 to 15.

v1: https://lore.kernel.org/netdev/20260909140346.2861572-1-cjd@cjdns.fr/

Caleb James DeLisle (7):
  net: dsa: mt7530: get ctrl phy addr using a function
  dt-bindings: net: dsa: mediatek,mt7530: describe 'passthrough'
    hierarchy
  net: dsa: mediatek: add support for passthrough mode
  net: dsa: mediatek: support PLL setup on MMIO MT7530
  net: dsa: mediatek: support MDIO switch downstream of MMIO switch
  dt-bindings: net: dsa: mediatek,mt7530: add EcoNet EN751221 switches
  net: dsa: mediatek: support EN751221 switch

 .../bindings/net/dsa/mediatek,mt7530.yaml     |  49 +-
 drivers/net/dsa/mt7530-mdio.c                 |   1 +
 drivers/net/dsa/mt7530-mmio.c                 |  24 +-
 drivers/net/dsa/mt7530.c                      | 868 ++++++++++++++++--
 drivers/net/dsa/mt7530.h                      |  46 +-
 5 files changed, 887 insertions(+), 101 deletions(-)


base-commit: 7ccc5e05043b1bb84326b19a2b05938d8f7a2ae6
-- 
2.39.5

