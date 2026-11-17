Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=66.163.186.204
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794901122;
	b=AJhhRZPDkzK0gtz4ZMqIeV/20vUCv9ovK5qJbQ/6QpboOr1tLr1ExGuRvK9W/SN/Oanc
	 j4AO4MxNWLee32lOmf9TcHK5NeLSuNsNrKyrAKteqsDKhfo++aowE9OmqD7J1Y+bUwpsH
	 265ITFNmpElLfQi7a0fmiVrikjPaoEHYCIbRfw8S5jmmXrEZ/4dtDe4iDlf0d+pZaBEC0
	 0ltjMFmvk0vi1DlcJoCgFC058B1Pjveuyu4CRb+oAoLHv50Z02CX8Lw6z9o+CkXILaUb8
	 IUsClJhz4N0+kci2SuQgJWOkLExsBOgQUFzKMzR0cwl+Vz5CTItQTn2J4KoNvZdYyZg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794901122;
	h=DMARC-Filter:DKIM-Signature:X-SONIC-DKIM-SIGN:X-YMail-OSG:X-Sonic-MF:
	 X-Sonic-ID:Received:Received:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:From:To:References:Content-Language:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Mailer;
	bh=rEGBody0VV2wZG4UdVJrfQPlKeD6mE9K5pSJg6GixPo=;
	b=q3k4+NmZTXOZVBybkBl5K0zTk6ONWFxVH7JU3cSs8eUWPZMtZZu55RBoPHPaL72wYC8P
	 9kJ7Xu35HkZul9YTs4nRcoSb6DE3cWmytk4vXJtqU3mHbhwBuEkiNtCInjfoGMnUgpE8z
	 EyCC2lRJf3joNFm/dSc2ZzmVeb6dR74+tNheoo9OkF8jgjk1X+zPot5IMMxsPo4KfrceA
	 UxamPHJVCHNBDPjCwdTc/ZxCWphz72v8q2PP84/V/nf5VVnUmzYveUxDGU7b8vyme/JoP
	 DMl35+Z+pMlgfF3DjgeUY8IVPoorMP4ZI9rptWHIul1Ojdax3/1Hk6196EPfLIvRltw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=yahoo.com;
	spf=pass smtp.mailfrom=yahoo.com;
	dkim=pass header.d=yahoo.com header.i=@yahoo.com header.a=rsa-sha256 header.s=s2048 header.b=TrfRpbXx;
	arc=none smtp.remote-ip=66.163.186.204
