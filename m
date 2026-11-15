Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=185.203.200.13
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794740405;
	b=otOwShiHUl7BjDdQgOPy5RC7rkJdC1B8tsIvtE0VgemlSIHR18zX3jZ7rkYjQRQuVo9+
	 b2zzA8bTf8zHxyYw8uxhv6L41dMnTRob566paVxz6ONsrOtpZrGU9z8ZHJvfCSKlRwaPV
	 IjoU/1Y0aQ835KeI1BwCqOvTELNH7wenob2mpyA3rakCn1T3ME1b8K6NJUNaCuu7DHMjg
	 wWLeL12QgqX4w0PSNBIt475Bdzp6fGoCzoeLKcAo+eOx74/VyBg21mMDQw8TYHBu4jlmu
	 nmc2XrbNRngRWCwjCz2Re9Ub/iwfKH6iTtcZaM5n86Rv1z3LupAAZTzclOd8k8Pe3+A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794740405;
	h=DMARC-Filter:Received:DKIM-Signature:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer;
	bh=F19YJTTogJUqB+Xjri3Mz9HAy/kQ5ok1ZAsNgUL6me0=;
	b=wndvH8/ACXeLXHdAfaoYpRUwUZ1v9mH2aYPxKeDPKnfkDwuz/dFpyQgqJg7Q6wXHCGSn
	 qESIbCNW7X9VHeMm8+IQWtX1C7I+spj6UYGmztSldHpGm8O91w1yxT7sDOojiCRI5wB3h
	 jPbEC+dXSW2yDUe8FuqcbO1SzGyGb4NdQ8nYqh+9rw86d11Or7ON2o4/ikMn92MdhHewh
	 4ey3UDtpf4AUfzrFHu3C7iyc6B03EhLhz4OIOfz8k17+U+MxBrJTwDaieUR4iVPVlkcDY
	 7pJu1/+1t/m1BZEIYqhcqR0/kHv/g9AyCYbfPBZLBaHXvdDV+QBZctD49KfwYcmuFAw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=pengutronix.de;
	spf=pass smtp.mailfrom=pengutronix.de;
	dkim=pass header.d=pengutronix.de header.i=@pengutronix.de header.a=rsa-sha256 header.s=20260414 header.b=TOL3N14c;
	arc=pass header.oldest-pass=0 smtp.remote-ip=185.203.200.13
Received: from mx1.white.stw.pengutronix.de (mx1.white.stw.pengutronix.de [185.203.200.13])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3ED58606A32C;
	Sun, 15 Nov 2026 11:00:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3ED58606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pengutronix.de header.i=@pengutronix.de header.a=rsa-sha256 header.s=20260414 header.b=TOL3N14c
Received: from dude04.red.stw.pengutronix.de (dude04.red.stw.4.pengutronix.de [10.17.1.12])
	(Authenticated sender: relay-from-dude04.red.stw.pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id 18CC5201D0E;
	Sun, 15 Nov 2026 12:00:01 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1794740401;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=F19YJTTogJUqB+Xjri3Mz9HAy/kQ5ok1ZAsNgUL6me0=;
	b=TOL3N14cf+7fXPQHuqdQTzO5mB2sIJA9Y6mQeMYW9pbso1LfZzsEdHrQ/O25B1gMhzIYIZ
	p6JKcaoYYON/YicX/BdoVv3BLbYuERYlZQgdr6r5OPETTJdaS5lK6p881OUVZjttu3L+9Q
	1hR5lVzNvhV5jduAYVJ2VQxI8vmpDmuNljs6MtqkjTSnujqg/Xd5gIX13h7JyS92+Yex2r
	2mfJl13vCq/Cx2RdrcW/NbZhGHNMWhs2SVkASLX+1V0hTW7oQqBXAgKj9AHA2CWKt7QmyQ
	4uoUmmjZvDm2YY+mzE2zCNIFleYIRoAHdmEyJEgeuEtU5oAay8yIjiQMC/2//A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1794740401;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=F19YJTTogJUqB+Xjri3Mz9HAy/kQ5ok1ZAsNgUL6me0=;
	b=CJXTtWFA5b7Mr3lBwA+Eds0faousg2dYN+oCjdUQhzeV+FM1wW/UfIp/qlRzF9GD6Cw2HC
	MrP2FmzZ/RMtP0yhXe5S3TnO6kZfOj4s4dOEmu6Ere8XiRg1ysnccwVs9/+SUuGUDWEciD
	gWllgZROBZKyHeh0Gole/puknB2QA4YrTFGLUexIl0ip8wjP0j/POfpBc+FXOKbL9kqFfc
	+nKTg1tgjxvrybLjOa2yht4DsWAVsisZj/TnxA3PXcIMAZuuxdQJoQ3E1aOk5O8cliVUZM
	qikSSa+77ClREtepO/ZOW9YwH53keSaMvx074nkB84AHMZ1Jv+Wkzccc1KAbZA==
ARC-Seal: i=1; s=20260414; d=pengutronix.de; t=1794740401; a=rsa-sha256;
	cv=none;
	b=V909Ybf/JFV4AOwoqnS1s9ZLlOt5YRh7w68JyryZeG3JQvSH1muYA3aUiD59MvcUQbYKFX
	cGfRP2TP/aT8RGM9b+AnBVeBqjVn07bf91AV/Fp16S1NrqcIPCbupjUTiKfjyGYt21xI51
	b3b4OG3Bsf5fV1uff+eVOWEIsZi+DIwU+23AV8grbuXxyAbcYpn3ibtf76EFD2Qm4VxOnK
	9BmYKO6wi5Y+4wJSzDSXDVbDPbzFUn+HtHkIUEYdGMxTHcS/4ZGbMuU0uc3YK/3SSNKbEy
	ZhaU+uLBco/xi0MLdqQPYAqHINHH17GeIC9Y+LdQ47i/lIu1SdE/gPzEF57Vzg==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=relay-from-dude04.red.stw.pengutronix.de smtp.mailfrom=ore@pengutronix.de
Received: by dude04.red.stw.pengutronix.de (Postfix, from userid 1058)
	id 0688F380133; Sun, 15 Nov 2026 12:00:01 +0100 (CET)
From: Oleksij Rempel <o.rempel@pengutronix.de>
Date: Sun, 15 Nov 2026 11:59:52 +0100
Subject: [PATCH net-next v2 2/3] net: dsa: ignore the old ageing time of
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
Message-Id: <20261115-ksz-stp-ageing-v2-2-7af27320033e@pengutronix.de>
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
Signed-off-by: Oleksij Rempel <o.rempel@pengutronix.de>
---
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

