Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=66.163.186.146
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794901395;
	b=3uQQrSoakAx+cUWRVJHDhVjhD58Y+2wCivswdMI2JHZwcntb6/R8cY0+p48peJOxWSiT
	 ckTiKpR1ksD6CKwQzFL+s+8LSUFnGXPqPIIvMUpkOh5gJEjDg+8F3CKhOvH87WnxDFpaC
	 6YGna3nPBTl/Wb7KAcj+T5e4LFjzHGsGCCo8g38uHSHy9ScWpilBpHzCVGiuj0RdM7wKs
	 LgozAIZv2yMGOY6OTEis9g2ffgtfBni/OqviKm9F/TJIHoDzpVcZLGJB+EbngwttEtlYM
	 tn0jHl9NRyL9KDjO7llTwGR4hmPFc9iGNyqccMJOJYu+iLQDrPTP42Zt0ohISlG0d+w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794901395;
	h=DMARC-Filter:DKIM-Signature:X-SONIC-DKIM-SIGN:X-YMail-OSG:X-Sonic-MF:
	 X-Sonic-ID:Received:Received:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:From:To:References:Content-Language:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Mailer;
	bh=boBAAxutd8XcL34XNwouzrdxCZT6tips6Ops5PKPas0=;
	b=NrRNXx6OtgTMNsHXVnG3wfjn440MWm977egBzv/sVend2gbAri12eKYRH4IKS8KSxc1k
	 T8VUHdU1xc012hkPzMpOrDlwDDtYHSIvCtVOnfzgqz2riDB7RgbKT+OQlTrB4cew/H96F
	 azmOplL98DGvLXwgeBXx/wuXsctVO0q0oPwut6T0nLVDUNPjydaFMXj+fH8d0Cs5QRPil
	 GEbLcmxygw7d/MU7h06TR3k1xc/BB4XD28DVFQ9g3+S4bu0X5HDQ2UT79XSKNg2aYqN2v
	 u1jnTwgcHjMy7NICVj2BcJf2Rwx63KY3ihc1JiaulseCVQ4n/nnVvSqUmv5zT61ZiTg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=yahoo.com;
	spf=pass smtp.mailfrom=yahoo.com;
	dkim=pass header.d=yahoo.com header.i=@yahoo.com header.a=rsa-sha256 header.s=s2048 header.b=PjMnMocq;
	arc=none smtp.remote-ip=66.163.186.146
