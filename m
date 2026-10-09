Received: from mail-dy2-f7.google.com (mail-dy2-f7.google.com [74.125.229.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E74FB4F402E
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 20:14:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791576901; cv=none; b=Y9G98aacgZOQtBjNfEvrmuWVu5/olh/04AwcNZ21kJm/OeKp9dao9eLvj3vMLUccxqKZ3ayZAee/584lja+viRvwPDxPquFXJDcz9QbtCsy32amIxBnL49R7a1TPttiBsqUNwpe3XpulwS6tnKT0WWZjWUeKAltXIdCCNabYmVk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791576901; c=relaxed/simple;
	bh=vpSF9E5Y5ggCXdC7ttEalv4ViwRw4eLOK1WsVdCM0zA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=XyaHOSHmGKJFcmguL6lLpDtbqlXguJ3FjpBcFXm3nJ79E4xORRdTRxDFGqZa3CZ4pRgcbH/dxvl8GYuM1Xl5pOsomxyAzlC7QhrB971crllhTb3+mVrj8ZqVjaKMs0v1M5gZCrx646vEJw/Eppxm0QSXv23jakElW5jwxVmD3a4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=blockcast.net; spf=pass smtp.mailfrom=blockcast.net; dkim=pass (2048-bit key) header.d=blockcast.net header.i=@blockcast.net header.b=a1Cz1glg; arc=none smtp.client-ip=74.125.229.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=blockcast.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=blockcast.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=blockcast.net header.i=@blockcast.net header.b="a1Cz1glg"
Received: by mail-dy2-f7.google.com with SMTP id 5a478bee46e88-33e5ae86ff2so25040eec.0
        for <linux-kernel@vger.kernel.org>; Fri, 09 Oct 2026 13:14:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=blockcast.net; s=google; t=1791576898; x=1792181698; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=KuoCU3FLzxs/pxFBGf8JxfZ2rnZfcXeJRrZEEpqh2s8=;
        b=a1Cz1glglQv8QVzt/iZmiN2PIa2CgLjBfceB6vszaePmSc1UQqg29TCvtDKzjzvgrl
         YoVFVBYiz3Mo3QVF88n1sKCVg2wDoeidKlPVWhGbQ7y1ualcwRqNgRRqcWYLEmYPgV3f
         9Uk9xE/OQHU+2c3ppYIJCt1GuSQpyYVXSArtHG8TzYzpV91y1J1tV2qHPS7XeetnJzI9
         PutZ/244e0O7b6ukm89Jdv0lAaANLtNhhlFenWFBWJyNhH0uOtcy7HgTfKIQfJ/lB6/V
         YAaDNv92zIEtLdiCY1YS+Yb1ZS8kT3phGrlcqyUe5vU1pyS/vtWuInbp5k4pO67XGHeK
         fPPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791576898; x=1792181698;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KuoCU3FLzxs/pxFBGf8JxfZ2rnZfcXeJRrZEEpqh2s8=;
        b=kU9DLUhvXmgL7LDt5LCipyfQrFIndVh+oEBI2wf/KKferJbL3IXlWee2w6nNeR5dD2
         l6rXm3lCd0pLeHs2Y32meUHR5pdsilZkddNVqpVv1L3vvV2UGX2ewQUVG/PzKzvUMdC4
         TWlTkGyEvivL5eNQACLUyTypTlWBU7Mobo66dKb+kHDzjyqJ7x5RcYCcgQdf3iUYvr62
         kiYlNyRi3IEemz1L08FkiiLsy2xfJE/uAreHgyWkM4mJ4EKo0bAvLzR13km0QO+6T3Yx
         yaILX+9jIvTfUhBhy6wsG1s/Yk85rQd2iotfQz5tmgQN6brd/0eH6hxJQN1xSA3mJte1
         FZ+Q==
X-Forwarded-Encrypted: i=1; AKwUvBzPdL6iZ+lmKctIOXSXnn8Po+ViInUe09aPl4FdiEZPcF5qAjNrLvc4DMmCupB4Ib76OouN3VXzoKmXpwo=@vger.kernel.org
X-Gm-Message-State: AFuF++mFToE3c5ry9IBWFsgAYvGgsPYHSyYiD2adt51BIW2QDN70WT1Y
	QhI0cHcmKslQp6uzDi3a6Ec8B04ME5nKkoAbQzcE4KWP1sYtADVut2aAvkdTYjUfYrM=
X-Gm-Gg: AYBFou34laud58a46VLiF2y0Hc8D82N5nD7nG0CzKwlXDiw14rSXcNEh9VeNjE6ZjdZ
	yI41KtVDhJ+7m93YcbXQpnAPq8reyC26TwYzPMmEBwn2w4SYGR4zaXFHt5asuTUUvpKXUPhsfdH
	FmF5nQ5+VxXsGYuln6GefsXUIU4OXhaorhaxzhl/NeGfFcIFgRbNxNdHxVR0vIphDL+3Ox/8/lV
	SWJoPQKgCjQMmfISXaMUdQTxQi3McX8g1hc1tm2yYKw0Upbwa3Nm6l+dSs3Wv6tFkK/FaHdkE0h
	VdEZFtnWtQ4r1SBbyL7B9+ubXDmjGR58SW9TvIJdGN1dCgcRltJSJmjk4z7oq5iQ94F/AZCJDEU
	2cRT7SLHpI8K7lc6Xsaah0UyAjOxqwMXyW3eosvpkBz21RL4R5hSYxKo5NMdHP4vr0DAUcAp0dt
	S5CvGyajQkUUy5tfX3itUPa6G/BvjSyIw/yYk6frkJtcnmjvoba0omKR+LiXb0dBWYccekc7BNv
	cdCa7p60d40Wqg4b5dqdSLA90C8F5ASwSkIaS5B
X-Received: by 2002:a05:7301:408b:b0:351:31c7:ab1d with SMTP id 5a478bee46e88-3537df95584mr5251326eec.16.1791576897822;
        Fri, 09 Oct 2026 13:14:57 -0700 (PDT)
Received: from devbox.ts.blockcast.net ([2602:f74d:1::32])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3537ca329d9sm8994643eec.5.2026.10.09.13.14.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 13:14:57 -0700 (PDT)
From: Omar Ramadan <omar@blockcast.net>
To: Taehee Yoo <ap420073@gmail.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>
Cc: netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Simon Horman <horms@kernel.org>
Subject: [PATCH net v2 0/3] amt: fix relay tunnel keying and unauthenticated-Request DoS
Date: Fri,  9 Oct 2026 20:14:51 +0000
Message-ID: <20261009201455.1904698-1-omar@blockcast.net>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series fixes related problems in the AMT relay in
drivers/net/amt.c. The relay creates and mutates per-tunnel state in
response to AMT Request messages whose source is never validated, so a
spoofed-source flood exhausts the tunnel table and reflects Membership
Queries at arbitrary addresses. The same code keys tunnels on the source
address alone, so two gateways behind one NAT collide.

Reported privately to security@kernel.org first. The security team
determined there is no memory-safety exposure and no embargo is needed,
and asked that the fix be posted here in the open with Taehee Yoo in Cc.

Patches 1 and 3 carry Fixes: cbc21dc1cfe9. Patch 3 is the core fix: the
relay now answers a Request statelessly (it computes the response MAC
and emits the Query without allocating a tunnel) and only commits tunnel
state once the gateway echoes the nonce+MAC in an Update. A spoofed
source cannot complete that exchange, so it allocates nothing.

Testing: booted net at commit 6d25ffca055a ("cipso: adjust cached
option offsets when removing CIPSO") plus this series (arm64, QEMU via
virtme-ng) with CONFIG_KASAN=y, CONFIG_PROVE_LOCKING=y,
CONFIG_PROVE_RCU=y and CONFIG_DEBUG_LIST=y on top of
tools/testing/selftests/net/config. amt.sh passes all six tests,
including both forwarding-torture cases, with no KASAN, lockdep or RCU
reports, and debug_locks stays 1. Every case completes a real gateway
handshake, so this exercises the stateless Request path and the MAC
check on Update. drivers/net/amt.c and include/net/amt.h are unchanged
between that commit and the base-commit below.

A companion change bounds the number of verified tunnels admitted per
source address. It adds a new netlink attribute and so targets net-next
as a separate posting, not part of this series. One note on its default:
a per-source cap closes the non-spoofing exhaustion path (one host, many
real handshakes) that this series does not, but a low fixed default is
wrong behind carrier-grade NAT, where many independent subscribers share
one public address and would be refused past the cap. The net-next
posting sets the default accordingly and documents the CGNAT case; this
series does not depend on that cap and closes the spoofing primitive on
its own.

Changes in v2:
- Drop v1 patch 2/4 ("amt: send the relay General Query directly
  instead of via dev_queue_xmit"). The same fix is already in net as
  commit afae89de73dd ("amt: send the relay's General Query directly
  from the receive path"). v1 was generated against v7.1 and did not
  apply to net.
- Rebase onto net. In patch 1, the port check uses the header fields
  that amt_update_handler() now snapshots before the pull. In patch 3,
  the Query senders keep that commit's tx_dropped accounting and take
  the destination by value.
- Redo the testing on net. The forwarding-torture subtests now run to
  completion.
v1: https://lore.kernel.org/netdev/20261008003606.3666617-1-omar@blockcast.net/

Omar Ramadan (3):
  amt: key relay tunnel state on the (address, port) endpoint, not the
    address
  amt: make pre-query report drops visible
  amt: do not create tunnel state for unauthenticated Requests

 drivers/net/amt.c | 266 +++++++++++++++++++++++++++++++---------------
 include/net/amt.h |  11 +-
 2 files changed, 185 insertions(+), 92 deletions(-)


base-commit: 37f12441f557468a56c1e27790413aa78c82afa2
-- 
2.47.3

