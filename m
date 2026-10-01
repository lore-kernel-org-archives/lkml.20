Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4291A36F414
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 13:02:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790859735; cv=none; b=Ik5/olf/2zx6S1FZmQFSb1H0+I4d03fDGt9Tt9wCdetfKaOe2N8PLd4RyS1uKcBNNkWnIGWISPywF0IsvpDhkdqj1NBX+6nLK6TnvLdioBOaZ3bWiQPy17MxNYEZ3CMEGDN6itEYr12GV1uOCyddX4HAdQCHDZUndzK6aZYCDgw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790859735; c=relaxed/simple;
	bh=pOMhtGt4+2zxv9c1qA9eTQ2O+tf/rKmcvlBHo47DRc4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=X+/aVCAYKWDHVUzcRm2wKjvP6Cu1OpTfIq8uQQHy4sn33e0qePXPU9RK2V3pkw1PSFm6Y1l87U6AhBaiarTzVKjvIdw0nUiPH6wfhaLxVUEkk2k2yMm92MeA6E9S5uFYZ/gPektHHEfLHw+lGaQ0SA2QlrXvsZpIJkFUch0k9l4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lex.la; spf=pass smtp.mailfrom=lex.la; dkim=pass (2048-bit key) header.d=lex.la header.i=@lex.la header.b=GIxdEYv1; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lex.la
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lex.la
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lex.la header.i=@lex.la header.b="GIxdEYv1"
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-c2946aa0d5aso382443466b.0
        for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 06:02:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=lex.la; s=google; t=1790859732; x=1791464532; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ssAgCLNB1hrn9m8PJ+lriduvIQBe6pwTyDTXeIxcaNY=;
        b=GIxdEYv1DvbvsdjGcwz1COCLNlhwHe64YV7L9CHOsJIioeA9yZx7ZX9u5h49bjhp//
         +BJos2GyqoKM9OqPWGSYv/Ff4RB3CDILFZZSk5PGIQAwWPvPO3kxTDh3rm2ee7zUhRXZ
         gylMlwA722JOTG3VOBn+k8ABnwRn+Z3UCE8KITe6qVvgo0OBqeXwEkrBSa8JwLBGXVbS
         GNVNMlYglAP4wzG+7NHErowlPYNDmpxgy18rTMDCgQScH9nsBldbVCVP+grhBikY0y1p
         jHk78NOv1ujlbBPqOetgLZ+SnTprMsceGU5/46CcQAAh/Bt1N6x1ceiMgXD9YhSaLi6N
         kvRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790859732; x=1791464532;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ssAgCLNB1hrn9m8PJ+lriduvIQBe6pwTyDTXeIxcaNY=;
        b=WKEFeYiuxNWBKdq0h8fxpizMMJX4b6ffmwUaQbIu5wVVMAvG++OugpfO3Ajiaj4pZe
         9dlwdbF30FcWRWwRsNZA9uok8zfxt4mPBiMXgfTwHEkVpSTCmEveQwWpXGQ8C8Jr0crL
         swykkepPkvAGfcKqd4pHV9wuHc29nEjHs2QC6YyELSzxOWAmD2K6FCrVs6FSPknFcHxO
         2xMHHR1hAsldALJM6AOWiK8wurtNEQP7fhakQUwgVLY6jYx1XsJhuZ+vlm5NQcJXcQJZ
         IMcAJt/8vuBPIgrZ/5Q/y5jAggKihRKOCIMoRbLYhouSS4q3EbzPx73sPFrLgUrk2tUa
         6rgQ==
X-Forwarded-Encrypted: i=1; AKwUvBzdbt02GxcANzDRSTOS1785OFdWJcObViHfuzkFy8Fs2c1gZKPf/+r7on3HAp31Hn6kS2f7uWKO49jZ/Yg=@vger.kernel.org
X-Gm-Message-State: AFuF++moaq4AUzBeGOqQCuVVH0UMVUXdTeT1QOAcTDjtjIGyQkF16d1B
	omqAIsV17whXmskEynBajM2pVmF1EadlR4+2iJGzKrAceN/WdZBgxi+5d9XGpa51p00=