Received: from sonic302-20.consmr.mail.ne1.yahoo.com (sonic302-20.consmr.mail.ne1.yahoo.com [66.163.186.146])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31FB8606A323
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 07:43:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 31FB8606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yahoo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=yahoo.com header.i=@yahoo.com header.a=rsa-sha256 header.s=s2048 header.b=PjMnMocq
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1794901393; bh=boBAAxutd8XcL34XNwouzrdxCZT6tips6Ops5PKPas0=; h=Date:Subject:From:To:References:In-Reply-To:Content-Type:From:Subject:Reply-To:Content-Type; b=PjMnMocqBxvCN81AMczlBxezY40aSNSCirzEhVSXBl+lrS/hR6xGxvN1yRtKJDxral4xkULo9SkSiQHPZr0YUewzWeGgOdExa+9m0igrD/57joKHgLl4DfazjebqRL+V8gzTMQsFDj7xuD635niapqFp8wAkEHhDR67zLbSh9TKmjiW1BtFUBms98OpbeahWXZ+PA6m4jAsWYOpp1GXrGQjzW5o4fDGnf3tcFKqJ63XR1XCOVd5uENOvCpxPs5l5rjtAf9fpePMgFlkGuoyImmyqinWTj/FKAZa9U/i81RUYkdK5wgdHEg7uzAr/lIzFjGmvXLNriP1532hcWoksFw==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1794901393; bh=l1skH7A7ATYAdWCdLvyahmZXde4RnbEGg0opY6eLTwL=; h=X-Sonic-MF:Date:Subject:From:To:From:Subject; b=JLqgVVZmuPDOgY9tis3vWEmfSP5uxbzK3UKqcoy80+qg8bwN2w1mQOeqSQrld8QdOgWh21lzMba/g5Dw344TQrdDceWqekLIDC6cTvHUeqcs44M3GRhZOcWKOfNpZnenmvMVIafUluAsMAkGFeau+iVbLlzMkI70z30vDisbKqWuUwA+1MUF5juqjE+iR2Q+uJ98naIkC/AieVFGJScflTQGwexVNfl2WTQMViKn6+YY/3M+TXgEGcA82pfM3IShdzWySL1DfdsIGdCMlUYSHfmHu4wvrCH1SbEUwZaRVNAHGbyjEWDz52ohEEWP65jph3iYN0z2Q9HndGS67S5frg==
X-YMail-OSG: 5LCBhCwVM1lnQjdKm2ZuIvTuiTBrZii6BLjNLkZP0k5ShfeeXwu_lNlNkF6PdI9
 .4s_URxRUclA_G6S83bwsQknwhwUGVrZxOmIOqtjcoEUEV2utHfQmDbcRw5ndZpOf9XwFxNEYTdX
 Ax1o_YVHYvyHy9mwX13VvZKm1mIqMYZCssfP4IXcdb03bIy8nWdUTPgm2mGWgiYbpl5VIkbaBaHq
 alcffCEJs6qnXyTz.6_AcTOcNMdBoAY_7zBSHfoUqmzt9akfWVeAv2k3UyNItW95E9akASJ_azrs
 Fi9J2intNirab_ZZgvOkR1dRuTVUE5pHHhE.heq8fE8a1v7S11oFx_qcKberWiNnxneOKhrPfsLw
 7DFn926RebfwKqDJ95eD40nEcz98k3M5Z.vqyWK6pI2._d5xfFX1WtksuV_ibhZ7WH4KCgoc87Vv
 wj7.6S9t_aGXRERAjBsGHjhZlMJvFQ2DiqUMBmx5TuUFD.5Pqvj0AVm0Rzg8se2Xy8HfOQ53nw8J
 uuP2qd6O7V2Cp6W7m.hea2GSfO_bJVwaDwLMsabHVLUvPivQ_yI7dCFJ.HMPumj8sjoD61iUyVrV
 HAJDYfrWCXtd0Wq_xFAuHRukUknxjC753UQmbN6hPxpgeEsm9ZIKu5ZhnwceH6PY2IvJX97Jp0X9
 YJ7QnwNE4EEf1O2rsy8LWhExBe5g7cFzJzfpx5.QbdrGcWPkXIep6y_0jHJQAHq1jCAvRQGXiZlp
 kbg49ThSwgnr0OXB6wSv5VMzPcSd0MmfEnMPWa3QflQ_Sr5aHjWST6vS61c_oZIStHDydFQNp5pO
 BZ.h5VIEhsb4N6RW0nrGY6hzKMEp63SZs4xhgYJbzWrKAQgg_rglhGSMUCn7.K55Oe9qyeiky8p8
 b9MgY1P3VF4lnLdDVnSZuuU_9WA47KGAMNUuB11RZbT_ak71LDdS6evfG6DCJ53UZfIl_i1gIu6U
 xSWKsJ.pqHarVIKnrWs7BE.c.SKnOhT7vA8CtNHHyS.oFRKFnv6HSen_naTEe3_q7PpB0cg_Aj7I
 K3TAWPo0ZYwgnc1pcC0VtDxOuuw8_LOEPQMRzieBvuFnaxjBytt0FuaA8iFdLQlobnrYgjmKt9A7
 btUCETL.inHCBVkw4_j.w5JZHROkockFV4c.bPRvX7tZ3VK6uZLP85SR4J2f3LzMaslVbSsawofp
 ajuAoANxK97Set4wP6aBQNZvDjknwioFwRMPjT.iKwnpLARg2mFYKJGZt1LsAiBSHALGitlJcSrl
 kC21mAdlXvrfIf12vOOvgdgGryahrD.MFufrzarBJ1nzITs7hbsJV2Bt1g6ETEOtNSbnQ2T_UG8c
 LUwf54IMraaA0NRlVkQ3uapewFGIDo.6KVOtK1IdkWXc4ISUdcOFHWtkmSsZ17Vn0XVsv9Dj_sef
 DGaIkdBKPhTiP6FR8.grpiJEHqcSN0tckf1AaAZ2Q0ASRhGnSqZ8_lit6io9HLFR61nud2NYiMO3
 4XIJTfvsBm8NNH45KIqNk2grMtKgg58k8CS54qPba0PKXELcxwyb5sWKaRbFDi1UwwWfDdRaRNwV
 7kzUng_9IA1Sp8NX_vYUWDaZaLAckAMX3b0EmWhytOUKsl41ky3xCvFvN5.zrr0JdRIuZ7ao.SAV
 8qrhBlIbe3i5ephEqNBLfE3udrlAw2TtoY0_y9.gvUKxHnlmUx9xS7mrvjBpe2KU4POnx2JEGWbj
 ErU9QcnmHOLgr92ITRRy6rJgMqJObKg2ij6TNVtD0LEqukInsZvY17YAgkuDJwkm_6jeIMFASU6D
 ug4D6vo5w_5zm_olQdoz7LJstFHOZKjljmQQBj6tggyNzrVqIwoekh9qa5JMcCpAilyFzwVYNPLu
 O6R6ZoyDtbR6ohfL1mL5auUbz0gRxqEQs8kTD3P.8vnoFQXR9arR8GrMmauUsmiX_Qr0CNO.bpxH
 1pQSI3JZovsdrg5fNVgf5tCZ_BuIZcD3RMI0YU7GrXk2B5A1lfGnegkr2W2pJESSYCIdHCFVprUe
 lerXPOhQVMRWA4iL8wsgrYWwpLpP0ac0l6uWh9.RB0baMxRYtr7S3Mq04AD7IHDH9CX4SwzU6WNH
 RGPESZf4_RhagCAZLxmWl03BMZIT5X568DSfngBj0s2S8b5HNBzz6vzZ2MQ8tC18sTXR1psMjTOm
 Azdhm38YFIrgFuWm9eB7eVlPAMyubmwiL3IT.52jBPo_hCpGKQKAySebhy1bSpm720I_N8KPOmIW
 9QOONDFWDgBos5tfbOSNkfg_oIwYS6nXgItKr_gnuPcQ14Zxk8bOLukp6UWwyGnlPf7FwazvstGz
 bmaQtERcasONnRimpTT4GxA--
