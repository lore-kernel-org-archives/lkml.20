Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92DA334D385
	for <linux-kernel@vger.kernel.org>; Sat, 29 Aug 2026 05:25:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787981158; cv=none; b=S1iV6kJr7GtsDWT3wZ7FDnWjBa1wXIGaDcqTFomyZfK8bi3BwQr5W8MzURFf50gU/EJMJvWsZrJi/NTylb6OczConkDjlBmXTgRS3DWRxDgEXNu5UkrjH7aZ6XHpvpiyL+XnWXOO1yem/kxiQN2WiN6/VDzhSg6L+Yv3Zku01eE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787981158; c=relaxed/simple;
	bh=9hOIzUfjjBmeboBlxFMJis/Y5G8h1cBRqrNJQC3CHKE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=SD2KNiMMtrLFJAJpE3IOcU1Jezrsds8MlqBcX0wFY24NLzSEE4kGr0yE2IWN/8340KKwwK5UQ+faPvsoPMUwHqiHBxWv088wZJ80KxAcvjNsAyCsctxQ+VNvo5H3pG6Avs+912RC1ejjpOzfLS1Crwhz04cTspgRcn+u2DBCtog=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lex.la; spf=pass smtp.mailfrom=lex.la; dkim=pass (2048-bit key) header.d=lex.la header.i=@lex.la header.b=UuOS3iFx; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lex.la
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lex.la
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lex.la header.i=@lex.la header.b="UuOS3iFx"
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-c25099bb1fbso232146566b.3
        for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 22:25:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=lex.la; s=google; t=1787981153; x=1788585953; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=uJSrXCFowaVDIrPldYmnI+mOM9nXJmwd9fnuaat6Tb4=;
        b=UuOS3iFxHgl08geV3TPieKkbTNQkdiXiVE5cDVE8YjtZOTgjO/FtrXQ2KQEgOqzjFt
         iO3CRmHlYyoJaKGbo7uboyzFy2zAiQCuIdKJdk29XbR3qrlMWI2OwpLvtD90VY6sZt/X
         fxw7qISdq3+BCzGWEbncw7QMhqlhpoiTQMWcxdOS6WVIGwuTSJd0wT2f+/u/W4poWKRQ
         YEVGsL1D1eIkIk/vznhaoHdJPsngVTME+YFK4vvlNvB9v3tKwslXw0aOzgm449gU5Fh8
         ogIyfkWmXsTSXgPqpPJwbim6eAWw2eZEdsrqXlmkMuTsmMNtmpFYX3JtlPLMYFHWeZVY
         xn+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787981153; x=1788585953;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uJSrXCFowaVDIrPldYmnI+mOM9nXJmwd9fnuaat6Tb4=;
        b=n3yhIsH0sQwYr/OnrExrdZAKTYjfSvyyzCXIxhGxf9l5BCdMfm0DAGIbdi1fpmkF9g
         SejCCKHNbGrXQrUDiAtKmaHmf9tXA+NUr7sOQKsbigTCvw8py5xLU3hIroctqotbWhwY
         qi1mnYKB7+7H+ChD8LlIbJQE68127AAfA1ht1xXUCGaRSw32Y9t5TmJyxVzu8FEjxVv1
         g0W+TJBdJJ34PBXymZU2QkWvUH5a4/nYd/kY/q4uiPIplXqpL6Kpcs0A57pCkl32kfHX
         2rt41iVW/sfp7M/FnrVSo5By84H8vGG9rDr6QuMtK0EejUAdWcXPJNH4uTx4jHz/fvE/
         Y9Lw==
X-Forwarded-Encrypted: i=1; AHgh+Rotf1IyWMwLgON9Dg0qJM3W0zHcrCBwRU+ZrkoRKX6dBjBVDOY+DJO8eMVTi0SAL7H9UdsodTInGObHesI=@vger.kernel.org
X-Gm-Message-State: AFuF++lC2usuOB0iBJcyTYt96559jXOx5lOM+bLGlf6FM9N0TOak7vES
	gUl7getNmFQnTTljZ337owGlvyBMVrcFH6TDb4hTAQt2zyMuoK8KaOeJ0urb3KfuY2o=
