Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793826483;
	b=ZeOXtiVROAEU9TWPGC+c9EUczc1Uiqk97ydRpveP8k1AmV4OdmL0u0odHaHJQvILNiEa
	 HcarY4fOVg1hkFE2VYkcMMXz4wPqUQbXoh3JvZRbSDaXvqpRCVmRg0fRraDkitxW6swiM
	 5kbkFT7vS53gbg+6CoMJ7alWMh4MwGtlSTPvCrvI0lChHthiffRliIoyae8bzt04BYMXj
	 hzFbrT4y7yjR4WwWQ8PPFRmMfXs7WOSe0iDjVu7WabRHmuckZOKL2nWBp6tYPkc0SMlcb
	 +qAL7TctrZrW9qbXwu7gAB96eOQKLwwx2WVEPTNd0Q10cyAxqmIyzToeI4buBJgBXMA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793826483;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=SCN4KcOv3LJOrCzNOiWE7iHLX1O3uEjOLXKB9dTpo6Y=;
	b=TXQH4ds/8N0gPDX8f3oKMwxZJgDWyQU69k2SNm6fGREs2YeJBfjBiBdG1J2WcpHsdRTL
	 l/x1BbblzhVoaiHyx3UOCf3TBIUCRXSvg5altbhsY1U6ZG2qiIt15CKEZBMKqHK9A9G+A
	 h3FdH/bhW0jE5tcI3lf7MMOsM0DC9N1QIQwTo9rRuwB4ssZ+KXVWHBVJPw874TbUAiPTP
	 1HEwGXgbJ/hpe5e1tYbeEtH9WdZ9+AJfAaMDlQTDLStakiARRuCPeI/p6eiVNZHt+4C+A
	 5Q3vQPV1HCG9h2AHV2lV6qqWPfkxCSd1NWGeZ/dcGY/LBtcczOA8BcPlIBtNbc2LKpw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="WrRds21/";
	arc=none smtp.remote-ip=209.85.128.46
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81251606EEAC
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 21:08:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 81251606EEAC
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WrRds21/
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4a35ac4475dso7915045e9.2
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 13:08:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793826481; x=1794431281; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=SCN4KcOv3LJOrCzNOiWE7iHLX1O3uEjOLXKB9dTpo6Y=;
        b=WrRds21/yz8NH5dHrtg6Ye6/A417PYPG/rLpSM8Liz1xbnChmsfQC/eoZV3M6itHj5
         Ffi9Xz9vjkdDWEarTdEDlJ2zqHWd2BSFwklGj40ikOegG5xHY1mbQ8RymU5ffq5+6RTy
         Xn/l7FHqjcs+khhLcurJYwaVCPBRTF2l2o/Csn6D4eeI3ihfJRl+tL64yoLaz3dAHTpo
         g2JG97J6vACO56MEW9sb+YqijfZ5pzo4s0xzncYB+Lf22mwbPzaaRdMTaIPT/MPSWwyH
         pe8FrpUBwX9C0bQqiTFgptQxsDC4mer7dTvv9yWrp5NEj+ocfpQA1934qCZt4baSi6ZS
         h+7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793826481; x=1794431281;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SCN4KcOv3LJOrCzNOiWE7iHLX1O3uEjOLXKB9dTpo6Y=;
        b=1XKhglmFNgeagauQXv1NrTVO/7BZaTJl3NTD58zfH+w5iW0xOoLeYltCO92VfKeR5J
         YaTNjVRGi0PEjzI0TKNbtex5K6YO+p5SMxIDCWsrDuvkveWVLBXM1aQwxI+HI3KLq05R
         gJlP3vRWwcAzyVa05CVOzhMnS+iiuJYDs943Z1vQ6qc0kxLxo1/10ya7kNkRXvEWqLFg
         0XJMgELIifG5Bm8OZuGUlAXMtKLpmmZxpIi+oSQV9aWTmgCXSJFxic5uG1V84DnaJC58
         68Fhkmg5Q4IzHrV5PZVWw18SmeekoisSESHEeZTIUUjow27jTComR/Yf0oFpxDS6S2V9
         /wxw==
