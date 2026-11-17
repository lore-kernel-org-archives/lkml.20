Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=66.163.191.146
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794900968;
	b=3H2vn0unij8slw9sdKwzql+K4tFff5eZ7nTGTjV+RBTtwoMJaDYLgt64xZ9Rk43NeOOa
	 oj3tyJqDRZXcQ6BrHcJInj0UXjs5Tx7hr8tE0gIXPWVTdgqxi1KeUsNEu/Sq0Fw4CJhly
	 T7fLVE9O1fErrnwyovWDT+Vehw+RN9Ux7KjPfnwYtiqDbEfziiW3UuVwcUSKSlXuZR0eL
	 u37gz3D+Hs9/zQob7qoH7plkiF0MXR5xwkMRbAqicHZ7TVWafr5Ns9iM2FU/nig49XX3F
	 YOks0Aw/MGpeesLMHSJ89Offm5kWKIcSHGQUeVouk45W2DwGhYa3XTzMQ92NvuWoZ9w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794900968;
	h=DMARC-Filter:DKIM-Signature:X-SONIC-DKIM-SIGN:X-YMail-OSG:X-Sonic-MF:
	 X-Sonic-ID:Received:Received:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:From:To:References:Content-Language:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Mailer;
	bh=RTPx/EmPkpoGQFcpPeGHnqLDnjsHSVjRykV3wqjBzNM=;
	b=yg2qkFtJt2Hh/pb/eCrIRzlOtKEXIXE3Fc6plm+EwWqHcP0qp4Vqgu9tPR48pnoYy1Tw
	 MjsIRbVE5kPuoJfrynC4PcPkS/9V/DghuNkUbVzqxMlRuNjCuc9FgbNrPUgKBhzI3AV8U
	 ksTN5eUrJZUva80Y9TkWq1NQJb+JZ7E16fSe71vaxjTBtm5BtakxPasI5dEpQLEBY6ZuO
	 lDt5uygqqDRN7oNFWpWLJGcUZ/D//Cnero7PTlE709P3PqyRnyjsk+VV64Pg1kNQw4897
	 pAG1zPvIx8/83bRHkiE+ElBjL3t6wTkiyv9QcmW31i5H3KKlGgeG0bVQA2r1OTCJHUA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=yahoo.com;
	spf=pass smtp.mailfrom=yahoo.com;
	dkim=pass header.d=yahoo.com header.i=@yahoo.com header.a=rsa-sha256 header.s=s2048 header.b=ZkpYezA0;
	arc=none smtp.remote-ip=66.163.191.146
