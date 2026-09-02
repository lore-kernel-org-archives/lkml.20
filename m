Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EEA6381E8C
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 17:39:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788370773; cv=none; b=GtsGo8PPsANX8TFridLWRkB4zf6pdBqRXB/uPROLbDo7Z5LzuJz9K/pX9evhzjWOEFUtT6sSCTAPV9sNZ8n+vDA17yeawB4gVT1N7IaTAdMWUTvwb+GoLX4WAOOW/gDs1AYuAq2kKZiCP1ydhpGxl3NqFLWGcwxbvaVWt+SnCJw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788370773; c=relaxed/simple;
	bh=3dbmWb2Qm1pKmZpCcrRSZOxmIsBhjnhrHRw39IOonQE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=LyGfE5I34Uixf5Da6g1UCHKPr3Irs0mThlWJA/3k4UTd7/ZffZF4Y866peVj8sOBPMrCypYp+W9fklpfK+uNVCM72Iux3zgnf0yLOMTPuyNDMYmknCmhjm5OzfJ7tIbGp5EtI4IN0cXYGse2pIyjLGKtwr/pCwGD5l4NuzB5mJ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ij1cdXk8; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ij1cdXk8"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-84e84a6c4bfso114586b3a.1
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 10:39:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788370771; x=1788975571; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=RFloIhfQ4q+BWHAjn27okStJlZfzSzoO/QTCMXzRVxc=;
        b=ij1cdXk83itXATym3QqBjR99ywjknx5H0cTcUuLztJXdIH/WwTrSb8v5kLHiSSlmzN
         DNC7XAxPcZ1mLKbMyG+wELujpeRLPwi60Z1hpAwij2hWbyZlFeTQIFYXpZ2aohMJCYqv
         FoeI02GY4y/RuRNEymSa1KUnrogrF0+94iyaUTw/TQTuPkffNLVDG2w3+YgMdlV4XzfK
         iiGdb3TAoLfaDHsuhLNb9NvUw2jpuvVFnUXbETCu4j5LOh8LcEz6xCLPhY1BuSGhhKj2
         KKuPbc1oTHewmk6knEj3N5UMidwmtZx786UKeSG7OPQ9kt6DDpoSIcMjLm4Ea5oGWkUt
         VLBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788370771; x=1788975571;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RFloIhfQ4q+BWHAjn27okStJlZfzSzoO/QTCMXzRVxc=;
        b=D8o98Z9PbY052xpFwwfFEtIRcv3ZqRDqgRIMHZw9ctb2iMcpfVElNjI3BVB5i/YbtQ
         /+5tGOvfWaLcSsXB7YvS33PBzvu45kxbpC6DzVuGhRvKTlMkt44hrZN+2MmuA4pf4jG0
         beUc3kbNyVi1HpfZFz7oPcUdqiBP/yTdlFSOaHm96l5R6RLX8m0DwZLZFvjCdOLCrtw4
         B3GgML077QT5wPhqDiU8l5VEpYxU7ZAvdnXad1VFx8a8eYAbqgxjfCg+qxR6fu9JexTm
         pN9SH1/t5l05WSE1/L/ocZEMkUBVlnHWIarlPCrH6Gz/VoFADcMq6PLkKp6xIUJxqESO
         Z2rA==
X-Forwarded-Encrypted: i=1; AKwUvBytSgKyLBir9JCrcpRMQtgIsJCZKzMOAFI4OYyR1Uw0zqyRQ4jDkkc4VALDdxxNecRx3rRiHT99hQWn+AA=@vger.kernel.org
X-Gm-Message-State: AFuF++m4wi2iXqmoMm9oxkvtjYB3/sXhd5IqxKCNKtqejgbO01UvuTis
	mob+COTys6TDgFzFv9Y6sJ9apPnB2KLGtpGBXntZEgkmZDtpMUqa/Sk/TyeFH+zD
