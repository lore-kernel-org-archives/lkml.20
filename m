Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.125.188.122
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792893817;
	b=Ju3A0wrTT1EYn/Q1gyiVx/sI2HqbrpBERgnI5J9ckBLUQ0NpseEgQ9cOaqENCU5C+Qs+
	 6pfV/1MFxTG0VxIV71hkJtuGYNr0JhB/Ps0Jz6ilKgjgh4nqGvVBeDIhZRHiG8bp132gY
	 o+V4sN22KESXPRqJAvH9lG1T41ZM9Pe2Srqau1lxTW2tgf4QaxXcAxz1PqYF2FeUN711m
	 4Scb7FJN6P3DMvgaOiANsrJ/Z6Kfi3uJmrok0yKyYFxPaGORh0ENRvT8XMPhA/74vVGK3
	 xSWluL4v7fhpzOd4SK2y/vJrA9u2L+wwDL89VRt3D86mb6GgZdCzp4lR2ktLx44QApA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792893817;
	h=DMARC-Filter:Received:DKIM-Signature:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:From:To:Cc:Subject:Date:Message-Id:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=o5OJ4oy2J+hfRd2KpSbnpHV5mlGk05MxAQLLAb5RJaU=;
	b=YASiF4eoUA2aqN7dOYdvJWVfDHIkwnhl2YOFvnvizt+jfN67Udd2J3HCM4E8VNPST3G4
	 PxxpGSd/FvTO8c0eOrT9endeMlbO8XxkFpbVQP8yUfBzX3a8/zFOss88BCpxoKCGnJaxY
	 Inw4FO4SXW0zFAvc4v5L4e4o6vphwFjfZklDuTDufpz5kgyqgp7E07sV8gtKNZJwrJNqJ
	 LWKKXFV2ODPlobXg7uUDaZtlPPVqECZi5QEtFheO+Bgfechlqb62UCBnxl0TpiSbizdzy
	 cUofq9eqIsm6lJzfHQVSEeySTF+lKtPOiTZ7G1LcngzJam6TwrzBi4IDNJMEs9sy3Yw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=canonical.com;
	spf=pass smtp.mailfrom=canonical.com;
	dkim=pass header.d=canonical.com header.i=@canonical.com header.a=rsa-sha256 header.s=20251003 header.b=PB3Qefui;
	arc=none smtp.remote-ip=185.125.188.122
Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E292A60A2605
	for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 02:03:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E292A60A2605
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key, unprotected) header.d=canonical.com header.i=@canonical.com header.a=rsa-sha256 header.s=20251003 header.b=PB3Qefui
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 7BBAC3F529
	for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 02:03:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20251003; t=1792893815;
	bh=o5OJ4oy2J+hfRd2KpSbnpHV5mlGk05MxAQLLAb5RJaU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version;
	b=PB3Qefui9E2TLRLt05hN4KZRjlBMsBsbiKro7dxl6dfWVihYZE1iZRP4CaQpZmhqX
	 9Clg2B4znwtufKN4epjtygXiR6CUv+PWYB358hY76En0mwfOmv09XH3B1evvENF4Kl
	 E8hg9j3w08vao8kBqVQSp0+15hDnPTd+D+z2CjeguqzaiPH7Bkf+6kOD/eKHr2hoGC
	 yL2377G+yhfKA+d+ln2aKcj7x1h7eFPGhG+yqyfqhru8Xe4McksBDmCITkAY0x1e3x
	 4D9AmvlcDLWoLTpoOwPgzndCsYoTKzlpGv0IinuWWLSDhiwbOyiU6B8UQLZCybYpnu
	 8AAKimuY+y5UGNkHmWBgEQ+BztSAIuIMwyRlFGlm3J9Wv3qiOmS01Wl1IsrEVUfLc2
	 8GeATKMKY6eU3DxlnmeuVo5GJ3fY5KAPIzddH1uEtWUWEYKJTx/ZhDAZ4PAJY+fFaV
	 Tth0KYYbkZdZq06RdvaEgJJ3kLq3LBFMAPVq/6vSmI0bFpBW52o2QdcD67eBVK+ijW
	 Sudv4AcsjJfTXh5XKHAvKqg6b+xaQvKHfBD2UKCN0Y2yu263wz2RCTM6Z/D/faepDS
	 3GBKelJl7f+qZVJd7etlA4DdpXGSDRV+c9aV1VusCb59FVKbX/WdG/DmEkUE3r+HNJ
	 pU5qOvSYQrrWWtKlhzd3kjGY=
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3ab27c28489so689463a91.1
        for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 19:03:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792893814; x=1793498614;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=o5OJ4oy2J+hfRd2KpSbnpHV5mlGk05MxAQLLAb5RJaU=;
        b=Kkge+plozEOdgYl3xXij8d7lqdIsCzCuBpAbhWJBvf08SnsWAjZvidXBSv1B6Wb9FS
         KfTmraPhz9PmTy7AG01XYw+iTx6e4GXbV6pNbwIzJvrUEZckeUEFTKaIbhPqN0+ziyxQ
         5KSr4sXTnUONqLuSiF/jA2K2HRjwqlQKqLTuRzFPAdEPztd4m1UladgVeXz19GbdzqoQ
         FHGqTC8imh8mex2WHR+uiMlXGB5RZscm+o+95JlSqBjfY5Us4AthyAuSvV+y6BsKrePz
         XT4w0xa2aBOZqzwXYkWwlnQkHQiPlBzJ/jzkLGHD0FfAycce9raKBhbtdi1TzhXyn676
         wsPw==
