Received: from mail-dy2-f8.google.com (mail-dy2-f8.google.com [74.125.229.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97DBE28690
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 11:24:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790853849; cv=none; b=JOA8Dw8S8vOAfVG3QmBK8R72vsqnsH3WPw4fmQMClYe+QSIEyYkJRx5anLXYHX5dSIbKD5bZTwKwQroiUlQhToDNcX+byxJJlfuaXaOXsdd5bfC6CrMPsxQp5GsobtfkWSSC9zJ9gX3YsrRq+KWgTMJ0ZYx7kRFx2k8ji8E/LLQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790853849; c=relaxed/simple;
	bh=kqq4iv2tJbpksVSZakY28B9D5QWU3TABTw5r7AJsPBw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=EPsoagSmo2dsTngZuWuEM89birTfssN52QsqzlwF89ZklDn/n0g0XsGxQca8jASYB+ybLj6FWMOQMl9N5e5O87qOFsn3BG/6dpJ3wVolTbUU8fz8I4uuadfobtPgFB+5YYWM4PnkkG69OeOVjNIb/+ABiTLVzjIsg3BoWYBbDlg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ApjNEE9u; arc=none smtp.client-ip=74.125.229.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ApjNEE9u"
Received: by mail-dy2-f8.google.com with SMTP id 5a478bee46e88-34b2df0dd39so2655575eec.0
        for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 04:24:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790853847; x=1791458647; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=9pJKS2CPEX9rrrq+8z8dCJOBpbOCAF4va+FsiogZmcw=;
        b=ApjNEE9uuJ+15dlHChXXtTU0R/AIKff1hDTyIPYXhEKLj1kDHZptEAaf3pO7O0NpNu
         X66ByiflX98UQXuJX9lnBMYpMiNbnh8xrArHLn8J6Deahb0WL/sTjBLzoDse/iErBLXN
         uUP9u9sp/8n8PWPekdHpDyG335mu5xukhm6KzpOhiHafMRekcODNgxj5x9p/xSZ2uJW3
         ThOfEKokYuC91hSSeY5GIFhKlhODrm31dAib4G5DHbDbqC/pqaJCKBm539u00R/ilia1
         oanDHSo77jl2VWtgpGvK9nTPT1G1Pyv8+JYhauSlwhlp0Uj6z9UZVirDSnfDOVrK9mwT
         H6DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790853847; x=1791458647;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9pJKS2CPEX9rrrq+8z8dCJOBpbOCAF4va+FsiogZmcw=;
        b=x248579keZRf8XjeLrfEIp6P968NXHQ+TJW9axfD2Lt8dL+Rl+hTkdkSA7J7j/BvB9
         LEM/CDnL7UwkXtAHXg7Utj8yuTO06Pr89MJns8Hq0SIbbMS0XJAGl6x4rZhCaD/Axhfk
         ATs/GXsLUhhploBGbEiOpw4QLnt9tIChjGpM3JvWm+7/xxcQHuxfdR66rwDNCQiSfFdq
         y2QnLrItrxevc+DfYesaU67xj5MkOerPAdz8POK8CIB1SbAHPZEXmW1l9LzCOrrXoeD6
         +ssNCFiCHwn/pEu4fUpSZT0ngJWmTWdaM6FKeDLayz2rJppnTsvLAKGSAwybgzAOWa0q
         rSQw==
X-Forwarded-Encrypted: i=1; AKwUvBw9tHSJiWLvU58ifMhW4tp5rb4tTYurVLO0DhDlNDJ5DlS1ZXzCj5T1OfCrQwyrx238CuAmc90Qj0M3yMI=@vger.kernel.org
X-Gm-Message-State: AFq9FYJesaVE+uNIH9ydesUsIHU0rE/8Yi093IgnkX0vuaHgumozPAgS
	tpr4aC4CuKVrTcRqyLBKMbO2Qqmm9991H8nlzp7XXZ6WkFMnh8P5NYBD
X-Gm-Gg: AYBFou1uu+k0DLZPPrlPnPd6emlrw86o/I2D6YsFpSAfiCZlkrfW5BreOdRLJxTM8sd
	nTuFbi5gAdsFKQkjNrsxwEDyzMgLgT9soy7N3Ao5kztf7zNPQKv3Myyg1U1uc1xbSzEDhkYIAk7
	XYkHe0r1K8lzVe4FgEMmtuqLQs/kriSlb2cD89bci7FTQoC/t7NaHwm+Jr0hXOH5x+Be7sqHCqu
	z2dwkFbgGtNuRVp4QUbDeoVGL076EqXIMrczB6jyAUGuYNbV3tPQWqmyNHkBA827gv/qNkuY2RA
	IecKkBE/W7ZCRVpbwe1cSx+tX35GgOJ2K+tPeUFAmgTWijImPHndsWRLlea55nfnNy0TmnLFIQn
	JEtdZRdTqfon5NyZGTQo0W3b1XoS/c9vSvClgWd5LpnXTvKyldfxBoJs5QF/MJMquqwb5j9WOVt
	6Q7+l806TgwD/LQSj7ETRyfDgH+TbDFBqRsjaYGKsrQZ3r/6lgJGPbvd8HewiS/GIFxmGZ4l9rJ
	hW+rpz1YBQEDHx8TOgI/G1WPMyqNn3sgVddww==
X-Received: by 2002:a05:7301:4b12:b0:34c:85c:da56 with SMTP id 5a478bee46e88-34cdc1ce152mr4987298eec.17.1790853847277;
        Thu, 01 Oct 2026 04:24:07 -0700 (PDT)
Received: from localhost.localdomain ([98.148.34.5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-34db3162a00sm7052128eec.10.2026.10.01.04.24.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 04:24:06 -0700 (PDT)
From: Hungyu Lin <dennylin0707@gmail.com>
To: gregkh@linuxfoundation.org
Cc: error27@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Hungyu Lin <dennylin0707@gmail.com>
Subject: [PATCH v2] staging: rtl8723bs: make rtl8723_dequeue_writeport() return bool
Date: Thu,  1 Oct 2026 11:23:51 +0000
Message-ID: <20261001112351.6820-1-dennylin0707@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

rtl8723_dequeue_writeport() returns boolean state and its caller uses the
return value as a boolean.

Change the return type to bool and replace _FAIL with false. Also use bool
for the caller's queue_empty variable.

No functional change.

Signed-off-by: Hungyu Lin <dennylin0707@gmail.com>
---
Changes in v2:
- Resend as requested; no code changes.

 drivers/staging/rtl8723bs/hal/rtl8723bs_xmit.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/rtl8723bs_xmit.c b/drivers/staging/rtl8723bs/hal/rtl8723bs_xmit.c
index 0441e84ea87d..482dd1baf3ca 100644
--- a/drivers/staging/rtl8723bs/hal/rtl8723bs_xmit.c
+++ b/drivers/staging/rtl8723bs/hal/rtl8723bs_xmit.c
@@ -33,7 +33,7 @@ static u8 rtw_sdio_wait_enough_TxOQT_space(struct adapter *padapter, u8 agg_num)
 	return true;
 }
 
-static s32 rtl8723_dequeue_writeport(struct adapter *padapter)
+static bool rtl8723_dequeue_writeport(struct adapter *padapter)
 {
 	struct mlme_priv *pmlmepriv = &padapter->mlmepriv;
 	struct xmit_priv *pxmitpriv = &padapter->xmitpriv;
@@ -107,7 +107,7 @@ static s32 rtl8723_dequeue_writeport(struct adapter *padapter)
 	/* pxmitbuf->priv_data = NULL; */
 	rtw_free_xmitbuf(pxmitpriv, pxmitbuf);
 
-	return _FAIL;
+	return false;
 }
 
 /*
@@ -121,7 +121,8 @@ static s32 rtl8723_dequeue_writeport(struct adapter *padapter)
 s32 rtl8723bs_xmit_buf_handler(struct adapter *padapter)
 {
 	struct xmit_priv *pxmitpriv = &padapter->xmitpriv;
-	u8 queue_empty, queue_pending;
+	bool queue_empty;
+	u8 queue_pending;
 	s32 ret;
 
 	if (wait_for_completion_interruptible(&pxmitpriv->xmit_comp)) {
-- 
2.43.0

