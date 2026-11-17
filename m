Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=66.163.186.204
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794901353;
	b=sgPgH27bw3bby877X+Vues+ZwtxRWNMrOsW/8putSz/FlBMlUhGgkvuaVe9TKpZDrNoW
	 w+t9rYf29Ho19XYYUSgfmXgRewx8qhLgcrQeOZDtuCDDcgs6KZFNof/tXBMW18tQLOEwq
	 J1+9RLH9P2rqX1EOJwCR9JF4xixWR24z77KH/BcjFMGfBJdYz1Lw+E0yjQsdoL5NbWJV9
	 bs4Ke6x2+Ht41kYWheiMU9HiIgiy/1P+GsvTZWgv7mrP/T1j3E9i83opj3v1YYixG33x1
	 ISmNOzyQgV8MSGPyhgq3yfx3iPv4HtuYJ16GoWU2SJ5XB/XheAU1GUzT0fKL6gtHBQg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794901353;
	h=DMARC-Filter:DKIM-Signature:X-SONIC-DKIM-SIGN:X-YMail-OSG:X-Sonic-MF:
	 X-Sonic-ID:Received:Received:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:From:To:References:Content-Language:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Mailer;
	bh=oFQ/AX7rxhEg/CF3NNHNs9YniPX2OmeLndQWdelwOoQ=;
	b=irlulqwBNikVZgPxsTDNHaH2RLO7lGt2qKvPEXKOAc5Rz54wAWNuK0ASBL5Ownyx9C4L
	 6m23IgOEtMPuJcx0idP+dunczXBiM+42p1JE3T/kwUzf79rSNo6TD49IzWWw6D9ByMzoQ
	 wvhCnAx3gvEA0bZ02mzvpxdzogz5SM9G/3bmhv/myzO1BQBvPbTCpx3T3dG4+dOa70yyN
	 qdJzYivUVn1uQ7V59s/Y7noErY8Cff/W+NMMtcTo1rLTgztgwX0LTxvzGd8UcRHh9rR3y
	 WOzdVntD6NbbWzEP+p41cMBAVJu1Dbp/1YJSUFtayHcMvH1OvMuDvk7/2dqkZa+yEvA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=yahoo.com;
	spf=pass smtp.mailfrom=yahoo.com;
	dkim=pass header.d=yahoo.com header.i=@yahoo.com header.a=rsa-sha256 header.s=s2048 header.b=bk80NApm;
	arc=none smtp.remote-ip=66.163.186.204
