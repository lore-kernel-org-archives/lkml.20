Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.229.136
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793654720;
	b=knUonThFycKB1u3w/jeKrcR117cxfrTo0jFvV2MJi+jGTckex2SMaDDcrwJGWikC+Q+x
	 goKeQGuy7f2p3GIbC0IRdX2UOFxAVXALtmV8XCgjtX8IqHnMiudoqHPtFsv0eP9kO7RmX
	 E6D+NJJZc/bTlp9XPHNswvp4NeRWV7er5grQBb41ghOrQSwImrN5AydvEv133xyqtE8Aq
	 aK9XX1VWsYFW1njPfvf3s8U80ZP1DwmvgAQg0s/6Gp81JFpE9NG/cnHFilrPaaaDX8+IY
	 ufCSUP/eTXp+PY4nwGXrBq8UHJghi/z9hSJIY32WggQ1qujNT1sD1Ml++lsCdZcdDDw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793654720;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=h4Pf0yuMbG7VmbL6qh5TPaycUsxMKNE4IhWYVqEHmlg=;
	b=jOOzmzc4+f20MLjV58Nf08jZtHQaJxU5dFtAGaEPhx1qOHj6x9aFoYhNLw2xON/yTPAa
	 0C1vwmhLsFJxTAIOWf+4ygG62zlJrGV+jBS0KKKWqAmRY/5GJA0XEtusCdsP4OD3pLPnS
	 5fjZeUZhb33IpVObzf6PmfrQNg3HW/fAI0abY7g9ga7LcROTo5cl0HrLhK+WnUvLOfDVL
	 uOXl3o4mtBqJD9Vvtsvp3P5RTVcy39SuS6+0ONSzLv4xBXmRb0kckB5Sh90z7eRSpaSXr
	 OeW1o2JKgUqXxsbBiBSagbBVzR1BzfAnJfjVwTAXWHvqYmt/esxWTgjC2T1DKCNFalA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TfsHWPJ1;
	arc=none smtp.remote-ip=74.125.229.136
Received: from mail-dl2-f8.google.com (mail-dl2-f8.google.com [74.125.229.136])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEC5A606A324
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 21:25:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AEC5A606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TfsHWPJ1
Received: by mail-dl2-f8.google.com with SMTP id a92af1059eb24-1379d236149so1383815c88.1
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 13:25:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793654719; x=1794259519; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=h4Pf0yuMbG7VmbL6qh5TPaycUsxMKNE4IhWYVqEHmlg=;
        b=TfsHWPJ1n68z8xUUlj2uRPFXLeIhHK13XYNQ1S2qUKwSsUQ4aSJYSFehqgo+FwK1kV
         qf+0VLvKWBqNqbM0feaXatX/jVAM0C/YicvoOlJ6UqRHkB2uLjinMaiJK2GMzJm1LWu1
         iuCNRt/8AdAJFf+vDRDysHLhEMGfZKMyJJ83y8CXlJzCvgEs6AXuhWXb4JF7Eemj7GTA
         WotZucqDedMBpThanrOi8haFUlbUlWyUnvwrXNg9GykDngCmwm7IG9D2X+0X4JJQz1me
         aGqAUrb2V2WGP0lk4M1SDxsnZTTqE/hhXXIZktMHiEowexUBqG6xJxRQHDgINMlgUmYP
         BEAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793654719; x=1794259519;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=h4Pf0yuMbG7VmbL6qh5TPaycUsxMKNE4IhWYVqEHmlg=;
        b=cxB68i3ANp1CaTQMWBip6JrOgE9hJ9n3Loo5Ftw+2rJiHgmjQC5ZK3vgOlmYhxaQuM
         1YKRj3AABamcjR8gKl6ICQ7gqUGeHegpVDsG2gWRQBEdmCtksC431ftWODwlkPaQqYy8
         tkFiYZsRwZus7NPGyiEPPYxVz+2ZNoZVI27Zow8bjy/wrDmiSCTvBdAYWEsDomzA37/U
         hzMpoiU/VXU6DkONRCJJTixeW5HJJfdjQV5if1w/Lvkv7gxTpMi9WzQtb/yO6taOxlG2
         ZwBsz7gmu+FxmolUyEDwiCie4qUcL+Sd650R6Yv4aBi9SS7TrjiaQWiJMKonsCPuG5hh
         NL0w==
