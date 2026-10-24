Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.125.188.123
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792843509;
	b=YyAJAbND+QUC/wDcmpYZUNIsdXNscKQSamPq4rErxDJW9PF3lnS9rKqBKE0ACdTejecC
	 pfEzEi6YLRheVPgYw30TK5cbmjXKzWKlHLTogCm70AQpaLtEeTGdrgdamo+ofifv1aEmo
	 GZ0+vF7xmwOLQCzJhTcwnA0/51dYwOKptDHwXigmw6/S+RqxvsmGd9m2mBwYU1Xtji1G5
	 Ah5jkQW4C3iZXYcEOWFlgroyjaFCDcbFlFpYFgBxuqliUeOt85RLaZ51I43le2InZ2j5a
	 ZtohAhrObw3N9urwCWnKDc/ua71sjwizhb6J25HaSLpPTN72BgvQSi5/k7rZ3Be3ejA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792843509;
	h=DMARC-Filter:Received:DKIM-Signature:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:From:To:Cc:Subject:Date:Message-Id:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=XcXND02uVU9mligWZKre8PewcZOkoWJ0b9UoDwiNQPw=;
	b=PgP0bQZoRmHO4S4dr5bdSg2kLS120VW1ylvIiFpMremlF+WmWNQHJo7PzykFd1QGsQD3
	 JPiPHkjN5ce9wjLfiWpWwmGd24q6bknXtG+3foq5hbDs1VSo02/MrVo9wP5BaoTBJigNS
	 m8T6e5CFZCTM665nxw9yecnh8Bz+GROa+7ozLuITuquTtwr/F+y4W6JWMe0Ym1Us6hxQl
	 uLQLgdJcya2HTyKkctheaaurACdg8Gy8ZVdYpHpMDdc9p1+2krHruBvAuthaPpZmRGrQm
	 jXrPxFoMvkmb0R/9DXLse+HwhvquWvDmbk+4YKDYyU+VV8u06fYDVzbKmPJmLVBhlVg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=canonical.com;
	spf=pass smtp.mailfrom=canonical.com;
	dkim=pass header.d=canonical.com header.i=@canonical.com header.a=rsa-sha256 header.s=20251003 header.b=I0sgSLyf;
	arc=none smtp.remote-ip=185.125.188.123
Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F09E2606A31A
	for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 12:05:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F09E2606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key, unprotected) header.d=canonical.com header.i=@canonical.com header.a=rsa-sha256 header.s=20251003 header.b=I0sgSLyf
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 8BF574031F
	for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 12:05:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20251003; t=1792843502;
	bh=XcXND02uVU9mligWZKre8PewcZOkoWJ0b9UoDwiNQPw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version;
	b=I0sgSLyfiwSxnbjIJjhfm6g1YLsCEnhfuW5WZ6ZjzjYCbx3orKIIuYV0pRq0DzXvN
	 lOwRVWd4ByYKijLzCzVEzxbJE6JwbqXUsAxzysrLt5AoRHDoa+/Uhxt6ihfbKGrCcL
	 K1yi1AizLgrkT1WTv5qLTqlGM/WvuX+LbcAlhBtdYvWmLUsjahmmupNPpfuZerN+DZ
	 ZCqwCwU5vB2flUXABFQcsAuq5xdoTsA3shFrtWRjK7wS0KCO/FmJfL5Zg16cHOCuLW
	 Wjz0qxej8y5ERq4A/3nrV9UauyRdkVrV4ZkptuaDuXG9qdISqfDJF7cj/ssjaaobub
	 Teq1YkIeUH8lA3SshGx0Rugt/shlpmQL2fHCpcKNvseg+IM8dEkKvOeFrVyYUjzWve
	 wTeQo9etPzdY9PML+ZSi3RAcYO1fvRW3QZ5lRmL8tfup6vwJFQb4vB6rIWzCY1j/bC
	 y8ks4b7rn+Hr6sU3L9/xdwIZMiz728A0W1dy+eodYMMTVw6lqK0rAbKy9Vac1UF08K
	 m+wyFIzpe8Gdpb0wcN49oZ7sekN9u6PPMe3Qi4tSMPPjpr8aoo6qe/VbpKCeyBbruW
	 EF2InAednb9OijiUIavZjUUJd278+6LkX9DpnxZMibY16GfawjrpXLNGpG8iWWboJE
	 kbLZb6nsgHhZ0cE+7Le61Sv8=
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3ab46165261so516132a91.3
        for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 05:05:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792843501; x=1793448301;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=XcXND02uVU9mligWZKre8PewcZOkoWJ0b9UoDwiNQPw=;
        b=LUz/HKNNIsjaFr3zu0fiau7LcKHi6JBFEJFn6aF6qk79VxD9g1VZtsN4ITdbwfWdLL
         tI1l78GU+zQrKmebM0NwosTUTydeZ5xM20cwgxI54X9GPmxBjLSidnZauYpnPF+tVWez
         DynXhmkfjc4GVeiP9AZeSYWdO5kXLLlhfL+PM9I/TUBLK6jhkir8tKLk+bDx4syNZJtG
         yUqdndIrzo/jU2ER0XrE0+Dye0fZUKCHJAh4d4Og3hi4VRYNspH115P9fNtLADWfzH5B
         OmeTaOzpL3L7ka1xfmun1NNhxVNoedEGlPH2xFSl7HII+Xd4WbDJfnBK+jcrIGTJZdI8
         oxEA==
