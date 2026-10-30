Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793325930;
	b=GCNBnwROYaRUzNGsgWmSvbM2JBXnaUvRwkk1dncmixLW/WvyYwVe7BHcmZ0k3iwsnaCf
	 qMl6WOW+lu/AidYARu+VXfIeHQll9oavvaTOhpzKDV8K78TeqVlcC0pHd4dEFbIhGPRpq
	 2ryHfj/+DY/nHIdShYCfu2Jbuv/vGmZkUbHltv4RhnBP55ZPGH+kIV7G98/P3beDnayYU
	 Hto2ZruGsb4ju4OvXbSvgkjh4bta1wKH3AWKYx/gjZVI1fWuMImUdWvwTDR6/3wIYkA+o
	 G+J4DOLSgYUbGCNmiRbWHcchSh8LYUvjzKlTX2TuBsZoP6thbPAYwnT9uUqnDwrxTnw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793325930;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=biXKHJPN3s+hXC12si4pB6yD5k6wJNz5r1iCKuyz1ww=;
	b=ivKwhuNVvWfC8JzASbyj3dKUmZXV+j5l0UiZqNd/ywXMFbA9uhOU58ojR4CMdMCTXjMq
	 5fw8jW0MNUKs6h7hYyv/enKxHf2BluKI+75tiviFCsu1Fct/RUsZjFGg2ZzrBpyHTgaUK
	 9fNm4bF+Cpewt7zQHngU3Cv2TghV7ddc0l75P28yi0RrRkaCi0RJqbczxnpyZ67A+sXnY
	 O7v4fpPu1wpjxTepAW/aTtIAhUArVN38SpN6GQ5A2+jRFsOIx/ziOkwSpFon2BrVKdGky
	 Wzyfi8VmrqZLjuau5KSGTDx6FBwD95FoPHOy6sg9t5EhDNvT2sExtnZRBPVmRTISUuA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Wv2rEWuD;
	arc=none smtp.remote-ip=74.125.82.171
Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68455606A323
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 02:05:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 68455606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Wv2rEWuD
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-33fb4680717so598070eec.1
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 19:05:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793325930; x=1793930730; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=biXKHJPN3s+hXC12si4pB6yD5k6wJNz5r1iCKuyz1ww=;
        b=Wv2rEWuD/OxoX8s4TfBvBoUm9E3gIKYlI4zXJ2k7xhtqtie5iSj2iEGHXWhy4+p0su
         OvEcRY9DnUqeAtFr78vIcvfeo+l473etW2jLCD26i+Ahscr7lzauSFlXP06z+fQoOCKu
         kN9rNs9QDCVerSCY2wllrE1f3v637QBN+aMO6PZU3GzPK2fdKmNciKb+7ekGUX9pDpO/
         NEkbUgrPPhuJAb1sshz/DmQ2auZf6UCkaHmMZZNMX9Gsz01wtJSdGPaaSlCdr9WrJgvW
         AbVm19T4jgH0rgOT8m+qePGFMsrSkierRWqL7Z+mE+vv1sAUeCFvr2g/m83pMYppPOKB
         yWzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793325930; x=1793930730;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=biXKHJPN3s+hXC12si4pB6yD5k6wJNz5r1iCKuyz1ww=;
        b=cw6Iu3FiPFhpi8dcIuuw4GtrVL3yFwUdLOnX+fe7mKIkr9d1k297teYm1TG6Vdn0VY
         I3NFoe43Y+JbEDyxOIGGnfIJ8Qn68GJgBe+DUtF609YKKxIol0YZwRzydjGfYYVI3sIk
         ggKrk0gNb7tL9lUy4sz2hJ5D0yS5GIEVOqeThVYicIHGGc5azWUCBRY4SInzPkgLMzF8
         UDryoE1xg3TS7wULXgoCYosxlCNlB4HtUPKFiVAAzdcMcVflm2RF8wUZGHUDK19x1Dss
         1dOrm1idzyZ7k1PNv9Xpk6gX+gZtHm3a/PzG1o4ouerwoTfVVlBNXDOvEcWVi9CpQvOm
         ++NA==
