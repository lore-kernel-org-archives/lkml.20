Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=66.163.187.148
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794901158;
	b=CBvIefLmFy4yw3GL3u/TsXCyuxLwND/TBF40PnBDQ9q/d3OtqpU6pdvH0eW8OEqbflDL
	 TiYPGpeFBxxPrCcIAnyjfax++15xTHfffgVEyrZyhS1A8ZixgzPIjI13bgjcSabLA+ZY7
	 CLyg/aS1XQT51ZVIemD+XgqEYtZYP+FBwRvetJTVZVuaUJv+EFpCYFJoT3jiPjosb2WQm
	 j6hw4lkN9E8YSj+aAUYrdbjAut2e7E634yLpbQn9T//6JIJL6RcDj0sA1bPs3QvEkoUDc
	 3OW/sJWk+HN7gdn5kiOkNfmZWSMSSpnqBOqz082BYRUMQTa5uoM+3Pji43pp9x8fBvQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794901158;
	h=DMARC-Filter:DKIM-Signature:X-SONIC-DKIM-SIGN:X-YMail-OSG:X-Sonic-MF:
	 X-Sonic-ID:Received:Received:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:From:To:References:Content-Language:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Mailer;
	bh=ZEJqQopEVGdySv4Myvg+c3gYz9XwIZ0cMLiWlgz5+bU=;
	b=v7ccn6jagdthRPZD181VrNiymComM2sBJx1EgG0iIhkosKv/xPUY1Xe5E/A2yDrdi3Ym
	 M39QFtf0iUiydm7/C+ZKgEP4q6hGAFNKT89ziXkFIIiXufmLWFFuhVfDo3RknmCs3PppQ
	 Dj3HFljFi9uTa6/LtjcEM8VJep0UbS/O0ZZrLggeIxqG/A/fnIU9JLkPddhF9LuTJnbqD
	 iZ1BZoXOMLsiJ5+AUwM+reUCrxz1dbRwptfJW4RiWpe+ZsDP85AoZOrmqLVJsHBHwtmhX
	 FY/MtMVGm6uzrTPJiUa3MBBXvf8wxTk0xapul0urmaCgKi6hgIxtuvQKZB3tcCH1vMA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=yahoo.com;
	spf=pass smtp.mailfrom=yahoo.com;
	dkim=pass header.d=yahoo.com header.i=@yahoo.com header.a=rsa-sha256 header.s=s2048 header.b="b/XK70u8";
	arc=none smtp.remote-ip=66.163.187.148
