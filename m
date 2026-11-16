Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=212.227.126.187
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794829977;
	b=zHgBFdEE9gBi9U9J/hsj84hk7WyJX911pVbuw0ieVEBynIn7DBLcoz4eTe7ah3PDk+D6
	 zBVRzh6rtNpxUhKqR0JM83nPxDEDuK97TjHrd68h3Hg+kXKHQ3+Mt+6ku3SVAllwVQiXD
	 wZhixwF3EbLzzFwfAmL2cZhgogIZ4KdCugXhCE2Mc7/QHv/rzU2W/ctkmH/g4jqaSMc9+
	 OgI/v6vyL2KB+F8NFFee+XIaS2vhavXQ+PPXOuGqXKA6BzykBL2cumGoOHyLWBYRPkmYq
	 lccExm88X2Qvi6UTKeTKpwLkiu7m9Dz4xp4I0qHblcHBfj92TVvo4gkC3aExxA+XuUA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794829977;
	h=DMARC-Filter:DKIM2-Signature:Message-Instance:DKIM-Signature:
	 X-UI-Sender-Class:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Provags-ID:X-Spam-Flag:UI-OutboundReport;
	bh=woc8WyNuB2DSpf/3uCi1yunt8fwAv6vvXNQ/82loZ0A=;
	b=bQt40cICeOujMm+RLvowgI3PDbPG5Tr+XIRpSXMOwGX4p//VVKdaU6z3eGYKjEKMJXGj
	 XpRAaiFemx2Dk8+Zzi5CQ/6b7Z1LV68VU5oo6dJ8o36anXrnBqngr8Q9olUm5tt//qh3g
	 Ga141US1mRFzeyqMjJ27m1dt2l65373CGesIR+T2T1xncL0aH9bDzD7P2GZZJeC7R2cqJ
	 gBWZFe9/agK/JnkFa6G1ILrCphH+Gv860MN3qw4LkRlaFBNBbMzN6XLeqxFnn92whA2RH
	 ZrLNDpvkGBsF5FJk0BZ0GPCtyuBZqDURJShSEL2yjPoEqSKt9dAt9coZ3vU1F0pvefA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=jonasjelonek.de;
	spf=pass smtp.mailfrom=jonasjelonek.de;
	dkim=pass header.d=jonasjelonek.de header.i=jonas@jonasjelonek.de header.a=rsa-sha256 header.s=s1-ionos header.b=S5JBoftp;
	arc=none smtp.remote-ip=212.227.126.187
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.187])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44EEB606A335
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 11:52:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 44EEB606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=jonasjelonek.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jonasjelonek.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=jonasjelonek.de header.i=jonas@jonasjelonek.de header.a=rsa-sha256 header.s=s1-ionos header.b=S5JBoftp
DKIM2-Signature:  i=1; m=1; t=1794829974;
 mf=PGpvbmFzQGpvbmFzamVsb25lay5kZT4=;
 rt=PGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc+;
 d=jonasjelonek.de;
 s=s1-ionos:rsa-sha256:hFhnMerkh7zN9sdHl5vGqDG7TCTP
   aW4orp9Xh8Iit3pA7jW0XAmInrvH/JwL1kLh57n/NMPaXUbikVPbpmUHJ+lp6isI9maE9HawUmK
   huwJXFzsEvrhDqjlwe/y7AjDAKdywLLUyXUNlFsoq1clgKsnza1iLicbTd9/zqOV2ZsGiWmFCOa
   KfknDsq3uKGG5VzxP3o+j6qK92kB4YjXoji5Cq/t+96EPLM6Wm7eZAaUvcAifZj+ribPg6vdY25
   Da4kbNhsYi+Cihp5MraO3tmCf1TsWggE1wKiKkTcYzlRRk5j6K/4J10uObofHKWkMY6cGLvtUkX
   7jQSd7a9Xq2Kjw==;
