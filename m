Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.125.188.123
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792808992;
	b=U3ojKY5tka4d1VvB06roJVtgkioTFA3QrdvWQXChEWv0/YLnxYTwKvZ8adH2lGtVDl45
	 OLZ1B9DM8sYrAABLgy7S9UfWRk6VFRD8wV+2Z7y6BSSEah2yMAa9MD7u2qXcN7z44OOvA
	 LYye9onvEwgchvR2YoxoQrJzyC5kWuqK283688bKKY3UJu0GTVImPzMqxRLl5TqIKO+N+
	 dtHci3JPK4Y11z64wFC1kbGES3qSvr62spwiEACG7DeBvkOnKymasEizGPrpCHLfss8PD
	 68kq3Ymrma7UesCKcmuM+NMmDl7mt1vxCAl/+5jMrsfK9DRnO50UfLA31jUYlTRqF5w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792808992;
	h=DMARC-Filter:Received:DKIM-Signature:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:From:To:Cc:Subject:Date:Message-Id:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=XcXND02uVU9mligWZKre8PewcZOkoWJ0b9UoDwiNQPw=;
	b=3O9JXVssVw4wPmpGypi3zfZMKudaVAHStNxQ/bg1eCD/7AETWOE/fZraNChNlaeueoo4
	 X41Fc6X9N5Z6ptni28L1nzCUG5z6g5EgtLiPM8rQDAe1SHNlqvyKQ6g/z90kB7eB+hRUH
	 /IlwGUbKyzFAeQnHw/dlXRVihCqEWlmb7KbAUvgdAyy5Z3wexqYsq7vKNojuYBDDw8Ckc
	 xe7lT236p6T3iWI9vcQM1e8zksx98XJ3u7MC/5Muvgt/hAwIe+t4lV7NIupbS4qVgqiSp
	 hhcFTfE1WNQK7R557PBQH8pHcjPck8LyYURpNXALgJUM3nnkSjK/fHVkBqElhNpIqeQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=canonical.com;
	spf=pass smtp.mailfrom=canonical.com;
	dkim=pass header.d=canonical.com header.i=@canonical.com header.a=rsa-sha256 header.s=20251003 header.b=ar7yPg7j;
	arc=none smtp.remote-ip=185.125.188.123
Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE747606A32C
	for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 02:29:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BE747606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key, unprotected) header.d=canonical.com header.i=@canonical.com header.a=rsa-sha256 header.s=20251003 header.b=ar7yPg7j
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 76B3540330
	for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 02:29:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20251003; t=1792808990;
	bh=XcXND02uVU9mligWZKre8PewcZOkoWJ0b9UoDwiNQPw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version;
	b=ar7yPg7jOX43xUprxw2RgD7SBcbws9+iM33JEsO0/7KTqmLlsww187gug+qJUwN9x
	 G3rpWbtWh5dGI3SN6DkCN+uEErKJpN1C49npC3ZV7LP3PJfGq5Kcyur4sJteQo7B3t
	 w0P6EnKFcrGGhoD5zk6r0ng6ayngtatwj0awYSV8neR1RDO+pNKlt2ptlR5V3yV+nr
	 3f11EKu7KW/hQnn2Kksu/D8urs1Mc89IRZyddiBevToKaFVxjFeFtnaZKEF7xP24dk
	 WMVIhvI7km3zS8BYCdWSibnbt5/uqri27ncCVqD3fm/L0xp+/SIyqPw/sREHIzVk3j
	 5NUvxotONw3mqo6x9Y0+AuLFhngR8luwG7Ud5s/i/A2ZpxXzLJygGpgIzCBYLLWzip
	 IyWCHHEbrVVNi4i1o0GoAa2/WFMPYUr165ulUTguyiX8Chmh4xHTBzL8xUpgsfB0rQ
	 Hbjzm9PV3Hv0NiMZh0CsHAhb/7Ag/Ru0V5pFsdSBTGbA5qd8k8v6fAqQUhufKLM5WS
	 7bHwCrFZLxeMIqofWyDFU911k9kuDg2CMhAqCKW2F7/z8U+IRDPGLl6sPKG6GbU7wF
	 Wdemb9otEXO5+7rioJM/77SVYcqtFRr7hWGAmldHslcTsHSUm+mW9jFYrB1q7oLauC
	 GtIR7H6Ll/u5r9XL5GONA3BE=
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3a4ab8a6278so314486a91.2
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 19:29:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792808989; x=1793413789;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=XcXND02uVU9mligWZKre8PewcZOkoWJ0b9UoDwiNQPw=;
        b=zOQ77O3EIunHB26Uasc31W44QC4A9BFFMGNWnyJUPz5GFba8tDhk/3bJ4HvYTgHxey
         9dANSWLPtxnuBA4Q9tciivYeLJCxy/iHeT8Z8zcN6alqmIweT6LHzzERjMcZ80oPWQbg
         JfnSs+TbU4JFoAgeU9mElHXvGV8QV3Yf1UtNo1Rj9dyKaXgSBJ1IUrG9/Z5DQWbbzG1F
         H8u4vCCUDK3b7rnvSvLBba4vub94Tu64ANB42ZYz5ZGmaJvmQPrxNIwIG5mjrk+XWQ1S
         9rUZBZBNPbAoLiHQ3O5fIxml5PDFHZ+He9Mt2rRLZE8/n8SeUTLP9iIZ6JEWz/aVvVDQ
         9hWA==
