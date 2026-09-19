Received: from smtp.inf.ufrgs.br (smtp.inf.ufrgs.br [143.54.11.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96BA8314A90
	for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 21:31:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=143.54.11.23
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789853514; cv=none; b=ucE8Ym9EN8hCpYE+MxbfiKoBFNOK8yzk+1MBDg6S1xg1UoMM4QBUMSALGJ+ms9Hn4MaRKYT3FGM/VTR4MIwgsspEUHw4tLWTP+fGoWXKNOTZkWGseIJQFEYcPc8sNNeekmH1Zbau6bd1YpfI0skxtrlv7JURN29lRfcc14flxMI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789853514; c=relaxed/simple;
	bh=FoV6jIHr7K1SoB58SmDvDSrO9MtxGkq70sQnKE17ygU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=NAuILHGaeQxjkJj4dA/01xtb/1UR9fVpg7y+DPUXGtlrV0fL2Y3T1cc9L8ZJWbCxm/Jh+LNOB87UZkgJWA5Lkk0BZTACCEd63Yb0SYGHwq9XalQrnb/bTiJ6vwwJCWHJez6tcsS7VbjHdV2je3RHiz03Rm0mUsmR1N6FNxHfL+w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=inf.ufrgs.br; spf=pass smtp.mailfrom=inf.ufrgs.br; dkim=pass (2048-bit key) header.d=inf.ufrgs.br header.i=@inf.ufrgs.br header.b=EKCteWoR; arc=none smtp.client-ip=143.54.11.23
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=inf.ufrgs.br
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=inf.ufrgs.br
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=inf.ufrgs.br header.i=@inf.ufrgs.br header.b="EKCteWoR"
Received: from LAPTOP-R01LEAQM.localdomain (unknown [189.112.72.190])
	by smtp.inf.ufrgs.br (Postfix) with ESMTPSA id 490831203BC;
	Sat, 19 Sep 2026 18:31:49 -0300 (-03)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=inf.ufrgs.br;
	s=dkim2026; t=1789853509;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=T4Z0u/veBPD8wWntRbxoooLXZ4W/MhyalF72g33QWYg=;
	b=EKCteWoR9k+OE1hlf3mVS1SvfOmfzPM21QtREkrvvSZ/KcGROELZUVMmSlZ7t0aSiPkzPm
	/sun+/tecbPNyV/ttpabzdw8imUQU3e4zjLoyQjL3VvnmEajMTuQaUQS1YuZY668NEtE+i
	/W0sUZGBayDkp/PVqnwo29f2jzCSxJ58QAOvBN5FSSMh8HWOwZqR+toiKIihY2F0cLaT9+
	9oz7DMfF9hgFLyNMQSsI2cYkEiYvYmkzho+4CoZ8WGjz9UeBjwe7MU3hF+FPIrzA24rrf4
	5OwjFibRhgRkgxP2B50x774KlwzwnqNz+oifvxuduiGQq53hTzE9owwjLaX22A==
From: Matheus Alves de Almeida <matheus.aalmeida@inf.ufrgs.br>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Matheus Alves de Almeida <matheus.aalmeida@inf.ufrgs.br>
Subject: [PATCH] staging: rtl8723bs: remove reduntant externs in rtw_xmit.h
Date: Sat, 19 Sep 2026 18:29:50 -0300
Message-ID: <20260919212950.26636-1-matheus.aalmeida@inf.ufrgs.br>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Several function declarations in rtw_xmit.h are currently done with
extern. This is not necessary, so remove the extern from them.

Signed-off-by: Matheus Alves de Almeida <matheus.aalmeida@inf.ufrgs.br>
---
 drivers/staging/rtl8723bs/include/rtw_xmit.h | 26 +++++++++++---------
 1 file changed, 14 insertions(+), 12 deletions(-)

diff --git a/drivers/staging/rtl8723bs/include/rtw_xmit.h b/drivers/staging/rtl8723bs/include/rtw_xmit.h
index 873807fcd0dd0..6ebe24392c77d 100644
--- a/drivers/staging/rtl8723bs/include/rtw_xmit.h
+++ b/drivers/staging/rtl8723bs/include/rtw_xmit.h
@@ -397,34 +397,36 @@ struct	xmit_priv {
 	spinlock_t lock_sctx;
 };
 
-extern struct xmit_frame *__rtw_alloc_cmdxmitframe(struct xmit_priv *pxmitpriv,
-		enum cmdbuf_type buf_type);
+struct xmit_frame *__rtw_alloc_cmdxmitframe(struct xmit_priv *pxmitpriv,
+					    enum cmdbuf_type buf_type);
 #define rtw_alloc_cmdxmitframe(p) __rtw_alloc_cmdxmitframe(p, CMDBUF_RSVD)
 #define rtw_alloc_bcnxmitframe(p) __rtw_alloc_cmdxmitframe(p, CMDBUF_BEACON)
 
-extern struct xmit_buf *rtw_alloc_xmitbuf_ext(struct xmit_priv *pxmitpriv);
+struct xmit_buf *rtw_alloc_xmitbuf_ext(struct xmit_priv *pxmitpriv);
 void rtw_free_xmitbuf_ext(struct xmit_priv *pxmitpriv, struct xmit_buf *pxmitbuf);
 
-extern struct xmit_buf *rtw_alloc_xmitbuf(struct xmit_priv *pxmitpriv);
+struct xmit_buf *rtw_alloc_xmitbuf(struct xmit_priv *pxmitpriv);
 void rtw_free_xmitbuf(struct xmit_priv *pxmitpriv, struct xmit_buf *pxmitbuf);
 
 void rtw_count_tx_stats(struct adapter *padapter, struct xmit_frame *pxmitframe, int sz);
-extern void rtw_update_protection(struct adapter *padapter, u8 *ie, uint ie_len);
-extern int rtw_make_wlanhdr(struct adapter *padapter, u8 *hdr, struct pkt_attrib *pattrib);
-extern s32 rtw_put_snap(u8 *data, u16 h_proto);
+void rtw_update_protection(struct adapter *padapter, u8 *ie, uint ie_len);
+int rtw_make_wlanhdr(struct adapter *padapter, u8 *hdr, struct pkt_attrib *pattrib);
+s32 rtw_put_snap(u8 *data, u16 h_proto);
 
-extern struct xmit_frame *rtw_alloc_xmitframe(struct xmit_priv *pxmitpriv);
+struct xmit_frame *rtw_alloc_xmitframe(struct xmit_priv *pxmitpriv);
 struct xmit_frame *rtw_alloc_xmitframe_ext(struct xmit_priv *pxmitpriv);
 struct xmit_frame *rtw_alloc_xmitframe_once(struct xmit_priv *pxmitpriv);
 void rtw_free_xmitframe(struct xmit_priv *pxmitpriv, struct xmit_frame *pxmitframe);
-extern void rtw_free_xmitframe_queue(struct xmit_priv *pxmitpriv, struct __queue *pframequeue);
+void rtw_free_xmitframe_queue(struct xmit_priv *pxmitpriv, struct __queue *pframequeue);
 struct tx_servq *rtw_get_sta_pending(struct adapter *padapter, struct sta_info *psta, signed int up, u8 *ac);
 int rtw_xmitframe_enqueue(struct adapter *padapter, struct xmit_frame *pxmitframe);
 
-extern u32 rtw_calculate_wlan_pkt_size_by_attribue(struct pkt_attrib *pattrib);
+u32 rtw_calculate_wlan_pkt_size_by_attribue(struct pkt_attrib *pattrib);
 #define rtw_wlan_pkt_size(f) rtw_calculate_wlan_pkt_size_by_attribue(&f->attrib)
-extern int rtw_xmitframe_coalesce(struct adapter *padapter, struct sk_buff *pkt, struct xmit_frame *pxmitframe);
-extern int rtw_mgmt_xmitframe_coalesce(struct adapter *padapter, struct sk_buff *pkt, struct xmit_frame *pxmitframe);
+int rtw_xmitframe_coalesce(struct adapter *padapter, struct sk_buff *pkt,
+			   struct xmit_frame *pxmitframe);
+int rtw_mgmt_xmitframe_coalesce(struct adapter *padapter, struct sk_buff *pkt,
+				struct xmit_frame *pxmitframe);
 s32 _rtw_init_hw_txqueue(struct hw_txqueue *phw_txqueue, u8 ac_tag);
 void _rtw_init_sta_xmit_priv(struct sta_xmit_priv *psta_xmitpriv);
 
-- 
2.43.0