Message-Instance:  m=1;
 h=sha256:
   6OMYgfqBVvaLPd0rxFHT+ycusW5WaGfc8m8UTpzBUZw=:
   qXa7ssE060thvVRwkz8XsKplRVq2ECjo1RsSCBFEDuo=,
  sha512:
   ft786jAJo08hWD8kpugQn0AabpNEcO6usOncOSS6S2l9qksZAbD4bUL/cqWeE4zHBTmRcJ9Z4CnMxH+rpiSsmw==:
   8gZuO+Idi/5WBo3vWDIJC9pJw9unP89LE6YGWy2lRrEVPk9LaGySSUx3ZHd8Brg8JM2yLtZxZtI8L2d6lamaag==;
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jonasjelonek.de;
	s=s1-ionos; t=1794829964; x=1795434764; i=jonas@jonasjelonek.de;
	bh=woc8WyNuB2DSpf/3uCi1yunt8fwAv6vvXNQ/82loZ0A=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=S5JBoftpO7ItI8WBGKGyzryBfEGwUaXJjOrAAROWuzHdLiSqUOB6W24T4kNjVdpk
	 wwfmZ4i072r392eyvXxO2yDlJCheVF1KykFi+XOgRyGMrWMJixDFL/IDJAPVL1iV/
	 CIzq1kGAwsdgjjlHZvj8FPet0fMDcVSYaoIMoKDTHgt5zu0RlEnO6K3eb9XhseiDi
	 mQZhK8ybJm3FKUFRfIi5T+GQCaiuRSk0HbQGuw2QCLZ07MtAiUQgifaAHO0nLctx/
	 NXgDFoZYQ+j/EDN0ClSl4ZrU8OJs0D8OC4PTzxlUecsM90LJnf7nZcoqePvtJCy2w
	 EOPR2MuI1sdb7ULMvA==
X-UI-Sender-Class: 55c96926-9e95-11ee-ae09-1f7a4046a0f6
Received: from client.hidden.invalid by mrelayeu.kundenserver.de (mreue011
 [213.165.67.97]) with ESMTPSA (Nemesis) id 1MwQCb-1wdI772RxV-00vbcE; Mon, 16
 Nov 2026 12:52:44 +0100
From: Jonas Jelonek <jonas@jonasjelonek.de>
To: Oleksij Rempel <o.rempel@pengutronix.de>,
	Kory Maincent <kory.maincent@bootlin.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	netdev@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	Sander Vanheule <sander@svanheule.net>,
	Russell Senior <russell@personaltelco.net>,
	Jonas Jelonek <jonas@jonasjelonek.de>
Subject: [PATCH net-next v2 3/3] net: pse-pd: realtek-pse-mcu: configure global power budget
Date: Mon, 16 Nov 2026 11:52:24 +0000
Message-ID: <20261116115224.1454885-4-jonas@jonasjelonek.de>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261116115224.1454885-1-jonas@jonasjelonek.de>
References: <20261116115224.1454885-1-jonas@jonasjelonek.de>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:gCnnGRVPP6x+XQIpDSHlLvoGioICgkMlePaJDUWgs6JqRAhiMjs
 C9IPxXi2tIXJICwVp5Si2vOYyxBnBfZEbl/T0bPHFheWt4w4O/Z2K7oB3Mhuw/TstybivxF
 G0IUlfyvyVcy96NkabPcLkSw8qCrThW5Fqz9RtIfKH9G1nymBe30b1tY7j/nNFRrTYQ1FT9
 L66DFae9Kz6qX2B3r2tow==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:tlDWHc+bVDM=;Lrz8GyrQdyftk3m/4B5V/8XYZNv
 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

Use the optional VMAIN supply's power budget to set the MCU's aggregate
PoE limit. Require a finite budget of at least 100 mW and round it down to
the protocol's 100 mW units. Reserve that amount through the regulator cor=
e
and program the limit at the MCU's current budget index before selecting
dynamic management and ungating the ports.

VMAIN must already be available: the MCU and downstream PSE managers
assume an active rail and provide no dedicated control for it. Use the
regulator only for budget accounting, leaving the rail externally
controlled or marked with regulator-always-on.

The regulator budget represents the usable PoE allowance. Vendor firmware
adds a device-specific guard on top: the UniFi USW Pro Max 24 PoE advertis=
es
400 W but programs 404 W with a 4 W guard. The guard's effect on power
management is not sufficiently documented to apply a fixed percentage
across devices. Set it to zero rather than add an arbitrary margin to the
regulator-derived budget.

