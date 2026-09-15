Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1843C45D900
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 07:29:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789457388; cv=none; b=i9mCXg37aQkoiEA5s0PV7daA2APN/p3BLXjUtpjklBcHNVOIJkHPM3rpx1RFFELhlcPqO8A/NUbfq8AFl0/bybGtOjQUKfPzwOZ/c2KsPB+AjmrHrraYPVh7DsHqKww52LzDKn21msi/W7tDGkEl8stWQ8mwzjx5zOFYDFYYthk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789457388; c=relaxed/simple;
	bh=8zf/gOs1y8l4fpevT3AWC1faL0w27q31GYK44x/pG10=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=QIfetDHiZviTtVmJFEx12Rx3XhiTbqWI+nkPmOva1IuRhJ9qPnPhWzPREw7yefTAmP2hHTw8/mUPklKY1C+YuBa3PhOpIghyVDnIgyOqQz/UtwpYCtn0hUfPsw6Krk+S7dho72eEf0zyr9seeAOME7gTRa5S21kS++syfKUQWfU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=k+Bnp6Bi; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="k+Bnp6Bi"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-49e6e69d528so29474485e9.2
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 00:29:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789457384; x=1790062184; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1+a/ev6XMnHBrBz1q4ymh6dZda+bt0r+Hh3bgmkmsh4=;
        b=k+Bnp6BirCHfwSQjoWnEUzFZDbCpYbJuMsE2QsQeK56hgn96jKPxkJ82j1oBjAuBC7
         +CUvvw8eHj7lUlM22nPt2+OJdh4zFpPUUhMBrIYWswGM1Y9Ba/XQ5dwbfQ1b6Zye9tv4
         xgQXhm+uIyGojvtJko9rwkmY0aWxHmM+IYCBCjXGmsFkeBstYMfbXtJmFSuE0CVDQW0v
         s0cv9mIl3SpuVEaAr3a0l1FSJoOQxXJzILq6WZ0pMYzcQzC1Zqn2fNNXtFEF0JwSSBSM
         AonaTRt7fwv0muZtFjGKFR9s0eAlO7DOBC90t3bqaTN/Fz9CcawHWBQT7MgFvAINwBih
         oQSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789457384; x=1790062184;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=1+a/ev6XMnHBrBz1q4ymh6dZda+bt0r+Hh3bgmkmsh4=;
        b=SR+Zo2lsQMkfw24UwCXeypDS5h3YQPHznSbt+a5Ea1IxHM0zjQivUtCWFC0DXGLrRQ
         XHA3KI/UVTbJg7siLCwnlHMvv0OrsxBZ5NBAnFhDosu0B01++h2uD45sOq1ghdZ6zc4K
         iE0dQOL+CG2aj3rC7/aQrXYTqVzt93uaFalqfyKYPruW1LuD3Sln7HvTWekRNE/Y3yD3
         ZvlRGTaVebSzgoBaiJsm0y9juzLeW2FCvcCSxXRM9lozzt5rFp9y7O/6kDS0el7gJqYU
         GOzWVRxDp+IARObcHX8+KjYMaIaweLZ9UY8bEq4sAwlKTv/yvHGVzq/Lc73CPsZcs7i3
         3Ezw==
X-Forwarded-Encrypted: i=1; AKwUvByar1J3vrzdQyLsPWmIxUVPn0rGWr8TtkdPUJiMLm8MP8ZCZcorW0Ke4FniDHBX0OvRn94UhwAYIxgDv2I=@vger.kernel.org
X-Gm-Message-State: AFuF++lehLfJQfhaCz4YFE13R4iw/YvSnndoI8xNE2Jb88bs10p1Hq2L
	IUBljzGqW5IY8csfG93scEq5f47PzcizT/vaOOkLOjrwM/Az2rH+vUEy
X-Gm-Gg: AYBFou0EYR0O/TRhka455JPTsJ/RHlqXeOQupZ9YC41hr03e3rq55weCJscGBYJDeFY
	KZG+aaRZ2bAuwoP/o/+WRd614pgmUvEuwhmQDrbfQBHBmLFrClMyo9a7/oCw4EI7WJgIhpTzKYy
	aw+dYJspYnGdVa6gqVY8X7MYLlr84BdODaRu0LGX5ukNwnH/HLYwDOwEoZN2ohGfZ4fg1KBuHrm
	rqHZNVh4uGT6nWyTXGWYApTL61p/4ioZE0IwYdtGYRycveMw8yk3vP08Oyz8klRfhQ+FSGVW1BC
	SR+KeGzRRXp6qoV8NCiGR9Lmb9OQ7NAHK/uVuIFG4WakwrDhJzGD8a5f6d2XyKO2pNecGiAoeMm
	UfOqwt7eQqfY09ZM4/iKzRV+kNzm5TA3EyY1qnZLy2DIM+Ke/u4kxva0jX1VZPi9NyA9ew/h3FE
	4EB9xc7PHs4KWJKpzhC1WVbT3YAClPhfShZiuYrjpFmlsB6ni3tqFcP0z0StwRUkCBhd3iwygRy
	+pd7E7HYTOe9QIxgxsk3g==
