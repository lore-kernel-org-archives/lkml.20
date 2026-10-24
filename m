Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.125.188.123
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792808994;
	b=1jxvyU5k48BRijqFj8OPozOaElr+EMZrUocC4Q0l7d/Dp+Dk4489UBJXDVvlMUAC8hqz
	 qTN3X0lI/tnnSlig7D5xx6uQr6W6dDps2HA7jDTaaMVkCJKrcH9xzpZlBQzECGZwtr3Ar
	 bp78eX7Y7RMP9ZyURb27iiPbeaw3yU1Sr/tcoDjO36wPhxdps/H72kHI6rbilpXJ+R+7S
	 w1vtyVcscIYzAyotC2rnkpEvWcbC+kf+/8LvZ0Q3UoFp9jwMM7iqEI2YUJnyaJSPoQY/J
	 FFP3ahCO0+BrKpM2eKIT5hfKTgHPd4ryly6ylvOpo1fAX7m2BcCYajHeM9A3jxcytmA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792808994;
	h=DMARC-Filter:Received:DKIM-Signature:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:From:To:Cc:Subject:Date:Message-Id:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=i4VVej3KE6r0xh/Sp6hm3WcrpLIYI5P1lVi2/jNr6p8=;
	b=qEbICmZ3krCGCuiwVxWMcTf7EUYSpYdvk+Nxj6Njr6wXmjwMoT8v1fIfupoE5VjyWFvw
	 dcjvlbaECKvdpbgq7bS/2KPvqbsZ11niGG15TNE2gusxfLFZODANjDQpO/QOmhzQHGgPn
	 JceVGHW5dQc4P0pV7zaRc6TXIHhQkMUM5U2iPcp0DjN24HUm9Nr+5Omh+ao3Cc7QmB7Iy
	 o1t6fKf6BC46gOwIJnK7P+j731DPh32ASsKoRodnDdYCEQQuEfpd9ZRJAsjQk3lnTa4Vr
	 9MX6fqUlS9LBl+kUcd6TXhmKRQf09ZiDlhIHM3hFG2u44SMGf/zVurDfb5xIlfNpwuA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=canonical.com;
	spf=pass smtp.mailfrom=canonical.com;
	dkim=pass header.d=canonical.com header.i=@canonical.com header.a=rsa-sha256 header.s=20251003 header.b=H9ijO9tz;
	arc=none smtp.remote-ip=185.125.188.123
Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC39C606A32A
	for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 02:29:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DC39C606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key, unprotected) header.d=canonical.com header.i=@canonical.com header.a=rsa-sha256 header.s=20251003 header.b=H9ijO9tz
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 931F3402C7
	for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 02:29:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20251003; t=1792808987;
	bh=i4VVej3KE6r0xh/Sp6hm3WcrpLIYI5P1lVi2/jNr6p8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version;
	b=H9ijO9tzhTGXqyy2qGYxCC1jLR21xEYsjPStybnUXDJ6jh9MoTVcHkqRrTzsTAWDy
	 jqqd5C9IOndBIH5MyFa79dE5Nw/UMRIU4OogtIcjJSryBbPqlJ/pl5SghyfW42kWJS
	 G9SiXPq8v3wIcpWPjjUovkCp2l2G1xgCIL2wuJwF85DC/om5nLlRmuJlErhZup+yt7
	 YDyskipv1zLbv6bgNBCJbyVqcvHfCTGjwFcOTaeUbwO/sa15sZXKVxQMUvhfgD640S
	 wQzhBU6fzI009PflVt/M+1AFqWMTClzBmQBcqVA98trYWxnH+FPUuB6T/mUYOcXC+8
	 1fkNGWTuoLB0++5a07YiES5jWomh4T0pXhbdNXokHSjkXyKj5nMp5PSjjuDjf4Qui7
	 zlEiyinnbLhzVXCwOIm8rcGSAar7JzodYyOCLZl7xy7KxEMTXBuUoQSTVtwXU1exL6
	 1do/qdGoauBkkvz893UpOvrpgwOtf+odDUq3UiDvCBLQHbdD5pLCcPHZMH6weXCPFw
	 sI4Qzog9Wy/RhdwSEolTXDpBNdHx4tLUpHRayJ6p7UEsmTkLj3hGYLGKGXmHKKmsZE
	 8ZJVbkJ3B8umIJozH0pGEdO4TMEaOwr5MBhn4IWH67rTJ5rtfQPNp1zsdmpj7+GWFW
	 IH1wVySKPVk959f8AS8mpEH0=
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3ab46165261so389409a91.3
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 19:29:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792808986; x=1793413786;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=i4VVej3KE6r0xh/Sp6hm3WcrpLIYI5P1lVi2/jNr6p8=;
        b=1vV77AvXTVq1DHAzjA4IpQ0v7nKYDh7kYcETSQMWkLdmGjZ8HjkD4eEzWshmJMTBNU
         srKrnY43zOyVOK+IEH86ec8Zzw+6HFU9F6BDsKhfDq4FR9UZK8ETMw413fmO0n7sU7Zl
         gdjzfeebLEgUMuf4Dp/10vPj+z3+ScoQ4ZXJPOPYMWvAQ3+BxsQ3ZQ+zXNOv3DAQQGm/
         YEPu9+8sAUHHbvifvhIEDxDg++AXCZn1j6f7Ydg1NXwz80w61n2fIn0EiKDXPelr5YBa
         wSUd5oUll3Ok0QrE6QwMVRlsIS9coGNnc1TbCTKOeR6IVsQ/KIlFQCXSe4yUyWa8Do5h
         7Mzg==