Register managed cleanup before hardware initialization so probe failures
and driver removal release the regulator reservation. Retain the programme=
d
MCU limit in either case. Boards without vmain-supply keep their existing
firmware-configured budget.

Signed-off-by: Jonas Jelonek <jonas@jonasjelonek.de>
=2D--
 drivers/net/pse-pd/realtek-pse-mcu-core.c | 123 +++++++++++++++++++++-
 drivers/net/pse-pd/realtek-pse-mcu.h      |   3 +
 2 files changed, 123 insertions(+), 3 deletions(-)

diff --git a/drivers/net/pse-pd/realtek-pse-mcu-core.c b/drivers/net/pse-p=
d/realtek-pse-mcu-core.c
index d8b6e0503939..ae58581a0dad 100644
=2D-- a/drivers/net/pse-pd/realtek-pse-mcu-core.c
+++ b/drivers/net/pse-pd/realtek-pse-mcu-core.c
@@ -34,10 +34,12 @@
 #include <linux/delay.h>
 #include <linux/gpio/consumer.h>
 #include <linux/jiffies.h>
+#include <linux/math.h>
 #include <linux/minmax.h>
 #include <linux/module.h>
 #include <linux/property.h>
 #include <linux/pse-pd/pse.h>
+#include <linux/regulator/consumer.h>
 #include <linux/unaligned.h>
=20
 #include "realtek-pse-mcu.h"
@@ -62,6 +64,8 @@
 #define RTPSE_MCU_MAX_PORTS			48
 #define RTPSE_MCU_PORT_MAX_PRIORITY		3
=20
+#define RTPSE_MCU_GLOBAL_BUDGET_LSB_MW		100
+
 /* Bounded resends when the MCU replies NOT_READY (busy). */
 #define RTPSE_MCU_NOT_READY_RETRIES		3
=20
@@ -76,6 +80,8 @@ enum rtpse_mcu_cmd {
 	RTPSE_MCU_CMD_GET_SYSTEM_INFO,
 	RTPSE_MCU_CMD_GET_EXT_CONFIG,
 	RTPSE_MCU_CMD_SET_POWER_MGMT_MODE,
+	RTPSE_MCU_CMD_GET_POWER_STATUS,
+	RTPSE_MCU_CMD_SET_GLOBAL_BUDGET,
=20
 	RTPSE_MCU_CMD_PORT_ENABLE,
 	RTPSE_MCU_CMD_PORT_SET_POWER_LIMIT_TYPE,
@@ -393,6 +399,84 @@ static int rtpse_mcu_set_power_mgmt_mode(struct rtpse=
_mcu_ctrl *pse)
 	return (resp.payload[0] =3D=3D 0x0) ? 0 : -EIO;
 }
=20
+static int rtpse_mcu_get_global_budget_idx(struct rtpse_mcu_ctrl *pse, u8=
 *budget_idx)
