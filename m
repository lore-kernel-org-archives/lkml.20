Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.44
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794272718;
	b=Ap2qCZcxeRfDA3iQFHzRB5v9qDdqCfQVEMLDfoMXlqjdGcdbFgM/s70J18NLdLwOl0dh
	 KFdQ74JeI3H1ZvFbgX2uz0HP6sIA2/cpa2vb5Pxjimi2KxIjTcXJz3bGyL2wr1+apQEby
	 AT+O6uR2ILzL37xsOcER/MnVgZjpC01hIRDDWViuSqrFfoBrAL/pGcmpxKly8G+EL3iw8
	 rpb+z+w9twcWclO6hYweMpe3C35bpyRs7TkXrhthLrPlczdWkRr1WczMAJ6t/iOUFarOA
	 a5Z6kpKTg5i+CFtAI8LkN1dz5GgKJita3KUtG6F/GEvu9g8Fi7VGM9axPeSdKQsvmRg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794272718;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:MIME-Version:Received:From:In-Reply-To:References:Date:
	 X-Gm-Features:Message-ID:Subject:To:Cc:Content-Type;
	bh=MthmOJfnDDMnFbUTMe+FDaMFE08/drUE13fKZFvJlh4=;
	b=vkjqW11dNkvW1MCLuWdDN4XeaYqpwkUN0kQlzadWM2czQxJ4l+BgNGYMCVKUS18XDU87
	 X11VIJDvWqV9ZrIqym7UU7uFPjmNemdy7gsqXlCMYnTYW+wQzPl3k8b0r5dSov1ZwBAY1
	 biCPYA4WoXBZ2lCP5qMQiAWPp5orrrjiKAJdEPpgY3Pnyp0NH7/3klC8NXacrmPS5qypR
	 8ipsILQjQdZaRobSMciKpwj1yEma9AbOELujX9mUjFzrdBDl6xOFtzlhUptfiXdmEGuda
	 Vp4/Nbc3SSJVM0l3H/tCYXV8jvFkS/c1IgBR93C4OshS+tqPdV8//IfIA4UvqvUUPrw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EJwzvLlW;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.44
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 112A9606A31C
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 01:05:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 112A9606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EJwzvLlW
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-c4322d310e7so219533566b.0
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 17:05:16 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794272715; cv=none;
        d=google.com; s=arc-20260327;
        b=ShsGnVB06W7g/g3PUQdRG1B+SYp6fuRSdCKRaKD/hmOZqWRIgCUZV5E/GJQkdOpDtw
         gXu1Yqg8iRxQK9lpe8Xl7rTRN6qR8QdBiIcfvcy8e2NQIZTmULZXh8NUuN5R6503xrPO
         kqIicl3xZ0NzNvA3g4jkXmN6FCuR7I2+pJo6A1pl5aS2DcE94mwtOSXn+l3ku2l1Lk9N
         752qahA0KLfC6oxXb/NecGWVXVXSixawDhbKEIGL1YFlgNPAYOA34aJP7hmkNznuYRuY
         IiZxpYwFgR2mzjVihTj0edfG9EpZD/sl374k2Fu63iSbS4SqsijTiFWS9xiEKp9k+T9t
         FnMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:references:in-reply-to:from
         :mime-version:dkim-signature;
        bh=MthmOJfnDDMnFbUTMe+FDaMFE08/drUE13fKZFvJlh4=;
        fh=edBKPA7dm68UvTtKZTlrCsOBgEBM61QfkWPFalrr39s=;
        b=Z5xTsCBkO6QYjHlBkNWtjbuy1uBMN8VokJ6925rAriqkMUz5z6fTjdWCkfyi+QmrtJ
         HXU/iFsrGrHEnMCImT4HRtuDpiWXmoBaaHyW+xJb7EY/TPPEqt/qLRz2jLewp+DgtI2L
         85/ScSYHoeOqIYxqLeAcMBpzHTmfNE5jq1Sf791yiV7BIG13Sh8ZECRHg9BlARdfqLrN
         PrhrrIruFN6PnCxydGXFWaRnr2M7mE0yzBLlcrB9piPRY/saOURnVYiEwjOjORGEsBQ4
         tWRh16++NljrMLUR2tX6Hyet7/iMH9LgxvDPS12tY3SH1vCJk9yqttqvXpRiRGYyD7Kr
         YzXg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794272715; x=1794877515; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:references:in-reply-to
         :from:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MthmOJfnDDMnFbUTMe+FDaMFE08/drUE13fKZFvJlh4=;
        b=EJwzvLlWemAiJQlLcbFXjIDIOWSoLnPY+Ti1smD3aW/8aAMzZbilo1xHCy2qFOg0zY
         5+PMEZqAdDj/1YZI7O2vKTc6Ya8JbcTgJalkPeZJ0rkhP/IY9DlaTA84cOc8xJpm3cgb
         9jTqXOT3gpWxJqii2i7vJPRaPlsnNF2n+Fdq7EUnpODEAVhsB8i7hJh25PGn3dtdf6IT
         VWJ6sBdsZ92KLRG20BDYngVk7S3y8hKMsjWKGq+7zpLOar+huX1pSM2VyfM+5cf4vs9n
         p8IIohiC10J3uzDMexHMmvKwJ+0Njk4mLyOky5H5r8ZsH0lvpjPedTYwu5GdzKTvNPOV
         8z+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794272715; x=1794877515;
        h=content-type:cc:to:subject:message-id:date:references:in-reply-to
         :from:mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=MthmOJfnDDMnFbUTMe+FDaMFE08/drUE13fKZFvJlh4=;
        b=10VWh6zesvDcfKEXNvYHea8o87ZS64S4MqeZ70rBIIo4wvYtuTlfBqfZ7qe3+1g78D
         TSL61wduBTq/qMFAswl8H4q8zX1zdQfJqsTzTe9QPCE+tWrqU6vJnAO+0w57/XUm3nfY
         4+9zHlVPIAQ1QG+8lkq4ffulNs+cz6x48CKMbcBeTkcm2tEt4R9KrO0Y49+x9Wetj+gr
         ZZMSxVhVcuwr/8fhDKN2hO6oRMv+bkJp2QcDNYUscggpSfmDuBw3TS5FyoU+XxBh3296
         nUy5uf6vOSMXm6iLUQ9DsmF7VVWM5gI0vXwK6SZA4Yj4lzUJG7+MCeRiVeWGSYYASPos
         XeNA==
