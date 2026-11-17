Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=185.203.200.13
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794920543;
	b=SWVoypI2c0wNZ5P9bnyM1E45AGnH3A5kCi3tReOxNzvXx20ty8dI+kuk4xyXB/whYsSJ
	 eO5fj3TqxO4btlA/5NY8QCjGec21bTuKaBEwS8dmTV19eqP/vpnRFOyuiwMeRkYoBgIe9
	 eyw81XHIfRxdvftPqyk0aRtoRs7zRAfsMcwHBdK1nbS7ejmAXc7fNeBbE3UIaQdln7rew
	 AoQoJcJXGXmAa3ceX3ogKR9Cn6Vh7xttPHqAmZCfIdmVqyy3rGE8RQPVX0K1bc3DBkai0
	 4PBc6/K13EFCRj7TrQ3JkXISb7BkX/0Rg48VF+wX48+ykUs6U25ZURqjqzhQBx/F2yg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794920543;
	h=DMARC-Filter:Received:DKIM-Signature:Received:From:Subject:Date:
	 Message-Id:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer;
	bh=V6bFgtqLLSexV794EZ1sdh+46bO9VjBalhkVgSjPsS8=;
	b=5T+zGKpcEJg7vJB7DYjILZMQtYap1VLViKtmY9X4TaNf92mNtqI6leBo2BqYt70G04nh
	 0Cxr0UeIUe1CVb2qafDk8IY689VSv5DuqogyiT/F/vL4M035dHCa7Y7/bcSg0Rcq9W2QG
	 sFE1bYL3xzF6J9iig/xCagpP5CKU/cPJXtmua7aZjtBzApaK0yZQRotiC+ZAR+U4VRGug
	 rA1uFdlYkj7QmphGq8vJT7Z1PBK6Zm1fv4yDdnIZ0DvQ4MtARXfVTQzpI4FwZIx9cI2sr
	 bOZkgAze7SGAlTJ1b8QlwbZOk63V3L3zoVrV8vah9r1YNM7ie8e48fmUXFzqk80IZrg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=pengutronix.de;
	spf=pass smtp.mailfrom=pengutronix.de;
	dkim=pass header.d=pengutronix.de header.i=@pengutronix.de header.a=rsa-sha256 header.s=20260414 header.b=YC6ZCi0o;
	arc=pass header.oldest-pass=0 smtp.remote-ip=185.203.200.13
Received: from mx1.white.stw.pengutronix.de (mx1.white.stw.pengutronix.de [185.203.200.13])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 812AE606A31C;
	Tue, 17 Nov 2026 13:02:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 812AE606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pengutronix.de header.i=@pengutronix.de header.a=rsa-sha256 header.s=20260414 header.b=YC6ZCi0o