X-Gm-Gg: AYBFou129X/gQBbngpPna+FM3WDIQXih33xjmjhnaSWHOGpwyy067Zr0cyo1czW0HDp
	JC0NMTPcL0IQN6cOPxVmLjjg6dYOnMMHbaa4R+TSSVXVVFQLa9BhhLTZbYrVRlTkjVcsvs+g/2g
	AGcivmWnDLBgDBA3QoOcsjBwO880SMr/QqPz3XbEPVA7JTzp79IZS2zm/KaJPwe/kFedKPQC3gA
	q3VQoVAuAroeOpamQxwo326aVGVKOhbYnoBbf35e3bIJjBeC1nrnG/7k8jquDDPi7FpOjwZDkQ1
	MI7UZHkGrpctkvKgGVaG5d7juwzSj88a7k6eG5DERt2XTRIN9XTyR1D59xRDyegmwYYZpv9Kkpj
	/aFBNP7KGCO8txNYhzsnS0oie7bR7o9pvCJ7O1YhpewYCVDj6spl0rIlYhoDWMkVQ2oW/7jAIUu
	pXLS9cPVAejS8j/YerqjXPWi1XR+iFlN+Tnhk+PjBeKITxyercsQ==
X-Received: by 2002:a17:907:2da2:b0:c2a:fe4e:61c5 with SMTP id a640c23a62f3a-c2e33ffd009mr234417066b.22.1790859732009;
        Thu, 01 Oct 2026 06:02:12 -0700 (PDT)
Received: from remote-01 ([84.17.55.224])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48b06a2cd0fsm5568155f8f.30.2026.10.01.06.02.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 06:02:11 -0700 (PDT)
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
Subject: [PATCH net-next v5 0/3] net: phylink: wait for a PHY that probes after the MAC
Date: Thu,  1 Oct 2026 16:02:05 +0300
Message-ID: <20261001130208.105558-1-f@lex.la>
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
.get_stats64 atomic-context fix). The debug kernel used here wedges a
CPU without that fix, unrelated to this series. Two local debug
parameters, not part of the series, drove the error paths. One fails
the connect after a successful attach a given number of times, the
other ignores the opt-in.

 - boot: the switch set up its ports at 3.2 s, the PHY driver loaded
   its firmware at 8.7 s and lan4 attached at 9.5 s. Link up at 1 Gb/s.
 - opt-in ignored: the old behaviour. The generic driver took the PHY
   at switch setup and the port never polled.
 - two injected failures: "failed to connect late PHY: -EIO" twice, a
   second apart, and the third attempt attached. Link up at 1 Gb/s.
 - failures that do not stop: four attempts, then one "giving up on
   /soc/ethernet@15100000/mdio-bus/ethernet-phy@d after 4 attempts",
   and no further poll in the 25 s that followed.
 - switch unbound while the poller waited: the poll stopped, nothing
   oopsed, and the port attached normally after a rebind.

No in-tree device tree sets needs-host-firmware yet. The board is
supported out of tree, in OpenWrt.

Changes in v5 (since v4):
https://lore.kernel.org/r/20260925001209.2334139-1-f@lex.la/
 - Deferral is opt-in. A deferred connect returns 0 with no PHY
   attached, and some callers read 0 as a PHY being there. A MAC opts
   in with phylink_config.phy_may_probe_late. DSA sets it for user
   ports of drivers that set dsa_switch.phy_may_probe_late, and mt7530
   does (new patch 3).
 - Defer only with a known interface mode. The poller no longer fills
   in PHY_INTERFACE_MODE_NA, so the MAC is never started with NA.
 - kernel-doc names the opt-in and the state after the retries run out.
 - Rebased onto current net-next. Patch 1 is unchanged, Acked-by added.

[1] https://lore.kernel.org/r/20261001130120.104628-1-f@lex.la/

Aleksei Sviridkin (3):
  dt-bindings: net: ethernet-phy: add needs-host-firmware
  net: phylink: wait for PHYs that are known to probe late
  net: dsa: let user ports wait for a PHY that probes late

 .../devicetree/bindings/net/ethernet-phy.yaml |   6 +
 drivers/net/dsa/mt7530.c                      |   1 +
 drivers/net/phy/phylink.c                     | 221 +++++++++++++++++-
 include/linux/phylink.h                       |   4 +
 include/net/dsa.h                             |   5 +
 net/dsa/user.c                                |   1 +
 6 files changed, 230 insertions(+), 8 deletions(-)


base-commit: 47a1446725732cd3996edf607e8739334bbf4d78
-- 
2.53.0

