Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794174323;
	b=JhNIkjE79jRToYuap0eZzMmpEwMU/Ow6Qpfb4oHH8Lt+51uG20Ho4yl7pZu00oAlSqHZ
	 az1zF/JozYutQY8maiTv6U0g3M7JAQhqXu+knvyB8zLoFLjosVu38Y9pJxCzhqioYQCBr
	 pWC1bTmZvNq+SoqTXT2WPldMCywfvFApzCyIFKsoCdwQStcUXFKwu2CeP2MWZOiHoLV2j
	 F9OMwLb2HpvSdWLTuEhiKam//YzPyQEEu9mGSiQtXWAqXkNrV4EcSp3V+o4pegLbD9pxK
	 JEmWkWWZizYhNdoBY1R8GAQkB427zReqnbOgXOiD4ojJOYMEI5jsyw0YQNkwznZ/tIw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794174323;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=9l6NWEWMJ9uUn8jbFCIYRZKatM0u3CjixN3oolZ9eG4=;
	b=ZxxsVlUxvkvdHfOML1jVOcTEluGLxakab1DEfqXbs69ZR5HgipMn+dNNayFf1Q52y3sL
	 20GnN4FtxOOQxi7tcu+gwDZD/FXdGvHwWfFNq1lkwcnN2SdfnqaroalNeWm/74Ay05qL4
	 Jc+oaHiQntk9ETRtUvWfLv4KOqxG/qIDUUJhhFyN0vosl59x8TiRCqFd1paCyE9a6DoAh
	 o4e11YSzyGbw8dnOgxEkGe3QEG1rHRm4cx0X7LCG9PImzeHeLpos9c2hAZReAfg4XlS9S
	 db1Z+LsVYTAdeHHGWNB3GxlBao8h8pofIfjpylhDlw6vTyPrDtCREwa0IS9Y7h+a4xg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=THV0xTKZ;
	arc=none smtp.remote-ip=209.85.214.179
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F2D7606A339
	for <linux-kernel@vger.kernel.org>; Sun,  8 Nov 2026 21:45:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6F2D7606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=THV0xTKZ
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2ed1b9e8f43so855755ad.1
        for <linux-kernel@vger.kernel.org>; Sun, 08 Nov 2026 13:45:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794174323; x=1794779123; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9l6NWEWMJ9uUn8jbFCIYRZKatM0u3CjixN3oolZ9eG4=;
        b=THV0xTKZgIs8+l/ENmpvDdI17Z5IpqRUFt2ohzy+3h57IpWtEPQ9YCm3OcP1x9/HCa
         7HU3/HxBEHVffWEIArrNNLnHFrIn1DZD71D407U3eTMQ08YhNGmjK5OUYAq4nwf9ARHj
         /3od4ypNvNyMlkFOzzJptI3/01034pItCunu9IpezgqUcnplTTwc9SNuG4zvI8+RVO7n
         QRsHehjIOpfLqKTq0dOD340ga1pFvL62nuCn7KGZ3NnTv+h8THb6uUkRQNVYgWboWKVz
         EygvO/J3V5yR407ESloHTEc4d9fw29qlhZJAgxLTZ+gV6vNAbN1sZWruD/W5FgOEUxt2
         nohA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794174323; x=1794779123;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=9l6NWEWMJ9uUn8jbFCIYRZKatM0u3CjixN3oolZ9eG4=;
        b=DYBuEfbgGGZFN9GyrSEHnpNnjvojn+3OnvqREd5kWVu65dYkHBy/Xy5AKJWMirH4jE
         tz5emrgJtoEhB25sFtqMRanY/17cBaSOCFvByCDOSPzvYICyKIjhVtH74qDzJG/mQIte
         fupoLsO5zIuANs9gvltWVlOQ4D5p9m2KA9hBKddUWjqnGurbdFyUkb3/Azo3xj/SO/NS
         mWQ7HjwjLJsQmlmf89uOmrI3hnUlh/Mw9ODkGArfI0/O7NU4Nwy2umuQ1qfqGCwOqKnJ
         7STP7riyOpuvd8fteCdcHPKUQBCpz12rTOnL5+U1Uq02mKiM9uuHBd1CfzWaVY7GJr4p
         LIiA==
X-Forwarded-Encrypted: i=1; AL+hErGVCuqIWX+OftMI/DEpBrmdeoEac7LCiT/bWE0+GsgvlPIMIfvoL5vwQ4tKoHHUs4iIv2bo5HI4U9gk1LQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z+qagglQfJx8gddfPzuhjOFiHSxgxO3fJpyL+twjRMKfN51dvSK
	mfiZDH/a+5JRjHrOPQkb9lYzpmbd3FwHYFW3j4aV006Z0oVnxBHlDaUA
