Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=185.203.200.13
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794856226;
	b=xJFOg1GPBOxbgg5CYEzlx6SrTKSXiHaZHcqoa3zhnGbQqef5D/GGwylJKTczIfIBBA8K
	 zIHqiBrk7tp5B65UORt50SpoZRmx+drC14ZeIImZpszoRW2kiKmAJUOyB3w7zUn5LXpU/
	 UEjTHezsZOiSY5xFAzUL/i5zd6NQZhq0V+pNd7iqPdre/+ckssbaGkHg+QF3PQjcRs+Ns
	 A7w7yJeC1Dauc9OtOD4qQ+9eo/y1xp3sza8pMiEWPsoDnnCzaCsVUfedUsuh9wAYBYYf4
	 FACLIcgK0Uwt3Od0RLi1eriSUWYweoXeewA3hRXGGxsBUUJw/ThgQkzaQIVSbNdHu6Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794856226;
	h=DMARC-Filter:Received:DKIM-Signature:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer;
	bh=R8h/1u82nAsp/z0eA2iVxRK1Q1LDSnAV70Vy7GJyLJM=;
	b=H9DBNNbq478X6Q21ea+tSwmL8Or5yo1bHCKFNOu4SagU3KdaXf4fpQIFEZH2gF/aVlG4
	 jARuxsburBCdY8VgWnVSwyCWJC1N6lxGuz7je7/2GIxdzI2Fm/cCVSOc/tcrsLoI73Mb9
	 3t5C3Mf27pyWORF+Q4Imh66EzFQVA1t8ghcluYvozO/6jargjHo6SBbffO7KNCVFZob+b
	 UHCm+9TOwnjTjDmll5XU50yfFBzdJgObzFLXIupqXR0lONkwnlRBojOv+KIKAt2HyJRxc
	 9PuIQxcA89Qj49JKIhdusS/B6n7Qmicj8XWzM1R9Z+qFyw3asOYpZXXk3zKxOnR+GXA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=pengutronix.de;
	spf=pass smtp.mailfrom=pengutronix.de;
	dkim=pass header.d=pengutronix.de header.i=@pengutronix.de header.a=rsa-sha256 header.s=20260414 header.b="ArKYIk/s";
	arc=pass header.oldest-pass=0 smtp.remote-ip=185.203.200.13
