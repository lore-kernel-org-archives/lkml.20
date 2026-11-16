Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.10.208.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794843059;
	b=kcJ6joc7Sy5I9D9vs4XtrSWfjCFCsonJFiqPuN/OaG4m/8Uy1442y3ZZomSkg05L//1o
	 YvBk0uFlPD7mEWzQAVNM+3kIktXFZ1SgCmrdf2lL4DPqqiWEOFxm8nIORkAOk/aFjerC1
	 4oL/ZbHr7EerJfTj69RZ04jrh6YJMmN9/83FmB6xkk23kNSLQMabOepjnPcbTTDl4u2Hk
	 +NW/IvG0Q4sV2GFICPkaLPM4K+Ln3i0fXkSbhAX0bhXrEaQMA70XqEtYYHR53H+BobjTf
	 SHkfwoevacRD/YPJD2KDl4wn1qceds10cH/yTHluNJbNUXjT8EiSR3knvMQYKGfnQ1Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794843059;
	h=DMARC-Filter:Received:DKIM-Signature:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 X-Rspamd-Queue-Id;
	bh=CDG2+kMw+A8LdS/UvHCT6L9ztc9obDz1MKuAv6+QT7s=;
	b=IhsWBy15HzdIJw9tfer1w28JbWPRFRutYMnBK323DqCKTGss40yLFsq1D+uMoNIozdkF
	 B2W7bNL6Z22WCnHu9pRBlIGlzyTMuG3DKUB9SL+EUBsr8eYz4CUZWAoubUXOycjaZUtaP
	 WgXV+PPlXcZvKhxz5SHY2Q+WPKw/CDXJ6QyWFTTX65pYOSk5+EMntdscrDbcHZXN1FD5A
	 NN1bgU1Vy2Q+7z3dsU6H6tREfJ716G/r4JMAPzZo5lRRR8AywU3m77A3r1o71PwUgp69h
	 yk0f3OFmpCvwJh+scgRkEZ+Zx0j60wiv+tRtSRvrHpKO8XGCFXRlxVrw/z6nLWP3TtA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=mandelbit.com;
	spf=pass smtp.mailfrom=mandelbit.com;
	dkim=pass header.d=mandelbit.com header.i=@mandelbit.com header.a=rsa-sha256 header.s=MBO0001 header.b=gE+671EV;
	arc=none smtp.remote-ip=195.10.208.42
Received: from mout-b-112.mailbox.org (mout-b-112.mailbox.org [195.10.208.42])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B94E7606A33B;
	Mon, 16 Nov 2026 15:30:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B94E7606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mandelbit.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mandelbit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=mandelbit.com header.i=@mandelbit.com header.a=rsa-sha256 header.s=MBO0001 header.b=gE+671EV
Received: from smtp1.mailbox.org (smtp1.mailbox.org [IPv6:2001:67c:2050:b231:465::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519MLKEM768 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-b-112.mailbox.org (Postfix) with ESMTPS id 4jSsJT00SYz5wlN;
	Mon, 16 Nov 2026 16:30:49 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandelbit.com;
	s=MBO0001; t=1794843049;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=CDG2+kMw+A8LdS/UvHCT6L9ztc9obDz1MKuAv6+QT7s=;
	b=gE+671EVtghWrZBCjDOxY/ecGHlbCPQ+wGkzJCOHk0bxqQr3m8U0XyXkjtfc09TD1uM1Rp
	RYACVf22Ge9rcyGI9BH+ET6qllSddgxUOz7F6hzk5tfCFc9eDUXIGtMC3utQjUWvo4bI43
	GGepx+n9U+/FbvTTb8jHA15vrbO4xlohzIlDO+w0ZPStbcRVBt1cSXH+cMVzEnNt1X62yW
	UXRM3Fg93Lvl0i3p1g0PT0FlO7+3K3CpDNUtPnOAzGEnxKOUCdbwgTi4Fd5IrOVpbVWiaM
	IwjFsG4JtTXvX/w1NyyN6ETvKtINRrLYv5aOta0YEvRTVIBWd8ERMtIzjD4N+A==
Authentication-Results: outgoing_mbo_mout;
	dkim=none;
	spf=pass (outgoing_mbo_mout: domain of antonio@mandelbit.com designates 2001:67c:2050:b231:465::1 as permitted sender) smtp.mailfrom=antonio@mandelbit.com
From: Antonio Quartulli <antonio@mandelbit.com>
To: intel-wired-lan@lists.osuosl.org
Cc: Antonio Quartulli <antonio@mandelbit.com>,
	Tony Nguyen <anthony.l.nguyen@intel.com>,
	Przemek Kitszel <przemyslaw.kitszel@intel.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Kurt Kanzenbach <kurt@linutronix.de>,
	Joe Damato <joe@dama.to>,
	"Yan, Zheng" <zheng.z.yan@intel.com>,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net v2 0/3] igb: fix runtime PM resume issues
Date: Mon, 16 Nov 2026 16:30:36 +0100
Message-ID: <20261116153041.3002666-1-antonio@mandelbit.com>
X-Mailer: git-send-email 2.56.1
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
X-Rspamd-Queue-Id: 4jSsJT00SYz5wlN

igb can be runtime suspended when the link goes down (with
power/control set to auto). Resuming it calls functions that need RTNL
without holding it (patches 1 and 2), and devices that can't signal a
wake-up are suspended anyway, so their port stays down when the link
comes back (patch 3).

Tested with the 82576 emulated by QEMU.

Changes in v2:
- patch 1: keep setting the queue counts in __igb_open(), only skipping
  them on runtime resume (Sashiko)
- mention the tested hardware in the commit messages

v1: https://lore.kernel.org/netdev/20261113105835.3821433-1-antonio@mandelbit.com/

Antonio Quartulli (3):
  igb: fix RTNL assertion when resuming from runtime suspend
  igb: link queues to NAPIs under RTNL after runtime resume
  igb: only allow runtime PM if the device can wake up

 drivers/net/ethernet/intel/igb/igb.h      |  1 +
 drivers/net/ethernet/intel/igb/igb_main.c | 69 ++++++++++++++++++-----
 2 files changed, 57 insertions(+), 13 deletions(-)

-- 
2.56.0