Received: from sonic304-20.consmr.mail.ne1.yahoo.com (sonic304-20.consmr.mail.ne1.yahoo.com [66.163.191.146])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86D90606A323
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 07:36:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 86D90606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yahoo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=yahoo.com header.i=@yahoo.com header.a=rsa-sha256 header.s=s2048 header.b=ZkpYezA0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1794900966; bh=RTPx/EmPkpoGQFcpPeGHnqLDnjsHSVjRykV3wqjBzNM=; h=Date:Subject:From:To:References:In-Reply-To:Content-Type:From:Subject:Reply-To:Content-Type; b=ZkpYezA0B+6T5ma/G7ifqHvTfmVcMjaaUWyW7oHVJTu+i1w3XZ2h/UCmZgBXYOaIkA9UTrMRHZrlWeor/I6kav0DGSooOZqNGCBlpRx4OOsGYkfxir/prWekDYjN8R1J+gmT8A8jZEPzNf9FQcComqnzg34Pcqs/R87VCFrRmGdRSWg7Jn252GfV/JwhWXqni++O96/iquQQAmIwtta4GvXKVaWFsArPwI/KloCzy2/BGZvIvEPMb+pKTQT4eDHIQHW9Qzti0cUeR5l5mrtpjWvMVmoP7GADg7aqd5lK0JjwaLVhcLcHAbFiB01UlcND6YTyjCB6WvUrr1OpRZtSeA==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1794900966; bh=7nhTNISrZvjag7URPVJR95DQX9YaM01NRCkhhAfnZG+=; h=X-Sonic-MF:Date:Subject:From:To:From:Subject; b=rmR4YVShCpHZ8+yIRSoL6iprpwEbjCXsnzpTeA9fy4+VXfFeqnm+9p58V8cafgIo/D4yoKhVJ5eV1ePkWs10w9MkG4R8/7CWQluk282I0ZOjw8s9iiGl4PCmnYezNDyvefhlwQ8F2OYpvnfR4raWAEaliEB28O+xuQ3tntemeTAMdIRlWWtJLpywak2cEHbz8JUITPeHzdLd+8BUV2EkToi5aOQDwwaUzRMkHt59zG9WKwabJorELOfU5AeeD6flKAWbpPsQOyFOL2bxsq+z3f8IVXU4saq3qaP2LRpQUADsO+iRLPgzPVgBBP98cmydYUnaxyXlLNFke3PF/B+fPw==
X-YMail-OSG: R4ibd5EVM1mc4TMx_6rme5RizSI6mEko.xyugmsNiPQ16koBaP7SdG9Z0CXO9CG
 wW5S0C5cnGRTEL5NQKGSXGdTLndqVy8d6C2e.xzgZwZREmomdRZj4QHzyZK7oJQNb.C5i..OBEd2
 3L7sECDScNm1hsVNCpYAPLPJfbK8PEjYR2FOZJrkSxuLuTL.PWPom.L4QeCB_HRkjVwc3ATckMTd
 SLdt.ABqrQG7l10woz6rVT2Y5BqYWNzAvq4xlRZg5hGteABk5wpqcBwkozOA4iz6lgT4k1KKHNqM
 appGzfLbc3ien9eupi9AqVnPe2H_gjo5qCg0XasoE7TpL13eLNUkuw8Lja8i9hdSCf49RsaajiFc
 ykJkaGazNEmex0_HvNYEjOoddCfEB0C3Im34fNLfy6xuK4veBl.JGt7ANg1AX4UzVqdNgx6042Ov
 iRd50NQwZIY3xsFc03UEi3tj79uwoIgZ0NLDtRQxbNw0G9Y5DsLbZK829jSRGzRefBIsx_WizksH
 apyJ2kHM.u_qagep0A7523YEGUsAl3YJ9BGC90mkbMyw9f7doSk.hzTyQSkerhafGOjZCCO5Q99Y
 IpDnf8E4jGMxZE03HZzP5LXszMgGgQR6DcZavNGv0kIe_HL4hDvpcuMkKHXJRUEezJDVpEFSTTd0
 0jph8LGjmlLPRGjKARxuJYrhepR08A_1aB6KOjBmCKfz32dHZzAc6JA_t0n4kjvIiR0mD5InR4uc
 OamCtzM2DZKmWMv4WVnXHByZMuO2f.pG5nxi4lY2YspuFcwZiENop2HJmy1F0M9caL0U8hpQXjAg
 1ffhVb0eWeSh6jBJv2lLJdnQFwjkbHfEG0HffctDTYZr6DJW319I74nA2IAOwi4zBQnKM_l6bd68
 Z3yrlPg2s1YMwG0MM46F8_UvKWLPDx_lJPShoRGp9ISwY4EzC9c01ard1zAaeYAFWEIwR0n0x.BE
 vwcceDB0h.u.BNczPEPaTwPBlO6Ml4iHPU8dCV.8B9e9mphn71n8SbKN7FukGDPcY1L9I24Q8pHH
 UGZo10eYGgO6AcVgVYPEnhwYNFa4q2SDwQOQeRZcRBgPh16JyT_sC5HQLKmPaO69wtb_eYdyGbii
 PQ_cKTbbZiIP_hdRlhKzqdJUWJelWiBL2NtVySTwKk4F4gVq6WLdrLvYO3VkvzJTiX6LYo_RYGtP
 Dzvut5xNr7p.rapHg9Qs4IevOIJKSgE__55BiGqIGGQy4.86mAzDPJ_1uw1wOo.U3JieOAUH2RE7
 qhN9W5YgX3g6LZA2uloEqcRkq5Du4yTNyDyfG35whe6PLmGSAbzucTEeSOKQdOrYGPdcg9PL0RtH
 oP.8I1pfksRePGbBYCjFC6iTNvchN6QWuaZHtzV90_z1U8n0qce.L4oFmFWjJcPzJJwgDZytfZ0H
 pDydcmzvrWBc279FMlhW5pAWQYPE143ayGTBUjSwJyqE7ZPGoWWoHQ7JqkYXb05thM3U6wFyZ3jj
 cQVSrM0Qb_7rPPyblhP77BTQmiEEACC6xn8Zoaow4LKybRfzCOWd7yK7nio1ijWxatXvQrJJSvZD
 .iaa._BugXgTPhyK6lxJkh5b7Z_i7G_ZEwMJMIZu_oYiCr8.joTv_kXf9B0QHTPWqoH.5UiOlbsy
 Mhl4JN5IGRVwziCXfcd05iWyr9.p0t_uWNxUF50ng.ASUbO.5aPdlxaBLTRZHRaTIPat_sRlRyZe
 68u47zUl_.3MnMZvV_U21p45m_zt_PjAibD3VkqHx3eAqSqN3RpbO.SheCp0YoQPo0Pf_L2x6vc5
 _P139wHdgZafdHSCpgPxIly4xHBAbnW0977JZcuUyFBJFoZYjxBixAhI4ugB_42fvT6oh3JE1IUd
 y1lbf72k0OqcUPj_hxXrk3ZAw0dJllmAAzSD6ZZ7sbGyvd08VXCyKFZAT.Ppzi5FXMukphaw_g7Q
 B3IIkrn6tbWfvH2zRIbFanpcggmz5ISGDDQ15V1plu6JLQ3AhwsdyiyabVw2868fMg9ni7sm9TCl
 IW8uXHKD8G.FTcODIGdJV8kJ8XMZtYfedzeZy3oORCmbET7HuDasTgpwYwujRW0U34wUwZdtG5XG
 4oK8OfbQQHQcx01p5IjCDJohGzkn2wH.fNUpUJdMchHNNAr_csUYGVhX.1PF5CyPfiC6OJuEdPKN
 W_uzG.ZhNEj.QbwiU6V8KfLRBVNqEIzZt9m3B0Q76Tvcv4Gr8xs5HjI9rWYODYZKhU0rewOg1UDd
 WFU7tWNY8TU0zp9W04SxTcmNsF.JQkKfdn9lXA.UFX.4KNPmRBk3PhChS_JjuLOLycin66VwlgUe
 SXFVagznyrDCE
