Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35F442253A1
	for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 17:25:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789838705; cv=none; b=Gl4QnFLITq79+XVSjSJWgZhOfG92MNzH6ohGQCSTyypoZ8/RCqj8sA0hmJJe3quHIFeb4Pvp2kxb0/CvK0tw85nk2pbfnDDdQc1DdaQK/uTLrEPeJfr233iDRuujOlUUgr3XHiM4ePTJp2mEp6yT2N3TbNE6O2mDDACvngfu61M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789838705; c=relaxed/simple;
	bh=cyK7AvFuVIRxV7z1jlLK8VNo2VKbGsuB+368KoWPRCI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=H7J/WKMde5WZ90kNYzb3bddpt8FJU8Ehn4x5UbFrE3ebr6mzTfhoJ30tkWlNW+ciBKG2eD0YoCQNGmuIcHWDwZOjVeAXGAdv8Alx+YIA8+oI/jC6r1y887OHe8aRspWrrpv2uKNMrX6ZsjmNulLhwQMy1nT8dymfpQuRqSjQ340=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=p6ORS9un; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="p6ORS9un"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-482f6356f6bso1391010f8f.2
        for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 10:25:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789838701; x=1790443501; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=fGkju7g7kB+s61OxlUeY2gnephAmIbSK4BwfthATj1w=;
        b=p6ORS9unfzCY9D2+Vnd36Y/BqdpGP9xlkPFDyTOGsoqqiLYs2XcpcMjF0zyWw2Hbl6
         //fn8H9ikpvkorKbEQs0Xr+dZjXIvr0R6YGkJnUSxKe1XXC9DHtW5rhoGO9ARdy2Jkrh
         CGCPR3A3WxYbvdED4+kkGQ711oNHz2IxJOC0PkgELHPqcNKsoD3mXlIlumNUUU9sNoES
         xlyjTcMzdz0JrPgE3tel0La2R2tYPcor0P/ckQOim+abymbl0UQuRxqLaVtbjZRTAoYr
         yf/jT3fgAS0W2RUHTmDROhyPzPLIAJ9tl82skBVxfkGduSPO12SFbhXlWs37tRF1ONG9
         Z9Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789838701; x=1790443501;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fGkju7g7kB+s61OxlUeY2gnephAmIbSK4BwfthATj1w=;
        b=Q8UpkJA7g4Zsd+8p1FT3OXutnDygcYvc5nOsrXgaVWvjL2eCgj5I/lBXpTmmn2sZcZ
         VCVpJRf6zYv8Ab7WSHoTXkbv1ROBn86wi6+kr/j8QinOjTSq1KL2Ntuhwfbzvwyw0FGu
         rdeIy7+dTwtD4p2zgSc937pAs4jqRW0AUONkmdtRL51Y2vImNK1JoCwo7eoHgyyIugVW
         DZHdXwfqcP5GU+rpyNhzZPG9Hfji4j6RNcLp8KK7zKcLcwM9HldekYyOAQ01y9i+nDzP
         jiq1tL0TWHzLH0boAELNYO1fdmwmIP5S3fAAvXrMlO+eFMlD4vePkqPg0FUty63wa9VE
         aynw==
X-Forwarded-Encrypted: i=1; AKwUvByEggF2FiUj5EQJtHssqiWEs8YjWxdN3FAboFp6xXierIjohrG71r5OXIs7FQvy59PKNJ1Z/dnC4BU5SAQ=@vger.kernel.org
X-Gm-Message-State: AFuF++mnGfpVwmTna3WefObF6v1bntooYBIXfRfi0uUlzXDpuOBh5RvL
	hPuZNcsD5Orpn4GFIBARtM8q5w6p1qnstJZzk6z5QZ+MntnLB2d8KqHFI9m5KVJv
X-Gm-Gg: AYBFou2T3rfqH1rcV6+GCiimecL1RS62bknLeCxxMT04JaeTNmdudoLMnCmQcZDWElm
	G39Vs1/l2ZnuhMrop5bDx3XYIBSjNpQU7I6G9SBFMqfFhIMKoQl9bILR0dYvm1R1QDvcYF9s65J
	V+iI7I87JS5BryVqNK54w0/+OMO2WnS4duslZKj4L01iEkoa9acIkLFjJ6VqlcOG04xOwktRy+x
	fdoED0IFtdIthZ5KHeRmk0lHn9NNdQTZj6Wb9Xg63Q6bCyf1epqbjWiwffeRB+Iav7raI/zYMkI
	KoylEo8Npp58BAN4O8fgWtASJDNdZ+4GWByyzRiP/hW6JTmfHCUcneWfz18MJjV9Nn6sZqLcsLJ
	eebTH0EBy2kxNTVaD4zTEIzL5FNYxR4YRfRbFdEFDidy1KZ83IniuHu+6m/WNtRT3Pcl1fnHzKl
	NavEvsbuE9KGKIE64cQmgXJtiupAShH9QYwi+3R12R9yxs3u5UUd12CumB7frVXjVxHMgkZQdpd
	/lHVSHmKN+aX6tg1OgugLXsJejKJYeYUs8KY0lELVxXUw==
