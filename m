Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=66.163.184.148
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794901088;
	b=j5c3ltygVpr1sqrxcYWw7WVIZepvKgXF09xw1PrHsvUrFhZYyDLQ7jaLWia4Pu9pvHBl
	 s/FcULwrIAQ0dnGFo+va3E14POiqpq0/KRv9OJP4NL/o1aJOp7GyQ/6onRxwEnYr+rPO/
	 5jaoL0u5jaNMLiB7hY8pP4MNm30ldn57o7ijkN+Ne0kS4tKK5qsjYVWOaPrni43AAtWxy
	 ylSKbsaSesc6I6FD1HvL9s4mX8lmwiXgZXNL75RmE/KKDjFTQWTlI+Q3LeHXB1CgSGcCO
	 a/qogNW4Zaz4Pg1k+RAnkcecNk1Vs7DErHJUyD07244DfGip1RXfbozzSr/FZYDsVtQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794901088;
	h=DMARC-Filter:DKIM-Signature:X-SONIC-DKIM-SIGN:X-YMail-OSG:X-Sonic-MF:
	 X-Sonic-ID:Received:Received:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:From:To:References:Content-Language:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Mailer;
	bh=cnTpSzdRkSqZ0FnFR+Ytyy55fTrz1m1UJo4WEAuGhYk=;
	b=5YLkqwb9mZO5NmkaHxKZ737+IU8JEo3T91j/uK5XvQXG/cb6sJw6oIiKLlsyf4JBLsfK
	 U9cMXEh2ib4wMB9N7fYCtDeui3QP/3beUfIG5jYcBGruwJNq3PWRfzRqWPkEwU9HBaoJZ
	 vbSEHFWyYNigdZSh8IHVJN/b7Bi5Sb+s9bva/WbFqt+auMuuPtZ1ie2Ujd4mXG9FW7lIi
	 AJairXBIfg8XJQg90JgHadB5v3fnV4ArKSXl4XoxmDzpwdmTnMRGVXYGJ2ZeaWHLaUkSk
	 elqwmV/T7d22Az74gZgIp4X2MPESAz4lEjy6fSEa4/IKlTIODygyJV5Prtv63zCdPoQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=yahoo.com;
	spf=pass smtp.mailfrom=yahoo.com;
	dkim=pass header.d=yahoo.com header.i=@yahoo.com header.a=rsa-sha256 header.s=s2048 header.b=f3JCpI8J;
	arc=none smtp.remote-ip=66.163.184.148
