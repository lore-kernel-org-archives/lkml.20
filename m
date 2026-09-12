Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E3A83749FE
	for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 05:27:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789190872; cv=none; b=lkCe/kP57aS6VWHawUduTLOyBriYnaoue8eHSVWuSoIL6v9J1b+ksgwtaBDedpKewIevTNtUmUdp8kEvTZ4s8g3VYTdsgpm5IXgFpO+2F3Bu9j0gj0Px4XFNFGPYgoZAgE90/+aoFael1CRVLCKMAa02ah7Kz4Pg0Byn5U5iTgo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789190872; c=relaxed/simple;
	bh=9e3MoimqO18CLNKOqyXRMIUHKkz4UELWpbyKkfKkGQA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=JORMxP8UuNf+xsnbauQQhc7mOJMgJ0J+oLPV8rVf1oHE+Luh2tp7VZtd+YaKhobpsR27fhTD5Jz7b+qoRvGEbClKaKS8ERbrxmyrS0nG+EPncNm1AkNmnZTJpuVBjpJgHlXYBohDZoomuhcpCIHDs2kWF3O/rXrWtVnNH5tIdtM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nzv7J7oS; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nzv7J7oS"
Received: by mail-pj2-f13.google.com with SMTP id 98e67ed59e1d1-396ccda24a3so380508a91.0
        for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 22:27:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789190871; x=1789795671; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=4CTLt0y61xRbyq35dXFUiInFGU1oqqBVvZP5/TpzPSo=;
        b=nzv7J7oS6QnkXvTGMuLIXpKkReK0aws7r0lrAGwZPizU0VYY/VRMqvy6I926PEUgbb
         JbDnEi7u+dxCG+wyT/QCYjX/e2ne84EHOoSv6ltyRaXK1EwfZRsBvN+g//e6RRoq3j0F
         9Yw2/Ylij/YO9SulTUFrszG/pUCmNBg6WoKBxSZ29Ev3u7hk6cwMi7kQe0hCi314NY2f
         /LockonR3zLXO2WfenAVqvXETsLk5lZQ6cn3lA1czA5XruECYXV3rEH2rmuELuiSWgY7
         ou4cdQ0ROrlHIvuVv9CsK+KT9OLjqivICoC+HZ7hJcTgOiJadPhnptNsrUBhED+eFbvx
         P7rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789190871; x=1789795671;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4CTLt0y61xRbyq35dXFUiInFGU1oqqBVvZP5/TpzPSo=;
        b=b1xpUR7ILvtiCUAtL/PCcucvjqNgX9SsG+Ly2TjaYmXBeMoyjQXNpB9lPcoX6bGQLs
         ENefTlM0QGG+z/WQnuLF8y8hpZq4U/felI7536Pjx9K6bjKiRoU+xTeFoUZQIjarl2Ul
         2xfbMVtTGRWDyrDV1fRVAmhmqaB+OHYkOgXY1EeOnXdifzez3Lfo2BVQxIBAjsd/pybq
         0AwJ5CEphcs04IHIu6jZkXTzI4gMFIE8c1IOnMjds0d442MdkqP6stHpIMnkZJaAEXzZ
         5fdw7LObK8RaDPdkKuWByGofIkHJbYPqNGx4A53VKo2fBWhY0wIrZ+wQZbyqG01l8roW
         Dawg==
X-Forwarded-Encrypted: i=1; AKwUvBzABe8Fyd6rX5cbH6SH3SqXt5LOBAqELI7DC2dcqPNkCvIaxaw3cy+WBOQm3pUkYbdviQl/U4t6145br94=@vger.kernel.org
X-Gm-Message-State: AFuF++lm06tKGAUtMzOyACjjO8OvnQRDRN6CkW2imDHttq4RWNjBSvi9
	OfIj9FRldH858A6q66W4nsCwZVfV8Dc0lP1WvrXSj5ymjBccVsXAlkfy
