Received: from mail-244107.protonmail.ch (mail-244107.protonmail.ch [109.224.244.107])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCE735540A6
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 21:42:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=109.224.244.107
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791927728; cv=none; b=f+qApZE7MgPlJlH7VLXn1gWrS6bMGDmco6VuDM6VekrHJ5akdCPFxLlagleZ+jvaZzmSAaG9bjmLpX9SX8QjZr16AsDY2otnH2mUNATYGKO0eisRCX+m2elsZP1kVK9V1mnR8/Lq5oX7nCuezTFnygCI1KTjw9Ewkh0/qnu30Gs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791927728; c=relaxed/simple;
	bh=6Sej33LA7yyCmLxY0OZRzRn4Xgkfm457O3PEcDpEYRA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=DU3hqf4JN/9PV2FJqzG3iLL9DGWjNvTFyP1X2ZRdGds14FcvaS/dJtMQokk1IYB+zp8sbvTuDq/ST3WCj4mxEtzwqdKRnwJjsXgw4NyVUna0win18Xk4g4frYY6Ob+EL6g0vVahoW7rDOaTBnswLPwIVzu8o5W0O5Dyo8BYTCKU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=zachschneider.com; spf=pass smtp.mailfrom=zachschneider.com; dkim=pass (2048-bit key) header.d=zachschneider.com header.i=@zachschneider.com header.b=Sn7pDW17; arc=none smtp.client-ip=109.224.244.107
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=zachschneider.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zachschneider.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=zachschneider.com header.i=@zachschneider.com header.b="Sn7pDW17"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zachschneider.com;
	s=protonmail; t=1791927716; x=1792186916;
	bh=jw+la8vu90+FupsW15NTZuPo5bYDry8XqTTy8PgwCl0=;
	h=From:To:Cc:Subject:Date:Message-ID:From:To:Cc:Date:Subject:
	 Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=Sn7pDW17X/9k4Rgbs6AXv9H/ez4CQnwGIMa7hGqN97JWhhFPf290/Zyl0J1may1oY
	 mOUnXhJHAYqmRnUNOadcP23RL/+DlqIoYBJMXyEDQp9qjhy67p2TE4J5KG0zmPxxxZ
	 ZeVoj7VH60dSW86YHH/HJFCjgrGbAHmw4A6mrY+d3fFDemWDXm2cE/ixC24NV4XZ+5
	 I3w0KONv30rODMV6TIQrIFTKR8/r0OM3OGBpNf/ORVBoy6l84HCTjp+CBUgX5xBjyX
	 mNwmLr6AsxXoxYxj8DkhX0yfGY8my4dcfx8gZi11W52RRB7iaQsauLubimF/qYvAZS
	 o606PdSMHJPhw==
X-Pm-Submission-Id: 4j478L6wN7z1DDXf
From: Zach Schneider <me@zachschneider.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Zach Schneider <me@zachschneider.com>
Subject: [PATCH 1/2] staging: rtl8723bs: remove remaining comparisons to true/false
Date: Tue, 13 Oct 2026 16:41:28 -0500
Message-ID: <20261013214129.699212-1-me@zachschneider.com>
X-Mailer: git-send-email 2.56.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Checkpatch reports "Using comparison to true/false is error prone"
in rtw_wlan_util.c, hal_com.c, hal_intf.c, odm.c and
ioctl_cfg80211.c. Replace "x == true" with "x" and "x == false"
with "!x".

bwmode_updated, bDisableSWChannelPlan and the HAL_DEF_MACID_SLEEP
value are u8, and rtw_validate_ssid() returns u8, but they only ever
hold true or false. ODM_RAStateCheck() returns bool. This does not
change behavior.

Assisted-by: LLM
Signed-off-by: Zach Schneider <me@zachschneider.com>
---
 drivers/staging/rtl8723bs/core/rtw_wlan_util.c    | 2 +-
 drivers/staging/rtl8723bs/hal/hal_com.c           | 2 +-
 drivers/staging/rtl8723bs/hal/hal_intf.c          | 4 ++--
 drivers/staging/rtl8723bs/hal/odm.c               | 2 +-
 drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c | 2 +-
 5 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_wlan_util.c b/drivers/staging/rtl8723bs/core/rtw_wlan_util.c
