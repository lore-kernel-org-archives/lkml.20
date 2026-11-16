Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=212.227.126.187
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794830010;
	b=U/PZZc1bPNPShtf9coZj3oHy5NRMQpxhjQSpT+13YTKetBsPIvj1EP+mo3k2UvTY/KGD
	 j9iQqytR7ge6K2hL9oW+s214pleMp3qfvNnIOMbV8PFfJGayEs07qMR/cAzuXw2fECeIn
	 Olc/gVll18XdmYbgegwiOSZceB1zk5Q8xCJoBmTQfBQkLj9+yw7nSxDF2ny8N3gyGAu1P
	 icKQ3hKd6WNNqp5cWGqmdG85v/J7VIvHGRDNjv0t2cP5Np+TaZwovTM+85sMc6ReOV2Od
	 ypVbQeYOU167zq41YbfRA/ojl67fPMrWPmtQg3RDY6LU9R0F63uZbXaYdLNOmpy52PA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794830010;
	h=DMARC-Filter:DKIM2-Signature:Message-Instance:DKIM-Signature:
	 X-UI-Sender-Class:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Provags-ID:X-Spam-Flag:UI-OutboundReport;
	bh=T3Qrj+hVuo9zPrMJG9fnhqZjVRnarWgzHczUyKIN/PA=;
	b=NnsBRKoMy0TNler52QQttKSPfQZkmc9zULN7F+zVOYznPUejly1vg5uOP4wz2psqR09e
	 x8CGcN403f3IyeDJfwwW3EnBcIzoWA2phCHyvIvscr1AeK5+sP7bWIGQFAw4xG6rhDMrm
	 JAgDEKCIf+Xbb4Td6hANtTttRbDLEnbwNETFArdle8OZThPLrFQ9jd236ZSlru3NMkli9
	 iPjkOsJC1qSj//r9VnYpD+8uaaoYhkAJa+lTvSSUF+mNprKMnfcXrQIwwoG0xktlopIGK
	 59V+F4rehAHimm3XlOCscJMWM87Xsky/IAZYgLN8oFPeDdkMrbW5ITVGo3I3paeGqxw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=jonasjelonek.de;
	spf=pass smtp.mailfrom=jonasjelonek.de;
	dkim=pass header.d=jonasjelonek.de header.i=jonas@jonasjelonek.de header.a=rsa-sha256 header.s=s1-ionos header.b=DYgaHIIw;
	arc=none smtp.remote-ip=212.227.126.187
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.187])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3A94606A32F
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 11:53:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F3A94606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=jonasjelonek.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jonasjelonek.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=jonasjelonek.de header.i=jonas@jonasjelonek.de header.a=rsa-sha256 header.s=s1-ionos header.b=DYgaHIIw
DKIM2-Signature:  i=1; m=1; t=1794830008;
 mf=PGpvbmFzQGpvbmFzamVsb25lay5kZT4=;
 rt=PGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc+;
 d=jonasjelonek.de;
 s=s1-ionos:rsa-sha256:xSsFZsAuqV8Ra2NMQFLTspVmXBHM
   zITdLzMnupKNlZF0h9TJCbkBr9y1r6R3ktYBkurnnWBxbRAgACO+AcZL/yCBQGK/SV6OYX/2xO3
   0JfuXHUIXBhe+xFKdindpUl++djXju8hov/6q64HjLixa4cwnopcMOxUfeNSWvD1duLNJNADG1k
   hazhuJnSBGXzfe6t+G2RfGAeRKu381wIh+4Cz+horfS60IJaS4jd+qHGISUCVJsNUXqT5hPug1z
   WgF/+H8LGP9k0Kpt/qMsB8Qj7oSiSb7RX8LBg8tQMEkj0ET3Fsn3jSzuud3w5rVrH5+0mlrJiv9
   NYNOaYQJw+9ZcQ==;