X-Sonic-MF: <namiltd@yahoo.com>
X-Sonic-ID: 274c1a7f-8617-4c19-83f3-c9dc6d638276
Received: from sonic.gate.mail.ne1.yahoo.com by sonic304.consmr.mail.ne1.yahoo.com with HTTP; Tue, 17 Nov 2026 07:36:06 +0000
Received: by hermes--production-ir2-5dd9bf4598-9c455 (Yahoo Inc. Hermes SMTP Server) with ESMTPA ID 9eb29a5d49fe477ad74bf0c0c270b3a8;
          Tue, 17 Nov 2026 07:36:04 +0000 (UTC)
Message-ID: <66688f5a-5350-4945-8c2a-481fdeddedc9@yahoo.com>
Date: Tue, 17 Nov 2026 08:36:03 +0100
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
Subject: [PATCH net-next v11 02/13] net: dsa: realtek: rtl8365mb: add chip
 family infrastructure
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

Add enum rtl8365mb_family and struct rtl8365mb_family_info, which holds
the data shared by all chips of one family: the family id, the port
count and the init jam table. struct rtl8365mb_chip_info now points to
it through a family_info member, and all existing chips use the
RTL8365MB_FAMILY_C instance. rtl8365mb_get_family_info() and
rtl8365mb_is_d() are declared in a new rtl8365mb.h so that the VLAN
code can use them too.

Use num_ports from the family info in rtl8365mb_detect() instead of a
fixed constant, so that a family with a different port count can be
described by its own entry.

RTL8365MB_FAMILY_D is defined here but no chip uses it yet; it is
needed by the following patches, which add family D handling for chips
whose register layout differs from the existing ones.

No functional change.

Tested-by: Gustavo Foletto Mora <gusfmora@gmail.com>
Tested-by: Stanislaw Pal <kuncy7@gmail.com>
Tested-by: Oleg Gavrilov <gabonpivovich@gmail.com>
Signed-off-by: Mieczyslaw Nalewaj <namiltd@yahoo.com>
Reviewed-by: Linus Walleij <linusw@kernel.org>
---
 drivers/net/dsa/realtek/rtl8365mb.h      | 29 +++++++++++++
 drivers/net/dsa/realtek/rtl8365mb_main.c | 54 +++++++++++++++---------
 2 files changed, 62 insertions(+), 21 deletions(-)
 create mode 100644 drivers/net/dsa/realtek/rtl8365mb.h

