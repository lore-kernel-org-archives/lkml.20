Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=185.203.200.13
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794856228;
	b=K2iZtWORez01ZNLpgXf6P8esuD8TLCqb66XWXD4I6RB4Q8DtrENuThfktbfvqHH3N9ze
	 rMQQnNVWXUTPBnSInowBeREqSYMdhghy/U8kDtsEW/PKpiTGv93DOc6UzWh4ub/gfGFTM
	 P5AtIAJDMUf3Fllln2nbubIZvXWgQkURpM/qC2ga0v77QkpxjFbF5bieiXTCMB28HNk4D
	 6e5jpL0sCy+ElMrYge3G3bFaQWNU30E/4MkbPvtV+BaGNL72YEh+qpXyGQ62u/gwEePsP
	 +hsUtuyg7yO0Xn9f1yNkQESPoLsZ2M+sg6Lp73D9PrWWGC3ct/sF1mH8GWHG+1uQCbA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794856228;
	h=DMARC-Filter:Received:DKIM-Signature:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer;
	bh=CC+u2gSNNi8dRCx45fvktbyzgEcyp08WQoPEbCTtJqY=;
	b=41MbI4qbfXbLim8Ps+rr/CUJbnag4seNB2TS6fC51Q3DE0f2X/ZmPNNzIfJyHhmiVw7S
	 clVrtY6Ematou3D0pXlG7vC2Nf1F6mOQluCQdeDgJkYPle+H9IG+g5Ogtp24iDlNdU8+d
	 SeqLejGXS5HHfDLSqKWjVezHK5m8iGpsmYb4HJnAEpnwbDZaKLSfG5m0R4FiMD4hBgCaP
	 CkoMuDx57E7aOpEWAkxmEqm7Usv+Qid6YRpU8d4jZpA8WTpeszpy5/2Lnua2BqVEUEAw6
	 tgocNqZVScSGn9BElSvIAZ1lPV+hSU2cmTRiPTsDwsAiLceQ8LVcPpgnTYV2ycPC4RQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=pengutronix.de;
	spf=pass smtp.mailfrom=pengutronix.de;
	dkim=pass header.d=pengutronix.de header.i=@pengutronix.de header.a=rsa-sha256 header.s=20260414 header.b=Llu+lDAC;
	arc=pass header.oldest-pass=0 smtp.remote-ip=185.203.200.13
