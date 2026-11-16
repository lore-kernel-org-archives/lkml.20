Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=185.203.200.13
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794856223;
	b=UmRGQg/VewsTUkxKXdFA4qB5tS0QpHb2wazCUD8fd9gnwbxS+YANAJltM4yEidFjzH1s
	 gI3B3SGBGp0wlSn6Ks126g9nnevpfCthywQGR9RLo1uJkKsWBCX7il+4IgVadrzipYayw
	 vr31PZGvpNNPDs0VFOLZUjWaFNsXL7dfpHQFieZqbi6QJiogW0VIH29xxgQULfEcdti/o
	 c+rHxXLp0Nrxr0GBryBI4EeqeS0mP4PHxlEm7rxTy9l4JGvMYAiziaztusbw5/A00YzWl
	 H5K+Nd3g4pq/wx1zmg4Udqei4phvdFLS4qO4zAMl+f6dD8BlrrTQBxkk4N/BYDVQm9A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794856223;
	h=DMARC-Filter:Received:DKIM-Signature:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer;
	bh=yIJjtU/l7LIomhy8OaXZF6t/MLWz3Z2YWmYF9eGCfnc=;
	b=eckVKFSNw5pMHdAn5bn0C9GmPzcIj5odqFvwRanxulmztEQUSnfMv8/F4rdB8fG5b66Z
	 qNJDaRZezyvDepMwvhgJAyCPd79gLZ3/spn0+RD3+8N2Bv4mdIjcRynqdYrvL6Jvf76dD
	 qWiKpOI+hZaDFjzvVFDaMm87JDvIowAmpHuAHpn0DWHPjeZbSH9OQg6ltiM7ztoPFOs1g
	 LWVy0QzRN64AzsVCx8bJwBEGnIJ2C+9PFDgsFcAw8c+Y7mvE5kL9syQv/GbB+A1u0rt+f
	 /CPjpDr1j1Rjem4CALyyG19SBMFNSzJjoIRqT5Pk+L/ARsZ5+o4Ik+8hKmHT+mnJZpA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=pengutronix.de;
	spf=pass smtp.mailfrom=pengutronix.de;
	dkim=pass header.d=pengutronix.de header.i=@pengutronix.de header.a=rsa-sha256 header.s=20260414 header.b=TMA13sEf;
	arc=pass header.oldest-pass=0 smtp.remote-ip=185.203.200.13
Received: from mx1.white.stw.pengutronix.de (mx1.white.stw.pengutronix.de [185.203.200.13])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3246606A322;
	Mon, 16 Nov 2026 19:10:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D3246606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pengutronix.de header.i=@pengutronix.de header.a=rsa-sha256 header.s=20260414 header.b=TMA13sEf