X-Received: by 2002:a05:600c:3493:b0:49f:bd3c:bc21 with SMTP id 5b1f17b1804b1-49fc573b55emr86806615e9.28.1789838701065;
        Sat, 19 Sep 2026 10:25:01 -0700 (PDT)
Received: from localhost.localdomain ([176.220.97.85])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fcce144b1sm144778935e9.0.2026.09.19.10.24.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Sep 2026 10:25:00 -0700 (PDT)
From: Omer PALA <palaomer100@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev (open list:STAGING SUBSYSTEM),
	linux-kernel@vger.kernel.org (open list)
Cc: linux-staging@lists.linux.dev (open list:STAGING SUBSYSTEM),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] staging: rtl8723bs: Use guards for mutexes
Date: Sat, 19 Sep 2026 20:24:13 +0300
Message-ID: <20260919172419.60288-1-palaomer100@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Simplify lock management across the rtl8723bs driver by replacing
manual spinlock and mutex acquire/release calls with scope-based
cleanup guards (guard() and scoped_guard()).

This reduces boilerplate code, removes redundant error-path unlock
logic, and prevents potential lock leaks on early return statements.

Signed-off-by: Omer PALA <palaomer100@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_ap.c       |  18 +--
 drivers/staging/rtl8723bs/core/rtw_cmd.c      |  23 ++-
 .../staging/rtl8723bs/core/rtw_ioctl_set.c    | 127 ++++++----------
 drivers/staging/rtl8723bs/core/rtw_mlme.c     |   3 +-
 drivers/staging/rtl8723bs/core/rtw_mlme_ext.c |   3 +-
 drivers/staging/rtl8723bs/core/rtw_pwrctrl.c  | 143 +++++++-----------
 .../staging/rtl8723bs/core/rtw_wlan_util.c    |  30 ++--
 7 files changed, 139 insertions(+), 208 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_ap.c b/drivers/staging/rtl8723bs/core/rtw_ap.c
index 4728f62a1..0ca2fecdc 100644
--- a/drivers/staging/rtl8723bs/core/rtw_ap.c
+++ b/drivers/staging/rtl8723bs/core/rtw_ap.c
@@ -1912,20 +1912,20 @@ void stop_ap_mode(struct adapter *padapter)
 	padapter->securitypriv.ndisencryptstatus = Ndis802_11WEPDisabled;
 
 	/* for ACL */