Received: from sonic310-23.consmr.mail.ne1.yahoo.com (sonic310-23.consmr.mail.ne1.yahoo.com [66.163.186.204])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E831C606A31C
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 07:42:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E831C606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yahoo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=yahoo.com header.i=@yahoo.com header.a=rsa-sha256 header.s=s2048 header.b=bk80NApm
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1794901351; bh=oFQ/AX7rxhEg/CF3NNHNs9YniPX2OmeLndQWdelwOoQ=; h=Date:Subject:From:To:References:In-Reply-To:Content-Type:From:Subject:Reply-To:Content-Type; b=bk80NApmxpg+GpXLAqsorsh9ZUMUAZZMT4LHOOseN+vpUjSDLo/6Tz76177rR5rzAenmeqi4F/c6/MyZibOWFh90yGivQkKD8E/hcvPOnuqCWH6+k3d1Gqlz/+YLOGDSNVMUzpWfQIR8tUFycM3K1lGQLrhNMlymEntfqsdvCqse1m2RpX40MKMi+A1G4uZTQtItmFVYx3PkBVrI0yXHzjQFCS1/LueGMkPARNOEsdeFElNPcKlfrrzTjRtv0i+dQC91IdAjSAK78fxAXTLZbCs1B1ARfV1m/wh6PwWw03E36lRtM7EuYrCzwwLUVyn9Jzp2XTJI9Byk8mx4VaocTA==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1794901351; bh=eTcAhOIMrksw/Ia90pNbOyJBRGy/l1F8j+V67aLeR1s=; h=X-Sonic-MF:Date:Subject:From:To:From:Subject; b=G9xJHPQ/h46Ctv4KTv7ecjTtgCxQUQ+bSAFpsgs+ixjrjZwhdsuBWa+AqDD3Kn4TSm6jJYWbvLRY8mzDP/Hg9VV4iolhpmhI06vWg8Ogqfp8seyQm2ZXNREcDPp3WnOpBTUj5kHeniOzIyOGIKQsRzDGKIN8D0SObpjnS9FHWYohWBTHfjQX4/rS+YKe+dciTmsfFcfw/ROpeTQ/bc2wFgmVvI0z4Eut6em/CMhpJ3Dwp5RaxsQ3qrOAw5F1oeFMFaUvnyD0GNUNd1eABBXqYeIegWQH3b/OOHEnOYcD9K+pcEFDUrOIUW/KoH00TKgROYd5zGu9fFuVS+kjGNxK4g==
X-YMail-OSG: OyDL8S4VM1kreixmfJj.Mf4zwe5AGFOQrXPc8PTAA7HUPxeBEN6ciT7ADu2LZ85
 1.MCDTsvIDFa9DClAU0sVT6QxRUtiD8DObFsJH8X7mTXrqTvHRp3iIx.FF1LVK3FU7SwlVZIibhB
 29Sc1Z2Q8P4MXUf5q4nouRznThgYag2dKb_0uKwMlPwBrfIbZ2nvUoW9Y8a19Twf4gE5hiD0USLY
 WTZ7OFTHWXJI0uomP25rH.YCZM2.YRvKZhYo6rHUxnDx5.gXMxTFGtudAdE3hs_3M8xPtbQ2gHUe
 GN7ZuDxvAp5Cjyf.k3XXYeqi6CLia0.s7TOMxklMzea6ZXKjCptJGhce6NOpOpB_EUTbCdfCjhlA
 6u9cPXo6SfLolxNWk_X.RpIEwzj0yMCntH2DFHvtmFSkBX3NBMJ64yWOyfxxw4YyALTeRTtPkPOG
 oF4j7kuVD7V054f58iyk8nuokF0xx071lfedE4nDpbfgsi5gXda9MLSEfwvvk35Mn_68EW3qbEzp
 l3pay8pVxu.H.JeSY7l_xsHdvTwJj7._uKHkifJVi_wk3LVW0NyttDP0yJisMMLCnVkwDOCyB9Xs
 JcLgLzncxleL.G_InILkc3CZFDipZLtQYAgrbMt5Ey.2WheBjcqFOgBJPsipZrO31XiW7QiKmBZD
 UJdbuw95iq28s3CdAt8aGqnkEvkCna6ELgmI5AolqBC0AATsYLEAvc.J7aHusXbqZQ2zo1G6ehgP
 cqedgS6mCw5zxxG7ft6FUEgItMWopUOouw6QLaWE9nJVPojR7eiQsHf074DCQc6A4EEBtRYHiDxF
 vw7cmzfbN.uKyol4sa1uOUr4xshEY2cE5GUWg9GojYbfWNxmwZh6zpFdiVjkotohb7gG_4j8_vjm
 wHNOkVnMTBt_gF1EcsmKNzvOqnJY44du7hElk_pF.nO7yN2ESLoM82wOps4mYfV9QB8Y5hDhh82v
 re4b6mCX3ystGHJ.mvBedB5.zHvULPKh8xky3lzsaBI01VEx.XANNWA9xTfAllJjbmfuYT_8J19Z
 24ls.jv_YODwylB8E2m0huqtmhu_7pSK3Nl4myxuwBhD.xYPBRKt9_qGquXW8MTq7OxdjrQ3xWOD
 BkRJ7Ay4My0lT8UgHzz7loEkdmZVGZvnW3lHK0zagEh6Oyl4LwZagkAWbHJLO5yfqEUKLnU.m696
 9aP03osgB2v6jL3DZh5LEtcx1H5UMB3Fns18omOK_80cCBTBdl3rRSszSv_c7KDkIBM8hjXnjDEC
 aP3wSTQ3rb__grgjnsMxPzYGtvPRM56Hz8WqBWb8ty_R4OaEx9nFGxbpKKCr_uTbl7J_Br7XNx5I
 g5OdhpmKDEnnAtrYuzkIuufmBGDOlAo.LR2UO8qNp6Id3CJYPRRRDGO4gmipbeAnusw6c2XTmy3H
 JoOl35vIRkUM1SAbeBEpEWMXWfgXwHHxVHWXT0hEYf.xJvsnhHOkW82dW.GeHbwypA8t0TVlTMOQ
 qWLQBTpITs8OFMJXqCMo1MEKxKEb2C29c3YxtQ_QOxZb7upDbrktXedc6O8D03Jn4H1zxkcO.Eyd
 PuqmFEfwiC9m5YqjevjIUmIOG_K.qdIOQymz39hYix9mo9c53jG9CjHx1764otqoIC625mRKMvSl
 IdRehi2cPW2fz115Bv2oXuxstdmjFgI2RkEtbhC3_g.Y9cNvrIJuCv4J0Y9z_HVZASG0kQutbYRT
 tx.ts2MKAdeXFJwW2CVLVnq2H29un4RzImx20FM4b2IXB6I1MNkgqWjSAYb680Y8P_oi.tYaBC.b
 0Yy7NSO3YCqsOCB5eYOolNfl9kRwlRm85A4s9OgwHARy2RCeLmXJvIRb.uIb.ZWqgK9Q7KZYiVQH
 0ymSJNr7_8I3Vnc95ASH2.zIXo5LbfotRratE0YWsXeKbMfmEfkbQmaI49q2Lh6UflrORRbijoDi
 6k7DIGTFdozUkgosq.t5I3zEWC7vSa5DfjED7MyrL1ZyxWIk50bl8cdz4Ifiwr11c80c4MU0h5NW
 PpxLmerhM8z5MRBSwowp2d3G41BkYp1hIgehnR5n73mcloIchDLea.wDAG0K7bsKOryhVlhLjsce
 wfrZBNFaJzFemXEbiTqXU_H0NvfrjVd4vUONcWwgfbkKqjr8Ol3zrocj04ealV149g3SC2K9dC5q
 YdaWy9jLcqVyUTIw_aivOdqtHS2c6.9OP6eK2CMwH6cC186MIX6JQRpO8p.Rwov41RyTQSXATjNp
 PtBApzJ0CtAYxT0gLzheZB6EslVK5ibrGVoMT_BjXUG92vO1k1SsF5nhfXZRL8DHJcSpoiLFZJ3y
 _o.cXsshsNfL0rXYorW5Gdw--