Received: from sonic310-23.consmr.mail.ne1.yahoo.com (sonic310-23.consmr.mail.ne1.yahoo.com [66.163.186.204])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16418606A323
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 07:38:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 16418606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yahoo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=yahoo.com header.i=@yahoo.com header.a=rsa-sha256 header.s=s2048 header.b=TrfRpbXx
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1794901121; bh=rEGBody0VV2wZG4UdVJrfQPlKeD6mE9K5pSJg6GixPo=; h=Date:Subject:From:To:References:In-Reply-To:Content-Type:From:Subject:Reply-To:Content-Type; b=TrfRpbXx1g4aUzd4o965odxUwIp2aq9EMmjnYJEDkp9Xjf/1AM7/ZnL+bGXyBhnze89E7t1D+riZUNPPoZVOdulCwg5DN80hDx7IfwGXNdXPihipyriGzgZKgOvBPZtZIFmOqu6fdYdzhI6+Ol5BlcFgIjcDjoxG/pkAcBmZR4MJCYkPepN/QD0lbWunGPboIt1inY37Phh7ZI3z/GtudW1TLAroZRzAlWIBiC2iDdDRmKV9byWWIEhT33OfNTtveGC3S/khCpVw/AeLP/8AJQaUX3+nBKbBMZz5oiSID4G4ZLgvXaAIhpCJDpk1s1rifkTXrvNe1E0TDGc6DxkKTA==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1794901121; bh=Xl9F11Md/Bdp5fb1pDl0YWqMEW4AL2PJZuPLnlucypn=; h=X-Sonic-MF:Date:Subject:From:To:From:Subject; b=p8XCtsEFmJBDK4vyAemFmdleEzYcTYuW6789FjqZ/6M6Dh0tX4C5DEtWd2Oth79UA0HLhGgj1yqh8q7LFskBl22ThipUlklwta8rc/1vaZhMDElc2X1ipyxhZ17trBjNmW8qUkjos/ulIuhHZZ2ygK0QeKeWXtF8KUVVsPmR3KvLEx9chw21Yaw8z12RXosTiLz2rSuI9GLhNp1p9aCUVAgIjp41F0HF7alIUpxjJ/2YmK9rzcR7HX+IT820mIyqPfuv/x/RjQWFp9aer7sjsLR5HLXJr4ycpA83bJ8xRwZjHrNopDMIFdtKvLel/pYb6TVvewDyO07JuHHSIdMdyw==
X-YMail-OSG: jt.s00QVM1kmz2wucHGCZIdUtD5YH7Ndv7QGbxZcOOaXcLBoklaYUVdyj0jnS9G
 vI5RKOoZ7ARQ_LWSXl4z3igTVpwmIvLUpD.paCRq5UF5NyyQ03mlXYGgkPmAgKuWPeRkJsJCvsXo
 P4whH517pRAlifer2y4_gJhk3SzyC2Gcbx_4Njxf5UghgtleDTaehPjP6WvRbEu9HP7MVxgAKb4P
 8PrKdFaniJQz5sUq5A6VNAf23DophHJJXpDfbwdkStU6IFcE03XX4YfnKshkMfpJeEpn5e4SmlFO
 cAICAbrumU4PcZYIA6C41ECHJAlU_aLP2vgyIjniIXsiVdI1eBBTEQsLMoBnpe5EfWFlO.KuHrx_
 34cT0vgEbCwB0TNiK5CPKCei7r1F.mMHfx4GObWQupmxKeGb3OIY8s5g.3rhRZNd6bzfbV_GiYDT
 MTasN1bosKRYXs5V3p8OzzbNyKxYF0HWjKXB9yICB9hwm_1OOeivjCa0NSTMY.l00CCQ66vVUHAS
 ZHOOciYdB9qllO6GfgXSNuThF2_D3_x9lWVRN4eWPEyS_nxG8KNLkbs7c0pZ7VJiYgkHeEJi5TpX
 GIctnKLcv2c7wvHWgMbbUXvin2NPuD4f5x7GmKVzZHjBZ0DWTD0NdpuEaRz9ijTKoJWLaeJfnkH1
 nkARJ1zAuyLH3REfxX4hBV7K4yDGjGM5.FVXcb4lJR_O29uNaVEFIpDIZerdrVhVk0.3foQ5SjSf
 cwWor3NptZgeIze6Vt4_7meG6FDsHUTwrOMAqp8aSzq1wvTlwngvhmvDlO_o36OBHsPDutTS1R4A
 74G_u27ZBGJNDd2qszwXWY33it.dv77O_By5jz788tgpytVy8Nx306ZJp0DZRJ0vM5gxsi4CRKus
 KqFZ2wjzZ_BRr6NRt9jX1pApOu4RGTHWypffYkY_V.1m1U5dGfp55YCPiUIbctg5uj5q1rfrjYgT
 x8tyyhXvKWZHOtF.uLQvnkN7AmLEzi.MK5RERx2.zjE9126Ibo2fJuKdEx1xQBo8EUfTy.nTPCHi
 W9qhBduxeqIk.1w_Ie.S3JuP3NeYNZwIa5rwJiLFbCLUWK.MQW.gpI5Ws.nuU7IVwch_N8wVppBT
 1_asBThkIgH0tUd1B7RYMJtXGnsrMXeKSm3tT0bpZRfZzROuqxaPTw7ovxdQvM8HLRjLeLEJZ1Yq
 V7ITt09X_iLkmuT3bd8YXuDPTOJEjzdLYap52QKjJFx7FeHTzzupXPWh33TNMNaUwpLXOm.ovWOm
 89QDGeOExncf_nPs67iqUPAaF9eBVZwa_shK.p.4jQPJFHKxB2sN3uBeD1UjXekpWFO71IhcBoCO
 OIy.oRZQ5gzRl2kIbdOpTT.K0wrwRqPS.wy7eAagjZZ0ZKkHstwelyzpLoOk_I2Zurt4YgX7ZcvW
 LZyiXO9WPLNq_CCOhj.V7Vwn9j5XFP7HXOJ.BIhIrTfZDj5RF_jD6Gj3znQAn2INw5oC51aidsX_
 1kc0FA8uEDnsTshclg7LemA7gtTyHDqOJTdDTBDk7ZNx.f1MN2fpykJ7E.PYpkM4MGjf6mV8D7WU
 kxqcgC6DFwXIQsrnL4mTjQzsMGSmEiHS.OVLZzLAtY0AGC8hI0eunkS5tXBUCLSVYT9ThGJA0G9w
 rIBJw1BO6_HtczTlSNqz31Vk5sibR8wVFn6Vcd4Xfs.daTWL3MMpTDV6bClNQK_Q1gigcqOddbh7
 jC6QFMvwbQqr.nDDSb8D3YahBbyfUen6CHlYvJpxQTMOXw1HJu4FD4FxTJ_Ylb14dH8HaIVSaAr4
 dOtPG3u8gllOzMuCnXrujis8k3avWzzLB8Yu9b62WzvoPM4i3AewdLOlqLWrinpxaG_1DXuY2xyG
 TW9b4NtwGzst1Z7LanSerY5_NnhYc4QZtRlEzs9kCzw9iokesoAko4zW7PSy6Zr0RsXoX8KRzAS5
 uFrnlhCJKc2DyuWfyETVPBPzDzNAPKqe_f_fg6RPxFSSuPETmRiCMGNHO73dOHxCuzsyN.1jdeF6
 jO3oHtJ0vUW128_7XIKgj1WRpVmHHmeQeShEH8FUm6h6T3AERGtNOlMFoMhmmY5XMBsKrYEYmvj1
 79J6ZAXPyhYIwOGfLInGwOw_bdAE6NO3K.BSTguMwQm35_woiTG_EBgbE2y5nIL9ZI2ImuC7zl7R
 QMIUj5QjoJim6T_y7WJDtqh0PCFLuEEED2Uh2es5fhcFlqlGMab9N8Supd71po4OSpz2vyW_JtO4
 KBaI6M9wOFR2QJ2iW7P54I5mJTMoHlbwcVflV74XJITysIskYevLmg_xGU6cWrwNoRIwZsTFpOgD
 OWTJtLHDQxIzZqt7k4w--