-	spin_lock_bh(&pacl_node_q->lock);
-	phead = get_list_head(pacl_node_q);
-	list_for_each_safe(plist, tmp, phead) {
-		paclnode = list_entry(plist, struct rtw_wlan_acl_node, list);
+	scoped_guard(spinlock_bh, &pacl_node_q->lock) {
+		phead = get_list_head(pacl_node_q);
+		list_for_each_safe(plist, tmp, phead) {
+			paclnode = list_entry(plist, struct rtw_wlan_acl_node, list);
 
-		if (paclnode->valid) {
-			paclnode->valid = false;
+			if (paclnode->valid) {
+				paclnode->valid = false;
 
-			list_del_init(&paclnode->list);
+				list_del_init(&paclnode->list);
 
-			pacl_list->num--;
+				pacl_list->num--;
+			}
 		}
 	}
-	spin_unlock_bh(&pacl_node_q->lock);
 
 	rtw_sta_flush(padapter);
 
diff --git a/drivers/staging/rtl8723bs/core/rtw_cmd.c b/drivers/staging/rtl8723bs/core/rtw_cmd.c
index ce3dfa1fe..1894e447a 100644
--- a/drivers/staging/rtl8723bs/core/rtw_cmd.c
+++ b/drivers/staging/rtl8723bs/core/rtw_cmd.c
@@ -460,8 +460,7 @@ int rtw_cmd_thread(void *context)
 		cmd_hdl = NULL;
 
 post_process:
-
-		if (mutex_lock_interruptible(&pcmd->padapter->cmdpriv.sctx_mutex) == 0) {
+		scoped_cond_guard(mutex_intr, (void)0, &pcmd->padapter->cmdpriv.sctx_mutex) {
 			if (pcmd->sctx) {
 				netdev_dbg(padapter->pnetdev,
 					   FUNC_ADPT_FMT " pcmd->sctx\n",
@@ -472,7 +471,6 @@ int rtw_cmd_thread(void *context)
 				else
 					rtw_sctx_done_err(&pcmd->sctx, RTW_SCTX_DONE_CMD_ERROR);
 			}
-			mutex_unlock(&pcmd->padapter->cmdpriv.sctx_mutex);
 		}
 
 		/* call callback function for post-processed */
@@ -655,10 +653,9 @@ int rtw_startbss_cmd(struct adapter  *padapter, int flags)
 
 		if (res == _SUCCESS && (flags & RTW_CMDF_WAIT_ACK)) {
 			rtw_sctx_wait(&sctx);
-			if (mutex_lock_interruptible(&pcmdpriv->sctx_mutex) == 0) {
+			scoped_cond_guard(mutex_intr, (void)0, &pcmdpriv->sctx_mutex) {
 				if (sctx.status == RTW_SCTX_SUBMITTED)
 					pcmd->sctx = NULL;
-				mutex_unlock(&pcmdpriv->sctx_mutex);
 			}
 		}
 	}
@@ -1406,7 +1403,7 @@ static void rtw_lps_change_dtim_hdl(struct adapter *padapter, u8 dtim)
 	if (hal_btcoex_IsBtControlLps(padapter))
 		return;
 
-	mutex_lock(&pwrpriv->lock);
+	guard(mutex)(&pwrpriv->lock);
 
 	pwrpriv->dtim = dtim;
 
@@ -1415,8 +1412,6 @@ static void rtw_lps_change_dtim_hdl(struct adapter *padapter, u8 dtim)
 
 		rtw_hal_set_hwreg(padapter, HW_VAR_H2C_FW_PWRMODE, (u8 *)(&ps_mode));
 	}
-
-	mutex_unlock(&pwrpriv->lock);
 }
 
 static void rtw_dm_ra_mask_hdl(struct adapter *padapter, struct sta_info *psta)
@@ -1923,13 +1918,13 @@ void rtw_setassocsta_cmdrsp_callback(struct adapter *padapter,  struct cmd_obj *
 	psta->aid = passocsta_rsp->cam_id;
 	psta->mac_id = passocsta_rsp->cam_id;
 
-	spin_lock_bh(&pmlmepriv->lock);
-
-	if (check_fwstate(pmlmepriv, WIFI_MP_STATE) && check_fwstate(pmlmepriv, _FW_UNDER_LINKING))
-		_clr_fwstate_(pmlmepriv, _FW_UNDER_LINKING);
+	scoped_guard(spinlock_bh, &pmlmepriv->lock) {
+		if (check_fwstate(pmlmepriv, WIFI_MP_STATE) &&
+		    check_fwstate(pmlmepriv, _FW_UNDER_LINKING))
+			_clr_fwstate_(pmlmepriv, _FW_UNDER_LINKING);
 
-	set_fwstate(pmlmepriv, _FW_LINKED);
-	spin_unlock_bh(&pmlmepriv->lock);
+		set_fwstate(pmlmepriv, _FW_LINKED);
+	}
 
 exit:
 	rtw_free_cmd_obj(pcmd);
diff --git a/drivers/staging/rtl8723bs/core/rtw_ioctl_set.c b/drivers/staging/rtl8723bs/core/rtw_ioctl_set.c
index 2739d0e99..5a695e973 100644
--- a/drivers/staging/rtl8723bs/core/rtw_ioctl_set.c
+++ b/drivers/staging/rtl8723bs/core/rtw_ioctl_set.c
@@ -129,25 +129,28 @@ u8 rtw_do_join(struct adapter *padapter)
 
 u8 rtw_set_802_11_ssid(struct adapter *padapter, struct ndis_802_11_ssid *ssid)
 {
-	u8 status = _SUCCESS;
+	struct mlme_priv *pmlmepriv;
+	struct wlan_network *pnetwork;
 
-	struct mlme_priv *pmlmepriv = &padapter->mlmepriv;
-	struct wlan_network *pnetwork = &pmlmepriv->cur_network;
+	if (!padapter || !ssid || !rtw_validate_ssid(ssid))
+		return _FAIL;
+
+	if (!padapter->hw_init_completed)
+		return _FAIL;
+
+	pmlmepriv = &padapter->mlmepriv;
+	pnetwork = &pmlmepriv->cur_network;
 
 	netdev_dbg(padapter->pnetdev, "set ssid [%s] fw_state = 0x%08x\n",
 		   ssid->ssid, get_fwstate(pmlmepriv));
 
-	if (!padapter->hw_init_completed) {
-		status = _FAIL;
-		goto exit;
-	}
-
-	spin_lock_bh(&pmlmepriv->lock);
+	guard(spinlock_bh)(&pmlmepriv->lock);
 
 	if (check_fwstate(pmlmepriv, _FW_UNDER_SURVEY))
 		goto handle_tkip_countermeasure;
-	else if (check_fwstate(pmlmepriv, _FW_UNDER_LINKING))
-		goto release_mlme_lock;
+
+	if (check_fwstate(pmlmepriv, _FW_UNDER_LINKING))
+		return _SUCCESS;
 
 	if (check_fwstate(pmlmepriv, _FW_LINKED | WIFI_ADHOC_MASTER_STATE)) {
 		if ((pmlmepriv->assoc_ssid.ssid_length == ssid->ssid_length) &&
@@ -167,7 +170,11 @@ u8 rtw_set_802_11_ssid(struct adapter *padapter, struct ndis_802_11_ssid *ssid)
 						set_fwstate(pmlmepriv, WIFI_ADHOC_STATE);
 					}
 				} else {
-					goto release_mlme_lock;/* it means driver is in WIFI_ADHOC_MASTER_STATE, we needn't create bss again. */
+					return _SUCCESS;
+					/*
+					 * it means driver is in WIFI_ADHOC_MASTER_STATE,
+					 * we needn't create bss again.
+					 */
 				}
 			} else {
 				rtw_lps_ctrl_wk_cmd(padapter, LPS_CTRL_JOINBSS, 1);
@@ -188,30 +195,18 @@ u8 rtw_set_802_11_ssid(struct adapter *padapter, struct ndis_802_11_ssid *ssid)
 	}
 
 handle_tkip_countermeasure:
-	if (rtw_handle_tkip_countermeasure(padapter, __func__) == _FAIL) {
-		status = _FAIL;
-		goto release_mlme_lock;
-	}
-
-	if (!rtw_validate_ssid(ssid)) {
-		status = _FAIL;
-		goto release_mlme_lock;
-	}
+	if (rtw_handle_tkip_countermeasure(padapter, __func__) == _FAIL)
+		return _FAIL;
 
 	memcpy(&pmlmepriv->assoc_ssid, ssid, sizeof(struct ndis_802_11_ssid));
 	pmlmepriv->assoc_by_bssid = false;
 
-	if (check_fwstate(pmlmepriv, _FW_UNDER_SURVEY))
+	if (check_fwstate(pmlmepriv, _FW_UNDER_SURVEY)) {
 		pmlmepriv->to_join = true;
-	else
-		status = rtw_do_join(padapter);
-
-release_mlme_lock:
-	spin_unlock_bh(&pmlmepriv->lock);
-
-exit:
+		return _SUCCESS;
+	}
 
-	return status;
+	return rtw_do_join(padapter);
 }
 
 u8 rtw_set_802_11_connect(struct adapter *padapter, u8 *bssid, struct ndis_802_11_ssid *ssid)
@@ -219,7 +214,7 @@ u8 rtw_set_802_11_connect(struct adapter *padapter, u8 *bssid, struct ndis_802_1
 	u8 status = _SUCCESS;
 	bool bssid_valid = true;
 	bool ssid_valid = true;
-	struct mlme_priv *pmlmepriv = &padapter->mlmepriv;
+	struct mlme_priv *pmlmepriv;
 
 	if (!ssid || !rtw_validate_ssid(ssid))
 		ssid_valid = false;
@@ -227,30 +222,25 @@ u8 rtw_set_802_11_connect(struct adapter *padapter, u8 *bssid, struct ndis_802_1
 	if (!bssid || !rtw_validate_bssid(bssid))
 		bssid_valid = false;
 
-	if (!ssid_valid && !bssid_valid) {
-		status = _FAIL;
-		goto exit;
-	}
+	if (!ssid_valid && !bssid_valid)
+		return _FAIL;
 
-	if (!padapter->hw_init_completed) {
-		status = _FAIL;
-		goto exit;
-	}
+	if (!padapter || !padapter->hw_init_completed)
+		return _FAIL;
+
+	pmlmepriv = &padapter->mlmepriv;
 
-	spin_lock_bh(&pmlmepriv->lock);
+	guard(spinlock_bh)(&pmlmepriv->lock);
 
 	netdev_dbg(padapter->pnetdev, FUNC_ADPT_FMT "  fw_state = 0x%08x\n",
 		   FUNC_ADPT_ARG(padapter), get_fwstate(pmlmepriv));
 
-	if (check_fwstate(pmlmepriv, _FW_UNDER_SURVEY))
-		goto handle_tkip_countermeasure;
-	else if (check_fwstate(pmlmepriv, _FW_UNDER_LINKING))
-		goto release_mlme_lock;
+	if (check_fwstate(pmlmepriv, _FW_UNDER_LINKING))
+		return status;
 
-handle_tkip_countermeasure:
 	if (rtw_handle_tkip_countermeasure(padapter, __func__) == _FAIL) {
 		status = _FAIL;
-		goto release_mlme_lock;
+		return status;
 	}
 
 	if (ssid && ssid_valid)
@@ -270,10 +260,6 @@ u8 rtw_set_802_11_connect(struct adapter *padapter, u8 *bssid, struct ndis_802_1
 	else
 		status = rtw_do_join(padapter);
 
-release_mlme_lock:
-	spin_unlock_bh(&pmlmepriv->lock);
-
-exit:
 	return status;
 }
 
@@ -292,7 +278,7 @@ u8 rtw_set_802_11_infrastructure_mode(struct adapter *padapter,
 			stop_ap_mode(padapter);
 		}
 
-		spin_lock_bh(&pmlmepriv->lock);
+		guard(spinlock_bh)(&pmlmepriv->lock);
 
 		if (check_fwstate(pmlmepriv, _FW_LINKED) || (*pold_state == NL80211_IFTYPE_ADHOC))
 			rtw_disassoc_cmd(padapter, 0, true);
@@ -331,8 +317,6 @@ u8 rtw_set_802_11_infrastructure_mode(struct adapter *padapter,
 		}
 
 		/* SecClearAllKeys(adapter); */
-
-		spin_unlock_bh(&pmlmepriv->lock);
 	}
 	return true;
 }
@@ -341,7 +325,7 @@ u8 rtw_set_802_11_disassociate(struct adapter *padapter)
 {
 	struct mlme_priv *pmlmepriv = &padapter->mlmepriv;
 
-	spin_lock_bh(&pmlmepriv->lock);
+	guard(spinlock_bh)(&pmlmepriv->lock);
 
 	if (check_fwstate(pmlmepriv, _FW_LINKED)) {
 		rtw_disassoc_cmd(padapter, 0, true);
@@ -350,43 +334,30 @@ u8 rtw_set_802_11_disassociate(struct adapter *padapter)
 		rtw_pwr_wakeup(padapter);
 	}
 
-	spin_unlock_bh(&pmlmepriv->lock);
-
 	return true;
 }
 
 u8 rtw_set_802_11_bssid_list_scan(struct adapter *padapter, struct ndis_802_11_ssid *pssid, int ssid_max_num)
 {
-	struct mlme_priv *pmlmepriv = &padapter->mlmepriv;
-	u8 res = true;
+	struct mlme_priv *pmlmepriv;
 
-	if (!padapter) {
-		res = false;
-		goto exit;
-	}
-	if (!padapter->hw_init_completed) {
-		res = false;
-		goto exit;
-	}
+	if (!padapter || !padapter->hw_init_completed)
+		return false;
+
+	pmlmepriv = &padapter->mlmepriv;
 
 	if (check_fwstate(pmlmepriv, _FW_UNDER_SURVEY | _FW_UNDER_LINKING) ||
 	    pmlmepriv->link_detect_info.busy_traffic) {
 		/*  Scan or linking is in progress, do nothing. */
-		res = true;
-
-	} else {
-		if (rtw_is_scan_deny(padapter))
-			return _SUCCESS;
-
-		spin_lock_bh(&pmlmepriv->lock);
+		return true;
+	}
 
-		res = rtw_sitesurvey_cmd(padapter, pssid, ssid_max_num, NULL, 0);
+	if (rtw_is_scan_deny(padapter))
+		return _SUCCESS;
 
-		spin_unlock_bh(&pmlmepriv->lock);
-	}
-exit:
+	guard(spinlock_bh)(&pmlmepriv->lock);
 
-	return res;
+	return rtw_sitesurvey_cmd(padapter, pssid, ssid_max_num, NULL, 0);
 }
 
 u8 rtw_set_802_11_authentication_mode(struct adapter *padapter, enum ndis_802_11_authentication_mode authmode)
diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme.c b/drivers/staging/rtl8723bs/core/rtw_mlme.c
index d18768a51..52b155a35 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme.c
@@ -1086,7 +1086,7 @@ void rtw_reset_securitypriv(struct adapter *adapter)
 	u32 backupTKIPcountermeasure_time = 0;
 	struct mlme_ext_priv *pmlmeext = &adapter->mlmeextpriv;
 
-	spin_lock_bh(&adapter->security_key_mutex);
+	guard(spinlock_bh)(&adapter->security_key_mutex);
 
 	if (adapter->securitypriv.dot11_auth_algrthm == dot11_auth_algrthm_8021x) {
 		/* 802.1x */
@@ -1133,7 +1133,6 @@ void rtw_reset_securitypriv(struct adapter *adapter)
 		psec_priv->ndisencryptstatus = Ndis802_11WEPDisabled;
 		/*  */
 	}
-	spin_unlock_bh(&adapter->security_key_mutex);
 }
 
 /* Notes: the function could be > passive_level (the same context as Rx tasklet) */
diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
index e965133d9..7e499b17d 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
@@ -2015,7 +2015,7 @@ s32 dump_mgntframe_and_wait_ack(struct adapter *padapter, struct xmit_frame *pmg
 		return -1;
 	}
 
-	if (mutex_lock_interruptible(&pxmitpriv->ack_tx_mutex) == 0) {
+	scoped_cond_guard(mutex_intr, (void)0, &pxmitpriv->ack_tx_mutex) {
 		pxmitpriv->ack_tx = true;
 		pxmitpriv->seq_no = seq_no++;
 		pmgntframe->ack_report = 1;
@@ -2023,7 +2023,6 @@ s32 dump_mgntframe_and_wait_ack(struct adapter *padapter, struct xmit_frame *pmg
 			ret = rtw_ack_tx_wait(pxmitpriv, timeout_ms);
 
 		pxmitpriv->ack_tx = false;
-		mutex_unlock(&pxmitpriv->ack_tx_mutex);
 	}
 
 	return ret;
diff --git a/drivers/staging/rtl8723bs/core/rtw_pwrctrl.c b/drivers/staging/rtl8723bs/core/rtw_pwrctrl.c
index 448611ad8..547fa05ef 100644
--- a/drivers/staging/rtl8723bs/core/rtw_pwrctrl.c
+++ b/drivers/staging/rtl8723bs/core/rtw_pwrctrl.c
@@ -37,9 +37,8 @@ void ips_enter(struct adapter *padapter)
 
 	hal_btcoex_IpsNotify(padapter, pwrpriv->ips_mode_req);
 
-	mutex_lock(&pwrpriv->lock);
+	guard(mutex)(&pwrpriv->lock);
 	_ips_enter(padapter);
-	mutex_unlock(&pwrpriv->lock);
 }
 
 int _ips_leave(struct adapter *padapter)
@@ -69,9 +68,9 @@ int ips_leave(struct adapter *padapter)
 	struct pwrctrl_priv *pwrpriv = adapter_to_pwrctl(padapter);
 	int ret;
 
-	mutex_lock(&pwrpriv->lock);
-	ret = _ips_leave(padapter);
-	mutex_unlock(&pwrpriv->lock);
+	scoped_guard(mutex, &pwrpriv->lock) {
+		ret = _ips_leave(padapter);
+	}
 
 	if (ret == _SUCCESS)
 		hal_btcoex_IpsNotify(padapter, IPS_NONE);
@@ -138,9 +137,10 @@ void rtw_ps_processor(struct adapter *padapter)
 	struct pwrctrl_priv *pwrpriv = adapter_to_pwrctl(padapter);
 	u32 ps_deny = 0;
 
-	mutex_lock(&adapter_to_pwrctl(padapter)->lock);
-	ps_deny = rtw_ps_deny_get(padapter);
-	mutex_unlock(&adapter_to_pwrctl(padapter)->lock);
+	scoped_guard(mutex, &adapter_to_pwrctl(padapter)->lock) {
+		ps_deny = rtw_ps_deny_get(padapter);
+	}
+
 	if (ps_deny != 0)
 		goto exit;
 
@@ -337,7 +337,7 @@ void rtw_set_ps_mode(struct adapter *padapter, u8 ps_mode,
 		if (ps_mode == PS_MODE_ACTIVE)
 			return;
 
-	mutex_lock(&pwrpriv->lock);
+	guard(mutex)(&pwrpriv->lock);
 
 	/* if (pwrpriv->pwr_mode == PS_MODE_ACTIVE) */
 	if (ps_mode == PS_MODE_ACTIVE) {
@@ -383,8 +383,6 @@ void rtw_set_ps_mode(struct adapter *padapter, u8 ps_mode,
 			rtw_set_rpwm(padapter, pslv);
 		}
 	}
-
-	mutex_unlock(&pwrpriv->lock);
 }
 
 /*
@@ -488,11 +486,9 @@ void LeaveAllPowerSaveModeDirect(struct adapter *Adapter)
 		if (pwrpriv->pwr_mode == PS_MODE_ACTIVE)
 			return;
 
-		mutex_lock(&pwrpriv->lock);
-
-		rtw_set_rpwm(Adapter, PS_STATE_S4);
-
-		mutex_unlock(&pwrpriv->lock);
+		scoped_guard(mutex, &pwrpriv->lock) {
+			rtw_set_rpwm(Adapter, PS_STATE_S4);
+		}
 
 		rtw_lps_ctrl_wk_cmd(pri_padapter, LPS_CTRL_LEAVE, 0);
 	} else {
@@ -546,14 +542,12 @@ void LPS_Leave_check(struct adapter *padapter)
 	cond_resched();
 
 	while (1) {
-		mutex_lock(&pwrpriv->lock);
-
-		if (padapter->bSurpriseRemoved ||
-		    !(padapter->hw_init_completed) ||
-		    (pwrpriv->pwr_mode == PS_MODE_ACTIVE))
-			bReady = true;
-
-		mutex_unlock(&pwrpriv->lock);
+		scoped_guard(mutex, &pwrpriv->lock) {
+			if (padapter->bSurpriseRemoved ||
+			    !(padapter->hw_init_completed) ||
+			    (pwrpriv->pwr_mode == PS_MODE_ACTIVE))
+				bReady = true;
+		}
 
 		if (bReady)
 			break;
@@ -578,10 +572,10 @@ void cpwm_int_hdl(struct adapter *padapter, struct reportpwrstate_parm *preportp
 
 	pwrpriv = adapter_to_pwrctl(padapter);
 
-	mutex_lock(&pwrpriv->lock);
+	guard(mutex)(&pwrpriv->lock);
 
 	if (pwrpriv->rpwm < PS_STATE_S2)
-		goto exit;
+		return;
 
 	pwrpriv->cpwm = PS_STATE(preportpwrstate->state);
 	pwrpriv->cpwm_tog = preportpwrstate->state & PS_TOGGLE;
@@ -593,9 +587,6 @@ void cpwm_int_hdl(struct adapter *padapter, struct reportpwrstate_parm *preportp
 		if (pwrpriv->alives & XMIT_ALIVE)
 			complete(&padapter->xmitpriv.xmit_comp);
 	}
-
-exit:
-	mutex_unlock(&pwrpriv->lock);
 }
 
 static void cpwm_event_callback(struct work_struct *work)
@@ -619,11 +610,10 @@ static void rpwmtimeout_workitem_callback(struct work_struct *work)
 	dvobj = pwrctl_to_dvobj(pwrpriv);
 	padapter = dvobj->if1;
 
-	mutex_lock(&pwrpriv->lock);
-	if ((pwrpriv->rpwm == pwrpriv->cpwm) || (pwrpriv->cpwm >= PS_STATE_S2))
-		goto exit;
-
-	mutex_unlock(&pwrpriv->lock);
+	scoped_guard(mutex, &pwrpriv->lock) {
+		if ((pwrpriv->rpwm == pwrpriv->cpwm) || (pwrpriv->cpwm >= PS_STATE_S2))
+			return;
+	}
 
 	if (rtw_read8(padapter, 0x100) != 0xEA) {
 		struct reportpwrstate_parm report;
@@ -634,17 +624,14 @@ static void rpwmtimeout_workitem_callback(struct work_struct *work)
 		return;
 	}
 
-	mutex_lock(&pwrpriv->lock);
+	guard(mutex)(&pwrpriv->lock);
 
 	if ((pwrpriv->rpwm == pwrpriv->cpwm) || (pwrpriv->cpwm >= PS_STATE_S2))
-		goto exit;
+		return;
 
 	pwrpriv->brpwmtimeout = true;
 	rtw_set_rpwm(padapter, pwrpriv->rpwm);
 	pwrpriv->brpwmtimeout = false;
-
-exit:
-	mutex_unlock(&pwrpriv->lock);
 }
 
 /*
@@ -696,21 +683,19 @@ s32 rtw_register_task_alive(struct adapter *padapter, u32 task)
 	pwrctrl = adapter_to_pwrctl(padapter);
 	pslv = PS_STATE_S2;
 
-	mutex_lock(&pwrctrl->lock);
-
-	register_task_alive(pwrctrl, task);
+	scoped_guard(mutex, &pwrctrl->lock) {
+		register_task_alive(pwrctrl, task);
 
-	if (pwrctrl->fw_current_in_ps_mode) {
-		if (pwrctrl->cpwm < pslv) {
-			if (pwrctrl->cpwm < PS_STATE_S2)
-				res = _FAIL;
-			if (pwrctrl->rpwm < pslv)
-				rtw_set_rpwm(padapter, pslv);
+		if (pwrctrl->fw_current_in_ps_mode) {
+			if (pwrctrl->cpwm < pslv) {
+				if (pwrctrl->cpwm < PS_STATE_S2)
+					res = _FAIL;
+				if (pwrctrl->rpwm < pslv)
+					rtw_set_rpwm(padapter, pslv);
+			}
 		}
 	}
 
-	mutex_unlock(&pwrctrl->lock);
-
 	if (res == _FAIL)
 		if (pwrctrl->cpwm >= PS_STATE_S2)
 			res = _SUCCESS;
@@ -744,7 +729,7 @@ void rtw_unregister_task_alive(struct adapter *padapter, u32 task)
 			pslv = PS_STATE_S2;
 	}
 
-	mutex_lock(&pwrctrl->lock);
+	guard(mutex)(&pwrctrl->lock);
 
 	unregister_task_alive(pwrctrl, task);
 
@@ -754,8 +739,6 @@ void rtw_unregister_task_alive(struct adapter *padapter, u32 task)
 				rtw_set_rpwm(padapter, pslv);
 		}
 	}
-
-	mutex_unlock(&pwrctrl->lock);
 }
 
 /*
@@ -781,21 +764,19 @@ s32 rtw_register_tx_alive(struct adapter *padapter)
 	pwrctrl = adapter_to_pwrctl(padapter);
 	pslv = PS_STATE_S2;
 
-	mutex_lock(&pwrctrl->lock);
-
-	register_task_alive(pwrctrl, XMIT_ALIVE);
+	scoped_guard(mutex, &pwrctrl->lock) {
+		register_task_alive(pwrctrl, XMIT_ALIVE);
 
-	if (pwrctrl->fw_current_in_ps_mode) {
-		if (pwrctrl->cpwm < pslv) {
-			if (pwrctrl->cpwm < PS_STATE_S2)
-				res = _FAIL;
-			if (pwrctrl->rpwm < pslv)
-				rtw_set_rpwm(padapter, pslv);
+		if (pwrctrl->fw_current_in_ps_mode) {
+			if (pwrctrl->cpwm < pslv) {
+				if (pwrctrl->cpwm < PS_STATE_S2)
+					res = _FAIL;
+				if (pwrctrl->rpwm < pslv)
+					rtw_set_rpwm(padapter, pslv);
+			}
 		}
 	}
 
-	mutex_unlock(&pwrctrl->lock);
-
 	if (res == _FAIL)
 		if (pwrctrl->cpwm >= PS_STATE_S2)
 			res = _SUCCESS;
@@ -826,21 +807,19 @@ s32 rtw_register_cmd_alive(struct adapter *padapter)
 	pwrctrl = adapter_to_pwrctl(padapter);
 	pslv = PS_STATE_S2;
 
-	mutex_lock(&pwrctrl->lock);
+	scoped_guard(mutex, &pwrctrl->lock) {
+		register_task_alive(pwrctrl, CMD_ALIVE);
 
-	register_task_alive(pwrctrl, CMD_ALIVE);
-
-	if (pwrctrl->fw_current_in_ps_mode) {
-		if (pwrctrl->cpwm < pslv) {
-			if (pwrctrl->cpwm < PS_STATE_S2)
-				res = _FAIL;
-			if (pwrctrl->rpwm < pslv)
-				rtw_set_rpwm(padapter, pslv);
+		if (pwrctrl->fw_current_in_ps_mode) {
+			if (pwrctrl->cpwm < pslv) {
+				if (pwrctrl->cpwm < PS_STATE_S2)
+					res = _FAIL;
+				if (pwrctrl->rpwm < pslv)
+					rtw_set_rpwm(padapter, pslv);
+			}
 		}
 	}
 
-	mutex_unlock(&pwrctrl->lock);
-
 	if (res == _FAIL)
 		if (pwrctrl->cpwm >= PS_STATE_S2)
 			res = _SUCCESS;
@@ -871,7 +850,7 @@ void rtw_unregister_tx_alive(struct adapter *padapter)
 			pslv = PS_STATE_S2;
 	}
 
-	mutex_lock(&pwrctrl->lock);
+	guard(mutex)(&pwrctrl->lock);
 
 	unregister_task_alive(pwrctrl, XMIT_ALIVE);
 
@@ -880,8 +859,6 @@ void rtw_unregister_tx_alive(struct adapter *padapter)
 			if ((pslv >= PS_STATE_S2) || (pwrctrl->alives == 0))
 				rtw_set_rpwm(padapter, pslv);
 	}
-
-	mutex_unlock(&pwrctrl->lock);
 }
 
 /*
@@ -907,7 +884,7 @@ void rtw_unregister_cmd_alive(struct adapter *padapter)
 			pslv = PS_STATE_S2;
 	}
 
-	mutex_lock(&pwrctrl->lock);
+	guard(mutex)(&pwrctrl->lock);
 
 	unregister_task_alive(pwrctrl, CMD_ALIVE);
 
@@ -917,8 +894,6 @@ void rtw_unregister_cmd_alive(struct adapter *padapter)
 				rtw_set_rpwm(padapter, pslv);
 		}
 	}
-
-	mutex_unlock(&pwrctrl->lock);
 }
 
 void rtw_init_pwrctrl_priv(struct adapter *padapter)
@@ -1108,9 +1083,8 @@ void rtw_ps_deny(struct adapter *padapter, enum ps_deny_reason reason)
 
 	pwrpriv = adapter_to_pwrctl(padapter);
 
-	mutex_lock(&pwrpriv->lock);
+	guard(mutex)(&pwrpriv->lock);
 	pwrpriv->ps_deny |= BIT(reason);
-	mutex_unlock(&pwrpriv->lock);
 }
 
 /*
@@ -1123,9 +1097,8 @@ void rtw_ps_deny_cancel(struct adapter *padapter, enum ps_deny_reason reason)
 
 	pwrpriv = adapter_to_pwrctl(padapter);
 
-	mutex_lock(&pwrpriv->lock);
+	guard(mutex)(&pwrpriv->lock);
 	pwrpriv->ps_deny &= ~BIT(reason);
-	mutex_unlock(&pwrpriv->lock);
 }
 
 /*
diff --git a/drivers/staging/rtl8723bs/core/rtw_wlan_util.c b/drivers/staging/rtl8723bs/core/rtw_wlan_util.c
index 8c1f46706..e14d4ffde 100644
--- a/drivers/staging/rtl8723bs/core/rtw_wlan_util.c
+++ b/drivers/staging/rtl8723bs/core/rtw_wlan_util.c
@@ -296,15 +296,12 @@ inline unsigned long rtw_get_on_cur_ch_time(struct adapter *adapter)
 
 void r8723bs_select_channel(struct adapter *padapter, unsigned char channel)
 {
-	if (mutex_lock_interruptible(&(adapter_to_dvobj(padapter)->setch_mutex)))
-		return;
-
-	/* saved channel info */
-	rtw_set_oper_ch(padapter, channel);
+	scoped_cond_guard(mutex_intr, return, &(adapter_to_dvobj(padapter)->setch_mutex)) {
+		/* saved channel info */
+		rtw_set_oper_ch(padapter, channel);
 
-	rtw_hal_set_chan(padapter, channel);
-
-	mutex_unlock(&(adapter_to_dvobj(padapter)->setch_mutex));
+		rtw_hal_set_chan(padapter, channel);
+	}
 }
 
 void set_channel_bwmode(struct adapter *padapter, unsigned char channel, unsigned char channel_offset, unsigned short bwmode)
