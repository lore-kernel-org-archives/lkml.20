Received: from out-zbxj-a82.jellyfish.systems (out-zbxj-a82.jellyfish.systems [198.54.127.82])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F6CA36998A
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 19:48:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.54.127.82
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790970486; cv=none; b=GYZGYkyA/N/TSDsHdMIfEArgf6lip4RMYt5FPfPIPzjm0gFqU72Nl8pNA7+ilGFNiF++suDGkXnCWa4STEp0YCK7fMCz7+u7oovYLK+ST1otFgphvv8e2NdjuOnDfqjyNZF8GpqI9ngQkhUKPsm59ZHtlHQURgskpI3EEzhStPA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790970486; c=relaxed/simple;
	bh=qiuu6zweze68WRzkKxh27VkyHkT95w+AwpulLOouAKw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=BdWbd2v384OEzC0B1HeivgOow8oTnpxbKuuxrS2nfvlw8gHZt0YVeDFd91bjMalGRvGXZeGJltjzJ5SdXxj5mcRSnbhXPxEPfkLB70dseGhdpc84RLOp0ofbQw3YN7y3HsDSWdpHeRUoLlhvKK26YJuClqd/Kj9C5fR++7+wyOg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=firmwaredesign.org; spf=pass smtp.mailfrom=firmwaredesign.org; dkim=pass (2048-bit key) header.d=firmwaredesign.org header.i=@firmwaredesign.org header.b=ixXHB0jz; arc=none smtp.client-ip=198.54.127.82
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=firmwaredesign.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=firmwaredesign.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=firmwaredesign.org header.i=@firmwaredesign.org header.b="ixXHB0jz"
Received: from mail.privateemail.com (unknown [98.240.242.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.privateemail.com (Postfix) with ESMTPSA id 4hxK7d14b0z2x98;
	Fri, 02 Oct 2026 19:47:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=firmwaredesign.org;
	s=privateemail; t=1790970461;
	bh=LPQqXFthb+v4WRmqk0/MD4iBHD6Y3pCocYNgHm7pxlA=;
	h=From:To:Cc:Subject:Date:From;
	b=ixXHB0jzVApKj7StJTM8Y1OxEbvB4x9u1R0AtdCOwqZWriLvJF6SoCYzVSMMfYKse
	 QFtVpuxCxfnesk/YAW+/0eqCgkTY9zSv8+6WDotccD3GnFmJpnLSIGqu/UIcDRc4p2
	 3y2iTIL3uOKLSLcHPo4hSfYK9B2/waDRqYVQ4+7bbkP8IXKbp2AHEu9+PmJho+Itrv
	 lQFogs5otJhojWRi1d8mQqHFFJa4O7UWFXGpqpdVJok0mkAUQiViphIY4I94QDC5kw
	 T/PlryrYTRuWD5BvnM8JpzdOGY0CogYG4xBV7DA4ME0ij5Tho629aDJKwnbWF7+zcY
	 Uhu56rOXAshEw==
From: Marinela Tatiana Selseth <marinela.selseth@firmwaredesign.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Marinela Tatiana Selseth <marinela.selseth@firmwaredesign.org>
Subject: [PATCH] staging: rtl8723bs: Eliminate dead enum hal_status abstraction
Date: Fri,  2 Oct 2026 14:46:44 -0500
Message-ID: <20261002194644.212473-1-marinela.selseth@firmwaredesign.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Envelope-From: marinela.selseth@firmwaredesign.org

The internal driver configuration functions inside odm_HWConfig.c always
hardcode a return of HAL_STATUS_SUCCESS and never fail. Consequently,
the custom vendor wrapper type 'enum hal_status' is a completely
redundant abstraction layer that introduces unnecessary complexity.

Refactor ODM_ConfigRFWithHeaderFile(), ODM_ConfigBBWithHeaderFile(),
and ODM_ConfigRFWithTxPwrTrackHeaderFile() to return standard 'void',
removing the useless success return paths. Additionally, purge the
unused ghost prototype ODM_ConfigFWWithHeaderFile() from the header and
completely eliminate the now-vacant 'enum hal_status' declaration block
from odm_types.h.

Signed-off-by: Marinela Tatiana Selseth <marinela.selseth@firmwaredesign.org>
---
 drivers/staging/rtl8723bs/hal/odm_HWConfig.c | 13 +++----------
 drivers/staging/rtl8723bs/hal/odm_HWConfig.h | 13 +++----------
 drivers/staging/rtl8723bs/hal/odm_types.h    |  5 -----
 3 files changed, 6 insertions(+), 25 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/odm_HWConfig.c b/drivers/staging/rtl8723bs/hal/odm_HWConfig.c
index 1716252641d3..437cac9ba0dd 100644
--- a/drivers/staging/rtl8723bs/hal/odm_HWConfig.c
+++ b/drivers/staging/rtl8723bs/hal/odm_HWConfig.c
@@ -401,7 +401,7 @@ void odm_phy_status_query(struct dm_odm_t *dm_odm, struct odm_phy_info *phy_info
 /*  */
 /*  */
 
-enum hal_status ODM_ConfigRFWithHeaderFile(
+void ODM_ConfigRFWithHeaderFile(
 	struct dm_odm_t *pDM_Odm,
 	enum ODM_RF_Config_Type ConfigType,
 	enum rf_path eRFPath
@@ -411,19 +411,15 @@ enum hal_status ODM_ConfigRFWithHeaderFile(
 		ODM_ReadAndConfig_MP_8723B_RadioA(pDM_Odm);
 	else if (ConfigType == CONFIG_RF_TXPWR_LMT)
 		ODM_ReadAndConfig_MP_8723B_TXPWR_LMT(pDM_Odm);
-
-	return HAL_STATUS_SUCCESS;
 }
 
-enum hal_status ODM_ConfigRFWithTxPwrTrackHeaderFile(struct dm_odm_t *pDM_Odm)
+void ODM_ConfigRFWithTxPwrTrackHeaderFile(struct dm_odm_t *pDM_Odm)
 {
 	if (pDM_Odm->SupportInterface == ODM_ITRF_SDIO)
 		ODM_ReadAndConfig_MP_8723B_TxPowerTrack_SDIO(pDM_Odm);
-
-	return HAL_STATUS_SUCCESS;
 }
 
-enum hal_status ODM_ConfigBBWithHeaderFile(
+void ODM_ConfigBBWithHeaderFile(
 	struct dm_odm_t *pDM_Odm, enum ODM_BB_Config_Type ConfigType
 )
 {
@@ -433,7 +429,4 @@ enum hal_status ODM_ConfigBBWithHeaderFile(
 		ODM_ReadAndConfig_MP_8723B_AGC_TAB(pDM_Odm);
 	else if (ConfigType == CONFIG_BB_PHY_REG_PG)
 		ODM_ReadAndConfig_MP_8723B_PHY_REG_PG(pDM_Odm);
-
-	return HAL_STATUS_SUCCESS;
 }
-
diff --git a/drivers/staging/rtl8723bs/hal/odm_HWConfig.h b/drivers/staging/rtl8723bs/hal/odm_HWConfig.h
index 615145812ed2..3945aff7d4e6 100644
--- a/drivers/staging/rtl8723bs/hal/odm_HWConfig.h
+++ b/drivers/staging/rtl8723bs/hal/odm_HWConfig.h
@@ -61,25 +61,18 @@ struct phy_status_rpt_8192cd_t {
 void odm_phy_status_query(struct dm_odm_t *dm_odm, struct odm_phy_info *phy_info,
 			  u8 *phy_status, struct odm_packet_info *pkt_info);
 
-enum hal_status ODM_ConfigRFWithTxPwrTrackHeaderFile(struct dm_odm_t *pDM_Odm);
+void ODM_ConfigRFWithTxPwrTrackHeaderFile(struct dm_odm_t *pDM_Odm);
 
-enum hal_status ODM_ConfigRFWithHeaderFile(
+void ODM_ConfigRFWithHeaderFile(
 	struct dm_odm_t *pDM_Odm,
 	enum ODM_RF_Config_Type ConfigType,
 	enum rf_path eRFPath
 );
 
-enum hal_status ODM_ConfigBBWithHeaderFile(
+void ODM_ConfigBBWithHeaderFile(
 	struct dm_odm_t *pDM_Odm, enum ODM_BB_Config_Type ConfigType
 );
 
-enum hal_status ODM_ConfigFWWithHeaderFile(
-	struct dm_odm_t *pDM_Odm,
-	enum ODM_FW_Config_Type ConfigType,
-	u8 *pFirmware,
-	u32 *pSize
-);
-
 s32 odm_signal_scale_mapping(struct dm_odm_t *pDM_Odm, s32 CurrSig);
 
 #endif
diff --git a/drivers/staging/rtl8723bs/hal/odm_types.h b/drivers/staging/rtl8723bs/hal/odm_types.h
index 25f0edd716cc..f5a02a79ead1 100644
--- a/drivers/staging/rtl8723bs/hal/odm_types.h
+++ b/drivers/staging/rtl8723bs/hal/odm_types.h
@@ -15,11 +15,6 @@
 
 #define GET_ODM(__padapter)	((PDM_ODM_T)(&((GET_HAL_DATA(__padapter))->odmpriv)))
 
-enum hal_status {
-	HAL_STATUS_SUCCESS,
-	HAL_STATUS_FAILURE,
-};
-
 	#if defined(__LITTLE_ENDIAN)
 		#define	ODM_ENDIAN_TYPE			ODM_ENDIAN_LITTLE
 	#else
-- 
2.43.0

