Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.125.188.123
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792733258;
	b=hc5b/DJZz/p7qsaK4M1g5Uv68BBCERt9MWsB1IFrqUFvU4f14c6SQJaxLDGljXsiwzLt
	 CIMtK8gCyuKlnx7ZEkHPuo0mCkDSTESXdWWRzTxktT/aMOKY4SydWQlNSWdT4+IoFYxuD
	 vtOE4GdoUwhUmqrLiU6vVidtvtkLq94amc6weNwTBSa68h7W6tGlLztCtrvF/wjNRImPE
	 zybyWDgw6vKLQxfSuETravXeC2EPM8eY7Mr5SjqUHHt9QXRXixgt+grOT5BqVfOWNyRGS
	 SRHfcbDrD8br3HSdwPA21DvwTHpvsIvR+sN5byD/LtBNyp7JY62Pzo8bEOB8pGm9aQA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792733258;
	h=DMARC-Filter:Received:DKIM-Signature:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:From:To:Cc:Subject:Date:Message-Id:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=IMwZb/VFaN95E89jP9ukm1SSK05tIJqySoFJB1gotfQ=;
	b=1oioiy3rzg6VPWPwpC5P5/SDe6SVNxAArZYzhg3FkN6ntXjjUtNmEJB2lq1Hhx/ST2SI
	 p6+DPlHnuEW5u2dekbuJI/frK6wzPUmE83RZs4n/KiefaHFA8vsA+smarchB03FFGAVXc
	 yOZMJp1ZPwsMbZxwpnPIp/M+1/WR9cJniOoa29PfH+uuo20nXlfCCrgNI1BrLmkcL3ngF
	 k2LIfMpWxtFW7D4p0eR8SQEkztQ0KASwctuqmYEJSYGw1+JDZYtsXqz3BMQ3HAmAW/oZ5
	 wPYrTi23lcV1JT0WBWIaIb5JctL79fpbPYrq9Q1kwQAVRAUV+s7O9CTrcXUFUDR0EAw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=canonical.com;
	spf=pass smtp.mailfrom=canonical.com;
	dkim=pass header.d=canonical.com header.i=@canonical.com header.a=rsa-sha256 header.s=20251003 header.b=P8O01mz6;
	arc=none smtp.remote-ip=185.125.188.123
Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8E24606A332
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 05:27:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E8E24606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key, unprotected) header.d=canonical.com header.i=@canonical.com header.a=rsa-sha256 header.s=20251003 header.b=P8O01mz6
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 8788340132
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 05:27:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20251003; t=1792733256;
	bh=IMwZb/VFaN95E89jP9ukm1SSK05tIJqySoFJB1gotfQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version;
	b=P8O01mz6SO9B4BmONAdGWQqB1auURsK/bdp1Vo4IPl5at9Gh3c6XNnH7r5EzmmidK
	 46wMLeVg7bFfofbGPFk34BDtwi79L7D8T+pBviSUplZPwtVH/ALpqGENSeybb/6ucs
	 7Gn5biUDw0fp0sTtjY8JtUNKNYNytI3cgOWAxJqGpZVHSrFXiN7FQlRDTgXJpxWJxe
	 2M35YE7ViMaTfs2bPlKKlU5TfgU9P/0iJ1gOQ2qnbjo5qeYjl6rP+1IvbKrCnq4vHu
	 ime9ci7BzR3yxPF15fQDyah9PAccPnDiAH0ULV6a8Xqr5vfUsBSuq2QZ2BlR8vbnb0
	 MA4iFucwFpDCQZjkNP3B6hNnz0xi/IReu47jCYPvuvtexbVr1r39ubXnKyZa+kOAwa
	 00W3WXoCUrjeO4WfgHUg4emQuBOUVSkFrXRur0w5zZzix4QM9GHMDTPTjCb+pn7TVX
	 dY0koDcG6mDa7j2LBPyvHiEltn4iY29bue6MIRk4DsTXUcu/7Yht92guvmYyTLe3FI
	 +l2BvVa+Kx195L2VAFuflqMgXVwMwusWdEmuKDGZdgp/wgY6G9lREgzG1kenD9pbLt
	 mvGDxGcb8oVZ/R5wS8uUi7HkD5rPfoss7oyHWahQ4tjTBUqV1lK4dOd1Ps1xx5d3AL
	 TKhe4DWS26YmYirKss2RxukQ=
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-339628f2bbaso70937eec.1
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 22:27:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792733255; x=1793338055;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=IMwZb/VFaN95E89jP9ukm1SSK05tIJqySoFJB1gotfQ=;
        b=duel3iVDDYlIjR2regVtiBwChLUTslwiF2KHYC0ufMhStUHjoEXDIxJXpM7/lUdW4m
         xObtg/2pSHdn/JfHtzCJWl4Q+CeXyGd24HIKfxstlIxMFyMPULCjgld2pBeGIZaVEXvw
         byqwQHH94gIHjcAI8zhiagyBOoRRGKDVtT0mIL8TAZSsv0t/OD3sX98qEoYILO9BY3YF
         ICi2TXghoJovBv/jolAIDsbbAV36NIWjdNKaoE2qYHJiSpzU4LlPxxF2fyXQ8rMdWn59
         MZK0wlCgah7yZOKRWzl+VkY9AWuG/GifECljKkkx/gXC9rRI5hUQCgxzA4rSNeDWidkB
         ltaQ==
X-Gm-Message-State: AFq9FYKbM+xN4AvCYrkcyORiranWFFdHLIn0E118AT09zUQfzs6D6OXW
	wJ86ebDyjjrz0/Gu9Ph1D5/o/YtlbCL+ckjJt69cQKouB4dMpon08QDoAKvgOOeLJyu8AKjPcpE
	ApxJAhf/MGVtvh0f2B+l4igRE02vMyigtPvx+3xO8f4fAo4VM6w5W6mWntqHXTvvgZDlnyWv5HA
	kxvXisyQ==
