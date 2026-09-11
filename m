Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BE6649E150
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 05:51:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789105861; cv=none; b=XlGvtO7rKIBDmMTXR1qaru6Mwnzq1zxV0gsGOGjg67pEZZXb3X6Ju/Kb8+lzdeNdd5zdPXbkvwGu5pv7bdHatH2OO8mkS8TevQxggF3o+Xxwu2pUpoljB26QMoRWZft02j7nJ4ESx0I17mlsOWZI+km8SKiAGgY3Y0i4V46oKQo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789105861; c=relaxed/simple;
	bh=YYANp+TTBbv1WMDp1iZThDNlsZpqbDKkOkyykzla+ks=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Ymhr+XAY2r2U5qgJR7psvTS0kqAhup9jVlBbz2w9EL7XZz6kiKJNGvSqS6YaaByTs+q5kGRlCiJmX5zLCyi6BhZlC1s4kiaky6qqSg2utZDVg0xpOadk6+x+Jy5i4ktDVIhrzDS9GM4Dz70ioQeImwLgxArlxxj4TqieiKnzi+U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sQPE+Ej9; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sQPE+Ej9"
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-86927f9ba4dso561962b3a.1
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 22:51:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789105860; x=1789710660; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=NUbgazg75ZGLlIe7ZATEFRlDmK/imdYnHRGcGwQ3xn4=;
        b=sQPE+Ej9xPbXxc51+WWDLf/+OQWsrFGW96opzUhcK4+5D19tRTrTOn4SzzOwPB4FcL
         rYzpT3QnwKYfu4KgcSK0AX1/yHCQcZoCfzxrVuKagYMKRjBzd90V5QNp0MiYRt2ntcHz
         hNBjw0wQ/ko3gP3du3pinXaSqMst7RM9rUD3w4uEP8LdaHRSBLnneYjmRRuLdsuyYjOF
         xIintxlG7on8RyS2oYjzpMArc63FgncdI3ZOvoQIGeOjf8jz2Q8b1Y/CDGkoHJHJtNtQ
         ahdiAieEQdIVt98daG8ooGn9OI7dzQCgnDN6mJooTBmBEEb1ik+U6PWOYS+VrcZuBHnt
         Dafw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789105860; x=1789710660;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NUbgazg75ZGLlIe7ZATEFRlDmK/imdYnHRGcGwQ3xn4=;
        b=jvba48TiumO3YqMPkyyEFh6F2By4xn7GWhlUGUfNnXID2aAMzpXgyXBhoD8DrTTRHw
         uoLBAqRQh9rxAAjgS1zzu4AelJXCizN6jqAXudOVlPJq0asHT1FO2sCkKeE7tCJDidAI
         774NQXam/M4ih5rlDS1uOjOUCct8xUyAwkW8bd/f3PjPgsr3PjeBELBhCeeOVlxQ47f2
         f+OI8Jv1E8m8Z6+xbz7SqhjRhXd3JfJqai1M70qRbI8gN28+RSUyhZth3n09cqq7fsDX
         hk2Q8FaeChQZE1rNJQOyeSOh3KvJrt0pMGmcPl008su+p9Q8BHFEnIsZ4INL7fIPs1Zi
         m7cA==
X-Forwarded-Encrypted: i=1; AKwUvByii4MGMZUHlD+QRJDm+/by8ghFVg3fgPDBgiodhBmX6XT4J8XDPjxcGRNNwEqGRqtuKxsg0rSg2mj+x+o=@vger.kernel.org
X-Gm-Message-State: AFuF++keHKye12QQX2GigqEaXfflHRChrvzSB7ELY1/bgO7P5B8GO/WF
	h7U2WoQYBDDfCzzzNtiaOUfRblcbgNC6b48nHVj7HHrymnXKeTsElTGXO0RyWHMyoIwd6A==
X-Gm-Gg: AYBFou0bPuegfK61y1lcCWubJZkdH174+DLniVcNz/t/VtNbLI9U/DAX+KP1UUlJMP0
	mc46sEOTi+3sefVICT3xYTJUbH7dsLn3FuMQrCriPyhJDprbICCD60lRtFuxWso857JP3EkLWfc
	GokhDnYQGQ3RavJedxG/SFcwI9tOTFOFiNYwMZpR3joiIc3zEWs8AuoPbUoLwCxrDt//WesYw7S
	CuHb9ifPbKXN47v4yfdGBQclDyE8YRiWecLzOytMTvkb9DwxuexrQJ5zZbVHqwvous5yDhlFLzZ
	CB/fw7L5xH51LM8yo/EixKit+WfDDSBubQaRNBE0lvQRCD7xDTlTiYs+gae6GjXYif30USvA+s7
	Q3BCxJDEljdqDgEm2i7sDu+OsOqg1bsKIduE9dmJ5A4Ik0FbKGWgZ0L9M4KL0sOyCAOgbLKUjlh
	RQMMcHEnmfnS4N6BeznGp2Mup8Av0l1As7mXR68U72/G4rYlgzqBbK/L+bgFEvDAjNChdPtzTm3
	LIEGw==