Received: from sonic309-22.consmr.mail.ne1.yahoo.com (sonic309-22.consmr.mail.ne1.yahoo.com [66.163.184.148])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9C5E606A329
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 07:38:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A9C5E606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yahoo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=yahoo.com header.i=@yahoo.com header.a=rsa-sha256 header.s=s2048 header.b=f3JCpI8J
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1794901086; bh=cnTpSzdRkSqZ0FnFR+Ytyy55fTrz1m1UJo4WEAuGhYk=; h=Date:Subject:From:To:References:In-Reply-To:Content-Type:From:Subject:Reply-To:Content-Type; b=f3JCpI8J4ypC89HnvllpUH26d+Qyt9wWvBxLf653ltB+oMiVLPvRrSb4rCPB04hRyee3fiaByORZgLXA1kHM7kL1TGttcEHKfuDYq6sqipjrrLF7tBACsqofZdog7/FuZ1RW1SpN2YxA25wt1uVEPCtQDSAwYA38OOC7cOM1H9chhkza2Hm8EkYGfLWjTD2WIkxaf+qOXIcqV8RxQOBkjWQkRm+8xcF30nnlTuMe1vF6mMzwGrbBr9C6VYHD6gguC831uBkdgvYhkPzv2+DfO6EjTt2OzTsgEAJ3kBnNc1vuaqxW1l53mbmFYEx5ThYcrKHcteU6FQtRVCBLi/Y/oA==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1794901086; bh=59tSGwAXJg5tFAjtAPa7ooFEOJyVKs8ZB3St7RR6vGK=; h=X-Sonic-MF:Date:Subject:From:To:From:Subject; b=WVhbMf6mHcCAfLze6SGf0zDaF4S6QJrSeEzXgdOAmC1W7ofe/aVwP9be5LOWgiOXHTqV0rwV+uo2cotq0KyfYlegpTLCni2u128ZqjrMdmYG3n9g4HVUYquMiPDSu095GJJGFUEbIxYgy4krA0Tm9L3trq9yApIfoUciZg4B+bzDfC8DsgDtkflZOji1dtAViXyMkrMgixiM1+2WuSD8xzMpfvnJ/0rV5XThsozCSuma6yxS4zMnmvdP4Tk2idQRLWBwHyRDcEAMwUOlbyU3onovHhZmNq5Ex2OduuKYKKswu0eHjnZz4/hncZntVi8nqCbjuP4BZgWmjWU3JKhAYQ==
X-YMail-OSG: faLbUeAVM1nDprk7Os1tfQMhCkG2FvJlQYEFSa.2n9736zmYoyHOIjG4a6d0sbK
 61HDB5aP5aTTDnbgkSBXBMm4pMo7R9cWM4jfWspsLGxEGI0EbuhaX5UcLxDSziGgf4igBRQCAht_
 OgVFtBXt9rFHHJj3bWRc2s7kv7Ifp6TQTfJsf1461PvKkVHif6wZxGszpzZjGyVuYk4saJfCZbpk
 AdfyPgZBLn9qUeBO4sjHC2o7vQxnLpnCN4SaFzroUyX.9oPAR5mUWgC3ugC4c200mDi6DwdLolVS
 YUZbjolz6BT2vjHiF2YfNZ3RrZbW66MMnMFFyeX82kngZFWvGFKBSK_9tpuBisMfvhMobTLcMyId
 NIT0MUXys0HLBoZvbgsCdWFsU7M5e6pgQpxubzMhHL8WH2uOflxkl6HpE9fBd9MmjMdEUZUgZGsB
 ThTNYTRgTdrU0hd_Gew75WJVwnZgpToE.K7NuFPhWoO7uZdxGFmlAthaxuAV4vvcDhX2xiW6u6n5
 FQkaYsXnpEBGWB_.k94XGoAaRY47iaz6n12C3E7eqnyTLoyUaSvuBQqYyEaRrDgTVqPrEwrHwq0u
 buPlKDNOjdqwhb0tdIbnS2AI93DHeSYzsJ9gUuxlLNBWSnev7E_nkUCSXRzRHuBRj6yiY9quT4nv
 q3jPDbHjdECw5QZG46EOL9YcyLPbyGLhkILcPpa53zrsulKLwQ5ocf8kOPs9ezNHIPDD.EQNU_g1
 7STE2VVSfwN6taj2GVkNx0HMoBItPcqbrAnzESX.RkLaoWldOF3AvyS.aaG7AwPtYS6hRHLA5SH_
 .5WW8eFYUGAHJFdGPEe4wsRVzW144ZazXQa_zWaOzOIcwoIRFHuGgZCKk3.E0avUYL3phHXY3CC5
 6WnJ7Xe5O1yCej6f_Ho6uhHRlI2lRcIcqn73mEJscx94DzpWgw7bwD3c0rBnrNKZsDbkNrbZYQQg
 OhbxskLQybicKb5s_t9MGfwJMH9XDYKsKIFxmanF_V1enKggV_zPtLIYYLmnMemlhDIWgRy5xOh6
 f6Z_d2DOD7hxDa.3aNVU6H0EnF67_lE5Pfr77YE.3_44rQgEsioGf_VjHi6taq1gEIO9xSX4ISUM
 Ap9v4ABuv4WQTyWO_2_8waSjTL3MNOM3NvnVskN2qDZe5wXvfRlQrNXgeCq84wS5KXfvJGhMrO13
 oRMiL06McXpBDKmznSw6MLdkf8KQ7QvTOEr2.UJjMn7s0R4LHnfMDTf1HQjmX1FgQKz.maor0XOC
 Ayrrd1JgCcTCX7AAnt.0t1B138IDxJVhwnzDzpzs4FCkQXYdBjdFkTZOFjlXhkmRRR9rLcWhsSJB
 GdOWJ17.3xkEUoKuZAIT_KmU6e8Ipf4xY7YgN5TJs0tv73FmS82cCWtVzyB71a1BFcfN6zhW682n
 TLf6C4BJFrYD2buT_srh5.XKwzt2ozMTNCDYIzJ_PYzSVZxuYsmuLkThxj31I_33DMZBYHhd1fLB
 pp_7SdaEDIEZtz119tk1Js4_MIZQN2iTnYgjSmug7KQ1cx6DYe1AEes88fYROwyUI8XyyGbyZ1Ux
 6hyE3NtN34Kr4QBqAzv2hgNVz3dJoOQ6v674OKa1Vwwbh3ZPu8ZXt0z5cP9kmCyuAtMZqf3FYV9W
 gPUOBul3OQg8JsaO1a5fqUvUvRciid109fl44NCrOJ1U.JmI6c1prnZT1q05Vg89rCkMS.nDq.5R
 KjRIHHnSBarWyoj.40LEAx7yuBo4depG42bUT1nAIyKxMa1iv8S63m2ELR__UoL_7RGK6OmN.Kjs
 XCDWel.GRGDgYBBarHGNt_qXGLbB0RRcFgVScTyqEx4qFfvNjpRgtDZt40112goFQQhSflxu80T3
 n5yI11ynUBBKimZ2a4iUPcUsC.P4fYW82uHKrxhM.e2ogJHtTNLSQSSifmBj5Pog8soor1lCtPiP
 0lN6QkqDso74y0OaFuto59rmVA6M_TOs.IZ1QKeC_e2J3PqOjtA.TxhohHKW7ui_JzDH1kepQdMg
 _8xXPHyZRD.LSCrjlKVT.4qOOOCbaF4PjIQ_pixnpbNaWv4X7wC9KIgX4Y_cvGzwjrDfjUdOMxoa
 fXBkn8pbP7OgqI.cTqTAfZx944z9UZMwIHpo_egG7nLvvX8m9SYGsTAS8LjMLnR5Z_OhRhiphAiO
 0n.xrSkdiuOSanuTVtJ31CmtcvgqtXus__US4iH35BBzsC7ZmoZVim1uah6br4Wpm_XSEgrot7W8
 hKKN099lyh0DXQZzrUi5poUNCs3jpbxpGOTtJf_qss_WueRkh1TEeMqB7UvVyEEa.17eD2SIGP7x
 CGXMxy30AWREOWQg-