X-Forwarded-Encrypted: i=1; AKwUvBy1o1ZJk7criDoV+EqzrubOJwyH7NobOlslwewAuleeUQcUqa2q/z34cfCXJQbA1hOND4Q3BlX8dkyTy+k=@vger.kernel.org
X-Gm-Message-State: APuU4Z8E/be5Z7mbmY4HiMgcfq6uJ4aDi7P9eDr61fr7BBCSEcrSg2gG
	PRolda7Aa8S4CAB1DJTlZ/pxdkPPMM2wjJs1C4iEKc8bumbjsk8cBraM
X-Gm-Gg: AYBFou2tTnnzKnyW9X8DIkTWv3xsho7w4izo72M1H4bHEUHhlrM9L2GDq23pfOFdq8s
	C63LsDPqkiwis1B6+wpcGC01MM8bHOoatEyR6jQjeK6GWpPQpS4tZ7MukjdFM+xOREwIfbzKPlg
	HhIfTlho+5ir0VZuQXG7en2CasQqatklSaMThAdZ1WaRIlrDHVMt5rGwI8MtUJEjpJncyKrQn4x
	gKWIjJwWuvqME+0Yv5ZJR3vbyS5GHhhZpUMGcsbWc+e3wbaBiijSdXZe5Lo2c8vHca9JDF7q1zl
	v0mCUMihbMDx+TZWGp0FqpFTfO9V8fGHLLsQLFwv3uQYtv/0C42tKgDSF69/u37vJZGeyR9GglD
	byYcKN6jCZUQiaewZVxUWuRUnfV7zjabuN9oNhqecjtG9nwH7Wie88QGWJBbIuY6W3YI2E/f5gJ
	KKzfRYKY61a7fpKeuceaCJL7Y0kL10mW9Ip+dBwF9wnpHSQ3/pe1PQRdE5X54P8hFpK7gS3N6XT
	RGgOho2XhU2vx6ExIKzl7fmOzGL4oHmqryW+Nxoue24UKfGQXcbCnbVjQ4doN7QyiXtS0dFCRwg
	t6jvimlInWCFvPG6qis979DBETL7ELbbVJU5/967iEt5Q3/r5cQ=
X-Received: by 2002:a05:600c:470a:b0:4a1:7e77:c382 with SMTP id 5b1f17b1804b1-4ac16acfe61mr379603885e9.5.1793826480789;
        Wed, 04 Nov 2026 13:08:00 -0800 (PST)
Received: from VivoBook-ASUS-X712UA-M712UA.lan ([2a00:f44:c23:788d:6769:d03c:c916:2aca])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b56e2ae73csm11998855e9.1.2026.11.04.13.07.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 13:08:00 -0800 (PST)
From: Stanislaw Pal <kuncy7@gmail.com>
To: Christian Marangi <ansuelsmth@gmail.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Vladimir Oltean <olteanv@gmail.com>
Cc: "David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Yongzhao Chen <yongzhao.derek@gmail.com>,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net-next v2 0/4] net: dsa: qca8k: fix the MIB autocast and management frame handlers
Date: Wed,  4 Nov 2026 22:07:53 +0100
Message-ID: <20261104210757.467964-1-kuncy7@gmail.com>
X-Mailer: git-send-email 2.43.0
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

The netdev AI review of the MIB statistics series [1] found bugs in
the qca8k handlers of the Ethernet management and MIB autocast frames,
and its review of v1 of this series [2] found two more. None of them
has been seen in production, so as Andrew asked for the related MTU
series [3], this goes to net-next rather than net. All four keep their
Fixes tags.

