Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A7E246E007
	for <linux-kernel@vger.kernel.org>; Wed,  7 Oct 2026 11:54:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791374071; cv=none; b=VyQpOitamBHuFV1vL78+xVZi8/Ezr05KkiGRIxkXFW8gXjgGUEnQPrxwym6BXiqTVWFTFPBrTeX2OeDOEV4dk+in29UtFQwEJlN4xmxiImYCT8DoVc659zJQSzYSQN+a4ct5ZRSraYMr+jwC675ulwDPE+GAHvbMd6Oa2jSHSzI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791374071; c=relaxed/simple;
	bh=c8CVE9cs8rShzXPsmQd3KD5PoRXwWzAmTDMbQYb64ds=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JfBdo1Gb+EyiEcWUL06poLe1u08zVODAMbpSVkTpjbyMzYwIWoCG3be61+OWRuXPSPvs6Syd+S2xTBORVN/5O9dhMCsyvVOTkZ4CJxQh5lrY4OHVChvOBlPtX4nWYpffy/fFaazQjJZp0wDfOC/An+kixjUJtxsYCY0ck0QL93A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YGz30sQj; arc=none smtp.client-ip=209.85.215.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YGz30sQj"
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-cc7e79c1eaaso844850a12.2
        for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 04:54:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791374057; x=1791978857; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IRRCr34XAhK+FCF6lqb8gz+RLw8aUuaoR2HPbDjY2CY=;
        b=YGz30sQj+j/lBBFFwbSo72QqIuKiZBUectRhC43C7YWXYXpP1QY+4MdKH2griJ1jc+
         A1rjpH+GcCd0pVwka8avlF1rd797Ag2QysVB522SDHC8SB1GF4DgC9GhIySSqFvOGq4P
         ovXtwvjHTfxD3QzZ+TIEXhnH7hoRUTMYEXOdo1/5XbO1PJcNaR9c/Lceym42owzQjnBe
         L3b+CQoPlorp/L8W21xM0WiVkZbwD78hpxNdfMOwDxgZRHugyYhu4mley6e2hRl3Mciv
         tZ8eNLMyYo1ALHhbkM8a6iXB+3OgF6Tuz49W59laee9sD1tYYm1jqZ1H4zCJpgxbApz5
         6WHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791374057; x=1791978857;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=IRRCr34XAhK+FCF6lqb8gz+RLw8aUuaoR2HPbDjY2CY=;
        b=s5Urge/mxhejzih+/ZzD2zKO1Kt6bVljmmd8+m95U8mBXPMq1sIoc2fT/In9wXVeZw
         fuOsZpfpbf+ZWXixhLrsTzaVzEd45RPRnd2JPi9idQ9U88cJnxmd0ABIQwKtQUjybCtJ
         HDq7tTmk9jCebk11hblCpNzP8uKJmSw6a3TOwzrDngiWJuyUKlKJf+B7Fx4EWM+67Utj
         WQiQOxoFuJqTCk+GM1BzMqAveBMXS1rWFZ3n9KnQmmyClEQM59+L4GoYuVnQXj9FGOoR
         /tU6pd05gQYpxBLN2n7HX+/A+U5QuiIG3o0GY9jhyjYkKNqsub0HuH5xIIS9YD3wN3Wt
         PbVg==
X-Forwarded-Encrypted: i=1; AKwUvBzZyDuHJz0e9FZkXhGGVNuqpSOWk48Fq9/ogg5Alvzs11ZypuEUZsJd7OsISOTJdl6E5GMOn9kpNazo4VM=@vger.kernel.org
X-Gm-Message-State: AFq9FYKvsz0OGZG5J0nRKPm3FP6ATeOUAvH449lks6Mi3mlgKaRMRGKY
	0c1xAHwsZ5u0CF2YUSyjHPeK1gks5Ci/hDO4TqCgbHpQnabb/Fp/F3ci
