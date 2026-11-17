Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=66.163.186.146
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794901239;
	b=VMDgUaNrybaVBtfY83wpZABzDESWkHqPVupqWUCXTPnBZFVbZSx4IVDBzU5W7TEE5Gs4
	 V7iPaZIzpdc0m5DOhohdERael333NlXVcFg0nUGuCQRO0Ggf+AKbr5UkN49iNnBfdcO6g
	 6IelhBnU/PSbA6TAPuW6T9MIm1f1480BYkeDmPo+IeO99Pzw157F+2EecbSuQ4X6IrYP6
	 6dN/OW9yvqpSErCZf9uPNFtBLu0hanKnfnCVt/FmF7BbEFa3ZZew1gM88xJcRnt9vut5M
	 bQ57rP8C0/EJCT2y9wWi6Ou+Wz2ASUYxK0OF03kjo09+vus4WJV1pThqQ5AA3GuXYyQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794901239;
	h=DMARC-Filter:DKIM-Signature:X-SONIC-DKIM-SIGN:X-YMail-OSG:X-Sonic-MF:
	 X-Sonic-ID:Received:Received:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:From:To:References:Content-Language:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Mailer;
	bh=7QTZZxJ6oBMJjqpQPRp+Py0w2EH0x9xs7/5Y92TjoqE=;
	b=vrL8mh5+UojKcUxZqVuXigmqgbBAme+4M7VIB8Cu4Sjl7wr+Xr2/5rMUYtNVabER1DJY
	 oljKiZ5EViGX5k/owYlNPiCLXs9BECtsZPzyBzb8O1KqZQ/PWXVaW940Diab5E6Wz/cmT
	 RSaP2TFl+Z52FqZx9ufq0OnF9h/M2AvpsJwIpr3GPV63p+vfELmBlgMC8FoAhmnsYCSFj
	 U59o780wOyPaG6DiSQcD0tx69SJDLjgd8dzF//mw0TuslxHAg6eFAnITu3quAMozPzDPn
	 Etkyg4b7ijofuTJ+KTP0PzTt2R1sAtut4q7oABN28E9qIYMM5FcqDbOcGdjshjRvgiQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=yahoo.com;
	spf=pass smtp.mailfrom=yahoo.com;
	dkim=pass header.d=yahoo.com header.i=@yahoo.com header.a=rsa-sha256 header.s=s2048 header.b="K/5yJ8D1";
	arc=none smtp.remote-ip=66.163.186.146