1. qca8k_bulk_read() falls back to MDIO when the management path is
   not available, but stores register i at val_buf + i with val_buf a
   void pointer, so every multi-register read is garbage: the FDB dump
   and the MDB add/del write the wrong port mask back into the ATU.

2. An ethtool MIB request over Ethernet (autocast) that times out
   leaves the caller's buffer published; late frames write into it
   after ethtool has freed it, and extra frames underflow the frame
   counter. v2 also handles the frames of an earlier autocast arriving
   during the next request.

3. The autocast handler reads up to 164 bytes of counters without
   checking the frame length.

4. The management ack handler trusts the frame for both the length and
   the layout: up to 32 bytes into a 16-byte buffer, read from
   skb->data without checking that the frame has them.

Changes in v2:
- Drop "let regmap serialize register access" (v1 1/3): Yongzhao Chen
  carries it, unchanged, as 1/2 of his net-next v8 "preserve port state
  across MTU changes" [4]; this series does not depend on it.
- New 1/4: the MDIO fallback of qca8k_bulk_read() (review of v1 1/3).
- 2/4: poll MIB_BUSY before the next autocast, as qca8k_mib_init()
  does after a flush, and track the ports seen as a bitmap instead of
  a countdown (review of v1 2/3). The description now says that a
  frame of the previous autocast still queued on the host can serve the
  next request, with counters one autocast old, instead of claiming
  that every late frame is dropped.
- 3/4 unchanged (v1 3/3).
- New 4/4: bound the data of a management ack frame (review of v1
  3/3).
- Target net-next; describe the LLM assistance here and in the commit
  messages instead of an Assisted-by tag.

Testing: the affected objects build with W=1 on arm64. On a QCA8337
behind an IPQ5018 (GL.iNet GL-B3000), kernel 6.18.60 with these four
patches, under tag_qca with the management conduit on port 0, counted
on the conduit: one ethtool -S costs 3 management frames up and 10
down (the MIB_BUSY poll, the cast, the 7 autocast frames and acks);
with the request timeout forced to 0 by a test-only module parameter
it costs 50 up and 57 down, i.e. the register fallback over management
frames plus the 7 late autocast frames, which the handler drops. The
counters stayed monotonic over 2000 such reads and over 5x200 reads
under iperf3 in both directions while toggling the timeout, with no
memory growth and no splat. Under a tagger without management frames
(qca-8021q, OpenWrt) the MDIO fallback of 1/4 was checked by the FDB
dump.

LLM assistance: Claude Code (Claude Opus 5.5 for v1, Claude Fable 5.1
for v2) drafted the code and the descriptions from my analysis and the
review findings, and helped work out the race in 2/4. I reviewed every
line, built the series and ran the tests above. The review findings
themselves came from Sashiko, the netdev AI review bot.

[1] https://lore.kernel.org/netdev/20261019191137.307514-1-kuncy7@gmail.com/
[2] https://lore.kernel.org/netdev/179304303832.3134.328719975361344250@kernel.org/
[3] https://lore.kernel.org/netdev/47e9713f-815e-4caf-8928-a7ec12d0087b@lunn.ch/
[4] https://lore.kernel.org/netdev/20261104120130.48455-1-yongzhao.derek@gmail.com/

v1: https://lore.kernel.org/netdev/20261022192933.384898-1-kuncy7@gmail.com/

Stanislaw Pal (4):
  net: dsa: qca8k: read each register into its own word over MDIO
  net: dsa: qca8k: drop MIB autocast frames once the request is over
  net: dsa: qca8k: check the length of MIB autocast frames
  net: dsa: qca8k: bound the data of a management ack frame

 drivers/net/dsa/qca/qca8k-8xxx.c   | 81 ++++++++++++++++++++++++++----
 drivers/net/dsa/qca/qca8k-common.c |  2 +-
 drivers/net/dsa/qca/qca8k.h        |  9 ++--
 3 files changed, 77 insertions(+), 15 deletions(-)

-- 
2.43.0

