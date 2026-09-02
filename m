Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 444794A5C53
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 15:08:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788361708; cv=none; b=FGZgBUIqDB4IWYUOIrDlcWUWaD3uEWttpZkkt+eub10j3kDN5Pv4ZHf3+Xnrxw4JCaUaTVFi0QOsZlr6Uq/NtssYFZVsx9QiH2SP/82PR6n2JnrOxCX4PNEJWbNjd9Ug1nREZQrWqO11RcitwT7goDUwk9rkiGIkogCfX0lijrI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788361708; c=relaxed/simple;
	bh=nCXPAnuOSmmXY2rUfpFUiSRZF1+BwzVNVA0wJjmcfWM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OvY0PcIxiKq1jd0WqvVspsuI1oaxSFZio1wi8RErs2JaKVx/8Ixa698BfrWpebBjuNOfPahZgVtSTgLEd8Wq1vQPmFMkQ4CaQ+Wf5o2Hqvvn7JgCOCwClqNqoowWT8j+nel6ttk9w/yFebeu9ZtHqBoeHVIRSJRPoE+sLbOD0W0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EK6R82VG; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EK6R82VG"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-49b965570d7so9674985e9.0
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 08:08:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788361703; x=1788966503; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jNyVKvuZfkn0OMTvx0TpHoFHrsOmOkliSXO6rNR0S8s=;
        b=EK6R82VGG7KG9/L5c+9j9mkS1jE6hxyOeER4s4KFHvP900boVdMaJn+FG13qJisL7f
         YPiuyGwSDeTPYLSJf3Fz8BMpuTq5ipYl1eB29eZTbSf8DBSdOXvtU0ZsPK/vJZS+4TDa
         1Vgbt+4AyE8X7TSmrDE5/kBhDzmEVqF0sl6DDAuDs4tCcWngH99eaS04f5LeBIFBZedE
         eUZRZ97iJx3mhSlDpZua+BHHnwyFt1Kg1cmUhqeCz/ygPmuoDpPGKnYEds9lcpzsj3jC
         ZyVPw1QT6uovxofE7YtTcS4BTvqEXBN+wfk3xs1DPciuzBT+ZEFISFeCZxJHPgMAyIiD
         nBew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788361703; x=1788966503;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=jNyVKvuZfkn0OMTvx0TpHoFHrsOmOkliSXO6rNR0S8s=;
        b=X7YjOCyW0llauwvJKOhjWy9+X3DJtJEVHMBpB0CmaXBVHfPpV4Ojv2aw/N/brJyCuI
         DtUI0jHE5cAdf1HVJKOGpqOig8ue8W3Zfpo6YF5VcH+jbtTnXn9C7Uw1ODLGWSm29LSD
         Ur0x2YUkt2BrrRZ6kjmBsTdF8MSr5pW2CYw3pyTJRHCrRG/9geSi0hDsSx34RnWuUnex
         GnCcfBc1HeWVPs/dTvLjYev7VHAugVSyBKdc2ho8OQabTWUZIK/yMswQCWFXmGLfT3+f
         wl+Nv009iK2W7kvq17X4Zh85p9mcLtej8eDZhVt8lmb+mzdsTNfh+23bMDG3ll7UTOEu
         yhlA==
X-Gm-Message-State: AFuF++mV8hNPvgxGicM1bfBNa/277I9iFRc6cLdiD0v8wJytISHSOt+h
	AFamxogz57hvY/t79AbfIzJzOJdDWpOC/Qzxjhe3mcJfnzeMtTWq+kQ7