X-Forwarded-Encrypted: i=1; AKwUvBxNTpTCBZ89fZNDBpl4Cox30naOw9JaDP59DjqEBSQcAj9y13Yi3RHpsyrHFfuiHcKHPLozlYcwBnX0nXg=@vger.kernel.org
X-Gm-Message-State: AFq9FYLnBo+bHVMcWqY914BSs3GuSizhvY4Fuzai1SQKwUqMevqxZCyY
	cyty+5HBtPQIEn5BecXeBMYuXtX7ca+yDEIxeJgjr5mAiNvFMUMHPzcWGQCyLXw=
X-Gm-Gg: AYBFou06Yz55nD3RaXKUoGOGyJjyNb32fG/HrSwPdCSuYo9yW3bmzImdohxw1tD5F5U
	Ksnuoiz4Amsekrk0INOKMdZeaUu+fXkr1vu5MQdmp6yBCEmqrXqnCpOHHL3FHKGjgGVq4Yt/RvD
	nCUcLn3Kc9R84yv6emSK3zth2WlDXBVvaPDgA3ahuxpPVWqoRSp3ifcH0AakKKQrzmdZFf7Qogp
	0SevPlgcgV/6h+eloJ5csFYCtZKTkGiGNy7Pt0SG+3kpRnUEp4PrlRaG3Hw2B9l6ufjiij7l37F
	7YVkxYb7K8+PbY0tL572hCHyq+NcXfBRGq9TsPruDdGXvoBI3xlV/1pHFrEzv3gQybxHtPRS0WZ
	BvcW2ty5NUNbeMbjlpl5rqGb894gWzCVkSH+5uNo9uGq2ODy7CSRzT5UrTMD9SboIXFJ3ulXtn7
	dhrRvGbtRE9i/D94+kaAhvora96oXB8Nftx2GdB5Q0/zOGGxKk6UMYsKLeDID3BEhAjxFa+54rT
	m+uAvKUI57yyveB61v2pkkkcVnYjSqHriUEKDPjCbf7zd13zKm4RCLwHPDg/3Cndi9aPheP4h+V
	O30gIMo+5LEewGP+4mhvnpDbPnvpEZTje3cD4jlLPNLm04K0JCfCgPR5+17xvhYcRs2j
X-Received: by 2002:a05:7301:d198:b0:360:db68:3264 with SMTP id 5a478bee46e88-36a42340756mr1687219eec.6.1793325929228;
        Thu, 29 Oct 2026 19:05:29 -0700 (PDT)
Received: from localhost.localdomain ([2406:3003:2002:639c:61c8:985e:fbe6:4d1e])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a428af1easm2332068eec.5.2026.10.29.19.05.26
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 29 Oct 2026 19:05:27 -0700 (PDT)
From: Yige Jiang <yigejiang86@gmail.com>
To: linux-leds@vger.kernel.org
Cc: Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	Griffin Kroah-Hartman <griffin@kroah.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] leds: pwm-multicolor: Manage the multi-led node reference
Date: Fri, 30 Oct 2026 10:05:20 +0800
Message-ID: <20261030020521.9399-1-yigejiang86@gmail.com>
X-Mailer: git-send-email 2.50.1
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

led_pwm_mc_probe() leaks the multi-led node reference on successful
probe and if the final PWM update fails. LED registration borrows
the node, so it must remain valid until the LED is unregistered.

Register a managed put action before LED registration. Reverse devres
order then unregisters the LED before releasing the node on unbind
or probe failure. Drop the manual error-path put and return directly
on probe errors, leaving the reference cleanup to devres.

Fixes: 9fa2762110dd ("leds: Add PWM multicolor driver")
Assisted-by: LLM
Signed-off-by: Yige Jiang <yigejiang86@gmail.com>
---
Changes in v2:
- Capitalize the subject description to follow the LED subsystem style.
- Remove the redundant release_mcnode label and return directly from
  the probe error paths.

