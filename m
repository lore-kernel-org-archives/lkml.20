Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32B4B3AB286
	for <linux-kernel@vger.kernel.org>; Sun, 30 Aug 2026 11:15:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788088527; cv=none; b=QzGuNrZwIbP4YArEnVf+fFK+e8B5NI733loUjC3WivoEH34ffA9NF7cLY6hURnxijBntLRF9m4eduG0IT570bj8pPmdU+NmbS3R4E5ixPmic5itLNOnWPMLOa5m8YI2qG2SdmXYBbZwZKv5o2G7zMty/lEth4hojqtqKOIL5a3U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788088527; c=relaxed/simple;
	bh=bSFkHlBywicpVhyA0eqfqd0HB8Ubz62+8OUFuJaDKo8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gfZrUfhzxDN/SrbqxTbA8BIaQP0ZXaYu2YUxv2XKiyBblFVpTWO550GNihOfKBGyRTIKkPCenPPtnQQ3i1VH2/zuTirRuUwTJnCrkeWpqXywFFY7prTKM5DNSfKvs5ZTrXsQUrq2Eekba3fm3feqpbjKI3Na6s/2+pPQ1K4NIRk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ak27+rtX; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ak27+rtX"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2d01663d816so16729535ad.1
        for <linux-kernel@vger.kernel.org>; Sun, 30 Aug 2026 04:15:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788088522; x=1788693322; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=btitZhw7p+mJgoG52k2bmHLRAFRh3kEQVi1cVagZJs4=;
        b=Ak27+rtXAAHmQltBdfUF9WU4UmSAFljUqpv83eOzIjpWJgrz7iOpABmxp00ZmHenDF
         pMukqbmAteOSQeRRAxe5MupWctG5sCN2vZy1HxxYVp6IUcqdwrAlqEs1uv35ggoU5Spc
         pjsbBtJisN56xO2kSd+x5OSeTPJ4PhbFbybuT8LXSxVsuggw2RtODPX2rp5sA4ZGZ9l8
         e6mbrdu44AlcifR3yyincegEwyrFFK7+EW/LQdzmqJJ7oPF4ps3uvAaWSDuYEey0w0xZ
         yZ0blchg34UWYBq/ZuvvBRpKKtTXo0GFHF0vnaNEhjtrZT8wssE4bU26jqXDe9I9KcYr
         eqBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788088522; x=1788693322;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=btitZhw7p+mJgoG52k2bmHLRAFRh3kEQVi1cVagZJs4=;
        b=GozxeTzmU8jstoCtrX/6A05T+P0j1FxWSA7t9Gi5yWKdii85Xh+pVjewo4Y4C7BYQ2
         ZNY0QSRf8wcdNW6nUq0xnRMlvFDmAdHrTMRG4Mf27oZ6/iXhiAI+l3AA72gCV9AseXPQ
         B3OwHWX1avOakOvcsQ8Ft/yj3Mhaz5BTWx+YujHecMIl+LAlx6D3AssMJaxNaCG++gqX
         9WxTYe71CeannFe0kjS6TSGtNoSCRHAx89zX6clun3JThORwupWaXsoFsqoKWwF7/sK4
         sQmQanZ5iQcEeBqva0lCLbLEpTE1pjaKBPeGZ1mwPVBo8SpHkjIRmWyquYXGszuWM3ye
         CQqA==
X-Forwarded-Encrypted: i=1; AKwUvBy9+FkEoN6Go5ATtR2KbIBrGgK5wuxsogWhjg8Pi2s6E2vECQqVBt7XRuvOvBoTvl5aoO4UhxXOAjmg5OM=@vger.kernel.org
X-Gm-Message-State: AFuF++k2SHWMYD0yiUqc5dMhgTVe8UKy9AU/y7DOpYx8lsHEcqAmZHQR
	eMo0yNOKOe/P8rGLzCKZTTP9TJlWKRqa9z146YnRZzJ1vDFs5O8A+sHv
X-Gm-Gg: AYBFou2sojueQJ5NXeu8QS4RwnNMFJw7draG93AqqgcGTcuE9cVOgJk5aFL8PnEU4Gl
	1KBmG07acoFNwnWgrK3a2t5cJBiL7Txly4Alkuubs3aBT4/EXR9VSOGfM5jUfO497Q9FsxAYh4O
	Coz7dexNqeES7T8N/XsCfqxSztetMagYr0bMRTuyZgO0SS+yRTEpxo/kLk5XPhWUsLfcgfQHA8E
	XP26kCgfzoCGgdditjSZz66Eh67VKQOoOZ2VBqljMyEIggBbGfKQXBg6Q8dPwYViAal0ES4XO4K
	COwG5kdtuigkQiwC/G6ur2h3v8m13yPy5UEOmy7SyI3tOWCyXqCNzmh9wQs0UizbWSnfw4thU5+
	bdkLTQ+RHfUnNYNbR6zGCQYGpezBc8ZBDGQYFxMglDOcew9Qjk3XFLPMheI0cTg+xab90jnCqmi
	YpHiOBXOFX1Sm4eyiHhZ416xMNjgzqUplaI9ZekPn+WTQfVPRVSQ5RpECSR3Bm3j29WPcy9efr9
	hKKZdk3DYCW1M7DqhuEfxjQu3IJPcOitBd7DJLXKlG5NE40ZOPm
