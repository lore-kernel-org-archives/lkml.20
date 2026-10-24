Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.125.188.123
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792813825;
	b=f+I1n0ySRYtaTYTVUHVWX0lGdxaWogAb1TXDOOsdh4ljysGPrTijX23By5D5IKga7YCe
	 ObPxtoiiUSxXGKz03wbW+DXUamo35tN8Fcq/lgOlrYegeP7uMwcI6jROPpn30QbURJaYS
	 gVI0stAXWk6QvxD3rS6ZExak3YwdJ9hyB7iFzkbYfO6fYNq1Dgh8g7/e+bliUFuLJz93Y
	 9SX8F/Tlk+RljAPH/IvVlKkBJo9mxW0lRb6fx8uIFt1Fx3kX/K/zypkovb8ZA8cv4Ujt1
	 T79o0pToNM5vMKC3KPgExmhqmDbp61JnizAG2ieteYBkma23wCey6ppGA0jThDvfY7w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792813825;
	h=DMARC-Filter:Received:DKIM-Signature:Received:
	 X-Google-DKIM-Signature:X-Forwarded-Encrypted:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:Subject:Date:
	 Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=i4VVej3KE6r0xh/Sp6hm3WcrpLIYI5P1lVi2/jNr6p8=;
	b=fhbUBVTP0rIu6uKfEKij2EDo18pgteyz49YXnkb+N5s+g+AkXY7Nzcube0i7Aee08Cvu
	 yMXKv5PyYonib3TA8eZ77j6QT3KBpaoeZiXyDgBIicNldgTNeKJjB+PTCBOv+zFzJzAec
	 jDvlgl7JDkp3sLjmr/6aRzYv5HZZ55OnhAGW88UiaZCd7rRgyMD3SiOkxdLJBtFBbmzQ6
	 3999o2bym4b+ANd81f3wx1qHlFdyV3s8924Yt9Mi+h+e80Cj9xSzf27WW24w5O0XP5M1m
	 18375/54VQ2LBOK7fXhtw2xjk/crfFcgNPPwIifJlImC+9dsq5flUaijNcygtkYmz5g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=canonical.com;
	spf=pass smtp.mailfrom=canonical.com;
	dkim=pass header.d=canonical.com header.i=@canonical.com header.a=rsa-sha256 header.s=20251003 header.b=joXqts16;
	arc=none smtp.remote-ip=185.125.188.123
Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19A43606A31A
	for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 03:50:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 19A43606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key, unprotected) header.d=canonical.com header.i=@canonical.com header.a=rsa-sha256 header.s=20251003 header.b=joXqts16
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 65A76402EF
	for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 03:50:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20251003; t=1792813821;
	bh=i4VVej3KE6r0xh/Sp6hm3WcrpLIYI5P1lVi2/jNr6p8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version;
	b=joXqts16mhOeqke2vxiWmtKbs6h8xr+drNbAEFZvxAAQgztEtjPfkAUL/xkfOTDS2
	 UZL8mVyX1plEo1RV4//XUOsURpaHpvxzquuQ1TdH87S/WkbmGZMJ1+bTj7ozTFc7fV
	 uwJZ9gMDjkcAivCHCWuSGjPOzsVixpiViBP+s74QZ3PAK+AXxTvb9RZLbdqN4Ymfzr
	 fFC7e5WEIeTXyWJCRiM5y+s4rbre7kjI9gWK5G3HRIcGKl1afcFmFmXBGTSEpg+sdX
	 nFbpZuu000c2PK/4sU22HsqsDElaTAAXIIZ1qrhc7Q79jfKKoIVmC/g7K6z4LeEuq9
	 0APIZj+LyiREZVYPIQL5wEla2H7Pu5/zxolZljgncwKdIZJRSXqbF/qAUDhNCWcAGW
	 5cr709OJSgb/QOYczI9rvfSXwxaiRi2GAHdDiP+voqEyollF+DHMbcu8rf1ahU3kvc
	 qLC1LFa6zhg/ikBsTotTz+SB5qIFpiDTWwlBLZfonJ47P6V/4sigaq5lh1unXbkpua
	 X0Pdu3iYNd6PNaiE87t5s0sdHu14RzgipGi3jVUYODSDpi6rFbaxwmVOWdzYrOrMRI
	 wGlbkGIXUEJhs0m7hY0CoQX8Y+/0nxjA6JIlVFJmq7b/r5GN3TCTqN5mU/xutOSq8k
	 EewXhjogOQv/ji5gWd9F3E/8=
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2e848cd27beso5453435ad.3
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 20:50:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792813820; x=1793418620;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=i4VVej3KE6r0xh/Sp6hm3WcrpLIYI5P1lVi2/jNr6p8=;
        b=Id4wQr2auXQcPAv4rcgdyhG8fpQ4LP3FW6sAoTm+numSdAe1xyMXM4BixA8jEkP75J
         OPJF+LFO+0Ks7zddolnUXo/TTnDJ2/2dwGzNt2d4HivIOLrtnwMzA7WZTAW7xWjPhbzH
         UOK8DsFctkv/mgHXXjNPHqdwekh9ULRd4wLp74I11SuP+83PRZwVTkRylYZiw5Kov6kL
         1KZDV2gAAptnCx4kGnmdrS3V8uQyvn7tguLo+ObtfO6AAN0edImaktEb5ydLmC44QbkZ
         EGGv5Eozpp2evJA2uUauLtbGEhJlYml6IcXmKGUfdKWCuf9WA26azSULtfjf4/QYncCU
         rIQw==
