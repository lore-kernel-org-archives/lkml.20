Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com [209.85.219.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 376783CF049
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 02:13:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789438433; cv=none; b=AqoXocDXdNZa5mt1HhbDcKbuqmuFeHrjg6o1+PRK0VTrUVm9Dz5crxgG0pThLo5Y3jV5/GW8uA0ruDGcEYQwRQDZWb8qBpPI/S0+w71hfqA4RHJ5CqDhDCWVVEAQlOBfdRHqbDT+Ifq5vCQFLdF/U0WkiZ14MUcNkNT0ZPA4NPU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789438433; c=relaxed/simple;
	bh=XQuSQ137DUmjJs4vhjNv/rFoQoHzrImIZp2orhXaMrM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=bniY7Q2+V2B/xx2uUkQnlrAifUzD91pcq8V3Xop9NApsb09ILZitvY58hipZlto3plfoKUietuIaBsWrNuAEfL9qR5jDhdxE/YJD1RY50hzQEGWn7jgtaeS1beFVMDX7jdLp+acmC0aGOVWNMRoOtRDOh87GoIz1MAVK6XSptLw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ArpeM/M8; arc=none smtp.client-ip=209.85.219.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ArpeM/M8"
Received: by mail-qv1-f41.google.com with SMTP id 6a1803df08f44-90cd4631090so4997456d6.1
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 19:13:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789438428; x=1790043228; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=sW7+JeYuhnmm8ntFAHs80fMLHHnC3GGrA2lFtY4r8iw=;
        b=ArpeM/M85b8EZF6euTPV6Rxx4QF4QCU6Dtggcr3tLBTgOhody2jmtYEoF7hi+fOWXJ
         u1eusydnC/22oU21g9N/EcnkxR5ySZHVyMfuDMpBx66cYJECE4aRO1YNjVVl1osDBNSd
         QEBo1EnO0mY6db/OOnn8wRGgX5je24CKPARNn2jDLp6zcg1GrKcMqdQh/sEQJXTtyzum
         taoFIqWDsy7UI4HdeacGNxZgzJS3P2guvSE/iV4jKUvcEfARurTHd/ShaN3paXvK3eqQ
         8Q3yoXBNWS3I1naaEGVmY5480qCjgG/V660zPB/qQ6RqJbIyd1RdnNweQAny/sjTEV0k
         JRUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789438428; x=1790043228;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sW7+JeYuhnmm8ntFAHs80fMLHHnC3GGrA2lFtY4r8iw=;
        b=JKhWwqWx+NnfKvZXvKcumdajzApNE8u/hJItnVabgM4+wmpuvxrJJP405HbJbrwktB
         I+7BJsmMv/XmeO3cZzUTNnvR3TL2DBljDF+FDg6VqIihqvddGV/pBGNkndWLxaJ+AEIO
         B/au3/liaKvJ4UXLmhm3E7GEYrZgxzfBljcgSpyDDVSSNpT2FJy+Rq0OHG63TrEjuP7T
         XhQO4X6qCsmBe3ge7zE3W/+gqv1TGS6NvExozY6ffG2dgqQXDvufjCuu1gXx8Nv5ptCV
         ZkCS7F8OxW0hnO71+/ZxQs+9BQStVIVaVETDAZ+gTjmZP5dPS8CRcviQMJOnYMUPzERY
         kKqA==
X-Forwarded-Encrypted: i=1; AKwUvBx99f73WX3L5qqS1gtVwR+ZyU6EyIozvaoyPUAtmAxMJ3deCF0fI2uJz6ivtzUC7fom6qZjOnIDsKVwI2Q=@vger.kernel.org
X-Gm-Message-State: AFuF++lhs8+EcGA3MlQufZqA6C8VlnaH/o3N6J4jD3KbO5G2nJPNogqW
	M9N27EGRkYVSLzlxn7JYANh8C9f+Pnb03O1PeNyY6zsk0D4lERjOf6bWk2N3Ab8lFQ==
X-Gm-Gg: AYBFou3206gHTwsx5OCM7EM4GKq0q/PtotkKGxedstMbkAYffdETlwGWIrxA3mu9dJh
	CE7G9QLu8QHpWbzZeXuJRk/A0r5iKOBVZEbDL9wvCskVwx2qeV8hbZA2cCQPyMTUPLTGqipcSVT
	phrpHgsTg03tVne8UUS5HCggiG15PFbiUMRJqYHL7cPn+qDG4uWYlXNcZETmsEuhI0ig5RVU9pv
	y1Qv9MmLj+fNlvTk2tIx4spkQSxDF+T8EwX9fRN4VUoKOrSTC41cQcRsoqJhuF3gN1xdhAmc2MA
	MXfbo8RpVy6jG+v9B3Vr9C6UHnlL0eH5ysvRcHG9vIM1ZexxCwcxuJIZYwGDAxJCWyhE7vlMoYW
	QmV464wN0YQHp8XkMZz3+n0BG3dGnysIn3OKg7bnNCWB+7xmc2fthLc7GeSE4JBtZ8AmS1OHc8P
	BwfYrukwQ3dkRmslmKT4NMxJIxfq+KM/nXFHWhY1GCJQbITu9wJdv4olUSpeUJTYnl5+WhazuDI
	B47xpYtVWB7qa6wh7Ukfv7PJy9R00t+y/tkflrrJnHYWNRbFbLCY182SSIEBCl1LgXGtErGFtvB
	RsiMjQozCp94HYuockPLz+IUTViW84xSaOu1sdQ2Cd93ZhNWh4Fd+1GXGEllyCpQ
X-Received: by 2002:a05:6214:311c:b0:910:3923:cc6c with SMTP id 6a1803df08f44-912343f288dmr28143126d6.21.1789438428254;
        Mon, 14 Sep 2026 19:13:48 -0700 (PDT)
Received: from 6e-wmo5420-02.ad.psu.edu.net (6e-wmo5420-02.ad.psu.edu. [104.39.213.233])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9122cf9ba03sm34230136d6.32.2026.09.14.19.13.46
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 14 Sep 2026 19:13:47 -0700 (PDT)
From: Myeonghun Pak <mhun512@gmail.com>
To: Hans Verkuil <hverkuil@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH] media: radio-maxiradio: balance PCI device enable on cleanup
Date: Mon, 14 Sep 2026 22:13:39 -0400
Message-ID: <20260915021339.94468-1-mhun512@gmail.com>
X-Mailer: git-send-email 2.47.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The tuner initialization failure and remove paths omit the matching
pci_disable_device() after a successful pci_enable_device(). Disable
the device on both paths, after the final hardware access on removal.