X-Sonic-MF: <namiltd@yahoo.com>
X-Sonic-ID: 34858c3b-1774-4fcc-bf12-55d127d1adad
Received: from sonic.gate.mail.ne1.yahoo.com by sonic309.consmr.mail.ne1.yahoo.com with HTTP; Tue, 17 Nov 2026 07:38:06 +0000
Received: by hermes--production-ir2-5dd9bf4598-xpdvn (Yahoo Inc. Hermes SMTP Server) with ESMTPA ID 1e3ecaed49c5fe5482950e0f201994cb;
          Tue, 17 Nov 2026 07:38:01 +0000 (UTC)
Message-ID: <be53e44a-08aa-47a8-a1c7-648896e6f091@yahoo.com>
Date: Tue, 17 Nov 2026 08:38:00 +0100
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
Subject: [PATCH net-next v11 05/13] net: dsa: realtek: rtl8365mb: set RGMII
 mode for family D
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

On family D, RGMII on extension interface 1 needs three things that
the other families do not: the EXT1 RGMII TX clock delay field in
EXT_TXC_DLY (0x13f9, bits [5:3]) must be cleared, the pin mux in the
top-level configuration register must be set up, and SerDes 1, which
shares the pins, must be disabled.

The vendor RGMII setup for EXT1 clears the RGMII field of EXT_TXC_DLY
(0x13f9, bits [5:3]) in addition to programming TXDELAY in RGMXF.
Do the same. The init jam table writes 0x0090 to this register, which
leaves the field at 2, so without the clear an extra TX delay would be
applied on top of tx-internal-delay-ps. Clearing it makes
tx-internal-delay-ps the only source of TX delay.