X-Received: by 2002:a05:600c:8706:b0:49c:fc6c:be15 with SMTP id 5b1f17b1804b1-49e7a68b749mr86736785e9.27.1789457383652;
        Tue, 15 Sep 2026 00:29:43 -0700 (PDT)
Received: from ubuntu-4gb-nbg1-1.. ([2a01:4f8:1c19:b0ad::1])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e7ef7eca3sm36980515e9.10.2026.09.15.00.29.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 00:29:43 -0700 (PDT)
From: =?UTF-8?q?Rare=C8=99-Mihai=20Vladu?= <vladurares@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	lkp@intel.com,
	=?UTF-8?q?Rare=C8=99-Mihai=20Vladu?= <vladurares@gmail.com>
Subject: [PATCH v2] staging: rtl8723bs: fix lines exceeding 100 columns in rtw_security.c
Date: Tue, 15 Sep 2026 07:29:23 +0000
Message-ID: <20260915072923.1014216-1-vladurares@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Reformat long lines in rtw_security.c to fit within the 100-column
limit by splitting function arguments, expressions, and moving

Signed-off-by: Rareș-Mihai Vladu <vladurares@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_security.c | 94 +++++++++++++------
 1 file changed, 66 insertions(+), 28 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_security.c b/drivers/staging/rtl8723bs/core/rtw_security.c
index 2217cffac..dc9ac335d 100644
--- a/drivers/staging/rtl8723bs/core/rtw_security.c
+++ b/drivers/staging/rtl8723bs/core/rtw_security.c
@@ -34,7 +34,8 @@ const char *security_type_str(u8 value)
 
 /* Need to consider the fragment  situation */
 void rtw_wep_encrypt(struct adapter *padapter, u8 *pxmitframe)