Received: from dude04.red.stw.pengutronix.de (dude04.red.stw.pengutronix.de [IPv6:2a0a:edc0:0:1101:1d::ac])
	(Authenticated sender: relay-from-dude04.red.stw.pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id 7BF212058D7;
	Tue, 17 Nov 2026 14:02:19 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1794920539;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=V6bFgtqLLSexV794EZ1sdh+46bO9VjBalhkVgSjPsS8=;
	b=YC6ZCi0oZIngV+XZQrVNDydKlBlnHJT+0zuWiDAfdrQWt0DMmhM32Ug9YO9TxMPK0CTK6p
	t16Qc1XQfFoQs/KaML+JFwTUmySP9+B1BAdGZelT6v5vATAnpOI/GSJBuOw7ZZ2gRxw4yH
	Yj3G6r6rk01l2huArpJlyModcfTUGf42YNVZXwySZIYmWj14u7qDRPFlxpQRv5vovkwjPm
	b92iG4EBRZTkfvqklkLseF4mbZqG8nBF2zRfquNWON6VHjW8n3ForgsRLTkiAE8tjYuFWv
	2th068eer/f0YLawJAdIqTc6zsFBEvqgwIJ7bdT00cNhlMszG0ybWfrbaQZ8kQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1794920539;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=V6bFgtqLLSexV794EZ1sdh+46bO9VjBalhkVgSjPsS8=;
	b=FHNgDsm0PCNCQUTzqY5dcaNdmwYjOoZAph8S0t2QgOqBYYLXP1Uz3YQ7ASX5491cPiGcTM
	9cOYmMwrC79Mz/Wz9LMpj/Y0EIGdrrc427kKxnjGj5xMUUnn344/PqatB++upaInGVOlXx
	3c/1KOswtUYnJhCA0QpVx6yRVcdboLk6/HrxQr6WD/4yzdS/lhJXsVMM3mkuZwk1wLiLl9
	5z6ZqgkJMUw+DaxdapL8QfJgToGXXatXgHIVD9b2R2nr7GK/5LSQqJD5xUCNFGIRwMt3uw
	tJMEsyiZOyEGORMEUJRJmND6oN7mr8QOstUazwjXLQ9cw+/65IOTk8eRuNZmsA==
ARC-Seal: i=1; s=20260414; d=pengutronix.de; t=1794920539; a=rsa-sha256;
	cv=none;
	b=GnnDV+Dgvhhjpbd52yRTNKsMhEUP+5wAn1GmlscJNrmd+erNDDZ4FiiSQ8JbVW2rtdX/Tg
	bXRCZmqmW+VpIIHFoRMoSU0eNfE705M29Qxpl4bPyeoMnFgKlyN8U3roHi5iIk8alIDbU8
	t4zCbri4pAhFxajK2aeU1YA3JZbZnOqfcaevv/jzOefbat2f4AlTr42GEw3PS5TdRp076/
	efGrdlBrbYBniXVU9mkHSenrUIwkkHFiQoXQVvXeMwbeaoK+JQg9cM7XJdSnMihnIuCuD6
	LR+5SNqnY8DSeoMqlStY/+i8YUtNcs7iQmAYltAomFBtzhENm9cn9JzradB8ww==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=relay-from-dude04.red.stw.pengutronix.de smtp.mailfrom=ore@pengutronix.de
Received: by dude04.red.stw.pengutronix.de (Postfix, from userid 1058)
	id 6D6B13814A3; Tue, 17 Nov 2026 14:02:19 +0100 (CET)
From: Oleksij Rempel <o.rempel@pengutronix.de>
Subject: [PATCH net-next v3 0/3] net: dsa: make a shorter bridge ageing
 time take effect
Date: Tue, 17 Nov 2026 14:02:10 +0100
Message-Id: <20261117-ksz-stp-ageing-v3-0-135de6b9f8ad@pengutronix.de>
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
X-B4-Tracking: v=1; b=H4sIAFJQ/GoC/2XOwU7DMAwG4FeZcsaQOHRhnHiPiYPbeq2F5lZJF
 hWmvjtZBRJiR8v+v99XkzgKJ/O6u5rIRZJMWgf/sDPdSDowSF9ngxb3zlkPH+kLUp6BBhYdINi
 GaH94wQM3pobmyCdZNvBolDMoL9m8101LiaGNpN14A3sqfIbfi6czid7yo6Q8xc/tn+I25af6+
 X91cWABO2y7gC70TG8z63DJcVJZHnveWgv+MVxzZ2A1Ap0weLTWe74z1nX9Bqd+rCIlAQAA
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

The series fixes the cases I hit on a KSZ9893: the switch keeps a
short ageing time after an STP topology change, or after a port leaves
the bridge. Some cases are not fixed. In them, the switch keeps an
ageing time that no bridge asks for. Two are known:

- The last bridged port of a switch leaves while its bridge has a
  short ageing time.
- The last port of one bridge leaves the switch while another bridge
  stays on it. The switch keeps the short value of the bridge that is
  gone.

There may be more such cases. I did not look for them.

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
Changes in v3:
- Link to v2: https://lore.kernel.org/r/20261115-ksz-stp-ageing-v2-0-7af27320033e@pengutronix.de

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
base-commit: 6ff4c5942a301675eb12e5b49d53a81e604624a1
change-id: 20261103-ksz-stp-ageing-705aa69829e5

Best regards,
-- 
Oleksij Rempel <o.rempel@pengutronix.de>