Received: from sonic302-20.consmr.mail.ne1.yahoo.com (sonic302-20.consmr.mail.ne1.yahoo.com [66.163.186.146])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E024606A32A
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 07:40:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4E024606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yahoo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=yahoo.com header.i=@yahoo.com header.a=rsa-sha256 header.s=s2048 header.b=K/5yJ8D1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1794901238; bh=7QTZZxJ6oBMJjqpQPRp+Py0w2EH0x9xs7/5Y92TjoqE=; h=Date:Subject:From:To:References:In-Reply-To:Content-Type:From:Subject:Reply-To:Content-Type; b=K/5yJ8D1TA7Lu0djclkFU9OfXkLd4soLhW7PbizmpWKMwO1Ues+DgSi5h09jlgoozYmFNXnns65gMaVvs4O3mnss/JLZ+MoMAMzWWonlX12aRc0KSlKhP2C/bQuUNCJbeuh+Nv245JnKjNR0U8x3xtoo7943h1ZUY+gcAGooirMToh7epnxxZ5lgzWANvIiiTG/btNiTsRnOopdBCBg97Sgkw7oogSPk8KHebRDx3ZRgT8rBXTYRVEhMx2Ckcyo3pkz2sw8gnwuhAyj++ulSfow7mRPrkfnRTuZApsifPgt0HAEY6YUkUSID465cY7/53zwZHpUT/ack1rd2dG9LNw==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1794901238; bh=jcPHSMUBEz2QoRD6tFMOSyHC6CpG6HAUXqmAIke2P3G=; h=X-Sonic-MF:Date:Subject:From:To:From:Subject; b=g0qj4CqXftJb1525k70sbhR3sBL8r0i21EqeLZBKtSpcJ76ef8uEwXii8gT8ICcqu2eJ0fL5H4HG2tA1ToMVochuZEgpNxJOJ79IOgRy7dPjsishV+Ft3oKLfB+eD8kId5Nx50KJWLbVURDRtgBOwXdvkVr8DEvyNE7uR6KpULnRUC7bT7yb3px2vERPVTftVtdo+i3Gld0eUm/ATYCK/SRkseAooHSVX7aPfPPQuuR/CGTJmRVwRBh4w/0BxbgjoLGgIVltVQiDI0wtns+6mHsgU4fL0epuGuBsjk4io12W/OqUXb3fdAjre5XELzLSyEVnUIgqEly9duc8bE54RQ==
X-YMail-OSG: pa9EuVMVM1lNIm9aM8Ncx9eTEFAdWJIyWB.LprcmIKEldvcERW6K84OyG_BIUxO
 BZjmH8c19IP0iRZy.ytJXo8bylUIaDnHptOKvMefhbAihky4q.l2fGaFBH2A04If45yWPgGh.wQc
 AXKUt2zq31xdYtqySNcShf8swUs1HdmRXQ7ZmIikUxcoV5txA.vza5UgiWZ9TSVPfjBGxHr8SRXM
 MsMNjqvqoyPox6HuxCWUHG.VkwQGdVS65YVMfRaVxgQ3bL1PWrruVJjvbQ14MTV6ry4UFRuHMlRz
 lfVvHe5jATkHDnU3Zcevat5LNDlG7m42eha1UnmQi1JBcVtUgHmoifTDYmL2YDozSwVoG4dbgzNO
 tpXAPCRRoqPND_NmJ1Iyg4.VPEmOpodPcV3j1H9VrntgyyHWLj0cDIYdmRqPLsUzTK9WeH31rSZH
 B44xDYSxmAl0kylBotp8G9yYG5iG0g9w2beRy2u9zqjxmGe1fWmi4Ra8cPP80ClFFwXqXIaDaaSF
 YcY18edj2vgwSaa6SFGEeOPs7qto2KjGVDYdK2FXs2n9zhnlT2IhP1eTpeHFr9De4G37OJl59w3e
 the_DhnrLtkB8JiORiLjzHm5iTEiIGf2.Q28P5udZSyE7EFYqqvoKgAWC9AQ0vjbstj9aNv8J76Q
 JyKSoAPV_4xS8oX8sCgzWzShKwVNIJgU.Ru0r4Pbru_8ll_dzQ4zhNtctwH61I0nZY98nOlprtuV
 y6HZKSpLkaS.zCKU9NQb8mnfvypF5KH1HtaLlpONjwo1o5Zc.Zt44Kn9HbYjKNLopX_pdWzdw.9C
 29XVMiT2S9yHNbbbyDqScnhztT.nNjEgLS9NN.NGvuxPT.9nccaL6SG6Qq2PcNga5jR_WBnPMIyY
 yxdh0WOTw5F.oEZ_189NOaFKB3wUUa49oaPYxwyGIx9bN9IG9ydaic.lqoC3pPWHez_y.EtS75Xy
 ykLeBvjwUHP1KAssqPGjC5IoKezvZBcyEQ9sEXo2zOPfcIYiiDvpL1OgDGrDOs1iHK3fg1aLAqf0
 rbC3wUcCnSESQm6hMppzH2Jxo.WIRRoljeNVbfw97mvnsNjP8ElnXEq3RpGN_OQmSUPAqWFq7fpI
 kr9vXTz8gQHnce_M69XUXHnEg5_pJVFlY3GKn0E2c6iQy2p93ot31Acy3N4J75fY23bsJOx0G4yK
 uG4qyvu8Fir8VB5Hnkwr8Kn9nieI5D6OlgfRHg9TqQxC4JVZ_06qDr0xJfLCTGJxaSyVBsxYHp5D
 gtsvzmTeNHJPXiJMEFKI.3.qdLjdF5iJGxa0H7jI07HZOmmBwN1HNSuE7WkMmcD82kzcMprhGN73
 e.iqgyKzkjnGOrK4WQs9tv9.IDyR7Sm2ptaKjyALlPsaFa3h1asRxrJ8QvxXKeIUf0eus5F90Cdj
 agojNZjUSOGc74rW71ydxIWmm29P8hReL5UBDr_FGdq51KmVyYXgFHGRVBWXqxtAfGCioyGSg_G0
 OOkwWUnk0Oied34fP6LgR_K62ZWkx1sfRM5jPxRQ9oG_VJDicGUu1Hcea5f8rrIgmhI5t7ekOoIk
 c29eY4CXJvs_PUnkWBYJWcwJlZGOzgZzQTOxtKaBeRn5XC0y1pl8dMjAhNduo1U.GkEBGPj44e0Q
 mUpjSTpmirm3OgpofkxPdnTs3OGSCcyE_rkNHWC1Pfw67.bS5H3ImsbMZTNjOcLtZBRyQYQIJ0VP
 w.6kc4zoRk02yKNo6ms1G6yX.E4wUH8wkyMtE_VP0y3RnGaf0mMGDX8uYwNQO.2lcsmxqM3T8.ov
 4sJ2UV79zWQBVoikgpmRa81Q6qx_9MzDBBEGRLIKjzKqCtlNm5_tZI84ubIXvS3rOEsjHXtot5tw
 YxSKEqVjzpWV552FkyhCvMLX2wNwtsa1KGGENAXMMkaml5YreNjlU4yZOQQnlLcJP5UBdK0ETiQF
 .IajPkseHZRp1xnyPSKaNsT.uMVSYgs5ZujPfCJ5RZVdrC5UkmKuz3k3b6Nnzs5URNlDXI4Cap3j
 EVGTNgcdQo8bx2_iNjTQijac6en1_7Qs.1ZRF1gYL8Hnk3UbBIs094tlbOuZAVpEP66Ma3soEsAR
 AuxnWZMiSl3Swam61NvQEO425icMgh7n57s5r2i77oSuT_by9ievEiTWAj2mPyKYfGJMAPfsZiTm
 0ui4z4iqTHS8dU2rwbhpfLApyj1anu9vS.IjSr4WuOrdo0R3Dvjm0vJ7JG9n1Yw2K.JDmMAku_XA
 PF7yAl8etLP65s0kq.78e2DTaBkE4YQqIDPUSUsd3SUCIntRTAxN4xy6LWZ1e1FYukmQECRq1T3B
 eskw0SITMz3lKRCN_y14-
