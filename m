Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A661379EE0
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 22:31:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789511509; cv=none; b=WEoXKERiy/3Rkp40Y5nPv2QY3+VUSzgn1i8SLH3rOlOxqZyYIpB+Bu2123Er7faoBBKE6OpLTWCPt4XHGKHCbs3rLppBNl7xM4ybgSmYAkXimE0VyXO7QzTuxBjoMZryq6CvBLgDRHfp+ZPjDEsr1zXN7wRyP1zIubfVZLMgUFQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789511509; c=relaxed/simple;
	bh=a2CRC0suMp5REApEy8/qcsXbL30zSop8JFr3EtNrZjk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=otnrvoCfLWBtTYdJw1j8lnJOwPGYN5eCVKVmsXPlidGaaizV9+bpdMrVLS7kQBJ0H9CUMVkkI6Ijiho5N6IJqKiZD9YGxdfftBdup5pZA4s+x1cuv+VqDTuTj2TXALurRHEOm/V4idwEoAKE03H3oitRl/w9rxvadt2CbqVq8yg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=d18diZVD; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="d18diZVD"
Received: by mail-pj2-f13.google.com with SMTP id 98e67ed59e1d1-396ccb1a98dso219910a91.0
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 15:31:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789511506; x=1790116306; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=UCjk7rkFTyN2WMYlt7IlI6BX3j091q/yk2Leouece6E=;
        b=d18diZVDu3zBfyDsv11X0qvCm/KRttkDeNNbjRSwAJy5BQW32dtQ+8eN5G7D5LbP0+
         escZSextj1qlTkVXvX1CWBWczZk2X7aEt5eAn4amT1hVPSK5R7qVvzSeR/nixssdfCLB
         Q8Dvyn2bF1femPWtyee9Bc9vVBRWCp8SJs7uQL9TxfxUoYu7m5Crzh98l/6Smt1Wki3M
         pcnTaVIJs0I+L2NvboeQsQWmrNcuTMLfF21/RfQdEu6qbVBXZ70p/jBRo2OPASMqhDQj
         Gc8TK9oYc7osCmcpniuiuh0qXldP937Y0aDRSLnbpZH8rFgtqPHEhUT7U9JWJeKTyiP3
         pLhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789511506; x=1790116306;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UCjk7rkFTyN2WMYlt7IlI6BX3j091q/yk2Leouece6E=;
        b=vsZgSIc5l7mS+T8sTLsw2scEtWmixdEnqbP1xR25zyGLQxi3P7boeEshHipGEN3tCS
         r6J1hWqfAj40n2jfDGOqVfAzJfxKMAv+Vng2DNI3UvuDYT9mn9loIR3CIugj5qqtAksi
         bgJzvUlIjDuoiP65C5kuIet/pKZZa/6nwRG23UsT0lyqfUN7Gn8B2Wbx3bTQ7ofjfaau
         Rs4n26IHpeYGIbQiH8OSa2N8ff05ABxyFC2DojVYK4hKtH+GYzdbzh32f9nlhsD0Sxq0
         NkOzVOAM0rpILwVigp7Cdkcg/NvMIu7EdR7EE2pECPM1+gdrsBfBAeSapZ/zAe2+hXth
         mOoA==
X-Forwarded-Encrypted: i=1; AKwUvBxHh421Q5Npi6qMHmbULhCabxN7vao2Zgz052DMRl/FwU4GQQRwO8hpBx/Sp/+sVweJl5QMIWMJkh+mKSE=@vger.kernel.org
X-Gm-Message-State: AFuF++mCSG1uLVmH4yimsHEj9BPvKvTvJuRM6ogWvamHbom3tbhJkW7v
	eNoErFBspFyOIUjku0oFmsDK2DbrAMfgbvlNWNE4p7pn6QvNb6zKRoU=
