Received: from mail-dl1-f49.google.com (mail-dl1-f49.google.com [74.125.82.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E93324676D
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 06:06:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791525995; cv=none; b=Ewwlk6CQVvWD1OrUqKszWWpyzdwsTD/OI6doJ123nRjqwBCvrMb1tKtcIppdo89EoMehNhKHaMQFNU98MRm/6hr860cOJv6WWUr9L59Dxsk1dTo9GmjJyKYoxoz37awWcwpKiaf7myr44s51Fu5bQbmVD1N5s4SLRitUsvJ+wbM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791525995; c=relaxed/simple;
	bh=HdMdiMCe3MKVqlaCIyB0c2RfvFNaLGy9nwclIDSQHRY=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=MOkeR+cW5Vca/IVJzQlKHlYffC7OlQzQp8Br2Y4bhurRfMhD95bWXEpyvGXbsaHMeScfhZRLGV/aYfFyWNXPu6+eih3dqiJmyc1hIlL4JrPriy0ZISNX7fRrXDzwPYC2lb4InFU4qtFLGoN11SyOm7L57GNgQfSqTO4o0ZixHdk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jLJhTOz2; arc=none smtp.client-ip=74.125.82.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jLJhTOz2"
Received: by mail-dl1-f49.google.com with SMTP id a92af1059eb24-141395927feso6305996c88.0
        for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 23:06:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791525989; x=1792130789; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=pb4Xp4D0s8TBdd/O2D9YrmHfrZaQPX0yAvwKrkVsb5Q=;
        b=jLJhTOz2h4odG2H3v/UViuNyPp0oQubMwQKAzLqER/g8krzcFx+MbI4HhhDbzbspJT
         REm81gvRV+a4KdZfqenjCITSZ3FCJ7JqGlYVwsP5jqssc3v5K2PiMRWpyYVB/SOReYXR
         YbIuc+QugoemaN52mmD5+Y+vqgTvicl/S1YnGYiFf4aCzN0bXDPQpUa9vFX4MoLRlM74
         g8QZ6vGml/eAEtQuOC6801SWcZnkEfcOqO/4UJtzHD9fYJRpQ3clQy2DbNaSWffafMwv
         KxEXyHe5WgGF5sq97/af5SkjnVDIR4UtgtTY7+S2XwFJ/WATqJoBOOPGuMgkEOSLYqAW
         9TBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791525989; x=1792130789;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pb4Xp4D0s8TBdd/O2D9YrmHfrZaQPX0yAvwKrkVsb5Q=;
        b=VRhBbSoZyM71GqE05slNqpbpvA+pmXWgyFCXUNfV5jLzAGoUkAHNfuSx5SEmTRau3+
         lQh1zAS4krzv98Skgs5mwEcQE7QXvld/GGNYiwu8dvVeM6loLp2Gl2RsPfgJR8lC/L8I
         dLbZ+P38aqwFzqkoRx6JUQTCNswFg0hret3jZdejPTnWMUoJcpkUNeBvfup3rvz6p4Kd
         fKDY9dvd6XgZeN73atrF4TtdQdLUhuUa7KfGJsAxZgKAn9xZLmLgrcjX6ttErSAXBXfL
         vw3JBRNEYplYQwtTqFqvHaxURAbscA0kgLUUF9YEmnnqlvSlN+TeRBzX7ET5sqjqGqnw
         yYTw==
X-Forwarded-Encrypted: i=1; AKwUvBxDaKyjeMzQu7Dj+wrSaF63G6L6CBkYQlr+Uu2jzcMfR2kOZw+mmokU7rtMNvW4IBgMFkXX+MX9mmwWEJg=@vger.kernel.org
X-Gm-Message-State: AFq9FYKx42dFFn2LyE3ovBqvqGSStjMMw+bxBIlQxwEBzfrMHi1HOJpj
	hqj/l5vsuPY/gIA3dj29HTQE3oUsTkRT/tuA/ZLIeCRGvy0cRcmtafUf
X-Gm-Gg: AYBFou3Bg8jr3jLYy72AQscKkHLcMoJDo4lfPZXDtnT3roB+uVe8Vv2CtHnjCefUylR
	RfqrZq/+mJfMoOW00kZZ2P1jyoyaauKcPnxaIYuafggcEOuhl5spSTaC9u//v3xNssnbVEjnPzD
	gZiHdLIobXqekYJjr2VpakDnXI/7JB5HIxFWnsmwQnWWGs+4pPEqK5V9+rpShil4B8mRU0GHFDo
	epf20xbSNs1hbj47MPXhIK9s/1VeTgdTMORftpOskiIpAhiKBrJQqmoll1O+z53DI6LrrzMW/AP
	cljjVJG8H7wsNOPRGXu5rlP2EN5OsmWFvAgzO9BRXosGxXxy4M2Rn0NEVJ7EY2lFiL7GrsEvgsV
	TBK/PiZqYv/1qPN9ZnCxz2s5RkGSSIsNurHWUkwsZvdvucWcyOcnaH1h4MpmoJuWpMEJD3YB7FE
	vyxqQJYPcTJMcqJ0IODWPqWGCd6uO49RMBDJ4y9qYsCY1/cumktWGa286h/80XvTOib2MHGrrH9
	+Y522UJNGdLQCsC0uBcaQOeORE9WViTfKtP8InJWLw/Um7WHvt10jjNgp1RL2HLTY729MV0yzJw
	sL9HfSl4QBCgy3prKB4lp1+Owy+14TjMolKdN9mNI2s=
X-Received: by 2002:a05:7301:1522:b0:351:6b56:6627 with SMTP id 5a478bee46e88-3537e0f5b7bmr1520841eec.40.1791525988955;
        Thu, 08 Oct 2026 23:06:28 -0700 (PDT)
Received: from ramen-dev-security-2.asia-south1-c.c.ramen-dev-345017.internal (90.156.200.35.bc.googleusercontent.com. [35.200.156.90])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3537cb6a2afsm4185544eec.31.2026.10.08.23.06.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 23:06:28 -0700 (PDT)
From: Anil Kaushik <anilkaushikwireless@gmail.com>
To: Pablo Neira Ayuso <pablo@netfilter.org>,
	Harald Welte <laforge@gnumonks.org>,
	Donald Hunter <donald.hunter@gmail.com>,
	Jakub Kicinski <kuba@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	Shuah Khan <shuah@kernel.org>
Cc: osmocom-net-gprs@lists.osmocom.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: [PATCH net-next v3 0/3] gtp: ynl spec for the GTP netlink family, a reply-command fix, and a selftest
Date: Fri,  9 Oct 2026 06:06:12 +0000
Message-Id: <20261009060615.4177402-1-anilkaushikwireless@gmail.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This respins the RFC "netlink: specs: add genetlink-legacy spec for GTP"
(netdev, 2026-10-01) as a patch, and adds a driver fix the spec exposed
plus a selftest that uses it.

While writing a ynl-based selftest for the existing gtp family I found
that the GET and dump replies put the genl family id in the command
field instead of a GTP_CMD_* value. libgtpnl ignores the command so it
never mattered, but ynl rejects the reply as an unknown command and
drops it. Patch 1 fixes the driver; patches 2 and 3 then describe and
test the family.

Patch 1 sets a valid command (GTP_CMD_GETPDP) in the get and dump
replies.

Patch 2 adds a genetlink-legacy ynl spec for the gtp family
(NEWPDP/DELPDP/GETPDP/ECHOREQ). Description only, no uapi change.

Patch 3 adds a selftest built on the spec: it creates a gtp device, adds
a PDP context with newpdp, checks getpdp lists it and delpdp removes it.
It skips when the kernel or iproute2 lack GTP support.

Changes since v2:
 - selftest: add CONFIG_GTP to tools/testing/selftests/net/config
   (kept in sorted order).
 - selftest: move gtp.py to its correct alphabetical slot in the net
   Makefile (after the gre_* entries) and mark the script executable.
 - selftest: add docstrings to the three test functions and main();
   ruff check is clean under tools/testing/selftests/net/ruff.toml.
 - selftest: move GtpFamily before PSPFamily in lib/py (import and
   __all__).
 - Patches 1 and 2 are unchanged from v2.

v2: https://lore.kernel.org/netdev/20261008181031.4129029-1-anilkaushikwireless@gmail.com/

Anil Kaushik (3):
  gtp: set a valid genl command in PDP context get and dump replies
  netlink: specs: add genetlink-legacy spec for GTP
  selftests: net: add a test for the gtp netlink family

 Documentation/netlink/specs/gtp.yaml          | 170 ++++++++++++++++++
 MAINTAINERS                                   |   2 +
 drivers/net/gtp.c                             |   4 +-
 tools/testing/selftests/net/Makefile          |   1 +
 tools/testing/selftests/net/config            |   1 +
 tools/testing/selftests/net/gtp.py            |  85 +++++++++
 .../testing/selftests/net/lib/py/__init__.py  |   5 +-
 tools/testing/selftests/net/lib/py/ynl.py     |   8 +-
 8 files changed, 271 insertions(+), 5 deletions(-)
 create mode 100644 Documentation/netlink/specs/gtp.yaml
 create mode 100755 tools/testing/selftests/net/gtp.py

-- 
2.25.1