X-Gm-Gg: AYBFou2EarU5GVy/X3At6gz9DmCy52/qcG7+iHFJnl/jrr/ZCcEBhnwDWJ/0q7ViisJ
	K78hkLMmd2KKkpoC3OYHN/HwLjTagI7yeWs9qgAlKTvb7htk3CATwW+iMRC2hgAGvFj9wntkjsd
	kjeiyQl60WSNCte0OQJ9mxjciyVRs+DJmgzCUB+7owk96I2nF9F6HgedvWuUHAJDkB3FK1TY1nR
	61JEhCmFsgIq8DCwRWl9agUkYXUmf2S1BGHgpbxOWtwyDbjsSyyfwYBxLxvfwGHx+F3x21o/QQn
	/UKInBEGqm5x/1k0N9dfFjjZMZH+ibJ0knjCxfZEsMER3OIu3G4xrfjoeVi7zrVjkuQ5z3nOP8s
	pvtoIESq//uM57TJt5zjdgMlJzFlWSRZ1Y6cZ1IAzLoxlmZb00gX3mxvKWTnwZG6xGAeWY50KuR
	2czKjzSGrWjhm9RwpgUkRXYkHccsGe039kUhbnhVjxGHKRaHjWU2Z8/oRtUZVB9Z0J/Qj2V4ygL
	7K1tmoBARvr73S+jpeSQZMGlOmyqaP3FrW25Rs=
X-Received: by 2002:a05:6a00:4187:b0:84f:6f7e:493 with SMTP id d2e1a72fcca58-85ffb4b6d31mr607749b3a.3.1788370771012;
        Wed, 02 Sep 2026 10:39:31 -0700 (PDT)
Received: from DESKTOP-PKFJL56.localdomain (36-234-4-160.dynamic-ip.hinet.net. [36.234.4.160])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-85db23f7bccsm1863255b3a.10.2026.09.02.10.39.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 10:39:30 -0700 (PDT)
From: Hank Yang <s950343@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Hank Yang <s950343@gmail.com>
Subject: [PATCH] staging: rtl8723bs: rename CamelCase variables in rtw_mlme.c
Date: Thu,  3 Sep 2026 01:39:01 +0800
Message-ID: <20260902173901.50435-1-s950343@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rename several CamelCase variables to snake_case to comply with
kernel coding style, as flagged by checkpatch.pl:

  CHECK: Avoid CamelCase: <iEntry>
  CHECK: Avoid CamelCase: <backupPMKIDList>
  CHECK: Avoid CamelCase: <backupPMKIDIndex>
  CHECK: Avoid CamelCase: <backupTKIPCountermeasure>
  CHECK: Avoid CamelCase: <backupTKIPcountermeasure_time>

Signed-off-by: Hank Yang <s950343@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_mlme.c | 36 +++++++++++------------
 1 file changed, 18 insertions(+), 18 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme.c b/drivers/staging/rtl8723bs/core/rtw_mlme.c
index 179061239a6f..35729e61cd07 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme.c
@@ -1080,12 +1080,12 @@ static void rtw_joinbss_update_network(struct adapter *adapter, struct wlan_netw
 	rtw_update_ht_cap(adapter, cur_network->network.ies, cur_network->network.ie_length, (u8) cur_network->network.configuration.ds_config);
 }
 
