Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1C3A43CED9
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 16:05:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788278752; cv=none; b=S8okCNDanQC2h6HkQbON7+3Q3sp5HqBoU+fuiLHm7eo6gCnPySdxjvL97jcVWAslClzgKGDe7Pv3vDQfzCPS4sJXc/fie48blxdGKFlHubqVsfQGAiB6iDBXk52egUgNu+ChGl+3/Et64/aNwSecTHDYmK59iRa3fc9Scg8Pdgk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788278752; c=relaxed/simple;
	bh=uJaCRgBn4z7gBxVxn4dZcUvNRpe4vmTUr+iPkZlJkwU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=OIT+v8f6z/0Q3WCTJQ7+PCEn2A3gMTA00ycm9Ev/ciwwV8xHaLZ60bGZ3Xu/HBh7FYMrX9dA11gvqK/sWPW/mAPEz4EZEcXzcXgjiVBaYyYJHdy+gGJR7wBtUixBpYh2Tfg0BZhOnpAqojY58TxIMIbOmzdh8Q1oP+8G44V/z44=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Owl2S8wv; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Owl2S8wv"
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-398a4dcf289so4667423a91.2
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 09:05:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788278750; x=1788883550; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=NUT5lhH2uNRu+YSSiKPcZvlG74viBFbTeKhvBkxrZHE=;
        b=Owl2S8wvAneZ6CaI2mdnmyN/+eW4kFkmPz2b0C7nuGTtUIcLuf7rYYrNZJEKdfSuUJ
         utLL69V0FWO80BtkOgRk8UC6cn6hsWRbaQP4Id1SYZxLy7PxQQnsOSOOJvKwgnycJyK2
         EG7VyXO+Isoh2GaapqO8iSVQHCdoIVmLTk+oNexEuuG3UiDyt3i8x8mF6vDPtr53MWkZ
         hsaAUQ7lowVX/1jJ6WzPqDAwtsxZPWFOt8OXFO7Gm9ob2sAJXLGSJfLtI5uEGGyNTj/U
         QhQ+Ye3kEeOEs1fcM9z0RbEXcDULOdY5dYpYRd7bzwlqLRTvmFJ78NAvunkFyw3VHHhD
         K+eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788278750; x=1788883550;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NUT5lhH2uNRu+YSSiKPcZvlG74viBFbTeKhvBkxrZHE=;
        b=oOaxsxIjiQ7v2R8NnDKmQ1r9TEUovJ96hKKp9vqha6jH/J/SnyCzYDzDNMkNE4IsqY
         DRL/N/nt2p98empGXtf658HRfxj5jyYP+KxvhYoAkpWm4pbHFdtgjo2DuCT41dFuDFll
         O5X3RutQczAPVSDit2xv0rzi1kAc8nPKyYquxOxSE5SmXL7qw1QSc8sAlmq6EXGwWXc4
         64Bpo6+1q9PqHooQv7dFmOSQC7Q45xNC6vSewQsC/g+L3U5fQHxkh0OzzSDulrj2ujIe
         ahfsbq9R+MDd4xQRwMtyX+8h0pZsPCeKBIvKFHtjp7/E7+9MrOfmQJEoGQSSTaQ6dwwW
         HoMQ==
X-Forwarded-Encrypted: i=1; AKwUvBwMknBniv8Gjml77I14O6N8zsBvQzCEPZOj5ziLr8X4vxthgMZ11Y/csGuYICserMufnNq1JX3T+cxxvHM=@vger.kernel.org
X-Gm-Message-State: AFuF++lkYGIiporjvfpvQEC+WJJl6QRKdEYDGhQBUbw6BZnahVhtbL1s
	lxybwtJCK7Grr+nwMNqEGiBjhJNMQ8RM9IDE8qmFbgqxPedDlWti9IJz
X-Gm-Gg: AYBFou3ZjRcEvnefDwSe8MeiIL0GGGqwVmzr1x0AWDkE/90nWCSOF9QocYXM9yVubtQ
	UvMfYuge29EDCtityYXMze2o/jdq3J5ohU0SFiUpqic74uNoRmCLijRgTnH8ekzl2DudvC3D7qP
	zleKrH1Qoyp/r5EO8hz44a8XRNwSi0vWMG3D37VQ9QtXEBG49ZpYn8pNW9Y/V41yVo9pnYFiOm5
	yo03Q2Y6FjyEu6SDkSQbT0mo+0/so78XGj1x/8ybLEUu4b9z/k83pnIrIixs8iuAs3QoVo/jToO
	WPZ13xqUeoj1e97T2W+dFKBYAVyyWL9gSRCzZY37RbsA0VUPzxP9SlzfpzA8sxL/u4Zi7ag20iA
	Ba0pvlgI+DAscSk0l9pSKW4J6hlU1KRln3GRf+cxYKZ1dDfWb7YzPjGigKI4r+Uuo+5a72bxjW6
	FGD7RL1zqTct6Cevo5ELv4GKRe0F3eLNKYPZAN6ZIh9FwAMO8BmTH/5eLU/B6zkGFy9yJG81lZ
