Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=185.203.200.13
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794920543;
	b=S9KqUeuMzQvEGMehxnL9jYzk1SBAtz5B+7WXTsyyB6iBXkVc5nn402iGdUToB0V/3Rm6
	 L1Z8hjvh4o1HDDdnbrLPwZ1OU4/lSk46S9epMWrn9ouKTD+oiPnkDlNArsgllOITAQXpu
	 h3cuWnYXu8AhBmymaZuP87P4BuCJJkH7AednfOPKU5bWaek2oJpDHBI6NJeIA6Jacn7Bf
	 AEuNg45kaXUfbvyB+Ij8b/i9pq4HjvFqAKsD4fGHc3KRdA2vj9jTvbCKLTS/jEBuPxGwT
	 eP56neuNfH1qXvDHpT0IWHyunM9Aex8l8trQo1txpPun9S7byVC98UcZ+fiff4/6OwA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794920543;
	h=DMARC-Filter:Received:DKIM-Signature:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer;
	bh=X4w9VS6wowYriQ7KG5w4nigoYvsApu0P4UT51LgvEio=;
	b=SIMxD+gN9J3wL9bE3Waasgw4XeYDSkM+DBMJmN16Jtlt7jJw+hfUMME8gh6zcju6TL0F
	 0yDvX8Sh8U536Ano9nalVuTBHqdB+FLMBPJ21r9+4nbUvpWhUqKAs0qh2klOqZIyY+dw7
	 fdVLLgc/iHj+VgPGrU26JMekwKktfDS1CVz4Xm2G5xjdhk70ULjfwcqswquZVyff6pSf5
	 QEer4GMTgjNm0Rh+FiLAuluXEwb3KbbRnWCqtTypS/AU0FNoMkjW2RRUJsxiXYAN9z2hZ
	 gGe15aulfwOXOa2teP9KQcq/cQmZqnwnaQbdRzZ96JN/Em5l7m4Udg+zCfk29WPAsLQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=pengutronix.de;
	spf=pass smtp.mailfrom=pengutronix.de;
	dkim=pass header.d=pengutronix.de header.i=@pengutronix.de header.a=rsa-sha256 header.s=20260414 header.b=WHLSeD2t;
	arc=pass header.oldest-pass=0 smtp.remote-ip=185.203.200.13
Received: from mx1.white.stw.pengutronix.de (mx1.white.stw.pengutronix.de [185.203.200.13])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81374606A323;
	Tue, 17 Nov 2026 13:02:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 81374606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pengutronix.de header.i=@pengutronix.de header.a=rsa-sha256 header.s=20260414 header.b=WHLSeD2t
