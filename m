Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=66.163.191.146
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794901197;
	b=MH9LDrDAYh+fsBqhJUiaNzFoZ9CKFrcSOWSmanFrfEoMp+qjuTolrTQD1PbtXz/MGVUk
	 SaWufmX7ReUoozDhVcuyYzIpq3CORD+9GinkTmR4d1I48qSweSrVIZT3MbdZRPriEeaCd
	 5oK/2SMwxvzMOHb5G1SG8vL/bpsyxDf/8dMovu5HDEmAMi0mCbyrbyh5QfiEFt2OWwitw
	 ATLOUJ8NSqo2KBZSJZpJkzk3saSLGQgoAWk7DjkBCUSs3cHrq/gDFieLeycyuYRRrz3h/
	 Y/6pY8rKeIcrVsTluXKldOrpVz9GKtSqWXVDa7c92B8QG/EX+CoePPD3pigoxCVAZEg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794901197;
	h=DMARC-Filter:DKIM-Signature:X-SONIC-DKIM-SIGN:X-YMail-OSG:X-Sonic-MF:
	 X-Sonic-ID:Received:Received:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:From:To:References:Content-Language:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Mailer;
	bh=DX0whbQKsANA+vM38mCH3wl/F+aTjwapExfuPC+/vSw=;
	b=D47HM3xmwIHs+1qzoWJsVR5DupdEn9g3UdSfqIazyiDrhqbk0nbTlWdLxfuCjVskjOT8
	 4ATv0py88eBZkTNGiG/dwk9o9hWVFtfV9zb3pNLNOvui3O8In/BHuhptv9MEDysjN+1I1
	 MLgSgqRGyEYi2HKzmq+F1HpQ2qkzNkd2Kk5n8M9mdhjkp9/YRiSKbJgeWmzXYqNUiwXDx
	 HxCGxpw5a+zjvETY482E+bGgW1DP3xJPO+2Ev3SWf0NTfw7ub++s73swDc4E313r6YQrp
	 Sln2LOzMFGe385Bm3cmzdonw2ghHMDIImLfCIP8oTmTSZKh4Mt5OQuH8A9hZDABM5aw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=yahoo.com;
	spf=pass smtp.mailfrom=yahoo.com;
	dkim=pass header.d=yahoo.com header.i=@yahoo.com header.a=rsa-sha256 header.s=s2048 header.b=otkzBynb;
	arc=none smtp.remote-ip=66.163.191.146
