Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793971081;
	b=xGMvZVajYV/AdGDek8qtlj6UE8L+FmfxEDEPyeJeyOq3GL1wU5rBPCqQ+Tml4gNXZMzb
	 22oX/I6DiQso3DMK6Vlo1wXGZOpDkF+qwiSGmkEyTRMzQslYyOHw1SoiatJkB1CV29vU9
	 hEo+jpn6KAsU6J58SFrVG+60HAO+KVWrkCQTToEwde1P1w6SEAPRMqdGIz1FUWpjwPFCa
	 H520893wrFpZQCp3vKcghGHWm8Vuo030TpyJGU/xB1Rdk3hh3BxLj0Xg2dNX6fx3mnnnA
	 KLWR9FGN7ueExLqDGS00OE4ORtDocWFYLX/8WHMcvAtJwfztZFfjq3khTv8KhVUrtwg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793971081;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=QCmCUD5+cRAdCqiqdhrCpwSJ5tYiyygF2+7HyPzxiCw=;
	b=q03cSoX+gIBqeYBnfyx5Hb2Xrpp/05BRk95F5crxkex6kvzBJE239w4FxP6ETExA45iE
	 jA6MveIYa6Tqo5DzxqvFW2xcLAmSMQdkDyB/087BlCv1eSPsL6ED7L59S2/wF20kHPgkO
	 ELFqq54d63kiqUokBP3V/+/5zDeXjLk2DExChZLlKxzIIJRD5UnQ2PZHFKKoXfMTi2t1R
	 9ORhkWZ9DfGr2dnWqDCQfMbcfzS8+uW1LNBPaW3hnILDT9S006zZ6/iUFyg0bAf7TZCIs
	 f/E2x+GFHZNrg4dM+F1F9TXOfKRkaO9t26tXu/oVPAbaRIhHqh1Zkca7nndOjjixYRA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=eRQTt+3H;
	arc=none smtp.remote-ip=209.85.216.48
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2946B606A32C
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 13:18:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2946B606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=eRQTt+3H
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-3b094e649d3so384923a91.0
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 05:18:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793971080; x=1794575880; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QCmCUD5+cRAdCqiqdhrCpwSJ5tYiyygF2+7HyPzxiCw=;
        b=eRQTt+3HAcikpyyqip2eed0SNs12Pyb+897E3wzePXTtPxRx3tqIHGG/G8Len9CQD4
         POSEb83IziCHdkZkdlc+CIvXOu4N0fZPjRFzetlotDbUC2nmtAc9aMG/RDnngQscifl2
         TPtbBc6p+Y+5KG7Xps+yBXvOsNXkBCPPvvMut448592EshEjgD4PcuVIEV/dKVcSzo6M
         PKEBTOqraLbio9bEw0QeVZliR/FzT7TRrYuYPOIQcQCMUB5el5OfdmErKVAtaVK7EkUu
         8KTpRZGdSQ5rbrhcsxf8C7GozNTjsttQmqZzmMciFOqGpb+YrqzulAGLHuaSwL0aOVmn
         GSkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793971080; x=1794575880;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=QCmCUD5+cRAdCqiqdhrCpwSJ5tYiyygF2+7HyPzxiCw=;
        b=sFx4L2bL+hWXUeteMUtP/Kq1jGdbxBHobFmamrfktMgidn7SJ6qeOv1G684731wrOd
         hg+HJUvI0Rgpd/gavmw8NK6pr+uExUnUEMEm3/3i2ctlsi0oJhXExC//8k5uDHZvVcpA
         afM9oCDjl5gxiX/Lyovt6wb/ZkLW+5xidTgIsxJRmHkJOAYeGGHB5QOqUmtp0cwEDBFh
         1DpdgtXS5f6tTqHsKsrTxxCWkZMK9MLxUZJDYGaLmZVEQw5wIuNLHeHaGvZ4KvbC9qyN
         ka2gsyPFiAG4rEQ3ZXQkojgpYvkQ6cEFoQRE/B7IL29tRiujgbWhLfVbihg6VFFlBKWs
         wn5w==
X-Gm-Message-State: APuU4Z8g+fbYbW0zrTB798XaheLwTUegxWjWvEJXqDicOUhaY0owk8Qt
	Zv/MI9okZvuGV82wTRH+EvjN0LoyObAmVpAtCFUOCSyPxi+bB2HbVhwT
X-Gm-Gg: AYBFou0/t/DgU/pEVoa6r54Aj+FlUzt1bsGQYyZPpVxfZCFjBQmyAyTNgze9w1zVyIX
	CJw9SWxc6clQGHZO1ujZJa0OGS45UjNBO4z/MySvgk0GzmI/zUB5m5mwjVDdzOE4me87K0MINrM
	uFQ2lcDwCm5D6QZ2VOFn8E76GGVq0GOxvOlShVm8UkAy/3LfOi/WMP+v5ZEklPIckHJoeInjUXW
	/R2dCbgObEYhoU5r4Ateu4a+61zS005Q7Aa5/0Rb2sc600sdW3KTOTLpGsiBYhkLNCOVlJ1+QQb
	bQOlc6MmOe8Y+O9EVPWG3flprA6GzIP3jS7yDEQtPbJxTu/kKquadtAuEX6tgoQLEbEu1ENpGKk
	Eti35OfHU9a+Jln5nfiKgYAofgrhQArKwMLNflmtuMuuLNrTRXaobsMNsX/QAH35q8zLFXFUAtt
	hxZq6pAMLgMydoyF+WjvBiUG7SkzYrh33WAnisn7cB7LRyPKfoBggzjdVhSS9C8JSY3ri8yM1Jg
	tDaQxGdJplrncQmcXwhG2kmW+eU0DBfmr/nkGAMm9P1xXXCojh4la92BsUZYOfpAl7zvktv09WN
	nhiJbG8gff/83JWIHLFVFpEMWDe5mU+4OOWAjFAnew9KJsowbIaduVpV4Y4NiSUviFvuLA==