+{
+	struct rtpse_mcu_msg req, resp;
+	const struct rtpse_mcu_opcode *opc;
+	int ret;
+
+	opc =3D &pse->dialect->opcode[RTPSE_MCU_CMD_GET_POWER_STATUS];
+	if (!opc->valid)
+		return -EOPNOTSUPP;
+
+	rtpse_mcu_msg_init(&req, opc->op);
+	ret =3D rtpse_mcu_do_xfer(pse, &req, &resp);
+	if (ret)
+		return ret;
+
+	if (resp.payload[4] > 0x7)
+		return -ERANGE;
+
+	*budget_idx =3D resp.payload[4];
+	return 0;
+}
+
+static int rtpse_mcu_set_global_budget(struct rtpse_mcu_ctrl *pse, u8 bud=
get_idx,
+				       u16 budget_raw)
+{
+	const struct rtpse_mcu_opcode *opc;
+	struct rtpse_mcu_msg req, resp;
+	int ret;
+
+	opc =3D &pse->dialect->opcode[RTPSE_MCU_CMD_SET_GLOBAL_BUDGET];
+	if (!opc->valid)
+		return -EOPNOTSUPP;
+
+	rtpse_mcu_msg_init(&req, opc->op);
+	req.payload[0] =3D budget_idx;
+	put_unaligned_be16(budget_raw, &req.payload[1]);
+	put_unaligned_be16(0, &req.payload[3]);
+
+	ret =3D rtpse_mcu_do_xfer(pse, &req, &resp);
+	if (ret)
+		return ret;
+	if (resp.payload[0] !=3D budget_idx || resp.payload[1] !=3D 0)
+		return -EIO;
+
+	return 0;
+}
+
+static int rtpse_mcu_apply_global_budget(struct rtpse_mcu_ctrl *pse,
+					 struct regulator *vmain)
+{
+	int budget, ret;
+	u16 budget_raw;
+	u8 budget_idx;
+
+	budget =3D regulator_get_unclaimed_power_budget(vmain);
+	if (budget =3D=3D INT_MAX)
+		return -ENODATA;
+	if (budget < 0 || budget > U16_MAX * RTPSE_MCU_GLOBAL_BUDGET_LSB_MW)
+		return -ERANGE;
+
+	budget =3D rounddown(budget, RTPSE_MCU_GLOBAL_BUDGET_LSB_MW);
+	if (!budget)
+		return -ERANGE;
+	budget_raw =3D budget / RTPSE_MCU_GLOBAL_BUDGET_LSB_MW;
+
+	ret =3D regulator_request_power_budget(vmain, budget);
+	if (ret)
+		return ret;
+	pse->requested_budget_mW =3D budget;
+
+	ret =3D rtpse_mcu_get_global_budget_idx(pse, &budget_idx);
+	if (ret)
+		return ret;
+
+	/* Retain the programmed MCU limit even if later probe steps fail. */
+	return rtpse_mcu_set_global_budget(pse, budget_idx, budget_raw);
+}
+
 /* Port operations */
