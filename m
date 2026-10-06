Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F9FA3E3D80
	for <linux-kernel@vger.kernel.org>; Tue,  6 Oct 2026 10:29:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791282575; cv=none; b=RD9caEEGEpIlfw+X7VHxkcrTMoKjiIDXDtpd5dkavrA+z+SobELsEF3k/HSfpDqAvIaM3RJLIt1Q1EDd5OKvmuF2zJ1FZlLyC0bFiAloXXydM2wjg5B3zwVsdxXtE7E286RSCocCTh7aorapt8eQ1q/4nIv+w9GFU/S/FYRF4nU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791282575; c=relaxed/simple;
	bh=i99iDwXNKPvJ2/bfZyMwpoGQdBy6ddEyJ61yKJDXlm8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=dB3gPpFB+8Nkv+RwSj+hU8YMuIv7axrdGWfU+18cxt9BSjGAP8RPQSgR2DWI1XKPpv2ALXmaO8ol4W/fjBmbqPb83IxMEfv4GI8L6b8rdC7ilbOPb+R6QS6bETasvUFw7Wtjrh+vvv/ipSmGLGBELFWIRDk+uitHKg5v4S8kxUo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=INnMmKNr; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="INnMmKNr"
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-8899a204034so273609b3a.2
        for <linux-kernel@vger.kernel.org>; Tue, 06 Oct 2026 03:29:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791282572; x=1791887372; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ejQTknXmryRtldEcKh6bwn+GUOGk2U5C54loj+j7rVA=;
        b=INnMmKNrHDpBDXReK25SngG4CfbBxyADSEUDT+WSzPdkOcBcp87iwxFpj6me/kg9x7
         squXJtgbGl/gj0mb1R+cEzmOwZ03YjsSApQNBe4blBYfMLNQ6SDa4xUvryG851hyyWm1
         dT751XKHbe9mn3Ps1fGB8T1LLTXXrxnh1kJ1Q8pNzjoLeyLaIbOEtj36g7f+krhc2SMs
         pS9i9zkST8hLauF3c4bkYH0GKio6AP8SWtr2MmBhKJYfavpevxT74lbbdI3IaL0NJQq2
         6DjjblH7c/7qU/5cFk8mUwRoFQKTIywfp63NxwREIfHUrIeGoKeMe9y3CfcrQ5StesEL
         /Yxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791282572; x=1791887372;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ejQTknXmryRtldEcKh6bwn+GUOGk2U5C54loj+j7rVA=;
        b=MDrSdxBFeKFRPn7Um3QwCeGW0a6WYlafw46LNux8VCcJf8J6O3rada79025p0LK6Ti
         v8D3cwowd/U3yU+lo87d9MFR+tXBIrT71oWwGg1M7qrafO/VttmZuNZB3sq6i33hwoF2
         OzG0vkXooxKBdFlGeuP6BZvIPKKEV5huXdkQ2+UWuhgtV3ndM74yzxVvRvvubjewukWy
         kpLfbfkVWCTMOxkC3/2tzr4pLgsJhgdsOsgTwHEmgvsFLLWAsoyaxx8grFCkp6WqjNoy
         D2Eeh00gYz2lgyI3X6tOKXVN/gJhFdg31ZnIw1MdxIzpPeMFdmUf5JxDRPMi5Tbm6oed
         7xeA==
X-Forwarded-Encrypted: i=1; AKwUvBzm7ls8L4n0MWHnk9RyqxfDGkwXnwDyxhEvty8/gTHkQThWtdr1kekbfCNHt65EIy+6q59dn3C+CmRo078=@vger.kernel.org
X-Gm-Message-State: AFuF++mYkQlSQUqQQ9wTsfczxWYy2Gv0PmT1t8KpoQVwEJLFn9IqKd16
	gCSylR6LWv5iBpIF6KP2E5gvV5e4jnK+IDZC4u+NGMpJDokkIuI06V3r
X-Gm-Gg: AYBFou1MPdEpMcKB7Zwdl3pN/Td7Swbml2aDBf4didSWDI72fWGTKx5lqLbqa8BJeaL
	z1dWytCjOwp5vPMjVJumaF1TBTpX4uyAqK9GPjFw3xtEs7ekeeROiO7fcHkn5u6TnUHMIyH158U
	FPvoIFzxz5Me84Do4twrwThIaqMYRwSMUiZYiGEBrkwsC8UB+RfYWPj2XTtrerQIRz/K4JuKFV2
	0cNR21zfTONy4crFs/phdoITySRZ6jHpiJJFRvPWqi1cUFnbowLjtg0oz02qBFVlL4UHyiEpMOu
	l8GJTBSaDqxLJf1YBxhJy6oYfCIj+c1N9S8mKX0ud77YvrjaDCJHgK4xB2VXukovnatfK0kEB/F
	R+uqkthjXnyebzkMM8jjsZaUwdUgv0EAEBmtLIX2E4L4g3PiyZ3ILEgFkBdXgmjYbssq/GdPYF3
	C+qyvUGwpBBFdLa+1zfDMyLepDxPYkzH3lhuiPwgCQTeKHuNwh2RAREODEl2hD4tifRJHBtflbh
	g==
X-Received: by 2002:a05:6a00:451b:b0:880:dfaa:a6d5 with SMTP id d2e1a72fcca58-890de7d816cmr764598b3a.33.1791282572189;
        Tue, 06 Oct 2026 03:29:32 -0700 (PDT)
Received: from host ([103.103.208.71])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-890acde961asm574812b3a.61.2026.10.06.03.29.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2026 03:29:31 -0700 (PDT)
From: Pranav Desai <contact.pranavdesai@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Pranav Desai <contact.pranavdesai@gmail.com>
Subject: [PATCH] staging: rtl8723bs: replace uint with unsigned int
Date: Tue,  6 Oct 2026 15:58:46 +0530
Message-ID: <20261006102846.170825-1-contact.pranavdesai@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Linux kernel coding style prefers the use of standard
types like 'unsigned int' instead of the non-standard 'uint'.

Replace all occurrences of 'uint' with 'unsigned int' throughout
the rtl8723bs driver to adhere to the coding style.

Signed-off-by: Pranav Desai <contact.pranavdesai@gmail.com>
---
 .../staging/rtl8723bs/core/rtw_ieee80211.c    | 42 +++++++++----------
 drivers/staging/rtl8723bs/core/rtw_mlme.c     | 26 ++++++------
 drivers/staging/rtl8723bs/core/rtw_mlme_ext.c | 36 ++++++++--------
 drivers/staging/rtl8723bs/core/rtw_security.c | 30 ++++++-------
 .../staging/rtl8723bs/core/rtw_wlan_util.c    | 10 ++---
 drivers/staging/rtl8723bs/core/rtw_xmit.c     |  4 +-
 drivers/staging/rtl8723bs/hal/hal_intf.c      |  8 ++--
 drivers/staging/rtl8723bs/include/hal_intf.h  |  4 +-
 drivers/staging/rtl8723bs/include/ieee80211.h | 22 +++++-----
 drivers/staging/rtl8723bs/include/rtw_mlme.h  | 20 ++++-----
 .../staging/rtl8723bs/include/rtw_mlme_ext.h  | 12 +++---
 .../staging/rtl8723bs/include/rtw_pwrctrl.h   |  4 +-
 drivers/staging/rtl8723bs/include/rtw_recv.h  | 14 +++----
 drivers/staging/rtl8723bs/include/rtw_xmit.h  | 16 +++----
 drivers/staging/rtl8723bs/include/sta_info.h  | 10 ++---
 .../staging/rtl8723bs/include/wlan_bssdef.h   |  2 +-
 drivers/staging/rtl8723bs/os_dep/os_intfs.c   |  6 +--
 17 files changed, 133 insertions(+), 133 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_ieee80211.c b/drivers/staging/rtl8723bs/core/rtw_ieee80211.c