diff --git a/drivers/net/dsa/realtek/rtl8365mb.h b/drivers/net/dsa/realtek/rtl8365mb.h
new file mode 100644
index 0000000..daa8f0b
--- /dev/null
+++ b/drivers/net/dsa/realtek/rtl8365mb.h
@@ -0,0 +1,29 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef _RTL8365MB_H
+#define _RTL8365MB_H
+
+#include "realtek.h"
+
+enum rtl8365mb_family {
+	RTL8365MB_FAMILY_C,
+	RTL8365MB_FAMILY_D,
+};
+
+struct rtl8365mb_jam_tbl_entry;
+
+struct rtl8365mb_family_info {
+	enum rtl8365mb_family family;
+	unsigned int num_ports;
+	const struct rtl8365mb_jam_tbl_entry *jam_table;
+	size_t jam_size;
+};
+
+const struct rtl8365mb_family_info *
+rtl8365mb_get_family_info(struct realtek_priv *priv);
+
+static inline bool rtl8365mb_is_d(struct realtek_priv *priv)
+{
+	return rtl8365mb_get_family_info(priv)->family == RTL8365MB_FAMILY_D;
+}
+
+#endif /* _RTL8365MB_H */
diff --git a/drivers/net/dsa/realtek/rtl8365mb_main.c b/drivers/net/dsa/realtek/rtl8365mb_main.c
index da06f95..e25eb7e 100644
--- a/drivers/net/dsa/realtek/rtl8365mb_main.c
+++ b/drivers/net/dsa/realtek/rtl8365mb_main.c
@@ -110,12 +110,15 @@
 #include "rtl83xx.h"
 #include "rtl8365mb_l2.h"
 #include "rtl8365mb_vlan.h"
+#include "rtl8365mb.h"
 
 /* Family-specific data and limits */
 #define RTL8365MB_PHYADDRMAX		7
 #define RTL8365MB_NUM_PHYREGS		32
 #define RTL8365MB_PHYREGMAX		(RTL8365MB_NUM_PHYREGS - 1)
-#define RTL8365MB_MAX_NUM_PORTS		11
+#define RTL8365MB_C_MAX_NUM_PORTS	11
+/* Highest port count of any supported chip, used for sizing */
+#define RTL8365MB_MAX_NUM_PORTS		RTL8365MB_C_MAX_NUM_PORTS
 /* Valid for the whole family except RTL8370B, which has 4160 entries.
  * RTL8370B is mentioned in vendor code but it might not even belong
  * to the same RTL8367C family.
@@ -702,14 +705,20 @@ struct rtl8365mb_extint {
 	unsigned int supported_interfaces;
 };
 
+static const struct rtl8365mb_family_info rtl8365mb_family_c = {
+	.family = RTL8365MB_FAMILY_C,
+	.num_ports = RTL8365MB_C_MAX_NUM_PORTS,
+	.jam_table = rtl8365mb_init_jam_8365mb_vc,
+	.jam_size = ARRAY_SIZE(rtl8365mb_init_jam_8365mb_vc),
+};
+
 /**
  * struct rtl8365mb_chip_info - static chip-specific info
  * @name: human-readable chip name
  * @chip_id: chip identifier
  * @chip_ver: chip silicon revision
+ * @family_info: data shared by all chips of the same family
  * @extints: available external interfaces
- * @jam_table: chip-specific initialization jam table
- * @jam_size: size of the chip's jam table
  *
  * These data are specific to a given chip in the family of switches supported
  * by this driver. When adding support for another chip in the family, a new
@@ -719,9 +728,8 @@ struct rtl8365mb_chip_info {
 	const char *name;
 	u32 chip_id;
 	u32 chip_ver;
+	const struct rtl8365mb_family_info *family_info;
 	const struct rtl8365mb_extint extints[RTL8365MB_MAX_NUM_EXTINTS];
-	const struct rtl8365mb_jam_tbl_entry *jam_table;
-	size_t jam_size;
 };
 
 /* Chip info for each supported switch in the family */