X-Received: by 2002:a17:90a:d887:b0:392:b509:b1a5 with SMTP id 98e67ed59e1d1-39907e0f87bmr14011846a91.14.1788278749611;
        Tue, 01 Sep 2026 09:05:49 -0700 (PDT)
Received: from arch.tailf5f2c5.ts.net ([2405:9800:b661:a3e7::b])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3990d7ba9d5sm7202014a91.13.2026.09.01.09.05.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 09:05:49 -0700 (PDT)
From: Pannawat Sripor <pannawat.sripor@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Pannawat Sripor <pannawat.sripor@gmail.com>
Subject: [PATCH] staging: rtl8723bs: fix line length and coding style in ieee80211
Date: Tue,  1 Sep 2026 23:05:30 +0700
Message-ID: <20260901160530.58974-1-pannawat.sripor@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Wrap the function call to match with the Linux kernel coding style,
and clear checkpatch.pl checks

Signed-off-by: Pannawat Sripor <pannawat.sripor@gmail.com>
---
 .../staging/rtl8723bs/core/rtw_ieee80211.c    | 220 +++++++++++-------
 1 file changed, 130 insertions(+), 90 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_ieee80211.c b/drivers/staging/rtl8723bs/core/rtw_ieee80211.c
index 66f476a46aad..bd55297feaea 100644
--- a/drivers/staging/rtl8723bs/core/rtw_ieee80211.c
+++ b/drivers/staging/rtl8723bs/core/rtw_ieee80211.c
@@ -36,21 +36,17 @@ u8 RSN_CIPHER_SUITE_WEP104[] = { 0x00, 0x0f, 0xac, 5 };
 /*  */
 
 static u8 WIFI_CCKRATES[] = {
-		(IEEE80211_CCK_RATE_1MB | IEEE80211_BASIC_RATE_MASK),
-		(IEEE80211_CCK_RATE_2MB | IEEE80211_BASIC_RATE_MASK),
-		(IEEE80211_CCK_RATE_5MB | IEEE80211_BASIC_RATE_MASK),
-		(IEEE80211_CCK_RATE_11MB | IEEE80211_BASIC_RATE_MASK)
+	(IEEE80211_CCK_RATE_1MB | IEEE80211_BASIC_RATE_MASK),
+	(IEEE80211_CCK_RATE_2MB | IEEE80211_BASIC_RATE_MASK),
+	(IEEE80211_CCK_RATE_5MB | IEEE80211_BASIC_RATE_MASK),
+	(IEEE80211_CCK_RATE_11MB | IEEE80211_BASIC_RATE_MASK)
 };
 
 static u8 WIFI_OFDMRATES[] = {
-		(IEEE80211_OFDM_RATE_6MB),
-		(IEEE80211_OFDM_RATE_9MB),
-		(IEEE80211_OFDM_RATE_12MB),
-		(IEEE80211_OFDM_RATE_18MB),
-		(IEEE80211_OFDM_RATE_24MB),
-		IEEE80211_OFDM_RATE_36MB,
-		IEEE80211_OFDM_RATE_48MB,
-		IEEE80211_OFDM_RATE_54MB
+	(IEEE80211_OFDM_RATE_6MB),  (IEEE80211_OFDM_RATE_9MB),
+	(IEEE80211_OFDM_RATE_12MB), (IEEE80211_OFDM_RATE_18MB),
+	(IEEE80211_OFDM_RATE_24MB), IEEE80211_OFDM_RATE_36MB,
+	IEEE80211_OFDM_RATE_48MB,   IEEE80211_OFDM_RATE_54MB
 };
 
 int rtw_get_bit_value_from_ieee_value(u8 val)
@@ -106,8 +102,8 @@ int rtw_check_network_type(unsigned char *rate, int channel)
 	return WIRELESS_11G;
 }
 
