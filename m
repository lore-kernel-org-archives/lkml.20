Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.208.142.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794820702;
	b=l1G8BnMrJt3SHXqr+StLuGnBebbAIHorBmFZWSEnCsLE3XETU453MiRZi+8l9ENz08kd
	 AD1PJvSQEaVQPMjXFOcp/AuXg7L8E7xaFKcKVYxS/3ochPmDSi/St+20TbgIj0jEM+HRA
	 wX4dsFw1jDs1/vFAhl+8mz71FICrqs7jsBkJ3fmFg/yoscy+r0HXfZSQnioIQXQHpOJrS
	 Ct4hZYsU5t3NUVxMuIEimYkL/jAMx97HmTcW3zoFoCUDSkFPjmc8g3HXbGjW8w0WfH24M
	 YP+nIGW0tCGyzNtYIFKR/IzuKvWXd+qcOb9+dNnzKV4tE2izAj3G9KRnshsOK0W5Q9A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794820702;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=826ov78qP2Q842fxa0PM5ff12xaor6OwKbs+ThG4sQU=;
	b=A8zjT4OH7VG2Osvakg4lfqmRn75qnwzlgvIPjldv1bIjz4B2LndZfIaAelkjyomuMICI
	 /4udoUsZnKyv8StKl+5ZZ903n0Gzd7QpeINJ7tDOLqnbbmfmip+x9xi4VvD09LVpIoeo8
	 sojvHX5UzrpMY5chpCC6nGjBmmi4gOQ40YxzexjfpGuypLpmRnyCnQ4qIkOCX3rriAvPx
	 1RRFCm+bSUiOpFua7BX9wowWf2yIG7N1bR3inoT9DfcIc4Hp/V3oZwcA7QtyXAN5Ut/yZ
	 ALG+Mw+P8jJB2OmzYPD92LWMrmmTqmcExukYU7xq2MDxlRK+5hbdj4VpXlcW1iNLYCQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=kernelriot.com;
	spf=pass smtp.mailfrom=kernelriot.com;
	dkim=pass header.d=kernelriot.com header.i=@kernelriot.com header.a=rsa-sha256 header.s=kr2026 header.b=5yV8kMQv;
	arc=none smtp.remote-ip=74.208.142.49
Received: from mail.kernelriot.com (mail.kernelriot.com [74.208.142.49])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A234E606A32A;
	Mon, 16 Nov 2026 09:18:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A234E606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kernelriot.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernelriot.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernelriot.com header.i=@kernelriot.com header.a=rsa-sha256 header.s=kr2026 header.b=5yV8kMQv
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernelriot.com;
	s=kr2026; t=1794820695;
	bh=hb1SHra0c6oIUSjdOL0+vPjC+s/ft/oax5PM5+83JJs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:
	 Content-Transfer-Encoding:From;
	b=5yV8kMQv/8FxyufwLKZ77hp0BU0b1fkPO9lw71ihg8vRK/3gcLrJtYf9e9Yg343di
	 /LXbwuJYo5FQKZm7Tbueio+q6svMS9Pwuee8Q2QpxDQieo/nF0Wat8f5sHQnHmwaAi
	 8yW1T8t2Jc01eg25WF4AhS5Azb4SmRjBuS4nMhOPd1jhFBOJUg1JK5sX34fk+qmtV2
	 uX5o1n+NJL6PGIOBh40am7WmBGv3KRy8/PSTvZoLtSiW8rZLyviIaye42GJYJIcTGp
	 5aLc9qKIu/7D/SoV6pHwOHy2GQ5+8RecuaPPSWyU0FZomsK3xucol/O19XB8bcroxG
	 GWWTf4veYllBQ==
Received: by mail.kernelriot.com (Postfix, from userid 995)
	id 19C268D74E; Mon, 16 Nov 2026 09:18:15 +0000 (UTC)
From: Magnus Leatti <magnusleatti@kernelriot.com>
To: me@ziyao.cc,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Giuseppe Nespolino <g.nespolino@gmail.com>,
	netdev@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net-next 0/2] net: stmmac: dwmac-motorcomm: shutdown hook and Wake-on-LAN from S5
Date: Mon, 16 Nov 2026 06:17:55 -0300
Message-ID: <20261116091757.1656602-1-magnusleatti@kernelriot.com>
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

The YT6801 accepts "ethtool -s eth0 wol g" today and then ignores magic
packets once the system is powered off. This series makes S5
Wake-on-LAN work. Both patches touch only the glue.

Patch 1 adds a shutdown hook that stops the device. The glue has none,
so the MAC and DMA keep running into reboot and kexec.

Patch 2 arms the chip when powering off with Wake-on-LAN set. The
sequence follows the vendor driver, with two differences that come
from measurements on the test board:

 - The function stays in D0 instead of D3hot. With MAC Wake-on-LAN
   phylib keeps polling the PHY until power is removed, and in D3hot
   that poll fails with -EBUSY and warns from phy_error_precise(). It
   happened 111 ms after D3hot on a normal power-off.
 - Bit 9 of LPW_CTRL is not set. The chip wakes without it.

Every write that is left was removed once to see what it does: without
OOB WoL or the packet wake bit there is no wake. Without the MAC
address rewrite, or without the 2 ms wait before it, the chip wakes on
the factory address only.

Tested on a Celeron N3350 mini PC, net-next at 6964ff21c5d8:

  net-next  wol g                         no wake, 3 of 3
  patched   wol g                         wake, 8 of 8
  patched   wol u                         wake on unicast, 1 of 1
  patched   wol d                         no wake, 3 of 3
  patched   wol g, interface down         no wake, 1 of 1
  patched   wol g, power/wakeup disabled  no wake, 1 of 1
  patched   wol g, reboot                 reboots, link back, 3 of 3

A second board, a PSJ8500-N97 mini PC (Intel N97), behaves the same.

This series does S5 only, on purpose. S5 wake is the important case
and it is not implemented. The change for it is small and stays in the
glue. Wake from suspend and hibernation has a larger blast radius.

Giuseppe, this is the OOB WoL enable you and Yao discussed in the
s2idle thread [1]: it is only enabled when powering off, because only
a chip reset disables it again. If you can try "wol g" and a power-off
on the Slimbook, a laptop would be a good third board.

[1] https://lore.kernel.org/netdev/apSDPwF49Z1Zd0kJ@pie/

Magnus Leatti (2):
  net: stmmac: dwmac-motorcomm: quiesce the device at shutdown
  net: stmmac: dwmac-motorcomm: support Wake-on-LAN from S5

 .../ethernet/stmicro/stmmac/dwmac-motorcomm.c | 84 +++++++++++++++++++
 1 file changed, 84 insertions(+)


base-commit: 6964ff21c5d8b75649211a52dbfd92753e605649
-- 
2.56.1

