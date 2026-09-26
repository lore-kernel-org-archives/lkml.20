Received: from mail-dy2-f8.google.com (mail-dy2-f8.google.com [74.125.229.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF90A34E74D
	for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 10:58:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790420328; cv=none; b=MAhd5kjQ65Kga6djOrBSvMwvq12vA3Zco9uGRimp+t1K8kJQvgAGLSX87pcWNWV687uBMFOSxbXQfYJu5d0xxfSYtEfG3T7NQnJ0WgCPi3Rnn1GBdV7pSlvKvxs8JlDZcoX5wDJe/KjAjpqKMBgtY54RiGLHEk+gu/jGOozKFLE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790420328; c=relaxed/simple;
	bh=f/JwWtvuPAULYcvOayIamhEEmNq1wE5KUJU0GTr9H94=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=KlTARzhCOtMr/EI8M5/o4CKW5sUnWbseVwWu0novRoxVU4obhqLS2ZOR7Bw1P3+j3b2uHM8sEJfmUlXRZxqwEDl+NeoMvQqTCzhZ4TCVl5KRKnLe94u/XXhPLyL+oBJ89U6c6bcK/IDmq4APonJGhp4QXH3qFXG1Lw3uL34Lo5Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GB4q2XcY; arc=none smtp.client-ip=74.125.229.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GB4q2XcY"
Received: by mail-dy2-f8.google.com with SMTP id 5a478bee46e88-342d720df34so395524eec.0
        for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 03:58:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790420326; x=1791025126; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Fd81XWpJncxZy0/jTiwKWSYGl8WWZuXxmAmM1ok50DE=;
        b=GB4q2XcYsEAOtAw8p3POkAUYODmzITosRDLtGy+zSkl1jpc1iSUrlzSg9XyUGCKcQw
         GwM+tViHR2CCiqWDzjKetenz64DaLMFJKZ3bou4KnpDJVfEWy3grLfSXwtmx+3Etalox
         8YkzeyKTTW0DVZcV7F8r/8GFSYgKqEuy3fg4gvGF0OI6fc4qNkxNTre27t7c738FwmQY
         F5grM2TLGQWKS4bTlM+9aHH5nmIgbHn5lCnNydMa7m8BlxNERhyoYg7cpff+UwMRbx0Z
         PFjyGQ4DsyMtLkzcXSeEEmqHzs5ykcCREkkbeiMlgdDQkKL21QCFSkcM5kU2hILzpuQT
         V9BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790420326; x=1791025126;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Fd81XWpJncxZy0/jTiwKWSYGl8WWZuXxmAmM1ok50DE=;
        b=jNcyYeIuNpbUP2jwYj9whyWYHkOeucOa4ktE2QrtxYJYg8R/Mg+jepFJLR1Fqb7eWq
         2KzFq810uflzjBbftv/dBIv0N+/y/dbBH+d/pRIYKzOfFp6gaYmj5/V3zek3wwTiqzP9
         2IqTlS4xtPG23erasClJFyZcIRLJx+qO7n7yJluJfdDT/yxicSrB/NA72sCLdHkxlG/R
         4VdKGCyFqUBPjnGCWRY0DbrqcpjIhN7rOIOC/qzExPH8iVOBJFS+LxKXf/dqG1oHBPms
         6/MXrHdYRv4TsA6QupQf7BfSg0PKnqwhZdh6F54Q/foz+jd9t7hdy3TSgzKC/W/a0WO2
         bBng==
X-Forwarded-Encrypted: i=1; AKwUvBwNb+SVPJ7jzk3kg4grwrOuzi5fqesteg7F+agfpZcaFuzzur1UeB0KMG+BoD3ygWgeIx5c4YjyHOM5Hhk=@vger.kernel.org
X-Gm-Message-State: AFq9FYJtoc2yD4te7cVS7jKTHx3eaZvl+iO8eWhp65xOyGcJl+eGorTJ
	IDqDp7n/YveAWGt5Lrc761s7V9QlWJbPBP7OmknBM+aO2SPrDCbWLEsLNpixGfrEepo=
X-Gm-Gg: AYBFou1s1oT1NfJ1J0UcdgGhh9Pw003ExJgikcJ8Gt8jPBihP2e9lpvf41J4j1SfAJ8
	cEHr0Z91iAhU5tiUqjJH4xPGNAbKkgpybb/jjsxSbZgKnHhLeAAzVw7LZZhdKEMt4/6wCg9aZR6
	J7R0Cwmi5sVk15Y5WlQaDtJJsSsK12dIaMAW7u6dd7UyZfAbjI+k8rb7jKxclfiNeyGm9bkiPE9
	tGh09u5K19ErUybUHcMQqnPtZgo9EHB+TXTGGEah+TnKWAcEGY4TRjDZNgjP9wtYu9jSk6kSVRb
	xSFWUlQMzpJq38D1lOF5ho/qy/r2ywlTNsq0yaDtViHNp4J3ECaDpFDFrPcOflHdEj25tRHtJAs
	jhOxHzoGFJbuF7V3YahAEAQdZcWFe9cqNXCQbOO+UL6tpdPqfs41k187Tqy/6Tyh7/dV09Opfrz
	IJOWQ3cVTy3WNxsreWKHg4REd1w0FReC6dvHcQAFyu02YGyvzacLGauD2/DtoJmosgk7AV5Isuz
	7I84q3B36d2XJmfD1mtp9T8dF0=
X-Received: by 2002:a05:7300:c88:b0:33c:e91:271b with SMTP id 5a478bee46e88-34273347562mr4014161eec.36.1790420325853;
        Sat, 26 Sep 2026 03:58:45 -0700 (PDT)
Received: from localhost.localdomain ([98.148.34.5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-343539989casm4458982eec.14.2026.09.26.03.58.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Sep 2026 03:58:45 -0700 (PDT)
From: Hungyu Lin <dennylin0707@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Dan Carpenter <error27@gmail.com>,
	Hungyu Lin <dennylin0707@gmail.com>
Subject: [PATCH] staging: rtl8723bs: make rtl8723_dequeue_writeport() return bool
Date: Sat, 26 Sep 2026 10:58:27 +0000
Message-ID: <20260926105827.3760-1-dennylin0707@gmail.com>
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

