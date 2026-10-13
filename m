Received: from mail-ot1-f54.google.com (mail-ot1-f54.google.com [209.85.210.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B79C854855D
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 20:15:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791922550; cv=none; b=Ui9g53q9YOpnTVZ1bxdnQv4QCH9njwTunZ4HwmBp+IgUpFjovUrBmiHWW8EiRArqYpZZEdmzN01sBZ5+PoxyHwCpr/PtP2ar8s7p6/f9ZHySHhMy6fw0P7hywklebsgg8sI10lqkaA/FH8gid4rqq/KuW5WJRF8FzJOVrRUch/0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791922550; c=relaxed/simple;
	bh=NbA2GcP4Lr6cnBCo/m/J4Gq2aFWPZ4BazXL7PMFsUFg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DeorUu7T18FBNknbjjCCv5nl9vlcG52XrlJMNATpdsMySKDC5j/VV55lkJ6HpdifnlOvKUSitGpnrkmNywxNf+7s/egtN686dDSjX9l3EQz/SbjC59FHcPkMlEmZ+OWyMY5hIfSnbK5v1CNSOEYpA10LVaKCEpvg82FkQmnkQPY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SojVSfzQ; arc=none smtp.client-ip=209.85.210.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SojVSfzQ"
Received: by mail-ot1-f54.google.com with SMTP id 46e09a7af769-821b5c73292so2441783a34.1
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 13:15:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791922543; x=1792527343; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZAYbhl8kX/IVaP666bJYOPGUDp0WP0iUVoNYGhCA0n0=;
        b=SojVSfzQT952cbMdLuFfpqeJLOu9QvZypncAkSrjSlF6mBYtA9AvltcSN1i6J8gpTM
         UgyrAF2vXraK7V9juXEF6OrH4kWztD2SiyX5k3AXgfUUC59jAcyGOmAm5yA3FOBr+zpM
         3jy/I76fxA3Na2HlmFwuYJ0RNrXlIPIf04LodNl0nS28BpLZe2MFFqtsatOdVqZgyxvG
         ssmahg4LmfBHa4Cl9FqDLlaKzkyn0DRmEz+Z/zIS028ekNuRHLedkhKpwqVLycjnQRDI
         cYpTSMkzO54+z1GTLdD0KpB68nt/3CRtKAfXDEnUA2Ry7L5UYcQ13YiI50YPWiR0PoTW
         oy4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791922543; x=1792527343;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZAYbhl8kX/IVaP666bJYOPGUDp0WP0iUVoNYGhCA0n0=;
        b=K8Lgl1il9BW/q2Rxlq2ksdI5oRJ28sLwBNF110wQ/GeG5Y8eFLpahEeZxTLQn65101
         f4oYOoLMlMAw8scXPc+zgl8fUSPV3OczdLocmvLSh4ChzwJ03fqriQX3kf7CoBElNBpK
         UAmvA2FRvHGtu8hkn6mr6/TBLBTgtpELPaTmI7aZiPgktl7hY8UL9Rj7K6JjKaL03G45
         AipN7YzR2NOCtbnBi4BQB+CZlG3WsJXVLeJA0FVIyXMtFok7y8eHmdtgEUq3n3FhIDd2
         g5O1TwUFRogAQk/EHix23vYT8wZurWZsZfcZM5kMbv3PAk2eyzqzYMzbEFDLjm1BKWgx
         nprQ==
X-Forwarded-Encrypted: i=1; AKwUvBy72y8t5aHS0y5ITJVNiL8w7YKtxxX83qJ+/VsKINVN5ch9Z+OQcCncVrPhQXvbrCbAfzrmZR5n6YLo/sY=@vger.kernel.org
X-Gm-Message-State: AFq9FYLKp5ZeX2dJO7Qi+xuVfzMtKlJHxY5v3GI9ADtOVbPKdcsz9bQq
	H/yIU8qzqbRnKwYW5u9mjCw68n/WQKmh1KPCSIcgLHmS7/xhdJ42I47T
X-Gm-Gg: AYBFou22FKH6NXb+de1BtuqmCOP0KbaV7kkd83nOHxcJ1Xp5opFKF+MeHxEl93oongE
	b2lT0aIDa8tIRybm1/TSVWL1p5YlUUzRi4Ump2fYKOLWWXo3zsxn/iuC4fBAPyM3vIE7Fn1uae0
	8dEHrlZm5/5qdqk1UGdhNLKhDYH0qc9HsWt2s7VsN3pSNAa2Tc5+2n841GbJVjdGPJ93T7mhZqg
	UHKqPe9TCTv7AqQQWxOTrkOjRuCClXvyYdo5uaqvV7P1lDcWjpyA9pAUTG4IHQhwrq1fmvxcHv8
	b6jBhJXvADcT/kst0VhAVvJm2XyHS3ThM5Z7gQdbKS5+ohTx7rdAaSARouJLmS04I7siNdXgwxu
	qRosR7QLt8ej21u0eeoGBDp8fRIFF6Bmht4Kav9hFXSC0bPDQX/S/HSDDNtSs/oNOoJuX1VLH4D
	M5fC9tYXe68iOReUgflb6i4M7CRW+nPX7pzdHHmIJWW7iO5FAI9HoL5JGn//InkyQJM1OQkFrg2
	HY=
X-Received: by 2002:a05:6830:490c:b0:80c:d34f:5f62 with SMTP id 46e09a7af769-83097e5963cmr13101661a34.27.1791922543519;
        Tue, 13 Oct 2026 13:15:43 -0700 (PDT)
Received: from pop-os.. ([24.32.17.59])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-83038f82468sm13557570a34.11.2026.10.13.13.15.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 13:15:42 -0700 (PDT)
From: Rishik Yechuri <epicrishik@gmail.com>
X-Google-Original-From: Rishik Yechuri <rishik.yechuri.code@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Rishik Yechuri <rishik.yechuri.code@gmail.com>
Subject: [PATCH 03/10] staging: rtl8723bs: set frame control flags with IEEE80211_FCTL_* masks
Date: Tue, 13 Oct 2026 15:15:31 -0500
Message-ID: <20261013201538.43156-4-rishik.yechuri.code@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261013201538.43156-1-rishik.yechuri.code@gmail.com>
References: <20261013201538.43156-1-rishik.yechuri.code@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The driver defines SetToDs(), SetFrDs(), SetMFrag(), ClearMFrag(),
ClearRetry(), SetPwrMgt(), ClearPwrMgt(), SetMData(), ClearMData() and
SetPrivacy() in wifi.h to set and clear bits of the IEEE 802.11 Frame
Control field, using private _TO_DS_ through _ORDER_ bit definitions
that duplicate the IEEE80211_FCTL_* constants in <linux/ieee80211.h>.

Replace each use of these macros by operating on the frame_control
member directly with the corresponding IEEE80211_FCTL_* mask, as is
done elsewhere in the wireless subsystem.

In rtw_xmitframe_coalesce(), the header pointer is updated on each
iteration of the fragmentation loop, since mem_start advances to a new
fragment each time.

When constructing the BIP additional authentication data, mask the
Retry, Power Management and More Data bits in a local copy of the
Frame Control field before copying it into the buffer. This matches
bip_aad() in net/mac80211/wpa.c.

Remove the macro definitions and the private bit definitions, which no
longer have any users. Also remove the mem_start variable from
rtw_mgmt_xmitframe_coalesce(), as its only use was the SetPrivacy()
call.

No functional change intended.

Signed-off-by: Rishik Yechuri <rishik.yechuri.code@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_mlme_ext.c | 12 +++---
 drivers/staging/rtl8723bs/core/rtw_security.c |  9 +++--
 drivers/staging/rtl8723bs/core/rtw_xmit.c     | 29 +++++++-------
 drivers/staging/rtl8723bs/hal/rtl8723b_cmd.c  | 12 +++---
 drivers/staging/rtl8723bs/include/wifi.h      | 39 -------------------
 5 files changed, 33 insertions(+), 68 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
index d318b0ff4..842c3d39c 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
@@ -2573,7 +2573,7 @@ void issue_auth(struct adapter *padapter, struct sta_info *psta, unsigned short
 		if ((pmlmeinfo->auth_seq == 3) && (pmlmeinfo->state & WIFI_FW_AUTH_STATE) && (use_shared_key == 1)) {
 			pframe = rtw_set_ie(pframe, WLAN_EID_CHALLENGE, 128, pmlmeinfo->chg_txt, &(pattrib->pktlen));
 
-			SetPrivacy(fctrl);
+			*fctrl |= cpu_to_le16(IEEE80211_FCTL_PROTECTED);
 
 			pattrib->hdrlen = sizeof(struct ieee80211_hdr_3addr);
 
@@ -2926,12 +2926,12 @@ static int _issue_nulldata(struct adapter *padapter, unsigned char *da,
 	*(fctrl) = 0;
 
 	if ((pmlmeinfo->state & 0x03) == WIFI_FW_AP_STATE)
-		SetFrDs(fctrl);
+		*fctrl |= cpu_to_le16(IEEE80211_FCTL_FROMDS);
 	else if ((pmlmeinfo->state & 0x03) == WIFI_FW_STATION_STATE)
-		SetToDs(fctrl);
+		*fctrl |= cpu_to_le16(IEEE80211_FCTL_TODS);
 
 	if (power_mode)
-		SetPwrMgt(fctrl);
+		*fctrl |= cpu_to_le16(IEEE80211_FCTL_PM);
 
 	memcpy(pwlanhdr->addr1, da, ETH_ALEN);
 	memcpy(pwlanhdr->addr2, myid(&(padapter->eeprompriv)), ETH_ALEN);
@@ -3068,9 +3068,9 @@ static int _issue_qos_nulldata(struct adapter *padapter, unsigned char *da,
 	*(fctrl) = 0;
 
 	if ((pmlmeinfo->state & 0x03) == WIFI_FW_AP_STATE)
-		SetFrDs(fctrl);
+		*fctrl |= cpu_to_le16(IEEE80211_FCTL_FROMDS);
 	else if ((pmlmeinfo->state & 0x03) == WIFI_FW_STATION_STATE)
-		SetToDs(fctrl);
+		*fctrl |= cpu_to_le16(IEEE80211_FCTL_TODS);
 
 	qc = (unsigned short *)(pframe + pattrib->hdrlen - 2);
 
diff --git a/drivers/staging/rtl8723bs/core/rtw_security.c b/drivers/staging/rtl8723bs/core/rtw_security.c
index ae64823af..fc3113922 100644
--- a/drivers/staging/rtl8723bs/core/rtw_security.c
+++ b/drivers/staging/rtl8723bs/core/rtw_security.c
@@ -1277,6 +1277,7 @@ u32 rtw_BIP_verify(struct adapter *padapter, u8 *precvframe)
 	u8 mic[16];
 	struct mlme_ext_priv *pmlmeext = &padapter->mlmeextpriv;
 	__le16 le_tmp;
+	__le16 mask_fc;
 	__le64 le_tmp64 = 0;
 
 	ori_len = pattrib->pkt_len - WLAN_HDR_A3_LEN + BIP_AAD_SIZE;
@@ -1320,10 +1321,10 @@ u32 rtw_BIP_verify(struct adapter *padapter, u8 *precvframe)
 		memset(p + 2 + len - 8, 0, 8);
 
 		/* conscruct AAD, copy frame control field */
-		memcpy(BIP_AAD, &pwlanhdr->frame_control, 2);
-		ClearRetry(BIP_AAD);
-		ClearPwrMgt(BIP_AAD);
-		ClearMData(BIP_AAD);
+		mask_fc = pwlanhdr->frame_control;
+		mask_fc &= ~cpu_to_le16(IEEE80211_FCTL_RETRY | IEEE80211_FCTL_PM |
+					IEEE80211_FCTL_MOREDATA);
+		memcpy(BIP_AAD, &mask_fc, 2);
 		/* conscruct AAD, copy address 1 to address 3 */
 		memcpy(BIP_AAD + 2, &pwlanhdr->addrs, sizeof(pwlanhdr->addrs));
 
diff --git a/drivers/staging/rtl8723bs/core/rtw_xmit.c b/drivers/staging/rtl8723bs/core/rtw_xmit.c
index 364de3c8d..db75ff51f 100644
--- a/drivers/staging/rtl8723bs/core/rtw_xmit.c
+++ b/drivers/staging/rtl8723bs/core/rtw_xmit.c
@@ -921,7 +921,7 @@ int rtw_make_wlanhdr(struct adapter *padapter, u8 *hdr, struct pkt_attrib *pattr
 			{
 				/*  1.Data transfer to AP */
 				/*  2.Arp pkt will relayed by AP */
-				SetToDs(fctrl);
+				*fctrl |= cpu_to_le16(IEEE80211_FCTL_TODS);
 				memcpy(pwlanhdr->addr1, get_bssid(pmlmepriv), ETH_ALEN);
 				memcpy(pwlanhdr->addr2, pattrib->src, ETH_ALEN);
 				memcpy(pwlanhdr->addr3, pattrib->dst, ETH_ALEN);
@@ -930,7 +930,7 @@ int rtw_make_wlanhdr(struct adapter *padapter, u8 *hdr, struct pkt_attrib *pattr
 			if (pqospriv->qos_option)
 				qos_option = true;
 		} else if (check_fwstate(pmlmepriv, WIFI_AP_STATE)) {
-			SetFrDs(fctrl);
+			*fctrl |= cpu_to_le16(IEEE80211_FCTL_FROMDS);
 			memcpy(pwlanhdr->addr1, pattrib->dst, ETH_ALEN);
 			memcpy(pwlanhdr->addr2, get_bssid(pmlmepriv), ETH_ALEN);
 			memcpy(pwlanhdr->addr3, pattrib->src, ETH_ALEN);
@@ -950,10 +950,10 @@ int rtw_make_wlanhdr(struct adapter *padapter, u8 *hdr, struct pkt_attrib *pattr
 		}
 
 		if (pattrib->mdata)
-			SetMData(fctrl);
+			*fctrl |= cpu_to_le16(IEEE80211_FCTL_MOREDATA);
 
 		if (pattrib->encrypt)
-			SetPrivacy(fctrl);
+			*fctrl |= cpu_to_le16(IEEE80211_FCTL_PROTECTED);
 
 		if (qos_option) {
 			qc = (unsigned short *)(hdr + pattrib->hdrlen - 2);
@@ -1069,6 +1069,7 @@ int rtw_xmitframe_coalesce(struct adapter *padapter, struct sk_buff *pkt, struct
 	SIZE_PTR addr;
 
 	u8 *pframe, *mem_start;
+	struct ieee80211_hdr *hdr;
 	u8 hw_hdr_offset;
 
 	struct xmit_priv *pxmitpriv = &padapter->xmitpriv;
@@ -1106,8 +1107,9 @@ int rtw_xmitframe_coalesce(struct adapter *padapter, struct sk_buff *pkt, struct
 		mpdu_len = frg_len;
 
 		pframe = mem_start;
+		hdr = (struct ieee80211_hdr *)mem_start;
 
-		SetMFrag(mem_start);
+		hdr->frame_control |= cpu_to_le16(IEEE80211_FCTL_MOREFRAGS);
 
 		pframe += pattrib->hdrlen;
 		mpdu_len -= pattrib->hdrlen;
@@ -1157,7 +1159,7 @@ int rtw_xmitframe_coalesce(struct adapter *padapter, struct sk_buff *pkt, struct
 						((pattrib->bswenc) ? pattrib->icv_len : 0) +
 						mem_sz;
 
-			ClearMFrag(mem_start);
+			hdr->frame_control &= ~cpu_to_le16(IEEE80211_FCTL_MOREFRAGS);
 
 			break;
 		}
@@ -1185,7 +1187,7 @@ int rtw_xmitframe_coalesce(struct adapter *padapter, struct sk_buff *pkt, struct
 /* broadcast or multicast management pkt use BIP, unicast management pkt use CCMP encryption */
 int rtw_mgmt_xmitframe_coalesce(struct adapter *padapter, struct sk_buff *pkt, struct xmit_frame *pxmitframe)
 {
-	u8 *pframe, *mem_start = NULL, *tmp_buf = NULL;
+	u8 *pframe, *tmp_buf = NULL;
 	u8 subtype;
 	struct sta_info *psta = NULL;
 	struct pkt_attrib *pattrib = &pxmitframe->attrib;
@@ -1196,10 +1198,11 @@ int rtw_mgmt_xmitframe_coalesce(struct adapter *padapter, struct sk_buff *pkt, s
 	struct mlme_ext_priv *pmlmeext = &padapter->mlmeextpriv;
 	struct mlme_priv *pmlmepriv = &padapter->mlmepriv;
 	struct ieee80211_hdr	*pwlanhdr;
+	__le16 mask_fc;
 	u8 MME[_MME_IE_LENGTH_];
 	u32 ori_len;
 
-	mem_start = pframe = (u8 *)(pxmitframe->buf_addr) + TXDESC_OFFSET;
+	pframe = (u8 *)(pxmitframe->buf_addr) + TXDESC_OFFSET;
 	pwlanhdr = (struct ieee80211_hdr *)pframe;
 
 	ori_len = BIP_AAD_SIZE + pattrib->pktlen;
@@ -1249,10 +1252,10 @@ int rtw_mgmt_xmitframe_coalesce(struct adapter *padapter, struct sk_buff *pkt, s
 		frame_body_len = pattrib->pktlen - sizeof(struct ieee80211_hdr_3addr);
 
 		/* conscruct AAD, copy frame control field */
-		memcpy(BIP_AAD, &pwlanhdr->frame_control, 2);
-		ClearRetry(BIP_AAD);
-		ClearPwrMgt(BIP_AAD);
-		ClearMData(BIP_AAD);
+		mask_fc = pwlanhdr->frame_control;
+		mask_fc &= ~cpu_to_le16(IEEE80211_FCTL_RETRY | IEEE80211_FCTL_PM |
+					IEEE80211_FCTL_MOREDATA);
+		memcpy(BIP_AAD, &mask_fc, 2);
 		/* conscruct AAD, copy address 1 to address 3 */
 		memcpy(BIP_AAD + 2, &pwlanhdr->addrs, sizeof(pwlanhdr->addrs));
 		/* copy management fram body */
@@ -1329,7 +1332,7 @@ int rtw_mgmt_xmitframe_coalesce(struct adapter *padapter, struct sk_buff *pkt, s
 			pattrib->last_txcmdsz = pattrib->pktlen;
 
 			/* set protected bit must be before SW encrypt */
-			SetPrivacy(mem_start);
+			pwlanhdr->frame_control |= cpu_to_le16(IEEE80211_FCTL_PROTECTED);
 			/* software encrypt */
 			xmitframe_swencrypt(padapter, pxmitframe);
 		}
diff --git a/drivers/staging/rtl8723bs/hal/rtl8723b_cmd.c b/drivers/staging/rtl8723bs/hal/rtl8723b_cmd.c
index 734fb9bb1..5600d9064 100644
--- a/drivers/staging/rtl8723bs/hal/rtl8723b_cmd.c
+++ b/drivers/staging/rtl8723bs/hal/rtl8723b_cmd.c
@@ -192,7 +192,7 @@ static void ConstructPSPoll(struct adapter *padapter, u8 *pframe, u32 *pLength)
 	/*  Frame control. */
 	fctrl = &pwlanhdr->frame_control;
 	*(fctrl) = 0;
-	SetPwrMgt(fctrl);
+	*fctrl |= cpu_to_le16(IEEE80211_FCTL_PM);
 	SetFrameSubType(pframe, WIFI_PSPOLL);
 
 	/*  AID. */
@@ -229,17 +229,17 @@ static void ConstructNullFunctionData(struct adapter *padapter,
 	fctrl = &pwlanhdr->frame_control;
 	*(fctrl) = 0;
 	if (bForcePowerSave)
-		SetPwrMgt(fctrl);
+		*fctrl |= cpu_to_le16(IEEE80211_FCTL_PM);
 
 	switch (cur_network->network.infrastructure_mode) {
 	case NL80211_IFTYPE_STATION:
-		SetToDs(fctrl);
+		*fctrl |= cpu_to_le16(IEEE80211_FCTL_TODS);
 		ether_addr_copy(pwlanhdr->addr1, get_my_bssid(&(pmlmeinfo->network)));
 		ether_addr_copy(pwlanhdr->addr2, myid(&(padapter->eeprompriv)));
 		ether_addr_copy(pwlanhdr->addr3, StaAddr);
 		break;
 	case NL80211_IFTYPE_AP:
-		SetFrDs(fctrl);
+		*fctrl |= cpu_to_le16(IEEE80211_FCTL_FROMDS);
 		ether_addr_copy(pwlanhdr->addr1, StaAddr);
 		ether_addr_copy(pwlanhdr->addr2, get_my_bssid(&(pmlmeinfo->network)));
 		ether_addr_copy(pwlanhdr->addr3, myid(&(padapter->eeprompriv)));
@@ -732,9 +732,9 @@ static void ConstructBtNullFunctionData(struct adapter *padapter,
 	fctrl = &pwlanhdr->frame_control;
 	*fctrl = 0;
 	if (bForcePowerSave)
-		SetPwrMgt(fctrl);
+		*fctrl |= cpu_to_le16(IEEE80211_FCTL_PM);
 
-	SetFrDs(fctrl);
+	*fctrl |= cpu_to_le16(IEEE80211_FCTL_FROMDS);
 	ether_addr_copy(pwlanhdr->addr1, StaAddr);
 	ether_addr_copy(pwlanhdr->addr2, myid(&padapter->eeprompriv));
 	ether_addr_copy(pwlanhdr->addr3, myid(&padapter->eeprompriv));
diff --git a/drivers/staging/rtl8723bs/include/wifi.h b/drivers/staging/rtl8723bs/include/wifi.h
index 800bfd962..bfc985870 100644
--- a/drivers/staging/rtl8723bs/include/wifi.h
+++ b/drivers/staging/rtl8723bs/include/wifi.h
@@ -63,45 +63,6 @@ enum {
     WIFI_QOS_DATA_NULL	= (BIT(6) | WIFI_QOS_DATA_TYPE),
 };
 
-#define _TO_DS_		BIT(8)
-#define _FROM_DS_	BIT(9)
-#define _MORE_FRAG_	BIT(10)
-#define _RETRY_		BIT(11)
-#define _PWRMGT_	BIT(12)
-#define _MORE_DATA_	BIT(13)
-#define _PRIVACY_	BIT(14)
-#define _ORDER_			BIT(15)
-
-#define SetToDs(pbuf)	\
-	(*(__le16 *)(pbuf) |= cpu_to_le16(_TO_DS_))
-
-#define SetFrDs(pbuf)	\
-	(*(__le16 *)(pbuf) |= cpu_to_le16(_FROM_DS_))
-
-#define SetMFrag(pbuf)	\
-	(*(__le16 *)(pbuf) |= cpu_to_le16(_MORE_FRAG_))
-
-#define ClearMFrag(pbuf)	\
-	(*(__le16 *)(pbuf) &= (~cpu_to_le16(_MORE_FRAG_)))
-
-#define ClearRetry(pbuf)	\
-	(*(__le16 *)(pbuf) &= (~cpu_to_le16(_RETRY_)))
-
-#define SetPwrMgt(pbuf)	\
-	(*(__le16 *)(pbuf) |= cpu_to_le16(_PWRMGT_))
-
-#define ClearPwrMgt(pbuf)	\
-	(*(__le16 *)(pbuf) &= (~cpu_to_le16(_PWRMGT_)))
-
-#define SetMData(pbuf)	\
-	(*(__le16 *)(pbuf) |= cpu_to_le16(_MORE_DATA_))
-
-#define ClearMData(pbuf)	\
-	(*(__le16 *)(pbuf) &= (~cpu_to_le16(_MORE_DATA_)))
-
-#define SetPrivacy(pbuf)	\
-	(*(__le16 *)(pbuf) |= cpu_to_le16(_PRIVACY_))
-
 #define GetFrameType(pbuf)				\
 	(le16_to_cpu(*(__le16 *)(pbuf)) & (BIT(3) | BIT(2)))
 
-- 
2.43.0

