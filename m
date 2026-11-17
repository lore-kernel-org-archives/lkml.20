Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=185.203.200.13
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794920543;
	b=3NGqyNQz6WDIuv/vvrWmswo5wNC+DyaDer9ab4Mha7jlPNyvw3prss9LwSgWwUicro25
	 Aqq1ATYNChSqBKDwUaNpmfJDq6UdUjPQZBr9BR+YBfs0YfAJ2LOVbnMJbGPYzJdllQUrO
	 NYxjEdx22HRkCwB4P3c8sGc/R0Px30tlBIe8S5qslxU8xiAqDf+W2SVTfoRv9f1QmAobr
	 quU0jafMm51nEwu99gQTmGHJnop1LLQQXl6ZhWRfudfrWDsQONr+gxYh7unc/La5BDi/n
	 AGVp8tnv7/RPfKOO1iSndYWmDPQvEqp3l6rKnMZEx0tkdszEMkPaQx39QIWiGfCB1NQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794920543;
	h=DMARC-Filter:Received:DKIM-Signature:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer;
	bh=bB+QIZL4TfOJJ6oLWxrz5vX9khwt59svjLxkzj7XuZA=;
	b=ZWPgpHFzgLQfhBAo2ZBi6q08f7SEvavmCHN1yvuvad3LiNR53DgMDY67cW4CLeJUzcqL
	 G3shY2lZ3PaSNDErn3piTd0nL0Y2tloo4yWmXhMJFCJefxUUakcww4dIXR5tkmG0jVdSE
	 emER/O+3eTGQL6asHMvn2lmFiuqNVXs24OnkjhQDmPwM3iw+h93qcirBaw7QRE6VBRTwt
	 +9vKyGoKLvIP3GTA4WuploqKniz0wZd0k12Xrn99yO98wkQ7HRNEdPSY1eoeySgXPoDdq
	 FmPNSlEQy+2Y4jdWYBGjfNlc3YzxB2FkcODwOgueUilA0bnTT5LBJ5OhJSWd+XtGIaA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=pengutronix.de;
	spf=pass smtp.mailfrom=pengutronix.de;
	dkim=pass header.d=pengutronix.de header.i=@pengutronix.de header.a=rsa-sha256 header.s=20260414 header.b="WLS/FlwA";
	arc=pass header.oldest-pass=0 smtp.remote-ip=185.203.200.13
Received: from mx1.white.stw.pengutronix.de (mx1.white.stw.pengutronix.de [185.203.200.13])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 814E8606A32C;
	Tue, 17 Nov 2026 13:02:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 814E8606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pengutronix.de header.i=@pengutronix.de header.a=rsa-sha256 header.s=20260414 header.b=WLS/FlwA
