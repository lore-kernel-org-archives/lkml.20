Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5C75353A6F
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 07:53:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788767589; cv=none; b=VkCx+7iOVQCqAKFyCVXEQyBTtVknAvGo5wcpUjKSGwuphziJJDtH7i0l+Re6gDPgW4KFOl5O0GnwmgwYi0g8M/6Y4vHpmC5UQ5LacNjqvCWjVA2ZaZnLTwiq4BNqLRlOVcI03xvvkBBowYW77n3Og1m6LzAJI8AydPJw9vXKj5g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788767589; c=relaxed/simple;
	bh=8xX4xD5K8txlJzZzy3xE60HFJ1/eyfY0yVprq5JvpsE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=UZ+Kfglm/SGfvnSgrTA8joHHAIwvg40pegQRCZQTXF6Iuj4y8M0I1A/e/YuSwemLAXgdxGzxY5CV8poA1fRjwaq32clHDu1n1PYZsfA7WO2yjMgMvCnxB+mu3ZM/cMkPjwgC6VuYPVsWvneOWKjgOZ7Kch+S/y4aqKjUQY1PTfs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ep1Tx18j; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ep1Tx18j"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-48436251906so3668105f8f.0
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 00:53:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788767586; x=1789372386; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=LWm7EBXqtORA9y3VkC/oQd5/rS2zUBKOaOuWn3r0D+g=;
        b=ep1Tx18jyIQPuEw0cQvZ2oukB+zqkafC8tXbTcETS1G6khgPISddG83yOZrQkg7JDl
         1novmlb5MWM/0NWKXZABckTuALgUHzLoQzpw+knGslzU/zOa4qRo9aEUgXwxxo2G7/N6
         0XtCbt6VMjoovgLMf7ejhhubVFDU3FEGPoKS5cX9wnoZc0h7tzeI6H+RowGvuRVSFM2j
         OngLXlLKpRfuZ6ok4kvi+soTyU4qByLLerVrlidGLSy8tss6PShsyL4CCshCiY/qWQKe
         W4U0DqzRUGH8gSjwJZMDO0kQKCuvhNJ8QA3835TsaGWou6zZ4nfH1g1t4OxcJQy7SFWq
         hMoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788767586; x=1789372386;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=LWm7EBXqtORA9y3VkC/oQd5/rS2zUBKOaOuWn3r0D+g=;
        b=obqMofeYV4k24e3Lwxg8c12R54jEm4Gc4jD7Q2bdxcmOxItB0wnO7erontDA1H9m8C
         opyFrSsngOcbcuDdv654vgXGgmuOHDReZQQlFHlURpKiwafKPgsNosXMkW40B839EGXg
         VVtN5tSyJNXcLIzIZX7IjRhEVkZx8pmCmJ0z6A0MTfEAdgjdzzqox0BIVQ/uD+zmS+jH
         ddBJ2ET+YoSvrFuwkQYjdIYiajqn11wAZShvAFDVneM6pFPj5Nm/0DIh/MeNqwh1aZyZ
         6GEj4WSRvv9YQYxNQr/Papap6PFof4dNMY8wa85z0C23+ijXC/qMy5l019lQZVcQ+qqK
         VRaw==
X-Forwarded-Encrypted: i=1; AKwUvBxSJi3ScjXbQ6B+CXDvEO3t0ONA/2pVqiSzaKXgOqy/B4g2HArQ7ltVWa8BBfiSxlrS7EkwFZf0NMjrnLE=@vger.kernel.org
X-Gm-Message-State: AFuF++mpT5c4Yx2UXBdbgZ4BS0y6Fobo2w/UiLJBXuer/oKofynfv3ga
	KvtgJG0/myxQs+osovlgL0TnXgZgE45H+0Z8B+ByeRKJi3aGSD7IW6Fr
