Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.125.188.122
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792733256;
	b=Hs8dYo3jEPa7nzItyUwrPVLYTylnfW5xvZu4q/ALiaTCHmt1srO5vemZnD9JD0HALW1Z
	 TvP29MmyhBdMLpeC1PXW8bte7H3BZG1kHvOl/fw61AixFtrBEAJ0sNliI0GxnMKCIx9Qr
	 IMumUJGu4eZ16fwcZLc7dUQdY4Ts5GhulKHPP0QO8bMA2mdc2IgGpLaNLDGu4Psiya+0E
	 tgRzlz9pvFBxI+kIb0hkrKBgGV+FNS3vM0jjzSoSwj3fxXVCHGywDZr8VZujabiqVWspu
	 c3rao+UIPa/It/bECLWZiAXCWA0StNIe3Oml007ToSKEF9WW+Sezo2D413GVkwhwaaw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792733256;
	h=DMARC-Filter:Received:DKIM-Signature:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:From:To:Cc:Subject:Date:Message-Id:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=4L6weuCfG+0+7nbvcKznkqD/AuPq+kc5T9Pa5EzUN/c=;
	b=V/XzItGpbB3XD/4g0TQuVtwtRNIMky2Nxx4kMqpIWnztqgCK9U4/J8lZp/PqOo1Y+uWc
	 aHtYBvAay1Oc2gET5YW1qugRdhsxQJ9z8uiN9GADMxgAazrIFN5TAEOomLyXyJ3UszN1X
	 2n32L5xG38mlOcTbuIPQ5z9SMzPFxn0OC2jmW25+ssTi+Fw+LEWbeac6rBRGwf8Id9nDS
	 EaAaL77vY094i2Cqk0eZLuZOROU7dxiVYDeBlDoDC0zuWjymWD42J9JX58/BElztKmutx
	 fk+rJNcjS7TClqqROwCXEHiqtLG43JJ8menDER3r7aO8VPwNYollAzvn2WAMcoVaDvg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=canonical.com;
	spf=pass smtp.mailfrom=canonical.com;
	dkim=pass header.d=canonical.com header.i=@canonical.com header.a=rsa-sha256 header.s=20251003 header.b="eK/k63io";
	arc=none smtp.remote-ip=185.125.188.122
Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23F1C606A334
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 05:27:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 23F1C606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key, unprotected) header.d=canonical.com header.i=@canonical.com header.a=rsa-sha256 header.s=20251003 header.b=eK/k63io
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id E327D402CC
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 05:27:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20251003; t=1792733253;
	bh=4L6weuCfG+0+7nbvcKznkqD/AuPq+kc5T9Pa5EzUN/c=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version;
	b=eK/k63iolage+Feo8V/nYaJe3Hs5zxE8GD1r2XXUMl3U/K/pwYxzg5bkD6mqweMFy
	 4R7VcfeZoj2420GNWnPdQ2YsMENc1iWqEDYkMcmoThW/rHtTvFlBYwziUaRdens5lq
	 EbwgAUpA3e8klJAtXtnjczTIea6mPRKG0prxjZ0LRxhnKOgN5oE7y6DB0t31etRiFk
	 SXAdmBolBnScAihsKEghTuX487/LSkvE28po7VWy+BaNl7cz1zetDSrHcvCqbwXHs1
	 VlVEawzy9haYcqJIlC9y4zpwj1dqSk3D+CI4dHYDAxoTHhpTbkgHbuW6EyMw8AQuBA
	 pD8dUqzwqXA5Jg3rUeN7bL7gtyvnulQJUxcEKk5T5XvfXolcY+rtFKJYFl4N+x3xfV
	 ZtKGfg4epIr0hhiOiFhNCF+gKBEX9zolivyFZjxKJg/FAR5RbudLHnLB9PdFYWfGx8
	 OT9lTH72EaAkT0UtXJSoitdrRrTOQ6GFTKN8FrL13eICfg7WJcDt79qtrQQ77l3YMg
	 9/5ooo06cDtoDMVlEc6fo9G2DuwZUUzsoV+7wcpA6Rppa5Bdvwp0XM+NjA8wAOfV6a
	 DUJoraErzi2y0uJOh+g4XTHGFCOFfWlWypbK5N/30wXaR7ywvbDpaZoquJljs9fR5X
	 SfyeHMlCl3KUWe3+4xQLRdMY=
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-361c38aa269so69861eec.1
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 22:27:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792733252; x=1793338052;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=4L6weuCfG+0+7nbvcKznkqD/AuPq+kc5T9Pa5EzUN/c=;
        b=ZOSeu+XEodBK4bsRe1lK+pLsAICY7khyzAPIRBKO3VaR95DrDzj9zYBOK5X/PCvQ6M
         lsx4NgtA15KfA3r9jmrzRaJ0uzGxxYmtfAgSJzHX0bwDVF12xredh3kl2xF4fZpgMNtm
         LMegebWKOzD/OcCaPCQ/4xTdSHv/i7Ry9Km/+2EVNddkJx3NYlUxVEtJcr1ssFgh2qxa
         G1ZGyZHE233R61RlwLmPJNupITLFu/JcxIHR449YZGs2vHQWevnAWKZB0axBgsa7SP4b
         hcX6njuDq9BbRgrA8F0l72PbDGj2mS+jYvGXNzlpNQ8J6ZzqrMf49VDMVz/nbLtCnMYM
         QUgw==
