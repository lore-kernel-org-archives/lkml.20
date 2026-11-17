Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=66.163.184.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794901010;
	b=y6wPblB05ySQUNhXKCQ7jqdjwMhdKYvp9dvNs+M/ZJ4p9yw3B3kNxoFOIxQiM/iCAD1I
	 7bp0lrYJ2wOEaRq2raMXCWxI4kvIBZqCrJa4ZLd6WOwwYV8vdoUfoXSZaQ04Uenz569SW
	 mAM0JfgOu7+buzHOGyBMJX7va8791GfR2aZrkm9SAYvrKhDwFLYAdCOv+uPh9VejUL+fv
	 NBVrjBs5qPg/T9oAUYZovqiW/uiDJNaVfmkGOsmaL7w1P1n0afLKTGnO9EO41vRLR8HkT
	 kislwVP1i7YbXXzAboier93IJXs5GUPNKwjugsDURo8QmBMZpX0oDUjZfsZARUGuVlQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794901010;
	h=DMARC-Filter:DKIM-Signature:X-SONIC-DKIM-SIGN:X-YMail-OSG:X-Sonic-MF:
	 X-Sonic-ID:Received:Received:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:From:To:References:Content-Language:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Mailer;
	bh=0CF2vmnKTcGLjDpv76/GJF7jjEFFEZbcsOUC8rL2J8I=;
	b=o1mEXj/84iwBwUNyUNu4MYxQDirXzvuCP6VDGaEMWCoa3UHLvBKhuOEK06MUEX+kUE17
	 /KrWOyxKcGPhT4pcKfg5muME9SWhY76L0DI1CoxpD6Vg6yDX4xogVnWS6HXU7pemGFBCt
	 ZU7COQiJVCMln2/WasHS657VR9jItEw/P6hi/0wCMTWgM1zp6Owgn4qCSC/CBBqzATYNI
	 lQl+rpXRqlohTVbR53ffHjcyGIXPOn1z8JDoFc7KvagqBBn4+ikX/HT5ubXoOgBh+nfWU
	 FkiXrDvDmwFQ4Wo61fdXrNJjaCCLDSd4S6bSles/w5DJDQfu7QuA4wSWa+ka1mk/niw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=yahoo.com;
	spf=pass smtp.mailfrom=yahoo.com;
	dkim=pass header.d=yahoo.com header.i=@yahoo.com header.a=rsa-sha256 header.s=s2048 header.b=luhDMeF0;
	arc=none smtp.remote-ip=66.163.184.45
