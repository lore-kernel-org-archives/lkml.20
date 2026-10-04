Received: from out-2uec-a122.jellyfish.systems (out-2uec-a122.jellyfish.systems [63.250.43.122])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9A2F3EC684
	for <linux-kernel@vger.kernel.org>; Sun,  4 Oct 2026 04:45:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=63.250.43.122
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791089141; cv=none; b=EeB/DPcCnUIhM2B2fz8oJp9luf7W9qqayh8uSoy2MwykR91mb5K1a6JgF/m2Eaa0v/xg1PDRT9468DMjtuzGt7+l5RzJAz1bKkUeeemmhWpgPWx/tYZI2Mb58pyFt5ovMqMMXCK7zZDP34WPRD6/BDQkWpVcjXwgINvexiLGX54=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791089141; c=relaxed/simple;
	bh=qt0QuUsYwO3znruhPXdyShHhRQL79q6M1ztrRuPtez4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Hljnz324dpIXIHK6eKBXW3xKvZ4qaWJWGDfQd5LFRfmfAj3blAb56dsGpWJcerffJc3hEoc7n4akp/297+dmauFw6uN4X37zck8nkNZibCDx6TuaJbMdp1SVO0DhsG0ymoUIGycI0BSvVTmzSYqwv/53cABVoxUUw3QtR06htzs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=firmwaredesign.org; spf=pass smtp.mailfrom=firmwaredesign.org; dkim=pass (2048-bit key) header.d=firmwaredesign.org header.i=@firmwaredesign.org header.b=MY5hTkqA; arc=none smtp.client-ip=63.250.43.122
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=firmwaredesign.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=firmwaredesign.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=firmwaredesign.org header.i=@firmwaredesign.org header.b="MY5hTkqA"
Received: from mail.privateemail.com (unknown [98.240.242.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.privateemail.com (Postfix) with ESMTPSA id 4hy91h2w5sz8sWP;
	Sun, 04 Oct 2026 04:45:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=firmwaredesign.org;
	s=privateemail; t=1791089129;
	bh=cEBz6YvsofEKFl6ZoMcdsdoreW22gxooIGeRwD/zlB8=;
	h=From:To:Cc:Subject:Date:From;
	b=MY5hTkqASL/0s2DSJtZ/S7+qBT7QajCChbL5dMAkj2kbzKRVFPc5APjt7GeWB2+Mz
	 TIZVe31KfT0794EebYZsyiP+/ifhhSBJIdBy76mblPpkPuM/UUkhhR5mp8P8Zfu7gk
	 zQH3OZyaC90TGz07kUpQYMfeiWkbMrD5ftJLty9K3vThknjY8YieWG9izFyQWjd3qR
	 16cLcSJV/ku/lJjN0dxi5EmrXWFLFBjGHwaPEz8fpIrFczYFpPW6S1AC8EKQlB0f8N
	 4Ff2kGiHlQJVTPV5dblNRJWm4g8N564MssitAt6FtuoimIIJhpSELx1rYcwFAcsUik
	 zAyUQQ96ue5Ew==
From: Marinela Tatiana Selseth <marinela.selseth@firmwaredesign.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Marinela Tatiana Selseth <marinela.selseth@firmwaredesign.org>,
	Gemini <google-gemini@google.com>
Subject: [PATCH v3] staging: rtl8723bs: condense NDIS encryption status enum
Date: Sat,  3 Oct 2026 23:45:16 -0500
Message-ID: <20261004044516.277444-1-marinela.selseth@firmwaredesign.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Envelope-From: marinela.selseth@firmwaredesign.org

Address maintainer feedback regarding loose anonymous enum constants
and redundant naming aliases. The legacy driver framework contained
multiple duplicate definitions (such as mapping both WEPDisabled and
EncryptionDisabled to identical tracking states) alongside several
completely unreferenced, dead tracking properties.

Clean up this subsystem by defining an explicit, named enumeration
layout 'enum ndis_802_11_encryption_status' inside wlan_bssdef.h.
Consolidate redundant aliases down to singular, uniform variables,
purge all unused legacy elements (KeyAbsent, NotSupported, and
EncrypteionWAPI blocks), and convert all remaining active states
over to standard uppercase snake_case conventions.

Update all internal software state assignments and state evaluation
loops across the entire driver operational baseline to conform to the
updated definitions, ensuring code tracking clarity while leaving
hardware execution behaviors completely unaltered. Fix associated
line length violations and remove redundant braces for single-statement
conditions introduced by long macro names.

Assisted-by: Gemini <google-gemini@google.com>
Signed-off-by: Marinela Tatiana Selseth <marinela.selseth@firmwaredesign.org>
---
 drivers/staging/rtl8723bs/core/rtw_ap.c       |  2 +-
 drivers/staging/rtl8723bs/core/rtw_mlme.c     |  8 +--
 .../staging/rtl8723bs/include/wlan_bssdef.h   | 19 ++----
 .../staging/rtl8723bs/os_dep/ioctl_cfg80211.c | 58 ++++++++++---------
 drivers/staging/rtl8723bs/os_dep/os_intfs.c   |  2 +-
 5 files changed, 41 insertions(+), 48 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_ap.c b/drivers/staging/rtl8723bs/core/rtw_ap.c
index f98360b59737..00981f1c5870 100644
--- a/drivers/staging/rtl8723bs/core/rtw_ap.c
+++ b/drivers/staging/rtl8723bs/core/rtw_ap.c
@@ -1907,7 +1907,7 @@ void stop_ap_mode(struct adapter *padapter)
 	       0,
 	       sizeof(struct security_priv));
 	padapter->securitypriv.ndisauthtype = Ndis802_11AuthModeOpen;
-	padapter->securitypriv.ndisencryptstatus = Ndis802_11WEPDisabled;
+	padapter->securitypriv.ndisencryptstatus = NDIS_802_11_ENCRYPTION_DISABLED;
 
 	/* for ACL */
 	spin_lock_bh(&pacl_node_q->lock);
diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme.c b/drivers/staging/rtl8723bs/core/rtw_mlme.c
index 0d0602eb4808..f85ed051b626 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme.c
@@ -607,7 +607,7 @@ static bool rtw_is_desired_network(struct adapter *adapter, struct wlan_network
 		u8 *p = NULL;
 		uint ie_len = 0;
 
-		if ((desired_encmode == Ndis802_11EncryptionDisabled) && (privacy != 0))
+		if ((desired_encmode == NDIS_802_11_ENCRYPTION_DISABLED) && (privacy != 0))
 			bselected = false;
 
 		if (psecuritypriv->ndisauthtype == Ndis802_11AuthModeWPA2PSK) {
@@ -623,7 +623,7 @@ static bool rtw_is_desired_network(struct adapter *adapter, struct wlan_network
 		}
 	}
 
-	if ((desired_encmode != Ndis802_11EncryptionDisabled) && (privacy == 0))
+	if ((desired_encmode != NDIS_802_11_ENCRYPTION_DISABLED) && (privacy == 0))
 		bselected = false;
 
 	if (check_fwstate(mlme_priv, WIFI_ADHOC_STATE)) {
@@ -1115,7 +1115,7 @@ void rtw_reset_securitypriv(struct adapter *adapter)
 		adapter->securitypriv.btkip_countermeasure_time = backup_tkip_countermeasure_time;
 
 		adapter->securitypriv.ndisauthtype = Ndis802_11AuthModeOpen;
-		adapter->securitypriv.ndisencryptstatus = Ndis802_11WEPDisabled;
+		adapter->securitypriv.ndisencryptstatus = NDIS_802_11_ENCRYPTION_DISABLED;
 
 	} else {
 		/* reset values in securitypriv */
@@ -1130,7 +1130,7 @@ void rtw_reset_securitypriv(struct adapter *adapter)
 		psec_priv->dot118021XGrpKeyid = 1;
 
 		psec_priv->ndisauthtype = Ndis802_11AuthModeOpen;
-		psec_priv->ndisencryptstatus = Ndis802_11WEPDisabled;
+		psec_priv->ndisencryptstatus = NDIS_802_11_ENCRYPTION_DISABLED;
 	}
 	spin_unlock_bh(&adapter->security_key_mutex);
 }
diff --git a/drivers/staging/rtl8723bs/include/wlan_bssdef.h b/drivers/staging/rtl8723bs/include/wlan_bssdef.h
index d318c80c3be3..ac8e1f286571 100644
--- a/drivers/staging/rtl8723bs/include/wlan_bssdef.h
+++ b/drivers/staging/rtl8723bs/include/wlan_bssdef.h
@@ -62,20 +62,11 @@ enum ndis_802_11_authentication_mode {
 	Ndis802_11AuthModeMax   /*  Not a real mode, defined as upper bound */
 };
 
-enum {
-	Ndis802_11WEPEnabled,
-	Ndis802_11Encryption1Enabled = Ndis802_11WEPEnabled,
-	Ndis802_11WEPDisabled,
-	Ndis802_11EncryptionDisabled = Ndis802_11WEPDisabled,
-	Ndis802_11WEPKeyAbsent,
-	Ndis802_11Encryption1KeyAbsent = Ndis802_11WEPKeyAbsent,
-	Ndis802_11WEPNotSupported,
-	Ndis802_11EncryptionNotSupported = Ndis802_11WEPNotSupported,
-	Ndis802_11Encryption2Enabled,
-	Ndis802_11Encryption2KeyAbsent,
-	Ndis802_11Encryption3Enabled,
-	Ndis802_11Encryption3KeyAbsent,
-	Ndis802_11_EncrypteionWAPI
+enum ndis_802_11_encryption_status {
+	NDIS_802_11_ENCRYPTION_1_ENABLED,
+	NDIS_802_11_ENCRYPTION_DISABLED,
+	NDIS_802_11_ENCRYPTION_2_ENABLED,
+	NDIS_802_11_ENCRYPTION_3_ENABLED,
 };
 
 /*  Key mapping keys require a BSSID */
diff --git a/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c b/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
index a715ac6aa6b9..ae6a0d556166 100644
--- a/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
+++ b/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
@@ -535,7 +535,7 @@ static int rtw_cfg80211_ap_set_encryption(struct net_device *dev, struct ieee_pa
 			/* wep default key has not been set, so use this key index as default key. */
 
 			psecuritypriv->dot11_auth_algrthm = dot11_auth_algrthm_auto;
-			psecuritypriv->ndisencryptstatus = Ndis802_11Encryption1Enabled;
+			psecuritypriv->ndisencryptstatus = NDIS_802_11_ENCRYPTION_1_ENABLED;
 			psecuritypriv->dot11_privacy_algrthm = _WEP40_;
 			psecuritypriv->dot118021XGrpPrivacy = _WEP40_;
 
@@ -731,7 +731,7 @@ static int rtw_cfg80211_set_encryption(struct net_device *dev, struct ieee_param
 
 			wep_key_len = wep_key_len <= 5 ? 5 : 13;
 
-			psecuritypriv->ndisencryptstatus = Ndis802_11Encryption1Enabled;
+			psecuritypriv->ndisencryptstatus = NDIS_802_11_ENCRYPTION_1_ENABLED;
 			psecuritypriv->dot11_privacy_algrthm = _WEP40_;
 			psecuritypriv->dot118021XGrpPrivacy = _WEP40_;
 
@@ -763,10 +763,11 @@ static int rtw_cfg80211_set_encryption(struct net_device *dev, struct ieee_param
 				if (strcmp(param->u.crypt.alg, "none") != 0)
 					psta->ieee8021x_blocked = false;
 
-				if ((padapter->securitypriv.ndisencryptstatus == Ndis802_11Encryption2Enabled) ||
-				    (padapter->securitypriv.ndisencryptstatus ==  Ndis802_11Encryption3Enabled)) {
+				if (padapter->securitypriv.ndisencryptstatus ==
+					NDIS_802_11_ENCRYPTION_2_ENABLED ||
+					padapter->securitypriv.ndisencryptstatus ==
+					NDIS_802_11_ENCRYPTION_3_ENABLED)
 					psta->dot118021_x_privacy = padapter->securitypriv.dot11_privacy_algrthm;
-				}
 
 				if (param->u.crypt.set_tx == 1) { /* pairwise key */
 
@@ -804,10 +805,11 @@ static int rtw_cfg80211_set_encryption(struct net_device *dev, struct ieee_param
 				if (strcmp(param->u.crypt.alg, "none") != 0)
 					pbcmc_sta->ieee8021x_blocked = false;
 
-				if ((padapter->securitypriv.ndisencryptstatus == Ndis802_11Encryption2Enabled) ||
-				    (padapter->securitypriv.ndisencryptstatus ==  Ndis802_11Encryption3Enabled)) {
+				if (padapter->securitypriv.ndisencryptstatus ==
+					NDIS_802_11_ENCRYPTION_2_ENABLED ||
+					padapter->securitypriv.ndisencryptstatus ==
+					NDIS_802_11_ENCRYPTION_3_ENABLED)
 					pbcmc_sta->dot118021_x_privacy = padapter->securitypriv.dot11_privacy_algrthm;
-				}
 			}
 		} else if (check_fwstate(pmlmepriv, WIFI_ADHOC_STATE)) { /* adhoc mode */
 		}
@@ -928,7 +930,7 @@ static int cfg80211_rtw_set_default_key(struct wiphy *wiphy,
 	struct security_priv *psecuritypriv = &padapter->securitypriv;
 
 	if ((key_index < WEP_KEYS) && ((psecuritypriv->dot11_privacy_algrthm == _WEP40_) || (psecuritypriv->dot11_privacy_algrthm == _WEP104_))) { /* set wep default key */
-		psecuritypriv->ndisencryptstatus = Ndis802_11Encryption1Enabled;
+		psecuritypriv->ndisencryptstatus = NDIS_802_11_ENCRYPTION_1_ENABLED;
 
 		psecuritypriv->dot11PrivacyKeyIndex = key_index;
 
@@ -1316,7 +1318,7 @@ static int rtw_cfg80211_set_auth_type(struct security_priv *psecuritypriv,
 
 		psecuritypriv->dot11_auth_algrthm = dot11_auth_algrthm_shared;
 
-		psecuritypriv->ndisencryptstatus = Ndis802_11Encryption1Enabled;
+		psecuritypriv->ndisencryptstatus = NDIS_802_11_ENCRYPTION_1_ENABLED;
 
 		break;
 	default:
@@ -1328,7 +1330,7 @@ static int rtw_cfg80211_set_auth_type(struct security_priv *psecuritypriv,
 
 static int rtw_cfg80211_set_cipher(struct security_priv *psecuritypriv, u32 cipher, bool ucast)
 {
-	u32 ndisencryptstatus = Ndis802_11EncryptionDisabled;
+	u32 ndisencryptstatus = NDIS_802_11_ENCRYPTION_DISABLED;
 
 	u32 *profile_cipher = ucast ? &psecuritypriv->dot11_privacy_algrthm :
 		&psecuritypriv->dot118021XGrpPrivacy;
@@ -1342,23 +1344,23 @@ static int rtw_cfg80211_set_cipher(struct security_priv *psecuritypriv, u32 ciph
 	switch (cipher) {
 	case IW_AUTH_CIPHER_NONE:
 		*profile_cipher = _NO_PRIVACY_;
-		ndisencryptstatus = Ndis802_11EncryptionDisabled;
+		ndisencryptstatus = NDIS_802_11_ENCRYPTION_DISABLED;
 		break;
 	case WLAN_CIPHER_SUITE_WEP40:
 		*profile_cipher = _WEP40_;
-		ndisencryptstatus = Ndis802_11Encryption1Enabled;
+		ndisencryptstatus = NDIS_802_11_ENCRYPTION_1_ENABLED;
 		break;
 	case WLAN_CIPHER_SUITE_WEP104:
 		*profile_cipher = _WEP104_;
-		ndisencryptstatus = Ndis802_11Encryption1Enabled;
+		ndisencryptstatus = NDIS_802_11_ENCRYPTION_1_ENABLED;
 		break;
 	case WLAN_CIPHER_SUITE_TKIP:
 		*profile_cipher = _TKIP_;
-		ndisencryptstatus = Ndis802_11Encryption2Enabled;
+		ndisencryptstatus = NDIS_802_11_ENCRYPTION_2_ENABLED;
 		break;
 	case WLAN_CIPHER_SUITE_CCMP:
 		*profile_cipher = _AES_;
-		ndisencryptstatus = Ndis802_11Encryption3Enabled;
+		ndisencryptstatus = NDIS_802_11_ENCRYPTION_3_ENABLED;
 		break;
 	default:
 		return -ENOTSUPP;
@@ -1449,46 +1451,46 @@ static int rtw_cfg80211_set_wpa_ie(struct adapter *padapter, u8 *pie, size_t iel
 	switch (group_cipher) {
 	case WPA_CIPHER_NONE:
 		padapter->securitypriv.dot118021XGrpPrivacy = _NO_PRIVACY_;
-		padapter->securitypriv.ndisencryptstatus = Ndis802_11EncryptionDisabled;
+		padapter->securitypriv.ndisencryptstatus = NDIS_802_11_ENCRYPTION_DISABLED;
 		break;
 	case WPA_CIPHER_WEP40:
 		padapter->securitypriv.dot118021XGrpPrivacy = _WEP40_;
-		padapter->securitypriv.ndisencryptstatus = Ndis802_11Encryption1Enabled;
+		padapter->securitypriv.ndisencryptstatus = NDIS_802_11_ENCRYPTION_1_ENABLED;
 		break;
 	case WPA_CIPHER_TKIP:
 		padapter->securitypriv.dot118021XGrpPrivacy = _TKIP_;
-		padapter->securitypriv.ndisencryptstatus = Ndis802_11Encryption2Enabled;
+		padapter->securitypriv.ndisencryptstatus = NDIS_802_11_ENCRYPTION_2_ENABLED;
 		break;
 	case WPA_CIPHER_CCMP:
 		padapter->securitypriv.dot118021XGrpPrivacy = _AES_;
-		padapter->securitypriv.ndisencryptstatus = Ndis802_11Encryption3Enabled;
+		padapter->securitypriv.ndisencryptstatus = NDIS_802_11_ENCRYPTION_3_ENABLED;
 		break;
 	case WPA_CIPHER_WEP104:
 		padapter->securitypriv.dot118021XGrpPrivacy = _WEP104_;
-		padapter->securitypriv.ndisencryptstatus = Ndis802_11Encryption1Enabled;
+		padapter->securitypriv.ndisencryptstatus = NDIS_802_11_ENCRYPTION_1_ENABLED;
 		break;
 	}
 
 	switch (pairwise_cipher) {
 	case WPA_CIPHER_NONE:
 		padapter->securitypriv.dot11_privacy_algrthm = _NO_PRIVACY_;
-		padapter->securitypriv.ndisencryptstatus = Ndis802_11EncryptionDisabled;
+		padapter->securitypriv.ndisencryptstatus = NDIS_802_11_ENCRYPTION_DISABLED;
 		break;
 	case WPA_CIPHER_WEP40:
 		padapter->securitypriv.dot11_privacy_algrthm = _WEP40_;
-		padapter->securitypriv.ndisencryptstatus = Ndis802_11Encryption1Enabled;
+		padapter->securitypriv.ndisencryptstatus = NDIS_802_11_ENCRYPTION_1_ENABLED;
 		break;
 	case WPA_CIPHER_TKIP:
 		padapter->securitypriv.dot11_privacy_algrthm = _TKIP_;
-		padapter->securitypriv.ndisencryptstatus = Ndis802_11Encryption2Enabled;
+		padapter->securitypriv.ndisencryptstatus = NDIS_802_11_ENCRYPTION_2_ENABLED;
 		break;
 	case WPA_CIPHER_CCMP:
 		padapter->securitypriv.dot11_privacy_algrthm = _AES_;
-		padapter->securitypriv.ndisencryptstatus = Ndis802_11Encryption3Enabled;
+		padapter->securitypriv.ndisencryptstatus = NDIS_802_11_ENCRYPTION_3_ENABLED;
 		break;
 	case WPA_CIPHER_WEP104:
 		padapter->securitypriv.dot11_privacy_algrthm = _WEP104_;
-		padapter->securitypriv.ndisencryptstatus = Ndis802_11Encryption1Enabled;
+		padapter->securitypriv.ndisencryptstatus = NDIS_802_11_ENCRYPTION_1_ENABLED;
 		break;
 	}
 
@@ -1554,7 +1556,7 @@ static int cfg80211_rtw_join_ibss(struct wiphy *wiphy, struct net_device *ndev,
 	ndis_ssid.ssid_length = params->ssid_len;
 	memcpy(ndis_ssid.ssid, (u8 *)params->ssid, params->ssid_len);
 
-	psecuritypriv->ndisencryptstatus = Ndis802_11EncryptionDisabled;
+	psecuritypriv->ndisencryptstatus = NDIS_802_11_ENCRYPTION_DISABLED;
 	psecuritypriv->dot11_privacy_algrthm = _NO_PRIVACY_;
 	psecuritypriv->dot118021XGrpPrivacy = _NO_PRIVACY_;
 	psecuritypriv->dot11_auth_algrthm = dot11_auth_algrthm_open; /* open system */
@@ -1650,7 +1652,7 @@ static int cfg80211_rtw_connect(struct wiphy *wiphy, struct net_device *ndev,
 	if (check_fwstate(pmlmepriv, _FW_UNDER_SURVEY))
 		rtw_scan_abort(padapter);
 
-	psecuritypriv->ndisencryptstatus = Ndis802_11EncryptionDisabled;
+	psecuritypriv->ndisencryptstatus = NDIS_802_11_ENCRYPTION_DISABLED;
 	psecuritypriv->dot11_privacy_algrthm = _NO_PRIVACY_;
 	psecuritypriv->dot118021XGrpPrivacy = _NO_PRIVACY_;
 	psecuritypriv->dot11_auth_algrthm = dot11_auth_algrthm_open; /* open system */
diff --git a/drivers/staging/rtl8723bs/os_dep/os_intfs.c b/drivers/staging/rtl8723bs/os_dep/os_intfs.c
index d220df325fa9..a4bc4ff58c56 100644
--- a/drivers/staging/rtl8723bs/os_dep/os_intfs.c
+++ b/drivers/staging/rtl8723bs/os_dep/os_intfs.c
@@ -507,7 +507,7 @@ static void rtw_init_default_value(struct adapter *padapter)
 	psecuritypriv->dot118021XGrpKeyid = 1;
 
 	psecuritypriv->ndisauthtype = Ndis802_11AuthModeOpen;
-	psecuritypriv->ndisencryptstatus = Ndis802_11WEPDisabled;
+	psecuritypriv->ndisencryptstatus = NDIS_802_11_ENCRYPTION_DISABLED;
 
 	/* registry_priv */
 	rtw_init_registrypriv_dev_network(padapter);
-- 
2.43.0

