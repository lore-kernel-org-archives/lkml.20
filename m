Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 953543D1AA2
	for <linux-kernel@vger.kernel.org>; Wed,  7 Oct 2026 11:54:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791374069; cv=none; b=l/pV/OVgJVFsJbWs1Wb4dkjtpa4TpA8XpTWtwx1TXg3TUy6/m1kNecOPTXY2X7k5ehczDFY+QEAIr9jrzUIdGEPeveLYphB58XJR51MdUIBiz41UymLWLxphQp2m/981aoKUTjVgsF2bNeZUC5Zt+1TRrxJ8hne0CszKAeqhDzk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791374069; c=relaxed/simple;
	bh=qPsAUzybV6gCxXnbHSXY/WPpDyCPwUWq98p0EGI0M/k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EI4T0Jzui86DrAT1Q/mAWh4hlNCy9xiCkzHkFuFFnFl/z8Vg6eItPWdDst9Fi8y2CZ+mYqkx+X3CjID/bicMcdXx4rWROYIHW22+KOPceEnb31EcLuaFGNQ/BtPvZUIBfN30hwRaPa1KizjQWls6cMFm+honhyXD+JkPEjuHAeY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=X08HWoi6; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="X08HWoi6"
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-3a8adb68d8bso384820a91.1
        for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 04:54:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791374054; x=1791978854; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TxLF9WC9h0ud76U4Gv3cyGgWW9mMfTpz+8WgjYplMkQ=;
        b=X08HWoi6ZCSXb3PnIex3doUc639hxBHd8Je4sLrY64qcjiqGAORIRJlgK4Pwc6ZtZi
         U649BwPqLa/Tdx3m64f/zSVkVD6xeiS3FuM3yi8saxPUGaSW4VMv22enLariwjZopBL5
         Xce8xAX8R6pwouCLkk1m7g8AkpCiOniu2TwWS0xq2ejsFo3s7bctZTPvBNriTA8JdYbb
         wd/VtHkXI3CYh2usQYfr33VAwYZv8Dxn/81tPp4FvdqkL2OWTuYJV8bjSd9rNj6fVSfl
         OwZUzaOo7L0ZqK/SbdxbMTQfr9pOqZgtO5dGCizW36ZfX3SVXg4GVPcHYm8ar3sVz2Px
         iiMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791374054; x=1791978854;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=TxLF9WC9h0ud76U4Gv3cyGgWW9mMfTpz+8WgjYplMkQ=;
        b=SpT/o4Slaau9jXJkpnXUtXLjUw2YDUdCt6vJpdyp43MSmBzbCuS016LgxSk3y8Xp1J
         yIpLemBC74bQOIArir/cpt78ZgNUYuH6TcEqLkItY0z1URLJfGZxqd3c+TgvffuHo6P9
         ig6yW4poF7v5I+BzUzxXYXgefCa3ZdxsHU2G96oEG2qO1LGlg+cyiTXWt2UB2LXuMJ0e
         HNxOHdaQQOsOvr/zPEzv6oaHfbnJgw4gGvn+3su8ABzUV6v/74YGZ/HLldSElKCjcTgJ
         8CoMIX0TKcylEpmPZV7Ekpf/e55W0YERF2+pFyKuF+0ed4pf1EsSD0jDKsxC6O7AtApU
         v4Gw==
X-Forwarded-Encrypted: i=1; AKwUvBwx6qyrjj4/drKrTtE/hVGUTeeSBBusuOeSTX4RO3oeckbi1fUO72+8eTlJyjbtKvkaxeYsTBN8/vowdas=@vger.kernel.org
X-Gm-Message-State: AFq9FYKyPIlj0mAsfu1KQwv8QHCC0b4E7H22/gDevRvOAtfu24F7Zn5U
	TAL0NQS3hhL79q29dQ3c0Lrlauk2VZJyp5To3XqfLL1lo1M2VCD4jr/LqAE9DQ==
X-Gm-Gg: AYBFou2CHjqyWvWW+dtJcKxrLJGmyuFltenZllsBkXOxJdrWKhsv5VPtqJ7cXYcJKS5
	t9cN/ehfyWLvnwnvs5vkn0hUUIXlbOnzWwlXiQM56yLGrZENJ+fHiBzTtITywMXk6KUDYGYY1Bz
	zrj6wl07xUm0lKQPCbwzhuriZ4GJrWo4n/pIduwOQfMFrNxqEUuYCv9XeZz7s55ymReJD1U9SRO
	20uiH9fnL4hRUdR0wPtWIsH0FjPwnEqgvjib6AwcKx5c4NkA8hT6Y9tL4BKCPOJlWABi2O6t13X
	v4ScAjGoItZBgHGO0DTrez6SpKZD6qpdUMoqnmmc9Wa8/oczCOkrR4yhw4CkMZDsTlGqnt8ALbD
	BIWz8tqaO0f/qfSMknYnmAKFC2a/zSzxKHtYvGt/XNMoGEaKUbDRlelraKVsZeUUuApKfTUKJXk
	RuMSqWkSwevHkw+waeIO1vaMoI4Vr92x0z0EDPvgS16xuFSFxgKz7vYiQRjiO5CotjZOJvIzSCn
	yE=
X-Received: by 2002:a17:90b:258b:b0:39e:6a7f:1dcd with SMTP id 98e67ed59e1d1-3a8a117382cmr1766075a91.41.1791374053580;
        Wed, 07 Oct 2026 04:54:13 -0700 (PDT)
