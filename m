Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86FA84E06C0
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 13:36:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791553006; cv=none; b=Ra1hQVm9MKmTW5NuWWa3M5/YTad4sT09tiJn8FcftVzTPNFRImazyxx11SznK8LMFXyednwllbLoohswkWxFV11BjRYfAG6kp5I7X/q6/p/KfYRPqUy3ugiRvsxVmxoSia0cVPHKplUfxTMnHbMcfRsxEnuZVCHzIF16/Tqar0s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791553006; c=relaxed/simple;
	bh=eY2CrKExfBVzr2gLJRsnKuiIPRNIod5nXcIPeWWekEE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qkOHHkIxvK0E+H/DCBfbh53P0/rR3qb3A2jyKCo9Fguu7UAWJbgPIXvEXupFsuNWaYh/PS3a5VIcJr0C0mPsiyQ2t6eIwk45WzqWnVnShdCcPbjZerzIIs6/E63LD8PRPIlzSpoi/2GpivGdzVXLtOIFwkncj/X6OuTcR97p9YE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=aayushk.dev; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=aayushk.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2d560775ca2so20827315ad.1
        for <linux-kernel@vger.kernel.org>; Fri, 09 Oct 2026 06:36:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791553002; x=1792157802;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=TfDTHpkHQvdcJwwHuBnkpdP8BzhFOOL5NGXiKFdpigM=;
        b=P+zO00zAqLpVm8eJZS4TZNKVGyDA0cAPc8eBxgSb5pNBLiNBJZKQOVYpbtADrX6+ih
         dM7mziV/0DlWqbOnmlw93zH9NvanJGV4ef12I1/Cyfi5v21ea13729NrYpXT1uPnRO58
         tUr4YzNTPvEsSB9EdjeV2dm1UsoFjBKTl7dIB1Kn3s5BOvCrqH2nzcKvAYXz0+TIlszy
         EIZc5YbHYZ8ASW/XEzDCplm0BF4idrCdIEnmoHK5u2EXaZCP/7nHQQnGlpYlfQUTWx7r
         TMcEFnAtFGWUjzRhdbxtAD2wrzP0dqwJcrNY1s9iaTqAm4VkKohBnohvTdYznrf34Dnd
         YkQw==
X-Forwarded-Encrypted: i=1; AKwUvBxZpIcLXHHRWqY77Czhr8wM8y+oGedrDESGiCu65cQbfuuZ03SGPij/iD9IaFZDO+h5lYKxD2cGgggDobA=@vger.kernel.org
X-Gm-Message-State: AFq9FYL9PRN3xAoSO9USmltE4Hj9LNiUQYkY3q+5EgHLsPlUss1Ea9Py
	jEj8E2kN+8jQk8qoBE0hpVHQuRtbpayI8igFj5cMVWk0DJbLuc90VoGX
X-Gm-Gg: AYBFou0F2tjOjIHGS5A9VNHHaFSoalcni1eRIp0MIOnuKbKsCDTtQ2yg3T3CzZ72z6F
	dioZrB8G709s8VuL3PV3GNqwuazRRjWKi+uo/TV5zpJN99t+VydLMOJRxXZfHEFZDGXEzbELBRw
	fKZzhDaUvQUweC4GJ7HaWe8wMzhsXebrKMkJBj98MptW+cmMl7PDGlr1aU5/X45eNjVejQISVC2
	942YeVYtFCu09VUxyhZmbH6oNTrWwA4Zgn7QCdcgF02d1lviPmw9Ycw5LC7LX/asIidtMwIVxaJ
	tXx0n0nR8+fybHUBCeztXw//OuxGsaDxzBN8oJvIJMi+4dgsJzrnvQ/i5fbENnDJ0VvxD/enr0q
	slh7O3YFPj+2Ua1LnsiAlhubpACmX5fh3DlfLAizNEkctCD6CMnUJxXPajaOBaqk2Un4HGYLiuR
	EJPrSbESTPkT2NRQWEodSOSFxTSa6IY2YvZ9OA1VhDfW4tppxVeCqqkF0pw3Q=
X-Received: by 2002:a17:902:fc84:b0:2df:8909:f72e with SMTP id d9443c01a7336-2e8427effecmr17322405ad.3.1791553002460;
        Fri, 09 Oct 2026 06:36:42 -0700 (PDT)
Received: from linmach ([182.156.30.23])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e841a05f70sm9260455ad.7.2026.10.09.06.36.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 06:36:42 -0700 (PDT)
From: Aayush Kumar <code@aayushk.dev>
To: broonie@kernel.org
Cc: william.zhang@broadcom.com,
	kursad.oney@broadcom.com,
	jonas.gorski@gmail.com,
	bcm-kernel-feedback-list@broadcom.com,
	linux-spi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Aayush Kumar <code@aayushk.dev>
Subject: [PATCH 1/2] spi: bcm63xx-hsspi: Use sysfs_emit() instead of sprintf()
Date: Fri,  9 Oct 2026 19:06:30 +0530
Message-ID: <20261009133631.579644-2-code@aayushk.dev>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261009133631.579644-1-code@aayushk.dev>
References: <20261009133631.579644-1-code@aayushk.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

show() should only use sysfs_emit() or sysfs_emit_at() when formatting
the value to be returned to user space.

Signed-off-by: Aayush Kumar <code@aayushk.dev>
---
 drivers/spi/spi-bcm63xx-hsspi.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/spi/spi-bcm63xx-hsspi.c b/drivers/spi/spi-bcm63xx-hsspi.c
index 25f169a2a..824e36bed 100644
--- a/drivers/spi/spi-bcm63xx-hsspi.c
+++ b/drivers/spi/spi-bcm63xx-hsspi.c
@@ -152,7 +152,7 @@ static ssize_t wait_mode_show(struct device *dev, struct device_attribute *attr,
 	struct spi_controller *ctrl = dev_get_drvdata(dev);
 	struct bcm63xx_hsspi *bs = spi_controller_get_devdata(ctrl);
 
-	return sprintf(buf, "%d\n", bs->wait_mode);
+	return sysfs_emit(buf, "%d\n", bs->wait_mode);
 }
 
 static ssize_t wait_mode_store(struct device *dev, struct device_attribute *attr,
@@ -188,7 +188,7 @@ static ssize_t xfer_mode_show(struct device *dev, struct device_attribute *attr,
 	struct spi_controller *ctrl = dev_get_drvdata(dev);
 	struct bcm63xx_hsspi *bs = spi_controller_get_devdata(ctrl);
 
-	return sprintf(buf, "%d\n", bs->xfer_mode);
+	return sysfs_emit(buf, "%d\n", bs->xfer_mode);
 }
 
 static ssize_t xfer_mode_store(struct device *dev, struct device_attribute *attr,
-- 
2.56.0