index 9feab9ab7545..369a59fc2407 100644
--- a/drivers/staging/rtl8723bs/core/rtw_wlan_util.c
+++ b/drivers/staging/rtl8723bs/core/rtw_wlan_util.c
@@ -865,7 +865,7 @@ static void bwmode_update_check(struct adapter *padapter, struct ndis_80211_var_
 		pmlmeinfo->bwmode_updated = false;
 	}
 
-	if (true == pmlmeinfo->bwmode_updated) {
+	if (pmlmeinfo->bwmode_updated) {
 		struct sta_info *psta;
 		struct wlan_bssid_ex	*cur_network = &pmlmeinfo->network;
 		struct sta_priv *pstapriv = &padapter->stapriv;
diff --git a/drivers/staging/rtl8723bs/hal/hal_com.c b/drivers/staging/rtl8723bs/hal/hal_com.c
index 656c75ded16f..25df9f17ac47 100644
--- a/drivers/staging/rtl8723bs/hal/hal_com.c
+++ b/drivers/staging/rtl8723bs/hal/hal_com.c
@@ -81,7 +81,7 @@ u8 hal_com_config_channel_plan(
 	}
 
 	if (
-		(false == pHalData->bDisableSWChannelPlan) &&
+		!pHalData->bDisableSWChannelPlan &&
 		rtw_is_channel_plan_valid(sw_channel_plan)
 	)
 		chnlPlan = sw_channel_plan;
diff --git a/drivers/staging/rtl8723bs/hal/hal_intf.c b/drivers/staging/rtl8723bs/hal/hal_intf.c
index d47337118530..3e0d90490259 100644
--- a/drivers/staging/rtl8723bs/hal/hal_intf.c
+++ b/drivers/staging/rtl8723bs/hal/hal_intf.c
@@ -256,7 +256,7 @@ s32 rtw_hal_macid_sleep(struct adapter *padapter, u32 macid)
 
 	support = false;
 	rtw_hal_get_def_var(padapter, HAL_DEF_MACID_SLEEP, &support);
-	if (false == support)
+	if (!support)
 		return _FAIL;
 
 	rtw_hal_set_hwreg(padapter, HW_VAR_MACID_SLEEP, (u8 *)&macid);
@@ -270,7 +270,7 @@ s32 rtw_hal_macid_wakeup(struct adapter *padapter, u32 macid)
 
 	support = false;
 	rtw_hal_get_def_var(padapter, HAL_DEF_MACID_SLEEP, &support);
-	if (false == support)
+	if (!support)
 		return _FAIL;
 
 	rtw_hal_set_hwreg(padapter, HW_VAR_MACID_WAKEUP, (u8 *)&macid);
diff --git a/drivers/staging/rtl8723bs/hal/odm.c b/drivers/staging/rtl8723bs/hal/odm.c
index 9356ea858ddf..4352f58f3674 100644
--- a/drivers/staging/rtl8723bs/hal/odm.c
+++ b/drivers/staging/rtl8723bs/hal/odm.c
@@ -270,7 +270,7 @@ static void odm_RefreshRateAdaptiveMaskCE(struct dm_odm_t *pDM_Odm)
 			if (is_multicast_ether_addr(pstat->hwaddr))  /* if (psta->mac_id == 1) */
 				continue;
 
-			if (true == ODM_RAStateCheck(pDM_Odm, pstat->rssi_stat.UndecoratedSmoothedPWDB, false, &pstat->rssi_level)) {
+			if (ODM_RAStateCheck(pDM_Odm, pstat->rssi_stat.UndecoratedSmoothedPWDB, false, &pstat->rssi_level)) {
 				rtw_hal_update_ra_mask(pstat, pstat->rssi_level);
 			}
 
diff --git a/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c b/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
index 91d98418c0c1..c72ec53e6997 100644
--- a/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
+++ b/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
@@ -1121,7 +1121,7 @@ void rtw_cfg80211_surveydone_event_callback(struct adapter *padapter)
 
 		/* report network only if the current channel set contains the channel to which this network belongs */
 		if (rtw_ch_set_search_ch(padapter->mlmeextpriv.channel_set, pnetwork->network.configuration.ds_config) >= 0
-			&& true == rtw_validate_ssid(&pnetwork->network.ssid)) {
+			&& rtw_validate_ssid(&pnetwork->network.ssid)) {
 			rtw_cfg80211_inform_bss(padapter, pnetwork);
 		}
 	}
-- 
2.56.0

