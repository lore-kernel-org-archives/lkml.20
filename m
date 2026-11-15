Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=185.203.200.13
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794740404;
	b=G98RqYwaY58wONfNraaCE3aeg7kPhKmW1C8ZJa5DtgC9nAgIH0zj1r4ABonJ1T6TLXPF
	 rvLmOpiO0oNPQ26SIDCCAlkQg/7OMrF3Jca1ITgZLnLfHDeVpx8rd26qMdjo/XY7SBonr
	 C8WL9q45DMve5ZucxVWiPvH7L1oaW5kulgJZIzUt6EwOWHbdjv7nFtLvJlJJtIeAbRsSl
	 lYNC374w87BhoDAhrc4NgXhNX+54jv/qrQY4b3Smza2MaCIUxaBH0TwO23T0Mrlr4GZy2
	 MkSSH6d2mT8YIdQ7VXsIuvrziUMijm9wzUrojHiUU1MW2sxxkShPMsa2E3YZzoSNPOA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794740404;
	h=DMARC-Filter:Received:DKIM-Signature:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer;
	bh=2rxHajFGuaJQd8KUvxVLNA3T27ByIjo6fkVBF98M0DM=;
	b=BM9AI/5GZ2wiF+vEnFDp4dHUsWYboeTrTj5QjDJ5WGOcP9PbawAO2c9dg8S3CqM6eTzd
	 BDlmEQJ9k6hf1NyS8i0H4nHe+2o917CI7We4NXYpvXjmZuEP/tY+GcWvSxpUU57eSKHxJ
	 353D+ICdHB2X7uIVliXAxgmyRFi2ZbILfzvyrpoJMwhWO0JJrBTbI5Fk+JmgX4tqeKV1s
	 s0IbE9kBcCuqkU1v7OL9fbWKCv7UrbFqzmjEtWH78c8llJ/1DGnDmxL0FwSXaOhp+GzOz
	 pVEUI/yNAyfgF7QRLZLAHaQT1XMCpiZ6bAfr5fDJIrv35J4iUW9psXPhxN3ixvP8how==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=pengutronix.de;
	spf=pass smtp.mailfrom=pengutronix.de;
	dkim=pass header.d=pengutronix.de header.i=@pengutronix.de header.a=rsa-sha256 header.s=20260414 header.b=W9nlzMY+;
	arc=pass header.oldest-pass=0 smtp.remote-ip=185.203.200.13
Received: from mx1.white.stw.pengutronix.de (mx1.white.stw.pengutronix.de [185.203.200.13])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EE63606A330;
	Sun, 15 Nov 2026 11:00:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3EE63606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pengutronix.de header.i=@pengutronix.de header.a=rsa-sha256 header.s=20260414 header.b=W9nlzMY+
Received: from dude04.red.stw.pengutronix.de (dude04.red.stw.pengutronix.de [IPv6:2a0a:edc0:0:1101:1d::ac])
	(Authenticated sender: relay-from-dude04.red.stw.pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id 2F5E12059FC;
	Sun, 15 Nov 2026 12:00:01 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1794740401;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2rxHajFGuaJQd8KUvxVLNA3T27ByIjo6fkVBF98M0DM=;
	b=W9nlzMY+nmju8T9lAn42M5ETtPk7cZP04dlLGdyjVq5SqRHA9htNsz5ZS8xJSvy2qyZ3F0
	R/nIPSrVQiiPseugHosvme8c2Qd/TatGwOlvGERArZlgFgDk0we8j3GIwlcFvIIkEnbnwg
	6pYgR4sTBFk0soE4JFygkrMIAV0n6hstpDQtIpOWnoaQCmXeX8ADL3KeqQz9UxTYNDm0d+
	SImkBSI5XXKgW5Kd6pkxbZZmINZHJR8H7RIIWLsUHANX5s8oTAUg0QOCQ2fvEEq0YCtBNH
	S/dm1/t7IZa/+iGz8NtBf/Fg8wD2/TzgJhoErmEQWNChKgsHKHwSKesGES1bUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1794740401;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2rxHajFGuaJQd8KUvxVLNA3T27ByIjo6fkVBF98M0DM=;
	b=SgdsgoCL8PAb8l3zqZZijrgsqy1c+FHs2SLbldvxUb5DWz1q8rwOyiC7Hu4PflY0mLSg/3
	Bb5334SHiLDoRcGHV8872ZZ3IYqUHOC9G7H5MYCkpRAIMdzFWkrvVzwi9tUfCyIq5/TbH3
	LGzdGbDynRzFwPjEQYtVB6BMemI4YuSzz/mCqgWyKkYblftNPe5lW4qm/iRPaBFDnG6hRd
	ovM7uLJk5f9Hy20FWIrSBLqjWW7iLoHoI0jvfpWyWSvF+dyP8gEkMM6RTLXSjzWOQ6EsRD
	irxfojIyEHp9pQ9jTaOKopqvhmeHs3oJWETZQ7rI3NHhIx9hRTFwesQheezXEg==
ARC-Seal: i=1; s=20260414; d=pengutronix.de; t=1794740401; a=rsa-sha256;
	cv=none;
	b=MpQwtLgf0KVOld1bsyfxcctc8JkfZnWPn435xoUbv5iF5y41LH4slWl31qFyPuDNhaqnWW
	3kkV8V0/kz2M03xDX0ThRq0NsXhLrO/gMwuai07QpA/pwt6o46oSx6MOt3ihv5Xex6Q4Zy
	oHAUgKCZwNr0jlhzF4j91WwjMR5ba/AjlYm1Z59lqVfaqoVrJ9ZNa1zvu9nxaZTlVXTfUW
	jRq9Dlkq/ZhWiXTUYNQLWc7Z9VWa1whP0HKEgxZ6U/LpZsOLPKXhHsHmFXgk0FymJUm681
	pkWdNlh/4ujcctPDrVprZQQFsScazj8+deN3uahMR4XBmhKR0MBrkhwpw3cqnw==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=relay-from-dude04.red.stw.pengutronix.de smtp.mailfrom=ore@pengutronix.de
Received: by dude04.red.stw.pengutronix.de (Postfix, from userid 1058)
	id 0858D381E4B; Sun, 15 Nov 2026 12:00:01 +0100 (CET)
From: Oleksij Rempel <o.rempel@pengutronix.de>
Date: Sun, 15 Nov 2026 11:59:53 +0100
Subject: [PATCH net-next v2 3/3] net: dsa: forget the port ageing time when
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
Message-Id: <20261115-ksz-stp-ageing-v2-3-7af27320033e@pengutronix.de>
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
Signed-off-by: Oleksij Rempel <o.rempel@pengutronix.de>
---
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

