Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21773388396
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 09:29:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791883759; cv=none; b=hXn5ennw1bhDJWtoXQ4oaRAM3G+ZZnHmgfqnglyulRHIXFdmIFgPycL6XGlbS4GwcgNCzdYwnTJFpSUDB00yvPhNrT+lmCiLK1RB9NPVlzHw+QsQPJOrh9Sq6rw+5ShBWJbrUt6zeX5rbzRwuPix2eFETEepoQ2wa8N/zVH8ihE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791883759; c=relaxed/simple;
	bh=q24zxW8hwP7FaiE+85WTHOtAptzv6YWce6z+WBFUkqI=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=IgKRl7IWo1wIXfgh+YyC0bN7706shi1+UfpMZXrqbWqfi55YjFOwLckLd4dIhsJ5NuGwSuwhtI7Gp0/aSyQ5dKo2c6KAoKa/kNGEmM1oyB1YHWOuVeczSZJRrc6t6N202McMYfg8WGlQGbKQbJpkmAGQZvuIJ+y9/XUWYDU0+ug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dBE2Qx3v; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dBE2Qx3v"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-3a706146559so1575983a91.2
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 02:29:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791883756; x=1792488556; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=mWBOquVNVW69W2Sa6lKuhGbtxBKyi6kB5eJEJgRj7g4=;
        b=dBE2Qx3vdAthrHPrxhEsqHYa9M8/Piky/m8MlCl9gezGC6o1pCMV42ZscAoKPkd1AA
         De9TVQyJzOZoloVaOGlpDu5KsT8ypq/6jGJhZoa0R1jAkUbjXoxdeypm+2BtHA53Czpp
         Qm4zUFw2VpMY58H7yKMovaKafsoQns7vHpKEyX+8fUiuT+HuYjkAmXBEobaoQOD0+BUL
         h4XiRbNO+UMobmEeOoweH0Vx9lg48n+9jAqQF904WxO2F/0yTy/OCOd86n305f2icRzF
         1ZrCipI03Wp8q/B4VFwd6HtmxqO3UbfHa8zwBvT9ohoPTEADA6T4brjg3w0kZt4bbah6
         Od0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791883756; x=1792488556;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mWBOquVNVW69W2Sa6lKuhGbtxBKyi6kB5eJEJgRj7g4=;
        b=LsoiRrA3CkCagm0Lzl3JVc9awd1nriYTOWlP7oSAvnJcl/HEGmLBBFWyE8vNctf0WD
         Jkata9EaaK6UJAdwgLGW1xwKjGwo+H2ZsjiGYrkFoQqcTcQXxZyPvYMzhmQaC/Sf0gLk
         qNs3J5dkrKUQmhamDKKaIya7otTsh8XHKdk/ZyKrjOP8ljiB4fkDIlRz+3Qh63Kb9G8Q
         O1BS82nl9MbjmTe0dY/pKAAriMxz5lYNBlw9z5r7FJO70vmgOFQPwZMnx+5kYpXCHj4x
         rMoBstamwE2qlWpdeGLgD7D68d+zpxUMj5T7XZ7EZWuN5Jzq/ekaMrh2g+niqm+oQHWw
         nPfA==
X-Forwarded-Encrypted: i=1; AKwUvBxuPOdxcgUiUmi0JEQ4YgZ4mn4mrhcegbIG/ftMuupmwpkQTMsIOsMvRW9+WAFEZjddCEEYVTyGIejxy2w=@vger.kernel.org
X-Gm-Message-State: AFq9FYL7ovJUpnOgGCLvESy6SaOGuf2nfx11MIjZ3v5+jJN+MmjB/IEo
	HweF0/cBX85FGmWPDkhagTMGCN5cjsJ0GGOWpe6KRg42o5yW70M+F8E=
X-Gm-Gg: AYBFou0VtEc9bUehLDJgAIwEkpDmNkpbAF1Tb2LqfgMR5PE/Ix7wR9gtcrynYQZ31F/
	MN/BuXlNnvLJ0jxdCt8451T1uu1UBlpQQYsYJf5JHirKGW12hj5N4aeX/ILmD5EgyMz9GcLrijj
	ZeOd0/aYIO9KcHiqPdh8HCDZI5XI91H1q3713N7m5wGwOXRkVSJ0Y9FsEzcGe6PyA3iuThzJhp4
	9IcwZR3RIx2UnSaapE5yWpv7Uq8xil3bPSpkfjiF5LLp+cMCl+MOT3IlaCsMdygprWeiTQ/V1Rz
	aMRhIppEoNzF/nSQ72dF+pE9tf9BkgYKA87Js9tDn5iX0jZ0xQovUCUyr2CZZMU9zzEdXaEg1fa
	CQCkHM7M6UXsqw+ZjaRuvPWvDkTAiXGFv+Srm7GPrZ0d4w9UjV3Dj992fJbfoU8x2rSIEFrNhtf
	um1T1xnenc04v+cK5Ykw1WZ3iBX3lYO7tSkvFQSweARxq6PjCFXFtzxzbt9JbG14t1cGfEG4n+5
	x/AYCbAmD7Imx/hH/sK
