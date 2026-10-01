Received: from mail-dy2-f41.google.com (mail-dy2-f41.google.com [74.125.229.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11C73501291
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 12:43:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790858592; cv=none; b=u0+wqZNu56i/+EFo8TQYLSUBjqK7rVbIhY1v8EaOTusCNeYtZZkpIAefTrAemIYWLHfzZLWtPeJDb3dM9g+DdAGzRxBEERSWvpPvQrRBERKIz+/WXo9rLw2XwywfuyKFO7cK2FJZ2TkYpFE20iqkxRLWpzyNRwT8Bn5HJ7aOGHM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790858592; c=relaxed/simple;
	bh=rt6ZcRAoG0leWw0cNBVbjahgnsaNWPYY+3SkGYS+apg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=JxEV0DyAdcZrEiBJLOJIJHAvvOjOkIFkL6BTpRf5gjnRmnbJvKF4GxHJ+NhflnqWUfTXMgo75DhN7mF6dzuVf6kroHFuhICOLQ6LEBfOXvF7TRLqRLXzZDnX9VV3HWUAJuspzrvYCPkVwQcGDxM2Mw7Q59htPY3a1e5LheA+9pU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Joo+rgYv; arc=none smtp.client-ip=74.125.229.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Joo+rgYv"
Received: by mail-dy2-f41.google.com with SMTP id 5a478bee46e88-34bb8b31660so1739424eec.3
        for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 05:43:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790858589; x=1791463389; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=5dwzlKPpjQST3hzuqqsiWTFX3s8Rj/ZNthU50nSHSvo=;
        b=Joo+rgYvO6qGz5/Yi2G7rJ9s8UaW7sT/MEk5eMhd1bfRAmhnRWxOLZ2gTkD4Uo+hFg
         QHRUHlg4zeOcvLN5Nq61wcKiffF994CqEi9+rT+GlQN0bazkAnt3OHoE1/BebXhNmD/7
         rYyltq0gKXcwNCfw2A1I9un7sn0roTBJTWN1lm4vY6vnCPjj6lphjx5m5O3f3HNL/zs8
         zuzqWIefxIQvbm5FaSw9tMvy8uV1uO1Dv8gdJi941KFCjC6nQfkfGIOMcrphe+qXkcao
         azLTvcW7IudhiXokesD3cbxc7fr2GZ7NaZnZbrB28whbteLNu2zxVScyCYBRWhQGxm9F
         +l+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790858589; x=1791463389;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5dwzlKPpjQST3hzuqqsiWTFX3s8Rj/ZNthU50nSHSvo=;
        b=xDq3V6DlEdNrdJGlArVjJC356ODwWONxht/RBw+CFFfPrgmjYu6Z2q6AE3XKZhmYdS
         SLAV0mBuCF+ZM4FXPdkNr9BgH1GUfaMyUEreIsEXzOngXSGObNdX3vF0/oq+RDPJsRze
         tVB5B/B51a/BOj96F12Io3JTucZ59yyw7av+Ro6UYRxO+6oA0awRf0fTvICZGFXntMAl
         u02UZhIePRj3hDsGd1XXR9mQY9/55vFxgnZqRqtJmEyNt0m1G/8CkkPNAzak4pwar3Ji
         R2xY76y5NBx0ipQ0Mi6RqQ+cdEE6tlx9cVAcLgXubKhZuaUFFRteayU45h4w1ZhLVqev
         mPaw==
X-Forwarded-Encrypted: i=1; AKwUvBwfB3fWsXw2854aGOIaRfa5Zb6Cscpepigm0wo1aFmdT0KPSdPY9cX8kq11KAlRNZG5axBPuvtGUcXoIUg=@vger.kernel.org
X-Gm-Message-State: AFq9FYJWXxBoT7OSzrMGcPqE2CTRavglz9yeJo9AOenUffUtNsbfrgvv
	fVv4lgxDGiH9ogN94XGRFr8AiDTblSrHEVcB4V5qsARotiTAgEQFifzY
X-Gm-Gg: AYBFou21NUP+pJyKrbgxNSr5Pawnz5sFyHIfeYop9c25iYhGgkzjCKkdtMYqPfTE5gm
	dFzGN5EccQqXWT9Gwt9lUX7DTCWI2OYriVvfTSNcnP7ejc1ltFm2CtD6llkFoS3K3xf57P/xsNc
	TH0zy1cbZ4kChOwkRVZufOrjPjsPnMhTnkwD0MxcM0TZetNog2R3Ln3pG6YcT/vLV7GixcQdePI
	Q+s9JFAp7VXdfpJt7W0aTadcTLGaLDeLA3eBbcs1M4e+kp5NPaI7dXOsAxLz8ByPO1LQFOZOe7c
	BSgINhBcZa2Sd8mpqc1smu/a2fxiSHAPw89fHUTt8PkLYWHAPNYugkdGR87Gzrkaj/6chCKfRa7
	PkCk+IlhEEgBVYrBOiG9kBZ8+i4ghhWDt5XCnKuI5EwgH5zdxBHnnI37Wjm8DP74DfLgi+s8qXL
	1JWL5W6DHWa8K3JMEANDYvfWS8WK34uyKik/r9/+n00HalvQnZaDkqUrrwcG5lsA+bq03Cwjt2K
	XnwSLFAMqOxiWZhQYQi4QhBPj4=
X-Received: by 2002:a05:7301:4290:b0:34c:c5e8:6dc5 with SMTP id 5a478bee46e88-34cdbfd838cmr4745293eec.12.1790858588684;
        Thu, 01 Oct 2026 05:43:08 -0700 (PDT)
Received: from localhost.localdomain ([98.148.34.5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-34db3e33b73sm7324176eec.18.2026.10.01.05.43.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 05:43:08 -0700 (PDT)
From: Hungyu Lin <dennylin0707@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Dan Carpenter <error27@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Hungyu Lin <dennylin0707@gmail.com>
Subject: [PATCH v3] staging: rtl8723bs: use errno in rtw_register_tx_alive()
Date: Thu,  1 Oct 2026 12:42:52 +0000
Message-ID: <20261001124252.7563-1-dennylin0707@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace the driver-specific _SUCCESS and _FAIL return values with
0 when TX can proceed and -EAGAIN when the firmware is not ready yet.

Handle -EAGAIN explicitly in rtl8723bs_xmit_buf_handler(). The buffers
remain queued and XMIT_ALIVE remains set so cpwm_int_hdl() can wake
the TX thread for another attempt. Return _SUCCESS in this case to
keep rtw_xmit_thread() running and waiting on xmit_comp; propagating
-EAGAIN would terminate the thread.

No functional change.

Signed-off-by: Hungyu Lin <dennylin0707@gmail.com>
---
Changes in v3:
- Handle -EAGAIN explicitly in rtl8723bs_xmit_buf_handler(), as
  suggested by Greg.
- Explain why the deferred TX case returns _SUCCESS to keep the
  transmit thread running for a later retry.

Changes in v2:
- Use the standard 0/-errno return convention instead of bool, as
  suggested by Greg.
- Return -EAGAIN when the transmit path cannot proceed yet.

 drivers/staging/rtl8723bs/core/rtw_pwrctrl.c    | 13 ++++++-------
 drivers/staging/rtl8723bs/hal/rtl8723bs_xmit.c  |  9 ++++++++-
 drivers/staging/rtl8723bs/include/rtw_pwrctrl.h |  2 +-
 3 files changed, 15 insertions(+), 9 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_pwrctrl.c b/drivers/staging/rtl8723bs/core/rtw_pwrctrl.c
index 448611ad8237..00d64b2ff89e 100644
--- a/drivers/staging/rtl8723bs/core/rtw_pwrctrl.c
+++ b/drivers/staging/rtl8723bs/core/rtw_pwrctrl.c
@@ -771,13 +771,12 @@ void rtw_unregister_task_alive(struct adapter *padapter, u32 task)
  * _SUCCESS	rtw_xmit_thread can write fifo/txcmd afterwards.
  * _FAIL		rtw_xmit_thread can not do anything.
  */
-s32 rtw_register_tx_alive(struct adapter *padapter)
+int rtw_register_tx_alive(struct adapter *padapter)
 {
-	s32 res;
+	int ret = 0;
 	struct pwrctrl_priv *pwrctrl;
 	u8 pslv;
 
-	res = _SUCCESS;
 	pwrctrl = adapter_to_pwrctl(padapter);
 	pslv = PS_STATE_S2;
 
@@ -788,7 +787,7 @@ s32 rtw_register_tx_alive(struct adapter *padapter)
 	if (pwrctrl->fw_current_in_ps_mode) {
 		if (pwrctrl->cpwm < pslv) {
 			if (pwrctrl->cpwm < PS_STATE_S2)
-				res = _FAIL;
+				ret = -EAGAIN;
 			if (pwrctrl->rpwm < pslv)
 				rtw_set_rpwm(padapter, pslv);
 		}
@@ -796,11 +795,11 @@ s32 rtw_register_tx_alive(struct adapter *padapter)
 
 	mutex_unlock(&pwrctrl->lock);
 
-	if (res == _FAIL)
+	if (ret)
 		if (pwrctrl->cpwm >= PS_STATE_S2)
-			res = _SUCCESS;
+			ret = 0;
 
-	return res;
+	return ret;
 }
 
 /*
diff --git a/drivers/staging/rtl8723bs/hal/rtl8723bs_xmit.c b/drivers/staging/rtl8723bs/hal/rtl8723bs_xmit.c
index 0441e84ea87d..47f71e3ec633 100644
--- a/drivers/staging/rtl8723bs/hal/rtl8723bs_xmit.c
+++ b/drivers/staging/rtl8723bs/hal/rtl8723bs_xmit.c
@@ -140,9 +140,16 @@ s32 rtl8723bs_xmit_buf_handler(struct adapter *padapter)
 		return _SUCCESS;
 
 	ret = rtw_register_tx_alive(padapter);
-	if (ret != _SUCCESS) {
+	if (ret == -EAGAIN) {
+		/*
+		 * Leave the buffers queued and XMIT_ALIVE registered so
+		 * cpwm_int_hdl() can wake this thread for another attempt.
+		 * Return success to keep the TX thread running.
+		 */
 		return _SUCCESS;
 	}
+	if (ret)
+		return _FAIL;
 
 	do {
 		queue_empty = rtl8723_dequeue_writeport(padapter);
diff --git a/drivers/staging/rtl8723bs/include/rtw_pwrctrl.h b/drivers/staging/rtl8723bs/include/rtw_pwrctrl.h
index 49f19b6ee329..a14da6c18201 100644
--- a/drivers/staging/rtl8723bs/include/rtw_pwrctrl.h
+++ b/drivers/staging/rtl8723bs/include/rtw_pwrctrl.h
@@ -217,7 +217,7 @@ void rtw_free_pwrctrl_priv(struct adapter *adapter);
 
 s32 rtw_register_task_alive(struct adapter *adapter, u32 task);
 void rtw_unregister_task_alive(struct adapter *adapter, u32 task);
-s32 rtw_register_tx_alive(struct adapter *padapter);
+int rtw_register_tx_alive(struct adapter *padapter);
 void rtw_unregister_tx_alive(struct adapter *padapter);
 s32 rtw_register_cmd_alive(struct adapter *padapter);
 void rtw_unregister_cmd_alive(struct adapter *padapter);
-- 
2.43.0