Received: from mx1.white.stw.pengutronix.de (mx1.white.stw.pengutronix.de [185.203.200.13])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3A8760A3815;
	Mon, 16 Nov 2026 19:10:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C3A8760A3815
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pengutronix.de header.i=@pengutronix.de header.a=rsa-sha256 header.s=20260414 header.b=ArKYIk/s
Received: from dude04.red.stw.pengutronix.de (dude04.red.stw.4.pengutronix.de [10.17.1.12])
	(Authenticated sender: relay-from-dude04.red.stw.pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id 15C87205A39;
	Mon, 16 Nov 2026 20:10:20 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1794856220;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=R8h/1u82nAsp/z0eA2iVxRK1Q1LDSnAV70Vy7GJyLJM=;
	b=ArKYIk/sofuUsDbMaIKD+35zuhwkrWm2+uQBdE0UiIy54ZxHLsIYOvEAMFyti30u0O7AoX
	6DOhmX/xK6XEVK+6DT4XvqaHQaCkSyQYcnTOloVhXILAEHAZiwF1eLO/lTkl5oUxIvafWQ
	u5anrOubBpEx7CO/KAV7ACzCe5Rojx5Yi8IUgnSBtGwyWkpBZcHWLA3Bg9LDEZ/n5RTMZ1
	X5WlIZr5LMbfSjR8Q3zqnPAn/TcrRu38aoXqTj7dXQVvPvpJzjIrbbki8NEEGtpNbB6Uhb
	Hmu+PjJzi9fF6FX+q/EXvhd4vO5nPL8g1WFQVzVg+tmqnDh8SmfFIH/k/q0w7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1794856220;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=R8h/1u82nAsp/z0eA2iVxRK1Q1LDSnAV70Vy7GJyLJM=;
	b=TjP40hzAdDHeazfpj4iJll7XEupw/TmC0yFrQtQataeJMCnnWSfAcOSSBan2MgxQfXGYhC
	s0FgP/OjUVTsAwaP1Zd3KckilPLhfzJdsu4X46qwCXhM+lfnNDZ869gcPrr3udUkCHdyUg
	nNR/+qD/59RS7goXypaRVlIb3v8yz/TQAENDHPRQiithBDb1Fr2Y7ARAgm4+WT3SWOYY8D
	X4walEt+zwrfzfwQus8Mo09TuI1SVJ98CB5IjKA1XTmOrcY3trv8eQtz1ZJCnyCNEJvQf1
	y/8zWkFqzQM0hq153Uc4duwo3oDqFqzfxZCsJ3g6nKdNoZux8PeSFQC8iC5RYw==
ARC-Seal: i=1; s=20260414; d=pengutronix.de; t=1794856220; a=rsa-sha256;
	cv=none;
	b=TWzxLkOzoEfUI+PBCg8hQ10XJUjzmY/tmzOcnf5jOcSbH1hQayL/5KVN7AO9INbtI0NVTU
	6+9NauGS+29HuC/2K72Y1rFaldP8ZLhMpfxy+4henBfJz5YgfSwkKb2a9K0nLBGzUZJRMo
	qMgZcdMOWb7y1Gotmt7KsRvQV9hiwDVtMcUpqh3M61BB9nrJIRbhtE6T4SPz8QTk1Vyo1O
	pEpzZLEmeqpJ/ZGSFOpe5xgjbEhFgV8SLLwEueDQIHg1Xh6WUfYTTAvwtl/Xs2uZICDJ2g
	nmGIhCemWDBqpyioknpCEd+6hS3Ji4+A+d6MTj8xlymJWbGOOT1+Qg8DljeMJw==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=relay-from-dude04.red.stw.pengutronix.de smtp.mailfrom=ore@pengutronix.de
Received: by dude04.red.stw.pengutronix.de (Postfix, from userid 1058)
	id B98A5381F75; Mon, 16 Nov 2026 20:10:15 +0100 (CET)
From: Oleksij Rempel <o.rempel@pengutronix.de>
Date: Mon, 16 Nov 2026 20:10:20 +0100
Subject: [PATCH net-next v3 09/10] net: dsa: realtek: rtl8365mb: offload
 DCB apptrust
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
Message-Id: <20261116-rtl8365mb-dcb-ingress-v3-9-657f5fdb4db7@pengutronix.de>
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

Wire up port_get_apptrust and port_set_apptrust. The admin can then
choose through dcbnl apptrust which ingress classification a port trusts
for its priority: 802.1p (PCP), DSCP or both. A port that trusts nothing
keeps the port default priority.

In the driver's model of the hardware, the trusted priority-decision
table is switch-wide, so all ports that trust something must trust the
same selectors. While another port trusts a set of selectors, a request
to trust a different set is refused with -EBUSY.

When both are trusted, DSCP must come first. When PCP is trusted, the
switch classifies an untagged frame by the PCP given to untagged
frames. A PCP source ranked above DSCP would then hide DSCP from
untagged IP frames. Refuse the order pcp dscp and any unknown selector
with -EOPNOTSUPP.

Signed-off-by: Oleksij Rempel <o.rempel@pengutronix.de>
Reviewed-by: Linus Walleij <linusw@kernel.org>
Reviewed-by: Alvin Šipraga <alvin.sipraga@analog.com>
Reviewed-by: Luiz Angelo Daros de Luca <luizluca@gmail.com>
---
Changes in v3:
- wrap lines at 80 columns, splitting long calls into local variables
- keep the Reviewed-by tags: v3 only rewraps lines and adds local
  variables

Changes in v2:
- move selector and precedence validation into rtl83xx-qos.c behind new
  qos_get/set_apptrust callbacks; weights and -EBUSY stay here (Linus)
- use one-hot decision weights; in the driver's model, the v1 linear
  weights could tie PCP with DSCP (Linus)
- define the apptrust slot order once (enum rtl83xx_apptrust_slot) for
  the shared selector table and the backend source table
- write the PCP and DSCP weights with one register update, so a failed
  write cannot leave the trusted table half programmed (sashiko)
- check that all apptrust sources share the one register that is updated
- rank DSCP above PCP and refuse pcp dscp with -EOPNOTSUPP, because
  with PCP first, untagged IP frames never reach DSCP
---
 drivers/net/dsa/realtek/realtek.h        |  16 +++
 drivers/net/dsa/realtek/rtl8365mb_main.c |   4 +
 drivers/net/dsa/realtek/rtl8365mb_qos.c  | 172 +++++++++++++++++++++++++++++++
 drivers/net/dsa/realtek/rtl8365mb_qos.h  |   4 +
 drivers/net/dsa/realtek/rtl83xx-qos.c    |  76 ++++++++++++++
 drivers/net/dsa/realtek/rtl83xx-qos.h    |   4 +
 6 files changed, 276 insertions(+)

diff --git a/drivers/net/dsa/realtek/realtek.h b/drivers/net/dsa/realtek/realtek.h
index c79a026c7999b1d0055f336dedff64f80e1d30ec..8d2293dc12b22257e5615e5d66e85f3d4653b5b0 100644
--- a/drivers/net/dsa/realtek/realtek.h
+++ b/drivers/net/dsa/realtek/realtek.h
@@ -100,6 +100,15 @@ struct realtek_priv {
 	void			*chip_data; /* Per-chip extra variant data */
 };
 
+/* apptrust selector slots: the index into the trust[] array of the
+ * qos_get/set_apptrust callbacks, in precedence order (highest first)
+ */
+enum rtl83xx_apptrust_slot {
+	RTL83XX_APPTRUST_DSCP,
+	RTL83XX_APPTRUST_PCP,
+	RTL83XX_APPTRUST_COUNT,
+};
+
 /*
  * struct realtek_ops - vtable for the per-SMI-chiptype operations
  * @detect: detects the chiptype
@@ -175,6 +184,13 @@ struct realtek_ops {
 				    u8 iprio);
 	int	(*qos_set_dscp_prio)(struct realtek_priv *priv, u8 dscp,
 				     u8 iprio);
+	/* @trust is indexed by enum rtl83xx_apptrust_slot and has @n entries.
+	 * The trust scope (per port or switch-wide) differs between chips.
+	 */
+	int	(*qos_set_apptrust)(struct realtek_priv *priv, int port,
+				    const bool *trust, unsigned int n);
+	int	(*qos_get_apptrust)(struct realtek_priv *priv, int port,
+				    bool *trust, unsigned int n);
 };
 
 struct realtek_variant {
diff --git a/drivers/net/dsa/realtek/rtl8365mb_main.c b/drivers/net/dsa/realtek/rtl8365mb_main.c
index e3d1dadf893646addd617b68013550e2f8ab8974..9be0842831486f6f90f94cc1862099b42d6f2225 100644
--- a/drivers/net/dsa/realtek/rtl8365mb_main.c
+++ b/drivers/net/dsa/realtek/rtl8365mb_main.c
@@ -3480,6 +3480,8 @@ static const struct dsa_switch_ops rtl8365mb_switch_ops = {
 	.port_bridge_flags = rtl83xx_port_bridge_flags,
 	.port_get_default_prio = rtl83xx_port_get_default_prio,
 	.port_set_default_prio = rtl83xx_port_set_default_prio,
+	.port_get_apptrust = rtl83xx_port_get_apptrust,
+	.port_set_apptrust = rtl83xx_port_set_apptrust,
 	.port_stp_state_set = rtl8365mb_port_stp_state_set,
 	.port_fast_age = rtl83xx_port_fast_age,
 	.port_fdb_add = rtl83xx_port_fdb_add,
@@ -3526,6 +3528,8 @@ static const struct realtek_ops rtl8365mb_ops = {
 	.qos_set_port_prio = rtl8365mb_qos_set_port_prio,
 	.qos_set_pcp_prio = rtl8365mb_qos_set_pcp_prio,
 	.qos_set_dscp_prio = rtl8365mb_qos_set_dscp_prio,
+	.qos_set_apptrust = rtl8365mb_qos_set_apptrust,
+	.qos_get_apptrust = rtl8365mb_qos_get_apptrust,
 };
 
 static const char *const rtl8365mb_supplies[] = {
diff --git a/drivers/net/dsa/realtek/rtl8365mb_qos.c b/drivers/net/dsa/realtek/rtl8365mb_qos.c
index bf11a5974d6c7cf56e2ccce47f364a7dee549304..e96a99f3fbf5fca0af40dff9be221d7ceb5e885c 100644
--- a/drivers/net/dsa/realtek/rtl8365mb_qos.c
+++ b/drivers/net/dsa/realtek/rtl8365mb_qos.c
@@ -12,6 +12,7 @@
 #include <linux/build_bug.h>
 #include <linux/dcbnl.h>
 #include <linux/regmap.h>
+#include <linux/string.h>
 #include <net/dsa.h>
 #include <net/dscp.h>
 #include <net/ieee8021q.h>
@@ -114,6 +115,8 @@ static_assert(RTL8365MB_QOS_WEIGHT_BITS * RTL8365MB_QOS_WEIGHTS_PER_REG <=
 #define RTL8365MB_QOS_PRIDEC_TABLE_UNTRUSTED		0
 #define RTL8365MB_QOS_PRIDEC_TABLE_TRUSTED		1
 
+static_assert(RTL8365MB_QOS_MAX_PORTS <= RTL8365MB_QOS_REG_BITS);
+
 /* Priority-decision sources, in the hardware's numbering */
 enum rtl8365mb_qos_pridec_src {
 	RTL8365MB_QOS_PRIDEC_PORT = 0,
@@ -141,6 +144,36 @@ static_assert(RTL8365MB_QOS_PRIDEC_REG(RTL8365MB_QOS_PRIDEC_TABLE_TRUSTED,
 #define RTL8365MB_QOS_WEIGHT_DISABLED			0
 #define RTL8365MB_QOS_WEIGHT_PORT			BIT(0)
 
+/* Priority-decision source of each apptrust slot */
+static const u8 rtl8365mb_qos_apptrust_src[] = {
+	[RTL83XX_APPTRUST_DSCP]	= RTL8365MB_QOS_PRIDEC_DSCP,
+	[RTL83XX_APPTRUST_PCP]	= RTL8365MB_QOS_PRIDEC_1Q,
+};
+
+/* The 1Q source also classifies untagged frames, by the PCP given to untagged
+ * frames. Ranked above DSCP, it would hide DSCP from untagged IP frames.
+ */
+static_assert(RTL83XX_APPTRUST_DSCP < RTL83XX_APPTRUST_PCP);
+
+static_assert(ARRAY_SIZE(rtl8365mb_qos_apptrust_src) ==
+	      RTL83XX_APPTRUST_COUNT);
+
+/* Register of source @_s in the trusted decision table */
+#define RTL8365MB_QOS_APPTRUST_REG(_s) \
+	RTL8365MB_QOS_PRIDEC_REG(RTL8365MB_QOS_PRIDEC_TABLE_TRUSTED, _s)
+
+/* The top trusted rank must fit in the weight field */
+static_assert((RTL8365MB_QOS_WEIGHT_PORT <<
+	       ARRAY_SIZE(rtl8365mb_qos_apptrust_src)) <
+	      BIT(RTL8365MB_QOS_WEIGHT_BITS));
+
+/* Each trusted slot outranks the port default and every later slot */
+static u8 rtl8365mb_qos_apptrust_weight(unsigned int slot)
+{
+	return RTL8365MB_QOS_WEIGHT_PORT <<
+	       (ARRAY_SIZE(rtl8365mb_qos_apptrust_src) - slot);
+}
+
 static u32 rtl8365mb_qos_sel_mask(unsigned int idx)
 {
 	unsigned int off = RTL8365MB_QOS_SEL_OFFSET(idx);
@@ -303,6 +336,15 @@ static int rtl8365mb_qos_set_pridec(struct realtek_priv *priv, int table,
 	return rtl8365mb_qos_regmap_update_field(priv, reg, mask, weight);
 }
 
+static int rtl8365mb_qos_get_pridec(struct realtek_priv *priv, int table,
+				    int src)
+{
+	u32 reg = RTL8365MB_QOS_PRIDEC_REG(table, src);
+	u32 mask = rtl8365mb_qos_weight_mask(src);
+
+	return rtl8365mb_qos_regmap_read_field(priv, reg, mask);
+}
+
 /* Program every source in both tables rather than relying on the reset state */
 int rtl8365mb_qos_pridec_init(struct realtek_priv *priv)
 {
@@ -327,3 +369,133 @@ int rtl8365mb_qos_pridec_init(struct realtek_priv *priv)
 	/* In the driver's model, a clear bit selects the untrusted table */
 	return regmap_write(priv->map, RTL8365MB_QOS_PRIDEC_TBL_SEL_REG, 0);
 }
+
+/* Read the trust state of each apptrust slot from the trusted table */
+static int rtl8365mb_qos_apptrust_read(struct realtek_priv *priv, bool *trust)
+{
+	int table = RTL8365MB_QOS_PRIDEC_TABLE_TRUSTED;
+	int i;
+
+	for (i = 0; i < ARRAY_SIZE(rtl8365mb_qos_apptrust_src); i++) {
+		u8 src = rtl8365mb_qos_apptrust_src[i];
+		int weight;
+
+		weight = rtl8365mb_qos_get_pridec(priv, table, src);
+		if (weight < 0)
+			return weight;
+
+		trust[i] = weight != RTL8365MB_QOS_WEIGHT_DISABLED;
+	}
+
+	return 0;
+}
+
+int rtl8365mb_qos_get_apptrust(struct realtek_priv *priv, int port, bool *trust,
+			       unsigned int n)
+{
+	u32 trusted_ports;
+	int ret;
+
+	if (n != ARRAY_SIZE(rtl8365mb_qos_apptrust_src))
+		return -EINVAL;
+
+	ret = regmap_read(priv->map, RTL8365MB_QOS_PRIDEC_TBL_SEL_REG,
+			  &trusted_ports);
+	if (ret)
+		return ret;
+
+	/* On the untrusted table nothing but the port default is trusted. */
+	if (!(trusted_ports & BIT(port))) {
+		memset(trust, 0, n * sizeof(*trust));
+		return 0;
+	}
+
+	return rtl8365mb_qos_apptrust_read(priv, trust);
+}
+
+/* The trusted table is shared by all ports. A port may switch to it only if it
+ * trusts the same sources as the other ports already on it.
+ */
+static int rtl8365mb_qos_apptrust_check_shared(struct realtek_priv *priv,
+					       int port, const bool *trust)
+{
+	bool other[ARRAY_SIZE(rtl8365mb_qos_apptrust_src)];
+	u32 trusted_ports;
+	int ret;
+
+	ret = regmap_read(priv->map, RTL8365MB_QOS_PRIDEC_TBL_SEL_REG,
+			  &trusted_ports);
+	if (ret)
+		return ret;
+
+	if (!(trusted_ports & ~BIT(port)))
+		return 0;
+
+	ret = rtl8365mb_qos_apptrust_read(priv, other);
+	if (ret)
+		return ret;
+
+	if (memcmp(trust, other, sizeof(other))) {
+		dev_err(priv->dev,
+			"trust profile is switch-wide; another port already trusts different sources\n");
+		return -EBUSY;
+	}
+
+	return 0;
+}
+
+int rtl8365mb_qos_set_apptrust(struct realtek_priv *priv, int port,
+			       const bool *trust, unsigned int n)
+{
+	u32 reg = RTL8365MB_QOS_APPTRUST_REG(rtl8365mb_qos_apptrust_src[0]);
+	u32 mask = 0, val = 0;
+	bool any = false;
+	int ret, i;
+
+	if (n != ARRAY_SIZE(rtl8365mb_qos_apptrust_src))
+		return -EINVAL;
+
+	ret = rtl8365mb_qos_check_port(priv, port);
+	if (ret)
+		return ret;
+
+	for (i = 0; i < n; i++)
+		any |= trust[i];
+
+	if (!any)
+		return regmap_clear_bits(priv->map,
+					 RTL8365MB_QOS_PRIDEC_TBL_SEL_REG,
+					 BIT(port));
+
+	ret = rtl8365mb_qos_apptrust_check_shared(priv, port, trust);
+	if (ret)
+		return ret;
+
+	/* Collect all slot weights into one mask and value and write them once,
+	 * so a failed write cannot leave the trusted table half programmed.
+	 */
+	for (i = 0; i < n; i++) {
+		u8 weight = trust[i] ? rtl8365mb_qos_apptrust_weight(i) :
+				       RTL8365MB_QOS_WEIGHT_DISABLED;
+		u8 src = rtl8365mb_qos_apptrust_src[i];
+		u32 src_mask = rtl8365mb_qos_weight_mask(src);
+
+		/* A slot missing from rtl8365mb_qos_apptrust_src[] is 0, which
+		 * is the port source. Reject it. Also reject a source whose
+		 * weight is in a different register than reg.
+		 */
+		if (WARN_ON_ONCE(src == RTL8365MB_QOS_PRIDEC_PORT ||
+				 RTL8365MB_QOS_APPTRUST_REG(src) != reg))
+			return -EINVAL;
+
+		mask |= src_mask;
+		val |= field_prep(src_mask, weight);
+	}
+
+	ret = regmap_update_bits(priv->map, reg, mask, val);
+	if (ret)
+		return ret;
+
+	return regmap_set_bits(priv->map, RTL8365MB_QOS_PRIDEC_TBL_SEL_REG,
+			       BIT(port));
+}
diff --git a/drivers/net/dsa/realtek/rtl8365mb_qos.h b/drivers/net/dsa/realtek/rtl8365mb_qos.h
index 71949ece4af8fae5c49cf105ddaa3db9bc622cf2..eed5ea5fa7f345ce6989e3e890d7cd755da9d0fc 100644
--- a/drivers/net/dsa/realtek/rtl8365mb_qos.h
+++ b/drivers/net/dsa/realtek/rtl8365mb_qos.h
@@ -24,5 +24,9 @@ int rtl8365mb_qos_set_port_prio(struct realtek_priv *priv, int port, u8 iprio,
 				u8 untag_pcp);
 int rtl8365mb_qos_set_pcp_prio(struct realtek_priv *priv, u8 pcp, u8 iprio);
 int rtl8365mb_qos_set_dscp_prio(struct realtek_priv *priv, u8 dscp, u8 iprio);
+int rtl8365mb_qos_set_apptrust(struct realtek_priv *priv, int port,
+			       const bool *trust, unsigned int n);
+int rtl8365mb_qos_get_apptrust(struct realtek_priv *priv, int port, bool *trust,
+			       unsigned int n);
 
 #endif /* _REALTEK_RTL8365MB_QOS_H */
diff --git a/drivers/net/dsa/realtek/rtl83xx-qos.c b/drivers/net/dsa/realtek/rtl83xx-qos.c
index 08091586901291e45ad1a2c64730cdcc30298b7a..d08ffd585caf7d91f4ddff10b90d6eafd2a2a734 100644
--- a/drivers/net/dsa/realtek/rtl83xx-qos.c
+++ b/drivers/net/dsa/realtek/rtl83xx-qos.c
@@ -10,6 +10,7 @@
  * The backend maps internal priorities to its egress queues itself.
  */
 
+#include <linux/build_bug.h>
 #include <linux/dcbnl.h>
 #include <linux/errno.h>
 #include <net/dscp.h>
@@ -19,6 +20,25 @@
 #include "realtek.h"
 #include "rtl83xx-qos.h"
 
+/* dcbnl selector of each apptrust slot */
+static const u8 rtl83xx_apptrust_sel[] = {
+	[RTL83XX_APPTRUST_DSCP]	= IEEE_8021QAZ_APP_SEL_DSCP,
+	[RTL83XX_APPTRUST_PCP]	= DCB_APP_SEL_PCP,
+};
+
+static_assert(ARRAY_SIZE(rtl83xx_apptrust_sel) == RTL83XX_APPTRUST_COUNT);
+
+static int rtl83xx_apptrust_sel_to_slot(u8 sel)
+{
+	int slot;
+
+	for (slot = 0; slot < ARRAY_SIZE(rtl83xx_apptrust_sel); slot++)
+		if (rtl83xx_apptrust_sel[slot] == sel)
+			return slot;
+
+	return -EINVAL;
+}
+
 /* Seed the PCP and DSCP tables, although neither source is trusted yet */
 int rtl83xx_qos_init(struct dsa_switch *ds)
 {
@@ -113,3 +133,59 @@ int rtl83xx_port_set_default_prio(struct dsa_switch *ds, int port, u8 prio)
 	return priv->ops->qos_set_port_prio(priv, port, tt, prio);
 }
 EXPORT_SYMBOL_NS_GPL(rtl83xx_port_set_default_prio, "REALTEK_DSA");
+
+int rtl83xx_port_get_apptrust(struct dsa_switch *ds, int port, u8 *sel,
+			      int *nsel)
+{
+	bool trust[ARRAY_SIZE(rtl83xx_apptrust_sel)];
+	struct realtek_priv *priv = ds->priv;
+	int i, ret;
+
+	if (!priv->ops->qos_get_apptrust)
+		return -EOPNOTSUPP;
+
+	ret = priv->ops->qos_get_apptrust(priv, port, trust,
+					  ARRAY_SIZE(trust));
+	if (ret)
+		return ret;
+
+	*nsel = 0;
+
+	for (i = 0; i < ARRAY_SIZE(rtl83xx_apptrust_sel); i++)
+		if (trust[i])
+			sel[(*nsel)++] = rtl83xx_apptrust_sel[i];
+
+	return 0;
+}
+EXPORT_SYMBOL_NS_GPL(rtl83xx_port_get_apptrust, "REALTEK_DSA");
+
+int rtl83xx_port_set_apptrust(struct dsa_switch *ds, int port, const u8 *sel,
+			      int nsel)
+{
+	bool trust[ARRAY_SIZE(rtl83xx_apptrust_sel)] = { };
+	struct realtek_priv *priv = ds->priv;
+	int i, prev = -1;
+
+	if (!priv->ops->qos_set_apptrust)
+		return -EOPNOTSUPP;
+
+	/* The backends use a fixed precedence, so the selector list
+	 * must follow the slot order.
+	 */
+	for (i = 0; i < nsel; i++) {
+		int slot = rtl83xx_apptrust_sel_to_slot(sel[i]);
+
+		if (slot < 0 || slot <= prev) {
+			dev_err(priv->dev,
+				"unsupported apptrust order; supported: dscp, pcp, dscp pcp\n");
+			return -EOPNOTSUPP;
+		}
+
+		prev = slot;
+		trust[slot] = true;
+	}
+
+	return priv->ops->qos_set_apptrust(priv, port, trust,
+					   ARRAY_SIZE(trust));
+}
+EXPORT_SYMBOL_NS_GPL(rtl83xx_port_set_apptrust, "REALTEK_DSA");
diff --git a/drivers/net/dsa/realtek/rtl83xx-qos.h b/drivers/net/dsa/realtek/rtl83xx-qos.h
index 82ad9338d78db9062d8ceed06378b31e467ee04d..fbddc7b7d9dd37918423afc5373b684596637a05 100644
--- a/drivers/net/dsa/realtek/rtl83xx-qos.h
+++ b/drivers/net/dsa/realtek/rtl83xx-qos.h
@@ -11,5 +11,9 @@ int rtl83xx_qos_init(struct dsa_switch *ds);
 int rtl83xx_qos_init_port(struct dsa_switch *ds, int port);
 int rtl83xx_port_get_default_prio(struct dsa_switch *ds, int port);
 int rtl83xx_port_set_default_prio(struct dsa_switch *ds, int port, u8 prio);
+int rtl83xx_port_get_apptrust(struct dsa_switch *ds, int port, u8 *sel,
+			      int *nsel);
+int rtl83xx_port_set_apptrust(struct dsa_switch *ds, int port, const u8 *sel,
+			      int nsel);
 
 #endif /* _RTL83XX_QOS_H */

-- 
2.47.3