X-Gm-Gg: AR+sD10Z0LNiG8jRYiCW5AR6Abh1bLx+SKQrhUTZ0xu5ArNYtxUS+S7j6J3CB1/Z07W
	3T0uHqJdIkZPBtrKBGQiUsHYdhmnvhOvonuNkHc4JNb8D1nH+t4GLTre9/bwXfUEP4QDeKoVnNj
	t23H3WMz5UNm7tDrvbudy8JzHmsWYqrHMICTEx75EnTYfo60GXqRWEH+A0CcJtnBrrnxOUpMwnR
	twev1znLDOq7CWoWogMRzCwzQRGhlPbn9yXgJ/Cyy8ZYEXX3eHHyWzwty02gMxKopUTuZzu0TdE
	TfFhNHCgYqSx3L7wCEztKLYQ/30ahuUmfCQUR3SnsoLcSDGfH1slJlr/eh16dspqdiKdTUuVUZL
	AqMJJdI1uoWd/+uvJV98+QVYf9V923Iza15Zz/wbQvm4MPg6WrVuY6ln/oLcrOG5iHMbcMJv81c
	eydB6VCOZTaykJZt0KBPQ44io850w+GaNLuUjbfvTkuA==
X-Received: by 2002:a17:906:fe04:b0:c24:c24f:e176 with SMTP id a640c23a62f3a-c25571576e4mr790014466b.15.1787981153008;
        Fri, 28 Aug 2026 22:25:53 -0700 (PDT)
Received: from remote-01 ([45.85.105.214])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c255ee75a36sm163750666b.28.2026.08.28.22.25.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Aug 2026 22:25:52 -0700 (PDT)
From: Aleksei Sviridkin <f@lex.la>
To: netdev@vger.kernel.org
Cc: andrew@lunn.ch,
	hkallweit1@gmail.com,
	linux@armlinux.org.uk,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Aleksei Sviridkin <f@lex.la>
Subject: [RFC PATCH net-next 0/9] net: survive a PHY whose firmware arrives after the MAC probes
Date: Sat, 29 Aug 2026 05:25:37 +0000
Message-ID: <20260829052546.1152446-1-f@lex.la>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Airoha EN8811H answers its PHY ID from power-on, but it is an MD32
microcontroller until the host loads firmware into its volatile RAM,
and on systems that keep the firmware files in a filesystem those
files become readable long after the MDIO bus was scanned. Today the
DSA port that names such a PHY is dropped at switch probe and stays
dead for the whole uptime.

This follows the direction Andrew sketched in [1]: describe the chip
as an MDIO device that owns the download and the reset line, publish
the PHY on a child bus only once the firmware runs, and teach phylink
to wait for a PHY that is expected to probe late.

Patches 1-2 add the bindings. Patches 3-5 rework the download into a
library helper typed on a bus and address, shared per [2]: the PHY
driver keeps its behavior through wrappers, and the helper skips the
download when the MD32 already runs firmware - which is what lets the
MDIO device and the PHY driver coexist, whichever runs first. Patch 6
adds the MDIO device driver, patch 7 the pass-through bus, patches
8-9 the phylink half. Patches 8-9 alone carry a board whose chip
answers its ID before firmware: the MDIO layer buys the general case
(chips mute before firmware, quad-PHY packages, reset ownership),
not this board's necessity.