@@ -731,29 +739,28 @@ static const struct rtl8365mb_chip_info rtl8365mb_chip_infos[] = {
 		.name = "RTL8365MB-VC",
 		.chip_id = 0x6367,
 		.chip_ver = 0x0040,
+		.family_info = &rtl8365mb_family_c,
 		.extints = {
 			{ 6, 1, PHY_INTF(MII) | PHY_INTF(TMII) |
 				PHY_INTF(RMII) | PHY_INTF(RGMII) },
 		},
-		.jam_table = rtl8365mb_init_jam_8365mb_vc,
-		.jam_size = ARRAY_SIZE(rtl8365mb_init_jam_8365mb_vc),
 	},
 	{
 		.name = "RTL8367S",
 		.chip_id = 0x6367,
 		.chip_ver = 0x00A0,
+		.family_info = &rtl8365mb_family_c,
 		.extints = {
 			{ 6, 1, PHY_INTF(SGMII) | PHY_INTF(HSGMII) },
 			{ 7, 2, PHY_INTF(MII) | PHY_INTF(TMII) |
 				PHY_INTF(RMII) | PHY_INTF(RGMII) },
 		},
-		.jam_table = rtl8365mb_init_jam_8365mb_vc,
-		.jam_size = ARRAY_SIZE(rtl8365mb_init_jam_8365mb_vc),
 	},
 	{
 		.name = "RTL8367SB",
 		.chip_id = 0x6367,
 		.chip_ver = 0x0010,
+		.family_info = &rtl8365mb_family_c,
 		.extints = {
 			{ 6, 1, PHY_INTF(MII) | PHY_INTF(TMII) |
 				PHY_INTF(RMII) | PHY_INTF(RGMII) |
@@ -761,21 +768,18 @@ static const struct rtl8365mb_chip_info rtl8365mb_chip_infos[] = {
 			{ 7, 2, PHY_INTF(MII) | PHY_INTF(TMII) |
 				PHY_INTF(RMII) | PHY_INTF(RGMII) },
 		},
-		.jam_table = rtl8365mb_init_jam_8365mb_vc,
-		.jam_size = ARRAY_SIZE(rtl8365mb_init_jam_8365mb_vc),
 	},
 	{
 		.name = "RTL8367RB-VB",
 		.chip_id = 0x6367,
 		.chip_ver = 0x0020,
+		.family_info = &rtl8365mb_family_c,
 		.extints = {
 			{ 6, 1, PHY_INTF(MII) | PHY_INTF(TMII) |
 				PHY_INTF(RMII) | PHY_INTF(RGMII) },
 			{ 7, 2, PHY_INTF(MII) | PHY_INTF(TMII) |
 				PHY_INTF(RMII) | PHY_INTF(RGMII) },
 		},
-		.jam_table = rtl8365mb_init_jam_8365mb_vc,
-		.jam_size = ARRAY_SIZE(rtl8365mb_init_jam_8365mb_vc),
 	},
 };
 
@@ -874,6 +878,14 @@ struct rtl8365mb {
 
 #define pcs_to_rtl8365mb(_pcs) container_of((_pcs), struct rtl8365mb, pcs)
 
+const struct rtl8365mb_family_info *
+rtl8365mb_get_family_info(struct realtek_priv *priv)
+{
+	struct rtl8365mb *mb = priv->chip_data;
+
+	return mb->chip_info->family_info;
+}
+
 static int rtl8365mb_phy_poll_busy(struct realtek_priv *priv)
 {
 	u32 val;
@@ -3036,17 +3048,17 @@ static int rtl8365mb_change_tag_protocol(struct dsa_switch *ds,
 static int rtl8365mb_switch_init(struct realtek_priv *priv)
 {
 	struct rtl8365mb *mb = priv->chip_data;
-	const struct rtl8365mb_chip_info *ci;
+	const struct rtl8365mb_family_info *fi;
 	int ret;
 	int i;
 
-	ci = mb->chip_info;
+	fi = mb->chip_info->family_info;
 
-	/* Do any chip-specific init jam before getting to the common stuff */
-	if (ci->jam_table) {
-		for (i = 0; i < ci->jam_size; i++) {
-			ret = regmap_write(priv->map, ci->jam_table[i].reg,
-					   ci->jam_table[i].val);
+	/* Do any family-specific init jam before getting to the common stuff */
+	if (fi->jam_table) {
+		for (i = 0; i < fi->jam_size; i++) {
+			ret = regmap_write(priv->map, fi->jam_table[i].reg,
+					   fi->jam_table[i].val);
 			if (ret)
 				return ret;
 		}
@@ -3349,7 +3361,7 @@ static int rtl8365mb_detect(struct realtek_priv *priv)
 
 	dev_info(priv->dev, "found an %s switch\n", mb->chip_info->name);
 
-	priv->num_ports = RTL8365MB_MAX_NUM_PORTS;
+	priv->num_ports = mb->chip_info->family_info->num_ports;
 	mb->priv = priv;
 	mb->cpu.trap_port = RTL8365MB_MAX_NUM_PORTS;
 	mb->cpu.insert = RTL8365MB_CPU_INSERT_TO_ALL;
-- 
2.53.0