=20
 static int rtpse_mcu_port_get_status(struct rtpse_mcu_ctrl *pse, unsigned=
 int port,
@@ -801,6 +885,14 @@ static int rtpse_mcu_discover(struct rtpse_mcu_ctrl *=
pse, struct rtpse_mcu_info
 	return 0;
 }
=20
+static void rtpse_mcu_free_global_budget(void *data)
+{
+	struct rtpse_mcu_ctrl *pse =3D data;
+
+	if (pse->requested_budget_mW)
+		regulator_free_power_budget(pse->vmain, pse->requested_budget_mW);
+}
+
 static void rtpse_mcu_global_disable(void *data)
 {
 	struct rtpse_mcu_ctrl *pse =3D data;
@@ -813,6 +905,7 @@ int rtpse_mcu_register(struct rtpse_mcu_ctrl *pse)
 	const struct rtpse_mcu_match_data *match;
 	struct rtpse_mcu_info info;
 	struct gpio_desc *gpiod;
+	struct regulator *vmain;
 	int ret;
=20
 	BUILD_BUG_ON(sizeof(struct rtpse_mcu_msg) !=3D RTPSE_MCU_MSG_SIZE);
@@ -837,6 +930,20 @@ int rtpse_mcu_register(struct rtpse_mcu_ctrl *pse)
 		return dev_err_probe(pse->dev, -EINVAL,
 				     "dialect for chip is incomplete\n");
=20
+	vmain =3D devm_regulator_get_optional(pse->dev, "vmain");
+	if (PTR_ERR(vmain) =3D=3D -ENODEV)
+		vmain =3D NULL;
+	else if (IS_ERR(vmain))
+		return dev_err_probe(pse->dev, PTR_ERR(vmain),
+				     "failed to get vmain supply\n");
+
+	if (vmain) {
+		pse->vmain =3D vmain;
+		ret =3D devm_add_action_or_reset(pse->dev, rtpse_mcu_free_global_budget=
, pse);
+		if (ret)
+			return ret;
+	}
+
 	/*
 	 * Release the MCU from reset before the first transaction; the
 	 * boot-retry loop in discover() waits for it to answer.
@@ -850,6 +957,13 @@ int rtpse_mcu_register(struct rtpse_mcu_ctrl *pse)
 	if (ret)
 		return ret;
=20
+	if (vmain) {
+		ret =3D rtpse_mcu_apply_global_budget(pse, vmain);
+		if (ret)
+			return dev_err_probe(pse->dev, ret,
+					     "failed to apply global power budget\n");
+	}
+
 	/* ensure the MCU does dynamic power management with priorities */
 	ret =3D rtpse_mcu_set_power_mgmt_mode(pse);
 	if (ret)
@@ -858,9 +972,8 @@ int rtpse_mcu_register(struct rtpse_mcu_ctrl *pse)
=20
 	/*
 	 * Some boards gate all ports through a hardware line; deassert it only
-	 * after the MCU is confirmed, so a discover failure never ungates the
-	 * ports. It is then left to the MCU - not re-gated on unbind or a later
-	 * probe error - so a driver reload doesn't black out PoE.
+	 * after discovery, budget setup and management-mode selection succeed.
+	 * Do not reassert it on unbind or a later probe error.
 	 */
 	gpiod =3D devm_gpiod_get_optional(pse->dev, "disable-ports", GPIOD_OUT_L=
OW);
 	if (IS_ERR(gpiod))
@@ -975,6 +1088,8 @@ static const struct rtpse_mcu_dialect rtpse_mcu_diale=
ct_gen2 =3D {
 		[RTPSE_MCU_CMD_GET_SYSTEM_INFO]		=3D RTPSE_MCU_OP(0x40),
 		[RTPSE_MCU_CMD_GET_EXT_CONFIG]		=3D RTPSE_MCU_OP(0x4a),
 		[RTPSE_MCU_CMD_SET_POWER_MGMT_MODE]	=3D RTPSE_MCU_OP(0x10),
+		[RTPSE_MCU_CMD_GET_POWER_STATUS]	=3D RTPSE_MCU_OP(0x41),
+		[RTPSE_MCU_CMD_SET_GLOBAL_BUDGET]	=3D RTPSE_MCU_OP(0x04),
=20
 		[RTPSE_MCU_CMD_PORT_ENABLE]		=3D RTPSE_MCU_OP(0x01),
 		[RTPSE_MCU_CMD_PORT_SET_POWER_LIMIT_TYPE] =3D RTPSE_MCU_OP(0x12),
@@ -996,6 +1111,8 @@ static const struct rtpse_mcu_dialect rtpse_mcu_diale=
ct_gen1 =3D {
 		[RTPSE_MCU_CMD_GET_SYSTEM_INFO]		=3D RTPSE_MCU_OP(0x20),
 		[RTPSE_MCU_CMD_GET_EXT_CONFIG]		=3D RTPSE_MCU_OP(0x2b),
 		[RTPSE_MCU_CMD_SET_POWER_MGMT_MODE]	=3D RTPSE_MCU_OP(0x17),
+		[RTPSE_MCU_CMD_GET_POWER_STATUS]	=3D RTPSE_MCU_OP(0x23),
+		[RTPSE_MCU_CMD_SET_GLOBAL_BUDGET]	=3D RTPSE_MCU_OP(0x18),
=20
 		[RTPSE_MCU_CMD_PORT_ENABLE]		=3D RTPSE_MCU_OP(0x00),
 		[RTPSE_MCU_CMD_PORT_SET_POWER_LIMIT_TYPE] =3D RTPSE_MCU_OP(0x15),
diff --git a/drivers/net/pse-pd/realtek-pse-mcu.h b/drivers/net/pse-pd/rea=
ltek-pse-mcu.h
index 5e31dd0993dd..56899ec4d76f 100644
=2D-- a/drivers/net/pse-pd/realtek-pse-mcu.h
+++ b/drivers/net/pse-pd/realtek-pse-mcu.h
@@ -62,6 +62,7 @@ static inline bool rtpse_mcu_resp_is_final(const struct =
rtpse_mcu_msg *req,
 struct rtpse_mcu_dialect;
 struct rtpse_mcu_chip_info;
 struct rtpse_mcu_ctrl;
+struct regulator;
=20
 /* Per-compatible match data (the of_match .data). */
 struct rtpse_mcu_match_data {
@@ -82,6 +83,8 @@ struct rtpse_mcu_ctrl {
 	const struct rtpse_mcu_dialect *dialect;
 	const struct rtpse_mcu_chip_info *chip;
 	const struct rtpse_mcu_transport_ops *transport;
+	struct regulator *vmain;
+	unsigned int requested_budget_mW;
 	u8 seq;			/* rolling request seq_num, echoed by the MCU */
 };
=20
=2D-=20
2.53.0

