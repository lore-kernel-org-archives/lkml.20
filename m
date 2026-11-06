Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793971089;
	b=zc9sAR0B3uFr4KUYveRKAZsWUvZFgSlRvjMSvhISkhCY7ivPGiXM6UUAN2xTr7XZN1Bz
	 w+LV1K/MUqBuf9ISZUojOhMCQTaut+FWhCo61J7WxjxrUBm8IGqIEMKbYgbjRxhJXCQ6S
	 gfCtAfW6hrYjO4BD1iukv94MD730i1FvcDwTnFO0O7ESTfxtXO9x3DGgU70I2N8oozXso
	 aCaKWWegdOvK02V9l6dJegIOjF/NcbEwACoXZ4rqg56BPkmZ2qDF2sOC3TMGPAw/LVMFW
	 oj3DcKmqpdrue4qFEYvMrhc37ZcX50yGZJn+RDT1gCahk7pUtQknP5yQpK4bET6+pYg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793971089;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=QSnpNaaEOoXXG2VcIJ6KvgGQC8uNyedzDQWKO1AUfXU=;
	b=idDx5bzqYuthCBQ1iOV+KtuU4NUsa6c4oYt7Uv041nSbAldJVnVWgM30zDrhVk4WWSZY
	 RGxIqpckosQPVPBA1kOpbWnlqX+oWAmAmOJrYJPwHN3uEa96HMAGmKGnl5D7lom/3vs7U
	 /BorIA0Yx4ArnXJG0icsj18OhTUVOphFr5wOO1dt0nmz1On11F4s67ya1bL8W1xmZH56m
	 G+w6OVr01I2mfz4lqxZYk3WJS5v+R3cS0rey7cC8Kk5ZTfUYPpL9uS5zMEM97QXHavY2E
	 LlN0FreDzBaC5ljKmXF+L6UaDYbhulnx/zi4WdkvqV/P7y83xtzxJ+nXusYvNgTSYUQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="cdtb/odZ";
	arc=none smtp.remote-ip=209.85.215.176
Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3712606A32D
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 13:18:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C3712606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cdtb/odZ
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-cd6a7b62ce8so199060a12.0
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 05:18:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793971088; x=1794575888; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QSnpNaaEOoXXG2VcIJ6KvgGQC8uNyedzDQWKO1AUfXU=;
        b=cdtb/odZNYPZvberehssdAp4j1PHi0Ykb+E1KuZluoXkDGqVL+KLjecettJ/jp6MTH
         g32DMbDG8ltUzJlxXitp0Uwo3aBQaw6PbodLg7XCOjpObfcsZBErr4KqKOXySnhpItMo
         Gjh2qHVPMhXT3YjyGc6/yVItgFbAsPRj2wLtt+zgNFwQU9k50RixcQXz6SdW7b4UbXWc
         4i+oRJAhpQFVRaV0Rw8xIg7t+AUo69IqotbQHbV7Abiu+ApQbTWAeyiJsBMZXLqZkgc0
         3cnqHd3ePQ7jTmXpsA6bJhy9Yxj+9WOkyB3PpYEm5pui1Jc+1taeYgbUGVl4ebtZLUUG
         QjGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793971088; x=1794575888;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=QSnpNaaEOoXXG2VcIJ6KvgGQC8uNyedzDQWKO1AUfXU=;
        b=Pw1LO9Zliaz2/DJqWZvQGa3ffdXuaXf9uJKD11Yrv3VFuUxKGMVQ9awM4kGYNqu7H9
         jCPeyxKm39+lqFnZymHD0tlsIhlEej5RuGAxfQlb9sEz7pZTt7tTeEARopofoNZ7Z5xV
         bZ71iLLd8CLmWKObwk+KQqzsShrEvhXauaACCZ9Ac2qviCcokl06kbpd5Zf0IagiidRD
         ElC8Z3pbzvsmX3k8ygtoA/e6V9o0BbHvektzYiiPsFPo+p8wwHjc3L185/VpElTRze/+
         eFWcdVXROYRv26q2jXeln7IWfa5l1Qgi1zN2SOZokPX4d7nTGq/5v9EDrRXnV5JhOuIo
         mZ3w==
X-Gm-Message-State: APuU4Z93te8GgLr4AB893FnuF5hfu65MvFCCHVdan9nlUTJf2puJUB4A
	pXu5RqLFRpLU6ZSFlGeiRPhBkM4TjKPCuoYhejqln+h70OTp891v8jZa