Tested on an MT7981B board (MT7531 switch, EN8811H on a 2500base-x
port), warm boots only - I have no remote way to cut power:

 - download path: U-Boot leaves the MD32 in its bootloader on every
   reboot here, so each boot exercises the MCU driver's pulse-reset
   and download; ~144KB lands in about half a second and the version
   register reads back
 - adopt path: rebinding the MDIO device against a running MD32 takes
   the no-reset branch and registers the bus in ~70ms
 - the PHY driver, probing on the child bus right after, finds the
   firmware running and skips its own download through the same check
 - phylink attaches the PHY ~0.7s later with its interrupt from DT
   (the poll-tick latency tax below), the port reaches forwarding,
   and the interrupt line counts link events across forced
   renegotiations
 - an ifdown/ifup cycle disconnects and reconnects cleanly

The polling costs latency: the attach lands anywhere in
[0, poll interval) after the PHY becomes ready. Three consecutive
boots measured attach timestamps within 47us of each other, which is
the tick phase showing through; mean tax ~500ms, worst case a full
second. The exact event exists - BUS_NOTIFY_BOUND_DRIVER fires at
probe completion - but mdio_bus_type is internal to phylib, so an
event-driven follow-up means phylib owning the notifier behind a
small API. Polling first was the plan agreed in [1]. Is that API a
direction you want?

Two more questions. The property is "slow-to-probe" on the port node,
documented in ethernet-controller.yaml; better-scoped names welcome.
And the MCU driver cycles reset only when the MD32 sits in its
bootloader, since firmware lives in volatile RAM - so on a board
without a reset line, running older firmware is adopted as-is and a
newer file on disk takes effect only after a cold start. If that
trade reads wrong, the alternative is pulsing reset on every probe
and always downloading.

Known and left out: the retry never gives up, because the errno out
of a failed bringup cannot distinguish "still filling in link modes"
from "genuinely incompatible" - the backoff exists since a failed
bringup ends in phy_detach(), which pulses a PHY-node reset line.
Unbinding the MDIO device at runtime while the port is up removes
the child bus under an attached PHY and a later phy_stop() oopses;
that path predates this series (any mdio-mux unbind does the same)
and wants a phy-core fix rather than a workaround here.

This is based on net-next at 91ec20351349. It textually overlaps in
phylink_disconnect_phy() with the pending fix series [3]; a non-RFC
respin will rebase over whichever lands first.

[1] https://lore.kernel.org/netdev/a230d199-5d4d-4637-aff3-e725a37e1da1@lunn.ch/
[2] https://lore.kernel.org/netdev/29f973e4-980d-4198-bbec-452f7421d416@lunn.ch/
[3] https://lore.kernel.org/netdev/20260827211638.63395-1-f@lex.la/

Aleksei Sviridkin (9):
  dt-bindings: net: add Airoha EN8811H PHY MCU
  dt-bindings: net: ethernet-controller: add slow-to-probe
  net: phy: air: type the buckpbus core on the bus and address
  net: phy: air: move the EN8811H firmware download into the library
  net: phy: air: skip the download when the MD32 is already running
  net: mdio: add Airoha EN8811H MDIO device driver
  net: mdio: en8811h: add the nested pass-through bus
  net: phylink: wait for PHYs that are known to probe late
  net: phylink: report no link modes while a late PHY is missing

 .../bindings/net/airoha,en8811h-mcu.yaml      |  83 ++++
 .../bindings/net/ethernet-controller.yaml     |   9 +
 MAINTAINERS                                   |   7 +
 drivers/net/mdio/Kconfig                      |  11 +
 drivers/net/mdio/Makefile                     |   1 +
 drivers/net/mdio/mdio-airoha-en8811h.c        | 300 ++++++++++++++
 drivers/net/phy/air_en8811h.c                 | 148 +------
 drivers/net/phy/air_phy_lib.c                 | 381 ++++++++++++++++--
 drivers/net/phy/air_phy_lib.h                 |  27 ++
 drivers/net/phy/phylink.c                     | 225 ++++++++++-
 10 files changed, 1011 insertions(+), 181 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/net/airoha,en8811h-mcu.yaml
 create mode 100644 drivers/net/mdio/mdio-airoha-en8811h.c

-- 
2.53.0