-{																	/*  exclude ICV */
+{
+	/*  exclude ICV */
 	union {
 		__le32 f0;
 		unsigned char f1[4];
@@ -64,12 +65,17 @@ void rtw_wep_encrypt(struct adapter *padapter, u8 *pxmitframe)
 		for (curfragnum = 0; curfragnum < pattrib->nr_frags; curfragnum++) {
 			iv = pframe + pattrib->hdrlen;
 			memcpy(&wepkey[0], iv, 3);
-			memcpy(&wepkey[3], &psecuritypriv->dot11DefKey[psecuritypriv->dot11PrivacyKeyIndex].skey[0], keylength);
+			int idx = psecuritypriv->dot11PrivacyKeyIndex;
+
+			memcpy(&wepkey[3],
+			       &psecuritypriv->dot11DefKey[idx].skey[0],
+			       keylength);
 			payload = pframe + pattrib->iv_len + pattrib->hdrlen;
 
 			if ((curfragnum + 1) == pattrib->nr_frags) {	/* the last fragment */
 
-				length = pattrib->last_txcmdsz - pattrib->hdrlen - pattrib->iv_len - pattrib->icv_len;
+				length = pattrib->last_txcmdsz - pattrib->hdrlen -
+					 pattrib->iv_len - pattrib->icv_len;
 
 				crc.f0 = cpu_to_le32(~crc32_le(~0, payload, length));
 
@@ -78,7 +84,8 @@ void rtw_wep_encrypt(struct adapter *padapter, u8 *pxmitframe)
 				arc4_crypt(ctx, payload + length, crc.f1, 4);
 
 			} else {
-				length = pxmitpriv->frag_len - pattrib->hdrlen - pattrib->iv_len - pattrib->icv_len;
+				length = pxmitpriv->frag_len - pattrib->hdrlen -
+					 pattrib->iv_len - pattrib->icv_len;
 				crc.f0 = cpu_to_le32(~crc32_le(~0, payload, length));
 				arc4_setkey(ctx, wepkey, 3 + keylength);
 				arc4_crypt(ctx, payload, payload, length);
@@ -112,9 +119,16 @@ void rtw_wep_decrypt(struct adapter  *padapter, u8 *precvframe)
 		keyindex = prxattrib->key_index;
 		keylength = psecuritypriv->dot11DefKeylen[keyindex];
 		memcpy(&wepkey[0], iv, 3);
-		/* memcpy(&wepkey[3], &psecuritypriv->dot11DefKey[psecuritypriv->dot11PrivacyKeyIndex].skey[0], keylength); */
-		memcpy(&wepkey[3], &psecuritypriv->dot11DefKey[keyindex].skey[0], keylength);
-		length = ((union recv_frame *)precvframe)->u.hdr.len - prxattrib->hdrlen - prxattrib->iv_len;
+		/*
+		 *  memcpy(&wepkey[3],
+		 *         &psecuritypriv->dot11DefKey[psecuritypriv->dot11PrivacyKeyIndex].skey[0],
+		 *         keylength);
+		 */
+		memcpy(&wepkey[3],
+		       &psecuritypriv->dot11DefKey[keyindex].skey[0],
+		       keylength);
+		length = ((union recv_frame *)precvframe)->u.hdr.len -
+			 prxattrib->hdrlen - prxattrib->iv_len;
 
 		payload = pframe + prxattrib->iv_len + prxattrib->hdrlen;
 
@@ -157,7 +171,8 @@ void rtw_secmicappendbyte(struct mic_data *pmicdata, u8 b)
 		pmicdata->L ^= pmicdata->M;
 		pmicdata->R ^= ROL32(pmicdata->L, 17);
 		pmicdata->L += pmicdata->R;
-		pmicdata->R ^= ((pmicdata->L & 0xff00ff00) >> 8) | ((pmicdata->L & 0x00ff00ff) << 8);
+		pmicdata->R ^= ((pmicdata->L & 0xff00ff00) >> 8) |
+			 ((pmicdata->L & 0x00ff00ff) << 8);
 		pmicdata->L += pmicdata->R;
 		pmicdata->R ^= ROL32(pmicdata->L, 3);
 		pmicdata->L += pmicdata->R;
@@ -418,7 +433,8 @@ static void phase2(u8 *rc4key, const u8 *tk, const u16 *p1k, u16 iv16)
 
 /* The hlen isn't include the IV */
 u32 rtw_tkip_encrypt(struct adapter *padapter, u8 *pxmitframe)
-{																	/*  exclude ICV */
+{
+	/*  exclude ICV */
 	u16 pnl;
 	u32 pnh;
 	u8 rc4key[16];
@@ -467,7 +483,8 @@ u32 rtw_tkip_encrypt(struct adapter *padapter, u8 *pxmitframe)
 		phase2(&rc4key[0], prwskey, (u16 *)&ttkey[0], pnl);
 
 		if ((curfragnum + 1) == pattrib->nr_frags) {	/* 4 the last fragment */
-			length = pattrib->last_txcmdsz - pattrib->hdrlen - pattrib->iv_len - pattrib->icv_len;
+			length = pattrib->last_txcmdsz - pattrib->hdrlen -
+				 pattrib->iv_len - pattrib->icv_len;
 			crc.f0 = cpu_to_le32(~crc32_le(~0, payload, length));
 
 			arc4_setkey(ctx, rc4key, 16);
@@ -475,7 +492,8 @@ u32 rtw_tkip_encrypt(struct adapter *padapter, u8 *pxmitframe)
 			arc4_crypt(ctx, payload + length, crc.f1, 4);
 
 		} else {
-			length = pxmitpriv->frag_len - pattrib->hdrlen - pattrib->iv_len - pattrib->icv_len;
+			length = pxmitpriv->frag_len - pattrib->hdrlen -
+				 pattrib->iv_len - pattrib->icv_len;
 			crc.f0 = cpu_to_le32(~crc32_le(~0, payload, length));
 
 			arc4_setkey(ctx, rc4key, 16);
@@ -491,7 +509,8 @@ u32 rtw_tkip_encrypt(struct adapter *padapter, u8 *pxmitframe)
 
 /* The hlen isn't include the IV */
 u32 rtw_tkip_decrypt(struct adapter *padapter, u8 *precvframe)
-{																	/*  exclude ICV */
+{
+	/*  exclude ICV */
 	u16 pnl;
 	u32 pnh;
 	u8   rc4key[16];
@@ -536,7 +555,8 @@ u32 rtw_tkip_decrypt(struct adapter *padapter, u8 *precvframe)
 			if (jiffies_to_msecs(jiffies - start) > 1000) {
 				if (no_gkey_bc_cnt || no_gkey_mc_cnt) {
 					netdev_dbg(padapter->pnetdev,
-						   FUNC_ADPT_FMT " no_gkey_bc_cnt:%u, no_gkey_mc_cnt:%u\n",
+						   FUNC_ADPT_FMT
+						   " no_gkey_bc_cnt:%u, no_gkey_mc_cnt:%u\n",
 						   FUNC_ADPT_ARG(padapter),
 						   no_gkey_bc_cnt,
 						   no_gkey_mc_cnt);
@@ -550,7 +570,8 @@ u32 rtw_tkip_decrypt(struct adapter *padapter, u8 *precvframe)
 
 		if (no_gkey_bc_cnt || no_gkey_mc_cnt) {
 			netdev_dbg(padapter->pnetdev,
-				   FUNC_ADPT_FMT " gkey installed. no_gkey_bc_cnt:%u, no_gkey_mc_cnt:%u\n",
+				   FUNC_ADPT_FMT
+				   " gkey installed. no_gkey_bc_cnt:%u, no_gkey_mc_cnt:%u\n",
 				   FUNC_ADPT_ARG(padapter),
 				   no_gkey_bc_cnt,
 				   no_gkey_mc_cnt);
@@ -566,7 +587,8 @@ u32 rtw_tkip_decrypt(struct adapter *padapter, u8 *precvframe)
 
 	iv = pframe + prxattrib->hdrlen;
 	payload = pframe + prxattrib->iv_len + prxattrib->hdrlen;
-	length = ((union recv_frame *)precvframe)->u.hdr.len - prxattrib->hdrlen - prxattrib->iv_len;
+	length = ((union recv_frame *)precvframe)->u.hdr.len -
+		 prxattrib->hdrlen - prxattrib->iv_len;
 
 	GET_TKIP_PN(iv, dot11txpn);
 
@@ -757,10 +779,12 @@ static void construct_ctr_preload(u8 *ctr_preload,
 	if (frtype == WIFI_MGT_TYPE)
 		ctr_preload[1] |= BIT(4);
 
+	/* ctr_preload[2:7] = A2[0:5] = mpdu[10:15] */
 	for (i = 2; i < 8; i++)
-		ctr_preload[i] = mpdu[i + 8];                       /* ctr_preload[2:7] = A2[0:5] = mpdu[10:15] */
+		ctr_preload[i] = mpdu[i + 8];
+	/* ctr_preload[8:13] = PN[5:0] */
 	for (i = 8; i < 14; i++)
-		ctr_preload[i] =    pn_vector[13 - i];          /* ctr_preload[8:13] = PN[5:0] */
+		ctr_preload[i] =    pn_vector[13 - i];
 	ctr_preload[14] = (unsigned char)(c / 256); /* Ctr */
 	ctr_preload[15] = (unsigned char)(c % 256);
 }
@@ -952,11 +976,13 @@ u32 rtw_aes_encrypt(struct adapter *padapter, u8 *pxmitframe)
 
 	for (curfragnum = 0; curfragnum < pattrib->nr_frags; curfragnum++) {
 		if ((curfragnum + 1) == pattrib->nr_frags) {	/* 4 the last fragment */
-			length = pattrib->last_txcmdsz - pattrib->hdrlen - pattrib->iv_len - pattrib->icv_len;
+			length = pattrib->last_txcmdsz - pattrib->hdrlen -
+				 pattrib->iv_len - pattrib->icv_len;
 
 			aes_cipher(prwskey, pattrib->hdrlen, pframe, length);
 		} else {
-			length = pxmitpriv->frag_len - pattrib->hdrlen - pattrib->iv_len - pattrib->icv_len;
+			length = pxmitpriv->frag_len - pattrib->hdrlen -
+				 pattrib->iv_len - pattrib->icv_len;
 
 			aes_cipher(prwskey, pattrib->hdrlen, pframe, length);
 			pframe += pxmitpriv->frag_len;
@@ -1205,7 +1231,8 @@ u32 rtw_aes_decrypt(struct adapter *padapter, u8 *precvframe)
 			if (jiffies_to_msecs(jiffies - start) > 1000) {
 				if (no_gkey_bc_cnt || no_gkey_mc_cnt) {
 					netdev_dbg(padapter->pnetdev,
-						   FUNC_ADPT_FMT " no_gkey_bc_cnt:%u, no_gkey_mc_cnt:%u\n",
+						   FUNC_ADPT_FMT
+						   " no_gkey_bc_cnt:%u, no_gkey_mc_cnt:%u\n",
 						   FUNC_ADPT_ARG(padapter),
 						   no_gkey_bc_cnt,
 						   no_gkey_mc_cnt);
@@ -1220,7 +1247,8 @@ u32 rtw_aes_decrypt(struct adapter *padapter, u8 *precvframe)
 
 		if (no_gkey_bc_cnt || no_gkey_mc_cnt) {
 			netdev_dbg(padapter->pnetdev,
-				   FUNC_ADPT_FMT " gkey installed. no_gkey_bc_cnt:%u, no_gkey_mc_cnt:%u\n",
+				   FUNC_ADPT_FMT
+				   " gkey installed. no_gkey_bc_cnt:%u, no_gkey_mc_cnt:%u\n",
 				   FUNC_ADPT_ARG(padapter),
 				   no_gkey_bc_cnt,
 				   no_gkey_mc_cnt);
@@ -1238,7 +1266,8 @@ u32 rtw_aes_decrypt(struct adapter *padapter, u8 *precvframe)
 		prwskey = &stainfo->dot118021x_UncstKey.skey[0];
 	}
 
-	length = ((union recv_frame *)precvframe)->u.hdr.len - prxattrib->hdrlen - prxattrib->iv_len;
+	length = ((union recv_frame *)precvframe)->u.hdr.len -
+		 prxattrib->hdrlen - prxattrib->iv_len;
 
 	res = aes_decipher(prwskey, prxattrib->hdrlen, pframe, length);
 
@@ -1269,9 +1298,14 @@ u32 rtw_BIP_verify(struct adapter *padapter, u8 *precvframe)
 	/* mapping to wlan header */
 	pwlanhdr = (struct ieee80211_hdr *)pframe;
 	/* save the frame body + MME */
-	memcpy(BIP_AAD + BIP_AAD_SIZE, pframe + WLAN_HDR_A3_LEN, pattrib->pkt_len - WLAN_HDR_A3_LEN);
+	memcpy(BIP_AAD + BIP_AAD_SIZE,
+	       pframe + WLAN_HDR_A3_LEN,
+	       pattrib->pkt_len - WLAN_HDR_A3_LEN);
 	/* find MME IE pointer */
-	p = rtw_get_ie(BIP_AAD + BIP_AAD_SIZE, WLAN_EID_MMIE, &len, pattrib->pkt_len - WLAN_HDR_A3_LEN);
+	p = rtw_get_ie(BIP_AAD + BIP_AAD_SIZE,
+		       WLAN_EID_MMIE,
+		       &len,
+		       pattrib->pkt_len - WLAN_HDR_A3_LEN);
 	/* Baron */
 	if (p) {
 		u16 keyid = 0;
@@ -1300,8 +1334,10 @@ u32 rtw_BIP_verify(struct adapter *padapter, u8 *precvframe)
 		/* conscruct AAD, copy address 1 to address 3 */
 		memcpy(BIP_AAD + 2, &pwlanhdr->addrs, sizeof(pwlanhdr->addrs));
 
-		if (omac1_aes_128(padapter->securitypriv.dot11wBIPKey[padapter->securitypriv.dot11wBIPKeyid].skey
-			, BIP_AAD, ori_len, mic))
+		int bip_keyid = padapter->securitypriv.dot11wBIPKeyid;
+		u8 *bip_key = padapter->securitypriv.dot11wBIPKey[bip_keyid].skey;
+
+		if (omac1_aes_128(bip_key, BIP_AAD, ori_len, mic))
 			goto BIP_exit;
 
 		/* MIC field should be last 8 bytes of packet (packet without FCS) */
@@ -1430,7 +1466,8 @@ void rtw_sec_restore_wep_key(struct adapter *adapter)
 	struct security_priv *securitypriv = &adapter->securitypriv;
 	signed int keyid;
 
-	if ((securitypriv->dot11_privacy_algrthm == _WEP40_) || (securitypriv->dot11_privacy_algrthm == _WEP104_)) {
+	if ((securitypriv->dot11_privacy_algrthm == _WEP40_) ||
+	    (securitypriv->dot11_privacy_algrthm == _WEP104_)) {
 		for (keyid = 0; keyid < 4; keyid++) {
 			if (securitypriv->key_mask & BIT(keyid)) {
 				if (keyid == securitypriv->dot11PrivacyKeyIndex)
@@ -1448,7 +1485,8 @@ u8 rtw_handle_tkip_countermeasure(struct adapter *adapter, const char *caller)
 	u8 status = _SUCCESS;
 
 	if (securitypriv->btkip_countermeasure) {
-		unsigned long passing_ms = jiffies_to_msecs(jiffies - securitypriv->btkip_countermeasure_time);
+		unsigned long elapsed = jiffies - securitypriv->btkip_countermeasure_time;
+		unsigned long passing_ms = jiffies_to_msecs(elapsed);
 
 		if (passing_ms > 60 * 1000) {
 			netdev_dbg(adapter->pnetdev,
-- 
2.43.0

