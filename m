Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=66.163.191.146
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794901312;
	b=sFQyeemZJQU/xumxadDh9c0BOhjqAQUiLAFDzMlgCpvj0WrEyu0M8aOavcCxnu9xJ5oO
	 BAfLBKYmbn2gXWMVgBbhKPJHWtQNVA2SxE7hVQtO3QLUFsZ0iULXzFwlEpMck0mGDNa5Y
	 2PMQMZ7xR3igjqrXWZ3DFycaUEBmkK6nu8+ETWikXxPKX9MQ+bpUR2LFslZFc8QsTxt3g
	 BjaGUGeZW2eJIj4dGqOJve9BWuy6nbtK95jrn74k71xEMMjMQV8Hr6Ni+w9gsU4c2HZ6y
	 sWDjqTnobiO8zaNn3FBuRjHNPInfJkyG9GtPlGyCdANVPPN5tWDJUjEYNp98xOtryVQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794901312;
	h=DMARC-Filter:DKIM-Signature:X-SONIC-DKIM-SIGN:X-YMail-OSG:X-Sonic-MF:
	 X-Sonic-ID:Received:Received:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:From:To:References:Content-Language:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Mailer;
	bh=7n8ToB2Ik32XcJDeQOj5Jzdahsq/wiZvBqTwDhLhG5M=;
	b=XIyD2q+o1TQRjmXsETW3MMzD1wnP5g5eQR0I/3LzJSeANds4DyLpdEKbc0twVKhVRozM
	 EGuhonfGHqiMh2ljv2uYnl0mkAK5TKOBPbmCzqpelUqq+ApGjVF8DaMpHYpsEywXHKEpr
	 DgW+JeunOr7ykNuwxb1L8okUAytMy0Ju41dNP4x4An9QukkHgWwcNalgLL7fcFzqrjXiM
	 o/oBeJCvh1LvaAu15crqFIH9lnssH/sTGF84stIHjOivpg9ud1OTuwELTujd4uuzP/Y6U
	 s/fAWQ08vHmNFUrVJkKJH/teyMylOIS/GUG/I5IjhRoQt6VP1O6vmdMRou1pbkT2nAQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=yahoo.com;
	spf=pass smtp.mailfrom=yahoo.com;
	dkim=pass header.d=yahoo.com header.i=@yahoo.com header.a=rsa-sha256 header.s=s2048 header.b=ggFALWHb;
	arc=none smtp.remote-ip=66.163.191.146
