Received: from mail-ua1-f50.google.com (mail-ua1-f50.google.com [209.85.222.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E43DA35C692
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 02:06:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788141975; cv=none; b=POq6lbgyWVC0JPcH4mHWK6kTyNWPaUVWMgGuRe9iPqcP4WWTUEM+T/82KpZ4LrnlJhblqTRqWTyqWAaflleE0wCLwJIXv0bDwzIvfHIivZbHedyUP/pdgyEl3cjtSat9HcDUiT6vlD+kv+WM3zlHiZNjWxtSJzh2VtXVGDKAAyk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788141975; c=relaxed/simple;
	bh=MyUsmlPrjFa9G9tFhdDf0OLhVbhTnza+J8rFfTrbiQ4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lS8gM4diCJygLsbrCecEPJsbbYD3eXTxAXqEgku6jD1GLW6JNHUgWlHzuh8Zc6YyXyCJ2e4r+G0LPaGJR0dZyVymuxsufhg/VXP8DW89DdNjRvQ60nRLJ1l1Y7/fLwwxgClQuSjRN7fhertJsifJzGSbaiKMDtJYWdOPfKjf7Tc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aN8gyQNm; arc=none smtp.client-ip=209.85.222.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aN8gyQNm"
Received: by mail-ua1-f50.google.com with SMTP id a1e0cc1a2514c-966eabad303so559987241.1
        for <linux-kernel@vger.kernel.org>; Sun, 30 Aug 2026 19:06:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788141973; x=1788746773; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=74zrCdqnpgkTZC+gQBTbytn1uqCFGAy5HSmBiXdJznM=;
        b=aN8gyQNmUNdQkl6CtDtkaeNS/GeCOWR12k1QXJD8IBFIDq2PVl2dGpJ8U6pTraJYOE
         YUxh3S7oJqSxdgfVQ8uZHBHgSAXyTxs+q8QsL1iUAhxr1Jiy31Wmg3o21SVpL2W/lunE
         XvqeFYElrZUmrb+c269rRlHV9w4yBAUDxdIgTFBWh5cG5GxpOBEjUsP9wWp/FVx/cQkS
         qflZijahP3ymVybBn2R/Vv8WZO1N7/g5OEOhMk5xRS03Iw7kLXAHbZroR0ZJpCLYl+DH
         3pUgMy2sTzzcPdBeCXMyT0ySxn43h8oJFjwgKLbMnvgwKw4MyH5dQ24Vh+9jSWz7fZin
         90wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788141973; x=1788746773;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=74zrCdqnpgkTZC+gQBTbytn1uqCFGAy5HSmBiXdJznM=;
        b=ejIIUDSOP6tW5IQhgQmfaPDc4vB0cw82mUNsSvv426HGUoNCxH6FM7I4oCUxoNKz6/
         tPS6kpgFr0TzhOWnEwvdSDtshRTSVvik8nkvCTmtFEyDHTsJCThf/0/WwJh0RotGf2PR
         4qZrAqhXLZ++xuYEMZ7URCcsiRiR7UsQPrepjDTjWJiY3AMnY6UeY2S6bXqy7UzzSLWN
         OBX5QYVrwyEd/RZboKlGmg13BfEqKSjR9u5Hrlnvk7EjV0klYlpcnluF5Grcc2xiv2Jo
         UihNcGp+6OxK13Z0M1VdxK51mJU+Eq0iQOjhGHpoyThikvqOgwGaNsRe+OXgNbkt74LY
         3gcQ==
X-Forwarded-Encrypted: i=1; AHgh+RpGeVkLCDiPbGBsE+N6XR5UGoW1GTYPqG7WgGtdF48ht0303SxnYnAzXUKL+fn3KhFcoH1lsMdlDvUmNBo=@vger.kernel.org
X-Gm-Message-State: AFuF++meAXBv/Kt50cVdE5D3wbAmSKfRbPrnBtxFweNQriR33JjtEjCZ
	SoTlHc/lahrUk/tA62N/bTVa8b7qbon4pF7VIb1w1z70hDaB+ITijjCT
X-Gm-Gg: AR+sD13a6tuAADH4wIinqDKoQ1xjhuHp9sZ0exSumNNtCCB2NmNLPIsaLO0cZ/fExXH
	IS38gs1PdNqNeUjdE2HSO3UHvJNd0avs+MDF1hTSetAjZz6gXlkyCve6l2V+eSUxrWCltKeNeMc
	ZUbYvQZgEe2Pxtgt/apOw1j8TLEbgNdZ5kHrSJLP5KnunWKdPhPwfN963fAp+wFyV/c9PMBjeaq
	szwCtUVwi9VWrAKTQvwylzxylgWpoRTOozUJ4C+v6FdeTdSSnHIamxZ2Tm9z+zJOUsL0Xdqjr8/
	G02ekzpxjiNjdq5A+tP/TrQetYbnUH1y4oZHoFvzmqu5LKyF1UhprvVigjkqPPPsi8dGtdGDsW4
	pIr2lzRvRym+cKMe5AC3AI7XnyzJYLqCD5dPD3MMeHVEtRli0Z7PhuZTlxoabAfaIYhrq26fLhc
	JMgloNaRSHfqWkBdMGqXYHjwa5bfFHSp+SqKrNI/1VrEeEJIKAN3xY
X-Received: by 2002:a05:6102:38c6:b0:76f:eaa2:6fa7 with SMTP id ada2fe7eead31-78595aa7320mr6706560137.2.1788141972762;
        Sun, 30 Aug 2026 19:06:12 -0700 (PDT)
Received: from adriano ([190.215.95.120])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-785f532aafcsm5875214137.1.2026.08.30.19.06.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Aug 2026 19:06:12 -0700 (PDT)
From: Adriano Cordova <adrianox@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Adriano Cordova <adrianox@gmail.com>
Subject: [PATCH 2/2] staging: rtl8723bs: remove unused chip-type enums and defines
Date: Sun, 30 Aug 2026 22:05:57 -0400
Message-ID: <20260831020557.1235504-3-adrianox@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260831020557.1235504-1-adrianox@gmail.com>
References: <20260831020557.1235504-1-adrianox@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove enums and defines left over from other Realtek chips:

  - the RF_8225, RF_8256, RF_8258, RF_6052 and RF_PSEUDO_11N RF-type
    enum
  - TX_2S, TX_3S and TX_4S
  - RF_PATH_MAX_92C_88E and RF_PATH_MAX_90_8812
  - TX_POWER_NEAR_FIELD_THRESH_8812
  - ODM_ITRF_ALL

None of them is referenced anywhere in the driver.

Signed-off-by: Adriano Cordova <adrianox@gmail.com>
---
 drivers/staging/rtl8723bs/hal/odm.h              |  1 -
 .../staging/rtl8723bs/hal/odm_DynamicTxPower.h   |  1 -
 drivers/staging/rtl8723bs/include/hal_phy.h      | 16 ----------------
 3 files changed, 18 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/odm.h b/drivers/staging/rtl8723bs/hal/odm.h
index d29eaba41d..b123df98fa 100644
--- a/drivers/staging/rtl8723bs/hal/odm.h
+++ b/drivers/staging/rtl8723bs/hal/odm.h
@@ -382,7 +382,6 @@ enum { /* _ODM_Support_Ability_Definition */
 /* 	ODM_CMNINFO_INTERFACE */
 enum { /* tag_ODM_Support_Interface_Definition */
 	ODM_ITRF_SDIO	=	0x4,
-	ODM_ITRF_ALL	=	0x7,
 };
 
 /*  ODM_CMNINFO_IC_TYPE */
diff --git a/drivers/staging/rtl8723bs/hal/odm_DynamicTxPower.h b/drivers/staging/rtl8723bs/hal/odm_DynamicTxPower.h
index e2d244324e..4431a3ddf1 100644
--- a/drivers/staging/rtl8723bs/hal/odm_DynamicTxPower.h
+++ b/drivers/staging/rtl8723bs/hal/odm_DynamicTxPower.h
@@ -11,7 +11,6 @@
 #define		TX_POWER_NEAR_FIELD_THRESH_LVL2	74
 #define		TX_POWER_NEAR_FIELD_THRESH_LVL1	67
 #define		TX_POWER_NEAR_FIELD_THRESH_AP		0x3F
-#define		TX_POWER_NEAR_FIELD_THRESH_8812	60
 
 #define		TxHighPwrLevel_Normal		0
 #define		TxHighPwrLevel_Level1		1
diff --git a/drivers/staging/rtl8723bs/include/hal_phy.h b/drivers/staging/rtl8723bs/include/hal_phy.h
index abc0f27fda..ec9bc47816 100644
--- a/drivers/staging/rtl8723bs/include/hal_phy.h
+++ b/drivers/staging/rtl8723bs/include/hal_phy.h
@@ -17,16 +17,6 @@
 
 
 /*--------------------------Define Parameters-------------------------------*/
-enum {
-	RF_TYPE_MIN = 0,	/*  0 */
-	RF_8225 = 1,		/*  1 11b/g RF for verification only */
-	RF_8256 = 2,		/*  2 11b/g/n */
-	RF_8258 = 3,		/*  3 11a/b/g/n RF */
-	RF_6052 = 4,		/*  4 11b/g/n RF */
-	RF_PSEUDO_11N = 5,	/*  5, It is a temporality RF. */
-	RF_TYPE_MAX
-};
-
 enum rf_path {
 	RF_PATH_A = 0,
 	RF_PATH_B,
@@ -34,12 +24,6 @@ enum rf_path {
 };
 
 #define	TX_1S			0
-#define	TX_2S			1
-#define	TX_3S			2
-#define	TX_4S			3
-
-#define	RF_PATH_MAX_92C_88E		2
-#define	RF_PATH_MAX_90_8812		4	/* Max RF number 90 support */
 
 enum wireless_mode {
 	WIRELESS_MODE_UNKNOWN = 0x00,
-- 
2.51.0

