Received: from smtp.inf.ufrgs.br (smtp.inf.ufrgs.br [143.54.11.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 654BB4E5327
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 10:05:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=143.54.11.23
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790849131; cv=none; b=jYkdJFW6Gzz/1lKdOo1W3xYcP05kFg1uOLof8MyK/lYPdxAeiTum9YZl+1iu+FeuPglsSCKb5d/++JseerQOIaOUQH5UsSIayZez717H8fQuoXRlDh7XihOIxvjcvd+nNfKR/T2lZHVIZaX8WGNv0LPROZzV2bQjV7wgrhj4cP0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790849131; c=relaxed/simple;
	bh=DerGXAZ3spBoyOwkwpqSsc+3+sR+l//ZrsEygTFZHAY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=eR9nILIGJ1WDndbVTnpBejckSHl2j+b3Mw8DSSqhiRKztvqX2VxbqmiytvQSqC/abKuEolOZ2bcn0QcSnW348IZAyssS+4bhLrtUNsd0R5CdO+wrIEk2iRnuFOh8igpCmvO1Wzh8hp/giJTH5tkGl7CU/HSf2FiKvxDtLyYivls=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=inf.ufrgs.br; spf=pass smtp.mailfrom=inf.ufrgs.br; dkim=pass (2048-bit key) header.d=inf.ufrgs.br header.i=@inf.ufrgs.br header.b=WI9R9880; arc=none smtp.client-ip=143.54.11.23
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=inf.ufrgs.br
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=inf.ufrgs.br
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=inf.ufrgs.br header.i=@inf.ufrgs.br header.b="WI9R9880"
Received: from LAPTOP-R01LEAQM.localdomain (unknown [186.210.30.235])
	by smtp.inf.ufrgs.br (Postfix) with ESMTPSA id 9DC121210A4;
	Thu,  1 Oct 2026 07:05:16 -0300 (-03)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=inf.ufrgs.br;
	s=dkim2026; t=1790849116;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=uAuiJ21sjMSF2VoYxg9v9w9M/Ff5Oa973YahYJGLS3I=;
	b=WI9R9880TPU6j/M6iK2HDqbqeRHz8hP4whys9Yq5XEXvs3QnNyrCjHHHLZlXWcourDfaAS
	8rkMk3XOFLmbu4kRDqlDdrhwSwiLDZy9HSeXK6e1DqAksFyzL6DfwiPjiIRfOgR8IIjQ+V
	B3KmkO1yzrg5wb0qk9zUn8dp97scDJsFISyQFn9cjT2VdHxEBBtBMn6SU0+SsEwSrHRTPH
	v6gOsohZgzNvi/HbFSSJKJTTbvXlCgJHoI6yFEDCyOVurErnUSfgstSLiJg60W5CobXfjb
	hR3/1DppyshycfGvoOhqHypWQbIllekx0YCSBycWN3LUs6yI3VOgWcfgrldekg==
From: Matheus Alves de Almeida <matheus.aalmeida@inf.ufrgs.br>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Matheus Alves de Almeida <matheus.aalmeida@inf.ufrgs.br>
Subject: [PATCH v3] staging: rtl8723bs: return bool from check_pending_xmitbuf
Date: Thu,  1 Oct 2026 07:04:41 -0300
Message-ID: <20261001100441.102765-1-matheus.aalmeida@inf.ufrgs.br>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

check_pending_xmitbuf() returns only true or false. Use bool as its
return type to accurately describe the function's behavior and
propagate the return type through one of the call chains.

Signed-off-by: Matheus Alves de Almeida <matheus.aalmeida@inf.ufrgs.br>
---
v2: Add missing "staging: " prefix to commit message.
v3: Change one of the call chains to also return bool.

 drivers/staging/rtl8723bs/core/rtw_xmit.c         | 6 +++---
 drivers/staging/rtl8723bs/hal/hal_intf.c          | 2 +-
 drivers/staging/rtl8723bs/hal/rtl8723bs_xmit.c    | 2 +-
 drivers/staging/rtl8723bs/include/hal_intf.h      | 2 +-
 drivers/staging/rtl8723bs/include/rtl8723b_xmit.h | 2 +-
 drivers/staging/rtl8723bs/include/rtw_xmit.h      | 2 +-
 6 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_xmit.c b/drivers/staging/rtl8723bs/core/rtw_xmit.c
index 57b3690bc48af..78caf6f243ab5 100644
--- a/drivers/staging/rtl8723bs/core/rtw_xmit.c
+++ b/drivers/staging/rtl8723bs/core/rtw_xmit.c
@@ -2463,10 +2463,10 @@ struct xmit_buf *dequeue_pending_xmitbuf_under_survey(struct xmit_priv *pxmitpri
 	return pxmitbuf;
 }
 
-signed int check_pending_xmitbuf(struct xmit_priv *pxmitpriv)
+bool check_pending_xmitbuf(struct xmit_priv *pxmitpriv)
 {
 	struct __queue *pqueue;
-	signed int	ret = false;
+	bool ret = false;
 
 	pqueue = &pxmitpriv->pending_xmitbuf_queue;
 
@@ -2482,7 +2482,7 @@ signed int check_pending_xmitbuf(struct xmit_priv *pxmitpriv)
 
 int rtw_xmit_thread(void *context)
 {
-	s32 err;
+	bool err;
 	struct adapter *padapter;
 
 	err = _SUCCESS;
diff --git a/drivers/staging/rtl8723bs/hal/hal_intf.c b/drivers/staging/rtl8723bs/hal/hal_intf.c
index 1443875d13694..9653ab3ad893d 100644
--- a/drivers/staging/rtl8723bs/hal/hal_intf.c
+++ b/drivers/staging/rtl8723bs/hal/hal_intf.c
@@ -229,7 +229,7 @@ void beacon_timing_control(struct adapter *padapter)
 	rtl8723b_SetBeaconRelatedRegisters(padapter);
 }
 
-s32 rtw_hal_xmit_thread_handler(struct adapter *padapter)
+bool rtw_hal_xmit_thread_handler(struct adapter *padapter)
 {
 	return rtl8723bs_xmit_buf_handler(padapter);
 }
diff --git a/drivers/staging/rtl8723bs/hal/rtl8723bs_xmit.c b/drivers/staging/rtl8723bs/hal/rtl8723bs_xmit.c
index dec9d4d53de7a..eab5962a60eb2 100644
--- a/drivers/staging/rtl8723bs/hal/rtl8723bs_xmit.c
+++ b/drivers/staging/rtl8723bs/hal/rtl8723bs_xmit.c
@@ -115,7 +115,7 @@ static s32 rtl8723_dequeue_writeport(struct adapter *padapter)
  *_SUCCESS	ok
  *_FAIL		something error
  */
-s32 rtl8723bs_xmit_buf_handler(struct adapter *padapter)
+bool rtl8723bs_xmit_buf_handler(struct adapter *padapter)
 {
 	struct xmit_priv *pxmitpriv = &padapter->xmitpriv;
 	u8 queue_empty, queue_pending;
diff --git a/drivers/staging/rtl8723bs/include/hal_intf.h b/drivers/staging/rtl8723bs/include/hal_intf.h
index 7b63116525cab..763ff6f3cb535 100644
--- a/drivers/staging/rtl8723bs/include/hal_intf.h
+++ b/drivers/staging/rtl8723bs/include/hal_intf.h
@@ -222,7 +222,7 @@ void rtw_hal_set_chnl_bw(struct adapter *padapter, u8 channel, enum channel_widt
 void rtw_hal_dm_watchdog(struct adapter *padapter);
 void rtw_hal_dm_watchdog_in_lps(struct adapter *padapter);
 
-s32 rtw_hal_xmit_thread_handler(struct adapter *padapter);
+bool rtw_hal_xmit_thread_handler(struct adapter *padapter);
 
 void rtw_hal_notch_filter(struct adapter *adapter, bool enable);
 
diff --git a/drivers/staging/rtl8723bs/include/rtl8723b_xmit.h b/drivers/staging/rtl8723bs/include/rtl8723b_xmit.h
index d02ead67777a0..acf0ac9e5a755 100644
--- a/drivers/staging/rtl8723bs/include/rtl8723b_xmit.h
+++ b/drivers/staging/rtl8723bs/include/rtl8723b_xmit.h
@@ -406,7 +406,7 @@ void rtl8723bs_free_xmit_priv(struct adapter *padapter);
 s32 rtl8723bs_hal_xmit(struct adapter *padapter, struct xmit_frame *pxmitframe);
 s32 rtl8723bs_mgnt_xmit(struct adapter *padapter, struct xmit_frame *pmgntframe);
 s32	rtl8723bs_hal_xmitframe_enqueue(struct adapter *padapter, struct xmit_frame *pxmitframe);
-s32 rtl8723bs_xmit_buf_handler(struct adapter *padapter);
+bool rtl8723bs_xmit_buf_handler(struct adapter *padapter);
 int rtl8723bs_xmit_thread(void *context);
 
 u8 BWMapping_8723B(struct adapter *Adapter, struct pkt_attrib *pattrib);
diff --git a/drivers/staging/rtl8723bs/include/rtw_xmit.h b/drivers/staging/rtl8723bs/include/rtw_xmit.h
index c5cb814789d86..68fe47dcceec4 100644
--- a/drivers/staging/rtl8723bs/include/rtw_xmit.h
+++ b/drivers/staging/rtl8723bs/include/rtw_xmit.h
@@ -432,7 +432,7 @@ void enqueue_pending_xmitbuf(struct xmit_priv *pxmitpriv, struct xmit_buf *pxmit
 void enqueue_pending_xmitbuf_to_head(struct xmit_priv *pxmitpriv, struct xmit_buf *pxmitbuf);
 struct xmit_buf *dequeue_pending_xmitbuf(struct xmit_priv *pxmitpriv);
 struct xmit_buf *dequeue_pending_xmitbuf_under_survey(struct xmit_priv *pxmitpriv);
-signed int	check_pending_xmitbuf(struct xmit_priv *pxmitpriv);
+bool check_pending_xmitbuf(struct xmit_priv *pxmitpriv);
 int	rtw_xmit_thread(void *context);
 
 u32 rtw_get_ff_hwaddr(struct xmit_frame	*pxmitframe);
-- 
2.43.0