X-Sonic-MF: <namiltd@yahoo.com>
X-Sonic-ID: e6597f06-4642-4989-891a-77258053e0ad
Received: from sonic.gate.mail.ne1.yahoo.com by sonic310.consmr.mail.ne1.yahoo.com with HTTP; Tue, 17 Nov 2026 07:42:31 +0000
Received: by hermes--production-ir2-5dd9bf4598-jnk89 (Yahoo Inc. Hermes SMTP Server) with ESMTPA ID f481c526c5ea6095c205d70f61927b59;
          Tue, 17 Nov 2026 07:42:26 +0000 (UTC)
Message-ID: <f98ff821-bb91-4bb7-8d8a-0f018312291e@yahoo.com>
Date: Tue, 17 Nov 2026 08:42:24 +0100
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
Subject: [PATCH net-next v11 12/13] net: dsa: realtek: rtl8365mb: make L2/LUT
 access work on family D
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

The L2 lookup table on family D switches (e.g. RTL8367S-VB) differs
from family C in ways that make the current FDB/MDB code misbehave:

 - An L2 entry is 5 words instead of 6, with a different field layout
   in words 3 and 4 (port, age, static and multicast member bits).
 - There is no EFID and no per-bridge FDB isolation. The register at
   0x0A32, used as the per-port EFID register on family C, is the LUT
   aging timer on family D, so writing an EFID there corrupts it.
 - In the table access interface, the SPA field is 3 bits wide and the
   address register is 12 bits wide, with no address extension bit.
 - Only ports 0..7 are present in the LUT and there is no
   FLUSH_PORT_EXT register.
 - A VLAN-unaware bridge reaches the driver with VID 0, where the chip
   learns in SVL (IVL=0, FID=0). An entry programmed by DSA with IVL set
   gets a different key than the learned one for the same MAC, so both
   coexist and the learned one keeps winning.

Teach the table and L2 code about these differences. The L2 entry
layout is selected through struct rtl8365mb_family_info, the other
differences with rtl8365mb_is_d(). Family C behavior is unchanged.

Specifically:

 - rtl8365mb_table: use the family D port mask and address width, and
   read the hit address from status bits [11:0].
 - rtl8365mb_l2: add family D unicast/multicast entry (de)serializers.
   The IVL bit is set only for a non-zero VID, so VID 0 produces the SVL
   key (IVL=0, FID=0) and static unicast and multicast entries match the
   learned ones in a VLAN-unaware bridge. IVL_EN of the VLANs follows
   the VLAN filtering state (see the VLAN 4k patch), so the key matches
   the one the chip learns with in VLAN-unaware and VLAN-aware bridges.
   Entries read back with IVL=0 are reported with VID 0. Use age 6 for
   static unicast entries as the vendor code does.
   Look an entry up before deleting it, so that a missing entry is not
   allocated by the delete; as the key has no EFID, an entry found on
   another port or one that is not static is left alone.
 - rtl8365mb_main: make port_set_efid() a no-op on family D, add a LUT
   init step that clears IPMC_HASH and BCAM_DISABLE and writes 3000 to
   the aging timer register, as dal_rtl8367d_l2_init() does in the
   vendor RTL8367D API (the unit is not documented), and do not
   advertise fdb_isolation. Without EFID the bridges cannot be told apart
   in the LUT, so at most one bridge is offloaded (max_num_bridges = 1).
   Further bridges fall back to software forwarding, and traffic
   between them is isolated by the port isolation masks only.

Without EFID, FID 0 is shared by every port that is not in a VLAN-aware
bridge: standalone ports, ports of bridges left to software and the
offloaded VLAN-unaware bridge. There is no isolation between them in the
LUT, only the port isolation masks. DSA does not program FDB/MDB
entries of standalone ports here, as fdb_isolation is not set, so those
ports get no host address filtering and their traffic goes to the CPU.
A MAC learned in FID 0 on a bridge port may therefore also be hit by
traffic from a standalone port, or from a software-bridged one, until
the entry ages out or is replaced. This was observed by Gustavo Foletto
Mora: with the hosts on standalone ports of the same switch, unicast to
a host was dropped once its MAC had been learned on the VLAN-unaware
bridge side. With learning off on the bridge ports it was forwarded, and
with a VLAN-aware bridge it did not happen.

A host on an offloaded port can use this to keep the MAC of a standalone
port in FID 0 on its own port, so that traffic arriving on the
standalone port for that MAC is dropped until the entry ages out. This
needs a host on the local L2 segment and is bounded by the aging time.
Avoiding it needs a per-bridge FID, which this chip does not have
without EFID, so it is a known limitation.

Register layouts follow the vendor RTL8367D API; the code itself is an
independent implementation.