X-Sonic-MF: <namiltd@yahoo.com>
X-Sonic-ID: 9e8bf8d6-f6d7-41c2-ba82-b55d9b04c7ea
Received: from sonic.gate.mail.ne1.yahoo.com by sonic302.consmr.mail.ne1.yahoo.com with HTTP; Tue, 17 Nov 2026 07:40:38 +0000
Received: by hermes--production-ir2-5dd9bf4598-p4sz7 (Yahoo Inc. Hermes SMTP Server) with ESMTPA ID 9aacdc0928108e45940ad344d4be53a5;
          Tue, 17 Nov 2026 07:40:33 +0000 (UTC)
Message-ID: <62c7fce5-0296-4e66-92c9-fdb501ef592a@yahoo.com>
Date: Tue, 17 Nov 2026 08:40:32 +0100
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
Subject: [PATCH net-next v11 09/13] net: dsa: realtek: rtl8365mb: use raw VID
 for PVID on family D
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

Family D has no working VLAN member config (MC) table. Its PVID is a raw
12-bit VID in a per-port register at 0x0700 + port, whereas family C
stores a 5-bit MC table index, two ports per register, at
0x0700 + (port >> 1).

Running the family C code on family D therefore reads an MC table that
does not exist, and writes an MC index into the VID register of port
(port >> 1) instead of the one of the port being configured.

