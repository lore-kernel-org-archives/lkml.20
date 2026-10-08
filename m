Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBE9F33CEA5
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 02:28:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791426522; cv=none; b=u6vo69e+s6eaniQM7V7odzUh8+QxFhzB+z+oMI02adDTMlfUGzqOtvowzFvE62f+nAfDPG9UYibaXn+FbAcEAcAkSePcTm7dDsi9rRBnbA3069HcdhueVaToxlpyWBrsEI0JRqPId6A1T1o4XkiPhzu4n5aFOsWlOAbLJZSueoQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791426522; c=relaxed/simple;
	bh=pJCcvTykfNBX4OcOIfs+L/ELsHjM37PhVPLQgZLGoKc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=QWg9BDTy8gx1dNZDY4Zg3wr3ElbLunU4LEXt0Ccb7z5OoJo86tjgfn5hddUouZHH5lLl6yxZg4ZppHchSX0WPjSJEq9vP90xO/hTPtCNqzn0PSAeldwgDxzbc79cxqtyhX3GzYHG3tgsmyaNZPzzdK++LF0SmeZPhmp2dVclzxc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=g8bUAgYv; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="g8bUAgYv"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2e7e742a2c7so1701085ad.0
        for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 19:28:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791426521; x=1792031321; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=MwahjYlmNg5Sb7TImh0bCwCphihNsrlCradydgL/hSk=;
        b=g8bUAgYvUY1cSrIHQrLmGj+aXyvUoFGrUvIxL3wjuZUcVPMm3KveIridAPoFndt5j+
         e9MZm6s0KPBSoA3TMFYwaO1kHW7fKmV+BNOFq3mf3pUDN10xFjyn0rbRQ5u9YnP5uZWn
         k5aayMHWYgtP1ipgTAS0uYIWi03aEmP9yTs7KAs3kAHynoFFsbSGBLY0MKVtlA5Pp0Ll
         yZGyzQ9lQ7+Sqq1mIpYu8rxO9q30qXeiazn95KtSPnzQSxhXHicDCdXaKKWN1yVzxKjP
         zI4SVmdtXg0LFrJTdTBpseYiRcTYNqU8SO+fJIoVLaREL5BTigklrzzWFqgx5q8/hAFw
         u6iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791426521; x=1792031321;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MwahjYlmNg5Sb7TImh0bCwCphihNsrlCradydgL/hSk=;
        b=KH9+yKDSO+p/eENH3EGzevyw9mo2WuduK+kSj9CZ20rRPcyH7jnPh2ZS+zNz3YAQcE
         /XmmaG0NiV/JiekO8B1psSGiHmMsBcI+zQOpU0HvQGSJZKcGxgaYxAj9MqseXX0ZGPnO
         6f7ICaBXzOio92b89QvyVx12yFQztudpMBkF9nx+3SahkxNc2ApvZTGingCITlpydBpF
         rCAnZc94jKDSHraiMd/c2XIMsbVwZG7cNL5yzMeS1xsQy9p/6xCA1ojWQL5Wp+H2iiTp
         Jsbcrxnku7zBwf8LmtMbZX5K3o6rk6QKSuzJvZZjxaRfwQDkXhCqT0E0ajnjrwpljEGl
         IIyw==
X-Forwarded-Encrypted: i=1; AKwUvBwx5Oj9SSGAgv0GxVnmGY0UdlrRcONEt/ohTgaEAmzAyVikyjFk/qkP6FKJpkIK5sUuO3T/fBYSwhTlkkY=@vger.kernel.org
X-Gm-Message-State: AFq9FYKDvm1U8GYh4lWB9YTW8OtsE39aua6EO6VjLKwzBNXu/Gx5bhfb
	ClyMtgNQtbKXqd+YtpPBQdnJpOEsAGnmgo8gKWVKeoyKU0FMFL0JFCkL
X-Gm-Gg: AYBFou3xy7ea8cfqNQ4EV6E4cM3Lxf36migvrUeLwMZNUqOCbcPOCrRydzx6akX7TKp
	retD89dT2vp2wu7Aa4lHdVDlCxp/1xPjJrTWuDPBahZazQNc8d10DlQPLo4PcvW4qHmIak0CFTj
	RjKrSzH2G6Vx3yNQyDYdZ/rx0IFOjj6nsOw5X0hBWF4fySEYEVMKTHNdk2tt5y1w7WTpZ4xrOQ6
	xcWBW5+Cur52s18cxs9zbZoc2ErMMAY04omVVvrLnyvLrAtgsJvj9u0cqQLz13JzBRX6j8UY476
	aZS3/Te53GU3dm8AGkmVmH9nmK4SM1a5l80pIDZaSdnuek44CHraKLDtoSsf2tESrH1/LCHk8Es
	8hi6uGXb+S1lzH+//jc6TUzQVTC6e5j+XIkjzJL7o4IpBaOnIO32vp4cF0xTPrAhzT5BB0UMKoq
	0WoG4PYVnCK2DpCAWI+W5cGvnc6CWFIQa3g27AKCq2H1yeUhVkbd1VzlbtytcklJ10DZRa0/u2L
	oC16ZgT3lARuyZIC+Ry0gP6Jg==