X-Gm-Gg: AYBFou1wpuhLHEeISx+PEJ/0MZJAB+XsE9wpSvhH2A3SguCHq9qnFcyn15SOnhi7XcY
	rLDYBKrlRpuarfXiCT5ev06Z63AEZyq2lRIBreRs6dU93mc31ul1Y+IU1MV3nOmgTfaS92JGkPc
	SfPvgsXTt1aDTJxMu6CR4VDzeBZ/43B7bPNac1B2WrsX1TBCy5vBLVKGYGWANXjVu3vr/+NHPFu
	40K6f+5Qv8zMlRVo4mLXKaN/qVlnBN8ArkPmqozFByQS8XJtr09FqnyHOY4yJiN15MA2XJFGSNW
	NOGfip3SVYTJRB5JJmS0bKKr9teiNacU5mQMUbfBtPaV9ujRTz5RPIrgaS/P13hShghpG/C5C2e
	oqn7rpKeuwUZCgqpE5Fm2asvlIEBN9FPVmt+t+PTTKD/4EFB6Rv28Er7QeeF4i4bwPqfk4yVJup
	4J4xxOuZ/Y9hWPcegG8pFaqIyhoC6esV07FIPaBiKjDFxsI7xr/pWUeoxZQKQ414EAaAW5ZRor+
	g==
X-Received: by 2002:a17:90b:1812:b0:3a8:6b84:234d with SMTP id 98e67ed59e1d1-3a89f693aedmr1421277a91.6.1791374057601;
        Wed, 07 Oct 2026 04:54:17 -0700 (PDT)
Received: from host ([103.103.208.70])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a89b625d01sm4160128a91.14.2026.10.07.04.54.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 04:54:17 -0700 (PDT)
From: Pranav Desai <contact.pranavdesai@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Pranav Desai <contact.pranavdesai@gmail.com>
Subject: [PATCH v3 3/6] staging: rtl8723bs: use u8 for frame types in rtw_security.c
Date: Wed,  7 Oct 2026 17:23:39 +0530
Message-ID: <20261007115342.1121742-4-contact.pranavdesai@gmail.com>
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

Replace 'uint' with 'u8' for the 'frtype' and 'frsubtype' variables
in rtw_security.c.

These variables are populated by the GetFrameType() and GetFrameSubType()
macros, which read a 16-bit value but apply a bitwise mask (bits 2-3 for
type, bits 2-7 for subtype). Because the highest possible value after
masking is 252, these variables are guaranteed to fit within an 8-bit
unsigned integer.

Signed-off-by: Pranav Desai <contact.pranavdesai@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_security.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_security.c b/drivers/staging/rtl8723bs/core/rtw_security.c
index 34e35c0eccbc..676587fabfe4 100644
--- a/drivers/staging/rtl8723bs/core/rtw_security.c
+++ b/drivers/staging/rtl8723bs/core/rtw_security.c
@@ -633,7 +633,7 @@ static void construct_mic_iv(u8 *mic_iv,
 			     u8 *mpdu,
 			     uint payload_length,
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
@@ -752,7 +752,7 @@ static void construct_ctr_preload(u8 *ctr_preload,
 				  u8 *mpdu,
 				  u8 *pn_vector,
 				  signed int c,
-				  uint frtype)
+				  u8 frtype)
 {
 	signed int i = 0;
 
@@ -798,8 +798,8 @@ static signed int aes_cipher(u8 *key, u16 hdrlen,
 	u8 aes_out[16] = {};
 	u8 padded_buffer[16] = {};
 	u8 mic[8];
-	uint	frtype  = GetFrameType(pframe);
-	uint	frsubtype  = GetFrameSubType(pframe);
+	u8 frtype  = GetFrameType(pframe);
+	u8 frsubtype  = GetFrameSubType(pframe);
 
 	frsubtype = frsubtype >> 4;
 
@@ -1001,8 +1001,8 @@ static signed int aes_decipher(u8 *key, u8 hdrlen,
 	u8 padded_buffer[16] = {};
 	u8 mic[8];
 
-	uint frtype  = GetFrameType(pframe);
-	uint frsubtype  = GetFrameSubType(pframe);
+	u8 frtype  = GetFrameType(pframe);
+	u8 frsubtype  = GetFrameSubType(pframe);
 
 	frsubtype = frsubtype >> 4;
 
-- 
2.55.0