X-Sonic-MF: <namiltd@yahoo.com>
X-Sonic-ID: ea88a72a-5d35-450d-8bb7-e39dee856fa1
Received: from sonic.gate.mail.ne1.yahoo.com by sonic302.consmr.mail.ne1.yahoo.com with HTTP; Tue, 17 Nov 2026 07:43:13 +0000
Received: by hermes--production-ir2-5dd9bf4598-bjqzr (Yahoo Inc. Hermes SMTP Server) with ESMTPA ID 27bcb8d5ce1afe989a5a5bb7cad84a14;
          Tue, 17 Nov 2026 07:43:11 +0000 (UTC)
Message-ID: <836bf744-b589-4d9e-80cb-ad20fb6725aa@yahoo.com>
Date: Tue, 17 Nov 2026 08:43:09 +0100
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
Subject: [PATCH net-next v11 13/13] net: dsa: realtek: rtl8365mb: add support
 for RTL8367S-VB
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

Add the RTL8367S-VB (chip ID 0x6642, version 0x0010) to the chip table.
It is the first chip of family D, whose handling was added in the
preceding patches, so this is the patch that makes it reachable.

The SGMII/HSGMII SerDes of this chip sits on port 6 and the
MII/TMII/RMII/RGMII interface on port 7, as on family C, but the external
interface indices are one lower (EXT0 and EXT1 instead of EXT1 and EXT2).
The chip reuses the existing initialization jam table.

The chip has 8 ports, not 11, which is described by rtl8365mb_family_d.
This sets ds->num_ports, the IRQ domain size and the bound of every loop
over priv->num_ports for this chip. rtl8365mb_family_d also selects the
family D implementations added in the preceding patches: the force-mode
configuration, the VLAN 4k accessors, the PVID handling and the L2 entry
(de)serializers.

The L2 learning limit is the same as on family C (2112 entries), as
given by the Realtek rtl8367 common API (rtl8367_common V1.4.2), so
RTL8365MB_LEARN_LIMIT_MAX needs no per-family handling; only its
comment is updated.

Tested on a TP-Link Archer AX55 v1 (RTL8367S-VB, CPU port over HSGMII
(2500base-x) to an IPQ5018) with bridge VLAN filtering and per-port
PVIDs, and on a TP-Link EX511 v2 (RTL8367S-VB, CPU port over 1G SGMII
to an IPQ5018). RGMII mode has not been tested. See the cover letter for
details.