Received: from dude04.red.stw.pengutronix.de (dude04.red.stw.pengutronix.de [IPv6:2a0a:edc0:0:1101:1d::ac])
	(Authenticated sender: relay-from-dude04.red.stw.pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id D22C2205A17;
	Mon, 16 Nov 2026 20:10:15 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1794856215;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=yIJjtU/l7LIomhy8OaXZF6t/MLWz3Z2YWmYF9eGCfnc=;
	b=TMA13sEfVFicjiGKZw3wIG/z+/nj3mruLDISZtxCgOptdw080ClA+3+fuLuq7M9X4uR+kq
	aDldvDeEVYbndsBZGVPzx0yVv4fxXFF0fSmLGIcm6JlLuIYN29p3hJ7mNRkaSIqTWp2KB6
	pdFmYFbPmB7b6WvhSxxv6UcOsD+D+UhOnZx2ZnBLjVyuCeYcuFYQHlAJ0nOTRf88Kzk4+h
	pJyKvn4cHtdgeC3XTwnyZuaBfZ3rcvEHzhGYweIn4iqxR3IMz2JgJCjCUV4ySOAsk7LU5r
	ui6LJIJoizvF8yH+pwRwq6E+a45Konjwp7OkpzkBQpoK3r4QIlIh+TIxf+id0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1794856215;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=yIJjtU/l7LIomhy8OaXZF6t/MLWz3Z2YWmYF9eGCfnc=;
	b=erWHu1iE9ec07e/GmLcnRJpmd0q4+SXhlhgGXIUCP6dHoGEj+R5e6UjGDy/nsW5z4x/mZK
	kgxTfgZvk6GuVmuAPeiZgUe6L0eTPtIbehOP4zdie2r977R+gBl8F60ntNagy1IWndnm0a
	NXPxVC4sQFqKAmmWIuvcwaVAYImZnAyN5PYZR34d0T9fFQ1Lca7a79hAsIz44XXKLG7zBo
	6iFBO3hMz0TrYVtKM63XHjYc8QCF8QX7l1h1RGDqdR6mJqOWKqoVUET2yQqdHiMAjL/vwz
	zCA3zmp0CFR5D+b/DLsEbsOF4DnJeQD+h7pj9fDrDTJLCE0BlaPjsSjEDfx7+A==
ARC-Seal: i=1; s=20260414; d=pengutronix.de; t=1794856215; a=rsa-sha256;
	cv=none;
	b=CM2KOTk9glxdF8vUalbwYsXqlO8ivXYQGNc2qd3Uev+BHtp1884lTjPIXTqLy8t1R0QoVW
	tSMgaeeAt7yhd1h3EeYhbtgbLnJpYXkXjGchV7qsiP7SA+PaLw0PDUUJ4P1AKRvsDno/pT
	T25L2mgEawDYxuqprXECKFEHrNI1/FCxyZrWfwe/pf3P9QMibkP8QwvS554mgyabaOTnU/
	5485cuYldC1QnKdGu5bfCtB2IThdzqYucuk6Gt+S4xxlisWTvjXBDRPpFI5klxlWfMkcmW
	7flEglDOkuGnp3sA480Y3n8QSMU3LyPF/6nGteNlxPmvFTgcN4wDjN4S5SE6eQ==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=relay-from-dude04.red.stw.pengutronix.de smtp.mailfrom=ore@pengutronix.de
Received: by dude04.red.stw.pengutronix.de (Postfix, from userid 1058)
	id ACFAD3809F9; Mon, 16 Nov 2026 20:10:15 +0100 (CET)
From: Oleksij Rempel <o.rempel@pengutronix.de>
Date: Mon, 16 Nov 2026 20:10:13 +0100
Subject: [PATCH net-next v3 02/10] net: ieee8021q: add pcp_to_tt()
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
Content-Transfer-Encoding: 8bit
Message-Id: <20261116-rtl8365mb-dcb-ingress-v3-2-657f5fdb4db7@pengutronix.de>
References: <20261116-rtl8365mb-dcb-ingress-v3-0-657f5fdb4db7@pengutronix.de>
In-Reply-To: <20261116-rtl8365mb-dcb-ingress-v3-0-657f5fdb4db7@pengutronix.de>
To: "David S. Miller" <davem@davemloft.net>, 
 Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, 
 Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
 Linus Walleij <linusw@kernel.org>, 
 Luiz Angelo Daros de Luca <luizluca@gmail.com>, 
 =?utf-8?q?Alvin_=C5=A0ipraga?= <alvin.sipraga@analog.com>, 
 Andrew Lunn <andrew@lunn.ch>, Vladimir Oltean <olteanv@gmail.com>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
 kernel@pengutronix.de, Oleksij Rempel <o.rempel@pengutronix.de>
X-Mailer: b4 0.14.2

Add a helper that maps an IEEE 802.1Q Priority Code Point (PCP) to the
corresponding 802.1Q traffic type, complementing the existing
ietf_dscp_to_ieee8021q_tt().

It is very nearly an identity map, except that PCP 0 (Best Effort) and
PCP 1 (Background) are swapped: per 802.1Q-2022 (Annex I, Table I-2)
Background is a lower priority than Best Effort even though it carries
the higher PCP value. PCP 2..7 map straight through to the matching
traffic type, and values above 7 are rejected with -EINVAL. This decodes
the 8P0D encoding (Table 6-3), where every PCP value is a priority and
none carries drop eligibility.

Drivers that classify ingress traffic by PCP need this to map into a
priority-ordered internal space without misordering Best Effort and
Background. The first consumer, the realtek rtl8365mb DSA driver, lands
later in this series.

Signed-off-by: Oleksij Rempel <o.rempel@pengutronix.de>
Reviewed-by: Linus Walleij <linusw@kernel.org>
Reviewed-by: Alvin Šipraga <alvin.sipraga@analog.com>
Reviewed-by: Luiz Angelo Daros de Luca <luizluca@gmail.com>
---
Changes in v3:
- No changes.

Changes in v2:
- use a lookup table instead of the switch (Luiz)
- check the lookup table size at build time
- kernel-doc: cite Table 6-3 instead of Table I-7, fix the sentence on
  7P1D/6P2D/5P3D, document the stub's return value
- commit message: cite Table 6-3 instead of Table I-7
- reword the @IEEE8021Q_TT_BE kernel-doc and the enum title
- keep Linus's Reviewed-by: the mapping is unchanged
---
 include/net/ieee8021q.h      | 15 ++++++++++++---
 net/core/ieee8021q_helpers.c | 42 ++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 54 insertions(+), 3 deletions(-)

diff --git a/include/net/ieee8021q.h b/include/net/ieee8021q.h
index 8bfe903dd3d00fb432b32e3150d77f3a43d00f0c..c6c8c94ec7fb39603f631d50928f2354bfcd8f81 100644
--- a/include/net/ieee8021q.h
+++ b/include/net/ieee8021q.h
@@ -7,11 +7,14 @@
 #include <linux/errno.h>
 
 /**
- * enum ieee8021q_traffic_type - 802.1Q traffic type priority values (802.1Q-2022)
+ * enum ieee8021q_traffic_type - 802.1Q traffic types (802.1Q-2022)
  *
  * @IEEE8021Q_TT_BK: Background
- * @IEEE8021Q_TT_BE: Best Effort (default). According to 802.1Q-2022, BE is 0
- * but has higher priority than BK which is 1.
+ * @IEEE8021Q_TT_BE: Best Effort (default). The enum value is not the 802.1Q
+ * priority. IEEE 802.1Q-2022 (Annex I.4, Table I-2) gives Best Effort priority
+ * 0 and Background priority 1, and says that priority 1 is lower than priority
+ * 0. The enum orders the traffic types lowest first, so Background is 0 and
+ * Best Effort is 1.
  * @IEEE8021Q_TT_EE: Excellent Effort
  * @IEEE8021Q_TT_CA: Critical Applications
  * @IEEE8021Q_TT_VI: Video, < 100 ms latency and jitter
@@ -38,6 +41,7 @@ enum ieee8021q_traffic_type {
 #if IS_ENABLED(CONFIG_NET_IEEE8021Q_HELPERS)
 
 int ietf_dscp_to_ieee8021q_tt(u8 dscp);
+int ieee8021q_pcp_to_tt(u8 pcp);
 int ieee8021q_tt_to_tc(enum ieee8021q_traffic_type tt, unsigned int num_queues);
 
 #else
@@ -47,6 +51,11 @@ static inline int ietf_dscp_to_ieee8021q_tt(u8 dscp)
 	return -EOPNOTSUPP;
 }
 
+static inline int ieee8021q_pcp_to_tt(u8 pcp)
+{
+	return -EOPNOTSUPP;
+}
+
 static inline int ieee8021q_tt_to_tc(enum ieee8021q_traffic_type tt,
 				     unsigned int num_queues)
 {
diff --git a/net/core/ieee8021q_helpers.c b/net/core/ieee8021q_helpers.c
index bbacdfff9b4c2ec14779baa79d341527fed1920c..b052120e67c525ac5a45b26de4cb879a0d758d17 100644
--- a/net/core/ieee8021q_helpers.c
+++ b/net/core/ieee8021q_helpers.c
@@ -2,6 +2,7 @@
 // Copyright (c) 2024 Pengutronix, Oleksij Rempel <kernel@pengutronix.de>
 
 #include <linux/array_size.h>
+#include <linux/if_vlan.h>
 #include <linux/printk.h>
 #include <linux/types.h>
 #include <net/dscp.h>
@@ -222,3 +223,44 @@ int ietf_dscp_to_ieee8021q_tt(u8 dscp)
 	return SIMPLE_IETF_DSCP_TO_IEEE8021Q_TT(dscp);
 }
 EXPORT_SYMBOL_GPL(ietf_dscp_to_ieee8021q_tt);
+
+/* Index: the PCP, which in 8P0D is the 802.1Q priority. Priority 0 is Best
+ * Effort and priority 1 Background, the reverse of their enum order.
+ */
+static const u8 ieee8021q_pcp_to_tt_map[] = {
+	[0] = IEEE8021Q_TT_BE,
+	[1] = IEEE8021Q_TT_BK,
+	[2] = IEEE8021Q_TT_EE,
+	[3] = IEEE8021Q_TT_CA,
+	[4] = IEEE8021Q_TT_VI,
+	[5] = IEEE8021Q_TT_VO,
+	[6] = IEEE8021Q_TT_IC,
+	[7] = IEEE8021Q_TT_NC,
+};
+
+static_assert(ARRAY_SIZE(ieee8021q_pcp_to_tt_map) ==
+	      (VLAN_PRIO_MASK >> VLAN_PRIO_SHIFT) + 1);
+
+/**
+ * ieee8021q_pcp_to_tt - Map an IEEE 802.1Q PCP to a traffic type
+ * @pcp: IEEE 802.1Q Priority Code Point value
+ *
+ * Decode @pcp with the 8P0D row of Table 6-3 (IEEE 802.1Q-2022, 6.9.3). In that
+ * row the priority equals the PCP, and no PCP carries drop eligibility. Then
+ * look up the traffic type for that priority in Table I-2. The enum values of
+ * Best Effort and Background are not their priorities, see
+ * &enum ieee8021q_traffic_type.
+ *
+ * The other rows of Table 6-3 (7P1D, 6P2D, 5P3D) are not decoded here.
+ *
+ * Return: the traffic type, or -EINVAL if @pcp is above 7. Without
+ * CONFIG_NET_IEEE8021Q_HELPERS, the stub returns -EOPNOTSUPP.
+ */
+int ieee8021q_pcp_to_tt(u8 pcp)
+{
+	if (pcp >= ARRAY_SIZE(ieee8021q_pcp_to_tt_map))
+		return -EINVAL;
+
+	return ieee8021q_pcp_to_tt_map[pcp];
+}
+EXPORT_SYMBOL_GPL(ieee8021q_pcp_to_tt);

-- 
2.47.3

