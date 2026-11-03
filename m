Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793744780;
	b=k5WWAcXoaZjF+aFNUignBxRUxsVfwfQ9TfWTnlLqHc9jMGXYWFxeD0eCZhZtKpj7DzyG
	 /vCZPiA69g3zH0Dd3zJFbqL14ozPNeW6Bb9qUj3ZdGC0tba6CFnetlBgmaNXOhNbsiVey
	 47fl2gFAOM+uOlpcJ+EvMb13PwcK0zcrozPwfzV6lo9tq6CKIlbXjKMKzpGL/h+4VMxKC
	 kX/ioWM/ggi6mBbXATOvnaP0Ld/LcCX5ID4DtliBFXykQ8wxsYJxJI8rpZOIfb/VyFgfs
	 U1jaQjtMHDwP5qH9B9ZHCciQfjOD4Vpcj9wJfg8fl5iWZbhKAqIjYzEEo8gKnC23hMw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793744780;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=OS2UBcR5n5u6jJuSGCUmpdlBoEKk3jjjMEO5gyi3TM8=;
	b=MaXtp2LDC5nf73xAGLkXf0XLf1cMTtIRZTIa7erb2aKWmtA+8KrHyM9770dTZ6AaUs+w
	 u5LcBKJy95srpr7WQbu8c/fZ+JFM4Smfj0FMunEi/qA5ede6tHQrQDZ3DdXsClKCRoxtO
	 IrHDT4IaNXSKlMLUzPhnF5y5xhF0iZYhkn22puw38Qp/FLITm7qRnLxMZbhchirIzCAAv
	 qsESD9DEd4qJoXZXuG5uRjJDsmbITse/M0oggpkUQ4Mm/egai8zDG+eYb8B7t+Oa4asOf
	 REoRNwTzUiGP7TGO2BZzxN6w2XzIR4dbgYQKwKVtUutZgKW2h+GG4beTnqcbV3IQY4A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="tFMaa7U/";
	arc=none smtp.remote-ip=209.85.167.177