Received: from sonic304-20.consmr.mail.ne1.yahoo.com (sonic304-20.consmr.mail.ne1.yahoo.com [66.163.191.146])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47841606A323
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 07:39:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 47841606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yahoo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=yahoo.com header.i=@yahoo.com header.a=rsa-sha256 header.s=s2048 header.b=otkzBynb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1794901196; bh=DX0whbQKsANA+vM38mCH3wl/F+aTjwapExfuPC+/vSw=; h=Date:Subject:From:To:References:In-Reply-To:Content-Type:From:Subject:Reply-To:Content-Type; b=otkzBynbpzyp2f2tFCICrqbAyXchwiiDiHl1J8oxeVBr/hi/cmA0rMcvSRVIjtS2UN0ucKOYsK8VR6t79ScAPFyrnwHbUFcPAr06riWQ2rlDKuPcahhn/sUQLu8GfPELaVlIafTu4oS0ti+j56vS84D1t6KujrD+9JW8jnJhOdd57rBLir03AQD0ImdbINlH8HF3Rwosi3C4zmTMWW0ljvZvNHJPK+xZNJyNMCKJuK9dgJf3Rr1KzIKkvaLNgfgNS82qEZ2QLF5tI789x/Et2lV7OkF/IY/sKr7iGOHZ5L6I+oroK/rJKJytxgI8OMkr5Ng/7hxstQ3Ja7mPfASNOQ==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1794901196; bh=8auKAmc7wkVxPCIppF7zN4kpJBYgG/bsNF9+YQoynzo=; h=X-Sonic-MF:Date:Subject:From:To:From:Subject; b=YVmEdDQZ5uHwv61Yj11GregFIhfeKMYLpLgsj1zQtQR3WP4VpecN4tAFA/KNa3FPC+IWEramV1dwf544R7ElwhjP9FJUGGR66B4wn3dMGt7Y/E1SRwzlivqeHC2SpCzMNYuaMBlITcz6kQtoKuWeqiKLr2WNnNieN4X6Yn0TtYa+YknAmD6u5PgnC/oHTfWyZYsFyfh8LeMGfpkUYZtY3zlKf75sgmyGrM8SOCKEcveCVnbnzc5LL65AxEkFTjYQUePCAx9cTpFziuBNrTjcf6p5U3FcFgvcWgLv33QQwhAmZqg46sH0MUNU3UT8I2R1+Et83IMrJ53TKSztjUm9bw==
X-YMail-OSG: IIfbu9EVM1nk73Wf6.PXv8bgfoi8_M0WJH_t__gj2wo9vbnyudhJzqAtuTTCbMg
 MbAKTMQe2tU61zsoIMxkRONINta3CUyfWlW10t_QzFB1k6WslfkGLuBvghWrwlt9GIvYZ7fsuJYB
 FpYt71pey6F48W6iq_Kw9OcSK5L69vlWab45PvoATXKBZLpiteTFqeNuAW5fKcEtzZ173BP3He4S
 VZWeGHOFPBEkcSsgegr1JC2LitKXtPwX.dU.h8Put9dZliFz2Mam8earUSTaQwVW6xRTqe4zw3_b
 q8.liRze3wKF1sVQfrUqYbuTGnQNi4DLYy5m3_fDbe_weYTC4ShGhVyQJLeaTBVyzc6vSzaUGLO0
 HVMPipYT9VhB2_2duXuZ9QxHFm43arljSGi2j0y.PGua7lRlY1nXd6Ez5SRVCma7kUUcCrNzCNKC
 l6L2HbwDHKdvF5VgwXA8sBjker6uBWHlAT1dmP1V1FRcM9xDsMyqouSHHMUfaIm4tSBm37il7k6f
 n1AkihCipdDfe.9yj0jj2yTmNAMZH6y6w9GSkEZACwIJu9BWfe5wOwgwO67JAxGfT4DxCmylMthO
 VkJuqSHg7L0TsNMQCBAtXNZ4kHclyDfooRVH1l8hvMfhgNIlW2FEmJMPY9odH6YAyx.Dvj4EfS03
 jjx6kcHItEr2iIiNmns3OiOjh_ll24p2hSdegz4y8D9FspwwqwC4wkIVx0nGIpEycRWXKAJ9I9Us
 Nynw6L1DSqgL2Ho.NWsiMMvKK0rp29_jlsE_HOM4wrTrAe3ic.YtXu58ID4XQ8b9cZjXe43Qmt88
 BYNHPSAriBNZGedQLr_z_S9CQvIHnGoGsvd2M2G46yuB6cPQ0EkteeS6_AtZkWTczQcyTgKQdhCo
 .KemIq_12NQGLFMXEGbMznerzhVlu5wtkVzbXO5Eqpwii0.qyM4XPf7FE4SMDflOAKuW2OjI.UOB
 HuGLQiVEnBwN8NynGgFsjXaoBm1wGOc.7Xzz3vuhpFMeOXSKMiGSaP3IkofwGCQWoZyYbrHrUKAE
 ghQaNvDEpdgHG2q0jAj9_tPaihbI08mmiLU4RqNWXScNdI32.74yQ8BKj4MfE0Pj.QczDStr_Bsz
 f7UVopQAk5cf_pH0WzNhYcjpCAVar6jTV0YrJcnpcgUPVV5aoBzfmwO8FtCZZMV7eCv.udJQ26oA
 OG3qJ.5qEkK.Mtz_Oobpcl8a5VfJksy4i_qyaQ4f1p.hcyMIBFWyCzTtLMyiEE7uJ742idqyFRCQ
 aofwiWIcHem6jO3ZDtmjAeC19id3A6tQGEy4UYhV98_IWuZVZg8O5GuyTDl4XP56H9LxhL.YIRxl
 88sxtPczSiDUTjbqcI8rFzmq4rzXqJZDTOyymF2zGvOOnaW.h2I2GSmp.QWPf8sPyGpSq9nySxFF
 QD75fRiPk8MzWtVEs332F55iikTpag34Zq.cFRUMbtQUory62b0PqTMMp1TD5NLG1CEkDEhnRAxH
 BMJFjYaGBj_JUJnlcIXWFytGuEwophzx2FUPace8zi.wHIlTuvNDc_mtUJZAbA0AnAtiXcFRXxNR
 Jn5k3ghks9Jqzl3pwzDNHm.EjuWCrYR7xVS1lc6g3X17FuTcmcetwGMPc2_6d1KH1I4DvFKbTxZd
 _ZlNWCtjDmZG7U1m6lB7FhpM6i_2858pp9ITpTgHXH_B7.g2ADim_bXeO8hNbq9Dohsu5v6m223a
 CRQPkFXfEWv9bU4kJkI9CBAeS_52VMqVS.xcx3wRrgbAA9oUVyxmqlOxGoO2CczCabanRQkbQiFK
 JxGjWmWS8cznx.NwAQRzX4s6v4dFDXnoVYRbPPaLm.hIWpLnFeahREIlNhNufAiyEKaGpUKCSTWh
 SQoRtfZS4CCLrW6V7pjOmmV.FhD5c33PwTURyOlKsRae1ORb6UDwTzx5jI_QSwIDDfUrM1GHkyEs
 p5sw2xjRXHIol9k3hLz9GqQ_tcx5RG2hfyOFao9slyVzDxlR1eNUcYS0PANXyCMI22qBGwwzqzoV
 RM0uOGr3BNrMEC3f_XqrhNqlJtozw_R8J.ufPTBQ7kRs6uuSPFSbx_FRzdC_zBx_jx.ztXDdCo7z
 SvyFnPYsV4v_IJ96mFfOcg.Of2Cx41Xkh_y9Fz74DdSJg8VYst8fJKwIBm0KDlNYpVNBNnPQ74ys
 k5VyWoTLdclq6vMbVDOVlj1FYuvCx1iXCmtAnWP840oEy3LoMCEedOGTlQFqsptmXil6l3AxrCsg
 _oOG6S2rET5lGDtzuFL.m844WCDvx1mEON.9nRqDVlxudvFmzC_13dLNLhyB9SmMcexaMRfs4Am3
 GP6RMeliJ6I7dErwEdOSA