X-Received: by 2002:a17:902:eb8d:b0:2df:375f:b7ee with SMTP id d9443c01a7336-2e7ffde9b3dmr5405065ad.18.1791426520826;
        Wed, 07 Oct 2026 19:28:40 -0700 (PDT)
Received: from d.home.yangfl.dn42 ([2a09:bac5:661c:1246::1d2:d1])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e60482cab0sm18045865ad.50.2026.10.07.19.28.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 19:28:40 -0700 (PDT)
From: David Yang <mmyangfl@gmail.com>
To: netdev@vger.kernel.org
Cc: David Yang <mmyangfl@gmail.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	=?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Ciprian Regus <ciprian.regus@analog.com>,
	Andreas Larsson <andreas@gaisler.com>,
	Jian Shen <shenjian15@huawei.com>,
	Jijie Shao <shaojijie@huawei.com>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Parthiban Veerasooran <parthiban.veerasooran@microchip.com>,
	MD Danish Anwar <danishanwar@ti.com>,
	Parvathi Pudi <parvathi@couthit.com>,
	Roger Quadros <rogerq@kernel.org>,
	Mohan Reddy Putluru <pmohan@couthit.com>,
	Runyu Xiao <runyu.xiao@seu.edu.cn>,
	Simon Horman <horms@kernel.org>,
	Jacob Keller <jacob.e.keller@intel.com>,
	Stanislav Fomichev <sdf@fomichev.me>,
	Nicolai Buchwitz <nb@tipi-net.de>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-actions@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net 00/10] net: Move setting of netops to fix crash
Date: Thu,  8 Oct 2026 10:26:42 +0800
Message-ID: <20261008022656.3592191-1-mmyangfl@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Commit ded86da4bbb7 ("net: ethtool: relax ethnl_req_get_phydev()
locking assertion") put a netdev_need_ops_lock() check on the
phy_attach_direct() path, in phy_link_topo_add_phy(). With
CONFIG_NET_SHAPER enabled netdev_need_ops_lock() reads
dev->netdev_ops->net_shaper_ops, so any driver that connects a PHY
before assigning ndev->netdev_ops now dies with a NULL pointer
dereference at probe time. The breakage showed up in v7.3-rc1.

ibm/emac was hit first and fixed by commit 7c9f391ec89c ("net: emac:
move setting of netops to fix crash"). These ten patches apply the
same one-line move to the remaining in-tree drivers whose probe path
attaches a PHY before filling in netdev_ops:

  1. hisilicon/hisi_femac   (crash reproduced on hardware)
  2. hisilicon/hip04
  3. actions/owl-emac
  4. adi/adin1140
  5. marvell/mv643xx_eth
  6. amd/au1000_eth
  7. ethoc
  8. aeroflex/greth
  9. ti/icssm-prueth
 10. microchip/lan865x      (attach happens inside oa_tc6_init())

Only patch 1 was reproduced and verified on hardware; patches 2-10
were found by source inspection and are neither build nor boot
tested.

Note that ti/netcp_ethss and cavium/thunder_bgx attach a PHY to
netdevs that never get a netdev_ops at all (dummy netdevs), so they
cannot be fixed by reordering and are not addressed here.

David Yang (10):
  net: hisilicon: hisi_femac: Move setting of netops to fix crash
  net: hisilicon: hip04_eth: Move setting of netops to fix crash
  net: ethernet: actions: Move setting of netops to fix crash
  net: ethernet: adi: Move setting of netops to fix crash
  net: mv643xx: move setting of netops to fix crash
  net: au1000: move setting of netops to fix crash
  net: ethoc: move setting of netops to fix crash
  net: ethernet: aeroflex: move setting of netops to fix crash
  net: ti: icssm-prueth: Move setting of netops to fix crash
  microchip: lan865x: move setting of netops to fix crash

 drivers/net/ethernet/actions/owl-emac.c          | 3 ++-
 drivers/net/ethernet/adi/adin1140.c              | 3 ++-
 drivers/net/ethernet/aeroflex/greth.c            | 3 ++-
 drivers/net/ethernet/amd/au1000_eth.c            | 3 ++-
 drivers/net/ethernet/ethoc.c                     | 3 ++-
 drivers/net/ethernet/hisilicon/hip04_eth.c       | 3 ++-
 drivers/net/ethernet/hisilicon/hisi_femac.c      | 3 ++-
 drivers/net/ethernet/marvell/mv643xx_eth.c       | 4 ++--
 drivers/net/ethernet/microchip/lan865x/lan865x.c | 3 ++-
 drivers/net/ethernet/ti/icssm/icssm_prueth.c     | 3 ++-
 10 files changed, 20 insertions(+), 11 deletions(-)

-- 
2.53.0

