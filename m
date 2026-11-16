Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=185.203.200.13
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794856226;
	b=b8BQ/HhzpmyG+lfetHATVxCUOjfx0sheYP8WiGsBChZZQD2l3/9NgcBcqiKugBeLeDsG
	 ljvuy1b9tVcd/lR4nXfYtfId9a9hgK5a2VF4TMoPt5w65RvqN5+UHWmrNOD7RhDubWxqH
	 sSQFxBdF11JW9d8CIR46ca+XsHhmw9V03F5BD47g4InSO12ecDnYNuCpMox9AAP3f6pN+
	 2jJN/IQ868vkK+MBui/6WRUoEd8a6xi+eZXekYjlgsny8TTOcLPuoddAmCGnq5xD7nvH/
	 uxmGvLceBhGhb0yAqaiAaQP3UnBD4yOl6qj7C8JGrw15Rl1M85vYRgbqkoyikGyHhow==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794856226;
	h=DMARC-Filter:Received:DKIM-Signature:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer;
	bh=r/OGr1JJS1aXLU6v1ptyyAkQfVVKUeLlfdhnGZZIUao=;
	b=2WHGLVN+D8QM91qCr30I3aNDRJ6O1FfeVz9PuWNqLQiWW+5j3AD8539YPEi1hAIVgNTk
	 haUd4T5c+oIeujI14IEfHTbsXEzXwhoGO/XSZwPTOqDkeUv3V27vlcJn03DVeJEWXRmJh
	 rmez/vlDkRwHL08jbH9iT4q3QwZk62Uj5TBDf0MTs6gB9d3bq9K/nCUvTjKBuMxSKlMSf
	 ufQOU6MY27ROpGAaksAgXLCigQ078m2s4nxTosglE3DRn99cFoi+fHjsVxX3C4Ylabtn3
	 bSTeg5U5P651cm8Wmary9LUU246v3GHFg3DuVvKsErn5RmKmuz7GY/MdTIx2PO4Fiow==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=pengutronix.de;
	spf=pass smtp.mailfrom=pengutronix.de;
	dkim=pass header.d=pengutronix.de header.i=@pengutronix.de header.a=rsa-sha256 header.s=20260414 header.b=Q36KWJaZ;
	arc=pass header.oldest-pass=0 smtp.remote-ip=185.203.200.13
