Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=54.92.39.34
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794798646;
	b=TN/NxZ9UXxFmVOsKRhTyglq+B7ghveW9MUy01n2vVw7xwqqQZlXFPxPxYdna1GvbkQN/
	 G2XWY7JMeQcmXBR8/+qM4058rHYZ88sZu8AkJYhszOn5LknfkHKSzkBpfN7htvWA4dOKa
	 TYxo67/KOejMlEhQHrsHOOwsluig6t19jOAsIUrpNGrUoqmDP4hihSkX9gXhn+vv4KJDD
	 VA7AS0evROINWpYuS8GMr/0S8O8B/3QRhev8lHOKY7M1lK6xMSstSNCPYEcpU6w6PDjTw
	 MNZ16veQ/PlDURwgsDn93Bi9jGKOoWTMlFnuNTMBIBHvPKf/nTgAWa5VBoo0mawrRtQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794798646;
	h=DMARC-Filter:X-QQ-mid:X-QQ-Originating-IP:Received:X-QQ-SSF:
	 X-QQ-GoodBg:X-BIZMAIL-ID:EX-QQ-RecipientCnt:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 X-QQ-SENDSIZE:Feedback-ID:X-QQ-XMAILINFO:X-QQ-XMRINFO:X-QQ-RECHKSPAM;
	bh=dcHg9dDG9rGiE77LkO2AMF7X6VJM2cN20sOJdtGTmww=;
	b=L7RjQP8pqoDTx0QtLgrDrtNHSVsQ36x2X7S19snX7Q/K6WQWi+xVF1LIrhhB6U7x6w/W
	 HGKx7KSqsUvqp+F4MbgmdeK//SqeY5atib7EhBGmCiqbEsDLB8O7S40qZEPlEKVKWgfjz
	 yXTV/oDI9yL3JC4I4ZJVyZfrfFog/XfaHZm8x8ee8QM62BypohwzK9cul4rAyjUnsKmiW
	 WTBrNmSG33g1TpogwDl9cr5U95vJ7wxV9B0/ki65g+RF9PX42IVhxT+sWHVSP/XhZq1nh
	 VWJW24gxAOsSUvozgVXsjnl9pLjJJ2b2bddWXUhu/eJHeWui3yUOvmdTrKcTrHNp+jw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=mucse.com;
	spf=pass smtp.mailfrom=mucse.com;
	arc=none smtp.remote-ip=54.92.39.34
Received: from smtpbgjp3.qq.com (smtpbgjp3.qq.com [54.92.39.34])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB7D5606A323;
	Mon, 16 Nov 2026 03:10:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EB7D5606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mucse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mucse.com
X-QQ-mid: zesmtpsz9t1794798563tb9eb3508
X-QQ-Originating-IP: F4xlWzjrtbULJWfvi/PGVfWeQknFmYGrajYRSl3Y6/Q=
Received: from nic-Precision-5820-Tower.tail7b ( [203.174.112.180])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Mon, 16 Nov 2026 11:09:21 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 17076663165220972437
EX-QQ-RecipientCnt: 10
From: Dong Yibo <dong100@mucse.com>
To: andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org
Cc: linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org,
	dong100@mucse.com,
	yaojun@mucse.com
Subject: [PATCH net-next v2 0/5] net: rnpgbe: Add basic management and statistics
Date: Mon, 16 Nov 2026 11:09:17 +0800
Message-ID: <BD205A7832D36E7D+20261116030917.1329989-1-dong100@mucse.com>
X-Mailer: git-send-email 2.50.1
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
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpsz:mucse.com:qybglogicsvrgz:qybglogicsvrgz3a-1
X-QQ-XMAILINFO: MGIHRVWp0RD3LnDoI69HIrrVWz7II9D9M7/AOQA/6XqJBgyj8kHYUlnb
	9VWCzcjy8sYWebhdk+82OkevPmV6ifmMnd75jDRBnydD3sS7ao2EwxUfEnl+TW5NLDmfI1+
	5cyi/wnbHuQMsUaTZ2ZS/hILwJyzMBuRNTBkmJ1UX3PZsMnZimA5+IhifS07RYP+RCdBkpz
	tyKevrl+zhxHNb8NldJl/Q38TG9SUsHhVp5UZ1wzAjSWgsIKDOpkyN6PNel8VG6Q9i42g+z
	na7QvkG8Urfq+Z7gpA9zTfGx9C9hbXeSscSYw/PMjMopXa3pzoe3tGkZcpgM0PLBgDMNaYe
	GgCkdVQYU4b1VMYgzTC7UOz2nwZVPiYGfh7tAHzDHDGfDPuD38t3VTTMyekALdxvA/tKha/
	mm9iOan3u6WXCcOVeYvpNve9N+rVp/yTBFpBRjP1PCRUSKWoYi/mvnjhy6LeyiOE1vsz2Op
	IsfdM8n5gFZDp7RF9rKsNZnY36i/GTF4JMRlweWsl+WwXWvTPCi5GA/gjfZYAdQQshezpNi
	7BXOVkp6+Da6Cgs75U6ltrS/Dt61aIjnNYlj8sY3xN0MH+cCrfMeiUnJsNqE8dMltEyd2/v
	LmkhyDlh7OH66VU1nTM2ekBidn5Q4hMWK8mOsCne6Fz75zurJ4C6fVSkb6nMvxNTdBazakt
	+1So/u7tg9klxDOk566b14/6GTE2Z2w7IHOHYiGEku0+l82xXeE+0G8+2fze7bDriz/OnA7
	FoCU9yDf0RdDOeePrqI8jgLk9RxWfwRFgYHmTqh6oK4kQEY8BSyWA+An8cbPLtijWAwNVFd
	JIdVy/bJxhfT4r4p60At/3AWbnelBiW34aY9bpTk+XO5Ha6xrLC+bvbufaUqwVArKkm9ddk
	85b6U1t9JNLXa/k2OrA/ixkDGV6UDGKhWhLZW4tBvgYfy7YDxMemcuKZ4m1Abw/ezFa0n9M
	QXqocUMJA3g9OQ/yQ5wlfJsMnKiJ+Geopq5GmkMM/yklFyJKEvJrROdELSJ75fhR1gXs7Br
	glYkpSyqkLltcClD0D5ey3pOZpJWCcn8+/eSLxH30RAzOU3bPHnLYEC5KEOTg7stcwm+5Ub
	uwqOkY+EhsJIac+4Bd5pnd9Z7XkiogsborGcwcSSvF6UMhebvMc/tc=