index 2b2383021b9c..9dae115e3435 100644
--- a/drivers/staging/rtl8723bs/core/rtw_ieee80211.c
+++ b/drivers/staging/rtl8723bs/core/rtw_ieee80211.c
@@ -115,9 +115,9 @@ u8 *rtw_set_fixed_ie(unsigned char *pbuf, unsigned int len, unsigned char *sourc
 /*  rtw_set_ie will update frame length */
 u8 *rtw_set_ie(u8 *pbuf,
 	       signed int index,
-	       uint len,
+	       unsigned int len,
 	       u8 *source,
-	       uint *frlen) /* frame length */
+	       unsigned int *frlen) /* frame length */
 {
 	*pbuf = (u8)index;
 
@@ -171,9 +171,9 @@ u8 *rtw_get_ie(u8 *pbuf, signed int index, signed int *len, signed int limit)
  *
  * Returns: The address of the specific IE found, or NULL
  */
-u8 *rtw_get_ie_ex(u8 *in_ie, uint in_len, u8 eid, u8 *oui, u8 oui_len, u8 *ie, uint *ielen)
+u8 *rtw_get_ie_ex(u8 *in_ie, unsigned int in_len, u8 eid, u8 *oui, u8 oui_len, u8 *ie, unsigned int *ielen)
 {
-	uint cnt;
+	unsigned int cnt;
 	u8 *target_ie = NULL;
 
 	if (ielen)
@@ -219,13 +219,13 @@ u8 *rtw_get_ie_ex(u8 *in_ie, uint in_len, u8 eid, u8 *oui, u8 oui_len, u8 *ie, u
  *
  * Returns: _SUCCESS: ies is updated, _FAIL: not updated
  */
-int rtw_ies_remove_ie(u8 *ies, uint *ies_len, uint offset, u8 eid, u8 *oui, u8 oui_len)
+int rtw_ies_remove_ie(u8 *ies, unsigned int *ies_len, unsigned int offset, u8 eid, u8 *oui, u8 oui_len)
 {
 	int ret = _FAIL;
 	u8 *target_ie;
 	u32 target_ielen;
 	u8 *start;
-	uint search_len;
+	unsigned int search_len;
 
 	if (!ies || !ies_len || *ies_len <= offset)
 		goto exit;
@@ -237,7 +237,7 @@ int rtw_ies_remove_ie(u8 *ies, uint *ies_len, uint offset, u8 eid, u8 *oui, u8 o
 		target_ie = rtw_get_ie_ex(start, search_len, eid, oui, oui_len, NULL, &target_ielen);
 		if (target_ie && target_ielen) {
 			u8 *remain_ies = target_ie + target_ielen;
-			uint remain_len = search_len - (remain_ies - start);
+			unsigned int remain_len = search_len - (remain_ies - start);
 
 			memcpy(target_ie, remain_ies, remain_len);
 			*ies_len = *ies_len - target_ielen;
@@ -253,7 +253,7 @@ int rtw_ies_remove_ie(u8 *ies, uint *ies_len, uint offset, u8 eid, u8 *oui, u8 o
 	return ret;
 }
 
-void rtw_set_supported_rate(u8 *supported_rates, uint mode)
+void rtw_set_supported_rate(u8 *supported_rates, unsigned int mode)
 {
 	memset(supported_rates, 0, NDIS_802_11_LENGTH_RATES_EX);
 
@@ -276,9 +276,9 @@ void rtw_set_supported_rate(u8 *supported_rates, uint mode)
 	}
 }
 
-uint rtw_get_rateset_len(u8 *rateset)
+unsigned int rtw_get_rateset_len(u8 *rateset)
 {
-	uint i;
+	unsigned int i;
 
 	for (i = 0; i < 13; i++)
 		if (rateset[i] == 0)
@@ -564,11 +564,11 @@ int rtw_parse_wpa2_ie(u8 *rsn_ie, int rsn_ie_len, int *group_cipher, int *pairwi
 	return ret;
 }
 
-int rtw_get_wapi_ie(u8 *in_ie, uint in_len, u8 *wapi_ie, u16 *wapi_len)
+int rtw_get_wapi_ie(u8 *in_ie, unsigned int in_len, u8 *wapi_ie, u16 *wapi_len)
 {
 	int len = 0;
 	u8 authmode;
-	uint	cnt;
+	unsigned int	cnt;
 	u8 wapi_oui1[4] = {0x0, 0x14, 0x72, 0x01};
 	u8 wapi_oui2[4] = {0x0, 0x14, 0x72, 0x02};
 
@@ -607,11 +607,11 @@ int rtw_get_wapi_ie(u8 *in_ie, uint in_len, u8 *wapi_ie, u16 *wapi_len)
 	return len;
 }
 
-void rtw_get_sec_ie(u8 *in_ie, uint in_len, u8 *rsn_ie, u16 *rsn_len, u8 *wpa_ie, u16 *wpa_len)
+void rtw_get_sec_ie(u8 *in_ie, unsigned int in_len, u8 *rsn_ie, u16 *rsn_len, u8 *wpa_ie, u16 *wpa_len)
 {
 	u8 authmode;
 	u8 wpa_oui[4] = {0x0, 0x50, 0xf2, 0x01};
-	uint	cnt;
+	unsigned int	cnt;
 
 	/* Search required WPA or WPA2 IE and copy to sec_ie[ ] */
 
@@ -651,9 +651,9 @@ void rtw_get_sec_ie(u8 *in_ie, uint in_len, u8 *rsn_ie, u16 *rsn_len, u8 *wpa_ie
  *
  * Returns: The address of the WPS IE found, or NULL
  */
-u8 *rtw_get_wps_ie(u8 *in_ie, uint in_len, u8 *wps_ie, uint *wps_ielen)
+u8 *rtw_get_wps_ie(u8 *in_ie, unsigned int in_len, u8 *wps_ie, unsigned int *wps_ielen)
 {
-	uint cnt;
+	unsigned int cnt;
 	u8 *wpsie_ptr = NULL;
 	u8 eid, wps_oui[4] = {0x0, 0x50, 0xf2, 0x04};
 
@@ -704,7 +704,7 @@ u8 *rtw_get_wps_ie(u8 *in_ie, uint in_len, u8 *wps_ie, uint *wps_ielen)
  *
  * Returns: the address of the specific WPS attribute found, or NULL
  */
-u8 *rtw_get_wps_attr(u8 *wps_ie, uint wps_ielen, u16 target_attr_id, u8 *buf_attr, u32 *len_attr)
+u8 *rtw_get_wps_attr(u8 *wps_ie, unsigned int wps_ielen, u16 target_attr_id, u8 *buf_attr, u32 *len_attr)
 {
 	u8 *attr_ptr = NULL;
 	u8 *target_attr_ptr = NULL;
@@ -763,7 +763,7 @@ u8 *rtw_get_wps_attr(u8 *wps_ie, uint wps_ielen, u16 target_attr_id, u8 *buf_att
  *
  * Returns: the address of the specific WPS attribute content found, or NULL
  */
-u8 *rtw_get_wps_attr_content(u8 *wps_ie, uint wps_ielen, u16 target_attr_id, u8 *buf_content, uint *len_content)
+u8 *rtw_get_wps_attr_content(u8 *wps_ie, unsigned int wps_ielen, u16 target_attr_id, u8 *buf_content, unsigned int *len_content)
 {
 	u8 *attr_ptr;
 	u32 attr_len;
@@ -786,7 +786,7 @@ u8 *rtw_get_wps_attr_content(u8 *wps_ie, uint wps_ielen, u16 target_attr_id, u8
 	return NULL;
 }
 
-static int rtw_ieee802_11_parse_vendor_specific(u8 *pos, uint elen,
+static int rtw_ieee802_11_parse_vendor_specific(u8 *pos, unsigned int elen,
 					    struct rtw_ieee802_11_elems *elems,
 					    int show_errors)
 {
@@ -870,11 +870,11 @@ static int rtw_ieee802_11_parse_vendor_specific(u8 *pos, uint elen,
  * @show_errors: Whether to show parsing errors in debug log
  * Returns: Parsing result
  */
-enum parse_result rtw_ieee802_11_parse_elems(u8 *start, uint len,
+enum parse_result rtw_ieee802_11_parse_elems(u8 *start, unsigned int len,
 					     struct rtw_ieee802_11_elems *elems,
 					     int show_errors)
 {
-	uint left = len;
+	unsigned int left = len;
 	u8 *pos = start;
 	int unknown = 0;
 
diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme.c b/drivers/staging/rtl8723bs/core/rtw_mlme.c
index 0d0602eb4808..4463fa21cf25 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme.c
@@ -588,7 +588,7 @@ static bool rtw_is_desired_network(struct adapter *adapter, struct wlan_network
 	struct mlme_priv *mlme_priv = &adapter->mlmepriv;
 	u32 desired_encmode;
 	u32 privacy;
-	uint wps_ielen;
+	unsigned int wps_ielen;
 	bool bselected = true;
 
 	desired_encmode = psecuritypriv->ndisencryptstatus;
@@ -605,7 +605,7 @@ static bool rtw_is_desired_network(struct adapter *adapter, struct wlan_network
 
 	if (adapter->registrypriv.wifi_spec == 1) { /* for  correct flow of 8021X  to do.... */
 		u8 *p = NULL;
-		uint ie_len = 0;
+		unsigned int ie_len = 0;
 
 		if ((desired_encmode == Ndis802_11EncryptionDisabled) && (privacy != 0))
 			bselected = false;
@@ -1328,7 +1328,7 @@ void rtw_stassoc_event_callback(struct adapter *adapter, u8 *buf)
 
 	/* to do : init sta_info variable */
 	psta->qos_option = 0;
-	psta->mac_id = (uint)pstassoc->cam_id;
+	psta->mac_id = (unsigned int)pstassoc->cam_id;
 
 	/* for ad-hoc mode */
 	rtw_hal_set_odm_var(adapter, HAL_ODM_STA_INFO, psta, true);
@@ -1949,7 +1949,7 @@ signed int rtw_set_key(struct adapter *adapter, struct security_priv *psecurityp
 }
 
 /* adjust ies for rtw_joinbss_cmd in WMM */
-int rtw_restruct_wmm_ie(struct adapter *adapter, u8 *in_ie, u8 *out_ie, uint in_len, uint initial_out_len)
+int rtw_restruct_wmm_ie(struct adapter *adapter, u8 *in_ie, u8 *out_ie, unsigned int in_len, unsigned int initial_out_len)
 {
 	unsigned int ielength = 0;
 	unsigned int i, j;
@@ -2010,7 +2010,7 @@ static int SecIsInPMKIDList(struct adapter *Adapter, u8 *bssid)
 /*  12th element in the array is the IE */
 /*  13th element in the array is the IE length */
 
-static int rtw_append_pmkid(struct adapter *Adapter, int pmkid_idx, u8 *ie, uint ie_len)
+static int rtw_append_pmkid(struct adapter *Adapter, int pmkid_idx, u8 *ie, unsigned int ie_len)
 {
 	struct security_priv *psecuritypriv = &Adapter->securitypriv;
 
@@ -2029,7 +2029,7 @@ static int rtw_append_pmkid(struct adapter *Adapter, int pmkid_idx, u8 *ie, uint
 
 static void rtw_report_sec_ie(struct adapter *adapter, u8 authmode, u8 *sec_ie)
 {
-	uint len;
+	unsigned int len;
 	u8 *buff, *p;
 	union iwreq_data wrqu;
 
@@ -2060,15 +2060,15 @@ static void rtw_report_sec_ie(struct adapter *adapter, u8 authmode, u8 *sec_ie)
 	}
 }
 
-signed int rtw_restruct_sec_ie(struct adapter *adapter, u8 *in_ie, u8 *out_ie, uint in_len)
+signed int rtw_restruct_sec_ie(struct adapter *adapter, u8 *in_ie, u8 *out_ie, unsigned int in_len)
 {
 	u8 authmode = 0x0;
-	uint ielength;
+	unsigned int ielength;
 	int pmkid_idx;
 
 	struct mlme_priv *mlme_priv = &adapter->mlmepriv;
 	struct security_priv *psecuritypriv = &adapter->securitypriv;
-	uint ndisauthmode = psecuritypriv->ndisauthtype;
+	unsigned int ndisauthmode = psecuritypriv->ndisauthtype;
 
 	/* copy fixed ie only */
 	memcpy(out_ie, in_ie, 12);
@@ -2230,7 +2230,7 @@ void rtw_ht_use_default_setting(struct adapter *adapter)
 		SET_FLAG(ht_priv->beamform_cap, BEAMFORMING_HT_BEAMFORMEE_ENABLE);
 }
 
-void rtw_build_wmm_ie_ht(struct adapter *adapter, u8 *out_ie, uint *pout_len)
+void rtw_build_wmm_ie_ht(struct adapter *adapter, u8 *out_ie, unsigned int *pout_len)
 {
 	unsigned char WMM_IE[] = {0x00, 0x50, 0xf2, 0x02, 0x00, 0x01, 0x00};
 	int out_len;
@@ -2245,7 +2245,7 @@ void rtw_build_wmm_ie_ht(struct adapter *adapter, u8 *out_ie, uint *pout_len)
 }
 
 /* the function is >= passive_level */
-unsigned int rtw_restructure_ht_ie(struct adapter *adapter, u8 *in_ie, u8 *out_ie, uint in_len, uint *pout_len, u8 channel)
+unsigned int rtw_restructure_ht_ie(struct adapter *adapter, u8 *in_ie, u8 *out_ie, unsigned int in_len, unsigned int *pout_len, u8 channel)
 {
 	u32 ielen, out_len;
 	enum ieee80211_max_ampdu_length_exp max_rx_ampdu_factor;
@@ -2369,7 +2369,7 @@ unsigned int rtw_restructure_ht_ie(struct adapter *adapter, u8 *in_ie, u8 *out_i
 }
 
 /* the function is > passive_level (in critical_section) */
-void rtw_update_ht_cap(struct adapter *adapter, u8 *pie, uint ie_len, u8 channel)
+void rtw_update_ht_cap(struct adapter *adapter, u8 *pie, unsigned int ie_len, u8 channel)
 {
 	u8 *p, max_ampdu_sz;
 	int len;
@@ -2487,7 +2487,7 @@ void rtw_issue_addbareq_cmd(struct adapter *adapter, struct xmit_frame *pxmitfra
 	}
 }
 
-void rtw_append_exented_cap(struct adapter *adapter, u8 *out_ie, uint *pout_len)
+void rtw_append_exented_cap(struct adapter *adapter, u8 *out_ie, unsigned int *pout_len)
 {
 	struct mlme_priv *mlme_priv = &adapter->mlmepriv;
 	struct ht_priv *ht_priv = &mlme_priv->htpriv;
diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
index 80194796a9f7..698760ac4419 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
@@ -499,7 +499,7 @@ unsigned int OnProbeReq(struct adapter *padapter, union recv_frame *precv_frame)
 	struct mlme_ext_info *pmlmeinfo = &pmlmeext->mlmext_info;
 	struct wlan_bssid_ex	*cur = &pmlmeinfo->network;
 	u8 *pframe = precv_frame->u.hdr.rx_data;
-	uint len = precv_frame->u.hdr.len;
+	unsigned int len = precv_frame->u.hdr.len;
 	u8 is_valid_p2p_probereq = false;
 
 	if (check_fwstate(pmlmepriv, WIFI_STATION_STATE))
@@ -554,7 +554,7 @@ unsigned int OnBeacon(struct adapter *padapter, union recv_frame *precv_frame)
 	struct mlme_priv *pmlmepriv = &padapter->mlmepriv;
 	struct sta_priv *pstapriv = &padapter->stapriv;
 	u8 *pframe = precv_frame->u.hdr.rx_data;
-	uint len = precv_frame->u.hdr.len;
+	unsigned int len = precv_frame->u.hdr.len;
 	struct wlan_bssid_ex *pbss;
 	int ret = _SUCCESS;
 	u8 *p = NULL;
@@ -673,7 +673,7 @@ unsigned int OnAuth(struct adapter *padapter, union recv_frame *precv_frame)
 	struct mlme_ext_priv *pmlmeext = &padapter->mlmeextpriv;
 	struct mlme_ext_info *pmlmeinfo = &pmlmeext->mlmext_info;
 	u8 *pframe = precv_frame->u.hdr.rx_data;
-	uint len = precv_frame->u.hdr.len;
+	unsigned int len = precv_frame->u.hdr.len;
 	u8 offset = 0;
 
 	if ((pmlmeinfo->state & 0x03) != WIFI_FW_AP_STATE)
@@ -845,7 +845,7 @@ unsigned int OnAuthClient(struct adapter *padapter, union recv_frame *precv_fram
 	struct mlme_ext_priv *pmlmeext = &padapter->mlmeextpriv;
 	struct mlme_ext_info *pmlmeinfo = &pmlmeext->mlmext_info;
 	u8 *pframe = precv_frame->u.hdr.rx_data;
-	uint pkt_len = precv_frame->u.hdr.len;
+	unsigned int pkt_len = precv_frame->u.hdr.len;
 
 	/* check A1 matches or not */
 	if (memcmp(myid(&(padapter->eeprompriv)), get_da(pframe), ETH_ALEN))
@@ -930,7 +930,7 @@ unsigned int OnAssocReq(struct adapter *padapter, union recv_frame *precv_frame)
 	struct wlan_bssid_ex	*cur = &(pmlmeinfo->network);
 	struct sta_priv *pstapriv = &padapter->stapriv;
 	u8 *pframe = precv_frame->u.hdr.rx_data;
-	uint pkt_len = precv_frame->u.hdr.len;
+	unsigned int pkt_len = precv_frame->u.hdr.len;
 
 	if ((pmlmeinfo->state & 0x03) != WIFI_FW_AP_STATE)
 		return _FAIL;
@@ -1319,7 +1319,7 @@ unsigned int OnAssocReq(struct adapter *padapter, union recv_frame *precv_frame)
 
 unsigned int OnAssocRsp(struct adapter *padapter, union recv_frame *precv_frame)
 {
-	uint i;
+	unsigned int i;
 	int res;
 	unsigned short	status;
 	struct ndis_80211_var_ie *pIE;
@@ -1327,7 +1327,7 @@ unsigned int OnAssocRsp(struct adapter *padapter, union recv_frame *precv_frame)
 	struct mlme_ext_priv *pmlmeext = &padapter->mlmeextpriv;
 	struct mlme_ext_info *pmlmeinfo = &pmlmeext->mlmext_info;
 	u8 *pframe = precv_frame->u.hdr.rx_data;
-	uint pkt_len = precv_frame->u.hdr.len;
+	unsigned int pkt_len = precv_frame->u.hdr.len;
 
 	/* check A1 matches or not */
 	if (memcmp(myid(&(padapter->eeprompriv)), get_da(pframe), ETH_ALEN))
@@ -1718,7 +1718,7 @@ static unsigned int on_action_public_default(union recv_frame *precv_frame, u8 a
 {
 	unsigned int ret = _FAIL;
 	u8 *pframe = precv_frame->u.hdr.rx_data;
-	uint frame_len = precv_frame->u.hdr.len;
+	unsigned int frame_len = precv_frame->u.hdr.len;
 	u8 *frame_body = pframe + sizeof(struct ieee80211_hdr_3addr);
 	u8 token;
 	struct adapter *adapter = precv_frame->u.hdr.adapter;
@@ -2089,7 +2089,7 @@ void issue_beacon(struct adapter *padapter, int timeout_ms)
 
 		{
 			u8 *wps_ie;
-			uint wps_ielen;
+			unsigned int wps_ielen;
 			u8 sr = 0;
 
 			wps_ie = rtw_get_wps_ie(pmgntframe->buf_addr + TXDESC_OFFSET +
@@ -2188,7 +2188,7 @@ void issue_probersp(struct adapter *padapter, unsigned char *da, u8 is_valid_p2p
 	struct xmit_priv *pxmitpriv = &(padapter->xmitpriv);
 
 	u8 *pwps_ie;
-	uint wps_ielen;
+	unsigned int wps_ielen;
 	struct mlme_priv *pmlmepriv = &padapter->mlmepriv;
 	struct mlme_ext_priv *pmlmeext = &(padapter->mlmeextpriv);
 	struct mlme_ext_info *pmlmeinfo = &pmlmeext->mlmext_info;
@@ -2241,10 +2241,10 @@ void issue_probersp(struct adapter *padapter, unsigned char *da, u8 is_valid_p2p
 
 		/* inerset & update wps_probe_resp_ie */
 		if (pmlmepriv->wps_probe_resp_ie && pwps_ie && wps_ielen > 0) {
-			uint wps_offset, remainder_ielen;
+			unsigned int wps_offset, remainder_ielen;
 			u8 *premainder_ie;
 
-			wps_offset = (uint)(pwps_ie - cur_network->ies);
+			wps_offset = (unsigned int)(pwps_ie - cur_network->ies);
 
 			premainder_ie = pwps_ie + wps_ielen;
 
@@ -2254,7 +2254,7 @@ void issue_probersp(struct adapter *padapter, unsigned char *da, u8 is_valid_p2p
 			pframe += wps_offset;
 			pattrib->pktlen += wps_offset;
 
-			wps_ielen = (uint)pmlmepriv->wps_probe_resp_ie[1];/* to get ie data len */
+			wps_ielen = (unsigned int)pmlmepriv->wps_probe_resp_ie[1];/* to get ie data len */
 			if ((wps_offset + wps_ielen + 2) <= MAX_IE_SZ) {
 				memcpy(pframe, pmlmepriv->wps_probe_resp_ie, wps_ielen + 2);
 				pframe += wps_ielen + 2;
@@ -2294,7 +2294,7 @@ void issue_probersp(struct adapter *padapter, unsigned char *da, u8 is_valid_p2p
 			ssid_ielen_diff = cur_network->ssid.ssid_length - ssid_ielen;
 
 			if (ssid_ie &&  cur_network->ssid.ssid_length) {
-				uint remainder_ielen;
+				unsigned int remainder_ielen;
 				u8 *remainder_ie;
 
 				remainder_ie = ssid_ie + 2;
@@ -2647,7 +2647,7 @@ void issue_asocrsp(struct adapter *padapter, unsigned short status, struct sta_i
 	}
 
 	if ((pstat->flags & WLAN_STA_HT) && (pmlmepriv->htpriv.ht_option)) {
-		uint ie_len = 0;
+		unsigned int ie_len = 0;
 
 		/* FILL HT CAP INFO IE */
 		pbuf = rtw_get_ie(ie + _BEACON_IE_OFFSET_, WLAN_EID_HT_CAPABILITY, &ie_len, (pnetwork->ie_length - _BEACON_IE_OFFSET_));
@@ -2668,7 +2668,7 @@ void issue_asocrsp(struct adapter *padapter, unsigned short status, struct sta_i
 
 	/* FILL WMM IE */
 	if ((pstat->flags & WLAN_STA_WME) && (pmlmepriv->qospriv.qos_option)) {
-		uint ie_len = 0;
+		unsigned int ie_len = 0;
 		unsigned char WMM_PARA_IE[] = {0x00, 0x50, 0xf2, 0x02, 0x01, 0x01};
 
 		for (pbuf = ie + _BEACON_IE_OFFSET_; ; pbuf += (ie_len + 2)) {
@@ -5558,14 +5558,14 @@ u8 mlme_evt_hdl(struct adapter *padapter, unsigned char *pbuf)
 {
 	u8 evt_code;
 	u16 evt_sz;
-	uint	*peventbuf;
+	unsigned int	*peventbuf;
 	void (*event_callback)(struct adapter *dev, u8 *pbuf);
 	struct evt_priv *pevt_priv = &(padapter->evtpriv);
 
 	if (!pbuf)
 		goto _abort_event_;
 
-	peventbuf = (uint *)pbuf;
+	peventbuf = (unsigned int *)pbuf;
 	evt_sz = (u16)(*peventbuf & 0xffff);
 	evt_code = (u8)((*peventbuf >> 16) & 0xff);
 
diff --git a/drivers/staging/rtl8723bs/core/rtw_security.c b/drivers/staging/rtl8723bs/core/rtw_security.c
index 72af46391e23..05f1038aef51 100644
--- a/drivers/staging/rtl8723bs/core/rtw_security.c
+++ b/drivers/staging/rtl8723bs/core/rtw_security.c
@@ -631,9 +631,9 @@ static void construct_mic_iv(u8 *mic_iv,
 			     signed int qc_exists,
 			     signed int a4_exists,
 			     u8 *mpdu,
-			     uint payload_length,
+			     unsigned int payload_length,
 			     u8 *pn_vector,
-			     uint frtype)
+			     unsigned int frtype)
 {
 		signed int i;
 
@@ -669,7 +669,7 @@ static void construct_mic_iv(u8 *mic_iv,
 static void construct_mic_header1(u8 *mic_header1,
 				  signed int header_length,
 				  u8 *mpdu,
-				  uint frtype)
+				  unsigned int frtype)
 {
 		mic_header1[0] = (u8)((header_length - 2) / 256);
 		mic_header1[1] = (u8)((header_length - 2) % 256);
@@ -752,7 +752,7 @@ static void construct_ctr_preload(u8 *ctr_preload,
 				  u8 *mpdu,
 				  u8 *pn_vector,
 				  signed int c,
-				  uint frtype)
+				  unsigned int frtype)
 {
 	signed int i = 0;
 
@@ -780,10 +780,10 @@ static void construct_ctr_preload(u8 *ctr_preload,
 	ctr_preload[15] = (unsigned char)(c % 256);
 }
 
-static signed int aes_cipher(u8 *key, uint hdrlen,
-			     u8 *pframe, uint plen)
+static signed int aes_cipher(u8 *key, unsigned int hdrlen,
+			     u8 *pframe, unsigned int plen)
 {
-	uint	qc_exists, a4_exists, i, j, payload_remainder,
+	unsigned int	qc_exists, a4_exists, i, j, payload_remainder,
 		num_blocks, payload_index;
 
 	u8 pn_vector[6];
@@ -797,8 +797,8 @@ static signed int aes_cipher(u8 *key, uint hdrlen,
 	u8 aes_out[16] = {};
 	u8 padded_buffer[16] = {};
 	u8 mic[8];
-	uint	frtype  = GetFrameType(pframe);
-	uint	frsubtype  = GetFrameSubType(pframe);
+	unsigned int	frtype  = GetFrameType(pframe);
+	unsigned int	frsubtype  = GetFrameSubType(pframe);
 
 	frsubtype = frsubtype >> 4;
 
@@ -980,11 +980,11 @@ u32 rtw_aes_encrypt(struct adapter *padapter, u8 *pxmitframe)
 	return res;
 }
 
-static signed int aes_decipher(u8 *key, uint hdrlen,
-			       u8 *pframe, uint plen)
+static signed int aes_decipher(u8 *key, unsigned int hdrlen,
+			       u8 *pframe, unsigned int plen)
 {
 	static u8 message[MAX_MSG_SIZE];
-	uint qc_exists, a4_exists, i, j, payload_remainder,
+	unsigned int qc_exists, a4_exists, i, j, payload_remainder,
 			num_blocks, payload_index;
 	signed int res = _SUCCESS;
 	u8 pn_vector[6];
@@ -999,8 +999,8 @@ static signed int aes_decipher(u8 *key, uint hdrlen,
 	u8 padded_buffer[16] = {};
 	u8 mic[8];
 
-	uint frtype  = GetFrameType(pframe);
-	uint frsubtype  = GetFrameSubType(pframe);
+	unsigned int frtype  = GetFrameType(pframe);
+	unsigned int frsubtype  = GetFrameSubType(pframe);
 
 	frsubtype = frsubtype >> 4;
 
@@ -1266,7 +1266,7 @@ u32 rtw_BIP_verify(struct adapter *padapter, u8 *precvframe)
 	u8 *pframe;
 	u8 *BIP_AAD, *p;
 	u32 res = _FAIL;
-	uint len, ori_len;
+	unsigned int len, ori_len;
 	struct ieee80211_hdr *pwlanhdr;
 	u8 mic[16];
 	struct mlme_ext_priv *pmlmeext = &padapter->mlmeextpriv;
diff --git a/drivers/staging/rtl8723bs/core/rtw_wlan_util.c b/drivers/staging/rtl8723bs/core/rtw_wlan_util.c
index 9feab9ab7545..97f93fd9b1a2 100644
--- a/drivers/staging/rtl8723bs/core/rtw_wlan_util.c
+++ b/drivers/staging/rtl8723bs/core/rtw_wlan_util.c
@@ -1248,7 +1248,7 @@ int rtw_check_bcn_info(struct adapter *Adapter, u8 *pframe, u32 packet_len)
 	return _SUCCESS;
 }
 
-void update_beacon_info(struct adapter *padapter, u8 *pframe, uint pkt_len, struct sta_info *psta)
+void update_beacon_info(struct adapter *padapter, u8 *pframe, unsigned int pkt_len, struct sta_info *psta)
 {
 	unsigned int i;
 	unsigned int len;
@@ -1401,7 +1401,7 @@ static u32 get_realtek_assoc_AP_vender(struct ndis_80211_var_ie *pIE)
 	return Vender;
 }
 
-unsigned char check_assoc_AP(u8 *pframe, uint len)
+unsigned char check_assoc_AP(u8 *pframe, unsigned int len)
 {
 	unsigned int	i;
 	struct ndis_80211_var_ie *pIE;
@@ -1565,7 +1565,7 @@ void update_sta_basic_rate(struct sta_info *psta, u8 wireless_mode)
 	}
 }
 
-int update_sta_support_rate(struct adapter *padapter, u8 *pvar_ie, uint var_ie_len, int cam_idx)
+int update_sta_support_rate(struct adapter *padapter, u8 *pvar_ie, unsigned int var_ie_len, int cam_idx)
 {
 	unsigned int	ie_len;
 	struct ndis_80211_var_ie *pIE;
@@ -1613,7 +1613,7 @@ void process_addba_req(struct adapter *padapter, u8 *paddba_req, u8 *addr)
 	}
 }
 
-void update_TSF(struct mlme_ext_priv *pmlmeext, u8 *pframe, uint len)
+void update_TSF(struct mlme_ext_priv *pmlmeext, u8 *pframe, unsigned int len)
 {
 	u8 *pIE;
 	__le32 *pbuf;
@@ -1633,7 +1633,7 @@ void correct_TSF(struct adapter *padapter, struct mlme_ext_priv *pmlmeext)
 	rtw_hal_set_hwreg(padapter, HW_VAR_CORRECT_TSF, NULL);
 }
 
-void adaptive_early_32k(struct mlme_ext_priv *pmlmeext, u8 *pframe, uint len)
+void adaptive_early_32k(struct mlme_ext_priv *pmlmeext, u8 *pframe, unsigned int len)
 {
 	int i;
 	u8 *pIE;
diff --git a/drivers/staging/rtl8723bs/core/rtw_xmit.c b/drivers/staging/rtl8723bs/core/rtw_xmit.c
index 57b3690bc48a..87e312b0ab26 100644
--- a/drivers/staging/rtl8723bs/core/rtw_xmit.c
+++ b/drivers/staging/rtl8723bs/core/rtw_xmit.c
@@ -1376,9 +1376,9 @@ s32 rtw_put_snap(u8 *data, u16 h_proto)
 	return SNAP_SIZE + sizeof(u16);
 }
 
-void rtw_update_protection(struct adapter *padapter, u8 *ie, uint ie_len)
+void rtw_update_protection(struct adapter *padapter, u8 *ie, unsigned int ie_len)
 {
-	uint	protection;
+	unsigned int	protection;
 	u8 *perp;
 	signed int	 erp_len;
 	struct	xmit_priv *pxmitpriv = &padapter->xmitpriv;
diff --git a/drivers/staging/rtl8723bs/hal/hal_intf.c b/drivers/staging/rtl8723bs/hal/hal_intf.c
index 1443875d1369..67b21b777b44 100644
--- a/drivers/staging/rtl8723bs/hal/hal_intf.c
+++ b/drivers/staging/rtl8723bs/hal/hal_intf.c
@@ -27,9 +27,9 @@ static void rtw_hal_init_opmode(struct adapter *padapter)
 	rtw_setopmode_cmd(padapter, networkType, false);
 }
 
-uint rtw_hal_init(struct adapter *padapter)
+unsigned int rtw_hal_init(struct adapter *padapter)
 {
-	uint status;
+	unsigned int status;
 	struct dvobj_priv *dvobj = adapter_to_dvobj(padapter);
 
 	status = rtl8723bs_hal_init(padapter);
@@ -54,9 +54,9 @@ uint rtw_hal_init(struct adapter *padapter)
 	return status;
 }
 
-uint rtw_hal_deinit(struct adapter *padapter)
+unsigned int rtw_hal_deinit(struct adapter *padapter)
 {
-	uint status = _SUCCESS;
+	unsigned int status = _SUCCESS;
 	struct dvobj_priv *dvobj = adapter_to_dvobj(padapter);
 
 	status = rtl8723bs_hal_deinit(padapter);
diff --git a/drivers/staging/rtl8723bs/include/hal_intf.h b/drivers/staging/rtl8723bs/include/hal_intf.h
index 7b63116525ca..b43a9c86a436 100644
--- a/drivers/staging/rtl8723bs/include/hal_intf.h
+++ b/drivers/staging/rtl8723bs/include/hal_intf.h
@@ -175,8 +175,8 @@ typedef s32 (*c2h_id_filter)(u8 *c2h_evt);
 #define	RX_PNOWakeUp			0x55
 #define	AP_WakeUp			0x66
 
-uint rtw_hal_init(struct adapter *padapter);
-uint rtw_hal_deinit(struct adapter *padapter);
+unsigned int rtw_hal_init(struct adapter *padapter);
+unsigned int rtw_hal_deinit(struct adapter *padapter);
 void rtw_hal_stop(struct adapter *padapter);
 void rtw_hal_set_hwreg(struct adapter *padapter, u8 variable, u8 *val);
 void rtw_hal_get_hwreg(struct adapter *padapter, u8 variable, u8 *val);
diff --git a/drivers/staging/rtl8723bs/include/ieee80211.h b/drivers/staging/rtl8723bs/include/ieee80211.h
index 9767013887af..e21a10d4c1ec 100644
--- a/drivers/staging/rtl8723bs/include/ieee80211.h
+++ b/drivers/staging/rtl8723bs/include/ieee80211.h
@@ -675,32 +675,32 @@ enum parse_result {
 	PARSE_FAILED = -1
 };
 
-enum parse_result rtw_ieee802_11_parse_elems(u8 *start, uint len,
+enum parse_result rtw_ieee802_11_parse_elems(u8 *start, unsigned int len,
 					     struct rtw_ieee802_11_elems *elems,
 					     int show_errors);
 
 u8 *rtw_set_fixed_ie(unsigned char *pbuf, unsigned int len, unsigned char *source, unsigned int *frlen);
-u8 *rtw_set_ie(u8 *pbuf, signed int index, uint len, u8 *source, uint *frlen);
+u8 *rtw_set_ie(u8 *pbuf, signed int index, unsigned int len, u8 *source, unsigned int *frlen);
 
 u8 *rtw_get_ie(u8 *pbuf, signed int index, signed int *len, signed int limit);
-u8 *rtw_get_ie_ex(u8 *in_ie, uint in_len, u8 eid, u8 *oui, u8 oui_len, u8 *ie, uint *ielen);
-int rtw_ies_remove_ie(u8 *ies, uint *ies_len, uint offset, u8 eid, u8 *oui, u8 oui_len);
+u8 *rtw_get_ie_ex(u8 *in_ie, unsigned int in_len, u8 eid, u8 *oui, u8 oui_len, u8 *ie, unsigned int *ielen);
+int rtw_ies_remove_ie(u8 *ies, unsigned int *ies_len, unsigned int offset, u8 eid, u8 *oui, u8 oui_len);
 
-void rtw_set_supported_rate(u8 *SupportedRates, uint mode);
+void rtw_set_supported_rate(u8 *SupportedRates, unsigned int mode);
 
 unsigned char *rtw_get_wpa_ie(unsigned char *pie, int *wpa_ie_len, int limit);
 unsigned char *rtw_get_wpa2_ie(unsigned char *pie, int *rsn_ie_len, int limit);
 int rtw_get_wpa_cipher_suite(u8 *s);
 int rtw_get_wpa2_cipher_suite(u8 *s);
-int rtw_get_wapi_ie(u8 *in_ie, uint in_len, u8 *wapi_ie, u16 *wapi_len);
+int rtw_get_wapi_ie(u8 *in_ie, unsigned int in_len, u8 *wapi_ie, u16 *wapi_len);
 int rtw_parse_wpa_ie(u8 *wpa_ie, int wpa_ie_len, int *group_cipher, int *pairwise_cipher, int *is_8021x);
 int rtw_parse_wpa2_ie(u8 *wpa_ie, int wpa_ie_len, int *group_cipher, int *pairwise_cipher, int *is_8021x);
 
-void rtw_get_sec_ie(u8 *in_ie, uint in_len, u8 *rsn_ie, u16 *rsn_len, u8 *wpa_ie, u16 *wpa_len);
+void rtw_get_sec_ie(u8 *in_ie, unsigned int in_len, u8 *rsn_ie, u16 *rsn_len, u8 *wpa_ie, u16 *wpa_len);
 
-u8 *rtw_get_wps_ie(u8 *in_ie, uint in_len, u8 *wps_ie, uint *wps_ielen);
-u8 *rtw_get_wps_attr(u8 *wps_ie, uint wps_ielen, u16 target_attr_id, u8 *buf_attr, u32 *len_attr);
-u8 *rtw_get_wps_attr_content(u8 *wps_ie, uint wps_ielen, u16 target_attr_id, u8 *buf_content, uint *len_content);
+u8 *rtw_get_wps_ie(u8 *in_ie, unsigned int in_len, u8 *wps_ie, unsigned int *wps_ielen);
+u8 *rtw_get_wps_attr(u8 *wps_ie, unsigned int wps_ielen, u16 target_attr_id, u8 *buf_attr, u32 *len_attr);
+u8 *rtw_get_wps_attr_content(u8 *wps_ie, unsigned int wps_ielen, u16 target_attr_id, u8 *buf_content, unsigned int *len_content);
 
 /**
  * for_each_ie - iterate over continuous IEs
@@ -712,7 +712,7 @@ u8 *rtw_get_wps_attr_content(u8 *wps_ie, uint wps_ielen, u16 target_attr_id, u8
 	for (ie = (void *)buf; (((u8 *)ie) - ((u8 *)buf) + 1) < buf_len; \
 		ie = (void *)(((u8 *)ie) + *(((u8 *)ie) + 1) + 2))
 
-uint	rtw_get_rateset_len(u8 *rateset);
+unsigned int	rtw_get_rateset_len(u8 *rateset);
 
 struct registry_priv;
 int rtw_generate_ie(struct registry_priv *pregistrypriv);
diff --git a/drivers/staging/rtl8723bs/include/rtw_mlme.h b/drivers/staging/rtl8723bs/include/rtw_mlme.h
index 4962eedc7410..ed3e8e4c2180 100644
--- a/drivers/staging/rtl8723bs/include/rtw_mlme.h
+++ b/drivers/staging/rtl8723bs/include/rtw_mlme.h
@@ -86,7 +86,7 @@ enum {
 
 struct sitesurvey_ctrl {
 	u64	last_tx_pkts;
-	uint	last_rx_pkts;
+	unsigned int	last_rx_pkts;
 	signed int	traffic_busy;
 	struct timer_list	sitesurvey_ctrl_timer;
 };
@@ -144,14 +144,14 @@ struct mlme_priv {
 	struct wlan_network	cur_network;
 	struct wlan_network *cur_network_scanned;
 
-	/* uint wireless_mode; no used, remove it */
+	/* unsigned int wireless_mode; no used, remove it */
 
 	u32 auto_scan_int_ms;
 
 	struct timer_list assoc_timer;
 
-	uint assoc_by_bssid;
-	uint assoc_by_rssi;
+	unsigned int assoc_by_bssid;
+	unsigned int assoc_by_rssi;
 
 	struct timer_list scan_to_timer; /*  driver itself handles scan_timeout status. */
 	unsigned long scan_start_time; /*  used to evaluate the time spent in scanning */
@@ -323,8 +323,8 @@ void rtw_indicate_connect(struct adapter *adapter);
 void rtw_indicate_scan_done(struct adapter *padapter, bool aborted);
 void rtw_scan_abort(struct adapter *adapter);
 
-int rtw_restruct_sec_ie(struct adapter *adapter, u8 *in_ie, u8 *out_ie, uint in_len);
-int rtw_restruct_wmm_ie(struct adapter *adapter, u8 *in_ie, u8 *out_ie, uint in_len, uint initial_out_len);
+int rtw_restruct_sec_ie(struct adapter *adapter, u8 *in_ie, u8 *out_ie, unsigned int in_len);
+int rtw_restruct_wmm_ie(struct adapter *adapter, u8 *in_ie, u8 *out_ie, unsigned int in_len, unsigned int initial_out_len);
 void rtw_init_registrypriv_dev_network(struct adapter *adapter);
 
 void rtw_update_registrypriv_dev_network(struct adapter *adapter);
@@ -361,11 +361,11 @@ u8 *rtw_get_beacon_interval_from_ie(u8 *ie);
 void rtw_joinbss_reset(struct adapter *padapter);
 
 void rtw_ht_use_default_setting(struct adapter *padapter);
-void rtw_build_wmm_ie_ht(struct adapter *padapter, u8 *out_ie, uint *pout_len);
-unsigned int rtw_restructure_ht_ie(struct adapter *padapter, u8 *in_ie, u8 *out_ie, uint in_len, uint *pout_len, u8 channel);
-void rtw_update_ht_cap(struct adapter *padapter, u8 *pie, uint ie_len, u8 channel);
+void rtw_build_wmm_ie_ht(struct adapter *padapter, u8 *out_ie, unsigned int *pout_len);
+unsigned int rtw_restructure_ht_ie(struct adapter *padapter, u8 *in_ie, u8 *out_ie, unsigned int in_len, unsigned int *pout_len, u8 channel);
+void rtw_update_ht_cap(struct adapter *padapter, u8 *pie, unsigned int ie_len, u8 channel);
 void rtw_issue_addbareq_cmd(struct adapter *padapter, struct xmit_frame *pxmitframe);
-void rtw_append_exented_cap(struct adapter *padapter, u8 *out_ie, uint *pout_len);
+void rtw_append_exented_cap(struct adapter *padapter, u8 *out_ie, unsigned int *pout_len);
 
 bool rtw_is_same_ibss(struct adapter *adapter, struct wlan_network *pnetwork);
 int is_same_network(struct wlan_bssid_ex *src, struct wlan_bssid_ex *dst, u8 feature);
diff --git a/drivers/staging/rtl8723bs/include/rtw_mlme_ext.h b/drivers/staging/rtl8723bs/include/rtw_mlme_ext.h
index 847a1d75fe39..333f1cc2fc6c 100644
--- a/drivers/staging/rtl8723bs/include/rtw_mlme_ext.h
+++ b/drivers/staging/rtl8723bs/include/rtw_mlme_ext.h
@@ -474,7 +474,7 @@ int is_client_associated_to_ap(struct adapter *padapter);
 int is_client_associated_to_ibss(struct adapter *padapter);
 int is_IBSS_empty(struct adapter *padapter);
 
-unsigned char check_assoc_AP(u8 *pframe, uint len);
+unsigned char check_assoc_AP(u8 *pframe, unsigned int len);
 
 int WMM_param_handler(struct adapter *padapter, struct ndis_80211_var_ie *pIE);
 void WMMOnAssocRsp(struct adapter *padapter);
@@ -487,13 +487,13 @@ void ERP_IE_handler(struct adapter *padapter, struct ndis_80211_var_ie *pIE);
 void VCS_update(struct adapter *padapter, struct sta_info *psta);
 void update_ldpc_stbc_cap(struct sta_info *psta);
 
-void update_beacon_info(struct adapter *padapter, u8 *pframe, uint len, struct sta_info *psta);
+void update_beacon_info(struct adapter *padapter, u8 *pframe, unsigned int len, struct sta_info *psta);
 int rtw_check_bcn_info(struct adapter *Adapter, u8 *pframe, u32 packet_len);
 void update_IOT_info(struct adapter *padapter);
 void update_capinfo(struct adapter *Adapter, u16 updateCap);
 void update_wireless_mode(struct adapter *padapter);
 void update_sta_basic_rate(struct sta_info *psta, u8 wireless_mode);
-int update_sta_support_rate(struct adapter *padapter, u8 *pvar_ie, uint var_ie_len, int cam_idx);
+int update_sta_support_rate(struct adapter *padapter, u8 *pvar_ie, unsigned int var_ie_len, int cam_idx);
 
 /* for sta/adhoc mode */
 void update_sta_info(struct adapter *padapter, struct sta_info *psta);
@@ -598,15 +598,15 @@ void sa_query_timer_hdl(struct timer_list *t);
 
 void process_addba_req(struct adapter *padapter, u8 *paddba_req, u8 *addr);
 
-void update_TSF(struct mlme_ext_priv *pmlmeext, u8 *pframe, uint len);
+void update_TSF(struct mlme_ext_priv *pmlmeext, u8 *pframe, unsigned int len);
 void correct_TSF(struct adapter *padapter, struct mlme_ext_priv *pmlmeext);
-void adaptive_early_32k(struct mlme_ext_priv *pmlmeext, u8 *pframe, uint len);
+void adaptive_early_32k(struct mlme_ext_priv *pmlmeext, u8 *pframe, unsigned int len);
 bool traffic_status_watchdog(struct adapter *padapter, bool from_timer);
 
 int rtw_chk_start_clnt_join(struct adapter *padapter, u8 *ch, u8 *bw, u8 *offset);
 
 struct cmd_hdl {
-	uint	parmsize;
+	unsigned int	parmsize;
 	u8 (*h2cfuns)(struct adapter *padapter, u8 *pbuf);
 };
 
diff --git a/drivers/staging/rtl8723bs/include/rtw_pwrctrl.h b/drivers/staging/rtl8723bs/include/rtw_pwrctrl.h
index c308fcedd632..59bb5a775005 100644
--- a/drivers/staging/rtl8723bs/include/rtw_pwrctrl.h
+++ b/drivers/staging/rtl8723bs/include/rtw_pwrctrl.h
@@ -145,8 +145,8 @@ struct pwrctrl_priv {
 	u32 cur_ps_level;
 	u32 reg_rfps_level;
 
-	uint	ips_enter_cnts;
-	uint	ips_leave_cnts;
+	unsigned int	ips_enter_cnts;
+	unsigned int	ips_leave_cnts;
 
 	u8 ips_mode;
 	u8 ips_org_mode;
diff --git a/drivers/staging/rtl8723bs/include/rtw_recv.h b/drivers/staging/rtl8723bs/include/rtw_recv.h
index b2a863e4d6ce..a417c178194d 100644
--- a/drivers/staging/rtl8723bs/include/rtw_recv.h
+++ b/drivers/staging/rtl8723bs/include/rtw_recv.h
@@ -176,16 +176,16 @@ struct recv_priv {
 	struct __queue uc_swdec_pending_queue;
 	u8 *pallocated_frame_buf;
 	u8 *precv_frame_buf;
-	uint free_recvframe_cnt;
+	unsigned int free_recvframe_cnt;
 	struct adapter *adapter;
 	u32 bIsAnyNonBEPkts;
 	u64 rx_bytes;
 	u64 rx_pkts;
 	u64 rx_drop;
-	uint rx_icv_err;
-	uint rx_largepacket_crcerr;
-	uint rx_smallpacket_crcerr;
-	uint rx_middlepacket_crcerr;
+	unsigned int rx_icv_err;
+	unsigned int rx_largepacket_crcerr;
+	unsigned int rx_smallpacket_crcerr;
+	unsigned int rx_middlepacket_crcerr;
 
 	struct tasklet_struct irq_prepare_beacon_tasklet;
 	struct tasklet_struct recv_tasklet;
@@ -277,7 +277,7 @@ struct recv_frame_hdr {
 
 	struct rx_pkt_attrib attrib;
 
-	uint len;
+	unsigned int len;
 	u8 *rx_head;
 	u8 *rx_data;
 	u8 *rx_tail;
@@ -295,7 +295,7 @@ union recv_frame {
 	union{
 		struct list_head list;
 		struct recv_frame_hdr hdr;
-		uint mem[RECVFRAME_HDR_ALIGN>>2];
+		unsigned int mem[RECVFRAME_HDR_ALIGN>>2];
 	} u;
 };
 
diff --git a/drivers/staging/rtl8723bs/include/rtw_xmit.h b/drivers/staging/rtl8723bs/include/rtw_xmit.h
index c5cb814789d8..5d75b0da6730 100644
--- a/drivers/staging/rtl8723bs/include/rtw_xmit.h
+++ b/drivers/staging/rtl8723bs/include/rtw_xmit.h
@@ -293,8 +293,8 @@ struct	hw_txqueue	{
 	volatile signed int	free_sz;	/* in units of 64 bytes */
 	volatile signed int      free_cmdsz;
 	volatile signed int	 txsz[8];
-	uint	ff_hwaddr;
-	uint	cmd_hwaddr;
+	unsigned int	ff_hwaddr;
+	unsigned int	cmd_hwaddr;
 	signed int	ac_tag;
 };
 
@@ -319,15 +319,15 @@ struct	xmit_priv {
 
 	u8 *pallocated_frame_buf;
 	u8 *pxmit_frame_buf;
-	uint free_xmitframe_cnt;
+	unsigned int free_xmitframe_cnt;
 	struct __queue	free_xmit_queue;
 
 	u8 *xframe_ext_alloc_addr;
 	u8 *xframe_ext;
-	uint free_xframe_ext_cnt;
+	unsigned int free_xframe_ext_cnt;
 	struct __queue free_xframe_ext_queue;
 
-	uint	frag_len;
+	unsigned int	frag_len;
 
 	struct adapter	*adapter;
 
@@ -353,12 +353,12 @@ struct	xmit_priv {
 	struct __queue pending_xmitbuf_queue;
 	u8 *pallocated_xmitbuf;
 	u8 *pxmitbuf;
-	uint free_xmitbuf_cnt;
+	unsigned int free_xmitbuf_cnt;
 
 	struct __queue free_xmit_extbuf_queue;
 	u8 *pallocated_xmit_extbuf;
 	u8 *pxmit_extbuf;
-	uint free_xmit_extbuf_cnt;
+	unsigned int free_xmit_extbuf_cnt;
 
 	struct xmit_buf	pcmd_xmitbuf[CMDBUF_MAX];
 
@@ -383,7 +383,7 @@ struct xmit_buf *rtw_alloc_xmitbuf(struct xmit_priv *pxmitpriv);
 void rtw_free_xmitbuf(struct xmit_priv *pxmitpriv, struct xmit_buf *pxmitbuf);
 
 void rtw_count_tx_stats(struct adapter *padapter, struct xmit_frame *pxmitframe, int sz);
-void rtw_update_protection(struct adapter *padapter, u8 *ie, uint ie_len);
+void rtw_update_protection(struct adapter *padapter, u8 *ie, unsigned int ie_len);
 int rtw_make_wlanhdr(struct adapter *padapter, u8 *hdr, struct pkt_attrib *pattrib);
 s32 rtw_put_snap(u8 *data, u16 h_proto);
 
diff --git a/drivers/staging/rtl8723bs/include/sta_info.h b/drivers/staging/rtl8723bs/include/sta_info.h
index 21a4ca841e6e..9d3489bbe7c4 100644
--- a/drivers/staging/rtl8723bs/include/sta_info.h
+++ b/drivers/staging/rtl8723bs/include/sta_info.h
@@ -80,14 +80,14 @@ struct sta_info {
 	struct __queue sleep_q;
 	unsigned int sleepq_len;
 
-	uint state;
-	uint aid;
-	uint mac_id;
-	uint qos_option;
+	unsigned int state;
+	unsigned int aid;
+	unsigned int mac_id;
+	unsigned int qos_option;
 	u8 hwaddr[ETH_ALEN];
 
 	bool ieee8021x_blocked;
-	uint dot118021_x_privacy; /* aes, tkip... */
+	unsigned int dot118021_x_privacy; /* aes, tkip... */
 	union Keytype dot11tkiptxmickey;
 	union Keytype dot11tkiprxmickey;
 	union Keytype dot118021x_UncstKey;
diff --git a/drivers/staging/rtl8723bs/include/wlan_bssdef.h b/drivers/staging/rtl8723bs/include/wlan_bssdef.h
index d318c80c3be3..2c1f744c1fdb 100644
--- a/drivers/staging/rtl8723bs/include/wlan_bssdef.h
+++ b/drivers/staging/rtl8723bs/include/wlan_bssdef.h
@@ -129,7 +129,7 @@ struct wlan_bssid_ex {
 	u8 ies[MAX_IE_SZ];	/* timestamp, beacon interval, and capability information) */
 } __packed;
 
-static inline uint get_wlan_bssid_ex_sz(struct wlan_bssid_ex *bss)
+static inline unsigned int get_wlan_bssid_ex_sz(struct wlan_bssid_ex *bss)
 {
 	return (sizeof(struct wlan_bssid_ex) - MAX_IE_SZ + bss->ie_length);
 }
diff --git a/drivers/staging/rtl8723bs/os_dep/os_intfs.c b/drivers/staging/rtl8723bs/os_dep/os_intfs.c
index d220df325fa9..2ec9d455cd34 100644
--- a/drivers/staging/rtl8723bs/os_dep/os_intfs.c
+++ b/drivers/staging/rtl8723bs/os_dep/os_intfs.c
@@ -138,7 +138,7 @@ module_param(rtw_antdiv_type, int, 0644);
 
 module_param(rtw_hw_wps_pbc, int, 0644);
 
-static uint rtw_max_roaming_times = 2;
+static unsigned int rtw_max_roaming_times = 2;
 module_param(rtw_max_roaming_times, uint, 0644);
 MODULE_PARM_DESC(rtw_max_roaming_times, "The max roaming times to try");
 
@@ -147,13 +147,13 @@ module_param(rtw_mc2u_disable, int, 0644);
 module_param(rtw_80211d, int, 0644);
 MODULE_PARM_DESC(rtw_80211d, "Enable 802.11d mechanism");
 
-static uint rtw_notch_filter;
+static unsigned int rtw_notch_filter;
 module_param(rtw_notch_filter, uint, 0644);
 MODULE_PARM_DESC(rtw_notch_filter, "0:Disable, 1:Enable, 2:Enable only for P2P");
 
 #define CONFIG_RTW_HIQ_FILTER 1
 
-static uint rtw_hiq_filter = CONFIG_RTW_HIQ_FILTER;
+static unsigned int rtw_hiq_filter = CONFIG_RTW_HIQ_FILTER;
 module_param(rtw_hiq_filter, uint, 0644);
 MODULE_PARM_DESC(rtw_hiq_filter, "0:allow all, 1:allow special, 2:deny all");
 
-- 
2.55.0