Received: from mail-oi1-f177.google.com (mail-oi1-f177.google.com [209.85.167.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 731F2606D805
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 22:26:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 731F2606D805
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tFMaa7U/
Received: by mail-oi1-f177.google.com with SMTP id 5614622812f47-563a0462094so57837b6e.1
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 14:26:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793744778; x=1794349578; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OS2UBcR5n5u6jJuSGCUmpdlBoEKk3jjjMEO5gyi3TM8=;
        b=tFMaa7U/EPvWCJKXZ6ZVDPzrLj96GdU0G3vCTU6OXsFkiS8ic9DdBhM9e93NiUpipL
         u0+hBeddxPHKptEdjYPJNPcM6b1HiJdMGK1iDdsdJNyqkwmtswRYumFyAp0pgSUOzd8t
         OCsGp3isgWHB1ReFTUu/BqDlPxHxAuB7kK+TdOH7hpnR2ZLarblJV/EvBJ+UbCHACsTh
         UiigkxjrTsmr0Qzz6BXt7PZ4GgQWYTC6ArpAk5tUCIwahRnqdAwky8wic5jsAbpYFsDS
         s03ltWCGE+Fr7LISzrztj4xyjjlG36r6biFlqdVeY3Fpn0LkS+PSQeLsb8Q8u2hAoSjR
         8wag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793744778; x=1794349578;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OS2UBcR5n5u6jJuSGCUmpdlBoEKk3jjjMEO5gyi3TM8=;
        b=F37/sOC1npi/PFTXtfwA26NqA0UcVpzMLUFrfwwb0wnhEZS03Gp7ln1OrKQdsFBqMI
         INB0negTsjU7qvukicd+wrfDtKshKBSUc7HW0J1hpMXhAo27+eB7akP0y2hxLQ+Vj6iB
         21dFoZ9W6O6a4lWNHemwaciH35nIvvNthhJHhmbQG8vnYF8eF6Dwpv2yfJlQOt5FiCGT
         ORk5Kb61LEbljgS1/TWS0Obbx/P/WUI6k63GlQgX1sF4RRAxe2ZLBrrugMuqRCpwd+Q6
         /pQ0V7rJ7bGp1h7ZEc63TyqvbDllCn1K/33P1AoHuYvVeulGY9wf1osIMF0qCMujms7S
         C1zg==
X-Forwarded-Encrypted: i=1; AKwUvByNI/mKp79uEqN9xHVnVrPKs3dy8aWJ9YWlMornM9V0RkPs6W+r2eUuEkTJWiHqqaZdqUSFcn0wJS4tIlg=@vger.kernel.org
X-Gm-Message-State: APuU4Z9TNzXPwK8dHFm+5ni+YhijEngEv38ih6fWAhUkXpeqZKCjV6l5
	Kd7HPV7czFx5x6HNi3LN+kblun8jXZOviOoKnCMfkjJJyODqKywyrLe5
X-Gm-Gg: AYBFou1hE+t2fDGpFNpJ57hGNJOISKPPYJB/4/I2udm89W9Ri5YhfUsLf+7wiTWyr5G
	6/K9JhZS8+zB+cEftfpXy7yvh8vhktOnDVDo8HHLAXl+ecyd6PVugnG2xRC/JdVBFrnR9nnoVCA
	489XCbYHOKjQuz9QdbWJFatyTwop19Ze5XSYS5z0t8PNSp2b4rkuroKQfvjc+a4T+v3fI2HuZpX
	/vfXVq+XM7wQ8gvVGt7UEQztwzCvvQ7nxxVUD1r/TDkS/NTWXtRemq5DIKfjNG/X22+GRcmOQEM
	4J/nkjo+8TvZltlEijFS3zCSyeAeYh/kIP7mcVzCEJCw3DaoNoGYs6SrKkvDRb9hgn1VrXKB19b
	RAbLJHND6vXpammzt7tyn9m2HWSEA+qh8N8APTYdfS9cZH6eA1JekgGbr5ws+Q7bD/o792q3qsR
	3Z9tykyJN+5MA6cg1eGndUqFmZYJD7S1DgVtU1q02UFb0c7b4McN6GITKFfqxbC3gWKUbEG8jn6
	0kv6pJ0LW/90xJzao83huKyjl4HwCB0ri0Ebftz3OdXJZCFSLBOaal9jKmJsUM2zBalINxk0GUD
	Z6xMy17KaDFUTCLYoK2dbXaYX4NGv0G7y/t/vEK0nZQgdNcj5f0WOV7fXtEriW/cl3rCe0rom4r
	lM/U2aYsxuVSV8pVz1RiBwNC8aAJ9aJpSvfBSoEhDUDFUjslxW3fFfEAogCeBoxNjmRUHyjRGUG
	dvE7SA0pYqcWyyltMvEBOodv4gRlV2mrmjZSjOkHN0SMkurIUW9qx9i5339Caoi5tHoeSo/fA6
X-Received: by 2002:a05:6808:2207:b0:4e8:92e5:db5b with SMTP id 5614622812f47-5640de625e5mr10539802b6e.54.1793744778356;
        Tue, 03 Nov 2026 14:26:18 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-567a9ef58b1sm128435b6e.3.2026.11.03.14.26.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 14:26:17 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 03 Nov 2026 15:26:04 -0700
Subject: [PATCH v6 02/10] dmaengine: dw: serialize error recovery with
 channel termination
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261103-submit-dw-dma-synchronize-v1-v6-2-2ee0c348224d@gmail.com>
References: <20261103-submit-dw-dma-synchronize-v1-v6-0-2ee0c348224d@gmail.com>
In-Reply-To: <20261103-submit-dw-dma-synchronize-v1-v6-0-2ee0c348224d@gmail.com>
To: Viresh Kumar <vireshk@kernel.org>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>, 
 Dan Williams <djbw@kernel.org>
Cc: Serge Semin <fancer.lancer@gmail.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
 dmaengine@vger.kernel.org, linux-serial@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Sashiko <sashiko-bot@kernel.org>, 
 Lars-Peter Clausen <lars@metafoo.de>, 
 James Hilliard <james.hilliard1@gmail.com>, stable@vger.kernel.org, 
 Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.15.2

The tasklet samples RAW.ERROR before taking the channel lock. A
concurrent termination can empty the active list before dwc_handle_error()
uses that cached error to select a descriptor. The list head is then
interpreted as a descriptor. Even with an active descriptor, moving
queue.next unconditionally can put an empty queue's head on the active
list and pass it to dwc_dostart().

Recheck the error status under the channel lock and stop the channel
before selecting its failed descriptor. Only one transaction is issued
at a time, so take that descriptor directly instead of scanning for
completions first. The scan can otherwise complete it and start queued
work before the error handler has identified the failed transaction.

Detach the failed descriptor under the same lock and use the queued-start
helper, which leaves an empty queue alone. Clear the software-LLP flag
before restarting so a failed multiblock transfer does not prevent the
next transaction from starting. Keep the completion callback outside the
lock, with the detached descriptor owned by the tasklet.

Fixes: 3bfb1d20b547 ("dmaengine: Driver for the Synopsys DesignWare DMA controller")
Fixes: f336e42f73d9 ("dw_dmac: Move single descriptor from dwc->queue to dwc->active_list in dwc_complete_all")
Cc: stable@vger.kernel.org
Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/dma/dw/core.c | 22 ++++++++++++++--------
 1 file changed, 14 insertions(+), 8 deletions(-)

diff --git a/drivers/dma/dw/core.c b/drivers/dma/dw/core.c
index 2a9db9e39f5f..f7ca9da5af90 100644
--- a/drivers/dma/dw/core.c
+++ b/drivers/dma/dw/core.c
@@ -403,10 +403,17 @@ static void dwc_handle_error(struct dw_dma *dw, struct dw_dma_chan *dwc)
 	struct dw_desc *child;
 	unsigned long flags;
 
-	dwc_scan_descriptors(dw, dwc);
-
 	spin_lock_irqsave(&dwc->lock, flags);
 
+	/* Termination may have cleared the error since the tasklet sampled it. */
+	if (!(dma_readl(dw, RAW.ERROR) & dwc->mask))
+		goto unlock;
+
+	dwc_chan_disable(dw, dwc);
+	clear_bit(DW_DMA_IS_SOFT_LLP, &dwc->flags);
+	if (list_empty(&dwc->active_list))
+		goto unlock;
+
 	/*
 	 * The descriptor currently at the head of the active list is
 	 * borked. Since we don't have any way to report errors, we'll
@@ -414,12 +421,7 @@ static void dwc_handle_error(struct dw_dma *dw, struct dw_dma_chan *dwc)
 	 */
 	bad_desc = dwc_first_active(dwc);
 	list_del_init(&bad_desc->desc_node);
-	list_move(dwc->queue.next, dwc->active_list.prev);
-
-	/* Clear the error flag and try to restart the controller */
-	dma_writel(dw, CLEAR.ERROR, dwc->mask);
-	if (!list_empty(&dwc->active_list))
-		dwc_dostart(dwc, dwc_first_active(dwc));
+	dwc_dostart_first_queued(dwc);
 
 	/*
 	 * WARN may seem harsh, but since this only happens
@@ -438,6 +440,10 @@ static void dwc_handle_error(struct dw_dma *dw, struct dw_dma_chan *dwc)
 
 	/* Pretend the descriptor completed successfully */
 	dwc_descriptor_complete(dwc, bad_desc, true);
+	return;
+
+unlock:
+	spin_unlock_irqrestore(&dwc->lock, flags);
 }
 
 static void dw_dma_tasklet(struct tasklet_struct *t)

-- 
2.53.0

