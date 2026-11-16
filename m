Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=185.203.200.13
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794856222;
	b=ov8XkFHWY/jIi4Lkc5l1lBfsDhYyLvmjyjxspszMYWnAnLAZNAiWCI3bbSGi8glwUsOF
	 LV8DXcgwvjEMxzYSe7Xk2AltJ1Gg+bhAT//To1FcJ7a55Xx8Qw5PnfE3e3h5mbhISYLek
	 JR9jK4lw0Umqa04ITjg8rywhqQwAuckg0OzzSwX7NCQOjtQUeD0LQqNe5TAxgA7LWRf8j
	 SWC53rGq+wxq17mCRIqsILdNpot8Y8EggnSCvRHHF/Pz9PxZAGtkhqvy3JNe/mSaCP7f7
	 htJS4I6Q8y0tTyutLdDlTpOdMaMeHpDxrV0GurWYjhWvFBjo8qN8drPwmVdKArQKUTw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794856222;
	h=DMARC-Filter:Received:DKIM-Signature:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer;
	bh=JiflUCyDYVB4YnxXiWVeaUFpLNA98DsttOU6bqJ/Abo=;
	b=Bgrdb9Fo+3sUXZbfHfweEN8PHebT0iVrADSNpUbTg2FfW6MNDdXlUyd3uWTl0v32sNVB
	 Kn/B0ijIPVlxc7rwD+FfVExYJOvmxCRHW2fg3cJiKTnvEavuWmQEFKV6fPY7EdooCbUzI
	 cV0emJjPd37OPNCtWgnCGbznabkcxfsHcJver7HkWp1DaB24OePfd7gxX0oA533IwFjzq
	 exrZpAwdTG8HeFofHCTSQqadKcP0RTirB+JXEVDlVJC1+P8d8OdvV7OCy8rZo//AP5DTt
	 ak6DLxpXW2+jpsd0m3X1mnubLGi4ku7U1fj4TKB/lFufoA6gX1fkeSGGBsJhfPTyz4A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=pengutronix.de;
	spf=pass smtp.mailfrom=pengutronix.de;
	dkim=pass header.d=pengutronix.de header.i=@pengutronix.de header.a=rsa-sha256 header.s=20260414 header.b="NHF7N/CM";
	arc=pass header.oldest-pass=0 smtp.remote-ip=185.203.200.13
Received: from mx1.white.stw.pengutronix.de (mx1.white.stw.pengutronix.de [185.203.200.13])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8CD9606A32C;
	Mon, 16 Nov 2026 19:10:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E8CD9606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pengutronix.de header.i=@pengutronix.de header.a=rsa-sha256 header.s=20260414 header.b=NHF7N/CM
