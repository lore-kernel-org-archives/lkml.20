Received: from mail-ua2-f12.google.com (mail-ua2-f12.google.com [74.125.226.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FA5F632
	for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 01:17:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.226.204
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790471862; cv=none; b=Whs0aykWoCubsRIgwzmrti2DHKVouCRrmxpiVcqovQwA2uJZ3JgW1D1Y442WYehYi7NW3eeUI0Cy41yUH8KDCkl/En+E3RisjzAjOPVB4sJmfJDJeM16KBdEff77rA1wwNc87CLOo43g9Wa48JoqiN/5fdSYHiM/hn7dgs/n+Rc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790471862; c=relaxed/simple;
	bh=ePnRvq3UMM+sa2D8dc9jnBVFW8hpD++8XhlbdDDl/iI=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=RcJxqJ9XVvY60XcxJqOYsqj/I2Z1h1Lcekv6yC5uKCLek0b2iT9fIRMjzqHEPuXXWIZC0lvOV7HUA/7O9bK6eEPRywkAOpfyX+IMrl+bJqmox5CH949hYuhJPIaIgUg/XFV1XKNQEAE3jKMYRqLrWKgeOaXk7BBKWmt1PIlbI6Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cYTlfjRU; arc=none smtp.client-ip=74.125.226.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cYTlfjRU"
Received: by mail-ua2-f12.google.com with SMTP id a1e0cc1a2514c-97e7c72bfe7so530067241.0
        for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 18:17:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790471860; x=1791076660; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=AZj1MR82XkpbobvFczq8ok2+SpPrjJF23vq7+BjVWUU=;
        b=cYTlfjRUYpaCSOcVVHHijmkPbxz+uraer8Tlf9XhQtkCKbGz3X2IPDlm9nP4KpG5R3
         +BtV+DLRr/G4ToU0aKgvS7HGPnRqyCprIWCPhvesHmCE3zeGy3F/aBbBCXKJJjxqxjJP
         10N607Ig6S6vBwzy4fY5T9a0480km6I1gQ38oS62QxWtJLOecLL/5zgzAcbC34lUHeyW
         jekp8X/2LAennQFJxv5jPbAaqVtPscLkVHEcO9M598LyX0Kp8iX8DrrQnjiy1BXWFkRY
         7dR8FqaTDANQIRTxFZsspcv3kIZFCCqeVNakeIzbrPFRYBUBNYqrcdcWfnlC+h2boyCg
         6G9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790471860; x=1791076660;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=AZj1MR82XkpbobvFczq8ok2+SpPrjJF23vq7+BjVWUU=;
        b=t0arnPkvCXgIbDbDnxucHzv2XONXis4CAxVq+tFf/CB5JO8D5cI3yGzYnBCEu0E8vF
         rljRXj37whDPg4C9h6OmeC9uT8iRQwlUJ8Kg8MBdDJyK/VhqVavvvQ42A1iOVMZClDsP
         0s5o3eywBvV42KIy1ClD76TV9OC7iRZXOCPhkXldrIy6qBdNfcMuq15aGPrgkh1F1eRS
         YXhR3eMDD1Riui68g7tzgcwBzBEhNzPErITHBz7AkTriNSOaO8baGcAEKVFWvGVTP2TX
         Yh/+x70Yrm5X+0rQKzTKTPWXrbOm0H5Htv+Dwx7Yjg7R6kyEd5/wtq8YLLCSZhSwaMrk
         MEgQ==
X-Forwarded-Encrypted: i=1; AKwUvBz+fd3/sfPjJEuU/7dLtFsp/hVWdE4Adg8f8puwcmJADwfOz5i2stZftFoHrTM/WO2Ziie8TDMT+rm30R0=@vger.kernel.org
X-Gm-Message-State: AFq9FYLMuT/UxN+eU+MKOTjGkzPwS+3DNO/asH18C4ucsfUpEtsyGdKI
	FvXTGjLX7Mrz5qLDczEbDm5xeP/iSF+19dyEb6Y6hvbuIaDiKk5rTzRBUYEo7Q==
X-Gm-Gg: AYBFou1/n1y9QIUrS0/QNDWSt0HClAoRoCvhhjHsVJ5inlUVa2/Zs7JfPWM45dw/eOV
	+pqM0l47+eHcaqfZrsFBw8VxjUGBFP9eCPJZsjOnvGm3p5rIzE4YrDnIU8jai3UvzmpTv6K1ubQ
	cbm5u6jOjichFmT5ihOZk1RJ8IN8xsNaSZ2pgQx7/xJ2FcoXHDmDZR9b8LwLzjY7bJk0ucPlNFD
	/6Cmb6oEKNbaiMKCvUKuJ0/hrWx/iRhofJ7UboK1oOYMmNJT7qb7mZLCUU0Pjnv0/ACUfpyqMjJ
	71DaTb33ynlmXI6VmYqzmUihnNJOBU2FXH6sa5qcLUgsgFcIXUWAH7wAzrLbJf5Vc4MFi4V36XN
	BMd9fJJCBjJcIuWVMfS0moVtxxAaK1bblEJDhbsy6hOb8MDHj0/N57hHyrLpalQ98NhyywBrLoN
	G7Ku776rrLQcb6hafOHUd5LP8wxnxuO+SGYwqWZI25I9FRPLxy4oxWvXTj
X-Received: by 2002:a05:6102:4429:b0:7a2:2a4c:606a with SMTP id ada2fe7eead31-7b1c5536ae3mr1905560137.15.1790471859988;
        Sat, 26 Sep 2026 18:17:39 -0700 (PDT)
Received: from [127.0.1.1] ([2804:14d:78b3:5cda::1002])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-9889b1d413asm820433241.10.2026.09.26.18.17.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Sep 2026 18:17:38 -0700 (PDT)
From: Leonardo Martins Martins <dev.lmmrtns@gmail.com>
Subject: [PATCH 0/4] staging: rtl8723bs: refactor
 PHY_ConvertTxPowerLimitToPowerIndex()
Date: Sat, 26 Sep 2026 22:12:23 -0300
Message-Id: <20260926-rtl8723bs-tx-pwr-limit-v1-0-989dcbc113fd@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAHdtuGoC/x3MTQqEMAxA4atI1gbaCKPxKuLCOlED/pGWGUG8+
 5RZfov3bohiKhHa4gaTj0Y99gxfFjAuwz4L6jsbyNHLMRFaWpuaqhAxXXh+DVfdNCEPnkPgiZ0
 XyPFpMun1H3f98/wA7wwFz2gAAAA=
X-Change-ID: 20260922-rtl8723bs-tx-pwr-limit-9a19bb9f901e
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Leonardo Martins Martins <dev.lmmrtns@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790471854; l=1530;
 i=dev.lmmrtns@gmail.com; s=20260813; h=from:subject:message-id;
 bh=ePnRvq3UMM+sa2D8dc9jnBVFW8hpD++8XhlbdDDl/iI=;
 b=Jks1UthAo6nYxCSO90vZ/xP1AGslNfQhYyvU2ijEGDp9kIDJXEydZf3QI+/KSukdZMwZ/gIce
 AAWx3Jo0pGjD+A+My/G0eWKFkYr7vZ4//EOTxclpNQlmUcFOlALKXqf
X-Developer-Key: i=dev.lmmrtns@gmail.com; a=ed25519;
 pk=dOFSCpUL7hbyVftAaUGDebsgsSl9Uk/Tx0Aqpd4Bcng=

The function PHY_ConvertTxPowerLimitToPowerIndex() has several style
problems, such as mixed-case names, deeply nested code, and redundant
bounds checking.

Patches 1 and 2 rename mixed-case names that are on the same scope as
this function, struct fields such as TxPwrLimit_2_4G were left as is.
Patch 3 removes redundant parts of the code, and patch 4 solves the
nesting issue by extracting the inner loop into an auxiliary function
like it is done in rtw_phy_tx_power_limit_config(), at
drivers/net/wireless/realtek/rtw88/phy.c

Checkpatch issues a few warnings and checks for deep nesting and long
lines, but these are solved by the last patch.

Compile tested only.

Signed-off-by: Leonardo Martins Martins <dev.lmmrtns@gmail.com>
---
Leonardo Martins Martins (4):
      staging: rtl8723bs: rename PHY_ConvertTxPowerLimitToPowerIndex()
      staging: rtl8723bs: rename local vars in phy_tx_power_limit_to_index()
      staging: rtl8723bs: access TxPowerByRateBase2_4G directly
      staging: rtl8723bs: extract inner loop in phy_tx_power_limit_to_index()

 drivers/staging/rtl8723bs/hal/hal_com_phycfg.c     | 88 ++++++++--------------
 drivers/staging/rtl8723bs/hal/rtl8723b_phycfg.c    |  2 +-
 drivers/staging/rtl8723bs/include/hal_com_phycfg.h |  5 +-
 3 files changed, 32 insertions(+), 63 deletions(-)
---
base-commit: 8444548bd905f22093729065408284a6b46f7eee
change-id: 20260922-rtl8723bs-tx-pwr-limit-9a19bb9f901e

Best regards,
-- 
Leonardo Martins Martins <dev.lmmrtns@gmail.com>

