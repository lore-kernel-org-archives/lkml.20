Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.229.8
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794326794;
	b=ulSL2Euo2biwnnVqu/WxhF+tVkgk1NVtS0Jguwnrh4JytxlyqH9KEdwzNwgdwLELTURF
	 0NChuIHZj2lZ1SR7pIPRKQDFLXXsJ6Bq4Z6I7JJyy8az46lvFoLXJ9z6l36TkDO+PCvmw
	 v8clsyQuNvU3EIUHO156EED+wSQURtSCKfvBURICgpBQiTaA+CrBfjm6ZhZU0oLuWpw54
	 /S6NoJvSQVh0UWZe+SE8GweXxAIvXi+0K7x6AgyM5PEKwOXpAEKnCIa6U+bvPw6D6ywiy
	 OBx4puq0yMvuqrB128k0qiuNtpJaEW1OS/GtEZ1MMOqcIrhvcP0U4j4PlknO9NjXXQQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794326794;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=Vrfc2uaAwCa6vgkw7mtiQRrVI6iR2fXJpjV3Toth268=;
	b=IrzmK7afjT0Z586Kv8p1Wpr0Kmom3O/Q6vMsWHtzBcYsmYIGRM9n+wUVzEMJyQmsQaAB
	 d+v6r6loyLtBpZ7Yna+M+0SmIPZFG7oZK94ZQunOehvQVIKRBX49SxLyvKcWT9ZzwObSm
	 SnYkknDoT1LcUzdYBBqOURJ5nNesLNFxKnD1n5L6VCg0G/N584WpyOVoczStjKx/95MuO
	 3V8q5qmEn/GnbX7LSbIS3HpCU6idw+0h+MPk22MpvPFqPPfD+0UmoG6T8MRNwYKDpq4tw
	 V+dQaaRAcYYlHSA/1bbsNW+CXf+p7gQwlYcPI/RR58q8z06qYwF17DAzy7umrwZ+neA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hYvFUIu8;
	arc=none smtp.remote-ip=74.125.229.8
Received: from mail-dy2-f8.google.com (mail-dy2-f8.google.com [74.125.229.8])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC1CC606A321
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 16:06:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BC1CC606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hYvFUIu8
Received: by mail-dy2-f8.google.com with SMTP id 5a478bee46e88-36a6ce64b95so1483753eec.1
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 08:06:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794326793; x=1794931593; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Vrfc2uaAwCa6vgkw7mtiQRrVI6iR2fXJpjV3Toth268=;
        b=hYvFUIu8ZWv5dNB1GaL7fkMqJA6tevDFZDf3F1b5Cpi+lokAMJ3ZnlwuLs4P/904de
         1HRWfAGVwhbAOkaKTzYAycjUdmIzM9viu4Nj+kYTSAqyRs+vq4d420OZDT+zyxmeq8Dp
         yeKxSaRe6mugmCFATS1mXydwYbRIaqIa48ypthuFz1nG59/w76l6JsvT+jrkP09BTCZf
         PEe5NJqC9qE/ZxK0udZIpnpdPtUhWAg4LLVUeYLG2YHFKLNgrnwMZKtK9ozOY/PIhk9z
         iK2YnR0xoboRrFwetO6kN8gtarh5BdGZX2FLSJ1TKfHKbcCPTpOzn8xW2wVnRxd93j+u
         yJSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794326793; x=1794931593;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Vrfc2uaAwCa6vgkw7mtiQRrVI6iR2fXJpjV3Toth268=;
        b=crwN8U8NA7TzSWclt04sm0qCY5BOlggIEkBdHn59rVQN5LIGwqy/blT/JrLzUwg5D4
         by1EyJTnpRKk1hqy8BwqPEpCZvIHwXW5xkSiOK1Jnc/1ZS1MbM51+q6lELbZl7vYuh+u
         xFR0spLvvcy7MI2tvBK39umrGskFSsxLPbXMQJDHSCsXyaOqAUL99RJdKEGfZO9YEt2k
         M0fWBw0yfcVP3/RHpukSiXLra/n92Is+uWsplQ5mbJSIMemfivXYOBLE90IAeAU9Vb2M
         BM8HRgJAeBb2DzoTna4lYIaWOOjRx0Szj4hA8EQLRWjD/HsCb/n/mSam0sVJBB0MHTPU
         dX8w==
X-Forwarded-Encrypted: i=1; AL+hErGUvWIRbKgvdpd2Ap6eaDriNpTzou9Drqrhx6hIA5vkLjNztHzYyzRbTqj3GF6/kOeNAMAYPkwj8WC5Tak=@vger.kernel.org
X-Gm-Message-State: APuU4Z+DgqQOxblheIujj6wcCVhMclYahhmTwJ9w/9wsxs3YOBXbsDl5
	tIqWvIJgEh5+3asdO6aMVimSiJ5kzrp2SA1lRC6dozD5xVn7imPa7w2v