X-Received: by 2002:a17:90b:380a:b0:39e:6a7f:1dc6 with SMTP id 98e67ed59e1d1-3ab3a99ded9mr12066690a91.34.1791883756001;
        Tue, 13 Oct 2026 02:29:16 -0700 (PDT)
Received: from localhost.localdomain ([185.220.238.36])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3abdd5d09aesm10457531a91.7.2026.10.13.02.29.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 02:29:15 -0700 (PDT)
From: Wang Yibo <szwyb123@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Jennifer Guo <guojy.bj@gmail.com>,
	Nikolay Kulikov <nikolayof23@gmail.com>
Subject: [PATCH] staging: rtl8723bs: remove commented out code in hal/ files
Date: Tue, 13 Oct 2026 17:29:08 +0800
Message-Id: <20261013092908.380050-1-szwyb123@gmail.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove commented out code in a few hal/ source files, including
commented out switch case branches in odm.c, leftover debug statements
in odm_DIG.c and stale assignments in hal_intf.c.

The removed lines were already disabled and do not affect the generated
code.

Signed-off-by: Wang Yibo <szwyb123@gmail.com>
---
 drivers/staging/rtl8723bs/hal/hal_intf.c |  4 ----
 drivers/staging/rtl8723bs/hal/odm.c      | 22 ----------------------
 drivers/staging/rtl8723bs/hal/odm_DIG.c  | 11 -----------
 3 files changed, 37 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/hal_intf.c b/drivers/staging/rtl8723bs/hal/hal_intf.c
index 1443875d1369..2a33bea9018c 100644
--- a/drivers/staging/rtl8723bs/hal/hal_intf.c
+++ b/drivers/staging/rtl8723bs/hal/hal_intf.c
@@ -120,14 +120,10 @@ int rtw_hal_mgnt_xmit(struct adapter *padapter, struct xmit_frame *pmgntframe)
 	int ret;
 
 	update_mgntframe_attrib_addr(padapter, pmgntframe);