Received: from host ([103.103.208.70])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a89b625d01sm4160128a91.14.2026.10.07.04.54.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 04:54:13 -0700 (PDT)
From: Pranav Desai <contact.pranavdesai@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Pranav Desai <contact.pranavdesai@gmail.com>
Subject: [PATCH v3 2/6] staging: rtl8723bs: use bool for flags in rtw_security.c
Date: Wed,  7 Oct 2026 17:23:38 +0530
Message-ID: <20261007115342.1121742-3-contact.pranavdesai@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261007115342.1121742-1-contact.pranavdesai@gmail.com>
References: <20261007115342.1121742-1-contact.pranavdesai@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace 'uint' with 'bool' for the 'qc_exists' and 'a4_exists' variables
since they are only used to track true/false state.

Update their assignments from 1/0 to true/false to match the standard
boolean type.

Signed-off-by: Pranav Desai <contact.pranavdesai@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_security.c | 34 ++++++++++---------
 1 file changed, 18 insertions(+), 16 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_security.c b/drivers/staging/rtl8723bs/core/rtw_security.c
index af461971c827..34e35c0eccbc 100644
--- a/drivers/staging/rtl8723bs/core/rtw_security.c
+++ b/drivers/staging/rtl8723bs/core/rtw_security.c
@@ -628,8 +628,8 @@ static void aes128k128d(u8 *key, u8 *data, u8 *ciphertext)
 /* nonce                                        */
 /************************************************/
 static void construct_mic_iv(u8 *mic_iv,
-			     signed int qc_exists,
-			     signed int a4_exists,
+			     bool qc_exists,
+			     bool a4_exists,
 			     u8 *mpdu,
 			     uint payload_length,
 			     u8 *pn_vector,
@@ -702,8 +702,8 @@ static void construct_mic_header1(u8 *mic_header1,
 /************************************************/
 static void construct_mic_header2(u8 *mic_header2,
 				  u8 *mpdu,
-				  signed int a4_exists,
-				  signed int qc_exists)
+				  bool a4_exists,
+				  bool qc_exists)
 {
 		signed int i;
 
@@ -783,7 +783,8 @@ static void construct_ctr_preload(u8 *ctr_preload,
 static signed int aes_cipher(u8 *key, u16 hdrlen,
 			     u8 *pframe, u32 plen)
 {
-	uint	qc_exists, a4_exists, i, j, payload_remainder,
+	bool qc_exists, a4_exists;
+	uint	i, j, payload_remainder,
 		num_blocks, payload_index;
 
 	u8 pn_vector[6];
@@ -803,14 +804,14 @@ static signed int aes_cipher(u8 *key, u16 hdrlen,
 	frsubtype = frsubtype >> 4;
 
 	if ((hdrlen == WLAN_HDR_A3_LEN) || (hdrlen ==  WLAN_HDR_A3_QOS_LEN))
-		a4_exists = 0;
+		a4_exists = false;
 	else
-		a4_exists = 1;
+		a4_exists = true;
 
 	if (((frtype | frsubtype) == WIFI_DATA_CFACK) ||
 	    ((frtype | frsubtype) == WIFI_DATA_CFPOLL) ||
 	    ((frtype | frsubtype) == WIFI_DATA_CFACKPOLL)) {
-		qc_exists = 1;
+		qc_exists = true;
 		if (hdrlen !=  WLAN_HDR_A3_QOS_LEN)
 			hdrlen += 2;
 
@@ -822,9 +823,9 @@ static signed int aes_cipher(u8 *key, u16 hdrlen,
 		if (hdrlen !=  WLAN_HDR_A3_QOS_LEN)
 			hdrlen += 2;
 
-		qc_exists = 1;
+		qc_exists = true;
 	} else {
-		qc_exists = 0;
+		qc_exists = false;
 	}
 
 	pn_vector[0] = pframe[hdrlen];
@@ -984,7 +985,8 @@ static signed int aes_decipher(u8 *key, u8 hdrlen,
 			       u8 *pframe, u32 plen)
 {
 	static u8 message[MAX_MSG_SIZE];
-	uint qc_exists, a4_exists, i, j, payload_remainder,
+	bool qc_exists, a4_exists;
+	uint i, j, payload_remainder,
 			num_blocks, payload_index;
 	signed int res = _SUCCESS;
 	u8 pn_vector[6];
@@ -1018,14 +1020,14 @@ static signed int aes_decipher(u8 *key, u8 hdrlen,
 	pn_vector[5]  = pframe[hdrlen + 7];
 
 	if ((hdrlen == WLAN_HDR_A3_LEN) || (hdrlen ==  WLAN_HDR_A3_QOS_LEN))
-		a4_exists = 0;
+		a4_exists = false;
 	else
-		a4_exists = 1;
+		a4_exists = true;
 
 	if (((frtype | frsubtype) == WIFI_DATA_CFACK) ||
 	    ((frtype | frsubtype) == WIFI_DATA_CFPOLL) ||
 	    ((frtype | frsubtype) == WIFI_DATA_CFACKPOLL)) {
-		qc_exists = 1;
+		qc_exists = true;
 		if (hdrlen !=  WLAN_HDR_A3_QOS_LEN)
 			hdrlen += 2;
 
@@ -1037,9 +1039,9 @@ static signed int aes_decipher(u8 *key, u8 hdrlen,
 		if (hdrlen !=  WLAN_HDR_A3_QOS_LEN)
 			hdrlen += 2;
 
-		qc_exists = 1;
+		qc_exists = true;
 	} else {
-		qc_exists = 0;
+		qc_exists = false;
 	}
 
 	/*  now, decrypt pframe with hdrlen offset and plen long */
-- 
2.55.0