If the internal MAC4 block occupies extension 1, do not advertise RGMII
for port 7 in phylink_get_caps(), so the configuration is refused before
any EXT1 register is touched. This mirrors the vendor RTL8367D API, which
returns an error for RGMII on port 7 when UTP port 4 uses the RGMII
interface. The driver logs an error naming the conflict. RGMII is the
only interface of port 7 this driver implements, so port 7 then has no
supported interface: phylink_create() fails for it, and if it is a CPU
port the switch does not probe.

When MAC4 does not own the pins, bind the RGMII/MII pins to MAC7 and
disable SerDes 1, which shares them. The TX delay field, the pin mux and
the SerDes 1 disable are all programmed before RGMII is selected, so the
shared pins are never driven by RGMII and SerDes 1 at the same time.

The family D branch is not reachable until the chip table entry is
added in the last patch.

Signed-off-by: Mieczyslaw Nalewaj <namiltd@yahoo.com>
Reviewed-by: Linus Walleij <linusw@kernel.org>
---
 drivers/net/dsa/realtek/rtl8365mb_main.c | 70 +++++++++++++++++++++++-
 1 file changed, 68 insertions(+), 2 deletions(-)

diff --git a/drivers/net/dsa/realtek/rtl8365mb_main.c b/drivers/net/dsa/realtek/rtl8365mb_main.c
index 27a6917..db7e67f 100644
--- a/drivers/net/dsa/realtek/rtl8365mb_main.c
+++ b/drivers/net/dsa/realtek/rtl8365mb_main.c
@@ -334,6 +334,12 @@
 #define   RTL8365MB_SDS_OPTION_ARM_KEY		0x0249
 #define RTL8365MB_SDS_OPTION_REG		0x13C1
 
