Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=185.203.200.13
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794920544;
	b=ZUAaMfpcMz5wXVPTgOg6DRXnGsqxDO4jixQbVUASdbFlSEQfQcrKtT2ci2P9NUsHRz5I
	 uRNXCz7ts0lgFCB9sbLhInhn2syscbttDp6iEZ+YuOryi8hnWo6ovuKbdOCe8BRGuecZb
	 Oe5y2Wkxa6D6OyerEmLSpzii2Rctr0nfC7Eeg3OIKDw/JMJC90RkfrLHW1fRfG18F8faF
	 2eXg1TGmzmDHB86EUIySyaXgWwX6rIX53x7+S29sdsdnFaQomVb+1F8Lb6qyVeviwvc3l
	 B7eqibArniWp2LEqp73XSWoGftZBC8dz62GcsOaXCdv9fuGcnKJ2u2QWRNif8gTy0OQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794920544;
	h=DMARC-Filter:Received:DKIM-Signature:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer;
	bh=GqEwTqWJZtisWFpMzK6ZIl8KwFJNECYB6CTezDbTxDI=;
	b=lkliCnRJRr46gm+6VKcYcDwtV303PvwnzCxXa8v/wXuZfS1cbCa6XhEHZoN5F59KAe/y
	 uKBdcij/6COvY1dbwRLH3wF479wlJAC8sl3vMtYpy7LTYFFX0w/iGav36u0EKSvxk/Lxm
	 iiNcsiTdZ4Ob2FsHhc/uDr4EgUrjn7Figcu0JKsNVuoYlzoI0+iVsFiVmyf8Xqni2F6oK
	 Wom4ik62p+hTC/f1m6NS/dfdF9nU3mXsR9SDDZwKayVyvTxLx+FoTrC1fDDnXjORJphWP
	 H0Vsuh6vQRE8Dci2Dp+uDRTOxUlS3LOPqbB6R9DeQ60QxbPrX4x/9BvTjXE0p74pnsQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=pengutronix.de;
	spf=pass smtp.mailfrom=pengutronix.de;
	dkim=pass header.d=pengutronix.de header.i=@pengutronix.de header.a=rsa-sha256 header.s=20260414 header.b=IpUodTkv;
	arc=pass header.oldest-pass=0 smtp.remote-ip=185.203.200.13
Received: from mx1.white.stw.pengutronix.de (mx1.white.stw.pengutronix.de [185.203.200.13])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 813A1606A32A;
	Tue, 17 Nov 2026 13:02:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 813A1606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pengutronix.de header.i=@pengutronix.de header.a=rsa-sha256 header.s=20260414 header.b=IpUodTkv
