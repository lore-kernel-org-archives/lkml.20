Received: from smtp.inf.ufrgs.br (smtp.inf.ufrgs.br [143.54.11.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CE3845C704
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 14:07:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=143.54.11.23
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790863647; cv=none; b=qidA8pE6vXQ4V1CmxTI0b1eG0u0IfvvDAmBds24z/1cZIEgqlitsBkrXdUKR5izLhCNon5MTnFtNtyFp4Exz69N+5GOaKZ32bv4qoTzobjHop/WXwGOzJPYRKVC5PxCHPVdL2kMejicxTqKhM0P15MCYAJ0GF2qnwNiWJaXvEEI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790863647; c=relaxed/simple;
	bh=OFjwM0+unV/WDl3M7TKvuY4YhvRhVl3+z8p2gEpH3Hc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=iIMGr3emZbnKCT6UTTKss7sIhxHnGV4J0V8OFUCnS+nL16jrYS5tmKlds6J4Z2d0Tz0fGDSNZCDaS1Sda2tUSd7vf7DjQinq9Kw3eg2+efVR/5dk2TelTJzWYorknJxkngBsH9CN1/IO+odt0KpabB249hDBTqltjgpUap1xEpI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=inf.ufrgs.br; spf=pass smtp.mailfrom=inf.ufrgs.br; dkim=pass (2048-bit key) header.d=inf.ufrgs.br header.i=@inf.ufrgs.br header.b=udtHAzpX; arc=none smtp.client-ip=143.54.11.23
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=inf.ufrgs.br
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=inf.ufrgs.br
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=inf.ufrgs.br header.i=@inf.ufrgs.br header.b="udtHAzpX"
Received: from LAPTOP-R01LEAQM.localdomain (unknown [186.210.30.235])
	by smtp.inf.ufrgs.br (Postfix) with ESMTPSA id C0F351210F3;
	Thu,  1 Oct 2026 11:07:18 -0300 (-03)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=inf.ufrgs.br;
	s=dkim2026; t=1790863639;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=EzYEfSTqwj4l3/1vCnWUrEThLH48cqyyvXXOmKbk34M=;
	b=udtHAzpX8MikBYBAgqECXWIiXtz4FO2DCUBv1nzl15fON6sadgk9Ru08JFBdn1i9E7sNfQ
	anGn3YZy9d5M0Htny0cfo4K2UV34sv+VzFfFyxsaXS80F88o9KC4+AVmTVmvxx6QHMwmdW
	Ri4Q3lG/la7x9BtlNn/G1gyCn5XDApJJhp0RLNwQ/wBYokmS5d+Yn4POw8WeAVpghemSYI
	JMW2/fpgj1mBLQTQZZiCdqaf8iJtYpjhD/wbqolVoK+eCuXmWYiBGWLyH2QAmRp2zNxvvG
	vrWVPf6R8czbAvE7mZMPCG4/eucGStCvbHaQnNgrM9uGLyT3Zkus+qb1A4JoUQ==
From: Matheus Alves de Almeida <matheus.aalmeida@inf.ufrgs.br>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Dan Carpenter <error27@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Matheus Alves de Almeida <matheus.aalmeida@inf.ufrgs.br>
Subject: [PATCH v4] staging: rtl8723bs: return bool from check_pending_xmitbuf
Date: Thu,  1 Oct 2026 11:06:40 -0300
Message-ID: <20261001140640.107536-1-matheus.aalmeida@inf.ufrgs.br>
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
v4:
    - rtw_transmit_thread(): rename err -> xmit_status and remove
      unnescessary initialization.
    - check_pending_xmitbuf(): rename ret -> xmitbuf_pending and remove
      unnescessary if statement.
    - rtl8723bs_xmit_buf_handler(): remove queue_pending and directly
      check the value returned by check_pending_xmitbuf() instead.

 drivers/staging/rtl8723bs/core/rtw_xmit.c        | 16 +++++++---------
 drivers/staging/rtl8723bs/hal/hal_intf.c         |  2 +-
 drivers/staging/rtl8723bs/hal/rtl8723bs_xmit.c   |  8 +++-----
 drivers/staging/rtl8723bs/include/hal_intf.h     |  2 +-
 .../staging/rtl8723bs/include/rtl8723b_xmit.h    |  2 +-
 drivers/staging/rtl8723bs/include/rtw_xmit.h     |  2 +-
 6 files changed, 14 insertions(+), 18 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_xmit.c b/drivers/staging/rtl8723bs/core/rtw_xmit.c
index 57b3690bc48af..513a4934ab599 100644
--- a/drivers/staging/rtl8723bs/core/rtw_xmit.c
+++ b/drivers/staging/rtl8723bs/core/rtw_xmit.c
@@ -2463,37 +2463,35 @@ struct xmit_buf *dequeue_pending_xmitbuf_under_survey(struct xmit_priv *pxmitpri
 	return pxmitbuf;
 }
 
-signed int check_pending_xmitbuf(struct xmit_priv *pxmitpriv)
+bool check_pending_xmitbuf(struct xmit_priv *pxmitpriv)
 {
 	struct __queue *pqueue;
-	signed int	ret = false;
+	bool xmitbuf_pending;
 
 	pqueue = &pxmitpriv->pending_xmitbuf_queue;
 
 	spin_lock_bh(&pqueue->lock);
 
-	if (!list_empty(&pqueue->queue))
-		ret = true;
+	xmitbuf_pending = !list_empty(&pqueue->queue);
 
 	spin_unlock_bh(&pqueue->lock);
 
-	return ret;
+	return xmitbuf_pending;
 }
 
 int rtw_xmit_thread(void *context)
 {
-	s32 err;
+	bool xmit_status;
 	struct adapter *padapter;
 
-	err = _SUCCESS;
 	padapter = context;
 
 	allow_signal(SIGTERM);
 
 	do {
-		err = rtw_hal_xmit_thread_handler(padapter);
+		xmit_status  = rtw_hal_xmit_thread_handler(padapter);
 		flush_signals_thread();
-	} while (err == _SUCCESS);
+	} while (xmit_status == _SUCCESS);
 
 	complete(&padapter->xmitpriv.terminate_xmitthread_comp);
 
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
index dec9d4d53de7a..2918a8e50f3d6 100644
--- a/drivers/staging/rtl8723bs/hal/rtl8723bs_xmit.c
+++ b/drivers/staging/rtl8723bs/hal/rtl8723bs_xmit.c
@@ -115,10 +115,10 @@ static s32 rtl8723_dequeue_writeport(struct adapter *padapter)
  *_SUCCESS	ok
  *_FAIL		something error
  */
-s32 rtl8723bs_xmit_buf_handler(struct adapter *padapter)
+bool rtl8723bs_xmit_buf_handler(struct adapter *padapter)
 {
 	struct xmit_priv *pxmitpriv = &padapter->xmitpriv;
-	u8 queue_empty, queue_pending;
+	u8 queue_empty;
 	s32 ret;
 
 	if (wait_for_completion_interruptible(&pxmitpriv->xmit_comp)) {
@@ -131,9 +131,7 @@ s32 rtl8723bs_xmit_buf_handler(struct adapter *padapter)
 	if (ret)
 		return _FAIL;
 
-	queue_pending = check_pending_xmitbuf(pxmitpriv);
-
-	if (!queue_pending)
+	if (!check_pending_xmitbuf(pxmitpriv))
 		return _SUCCESS;
 
 	ret = rtw_register_tx_alive(padapter);
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