X-Gm-Gg: AR+sD12gH+SCJPkxG0SeE95+HEGiCW8Bm281eBHQU/+iuuTlI0rIKqZV+egzKyGehUC
	K4S4QiI1J+I+pkrQoVvY2CG+6xYissJge7D3VoeKQWJzyCRiy807VjmiRrxCHvPgLMauAmiKYG2
	dgX0DrzyM5NJ+0BzAiatrsGssBCnc0E77vex3hlzBFCKbSi17mg280LXdTaZtOpt6eY5O6TVlcw
	iomKGtwSTGFE0oxG5ZBSn0sxnkdLdoL0KgSRyEP7arj0NoUnFb9d6cJwx4cEA0u0HqlJhDY5KLw
	XZtlbErfL6B0EU+Ju4wNXcuxxNAVdI42Y5NIddYLq7mJOjc/aLmDBo6N7jPdR3JEdZCTAyFqS3B
	A5wW7qWMhdevTOjzvEkmqnIMXZVf8nOc/H+uabso5z6Yc45ztTYBJ4Hj2rFAlfnJmfGnqrfhRl9
	kUiJnXO3yJtNSpSwe/PA0wUcAdXFnO61nlepsNCdgCtz4BHDtFKY1fK6t5OrNEid4XwRcX6wGGL
	31jpJFYa4q6ZNvbWgj4FuG1n9e26dkmjaAApc1Aa2HOe523Fc1fsdUsa2agCdZL2DJTfKXAe9Ui
	DomVmXYW
X-Received: by 2002:a05:600c:630e:b0:49c:e27c:6b10 with SMTP id 5b1f17b1804b1-49ce55ecea8mr102752395e9.3.1788361703060;
        Wed, 02 Sep 2026 08:08:23 -0700 (PDT)
Received: from koolguy.fritz.box (dynamic-2a02-3100-1a72-6e00-ef52-6b66-008c-4439.310.pool.telefonica.de. [2a02:3100:1a72:6e00:ef52:6b66:8c:4439])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cdce3e0desm167404405e9.11.2026.09.02.08.08.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 08:08:22 -0700 (PDT)
From: Dalvin-Ehinoma Noah Aiguobas <fliegbert2@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Dalvin-Ehinoma Noah Aiguobas <fliegbert2@gmail.com>
Subject: [PATCH v4 2/2] staging: rtl8723bs: fix Alignment should match open parenthesis in rtw_mlme_ext.c
Date: Wed,  2 Sep 2026 15:05:42 +0000
Message-ID: <20260902150542.2746-3-fliegbert2@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260902150542.2746-1-fliegbert2@gmail.com>
References: <20260715171634.1550-1-fliegbert2@gmail.com>
 <20260902150542.2746-1-fliegbert2@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fixing almost every occurrence of checkpatch warning
Alignment should match open parenthesis in rtw_mlme_ext.c.

Signed-off-by: Dalvin-Ehinoma Noah Aiguobas <fliegbert2@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_mlme_ext.c | 60 +++++++++----------
 1 file changed, 30 insertions(+), 30 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
