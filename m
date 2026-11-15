Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=185.203.200.13
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794740404;
	b=G8+wd0KwOuxk7tvYWbbt0FHJVRliYKPCoxgBKbmYnK2r548po/MwsE5LVnAa0Knse+eW
	 gQE5FgB7e7Y1N4wC6wjTghQg15V/XA9Fro6ZibVRfAlx7FvxyYNwe6YYJtXSEtnNN7iJR
	 joNyAvhIk9gPQHzpzf+8mIqQpkR3f4POjWVkMmkhQ7WyrG7Bct2PKGI1thEcN6l6iYXh1
	 6rHoiBm1nDbmR5kHE4gJavwVvNjVwvL7H1DSqjGci1/ugRyvz2uv7YwxjJUQzWjuHyk/3
	 2eZR/GlMMqpHsKwG5L1JIAFSITPMbpqU90OK8dtDwdwHh7bgLNdH6Y9y7H1KgNbu6TQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794740404;
	h=DMARC-Filter:Received:DKIM-Signature:Received:From:Subject:Date:
	 Message-Id:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer;
	bh=LtmlJvUbQ592aIiDIVTjSIo3oVF4ToVnnkK50kWsL3I=;
	b=MLag+bOAAxMaLqFJul3Kh4LH7WSdqa77QDpkuwWCTEKgWKQk5pqKCU9u7sN7fiUu2WgN
	 YcPcW9Ac04lg81tU6Zj+juc3Jh2NxP1h2r92dJJyW5b3Mq026YQjm0D3aV6jfalgWRjNu
	 gmAshHxIPUMAtlpJRWgniewSoq7obO9aPKCqPv0VQrPwJ5nMZwOIo7IWA/q/pAAbQs6p0
	 sz7Xg0Cmo6Ov5vrp4w4UPbzIZLVc/PXZ7HzKqvqeiNrkLGj4ftTFWo1dcWibCY7lTHtzr
	 guEG5yzmUg+j+cG9DXxMm7MGM0i4Ac7hPj6S4A0SYmUgJ4WZlt3JXWhMyDapvHL4n5g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=pengutronix.de;
	spf=pass smtp.mailfrom=pengutronix.de;
	dkim=pass header.d=pengutronix.de header.i=@pengutronix.de header.a=rsa-sha256 header.s=20260414 header.b=M6YSqRWI;
	arc=pass header.oldest-pass=0 smtp.remote-ip=185.203.200.13
Received: from mx1.white.stw.pengutronix.de (mx1.white.stw.pengutronix.de [185.203.200.13])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3ED7A606A32E;
	Sun, 15 Nov 2026 11:00:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3ED7A606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pengutronix.de header.i=@pengutronix.de header.a=rsa-sha256 header.s=20260414 header.b=M6YSqRWI