X-Gm-Message-State: AFq9FYLRnMm6lqSMJRCJPHmbWfeQPS+y/w6zg2JZj0iRkzslnhE7Wbwk
	0hhGH4CylO3XEh3gAm1zMa2vCZPC6ZmJsH1DAwNpN42M8AkJNUqJq3CNbUHUTQ97mZWTqm28AcZ
	0VjLQMKgpAFadiGnTJaA8kfdsHrmpmOIWhTav1GJ2jHPehDn71Cyd+HRrLX6cKAMsBKYdcNSZt8
	d2wLWObQ==
X-Gm-Gg: AYBFou02w5bFDh2+5nwcX8qOgZgJ16qIy/LsSxwZlP2B787cUUkBiWa85Xm3gHXZNKY
	uxV0G/jgkQPzvzGaR8UFP0ErkkapfLUaXySeW1rAx1fueTAjvBGjg9L0miFn5b1XJCiRn8MZW/8
	Pj/qGWagt3wUoSEbFpgvlj8wrvQVvlT9pFITQkc2pwY04b8MJDc1tiGpMx/8kn9ZY1NhtvmCV/H
	a20R/LAZ6iDNztygPrUkRdvQ4zVkwTeH0wIDKUVtgcqd0b1LbaIksYmAs6dMosZGsPOGJAxx+5j
	FmvN/x4YKd6jTqKNWfPvegdcKDjZzVLt2XAG0KrAYfZN830rh/M5Bp6HRK2NHC1CutIXGs2sp+S
	ZV/3PkK/vdD1RJ8DLk2iDB/5gB+dGbfUKTCOkLq9/cGBL8ZiD9Lit6FWgQ9Usi8+BTGqIGZ7K5q
	ucru6f0nA9UTEe8tA+3Z97GMnOdBkTLMkh8POTxF9gjuSUUx7hyBJqkn0cZfdRGQam0xcBywnn8
	27w/IuiOo7ichCE7HH/77eu2SJYVmnyvFUmrY605NU=
X-Received: by 2002:a17:90b:580c:b0:3ac:73c7:9c07 with SMTP id 98e67ed59e1d1-3ade953ea72mr1289331a91.0.1792808988903;
        Fri, 23 Oct 2026 19:29:48 -0700 (PDT)
X-Received: by 2002:a17:90b:580c:b0:3ac:73c7:9c07 with SMTP id 98e67ed59e1d1-3ade953ea72mr1289311a91.0.1792808988509;
        Fri, 23 Oct 2026 19:29:48 -0700 (PDT)
