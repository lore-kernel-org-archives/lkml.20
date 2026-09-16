Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D381453A52
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 07:49:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789544958; cv=none; b=GRqdEnrGkecCuGReEcOvfxdRUZ8JNsARvZ03//09EZ5jGKtjSTstiiiJbJ8EycLiVJFvbmZvDbpLbKrFfaepZud744JwLO57gBXGlZOn7v5Wy4P6koaAI4DvMIlgQo30tckyPxN2mp3paqzfY7PCH39oGKKdXAXwgfCqFY+Ecr4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789544958; c=relaxed/simple;
	bh=Xzf2NnxSkoYQ5l6RWJ6ZqS8TrSk7m8UxnQbhT5qUdNs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=urdirgVlxIrJ9V0KJxQ+/cf7TH6sxzxYStQnZerCRr2JGqd3KSRlSQTbGRpRDtoZZMCUKkhlKEVd3u9QWivcb6ckOHyVlnMWNHE5gOUSMERCEhtzhjdcuUqKG90YGwAFCkqLynoFqPeshdhSk2zNwHFdhzf2F1j5Xf86mfVJv2w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Qem7YAkL; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Qem7YAkL"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49e721b5503so6877405e9.0
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 00:49:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789544942; x=1790149742; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4K1UpPG7ljN/QiYI3QNv6rJ/ZU2LowLGrbVVBMMoilk=;
        b=Qem7YAkLjdny39Qw+/1K+fcByKi8J09HBiYwoFVAufy8qkBeaq4DehQmILU4cEIt5T
         CgwYDrSKy41W2I/VPT31ZlRCgr1CYw/WEcRhT91BWVal09VUsYGy6KQxpSgOe/Cu4jrw
         1hWqQl+1wOmRSjroQZvtDXCbdYNJrR22myhh3+n0njg1JOJ0nQLYYKxS4minLoCtGesU
         7HATGZJP8e7CC50a2mpRb/ShNics2blwCTpy8fxX1tUpId1ckVPLd67HueHQDfmxryMO
         dUnicogbD6kGA+gF5V8rVj2uE4IEOhufyohmwMSGrLaavnZakvvYpEcUG5COY8Mh3ssY
         TuFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789544942; x=1790149742;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=4K1UpPG7ljN/QiYI3QNv6rJ/ZU2LowLGrbVVBMMoilk=;
        b=arcCaEJfhWzx4Kb2Rko30TPWCFJBsVUFyOwinXQWGIEHRG9RrPK3XRraEaUBRkNTeQ
         2cY6V2zNjYP1cXuiEzit0CiUd5rNsli1tBjPxoEaknwH23kUREeQtS4FGx+l23ba/kv+
         EqPWBtGJY81cP+gMNAr6yIiCwZb2Ju+NYwAUvVZWKJtd6BnSqUHuROjtOq+NcSu3w/E4
         CrIfvQvWBqP8Ubfj7BtDH6F3EK3Nf4MJyECi4p3lNQwy62SG9bvWvCwejGqxdD8Gf4du
         xr36zIXtrcYnYaNwb9XZt4owTE9uPRO6/EuCeYvUVTz75kV8C279RyNLF+xq9933Tz/z
         pkYg==
X-Forwarded-Encrypted: i=1; AKwUvBzZXXnz6dIchE7m6hPJjBAHp4Md5cucN7b0VoWHk3a4eTK9OzCV+xrC0q6LOij8DPI9cFQfNwBzRAMrUK0=@vger.kernel.org
X-Gm-Message-State: AFuF++k/hQH+FcjJfeO8eadDHaTv5jT+BdzcmgjO7CCJy9LWNJJd9yOs
	uZQsszawroqkvbtDau6LEjt/oAP2mo2tKIbuMwGSpZ+Nm5T0kX3XvcIN