This issue was identified during our ongoing static-analysis research
while reviewing kernel code.

Cc: stable@vger.kernel.org
Assisted-by: LLM
Co-developed-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Myeonghun Pak <mhun512@gmail.com>
---
diff --git a/drivers/media/radio/radio-maxiradio.c b/drivers/media/radio/radio-maxiradio.c
--- a/drivers/media/radio/radio-maxiradio.c
+++ b/drivers/media/radio/radio-maxiradio.c
@@ -159,10 +159,12 @@
 	dev->io = pci_resource_start(pdev, 0);
 	if (snd_tea575x_init(&dev->tea, THIS_MODULE)) {
 		printk(KERN_ERR "radio-maxiradio: Unable to detect TEA575x tuner\n");
-		goto err_out_free_region;
+		goto err_disable_device;
 	}
 	return 0;
 
+err_disable_device:
+	pci_disable_device(pdev);
 err_out_free_region:
 	release_region(pci_resource_start(pdev, 0), pci_resource_len(pdev, 0));
 err_hdl:
@@ -180,6 +182,7 @@
 	snd_tea575x_exit(&dev->tea);
 	/* Turn off power */
 	outb(0, dev->io);
+	pci_disable_device(pdev);
 	v4l2_device_unregister(v4l2_dev);
 	release_region(pci_resource_start(pdev, 0), pci_resource_len(pdev, 0));
 	kfree(dev);
