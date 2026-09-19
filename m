Received: from mail-pj2-f42.google.com (mail-pj2-f42.google.com [74.125.227.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6682238237F
	for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 18:11:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789841523; cv=none; b=OdPtgrIK78XqqF3c1V62mOK3TVy2qUsxtyQJHm6ADkXYEfdbWu7hmIBtrZT1nlSes3K3kemRR9gGTIZ0e3iLIr1XAo8RyjhZVwP6FgRCdXmvmV5/YYzHqXc9opfAnUNpT3kU5T7uegZdisrx00z0dFW6pddNH51/D83xxe1jm/Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789841523; c=relaxed/simple;
	bh=M/5qqPR7NFsjiNfCiwjCWVPwF7EHswW13hcCLhlSfGU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=trkds1Lv+/9vra1D5U2frj1n2fEcuGbTceg4hRydHtDW8VZrL5QtRbjGOwBh5VW/W8WhMv8CaRbE+ULemNE0pHZsZlEeSq//9TA/my63NkJpzVITTYan8P1PEpZuzoZuqc5Xo8pIjFMGFda+azjcGhNKlVzR8oFoQqN3LiUIMj4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PtyKO0C1; arc=none smtp.client-ip=74.125.227.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PtyKO0C1"
Received: by mail-pj2-f42.google.com with SMTP id 98e67ed59e1d1-396ccb65437so1402669a91.3
        for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 11:11:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789841515; x=1790446315; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=B6Q0tNDpSDwLHdDUemWGNDSRqqRIyQXxLEMRmujtIL4=;
        b=PtyKO0C1/YwkFw3q6Pm2Hqp+xHweYh8Hk+/O0A3QzZ+HSvQiJwLXjNdCTwOwhmsFeI
         YA3W48+D7LSTmd2bnMww4SmlHtn65Fxkiix0ubMIxgv3MOWmfl8EYOHk/4A27hfnHItP
         8dsuRNZBV9Vm6IT7phPiyXM8LLseNM2u6OkI9ytVSevz1E5knBl/x9mqBbtsxTJp7ANA
         hl2DLO+CYGSxaCtTTf6ZNSoyGH2rTpJlvPHkh8Slk0UV122NkAeOiT+L0S61bLIo33aC
         FJO7BzueL7HJ/d0ViWz+spClHMhfxsd8auBFxL++zBvAc5pcRgyCZWN7IOTaRAI1jNB1
         XWwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789841515; x=1790446315;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=B6Q0tNDpSDwLHdDUemWGNDSRqqRIyQXxLEMRmujtIL4=;
        b=NLYFY8myrmg0jGpvPeceFEWzZLybwtu6iPrzCWBohIausdMoC40M6P6CXhzgoU4+wb
         6uLxs0BueGSypRUlEbFBs2o/AnO91Rl4yCCssET4Ov4D7s9mcmixZiYGla7cQVrel8x5
         uzKX/hKkki3UQLNFs4YE2qSEDmgY1lZVWx7A2MlzDP2qZaNVe30Fwiah+FEpyFXuaKUI
         nAC45X3dgDqexqtmDj3qOxwtU1Pqz5uaUvY1tgFd1P9Vfp89Scs46sUEAoBS5ieqcprw
         HdBV8p9Z4Uff/CkdeLkxGW+8iwrog6RecowWqVE4tOUg83CWzonWwL4rNmDN+66hwXt9
         pi+g==
X-Forwarded-Encrypted: i=1; AKwUvBzO2zzS/SvRdFnUo9vk5Zx3ZrDfs6gxN5yBIGr87ydd5mcZQ8SE+iHnBF2mH8izg8S9AVKzpTS9OMUsV0Q=@vger.kernel.org
X-Gm-Message-State: AFuF++nmra287ZCOgejXIcQ5PVfqWxtGlZCWc2/k5X47ld2O+Z3Swcxe
	DQxYF/UVAamGAvww+QYUne64sBIv1yB6I7Hv+zSyXgezK1wd64+99cfL
X-Gm-Gg: AYBFou3aL3cY2lDtXpiHTS3YmlB2opxRTPb18QbjacotUNdY1+ktyBn9nqIm8M2dsSL
	JCDDd2XYR65H/y2Z1V0tAPAK3RcxutIUqaITzlwdAgjWIyiVhij5wu6v9Wpodc6Fo/AEsKgW6JW
	2+RJQueBZG+OYN25VWqphZNtDRf3as2yeUginBPfrVlF5kIzL9ZajmJMqh32Rlx4A7C4FLgUgeJ
	3HG5Z0y5TtTijVCGTbSzCMxidy5DEPuG3tkZKByiR6FuT5LA6IgH64xCEJCFHqbyaVNBnIoKJzP
	RX5zPxSeIm6LnBccRMJ/ALIRPTjuZGoBY6abd8uV6juBdLQ8ayhKUgPeKu1SWUjPadbQll0SHix
	QXNANPbruVmPVJfzbBBNULJ6fzVd69HPRuuMMapPBPcjO2JBIFnBg30X/HP+9uz4S05kF9c3a/A
	XW5YP5658ciPBhqg2cWO3ZK22X8q85uusTISFM7+2n3VYVvveBkK8r3A==
X-Received: by 2002:a17:90b:2b43:b0:39e:1ff0:331b with SMTP id 98e67ed59e1d1-39e54d37ad0mr10170544a91.2.1789841514999;
        Sat, 19 Sep 2026 11:11:54 -0700 (PDT)
Received: from lgs.. ([2001:250:5800:1002::de93])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a02900f84fsm3584730a91.2.2026.09.19.11.11.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Sep 2026 11:11:54 -0700 (PDT)
From: Guangshuo Li <lgs201920130244@gmail.com>
To: Thorsten Scherer <t.scherer@eckelmann.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
	linux-kernel@vger.kernel.org
Cc: Guangshuo Li <lgs201920130244@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH] siox: fix master memory leak on registration failure
Date: Sun, 20 Sep 2026 02:10:51 +0800
Message-ID: <20260919181051.3751829-1-lgs201920130244@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

siox_master_register() takes an additional reference on the master
device with get_device() so that the SIOX core owns a reference until
siox_master_unregister() is called.

If kthread_run() fails, siox_master_register() returns without dropping
this reference. Similarly, if device_add() fails, the poll thread is
stopped but the reference acquired by siox_master_register() is not
released.

For devm-allocated masters, the devres cleanup only drops the original
allocation reference. The additional registration reference therefore
remains held, preventing siox_master_release() from being called and
leaking the siox_master allocation.

Drop the reference acquired by siox_master_register() on both failure
paths. On device_add() failure, kthread_stop() first lets the poll thread
drop its own reference before the registration reference is released.

The issue was identified by a static analysis tool I developed and
confirmed by manual review.

Fixes: 2c12932b8e65 ("siox: Don't pass the reference on a master in siox_master_register()")
Cc: stable@vger.kernel.org
Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
---
 drivers/siox/siox-core.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/drivers/siox/siox-core.c b/drivers/siox/siox-core.c
index 3e8f3b6a4555..ea1ef0a5c991 100644
--- a/drivers/siox/siox-core.c
+++ b/drivers/siox/siox-core.c
@@ -753,14 +753,21 @@ int siox_master_register(struct siox_master *smaster)
 	smaster->poll_thread = kthread_run(siox_poll_thread, smaster,
 					   "siox-%d", smaster->busno);
 	if (IS_ERR(smaster->poll_thread)) {
+		ret = PTR_ERR(smaster->poll_thread);
 		smaster->active = 0;
-		return PTR_ERR(smaster->poll_thread);
+		goto err_put_device;
 	}
 
 	ret = device_add(&smaster->dev);
-	if (ret)
+	if (ret) {
 		kthread_stop(smaster->poll_thread);
+		goto err_put_device;
+	}
 
+	return 0;
+
+err_put_device:
+	put_device(&smaster->dev);
 	return ret;
 }
 EXPORT_SYMBOL_GPL(siox_master_register);
-- 
2.43.0

