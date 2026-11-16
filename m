Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=185.203.200.13
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794856227;
	b=NH/3+qXObfZyIpbqRUGt21ED5R7DQYkvcT2rr7HBgPmeTHQYQzSTE8C9yod4lWeb6/Bl
	 s/DJZCscu3HbjsyfLFIBiOV7YkulSQWiOtlX3zxpL01R6WIG746lUPOOum77p7LQjH0hX
	 +QyqIhKO1+dqHZsQCDTflsBj+FrIx0H83PvB3lTPA4xl32c7VI2RwaljgUz1ER8zfYXqk
	 y86UQi6BKPF4Oi+eYg87DolIZBu1tJhJjKPSrwJaEJBkrB0ILPYmCii/4FkJ5V3hYzG4b
	 iau7OV4hmg7hPTZ/uLcNhBgT53sQhW6FS79iWnT2zpXHGGFU0dUdPh1ULp9D+zdiwOA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794856227;
	h=DMARC-Filter:Received:DKIM-Signature:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer;
	bh=X0VnNwdX3Jy8/il7KAAT1Z2gkznzRwi2K4vJfnqu3Ls=;
	b=n13m7HkG9Ha9RAkCIqsN+LKiAcQRC1K3wWkydJcgwgzFwETjJArdeSX79sa+gRPjbm0j
	 zLo4RsCQZHubiDRDhBm9wbrF8k+vy3CQtsHBu57gK+7yTXtzCYk4rnrfYqdcDE6vzZAT3
	 VqYTd/F2FQyUkmcuydc+BMhyw1eYm9XfGqWQ6rPJEaMGO+DER3OsnECdzN50kmRk4Q4Wy
	 l15r5rua0hsGPjnuRnYXO0ZqI9cmweACO8TkaqMETOja40y8xmMVglC1NFN2KYxZ0EupM
	 HXQD6Kel5h0cqBL3uIZqNCDgdPoycTiaYordnAu4UBLneSdA7oqHuO8rRh9eyvJHDyg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=pengutronix.de;
	spf=pass smtp.mailfrom=pengutronix.de;
	dkim=pass header.d=pengutronix.de header.i=@pengutronix.de header.a=rsa-sha256 header.s=20260414 header.b="CTKpNKM/";
	arc=pass header.oldest-pass=0 smtp.remote-ip=185.203.200.13
