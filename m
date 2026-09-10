Received: from mail-vs1-f47.google.com (mail-vs1-f47.google.com [209.85.217.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC1864915B8
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 14:39:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789051186; cv=none; b=dI7TO9ocLJIadXl8a1thCzmBtxh18VIBa+XKkJU/Q/kgPPajUIWUJ+aFl3czrOm6GTkelPIJj8gRv9SRvMrqOtB1mOWIKbX+hVQbPvmkWfs8EDJLWVaEWg85pQun16ra2T/gRsqfkDrlTE0C7E6cWgCDEAarFYmpw5fh+K+8xyI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789051186; c=relaxed/simple;
	bh=JI4iQGLwydwRjXYc5J1zV7jakad8rFEkuA4tqflhpiU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=R4KFLw+O2/uf3BmmY6Rio1YnfRFGam7CMnpoHNDzRNYSkp9b4F1AFW06oQZUFd1pRwiHdE30pnc3oSHgN2J8TrOo8nWTphEpPnhx5M+oT2eZ/5SJFLe7k0iUNM75dRwGWS3jbbkoXTHfcvkWsb+qPTN4nlb4199w2uS9O+VKmes=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JAQxBpJs; arc=none smtp.client-ip=209.85.217.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JAQxBpJs"
Received: by mail-vs1-f47.google.com with SMTP id ada2fe7eead31-779d18ef706so5151812137.2
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 07:39:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789051184; x=1789655984; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Y+nHzA7DgJpjRsVKOfOdWebTfWI81vQ4lVsJ7aDwxXU=;
        b=JAQxBpJswvGnybfSZL23L3VX2vgzXyFgWwMvZw88LCFMVzICIHQnS0YzP0qvK2Vjl1
         SqFvOUyiwgclPKpgkolNulziwPgj1Z1rgbhMQoQyCenuZs2dyh9S1VsjKDXe9qWa+EsB
         RVs8tE/LW7UL8vlO5P+ukzNt+QkWbUVk1Gvn4MOoFJ6M/BDPrsRYGXBT2on+5bvOJNTT
         TdSPU/l/I23/GcgGMfgyQA38/JAI4MvFB2ez5thhJcmXViPSOccncU3q0W+03a7ZGNt+
         O8Ei8DU0OtIE50ELOQ4qWOthknKz5qoQEt8f9bBE7IGTlBISZpgREiU6RNUY5BOtETdJ
         MdUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789051184; x=1789655984;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Y+nHzA7DgJpjRsVKOfOdWebTfWI81vQ4lVsJ7aDwxXU=;
        b=J0Gsu2xpuBLSm08U/IqqyDje8FK7hW4dAeNCIBEh0OU4cvGiQwUj5bAroaHNfIHt0l
         jijhwGmjDBcvUMzzT7BnH//6wiag2G1Pa7R/2mTJy4OkcYgpUcN/txcZZoNS0cWc/iGD
         VgbRbBTjoJcExYFPDSS48ESNpqRRF42/p9h6YmCTQF67H6f9mcNZ19z0gtl0Hq5j/vfU
         AUo2MGsTPiKOX2vlRnxy+1zaPZS8o8vOyff53WiQFUw+snRZEaDe4vM97PmZSBDGk+kT
         IYU1QWuS5NfFBtJ4kVHMIShQH8BEqg+n2Fqp1/lG+qxjDjolZYByzO30bPKOq9kmZKyv
         /cNw==
X-Forwarded-Encrypted: i=1; AKwUvBwEmv88YSyTZKiFqrowYxyNsw1sIQofw1q4K5AVTHUYL0aoVMfk/1VeR/NwnkdjR7lUjuecc97aER/taSo=@vger.kernel.org
X-Gm-Message-State: AFuF++nuv7EEjq5rdpMhGLKfKQyExnfhYaW0Cpud+bR9DaPigif8QlDq
	N3FtN0+Y7ILGBclkWZaC8nKtupi7GmCR5vLZUP59otRFz/CMOLVC/iJK
X-Gm-Gg: AYBFou30PDDp2eL7DVaFcAgwYTIKYwugUCUcxG3DLo362fhcAcoatoefOF9HoJ4PmD3
	bo7cclXM/UX49jWqqaXLrX45QdPaQkThP2JX8N823XYbUiQ1rVtod8plMZ1H1I49p07EZ3yQfzI
	Sr8+lmVrUIYuI3gl6cbhV42nBvIoFYfM/OBu3dAtC6emndGb7QNP2D58DwP6Gjo9trqo09+epd0
	IJx1ctwFep/2E43zmpkOcMwSmKrmIsTWmqIp0MB7axzTS8CTsEpJtwR2aTmOY2TmAaw40N+/y6O
	Nksd1+nQ4d4a0RzptPl7TmCFrd2yAa2AzH9Ayv4SyKd+/+cE5WB2EhlU2WTEfkukuvqDCkpcROC
	cyYgwP0pp5CF9j4fK7Yp7jXns53vRM8rcNM1FpDnN73DdU2iPuccpJl+GF2QzyIBDVnL1UKNqf7
	s6fTUGHgHP3CpiKjg9GKI77Y7T0qid4KrOydFLAIIBfCLnmeMZxgQqk02+pHuFlTGd
X-Received: by 2002:a05:6102:560c:b0:786:aae:aefc with SMTP id ada2fe7eead31-78a4aa9d9dcmr22415887137.13.1789051183372;
        Thu, 10 Sep 2026 07:39:43 -0700 (PDT)
Received: from frese.. ([200.20.225.238])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-78a47ae301fsm13568251137.7.2026.09.10.07.39.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 07:39:42 -0700 (PDT)
From: Enzo Frese <freseenzo@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Enzo Frese <freseenzo@gmail.com>,
	Jennifer Guo <guojy.bj@gmail.com>,
	Andrei Khomenkov <khomenkov@mailbox.org>,
	Dan Carpenter <error27@gmail.com>,
	Dalvin-Ehinoma Noah Aiguobas <fliegbert2@gmail.com>,
	Michael Straube <straube.linux@gmail.com>,
	=?UTF-8?q?Michael=20Steinm=C3=B6tzger?= <m.steinmoetzger@gmail.com>,
	Navaneeth K <knavaneeth786@gmail.com>,
	Rodrigo Gobbi <rodrigo.gobbi.7@gmail.com>,
	linux-staging@lists.linux.dev (open list:STAGING SUBSYSTEM),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] staging: rtl8723bs: avoid CamelCase in odm_DynamicBBPowerSaving.c
Date: Thu, 10 Sep 2026 11:38:47 -0300
Message-ID: <20260910143857.154320-1-freseenzo@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rename odm_DynamicBBPowerSavingInit to odm_dynamic_bb_power_saving_init,
and rename local variables and struct ps_t fields (PreCCAState,
CurCCAState, PreRFState, CurRFState, Rssi_val_min, Reg874, RegC70,
Reg85C, RegA74, bForceInNormal, Rssi_Up_bound, Rssi_Low_bound) to
avoid CamelCase, which is not accepted by checkpatch.pl.

Signed-off-by: Enzo Frese <freseenzo@gmail.com>
---
 drivers/staging/rtl8723bs/hal/odm.c           |  2 +-
 .../rtl8723bs/hal/odm_DynamicBBPowerSaving.c  | 72 +++++++++----------
 .../rtl8723bs/hal/odm_DynamicBBPowerSaving.h  | 16 ++---
 3 files changed, 45 insertions(+), 45 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/odm.c b/drivers/staging/rtl8723bs/hal/odm.c
index d18df407e365..e61200a5d6d0 100644
--- a/drivers/staging/rtl8723bs/hal/odm.c
+++ b/drivers/staging/rtl8723bs/hal/odm.c
@@ -580,7 +580,7 @@ void ODM_DMInit(struct dm_odm_t *pDM_Odm)
 
 	ODM_ClearTxPowerTrackingState(pDM_Odm);
 
-	odm_DynamicBBPowerSavingInit(pDM_Odm);
+	odm_dynamic_bb_power_saving_init(pDM_Odm);
 	odm_DynamicTxPowerInit(pDM_Odm);
 
 	odm_SwAntDetectInit(pDM_Odm);
diff --git a/drivers/staging/rtl8723bs/hal/odm_DynamicBBPowerSaving.c b/drivers/staging/rtl8723bs/hal/odm_DynamicBBPowerSaving.c
index ed743f6678dc..e5011d1043ee 100644
--- a/drivers/staging/rtl8723bs/hal/odm_DynamicBBPowerSaving.c
+++ b/drivers/staging/rtl8723bs/hal/odm_DynamicBBPowerSaving.c
@@ -7,69 +7,69 @@
 
 #include "odm_precomp.h"
 
-void odm_DynamicBBPowerSavingInit(void *pDM_VOID)
+void odm_dynamic_bb_power_saving_init(void *pDM_VOID)
 {
 	struct dm_odm_t *pDM_Odm = (struct dm_odm_t *)pDM_VOID;
 	struct ps_t *pDM_PSTable = &pDM_Odm->DM_PSTable;
 
-	pDM_PSTable->PreCCAState = CCA_MAX;
-	pDM_PSTable->CurCCAState = CCA_MAX;
-	pDM_PSTable->PreRFState = RF_MAX;
-	pDM_PSTable->CurRFState = RF_MAX;
-	pDM_PSTable->Rssi_val_min = 0;
+	pDM_PSTable->pre_cca_state = CCA_MAX;
+	pDM_PSTable->cur_cca_state = CCA_MAX;
+	pDM_PSTable->pre_rf_state = RF_MAX;
+	pDM_PSTable->cur_rf_state = RF_MAX;
+	pDM_PSTable->rssi_val_min = 0;
 	pDM_PSTable->initialize = 0;
 }
 
-void ODM_RF_Saving(void *pDM_VOID, u8 bForceInNormal)
+void ODM_RF_Saving(void *pDM_VOID, u8 force_in_normal)
 {
 	struct dm_odm_t *pDM_Odm = (struct dm_odm_t *)pDM_VOID;
 	struct ps_t *pDM_PSTable = &pDM_Odm->DM_PSTable;
-	u8 Rssi_Up_bound = 30;
-	u8 Rssi_Low_bound = 25;
+	u8 rssi_up_bound = 30;
+	u8 rssi_low_bound = 25;
 
 	if (pDM_Odm->PatchID == 40) { /* RT_CID_819x_FUNAI_TV */
-		Rssi_Up_bound = 50;
-		Rssi_Low_bound = 45;
+		rssi_up_bound = 50;
+		rssi_low_bound = 45;
 	}
 
 	if (pDM_PSTable->initialize == 0) {
-		pDM_PSTable->Reg874 = (PHY_QueryBBReg(pDM_Odm->Adapter, 0x874, bMaskDWord) & 0x1CC000) >> 14;
-		pDM_PSTable->RegC70 = (PHY_QueryBBReg(pDM_Odm->Adapter, 0xc70, bMaskDWord) & BIT(3)) >> 3;
-		pDM_PSTable->Reg85C = (PHY_QueryBBReg(pDM_Odm->Adapter, 0x85c, bMaskDWord) & 0xFF000000) >> 24;
-		pDM_PSTable->RegA74 = (PHY_QueryBBReg(pDM_Odm->Adapter, 0xa74, bMaskDWord) & 0xF000) >> 12;
+		pDM_PSTable->reg874 = (PHY_QueryBBReg(pDM_Odm->Adapter, 0x874, bMaskDWord) & 0x1CC000) >> 14;
+		pDM_PSTable->regc70 = (PHY_QueryBBReg(pDM_Odm->Adapter, 0xc70, bMaskDWord) & BIT(3)) >> 3;
+		pDM_PSTable->reg85c = (PHY_QueryBBReg(pDM_Odm->Adapter, 0x85c, bMaskDWord) & 0xFF000000) >> 24;
+		pDM_PSTable->rega74 = (PHY_QueryBBReg(pDM_Odm->Adapter, 0xa74, bMaskDWord) & 0xF000) >> 12;
 		/* Reg818 = PHY_QueryBBReg(padapter, 0x818, bMaskDWord); */
 		pDM_PSTable->initialize = 1;
 	}
 
-	if (!bForceInNormal) {
+	if (!force_in_normal) {
 		if (pDM_Odm->RSSI_Min != 0xFF) {
-			if (pDM_PSTable->PreRFState == RF_Normal) {
-				if (pDM_Odm->RSSI_Min >= Rssi_Up_bound)
-					pDM_PSTable->CurRFState = RF_Save;
+			if (pDM_PSTable->pre_rf_state == RF_Normal) {
+				if (pDM_Odm->RSSI_Min >= rssi_up_bound)
+					pDM_PSTable->cur_rf_state = RF_Save;
 				else
-					pDM_PSTable->CurRFState = RF_Normal;
+					pDM_PSTable->cur_rf_state = RF_Normal;
 			} else {
-				if (pDM_Odm->RSSI_Min <= Rssi_Low_bound)
-					pDM_PSTable->CurRFState = RF_Normal;
+				if (pDM_Odm->RSSI_Min <= rssi_low_bound)
+					pDM_PSTable->cur_rf_state = RF_Normal;
 				else
-					pDM_PSTable->CurRFState = RF_Save;
+					pDM_PSTable->cur_rf_state = RF_Save;
 			}
 		} else {
-			pDM_PSTable->CurRFState = RF_MAX;
+			pDM_PSTable->cur_rf_state = RF_MAX;
 		}
 	} else {
-		pDM_PSTable->CurRFState = RF_Normal;
+		pDM_PSTable->cur_rf_state = RF_Normal;
 	}
 
-	if (pDM_PSTable->PreRFState != pDM_PSTable->CurRFState) {
-		if (pDM_PSTable->CurRFState == RF_Save) {
-			/* Reg874[20:18]=3'b010 */
+	if (pDM_PSTable->pre_rf_state != pDM_PSTable->cur_rf_state) {
+		if (pDM_PSTable->cur_rf_state == RF_Save) {
+			/* reg874[20:18]=3'b010 */
 			PHY_SetBBReg(pDM_Odm->Adapter, 0x874, 0x1C0000, 0x2);
-			/* RegC70[3]= 1'b0 */
+			/* regc70[3]= 1'b0 */
 			PHY_SetBBReg(pDM_Odm->Adapter, 0xc70, BIT(3), 0);
-			/* Reg85C[31:24]= 0x63 */
+			/* reg85c[31:24]= 0x63 */
 			PHY_SetBBReg(pDM_Odm->Adapter, 0x85c, 0xFF000000, 0x63);
-			/* Reg874[15:14]=2'b10 */
+			/* reg874[15:14]=2'b10 */
 			PHY_SetBBReg(pDM_Odm->Adapter, 0x874, 0xC000, 0x2);
 			/* RegA75[7:4]= 0x3 */
 			PHY_SetBBReg(pDM_Odm->Adapter, 0xa74, 0xF000, 0x3);
@@ -78,12 +78,12 @@ void ODM_RF_Saving(void *pDM_VOID, u8 bForceInNormal)
 			/* Reg818[28]= 1'b1 */
 			PHY_SetBBReg(pDM_Odm->Adapter, 0x818, BIT(28), 0x1);
 		} else {
-			PHY_SetBBReg(pDM_Odm->Adapter, 0x874, 0x1CC000, pDM_PSTable->Reg874);
-			PHY_SetBBReg(pDM_Odm->Adapter, 0xc70, BIT(3), pDM_PSTable->RegC70);
-			PHY_SetBBReg(pDM_Odm->Adapter, 0x85c, 0xFF000000, pDM_PSTable->Reg85C);
-			PHY_SetBBReg(pDM_Odm->Adapter, 0xa74, 0xF000, pDM_PSTable->RegA74);
+			PHY_SetBBReg(pDM_Odm->Adapter, 0x874, 0x1CC000, pDM_PSTable->reg874);
+			PHY_SetBBReg(pDM_Odm->Adapter, 0xc70, BIT(3), pDM_PSTable->regc70);
+			PHY_SetBBReg(pDM_Odm->Adapter, 0x85c, 0xFF000000, pDM_PSTable->reg85c);
+			PHY_SetBBReg(pDM_Odm->Adapter, 0xa74, 0xF000, pDM_PSTable->rega74);
 			PHY_SetBBReg(pDM_Odm->Adapter, 0x818, BIT(28), 0x0);
 		}
-		pDM_PSTable->PreRFState = pDM_PSTable->CurRFState;
+		pDM_PSTable->pre_rf_state = pDM_PSTable->cur_rf_state;
 	}
 }
diff --git a/drivers/staging/rtl8723bs/hal/odm_DynamicBBPowerSaving.h b/drivers/staging/rtl8723bs/hal/odm_DynamicBBPowerSaving.h
index 3ebbbfd1dd1f..0b0765ff8e15 100644
--- a/drivers/staging/rtl8723bs/hal/odm_DynamicBBPowerSaving.h
+++ b/drivers/staging/rtl8723bs/hal/odm_DynamicBBPowerSaving.h
@@ -9,23 +9,23 @@
 #define    __ODMDYNAMICBBPOWERSAVING_H__
 
 struct ps_t { /* _Dynamic_Power_Saving_ */
-	u8 PreCCAState;
-	u8 CurCCAState;
+	u8 pre_cca_state;
+	u8 cur_cca_state;
 
-	u8 PreRFState;
-	u8 CurRFState;
+	u8 pre_rf_state;
+	u8 cur_rf_state;
 
-	int Rssi_val_min;
+	int rssi_val_min;
 
 	u8 initialize;
-	u32 Reg874, RegC70, Reg85C, RegA74;
+	u32 reg874, regc70, reg85c, rega74;
 
 };
 
 #define dm_RF_Saving ODM_RF_Saving
 
-void ODM_RF_Saving(void *pDM_VOID, u8 bForceInNormal);
+void ODM_RF_Saving(void *pDM_VOID, u8 force_in_normal);
 
-void odm_DynamicBBPowerSavingInit(void *pDM_VOID);
+void odm_dynamic_bb_power_saving_init(void *pDM_VOID);
 
 #endif
-- 
2.43.0

