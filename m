Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=66.163.185.33
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794901049;
	b=b/B8pxu2lendojxuaqR59H+iv16mSQRgMQvvszUKZ/9unh54yLIsWKSU1S8sFMdpv73z
	 L4XzqCLYy5FDtlnVKWJzkSTHEU4zB071BCBBG4RQWY+AwZnxIs+4DAISXaA5qxDdXuAM2
	 udUwCRJuXHw/EzFh/1x7ix2y9qAcBhm4YbPL52wx7shLI1NA6EMX0pzCkirXgbAfj5GEv
	 l1c8ODRP7QhEFglVe8j8kU1JD+1xe/Mg3cy+phdRBS1ajrUC3i3ni0KrIGIELo56KBJFh
	 BGCDXShR3NCd1omn8mN3awv6ZsKwzGPtciefM+BMQwryXMRBJ2S0bZUlFEzr8kBfT8A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794901049;
	h=DMARC-Filter:DKIM-Signature:X-SONIC-DKIM-SIGN:X-YMail-OSG:X-Sonic-MF:
	 X-Sonic-ID:Received:Received:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:From:To:References:Content-Language:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Mailer;
	bh=1lgNNkJskie3zgYBA7bzwZHSKBVr+DFLCNNHAkcl5Hc=;
	b=y17vp8TEJPxwsM+tZR8eFDHnZ9HV3x2YBIDmXMRxw08S0BDqJ2zp5pc9W40vjZ956Nma
	 FKLhqovIZSRTYiIoztb/E1lPf8JegjD/mKfamdEMfM06oog9liYnicTBKsyXTRwq9Myc1
	 jjJqyUkkCiODtNsccwXddzyu49822pI7k739uqm8nKwO3Zaqjs0+vrZ2ENNJv+bGP8hbx
	 scahTCfHY43J9GPONMDCqlQIuSrZamNLb4Y4Y2baQ79JO0Aro7E74LOhDwyQUTxtENzev
	 djBU7Nrndp0ETSHBTGDjj46pS1nKybaXCtmgB71OOU6SeaIePr4C5qA7vpEaqGoYmiA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=yahoo.com;
	spf=pass smtp.mailfrom=yahoo.com;
	dkim=pass header.d=yahoo.com header.i=@yahoo.com header.a=rsa-sha256 header.s=s2048 header.b=eZ0yo3Q+;
	arc=none smtp.remote-ip=66.163.185.33