Received: from dude04.red.stw.pengutronix.de (dude04.red.stw.pengutronix.de [IPv6:2a0a:edc0:0:1101:1d::ac])
	(Authenticated sender: relay-from-dude04.red.stw.pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id 99221205A5E;
	Tue, 17 Nov 2026 14:02:19 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1794920539;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GqEwTqWJZtisWFpMzK6ZIl8KwFJNECYB6CTezDbTxDI=;
	b=IpUodTkvJ1rTTgYlkq7YCboc0amCKPjZbSXBgrkTalyq1L28jKz+W9STjO0wNrPMgr3ba4
	uOjnomJpVCC7hVpA6XSGY68ij68X08/tG1/i/iuuYwJtWujJb9VUMJaI5hsBnvGSH6G/x4
	0wigbSzSsO1phE9DxeOEkiZLntwegGc7yzOiNoYV1GzMAVmtZ8K8XouskvH8hq2cQPVNIk
	jck8ExlQ3JMZUUv7jw5CnBU04SP8ccRGj1wVutkQAg2Sno5xtWsJPAI56SDpopOGPbABzv
	8wR0w8MXj6Xd+nvvlmXGiorNDk2mVB/HZGcRzgVIkT/HtsF9kdSDi6xXzHyV5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1794920539;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GqEwTqWJZtisWFpMzK6ZIl8KwFJNECYB6CTezDbTxDI=;
	b=Cc1s1Q9gGogpRxOJzKrmg6b8g3FZPQBgFP1djDeHLay3YqFqcLfsYGQle6lKHrlbleYNiu
	cggkdhqA0FiTWyOMK7pA0TvyERp6U7tT9CY3OjO5drIoTbqGW+CKhK/w6MQ//0MnT0MtbF
	2YEMVmnL+W/nlb4naaBBeEUO1KklOOWCd12wrIkLc63xxnWgsrai00AV998TGPV073XwHW
	MJDmQT1g+lhTre1vZANTYN0GNYKXZaLz77xw5Kdn1GkLvge0NqhsNhRAJqLP5AM4GBsjzL
	+6YKAvCm6ToYlZCHf8bdExu/OwlU6N9U9a8iOZ2+ixYRSwDvuslcmhfjrdjg9w==
ARC-Seal: i=1; s=20260414; d=pengutronix.de; t=1794920539; a=rsa-sha256;
	cv=none;
	b=WlZBIrHiF5KtA7qnMeyWFLRoGoeJukmq+Rv9N+VYb0WsBe1Frb7fngxxkJz6eF+JI/EyEB
	Ufp9SzYLafiFaqnYuB4zCt+gqH8QmA5taoa32u3qG0+kJHfjLGIWfot4llvtt0HwVB2KFT
	+NnxXWVJdaG7nKARgjnVA3nRHUZHWKacx0asTDLVKWBp0W8KCgh/GyWuX/GgHXCtVoRU8+
	oZ38r8x6EVOaJ11DitmFTCP8+n2Y9rO+Y2uyHG2gf17j05MIUQcE7RlJ8LvqbZz2mOIkkZ
	jW1EFm/SqLyddGr+f2DsVAc9dIN0lt85JkVMkGsDNef4E8W8yZgFYNSPbq93/w==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=relay-from-dude04.red.stw.pengutronix.de smtp.mailfrom=ore@pengutronix.de
Received: by dude04.red.stw.pengutronix.de (Postfix, from userid 1058)
	id 7151A3815D2; Tue, 17 Nov 2026 14:02:19 +0100 (CET)
From: Oleksij Rempel <o.rempel@pengutronix.de>
Date: Tue, 17 Nov 2026 14:02:12 +0100
Subject: [PATCH net-next v3 2/3] net: dsa: ignore the old ageing time of
 the port being changed
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
Message-Id: <20261117-ksz-stp-ageing-v3-2-135de6b9f8ad@pengutronix.de>
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

Pass the port to the ageing time notifier. When
dsa_switch_fastest_ageing_time() takes the minimum, skip the cached
dp->ageing_time of that port and use the requested value instead. DSA
updates the cache only after the notifier.

Without this, the minimum includes the port's old ageing time. During
an STP topology change, the bridge lowers the ageing time to
2 x forward_delay (8 s with forward_delay 4 s). When it restores the
configured value, DSA programs the cached 8 s again, and the switch
keeps ageing at 8 s.

An automated review of the lan9645x bridge series pointed this out [1].
I reproduced it on a KSZ9893 and tested the fix there.

Fixes: 77b61365ecef ("net: dsa: remove the transactional logic from ageing time notifiers")
Link: https://lore.kernel.org/netdev/179180428624.434549.14425623884223795761@kernel.org/ [1]
Reviewed-by: Andrew Lunn <andrew@lunn.ch>
Signed-off-by: Oleksij Rempel <o.rempel@pengutronix.de>
---
Changes in v3:
- No changes.

Changes in v2:
- Pass the port to the notifier and skip its old value, instead of
  updating the cache first (Andrew)
- Rephrase the subject and the commit message, and move the sja1105
  note to the cover letter
- Add a Fixes tag
---
 net/dsa/port.c   |  7 ++++---
 net/dsa/switch.c | 17 +++++++++++++----
 net/dsa/switch.h |  1 +
 3 files changed, 18 insertions(+), 7 deletions(-)

diff --git a/net/dsa/port.c b/net/dsa/port.c
index 1f5536c0dffc2311db24015697e0c8f5c014ac74..15e7da20b0e2f470a0ce5b763fa73b9b66b4c6f2 100644
--- a/net/dsa/port.c
+++ b/net/dsa/port.c
@@ -876,11 +876,12 @@ int dsa_port_ageing_time(struct dsa_port *dp, clock_t ageing_clock)
 {
 	unsigned long ageing_jiffies = clock_t_to_jiffies(ageing_clock);
 	unsigned int ageing_time = jiffies_to_msecs(ageing_jiffies);
-	struct dsa_notifier_ageing_time_info info;
+	struct dsa_notifier_ageing_time_info info = {
+		.dp = dp,
+		.ageing_time = ageing_time,
+	};
 	int err;
 
-	info.ageing_time = ageing_time;
-
 	err = dsa_port_notify(dp, DSA_NOTIFIER_AGEING_TIME, &info);
 	if (err)
 		return err;
diff --git a/net/dsa/switch.c b/net/dsa/switch.c
index a670a04edb7237a2606bc1959f6f2bb324c832ab..e9bef66fea3173c54fcde88da319cb8fd91195fc 100644
--- a/net/dsa/switch.c
+++ b/net/dsa/switch.c
@@ -20,14 +20,23 @@
 #include "trace.h"
 #include "user.h"
 
-static unsigned int dsa_switch_fastest_ageing_time(struct dsa_switch *ds,
-						   unsigned int ageing_time)
+static unsigned int
+dsa_switch_fastest_ageing_time(struct dsa_switch *ds,
+			       const struct dsa_notifier_ageing_time_info *info)
 {
+	unsigned int ageing_time = info->ageing_time;
 	struct dsa_port *dp;
 
-	dsa_switch_for_each_port(dp, ds)
+	dsa_switch_for_each_port(dp, ds) {
+		/* info->dp is the port being changed. Its cached value is
+		 * stale until the notifier returns. Skip it.
+		 */
+		if (dp == info->dp)
+			continue;
+
 		if (dp->ageing_time && dp->ageing_time < ageing_time)
 			ageing_time = dp->ageing_time;
+	}
 
 	return ageing_time;
 }
@@ -44,7 +53,7 @@ static int dsa_switch_ageing_time(struct dsa_switch *ds,
 		return -ERANGE;
 
 	/* Program the fastest ageing time in case of multiple bridges */
-	ageing_time = dsa_switch_fastest_ageing_time(ds, ageing_time);
+	ageing_time = dsa_switch_fastest_ageing_time(ds, info);
 
 	if (ds->ops->set_ageing_time)
 		return ds->ops->set_ageing_time(ds, ageing_time);
diff --git a/net/dsa/switch.h b/net/dsa/switch.h
index be0a2749cd9791e19b8f03c6f6ceafb2d0432b14..5362ee9bfb68cfb52759c108d0626c55e19bb3a3 100644
--- a/net/dsa/switch.h
+++ b/net/dsa/switch.h
@@ -39,6 +39,7 @@ enum {
 
 /* DSA_NOTIFIER_AGEING_TIME */
 struct dsa_notifier_ageing_time_info {
+	const struct dsa_port *dp;
 	unsigned int ageing_time;
 };
 

-- 
2.47.3

