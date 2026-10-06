Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAA3F4218A4
	for <linux-kernel@vger.kernel.org>; Tue,  6 Oct 2026 20:08:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791317301; cv=none; b=oH8lPIoEC1NJvEb2p+SyabJlWLVAaAeARSNLqf/f38Aelm8bjDqHFvcl5E+sAbLuguyuWcQzseaZDTRB4GnQVCw8zg648edV3j8AEchS/bB6jhXhIbyxUgUhCPogv6jBGsVb31L+soTbL3tE6PZSHNVrxkJiB1qiB4W1o48oqD0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791317301; c=relaxed/simple;
	bh=9Md2jJpjJjyjWYp/JMv0yD30TyFeJS9FeJs1Vbc1QsI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Za98Jv4kYtgTtJoifo8ul8cphrF0niVVdKoM4IJPxY7AI0jzDNQsyJs992sDDX86wRfCopxVXiPWpeJ+TLwdZ5Jm0bLTbvZ5XDPBBy6P+Z+NJ4eVL3ZgHkhkzErw559H5QY70nyUPsteL6bvoMkNbabu8Bw2DftkumwJbHT4ZQY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=R237KRgV; arc=none smtp.client-ip=74.125.82.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="R237KRgV"
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-3514e7cbbbaso2002671eec.1
        for <linux-kernel@vger.kernel.org>; Tue, 06 Oct 2026 13:08:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791317299; x=1791922099; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1pfsSzg5M8YCLBaRHgXYSNSC9AJHvC6CIX9YceZUHJ4=;
        b=R237KRgVvk2sZdLPNpSMpawt964dN0OSpd+zeJiQuLb4Wh8qOrc04Uub4Rr4AFGmA3
         pN9gMUOKvf69525UCr5hcRisRsIK5uweXM/CKs0WXDyScrjBXs38G+iuoz6EBiA3mnzj
         RD/PeHlKL/lOif24E9ygEUdEDKSk6QO/kQZGoq61f9bcor6unvz8RI3dtWoxKlFqJ/yI
         Ct3fdgbUBxYwyOm6P4bVzE9Q9TjgAhNLR+sx3SLjLrjnYgfmb/XWlhZxtNoxSuM9LE7A
         LVQ86axwgESwaIbhM6dF1MKrqTt0/tfFhFleA7BY8TegLivlbwtcMckdiYLTLSkbfJn0
         Oy/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791317299; x=1791922099;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=1pfsSzg5M8YCLBaRHgXYSNSC9AJHvC6CIX9YceZUHJ4=;
        b=anWgePCE5hvknvmwF+XJQY/hhYNt1ShpDzY/0FsoicIRNpJruVKXupTp5+Sc4NzCzU
         kb3DvCgMxoGB/lZ5o8pADu9rU/mlumZTs9cXfjRojWTwG+X3elFRAol6J3OgVoQKoBON
         12MaKqyMuf/Nu3QNuZs+8hKlf5pEoAmMzgzW2jmp7TPd171ItnI+JdpVAHpYVEwFr9+3
         BVrngMaQtQej3+2x5XPpSWzEyvBJK5Pf4LOznSeKduSZapQLilVN+mVG3A20/RXnEcUG
         pjasEUD33irLfwR2cdmZUjEUosjqz5GrkTRbiGvqewtb+1NlfoeUUoXzHotR53tkOIfv
         tJ3Q==
X-Forwarded-Encrypted: i=1; AKwUvByMGpd7fR0Cpa7WWdYRm5e5P0mFTlREedP8Ww9NTKlN5SpK/8+a37wMOP0rwUFgSbkGiYbe6nBujR1lj44=@vger.kernel.org
X-Gm-Message-State: AFuF++kdz42BoGGD9pe2ftk48yfgq2Js1YK+j4OBhiZy0cxxj3q4wiHZ
	35ZGGmG/dR4HQfCV+6gMECiy5Llu0H5DAKm/P7ihzzbme8AwqUiABjAa
