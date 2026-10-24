Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.125.188.122
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792843500;
	b=JQIa4XgvJ5AFpkBBHEaMZQof0y+9/Ni5K+mTbyeiDnwmtuu/SaoceBCveX5v1DoekT9B
	 nBaM5BWfIscZdZC7jVb8hv9CKwLz/onnjQsj6A2IiDaVim3erEOPKIITol1YEsXRlYdOE
	 7keUXovG5kFJ0T4sGoFEGKTyP1/bcnv+b/EYDIgWs1o78WFqt/1khlE/h0p6l4N4cT0QL
	 HtDX4bN4OVXZ2s40y7G7Vd/mdQU6lrF+HNxV7d77H430aE0csK/fTOv+UzBqvIIl9zdJN
	 Iv9Ihh/P2m3ORv0lvAv8XczEbWOCWFrFvpNOnXIuJBUAHtgsci7eZUiNHi9XeCO8Gyg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792843500;
	h=DMARC-Filter:Received:DKIM-Signature:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:From:To:Cc:Subject:Date:Message-Id:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=i4VVej3KE6r0xh/Sp6hm3WcrpLIYI5P1lVi2/jNr6p8=;
	b=CE+1WDQtKJb1Hrl13wzoKtObdWTk+BBSybgsA4OtNFkYFGQ/kjzkvF2XERCnofKXMdZC
	 Z2hEnmeU/PLkvY01wYZpcHc13TqglE94HeK6CXAVZgxJ+RPqHlREb2wIsS4ab/qf5gI0B
	 QZt8QTRBjkcKQUMTGHg4Lpj0WI5Tt/0HBupEObC55PBs1lXefxq/TvXOgIX6jATsw1IMF
	 RywYF/EYtSjZRrYyrsj8bxvzhcer0kvhQc7lzqc2NIii2V3EzqFxdTDA9cuMTu0uYsyZm
	 XdQQ/MeL9LB6t9CmssfHT5LGKvYYmwBcyZK3ExG+NQDUZ/MU1Y7TXmE+FvKLlZIibkw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=canonical.com;
	spf=pass smtp.mailfrom=canonical.com;
	dkim=pass header.d=canonical.com header.i=@canonical.com header.a=rsa-sha256 header.s=20251003 header.b="Sj/37OOt";
	arc=none smtp.remote-ip=185.125.188.122
Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F003D606A333
	for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 12:04:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F003D606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key, unprotected) header.d=canonical.com header.i=@canonical.com header.a=rsa-sha256 header.s=20251003 header.b=Sj/37OOt
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id B7CD8402DB
	for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 12:04:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20251003; t=1792843498;
	bh=i4VVej3KE6r0xh/Sp6hm3WcrpLIYI5P1lVi2/jNr6p8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version;
	b=Sj/37OOtuJAT0DfmI+N1gQgSFXXNz+xG9KImkEuUsGwiAQ+RpD5AeU3xkEofXyzUY
	 +MwuGDNCvyvq8eSgINBUJQ/2zXK9zMJaEfyg8SdptciOAO81X+IUfMtzRu4VtbLdE7
	 dXDwAVeFh+qbI/Oi7axaAihCoKGcp9RC2hfsQxVfea3oiBhmR2ocVbMQnRWNDuVWTI
	 ZXbgcncur1J31d37l8wxBr3pt6gypynXpMnCtSfYGyDnQrExPHCBiW1Fm2hdMfcHr4
	 PkZBM5Qe4QmsJCv0sbJ7p/SpGv2VEwPqQa/h7jTsP2Flsq9ig3C3eK2RH/VTMIDLep
	 1drP3QWoDy1PnnzWQkDOJZZJksNW6QByEPjmRj06LYXQ3znrVP60ZPF9wRhR25Tduj
	 AXpZaS/GWmIYRGy4UFvyqoqhvlZ3/RYHrMCAVNen2sXegfALGtQbiulQ0gzHUDIfJx
	 q22ab1RQbaYvspk4SzOGDE4iNHMokk9tBtW5yNRY9fcNDY3SStYFA03NhuTPoIfQou
	 myDBedp0v/stewfJVKIr09qAMCKCLA36yF+ws1EAH4FKW1DOIUjV3o/hGZeaMfeUn9
	 yOnGv0Vr2YZCwRnbUo0WM9qYe+DKxGVrcu9FN8O9rPhHCdj4dFUwub56nZmnMFgEx0
	 x1aUrUkmWJKi1jcQhN0jZiEQ=
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3abdbb640b2so427924a91.3
        for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 05:04:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792843497; x=1793448297;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=i4VVej3KE6r0xh/Sp6hm3WcrpLIYI5P1lVi2/jNr6p8=;
        b=rQOv9CFSI63xkEd6J8fhuRlCASQhihbAl2F6y6346ktlrz+FjPPbPf8ORwfXTHaG87
         BX3iJMEKhuxeeD3KHCTIPI9FRFEuqr9ubbuu4INthdCoYWtDiMjHt4/VLGaqJJlpahAF
         ZmsWH+d1QUmulu/HwFwggCvn9wUffV5owYLDKyikFXI5jeoCmYCaiIVlRqx2UR44StqX
         C//xUpeQMksDty4YpL69XjFL9uHAIoC8/G5uh0GujvQNh/DsJEmWJw8uvOH63Zyiurmm
         EKQpMnSa5Iu5I+4FiP9kl1FspATa4evdi9ehihUz5hSrLHfXSKzRidshDYSzL6c9Mj9M
         +rYA==
