Received: from mail-ot1-f54.google.com (mail-ot1-f54.google.com [209.85.210.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FB6B542817
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 20:15:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791922549; cv=none; b=JhQ5GhxrY/WAjlV4xUs8KkJJU+a2dU23vVmTM5nZFvSNWamNymLAraNOVaIvY59sGYMO8/dQMlQBvH039aON53vMS8DTS0Dw5B8LMp+oRP6BIrQl9ichedlwhMxyhyPVf9zrgtVcbDZiYiL+PIQFW/C7qfr+XEAQ2TsR/fj5whw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791922549; c=relaxed/simple;
	bh=/4sN80egNkOhp7Y0xA7GlnS2ylBeKF+0+kjrQt9XOkM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rUJsGkWB0WJJr8xP4OBHqOchR/Lmcg+HrifqLLBfnxyxKDJhmK4XjpbHnFHaxoFxpr5SmbF7cErsvxGLPso7fbjwfKhOA48P06qtXVpN3RPGODC9vHxfZpLMzFSGRIf8VhsNrt7QMKBcoAlExXi8eKc+n2F56kxTdZltuzF02kI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=H/tK/Nad; arc=none smtp.client-ip=209.85.210.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="H/tK/Nad"
Received: by mail-ot1-f54.google.com with SMTP id 46e09a7af769-828f4eeba13so2508820a34.1
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 13:15:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791922545; x=1792527345; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9PtkALnml1BFj40cO4YIh2d4PtMJJuv1aPw/IiEsjms=;
        b=H/tK/NadREbdp06QEzHRT/z0PX59RHvnJ43eYKUgoT44SGEnaPA1HbsmYXGbdq/IGe
         /RrJq9OgBcpq3Ai3siheupHGHNV9mc54FNcwAfkDGkomOmjJIus4rFsij660AguA3NcI
         vGC5/ql2AyO4nBgq1EE81TX09oi27qdpV0cRFEbKnBX2ANQB555+Sy4N6pNZIKgcgSI3
         ef0nMY19m0pKF6O2HVU1ghFN2EqQk+zbMAkNWjt9MIZdX4TRizSdk62NGls0JpM2J6Mp
         Y7FIEqlhEqUGIaE0e7M5OfetdtXxL7k5vMVDg8t8W6pzGV9wLG8BBynIht6tiCxFYYXd
         jXkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791922545; x=1792527345;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=9PtkALnml1BFj40cO4YIh2d4PtMJJuv1aPw/IiEsjms=;
        b=JZ7oc+vQPqR/JsBftTdYpUCZSLTJrD/tsHYBVPchXaCC5S/Yo0AYkN3Ejfca1MFE9S
         oKocz3EYzmpSXmXuxps024wekY5EBJWxfs2UQUZypGvhVGqy57d01/8NVW2SSG/3eAba
         OQ7gMTBWwPRMg6SRu9NCrTjyF7Jhi/3wvWLM080/FxnOwu7faNT60y4QxOMJ2YUal6aJ
         GxxUVDBilRf9SDpD7K5qTfPdQ2iiflnJcvWMrAo4P00dzE8yFeKQ71mJ+uyDecy+1ewG
         wZUXeLbqBLPCbooWfFhp0HrnpSIKVeEw11EF8Lw1To7t8q2QIvq3p4wQs5WLblos8h3T
         hIEg==
X-Forwarded-Encrypted: i=1; AKwUvBykMRcwix4JEm9da8d7zyTigkcJaVObssKlpWUtCIEWGCJ5KLnPiSR67dfOpIyismpuV9NfR3onLZ57HNM=@vger.kernel.org
X-Gm-Message-State: AFq9FYLHSelXHkqRKAOJh8/qJw/QWlpPsjdIHshxYUgAT8sD/Jwpo3a2
	6V4OSp1/aoandaVBiouj88miwf8l7CCRqsHYeUlRMg9+fTX8dD7qv4VY
X-Gm-Gg: AYBFou17zK55j05Lu9w2tCFaTi7ZJ/h2s0GD4TVPfuHQfQrLt0iDb1vluBKdwu5gY1L
	qLqKl0oSs9tDX3/9pxI7dl7w9iPtl8FUGRu+HQKw9+jQVeeI+bfC/lnIkEcn0Rd6Sl6Vw0MJk0w
	HvnyyuUpBJSLR8WhNQhJ2H1qJc23kCLAzGz/03F7CR2VL1lpmdpMNIzaSqPxwYyCRvrDfAWboG/
	m9lbmFINB9iM1/s10DfMZLjNjArQHAmN54zu9GyA8Z6FuurYHM6gz9CHssnQqGY70A7RNu6FurX
	JqafKB6aYFbfEYgvQ4XeL/2L/FLC6e+SJ82apQBDdEslK4Z5x7pVREwbxZODDA8Luup3vGpPBH8
	kvCqPgNgowVbMtdktTD3ebGykOcbpL1L/QQ+0LVdw0BZvGwcjr1e0sfxioJ2OmzK3GyO8AVY7yP
	8C+m7ort+kzhQrjAxO4ICukbyahIOmsz0Mp6L2hcAooW0iAcm1Jgsvh0cnNon16Jjh78/Irgqqb
	Qc=
X-Received: by 2002:a05:6830:270d:b0:810:521f:3033 with SMTP id 46e09a7af769-8309506c445mr12813593a34.10.1791922544604;
        Tue, 13 Oct 2026 13:15:44 -0700 (PDT)
Received: from pop-os.. ([24.32.17.59])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-83038f82468sm13557570a34.11.2026.10.13.13.15.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 13:15:44 -0700 (PDT)
From: Rishik Yechuri <epicrishik@gmail.com>
X-Google-Original-From: Rishik Yechuri <rishik.yechuri.code@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Rishik Yechuri <rishik.yechuri.code@gmail.com>
Subject: [PATCH 04/10] staging: rtl8723bs: use ieee80211_is_*() for frame type tests
Date: Tue, 13 Oct 2026 15:15:32 -0500
Message-ID: <20261013201538.43156-5-rishik.yechuri.code@gmail.com>
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

Several functions test whether a received or transmitted frame is of
one particular type or subtype by comparing the result of
GetFrameType() or GetFrameSubType() against the driver's WIFI_*
constants. <linux/ieee80211.h> provides ieee80211_is_*() helpers that
perform the same tests on the frame_control member of
struct ieee80211_hdr.

Replace these single comparisons with the corresponding helpers:

  GetFrameType() == WIFI_MGT_TYPE    -> ieee80211_is_mgmt()
  GetFrameType() == WIFI_CTRL_TYPE   -> ieee80211_is_ctl()
  GetFrameType() == WIFI_DATA_TYPE   -> ieee80211_is_data()
  GetFrameSubType() == WIFI_BEACON   -> ieee80211_is_beacon()
  GetFrameSubType() == WIFI_PSPOLL   -> ieee80211_is_pspoll()
  GetFrameSubType() == WIFI_ASSOCREQ -> ieee80211_is_assoc_req()
  GetFrameSubType() == WIFI_DEAUTH   -> ieee80211_is_deauth()
  GetFrameSubType() == WIFI_DISASSOC -> ieee80211_is_disassoc()

The QoS data test in sta2ap_data_frame() is replaced with
ieee80211_is_data_qos(). The helper additionally checks that the frame
type is data, which is always the case on this path since the frame
has already been classified as a data frame by validate_recv_frame().

Remove IsFrameTypeCtrl(), whose only caller is converted by this
change.

The remaining users of GetFrameType() and GetFrameSubType() are
converted separately.

No functional change intended.

Signed-off-by: Rishik Yechuri <rishik.yechuri.code@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_mlme_ext.c     |  2 +-
 drivers/staging/rtl8723bs/core/rtw_recv.c         | 11 ++++++-----
 drivers/staging/rtl8723bs/core/rtw_xmit.c         |  3 ++-
 drivers/staging/rtl8723bs/hal/rtl8723bs_recv.c    |  5 +++--
 drivers/staging/rtl8723bs/hal/rtl8723bs_xmit.c    |  3 ++-
 drivers/staging/rtl8723bs/include/wifi.h          |  5 -----
 drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c |  6 +++---
 7 files changed, 17 insertions(+), 18 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
index 842c3d39c..dfe4f6210 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
@@ -436,7 +436,7 @@ void mgt_dispatcher(struct adapter *padapter, union recv_frame *precv_frame)
 	struct ieee80211_hdr *hdr = (struct ieee80211_hdr *)pframe;
 	struct sta_info *psta = rtw_get_stainfo(&padapter->stapriv, hdr->addr2);
 
-	if (GetFrameType(pframe) != WIFI_MGT_TYPE)
+	if (!ieee80211_is_mgmt(hdr->frame_control))
 		return;
 
 	/* receive the frames that ra(a1) is my address or ra(a1) is bc address. */
diff --git a/drivers/staging/rtl8723bs/core/rtw_recv.c b/drivers/staging/rtl8723bs/core/rtw_recv.c
index 43452f50d..3dcb4c8b5 100644
--- a/drivers/staging/rtl8723bs/core/rtw_recv.c
+++ b/drivers/staging/rtl8723bs/core/rtw_recv.c
@@ -859,6 +859,7 @@ static signed int sta2ap_data_frame(struct adapter *adapter, union recv_frame *p
 		       struct sta_info **psta)
 {
 	u8 *ptr = precv_frame->u.hdr.rx_data;
+	struct ieee80211_hdr *hdr = (struct ieee80211_hdr *)ptr;
 	struct rx_pkt_attrib *pattrib = &precv_frame->u.hdr.attrib;
 	struct sta_priv *pstapriv = &adapter->stapriv;
 	struct mlme_priv *pmlmepriv = &adapter->mlmepriv;
@@ -882,7 +883,7 @@ static signed int sta2ap_data_frame(struct adapter *adapter, union recv_frame *p
 
 		process_pwrbit_data(adapter, precv_frame);
 
-		if ((GetFrameSubType(ptr) & WIFI_QOS_DATA_TYPE) == WIFI_QOS_DATA_TYPE)
+		if (ieee80211_is_data_qos(hdr->frame_control))
 			process_wmmps_data(adapter, precv_frame);
 
 		if (GetFrameSubType(ptr) & BIT(6)) {
@@ -915,7 +916,7 @@ static signed int validate_recv_ctrl_frame(struct adapter *padapter, union recv_
 	struct ieee80211_hdr *hdr = (struct ieee80211_hdr *)pframe;
 	struct sta_info *psta = NULL;
 
-	if (GetFrameType(pframe) != WIFI_CTRL_TYPE)
+	if (!ieee80211_is_ctl(hdr->frame_control))
 		return _FAIL;
 
 	/* receive the frames that ra(a1) is my address */
@@ -930,7 +931,7 @@ static signed int validate_recv_ctrl_frame(struct adapter *padapter, union recv_
 	psta->sta_stats.rx_ctrl_pkts++;
 
 	/* only handle ps-poll */
-	if (GetFrameSubType(pframe) == WIFI_PSPOLL) {
+	if (ieee80211_is_pspoll(hdr->frame_control)) {
 		u16 aid;
 		u8 wmmps_ac = 0;
 
@@ -1128,9 +1129,9 @@ static union recv_frame *recvframe_chk_defrag(struct adapter *padapter, union re
 	psta_addr = pfhdr->attrib.ta;
 	psta = rtw_get_stainfo(pstapriv, psta_addr);
 	if (!psta) {
-		u8 type = GetFrameType(pfhdr->rx_data);
+		struct ieee80211_hdr *hdr = (struct ieee80211_hdr *)pfhdr->rx_data;
 
-		if (type != WIFI_DATA_TYPE) {
+		if (!ieee80211_is_data(hdr->frame_control)) {
 			psta = rtw_get_bcmc_stainfo(padapter);
 			pdefrag_q = &psta->sta_recvpriv.defrag_q;
 		} else {
diff --git a/drivers/staging/rtl8723bs/core/rtw_xmit.c b/drivers/staging/rtl8723bs/core/rtw_xmit.c
index db75ff51f..2e1a4b483 100644
--- a/drivers/staging/rtl8723bs/core/rtw_xmit.c
+++ b/drivers/staging/rtl8723bs/core/rtw_xmit.c
@@ -1231,7 +1231,8 @@ int rtw_mgmt_xmitframe_coalesce(struct adapter *padapter, struct sk_buff *pkt, s
 		memset(MME, 0, 18);
 
 		/* other types doesn't need the BIP */
-		if (GetFrameSubType(pframe) != WIFI_DEAUTH && GetFrameSubType(pframe) != WIFI_DISASSOC)
+		if (!ieee80211_is_deauth(pwlanhdr->frame_control) &&
+		    !ieee80211_is_disassoc(pwlanhdr->frame_control))
 			goto xmitframe_coalesce_fail;
 
 		MGMT_body = pframe + sizeof(struct ieee80211_hdr_3addr);
diff --git a/drivers/staging/rtl8723bs/hal/rtl8723bs_recv.c b/drivers/staging/rtl8723bs/hal/rtl8723bs_recv.c
index a62b845c6..79d6d7431 100644
--- a/drivers/staging/rtl8723bs/hal/rtl8723bs_recv.c
+++ b/drivers/staging/rtl8723bs/hal/rtl8723bs_recv.c
@@ -82,6 +82,7 @@ static void update_recvframe_phyinfo(union recv_frame *precvframe,
 		(struct odm_phy_info *)(&pattrib->phy_info);
 
 	u8 *wlanhdr = precvframe->u.hdr.rx_data;
+	struct ieee80211_hdr *hdr = (struct ieee80211_hdr *)wlanhdr;
 	u8 *my_bssid;
 	u8 *rx_bssid;
 	u8 *rx_ra;
@@ -101,7 +102,7 @@ static void update_recvframe_phyinfo(union recv_frame *precvframe,
 
 	my_bssid = get_bssid(&padapter->mlmepriv);
 	rx_bssid = get_hdr_bssid(wlanhdr);
-	pkt_info.bssid_match = ((!IsFrameTypeCtrl(wlanhdr)) &&
+	pkt_info.bssid_match = (!ieee80211_is_ctl(hdr->frame_control) &&
 				!pattrib->icv_err && !pattrib->crc_err &&
 				ether_addr_equal(rx_bssid, my_bssid));
 
@@ -111,7 +112,7 @@ static void update_recvframe_phyinfo(union recv_frame *precvframe,
 		ether_addr_equal(rx_ra, my_hwaddr);
 
 	pkt_info.is_beacon = pkt_info.bssid_match &&
-		(GetFrameSubType(wlanhdr) == WIFI_BEACON);
+		ieee80211_is_beacon(hdr->frame_control);
 
 	sa = get_ta(wlanhdr);
 
diff --git a/drivers/staging/rtl8723bs/hal/rtl8723bs_xmit.c b/drivers/staging/rtl8723bs/hal/rtl8723bs_xmit.c
index 6ba004aa8..eb8b73fba 100644
--- a/drivers/staging/rtl8723bs/hal/rtl8723bs_xmit.c
+++ b/drivers/staging/rtl8723bs/hal/rtl8723bs_xmit.c
@@ -426,6 +426,7 @@ s32 rtl8723bs_mgnt_xmit(
 	struct xmit_priv *pxmitpriv = &padapter->xmitpriv;
 	struct dvobj_priv *pdvobjpriv = adapter_to_dvobj(padapter);
 	u8 *pframe = (u8 *)(pmgntframe->buf_addr) + TXDESC_OFFSET;
+	struct ieee80211_hdr *hdr = (struct ieee80211_hdr *)pframe;
 	u8 txdesc_size = TXDESC_SIZE;
 
 	rtl8723b_update_txdesc(pmgntframe, pmgntframe->buf_addr);
@@ -441,7 +442,7 @@ s32 rtl8723bs_mgnt_xmit(
 
 	pxmitbuf->priv_data = NULL;
 
-	if (GetFrameSubType(pframe) == WIFI_BEACON) { /* dump beacon directly */
+	if (ieee80211_is_beacon(hdr->frame_control)) { /* dump beacon directly */
 		ret = rtw_write_port(padapter, pdvobjpriv->Queue2Pipe[pxmitbuf->ff_hwaddr], pxmitbuf->len, (u8 *)pxmitbuf);
 		if (ret != _SUCCESS)
 			rtw_sctx_done_err(&pxmitbuf->sctx, RTW_SCTX_DONE_WRITE_PORT_ERR);
diff --git a/drivers/staging/rtl8723bs/include/wifi.h b/drivers/staging/rtl8723bs/include/wifi.h
index bfc985870..558e734a2 100644
--- a/drivers/staging/rtl8723bs/include/wifi.h
+++ b/drivers/staging/rtl8723bs/include/wifi.h
@@ -216,11 +216,6 @@ static inline unsigned char *get_hdr_bssid(unsigned char *pframe)
 	return sa;
 }
 
-static inline int IsFrameTypeCtrl(unsigned char *pframe)
-{
-	return GetFrameType(pframe) == WIFI_CTRL_TYPE;
-}
-
 /*-----------------------------------------------------------------------------
 			Below is for the security related definition
 ------------------------------------------------------------------------------*/
diff --git a/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c b/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
index 9d203810e..150469cda 100644
--- a/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
+++ b/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
@@ -1897,10 +1897,11 @@ void rtw_cfg80211_indicate_sta_assoc(struct adapter *padapter, u8 *pmgmt_frame,
 	struct wireless_dev *wdev = padapter->rtw_wdev;
 
 	{
+		struct ieee80211_hdr *hdr = (struct ieee80211_hdr *)pmgmt_frame;
 		struct station_info sinfo = {};
 		u8 ie_offset;
 
-		if (GetFrameSubType(pmgmt_frame) == WIFI_ASSOCREQ)
+		if (ieee80211_is_assoc_req(hdr->frame_control))
 			ie_offset = _ASOCREQ_IE_OFFSET_;
 		else /*  WIFI_REASSOCREQ */
 			ie_offset = _REASOCREQ_IE_OFFSET_;
@@ -1908,8 +1909,7 @@ void rtw_cfg80211_indicate_sta_assoc(struct adapter *padapter, u8 *pmgmt_frame,
 		sinfo.filled = 0;
 		sinfo.assoc_req_ies = pmgmt_frame + WLAN_HDR_A3_LEN + ie_offset;
 		sinfo.assoc_req_ies_len = frame_len - WLAN_HDR_A3_LEN - ie_offset;
-		cfg80211_new_sta(wdev, ((struct ieee80211_hdr *)pmgmt_frame)->addr2,
-				 &sinfo, GFP_ATOMIC);
+		cfg80211_new_sta(wdev, hdr->addr2, &sinfo, GFP_ATOMIC);
 	}
 }
 
-- 
2.43.0