Received: from mx1.white.stw.pengutronix.de (mx1.white.stw.pengutronix.de [185.203.200.13])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3AE960A3817;
	Mon, 16 Nov 2026 19:10:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C3AE960A3817
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pengutronix.de header.i=@pengutronix.de header.a=rsa-sha256 header.s=20260414 header.b=Q36KWJaZ
Received: from dude04.red.stw.pengutronix.de (dude04.red.stw.pengutronix.de [IPv6:2a0a:edc0:0:1101:1d::ac])
	(Authenticated sender: relay-from-dude04.red.stw.pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id 18888205A3A;
	Mon, 16 Nov 2026 20:10:20 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1794856220;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=r/OGr1JJS1aXLU6v1ptyyAkQfVVKUeLlfdhnGZZIUao=;
	b=Q36KWJaZkRAl6JBhwJa0VmEMcSoQ7i3vtGmeW4YR74ICEv8BTk+bBX20WNaHJrDzrlj2DM
	Ym2dYd3wRyLc1HZ/O8IoKp2r/3KJ7bcPRYfA0cMh4j02MblYDavEVypXpNR7AAu1B0AFwK
	YnHZ5alLG4GDU+ugCj/DKs3w2bpfl4Y0fbdidAH0fU49jFSV8BLj9H1jF5WBBGPjiYxJGU
	RYXrcvekxaLTU0lVaNyuZfeKVAPqHJc9UPA46ZAjU4imvBcxSo7HXecG0ZL96gdEBRptIn
	Yklh2GIaAtHBfRJTpSEtwj6ILOiNTGLdJvkODeoSooAMVAoS7ArX7mDt5KQCeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1794856220;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=r/OGr1JJS1aXLU6v1ptyyAkQfVVKUeLlfdhnGZZIUao=;
	b=HvsBWBlFrCGMdLL/31sMAWTYTaqdkUxt9HIIYqmrswdgRAcIGH2onWPvCqFEcB73sactYD
	wulBXHM7edL9WDawLDLI2z2kNMmPCFurxpQ5hmyF0PWf/83rI8cG/tnx43a6T8FoMzS5JJ
	1B5eT1oY+w0s94znTZZCAceDB/YvL44EkVlu2CqdkyX4mtt0I/HTjiajvTeRPeJdBD0n4O
	mdW9G9fMlZTYKwTQ7RD2fYuhg+xdhFmAdLqK3+kb2stwEsm4sEowjykLNYWlIrl0qzBh0X
	2gWuDB4CNGY2cbOijdDm8CipHEyx1gB6LRciGbs3pzXvAgN3yUw6VI3HfGCBHQ==
ARC-Seal: i=1; s=20260414; d=pengutronix.de; t=1794856220; a=rsa-sha256;
	cv=none;
	b=fjTMhzTa1kxig1zbO2OrwVX8W9paDYcXJvddmzsflowedcixUAqACI8/zLrrA436Qsp3oR
	1cVqK6hKRw+BOM1JzrDQEp8v1Yd6BFn1IWaf4UhIo/2+cTUg9GsPqI9Uvvuk1h8fc29U86
	tftmzxL+sX/zBnJ9VVlTmemZLR94vhFMDR8M0+CU6dsJdO3gJa0PHObQmFnpJXDY+MGO1R
	9P9knydNKkIIHReb18TWGdYrat4nFOMOh2a3kw9XtujJfP2mZXOvavBtz0wyuo313G8HXw
	BzcMVmeO3jx/Vo2mQJao7+uA42Pr5hcxsuim8VOV2lD9ajzKB3tnKgP81GP5ew==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=relay-from-dude04.red.stw.pengutronix.de smtp.mailfrom=ore@pengutronix.de
Received: by dude04.red.stw.pengutronix.de (Postfix, from userid 1058)
	id BB2C6381FB9; Mon, 16 Nov 2026 20:10:15 +0100 (CET)
From: Oleksij Rempel <o.rempel@pengutronix.de>
Date: Mon, 16 Nov 2026 20:10:21 +0100
Subject: [PATCH net-next v3 10/10] net: dsa: realtek: rtl8365mb: report the
 DCB DSCP-to-priority map
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
Message-Id: <20261116-rtl8365mb-dcb-ingress-v3-10-657f5fdb4db7@pengutronix.de>
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

Report the DSCP-to-priority map through dcbnl, so that "dcb app show"
lists, on every port, the priority a DSCP value gets once the port
trusts DSCP.

The switch has one DSCP-to-priority table for all its ports, with
exactly one priority per DSCP value. dcbnl, in contrast, configures DSCP
priorities per port and allows several priorities for one DSCP value.
DSA could mirror a change to every port (dscp_prio_mapping_is_global),
but a request on one port would still change the classification of all
ports. Keep the map read-only. The QoS baseline seeds it with the
default mapping from ietf_dscp_to_ieee8021q_tt(). Requests to change a
DSCP entry fail with -EOPNOTSUPP.

Signed-off-by: Oleksij Rempel <o.rempel@pengutronix.de>
Reviewed-by: Linus Walleij <linusw@kernel.org>
Reviewed-by: Alvin Šipraga <alvin.sipraga@analog.com>
Reviewed-by: Luiz Angelo Daros de Luca <luizluca@gmail.com>
---
Q: The v1 review (Linus) suggested DSCP get, add and delete callbacks
in the common code, and setting ds->dscp_prio_mapping_is_global when
registering DSCP offload. Why are add, delete and the flag gone in v2?
A: The DSCP get moved into the shared code as asked. Add and del were
dropped because the table is chip-wide, as the commit message explains.
Without add and del, nothing would use the flag, so it is not set.

Changes in v3:
- No changes.

Changes in v2:
- make the DSCP map read-only, as the table is shared by all ports of
  the chip and per-port remapping would change every port
- drop the DSCP add/del ops, whose delete path could leave the hardware
  out of step with the remaining APP entries (sashiko)
- do not set ds->dscp_prio_mapping_is_global; without DSCP add/del
  nothing needs its global set/del path (sashiko)
- retitled (was "offload DCB DSCP-to-priority")
- move the DSCP get handling into rtl83xx-qos.c behind a new
  qos_get_dscp_prio callback (Linus)
- DSCP table seeding moved to the baseline patch
- read the table entry through rtl8365mb_qos_regmap_read_field(), which
  uses field_get() (Luiz)
---
 drivers/net/dsa/realtek/realtek.h        |  1 +
 drivers/net/dsa/realtek/rtl8365mb_main.c |  2 ++
 drivers/net/dsa/realtek/rtl8365mb_qos.c  |  7 +++++++
 drivers/net/dsa/realtek/rtl8365mb_qos.h  |  1 +
 drivers/net/dsa/realtek/rtl83xx-qos.c    | 19 +++++++++++++++++++
 drivers/net/dsa/realtek/rtl83xx-qos.h    |  1 +
 6 files changed, 31 insertions(+)

diff --git a/drivers/net/dsa/realtek/realtek.h b/drivers/net/dsa/realtek/realtek.h
index 8d2293dc12b22257e5615e5d66e85f3d4653b5b0..cfe56d30f5cb1c6fabf381dd55e73934cbc66abb 100644
--- a/drivers/net/dsa/realtek/realtek.h
+++ b/drivers/net/dsa/realtek/realtek.h
@@ -182,6 +182,7 @@ struct realtek_ops {
 				     u8 iprio, u8 untag_pcp);
 	int	(*qos_set_pcp_prio)(struct realtek_priv *priv, u8 pcp,
 				    u8 iprio);
+	int	(*qos_get_dscp_prio)(struct realtek_priv *priv, u8 dscp);
 	int	(*qos_set_dscp_prio)(struct realtek_priv *priv, u8 dscp,
 				     u8 iprio);
 	/* @trust is indexed by enum rtl83xx_apptrust_slot and has @n entries.
diff --git a/drivers/net/dsa/realtek/rtl8365mb_main.c b/drivers/net/dsa/realtek/rtl8365mb_main.c
index 9be0842831486f6f90f94cc1862099b42d6f2225..6c11c3631eb10f8eebdb8526908534c2256ed12d 100644
--- a/drivers/net/dsa/realtek/rtl8365mb_main.c
+++ b/drivers/net/dsa/realtek/rtl8365mb_main.c
@@ -3482,6 +3482,7 @@ static const struct dsa_switch_ops rtl8365mb_switch_ops = {
 	.port_set_default_prio = rtl83xx_port_set_default_prio,
 	.port_get_apptrust = rtl83xx_port_get_apptrust,
 	.port_set_apptrust = rtl83xx_port_set_apptrust,
+	.port_get_dscp_prio = rtl83xx_port_get_dscp_prio,
 	.port_stp_state_set = rtl8365mb_port_stp_state_set,
 	.port_fast_age = rtl83xx_port_fast_age,
 	.port_fdb_add = rtl83xx_port_fdb_add,
@@ -3527,6 +3528,7 @@ static const struct realtek_ops rtl8365mb_ops = {
 	.qos_get_port_prio = rtl8365mb_qos_get_port_prio,
 	.qos_set_port_prio = rtl8365mb_qos_set_port_prio,
 	.qos_set_pcp_prio = rtl8365mb_qos_set_pcp_prio,
+	.qos_get_dscp_prio = rtl8365mb_qos_get_dscp_prio,
 	.qos_set_dscp_prio = rtl8365mb_qos_set_dscp_prio,
 	.qos_set_apptrust = rtl8365mb_qos_set_apptrust,
 	.qos_get_apptrust = rtl8365mb_qos_get_apptrust,
diff --git a/drivers/net/dsa/realtek/rtl8365mb_qos.c b/drivers/net/dsa/realtek/rtl8365mb_qos.c
index e96a99f3fbf5fca0af40dff9be221d7ceb5e885c..5b9e1abe75c8b43b0cb6d07de0fd2ac09353f9d1 100644
--- a/drivers/net/dsa/realtek/rtl8365mb_qos.c
+++ b/drivers/net/dsa/realtek/rtl8365mb_qos.c
@@ -253,6 +253,13 @@ int rtl8365mb_qos_set_pcp_prio(struct realtek_priv *priv, u8 pcp, u8 iprio)
 	return rtl8365mb_qos_regmap_update_field(priv, reg, mask, iprio);
 }
 
+int rtl8365mb_qos_get_dscp_prio(struct realtek_priv *priv, u8 dscp)
+{
+	return rtl8365mb_qos_regmap_read_field(priv,
+					       RTL8365MB_QOS_DSCP_PRI_REG(dscp),
+					       rtl8365mb_qos_sel_mask(dscp));
+}
+
 int rtl8365mb_qos_set_dscp_prio(struct realtek_priv *priv, u8 dscp, u8 iprio)
 {
 	u32 reg = RTL8365MB_QOS_DSCP_PRI_REG(dscp);
diff --git a/drivers/net/dsa/realtek/rtl8365mb_qos.h b/drivers/net/dsa/realtek/rtl8365mb_qos.h
index eed5ea5fa7f345ce6989e3e890d7cd755da9d0fc..9602807f7db5b9c5bf0202612e4cd77b85079cb7 100644
--- a/drivers/net/dsa/realtek/rtl8365mb_qos.h
+++ b/drivers/net/dsa/realtek/rtl8365mb_qos.h
@@ -23,6 +23,7 @@ int rtl8365mb_qos_get_port_prio(struct realtek_priv *priv, int port);
 int rtl8365mb_qos_set_port_prio(struct realtek_priv *priv, int port, u8 iprio,
 				u8 untag_pcp);
 int rtl8365mb_qos_set_pcp_prio(struct realtek_priv *priv, u8 pcp, u8 iprio);
+int rtl8365mb_qos_get_dscp_prio(struct realtek_priv *priv, u8 dscp);
 int rtl8365mb_qos_set_dscp_prio(struct realtek_priv *priv, u8 dscp, u8 iprio);
 int rtl8365mb_qos_set_apptrust(struct realtek_priv *priv, int port,
 			       const bool *trust, unsigned int n);
diff --git a/drivers/net/dsa/realtek/rtl83xx-qos.c b/drivers/net/dsa/realtek/rtl83xx-qos.c
index d08ffd585caf7d91f4ddff10b90d6eafd2a2a734..f294222987eff8ba283688600c6eaba983669ea6 100644
--- a/drivers/net/dsa/realtek/rtl83xx-qos.c
+++ b/drivers/net/dsa/realtek/rtl83xx-qos.c
@@ -134,6 +134,25 @@ int rtl83xx_port_set_default_prio(struct dsa_switch *ds, int port, u8 prio)
 }
 EXPORT_SYMBOL_NS_GPL(rtl83xx_port_set_default_prio, "REALTEK_DSA");
 
+int rtl83xx_port_get_dscp_prio(struct dsa_switch *ds, int port, u8 dscp)
+{
+	struct realtek_priv *priv = ds->priv;
+	int tt;
+
+	if (!priv->ops->qos_get_dscp_prio)
+		return -EOPNOTSUPP;
+
+	if (dscp >= DSCP_MAX)
+		return -EINVAL;
+
+	tt = priv->ops->qos_get_dscp_prio(priv, dscp);
+	if (tt < 0)
+		return tt;
+
+	return ieee8021q_tt_to_pcp(tt);
+}
+EXPORT_SYMBOL_NS_GPL(rtl83xx_port_get_dscp_prio, "REALTEK_DSA");
+
 int rtl83xx_port_get_apptrust(struct dsa_switch *ds, int port, u8 *sel,
 			      int *nsel)
 {
diff --git a/drivers/net/dsa/realtek/rtl83xx-qos.h b/drivers/net/dsa/realtek/rtl83xx-qos.h
index fbddc7b7d9dd37918423afc5373b684596637a05..06dbfd24b1af5cced870f463f15b1b39eceb56ee 100644
--- a/drivers/net/dsa/realtek/rtl83xx-qos.h
+++ b/drivers/net/dsa/realtek/rtl83xx-qos.h
@@ -15,5 +15,6 @@ int rtl83xx_port_get_apptrust(struct dsa_switch *ds, int port, u8 *sel,
 			      int *nsel);
 int rtl83xx_port_set_apptrust(struct dsa_switch *ds, int port, const u8 *sel,
 			      int nsel);
+int rtl83xx_port_get_dscp_prio(struct dsa_switch *ds, int port, u8 dscp);
 
 #endif /* _RTL83XX_QOS_H */

-- 
2.47.3