Tested-by: Gustavo Foletto Mora <gusfmora@gmail.com>
Tested-by: Oleg Gavrilov <gabonpivovich@gmail.com>
Signed-off-by: Mieczyslaw Nalewaj <namiltd@yahoo.com>
Reviewed-by: Linus Walleij <linusw@kernel.org>
---
 drivers/net/dsa/realtek/Kconfig          |  3 +-
 drivers/net/dsa/realtek/rtl8365mb.h      |  4 --
 drivers/net/dsa/realtek/rtl8365mb_main.c | 55 +++++++++++++++++++++---
 3 files changed, 51 insertions(+), 11 deletions(-)

diff --git a/drivers/net/dsa/realtek/Kconfig b/drivers/net/dsa/realtek/Kconfig
index d6eb671..98b1727 100644
--- a/drivers/net/dsa/realtek/Kconfig
+++ b/drivers/net/dsa/realtek/Kconfig
@@ -34,7 +34,8 @@ config NET_DSA_REALTEK_RTL8365MB
 	depends on NET_DSA_REALTEK_SMI || NET_DSA_REALTEK_MDIO
 	select NET_DSA_TAG_RTL8_4
 	help
-	  Select to enable support for Realtek RTL8365MB-VC and RTL8367S.
+	  Select to enable support for Realtek RTL8365MB-VC, RTL8367S and
+	  RTL8367S-VB.
 
 config NET_DSA_REALTEK_RTL8366RB
 	tristate "Realtek RTL8366RB switch driver"
