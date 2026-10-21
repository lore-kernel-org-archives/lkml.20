Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.125.188.123
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792574500;
	b=tN8r+5w07HkMEdGhYT+HNpGQDHPrwQN2egmN44WVU6e354p5j1FwBXT//4KbEZrmebGj
	 lWwWTB2cLxH8UXRqU+zj07T2WBP/sFvXcnoxEOIeCDVnW9H1RtoYnO4jhSDjySROeBX+J
	 Ak1AN4pFECGK7bCAxFY5Gg/6E+fF/sUqsX9G5lGJjnQmfokktbmknoyOQEtgh3VRta19U
	 I3ZRhq+t65RDqDNMNp1wla+8o8K61jtIej+QjLnQTPbFCm+jiirtiQb6oLSMWhAgwGiRz
	 J9NPi1v4MArjPhHZjRbE1KbwWpJbeB/Jvl5Q7im56jd+9D32ZY18NFEVhdJlNX34ynQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792574500;
	h=DMARC-Filter:Received:DKIM-Signature:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:From:To:Cc:Subject:Date:Message-Id:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=pjLw4ni01XCQ9bFFwFJPEpPhHyB1Fll+ofVTTD9NfnY=;
	b=AWyt5XFZicd/mCcA1hwUuVOhg9/3RxRCTG7tvkK+rlDYoxDpt0z+F0C7/XNIUMj9M9QD
	 cimMA09xArEECioiTFfLyHSTcxkrt6FAzyoippaX0pciZVs7PxyUdFqv91RlBEkInCmhT
	 BJtl6109focoM3tBMNH140ncRKtAWz30R8ULDmjD8uJnaWk1Czh78v8WFwN6hkTfV83Cc
	 WnR5mV/8oVwQJFjrorgYXyFus7il4J59nidX+gQrpwRlV2U9rj+XMcGyDOSg087mjm4VK
	 DupOxbaL+kcSRFxKW0aQqfleZ8Udaa7Fv6Nd0RRPf5Etez5D1qpStWLrEy+3TUz61ZA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=canonical.com;
	spf=pass smtp.mailfrom=canonical.com;
	dkim=pass header.d=canonical.com header.i=@canonical.com header.a=rsa-sha256 header.s=20251003 header.b=NauWSat4;
	arc=none smtp.remote-ip=185.125.188.123
Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9842606A31F
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 09:21:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A9842606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key, unprotected) header.d=canonical.com header.i=@canonical.com header.a=rsa-sha256 header.s=20251003 header.b=NauWSat4
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 4FB533F9C8
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 09:21:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20251003; t=1792574498;
	bh=pjLw4ni01XCQ9bFFwFJPEpPhHyB1Fll+ofVTTD9NfnY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version;
	b=NauWSat4jEfzc48kmw63vJ/WgcO3hRVm4qEQ/W71yd/Gr8GrG5jYRvRNShZXaLtGH
	 OBB5JG/R2gsAqGvWJDFhPQI2/4LwqgjgdqH8RLm+nEBevYCA6rslva1b+r0fV3n88L
	 3ysewhYq0MjMDGefkuiihWlohvy6px39OBxY8yUsieF0GHyrdeEaqbE0msNyXLJZld
	 DPHIjuVY8W9i5xkRi6nqxs+JoiNEm9dJn4DPX+hCF6sTpOlP541IHK/ORArFAWooTX
	 J6l5pccGCoIyMVc1Wllt//qHFIXlk9n3GhXIdjRWPpV1XfbiocwIn5XZXJi41rCK/J
	 cDWevXsOuXBznK6rw+XlNPyW9+rNwiQvId3FQb511SQygifwol9DP0GhJyEn+r2x9L
	 ZHU4rIr/M9Hr5JTQyE6irQ/kEWGsaEh5ppqhsMzIr/GAmqpum6lvpvuL7Gl7Blcg4/
	 D9ukvGW909Bqp6KvYiAgzgYviUTlRbAJKlGdsgteHc3xU8XSG6pdlvbdTA2gwDi3Ur
	 0GLVHJCKcMNuOTiKvXQn5tOZi+BY2tdvFKW0rGDYpBEMnpWSoGZdL2MpGzGOvFpA1d
	 wnyVxQWZD1dMssFBM6hItzXxPJ5zcxZJprCIvuNzRgAVrZ3OSDxoMOPfBEw40yOlrk
	 nQdO7Kkaa9e7rEwESEmDF/s8=
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2e93d3a7335so1246775ad.1
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 02:21:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792574497; x=1793179297;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=pjLw4ni01XCQ9bFFwFJPEpPhHyB1Fll+ofVTTD9NfnY=;
        b=EKBc7lRq+jHzahaekKOWP3hJ/sOrzgYjUMQfaSR4aeRn/4gsJpYXyvaNsqzszLpT/b
         5o3u7lJvhoVR0+JIHsdFxIEBHZMTzHwyTJlrcQSn1PTOxysEzq3AXyuDMjJgtyH71NBL
         nbJod7HU8dIXBMC7pFlyMm6nrzCnpGLfT/nBKAiuUAYJzK8ZLMbr9RNnEYodC0toS3gY
         E/daw1WOa+7H86HwIEYIfOqOfEaxzd1zCZwPru4byDuW5HH3i5cqdKq50t2VCyVn7cOh
         3UQymj1NPwKlK9qV+jZ1kJhuXZz5dBCOLzWbB2GAa9RArej/GJIcJZigd8GSFkBO5ir7
         VWow==
