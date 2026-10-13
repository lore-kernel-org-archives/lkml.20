Received: from mail-ot1-f54.google.com (mail-ot1-f54.google.com [209.85.210.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E28EB542817
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 20:15:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791922558; cv=none; b=iC5I+kDEgearkwOT+8WFQivTlkpk6pBAlCN6G8HomdhA6YKminGnSizjwMwBQQA+MEeFYbCJL5Y9Zz+7P35l1BBXmpde0YSJuunLZRKhtza0/2LQa001t3TrnQzKoPhhjzn3yQcbiNH+L3rEmnH2wbzaVF4KCWjYZiCt1pUYZo0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791922558; c=relaxed/simple;
	bh=QhdnGdpvtmparr4Xi8uw/xZgYagD6HCTCg8um9xEWng=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XElxQJGGJgHCB5RBFe2lzkhrJg3eqyQVfpCRvCzik7yLXBmbZuWgj6Hu6vCjoa+hnfDUhxoB8tXj7wF9SJOn7D8xPMg4zqGE6vRkl78/xqgI/tS+VFJzBAcs1gT3VBy+DEBVPDFLeUfwMsXr1PHqy55kLEK0cyT88syDoX6IZ/8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=momiZkAN; arc=none smtp.client-ip=209.85.210.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="momiZkAN"
Received: by mail-ot1-f54.google.com with SMTP id 46e09a7af769-824e6e6ed71so213720a34.1
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 13:15:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791922554; x=1792527354; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=icsSJV72bXxG8OjYZeuIPNKvf6R3bMtCE307eWSpXdc=;
        b=momiZkAN0lGWnijj6Jb9O+46Mc5iKGBAsqpTBaw+vmflRFboZC2PN0+YaxZNqE/KZR
         oJWg9uAI95YitpvDKy1aebHva0uQORcxYswe2UVQq2DecOolr13cJBk7qgWOg+ERrhL4
         Vlu9qYMBRW5uKv9Gdj7i3wiCxhhbgEJaAIXDQ3yQ+5VniUUAnA0Ifq+uu8gfFbfDGEkc
         JR3pPwHDCYsR/5AaiQzt8TSR+RKcLaYeF90d3qVUgbLxegSd51RDF+HJkSx9y4X3lcl+
         0n3FwKRUnovJM6giYtOkymIl11CX1dgy8P2wUlVJazJk09r+RuzGzI9y/Wzd5dPWYVPm
         TWAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791922554; x=1792527354;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=icsSJV72bXxG8OjYZeuIPNKvf6R3bMtCE307eWSpXdc=;
        b=XGNvorYcxVwcZyDcd2P823pR6Beoh/79no87IW8YXuBMNEBPhia6lzgslaQkb36pLO
         ivlKs/cn3Gy/D4x6phm2f0smlRLzCqb90KeVeb2habcEIUMZv7G1fvPOjrWQ5lQu3Lv1
         fOfOBKWKWsAuyEkphWRM6QNhHBNtzADePUxjxQdMntVS461tQRaWYUbpBS1iBPg5YVPl
         OYokH9hGjcZsiXyenKn9CDa0VIVOU8ThFMFzt7T7QORxBo20EnJrpMtZfqZGPmHz/8KT
         vXFldDKgHAT5YsiOMZ3eL3gr2wzq4bMcxqmSz5hx+oYiE/VZvt61TddGtaWbmyOx6rTb
         /NqQ==
X-Forwarded-Encrypted: i=1; AKwUvBwHJ86O2A6UwZhuXKevQPmPv/jQkim6MeJ15lJqVFZZOnfAiP9mIlhNeuOqHfMAVfy2XWUYikjglLnN31w=@vger.kernel.org
X-Gm-Message-State: AFq9FYIl+CZ3rfFhS2SS+4dlcgdDb2Z46Z5RWmvMe9PplMZTeTdIjANS
	bzT6/49KmMdAu096cDz1M0LErYhUvJnQntpnjuvGK0q2vUMekzj0a3fb9vq06VvANA8=
X-Gm-Gg: AYBFou3x+JqOZzpB1fYz6ankQOvuchoELYlE/INBkC9CyjXGsnXKyEDsSbfE8RK/m0y
	jrjcQY6Ci9c46cfx2lrJfxjc6tfFx+MWmtusIjnQ95lus4Pa+0f/oVoGcQ5AFxifp7zReNeJAK7
	3q1KzkSbpv5A6BDkIbwzQPGc9rpLqClvQUlxUwm2aHKSHnvLbIZk+v8Jtw9iMfofi0XtoxeKS7t
	5FkWS16HyWHUnvPtAf9CDN7Yl7MG687AS/xqakwqPEfYPwTlxWMv4K19R4693M2yfrx0rR7Vf/x
	mn8r02X4CO3GChULY6e53JYpOk6h2+2zFccYsfZm4I630qPtyN993sfPpDih9Db57UXn2lbPSba
	GrnVBLz+owMJPKi0V9pSseLKsgE8tvFrW5HwfQmwoZYkG0pa/XRvhQdgqif2u6QyrXEZ6bm4Gd9
	TvJdz45gqPbRYelHMHNBvVIygm7o/xf0/78hkORDgzdLQ6qAxZbBUyqUbOET7dNTyWJ/OQUcFPr
	H8=
X-Received: by 2002:a9d:65c9:0:b0:826:b77:adef with SMTP id 46e09a7af769-83095b27f85mr9727096a34.14.1791922554456;
        Tue, 13 Oct 2026 13:15:54 -0700 (PDT)
Received: from pop-os.. ([24.32.17.59])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-83038f82468sm13557570a34.11.2026.10.13.13.15.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 13:15:51 -0700 (PDT)
From: Rishik Yechuri <epicrishik@gmail.com>
X-Google-Original-From: Rishik Yechuri <rishik.yechuri.code@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Rishik Yechuri <rishik.yechuri.code@gmail.com>
Subject: [PATCH 08/10] staging: rtl8723bs: use struct ieee80211_hdr for seq_ctrl and duration_id
Date: Tue, 13 Oct 2026 15:15:36 -0500
Message-ID: <20261013201538.43156-9-rishik.yechuri.code@gmail.com>
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

The driver reads and writes the Sequence Control and Duration/ID fields
of IEEE 802.11 headers with the SetSeqNum(), GetSequence(),
GetFragNum(), SetDuration() and GetAid() macros, which access the
frame buffer at hardcoded byte offsets. struct ieee80211_hdr provides
the seq_ctrl and duration_id members for these fields, and
<linux/ieee80211.h> provides IEEE80211_SCTL_* masks and helpers to
convert between sequence numbers and the Sequence Control field.

Replace GetSequence() with ieee80211_get_sn(), GetFragNum() with a
mask of seq_ctrl with IEEE80211_SCTL_FRAG, and SetDuration() and
GetAid() with accesses to duration_id.

SetSeqNum() updates the sequence number while preserving the fragment
number. Where the header has just been cleared, replace it with an
assignment of IEEE80211_SN_TO_SEQ() to seq_ctrl. The reserved page
frames built in rtl8723b_cmd.c are written into a buffer that is not
cleared between uses. Those callers set a sequence number of zero, so
replace them with a mask that clears the sequence number and keeps the
fragment number, as SetSeqNum() did.

Remove these macros and the unused SetFragNum().

No functional change intended.

Signed-off-by: Rishik Yechuri <rishik.yechuri.code@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_mlme_ext.c | 24 ++++++++---------
 drivers/staging/rtl8723bs/core/rtw_recv.c     |  6 ++---
 drivers/staging/rtl8723bs/core/rtw_xmit.c     |  3 ++-
 drivers/staging/rtl8723bs/hal/rtl8723b_cmd.c  | 10 +++----
 drivers/staging/rtl8723bs/include/wifi.h      | 26 -------------------
 .../staging/rtl8723bs/os_dep/ioctl_cfg80211.c |  6 ++---
 6 files changed, 25 insertions(+), 50 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
index 000c23983..ec0046d3a 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
@@ -2082,7 +2082,7 @@ void issue_beacon(struct adapter *padapter, int timeout_ms)
 	memcpy(pwlanhdr->addr2, myid(&(padapter->eeprompriv)), ETH_ALEN);
 	memcpy(pwlanhdr->addr3, get_my_bssid(cur_network), ETH_ALEN);
 
-	SetSeqNum(pwlanhdr, 0/*pmlmeext->mgnt_seq*/);
+	pwlanhdr->seq_ctrl = 0;
 	*fctrl |= cpu_to_le16(IEEE80211_FTYPE_MGMT | IEEE80211_STYPE_BEACON);
 
 	pframe += sizeof(struct ieee80211_hdr_3addr);
@@ -2233,7 +2233,7 @@ void issue_probersp(struct adapter *padapter, unsigned char *da, u8 is_valid_p2p
 	memcpy(pwlanhdr->addr2, mac, ETH_ALEN);
 	memcpy(pwlanhdr->addr3, bssid, ETH_ALEN);
 
-	SetSeqNum(pwlanhdr, pmlmeext->mgnt_seq);
+	pwlanhdr->seq_ctrl = cpu_to_le16(IEEE80211_SN_TO_SEQ(pmlmeext->mgnt_seq));
 	pmlmeext->mgnt_seq++;
 	*fctrl |= cpu_to_le16(IEEE80211_FTYPE_MGMT | IEEE80211_STYPE_PROBE_RESP);
 
@@ -2430,7 +2430,7 @@ static void issue_probereq(struct adapter *padapter, struct ndis_802_11_ssid *ps
 
 	memcpy(pwlanhdr->addr2, mac, ETH_ALEN);
 
-	SetSeqNum(pwlanhdr, pmlmeext->mgnt_seq);
+	pwlanhdr->seq_ctrl = cpu_to_le16(IEEE80211_SN_TO_SEQ(pmlmeext->mgnt_seq));
 	pmlmeext->mgnt_seq++;
 	*fctrl |= cpu_to_le16(IEEE80211_FTYPE_MGMT | IEEE80211_STYPE_PROBE_REQ);
 
@@ -2497,7 +2497,7 @@ void issue_auth(struct adapter *padapter, struct sta_info *psta, unsigned short
 	fctrl = &(pwlanhdr->frame_control);
 	*(fctrl) = 0;
 
-	SetSeqNum(pwlanhdr, pmlmeext->mgnt_seq);
+	pwlanhdr->seq_ctrl = cpu_to_le16(IEEE80211_SN_TO_SEQ(pmlmeext->mgnt_seq));
 	pmlmeext->mgnt_seq++;
 	*fctrl |= cpu_to_le16(IEEE80211_FTYPE_MGMT | IEEE80211_STYPE_AUTH);
 
@@ -2626,7 +2626,7 @@ void issue_asocrsp(struct adapter *padapter, unsigned short status, struct sta_i
 	memcpy(pwlanhdr->addr2, myid(&(padapter->eeprompriv)), ETH_ALEN);
 	memcpy(pwlanhdr->addr3, get_my_bssid(&(pmlmeinfo->network)), ETH_ALEN);
 
-	SetSeqNum(pwlanhdr, pmlmeext->mgnt_seq);
+	pwlanhdr->seq_ctrl = cpu_to_le16(IEEE80211_SN_TO_SEQ(pmlmeext->mgnt_seq));
 	pmlmeext->mgnt_seq++;
 	if (pkt_type == IEEE80211_STYPE_ASSOC_RESP || pkt_type == IEEE80211_STYPE_REASSOC_RESP) {
 		*fctrl |= cpu_to_le16(IEEE80211_FTYPE_MGMT | pkt_type);
@@ -2753,7 +2753,7 @@ void issue_assocreq(struct adapter *padapter)
 	memcpy(pwlanhdr->addr2, myid(&(padapter->eeprompriv)), ETH_ALEN);
 	memcpy(pwlanhdr->addr3, get_my_bssid(&(pmlmeinfo->network)), ETH_ALEN);
 
-	SetSeqNum(pwlanhdr, pmlmeext->mgnt_seq);
+	pwlanhdr->seq_ctrl = cpu_to_le16(IEEE80211_SN_TO_SEQ(pmlmeext->mgnt_seq));
 	pmlmeext->mgnt_seq++;
 	*fctrl |= cpu_to_le16(IEEE80211_FTYPE_MGMT | IEEE80211_STYPE_ASSOC_REQ);
 
@@ -2936,7 +2936,7 @@ static int _issue_nulldata(struct adapter *padapter, unsigned char *da,
 	memcpy(pwlanhdr->addr2, myid(&(padapter->eeprompriv)), ETH_ALEN);
 	memcpy(pwlanhdr->addr3, get_my_bssid(&(pmlmeinfo->network)), ETH_ALEN);
 
-	SetSeqNum(pwlanhdr, pmlmeext->mgnt_seq);
+	pwlanhdr->seq_ctrl = cpu_to_le16(IEEE80211_SN_TO_SEQ(pmlmeext->mgnt_seq));
 	pmlmeext->mgnt_seq++;
 	*fctrl |= cpu_to_le16(IEEE80211_FTYPE_DATA | IEEE80211_STYPE_NULLFUNC);
 
@@ -3083,7 +3083,7 @@ static int _issue_qos_nulldata(struct adapter *padapter, unsigned char *da,
 	memcpy(pwlanhdr->addr2, myid(&(padapter->eeprompriv)), ETH_ALEN);
 	memcpy(pwlanhdr->addr3, get_my_bssid(&(pmlmeinfo->network)), ETH_ALEN);
 
-	SetSeqNum(pwlanhdr, pmlmeext->mgnt_seq);
+	pwlanhdr->seq_ctrl = cpu_to_le16(IEEE80211_SN_TO_SEQ(pmlmeext->mgnt_seq));
 	pmlmeext->mgnt_seq++;
 	*fctrl |= cpu_to_le16(IEEE80211_FTYPE_DATA | IEEE80211_STYPE_QOS_NULLFUNC);
 
@@ -3175,7 +3175,7 @@ static int _issue_deauth(struct adapter *padapter, unsigned char *da,
 	memcpy(pwlanhdr->addr2, myid(&(padapter->eeprompriv)), ETH_ALEN);
 	memcpy(pwlanhdr->addr3, get_my_bssid(&(pmlmeinfo->network)), ETH_ALEN);
 
-	SetSeqNum(pwlanhdr, pmlmeext->mgnt_seq);
+	pwlanhdr->seq_ctrl = cpu_to_le16(IEEE80211_SN_TO_SEQ(pmlmeext->mgnt_seq));
 	pmlmeext->mgnt_seq++;
 	*fctrl |= cpu_to_le16(IEEE80211_FTYPE_MGMT | IEEE80211_STYPE_DEAUTH);
 
@@ -3269,7 +3269,7 @@ void issue_action_SA_Query(struct adapter *padapter, unsigned char *raddr, unsig
 	memcpy(pwlanhdr->addr2, myid(&(padapter->eeprompriv)), ETH_ALEN);
 	memcpy(pwlanhdr->addr3, get_my_bssid(&(pmlmeinfo->network)), ETH_ALEN);
 
-	SetSeqNum(pwlanhdr, pmlmeext->mgnt_seq);
+	pwlanhdr->seq_ctrl = cpu_to_le16(IEEE80211_SN_TO_SEQ(pmlmeext->mgnt_seq));
 	pmlmeext->mgnt_seq++;
 	*fctrl |= cpu_to_le16(IEEE80211_FTYPE_MGMT | IEEE80211_STYPE_ACTION);
 
@@ -3342,7 +3342,7 @@ void issue_action_BA(struct adapter *padapter, unsigned char *raddr, unsigned ch
 	memcpy(pwlanhdr->addr2, myid(&(padapter->eeprompriv)), ETH_ALEN);
 	memcpy(pwlanhdr->addr3, get_my_bssid(&(pmlmeinfo->network)), ETH_ALEN);
 
-	SetSeqNum(pwlanhdr, pmlmeext->mgnt_seq);
+	pwlanhdr->seq_ctrl = cpu_to_le16(IEEE80211_SN_TO_SEQ(pmlmeext->mgnt_seq));
 	pmlmeext->mgnt_seq++;
 	*fctrl |= cpu_to_le16(IEEE80211_FTYPE_MGMT | IEEE80211_STYPE_ACTION);
 
@@ -3496,7 +3496,7 @@ static void issue_action_BSSCoexistPacket(struct adapter *padapter)
 	memcpy(pwlanhdr->addr2, myid(&(padapter->eeprompriv)), ETH_ALEN);
 	memcpy(pwlanhdr->addr3, get_my_bssid(&(pmlmeinfo->network)), ETH_ALEN);
 
-	SetSeqNum(pwlanhdr, pmlmeext->mgnt_seq);
+	pwlanhdr->seq_ctrl = cpu_to_le16(IEEE80211_SN_TO_SEQ(pmlmeext->mgnt_seq));
 	pmlmeext->mgnt_seq++;
 	*fctrl |= cpu_to_le16(IEEE80211_FTYPE_MGMT | IEEE80211_STYPE_ACTION);
 
diff --git a/drivers/staging/rtl8723bs/core/rtw_recv.c b/drivers/staging/rtl8723bs/core/rtw_recv.c
index 75eef9662..b09ea6f76 100644
--- a/drivers/staging/rtl8723bs/core/rtw_recv.c
+++ b/drivers/staging/rtl8723bs/core/rtw_recv.c
@@ -935,7 +935,7 @@ static signed int validate_recv_ctrl_frame(struct adapter *padapter, union recv_
 		u16 aid;
 		u8 wmmps_ac = 0;
 
-		aid = GetAid(pframe);
+		aid = le16_to_cpu(hdr->duration_id) & 0x3fff;
 		if (psta->aid != aid)
 			return _FAIL;
 
@@ -1448,8 +1448,8 @@ static signed int validate_recv_frame(struct adapter *adapter, union recv_frame
 	pattrib->to_fr_ds = (ieee80211_has_tods(hdr->frame_control) << 1) |
 			    ieee80211_has_fromds(hdr->frame_control);
 
-	pattrib->frag_num = GetFragNum(ptr);
-	pattrib->seq_num = GetSequence(ptr);
+	pattrib->frag_num = le16_to_cpu(hdr->seq_ctrl) & IEEE80211_SCTL_FRAG;
+	pattrib->seq_num = ieee80211_get_sn(hdr);
 
 	pattrib->pw_save = ieee80211_has_pm(hdr->frame_control);
 	pattrib->mfrag = ieee80211_has_morefrags(hdr->frame_control);
diff --git a/drivers/staging/rtl8723bs/core/rtw_xmit.c b/drivers/staging/rtl8723bs/core/rtw_xmit.c
index 8855f80f7..1624bf6de 100644
--- a/drivers/staging/rtl8723bs/core/rtw_xmit.c
+++ b/drivers/staging/rtl8723bs/core/rtw_xmit.c
@@ -987,7 +987,8 @@ int rtw_make_wlanhdr(struct adapter *padapter, u8 *hdr, struct pkt_attrib *pattr
 				psta->sta_xmitpriv.txseq_tid[pattrib->priority] %= 4096u;
 				pattrib->seqnum = psta->sta_xmitpriv.txseq_tid[pattrib->priority];
 
-				SetSeqNum(hdr, pattrib->seqnum);
+				pwlanhdr->seq_ctrl =
+					cpu_to_le16(IEEE80211_SN_TO_SEQ(pattrib->seqnum));
 
 				/* check if enable ampdu */
 				if (pattrib->ht_en && psta->htpriv.ampdu_enable)
diff --git a/drivers/staging/rtl8723bs/hal/rtl8723b_cmd.c b/drivers/staging/rtl8723bs/hal/rtl8723b_cmd.c
index c5518eeea..756d6dc84 100644
--- a/drivers/staging/rtl8723bs/hal/rtl8723b_cmd.c
+++ b/drivers/staging/rtl8723bs/hal/rtl8723b_cmd.c
@@ -115,7 +115,7 @@ static void ConstructBeacon(struct adapter *padapter, u8 *pframe, u32 *pLength)
 	ether_addr_copy(pwlanhdr->addr2, myid(&padapter->eeprompriv));
 	ether_addr_copy(pwlanhdr->addr3, get_my_bssid(cur_network));
 
-	SetSeqNum(pwlanhdr, 0);
+	pwlanhdr->seq_ctrl &= cpu_to_le16(IEEE80211_SCTL_FRAG);
 	*fctrl |= cpu_to_le16(IEEE80211_FTYPE_MGMT | IEEE80211_STYPE_BEACON);
 
 	pframe += sizeof(struct ieee80211_hdr_3addr);
@@ -196,7 +196,7 @@ static void ConstructPSPoll(struct adapter *padapter, u8 *pframe, u32 *pLength)
 	*fctrl |= cpu_to_le16(IEEE80211_FTYPE_CTL | IEEE80211_STYPE_PSPOLL);
 
 	/*  AID. */
-	SetDuration(pframe, (pmlmeinfo->aid | 0xc000));
+	pwlanhdr->duration_id = cpu_to_le16(pmlmeinfo->aid | 0xc000);
 
 	/*  BSSID. */
 	ether_addr_copy(pwlanhdr->addr1, get_my_bssid(&pmlmeinfo->network));
@@ -252,7 +252,7 @@ static void ConstructNullFunctionData(struct adapter *padapter,
 		break;
 	}
 
-	SetSeqNum(pwlanhdr, 0);
+	pwlanhdr->seq_ctrl &= cpu_to_le16(IEEE80211_SCTL_FRAG);
 
 	if (bQoS) {
 		struct ieee80211_qos_hdr *pwlanqoshdr;
@@ -739,8 +739,8 @@ static void ConstructBtNullFunctionData(struct adapter *padapter,
 	ether_addr_copy(pwlanhdr->addr2, myid(&padapter->eeprompriv));
 	ether_addr_copy(pwlanhdr->addr3, myid(&padapter->eeprompriv));
 
-	SetDuration(pwlanhdr, 0);
-	SetSeqNum(pwlanhdr, 0);
+	pwlanhdr->duration_id = 0;
+	pwlanhdr->seq_ctrl &= cpu_to_le16(IEEE80211_SCTL_FRAG);
 
 	if (bQoS) {
 		struct ieee80211_qos_hdr *pwlanqoshdr;
diff --git a/drivers/staging/rtl8723bs/include/wifi.h b/drivers/staging/rtl8723bs/include/wifi.h
index 9790bd850..85348979a 100644
--- a/drivers/staging/rtl8723bs/include/wifi.h
+++ b/drivers/staging/rtl8723bs/include/wifi.h
@@ -18,30 +18,6 @@
 /*  This test verifies the WLAN NIC can update the NAV through sending the CTS with large duration. */
 #define	WiFiNavUpperUs				30000	/*  30 ms */
 
-#define GetSequence(pbuf)			\
-	(le16_to_cpu(*(__le16 *)((size_t)(pbuf) + 22)) >> 4)
-
-#define GetFragNum(pbuf)			\
-	(le16_to_cpu(*(__le16 *)((size_t)(pbuf) + 22)) & 0x0f)
-
-#define SetFragNum(pbuf, num) \
-	do {    \
-		*(unsigned short *)((size_t)(pbuf) + 22) = \
-			((*(unsigned short *)((size_t)(pbuf) + 22)) &	\
-			le16_to_cpu(~(0x000f))) | \
-			cpu_to_le16(0x0f & (num));     \
-	} while (0)
-
-#define SetSeqNum(pbuf, num) \
-	do {    \
-		*(__le16 *)((size_t)(pbuf) + 22) = \
-			((*(__le16 *)((size_t)(pbuf) + 22)) & cpu_to_le16((unsigned short)0x000f)) | \
-			cpu_to_le16((unsigned short)(0xfff0 & (num << 4))); \
-	} while (0)
-
-#define SetDuration(pbuf, dur) \
-	(*(__le16 *)((size_t)(pbuf) + 2) = cpu_to_le16(0xffff & (dur)))
-
 #define SetPriority(pbuf, tid)	\
 	(*(__le16 *)(pbuf) |= cpu_to_le16(tid & 0xf))
 
@@ -57,8 +33,6 @@
 
 #define GetAMsdu(pbuf) (((le16_to_cpu(*(__le16 *)pbuf)) >> 7) & 0x1)
 
-#define GetAid(pbuf)	(le16_to_cpu(*(__le16 *)((size_t)(pbuf) + 2)) & 0x3fff)
-
 static inline unsigned char *rtl8723bs_get_ra(unsigned char *pframe)
 {
 	struct ieee80211_hdr *hdr = (struct ieee80211_hdr *)pframe;
diff --git a/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c b/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
index d52bcf1b1..fe59307bf 100644
--- a/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
+++ b/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
@@ -281,7 +281,7 @@ struct cfg80211_bss *rtw_cfg80211_inform_bss(struct adapter *padapter, struct wl
 	fctrl = &pwlanhdr->frame_control;
 	*(fctrl) = 0;
 
-	SetSeqNum(pwlanhdr, 0/*pmlmeext->mgnt_seq*/);
+	pwlanhdr->seq_ctrl = 0;
 
 	if (pnetwork->network.reserved[0] == 1) { /* beacon */
 		eth_broadcast_addr(pwlanhdr->addr1);
@@ -2074,7 +2074,7 @@ static netdev_tx_t rtw_cfg80211_monitor_if_xmit_entry(struct sk_buff *skb, struc
 
 		pwlanhdr = (struct ieee80211_hdr *)pframe;
 		/* update seq number */
-		pmlmeext->mgnt_seq = GetSequence(pwlanhdr);
+		pmlmeext->mgnt_seq = ieee80211_get_sn(pwlanhdr);
 		pattrib->seqnum = pmlmeext->mgnt_seq;
 		pmlmeext->mgnt_seq++;
 
@@ -2480,7 +2480,7 @@ static int _cfg80211_rtw_mgmt_tx(struct adapter *padapter, u8 tx_ch, const u8 *b
 
 	pwlanhdr = (struct ieee80211_hdr *)pframe;
 	/* update seq number */
-	pmlmeext->mgnt_seq = GetSequence(pwlanhdr);
+	pmlmeext->mgnt_seq = ieee80211_get_sn(pwlanhdr);
 	pattrib->seqnum = pmlmeext->mgnt_seq;
 	pmlmeext->mgnt_seq++;
 
-- 
2.43.0

