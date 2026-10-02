Received: from mail-qk2-f38.google.com (mail-qk2-f38.google.com [74.125.230.230])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C756C38D3EE
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 21:41:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.230
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790977314; cv=none; b=qoIhVABCyNBBS71GxnU5zTgfYy+dTohVAwn4dp3HeEDC2HzODYS+PKzQwLmUlJD1V6APEpmBEpGunuI+nPFbbbODYXQysnaISbY/jOSZLrGiLQtBTVVlVTofI/WVrFKHyVLO9/i9hGGlO+SAQ4ToTlhKD4sPAJAFsVLMAIgQgEg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790977314; c=relaxed/simple;
	bh=SQXaYKVOCPGq63Pv3gBcweqQcXFDdnCWhIv2nfPFCI4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=JK+Zml9ftj+MkXQ6wABxajgLAJuPDDBhtd44K0IieDGtpfPRZWORx2kqGnO5Fna9J2MD2Jgwt+TiTPOp/efn177NCHrpbSOn7a/kGwSkRC455vCb5llxQfZfFgzcxpSKQ0Jqg1CWssyuer7mrlGHxUqPIZxj1wJBYVzubeaotxc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VbjYw27u; arc=none smtp.client-ip=74.125.230.230
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VbjYw27u"
Received: by mail-qk2-f38.google.com with SMTP id d75a77b69052e-5339232d14cso221591cf.2
        for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 14:41:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790977312; x=1791582112; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=v+6auUbc7rikWHN42UUirm8kbUpP8aG2HoKhX6n9Lac=;
        b=VbjYw27uqlBk5msZBRVvCv+m+TpA4XhQnBeATXl8T+XLYkBBeZJ5mWGcBCceWr7yqI
         YJOSTT6NnmqpBViUHBrm7FCxcBiTFXJ8Q9Ldp4XZ6DRoJKbLJPrMLeUL2/WHfO8kKTFo
         sE05HxRoZWg+pkb4y1w6T5/egy44sSlCb3tOZey5ieUZE08t6q+7xHRp8ESOlsoevWxq
         OYl29BfNonP/S78HdStgbKrwjy5Sp8ifYtQ6IPJ2v9haAM6avVaR5oYyXcMaZwP7BIPV
         PwfKoELaOQMEBLVlqnN0MwZreqaCpVlEuqmVTs1oYP2eRNf2kYIcddfxSmjgjSUOVx/n
         UeRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790977312; x=1791582112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=v+6auUbc7rikWHN42UUirm8kbUpP8aG2HoKhX6n9Lac=;
        b=f2IndZ5/E54CN0FwoBSm5luCvpwZRGNTdNL+pVedxmPWCtasrcuyxaVmFoRVt19sLo
         9LD4FfTg9PtNVggEAF9PzUkISFrjwQBz3zaPRrialUJ7TYvM8X89aPD/8FDetESl6mdI
         SNn7LfYvTtGaoTta7V4q97WQyYMAPfnPQ2CMaP3MFjTcKbdw6/FJaRgvLq8xv6Abf/EU
         H+6PBpdACLINw4kMbbP4XnpKm9m9+4C2UUe3RK2q2x6KByLjbLtTZ96uM5tkmHtzLpdx
         Zz9aT2gxQhzbVDdJqke6TPO2n65URZKEkU3YpUrf8GF+VV7QSHvpFzsoE1CGbwbcz5+M
         IsqA==
X-Forwarded-Encrypted: i=1; AKwUvByWT+UXOEak4YWA+oamlCPRpx02Iibyix5gZTXteLC5HeYsbNo2WHt1mEPZQGJUleqr/f60ieUQ7NVEmxk=@vger.kernel.org
X-Gm-Message-State: AFuF++kNPaZ93/dDgJkx0pgcmVyxFqeikMJPyPtqlbISO3ONanUHpaKX
	F2CuE7Lux5VGgva/Xyrrnw+CvUIgxmzaLL9eSLnjCWclUw+tK2zlXZ0=
X-Gm-Gg: AYBFou3MLN30NA5hak8Aeq5iDdW3OCYN67PvtXeNihwrTLeg457BTlDhf62zDm845wn
	ITmfCrrauW67SC5BRH9H0a71wUMwFjrMB0fpWwyLsa6yq3X7DYvb65KPvYgIs5/U/vt68/SxIzZ
	vbxFH4wsGked2elaFJ996DAI7xin2qdwdc8Kr25PXJcy6Td3cOtYoXqjA4KUf+CjtJR5soPHaAx
	ASTWNY7dFOtkjjb59TWmbuilq4n6GLfUsDNEnYxUGHtzNwSEGuVD8KM1d0s8JpNVsgWEO6JWl4A
	9LFVxoi8myIiWtPmhZsrWc1pP1Hab1YZWzVyV9Qai0WKRHsZ7H6yOboVpoXRvoTDt1x3pmTXDHX
	VdnRiTiocTDnnYMDICwtO2lq22zjMSUTJMQbIIPwA1G16FmG8QCKf6iQjXzH7AbMOgvx5zHnY2D
	Dlh+WIqDTDOLFxWcsMRWZl6rTguDyTcXEE+PAgO/gBLBBt92N19nZ6623O1j3jQwP180bBOZ9PY
	+/mrrvq/qRoqz7XnKhObD7JufjFiZoRnxC0kLtMiB59FLTjs/CKU8+CMwfHzNUMOpqIW4ZGtbRe
	uva+Yd1OpBECSH2k+zJcYDEfVVxv