X-Forwarded-Encrypted: i=1; AL+hErEGIXBUbAyjcoIsgJtGsm+deF5hdBhU6RVr0kYa1NgB8beZupKE2wM15I4Co1jv2EeD7TzjewAMb72VT9k=@vger.kernel.org
X-Gm-Message-State: APuU4Z/9AVOvPr6HZJf/pbXh/j+B/1/vqqXcDhWf3ArdpJUwr9XnHIJS
	mXBY6vb9b5GbHm/3HSI0+P2HImw39FAMZ5QXyKohJVvbcYMyUILiIpGb6dZD6sdy+4CWAqGve7t
	rbPdsMfWGdetPQjC1yuFiO5FqfnxfPQ==
X-Gm-Gg: AYBFou1396x4PsCSd89Rd/fjvYtnf7q/iB91Xgjfy/c/4bcjUDKV7Q9kP61kXcJp0eQ
	NvdhKeW8T6qYDZxYSsUSIWIhnUsfle2VY208B3stBMg9JUGklC2tfQqjGeTfQ2BdNR09CUEa+J6
	JnVk1JODqkSRMu3xPxAFXV+TCnfEw2ospOEDHcAma7+JmPtLH+8BcXJeWMr+az1j62E3DGJeIar
	IeydYMaYtABjbVIwgqXlHbvzWkgZZt1lTU8KncpkvRppsLQ5JGBh+9YodhYoH3+BSKuwtgJOWmH
	d95TSJDysV1cod3OMOf+SYuNaWk3HDVaHThWYKM5H/eGnw5+EGMOrHysyGYs/IN43XSqP0nz25R
	fjoAJpj+YNrrbLtZ9QdMLNUoeh+U84GfUTUsC1EV1fpIIMd19ClZplhEU38SrAtDJkt61E6pP4U
	9km4N+CsYKHT4F1i+SxQCSRtj6LhOgypEkDKSLZqim/do=