-	/* pframe = (u8 *)(pmgntframe->buf_addr) + TXDESC_OFFSET; */
-	/* pwlanhdr = (struct rtw_ieee80211_hdr *)pframe; */
-	/* memcpy(pmgntframe->attrib.ra, pwlanhdr->addr1, ETH_ALEN); */
 
 	if (padapter->securitypriv.binstallBIPkey) {
 		if (is_multicast_ether_addr(pmgntframe->attrib.ra)) {
 			pmgntframe->attrib.encrypt = _BIP_;
-			/* pmgntframe->attrib.bswenc = true; */
 		} else {
 			pmgntframe->attrib.encrypt = _AES_;
 			pmgntframe->attrib.bswenc = true;
diff --git a/drivers/staging/rtl8723bs/hal/odm.c b/drivers/staging/rtl8723bs/hal/odm.c
index f3989fa33d9f..84edb6b5704e 100644
--- a/drivers/staging/rtl8723bs/hal/odm.c
+++ b/drivers/staging/rtl8723bs/hal/odm.c
@@ -445,7 +445,6 @@ static void odm_RSSIMonitorCheckCE(struct dm_odm_t *pDM_Odm)
 	FindMinimumRSSI(Adapter);/* get pdmpriv->MinUndecoratedPWDBForDM */
 
 	pDM_Odm->RSSI_Min = pdmpriv->MinUndecoratedPWDBForDM;
-	/* ODM_CmnInfoUpdate(&pHalData->odmpriv , ODM_CMNINFO_RSSI_MIN, pdmpriv->MinUndecoratedPWDBForDM); */
 }
 
 static void odm_RSSIMonitorCheck(struct dm_odm_t *pDM_Odm)
@@ -515,7 +514,6 @@ void odm_TXPowerTrackingInit(struct dm_odm_t *pDM_Odm)
 	else
 		pdmpriv->TxPowerTrackControl = false;
 
-	/* pDM_Odm->RFCalibrateInfo.TxPowerTrackControl = true; */
 	pDM_Odm->RFCalibrateInfo.ThermalValue = pHalData->EEPROMThermalMeter;
 	pDM_Odm->RFCalibrateInfo.ThermalValue_IQK = pHalData->EEPROMThermalMeter;
 	pDM_Odm->RFCalibrateInfo.ThermalValue_LCK = pHalData->EEPROMThermalMeter;
@@ -616,8 +614,6 @@ void ODM_DMWatchdog(struct dm_odm_t *pDM_Odm)
 
 	ODM_TXPowerTrackingCheck(pDM_Odm);
 
-	/* odm_EdcaTurboCheck(pDM_Odm); */
-
 	/* 2010.05.30 LukeLee: For CE platform, files in IC subfolders may not be included to be compiled, */
 	/*  so compile flags must be left here to prevent from compile errors */
 	pDM_Odm->PhyDbgInfo.NumQryBeaconPkt = 0;
@@ -804,24 +800,6 @@ void ODM_CmnInfoHook(struct dm_odm_t *pDM_Odm, enum odm_cmninfo_e CmnInfo, void
 		pDM_Odm->mp_mode = pValue;
 		break;
 
-	/* case ODM_CMNINFO_RTSTA_AID: */
-	/* pDM_Odm->pAidMap =  (u8 *)pValue; */
-	/* break; */
-
-	/* case ODM_CMNINFO_BT_COEXIST: */
-	/* pDM_Odm->BTCoexist = (bool *)pValue; */
-
-	/* case ODM_CMNINFO_STA_STATUS: */
-	/* pDM_Odm->pODM_StaInfo[] = (PSTA_INFO_T)pValue; */
-	/* break; */
-
-	/* case ODM_CMNINFO_PHY_STATUS: */
-	/* pDM_Odm->pPhyInfo = (ODM_PHY_INFO *)pValue; */
-	/* break; */
-
-	/* case ODM_CMNINFO_MAC_STATUS: */
-	/* pDM_Odm->pMacInfo = (struct odm_mac_status_info *)pValue; */
-	/* break; */
 	/* To remove the compiler warning, must add an empty default statement to handle the other values. */
 	default:
 		/* do nothing */
diff --git a/drivers/staging/rtl8723bs/hal/odm_DIG.c b/drivers/staging/rtl8723bs/hal/odm_DIG.c
index c862c86b7695..12455e883200 100644
--- a/drivers/staging/rtl8723bs/hal/odm_DIG.c
+++ b/drivers/staging/rtl8723bs/hal/odm_DIG.c
@@ -68,8 +68,6 @@ void odm_NHMBBInit(void *pDM_VOID)
 void odm_NHMBB(void *pDM_VOID)
 {
 	struct dm_odm_t *pDM_Odm = (struct dm_odm_t *)pDM_VOID;
-	/* u8 test_status; */
-	/* struct false_ALARM_STATISTICS *pFalseAlmCnt = &pDM_Odm->FalseAlmCnt; */
 
 	pDM_Odm->NHMCurTxOkcnt =
 		*(pDM_Odm->pNumTxBytesUnicast)-pDM_Odm->NHMLastTxOkcnt;
@@ -83,7 +81,6 @@ void odm_NHMBB(void *pDM_VOID)
 	if ((pDM_Odm->NHMCurTxOkcnt) + 1 > (u64)(pDM_Odm->NHMCurRxOkcnt<<2) + 1) { /* Tx > 4*Rx possible for adaptivity test */
 		if (pDM_Odm->NHM_cnt_0 >= 190 || pDM_Odm->adaptivity_flag) {
 			/* Enable EDCCA since it is possible running Adaptivity testing */
-			/* test_status = 1; */
 			pDM_Odm->adaptivity_flag = true;
 			pDM_Odm->tolerance_cnt = 0;
 		} else {
@@ -91,24 +88,19 @@ void odm_NHMBB(void *pDM_VOID)
 				pDM_Odm->tolerance_cnt = pDM_Odm->tolerance_cnt + 1;
 			else
 				pDM_Odm->tolerance_cnt = 4;
-			/* test_status = 5; */
 			if (pDM_Odm->tolerance_cnt > 3) {
-				/* test_status = 3; */
 				pDM_Odm->adaptivity_flag = false;
 			}
 		}
 	} else { /*  TX<RX */
 		if (pDM_Odm->adaptivity_flag && pDM_Odm->NHM_cnt_0 <= 200) {
-			/* test_status = 2; */
 			pDM_Odm->tolerance_cnt = 0;
 		} else {
 			if (pDM_Odm->tolerance_cnt < 3)
 				pDM_Odm->tolerance_cnt = pDM_Odm->tolerance_cnt + 1;
 			else
 				pDM_Odm->tolerance_cnt = 4;
-			/* test_status = 5; */
 			if (pDM_Odm->tolerance_cnt > 3) {
-				/* test_status = 4; */
 				pDM_Odm->adaptivity_flag = false;
 			}
 		}
@@ -586,7 +578,6 @@ void odm_DIGbyRSSI_LPS(void *pDM_VOID)
 		CurrentIGI = RSSI_Lower;
 
 	ODM_Write_DIG(pDM_Odm, CurrentIGI);
-	/* ODM_Write_DIG(pDM_Odm, pDM_DigTable->CurIGValue); */
 }
 
 /* 3 ============================================================ */
@@ -709,10 +700,8 @@ u8 odm_ForbiddenIGICheck(void *pDM_VOID, u8 DIG_Dynamic_MIN, u8 CurrentIGI)
 		if (pDM_DigTable->LargeFAHit != 3)
 			pDM_DigTable->LargeFAHit++;
 
-		/* if (pDM_DigTable->ForbiddenIGI < pDM_DigTable->CurIGValue) */
 		if (pDM_DigTable->ForbiddenIGI < CurrentIGI) {
 			pDM_DigTable->ForbiddenIGI = CurrentIGI;
-			/* pDM_DigTable->ForbiddenIGI = pDM_DigTable->CurIGValue; */
 			pDM_DigTable->LargeFAHit = 1;
 		}
 
-- 
2.25.1