X-Received: by 2002:a05:6300:618d:b0:3cc:f008:8123 with SMTP id adf61e73a8af0-3daed153d75mr5226302637.8.1789105859474;
        Thu, 10 Sep 2026 22:50:59 -0700 (PDT)
Received: from spidy ([2401:4900:55a2:c6fd:d9e0:3d5a:b05d:28e])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14365b5e1edsm3654993c88.6.2026.09.10.22.50.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 22:50:58 -0700 (PDT)
From: Gowtham S Bhushan <gowtham398gs@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Ethan Tidmore <ethantidmore06@gmail.com>,
	Dan Carpenter <error27@gmail.com>,
	Lin YuChen <starpt.official@gmail.com>,
	Maksym Pikhotskyi <mpikhotskyi@gmail.com>,
	Sameeksha Sankpal <sameekshasankpal@gmail.com>,
	Artur Stupa <arthur.stupa@gmail.com>,
	Archit Anant <architanant5@gmail.com>,
	linux-staging@lists.linux.dev (open list:STAGING SUBSYSTEM),
	linux-kernel@vger.kernel.org (open list)
Cc: Gowtham S Bhushan <gowtham398gs@gmail.com>
Subject: [PATCH] staging: rtl8723bs: avoid linelength > 100 in rtw_security
Date: Fri, 11 Sep 2026 11:19:02 +0530
Message-ID: <20260911054908.37690-1-gowtham398gs@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Gowtham S Bhushan <gowtham398gs@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_security.c | 29 ++++++++++++-------
 1 file changed, 18 insertions(+), 11 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_security.c b/drivers/staging/rtl8723bs/core/rtw_security.c
index 2217cffac5f2..e82392938805 100644
--- a/drivers/staging/rtl8723bs/core/rtw_security.c
+++ b/drivers/staging/rtl8723bs/core/rtw_security.c
@@ -34,7 +34,7 @@ const char *security_type_str(u8 value)
 
 /* Need to consider the fragment  situation */
 void rtw_wep_encrypt(struct adapter *padapter, u8 *pxmitframe)
