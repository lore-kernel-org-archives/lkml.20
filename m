Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793971076;
	b=Zey1BXM5NEnqGDIDKR5AISCcLxlhXkPDlxWQNwH4s6nDyrYvBIUUgwPvB1FmS7suPdsi
	 +sEm5BxW5g+X9Ho0RIx2kBAx1zD9DBoTakYFVa4k7iaUBYeB5eAHHIlVfU+Mn2vpin1aU
	 wh3/4PTci3gxV9XrwqtCxgEpZLAfVy/5xff7HjwCpPdDWisikOJnhuIDkiJNvDVVTtw5X
	 Pll+LFelK6y+aubJdTofIaM+mStrYl+29sqOF6sXWDGpK4yiygguvYWC0aHZ81XtMffkz
	 aMrZsEzi7R2aV23svS8U4SQ4HQYEp5u26S3XWqVC1qRNHCd4YRU0GPZj1TGzvIONWCQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793971076;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=6/3GymnNJZRM/VrW+qCnWfq8A57o4eHJ5rqxoxFgvC4=;
	b=htYGsDtfhJNj1yUPSoIN1h93expjDxWqbJpETSLjMFv8E1bHLY8fVn9M5aLIdKjfK9TP
	 T9AISt+ms1kpnlPqF+BNk1M/fjGfo0f5v7VvdRO5DcdAI6wQ/LudqUBEqMAIsGE1rV9hK
	 7MeLC2AyVVFUM/PTzIX6zRjZkpjMd/SEtoNZUj+xlj5m4qX/ooUiw0+wP2UfXgWV0JQ6+
	 so/SkgooqNju/zQxDrLVR63Wjo4agarZb4o9n0yz60BKQcYIqyzyiZEFFJo7WFQRhPN05
	 RK8W0Pu7F8f5FZJwXhTOLAdK1RT5bhVnAugvmWHIM8DaY31AqLPNHp4taSY99toqLuA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pLKJBcOV;
	arc=none smtp.remote-ip=209.85.215.180
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDCCE606A32C
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 13:17:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CDCCE606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pLKJBcOV
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-cc7d154ec4fso234437a12.0
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 05:17:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793971075; x=1794575875; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6/3GymnNJZRM/VrW+qCnWfq8A57o4eHJ5rqxoxFgvC4=;
        b=pLKJBcOVib3l2IvbEA0fuRpzWS7HtxZFSOMT8uvd+t2Gig0EeaMFkEJrROdqrf8GbN
         5Ez2dbXsBKz5TLbIUdyiOMTgmoZpKlaH/qa/nZvmyhmbcn1bSziNwIEuJCqHZnZTqbgL
         LvKj+kaNFpY5qE4SL55AnobiEhBwfTy/p7h/2fGSbVC89y+BUqJ6WdLgXrjmrGW50xls
         i2CP/DdiZMlp+aAj28N2uAijrmnNKZPNvSe7guccM0MhNX+PZQtFMDtygIkuKxe99dRJ
         5s4MU7SqE8ZrcNwXi2dJK3bvXEQtZYjjoHWuglDx/cuhy8JmOIyBexYLILYcz9ylynaN
         iNdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793971075; x=1794575875;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6/3GymnNJZRM/VrW+qCnWfq8A57o4eHJ5rqxoxFgvC4=;
        b=hqhRvMWOEUUe3Dv/57oVq+QAByCN5tScT34RKJLLj3hjPrCkcUShqs4hTbWW4+tSVp
         DMuInGB2r3RyTafPxjvAr5pRlG9wlly6As/DSaAtAHAz2ss7h7GIn8YTw7DX6ZRqzrDh
         N7R/uTRpqZq/+RdZ1YjMM1CbuUeiyGMf7/h9iBQEcWq1hWB7ROubK4qQCer5TzHsTB9w
         7G9cztNe3nHiCKlbuGi8FvesTr3WQ7DmlBMZQ0eiXUQBWWYZnkM1mR0kKrwJVXUzJQls
         pUeTslglKe0+qhfNxgVI34BKHIQpBl/8bzxDdQmd/uh+F957O2vrmIa4OnY59Ty11SpC
         QRew==
X-Gm-Message-State: APuU4Z9bXiA/ICIfklr3MZC3lietL8apG52tPOMghBs40YyeTLapICRc
	/G50AI60OW9we+2ryPACVg4UAIpsriRLvzfGxRaq0UeWolipWAuxsMP0
X-Gm-Gg: AYBFou0ilfC/zu28RtRqL6L8jkkoZXiEPEKVZk6fZdTTzeXQWF/pB/EITwsUujtxKwN
	7hPNDRz2XQ3QA/a3lGR2uEsthCR2VMsEIK8JaghppYWbUUpQExkkAP7tMzqrFbrU6RyfnO0ViZm
	rSPL4+bEBgVZ+CBs8xPmqdjPvji/34bh8IQtUyLpk8gv/7RmC9RnZEj3oN9hAskzYSeAspfhoIf
	psUIm5OltrXcW2nLtU9Xp8vUajxefsjYWl+ynBPo218JMzxZZrngHHB7s19zECN5uXWte0MUWU1
	aybIdxm7/e+4dhmpq8/KmuBaJHki3OSqjX5EZUWrjlDeJKKhy9+rbq+kRTibXmF+3cwIPsP2UUp
	yrf/fcfsBbhNsg/L5yZbtUQl53jiSfkef/A8lp9vrjayhOT2pRrTrW2YHFxQGbNzgdkfKi90VMk
	dUyEsySiskqJr4SFZfc8eiLqyFQ4oAXVUEgZuP03mLsn8e2GWO+yQoJeIhLCoy/+beBmRRaJDnN
	mrqOPbVxBd6JInIuIksFys4ioQvE85mKAx0Z3Z61qJj7BHMRjPcNeZjt1ZzcY95lafckaTA1adF
	6Y+XXbcxzIjkGSPkmATkDDVJ+02EPJCmPO/uTdO0vp/xeHv5Iw==
