Received: from mail-dl1-f48.google.com (mail-dl1-f48.google.com [74.125.82.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E345D4BD0E0
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 12:06:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792066012; cv=none; b=cZdhGLpMRtGDs+YprlU2TrajUZmfONLqijKE4bFUEAmNyaBZbSs9bzRj7RW5rgr5yxZkl65uezv5WSIfxHIbbXCfS4dnblj4pwZsERW9w2eU2KwokrRVFhvo0rMFW6OFd//GF8qE0KP8ev6KTtFSiePHOvuWeGYuSJrCuqQKx0U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792066012; c=relaxed/simple;
	bh=cgSrAC4AHVBr99jQ1DICdOtH9llQAOcLAZmMTnDV0Rk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=dCYQ3/VmoataEXqu4lzojkVHD+0ZR+8QHXmXw4GrAQs2WtVgzYXO/amgpOcWD4NcZsEGGEnCnDreTFxPrs5XtWf7Nboyd/EM7qqwppziBU3xHuOF4GUrQCNwdUckeiEF8eEnfRAjZJqTPQa5EKKt/5VVjhHLKcyJ6af5UTn1s3g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aMVJnQ2Z; arc=none smtp.client-ip=74.125.82.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aMVJnQ2Z"
Received: by mail-dl1-f48.google.com with SMTP id a92af1059eb24-17bc533fda3so2116858c88.1
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 05:06:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792066010; x=1792670810; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=l/PQRGA0PBTfcR1OxI5EM6MXmm9MO8wZxPeWGu+zgiU=;
        b=aMVJnQ2ZXu0SBoi4ci3SNwi9nSqkvMkkc1bKVauMuuSIDwlVHZSQT5j4f5/8SjZHJJ
         mRegAa/OsezvT1ET9LcCo/2th7+ZveR4wl1w4YryeRPheRAchp/G7MK7oj9ky7OFwO37
         /mTbBx/O1WYi8Qhso5VTwq/zL8tih6bh4owgR3hOMmVkKwFhIUVdlOFlbH/dI44Lq41h
         r6XSk5LHW/BK6mJyK6mXLwmj0MDcNWSYvxaA9VEgHc1GfoS+AWlpXhoutbH2NnhHeKo2
         v8umdxkRySGn9rIe3eHGEy6QMe66ztpVHeI8NG7L0kYc00tJ6GM3HtvO0jp5/XARWY+o
         eAeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792066010; x=1792670810;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=l/PQRGA0PBTfcR1OxI5EM6MXmm9MO8wZxPeWGu+zgiU=;
        b=lXIc6zc26iFUhoalfkSH93+jHFhcpD1p/mrEDlumDN++t6U2TL3V2Tt4poA5cSK2yX
         AvEzJhu2bUjmM9bmpuqPizSZA96aLIgoNNwv0f7McAApEUL6p87D6CltyhceZ47+yiU2
         ORm997iFkJF0XuJXGr+0Domqk1xabok4N3CXNqalDYudxTNeP485+us8tZOCMjLHcKIE
         6GpneeNPI85lic3l8tvGTogv0kLC6v0L0KaYM6+4Tky/VHSj6l19agdAOFeKfH/sbw9L
         lj7hf3P5DNKBKX3Hrtx/SYMO6VJi05L6wQOubAim+qGiC8QwtYB2hqOuqP3zSzFbXe6B
         ZGng==
X-Forwarded-Encrypted: i=1; AKwUvBz2yxxOVR4hz1bIMT4tt7/ePb0vHGl+L1fS4GQcnVP3pKcg2XLSxDQE5TPUWDx9Nme9y2IXhilIVJKu7wk=@vger.kernel.org
X-Gm-Message-State: AFq9FYJR+Si8NHe+oEe5OlXhoPp+0Y4bc5nKP9u3u2uVhVV8besUoZZd
	o8bwQtogHPP+V49Tg1IbJ/5DP7nT8vS8iH/KuuSL1i+MijFp/pulcJWA
X-Gm-Gg: AYBFou22JLSn2dp9X+QOtH7hOBCywKQfLk/b1d169u2UkUfe8JfWSA1ohKeQh0l7cS3
	VFtZf6T0vDJmlzQdwxWYmIEoAi6vUNlw5Mr9h1aN10YPKYnb9sGy6BlOWLXMG4ZYRHyNWbyF+5G
	umBAHbD3uEGl3r/Qf1ttirVSlqPVy7jgEKbzjP03y7BLSH+7idCwLUPgvimOVltAy+DKeOPEyEv
	+yZ7325zk9dXN/6IPuvRnDRpz2ZUDgMVIQicAxyZ2izUbuLDwglvbGY/XaPbEZW5vQ2Q0BEA3Oi
	zDaMoSDXcOd3clzHOnivON89uFZ+YHdrcr9Bk2N2iE5MMitgTWGThCwJ7V8Aq6b7vuJO/yrrDpp
	CaWuMPOwqonKTYsjrFkcKvtFSoEEWnQrda2NlJgSIjEevA/8mnrP1pvV1888zdgaTlX1NZhNhP4
	Af4N+6e+jiyo8UKo00kJOAMdEQ+xDBGop7YEao7zkBM74Wj2bvK1MZXA2wElYMCcfcyhB/q5Rwu
	9OHcE1ClJn8vzgU6A==
X-Received: by 2002:a05:7022:eb53:20b0:170:64b:b388 with SMTP id a92af1059eb24-170064bb41amr20593658c88.46.1792066009771;
        Thu, 15 Oct 2026 05:06:49 -0700 (PDT)
Received: from user.. ([2405:201:c052:b00b:a490:42fc:1e02:1d0b])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-17dc865cbffsm21857896c88.6.2026.10.15.05.06.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 05:06:48 -0700 (PDT)
From: pavankumaryalagada@gmail.com
To: gregkh@linuxfoundation.org,
	outreachy@lists.linux.dev
Cc: error27@gmail.com,
	ethantidmore06@gmail.com,
	luka.gejak@linux.dev,
	dennylin0707@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Yalagada Pavan Kumar <pavankumaryalagada@gmail.com>
Subject: [PATCH] staging: rtl8723bs: remove unnecessary parentheses
Date: Thu, 15 Oct 2026 17:36:34 +0530
Message-ID: <20261015120634.95218-1-pavankumaryalagada@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Yalagada Pavan Kumar <pavankumaryalagada@gmail.com>

Remove redundant parentheses around the address-of operator to
follow kernel coding style.

Signed-off-by: Yalagada Pavan Kumar <pavankumaryalagada@gmail.com>
---
 .../staging/rtl8723bs/core/rtw_ieee80211.c    |  4 +--
 .../staging/rtl8723bs/core/rtw_ioctl_set.c    | 18 ++++++------
 drivers/staging/rtl8723bs/core/rtw_recv.c     | 28 +++++++++----------
 3 files changed, 25 insertions(+), 25 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_ieee80211.c b/drivers/staging/rtl8723bs/core/rtw_ieee80211.c
index 4d211711f2ba..9917f1310b13 100644
--- a/drivers/staging/rtl8723bs/core/rtw_ieee80211.c
+++ b/drivers/staging/rtl8723bs/core/rtw_ieee80211.c
@@ -336,11 +336,11 @@ int rtw_generate_ie(struct registry_priv *pregistrypriv)
 	}
 
 	/* DS parameter set */
-	ie = rtw_set_ie(ie, WLAN_EID_DS_PARAMS, 1, (u8 *)&(pdev_network->configuration.ds_config), &sz);
+	ie = rtw_set_ie(ie, WLAN_EID_DS_PARAMS, 1, (u8 *)&pdev_network->configuration.ds_config, &sz);
 
 	/* IBSS Parameter Set */
 
-	ie = rtw_set_ie(ie, WLAN_EID_IBSS_PARAMS, 2, (u8 *)&(pdev_network->configuration.atim_window), &sz);
+	ie = rtw_set_ie(ie, WLAN_EID_IBSS_PARAMS, 2, (u8 *)&pdev_network->configuration.atim_window, &sz);
 
 	if (rate_len > 8)
 		ie = rtw_set_ie(ie, WLAN_EID_EXT_SUPP_RATES, (rate_len - 8), (pdev_network->supported_rates + 8), &sz);
diff --git a/drivers/staging/rtl8723bs/core/rtw_ioctl_set.c b/drivers/staging/rtl8723bs/core/rtw_ioctl_set.c
index 2739d0e99098..2c6d10196130 100644
--- a/drivers/staging/rtl8723bs/core/rtw_ioctl_set.c
+++ b/drivers/staging/rtl8723bs/core/rtw_ioctl_set.c
@@ -36,11 +36,11 @@ u8 rtw_do_join(struct adapter *padapter)
 {
 	struct list_head	*plist, *phead;
 	u8 *pibss = NULL;
-	struct	mlme_priv *pmlmepriv = &(padapter->mlmepriv);
-	struct __queue	*queue	= &(pmlmepriv->scanned_queue);
+	struct	mlme_priv *pmlmepriv = &padapter->mlmepriv;
+	struct __queue	*queue	= &pmlmepriv->scanned_queue;
 	u8 ret = _SUCCESS;
 
-	spin_lock_bh(&(pmlmepriv->scanned_queue.lock));
+	spin_lock_bh(&pmlmepriv->scanned_queue.lock);
 	phead = get_list_head(queue);
 	plist = get_next(phead);
 
@@ -53,7 +53,7 @@ u8 rtw_do_join(struct adapter *padapter)
 	pmlmepriv->to_join = true;
 
 	if (list_empty(&queue->queue)) {
-		spin_unlock_bh(&(pmlmepriv->scanned_queue.lock));
+		spin_unlock_bh(&pmlmepriv->scanned_queue.lock);
 		_clr_fwstate_(pmlmepriv, _FW_UNDER_LINKING);
 
 		/* when set_ssid/set_bssid for rtw_do_join(), but scanning queue is empty */
@@ -74,7 +74,7 @@ u8 rtw_do_join(struct adapter *padapter)
 	} else {
 		int select_ret;
 
-		spin_unlock_bh(&(pmlmepriv->scanned_queue.lock));
+		spin_unlock_bh(&pmlmepriv->scanned_queue.lock);
 		select_ret = rtw_select_and_join_from_scanned_queue(pmlmepriv);
 		if (select_ret == _SUCCESS) {
 			pmlmepriv->to_join = false;
@@ -84,7 +84,7 @@ u8 rtw_do_join(struct adapter *padapter)
 				/*  submit createbss_cmd to change to a ADHOC_MASTER */
 
 				/* pmlmepriv->lock has been acquired by caller... */
-				struct wlan_bssid_ex    *pdev_network = &(padapter->registrypriv.dev_network);
+				struct wlan_bssid_ex    *pdev_network = &padapter->registrypriv.dev_network;
 
 				pmlmepriv->fw_state = WIFI_ADHOC_MASTER_STATE;
 
@@ -282,7 +282,7 @@ u8 rtw_set_802_11_infrastructure_mode(struct adapter *padapter,
 {
 	struct	mlme_priv *pmlmepriv = &padapter->mlmepriv;
 	struct	wlan_network	*cur_network = &pmlmepriv->cur_network;
-	enum nl80211_iftype *pold_state = &(cur_network->network.infrastructure_mode);
+	enum nl80211_iftype *pold_state = &cur_network->network.infrastructure_mode;
 
 	if (*pold_state != networktype) {
 		if (*pold_state == NL80211_IFTYPE_AP) {
@@ -413,7 +413,7 @@ u8 rtw_set_802_11_authentication_mode(struct adapter *padapter, enum ndis_802_11
 u8 rtw_set_802_11_add_wep(struct adapter *padapter, struct ndis_802_11_wep *wep)
 {
 	signed int		keyid, res;
-	struct security_priv *psecuritypriv = &(padapter->securitypriv);
+	struct security_priv *psecuritypriv = &padapter->securitypriv;
 	u8 ret = _SUCCESS;
 
 	keyid = wep->key_index & 0x3fffffff;
@@ -435,7 +435,7 @@ u8 rtw_set_802_11_add_wep(struct adapter *padapter, struct ndis_802_11_wep *wep)
 		break;
 	}
 
-	memcpy(&(psecuritypriv->dot11DefKey[keyid].skey[0]), &(wep->key_material), wep->key_length);
+	memcpy(&psecuritypriv->dot11DefKey[keyid].skey[0], &wep->key_material, wep->key_length);
 
 	psecuritypriv->dot11DefKeylen[keyid] = wep->key_length;
 
diff --git a/drivers/staging/rtl8723bs/core/rtw_recv.c b/drivers/staging/rtl8723bs/core/rtw_recv.c
index 7568fc514d7c..f836108a1cd2 100644
--- a/drivers/staging/rtl8723bs/core/rtw_recv.c
+++ b/drivers/staging/rtl8723bs/core/rtw_recv.c
@@ -59,9 +59,9 @@ signed int _rtw_init_recv_priv(struct recv_priv *precvpriv, struct adapter *pada
 	precvframe = (union recv_frame *)precvpriv->precv_frame_buf;
 
 	for (i = 0; i < NR_RECVFRAME; i++) {
-		INIT_LIST_HEAD(&(precvframe->u.list));
+		INIT_LIST_HEAD(&precvframe->u.list);
 
-		list_add_tail(&(precvframe->u.list), &(precvpriv->free_recv_queue.queue));
+		list_add_tail(&precvframe->u.list, &precvpriv->free_recv_queue.queue);
 
 		precvframe->u.hdr.pkt_newalloc = NULL;
 		precvframe->u.hdr.pkt = NULL;
@@ -161,11 +161,11 @@ int rtw_free_recvframe(union recv_frame *precvframe, struct __queue *pfree_recv_
 
 	spin_lock_bh(&pfree_recv_queue->lock);
 
-	list_del_init(&(precvframe->u.hdr.list));
+	list_del_init(&precvframe->u.hdr.list);
 
 	precvframe->u.hdr.len = 0;
 
-	list_add_tail(&(precvframe->u.hdr.list), get_list_head(pfree_recv_queue));
+	list_add_tail(&precvframe->u.hdr.list, get_list_head(pfree_recv_queue));
 
 	if (padapter) {
 		if (pfree_recv_queue == &precvpriv->free_recv_queue)
@@ -181,9 +181,9 @@ signed int _rtw_enqueue_recvframe(union recv_frame *precvframe, struct __queue *
 	struct recv_priv *precvpriv = &padapter->recvpriv;
 
 	/* INIT_LIST_HEAD(&(precvframe->u.hdr.list)); */
-	list_del_init(&(precvframe->u.hdr.list));
+	list_del_init(&precvframe->u.hdr.list);
 
-	list_add_tail(&(precvframe->u.hdr.list), get_list_head(queue));
+	list_add_tail(&precvframe->u.hdr.list, get_list_head(queue));
 
 	if (padapter)
 		if (queue == &precvpriv->free_recv_queue)
@@ -352,7 +352,7 @@ static signed int recvframe_chkmic(struct adapter *adapter,  union recv_frame *p
 	struct security_priv *psecuritypriv = &adapter->securitypriv;
 
 	struct mlme_ext_priv *pmlmeext = &adapter->mlmeextpriv;
-	struct mlme_ext_info *pmlmeinfo = &(pmlmeext->mlmext_info);
+	struct mlme_ext_info *pmlmeinfo = &pmlmeext->mlmext_info;
 
 	stainfo = rtw_get_stainfo(&adapter->stapriv, &prxattrib->ta[0]);
 
@@ -1059,7 +1059,7 @@ static union recv_frame *recvframe_defrag(struct adapter *adapter,
 	plist = get_next(phead);
 	prframe = (union recv_frame *)plist;
 	pfhdr = &prframe->u.hdr;
-	list_del_init(&(prframe->u.list));
+	list_del_init(&prframe->u.list);
 
 	if (curfragnum != pfhdr->attrib.frag_num) {
 		/* the first fragment number must be 0 */
@@ -1670,7 +1670,7 @@ static int amsdu_to_msdu(struct adapter *padapter, union recv_frame *prframe)
 	u8 *pdata;
 	struct sk_buff *sub_pkt, *subframes[MAX_SUBFRAME_COUNT];
 	struct recv_priv *precvpriv = &padapter->recvpriv;
-	struct __queue *pfree_recv_queue = &(precvpriv->free_recv_queue);
+	struct __queue *pfree_recv_queue = &precvpriv->free_recv_queue;
 
 	nr_subframes = 0;
 
@@ -1795,9 +1795,9 @@ static int enqueue_reorder_recvframe(struct recv_reorder_ctrl *preorder_ctrl, un
 	/* spin_lock_irqsave(&ppending_recvframe_queue->lock, irql); */
 	/* spin_lock(&ppending_recvframe_queue->lock); */
 
-	list_del_init(&(prframe->u.hdr.list));
+	list_del_init(&prframe->u.hdr.list);
 
-	list_add_tail(&(prframe->u.hdr.list), plist);
+	list_add_tail(&prframe->u.hdr.list, plist);
 
 	/* spin_unlock(&ppending_recvframe_queue->lock); */
 	/* spin_unlock_irqrestore(&ppending_recvframe_queue->lock, irql); */
@@ -1812,8 +1812,8 @@ static int rtw_recv_indicatepkt(struct adapter *padapter, union recv_frame *prec
 	struct sk_buff *skb;
 	struct rx_pkt_attrib *pattrib = &precv_frame->u.hdr.attrib;
 
-	precvpriv = &(padapter->recvpriv);
-	pfree_recv_queue = &(precvpriv->free_recv_queue);
+	precvpriv = &padapter->recvpriv;
+	pfree_recv_queue = &precvpriv->free_recv_queue;
 
 	skb = precv_frame->u.hdr.pkt;
 	if (!skb)
@@ -1880,7 +1880,7 @@ static int recv_indicatepkts_in_order(struct adapter *padapter, struct recv_reor
 
 		if (!SN_LESS(preorder_ctrl->indicate_seq, pattrib->seq_num)) {
 			plist = get_next(plist);
-			list_del_init(&(prframe->u.hdr.list));
+			list_del_init(&prframe->u.hdr.list);
 
 			if (SN_EQUAL(preorder_ctrl->indicate_seq, pattrib->seq_num))
 				preorder_ctrl->indicate_seq = (preorder_ctrl->indicate_seq + 1) % 4096u;
-- 
2.43.0

