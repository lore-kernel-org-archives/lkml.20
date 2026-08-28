Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FF602F7F14
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 10:17:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787912240; cv=none; b=Ix1b5eAH4wLVoNHGJCDbH/WMTIiitnADJs+XZYpd9Qq8nd7kpoG3dct3Hx9H5j2QQ3dXjJBqRX2LU/dD23Z2fldpXHC77cGQ38rGccsw3UeJjOUroI9Nn6r2uI0L5e9l3ynHZJ6FEyM4Rp3EV1oEIpXvXr9zFwQ+mfqgtcTychI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787912240; c=relaxed/simple;
	bh=B2hEwH0k7Tevg418yQKgYU6xsUkkeh/gDa3QJm854v0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lekNFHDK7Wqw5NckTXFFc4DjTp/QgSiZnXB+tW1o0xNndJXPyFFkBq+qxDnDKFbvuI5oFcIsCfufu7yU6RbPnimdfT7xJVXDMlx3aJaaQ/5aoD2UNZefLymbmkfXveFvzwUxepCVeL6J1npb27uwkHSGfRb8dKNfkRCoyEWXwY8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TDr0RtNM; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TDr0RtNM"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-482ddbc11aaso552570f8f.3
        for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 03:17:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787912236; x=1788517036; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pKaYp5iUhSWxgUOcEkO+er0ninywHdvu/2CcoKSMhR4=;
        b=TDr0RtNMFZCba3INoEyCxA/tYsOL3JwGPqGQ2ZEvLUDbOUel/cHQn57avcd+8+f9Hi
         3gymULQ88nIheeBH7AWuDfwSE+KD0qFB2dNkrNEaZh8IpFP7ydiUCGjPflCU2xr3lHnz
         jzsEUJtpu89c787GKqRibM5qWWFM+HvWUWMOjWlsFxK7Z19itPoiWbhtS/VBQM73CByG
         diE2jtVneGl2Zdz8/q5EMuwNgTUKZfOn8Tr9K9d1tiArQqfSpKiwEso1h/htsTB21yWK
         VD6+nSX5xhTASal8wYrmeFfjTvQsPKfG3iHEZ/FLp34Z68Wzt7vZbNFENyZ6hvmRa1cV
         Jvfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787912236; x=1788517036;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=pKaYp5iUhSWxgUOcEkO+er0ninywHdvu/2CcoKSMhR4=;
        b=VVo2AMGOdh3o24WoY1NUjxcwY8dvgYaXC4kKOjUMMqkNmrZqtFq6tG/8aNwa78Bdz+
         lIAF9axbEZHiszji2ftdzcL5/ziAij4JcTGKi57RIcq1MFPoPDZBy27HO5X4Sx/nqhl1
         0XFuo+kmYheACLo91PCFqYe0sWtkFL6umQ67Ks712Pw4GH/j7F/LyRRiukkSDnmlKwPw
         I6fXrL5SVooxyQMRtM3ZVQ7fx6QcTmxilsWajmrEA9LOr3oHflIx9oNDFWKys3ORzcYo
         rEFswbhrrMBRn3rRDrUGpQoFv6CwJCWHLsuFWRcjZlW0iph+3q1569Npw1OaNwzFSE13
         EokA==
X-Gm-Message-State: AFuF++mOGAyUxe6xVrwGqWbdviZ6dPojiDLo7s1BRWjdijuru0HZYgAs
	W7eW5agXLV3L2IP1h+qn3OZinEGKJTIvkyhHRntU5Lr+5MM/4Itbhknw
