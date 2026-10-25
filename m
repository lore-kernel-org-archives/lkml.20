Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.125.188.123
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792893821;
	b=TBDlI4gqfs5CNHkbleyGOrerFMx2sQbsRjkuDVYYUE/pKAqDhCL134e91X4dmMLVv39h
	 bpWMc6sXQNfTWRURbXinA3qR8lNkKGOyY1T2PANfJ/GzWs4VqdSsMAAFG97jS3P71Irib
	 Zt01rvhky3x8t5w5NnDQhF//RFwfwfJjqmwLPxOePbyobr0XdBdzGYBOWqSOIvpwudhNn
	 1Cr8RyktnTXHteyZZg8nPQAOUeCk0B/Gb0ID0q0I1lPH3Elc6Xsfn6mF+Z4MRnO0NFBWR
	 Q9nCmoWS6J6GLrzmWXsA0w7FVu+DFzkkvd76GgvaZI0+6T5g0XcNwfoCChjCTmStKuQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792893821;
	h=DMARC-Filter:Received:DKIM-Signature:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:From:To:Cc:Subject:Date:Message-Id:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=8HMHgdeILuk+JbZuGBNZ98iCp3ntUR48S81/BHCsYyI=;
	b=sumR9+3TdIoZ+NvQtX2bKlG2owoP6pSSV9XKjbzOofvQ/2r+oz2ovvv0xSfaVHm8jvoY
	 Y8zSVzJEeDA55zGXMj8YYEeqsWzMuFeCYD99xaUgw5wmVVjDfb5ocA4Pq7+A7cpKfpNpx
	 LuDs4w+FkTkkS8JstgmdTm6dDlMnLhUr96e9UZkW8IQpCmt4fCCViLJ0obFEggoLaCe9K
	 q09oYfRP0+Rhs6wNzTTaIhi2cN5suKZJQrsPQ7DvfE1r/aFNxJSYbk3hnFc0UWBitBMUJ
	 FJ6yDCLwsi9Du/TjGU/LHa6lPQlkaDNBIxfzyAzuaAYt5EKPoRTZuox4mRlBAz9MLCg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=canonical.com;
	spf=pass smtp.mailfrom=canonical.com;
	dkim=pass header.d=canonical.com header.i=@canonical.com header.a=rsa-sha256 header.s=20251003 header.b=rWvGhGop;
	arc=none smtp.remote-ip=185.125.188.123
Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CAFB606A32E
	for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 02:03:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1CAFB606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key, unprotected) header.d=canonical.com header.i=@canonical.com header.a=rsa-sha256 header.s=20251003 header.b=rWvGhGop
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id EF4EE3F2D7
	for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 02:03:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20251003; t=1792893818;
	bh=8HMHgdeILuk+JbZuGBNZ98iCp3ntUR48S81/BHCsYyI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version;
	b=rWvGhGopgZ/uub5s+4J3JkkG/NT1mwOikSHDiqcad+iEJVIp9qJEan7aJEZZhunbo
	 CuCCrivvvjE+5XWgnpf7hqMHCGO1/06PxO25quhQygBDmuy7H1u9F9T7k0bTVfpX4M
	 L9NgC/1bQnCPZzWTx/0j5EGodPydeyAVFclUwD2FOfztBtj5eb2XgL+8o79OxlFd+s
	 eJNOiK9fz7QvkJE8naiiHTlXa8WYC60dHFqgy/wqS+FRY9nNZdtV+0rTvOPZafDCGJ
	 wqjieNEOM5YFsPuNvVUaG67S7G0XP9atyiJazK4LI2JdYw1jPvLTh6wENjL9BaxyTl
	 AMXIUAWZ9WZsWxnzN9GhJMQnbEdZFOCwqcYcEj/p9UHh4E+t7xDAAm7i9zbyTlhtPV
	 JRSkiwRArceurN85BkmhtsyX5xuZcpE6vKISDa0SBTU5TgOmEMtokjT9s2un60vwKa
	 CdQxKyUmc0oquG1VD6VqzAaM/nbx+qvWP8eSkCnM4nmzB8W4ncovuPMXWLmDmjUUSR
	 AmesFQnTyo8+5yWiFgt1TUMbOyA8jrv1YqPd1nzpkwSmNR4iSWUQxpN9hlcvZsjKqG
	 ZMsnkhcGqAKUZL44JBfp/C7rd2MaqaAX8IiWKuTbsluB2VxkdnOqG6ZxUykX8o617j
	 hpzL6csLuFrofQzAaLZUnHSY=
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3ab27c28489so689478a91.1
        for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 19:03:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792893817; x=1793498617;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=8HMHgdeILuk+JbZuGBNZ98iCp3ntUR48S81/BHCsYyI=;
        b=DSm0soSJzPtwZS59FE+mwdNkwus2lQ/vHbGfyBTwBmqd9nHKkm0Evndnk+Qj9HxQAh
         V/e8bsybEA67+9VxoSPV7PricimFZ7jl6C61ICkpk8FeuM+PSAYylioU08vVFLLRlsPl
         KucbrzKT019syRuayTpMJx1hC38f1DlBIXrI//kj17IOEYKvxyYQrXB603NtG5LLg7dq
         iaDhZOYEOeuzDwdBK+qb9Xh7Xew44nElQigjiFJhGlqkUnqr3Tpbq+0JRDWelEFvG6Fl
         sbi7Te5q3YaITl7pLodz9aGJXiTVWqB8iJua6C88VgrEO9qNVfIHaWlTErk1ZNnPLS/f
         XBOA==