v1: https://lore.kernel.org/r/rc-review-20261029-ai27-27-2c77ed65cec2@gmail.com

Based on linux-next next-20261016 (2efb7a11f1aa).
Compile-tested: arm64, GCC 14.2.0, W=1, CONFIG_OF_DYNAMIC=y.
COMPILE_TEST=y.
The object was rebuilt from this exact base with v2 applied.
No full kernel or module-link, hardware or runtime test was performed.

 drivers/leds/rgb/leds-pwm-multicolor.c | 31 +++++++++++++-------------
 1 file changed, 16 insertions(+), 15 deletions(-)

diff --git a/drivers/leds/rgb/leds-pwm-multicolor.c b/drivers/leds/rgb/leds-pwm-multicolor.c
index 6365459ec27f17187804153cde6cb1805eca33e9..10527a64d1982733a43b76bd8bc123aba95b6f72 100644
--- a/drivers/leds/rgb/leds-pwm-multicolor.c
+++ b/drivers/leds/rgb/leds-pwm-multicolor.c
@@ -106,6 +106,11 @@ release_fwnode:
 	return ret;
 }
 
+static void led_pwm_mc_put_node(void *data)
+{
+	fwnode_handle_put(data);
+}
+
 static int led_pwm_mc_probe(struct platform_device *pdev)
 {
 	struct fwnode_handle *mcnode;
@@ -121,22 +126,22 @@ static int led_pwm_mc_probe(struct platform_device *pdev)
 		return dev_err_probe(&pdev->dev, -ENODEV,
 				     "expected multi-led node\n");
 
+	ret = devm_add_action_or_reset(&pdev->dev, led_pwm_mc_put_node, mcnode);
+	if (ret)
+		return ret;
+
 	/* count the nodes inside the multi-led node */
 	count = fwnode_get_child_node_count(mcnode);
 
 	priv = devm_kzalloc(&pdev->dev, struct_size(priv, leds, count),
 			    GFP_KERNEL);
-	if (!priv) {
-		ret = -ENOMEM;
-		goto release_mcnode;
-	}
+	if (!priv)
+		return -ENOMEM;
 	mutex_init(&priv->lock);
 
 	subled = devm_kcalloc(&pdev->dev, count, sizeof(*subled), GFP_KERNEL);
-	if (!subled) {
-		ret = -ENOMEM;
-		goto release_mcnode;
-	}
+	if (!subled)
+		return -ENOMEM;
 	priv->mc_cdev.subled_info = subled;
 
 	/* init the multicolor's LED class device */
@@ -144,14 +149,14 @@ static int led_pwm_mc_probe(struct platform_device *pdev)
 	ret = fwnode_property_read_u32(mcnode, "max-brightness",
 				 &cdev->max_brightness);
 	if (ret)
-		goto release_mcnode;
+		return ret;
 
 	cdev->flags = LED_CORE_SUSPENDRESUME;
 	cdev->brightness_set_blocking = led_pwm_mc_set;
 
 	ret = iterate_subleds(&pdev->dev, priv, mcnode);
 	if (ret)
-		goto release_mcnode;
+		return ret;
 
 	init_data.fwnode = mcnode;
 	ret = devm_led_classdev_multicolor_register_ext(&pdev->dev,
@@ -161,7 +166,7 @@ static int led_pwm_mc_probe(struct platform_device *pdev)
 		dev_err(&pdev->dev,
 			"failed to register multicolor PWM led for %s: %d\n",
 			cdev->name, ret);
-		goto release_mcnode;
+		return ret;
 	}
 
 	ret = led_pwm_mc_set(cdev, cdev->brightness);
@@ -172,10 +177,6 @@ static int led_pwm_mc_probe(struct platform_device *pdev)
 
 	platform_set_drvdata(pdev, priv);
 	return 0;
-
-release_mcnode:
-	fwnode_handle_put(mcnode);
-	return ret;
 }
 
 static const struct of_device_id of_pwm_leds_mc_match[] = {

base-commit: 2efb7a11f1aa4d2dc285fe2680cca22cb9f72f64
