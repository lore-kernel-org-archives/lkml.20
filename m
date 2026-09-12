Received: from mail-pz2-f17.google.com (mail-pz2-f17.google.com [74.125.228.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3593123BD06
	for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 14:46:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789224383; cv=none; b=owActYmvGF3lFKzuXbpSYxTCnAXNypasvqu/RIYAz5i5K7eCY263Wmo6Sdcf6xiAF4lNoCKi0v5/WzLrI2ET4ImNcnw+26gotYr+DMXftiKJ1+eQj59v+Rbm40XmHjjhlAlhysHxxwFEq3RBgblHbHtnTjYmBIN8MimeW6Ik0BY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789224383; c=relaxed/simple;
	bh=GAg2KcHj6vIzVzvOv0EEQoUKS+sOiIbdJa3s/8hSw+I=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=N0zBH7r0o6RUUNU+6A2RHo6HzjeqXkA6BlMRW5vWynaVACNU2VVWpgBMs+Wu3WPiKxRblDRLlXDgbYDX6RO010V/xT9nZ2zpBaksyjoA9sXnQWPZNLJT8mYN7D8H1zhMPndPvDHYf7H2qLSJOJyQgQYauqgg/7EEtYrPEfYzrWg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gPq7Wr2P; arc=none smtp.client-ip=74.125.228.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gPq7Wr2P"
Received: by mail-pz2-f17.google.com with SMTP id 41be03b00d2f7-cc4c3304784so791486a12.3
        for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 07:46:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789224380; x=1789829180; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=TmaoDFxzQKVyaXm36B4ffdDPK6QYqEtkuSAzwPXlrsc=;
        b=gPq7Wr2PLo1XnI52+zR7mv+T6kM+yhLU3I9uuxGGVhh4M63utKJYsgv5o3yQVhagEP
         qf2++SHF65zzSxtIwmRjC2EkJkeVOCQa6Kv/SkVX/4cacnIS6qIv7llloPvZpeKCtN97
         N4jmndHQQ9WhoRW0HyKliGIAS4hX6jgvvbIKgc7eQt37OoWcafzeX3tWkA+GZ4XfFoRh
         QSvNXlqADbom9O0CjA3J7/c2LV6BJLueYDt4GtoJ9k38ghjiV9DXzli6cAZPPvR4Jg9i
         DEklXCrZcOBYMR5ySQbbmTIFvzpHSWguAGuxta4OCOcq6x1H7n3BCxJrl7sqkzpOt98K
         rGZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789224380; x=1789829180;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TmaoDFxzQKVyaXm36B4ffdDPK6QYqEtkuSAzwPXlrsc=;
        b=QyiMmb1+Vmp15+HJt6cb7sG87iMvulmI3y1WR3AcyF7tvIxLknY7UGrS9uDbuk/pZW
         qDtDAETrVxY/55MiiH0QB2KPmSivuY98dklFtX7MUsViDb7aZqgI7IkQTp7cYdRLDojL
         Hv/UqWIlhD9RyRyjo65EqUYg+Eh9L74Iqqd7bS9t5s/gZ6ByaSPfAl0PrYsY51dgwx9f
         DdV3TTJj8PnoneVXkqtBJ6eCXMnI8KHARuoDuD6Xp2TBxGpqeWGzhcDLyKCEY4LrOqd8
         e940ytO4TvAVriAdlyk/jaaWeYyF26vxbmBvPIQw5quhjWm0unli+wykPIf22hiwMFbe
         i29w==
X-Forwarded-Encrypted: i=1; AKwUvByJQCmKo2sbPFCti0zzzJooryjo5dBCi6aETs0B9b/mhRMsuYcua3GDgWWQUc0zZKVqWaPv8oMndUqJmNU=@vger.kernel.org
X-Gm-Message-State: AFuF++moVCzX2mpAilUC8voKi05q/K3Uut8rifUyzSwP5o8+uX0xFNmg
	uw2V1C/+zkCbYbZOn7O3cT5oD3tJAE11jRT/A79eLZMCPEkmcFsle8hr3KWlUjuh
X-Gm-Gg: AYBFou1nOqmqgMPPcG6b6FGIlCD/iI57NAJBY5H/uWT6XrkqRNFeuZxbefUfSvDQd7V
	E911Rj+okBaQC3Fcj+a3FcVO9ZeDQs9YH/0PVoCk3jKWBpw2U8v+m4ED42Kf/6xTeXSiBcHusET
	ptkeBLRcOshzx7lMjjG3qGukPTN91Zp4EGdkaxA5z6ChFdeXBRCGyYpk4k7o0WGgiFrP9U5vMCD
	fQwPmN4BC5OG2x3HqPTxIbyCiVsabJ3zeTvy5pOK4r+H/clMzJwmvH50+VL2AXRrCy/EXMG6rC2
	rDs+j+pN52fGJgAWKcr6KQYvfYzh+NR82zZ6LOI/edy8RR62m3VJ90eX1YuVfCzs+duiojSz9m2
	HGHyApH6k0EzcTLSwEAvskYdNKeiw1TErySADbls6AUmKvFhE4oci994ROqeupm8h0yogVsLSZ5
	QnLSjh3eDiYAcy8ONk0RGiORwhZlLUYru084C2naT9SY7g4y2DgNk8tA==
X-Received: by 2002:a17:90b:5383:b0:390:8361:a532 with SMTP id 98e67ed59e1d1-39d9bc44d58mr18616906a91.7.1789224380269;
        Sat, 12 Sep 2026 07:46:20 -0700 (PDT)
Received: from lgs.. ([2001:250:5800:1002::de93])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39d98e60484sm10398006a91.4.2026.09.12.07.46.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Sep 2026 07:46:19 -0700 (PDT)
From: Guangshuo Li <lgs201920130244@gmail.com>
To: Herbert Xu <herbert@gondor.apana.org.au>,
	"David S. Miller" <davem@davemloft.net>,
	Tero Kristo <t-kristo@ti.com>,
	linux-crypto@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Guangshuo Li <lgs201920130244@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH] crypto: omap-sham: fix crypto engine cleanup
Date: Sat, 12 Sep 2026 22:46:08 +0800
Message-ID: <20260912144608.994510-1-lgs201920130244@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

omap_sham_probe() allocates and starts a crypto engine, but the remove
path does not call the matching crypto_engine_exit(). The probe failure
path already performs this cleanup.

crypto_engine_alloc_init() creates a kthread worker for processing
requests. Without crypto_engine_exit() during driver removal, the
worker is left running after the device is removed.

Call crypto_engine_exit() after unregistering the algorithms and before
tearing down the remaining request handling resources. This stops the
engine and destroys its worker.

This issue was found by manual code inspection.

Fixes: 133c3d434d91 ("crypto: omap-sham - convert to use crypto engine")
Cc: stable@vger.kernel.org
Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
---
 drivers/crypto/omap-sham.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/crypto/omap-sham.c b/drivers/crypto/omap-sham.c
index 6d2dd0b88f15..207fc7680c8f 100644
--- a/drivers/crypto/omap-sham.c
+++ b/drivers/crypto/omap-sham.c
@@ -2129,6 +2129,7 @@ static void omap_sham_remove(struct platform_device *pdev)
 	list_del(&dd->list);
 	spin_unlock_bh(&sham.lock);
 	omap_sham_unregister_algs(dd->pdata);
+	crypto_engine_exit(dd->engine);
 	cancel_work_sync(&dd->done_task);
 	pm_runtime_dont_use_autosuspend(&pdev->dev);
 	pm_runtime_disable(&pdev->dev);
-- 
2.43.0