X-Received: by 2002:a17:90b:4a10:b0:3b0:a38a:6715 with SMTP id 98e67ed59e1d1-3b0db7109dfmr2536524a91.59.1793971080497;
        Fri, 06 Nov 2026 05:18:00 -0800 (PST)
Received: from hj.. ([163.239.22.29])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b0e2a8d6fbsm1025636a91.1.2026.11.06.05.17.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 05:18:00 -0800 (PST)
From: hyunjungg <hj351016@gmail.com>
To: MyungJoo Ham <myungjoo.ham@samsung.com>,
	Chanwoo Choi <cw00.choi@samsung.com>
Cc: linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzk@kernel.org>,
	linux-samsung-soc@vger.kernel.org,
	Hans de Goede <hansg@kernel.org>,
	Hyunjung Ko <hj351016@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH 2/5] extcon: palmas: drain ID-detect work before the extcon device is freed
Date: Fri,  6 Nov 2026 22:17:27 +0900
Message-ID: <20261106131730.2633139-3-hj351016@gmail.com>
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

palmas_usb_probe() registers the GPIO ID-detect work for device-managed
cancellation before it allocates and registers the extcon device that
the work handler dereferences:

	devm_delayed_work_autocancel(&pdev->dev, &palmas_usb->wq_detectid,
				     palmas_gpio_id_detect);
	...
	palmas_usb->edev = devm_extcon_dev_allocate(&pdev->dev, ...);
	devm_extcon_dev_register(&pdev->dev, palmas_usb->edev);
	...
	devm_request_threaded_irq(..., palmas_gpio_id_irq_handler, ...);

devres releases resources in reverse registration order, so on unbind
the extcon device is torn down first and the work is cancelled last:

	/* free_irq() */
	devm_extcon_dev_unregister() / extcon freed
	...
	cancel_delayed_work_sync(&palmas_usb->wq_detectid);	/* too late */

palmas_gpio_id_irq_handler() queues wq_detectid with a debounce delay on
every ID GPIO edge, so a work instance can be pending at unbind. The
handler palmas_gpio_id_detect() dereferences palmas_usb->edev via
extcon_set_state_sync(). Its only early-return guard tests
palmas_usb->id_gpiod (acquired before the work registration, so still
valid), not ->edev, so it does not prevent the access. If the work runs
in the window after the extcon device has been freed but before the
work is cancelled, it dereferences freed memory -> use-after-free.

Register the work for cancellation after the extcon device is allocated
and registered (and before the IRQs, which queue it), so devres (LIFO)
frees the IRQs first, then cancels the work, and only then frees the
extcon device. The ID GPIO the handler also uses is acquired earlier and
thus still outlives the work. devm_delayed_work_autocancel() still runs
INIT_DELAYED_WORK() before the work is first queued (the IRQ handler and
the explicit palmas_gpio_id_detect() call both run after it).

Found by static analysis / code review; compile-tested only, not
reproduced on hardware (requires a Palmas/TWL6035 USB PHY).

Fixes: f94a5becabf4 ("extconn: Clean-up few drivers by using managed work init")
Cc: stable@vger.kernel.org
Signed-off-by: Hyunjung Ko <hj351016@gmail.com>
---
diff --git a/drivers/extcon/extcon-palmas.c b/drivers/extcon/extcon-palmas.c
index d339b86..f7496e5 100644
--- a/drivers/extcon/extcon-palmas.c
+++ b/drivers/extcon/extcon-palmas.c
@@ -237,12 +237,6 @@ static int palmas_usb_probe(struct platform_device *pdev)
 			palmas_usb->sw_debounce_jiffies = msecs_to_jiffies(debounce);
 	}
 
-	status = devm_delayed_work_autocancel(&pdev->dev,
-					      &palmas_usb->wq_detectid,
-					      palmas_gpio_id_detect);
-	if (status)
-		return status;
-
 	palmas->usb = palmas_usb;
 	palmas_usb->palmas = palmas;
 
@@ -265,6 +259,12 @@ static int palmas_usb_probe(struct platform_device *pdev)
 		return status;
 	}
 
+	status = devm_delayed_work_autocancel(&pdev->dev,
+					      &palmas_usb->wq_detectid,
+					      palmas_gpio_id_detect);
+	if (status)
+		return status;
+
 	if (palmas_usb->enable_id_detection) {
 		palmas_usb->id_otg_irq = regmap_irq_get_virq(palmas->irq_data,
 							     PALMAS_ID_OTG_IRQ);
