Received: from mail-pj2-f43.google.com (mail-pj2-f43.google.com [74.125.227.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9549386C18
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 15:16:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790262984; cv=none; b=taHotC/SCX7ymsFZHyZorbRUFyepF6W6iQ6AlZuSSzvRzexlQ/JH+5J4CBPuWxsQ8bBh6z06Jb0p8D1qHwoY9GK0NITmK+XLr6CvNmgiMm1ldg/qvKN3kxk8680VRbUIrah1RyLbS9rWm4ii8+OJx3BzqOKy7yrYIxIJ9a+zrH0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790262984; c=relaxed/simple;
	bh=sSDsbyo3U7X/rk8CC4bA7N4TkoHw6sZDVq3p830+v+g=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=qd2ijxIMpqsQKxmCSAsTRcGOXanxVCZrYnH+LxtrcgDvN0i+O2nR13b18SkZRl3UnvUzMI1loQvtzJTmCiB+b4xg2k0wNB9HscIaHiqT2/35JWhDjtDcNjCP83dazvCqj/rkMMKAnQtgNnvymoLca8HQGcx8PyO+oYCykHUWpIs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QKUF3D8d; arc=none smtp.client-ip=74.125.227.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QKUF3D8d"
Received: by mail-pj2-f43.google.com with SMTP id 98e67ed59e1d1-396cccbba91so1151803a91.1
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 08:16:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790262982; x=1790867782; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=inAXO/fQBA9wM1TfaIutqtVZU1aIPtXVqWMiUQgtv7w=;
        b=QKUF3D8dLUiEN4Jn8BNn6PODTalfN2jf1UgAA94SgXClg7GlyKhN8jI6XHWKt1G9pI
         8NmNiPkINUpYouPDqGlAK3bR/fEqD4+/J/n4AITbO7cf3Ks481IFRoZ2X6yGJEDzEVri
         u/zs8duV2jRFodbaI/7bKa3dW03rFuauffDwS3BWNAD5ACQ5wZBOorSUkosRWb+rXGFD
         vffluIX0kjt8P7COUsOYzeRdrVXhgO1lf9Ua005yRZ4LsCcN8P/Q95RA+RrP7U3QSYDF
         hQrF1Ly334TwNk+auMB66PFMfrjbDugzGJ6NLTjc9ajFI1hDnYlE1t7GksGaDevqR3uF
         CuCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790262982; x=1790867782;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=inAXO/fQBA9wM1TfaIutqtVZU1aIPtXVqWMiUQgtv7w=;
        b=YOJ82yGE6hk0rLS+lJt7o0vXFQ5ITPgWKeHeMPPBlTIxZKIdKvn2lIV9e08jDY7itA
         XbQnUhVN88WTlJ/84OfBAopJ3A04761qpGV2vm4MvnytyFXOrLGqfVvpY1QGKlZxFgm4
         lDDO+oFGJDELnTHJEa2YWXiQ3YD7ODL9CpAOdRZ79oy9dF/Xo9x/bGfnsnYlQXL98jrn
         +dN7CzwTSXnzcyMA0mJxW1KmRnHPynetv0aTviKy5Bsj6LKzMQLbYMIr07qwSibkCXZ/
         jlVFQhIZrReZvlLQ2YPO8tsghGQvggKiM0j+qW6HLmE4hoMO55AjxkqgQ4eZqAlCv5bf
         BbCg==
X-Forwarded-Encrypted: i=1; AKwUvBzSPbXttKshFofktGuLmyu5CMLZ3HD1gThlFE5BvGq2Hy9XIVINtB2ciYUKo+ssDJyXPRQHBJ3Dkqw1uCE=@vger.kernel.org
X-Gm-Message-State: AFuF++kIf8Jnp9RYZbaRMfVk7hwwTLvwB1d94+DUK2lDokW8Gz87o4wZ
	wFyrkS9mQN9Ea+Gahr7qc8o80q3mJ2Bi5jKRQbdZGZ1K9MuFctxh7qt2
X-Gm-Gg: AYBFou2G4kEuKk1EYDFbH3usXKIN2lVo+iarFwYZEi5BBAsedmna0wCrwduqQ7AviW+
	EMvu/qPk9H/VAMvnJx+sh76WMV/NaCLORZ3Ac3ADnvEZ9WkR66Nh2L4XpA39/ADk6QT/00hxihw
	J4kQK+GpX34J4kJzyI5rB6r+KT5WedxGSKNwr0VWXl3A2Vuzua1b7cWZW5/9Q9Pk7ZFnFcuWUfN
	M0gBD5TxjaJSc+iF8pneAK3e9sdkSvVZcTztZn782h80TSNrvwwnbFOalnF9ss6HhN1maB06l6S
	nCNZj/voCUbJF5eTRm0jcA70LTV8mixVxtLw2zfT3pfXWgFVOyvDsSp7uZE9t1MLdVYTqsLQ9L1
	ysSpLylg/4GcYnraUcC0NB1B0PZYpj9/sP9P5j/QMe6ZnMex+APzgcKwYdYqhyPxo7qHb13B7m/
	k9p/MsYGvQCeIfM2N+sIN0k0TLkTyx4oWQjf1YwzI0hZkj3IvoCePomZnt9q1bXYNNQFB/FMAt0
	E5w9yPqMkEI91qHTgx6c2boIg==
X-Received: by 2002:a17:90b:4c0b:b0:39e:34d6:7eb5 with SMTP id 98e67ed59e1d1-3a098570e66mr2653799a91.9.1790262981988;
        Thu, 24 Sep 2026 08:16:21 -0700 (PDT)
Received: from localhost.localdomain ([223.167.219.30])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc75f3d6954sm2844459a12.16.2026.09.24.08.16.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 08:16:21 -0700 (PDT)
From: "Eric LI (Honggang)" <eric.lee0305@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Hungyu Lin <dennylin0707@gmail.com>,
	Andrei Khomenkov <khomenkov@mailbox.org>,
	Khushal Chitturi <khushalchitturi@gmail.com>,
	Ethan Tidmore <ethantidmore06@gmail.com>,
	Oskar Ray-Frayssinet <rayfraytech@gmail.com>,
	SeungJu Cheon <suunj1331@gmail.com>,
	Dalvin-Ehinoma Noah Aiguobas <fliegbert2@gmail.com>,
	Jennifer Guo <guojy.bj@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] staging: rtl8723bs: refactor xmit_xmitframe
Date: Thu, 24 Sep 2026 23:16:06 +0800
Message-Id: <20260924151606.333467-1-eric.lee0305@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Refactor the function xmit_xmitframe in rtl8723bs_xmit.c to
reduce the leading tabs

Signed-off-by: Eric LI (Honggang) <eric.lee0305@gmail.com>
---
 .../staging/rtl8723bs/hal/rtl8723bs_xmit.c    | 43 ++++++++++---------
 1 file changed, 22 insertions(+), 21 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/rtl8723bs_xmit.c b/drivers/staging/rtl8723bs/hal/rtl8723bs_xmit.c
index 7f55448d544e..46895b05538d 100644
--- a/drivers/staging/rtl8723bs/hal/rtl8723bs_xmit.c
+++ b/drivers/staging/rtl8723bs/hal/rtl8723bs_xmit.c
@@ -231,29 +231,30 @@ static s32 xmit_xmitframes(struct adapter *padapter, struct xmit_priv *pxmitpriv
 
 				/*  check xmit_buf size enough or not */
 				txlen = txdesc_size + rtw_wlan_pkt_size(pxmitframe);
-				if (!pxmitbuf ||
-					((_RND(pxmitbuf->len, 8) + txlen) > max_xmit_len) ||
-					(k >= (rtw_hal_sdio_max_txoqt_free_space(padapter) - 1))
+				if (pxmitbuf &&
+				    (((_RND(pxmitbuf->len, 8) + txlen) > max_xmit_len) ||
+				     (k >= (rtw_hal_sdio_max_txoqt_free_space(padapter) - 1)))
 				) {
-					if (pxmitbuf) {
-						/* pxmitbuf->priv_data will be NULL, and will crash here */
-						if (pxmitbuf->len > 0 &&
-						    pxmitbuf->priv_data) {
-							struct xmit_frame *pframe;
-
-							pframe = (struct xmit_frame *)pxmitbuf->priv_data;
-							pframe->agg_num = k;
-							pxmitbuf->agg_num = k;
-							rtl8723b_update_txdesc(pframe, pframe->buf_addr);
-							rtw_free_xmitframe(pxmitpriv, pframe);
-							pxmitbuf->priv_data = NULL;
-							enqueue_pending_xmitbuf(pxmitpriv, pxmitbuf);
-							/* can not yield under lock */
-							/* yield(); */
-						} else
-							rtw_free_xmitbuf(pxmitpriv, pxmitbuf);
-					}
+					if (pxmitbuf->len > 0 &&
+					    pxmitbuf->priv_data) {
+						struct xmit_frame *pframe;
+
+						pframe = (struct xmit_frame *)pxmitbuf->priv_data;
+						pframe->agg_num = k;
+						pxmitbuf->agg_num = k;
+						rtl8723b_update_txdesc(pframe, pframe->buf_addr);
+						rtw_free_xmitframe(pxmitpriv, pframe);
+						pxmitbuf->priv_data = NULL;
+						enqueue_pending_xmitbuf(pxmitpriv, pxmitbuf);
+						/* can not yield under lock */
+						/* yield(); */
+					} else
+						rtw_free_xmitbuf(pxmitpriv, pxmitbuf);
+
+					pxmitbuf = NULL;
+				}
 
+				if (!pxmitbuf) {
 					pxmitbuf = rtw_alloc_xmitbuf(pxmitpriv);
 					if (!pxmitbuf) {
 						err = -2;
-- 
2.34.1

