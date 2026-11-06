Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793971085;
	b=Vtg345/bw0RauWMxgdKY2Q/bgvJmD1moEHlwZxPMX8gnbCmZthc/AzkXqkr9zU/kwMDu
	 QcqMnm+qlQZiynvCw/MokFrZExPR8YZLm02Obf4X1CBNzLKCwReCujpeyu+NRmRXbJnxK
	 VMcLsEWuVN1Kox2NeIEw5VUQc69PaZ/yF2syOmJWcoUBRZom5mB85qvS9LiUqi3Fe60HX
	 21pcqSez2zv/BHfOuFQoZ7Wp6jPME+3RnXTcelQiqaGsFeuIm9v0pJUZ1jH0syDtnI99b
	 0KfCW1w0CJsHcgH8rNxzx3uO70hZB1OfkBCcHA3hFTfZMPPvyx49YC80XCFlp1iiJZw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793971085;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=Dz7o2nl3YbVAvhy6+Qf4x0LfNDPFm8y7nAlJp4YSP1Q=;
	b=vKVCV975F8T4wtudZxZTvdvg3cMMMydBBm/jARTNL1yo+oGDzh20FVhAhpQMSQ7ra1ZT
	 fWiM/7x6RltShuWb05X3Vxidh8ncOv88PfmJbKY6pEJSgw1hl2sXf7mWL4aV27hoFP4sY
	 /vDohFaB/turvv2JdXsG9OJj9L0Apm7ZA0YiUPoGS8CCs/wc+ICuA5i9FuJ3QVeruiMPg
	 doysQL2YTdKzgYiOjAuzP/2ZBzikHeWzIyY6C+e19BXERfzWKjhKADNu/YUC0pZ9Rsn9+
	 MYdTA2qRVVJskHFQmn5glME14M+P5m3TkHoEc60JoatMrSD1bgQgFGfoMkf3wXNpfKw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="A/CMeiFO";
	arc=none smtp.remote-ip=209.85.214.175
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48EDC606A32D
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 13:18:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 48EDC606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=A/CMeiFO
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2ed06b725fdso10440345ad.0
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 05:18:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793971084; x=1794575884; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Dz7o2nl3YbVAvhy6+Qf4x0LfNDPFm8y7nAlJp4YSP1Q=;
        b=A/CMeiFOpwChXu+gGgOnhDCfiXDypN1UICLSZACPhx5cv7EENCB7NnLkEnA+YSiAF3
         OY3jcSURjpf6OO2+qspOv7CQTuoSUIqtWtOOuSJKTssTGtIZQO+Utdshl6kO+yVAYnFX
         2jr96VKUbNi8h/xVMsog0LwbAS4BVHyci6ZQ7Pk94BlE2zlje9hq2bJfj68FneHdQZC/
         vMh25aYAVS+CLD2xCJS8iQiQTjU3FX9ya8DZlSl/NsaB27ZFasPtQJG3wjOvwwqw785p
         EYWxeYuoDXleahTrASk0Z0stV8NR14gNs2wlOe0bj4lzHc3+xAV8kfocfrMnSsA1MpCQ
         ahxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793971084; x=1794575884;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Dz7o2nl3YbVAvhy6+Qf4x0LfNDPFm8y7nAlJp4YSP1Q=;
        b=RjDQf9Vg3k5P45MjSZ8YNY0dt7bc4yr0ANRO1GYGmodAC2gSjCQSWEpLQjC+QJBao+
         wvaaNhhvvz4T/DdKuWu9ys4wpmolRlfV3+55d+z2fhOSzs2qcTpsdm+zdIQR7hM7QlZf
         VJYwjSvObhRmAG6/RzomHDjf5F8R8Q9OMzTaP8cQ7P+iiHITl7pHmM9ks2UPw1/x6eO3
         mEQxMceutcmSqIeDxQWHx9iB9IAJpTyLMTrtE+Ggqgl9RE7mnoceh/v2ALcybq+QznRV
         wavMTlmx/7urjLlCoRjgvVXLdqWAtEL08kke6XJerv4my/FYodndBQf83BlX4mlFTezP
         PB1A==
X-Gm-Message-State: APuU4Z/i6xduSAGrjEeOpw0v1qdssYZjk5YS/R3tUQHl1F2CtSGWmv3L
	GDSHlYM/Ee119/SP4EAeGxLjLBT5CXZ4xdcg08blrFfXpdjxRlBV/Gjl
X-Gm-Gg: AYBFou22GkkhnicQhtw+xJ1bfpwrXn39rCcgW/IEjAEXCwFmHZ0qaeKvma4DWyCHlUr
	wDpeZ36XuN0dxtxXTbyJ/VEpBjzLr9OyAf89wyEnQUxv8lyMDrifr2k1+/a1VqhRyVf3HOwT6+y
	LAg79rhUDwRVGUzqo82tc3dszewVpUBh//H4Y2kfwk0ltcvLEx7mRhq2y+ywoy+t7VY9otzTAOw
	rlZL2il2+mvGgHV1G1sD6P1MwoCI+v0Yn5uH+Nhp3xUXPok3Jll3jF3ZWpRSnGucCB96TV44mK8
	U1CrJT84JcNkFmNqdtz4acjb+oL0whamc0ZvWsVYQ2kDab2WslTZPmeUVGaSHISVd6DKqA4HTWN
	ZG/dn8YkYpHhk8ShUwGwC4vcSeWTsdzR5sbp5oBEpiEYtVsfNveK31faAvlNiM7lhAKJmBNi61o
	9EI3wGFVNgqfT/z+vKHkLRU3BY5RqR09nE7zwSN2d63mI6othhPiS8w/XTlKOWIL1PhruUrcz/S
	gLyKntXuI+I1fYYBBmghcxPOAb6Il8PeX1N6QBzOupkvMNDi7rwJ7sH1Rie0vQKBSgEvwHQXXMz
	VB7p+SxNt5sy1jrXZB6beut1GZyLbBxDnMY8QNex2/H45iRqAmAPclMiC+ibSMN10Gs8jw==