Received: from dude04.red.stw.pengutronix.de (dude04.red.stw.4.pengutronix.de [10.17.1.12])
	(Authenticated sender: relay-from-dude04.red.stw.pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id 932AA205A24;
	Tue, 17 Nov 2026 14:02:19 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1794920539;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bB+QIZL4TfOJJ6oLWxrz5vX9khwt59svjLxkzj7XuZA=;
	b=WLS/FlwAuoN2idLSKbTxas2zl6/r0C+dBRo6SteclF+0U3UVNsU8Ca+mKEb41hv5pBKEr1
	8cjLbw4/R4SYFqemw006djrzuZkHKBOMSBmGVN1ht5oSU1pnDVORv9X9y9ZxgzQ5koKvWb
	0nQSaLW2KeyVD3gfjrf7fx5a3sUo2ZzhMR1IHI6dCnJJIMCvHMzTQMeV+6mhQ6L+OnP/2e
	xUGl+pb28pMcFpsXRkM0296qg4Qan0MV2M8EghXT3ZwqEEHNJiKkv3WawIldn085uQWtJD
	XCbmwKkCx2CVhG/8haQCXJo/6oys7LXHIPudYVxgYCnEVbKAXvH53tYOc19tsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1794920539;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bB+QIZL4TfOJJ6oLWxrz5vX9khwt59svjLxkzj7XuZA=;
	b=T+BuoZQgfQFeIg+k1qQS6vOSsLnz5YBYLM3en7KS/+UTMzURrhww6rP0A6itXRCc5MyRa6
	Xg+gqwPDp+juLo1j/kJ9aPShkKfkHnD69qFVUa3+LYp9BOih+nQdIOtDzm3voYvx8kUJHy
	YbLzfC3dZjJYWjdjaWDtlQaIWZfWbCc1EUfybN6W6MB+J9mMR6ooilkNpr427hQUPAJHuU
	QSlE0VPL5yj3i4o/QFPD6wusGzgJ1B2MWp/GwfdvAzr4a/4CJkfhibJ4AF5gl31wIqIZAd
	xzHmSmlPQG8wWx5tOue5k3jXu556WtHw9Wfm+rVD47o++EZECOtsNWuKMPsMvg==
ARC-Seal: i=1; s=20260414; d=pengutronix.de; t=1794920539; a=rsa-sha256;
	cv=none;
	b=KUsEbVtcJ+gyJnx9wl9mcW3Mxihmp4soSt9rkcw/9NA6NGU5izf+QjxqVjdSp/h2WbvcnJ
	Jag9OitYfJKZKUZyMW3xpu+H/pg2hclNudxoTrSz5LsCoXnNiLX8ZElKKyoK/OHpl71+wm
	F2y/S4mDGAOpU4z54VsrpicnrXq3MhijgHsN9NU4Co0hRxuAcoX2bV8hDct5fU9x8hLzbG
	EhidBQLqjge7flXMGOcOLeVJi7yLz3GILNlNJ7SqUqlzBlFJK8yVflq5A+WMQupuF8zY4X
	hpTpysWOmAgKuztl7kAgODQupt2Us7HqUj3ifMcyF9ifi6cPsmLr43QPQkbkYw==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=relay-from-dude04.red.stw.pengutronix.de smtp.mailfrom=ore@pengutronix.de
Received: by dude04.red.stw.pengutronix.de (Postfix, from userid 1058)
	id 7382C381A95; Tue, 17 Nov 2026 14:02:19 +0100 (CET)
From: Oleksij Rempel <o.rempel@pengutronix.de>
Date: Tue, 17 Nov 2026 14:02:13 +0100
Subject: [PATCH net-next v3 3/3] net: dsa: forget the port ageing time when
 the port leaves the bridge
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
Message-Id: <20261117-ksz-stp-ageing-v3-3-135de6b9f8ad@pengutronix.de>
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

Clear the cached dp->ageing_time when the port leaves the bridge.
Otherwise dsa_switch_fastest_ageing_time() still uses the ageing time
of the port that left. If the port leaves with a shorter ageing time,
for example during an STP topology change, the switch stays at the
short value until that port joins a bridge again. With this change the
switch goes back to the long value when the bridge restores it at the
end of the topology change. The switch gets the restored value only if
another port of the same bridge is still in this DSA tree.

Found by code inspection. Tested on a KSZ9893 with lan1 and lan2 in a
bridge, ageing time 300 s:
- kernel STP, forward delay 4 s, lan2 removed during a topology change:
  without this patch the switch stayed at 8 s (2 x 4 s). With it, the
  switch went back to 300 s at the end of the topology change.
- no STP: I set the ageing time to 10 s, removed lan2, then set 300 s.
  The switch stayed at 10 s without this patch and went to 300 s with
  it.

Fixes: 34a79f63bbe4 ("net: dsa: support switchdev ageing time attr")
Reviewed-by: Andrew Lunn <andrew@lunn.ch>
Signed-off-by: Oleksij Rempel <o.rempel@pengutronix.de>
---
Changes in v3:
- No changes.

Changes in v2:
- Say how long the short ageing time stays, with an STP test (Andrew)
- Rephrase the commit message and the comment
- Move the case of the last bridge port leaving to the cover letter
- Add a Fixes tag
---
 net/dsa/port.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/net/dsa/port.c b/net/dsa/port.c
index 15e7da20b0e2f470a0ce5b763fa73b9b66b4c6f2..54c9709840952210ecd1abdfde31f751d07ef2b6 100644
--- a/net/dsa/port.c
+++ b/net/dsa/port.c
@@ -415,6 +415,12 @@ static void dsa_port_switchdev_unsync_attrs(struct dsa_port *dp,
 	/* Ageing time may be global to the switch chip, so don't change it
 	 * here because we have no good reason (or value) to change it to.
 	 */
+
+	/* Forget the ageing time cached for this port.
+	 * dsa_switch_fastest_ageing_time() skips 0, so this port no longer
+	 * counts towards the minimum.
+	 */
+	dp->ageing_time = 0;
 }
 
 static int dsa_port_bridge_create(struct dsa_port *dp,

-- 
2.47.3

