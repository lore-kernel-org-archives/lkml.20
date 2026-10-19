Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74D214B826B
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 09:49:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792403358; cv=none; b=ER6K9m8gEONrJFZQvRflY6OxSfH2U7SKbPMbcrPt/UHCM/gc3mSWVUv+fJxuOEuHg7WIOz2yO//0VNfhFleOOW8Ba3Fegrzsn762N+DtccAP0Xb1FnlEjBN7pzsY/g3hLHndYACP4tjuV3fPVak3YbSF/ImSwaXGMHDM+mfRm1U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792403358; c=relaxed/simple;
	bh=Djw+CAa4TdmdhY24d0q7OhDkmwT0mOBOFc45rC3up0k=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=V1m5HIPA7rwUqHjnPeL6eLHQjIKU0xzqJ2BWK4xslH0hWW/eWN30NATYorruH3cCkCZAgCSfh3U7vdM1ePFo18AAQFX4XvR54FXUm3DLC+DfjCQkQRjSrHPy/D+il9hUBovk/2M1kySA7Hkiji/IvrYlwBySb0/paA8//K7X/n0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kjIaNhDh; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kjIaNhDh"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4a171b677d2so10948485e9.0
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 02:49:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792403355; x=1793008155; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=wVwmmSqI00v46zZ18N04BUiAXDw2jjv5hFhr+um5J7s=;
        b=kjIaNhDhKAIOEtLwjZApMa1KxaqWxsgFHyKiGuvTmrsiOayEUH47oxJXkpWXq4U7nr
         mkwLFWvbmHpMN9mGJuDyp3vcqjo80rhBfH2lqfsoKlluphO2akFAId6CUolBTALwpvkX
         PWmFp61zh1YHqzISmMJcqTv6agpsogDuICgNy7bBP3JHQ0LwODI+JuzRe61dKeOa4im3
         Oxo/kin9jIcbIuJR1D0/G5XoyAxbtE+TMsWPx7CjeJIWo7o4dRMrHptuyfsXTg9zxxHN
         KCtY/7tQMQYao9x8VIbzepBD2KsEeWchsriUgGCC/PNdvqcuKEt147zNP8DR253BmYir
         wS7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792403355; x=1793008155;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wVwmmSqI00v46zZ18N04BUiAXDw2jjv5hFhr+um5J7s=;
        b=Od6eghGAB9l9VPwnaR96uaD7V9R5oRPUD2zovX6I9NUDklrHGcnsHy6haA8GMISpet
         TxTvGfOru7w3kasyMqXB4mYj55LUfaZy8KQuz8Z2QJcAUIvqYwWdxfyFPQl+eMOYGle6
         HZJo8kpAtq2NDxc/fJuv55fPCIRVVEWFJPdEk01cEjFF6skiE76wK3111kFBRDzFq+ws
         DHJ2LB9QygmY4UBBa+AdMOdj1KOL4JXjJaMigXLLdJfQzo7ATh91ffg6+P14xPRC4GG9
         rmfyDs21NgxOvyYfTfwBw/zu8XC7XZw+49GQr3J1viL1k3BBVP9UPUDK6+Lo7vA3n1t5
         MfOw==
X-Forwarded-Encrypted: i=1; AKwUvBz1FdImzCKuOiRdDouJlHYhZUhc/i7oClh5bIH1FfBvT2DMCmqcGV62vIbPRuY2nRumYbO1pnDexIfb0/Q=@vger.kernel.org
X-Gm-Message-State: AFq9FYIiA6xoL1V7C4nxeJS3epECUKyQJaKb/CA1KW5sR0l1VUInIqes
	PsUvyNYp7Y8fbAE5bgFtuy5YxosN8wbZ9tBnzo3SCNXSb8LaxJWzc3gE
