Received: from mail-ot1-f42.google.com (mail-ot1-f42.google.com [209.85.210.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1C435476EE
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 20:15:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791922551; cv=none; b=o6o+egEkiWKoqOX/+3jgAga/xrSGMAihSecV9IpQyXeyw0mc6kf4bToJPSV0I+xi7muIpOllMZrw+S8/6qSQNr8T6OIsPjU6Fl4ZjlbKohS1xiC7UJB/XaoQHOjsf9/HPBJn4tdq29S9edhGQDL10u/sgYHADJWP7WihJ/xntHU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791922551; c=relaxed/simple;
	bh=I+NdIKU01Z7WUSf5DE1xW1Wbmeu81osluftFHMiNXWw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=b42xS+9C7t5ffc6nSfZu9TK/F41UJ4ZObQrBsOzdA518uIQshjW6UqTpCyScuffAdMr7nFJTqWKTVtTgk76WCp3QyDGhO9QEQk0OKjkuNN9DtEh2pmD11i9d9QVd/CMnNSfm8UnpGWPA9wUk/JIlRGY8mdX/KnQ348Wr4Fecbbg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ayDVVWEG; arc=none smtp.client-ip=209.85.210.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ayDVVWEG"
Received: by mail-ot1-f42.google.com with SMTP id 46e09a7af769-7fccba9c675so6482137a34.0
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 13:15:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791922546; x=1792527346; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=P1VoopQsNzs3OiTLGLS/LZbk0RPHVRqGEEw5UCMuK14=;
        b=ayDVVWEGGgzgngP4JCIrjbnz218bI52Xl7UQBUaw5PRLC563K/V6hHSfDK2OngTqp4
         Y4fmu94Qth/TQL5gPSEk21pbOqDbudJsDhEP5tGpGPLrf3Fk2GpcHcwidZATNmiP3hTB
         Sl9NCR3pgTy9GOsv2q56HmQ3M1tOyKZiZIgXrwkkO05MgNEYysEezZcsPgPXETj2zD30
         DqRaqsReJTqIBDrSCvl3/nb22dsLbKkYlo6jYPJGK4iXhwlayB+CwGh/QnhaPLwQCSHP
         TK6ZIDGYzxIJ/hwazRRaPHz7OCJ68dKwQHDp+yNrVlhyAk1Xt53VOvKArt2a4fweAY4K
         +9IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791922546; x=1792527346;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=P1VoopQsNzs3OiTLGLS/LZbk0RPHVRqGEEw5UCMuK14=;
        b=Q2n2PCYm+OX3JKy+YsTX69y7YX6eV7krVHyrnc2fqQ44CwJAfxxAm0DUVvCuDezJlM
         0z/RXqRGEnOcHGgdcWe40AdP54zG5PD3iajhCcJ2lIEfF6M8ssHE2ajF8jbT1FuqpNZH
         1iIUxKWkXE7VPWdmv+DIht1uNLlub7ziQ5U3uuoHQKVrjKhQSTdWYcMwBtSx13z6olBa
         X16kJ3n+RwmjoJpedeYBbGNRHYH1/RJio2FPnnsJE3i+58QQ6SxKdgfvQbYsfBeTS/5r
         H7lHnbeZII8COlrgyeiacMQEsPKndF9UfrhGxEh5nTq+Jo+Wl7hdmo8nP0KCNKtI8/qA
         zWjw==
X-Forwarded-Encrypted: i=1; AKwUvBxKpJ62qcSHY3bqGpjhqq4om1M8M4u6dQtnjxY/i/AJ6W4Xvg5W4fsHLL92GGZ+G2tMN6UJplnWOMoM0P4=@vger.kernel.org
X-Gm-Message-State: AFq9FYLhVqNOCUDhkGbUqbIW0ili3iLuTZeig9zlIdvCxQNFIj+34G1z
	mivtAShVphgnITiXX43SS7evKco5Z1kOLDW1iIwwwpNIveyo53WBgEqF
X-Gm-Gg: AYBFou3pZ0Scu5ulhbj/8l5FL4O2U28GUn9iEMAgXd40RipgTX84pzmPbGh2ukcZtIv
	yMSikUfY3pYf2dF5sY7ntunjm3Cx8dwWmQqg/spbib8DwkkFx5N4VBmZR+WQn62ReVw0Vpm28Tp
	6ahiGf9zvMzKUzG3aza2ojlUMU9Ak/7tk+58OkBhMTpwqf4yBJHUFI5dUD6U5G/NzYEKef1g7Nr
	kakrv87GeYwQIFqjnMN98cLBogVAKCVbNFV6igocV4RCpa2fW6C2bforhmITpUnAUU/Pmh8oWi8
	cwgBGnREGGSOdotMQkBA46PFN0h/FvXARZWIv9IduFN1ne0p3R8vr7Ml+nwMW/HI31PdUFX5R30
	/5vZC3DfDlLyfT9pgzb9VxHekrrdS4LeVCZO3Tg9Xy8TMW8dY52CQArtjVIBAF83fso4VC53CvJ
	ujj3hSf0RuebgTLNPg0rH7brnqDzVt0M/0R1cCsVqjn3a/yEilX+b+n4+RFly18TLJpPmWcCoit
	gI=
X-Received: by 2002:a05:6830:c90:b0:820:91b1:5ad4 with SMTP id 46e09a7af769-830296218camr6337416a34.23.1791922546276;
        Tue, 13 Oct 2026 13:15:46 -0700 (PDT)
Received: from pop-os.. ([24.32.17.59])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-83038f82468sm13557570a34.11.2026.10.13.13.15.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 13:15:45 -0700 (PDT)
From: Rishik Yechuri <epicrishik@gmail.com>
X-Google-Original-From: Rishik Yechuri <rishik.yechuri.code@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Rishik Yechuri <rishik.yechuri.code@gmail.com>
Subject: [PATCH 05/10] staging: rtl8723bs: use IEEE80211_FCTL_* masks for frame type dispatch
Date: Tue, 13 Oct 2026 15:15:33 -0500
Message-ID: <20261013201538.43156-6-rishik.yechuri.code@gmail.com>
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

The remaining users of GetFrameType() and GetFrameSubType() switch on
the frame type or subtype, store it for several later comparisons, or
derive values from its individual bits. Convert them to operate on the
frame_control member of struct ieee80211_hdr.

Switch statements now mask frame_control with IEEE80211_FCTL_FTYPE or
IEEE80211_FCTL_STYPE and use cpu_to_le16(IEEE80211_FTYPE_*) or
cpu_to_le16(IEEE80211_STYPE_*) case labels, as is done in mac80211.

Where the subtype was stored in a local variable and compared against
several values, store the frame_control value instead and use the
ieee80211_is_*() helpers.

The test for the absence of a data payload in ap2sta_data_frame() and
sta2ap_data_frame() is replaced with ieee80211_is_data_present(), and
the QoS test in validate_recv_frame() with ieee80211_is_data_qos().
Both helpers additionally check that the frame type is data, which is
always the case on these paths.

In aes_cipher(), aes_decipher() and rtw_check_bcn_info(), the type and
subtype are kept as integer values and are now derived using the
IEEE80211_FCTL_* masks and compared against IEEE80211_FTYPE_* and
IEEE80211_STYPE_* values, which are numerically identical to the WIFI_*
values they replace.

Remove the GetFrameType() and GetFrameSubType() macros, which no longer
have any users.

No functional change intended.

Signed-off-by: Rishik Yechuri <rishik.yechuri.code@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_mlme_ext.c | 35 ++++++++--------
 drivers/staging/rtl8723bs/core/rtw_recv.c     | 40 +++++++++----------
 drivers/staging/rtl8723bs/core/rtw_security.c | 32 ++++++++-------
 .../staging/rtl8723bs/core/rtw_wlan_util.c    |  7 ++--
 drivers/staging/rtl8723bs/core/rtw_xmit.c     | 20 +++++-----
 drivers/staging/rtl8723bs/include/wifi.h      |  6 ---
 6 files changed, 65 insertions(+), 75 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
index dfe4f6210..e315d693f 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
@@ -447,7 +447,7 @@ void mgt_dispatcher(struct adapter *padapter, union recv_frame *precv_frame)
 
 	ptable = mlme_sta_tbl;
 
-	index = GetFrameSubType(pframe) >> 4;
+	index = (le16_to_cpu(hdr->frame_control) & IEEE80211_FCTL_STYPE) >> 4;
 
 	if (index >= ARRAY_SIZE(mlme_sta_tbl))
 		return;
@@ -464,24 +464,24 @@ void mgt_dispatcher(struct adapter *padapter, union recv_frame *precv_frame)
 		psta->rx_mgmt_frame_seq_num = precv_frame->u.hdr.attrib.seq_num;
 	}
 
-	switch (GetFrameSubType(pframe)) {
-	case WIFI_AUTH:
+	switch (hdr->frame_control & cpu_to_le16(IEEE80211_FCTL_STYPE)) {
+	case cpu_to_le16(IEEE80211_STYPE_AUTH):
 		if (check_fwstate(pmlmepriv, WIFI_AP_STATE))
 			ptable->func = &OnAuth;
 		else
 			ptable->func = &OnAuthClient;
 		fallthrough;
-	case WIFI_ASSOCREQ:
-	case WIFI_REASSOCREQ:
+	case cpu_to_le16(IEEE80211_STYPE_ASSOC_REQ):
+	case cpu_to_le16(IEEE80211_STYPE_REASSOC_REQ):
 		_mgt_dispatcher(padapter, ptable, precv_frame);
 		break;
-	case WIFI_PROBEREQ:
+	case cpu_to_le16(IEEE80211_STYPE_PROBE_REQ):
 		_mgt_dispatcher(padapter, ptable, precv_frame);
 		break;
-	case WIFI_BEACON:
+	case cpu_to_le16(IEEE80211_STYPE_BEACON):
 		_mgt_dispatcher(padapter, ptable, precv_frame);
 		break;
-	case WIFI_ACTION:
+	case cpu_to_le16(IEEE80211_STYPE_ACTION):
 		_mgt_dispatcher(padapter, ptable, precv_frame);
 		break;
 	default:
@@ -927,7 +927,7 @@ unsigned int OnAssocReq(struct adapter *padapter, union recv_frame *precv_frame)
 	unsigned char supportRate[16];
 	int					support_rate_num;
 	unsigned short		status = WLAN_STATUS_SUCCESS;
-	unsigned short		frame_type, ie_offset = 0;
+	unsigned short		ie_offset = 0;
 	struct mlme_priv *pmlmepriv = &padapter->mlmepriv;
 	struct security_priv *psecuritypriv = &padapter->securitypriv;
 	struct mlme_ext_priv *pmlmeext = &padapter->mlmeextpriv;
@@ -941,8 +941,7 @@ unsigned int OnAssocReq(struct adapter *padapter, union recv_frame *precv_frame)
 	if ((pmlmeinfo->state & 0x03) != WIFI_FW_AP_STATE)
 		return _FAIL;
 
-	frame_type = GetFrameSubType(pframe);
-	if (frame_type == WIFI_ASSOCREQ)
+	if (ieee80211_is_assoc_req(hdr->frame_control))
 		ie_offset = _ASOCREQ_IE_OFFSET_;
 	else /*  WIFI_REASSOCREQ */
 		ie_offset = _REASOCREQ_IE_OFFSET_;
@@ -1286,7 +1285,7 @@ unsigned int OnAssocReq(struct adapter *padapter, union recv_frame *precv_frame)
 		sta_info_update(padapter, pstat);
 
 		/* 2 issue assoc rsp before notify station join event. */
-		if (frame_type == WIFI_ASSOCREQ)
+		if (ieee80211_is_assoc_req(hdr->frame_control))
 			issue_asocrsp(padapter, status, pstat, WIFI_ASSOCRSP);
 		else
 			issue_asocrsp(padapter, status, pstat, WIFI_REASSOCRSP);
@@ -1315,7 +1314,7 @@ unsigned int OnAssocReq(struct adapter *padapter, union recv_frame *precv_frame)
 OnAssocReqFail:
 
 	pstat->aid = 0;
-	if (frame_type == WIFI_ASSOCREQ)
+	if (ieee80211_is_assoc_req(hdr->frame_control))
 		issue_asocrsp(padapter, status, pstat, WIFI_ASSOCRSP);
 	else
 		issue_asocrsp(padapter, status, pstat, WIFI_REASSOCRSP);
@@ -3756,7 +3755,7 @@ u8 collect_bss_info(struct adapter *padapter, union recv_frame *precv_frame, str
 	int	i;
 	u32 len;
 	u8 *p;
-	u16 val16, subtype;
+	u16 val16;
 	u8 *pframe = precv_frame->u.hdr.rx_data;
 	struct ieee80211_hdr *hdr = (struct ieee80211_hdr *)pframe;
 	u32 packet_len = precv_frame->u.hdr.len;
@@ -3773,17 +3772,15 @@ u8 collect_bss_info(struct adapter *padapter, union recv_frame *precv_frame, str
 
 	memset(bssid, 0, sizeof(struct wlan_bssid_ex));
 
-	subtype = GetFrameSubType(pframe);
-
-	if (subtype == WIFI_BEACON) {
+	if (ieee80211_is_beacon(hdr->frame_control)) {
 		bssid->reserved[0] = 1;
 		ie_offset = _BEACON_IE_OFFSET_;
 	} else {
 		/*  FIXME : more type */
-		if (subtype == WIFI_PROBERSP) {
+		if (ieee80211_is_probe_resp(hdr->frame_control)) {
 			ie_offset = _PROBERSP_IE_OFFSET_;
 			bssid->reserved[0] = 3;
-		} else if (subtype == WIFI_PROBEREQ) {
+		} else if (ieee80211_is_probe_req(hdr->frame_control)) {
 			ie_offset = _PROBEREQ_IE_OFFSET_;
 			bssid->reserved[0] = 2;
 		} else {
diff --git a/drivers/staging/rtl8723bs/core/rtw_recv.c b/drivers/staging/rtl8723bs/core/rtw_recv.c
index 3dcb4c8b5..75eef9662 100644
--- a/drivers/staging/rtl8723bs/core/rtw_recv.c
+++ b/drivers/staging/rtl8723bs/core/rtw_recv.c
@@ -806,7 +806,7 @@ static signed int ap2sta_data_frame(struct adapter *adapter, union recv_frame *p
 			goto exit;
 		}
 
-		if (GetFrameSubType(ptr) & BIT(6)) {
+		if (!ieee80211_is_data_present(hdr->frame_control)) {
 			/* No data, will not indicate to upper layer, temporarily count it here */
 			count_rx_stats(adapter, precv_frame, *psta);
 			ret = RTW_RX_HANDLED;
@@ -886,7 +886,7 @@ static signed int sta2ap_data_frame(struct adapter *adapter, union recv_frame *p
 		if (ieee80211_is_data_qos(hdr->frame_control))
 			process_wmmps_data(adapter, precv_frame);
 
-		if (GetFrameSubType(ptr) & BIT(6)) {
+		if (!ieee80211_is_data_present(hdr->frame_control)) {
 			/* No data, will not indicate to upper layer, temporarily count it here */
 			count_rx_stats(adapter, precv_frame, *psta);
 			ret = RTW_RX_HANDLED;
@@ -1214,14 +1214,14 @@ static signed int validate_recv_mgnt_frame(struct adapter *padapter, union recv_
 
 	psta->sta_stats.rx_mgnt_pkts++;
 
-	switch (GetFrameSubType(precv_frame->u.hdr.rx_data)) {
-	case WIFI_BEACON:
+	switch (hdr->frame_control & cpu_to_le16(IEEE80211_FCTL_STYPE)) {
+	case cpu_to_le16(IEEE80211_STYPE_BEACON):
 		psta->sta_stats.rx_beacon_pkts++;
 		break;
-	case WIFI_PROBEREQ:
+	case cpu_to_le16(IEEE80211_STYPE_PROBE_REQ):
 		psta->sta_stats.rx_probereq_pkts++;
 		break;
-	case WIFI_PROBERSP:
+	case cpu_to_le16(IEEE80211_STYPE_PROBE_RESP):
 		if (!memcmp(padapter->eeprompriv.mac_addr, hdr->addr1, ETH_ALEN))
 			psta->sta_stats.rx_probersp_pkts++;
 		else if (is_broadcast_ether_addr(hdr->addr1) ||
@@ -1352,16 +1352,17 @@ static signed int validate_80211w_mgmt(struct adapter *adapter, union recv_frame
 	struct rx_pkt_attrib *pattrib = &precv_frame->u.hdr.attrib;
 	u8 *ptr = precv_frame->u.hdr.rx_data;
 	struct ieee80211_hdr *hdr = (struct ieee80211_hdr *)ptr;
-	u8 subtype;
+	__le16 fc;
 
-	subtype = GetFrameSubType(ptr); /* bit(7)~bit(2) */
+	fc = hdr->frame_control;
 
 	/* only support station mode */
 	if (check_fwstate(pmlmepriv, WIFI_STATION_STATE) && check_fwstate(pmlmepriv, _FW_LINKED) &&
 	    adapter->securitypriv.binstallBIPkey) {
 		/* unicast management frame decrypt */
 		if (pattrib->privacy && !(is_multicast_ether_addr(hdr->addr1)) &&
-			(subtype == WIFI_DEAUTH || subtype == WIFI_DISASSOC || subtype == WIFI_ACTION)) {
+			(ieee80211_is_deauth(fc) || ieee80211_is_disassoc(fc) ||
+			 ieee80211_is_action(fc))) {
 			u8 *mgmt_DATA;
 			u32 data_len = 0;
 
@@ -1390,7 +1391,7 @@ static signed int validate_80211w_mgmt(struct adapter *adapter, union recv_frame
 			pattrib->pkt_len = pattrib->pkt_len - pattrib->iv_len - pattrib->icv_len;
 			kfree(mgmt_DATA);
 		} else if (is_multicast_ether_addr(hdr->addr1) &&
-			(subtype == WIFI_DEAUTH || subtype == WIFI_DISASSOC)) {
+			(ieee80211_is_deauth(fc) || ieee80211_is_disassoc(fc))) {
 			signed int BIP_ret = _SUCCESS;
 			/* verify BIP MME IE of broadcast/multicast de-auth/disassoc packet */
 			BIP_ret = rtw_BIP_verify(adapter, (u8 *)precv_frame);
@@ -1402,7 +1403,7 @@ static signed int validate_80211w_mgmt(struct adapter *adapter, union recv_frame
 				goto validate_80211w_fail;
 			}
 		} else { /* 802.11w protect */
-			if (subtype == WIFI_ACTION) {
+			if (ieee80211_is_action(fc)) {
 				/* according 802.11-2012 standard, these five types are not robust types */
 				if (ptr[WLAN_HDR_A3_LEN] != RTW_WLAN_CATEGORY_PUBLIC          &&
 					ptr[WLAN_HDR_A3_LEN] != RTW_WLAN_CATEGORY_HT              &&
@@ -1411,7 +1412,7 @@ static signed int validate_80211w_mgmt(struct adapter *adapter, union recv_frame
 					ptr[WLAN_HDR_A3_LEN] != RTW_WLAN_CATEGORY_P2P) {
 					goto validate_80211w_fail;
 				}
-			} else if (subtype == WIFI_DEAUTH || subtype == WIFI_DISASSOC) {
+			} else if (ieee80211_is_deauth(fc) || ieee80211_is_disassoc(fc)) {
 				/* issue sa query request */
 				issue_action_SA_Query(adapter, NULL, 0, 0);
 				goto validate_80211w_fail;
@@ -1430,8 +1431,6 @@ static signed int validate_recv_frame(struct adapter *adapter, union recv_frame
 
 	/* then call check if rx seq/frag. duplicated. */
 
-	u8 type;
-	u8 subtype;
 	signed int retval = _SUCCESS;
 
 	struct rx_pkt_attrib *pattrib = &precv_frame->u.hdr.attrib;
@@ -1446,9 +1445,6 @@ static signed int validate_recv_frame(struct adapter *adapter, union recv_frame
 		goto exit;
 	}
 
-	type =  GetFrameType(ptr);
-	subtype = GetFrameSubType(ptr); /* bit(7)~bit(2) */
-
 	pattrib->to_fr_ds = (ieee80211_has_tods(hdr->frame_control) << 1) |
 			    ieee80211_has_fromds(hdr->frame_control);
 
@@ -1461,8 +1457,8 @@ static signed int validate_recv_frame(struct adapter *adapter, union recv_frame
 	pattrib->privacy = ieee80211_has_protected(hdr->frame_control);
 	pattrib->order = ieee80211_has_order(hdr->frame_control);
 
-	switch (type) {
-	case WIFI_MGT_TYPE: /* mgnt */
+	switch (hdr->frame_control & cpu_to_le16(IEEE80211_FCTL_FTYPE)) {
+	case cpu_to_le16(IEEE80211_FTYPE_MGMT): /* mgnt */
 		if (validate_80211w_mgmt(adapter, precv_frame) == _FAIL) {
 			retval = _FAIL;
 			break;
@@ -1471,12 +1467,12 @@ static signed int validate_recv_frame(struct adapter *adapter, union recv_frame
 		retval = validate_recv_mgnt_frame(adapter, precv_frame);
 		retval = _FAIL; /*  only data frame return _SUCCESS */
 		break;
-	case WIFI_CTRL_TYPE: /* ctrl */
+	case cpu_to_le16(IEEE80211_FTYPE_CTL): /* ctrl */
 		retval = validate_recv_ctrl_frame(adapter, precv_frame);
 		retval = _FAIL; /*  only data frame return _SUCCESS */
 		break;
-	case WIFI_DATA_TYPE: /* data */
-		pattrib->qos = (subtype & BIT(7)) ? 1 : 0;
+	case cpu_to_le16(IEEE80211_FTYPE_DATA): /* data */
+		pattrib->qos = ieee80211_is_data_qos(hdr->frame_control);
 		retval = validate_recv_data_frame(adapter, precv_frame);
 		if (retval == _FAIL) {
 			struct recv_priv *precvpriv = &adapter->recvpriv;
diff --git a/drivers/staging/rtl8723bs/core/rtw_security.c b/drivers/staging/rtl8723bs/core/rtw_security.c
index fc3113922..f22f6a201 100644
--- a/drivers/staging/rtl8723bs/core/rtw_security.c
+++ b/drivers/staging/rtl8723bs/core/rtw_security.c
@@ -649,7 +649,7 @@ static void construct_mic_iv(u8 *mic_iv,
 			mic_iv[1] = 0x00;
 
 		/* 802.11w management frame should set management bit(4) */
-		if (frtype == WIFI_MGT_TYPE)
+		if (frtype == IEEE80211_FTYPE_MGMT)
 			mic_iv[1] |= BIT(4);
 
 		for (i = 2; i < 8; i++)
@@ -675,7 +675,7 @@ static void construct_mic_header1(u8 *mic_header1,
 		mic_header1[1] = (u8)((header_length - 2) % 256);
 
 		/* 802.11w management frame don't AND subtype bits 4, 5, 6 of frame control field */
-		if (frtype == WIFI_MGT_TYPE)
+		if (frtype == IEEE80211_FTYPE_MGMT)
 			mic_header1[2] = mpdu[0];
 		else
 			mic_header1[2] = mpdu[0] & 0xcf;    /* Mute CF poll & CF ack bits */
@@ -767,7 +767,7 @@ static void construct_ctr_preload(u8 *ctr_preload,
 		ctr_preload[1] = mpdu[24] & 0x0f;
 
 	/* 802.11w management frame should set management bit(4) */
-	if (frtype == WIFI_MGT_TYPE)
+	if (frtype == IEEE80211_FTYPE_MGMT)
 		ctr_preload[1] |= BIT(4);
 
 	/* ctr_preload[2:7] = A2[0:5] = mpdu[10:15] */
@@ -800,8 +800,9 @@ static signed int aes_cipher(u8 *key, u16 hdrlen,
 	u8 aes_out[16] = {};
 	u8 padded_buffer[16] = {};
 	u8 mic[8];
-	u8 frtype  = GetFrameType(pframe);
-	u8 frsubtype  = GetFrameSubType(pframe);
+	struct ieee80211_hdr *hdr = (struct ieee80211_hdr *)pframe;
+	u8 frtype = le16_to_cpu(hdr->frame_control) & IEEE80211_FCTL_FTYPE;
+	u8 frsubtype = le16_to_cpu(hdr->frame_control) & IEEE80211_FCTL_STYPE;
 
 	frsubtype = frsubtype >> 4;
 
@@ -810,14 +811,14 @@ static signed int aes_cipher(u8 *key, u16 hdrlen,
 	else
 		a4_exists = true;
 
-	if (((frtype | frsubtype) == WIFI_DATA_CFACK) ||
-	    ((frtype | frsubtype) == WIFI_DATA_CFPOLL) ||
-	    ((frtype | frsubtype) == WIFI_DATA_CFACKPOLL)) {
+	if (((frtype | frsubtype) == (IEEE80211_FTYPE_DATA | IEEE80211_STYPE_DATA_CFACK)) ||
+	    ((frtype | frsubtype) == (IEEE80211_FTYPE_DATA | IEEE80211_STYPE_DATA_CFPOLL)) ||
+	    ((frtype | frsubtype) == (IEEE80211_FTYPE_DATA | IEEE80211_STYPE_DATA_CFACKPOLL))) {
 		qc_exists = true;
 		if (hdrlen !=  WLAN_HDR_A3_QOS_LEN)
 			hdrlen += 2;
 
-	} else if ((frtype == WIFI_DATA) &&
+	} else if ((frtype == IEEE80211_FTYPE_DATA) &&
 		   ((frsubtype == 0x08) ||
 		   (frsubtype == 0x09) ||
 		   (frsubtype == 0x0a) ||
@@ -1005,8 +1006,9 @@ static signed int aes_decipher(u8 *key, u8 hdrlen,
 	u8 padded_buffer[16] = {};
 	u8 mic[8];
 
-	u8 frtype  = GetFrameType(pframe);
-	u8 frsubtype  = GetFrameSubType(pframe);
+	struct ieee80211_hdr *hdr = (struct ieee80211_hdr *)pframe;
+	u8 frtype = le16_to_cpu(hdr->frame_control) & IEEE80211_FCTL_FTYPE;
+	u8 frsubtype = le16_to_cpu(hdr->frame_control) & IEEE80211_FCTL_STYPE;
 
 	frsubtype = frsubtype >> 4;
 
@@ -1028,14 +1030,14 @@ static signed int aes_decipher(u8 *key, u8 hdrlen,
 	else
 		a4_exists = true;
 
-	if (((frtype | frsubtype) == WIFI_DATA_CFACK) ||
-	    ((frtype | frsubtype) == WIFI_DATA_CFPOLL) ||
-	    ((frtype | frsubtype) == WIFI_DATA_CFACKPOLL)) {
+	if (((frtype | frsubtype) == (IEEE80211_FTYPE_DATA | IEEE80211_STYPE_DATA_CFACK)) ||
+	    ((frtype | frsubtype) == (IEEE80211_FTYPE_DATA | IEEE80211_STYPE_DATA_CFPOLL)) ||
+	    ((frtype | frsubtype) == (IEEE80211_FTYPE_DATA | IEEE80211_STYPE_DATA_CFACKPOLL))) {
 		qc_exists = true;
 		if (hdrlen !=  WLAN_HDR_A3_QOS_LEN)
 			hdrlen += 2;
 
-	} else if ((frtype == WIFI_DATA) &&
+	} else if ((frtype == IEEE80211_FTYPE_DATA) &&
 		   ((frsubtype == 0x08) ||
 		   (frsubtype == 0x09) ||
 		   (frsubtype == 0x0a) ||
diff --git a/drivers/staging/rtl8723bs/core/rtw_wlan_util.c b/drivers/staging/rtl8723bs/core/rtw_wlan_util.c
index 72607588d..883365458 100644
--- a/drivers/staging/rtl8723bs/core/rtw_wlan_util.c
+++ b/drivers/staging/rtl8723bs/core/rtw_wlan_util.c
@@ -1082,7 +1082,8 @@ int rtw_check_bcn_info(struct adapter *Adapter, u8 *pframe, u32 packet_len)
 	int group_cipher = 0, pairwise_cipher = 0, is_8021x = 0;
 	unsigned char *pbuf;
 	u32 wpa_ielen = 0;
-	u8 *pbssid = ((struct ieee80211_hdr *)pframe)->addr3;
+	struct ieee80211_hdr *hdr = (struct ieee80211_hdr *)pframe;
+	u8 *pbssid = hdr->addr3;
 	struct HT_info_element *pht_info = NULL;
 	struct ieee80211_ht_cap *pht_cap = NULL;
 	u32 bcn_channel;
@@ -1111,9 +1112,9 @@ int rtw_check_bcn_info(struct adapter *Adapter, u8 *pframe, u32 packet_len)
 		pmlmepriv->NumOfBcnInfoChkFail = 0;
 	}
 
-	subtype = GetFrameSubType(pframe) >> 4;
+	subtype = (le16_to_cpu(hdr->frame_control) & IEEE80211_FCTL_STYPE) >> 4;
 
-	if (subtype == WIFI_BEACON)
+	if (subtype == IEEE80211_STYPE_BEACON)
 		bssid->reserved[0] = 1;
 
 	bssid->length = sizeof(struct wlan_bssid_ex) - MAX_IE_SZ + len;
diff --git a/drivers/staging/rtl8723bs/core/rtw_xmit.c b/drivers/staging/rtl8723bs/core/rtw_xmit.c
index 2e1a4b483..920f0b93b 100644
--- a/drivers/staging/rtl8723bs/core/rtw_xmit.c
+++ b/drivers/staging/rtl8723bs/core/rtw_xmit.c
@@ -1188,7 +1188,7 @@ int rtw_xmitframe_coalesce(struct adapter *padapter, struct sk_buff *pkt, struct
 int rtw_mgmt_xmitframe_coalesce(struct adapter *padapter, struct sk_buff *pkt, struct xmit_frame *pxmitframe)
 {
 	u8 *pframe, *tmp_buf = NULL;
-	u8 subtype;
+	__le16 fc;
 	struct sta_info *psta = NULL;
 	struct pkt_attrib *pattrib = &pxmitframe->attrib;
 	s32 bmcst = is_multicast_ether_addr(pattrib->ra);
@@ -1212,7 +1212,7 @@ int rtw_mgmt_xmitframe_coalesce(struct adapter *padapter, struct sk_buff *pkt, s
 		return -ENOMEM;
 
 	tmp_buf = BIP_AAD;
-	subtype = GetFrameSubType(pframe); /* bit(7)~bit(2) */
+	fc = pwlanhdr->frame_control;
 	spin_lock_bh(&padapter->security_key_mutex);
 
 	/* only support station mode */
@@ -1270,8 +1270,8 @@ int rtw_mgmt_xmitframe_coalesce(struct adapter *padapter, struct sk_buff *pkt, s
 		memcpy(pframe - 8, mic, 8);
 	} else { /* unicast mgmt frame TX */
 		/* start to encrypt mgmt frame */
-		if (subtype == WIFI_DEAUTH || subtype == WIFI_DISASSOC ||
-			subtype == WIFI_REASSOCREQ || subtype == WIFI_ACTION) {
+		if (ieee80211_is_deauth(fc) || ieee80211_is_disassoc(fc) ||
+		    ieee80211_is_reassoc_req(fc) || ieee80211_is_action(fc)) {
 			if (pattrib->psta)
 				psta = pattrib->psta;
 			else
@@ -1284,7 +1284,7 @@ int rtw_mgmt_xmitframe_coalesce(struct adapter *padapter, struct sk_buff *pkt, s
 				goto xmitframe_coalesce_fail;
 
 			/* according 802.11-2012 standard, these five types are not robust types */
-			if (subtype == WIFI_ACTION &&
+			if (ieee80211_is_action(fc) &&
 			(pframe[WLAN_HDR_A3_LEN] == RTW_WLAN_CATEGORY_PUBLIC ||
 			pframe[WLAN_HDR_A3_LEN] == RTW_WLAN_CATEGORY_HT ||
 			pframe[WLAN_HDR_A3_LEN] == RTW_WLAN_CATEGORY_UNPROTECTED_WNM ||
@@ -2440,7 +2440,7 @@ struct xmit_buf *dequeue_pending_xmitbuf_under_survey(struct xmit_priv *pxmitpri
 
 	if (!list_empty(&pqueue->queue)) {
 		struct list_head *plist, *phead;
-		u8 type;
+		struct ieee80211_hdr *hdr;
 
 		phead = get_list_head(pqueue);
 		plist = phead;
@@ -2451,11 +2451,11 @@ struct xmit_buf *dequeue_pending_xmitbuf_under_survey(struct xmit_priv *pxmitpri
 
 			pxmitbuf = container_of(plist, struct xmit_buf, list);
 
-			type = GetFrameSubType(pxmitbuf->pbuf + TXDESC_OFFSET);
+			hdr = (struct ieee80211_hdr *)(pxmitbuf->pbuf + TXDESC_OFFSET);
 
-			if ((type == WIFI_PROBEREQ) ||
-				(type == WIFI_DATA_NULL) ||
-				(type == WIFI_QOS_DATA_NULL)) {
+			if (ieee80211_is_probe_req(hdr->frame_control) ||
+			    ieee80211_is_nullfunc(hdr->frame_control) ||
+			    ieee80211_is_qos_nullfunc(hdr->frame_control)) {
 				list_del_init(&pxmitbuf->list);
 				break;
 			}
diff --git a/drivers/staging/rtl8723bs/include/wifi.h b/drivers/staging/rtl8723bs/include/wifi.h
index 558e734a2..b46ff7020 100644
--- a/drivers/staging/rtl8723bs/include/wifi.h
+++ b/drivers/staging/rtl8723bs/include/wifi.h
@@ -63,18 +63,12 @@ enum {
     WIFI_QOS_DATA_NULL	= (BIT(6) | WIFI_QOS_DATA_TYPE),
 };
 
-#define GetFrameType(pbuf)				\
-	(le16_to_cpu(*(__le16 *)(pbuf)) & (BIT(3) | BIT(2)))
-
 #define SetFrameType(pbuf, type)	\
 	do {	\
 		*(unsigned short *)(pbuf) &= cpu_to_le16(~(BIT(3) | BIT(2))); \
 		*(unsigned short *)(pbuf) |= cpu_to_le16(type); \
 	} while (0)
 
-#define GetFrameSubType(pbuf)	(le16_to_cpu(*(__le16 *)(pbuf)) & (BIT(7) |\
-	 BIT(6) | BIT(5) | BIT(4) | BIT(3) | BIT(2)))
-
 #define SetFrameSubType(pbuf, type) \
 	do {    \
 		*(__le16 *)(pbuf) &= cpu_to_le16(~(BIT(7) | BIT(6) |	\
-- 
2.43.0