Received: from mx1.white.stw.pengutronix.de (mx1.white.stw.pengutronix.de [185.203.200.13])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D97DA60A6F60;
	Mon, 16 Nov 2026 19:10:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D97DA60A6F60
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pengutronix.de header.i=@pengutronix.de header.a=rsa-sha256 header.s=20260414 header.b=Llu+lDAC
Received: from dude04.red.stw.pengutronix.de (dude04.red.stw.4.pengutronix.de [10.17.1.12])
	(Authenticated sender: relay-from-dude04.red.stw.pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id 133C8205A38;
	Mon, 16 Nov 2026 20:10:20 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1794856220;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CC+u2gSNNi8dRCx45fvktbyzgEcyp08WQoPEbCTtJqY=;
	b=Llu+lDACLbFWUfhrVWuQUY4MKq4tblI4aGwbLns+v5dlHaOOxQM+9Xvj5bi3U0dwYuTRU4
	DtJDv8DkZLXZdKRm4MTZmLjVFTEz1ejCyPqIWDdw2r4w7AmrVyaevSu4rvnTcHot07LG21
	SvTepdVClRgO/9eRPtYZtMDPBtA6F+LOdC0lzv+KumYAedo2d5rdqcA0Fs3Vizg7UTaioI
	/g+6J1wA2RtVw+oViujlVmN1tb8C2bTKXGdfTmU6TT7R3HXXHkm9tmXjjNpySAplmaQ5Zf
	uI6VKnqCfC8yC3wPAOAVQlsHEvmyKgHxGhECWKbUsI3fcoaZiKsrw02uRmDxuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1794856220;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CC+u2gSNNi8dRCx45fvktbyzgEcyp08WQoPEbCTtJqY=;
	b=Z/Ox15xPWlIwxZpEkm2feDdz1/HOI7S02TbPwRDGt8g0+Bmp5oeldp02faA/HRZ//UJlz6
	ZtiNXU7miYQoVley0i1zIv5yr7l5Q0B1SMm67yY0cAtlNsmfcuBm/yqCTnQA0yhwJsTzFK
	SHR1fvivE+T8UEOSicjO7jipkD1WpzMe053o2QKMk2i6e06t7D9JAHkqYCXVnMFoWKfYbL
	jTukAjxVJJhfJVcZYU0jAGUKogzk828rQbKl8/guM7TK4v+SQuiyLY3A3d29rg8RGMOgfX
	dKx8YV9piF7dxDI3bUBntul8wF8WHeSUKQ8nVp+mlT/HoU3dbTQ1lg4coQGjkw==
ARC-Seal: i=1; s=20260414; d=pengutronix.de; t=1794856220; a=rsa-sha256;
	cv=none;
	b=PmgGqXYoF2N5RZiWHBzFO2cPsoE485RkTV+xf0iId6fuV3fOvqHvLxQGwP5tUwPFzrTH9W
	T1Cvpu6aRMvgeZE6QuOqhDGAjwJGdySUlYT1q28Wew5CcYNataPIQE8qnE0x2MkZnXqmZ1
	yiKYHu2nO/gcB+LHNrACA2T40KkXER8v/ZUsBdcrc1Lg+Nhy1ssWrC2fQhvdJG75WnM+l8
	PbwlY/0uPXNpgq3VPQ2hHdhSImenw2mnOqnW2lLjqHBdSVo8mzoM++hFC74ACgKhYjLaE2
	sY3XTzXbEVrqXN88njnJ1DPqk64ev94FoVMRRU6D/drgikZs3PIR5qdL93IJcQ==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=relay-from-dude04.red.stw.pengutronix.de smtp.mailfrom=ore@pengutronix.de
Received: by dude04.red.stw.pengutronix.de (Postfix, from userid 1058)
	id B62EB381E4B; Mon, 16 Nov 2026 20:10:15 +0100 (CET)
From: Oleksij Rempel <o.rempel@pengutronix.de>
Date: Mon, 16 Nov 2026 20:10:18 +0100
Subject: [PATCH net-next v3 07/10] net: dsa: realtek: rtl8365mb: add QoS
 baseline and DCB default prio
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
Message-Id: <20261116-rtl8365mb-dcb-ingress-v3-7-657f5fdb4db7@pengutronix.de>
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

Add a shared rtl83xx-qos.c layer and the rtl8365mb backend behind it.
The backend programs the QoS classification tables and one
priority-to-queue table at setup instead of leaving them at their reset
state, and offloads the DCB default priority.

The switch classifies traffic by the port default, by PCP and by DSCP.
Each source numbers its values on its own scale. Use the IEEE 802.1Q
traffic types as the meaning of the switch's 3-bit internal priority,
and map every source onto them. Best Effort then outranks Background,
instead of following the raw PCP number.

Keep the driver-independent dcbnl handling and the ieee8021q priority
conversions in rtl83xx-qos.c. That layer programs the chip only through the
realtek_ops qos_* callbacks, so other realtek DSA backends can share one
dcbnl implementation and only program their own chip registers.

The baseline trusts only the port default. PCP and DSCP stay untrusted;
classification by PCP or DSCP starts only once the port trusts it
through dcb apptrust, offloaded by "net: dsa: realtek: rtl8365mb:
offload DCB apptrust".

Every port in use defaults to Best Effort, so all classified traffic
takes one egress queue.

Select NET_IEEE8021Q_HELPERS from NET_DSA_REALTEK, but not DCB. The new
code calls no DCB-core function, and DSA installs the dcbnl ops only
when CONFIG_DCB is set. The QoS baseline is programmed either way.

Signed-off-by: Oleksij Rempel <o.rempel@pengutronix.de>
Reviewed-by: Linus Walleij <linusw@kernel.org>
Reviewed-by: Alvin Šipraga <alvin.sipraga@analog.com>
Reviewed-by: Luiz Angelo Daros de Luca <luizluca@gmail.com>
---
Q: Luiz, Linus: should the driver select DCB, as the Microchip KSZ
driver does, or have it enabled by default?
A: No. The QoS baseline is built and programmed without DCB on purpose.
The code calls no DCB-core function, and only the dcbnl hookup in DSA
depends on CONFIG_DCB. Whether DCB is enabled stays a choice of the
kernel configuration.

Q: Linus: can the port queue-number field and the priority-to-queue
table use one index, as in the RTL8370 code?
A: No. Measured on RTL8365MB-VC for every field value, the port field
picks one of eight priority-to-queue tables: value v picks table v - 1,
and 0 picks table 7. One shared index would make the port read another
table than the one programmed. A field value of 1 did not limit the port
to one queue, so the field is not a queue count. The driver programs
table 7 only and points every port in use at it.

Q: Luiz: the rtl8365mb_set_field()/get_field() names hide the regmap
access; use field_prep()/field_get(), or drop the wrappers?
A: They now use field_prep()/field_get() and are renamed
rtl8365mb_qos_regmap_update_field()/_read_field(), so the name shows the
regmap access. They stay as helpers because every QoS field access would
otherwise repeat the regmap call and the field conversion.

Changes in v3:
- check at build time that the ports of each chip fit the ports the QoS
  register macros address, because RTL8365MB_MAX_NUM_PORTS stays at 11
- wrap lines at 80 columns
- keep the Reviewed-by tags: only the build check changed, the rest is
  rewrapped or split into local variables

Changes in v2:
- move the dcbnl handling, priority conversions and PCP/DSCP baselines
  into a shared rtl83xx-qos.c behind realtek_ops callbacks (Linus)
- seed the DSCP-to-priority table here, not in the DSCP patch (sashiko)
- select NET_IEEE8021Q_HELPERS from NET_DSA_REALTEK, which now builds
  the shared QoS code
- do not select DCB (Luiz)
- handle only ports 0..7, the ports of the supported chips (new patch
  "describe the ports of each chip")
- rename the field wrappers to rtl8365mb_qos_regmap_update/read_field()
  and build them on field_prep()/field_get() (Luiz)
- pick the decision-table register with RTL8365MB_QOS_PRIDEC_REG()
  instead of a helper (Luiz)
- program the switch-wide QoS baseline before the per-port defaults
  (Luiz)
- name the decision sources in an enum and the field widths in defines
- use DSCP_MAX from <net/dscp.h>
- place the top traffic class on queue 7 when the switch uses fewer than
  eight queues
- rename RTL8365MB_QOS_WEIGHT_UNTRUSTED to _DISABLED, as both decision
  tables use it
- shorten the subject
- program one priority-to-queue table and point every port in use at
  it, not a table chosen by the queue count (Linus)
- rename rtl8365mb_dcb_init{,_port}() to rtl83xx_qos_init{,_port}() and
  move them to rtl83xx-qos.c, as they also run without CONFIG_DCB
- check at build time that the per-port QoS registers cover all ports
- program the priority-to-queue table in the backend, once at setup
  like the decision tables, instead of the suggested
  qos_set_port_num_queues()/qos_set_prio_tc() callbacks (Linus): one
  table serves every port, so a shared per-port map only added state
- program the per-port priority and queue-map select only on ports in
  use
---
 drivers/net/dsa/realtek/Kconfig          |   1 +
 drivers/net/dsa/realtek/Makefile         |   5 +-
 drivers/net/dsa/realtek/realtek.h        |  12 ++
 drivers/net/dsa/realtek/rtl8365mb_main.c |  36 +++-
 drivers/net/dsa/realtek/rtl8365mb_qos.c  | 314 +++++++++++++++++++++++++++++++
 drivers/net/dsa/realtek/rtl8365mb_qos.h  |  27 +++
 drivers/net/dsa/realtek/rtl83xx-qos.c    | 109 +++++++++++
 drivers/net/dsa/realtek/rtl83xx-qos.h    |  15 ++
 8 files changed, 513 insertions(+), 6 deletions(-)

diff --git a/drivers/net/dsa/realtek/Kconfig b/drivers/net/dsa/realtek/Kconfig
index d6eb6713e5f6baf0e01f8992fed12951b2db8de6..f1530ba0db61272a4427bbbd611a559e7f0918da 100644
--- a/drivers/net/dsa/realtek/Kconfig
+++ b/drivers/net/dsa/realtek/Kconfig
@@ -4,6 +4,7 @@ menuconfig NET_DSA_REALTEK
 	depends on NET_DSA
 	select FIXED_PHY
 	select IRQ_DOMAIN
+	select NET_IEEE8021Q_HELPERS
 	select REALTEK_PHY
 	select REGMAP
 	help
diff --git a/drivers/net/dsa/realtek/Makefile b/drivers/net/dsa/realtek/Makefile
index 0a94a619b2c1e405996f1c00ab6bce64b6f9a5eb..600a20911c1d09316d033495d704ba0501c92c18 100644
--- a/drivers/net/dsa/realtek/Makefile
+++ b/drivers/net/dsa/realtek/Makefile
@@ -1,6 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0
 obj-$(CONFIG_NET_DSA_REALTEK)		+= realtek_dsa.o
-realtek_dsa-y				:= rtl83xx.o
+realtek_dsa-y				:= rtl83xx.o rtl83xx-qos.o
 realtek_dsa-$(CONFIG_NET_DSA_REALTEK_MDIO)	+= realtek-mdio.o
 realtek_dsa-$(CONFIG_NET_DSA_REALTEK_SMI)	+= realtek-smi.o
 
@@ -12,4 +12,5 @@ obj-$(CONFIG_NET_DSA_REALTEK_RTL8365MB) += rtl8365mb.o
 rtl8365mb-y				:= rtl8365mb_main.o \
 					   rtl8365mb_table.o \
 					   rtl8365mb_vlan.o \
-					   rtl8365mb_l2.o
+					   rtl8365mb_l2.o \
+					   rtl8365mb_qos.o
diff --git a/drivers/net/dsa/realtek/realtek.h b/drivers/net/dsa/realtek/realtek.h
index 33f3b4c249fca3e29c8d0862e6cd4a3bc0dee159..d9ce2b43a81e7b06dcbedc577c78bcd06d915ca5 100644
--- a/drivers/net/dsa/realtek/realtek.h
+++ b/drivers/net/dsa/realtek/realtek.h
@@ -159,6 +159,18 @@ struct realtek_ops {
 				int regnum);
 	int	(*phy_write_c45)(struct realtek_priv *priv, int phy, int devad,
 				 int regnum, u16 val);
+
+	/* QoS/DCB backend callbacks for rtl83xx-qos.c. An iprio is an internal
+	 * priority holding an enum ieee8021q_traffic_type value, not an 802.1p
+	 * priority. A *_prio getter returns an iprio or a negative errno.
+	 */
+	int	(*qos_get_port_prio)(struct realtek_priv *priv, int port);
+	int	(*qos_set_port_prio)(struct realtek_priv *priv, int port,
+				     u8 iprio);
+	int	(*qos_set_pcp_prio)(struct realtek_priv *priv, u8 pcp,
+				    u8 iprio);
+	int	(*qos_set_dscp_prio)(struct realtek_priv *priv, u8 dscp,
+				     u8 iprio);
 };
 
 struct realtek_variant {
diff --git a/drivers/net/dsa/realtek/rtl8365mb_main.c b/drivers/net/dsa/realtek/rtl8365mb_main.c
index 7010e51d63fae7fd416bcde44e506b68f250ae50..e3d1dadf893646addd617b68013550e2f8ab8974 100644
--- a/drivers/net/dsa/realtek/rtl8365mb_main.c
+++ b/drivers/net/dsa/realtek/rtl8365mb_main.c
@@ -108,6 +108,8 @@
 #include "realtek-smi.h"
 #include "realtek-mdio.h"
 #include "rtl83xx.h"
+#include "rtl83xx-qos.h"
+#include "rtl8365mb_qos.h"
 #include "rtl8365mb_l2.h"
 #include "rtl8365mb_vlan.h"
 
@@ -731,11 +733,13 @@ struct rtl8365mb_chip_info {
 /* Chip info for each supported switch in the family */
 #define PHY_INTF(_mode) (RTL8365MB_PHY_INTERFACE_MODE_ ## _mode)
 /* Every chip entry must set .port_mask through PORT_MASK(). PORT_MASK()
- * fails the build when a port does not exist in the family.
+ * fails the build when a port does not exist in the family or is outside
+ * the ports the QoS register macros address.
  */
 #define PORT_MASK(_m) \
 	((_m) + \
-	 BUILD_BUG_ON_ZERO((_m) & ~GENMASK(RTL8365MB_MAX_NUM_PORTS - 1, 0)))
+	 BUILD_BUG_ON_ZERO((_m) & ~GENMASK(RTL8365MB_MAX_NUM_PORTS - 1, 0)) + \
+	 BUILD_BUG_ON_ZERO((_m) & ~GENMASK(RTL8365MB_QOS_MAX_PORTS - 1, 0)))
 
 static const struct rtl8365mb_chip_info rtl8365mb_chip_infos[] = {
 	{
@@ -3179,6 +3183,22 @@ static int rtl8365mb_setup(struct dsa_switch *ds)
 		}
 	}
 
+	/* The QoS baseline below assigns queues from this count */
+	ds->num_tx_queues = mb->chip_info->num_tx_queues;
+
+	/* Set up the QoS baseline before the per-port defaults */
+	ret = rtl83xx_qos_init(ds);
+	if (ret)
+		goto out_teardown_irq;
+
+	ret = rtl8365mb_qos_pridec_init(priv);
+	if (ret)
+		goto out_teardown_irq;
+
+	ret = rtl8365mb_qos_qmap_init(priv);
+	if (ret)
+		goto out_teardown_irq;
+
 	/* Start with all ports blocked, including unused ports */
 	dsa_switch_for_each_port(dp, ds) {
 		struct rtl8365mb_port *p = &mb->ports[dp->index];
@@ -3209,6 +3229,10 @@ static int rtl8365mb_setup(struct dsa_switch *ds)
 		if (ret)
 			goto out_teardown_irq;
 
+		ret = rtl83xx_qos_init_port(ds, dp->index);
+		if (ret)
+			goto out_teardown_irq;
+
 		/* Set up per-port private data */
 		p->priv = priv;
 		p->index = dp->index;
@@ -3290,8 +3314,6 @@ static int rtl8365mb_setup(struct dsa_switch *ds)
 		goto out_teardown_irq;
 	}
 
-	ds->num_tx_queues = mb->chip_info->num_tx_queues;
-
 	/* Start statistics counter polling */
 	ret = rtl8365mb_stats_setup(priv);
 	if (ret) {
@@ -3456,6 +3478,8 @@ static const struct dsa_switch_ops rtl8365mb_switch_ops = {
 	.port_bridge_leave = rtl83xx_port_bridge_leave,
 	.port_pre_bridge_flags = rtl8365mb_port_pre_bridge_flags,
 	.port_bridge_flags = rtl83xx_port_bridge_flags,
+	.port_get_default_prio = rtl83xx_port_get_default_prio,
+	.port_set_default_prio = rtl83xx_port_set_default_prio,
 	.port_stp_state_set = rtl8365mb_port_stp_state_set,
 	.port_fast_age = rtl83xx_port_fast_age,
 	.port_fdb_add = rtl83xx_port_fdb_add,
@@ -3498,6 +3522,10 @@ static const struct realtek_ops rtl8365mb_ops = {
 	.phy_write = rtl8365mb_phy_write,
 	.phy_read_c45 = rtl8365mb_phy_read_c45,
 	.phy_write_c45 = rtl8365mb_phy_write_c45,
+	.qos_get_port_prio = rtl8365mb_qos_get_port_prio,
+	.qos_set_port_prio = rtl8365mb_qos_set_port_prio,
+	.qos_set_pcp_prio = rtl8365mb_qos_set_pcp_prio,
+	.qos_set_dscp_prio = rtl8365mb_qos_set_dscp_prio,
 };
 
 static const char *const rtl8365mb_supplies[] = {
diff --git a/drivers/net/dsa/realtek/rtl8365mb_qos.c b/drivers/net/dsa/realtek/rtl8365mb_qos.c
new file mode 100644
index 0000000000000000000000000000000000000000..9c649b5f1d728ebd025bf0fd863658df3adc7f81
--- /dev/null
+++ b/drivers/net/dsa/realtek/rtl8365mb_qos.c
@@ -0,0 +1,314 @@
+// SPDX-License-Identifier: GPL-2.0
+/* QoS and DCB register programming for the rtl8365mb switch family
+ *
+ * The rtl8365mb backend of the shared rtl83xx-qos.c layer. rtl8365mb_setup()
+ * calls its init functions directly; the shared layer reaches the rest through
+ * the realtek_ops qos_* callbacks.
+ */
+
+#include <linux/bitfield.h>
+#include <linux/bitops.h>
+#include <linux/bug.h>
+#include <linux/build_bug.h>
+#include <linux/dcbnl.h>
+#include <linux/regmap.h>
+#include <net/dsa.h>
+#include <net/dscp.h>
+#include <net/ieee8021q.h>
+
+#include "realtek.h"
+#include "rtl8365mb_qos.h"
+
+/* The chip's eight internal priorities carry 802.1Q traffic types, one
+ * internal priority per traffic type.
+ */
+static_assert(RTL8365MB_NUM_INTERNAL_PRIOS == IEEE8021Q_TT_MAX);
+
+#define RTL8365MB_QOS_REG_BITS				16
+
+/* QoS priority and queue selectors are 3-bit fields on 4-bit boundaries,
+ * four per register.
+ */
+#define RTL8365MB_QOS_SEL_BITS				3
+#define RTL8365MB_QOS_SEL_STRIDE			4
+#define RTL8365MB_QOS_SELS_PER_REG			4
+#define RTL8365MB_QOS_SEL_OFFSET(_i) \
+	(((_i) % RTL8365MB_QOS_SELS_PER_REG) * RTL8365MB_QOS_SEL_STRIDE)
+
+static_assert(RTL8365MB_QOS_SEL_BITS <= RTL8365MB_QOS_SEL_STRIDE);
+static_assert(RTL8365MB_QOS_SEL_STRIDE * RTL8365MB_QOS_SELS_PER_REG <=
+	      RTL8365MB_QOS_REG_BITS);
+
+/* qmaps: the queue id of each internal priority, one table per qmap */
+#define RTL8365MB_QOS_QMAP_TBL_REGS \
+	(RTL8365MB_NUM_INTERNAL_PRIOS / RTL8365MB_QOS_SELS_PER_REG)
+#define RTL8365MB_QOS_QMAP_TBL_REG(_m, _iprio) \
+	(0x0904 + (_m) * RTL8365MB_QOS_QMAP_TBL_REGS + \
+	 (_iprio) / RTL8365MB_QOS_SELS_PER_REG)
+
+/* The qmap each port reads, one select per port */
+#define RTL8365MB_QOS_PORT_QMAP_SEL_REG(_p) \
+	(0x0900 + (_p) / RTL8365MB_QOS_SELS_PER_REG)
+
+static_assert(BIT(RTL8365MB_QOS_SEL_BITS) == RTL8365MB_QOS_NUM_QMAPS);
+/* Ports 0..7 fit in 0x0900..0x0901; 0x0902 does not read back */
+static_assert(RTL8365MB_QOS_PORT_QMAP_SEL_REG(RTL8365MB_QOS_MAX_PORTS - 1) <=
+	      0x0901);
+
+/* qmap 7 is the table that select value 0 picks */
+#define RTL8365MB_QOS_QMAP_DEFAULT			7
+
+static_assert(RTL8365MB_QOS_QMAP_DEFAULT < RTL8365MB_QOS_NUM_QMAPS);
+
+/* 802.1p (PCP) -> internal priority remap */
+#define RTL8365MB_QOS_1Q_REMAP_REG(_pcp) \
+	(0x0865 + (_pcp) / RTL8365MB_QOS_SELS_PER_REG)
+
+/* Port-based (default) priority, one select per port */
+#define RTL8365MB_QOS_PORT_PRI_REG(_p) \
+	(0x0877 + (_p) / RTL8365MB_QOS_SELS_PER_REG)
+
+/* Ports 0..7 fit in 0x0877..0x0878; the next one is at 0x087a */
+static_assert(RTL8365MB_QOS_PORT_PRI_REG(RTL8365MB_QOS_MAX_PORTS - 1) <=
+	      0x0878);
+
+/* DSCP -> internal priority, one table for the whole chip */
+#define RTL8365MB_QOS_DSCP_PRI_REG(_d) \
+	(0x0867 + (_d) / RTL8365MB_QOS_SELS_PER_REG)
+
+static_assert(RTL8365MB_QOS_1Q_REMAP_REG(IEEE_8021Q_MAX_PRIORITIES - 1) <
+	      RTL8365MB_QOS_DSCP_PRI_REG(0));
+static_assert(RTL8365MB_QOS_DSCP_PRI_REG(DSCP_MAX - 1) <
+	      RTL8365MB_QOS_PORT_PRI_REG(0));
+
+/* Priority-decision weight tables. In the driver's model of the decision
+ * hardware, a source ranks by its highest set weight bit (a one-hot rank), not
+ * by numeric magnitude. A weight of zero disables the source.
+ */
+#define RTL8365MB_QOS_WEIGHT_BITS			8
+#define RTL8365MB_QOS_WEIGHTS_PER_REG			2
+#define RTL8365MB_QOS_PRIDEC_TBL0_BASE			0x087b
+#define RTL8365MB_QOS_PRIDEC_TBL1_BASE			0x0885
+#define RTL8365MB_QOS_PRIDEC_REG(_t, _s) \
+	(((_t) == RTL8365MB_QOS_PRIDEC_TABLE_TRUSTED ? \
+	  RTL8365MB_QOS_PRIDEC_TBL1_BASE : RTL8365MB_QOS_PRIDEC_TBL0_BASE) + \
+	 (_s) / RTL8365MB_QOS_WEIGHTS_PER_REG)
+#define RTL8365MB_QOS_PRIDEC_OFFSET(_s) \
+	(((_s) % RTL8365MB_QOS_WEIGHTS_PER_REG) * RTL8365MB_QOS_WEIGHT_BITS)
+
+static_assert(RTL8365MB_QOS_WEIGHT_BITS * RTL8365MB_QOS_WEIGHTS_PER_REG <=
+	      RTL8365MB_QOS_REG_BITS);
+
+/* In the driver's model, each port selects one of the two decision tables;
+ * one bit per port.
+ */
+#define RTL8365MB_QOS_PRIDEC_TBL_SEL_REG		0x0889
+#define RTL8365MB_QOS_PRIDEC_TABLE_UNTRUSTED		0
+#define RTL8365MB_QOS_PRIDEC_TABLE_TRUSTED		1
+
+/* Priority-decision sources, in the hardware's numbering */
+enum rtl8365mb_qos_pridec_src {
+	RTL8365MB_QOS_PRIDEC_PORT = 0,
+	RTL8365MB_QOS_PRIDEC_ACL = 1,
+	RTL8365MB_QOS_PRIDEC_DSCP = 2,
+	RTL8365MB_QOS_PRIDEC_1Q = 3,
+	RTL8365MB_QOS_PRIDEC_SVLAN = 4,
+	RTL8365MB_QOS_PRIDEC_CVLAN = 5,
+	RTL8365MB_QOS_PRIDEC_DA = 6,
+	RTL8365MB_QOS_PRIDEC_SA = 7,
+	RTL8365MB_QOS_PRIDEC_NUM_SRC,
+};
+
+static_assert(RTL8365MB_QOS_PRIDEC_REG(RTL8365MB_QOS_PRIDEC_TABLE_UNTRUSTED,
+				       RTL8365MB_QOS_PRIDEC_NUM_SRC - 1) <
+	      RTL8365MB_QOS_PRIDEC_TBL1_BASE);
+static_assert(RTL8365MB_QOS_PRIDEC_REG(RTL8365MB_QOS_PRIDEC_TABLE_TRUSTED,
+				       RTL8365MB_QOS_PRIDEC_NUM_SRC - 1) <
+	      RTL8365MB_QOS_PRIDEC_TBL_SEL_REG);
+
+/* Priority-decision weights. The baseline trusts only the port-based priority;
+ * every other source is disabled (weight 0). The port default holds the lowest
+ * one-hot rank, BIT(0).
+ */
+#define RTL8365MB_QOS_WEIGHT_DISABLED			0
+#define RTL8365MB_QOS_WEIGHT_PORT			BIT(0)
+
+static u32 rtl8365mb_qos_sel_mask(unsigned int idx)
+{
+	unsigned int off = RTL8365MB_QOS_SEL_OFFSET(idx);
+
+	return GENMASK(off + RTL8365MB_QOS_SEL_BITS - 1, off);
+}
+
+/* Mask of the weight of priority-decision source @src in its register */
+static u32 rtl8365mb_qos_weight_mask(unsigned int src)
+{
+	unsigned int off = RTL8365MB_QOS_PRIDEC_OFFSET(src);
+
+	return GENMASK(off + RTL8365MB_QOS_WEIGHT_BITS - 1, off);
+}
+
+static int rtl8365mb_qos_regmap_update_field(struct realtek_priv *priv,
+					     u32 reg, u32 mask, u32 val)
+{
+	return regmap_update_bits(priv->map, reg, mask, field_prep(mask, val));
+}
+
+/* Return the field value, or a negative errno if the register read fails */
+static int rtl8365mb_qos_regmap_read_field(struct realtek_priv *priv,
+					   u32 reg, u32 mask)
+{
+	u32 data;
+	int ret;
+
+	ret = regmap_read(priv->map, reg, &data);
+	if (ret)
+		return ret;
+
+	return field_get(mask, data);
+}
+
+/* Unused ports carry no traffic; no per-port QoS request is made for them */
+static int rtl8365mb_qos_check_port(struct realtek_priv *priv, int port)
+{
+	if (WARN_ON_ONCE(dsa_is_unused_port(&priv->ds, port)))
+		return -EINVAL;
+
+	return 0;
+}
+
+int rtl8365mb_qos_get_port_prio(struct realtek_priv *priv, int port)
+{
+	return rtl8365mb_qos_regmap_read_field(priv,
+					       RTL8365MB_QOS_PORT_PRI_REG(port),
+					       rtl8365mb_qos_sel_mask(port));
+}
+
+int rtl8365mb_qos_set_port_prio(struct realtek_priv *priv, int port, u8 iprio)
+{
+	u32 reg = RTL8365MB_QOS_PORT_PRI_REG(port);
+	u32 mask = rtl8365mb_qos_sel_mask(port);
+	int ret;
+
+	ret = rtl8365mb_qos_check_port(priv, port);
+	if (ret)
+		return ret;
+
+	return rtl8365mb_qos_regmap_update_field(priv, reg, mask, iprio);
+}
+
+int rtl8365mb_qos_set_pcp_prio(struct realtek_priv *priv, u8 pcp, u8 iprio)
+{
+	u32 reg = RTL8365MB_QOS_1Q_REMAP_REG(pcp);
+	u32 mask = rtl8365mb_qos_sel_mask(pcp);
+
+	return rtl8365mb_qos_regmap_update_field(priv, reg, mask, iprio);
+}
+
+int rtl8365mb_qos_set_dscp_prio(struct realtek_priv *priv, u8 dscp, u8 iprio)
+{
+	u32 reg = RTL8365MB_QOS_DSCP_PRI_REG(dscp);
+	u32 mask = rtl8365mb_qos_sel_mask(dscp);
+
+	return rtl8365mb_qos_regmap_update_field(priv, reg, mask, iprio);
+}
+
+static int rtl8365mb_qos_set_port_qmap(struct realtek_priv *priv, int port,
+				       int qmap)
+{
+	u32 reg = RTL8365MB_QOS_PORT_QMAP_SEL_REG(port);
+	/* Field value v selects qmap v - 1; 0 selects qmap 7 */
+	u32 val = (qmap + 1) % RTL8365MB_QOS_NUM_QMAPS;
+	u32 mask = rtl8365mb_qos_sel_mask(port);
+
+	return rtl8365mb_qos_regmap_update_field(priv, reg, mask, val);
+}
+
+static int rtl8365mb_qos_set_qmap_qid(struct realtek_priv *priv, int qmap,
+				      u8 iprio, u8 qid)
+{
+	u32 reg = RTL8365MB_QOS_QMAP_TBL_REG(qmap, iprio);
+	u32 mask = rtl8365mb_qos_sel_mask(iprio);
+
+	return rtl8365mb_qos_regmap_update_field(priv, reg, mask, qid);
+}
+
+/* At reset, qmap 0 uses only queue 0, and qmap k (1..6) uses queues 0..k-1 and
+ * queue 7. Follow that layout: with more than one queue in use, map the top
+ * traffic class to queue 7.
+ */
+#define RTL8365MB_QOS_QID_TOP				7
+
+static u8 rtl8365mb_qos_tc_to_qid(unsigned int num_queues, u8 tc)
+{
+	if (num_queues > 1 && tc == num_queues - 1)
+		return RTL8365MB_QOS_QID_TOP;
+
+	return tc;
+}
+
+int rtl8365mb_qos_qmap_init(struct realtek_priv *priv)
+{
+	unsigned int nq = priv->ds.num_tx_queues;
+	struct dsa_port *dp;
+	int iprio, ret;
+
+	for (iprio = 0; iprio < RTL8365MB_NUM_INTERNAL_PRIOS; iprio++) {
+		int tc = ieee8021q_tt_to_tc(iprio, nq);
+		u8 qid;
+
+		if (tc < 0)
+			return tc;
+
+		qid = rtl8365mb_qos_tc_to_qid(nq, tc);
+		ret = rtl8365mb_qos_set_qmap_qid(priv,
+						 RTL8365MB_QOS_QMAP_DEFAULT,
+						 iprio, qid);
+		if (ret)
+			return ret;
+	}
+
+	/* Unused ports carry no traffic; their select is left alone */
+	dsa_switch_for_each_available_port(dp, &priv->ds) {
+		ret = rtl8365mb_qos_set_port_qmap(priv, dp->index,
+						  RTL8365MB_QOS_QMAP_DEFAULT);
+		if (ret)
+			return ret;
+	}
+
+	return 0;
+}
+
+static int rtl8365mb_qos_set_pridec(struct realtek_priv *priv, int table,
+				    int src, u8 weight)
+{
+	u32 reg = RTL8365MB_QOS_PRIDEC_REG(table, src);
+	u32 mask = rtl8365mb_qos_weight_mask(src);
+
+	return rtl8365mb_qos_regmap_update_field(priv, reg, mask, weight);
+}
+
+/* Program every source in both tables rather than relying on the reset state */
+int rtl8365mb_qos_pridec_init(struct realtek_priv *priv)
+{
+	int table, ret;
+
+	for (table = RTL8365MB_QOS_PRIDEC_TABLE_UNTRUSTED;
+	     table <= RTL8365MB_QOS_PRIDEC_TABLE_TRUSTED; table++) {
+		int src;
+
+		for (src = 0; src < RTL8365MB_QOS_PRIDEC_NUM_SRC; src++) {
+			u8 weight = src == RTL8365MB_QOS_PRIDEC_PORT ?
+				    RTL8365MB_QOS_WEIGHT_PORT :
+				    RTL8365MB_QOS_WEIGHT_DISABLED;
+
+			ret = rtl8365mb_qos_set_pridec(priv, table, src,
+						       weight);
+			if (ret)
+				return ret;
+		}
+	}
+
+	/* In the driver's model, a clear bit selects the untrusted table */
+	return regmap_write(priv->map, RTL8365MB_QOS_PRIDEC_TBL_SEL_REG, 0);
+}
diff --git a/drivers/net/dsa/realtek/rtl8365mb_qos.h b/drivers/net/dsa/realtek/rtl8365mb_qos.h
new file mode 100644
index 0000000000000000000000000000000000000000..a3568d47f6c6ee9566074af0ec493ff4bbdbf44b
--- /dev/null
+++ b/drivers/net/dsa/realtek/rtl8365mb_qos.h
@@ -0,0 +1,27 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/* QoS and DCB register programming for the rtl8365mb switch family */
+
+#ifndef _REALTEK_RTL8365MB_QOS_H
+#define _REALTEK_RTL8365MB_QOS_H
+
+#include <linux/types.h>
+
+struct realtek_priv;
+
+/* The switch has eight internal priorities (0..7) */
+#define RTL8365MB_NUM_INTERNAL_PRIOS	8
+
+/* Ports the QoS code handles */
+#define RTL8365MB_QOS_MAX_PORTS		8
+
+/* Internal priority -> queue id tables (qmaps) */
+#define RTL8365MB_QOS_NUM_QMAPS		8
+
+int rtl8365mb_qos_pridec_init(struct realtek_priv *priv);
+int rtl8365mb_qos_qmap_init(struct realtek_priv *priv);
+int rtl8365mb_qos_get_port_prio(struct realtek_priv *priv, int port);
+int rtl8365mb_qos_set_port_prio(struct realtek_priv *priv, int port, u8 iprio);
+int rtl8365mb_qos_set_pcp_prio(struct realtek_priv *priv, u8 pcp, u8 iprio);
+int rtl8365mb_qos_set_dscp_prio(struct realtek_priv *priv, u8 dscp, u8 iprio);
+
+#endif /* _REALTEK_RTL8365MB_QOS_H */
diff --git a/drivers/net/dsa/realtek/rtl83xx-qos.c b/drivers/net/dsa/realtek/rtl83xx-qos.c
new file mode 100644
index 0000000000000000000000000000000000000000..0a02e6c4538a919e30e3c35594c7e7e7cdc3cf81
--- /dev/null
+++ b/drivers/net/dsa/realtek/rtl83xx-qos.c
@@ -0,0 +1,109 @@
+// SPDX-License-Identifier: GPL-2.0
+/* Shared QoS and DCB logic for the Realtek DSA switch family
+ *
+ * Every classifier (port default, PCP, DSCP) yields an internal priority that
+ * is an 802.1Q traffic type. dcbnl uses 802.1p priorities. An 802.1p priority
+ * equals the PCP value in the default PCP decoding (IEEE 802.1Q-2022 6.9.3).
+ * This layer converts at its edges: every priority it hands a backend is an
+ * internal priority.
+ *
+ * The backend maps internal priorities to its egress queues itself.
+ */
+
+#include <linux/dcbnl.h>
+#include <linux/errno.h>
+#include <net/dscp.h>
+#include <net/dsa.h>
+#include <net/ieee8021q.h>
+
+#include "realtek.h"
+#include "rtl83xx-qos.h"
+
+/* Seed the PCP and DSCP tables, although neither source is trusted yet */
+int rtl83xx_qos_init(struct dsa_switch *ds)
+{
+	struct realtek_priv *priv = ds->priv;
+	int i, ret;
+
+	if (!priv->ops->qos_set_pcp_prio || !priv->ops->qos_set_dscp_prio)
+		return -EOPNOTSUPP;
+
+	/* Map ingress PCP to the internal priority via its 802.1Q traffic type,
+	 * so Best Effort (PCP 0) outranks Background (PCP 1).
+	 */
+	for (i = 0; i < IEEE_8021Q_MAX_PRIORITIES; i++) {
+		int tt = ieee8021q_pcp_to_tt(i);
+
+		if (tt < 0)
+			return tt;
+
+		ret = priv->ops->qos_set_pcp_prio(priv, i, tt);
+		if (ret)
+			return ret;
+	}
+
+	for (i = 0; i < DSCP_MAX; i++) {
+		int tt = ietf_dscp_to_ieee8021q_tt(i);
+
+		if (tt < 0)
+			return tt;
+
+		ret = priv->ops->qos_set_dscp_prio(priv, i, tt);
+		if (ret)
+			return ret;
+	}
+
+	return 0;
+}
+EXPORT_SYMBOL_NS_GPL(rtl83xx_qos_init, "REALTEK_DSA");
+
+int rtl83xx_qos_init_port(struct dsa_switch *ds, int port)
+{
+	struct realtek_priv *priv = ds->priv;
+
+	if (!priv->ops->qos_set_port_prio)
+		return -EOPNOTSUPP;
+
+	/* An unused port's priority is left alone */
+	if (dsa_is_unused_port(ds, port))
+		return 0;
+
+	/* Best Effort, not internal priority 0, which is Background */
+	return priv->ops->qos_set_port_prio(priv, port, IEEE8021Q_TT_BE);
+}
+EXPORT_SYMBOL_NS_GPL(rtl83xx_qos_init_port, "REALTEK_DSA");
+
+int rtl83xx_port_get_default_prio(struct dsa_switch *ds, int port)
+{
+	struct realtek_priv *priv = ds->priv;
+	int tt;
+
+	if (!priv->ops->qos_get_port_prio)
+		return -EOPNOTSUPP;
+
+	tt = priv->ops->qos_get_port_prio(priv, port);
+	if (tt < 0)
+		return tt;
+
+	return ieee8021q_tt_to_pcp(tt);
+}
+EXPORT_SYMBOL_NS_GPL(rtl83xx_port_get_default_prio, "REALTEK_DSA");
+
+int rtl83xx_port_set_default_prio(struct dsa_switch *ds, int port, u8 prio)
+{
+	struct realtek_priv *priv = ds->priv;
+	int tt;
+
+	if (!priv->ops->qos_set_port_prio)
+		return -EOPNOTSUPP;
+
+	if (prio >= IEEE_8021Q_MAX_PRIORITIES)
+		return -ERANGE;
+
+	tt = ieee8021q_pcp_to_tt(prio);
+	if (tt < 0)
+		return tt;
+
+	return priv->ops->qos_set_port_prio(priv, port, tt);
+}
+EXPORT_SYMBOL_NS_GPL(rtl83xx_port_set_default_prio, "REALTEK_DSA");
diff --git a/drivers/net/dsa/realtek/rtl83xx-qos.h b/drivers/net/dsa/realtek/rtl83xx-qos.h
new file mode 100644
index 0000000000000000000000000000000000000000..82ad9338d78db9062d8ceed06378b31e467ee04d
--- /dev/null
+++ b/drivers/net/dsa/realtek/rtl83xx-qos.h
@@ -0,0 +1,15 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/* Shared QoS and DCB logic for the Realtek DSA switch family */
+
+#ifndef _RTL83XX_QOS_H
+#define _RTL83XX_QOS_H
+
+#include <linux/types.h>
+#include <net/dsa.h>
+
+int rtl83xx_qos_init(struct dsa_switch *ds);
+int rtl83xx_qos_init_port(struct dsa_switch *ds, int port);
+int rtl83xx_port_get_default_prio(struct dsa_switch *ds, int port);
+int rtl83xx_port_set_default_prio(struct dsa_switch *ds, int port, u8 prio);
+
+#endif /* _RTL83XX_QOS_H */

-- 
2.47.3

