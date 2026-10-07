Received: from sonic317-32.consmr.mail.ne1.yahoo.com (sonic317-32.consmr.mail.ne1.yahoo.com [66.163.184.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 852993932F9
	for <linux-kernel@vger.kernel.org>; Wed,  7 Oct 2026 20:51:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=66.163.184.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791406269; cv=none; b=FE7Rta4Yr6PfYhLl7IikmN3lTHHUwBxOJP4Kmaqw20z8zr1fA3c0qPmhDcttjdZv1QP8IW3elSot15NJIWH9mOfmomOm76vth9D9wHKgSEGfmRStPpUXcaYAi8n0YrAY0EUAN2oS1hEUSR5I4/O1+Hyi1HGDbsL7TxIJr8nSBxE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791406269; c=relaxed/simple;
	bh=6T96oYT7zGa2dhkVb+D4GJAntXs3vXLAL0gIr2plLeg=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:References:
	 In-Reply-To:Content-Type; b=DixtirWhqmu0SYH73Y1Qzvr0/DNaajSc9Mvdgm4VwIRemt4GHBNQPs+J+leF7ARptuqNy/GyOzQaQWUWSGBYB0v3k9cCmqEMwdBXmygtk6428A2z2/uiUV1AwbxSRG/pXCriAyItX/sGY4ludJKumKHooC5eIusE0+k5uvcoeeU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.com; spf=pass smtp.mailfrom=yahoo.com; dkim=pass (2048-bit key) header.d=yahoo.com header.i=@yahoo.com header.b=JTpt3YZ3; arc=none smtp.client-ip=66.163.184.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yahoo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=yahoo.com header.i=@yahoo.com header.b="JTpt3YZ3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1791406267; bh=qFpiFw6MgSdv37Ns6VH+LneeKQYBHkufBN/Uv0eIRlc=; h=Date:Subject:From:To:References:In-Reply-To:From:Subject:Reply-To; b=JTpt3YZ3jTnzcnp42YptdOOJNfuyAXpUHQV0vvctM0K1fMryD+b2MuzXf2CWUedlzZoF6uZ6ShAAT956xtL7ZzPXNAHf17RkSmqD0sbIddyNMEyxVlxXSz7vyVwLJq7zhoA4dNZsVpA4VQuMVdNwrqwNvH/mhWNpGshTQFVe4l1+94CPG1iOYW4RQf9KLpp7Q/H5BOWG/HIGIDQwieLNicFAgWK9HTt6R+CE6rtV1k8OrHiabsZPc1UHKtC9HlHRon33U2JnYmynEbaFcuU+0QzvGCRhYL9Fl2vzfbrHx3LZyhlc/iApKhn0ras6Zpg0yw69HP9goj2xchpFtFFC2w==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1791406267; bh=bkYEfLNNTb/xFpXM5w9oNdHEZkxFQyzDaWmIURBWluH=; h=X-Sonic-MF:Date:Subject:From:To:From:Subject; b=hT8nUTuFD72TlZDmw47jxqmKbRiYRpa3ShPooD8xEWJEbKPiBa7qH5c+o2Yvl+vhLL8daGnMp+zz+CAFbq6OU75flViM4RxkoPfmLr8eCgawQDew6VditHLZ8aKcpWTRwv3YeId5LeS0j6dyoSJkAhFmB5gFET+hOLHMI13aBBQGfHyaVKKpNYxqM6A9ubSRZBN5LToPNUceTRix5avSifOTVtkUNn+RhCAHOthSfqc90LCV4TI9L0ovJy77vayzq8NPwk9oPWVLpXlumkBB4hH7gprwvPk3LUkjdJTKBWngT+Sha3hxKfyI+P5nwWUqzePP4+7bSg/7Qau7UHcjRg==
X-YMail-OSG: ZeBSfIwVM1m6q1jaSQipZxQe9R7tVsnEL13sQk6zJ6QwZxqAqHjtu_efXi9sCHM
 _fYEYcbnqf2H9aCRiASMF4ewOwnlk6RXEwYqoUJ7AIZvOkRxTXx3F8uSiP4diWyzhI_g5DzdBBlP
 nXFjIyIz9y25YDIT0gSr3WHJLpl88SjYfbauaClYcLEn2ea..oxQTddhB._YCZ0v4NrbAfC53fr9
 XUTR2RH0CKNlH9wJPjeLULe_vgxBufzsg3FlzIJaSncjR33MwWk8aToJ47hM0zEgQOMHqz90Z.QQ
 EFaC.KFT.stQdo6P4Nc229_.wYWjzhMK8Wo5KzNR70nYXq1eO5b1EEDcB_2GruynlXT_VIdoGjY0
 c6u_DGstqmIMd1SKv8AqoEZQNzOe0e3Kn40odHMECTlu2UXiETA4U3gbxBCXs2GL_9zeHdE3O4rZ
 oeVt02lYTF9ZtRfx0PHqWzslrkybynUt2rbCAxCo8BDYbCNuyObPU6Ue.dvCQ0kIbGSbafhvscr1
 lqEAbwmUGU2YukgiEUqOsvdeVcJ2o7GaHLUEPJELbvef_2VTyvg5av1.fQr89L3YQHe.AfMgS5YS
 TP22WOHlQZAd3aJ1LZFJplw37fMSzBU8efz99onwXq4H68pLeMQFst4uxoKaWxCtyPf4ZCTDSfBk
 KsSnSWDFfDizpMn.LZsI81xYXO_pQIaBdCrRcoBVYTFVibb95WNlne_MnRWjuzi7bdNHPJlm40ez
 Ht1rujqGVW3dXYNYZe.pICDChn75uhhz2GTYujed4JhT_DaGiokSW.WmGC9C53jxiy7i12ikxI7s
 iTtfKbwFFbXnMre8_iXe.kUk3qLZ2Gr19EeSY4eFSzfBN6W.HIGO8fZA0RahKObkBPmR3pCe_T01
 guxQChpJENhR5j4lxHDTpDTmuqTuwakCABdGjCr8csMxzdpRIJsgQYLu7FgMgQzwm3ZJ_KoDRfNG
 NZ_NDWqBvcLeEgZP6XZObbuisD8mDss28ow583DkowmDekCNfMf3a4GPDNoJGtYPi.h9RE5ZgliT
 8fOANnrnAB7QjUKnz6mtbPEoCzZpUS23PeJmOKTqHOg9.XPIFJmJioe462qS9zyNMB3LoxE7Hrab
 .WvD6uhB2CFoUHI5L1.7Wsg_Y6Sn0BkfkceUv2tbX_jH4KzlW2GXz2pr9dOh7pK5cW6g9FzIqxi3
 OOn.DdYVb7v.5Dqq2tOa1yeDfEPpLwbRSiQQz.59df4WUE6zzuP1cmY8M2sMa39ZfG7FQoRYOuNJ
 RQxJO9zq8zlnmAM1iE7AJofJucDQ8xRXBovPotX.A7kdKsc5agpEDIjlCitxy7bQT0qaqSUhsfh.
 5eDHvnp0JrubMc3IKR61dVpwc.GvZ633tUydlfzVyWH8V1jinxPLCgr01R2AiMJ0eW3AZ8.P3kLP
 igjFdgxgSpChaE0Z.fVLpKZi5VEug1EPbm21ZwAypM.VwIppBYe_sOryan6.eMMqPSxk23YrWEd5
 dTahdmLV0crKQqZ94U1klV6uSBR7BCKuTUGzM_t44P21jqDS_3m4jUtDUwXNNc57Ht8b0DFFloIU
 VR7iSr9TgLRPM0H4OL77etQeyn1mbjckI1l1nLEYYF7h7dvYNE9kGyDfCq3Cja0C.9FH.OiUGV.Q
 oEpzxzn9S385QOAPaQGRIgqYmQRBqpOh0_8I8h1rs1n3wN4hRGaI69IULAA.qE4ZCjuV9SsXu9.A
 .HuyDu2CzWAP1uBKkngH1JSgr_seHcBX6FQP1vKsKOIZRzW0or93QdSKZNm74yTxS8WvT87slflc
 KAL7NBO.W42ZWbaGH.Log3IJ.pumDqV60ASvohPPuCstTkAKh6CLCLRuckIeIIbZPrkyA0Fa2B5N
 Ek7D5QcTC53JqUkO0HZYHt4CWvhIY1nn6B3Ipor2a8SVMIHzAOFKnCDYhaE.DwE.xEf_DBaaYK3H
 JnIsX1j.vVPQqXnCyy9XCZ.Vc2uWuEzf1.CFCMptPgJMPGASjsI4f4OPrjmU22XIF4XhjRpjDNXv
 ddAImD6jMr07oczUMABgV0pZj0IXwBG_S.UunwZTy.RterJWD3ErYFwzk6G3gySBFZHL0gAcsifT
 Atl6fvTf41AqKtQwGaiTpwXJ3kC61KgvJQB1vwNDqzAUpfz0Q2nlf_CTXnaVmO7TVXQSPnJ8ZDFO
 3kZ10jaVVMTeZs8ZRuk9LKfX1WHu85vyKxDHq8cG.Ae2eAJf5jtEgjNdjM.BhOysrsAFIJ9wjRD2
 qou7BfEwUx_8mKUKwgosBdNXW0zxwtZL0ObloSUmhdWEDDNz35fp5TFqNQFLqNHodkhqyZl1LWCv
 xE3Pgy4Td4JNhsXRmrTB7Af9eHhbCf.Lwlx9S4xUn
X-Sonic-MF: <namiltd@yahoo.com>
X-Sonic-ID: 597bde85-3dae-4343-b9f7-04d1d50be182
Received: from sonic.gate.mail.ne1.yahoo.com by sonic317.consmr.mail.ne1.yahoo.com with HTTP; Wed, 7 Oct 2026 20:51:07 +0000
Received: by hermes--production-ir2-5dd9bf4598-c2rmk (Yahoo Inc. Hermes SMTP Server) with ESMTPA ID f787a731988db98a092d4ac9acd4d1ec;
          Wed, 07 Oct 2026 20:40:51 +0000 (UTC)
Message-ID: <7d9de37c-841f-4dee-9a60-f22d6e2846bf@yahoo.com>
Date: Wed, 7 Oct 2026 22:40:48 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH net-next 6/8] net: dsa: realtek: rtl8365mb: set/clear pvid for
 family D
From: Mieczyslaw Nalewaj <namiltd@yahoo.com>
To: linusw@kernel.org, alsi@bang-olufsen.dk, andrew@lunn.ch,
 olteanv@gmail.com, kuba@kernel.org, davem@davemloft.net,
 edumazet@google.com, pabeni@redhat.com, linux@armlinux.org.uk,
 luizluca@gmail.com, maxime.chevallier@bootlin.com, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <84fc7483-b22d-45ea-a3b8-3285dc357265@yahoo.com>
Content-Language: pl
In-Reply-To: <84fc7483-b22d-45ea-a3b8-3285dc357265@yahoo.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Mailer: WebService/1.1.26668 mail.backend.jedi.jws.acl:role.jedi.acl.token.atz.jws.hermes.yahoo

The RTL8367S-VB (family D) has no working VLAN member-config (MC)
table in hardware. rtl8365mb_vlan_port_get_pvid() was already fixed
to read PVID directly from its dedicated per-port register, but
rtl8365mb_vlan_pvid_port_set() and rtl8365mb_vlan_pvid_port_clear()
still went through the MC-index allocation path meant for family C,
which on family D hardware writes into the wrong register/field
(colliding with the neighbouring port's real PVID register) and reads
back a VLAN MC table that does not exist on this silicon.

Add a direct-VID fast path for both functions, mirroring what was
already done for the getter, and skip the MC table entirely for
family D.

Signed-off-by: Mieczyslaw Nalewaj <namiltd@yahoo.com>
---
 drivers/net/dsa/realtek/rtl8365mb_vlan.c | 136 +++++++++++++++++++++++
 1 file changed, 136 insertions(+)

diff --git a/drivers/net/dsa/realtek/rtl8365mb_vlan.c b/drivers/net/dsa/realtek/rtl8365mb_vlan.c
index 0466e8c..da517b1 100644
--- a/drivers/net/dsa/realtek/rtl8365mb_vlan.c
+++ b/drivers/net/dsa/realtek/rtl8365mb_vlan.c
@@ -810,6 +810,64 @@ rtl8365mb_vlan_port_set_framefilter(struct realtek_priv *priv,
 				  val);
 }
 
+/*
+ * rtl8365mb_vlan_pvid_port_set_direct() - Configure a port's PVID as a raw
+ * VID written to its dedicated register, for chip families without a
+ * working VLAN MC table (RTL8365MB_FAMILY_D)
+ *
+ * Reads back the previous PVID and frame filter first so both can be
+ * restored if enabling the new PVID fails partway through, matching
+ * the rollback behavior of the family-C implementation above.
+ *
+ * Context: Can sleep. Must be called with &priv->vlan_lock held.
+ * Return: 0 on success, or a negative error code on failure.
+ */
+static int rtl8365mb_vlan_pvid_port_set_direct(struct realtek_priv *priv,
+					       int port, u16 vid)
+{
+	enum rtl8365mb_frame_ingress prev_accepted_frame;
+	u32 prev_pvid;
+	int ret;
+
+	ret = regmap_read(priv->map, RTL8365MB_D_VLAN_PVID_CTRL_REG(port),
+			  &prev_pvid);
+	if (ret) {
+		dev_err(priv->dev, "Failed to read current PVID\n");
+		return ret;
+	}
+	prev_pvid &= RTL8365MB_D_VLAN_PVID_CTRL_MASK;
+
+	ret = rtl8365mb_vlan_port_get_framefilter(priv, port, &prev_accepted_frame);
+	if (ret) {
+		dev_err(priv->dev, "Failed to get current framefilter\n");
+		return ret;
+	}
+
+	ret = regmap_update_bits(priv->map, RTL8365MB_D_VLAN_PVID_CTRL_REG(port),
+				 RTL8365MB_D_VLAN_PVID_CTRL_MASK,
+				 vid & RTL8365MB_D_VLAN_PVID_CTRL_MASK);
+	if (ret) {
+		dev_err(priv->dev, "Failed to set port PVID\n");
+		return ret;
+	}
+
+	/* Changing accept frame is what enables PVID (if not enabled before) */
+	ret = rtl8365mb_vlan_port_set_framefilter(priv, port,
+						  RTL8365MB_FRAME_TYPE_ANY_FRAME);
+	if (ret) {
+		dev_err(priv->dev, "Failed to set port frame filter\n");
+		goto undo_pvid_write;
+	}
+
+	return 0;
+
+undo_pvid_write:
+	(void)regmap_update_bits(priv->map, RTL8365MB_D_VLAN_PVID_CTRL_REG(port),
+				 RTL8365MB_D_VLAN_PVID_CTRL_MASK, prev_pvid);
+	(void)rtl8365mb_vlan_port_set_framefilter(priv, port, prev_accepted_frame);
+	return ret;
+}
+
 /*
  * rtl8365mb_vlan_pvid_port_set() - Configure a port's PVID and associated
  * VLANMC entry
@@ -839,6 +897,13 @@ int rtl8365mb_vlan_pvid_port_set(struct dsa_switch *ds, int port, u16 vid,
 
 	lockdep_assert_held(&priv->vlan_lock);
 
+	/* This chip family has no VLAN MC table - PVID is a raw VID in a
+	 * dedicated per-port register, and there is no separate membership
+	 * table entry to allocate/track.
+	 */
+	if (rtl8365mb_get_family(priv) == RTL8365MB_FAMILY_D)
+		return rtl8365mb_vlan_pvid_port_set_direct(priv, port, vid);
+
 	/* Read the old PVID exclusively to undo in case of error */
 	ret = rtl8365mb_vlan_get_pvid_mc(priv, port, &prev_vlanmc_idx,
 					 &prev_vlanmc);
@@ -918,6 +983,74 @@ undo_vlan_mc_port_set:
 	return ret;
 }
 
