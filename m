Received: from mail-dy2-f42.google.com (mail-dy2-f42.google.com [74.125.229.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DE4D3B47D5
	for <linux-kernel@vger.kernel.org>; Sun,  4 Oct 2026 09:21:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791105676; cv=none; b=ERBrj+ZmMJb+pAnG/hgA6HdhFjFAYovVgO5q+6KlYlZ5o7g+BKpWaJntTPaFmrea1Y0Cv10OaQI+JeG38oPQoZi7Ed2e6lCEgMb8V2ksIb75uusXGxtnY49aMwJkjlAMh+DFkNiAsrZVW3uIGQigC27SbmflRseUmAXDJGQ3pHI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791105676; c=relaxed/simple;
	bh=yUITchUaa0fajSNUG9dFT8wNOtUqvaR1kD73dbsk50I=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=HNPWUHCNDweGuvNS6CF3g0qGFPu6FuFAmplexTQGbIT3uhsgkJscugYFmD0IAlAa9HF0C8WY3kS4eKSzbyntvSbZXtCSfkN2uB5opXyZW4H0tQVTcsNF/ABjVlaJSDwQMSVOSQhUmIHQv/JdZVxKj437kL1LDkW/5rPeB3rxlgw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZjNg6aXZ; arc=none smtp.client-ip=74.125.229.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZjNg6aXZ"
Received: by mail-dy2-f42.google.com with SMTP id 5a478bee46e88-3511f5f79e0so170128eec.1
        for <linux-kernel@vger.kernel.org>; Sun, 04 Oct 2026 02:21:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791105673; x=1791710473; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=3tsrEk5w6z1sr8G8sP227HhDEtTyBiNsC1fB9mvgUgQ=;
        b=ZjNg6aXZn39lA9YDTUL/uihPoMX5eYXeqWs2XPUqiEKtPgEQO3H74XOessQ+bT/bpS
         i7ip3hG+J8xXwEk3rCpBcQChYLyeaaKebs9GrqtWrtHRtcYqB+7eU29996ZDISDPpTkZ
         FRhX6Do4QCqkOQ89uhv4xcYqMTUQTBeLbbiReT1HcKUomLAKhVRTsB3+iGYxOejXlBOs
         /1Rozsj1AMeo+041XBfo8zWn8O6P8uaFaqvsXEyvejfgqUlht8dPCjvfG1MtpzD9H/eO
         syiOgat0crV98dshICXMasOu+PU7rh1fQBMX7TGsT/H6wgkviIWdPRKZ3tzEQOrBH//z
         kHeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791105673; x=1791710473;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3tsrEk5w6z1sr8G8sP227HhDEtTyBiNsC1fB9mvgUgQ=;
        b=qngq7Pb6aVbMoBkba3IR9mQpDD+BXvzfS2AuxOHrV5SCPfLyYjvxkXUA498ELaJ2U0
         RH8fMhV7mbiqjKiJXyJBTKVQx+7qft2ElWe+OOTPz/BFqQ1zzSfyGUu/xzpxOWi3hlGy
         nky4xqubjPeMxg1mAaKyajnHpgfVuP+kTqImX9Ri8cKFwtf7/NFgTI5obJ/DypTFTuzJ
         069q2H4p7AdVtIgyBU9a4EBXb91UHCUK8IS3KHlSABIe0iSSzGbQ6AMwQuXje17Dy4Ay
         DlGCbLE4aufkdih5Oyy7aE013LPWgeAJUh5/J3jkickF4RWPnb8r+FHv+juFqAHhFHdv
         t/hA==
X-Forwarded-Encrypted: i=1; AKwUvBzIq5Ln1YoFp+/VQqfMUKt+K/ZtxPGY3AjylWtBeS5v7yos2pSUW24qVihFCRMtCpkwjxJ8cw2NMpfMkRo=@vger.kernel.org
X-Gm-Message-State: AFuF++kS5w/WbSr0EZv9Mpsqikgyv9mSvoKxM3oTzr1i07ZAWQodCJjN
	fyR0eoyuHDYpU5PgJ5dFKxORBQf+l/R55F3GvI/Rhepz7Fn2HknAhjhN
X-Gm-Gg: AYBFou3qcncCXxj8deLY2KzSYSMGVcCSo/R/WmJccCmJXD9B3LnnrGzb80ZdFotmRMY
	9QMyWCMkaDSafZgumMmYtN8wqvyOKHiqO8W6glG7e45rs0oGUKlt5afeL5p6r/fSDdLLfxt/aKs
	r9xFiu5o/bO1wXZ1oTPXG0FwRfxLYFBTgXhjX6JjcYhtIX8/ry1j6r6rj4XT/XcbGdOiUJ6ZlJr
	ezZ+I4+H09zeMLXFIXwGPFy6AOy+d4L0/Q+w5Y3/1xKjB/MJDBKUOhU75/Kfn6K4bGBNAIpdajU
	s4ojsEd/AqacCACeZCfDxteIOHzBBVAHCyw4beiVVFkjmhhh8TnDRf6dLmMF+Fsj54XdUADqC8v
	qvjaDAbfH3inqtGWanCIMdSsnlWkOxZ0wsKCVf+siWwsFhCX/CxIrSqVHXk9QUsR6pgFxAnZr++
	6wLM87btV5KAot7XRHK2QEcKBtlbp2bpSqjpsoTKbnGQFi9G1IIom956emzWvlUNitA6Z4tdIUN
	i3OrYsJ
X-Received: by 2002:a05:701b:465c:b0:14e:61bb:ec3d with SMTP id a92af1059eb24-14f5bef522cmr9257762c88.16.1791105673081;
        Sun, 04 Oct 2026 02:21:13 -0700 (PDT)
Received: from spidy ([2401:4900:7b2f:abf7:77ff:d5cd:24b2:b295])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-151fcec9a95sm12547242c88.15.2026.10.04.02.21.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Oct 2026 02:21:12 -0700 (PDT)
From: Gowtham S Bhushan <gowtham398gs@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Gowtham S Bhushan <gowtham398gs@gmail.com>
Subject: [PATCH v2] staging: rtl8723bs: rename dot118021x_UncstKey to dot118021x_uncst_key
Date: Sun,  4 Oct 2026 14:49:11 +0530
Message-ID: <20261004091911.16169-1-gowtham398gs@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

checkpatch.pl warns about CamelCase in the struct member
dot118021x_UncstKey. Rename it to dot118021x_uncst_key to follow
the kernel coding style.
Also wrap lines that exceed 100 columns because of the longer name

Signed-off-by: Gowtham S Bhushan <gowtham398gs@gmail.com>
---
v2: dropped an unrelated change to the grpkey memcpy line in ioctl_cfg80211.c
 drivers/staging/rtl8723bs/core/rtw_ap.c           | 2 +-
 drivers/staging/rtl8723bs/core/rtw_cmd.c          | 2 +-
 drivers/staging/rtl8723bs/core/rtw_mlme.c         | 2 +-
 drivers/staging/rtl8723bs/core/rtw_security.c     | 8 ++++----
 drivers/staging/rtl8723bs/core/rtw_xmit.c         | 7 ++++---
 drivers/staging/rtl8723bs/include/rtw_xmit.h      | 2 +-
 drivers/staging/rtl8723bs/include/sta_info.h      | 2 +-
 drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c | 7 +++++--
 8 files changed, 18 insertions(+), 14 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_ap.c b/drivers/staging/rtl8723bs/core/rtw_ap.c
index f98360b59737..c76a2ed910e1 100644
--- a/drivers/staging/rtl8723bs/core/rtw_ap.c
+++ b/drivers/staging/rtl8723bs/core/rtw_ap.c
@@ -1167,7 +1167,7 @@ u8 rtw_ap_set_pairwise_key(struct adapter *padapter, struct sta_info *psta)
 
 	memcpy(psetstakey_para->addr, psta->hwaddr, ETH_ALEN);
 
-	memcpy(psetstakey_para->key, &psta->dot118021x_UncstKey, 16);
+	memcpy(psetstakey_para->key, &psta->dot118021x_uncst_key, 16);
 
 	res = rtw_enqueue_cmd(pcmdpriv, ph2c);
 
diff --git a/drivers/staging/rtl8723bs/core/rtw_cmd.c b/drivers/staging/rtl8723bs/core/rtw_cmd.c
index 1b95ef6996c6..c59b29a02298 100644
--- a/drivers/staging/rtl8723bs/core/rtw_cmd.c
+++ b/drivers/staging/rtl8723bs/core/rtw_cmd.c
@@ -880,7 +880,7 @@ u8 rtw_setstakey_cmd(struct adapter *padapter, struct sta_info *sta, u8 unicast_
 		GET_ENCRY_ALGO(psecuritypriv, sta, psetstakey_para->algorithm, false);
 
 	if (unicast_key)
-		memcpy(&psetstakey_para->key, &sta->dot118021x_UncstKey, 16);
+		memcpy(&psetstakey_para->key, &sta->dot118021x_uncst_key, 16);
 	else
 		memcpy(&psetstakey_para->key, &psecuritypriv->dot118021XGrpKey[psecuritypriv->dot118021XGrpKeyid].skey, 16);
 
diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme.c b/drivers/staging/rtl8723bs/core/rtw_mlme.c
index 0d0602eb4808..7fa64c33a2b3 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme.c
@@ -984,7 +984,7 @@ static struct sta_info *rtw_joinbss_update_stainfo(struct adapter *adapter, stru
 			psta->ieee8021x_blocked = true;
 			psta->dot118021_x_privacy = adapter->securitypriv.dot11_privacy_algrthm;
 
-			memset((u8 *)&psta->dot118021x_UncstKey, 0, sizeof(union Keytype));
+			memset((u8 *)&psta->dot118021x_uncst_key, 0, sizeof(union Keytype));
 
 			memset((u8 *)&psta->dot11tkiprxmickey, 0, sizeof(union Keytype));
 			memset((u8 *)&psta->dot11tkiptxmickey, 0, sizeof(union Keytype));
diff --git a/drivers/staging/rtl8723bs/core/rtw_security.c b/drivers/staging/rtl8723bs/core/rtw_security.c
index 72af46391e23..c6a23ddc419f 100644
--- a/drivers/staging/rtl8723bs/core/rtw_security.c
+++ b/drivers/staging/rtl8723bs/core/rtw_security.c
@@ -458,7 +458,7 @@ u32 rtw_tkip_encrypt(struct adapter *padapter, u8 *pxmitframe)
 	if (is_multicast_ether_addr(pattrib->ra))
 		prwskey = psecuritypriv->dot118021XGrpKey[psecuritypriv->dot118021XGrpKeyid].skey;
 	else
-		prwskey = pattrib->dot118021x_UncstKey.skey;
+		prwskey = pattrib->dot118021x_uncst_key.skey;
 
 	for (curfragnum = 0; curfragnum < pattrib->nr_frags; curfragnum++) {
 		iv = pframe + pattrib->hdrlen;
@@ -573,7 +573,7 @@ u32 rtw_tkip_decrypt(struct adapter *padapter, u8 *precvframe)
 
 		prwskey = psecuritypriv->dot118021XGrpKey[prxattrib->key_index].skey;
 	} else {
-		prwskey = &stainfo->dot118021x_UncstKey.skey[0];
+		prwskey = &stainfo->dot118021x_uncst_key.skey[0];
 	}
 
 	iv = pframe + prxattrib->hdrlen;
@@ -960,7 +960,7 @@ u32 rtw_aes_encrypt(struct adapter *padapter, u8 *pxmitframe)
 	if (is_multicast_ether_addr(pattrib->ra))
 		prwskey = psecuritypriv->dot118021XGrpKey[psecuritypriv->dot118021XGrpKeyid].skey;
 	else
-		prwskey = pattrib->dot118021x_UncstKey.skey;
+		prwskey = pattrib->dot118021x_uncst_key.skey;
 
 	for (curfragnum = 0; curfragnum < pattrib->nr_frags; curfragnum++) {
 		if ((curfragnum + 1) == pattrib->nr_frags) {	/* 4 the last fragment */
@@ -1248,7 +1248,7 @@ u32 rtw_aes_decrypt(struct adapter *padapter, u8 *precvframe)
 			goto exit;
 		}
 	} else {
-		prwskey = &stainfo->dot118021x_UncstKey.skey[0];
+		prwskey = &stainfo->dot118021x_uncst_key.skey[0];
 	}
 
 	length = ((union recv_frame *)precvframe)->u.hdr.len -
diff --git a/drivers/staging/rtl8723bs/core/rtw_xmit.c b/drivers/staging/rtl8723bs/core/rtw_xmit.c
index 57b3690bc48a..4e2f96fc33e3 100644
--- a/drivers/staging/rtl8723bs/core/rtw_xmit.c
+++ b/drivers/staging/rtl8723bs/core/rtw_xmit.c
@@ -512,7 +512,7 @@ static int update_attrib_sec_info(struct adapter *padapter, struct pkt_attrib *p
 	struct security_priv *psecuritypriv = &padapter->securitypriv;
 	signed int bmcast = is_multicast_ether_addr(pattrib->ra);
 
-	memset(pattrib->dot118021x_UncstKey.skey,  0, 16);
+	memset(pattrib->dot118021x_uncst_key.skey,  0, 16);
 	memset(pattrib->dot11tkiptxmickey.skey,  0, 16);
 	pattrib->mac_id = psta->mac_id;
 
@@ -589,7 +589,7 @@ static int update_attrib_sec_info(struct adapter *padapter, struct pkt_attrib *p
 	}
 
 	if (pattrib->encrypt > 0)
-		memcpy(pattrib->dot118021x_UncstKey.skey, psta->dot118021x_UncstKey.skey, 16);
+		memcpy(pattrib->dot118021x_uncst_key.skey, psta->dot118021x_uncst_key.skey, 16);
 
 	if (pattrib->encrypt &&
 		((padapter->securitypriv.sw_encrypt) || (!psecuritypriv->hw_decrypted)))
@@ -1289,7 +1289,8 @@ int rtw_mgmt_xmitframe_coalesce(struct adapter *padapter, struct sk_buff *pkt, s
 				goto xmitframe_coalesce_fail;
 			/* before encrypt dump the management packet content */
 			if (pattrib->encrypt > 0)
-				memcpy(pattrib->dot118021x_UncstKey.skey, psta->dot118021x_UncstKey.skey, 16);
+				memcpy(pattrib->dot118021x_uncst_key.skey,
+				       psta->dot118021x_uncst_key.skey, 16);
 			/* bakeup original management packet */
 			memcpy(tmp_buf, pframe, pattrib->pktlen);
 			/* move to data portion */
diff --git a/drivers/staging/rtl8723bs/include/rtw_xmit.h b/drivers/staging/rtl8723bs/include/rtw_xmit.h
index c5cb814789d8..d6970f244ed0 100644
--- a/drivers/staging/rtl8723bs/include/rtw_xmit.h
+++ b/drivers/staging/rtl8723bs/include/rtw_xmit.h
@@ -162,7 +162,7 @@ struct pkt_attrib {
 	u8 rtsen;
 	u8 cts2self;
 	union Keytype	dot11tkiptxmickey;
-	union Keytype	dot118021x_UncstKey;
+	union Keytype	dot118021x_uncst_key;
 
 	u8 icmp_pkt;
 
diff --git a/drivers/staging/rtl8723bs/include/sta_info.h b/drivers/staging/rtl8723bs/include/sta_info.h
index 21a4ca841e6e..59f17b67335e 100644
--- a/drivers/staging/rtl8723bs/include/sta_info.h
+++ b/drivers/staging/rtl8723bs/include/sta_info.h
@@ -90,7 +90,7 @@ struct sta_info {
 	uint dot118021_x_privacy; /* aes, tkip... */
 	union Keytype dot11tkiptxmickey;
 	union Keytype dot11tkiprxmickey;
-	union Keytype dot118021x_UncstKey;
+	union Keytype dot118021x_uncst_key;
 	union pn48 dot11txpn;			/*  PN48 used for Unicast xmit */
 	union pn48 dot11wtxpn;			/*  PN48 used for Unicast mgmt xmit. */
 	union pn48 dot11rxpn;			/*  PN48 used for Unicast recv. */
diff --git a/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c b/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
index a715ac6aa6b9..127fbae53c89 100644
--- a/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
+++ b/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
@@ -607,7 +607,8 @@ static int rtw_cfg80211_ap_set_encryption(struct net_device *dev, struct ieee_pa
 	if (psecuritypriv->dot11_auth_algrthm == dot11_auth_algrthm_8021x && psta) {/* psk/802_1x */
 		if (check_fwstate(pmlmepriv, WIFI_AP_STATE)) {
 			if (param->u.crypt.set_tx == 1) { /* pairwise key */
-				memcpy(psta->dot118021x_UncstKey.skey, param->u.crypt.key, (param->u.crypt.key_len > 16 ? 16 : param->u.crypt.key_len));
+				memcpy(psta->dot118021x_uncst_key.skey, param->u.crypt.key,
+				       (param->u.crypt.key_len > 16 ? 16 : param->u.crypt.key_len));
 
 				if (strcmp(param->u.crypt.alg, "WEP") == 0) {
 					psta->dot118021_x_privacy = _WEP40_;
@@ -770,7 +771,9 @@ static int rtw_cfg80211_set_encryption(struct net_device *dev, struct ieee_param
 
 				if (param->u.crypt.set_tx == 1) { /* pairwise key */
 
-					memcpy(psta->dot118021x_UncstKey.skey, param->u.crypt.key, (param->u.crypt.key_len > 16 ? 16 : param->u.crypt.key_len));
+					memcpy(psta->dot118021x_uncst_key.skey, param->u.crypt.key,
+					       (param->u.crypt.key_len > 16 ? 16 :
+						param->u.crypt.key_len));
 
 					if (strcmp(param->u.crypt.alg, "TKIP") == 0) { /* set mic key */
 						memcpy(psta->dot11tkiptxmickey.skey, &param->u.crypt.key[16], 8);
-- 
2.55.0