X-Received: by 2002:a17:90b:584e:b0:3a0:d82b:237b with SMTP id 98e67ed59e1d1-3b0db6e8c8cmr1498160a91.25.1793971084246;
        Fri, 06 Nov 2026 05:18:04 -0800 (PST)
Received: from hj.. ([163.239.22.29])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b0e2a8d6fbsm1025636a91.1.2026.11.06.05.18.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 05:18:03 -0800 (PST)
From: hyunjungg <hj351016@gmail.com>
To: MyungJoo Ham <myungjoo.ham@samsung.com>,
	Chanwoo Choi <cw00.choi@samsung.com>
Cc: linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzk@kernel.org>,
	linux-samsung-soc@vger.kernel.org,
	Hans de Goede <hansg@kernel.org>,
	Hyunjung Ko <hj351016@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH 3/5] extcon: max8997: drain MUIC IRQ work before extcon device is freed
Date: Fri,  6 Nov 2026 22:17:28 +0900
Message-ID: <20261106131730.2633139-4-hj351016@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261106131730.2633139-1-hj351016@gmail.com>
References: <20261106131730.2633139-1-hj351016@gmail.com>
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

From: Hyunjung Ko <hj351016@gmail.com>

max8997_muic_probe() registers the MUIC interrupt work for device-managed
cancellation before it allocates and registers the extcon device that the
work handler dereferences:

	INIT_WORK(&info->irq_work, max8997_muic_irq_work);
	devm_work_autocancel(&pdev->dev, &info->irq_work, ...);
	...
	devm_request_threaded_irq(&pdev->dev, virq, ...);	/* arms work */
	...
	info->edev = devm_extcon_dev_allocate(&pdev->dev, ...);
	devm_extcon_dev_register(&pdev->dev, info->edev);

devres releases resources in reverse registration order, so on unbind the
extcon device is torn down first and the work is cancelled last:

	/* free_irq() */
	devm_extcon_dev_unregister() / extcon freed
	...
	cancel_work_sync(&info->irq_work);		/* too late */

max8997_muic_irq_handler() queues irq_work with schedule_work() on every
MUIC interrupt, so a work instance can be pending or running at unbind.
The handler max8997_muic_irq_work() dereferences info->edev via
extcon_set_state_sync(). Its only early-return guard tests info->edev, but
info is itself devm-allocated and freed last, so in the teardown window
info->edev is a dangling (non-NULL) pointer rather than NULL and the guard
does not fire. If the work runs after the extcon device has been freed but
before the work is cancelled, it dereferences freed memory, i.e. a
use-after-free.

Allocate and register the extcon device before registering the work for
cancellation (the redundant INIT_WORK() is moved up with it), so devres
(LIFO) frees the IRQs first, then cancels the work, and only then frees
the extcon device. devm_work_autocancel() still performs INIT_WORK()
before the work is first queued (the IRQ handler, requested below, is the
only queuing site).

Found by static analysis / code review; compile-tested only, not
reproduced on hardware (requires a MAX8997 MUIC).

Fixes: 87ee8de23c9d ("extcon: extcon-max8997: Simplify driver using devm")
Cc: stable@vger.kernel.org
Signed-off-by: Hyunjung Ko <hj351016@gmail.com>
---
diff --git a/drivers/extcon/extcon-max8997.c b/drivers/extcon/extcon-max8997.c
index 9cddf08..a54e7c4 100644
--- a/drivers/extcon/extcon-max8997.c
+++ b/drivers/extcon/extcon-max8997.c
@@ -650,6 +650,19 @@ static int max8997_muic_probe(struct platform_device *pdev)
 	platform_set_drvdata(pdev, info);
 	mutex_init(&info->mutex);
 
+	/* External connector */
+	info->edev = devm_extcon_dev_allocate(&pdev->dev, max8997_extcon_cable);
+	if (IS_ERR(info->edev)) {
+		dev_err(&pdev->dev, "failed to allocate memory for extcon\n");
+		return PTR_ERR(info->edev);
+	}
+
+	ret = devm_extcon_dev_register(&pdev->dev, info->edev);
+	if (ret) {
+		dev_err(&pdev->dev, "failed to register extcon device\n");
+		return ret;
+	}
+
 	INIT_WORK(&info->irq_work, max8997_muic_irq_work);
 	ret = devm_work_autocancel(&pdev->dev, &info->irq_work,
 				   max8997_muic_irq_work);
@@ -678,19 +691,6 @@ static int max8997_muic_probe(struct platform_device *pdev)
 		}
 	}
 
-	/* External connector */
-	info->edev = devm_extcon_dev_allocate(&pdev->dev, max8997_extcon_cable);
-	if (IS_ERR(info->edev)) {
-		dev_err(&pdev->dev, "failed to allocate memory for extcon\n");
-		return PTR_ERR(info->edev);
-	}
-
-	ret = devm_extcon_dev_register(&pdev->dev, info->edev);
-	if (ret) {
-		dev_err(&pdev->dev, "failed to register extcon device\n");
-		return ret;
-	}
-
 	if (pdata && pdata->muic_pdata) {
 		struct max8997_muic_platform_data *muic_pdata
 			= pdata->muic_pdata;