X-Sonic-MF: <namiltd@yahoo.com>
X-Sonic-ID: b1dd46d1-b512-44aa-ac72-e6b27ed6f0e1
Received: from sonic.gate.mail.ne1.yahoo.com by sonic304.consmr.mail.ne1.yahoo.com with HTTP; Tue, 17 Nov 2026 07:39:56 +0000
Received: by hermes--production-ir2-5dd9bf4598-bbdwl (Yahoo Inc. Hermes SMTP Server) with ESMTPA ID d6736f053d464e69709bf73492683286;
          Tue, 17 Nov 2026 07:39:52 +0000 (UTC)
Message-ID: <bee46abf-f05f-4ea4-9797-f47adf8c78e7@yahoo.com>
Date: Tue, 17 Nov 2026 08:39:51 +0100
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
Subject: [PATCH net-next v11 08/13] net: dsa: realtek: rtl8365mb: refactor
 PVID handling
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

The PVID helpers (rtl8365mb_vlan_port_get_pvid(),
rtl8365mb_vlan_pvid_port_set() and rtl8365mb_vlan_pvid_port_clear())
work on a VLAN MC table index, which only family C has. Family D stores
a raw VID in a per-port register, so it needs its own implementation.

Move the helpers behind struct rtl8365mb_family_info, as already done
for the VLAN 4k accessors: the existing code becomes the family C
implementation (rtl8365mb_c_vlan_port_get_pvid() and the like), and
the three functions above only call it through the vlan_port_get_pvid,
vlan_pvid_port_set and vlan_pvid_port_clear pointers in the family
info. The callers are not changed. The following patch adds the family D
implementation without any is_d() check in the shared code.