X-Gm-Gg: AYBFou2evpy2opLxv8Q1gb0e1cfvuTix7WDyqTPvnmE6oJaEKGjPUqiYXE3CGnk9rjJ
	r7DXrKYZwHGGsc0hhobZ/0BQlt2YgwayHarm/2OEhAMGpa8Hm1aNsvE1f/4dH97VhEXxwRuWTkh
	aTSh6dOf2VexiDXnu7K5s60K89oH9dmUACAHjIR5ECfzzer0DSkRlcD+ja2R+iYw0PopxXOwqqn
	kGmoJYkNRPtmQYculMVbJmyPYp/JWvwBr+hwcSYioA4KT5J8Cn3o8IqJNO+UBLolt4YB2ynUYhu
	WmyU0NWKxdyH7JEJTVTD7qi5MxK4cmbZvl0vJuYLKzW45Ec68WD5bTZ1dCYI/B2JTtI8N0E7y/s
	vEQfhtc0BsocVGxz4mlb5hP3nLs5aHwT4e9jAsYZ+/u74oeINf/ETptKMr4n+zzyFo9T21Eta5F
	uBQxPZhEaTKpiV4mlzKPCoWElffQS9wZNInmumh4r/5SCYOVUkUoQ8yotTKZZfOv5LX/Pb6yHI1
	JtaH4u2/XBVkB56OIKwAxjLHA==
X-Received: by 2002:a17:90b:2e83:b0:39d:f61d:4b93 with SMTP id 98e67ed59e1d1-39e1e441e9amr779736a91.13.1789511506341;
        Tue, 15 Sep 2026 15:31:46 -0700 (PDT)
Received: from ydg-Zenbook-14-UM3406GA ([2001:2d8:7f00:8c85:556:537c:f7cd:8a1b])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e1c337e97sm208036a91.2.2026.09.15.15.31.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 15:31:45 -0700 (PDT)
From: Donggeun Yoo <donggeunyoo.kernel@gmail.com>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>
Cc: Russell King <linux@armlinux.org.uk>,
	Daniel Golle <daniel@makrotopia.org>,
	Rosen Penev <rosenp@gmail.com>,
	Christian Marangi <ansuelsmth@gmail.com>,
	Sashiko <sashiko-bot@kernel.org>,
	netdev@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Donggeun Yoo <donggeunyoo.kernel@gmail.com>
Subject: [PATCH net v3 0/2] net: phy: qca808x: fix the active-high LED polarity mode
Date: Wed, 16 Sep 2026 07:31:36 +0900
Message-ID: <20260915223138.321307-1-donggeunyoo.kernel@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

A QCA8081 with an 'active-high' LED node does not work today, in two
separate ways, so this is now two patches: qca808x_led_polarity_set()
rejects the mode outright, and once it stops doing that
qca808x_config_init() still will not put the bit back after the reset
phy_init_hw() runs.

Tested in QEMU against a synthetic MDIO bus that answers as a QCA8081 and
emulates MMD7 0x901a, with the reset clearing BIT(6) as f203c8c77c76
describes. One kernel, one harness, three arms, x86_64, 7.3.0-rc2+:

  DT node            base      1/2 only   1/2 + 2/2
  active-high        -EINVAL   inverted   correct
  active-low         correct   correct    correct
  no polarity node   correct   correct    correct
  high-impedance     -EINVAL   -EINVAL    -EINVAL

Still no QCA808x hardware here; the harness emulates the one register, so
a confirmation on a real board would be welcome.

Changes since v2: https://lore.kernel.org/netdev/20260914214720.2467586-1-donggeunyoo.kernel@gmail.com/
  - Split in two, one defect each, per Christian Marangi.
  - Add QCA808X_PHY_LED_UNSET and express the condition as
    PHY_LED_ACTIVE_LOW instead of bare -1/0/1, per Christian Marangi.
  - Tested rather than compile-tested; see the table above.

Donggeun Yoo (2):
  net: phy: qca808x: accept the active-high LED polarity mode
  net: phy: qca808x: keep an explicit active-high LED across the reset

 drivers/net/phy/qcom/qca808x.c | 15 ++++++++++-----
 1 file changed, 10 insertions(+), 5 deletions(-)

-- 
2.53.0