X-Gm-Gg: AR+sD10n516MvkUuYX3g7vY+jn5zhjrcQbY2SNDLLrBzHgS3dCi/c4m4W9GaNB32vP8
	CWHywj/HsDBeiY1UsK5azLrpFP9C543ocQW9TLWWtHiWWO9Kyk/ZjXep50b+bstdp8dUZxTb5/Q
	2eabv3m0IH4M95gxR9qvvOrFDR5k0N7gf4cVy1anXddml+Y/HAKzkxQ0NfPByqcSAcAqFWr7IW8
	Nn1L2XTJmifbYIS9tUGeRlpPjI1pIPwo/K+JtXTc70TTTdP1lNwlL8VA+K6OqKWz0fqRc7o7E2m
	dakAh6yrmOvOD73chxan874aVbjuKTpketT51y3blhX3PrxMs1Gim/Ec88V7c5HHFaCNkU8RsI1
	FhecfkpyLGVm5PugeI8Y9cMzhTs26oDKHWg9Zfl2zxim2eQ1mZbSgBAu2818iPwe9aQW86u7Heq
	GtsWINcFlvaFmFtB6jP7MBdqkkufF1U8+1CUiz8bRHKXRaQbWd2NeS3Q+bYBJfy/4=
X-Received: by 2002:a05:600c:530f:b0:497:ff73:68d5 with SMTP id 5b1f17b1804b1-49b91bd1552mr82281115e9.0.1787912234983;
        Fri, 28 Aug 2026 03:17:14 -0700 (PDT)
Received: from xerxes ([2001:8a0:ee6f:5800:65bf:d008:6bb6:cf89])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482fbac4f9esm2569246f8f.11.2026.08.28.03.17.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Aug 2026 03:17:14 -0700 (PDT)
From: Romeu Gomes <asm.artisan256@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Romeu Gomes <asm.artisan256@gmail.com>
Subject: [PATCH v2] staging: rtl8723bs: remove unnecessary parentheses in ioctl_cfg80211.c
Date: Fri, 28 Aug 2026 11:17:01 +0100
Message-ID: <20260828101701.18750-1-asm.artisan256@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <2026082812-award-service-889d@gregkh>
References: <2026082812-award-service-889d@gregkh>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove unnecessary parentheses around the right-hand side of
assignments and around function arguments. This clears up all
"Unnecessary parentheses" warnings reported by checkpatch.pl.

Signed-off-by: Romeu Gomes <asm.artisan256@gmail.com>
---
Changes in v2:
- Corrected name in Signed-off-by tag.

 .../staging/rtl8723bs/os_dep/ioctl_cfg80211.c | 70 +++++++++----------
 1 file changed, 35 insertions(+), 35 deletions(-)