Tested by Gustavo Foletto Mora on a TP-Link EX511 v2 (RTL8367S-VB, CPU
port 6 over 1G SGMII to an IPQ5018). With a VLAN-aware bridge: per-VID
FDB readback, static entries replacing learned ones and being deleted
again on every port and VID, the same MAC as a static entry on two
VIDs, MDB entries, VLAN add/delete churn, and moving a port to a second
bridge (handled in software). With a VLAN-unaware bridge: a static entry
with VID 0 replaces the learned one and traffic follows it, a static
entry pointing at the ingress port drops the frames, the MAC relearns on
the original port after the delete; traffic to the bridge MAC no longer
floods to the WAN port; MDB entries limit the flood to the group
members and the flood returns after the delete. Unicast and multicast
forwarding were also checked with loopback cables between user ports
(known and unknown unicast, static entries on the wrong port, MDB, 20k
full-size pings without loss or port errors). MACs of foreign ports
(a veth standing in for a Wi-Fi station) become entries on the CPU port
through assisted learning. Real Wi-Fi stations, RGMII and 2500base-x
were not covered by this test. Leaving a dynamic or foreign-port entry
alone in l2_del_uc() was not exercised.

Nothing points to them until the family D info is added together with
the chip table entry in the last patch. Until then they are not static
and are declared in rtl8365mb_l2.h, so that the build does not warn
about unused functions.

Reported-by: Gustavo Foletto Mora <gusfmora@gmail.com>
Closes: https://github.com/openwrt/openwrt/pull/19644#issuecomment-6708118180
Tested-by: Gustavo Foletto Mora <gusfmora@gmail.com>
Tested-by: Stanislaw Pal <kuncy7@gmail.com>
Tested-by: Oleg Gavrilov <gabonpivovich@gmail.com>
Signed-off-by: Mieczyslaw Nalewaj <namiltd@yahoo.com>
---
 drivers/net/dsa/realtek/realtek.h         |   4 +-
 drivers/net/dsa/realtek/rtl8365mb_l2.c    | 126 +++++++++++++++++++++-
 drivers/net/dsa/realtek/rtl8365mb_l2.h    |   6 ++
 drivers/net/dsa/realtek/rtl8365mb_main.c  |  58 +++++++++-
 drivers/net/dsa/realtek/rtl8365mb_table.c |  44 ++++++--
 drivers/net/dsa/realtek/rtl83xx.c         |   5 +-
 6 files changed, 226 insertions(+), 17 deletions(-)