Received: from sonic304-20.consmr.mail.ne1.yahoo.com (sonic304-20.consmr.mail.ne1.yahoo.com [66.163.191.146])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47324606A31C
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 07:41:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 47324606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yahoo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=yahoo.com header.i=@yahoo.com header.a=rsa-sha256 header.s=s2048 header.b=ggFALWHb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1794901311; bh=7n8ToB2Ik32XcJDeQOj5Jzdahsq/wiZvBqTwDhLhG5M=; h=Date:Subject:From:To:References:In-Reply-To:Content-Type:From:Subject:Reply-To:Content-Type; b=ggFALWHb5RtQB/DMLFG9l1s7oUx4zIsiGV1+bLHBDbx6TXVVxrc6sMbYYA+sQUTic1DwkzGk7Dsl7u2Bx5l2BJH6JnU+U9D/hEuTNRVuexOrRY0V1raO/L+rK6Exp6Y+1a8Ssfkc03GM5dtOpsHemHoJneWXGDzhX8F+jQ+Z/0KIw6YXfUSCYa3Juo06+9N9H9yN5SGbWGwjfX49x+xdWXI50eay7sC0Sen+G4H+FerLWdHOxEw5pF95Ew11e9eHCsoxfDLewz3mvA1o8vtbh0sHVdgvJA+G9xvXoMDuQTmCqVOFM7ASdSzKKSh6f3BP32laWXd24YYA2/nHuJfA4g==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1794901311; bh=AfMooSCZdYoGpF9eZaexMFpGfjNkvD2gnr7dSbojocX=; h=X-Sonic-MF:Date:Subject:From:To:From:Subject; b=VqXf1eSApYEUVAt1Fcs8G7hQn4SBBqJr2vLzpNMqqpicNidNKZ1w86XdU30lBy7BWCAE12eLJGhy4u+PWG1vYxGw7dF+9OdQtU5bv7eGauGXUnIGYuLwMpe7mDkdcA0M1QO08UQDnOZEcDbuQLleBf+alOFHqsYbmSEX0lokrXZpiB91GYe1cDmPRXL2ZRDLhcMGVgErRWwx+lgF8E/bJLhiS6RPY0QqcATboRJCwf+x8x2fVIXbptcD1RgM0IBCgobK4o0cDvVwpWcNX2FAb15q6yR/4KI9oAhg1a2vByIQOjUsWlPS3OMi5kWZpBkVIh1jcC5v4KvE8wV3qtnMdg==
X-YMail-OSG: MGcefqEVM1nanagwZ5T3PZmMw2GtJD3wj5SKqI1owkrb5ZL0FgLsrE9QQwikm0g
 qgTkD7MpqDYLXiznkEZaf8zVProYn7aAjiZTfxPtShfyJlqsIoqzHixVKfwNPNK1oIB.jQZadl2M
 IuW_HCRqW_onGu0K3v.WUJ0T0IWyfcWzn_iFiForzdMZ_I8mY_oIFtxII_BVSH53ut6TCpTvKCED
 EH3rkoyAlG6COUFUEaCYVrdzAzLjO63573c.ECpGqeXg.lquOQDVlxHgFArb7K1hzOR8STxoW15s
 b8Rxnre.VnpKPyvQwQYGmyJLWFSgv7cKX6q8IWUWGLFnwjP7rrU5lb0R4cyuAxeQ9Ae8aU4qa0OZ
 23jMoiVr2J705gGU6gtBhq5pbnlfrE22zmbJ5B8Y07DRb4m.Mr62cre_KBvHe5uubPeXq1uEKXt6
 wXisujiwXtwtXHV.kS7c3rLYR44iQK4oqiCPnvDsyHVoFN318tpPgB58tq2fhiYD7D0V9vm_4aF2
 uVOXKRFscMTCo7oec6FtynTTKqwTDNs5twYt_frkSKvaiQfuErUhy0MDH6RDQC3ajJxfdD_wLkHe
 PtH48.hIudK.ZcPPzs9lsUWtRYMLggRiD9cksWp3odanCi8PU9aWogDUvAjqlEhUdET4m_7C49v3
 bZHuz3rdlk3YoJZo2y0DMcZOqBm4me5S3X.lWvU8WAt0G37V3mowYjRNCmM2UGfc6x8LQN.MQTJY
 QhgXO_S7bOlost1NliqvnBnA4fVvhotYLC1Rj2xg43smDy560azxOIglU1_Np55BB3i2jLlgM8FK
 HjVxICHW15DFt8vX6HImSphCNB52EgffXMs9GybiiuLc51Bzfg_TPysZbNQb2IJMKwA8d2Ir5HZI
 8NriLbXBpANh6hoL4hjgTZhUhFkh_a9alSB.WjWYr5JNC0oKgVTjzO3c3LoaQCsjueECDeZo3YMV
 nvJvYiCAGpz4y3Gzai.Gu9V_wsGW05r2buzurvOSr.O_1qKDSiRD8OJFtKVlz1QAfUf4DGPfryaF
 LaasWMscXOPtUHvOwhyJ2D_512lg0FDLaSlywNS74djmx5Z0dLcCgs5uXCaPk7Jf7xrU1vbc3jX_
 2XmnUHbPzfzITsWsuwmbyObgOd1cJHkX5To5NmycOaZEB6xbZpFbKrOBgmzuHZUxOgGHWhJyqbmG
 dl17G0AF1eC8r4UOQlRfIHs5T3j3jt56_0a3hm7hOQh.O8lhjAsoOtF3vz6qPZe_VFrMlWW7PoYR
 iz6_8HAxl9oZ5xsY9LIJewf7Ze4o6zonx6blWdowh1kW26LO11seuju2UI9cU29s2G0gfRvFQMxO
 RfXa6ak5K3ZvI8MUJf9KlhCU3vyib2VkvQIycJW_vI8cX1wq37z50RES_rVvoL4zimaygF8AUUl4
 4NtKFK4BRUOEKteKK_cO5LFX9GOFK.RGEbDW9iaUdl7lJFzjVr1LwRGf5UIqdZQcQrtv7aU2KAz3
 BvY3NkK7JUXP7G.SHf1WfDZWa_UJleG9sNRAQGYNkp0gspDQSgTAp2D50KCPil9WBDmD2PCmKEjo
 gF2PAj5yfpvonSXF0XFaNSdUFvbCAQDPZApKNS2mtV_R5hvKGH5i.1g44HmdeW.N0XMoSIt0cKui
 gdH5gVTMeGk15sBvE4P0d4Q4bprMyT9l4ogm2lfOKCCevdMhZfTdamp8EOhzcIDBvryJtd27F8pO
 wz3uvZo7VMi4v7ViKSAqGtrcffsMahT9poo3woWx5bOfi7zl0z.pXlVvlK4Zjhdx3_GSAXGFg7pw
 MrLmiLgFH477yqYUOVmuj8qQ1gwSebeIENYDHCTBe7HNzBR7SScdhVb0SGZS8jaDZ4nMMWOrmPs8
 YNBTmBMg6oDKLiFGH2WgpXBYTMjOycB8QPGwroTs3TUydcTl2fO.d4zzLQKbESs5gaaSllT37syF
 WgTKxeC18fW_eufHlEy3bTNEnlMrOosftVucX9BxW9jP2uy4hSKdFwTCEOxo1iqn.Ng.yBDaiXKg
 WU7ZTOoiEqniFmFRpUPuciRKSSWCSeJOwWDMxrOAW6FB5blDsG8JMfVuYJzdR8cFdU2dw3Bdco7n
 k_67AqQYsdbhAdZZlWkpJMFEidFd8IRSLWCUBfUt_RGgZXsaG9MSGlE57LPecqSaNQVzCibOcOeX
 p7zJ7wAPaUyL1qvJqxGGYgfFgsRSRRhmXpbwajw9To1Z0PzM43WOmHs0Xi5QGz92MGEy26G6OHwL
 GsCT2KsmTzPRyMY3Lqm.a7KSuLMtr2T6crSX13TQjuxpuqjK4ae3Zb6M.e92qKfT1DRSzCYzEPLK
 MkNuHyycgpzTwlQAPG0uqKnk-
