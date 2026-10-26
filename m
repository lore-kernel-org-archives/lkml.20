Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793048236;
	b=NdwRlDVUF5YT6bnedJORj03/neRM3HBa0vRXuRphD71H+yXthbWca0GTT1hLOWhn/rmt
	 gPQ7uZfxWsjVqIj52Ok83BESf0hmsU52U/VSDIPAp2ovmooCgnXj+ueQHWrKuRndkdv3N
	 dbru/gY6UHJBfy5NFD3S7hodkQFQRVdp1pLTOP3oXiZeufJofz0SAfxkHtX2v7hc2l2CQ
	 t07QDbTe9KmWmQ6eWJ7kY4wdt3EzoJRIKLtMUfddFR5BhBhrN24s+qmLn5GqhlBnt7HEg
	 5UcCpKgVO0avrzR30UUsAgQbgleonM3P14WJzlZgQC5tlub+r5MiEO4n4ZLXwETs4CA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793048236;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=F3fDjYlLjJtX+TmN74SHiqVv2uLyeyvbcpCfY+FDwh4=;
	b=Nxf70L8u+XE3qiM9gTUt4IFb67pkfu/1WG8ZxVD5VoxyTc8GhToahhgfgsykSjYa+9HC
	 /Ipcq67px1t7fv725jQxMgscjMCFJIQo+jN9GjQTtcMSbwTP9HmqDcEefV0bt62r1KCFg
	 1JiNtv0NQbBtnoIUKiatT7NNVKI+sBo5sDeX784Eux6TpGChEql7cwEOp7C+4WJZ6KgAV
	 c6zHA5KnsVVVyONvGZFvOdA+1vM4GP6skuTGYFY6d63EgbWsW/NZqkw8pe12z8zYDdmCL
	 akM8JRkLK9UCdLvlu+B3fSempnKOLveKgPLZdISkNkOAeX6/k82dwftUZQTfiEBcNVw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=qjsVxuvB;
	arc=none smtp.remote-ip=209.85.128.48
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 172A5606A326
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 20:57:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 172A5606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=qjsVxuvB
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4a20bde60a0so29745645e9.3
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 13:57:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793048234; x=1793653034; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=F3fDjYlLjJtX+TmN74SHiqVv2uLyeyvbcpCfY+FDwh4=;
        b=qjsVxuvBhNcyy+POSqgH1oLaQgNl94FlRvAe9SR7K52U+y3481knS4DCBa9NbUUPJJ
         9J7mi5CtzMRqVVg7TCaqC3wKHQSGz8ZrpQMZx/xInD46x1z7m0OVMo37dAu7voCPgSbm
         PWMD3lG06WAJnKZ1OE6Et57BEogOUyfUjFiIeq14oxu/obLt+anEEKNkW/JddT2vuXk/
         hTdThYzxJVaZ1/zXpSr9/VYs/bhS7vGnRJD0GqTnOnXEeER+0XOab78aDtN+6DhFqPql
         vTd6+3K1BNwN16DkxlZ0e5WMbt/dMjs4t+xhtwFFF9q0cOmZJ/egEpL5EnjXA3EiDApO
         2DiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793048234; x=1793653034;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=F3fDjYlLjJtX+TmN74SHiqVv2uLyeyvbcpCfY+FDwh4=;
        b=BcysgfchjBf2NlCzfNenKZoFkqXLTYyScEEN4NDztNPylnDR7H/HpyNTjMQ4/DacVD
         gDZv49pocio1YkYsQoW1PwQyvkphHNiB+0q0vvr5PvBTwYb1dXuK/hfoUBZ4zMk9Aega
         niWDtN6lZh+61qzP1ue3asNO/js3ga156iYNb7ELC8kmH+ftfYFETOe+0stKCCiUw9pP
         mSP3nWPxFjBtQMH9l+UfB4atyLzi4KRjC8UwNWugXTBjMi6q//Gn0tStFeGm7nBOFL+1
         9C0VvttoDUCKrSYbAq9LsVyiCMszZKYlEEQ19qBJMs+49dryGBoBj8f5ZJdvWt1p+Idl
         H8DA==