@@ -314,17 +311,14 @@ void set_channel_bwmode(struct adapter *padapter, unsigned char channel, unsigne
 	center_ch = rtw_get_center_ch(channel, bwmode, channel_offset);
 
 	/* set Channel */
-	if (mutex_lock_interruptible(&(adapter_to_dvobj(padapter)->setch_mutex)))
-		return;
-
-	/* saved channel/bw info */
-	rtw_set_oper_ch(padapter, channel);
-	rtw_set_oper_bw(padapter, bwmode);
-	rtw_set_oper_choffset(padapter, channel_offset);
+	scoped_cond_guard(mutex_intr, return, &(adapter_to_dvobj(padapter)->setch_mutex)) {
+		/* saved channel/bw info */
+		rtw_set_oper_ch(padapter, channel);
+		rtw_set_oper_bw(padapter, bwmode);
+		rtw_set_oper_choffset(padapter, channel_offset);
 
-	rtw_hal_set_chnl_bw(padapter, center_ch, bwmode, channel_offset, chnl_offset80); /*  set center channel */
-
-	mutex_unlock(&(adapter_to_dvobj(padapter)->setch_mutex));
+		rtw_hal_set_chnl_bw(padapter, center_ch, bwmode, channel_offset, chnl_offset80); /*  set center channel */
+	}
 }
 
 inline u8 *get_my_bssid(struct wlan_bssid_ex *pnetwork)
-- 
2.55.0

