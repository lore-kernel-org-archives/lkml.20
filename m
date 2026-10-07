Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B78345563C
	for <linux-kernel@vger.kernel.org>; Wed,  7 Oct 2026 11:54:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791374066; cv=none; b=T9lzbuewoq8GfpnX4cQ6OaFLxuI3LzbFnCbkfOodf3ipHOvQMaZTzD7mLkBXSqLhnGoY6eTA9tqjanwSW8Es0qNIijk4CZ/43LguDuabP6ODrrXaR+CBxjekA22chLRtmIIt3KolqOyiTA/JRhr4X5yn/9kDoZ7IPe+aD2aUMgU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791374066; c=relaxed/simple;
	bh=fcGoZRBmcT/XnntCGGMJuw3KhhpWm+oE/Y84BlaoIRc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=D99idDn9Y/NiDQghG77xlEmKm2muXLCi3O3S3xs2aEIQFqr2eJME3/P1f77k714CFIGJhdJAXdxc9g90M0q28Y2h2IYSCfTcfGCJQo4y58+AMq5NcLwNYVJd/pLwLTumF4lPuKbOaIQ6loGFAB8tetd95HFhRdRtb67ujFZ9T+M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GeDjC86x; arc=none smtp.client-ip=209.85.215.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GeDjC86x"
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-ca766c1c9ccso745468a12.0
        for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 04:54:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791374049; x=1791978849; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PLm7KzD79N/Cg7Z5ZIyi8jbxgll41XxA0GnbG59QrvM=;
        b=GeDjC86xjmYdzOXcDeB8JQ7+JaSCDNLq0LcHnsibkcKLzUs5zGGHJSyqiO0T6LbZ36
         s2Dhrj0yyMcR2GVCAb755Y4VO4QF3lP6yBCsE6jsBe1YaGuyvKTTtyc9FAPvq92hx1XO
         Oa5FKgflThnkxDYKzGZy3Vh6G9FdG0oqcTcXCU56RwOJBGK2RvBnhibnDS9Gf070I3oi
         SyWBTwgGOnn/nguKf5rfTWEgOKNmLC1jP0E4wZo5xvHtLiU2/ydIRvaMVccnq7oUYiZL
         XrDoxqYDp32jm/aL9MODzKKewIG2o5f1H/6NKk64ARqD0ezRmypJHFZJ5jVRBgQVSy53
         AvBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791374049; x=1791978849;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=PLm7KzD79N/Cg7Z5ZIyi8jbxgll41XxA0GnbG59QrvM=;
        b=E9xT3t2kQbPHJhmJmZolkwP4FGazaIaCH3rVIWKCrOMy3iEQS7phK+MODNWlmVn9dJ
         oZfrG4TnnNS1GTGmbJq1QTcWG35IFgbjHTU3VX+NbXpC0Q6A2ViT/LxnerWGWUKWbHX1
         Zmf9E1lNBmDm7uCKt4/VjabjEDuyEigrPkKnNNQwYqJOvox9JiOBr/KBif5qJteH5GFX
         vd7or66ebWR6OgwZ/HDJUsQttsiSeQU1eLXqODMnbQsOJNAvT6hgGY26jDqh1iLExMzG
         dr9t0hnk5cKrCeQ64E0UXZzGtXrRNTS4hIk6f2CDavXBUm9J+zZz/kS44ocHct3mdOfY
         QyMQ==
X-Forwarded-Encrypted: i=1; AKwUvBy2lnOwVEGjW26GEdyj3uGU5nfOkC2rw8yC6+uniQPDcMiKXPYBuoa3UqdXamfZ7poC6VT1YDn8oLgcOl8=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ2w2Z48Phka87TIXvdByaID9N/rWQvTiiU9I6b2sBPgI1HWR4o
	bVf4D6dLc3Uic3KenCsLBfDlXA61ucIeOFcYIKQC7tQbYcK+fWGaKUgP
