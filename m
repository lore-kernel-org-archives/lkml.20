Received: from sonic307-9.consmr.mail.ne1.yahoo.com (sonic307-9.consmr.mail.ne1.yahoo.com [66.163.190.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D40793328FD
	for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 19:51:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=66.163.190.32
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791661871; cv=none; b=kE+eYOvoeklCJrFmpIcaH3s+plfzu/vC9Guum1vJgYvW68/xDMooXTAu/oQvquKdCUfPNX+R38Mhwf5Jcqm7qHdZupLkIZ1Bkf3gz9cjcP6+fqRAOJ3+Zdln+19+xSczUpVx/9KOhxIYybk+0ziQ4qcyNV4E/HRP3AEq5gTAor4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791661871; c=relaxed/simple;
	bh=4is5Ve7tOSMT15/yh+C2OSoels3Gn6qO/pKrfJZlqhA=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:References:
	 In-Reply-To:Content-Type; b=OZ++E4Y2rpmMqGFh+oaKPoLZJ92nvwXoR4Gc8NpIQUCXzkU6w3zR1zqeYQQgmg4fbjzeBfftWHK8us1wab5ObL97rBo7Pzzg66fFm9fmsNT2GHUamI3rXzbrp31zKKaKGdkShXxxJHgZdqsnb98zvxJ+/6OUVzFsn/cnaaeu5rw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.com; spf=pass smtp.mailfrom=yahoo.com; dkim=pass (2048-bit key) header.d=yahoo.com header.i=@yahoo.com header.b=PWJUMrSF; arc=none smtp.client-ip=66.163.190.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yahoo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=yahoo.com header.i=@yahoo.com header.b="PWJUMrSF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1791661863; bh=ulEjKq7CzK7yoNLvVbImGxxWIDzr79V25ZVIMHJtM4w=; h=Date:Subject:From:To:References:In-Reply-To:From:Subject:Reply-To; b=PWJUMrSFv5RyEUu+GLwICgY47fkqgMCri28sIDLX7qbJrhxZo7+xy6O0Gn6r13jtc6DXTY3P43l/OZNEFSy6Djxp5bR6r1d5oVrvGw4gVT+i33RVJHukBMe8f8hD909Iy3cSTD9t0dY18uXM1+bov9kL3l1ndekkVqhP3AdoTfn8sxOhE/swr9voSRBBSPfIguW/2hNVsp1P+EgmDOl/9wrs3ovWv3rMxNTFzoDadSwrxBletPr2hJwzA9yr3f9aOYMRGhk2OZoWaVm5fDx5Wa/rt9FZMBmQqCSdPPRtUvUgbAlNqKFo9/S3LhO85Z/fvH4YNS9sruDAtVqXQ2kG2Q==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1791661863; bh=TR/Mvo4ncTQ0vza5wxd4dLA/JrLgvok7WDlwBrSwqWX=; h=X-Sonic-MF:Date:Subject:From:To:From:Subject; b=E002FiNQ5fDfkVKueAsCX0FahdXr0zOjEvtIHCfMrQi9VkY6cjDfOztFIZx6l8bCZe1eaGNiXdR+R/ueZWzviGOTP0mGbfIjAYRnWjeHUcJcQgG50rirbDhHDfTqki1sTtmNG3Vi/qv7+SCH7yQ/qkBfEXLwlFbVUvV/GmhQ0AxwvD365l+u7LMP+2iB/ZaTsaw09MquyTpnNVuUgWk/k3TsPnRNOxBC6+BE1yj99nGdg21BOlGyl8c2dZlcaBQwnAR8ULgQPgyjqZRP1HvXZTZKeM2YQevWN5M3UUgg0dlG0nDXZ+BUZWfRCsWNh1bZi0Jx6y/o5ZZb/s/FkLgkXg==
X-YMail-OSG: 11JVnWcVM1mf8.ku3woZ2u8CimgqsMGAnSnNpWc88F.J6KDB4Qe587celqkUUlZ
 gGAyNYx3P0m9sQKnx1mEFqSzmSAxk7fIpT7hNRodZLCFMgS7FPzAk6w7ykYllG9fIn33e4iHkV1o
 4KtdUg.i90jsbzMxMXLxZOd4y1kdyZ0Aa1buJWAQElTl0tocRLTnrrMcl3ajnA4Hm4LpErDCW5hN
 6D9BYYrMvmyetj8S78fIFxt5_MSQ7ykZ3IJGoUegYnjab._0zmGbIxYzBPXuMTEC5TsnXjYvISXe
 xyf25F3yxDn2gcd1FmH9lfUcHZytMWix.Nq3X3n4xZ.xDPTc0MEYgvMAfL_wNx7ovipLmMX8FYbd
 mg.gPn1qbHk6jWP84Ido7iDxrdaoGY4vspY.4mBmzgtP26yWIhve.lBr31YjrV.56YtCzl9f6ttD
 wcGKMENscvAmwcV5OcwEnCmUGJLWwkH.215K0YUdg1fY6NK_34LDVUNOh1g6kuJljJa6_Pd.F4tY
 mrihBwIrhak4HVXiKyTK_H0WyCY0tSfK5Jxb4EI0ZxL.JaBbCsuP4fE4cUGZSktGfytSRjFIYgVi
 .p_BzYQmuo.72aFCzxgvuPzhMTXBpSSuAlPodbntYa8CS8pYQ7K3mwL0.1jOFKcLPwZUsYz26CD4
 GCN.Z3ChIpA3A5BAcl.zB6XGk6cPfcax2y4VEfS6wafMBVWGYyunVZXw8QlMSjIpaOIV40c.wc3V
 3TD9YaDG2M9SL7O92ecGgArse2Vrs6sCD7jELJ3T154n.Sd2EJ4GuXhUwAbntaCdcbn.3Aylco19
 qoXj8M4Yl0zgQ.Rd9hw1S_Z1hcgS9V63x20UUc_TXSm8JbGeNMy4ZQKw6tEf2nwNWt8oCv94LpG4
 HfDldGjCr4Cgfb.ZnJy3sqXo8vFSR_oFIQb9Ogl67XJEjoVwqJIq40AoxtEl6dAhh_44e9DNSL7I
 1__bVHw8gsM_dfxnjuw8fe6UjtTTAa3_8MmXs8bGWS.llLlmA90ev.9KMoqPzovaxnIDmrvJQ0y6
 Ivkt5juPmhdGiPi3dbWo9FQyacYkrljq_saFD7eVf5yNxTSC4iqfWa85xbMzAX8TLHhfI4._WXKa
 UkupHdhYlQAp4I60JQIK1p0grtmnt1zgr.bmCUdC3KA1argBFWa3skcvmb4IZNKL1wVUQQ9D3sfr
 DvsszWN_cmVYRf3GeOPFNCSNM3Yd_tjZjRrriK6djGJy909IAEsVEixftMILExdy6zJK6TJZ5vzr
 V1IG7AGuqPtYyUp9yofFq1nNB6g5nTFNhRuh6K1SbCNmShZmNeK39foG100gCSln89AOQBlb.Vjw
 Spi7_KLBpvr1u6Z7RxuPUXB1HBelRd1An9aKQzEWdR4Bs3AvLhp6tWXxAmt8NfvmCZoIarqATIQe
 VbFZqN8uiQOUiNrJYZhb_4cAbxBMaxAtwCa3TXmS50yJ35JFHIqL0mwrvjcx6u63QxlMSNMk6Efv
 .zR_6yH1L9BgkhBicwcMuWx8LPmrdbZrB7UOfJJeZRY8X3EznXZ0sGtposro5f5TdyUFZrNBYmTq
 PdQhn_vhAHTf1uEDJWEFQayPkuZAL3ZclqX8WVPB0FEWdNn0I49E_u5J1ESMoXTrP9xUI2MNS9dA
 waE0s8n0TTyUmd_HrLLkWwSW_X..wFexDZqXx3CYHynn1sw30C.OXF_VJaVuAA1.7UGTeCbiN.0I
 02R9kihDtYd_IHZjExXyJpWAwA_oKN9sYQdNEUmttX8aTlMRLzSqd58E9I1LoOtvQwUDoH9lazn_
 xqmv_XsZRBT6RArqTw0I2514qzuHZeTmfkzXSevnOTXaOPGvFpgUHTceDD1Fied0E5bGOzyhyOJc
 cktZ7Sh4a35kjrTE70YEoitxO4RkZ4ONmZNlnuaFdD3kzWIzT5KDFQxenOrnzdSnCU6XvcL2FVvE
 RqBEhxQAF1.jdCymdHNRfox9kc903KRvELlNgyD14apkmHWFqrr_LoVveIIopC1tvAA7z8dp2k_2
 izuXT5Atk4qPl.P1lY.JOhvS4M7Sv5cp8Olj5ajCKlPLnu_9g2RBvlqCfgxx24wPWP6atnI.4bvK
 XUZX6Tzx3f0c.smBOEw41hy6lTo8DzgiwQDjJASCljDkn3AEenZLcqpB7Fbr5erFpgtHH2geuv.S
 JZf6xRioUyJVHizBYe.fDP2iBIF1L2AD8iIxtCH3itlW2x5fXkkXrhIgUzU4G0gD.nsV8KSW2sMU
 OKTPdMeIV_WMS1g6S9Au2anJfB9dvPFCF61P_2FpyPFTTsQwwyXSWLVYcLW6C2yLn9MQ8aHYcoM9
 qmeXqEOvCZMdQJW5rGw2g2cna.BiqNBi_qZ7MLQ--
X-Sonic-MF: <namiltd@yahoo.com>
X-Sonic-ID: cc370df5-6336-4c24-89e6-ab1b50b425ea
Received: from sonic.gate.mail.ne1.yahoo.com by sonic307.consmr.mail.ne1.yahoo.com with HTTP; Sat, 10 Oct 2026 19:51:03 +0000
Received: by hermes--production-ir2-5dd9bf4598-c45bs (Yahoo Inc. Hermes SMTP Server) with ESMTPA ID 720aa7e155ad1e7cc0489d0905145b20;
          Sat, 10 Oct 2026 19:40:44 +0000 (UTC)
Message-ID: <2b619d04-a3d3-4905-8232-f69be8546fab@yahoo.com>
Date: Sat, 10 Oct 2026 21:40:42 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH net-next v3 4/9] net: dsa: realtek: rtl8365mb: set RGMII mode
 for family D
From: Mieczyslaw Nalewaj <namiltd@yahoo.com>
To: linusw@kernel.org, andrew@lunn.ch, olteanv@gmail.com, kuba@kernel.org,
 davem@davemloft.net, edumazet@google.com, pabeni@redhat.com,
 linux@armlinux.org.uk, luizluca@gmail.com, maxime.chevallier@bootlin.com,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org
References: <e84d76ee-03df-49b0-8c9a-b289dfae8728@yahoo.com>
Content-Language: pl
In-Reply-To: <e84d76ee-03df-49b0-8c9a-b289dfae8728@yahoo.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Mailer: WebService/1.1.26668 mail.backend.jedi.jws.acl:role.jedi.acl.token.atz.jws.hermes.yahoo

On family D, RGMII on extension interface 1 needs two things that the
other families do not: the EXT1 RGMII TX clock delay field in
EXT_TXC_DLY (0x13f9, bits [5:3]) must be cleared, and the pin mux in
the top-level configuration register must be set up.

The vendor RGMII setup for EXT1 clears the RGMII field of EXT_TXC_DLY
(0x13f9, bits [5:3]) in addition to programming TXDELAY in RGMXF.
Do the same. The init jam table writes 0x0090 to this register, which
leaves the field at 2, so without the clear an extra TX delay would be
applied on top of tx-internal-delay-ps. Clearing it makes
tx-internal-delay-ps the only source of TX delay.

If the internal MAC4 block is not occupying extension 1, bind the
RGMII/MII pins to MAC7. SerDes 1, which shares the pins, is always
disabled.

Signed-off-by: Mieczyslaw Nalewaj <namiltd@yahoo.com>
---
 drivers/net/dsa/realtek/rtl8365mb_main.c | 50 ++++++++++++++++++++++++
 1 file changed, 50 insertions(+)

diff --git a/drivers/net/dsa/realtek/rtl8365mb_main.c b/drivers/net/dsa/realtek/rtl8365mb_main.c
index 8f3295c..c15b88b 100644
--- a/drivers/net/dsa/realtek/rtl8365mb_main.c
+++ b/drivers/net/dsa/realtek/rtl8365mb_main.c
@@ -332,6 +332,12 @@
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
@@ -458,6 +464,20 @@
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
@@ -1194,6 +1214,7 @@ static int rtl8365mb_ext_config_rgmii(struct realtek_priv *priv, int port,
 	struct dsa_port *dp;
 	int tx_delay = 0;
 	int rx_delay = 0;
+	u32 data;
 	u32 val;
 	int ret;
 
@@ -1263,6 +1284,35 @@ static int rtl8365mb_ext_config_rgmii(struct realtek_priv *priv, int port,
 	if (ret)
 		return ret;
 
+	if (rtl8365mb_get_family(priv) == RTL8365MB_FAMILY_D &&
+	    extint->id == 1) {
+		ret = regmap_update_bits(priv->map,
+					 RTL8365MB_D_REG_EXT_TXC_DLY,
+					 RTL8365MB_D_EXT1_RGMII_TX_DLY_MASK, 0);
+		if (ret)
+			return ret;
+		/* Configure RGMII/MII mux to port 7 if UTP_PORT4 is not in
+		 * RGMII mode
+		 */
+		ret = regmap_read(priv->map, RTL8365MB_D_REG_TOP_CON0, &data);
+		if (ret)
+			return ret;
+		if ((data & RTL8365MB_D_MAC4_SEL_EXT1_MASK) == 0) {
+			ret = regmap_update_bits(priv->map,
+						 RTL8365MB_D_REG_TOP_CON0,
+						 RTL8365MB_D_MAC7_SEL_EXT1_MASK,
+						 RTL8365MB_D_MAC7_SEL_EXT1_MASK);
+			if (ret)
+				return ret;
+		}
+		ret = regmap_update_bits(priv->map,
+					 RTL8365MB_D_REG_SDS1_MISC0,
+					 RTL8365MB_D_SDS_MISC_MODE_FIELD_MASK,
+					 RTL8365MB_D_PORT_SDS_MODE_DISABLE);
+		if (ret)
+			return ret;
+	}
+
 	return 0;
 }
 
-- 
2.53.0