Received: from sonic313-10.consmr.mail.ne1.yahoo.com (sonic313-10.consmr.mail.ne1.yahoo.com [66.163.185.33])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFE38606A32A
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 07:37:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EFE38606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yahoo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=yahoo.com header.i=@yahoo.com header.a=rsa-sha256 header.s=s2048 header.b=eZ0yo3Q+
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1794901047; bh=1lgNNkJskie3zgYBA7bzwZHSKBVr+DFLCNNHAkcl5Hc=; h=Date:Subject:From:To:References:In-Reply-To:Content-Type:From:Subject:Reply-To:Content-Type; b=eZ0yo3Q+z6AweHgd0HgRKvaYdJUGpXkis6CuZ2IXr4wfNAJdQoaIta8poWVCidra8B1fj+9bfyM/+r7uUsLcm3l3dMuN729Rc40Y3oO416pmtcq5o4RwnruRsXFVeRN4bsA54bQXG1d1l/E4TkOHhK3UfVy+El1JNigTRodJLdw2d+Htow7wsxnIcE/t8ukcNhGN8u+rFVBWw768tHrDxOoFcIPHN8+ZDggHX+jr3SgPSLi5KPJZt45y2ru4q4azDUyYy8kgujdJ6lI3hwgj0QAEHvag48ObziFtiKfmHVqpc/Jw4ra3JGAU6P3XWwa4I2jXB+/gv50yUJYSA6PN+Q==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1794901047; bh=P3gg3XF0V3ZQbh+hOH8gv28IauWX6FAgCHwZ0gFibne=; h=X-Sonic-MF:Date:Subject:From:To:From:Subject; b=CahTeDvRguUzZ9CqnSu0mgwdLFj2uk0v+UHF6PQsQ3FsuabeY5vlvzkNP7IErht/T2UUMvtaVdE2o2+s2CYADEruTinlXetXJdymK4kzEEIRw6BQMlvWyqGsUMP8FLg4D0qnOCY5joXpRHH7P8vXNv6hgKhj0n4zE8F0eCx8PWkwaypEXB4jS60xCRlNL6VqObPE7ABnBXPDw1nNOGU5mETuzpwadjRDdU5HoWGU0sfpQele4PYzN2ocSZSyoh6jTeoB3ryBtDAvMuWBs1PeXN/vomYjtUxMM1wLBL6bqL2TVFO2PvwnL9u6/DkrkgyUt4tF1CoVmU7tznPuizNu1g==
X-YMail-OSG: wVeZH_4VM1mDQ68q7P.R_wPSYoyCTOjnVlIF.kjmIVxQJqf9n8BmrTn3d7NrmfB
 qH9WZCpFiXaAv98Im8UejBEjd2H2iAnOBCQts8YeiW8vuNe0HSDW6VkRCEUUwIugbhdflEJ5EMv7
 TDfJ6nispK56a14mmtHYNKFGvZg5GTKlncZ0w9dFF4OVomMrTmO8.Mx08VMxHuOJ6lEbTHaEJC5G
 TPUncZCBbKbE7E7pTtFQn8xFzuJojFd8KOPC8Lfm1gHyS_r_T7QVhIFI.uf2iVrnzP.OP1MuoH9f
 GAm_jZHc00y.xJHXwPE7td_JvgASvkB2N0bIe0HdOX5FrwnzahCUc6aKTDv6cwC17PuWsTIiJ06x
 Vwz5odVW5WSVfJCGf4M70_lniRWSfbc1MXUpFbDdNWj.GXWY_y4XejPKs6bOyPJQk_TfLHQcceC0
 nNEBJbb6fexjiKpRkLeFyxYWOPWFF4_kL6_XFHPloNOM84WszZgqTCwpTqB.FiUTRIeBqcy2YsND
 m1p3w4czsICf0wIJovZJKZdsol3Xxdd92ovQM3VSQU4rHToX48Na3Zvd5yDVUYkuP3o5n.5aPBjp
 nyIhH_sSWDXjIA2_.3YnkDA8dpXdgQMUA0hAiLP6snJjlCwabvLVRVJ3pL0yqif9Ud4eRwM44SFI
 WYhIQUNnpQkuoq6UqirWdtqTWOTHnNtKzDTqq9xN6aljTBJZ4H92rtnxmqQFBB1gZ0.EW46tj0_0
 7EB_bqdhCMUzJX_Pb91vN9uwPOBqjEXMqjd8RBS2Kh.5oyqS0nQNzFq7dmXEbpqcBkbAtV8ggGLA
 zrTnMmcqMCIGTa7GeVb8gITxMrf3hVO7I4uMOcwP9xdbOBu0r3WQCotOrQfj73gQ4ypAqfSP5Q3t
 _9Qg4HgljEo1HKWCCBHvvRL6_J3B6dFBmkY63bdZXX8tRObYLXp1OqlJVsAr3_J0ZwFWdnNPVOPn
 FgEH2N2X.Utss0Dukx.fnrR3tyD72wqPsX1nxI1COfkRP.kn0PLz.Ksu2e.MOw7OtlGGY1HAgwqm
 ErCwXrJW.lv07E4iEhcAGJoAoDIlOMfW8dt2SyqKJ.BvQm88Q8qRChouDfuOR2IXoIEiFjBj2n9U
 8uylMPNlWxyVgv6J2PQlyt2f7crnwZYESzoRfp5iP8nw1Zbw_WZdTaiNuFufjDuILuhUYRF0PsU0
 jUcsd0sm7uP2GpNKSgrNHlu6UXNC7MS.QsK0a1S8KTGg_y3k6OlOD9FOyV1flJwEpQFYW_EgZ1XA
 Z45b3loHOm7G.5nmfLsw7hsqWI6vDEeQXOqLfmbr3B80toHXdbFzSPbKsxGAhL2Kbw_FRK01z5de
 R7btDvH0wkL3Iiob.vJTrKFivPCkonzAQ7jvI8Vss0zlXurcnC6ZHCJ779rF__zL52.e2jwIzwBU
 EvakDirOPFjLEkWRrhAvnEdSGwjsVoRwpzY3PxyGUrhoPBpgC3jztuPn5d9DlBe14PAXs_hBr0XE
 cyASpcbwK0Jfm8YSlJQMM4deTa.TvDFWMAnJXe28GQSeiX2wKLNV7gzqYWA7W9AzPIfWZ4KVbSnY
 TLQGj3DNY3BbCGG5vXcU0aDPBXu1Ubd2mn1aLgCYFDwPRjxMiRx7hki.HhaEIZmavxn1qib4XYBF
 i.rmnodLkVIbxBgFgZ413087CgjtG2zi_aFA.nDKERaMb9Z8IAge9b3mDlu4z53os3R.Q5f_UADr
 nx4xxIGsXDupGligvQJWdZX75oe1omcofv7jwA7VsxVIiN3y6dr8Uy9cV35yxBUC7DxxaVPlPF3D
 oRX5fiEMT7ozy0WtRltyYWszFhEndGSaIEwyyG79mlr4cA1oVvv9bwTSNY8uEhIvf7y9Xwtp4iEw
 Ic_JGGahqbgzOwMdpodhG.UPd3jb_Dy3o9VUqhQYAnGBxDWd5ABNzUzmGZhI0ZyrX4xwMEYpdMvM
 sbHayaAtanvsI5z4ZJrwtuswuYZzIzrfRDLaWSHavlBAwtUycaGbflSMruRDahVwTN87ozfaQCNi
 11V7FfHtkVbNMxOMDgV6aRamKgqW6pp_ZlFOfoS3ofAr2M630xdlUipQqtD__STSKrs55BE1ej7o
 a4wUz3Wk6kJuiecUANLAP7yj4vmlmtZYuaWapnLQfWwL9alF27N2SS7w7qWZkjs0xdDHvZDoAiQE
 JOAnKaPyN6EwUvdg7i4dt77Yx9RTUQnsiwVpIFFDl6qwiqbSzuvbURYp_hAsNnE0JkIPa19UtrK9
 .WvYkssvE1_79k.QlEpaR6Qvouk_w1NC58EIZFe3qEVZNHoy1Xkh_glDOoa3WGprqfK__fuHrC3l
 EJXJ8grlre41rpnk-
