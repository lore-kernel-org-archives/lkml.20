Received: from sonic317-32.consmr.mail.ne1.yahoo.com (sonic317-32.consmr.mail.ne1.yahoo.com [66.163.184.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EBC33DB626
	for <linux-kernel@vger.kernel.org>; Wed,  7 Oct 2026 20:48:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=66.163.184.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791406117; cv=none; b=kwsAqxR0Ue0W9bZZanu5HC4CvBnuGrlT6diORSLBUIXdna8G10S/5+u30kA+4r48OMBLbkmqyNeVS9DDEwvCbOsljPRCsxmf08Uz7mPedKuosBbAmFbd+c0SjVLw4C7uEse83oVCLQgPJ2E06ItaWktEzilnezGDiZoPqJiex9s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791406117; c=relaxed/simple;
	bh=0yBeeJwIUgXKipszSVlZlxU59rWlgzL3tH/q6hHa+Js=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:References:
	 In-Reply-To:Content-Type; b=BIh2V40xokKipOPgjwB+buRVTqE4G+4hDB4fEH9esO4/fled9pcy+mMEVghiLCCxToNs9uXw+ccs0gMTBDiiTQl1zQCu4NNq76WW4venwirVf84FioRKGKG6zCd4wkTOtoSeSU1uKjAouEj/kSdgwYJkasqvhfahu8P5BzNXO10=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.com; spf=pass smtp.mailfrom=yahoo.com; dkim=pass (2048-bit key) header.d=yahoo.com header.i=@yahoo.com header.b=cqVKpSQ4; arc=none smtp.client-ip=66.163.184.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yahoo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=yahoo.com header.i=@yahoo.com header.b="cqVKpSQ4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1791406115; bh=i/tb82rGNDSqM7lyf7uiX/jOmb8jPP86M3hO58k9O9Y=; h=Date:Subject:From:To:References:In-Reply-To:From:Subject:Reply-To; b=cqVKpSQ4GEdmSBKcBHlWkaxEsAczhfGfsuw8cZF0qlzfezwXE6wa9jpbxPPM3HpF6kXfqfA9g+2NDy+pdETfLMuLwI+xxWQ+DFTzl4wum3F8njs7ZtvPyBexLwiNy6eZSLjffL8fv9/S0/9Twxi8H6aWemZJ8LvG0PnR88Wk3FhHNO3F080k2G4OHCot5vuA1GFdSkIYoDtLZTlYx4xTLXgcD5cRF9v9xxcvQq0VKS7xLYT7oNz8oM558YvPYxPB2b57ujHSdVlet5NFDmPeU8+hppAOvVudPSbHX6VRrnVPcTZlBaYb6P+NnFZ/gwss6ZR5oQu0Ub7eIbh2KKWP5g==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1791406115; bh=kgCKS8HroGnANNXnS47Gb754p5LJINww/mK1J9hDbvg=; h=X-Sonic-MF:Date:Subject:From:To:From:Subject; b=gI3tBh0VhogFognDQbcI1DvJcrOc9vK+uPVJlTuU0fd0/RdH1QmYyFJ/0PpCC6mUrFQMOAO0GmdjSkQ3ByCt73PRVuaGeb+W3IRbh7Vscrw0j8a6DNEV5T9COnxxXtjDmd3X/aHDLzkA6VzQ/J5vL5sE5RCne9g0sQhtN22kE/9BMIE1Hv5Bc8u7WNLZhVgmkRPBDxVHIh2li7wV+WsaRt8S3F4p0JnP0sZvtYjHgH8uuvhLpkNe6BAYrUzHUdtIrI6+r5e27KDGa//KtV7QqTGTmWDzzrSruXHrYZxi41u6fzqp2UItjVpdceGX10Q1flaap4L5KoKUaUB/cnE1Zw==
X-YMail-OSG: 7yDbpHUVM1kJkNaDOZfomh.aeBJPXXNk8yGzhWpgOEwJKDZgU2gk8LlW9TYEyER
 9syDb7yGHJmN4jXSYHdCjeDUw7l3Fo2d4it7Q88rIv.299VeqA0BO9mf6m2gA0DtffZQ1u7vsCPd
 kK93bH5REZXlJVTb27g1bU.BHBdO3GtxVnwfhgZTHqE75RXBIxjUgGr4s_0pBwzaTdhnhuhP5F2N
 ntkdebE6_3YYEoK8n1196LrYBMX3JWeMbExgj5vBqly_m.XjtYOIxvtiT28KkUe3Ppgo11JqUhly
 DR4sdY_Rpoc4ypgXxb9vjGGKKE3AQCcA4hHVh4cMRB80S4fI8IvqJnXKlWZd_6Fayy4V8uQ4qj2G
 nBBpKViDdH209SpwYXU_fJ5Ko3uF253esbxNAiKKd4OlJkocRdLpweR6.Rzn9FmMLJHmcFqECJbx
 FPzvoLwKNzhBsIjG0AsADM8GDjZvOGbNj3nayGpDdf6X3WsIrNd6hsO6E5ybLDuQPF.sqyCcfBLm
 .VeOHSy7NtOFSzA_56TvjSN6Pj5C0bvrp2g5qmq8QRiSvQ_XGOvT5RubGv6En6kaTbyoQE1.Am4.
 HbXRoZFJ5yHi7_ARJqS9tGO_0dd1YvndT2DfXcp3.QRZf7LwH6Zojg_sA5k9HsG56RmcFNk5mklM
 0SnDHzsb3GE23.07mujd8NkQDzLmOcdn.WFmzvMw68k59_TeKg0j96zM3jWAzRKMOlJNXjKfjGxb
 fYrcGZgigOxWwYdNv64O6XknxivlEZfDXwfnjQf0KOEzh0Ot1pR2HaXrumjww.7fBXLkqyQygwEf
 x2zcAD5UFeGvKcEPIKnvQY6oH_ezsef9QsWpHmMCm41yK4fSXHLsVzG1AJfZnVl_xuTvbkhudoWc
 2_N4wQbXfRr94XyUhRZRI2Suo_4bNDvWKbXIHGOj7h03_ThYYmTYQoQWBsPYRDjg3WM_0nXvps_P
 sDBvTgIlzMHcSeC_jROtFNKAvL30wJMN2fZyeXSVECHMDRTNHZzNo4fQGEe7E8W6hegolB8eGYA4
 LdbD8wyTsaWc65rht6Xd.1V.jSTT1DUYqzeBHkoN34ZqyyDTSum_5n4YNDF5kd.csKPIbIxcLTmk
 DyktoRuajLuKnf2pOSMkW0r97XajGm3BCQ5ulePgJgVsP4MY.UaLPLVxUPllbaMxuzQXGBPcyHqj
 Wt_2uIiXSVmLTnxXRAcTiYtoAZfI_VbkQrFcnaMn1Ev.UFKNwVTVT35tt4wFjfQQ9o45BAx1IS41
 SiJTsTl2JArekc8xJvHradk6cwqmtZW7VZtDMhCdN0keN8HRAnf1PR9lGcnVrt3tD7Dp3aQb7and
 ZRr_S2fv3aMAxw86u..DB1wuemDen9Ddo90DVpp28DGBR3NWPRJQTvPiM9GII7mXyttmr6eHAnk7
 c_HPi2AErSFv8jKtMNlDKaenCv96IYVQ92yIBMVeqDl0mTLJYfv75b_KFWFS._ejo1_ATUfBwocn
 VhRhuWInYExwjW8cGq8.r_OjmA6IfgfR54_mo4NJjzMiil.XoGiSS6nNLEenPZycc6SfBnZMM6LO
 tRGy3KRfMVCQJ_pg5eOTDRXdoiKj3257kfNU.WzjAbIqQ8AAAYHXhPZVKfc8C01lMTl3WXPVlAoO
 Trxvq4v8AMwzxJ.Ulykmsnc8n6H4DnfjVGfdaaTWOgtF5UkIckXBMTU2vSfrQ7lp5zASgi1xAPp1
 5.IOGuUH35JMdWX8XkoTwv3kj88ZGToNkNeE3xpk_PigYot1vPCOLRQhoqLXtGzw8Qzm2ZbakZm5
 Zxd3mu4hoU34lWKIWlgkLPYkLYhQCMtRjb45DhtWqWqXm1SoQGfhA9L7yya90KXil2qrXjuThccz
 bF34qxUA6UGbGGrSBvUsM7vWiX6VjU_TS0JaBbnIQ7sZybj_q.IRvTj1ELriYyz_h8CWW3_gMRb2
 jWgvXXTpqUYvmE45QsaZASkBT6H128IEG5gGdtPGTZLX0O5XsEMM0y38kcX4WIL7_k3iR3ay48qL
 TwGidzRI0yg7G5a4GatWzU37uRxer7hRleyxiPoQdJc.NDvaF4S7bX__nJwrGViScID5Cl8uY_KG
 .v7UJQYM8CCJcoqzW.vbP0y2S1Xwlh_gIP9RnJfFFe51rIbuz9PcRhG2Z5tAZXXsOhlga0QdvN.H
 I_UKdbsTHcYxTNZjNnFH9V1ByqLdP6HcKDaERi2w5ahfvzNYLSZwVbzdXKdTgyEvoiUxXWJsMAdr
 I_46EscAlDYTILuc9jdA0LcEzC1axZCwAwBQhwRXpS9vg1DyZGc8_D0JsqMhorlJ0RaXtPnP9b4y
 eNOoXTJW4iSsr0U_yYACqWE9FSvqHnlZ7EM0T9kI-
X-Sonic-MF: <namiltd@yahoo.com>
X-Sonic-ID: bdddba3a-3b1e-42c1-9e61-f52d24a9d895
Received: from sonic.gate.mail.ne1.yahoo.com by sonic317.consmr.mail.ne1.yahoo.com with HTTP; Wed, 7 Oct 2026 20:48:35 +0000
Received: by hermes--production-ir2-5dd9bf4598-bbdwl (Yahoo Inc. Hermes SMTP Server) with ESMTPA ID dc3c9d1ea882afb0da3584e844a12f58;
          Wed, 07 Oct 2026 20:38:18 +0000 (UTC)
Message-ID: <3daa4f32-733d-466d-a0f8-4c25257229bd@yahoo.com>
Date: Wed, 7 Oct 2026 22:38:15 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH net-next 3/8] net: dsa: realtek: rtl8365mb: get pvid for
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

Family C silicon requires reading the port's default PVID mask by
executing an indirect lookup via the shared VLAN member configuration
(MC) table index path. Since family D lacks a working hardware
implementation of this MC allocation table, attempting to parse it
returns junk. Fix this by bypassing the old MC loop entirely on family
D and reading the 12-bit PVID mask value straight from the dedicated
per-port hardware control register base.

Signed-off-by: Mieczyslaw Nalewaj <namiltd@yahoo.com>
---
 drivers/net/dsa/realtek/rtl8365mb_vlan.c | 25 ++++++++++++++++++++----
 1 file changed, 21 insertions(+), 4 deletions(-)

diff --git a/drivers/net/dsa/realtek/rtl8365mb_vlan.c b/drivers/net/dsa/realtek/rtl8365mb_vlan.c
index 8d49ffa..7add1fb 100644
--- a/drivers/net/dsa/realtek/rtl8365mb_vlan.c
+++ b/drivers/net/dsa/realtek/rtl8365mb_vlan.c
@@ -48,6 +48,7 @@
 
 #include "rtl8365mb_vlan.h"
 #include "rtl8365mb_table.h"
+#include "rtl8365mb.h"
 #include <linux/if_bridge.h>
 #include <linux/lockdep.h>
 #include <linux/regmap.h>
@@ -113,6 +114,11 @@
 #define   RTL8365MB_VLAN_PVID_CTRL_PORT_MCIDX_MASK(_p) \
 		(0x1F << RTL8365MB_VLAN_PVID_CTRL_PORT_MCIDX_OFFSET(_p))
 
+#define RTL8365MB_D_VLAN_PVID_CTRL_BASE			0x0700
+#define RTL8365MB_D_VLAN_PVID_CTRL_REG(port) \
+	(RTL8365MB_D_VLAN_PVID_CTRL_BASE + (port))
+#define RTL8365MB_D_VLAN_PVID_CTRL_MASK			GENMASK(11, 0)
+
 /* Frame type filtering registers */
 #define RTL8365MB_VLAN_ACCEPT_FRAME_TYPE_BASE	0x07aa
 #define RTL8365MB_VLAN_ACCEPT_FRAME_TYPE_REG(port) \
@@ -679,11 +685,22 @@ int rtl8365mb_vlan_port_get_pvid(struct realtek_priv *priv, int port, u16 *pvid)
 	u8 vlanmc_idx;
 	int ret;
 
-	ret = rtl8365mb_vlan_get_pvid_mc(priv, port, &vlanmc_idx, &vlanmc);
-	if (ret)
-		return ret;
+	if (rtl8365mb_get_family(priv) == RTL8365MB_FAMILY_D) {
+		u32 data;
+
+		ret = regmap_read(priv->map, RTL8365MB_D_VLAN_PVID_CTRL_REG(port), &data);
+		if (ret)
+			return ret;
+
+		*pvid = data & RTL8365MB_D_VLAN_PVID_CTRL_MASK;
+	} else {
+		ret = rtl8365mb_vlan_get_pvid_mc(priv, port, &vlanmc_idx, &vlanmc);
+		if (ret)
+			return ret;
+
+		*pvid = vlanmc.evid;
+	}
 
-	*pvid = vlanmc.evid;
 	return 0;
 }
 
-- 
2.53.0