X-Forwarded-Encrypted: i=1; AKwUvByWyQZOLkA4yWm9Dh+GlAhWq1v90Od1TtINYQpWbbvrKSa3RkcEN4GPXdNSJEb12TuHCe50mBePkne67LY=@vger.kernel.org
X-Gm-Message-State: AFq9FYJQUhB/3jRsuUrN/2VHFgDPl1kvQEvHLx1PHkELYYmYQmp3zSW5
	UZv9MI2msDta7410QxAFotRgvxSr5TCEiYvd2uyqRKizwkZIRwK7YXaz
X-Gm-Gg: AYBFou0pwV9RuoeRnM6YOLDwKKWiilEcqYmnj2NA084OXrQPz+cTGiJXuh9C0tlp07x
	uHqQWde1IPutiercMZ8lhiPztTcFcFuKfpOrP4vH3iDjso6cygYqQlXhA7T5HkyZzr+aeV/eLP8
	P5eCh65A7GKwkeTxNFgcVpB3iNvckoiqPyCHKrjtOiPZCvZlTp/hthKHBK8RjHk3Rqk8KD+8ZDh
	2RsXnaBzZFHdYB/2fOFPNpP7rpCFgsvUJmbTi2bfa0nwCqtE4GieUEdwGR5YJ2DTyM6S2TUsfh4
	f0LGs1hZ9bsCXHdcYpRury7kQ1Uk+tIbYZcF9nH0Gb8Do+C10dxGLghV9GnEyptx17BI2HVoql4
	bvMqmUHZf/n0ess0kdFd0nb4w634bdnfxzM/zm0pXrQsf2Ule8ufiULEv5I450Riw4viPNgKZct
	Va3ZM4Lk6ReykJH+Qg35obN4V2P1MomiY/L6rdm/VfVktIGTJBWZGcC6h+FHyPFedpfPK/J9e0n
	LqzvTo8kdWzXKastmuL47BdOaAxOvrvUvD1sC3fVniEzCuxeP8Prj89DGQcDfgf9snFYs/dU9M1
	y+vCG9YXg9+FqVbiUkLvfKbXz0E=
X-Received: by 2002:a05:7022:3f04:b0:19f:527d:96da with SMTP id a92af1059eb24-1ac5da7b145mr16079436c88.33.1793654718619;
        Mon, 02 Nov 2026 13:25:18 -0800 (PST)
Received: from server.lan ([168.138.199.194])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a428fa380sm37195851eec.12.2026.11.02.13.25.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 13:25:17 -0800 (PST)
From: Coia Prant <coiaprant@gmail.com>
To: Jakub Kicinski <kuba@kernel.org>
Cc: Jiawen Wu <jiawenwu@trustnetic.com>,
	Mengyuan Lou <mengyuanlou@net-swift.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
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
Subject: [PATCH net v3 0/2] net: phy: fix PHY interface mask initialization and XPCS usage
Date: Tue,  3 Nov 2026 05:25:04 +0800
Message-ID: <20261102212506.3348537-1-coiaprant@gmail.com>
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

Changes since v2:
- Patch 1 (new): move DECLARE_PHY_INTERFACE_MASK_ZERO to core and fix
  the array size calculation.
- Patch 2: advertise 1000BASE-X, SGMII and QSGMII instead of only SGMII.
  Intersect the platform mask with the core mask using
  phy_interface_and().
- Add Fixes tag for the XPCS patch.

===

This series fixes issues related to the handling of the PHY interface mask
(supported_interfaces) at the core level and in the XPCS driver.

Patch 1 fixes a hack in the txgbe driver. The local
DECLARE_PHY_INTERFACE_MASK_ZERO() macro incorrectly used
PHY_INTERFACE_MODE_MAX as the array length. Move it to
include/linux/phy.h and base it on DECLARE_PHY_INTERFACE_MASK() so the
bitmap is correctly sized while still being initialized to zero.

Patch 2 makes the XPCS supported_interfaces mask authoritative. The
generic compat table advertises modes that a specific integration may
not support. The Rockchip glue now builds a platform mask (1000BASE-X,
SGMII, QSGMII) and intersects it with the inherited core mask. In
addition, xpcs_find_compat() now checks supported_interfaces before
looking up the compat table, ensuring the core respects the narrowed
mask.

Note: checkpatch.pl reports "Macros with complex values should be
enclosed in parentheses" for the new macro in Patch 1. This is a known
false positive for declarative macros that expand to variable
declarations; wrapping it would break compilation.
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