No functional change.

The family C functions are not static because they are referenced from
the family C info in rtl8365mb_main.c.

Signed-off-by: Mieczyslaw Nalewaj <namiltd@yahoo.com>
---
 drivers/net/dsa/realtek/rtl8365mb.h      |   8 ++
 drivers/net/dsa/realtek/rtl8365mb_main.c |   4 +
 drivers/net/dsa/realtek/rtl8365mb_vlan.c | 102 +++++++++++++++++++++--
 drivers/net/dsa/realtek/rtl8365mb_vlan.h |   6 ++
 4 files changed, 112 insertions(+), 8 deletions(-)

diff --git a/drivers/net/dsa/realtek/rtl8365mb.h b/drivers/net/dsa/realtek/rtl8365mb.h
index d3d5fb3..e7f03d9 100644
--- a/drivers/net/dsa/realtek/rtl8365mb.h
+++ b/drivers/net/dsa/realtek/rtl8365mb.h
@@ -9,6 +9,8 @@ enum rtl8365mb_family {
 	RTL8365MB_FAMILY_D,
 };
 
+struct dsa_switch;
+struct netlink_ext_ack;
 struct rtl8365mb_jam_tbl_entry;
 struct rtl8365mb_vlan4k;
 
@@ -24,6 +26,12 @@ struct rtl8365mb_family_info {
 			    struct rtl8365mb_vlan4k *vlan4k);
 	int (*vlan_4k_write)(struct realtek_priv *priv,
 			     const struct rtl8365mb_vlan4k *vlan4k);
+	int (*vlan_port_get_pvid)(struct realtek_priv *priv, int port,
+				  u16 *pvid);
+	int (*vlan_port_reset_pvid)(struct realtek_priv *priv, int port);
+	int (*vlan_pvid_port_set)(struct dsa_switch *ds, int port, u16 vid,
+				  struct netlink_ext_ack *extack);
+	int (*vlan_pvid_port_clear)(struct dsa_switch *ds, int port, u16 vid);
 };
 
 const struct rtl8365mb_family_info *
diff --git a/drivers/net/dsa/realtek/rtl8365mb_main.c b/drivers/net/dsa/realtek/rtl8365mb_main.c
index c693046..77ad84e 100644
--- a/drivers/net/dsa/realtek/rtl8365mb_main.c
+++ b/drivers/net/dsa/realtek/rtl8365mb_main.c
@@ -759,6 +759,10 @@ static const struct rtl8365mb_family_info rtl8365mb_family_c = {
 	.ext_config_forcemode = rtl8365mb_c_ext_config_forcemode,
 	.vlan_4k_read = rtl8365mb_c_vlan_4k_read,
 	.vlan_4k_write = rtl8365mb_c_vlan_4k_write,
+	.vlan_port_get_pvid = rtl8365mb_c_vlan_port_get_pvid,
+	.vlan_port_reset_pvid = rtl8365mb_c_vlan_port_reset_pvid,
+	.vlan_pvid_port_set = rtl8365mb_c_vlan_pvid_port_set,
+	.vlan_pvid_port_clear = rtl8365mb_c_vlan_pvid_port_clear,
 };
 
 /**
diff --git a/drivers/net/dsa/realtek/rtl8365mb_vlan.c b/drivers/net/dsa/realtek/rtl8365mb_vlan.c
index f3ac294..85880c3 100644
--- a/drivers/net/dsa/realtek/rtl8365mb_vlan.c
+++ b/drivers/net/dsa/realtek/rtl8365mb_vlan.c
@@ -806,7 +806,7 @@ static int rtl8365mb_vlan_get_pvid_mc(struct realtek_priv *priv,
 }
 
 /*
- * rtl8365mb_vlan_port_get_pvid - Retrieve the port PVID
+ * rtl8365mb_c_vlan_port_get_pvid - Retrieve the port PVID (family C)
  * @priv: realtek switch private structure
  * @port: port index
  * @pvid: pointer to store the retrieved VLAN ID
@@ -816,7 +816,8 @@ static int rtl8365mb_vlan_get_pvid_mc(struct realtek_priv *priv,
  * Context: Can sleep. Takes and releases &priv->map_lock.
  * Return: 0 on success or a negative error code on failure.
  */
