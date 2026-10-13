Received: from mail-ot1-f42.google.com (mail-ot1-f42.google.com [209.85.210.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41CFF4DE700
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 20:15:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791922547; cv=none; b=sR3fOMhuiXqxkvN79n3iW8lE5yXBr3BM86/xJlgY4GW435xooTe/P/Xkp0B4r/ZRzKxd7nVdyhPydu0QVCUo1a10FWIIsO/pw6o9I/JSTEedSwcQ4J78gUP/V46usaA8qxFEna3gwLQMgajMbiOZ5EHHX5nksphcCQEL65fJS2g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791922547; c=relaxed/simple;
	bh=SXJUssVGNIKVXvvAiVtppNrEesk1/Eu1LxIjwYyPHSU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=m6YveRtWPSmlmhiC6BabK3WKliZ0g2bSqnXqy9Vnu1Xf99PQ4T/4+h9Z/f6jhpEQHAiD0w8skmZPsHuD+fz3031LfOlQUJLjBGRNSZDh+NaX3kzl8da9IOdu56QPdsB8xj4GLblVTCqBSyZH2ldm4jNpIH/6jQxIYDDQ9BRTv4s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Y9klkiX/; arc=none smtp.client-ip=209.85.210.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Y9klkiX/"
Received: by mail-ot1-f42.google.com with SMTP id 46e09a7af769-7f84a55cc06so2133134a34.2
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 13:15:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791922542; x=1792527342; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NS4W68/+zzTyFOe0TbxaLKa54HBQPqOlKN0Ut8TCAoo=;
        b=Y9klkiX/BSaSVFO1WZaV4Sa+ampX1DxRyZS4ER2YZbjjaRSVvUZ7rUqbo8+09NEUj6
         KsS+xfSebXymrp0sa1Mghx7NTjwdxtngDCqRGsy0HrVU77bInoxkv2gajwnTNvdaGCPj
         cWPw0Yb258uvErV1xS+WVgg7pGqliZjJRXcvbeDC7yGQOvrTDLYmVeEGq7XlibzmbBQN
         JREJyYu3UXSB01VdbZKQZJEwR9cRgFHsJwX5pk2T73g0JFYiFekSJRlpebEz29D6tCC3
         SyMeyQXnUe9tAI7eul+3iyda/C8r20E9dlDDhUMkIKcoohYrfjeqLMhBBgQ/2zTGoWSF
         BJlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791922542; x=1792527342;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=NS4W68/+zzTyFOe0TbxaLKa54HBQPqOlKN0Ut8TCAoo=;
        b=j2h4F53T0Dza7mx8n8gV2si7EekhcNviRDqjRNAGt861TVllcxt51F0z6kz5p9Pcep
         Z9gMCu6XZKu56uOp1TAC1Y5EtdfEGLyhd/EWkuqV+k1zD+IuYli4qwof0o9E4OGok7DO
         L4C3AIX+KFuusR3H6L/pjSlGqr3sXoEc171wkCnmzga1jmZFAWSOm3cNls+diKT26iqW
         rv6pT2tWi8bORIORCfsKpNjKpcMYAUTlu8U6zZ+T0zlATzWBF4I7kQdt94rkd2xf5sBZ
         IC+qo6IfWODewjisAYuB8jejb1xzLL6OH2e4JIBUdpIa52diqVEMK18BRDpTUjCQ6Vxv
         Itpw==
X-Forwarded-Encrypted: i=1; AKwUvBwATzXrcLuHdv9c8fG+zuZHhRqQfLcF8ERXuLxmts3K2B1JFupNoxJY5FActnFshzv+pYq6eJBxC54d220=@vger.kernel.org
X-Gm-Message-State: AFq9FYIG2+UYhryYdVPxMiXtjuvFnW8jyScPv2aK2wTAXP+6gSZJW9H/
	/g9HZ5DlY7Ef+bWBw5f/wD8z9/j4VP7IYHNYjhIN/CYewwakm76Ty6fg
X-Gm-Gg: AYBFou1awGWjjdNwiLJDveYTtHlQqhB2WQeLaoAo6GOzyMtZFnosef2zUvC9rsPpQo3
	fBDFBpizn8ALlBfmPHr4dUbxBriLkqOTVFF46+pA+ALMXFKmYoewEBuHk+cTZCLtMi+2zMSaKYM
	XIEuJ3ABw44UFs3ggPlCSYXjf+OV6hMBmsK69gszAiezrjv0cj8NnGI2NpSvFmFMbKJngza4Ybs
	CtCDZkRg7phpyG+rphPdrWS//ObcuNY6f+x63b6doj/fckyPOnO/BMM4ivPZdvo+4rxcci7zFdT
	GL9yz3i2LSMh1KXEZb4oK93eg+4Np58yI+2xXxgb/I1cHXn9OhkvAyKnK7FyE00fJGjP8YTJNPy
	VBULz7eh+5TvWFH2T3eICNBvqtVlovAr05ZeNaMfSlm2xO0qyVqlzV5J2gQ/ncVfG2qNOWEQ5YP
	7nGLF19YBRJo5KCy1gjyyHQ/byFuVXtLOfbgqpBSIJZ3vMGE1ZIrFa460tolo83TebVae8+FMw9
	Cs=
X-Received: by 2002:a05:6830:4394:b0:81c:37e2:2012 with SMTP id 46e09a7af769-830962fac35mr14575471a34.15.1791922541674;
        Tue, 13 Oct 2026 13:15:41 -0700 (PDT)
Received: from pop-os.. ([24.32.17.59])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-83038f82468sm13557570a34.11.2026.10.13.13.15.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 13:15:41 -0700 (PDT)
From: Rishik Yechuri <epicrishik@gmail.com>
X-Google-Original-From: Rishik Yechuri <rishik.yechuri.code@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Rishik Yechuri <rishik.yechuri.code@gmail.com>
Subject: [PATCH 01/10] staging: rtl8723bs: use struct ieee80211_hdr for header addresses
Date: Tue, 13 Oct 2026 15:15:29 -0500
Message-ID: <20261013201538.43156-2-rishik.yechuri.code@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261013201538.43156-1-rishik.yechuri.code@gmail.com>
References: <20261013201538.43156-1-rishik.yechuri.code@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The driver defines GetAddr1Ptr() through GetAddr4Ptr() in wifi.h to
obtain pointers to the address fields of an IEEE 802.11 header by
adding hardcoded byte offsets to the frame buffer. This duplicates
struct ieee80211_hdr from <linux/ieee80211.h>, which describes the
same layout and is used throughout the wireless subsystem.

Replace each use of these macros with the corresponding addr1..addr4
member of struct ieee80211_hdr, and remove the macro definitions.
Several functions in rtw_mlme_ext.c already access the header through
struct ieee80211_hdr. This makes the remaining call sites consistent
with them.

Include <linux/ieee80211.h> directly in wifi.h, since the inline helpers
there now depend on struct ieee80211_hdr.

This is the first step towards replacing the driver's private 802.11
header macros with the generic helpers provided by the kernel.

No functional change intended.

Signed-off-by: Rishik Yechuri <rishik.yechuri.code@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_mlme_ext.c | 87 +++++++++++--------
 drivers/staging/rtl8723bs/core/rtw_recv.c     | 46 +++++-----
 .../staging/rtl8723bs/core/rtw_wlan_util.c    |  2 +-
 drivers/staging/rtl8723bs/include/wifi.h      | 43 +++++----
 .../staging/rtl8723bs/os_dep/ioctl_cfg80211.c |  3 +-
 5 files changed, 100 insertions(+), 81 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
index 511eccf5b..1349bd423 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
@@ -415,11 +415,12 @@ void free_mlme_ext_priv(struct mlme_ext_priv *pmlmeext)
 static void _mgt_dispatcher(struct adapter *padapter, struct mlme_handler *ptable, union recv_frame *precv_frame)
 {
 	u8 *pframe = precv_frame->u.hdr.rx_data;
+	struct ieee80211_hdr *hdr = (struct ieee80211_hdr *)pframe;
 
 	if (ptable->func) {
 		/* receive the frames that ra(a1) is my address or ra(a1) is bc address. */
-		if (memcmp(GetAddr1Ptr(pframe), myid(&padapter->eeprompriv), ETH_ALEN) &&
-		    !is_broadcast_ether_addr(GetAddr1Ptr(pframe)))
+		if (memcmp(hdr->addr1, myid(&padapter->eeprompriv), ETH_ALEN) &&
+		    !is_broadcast_ether_addr(hdr->addr1))
 			return;
 
 		ptable->func(padapter, precv_frame);
@@ -432,14 +433,15 @@ void mgt_dispatcher(struct adapter *padapter, union recv_frame *precv_frame)
 	struct mlme_handler *ptable;
 	struct mlme_priv *pmlmepriv = &padapter->mlmepriv;
 	u8 *pframe = precv_frame->u.hdr.rx_data;
-	struct sta_info *psta = rtw_get_stainfo(&padapter->stapriv, GetAddr2Ptr(pframe));
+	struct ieee80211_hdr *hdr = (struct ieee80211_hdr *)pframe;
+	struct sta_info *psta = rtw_get_stainfo(&padapter->stapriv, hdr->addr2);
 
 	if (GetFrameType(pframe) != WIFI_MGT_TYPE)
 		return;
 
 	/* receive the frames that ra(a1) is my address or ra(a1) is bc address. */
-	if (memcmp(GetAddr1Ptr(pframe), myid(&padapter->eeprompriv), ETH_ALEN) &&
-	    !is_broadcast_ether_addr(GetAddr1Ptr(pframe))) {
+	if (memcmp(hdr->addr1, myid(&padapter->eeprompriv), ETH_ALEN) &&
+	    !is_broadcast_ether_addr(hdr->addr1)) {
 		return;
 	}
 
@@ -554,6 +556,7 @@ unsigned int OnBeacon(struct adapter *padapter, union recv_frame *precv_frame)
 	struct mlme_priv *pmlmepriv = &padapter->mlmepriv;
 	struct sta_priv *pstapriv = &padapter->stapriv;
 	u8 *pframe = precv_frame->u.hdr.rx_data;
+	struct ieee80211_hdr *hdr = (struct ieee80211_hdr *)pframe;
 	uint len = precv_frame->u.hdr.len;
 	struct wlan_bssid_ex *pbss;
 	int ret = _SUCCESS;
@@ -574,7 +577,7 @@ unsigned int OnBeacon(struct adapter *padapter, union recv_frame *precv_frame)
 		return _SUCCESS;
 	}
 
-	if (!memcmp(GetAddr3Ptr(pframe), get_my_bssid(&pmlmeinfo->network), ETH_ALEN)) {
+	if (!memcmp(hdr->addr3, get_my_bssid(&pmlmeinfo->network), ETH_ALEN)) {
 		if (pmlmeinfo->state & WIFI_FW_AUTH_NULL) {
 			/* we should update current network before auth, or some IE is wrong */
 			pbss = kmalloc_obj(*pbss, GFP_ATOMIC);
@@ -610,7 +613,7 @@ unsigned int OnBeacon(struct adapter *padapter, union recv_frame *precv_frame)
 
 		if (((pmlmeinfo->state & 0x03) == WIFI_FW_STATION_STATE) &&
 		    (pmlmeinfo->state & WIFI_FW_ASSOC_SUCCESS)) {
-			psta = rtw_get_stainfo(pstapriv, GetAddr2Ptr(pframe));
+			psta = rtw_get_stainfo(pstapriv, hdr->addr2);
 			if (psta) {
 				ret = rtw_check_bcn_info(padapter, pframe, len);
 				if (!ret) {
@@ -628,7 +631,7 @@ unsigned int OnBeacon(struct adapter *padapter, union recv_frame *precv_frame)
 				adaptive_early_32k(pmlmeext, pframe, len);
 			}
 		} else if ((pmlmeinfo->state & 0x03) == WIFI_FW_ADHOC_STATE) {
-			psta = rtw_get_stainfo(pstapriv, GetAddr2Ptr(pframe));
+			psta = rtw_get_stainfo(pstapriv, hdr->addr2);
 			if (psta) {
 				/* update WMM, ERP in the beacon */
 				/* todo: the timer is used instead of the number of the beacon received */
@@ -650,7 +653,7 @@ unsigned int OnBeacon(struct adapter *padapter, union recv_frame *precv_frame)
 				update_TSF(pmlmeext, pframe, len);
 
 				/* report sta add event */
-				report_add_sta_event(padapter, GetAddr2Ptr(pframe), cam_idx);
+				report_add_sta_event(padapter, hdr->addr2, cam_idx);
 			}
 		}
 	}
@@ -673,6 +676,7 @@ unsigned int OnAuth(struct adapter *padapter, union recv_frame *precv_frame)
 	struct mlme_ext_priv *pmlmeext = &padapter->mlmeextpriv;
 	struct mlme_ext_info *pmlmeinfo = &pmlmeext->mlmext_info;
 	u8 *pframe = precv_frame->u.hdr.rx_data;
+	struct ieee80211_hdr *hdr = (struct ieee80211_hdr *)pframe;
 	uint len = precv_frame->u.hdr.len;
 	u8 offset = 0;
 
@@ -682,7 +686,7 @@ unsigned int OnAuth(struct adapter *padapter, union recv_frame *precv_frame)
 	if (len < WLAN_HDR_A3_LEN)
 		return _FAIL;
 
-	sa = GetAddr2Ptr(pframe);
+	sa = hdr->addr2;
 
 	auth_mode = psecuritypriv->dot11_auth_algrthm;
 
@@ -930,6 +934,7 @@ unsigned int OnAssocReq(struct adapter *padapter, union recv_frame *precv_frame)
 	struct wlan_bssid_ex	*cur = &(pmlmeinfo->network);
 	struct sta_priv *pstapriv = &padapter->stapriv;
 	u8 *pframe = precv_frame->u.hdr.rx_data;
+	struct ieee80211_hdr *hdr = (struct ieee80211_hdr *)pframe;
 	uint pkt_len = precv_frame->u.hdr.len;
 
 	if ((pmlmeinfo->state & 0x03) != WIFI_FW_AP_STATE)
@@ -944,7 +949,7 @@ unsigned int OnAssocReq(struct adapter *padapter, union recv_frame *precv_frame)
 	if (pkt_len < sizeof(struct ieee80211_hdr_3addr) + ie_offset)
 		return _FAIL;
 
-	pstat = rtw_get_stainfo(pstapriv, GetAddr2Ptr(pframe));
+	pstat = rtw_get_stainfo(pstapriv, hdr->addr2);
 	if (!pstat) {
 		status = WLAN_REASON_CLASS2_FRAME_FROM_NONAUTH_STA;
 		goto asoc_class2_error;
@@ -1302,7 +1307,7 @@ unsigned int OnAssocReq(struct adapter *padapter, union recv_frame *precv_frame)
 
 asoc_class2_error:
 
-	issue_deauth(padapter, GetAddr2Ptr(pframe), status);
+	issue_deauth(padapter, hdr->addr2, status);
 
 	return _FAIL;
 
@@ -1418,10 +1423,11 @@ unsigned int OnDeAuth(struct adapter *padapter, union recv_frame *precv_frame)
 	struct mlme_ext_priv *pmlmeext = &padapter->mlmeextpriv;
 	struct mlme_ext_info *pmlmeinfo = &pmlmeext->mlmext_info;
 	u8 *pframe = precv_frame->u.hdr.rx_data;
+	struct ieee80211_hdr *hdr = (struct ieee80211_hdr *)pframe;
 	int ignore_received_deauth = 0;
 
 	/* check A3 */
-	if (memcmp(GetAddr3Ptr(pframe), get_my_bssid(&pmlmeinfo->network), ETH_ALEN))
+	if (memcmp(hdr->addr3, get_my_bssid(&pmlmeinfo->network), ETH_ALEN))
 		return _SUCCESS;
 
 	reason = le16_to_cpu(*(__le16 *)(pframe + WLAN_HDR_A3_LEN));
@@ -1432,9 +1438,9 @@ unsigned int OnDeAuth(struct adapter *padapter, union recv_frame *precv_frame)
 
 		netdev_dbg(padapter->pnetdev,
 			   "ap recv deauth reason code(%d) sta:%pM\n", reason,
-			   GetAddr2Ptr(pframe));
+			   hdr->addr2);
 
-		psta = rtw_get_stainfo(pstapriv, GetAddr2Ptr(pframe));
+		psta = rtw_get_stainfo(pstapriv, hdr->addr2);
 		if (psta) {
 			u8 updated = false;
 
@@ -1470,11 +1476,11 @@ unsigned int OnDeAuth(struct adapter *padapter, union recv_frame *precv_frame)
 
 	netdev_dbg(padapter->pnetdev,
 		   "sta recv deauth reason code(%d) sta:%pM, ignore = %d\n",
-		   reason, GetAddr3Ptr(pframe),
+		   reason, hdr->addr3,
 		   ignore_received_deauth);
 
 	if (ignore_received_deauth == 0)
-		receive_disconnect(padapter, GetAddr3Ptr(pframe), reason);
+		receive_disconnect(padapter, hdr->addr3, reason);
 
 	pmlmepriv->link_detect_info.busy_traffic = false;
 	return _SUCCESS;
@@ -1487,9 +1493,10 @@ unsigned int OnDisassoc(struct adapter *padapter, union recv_frame *precv_frame)
 	struct mlme_ext_priv *pmlmeext = &padapter->mlmeextpriv;
 	struct mlme_ext_info *pmlmeinfo = &pmlmeext->mlmext_info;
 	u8 *pframe = precv_frame->u.hdr.rx_data;
+	struct ieee80211_hdr *hdr = (struct ieee80211_hdr *)pframe;
 
 	/* check A3 */
-	if (memcmp(GetAddr3Ptr(pframe), get_my_bssid(&pmlmeinfo->network), ETH_ALEN))
+	if (memcmp(hdr->addr3, get_my_bssid(&pmlmeinfo->network), ETH_ALEN))
 		return _SUCCESS;
 
 	reason = le16_to_cpu(*(__le16 *)(pframe + WLAN_HDR_A3_LEN));
@@ -1500,9 +1507,9 @@ unsigned int OnDisassoc(struct adapter *padapter, union recv_frame *precv_frame)
 
 		netdev_dbg(padapter->pnetdev,
 			   "ap recv disassoc reason code(%d) sta:%pM\n",
-			   reason, GetAddr2Ptr(pframe));
+			   reason, hdr->addr2);
 
-		psta = rtw_get_stainfo(pstapriv, GetAddr2Ptr(pframe));
+		psta = rtw_get_stainfo(pstapriv, hdr->addr2);
 		if (psta) {
 			u8 updated = false;
 
@@ -1521,9 +1528,9 @@ unsigned int OnDisassoc(struct adapter *padapter, union recv_frame *precv_frame)
 	}
 	netdev_dbg(padapter->pnetdev,
 		   "sta recv disassoc reason code(%d) sta:%pM\n",
-		   reason, GetAddr3Ptr(pframe));
+		   reason, hdr->addr3);
 
-	receive_disconnect(padapter, GetAddr3Ptr(pframe), reason);
+	receive_disconnect(padapter, hdr->addr3, reason);
 
 	pmlmepriv->link_detect_info.busy_traffic = false;
 	return _SUCCESS;
@@ -1539,11 +1546,12 @@ unsigned int on_action_spct(struct adapter *padapter, union recv_frame *precv_fr
 	struct sta_info *psta = NULL;
 	struct sta_priv *pstapriv = &padapter->stapriv;
 	u8 *pframe = precv_frame->u.hdr.rx_data;
+	struct ieee80211_hdr *hdr = (struct ieee80211_hdr *)pframe;
 	u8 *frame_body = (u8 *)(pframe + sizeof(struct ieee80211_hdr_3addr));
 	u8 category;
 	u8 action;
 
-	psta = rtw_get_stainfo(pstapriv, GetAddr2Ptr(pframe));
+	psta = rtw_get_stainfo(pstapriv, hdr->addr2);
 
 	if (!psta)
 		goto exit;
@@ -1579,17 +1587,18 @@ unsigned int OnAction_back(struct adapter *padapter, union recv_frame *precv_fra
 	struct mlme_ext_priv *pmlmeext = &padapter->mlmeextpriv;
 	struct mlme_ext_info *pmlmeinfo = &pmlmeext->mlmext_info;
 	u8 *pframe = precv_frame->u.hdr.rx_data;
+	struct ieee80211_hdr *hdr = (struct ieee80211_hdr *)pframe;
 	struct sta_priv *pstapriv = &padapter->stapriv;
 
 	/* check RA matches or not */
-	if (memcmp(myid(&(padapter->eeprompriv)), GetAddr1Ptr(pframe), ETH_ALEN))/* for if1, sta/ap mode */
+	if (memcmp(myid(&(padapter->eeprompriv)), hdr->addr1, ETH_ALEN))/* for if1, sta/ap mode */
 		return _SUCCESS;
 
 	if ((pmlmeinfo->state & 0x03) != WIFI_FW_AP_STATE)
 		if (!(pmlmeinfo->state & WIFI_FW_ASSOC_SUCCESS))
 			return _SUCCESS;
 
-	addr = GetAddr2Ptr(pframe);
+	addr = hdr->addr2;
 	psta = rtw_get_stainfo(pstapriv, addr);
 
 	if (!psta)
@@ -1742,11 +1751,12 @@ unsigned int on_action_public(struct adapter *padapter, union recv_frame *precv_
 {
 	unsigned int ret = _FAIL;
 	u8 *pframe = precv_frame->u.hdr.rx_data;
+	struct ieee80211_hdr *hdr = (struct ieee80211_hdr *)pframe;
 	u8 *frame_body = pframe + sizeof(struct ieee80211_hdr_3addr);
 	u8 category, action;
 
 	/* check RA matches or not */
-	if (memcmp(myid(&(padapter->eeprompriv)), GetAddr1Ptr(pframe), ETH_ALEN))
+	if (memcmp(myid(&(padapter->eeprompriv)), hdr->addr1, ETH_ALEN))
 		goto exit;
 
 	category = frame_body[0];
@@ -1770,11 +1780,12 @@ unsigned int on_action_public(struct adapter *padapter, union recv_frame *precv_
 unsigned int OnAction_ht(struct adapter *padapter, union recv_frame *precv_frame)
 {
 	u8 *pframe = precv_frame->u.hdr.rx_data;
+	struct ieee80211_hdr *hdr = (struct ieee80211_hdr *)pframe;
 	u8 *frame_body = pframe + sizeof(struct ieee80211_hdr_3addr);
 	u8 category, action;
 
 	/* check RA matches or not */
-	if (memcmp(myid(&(padapter->eeprompriv)), GetAddr1Ptr(pframe), ETH_ALEN))
+	if (memcmp(myid(&(padapter->eeprompriv)), hdr->addr1, ETH_ALEN))
 		goto exit;
 
 	category = frame_body[0];
@@ -1797,13 +1808,14 @@ unsigned int OnAction_ht(struct adapter *padapter, union recv_frame *precv_frame
 unsigned int OnAction_sa_query(struct adapter *padapter, union recv_frame *precv_frame)
 {
 	u8 *pframe = precv_frame->u.hdr.rx_data;
+	struct ieee80211_hdr *hdr = (struct ieee80211_hdr *)pframe;
 	struct mlme_ext_priv *pmlmeext = &(padapter->mlmeextpriv);
 	unsigned short tid;
 
 	switch (pframe[WLAN_HDR_A3_LEN + 1]) {
 	case 0: /* SA Query req */
 		memcpy(&tid, &pframe[WLAN_HDR_A3_LEN + 2], sizeof(unsigned short));
-		issue_action_SA_Query(padapter, GetAddr2Ptr(pframe), 1, tid);
+		issue_action_SA_Query(padapter, hdr->addr2, 1, tid);
 		break;
 
 	case 1: /* SA Query rsp */
@@ -1924,13 +1936,13 @@ void update_mgntframe_attrib(struct adapter *padapter, struct pkt_attrib *pattri
 
 void update_mgntframe_attrib_addr(struct adapter *padapter, struct xmit_frame *pmgntframe)
 {
-	u8 *pframe;
+	struct ieee80211_hdr *hdr;
 	struct pkt_attrib	*pattrib = &pmgntframe->attrib;
 
-	pframe = (u8 *)(pmgntframe->buf_addr) + TXDESC_OFFSET;
+	hdr = (struct ieee80211_hdr *)(pmgntframe->buf_addr + TXDESC_OFFSET);
 
-	memcpy(pattrib->ra, GetAddr1Ptr(pframe), ETH_ALEN);
-	memcpy(pattrib->ta, GetAddr2Ptr(pframe), ETH_ALEN);
+	memcpy(pattrib->ra, hdr->addr1, ETH_ALEN);
+	memcpy(pattrib->ta, hdr->addr2, ETH_ALEN);
 }
 
 void dump_mgntframe(struct adapter *padapter, struct xmit_frame *pmgntframe)
@@ -2609,9 +2621,9 @@ void issue_asocrsp(struct adapter *padapter, unsigned short status, struct sta_i
 	fctrl = &(pwlanhdr->frame_control);
 	*(fctrl) = 0;
 
-	memcpy(GetAddr1Ptr(pwlanhdr), pstat->hwaddr, ETH_ALEN);
-	memcpy(GetAddr2Ptr(pwlanhdr), myid(&(padapter->eeprompriv)), ETH_ALEN);
-	memcpy(GetAddr3Ptr(pwlanhdr), get_my_bssid(&(pmlmeinfo->network)), ETH_ALEN);
+	memcpy(pwlanhdr->addr1, pstat->hwaddr, ETH_ALEN);
+	memcpy(pwlanhdr->addr2, myid(&(padapter->eeprompriv)), ETH_ALEN);
+	memcpy(pwlanhdr->addr3, get_my_bssid(&(pmlmeinfo->network)), ETH_ALEN);
 
 	SetSeqNum(pwlanhdr, pmlmeext->mgnt_seq);
 	pmlmeext->mgnt_seq++;
@@ -3744,6 +3756,7 @@ u8 collect_bss_info(struct adapter *padapter, union recv_frame *precv_frame, str
 	u8 *p;
 	u16 val16, subtype;
 	u8 *pframe = precv_frame->u.hdr.rx_data;
+	struct ieee80211_hdr *hdr = (struct ieee80211_hdr *)pframe;
 	u32 packet_len = precv_frame->u.hdr.len;
 	u8 ie_offset;
 	struct registry_priv *pregistrypriv = &padapter->registrypriv;
@@ -3854,10 +3867,10 @@ u8 collect_bss_info(struct adapter *padapter, union recv_frame *precv_frame, str
 
 	if (val16 & BIT(0)) {
 		bssid->infrastructure_mode = NL80211_IFTYPE_STATION;
-		memcpy(bssid->mac_address, GetAddr2Ptr(pframe), ETH_ALEN);
+		memcpy(bssid->mac_address, hdr->addr2, ETH_ALEN);
 	} else {
 		bssid->infrastructure_mode = NL80211_IFTYPE_ADHOC;
-		memcpy(bssid->mac_address, GetAddr3Ptr(pframe), ETH_ALEN);
+		memcpy(bssid->mac_address, hdr->addr3, ETH_ALEN);
 	}
 
 	if (val16 & BIT(4))
diff --git a/drivers/staging/rtl8723bs/core/rtw_recv.c b/drivers/staging/rtl8723bs/core/rtw_recv.c
index 381b3e29a..8f3c0552e 100644
--- a/drivers/staging/rtl8723bs/core/rtw_recv.c
+++ b/drivers/staging/rtl8723bs/core/rtw_recv.c
@@ -673,6 +673,7 @@ static signed int sta2sta_data_frame(struct adapter *adapter, union recv_frame *
 			struct sta_info **psta)
 {
 	u8 *ptr = precv_frame->u.hdr.rx_data;
+	struct ieee80211_hdr *hdr = (struct ieee80211_hdr *)ptr;
 	signed int ret = _SUCCESS;
 	struct rx_pkt_attrib *pattrib = &precv_frame->u.hdr.attrib;
 	struct sta_priv *pstapriv = &adapter->stapriv;
@@ -730,9 +731,9 @@ static signed int sta2sta_data_frame(struct adapter *adapter, union recv_frame *
 		}
 
 	} else if (check_fwstate(pmlmepriv, WIFI_MP_STATE)) {
-		memcpy(pattrib->dst, GetAddr1Ptr(ptr), ETH_ALEN);
-		memcpy(pattrib->src, GetAddr2Ptr(ptr), ETH_ALEN);
-		memcpy(pattrib->bssid, GetAddr3Ptr(ptr), ETH_ALEN);
+		memcpy(pattrib->dst, hdr->addr1, ETH_ALEN);
+		memcpy(pattrib->src, hdr->addr2, ETH_ALEN);
+		memcpy(pattrib->bssid, hdr->addr3, ETH_ALEN);
 		memcpy(pattrib->ra, pattrib->dst, ETH_ALEN);
 		memcpy(pattrib->ta, pattrib->src, ETH_ALEN);
 
@@ -759,6 +760,7 @@ static signed int ap2sta_data_frame(struct adapter *adapter, union recv_frame *p
 		       struct sta_info **psta)
 {
 	u8 *ptr = precv_frame->u.hdr.rx_data;
+	struct ieee80211_hdr *hdr = (struct ieee80211_hdr *)ptr;
 	struct rx_pkt_attrib *pattrib = &precv_frame->u.hdr.attrib;
 	signed int ret = _SUCCESS;
 	struct sta_priv *pstapriv = &adapter->stapriv;
@@ -812,9 +814,9 @@ static signed int ap2sta_data_frame(struct adapter *adapter, union recv_frame *p
 
 	} else if (check_fwstate(pmlmepriv, WIFI_MP_STATE) &&
 		   check_fwstate(pmlmepriv, _FW_LINKED)) {
-		memcpy(pattrib->dst, GetAddr1Ptr(ptr), ETH_ALEN);
-		memcpy(pattrib->src, GetAddr2Ptr(ptr), ETH_ALEN);
-		memcpy(pattrib->bssid, GetAddr3Ptr(ptr), ETH_ALEN);
+		memcpy(pattrib->dst, hdr->addr1, ETH_ALEN);
+		memcpy(pattrib->src, hdr->addr2, ETH_ALEN);
+		memcpy(pattrib->bssid, hdr->addr3, ETH_ALEN);
 		memcpy(pattrib->ra, pattrib->dst, ETH_ALEN);
 		memcpy(pattrib->ta, pattrib->src, ETH_ALEN);
 
@@ -909,16 +911,17 @@ static signed int validate_recv_ctrl_frame(struct adapter *padapter, union recv_
 	struct rx_pkt_attrib *pattrib = &precv_frame->u.hdr.attrib;
 	struct sta_priv *pstapriv = &padapter->stapriv;
 	u8 *pframe = precv_frame->u.hdr.rx_data;
+	struct ieee80211_hdr *hdr = (struct ieee80211_hdr *)pframe;
 	struct sta_info *psta = NULL;
 
 	if (GetFrameType(pframe) != WIFI_CTRL_TYPE)
 		return _FAIL;
 
 	/* receive the frames that ra(a1) is my address */
-	if (memcmp(GetAddr1Ptr(pframe), myid(&padapter->eeprompriv), ETH_ALEN))
+	if (memcmp(hdr->addr1, myid(&padapter->eeprompriv), ETH_ALEN))
 		return _FAIL;
 
-	psta = rtw_get_stainfo(pstapriv, GetAddr2Ptr(pframe));
+	psta = rtw_get_stainfo(pstapriv, hdr->addr2);
 	if (!psta)
 		return _FAIL;
 
@@ -1193,14 +1196,17 @@ static union recv_frame *recvframe_chk_defrag(struct adapter *padapter, union re
 
 static signed int validate_recv_mgnt_frame(struct adapter *padapter, union recv_frame *precv_frame)
 {
+	struct ieee80211_hdr *hdr;
 	struct sta_info *psta;
 
 	precv_frame = recvframe_chk_defrag(padapter, precv_frame);
 	if (!precv_frame)
 		return _SUCCESS;
 
+	hdr = (struct ieee80211_hdr *)precv_frame->u.hdr.rx_data;
+
 	/* for rx pkt statistics */
-	psta = rtw_get_stainfo(&padapter->stapriv, GetAddr2Ptr(precv_frame->u.hdr.rx_data));
+	psta = rtw_get_stainfo(&padapter->stapriv, hdr->addr2);
 	if (!psta)
 		goto exit;
 
@@ -1214,12 +1220,10 @@ static signed int validate_recv_mgnt_frame(struct adapter *padapter, union recv_
 		psta->sta_stats.rx_probereq_pkts++;
 		break;
 	case WIFI_PROBERSP:
-		if (!memcmp(padapter->eeprompriv.mac_addr,
-			    GetAddr1Ptr(precv_frame->u.hdr.rx_data),
-			    ETH_ALEN))
+		if (!memcmp(padapter->eeprompriv.mac_addr, hdr->addr1, ETH_ALEN))
 			psta->sta_stats.rx_probersp_pkts++;
-		else if (is_broadcast_ether_addr(GetAddr1Ptr(precv_frame->u.hdr.rx_data)) ||
-			 is_multicast_ether_addr(GetAddr1Ptr(precv_frame->u.hdr.rx_data)))
+		else if (is_broadcast_ether_addr(hdr->addr1) ||
+			 is_multicast_ether_addr(hdr->addr1))
 			psta->sta_stats.rx_probersp_bm_pkts++;
 		else
 			psta->sta_stats.rx_probersp_uo_pkts++;
@@ -1239,6 +1243,7 @@ static signed int validate_recv_data_frame(struct adapter *adapter, union recv_f
 	u8 *psa, *pda, *pbssid;
 	struct sta_info *psta = NULL;
 	u8 *ptr = precv_frame->u.hdr.rx_data;
+	struct ieee80211_hdr *hdr = (struct ieee80211_hdr *)ptr;
 	struct rx_pkt_attrib *pattrib = &precv_frame->u.hdr.attrib;
 	struct security_priv *psecuritypriv = &adapter->securitypriv;
 	signed int ret = _SUCCESS;
@@ -1278,8 +1283,8 @@ static signed int validate_recv_data_frame(struct adapter *adapter, union recv_f
 		break;
 
 	case 3:
-		memcpy(pattrib->ra, GetAddr1Ptr(ptr), ETH_ALEN);
-		memcpy(pattrib->ta, GetAddr2Ptr(ptr), ETH_ALEN);
+		memcpy(pattrib->ra, hdr->addr1, ETH_ALEN);
+		memcpy(pattrib->ta, hdr->addr2, ETH_ALEN);
 		ret = _FAIL;
 		break;
 
@@ -1344,6 +1349,7 @@ static signed int validate_80211w_mgmt(struct adapter *adapter, union recv_frame
 	struct mlme_priv *pmlmepriv = &adapter->mlmepriv;
 	struct rx_pkt_attrib *pattrib = &precv_frame->u.hdr.attrib;
 	u8 *ptr = precv_frame->u.hdr.rx_data;
+	struct ieee80211_hdr *hdr = (struct ieee80211_hdr *)ptr;
 	u8 subtype;
 
 	subtype = GetFrameSubType(ptr); /* bit(7)~bit(2) */
@@ -1352,7 +1358,7 @@ static signed int validate_80211w_mgmt(struct adapter *adapter, union recv_frame
 	if (check_fwstate(pmlmepriv, WIFI_STATION_STATE) && check_fwstate(pmlmepriv, _FW_LINKED) &&
 	    adapter->securitypriv.binstallBIPkey) {
 		/* unicast management frame decrypt */
-		if (pattrib->privacy && !(is_multicast_ether_addr(GetAddr1Ptr(ptr))) &&
+		if (pattrib->privacy && !(is_multicast_ether_addr(hdr->addr1)) &&
 			(subtype == WIFI_DEAUTH || subtype == WIFI_DISASSOC || subtype == WIFI_ACTION)) {
 			u8 *mgmt_DATA;
 			u32 data_len = 0;
@@ -1362,8 +1368,8 @@ static signed int validate_80211w_mgmt(struct adapter *adapter, union recv_frame
 			pattrib->hdrlen = sizeof(struct ieee80211_hdr_3addr);
 			/* set iv and icv length */
 			SET_ICE_IV_LEN(pattrib->iv_len, pattrib->icv_len, pattrib->encrypt);
-			memcpy(pattrib->ra, GetAddr1Ptr(ptr), ETH_ALEN);
-			memcpy(pattrib->ta, GetAddr2Ptr(ptr), ETH_ALEN);
+			memcpy(pattrib->ra, hdr->addr1, ETH_ALEN);
+			memcpy(pattrib->ta, hdr->addr2, ETH_ALEN);
 			/* actual management data frame body */
 			data_len = pattrib->pkt_len - pattrib->hdrlen - pattrib->iv_len - pattrib->icv_len;
 			mgmt_DATA = kzalloc(data_len, GFP_ATOMIC);
@@ -1381,7 +1387,7 @@ static signed int validate_80211w_mgmt(struct adapter *adapter, union recv_frame
 			/* remove the iv and icv length */
 			pattrib->pkt_len = pattrib->pkt_len - pattrib->iv_len - pattrib->icv_len;
 			kfree(mgmt_DATA);
-		} else if (is_multicast_ether_addr(GetAddr1Ptr(ptr)) &&
+		} else if (is_multicast_ether_addr(hdr->addr1) &&
 			(subtype == WIFI_DEAUTH || subtype == WIFI_DISASSOC)) {
 			signed int BIP_ret = _SUCCESS;
 			/* verify BIP MME IE of broadcast/multicast de-auth/disassoc packet */
diff --git a/drivers/staging/rtl8723bs/core/rtw_wlan_util.c b/drivers/staging/rtl8723bs/core/rtw_wlan_util.c
index 9feab9ab7..72607588d 100644
--- a/drivers/staging/rtl8723bs/core/rtw_wlan_util.c
+++ b/drivers/staging/rtl8723bs/core/rtw_wlan_util.c
@@ -1082,7 +1082,7 @@ int rtw_check_bcn_info(struct adapter *Adapter, u8 *pframe, u32 packet_len)
 	int group_cipher = 0, pairwise_cipher = 0, is_8021x = 0;
 	unsigned char *pbuf;
 	u32 wpa_ielen = 0;
-	u8 *pbssid = GetAddr3Ptr(pframe);
+	u8 *pbssid = ((struct ieee80211_hdr *)pframe)->addr3;
 	struct HT_info_element *pht_info = NULL;
 	struct ieee80211_ht_cap *pht_cap = NULL;
 	u32 bcn_channel;
diff --git a/drivers/staging/rtl8723bs/include/wifi.h b/drivers/staging/rtl8723bs/include/wifi.h
index 93cb83488..6c877c7ca 100644
--- a/drivers/staging/rtl8723bs/include/wifi.h
+++ b/drivers/staging/rtl8723bs/include/wifi.h
@@ -7,6 +7,8 @@
 #ifndef _WIFI_H_
 #define _WIFI_H_
 
+#include <linux/ieee80211.h>
+
 #define WLAN_HDR_A3_LEN		24
 #define WLAN_HDR_A3_QOS_LEN	26
 
@@ -180,47 +182,42 @@ enum {
 
 #define GetAid(pbuf)	(le16_to_cpu(*(__le16 *)((size_t)(pbuf) + 2)) & 0x3fff)
 
-#define GetAddr1Ptr(pbuf)	((unsigned char *)((size_t)(pbuf) + 4))
-
-#define GetAddr2Ptr(pbuf)	((unsigned char *)((size_t)(pbuf) + 10))
-
-#define GetAddr3Ptr(pbuf)	((unsigned char *)((size_t)(pbuf) + 16))
-
-#define GetAddr4Ptr(pbuf)	((unsigned char *)((size_t)(pbuf) + 24))
-
 static inline unsigned char *rtl8723bs_get_ra(unsigned char *pframe)
 {
+	struct ieee80211_hdr *hdr = (struct ieee80211_hdr *)pframe;
 	unsigned char *ra;
 
-	ra = GetAddr1Ptr(pframe);
+	ra = hdr->addr1;
 	return ra;
 }
 
 static inline unsigned char *get_ta(unsigned char *pframe)
 {
+	struct ieee80211_hdr *hdr = (struct ieee80211_hdr *)pframe;
 	unsigned char *ta;
 
-	ta = GetAddr2Ptr(pframe);
+	ta = hdr->addr2;
 	return ta;
 }
 
 static inline unsigned char *get_da(unsigned char *pframe)
 {
+	struct ieee80211_hdr *hdr = (struct ieee80211_hdr *)pframe;
 	unsigned char *da;
 	unsigned int	to_fr_ds	= (GetToDs(pframe) << 1) | GetFrDs(pframe);
 
 	switch (to_fr_ds) {
 	case 0x00:	/*  ToDs = 0, FromDs = 0 */
-		da = GetAddr1Ptr(pframe);
+		da = hdr->addr1;
 		break;
 	case 0x01:	/*  ToDs = 0, FromDs = 1 */
-		da = GetAddr1Ptr(pframe);
+		da = hdr->addr1;
 		break;
 	case 0x02:	/*  ToDs = 1, FromDs = 0 */
-		da = GetAddr3Ptr(pframe);
+		da = hdr->addr3;
 		break;
 	default:	/*  ToDs = 1, FromDs = 1 */
-		da = GetAddr3Ptr(pframe);
+		da = hdr->addr3;
 		break;
 	}
 
@@ -229,21 +226,22 @@ static inline unsigned char *get_da(unsigned char *pframe)
 
 static inline unsigned char *get_sa(unsigned char *pframe)
 {
+	struct ieee80211_hdr *hdr = (struct ieee80211_hdr *)pframe;
 	unsigned char *sa;
 	unsigned int	to_fr_ds	= (GetToDs(pframe) << 1) | GetFrDs(pframe);
 
 	switch (to_fr_ds) {
 	case 0x00:	/*  ToDs = 0, FromDs = 0 */
-		sa = GetAddr2Ptr(pframe);
+		sa = hdr->addr2;
 		break;
 	case 0x01:	/*  ToDs = 0, FromDs = 1 */
-		sa = GetAddr3Ptr(pframe);
+		sa = hdr->addr3;
 		break;
 	case 0x02:	/*  ToDs = 1, FromDs = 0 */
-		sa = GetAddr2Ptr(pframe);
+		sa = hdr->addr2;
 		break;
 	default:	/*  ToDs = 1, FromDs = 1 */
-		sa = GetAddr4Ptr(pframe);
+		sa = hdr->addr4;
 		break;
 	}
 
@@ -252,21 +250,22 @@ static inline unsigned char *get_sa(unsigned char *pframe)
 
 static inline unsigned char *get_hdr_bssid(unsigned char *pframe)
 {
+	struct ieee80211_hdr *hdr = (struct ieee80211_hdr *)pframe;
 	unsigned char *sa = NULL;
 	unsigned int	to_fr_ds	= (GetToDs(pframe) << 1) | GetFrDs(pframe);
 
 	switch (to_fr_ds) {
 	case 0x00:	/*  ToDs = 0, FromDs = 0 */
-		sa = GetAddr3Ptr(pframe);
+		sa = hdr->addr3;
 		break;
 	case 0x01:	/*  ToDs = 0, FromDs = 1 */
-		sa = GetAddr2Ptr(pframe);
+		sa = hdr->addr2;
 		break;
 	case 0x02:	/*  ToDs = 1, FromDs = 0 */
-		sa = GetAddr1Ptr(pframe);
+		sa = hdr->addr1;
 		break;
 	case 0x03:	/*  ToDs = 1, FromDs = 1 */
-		sa = GetAddr1Ptr(pframe);
+		sa = hdr->addr1;
 		break;
 	}
 
diff --git a/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c b/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
index 91d98418c..9d203810e 100644
--- a/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
+++ b/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
@@ -1908,7 +1908,8 @@ void rtw_cfg80211_indicate_sta_assoc(struct adapter *padapter, u8 *pmgmt_frame,
 		sinfo.filled = 0;
 		sinfo.assoc_req_ies = pmgmt_frame + WLAN_HDR_A3_LEN + ie_offset;
 		sinfo.assoc_req_ies_len = frame_len - WLAN_HDR_A3_LEN - ie_offset;
-		cfg80211_new_sta(wdev, GetAddr2Ptr(pmgmt_frame), &sinfo, GFP_ATOMIC);
+		cfg80211_new_sta(wdev, ((struct ieee80211_hdr *)pmgmt_frame)->addr2,
+				 &sinfo, GFP_ATOMIC);
 	}
 }
 
-- 
2.43.0