X-Received: by 2002:a17:907:daa:b0:c4c:c997:8711 with SMTP id
 a640c23a62f3a-c50495fe4demr79667466b.38.1794272715279; Mon, 09 Nov 2026
 17:05:15 -0800 (PST)
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Tue, 10 Nov 2026 01:05:14 +0000
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Mon, 9 Nov 2026 19:04:55 -0600
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Received: from 77377267392	named unknown	by gmailapi.google.com	with HTTPREST;
 Tue, 10 Nov 2026 01:04:45 +0000
From: Myeonghun Pak <mhun512@gmail.com>
In-Reply-To: <CAGEsz8ENCW++SA9cdh5=2EVmto=2-2axzTwuNhaKv+xW02Vvtg@mail.gmail.com>
References: <CAGEsz8ENCW++SA9cdh5=2EVmto=2-2axzTwuNhaKv+xW02Vvtg@mail.gmail.com>
Date: Tue, 10 Nov 2026 01:05:14 +0000
X-Gm-Features: AclHuK-Tz10TtmmbetQzQohzCKMVdVOkQRARraFioJZyzZB0RQCUaNN_wDp_oLE
Message-ID: <CAGEsz8Hrng-rnKE8hVKUo0RZD484HuSUGc5rWWeGNa6JsdaKoA@mail.gmail.com>
Subject: [PATCH v2 2/2] dmaengine: stm32-dma3: defer clock cleanup to managed teardown
To: amelie.delaunay@foss.st.com, vkoul@kernel.org, dmaengine@vger.kernel.org
Cc: Frank.Li@kernel.org, mcoquelin.stm32@gmail.com, 
	alexandre.torgue@foss.st.com, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	ae878000@gmail.com
Content-Type: text/plain; charset="UTF-8"

Probe enables the controller clock, but remove only disables runtime PM.
Disabling runtime PM does not invoke runtime suspend, so removal of an
active controller leaves its clock prepare and enable references held.
Probe error paths also disable the clock before managed DMA registration
and IRQ resources have been released.

Register a clock cleanup action before acquiring those managed resources.
Keep the existing remove-time runtime PM disable barrier, and let devres
release the remaining clock reference after the DMA and IRQ resources.
Skip the clock disable if runtime suspend has already released it, then
mark the device suspended. The PM stubs also cover CONFIG_PM=n.

Set the initial runtime PM state next to clock enable so that probe unwind
can distinguish that reference from a runtime-suspended device. If setting
the state fails, release the clock immediately and return the error.
Use direct error returns once devres owns the remaining cleanup.

Fixes: f561ec8b2b33 ("dmaengine: Add STM32 DMA3 support")

Co-developed-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Myeonghun Pak <mhun512@gmail.com>
---
No hardware runtime testing.

diff --git a/drivers/dma/stm32/stm32-dma3.c b/drivers/dma/stm32/stm32-dma3.c
--- a/drivers/dma/stm32/stm32-dma3.c
+++ b/drivers/dma/stm32/stm32-dma3.c
@@ -1721,6 +1721,16 @@
 };
 MODULE_DEVICE_TABLE(of, stm32_dma3_of_match);