X-Gm-Gg: AYBFou3yWaVpHKkaYT13JQdAuEnLi2+z6bRufLIH23yCaz1imSpi5DSZoIYkO7hyEW3
	hzPqzSch3a7MNYczWXAT65y9wMidpz0jEPpHfo1hXmqMZm6NEwZX9nVW0dfhxYhmsmbRoKiXE17
	QgpDSjH+oNPLkvs/BZ6glrEYc66czthnXzPm36SyKhHNQwRBdOuhYjJnn17b+j6hfB5SDa9Wfo6
	Pu7mTrjliiBTL8KCYO0RSctSqh8DvmsoQRXncOAjoUYBw2CKIp4I1vu1IGraA1s6NotTQfJAe9b
	tOBEoLz80POT74POOd9hgHIIg2h401xBCXGHZur0g8T5yQaVSJ4LkaeDmoUb/XWMmXx0nGalaIT
	Ae04wSkeHmBu0+SAC+wZCTx3J6TBc+B3e3LfhMXUVOco9LDOIUhoH/vRPoXlozF/ga4eHkrk2h5
	8G/IQOXoubtk1dQ9vQ6ha1pt7+Sh4V3nLQ/32N1bArqfdhBawErS6D5BnKiYXQBuv8iVzyJoUKX
	+rebX0OGtP8eQw4esCLvl/tpzv7P70QVSIZPg9tRt5/vlj9Gr5BtYuaaR5Wz8f7LP23jYDimcpD
	HHrZX5dgATt0eKImm/Gd5/uBP24=
X-Received: by 2002:a05:7301:4d05:b0:369:535f:4d12 with SMTP id 5a478bee46e88-3751c53edf2mr3716461eec.3.1794326792549;
        Tue, 10 Nov 2026 08:06:32 -0800 (PST)
Received: from server.lan ([168.138.199.194])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3751fe306e3sm8453403eec.7.2026.11.10.08.06.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 08:06:31 -0800 (PST)
From: Coia Prant <coiaprant@gmail.com>
To: Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>
Cc: Jiawen Wu <jiawenwu@trustnetic.com>,
	Mengyuan Lou <mengyuanlou@net-swift.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Heiko Stuebner <heiko@sntech.de>,
	Aleksandr Loktionov <aleksandr.loktionov@intel.com>,
	Fabio Baltieri <fabio.baltieri@gmail.com>,
	netdev@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Coia Prant <coiaprant@gmail.com>
Subject: [PATCH net-next v4 0/2] net: phy: fix PHY interface mask initialization and XPCS usage
Date: Wed, 11 Nov 2026 00:05:52 +0800
Message-ID: <20261110160554.918652-1-coiaprant@gmail.com>
X-Mailer: git-send-email 2.47.3
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

This series fixes issues related to the handling of the PHY interface mask
(supported_interfaces) at the core level and in the XPCS driver.

Patch 1 fixes a local macro in the txgbe driver.
DECLARE_PHY_INTERFACE_MASK_ZERO() incorrectly uses PHY_INTERFACE_MODE_MAX
as the array length instead of BITS_TO_LONGS(), which wastes stack space.
Move it to include/linux/phy.h and base it on
DECLARE_PHY_INTERFACE_MASK() so the bitmap is correctly sized while
still being zero-initialized.

Patch 2 makes the XPCS supported_interfaces mask authoritative. The
generic compat table advertises modes that a specific integration may
not support. The Rockchip glue now builds a platform mask (1000BASE-X,
SGMII, QSGMII) and intersects it with the inherited core mask using
phy_interface_and(). In addition, xpcs_find_compat() now checks
supported_interfaces before looking up the compat table, ensuring the
core respects the narrowed mask.

Note: checkpatch.pl reports "Macros with complex values should be
enclosed in parentheses" for the new macro in Patch 1. This is a known
false positive for declarative macros that expand to variable
declarations; wrapping it would break compilation.

Changes since v3:
- Rebased onto net-next as suggested by Paolo.
- Patch 1: drop the Fixes tag, as this is a cleanup/optimization rather
  than a bug fix.
- Patch 2: move DECLARE_PHY_INTERFACE_MASK_ZERO() to the top of the
  function to comply with the reverse Christmas tree order.
- Patch 2: clarify in the commit message that QSGMII is currently a
  no-op because the core does not support it, demonstrating the
  intersection behavior.
---
Coia Prant (2):
  net: phy: move DECLARE_PHY_INTERFACE_MASK_ZERO to core
  net: pcs: xpcs: make supported_interfaces authoritative

 drivers/net/ethernet/wangxun/txgbe/txgbe_type.h |  3 ---
 drivers/net/pcs/pcs-xpcs-rk.c                   | 10 ++++++++++
 drivers/net/pcs/pcs-xpcs.c                      |  3 +++
 include/linux/phy.h                             |  3 +++
 4 files changed, 16 insertions(+), 3 deletions(-)

-- 
2.47.3