index fa8a83f5d3cb..01d25068c64f 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
@@ -256,8 +256,8 @@ static void init_mlme_ext_priv_value(struct adapter *padapter)
 }
 
 static int has_channel(struct rt_channel_info *channel_set,
-					   u8 chanset_size,
-					   u8 chan)
+		       u8 chanset_size,
+		       u8 chan)
 {
 	int i;
 
@@ -269,8 +269,8 @@ static int has_channel(struct rt_channel_info *channel_set,
 }
 
 static void init_channel_list(struct adapter *padapter, struct rt_channel_info *channel_set,
-							  u8 chanset_size,
-							  struct p2p_channels *channel_list)
+			      u8 chanset_size,
+			      struct p2p_channels *channel_list)
 {
 	static const struct p2p_oper_class_map op_class[] = {
 		{ IEEE80211G,  81,   1,  13,  1, BW20 },
@@ -302,7 +302,7 @@ static void init_channel_list(struct adapter *padapter, struct rt_channel_info *
 				continue;
 
 			if ((0 < (padapter->registrypriv.bw_mode & 0xf0)) &&
-				((o->bw == BW40MINUS) || (o->bw == BW40PLUS)))
+			    ((o->bw == BW40MINUS) || (o->bw == BW40PLUS)))
 				continue;
 
 			if (!reg) {
@@ -515,7 +515,7 @@ unsigned int OnProbeReq(struct adapter *padapter, union recv_frame *precv_frame)
 	}
 
 	p = rtw_get_ie(pframe + WLAN_HDR_A3_LEN + _PROBEREQ_IE_OFFSET_, WLAN_EID_SSID, (int *)&ielen,
-			len - WLAN_HDR_A3_LEN - _PROBEREQ_IE_OFFSET_);
+		       len - WLAN_HDR_A3_LEN - _PROBEREQ_IE_OFFSET_);
 
 	/* check (wildcard) SSID */
 	if (p) {
@@ -715,8 +715,8 @@ unsigned int OnAuth(struct adapter *padapter, union recv_frame *precv_frame)
 	seq	= le16_to_cpu(*(__le16 *)((SIZE_PTR)pframe + WLAN_HDR_A3_LEN + offset + 2));
 
 	if (auth_mode == 2 &&
-			psecuritypriv->dot11_privacy_algrthm != _WEP40_ &&
-			psecuritypriv->dot11_privacy_algrthm != _WEP104_)
+	    psecuritypriv->dot11_privacy_algrthm != _WEP40_ &&
+	    psecuritypriv->dot11_privacy_algrthm != _WEP104_)
 		auth_mode = 0;
 
 	if ((algorithm > 0 && auth_mode == 0) ||	/*  rx a shared-key auth but shared not enabled */
@@ -797,7 +797,7 @@ unsigned int OnAuth(struct adapter *padapter, union recv_frame *precv_frame)
 			pstat->authalg = algorithm;
 		} else if (seq == 3) {
 			p = rtw_get_ie(pframe + WLAN_HDR_A3_LEN + 4 + _AUTH_IE_OFFSET_, WLAN_EID_CHALLENGE, (int *)&ie_len,
-					len - WLAN_HDR_A3_LEN - _AUTH_IE_OFFSET_ - 4);
+				       len - WLAN_HDR_A3_LEN - _AUTH_IE_OFFSET_ - 4);
 
 			if (!p || ie_len != 128) {
 				status = WLAN_STATUS_CHALLENGE_FAIL;
@@ -883,7 +883,7 @@ unsigned int OnAuthClient(struct adapter *padapter, union recv_frame *precv_fram
 		if (pmlmeinfo->auth_algo == dot11_auth_algrthm_shared) {
 			 /*  legendary shared system */
 			p = rtw_get_ie(pframe + WLAN_HDR_A3_LEN + _AUTH_IE_OFFSET_, WLAN_EID_CHALLENGE, (int *)&len,
-				pkt_len - WLAN_HDR_A3_LEN - _AUTH_IE_OFFSET_);
+				       pkt_len - WLAN_HDR_A3_LEN - _AUTH_IE_OFFSET_);
 
 			if (!p || len != WLAN_AUTH_CHALLENGE_LEN)
 				goto authclnt_fail;
@@ -992,7 +992,7 @@ unsigned int OnAssocReq(struct adapter *padapter, union recv_frame *precv_frame)
 	/*  now we should check all the fields... */
 	/*  checking SSID */
 	p = rtw_get_ie(pframe + WLAN_HDR_A3_LEN + ie_offset, WLAN_EID_SSID, &ie_len,
-		pkt_len - WLAN_HDR_A3_LEN - ie_offset);
+		       pkt_len - WLAN_HDR_A3_LEN - ie_offset);
 
 	if (!p || ie_len == 0) {
 		/*  broadcast ssid, however it is not allowed in assocreq */
@@ -1027,7 +1027,7 @@ unsigned int OnAssocReq(struct adapter *padapter, union recv_frame *precv_frame)
 		support_rate_num = ie_len;
 
 		p = rtw_get_ie(pframe + WLAN_HDR_A3_LEN + ie_offset, WLAN_EID_EXT_SUPP_RATES, &ie_len,
-				pkt_len - WLAN_HDR_A3_LEN - ie_offset);
+			       pkt_len - WLAN_HDR_A3_LEN - ie_offset);
 		if (p) {
 			if (support_rate_num + ie_len <= sizeof(supportRate)) {
 				memcpy(supportRate + support_rate_num, p + 2, ie_len);
@@ -1230,8 +1230,8 @@ unsigned int OnAssocReq(struct adapter *padapter, union recv_frame *precv_frame)
 	}
 
 	if ((pstat->flags & WLAN_STA_HT) &&
-		    ((pstat->wpa2_pairwise_cipher & WPA_CIPHER_TKIP) ||
-		      (pstat->wpa_pairwise_cipher & WPA_CIPHER_TKIP))) {
+	    ((pstat->wpa2_pairwise_cipher & WPA_CIPHER_TKIP) ||
+	    (pstat->wpa_pairwise_cipher & WPA_CIPHER_TKIP))) {
 		/* status = WLAN_STATUS_CIPHER_SUITE_REJECTED; */
 		/* goto OnAssocReqFail; */
 	}
@@ -1962,7 +1962,7 @@ void update_mgntframe_attrib_addr(struct adapter *padapter, struct xmit_frame *p
 void dump_mgntframe(struct adapter *padapter, struct xmit_frame *pmgntframe)
 {
 	if (padapter->surprise_removed ||
-		padapter->driver_stopped) {
+	    padapter->driver_stopped) {
 		rtw_free_xmitbuf(&padapter->xmitpriv, pmgntframe->pxmitbuf);
 		rtw_free_xmitframe(&padapter->xmitpriv, pmgntframe);
 		return;
@@ -1979,7 +1979,7 @@ void dump_mgntframe_and_wait(struct adapter *padapter, struct xmit_frame *pmgntf
 	struct submit_ctx sctx;
 
 	if (padapter->surprise_removed ||
-		padapter->driver_stopped) {
+	    padapter->driver_stopped) {
 		rtw_free_xmitbuf(&padapter->xmitpriv, pmgntframe->pxmitbuf);
 		rtw_free_xmitframe(&padapter->xmitpriv, pmgntframe);
 		return;
@@ -2004,7 +2004,7 @@ s32 dump_mgntframe_and_wait_ack(struct adapter *padapter, struct xmit_frame *pmg
 	struct xmit_priv *pxmitpriv = &padapter->xmitpriv;
 
 	if (padapter->surprise_removed ||
-		padapter->driver_stopped) {
+	    padapter->driver_stopped) {
 		rtw_free_xmitbuf(&padapter->xmitpriv, pmgntframe->pxmitbuf);
 		rtw_free_xmitframe(&padapter->xmitpriv, pmgntframe);
 		return -1;
@@ -2500,7 +2500,7 @@ inline void issue_probereq(struct adapter *padapter, struct ndis_802_11_ssid *ps
 }
 
 int issue_probereq_ex(struct adapter *padapter, struct ndis_802_11_ssid *pssid, u8 *da, u8 ch, bool append_wps,
-	int try_cnt, int wait_ms)
+		      int try_cnt, int wait_ms)
 {
 	int ret;
 	int i = 0;
@@ -2901,8 +2901,8 @@ void issue_assocreq(struct adapter *padapter)
 		switch (pIE->element_id) {
 		case WLAN_EID_VENDOR_SPECIFIC:
 			if ((!memcmp(pIE->data, RTW_WPA_OUI, 4)) ||
-					(!memcmp(pIE->data, WMM_OUI, 4)) ||
-					(!memcmp(pIE->data, WPS_OUI, 4))) {
+			    (!memcmp(pIE->data, WMM_OUI, 4)) ||
+			    (!memcmp(pIE->data, WPS_OUI, 4))) {
 				vs_ie_length = pIE->length;
 				if ((!padapter->registrypriv.wifi_spec) && (!memcmp(pIE->data, WPS_OUI, 4))) {
 					/* Commented by Kurt 20110629
@@ -3274,7 +3274,7 @@ int issue_deauth(struct adapter *padapter, unsigned char *da, unsigned short rea
 }
 
 int issue_deauth_ex(struct adapter *padapter, u8 *da, unsigned short reason, int try_cnt,
-	int wait_ms)
+		    int wait_ms)
 {
 	int ret;
 	int i = 0;
@@ -4166,7 +4166,7 @@ static void process_80211d(struct adapter *padapter, struct wlan_bssid_ex *bssid
 
 	/*  Adjust channel plan by AP Country IE */
 	if (pregistrypriv->enable80211d &&
-		(!pmlmeext->update_channel_plan_by_ap_done)) {
+	    (!pmlmeext->update_channel_plan_by_ap_done)) {
 		u8 *ie, *p;
 		u32 len;
 		struct rt_channel_plan chplan_ap;
@@ -4216,8 +4216,8 @@ static void process_80211d(struct adapter *padapter, struct wlan_bssid_ex *bssid
 		if (pregistrypriv->wireless_mode & WIRELESS_11G) {
 			do {
 				if ((i == MAX_CHANNEL_NUM) ||
-					(chplan_sta[i].channel_num == 0) ||
-					(chplan_sta[i].channel_num > 14))
+				    (chplan_sta[i].channel_num == 0) ||
+				    (chplan_sta[i].channel_num > 14))
 					break;
 
 				if ((j == chplan_ap.Len) || (chplan_ap.Channel[j] > 14))
@@ -4244,8 +4244,8 @@ static void process_80211d(struct adapter *padapter, struct wlan_bssid_ex *bssid
 
 			/*  change AP not support channel to Passive scan */
 			while ((i < MAX_CHANNEL_NUM) &&
-				(chplan_sta[i].channel_num != 0) &&
-				(chplan_sta[i].channel_num <= 14)) {
+			       (chplan_sta[i].channel_num != 0) &&
+			       (chplan_sta[i].channel_num <= 14)) {
 				chplan_new[k].channel_num = chplan_sta[i].channel_num;
 				chplan_new[k].scan_type = SCAN_PASSIVE;
 				i++;
@@ -4262,8 +4262,8 @@ static void process_80211d(struct adapter *padapter, struct wlan_bssid_ex *bssid
 		} else {
 			/*  keep original STA 2.4G channel plan */
 			while ((i < MAX_CHANNEL_NUM) &&
-				(chplan_sta[i].channel_num != 0) &&
-				(chplan_sta[i].channel_num <= 14)) {
+			       (chplan_sta[i].channel_num != 0) &&
+			       (chplan_sta[i].channel_num <= 14)) {
 				chplan_new[k].channel_num = chplan_sta[i].channel_num;
 				chplan_new[k].scan_type = chplan_sta[i].scan_type;
 				i++;
@@ -5337,7 +5337,7 @@ u8 disconnect_hdl(struct adapter *padapter, unsigned char *pbuf)
 }
 
 static int rtw_scan_ch_decision(struct adapter *padapter, struct rtw_ieee80211_channel *out,
-	u32 out_num, struct rtw_ieee80211_channel *in, u32 in_num)
+				u32 out_num, struct rtw_ieee80211_channel *in, u32 in_num)
 {
 	int i, j;
 	int set_idx;
@@ -5583,7 +5583,7 @@ u8 add_ba_hdl(struct adapter *padapter, unsigned char *pbuf)
 		return	H2C_SUCCESS;
 
 	if (((pmlmeinfo->state & WIFI_FW_ASSOC_SUCCESS) && (pmlmeinfo->HT_enable)) ||
-		((pmlmeinfo->state & 0x03) == WIFI_FW_AP_STATE)) {
+	    ((pmlmeinfo->state & 0x03) == WIFI_FW_AP_STATE)) {
 		/* pmlmeinfo->ADDBA_retry_count = 0; */
 		/* pmlmeinfo->candidate_tid_bitmap |= (0x1 << pparm->tid); */
 		/* psta->htpriv.candidate_tid_bitmap |= BIT(pparm->tid); */
-- 
2.55.0

