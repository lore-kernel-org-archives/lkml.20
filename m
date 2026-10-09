Received: from sonic317-33.consmr.mail.ne1.yahoo.com (sonic317-33.consmr.mail.ne1.yahoo.com [66.163.184.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD6663D9DD2
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 04:54:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=66.163.184.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791521696; cv=none; b=npTcKiX/vcYGxYnci8pqX/stitcLdvcjdk313Z9i7GoivtLT9kTCYDQqvJRTPObZEgBzEPbiUv7/7mjwL/YZ+gOQZx0Z216ckE8qJxCIAQ8kpHqSAOj9NGFuRoILUlWwYFX0Wpah+TbHA4XquEmQ2tS3bZnePvuAsVnJoi1nl6I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791521696; c=relaxed/simple;
	bh=RY8rNNfrEPhnkuSSX5xYFVhvD6cKhpk02uzo03PraYk=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:References:
	 In-Reply-To:Content-Type; b=qEGEEEOtAQ8W56V7FGyXHV+FmV6Kmba+ywb5Uwhx0ddMTz+4IMXw1LGao1qO6U25tkD4qa8hYtE45x+dL+Wgjw7MTwj6xCZW9fNxJbiQOQs25GLEGkVbyLa6H7dbgWo3LCbYbzWRaTKwHLfiI1EtVTDqH4eMtq6YpesNJw+6fsQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.com; spf=pass smtp.mailfrom=yahoo.com; dkim=pass (2048-bit key) header.d=yahoo.com header.i=@yahoo.com header.b=GjFXATvC; arc=none smtp.client-ip=66.163.184.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yahoo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=yahoo.com header.i=@yahoo.com header.b="GjFXATvC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1791521675; bh=z0mDT0OtU18Xu3UUEubG38Qo9iIYioWGeN5Qn4w2zO8=; h=Date:Subject:From:To:References:In-Reply-To:From:Subject:Reply-To; b=GjFXATvCjOaz8G3BvdDq1mj4B4dipFO6b6OQfeZ5lUN8s3mzBSCoaS5K1m3u+JOkNHxTl+EHyQC+Hoq8mxtOlI1S4Uud3TX3sm9EId5y1ZLdXbJQQBLhsjadrakTiFlto9TyWnz3Nnk3Dw1oKRTkEvvk8Jg33KvsTjGFR1zEcKopYh0/RZcTukH6oph1plImzHZez1Cg6FHV+Yuuxi3/CJNX4F6X4EjnkqKKULhXaayVHakHlmAd2Qk3tdEy970aQ82mGbdndK+g7mTAcNF1kSw5y69f18KXi/5ep8y3xNvxS/w+2di3X/oRE1nGHacDzPTdFzERZ3qRbIBjVgFfQA==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1791521675; bh=8xva2A5YbFzxMZiSIrGrkn5hjR5FJ19aIA4CaK85so6=; h=X-Sonic-MF:Date:Subject:From:To:From:Subject; b=DoMYqpJ8lzkdr5Xv5JzuKsEaetrjKm/WSGtkJ3CyxrkLdCxcaPVHRgbTM4Tzr4NO4RaU0Lu3nDfcol2vgZSBou2AD4dJPuC4L2n9flxPSKXqlHyUMblaHYKFk2eWclX3wpKOZrhLh6WQg1kVHAiT/Yyq1CLXuawYeqauOSR9iH2vOE/wslxfKe0VWxjWHJ947K88fTT2oJwNViaRZiYz1mLlPy0cUrimkD8ICPKJO0yv3XlySivZSI3hCihpUEGVJDPSmAcXaSSd1BdU8KVbhWMgSnufITdWQ2iehBwTqQSBQkZCXlbqCBrKymZ3MFAGTUuCQam9hLYcy31qvII/cg==
X-YMail-OSG: DxJeIJcVM1mTomCpp8hAgvZMyHLyHCtVx18u1ILWENhs6dsWAq6do0LN_VBEa9A
 MjovF4wyTSDcfJHkwtwS_XfWjDSjWrNLpBYBpv_IT0GDz71WvTtUKfYdOG9w8vuiROhqwS41x0M3
 JSrQWJJUX7j4XoB1zmO5qn0AzKlFOkCq5fb8VRGs0U.qI3E5qqzr8uYsNmy.8XuWdPsFUI9ouOgm
 _WuI08az6_iaVVKKKx814yl0VDNxJ0puQxbcsIN19A0D51f_xXIRuBhUv.pMT2BX.GrxMkT5lQQH
 wIo4H3r7CvOWCjTWLmuqnltUnpWTEGfx.zYtkWszMGneVxqsY53.TUbABXJvk9u6uwmuVQbnQ6mv
 v4sV8h6gP.EMjg.W8gVq9IBl8vG2c_qWVPcmDHWKfps3HhJepMCapWt1Wrn5rQ_EQganaDH.Nn6f
 8IZQARxjgSo3yhnIPqX.P5DO270U1gq.S2RnFNO3y0GrXV.yka7FvIK9pn2zHrtGIItxoSwqAL.Y
 DLTxV.m6PyGX.BWbabnt9qtnGKnmnTWtjaDuRiv5yX3ndarroizvcd1pIzWDITcw8X3BwmET7J.0
 ._D8_WuQTUNNRVNSGl5uPSahTKzDqWmsan2KjGaCiTSmtMyjk_uqCQ3iKtAN4MvQzOiO.Ldn.ToZ
 NmUZsCeZVArWbA3nBzvABQm0fMzIkZkabX6qfd636J0FJRNEYbCFD5sV0vpGp.d_Nb3lQl37OfqO
 gdYmHAG0R_ZdyPzoiC5bXkZzgmwVcswNi4atlMw1UN3RDfZ5e0k5LTPJtDcBmU3tPho0YeAclBKc
 SGJ14tR9avA1tLVcdqZEETyP0qKtSR7i3qGYIgNBqzyYm_MJelQ1KJ9E0.Sa5ZHd73NWcc.tUaAg
 jwlEjAZSpDj67aMyycaLl53zUS8w_dydjSZ1SNPXRihh_XSfQ85Bz1T_Y0TD1Tlk3yq4Wvu2JDlV
 JFvscK2L03NrOBpJioJ5JB9gGml19ELw_UVZF2qzWltp0tiBybhrd0IeLut9L620HUmN8aGLplBe
 qMSH_J3mgCTrVuKaqp1DcsZ2lntIRga5y0TGNPKQ_ck4o98C2ZdF1X5sfZ_yk7f6B8a.wtPtv49l
 MDuj556CZYDkHNv9Zx8zOeyqj913a64XnhJW2zjCkl9XJ0.AYcwdXT74y1QTxiZTd4_YVdfsiorR
 h.jW3lSpDcqbfKZhhEaNo5.6rkmoOucUKZS9bR2v6q43urPkl8HPABP2FvC2gO5jC3id07EIW11F
 1BP7Lw18UaPb7ubIH09AacI16hfgIpG9mOBiDq47m.srTC12s.ptE8r4AFx5iCFd76XYxNXMCCVo
 rJMquVwQwB4OPNL7BwiFDAlGW8miDcUQ9tkSb6MWH6Xq51_9CB6ad2FTiw5SRNV2Wk3w9vJv2bQ3
 6QvtQ2FndvmUnnoxAx5nASnbctVIzjzwoixM15o9gX9IFLe4fy8w3kcQEv_DAbnY3QR9eZr82Yfe
 oNh59hmdWSHDjcOvodxdcOaKdpVX8RMoXDLdAT3HOKfCQj.igFuQRYA4wXg6IYaaORg5nrg2cgoK
 PHyl1f17TJ0PSHtzvjytu9H5CvtvcEezt9kJ7fD3ioMGOKfoW_0HN7944.7_78tiBePawLdqvIjh
 Fz1ZdNvuUGxm2oVcHH01cN.Kq8D_sy8w5eTHGBoqXhSadKMngd4QYgLCpctjMC8ENSIqSbqN9KC5
 TqbQaJT28de3JfsCXnaXxt_CT44kunwGs92oMtxzZCGShSVooIftniTUYA1R2tWikPatNAOQIJLZ
 4DcKonW225y40spj_aPmbYRb2ufovR1iKCvYUHHfvhTvU0BvDnCdesSIJs3VcK_PgmCywmx16P2M
 AngvLJJnKmF6Nku9857w_jQNqAnEx0VTovb0E1DO834yd4qhKDKFbLPmVW6QbN.MNuG7iUYmd1nv
 D_GG3cMobPrHT1m.qIOvbGMCXTTkNlaYN207Q1CGYe5Xhsg7RHPNv73mgYsgCq_tel_OJsGCs6ze
 U64D3G6LS5QbF8zn6c6BsL9puhWpFGfASQ3YAgr_N5hWo1COyK_eIug8N5.3q..NUs7cKb4mmJXL
 jbx2prTwEmVIJoC4CkjzvUumSsheIgbWJd81pqt6Xn4.drufwuWLCDorbiq7xsNftChHQxP0qBuv
 MNUMzsGYSo8MThVTZd4bxZyFgxFwmSaOjzTPMf7XTZY8myLEgaWv4xEuROJubGk6_MaCLmFCJli4
 c1e_FnLPSZfGVpme58gcF7jUpMtc.eWZYi8u2D.rqaD90PXKyZs5a6B1c4zbHeksB7nRnwS8yXs1
 EUS12ZNkWuQSiQZrkeqHUUpDr2pbz7ZQQ4oj9CIo-
X-Sonic-MF: <namiltd@yahoo.com>
X-Sonic-ID: 4eec4103-950a-44c9-9cfd-cef3a3692279
Received: from sonic.gate.mail.ne1.yahoo.com by sonic317.consmr.mail.ne1.yahoo.com with HTTP; Fri, 9 Oct 2026 04:54:35 +0000
Received: by hermes--production-ir2-5dd9bf4598-p4sz7 (Yahoo Inc. Hermes SMTP Server) with ESMTPA ID cb481cd8cd3059680bb95e6a6193ce7d;
          Fri, 09 Oct 2026 04:54:29 +0000 (UTC)
Message-ID: <05f792d4-ed17-47b5-abb5-70813ce628cc@yahoo.com>
Date: Fri, 9 Oct 2026 06:54:22 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH net-next v2 2/8] net: dsa: realtek: rtl8365mb: set speed for
 family D
From: Mieczyslaw Nalewaj <namiltd@yahoo.com>
To: linusw@kernel.org, alsi@bang-olufsen.dk, andrew@lunn.ch,
 olteanv@gmail.com, kuba@kernel.org, davem@davemloft.net,
 edumazet@google.com, pabeni@redhat.com, linux@armlinux.org.uk,
 luizluca@gmail.com, maxime.chevallier@bootlin.com, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <28382f3f-03c1-4606-9b11-86f118abeafe@yahoo.com>
Content-Language: pl
In-Reply-To: <28382f3f-03c1-4606-9b11-86f118abeafe@yahoo.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Mailer: WebService/1.1.26668 mail.backend.jedi.jws.acl:role.jedi.acl.token.atz.jws.hermes.yahoo

On family C hardware, forcing a 2.5 Gbps link speed requires relying
strictly on the HSGMII SerDes configuration block, while forcing a dummy
1 Gbps value inside the standard digital interface register. Family D
introduces a dedicated hardware link speed value (5) for 2500M. The speed
bitfield width has been expanded to 3 bits, splitting the most significant
bit into a new separate register field (FORCE_SPEED2), which maps directly
to a distinct per-port digital interface force layout.

Signed-off-by: Mieczyslaw Nalewaj <namiltd@yahoo.com>
---
 drivers/net/dsa/realtek/rtl8365mb_main.c | 71 +++++++++++++++++++-----
 1 file changed, 58 insertions(+), 13 deletions(-)

diff --git a/drivers/net/dsa/realtek/rtl8365mb_main.c b/drivers/net/dsa/realtek/rtl8365mb_main.c
index 80fc551..b1ea8b0 100644
--- a/drivers/net/dsa/realtek/rtl8365mb_main.c
+++ b/drivers/net/dsa/realtek/rtl8365mb_main.c
@@ -346,6 +346,7 @@
 #define RTL8365MB_PORT_SPEED_10M	0
 #define RTL8365MB_PORT_SPEED_100M	1
 #define RTL8365MB_PORT_SPEED_1000M	2
+#define RTL8365MB_D_PORT_SPEED_2500M	5
 
 /* External interface force configuration registers 0~2 */
 #define RTL8365MB_DIGITAL_INTERFACE_FORCE_REG0		0x1310 /* EXT0 */
@@ -363,6 +364,20 @@
 #define   RTL8365MB_DIGITAL_INTERFACE_FORCE_LINK_MASK		BIT(4)
 #define   RTL8365MB_DIGITAL_INTERFACE_FORCE_DUPLEX_MASK		BIT(2)
 #define   RTL8365MB_DIGITAL_INTERFACE_FORCE_SPEED_MASK		GENMASK(1, 0)
+#define   RTL8365MB_DIGITAL_INTERFACE_FORCE_SPEED_WIDTH		2 /* bits[1:0] */
+
+/* bits[13:12]; bit 13 reserved, no defined speed value uses it yet */
+#define   RTL8365MB_D_DIGITAL_INTERFACE_FORCE_SPEED2_MASK	GENMASK(13, 12)
+
+#define RTL8365MB_D_DIGITAL_INTERFACE_FORCE_REG_BASE		0x12c0
+#define RTL8365MB_D_DIGITAL_INTERFACE_FORCE_REG(_port) \
+		(RTL8365MB_D_DIGITAL_INTERFACE_FORCE_REG_BASE + (_port))
+
+#define RTL8365MB_D_DIGITAL_INTERFACE_FORCE_EN_BASE		0x12c8
+#define RTL8365MB_D_DIGITAL_INTERFACE_FORCE_REG_EN(_port) \
+		(RTL8365MB_D_DIGITAL_INTERFACE_FORCE_EN_BASE + (_port))
+
+#define RTL8365MB_D_DIGITAL_INTERFACE_FORCE_EN_ALL_MASK	GENMASK(15, 0)
 
 /* CPU port mask register - controls which ports are treated as CPU ports */
 #define RTL8365MB_CPU_PORT_MASK_REG	0x1219
@@ -1661,23 +1676,31 @@ static int rtl8365mb_ext_config_forcemode(struct realtek_priv *priv, int port,
 	u32 r_duplex;
 	u32 r_speed;
 	u32 r_link;
+	bool is_d;
 	int val;
 	int ret;
 
 	if (!extint)
 		return -ENODEV;
 
+	is_d = rtl8365mb_get_family(priv) == RTL8365MB_FAMILY_D;
 	if (link) {
 		/* Force the link up with the desired configuration */
 		r_link = 1;
 		r_rx_pause = rx_pause ? 1 : 0;
 		r_tx_pause = tx_pause ? 1 : 0;
 
-		/* The speed field has no value for 2.5 Gbps: the rate is
-		 * determined by the HSGMII SerDes configuration, and the
-		 * vendor driver programs the 1 Gbps value here.
-		 */
-		if (speed == SPEED_2500 || speed == SPEED_1000) {
+		if (speed == SPEED_2500) {
+			if (is_d) {
+				r_speed = RTL8365MB_D_PORT_SPEED_2500M;
+			} else {
+				/* The speed field has no value for 2.5 Gbps: the rate is
+				 * determined by the HSGMII SerDes configuration, and the
+				 * vendor driver programs the 1 Gbps value here.
+				 */
+				r_speed = RTL8365MB_PORT_SPEED_1000M;
+			}
+		} else if (speed == SPEED_1000) {
 			r_speed = RTL8365MB_PORT_SPEED_1000M;
 		} else if (speed == SPEED_100) {
 			r_speed = RTL8365MB_PORT_SPEED_100M;
@@ -1707,20 +1730,42 @@ static int rtl8365mb_ext_config_forcemode(struct realtek_priv *priv, int port,
 		r_duplex = 0;
 	}
 
-	val = FIELD_PREP(RTL8365MB_DIGITAL_INTERFACE_FORCE_EN_MASK, 1) |
-	      FIELD_PREP(RTL8365MB_DIGITAL_INTERFACE_FORCE_TXPAUSE_MASK,
+	val = FIELD_PREP(RTL8365MB_DIGITAL_INTERFACE_FORCE_TXPAUSE_MASK,
 			 r_tx_pause) |
 	      FIELD_PREP(RTL8365MB_DIGITAL_INTERFACE_FORCE_RXPAUSE_MASK,
 			 r_rx_pause) |
 	      FIELD_PREP(RTL8365MB_DIGITAL_INTERFACE_FORCE_LINK_MASK, r_link) |
 	      FIELD_PREP(RTL8365MB_DIGITAL_INTERFACE_FORCE_DUPLEX_MASK,
 			 r_duplex) |
-	      FIELD_PREP(RTL8365MB_DIGITAL_INTERFACE_FORCE_SPEED_MASK, r_speed);
-	ret = regmap_write(priv->map,
-			   RTL8365MB_DIGITAL_INTERFACE_FORCE_REG(extint->id),
-			   val);
-	if (ret)
-		return ret;
+	      FIELD_PREP(RTL8365MB_DIGITAL_INTERFACE_FORCE_SPEED_MASK,
+			 r_speed & RTL8365MB_DIGITAL_INTERFACE_FORCE_SPEED_MASK);
+
+	if (is_d) {
+		/* Speed is 3 bits on family D: bits[1:0] go into FORCE_SPEED,
+		 * bit[2] goes into FORCE_SPEED2 (bit 12); only 2500M sets it,
+		 * bit 13 of the field is unused.
+		 */
+		val |= FIELD_PREP(RTL8365MB_D_DIGITAL_INTERFACE_FORCE_SPEED2_MASK,
+				  r_speed >> RTL8365MB_DIGITAL_INTERFACE_FORCE_SPEED_WIDTH);
+		ret = regmap_write(priv->map,
+				   RTL8365MB_D_DIGITAL_INTERFACE_FORCE_REG(port),
+				   val);
+		if (ret)
+			return ret;
+
+		ret = regmap_write(priv->map,
+				   RTL8365MB_D_DIGITAL_INTERFACE_FORCE_REG_EN(port),
+				   RTL8365MB_D_DIGITAL_INTERFACE_FORCE_EN_ALL_MASK);
+		if (ret)
+			return ret;
+	} else {
+		val |= FIELD_PREP(RTL8365MB_DIGITAL_INTERFACE_FORCE_EN_MASK, 1);
+		ret = regmap_write(priv->map,
+				   RTL8365MB_DIGITAL_INTERFACE_FORCE_REG(extint->id),
+				   val);
+		if (ret)
+			return ret;
+	}
 
 	return 0;
 }
-- 
2.53.0