X-Gm-Gg: AYBFou3x+ewl5tIhuvi8Tx+SBnAAzIDU/PbgBEbXv5V6E4HV9ZpDDl4FM65i+qRnYM9
	jT0J0fE3sheF6lRpDMzAynRvQqx53E1rEMGd3roRUI9ju1kPm2bNM60PV2l23MLJUcPtfcyV2Ai
	CnYDtkxmpc32CpluTfrfxNRoEzZBLncQ4P0/fCyFRwscP1Nj7Fv0zfspVoYDQJ5Cr9IQX/eteQz
	J8890PTiItnGAxZnmeMug9eTSM8OANx2D7+u2A/N/1BcEX5rDUawLKFPX+W1SZJ5sHmwnHiu7+g
	hB2/GefymuQGxwUzR+kjMcI0pgQhQQfUAAbO3hAD+vvYlssdrjtggMDq5c5INSGBLmIy8CaSXxH
	G5sGGorHjdgcyFjgdxUqx9U9EtYc4UUD+syTMN9a8bdAcUapssqjzA3m9dY69ZdNCGhj2y2hWP0
	LnLq7mTD68V6Ni+YB5v1T20e3tIX82uYTPZSLQCYigZRJY1Gvsj7J56SnoXCHJpfHdefHJAjVgz
	nx1KnKRUVISb+t0B4Y21+iMyeFcXEY7e/HKvjjqdhI=
X-Received: by 2002:a05:693c:87d1:10b0:367:2bed:e7a5 with SMTP id 5a478bee46e88-369d978c94dmr2892488eec.2.1792733254843;
        Thu, 22 Oct 2026 22:27:34 -0700 (PDT)
X-Received: by 2002:a05:693c:87d1:10b0:367:2bed:e7a5 with SMTP id 5a478bee46e88-369d978c94dmr2892448eec.2.1792733254322;
        Thu, 22 Oct 2026 22:27:34 -0700 (PDT)
Received: from an-XPS-15-9520.buildd (2001-b011-2008-445c-b47a-213f-cf99-45b4.dynamic-ip6.hinet.net. [2001:b011:2008:445c:b47a:213f:cf99:45b4])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-369d9e1a085sm3590098eec.29.2026.10.22.22.27.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 22:27:33 -0700 (PDT)
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
Subject: [PATCH v3 3/3] platform/x86: lenovo-yoga-tab2-pro-1380-fastcharger: Bind through normal serdev matching
Date: Fri, 23 Oct 2026 13:27:17 +0800
Message-Id: <20261023052717.2577234-4-an.wu@canonical.com>
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

The software-node-backed serdev client cannot be matched through ACPI or
device tree and is force-attached to its driver.

Set the modalias of the client before adding it and give the serdev
driver a matching id_table, so that the serdev core binds the two
through normal matching. Deferred probing is then handled by the driver
core, so the -EAGAIN translation is no longer needed.

A failing serdev probe no longer propagates out of the platform probe;
as for any other bus, the client is simply left unbound.

Signed-off-by: ChunAn Wu <an.wu@canonical.com>
---
Changes in v3:
- Use serdev_device_set_modalias() instead of ::name; add an id_table
  to the serdev driver

Changes in v2:
- New in v2

 .../lenovo/yoga-tab2-pro-1380-fastcharger.c   | 27 +++++++++----------
 1 file changed, 12 insertions(+), 15 deletions(-)

diff --git a/drivers/platform/x86/lenovo/yoga-tab2-pro-1380-fastcharger.c b/drivers/platform/x86/lenovo/yoga-tab2-pro-1380-fastcharger.c
index 8551ab4d2c7d..31780c4aebe0 100644
--- a/drivers/platform/x86/lenovo/yoga-tab2-pro-1380-fastcharger.c
+++ b/drivers/platform/x86/lenovo/yoga-tab2-pro-1380-fastcharger.c
@@ -219,11 +219,17 @@ static int yt2_1380_fc_serdev_probe(struct serdev_device *serdev)
 	return 0;
 }
 
+static const struct serdev_device_id yt2_1380_fc_serdev_id_table[] = {
+	{ KBUILD_MODNAME },
+	{ }
+};
+
 static struct serdev_device_driver yt2_1380_fc_serdev_driver = {
 	.probe = yt2_1380_fc_serdev_probe,
 	.driver = {
 		.name = KBUILD_MODNAME,
 	},
+	.id_table = yt2_1380_fc_serdev_id_table,
 };
 
 static const struct pinctrl_map yt2_1380_fc_pinctrl_map[] = {
@@ -260,25 +266,14 @@ static int yt2_1380_fc_pdev_probe(struct platform_device *pdev)
 	/* The fwnode is a managed node, so it will be auto-put on serdev_device_put() */
 	fwnode_handle_get(dev_fwnode(&serdev->dev));
 
+	serdev_device_set_modalias(serdev, KBUILD_MODNAME);
+
 	ret = serdev_device_add(serdev);
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
@@ -305,8 +300,10 @@ static int __init yt2_1380_fc_module_init(void)
 	int ret;
 
 	/*
-	 * serdev driver MUST be registered first because pdev driver calls
-	 * device_driver_attach() on the serdev, serdev-driver pair.
+	 * Register the serdev driver first, so that the serdev device which
+	 * the pdev driver's probe() adds is matched as soon as it is added.
+	 * Registering it afterwards would work as well, since driver_register()
+	 * also walks the devices which are already on the bus.
 	 */
 	ret = serdev_device_driver_register(&yt2_1380_fc_serdev_driver);
 	if (ret)
-- 
2.34.1