X-Gm-Message-State: AFq9FYJmLRNluXwVPGh+h6TGZ/XMUSNIJrhFwJOZ4CUB2/4oFgWNPCgH
	BiFUEdevEL6+/TyNT1ncKL8u55LItX7MFkH5xbLBlqK7T5pxmuDneA/ldNGuMgcXadZmhsKBQY+
	a/EcU36DgQx9+Lqodiqj6wIxOcpX2dSDKWPRuUpTv7fZoFxNewLyfH+F40Wg5OArmNbv+oVvlkF
	mq4kNLgA==
X-Gm-Gg: AYBFou2XTpgsqJ2SLG/GHvau9ihxXkPybaTupJL8zEDfsylx93mapVcjJb7K11wVFZ0
	Fn93dED/NQPc8t225TNZF9DEohV/1PT+Gai1jyxM3KbA110aHDlXV6iqtXoU1/pMaWKaQFnpgO3
	v1bxqaLd6w3Yc88Va0b6dE2VwuNJymaW4JkZEaVfBwfKQBJM9SGTq5DNyX90cYuAag/OI7mg72o
	9P7GjyuXL3KSsbwDxHZxmRZqvtyqsmNheysH7hcm4L+DJvQwaUBgIQTEiDIZ3oQ2Hj1oj7K5EcW
	8bGTMJcUJVK3jcuVUM06lDzq7Yj5mvMngNdU/Qjxvr9lqpN3A9I+iKgd2pZlbsp35uAe2SPH6jT
	d5/ExsQu1zV7jx6Jla14vgdTr8CsBlcCJYOaUU4S1/mhi/vjrfnzlSmOY2ni+Vcg+iJeyUY1oml
	1mfL+bk0DEGw7LdUjKGksL55+1v2Auh//iNMDVRMfon1gHrOosyoL077CTKCg3tVK0dkyqRdBMo
	ylGuqe8tCgsZ7ShyQyhJ+zCsjJMNnF8ziXoklRl4g==
X-Received: by 2002:a17:903:1a0f:b0:2e9:9263:a58 with SMTP id d9443c01a7336-2ea438e2a84mr21563845ad.1.1792574496842;
        Wed, 21 Oct 2026 02:21:36 -0700 (PDT)
X-Received: by 2002:a17:903:1a0f:b0:2e9:9263:a58 with SMTP id d9443c01a7336-2ea438e2a84mr21563625ad.1.1792574496546;
        Wed, 21 Oct 2026 02:21:36 -0700 (PDT)
Received: from an-XPS-15-9520.buildd (2001-b011-2008-445c-c2b4-05d7-81df-1886.dynamic-ip6.hinet.net. [2001:b011:2008:445c:c2b4:5d7:81df:1886])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ea4005a7c1sm6572935ad.71.2026.10.21.02.21.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 02:21:36 -0700 (PDT)
From: ChunAn Wu <an.wu@canonical.com>
To: linux-serial@vger.kernel.org,
	platform-driver-x86@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	markus.probst@posteo.de,
	gregkh@linuxfoundation.org,
	jirislaby@kernel.org,
	hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com,
	mpearson-lenovo@squebb.ca,
	derekjohn.clark@gmail.com
Subject: [PATCH v2 2/3] platform/x86: dell-uart-backlight: Bind through normal serdev matching
Date: Wed, 21 Oct 2026 17:21:23 +0800
Message-Id: <20261021092124.2306053-2-an.wu@canonical.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261021092124.2306053-1-an.wu@canonical.com>
References: <20261021092124.2306053-1-an.wu@canonical.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The driver creates a serdev client without firmware metadata and
force-attaches its driver.

Set its name before adding it so the serdev core can match the driver
normally, then remove the manual attachment.

Signed-off-by: ChunAn Wu <an.wu@canonical.com>
---
 drivers/platform/x86/dell/dell-uart-backlight.c | 12 ++----------
 1 file changed, 2 insertions(+), 10 deletions(-)

diff --git a/drivers/platform/x86/dell/dell-uart-backlight.c b/drivers/platform/x86/dell/dell-uart-backlight.c
index f323a667dc2d..19ed7f8b12bd 100644
--- a/drivers/platform/x86/dell/dell-uart-backlight.c
+++ b/drivers/platform/x86/dell/dell-uart-backlight.c
@@ -354,6 +354,8 @@ static int dell_uart_bl_pdev_probe(struct platform_device *pdev)
 	if (!serdev)
 		return -ENOMEM;
 
+	serdev_device_set_name(serdev, KBUILD_MODNAME);
+
 	ret = serdev_device_add(serdev);
 	if (ret) {
 		dev_err(&pdev->dev, "error %d adding serdev\n", ret);
@@ -365,20 +367,10 @@ static int dell_uart_bl_pdev_probe(struct platform_device *pdev)
 	if (ret)
 		goto err_remove_serdev;
 
-	/*
-	 * serdev device <-> driver matching relies on OF or ACPI matches and
-	 * neither is available here, manually bind the driver.
-	 */
-	ret = device_driver_attach(&dell_uart_bl_serdev_driver.driver, &serdev->dev);
-	if (ret)
-		goto err_unregister_serdev_driver;
-
 	/* So that dell_uart_bl_pdev_remove() can remove the serdev */
 	platform_set_drvdata(pdev, serdev);
 	return 0;
 
-err_unregister_serdev_driver:
-	serdev_device_driver_unregister(&dell_uart_bl_serdev_driver);
 err_remove_serdev:
 	serdev_device_remove(serdev);
 	return ret;
-- 
2.34.1