X-Sonic-MF: <namiltd@yahoo.com>
X-Sonic-ID: f1924e9d-9575-48da-8826-c625c80d676c
Received: from sonic.gate.mail.ne1.yahoo.com by sonic304.consmr.mail.ne1.yahoo.com with HTTP; Tue, 17 Nov 2026 07:41:51 +0000
Received: by hermes--production-ir2-5dd9bf4598-lsjm6 (Yahoo Inc. Hermes SMTP Server) with ESMTPA ID dfeee45bf2a02dfcda31f779331c1b4f;
          Tue, 17 Nov 2026 07:41:48 +0000 (UTC)
Message-ID: <adadecc7-a52e-4394-9bdc-cc078cce26f3@yahoo.com>
Date: Tue, 17 Nov 2026 08:41:46 +0100
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
Subject: [PATCH net-next v11 11/13] net: dsa: realtek: rtl8365mb: refactor L2
 MAC handling
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

Add L2 MAC pack/unpack helpers and use them in the family C
serializers instead of open-coding the byte packing, since the layout
of the MAC address words is the same for both families. The now unused
per-field MAC masks are dropped.

Rename the family C serializers to rtl8365mb_c_l2_*(), export them and
reach them through function pointers in struct rtl8365mb_family_info,
so that a following patch can add the family D layout without touching
the family C code again.

No functional change.

Tested-by: Gustavo Foletto Mora <gusfmora@gmail.com>
Tested-by: Stanislaw Pal <kuncy7@gmail.com>
Tested-by: Oleg Gavrilov <gabonpivovich@gmail.com>
Signed-off-by: Mieczyslaw Nalewaj <namiltd@yahoo.com>
Reviewed-by: Linus Walleij <linusw@kernel.org>
---
 drivers/net/dsa/realtek/rtl8365mb.h      |   7 ++
 drivers/net/dsa/realtek/rtl8365mb_l2.c   | 125 +++++++++++------------
 drivers/net/dsa/realtek/rtl8365mb_l2.h   |  12 +++
 drivers/net/dsa/realtek/rtl8365mb_main.c |   5 +
 4 files changed, 83 insertions(+), 66 deletions(-)

diff --git a/drivers/net/dsa/realtek/rtl8365mb.h b/drivers/net/dsa/realtek/rtl8365mb.h
index e7f03d9..5b51c9a 100644
--- a/drivers/net/dsa/realtek/rtl8365mb.h
+++ b/drivers/net/dsa/realtek/rtl8365mb.h
@@ -13,6 +13,8 @@ struct dsa_switch;
 struct netlink_ext_ack;
 struct rtl8365mb_jam_tbl_entry;
 struct rtl8365mb_vlan4k;
