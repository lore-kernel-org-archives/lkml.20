Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=185.203.200.13
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794740405;
	b=TwPkpxR/fn6EGEe3rtHjNAhoAbeR1lFoRrmtpfJygY9qXcxLoeUcrza5NjNnCww/6Oki
	 ITa7d4NgT70Qq8q18WJxTalsGNf/m+eyGOSm44x/M2/do40JJQ+/HQpHD6vW5MhDq0V9q
	 l5wwa+MhQL2CizO+U5QsVV0mIrULtN/3DKcPbN38Z1RYe0rQPbL+xK95fyi114LV5D3O2
	 hdZWgKI+fAfJ5IEr4OUPOTFarWto27mp+gNxnr0E6lU0CYYe6uAVRlt3+7rGkxBkOI9fm
	 a3hC4QS4e+ywVp1fF5LztUzoc1XMnH2HvzIFojd9Nezx3cv0vxNaDih6ocelEXjj0Xg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794740405;
	h=DMARC-Filter:Received:DKIM-Signature:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer;
	bh=wkA+VPYGFLuORnMAtbJKzLsvwtfdb241bM0vf1HQ6aQ=;
	b=0T+nUOGeQJS9rI0E+awtXYpQmlixNHNwVJLeIRlvGp71Sw6YDZomCCtj2h2KAwE62ASo
	 tkqAFm6FDnSqBjvGvtcILlLpvU7iAKV8i0tZQCuMVsW+9dIfG3SY9Y7qqbWHpdNNWjV67
	 Z+OFHpfhYyYBkdRT6sAYXj7XKkrSRbPLg0vygqbLr2O+5q+iYJ4BLXH6RILLAnHjhiVNU
	 q5EMcsx/+qcTm4X0Pl4HKW5wbmObNdj9IEmFMCRCLY45DjSiC1JDKeLkPhLFnJwFagXEh
	 BvbwTgxPmItEUNUCbfqV69Nt+TlUoPn69Cb44528Xy8u2Rse3EB6lTU9j35XmcaSXlw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=pengutronix.de;
	spf=pass smtp.mailfrom=pengutronix.de;
	dkim=pass header.d=pengutronix.de header.i=@pengutronix.de header.a=rsa-sha256 header.s=20260414 header.b=A3mQRzK9;
	arc=pass header.oldest-pass=0 smtp.remote-ip=185.203.200.13
Received: from mx1.white.stw.pengutronix.de (mx1.white.stw.pengutronix.de [185.203.200.13])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EE80606A331;
	Sun, 15 Nov 2026 11:00:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3EE80606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pengutronix.de header.i=@pengutronix.de header.a=rsa-sha256 header.s=20260414 header.b=A3mQRzK9
