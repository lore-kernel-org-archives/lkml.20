Received: from mail-ot1-f42.google.com (mail-ot1-f42.google.com [209.85.210.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDE91552956
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 20:15:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791922555; cv=none; b=VrEJOPF8yjwKg73KHT1qb6/pVHIl9nh19hY77ExMH7Ybtk5yXgSkAtXCe9AF5VcvJw0IJB8xZclmDtBtRld+Zw+XaH9Wd9Yuv5OY+VIjyfql7rYh8nM7x+NOvytCEAVO1LxCIHunNNy/ruW+EZzKlsC9X0JJCqq9dJUMCv8GLhQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791922555; c=relaxed/simple;
	bh=FH90RTY9dmf2Y6ilpKpufRljtleaS3xcvDszTxFb3bI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YJdcy6uNx/wwX54x4YQwkHKBD13dspEJ2w7Y8wEuL4yrjroap2Uik+1NM98SJ4HBvVOVWbUCqvu4h9mg2FemyTl8LPNaOeLWEZg0S24Q5Tb9wt75o66QiyoHMFE8QNlQQ1JGc42OkwJVDNRiu2XSqxCglUFGkbUymXxE3LkjgFQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bO+ryw/U; arc=none smtp.client-ip=209.85.210.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bO+ryw/U"
Received: by mail-ot1-f42.google.com with SMTP id 46e09a7af769-823b938464fso169665a34.2
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 13:15:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791922551; x=1792527351; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=l4IW3PR4H6DX7tYNqgL8fObncZmGU80iuedORYXX8rw=;
        b=bO+ryw/UFJxwD3OYxLcRzDW+GaOAqiSlHBNuNb1mS53tUB9m9raqh1KfLuWjwRSQgc
         2S5xPvPVwn8SVRg3X3kAcqCkA2aNEQ3jhlLaq0I2TqcaSRMeBus4RbT0/yRfZa8pyDce
         7m4/wNGMm5nPwj1rUdaqZosA2Y9EhzccPZUDPb1lEkNM41KdPFwW/5QqjSUCPj/vKQp7
         n7vyYbthcVUfkPeDWvVwQxsjNWYtM08lzYYPEhpdYV+6OISl6/z2m4oKuyaxxPKHdovF
         pdjps8vJIKFXIlJOYoi/dyomQddiF0fjLjwJF8fqohb3xk6o04TIqwuOEplekz6jddg6
         9g2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791922551; x=1792527351;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=l4IW3PR4H6DX7tYNqgL8fObncZmGU80iuedORYXX8rw=;
        b=Lf5HJ/Fbd4/UYu2tOFabTsbHDsT56mPY+N2juX31D46iKv7HFsLqnH1MJbFlaI67QM
         eduGUJr4io3QXyrO4U1TRv7Vps7Z5m9OZsCwo5HjPg827LG5CUWAha/Df+IV4PhPWtqY
         v2APpfXeg8c5W5QvFn4KAtk+uGHoeddgLGuPERbqISehit3hyo1ECDxxkhc/in6+COUa
         /ZZRksMfKs2eTBCxoNScJ0KVBKrwmsC1mvVBq1K7rpdaClGwAZ+abTZBiksa8JMnSJ1W
         kcMjDxsaekIjcLBQb80QS1GWPrsFbwZkgauTIXnYoJGBDK3tirQBOAJG02MLvxX10Bkj
         MXrg==
X-Forwarded-Encrypted: i=1; AKwUvBziWnAR5g7B/a4Rwpbf46qXBXEIbpyj7C0khr/TpG8SYj7dmdMP8ZfP7S9+yV6mi6lUfBEJeBq8hlDNGF8=@vger.kernel.org
X-Gm-Message-State: AFq9FYJxVP4bUgkmecztK5eQanDGS1MpB5DBtomysrwqpmbcXsX/czqr
	LVHt42NGrqgvbDJ7Hdhc1yMAonVq669JyznyxJzX1MqimAcxxyFEFq7lRW38DU6wFbc=
X-Gm-Gg: AYBFou3osyFjgNgyMU4wsQ4L03h7V8gJtWPmohHG1injONvdTWspgEl+GOWGqIjCgsM
	eEF2ae4KyaS9b5J+Ht7nKkmiI+EUuzQU/bl1F2Nu+aX/MX5eczTzp2obYsnvIM2EJ8V/mDM0zkl
	2OtW/67lIyi5pg/8fRn2yobC2u7gwskjL0XD6iubCe1AWofDkRq9ieRf/4aNU7fB4egDtf7C7W9
	Kj1CpgleSyR9i1/D9Bs81mqXwM7fYeztjL9PItA8ewUiJHpCzkaKG7NEvCwCPwk2M/IPNdgtfWP
	7p71lCu9B4aL22Rmubsnl/5TuEk/fkY8ZgQkHBfPJa6NfeS0Nn+GVf6uaOfts4QVq/0nFWhY+Rh
	bQECtZPBuCUrKk3Oqbx3wWE0gSLM1+nPsu3pkgOIVIfPcCo+CvzosVZT5AwNaNRfY1K4byO+YkL
	QSrcGl2KeGX9B12mUVol1OHlLnNkN7qvlc4wAvQqSzzDu3WbC0z2jr63FOB2E4P1VEJ8qnEecAx
	yBVIBaf1lim0w==
X-Received: by 2002:a05:6830:3894:b0:81f:b957:abba with SMTP id 46e09a7af769-83097975c98mr12665701a34.23.1791922551383;
        Tue, 13 Oct 2026 13:15:51 -0700 (PDT)
Received: from pop-os.. ([24.32.17.59])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-83038f82468sm13557570a34.11.2026.10.13.13.15.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 13:15:49 -0700 (PDT)
From: Rishik Yechuri <epicrishik@gmail.com>
X-Google-Original-From: Rishik Yechuri <rishik.yechuri.code@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Rishik Yechuri <rishik.yechuri.code@gmail.com>
Subject: [PATCH 07/10] staging: rtl8723bs: use IEEE80211_FTYPE_* and IEEE80211_STYPE_* values
Date: Tue, 13 Oct 2026 15:15:35 -0500
Message-ID: <20261013201538.43156-8-rishik.yechuri.code@gmail.com>
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

The driver sets the type and subtype of transmitted frames with
SetFrameSubType() using its private WIFI_* enumeration, which encodes
the same values as the IEEE80211_FTYPE_* and IEEE80211_STYPE_*
constants in <linux/ieee80211.h>.

Replace each SetFrameSubType() call with an OR of the corresponding
IEEE80211_FTYPE_* and IEEE80211_STYPE_* values into frame_control. At
every call site the Frame Control field has already been cleared, so
the type and subtype bits are zero and the OR is equivalent to the
clear and set performed by the macro. Flags that some callers set
before the subtype, such as Power Management and From DS, are
preserved as before.

Convert the values stored in pattrib->subtype and passed to
issue_asocrsp() to the kernel definitions as well. They are
numerically identical to the WIFI_* values they replace.

Remove SetFrameSubType(), the unused SetFrameType(), and the WIFI_*
frame type and subtype enumerations, which no longer have any users.
Update comments that referred to the removed constants.

No functional change intended.

Signed-off-by: Rishik Yechuri <rishik.yechuri.code@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_mlme_ext.c | 36 ++++++------
 drivers/staging/rtl8723bs/core/rtw_xmit.c     |  8 +--
 drivers/staging/rtl8723bs/hal/rtl8723b_cmd.c  | 12 ++--
 drivers/staging/rtl8723bs/include/wifi.h      | 58 -------------------
 .../staging/rtl8723bs/os_dep/ioctl_cfg80211.c |  8 +--
 5 files changed, 32 insertions(+), 90 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
index 3096d4c61..000c23983 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
@@ -943,7 +943,7 @@ unsigned int OnAssocReq(struct adapter *padapter, union recv_frame *precv_frame)
 
 	if (ieee80211_is_assoc_req(hdr->frame_control))
 		ie_offset = _ASOCREQ_IE_OFFSET_;
-	else /*  WIFI_REASSOCREQ */
+	else /* reassociation request */
 		ie_offset = _REASOCREQ_IE_OFFSET_;
 
 	if (pkt_len < sizeof(struct ieee80211_hdr_3addr) + ie_offset)
@@ -1286,9 +1286,9 @@ unsigned int OnAssocReq(struct adapter *padapter, union recv_frame *precv_frame)
 
 		/* 2 issue assoc rsp before notify station join event. */
 		if (ieee80211_is_assoc_req(hdr->frame_control))
-			issue_asocrsp(padapter, status, pstat, WIFI_ASSOCRSP);
+			issue_asocrsp(padapter, status, pstat, IEEE80211_STYPE_ASSOC_RESP);
 		else
-			issue_asocrsp(padapter, status, pstat, WIFI_REASSOCRSP);
+			issue_asocrsp(padapter, status, pstat, IEEE80211_STYPE_REASSOC_RESP);
 
 		spin_lock_bh(&pstat->lock);
 		kfree(pstat->passoc_req);
@@ -1315,9 +1315,9 @@ unsigned int OnAssocReq(struct adapter *padapter, union recv_frame *precv_frame)
 
 	pstat->aid = 0;
 	if (ieee80211_is_assoc_req(hdr->frame_control))
-		issue_asocrsp(padapter, status, pstat, WIFI_ASSOCRSP);
+		issue_asocrsp(padapter, status, pstat, IEEE80211_STYPE_ASSOC_RESP);
 	else
-		issue_asocrsp(padapter, status, pstat, WIFI_REASSOCRSP);
+		issue_asocrsp(padapter, status, pstat, IEEE80211_STYPE_REASSOC_RESP);
 
 	return _FAIL;
 }
@@ -2083,7 +2083,7 @@ void issue_beacon(struct adapter *padapter, int timeout_ms)
 	memcpy(pwlanhdr->addr3, get_my_bssid(cur_network), ETH_ALEN);
 
 	SetSeqNum(pwlanhdr, 0/*pmlmeext->mgnt_seq*/);
-	SetFrameSubType(pframe, WIFI_BEACON);
+	*fctrl |= cpu_to_le16(IEEE80211_FTYPE_MGMT | IEEE80211_STYPE_BEACON);
 
 	pframe += sizeof(struct ieee80211_hdr_3addr);
 	pattrib->pktlen = sizeof(struct ieee80211_hdr_3addr);
@@ -2235,7 +2235,7 @@ void issue_probersp(struct adapter *padapter, unsigned char *da, u8 is_valid_p2p
 
 	SetSeqNum(pwlanhdr, pmlmeext->mgnt_seq);
 	pmlmeext->mgnt_seq++;
-	SetFrameSubType(fctrl, WIFI_PROBERSP);
+	*fctrl |= cpu_to_le16(IEEE80211_FTYPE_MGMT | IEEE80211_STYPE_PROBE_RESP);
 
 	pattrib->hdrlen = sizeof(struct ieee80211_hdr_3addr);
 	pattrib->pktlen = pattrib->hdrlen;
@@ -2432,7 +2432,7 @@ static void issue_probereq(struct adapter *padapter, struct ndis_802_11_ssid *ps
 
 	SetSeqNum(pwlanhdr, pmlmeext->mgnt_seq);
 	pmlmeext->mgnt_seq++;
-	SetFrameSubType(pframe, WIFI_PROBEREQ);
+	*fctrl |= cpu_to_le16(IEEE80211_FTYPE_MGMT | IEEE80211_STYPE_PROBE_REQ);
 
 	pframe += sizeof(struct ieee80211_hdr_3addr);
 	pattrib->pktlen = sizeof(struct ieee80211_hdr_3addr);
@@ -2499,7 +2499,7 @@ void issue_auth(struct adapter *padapter, struct sta_info *psta, unsigned short
 
 	SetSeqNum(pwlanhdr, pmlmeext->mgnt_seq);
 	pmlmeext->mgnt_seq++;
-	SetFrameSubType(pframe, WIFI_AUTH);
+	*fctrl |= cpu_to_le16(IEEE80211_FTYPE_MGMT | IEEE80211_STYPE_AUTH);
 
 	pframe += sizeof(struct ieee80211_hdr_3addr);
 	pattrib->pktlen = sizeof(struct ieee80211_hdr_3addr);
@@ -2628,8 +2628,8 @@ void issue_asocrsp(struct adapter *padapter, unsigned short status, struct sta_i
 
 	SetSeqNum(pwlanhdr, pmlmeext->mgnt_seq);
 	pmlmeext->mgnt_seq++;
-	if ((pkt_type == WIFI_ASSOCRSP) || (pkt_type == WIFI_REASSOCRSP)) {
-		SetFrameSubType(pwlanhdr, pkt_type);
+	if (pkt_type == IEEE80211_STYPE_ASSOC_RESP || pkt_type == IEEE80211_STYPE_REASSOC_RESP) {
+		*fctrl |= cpu_to_le16(IEEE80211_FTYPE_MGMT | pkt_type);
 	} else {
 		rtw_free_xmitbuf(pxmitpriv, pmgntframe->pxmitbuf);
 		rtw_free_xmitframe(pxmitpriv, pmgntframe);
@@ -2755,7 +2755,7 @@ void issue_assocreq(struct adapter *padapter)
 
 	SetSeqNum(pwlanhdr, pmlmeext->mgnt_seq);
 	pmlmeext->mgnt_seq++;
-	SetFrameSubType(pframe, WIFI_ASSOCREQ);
+	*fctrl |= cpu_to_le16(IEEE80211_FTYPE_MGMT | IEEE80211_STYPE_ASSOC_REQ);
 
 	pframe += sizeof(struct ieee80211_hdr_3addr);
 	pattrib->pktlen = sizeof(struct ieee80211_hdr_3addr);
@@ -2938,7 +2938,7 @@ static int _issue_nulldata(struct adapter *padapter, unsigned char *da,
 
 	SetSeqNum(pwlanhdr, pmlmeext->mgnt_seq);
 	pmlmeext->mgnt_seq++;
-	SetFrameSubType(pframe, WIFI_DATA_NULL);
+	*fctrl |= cpu_to_le16(IEEE80211_FTYPE_DATA | IEEE80211_STYPE_NULLFUNC);
 
 	pframe += sizeof(struct ieee80211_hdr_3addr);
 	pattrib->pktlen = sizeof(struct ieee80211_hdr_3addr);
@@ -3085,7 +3085,7 @@ static int _issue_qos_nulldata(struct adapter *padapter, unsigned char *da,
 
 	SetSeqNum(pwlanhdr, pmlmeext->mgnt_seq);
 	pmlmeext->mgnt_seq++;
-	SetFrameSubType(pframe, WIFI_QOS_DATA_NULL);
+	*fctrl |= cpu_to_le16(IEEE80211_FTYPE_DATA | IEEE80211_STYPE_QOS_NULLFUNC);
 
 	pframe += sizeof(struct ieee80211_qos_hdr);
 	pattrib->pktlen = sizeof(struct ieee80211_qos_hdr);
@@ -3177,7 +3177,7 @@ static int _issue_deauth(struct adapter *padapter, unsigned char *da,
 
 	SetSeqNum(pwlanhdr, pmlmeext->mgnt_seq);
 	pmlmeext->mgnt_seq++;
-	SetFrameSubType(pframe, WIFI_DEAUTH);
+	*fctrl |= cpu_to_le16(IEEE80211_FTYPE_MGMT | IEEE80211_STYPE_DEAUTH);
 
 	pframe += sizeof(struct ieee80211_hdr_3addr);
 	pattrib->pktlen = sizeof(struct ieee80211_hdr_3addr);
@@ -3271,7 +3271,7 @@ void issue_action_SA_Query(struct adapter *padapter, unsigned char *raddr, unsig
 
 	SetSeqNum(pwlanhdr, pmlmeext->mgnt_seq);
 	pmlmeext->mgnt_seq++;
-	SetFrameSubType(pframe, WIFI_ACTION);
+	*fctrl |= cpu_to_le16(IEEE80211_FTYPE_MGMT | IEEE80211_STYPE_ACTION);
 
 	pframe += sizeof(struct ieee80211_hdr_3addr);
 	pattrib->pktlen = sizeof(struct ieee80211_hdr_3addr);
@@ -3344,7 +3344,7 @@ void issue_action_BA(struct adapter *padapter, unsigned char *raddr, unsigned ch
 
 	SetSeqNum(pwlanhdr, pmlmeext->mgnt_seq);
 	pmlmeext->mgnt_seq++;
-	SetFrameSubType(pframe, WIFI_ACTION);
+	*fctrl |= cpu_to_le16(IEEE80211_FTYPE_MGMT | IEEE80211_STYPE_ACTION);
 
 	pframe += sizeof(struct ieee80211_hdr_3addr);
 	pattrib->pktlen = sizeof(struct ieee80211_hdr_3addr);
@@ -3498,7 +3498,7 @@ static void issue_action_BSSCoexistPacket(struct adapter *padapter)
 
 	SetSeqNum(pwlanhdr, pmlmeext->mgnt_seq);
 	pmlmeext->mgnt_seq++;
-	SetFrameSubType(pframe, WIFI_ACTION);
+	*fctrl |= cpu_to_le16(IEEE80211_FTYPE_MGMT | IEEE80211_STYPE_ACTION);
 
 	pframe += sizeof(struct ieee80211_hdr_3addr);
 	pattrib->pktlen = sizeof(struct ieee80211_hdr_3addr);
diff --git a/drivers/staging/rtl8723bs/core/rtw_xmit.c b/drivers/staging/rtl8723bs/core/rtw_xmit.c
index 920f0b93b..8855f80f7 100644
--- a/drivers/staging/rtl8723bs/core/rtw_xmit.c
+++ b/drivers/staging/rtl8723bs/core/rtw_xmit.c
@@ -650,7 +650,7 @@ static int set_qos(struct pkt_file *ppktfile, struct pkt_attrib *pattrib)
 	}
 	pattrib->priority = UserPriority;
 	pattrib->hdrlen = WLAN_HDR_A3_QOS_LEN;
-	pattrib->subtype = WIFI_QOS_DATA_TYPE;
+	pattrib->subtype = IEEE80211_FTYPE_DATA | IEEE80211_STYPE_QOS_DATA;
 
 	return 0;
 }
@@ -774,7 +774,7 @@ static int update_attrib(struct adapter *padapter, struct sk_buff *pkt, struct p
 	pattrib->pkt_hdrlen = ETH_HLEN;/* pattrib->ether_type == 0x8100) ? (14 + 4): 14; vlan tag */
 
 	pattrib->hdrlen = WLAN_HDR_A3_LEN;
-	pattrib->subtype = WIFI_DATA_TYPE;
+	pattrib->subtype = IEEE80211_FTYPE_DATA | IEEE80211_STYPE_DATA;
 	pattrib->priority = 0;
 
 	if (check_fwstate(pmlmepriv, WIFI_AP_STATE | WIFI_ADHOC_STATE | WIFI_ADHOC_MASTER_STATE)) {
@@ -914,9 +914,9 @@ int rtw_make_wlanhdr(struct adapter *padapter, u8 *hdr, struct pkt_attrib *pattr
 
 	memset(hdr, 0, WLANHDR_OFFSET);
 
-	SetFrameSubType(fctrl, pattrib->subtype);
+	*fctrl |= cpu_to_le16(pattrib->subtype);
 
-	if (pattrib->subtype & WIFI_DATA_TYPE) {
+	if (pattrib->subtype & IEEE80211_FTYPE_DATA) {
 		if (check_fwstate(pmlmepriv, WIFI_STATION_STATE)) {
 			{
 				/*  1.Data transfer to AP */
diff --git a/drivers/staging/rtl8723bs/hal/rtl8723b_cmd.c b/drivers/staging/rtl8723bs/hal/rtl8723b_cmd.c
index 5600d9064..c5518eeea 100644
--- a/drivers/staging/rtl8723bs/hal/rtl8723b_cmd.c
+++ b/drivers/staging/rtl8723bs/hal/rtl8723b_cmd.c
@@ -116,7 +116,7 @@ static void ConstructBeacon(struct adapter *padapter, u8 *pframe, u32 *pLength)
 	ether_addr_copy(pwlanhdr->addr3, get_my_bssid(cur_network));
 
 	SetSeqNum(pwlanhdr, 0);
-	SetFrameSubType(pframe, WIFI_BEACON);
+	*fctrl |= cpu_to_le16(IEEE80211_FTYPE_MGMT | IEEE80211_STYPE_BEACON);
 
 	pframe += sizeof(struct ieee80211_hdr_3addr);
 	pktlen = sizeof(struct ieee80211_hdr_3addr);
@@ -193,7 +193,7 @@ static void ConstructPSPoll(struct adapter *padapter, u8 *pframe, u32 *pLength)
 	fctrl = &pwlanhdr->frame_control;
 	*(fctrl) = 0;
 	*fctrl |= cpu_to_le16(IEEE80211_FCTL_PM);
-	SetFrameSubType(pframe, WIFI_PSPOLL);
+	*fctrl |= cpu_to_le16(IEEE80211_FTYPE_CTL | IEEE80211_STYPE_PSPOLL);
 
 	/*  AID. */
 	SetDuration(pframe, (pmlmeinfo->aid | 0xc000));
@@ -257,7 +257,7 @@ static void ConstructNullFunctionData(struct adapter *padapter,
 	if (bQoS) {
 		struct ieee80211_qos_hdr *pwlanqoshdr;
 
-		SetFrameSubType(pframe, WIFI_QOS_DATA_NULL);
+		*fctrl |= cpu_to_le16(IEEE80211_FTYPE_DATA | IEEE80211_STYPE_QOS_NULLFUNC);
 
 		pwlanqoshdr = (struct ieee80211_qos_hdr *)pframe;
 		SetPriority(&pwlanqoshdr->qos_ctrl, AC);
@@ -265,7 +265,7 @@ static void ConstructNullFunctionData(struct adapter *padapter,
 
 		pktlen = sizeof(struct ieee80211_qos_hdr);
 	} else {
-		SetFrameSubType(pframe, WIFI_DATA_NULL);
+		*fctrl |= cpu_to_le16(IEEE80211_FTYPE_DATA | IEEE80211_STYPE_NULLFUNC);
 
 		pktlen = sizeof(struct ieee80211_hdr_3addr);
 	}
@@ -745,7 +745,7 @@ static void ConstructBtNullFunctionData(struct adapter *padapter,
 	if (bQoS) {
 		struct ieee80211_qos_hdr *pwlanqoshdr;
 
-		SetFrameSubType(pframe, WIFI_QOS_DATA_NULL);
+		*fctrl |= cpu_to_le16(IEEE80211_FTYPE_DATA | IEEE80211_STYPE_QOS_NULLFUNC);
 
 		pwlanqoshdr = (struct ieee80211_qos_hdr *)pframe;
 		SetPriority(&pwlanqoshdr->qos_ctrl, AC);
@@ -753,7 +753,7 @@ static void ConstructBtNullFunctionData(struct adapter *padapter,
 
 		pktlen = sizeof(struct ieee80211_qos_hdr);
 	} else {
-		SetFrameSubType(pframe, WIFI_DATA_NULL);
+		*fctrl |= cpu_to_le16(IEEE80211_FTYPE_DATA | IEEE80211_STYPE_NULLFUNC);
 
 		pktlen = sizeof(struct ieee80211_hdr_3addr);
 	}
diff --git a/drivers/staging/rtl8723bs/include/wifi.h b/drivers/staging/rtl8723bs/include/wifi.h
index b46ff7020..9790bd850 100644
--- a/drivers/staging/rtl8723bs/include/wifi.h
+++ b/drivers/staging/rtl8723bs/include/wifi.h
@@ -18,64 +18,6 @@
 /*  This test verifies the WLAN NIC can update the NAV through sending the CTS with large duration. */
 #define	WiFiNavUpperUs				30000	/*  30 ms */
 
-enum {
-	WIFI_MGT_TYPE  =	(0),
-	WIFI_CTRL_TYPE =	(BIT(2)),
-	WIFI_DATA_TYPE =	(BIT(3)),
-	WIFI_QOS_DATA_TYPE	= (BIT(7)|BIT(3)),	/*  QoS Data */
-};
-
-enum {
-
-    /*  below is for mgt frame */
-    WIFI_ASSOCREQ       = (0 | WIFI_MGT_TYPE),
-    WIFI_ASSOCRSP       = (BIT(4) | WIFI_MGT_TYPE),
-    WIFI_REASSOCREQ     = (BIT(5) | WIFI_MGT_TYPE),
-    WIFI_REASSOCRSP     = (BIT(5) | BIT(4) | WIFI_MGT_TYPE),
-    WIFI_PROBEREQ       = (BIT(6) | WIFI_MGT_TYPE),
-    WIFI_PROBERSP       = (BIT(6) | BIT(4) | WIFI_MGT_TYPE),
-    WIFI_BEACON         = (BIT(7) | WIFI_MGT_TYPE),
-    WIFI_ATIM           = (BIT(7) | BIT(4) | WIFI_MGT_TYPE),
-    WIFI_DISASSOC       = (BIT(7) | BIT(5) | WIFI_MGT_TYPE),
-    WIFI_AUTH           = (BIT(7) | BIT(5) | BIT(4) | WIFI_MGT_TYPE),
-    WIFI_DEAUTH         = (BIT(7) | BIT(6) | WIFI_MGT_TYPE),
-    WIFI_ACTION         = (BIT(7) | BIT(6) | BIT(4) | WIFI_MGT_TYPE),
-    WIFI_ACTION_NOACK = (BIT(7) | BIT(6) | BIT(5) | WIFI_MGT_TYPE),
-
-    /*  below is for control frame */
-    WIFI_NDPA         = (BIT(6) | BIT(4) | WIFI_CTRL_TYPE),
-    WIFI_PSPOLL         = (BIT(7) | BIT(5) | WIFI_CTRL_TYPE),
-    WIFI_RTS            = (BIT(7) | BIT(5) | BIT(4) | WIFI_CTRL_TYPE),
-    WIFI_CTS            = (BIT(7) | BIT(6) | WIFI_CTRL_TYPE),
-    WIFI_ACK            = (BIT(7) | BIT(6) | BIT(4) | WIFI_CTRL_TYPE),
-    WIFI_CFEND          = (BIT(7) | BIT(6) | BIT(5) | WIFI_CTRL_TYPE),
-    WIFI_CFEND_CFACK    = (BIT(7) | BIT(6) | BIT(5) | BIT(4) | WIFI_CTRL_TYPE),
-
-    /*  below is for data frame */
-    WIFI_DATA           = (0 | WIFI_DATA_TYPE),
-    WIFI_DATA_CFACK     = (BIT(4) | WIFI_DATA_TYPE),
-    WIFI_DATA_CFPOLL    = (BIT(5) | WIFI_DATA_TYPE),
-    WIFI_DATA_CFACKPOLL = (BIT(5) | BIT(4) | WIFI_DATA_TYPE),
-    WIFI_DATA_NULL      = (BIT(6) | WIFI_DATA_TYPE),
-    WIFI_CF_ACK         = (BIT(6) | BIT(4) | WIFI_DATA_TYPE),
-    WIFI_CF_POLL        = (BIT(6) | BIT(5) | WIFI_DATA_TYPE),
-    WIFI_CF_ACKPOLL     = (BIT(6) | BIT(5) | BIT(4) | WIFI_DATA_TYPE),
-    WIFI_QOS_DATA_NULL	= (BIT(6) | WIFI_QOS_DATA_TYPE),
-};
-
-#define SetFrameType(pbuf, type)	\
-	do {	\
-		*(unsigned short *)(pbuf) &= cpu_to_le16(~(BIT(3) | BIT(2))); \
-		*(unsigned short *)(pbuf) |= cpu_to_le16(type); \
-	} while (0)
-
-#define SetFrameSubType(pbuf, type) \
-	do {    \
-		*(__le16 *)(pbuf) &= cpu_to_le16(~(BIT(7) | BIT(6) |	\
-		 BIT(5) | BIT(4) | BIT(3) | BIT(2))); \
-		*(__le16 *)(pbuf) |= cpu_to_le16(type); \
-	} while (0)
-
 #define GetSequence(pbuf)			\
 	(le16_to_cpu(*(__le16 *)((size_t)(pbuf) + 22)) >> 4)
 
diff --git a/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c b/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
index 150469cda..d52bcf1b1 100644
--- a/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
+++ b/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
@@ -283,12 +283,12 @@ struct cfg80211_bss *rtw_cfg80211_inform_bss(struct adapter *padapter, struct wl
 
 	SetSeqNum(pwlanhdr, 0/*pmlmeext->mgnt_seq*/);
 
-	if (pnetwork->network.reserved[0] == 1) { /*  WIFI_BEACON */
+	if (pnetwork->network.reserved[0] == 1) { /* beacon */
 		eth_broadcast_addr(pwlanhdr->addr1);
-		SetFrameSubType(pbuf, WIFI_BEACON);
+		*fctrl |= cpu_to_le16(IEEE80211_FTYPE_MGMT | IEEE80211_STYPE_BEACON);
 	} else {
 		memcpy(pwlanhdr->addr1, myid(&padapter->eeprompriv), ETH_ALEN);
-		SetFrameSubType(pbuf, WIFI_PROBERSP);
+		*fctrl |= cpu_to_le16(IEEE80211_FTYPE_MGMT | IEEE80211_STYPE_PROBE_RESP);
 	}
 
 	memcpy(pwlanhdr->addr2, pnetwork->network.mac_address, ETH_ALEN);
@@ -1903,7 +1903,7 @@ void rtw_cfg80211_indicate_sta_assoc(struct adapter *padapter, u8 *pmgmt_frame,
 
 		if (ieee80211_is_assoc_req(hdr->frame_control))
 			ie_offset = _ASOCREQ_IE_OFFSET_;
-		else /*  WIFI_REASSOCREQ */
+		else /* reassociation request */
 			ie_offset = _REASOCREQ_IE_OFFSET_;
 
 		sinfo.filled = 0;
-- 
2.43.0