Message-Instance:  m=1;
 h=sha256:
   9BhjsL/XmiQXawCOmGNJkpc7qTfmWnKkl5zM2mKk5mI=:
   3zqF0kHiU4u6cNZtqNxl5rjKsT4Geq3v6+4ygmNQkMM=,
  sha512:
   sSByRi8DnmPyXlNScXX8HpM+VBar1/VI/NBkP+sEnaqTgFw9BEBJhLmBvCvySVs0rfwrpIluJRMIs3Xwtpvhsw==:
   U7v0DJDumDAfO+ol3Q6S3Nhm9nYEXSgoGJX6TmrNsx5VzgQ/kHrKqElkcJ6a9JhY7JIGxE8GNLzIqPQMwAZneg==;
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jonasjelonek.de;
	s=s1-ionos; t=1794829964; x=1795434764; i=jonas@jonasjelonek.de;
	bh=T3Qrj+hVuo9zPrMJG9fnhqZjVRnarWgzHczUyKIN/PA=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=DYgaHIIwP/VmbMcT0bP0ZVlYZvZ661kZmWiEcchSA+g8LGgOqRsQH1cDMOcEG7xx
	 abfyRjrchtHUTZ5hMi0LuTxsg0BWn+X012aW203WjTJPqEPqkrCeWPF/nDYaZQ4Hg
	 T+5m47HTarvnxyPExEn1tasN6EFu7A9CvaPkPo9n3pHuSUn4lfdMNP+zkNDYnvcZ1
	 +cMsmhm63+4lDJmwrCMjUK9H14XTw4DiPPdFzs8I+TOmtxt7RmkH1mahwnpu/5bXi
	 d5YY0kQ9PDbdSE5jnmAc0T2SwSYhiiuqhiIQDppy14Ce0ry56FHyDrrT+a+OxBef7
	 cuB30X7LGJ2c2TWEXA==
X-UI-Sender-Class: 55c96926-9e95-11ee-ae09-1f7a4046a0f6
Received: from client.hidden.invalid by mrelayeu.kundenserver.de (mreue011
 [213.165.67.97]) with ESMTPSA (Nemesis) id 1MHXSD-1xFyyg2vcf-00AK42; Mon, 16
 Nov 2026 12:52:43 +0100
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
Subject: [PATCH net-next v2 2/3] net: pse-pd: realtek-pse-mcu: ensure MCU does dynamic power management
Date: Mon, 16 Nov 2026 11:52:23 +0000
Message-ID: <20261116115224.1454885-3-jonas@jonasjelonek.de>
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
X-Provags-ID: V03:K1:833vx1Z8oeyDrMlpyE4BA3i8mPs+Hx8xFiGM/5BrM5jzovWddsr
 u4z6SWhPGJ1rDQLTo4lCo6ngvIhvVLoLe8rAe9MqytS9ZgkqNBKpmkhU81cHcjJMM74uXfF
 gX1iI5qJAh+MBFD2gryvFSyBcf+C5HJYebhfByYTxQ8OCpq541f7/iKqeu18pIBWIkABNiP
 G3H0c0C9X8pEO0BOScgbQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:OO2RfzqiXvY=;Y3BaZ3JGUHJFpz0W5kM92Ci7iAh
 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
 J+1wOPYHS5+A==

From: Russell Senior <russell@personaltelco.net>

The MCU may have any power management mode configuration by default
but the driver should ensure that the MCU performs dynamic power
management with priorities as advertised. On certain devices, the
default MCU configuration ships with another default, possibly
preventing any power delivery.

Select the mode before deasserting the hardware port gate, so a failure
to establish the management policy does not ungate the ports.

Signed-off-by: Russell Senior <russell@personaltelco.net>
[jonas@jonasjelonek.de: adjust commit message, macro naming and comment;
 shorten command and helper names to "mgmt"; change error handling; select
 the mode before ungating ports; set dynamic mode with priorities directly
 in the helper]
Signed-off-by: Jonas Jelonek <jonas@jonasjelonek.de>
=2D--
 drivers/net/pse-pd/realtek-pse-mcu-core.c | 32 +++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/drivers/net/pse-pd/realtek-pse-mcu-core.c b/drivers/net/pse-p=
d/realtek-pse-mcu-core.c
index c70b09ca2012..d8b6e0503939 100644
=2D-- a/drivers/net/pse-pd/realtek-pse-mcu-core.c
+++ b/drivers/net/pse-pd/realtek-pse-mcu-core.c
@@ -68,10 +68,14 @@
 /* Nominal PSE rail; 802.3at/bt operating range. */
 #define RTPSE_MCU_PSE_VOLTAGE_UV		54000000