-u8 *rtw_set_fixed_ie(unsigned char *pbuf, unsigned int len, unsigned char *source,
-				unsigned int *frlen)
+u8 *rtw_set_fixed_ie(unsigned char *pbuf, unsigned int len,
+		     unsigned char *source, unsigned int *frlen)
 {
 	memcpy(pbuf, source, len);
 	*frlen = *frlen + len;
@@ -115,10 +111,7 @@ u8 *rtw_set_fixed_ie(unsigned char *pbuf, unsigned int len, unsigned char *sourc
 }
 
 /*  rtw_set_ie will update frame length */
-u8 *rtw_set_ie(u8 *pbuf,
-	       signed int index,
-	       uint len,
-	       u8 *source,
+u8 *rtw_set_ie(u8 *pbuf, signed int index, uint len, u8 *source,
 	       uint *frlen) /* frame length */
 {
 	*pbuf = (u8)index;
@@ -168,12 +161,15 @@ u8 *rtw_get_ie(u8 *pbuf, signed int index, signed int *len, signed int limit)
  * @eid: Element ID to match
  * @oui: OUI to match
  * @oui_len: OUI length
- * @ie: If not NULL and the specific IE is found, the IE will be copied to the buf starting from the specific IE
- * @ielen: If not NULL and the specific IE is found, will set to the length of the entire IE
+ * @ie: If not NULL and the specific IE is found,
+ *	the IE will be copied to the buf starting from the specific IE
+ * @ielen: If not NULL and the specific IE is found,
+ *	   will set to the length of the entire IE
  *
  * Returns: The address of the specific IE found, or NULL
  */
-u8 *rtw_get_ie_ex(u8 *in_ie, uint in_len, u8 eid, u8 *oui, u8 oui_len, u8 *ie, uint *ielen)
+u8 *rtw_get_ie_ex(u8 *in_ie, uint in_len, u8 eid, u8 *oui, u8 oui_len, u8 *ie,
+		  uint *ielen)
 {
 	uint cnt;
 	u8 *target_ie = NULL;
@@ -193,7 +189,8 @@ u8 *rtw_get_ie_ex(u8 *in_ie, uint in_len, u8 eid, u8 *oui, u8 oui_len, u8 *ie, u
 			break;
 
 		if (eid == in_ie[cnt] &&
-		    (!oui || (ie_len >= oui_len && !memcmp(&in_ie[cnt + 2], oui, oui_len)))) {
+		    (!oui || (ie_len >= oui_len &&
+			      !memcmp(&in_ie[cnt + 2], oui, oui_len)))) {
 			target_ie = &in_ie[cnt];
 
 			if (ie)
@@ -221,7 +218,8 @@ u8 *rtw_get_ie_ex(u8 *in_ie, uint in_len, u8 eid, u8 *oui, u8 oui_len, u8 *ie, u
  *
  * Returns: _SUCCESS: ies is updated, _FAIL: not updated
  */
-int rtw_ies_remove_ie(u8 *ies, uint *ies_len, uint offset, u8 eid, u8 *oui, u8 oui_len)
+int rtw_ies_remove_ie(u8 *ies, uint *ies_len, uint offset, u8 eid, u8 *oui,
+		      u8 oui_len)
 {
 	int ret = _FAIL;
 	u8 *target_ie;
@@ -236,7 +234,8 @@ int rtw_ies_remove_ie(u8 *ies, uint *ies_len, uint offset, u8 eid, u8 *oui, u8 o
 	search_len = *ies_len - offset;
 
 	while (1) {
-		target_ie = rtw_get_ie_ex(start, search_len, eid, oui, oui_len, NULL, &target_ielen);
+		target_ie = rtw_get_ie_ex(start, search_len, eid, oui, oui_len,
+					  NULL, &target_ielen);
 		if (target_ie && target_ielen) {
 			u8 *remain_ies = target_ie + target_ielen;
 			uint remain_len = search_len - (remain_ies - start);
@@ -265,7 +264,8 @@ void rtw_set_supported_rate(u8 *supported_rates, uint mode)
 		break;
 
 	case WIRELESS_11G:
-		memcpy(supported_rates, WIFI_OFDMRATES, IEEE80211_NUM_OFDM_RATESLEN);
+		memcpy(supported_rates, WIFI_OFDMRATES,
+		       IEEE80211_NUM_OFDM_RATESLEN);
 		break;
 
 	case WIRELESS_11BG:
@@ -273,7 +273,8 @@ void rtw_set_supported_rate(u8 *supported_rates, uint mode)
 	case WIRELESS_11_24N:
 	case WIRELESS_11BG_24N:
 		memcpy(supported_rates, WIFI_CCKRATES, IEEE80211_CCK_RATE_LEN);
-		memcpy(supported_rates + IEEE80211_CCK_RATE_LEN, WIFI_OFDMRATES, IEEE80211_NUM_OFDM_RATESLEN);
+		memcpy(supported_rates + IEEE80211_CCK_RATE_LEN, WIFI_OFDMRATES,
+		       IEEE80211_NUM_OFDM_RATESLEN);
 		break;
 	}
 }
@@ -291,7 +292,7 @@ uint rtw_get_rateset_len(u8 *rateset)
 int rtw_generate_ie(struct registry_priv *pregistrypriv)
 {
 	u8 wireless_mode;
-	int	sz = 0, rate_len;
+	int sz = 0, rate_len;
 	struct wlan_bssid_ex *pdev_network = &pregistrypriv->dev_network;
 	u8 *ie = pdev_network->ies;
 
@@ -300,7 +301,8 @@ int rtw_generate_ie(struct registry_priv *pregistrypriv)
 	ie += sz;
 
 	/* beacon interval : 2bytes */
-	*(__le16 *)ie = cpu_to_le16((u16)pdev_network->configuration.beacon_period);/* BCN_INTERVAL; */
+	*(__le16 *)ie = cpu_to_le16((u16)pdev_network->configuration
+					    .beacon_period); /*BCN_INTERVAL;*/
 	sz += 2;
 	ie += 2;
 
@@ -319,7 +321,8 @@ int rtw_generate_ie(struct registry_priv *pregistrypriv)
 	ie += 2;
 
 	/* SSID */
-	ie = rtw_set_ie(ie, WLAN_EID_SSID, pdev_network->ssid.ssid_length, pdev_network->ssid.ssid, &sz);
+	ie = rtw_set_ie(ie, WLAN_EID_SSID, pdev_network->ssid.ssid_length,
+			pdev_network->ssid.ssid, &sz);
 
 	/* supported rates */
 	wireless_mode = pregistrypriv->wireless_mode;
@@ -329,21 +332,28 @@ int rtw_generate_ie(struct registry_priv *pregistrypriv)
 	rate_len = rtw_get_rateset_len(pdev_network->supported_rates);
 
 	if (rate_len > 8) {
-		ie = rtw_set_ie(ie, WLAN_EID_SUPP_RATES, 8, pdev_network->supported_rates, &sz);
-		/* ie = rtw_set_ie(ie, WLAN_EID_EXT_SUPP_RATES, (rate_len - 8), (pdev_network->supported_rates + 8), &sz); */
+		ie = rtw_set_ie(ie, WLAN_EID_SUPP_RATES, 8,
+				pdev_network->supported_rates, &sz);
+		/* ie = rtw_set_ie(ie, WLAN_EID_EXT_SUPP_RATES, (rate_len - 8),
+		 * (pdev_network->supported_rates + 8), &sz);
+		 */
 	} else {
-		ie = rtw_set_ie(ie, WLAN_EID_SUPP_RATES, rate_len, pdev_network->supported_rates, &sz);
+		ie = rtw_set_ie(ie, WLAN_EID_SUPP_RATES, rate_len,
+				pdev_network->supported_rates, &sz);
 	}
 
 	/* DS parameter set */
-	ie = rtw_set_ie(ie, WLAN_EID_DS_PARAMS, 1, (u8 *)&(pdev_network->configuration.ds_config), &sz);
+	ie = rtw_set_ie(ie, WLAN_EID_DS_PARAMS, 1,
+			(u8 *)&pdev_network->configuration.ds_config, &sz);
 
 	/* IBSS Parameter Set */
 
-	ie = rtw_set_ie(ie, WLAN_EID_IBSS_PARAMS, 2, (u8 *)&(pdev_network->configuration.atim_window), &sz);
+	ie = rtw_set_ie(ie, WLAN_EID_IBSS_PARAMS, 2,
+			(u8 *)&pdev_network->configuration.atim_window, &sz);
 
 	if (rate_len > 8)
-		ie = rtw_set_ie(ie, WLAN_EID_EXT_SUPP_RATES, (rate_len - 8), (pdev_network->supported_rates + 8), &sz);
+		ie = rtw_set_ie(ie, WLAN_EID_EXT_SUPP_RATES, (rate_len - 8),
+				(pdev_network->supported_rates + 8), &sz);
 
 	/* HT Cap. */
 	if ((pregistrypriv->wireless_mode & WIRELESS_11_24N) &&
@@ -362,20 +372,22 @@ unsigned char *rtw_get_wpa_ie(unsigned char *pie, int *wpa_ie_len, int limit)
 {
 	int len;
 	u16 val16;
-	unsigned char wpa_oui_type[] = {0x00, 0x50, 0xf2, 0x01};
+	unsigned char wpa_oui_type[] = { 0x00, 0x50, 0xf2, 0x01 };
 	u8 *pbuf = pie;
 	int limit_new = limit;
 	__le16 le_tmp;
 
 	while (1) {
-		pbuf = rtw_get_ie(pbuf, WLAN_EID_VENDOR_SPECIFIC, &len, limit_new);
+		pbuf = rtw_get_ie(pbuf, WLAN_EID_VENDOR_SPECIFIC, &len,
+				  limit_new);
 
 		if (pbuf) {
 			if (len < 6)
 				goto check_next_ie;
 
 			/* check if oui matches... */
-			if (memcmp((pbuf + 2), wpa_oui_type, sizeof(wpa_oui_type)))
+			if (memcmp((pbuf + 2), wpa_oui_type,
+				   sizeof(wpa_oui_type)))
 				goto check_next_ie;
 
 			/* check version... */
@@ -446,12 +458,13 @@ int rtw_get_wpa2_cipher_suite(u8 *s)
 	return 0;
 }
 
-int rtw_parse_wpa_ie(u8 *wpa_ie, int wpa_ie_len, int *group_cipher, int *pairwise_cipher, int *is_8021x)
+int rtw_parse_wpa_ie(u8 *wpa_ie, int wpa_ie_len, int *group_cipher,
+		     int *pairwise_cipher, int *is_8021x)
 {
 	int i, ret = _SUCCESS;
 	int left, count;
 	u8 *pos;
-	u8 SUITE_1X[4] = {0x00, 0x50, 0xf2, 1};
+	u8 SUITE_1X[4] = { 0x00, 0x50, 0xf2, 1 };
 
 	if (wpa_ie_len <= 0) {
 		/* No WPA IE - fail silently */
@@ -511,19 +524,21 @@ int rtw_parse_wpa_ie(u8 *wpa_ie, int wpa_ie_len, int *group_cipher, int *pairwis
 	return ret;
 }
 
-int rtw_parse_wpa2_ie(u8 *rsn_ie, int rsn_ie_len, int *group_cipher, int *pairwise_cipher, int *is_8021x)
+int rtw_parse_wpa2_ie(u8 *rsn_ie, int rsn_ie_len, int *group_cipher,
+		      int *pairwise_cipher, int *is_8021x)
 {
 	int i, ret = _SUCCESS;
 	int left, count;
 	u8 *pos;
-	u8 SUITE_1X[4] = {0x00, 0x0f, 0xac, 0x01};
+	u8 SUITE_1X[4] = { 0x00, 0x0f, 0xac, 0x01 };
 
 	if (rsn_ie_len <= 0) {
 		/* No RSN IE - fail silently */
 		return _FAIL;
 	}
 
-	if ((*rsn_ie != WLAN_EID_RSN) || (*(rsn_ie + 1) != (u8)(rsn_ie_len - 2)))
+	if ((*rsn_ie != WLAN_EID_RSN) ||
+	    (*(rsn_ie + 1) != (u8)(rsn_ie_len - 2)))
 		return _FAIL;
 
 	pos = rsn_ie;
@@ -543,7 +558,7 @@ int rtw_parse_wpa2_ie(u8 *rsn_ie, int rsn_ie_len, int *group_cipher, int *pairwi
 
 	/* pairwise_cipher */
 	if (left >= 2) {
-	  /* count = le16_to_cpu(*(u16*)pos); */
+		/* count = le16_to_cpu(*(u16*)pos); */
 		count = get_unaligned_le16(pos);
 		pos += 2;
 		left -= 2;
@@ -577,9 +592,9 @@ int rtw_get_wapi_ie(u8 *in_ie, uint in_len, u8 *wapi_ie, u16 *wapi_len)
 {
 	int len = 0;
 	u8 authmode;
-	uint	cnt;
-	u8 wapi_oui1[4] = {0x0, 0x14, 0x72, 0x01};
-	u8 wapi_oui2[4] = {0x0, 0x14, 0x72, 0x02};
+	uint cnt;
+	u8 wapi_oui1[4] = { 0x0, 0x14, 0x72, 0x01 };
+	u8 wapi_oui2[4] = { 0x0, 0x14, 0x72, 0x02 };
 
 	if (wapi_len)
 		*wapi_len = 0;
@@ -601,13 +616,14 @@ int rtw_get_wapi_ie(u8 *in_ie, uint in_len, u8 *wapi_ie, u16 *wapi_len)
 		    (!memcmp(&in_ie[cnt + 6], wapi_oui1, 4) ||
 		     !memcmp(&in_ie[cnt + 6], wapi_oui2, 4))) {
 			if (wapi_ie)
-				memcpy(wapi_ie, &in_ie[cnt], in_ie[cnt + 1] + 2);
+				memcpy(wapi_ie, &in_ie[cnt],
+				       in_ie[cnt + 1] + 2);
 
 			if (wapi_len)
 				*wapi_len = in_ie[cnt + 1] + 2;
 		}
 
-		cnt += in_ie[cnt + 1] + 2;   /* get next */
+		cnt += in_ie[cnt + 1] + 2; /* get next */
 	}
 
 	if (wapi_len)
@@ -616,11 +632,12 @@ int rtw_get_wapi_ie(u8 *in_ie, uint in_len, u8 *wapi_ie, u16 *wapi_len)
 	return len;
 }
 
-void rtw_get_sec_ie(u8 *in_ie, uint in_len, u8 *rsn_ie, u16 *rsn_len, u8 *wpa_ie, u16 *wpa_len)
+void rtw_get_sec_ie(u8 *in_ie, uint in_len, u8 *rsn_ie, u16 *rsn_len,
+		    u8 *wpa_ie, u16 *wpa_len)
 {
 	u8 authmode;
-	u8 wpa_oui[4] = {0x0, 0x50, 0xf2, 0x01};
-	uint	cnt;
+	u8 wpa_oui[4] = { 0x0, 0x50, 0xf2, 0x01 };
+	uint cnt;
 
 	/* Search required WPA or WPA2 IE and copy to sec_ie[ ] */
 
@@ -647,7 +664,7 @@ void rtw_get_sec_ie(u8 *in_ie, uint in_len, u8 *rsn_ie, u16 *rsn_len, u8 *wpa_ie
 			*rsn_len = in_ie[cnt + 1] + 2;
 		}
 
-		cnt += in_ie[cnt + 1] + 2;   /* get next */
+		cnt += in_ie[cnt + 1] + 2; /* get next */
 	}
 }
 
@@ -664,7 +681,7 @@ u8 *rtw_get_wps_ie(u8 *in_ie, uint in_len, u8 *wps_ie, uint *wps_ielen)
 {
 	uint cnt;
 	u8 *wpsie_ptr = NULL;
-	u8 eid, wps_oui[4] = {0x0, 0x50, 0xf2, 0x04};
+	u8 eid, wps_oui[4] = { 0x0, 0x50, 0xf2, 0x04 };
 
 	if (wps_ielen)
 		*wps_ielen = 0;
@@ -683,7 +700,8 @@ u8 *rtw_get_wps_ie(u8 *in_ie, uint in_len, u8 *wps_ie, uint *wps_ielen)
 		if (in_ie[cnt + 1] + 2 > in_len - cnt)
 			break;
 
-		if ((eid == WLAN_EID_VENDOR_SPECIFIC) && (in_ie[cnt + 1] >= 4) &&
+		if ((eid == WLAN_EID_VENDOR_SPECIFIC) &&
+		    (in_ie[cnt + 1] >= 4) &&
 		    (!memcmp(&in_ie[cnt + 2], wps_oui, 4))) {
 			wpsie_ptr = &in_ie[cnt];
 
@@ -708,16 +726,19 @@ u8 *rtw_get_wps_ie(u8 *in_ie, uint in_len, u8 *wps_ie, uint *wps_ielen)
  * @wps_ie: Address of WPS IE to search
  * @wps_ielen: Length limit from wps_ie
  * @target_attr_id: The attribute ID of WPS attribute to search
- * @buf_attr: If not NULL and the WPS attribute is found, WPS attribute will be copied to the buf starting from buf_attr
- * @len_attr: If not NULL and the WPS attribute is found, will set to the length of the entire WPS attribute
+ * @buf_attr: If not NULL and the WPS attribute is found,
+ *		WPS attribute will be copied to the buf starting from buf_attr
+ * @len_attr: If not NULL and the WPS attribute is found,
+ *		will set to the length of the entire WPS attribute
  *
  * Returns: the address of the specific WPS attribute found, or NULL
  */
-u8 *rtw_get_wps_attr(u8 *wps_ie, uint wps_ielen, u16 target_attr_id, u8 *buf_attr, u32 *len_attr)
+u8 *rtw_get_wps_attr(u8 *wps_ie, uint wps_ielen, u16 target_attr_id,
+		     u8 *buf_attr, u32 *len_attr)
 {
 	u8 *attr_ptr = NULL;
 	u8 *target_attr_ptr = NULL;
-	u8 wps_oui[4] = {0x00, 0x50, 0xF2, 0x04};
+	u8 wps_oui[4] = { 0x00, 0x50, 0xF2, 0x04 };
 
 	if (len_attr)
 		*len_attr = 0;
@@ -726,7 +747,7 @@ u8 *rtw_get_wps_attr(u8 *wps_ie, uint wps_ielen, u16 target_attr_id, u8 *buf_att
 		return attr_ptr;
 
 	if ((wps_ie[0] != WLAN_EID_VENDOR_SPECIFIC) ||
-		(memcmp(wps_ie + 2, wps_oui, 4))) {
+	    (memcmp(wps_ie + 2, wps_oui, 4))) {
 		return attr_ptr;
 	}
 
@@ -763,12 +784,15 @@ u8 *rtw_get_wps_attr(u8 *wps_ie, uint wps_ielen, u16 target_attr_id, u8 *buf_att
  * @wps_ie: Address of WPS IE to search
  * @wps_ielen: Length limit from wps_ie
  * @target_attr_id: The attribute ID of WPS attribute to search
- * @buf_content: If not NULL and the WPS attribute is found, WPS attribute content will be copied to the buf starting from buf_content
- * @len_content: If not NULL and the WPS attribute is found, will set to the length of the WPS attribute content
+ * @buf_content: If not NULL and the WPS attribute is found,
+ *		WPS attribute content will be copied to the buf starting from buf_content
+ * @len_content: If not NULL and the WPS attribute is found,
+ *		will set to the length of the WPS attribute content
  *
  * Returns: the address of the specific WPS attribute content found, or NULL
  */
-u8 *rtw_get_wps_attr_content(u8 *wps_ie, uint wps_ielen, u16 target_attr_id, u8 *buf_content, uint *len_content)
+u8 *rtw_get_wps_attr_content(u8 *wps_ie, uint wps_ielen, u16 target_attr_id,
+			     u8 *buf_content, uint *len_content)
 {
 	u8 *attr_ptr;
 	u32 attr_len;
@@ -776,7 +800,8 @@ u8 *rtw_get_wps_attr_content(u8 *wps_ie, uint wps_ielen, u16 target_attr_id, u8
 	if (len_content)
 		*len_content = 0;
 
-	attr_ptr = rtw_get_wps_attr(wps_ie, wps_ielen, target_attr_id, NULL, &attr_len);
+	attr_ptr = rtw_get_wps_attr(wps_ie, wps_ielen, target_attr_id, NULL,
+				    &attr_len);
 
 	if (attr_ptr && attr_len) {
 		if (buf_content)
@@ -792,8 +817,8 @@ u8 *rtw_get_wps_attr_content(u8 *wps_ie, uint wps_ielen, u16 target_attr_id, u8
 }
 
 static int rtw_ieee802_11_parse_vendor_specific(u8 *pos, uint elen,
-					    struct rtw_ieee802_11_elems *elems,
-					    int show_errors)
+						struct rtw_ieee802_11_elems *elems,
+						int show_errors)
 {
 	unsigned int oui;
 
@@ -937,9 +962,7 @@ enum parse_result rtw_ieee802_11_parse_elems(u8 *start, uint len,
 			elems->ext_supp_rates_len = elen;
 			break;
 		case WLAN_EID_VENDOR_SPECIFIC:
-			if (rtw_ieee802_11_parse_vendor_specific(pos, elen,
-							     elems,
-							     show_errors))
+			if (rtw_ieee802_11_parse_vendor_specific(pos, elen, elems, show_errors))
 				unknown++;
 			break;
 		case WLAN_EID_RSN:
@@ -1036,8 +1059,7 @@ static int rtw_get_cipher_info(struct wlan_network *pnetwork)
 	int group_cipher = 0, pairwise_cipher = 0, is8021x = 0;
 	int ret = _FAIL;
 
-	pbuf = rtw_get_wpa_ie(&pnetwork->network.ies[12],
-			      &wpa_ielen,
+	pbuf = rtw_get_wpa_ie(&pnetwork->network.ies[12], &wpa_ielen,
 			      pnetwork->network.ie_length - 12);
 
 	if (pbuf && (wpa_ielen > 0)) {
@@ -1053,9 +1075,11 @@ static int rtw_get_cipher_info(struct wlan_network *pnetwork)
 				       pnetwork->network.ie_length - 12);
 
 		if (pbuf && (wpa_ielen > 0)) {
-			if (rtw_parse_wpa2_ie(pbuf, wpa_ielen + 2, &group_cipher,
-					      &pairwise_cipher, &is8021x) == _SUCCESS) {
-				pnetwork->bcn_info.pairwise_cipher = pairwise_cipher;
+			if (rtw_parse_wpa2_ie(pbuf, wpa_ielen + 2,
+					      &group_cipher, &pairwise_cipher,
+					      &is8021x) == _SUCCESS) {
+				pnetwork->bcn_info.pairwise_cipher =
+					pairwise_cipher;
 				pnetwork->bcn_info.group_cipher = group_cipher;
 				pnetwork->bcn_info.is_8021x = is8021x;
 				ret = _SUCCESS;
@@ -1078,7 +1102,8 @@ void rtw_get_bcn_info(struct wlan_network *pnetwork)
 	unsigned char *p;
 	__le16 le_cap;
 
-	memcpy((u8 *)&le_cap, rtw_get_capability_from_ie(pnetwork->network.ies), 2);
+	memcpy((u8 *)&le_cap, rtw_get_capability_from_ie(pnetwork->network.ies),
+	       2);
 	cap = le16_to_cpu(le_cap);
 	if (cap & WLAN_CAPABILITY_PRIVACY) {
 		bencrypt = 1;
@@ -1086,7 +1111,8 @@ void rtw_get_bcn_info(struct wlan_network *pnetwork)
 	} else {
 		pnetwork->bcn_info.encryp_protocol = ENCRYP_PROTOCOL_OPENSYS;
 	}
-	rtw_get_sec_ie(pnetwork->network.ies, pnetwork->network.ie_length, NULL, &rsn_len, NULL, &wpa_len);
+	rtw_get_sec_ie(pnetwork->network.ies, pnetwork->network.ie_length, NULL,
+		       &rsn_len, NULL, &wpa_len);
 
 	if (rsn_len > 0) {
 		pnetwork->bcn_info.encryp_protocol = ENCRYP_PROTOCOL_WPA2;
@@ -1094,13 +1120,16 @@ void rtw_get_bcn_info(struct wlan_network *pnetwork)
 		pnetwork->bcn_info.encryp_protocol = ENCRYP_PROTOCOL_WPA;
 	} else {
 		if (bencrypt)
-			pnetwork->bcn_info.encryp_protocol = ENCRYP_PROTOCOL_WEP;
+			pnetwork->bcn_info.encryp_protocol =
+				ENCRYP_PROTOCOL_WEP;
 	}
 	rtw_get_cipher_info(pnetwork);
 
 	/* get bwmode and ch_offset */
 	/* parsing HT_CAP_IE */
-	p = rtw_get_ie(pnetwork->network.ies + _FIXED_IE_LENGTH_, WLAN_EID_HT_CAPABILITY, &len, pnetwork->network.ie_length - _FIXED_IE_LENGTH_);
+	p = rtw_get_ie(pnetwork->network.ies + _FIXED_IE_LENGTH_,
+		       WLAN_EID_HT_CAPABILITY, &len,
+		       pnetwork->network.ie_length - _FIXED_IE_LENGTH_);
 	if (p && len > 0) {
 		pht_cap = (struct ieee80211_ht_cap *)(p + 2);
 		pnetwork->bcn_info.ht_cap_info = le16_to_cpu(pht_cap->cap_info);
@@ -1108,7 +1137,9 @@ void rtw_get_bcn_info(struct wlan_network *pnetwork)
 		pnetwork->bcn_info.ht_cap_info = 0;
 	}
 	/* parsing HT_INFO_IE */
-	p = rtw_get_ie(pnetwork->network.ies + _FIXED_IE_LENGTH_, WLAN_EID_HT_OPERATION, &len, pnetwork->network.ie_length - _FIXED_IE_LENGTH_);
+	p = rtw_get_ie(pnetwork->network.ies + _FIXED_IE_LENGTH_,
+		       WLAN_EID_HT_OPERATION, &len,
+		       pnetwork->network.ie_length - _FIXED_IE_LENGTH_);
 	if (p && len > 0) {
 		pht_info = (struct HT_info_element *)(p + 2);
 		pnetwork->bcn_info.ht_info_infos_0 = pht_info->infos[0];
@@ -1118,31 +1149,40 @@ void rtw_get_bcn_info(struct wlan_network *pnetwork)
 }
 
 /* show MCS rate, unit: 100Kbps */
-u16 rtw_mcs_rate(u8 bw_40MHz, u8 short_GI, unsigned char *MCS_rate)
+u16 rtw_mcs_rate(u8 bw_40mgz, u8 short_GI, unsigned char *MCS_rate)
 {
 	u16 max_rate = 0;
 
 	if (MCS_rate[0] & BIT(7))
-		max_rate = (bw_40MHz) ? ((short_GI) ? 1500 : 1350) : ((short_GI) ? 722 : 650);
+		max_rate = (bw_40mgz) ? ((short_GI) ? 1500 : 1350) :
+					((short_GI) ? 722 : 650);
 	else if (MCS_rate[0] & BIT(6))
-		max_rate = (bw_40MHz) ? ((short_GI) ? 1350 : 1215) : ((short_GI) ? 650 : 585);
+		max_rate = (bw_40mgz) ? ((short_GI) ? 1350 : 1215) :
+					((short_GI) ? 650 : 585);
 	else if (MCS_rate[0] & BIT(5))
-		max_rate = (bw_40MHz) ? ((short_GI) ? 1200 : 1080) : ((short_GI) ? 578 : 520);
+		max_rate = (bw_40mgz) ? ((short_GI) ? 1200 : 1080) :
+					((short_GI) ? 578 : 520);
 	else if (MCS_rate[0] & BIT(4))
-		max_rate = (bw_40MHz) ? ((short_GI) ? 900 : 810) : ((short_GI) ? 433 : 390);
+		max_rate = (bw_40mgz) ? ((short_GI) ? 900 : 810) :
+					((short_GI) ? 433 : 390);
 	else if (MCS_rate[0] & BIT(3))
-		max_rate = (bw_40MHz) ? ((short_GI) ? 600 : 540) : ((short_GI) ? 289 : 260);
+		max_rate = (bw_40mgz) ? ((short_GI) ? 600 : 540) :
+					((short_GI) ? 289 : 260);
 	else if (MCS_rate[0] & BIT(2))
-		max_rate = (bw_40MHz) ? ((short_GI) ? 450 : 405) : ((short_GI) ? 217 : 195);
+		max_rate = (bw_40mgz) ? ((short_GI) ? 450 : 405) :
+					((short_GI) ? 217 : 195);
 	else if (MCS_rate[0] & BIT(1))
-		max_rate = (bw_40MHz) ? ((short_GI) ? 300 : 270) : ((short_GI) ? 144 : 130);
+		max_rate = (bw_40mgz) ? ((short_GI) ? 300 : 270) :
+					((short_GI) ? 144 : 130);
 	else if (MCS_rate[0] & BIT(0))
-		max_rate = (bw_40MHz) ? ((short_GI) ? 150 : 135) : ((short_GI) ? 72 : 65);
+		max_rate = (bw_40mgz) ? ((short_GI) ? 150 : 135) :
+					((short_GI) ? 72 : 65);
 
 	return max_rate;
 }
 
-int rtw_action_frame_parse(const u8 *frame, u32 frame_len, u8 *category, u8 *action)
+int rtw_action_frame_parse(const u8 *frame, u32 frame_len, u8 *category,
+			   u8 *action)
 {
 	const u8 *frame_body = frame + sizeof(struct ieee80211_hdr_3addr);
 	u16 fc;
@@ -1172,7 +1212,7 @@ int rtw_action_frame_parse(const u8 *frame, u32 frame_len, u8 *category, u8 *act
 	return true;
 }
 
-static const char * const _action_public_str[] = {
+static const char *const _action_public_str[] = {
 	"ACT_PUB_BSSCOEXIST",
 	"ACT_PUB_DSE_ENABLE",
 	"ACT_PUB_DSE_DEENABLE",
-- 
2.55.0