X-Received: by 2002:a17:902:f70f:b0:2d0:cc92:f7a9 with SMTP id d9443c01a7336-2d74dc0da0bmr332601975ad.4.1788088522058;
        Sun, 30 Aug 2026 04:15:22 -0700 (PDT)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:c021:485f:75be:3c7])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-32874498f9esm18782313eec.20.2026.08.30.04.15.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Aug 2026 04:15:18 -0700 (PDT)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Date: Sun, 30 Aug 2026 04:15:07 -0700
Subject: [PATCH 3/6] platform/x86: x86-android-tablets: pass node group to
 gpio_secondary_fwnode_init()
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260830-x86-android-lenovo-swnode-v1-3-066a91acb4ba@gmail.com>
References: <20260830-x86-android-lenovo-swnode-v1-0-066a91acb4ba@gmail.com>
In-Reply-To: <20260830-x86-android-lenovo-swnode-v1-0-066a91acb4ba@gmail.com>
To: Hans de Goede <hansg@kernel.org>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
 Andy Shevchenko <andy@kernel.org>, 
 Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, 
 Linus Walleij <linusw@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.16-dev-b242f

Currently gpio_secondary_fwnode_init() uses a file-scope static
gpiochip_node_group variable initialized in probe.

Pass the node group directly to gpio_secondary_fwnode_init() as an
argument instead of using a global variable. This allows reusing the
helper for additional GPIO controllers in subsequent patches.

Assisted-by: LLM
Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/platform/x86/x86-android-tablets/core.c | 15 ++++++++-------
 1 file changed, 8 insertions(+), 7 deletions(-)

diff --git a/drivers/platform/x86/x86-android-tablets/core.c b/drivers/platform/x86/x86-android-tablets/core.c
index 722c0ae4ecd1..45673bfc0b7b 100644
--- a/drivers/platform/x86/x86-android-tablets/core.c
+++ b/drivers/platform/x86/x86-android-tablets/core.c
@@ -156,7 +156,6 @@ static struct platform_device **pdevs;
 static struct serdev_device **serdevs;
 static const struct software_node **gpio_button_swnodes;
 static const struct software_node **swnode_group;
-static const struct software_node **gpiochip_node_group;
 static void (*exit_handler)(void);
 
 static __init struct i2c_adapter *
@@ -377,26 +376,27 @@ static void gpio_secondary_unregister_node_group(void *data)
 	software_node_unregister_node_group(nodes);
 }
 
-static int gpio_secondary_fwnode_init(struct device *parent)
+static int gpio_secondary_fwnode_init(struct device *parent,
+				      const struct software_node * const *node_group)
 {
 	const struct software_node *const *swnode;
 	struct fwnode_handle *fwnode;
 	int ret;
 
-	if (!gpiochip_node_group)
+	if (!node_group)
 		return 0;
 
-	ret = software_node_register_node_group(gpiochip_node_group);
+	ret = software_node_register_node_group(node_group);
 	if (ret)
 		return ret;
 
 	ret = devm_add_action_or_reset(parent,
 				       gpio_secondary_unregister_node_group,
-				       gpiochip_node_group);
+				       (void *)node_group);
 	if (ret)
 		return ret;
 
-	for (swnode = gpiochip_node_group; *swnode; swnode++) {
+	for (swnode = node_group; *swnode; swnode++) {
 		struct device *dev __free(put_device) =
 				acpi_bus_find_device_by_name((*swnode)->name);
 		if (!dev)
@@ -453,6 +453,7 @@ static void x86_android_tablet_remove(struct platform_device *pdev)
 
 static __init int x86_android_tablet_probe(struct platform_device *pdev)
 {
+	const struct software_node * const *gpiochip_node_group;
 	const struct x86_dev_info *dev_info;
 	const struct dmi_system_id *id;
 	int i, ret = 0;
@@ -484,7 +485,7 @@ static __init int x86_android_tablet_probe(struct platform_device *pdev)
 		break;
 	}
 
-	ret = gpio_secondary_fwnode_init(&pdev->dev);
+	ret = gpio_secondary_fwnode_init(&pdev->dev, gpiochip_node_group);
 	if (ret) {
 		x86_android_tablet_remove(pdev);
 		return ret;

-- 
2.55.0.897.gb25b4bd76c-goog