X-Gm-Gg: AYBFou1LCu71heyxKqwOuMmFGYYZZQwW1BKaxFLpFvhPOKEt2TPmlfcIQsmLpuB9m5O
	ZeFLtYCh6PUbX0sYfkZb2pEfraZJQpHKlLyKom4/+p3DeaUI9WX8laTuM21q4dzofLtCuuD5PE6
	aWhDtXwity1hqgxwwNTiMVBubvTJbGg8rWLn+xyccdj66zy34YelK/ZcUD/noKzy3HZpOakKAx5
	g4us0Hv5SrX3thBXHlJfJXxba6NY2cTfHSz1bkyVo+IZEyoIxsTGzWJbfM9gIFZlaR+lzY64/Hc
	Mt4+wjsufrJXZem53++YYKJxs3/SY9onIncoYzgocS7Z9iTRLKULxGbbbovMybEaQpkEEeHp8tj
	m0RCovron7657RFc264ghHY0ceirt4wYhfopl2OGZhnbBSDDgUyG1PTFjUZnqfTgJ89jGwScwJz
	w5YDNMKTSIFVB8qX+tFZ2ZFFTPO8BvF4E/az+AyPhi5udmUllY5m4CBUCGD1XlgO/e2tZASZ/gw
	dT8rIwIYtPHmnco4jBzNtpCvSqk0Xl0CGSEpnvM3rwqXGivu6Nj/THXYpp586TYx6d2HUOzrzYP
	MS6ZQ5sXgqqAXqEvcgYVpk6VSmeudO1oSi9tXLHnrjpKTFOk
X-Received: by 2002:a17:90b:580b:b0:3ac:a203:e092 with SMTP id 98e67ed59e1d1-3b0db609a2emr2299339a91.1.1793971088077;
        Fri, 06 Nov 2026 05:18:08 -0800 (PST)
Received: from hj.. ([163.239.22.29])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b0e2a8d6fbsm1025636a91.1.2026.11.06.05.18.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 05:18:07 -0800 (PST)
From: hyunjungg <hj351016@gmail.com>
To: MyungJoo Ham <myungjoo.ham@samsung.com>,
	Chanwoo Choi <cw00.choi@samsung.com>
Cc: linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzk@kernel.org>,
	linux-samsung-soc@vger.kernel.org,
	Hans de Goede <hansg@kernel.org>,
	Hyunjung Ko <hj351016@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH 4/5] extcon: max14577: drain MUIC IRQ work before extcon device is freed
Date: Fri,  6 Nov 2026 22:17:29 +0900
Message-ID: <20261106131730.2633139-5-hj351016@gmail.com>
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

max14577_muic_probe() registers the MUIC interrupt work for device-managed
cancellation before it allocates and registers the extcon device that the
work handler dereferences:

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

max14577_muic_irq_handler() queues irq_work with schedule_work() on every
MUIC interrupt, so a work instance can be pending or running at unbind.
The handler max14577_muic_irq_work() dereferences info->edev via
extcon_set_state_sync(). Its only early-return guard tests info->edev, but
info is itself devm-allocated and freed last, so in the teardown window
info->edev is a dangling (non-NULL) pointer rather than NULL and the guard
does not fire. If the work runs after the extcon device has been freed but
before the work is cancelled, it dereferences freed memory, i.e. a
use-after-free.

Allocate and register the extcon device before registering the work for
cancellation, so devres (LIFO) frees the IRQs first, then cancels the
work, and only then frees the extcon device. devm_work_autocancel() still
performs INIT_WORK() before the work is first queued (the IRQ handler,
requested below, is the only queuing site).

Found by static analysis / code review; compile-tested only, not
reproduced on hardware (requires a MAX14577/MAX77836 MUIC).

Fixes: 14ad76825f00 ("extcon: extcon-max14577: Fix potential work-queue cancellation race")
Cc: stable@vger.kernel.org
Signed-off-by: Hyunjung Ko <hj351016@gmail.com>
---
diff --git a/drivers/extcon/extcon-max14577.c b/drivers/extcon/extcon-max14577.c
index 5476f48..1267769 100644
--- a/drivers/extcon/extcon-max14577.c
+++ b/drivers/extcon/extcon-max14577.c
@@ -674,6 +674,20 @@ static int max14577_muic_probe(struct platform_device *pdev)
 	platform_set_drvdata(pdev, info);
 	mutex_init(&info->mutex);
 
+	/* Initialize extcon device */
+	info->edev = devm_extcon_dev_allocate(&pdev->dev,
+					      max14577_extcon_cable);
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
 	ret = devm_work_autocancel(&pdev->dev, &info->irq_work,
 				   max14577_muic_irq_work);
 	if (ret)
@@ -712,20 +726,6 @@ static int max14577_muic_probe(struct platform_device *pdev)
 		}
 	}
 
-	/* Initialize extcon device */
-	info->edev = devm_extcon_dev_allocate(&pdev->dev,
-					      max14577_extcon_cable);
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
 	/* Default h/w line path */
 	info->path_usb = CTRL1_SW_USB;
 	info->path_uart = CTRL1_SW_UART;