X-Gm-Message-State: AFq9FYKm1HeFQnwR1GhBagls7sqk6j8VdfsYHb/+HtXyWkIy9910Ausb
	IaEdkcVA0YW/wpjur/Ty4jOrXhzg9DFZyNGk9Wf0VZVfXDd5ykNqlwJDvs18g/YU3SM9X8lqjEe
	jJZd2SZ80RS2+Jz1VXQIPXDaSmnA7RekJp9m5Mb7BwsGUeB36ySvBq4IVSXxvYjXk1CVp0o4PCh
	xi0By3cA==
X-Gm-Gg: AYBFou1UAjii1fgt4hZf2ZMZksdknfmWN5qEDLpRo8RRkQpd4JV9T1Rh+mjHg+ZvIZQ
	ndz/q6npQkOAHi/V6tjwtzyVKDnH4Ll2a2YfS46nI2kJ5bdkwDWZ3mH3WbBWnvOZawRvxXRAFMW
	nropv/v9wbWzz2MdP42qVgc5ER4mi3rd9yi/r505xaAjAKzovclHcsBrOwjl/lkTQ6xxJPu6M/e
	flKtyYWjFV5zQvPxwQBt8SWeeK/JhOw3zK9hUbashXB4TmZjHERUtWPNwxdObQmVNP1DfCLNZPt
	p9SYTqumYEIfqyL0PBTnCK+AuRBiWtXKfCVezigEBKC6FDHLbS5Zd01Ehx+ss8HtxycZH7RXNZt
	PK6A6VgCtjfuxGsuZxI6Th9xHY61FhyVHkLDd/s/KbDllaxFrXtuMMwastlYSAg7NC+bf9X3fSs
	Lvdx0YBb+7DBlkFWcNZ1d4qK4e0QLaJntE8z/8BpElkEzmg24dJfdgafEanUgI0/ugvrDDeJcmh
	0wOgV3htr8OY8+6L+2X7/+HQGww1gqFXhu1SO+DVw==
X-Received: by 2002:a17:90b:4fd0:b0:3a0:238b:db4d with SMTP id 98e67ed59e1d1-3adeb0f6c42mr2849034a91.5.1792843497178;
        Sat, 24 Oct 2026 05:04:57 -0700 (PDT)
X-Received: by 2002:a17:90b:4fd0:b0:3a0:238b:db4d with SMTP id 98e67ed59e1d1-3adeb0f6c42mr2849002a91.5.1792843496815;
        Sat, 24 Oct 2026 05:04:56 -0700 (PDT)
Received: from an-XPS-15-9520.buildd (2001-b011-2008-445c-0e25-4b6d-1924-440d.dynamic-ip6.hinet.net. [2001:b011:2008:445c:e25:4b6d:1924:440d])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3adebb24a04sm2893409a91.16.2026.10.24.05.04.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Oct 2026 05:04:56 -0700 (PDT)
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
Subject: [PATCH v5 2/3] platform/x86: dell-uart-backlight: Bind through normal serdev matching
Date: Sat, 24 Oct 2026 20:04:39 +0800
Message-Id: <4ac249174a529766e8fd69c39fc08dfa1572a650.1792831564.git.an.wu@canonical.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1792831564.git.an.wu@canonical.com>
References: <cover.1792831564.git.an.wu@canonical.com>
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

