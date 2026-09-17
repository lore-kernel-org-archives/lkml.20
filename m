Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49DDE4AB1A2
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 10:03:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789639420; cv=none; b=owpGlH10Pm5d2cOHC8P0FKuvxkH1SXmwXwpauXeXKsnmkGtNYlz10BhcIh6VGTF3B/Hth5qKLBcnYIEbTDr07Gcv/dP4Qd1bwvQKjpGx0B4IMVRiTGgVqaSbXtnvHhRxeJVEKCGvyiSBwjolgS9z+o+T3As+AJ3nxVk6L36IOA0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789639420; c=relaxed/simple;
	bh=PoNl5ra+f0U67tujIj1s8rXFEi7Km9LNlMg67/0AyWY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=ktXuDajOOBLAwZxk8BMB7gVOb2khrkemkdlnyvVOEDRWlVaV/Ve3Kbx7OUQiQDEjmrZ1iwTvfJn4JD/W2BXIfC9lVK7O8k6ZgonoKEREcidM7YM3CMcqXlPm1LbBK+v8DrLBuk6VaMP4gDEP0jXFd/vl4tGCcOuN0Yxeb56w5d4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Chr6d/Pf; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Chr6d/Pf"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49b912d3931so4788155e9.3
        for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 03:03:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789639403; x=1790244203; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/J4Rp8eRnaPGbAZF8oVjd3+a9JLUxp/weesAB0KEsHI=;
        b=Chr6d/PfjUfv9YVfSEyHBeRgyPEYJOnN+LOfgfG3QW/PGNyTFFbMBC/Rz47HyDjn//
         rldtYuWwYQnitq7oPPzSNFGYj4y+ay1v1gWlHtBMp6Ls3TiFqOYM3smqaot+UZ26RPrZ
         HrBoSd34LfkqCiLWV1LzetL2kCuVSJXGWyJogRmEi6ds93wJW5Ej6uqOmv1GYJQDGQ/h
         kfi6eW+VDzyIcYjZZ9Enm5iZDZaMgImhdtnatv3Ami+oiwJWnkrj52DgwvL/9nIybwa6
         Hjua41m4xvJOmIAts2JM3iKwUWxmTwWAcDft9fLvTRW6MXQX0grbjAdB49rac3xkm38T
         WzHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789639403; x=1790244203;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/J4Rp8eRnaPGbAZF8oVjd3+a9JLUxp/weesAB0KEsHI=;
        b=M7fFbAkSZpx29W4fAbjzYJp8RxTnsticJIJbzabPdBBkGtPPn2uuxiZHyRwEeyMHWz
         VS0ok29COapAOJRnFJOXiYYtvNpunZ4xDg1xGdKjAq18EEwKMMkvNI/ACesYPbzIm2Q6
         Re80KWEfketQaAxQHLaD960KzIslLmVW9L2nkZucbjkO6uiENBLZtCsjz0/DAB8Rf7Uw
         /tL8HRDhJ+iHD7hPP/uErPoLY5OYpG3rZtc+mSFjuJ7W7qe1DhJo56ERnDJ3KMEY9egs
         kV6L3POeyP/wPMPGyxHXVN3U/kff0rLoeAFVGGy6Ssj4y+z7qP/aTtIZNucsinVCE2I/
         vC/A==
X-Forwarded-Encrypted: i=1; AKwUvBzREhi/9PD/FSH5ixPeYWllBkrg9o5vKNXAjfiM0Yl7jNKbtX+K1r2iOQ764vA8rmbUB5IrJe8i1CSXMl4=@vger.kernel.org
X-Gm-Message-State: AFuF++nYWp5Lw+ansX/eB9RS9hozlPVmmnbRIaYk61120c5fLOdaWLi4
	HrjLkqb0jEmMR+BcN9XZF2JTz0jIShYgtjWW+Sq1Iyq2ZWZTQVWkE/c2/+Nak+0Z