Add the family D implementations of the PVID helpers,
rtl8365mb_d_vlan_port_get_pvid(), rtl8365mb_d_vlan_pvid_port_set() and
rtl8365mb_d_vlan_pvid_port_clear(), which skip the MC table. They keep the
family C frame filter handling and rollback on error. The shared code
reaches them through the vlan_port_get_pvid, vlan_pvid_port_set and
vlan_pvid_port_clear pointers in struct rtl8365mb_family_info, so it
needs no is_d() check.

Also clear the family D PVID registers when the VLAN support is set up.
Unlike on family C, where VLANMC index 0 is the neutral PVID, the
register holds a raw VID, and after a reset it keeps its hardware (or
EEPROM) default. Without clearing it an unconfigured port could report
a stale PVID from rtl8365mb_vlan_port_get_pvid(), and
rtl8365mb_port_vlan_filtering() would accept untagged frames into it.
rtl8365mb_c_vlan_port_reset_pvid() does nothing on family C.

No functional change for family C.

Nothing points to the new functions until the family D info is added
together with the chip table entry in the last patch. Until then they are
not static and are declared in rtl8365mb_vlan.h, so that the build does
not warn about unused functions.

Signed-off-by: Mieczyslaw Nalewaj <namiltd@yahoo.com>
---
 drivers/net/dsa/realtek/rtl8365mb_main.c |  11 ++
 drivers/net/dsa/realtek/rtl8365mb_vlan.c | 191 ++++++++++++++++++++++-
 drivers/net/dsa/realtek/rtl8365mb_vlan.h |   6 +
 3 files changed, 207 insertions(+), 1 deletion(-)