Received: from sonic317-34.consmr.mail.ne1.yahoo.com (sonic317-34.consmr.mail.ne1.yahoo.com [66.163.184.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A0C1606A31C
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 07:36:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8A0C1606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yahoo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=yahoo.com header.i=@yahoo.com header.a=rsa-sha256 header.s=s2048 header.b=luhDMeF0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1794901008; bh=0CF2vmnKTcGLjDpv76/GJF7jjEFFEZbcsOUC8rL2J8I=; h=Date:Subject:From:To:References:In-Reply-To:Content-Type:From:Subject:Reply-To:Content-Type; b=luhDMeF0BPqKtsXjrEgNxOVAFBk3qIt3dsd7pKTP0Y9XgtCw/EpBKzmi+vKDwwaX5PR31yUymWO+jvTEHdjVoWXG34aGiaAAQyJha7YMiCA3fRCXOIYwVInC9XXIlXByjSc/HBUGa/aqvgkkeBuu7IP2ycRP8M3/0z/4LkcE9SS1Y0Xvt+q8tzcSwXWLMVbweOBID+uM0cbZ1NtDpjDBjcUeYh/VaPxSD4lcmnNV93LVSKbGIzNpLRPe+1sQAg1/Jc+mogMMzqU/T9fL3qvKrfxMrEWe4JgYk/aA0x8tKG6+MRqtL+fU9iTQPigsux2UguFuGVeLb4LtTBQjpHTuww==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1794901008; bh=7MqvJNqQm37xTFY1BWmzeQIX/u1+qpHCIfowRVL3ZJH=; h=X-Sonic-MF:Date:Subject:From:To:From:Subject; b=gvI5lDWYpcLwAxurNFyw+LtfhTMyvQ9gr/LPNDYXCQ0DtZd06+tcT5oGp1dZVOkJ9bUcRkRyrAn4LRd/O4MUH8zB4oJwfd6iWe7oP/p/wcBHccIIKH7K/UXNUQpUhIVwAmzs3pD5fbZ/Wvz78NMO6DbgYPta7RGTGSAnSwOkIHNll0IDwBajtTUCJlBhgXyUTcx9zc6a3z/uSzJg8jacWq9MSK/IWdN1kZYTwBmfCD4eztZ1apjZHCZ9JTfMMfrcSxBqZ3DFYbPCwTdyVmJtYNloUIubG0CDNBmZHPDk24jLzEz43urRvi1RW7OY63JzL1EK0vafl2ja1zi01B8KZA==
X-YMail-OSG: NzIvA1sVM1mW_E.ZmFBXUfcfUjKQiit37gl.mJNcLXjHC.cdkMc0UcXUKFZQP4F
 aKRi7PQGMj6vizL7p_8SAuCcS0fePvOu2nKR_NcRF59F.hsh3PNLPKf0UMZ_JDA6vc.P6Oe1.shp
 0QfcHMNkfmYe.pIwp2GqZOWmwRbIQx_Ru47pdsSRw9jFpiJwdd1yNjL3hD4J2539qTbUSXBC6AgF
 UBj5wGuvBCqkyK2UTwPf_HannU3qfh2yb5IysiAZegXPHO7TT7Oye5wD6Jcy4ZXylyux_QPFBZlP
 p44awQiLBN4Jm7T8WOT_f9O0OP7sUq6CmCTXjrFoGRwX4PcvIfmZR1Wa3OcsWJYrxXLnO8g_Nl.g
 prd5.8drvJqSVGRksWql8DnSmdieStw9fgmLFota5f5azDABxwD4xHgWG6q_jdgYJSYInONLfAs.
 qJkwezgm2W3D5mEJz.kV_IjQpmyV92rDGNBr2a4w8hNVXn3nNlzyHMDdrixnaZC.GDtlurPzc_CO
 GDfQnqmIaX4YIRiPcZW3.IjBK8h0KhPFbJxaLAvSYaPTU5AsmEGNZO4yayeMAxO6CXVI_Gd6lH7C
 LykBD2G5wYn5.D4UUkaGA4jUMxw8yujsQqg3PRCjI6I0ohnf_Am.ydBBJ_Gl7SMhQejkmx0zsl5m
 gTRtsxvFVBRmAA4oyyd4fG.vN5Fy7b7P39zgV3qjYIBybx0hPziodF3irWA87b9qrYGF5apsfs5b
 3tqPg1jTwjDx8FNTsktx5HM_7itV3Ij2Y5Nyc42U1POh6ltzayM7QWCnluZLhlPrqecQtBhNPyT0
 9gVA1c0tvLTY742hov29mmiOWrecVBn7gsGZwO0tN0UVZNS9BzrtMtCIwnm9vZG5ObXkX1LuejwQ
 GKFMGQTyhUY_Pdihxumbf3tSo9_kd_0wiNudKx_OT_W5Jk6YtCNQMaGuNI1UtHF4LfV6aOzbeWOO
 ggs3ZshbJ3cOmCs1kGRtzpXv1TIRkkUclyZ.dibuQdvyxkf3OkPvxr5zgGFJzEfsSwPQ9e96TUoD
 _fEYHY9yGLVzRQym11QLHx2FWLcI2M5G4nME71LD5CbfcdrKY2cblepZwhytGjccCth7Bo9oWp5L
 _a4oMANWTXJgipc6iFBL.ZGM96_kyhhCWrAdNK8iY4Cq9Ie9ayg6CS1CEkMD6zzo7LTRsHYzzfoY
 QQvgvzWypKDSN.pVCiFlpcm12KFG_uSXe2SqqHf7wCbtV_LRinxzEBpsT1D6aysoHbMqgaouZ_lE
 4S5zWN6ZhmJ_p.seXiPKR2QLLiO8hWiqNJHuL2W1GozAXtSrEshDjPRnV4.q6FLPyYKTHJK.lT8K
 x6b5BDAPwbu6h7Ghrfrw.almZj7.tgrQLgCNOhPERVlpOHiNYjyCl2w8YerJ3xD0IoXeae.NTZBp
 oRpT7J7EhjE1Sc4o75smZz0Aq33zzp9fX.cw4nuKFejH09SQn6WJxg28Fnl9pGs6bvdDdcxOyIGV
 _QPNV1exqP2b.OH8tII64H4yv.f83Fy_5dWTsWE2LXqFRh40OAkdFvM6y5an8589SFvdWHIxLT4I
 NimUNfFvYKRuU5gl8nUWJGy8xRJ3K9qUqf8UDmJjymA4NECzN6sbJu4pdk7RLv4fDTArcNT1b9HA
 rmc8oNh64V1nXPkJSZa5QU2IokNaRKwidPR1YYImyh8RZkEQuOErzVBg3hHUP9h_4WATp0kmQea.
 eNOpraHhTfCAGUN8v7XkPJ.kNYcoKIHDvS.3mAjhhjzD3H6yfQ3IbKL1xkYQe_Z98cfnYCIhycFH
 EfNspEKN1G2QarvU4NpJyt547D9nefOrh8MOpxzyHzxG1_ONF6UJLGp1LmtvpFRoynH8xb5AUB0e
 EJfqT4VV60uTXcHHJRsNu.ghVvS5Nx1ERO9KnuKcD6U5NcKUf_AUx81dwBZt8QsfG1sFKO.42I0t
 9fDkmfpr3UVsbAHu2w8SyuYKxiDM1pA225bA6.PYuNjv41WLSWVIQzEAYgUVe2_g3pdyCu4czR3R
 UO2IOVVLIph2dghnj9ATf3lLfzIs4JG73wCEfMk8K42dwRZqKbD8_VF4XrvKJa.crKsKqsd_bDBg
 S6VVblWzoEAUcrYg3zbFno8n30QD98eV4hwnkc3QXJpY8Xn5VYmcwgF65Vs2SjdYjbaGjYRs2U2Z
 jkRlamCRe8vbDwpCHOEjNB6zzD2ntO_V4nwQH2R05Gw6wOTiYGstno6Y1cqOYgNHXcyqOX2aczJC
 xhdiPaXd.2wZdk05txqcuTOADF15crcgcLeh1IQlG3QBSRtHAcMtgWaXEN2BRbEQjYwmZtUxYbIu
 AtmsRXuiPHJQ-
X-Sonic-MF: <namiltd@yahoo.com>
X-Sonic-ID: 8d32329a-b70c-48e8-97ac-afacb971e2cf
Received: from sonic.gate.mail.ne1.yahoo.com by sonic317.consmr.mail.ne1.yahoo.com with HTTP; Tue, 17 Nov 2026 07:36:48 +0000
Received: by hermes--production-ir2-5dd9bf4598-jnk89 (Yahoo Inc. Hermes SMTP Server) with ESMTPA ID bf2e0cf4395142d7f648239f01fb64bf;
          Tue, 17 Nov 2026 07:36:43 +0000 (UTC)
Message-ID: <7de4852e-270a-4e52-926f-be96862a2a34@yahoo.com>
Date: Tue, 17 Nov 2026 08:36:42 +0100
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH net-next v11 03/13] net: dsa: realtek: rtl8365mb: refactor
 forcemode handling
From: Mieczyslaw Nalewaj <namiltd@yahoo.com>
To: linusw@kernel.org, andrew@lunn.ch, olteanv@gmail.com, kuba@kernel.org,
 davem@davemloft.net, edumazet@google.com, pabeni@redhat.com,
 linux@armlinux.org.uk, luizluca@gmail.com, maxime.chevallier@bootlin.com,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 alvin.sipraga@analog.com, gusfmora@gmail.com, kuncy7@gmail.com,
 fabianotassotti@gmail.com, gabonpivovich@gmail.com, contact@c127.dev
References: <cf3fd237-2290-4002-8de0-ea4100ef0f85@yahoo.com>
Content-Language: pl
In-Reply-To: <cf3fd237-2290-4002-8de0-ea4100ef0f85@yahoo.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Mailer: WebService/1.1.27017 mail.backend.jedi.jws.acl:role.jedi.acl.token.atz.jws.hermes.yahoo

Move the external interface force-mode configuration behind struct
rtl8365mb_family_info, so that family D can provide its own versions
without is_d() checks in the shared code. The existing code becomes
the family C implementation and is otherwise unchanged. The
mac_link_up() and mac_link_down() callbacks call it through the family
info.

No functional change.

Tested-by: Gustavo Foletto Mora <gusfmora@gmail.com>
Tested-by: Oleg Gavrilov <gabonpivovich@gmail.com>
Signed-off-by: Mieczyslaw Nalewaj <namiltd@yahoo.com>
Reviewed-by: Linus Walleij <linusw@kernel.org>
---
 drivers/net/dsa/realtek/rtl8365mb.h      |  3 ++
 drivers/net/dsa/realtek/rtl8365mb_main.c | 44 ++++++++++++++----------
 2 files changed, 29 insertions(+), 18 deletions(-)

diff --git a/drivers/net/dsa/realtek/rtl8365mb.h b/drivers/net/dsa/realtek/rtl8365mb.h
index daa8f0b..664bddb 100644
--- a/drivers/net/dsa/realtek/rtl8365mb.h
+++ b/drivers/net/dsa/realtek/rtl8365mb.h
@@ -16,6 +16,9 @@ struct rtl8365mb_family_info {
 	unsigned int num_ports;
 	const struct rtl8365mb_jam_tbl_entry *jam_table;
 	size_t jam_size;
+	int (*ext_config_forcemode)(struct realtek_priv *priv, int port,
+				    bool link, int speed, int duplex,
+				    bool tx_pause, bool rx_pause);
 };
 
 const struct rtl8365mb_family_info *
diff --git a/drivers/net/dsa/realtek/rtl8365mb_main.c b/drivers/net/dsa/realtek/rtl8365mb_main.c
index e25eb7e..ef75dc2 100644
--- a/drivers/net/dsa/realtek/rtl8365mb_main.c
+++ b/drivers/net/dsa/realtek/rtl8365mb_main.c
@@ -348,15 +348,15 @@
 #define RTL8365MB_PORT_SPEED_1000M	2
 
 /* External interface force configuration registers 0~2 */
-#define RTL8365MB_DIGITAL_INTERFACE_FORCE_REG0		0x1310 /* EXT0 */
-#define RTL8365MB_DIGITAL_INTERFACE_FORCE_REG1		0x1311 /* EXT1 */
-#define RTL8365MB_DIGITAL_INTERFACE_FORCE_REG2		0x13C4 /* EXT2 */
-#define RTL8365MB_DIGITAL_INTERFACE_FORCE_REG(_extint) \
-		((_extint) == 0 ? RTL8365MB_DIGITAL_INTERFACE_FORCE_REG0 : \
-		 (_extint) == 1 ? RTL8365MB_DIGITAL_INTERFACE_FORCE_REG1 : \
-		 (_extint) == 2 ? RTL8365MB_DIGITAL_INTERFACE_FORCE_REG2 : \
+#define RTL8365MB_C_DIGITAL_INTERFACE_FORCE_REG0		0x1310 /* EXT0 */
+#define RTL8365MB_C_DIGITAL_INTERFACE_FORCE_REG1		0x1311 /* EXT1 */
+#define RTL8365MB_C_DIGITAL_INTERFACE_FORCE_REG2		0x13C4 /* EXT2 */
+#define RTL8365MB_C_DIGITAL_INTERFACE_FORCE_REG(_extint) \
+		((_extint) == 0 ? RTL8365MB_C_DIGITAL_INTERFACE_FORCE_REG0 : \
+		 (_extint) == 1 ? RTL8365MB_C_DIGITAL_INTERFACE_FORCE_REG1 : \
+		 (_extint) == 2 ? RTL8365MB_C_DIGITAL_INTERFACE_FORCE_REG2 : \
 		 0x0)
-#define   RTL8365MB_DIGITAL_INTERFACE_FORCE_EN_MASK		BIT(12)
+#define   RTL8365MB_C_DIGITAL_INTERFACE_FORCE_EN_MASK		BIT(12)
 #define   RTL8365MB_DIGITAL_INTERFACE_FORCE_NWAY_MASK		BIT(7)
 #define   RTL8365MB_DIGITAL_INTERFACE_FORCE_TXPAUSE_MASK	BIT(6)
 #define   RTL8365MB_DIGITAL_INTERFACE_FORCE_RXPAUSE_MASK	BIT(5)
@@ -705,11 +705,16 @@ struct rtl8365mb_extint {
 	unsigned int supported_interfaces;
 };
 
+static int rtl8365mb_c_ext_config_forcemode(struct realtek_priv *priv, int port,
+					    bool link, int speed, int duplex,
+					    bool tx_pause, bool rx_pause);
+
 static const struct rtl8365mb_family_info rtl8365mb_family_c = {
 	.family = RTL8365MB_FAMILY_C,
 	.num_ports = RTL8365MB_C_MAX_NUM_PORTS,
 	.jam_table = rtl8365mb_init_jam_8365mb_vc,
 	.jam_size = ARRAY_SIZE(rtl8365mb_init_jam_8365mb_vc),
+	.ext_config_forcemode = rtl8365mb_c_ext_config_forcemode,
 };
 
 /**
@@ -1633,9 +1638,9 @@ static const struct phylink_pcs_ops rtl8365mb_pcs_ops = {
 	.pcs_link_up = rtl8365mb_pcs_link_up,
 };
 
-static int rtl8365mb_ext_config_forcemode(struct realtek_priv *priv, int port,
-					  bool link, int speed, int duplex,
-					  bool tx_pause, bool rx_pause)
+static int rtl8365mb_c_ext_config_forcemode(struct realtek_priv *priv, int port,
+					    bool link, int speed, int duplex,
+					    bool tx_pause, bool rx_pause)
 {
 	const struct rtl8365mb_extint *extint =
 		rtl8365mb_get_port_extint(priv, port);
@@ -1690,7 +1695,7 @@ static int rtl8365mb_ext_config_forcemode(struct realtek_priv *priv, int port,
 		r_duplex = 0;
 	}
 
-	val = FIELD_PREP(RTL8365MB_DIGITAL_INTERFACE_FORCE_EN_MASK, 1) |
+	val = FIELD_PREP(RTL8365MB_C_DIGITAL_INTERFACE_FORCE_EN_MASK, 1) |
 	      FIELD_PREP(RTL8365MB_DIGITAL_INTERFACE_FORCE_TXPAUSE_MASK,
 			 r_tx_pause) |
 	      FIELD_PREP(RTL8365MB_DIGITAL_INTERFACE_FORCE_RXPAUSE_MASK,
@@ -1700,7 +1705,7 @@ static int rtl8365mb_ext_config_forcemode(struct realtek_priv *priv, int port,
 			 r_duplex) |
 	      FIELD_PREP(RTL8365MB_DIGITAL_INTERFACE_FORCE_SPEED_MASK, r_speed);
 	ret = regmap_write(priv->map,
-			   RTL8365MB_DIGITAL_INTERFACE_FORCE_REG(extint->id),
+			   RTL8365MB_C_DIGITAL_INTERFACE_FORCE_REG(extint->id),
 			   val);
 	if (ret)
 		return ret;
@@ -1816,12 +1821,14 @@ static void rtl8365mb_phylink_mac_link_down(struct phylink_config *config,
 {
 	struct dsa_port *dp = dsa_phylink_to_port(config);
 	struct realtek_priv *priv = dp->ds->priv;
+	const struct rtl8365mb_family_info *fi;
 	struct rtl8365mb_port *p;
 	struct rtl8365mb *mb;
 	u8 port = dp->index;
 	int ret;
 
 	mb = priv->chip_data;
+	fi = rtl8365mb_get_family_info(priv);
 	p = &mb->ports[port];
 	cancel_delayed_work_sync(&p->mib_work);
 
@@ -1832,8 +1839,8 @@ static void rtl8365mb_phylink_mac_link_down(struct phylink_config *config,
 	 */
 	if (phy_interface_mode_is_rgmii(interface) ||
 	    rtl8365mb_interface_is_serdes(interface)) {
-		ret = rtl8365mb_ext_config_forcemode(priv, port, false, 0, 0,
-						     false, false);
+		ret = fi->ext_config_forcemode(priv, port, false, 0, 0,
+					       false, false);
 		if (ret)
 			dev_err(priv->dev,
 				"failed to reset forced mode on port %d: %pe\n",
@@ -1852,12 +1859,14 @@ static void rtl8365mb_phylink_mac_link_up(struct phylink_config *config,
 {
 	struct dsa_port *dp = dsa_phylink_to_port(config);
 	struct realtek_priv *priv = dp->ds->priv;
+	const struct rtl8365mb_family_info *fi;
 	struct rtl8365mb_port *p;
 	struct rtl8365mb *mb;
 	u8 port = dp->index;
 	int ret;
 
 	mb = priv->chip_data;
+	fi = rtl8365mb_get_family_info(priv);
 	p = &mb->ports[port];
 	schedule_delayed_work(&p->mib_work, 0);
 
@@ -1867,9 +1876,8 @@ static void rtl8365mb_phylink_mac_link_up(struct phylink_config *config,
 	 */
 	if (phy_interface_mode_is_rgmii(interface) ||
 	    rtl8365mb_interface_is_serdes(interface)) {
-		ret = rtl8365mb_ext_config_forcemode(priv, port, true, speed,
-						     duplex, tx_pause,
-						     rx_pause);
+		ret = fi->ext_config_forcemode(priv, port, true, speed,
+					       duplex, tx_pause, rx_pause);
 		if (ret) {
 			dev_err(priv->dev,
 				"failed to force mode on port %d: %pe\n", port,
-- 
2.53.0