X-Gm-Message-State: AFq9FYKOLQPSqYGz3J+eglbdugKOa9WxmbFWWPo0+wrOXkpDT+OetgIZ
	fDYqOxs+Wp3Drz647bx1JmHix3vofhPraAMbGKjaujS3xcTjvjwiU6C4UeoAY6emKmunOHOTJYv
	VqSqrg+CO70d+pnvAABnqQ7UEwXkWhe47lLGTEOwHRXr1T4i/pAwLcjNh42daoY2CZG7b7/5tz5
	PuuNcxEg==
X-Gm-Gg: AYBFou1viOij+S7xwZa0Ad8uBeTtvzs5Ffz0Pad2WRcEb5g1q5xcAg3lAvxrMZkt+Jt
	fUuF/xtGmIAj3wfcjV3E8RFTXsh4tYVe/DQbleCL5qenUXWwSbJVT8qmADmM/kFU+jh4LKW27mI
	wPLrfy8WydYZaOGTkzZW2VqSGofv2dTR8WgM0/c86EmAC8fUX+pGUrmhwEGLwyj0lnfz3CWQAmz
	lidHgcgjO2/0sA4Wq4XPZ49znV1ZhKIr0eftM33Fi5xA/4hvO4Bn6owh+vmKQC9m6uYKew7L4T0
	4/eLB6bEaDYvKR3eNPoi+kUJb6SVA/KA8vXqf3BWlqQVKjFRl5DcymwSFUfHVk93dd0e2WVftjF
	/yj2a57bTZM447+NWWaYjC5xl61kJLgM08GM2EOqKa3Im7v06XHdruuruptQgNwH3AFfBXURGZM
	1gOWkRnujvaNmQRctA8cmH2GSn4F0B55kjjwzFwdfexYUuYpj9y1OblinT1j0btzEz4ABq06B39
	jFEUVZVez1Xu25HcQhiLf0uOro5tNm5SQO5eZYf+gQ=
X-Received: by 2002:a05:693c:8952:10b0:35f:ea17:d171 with SMTP id 5a478bee46e88-369d975d845mr2603013eec.2.1792733252246;
        Thu, 22 Oct 2026 22:27:32 -0700 (PDT)
X-Received: by 2002:a05:693c:8952:10b0:35f:ea17:d171 with SMTP id 5a478bee46e88-369d975d845mr2602969eec.2.1792733251744;
        Thu, 22 Oct 2026 22:27:31 -0700 (PDT)
Received: from an-XPS-15-9520.buildd (2001-b011-2008-445c-b47a-213f-cf99-45b4.dynamic-ip6.hinet.net. [2001:b011:2008:445c:b47a:213f:cf99:45b4])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-369d9e1a085sm3590098eec.29.2026.10.22.22.27.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 22:27:31 -0700 (PDT)
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
Subject: [PATCH v3 2/3] platform/x86: dell-uart-backlight: Bind through normal serdev matching
Date: Fri, 23 Oct 2026 13:27:16 +0800
Message-Id: <20261023052717.2577234-3-an.wu@canonical.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261023052717.2577234-1-an.wu@canonical.com>
References: <20261023052717.2577234-1-an.wu@canonical.com>
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

Set the modalias of the client before adding it and give the serdev
driver a matching id_table, so that the serdev core binds the two
through normal matching, then drop the manual attachment.

The client now also reports a "serial:dell_uart_backlight" modalias to
userspace instead of failing with -ENODEV. A failing serdev probe no
longer propagates out of the platform probe; as for any other bus, the
client is simply left unbound.

Signed-off-by: ChunAn Wu <an.wu@canonical.com>
---
Changes in v3:
- Use serdev_device_set_modalias() instead of ::name; add an id_table
  to the serdev driver

Changes in v2:
- New in v2

 .../platform/x86/dell/dell-uart-backlight.c    | 18 ++++++++----------
 1 file changed, 8 insertions(+), 10 deletions(-)

diff --git a/drivers/platform/x86/dell/dell-uart-backlight.c b/drivers/platform/x86/dell/dell-uart-backlight.c
index f323a667dc2d..13515ebda3dc 100644
--- a/drivers/platform/x86/dell/dell-uart-backlight.c
+++ b/drivers/platform/x86/dell/dell-uart-backlight.c
@@ -325,11 +325,17 @@ static int dell_uart_bl_serdev_probe(struct serdev_device *serdev)
 	return PTR_ERR_OR_ZERO(dell_bl->bl);
 }
 
+static const struct serdev_device_id dell_uart_bl_serdev_id_table[] = {
+	{ KBUILD_MODNAME },
+	{ }
+};
+
 static struct serdev_device_driver dell_uart_bl_serdev_driver = {
 	.probe = dell_uart_bl_serdev_probe,
 	.driver = {
 		.name = KBUILD_MODNAME,
 	},
+	.id_table = dell_uart_bl_serdev_id_table,
 };
 
 static int dell_uart_bl_pdev_probe(struct platform_device *pdev)
@@ -354,6 +360,8 @@ static int dell_uart_bl_pdev_probe(struct platform_device *pdev)
 	if (!serdev)
 		return -ENOMEM;
 
+	serdev_device_set_modalias(serdev, KBUILD_MODNAME);
+
 	ret = serdev_device_add(serdev);
 	if (ret) {
 		dev_err(&pdev->dev, "error %d adding serdev\n", ret);
@@ -365,20 +373,10 @@ static int dell_uart_bl_pdev_probe(struct platform_device *pdev)
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