Received: from dude04.red.stw.pengutronix.de (dude04.red.stw.4.pengutronix.de [10.17.1.12])
	(Authenticated sender: relay-from-dude04.red.stw.pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id 81855205A36;
	Tue, 17 Nov 2026 14:02:19 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1794920539;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=X4w9VS6wowYriQ7KG5w4nigoYvsApu0P4UT51LgvEio=;
	b=WHLSeD2t+PKxLKUSEwkdriF0gMYN8KOe+AgcV5m15yrLLAlEfTW/XE6q+tEq7ZT1WYfXWh
	gfgBPaSmmJXRecjUWF63+l0R4sNaPD1MU+5bi0l5zPKNglpQgKXPQ2M50euvKFhaitznvS
	uKyZW7gBU+t5QRVjzfvb+3p9MtCmeOinmCx5FKEpIT87bp/637+EBIzAHDm4Hs6zQzLop9
	c8nC8ntpOKA4bt+pz6FlHbbutud8mchPb18wp/Kcp+xVxoOAIny1s9ZXa7lEaA5hho/GN9
	LZ+vB9oOVi0Jkh/HarEoh2SApzdPcImT3rQoNuero4nqBcHO+i4FmuaIAhXqew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1794920539;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=X4w9VS6wowYriQ7KG5w4nigoYvsApu0P4UT51LgvEio=;
	b=asM4gsfh6UK8mBll+e9Z0STKNNcoCq6pvKka9nMHXYjPvu5XLrA+YBErwQWrEZt/XpyJ3a
	Mm95z4gyUwmT+z0y2N0vN9FuRvZs+ThFzj9vRAiP3PsYKhUhVBvITbuSdauL9952AUPoLs
	D13Y6ldFrBZPByh+83vvWkdH9WzFjrPz8Ghw+G8yUqHhY0uLyqCi4LemCWekn1os2EqkTy
	qYzWl+jxwK9iQXEVhmngyiHAa6pxNZJm9ItuyeqnSSPGbUnM65Nm/LE4YF9U5p/gb5l+Xt
	MVpVxp86gGYVlQ4FvQpCgjVLcYgQDefDS1lAgqM/AOX8DyunYGxkDBLEw4eD/w==
ARC-Seal: i=1; s=20260414; d=pengutronix.de; t=1794920539; a=rsa-sha256;
	cv=none;
	b=GY9hWUDtVuHfEpSNGyIvHRQBWiTsFptZUGwg1qVhFAdUgz+3l10N76w0FiRRbDUHSOm9aj
	2REDAmwL4OQ+n4sLJawaGn3Q3VUUGzefyrbxDSSE1XBvYIMazfcX1SUo4Z/Sr6WSkz7HBK
	pAnf0ucjtIab6qPM2mEfEwL+We3BZokmNqACWCzb6YlBkm7xGYWJ0q5Smfoie6qJ8oddnT
	RQZ3HV2Z36e9T1PPHUU1Oas9eMCX548hn2UzmGbBdcS4t3InwCAV5K8IZImm0QNcwjuyIS
	I+j9z0hux/ECHTkIDCyCAbtYc79Qz08faE2pYVT3e5SecrYMtxHS1ebkcjdKkw==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=relay-from-dude04.red.stw.pengutronix.de smtp.mailfrom=ore@pengutronix.de
Received: by dude04.red.stw.pengutronix.de (Postfix, from userid 1058)
	id 6F8C5380239; Tue, 17 Nov 2026 14:02:19 +0100 (CET)
From: Oleksij Rempel <o.rempel@pengutronix.de>
Date: Tue, 17 Nov 2026 14:02:11 +0100
Subject: [PATCH net-next v3 1/3] net: dsa: microchip: ksz9477: apply a
 shorter ageing time at once
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
Message-Id: <20261117-ksz-stp-ageing-v3-1-135de6b9f8ad@pengutronix.de>
References: <20261117-ksz-stp-ageing-v3-0-135de6b9f8ad@pengutronix.de>
In-Reply-To: <20261117-ksz-stp-ageing-v3-0-135de6b9f8ad@pengutronix.de>
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

Pulse Fast Aging when the programmed ageing time gets shorter or the Age
Count gets smaller.

The ageing time is Age Count times Age Period. An entry stores the Age
Count when it is updated, as the datasheet says. The datasheet does not
say when a new Age Period applies.

Without the pulse, stale entries outlived an STP topology change. In my
STP tests the switch ran at 300 s as 4 x 75 s, its reset value. With
forward_delay 4 s, the bridge asks for an ageing time of 8 s. Read back
right after the write, the register showed 8 s. In three tests, an
entry learned before the change still stayed for more than a minute. I
think the switch uses the new Age Period only after the running one
ends.

The pulse is also needed when the ageing time grows but the Age Count
shrinks. From 8 s (4 x 2 s) to 31 s (1 x 31 s), an entry stayed about
63 s in one test.

Fast Aging is a control for the whole switch. On a KSZ9893 the pulse
removed the dynamic entries of both user ports, also entries still in
use, and the new period started right away. Unicast to those addresses
is flooded until the switch learns them again.

I found this in STP tests on a KSZ9893. I tested the fix there with
kernel STP and with STP off. With mstpd I checked only the programmed
ageing time, not the FDB.

Fixes: 2c119d9982b1 ("net: dsa: microchip: add the support for set_ageing_time")
Reviewed-by: Andrew Lunn <andrew@lunn.ch>
Signed-off-by: Oleksij Rempel <o.rempel@pengutronix.de>
---
Changes in v3:
- Say that Fast Aging removes the entries of all ports (Sashiko)

Changes in v2:
- Fix the tense in the comment (Andrew)
- Add new_period, and compute old_secs next to new_secs
- Rephrase the comments and the commit message
- Add a Fixes tag
---
 drivers/net/dsa/microchip/ksz9477.c | 41 ++++++++++++++++++++++++++++++++-----
 1 file changed, 36 insertions(+), 5 deletions(-)

diff --git a/drivers/net/dsa/microchip/ksz9477.c b/drivers/net/dsa/microchip/ksz9477.c
index 8d4647e23cda153bc68255a44c44e0d1d92469f9..972703fe7454f2892b98dc507a1cba0a5c91dabd 100644
--- a/drivers/net/dsa/microchip/ksz9477.c
+++ b/drivers/net/dsa/microchip/ksz9477.c
@@ -1289,13 +1289,16 @@ static void ksz9477_phylink_get_caps(struct dsa_switch *ds, int port,
 	ksz_phylink_get_caps(ds, port, config);
 }
 
+/* The datasheet gives no pulse length. A 2 ms pulse worked on a KSZ9893. */
+#define KSZ9477_FAST_AGE_PULSE_US	(2 * USEC_PER_MSEC)
+
 static int ksz9477_set_ageing_time(struct dsa_switch *ds, unsigned int msecs)
 {
+	u8 data, mult, value, old_period, new_period;
 	struct ksz_device *dev = ds->priv;
+	u32 old_secs, new_secs, max_val;
 	u32 secs = msecs / 1000;
-	u8 data, mult, value;
-	u32 max_val;
-	int ret;
+	int ret, err;
 
 #define MAX_TIMER_VAL	((1 << 8) - 1)
 
@@ -1314,6 +1317,10 @@ static int ksz9477_set_ageing_time(struct dsa_switch *ds, unsigned int msecs)
 	if (ret < 0)
 		return ret;
 
+	ret = ksz_read8(dev, REG_SW_LUE_CTRL_3, &old_period);
+	if (ret < 0)
+		return ret;
+
 	/* Check whether there is need to update the multiplier. */
 	mult = FIELD_GET(SW_AGE_CNT_M, value);
 	max_val = MAX_TIMER_VAL;
@@ -1336,8 +1343,32 @@ static int ksz9477_set_ageing_time(struct dsa_switch *ds, unsigned int msecs)
 			return ret;
 	}
 
-	value = DIV_ROUND_UP(secs, data);
-	return ksz_write8(dev, REG_SW_LUE_CTRL_3, value);
+	new_period = DIV_ROUND_UP(secs, data);
+	ret = ksz_write8(dev, REG_SW_LUE_CTRL_3, new_period);
+	if (ret < 0)
+		return ret;
+
+	/* data is the new Age Count and mult is the old one. An entry
+	 * stores the Age Count when it is updated. The datasheet does not
+	 * say when a new Age Period applies. On a KSZ9893, entries outlived
+	 * the new ageing time after it got shorter, and after the Age Count
+	 * got smaller. Pulse Fast Aging in both cases. Fast Aging is a
+	 * control for the whole switch. On a KSZ9893 the pulse removes the
+	 * dynamic entries of all ports and starts the new period.
+	 */
+	old_secs = mult * old_period;
+	new_secs = data * new_period;
+	if (new_secs >= old_secs && data >= mult)
+		return 0;
+
+	ret = ksz_rmw8(dev, REG_SW_LUE_CTRL_1, SW_FAST_AGING, SW_FAST_AGING);
+	if (!ret)
+		fsleep(KSZ9477_FAST_AGE_PULSE_US);
+
+	/* Clear the bit even after an error. */
+	err = ksz_rmw8(dev, REG_SW_LUE_CTRL_1, SW_FAST_AGING, 0);
+
+	return ret ?: err;
 }
 
 void ksz9477_port_queue_split(struct ksz_device *dev, int port)

-- 
2.47.3