X-Sonic-MF: <namiltd@yahoo.com>
X-Sonic-ID: 3e8cf93b-d7cc-41b3-95bd-ec1c338b0cdd
Received: from sonic.gate.mail.ne1.yahoo.com by sonic310.consmr.mail.ne1.yahoo.com with HTTP; Tue, 17 Nov 2026 07:38:41 +0000
Received: by hermes--production-ir2-5dd9bf4598-jnk89 (Yahoo Inc. Hermes SMTP Server) with ESMTPA ID 92c08c4c83c5e094b5b804c41fa0de80;
          Tue, 17 Nov 2026 07:38:36 +0000 (UTC)
Message-ID: <e941720f-6d54-4884-998e-c93b430e476e@yahoo.com>
Date: Tue, 17 Nov 2026 08:38:34 +0100
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
Subject: [PATCH net-next v11 06/13] net: dsa: realtek: rtl8365mb: refactor
 VLAN 4k handling
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

Move the family-specific VLAN 4k table accessors behind struct
rtl8365mb_family_info, so that family D can provide its own versions
without is_d() checks in the shared code. The existing code becomes the
family C implementation and is otherwise unchanged: rename the
functions to rtl8365mb_c_vlan_4k_read() and rtl8365mb_c_vlan_4k_write(),
export them and call them through the family info.

No functional change.