X-Gm-Gg: AYBFou1a5AWCIa0TCH5SDGz/bm1czTiQ4L58gS1dl8alBgEebZkq5ctFBSjDNFEIzjX
	lzajpcWmxhFGdZyg5ldbUq/PIgKwjl6OUkB3KW2k6vyBrzkFdTI0KvKsBO8iCriy9ka+H0MrzGW
	6SdKuOJjiZmrWz6YpmFwtiFwNQl0uit3HqtG8tW9k1aLpvy7tUdvhWE/wQgF2iFoKJU+sPaM6Fy
	iAg1eUJGleN+epymV+INFRuKiufRxGPxinSELnQcLebRMZ05q7XTph+MQCY7Tqe9oU5wnRlrf8j
	2Pz3miYs+0YpVWxv4pKRiyBYZQ/0GsyrIEFIa41baFYBZNXf1udncgyDdAgHQ77D9PNciHyGty3
	rmVQX4En5/WiXE6FfBGuidFsf3gxq7SjWhW5ZM5cMDfak8eCDrwO4K/p5oNvoxbGoVagxEf5Uq1
	lg7L//E1wUR3lauRPf3X2tTLF22Nu7ZPF4zbbjSGSvoQeYs+U1y7F2f2c0ZzsVkXHGSxX804lnN
	6xnccGZ/CsDpdiIpsERsw==
X-Received: by 2002:a05:600c:8b8a:b0:49e:799a:8951 with SMTP id 5b1f17b1804b1-49eb72fc61emr17610865e9.11.1789544941673;
        Wed, 16 Sep 2026 00:49:01 -0700 (PDT)
Received: from ubuntu-4gb-nbg1-1.. ([2a01:4f8:1c19:b0ad::1])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e83aeae01sm62947195e9.6.2026.09.16.00.49.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 00:49:01 -0700 (PDT)
From: =?UTF-8?q?Rare=C8=99-Mihai=20Vladu?= <vladurares@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	lkp@intel.com,
	error27@gmail.com,
	=?UTF-8?q?Rare=C8=99-Mihai=20Vladu?= <vladurares@gmail.com>
Subject: [PATCH v3] staging: rtl8723bs: fix lines exceeding 100 columns in rtw_security.c
Date: Wed, 16 Sep 2026 07:48:43 +0000
Message-ID: <20260916074843.1038743-1-vladurares@gmail.com>
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
Changes in v3:
  - moved variable declarations to the top of their blocks
  - reverted formatting of dead code comment (will be removed
    in a separate patch)

Changes in v2:
  - renamed keyid to bip_keyid to avoid redefinition error
    reported by kernel test robot

 drivers/staging/rtl8723bs/core/rtw_security.c | 90 +++++++++++++------
 1 file changed, 63 insertions(+), 27 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_security.c b/drivers/staging/rtl8723bs/core/rtw_security.c
