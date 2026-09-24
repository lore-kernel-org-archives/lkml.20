Received: from mail-vs2-f40.google.com (mail-vs2-f40.google.com [74.125.227.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73F2F3EF0C2
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 22:21:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.40
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790288507; cv=none; b=Vnz1hE3pQkTrezrGa0tfvYp8q4qgAw6CGSy+l45TbzZ33JvHGLqDWrY1IOal01n0CcQ/CtS1FZ6eit44DVY2gOJvojJgj9G+LNGjjL6IVggFk6zhNpm8N8fSb3uUjNT8AKwEwt1FOUgOfojN2zk/nAw9p+rqMV/TUwImm5pwM6Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790288507; c=relaxed/simple;
	bh=VGnx62vJu8x6U3p4kivR/4DDstToyFK7UfpRsYleEVg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=PN4cFPpd06Rcv9fres35eKyn46F9hKxPPqgor8ZFMI3yw6YDYOVfnixECYLYRcjyhQpDgVPttG+Lk+jHeb6SCIsOxJwMS2Mh4iKXogtrd+5V8N9noWwrcwSPhLR2uX7HEnM/cr6ty1IfY68Ek5K5oN84ocpSQXf5nsSe+JMFh/M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DN6twLVj; arc=none smtp.client-ip=74.125.227.40
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DN6twLVj"
Received: by mail-vs2-f40.google.com with SMTP id ada2fe7eead31-7a05d236f53so172875137.1
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 15:21:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790288504; x=1790893304; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Sa89UHRmyzmZY6TxGzw+0o/wrvuxvTidU3ERLkCQopo=;
        b=DN6twLVjVQClkkJj+9ACZPrrKe/WlK6fuD6g3InlyCQE6gd7xXONo7Wx7dSda7nSZM
         3CviHh9q/8pYQnElD2V3KROnOsmWHDnMWg+n+0W6rKXwZs4e5VR0D8y+MziRG4UPKf7E
         DdeajIHzslxMJvTOqKgUZDmWBpq1WJcaP5hJEFtiAb8bv0hpMPTsathTAFdNEkG3PaUB
         cpZIe05+OgNMHI5Mf3+y3oRzPHgnhGH8bxgYqWHvt9/iuBLJCSwY2oEficzdNwqAj/hh
         6HWkpkWf1kf5ET88k1eDSQFPwOdzZ4MGk6ZCYsCNpBQWKUb8h39isoeKwDbpDYdfn7Zs
         Tnvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790288504; x=1790893304;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Sa89UHRmyzmZY6TxGzw+0o/wrvuxvTidU3ERLkCQopo=;
        b=gcWIbhm4Ezbzt/USgZ4vp1k5Rlso1tYb7ih1g8mWk6so5Z5rleUSU9oudqcm1xUtDY
         ta8+V1UJMgcOEuTUGYTxa9Bbdm3twQt0c58iEElSRc1KpogFhdmhNVhATRHrkKn9Scre
         oQUVo/550iHwH6k3bBCl7PJORebPYDfISDn4fIHSBbk7ckwZw0oBGhL9eBQNcN38gb2l
         V/upyTsyRhNUNoKEh6si/umfzXH8obhpWbAelEi0SGyzOYm7Px5NjnDJYhHMPdPBXFV5
         pXBWmdIoONYkxOKkOVZsgzB9ml5bxVSBZCN1+i6/Ka6eps2X/DLHnkXbWkMoyCLZzExg
         WuIg==
X-Forwarded-Encrypted: i=1; AKwUvBywVKa2pLIU5hM+n2QxQfwfnXJQmEVmixi4kUTMWIySPAGvD4Q683jE66ujLlqMyT8X4k/X0CWpxY4fJ48=@vger.kernel.org
X-Gm-Message-State: AFuF++kV3iv+Bnft40/n7uksKV383/NuPb2xQSug2PtN8u8m5wtSXEKV
	Ok/Z/LM52YiN76VIr/pViwc9tQkAGim0YbgH0X/myO0Yw+gmfuOT3gLl0rTIgJVqfrI=
X-Gm-Gg: AYBFou3Ko6oBLu7VFd7BDdtWQp38nIN4MpN6KpeFeElLX3enoBYwZc5taq6KgcES7MA
	W/6/Ft5XKhMphjCdnC4VIzMO1iyrcHqhkSbDLHiCRkDMiiaRA619J6enkMfsoY0ObuFSvBssS3n
	MB7SXH1z+tl5ois6fLG2ZQ5IC6oSqobkEiaXvLmaqi2tLnP2C+4sisuFR/NHVEXpvbt2Fx58MRO
	saV3tHThG4AtyVzjJPDX3NJjbMWSjC3/NMpstiaubOg7F3w1RPRkOpoyRNjOO92fRMowV7y4PvE
	U5JWa6aKF5GjBdOSctsgzdKFN0My74Zw+UqjasJ8CT3nEVnH4EcOgO91v9XVBKF2Ukm3pn2QgXA
	ZiKxXUo1Iv6Ys0JkBAx6Sb4pakHv2yrHwQ9hHXI6F3pGFnpVhzIR8mkGTqjeQu1tPQ98nawCHyZ
	75yXCmexBqCeh4qVAcoFPHktLxwYPk0mdxdLhaqVBMjECKOZgdk3VG86csV/x+VX2P1FPizVrqi
	ee3IRcknxkfoJqb
X-Received: by 2002:a05:6102:3f46:b0:7a7:19aa:8a88 with SMTP id ada2fe7eead31-7af1f2fda6cmr2110732137.35.1790288504244;
        Thu, 24 Sep 2026 15:21:44 -0700 (PDT)
Received: from pop-os.lan ([2803:9810:44c0:6b08:5f74:5a16:c98e:9be])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-9860de80b19sm540339241.1.2026.09.24.15.21.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 15:21:43 -0700 (PDT)
From: Franco Hector Hugo Montenegro <franco.montenegro.ruke@gmail.com>
To: gregkh@linuxfoundation.org
Cc: ethantidmore06@gmail.com,
	nikolayof23@gmail.com,
	trohan2000@gmail.com,
	error27@gmail.com,
	fliegbert2@gmail.com,
	s9430939@naver.com,
	luka.gejak@linux.dev,
	khushalchitturi@gmail.com,
	khomenkov@mailbox.org,
	me@cipherat.com,
	azpijr@gmail.com,
	gianmariabiselli@gmail.com,
	johannes.berg@intel.com,
	arend.vanspriel@broadcom.com,
	asm.artisan256@gmail.com,
	miriam.rachel.korenblit@intel.com,
	serhatkumral1@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Franco Hector Hugo Montenegro <franco.montenegro.ruke@gmail.com>
Subject: [PATCH] Staging: rtl8723bs: fixed camel case coding style issue.
Date: Thu, 24 Sep 2026 19:21:22 -0300
Message-ID: <20260924222122.682920-1-franco.montenegro.ruke@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fixed a coding style issue for the field dot118021XPrivacy in the struct
sta_info.

Signed-off-by: Franco Hector Hugo Montenegro
<franco.montenegro.ruke@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_ap.c        |  2 +-
 drivers/staging/rtl8723bs/core/rtw_mlme.c      |  4 ++--
 .../staging/rtl8723bs/include/rtw_security.h   |  2 +-
 drivers/staging/rtl8723bs/include/sta_info.h   |  2 +-
 .../staging/rtl8723bs/os_dep/ioctl_cfg80211.c  | 18 +++++++++---------
 5 files changed, 14 insertions(+), 14 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_ap.c b/drivers/staging/rtl8723bs/core/rtw_ap.c
index 9face4c8ded2..0486e55da68f 100644
--- a/drivers/staging/rtl8723bs/core/rtw_ap.c
+++ b/drivers/staging/rtl8723bs/core/rtw_ap.c
@@ -1165,7 +1165,7 @@ u8 rtw_ap_set_pairwise_key(struct adapter *padapter, struct sta_info *psta)
 
 	init_h2fwcmd_w_parm_no_rsp(ph2c, psetstakey_para, SET_STA_KEY_CMD);
 
-	psetstakey_para->algorithm = (u8)psta->dot118021XPrivacy;
+	psetstakey_para->algorithm = (u8)psta->dot118021_x_privacy;
 
 	memcpy(psetstakey_para->addr, psta->hwaddr, ETH_ALEN);
 
diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme.c b/drivers/staging/rtl8723bs/core/rtw_mlme.c
index e22e33c364bb..56b5da67cf3b 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme.c
@@ -982,7 +982,7 @@ static struct sta_info *rtw_joinbss_update_stainfo(struct adapter *adapter, stru
 			adapter->securitypriv.bgrpkey_handshake = false;
 
 			psta->ieee8021x_blocked = true;
-			psta->dot118021XPrivacy = adapter->securitypriv.dot11_privacy_algrthm;
+			psta->dot118021_x_privacy = adapter->securitypriv.dot11_privacy_algrthm;
 
 			memset((u8 *)&psta->dot118021x_UncstKey, 0, sizeof(union Keytype));
 
@@ -1340,7 +1340,7 @@ void rtw_stassoc_event_callback(struct adapter *adapter, u8 *buf)
 	rtw_sta_media_status_rpt(adapter, psta, 1);
 
 	if (adapter->securitypriv.dot11_auth_algrthm == dot11_auth_algrthm_8021x)
-		psta->dot118021XPrivacy = adapter->securitypriv.dot11_privacy_algrthm;
+		psta->dot118021_x_privacy = adapter->securitypriv.dot11_privacy_algrthm;
 
 	psta->ieee8021x_blocked = false;
 
diff --git a/drivers/staging/rtl8723bs/include/rtw_security.h b/drivers/staging/rtl8723bs/include/rtw_security.h
index a3bbc605e2ba..88131a027221 100644
--- a/drivers/staging/rtl8723bs/include/rtw_security.h
+++ b/drivers/staging/rtl8723bs/include/rtw_security.h
@@ -180,7 +180,7 @@ do {\
 		if (bmcst)\
 			encry_algo = (u8)psecuritypriv->dot118021XGrpPrivacy;\
 		else\
-			encry_algo = (u8)psta->dot118021XPrivacy;\
+			encry_algo = (u8)psta->dot118021_x_privacy;\
 		break;\
 	case dot11_auth_algrthm_wapi:\
 		encry_algo = (u8)psecuritypriv->dot11_privacy_algrthm;\
diff --git a/drivers/staging/rtl8723bs/include/sta_info.h b/drivers/staging/rtl8723bs/include/sta_info.h
index bc78c32192c0..e7c69c4de615 100644
--- a/drivers/staging/rtl8723bs/include/sta_info.h
+++ b/drivers/staging/rtl8723bs/include/sta_info.h
@@ -87,7 +87,7 @@ struct sta_info {
 	u8 hwaddr[ETH_ALEN];
 
 	bool ieee8021x_blocked;
-	uint dot118021XPrivacy; /* aes, tkip... */
+	uint dot118021_x_privacy; /* aes, tkip... */
 	union Keytype dot11tkiptxmickey;
 	union Keytype dot11tkiprxmickey;
 	union Keytype dot118021x_UncstKey;
diff --git a/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c b/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
index 4416d0ec1db9..f29f8a39ec0b 100644
--- a/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
+++ b/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
@@ -602,7 +602,7 @@ static int rtw_cfg80211_ap_set_encryption(struct net_device *dev, struct ieee_pa
 			pbcmc_sta = rtw_get_bcmc_stainfo(padapter);
 			if (pbcmc_sta) {
 				pbcmc_sta->ieee8021x_blocked = false;
-				pbcmc_sta->dot118021XPrivacy = psecuritypriv->dot118021XGrpPrivacy;/* rx will use bmc_sta's dot118021XPrivacy */
+				pbcmc_sta->dot118021_x_privacy = psecuritypriv->dot118021XGrpPrivacy;/* rx will use bmc_sta's dot118021_x_privacy */
 			}
 		}
 
@@ -615,11 +615,11 @@ static int rtw_cfg80211_ap_set_encryption(struct net_device *dev, struct ieee_pa
 				memcpy(psta->dot118021x_UncstKey.skey, param->u.crypt.key, (param->u.crypt.key_len > 16 ? 16 : param->u.crypt.key_len));
 
 				if (strcmp(param->u.crypt.alg, "WEP") == 0) {
-					psta->dot118021XPrivacy = _WEP40_;
+					psta->dot118021_x_privacy = _WEP40_;
 					if (param->u.crypt.key_len == 13)
-						psta->dot118021XPrivacy = _WEP104_;
+						psta->dot118021_x_privacy = _WEP104_;
 				} else if (strcmp(param->u.crypt.alg, "TKIP") == 0) {
-					psta->dot118021XPrivacy = _TKIP_;
+					psta->dot118021_x_privacy = _TKIP_;
 
 					/* set mic key */
 					memcpy(psta->dot11tkiptxmickey.skey, &param->u.crypt.key[16], 8);
@@ -628,9 +628,9 @@ static int rtw_cfg80211_ap_set_encryption(struct net_device *dev, struct ieee_pa
 					psecuritypriv->busetkipkey = true;
 
 				} else if (strcmp(param->u.crypt.alg, "CCMP") == 0) {
-					psta->dot118021XPrivacy = _AES_;
+					psta->dot118021_x_privacy = _AES_;
 				} else {
-					psta->dot118021XPrivacy = _NO_PRIVACY_;
+					psta->dot118021_x_privacy = _NO_PRIVACY_;
 				}
 
 				rtw_ap_set_pairwise_key(padapter, psta);
@@ -676,7 +676,7 @@ static int rtw_cfg80211_ap_set_encryption(struct net_device *dev, struct ieee_pa
 				pbcmc_sta = rtw_get_bcmc_stainfo(padapter);
 				if (pbcmc_sta) {
 					pbcmc_sta->ieee8021x_blocked = false;
-					pbcmc_sta->dot118021XPrivacy = psecuritypriv->dot118021XGrpPrivacy;/* rx will use bmc_sta's dot118021XPrivacy */
+					pbcmc_sta->dot118021_x_privacy = psecuritypriv->dot118021XGrpPrivacy;/* rx will use bmc_sta's dot118021_x_privacy */
 				}
 			}
 		}
@@ -770,7 +770,7 @@ static int rtw_cfg80211_set_encryption(struct net_device *dev, struct ieee_param
 
 				if ((padapter->securitypriv.ndisencryptstatus == Ndis802_11Encryption2Enabled) ||
 				    (padapter->securitypriv.ndisencryptstatus ==  Ndis802_11Encryption3Enabled)) {
-					psta->dot118021XPrivacy = padapter->securitypriv.dot11_privacy_algrthm;
+					psta->dot118021_x_privacy = padapter->securitypriv.dot11_privacy_algrthm;
 				}
 
 				if (param->u.crypt.set_tx == 1) { /* pairwise key */
@@ -812,7 +812,7 @@ static int rtw_cfg80211_set_encryption(struct net_device *dev, struct ieee_param
 
 				if ((padapter->securitypriv.ndisencryptstatus == Ndis802_11Encryption2Enabled) ||
 				    (padapter->securitypriv.ndisencryptstatus ==  Ndis802_11Encryption3Enabled)) {
-					pbcmc_sta->dot118021XPrivacy = padapter->securitypriv.dot11_privacy_algrthm;
+					pbcmc_sta->dot118021_x_privacy = padapter->securitypriv.dot11_privacy_algrthm;
 				}
 			}
 		} else if (check_fwstate(pmlmepriv, WIFI_ADHOC_STATE)) { /* adhoc mode */
-- 
2.43.0