Received: from mx1.white.stw.pengutronix.de (mx1.white.stw.pengutronix.de [185.203.200.13])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3B1560A3818;
	Mon, 16 Nov 2026 19:10:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C3B1560A3818
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pengutronix.de header.i=@pengutronix.de header.a=rsa-sha256 header.s=20260414 header.b=CTKpNKM/
Received: from dude04.red.stw.pengutronix.de (dude04.red.stw.pengutronix.de [IPv6:2a0a:edc0:0:1101:1d::ac])
	(Authenticated sender: relay-from-dude04.red.stw.pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id 0B2B1205A36;
	Mon, 16 Nov 2026 20:10:20 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1794856220;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=X0VnNwdX3Jy8/il7KAAT1Z2gkznzRwi2K4vJfnqu3Ls=;
	b=CTKpNKM/ltHu00xgYG4OG6VKVmrD0NXedI/FkqjV4QW3/Bdb8Yx3RtINmOoVwInO1QEZrs
	bi6l73ILlVQyN2TAUAUnYbGBn+Uj/FnH66t3D6MYJUXaDuQmfDf2trvaZFVOXmPZvxgVXk
	4ZgkOiAxrxaztPW4wB94mhBIl5npoIkldtPuYh02eh0Si/z2N5nCgVTerB62wmeQgucxHy
	Z68jpxEgPFgIzTOODRXo6ohfG3u0/iuUm3Iip/Ovx4fvJWJ4Go1GpA5PdR1c+Dq+ebJP1V
	4W3zjDwGUY2/mgvKxY77qsDH5dXgo0oUqcsCKG8TjRsts/84T8SPYF3oaEYZsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1794856220;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=X0VnNwdX3Jy8/il7KAAT1Z2gkznzRwi2K4vJfnqu3Ls=;
	b=X9VroXaHjlKPTlpLsazljEAkq4lzR8kTGiut5l0qFS6YaRHTb8KTyOHSQ8XwqjghI6b667
	Eds8SvF9GuKid3LgXcfRra4qmAyVB/t7gzJtWjLDraX9ZlRElrL1PWFteHghV/rXtesWnt
	J8iTmUyO3Rwnnyy5vrKekYaEFDbWpUHEfneRJtbVGH02oVh1SJVIFnIBoTEr7xGsw1aHou
	ojWKu3Uqn0KAtCU+MIAOollAC2DhCImfEnd4cNWwQihVj/1xuO3O5ImgN1RUAe3vRU3MB1
	frbodC9V5UuXN6sXNZT/PAwXzL/y1szFFUdZY8UZbmwQmqTIgvAWhSwnHJP1Bg==
ARC-Seal: i=1; s=20260414; d=pengutronix.de; t=1794856220; a=rsa-sha256;
	cv=none;
	b=ekWe1cpbPYhrGIiv2myQBIj2Q30lRE+xsUwNWvwlW9d4sT5B1b5LGAc6M+60rgoKWFGxCR
	dlvTREHd89x3flc1csfSoKOMAKgw9ESzA7zM4NFgsb7d6aUaNe040XRndNtC5Q/ZYh3ptw
	2pGnJWiDCn2jBhW4fTt2W2c0DDGx5lmibTgvpRfpZba/lLlByYqBxM8GnPF0dP6kpfYLqy
	NtobRujKJbwjj4oblIZig1Nhh+euMGo5KzFf9wx5qPOC4AZr/JxYrMuN7i8cL7iGtI/wau
	zQDc935YaXQUbmI4Yhj4xGUXbH5mAqRrDm9snS7oT34+rF6oxOx5wVQUnq90Qw==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=relay-from-dude04.red.stw.pengutronix.de smtp.mailfrom=ore@pengutronix.de
Received: by dude04.red.stw.pengutronix.de (Postfix, from userid 1058)
	id B2B3F3815CE; Mon, 16 Nov 2026 20:10:15 +0100 (CET)
From: Oleksij Rempel <o.rempel@pengutronix.de>
Date: Mon, 16 Nov 2026 20:10:16 +0100
Subject: [PATCH net-next v3 05/10] net: dsa: realtek: rtl8365mb: describe
 the ports of each chip
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
Message-Id: <20261116-rtl8365mb-dcb-ingress-v3-5-657f5fdb4db7@pengutronix.de>
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

Record which ports each chip has, report one more than its highest port
to DSA as the port count, and reject a devicetree port the chip does not
have.

The QoS code in later patches handles ports 0..7 only, so the driver
must not accept a port the chip does not have. Today every chip reports
11 ports, and since commit 51a4a22301b0 ("net: dsa: realtek: rtl8365mb:
use dsa helpers for port iteration") setup writes per-port registers of
ports 8..10, which no supported chip has. We saw no effect from these
writes.

RTL8365MB_MAX_NUM_PORTS stays at 11, because other chips of this family
have ports above 7.

Signed-off-by: Oleksij Rempel <o.rempel@pengutronix.de>
Reviewed-by: Linus Walleij <linusw@kernel.org>
Reviewed-by: Alvin Šipraga <alvin.sipraga@analog.com>
---
Changes in v3:
- do not lower RTL8365MB_MAX_NUM_PORTS to 8; keep it at 11, as other
  chips of the family have ports above 7 (Alvin, sashiko)
- drop the comment that listed the ports of each chip
- comment the PORT_MASK() rule and the port count
- iterate with dsa_switch_for_each_available_port() (Alvin)
- reword the commit message, which did not say why the patch is needed
  (Alvin)
- keep the Reviewed-by tags: the patch does what Alvin asked

Changes in v2:
- New in v2. The QoS patches after it handle ports 0..7 only.
---
 drivers/net/dsa/realtek/rtl8365mb_main.c | 27 +++++++++++++++++++++++++--
 1 file changed, 25 insertions(+), 2 deletions(-)

diff --git a/drivers/net/dsa/realtek/rtl8365mb_main.c b/drivers/net/dsa/realtek/rtl8365mb_main.c
index da06f952a053d1497647a2c6f15a861fc21860f9..b57b306cbf5e931a36f52ab6b57de881b5dd94d8 100644
--- a/drivers/net/dsa/realtek/rtl8365mb_main.c
+++ b/drivers/net/dsa/realtek/rtl8365mb_main.c
@@ -707,6 +707,7 @@ struct rtl8365mb_extint {
  * @name: human-readable chip name
  * @chip_id: chip identifier
  * @chip_ver: chip silicon revision
+ * @port_mask: ports the chip has
  * @extints: available external interfaces
  * @jam_table: chip-specific initialization jam table
  * @jam_size: size of the chip's jam table
@@ -719,6 +720,7 @@ struct rtl8365mb_chip_info {
 	const char *name;
 	u32 chip_id;
 	u32 chip_ver;
+	u32 port_mask;
 	const struct rtl8365mb_extint extints[RTL8365MB_MAX_NUM_EXTINTS];
 	const struct rtl8365mb_jam_tbl_entry *jam_table;
 	size_t jam_size;
@@ -726,11 +728,19 @@ struct rtl8365mb_chip_info {
 
 /* Chip info for each supported switch in the family */
 #define PHY_INTF(_mode) (RTL8365MB_PHY_INTERFACE_MODE_ ## _mode)
+/* Every chip entry must set .port_mask through PORT_MASK(). PORT_MASK()
+ * fails the build when a port does not exist in the family.
+ */
+#define PORT_MASK(_m) \
+	((_m) + \
+	 BUILD_BUG_ON_ZERO((_m) & ~GENMASK(RTL8365MB_MAX_NUM_PORTS - 1, 0)))
+
 static const struct rtl8365mb_chip_info rtl8365mb_chip_infos[] = {
 	{
 		.name = "RTL8365MB-VC",
 		.chip_id = 0x6367,
 		.chip_ver = 0x0040,
+		.port_mask = PORT_MASK(GENMASK(3, 0) | BIT(6)),
 		.extints = {
 			{ 6, 1, PHY_INTF(MII) | PHY_INTF(TMII) |
 				PHY_INTF(RMII) | PHY_INTF(RGMII) },
@@ -742,6 +752,7 @@ static const struct rtl8365mb_chip_info rtl8365mb_chip_infos[] = {
 		.name = "RTL8367S",
 		.chip_id = 0x6367,
 		.chip_ver = 0x00A0,
+		.port_mask = PORT_MASK(GENMASK(4, 0) | BIT(6) | BIT(7)),
 		.extints = {
 			{ 6, 1, PHY_INTF(SGMII) | PHY_INTF(HSGMII) },
 			{ 7, 2, PHY_INTF(MII) | PHY_INTF(TMII) |
@@ -754,6 +765,7 @@ static const struct rtl8365mb_chip_info rtl8365mb_chip_infos[] = {
 		.name = "RTL8367SB",
 		.chip_id = 0x6367,
 		.chip_ver = 0x0010,
+		.port_mask = PORT_MASK(GENMASK(4, 0) | BIT(6) | BIT(7)),
 		.extints = {
 			{ 6, 1, PHY_INTF(MII) | PHY_INTF(TMII) |
 				PHY_INTF(RMII) | PHY_INTF(RGMII) |
@@ -768,6 +780,7 @@ static const struct rtl8365mb_chip_info rtl8365mb_chip_infos[] = {
 		.name = "RTL8367RB-VB",
 		.chip_id = 0x6367,
 		.chip_ver = 0x0020,
+		.port_mask = PORT_MASK(GENMASK(4, 0) | BIT(6) | BIT(7)),
 		.extints = {
 			{ 6, 1, PHY_INTF(MII) | PHY_INTF(TMII) |
 				PHY_INTF(RMII) | PHY_INTF(RGMII) },
@@ -3139,7 +3152,14 @@ static int rtl8365mb_setup(struct dsa_switch *ds)
 	else if (ret)
 		dev_info(priv->dev, "no interrupt support\n");
 
-	dsa_switch_for_each_port(dp, ds) {
+	dsa_switch_for_each_available_port(dp, ds) {
+		if (!(mb->chip_info->port_mask & BIT(dp->index))) {
+			dev_err(priv->dev, "port %d does not exist on %s\n",
+				dp->index, mb->chip_info->name);
+			ret = -EINVAL;
+			goto out_teardown_irq;
+		}
+
 		/* Cascading (DSA links) is not supported yet.
 		 * Historically, the driver has always been broken
 		 * without a dedicated CPU port because CPU tagging
@@ -3349,7 +3369,10 @@ static int rtl8365mb_detect(struct realtek_priv *priv)
 
 	dev_info(priv->dev, "found an %s switch\n", mb->chip_info->name);
 
-	priv->num_ports = RTL8365MB_MAX_NUM_PORTS;
+	/* port_mask can have gaps, so count up to the highest port, not the
+	 * ports set
+	 */
+	priv->num_ports = fls(mb->chip_info->port_mask);
 	mb->priv = priv;
 	mb->cpu.trap_port = RTL8365MB_MAX_NUM_PORTS;
 	mb->cpu.insert = RTL8365MB_CPU_INSERT_TO_ALL;

-- 
2.47.3