X-Received: by 2002:a17:90b:4c41:b0:3ac:4e18:238e with SMTP id 98e67ed59e1d1-3b0db6fe1cemr2426041a91.46.1793971075070;
        Fri, 06 Nov 2026 05:17:55 -0800 (PST)
Received: from hj.. ([163.239.22.29])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b0e2a8d6fbsm1025636a91.1.2026.11.06.05.17.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 05:17:54 -0800 (PST)
From: hyunjungg <hj351016@gmail.com>
To: MyungJoo Ham <myungjoo.ham@samsung.com>,
	Chanwoo Choi <cw00.choi@samsung.com>
Cc: linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzk@kernel.org>,
	linux-samsung-soc@vger.kernel.org,
	Hans de Goede <hansg@kernel.org>,
	Hyunjung Ko <hj351016@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH 1/5] extcon: intel-int3496: drain ID work before its GPIOs and extcon device are freed
Date: Fri,  6 Nov 2026 22:17:26 +0900
Message-ID: <20261106131730.2633139-2-hj351016@gmail.com>
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

int3496_probe() registers the debounce work for device-managed
cancellation before it acquires any of the resources that the work
handler dereferences:

	devm_delayed_work_autocancel(dev, &data->work, int3496_do_usb_id);
	...
	data->gpio_usb_id  = devm_gpiod_get(dev, "id", ...);
	data->gpio_vbus_en = devm_gpiod_get(dev, "vbus", ...);
	data->gpio_usb_mux = devm_gpiod_get(dev, "mux", ...);
	data->edev = devm_extcon_dev_allocate(dev, int3496_cable);
	devm_extcon_dev_register(dev, data->edev);
	devm_request_threaded_irq(dev, data->usb_id_irq, ...);

devres releases resources in reverse registration order, so on unbind
the extcon device and all three GPIO descriptors are released first and
the work is cancelled last:

	/* free_irq() */
	devm_extcon_dev_unregister() / extcon freed
	gpiod_put(mux) / gpiod_put(vbus_en) / gpiod_put(usb_id)
	...
	cancel_delayed_work_sync(&data->work);		/* too late */

int3496_thread_isr() arms the work with mod_delayed_work() on every ID
pin edge, so a work instance can be pending or running at unbind. The
handler int3496_do_usb_id() dereferences data->gpio_usb_id
(gpiod_get_value_cansleep), data->gpio_usb_mux, data->gpio_vbus_en and
data->edev (extcon_set_state_sync) with no guard. If it runs in the
window after the GPIOs/extcon device have been released but before the
work is cancelled, it operates on freed resources -> use-after-free.

Register the work for cancellation after the GPIOs and extcon device
are acquired and registered (and before the IRQ, which arms it), so
devres (LIFO) frees the IRQ first, then cancels the work, and only then
releases the GPIOs and extcon device. devm_delayed_work_autocancel()
still performs INIT_DELAYED_WORK() before the work is first queued
(queue_delayed_work() below, and the IRQ handler, both run after it).

Found by static analysis / code review; compile-tested only, not
reproduced on hardware (requires an INT3496 ACPI USB-ID mux device).

Fixes: f94a5becabf4 ("extconn: Clean-up few drivers by using managed work init")
Cc: stable@vger.kernel.org
Signed-off-by: Hyunjung Ko <hj351016@gmail.com>
---
diff --git a/drivers/extcon/extcon-intel-int3496.c b/drivers/extcon/extcon-intel-int3496.c
index 7d16d5b..40774fb 100644
--- a/drivers/extcon/extcon-intel-int3496.c
+++ b/drivers/extcon/extcon-intel-int3496.c
@@ -130,9 +130,6 @@ static int int3496_probe(struct platform_device *pdev)
 		return -ENOMEM;
 
 	data->dev = dev;
-	ret = devm_delayed_work_autocancel(dev, &data->work, int3496_do_usb_id);
-	if (ret)
-		return ret;
 
 	data->gpio_usb_id =
 		devm_gpiod_get(dev, "id", GPIOD_IN | GPIOD_FLAGS_BIT_NONEXCLUSIVE);
@@ -169,6 +166,10 @@ static int int3496_probe(struct platform_device *pdev)
 		return ret;
 	}
 
+	ret = devm_delayed_work_autocancel(dev, &data->work, int3496_do_usb_id);
+	if (ret)
+		return ret;
+
 	ret = devm_request_threaded_irq(dev, data->usb_id_irq,
 					NULL, int3496_thread_isr,
 					IRQF_SHARED | IRQF_ONESHOT |