X-Sonic-MF: <namiltd@yahoo.com>
X-Sonic-ID: 393345f0-770f-4b88-a3c0-72773054d383
Received: from sonic.gate.mail.ne1.yahoo.com by sonic313.consmr.mail.ne1.yahoo.com with HTTP; Tue, 17 Nov 2026 07:37:27 +0000
Received: by hermes--production-ir2-5dd9bf4598-hl2mf (Yahoo Inc. Hermes SMTP Server) with ESMTPA ID b937c268bb11b144bc2d14e7f73e5caa;
          Tue, 17 Nov 2026 07:37:25 +0000 (UTC)
Message-ID: <29b232e6-8ba4-4b0f-a5a5-1a7543b7acfe@yahoo.com>
Date: Tue, 17 Nov 2026 08:37:23 +0100
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
Subject: [PATCH net-next v11 04/13] net: dsa: realtek: rtl8365mb: set speed
 for family D
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

On family C hardware, forcing a 2.5 Gbps link speed requires relying
strictly on the HSGMII SerDes configuration block, while forcing a dummy
1 Gbps value inside the standard digital interface register. Family D
introduces a dedicated hardware link speed value (5) for 2500M. The speed
bitfield width has been expanded to 3 bits, splitting the most significant
bit into a new separate register field (FORCE_SPEED2), which maps directly
to a distinct per-port digital interface force layout.

On family D the forced-mode configuration (link, duplex, pause, speed)
is written to a per-port register at 0x12c0 + port instead of the
per-extint register. The bit positions of TXPAUSE, RXPAUSE, LINK, DUPLEX
and the low two speed bits are the same as on family C; the upper speed
bits go to bits 13:12 (FORCE_SPEED2), so FORCE_EN (bit 12 on family C)
is not set. A second per-port register at 0x12c8 + port enables the
forced mode: the vendor RTL8367D API writes 0xFFFF there when the MAC
is forced and 0 otherwise. This driver always forces the MAC, as on
family C, so it writes 0xFFFF on every call, including link down.

Add the family D implementation as rtl8365mb_d_ext_config_forcemode().
The shared code reaches it through the ext_config_forcemode pointer in
struct rtl8365mb_family_info, so it needs no is_d() check.