+struct rtl8365mb_l2_uc;
+struct rtl8365mb_l2_mc;
 
 struct rtl8365mb_family_info {
 	enum rtl8365mb_family family;
@@ -32,6 +34,11 @@ struct rtl8365mb_family_info {
 	int (*vlan_pvid_port_set)(struct dsa_switch *ds, int port, u16 vid,
 				  struct netlink_ext_ack *extack);
 	int (*vlan_pvid_port_clear)(struct dsa_switch *ds, int port, u16 vid);
+	size_t l2_entry_size;
+	void (*l2_data_to_uc)(const u16 *data, struct rtl8365mb_l2_uc *uc);
+	void (*l2_uc_to_data)(const struct rtl8365mb_l2_uc *uc, u16 *data);
+	void (*l2_data_to_mc)(const u16 *data, struct rtl8365mb_l2_mc *mc);
+	void (*l2_mc_to_data)(const struct rtl8365mb_l2_mc *mc, u16 *data);
 };
 
 const struct rtl8365mb_family_info *
diff --git a/drivers/net/dsa/realtek/rtl8365mb_l2.c b/drivers/net/dsa/realtek/rtl8365mb_l2.c
index 0494d8a..cd5b333 100644
--- a/drivers/net/dsa/realtek/rtl8365mb_l2.c
+++ b/drivers/net/dsa/realtek/rtl8365mb_l2.c
@@ -6,18 +6,11 @@
 
 #include <linux/etherdevice.h>
 
+#include "rtl8365mb.h"
 #include "rtl8365mb_l2.h"
 #include "rtl8365mb_table.h"
 #include <linux/regmap.h>
 
-#define RTL8365MB_L2_ENTRY_SIZE			6
-
-#define RTL8365MB_L2_UC_D0_MAC5_MSK		GENMASK(7, 0)
-#define RTL8365MB_L2_UC_D0_MAC4_MSK		GENMASK(15, 8)
-#define RTL8365MB_L2_UC_D1_MAC3_MSK		GENMASK(7, 0)
-#define RTL8365MB_L2_UC_D1_MAC2_MSK		GENMASK(15, 8)
-#define RTL8365MB_L2_UC_D2_MAC1_MSK		GENMASK(7, 0)
-#define RTL8365MB_L2_UC_D2_MAC0_MSK		GENMASK(15, 8)
 #define RTL8365MB_L2_UC_D3_VID_MSK		GENMASK(11, 0)
 #define RTL8365MB_L2_UC_D3_IVL_MSK		GENMASK(13, 13)
 #define RTL8365MB_L2_UC_D3_PORT_EXT_MSK	GENMASK(15, 15)
@@ -36,12 +29,6 @@
 #define RTL8365MB_L2_UC_D5_FWD_PRI_MSK		GENMASK(4, 4)
 #define RTL8365MB_L2_UC_D5_STATIC_MSK		GENMASK(5, 5)
 
-#define RTL8365MB_L2_MC_D0_MAC5_MSK		GENMASK(7, 0)
-#define RTL8365MB_L2_MC_D0_MAC4_MSK		GENMASK(15, 8)
-#define RTL8365MB_L2_MC_D1_MAC3_MSK		GENMASK(7, 0)
-#define RTL8365MB_L2_MC_D1_MAC2_MSK		GENMASK(15, 8)
-#define RTL8365MB_L2_MC_D2_MAC1_MSK		GENMASK(7, 0)
-#define RTL8365MB_L2_MC_D2_MAC0_MSK		GENMASK(15, 8)
 #define RTL8365MB_L2_MC_D3_VID_MSK		GENMASK(11, 0)
 #define RTL8365MB_L2_MC_D3_IVL_MSK		GENMASK(13, 13)
 #define RTL8365MB_L2_MC_D3_MBR_HI1_MSK		GENMASK(15, 14)
@@ -131,16 +118,29 @@ struct rtl8365mb_l2_mc {
 	bool igmp_asic;
 };
 
-static void rtl8365mb_l2_data_to_uc(const u16 *data, struct rtl8365mb_l2_uc *uc)
+static void rtl8365mb_l2_mac_to_data(const u8 *m, u16 *data)
+{
+	data[0] = (m[4] << 8) | m[5];
+	data[1] = (m[2] << 8) | m[3];
+	data[2] = (m[0] << 8) | m[1];
+}
+
+static void rtl8365mb_l2_data_to_mac(const u16 *data, u8 *m)
+{
+	m[5] = data[0] & 0xff;
+	m[4] = data[0] >> 8;
+	m[3] = data[1] & 0xff;
+	m[2] = data[1] >> 8;
+	m[1] = data[2] & 0xff;
+	m[0] = data[2] >> 8;
+}
+
+void rtl8365mb_c_l2_data_to_uc(const u16 *data,
+			       struct rtl8365mb_l2_uc *uc)
 {
 	u32 val;
 
-	uc->key.mac_addr[5] = FIELD_GET(RTL8365MB_L2_UC_D0_MAC5_MSK, data[0]);
-	uc->key.mac_addr[4] = FIELD_GET(RTL8365MB_L2_UC_D0_MAC4_MSK, data[0]);
-	uc->key.mac_addr[3] = FIELD_GET(RTL8365MB_L2_UC_D1_MAC3_MSK, data[1]);
-	uc->key.mac_addr[2] = FIELD_GET(RTL8365MB_L2_UC_D1_MAC2_MSK, data[1]);
-	uc->key.mac_addr[1] = FIELD_GET(RTL8365MB_L2_UC_D2_MAC1_MSK, data[2]);
-	uc->key.mac_addr[0] = FIELD_GET(RTL8365MB_L2_UC_D2_MAC0_MSK, data[2]);
+	rtl8365mb_l2_data_to_mac(data, uc->key.mac_addr);
 	uc->key.efid = FIELD_GET(RTL8365MB_L2_UC_D4_EFID_MSK, data[4]);
 	uc->key.vid = FIELD_GET(RTL8365MB_L2_UC_D3_VID_MSK, data[3]);
 	uc->key.ivl = FIELD_GET(RTL8365MB_L2_UC_D3_IVL_MSK, data[3]);
@@ -161,23 +161,13 @@ static void rtl8365mb_l2_data_to_uc(const u16 *data, struct rtl8365mb_l2_uc *uc)
 	uc->is_static = FIELD_GET(RTL8365MB_L2_UC_D5_STATIC_MSK, data[5]);
 }
 
-static void rtl8365mb_l2_uc_to_data(const struct rtl8365mb_l2_uc *uc, u16 *data)
+void rtl8365mb_c_l2_uc_to_data(const struct rtl8365mb_l2_uc *uc,
+			       u16 *data)
 {
 	u32 val;
 
-	memset(data, 0, RTL8365MB_L2_ENTRY_SIZE * 2);
-	data[0] |=
-		FIELD_PREP(RTL8365MB_L2_UC_D0_MAC5_MSK, uc->key.mac_addr[5]);
-	data[0] |=
-		FIELD_PREP(RTL8365MB_L2_UC_D0_MAC4_MSK, uc->key.mac_addr[4]);
-	data[1] |=
-		FIELD_PREP(RTL8365MB_L2_UC_D1_MAC3_MSK, uc->key.mac_addr[3]);
-	data[1] |=
-		FIELD_PREP(RTL8365MB_L2_UC_D1_MAC2_MSK, uc->key.mac_addr[2]);
-	data[2] |=
-		FIELD_PREP(RTL8365MB_L2_UC_D2_MAC1_MSK, uc->key.mac_addr[1]);
-	data[2] |=
-		FIELD_PREP(RTL8365MB_L2_UC_D2_MAC0_MSK, uc->key.mac_addr[0]);
+	memset(data, 0, RTL8365MB_C_L2_ENTRY_SIZE * 2);
+	rtl8365mb_l2_mac_to_data(uc->key.mac_addr, data);
 	data[3] |= FIELD_PREP(RTL8365MB_L2_UC_D3_VID_MSK, uc->key.vid);
 	data[3] |= FIELD_PREP(RTL8365MB_L2_UC_D3_IVL_MSK, uc->key.ivl);
 
@@ -200,16 +190,12 @@ static void rtl8365mb_l2_uc_to_data(const struct rtl8365mb_l2_uc *uc, u16 *data)
 	data[5] |= FIELD_PREP(RTL8365MB_L2_UC_D5_STATIC_MSK, uc->is_static);
 }
 
-static void rtl8365mb_l2_data_to_mc(const u16 *data, struct rtl8365mb_l2_mc *mc)
+void rtl8365mb_c_l2_data_to_mc(const u16 *data,
+			       struct rtl8365mb_l2_mc *mc)
 {
 	u32 val;
 
-	mc->key.mac_addr[5] = FIELD_GET(RTL8365MB_L2_MC_D0_MAC5_MSK, data[0]);
-	mc->key.mac_addr[4] = FIELD_GET(RTL8365MB_L2_MC_D0_MAC4_MSK, data[0]);
-	mc->key.mac_addr[3] = FIELD_GET(RTL8365MB_L2_MC_D1_MAC3_MSK, data[1]);
-	mc->key.mac_addr[2] = FIELD_GET(RTL8365MB_L2_MC_D1_MAC2_MSK, data[1]);
-	mc->key.mac_addr[1] = FIELD_GET(RTL8365MB_L2_MC_D2_MAC1_MSK, data[2]);
-	mc->key.mac_addr[0] = FIELD_GET(RTL8365MB_L2_MC_D2_MAC0_MSK, data[2]);
+	rtl8365mb_l2_data_to_mac(data, mc->key.mac_addr);
 	/* key.vid,key.fid shares the same memory space */
 	mc->key.vid = FIELD_GET(RTL8365MB_L2_MC_D3_VID_MSK, data[3]);
 	mc->key.ivl = FIELD_GET(RTL8365MB_L2_MC_D3_IVL_MSK, data[3]);
@@ -228,17 +214,13 @@ static void rtl8365mb_l2_data_to_mc(const u16 *data, struct rtl8365mb_l2_mc *mc)
 	mc->igmp_asic = FIELD_GET(RTL8365MB_L2_MC_D5_IGMP_ASIC_MSK, data[5]);
 }
 
-static void rtl8365mb_l2_mc_to_data(const struct rtl8365mb_l2_mc *mc, u16 *data)
+void rtl8365mb_c_l2_mc_to_data(const struct rtl8365mb_l2_mc *mc,
+			       u16 *data)
 {
 	u32 val;
 
-	memset(data, 0, RTL8365MB_L2_ENTRY_SIZE * 2);
-	data[0] |= FIELD_PREP(RTL8365MB_L2_MC_D0_MAC5_MSK, mc->key.mac_addr[5]);
-	data[0] |= FIELD_PREP(RTL8365MB_L2_MC_D0_MAC4_MSK, mc->key.mac_addr[4]);
-	data[1] |= FIELD_PREP(RTL8365MB_L2_MC_D1_MAC3_MSK, mc->key.mac_addr[3]);
-	data[1] |= FIELD_PREP(RTL8365MB_L2_MC_D1_MAC2_MSK, mc->key.mac_addr[2]);
-	data[2] |= FIELD_PREP(RTL8365MB_L2_MC_D2_MAC1_MSK, mc->key.mac_addr[1]);
-	data[2] |= FIELD_PREP(RTL8365MB_L2_MC_D2_MAC0_MSK, mc->key.mac_addr[0]);
+	memset(data, 0, RTL8365MB_C_L2_ENTRY_SIZE * 2);
+	rtl8365mb_l2_mac_to_data(mc->key.mac_addr, data);
 	data[3] |= FIELD_PREP(RTL8365MB_L2_MC_D3_VID_MSK, mc->key.vid);
 	data[3] |= FIELD_PREP(RTL8365MB_L2_MC_D3_IVL_MSK, mc->key.ivl);
 
@@ -283,17 +265,20 @@ int rtl8365mb_l2_get_next_uc(struct realtek_priv *priv, u16 *addr, int port,
 			     struct realtek_fdb_entry *entry)
 {
 	u16 data[RTL8365MB_L2_ENTRY_SIZE] = { 0 };
+	const struct rtl8365mb_family_info *fi;
 	struct rtl8365mb_l2_uc uc;
 	int ret;
 
+	fi = rtl8365mb_get_family_info(priv);
+
 	ret = rtl8365mb_table_query(priv, RTL8365MB_TABLE_L2,
 				    RTL8365MB_TABLE_OP_READ, addr,
 				    RTL8365MB_TABLE_L2_METHOD_ADDR_NEXT_UC_PORT,
-				    port, data, RTL8365MB_L2_ENTRY_SIZE);
+				    port, data, fi->l2_entry_size);
 	if (ret)
 		return ret;
 
-	rtl8365mb_l2_data_to_uc(data, &uc);
+	fi->l2_data_to_uc(data, &uc);
 
 	ether_addr_copy(entry->mac_addr, uc.key.mac_addr);
 	entry->vid = uc.key.vid;
@@ -307,6 +292,7 @@ int rtl8365mb_l2_add_uc(struct realtek_priv *priv, int port,
 			u16 efid, u16 vid)
 {
 	u16 data[RTL8365MB_L2_ENTRY_SIZE] = { 0 };
+	const struct rtl8365mb_family_info *fi;
 	struct rtl8365mb_l2_uc uc = { 0 };
 	u16 addr;
 	int ret;
@@ -326,13 +312,14 @@ int rtl8365mb_l2_add_uc(struct realtek_priv *priv, int port,
 	uc.is_static = true;
 	/* age greater than 0 adds/updates entries */
 	uc.age = 1;
-	rtl8365mb_l2_uc_to_data(&uc, data);
+	fi = rtl8365mb_get_family_info(priv);
+	fi->l2_uc_to_data(&uc, data);
 
 	/* add the new entry or update an existing one */
 	ret = rtl8365mb_table_query(priv, RTL8365MB_TABLE_L2,
 				    RTL8365MB_TABLE_OP_WRITE, &addr,
 				    0, 0,
-				    data, RTL8365MB_L2_ENTRY_SIZE);
+				    data, fi->l2_entry_size);
 
 	/* Assume the missing new entry as the table is full */
 	if (ret == -ENOENT)
@@ -347,6 +334,7 @@ int rtl8365mb_l2_del_uc(struct realtek_priv *priv, int port,
 			u16 efid, u16 vid)
 {
 	u16 data[RTL8365MB_L2_ENTRY_SIZE] = { 0 };
+	const struct rtl8365mb_family_info *fi;
 	struct rtl8365mb_l2_uc uc = { 0 };
 	u16 addr;
 	int ret;
@@ -358,7 +346,8 @@ int rtl8365mb_l2_del_uc(struct realtek_priv *priv, int port,
 	uc.key.vid = vid;
 	/* age 0 deletes the entry */
 	uc.age = 0;
-	rtl8365mb_l2_uc_to_data(&uc, data);
+	fi = rtl8365mb_get_family_info(priv);
+	fi->l2_uc_to_data(&uc, data);
 
 	/* it looks like the switch will always add/update the entry,
 	 * even when age is 0 or uc.key did not match an existing entry,
@@ -368,7 +357,7 @@ int rtl8365mb_l2_del_uc(struct realtek_priv *priv, int port,
 	ret = rtl8365mb_table_query(priv, RTL8365MB_TABLE_L2,
 				    RTL8365MB_TABLE_OP_WRITE, &addr,
 				    0, 0,
-				    data, RTL8365MB_L2_ENTRY_SIZE);
+				    data, fi->l2_entry_size);
 
 	if (ret == -ENOENT) {
 		dev_dbg(priv->dev, "%s: %pM vid=%d efid=%d missing\n",
@@ -451,6 +440,7 @@ int rtl8365mb_l2_add_mc(struct realtek_priv *priv, int port,
 			u16 vid)
 {
 	u16 data[RTL8365MB_L2_ENTRY_SIZE] = { 0 };
+	const struct rtl8365mb_family_info *fi;
 	struct rtl8365mb_l2_mc mc = { 0 };
 	u16 addr;
 	int ret;
@@ -463,16 +453,17 @@ int rtl8365mb_l2_add_mc(struct realtek_priv *priv, int port,
 	 */
 	mc.member |= BIT(port);
 	mc.is_static = 1;
-	rtl8365mb_l2_mc_to_data(&mc, data);
+	fi = rtl8365mb_get_family_info(priv);
+	fi->l2_mc_to_data(&mc, data);
 
 	/* First look for an existing entry (to get existing port members) */
 	ret = rtl8365mb_table_query(priv, RTL8365MB_TABLE_L2,
 				    RTL8365MB_TABLE_OP_READ, &addr,
 				    RTL8365MB_TABLE_L2_METHOD_MAC, 0,
-				    data, RTL8365MB_L2_ENTRY_SIZE);
+				    data, fi->l2_entry_size);
 	if (!ret) {
 		/* There is already an entry... */
-		rtl8365mb_l2_data_to_mc(data, &mc);
+		fi->l2_data_to_mc(data, &mc);
 		dev_dbg(priv->dev,
 			"%s: found %pM addr=%d member=0x%x igmpidx=0x%x %s\n",
 			__func__, mac_addr, addr, mc.member, mc.igmpidx,
@@ -487,7 +478,7 @@ int rtl8365mb_l2_add_mc(struct realtek_priv *priv, int port,
 			mc.is_static = 1;
 		}
 
-		rtl8365mb_l2_mc_to_data(&mc, data);
+		fi->l2_mc_to_data(&mc, data);
 	} else if (ret == -ENOENT) {
 		/* New entry, no need to update data again as it already
 		 * includes the member.
@@ -508,7 +499,7 @@ int rtl8365mb_l2_add_mc(struct realtek_priv *priv, int port,
 	ret = rtl8365mb_table_query(priv, RTL8365MB_TABLE_L2,
 				    RTL8365MB_TABLE_OP_WRITE, &addr,
 				    0, 0,
-				    data, RTL8365MB_L2_ENTRY_SIZE);
+				    data, fi->l2_entry_size);
 
 	/* Assume the missing new entry as the table is full */
 	if (ret == -ENOENT)
@@ -522,6 +513,7 @@ int rtl8365mb_l2_del_mc(struct realtek_priv *priv, int port,
 			u16 vid)
 {
 	u16 data[RTL8365MB_L2_ENTRY_SIZE] = { 0 };
+	const struct rtl8365mb_family_info *fi;
 	struct rtl8365mb_l2_mc mc = { 0 };
 	u16 addr;
 	int ret;
@@ -529,13 +521,14 @@ int rtl8365mb_l2_del_mc(struct realtek_priv *priv, int port,
 	memcpy(mc.key.mac_addr, mac_addr, ETH_ALEN);
 	mc.key.vid = vid;
 	mc.key.ivl = true;
-	rtl8365mb_l2_mc_to_data(&mc, data);
+	fi = rtl8365mb_get_family_info(priv);
+	fi->l2_mc_to_data(&mc, data);
 
 	/* First look for an existing entry (to get existing port members) */
 	ret = rtl8365mb_table_query(priv, RTL8365MB_TABLE_L2,
 				    RTL8365MB_TABLE_OP_READ, &addr,
 				    RTL8365MB_TABLE_L2_METHOD_MAC, 0,
-				    data, RTL8365MB_L2_ENTRY_SIZE);
+				    data, fi->l2_entry_size);
 	if (ret == -ENOENT) {
 		dev_dbg(priv->dev, "%s: %pM vid=%d missing\n",
 			__func__, mac_addr, vid);
@@ -547,7 +540,7 @@ int rtl8365mb_l2_del_mc(struct realtek_priv *priv, int port,
 		/* Return on any other error */
 		return ret;
 
-	rtl8365mb_l2_data_to_mc(data, &mc);
+	fi->l2_data_to_mc(data, &mc);
 	dev_dbg(priv->dev,
 		"%s: found %pM addr=%d member=0x%x igmpidx=0x%x %s\n",
 		__func__, mac_addr, addr, mc.member, mc.igmpidx,
@@ -565,12 +558,12 @@ int rtl8365mb_l2_del_mc(struct realtek_priv *priv, int port,
 		mc.fwd_pri = 0;
 		mc.igmp_asic = 0;
 	}
-	rtl8365mb_l2_mc_to_data(&mc, data);
+	fi->l2_mc_to_data(&mc, data);
 
 	/* update the existing entry. */
 	ret = rtl8365mb_table_query(priv, RTL8365MB_TABLE_L2,
 				    RTL8365MB_TABLE_OP_WRITE, &addr,
 				    0, 0,
-				    data, RTL8365MB_L2_ENTRY_SIZE);
+				    data, fi->l2_entry_size);
 	return ret;
 }
diff --git a/drivers/net/dsa/realtek/rtl8365mb_l2.h b/drivers/net/dsa/realtek/rtl8365mb_l2.h
index 9470cf0..a9f9ae4 100644
--- a/drivers/net/dsa/realtek/rtl8365mb_l2.h
+++ b/drivers/net/dsa/realtek/rtl8365mb_l2.h
@@ -12,6 +12,18 @@
 
 #include "realtek.h"
 
+#define RTL8365MB_C_L2_ENTRY_SIZE		6
+/* Highest L2 entry size of any supported chip, used for sizing */
+#define RTL8365MB_L2_ENTRY_SIZE			RTL8365MB_C_L2_ENTRY_SIZE
+
+struct rtl8365mb_l2_uc;
+struct rtl8365mb_l2_mc;
+
+void rtl8365mb_c_l2_data_to_uc(const u16 *data, struct rtl8365mb_l2_uc *uc);
+void rtl8365mb_c_l2_uc_to_data(const struct rtl8365mb_l2_uc *uc, u16 *data);
+void rtl8365mb_c_l2_data_to_mc(const u16 *data, struct rtl8365mb_l2_mc *mc);
+void rtl8365mb_c_l2_mc_to_data(const struct rtl8365mb_l2_mc *mc, u16 *data);
+
 int rtl8365mb_l2_get_next_uc(struct realtek_priv *priv, u16 *addr, int port,
 			     struct realtek_fdb_entry *entry);
 int rtl8365mb_l2_add_uc(struct realtek_priv *priv, int port,
diff --git a/drivers/net/dsa/realtek/rtl8365mb_main.c b/drivers/net/dsa/realtek/rtl8365mb_main.c
index 6f80b17..0cec3b6 100644
--- a/drivers/net/dsa/realtek/rtl8365mb_main.c
+++ b/drivers/net/dsa/realtek/rtl8365mb_main.c
@@ -797,6 +797,11 @@ static const struct rtl8365mb_family_info rtl8365mb_family_c = {
 	.vlan_port_reset_pvid = rtl8365mb_c_vlan_port_reset_pvid,
 	.vlan_pvid_port_set = rtl8365mb_c_vlan_pvid_port_set,
 	.vlan_pvid_port_clear = rtl8365mb_c_vlan_pvid_port_clear,
+	.l2_entry_size = RTL8365MB_C_L2_ENTRY_SIZE,
+	.l2_data_to_uc = rtl8365mb_c_l2_data_to_uc,
+	.l2_uc_to_data = rtl8365mb_c_l2_uc_to_data,
+	.l2_data_to_mc = rtl8365mb_c_l2_data_to_mc,
+	.l2_mc_to_data = rtl8365mb_c_l2_mc_to_data,
 };
 
 /**
-- 
2.53.0