diff --git a/drivers/net/dsa/realtek/realtek.h b/drivers/net/dsa/realtek/realtek.h
index 1c0ca6d..578490f 100644
--- a/drivers/net/dsa/realtek/realtek.h
+++ b/drivers/net/dsa/realtek/realtek.h
@@ -71,7 +71,9 @@ struct realtek_priv {
 	 * create/update it. l2_(add|del)_uc uses a single table op and,
 	 * internally, it might not need this lock. However, altering FDB
 	 * may still collide, as well as l2_flush, with fdb_dump iterating
-	 * over FDB.
+	 * over FDB. On the RTL8367S-VB (family D), l2_del_uc also looks the
+	 * entry up before writing it, as two separate table queries, so it
+	 * does depend on this lock.
 	 */
 	struct mutex		l2_lock;
 	struct mii_bus		*user_mii_bus;
diff --git a/drivers/net/dsa/realtek/rtl8365mb_l2.c b/drivers/net/dsa/realtek/rtl8365mb_l2.c
index cd5b333..e98ba5c 100644
--- a/drivers/net/dsa/realtek/rtl8365mb_l2.c
+++ b/drivers/net/dsa/realtek/rtl8365mb_l2.c
@@ -45,6 +45,21 @@
 #define RTL8365MB_L2_MC_D5_MBR_HI2_MSK		GENMASK(7, 7)
 #define   RTL8365MB_L2_MC_MBR_HI2_MSK		GENMASK(10, 10)
 
+/* Family D unicast (auto-learn / static) entry */
+#define RTL8365MB_D_L2_UC_D3_VID_MSK		GENMASK(11, 0)
+#define RTL8365MB_D_L2_UC_D3_IVL_MSK		BIT(13)
+#define RTL8365MB_D_L2_UC_D3_PORT_LO_MSK	GENMASK(15, 14)
+#define RTL8365MB_D_L2_UC_D4_PORT_HI_MSK	BIT(0)
+#define RTL8365MB_D_L2_UC_D4_AGE_MSK		GENMASK(3, 1)
+#define RTL8365MB_D_L2_UC_D4_STATIC_MSK		BIT(6)
+
+/* Family D multicast entry */
+#define RTL8365MB_D_L2_MC_D3_VID_MSK		GENMASK(11, 0)
+#define RTL8365MB_D_L2_MC_D3_IVL_MSK		BIT(13)
+#define RTL8365MB_D_L2_MC_D3_MBR_LO_MSK		GENMASK(15, 14)
+#define RTL8365MB_D_L2_MC_D4_MBR_HI_MSK		GENMASK(5, 0)
+#define RTL8365MB_D_L2_MC_D4_STATIC_MSK		BIT(6)
+
 /* Port flush command registers - writing a 1 to the port's MASK bit will
  * initiate the flush procedure. Completion is signalled when the corresponding
  * BUSY bit is 0.
@@ -240,6 +255,78 @@ void rtl8365mb_c_l2_mc_to_data(const struct rtl8365mb_l2_mc *mc,
 	data[5] |= FIELD_PREP(RTL8365MB_L2_MC_D5_MBR_HI2_MSK, val);
 }
 
+void rtl8365mb_d_l2_data_to_uc(const u16 *data,
+			       struct rtl8365mb_l2_uc *uc)
+{
+	u16 id = FIELD_GET(RTL8365MB_D_L2_UC_D3_VID_MSK, data[3]);
+
+	rtl8365mb_l2_data_to_mac(data, uc->key.mac_addr);
+	uc->key.ivl = FIELD_GET(RTL8365MB_D_L2_UC_D3_IVL_MSK, data[3]);
+	/* D has one shared VID/FID field, selected by IVL */
+	uc->key.vid = uc->key.ivl ? id : 0;
+	uc->key.fid = uc->key.ivl ? 0 : id;
+	uc->key.efid = 0;
+	uc->port = FIELD_GET(RTL8365MB_D_L2_UC_D3_PORT_LO_MSK, data[3]) |
+		   (FIELD_GET(RTL8365MB_D_L2_UC_D4_PORT_HI_MSK, data[4]) << 2);
+	uc->age = FIELD_GET(RTL8365MB_D_L2_UC_D4_AGE_MSK, data[4]);
+	uc->is_static = FIELD_GET(RTL8365MB_D_L2_UC_D4_STATIC_MSK, data[4]);
+}
+
+void rtl8365mb_d_l2_uc_to_data(const struct rtl8365mb_l2_uc *uc,
+			       u16 *data)
+{
+	/* A VLAN-unaware bridge reaches us with VID 0. The chip learns such
+	 * traffic in SVL (IVL=0, FID=0), so use the same key here, otherwise
+	 * the static entry never matches the learned one. Only a real VID
+	 * selects IVL. IVL_EN of the VLANs follows the VLAN filtering state
+	 * (see rtl8365mb_d_vlan_4k_refresh_ivl()), so this matches the key
+	 * the chip learns with.
+	 */
+	bool ivl = uc->key.ivl && uc->key.vid;
+	u16 id = ivl ? uc->key.vid : uc->key.fid;
+
+	memset(data, 0, RTL8365MB_D_L2_ENTRY_SIZE * 2);
+	rtl8365mb_l2_mac_to_data(uc->key.mac_addr, data);
+	data[3] = FIELD_PREP(RTL8365MB_D_L2_UC_D3_VID_MSK, id) |
+		  FIELD_PREP(RTL8365MB_D_L2_UC_D3_IVL_MSK, ivl) |
+		  FIELD_PREP(RTL8365MB_D_L2_UC_D3_PORT_LO_MSK, uc->port & 0x3);
+	data[4] = FIELD_PREP(RTL8365MB_D_L2_UC_D4_PORT_HI_MSK,
+			     (uc->port >> 2) & 0x1) |
+		  FIELD_PREP(RTL8365MB_D_L2_UC_D4_AGE_MSK, uc->age) |
+		  FIELD_PREP(RTL8365MB_D_L2_UC_D4_STATIC_MSK, uc->is_static);
+}
+
+void rtl8365mb_d_l2_data_to_mc(const u16 *data,
+			       struct rtl8365mb_l2_mc *mc)
+{
+	rtl8365mb_l2_data_to_mac(data, mc->key.mac_addr);
+	mc->key.vid = FIELD_GET(RTL8365MB_D_L2_MC_D3_VID_MSK, data[3]);
+	mc->key.ivl = FIELD_GET(RTL8365MB_D_L2_MC_D3_IVL_MSK, data[3]);
+	mc->member = FIELD_GET(RTL8365MB_D_L2_MC_D3_MBR_LO_MSK, data[3]) |
+		     (FIELD_GET(RTL8365MB_D_L2_MC_D4_MBR_HI_MSK, data[4]) << 2);
+	mc->is_static = FIELD_GET(RTL8365MB_D_L2_MC_D4_STATIC_MSK, data[4]);
+	mc->igmpidx = 0;
+	mc->priority = 0;
+	mc->fwd_pri = 0;
+	mc->igmp_asic = 0;
+}
+
+void rtl8365mb_d_l2_mc_to_data(const struct rtl8365mb_l2_mc *mc,
+			       u16 *data)
+{
+	/* Same as for unicast: VID 0 means a VLAN-unaware bridge, use SVL. */
+	bool ivl = mc->key.ivl && mc->key.vid;
+
+	memset(data, 0, RTL8365MB_D_L2_ENTRY_SIZE * 2);
+	rtl8365mb_l2_mac_to_data(mc->key.mac_addr, data);
+	data[3] = FIELD_PREP(RTL8365MB_D_L2_MC_D3_VID_MSK, mc->key.vid) |
+		  FIELD_PREP(RTL8365MB_D_L2_MC_D3_IVL_MSK, ivl) |
+		  FIELD_PREP(RTL8365MB_D_L2_MC_D3_MBR_LO_MSK, mc->member & 0x3);
+	data[4] = FIELD_PREP(RTL8365MB_D_L2_MC_D4_MBR_HI_MSK,
+			     (mc->member >> 2) & 0x3f) |
+		  FIELD_PREP(RTL8365MB_D_L2_MC_D4_STATIC_MSK, mc->is_static);
+}
+
 /*
  * rtl8365mb_l2_get_next_uc() - get the next Unicast L2 entry
  * @priv: realtek_priv pointer
@@ -310,8 +397,11 @@ int rtl8365mb_l2_add_uc(struct realtek_priv *priv, int port,
 	 * OS's back. As a trade-off, these will show up as permanent to users.
 	 */
 	uc.is_static = true;