Received: from an-XPS-15-9520.buildd (2001-b011-2008-445c-9c57-136b-f73a-3698.dynamic-ip6.hinet.net. [2001:b011:2008:445c:9c57:136b:f73a:3698])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3adebb75254sm587341a91.4.2026.10.23.19.29.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 19:29:48 -0700 (PDT)
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
Subject: [PATCH v4 3/3] platform/x86: lenovo-yoga-tab2-pro-1380-fastcharger: Bind through normal serdev matching
Date: Sat, 24 Oct 2026 10:29:30 +0800
Message-Id: <20261024022930.2704030-4-an.wu@canonical.com>
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

The software-node-backed serdev client cannot be matched through ACPI or
device tree and is force-attached to its driver.

Pass the modalias to serdev_device_add() and give the serdev driver a
matching id_table, so that the serdev core binds the two through normal
matching. Deferred probing is then handled by the driver core, so the
-EAGAIN translation is no longer needed.

A failing serdev probe no longer propagates out of the platform probe;
as for any other bus, the client is simply left unbound.

Signed-off-by: ChunAn Wu <an.wu@canonical.com>
---
 .../lenovo/yoga-tab2-pro-1380-fastcharger.c   | 25 +++++++------------
 1 file changed, 9 insertions(+), 16 deletions(-)

diff --git a/drivers/platform/x86/lenovo/yoga-tab2-pro-1380-fastcharger.c b/drivers/platform/x86/lenovo/yoga-tab2-pro-1380-fastcharger.c
index 8551ab4d2c7d..d0bd9d4e3137 100644
--- a/drivers/platform/x86/lenovo/yoga-tab2-pro-1380-fastcharger.c
+++ b/drivers/platform/x86/lenovo/yoga-tab2-pro-1380-fastcharger.c
@@ -219,11 +219,17 @@ static int yt2_1380_fc_serdev_probe(struct serdev_device *serdev)
 	return 0;
 }
 
+static const struct serdev_device_id yt2_1380_fc_serdev_id[] = {
+	{ KBUILD_MODNAME },
+	{ }
+};
+
 static struct serdev_device_driver yt2_1380_fc_serdev_driver = {
 	.probe = yt2_1380_fc_serdev_probe,
 	.driver = {
 		.name = KBUILD_MODNAME,
 	},
+	.id_table = yt2_1380_fc_serdev_id,
 };
 
 static const struct pinctrl_map yt2_1380_fc_pinctrl_map[] = {
@@ -260,25 +266,12 @@ static int yt2_1380_fc_pdev_probe(struct platform_device *pdev)
 	/* The fwnode is a managed node, so it will be auto-put on serdev_device_put() */
 	fwnode_handle_get(dev_fwnode(&serdev->dev));
 
-	ret = serdev_device_add(serdev);
+	ret = serdev_device_add(serdev, KBUILD_MODNAME);
 	if (ret) {
 		serdev_device_put(serdev);
 		return dev_err_probe(&pdev->dev, ret, "adding serdev\n");
 	}
 
-	/*
-	 * serdev device <-> driver matching relies on OF or ACPI matches and
-	 * neither is available here, manually bind the driver.
-	 */
-	ret = device_driver_attach(&yt2_1380_fc_serdev_driver.driver, &serdev->dev);
-	if (ret) {
-		/* device_driver_attach() maps EPROBE_DEFER to EAGAIN, map it back */
-		serdev_device_remove(serdev);
-		return dev_err_probe(&pdev->dev,
-				     (ret == -EAGAIN) ? -EPROBE_DEFER : ret,
-				     "attaching serdev driver\n");
-	}
-
 	/* So that yt2_1380_fc_pdev_remove() can remove the serdev */
 	platform_set_drvdata(pdev, serdev);
 	return 0;
@@ -305,8 +298,8 @@ static int __init yt2_1380_fc_module_init(void)
 	int ret;
 
 	/*
-	 * serdev driver MUST be registered first because pdev driver calls
-	 * device_driver_attach() on the serdev, serdev-driver pair.
+	 * serdev driver MUST be registered first so that the serdev device
+	 * created by the pdev probe binds to it via the id_table match.
 	 */
 	ret = serdev_device_driver_register(&yt2_1380_fc_serdev_driver);
 	if (ret)
-- 
2.34.1

