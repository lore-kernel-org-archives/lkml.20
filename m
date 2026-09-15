Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBED641D4F3
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 13:54:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789480461; cv=none; b=uLHJLr0+0D1qdx8WzssT42Mh3zzFKY4UDA2RmanNCMvmnFBdYmTPllymw4nLHRoDtMn7iLQUxUOmhyVk/Cs+drgrHa666MnxxSxy0s/B+eaRdkIF81KJmmkkRGPzujJTjZ6KM+/OsbzX35EkcWBBDkbbeetXWN4psfxMPyejTEk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789480461; c=relaxed/simple;
	bh=Ag5tfz00fBg6YXo3im7agg0lkNAqHNZutLBmML/rBjs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=JltK61Lgec9HRsmajtb2f9NxPgTteQ5CEaDh009V9c1liKSjhRFMbA77RhamZk7lkV7jZ2xBLzNLxEH4zj5+xTid99SISAU/3AccEGXu174wepdyZTNETx6ELMPEZooBV19U/CxhI4VBt/5GwvLOxSPBCfP9eb0wqfuvr6YpcOw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=H0mwRs89; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="H0mwRs89"
Received: by mail-pj2-f12.google.com with SMTP id d9443c01a7336-2d90ba1d807so43743605ad.3
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 06:54:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789480459; x=1790085259; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=whXzJHNF2cPXx+i5FgzKhan4wYJW9EK7frxKYSb7wNI=;
        b=H0mwRs89+UPb/DZtvXtW8tJ20Ms+Ff2SLVKSuZT+nARB6Ady+AbKw5jJno08CkCoKz
         YzPdklCHVLFOWbKc8Mucu7fCEGzR+RcfikB6msm9o5MP1gtuw+3J0//uPLTXlMPmgCIT
         LeqdVVvUrvHH81iyaMwADOZizOjW8ddC4QrN0UEpNg4TJ2bToX75cHcdycb8L3pvas3M
         V1eF3OwY3ykCg7nLieG2uaHDq5b8OcYW5nNaIDb01fUP0t2X7by+SVwNUUD+cF3et6io
         tjzFL4CYZkOGYAHSFXcLQAVood0pF87e2j6+OvcwoHP8Xt21ihO4sy5ATv34hh8h9mFU
         qCDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789480459; x=1790085259;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=whXzJHNF2cPXx+i5FgzKhan4wYJW9EK7frxKYSb7wNI=;
        b=n9ZNh47mp4nzgL2PBYzw+Me6JAvolE+lJ6ejD86i1ayk5aIyiOXp4up35iNZMDLk4p
         CEuDoSWDRZfxkMWTxspCuoukeX4ikEd1WEKsuRa2niVIoJ6OulKaCeX86FZWXOlpgtIN
         vUZR3/KjuY/aSc1+UcloiUDkK5d9ivVYmXCYmx+FTgSl+v4S5xI3xmylh6eahQm+OjQZ
         1AhWq2TJIgkK6u3sp1YdlcZSyEFkYZKHyr+eZLGwvAoVfauBKQLufyR1peSEg+fgbuyW
         nI4zzlCyq4dwaPBHXzdJHEzfl00XrnJ8qBOENPjWnn28eggn6g0EfTyGof7dfiQ4WIPh
         qKEw==
X-Forwarded-Encrypted: i=1; AKwUvBw+LN3pTqAe0LvqAaQkRwozhz0BoOonZahbgiW5yOyBZF9XIBp/SaCHw1PKZDzZUi0eI+AbMYksixWxT24=@vger.kernel.org
X-Gm-Message-State: AFuF++kUI2fXoUMO7vSKupfsfAoVROG7gZY/ROzlTDjITiMNoW4hzmjL
	eZT0wdvfYmfiPHoL2xRgTtBi71D6a9MSYpSQFKVodNpiAXzzg4jnzLrh
X-Gm-Gg: AYBFou0/wG/qcuL1GXxNvs1P7A+y71YgvKiwsr3bEfxGif8vHfZmCl3dQQwP7ZR2h8j
	P2iBHZ/N4CzCsBA6SPQCPW1t2YL6dZhUOqJabt6IHzxizZcyNuqEtBsgvBg85e/yYRVkkUVOSkS
	t0twpt0ipjYdQCGofHCuMqJ4fSBrScDEfSPhyLwWr9kW11GgPYWp3jWvG/kf5YdJ3O+U50qxAvE
	RyiHkY6oyw1lbUqAv+JXuPltPXsnZ0kLXXTZezB/rMsMOSa/FcWwU2dga0yjc72fRmg9C19vLOZ
	BRcB4oVTAsM+KwLHiCwwKd3EhQPz07r/thBsIsXcrKRuadUp+Bge3wY8WuStKrhrQbvryq3w7ap
	PCt3029OEkpu3Ou16jo/6jqH+isRtJ8FNuXJQ12M5J67M4mL5tXkNHKeEiURUJlkH0t8/DY3eug
	dZMJ47gOcapZnAFs1LZKtSd1Pf4yrJYrS9kljuM9rYY8I1gd55JvOryvQ=
X-Received: by 2002:a17:90b:39ac:b0:39e:261:4e0d with SMTP id 98e67ed59e1d1-39e026159e9mr5815662a91.25.1789480458971;
        Tue, 15 Sep 2026 06:54:18 -0700 (PDT)
Received: from lgs.. ([2001:250:5800:1002::de93])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39dfdd0ba9bsm5533757a91.7.2026.09.15.06.54.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 06:54:18 -0700 (PDT)
From: Guangshuo Li <lgs201920130244@gmail.com>
To: Jacopo Mondi <jacopo@jmondi.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@kernel.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	linux-media@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Guangshuo Li <lgs201920130244@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH] media: renesas: ceu: free device data if video device is unregistered
Date: Tue, 15 Sep 2026 21:54:06 +0800
Message-ID: <20260915135406.2423337-1-lgs201920130244@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

ceu_probe() allocates ceudev, while ceu_remove() does not free it if the
video device has not been registered.

The video device is registered from the async notifier complete
callback, and its release callback is responsible for freeing ceudev.
If the device is removed before the notifier completes, or before video
device registration succeeds, video_unregister_device() does not invoke
the release callback and the ceudev allocation is leaked.

Check whether the video device was registered during remove. Unregister
it normally when registered so that its release callback handles the
final free, otherwise free ceudev directly.

This issue was found by manual code inspection.

Fixes: 32e5a70dc8f4 ("media: platform: Add Renesas CEU driver")
Cc: stable@vger.kernel.org
Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
---
 drivers/media/platform/renesas/renesas-ceu.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/renesas/renesas-ceu.c b/drivers/media/platform/renesas/renesas-ceu.c
index 65f7659a9e02..5015b7837381 100644
--- a/drivers/media/platform/renesas/renesas-ceu.c
+++ b/drivers/media/platform/renesas/renesas-ceu.c
@@ -1705,7 +1705,10 @@ static void ceu_remove(struct platform_device *pdev)
 
 	v4l2_device_unregister(&ceudev->v4l2_dev);
 
-	video_unregister_device(&ceudev->vdev);
+	if (video_is_registered(&ceudev->vdev))
+		video_unregister_device(&ceudev->vdev);
+	else
+		kfree(ceudev);
 }
 
 static const struct dev_pm_ops ceu_pm_ops = {
-- 
2.43.0