Received: from sonic316-22.consmr.mail.ne1.yahoo.com (sonic316-22.consmr.mail.ne1.yahoo.com [66.163.187.148])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5190606A323
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 07:39:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C5190606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yahoo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=yahoo.com header.i=@yahoo.com header.a=rsa-sha256 header.s=s2048 header.b=b/XK70u8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1794901156; bh=ZEJqQopEVGdySv4Myvg+c3gYz9XwIZ0cMLiWlgz5+bU=; h=Date:Subject:From:To:References:In-Reply-To:Content-Type:From:Subject:Reply-To:Content-Type; b=b/XK70u8kWymQqay9h1w55x5moWeAxXGuM3+GspyeHSnaZ2gIZWNdVTDm8rsfjJb6T3ZoRzMtIwY0x7LPslwo/6JN6gkuMbuZR6OYOQOctswrpXbufR4SCB2nUY7th0nQY/yibXz9909DB66ZQmmh1UkipCLiQaxVN4r2I03jmAYe4AWEwPAazejCFdn5/dkzJXwPHbYPka4G1L8yNwIA6JPrpX1QRITRRzDnsRzW7wBciBbZLwhy1/1UCYFBq313Bl9eroKR7C8BuwR9AX8UcxG8Glfq592yMc4tqdbrYyl8c4j604d+To/hzCXUoT2rvFEP15+pgsJrjXIbZ3nng==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1794901156; bh=E5H+LXLamFT67kdU5UOoEtXwLYYMDzfxYKSgZFsHNUd=; h=X-Sonic-MF:Date:Subject:From:To:From:Subject; b=c/ZHJvdXU/DCosRz2NE4hXuFvjZHd+gXFb3Faf5QiMBSQb7CWmAbN9qwLCETIjqF4WkKg7X6weu3vfDjLg3r0ZugiX+oTaHPAgFGRv/7OqE0JTNLA97PupM36LIgYSGsOiAntETCrMCTu3vhB1Y8w6s8CfykZe+THd+T2AkgindH+YePXzJmSDIGGQA9K+t3R5iSsb8H4wDOC6dsdFjydrWgz1Qkx0EyKo+9ZI7ckk+fh5Sk4ocoBxRaP08vy3w0/LnFygfTuxa7Q10a2nvWYCp5luDPoFTrXSYeXIRD4s7fefpDT1A29pY5X+PdVIW4NIU/xDiW739901MxY590Pg==
X-YMail-OSG: fGMWKLUVM1mJdgp9AALeijavgwonekL0Ue4dTB5.6js4ie2wmHa8pe3i13fItIB
 yfWpBbTM8OilS_j77oo83UDTOMAVWgezgi24tA1Qx4KHwsTb4QsLM34AnAQDVTE.iUY097T2ZnAu
 TK2YksCb1MMg6_VX1oFh7qoNr5sA6l_8TdwYUOpWOztnBwimXiZHRZxIa2r_wW38Lx2gzQ0rW2N6
 1_aL5T9ndqCa7K84p_Fd167sk2_3D.4zePmeKNT7dkRnbGJl_rNO6MIm9UiPHoPN1h4yQ_z_E7o2
 3hTjNdXbgCyA1Y05CPSmHhL8NskK8NryyvP2zL9.PUeC1GUln5h2zdZMXCg3zmFmw490nrGLb36Z
 JfVtv.U5DRV6k7r3d5bybtLPHDDau7wGUo9SLzgkBTgzSOcYFrfoI38WDOQd42W8cQzl_CO7ZJBi
 044k0oZquYRSpK2MC.4N3r8yMyxRfaEDCf.LSnxdxzpBbY018tqFvVc6YAzWGyyqVO4RYfJrVCC6
 r5NQg__o9XtKoaMJCyUI8UrSpjYiuTDG5U7C3Ss1bAodc2Ye9t58GZL13y7GZofPvRMgKPoLNjHr
 IcicYxM5brXWgLawGQi.zrF2uHhnsiHOXgyShm722piLJhYyAt.eyxVLeY5_lEl_0.tVF43CEGyL
 h16hLxp6EtVJfb2piSwwbp2SjkaAsKKclsIeDGwYgRt54PBWilPLgGBu83JvE8wTcHK03eHbLVtP
 dePLAZM0O5dKkfm3gzEBu_p.M9j0rizgCVQPDtFs_ui4w7pWL9Gy13ZkzE53vx8UKMKjB0NG9ZUG
 p3CGGwIeEQAlk4M9fFx3nmxUAtEFrhCI1XXZp2orxi83qq3OdXQ2rIvoBgxgfc7XMmH.6OdX8pil
 m2ZoFvMjc5Az9W_kXQGZc9bArXDvOo_SOj8RWvtYtwAHJbtNMQGo.bE.yMyP_4LM0owQIT2uNx2T
 KmaHWwRmOb_tCID5yIXY9FsXx81ew.7nkzwhWv0GZVk9Zv3qnxWjtWEiRwmFkJMeDFOCcYJh3OJo
 IFLCiWZoIRTzj8CeF8ZNlJKuAQ9zGyxoBIReySmY_5XJPCiFBrt42YKK.z2gYZ2vD9aBoTXaRVD7
 ksCW0yxLHPg8kPgm8pMPn5gOZuzDtRfnj9Vdm5tRf4RdlUrAGGMa.5UTNUZfe3mxjzdTT.Du1_y5
 hprucFlRz_jfqNLK_88RrOHglk7pROLhIDaM2ytAspTEir3zQtMoXkTaopJarfO3hSFpfW_jud52
 4AaIYnaz8yqQDBWp1EynIFqaGZ6UoCi1YrNcivWTKULon.xS9MQVfjucCKMoArUHi.UiTsmd5yoW
 q8iVWWzCizFrC8JE3u52oiuuavW_exOsqljVJwTLFq20wX36110p9P5ASj7OTyivJAsl4ygtGBUL
 ydnI_DQTet.un1oGeMZQ0zHOgrbf66k5G7iiZK2d1w1AK_d_XcVWozXJbGF1vENUdyJFlRa6uFH2
 7qGYpIN2kG4FO5.1LxwPUOSh76WJXIknN8_C4KBcH0Q7jiLpJyQtoOwclwNaKw1YrnVl2Kh33fFO
 0K.dHzFVHKuJqPJzKqM8T24zcbIIipyFPOMCQ65lbaOtda8wr506XJcsKk5HnP3xLIkI8EGVI7h_
 Baw1IqIEWnmSwNWD2fh9zyBl59ocYj0YwwDvbo.WfTrYCk1Pnc.6gJIWajqS37yxBeETO5yYcajn
 rOJ.YGnm2ux4rEOqu5B5N130tszrRE5Yaat4OV_SADaSuK0zskUk6I9_tMSSmZI3phhb.Tv9mmmw
 8WWtAcEinPkaqVXrvqiO.e38JgW1JwYP2fFOL0hZPmGvVbkg98_ONeu.GfUXhC79XQeN6Ao6dcrh
 T0fynq9YZe.R9Lud3yOqa6lJRNS0mPGcxGbCVS_gOxWuDFcw0V7GUaG8J.0AiBahtyMPly45pd6x
 pQB3Q87V5uvPaEcr2JwkhBt0kvjspSXZV9iu62arwvi32v5.KjzJ6cqH5MWcf4CijPm_pQKSHJFW
 ZUEmYNMji2cQy7e6veUKtLkkIb1dw.zOzlmZoDdDaD.mONk_o2UQnz2xNgdq5Hf1kmtDgHdMSHQ6
 UnPbCQiglcVASVr3E3vpbfmsVicC6uADAV4QUua9aH0aFSXmsDQB82zbONSjMoYzcsv2rdwfYWyk
 GghNh.iSLae2zjgJ5nK5cTxwvVIqvJQOfxL9UV9KXhfck3d.IDT93CrgPepvpxzNS6_f3t8A2Au0
 yfs6ulBggOH8IqleljKr9CVtXmJzgCE3UwDpzzAODj8534oswqlSJjz_lecKrd_TijU0P7F3rlr3
 lz5fQRqOmU7pHHAo-