index 2217cffac..569030054 100644
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
@@ -62,14 +63,19 @@ void rtw_wep_encrypt(struct adapter *padapter, u8 *pxmitframe)
 		keylength = psecuritypriv->dot11DefKeylen[psecuritypriv->dot11PrivacyKeyIndex];
 
 		for (curfragnum = 0; curfragnum < pattrib->nr_frags; curfragnum++) {
+			int idx = psecuritypriv->dot11PrivacyKeyIndex;
+
 			iv = pframe + pattrib->hdrlen;
 			memcpy(&wepkey[0], iv, 3);
-			memcpy(&wepkey[3], &psecuritypriv->dot11DefKey[psecuritypriv->dot11PrivacyKeyIndex].skey[0], keylength);
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
@@ -113,8 +120,11 @@ void rtw_wep_decrypt(struct adapter  *padapter, u8 *precvframe)
 		keylength = psecuritypriv->dot11DefKeylen[keyindex];
 		memcpy(&wepkey[0], iv, 3);
 		/* memcpy(&wepkey[3], &psecuritypriv->dot11DefKey[psecuritypriv->dot11PrivacyKeyIndex].skey[0], keylength); */
-		memcpy(&wepkey[3], &psecuritypriv->dot11DefKey[keyindex].skey[0], keylength);
-		length = ((union recv_frame *)precvframe)->u.hdr.len - prxattrib->hdrlen - prxattrib->iv_len;
+		memcpy(&wepkey[3],
+		       &psecuritypriv->dot11DefKey[keyindex].skey[0],
+		       keylength);
+		length = ((union recv_frame *)precvframe)->u.hdr.len -
+			 prxattrib->hdrlen - prxattrib->iv_len;
 
 		payload = pframe + prxattrib->iv_len + prxattrib->hdrlen;
 
@@ -157,7 +167,8 @@ void rtw_secmicappendbyte(struct mic_data *pmicdata, u8 b)
 		pmicdata->L ^= pmicdata->M;
 		pmicdata->R ^= ROL32(pmicdata->L, 17);
 		pmicdata->L += pmicdata->R;
-		pmicdata->R ^= ((pmicdata->L & 0xff00ff00) >> 8) | ((pmicdata->L & 0x00ff00ff) << 8);
+		pmicdata->R ^= ((pmicdata->L & 0xff00ff00) >> 8) |
+			 ((pmicdata->L & 0x00ff00ff) << 8);
 		pmicdata->L += pmicdata->R;
 		pmicdata->R ^= ROL32(pmicdata->L, 3);
 		pmicdata->L += pmicdata->R;
@@ -418,7 +429,8 @@ static void phase2(u8 *rc4key, const u8 *tk, const u16 *p1k, u16 iv16)
 
 /* The hlen isn't include the IV */
 u32 rtw_tkip_encrypt(struct adapter *padapter, u8 *pxmitframe)
-{																	/*  exclude ICV */
+{
+	/*  exclude ICV */
 	u16 pnl;
 	u32 pnh;
 	u8 rc4key[16];
@@ -467,7 +479,8 @@ u32 rtw_tkip_encrypt(struct adapter *padapter, u8 *pxmitframe)
 		phase2(&rc4key[0], prwskey, (u16 *)&ttkey[0], pnl);
 
 		if ((curfragnum + 1) == pattrib->nr_frags) {	/* 4 the last fragment */
-			length = pattrib->last_txcmdsz - pattrib->hdrlen - pattrib->iv_len - pattrib->icv_len;
+			length = pattrib->last_txcmdsz - pattrib->hdrlen -
+				 pattrib->iv_len - pattrib->icv_len;
 			crc.f0 = cpu_to_le32(~crc32_le(~0, payload, length));
 
 			arc4_setkey(ctx, rc4key, 16);
@@ -475,7 +488,8 @@ u32 rtw_tkip_encrypt(struct adapter *padapter, u8 *pxmitframe)
 			arc4_crypt(ctx, payload + length, crc.f1, 4);
 
 		} else {
-			length = pxmitpriv->frag_len - pattrib->hdrlen - pattrib->iv_len - pattrib->icv_len;
+			length = pxmitpriv->frag_len - pattrib->hdrlen -
+				 pattrib->iv_len - pattrib->icv_len;
 			crc.f0 = cpu_to_le32(~crc32_le(~0, payload, length));
 
 			arc4_setkey(ctx, rc4key, 16);
@@ -491,7 +505,8 @@ u32 rtw_tkip_encrypt(struct adapter *padapter, u8 *pxmitframe)
 
 /* The hlen isn't include the IV */
 u32 rtw_tkip_decrypt(struct adapter *padapter, u8 *precvframe)
-{																	/*  exclude ICV */
+{
+	/*  exclude ICV */
 	u16 pnl;
 	u32 pnh;
 	u8   rc4key[16];
@@ -536,7 +551,8 @@ u32 rtw_tkip_decrypt(struct adapter *padapter, u8 *precvframe)
 			if (jiffies_to_msecs(jiffies - start) > 1000) {
 				if (no_gkey_bc_cnt || no_gkey_mc_cnt) {
 					netdev_dbg(padapter->pnetdev,
-						   FUNC_ADPT_FMT " no_gkey_bc_cnt:%u, no_gkey_mc_cnt:%u\n",
+						   FUNC_ADPT_FMT
+						   " no_gkey_bc_cnt:%u, no_gkey_mc_cnt:%u\n",
 						   FUNC_ADPT_ARG(padapter),
 						   no_gkey_bc_cnt,
 						   no_gkey_mc_cnt);
@@ -550,7 +566,8 @@ u32 rtw_tkip_decrypt(struct adapter *padapter, u8 *precvframe)
 
 		if (no_gkey_bc_cnt || no_gkey_mc_cnt) {
 			netdev_dbg(padapter->pnetdev,
-				   FUNC_ADPT_FMT " gkey installed. no_gkey_bc_cnt:%u, no_gkey_mc_cnt:%u\n",
+				   FUNC_ADPT_FMT
+				   " gkey installed. no_gkey_bc_cnt:%u, no_gkey_mc_cnt:%u\n",
 				   FUNC_ADPT_ARG(padapter),
 				   no_gkey_bc_cnt,
 				   no_gkey_mc_cnt);
@@ -566,7 +583,8 @@ u32 rtw_tkip_decrypt(struct adapter *padapter, u8 *precvframe)
 
 	iv = pframe + prxattrib->hdrlen;
 	payload = pframe + prxattrib->iv_len + prxattrib->hdrlen;
-	length = ((union recv_frame *)precvframe)->u.hdr.len - prxattrib->hdrlen - prxattrib->iv_len;
+	length = ((union recv_frame *)precvframe)->u.hdr.len -
+		 prxattrib->hdrlen - prxattrib->iv_len;
 
 	GET_TKIP_PN(iv, dot11txpn);
 
@@ -757,10 +775,12 @@ static void construct_ctr_preload(u8 *ctr_preload,
 	if (frtype == WIFI_MGT_TYPE)
 		ctr_preload[1] |= BIT(4);
 
+	/* ctr_preload[2:7] = A2[0:5] = mpdu[10:15] */
 	for (i = 2; i < 8; i++)
-		ctr_preload[i] = mpdu[i + 8];                       /* ctr_preload[2:7] = A2[0:5] = mpdu[10:15] */
+		ctr_preload[i] = mpdu[i + 8];
+	/* ctr_preload[8:13] = PN[5:0] */
 	for (i = 8; i < 14; i++)
-		ctr_preload[i] =    pn_vector[13 - i];          /* ctr_preload[8:13] = PN[5:0] */
+		ctr_preload[i] = pn_vector[13 - i];
 	ctr_preload[14] = (unsigned char)(c / 256); /* Ctr */
 	ctr_preload[15] = (unsigned char)(c % 256);
 }
@@ -952,11 +972,13 @@ u32 rtw_aes_encrypt(struct adapter *padapter, u8 *pxmitframe)
 
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
@@ -1205,7 +1227,8 @@ u32 rtw_aes_decrypt(struct adapter *padapter, u8 *precvframe)
 			if (jiffies_to_msecs(jiffies - start) > 1000) {
 				if (no_gkey_bc_cnt || no_gkey_mc_cnt) {
 					netdev_dbg(padapter->pnetdev,
-						   FUNC_ADPT_FMT " no_gkey_bc_cnt:%u, no_gkey_mc_cnt:%u\n",
+						   FUNC_ADPT_FMT
+						   " no_gkey_bc_cnt:%u, no_gkey_mc_cnt:%u\n",
 						   FUNC_ADPT_ARG(padapter),
 						   no_gkey_bc_cnt,
 						   no_gkey_mc_cnt);
@@ -1220,7 +1243,8 @@ u32 rtw_aes_decrypt(struct adapter *padapter, u8 *precvframe)
 
 		if (no_gkey_bc_cnt || no_gkey_mc_cnt) {
 			netdev_dbg(padapter->pnetdev,
-				   FUNC_ADPT_FMT " gkey installed. no_gkey_bc_cnt:%u, no_gkey_mc_cnt:%u\n",
+				   FUNC_ADPT_FMT
+				   " gkey installed. no_gkey_bc_cnt:%u, no_gkey_mc_cnt:%u\n",
 				   FUNC_ADPT_ARG(padapter),
 				   no_gkey_bc_cnt,
 				   no_gkey_mc_cnt);
@@ -1238,7 +1262,8 @@ u32 rtw_aes_decrypt(struct adapter *padapter, u8 *precvframe)
 		prwskey = &stainfo->dot118021x_UncstKey.skey[0];
 	}
 
-	length = ((union recv_frame *)precvframe)->u.hdr.len - prxattrib->hdrlen - prxattrib->iv_len;
+	length = ((union recv_frame *)precvframe)->u.hdr.len -
+		 prxattrib->hdrlen - prxattrib->iv_len;
 
 	res = aes_decipher(prwskey, prxattrib->hdrlen, pframe, length);
 
@@ -1269,13 +1294,20 @@ u32 rtw_BIP_verify(struct adapter *padapter, u8 *precvframe)
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
 		u64 temp_ipn = 0;
+		int bip_keyid;
+		u8 *bip_key;
 		/* save packet number */
 		memcpy(&le_tmp64, p + 4, 6);
 		temp_ipn = le64_to_cpu(le_tmp64);
@@ -1300,8 +1332,10 @@ u32 rtw_BIP_verify(struct adapter *padapter, u8 *precvframe)
 		/* conscruct AAD, copy address 1 to address 3 */
 		memcpy(BIP_AAD + 2, &pwlanhdr->addrs, sizeof(pwlanhdr->addrs));
 
-		if (omac1_aes_128(padapter->securitypriv.dot11wBIPKey[padapter->securitypriv.dot11wBIPKeyid].skey
-			, BIP_AAD, ori_len, mic))
+		bip_keyid = padapter->securitypriv.dot11wBIPKeyid;
+		bip_key = padapter->securitypriv.dot11wBIPKey[bip_keyid].skey;
+
+		if (omac1_aes_128(bip_key, BIP_AAD, ori_len, mic))
 			goto BIP_exit;
 
 		/* MIC field should be last 8 bytes of packet (packet without FCS) */
@@ -1430,7 +1464,8 @@ void rtw_sec_restore_wep_key(struct adapter *adapter)
 	struct security_priv *securitypriv = &adapter->securitypriv;
 	signed int keyid;
 
-	if ((securitypriv->dot11_privacy_algrthm == _WEP40_) || (securitypriv->dot11_privacy_algrthm == _WEP104_)) {
+	if ((securitypriv->dot11_privacy_algrthm == _WEP40_) ||
+	    (securitypriv->dot11_privacy_algrthm == _WEP104_)) {
 		for (keyid = 0; keyid < 4; keyid++) {
 			if (securitypriv->key_mask & BIT(keyid)) {
 				if (keyid == securitypriv->dot11PrivacyKeyIndex)
@@ -1448,7 +1483,8 @@ u8 rtw_handle_tkip_countermeasure(struct adapter *adapter, const char *caller)
 	u8 status = _SUCCESS;
 
 	if (securitypriv->btkip_countermeasure) {
-		unsigned long passing_ms = jiffies_to_msecs(jiffies - securitypriv->btkip_countermeasure_time);
+		unsigned long elapsed = jiffies - securitypriv->btkip_countermeasure_time;
+		unsigned long passing_ms = jiffies_to_msecs(elapsed);
 
 		if (passing_ms > 60 * 1000) {
 			netdev_dbg(adapter->pnetdev,
-- 
2.43.0