Received: from dude04.red.stw.pengutronix.de (dude04.red.stw.pengutronix.de [IPv6:2a0a:edc0:0:1101:1d::ac])
	(Authenticated sender: relay-from-dude04.red.stw.pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id D66F3205A2F;
	Mon, 16 Nov 2026 20:10:15 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1794856215;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JiflUCyDYVB4YnxXiWVeaUFpLNA98DsttOU6bqJ/Abo=;
	b=NHF7N/CMZwkIRcBMZ9FKTsaNIAfezZGlMjLgRgIET0yHmEcB7mrADCMPdvhyTYxqsg2cTz
	+AshAz3Bo1D3WJad5gfINSMPPI8PV0YssffqOYJvbkRUT9/EoN0xRooDgGAwKX7STw9Nf6
	0LGMSxx71JFRSAfMN2CyTRc4DB28DKRNOCB65N4pAJ0lDeYebkQN1cJc+mE7OQEcPuo1pc
	vrSaplkO4V4CjAr1apT7es51bmbHPjeyqM8hbBOfmepbeKmufw5ouf1OMxXMYljHeHgxuj
	fhR1v3c520Mq7cNyqe91sVH6/PSs3tmGKfENHljTxV93n2vL/A6Em3lwTTq20Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1794856215;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JiflUCyDYVB4YnxXiWVeaUFpLNA98DsttOU6bqJ/Abo=;
	b=WkMfwI/QPanHykpeK5eW3aQ8VR5j18bAQE4jcMCtujSX421TyxGkkMWwcNa4BLeXe21WOp
	vtbKqny0XmMEgZ7b2YClXbmYsDRI/BoAzCBfoFcrESn9than5TTCcMgZP4cGYJvSsVmBef
	JCEpGKP6sMIRbhN3J3EjpuJjtAhOF+dTfeh4OKmSdo+6sj2rMuIP+B/PPR7ySyRrVNyMA7
	cWuBn3SB4WykeP7XtxkaDVkWPLVix2+f+/4ptfHk87TCvgptcTeGZJbkqNkn9xJ6V60zkw
	oVOuIKDmamSaeuAZbah0n2RLXgJ3KI97bVRXlhFIqPJ+avOfDx/9dfrNPAIbcA==
ARC-Seal: i=1; s=20260414; d=pengutronix.de; t=1794856215; a=rsa-sha256;
	cv=none;
	b=dEINvEdXTovK9o/g/FWxM026oDCeLSJom+yKtPdQ5wmE9YNxOM5KrX07MKk2wlikp6oFy5
	J3QNcpdwCIuISOJhXIdlbtq2/BktShevFeKQdPAEcdWOSMhH3f3f1AQ1TBrCmbNcM0s27p
	LNXVM9o0fDgbE43jYoFaUXPjd1l1Np9U307ERfQuV0Mmq44e3J8JFmW1IsMBP8YRR0I3qh
	357XAZyqjErn/hS315JWmA2bRM/NYkJD1nwwKP0AAdhoVsBPcI7qhT+AJjZAUpg98/UGAK
	SnT7dtzmVFjtw3ZNm8RVLjEXSTKaeA8f63JrC0Hp1NMqyRZDSlCjk6IvRi9zOw==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=relay-from-dude04.red.stw.pengutronix.de smtp.mailfrom=ore@pengutronix.de
Received: by dude04.red.stw.pengutronix.de (Postfix, from userid 1058)
	id B0DC8381553; Mon, 16 Nov 2026 20:10:15 +0100 (CET)
From: Oleksij Rempel <o.rempel@pengutronix.de>
Date: Mon, 16 Nov 2026 20:10:15 +0100
Subject: [PATCH net-next v3 04/10] net: ieee8021q: add tt_to_pcp()
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
Message-Id: <20261116-rtl8365mb-dcb-ingress-v3-4-657f5fdb4db7@pengutronix.de>
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

Add ieee8021q_tt_to_pcp(), the inverse of ieee8021q_pcp_to_tt(): it
encodes an 802.1Q traffic type back to its Priority Code Point, and
completes the pcp/tt helper family.

A driver that reseeds its PCP classifier through ieee8021q_pcp_to_tt()
stores traffic types in the hardware tables, while the dcbnl priority
ops exchange 802.1p priorities across the DSA boundary. Reading such a
table back therefore needs the reverse mapping to restore the 802.1p
value, which no existing helper provides. Because pcp_to_tt only
transposes Best Effort and Background and is the identity elsewhere the
two directions are numerically equal; provide tt_to_pcp as its own named
function so the read path does not decode a traffic type as if it were a
PCP.

The first user is the Realtek rtl8365mb DSA driver, whose dcbnl
get_default_prio and get_dscp_prio paths read back traffic types and
must return 802.1p priorities.

Signed-off-by: Oleksij Rempel <o.rempel@pengutronix.de>
Reviewed-by: Linus Walleij <linusw@kernel.org>
Reviewed-by: Alvin Šipraga <alvin.sipraga@analog.com>
Reviewed-by: Luiz Angelo Daros de Luca <luizluca@gmail.com>
---
Changes in v3:
- No changes.

Changes in v2:
- look the PCP up in the pcp_to_tt() table instead of a switch, so the
  two helpers cannot disagree (Luiz)
- check at build time that the table has one entry per traffic type
- kernel-doc: cite the encoding table, Table 6-2 (6.9.3), not the
  decoding Table I-7, and name the IEEE 802.1Q-2022 edition
- kernel-doc: refer to the enum doc for the Best Effort/Background
  order, and document each return value, including the stub's
- keep Linus's Reviewed-by: the mapping is unchanged
---
 include/net/ieee8021q.h      |  6 ++++++
 net/core/ieee8021q_helpers.c | 26 ++++++++++++++++++++++++++
 2 files changed, 32 insertions(+)

diff --git a/include/net/ieee8021q.h b/include/net/ieee8021q.h
index c6c8c94ec7fb39603f631d50928f2354bfcd8f81..c0cb6a8004da451fe2be835b9ec1f6fbef1779d5 100644
--- a/include/net/ieee8021q.h
+++ b/include/net/ieee8021q.h
@@ -42,6 +42,7 @@ enum ieee8021q_traffic_type {
 
 int ietf_dscp_to_ieee8021q_tt(u8 dscp);
 int ieee8021q_pcp_to_tt(u8 pcp);
+int ieee8021q_tt_to_pcp(enum ieee8021q_traffic_type tt);
 int ieee8021q_tt_to_tc(enum ieee8021q_traffic_type tt, unsigned int num_queues);
 
 #else
@@ -56,6 +57,11 @@ static inline int ieee8021q_pcp_to_tt(u8 pcp)
 	return -EOPNOTSUPP;
 }
 
+static inline int ieee8021q_tt_to_pcp(enum ieee8021q_traffic_type tt)
+{
+	return -EOPNOTSUPP;
+}
+
 static inline int ieee8021q_tt_to_tc(enum ieee8021q_traffic_type tt,
 				     unsigned int num_queues)
 {
diff --git a/net/core/ieee8021q_helpers.c b/net/core/ieee8021q_helpers.c
index 8fd3ea87c7bcb6d7f34a4cf5969530633edd6abb..d9033398b0ec6320c4e0e2fa3f0913d96937d72e 100644
--- a/net/core/ieee8021q_helpers.c
+++ b/net/core/ieee8021q_helpers.c
@@ -245,6 +245,8 @@ static const u8 ieee8021q_pcp_to_tt_map[] = {
 
 static_assert(ARRAY_SIZE(ieee8021q_pcp_to_tt_map) ==
 	      (VLAN_PRIO_MASK >> VLAN_PRIO_SHIFT) + 1);
+/* ieee8021q_tt_to_pcp() needs one entry per traffic type. */
+static_assert(ARRAY_SIZE(ieee8021q_pcp_to_tt_map) == IEEE8021Q_TT_MAX);
 
 /**
  * ieee8021q_pcp_to_tt - Map an IEEE 802.1Q PCP to a traffic type
@@ -269,3 +271,27 @@ int ieee8021q_pcp_to_tt(u8 pcp)
 	return ieee8021q_pcp_to_tt_map[pcp];
 }
 EXPORT_SYMBOL_GPL(ieee8021q_pcp_to_tt);
+
+/**
+ * ieee8021q_tt_to_pcp - Map an IEEE 802.1Q traffic type to a PCP
+ * @tt: IEEE 802.1Q traffic type
+ *
+ * Encode @tt to its priority per Table I-2 (IEEE 802.1Q-2022, I.4). Then
+ * encode the priority to its PCP per the 8P0D row of Table 6-2 (6.9.3). This
+ * is the inverse of ieee8021q_pcp_to_tt(). The enum values of Best Effort and
+ * Background are not their priorities, see &enum ieee8021q_traffic_type.
+ *
+ * Return: the PCP (0..7), or -EINVAL if @tt is not a traffic type. Without
+ * CONFIG_NET_IEEE8021Q_HELPERS, the stub returns -EOPNOTSUPP.
+ */
+int ieee8021q_tt_to_pcp(enum ieee8021q_traffic_type tt)
+{
+	int pcp;
+
+	for (pcp = 0; pcp < ARRAY_SIZE(ieee8021q_pcp_to_tt_map); pcp++)
+		if (ieee8021q_pcp_to_tt_map[pcp] == tt)
+			return pcp;
+
+	return -EINVAL;
+}
+EXPORT_SYMBOL_GPL(ieee8021q_tt_to_pcp);

-- 
2.47.3