-int rtl8365mb_vlan_port_get_pvid(struct realtek_priv *priv, int port, u16 *pvid)
+int rtl8365mb_c_vlan_port_get_pvid(struct realtek_priv *priv, int port,
+				   u16 *pvid)
 {
 	struct rtl8365mb_vlanmc vlanmc;
 	u8 vlanmc_idx;
@@ -830,6 +831,44 @@ int rtl8365mb_vlan_port_get_pvid(struct realtek_priv *priv, int port, u16 *pvid)
 	return 0;
 }
 
+/*
+ * rtl8365mb_c_vlan_port_reset_pvid() - Put a port's PVID in its neutral state
+ * (family C)
+ * @priv: realtek_priv pointer
+ * @port: the port number
+ *
+ * On family C the neutral PVID is VLANMC index 0, which is already the reset
+ * value of the PVID control register, so there is nothing to do. Leave it
+ * untouched to preserve existing driver behavior.
+ *
+ * Return: 0.
+ */
+int rtl8365mb_c_vlan_port_reset_pvid(struct realtek_priv *priv, int port)
+{
+	return 0;
+}
+
+/*
+ * rtl8365mb_vlan_port_get_pvid() - Retrieve the port PVID
+ * @priv: realtek switch private structure
+ * @port: port index
+ * @pvid: pointer to store the retrieved VLAN ID
+ *
+ * Returns the port PVID if defined or 0 if not, as implemented by the chip
+ * family.
+ *
+ * Context: Can sleep. Takes and releases &priv->map_lock.
+ * Return: 0 on success or a negative error code on failure.
+ */
+int rtl8365mb_vlan_port_get_pvid(struct realtek_priv *priv, int port, u16 *pvid)
+{
+	const struct rtl8365mb_family_info *fi;
+
+	fi = rtl8365mb_get_family_info(priv);
+
+	return fi->vlan_port_get_pvid(priv, port, pvid);
+}
+
 /*
  * rtl8365mb_vlan_port_get_framefilter() - Get the ingress frame filtering mode
  * for a port
@@ -892,8 +931,8 @@ rtl8365mb_vlan_port_set_framefilter(struct realtek_priv *priv,
 }
 
 /*
- * rtl8365mb_vlan_pvid_port_set() - Configure a port's PVID and associated
- * VLANMC entry
+ * rtl8365mb_c_vlan_pvid_port_set() - Configure a port's PVID and associated
+ * VLANMC entry (family C)
  * @ds: dsa switch instance
  * @port: port index
  * @vid: target VID
@@ -907,8 +946,8 @@ rtl8365mb_vlan_port_set_framefilter(struct realtek_priv *priv,
  * Takes and releases &priv->map_lock.
  * Return: 0 on success, or a negative error code on failure.
  */