X-Gm-Gg: AYBFou0F/MwP4HapMsKgftuUrabj3kdFe02zc5QL/UyMMe+AiEJsSdo7XsB4cyObHwZ
	zGoN341G4Ulvb1adPg5j0r5QxpAFqggJfj/3n50ouTXKY7QtgjOgqSC1XAi3EANvbFqqjMpUVJZ
	5MJrcxgBhBE2e6GFJ7J+a4cBcUxr6N0OzOwAcPeWgaBVA8hVwewTKjS10maKnJ7sriv5u77FyYM
	iNDLorR6gemsJm4IdxTYY0+pLlUqId3kxZ96V+gaoCLyq44Uis+0Tw5NGhx8YkQuyaQyEOLXoQD
	ejjdwdGUT+o4aU4bgbXAW+g/EPRrSTshFQQsYKtunX3EzJy9rXmKtPOHdF2ow/laQL63xppOkrw
	W5VKYKzm3IDRjB99sZTKW5d8C3MhflEr7RTglElVfL5hCOIaJYZy6EaCl2lRU/rFVo4NzCq1kRA
	0CI30+g0pAx/sdHkAB/MUi1KP+g7WPKpIBoMxAilMhYiw/P1suaBfTYjqkd+ccShKY2B1PBhzZA
	IXka+HGM+PfugRXdB93O2saLNM=
X-Received: by 2002:a05:600c:3b1c:b0:4a1:c646:3edc with SMTP id 5b1f17b1804b1-4a1d75f2aedmr149554645e9.11.1792403354550;
        Mon, 19 Oct 2026 02:49:14 -0700 (PDT)
Received: from DESKTOP-0KSTGNI.localdomain ([156.213.131.39])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1ce02d619sm177669655e9.3.2026.10.19.02.49.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 02:49:14 -0700 (PDT)
From: Temitope obabi <obabitemitope765@gmail.com>
To: sudipm.mukherjee@gmail.com,
	teddy.wang@siliconmotion.com,
	gregkh@linuxfoundation.org
Cc: linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	outreachy@lists.linux.dev,
	julia.lawall@inria.fr,
	Temitope obabi <obabitemitope765@gmail.com>
Subject: [PATCH] staging: sm750fb: Remove redundant NULL and zero assignments in probe
Date: Mon, 19 Oct 2026 12:48:35 +0300
Message-ID: <20261019094835.1343-1-obabitemitope765@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The sm750_dev structure is allocated with devm_kzalloc() just above,
so its memory is already zeroed. Remove the explicit NULL assignments
to fbinfo[0] and fbinfo[1] and the zero assignment to mtrr.vram, which
only set fields that are already zero.

Signed-off-by: Temitope obabi <obabitemitope765@gmail.com>
---
Note: Greg replied to my earlier sm750fb patch that keeping the
explicit zero assignments is good because it is clear what is
happening. In that patch the allocation was in a different function.
Here the assignments are in lynxfb_pci_probe(), just after the
devm_kzalloc() call and its NULL check, so I think removing them may
still be useful.

 drivers/staging/sm750fb/sm750.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/staging/sm750fb/sm750.c b/drivers/staging/sm750fb/sm750.c
index 8b93bfeb217b..8702f6313f78 100644
--- a/drivers/staging/sm750fb/sm750.c
+++ b/drivers/staging/sm750fb/sm750.c
@@ -969,13 +969,10 @@ static int lynxfb_pci_probe(struct pci_dev *pdev,
 	if (!sm750_dev)
 		return err;
 
-	sm750_dev->fbinfo[0] = NULL;
-	sm750_dev->fbinfo[1] = NULL;
 	sm750_dev->devid = pdev->device;
 	sm750_dev->revid = pdev->revision;
 	sm750_dev->pdev = pdev;
 	sm750_dev->mtrr_off = g_nomtrr;
-	sm750_dev->mtrr.vram = 0;
 	sm750_dev->accel_off = g_noaccel;
 	spin_lock_init(&sm750_dev->slock);
 
-- 
2.53.0
Note: Greg replied to my earlier sm750fb patch that keeping the
explicit zero assignments is good because it is clear what is
happening. In that patch the allocation was in a different function.
Here the assignments are in lynxfb_pci_probe(), just after the
devm_kzalloc() call and its NULL check, so I think removing them may
still be useful