X-Gm-Gg: AYBFou3DEVsdWcq38vUoxyJ6/IDtN62LpS2CfN5wsdCSVYRQpPRJ3vVyOyJCkSVVhEq
	y1EYjzFeB8pJJqefS5kXFOfBlRWl3CQPeMIodFSK0r3uOBXZAzu0hnDDljnvrVo/OHun4p0Gtaj
	gk4fMX8reeygKPL8waGBQho6iY1T7QngG/OIIWngzKV7jVkVJj3UOsAcS1/XsgUkuljmVGmYM7v
	mjsl6U1QbaROrU8vVNoNwpozOTpxwS102zcMdJ0Z0p0skMKmJcVMetiGFbZyqcFMFlyYFC9UlAA
	nPuN0ngP2gsA/HxWVeCXogKDUnnrPsb0RR9noQvmdzl5wtoyP1KuLuJGt8nHXIU6aI/6jmCT9X2
	FsXs2sBOleYhtr6tUxCn+Sy6r6403vPlWlOLwPW8aGAb2fcNcy3ZUOqFHbjXB+tmH6KzUBffOHd
	4XCJDx9Z9d5es1EJiMh8lzNSA6bzpZZKHHrmcHxhC8EmIuYIMdZOaJEV1BopVRcSzorqye9gxNM
	w==
X-Received: by 2002:a05:701b:4291:10b0:160:90a3:ca8c with SMTP id a92af1059eb24-16090a3cb93mr1230432c88.7.1791317298667;
        Tue, 06 Oct 2026 13:08:18 -0700 (PDT)
Received: from host ([103.103.208.69])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-161680e191esm804946c88.11.2026.10.06.13.08.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2026 13:08:17 -0700 (PDT)
From: Pranav Desai <contact.pranavdesai@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Pranav Desai <contact.pranavdesai@gmail.com>
Subject: [PATCH v2 2/2] staging: rtl8723bs: replace uint with explicit types in rtw_security.c
Date: Wed,  7 Oct 2026 01:37:51 +0530
Message-ID: <20261006200751.819332-3-contact.pranavdesai@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261006200751.819332-1-contact.pranavdesai@gmail.com>
References: <20261006200751.819332-1-contact.pranavdesai@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The non-standard 'uint' type was being used inconsistently for
lengths, boolean flags, and computed values.

Replace 'uint' with explicit types based on their usage:
- Change 'plen' to u32 in both aes_cipher and aes_decipher.
- Change 'hdrlen' to u16 in aes_cipher to match struct pkt_attrib.
- Change 'hdrlen' to u8 in aes_decipher to match struct rx_pkt_attrib.
- Change 'qc_exists' and 'a4_exists' to bool as they are flags.
- Change 'frtype' and 'frsubtype' to u8 because they are masked
  down from 16-bit values and cannot exceed 8-bit values.
- Change 'payload_remainder' to u8 because it is calculated as
  (plen % 16), which guarantees a range of 0-15.
- Change 'payload_index' to u32 because it indexes into the payload,
  which is bounded by plen (u32).
- Change 'num_blocks' to u32 since it is derived from 'plen' (u32).
- Change 'len' and 'ori_len' in rtw_BIP_verify to u32 since they are
  compute values derived from pattrib->pkt_len.
- Change generic loop iterators (i, j) to unsigned int.
- Update helper functions (construct_mic_iv, construct_mic_header1,
  etc.) to match these new explicit parameter types.

No functional change intended.

Signed-off-by: Pranav Desai <contact.pranavdesai@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_security.c | 51 +++++++++++--------
 1 file changed, 30 insertions(+), 21 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_security.c b/drivers/staging/rtl8723bs/core/rtw_security.c