X-QQ-XMRINFO: NyFYKkN4Ny6FuXrnB5Ye7Aabb3ujjtK+gg==
X-QQ-RECHKSPAM: 0

This patch series adds basic management and statistics support to the
RNPGBE driver.

The series introduces:
- Basic ethtool driver and link information
- Link settings reporting for copper, fibre and backplane ports
- Copper autonegotiation, speed/duplex and MDI/MDI-X configuration
- Primary MAC address changes
- Hardware and per-queue statistics

These changes allow users to inspect and configure the adapter and
monitor interface and queue statistics.

RX accounting follows the documented definitions of the two interfaces.
rtnl_link_stats64 includes good packets received by the host, including
those subsequently dropped by the driver. Netdev queue statistics count
packets successfully passed to the networking stack.

For example, an skb allocation failure increments rtnl RX packets/bytes
and rx_dropped, but does not increment queue RX packets/bytes. The
pkt_byte_sum selftest compares these totals directly, so its equality
check cannot hold after such a drop.

Native tests using the driver's RX and statistics functions verified
both accounting paths and reproduced this difference. The extracted
pkt_byte_sum function rejected the resulting counter values as expected.

Tested on N210 and N500 copper ports with firmware 1.1.8.0,
using an external module in a VM running Linux 7.3-rc6.

The unmodified stats.py selftest reports four passes, three skips and
one failure per device. The failure occurs because the driver does not
support the channel configuration query required by
procfs_downup_hammer.

Additional tests passed for link configuration, MDI-X, MAC address
changes, queue statistics, multicast counters and concurrent statistics
reads during interface down/up cycles.

LLM assisted with development, testing and code review.

---
Changelog:
v1 -> v2:
[patch 2/5]
1. Report an empty advertising bitmap for fixed fibre and backplane
   ports, while retaining their supported link modes and port type.
2. Document the firmware MDI-X status encoding.
   Remove the unused MUCSE_LINK_MDIX definition.
[patch 3/5]
1. Reject changes to the firmware-selected port type and PHY address.
2. Validate and cache requested copper advertisement settings even when
   autonegotiation is disabled.
3. Reject nonempty advertisement requests on fixed non-TP ports.
4. Document which parameters firmware ignores depending on autonegotiation.
5. Explain why runtime PHY_LINK_SET uses the event-coalescing mailbox
   transport.
[patch 4/5]
1. Mention open-time Ethernet address validation in the commit message.
   No code changes.
[patch 5/5]
1. Skip hardware sampling while the PCI channel is offline. Validate
   all-ones counter reads against the DMA version register and preserve
   previous snapshots and totals when sampling fails.
2. Fail probe if the initial hardware counter snapshots are unreadable.
3. Use %d for the signed queue index in ethtool statistics names.
4. Update the commit message to describe the final statistics semantics.

Links:
v1: https://lore.kernel.org/netdev/FB722C2F25FE9005+20261106112420.43050-1-dong100@mucse.com/
---

Dong Yibo (5):
  net: rnpgbe: Add basic ethtool support
  net: rnpgbe: Report link settings through ethtool
  net: rnpgbe: Support copper link configuration
  net: rnpgbe: Allow changing the primary MAC address
  net: rnpgbe: Add hardware and queue statistics

 drivers/net/ethernet/mucse/rnpgbe/Makefile    |   2 +
 drivers/net/ethernet/mucse/rnpgbe/rnpgbe.h    |  24 ++
 .../net/ethernet/mucse/rnpgbe/rnpgbe_chip.c   |  51 +++-
 .../ethernet/mucse/rnpgbe/rnpgbe_ethtool.c    | 255 ++++++++++++++++++
 drivers/net/ethernet/mucse/rnpgbe/rnpgbe_hw.h |   3 +
 .../net/ethernet/mucse/rnpgbe/rnpgbe_lib.c    |  28 +-
 .../net/ethernet/mucse/rnpgbe/rnpgbe_main.c   |  21 +-
 .../net/ethernet/mucse/rnpgbe/rnpgbe_mbx_fw.c |  38 ++-
 .../net/ethernet/mucse/rnpgbe/rnpgbe_mbx_fw.h |  26 ++
 .../net/ethernet/mucse/rnpgbe/rnpgbe_stats.c  | 241 +++++++++++++++++
 .../net/ethernet/mucse/rnpgbe/rnpgbe_stats.h  |  37 +++
 11 files changed, 716 insertions(+), 10 deletions(-)
 create mode 100644 drivers/net/ethernet/mucse/rnpgbe/rnpgbe_ethtool.c
 create mode 100644 drivers/net/ethernet/mucse/rnpgbe/rnpgbe_stats.c
 create mode 100644 drivers/net/ethernet/mucse/rnpgbe/rnpgbe_stats.h

-- 
2.50.1

