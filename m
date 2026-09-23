Received: from mail-pj2-f43.google.com (mail-pj2-f43.google.com [74.125.227.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2358B379993
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 16:17:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790180224; cv=none; b=Us2w/Vf6H48yNld/Jkx+aPi+3+BWFuQ2qOwUxZHLMj0e9dx8mXGxvvOmQycjMMc22/bPEts61m4x0O0/l+W+6wkHIo6GIWioa28X63rxlp72E4jjbB/qok0CS8mWCYgc8YxVAUrBplBq5/8iqUyfbZrHBrVW4rYsDtWELWybnP4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790180224; c=relaxed/simple;
	bh=O2H1JqE5eKhA4nle7+NJGPZcT/lhXou48K8NVRXwhcw=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=L/qEGLXPdoKdY/qxT/+rJr3Yn4sIpUInMHmu9Zd3JJrimjS9UBuqPllxPGd8RmFMFEpsKM8p+4OR1Neq09/94GUevN3acGYqmhi3woqArjiCOyC4uGWqP7RtEPsn82SSLMRcyOgVE617lC8+z4vf/b5I1C4di5bfAHRm1/e+4aY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dod+cigc; arc=none smtp.client-ip=74.125.227.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dod+cigc"
Received: by mail-pj2-f43.google.com with SMTP id 98e67ed59e1d1-39b910bdf2eso637672a91.2
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 09:17:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790180222; x=1790785022; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=zDmUDt4wtJfsRkSR0DM1YQ/ag+cNN2NUAkzr2LI5PBc=;
        b=dod+cigcarnf4rIW7RDfLppLxEsxEnDrQz2txX3eC9dGVDr0p6iN7O41KmyDk/hrmo
         jbDWIh06dOJYjSP9W/+vIvVWSRDZToRj3avTzCfLDY7t878Z3/sw3oMqZpWCiHbo2/v6
         6DpDNXqyZ9KFR8W5FrjAQ7puIYimQbVfdNDPvNJK4NwyRhp0Zx63VEVDbAmotyHJah2J
         xuR56mKqUaxKBSbm6HMNN9ZiQ3lkbT4EiHTImrAazj0/Egw/+8hkFkolrU7pej55gPfF
         Db+amfgI5kubL0akVYWN9HNeezB+Uc+iJRZVLpZ6AQyRIt3yoWYNlJdZwQgofz2KP2dj
         VveQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790180222; x=1790785022;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zDmUDt4wtJfsRkSR0DM1YQ/ag+cNN2NUAkzr2LI5PBc=;
        b=ArGcfVPK9RtnmLql69PPiiMcH8wkOFp/5ll0hlH1cQlVtRoQNpX+PigHZwjN0wpKyF
         tus2O9AcAaj8ePcVd7pWB5LfOD4pX9U0YhZkzMI2/mDZa8P22gfLB1doQ8Qy0iynQNla
         bPpbxbzrqDl1JXQTW8mJ4Xkb0PaVfrKgwrGk4J4lHkT3oGL+POvKLXCofKUnkfYSTErF
         QkxnElQxKAEEsYRe5Xdm5MytS3fIdcFOw8R5CI+qivTdAjrH2N0RXMF+dA2vMoM2mdyF
         fYGAGUiEhqvC3O2AvGzDb/BpGZeo63ipaWdK3r/yo3cc0UP8NTEbK29NkSE9LOTBQQLI
         nNWQ==
X-Forwarded-Encrypted: i=1; AKwUvBxUWybz2sNc/naO2/atnDtJDS0nZAleakZdZ9jj3O+aNjrFwT5FiaTYunfou0pimpvpjuz+QW4nXzk2Hy8=@vger.kernel.org
X-Gm-Message-State: AFuF++mUiWwvPpSJtwdU5vqdl1U+KwWBKxcDjEFel68krXJw8oiu+cBI
	2wQmMuLTYBY5IWZp9CfZqmT0eOkPbtj5XGUTbcffkLYGbQUsqMiJZG41
X-Gm-Gg: AYBFou0XE+EESxGgp+u4PKh46ktIzqCxxxigBwauskJ7eusW14TSuINAINDh19S3k6/
	jhcdkWodi6z+koWselT7cakIvMSdX60EWJjddUQf2UngkqWYE8ByA8FFJZ3oZp/1eK7pQqXP15I
	3pn35r4JdRvQprVExMLZ0ca7967bIJgAfvicMLRQoMmG3lDMO4CXahXeoDtp+feuleybzJHVVy1
	JLNQe861I2KZZ6TRCmIHRBYGHGAx+bM9BzI/Xp/Hqdm7N8oDIYcrDJ2wNx/e6VdurSNes1dtMhr
	NWrh7GLwcSUmDCW0jO8vYK2AC8WsZygjX7ZoV8fGI5hRthViSz9e9/q6oixuMmO8QjiO3iGtB9f
	0jP9i19SqZTZptSjJEapz5sH0DhH6u2OadKX0T62n5IizomoWkAkhQgvKseB4tg+4gCKG67j+a+
	eMdl6ZXBdun8d9QFH5oC2H3S+WPxo9kDu0nc98UOVz4GE4P9p7XPOvl4pIunZQYy34Q9n+KfKyl
	uJ1cG2vsxzYgfLn
X-Received: by 2002:a17:90a:d443:b0:3a0:22bd:6ee5 with SMTP id 98e67ed59e1d1-3a07e4e34a8mr2968262a91.14.1790180222330;
        Wed, 23 Sep 2026 09:17:02 -0700 (PDT)
Received: from localhost.localdomain ([223.167.219.30])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a07ddf23desm5743233a91.10.2026.09.23.09.16.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 09:17:01 -0700 (PDT)
From: "Eric LI (Honggang)" <eric.lee0305@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Hungyu Lin <dennylin0707@gmail.com>,
	Khushal Chitturi <khushalchitturi@gmail.com>,
	Andrei Khomenkov <khomenkov@mailbox.org>,
	Jennifer Guo <guojy.bj@gmail.com>,
	Oskar Ray-Frayssinet <rayfraytech@gmail.com>,
	Minu Jin <s9430939@naver.com>,
	Dalvin-Ehinoma Noah Aiguobas <fliegbert2@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] staging: rtl8723bs: remove unused-but-set-variable phal
Date: Thu, 24 Sep 2026 00:16:42 +0800
Message-Id: <20260923161642.318671-1-eric.lee0305@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove the unused variable phal in the function rtl8723bs_init_xmit_priv as it is not
used anymore after removing SdioTxFIFOFreePageLock spinlock (in commit e9b50a2821bb).

Signed-off-by: Eric LI (Honggang) <eric.lee0305@gmail.com>
---
 drivers/staging/rtl8723bs/hal/rtl8723bs_xmit.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/rtl8723bs_xmit.c b/drivers/staging/rtl8723bs/hal/rtl8723bs_xmit.c
index 7f55448d544e..0441e84ea87d 100644
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
2.34.1