X-Gm-Gg: AYBFou2OdgK1r6UelaMMEnpmt64Vl+BJeiiYcDZoi8JsQzid96DcdElqhU5QFdlobDZ
	uUgP8L6d0zKrCkyMtoc4HxLgEoY4t1h0uVuTDutNQCdQeZtbhXlquv5YSQgApFHltSO0oH3L2Q2
	jnIm/VfgVNtLvtDm78F1OoyfOL87TXLOX8W1jNaV3lHVwlT5N0hNdN6idmrV4exB61dHRBkUPlD
	rIOmA5qp8Hx1TpeMYwjCuxBzkUKOtGNKyqPaTsPXchWOO2NNRCiBLqh1FOCV4R95Gi8jDTCJDgK
	gDWtO4oPJmaAl+5F1OCrBSI/FhVJC9y7RDWThqI9NGwCQ88//stKigYMekdp2OesrJBX2PzxDX8
	80y4oaBVaPxv/wLEDEOCyzxO3VhMk9f0IoQE98Fzsvk9M9A26/y/fSi+33O1/yo0Us2uziuUM8L
	3Pz/mEDMgetrxVsnkVojp193fDQxiX5ndZycP9BI4GWPEcmRBfh5fUEJE+PS07ZiDdr4iEsNsHB
	G/gk8dBN5I7dq4=
X-Received: by 2002:a17:90b:4fc5:b0:399:149a:3f27 with SMTP id 98e67ed59e1d1-39d9bd71246mr13414400a91.9.1789190870545;
        Fri, 11 Sep 2026 22:27:50 -0700 (PDT)
Received: from isaac-aneek-MS-7C52 ([103.74.86.148])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14365b8ead8sm10796737c88.10.2026.09.11.22.27.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 22:27:49 -0700 (PDT)
From: Isaac Aneek Sarker <alvasarker2004@gmail.com>
To: 
Cc: alvasarker2004@gmail.com,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Ethan Tidmore <ethantidmore06@gmail.com>,
	Jennifer Guo <guojy.bj@gmail.com>,
	Luka Gejak <luka.gejak@linux.dev>,
	Prithvi Tambewagh <activprithvi@gmail.com>,
	Moksh Panicker <mokshpanicker.7@gmail.com>,
	Andrei Khomenkov <khomenkov@mailbox.org>,
	=?UTF-8?q?Bera=20Y=C3=BCzl=C3=BC?= <b9788213@gmail.com>,
	Oskar Ray-Frayssinet <rayfraytech@gmail.com>,
	Nikolay Kulikov <nikolayof23@gmail.com>,
	Akiyoshi Kurita <weibu@redadmin.org>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] staging: rtl8723bs: rename CamelCase variables in function paramater
Date: Sat, 12 Sep 2026 11:26:44 +0600
Message-ID: <20260912052648.12007-1-alvasarker2004@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

As per the kernel style guidelines, and reported by checkpatch.pl
rename CamelCase variable naming in function parameters and also inside
the function

Signed-off-by: Isaac Aneek Sarker <alvasarker2004@gmail.com>
---
 drivers/staging/rtl8723bs/hal/hal_com_phycfg.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/hal_com_phycfg.c b/drivers/staging/rtl8723bs/hal/hal_com_phycfg.c
index df0eaff4c841..3c3eb2790714 100644
--- a/drivers/staging/rtl8723bs/hal/hal_com_phycfg.c
+++ b/drivers/staging/rtl8723bs/hal/hal_com_phycfg.c
@@ -77,7 +77,7 @@ static void phy_StoreTxPowerByRateBase(struct adapter *padapter)
 }
 
 u8 PHY_GetRateSectionIndexOfTxPowerByRate(
-	struct adapter *padapter, u32 RegAddr, u32 BitMask
+	struct adapter *padapter, u32 reg_addr, u32 bit_mask
 )
 {
 	struct hal_com_data	*pHalData = GET_HAL_DATA(padapter);
@@ -85,7 +85,7 @@ u8 PHY_GetRateSectionIndexOfTxPowerByRate(
 	u8	index = 0;
 
 	if (pDM_Odm->PhyRegPgVersion == 0) {
-		switch (RegAddr) {
+		switch (reg_addr) {
 		case rTxAGC_A_Rate18_06:
 			index = 0;
 			break;
@@ -96,9 +96,9 @@ u8 PHY_GetRateSectionIndexOfTxPowerByRate(
 			index = 6;
 			break;
 		case rTxAGC_B_CCK11_A_CCK2_11:
-			if (BitMask == bMaskH3Bytes)
+			if (bit_mask == bMaskH3Bytes)
 				index = 7;
-			else if (BitMask == 0x000000ff)
+			else if (bit_mask == 0x000000ff)
 				index = 15;
 			break;
 
-- 
2.53.0