X-Forwarded-Encrypted: i=1; AKwUvBxSXSjkgyaL3sNR9w9eVttYb0+vSvNwQlBTSJrmKSaKKCL+hSnnPkXzb5eLnr4NsbAQPcdGh3JxON4iApc=@vger.kernel.org
X-Gm-Message-State: AFq9FYLWqSULoebY4Y2KIuYHZdJ3rqUKUFbEvvX9izkodPFFaSvGkY3W
	HLTkSmKhOd7gay3XnU8hnynU4ugQobK/Vqyep5DaJgo6KWeDxDe1NYPF
X-Gm-Gg: AYBFou3+1QyWmja1jEx2VSa80VvXR7+egDC33c/tqlWzJujcsF2q9Yv2HM5VN+xieaL
	lbXXL0IHEifqmzAcSxm09BnHwCLJT6Bro7BYPuhhru9F8xmpKJa1828KiY+8asLh6mdiHDYON20
	VuHS/SOKZFcymtuYpncbZOLMQZHnv493VstOQDhV5nLr7nixdwn/s1QU9Dx2WSVsUt1Csn0mxiW
	JUyLGVP9MaAW0UNNUGXQWkfNsb0JipMUMwAFo3DB/KE8bUelwUv18cG+vDMrcJcJawnar+I3SRr
	9IIN8qUcUPUd7ddDvCbtSejPjeO8iyxAqKsjsFsM4oa4N1ws47pCL/rBz6rMtU0wgl+vhD4QdOF
	qXsOpBWYz3HN2He8ESM9xnA/OpGtoAeOoejaeXmiKKAxbqcYbiNTXX4XNRbt/9IPUSA1Depn9lv
	oRPA+6ihye7fMOxdG+ZzVaCW5dGX2ROmueXuygzHmgZN7bJCNueMnhqzbj9TB4dL8x2bqvxGFjX
	JPrBwsI2ZFyn3t2rzfXG1ulQr23d8coU9jJl2eLY0VN6A9Ro3c3cS8u
X-Received: by 2002:a05:600c:c16b:b0:4a2:1a:a11d with SMTP id 5b1f17b1804b1-4a35aae5cbamr146922855e9.0.1793048234366;
        Mon, 26 Oct 2026 13:57:14 -0700 (PDT)
Received: from pop-os.. ([87.248.177.225])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a35a029332sm193725085e9.4.2026.10.26.13.57.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 13:57:13 -0700 (PDT)
From: Albu Victor-Marian <albu.victor.m@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Yalagada Pavan Kumar <pavankumaryalagada@gmail.com>,
	Albu Victor-Marian <albu.victor.m@gmail.com>
Subject: [PATCH 3/3] staging: rtl8723bs: fix spacing and line length in ieee80211 files
Date: Mon, 26 Oct 2026 22:56:59 +0200
Message-ID: <20261026205659.181065-4-albu.victor.m@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261026205659.181065-1-albu.victor.m@gmail.com>
References: <20261026205659.181065-1-albu.victor.m@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Adjust coding style to current Linux kernel standards.
Wrap lines longer than 100 columns, align continuation lines with
the opening parenthesis and rename bw_40MHz to bw_40mhz to avoid
CamelCase.

No functional change intended.

Compile tested only.

Signed-off-by: Albu Victor-Marian <albu.victor.m@gmail.com>
---
 .../staging/rtl8723bs/core/rtw_ieee80211.c    | 92 +++++++++++--------
 drivers/staging/rtl8723bs/include/ieee80211.h | 48 +++++-----
 2 files changed, 77 insertions(+), 63 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_ieee80211.c b/drivers/staging/rtl8723bs/core/rtw_ieee80211.c