X-Gm-Message-State: AFq9FYLSbROsZpIrc70FlrnPXjDuNDaFUJIPMCXrkGGs/QrjKcN+p1if
	EQJ+CZ/n1jz0iFvUWdngxkm91zBJYBSvEzQRFzZJa11MgeY1dmnoF9whYlyTSm5YSKzDhRnr9RY
	M6BjASVIQ8QH+oF34gKOy25bUshGgBHYvbBpRSB1gUGQIf/TCG5WAq3lbI5HrU6qzr5Uj4HjEvP
	NEHLMqxw==
X-Gm-Gg: AYBFou0hPeRLPoQq8PykaB6celmmQkt8x5A91MhIRpYk/fGH9zx6tasGfg9YHtAW7Ki
	I9tH+O0VdwRuC5IYiHdGavwEANTLd0RxdFObg/orCOmKYA0UXbSiXmH8PpqaldB6tSJvzDQ0UyU
	xtxeMlo9T+XcH2+j+E1RsprYayCkI/cCVad7BgBp7EQb4yAAaeNNz1rHpXmA5TAk84rfMWh0Y5l
	Px3yuGthZywHkHe3lW+gubn1JGR0wjXqjbpOyPsng9XJl98VeXTeJvq8rQVSb3NN6Mk2H4Ay2L7
	zeiOgNGIGJq2wY9NOkZgbaIS2UbDRc4Rzf+7hbDCl89oTDb7YzHrcIs9eRbJVKEzA9t5ApLIEd0
	4kLWKG2xhbLwQEGiwajKDZkflUyh1bSOXZxjM6aPOY/zIIq+xGXMbEJrpFqc9jcXAzOLvOUuEhn
	BZmN4O4WtR6Bj6Zy53PMcUbXLCaApA2xRfer383YDB4UyAf5xIKYVD+jZOUxsmzQx1WHkcelBKf
	Dc33riIVC5I+NINOoyA4qzNU8grh+gJzg2/3os8Bp0=
X-Received: by 2002:a17:90b:58cd:b0:3ac:9c37:9422 with SMTP id 98e67ed59e1d1-3adea2003c9mr1490262a91.2.1792808986091;
        Fri, 23 Oct 2026 19:29:46 -0700 (PDT)
X-Received: by 2002:a17:90b:58cd:b0:3ac:9c37:9422 with SMTP id 98e67ed59e1d1-3adea2003c9mr1490243a91.2.1792808985767;
        Fri, 23 Oct 2026 19:29:45 -0700 (PDT)
Received: from an-XPS-15-9520.buildd (2001-b011-2008-445c-9c57-136b-f73a-3698.dynamic-ip6.hinet.net. [2001:b011:2008:445c:9c57:136b:f73a:3698])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3adebb75254sm587341a91.4.2026.10.23.19.29.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 19:29:45 -0700 (PDT)
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
Subject: [PATCH v4] platform/x86: dell-uart-backlight: Bind through normal serdev matching
Date: Sat, 24 Oct 2026 10:29:29 +0800
Message-Id: <20261024022930.2704030-3-an.wu@canonical.com>
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