diff --git a/drivers/net/dsa/realtek/rtl8365mb_main.c b/drivers/net/dsa/realtek/rtl8365mb_main.c
index 77ad84e..9832572 100644
--- a/drivers/net/dsa/realtek/rtl8365mb_main.c
+++ b/drivers/net/dsa/realtek/rtl8365mb_main.c
@@ -2432,11 +2432,22 @@ out_unlock:
  */
 static int rtl8365mb_vlan_setup(struct dsa_switch *ds)
 {
+	const struct rtl8365mb_family_info *fi;
 	struct realtek_priv *priv = ds->priv;
 	struct dsa_port *dp;
 	int ret;
 
+	fi = rtl8365mb_get_family_info(priv);
 	dsa_switch_for_each_available_port(dp, ds) {
+		/* Start every port with the neutral PVID */
+		ret = fi->vlan_port_reset_pvid(priv, dp->index);
+		if (ret) {
+			dev_err(priv->dev,
+				"Failed to reset PVID on port %d\n",
+				dp->index);
+			return ret;
+		}
+
 		/* Disable vlan-filtering for all ports */
 		ret = rtl8365mb_port_vlan_filtering(ds, dp->index, false, NULL);
 		if (ret) {
diff --git a/drivers/net/dsa/realtek/rtl8365mb_vlan.c b/drivers/net/dsa/realtek/rtl8365mb_vlan.c
index 85880c3..afe894f 100644
--- a/drivers/net/dsa/realtek/rtl8365mb_vlan.c
+++ b/drivers/net/dsa/realtek/rtl8365mb_vlan.c
@@ -44,6 +44,10 @@
  *
  * VLANMC index 0 is reserved as a neutral PVID, used for standalone ports.
  *
+ * Everything above describes chips that have a VLAN membership configuration
+ * table. RTL8365MB_FAMILY_D chips do not have one: their PVID is a raw 12-bit
+ * VID in a per-port register, and no VLANMC entries are allocated.
+ *
  */
 
 #include "rtl8365mb_vlan.h"
@@ -121,6 +125,12 @@
 #define   RTL8365MB_VLAN_PVID_CTRL_PORT_MCIDX_MASK(_p) \
 		(0x1F << RTL8365MB_VLAN_PVID_CTRL_PORT_MCIDX_OFFSET(_p))
 
+/* Family D: the PVID is a raw VID, one register per port */
+#define RTL8365MB_D_VLAN_PVID_CTRL_BASE			0x0700
+#define RTL8365MB_D_VLAN_PVID_CTRL_REG(port) \
+	(RTL8365MB_D_VLAN_PVID_CTRL_BASE + (port))
+#define RTL8365MB_D_VLAN_PVID_CTRL_MASK			GENMASK(11, 0)
+
 /* Frame type filtering registers */
 #define RTL8365MB_VLAN_ACCEPT_FRAME_TYPE_BASE	0x07aa
 #define RTL8365MB_VLAN_ACCEPT_FRAME_TYPE_REG(port) \
@@ -172,7 +182,7 @@ struct rtl8365mb_vlan4k {
  * This structure is used to get/set entries in the VLAN membership
  * configuration database. This feature is largely vestigial, but
  * still needed for at least the following features:
- *   - PVID configuration
+ *   - PVID configuration (family C only, family D has no VLAN MC table)
  *   - ACL configuration
  *   - selection of VLAN by the CPU tag when VSEL=1, although the switch
  *     can also select VLAN based on the VLAN tag if VSEL=0
@@ -1171,3 +1181,182 @@ int rtl8365mb_vlan_pvid_port_clear(struct dsa_switch *ds, int port, u16 vid)
 
 	return fi->vlan_pvid_port_clear(ds, port, vid);
 }
+
+/**
+ * rtl8365mb_d_vlan_port_reset_pvid() - Put a port's PVID in its neutral state
+ * (family D)
+ * @priv: realtek_priv pointer
+ * @port: the port number
+ *
+ * On family D the PVID is a raw VID in a per-port register whose value after
+ * reset is not defined by the driver (it may come from the hardware default or
+ * from an EEPROM), so clear it to 0.
+ *
+ * Context: Can sleep. Takes and releases &priv->map_lock.
+ * Return: 0 on success, or a negative error code on failure.
+ */
+int rtl8365mb_d_vlan_port_reset_pvid(struct realtek_priv *priv, int port)
+{
+	return regmap_update_bits(priv->map,
+				  RTL8365MB_D_VLAN_PVID_CTRL_REG(port),
+				  RTL8365MB_D_VLAN_PVID_CTRL_MASK, 0);
+}
+
+/*
+ * rtl8365mb_d_vlan_port_get_pvid() - Retrieve the port PVID (family D)
+ *
+ * Family D has no VLAN MC table: the PVID is read straight from the per-port
+ * register.
+ *
+ * Context: Can sleep. Takes and releases &priv->map_lock.
+ * Return: 0 on success or a negative error code on failure.
+ */
+int rtl8365mb_d_vlan_port_get_pvid(struct realtek_priv *priv, int port,
+				   u16 *pvid)
+{
+	u32 data;
+	int ret;
+
+	ret = regmap_read(priv->map, RTL8365MB_D_VLAN_PVID_CTRL_REG(port),
+			  &data);
+	if (ret)
+		return ret;
+
+	*pvid = data & RTL8365MB_D_VLAN_PVID_CTRL_MASK;
+	return 0;
+}
+
+/*
+ * rtl8365mb_d_vlan_pvid_port_set() - Configure a port's PVID as a raw VID
+ * written to its dedicated register (family D)
+ *
+ * Reads back the previous PVID and frame filter first so both can be
+ * restored if enabling the new PVID fails partway through, matching the
+ * rollback behavior of the family C implementation.
+ *
+ * Context: Can sleep. Must be called with &priv->vlan_lock held.
+ * Return: 0 on success, or a negative error code on failure.
+ */
+int rtl8365mb_d_vlan_pvid_port_set(struct dsa_switch *ds, int port, u16 vid,
+				   struct netlink_ext_ack *extack)
+{
+	enum rtl8365mb_frame_ingress prev_accepted_frame;
+	struct realtek_priv *priv = ds->priv;
+	u32 prev_pvid;
+	int ret;
+
+	lockdep_assert_held(&priv->vlan_lock);
+
+	ret = regmap_read(priv->map, RTL8365MB_D_VLAN_PVID_CTRL_REG(port),
+			  &prev_pvid);
+	if (ret) {
+		dev_err(priv->dev, "Failed to read current PVID\n");
+		return ret;
+	}
+	prev_pvid &= RTL8365MB_D_VLAN_PVID_CTRL_MASK;
+
+	ret = rtl8365mb_vlan_port_get_framefilter(priv, port,
+						  &prev_accepted_frame);
+	if (ret) {
+		dev_err(priv->dev, "Failed to get current framefilter\n");
+		return ret;
+	}
+
+	ret = regmap_update_bits(priv->map,
+				 RTL8365MB_D_VLAN_PVID_CTRL_REG(port),
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
+	(void)regmap_update_bits(priv->map,
+				 RTL8365MB_D_VLAN_PVID_CTRL_REG(port),
+				 RTL8365MB_D_VLAN_PVID_CTRL_MASK, prev_pvid);
+	(void)rtl8365mb_vlan_port_set_framefilter(priv, port,
+						  prev_accepted_frame);
+	return ret;
+}
+
+/*
+ * rtl8365mb_d_vlan_pvid_port_clear() - Remove a port's raw-VID PVID
+ * configuration (family D)
+ *
+ * Reads back the previous frame filter first so it can be restored if
+ * clearing the PVID register fails.
+ *
+ * Context: Can sleep. Must be called with &priv->vlan_lock held.
+ * Return: 0 on success, or a negative error code on failure.
+ */
+int rtl8365mb_d_vlan_pvid_port_clear(struct dsa_switch *ds, int port, u16 vid)
+{
+	enum rtl8365mb_frame_ingress prev_accepted_frame =
+		RTL8365MB_FRAME_TYPE_ANY_FRAME;
+	struct realtek_priv *priv = ds->priv;
+	bool filtering;
+	u32 cur_pvid;
+	int ret;
+
+	lockdep_assert_held(&priv->vlan_lock);
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
+			dev_err(priv->dev,
+				"Failed to get current framefilter\n");
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
+	ret = regmap_update_bits(priv->map,
+				 RTL8365MB_D_VLAN_PVID_CTRL_REG(port),
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
diff --git a/drivers/net/dsa/realtek/rtl8365mb_vlan.h b/drivers/net/dsa/realtek/rtl8365mb_vlan.h
index 62ee59c..d8187bc 100644
--- a/drivers/net/dsa/realtek/rtl8365mb_vlan.h
+++ b/drivers/net/dsa/realtek/rtl8365mb_vlan.h
@@ -34,6 +34,12 @@ int rtl8365mb_c_vlan_port_reset_pvid(struct realtek_priv *priv, int port);
 int rtl8365mb_c_vlan_pvid_port_set(struct dsa_switch *ds, int port, u16 vid,
 				   struct netlink_ext_ack *extack);
 int rtl8365mb_c_vlan_pvid_port_clear(struct dsa_switch *ds, int port, u16 vid);
+int rtl8365mb_d_vlan_port_get_pvid(struct realtek_priv *priv, int port,
+				   u16 *pvid);
+int rtl8365mb_d_vlan_port_reset_pvid(struct realtek_priv *priv, int port);
+int rtl8365mb_d_vlan_pvid_port_set(struct dsa_switch *ds, int port, u16 vid,
+				   struct netlink_ext_ack *extack);
+int rtl8365mb_d_vlan_pvid_port_clear(struct dsa_switch *ds, int port, u16 vid);
 
 int rtl8365mb_vlan_port_get_pvid(struct realtek_priv *priv, int port,
 				 u16 *pvid);
-- 
2.53.0