X-Sonic-MF: <namiltd@yahoo.com>
X-Sonic-ID: 860bb0a9-2dbb-4af4-85fd-ef0dd80ee6d2
Received: from sonic.gate.mail.ne1.yahoo.com by sonic316.consmr.mail.ne1.yahoo.com with HTTP; Tue, 17 Nov 2026 07:39:16 +0000
Received: by hermes--production-ir2-5dd9bf4598-jnk89 (Yahoo Inc. Hermes SMTP Server) with ESMTPA ID 017051a6af6b61118c9ce28919ec172c;
          Tue, 17 Nov 2026 07:39:11 +0000 (UTC)
Message-ID: <7edbdf93-91e1-4dd1-9ecf-35863cecc277@yahoo.com>
Date: Tue, 17 Nov 2026 08:39:10 +0100
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
Subject: [PATCH net-next v11 07/13] net: dsa: realtek: rtl8365mb: set and get
 vlan 4k for family D
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

The hardware structure of 4K VLAN table entries has changed between
silicon families. Family D's CVLAN entry is two 16-bit words rather
than three: there is no third word extending member/untag past bit 7,
and no priority/meter fields at all. The FID field is restricted to a
narrower 2-bit width. The chip itself supports both IVL and SVL.

IVL_EN (bit 3, versus bit 14 on family C) follows vlan4k->ivl_en. On
family D, rtl8365mb_vlan_4k_port_set() enables it while any user port
has VLAN filtering enabled (dsa_port_is_vlan_filtering()), so that
static and learned FDB/MDB entries use the same key. Family C keeps IVL
always enabled, as before.

When a vlan_filtering change flips this switch-wide state,
rtl8365mb_d_vlan_4k_refresh_ivl() updates IVL_EN across the active 4K
entries, so existing VLANs, including those programmed before filtering
was enabled, switch between SVL and IVL immediately. Changes that leave
the state as it is do not touch the table, as the update reads every
entry.

Reusing the three-word family C layout on family D would read a third
word that does not exist as a distinct table word on family D's die.
Whatever data happens to be in that register would be folded into
member/untag bits [10:8] on read, and written back on every
read-modify-write cycle in rtl8365mb_vlan_4k_port_set(). Give family D
its own two-word pack/unpack instead: add rtl8365mb_d_vlan_4k_read() and
rtl8365mb_d_vlan_4k_write(). The shared code reaches them through the
vlan_4k_read and vlan_4k_write pointers in struct rtl8365mb_family_info,
so the pack/unpack code needs no is_d() check.

The two-word layout matches the vendor switch API for this chip
family, which writes only 0x0510/0x0511 for a CVLAN entry.

Nothing points to them until the family D info is added together with
the chip table entry in the last patch. Until then they are not static
and are declared in rtl8365mb_vlan.h, so that the build does not warn
about unused functions.