+/*
+ * rtl8365mb_vlan_pvid_port_clear_direct() - Remove a port's raw-VID PVID
+ * configuration, for chip families without a working VLAN MC table
+ * (RTL8365MB_FAMILY_D)
+ *
+ * Reads back the previous frame filter first so it can be restored if
+ * clearing the PVID register fails.
+ *
+ * Context: Can sleep. Must be called with &priv->vlan_lock held.
+ * Return: 0 on success, or a negative error code on failure.
+ */
+static int rtl8365mb_vlan_pvid_port_clear_direct(struct dsa_switch *ds,
+						 int port, u16 vid)
+{
+	enum rtl8365mb_frame_ingress prev_accepted_frame;
+	struct realtek_priv *priv = ds->priv;
+	bool filtering;
+	u32 cur_pvid;
+	int ret;
+
+	ret = regmap_read(priv->map, RTL8365MB_D_VLAN_PVID_CTRL_REG(port),
+			  &cur_pvid);
+	if (ret) {
+		dev_err(priv->dev, "Failed to read current PVID\n");
+		return ret;
+	}
+
+	/* Port is not using this VID as PVID. Nothing to remove. */
+	if ((cur_pvid & RTL8365MB_D_VLAN_PVID_CTRL_MASK) != vid)
+		return 0;
+
+	filtering = dsa_port_is_vlan_filtering(dsa_to_port(ds, port));
+
+	/* Changing accept frame is what really removes PVID. But only do
+	 * that if VLAN filtering is enabled.
+	 */
+	if (filtering) {
+		ret = rtl8365mb_vlan_port_get_framefilter(priv, port,
+							  &prev_accepted_frame);
+		if (ret) {
+			dev_err(priv->dev, "Failed to get current framefilter\n");
+			return ret;
+		}
+
+		ret = rtl8365mb_vlan_port_set_framefilter(
+			priv, port, RTL8365MB_FRAME_TYPE_TAGGED_ONLY);
+		if (ret) {
+			dev_err(priv->dev, "Failed to set port frame filter\n");
+			return ret;
+		}
+	}
+
+	ret = regmap_update_bits(priv->map, RTL8365MB_D_VLAN_PVID_CTRL_REG(port),
+				 RTL8365MB_D_VLAN_PVID_CTRL_MASK, 0);
+	if (ret) {
+		dev_err(priv->dev, "Failed to set port PVID to 0\n");
+		goto undo_set_framefilter;
+	}
+
+	return 0;
+
+undo_set_framefilter:
+	if (filtering)
+		(void)rtl8365mb_vlan_port_set_framefilter(priv, port,
+							  prev_accepted_frame);
+	return ret;
+}
+
 /*
  * rtl8365mb_vlan_pvid_port_clear() - Remove a port's PVID configuration
  * @ds: dsa switch instance
@@ -941,6 +1074,9 @@ int rtl8365mb_vlan_pvid_port_clear(struct dsa_switch *ds, int port, u16 vid)
 
 	lockdep_assert_held(&priv->vlan_lock);
 
+	if (rtl8365mb_get_family(priv) == RTL8365MB_FAMILY_D)
+		return rtl8365mb_vlan_pvid_port_clear_direct(ds, port, vid);
+
 	ret = rtl8365mb_vlan_get_pvid_mc(priv, port, &vlanmc_idx,
 					 &vlanmc);
 	if (ret) {
-- 
2.53.0