-static struct rt_pmkid_list backupPMKIDList[NUM_PMKID_CACHE];
+static struct rt_pmkid_list backup_pmkid_list[NUM_PMKID_CACHE];
 void rtw_reset_securitypriv(struct adapter *adapter)
 {
-	u8 backupPMKIDIndex = 0;
-	u8 backupTKIPCountermeasure = 0x00;
-	u32 backupTKIPcountermeasure_time = 0;
+	u8 backup_pmkid_index = 0;
+	u8 backup_tkip_countermeasure = 0x00;
+	u32 backup_tkip_countermeasure_time = 0;
 	struct mlme_ext_priv *pmlmeext = &adapter->mlmeextpriv;
 
 	spin_lock_bh(&adapter->security_key_mutex);
@@ -1098,10 +1098,10 @@ void rtw_reset_securitypriv(struct adapter *adapter)
 		/*  Backup the btkip_countermeasure information. */
 		/*  When the countermeasure is trigger, the driver have to disconnect with AP for 60 seconds. */
 
-		memcpy(&backupPMKIDList[0], &adapter->securitypriv.PMKIDList[0], sizeof(struct rt_pmkid_list) * NUM_PMKID_CACHE);
-		backupPMKIDIndex = adapter->securitypriv.PMKIDIndex;
-		backupTKIPCountermeasure = adapter->securitypriv.btkip_countermeasure;
-		backupTKIPcountermeasure_time = adapter->securitypriv.btkip_countermeasure_time;
+		memcpy(&backup_pmkid_list[0], &adapter->securitypriv.PMKIDList[0], sizeof(struct rt_pmkid_list) * NUM_PMKID_CACHE);
+		backup_pmkid_index = adapter->securitypriv.PMKIDIndex;
+		backup_tkip_countermeasure = adapter->securitypriv.btkip_countermeasure;
+		backup_tkip_countermeasure_time = adapter->securitypriv.btkip_countermeasure_time;
 
 		/* reset RX BIP packet number */
 		pmlmeext->mgnt_80211w_IPN_rx = 0;
@@ -1110,10 +1110,10 @@ void rtw_reset_securitypriv(struct adapter *adapter)
 
 		/*  Added by Albert 2009/02/18 */
 		/*  Restore the PMK information to securitypriv structure for the following connection. */
-		memcpy(&adapter->securitypriv.PMKIDList[0], &backupPMKIDList[0], sizeof(struct rt_pmkid_list) * NUM_PMKID_CACHE);
-		adapter->securitypriv.PMKIDIndex = backupPMKIDIndex;
-		adapter->securitypriv.btkip_countermeasure = backupTKIPCountermeasure;
-		adapter->securitypriv.btkip_countermeasure_time = backupTKIPcountermeasure_time;
+		memcpy(&adapter->securitypriv.PMKIDList[0], &backup_pmkid_list[0], sizeof(struct rt_pmkid_list) * NUM_PMKID_CACHE);
+		adapter->securitypriv.PMKIDIndex = backup_pmkid_index;
+		adapter->securitypriv.btkip_countermeasure = backup_tkip_countermeasure;
+		adapter->securitypriv.btkip_countermeasure_time = backup_tkip_countermeasure_time;
 
 		adapter->securitypriv.ndisauthtype = Ndis802_11AuthModeOpen;
 		adapter->securitypriv.ndisencryptstatus = Ndis802_11WEPDisabled;
@@ -2013,7 +2013,7 @@ static int SecIsInPMKIDList(struct adapter *Adapter, u8 *bssid)
 /*  13th element in the array is the IE length */
 /*  */
 
-static int rtw_append_pmkid(struct adapter *Adapter, int iEntry, u8 *ie, uint ie_len)
+static int rtw_append_pmkid(struct adapter *Adapter, int pmkid_idx, u8 *ie, uint ie_len)
 {
 	struct security_priv *psecuritypriv = &Adapter->securitypriv;
 
@@ -2023,7 +2023,7 @@ static int rtw_append_pmkid(struct adapter *Adapter, int iEntry, u8 *ie, uint ie
 		ie_len++;
 		ie[ie_len] = 0;	/* PMKID count = 0x0100 */
 		ie_len++;
-		memcpy(&ie[ie_len], &psecuritypriv->PMKIDList[iEntry].PMKID, 16);
+		memcpy(&ie[ie_len], &psecuritypriv->PMKIDList[pmkid_idx].PMKID, 16);
 		ie_len += 16;
 		ie[13] += 18;/* PMKID length = 2+16 */
 	}
@@ -2067,7 +2067,7 @@ signed int rtw_restruct_sec_ie(struct adapter *adapter, u8 *in_ie, u8 *out_ie, u
 {
 	u8 authmode = 0x0;
 	uint ielength;
-	int iEntry;
+	int pmkid_idx;
 
 	struct mlme_priv *mlme_priv = &adapter->mlmepriv;
 	struct security_priv *psecuritypriv = &adapter->securitypriv;
@@ -2092,12 +2092,12 @@ signed int rtw_restruct_sec_ie(struct adapter *adapter, u8 *in_ie, u8 *out_ie, u
 		rtw_report_sec_ie(adapter, authmode, psecuritypriv->supplicant_ie);
 	}
 
-	iEntry = SecIsInPMKIDList(adapter, mlme_priv->assoc_bssid);
-	if (iEntry < 0)
+	pmkid_idx = SecIsInPMKIDList(adapter, mlme_priv->assoc_bssid);
+	if (pmkid_idx < 0)
 		return ielength;
 
 	if (authmode == WLAN_EID_RSN)
-		ielength = rtw_append_pmkid(adapter, iEntry, out_ie, ielength);
+		ielength = rtw_append_pmkid(adapter, pmkid_idx, out_ie, ielength);
 
 	return ielength;
 }
-- 
2.43.0