=20
+/* RTPSE_MCU_CMD_SET_POWER_MGMT_MODE values */
+#define RTPSE_MCU_POWER_MGMT_DYNAMIC_PRIO	0x02	/* dynamic, with port prio=
rity */
+
 enum rtpse_mcu_cmd {
 	RTPSE_MCU_CMD_SET_GLOBAL_STATE,
 	RTPSE_MCU_CMD_GET_SYSTEM_INFO,
 	RTPSE_MCU_CMD_GET_EXT_CONFIG,
+	RTPSE_MCU_CMD_SET_POWER_MGMT_MODE,
=20
 	RTPSE_MCU_CMD_PORT_ENABLE,
 	RTPSE_MCU_CMD_PORT_SET_POWER_LIMIT_TYPE,
@@ -369,6 +373,26 @@ static int rtpse_mcu_set_global_state(struct rtpse_mc=
u_ctrl *pse, bool enable)
 	return (resp.payload[0] =3D=3D 0x0) ? 0 : -EIO;
 }
=20
+static int rtpse_mcu_set_power_mgmt_mode(struct rtpse_mcu_ctrl *pse)
+{
+	struct rtpse_mcu_msg req, resp;
+	const struct rtpse_mcu_opcode *opc;
+	int ret;
+
+	opc =3D &pse->dialect->opcode[RTPSE_MCU_CMD_SET_POWER_MGMT_MODE];
+	if (!opc->valid)
+		return -EOPNOTSUPP;
+
+	rtpse_mcu_msg_init(&req, opc->op);
+	req.payload[0] =3D RTPSE_MCU_POWER_MGMT_DYNAMIC_PRIO;
+
+	ret =3D rtpse_mcu_do_xfer(pse, &req, &resp);
+	if (ret)
+		return ret;
+
+	return (resp.payload[0] =3D=3D 0x0) ? 0 : -EIO;
+}
+
 /* Port operations */
=20
 static int rtpse_mcu_port_get_status(struct rtpse_mcu_ctrl *pse, unsigned=
 int port,
@@ -826,6 +850,12 @@ int rtpse_mcu_register(struct rtpse_mcu_ctrl *pse)
 	if (ret)
 		return ret;
=20
+	/* ensure the MCU does dynamic power management with priorities */
+	ret =3D rtpse_mcu_set_power_mgmt_mode(pse);
+	if (ret)
+		return dev_err_probe(pse->dev, ret,
+				     "failed to set power management mode\n");
+
 	/*
 	 * Some boards gate all ports through a hardware line; deassert it only
 	 * after the MCU is confirmed, so a discover failure never ungates the
@@ -944,6 +974,7 @@ static const struct rtpse_mcu_dialect rtpse_mcu_dialec=
t_gen2 =3D {
 		[RTPSE_MCU_CMD_SET_GLOBAL_STATE]	=3D RTPSE_MCU_OP(0x00),
 		[RTPSE_MCU_CMD_GET_SYSTEM_INFO]		=3D RTPSE_MCU_OP(0x40),
 		[RTPSE_MCU_CMD_GET_EXT_CONFIG]		=3D RTPSE_MCU_OP(0x4a),
+		[RTPSE_MCU_CMD_SET_POWER_MGMT_MODE]	=3D RTPSE_MCU_OP(0x10),
=20
 		[RTPSE_MCU_CMD_PORT_ENABLE]		=3D RTPSE_MCU_OP(0x01),
 		[RTPSE_MCU_CMD_PORT_SET_POWER_LIMIT_TYPE] =3D RTPSE_MCU_OP(0x12),
@@ -964,6 +995,7 @@ static const struct rtpse_mcu_dialect rtpse_mcu_dialec=
t_gen1 =3D {
 	.opcode =3D {
 		[RTPSE_MCU_CMD_GET_SYSTEM_INFO]		=3D RTPSE_MCU_OP(0x20),
 		[RTPSE_MCU_CMD_GET_EXT_CONFIG]		=3D RTPSE_MCU_OP(0x2b),
+		[RTPSE_MCU_CMD_SET_POWER_MGMT_MODE]	=3D RTPSE_MCU_OP(0x17),
=20
 		[RTPSE_MCU_CMD_PORT_ENABLE]		=3D RTPSE_MCU_OP(0x00),
 		[RTPSE_MCU_CMD_PORT_SET_POWER_LIMIT_TYPE] =3D RTPSE_MCU_OP(0x15),
=2D-=20
2.53.0

