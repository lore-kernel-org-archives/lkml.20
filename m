Received: from mail-dl1-f41.google.com (mail-dl1-f41.google.com [74.125.82.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9836F3E16A5
	for <linux-kernel@vger.kernel.org>; Sun,  4 Oct 2026 03:16:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791083769; cv=none; b=KsaKiecARIh6W0Ex9FkGE5fpq3vc0GUHWsd8Q+KK2LL9LKpViU0iKiVjnHGV7IWjYy8JHdPXUbphf2R+vfh3z9AilEpwb2u70clLjiZsre5c5vVT0iW61CBDgedMfLyxc/5rQHufISQIJ8cxbv2kqa0Ix6d+ioBX9PBzL8Y51PI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791083769; c=relaxed/simple;
	bh=BMTxjU/NHo8XmVRbTj0Ek9ma4oMp1HmfP+KfsbCXQQc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=N4IzZoJZH5tnwNzv0BvbLJyOb3e35uzDVNduMVPIGNypPJULXLiLCoLX12Xwoz2MzH4SYV8z7w+BCsau4PoZ2j4wmG2iyU56211yjs1bkrSZAH6TkSVVrhHj9TBE/yWyJ98v0FjEuVVmCpdTrvfkQk+Js+trl4WYtQkebjf8GqU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NY7CSXE3; arc=none smtp.client-ip=74.125.82.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NY7CSXE3"
Received: by mail-dl1-f41.google.com with SMTP id a92af1059eb24-154e9d2d979so136201c88.1
        for <linux-kernel@vger.kernel.org>; Sat, 03 Oct 2026 20:16:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791083766; x=1791688566; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=M9e1Z7o6EibuAFuj2iS/zWCWtXjJ8iqS1M/KsPh2Xls=;
        b=NY7CSXE3vim7B6MIi4ZgsW7xsxXHjK+Tdz7mmlv6wyhVVi7RmWTO/8PWmjy/G6kpeY
         6SJBG7k0ehXWGgwjNusu8QHyF5NLXxqMQxRnKhBE0m5kplsbXoClhfRsBPp1mm06pOwf
         aeQsUEAipZr6aidjUeUSjqD2pDBE/daGccFGM4xW4BmD/50JzlDfACf8iHviKia0Q4W8
         uS37ziDE+vaWs5Xn24TGEdTnyaGHIcB2cRHsQVZN4O7U9cove5RzHkMjTwWAw4mcGxhC
         UOhs9PudoAWlY3PDlc0XXnBrZJA0GPvALjYfqVYwh1mddAiTXJLdzlBqURH5Vu8N2f9M
         uCmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791083766; x=1791688566;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=M9e1Z7o6EibuAFuj2iS/zWCWtXjJ8iqS1M/KsPh2Xls=;
        b=D/Y4n7qjRqjv+2LyLM8CTClIYCrUglKAcuYiP+Fx+Rl0UlJ80hac7NQ6QqD3iUowsc
         wv8+BJ+suHHiyH0Wg6ffTwFQzVq+Eb9cMOb4ivJcq3f7rQMND515jVfmVPNVzGTfsSJt
         nPYXb/hRc4InqEaV9h9kyX3EbPPx9eyWGFFvaDDb/BB7Agbj2QkBu85gpmYJ3Teb8CTJ
         lGpNiAdKPVejCYwPEBfT++hFxd9qDYAib0T9BnjZaqcOWHheHnevYb/CpGjLwluWSJG4
         f8Us6UXzpxE4Pwyog7H8Zxl3w6+lkBzmVCLzY9tN2mA+of6mjoghC0yfH91HQ/ygDuCW
         UN1Q==
X-Forwarded-Encrypted: i=1; AKwUvBwKbn64hNQ+axF7zUIBnkDlmNQJmD+RA9WqFiyy3YtIinFkj2Ikq/xwizVAHBC0ETVGIcZstwoUMk0Urls=@vger.kernel.org
X-Gm-Message-State: AFuF++lQrwCqVQn9L0RjI+JvxcAyn8dQVmushHfKSm/HNKDv33uRobSJ
	azlO1s/AVq4meGBFZrYC7MudtZM9jqRXlpkrmce5dURQEZ5CjB1m9XYPshM4YQEr
X-Gm-Gg: AYBFou2FcvIfZ8MBfjZBpivwJimSi7KEGfRWMM3MasCIznTIFOu9Am02OvHZo4qg5xs
	oA68VdTxXckNSO5OsYT48F2eoP1fQjj7HNiUvD5hc2A4tSpwYTh6vMPrJCIyXwYYFbUR2oBJw3O
	SnjE4sviKTHWdsbwhZMUZpka4TUCZ5xIX/kRRy6/032Tw+R4IbZl6URMufpm3yV/ZMVFxn6MkXe
	GKskCcuPpBnon+2vQB6HB6SmbCtcd2X1Moti0I/gh4MQ/bVi8jbS6CmHyUSsbXJaF7AGOhG7yAk
	HGw2Xx9WC3AxBDEUVyt6ARxvbUhz2KIN1572XAYzlZUcEhmnIytf1xRqTEAloWOuJLEFz6GLPNe
	xjkSJTNVG/KiKyh2VmXCmrV3oqAf55p3uszrtRv6qxIRLx4UDMIUBSvAMGY1ZhrBDS7Bu8c+7CM
	NbnlFl38GDXnmA+EmqSyBHGK/gLnQOgPKxob1pc5JV5ZBQJhLu3RlJDHVy9T0p4V8U9A==
X-Received: by 2002:a05:7022:1219:b0:14a:51c8:e9fb with SMTP id a92af1059eb24-14dd0ebf8acmr11951976c88.13.1791083766234;
        Sat, 03 Oct 2026 20:16:06 -0700 (PDT)
Received: from spidy ([2401:4900:55a7:b1f9:c64:d410:43fb:982c])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-151fa751693sm23197881c88.2.2026.10.03.20.16.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Oct 2026 20:16:05 -0700 (PDT)
From: Gowtham S Bhushan <gowtham398gs@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Gowtham S Bhushan <gowtham398gs@gmail.com>
Subject: [PATCH] staging: rtl8723bs: rename dot118021x_UncstKey to dot118021x_uncst_key
Date: Sun,  4 Oct 2026 08:44:57 +0530
Message-ID: <20261004031457.23174-1-gowtham398gs@gmail.com>
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
 drivers/staging/rtl8723bs/core/rtw_ap.c           |  2 +-
 drivers/staging/rtl8723bs/core/rtw_cmd.c          |  2 +-
 drivers/staging/rtl8723bs/core/rtw_mlme.c         |  2 +-
 drivers/staging/rtl8723bs/core/rtw_security.c     |  8 ++++----
 drivers/staging/rtl8723bs/core/rtw_xmit.c         |  7 ++++---
 drivers/staging/rtl8723bs/include/rtw_xmit.h      |  2 +-
 drivers/staging/rtl8723bs/include/sta_info.h      |  2 +-
 drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c | 11 ++++++++---
 8 files changed, 21 insertions(+), 15 deletions(-)

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
index a715ac6aa6b9..7144b058b601 100644
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
@@ -636,7 +637,9 @@ static int rtw_cfg80211_ap_set_encryption(struct net_device *dev, struct ieee_pa
 
 			} else { /* group key??? */
 				if (strcmp(param->u.crypt.alg, "WEP") == 0) {
-					memcpy(grpkey, param->u.crypt.key, (param->u.crypt.key_len > 16 ? 16 : param->u.crypt.key_len));
+					memcpy(grpkey, param->u.crypt.key,
+					       (param->u.crypt.key_len > 16 ? 16 :
+						param->u.crypt.key_len));
 
 					psecuritypriv->dot118021XGrpPrivacy = _WEP40_;
 					if (param->u.crypt.key_len == 13)
@@ -770,7 +773,9 @@ static int rtw_cfg80211_set_encryption(struct net_device *dev, struct ieee_param
 
 				if (param->u.crypt.set_tx == 1) { /* pairwise key */
 
-					memcpy(psta->dot118021x_UncstKey.skey, param->u.crypt.key, (param->u.crypt.key_len > 16 ? 16 : param->u.crypt.key_len));
+					memcpy(psta->dot118021x_uncst_key.skey, param->u.crypt.key,
+					       (param->u.crypt.key_len > 16 ? 16 :
+						param->u.crypt.key_len));
 
 					if (strcmp(param->u.crypt.alg, "TKIP") == 0) { /* set mic key */
 						memcpy(psta->dot11tkiptxmickey.skey, &param->u.crypt.key[16], 8);
-- 
2.55.0

