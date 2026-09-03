Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8C004DC550
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 15:34:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788449672; cv=none; b=kQ4izgnfGNiUNzKkCsoDIyS2QxXbDzER5trNwfuSw5ZC+6vA9tLKe8BWbqkBGp+vv2IM3oqzF+S5b2qdHLDZkmff0/u6W2S6rbRHo/jlKswQefCozMhlTxvkXkmfwTXxqdXhiY/+DT4r9rmifqTfIzsSLA//gWZnzIL1BKCuO2E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788449672; c=relaxed/simple;
	bh=goQu9Jgo/wzgznFj295FQUjpYm7lou0KSDavxxBHM4o=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=nhb3B5WcgjrtSvGrqIKes/nz+Bzjpvx/qtR3HNP51uVsqWT7phV48WSQnqN/7U3On5Oqc82WI01fh1I9NLGtuFXGiN4MKQAmllXACTwSpiiznoc5wIbWuUGXeWSYHtT9rDIGzMY6+zD0LrUK8VBAaABOeDDkrh5NLwb4XFei3Mk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=c5YzhmG0; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="c5YzhmG0"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4956d1d9fb2so17395e9.0
        for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 08:34:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788449669; x=1789054469; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=PkuD/BaHiKXvm0lMtMhPcQ74061Sh7KqlPSpTfAlPBU=;
        b=c5YzhmG0iCa23d24uSd6m+g6IkU1md52auNHBYMj0Kjru3WkRd3lvgm8kol+Bsc48+
         L/P0o4+EudylRbkfVEsOsYh62WyVbwv2L7T7sgOZaH/DoEtLAn1T3oS0JEfYgmLtRMNL
         A9R6tEWPcs1lwineMinWSGq6VXeg23d+w9WqUwdwviiE6julWfOWEuhJ8RTZrMKD5NQR
         6HUnzS4aezIUtLEnDj8GOTgENdCC97t2ixzOrJUlBJVLJO1RxMqMlL4y4yxvoKgXjYN9
         ay4BEDeXH3bQ2q45rUiZsaYJZR1UlDJMRHM2uEAmukKDJTzJvHRmcKrQIxsF1VIbLjsM
         ZDdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788449669; x=1789054469;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PkuD/BaHiKXvm0lMtMhPcQ74061Sh7KqlPSpTfAlPBU=;
        b=hn/PYD0LXNum6xIDsL4g+CrmZZt9+ZSJCDhvkuXP8XBTXZclmjm8D7wpH/5ElA0w5Y
         eHdH73du4IO6lPnJgG71Sa31f31p+czxC6AWKNaRHmxmzAfcTZNnQnzx6pQMZ+w3jT5o
         AciT1EazDxTNnvT+zEtTRaik7CJvP3165lOQJ6PNfDRTXtBd7YGkvkXlhtMKrn1lBWdF
         OrkQBbycclbZeRzGK4Os5LyWKwyMyalRBHok0V85K3OEnmDBbfqIt3aFGydESzP33G3m
         +eigxfJaNCEiApAE/99yVRHT8Wn8KUSaKKSD42dxtdsKpPaAXNaPV33EBGShX1lB8Gjv
         O/KA==
X-Forwarded-Encrypted: i=1; AKwUvBzN66PnIFGAKjYtoDam3NL5thm3cpX8EqFH+QEXOGG//iIFjwBHjPYsWrxIl203Zfu2o3r5tA98mtAGxy8=@vger.kernel.org
X-Gm-Message-State: AFuF++mptqvC84zFbFpf97Jc/byptcUN82up5KjUthvb1fruVjg0hpvb
	Qtb4EPPm3E7dCpcpLmjXhrJ5zX2hBMHsCI1DScCTg6yz3EkUWtSomCgX
X-Gm-Gg: AYBFou21DHlrcHSnI2eGiWFk4Ry4D8AWfhHBC4kXkmu03aGbSq4j6NXUbPY1x2+uZ3m
	9E++yZDH5qgkA/CGCWMZjmpYO32y4uXa0aQ7KKRPoEA6fLKx+vIR5BVjQYECOcixizeHBNRrq2p
	CdI63K3Lgw5DhfQJO/okGON5ZXF64yH/j5UpjV/yxw7FIO8ftX5BPXqcQnbSd4Pi0UANbikDujX
	WS+QfZ8DodW2DV0rkVK6Wx5KvE7VMcoUXqGPPn9KJALQP0tgwld1B7cSMTimnkeTCKhOLgW0iGR
	xyzwp+4CnIGJqnkp+NH1cElL+45gtP7R120xry6oZ0ufMfoYM0SLArMnRaI+J9f2RQDouPxnbua
	AaudcAwvKHqMOS3WYiuCMHQiC8qlozN3odVc+8LAmk7MMqUIyMPBpP2CaPo7mYJNCzJ5gcnpnzn
	FXEuXIQRiYnhGS2hvyPHUaM4RZGlyY7rqbXXrvvDtw3JePjCtvqES9D8B0bP0FsfyHDWWGgPfJW
	YHeUJMkGvUQ3VxYw6O6o77Cu2SJi072HX/0OfLh7SuICjkDlz4Q2W6cr70JVoK2hddQDueelrip
	e9Mu7h4ybsdj3ImBG3hyUIfZ
X-Received: by 2002:a05:600c:83c4:b0:49c:e363:c66e with SMTP id 5b1f17b1804b1-49ce580365emr105280595e9.1.1788449669019;
        Thu, 03 Sep 2026 08:34:29 -0700 (PDT)
Received: from pop-os.. (98.102.222.87.dynamic.jazztel.es. [87.222.102.98])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cee5d476esm87754845e9.1.2026.09.03.08.34.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 08:34:28 -0700 (PDT)
From: Miguel Garcia <miguelgarciaroman8@gmail.com>
To: gregkh@linuxfoundation.org
Cc: hdegoede@redhat.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] staging: rtl8723bs: remove unused phal variable
Date: Thu,  3 Sep 2026 17:34:23 +0200
Message-ID: <20260903153423.1814932-1-miguelgarciaroman8@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Removing SdioTxFIFOFreePageLock also removed the only use of phal in
rtl8723bs_init_xmit_priv(), leaving the variable set but unused.

Remove the dead declaration and assignment.

Fixes: e9b50a2821bb ("staging: rtl8723bs: remove unused spinlock 'SdioTxFIFOFreePageLock'")
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202608310749.mheatdIW-lkp@intel.com/
Signed-off-by: Miguel Garcia <miguelgarciaroman8@gmail.com>
---
 drivers/staging/rtl8723bs/hal/rtl8723bs_xmit.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/rtl8723bs_xmit.c b/drivers/staging/rtl8723bs/hal/rtl8723bs_xmit.c
index 7f55448d544e8..0441e84ea87da 100644
--- a/drivers/staging/rtl8723bs/hal/rtl8723bs_xmit.c
+++ b/drivers/staging/rtl8723bs/hal/rtl8723bs_xmit.c
@@ -525,9 +525,6 @@ s32	rtl8723bs_hal_xmitframe_enqueue(
 s32 rtl8723bs_init_xmit_priv(struct adapter *padapter)
 {
 	struct xmit_priv *xmitpriv = &padapter->xmitpriv;
-	struct hal_com_data *phal;
-
-	phal = GET_HAL_DATA(padapter);
 
 	init_completion(&xmitpriv->SdioXmitStart);
 	init_completion(&xmitpriv->SdioXmitTerminate);
-- 
2.43.0