+#define RTL8365MB_D_SDS_MISC_MODE_FIELD_MASK		GENMASK(4, 0)
+/* Shared "disable" encoding for both SDS_MISC's and SDS1_MISC0's
+ * 5-bit mode fields.
+ */
+#define RTL8365MB_D_PORT_SDS_MODE_DISABLE		0x1f
+
 /* Embedded DW8051 microcontroller control registers. The microcontroller
  * can run firmware to manage the SerDes link, but this driver keeps it in
  * reset and disabled: phylink already performs the link management that
@@ -466,6 +472,20 @@
 #define   RTL8365MB_PORT_MISC_CFG_VLAN_EGRESS_MODE_MASK		GENMASK(5, 4)
 #define   RTL8365MB_PORT_MISC_CFG_CONGESTION_SUSTAIN_TIME_MASK	GENMASK(3, 0)
 
+/* EXT_TXC_DLY holds a 3-bit TX clock delay per external interface, for
+ * RGMII ([2:0] EXT0, [5:3] EXT1, [8:6] EXT2) and separately for GMII.
+ * Only the EXT1 RGMII field is used here, and it is cleared in RGMII
+ * mode so that tx-internal-delay-ps is the only TX delay applied.
+ */
+#define RTL8365MB_D_REG_EXT_TXC_DLY				0x13f9
+#define   RTL8365MB_D_EXT1_RGMII_TX_DLY_MASK			GENMASK(5, 3)
+
+#define RTL8365MB_D_REG_TOP_CON0				0x1d70
+#define   RTL8365MB_D_MAC7_SEL_EXT1_MASK			BIT(13)
+#define   RTL8365MB_D_MAC4_SEL_EXT1_MASK			BIT(12)
+
+#define RTL8365MB_D_REG_SDS1_MISC0				0x1d78
+
 /**
  * enum rtl8365mb_vlan_egress_mode - port VLAN egress mode
  * @RTL8365MB_VLAN_EGRESS_MODE_ORIGINAL: follow untag mask in VLAN4k table entry
@@ -1263,6 +1283,32 @@ static int rtl8365mb_ext_config_rgmii(struct realtek_priv *priv, int port,
 	if (ret)
 		return ret;
 
+	if (rtl8365mb_is_d(priv) && extint->id == 1) {
+		ret = regmap_update_bits(priv->map,
+					 RTL8365MB_D_REG_EXT_TXC_DLY,
+					 RTL8365MB_D_EXT1_RGMII_TX_DLY_MASK, 0);
+		if (ret)
+			return ret;
+
+		/* Bind the RGMII/MII pins to MAC7. MAC4 does not own them:
+		 * RGMII is not advertised otherwise, see
+		 * rtl8365mb_phylink_get_caps().
+		 */
+		ret = regmap_update_bits(priv->map,
+					 RTL8365MB_D_REG_TOP_CON0,
+					 RTL8365MB_D_MAC7_SEL_EXT1_MASK,
+					 RTL8365MB_D_MAC7_SEL_EXT1_MASK);
+		if (ret)
+			return ret;
+
+		ret = regmap_update_bits(priv->map,
+					 RTL8365MB_D_REG_SDS1_MISC0,
+					 RTL8365MB_D_SDS_MISC_MODE_FIELD_MASK,
+					 RTL8365MB_D_PORT_SDS_MODE_DISABLE);
+		if (ret)
+			return ret;
+	}
+
 	ret = regmap_update_bits(
 		priv->map, RTL8365MB_DIGITAL_INTERFACE_SELECT_REG(extint->id),
 		RTL8365MB_DIGITAL_INTERFACE_SELECT_MODE_MASK(extint->id),
@@ -1830,6 +1876,8 @@ static void rtl8365mb_phylink_get_caps(struct dsa_switch *ds, int port,
 		rtl8365mb_get_port_extint(ds->priv, port);
 	struct realtek_priv *priv = ds->priv;
 	struct rtl8365mb *mb = priv->chip_data;
+	u32 data;
+	int ret;
 
 	config->mac_capabilities = MAC_SYM_PAUSE | MAC_ASYM_PAUSE |
 				   MAC_10 | MAC_100 | MAC_1000FD;
@@ -1859,8 +1907,26 @@ static void rtl8365mb_phylink_get_caps(struct dsa_switch *ds, int port,
 	 * which remain unimplemented.
 	 */
 
-	if (extint->supported_interfaces & RTL8365MB_PHY_INTERFACE_MODE_RGMII)
-		phy_interface_set_rgmii(config->supported_interfaces);
+	if (extint->supported_interfaces & RTL8365MB_PHY_INTERFACE_MODE_RGMII) {
+		/* On family D the EXT1 pins are shared with MAC4 (UTP port 4).
+		 * If MAC4 owns them, RGMII on this port cannot work.
+		 */
+		if (rtl8365mb_is_d(priv) && extint->id == 1) {
+			ret = regmap_read(priv->map, RTL8365MB_D_REG_TOP_CON0, &data);
+			if (ret)
+				dev_err(priv->dev,
+					"failed to read TOP_CON0, RGMII on port %d disabled: %pe\n",
+					port, ERR_PTR(ret));
+			else if (data & RTL8365MB_D_MAC4_SEL_EXT1_MASK)
+				dev_err(priv->dev,
+					"port %d: EXT1 is owned by MAC4, RGMII cannot be used\n",
+					port);
+			else
+				phy_interface_set_rgmii(config->supported_interfaces);
+		} else {
+			phy_interface_set_rgmii(config->supported_interfaces);
+		}
+	}
 
 	if (extint->supported_interfaces & RTL8365MB_PHY_INTERFACE_MODE_SGMII &&
 	    mb->sds_supported)
-- 
2.53.0