X-Received: by 2002:ac8:594a:0:b0:532:dc4d:58b3 with SMTP id d75a77b69052e-533cbc8efe0mr74768671cf.38.1790977311661;
        Fri, 02 Oct 2026 14:41:51 -0700 (PDT)
Received: from i4-gl-tmk5904-1.ad.psu.edu ([130.203.156.90])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-533988343b5sm36227531cf.1.2026.10.02.14.41.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 14:41:50 -0700 (PDT)
From: Myeonghun Pak <mhun512@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Chunfeng Yun <chunfeng.yun@mediatek.com>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH] usb: common: usb-conn-gpio: join IRQs before canceling work
Date: Fri,  2 Oct 2026 17:41:47 -0400
Message-ID: <20261002214148.459052-1-mhun512@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The GPIO IRQ handlers can enqueue delayed work after remove has canceled
it. A similar lifetime issue exists during probe: once the ID IRQ has
been requested, a later VBUS IRQ setup failure can unwind probe while
the ID IRQ is still able to queue work.

Managed IRQ cleanup happens only after remove or failed probe returns,
so queued work can outlive the state it accesses.

Request both IRQs disabled and enable them only after setup succeeds.
During cleanup, explicitly free and synchronize the installed IRQs
before canceling delayed work. This closes the producer before joining
the work it can queue.

This issue was identified during our ongoing static-analysis research
while reviewing kernel code.

Fixes: 4602f3bff266 ("usb: common: add USB GPIO based connection detection driver")
Assisted-by: LLM
Cc: stable@vger.kernel.org
Signed-off-by: Myeonghun Pak <mhun512@gmail.com>
---
 drivers/usb/common/usb-conn-gpio.c | 24 ++++++++++++++++++++----
 1 file changed, 20 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/common/usb-conn-gpio.c b/drivers/usb/common/usb-conn-gpio.c
index 421c3af38e06975259f4a1792aa3b3708a192d59..60badc9a2db8b8e7e621141307de3c1729e8f101 100644
--- a/drivers/usb/common/usb-conn-gpio.c
+++ b/drivers/usb/common/usb-conn-gpio.c
@@ -29,7 +29,7 @@
 #define USB_GPIO_DEB_US		((USB_GPIO_DEB_MS) * 1000)	/* us */
 
 #define USB_CONN_IRQF	\
-	(IRQF_TRIGGER_RISING | IRQF_TRIGGER_FALLING | IRQF_ONESHOT)
+	(IRQF_TRIGGER_RISING | IRQF_TRIGGER_FALLING | IRQF_ONESHOT | IRQF_NO_AUTOEN)
 
 struct usb_conn_info {
 	struct device *dev;
@@ -262,7 +262,7 @@
 		if (info->vbus_irq < 0) {
 			dev_err(dev, "failed to get VBUS IRQ\n");
 			ret = info->vbus_irq;
-			goto put_role_sw;
+			goto free_id_irq;
 		}
 
 		ret = devm_request_threaded_irq(dev, info->vbus_irq, NULL,
@@ -270,19 +270,30 @@
 						pdev->name, info);
 		if (ret < 0) {
 			dev_err(dev, "failed to request VBUS IRQ\n");
-			goto put_role_sw;
+			goto free_id_irq;
 		}
 	}
 
 	platform_set_drvdata(pdev, info);
 	device_set_wakeup_capable(&pdev->dev, true);
 
+	info->initial_detection = true;
+
+	/* Enable the IRQs only after all the setup has succeeded. */
+	if (info->id_gpiod)
+		enable_irq(info->id_irq);
+	if (info->vbus_gpiod)
+		enable_irq(info->vbus_irq);
+
 	/* Perform initial detection */
-	info->initial_detection = true;
 	usb_conn_queue_dwork(info, 0);
 
 	return 0;
 
+free_id_irq:
+	if (info->id_gpiod)
+		devm_free_irq(dev, info->id_irq, info);
+	cancel_delayed_work_sync(&info->dw_det);
 put_role_sw:
 	usb_role_switch_put(info->role_sw);
 	return ret;
@@ -291,6 +302,11 @@
 static void usb_conn_remove(struct platform_device *pdev)
 {
 	struct usb_conn_info *info = platform_get_drvdata(pdev);
+
+	if (info->id_gpiod)
+		devm_free_irq(&pdev->dev, info->id_irq, info);
+	if (info->vbus_gpiod)
+		devm_free_irq(&pdev->dev, info->vbus_irq, info);
 
 	cancel_delayed_work_sync(&info->dw_det);
 