Received: from dude04.red.stw.pengutronix.de (dude04.red.stw.pengutronix.de [IPv6:2a0a:edc0:0:1101:1d::ac])
	(Authenticated sender: relay-from-dude04.red.stw.pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id 2031C201E6E;
	Sun, 15 Nov 2026 12:00:01 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1794740401;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=LtmlJvUbQ592aIiDIVTjSIo3oVF4ToVnnkK50kWsL3I=;
	b=M6YSqRWIjDWtcLYmoYg0kZobaE7CBRkcbkY95io+fDXiC50iOruknbgub5pafbaqfonOWi
	ZJ4S3wKIro7Wow/5L+eVLk7Ix0UGKO9BZpVmtv9zac4DrMVchF+KXaMk9hTpLx2R7VSmMy
	+ABrhJVuwNFK1Z4GRTHP+VTRLl3DVy5bG40HNmFJytcEbZ19QIOqp9it/D/jS5a/HyxVFW
	zTEKd44pqg5WUXxIMcXco+l/2vJfu7R3evUxQGIoUvQSrEFqVpDilLw4jO24mZ/p0oHT39
	/b7Bf+rD9OZHOAmbFolCZr/dTTZece1LHyutOB7mFodSWBIFq0JtqFmLBPbd9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1794740401;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=LtmlJvUbQ592aIiDIVTjSIo3oVF4ToVnnkK50kWsL3I=;
	b=AJYp61lbZoABt8maoYaZwGpwHeJgisEP7b42GYGmOOJTJgw1IQfsmPq4b+wRbSFSxLE1JD
	VZ/o04idHQmrRs8nDZkogrrWJ10Xhtt4Tp2QNbHTn9vkMF7JogkH0W6qZcuUD7sb/y3AXR
	ZcTC8Qd/jyTqy2CzscLuEZQNXijNaU/FIYAX9ndqBOsfHXUORjdUTy1IJWWJssM2B6vz6N
	Ff275YXUfTNOTqLu2sZChkywW0wZ9IgE/mdvFzC+zBXij8wJsHaXdIrpVNOmv0j8XpXI8L
	pMb9K27Lnic8MJHLCW3qg0kaJ7sD4u12BJN5RcGKiTCFecoPZeDEqDgX0gVUOw==
ARC-Seal: i=1; s=20260414; d=pengutronix.de; t=1794740401; a=rsa-sha256;
	cv=none;
	b=TOplhY0pY9uj9vlu3+j0qUio7fqyrW0YW5Me+IyfQyyt+9aMqx2TPkDcnkrf6Lq75y7tGL
	Dv6JOcbLDDFTagtMgF8C+F14WeBY+xIzkPMQlEhkBzGw+VOaREVJnGBq3VY/ajIAbIDfRI
	LqkOYYOtxyuAon1DuGKCUIpwHzG/JtYaoeIPhFGed7pDuTC5tl6ndylKWEtrR9oS86ueXR
	se8Dz9BZltFjEhu84FRUnN27JMRtRpvJH0MEk87L1tDXXnCU2SqBt7WweeSEAcVR7TYLQp
	j1hlCOws5yE2tfzSVnvLoIKSuVa0qVEuKSeDoImfPehP+cNvXf/XKXPZWJCobQ==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=relay-from-dude04.red.stw.pengutronix.de smtp.mailfrom=ore@pengutronix.de
Received: by dude04.red.stw.pengutronix.de (Postfix, from userid 1058)
	id 04C78381553; Sun, 15 Nov 2026 12:00:01 +0100 (CET)
From: Oleksij Rempel <o.rempel@pengutronix.de>
Subject: [PATCH net-next v2 0/3] net: dsa: make a shorter bridge ageing
 time take effect
Date: Sun, 15 Nov 2026 11:59:50 +0100
Message-Id: <20261115-ksz-stp-ageing-v2-0-7af27320033e@pengutronix.de>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAKaQ+WoC/12OwQ6CQAxEf4X0bJVdBdST/2E8FKjQGArZXQlK+
 HeB6MXjZGbezAienbCHczSC4168tDoLu4mgqEkrRilnDTa2qTHxHh/+jT50SBWLVpjFCVF6Oto
 TJzCXOsd3GVbgFZQDKg8BbrOTk2fMHWlRL8CSem7wl9g1JLr0a/Ghda/1T29Wynf68D/dG4zRF
 jYvMmuykunSsVbP4FqVYVsy3KZp+gDSS5se4QAAAA==
X-Change-ID: 20261103-ksz-stp-ageing-705aa69829e5
To: Woojung Huh <woojung.huh@microchip.com>, UNGLinuxDriver@microchip.com, 
 Andrew Lunn <andrew@lunn.ch>, Vladimir Oltean <olteanv@gmail.com>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Simon Horman <horms@kernel.org>, 
 Arun Ramadoss <arun.ramadoss@microchip.com>, Jiri Pirko <jiri@resnulli.us>, 
 Linus Walleij <linusw@kernel.org>, Florian Fainelli <f.fainelli@gmail.com>, 
 Vivien Didelot <vivien.didelot@gmail.com>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
 kernel@pengutronix.de, 
 =?utf-8?q?Jens_Emil_Schulz_=C3=98stergaard?= <jensemil.schulzostergaard@microchip.com>, 
 Oleksij Rempel <o.rempel@pengutronix.de>
X-Mailer: b4 0.14.2

During an STP topology change, the bridge lowers the ageing time so
that stale FDB entries go away quickly. When the change is over, the
bridge sets the configured value again. On DSA switches, both steps
can go wrong:

- On a KSZ9893, ksz9477 does not apply a shorter value at once. Patch 1
  fixes this.
- The DSA core can keep the short value after the bridge has restored
  the long one. Patch 2 fixes this, and patch 3 does the same for a
  port that has left the bridge.

In a lab test on a KSZ9893, I cut one of two redundant paths while a
station sent one-way UDP or raw Ethernet traffic. Without the series,
the traffic stopped for up to 56 s, long after STP had converged. With
it, the traffic came back after 12 to 15 s, about as long as STP
needed to converge.

One case is not fixed. The last port of a bridge in its DSA tree may
leave while the bridge has a shorter ageing time, for example during a
topology change. Then the switch keeps the short value until a bridge
with ports in the same DSA tree sets its ageing time, or a port in that
tree joins a bridge.

The patches carry Fixes tags. They still go to net-next, because
patches 2 and 3 change the DSA core and affect every driver with
.set_ageing_time.

With patch 2, sja1105 reloads its static config once more when the
bridge restores the ageing time.

To check patches 2 and 3 on a KSZ9477-family switch over I2C, read the
ageing register from debugfs (<device> is the I2C device, for example
3-005f):

  dd if=/sys/kernel/debug/regmap/<device>-32/registers bs=15 \
     skip=$((0x310)) count=1 2>/dev/null

The ageing time in seconds is bits 5:3 of the first byte times the last
byte. For example, in "0310: 55450096" bits 5:3 of 0x55 give 2 and 0x96
is 150, so the ageing time is 2 x 150 s = 300 s.

Without STP, after a boot (the comments give the register value):

  ip link add br0 type bridge stp_state 0
  ip link set lan1 master br0
  ip link set lan2 master br0
  ip link set br0 up
  ip link set br0 type bridge ageing_time 1000    # 10 s
  # 0310: 4d45000a (1 x 10 s)
  ip link set lan2 nomaster
  ip link set br0 type bridge ageing_time 30000   # 300 s
  # with the series:      0310: 55450096 (2 x 150 s)
  # without patch 2 or 3: 0310: 4d45000a (1 x 10 s)

With kernel STP, start again with a bridge that runs STP, here with
forward_delay 4 s. lan1 and lan2 need a link to peers that do not run
STP, so that br0 is the root bridge:

  ip link del br0
  ip link add br0 type bridge stp_state 1 forward_delay 400
  ip link set lan1 master br0
  ip link set lan2 master br0
  ip link set lan1 up
  ip link set lan2 up
  ip link set br0 up
  # wait until /sys/class/net/br0/bridge/topology_change reads 1
  # 0310: 55450004 (2 x 4 s)
  ip link set lan2 nomaster
  sleep 30
  # with the series:      0310: 55450096 (2 x 150 s)
  # without patch 2 or 3: 0310: 55450004 (2 x 4 s)

Tested on a KSZ9893.

---
Changes in v2:
- Link to v1: https://lore.kernel.org/r/20261104-ksz-stp-ageing-v1-0-2c2bc7217dea@pengutronix.de

---
Oleksij Rempel (3):
      net: dsa: microchip: ksz9477: apply a shorter ageing time at once
      net: dsa: ignore the old ageing time of the port being changed
      net: dsa: forget the port ageing time when the port leaves the bridge

 drivers/net/dsa/microchip/ksz9477.c | 41 ++++++++++++++++++++++++++++++++-----
 net/dsa/port.c                      | 13 +++++++++---
 net/dsa/switch.c                    | 17 +++++++++++----
 net/dsa/switch.h                    |  1 +
 4 files changed, 60 insertions(+), 12 deletions(-)
---
base-commit: 6964ff21c5d8b75649211a52dbfd92753e605649
change-id: 20261103-ksz-stp-ageing-705aa69829e5

Best regards,
-- 
Oleksij Rempel <o.rempel@pengutronix.de>