Tested-by: Gustavo Foletto Mora <gusfmora@gmail.com>
Tested-by: Oleg Gavrilov <gabonpivovich@gmail.com>
Signed-off-by: Mieczyslaw Nalewaj <namiltd@yahoo.com>
Reviewed-by: Linus Walleij <linusw@kernel.org>
---
 drivers/net/dsa/realtek/rtl8365mb.h      |  5 +++++
 drivers/net/dsa/realtek/rtl8365mb_main.c |  2 ++
 drivers/net/dsa/realtek/rtl8365mb_vlan.c | 21 ++++++++++++---------
 drivers/net/dsa/realtek/rtl8365mb_vlan.h |  7 +++++++
 4 files changed, 26 insertions(+), 9 deletions(-)

diff --git a/drivers/net/dsa/realtek/rtl8365mb.h b/drivers/net/dsa/realtek/rtl8365mb.h
index 3d607bd..d3d5fb3 100644
--- a/drivers/net/dsa/realtek/rtl8365mb.h
+++ b/drivers/net/dsa/realtek/rtl8365mb.h
@@ -10,6 +10,7 @@ enum rtl8365mb_family {
 };
 
 struct rtl8365mb_jam_tbl_entry;
+struct rtl8365mb_vlan4k;
 
 struct rtl8365mb_family_info {
 	enum rtl8365mb_family family;
@@ -19,6 +20,10 @@ struct rtl8365mb_family_info {
 	int (*ext_config_forcemode)(struct realtek_priv *priv, int port,
 				    bool link, int speed, int duplex,
 				    bool tx_pause, bool rx_pause);
+	int (*vlan_4k_read)(struct realtek_priv *priv, u16 vid,
+			    struct rtl8365mb_vlan4k *vlan4k);
+	int (*vlan_4k_write)(struct realtek_priv *priv,
+			     const struct rtl8365mb_vlan4k *vlan4k);
 };
 
 const struct rtl8365mb_family_info *
diff --git a/drivers/net/dsa/realtek/rtl8365mb_main.c b/drivers/net/dsa/realtek/rtl8365mb_main.c
index db7e67f..07e0486 100644
--- a/drivers/net/dsa/realtek/rtl8365mb_main.c
+++ b/drivers/net/dsa/realtek/rtl8365mb_main.c
@@ -757,6 +757,8 @@ static const struct rtl8365mb_family_info rtl8365mb_family_c = {
 	.jam_table = rtl8365mb_init_jam_8365mb_vc,
 	.jam_size = ARRAY_SIZE(rtl8365mb_init_jam_8365mb_vc),
 	.ext_config_forcemode = rtl8365mb_c_ext_config_forcemode,
+	.vlan_4k_read = rtl8365mb_c_vlan_4k_read,
+	.vlan_4k_write = rtl8365mb_c_vlan_4k_write,
 };
 
 /**
diff --git a/drivers/net/dsa/realtek/rtl8365mb_vlan.c b/drivers/net/dsa/realtek/rtl8365mb_vlan.c
index 8d49ffa..566c6bc 100644
--- a/drivers/net/dsa/realtek/rtl8365mb_vlan.c
+++ b/drivers/net/dsa/realtek/rtl8365mb_vlan.c
@@ -48,12 +48,13 @@
 
 #include "rtl8365mb_vlan.h"
 #include "rtl8365mb_table.h"
+#include "rtl8365mb.h"
 #include <linux/if_bridge.h>
 #include <linux/lockdep.h>
 #include <linux/regmap.h>
 
 /* CVLAN (i.e. VLAN4k) table entry layout, u16[3] */
-#define RTL8365MB_CVLAN_ENTRY_SIZE			3 /* 48-bits */
+#define RTL8365MB_C_CVLAN_ENTRY_SIZE			3 /* 48-bits */
 #define RTL8365MB_CVLAN_ENTRY_D0_MBR_MASK		GENMASK(7, 0)
 #define   RTL8365MB_CVLAN_MBR_LO_MASK			GENMASK(7, 0)
 #define RTL8365MB_CVLAN_ENTRY_D0_UNTAG_MASK		GENMASK(15, 8)
@@ -182,10 +183,10 @@ struct rtl8365mb_vlanmc {
 	u8 meteridx : 6;
 };
 
-static int rtl8365mb_vlan_4k_read(struct realtek_priv *priv, u16 vid,
-				  struct rtl8365mb_vlan4k *vlan4k)
+int rtl8365mb_c_vlan_4k_read(struct realtek_priv *priv, u16 vid,
+			     struct rtl8365mb_vlan4k *vlan4k)
 {
-	u16 data[RTL8365MB_CVLAN_ENTRY_SIZE];
+	u16 data[RTL8365MB_C_CVLAN_ENTRY_SIZE];
 	int val;
 	int ret;
 
@@ -230,10 +231,10 @@ static int rtl8365mb_vlan_4k_read(struct realtek_priv *priv, u16 vid,
 	return 0;
 }
 
-static int rtl8365mb_vlan_4k_write(struct realtek_priv *priv,
-				   const struct rtl8365mb_vlan4k *vlan4k)
+int rtl8365mb_c_vlan_4k_write(struct realtek_priv *priv,
+			      const struct rtl8365mb_vlan4k *vlan4k)
 {
-	u16 data[RTL8365MB_CVLAN_ENTRY_SIZE] = { 0 };
+	u16 data[RTL8365MB_C_CVLAN_ENTRY_SIZE] = { 0 };
 	u16 vid;
 	int val;
 
@@ -282,6 +283,7 @@ rtl8365mb_vlan_4k_port_set(struct dsa_switch *ds, int port,
 			   struct netlink_ext_ack *extack,
 			   bool include)
 {
+	const struct rtl8365mb_family_info *fi;
 	struct realtek_priv *priv = ds->priv;
 	struct rtl8365mb_vlan4k vlan4k = {0};
 	int ret;
@@ -296,7 +298,8 @@ rtl8365mb_vlan_4k_port_set(struct dsa_switch *ds, int port,
 		return -EINVAL;
 	}
 
-	ret = rtl8365mb_vlan_4k_read(priv, vlan->vid, &vlan4k);
+	fi = rtl8365mb_get_family_info(priv);
+	ret = fi->vlan_4k_read(priv, vlan->vid, &vlan4k);
 	if (ret) {
 		dev_err(priv->dev, "Failed to read VLAN 4k table\n");
 		return ret;
@@ -313,7 +316,7 @@ rtl8365mb_vlan_4k_port_set(struct dsa_switch *ds, int port,
 		vlan4k.untag &= ~BIT(port);
 	vlan4k.ivl_en = true; /* always use Independent VLAN Learning */
 
-	ret = rtl8365mb_vlan_4k_write(priv, &vlan4k);
+	ret = fi->vlan_4k_write(priv, &vlan4k);
 	if (ret) {
 		dev_err(priv->dev, "Failed to write VLAN 4k table\n");
 		return ret;
diff --git a/drivers/net/dsa/realtek/rtl8365mb_vlan.h b/drivers/net/dsa/realtek/rtl8365mb_vlan.h
index 27a526b..009b127 100644
--- a/drivers/net/dsa/realtek/rtl8365mb_vlan.h
+++ b/drivers/net/dsa/realtek/rtl8365mb_vlan.h
@@ -18,6 +18,13 @@ enum rtl8365mb_frame_ingress {
 	RTL8365MB_FRAME_TYPE_UNTAGGED_ONLY,
 };
 
+struct rtl8365mb_vlan4k;
+
+int rtl8365mb_c_vlan_4k_read(struct realtek_priv *priv, u16 vid,
+			     struct rtl8365mb_vlan4k *vlan4k);
+int rtl8365mb_c_vlan_4k_write(struct realtek_priv *priv,
+			      const struct rtl8365mb_vlan4k *vlan4k);
+
 int rtl8365mb_vlan_port_get_pvid(struct realtek_priv *priv, int port,
 				 u16 *pvid);
 int
-- 
2.53.0