Signed-off-by: Mieczyslaw Nalewaj <namiltd@yahoo.com>
---
 drivers/net/dsa/realtek/rtl8365mb_main.c |  13 ++
 drivers/net/dsa/realtek/rtl8365mb_vlan.c | 144 ++++++++++++++++++++++-
 drivers/net/dsa/realtek/rtl8365mb_vlan.h |   7 ++
 3 files changed, 162 insertions(+), 2 deletions(-)

diff --git a/drivers/net/dsa/realtek/rtl8365mb_main.c b/drivers/net/dsa/realtek/rtl8365mb_main.c
index 07e0486..c693046 100644
--- a/drivers/net/dsa/realtek/rtl8365mb_main.c
+++ b/drivers/net/dsa/realtek/rtl8365mb_main.c
@@ -2285,8 +2285,21 @@ static int rtl8365mb_port_vlan_filtering(struct dsa_switch *ds, int port,
 	if (ret)
 		goto undo_set_framefilter;
 
+	if (rtl8365mb_is_d(priv)) {
+		mutex_lock(&priv->vlan_lock);
+		ret = rtl8365mb_d_vlan_4k_refresh_ivl(ds, port, vlan_filtering);
+		mutex_unlock(&priv->vlan_lock);
+		if (ret)
+			goto undo_egress_mode;
+	}
+
 	return ret;
 
+undo_egress_mode:
+	/* The previous state was the opposite of the new one, see below */
+	(void)rtl8365mb_port_set_vlan_egress_mode(priv, port,
+		vlan_filtering ? RTL8365MB_VLAN_EGRESS_MODE_REAL_KEEP :
+				 RTL8365MB_VLAN_EGRESS_MODE_ORIGINAL);
 undo_set_framefilter:
 	if (prev_accepted_frame != accepted_frame)
 		rtl8365mb_vlan_port_set_framefilter(priv, port,
diff --git a/drivers/net/dsa/realtek/rtl8365mb_vlan.c b/drivers/net/dsa/realtek/rtl8365mb_vlan.c
index 566c6bc..f3ac294 100644
--- a/drivers/net/dsa/realtek/rtl8365mb_vlan.c
+++ b/drivers/net/dsa/realtek/rtl8365mb_vlan.c
@@ -50,11 +50,15 @@
 #include "rtl8365mb_table.h"
 #include "rtl8365mb.h"
 #include <linux/if_bridge.h>
+#include <linux/if_vlan.h>
 #include <linux/lockdep.h>
 #include <linux/regmap.h>
 
-/* CVLAN (i.e. VLAN4k) table entry layout, u16[3] */
+/* CVLAN (i.e. VLAN4k) table entry layout: u16[3] on family C, u16[2] on
+ * family D
+ */
 #define RTL8365MB_C_CVLAN_ENTRY_SIZE			3 /* 48-bits */
+#define RTL8365MB_D_CVLAN_ENTRY_SIZE			2 /* 32-bits */
 #define RTL8365MB_CVLAN_ENTRY_D0_MBR_MASK		GENMASK(7, 0)
 #define   RTL8365MB_CVLAN_MBR_LO_MASK			GENMASK(7, 0)
 #define RTL8365MB_CVLAN_ENTRY_D0_UNTAG_MASK		GENMASK(15, 8)
@@ -66,6 +70,9 @@
 #define RTL8365MB_CVLAN_ENTRY_D1_METERIDX_MASK		GENMASK(13, 9)
 #define   RTL8365MB_CVLAN_METERIDX_LO_MASK		GENMASK(4, 0)
 #define RTL8365MB_CVLAN_ENTRY_D1_IVL_SVL_MASK		GENMASK(14, 14)
+/* Family D CVLAN entry, word 1 (family D has no word 2) */
+#define RTL8365MB_D_CVLAN_ENTRY_D1_IVL_EN_MASK		GENMASK(3, 3)
+#define RTL8365MB_D_CVLAN_ENTRY_D1_FID_MASK		GENMASK(1, 0)
 /* extends RTL8365MB_CVLAN_ENTRY_D0_MBR_MASK */
 #define RTL8365MB_CVLAN_ENTRY_D2_MBR_EXT_MASK		GENMASK(2, 0)
 #define   RTL8365MB_CVLAN_MBR_HI_MASK			GENMASK(10, 8)
@@ -231,6 +238,45 @@ int rtl8365mb_c_vlan_4k_read(struct realtek_priv *priv, u16 vid,
 	return 0;
 }
 
+int rtl8365mb_d_vlan_4k_read(struct realtek_priv *priv, u16 vid,
+			     struct rtl8365mb_vlan4k *vlan4k)
+{
+	u16 data[RTL8365MB_D_CVLAN_ENTRY_SIZE];
+	int val;
+	int ret;
+
+	ret = rtl8365mb_table_query(priv, RTL8365MB_TABLE_CVLAN,
+				    RTL8365MB_TABLE_OP_READ, &vid, 0, 0,
+				    data, RTL8365MB_D_CVLAN_ENTRY_SIZE);
+	if (ret)
+		return ret;
+
+	/* Unpack table entry */
+	memset(vlan4k, 0, sizeof(*vlan4k));
+	vlan4k->vid = vid;
+
+	/* member/untag: d0[7:0]/d0[15:8] on both families. Family C
+	 * extends these into data[2] bits [2:0]/[5:3] for its 9th-11th
+	 * ports; family D's die has only 8 ports and no third table
+	 * word, so data[2] does not exist there and must not be read.
+	 */
+	val = FIELD_GET(RTL8365MB_CVLAN_ENTRY_D0_MBR_MASK, data[0]);
+	vlan4k->member = FIELD_PREP(RTL8365MB_CVLAN_MBR_LO_MASK, val);
+
+	val = FIELD_GET(RTL8365MB_CVLAN_ENTRY_D0_UNTAG_MASK, data[0]);
+	vlan4k->untag = FIELD_PREP(RTL8365MB_CVLAN_UNTAG_LO_MASK, val);
+
+	vlan4k->fid = FIELD_GET(RTL8365MB_D_CVLAN_ENTRY_D1_FID_MASK,
+				data[1]);
+	/* Family D has no priority/meter fields in this entry -
+	 * left zeroed by the memset() above.
+	 */
+	vlan4k->ivl_en = FIELD_GET(RTL8365MB_D_CVLAN_ENTRY_D1_IVL_EN_MASK,
+				   data[1]);
+
+	return 0;
+}
+
 int rtl8365mb_c_vlan_4k_write(struct realtek_priv *priv,
 			      const struct rtl8365mb_vlan4k *vlan4k)
 {
@@ -277,6 +323,96 @@ int rtl8365mb_c_vlan_4k_write(struct realtek_priv *priv,
 				     data, ARRAY_SIZE(data));
 }
 
+int rtl8365mb_d_vlan_4k_write(struct realtek_priv *priv,
+			      const struct rtl8365mb_vlan4k *vlan4k)
+{
+	/* Unknown bits of word 1 are written as zero, same as the vendor
+	 * API does for this chip family.
+	 */
+	u16 data[RTL8365MB_D_CVLAN_ENTRY_SIZE] = { 0 };
+	u16 vid;
+	int val;
+
+	/* Pack table entry value */
+	val = FIELD_GET(RTL8365MB_CVLAN_MBR_LO_MASK, vlan4k->member);
+	data[0] |= FIELD_PREP(RTL8365MB_CVLAN_ENTRY_D0_MBR_MASK, val);
+
+	val = FIELD_GET(RTL8365MB_CVLAN_UNTAG_LO_MASK, vlan4k->untag);
+	data[0] |= FIELD_PREP(RTL8365MB_CVLAN_ENTRY_D0_UNTAG_MASK, val);
+
+	data[1] |= FIELD_PREP(RTL8365MB_D_CVLAN_ENTRY_D1_IVL_EN_MASK,
+			      vlan4k->ivl_en);
+	data[1] |= FIELD_PREP(RTL8365MB_D_CVLAN_ENTRY_D1_FID_MASK,
+			      vlan4k->fid);
+	/* No priority/meter/member-untag-extension fields exist in
+	 * family D's 2-word entry - data[1] and data[0] above are
+	 * the whole entry, and data[2] is not part of it at all.
+	 */
+
+	vid = vlan4k->vid;
+	return rtl8365mb_table_query(priv, RTL8365MB_TABLE_CVLAN,
+				     RTL8365MB_TABLE_OP_WRITE, &vid, 0, 0,
+				     data, RTL8365MB_D_CVLAN_ENTRY_SIZE);
+}
+
+/* Family D has no EFID, so a VLAN-unaware bridge must learn in SVL (IVL=0,
+ * FID=0) to match static FDB/MDB entries programmed with VID 0. Use IVL only
+ * while at least one user port is VLAN-filtering. @port/@filtering override
+ * the state of the port currently being changed, as DSA updates
+ * dp->vlan_filtering only after the driver callback returns.
+ */
+static bool rtl8365mb_d_want_ivl(struct dsa_switch *ds, int port,
+				 bool filtering)
+{
+	struct dsa_port *dp;
+
+	dsa_switch_for_each_user_port(dp, ds) {
+		if (dp->index == port ? filtering :
+					dsa_port_is_vlan_filtering(dp))
+			return true;
+	}
+
+	return false;
+}
+
+/* Must be called with &priv->vlan_lock held. */
+int rtl8365mb_d_vlan_4k_refresh_ivl(struct dsa_switch *ds, int port,
+				    bool filtering)
+{
+	const struct rtl8365mb_family_info *fi;
+	struct realtek_priv *priv = ds->priv;
+	struct rtl8365mb_vlan4k vlan4k;
+	bool want_ivl;
+	u16 vid;
+	int ret;
+
+	lockdep_assert_held(&priv->vlan_lock);
+
+	want_ivl = rtl8365mb_d_want_ivl(ds, port, filtering);
+	/* The scan below reads every entry, so do it only if this change flips
+	 * the switch-wide state, not for each port of a bridge.
+	 */
+	if (want_ivl == rtl8365mb_d_want_ivl(ds, -1, false))
+		return 0;
+
+	fi = rtl8365mb_get_family_info(priv);
+
+	for (vid = 1; vid < VLAN_N_VID; vid++) {
+		ret = fi->vlan_4k_read(priv, vid, &vlan4k);
+		if (ret)
+			return ret;
+		if (!vlan4k.member || vlan4k.ivl_en == want_ivl)
+			continue;
+
+		vlan4k.ivl_en = want_ivl;
+		ret = fi->vlan_4k_write(priv, &vlan4k);
+		if (ret)
+			return ret;
+	}
+
+	return 0;
+}
+
 static int
 rtl8365mb_vlan_4k_port_set(struct dsa_switch *ds, int port,
 			   const struct switchdev_obj_port_vlan *vlan,
@@ -314,7 +450,11 @@ rtl8365mb_vlan_4k_port_set(struct dsa_switch *ds, int port,
 		vlan4k.untag |= BIT(port);
 	else
 		vlan4k.untag &= ~BIT(port);
-	vlan4k.ivl_en = true; /* always use Independent VLAN Learning */
+
+	if (!rtl8365mb_is_d(priv))
+		vlan4k.ivl_en = true;
+	else
+		vlan4k.ivl_en = rtl8365mb_d_want_ivl(ds, -1, false);
 
 	ret = fi->vlan_4k_write(priv, &vlan4k);
 	if (ret) {
diff --git a/drivers/net/dsa/realtek/rtl8365mb_vlan.h b/drivers/net/dsa/realtek/rtl8365mb_vlan.h
index 009b127..625d4c1 100644
--- a/drivers/net/dsa/realtek/rtl8365mb_vlan.h
+++ b/drivers/net/dsa/realtek/rtl8365mb_vlan.h
@@ -24,6 +24,10 @@ int rtl8365mb_c_vlan_4k_read(struct realtek_priv *priv, u16 vid,
 			     struct rtl8365mb_vlan4k *vlan4k);
 int rtl8365mb_c_vlan_4k_write(struct realtek_priv *priv,
 			      const struct rtl8365mb_vlan4k *vlan4k);
+int rtl8365mb_d_vlan_4k_read(struct realtek_priv *priv, u16 vid,
+			     struct rtl8365mb_vlan4k *vlan4k);
+int rtl8365mb_d_vlan_4k_write(struct realtek_priv *priv,
+			      const struct rtl8365mb_vlan4k *vlan4k);
 
 int rtl8365mb_vlan_port_get_pvid(struct realtek_priv *priv, int port,
 				 u16 *pvid);
@@ -43,4 +47,7 @@ int rtl8365mb_vlan_4k_port_del(struct dsa_switch *ds, int port,
 int rtl8365mb_vlan_pvid_port_set(struct dsa_switch *ds, int port, u16 vid,
 				 struct netlink_ext_ack *extack);
 int rtl8365mb_vlan_pvid_port_clear(struct dsa_switch *ds, int port, u16 vid);
+
+int rtl8365mb_d_vlan_4k_refresh_ivl(struct dsa_switch *ds, int port,
+				    bool filtering);
 #endif /* _REALTEK_RTL8365MB_VLAN_H */
-- 
2.53.0