index 72af46391e23..aeccf89d37b4 100644
--- a/drivers/staging/rtl8723bs/core/rtw_security.c
+++ b/drivers/staging/rtl8723bs/core/rtw_security.c
@@ -628,12 +628,12 @@ static void aes128k128d(u8 *key, u8 *data, u8 *ciphertext)
 /* nonce                                        */
 /************************************************/
 static void construct_mic_iv(u8 *mic_iv,
-			     signed int qc_exists,
-			     signed int a4_exists,
+			     bool qc_exists,
+			     bool a4_exists,
 			     u8 *mpdu,
-			     uint payload_length,
+			     u32 payload_length,
 			     u8 *pn_vector,
-			     uint frtype)
+			     u8 frtype)
 {
 		signed int i;
 
@@ -669,7 +669,7 @@ static void construct_mic_iv(u8 *mic_iv,
 static void construct_mic_header1(u8 *mic_header1,
 				  signed int header_length,
 				  u8 *mpdu,
-				  uint frtype)
+				  u8 frtype)
 {
 		mic_header1[0] = (u8)((header_length - 2) / 256);
 		mic_header1[1] = (u8)((header_length - 2) % 256);
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
 
@@ -752,7 +752,7 @@ static void construct_ctr_preload(u8 *ctr_preload,
 				  u8 *mpdu,
 				  u8 *pn_vector,
 				  signed int c,
-				  uint frtype)
+				  u8 frtype)
 {
 	signed int i = 0;
 
@@ -780,11 +780,14 @@ static void construct_ctr_preload(u8 *ctr_preload,
 	ctr_preload[15] = (unsigned char)(c % 256);
 }
 
-static signed int aes_cipher(u8 *key, uint hdrlen,
-			     u8 *pframe, uint plen)
+static signed int aes_cipher(u8 *key, u16 hdrlen,
+			     u8 *pframe, u32 plen)
 {
-	uint	qc_exists, a4_exists, i, j, payload_remainder,
-		num_blocks, payload_index;
+	unsigned int i, j;
+	bool qc_exists, a4_exists;
+	u8 payload_remainder;
+	u32 payload_index;
+	u32 num_blocks;
 
 	u8 pn_vector[6];
 	u8 mic_iv[16] = {};
@@ -797,8 +800,8 @@ static signed int aes_cipher(u8 *key, uint hdrlen,
 	u8 aes_out[16] = {};
 	u8 padded_buffer[16] = {};
 	u8 mic[8];
-	uint	frtype  = GetFrameType(pframe);
-	uint	frsubtype  = GetFrameSubType(pframe);
+	u8 frtype  = GetFrameType(pframe);
+	u8 frsubtype  = GetFrameSubType(pframe);
 
 	frsubtype = frsubtype >> 4;
 
@@ -980,12 +983,18 @@ u32 rtw_aes_encrypt(struct adapter *padapter, u8 *pxmitframe)
 	return res;
 }
 
-static signed int aes_decipher(u8 *key, uint hdrlen,
-			       u8 *pframe, uint plen)
+static signed int aes_decipher(u8 *key, u16 hdrlen,
+			       u8 *pframe, u32 plen)
 {
 	static u8 message[MAX_MSG_SIZE];
-	uint qc_exists, a4_exists, i, j, payload_remainder,
-			num_blocks, payload_index;
+
+	unsigned int i, j;
+	u8 payload_remainder;
+	u32 payload_index;
+	u32 num_blocks;
+
+	bool qc_exists, a4_exists;
+
 	signed int res = _SUCCESS;
 	u8 pn_vector[6];
 	u8 mic_iv[16] = {};
@@ -999,8 +1008,8 @@ static signed int aes_decipher(u8 *key, uint hdrlen,
 	u8 padded_buffer[16] = {};
 	u8 mic[8];
 
-	uint frtype  = GetFrameType(pframe);
-	uint frsubtype  = GetFrameSubType(pframe);
+	u8 frtype  = GetFrameType(pframe);
+	u8 frsubtype  = GetFrameSubType(pframe);
 
 	frsubtype = frsubtype >> 4;
 
@@ -1266,7 +1275,7 @@ u32 rtw_BIP_verify(struct adapter *padapter, u8 *precvframe)
 	u8 *pframe;
 	u8 *BIP_AAD, *p;
 	u32 res = _FAIL;
-	uint len, ori_len;
+	u32 len, ori_len;
 	struct ieee80211_hdr *pwlanhdr;
 	u8 mic[16];
 	struct mlme_ext_priv *pmlmeext = &padapter->mlmeextpriv;
-- 
2.55.0

