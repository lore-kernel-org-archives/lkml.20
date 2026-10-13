Received: from mail-ot1-f42.google.com (mail-ot1-f42.google.com [209.85.210.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3DB0558202
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 20:16:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791922562; cv=none; b=oXsBNJqqymw2lA/w2IB5A7MXxTAfMg8vGy2Nel9syhwAbUqug6ARz4QT+ucVIUrBSCpYqjOv+wProO/Zj97sQ3xgIDfnT1VccE9XX3UfBsKv/1/g3VgU+j2XllMentmiTMmmTZ0Sajv7aqxBHER5THaQ7y+lasuFmyW3fCJ+ivU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791922562; c=relaxed/simple;
	bh=kM8gNkcHALJ1XoQI31RCNqvCKt4vwFdZxV/0arrWzkA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mQMRLe8HWeAig/iP7bgdw02Y+IQRTtH6orqTvH0T02repIEBxADS1OMfJC3nGo2OMZR8LkeBLvSmFTQVzZOL85T5Y9L7FUIRA6UV2hpPUwIAFkp4FKIafquQ8pL2NTone+ztwW92bkS1faqU12U2jrpWsofPN8v5I1osTyMC64A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=keHxGaOy; arc=none smtp.client-ip=209.85.210.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="keHxGaOy"
Received: by mail-ot1-f42.google.com with SMTP id 46e09a7af769-81b54d0cb17so2650341a34.1
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 13:16:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791922559; x=1792527359; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=E/4b+TJz9S7CmbJRM4Put6V6x6XUmOynyHpylpy+Fww=;
        b=keHxGaOypO9Ju3WzbfLV4su4u16Do6cV+907S3X4YfuNkOso1ehLREsgnHVVioLIzp
         BNZX6WeEA4QlnxBmSkbgJhGiwIxEhFlED/0HGNNOrCEMT0WU87zRfaaj2Q69AcHUfc5S
         YsrHB743hOGWXf4mSQRVCnzRtDQUaNAo9Guio5XF/MQqvoN1+GMOXodlDF+5EjCJHzOl
         mEgCJ/iEeT7J8wfaBFZeWS4m4Bd+syOfoQLaStzgF9KQmQRFwEie0AnhN29de504YSby
         loCzKVzEYyPRM+NZGfG6jQJbP/ylD201NnfRdQKxXIh4zXuyOPl0FoUQAbKyeulFdAKm
         J38w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791922559; x=1792527359;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=E/4b+TJz9S7CmbJRM4Put6V6x6XUmOynyHpylpy+Fww=;
        b=KB43GqX8OQa1OLf0h+IsI7GcfK6NG75bC7QAUVHzuQ6h1drSfKBjECBTEoRNJqdoqt
         i+16tn1I04tmv86r/7/kEjKVdLIlrzBe001sW34Rhu4gc/vKSf2AzGer86d/7qwnSro3
         rF3MWmFWf2NSKXxbWNRSH7JNg5jSq7xFusuJv25J7mCaY1gv+33UE+1UC7rT/9gO6PA2
         uBjhsvxnj6w0h9UvBq3ZT4jrvsrLqOfYwoCjDc4g8WU6oq2QWTpO4H9xYa9K8pvHGnYr
         QENo0dx4ULSrhRTX8+xeyZV0gPZcI9BsfsmHIxBZMakRWJ9KATOR6efX2rqqUiuu/JhO
         WfsA==
X-Forwarded-Encrypted: i=1; AKwUvBxuBnkXy+f3bzA4gUUznYcT8JoEaPWlxAS8ratAvAL6nauR5hFNu2pdsCnjFqb/Mudon9OMsUEq2WyovFU=@vger.kernel.org
X-Gm-Message-State: AFq9FYILRHPWeJEi84fbWFce2mZy+1LOR6mSIto3lrxSBeYakZ4XSrCj
	9eQrzLtylxjDVwwNy1ENV7bAZMwOcXZ+gyO3Kr10TcqksRh5cWkhE++jSHmRzeyd1kU=
X-Gm-Gg: AYBFou38gTOHMNU0/o4jLHxT1ouFGJcfwBnW9mRS3mKA1qZoD7Vm+gzMKhWJBwS2JY1
	eY3pbdQMiepJBrIVqOzwm+rLa0nonWOTuJ1oMlUT5xujORB10beXWjii6KGW+kXBgvEH4Mb2qcj
	uyZIirqrdRbbk7k/gE2gndI3IlVY5JdRCvnXYtwRNVj4jDd1Gct4l6mKVuct7xyVNiqzlHnNU26
	rWD0qhNEZA8T3SE8o+/X1qbtIs4pnpqq6lIzJzrAhYj9rTJkbAe8LOLAmVeQc4A2rLXFMq89DjM
	GTQepNeZ/95keWK9KhLjheVDYCK6huldG6APmoq61CNGB+r5BV9wzfXMaJ8fBFRg0fIOBFJabzC
	wI27Hx3W6UBpboARevnXzTSX4HkvQOAvXbX3m055kluqkmLxUI7ClFGtMC/4gUumb4F6e59CaGY
	hDtOr6yvSdaJXy0CFxhViEOVoVVTautbbvpykVgEh2E+vW9XDzOHn81pQFQIa8ppSpksfXZO7Xa
	ec=
X-Received: by 2002:a05:6830:a8f:b0:824:df9:975 with SMTP id 46e09a7af769-83098155f01mr14651914a34.29.1791922559445;
        Tue, 13 Oct 2026 13:15:59 -0700 (PDT)
Received: from pop-os.. ([24.32.17.59])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-83038f82468sm13557570a34.11.2026.10.13.13.15.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 13:15:58 -0700 (PDT)
From: Rishik Yechuri <epicrishik@gmail.com>
X-Google-Original-From: Rishik Yechuri <rishik.yechuri.code@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Rishik Yechuri <rishik.yechuri.code@gmail.com>
Subject: [PATCH 10/10] staging: rtl8723bs: use ieee80211_get_DA() and ieee80211_get_SA()
Date: Tue, 13 Oct 2026 15:15:38 -0500
Message-ID: <20261013201538.43156-11-rishik.yechuri.code@gmail.com>
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

get_da() and get_sa() in wifi.h select the destination and source
address of a frame according to the To DS and From DS bits. They
duplicate ieee80211_get_DA() and ieee80211_get_SA() from
<linux/ieee80211.h>, which return the same address for every
combination of these bits.

rtl8723bs_get_ra() and get_ta() only return the addr1 and addr2
members of the header.

Replace get_da() and get_sa() with the generic helpers, replace
rtl8723bs_get_ra() and get_ta() with direct accesses to addr1 and
addr2, and remove the four functions.

No functional change intended.

Signed-off-by: Rishik Yechuri <rishik.yechuri.code@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_mlme_ext.c |  8 ++-
 drivers/staging/rtl8723bs/core/rtw_recv.c     |  4 +-
 .../staging/rtl8723bs/hal/rtl8723bs_recv.c    |  4 +-
 drivers/staging/rtl8723bs/include/wifi.h      | 68 -------------------
 4 files changed, 9 insertions(+), 75 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
index 4d8073d48..dde78ecb7 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
@@ -501,6 +501,7 @@ unsigned int OnProbeReq(struct adapter *padapter, union recv_frame *precv_frame)
 	struct mlme_ext_info *pmlmeinfo = &pmlmeext->mlmext_info;
 	struct wlan_bssid_ex	*cur = &pmlmeinfo->network;
 	u8 *pframe = precv_frame->u.hdr.rx_data;
+	struct ieee80211_hdr *hdr = (struct ieee80211_hdr *)pframe;
 	uint len = precv_frame->u.hdr.len;
 	u8 is_valid_p2p_probereq = false;
 
@@ -529,7 +530,7 @@ unsigned int OnProbeReq(struct adapter *padapter, union recv_frame *precv_frame)
 		if ((check_fwstate(pmlmepriv, _FW_LINKED) &&
 		     pmlmepriv->cur_network.join_res) ||
 		    check_fwstate(pmlmepriv, WIFI_ADHOC_MASTER_STATE))
-			issue_probersp(padapter, get_sa(pframe), is_valid_p2p_probereq);
+			issue_probersp(padapter, ieee80211_get_SA(hdr), is_valid_p2p_probereq);
 	}
 
 	return _SUCCESS;
@@ -853,7 +854,7 @@ unsigned int OnAuthClient(struct adapter *padapter, union recv_frame *precv_fram
 	uint pkt_len = precv_frame->u.hdr.len;
 
 	/* check A1 matches or not */
-	if (memcmp(myid(&(padapter->eeprompriv)), get_da(pframe), ETH_ALEN))
+	if (memcmp(myid(&(padapter->eeprompriv)), ieee80211_get_DA(hdr), ETH_ALEN))
 		return _SUCCESS;
 
 	if (!(pmlmeinfo->state & WIFI_FW_AUTH_STATE))
@@ -1332,10 +1333,11 @@ unsigned int OnAssocRsp(struct adapter *padapter, union recv_frame *precv_frame)
 	struct mlme_ext_priv *pmlmeext = &padapter->mlmeextpriv;
 	struct mlme_ext_info *pmlmeinfo = &pmlmeext->mlmext_info;
 	u8 *pframe = precv_frame->u.hdr.rx_data;
+	struct ieee80211_hdr *hdr = (struct ieee80211_hdr *)pframe;
 	uint pkt_len = precv_frame->u.hdr.len;
 
 	/* check A1 matches or not */
-	if (memcmp(myid(&(padapter->eeprompriv)), get_da(pframe), ETH_ALEN))
+	if (memcmp(myid(&(padapter->eeprompriv)), ieee80211_get_DA(hdr), ETH_ALEN))
 		return _SUCCESS;
 
 	if (!(pmlmeinfo->state & (WIFI_FW_AUTH_SUCCESS | WIFI_FW_ASSOC_STATE)))
diff --git a/drivers/staging/rtl8723bs/core/rtw_recv.c b/drivers/staging/rtl8723bs/core/rtw_recv.c
index a7462444e..eec1b400d 100644
--- a/drivers/staging/rtl8723bs/core/rtw_recv.c
+++ b/drivers/staging/rtl8723bs/core/rtw_recv.c
@@ -1251,8 +1251,8 @@ static signed int validate_recv_data_frame(struct adapter *adapter, union recv_f
 	signed int ret = _SUCCESS;
 
 	bretry = ieee80211_has_retry(hdr->frame_control);
-	pda = get_da(ptr);
-	psa = get_sa(ptr);
+	pda = ieee80211_get_DA(hdr);
+	psa = ieee80211_get_SA(hdr);
 	pbssid = get_hdr_bssid(ptr);
 
 	if (!pbssid) {
diff --git a/drivers/staging/rtl8723bs/hal/rtl8723bs_recv.c b/drivers/staging/rtl8723bs/hal/rtl8723bs_recv.c
index 79d6d7431..14686f5eb 100644
--- a/drivers/staging/rtl8723bs/hal/rtl8723bs_recv.c
+++ b/drivers/staging/rtl8723bs/hal/rtl8723bs_recv.c
@@ -106,7 +106,7 @@ static void update_recvframe_phyinfo(union recv_frame *precvframe,
 				!pattrib->icv_err && !pattrib->crc_err &&
 				ether_addr_equal(rx_bssid, my_bssid));
 
-	rx_ra = rtl8723bs_get_ra(wlanhdr);
+	rx_ra = hdr->addr1;
 	my_hwaddr = myid(&padapter->eeprompriv);
 	pkt_info.to_self = pkt_info.bssid_match &&
 		ether_addr_equal(rx_ra, my_hwaddr);
@@ -114,7 +114,7 @@ static void update_recvframe_phyinfo(union recv_frame *precvframe,
 	pkt_info.is_beacon = pkt_info.bssid_match &&
 		ieee80211_is_beacon(hdr->frame_control);
 
-	sa = get_ta(wlanhdr);
+	sa = hdr->addr2;
 
 	pkt_info.station_id = 0xFF;
 
diff --git a/drivers/staging/rtl8723bs/include/wifi.h b/drivers/staging/rtl8723bs/include/wifi.h
index d1bb9076d..4619cb672 100644
--- a/drivers/staging/rtl8723bs/include/wifi.h
+++ b/drivers/staging/rtl8723bs/include/wifi.h
@@ -18,74 +18,6 @@
 /*  This test verifies the WLAN NIC can update the NAV through sending the CTS with large duration. */
 #define	WiFiNavUpperUs				30000	/*  30 ms */
 
-static inline unsigned char *rtl8723bs_get_ra(unsigned char *pframe)
-{
-	struct ieee80211_hdr *hdr = (struct ieee80211_hdr *)pframe;
-	unsigned char *ra;
-
-	ra = hdr->addr1;
-	return ra;
-}
-
-static inline unsigned char *get_ta(unsigned char *pframe)
-{
-	struct ieee80211_hdr *hdr = (struct ieee80211_hdr *)pframe;
-	unsigned char *ta;
-
-	ta = hdr->addr2;
-	return ta;
-}
-
-static inline unsigned char *get_da(unsigned char *pframe)
-{
-	struct ieee80211_hdr *hdr = (struct ieee80211_hdr *)pframe;
-	unsigned char *da;
-	unsigned int to_fr_ds = (ieee80211_has_tods(hdr->frame_control) << 1) |
-				ieee80211_has_fromds(hdr->frame_control);
-
-	switch (to_fr_ds) {
-	case 0x00:	/*  ToDs = 0, FromDs = 0 */
-		da = hdr->addr1;
-		break;
-	case 0x01:	/*  ToDs = 0, FromDs = 1 */
-		da = hdr->addr1;
-		break;
-	case 0x02:	/*  ToDs = 1, FromDs = 0 */
-		da = hdr->addr3;
-		break;
-	default:	/*  ToDs = 1, FromDs = 1 */
-		da = hdr->addr3;
-		break;
-	}
-
-	return da;
-}
-
-static inline unsigned char *get_sa(unsigned char *pframe)
-{
-	struct ieee80211_hdr *hdr = (struct ieee80211_hdr *)pframe;
-	unsigned char *sa;
-	unsigned int to_fr_ds = (ieee80211_has_tods(hdr->frame_control) << 1) |
-				ieee80211_has_fromds(hdr->frame_control);
-
-	switch (to_fr_ds) {
-	case 0x00:	/*  ToDs = 0, FromDs = 0 */
-		sa = hdr->addr2;
-		break;
-	case 0x01:	/*  ToDs = 0, FromDs = 1 */
-		sa = hdr->addr3;
-		break;
-	case 0x02:	/*  ToDs = 1, FromDs = 0 */
-		sa = hdr->addr2;
-		break;
-	default:	/*  ToDs = 1, FromDs = 1 */
-		sa = hdr->addr4;
-		break;
-	}
-
-	return sa;
-}
-
 static inline unsigned char *get_hdr_bssid(unsigned char *pframe)
 {
 	struct ieee80211_hdr *hdr = (struct ieee80211_hdr *)pframe;
-- 
2.43.0