X-Gm-Gg: AYBFou0QZbanJmZpcXl0qizqf6SWVX/0/mTGE1vobvX6qOCiQkClu2D9aT1SGXZTVfN
	hOrki/TcFQ+EI9RLY6YUpIHOalFWY8wS/1I49jFAh6tk2npWyhbGyki2yvaU8Yi7ILdqBPgO2d6
	/svHUS+xFf1CQqSNwnr1Kl/cWV0WLwOTdyOAwlvkx4ZRYqrw4+mdu3e46Obp5dRXIdEt+i1KMsF
	ZwHceAFk4aE5P528sWrwv7BhyumcsCbv+DKuOIBNmAy8cAXNp88aSmqf4aSb6HlmZy8YPr+ATGg
	XZkIkzvhrG3GfMWwQTt8d+U8pcYwWiBnbeBgoNTtvYOC4YWHNillbgj+GvBtguuj740LTNbGfxi
	/l0/sjhmZO7r8SkF5//Vq2SjNhcauiSoBRHbM424DsX90muFkQ99gM/4Pp7Q7sC5ry4nJtCmDtL
	+glQgJEnNAyiFXYvXumeWq76xPgkJCNemErYl8UeUvccze9u2SAqZwzFffXf2IrZFTA0jSk3NNo
	0d6sNKvn8DLmCgn1WBOXA==
X-Received: by 2002:a05:600c:1c0e:b0:499:79b9:e220 with SMTP id 5b1f17b1804b1-49eb72f382amr79104485e9.10.1789639402386;
        Thu, 17 Sep 2026 03:03:22 -0700 (PDT)
Received: from ubuntu-4gb-nbg1-1.. ([2a01:4f8:1c19:b0ad::1])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fbfd935cfsm27880785e9.0.2026.09.17.03.03.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 03:03:21 -0700 (PDT)
From: =?UTF-8?q?Rare=C8=99-Mihai=20Vladu?= <vladurares@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Rare=C8=99-Mihai=20Vladu?= <vladurares@gmail.com>
Subject: [PATCH] staging: rtl8723bs: fix coding style issues in rtw_recv.c
Date: Thu, 17 Sep 2026 10:02:54 +0000
Message-ID: <20260917100254.1067839-1-vladurares@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Remove unnecessary parentheses around arguments to list macros
and the address-of operator. Fix alignment to match open
parenthesis. Issues reported by checkpatch.

Signed-off-by: Rareș-Mihai Vladu <vladurares@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_recv.c | 63 ++++++++++++-----------
 1 file changed, 32 insertions(+), 31 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_recv.c b/drivers/staging/rtl8723bs/core/rtw_recv.c
index 7568fc514..fbb223288 100644
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
@@ -323,7 +323,7 @@ static void rtw_handle_tkip_mic_err(struct adapter *padapter, u8 bgroup)
 		key_type |= NL80211_KEYTYPE_PAIRWISE;
 
 	cfg80211_michael_mic_failure(padapter->pnetdev, (u8 *)&pmlmepriv->assoc_bssid[0], key_type, -1,
-		NULL, GFP_ATOMIC);
+				     NULL, GFP_ATOMIC);
 
 	memset(&ev, 0x00, sizeof(ev));
 	if (bgroup)