Received: from dude04.red.stw.pengutronix.de (dude04.red.stw.4.pengutronix.de [10.17.1.12])
	(Authenticated sender: relay-from-dude04.red.stw.pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id 26B892059F2;
	Sun, 15 Nov 2026 12:00:01 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1794740401;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wkA+VPYGFLuORnMAtbJKzLsvwtfdb241bM0vf1HQ6aQ=;
	b=A3mQRzK99xHypblrjsJtV2XPfGBv6xLKfgmmz5O8A5LZqRzNPB0jqR4Jt7IOWwrr10Hq3T
	Ye+U3a2h4oTtcwr74p7F8KMOTAqW2c/8mX2WyG27+zbdcStFOzdRxJiDKCyBJJsy9zkkmc
	lmX7hMZG4yZ2vfiG4DtJ+B8Zu0OXo8/hGnpEQ4hh5fmXii7OIToiLb/kobjVKLbRqZqLQw
	DrKkNUmRqQSH/rfZQue4ObOGnwRbT5DcWX3lqu/B6McUxQmAutOaVRhFcJ7YA/XlY8dSSn
	PzOj3xEbM7kyJ4WWKa0jpRFGuD0bW9c0DXTh/hJCyqzX6uv7FndOC99rx4zv1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1794740401;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wkA+VPYGFLuORnMAtbJKzLsvwtfdb241bM0vf1HQ6aQ=;
	b=OhqtE2KrEI+91VlvhuX0adPeSijA+m22ZMJXkZtSWQa3eZI1Qw3SnzQ8HldS8SbCzUcoa8
	mtykOO+L84bt0ZLpdy4qUAfbynJzcAPp+A3nBciKlE0tmVgpV7x3kijdNtBrcIkoUGw/yZ
	GVI0qDbe2UXCPBkA6IdLvMjIYC0Ql2meCI0gthwP7xjhSZMP5OXBHLmPqLWBy3ZctNEDqV
	QOvdG1MaU2T4yiqluBp+xzOP8nXg7i8zRF/Cw3v2sXmSACPJ4OOHAZRfyRvo/9LIS57OoR
	hFETDHPmJvH7yuJWXGrGPvuaFstLumP9e4j1WpNcgljF4TOsEYq9/RaQukAj1Q==
ARC-Seal: i=1; s=20260414; d=pengutronix.de; t=1794740401; a=rsa-sha256;
	cv=none;
	b=ClPViRJ1vo1HpNWcVJkJauwnTXTNMV8owgI7SD5jrVQ0E+pqNSlkIwa3DeI6oJ+2juEleM
	aLyzZOijZ2Lm4MpI0j6GtoLjzwE6BOAFqmf/OeSVzTWP2ggLDDCWQNBJCfGpunxLcBIE0l
	gD1jgBlrCckq0onMOlMphxPb5bBS622lCRm2WzCAa2gacxNqszdGyxjtctpfRUcBq0XG//
	3G40/xdBCwpN5l+XleYxaUqlozpXlN1yxPJskUTvwHwIoC8a/I8rPzNWAkRleFFloLeT/c
	+jJnzki9UXMCC5ppfHr1JZ4w4lQyq3Ce0zcLYL0o76drJ5/MxTBG8YtVY3qFRQ==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=relay-from-dude04.red.stw.pengutronix.de smtp.mailfrom=ore@pengutronix.de
Received: by dude04.red.stw.pengutronix.de (Postfix, from userid 1058)
	id 06FB73815CE; Sun, 15 Nov 2026 12:00:01 +0100 (CET)
From: Oleksij Rempel <o.rempel@pengutronix.de>
Date: Sun, 15 Nov 2026 11:59:51 +0100
Subject: [PATCH net-next v2 1/3] net: dsa: microchip: ksz9477: apply a
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
Message-Id: <20261115-ksz-stp-ageing-v2-1-7af27320033e@pengutronix.de>
References: <20261115-ksz-stp-ageing-v2-0-7af27320033e@pengutronix.de>
In-Reply-To: <20261115-ksz-stp-ageing-v2-0-7af27320033e@pengutronix.de>
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

On a KSZ9893 the pulse removed the dynamic entries on the one user port
I tested. The new period then started right away.

I found this in STP tests on a KSZ9893. I tested the fix there with
kernel STP and with STP off. With mstpd I checked only the programmed
ageing time, not the FDB.

Fixes: 2c119d9982b1 ("net: dsa: microchip: add the support for set_ageing_time")
Signed-off-by: Oleksij Rempel <o.rempel@pengutronix.de>
---
Changes in v2:
- Fix the tense in the comment (Andrew)
- Add new_period, and compute old_secs next to new_secs
- Rephrase the comments and the commit message
- Add a Fixes tag
---
 drivers/net/dsa/microchip/ksz9477.c | 41 ++++++++++++++++++++++++++++++++-----
 1 file changed, 36 insertions(+), 5 deletions(-)

diff --git a/drivers/net/dsa/microchip/ksz9477.c b/drivers/net/dsa/microchip/ksz9477.c
index 8d4647e23cda153bc68255a44c44e0d1d92469f9..a9d701f0404a706e6ad2a6faa2f57dbe28d383c2 100644
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
+	 * got smaller. Pulse Fast Aging in both cases. On a KSZ9893 the
+	 * pulse removes the dynamic entries (checked on one user port) and
+	 * starts the new period.
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