+static void stm32_dma3_clk_disable(void *data)
+{
+	struct device *dev = data;
+	struct stm32_dma3_ddata *ddata = dev_get_drvdata(dev);
+
+	if (!pm_runtime_status_suspended(dev))
+		clk_disable_unprepare(ddata->clk);
+	pm_runtime_set_suspended(dev);
+}
+
 static int stm32_dma3_probe(struct platform_device *pdev)
 {
 	struct device_node *np = pdev->dev.of_node;
@@ -1755,6 +1765,16 @@
 	ret = clk_prepare_enable(ddata->clk);
 	if (ret)
 		return dev_err_probe(&pdev->dev, ret, "Failed to enable clk\n");
+
+	ret = pm_runtime_set_active(&pdev->dev);
+	if (ret) {
+		clk_disable_unprepare(ddata->clk);
+		return ret;
+	}
+	/* Release the clock after the managed DMA device and channel IRQs. */
+	ret = devm_add_action_or_reset(&pdev->dev, stm32_dma3_clk_disable,
&pdev->dev);
+	if (ret)
+		return ret;

 	reset_control_reset(reset);

@@ -1831,17 +1851,15 @@

 	ddata->chans = devm_kcalloc(&pdev->dev, ddata->dma_channels,
sizeof(*ddata->chans),
 				    GFP_KERNEL);
-	if (!ddata->chans) {
-		ret = -ENOMEM;
-		goto err_clk_disable;
-	}
+	if (!ddata->chans)
+		return -ENOMEM;

 	chan_reserved = stm32_dma3_check_rif(ddata);

 	if (chan_reserved == GENMASK(ddata->dma_channels - 1, 0)) {
 		ret = -ENODEV;
 		dev_err_probe(&pdev->dev, ret, "No channel available, abort registration\n");
-		goto err_clk_disable;
+		return ret;
 	}

 	/* G_FIFO_SIZE x=0..7 in HWCFGR3 and G_FIFO_SIZE x=8..15 in HWCFGR4 */
@@ -1861,7 +1879,7 @@

 	ret = dmaenginem_async_device_register(dma_dev);
 	if (ret)
-		goto err_clk_disable;
+		return ret;

 	for (i = 0; i < ddata->dma_channels; i++) {
 		char name[12];
@@ -1878,12 +1896,12 @@
 		ret = dma_async_device_channel_register(&ddata->dma_dev,
&chan->vchan.chan, name);
 		if (ret) {
 			dev_err_probe(&pdev->dev, ret, "Failed to register channel %s\n", name);
-			goto err_clk_disable;
+			return ret;
 		}

 		ret = platform_get_irq(pdev, i);
 		if (ret < 0)
-			goto err_clk_disable;
+			return ret;
 		chan->irq = ret;

 		ret = devm_request_irq(&pdev->dev, chan->irq, stm32_dma3_chan_irq, 0,
@@ -1891,19 +1909,18 @@
 		if (ret) {
 			dev_err_probe(&pdev->dev, ret, "Failed to request channel %s IRQ\n",
 				      vchan_chan_name(&chan->vchan));
-			goto err_clk_disable;
+			return ret;
 		}
 	}

 	ret = of_dma_controller_register(np, stm32_dma3_of_xlate, ddata);
 	if (ret) {
 		dev_err_probe(&pdev->dev, ret, "Failed to register controller\n");
-		goto err_clk_disable;
+		return ret;
 	}

 	verr = readl_relaxed(ddata->base + STM32_DMA3_VERR);

-	pm_runtime_set_active(&pdev->dev);
 	pm_runtime_enable(&pdev->dev);
 	pm_runtime_get_noresume(&pdev->dev);
 	pm_runtime_put(&pdev->dev);
@@ -1912,11 +1929,6 @@
 		 FIELD_GET(VERR_MAJREV, verr), FIELD_GET(VERR_MINREV, verr));

 	return 0;
-
-err_clk_disable:
-	clk_disable_unprepare(ddata->clk);
-
-	return ret;
 }

 static void stm32_dma3_remove(struct platform_device *pdev)