X-Gm-Gg: AYBFou1KHs4cFPPfIx40Gzk4Lf0D58/wu2rhGau/nEQmMo0oxfX0mRWgyt36zjEHiZ3
	gZ7ne354UC8cUwQhHp2Pgo50A7CIIEpKfb7Ll4JKIwnj3sxIugvAN8Lf4lhsBUVxFotpjmLz7M0
	Wt2BU68lrf+IMWlopf5q1yNK4fIjAs0GRHdXYTOEv5UZaXPoO7DVsF1ItpVlQVOYPLypbPOV+2o
	tdUDgVdT33LEGZimWrkr/QqniRgoMMp69okgDuhf3uYe+2fYLwsZ4d8IFFWriAP7tkRxbOWwnmd
	zj4Un39zFlSVkcpEjmmZ2AVmvrw0EynsX2T/pYb9emon2Th+6YrksgVleMbXjFyS/9qrLdst/z8
	QJhTOP58OmDKiBY9i8Xl5DBiyJN8Qmz7nVEYhaLy5PqBn8ru+/3UxA4PAMBnjhQ+Cg9ts/9w8J4
	31m0xX5rjU/K9/Ps7nGk2KsF8fSoo4UVNxvdaCexhxV8nBukp8jkoFLiJpB9wNeqDiIIzP3tpsg
	Q==
X-Received: by 2002:a17:90b:3e86:b0:39e:4c7f:7306 with SMTP id 98e67ed59e1d1-3a8a19b1e0cmr1657682a91.29.1791374048481;
        Wed, 07 Oct 2026 04:54:08 -0700 (PDT)
Received: from host ([103.103.208.70])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a89b625d01sm4160128a91.14.2026.10.07.04.54.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 04:54:08 -0700 (PDT)
From: Pranav Desai <contact.pranavdesai@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Pranav Desai <contact.pranavdesai@gmail.com>
Subject: [PATCH v3 1/6] staging: rtl8723bs: use explicit types for lengths in rtw_security.c
Date: Wed,  7 Oct 2026 17:23:37 +0530
Message-ID: <20261007115342.1121742-2-contact.pranavdesai@gmail.com>
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

Replace 'uint' with explicit types for length variables in rtw_security.c
based on how they are used:

- aes_cipher(): use u16 for hdrlen and u32 for plen to match the fields
  in struct pkt_attrib.
- aes_decipher(): use u8 for hdrlen to match struct rx_pkt_attrib. Use
  u32 for plen since it is calculated from a 32-bit packet length.

Signed-off-by: Pranav Desai <contact.pranavdesai@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_security.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_security.c b/drivers/staging/rtl8723bs/core/rtw_security.c
index 72af46391e23..af461971c827 100644
--- a/drivers/staging/rtl8723bs/core/rtw_security.c
+++ b/drivers/staging/rtl8723bs/core/rtw_security.c
@@ -780,8 +780,8 @@ static void construct_ctr_preload(u8 *ctr_preload,
 	ctr_preload[15] = (unsigned char)(c % 256);
 }
 
-static signed int aes_cipher(u8 *key, uint hdrlen,
-			     u8 *pframe, uint plen)
+static signed int aes_cipher(u8 *key, u16 hdrlen,
+			     u8 *pframe, u32 plen)
 {
 	uint	qc_exists, a4_exists, i, j, payload_remainder,
 		num_blocks, payload_index;
@@ -980,8 +980,8 @@ u32 rtw_aes_encrypt(struct adapter *padapter, u8 *pxmitframe)
 	return res;
 }
 
-static signed int aes_decipher(u8 *key, uint hdrlen,
-			       u8 *pframe, uint plen)
+static signed int aes_decipher(u8 *key, u8 hdrlen,
+			       u8 *pframe, u32 plen)
 {
 	static u8 message[MAX_MSG_SIZE];
 	uint qc_exists, a4_exists, i, j, payload_remainder,
-- 
2.55.0

