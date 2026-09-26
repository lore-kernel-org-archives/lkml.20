Received: from mail-dy2-f6.google.com (mail-dy2-f6.google.com [74.125.229.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B553337AA79
	for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 11:11:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.6
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790421105; cv=none; b=Ps6r/ED8kmMUMP0SjJITbBvBv3huxL20oX60JbbABPXAC6ex3pajhGCJInDBXJesJ6tBfGNC9NhJMDYmh772Ix8EOwtBxNGgqCVCSCHLCYUsLocmFUOiOUZrhx9/Ss1IxXurDIOShqkgouyEjWiK1NJFQZKqOGBwVeP1SVwJcWk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790421105; c=relaxed/simple;
	bh=NJBQm6zagioYvPgW0XSHj8Mraan5Bc0gw6weCSNPbr8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=b4STutjsniY/ycrIZQnG6KNAxWuwiCoGdRFILwaeQlYZNW1RkBGySSYkMCth4/phzN08ybMQjNU7EOEH2rVp6Y4vp4RK9MmhhalnxuHfO03fc0ZJEhBlRXQGwG0d2rYmEcTqtG4QxdZTKEmxA1gewzNobbGU8MH4HNo7/Knn7HQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aUcse/bl; arc=none smtp.client-ip=74.125.229.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aUcse/bl"
Received: by mail-dy2-f6.google.com with SMTP id 5a478bee46e88-341c6390fdaso1446335eec.0
        for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 04:11:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790421103; x=1791025903; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=wdMjwYCO7mF7SqKO3qtA1ll+suwFYRULwWKy0mpRVLs=;
        b=aUcse/blChFhpWhpSyuASoLrmCNSF/5XH00LDvz0S477WBXzw7J08YZ8Im8FcGuyP6
         z9IgSSrKYoPkgdNpfct1zN/F/q8MkBYtuKXLep08zcwdetkH8MO+0/O5AKArt98W0qta
         fkdsrG0OosgFkfe9+QEcDK+Bb4TQQQAt+EuRynYT1Ub+GTaiF50bldYRWzJxY3L5Sp5z
         QsETmct2j+GGsmpjEgzaFnieYPK/mp7yWYURl9I0ulmJYENZAbHoZO5Jd2FLnW9LKbbv
         Auwadgem3kb/XVDg4xS7yty3WIKBdooVQLW6SKjicEqpdBkKR7+5uq+UjDrm8g7W8CW+
         uxDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790421103; x=1791025903;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wdMjwYCO7mF7SqKO3qtA1ll+suwFYRULwWKy0mpRVLs=;
        b=tM00UAzuW3IqecvXrrTes3jiGFCjMlzIARY8weTUfwYe3EHody5v5Bmra3Z7cdMTAM
         x4QzT68KcbJ7bIqiBI65N62XCp17qekh4wsaXRpKiOb5Du07GK/eBU+A1fuarWGtxx2x
         FtPE5j8RvuEhC3jjCvijTov+SzCpKFFTWHIiikU8D0cnSnM8uiTPSOTYfDLxaGeEIciV
         rjMBdxCVTG7Xh6Prr+QWfuLqf9rB/zETVFKEZX1qNe5e4w01DVxU/t8Tw1286obMY5qD
         GVfa7ToD0sI7cdr8mxs37lu+Mx7N3YgzzWvH4FLggClZ+8cQgecV0JXq9+hgBGd/Zc2U
         WZ7w==
X-Forwarded-Encrypted: i=1; AKwUvBx3FD5G0rYHOrbCX/cp97/8FPzv1HwaikueSR3t2p+oc5iq+eMvi1pUMQbeek9ITrrcpyzCfvYOgILJRbE=@vger.kernel.org
X-Gm-Message-State: AFq9FYIkTrLydLiB7rg3SMVlyl6RsXNV4lc4DRfvgC64SzMDp5KMB5r6
	7idcqc8xzvOOPQkKFT0LBlpYXSJbI1/Wu7/VCh1WQ1STLw7kNZJZ+jz8
X-Gm-Gg: AYBFou274u0SCSXozxJKrD4C5dTr1y6Y5Lwl5l3Ahhrb/mBey09AdrtL8h7LH1/4TGh
	bDSt25cS9n7BJRA2gXrA24CEXsUp31odqcvKZu+Jgb1rXWa5qUEOMkHytSmWvFUrKMIhLf2Un+u
	6I33ay/q+J1RaPTY9XQbni5oqXp2uS8Ln/F8kLhDPLdjFGUcrGMG9vH7b4BlTOy97ZSW6WJoKcN
	az9DzAFH6dpQX1Ea6WGVE/JOSrG45fVtbIJwxZeh5qK6OD/hPx783j6mYcJw8FLHHDCIeULx0ZY
	n69PqOTfxrHMuYef5rvDHtlIXtVweHqjeR4I03qvn1M9G3mLq3+cpuoes4gRGR1+cBzkdfhqWcO
	isOyKJyVitDHoa9ovByC8R5sm/OBnBYJtNvHAq2WHpMvTqTKg72b1tvoYaGWXGy2XzU6KXDIAIv
	hos8O9XK2fQs0PkrfJe/bTtz8qt+Axn7OirxuGXoGEaorHkCdl/LExXcsTekqJ2ZlVkzUm837m1
	ciksuiJHNKPqPcNG+tV9qqa7MgHRuobIRtPNg==
X-Received: by 2002:a05:7300:a987:b0:333:fe81:85dd with SMTP id 5a478bee46e88-3426fbbe744mr3803231eec.3.1790421101911;
        Sat, 26 Sep 2026 04:11:41 -0700 (PDT)
Received: from localhost.localdomain ([98.148.34.5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-34141d2fe4bsm14596365eec.4.2026.09.26.04.11.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Sep 2026 04:11:41 -0700 (PDT)
From: Hungyu Lin <dennylin0707@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Dan Carpenter <error27@gmail.com>,
	Hungyu Lin <dennylin0707@gmail.com>
Subject: [PATCH] staging: rtl8723bs: make rtw_register_tx_alive() return bool
Date: Sat, 26 Sep 2026 11:11:25 +0000
Message-ID: <20260926111125.5036-1-dennylin0707@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

rtw_register_tx_alive() only reports whether the transmit path can
continue, and its only caller treats the return value as a boolean.

Change the return type to bool and replace _SUCCESS and _FAIL with true
and false. Update the caller accordingly.

No functional change.

Signed-off-by: Hungyu Lin <dennylin0707@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_pwrctrl.c    | 12 ++++++------
 drivers/staging/rtl8723bs/hal/rtl8723bs_xmit.c  |  4 +---
 drivers/staging/rtl8723bs/include/rtw_pwrctrl.h |  2 +-
 3 files changed, 8 insertions(+), 10 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_pwrctrl.c b/drivers/staging/rtl8723bs/core/rtw_pwrctrl.c
index 448611ad8237..007ead477a51 100644
--- a/drivers/staging/rtl8723bs/core/rtw_pwrctrl.c
+++ b/drivers/staging/rtl8723bs/core/rtw_pwrctrl.c
@@ -771,13 +771,13 @@ void rtw_unregister_task_alive(struct adapter *padapter, u32 task)
  * _SUCCESS	rtw_xmit_thread can write fifo/txcmd afterwards.
  * _FAIL		rtw_xmit_thread can not do anything.
  */
-s32 rtw_register_tx_alive(struct adapter *padapter)
+bool rtw_register_tx_alive(struct adapter *padapter)
 {
-	s32 res;
+	bool res;
 	struct pwrctrl_priv *pwrctrl;
 	u8 pslv;
 
-	res = _SUCCESS;
+	res = true;
 	pwrctrl = adapter_to_pwrctl(padapter);
 	pslv = PS_STATE_S2;
 
@@ -788,7 +788,7 @@ s32 rtw_register_tx_alive(struct adapter *padapter)
 	if (pwrctrl->fw_current_in_ps_mode) {
 		if (pwrctrl->cpwm < pslv) {
 			if (pwrctrl->cpwm < PS_STATE_S2)
-				res = _FAIL;
+				res = false;
 			if (pwrctrl->rpwm < pslv)
 				rtw_set_rpwm(padapter, pslv);
 		}
@@ -796,9 +796,9 @@ s32 rtw_register_tx_alive(struct adapter *padapter)
 
 	mutex_unlock(&pwrctrl->lock);
 
-	if (res == _FAIL)
+	if (!res)
 		if (pwrctrl->cpwm >= PS_STATE_S2)
-			res = _SUCCESS;
+			res = true;
 
 	return res;
 }
diff --git a/drivers/staging/rtl8723bs/hal/rtl8723bs_xmit.c b/drivers/staging/rtl8723bs/hal/rtl8723bs_xmit.c
index 0441e84ea87d..e4d216924262 100644
--- a/drivers/staging/rtl8723bs/hal/rtl8723bs_xmit.c
+++ b/drivers/staging/rtl8723bs/hal/rtl8723bs_xmit.c
@@ -139,10 +139,8 @@ s32 rtl8723bs_xmit_buf_handler(struct adapter *padapter)
 	if (!queue_pending)
 		return _SUCCESS;
 
-	ret = rtw_register_tx_alive(padapter);
-	if (ret != _SUCCESS) {
+	if (!rtw_register_tx_alive(padapter))
 		return _SUCCESS;
-	}
 
 	do {
 		queue_empty = rtl8723_dequeue_writeport(padapter);
diff --git a/drivers/staging/rtl8723bs/include/rtw_pwrctrl.h b/drivers/staging/rtl8723bs/include/rtw_pwrctrl.h
index 49f19b6ee329..1605d32c8bf8 100644
--- a/drivers/staging/rtl8723bs/include/rtw_pwrctrl.h
+++ b/drivers/staging/rtl8723bs/include/rtw_pwrctrl.h
@@ -217,7 +217,7 @@ void rtw_free_pwrctrl_priv(struct adapter *adapter);
 
 s32 rtw_register_task_alive(struct adapter *adapter, u32 task);
 void rtw_unregister_task_alive(struct adapter *adapter, u32 task);
-s32 rtw_register_tx_alive(struct adapter *padapter);
+bool rtw_register_tx_alive(struct adapter *padapter);
 void rtw_unregister_tx_alive(struct adapter *padapter);
 s32 rtw_register_cmd_alive(struct adapter *padapter);
 void rtw_unregister_cmd_alive(struct adapter *padapter);
-- 
2.43.0

