Received: from sonic312-24.consmr.mail.ne1.yahoo.com (sonic312-24.consmr.mail.ne1.yahoo.com [66.163.191.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBFB53446A7
	for <linux-kernel@vger.kernel.org>; Wed,  7 Oct 2026 21:00:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=66.163.191.205
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791406838; cv=none; b=btbRHdW4nw+PgT2FFmIWLqz56+JZPew15SHzg/xKY9bz0IRh4sWtEbWyBKtXbdXuGen5BibO4o6Ww9Z72Je6KO9/q9sgXBohdos+UyktspJs+lAna0G4w7m5ekWJ5AqM1ZJfnFKCMFdMWXxvJdh6NZWOMsmrgDdgZ8dmSp0xkJw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791406838; c=relaxed/simple;
	bh=7AVDf+cd+H9nJHUXiCYHhK6qvhIv/dFxa6OyCLYYsYM=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:References:
	 In-Reply-To:Content-Type; b=Y+m2HyuMtyMlnKJ0BlYAvWpSXZRYvke7tcw2JjemJDXt4wy5BIujhI/xim4dfukiVJfrTpuZc1DoZTGkiKn6MIKqAdvChAkuwSybtMV3+S5eaY/Y/1kqO0spEAOjkvXzfApWU/rVu+OkGwtj01Nofw/fPzY2MQBLE4aTiofIhqQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.com; spf=pass smtp.mailfrom=yahoo.com; dkim=pass (2048-bit key) header.d=yahoo.com header.i=@yahoo.com header.b=pPnW+pxH; arc=none smtp.client-ip=66.163.191.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yahoo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=yahoo.com header.i=@yahoo.com header.b="pPnW+pxH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1791406836; bh=/CGFxfspScNEru1DCcSEEYzxs6UMvCMmdT1lQpVZ0mE=; h=Date:Subject:From:To:References:In-Reply-To:From:Subject:Reply-To; b=pPnW+pxHDMG/5QfB5NN0KL22h6sjkbMsIKAHotwgThz7xGWqffZSd44XPQlBxVxxuiF4f2kITqXUXPhnm0nmX6cTywcR/psyyRZYyOFiqtn60yKcuz6shIcTyXVthN2MLxRD5FX7UMT31YSD7pdPFnLxTgs4IGFM4b6yxW1Jb4Kfy2wDMRRzCywqGpAOPLdGtluw8jSWGIPDzzFuctbEaomO1m5O68Q75BLrK3euUq+ckHGPp7kSmSm2GIJeRBygEu/tpP1LIpq/vI+olNhmdSJX4d/m2nHWp3pk3F2NeKnBCfXYen5rZIHeDWUNnekK9DKJDRYc4UN9tkAOio7gsQ==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1791406836; bh=nPN2tFDjaYzS6Uxhhc1eII9A2h26eOmWocLnD/2BkaV=; h=X-Sonic-MF:Date:Subject:From:To:From:Subject; b=WNxkj82SXfyh1qhIpTphfpF71GczhLuRxNEtLDHOBoZRTZ+hYC9hvx1IJfuUZHhwiO/x9GEpcDZ1YXuPx7pzFt/NuQSdk/7hNTjcFGDu/4bcGWUL/uBa82O3Q5WDUVgLrHXMPX/dsD0DKp+BRC+P6/nDOUfv0vPWEysFOT1wPCedneNwMdygkn0s9yDtKdc9+M0QD7y3vtGltfJksp8cg+sU+YtINvg9B2BrPFxR2glhWV8BpTwZqwBaNK6loQrAGf/DjtbU5BMwhZmL5AY1wXpAofKQgOkCtlwDtWmWZWgbwzquVNbjvoTean1XvOehrlmdHtucQYzxJlDazqPUkQ==
X-YMail-OSG: f84wh5AVM1kDR7ZuIetXJcx4iQw4djoYJKkAgpYko89xZk7xWiSLaGyKqp_3PBF
 XU0TXuBrpghQnKZ2noa0g6i1Ux_UDs5WwrJ726qbVyntt7LWOcaTbqpnLAJx2cbdAPxsxaUkxE_Z
 t0i438LGKOEcbTLfauuLr_40dye8.iLb1g6TYmS2WGwBjEuY4SNFBA8rqBZlRXWrv_ueQIyF1vN7
 QlLbH14mVOAH_xgJIMAsUn4uvlSGk75XH54WH7VwWzzaqEJbXFmn9g_wN.WvBVynQ82Ow0r9aZtP
 Y.Yia_fGUnJ7NkVDxeuO12it8o9mv.bfLtt2X1uFSgNnVTByJaz1v5OefRlTNNLhZgTGKj3RLjaY
 o0W.I6PudZY2xncRb53.II4vRNzISlVDt0xGjaRF16lIwgcHdQSFVUyWSlpmOJpCTJsGQvpJTUvd
 BsaG9RbHVSL2eX8kmRJ3ibjuosyrLu2o7X1SuScKQA552BjctIiQFo4G1NmJURc6YWY6MqfBSP9J
 wQ8oRl8FzGvoFf4szmCfPNhmLzcSZ_CrDpNNIdFKs2eeAkROHkwsErt1OMR154AoFa1fn625djls
 OP1b3iMvhIQXrd.zoBdCLSk23oi7EstU6PVMJ5xIb9pBNNDQMxCBH8QNwmYRjqviA0n6tGiGHvNO
 meqMGgWYqeZEoHfqIjFmhEPHE8Z0sCsW46zjhA2ZIxtk13z_o9UYPQMHKhHE_kRsfpiDxm22ULNO
 BRLrXEkNaX.iQQadvG6HIlMYatLVfus91pVF0GZSPOofqQTr6p_VVn4v5MEVA0sOFzDVaadX4aMw
 MIsnOqfjqgUXMY91XKn3Qv66eIzR4ZS4A3Fn26klfrM3Vv7YYPjQcwR3.s8uPUd2co5nbBz_ZAvl
 .IjzEwZY81h2fokkThq_NVT9husmeillLTjEf8GkbRni2W2XT0lGyRfTTTsrUOmppCIxAsgAnPh0
 WZoBKqgU.11sfcd_6PM8YR_fWWgOLhkPRi_RN8hxjIGIfF6rFoAOs1hAVJMQ8rnIKpud4udgGNHs
 ZiCPs96uhI9oGR_st_PuTyKX9oF6TwgEvryS2OhjXO0J0HiGqCbCYQ5FeFlrBGhuGMtx6RmeupGH
 w_loz51NgNnbOX1sfcbL5MBSi.tFig87VVTlTLJ_teQxB.yPM402ziJhxOthj5OwBnAzOwxlMx1k
 zkQnVxSUGKgLni2V4xkvNl0Q8QrhO5Xg.Hykh5XwjrY2Kj_QeKsP4o5v0pc73JmlyCCHtu4368Lp
 6T3FOUG0pVF15XS3AROs4hEb6pE_ENdViFWfpxoABrLb_tD8W.K2Gl0EjqMXNwLjBItWgNT0KvkC
 LM9zEvcUqpJ0JCcELJQHoROXj8ArKHiM8FuZFQYA2pUJPJmtJ08dxB1sJR1VGFQk_v5NPZE__RV0
 Y8FGvgZGxB43.1KAqkJMJjgdVq1oGWf7xo5Xs.497HStJ7fhcmZmbNpWOLijFzJ5DNtMsS03n5si
 EEPpnDmcpXraZrfh6zz7oqFS3zoF2EJVsQaTmN.LNMhd_MkZS3ENb.BGF1nf6C.wuMPPGVk4Jcu8
 jNZ7KZ8AGOrIaEM20u4akXOs5L.zR7YDDQKYfHg8bCqdkAjvhWJh2DEwaEhcQHbXTWnAO579aS.m
 um2TV0SCMd_UBs_gvhHCHv.fR.nlKSzS0JebjGsQ98tI3F5dOpO_W7n1M5eoXEzhQJwuLFp8bF.q
 a9FT5NXcA7xE35ewD2fio0nxbV1STYtEEXVZAdL5yZiTXxxODEiE3EeXP44Y5pHLEVr.fjOEilvk
 aae6nTMZQ4LRzayDVKEtLRcLrkqHVryoqRx8JxeBSsFQ33ToG1LAKqTo6HAPnaJrBKVmymWuvLr1
 Zm12JRtmP9HAhrzzImk2HPhb6xDE9zb0o5HdLeFAlqIBhLsWjXRhAfktjypALiAaf0nsaPblB73p
 2fDLpwsPoOZ9cCIFygkjnkgwZeHH5v7KbFa1EIJ8kX.V1I.3YbTbR52mhhOB208UNCK3gQ09.WkG
 naZdeCjmgab6p2qP.8kiF0P9f0IkWWKEs6DWev09BsW9YuK0wk3BNCydYWgoGx94E7ncAKyx9Ych
 iQVljzU..8Nh6hFD575GSVsaI1W3dLtytSutSHpCkpA1B0wGeFbDzgkvWLd2QinzsQkDhi58d7.V
 S2v5iHIivjpRoYuwEjfL8iyvFHs11JPNWlT5WM6ATL9zsxiGa8NTOMqLa8DbMHVYzxhT76ESuefb
 6TtE.iSQmUijaidM6NSE3M1z1l5WoLdzIRUyznlcnS_PKmEvwa5pXLhCKptm.W2G6MbuoWRPvYdO
 27fW7v_HqaLgyeOInALPGy3j8qlAX9zggih1YfvTU
X-Sonic-MF: <namiltd@yahoo.com>
X-Sonic-ID: 7e6aefd2-df83-41ab-b79a-8530d4cfee7d
Received: from sonic.gate.mail.ne1.yahoo.com by sonic312.consmr.mail.ne1.yahoo.com with HTTP; Wed, 7 Oct 2026 21:00:36 +0000
Received: by hermes--production-ir2-5dd9bf4598-b6ftf (Yahoo Inc. Hermes SMTP Server) with ESMTPA ID 6a2e4b8a4470d26047b1b225119bc86b;
          Wed, 07 Oct 2026 20:39:55 +0000 (UTC)
Message-ID: <115cfa3a-e3ad-47b4-8ef0-9d0056c24a7a@yahoo.com>
Date: Wed, 7 Oct 2026 22:39:52 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH net-next 5/8] net: dsa: realtek: rtl8365mb: set and get vlan
 4k for family D
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

The hardware structure of 4K VLAN table entries has changed between
silicon families. Family D's CVLAN entry is two 16-bit words rather
than three: there is no third word extending member/untag past bit 7,
and no priority/meter fields at all. The FID field is restricted to a
narrower 2-bit width. The chip itself supports both IVL and SVL, but
this driver always requests IVL for VLAN 4K entries
(rtl8365mb_vlan_4k_port_set() sets ivl_en = true on both families), so
that control bit is forced here to match existing driver behavior,
not a hardware limitation.

Reusing the three-word family C layout unconditionally means the third
word is read from and written back to the register that holds it on
family C, but does not exist as a distinct table word on family D's
die; whatever data happens to be there gets folded into member/untag
bits [10:8] on read, and re-written on every read-modify-write cycle
in rtl8365mb_vlan_4k_port_set(). Give family D its own two-word
pack/unpack instead.

The two-word layout matches the vendor switch API for this chip
family, which writes only 0x0510/0x0511 for a CVLAN entry.

Signed-off-by: Mieczyslaw Nalewaj <namiltd@yahoo.com>
---
 drivers/net/dsa/realtek/rtl8365mb_vlan.c | 143 +++++++++++++++--------
 1 file changed, 94 insertions(+), 49 deletions(-)

diff --git a/drivers/net/dsa/realtek/rtl8365mb_vlan.c b/drivers/net/dsa/realtek/rtl8365mb_vlan.c
index 7add1fb..0466e8c 100644
--- a/drivers/net/dsa/realtek/rtl8365mb_vlan.c
+++ b/drivers/net/dsa/realtek/rtl8365mb_vlan.c
@@ -55,6 +55,7 @@
 
 /* CVLAN (i.e. VLAN4k) table entry layout, u16[3] */
 #define RTL8365MB_CVLAN_ENTRY_SIZE			3 /* 48-bits */
+#define RTL8365MB_D_CVLAN_ENTRY_SIZE			2 /* 32-bits, no 3rd word */
 #define RTL8365MB_CVLAN_ENTRY_D0_MBR_MASK		GENMASK(7, 0)
 #define   RTL8365MB_CVLAN_MBR_LO_MASK			GENMASK(7, 0)
 #define RTL8365MB_CVLAN_ENTRY_D0_UNTAG_MASK		GENMASK(15, 8)
@@ -66,6 +67,10 @@
 #define RTL8365MB_CVLAN_ENTRY_D1_METERIDX_MASK		GENMASK(13, 9)
 #define   RTL8365MB_CVLAN_METERIDX_LO_MASK		GENMASK(4, 0)
 #define RTL8365MB_CVLAN_ENTRY_D1_IVL_SVL_MASK		GENMASK(14, 14)
+#define RTL8365MB_D_CVLAN_ENTRY_D1_SVLAN_CHK_IVL_SVL_MASK \
+							GENMASK(2, 2)
+#define RTL8365MB_D_CVLAN_ENTRY_D1_IVL_EN_MASK		GENMASK(3, 3)
+#define RTL8365MB_D_CVLAN_ENTRY_D1_FID_MASK		GENMASK(1, 0)
 /* extends RTL8365MB_CVLAN_ENTRY_D0_MBR_MASK */
 #define RTL8365MB_CVLAN_ENTRY_D2_MBR_EXT_MASK		GENMASK(2, 0)
 #define   RTL8365MB_CVLAN_MBR_HI_MASK			GENMASK(10, 8)
@@ -191,13 +196,16 @@ struct rtl8365mb_vlanmc {
 static int rtl8365mb_vlan_4k_read(struct realtek_priv *priv, u16 vid,
 				  struct rtl8365mb_vlan4k *vlan4k)
 {
+	bool is_d = rtl8365mb_get_family(priv) == RTL8365MB_FAMILY_D;
+	size_t entry_size = is_d ? RTL8365MB_D_CVLAN_ENTRY_SIZE :
+				   RTL8365MB_CVLAN_ENTRY_SIZE;
 	u16 data[RTL8365MB_CVLAN_ENTRY_SIZE];
 	int val;
 	int ret;
 
 	ret = rtl8365mb_table_query(priv, RTL8365MB_TABLE_CVLAN,
 				    RTL8365MB_TABLE_OP_READ, &vid, 0, 0,
-				    data, ARRAY_SIZE(data));
+				    data, entry_size);
 	if (ret)
 		return ret;
 
@@ -205,33 +213,51 @@ static int rtl8365mb_vlan_4k_read(struct realtek_priv *priv, u16 vid,
 	memset(vlan4k, 0, sizeof(*vlan4k));
 	vlan4k->vid = vid;
 
+	/* member/untag: d0[7:0]/d0[15:8] on both families. Family C
+	 * extends these into data[2] bits [2:0]/[5:3] for its 9th-11th
+	 * ports; family D's die has only 8 ports and no third table
+	 * word, so data[2] does not exist there and must not be read.
+	 */
 	val = FIELD_GET(RTL8365MB_CVLAN_ENTRY_D0_MBR_MASK, data[0]);
 	vlan4k->member = FIELD_PREP(RTL8365MB_CVLAN_MBR_LO_MASK, val);
-	val = FIELD_GET(RTL8365MB_CVLAN_ENTRY_D2_MBR_EXT_MASK, data[2]);
-	vlan4k->member |= FIELD_PREP(RTL8365MB_CVLAN_MBR_HI_MASK, val);
+	if (!is_d) {
+		val = FIELD_GET(RTL8365MB_CVLAN_ENTRY_D2_MBR_EXT_MASK, data[2]);
+		vlan4k->member |= FIELD_PREP(RTL8365MB_CVLAN_MBR_HI_MASK, val);
+	}
 
 	val = FIELD_GET(RTL8365MB_CVLAN_ENTRY_D0_UNTAG_MASK, data[0]);
 	vlan4k->untag = FIELD_PREP(RTL8365MB_CVLAN_UNTAG_LO_MASK, val);
-	val = FIELD_GET(RTL8365MB_CVLAN_ENTRY_D2_UNTAG_EXT_MASK, data[2]);
-	vlan4k->untag |= FIELD_PREP(RTL8365MB_CVLAN_UNTAG_HI_MASK, val);
-
-	vlan4k->fid = FIELD_GET(RTL8365MB_CVLAN_ENTRY_D1_FID_MASK, data[1]);
-	vlan4k->priority_en =
-		FIELD_GET(RTL8365MB_CVLAN_ENTRY_D1_VBPEN_MASK, data[1]);
-	vlan4k->priority =
-		FIELD_GET(RTL8365MB_CVLAN_ENTRY_D1_VBPRI_MASK, data[1]);
-	vlan4k->policing_en =
-		FIELD_GET(RTL8365MB_CVLAN_ENTRY_D1_ENVLANPOL_MASK, data[1]);
-
-	val = FIELD_GET(RTL8365MB_CVLAN_ENTRY_D1_METERIDX_MASK, data[1]);
-	val = FIELD_PREP(RTL8365MB_CVLAN_METERIDX_LO_MASK, val);
-	vlan4k->meteridx = val;
-	val = FIELD_GET(RTL8365MB_CVLAN_ENTRY_D2_METERIDX_EXT_MASK, data[2]);
-	val = FIELD_PREP(RTL8365MB_CVLAN_METERIDX_HI_MASK, val);
-	vlan4k->meteridx |= val;
-
-	vlan4k->ivl_en =
-		FIELD_GET(RTL8365MB_CVLAN_ENTRY_D1_IVL_SVL_MASK, data[1]);
+	if (!is_d) {
+		val = FIELD_GET(RTL8365MB_CVLAN_ENTRY_D2_UNTAG_EXT_MASK, data[2]);
+		vlan4k->untag |= FIELD_PREP(RTL8365MB_CVLAN_UNTAG_HI_MASK, val);
+	}
+
+	if (is_d) {
+		vlan4k->fid = FIELD_GET(RTL8365MB_D_CVLAN_ENTRY_D1_FID_MASK, data[1]);
+		/* Family D has no priority/meter fields in this entry -
+		 * left zeroed by the memset() above.
+		 */
+		vlan4k->ivl_en =
+			FIELD_GET(RTL8365MB_D_CVLAN_ENTRY_D1_IVL_EN_MASK, data[1]);
+	} else {
+		vlan4k->fid = FIELD_GET(RTL8365MB_CVLAN_ENTRY_D1_FID_MASK, data[1]);
+		vlan4k->priority_en =
+			FIELD_GET(RTL8365MB_CVLAN_ENTRY_D1_VBPEN_MASK, data[1]);
+		vlan4k->priority =
+			FIELD_GET(RTL8365MB_CVLAN_ENTRY_D1_VBPRI_MASK, data[1]);
+		vlan4k->policing_en =
+			FIELD_GET(RTL8365MB_CVLAN_ENTRY_D1_ENVLANPOL_MASK, data[1]);
+
+		val = FIELD_GET(RTL8365MB_CVLAN_ENTRY_D1_METERIDX_MASK, data[1]);
+		val = FIELD_PREP(RTL8365MB_CVLAN_METERIDX_LO_MASK, val);
+		vlan4k->meteridx = val;
+		val = FIELD_GET(RTL8365MB_CVLAN_ENTRY_D2_METERIDX_EXT_MASK, data[2]);
+		val = FIELD_PREP(RTL8365MB_CVLAN_METERIDX_HI_MASK, val);
+		vlan4k->meteridx |= val;
+
+		vlan4k->ivl_en =
+			FIELD_GET(RTL8365MB_CVLAN_ENTRY_D1_IVL_SVL_MASK, data[1]);
+	}
 
 	return 0;
 }
@@ -239,6 +265,9 @@ static int rtl8365mb_vlan_4k_read(struct realtek_priv *priv, u16 vid,
 static int rtl8365mb_vlan_4k_write(struct realtek_priv *priv,
 				   const struct rtl8365mb_vlan4k *vlan4k)
 {
+	bool is_d = rtl8365mb_get_family(priv) == RTL8365MB_FAMILY_D;
+	size_t entry_size = is_d ? RTL8365MB_D_CVLAN_ENTRY_SIZE :
+				   RTL8365MB_CVLAN_ENTRY_SIZE;
 	u16 data[RTL8365MB_CVLAN_ENTRY_SIZE] = { 0 };
 	u16 vid;
 	int val;
@@ -250,36 +279,52 @@ static int rtl8365mb_vlan_4k_write(struct realtek_priv *priv,
 	val = FIELD_GET(RTL8365MB_CVLAN_UNTAG_LO_MASK, vlan4k->untag);
 	data[0] |= FIELD_PREP(RTL8365MB_CVLAN_ENTRY_D0_UNTAG_MASK, val);
 
-	data[1] |= FIELD_PREP(RTL8365MB_CVLAN_ENTRY_D1_FID_MASK, vlan4k->fid);
-	data[1] |= FIELD_PREP(RTL8365MB_CVLAN_ENTRY_D1_VBPEN_MASK,
-			      vlan4k->priority_en);
-	data[1] |= FIELD_PREP(RTL8365MB_CVLAN_ENTRY_D1_VBPRI_MASK,
-			      vlan4k->priority);
-	data[1] |= FIELD_PREP(RTL8365MB_CVLAN_ENTRY_D1_ENVLANPOL_MASK,
-			      vlan4k->policing_en);
-
-	/* FIELD_* does not play nice with struct bitfield. */
-	val = vlan4k->meteridx;
-	val = FIELD_GET(RTL8365MB_CVLAN_METERIDX_LO_MASK, val);
-	data[1] |= FIELD_PREP(RTL8365MB_CVLAN_ENTRY_D1_METERIDX_MASK, val);
-
-	data[1] |= FIELD_PREP(RTL8365MB_CVLAN_ENTRY_D1_IVL_SVL_MASK,
-			      vlan4k->ivl_en);
-
-	val = FIELD_GET(RTL8365MB_CVLAN_MBR_HI_MASK, vlan4k->member);
-	data[2] |= FIELD_PREP(RTL8365MB_CVLAN_ENTRY_D2_MBR_EXT_MASK, val);
-
-	val = FIELD_GET(RTL8365MB_CVLAN_UNTAG_HI_MASK, vlan4k->untag);
-	data[2] |= FIELD_PREP(RTL8365MB_CVLAN_ENTRY_D2_UNTAG_EXT_MASK, val);
-
-	val = vlan4k->meteridx;
-	val = FIELD_GET(RTL8365MB_CVLAN_METERIDX_HI_MASK, val);
-	data[2] |= FIELD_PREP(RTL8365MB_CVLAN_ENTRY_D2_METERIDX_EXT_MASK, val);
+	if (is_d) {
+		/* The chip supports both IVL and SVL, but the caller (see
+		 * rtl8365mb_vlan_4k_port_set()) never requests SVL, so both
+		 * IVL/SVL selector bits are forced here rather than threaded
+		 * through from vlan4k->ivl_en, which family C does honor.
+		 */
+		data[1] |= FIELD_PREP(RTL8365MB_D_CVLAN_ENTRY_D1_IVL_EN_MASK, 1) |
+			   FIELD_PREP(RTL8365MB_D_CVLAN_ENTRY_D1_SVLAN_CHK_IVL_SVL_MASK, 1);
+		data[1] |= FIELD_PREP(RTL8365MB_D_CVLAN_ENTRY_D1_FID_MASK, vlan4k->fid);
+		/* No priority/meter/member-untag-extension fields exist in
+		 * family D's 2-word entry - data[1] and data[0] above are
+		 * the whole entry, and data[2] is not part of it at all.
+		 */
+	} else {
+		val = vlan4k->fid;
+		data[1] |= FIELD_PREP(RTL8365MB_CVLAN_ENTRY_D1_FID_MASK, val);
+		data[1] |= FIELD_PREP(RTL8365MB_CVLAN_ENTRY_D1_VBPEN_MASK,
+				      vlan4k->priority_en);
+		data[1] |= FIELD_PREP(RTL8365MB_CVLAN_ENTRY_D1_VBPRI_MASK,
+				      vlan4k->priority);
+		data[1] |= FIELD_PREP(RTL8365MB_CVLAN_ENTRY_D1_ENVLANPOL_MASK,
+				      vlan4k->policing_en);
+
+		/* FIELD_* does not play nice with struct bitfield. */
+		val = vlan4k->meteridx;
+		val = FIELD_GET(RTL8365MB_CVLAN_METERIDX_LO_MASK, val);
+		data[1] |= FIELD_PREP(RTL8365MB_CVLAN_ENTRY_D1_METERIDX_MASK, val);
+
+		data[1] |= FIELD_PREP(RTL8365MB_CVLAN_ENTRY_D1_IVL_SVL_MASK,
+				      vlan4k->ivl_en);
+
+		val = FIELD_GET(RTL8365MB_CVLAN_MBR_HI_MASK, vlan4k->member);
+		data[2] |= FIELD_PREP(RTL8365MB_CVLAN_ENTRY_D2_MBR_EXT_MASK, val);
+
+		val = FIELD_GET(RTL8365MB_CVLAN_UNTAG_HI_MASK, vlan4k->untag);
+		data[2] |= FIELD_PREP(RTL8365MB_CVLAN_ENTRY_D2_UNTAG_EXT_MASK, val);
+
+		val = vlan4k->meteridx;
+		val = FIELD_GET(RTL8365MB_CVLAN_METERIDX_HI_MASK, val);
+		data[2] |= FIELD_PREP(RTL8365MB_CVLAN_ENTRY_D2_METERIDX_EXT_MASK, val);
+	}
 
 	vid = vlan4k->vid;
 	return rtl8365mb_table_query(priv, RTL8365MB_TABLE_CVLAN,
 				     RTL8365MB_TABLE_OP_WRITE, &vid, 0, 0,
-				     data, ARRAY_SIZE(data));
+				     data, entry_size);
 }
 
 static int
-- 
2.53.0