diff --git a/drivers/net/dsa/realtek/rtl8365mb.h b/drivers/net/dsa/realtek/rtl8365mb.h
index 5b51c9a..9e526de 100644
--- a/drivers/net/dsa/realtek/rtl8365mb.h
+++ b/drivers/net/dsa/realtek/rtl8365mb.h
@@ -44,10 +44,6 @@ struct rtl8365mb_family_info {
 const struct rtl8365mb_family_info *
 rtl8365mb_get_family_info(struct realtek_priv *priv);
 
-int rtl8365mb_d_ext_config_forcemode(struct realtek_priv *priv, int port,
-				     bool link, int speed, int duplex,
-				     bool tx_pause, bool rx_pause);
-
 static inline bool rtl8365mb_is_d(struct realtek_priv *priv)
 {
 	return rtl8365mb_get_family_info(priv)->family == RTL8365MB_FAMILY_D;
diff --git a/drivers/net/dsa/realtek/rtl8365mb_main.c b/drivers/net/dsa/realtek/rtl8365mb_main.c
index c7f209b..9b821b3 100644
--- a/drivers/net/dsa/realtek/rtl8365mb_main.c
+++ b/drivers/net/dsa/realtek/rtl8365mb_main.c
@@ -89,6 +89,14 @@
  * things will work out-of-the-box for other chips, and a careful review of the
  * vendor driver may be needed to expand support. The RTL8365MB-VC seems to be
  * one of the simpler chips.
+ *
+ * The RTL8367S-VB (chip ID 0x6642) is not part of the family listed above. It
+ * belongs to a newer generation, which this driver calls family D. Its
+ * registers differ in the VLAN table, the external interface speed and RGMII
+ * configuration, the SerDes, the L2 lookup table (FDB/MDB entry layout, no
+ * EFID, LUT configuration registers) and the table access control register,
+ * so the code paths specific to it are selected with rtl8365mb_is_d() or
+ * through struct rtl8365mb_family_info
  */
 
 #include <linux/bitfield.h>
@@ -117,11 +125,12 @@
 #define RTL8365MB_NUM_PHYREGS		32
 #define RTL8365MB_PHYREGMAX		(RTL8365MB_NUM_PHYREGS - 1)
 #define RTL8365MB_C_MAX_NUM_PORTS	11
+#define RTL8365MB_D_MAX_NUM_PORTS	8
 /* Highest port count of any supported chip, used for sizing */
 #define RTL8365MB_MAX_NUM_PORTS		RTL8365MB_C_MAX_NUM_PORTS
-/* Valid for the whole family except RTL8370B, which has 4160 entries.
- * RTL8370B is mentioned in vendor code but it might not even belong
- * to the same RTL8367C family.
+/* Valid for the whole RTL8367C family (and for family D, RTL8367S-VB)
+ * except RTL8370B, which has 4160 entries. RTL8370B is mentioned in
+ * vendor code but it might not even belong to the same RTL8367C family.
  */
 #define RTL8365MB_LEARN_LIMIT_MAX	2112
 #define RTL8365MB_MAX_NUM_EXTINTS	3
@@ -797,6 +806,10 @@ static int rtl8365mb_c_ext_config_forcemode(struct realtek_priv *priv, int port,
 					    bool link, int speed, int duplex,
 					    bool tx_pause, bool rx_pause);
 
+static int rtl8365mb_d_ext_config_forcemode(struct realtek_priv *priv, int port,
+					    bool link, int speed, int duplex,
+					    bool tx_pause, bool rx_pause);
+
 static const struct rtl8365mb_family_info rtl8365mb_family_c = {
 	.family = RTL8365MB_FAMILY_C,
 	.num_ports = RTL8365MB_C_MAX_NUM_PORTS,
@@ -816,6 +829,25 @@ static const struct rtl8365mb_family_info rtl8365mb_family_c = {
 	.l2_mc_to_data = rtl8365mb_c_l2_mc_to_data,
 };
 
+static const struct rtl8365mb_family_info rtl8365mb_family_d = {
+	.family = RTL8365MB_FAMILY_D,
+	.num_ports = RTL8365MB_D_MAX_NUM_PORTS,
+	.jam_table = rtl8365mb_init_jam_8365mb_vc,
+	.jam_size = ARRAY_SIZE(rtl8365mb_init_jam_8365mb_vc),
+	.ext_config_forcemode = rtl8365mb_d_ext_config_forcemode,
+	.vlan_4k_read = rtl8365mb_d_vlan_4k_read,
+	.vlan_4k_write = rtl8365mb_d_vlan_4k_write,
+	.vlan_port_get_pvid = rtl8365mb_d_vlan_port_get_pvid,
+	.vlan_port_reset_pvid = rtl8365mb_d_vlan_port_reset_pvid,
+	.vlan_pvid_port_set = rtl8365mb_d_vlan_pvid_port_set,
+	.vlan_pvid_port_clear = rtl8365mb_d_vlan_pvid_port_clear,
+	.l2_entry_size = RTL8365MB_D_L2_ENTRY_SIZE,
+	.l2_data_to_uc = rtl8365mb_d_l2_data_to_uc,
+	.l2_uc_to_data = rtl8365mb_d_l2_uc_to_data,
+	.l2_data_to_mc = rtl8365mb_d_l2_data_to_mc,
+	.l2_mc_to_data = rtl8365mb_d_l2_mc_to_data,
+};
+
 /**
  * struct rtl8365mb_chip_info - static chip-specific info
  * @name: human-readable chip name
@@ -885,6 +917,17 @@ static const struct rtl8365mb_chip_info rtl8365mb_chip_infos[] = {
 				PHY_INTF(RMII) | PHY_INTF(RGMII) },
 		},
 	},
+	{
+		.name = "RTL8367S-VB",
+		.chip_id = 0x6642,
+		.chip_ver = 0x0010,
+		.family_info = &rtl8365mb_family_d,
+		.extints = {
+			{ 6, 0, PHY_INTF(SGMII) | PHY_INTF(HSGMII) },
+			{ 7, 1, PHY_INTF(MII) | PHY_INTF(TMII) |
+				PHY_INTF(RMII) | PHY_INTF(RGMII) },
+		},
+	},
 };
 
 enum rtl8365mb_stp_state {
@@ -1937,9 +1980,9 @@ static int rtl8365mb_c_ext_config_forcemode(struct realtek_priv *priv, int port,
 	return 0;
 }
 
-int rtl8365mb_d_ext_config_forcemode(struct realtek_priv *priv, int port,
-				     bool link, int speed, int duplex,
-				     bool tx_pause, bool rx_pause)
+static int rtl8365mb_d_ext_config_forcemode(struct realtek_priv *priv, int port,
+					    bool link, int speed, int duplex,
+					    bool tx_pause, bool rx_pause)
 {
 	const struct rtl8365mb_extint *extint =
 		rtl8365mb_get_port_extint(priv, port);
-- 
2.53.0