X-Gm-Message-State: AFq9FYKKaa7KyF0T1a4nol+TAzWKvrRKipC1fRXusL/5HQ4zQaPEX6cm
	LVy4iuOwChneFIKlmGCBQOBYcQcidHMhhoDlcS+hbq8IEoe8+m6lQLB2BWF2gNBCNept/ABwT0k
	qUgYh7S7/Lq8wfqs2ZIYLtsD0eu9DyG5siMJnlWSykgJsug7crXa205SiYKunlB4bfbygQSTaHZ
	cB2MR4fYda4b/zBA==
X-Gm-Gg: AYBFou0xji2TB9q7r+E4sFuHsGkJJUh4zUBaT1y43ApNBxBlOLTTRuxbPztvVeOkVu0
	CnvRCSNaTgQjIcxRO5/vN7SKNxp+eF88yYRVXTcfyRmaNsU+1uMUJekVImNOcJvDvkfJnUUzp80
	/Ygh3I/O/X44Uxt1P+J4RiFPZLYDESKLcgoJt++FXVvGTJBMttxfcD8qFN01I/cK8U9BwmCL6Fm
	2th9768XHIgZvPGn5Jn+VtUcSKDbRuTsEP6YCNJ5POuVRoreVHpRboz0BPtb1W1iUqCCbXycLHW
	WdRGuFrAQX5CjPevbTWwdLbv2y2N9bLMVZlcX/C1cHqpPiC+TVcxCCqhQolkDcujrvFDtr0GN4Z
	FLejJIyaYrcI2lGfH71Yblz16cZvZ0d6b/SOxE1yXTkFYodu2vHqS1crgzmOuJ+Y5+jfSSl0qo9
	9tWDb5I4yyJqiE/bzA7SBkpfYwlAbVqN7mW2yuXsgY/kLyxuJOtWdjbTKY/xrDNudVWHTNVr+aB
	6HXtu/5aJeiMv7dwK+Crg3A5duGs4IWw6JjEWzWTw==
X-Received: by 2002:a17:90b:580c:b0:3ac:73c7:9c07 with SMTP id 98e67ed59e1d1-3ade953ea72mr2539071a91.0.1792843500791;
        Sat, 24 Oct 2026 05:05:00 -0700 (PDT)
X-Received: by 2002:a17:90b:580c:b0:3ac:73c7:9c07 with SMTP id 98e67ed59e1d1-3ade953ea72mr2539026a91.0.1792843500265;
        Sat, 24 Oct 2026 05:05:00 -0700 (PDT)
Received: from an-XPS-15-9520.buildd (2001-b011-2008-445c-0e25-4b6d-1924-440d.dynamic-ip6.hinet.net. [2001:b011:2008:445c:e25:4b6d:1924:440d])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3adebb24a04sm2893409a91.16.2026.10.24.05.04.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Oct 2026 05:04:59 -0700 (PDT)
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
Subject: [PATCH v5 3/3] platform/x86: lenovo-yoga-tab2-pro-1380-fastcharger: Bind through normal serdev matching
Date: Sat, 24 Oct 2026 20:04:40 +0800
Message-Id: <5e70a181599ada304c6aa6589cc61662f1a8d710.1792831564.git.an.wu@canonical.com>
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