X-Gm-Message-State: AFq9FYKPUvs++FDlG1YMhYrbtygTZ+V/G/WL98+nc9Rrbjywoz/bcDyX
	ECSF+kqoSvomSCPYKcq//NkkQCFOECbQNoa2nM0lr2V4HUKO2xwo4ODd+otsvpA9Qnty8ZBprLG
	VJObP/0V9+lb7mp7/r7542xEbNTXxQbpsvxJDHPi23rddKCkZ2n8FrShiD0LrRLdJ0Fzww3O1OY
	2ldcca4w==
X-Gm-Gg: AYBFou0T3K+MwPD6uLvESjJQMfD7JBzrwwJq6kameEf8aIT0GtDGWpzwWXCIAMxIwPf
	q0YHVig6jDl5JlEpr65e59wc9o+u09X4MqRgPWRbdqyVQznmF7mAu5Omr9fNSY8nuBKCiwJJomT
	raqj+Wq5yad+wkHQkwxRjOczL/o+q6BZdbUrOcKQJ1jmOYsO2JUWic6YOsjB4UaPnG/dlVaZH+V
	cUMe5GksebhVF8VywcgWNZcoWf7qw19dWQfOK70ONyy7EnGtaehkOmTxGe6s9fdj5/e4qbL1Px/
	X3lfZ91d1Yrtn60JQ9PnD/TxdPL6Nwc/osym7j42/Mq5YJ2WSGkJ8x4jezurRAve6YaDr8LSkny
	WTn5laPHlsE4NNyoBb4+fdy5fr14OCaPj9GwzV/Vf/mXJN8S3vmR35It53dVW+f5UZXxBjqokw5
	NODQpOh6WhYo17t4wnPjjVjcRsr0kk2TKsBpt8ZXlJQzAVzBe7z/VyoWHWWdm8thRIOAYTfTDWg
	Be3LTToFE0z131CTvbbUAQoN44B+HcLUu6bh/crfg==
X-Received: by 2002:a17:90b:1809:b0:3a0:c162:51af with SMTP id 98e67ed59e1d1-3ade9481ef8mr4927457a91.0.1792893813911;
        Sat, 24 Oct 2026 19:03:33 -0700 (PDT)
X-Received: by 2002:a17:90b:1809:b0:3a0:c162:51af with SMTP id 98e67ed59e1d1-3ade9481ef8mr4927434a91.0.1792893813535;
        Sat, 24 Oct 2026 19:03:33 -0700 (PDT)
Received: from an-XPS-15-9520.buildd (2001-b011-2008-445c-0e25-4b6d-1924-440d.dynamic-ip6.hinet.net. [2001:b011:2008:445c:e25:4b6d:1924:440d])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3adebacbf5fsm4226044a91.6.2026.10.24.19.03.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Oct 2026 19:03:33 -0700 (PDT)
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
Subject: [PATCH v6 2/3] platform/x86: dell-uart-backlight: Bind through normal serdev matching
Date: Sun, 25 Oct 2026 10:03:16 +0800
Message-Id: <50556466ff036ece9b73f7088deaece5faf4e59b.1792856688.git.an.wu@canonical.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1792856688.git.an.wu@canonical.com>
References: <cover.1792856688.git.an.wu@canonical.com>
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
force-attaches its driver to it.

Pass the modalias to serdev_device_add() and give the serdev driver a
matching id_table, so that the serdev core binds the two through normal
matching, then drop the manual attachment.

The client now also reports a "serial:dell_uart_backlight" modalias to
userspace instead of failing with -ENODEV. A failing serdev probe no
longer propagates out of the platform probe; as for any other bus, the
client is simply left unbound.

Signed-off-by: ChunAn Wu <an.wu@canonical.com>
Reviewed-by: Markus Probst <markus.probst@posteo.de>
---
 .../platform/x86/dell/dell-uart-backlight.c    | 18 +++++++-----------
 1 file changed, 7 insertions(+), 11 deletions(-)

diff --git a/drivers/platform/x86/dell/dell-uart-backlight.c b/drivers/platform/x86/dell/dell-uart-backlight.c
index f076cfac2bc5..9b8ef91bb0a2 100644
--- a/drivers/platform/x86/dell/dell-uart-backlight.c
+++ b/drivers/platform/x86/dell/dell-uart-backlight.c
@@ -325,11 +325,17 @@ static int dell_uart_bl_serdev_probe(struct serdev_device *serdev)
 	return PTR_ERR_OR_ZERO(dell_bl->bl);
 }
 
+static const struct serdev_device_id dell_uart_bl_serdev_id[] = {
+	{ KBUILD_MODNAME },
+	{ }
+};
+
 static struct serdev_device_driver dell_uart_bl_serdev_driver = {
 	.probe = dell_uart_bl_serdev_probe,
 	.driver = {
 		.name = KBUILD_MODNAME,
 	},
+	.id_table = dell_uart_bl_serdev_id,
 };
 
 static int dell_uart_bl_pdev_probe(struct platform_device *pdev)
@@ -354,7 +360,7 @@ static int dell_uart_bl_pdev_probe(struct platform_device *pdev)
 	if (!serdev)
 		return -ENOMEM;
 
-	ret = serdev_device_add(serdev, NULL);
+	ret = serdev_device_add(serdev, KBUILD_MODNAME);
 	if (ret) {
 		dev_err(&pdev->dev, "error %d adding serdev\n", ret);
 		serdev_device_put(serdev);
@@ -365,20 +371,10 @@ static int dell_uart_bl_pdev_probe(struct platform_device *pdev)
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

