Received: from mail-qv2-f12.google.com (mail-qv2-f12.google.com [74.125.230.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7630E330328
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 22:48:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789080530; cv=none; b=HtJkjSL68hW+P9cE/ZKydDHov9jc5u8z0VNIU/WMreMU8aS1h2MulB+tRLvZL8YDTyl13a7wNvhl8NEh4Se6sGUvkbLkffj5HU5UVfoNPWSxZPzqj9sIGUt4U3pgEM4LUUQKHIvQ6HgHowzoXF5ohEl1ZuBskFdU1wfJGGG4n8I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789080530; c=relaxed/simple;
	bh=FD1CVR6P390fK5SosNu21bCJZwzv/9aYQoB8hxCdVYQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=tqO6jirjmZ1gNuVBQMLMQqVDTLtXbEENxx4vdgiaScJFNfkoKVnF7cCnASydvYFmAoVAqi28HsTrzvUYgf1NewuDNcJJFmY/DZbGiU6L4CQ79vTB2zlrHMf/P/2OMI7EdBmVTY1KFgwg6rbtvC47JgjfmgWycKTeGxWqw7m6NhQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=F+270yTv; arc=none smtp.client-ip=74.125.230.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="F+270yTv"
Received: by mail-qv2-f12.google.com with SMTP id 6a1803df08f44-90ce6d5271dso1201186d6.1
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 15:48:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789080526; x=1789685326; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Gm6ysHQo5XVbaM7QmaAZGcihUIXrGGRXHoGmW7yFDKk=;
        b=F+270yTv/NXZvrIRXPEVgsgixMf2s9a4KV60/kvCnL3GlUO2KYZgMkxJly9nD2iFio
         R26EWGATWHSgKCtFIFZTiUZLQeAaFemMAUubbjumDJ+4Ec+YedbZ/sq5sfNBTNHMELyF
         SQvi9qf6UHBeqfwgfBB/f7epxCMovBx2OChMb/vVIDEXVluXfi5kbL0BHIcKkmGByNgG
         TALz5jt8dIvQFO4kMjpCHcvCiZ1LOUExesvRFZJu3vUg9lxNvraxGdwGX6KGH/i/ce8Q
         iLk6jgtWiQJMcUVa+J0qnP3oCtk7JQDnqnTx3B7ZjrRLMgQhPZcwHsTjBnQ2Jd+Lk/df
         OHdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789080526; x=1789685326;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Gm6ysHQo5XVbaM7QmaAZGcihUIXrGGRXHoGmW7yFDKk=;
        b=a1abtfBWXd6tI86nXpfh/bPNM9hGcremUl1cLTb7B9oBQ1jCSLTQYnk6d9Zxjofomm
         bX2X7/4cZo84liEj4L80hTlG70/w3/QD0yfKSykopnFiXsKoTxQsCN4yqEvqO1y4ycV8
         dX+H45JRI1IoVfQEPC7oeDtKScoJtX8ty2zBnXci1IbMkiAxiEJDdo4lt+n3NlFhoio0
         yJ3GeyQv06XZ5LLiSp03QHBbGn7pppf5gJAhGN7FqHp6wTSt/3ZAX1p0ancKlyI+Sy+k
         2uZEEamW6e/ylXRKJp1SvlF9MparW70W6gI6RLSgnwEflkxjM3rjE9Hz44v/NZXjx4Dk
         uG8g==
X-Forwarded-Encrypted: i=1; AKwUvBz28cZMZIhKgOAg56ZJpOQ83F+fmVWp7ceo1HNMiWD6gvkZRRpScR8fbi7BTMHDoeubdgIM6o8h9cR9Hg8=@vger.kernel.org
X-Gm-Message-State: AFuF++l0gw84P6w2dQ7g7ymZVFLmNwDq0AjSwbj53Hvq4CQ/mvSMfhSn
	V4UYiedUlLqXXPeP/FNhbUtsJMx5Xz8dEmWKz877+N3JwVJxyrAm/9I=
X-Gm-Gg: AYBFou3h0BwRw0lJaP9NRdKcHrhueO8GbouAtr5JWWZ9LthlKHkyfFLfEzK5AWdh8+d
	fBI7f92YFcdDwkWtmru9s9zc2Bep0EaTKeAxZcYzxGQ8MIwZ7X0r1sdZRVjabBYMz5wWS7Gshpq
	qbKsy3KOwjQWjcZMh0/dHu2ywwurMeY3z9WgMkzOQFsLlDy0YIAsbnw3kC+pJdgvU7MJDdMd3au
	ap9zMOT8EUeotE9mK4Oe4lc4xL+M8ppkI485Wf49Rg4ueXss50gPOuIvnJJEkBTX8Wzl55n8D33
	fnFXiDRk6tXguAH9Jcdie1HTcME1mEenzW/9A0Df80xiJDElkm0U9WrL9Eoj+j6wk5ENURaYDke
	bEiX/plXHb4wtMcGdGFLvxjP7ujBH7JhfXpr3CHbCctYPzHRFB4UPCEn3nR3XVuGLZwpt52a6Lr
	0Qr08ZSOEMNJC1if/1J+Ugiz3LzBdNBwxO9ybonANVIuTMX0y93C8dOsLgGS8eLbCF2owFK2MaZ
	1T9nw1Hm77onIZaMBrTKiYgpQCbct9LFZjJnAqLIfE6Hf1EIdtp8cA7hALcy6ilbA+BtXQGKCNz
	BWdC+iTBjuPac5HkucbEgcJ28kpkmmierj4=
X-Received: by 2002:a05:6214:2b8a:b0:90c:a989:a68a with SMTP id 6a1803df08f44-9120ec865c1mr22173266d6.11.1789080526563;
        Thu, 10 Sep 2026 15:48:46 -0700 (PDT)
Received: from localhost.localdomain ([104.39.73.78])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9120f45a78bsm6777996d6.8.2026.09.10.15.48.45
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 10 Sep 2026 15:48:45 -0700 (PDT)
From: Myeonghun Pak <mhun512@gmail.com>
To: linux-media@vger.kernel.org
Cc: ehristev@kernel.org,
	mchehab@kernel.org,
	linux-kernel@vger.kernel.org,
	Myeonghun Pak <mhun512@gmail.com>,
	Ijae Kim <ae878000@gmail.com>
Subject: [PATCH] media: microchip-csi2dc: Power off on probe failure and remove
Date: Thu, 10 Sep 2026 18:48:37 -0400
Message-ID: <20260910224837.15554-1-mhun512@gmail.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

csi2dc_probe() leaves runtime PM enabled and the controller powered on
if subdevice registration fails. Removal also leaves an active controller
powered on, since pm_runtime_disable() does not suspend it.

Disable runtime PM and power off the controller on both paths, then mark
it suspended. Check pm_runtime_status_suspended() after disabling runtime
PM to avoid turning off clocks that runtime suspend has already disabled.

This issue was identified during our ongoing static-analysis research while
reviewing kernel code.

Fixes: 2de0b3c0f678 ("media: atmel: introduce microchip csi2dc driver")
Co-developed-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Myeonghun Pak <mhun512@gmail.com>
---
 drivers/media/platform/microchip/microchip-csi2dc.c | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/microchip/microchip-csi2dc.c b/drivers/media/platform/microchip/microchip-csi2dc.c
index e69292f3b2a909be6a044db6ad086a7b0e082802..56cccb02bc562febe5e6a36e69a9ae014e005ccc 100644
--- a/drivers/media/platform/microchip/microchip-csi2dc.c
+++ b/drivers/media/platform/microchip/microchip-csi2dc.c
@@ -727,13 +727,18 @@ static int csi2dc_probe(struct platform_device *pdev)
 	ret = v4l2_async_register_subdev(&csi2dc->csi2dc_sd);
 	if (ret) {
 		dev_err(csi2dc->dev, "failed to register the subdevice\n");
-		goto csi2dc_probe_cleanup_notifier;
+		goto csi2dc_probe_disable_pm;
 	}
 
 	dev_info(dev, "Microchip CSI2DC version %x\n", ver);
 
 	return 0;
 
+csi2dc_probe_disable_pm:
+	pm_runtime_disable(dev);
+	if (!pm_runtime_status_suspended(dev))
+		csi2dc_power(csi2dc, false);
+	pm_runtime_set_suspended(dev);
 csi2dc_probe_cleanup_notifier:
 	v4l2_async_nf_cleanup(&csi2dc->notifier);
 csi2dc_probe_cleanup_entity:
@@ -746,12 +751,15 @@ static void csi2dc_remove(struct platform_device *pdev)
 {
 	struct csi2dc_device *csi2dc = platform_get_drvdata(pdev);
 
-	pm_runtime_disable(&pdev->dev);
-
 	v4l2_async_unregister_subdev(&csi2dc->csi2dc_sd);
 	v4l2_async_nf_unregister(&csi2dc->notifier);
 	v4l2_async_nf_cleanup(&csi2dc->notifier);
 	media_entity_cleanup(&csi2dc->csi2dc_sd.entity);
+
+	pm_runtime_disable(&pdev->dev);
+	if (!pm_runtime_status_suspended(&pdev->dev))
+		csi2dc_power(csi2dc, false);
+	pm_runtime_set_suspended(&pdev->dev);
 }
 
 static int __maybe_unused csi2dc_runtime_suspend(struct device *dev)

base-commit: 50d05c7c76c96b90462f24debacca971d2e86713
-- 
2.47.1