X-Gm-Message-State: AFq9FYIYNFbXsjI6s8zfdfy4fs6ReGGHWkSWBm/Rgk0d6byeCSZA8ZA4
	wGe5JGNHgEWzZxyQzb8MRbVk+eStuXsSeJ1nLISvwQVPXvqtul1QT3pZ3hmqXu2tgCdjuadRaSl
	pc/hTbTT+sg2Rlu/0TYjoMNRTrQQ1rge8kyqntpGtP+/ceXAajxPlkHkhKADS73Wf3ZgRmfnbIv
	S/foGB0Q==
X-Gm-Gg: AYBFou1KsbUdpQfo2KkTAgkH1ENP2D6EVmJhD6nwLt/5Kl2Pap3LIhGqpHhHQchZllj
	KAE7PLZ5i4hwupOcdZfOKSWZAVivZbxuhIOWtZk/RcS2W6y2zAAZMbXzBaVJtfy2xXtKz3AS6dS
	cxMZ7Yk+2t7SBJ67AOO7T8zxobeVIc2roSGxODzcte6dJ53C2IfCYU6L4Dh3YrVCGODR9qlbNqq
	VJXoJQT8FTUSB66TaYPYV4m4beAcsO6rYbS8aEQoCHlMFFhycQ5mS3lFmttO9YXVQfSpivmIAn+
	gdb6NQxyMcRCseFHKwpA4ql2qUGAZGXCwbXq9eiE9WUYjjPfNDnRXci4r51FQW4U6KqJ6FUiYpD
	Z2JTzDIIooQyKOlR/vt32q1RSogJmGgL3UvyISTAGJsxnnaUXZDC+ygZbi5U0o4eF73JzVNGEDT
	ulJg2QbwoeJMOSK6u+XpB06q1a/kLnifnG7H7L2eoHq1RgiihFNhgGIk6MO0eP8aH8fwpktU3c3
	i5C92ZEorVkaswm8QASkoAOUhosCAf9kRYQ/b3rEg==
X-Received: by 2002:a17:90b:4fd0:b0:3a0:238b:db4d with SMTP id 98e67ed59e1d1-3adeb0f6c42mr4824993a91.5.1792893817331;
        Sat, 24 Oct 2026 19:03:37 -0700 (PDT)
X-Received: by 2002:a17:90b:4fd0:b0:3a0:238b:db4d with SMTP id 98e67ed59e1d1-3adeb0f6c42mr4824972a91.5.1792893816917;
        Sat, 24 Oct 2026 19:03:36 -0700 (PDT)
Received: from an-XPS-15-9520.buildd (2001-b011-2008-445c-0e25-4b6d-1924-440d.dynamic-ip6.hinet.net. [2001:b011:2008:445c:e25:4b6d:1924:440d])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3adebacbf5fsm4226044a91.6.2026.10.24.19.03.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Oct 2026 19:03:35 -0700 (PDT)
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
Subject: [PATCH v6 3/3] platform/x86: lenovo-yoga-tab2-pro-1380-fastcharger: Bind through normal serdev matching
Date: Sun, 25 Oct 2026 10:03:17 +0800
Message-Id: <3827984795c4bd797008652a49b069151e1e8be6.1792856688.git.an.wu@canonical.com>
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

The software-node-backed serdev client cannot be matched through ACPI or
device tree and is force-attached to its driver.

Pass the modalias to serdev_device_add() and give the serdev driver a
matching id_table, so that the serdev core binds the two through normal
matching. Deferred probing is then handled by the driver core, so the
-EAGAIN translation is no longer needed.

A failing serdev probe no longer propagates out of the platform probe;
as for any other bus, the client is simply left unbound.

Signed-off-by: ChunAn Wu <an.wu@canonical.com>
Reviewed-by: Markus Probst <markus.probst@posteo.de>
---
 .../lenovo/yoga-tab2-pro-1380-fastcharger.c   | 25 ++++++-------------
 1 file changed, 7 insertions(+), 18 deletions(-)

diff --git a/drivers/platform/x86/lenovo/yoga-tab2-pro-1380-fastcharger.c b/drivers/platform/x86/lenovo/yoga-tab2-pro-1380-fastcharger.c
index 5e568fe1162d..ecac3eb3f336 100644
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
 
-	ret = serdev_device_add(serdev, NULL);
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
@@ -304,10 +297,6 @@ static int __init yt2_1380_fc_module_init(void)
 {
 	int ret;
 
-	/*
-	 * serdev driver MUST be registered first because pdev driver calls
-	 * device_driver_attach() on the serdev, serdev-driver pair.
-	 */
 	ret = serdev_device_driver_register(&yt2_1380_fc_serdev_driver);
 	if (ret)
 		return ret;
-- 
2.34.1