-	/* age greater than 0 adds/updates entries */
-	uc.age = 1;
+	/* age greater than 0 adds/updates entries. D has no EFID, so efid
+	 * is not serialized (bridges are isolated by the port isolation
+	 * masks only). Vendor code writes age 6 for D.
+	 */
+	uc.age = rtl8365mb_is_d(priv) ? 6 : 1;
 	fi = rtl8365mb_get_family_info(priv);
 	fi->l2_uc_to_data(&uc, data);
 
@@ -349,6 +439,38 @@ int rtl8365mb_l2_del_uc(struct realtek_priv *priv, int port,
 	fi = rtl8365mb_get_family_info(priv);
 	fi->l2_uc_to_data(&uc, data);
 
+	if (rtl8365mb_is_d(priv)) {
+		struct rtl8365mb_l2_uc found = { 0 };
+
+		/* Do not blind-write: look the entry up first (as the vendor
+		 * code does) so a missing entry is not (re)allocated. The
+		 * lookup and the write are separate table queries, so this
+		 * is not atomic; it relies on FDB operations being
+		 * serialized by the caller.
+		 */
+		ret = rtl8365mb_table_query(priv, RTL8365MB_TABLE_L2,
+					    RTL8365MB_TABLE_OP_READ, &addr,
+					    RTL8365MB_TABLE_L2_METHOD_MAC, 0,
+					    data, fi->l2_entry_size);
+		if (ret == -ENOENT)
+			return 0;
+		if (ret)
+			return ret;
+
+		/* The key has no EFID on family D, so the entry found may
+		 * belong to another port or bridge: leave it alone. DSA only
+		 * programs static entries, so leave a dynamic one alone too,
+		 * as the hardware may have relearned or aged it since the
+		 * lookup.
+		 */
+		fi->l2_data_to_uc(data, &found);
+		if (found.port != port || !found.is_static)
+			return 0;
+
+		/* rebuild the write payload: the read overwrote data[] */
+		fi->l2_uc_to_data(&uc, data);
+	}
+
 	/* it looks like the switch will always add/update the entry,
 	 * even when age is 0 or uc.key did not match an existing entry,
 	 * just to immediately drop it because age is zero. You can still
diff --git a/drivers/net/dsa/realtek/rtl8365mb_l2.h b/drivers/net/dsa/realtek/rtl8365mb_l2.h
index a9f9ae4..5bb4e32 100644
--- a/drivers/net/dsa/realtek/rtl8365mb_l2.h
+++ b/drivers/net/dsa/realtek/rtl8365mb_l2.h
@@ -13,6 +13,7 @@
 #include "realtek.h"
 
 #define RTL8365MB_C_L2_ENTRY_SIZE		6
+#define RTL8365MB_D_L2_ENTRY_SIZE		5
 /* Highest L2 entry size of any supported chip, used for sizing */
 #define RTL8365MB_L2_ENTRY_SIZE			RTL8365MB_C_L2_ENTRY_SIZE
 
@@ -24,6 +25,11 @@ void rtl8365mb_c_l2_uc_to_data(const struct rtl8365mb_l2_uc *uc, u16 *data);
 void rtl8365mb_c_l2_data_to_mc(const u16 *data, struct rtl8365mb_l2_mc *mc);
 void rtl8365mb_c_l2_mc_to_data(const struct rtl8365mb_l2_mc *mc, u16 *data);
 
+void rtl8365mb_d_l2_data_to_uc(const u16 *data, struct rtl8365mb_l2_uc *uc);
+void rtl8365mb_d_l2_uc_to_data(const struct rtl8365mb_l2_uc *uc, u16 *data);
+void rtl8365mb_d_l2_data_to_mc(const u16 *data, struct rtl8365mb_l2_mc *mc);
+void rtl8365mb_d_l2_mc_to_data(const struct rtl8365mb_l2_mc *mc, u16 *data);
+
 int rtl8365mb_l2_get_next_uc(struct realtek_priv *priv, u16 *addr, int port,
 			     struct realtek_fdb_entry *entry);
 int rtl8365mb_l2_add_uc(struct realtek_priv *priv, int port,
diff --git a/drivers/net/dsa/realtek/rtl8365mb_main.c b/drivers/net/dsa/realtek/rtl8365mb_main.c
index 0cec3b6..c7f209b 100644
--- a/drivers/net/dsa/realtek/rtl8365mb_main.c
+++ b/drivers/net/dsa/realtek/rtl8365mb_main.c
@@ -435,6 +435,18 @@
 #define RTL8365MB_LUT_PORT_LEARN_LIMIT_REG(_physport) \
 		(RTL8365MB_LUT_PORT_LEARN_LIMIT_BASE + (_physport))
 
+/* Family D LUT configuration */
+#define RTL8365MB_D_LUT_CFG_REG			0x0A30
+#define   RTL8365MB_D_LUT_CFG_BCAM_DISABLE_MASK	BIT(6)
+#define   RTL8365MB_D_LUT_CFG_IPMC_HASH_MASK	BIT(4)
+/* On family C this address is the per-port EFID register! */
+#define RTL8365MB_D_LUT_CFG2_REG		0x0A32
+/* Written as a whole register, as dal_rtl8367d_l2_init() does in the
+ * vendor API: the field layout and the unit of this value are not
+ * documented.
+ */
+#define   RTL8365MB_D_LUT_AGING_DEFAULT		3000
+
 /* Port isolation (forwarding mask) registers */
 #define RTL8365MB_PORT_ISOLATION_REG_BASE		0x08A2
 #define RTL8365MB_PORT_ISOLATION_REG(_physport) \
@@ -2673,6 +2685,10 @@ static int rtl8365mb_port_pre_bridge_flags(struct dsa_switch *ds, int port,
 static int rtl8365mb_port_set_efid(struct realtek_priv *priv, int port,
 				   u32 efid)
 {
+	/* Family D has no EFID; see RTL8365MB_D_LUT_CFG2_REG. */
+	if (rtl8365mb_is_d(priv))
+		return 0;
+
 	return regmap_update_bits(priv->map, RTL8365MB_PORT_EFID_REG(port),
 				  RTL8365MB_PORT_EFID_MASK(port),
 				  efid << RTL8365MB_PORT_EFID_OFFSET(port));
@@ -3409,6 +3425,23 @@ static int rtl8365mb_change_tag_protocol(struct dsa_switch *ds,
 	return rtl8365mb_cpu_config(priv);
 }
 
+static int rtl8365mb_d_lut_init(struct realtek_priv *priv)
+{
+	int ret;
+
+	/* After the jam table: lookup multicast by MAC (not DIP) and keep
+	 * the CAM enabled.
+	 */
+	ret = regmap_update_bits(priv->map, RTL8365MB_D_LUT_CFG_REG,
+				 RTL8365MB_D_LUT_CFG_IPMC_HASH_MASK |
+				 RTL8365MB_D_LUT_CFG_BCAM_DISABLE_MASK, 0);
+	if (ret)
+		return ret;
+
+	return regmap_write(priv->map, RTL8365MB_D_LUT_CFG2_REG,
+			    RTL8365MB_D_LUT_AGING_DEFAULT);
+}
+
 static int rtl8365mb_switch_init(struct realtek_priv *priv)
 {
 	struct rtl8365mb *mb = priv->chip_data;
@@ -3498,6 +3531,15 @@ static int rtl8365mb_setup(struct dsa_switch *ds)
 		goto out_error;
 	}
 
+	if (rtl8365mb_is_d(priv)) {
+		ret = rtl8365mb_d_lut_init(priv);
+		if (ret) {
+			dev_err(priv->dev, "failed to init LUT: %pe\n",
+				ERR_PTR(ret));
+			goto out_error;
+		}
+	}
+
 	if (mb->sds_supported) {
 		ret = rtl8365mb_sds_raise_rate_limits(priv);
 		if (ret) {
@@ -3623,9 +3665,19 @@ static int rtl8365mb_setup(struct dsa_switch *ds)
 		goto out_teardown_irq;
 
 	ds->assisted_learning_on_cpu_port = true;
-	ds->fdb_isolation = true;
-	/* The EFID is 3 bits, but EFID 0 is reserved for standalone ports */
-	ds->max_num_bridges = FIELD_MAX(RTL8365MB_EFID_MASK);
+	if (!rtl8365mb_is_d(priv)) {
+		ds->fdb_isolation = true;
+		/* The EFID is 3 bits, but EFID 0 is reserved for standalone */
+		ds->max_num_bridges = FIELD_MAX(RTL8365MB_EFID_MASK);
+	} else {
+		/* No EFID, so bridges cannot be told apart in the LUT: allow
+		 * at most one offloaded bridge. Bridge numbers are allocated
+		 * system-wide by DSA, so if another switch already holds
+		 * bridge 1, the bridge here will fall back to software
+		 * forwarding.
+		 */
+		ds->max_num_bridges = 1;
+	}
 
 	ds->configure_vlan_while_not_filtering = true;
 
diff --git a/drivers/net/dsa/realtek/rtl8365mb_table.c b/drivers/net/dsa/realtek/rtl8365mb_table.c
index f3c8749..6b1323f 100644
--- a/drivers/net/dsa/realtek/rtl8365mb_table.c
+++ b/drivers/net/dsa/realtek/rtl8365mb_table.c
@@ -5,6 +5,7 @@
  */
 
 #include "rtl8365mb_table.h"
+#include "rtl8365mb.h"
 #include <linux/regmap.h>
 
 /* Table access control register */
@@ -16,10 +17,13 @@
 /* Should be one of rtl8365mb_table_l2_method enum members */
 #define   RTL8365MB_TABLE_CTRL_METHOD_MASK	GENMASK(6, 4)
 #define   RTL8365MB_TABLE_CTRL_PORT_MASK	GENMASK(11, 8)
+/* Family D: SPA is 3 bits */
+#define   RTL8365MB_D_TABLE_CTRL_PORT_MASK	GENMASK(10, 8)
 
 /* Table access address register */
 #define RTL8365MB_TABLE_ACCESS_ADDR_REG		0x0501
 #define   RTL8365MB_TABLE_ADDR_MASK		GENMASK(12, 0)
+#define   RTL8365MB_D_TABLE_ADDR_MASK		GENMASK(11, 0)
 
 /* Table status register */
 #define RTL8365MB_TABLE_STATUS_REG			0x0502
@@ -29,6 +33,8 @@
 #define   RTL8365MB_TABLE_STATUS_HIT_STATUS_MASK	GENMASK(12, 12)
 #define   RTL8365MB_TABLE_STATUS_BUSY_FLAG_MASK		GENMASK(13, 13)
 #define   RTL8365MB_TABLE_STATUS_ADDRESS_EXT_MASK	GENMASK(14, 14)
+/* Family D: the address is bits [11:0], there is no EXT bit */
+#define   RTL8365MB_D_TABLE_STATUS_ADDRESS_MASK		GENMASK(11, 0)
 
 /* Table read/write registers */
 #define RTL8365MB_TABLE_WRITE_BASE			0x0510
@@ -59,6 +65,7 @@ int rtl8365mb_table_query(struct realtek_priv *priv,
 {
 	bool addr_as_input = true;
 	bool write_data = false;
+	bool is_d = rtl8365mb_is_d(priv);
 	int ret = 0;
 	u32 cmd;
 	u32 val;
@@ -91,7 +98,13 @@ int rtl8365mb_table_query(struct realtek_priv *priv,
 		case RTL8365MB_TABLE_L2_METHOD_ADDR_NEXT_MC:
 			break;
 		case RTL8365MB_TABLE_L2_METHOD_ADDR_NEXT_UC_PORT:
-			cmd |= FIELD_PREP(RTL8365MB_TABLE_CTRL_PORT_MASK, port);
+			if (is_d) {
+				cmd |= FIELD_PREP(RTL8365MB_D_TABLE_CTRL_PORT_MASK,
+						  port);
+			} else {
+				cmd |= FIELD_PREP(RTL8365MB_TABLE_CTRL_PORT_MASK,
+						  port);
+			}
 			break;
 		default:
 			return -EINVAL;
@@ -146,8 +159,9 @@ int rtl8365mb_table_query(struct realtek_priv *priv,
 	if (addr_as_input) {
 		ret = regmap_write(priv->map_nolock,
 				   RTL8365MB_TABLE_ACCESS_ADDR_REG,
-				   FIELD_PREP(RTL8365MB_TABLE_ADDR_MASK,
-					      *addr));
+				   is_d ?
+				   FIELD_PREP(RTL8365MB_D_TABLE_ADDR_MASK, *addr) :
+				   FIELD_PREP(RTL8365MB_TABLE_ADDR_MASK, *addr));
 		if (ret)
 			goto out;
 	}
@@ -177,13 +191,23 @@ int rtl8365mb_table_query(struct realtek_priv *priv,
 		}
 
 		/* If so, extract the address */
-		*addr = 0;
-		*addr |= FIELD_GET(RTL8365MB_TABLE_STATUS_ADDRESS_MASK, val);
-		*addr |= FIELD_GET(RTL8365MB_TABLE_STATUS_ADDRESS_EXT_MASK, val)
-			 << 11;
-		/* only set if it is a L3 address */
-		*addr |= FIELD_GET(RTL8365MB_TABLE_STATUS_ADDR_TYPE_MASK, val)
-			 << 12;
+		if (is_d) {
+			/* Bit 11 is "TYPE" in the register map, but the entry
+			 * index (2048 hash + 64 CAM) needs 12 bits; the vendor
+			 * code reads [11:0] as well.
+			 */
+			*addr = FIELD_GET(RTL8365MB_D_TABLE_STATUS_ADDRESS_MASK,
+					  val);
+		} else {
+			*addr = 0;
+			*addr |= FIELD_GET(RTL8365MB_TABLE_STATUS_ADDRESS_MASK,
+					   val);
+			*addr |= FIELD_GET(RTL8365MB_TABLE_STATUS_ADDRESS_EXT_MASK,
+					   val) << 11;
+			/* only set if it is a L3 address */
+			*addr |= FIELD_GET(RTL8365MB_TABLE_STATUS_ADDR_TYPE_MASK,
+					   val) << 12;
+		}
 	}
 
 	/* Finally, get the table entry if we were reading */
diff --git a/drivers/net/dsa/realtek/rtl83xx.c b/drivers/net/dsa/realtek/rtl83xx.c
index ad42c05..cfe7d42 100644
--- a/drivers/net/dsa/realtek/rtl83xx.c
+++ b/drivers/net/dsa/realtek/rtl83xx.c
@@ -602,7 +602,8 @@ int rtl83xx_port_fdb_add(struct dsa_switch *ds, int port,
 
 	/* Bridge ports use bridge.num as EFID, while standalone ports use
 	 * EFID 0. FDB entries for the CPU port follow the bridge EFID due
-	 * to assisted learning.
+	 * to assisted learning. Chips without an EFID in their L2 table
+	 * (RTL8367S-VB) ignore it in l2_add_uc().
 	 */
 	efid = db.type == DSA_DB_BRIDGE ? db.bridge.num : 0;
 
@@ -654,6 +655,8 @@ int rtl83xx_port_fdb_del(struct dsa_switch *ds, int port,
 	/*
 	 * DSA_DB_BRIDGE ports use bridge number [1..N] as EFID, while
 	 * DSA_DB_PORT use the default EFID (0), not used by any bridge.
+	 * Chips without an EFID in their L2 table (RTL8367S-VB) ignore it in
+	 * l2_del_uc().
 	 */
 	efid = db.type == DSA_DB_BRIDGE ? db.bridge.num : 0;
 
-- 
2.53.0