-{																	/*  exclude ICV */
+{					/*  exclude ICV */
 	union {
 		__le32 f0;
 		unsigned char f1[4];
@@ -64,7 +64,9 @@ void rtw_wep_encrypt(struct adapter *padapter, u8 *pxmitframe)
 		for (curfragnum = 0; curfragnum < pattrib->nr_frags; curfragnum++) {
 			iv = pframe + pattrib->hdrlen;
 			memcpy(&wepkey[0], iv, 3);
-			memcpy(&wepkey[3], &psecuritypriv->dot11DefKey[psecuritypriv->dot11PrivacyKeyIndex].skey[0], keylength);
+			memcpy(&wepkey[3],
+			       &psecuritypriv->dot11DefKey[psecuritypriv->dot11PrivacyKeyIndex].skey[0],
+			       keylength);
 			payload = pframe + pattrib->iv_len + pattrib->hdrlen;
 
 			if ((curfragnum + 1) == pattrib->nr_frags) {	/* the last fragment */
@@ -112,7 +114,10 @@ void rtw_wep_decrypt(struct adapter  *padapter, u8 *precvframe)
 		keyindex = prxattrib->key_index;
 		keylength = psecuritypriv->dot11DefKeylen[keyindex];
 		memcpy(&wepkey[0], iv, 3);
-		/* memcpy(&wepkey[3], &psecuritypriv->dot11DefKey[psecuritypriv->dot11PrivacyKeyIndex].skey[0], keylength); */
+		/* memcpy(&wepkey[3],
+		 * &psecuritypriv->dot11DefKey[psecuritypriv->dot11PrivacyKeyIndex].skey[0],
+		 * *keylength);
+		 */
 		memcpy(&wepkey[3], &psecuritypriv->dot11DefKey[keyindex].skey[0], keylength);
 		length = ((union recv_frame *)precvframe)->u.hdr.len - prxattrib->hdrlen - prxattrib->iv_len;
 
@@ -157,7 +162,8 @@ void rtw_secmicappendbyte(struct mic_data *pmicdata, u8 b)
 		pmicdata->L ^= pmicdata->M;
 		pmicdata->R ^= ROL32(pmicdata->L, 17);
 		pmicdata->L += pmicdata->R;
-		pmicdata->R ^= ((pmicdata->L & 0xff00ff00) >> 8) | ((pmicdata->L & 0x00ff00ff) << 8);
+		pmicdata->R ^= ((pmicdata->L & 0xff00ff00) >> 8) |
+				((pmicdata->L & 0x00ff00ff) << 8);
 		pmicdata->L += pmicdata->R;
 		pmicdata->R ^= ROL32(pmicdata->L, 3);
 		pmicdata->L += pmicdata->R;
@@ -418,7 +424,7 @@ static void phase2(u8 *rc4key, const u8 *tk, const u16 *p1k, u16 iv16)
 
 /* The hlen isn't include the IV */
 u32 rtw_tkip_encrypt(struct adapter *padapter, u8 *pxmitframe)
-{																	/*  exclude ICV */
+{								/*  exclude ICV */
 	u16 pnl;
 	u32 pnh;
 	u8 rc4key[16];
@@ -491,7 +497,7 @@ u32 rtw_tkip_encrypt(struct adapter *padapter, u8 *pxmitframe)
 
 /* The hlen isn't include the IV */
 u32 rtw_tkip_decrypt(struct adapter *padapter, u8 *precvframe)
-{																	/*  exclude ICV */
+{						/*  exclude ICV */
 	u16 pnl;
 	u32 pnh;
 	u8   rc4key[16];
@@ -747,7 +753,7 @@ static void construct_ctr_preload(u8 *ctr_preload,
 		ctr_preload[i] = 0x00;
 	i = 0;
 
-	ctr_preload[0] = 0x01;                                  /* flag */
+	ctr_preload[0] = 0x01;                      /* flag */
 	if (qc_exists && a4_exists)
 		ctr_preload[1] = mpdu[30] & 0x0f;   /* QoC_Control */
 	if (qc_exists && !a4_exists)
@@ -758,7 +764,7 @@ static void construct_ctr_preload(u8 *ctr_preload,
 		ctr_preload[1] |= BIT(4);
 
 	for (i = 2; i < 8; i++)
-		ctr_preload[i] = mpdu[i + 8];                       /* ctr_preload[2:7] = A2[0:5] = mpdu[10:15] */
+		ctr_preload[i] = mpdu[i + 8];      /* ctr_preload[2:7] = A2[0:5] = mpdu[10:15] */
 	for (i = 8; i < 14; i++)
 		ctr_preload[i] =    pn_vector[13 - i];          /* ctr_preload[8:13] = PN[5:0] */
 	ctr_preload[14] = (unsigned char)(c / 256); /* Ctr */
@@ -766,7 +772,7 @@ static void construct_ctr_preload(u8 *ctr_preload,
 }
 
 static signed int aes_cipher(u8 *key, uint	hdrlen,
-			u8 *pframe, uint plen)
+			     u8 *pframe, uint plen)
 {
 	uint	qc_exists, a4_exists, i, j, payload_remainder,
 		num_blocks, payload_index;
@@ -967,7 +973,7 @@ u32 rtw_aes_encrypt(struct adapter *padapter, u8 *pxmitframe)
 }
 
 static signed int aes_decipher(u8 *key, uint	hdrlen,
-			 u8 *pframe, uint plen)
+			       u8 *pframe, uint plen)
 {
 	static u8 message[MAX_MSG_SIZE];
 	uint qc_exists, a4_exists, i, j, payload_remainder,
@@ -1430,7 +1436,8 @@ void rtw_sec_restore_wep_key(struct adapter *adapter)
 	struct security_priv *securitypriv = &adapter->securitypriv;
 	signed int keyid;
 
-	if ((securitypriv->dot11_privacy_algrthm == _WEP40_) || (securitypriv->dot11_privacy_algrthm == _WEP104_)) {
+	if ((securitypriv->dot11_privacy_algrthm == _WEP40_) ||
+	    (securitypriv->dot11_privacy_algrthm == _WEP104_)) {
 		for (keyid = 0; keyid < 4; keyid++) {
 			if (securitypriv->key_mask & BIT(keyid)) {
 				if (keyid == securitypriv->dot11PrivacyKeyIndex)
-- 
2.55.0

