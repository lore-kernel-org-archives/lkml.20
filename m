Received: from out-2z4y-a144.jellyfish.systems (out-2z4y-a144.jellyfish.systems [198.54.127.144])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F340C284B2F
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 20:00:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.54.127.144
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790884823; cv=none; b=hbTzFwwbA2e8jlE/dJaE8VsY2FYTcHO1KpSTtgPOGYrnvQTrYsErA4BYAdiodCcHueFVXwy1NlL9c65eG5NYKYM7e6GjhZaiTZQNBIOXwT4O72mXRUOIjDTyHOZtf3OkeSfw++ahmTvKnd/8OdTMh4UGOuRlNB+voFxBpBmcq8c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790884823; c=relaxed/simple;
	bh=zBpn8gyRPKXxW/bsabPRRFfQ5KIl27KvSKBAtyKAGEQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=imkuJgHP4LWVYuSh6puNmUWtHKa/dyknsKRkHIBcC6R2us7V576sP9igmZtZ6NgIbWRkR3leh1M4K6AyyL3ohtz9Kz8l+hqm5CV9c0kqc4ZL2Znk6Ih6l0qtZ9GeRr9b2G5Z+8Z293qnH8gqjUZaKxRX3IHEIOQ0p4ROMBN036I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=firmwaredesign.org; spf=pass smtp.mailfrom=firmwaredesign.org; dkim=pass (2048-bit key) header.d=firmwaredesign.org header.i=@firmwaredesign.org header.b=Rivgzosn; arc=none smtp.client-ip=198.54.127.144
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=firmwaredesign.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=firmwaredesign.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=firmwaredesign.org header.i=@firmwaredesign.org header.b="Rivgzosn"
Received: from mail.privateemail.com (unknown [98.240.242.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.privateemail.com (Postfix) with ESMTPSA id 4hwj9p3qSlz3wYG;
	Thu, 01 Oct 2026 19:47:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=firmwaredesign.org;
	s=privateemail; t=1790884047;
	bh=QAAtwpIcNkjRGp6cAi7qupY31eEBazYUe/Mpb1UZMmQ=;
	h=From:To:Cc:Subject:Date:From;
	b=RivgzosnFxCgFc4x7ISwUUb6oUMYmHPqUX7H9v/OYXNGUglnHRjNfZMFq0V86uAr7
	 Qkfo5M8OhkjjeKgSYtnEPy5AvY6vElPiBInERgZosn3n+nwUN8WvN8gO96uhH9NcxB
	 gJMhijs/0FfqJffTRz8H/vat5eLMZbA6AacHK3XLNhT4ufKFTBm2fqd8AEEUjtf8M9
	 2DCNLHjquGwrYyqqtPlSrL/dZhiew0pJvA0LOKycy45qIraleIMZc/qPCPZxXcLTGP
	 4vOIiTjPKS9zRfvc5ols0lhzmse5cIU5bzPtxWyAT3n0zMzRPEsYiVyr/6sZSNWZBD
	 ldLqYAdhMeZgw==
From: Marinela Tatiana Selseth <marinela.selseth@firmwaredesign.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Marinela Tatiana Selseth <marinela.selseth@firmwaredesign.org>
Subject: [PATCH] staging: rtl8723bs: Rename CamelCase NDIS encryption state enums
Date: Thu,  1 Oct 2026 14:47:10 -0500
Message-ID: <20261001194710.144114-1-marinela.selseth@firmwaredesign.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Envelope-From: marinela.selseth@firmwaredesign.org

The identifiers Ndis802_11WEPDisabled and Ndis802_11EncryptionDisabled
violate the Linux kernel coding style guideline regarding naming
conventions. Uppercase snake_case is preferred for enum constants.

Rename both constants to NDIS_802_11_WEP_DISABLED and
NDIS_802_11_ENCRYPTION_DISABLED across the driver framework to conform
to standard kernel conventions.

Signed-off-by: Marinela Tatiana Selseth <marinela.selseth@firmwaredesign.org>
---
 drivers/staging/rtl8723bs/core/rtw_ap.c           |  2 +-
 drivers/staging/rtl8723bs/core/rtw_mlme.c         |  8 ++++----
 drivers/staging/rtl8723bs/include/wlan_bssdef.h   |  4 ++--
 drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c | 12 ++++++------
 drivers/staging/rtl8723bs/os_dep/os_intfs.c       |  2 +-
 5 files changed, 14 insertions(+), 14 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_ap.c b/drivers/staging/rtl8723bs/core/rtw_ap.c
index 4728f62a1557..0fdf06cc7226 100644
--- a/drivers/staging/rtl8723bs/core/rtw_ap.c
+++ b/drivers/staging/rtl8723bs/core/rtw_ap.c
@@ -1909,7 +1909,7 @@ void stop_ap_mode(struct adapter *padapter)
 	       0,
 	       sizeof(struct security_priv));
 	padapter->securitypriv.ndisauthtype = Ndis802_11AuthModeOpen;
-	padapter->securitypriv.ndisencryptstatus = Ndis802_11WEPDisabled;
+	padapter->securitypriv.ndisencryptstatus = NDIS_802_11_WEP_DISABLED;
 
 	/* for ACL */
 	spin_lock_bh(&pacl_node_q->lock);
diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme.c b/drivers/staging/rtl8723bs/core/rtw_mlme.c
index d18768a51b19..0860d42b8487 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme.c
@@ -605,7 +605,7 @@ static bool rtw_is_desired_network(struct adapter *adapter, struct wlan_network
 		u8 *p = NULL;
 		uint ie_len = 0;
 
-		if ((desired_encmode == Ndis802_11EncryptionDisabled) && (privacy != 0))
+		if ((desired_encmode == NDIS_802_11_ENCRYPTION_DISABLED) && (privacy != 0))
 			bselected = false;
 
 		if (psecuritypriv->ndisauthtype == Ndis802_11AuthModeWPA2PSK) {
@@ -621,7 +621,7 @@ static bool rtw_is_desired_network(struct adapter *adapter, struct wlan_network
 		}
 	}
 
-	if ((desired_encmode != Ndis802_11EncryptionDisabled) && (privacy == 0))
+	if ((desired_encmode != NDIS_802_11_ENCRYPTION_DISABLED) && (privacy == 0))
 		bselected = false;
 
 	if (check_fwstate(pmlmepriv, WIFI_ADHOC_STATE)) {
@@ -1114,7 +1114,7 @@ void rtw_reset_securitypriv(struct adapter *adapter)
 		adapter->securitypriv.btkip_countermeasure_time = backupTKIPcountermeasure_time;
 
 		adapter->securitypriv.ndisauthtype = Ndis802_11AuthModeOpen;
-		adapter->securitypriv.ndisencryptstatus = Ndis802_11WEPDisabled;
+		adapter->securitypriv.ndisencryptstatus = NDIS_802_11_WEP_DISABLED;
 
 	} else {
 		/* reset values in securitypriv */
@@ -1130,7 +1130,7 @@ void rtw_reset_securitypriv(struct adapter *adapter)
 		psec_priv->dot118021XGrpKeyid = 1;
 
 		psec_priv->ndisauthtype = Ndis802_11AuthModeOpen;
-		psec_priv->ndisencryptstatus = Ndis802_11WEPDisabled;
+		psec_priv->ndisencryptstatus = NDIS_802_11_WEP_DISABLED;
 		/*  */
 	}
 	spin_unlock_bh(&adapter->security_key_mutex);
diff --git a/drivers/staging/rtl8723bs/include/wlan_bssdef.h b/drivers/staging/rtl8723bs/include/wlan_bssdef.h
index f4c1456f1476..86e4bf92f14b 100644
--- a/drivers/staging/rtl8723bs/include/wlan_bssdef.h
+++ b/drivers/staging/rtl8723bs/include/wlan_bssdef.h
@@ -69,8 +69,8 @@ enum ndis_802_11_authentication_mode {
 enum {
 	Ndis802_11WEPEnabled,
 	Ndis802_11Encryption1Enabled = Ndis802_11WEPEnabled,
-	Ndis802_11WEPDisabled,
-	Ndis802_11EncryptionDisabled = Ndis802_11WEPDisabled,
+	NDIS_802_11_WEP_DISABLED,
+	NDIS_802_11_ENCRYPTION_DISABLED = NDIS_802_11_WEP_DISABLED,
 	Ndis802_11WEPKeyAbsent,
 	Ndis802_11Encryption1KeyAbsent = Ndis802_11WEPKeyAbsent,
 	Ndis802_11WEPNotSupported,
diff --git a/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c b/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
index 3468d4114f60..90c822a8ee26 100644
--- a/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
+++ b/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
@@ -1338,7 +1338,7 @@ static int rtw_cfg80211_set_auth_type(struct security_priv *psecuritypriv,
 
 static int rtw_cfg80211_set_cipher(struct security_priv *psecuritypriv, u32 cipher, bool ucast)
 {
-	u32 ndisencryptstatus = Ndis802_11EncryptionDisabled;
+	u32 ndisencryptstatus = NDIS_802_11_ENCRYPTION_DISABLED;
 
 	u32 *profile_cipher = ucast ? &psecuritypriv->dot11_privacy_algrthm :
 		&psecuritypriv->dot118021XGrpPrivacy;
@@ -1352,7 +1352,7 @@ static int rtw_cfg80211_set_cipher(struct security_priv *psecuritypriv, u32 ciph
 	switch (cipher) {
 	case IW_AUTH_CIPHER_NONE:
 		*profile_cipher = _NO_PRIVACY_;
-		ndisencryptstatus = Ndis802_11EncryptionDisabled;
+		ndisencryptstatus = NDIS_802_11_ENCRYPTION_DISABLED;
 		break;
 	case WLAN_CIPHER_SUITE_WEP40:
 		*profile_cipher = _WEP40_;
@@ -1463,7 +1463,7 @@ static int rtw_cfg80211_set_wpa_ie(struct adapter *padapter, u8 *pie, size_t iel
 	switch (group_cipher) {
 	case WPA_CIPHER_NONE:
 		padapter->securitypriv.dot118021XGrpPrivacy = _NO_PRIVACY_;
-		padapter->securitypriv.ndisencryptstatus = Ndis802_11EncryptionDisabled;
+		padapter->securitypriv.ndisencryptstatus = NDIS_802_11_ENCRYPTION_DISABLED;
 		break;
 	case WPA_CIPHER_WEP40:
 		padapter->securitypriv.dot118021XGrpPrivacy = _WEP40_;
@@ -1486,7 +1486,7 @@ static int rtw_cfg80211_set_wpa_ie(struct adapter *padapter, u8 *pie, size_t iel
 	switch (pairwise_cipher) {
 	case WPA_CIPHER_NONE:
 		padapter->securitypriv.dot11_privacy_algrthm = _NO_PRIVACY_;
-		padapter->securitypriv.ndisencryptstatus = Ndis802_11EncryptionDisabled;
+		padapter->securitypriv.ndisencryptstatus = NDIS_802_11_ENCRYPTION_DISABLED;
 		break;
 	case WPA_CIPHER_WEP40:
 		padapter->securitypriv.dot11_privacy_algrthm = _WEP40_;
@@ -1568,7 +1568,7 @@ static int cfg80211_rtw_join_ibss(struct wiphy *wiphy, struct net_device *ndev,
 	ndis_ssid.ssid_length = params->ssid_len;
 	memcpy(ndis_ssid.ssid, (u8 *)params->ssid, params->ssid_len);
 
-	psecuritypriv->ndisencryptstatus = Ndis802_11EncryptionDisabled;
+	psecuritypriv->ndisencryptstatus = NDIS_802_11_ENCRYPTION_DISABLED;
 	psecuritypriv->dot11_privacy_algrthm = _NO_PRIVACY_;
 	psecuritypriv->dot118021XGrpPrivacy = _NO_PRIVACY_;
 	psecuritypriv->dot11_auth_algrthm = dot11_auth_algrthm_open; /* open system */
@@ -1664,7 +1664,7 @@ static int cfg80211_rtw_connect(struct wiphy *wiphy, struct net_device *ndev,
 	if (check_fwstate(pmlmepriv, _FW_UNDER_SURVEY))
 		rtw_scan_abort(padapter);
 
-	psecuritypriv->ndisencryptstatus = Ndis802_11EncryptionDisabled;
+	psecuritypriv->ndisencryptstatus = NDIS_802_11_ENCRYPTION_DISABLED;
 	psecuritypriv->dot11_privacy_algrthm = _NO_PRIVACY_;
 	psecuritypriv->dot118021XGrpPrivacy = _NO_PRIVACY_;
 	psecuritypriv->dot11_auth_algrthm = dot11_auth_algrthm_open; /* open system */
diff --git a/drivers/staging/rtl8723bs/os_dep/os_intfs.c b/drivers/staging/rtl8723bs/os_dep/os_intfs.c
index c15056ee207c..e0d043172819 100644
--- a/drivers/staging/rtl8723bs/os_dep/os_intfs.c
+++ b/drivers/staging/rtl8723bs/os_dep/os_intfs.c
@@ -540,7 +540,7 @@ static void rtw_init_default_value(struct adapter *padapter)
 	psecuritypriv->dot118021XGrpKeyid = 1;
 
 	psecuritypriv->ndisauthtype = Ndis802_11AuthModeOpen;
-	psecuritypriv->ndisencryptstatus = Ndis802_11WEPDisabled;
+	psecuritypriv->ndisencryptstatus = NDIS_802_11_WEP_DISABLED;
 
 	/* registry_priv */
 	rtw_init_registrypriv_dev_network(padapter);
-- 
2.43.0