X-Forwarded-Encrypted: i=1; AKwUvBxSODi4BtA3bSjrEsGU+E/nxASXb6VkvR0LmfM3GN9R0u6WOUhYKEF8epO5JgpZ/AFQsp6se4JIGBV+wII=@vger.kernel.org
X-Gm-Message-State: AFq9FYJqyoGfdVYcmHjENeIiiJzOGJJK67BebRQ/trPxethxGKuDfZJ7
	XoF1wK+BM3mwUCpyCyfCU7xqAyvgCwvK5E5v8XSJkjhTS1P46+7A+kAzEovNxwGoBaafOVuS36R
	wfHK1LfMKFcF+9E+FXbOGYHL+FqSDurP3CJIQzzKt/ignDTat/0L3OcRYwyzOJCrrHocxMkEEeU
	J6vZ+0eg==
X-Gm-Gg: AYBFou34vRHpHo11x+awNUzSM+sYS0vBsAHeWPz1Ygp0OQ7qBhWP31wV2GgCEQ/Od+O
	jTkkoaS92L5wmZIGHTxu7LOBkDoYzq/2zm/YXeqR6/k3uW26BRmKcErWO39Ny9o345Kd+oKIPeP
	tULkyumcvnaxGJgt6S04BdGs1CZ6+sp+Vj+RD92CcZIa+0NqvEQ3LyhUyX6XvsQk7tweRI2K8qw
	uhSKZ7J4zzEksDPfnJYFQRPONraE1KtlADfMy1lrXBcpJHkYwbTc5fypHhs/CNO0CojbiU5BBT3
	RDeW5DPdIKBKmaIqFvM5IwhFCpjHsUsFW1qbiIgqkGkeRocdrtQI0s9K15Ua6qZtal8sEBlDSyb
	fFylUYlvyS4eGJKj1WbX6iehsKx3WZ189jhBk+XfzUvZLbx6veZqrO+hAqS3bMH2bfkFwOPBLtS
	THNAK/HcALMZPa+2cJ0PAoOi5+KpqXx99CsJ/m+nzldDaYc6CIbDYvgYkzbDGRPm3w71dMqV3VJ
	8B1nyb5TcnsBBogyLtH4isAkNdeYt/HENu+3Y+lC2k=
X-Received: by 2002:a17:90b:39a6:b0:3a7:a463:54bb with SMTP id 98e67ed59e1d1-3adeb10f4c4mr1658965a91.5.1792813819847;
        Fri, 23 Oct 2026 20:50:19 -0700 (PDT)
X-Received: by 2002:a17:90b:39a6:b0:3a7:a463:54bb with SMTP id 98e67ed59e1d1-3adeb10f4c4mr1658949a91.5.1792813819479;
        Fri, 23 Oct 2026 20:50:19 -0700 (PDT)
Received: from an-XPS-15-9520.buildd (2001-b011-2008-445c-9c57-136b-f73a-3698.dynamic-ip6.hinet.net. [2001:b011:2008:445c:9c57:136b:f73a:3698])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3adebadfa96sm1320191a91.7.2026.10.23.20.50.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 20:50:19 -0700 (PDT)
From: ChunAn Wu <an.wu@canonical.com>
To: an.wu@canonical.com
Cc: derekjohn.clark@gmail.com,
	gregkh@linuxfoundation.org,
	hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com,
	jirislaby@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-serial@vger.kernel.org,
	markus.probst@posteo.de,
	mpearson-lenovo@squebb.ca,
	platform-driver-x86@vger.kernel.org
Subject: [PATCH v4 2/3] platform/x86: dell-uart-backlight: Bind through normal serdev matching
Date: Sat, 24 Oct 2026 11:50:11 +0800
Message-Id: <20261024035011.2712103-1-an.wu@canonical.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261024022930.2704030-1-an.wu@canonical.com>
References: <20261024022930.2704030-1-an.wu@canonical.com>
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
---
 .../platform/x86/dell/dell-uart-backlight.c    | 18 +++++++-----------
 1 file changed, 7 insertions(+), 11 deletions(-)

diff --git a/drivers/platform/x86/dell/dell-uart-backlight.c b/drivers/platform/x86/dell/dell-uart-backlight.c
index f323a667dc2d..9b8ef91bb0a2 100644
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
 
-	ret = serdev_device_add(serdev);
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