X-Gm-Gg: AYBFou0ekU7YW/foInF1mlv+KlVczIRD/IDlhOosWbAm2LrAzEP+VbOO3+LndDpbIfa
	9rkwj9uRDLh+Ga4haixKsgY0QswNGSIDTCelhjR9OpM9tWePEfGPRoQaOVJphEVoV5sSoQRRiaC
	o53qkRcsEjTn+N3UYcFslT9eRm+BEtd7E6dlQ4ctWa3YRZrzIq+hmHLbIOVOe0xXT8Y9VmQjl4S
	jafYXrXNwIZJgPPK5xCacqVMrAnMq5tud5jxavvl0Oo8nGSVB6zfoMXG66H7mb8/RAv0TVbgKOY
	mHNMAgPOxGUr6EqMT07AB7B9ourGB0jN6JnoRrLsyOJx9op69QmsrRsD5BNnfOMp8ujuisBcK1H
	PhpD519+Jv7gw0KQIERFbWMz+zesyFVwFpfkvPR4QMOMgfHcL2DWxDEwkivl4qDAYjqDJCRKvO0
	ITVD/MSykPIsxJmGR1/ZM/QeTa+3VaibjzTy/kXzQwd3gT4DHpnBqM+PSNwe79a6pYOxgEPh/B5
	cunJoFeFLOVewgM5BqYLPYJw9KtJi7kjPSTpsl/jN5AK9pBZt6wQGVVea3k8c+bh6zNeJWfw86l
	oGw2FQH3rdcd/1yrX7nu5WXoeiTSDvPEQwplhDSTrs7su4vw6o+DOic=
X-Received: by 2002:a17:90b:2e48:b0:3ad:8a14:bc73 with SMTP id 98e67ed59e1d1-3b12d5ba8d1mr2092245a91.50.1794174322647;
        Sun, 08 Nov 2026 13:45:22 -0800 (PST)
Received: from d.home.yangfl.dn42 ([2a09:bac1:76a0:28::1d2:30])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b1034718f8sm4619463a91.4.2026.11.08.13.45.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 13:45:22 -0800 (PST)
From: David Yang <mmyangfl@gmail.com>
To: netdev@vger.kernel.org
Cc: David Yang <mmyangfl@gmail.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Vladimir Oltean <olteanv@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH net-next v5 5/7] net: dsa: motorcomm: Translate FDB VID for VLAN-unaware bridges
Date: Mon,  9 Nov 2026 05:44:45 +0800
Message-ID: <20261108214450.1662362-6-mmyangfl@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261108214450.1662362-1-mmyangfl@gmail.com>
References: <20261108214450.1662362-1-mmyangfl@gmail.com>
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

A VLAN-unaware bridge reports VID 0 for its FDB entries, but lookups run
with the unaware FID (VID 4095). Entries added through switchdev were
installed under FID 0 and could never be hit by the hardware lookups.

Translate the unaware FID and VID 0 back and forth, so the software
mapping stays symmetric with the hardware lookups.

Signed-off-by: David Yang <mmyangfl@gmail.com>
---
 drivers/net/dsa/motorcomm/chip.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/drivers/net/dsa/motorcomm/chip.c b/drivers/net/dsa/motorcomm/chip.c
index fbf3a0cba49b..46534127d070 100644
--- a/drivers/net/dsa/motorcomm/chip.c
+++ b/drivers/net/dsa/motorcomm/chip.c
@@ -590,7 +590,10 @@ yt921x_fdb_dump(struct yt921x_priv *priv, u16 ports_mask,
 	res = yt921x_fdb_read(priv, addr, &vid, &pmask, &index, &status);
 	if (res)
 		return res;
+
 	if ((pmask & ports_mask) && !is_multicast_ether_addr(addr)) {
+		if (vid == YT921X_VID_UNWARE)
+			vid = 0;
 		res = cb(addr, vid,
 			 status == YT921X_FDB_ENTRY_STATUS_STATIC, data);
 		if (res)
@@ -618,6 +621,8 @@ yt921x_fdb_dump(struct yt921x_priv *priv, u16 ports_mask,
 		if (!pmask)
 			break;
 
+		if (vid == YT921X_VID_UNWARE)
+			vid = 0;
 		if ((pmask & ports_mask) && !is_multicast_ether_addr(addr)) {
 			res = cb(addr, vid,
 				 status == YT921X_FDB_ENTRY_STATUS_STATIC,
@@ -740,6 +745,10 @@ yt921x_fdb_leave(struct yt921x_priv *priv, const unsigned char *addr,
 	u32 val;
 	int res;
 
+	/* See yt921x_fdb_join() */
+	if (!vid)
+		vid = YT921X_VID_UNWARE;
+
 	/* Check for presence */
 	res = yt921x_fdb_has(priv, addr, vid, &index);
 	if (res)
@@ -782,6 +791,13 @@ yt921x_fdb_join(struct yt921x_priv *priv, const unsigned char *addr, u16 vid,
 	u32 val2;
 	int res;
 
+	/* A vlan-unaware bridge reports vid 0, but untagged lookups on its
+	 * ports run with the unaware FID; map so that static entries match the
+	 * hardware lookups.
+	 */
+	if (!vid)
+		vid = YT921X_VID_UNWARE;
+
 	/* Check for presence */
 	res = yt921x_fdb_has(priv, addr, vid, &index);
 	if (res)
-- 
2.53.0