Nothing points to it until the family D info is added together with the
chip table entry in the last patch. Until then it is not static and is
declared in rtl8365mb.h, so that the build does not warn about an unused
function.

Tested-by: Gustavo Foletto Mora <gusfmora@gmail.com>
Tested-by: Oleg Gavrilov <gabonpivovich@gmail.com>
Signed-off-by: Mieczyslaw Nalewaj <namiltd@yahoo.com>
Reviewed-by: Linus Walleij <linusw@kernel.org>
---
 drivers/net/dsa/realtek/rtl8365mb.h      |   4 +
 drivers/net/dsa/realtek/rtl8365mb_main.c | 110 +++++++++++++++++++++++
 2 files changed, 114 insertions(+)

diff --git a/drivers/net/dsa/realtek/rtl8365mb.h b/drivers/net/dsa/realtek/rtl8365mb.h
index 664bddb..3d607bd 100644
--- a/drivers/net/dsa/realtek/rtl8365mb.h
+++ b/drivers/net/dsa/realtek/rtl8365mb.h
@@ -24,6 +24,10 @@ struct rtl8365mb_family_info {
 const struct rtl8365mb_family_info *
 rtl8365mb_get_family_info(struct realtek_priv *priv);
 
+int rtl8365mb_d_ext_config_forcemode(struct realtek_priv *priv, int port,
+				     bool link, int speed, int duplex,
+				     bool tx_pause, bool rx_pause);
+
 static inline bool rtl8365mb_is_d(struct realtek_priv *priv)
 {
 	return rtl8365mb_get_family_info(priv)->family == RTL8365MB_FAMILY_D;
diff --git a/drivers/net/dsa/realtek/rtl8365mb_main.c b/drivers/net/dsa/realtek/rtl8365mb_main.c
index ef75dc2..27a6917 100644
--- a/drivers/net/dsa/realtek/rtl8365mb_main.c
+++ b/drivers/net/dsa/realtek/rtl8365mb_main.c
@@ -346,6 +346,8 @@
 #define RTL8365MB_PORT_SPEED_10M	0
 #define RTL8365MB_PORT_SPEED_100M	1
 #define RTL8365MB_PORT_SPEED_1000M	2
+#define RTL8365MB_D_PORT_SPEED_2500M	5
+#define RTL8365MB_D_PORT_SPEED_MSB_MASK	BIT(2)
 
 /* External interface force configuration registers 0~2 */
 #define RTL8365MB_C_DIGITAL_INTERFACE_FORCE_REG0		0x1310 /* EXT0 */
@@ -364,6 +366,26 @@
 #define   RTL8365MB_DIGITAL_INTERFACE_FORCE_DUPLEX_MASK		BIT(2)
 #define   RTL8365MB_DIGITAL_INTERFACE_FORCE_SPEED_MASK		GENMASK(1, 0)
 
+/* bits[13:12]; bit 13 reserved, no defined speed value uses it yet */
+#define   RTL8365MB_D_DIGITAL_INTERFACE_FORCE_SPEED2_MASK	GENMASK(13, 12)
+
+#define RTL8365MB_D_DIGITAL_INTERFACE_FORCE_REG_BASE		0x12c0
+#define RTL8365MB_D_DIGITAL_INTERFACE_FORCE_REG(_port) \
+		(RTL8365MB_D_DIGITAL_INTERFACE_FORCE_REG_BASE + (_port))
+
+#define RTL8365MB_D_DIGITAL_INTERFACE_FORCE_EN_BASE		0x12c8
+#define RTL8365MB_D_DIGITAL_INTERFACE_FORCE_REG_EN(_port) \
+		(RTL8365MB_D_DIGITAL_INTERFACE_FORCE_EN_BASE + (_port))
+
+/* Per-port force-mode enable. The vendor RTL8367D API
+ * (dal_rtl8367d_port_macForceLink_set()) treats it as an on/off switch for
+ * the whole forced configuration: all bits set when the MAC is forced, zero
+ * when it is not. The meaning of the individual bits is not documented.
+ * This driver always forces the MAC, as on family C, so all bits are set
+ * on every call, including link down.
+ */
+#define RTL8365MB_D_DIGITAL_INTERFACE_FORCE_EN_ALL_MASK	GENMASK(15, 0)
+
 /* CPU port mask register - controls which ports are treated as CPU ports */
 #define RTL8365MB_CPU_PORT_MASK_REG	0x1219
 #define   RTL8365MB_CPU_PORT_MASK_MASK	RTL8365MB_PORT_MASK
@@ -1713,6 +1735,94 @@ static int rtl8365mb_c_ext_config_forcemode(struct realtek_priv *priv, int port,
 	return 0;
 }
 
+int rtl8365mb_d_ext_config_forcemode(struct realtek_priv *priv, int port,
+				     bool link, int speed, int duplex,
+				     bool tx_pause, bool rx_pause)
+{
+	const struct rtl8365mb_extint *extint =
+		rtl8365mb_get_port_extint(priv, port);
+	u32 r_tx_pause;
+	u32 r_rx_pause;
+	u32 r_duplex;
+	u32 r_speed;
+	u32 r_link;
+	int val;
+	int ret;
+
+	if (!extint)
+		return -ENODEV;
+
+	if (link) {
+		/* Force the link up with the desired configuration */
+		r_link = 1;
+		r_rx_pause = rx_pause ? 1 : 0;
+		r_tx_pause = tx_pause ? 1 : 0;
+
+		if (speed == SPEED_2500) {
+			r_speed = RTL8365MB_D_PORT_SPEED_2500M;
+		} else if (speed == SPEED_1000) {
+			r_speed = RTL8365MB_PORT_SPEED_1000M;
+		} else if (speed == SPEED_100) {
+			r_speed = RTL8365MB_PORT_SPEED_100M;
+		} else if (speed == SPEED_10) {
+			r_speed = RTL8365MB_PORT_SPEED_10M;
+		} else {
+			dev_err(priv->dev, "unsupported port speed %s\n",
+				phy_speed_to_str(speed));
+			return -EINVAL;
+		}
+
+		if (duplex == DUPLEX_FULL) {
+			r_duplex = 1;
+		} else if (duplex == DUPLEX_HALF) {
+			r_duplex = 0;
+		} else {
+			dev_err(priv->dev, "unsupported duplex %s\n",
+				phy_duplex_to_str(duplex));
+			return -EINVAL;
+		}
+	} else {
+		/* Force the link down and reset any programmed configuration */
+		r_link = 0;
+		r_tx_pause = 0;
+		r_rx_pause = 0;
+		r_speed = 0;
+		r_duplex = 0;
+	}
+
+	val = FIELD_PREP(RTL8365MB_DIGITAL_INTERFACE_FORCE_TXPAUSE_MASK,
+			 r_tx_pause) |
+	      FIELD_PREP(RTL8365MB_DIGITAL_INTERFACE_FORCE_RXPAUSE_MASK,
+			 r_rx_pause) |
+	      FIELD_PREP(RTL8365MB_DIGITAL_INTERFACE_FORCE_LINK_MASK, r_link) |
+	      FIELD_PREP(RTL8365MB_DIGITAL_INTERFACE_FORCE_DUPLEX_MASK,
+			 r_duplex) |
+	      FIELD_PREP(RTL8365MB_DIGITAL_INTERFACE_FORCE_SPEED_MASK,
+			 r_speed &
+			 RTL8365MB_DIGITAL_INTERFACE_FORCE_SPEED_MASK);
+
+	/* Speed is 3 bits on family D: bits[1:0] go into FORCE_SPEED,
+	 * bit[2] goes into FORCE_SPEED2 (register bit 12); only 2500M
+	 * sets it. Register bit 13 is reserved.
+	 */
+	val |= FIELD_PREP(RTL8365MB_D_DIGITAL_INTERFACE_FORCE_SPEED2_MASK,
+			  FIELD_GET(RTL8365MB_D_PORT_SPEED_MSB_MASK,
+				    r_speed));
+	ret = regmap_write(priv->map,
+			   RTL8365MB_D_DIGITAL_INTERFACE_FORCE_REG(port),
+			   val);
+	if (ret)
+		return ret;
+
+	ret = regmap_write(priv->map,
+			   RTL8365MB_D_DIGITAL_INTERFACE_FORCE_REG_EN(port),
+			   RTL8365MB_D_DIGITAL_INTERFACE_FORCE_EN_ALL_MASK);
+	if (ret)
+		return ret;
+
+	return 0;
+}
+
 static void rtl8365mb_phylink_get_caps(struct dsa_switch *ds, int port,
 				       struct phylink_config *config)
 {
-- 
2.53.0