X-Gm-Gg: AYBFou34qXCOqWLQlwfmTim560oN78LARhCXqpu/hXfNha93g6D2iuqUE5lkjxG4SGN
	UZsqUMNeHP1wLE8nXF1h9zcVJtTJqbuDc6jsYXJqdpOT27vwmfpqXvC6kc4huWMAQtuyp28AIA/
	HWQdfTkKNBnURrVeI8JRhULAgnyFNnU6cFkBeEysE58Us6t1qfQoKg7i2NxlLDZuNR3Qt9Okbny
	J2dDEaoalnVrRwjbYw9CiAyx6/0p3c2Urse0QfYU29HWZ7zkwLS/bV6spj3DFGc5mZ1OXpZPCZd
	l1CaFITMOChgDJND8dlrKetcE11RCBoiab+DhK+dPnXOf4dXTAhsZuC6Vdhw+4f3jlWPw/6oMdo
	7fWeG6bjGP1zbjW6Kquxm0sRLFvdxigJjjv5GjR0+/rhPTU5cnZ8UZYgyClOL7TxdpHQmwrld3v
	Xxm9MZt03GtqNOGAu+s2il+B201VH9Zib60aeGiEJSyN/QkHJG/x7ZCKdPO1erdMdstH1CUPViI
	osAGsxFHJbonQ4UMQu4ws86vxdjIhjB1W3dlyOBShAKr1g=
X-Received: by 2002:a05:600c:3f12:b0:49c:c8de:96a9 with SMTP id 5b1f17b1804b1-49cf7fdd2dfmr411193075e9.2.1788767585604;
        Mon, 07 Sep 2026 00:53:05 -0700 (PDT)
Received: from [127.0.1.1] (lmontsouris-656-1-83-121.w82-127.abo.wanadoo.fr. [82.127.110.121])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cffdb2c40sm168377745e9.1.2026.09.07.00.53.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 00:53:05 -0700 (PDT)
From: Amin Gattout <amin.gattout@gmail.com>
Date: Mon, 07 Sep 2026 09:52:45 +0200
Subject: [PATCH] media: synopsys: hdmirx: Remove redundant dev_err_probe()
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260907-snps_hdmirx-v1-1-760dccc4664c@gmail.com>
X-B4-Tracking: v=1; b=H4sIAExtnmoC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDSwNz3eK8guL4jJTczKIKXfNEY4Pk5GRTs0QTSyWgjoKi1LTMCrBp0bE
 QfnFpUlZqcgnICKXaWgBTN6fBbwAAAA==
X-Change-ID: 20260907-snps_hdmirx-7a30ccc56a49
To: Dmitry Osipenko <dmitry.osipenko@collabora.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, kernel@collabora.com, 
 linux-kernel@vger.kernel.org, Amin Gattout <amin.gattout@gmail.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788767584; l=1228;
 i=amin.gattout@gmail.com; s=20260818; h=from:subject:message-id;
 bh=8xX4xD5K8txlJzZzy3xE60HFJ1/eyfY0yVprq5JvpsE=;
 b=hgTm6Y51CD9FAcrGJmyN5tMTgy6Mf3aon2rY7fbe7pVWabcFvJdMBlZcx/ANLnHPglvXUOfPS
 UknZVY669m+AZRFG7zeDvPD8F7iEvqWiBO7523gnxTyI+PZeDY/lf6r
X-Developer-Key: i=amin.gattout@gmail.com; a=ed25519;
 pk=MSIqDPkCOkwtyP8Fns1m+KFU9SgqoDl2mpLe18vL+hQ=

The devm_request_threaded_irq() function now automatically logs detailed
error messages on failure. This eliminates the need for driver-specific
dev_err_probe() calls that print generic messages.

Signed-off-by: Amin Gattout <amin.gattout@gmail.com>
---
 drivers/media/platform/synopsys/hdmirx/snps_hdmirx.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/media/platform/synopsys/hdmirx/snps_hdmirx.c b/drivers/media/platform/synopsys/hdmirx/snps_hdmirx.c
index 25f8ca0d6d94..b456138c381a 100644
--- a/drivers/media/platform/synopsys/hdmirx/snps_hdmirx.c
+++ b/drivers/media/platform/synopsys/hdmirx/snps_hdmirx.c
@@ -2595,10 +2595,8 @@ static int hdmirx_setup_irq(struct snps_hdmirx_dev *hdmirx_dev,
 	ret = devm_request_threaded_irq(dev, irq, NULL, hdmirx_dma_irq_handler,
 					IRQF_ONESHOT, "rk_hdmirx-dma",
 					hdmirx_dev);
-	if (ret) {
-		dev_err_probe(dev, ret, "failed to request dma irq\n");
+	if (ret)
 		return ret;
-	}
 
 	irq = gpiod_to_irq(hdmirx_dev->detect_5v_gpio);
 	if (irq < 0) {

---
base-commit: df2908090cda368b01ff43709f51890076c56157
change-id: 20260907-snps_hdmirx-7a30ccc56a49

Best regards,
--  
Amin Gattout <amin.gattout@gmail.com>