@@ -352,7 +352,7 @@ static signed int recvframe_chkmic(struct adapter *adapter,  union recv_frame *p
 	struct security_priv *psecuritypriv = &adapter->securitypriv;
 
 	struct mlme_ext_priv *pmlmeext = &adapter->mlmeextpriv;
-	struct mlme_ext_info *pmlmeinfo = &(pmlmeext->mlmext_info);
+	struct mlme_ext_info *pmlmeinfo = &pmlmeext->mlmext_info;
 
 	stainfo = rtw_get_stainfo(&adapter->stapriv, &prxattrib->ta[0]);
 
@@ -682,7 +682,7 @@ static void count_rx_stats(struct adapter *padapter, union recv_frame *prframe,
 }
 
 static signed int sta2sta_data_frame(struct adapter *adapter, union recv_frame *precv_frame,
-			struct sta_info **psta)
+				     struct sta_info **psta)
 {
 	u8 *ptr = precv_frame->u.hdr.rx_data;
 	signed int ret = _SUCCESS;
@@ -768,7 +768,7 @@ static signed int sta2sta_data_frame(struct adapter *adapter, union recv_frame *
 }
 
 static signed int ap2sta_data_frame(struct adapter *adapter, union recv_frame *precv_frame,
-		       struct sta_info **psta)
+				    struct sta_info **psta)
 {
 	u8 *ptr = precv_frame->u.hdr.rx_data;
 	struct rx_pkt_attrib *pattrib = &precv_frame->u.hdr.attrib;
@@ -866,7 +866,7 @@ static signed int ap2sta_data_frame(struct adapter *adapter, union recv_frame *p
 }
 
 static signed int sta2ap_data_frame(struct adapter *adapter, union recv_frame *precv_frame,
-		       struct sta_info **psta)
+				    struct sta_info **psta)
 {
 	u8 *ptr = precv_frame->u.hdr.rx_data;
 	struct rx_pkt_attrib *pattrib = &precv_frame->u.hdr.attrib;
@@ -1059,7 +1059,7 @@ static union recv_frame *recvframe_defrag(struct adapter *adapter,
 	plist = get_next(phead);
 	prframe = (union recv_frame *)plist;
 	pfhdr = &prframe->u.hdr;
-	list_del_init(&(prframe->u.list));
+	list_del_init(&prframe->u.list);
 
 	if (curfragnum != pfhdr->attrib.frag_num) {
 		/* the first fragment number must be 0 */
@@ -1378,7 +1378,8 @@ static signed int validate_80211w_mgmt(struct adapter *adapter, union recv_frame
 	    adapter->securitypriv.binstallBIPkey) {
 		/* unicast management frame decrypt */
 		if (pattrib->privacy && !(is_multicast_ether_addr(GetAddr1Ptr(ptr))) &&
-			(subtype == WIFI_DEAUTH || subtype == WIFI_DISASSOC || subtype == WIFI_ACTION)) {
+		    (subtype == WIFI_DEAUTH || subtype == WIFI_DISASSOC ||
+		     subtype == WIFI_ACTION)) {
 			u8 *mgmt_DATA;
 			u32 data_len = 0;
 
@@ -1420,10 +1421,10 @@ static signed int validate_80211w_mgmt(struct adapter *adapter, union recv_frame
 			if (subtype == WIFI_ACTION) {
 				/* according 802.11-2012 standard, these five types are not robust types */
 				if (ptr[WLAN_HDR_A3_LEN] != RTW_WLAN_CATEGORY_PUBLIC          &&
-					ptr[WLAN_HDR_A3_LEN] != RTW_WLAN_CATEGORY_HT              &&
-					ptr[WLAN_HDR_A3_LEN] != RTW_WLAN_CATEGORY_UNPROTECTED_WNM &&
-					ptr[WLAN_HDR_A3_LEN] != RTW_WLAN_CATEGORY_SELF_PROTECTED  &&
-					ptr[WLAN_HDR_A3_LEN] != RTW_WLAN_CATEGORY_P2P) {
+				    ptr[WLAN_HDR_A3_LEN] != RTW_WLAN_CATEGORY_HT              &&
+				    ptr[WLAN_HDR_A3_LEN] != RTW_WLAN_CATEGORY_UNPROTECTED_WNM &&
+				    ptr[WLAN_HDR_A3_LEN] != RTW_WLAN_CATEGORY_SELF_PROTECTED  &&
+				    ptr[WLAN_HDR_A3_LEN] != RTW_WLAN_CATEGORY_P2P) {
 					goto validate_80211w_fail;
 				}
 			} else if (subtype == WIFI_DEAUTH || subtype == WIFI_DISASSOC) {
@@ -1452,7 +1453,7 @@ static signed int validate_recv_frame(struct adapter *adapter, union recv_frame
 	struct rx_pkt_attrib *pattrib = &precv_frame->u.hdr.attrib;
 
 	u8 *ptr = precv_frame->u.hdr.rx_data;
-	u8  ver = (unsigned char) (*ptr) & 0x3;
+	u8  ver = (unsigned char)(*ptr) & 0x3;
 
 	/* add version chk */
 	if (ver != 0) {
@@ -1528,10 +1529,10 @@ static signed int wlanhdr_to_ethhdr(union recv_frame *precvframe)
 	/* convert hdr + possible LLC headers into Ethernet header */
 	/* eth_type = (psnap_type[0] << 8) | psnap_type[1]; */
 	if ((!memcmp(psnap, rfc1042_header, SNAP_SIZE) &&
-		(memcmp(psnap_type, SNAP_ETH_TYPE_IPX, 2)) &&
-		(memcmp(psnap_type, SNAP_ETH_TYPE_APPLETALK_AARP, 2))) ||
-		/* eth_type != ETH_P_AARP && eth_type != ETH_P_IPX) || */
-		 !memcmp(psnap, bridge_tunnel_header, SNAP_SIZE)) {
+	     (memcmp(psnap_type, SNAP_ETH_TYPE_IPX, 2)) &&
+	     (memcmp(psnap_type, SNAP_ETH_TYPE_APPLETALK_AARP, 2))) ||
+	     /* eth_type != ETH_P_AARP && eth_type != ETH_P_IPX) || */
+	     !memcmp(psnap, bridge_tunnel_header, SNAP_SIZE)) {
 		/* remove RFC1042 or Bridge-Tunnel encapsulation and replace EtherType */
 		bsnaphdr = true;
 	} else {
@@ -1593,9 +1594,9 @@ static struct sk_buff *rtw_alloc_msdu_pkt(union recv_frame *prframe, u16 subfram
 	eth_type = get_unaligned_be16(&sub_skb->data[6]);
 
 	if (sub_skb->len >= 8 &&
-		((!memcmp(sub_skb->data, rfc1042_header, SNAP_SIZE) &&
-		eth_type != ETH_P_AARP && eth_type != ETH_P_IPX) ||
-		!memcmp(sub_skb->data, bridge_tunnel_header, SNAP_SIZE))) {
+	    ((!memcmp(sub_skb->data, rfc1042_header, SNAP_SIZE) &&
+	     eth_type != ETH_P_AARP && eth_type != ETH_P_IPX) ||
+	     !memcmp(sub_skb->data, bridge_tunnel_header, SNAP_SIZE))) {
 		/*
 		 * remove RFC1042 or Bridge-Tunnel encapsulation and replace
 		 * EtherType
@@ -1670,7 +1671,7 @@ static int amsdu_to_msdu(struct adapter *padapter, union recv_frame *prframe)
 	u8 *pdata;
 	struct sk_buff *sub_pkt, *subframes[MAX_SUBFRAME_COUNT];
 	struct recv_priv *precvpriv = &padapter->recvpriv;
-	struct __queue *pfree_recv_queue = &(precvpriv->free_recv_queue);
+	struct __queue *pfree_recv_queue = &precvpriv->free_recv_queue;
 
 	nr_subframes = 0;
 
@@ -1795,9 +1796,9 @@ static int enqueue_reorder_recvframe(struct recv_reorder_ctrl *preorder_ctrl, un
 	/* spin_lock_irqsave(&ppending_recvframe_queue->lock, irql); */
 	/* spin_lock(&ppending_recvframe_queue->lock); */
 
-	list_del_init(&(prframe->u.hdr.list));
+	list_del_init(&prframe->u.hdr.list);
 
-	list_add_tail(&(prframe->u.hdr.list), plist);
+	list_add_tail(&prframe->u.hdr.list, plist);
 
 	/* spin_unlock(&ppending_recvframe_queue->lock); */
 	/* spin_unlock_irqrestore(&ppending_recvframe_queue->lock, irql); */
@@ -1812,8 +1813,8 @@ static int rtw_recv_indicatepkt(struct adapter *padapter, union recv_frame *prec
 	struct sk_buff *skb;
 	struct rx_pkt_attrib *pattrib = &precv_frame->u.hdr.attrib;
 
-	precvpriv = &(padapter->recvpriv);
-	pfree_recv_queue = &(precvpriv->free_recv_queue);
+	precvpriv = &padapter->recvpriv;
+	pfree_recv_queue = &precvpriv->free_recv_queue;
 
 	skb = precv_frame->u.hdr.pkt;
 	if (!skb)
@@ -1880,7 +1881,7 @@ static int recv_indicatepkts_in_order(struct adapter *padapter, struct recv_reor
 
 		if (!SN_LESS(preorder_ctrl->indicate_seq, pattrib->seq_num)) {
 			plist = get_next(plist);
-			list_del_init(&(prframe->u.hdr.list));
+			list_del_init(&prframe->u.hdr.list);
 
 			if (SN_EQUAL(preorder_ctrl->indicate_seq, pattrib->seq_num))
 				preorder_ctrl->indicate_seq = (preorder_ctrl->indicate_seq + 1) % 4096u;
-- 
2.43.0

