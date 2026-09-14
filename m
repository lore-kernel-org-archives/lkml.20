Received: from mail-qv2-f12.google.com (mail-qv2-f12.google.com [74.125.230.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 933C11E7C02
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 01:37:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789349838; cv=none; b=awGjq3zTRjMeAAIXwqljtSUOfKaC68xOGuo6PtMMYdG9B6AqFGJE5nt8a0rESRM92azH/4SWYJUJCQQ+X/NHJ2oYwhoNO5CoIJqe497SY+neyjU8Kenrhwv/Zyg3UfsgYUrkXEB+FhtK2+i7omDG9GWeSys8RRTBaIS+rFkVHY8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789349838; c=relaxed/simple;
	bh=+v1rkjMl8Dk8F9b/8Yn4mlrfNxvrTeYq7/TR5qmLoyk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=WrCxw6SPhgRk/y+aoXiKTQGFWwacS/nWQRl6urG/9mX32QBeWGY+B0mTmrBM6e2iRV98HwmkWW53I4xH7LjCLprIvfi4RrN+FBvBKLQnw24fwXmUCwNFkfAI91ndU6rNIkJlgTql4znlpVjrCiOAUsvsmERAd/rWTHqR50VHyTU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=J25VJS7N; arc=none smtp.client-ip=74.125.230.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="J25VJS7N"
Received: by mail-qv2-f12.google.com with SMTP id 6a1803df08f44-9102eb7d57aso21842776d6.0
        for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 18:37:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789349834; x=1789954634; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=/toox/sEIAgy69QCwA7fzFRnXlkL+BXk7kS7eLbkjDw=;
        b=J25VJS7NdxxkZQhUY9ck+B22q6tp0P2K5wN+v8wgiLainKsx4S+hAB60bwELqtXy0g
         EdCb6D9niNI8XXNQPncz0ow6FOb3HR419fS0EnFaT8YMOeM4pkOgVGmywPbJXaDygP+8
         uR+mq2K3XGgG82hUxKn6vG0zw/DezL7tGkwKpeXtARjEsl/gKQgbdI2Wo5HBew7NpJC8
         oVz6GSpjvsVE9F6UVJBICBmTX1B4rnGzwSqlmy3DLlw4oVg6hxgIhqNjCNhmq9c6o5Z6
         w1/mS1z+3IFLqZ8YyxeF0AT/NIug25l/wb/6uefn8gxpTbGBThyC5SyhT6/uusmLpK12
         +nPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789349834; x=1789954634;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/toox/sEIAgy69QCwA7fzFRnXlkL+BXk7kS7eLbkjDw=;
        b=bjM0mAifB26JsLkjiTQtOdMBzvHQNwS1jxz5tSDXjtrJJctbxPGMAxXlwmtzd4MTtN
         p9fRQf0PzWeCBjFL6thMhGnB+mlor9MqvKDaeb0/aVOCyWgD6Lhb+LPzJtEWbOM6AJ+k
         XvrI9Fj3aPlUHWnp6i0wthIKs8VLwT6NaVsNvfp5SnMi7H2mRRFdLaN/Ih+b+skpQClE
         z36KoEW32Uu5hEx0E3RKg4bwHnhLhJWxsl+NQHv85c24fkcmL+cjhj0Y6pmI1OO/G1iU
         Oa7AnCC7J11CjQkzZGIHszNA5mVFlQk5r5dqSsqTZ8LvQXJv/XlX988lYGvpxjIvBz1h
         blRQ==
X-Forwarded-Encrypted: i=1; AKwUvBzpG81VZ8kwHNN0aEJzisuciWDysx7kNQKn6oircKHieEryoGcm2d461fuqj9vOhtvomVXm8VWc6p7Mlkg=@vger.kernel.org
X-Gm-Message-State: AFuF++nBVeUAx85cMbmWpk4Krhh8ZkzNZkiTDBWaI2Pb/MdgwUfCVi8E
	wBFbrz0PrmQ87cyW9xg/tDrmYzZGxePlz7Kng63YNZgT4bE21yQpnAE=
X-Gm-Gg: AYBFou1EnIvMwcBXN+Iicn481JelJPHNhX+cCqovnen7isyyZDKDzTPfVyAGIEfbVKI
	OqSIPq//2fwUCVNMIyiSRuHOo7Xri7cQYxIpxXeXHjCVX2IKl+htqAtyHVn9WcIM8wal8Pr01m+
	1OrUsixRk8WGmbEG64rmiuzC1rguRHnj7QEZrobMHhq7hBeOFLPpZWL3nk0mzauSrj/+9Pe+nzX
	5ta55A4SqApHBAcZagGNbQK/H19LGcOjSd0GGoQ5nTlQf2Z2xT+A+bImsAZ+b5hH3VHIK+y56vP
	YxdmPY4u+joMAR08XBIuqAFGH8XkGXFJi/eNMYENMBO0ReGlLE94zwkpLZrhjvE1ejMh5eCX7j5
	I0OnIIVEcnZvo7+p7xdEJKUpHsyYroIhw7fR4HZG9hoz9O4nTGSE08DRwPaXmHFyBWDC4DNBbMJ
	krXNtcL0R9IZ1jDWK4EH6MK1Ypg4wpog3T7006Nbc19KguT1XkVh6AwilSrVOXUrT35SkZlMRtn
	BO3YTSjxo1b/lgs0SrUU7m52EAtuDrLV+096GImTGXD4xWYOkxq3bW5p+YnSbXANZl0PbH9oK9w
	L/nlWDWvgU0c+W7f32GzdZvF69QLoimVig==
X-Received: by 2002:a05:6214:860b:b0:90e:9d05:b757 with SMTP id 6a1803df08f44-9122e148035mr9798376d6.0.1789349834523;
        Sun, 13 Sep 2026 18:37:14 -0700 (PDT)
Received: from localhost.localdomain ([104.39.73.78])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9120f4d3779sm82134856d6.43.2026.09.13.18.37.13
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 13 Sep 2026 18:37:13 -0700 (PDT)
From: Myeonghun Pak <mhun512@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Oliver Endriss <o.endriss@gmx.de>,
	Ralph Metzler <rmetzler@digitaldevices.de>,
	Daniel Scheller <d.scheller@gmx.net>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ijae Kim <ae878000@gmail.com>
Subject: [PATCH] media: ddbridge: Disable PCI device on early probe failures
Date: Sun, 13 Sep 2026 21:37:00 -0400
Message-ID: <20260914013700.51804-1-mhun512@gmail.com>
X-Mailer: git-send-email 2.47.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The DMA mask and device allocation failure paths return directly after
pci_enable_device(), leaving its enable count unbalanced.

Route both failures to the existing PCI disable step, after the cleanup
that requires an allocated device object. Preserve the existing error
codes and successful probe and removal behavior.

This issue was identified during our ongoing static-analysis research
while reviewing kernel code.

Fixes: ccad04578fcb ("[media] ddbridge: Initial check-in")
Fixes: 22e743898dcd ("media: ddbridge: bump ddbridge code to version 0.9.29")
Co-developed-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Myeonghun Pak <mhun512@gmail.com>
Assisted-by: OpenAI:GPT-5.6
---
Validated with an ARM64 W=1 object build and strict checkpatch.
No hardware runtime or probe-failure injection testing was performed.

diff --git a/drivers/media/pci/ddbridge/ddbridge-main.c b/drivers/media/pci/ddbridge/ddbridge-main.c
index 248ace2..591a43e 100644
--- a/drivers/media/pci/ddbridge/ddbridge-main.c
+++ b/drivers/media/pci/ddbridge/ddbridge-main.c
@@ -172,12 +172,16 @@ static int ddb_probe(struct pci_dev *pdev,
 	pci_set_master(pdev);
 
 	if (dma_set_mask(&pdev->dev, DMA_BIT_MASK(64)))
-		if (dma_set_mask(&pdev->dev, DMA_BIT_MASK(32)))
-			return -ENODEV;
+		if (dma_set_mask(&pdev->dev, DMA_BIT_MASK(32))) {
+			stat = -ENODEV;
+			goto fail_disable_device;
+		}
 
 	dev = vzalloc(sizeof(*dev));
-	if (!dev)
-		return -ENOMEM;
+	if (!dev) {
+		stat = -ENOMEM;
+		goto fail_disable_device;
+	}
 
 	mutex_init(&dev->mutex);
 	dev->has_dma = 1;
@@ -237,6 +241,7 @@ fail:
 
 	ddb_unmap(dev);
 	pci_set_drvdata(pdev, NULL);
+fail_disable_device:
 	pci_disable_device(pdev);
 	return stat;
 }