diff --git a/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c b/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
index 3468d4114f60..a40d8886e233 100644
--- a/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
+++ b/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
@@ -216,7 +216,7 @@ struct cfg80211_bss *rtw_cfg80211_inform_bss(struct adapter *padapter, struct wl

 	struct wireless_dev *wdev = padapter->rtw_wdev;
 	struct wiphy *wiphy = wdev->wiphy;
-	struct mlme_priv *pmlmepriv = &(padapter->mlmepriv);
+	struct mlme_priv *pmlmepriv = &padapter->mlmepriv;

 	bssinf_len = pnetwork->network.ie_length + sizeof(struct ieee80211_hdr_3addr);
 	if (bssinf_len > MAX_BSSINFO_LEN)
@@ -281,7 +281,7 @@ struct cfg80211_bss *rtw_cfg80211_inform_bss(struct adapter *padapter, struct wl
 	pbuf = buf;

 	pwlanhdr = (struct ieee80211_hdr *)pbuf;
-	fctrl = &(pwlanhdr->frame_control);
+	fctrl = &pwlanhdr->frame_control;
 	*(fctrl) = 0;

 	SetSeqNum(pwlanhdr, 0/*pmlmeext->mgnt_seq*/);
@@ -291,7 +291,7 @@ struct cfg80211_bss *rtw_cfg80211_inform_bss(struct adapter *padapter, struct wl
 		eth_broadcast_addr(pwlanhdr->addr1);
 		SetFrameSubType(pbuf, WIFI_BEACON);
 	} else {
-		memcpy(pwlanhdr->addr1, myid(&(padapter->eeprompriv)), ETH_ALEN);
+		memcpy(pwlanhdr->addr1, myid(&padapter->eeprompriv), ETH_ALEN);
 		SetFrameSubType(pbuf, WIFI_PROBERSP);
 	}

@@ -328,7 +328,7 @@ struct cfg80211_bss *rtw_cfg80211_inform_bss(struct adapter *padapter, struct wl
  */
 int rtw_cfg80211_check_bss(struct adapter *padapter)
 {
-	struct wlan_bssid_ex  *pnetwork = &(padapter->mlmeextpriv.mlmext_info.network);
+	struct wlan_bssid_ex  *pnetwork = &padapter->mlmeextpriv.mlmext_info.network;
 	struct cfg80211_bss *bss = NULL;
 	struct ieee80211_channel *notify_channel = NULL;
 	u32 freq;
@@ -352,7 +352,7 @@ int rtw_cfg80211_check_bss(struct adapter *padapter)
 void rtw_cfg80211_ibss_indicate_connect(struct adapter *padapter)
 {
 	struct mlme_priv *pmlmepriv = &padapter->mlmepriv;
-	struct wlan_network  *cur_network = &(pmlmepriv->cur_network);
+	struct wlan_network  *cur_network = &pmlmepriv->cur_network;
 	struct wireless_dev *pwdev = padapter->rtw_wdev;
 	struct wiphy *wiphy = pwdev->wiphy;
 	int freq = (int)cur_network->network.configuration.ds_config;
@@ -362,7 +362,7 @@ void rtw_cfg80211_ibss_indicate_connect(struct adapter *padapter)
 		return;

 	if (!rtw_cfg80211_check_bss(padapter)) {
-		struct wlan_bssid_ex  *pnetwork = &(padapter->mlmeextpriv.mlmext_info.network);
+		struct wlan_bssid_ex  *pnetwork = &padapter->mlmeextpriv.mlmext_info.network;
 		struct wlan_network *scanned = pmlmepriv->cur_network_scanned;

 		if (check_fwstate(pmlmepriv, WIFI_ADHOC_MASTER_STATE)) {
@@ -394,7 +394,7 @@ void rtw_cfg80211_ibss_indicate_connect(struct adapter *padapter)
 void rtw_cfg80211_indicate_connect(struct adapter *padapter)
 {
 	struct mlme_priv *pmlmepriv = &padapter->mlmepriv;
-	struct wlan_network  *cur_network = &(pmlmepriv->cur_network);
+	struct wlan_network  *cur_network = &pmlmepriv->cur_network;
 	struct wireless_dev *pwdev = padapter->rtw_wdev;

 	if (pwdev->iftype != NL80211_IFTYPE_STATION
@@ -407,7 +407,7 @@ void rtw_cfg80211_indicate_connect(struct adapter *padapter)
 		return;

 	{
-		struct wlan_bssid_ex  *pnetwork = &(padapter->mlmeextpriv.mlmext_info.network);
+		struct wlan_bssid_ex  *pnetwork = &padapter->mlmeextpriv.mlmext_info.network;
 		struct wlan_network *scanned = pmlmepriv->cur_network_scanned;

 		if (!scanned) {
@@ -493,7 +493,7 @@ static int rtw_cfg80211_ap_set_encryption(struct net_device *dev, struct ieee_pa
 	struct sta_info *psta = NULL, *pbcmc_sta = NULL;
 	struct adapter *padapter = rtw_netdev_priv(dev);
 	struct mlme_priv *pmlmepriv = &padapter->mlmepriv;
-	struct security_priv *psecuritypriv =  &(padapter->securitypriv);
+	struct security_priv *psecuritypriv =  &padapter->securitypriv;
 	struct sta_priv *pstapriv = &padapter->stapriv;
 	char *grpkey = padapter->securitypriv.dot118021XGrpKey[param->u.crypt.idx].skey;
 	char *txkey = padapter->securitypriv.dot118021XGrptxmickey[param->u.crypt.idx].skey;
@@ -552,7 +552,7 @@ static int rtw_cfg80211_ap_set_encryption(struct net_device *dev, struct ieee_pa
 			psecuritypriv->dot11PrivacyKeyIndex = wep_key_idx;
 		}

-		memcpy(&(psecuritypriv->dot11DefKey[wep_key_idx].skey[0]), param->u.crypt.key, wep_key_len);
+		memcpy(&psecuritypriv->dot11DefKey[wep_key_idx].skey[0], param->u.crypt.key, wep_key_len);

 		psecuritypriv->dot11DefKeylen[wep_key_idx] = wep_key_len;

@@ -578,8 +578,8 @@ static int rtw_cfg80211_ap_set_encryption(struct net_device *dev, struct ieee_pa
 				memcpy(grpkey, param->u.crypt.key, (param->u.crypt.key_len > 16 ? 16 : param->u.crypt.key_len));

 				/* set mic key */
-				memcpy(txkey, &(param->u.crypt.key[16]), 8);
-				memcpy(rxkey, &(param->u.crypt.key[24]), 8);
+				memcpy(txkey, &param->u.crypt.key[16], 8);
+				memcpy(rxkey, &param->u.crypt.key[24], 8);

 				psecuritypriv->busetkipkey = true;

@@ -622,8 +622,8 @@ static int rtw_cfg80211_ap_set_encryption(struct net_device *dev, struct ieee_pa
 					psta->dot118021XPrivacy = _TKIP_;

 					/* set mic key */
-					memcpy(psta->dot11tkiptxmickey.skey, &(param->u.crypt.key[16]), 8);
-					memcpy(psta->dot11tkiprxmickey.skey, &(param->u.crypt.key[24]), 8);
+					memcpy(psta->dot11tkiptxmickey.skey, &param->u.crypt.key[16], 8);
+					memcpy(psta->dot11tkiprxmickey.skey, &param->u.crypt.key[24], 8);

 					psecuritypriv->busetkipkey = true;

@@ -652,8 +652,8 @@ static int rtw_cfg80211_ap_set_encryption(struct net_device *dev, struct ieee_pa
 					memcpy(grpkey, param->u.crypt.key, (param->u.crypt.key_len > 16 ? 16 : param->u.crypt.key_len));

 					/* set mic key */
-					memcpy(txkey, &(param->u.crypt.key[16]), 8);
-					memcpy(rxkey, &(param->u.crypt.key[24]), 8);
+					memcpy(txkey, &param->u.crypt.key[16], 8);
+					memcpy(rxkey, &param->u.crypt.key[24], 8);

 					psecuritypriv->busetkipkey = true;

@@ -748,7 +748,7 @@ static int rtw_cfg80211_set_encryption(struct net_device *dev, struct ieee_param
 			psecuritypriv->dot11PrivacyKeyIndex = wep_key_idx;
 		}

-		memcpy(&(psecuritypriv->dot11DefKey[wep_key_idx].skey[0]), param->u.crypt.key, wep_key_len);
+		memcpy(&psecuritypriv->dot11DefKey[wep_key_idx].skey[0], param->u.crypt.key, wep_key_len);

 		psecuritypriv->dot11DefKeylen[wep_key_idx] = wep_key_len;

@@ -778,8 +778,8 @@ static int rtw_cfg80211_set_encryption(struct net_device *dev, struct ieee_param
 					memcpy(psta->dot118021x_UncstKey.skey, param->u.crypt.key, (param->u.crypt.key_len > 16 ? 16 : param->u.crypt.key_len));

 					if (strcmp(param->u.crypt.alg, "TKIP") == 0) { /* set mic key */
-						memcpy(psta->dot11tkiptxmickey.skey, &(param->u.crypt.key[16]), 8);
-						memcpy(psta->dot11tkiprxmickey.skey, &(param->u.crypt.key[24]), 8);
+						memcpy(psta->dot11tkiptxmickey.skey, &param->u.crypt.key[16], 8);
+						memcpy(psta->dot11tkiprxmickey.skey, &param->u.crypt.key[24], 8);

 						padapter->securitypriv.busetkipkey = false;
 						/* _set_timer(&padapter->securitypriv.tkip_timer, 50); */
@@ -789,8 +789,8 @@ static int rtw_cfg80211_set_encryption(struct net_device *dev, struct ieee_param
 				} else { /* group key */
 					if (strcmp(param->u.crypt.alg, "TKIP") == 0 || strcmp(param->u.crypt.alg, "CCMP") == 0) {
 						memcpy(padapter->securitypriv.dot118021XGrpKey[param->u.crypt.idx].skey, param->u.crypt.key, (param->u.crypt.key_len > 16 ? 16 : param->u.crypt.key_len));
-						memcpy(padapter->securitypriv.dot118021XGrptxmickey[param->u.crypt.idx].skey, &(param->u.crypt.key[16]), 8);
-						memcpy(padapter->securitypriv.dot118021XGrprxmickey[param->u.crypt.idx].skey, &(param->u.crypt.key[24]), 8);
+						memcpy(padapter->securitypriv.dot118021XGrptxmickey[param->u.crypt.idx].skey, &param->u.crypt.key[16], 8);
+						memcpy(padapter->securitypriv.dot118021XGrprxmickey[param->u.crypt.idx].skey, &param->u.crypt.key[24], 8);
 						padapter->securitypriv.binstallGrpkey = true;

 						padapter->securitypriv.dot118021XGrpKeyid = param->u.crypt.idx;
@@ -981,7 +981,7 @@ static int cfg80211_rtw_get_station(struct wiphy *wiphy,
 	/* for infra./P2PClient mode */
 	if (check_fwstate(pmlmepriv, WIFI_STATION_STATE)
 		&& check_fwstate(pmlmepriv, _FW_LINKED)) {
-		struct wlan_network  *cur_network = &(pmlmepriv->cur_network);
+		struct wlan_network  *cur_network = &pmlmepriv->cur_network;

 		if (memcmp((u8 *)mac, cur_network->network.mac_address, ETH_ALEN)) {
 			ret = -ENOENT;
@@ -1022,7 +1022,7 @@ static int cfg80211_rtw_change_iface(struct wiphy *wiphy,
 	enum nl80211_iftype old_type;
 	struct adapter *padapter = rtw_netdev_priv(ndev);
 	struct wireless_dev *rtw_wdev = padapter->rtw_wdev;
-	struct mlme_ext_priv *pmlmeext = &(padapter->mlmeextpriv);
+	struct mlme_ext_priv *pmlmeext = &padapter->mlmeextpriv;
 	int ret = 0;

 	if (adapter_to_dvobj(padapter)->processing_dev_remove) {
@@ -1111,11 +1111,11 @@ void rtw_cfg80211_unlink_bss(struct adapter *padapter, struct wlan_network *pnet
 void rtw_cfg80211_surveydone_event_callback(struct adapter *padapter)
 {
 	struct list_head					*plist, *phead;
-	struct	mlme_priv *pmlmepriv = &(padapter->mlmepriv);
-	struct __queue *queue	= &(pmlmepriv->scanned_queue);
+	struct	mlme_priv *pmlmepriv = &padapter->mlmepriv;
+	struct __queue *queue	= &pmlmepriv->scanned_queue;
 	struct	wlan_network	*pnetwork = NULL;

-	spin_lock_bh(&(pmlmepriv->scanned_queue.lock));
+	spin_lock_bh(&pmlmepriv->scanned_queue.lock);

 	phead = get_list_head(queue);
 	list_for_each(plist, phead)
@@ -1124,13 +1124,13 @@ void rtw_cfg80211_surveydone_event_callback(struct adapter *padapter)

 		/* report network only if the current channel set contains the channel to which this network belongs */
 		if (rtw_ch_set_search_ch(padapter->mlmeextpriv.channel_set, pnetwork->network.configuration.ds_config) >= 0
-			&& true == rtw_validate_ssid(&(pnetwork->network.ssid))) {
+			&& true == rtw_validate_ssid(&pnetwork->network.ssid)) {
 			/* ev =translate_scan(padapter, a, pnetwork, ev, stop); */
 			rtw_cfg80211_inform_bss(padapter, pnetwork);
 		}
 	}

-	spin_unlock_bh(&(pmlmepriv->scanned_queue.lock));
+	spin_unlock_bh(&pmlmepriv->scanned_queue.lock);
 }

 static int rtw_cfg80211_set_probe_req_wpsp2pie(struct adapter *padapter, char *buf, int len)
@@ -1138,7 +1138,7 @@ static int rtw_cfg80211_set_probe_req_wpsp2pie(struct adapter *padapter, char *b
 	int ret = 0;
 	unsigned int wps_ielen = 0;
 	u8 *wps_ie;
-	struct mlme_priv *pmlmepriv = &(padapter->mlmepriv);
+	struct mlme_priv *pmlmepriv = &padapter->mlmepriv;

 	if (len > 0) {
 		wps_ie = rtw_get_wps_ie(buf, len, NULL, &wps_ielen);
@@ -2058,8 +2058,8 @@ static netdev_tx_t rtw_cfg80211_monitor_if_xmit_entry(struct sk_buff *skb, struc
 		/* u8 category, action, OUI_Subtype, dialogToken = 0; */
 		/* unsigned char *frame_body; */
 		struct ieee80211_hdr *pwlanhdr;
-		struct xmit_priv *pxmitpriv = &(padapter->xmitpriv);
-		struct mlme_ext_priv *pmlmeext = &(padapter->mlmeextpriv);
+		struct xmit_priv *pxmitpriv = &padapter->xmitpriv;
+		struct mlme_ext_priv *pmlmeext = &padapter->mlmeextpriv;
 		u8 *buf = skb->data;
 		u32 len = skb->len;
 		u8 category, action;
@@ -2244,7 +2244,7 @@ static int rtw_add_beacon(struct adapter *adapter, const u8 *head, size_t head_l
 	int ret = 0;
 	u8 *pbuf = NULL;
 	unsigned int len, wps_ielen = 0;
-	struct mlme_priv *pmlmepriv = &(adapter->mlmepriv);
+	struct mlme_priv *pmlmepriv = &adapter->mlmepriv;

 	if (!check_fwstate(pmlmepriv, WIFI_AP_STATE))
 		return -EINVAL;
@@ -2336,7 +2336,7 @@ static int cfg80211_rtw_del_station(struct wiphy *wiphy,
 	u8 updated = false;
 	struct sta_info *psta = NULL;
 	struct adapter *padapter = rtw_netdev_priv(wdev->netdev);
-	struct mlme_priv *pmlmepriv = &(padapter->mlmepriv);
+	struct mlme_priv *pmlmepriv = &padapter->mlmepriv;
 	struct sta_priv *pstapriv = &padapter->stapriv;
 	const u8 *mac = params->mac;

@@ -2461,8 +2461,8 @@ static int _cfg80211_rtw_mgmt_tx(struct adapter *padapter, u8 tx_ch, const u8 *b
 	int ret = _FAIL;
 	bool __maybe_unused ack = true;
 	struct ieee80211_hdr *pwlanhdr;
-	struct xmit_priv *pxmitpriv = &(padapter->xmitpriv);
-	struct mlme_ext_priv *pmlmeext = &(padapter->mlmeextpriv);
+	struct xmit_priv *pxmitpriv = &padapter->xmitpriv;
+	struct mlme_ext_priv *pmlmeext = &padapter->mlmeextpriv;

 	rtw_set_scan_deny(padapter, 1000);

--
2.55.0

