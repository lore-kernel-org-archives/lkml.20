Received: from out-2z4y-a132.jellyfish.systems (out-2z4y-a132.jellyfish.systems [198.54.127.132])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2ADE27F728
	for <linux-kernel@vger.kernel.org>; Sat,  3 Oct 2026 00:34:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.54.127.132
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790987671; cv=none; b=Jg9omO35IrA0nY+zb8/GVYb79nCh+mmolOMaVn1aOJVtusuv/tGjBG3etfBCN85hB6X0nXJK1RnMz+KWSvg9YaAVxaVITAfJxS3K1/Y0jC0DwMv0N85IKCpyBfSfma/9ueg9fssNggvCmcm9nxv2eDk7WLTxyaYwt6KXsME635I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790987671; c=relaxed/simple;
	bh=C3Bwp0/uOuK+IJugqJYJbfDkdchB5bTsjYbmoeeIMv4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=UpLIq97lgzVF++93K3RKT1b33WCoG0uhGeRIJ5GgjY/7cXVof6TdO9pOlm1wO+oqJr3clfRbZqP0c+i1JRwZhOA9voxEsUnoiEuaQtjvpRKIfDVW0kSGafmpTv3bGwSJzH/xuVpMN46b1701mqiWuOCG+K+o8KoszUv3uG8I/zQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=firmwaredesign.org; spf=pass smtp.mailfrom=firmwaredesign.org; dkim=pass (2048-bit key) header.d=firmwaredesign.org header.i=@firmwaredesign.org header.b=A/Cfp8lp; arc=none smtp.client-ip=198.54.127.132
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=firmwaredesign.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=firmwaredesign.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=firmwaredesign.org header.i=@firmwaredesign.org header.b="A/Cfp8lp"
Received: from mail.privateemail.com (unknown [98.240.242.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.privateemail.com (Postfix) with ESMTPSA id 4hxRV20WGYz2x98;
	Sat, 03 Oct 2026 00:34:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=firmwaredesign.org;
	s=privateemail; t=1790987642;
	bh=PBvc0hmde4ISvg3pKClika/pB4OPa7ir51cmPwfu5yQ=;
	h=From:To:Cc:Subject:Date:From;
	b=A/Cfp8lpsurZf2kssv+8l9zhMlLERYGpNGfuA9LCLmjxuQ7aZ5Xs9pjCobqkUZSE2
	 uvBpFfiO1UOAiuMeRUb3dRbzPAxPLxrfjd4kyS2jugnaf3gr0IohPUPvUA1EdCUyPa
	 gTHwuHhmsfCiQmxABZ3gQ0dNNk5OYKtXhKjcQs5yCel3QqAaLOVdeZGJskpQ7gQRRm
	 U+2px145npmF7dvnVCRaNaMymoOZ4CDmk++iaewkYB8vljCfX8JAEl+xgExNzWVZkX
	 peuXstFBsYkPVCU6gi1sl0uHxQS/+QaK0tUv2BJanHDHiFUbXMpFU9ovZCJ2lZqQ5g
	 WZdrYo75Om4zw==
From: Marinela Tatiana Selseth <marinela.selseth@firmwaredesign.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Marinela Tatiana Selseth <marinela.selseth@firmwaredesign.org>
Subject: [PATCH] staging: rtl8723bs: remove dead antenna diversity infrastructure (FAT/SWAT)
Date: Fri,  2 Oct 2026 19:33:41 -0500
Message-ID: <20261003003341.238789-1-marinela.selseth@firmwaredesign.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Envelope-From: marinela.selseth@firmwaredesign.org

Deep analysis reveals that the driver contains major vestigial out-of-tree
architectural frameworks for Fast Antenna Training (FAT) and Software
Antenna Switching (SWAS) that are completely uninitialized, unread, or
write-only.

Remove the 'struct fat_t' definition from hal/odm.h and refactor the
fallback path in hal/rtl8723b_phycfg.c. Because the unassigned structural
member 'RxIdleAnt' naturally defaults to 0, the conditional path check
statically resolves to false, permanently routing RFPath to RF_PATH_B
whenever antenna diversity is active. Hardcode this layout behavior to
match factual reality and remove the now unused macro 'MAIN_ANT'.

Additionally, purge the write-only 'struct swat_t' infrastructure from
hal/odm.h and include/hal_data.h. Inside hal/odm.c, eliminate the dead
variable tracking assignments while explicitly preserving the hardware
register read to rDPDT_control as a dummy read to ensure initialization
sequencing and hardware timing remain completely unaltered.

Lastly, clean up legacy comment baggage across hal/odm.c and
hal/odm_DIG.c. Remove arbitrary spreadsheet digits and references to
unsupported legacy chipsets (92E, 8723A, 8821, 8812) to ensure inline
notes are highly focused on the active RTL8723B Bluetooth coexistence
parameters.

Signed-off-by: Marinela Tatiana Selseth <marinela.selseth@firmwaredesign.org>
---
 drivers/staging/rtl8723bs/hal/odm.c           |  12 +--
 drivers/staging/rtl8723bs/hal/odm.h           | 100 ------------------
 drivers/staging/rtl8723bs/hal/odm_DIG.c       |   5 +-
 .../staging/rtl8723bs/hal/rtl8723b_phycfg.c   |  11 +-
 drivers/staging/rtl8723bs/include/hal_data.h  |   1 -
 5 files changed, 11 insertions(+), 118 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/odm.c b/drivers/staging/rtl8723bs/hal/odm.c
index f3989fa33d9f..00b938071dee 100644
--- a/drivers/staging/rtl8723bs/hal/odm.c
+++ b/drivers/staging/rtl8723bs/hal/odm.c
@@ -461,12 +461,8 @@ static void odm_RSSIMonitorCheck(struct dm_odm_t *pDM_Odm)
 /* 3 ============================================================ */
 static void odm_SwAntDetectInit(struct dm_odm_t *pDM_Odm)
 {
-	struct swat_t *pDM_SWAT_Table = &pDM_Odm->DM_SWAT_Table;
-
-	pDM_SWAT_Table->SWAS_NoLink_BK_Reg92c = rtw_read32(pDM_Odm->Adapter, rDPDT_control);
-	pDM_SWAT_Table->PreAntenna = MAIN_ANT;
-	pDM_SWAT_Table->CurAntenna = MAIN_ANT;
-	pDM_SWAT_Table->SWAS_NoLink_State = 0;
+	/* Dummy read rDPDT_control to preserve initialization hardware sequencing */
+	rtw_read32(pDM_Odm->Adapter, rDPDT_control);
 }
 
 /* 3 ============================================================ */
@@ -589,9 +585,7 @@ void ODM_DMWatchdog(struct dm_odm_t *pDM_Odm)
 
 	odm_RSSIMonitorCheck(pDM_Odm);
 
-	/* For CE Platform(SPRD or Tablet) */
-	/* 8723A or 8189ES platform */
-	/* NeilChen--2012--08--24-- */
+	/* For CE Platform (Spreadtrum or Tablet) */
 	/* Fix Leave LPS issue */
 	if (adapter_to_pwrctl(pDM_Odm->Adapter)->pwr_mode != PS_MODE_ACTIVE) {
 		/* in LPS mode */
diff --git a/drivers/staging/rtl8723bs/hal/odm.h b/drivers/staging/rtl8723bs/hal/odm.h
index 3532f0d79363..88f4b6f0c410 100644
--- a/drivers/staging/rtl8723bs/hal/odm.h
+++ b/drivers/staging/rtl8723bs/hal/odm.h
@@ -50,12 +50,6 @@
 #define	PSD_RESCAN		4
 #define	PSD_SCAN_INTERVAL	700 /* ms */
 
-/* 8723A High Power IGI Setting */
-#define		DM_DIG_HIGH_PWR_IGI_LOWER_BOUND	0x22
-#define			DM_DIG_Gmode_HIGH_PWR_IGI_LOWER_BOUND 0x28
-#define		DM_DIG_HIGH_PWR_THRESHOLD	0x3a
-#define		DM_DIG_LOW_PWR_THRESHOLD	0x14
-
 /* ANT Test */
 #define			ANTTESTALL		0x00		/* Ant A or B will be Testing */
 #define		ANTTESTA		0x01		/* Ant A will be Testing */
@@ -63,11 +57,6 @@
 
 #define	PS_MODE_ACTIVE 0x01
 
-/* for 8723A Ant Definition--2012--06--07 due to different IC may be different ANT define */
-#define		MAIN_ANT		1		/* Ant A or Ant Main */
-#define		AUX_ANT		2		/* AntB or Ant Aux */
-#define		MAX_ANT		3		/*  3 for AP using */
-
 /* Antenna Diversity Type */
 #define	SW_ANTDIV	0
 #define	HW_ANTDIV	1
@@ -123,54 +112,6 @@ struct rxhp_t {
 #define	TRAFFIC_HIGH	1
 #define	TRAFFIC_UltraLOW	2
 
-struct swat_t { /* _SW_Antenna_Switch_ */
-	u8 Double_chk_flag;
-	u8 try_flag;
-	s32 PreRSSI;
-	u8 CurAntenna;
-	u8 PreAntenna;
-	u8 RSSI_Trying;
-	u8 TestMode;
-	u8 bTriggerAntennaSwitch;
-	u8 SelectAntennaMap;
-	u8 RSSI_target;
-	u8 reset_idx;
-	u16 Single_Ant_Counter;
-	u16 Dual_Ant_Counter;
-	u16 Aux_FailDetec_Counter;
-	u16 Retry_Counter;
-
-	/*  Before link Antenna Switch check */
-	u8 SWAS_NoLink_State;
-	u32 SWAS_NoLink_BK_Reg860;
-	u32 SWAS_NoLink_BK_Reg92c;
-	u32 SWAS_NoLink_BK_Reg948;
-	bool ANTA_ON;	/* To indicate Ant A is or not */
-	bool ANTB_ON;	/* To indicate Ant B is on or not */
-	bool Pre_Aux_FailDetec;
-	bool RSSI_AntDect_bResult;
-	u8 Ant2G;
-
-	s32 RSSI_sum_A;
-	s32 RSSI_sum_B;
-	s32 RSSI_cnt_A;
-	s32 RSSI_cnt_B;
-
-	u64 lastTxOkCnt;
-	u64 lastRxOkCnt;
-	u64 TXByteCnt_A;
-	u64 TXByteCnt_B;
-	u64 RXByteCnt_A;
-	u64 RXByteCnt_B;
-	u8 TrafficLoad;
-	u8 Train_time;
-	u8 Train_time_flag;
-	struct timer_list SwAntennaSwitchTimer;
-	struct timer_list SwAntennaSwitchTimer_8723B;
-	u32 PktCnt_SWAntDivByCtrlFrame;
-	bool bSWAntDivByCtrlFrame;
-};
-
 /* Remove Edca by YuChen */
 
 struct odm_rate_adaptive {
@@ -557,45 +498,6 @@ struct odm_rf_cal_t { /* ODM_RF_Calibration_Structure */
 
 };
 
-/*  ODM Dynamic common info value definition */
-struct fat_t { /* _FAST_ANTENNA_TRAINNING_ */
-	u8 Bssid[6];
-	u8 antsel_rx_keep_0;
-	u8 antsel_rx_keep_1;
-	u8 antsel_rx_keep_2;
-	u8 antsel_rx_keep_3;
-	u32 antSumRSSI[7];
-	u32 antRSSIcnt[7];
-	u32 antAveRSSI[7];
-	u8 FAT_State;
-	u32 TrainIdx;
-	u8 antsel_a[ODM_ASSOCIATE_ENTRY_NUM];
-	u8 antsel_b[ODM_ASSOCIATE_ENTRY_NUM];
-	u8 antsel_c[ODM_ASSOCIATE_ENTRY_NUM];
-	u32 MainAnt_Sum[ODM_ASSOCIATE_ENTRY_NUM];
-	u32 AuxAnt_Sum[ODM_ASSOCIATE_ENTRY_NUM];
-	u32 MainAnt_Cnt[ODM_ASSOCIATE_ENTRY_NUM];
-	u32 AuxAnt_Cnt[ODM_ASSOCIATE_ENTRY_NUM];
-	u8 RxIdleAnt;
-	bool	bBecomeLinked;
-	u32 MinMaxRSSI;
-	u8 idx_AntDiv_counter_2G;
-	u32 CCK_counter_main;
-	u32 CCK_counter_aux;
-	u32 OFDM_counter_main;
-	u32 OFDM_counter_aux;
-
-	u32 CCK_CtrlFrame_Cnt_main;
-	u32 CCK_CtrlFrame_Cnt_aux;
-	u32 OFDM_CtrlFrame_Cnt_main;
-	u32 OFDM_CtrlFrame_Cnt_aux;
-	u32 MainAnt_CtrlFrame_Sum;
-	u32 AuxAnt_CtrlFrame_Sum;
-	u32 MainAnt_CtrlFrame_Cnt;
-	u32 AuxAnt_CtrlFrame_Cnt;
-
-};
-
 enum {
 	NO_ANTDIV			= 0xFF,
 	CG_TRX_HW_ANTDIV		= 0x01,
@@ -828,7 +730,6 @@ struct dm_odm_t { /* DM_Out_Source_Dynamic_Mechanism_Structure */
 	struct odm_mac_status_info *pMacInfo;
 
 	/* ODM Structure */
-	struct fat_t DM_FatTable;
 	struct dig_t DM_DigTable;
 	struct ps_t DM_PSTable;
 	struct dynamic_primary_CCA DM_PriCCA;
@@ -836,7 +737,6 @@ struct dm_odm_t { /* DM_Out_Source_Dynamic_Mechanism_Structure */
 	struct ra_t DM_RA_Table;
 	struct false_ALARM_STATISTICS FalseAlmCnt;
 	struct false_ALARM_STATISTICS FlaseAlmCntBuddyAdapter;
-	struct swat_t DM_SWAT_Table;
 	bool RSSI_test;
 	struct cfo_tracking DM_CfoTrack;
 
diff --git a/drivers/staging/rtl8723bs/hal/odm_DIG.c b/drivers/staging/rtl8723bs/hal/odm_DIG.c
index c862c86b7695..44932b2c9f9f 100644
--- a/drivers/staging/rtl8723bs/hal/odm_DIG.c
+++ b/drivers/staging/rtl8723bs/hal/odm_DIG.c
@@ -395,10 +395,9 @@ void odm_DIG(void *pDM_VOID)
 	dm_dig_min = DM_DIG_MIN_NIC;
 	DIG_MaxOfMin = DM_DIG_MAX_AP;
 
-	/* 1 Adjust boundary by RSSI */
+	/* Adjust boundary by RSSI */
 	if (pDM_Odm->bLinked && bPerformance) {
-		/* 2 Modify DIG upper bound */
-		/* 4 Modify DIG upper bound for 92E, 8723A\B, 8821 & 8812 BT */
+		/* Modify DIG upper bound for 8723B BT */
 		if (pDM_Odm->bBtLimitedDig == 1)
 			offset = 10;
 		else
diff --git a/drivers/staging/rtl8723bs/hal/rtl8723b_phycfg.c b/drivers/staging/rtl8723bs/hal/rtl8723b_phycfg.c
index 3c99621311e5..18fb3fe4ecfd 100644
--- a/drivers/staging/rtl8723bs/hal/rtl8723b_phycfg.c
+++ b/drivers/staging/rtl8723bs/hal/rtl8723b_phycfg.c
@@ -527,13 +527,14 @@ u8 PHY_GetTxPowerIndex(
 void PHY_SetTxPowerLevel8723B(struct adapter *Adapter, u8 Channel)
 {
 	struct hal_com_data *pHalData = GET_HAL_DATA(Adapter);
-	struct dm_odm_t *pDM_Odm = &pHalData->odmpriv;
-	struct fat_t *pDM_FatTable = &pDM_Odm->DM_FatTable;
 	u8 RFPath = RF_PATH_A;
 
-	if (pHalData->AntDivCfg) {/*  antenna diversity Enable */
-		RFPath = ((pDM_FatTable->RxIdleAnt == MAIN_ANT) ? RF_PATH_A : RF_PATH_B);
-	} else { /*  antenna diversity disable */
+	if (pHalData->AntDivCfg) {/* antenna diversity enable */
+		/* Antenna diversity forces path B because Fast Antenna Training
+		 * (FAT) logic is unhandled in this staging driver baseline.
+		 */
+		RFPath = RF_PATH_B;
+	} else { /* antenna diversity disable */
 		RFPath = pHalData->ant_path;
 	}
 
diff --git a/drivers/staging/rtl8723bs/include/hal_data.h b/drivers/staging/rtl8723bs/include/hal_data.h
index c345b632bf53..0f346e2a3b17 100644
--- a/drivers/staging/rtl8723bs/include/hal_data.h
+++ b/drivers/staging/rtl8723bs/include/hal_data.h
@@ -209,7 +209,6 @@ struct hal_com_data {
 	u8 RegReg542;
 	u16 RegRRSR;
 
-	u8 CurAntenna;
 	u8 AntDivCfg;
 	u8 AntDetection;
 	u8 ant_path; /* for 8723B s0/s1 selection */
-- 
2.43.0