-int rtl8365mb_vlan_pvid_port_set(struct dsa_switch *ds, int port, u16 vid,
-				 struct netlink_ext_ack *extack)
+int rtl8365mb_c_vlan_pvid_port_set(struct dsa_switch *ds, int port, u16 vid,
+				   struct netlink_ext_ack *extack)
 {
 	enum rtl8365mb_frame_ingress accepted_frame, prev_accepted_frame;
 	struct realtek_priv *priv = ds->priv;
@@ -1000,7 +1039,32 @@ undo_vlan_mc_port_set:
 }
 
 /*
- * rtl8365mb_vlan_pvid_port_clear() - Remove a port's PVID configuration
+ * rtl8365mb_vlan_pvid_port_set() - Configure a port's PVID
+ * @ds: dsa switch instance
+ * @port: port index
+ * @vid: target VID
+ * @extack: netlink extended ACK for error reporting
+ *
+ * Configures the PVID as implemented by the chip family.
+ *
+ * Context: Can sleep. Must be called with &priv->vlan_lock held.
+ * Takes and releases &priv->map_lock.
+ * Return: 0 on success, or a negative error code on failure.
+ */
+int rtl8365mb_vlan_pvid_port_set(struct dsa_switch *ds, int port, u16 vid,
+				 struct netlink_ext_ack *extack)
+{
+	const struct rtl8365mb_family_info *fi;
+	struct realtek_priv *priv = ds->priv;
+
+	fi = rtl8365mb_get_family_info(priv);
+
+	return fi->vlan_pvid_port_set(ds, port, vid, extack);
+}
+
+/*
+ * rtl8365mb_c_vlan_pvid_port_clear() - Remove a port's PVID configuration
+ * (family C)
  * @ds: dsa switch instance
  * @port: port index
  * @vid:  VLAN VID for PVID
@@ -1012,7 +1076,7 @@ undo_vlan_mc_port_set:
  * Takes and releases &priv->map_lock.
  * Return: 0 on success, or a negative error code on failure.
  */
-int rtl8365mb_vlan_pvid_port_clear(struct dsa_switch *ds, int port, u16 vid)
+int rtl8365mb_c_vlan_pvid_port_clear(struct dsa_switch *ds, int port, u16 vid)
 {
 	enum rtl8365mb_frame_ingress accepted_frame, prev_accepted_frame;
 	struct realtek_priv *priv = ds->priv;
@@ -1085,3 +1149,25 @@ undo_set_framefilter:
 
 	return ret;
 }
+
+/*
+ * rtl8365mb_vlan_pvid_port_clear() - Remove a port's PVID configuration
+ * @ds: dsa switch instance
+ * @port: port index
+ * @vid:  VLAN VID for PVID
+ *
+ * Removes the PVID as implemented by the chip family.
+ *
+ * Context: Can sleep. Must be called with &priv->vlan_lock held.
+ * Takes and releases &priv->map_lock.
+ * Return: 0 on success, or a negative error code on failure.
+ */
+int rtl8365mb_vlan_pvid_port_clear(struct dsa_switch *ds, int port, u16 vid)
+{
+	const struct rtl8365mb_family_info *fi;
+	struct realtek_priv *priv = ds->priv;
+
+	fi = rtl8365mb_get_family_info(priv);
+
+	return fi->vlan_pvid_port_clear(ds, port, vid);
+}
diff --git a/drivers/net/dsa/realtek/rtl8365mb_vlan.h b/drivers/net/dsa/realtek/rtl8365mb_vlan.h
index 625d4c1..62ee59c 100644
--- a/drivers/net/dsa/realtek/rtl8365mb_vlan.h
+++ b/drivers/net/dsa/realtek/rtl8365mb_vlan.h
@@ -28,6 +28,12 @@ int rtl8365mb_d_vlan_4k_read(struct realtek_priv *priv, u16 vid,
 			     struct rtl8365mb_vlan4k *vlan4k);
 int rtl8365mb_d_vlan_4k_write(struct realtek_priv *priv,
 			      const struct rtl8365mb_vlan4k *vlan4k);
+int rtl8365mb_c_vlan_port_get_pvid(struct realtek_priv *priv, int port,
+				   u16 *pvid);
+int rtl8365mb_c_vlan_port_reset_pvid(struct realtek_priv *priv, int port);
+int rtl8365mb_c_vlan_pvid_port_set(struct dsa_switch *ds, int port, u16 vid,
+				   struct netlink_ext_ack *extack);
+int rtl8365mb_c_vlan_pvid_port_clear(struct dsa_switch *ds, int port, u16 vid);
 
 int rtl8365mb_vlan_port_get_pvid(struct realtek_priv *priv, int port,
 				 u16 *pvid);
-- 
2.53.0

