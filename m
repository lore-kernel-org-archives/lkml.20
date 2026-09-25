Received: from mail-wr2-f35.google.com (mail-wr2-f35.google.com [74.125.225.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 962E91A6807
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 00:12:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790295142; cv=none; b=kv7HLJj9vZRHoJWGvhsZQgUpeEbroEeXQ4mrirEcwb1EDmHeW4EU0ytZcIQPq96Uq7iWMUQ2IutucaXioMzSfzWz7ZVW3Y0AnjmJjyXG/pXyI67879FyAEXfY/JE6FYkiXoP/W7w0Cl+0ZbpcXZjZK5A2owjUmdUZwPXvVP9C9k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790295142; c=relaxed/simple;
	bh=mMDabPCLNjQFJ2YcPqxZzQheojjaztiJGu/+UobgZyU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=tPBBEcYeUEen38uwbhC+bP96iOw4o28CI2cDouzW0jVnbnD0ODe7SwfGd4BeygyVe3CDistXqhgfOMr1JjXjYnmfpEQ+Ru0O/tM1VuGieduZ852ZP2tw754U0OKqgPDrvVuuppmUbwqCunYbmfOxeDJ5FPSRVxW1w347sfafwjo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lex.la; spf=pass smtp.mailfrom=lex.la; dkim=pass (2048-bit key) header.d=lex.la header.i=@lex.la header.b=Ouc3GvtI; arc=none smtp.client-ip=74.125.225.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lex.la
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lex.la
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lex.la header.i=@lex.la header.b="Ouc3GvtI"
Received: by mail-wr2-f35.google.com with SMTP id ffacd0b85a97d-4887840c529so93609f8f.1
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 17:12:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=lex.la; s=google; t=1790295136; x=1790899936; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=NuSF4ztVjK7Ynw1MlgvV+qcIxK4878l/eMDNRbcLCtI=;
        b=Ouc3GvtIO1h5wWoxIqKjsKrfXiwD66yonPi7imE4OmOiZB4NXSaeIqv12OugvUHDdp
         E49EIkuyse5Jtur5LahqGFInlttUPpZM4cuy5n9hr0SNzl310rUTxza5BlHWMzpSI5dS
         8j35u5dm6JL+j/wPAET5pkGsQIWLccdA2oIQLCCo0FAjiwRglUxLn+IkGgR9S+6an4cc
         wwUufnlqQ2MHBigeVWJTnz3R3NnmToizXrLPcKUZQyQfOsuYwY/3c4nFG7VxRk9l3odO
         bnkmZbz7Q8h8WQPAckO1yBxNQA5PPccqQmR8biDCPh8pt47ccuwMWPS3TeaOjXFuYFQJ
         uIsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790295136; x=1790899936;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NuSF4ztVjK7Ynw1MlgvV+qcIxK4878l/eMDNRbcLCtI=;
        b=XwKxYUoOB6ky7FTBTgGg3YtTwYaBR57spvOUfERgWBBGJq+lyn+2H7a0Yw3EZbkbsc
         cuWODnA0GupBYyfJKGQ11ylCp6Po+SgUk4Ecv23/wCgbh7qV7w+mUxMPP+FuxVvU3Rjf
         LZ4Prx8e3BtrPPVCzUjdVLxvlg1ZjzXxKEjsRENMT39kpAV9LZ2v2eIM/DETXZD/ZGJd
         G0yhet6jCZR0bd3pOyiKaP+eAtrKstlLcPIRHO294b4H5ZlfomTdZHRxU2nXUqw+XMWX
         R0J/8b9B7J2Ma419ZuWXKhqSMUM71LOC9GW9D0WxTUSkg7FsWGIA1na/jzP7zoZTeLTB
         Sdpw==
X-Forwarded-Encrypted: i=1; AKwUvBzAm9+oKetMzFHjniHZl+oLARjN6k464uMIG9R1q1IGJKzPHj0RAldaCi+V8bulYRDGARqJayfyEnEuUnw=@vger.kernel.org
X-Gm-Message-State: AFuF++kskphQaYANUOOHdeSiMaEs3OMih/sqRZwQ6uEkYqUwv+Xe/VCg
	QOm1x9YJGuIYno9jhOHAn6HJzdJ1C7mEsXDlu38bV6K4KxhgdMjmChVD2Dzg4xLd2rU=
X-Gm-Gg: AYBFou2kpVSxAcNLzkqjCvepig/h2j/ctJbTbOPp+dsJdHsoKK6vL6S8YRZjuuBVRF/
	5Yll9etWOEFaUNQet614YXs4pcO9gNnOBZkYA8V/30kb0BeLq+QTpKLvjdepHF0UlGhD3G/2TkJ
	qK7iC1JhWvf9dzdRe6M+v+a8jJyoxNwPVUT8SXZ1SVAHk4pTr1vBgQNiwXY1gpsipR6wuQcDUrf
	isZ4b8LsN20KCpts+cwr2te51IJe2EseLfFuF2+BZwdOZtVnA46o+KsOkf9VO+gIdYL8vr2jU0a
	wRMcsaUV37bZsse3fmsgDzeOQ3cURuaiMqD29kvK3HyEctea4sirVo8bCSWTgZFAcC12btW4mvv
	7/LPdxX0cvMiPmGu8lJPv6j/kNWCfP8ymEx7WTaJrGVzX1Rg2TT1ZPcFMj8agT+JI4n8Ze46rqT
	HPAALKXvuQK0nzY2Cr+UCBnNDDFThFk9VncyZxj6W644o7KMSDAGA=
X-Received: by 2002:a05:600c:1993:b0:49d:2936:8ad1 with SMTP id 5b1f17b1804b1-49fe66c8516mr69037595e9.1.1790295135724;
        Thu, 24 Sep 2026 17:12:15 -0700 (PDT)
Received: from remote-01 ([84.17.55.134])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4887a30b9aesm2331621f8f.5.2026.09.24.17.12.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 17:12:15 -0700 (PDT)
From: Aleksei Sviridkin <f@lex.la>
To: netdev@vger.kernel.org
Cc: Russell King <linux@armlinux.org.uk>,
	Andrew Lunn <andrew@lunn.ch>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>,
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
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net-next v4 0/2] net: phylink: wait for a PHY that probes after the MAC
Date: Fri, 25 Sep 2026 03:12:07 +0300
Message-ID: <20260925001209.2334139-1-f@lex.la>
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

Let the PHY node say so with needs-host-firmware and have phylink poll
for the PHY instead of giving up. Patch 1 adds the property, patch 2
does the waiting; the reasoning is in the patches.

A late bringup failure has to leave pl->phydev clear, because the
poller reads a set pl->phydev as a PHY that arrived by another path.
v3 depended on a pending phylink fix for that; it went in as commit
a940003f44e7 ("net: phylink: record the PHY only once bringup cannot
fail"), so this series applies to net-next on its own.

Tested on that board with both patches and a940003f44e7 backported to
its OpenWrt 6.18 kernel. The retry runs used a local debug parameter,
not part of this series, that fails the connect after a successful
attach a given number of times; the switch was unbound and rebound
with the PHY driver unbound, so the poller was waiting when the driver
was bound by hand:

 - at boot the switch set up its ports at 2.0 s, the PHY driver loaded
   its firmware at 6.3 s and the port attached at 7.2 s
 - two injected failures: "failed to connect late PHY: -EIO" twice, a
   second apart, and the third attempt attached
 - failures that do not stop: four attempts, then one "giving up on
   /soc/ethernet@15100000/mdio-bus/ethernet-phy@d after 4 attempts",
   and no further poll in the 25 s that followed
 - unbinding the switch while the poller waited: the poll stopped,
   nothing oopsed, and the port attached normally after a rebind

Unbinding the switch after the poller had attached lan4's PHY prints a
kernfs WARN: dsa_user_destroy() unregisters the netdev before
disconnecting the PHY, and only a PHY attached after registration has a
"phydev" link to remove. That ordering predates this series.

In one rebind the EN8811H's own probe failed (MCU not ready); the
poller kept polling at 1 Hz, as patch 2 describes for a driver whose
probe has failed (the run was too short to reach the backoff).

Conor, on 2026-09-10 [3] I said the property would go and the wait would
key off firmware-name. I went back on that. firmware-name names the file
to load, and the EN8811H driver keeps its two blob names in code, so it
would only be read as a presence flag. If firmware-name is still
preferred, I will redo it that way in the next version.

No in-tree device tree sets needs-host-firmware yet. The board is
supported out of tree, in OpenWrt.

Alternatives considered. The poll follows the plan in [1]; a
BUS_NOTIFY_BOUND_DRIVER notifier would give the exact edge, at the cost
of registering a bus notifier for each phylink instance that waits. The
poller repeats what phylink_fwnode_phy_connect() does - choose the
interface, attach, bring up, detach on failure - but drops its reference
at a different point, so the two are not merged into one helper.

Changes since v3:
 - Rebased onto net-next, which now carries a940003f44e7; the code is
   unchanged, and the prerequisite line is gone.
 - No longer RFC. The two open questions are settled above.
 - The board is named, and each patch says how the problem was found.
 - The binding description keeps only what the hardware does, and the
   comments in patch 2 are shorter.
 - Tested again on the rebased code, including the teardown cancel that
   v3 could not reach before the mt7530 unbind fixes were merged.
 - The NULL phydev->drv window mentioned in v3 is left to phylib; a
   separate series for net addresses it [2].

v3: https://lore.kernel.org/r/20260914211137.2760618-1-f@lex.la/

[1] https://lore.kernel.org/r/a230d199-5d4d-4637-aff3-e725a37e1da1@lunn.ch/
[2] https://lore.kernel.org/r/20260924215951.2127682-1-f@lex.la/
[3] https://lore.kernel.org/r/20260910153811.778387-1-f@lex.la/

Aleksei Sviridkin (2):
  dt-bindings: net: ethernet-phy: add needs-host-firmware
  net: phylink: wait for PHYs that are known to probe late

 .../devicetree/bindings/net/ethernet-phy.yaml |   6 +
 drivers/net/phy/phylink.c                     | 220 +++++++++++++++++-
 2 files changed, 219 insertions(+), 7 deletions(-)


base-commit: 42a9fb3382fc2573e92f41d203b095d9a372cfc9
-- 
2.53.0