index 059f9035db6c..e68adcd562c8 100644
--- a/drivers/staging/rtl8723bs/core/rtw_ieee80211.c
+++ b/drivers/staging/rtl8723bs/core/rtw_ieee80211.c
@@ -105,7 +105,7 @@ int rtw_check_network_type(unsigned char *rate, int channel)
 }
 
 u8 *rtw_set_fixed_ie(unsigned char *pbuf, unsigned int len, unsigned char *source,
-				unsigned int *frlen)
+		     unsigned int *frlen)
 {
 	memcpy(pbuf, source, len);
 	*frlen = *frlen + len;
@@ -166,7 +166,8 @@ u8 *rtw_get_ie(u8 *pbuf, signed int index, signed int *len, signed int limit)
  * @eid: Element ID to match
  * @oui: OUI to match
  * @oui_len: OUI length
- * @ie: If not NULL and the specific IE is found, the IE will be copied to the buf starting from the specific IE
+ * @ie: If not NULL and the specific IE is found, the IE will be copied to the buf
+ *	starting from the specific IE
  * @ielen: If not NULL and the specific IE is found, will set to the length of the entire IE
  *
  * Returns: The address of the specific IE found, or NULL
@@ -234,7 +235,8 @@ int rtw_ies_remove_ie(u8 *ies, uint *ies_len, uint offset, u8 eid, u8 *oui, u8 o
 	search_len = *ies_len - offset;
 
 	while (1) {
-		target_ie = rtw_get_ie_ex(start, search_len, eid, oui, oui_len, NULL, &target_ielen);
+		target_ie = rtw_get_ie_ex(start, search_len, eid, oui, oui_len, NULL,
+					  &target_ielen);
 		if (target_ie && target_ielen) {
 			u8 *remain_ies = target_ie + target_ielen;
 			uint remain_len = search_len - (remain_ies - start);
@@ -271,7 +273,8 @@ void rtw_set_supported_rate(u8 *supported_rates, uint mode)
 	case WIRELESS_11_24N:
 	case WIRELESS_11BG_24N:
 		memcpy(supported_rates, WIFI_CCKRATES, IEEE80211_CCK_RATE_LEN);
-		memcpy(supported_rates + IEEE80211_CCK_RATE_LEN, WIFI_OFDMRATES, IEEE80211_NUM_OFDM_RATESLEN);
+		memcpy(supported_rates + IEEE80211_CCK_RATE_LEN, WIFI_OFDMRATES,
+		       IEEE80211_NUM_OFDM_RATESLEN);
 		break;
 	}
 }
@@ -298,7 +301,8 @@ int rtw_generate_ie(struct registry_priv *pregistrypriv)
 	ie += sz;
 
 	/* beacon interval : 2bytes */
-	*(__le16 *)ie = cpu_to_le16((u16)pdev_network->configuration.beacon_period);/* BCN_INTERVAL; */
+	/* BCN_INTERVAL; */
+	*(__le16 *)ie = cpu_to_le16((u16)pdev_network->configuration.beacon_period);
 	sz += 2;
 	ie += 2;
 
@@ -317,7 +321,8 @@ int rtw_generate_ie(struct registry_priv *pregistrypriv)
 	ie += 2;
 
 	/* SSID */
-	ie = rtw_set_ie(ie, WLAN_EID_SSID, pdev_network->ssid.ssid_length, pdev_network->ssid.ssid, &sz);
+	ie = rtw_set_ie(ie, WLAN_EID_SSID, pdev_network->ssid.ssid_length, pdev_network->ssid.ssid,
+			&sz);
 
 	/* supported rates */
 	wireless_mode = pregistrypriv->wireless_mode;
@@ -326,21 +331,24 @@ int rtw_generate_ie(struct registry_priv *pregistrypriv)
 
 	rate_len = rtw_get_rateset_len(pdev_network->supported_rates);
 
-	if (rate_len > 8) {
+	if (rate_len > 8)
 		ie = rtw_set_ie(ie, WLAN_EID_SUPP_RATES, 8, pdev_network->supported_rates, &sz);
-	} else {
-		ie = rtw_set_ie(ie, WLAN_EID_SUPP_RATES, rate_len, pdev_network->supported_rates, &sz);
-	}
+	else
+		ie = rtw_set_ie(ie, WLAN_EID_SUPP_RATES, rate_len, pdev_network->supported_rates,
+				&sz);
 
 	/* DS parameter set */
-	ie = rtw_set_ie(ie, WLAN_EID_DS_PARAMS, 1, (u8 *)&pdev_network->configuration.ds_config, &sz);
+	ie = rtw_set_ie(ie, WLAN_EID_DS_PARAMS, 1, (u8 *)&pdev_network->configuration.ds_config,
+			&sz);
 
 	/* IBSS Parameter Set */
 
-	ie = rtw_set_ie(ie, WLAN_EID_IBSS_PARAMS, 2, (u8 *)&pdev_network->configuration.atim_window, &sz);
+	ie = rtw_set_ie(ie, WLAN_EID_IBSS_PARAMS, 2, (u8 *)&pdev_network->configuration.atim_window,
+			&sz);
 
 	if (rate_len > 8)
-		ie = rtw_set_ie(ie, WLAN_EID_EXT_SUPP_RATES, (rate_len - 8), (pdev_network->supported_rates + 8), &sz);
+		ie = rtw_set_ie(ie, WLAN_EID_EXT_SUPP_RATES, (rate_len - 8),
+				(pdev_network->supported_rates + 8), &sz);
 
 	/* HT Cap. */
 	if ((pregistrypriv->wireless_mode & WIRELESS_11_24N) &&
@@ -439,7 +447,8 @@ int rtw_get_wpa2_cipher_suite(u8 *s)
 	return 0;
 }
 
-int rtw_parse_wpa_ie(u8 *wpa_ie, int wpa_ie_len, int *group_cipher, int *pairwise_cipher, int *is_8021x)
+int rtw_parse_wpa_ie(u8 *wpa_ie, int wpa_ie_len, int *group_cipher, int *pairwise_cipher,
+		     int *is_8021x)
 {
 	int i, ret = _SUCCESS;
 	int left, count;
@@ -503,7 +512,8 @@ int rtw_parse_wpa_ie(u8 *wpa_ie, int wpa_ie_len, int *group_cipher, int *pairwis
 	return ret;
 }
 
-int rtw_parse_wpa2_ie(u8 *rsn_ie, int rsn_ie_len, int *group_cipher, int *pairwise_cipher, int *is_8021x)
+int rtw_parse_wpa2_ie(u8 *rsn_ie, int rsn_ie_len, int *group_cipher, int *pairwise_cipher,
+		      int *is_8021x)
 {
 	int i, ret = _SUCCESS;
 	int left, count;
@@ -699,8 +709,10 @@ u8 *rtw_get_wps_ie(u8 *in_ie, uint in_len, u8 *wps_ie, uint *wps_ielen)
  * @wps_ie: Address of WPS IE to search
  * @wps_ielen: Length limit from wps_ie
  * @target_attr_id: The attribute ID of WPS attribute to search
- * @buf_attr: If not NULL and the WPS attribute is found, WPS attribute will be copied to the buf starting from buf_attr
- * @len_attr: If not NULL and the WPS attribute is found, will set to the length of the entire WPS attribute
+ * @buf_attr: If not NULL and the WPS attribute is found, WPS attribute will be copied to the buf
+ *	starting from buf_attr
+ * @len_attr: If not NULL and the WPS attribute is found, will set to the length of the entire WPS
+ *	attribute
  *
  * Returns: the address of the specific WPS attribute found, or NULL
  */
@@ -717,7 +729,7 @@ u8 *rtw_get_wps_attr(u8 *wps_ie, uint wps_ielen, u16 target_attr_id, u8 *buf_att
 		return attr_ptr;
 
 	if ((wps_ie[0] != WLAN_EID_VENDOR_SPECIFIC) ||
-		(memcmp(wps_ie + 2, wps_oui, 4))) {
+	    (memcmp(wps_ie + 2, wps_oui, 4))) {
 		return attr_ptr;
 	}
 
@@ -758,12 +770,15 @@ u8 *rtw_get_wps_attr(u8 *wps_ie, uint wps_ielen, u16 target_attr_id, u8 *buf_att
  * @wps_ie: Address of WPS IE to search
  * @wps_ielen: Length limit from wps_ie
  * @target_attr_id: The attribute ID of WPS attribute to search
- * @buf_content: If not NULL and the WPS attribute is found, WPS attribute content will be copied to the buf starting from buf_content
- * @len_content: If not NULL and the WPS attribute is found, will set to the length of the WPS attribute content
+ * @buf_content: If not NULL and the WPS attribute is found, WPS attribute content will be copied to
+ *	the buf starting from buf_content
+ * @len_content: If not NULL and the WPS attribute is found, will set to the length of the WPS
+ *	attribute content
  *
  * Returns: the address of the specific WPS attribute content found, or NULL
  */
-u8 *rtw_get_wps_attr_content(u8 *wps_ie, uint wps_ielen, u16 target_attr_id, u8 *buf_content, uint *len_content)
+u8 *rtw_get_wps_attr_content(u8 *wps_ie, uint wps_ielen, u16 target_attr_id, u8 *buf_content,
+			     uint *len_content)
 {
 	u8 *attr_ptr;
 	u32 attr_len;
@@ -787,8 +802,8 @@ u8 *rtw_get_wps_attr_content(u8 *wps_ie, uint wps_ielen, u16 target_attr_id, u8
 }
 
 static int rtw_ieee802_11_parse_vendor_specific(u8 *pos, uint elen,
-					    struct rtw_ieee802_11_elems *elems,
-					    int show_errors)
+						struct rtw_ieee802_11_elems *elems,
+						int show_errors)
 {
 	unsigned int oui;
 
@@ -932,9 +947,7 @@ enum parse_result rtw_ieee802_11_parse_elems(u8 *start, uint len,
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
@@ -1080,7 +1093,8 @@ void rtw_get_bcn_info(struct wlan_network *pnetwork)
 	} else {
 		pnetwork->bcn_info.encryp_protocol = ENCRYP_PROTOCOL_OPENSYS;
 	}
-	rtw_get_sec_ie(pnetwork->network.ies, pnetwork->network.ie_length, NULL, &rsn_len, NULL, &wpa_len);
+	rtw_get_sec_ie(pnetwork->network.ies, pnetwork->network.ie_length, NULL, &rsn_len, NULL,
+		       &wpa_len);
 
 	if (rsn_len > 0) {
 		pnetwork->bcn_info.encryp_protocol = ENCRYP_PROTOCOL_WPA2;
@@ -1094,7 +1108,8 @@ void rtw_get_bcn_info(struct wlan_network *pnetwork)
 
 	/* get bwmode and ch_offset */
 	/* parsing HT_CAP_IE */
-	p = rtw_get_ie(pnetwork->network.ies + _FIXED_IE_LENGTH_, WLAN_EID_HT_CAPABILITY, &len, pnetwork->network.ie_length - _FIXED_IE_LENGTH_);
+	p = rtw_get_ie(pnetwork->network.ies + _FIXED_IE_LENGTH_, WLAN_EID_HT_CAPABILITY, &len,
+		       pnetwork->network.ie_length - _FIXED_IE_LENGTH_);
 	if (p && len > 0) {
 		pht_cap = (struct ieee80211_ht_cap *)(p + 2);
 		pnetwork->bcn_info.ht_cap_info = le16_to_cpu(pht_cap->cap_info);
@@ -1102,7 +1117,8 @@ void rtw_get_bcn_info(struct wlan_network *pnetwork)
 		pnetwork->bcn_info.ht_cap_info = 0;
 	}
 	/* parsing HT_INFO_IE */
-	p = rtw_get_ie(pnetwork->network.ies + _FIXED_IE_LENGTH_, WLAN_EID_HT_OPERATION, &len, pnetwork->network.ie_length - _FIXED_IE_LENGTH_);
+	p = rtw_get_ie(pnetwork->network.ies + _FIXED_IE_LENGTH_, WLAN_EID_HT_OPERATION, &len,
+		       pnetwork->network.ie_length - _FIXED_IE_LENGTH_);
 	if (p && len > 0) {
 		pht_info = (struct HT_info_element *)(p + 2);
 		pnetwork->bcn_info.ht_info_infos_0 = pht_info->infos[0];
@@ -1112,26 +1128,26 @@ void rtw_get_bcn_info(struct wlan_network *pnetwork)
 }
 
 /* show MCS rate, unit: 100Kbps */
-u16 rtw_mcs_rate(u8 bw_40MHz, u8 short_GI, unsigned char *MCS_rate)
+u16 rtw_mcs_rate(u8 bw_40mhz, u8 short_GI, unsigned char *MCS_rate)
 {
 	u16 max_rate = 0;
 
 	if (MCS_rate[0] & BIT(7))
-		max_rate = (bw_40MHz) ? ((short_GI) ? 1500 : 1350) : ((short_GI) ? 722 : 650);
+		max_rate = (bw_40mhz) ? ((short_GI) ? 1500 : 1350) : ((short_GI) ? 722 : 650);
 	else if (MCS_rate[0] & BIT(6))
-		max_rate = (bw_40MHz) ? ((short_GI) ? 1350 : 1215) : ((short_GI) ? 650 : 585);
+		max_rate = (bw_40mhz) ? ((short_GI) ? 1350 : 1215) : ((short_GI) ? 650 : 585);
 	else if (MCS_rate[0] & BIT(5))
-		max_rate = (bw_40MHz) ? ((short_GI) ? 1200 : 1080) : ((short_GI) ? 578 : 520);
+		max_rate = (bw_40mhz) ? ((short_GI) ? 1200 : 1080) : ((short_GI) ? 578 : 520);
 	else if (MCS_rate[0] & BIT(4))
-		max_rate = (bw_40MHz) ? ((short_GI) ? 900 : 810) : ((short_GI) ? 433 : 390);
+		max_rate = (bw_40mhz) ? ((short_GI) ? 900 : 810) : ((short_GI) ? 433 : 390);
 	else if (MCS_rate[0] & BIT(3))
-		max_rate = (bw_40MHz) ? ((short_GI) ? 600 : 540) : ((short_GI) ? 289 : 260);
+		max_rate = (bw_40mhz) ? ((short_GI) ? 600 : 540) : ((short_GI) ? 289 : 260);
 	else if (MCS_rate[0] & BIT(2))
-		max_rate = (bw_40MHz) ? ((short_GI) ? 450 : 405) : ((short_GI) ? 217 : 195);
+		max_rate = (bw_40mhz) ? ((short_GI) ? 450 : 405) : ((short_GI) ? 217 : 195);
 	else if (MCS_rate[0] & BIT(1))
-		max_rate = (bw_40MHz) ? ((short_GI) ? 300 : 270) : ((short_GI) ? 144 : 130);
+		max_rate = (bw_40mhz) ? ((short_GI) ? 300 : 270) : ((short_GI) ? 144 : 130);
 	else if (MCS_rate[0] & BIT(0))
-		max_rate = (bw_40MHz) ? ((short_GI) ? 150 : 135) : ((short_GI) ? 72 : 65);
+		max_rate = (bw_40mhz) ? ((short_GI) ? 150 : 135) : ((short_GI) ? 72 : 65);
 
 	return max_rate;
 }
diff --git a/drivers/staging/rtl8723bs/include/ieee80211.h b/drivers/staging/rtl8723bs/include/ieee80211.h
index fc0473ff8a56..f476b01c6537 100644
--- a/drivers/staging/rtl8723bs/include/ieee80211.h
+++ b/drivers/staging/rtl8723bs/include/ieee80211.h
@@ -83,7 +83,6 @@ enum {
 #define IEEE_CRYPT_ERR_TX_KEY_SET_FAILED		6
 #define IEEE_CRYPT_ERR_CARD_CONF_FAILED		7
 
-
 #define	IEEE_CRYPT_ALG_NAME_LEN			16
 
 #define WPA_CIPHER_NONE		BIT(0)
@@ -92,8 +91,6 @@ enum {
 #define WPA_CIPHER_TKIP		BIT(3)
 #define WPA_CIPHER_CCMP		BIT(4)
 
-
-
 #define WPA_SELECTOR_LEN 4
 extern u8 RTW_WPA_OUI_TYPE[];
 extern u16 RTW_WPA_VERSION;
@@ -107,7 +104,6 @@ extern u8 WPA_CIPHER_SUITE_WRAP[];
 extern u8 WPA_CIPHER_SUITE_CCMP[];
 extern u8 WPA_CIPHER_SUITE_WEP104[];
 
-
 #define RSN_HEADER_LEN 4
 #define RSN_SELECTOR_LEN 4
 
@@ -121,7 +117,6 @@ extern u8 RSN_CIPHER_SUITE_WRAP[];
 extern u8 RSN_CIPHER_SUITE_CCMP[];
 extern u8 RSN_CIPHER_SUITE_WEP104[];
 
-
 enum {
 	RATEID_IDX_BGN_40M_2SS = 0,
 	RATEID_IDX_BGN_40M_1SS = 1,
@@ -144,10 +139,14 @@ enum network_type {
 
 	/* Combination */
 	/* Type for current wireless mode */
-	WIRELESS_11BG = (WIRELESS_11B|WIRELESS_11G), /*  tx: cck & ofdm, rx: cck & ofdm & MCS, hw: cck & ofdm */
-	WIRELESS_11G_24N = (WIRELESS_11G|WIRELESS_11_24N), /*  tx: ofdm & MCS, rx: ofdm & cck & MCS, hw: cck & ofdm */
-	WIRELESS_11B_24N = (WIRELESS_11B|WIRELESS_11_24N), /*  tx: ofdm & cck & MCS, rx: ofdm & cck & MCS, hw: ofdm & cck */
-	WIRELESS_11BG_24N = (WIRELESS_11B|WIRELESS_11G|WIRELESS_11_24N), /*  tx: ofdm & cck & MCS, rx: ofdm & cck & MCS, hw: ofdm & cck */
+	/*  tx: cck & ofdm, rx: cck & ofdm & MCS, hw: cck & ofdm */
+	WIRELESS_11BG = (WIRELESS_11B | WIRELESS_11G),
+	/*  tx: ofdm & MCS, rx: ofdm & cck & MCS, hw: cck & ofdm */
+	WIRELESS_11G_24N = (WIRELESS_11G | WIRELESS_11_24N),
+	/*  tx: ofdm & cck & MCS, rx: ofdm & cck & MCS, hw: ofdm & cck */
+	WIRELESS_11B_24N = (WIRELESS_11B | WIRELESS_11_24N),
+	/*  tx: ofdm & cck & MCS, rx: ofdm & cck & MCS, hw: ofdm & cck */
+	WIRELESS_11BG_24N = (WIRELESS_11B | WIRELESS_11G | WIRELESS_11_24N),
 };
 
 #define SUPPORTED_24G_NETTYPE_MSK (WIRELESS_11B | WIRELESS_11G | WIRELESS_11_24N)
@@ -244,7 +243,6 @@ struct eapol {
 #define RTW_IEEE80211_SCTL_FRAG	0x000F
 #define RTW_IEEE80211_SCTL_SEQ	0xFFF0
 
-
 #define RTW_ERP_INFO_NON_ERP_PRESENT BIT(0)
 #define RTW_ERP_INFO_USE_PROTECTION BIT(1)
 #define RTW_ERP_INFO_BARKER_PREAMBLE_MODE BIT(2)
@@ -312,7 +310,6 @@ struct ieee80211_snap_hdr {
 #define IEEE80211_CCK_RATE_LEN			4
 #define IEEE80211_NUM_OFDM_RATESLEN	8
 
-
 #define IEEE80211_CCK_RATE_1MB		        0x02
 #define IEEE80211_CCK_RATE_2MB		        0x04
 #define IEEE80211_CCK_RATE_5MB		        0x0B
@@ -367,7 +364,6 @@ struct ieee80211_snap_hdr {
 #define IEEE80211_NUM_CCK_RATES	            4
 #define IEEE80211_OFDM_SHIFT_MASK_A         4
 
-
 enum {
 	MGN_1M		= 0x02,
 	MGN_2M		= 0x04,
@@ -585,7 +581,6 @@ enum {
 #define WME_TSPEC_DIRECTION_DOWNLINK 1
 #define WME_TSPEC_DIRECTION_BI_DIRECTIONAL 3
 
-
 #define OUI_BROADCOM 0x00904c /* Broadcom (Epigram) */
 
 #define VENDOR_HT_CAPAB_OUI_TYPE 0x33 /* 00-90-4c:0x33 */
@@ -606,12 +601,12 @@ enum {
  *      is not permitted.
  */
 enum rtw_ieee80211_channel_flags {
-	RTW_IEEE80211_CHAN_DISABLED         = 1<<0,
-	RTW_IEEE80211_CHAN_PASSIVE_SCAN     = 1<<1,
-	RTW_IEEE80211_CHAN_NO_IBSS          = 1<<2,
-	RTW_IEEE80211_CHAN_RADAR            = 1<<3,
-	RTW_IEEE80211_CHAN_NO_HT40PLUS      = 1<<4,
-	RTW_IEEE80211_CHAN_NO_HT40MINUS     = 1<<5,
+	RTW_IEEE80211_CHAN_DISABLED         = 1 << 0,
+	RTW_IEEE80211_CHAN_PASSIVE_SCAN     = 1 << 1,
+	RTW_IEEE80211_CHAN_NO_IBSS          = 1 << 2,
+	RTW_IEEE80211_CHAN_RADAR            = 1 << 3,
+	RTW_IEEE80211_CHAN_NO_HT40PLUS      = 1 << 4,
+	RTW_IEEE80211_CHAN_NO_HT40MINUS     = 1 << 5,
 };
 
 #define RTW_IEEE80211_CHAN_NO_HT40	  \
@@ -690,7 +685,8 @@ enum parse_result rtw_ieee802_11_parse_elems(u8 *start, uint len,
 					     struct rtw_ieee802_11_elems *elems,
 					     int show_errors);
 
-u8 *rtw_set_fixed_ie(unsigned char *pbuf, unsigned int len, unsigned char *source, unsigned int *frlen);
+u8 *rtw_set_fixed_ie(unsigned char *pbuf, unsigned int len, unsigned char *source,
+		     unsigned int *frlen);
 u8 *rtw_set_ie(u8 *pbuf, signed int index, uint len, u8 *source, uint *frlen);
 
 u8 *rtw_get_ie(u8 *pbuf, signed int index, signed int *len, signed int limit);
@@ -704,14 +700,17 @@ unsigned char *rtw_get_wpa2_ie(unsigned char *pie, int *rsn_ie_len, int limit);
 int rtw_get_wpa_cipher_suite(u8 *s);
 int rtw_get_wpa2_cipher_suite(u8 *s);
 int rtw_get_wapi_ie(u8 *in_ie, uint in_len, u8 *wapi_ie, u16 *wapi_len);
-int rtw_parse_wpa_ie(u8 *wpa_ie, int wpa_ie_len, int *group_cipher, int *pairwise_cipher, int *is_8021x);
-int rtw_parse_wpa2_ie(u8 *wpa_ie, int wpa_ie_len, int *group_cipher, int *pairwise_cipher, int *is_8021x);
+int rtw_parse_wpa_ie(u8 *wpa_ie, int wpa_ie_len, int *group_cipher, int *pairwise_cipher,
+		     int *is_8021x);
+int rtw_parse_wpa2_ie(u8 *wpa_ie, int wpa_ie_len, int *group_cipher, int *pairwise_cipher,
+		      int *is_8021x);
 
 void rtw_get_sec_ie(u8 *in_ie, uint in_len, u8 *rsn_ie, u16 *rsn_len, u8 *wpa_ie, u16 *wpa_len);
 
 u8 *rtw_get_wps_ie(u8 *in_ie, uint in_len, u8 *wps_ie, uint *wps_ielen);
 u8 *rtw_get_wps_attr(u8 *wps_ie, uint wps_ielen, u16 target_attr_id, u8 *buf_attr, u32 *len_attr);
-u8 *rtw_get_wps_attr_content(u8 *wps_ie, uint wps_ielen, u16 target_attr_id, u8 *buf_content, uint *len_content);
+u8 *rtw_get_wps_attr_content(u8 *wps_ie, uint wps_ielen, u16 target_attr_id, u8 *buf_content,
+			     uint *len_content);
 
 /**
  * for_each_ie - iterate over continuous IEs
@@ -728,7 +727,6 @@ uint	rtw_get_rateset_len(u8 *rateset);
 struct registry_priv;
 int rtw_generate_ie(struct registry_priv *pregistrypriv);
 
-
 int rtw_get_bit_value_from_ieee_value(u8 val);
 
 bool rtw_is_cckrates_included(u8 *rate);
@@ -741,7 +739,7 @@ void rtw_get_bcn_info(struct wlan_network *pnetwork);
 
 void rtw_macaddr_cfg(struct device *dev, u8 *mac_addr);
 
-u16 rtw_mcs_rate(u8 bw_40MHz, u8 short_GI, unsigned char *MCS_rate);
+u16 rtw_mcs_rate(u8 bw_40mhz, u8 short_GI, unsigned char *MCS_rate);
 
 int rtw_action_frame_parse(const u8 *frame, u32 frame_len, u8 *category, u8 *action);
 const char *action_public_str(u8 action);
-- 
2.43.0

