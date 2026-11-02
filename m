Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793648063;
	b=naNLf09yR7TkLN8P3o24JqPEQkLJD5FrVeqN8gqw//7pQPcoKqHYZFL+1hsPK7/4+cI4
	 YsJqykm3rjN930Ay5yFn6wrW5eu5gu4Cs/Es+zfHFyzchmmZHkVThoY2bE4TCKvX/ULsH
	 gZazUIVN8pLuXgwYDxBLUboCuHeGJgj8Xl2fBMXHfWD21Sd8bl+pL2yo+tRdTMuw0gxWK
	 ZYY263ybp1+mSgtkale6O6SXgQZEsVYBR/D13a6pUXMg00I28CKptt7ponPWZbh+JXk64
	 uzWMYNPrwlJKklcV7jo+o+CTgx6yoLkil9crUgT22E/1luqg5ZIRtPce1A/+ucsNL3g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793648063;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=clb16rj88aJbTcdYzcJEuHREx2BavzM+wmqbqo2G9WA=;
	b=wPRF4eD2HsuvR06UzRiOHOdGWI8fSsq1F4ilr/ICSbRVi0cLm8s7cqGA/dy0roJejGME
	 hZ4h+FJECgfFoEWTbhN/GDu48/E3UlCipJtkTU3LbOEMnrWOsGuIUpcEZDjMGZcQTktjp
	 ZU3XxD521DegYJe2wyLmntSD8j3tOeplM7bSL04P5KqeUCpTZqflRX8mjgBpo1YDn8I3/
	 9RsRch3qIY02SB+dFD6/BwX51aJzltch4HzgQx6dTqJmCYpdJBP3DRwSu+sDiwJNEYEl9
	 SeIkfS/QA3F9qEI7negKf51+EN/0Sgy5hBc4cxf5a8ZkuwCyZ6tEnYEC5+Hm+rtQBVg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=uf0KrYoO;
	arc=none smtp.remote-ip=209.85.167.171
Received: from mail-oi1-f171.google.com (mail-oi1-f171.google.com [209.85.167.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50818606D816
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 19:34:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 50818606D816
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=uf0KrYoO
Received: by mail-oi1-f171.google.com with SMTP id 5614622812f47-4d198f1a591so1928631b6e.2
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 11:34:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793648062; x=1794252862; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=clb16rj88aJbTcdYzcJEuHREx2BavzM+wmqbqo2G9WA=;
        b=uf0KrYoOZIGx+PEW6J08xmJsV0DaUkL3TeViGjdoLyNBNJ3rOfiqa6+EEJwmjpA5aN
         ujFa8qwAYYAkVnazWyU4d6vPjmJ42rV41SJ24cWJRYyj++hxfHLg/NVwdNCY2NzRxUjX
         v4EmSAyHsLtgpiFvLgXlwOYq+s0pbvYhpP4OJaY+Ai9wZ1qyJaBTG8nfVkAxSPqz+49d
         EJPoK9m/5rpUHo89vkIfTPPk/LbH7mbGLRlClVCn1m0svzIOlzdVc6DLxwwPMEmSl0XQ
         i6moc5xZqMK0OqyZbpWB9ZG9Vo/W4mcsYmypv57fbCV1xmAsJaFG3c/pujNMIHZRkIak
         JFhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793648062; x=1794252862;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=clb16rj88aJbTcdYzcJEuHREx2BavzM+wmqbqo2G9WA=;
        b=skBeXhFL9dq1sdfjiW5Ye33n3gntOZnVdl5FVi+UPjcvppwWQ6VhicMfm0D30v+bo5
         3TdH9jpfXjPujKUUNiStoH3u1JlJUZjNE2oRGflgyCmPRFLuca8teW8lTwJuIHpvMA8H
         O5mQIzH3/FDnKi9kHbLDvq6DgaBljo99MJaBBJe44fVscFYOgSHpbdOdMKI8COzg/XJr
         YpR3lx2mCWTDR4gdXZytj+F4Y93AJR1ANpI71dZbxR3i7aLF/ADztDAf0a44ioF9nk9x
         F4eZmY1KZzPbRDqtIfXxPuxBD3zDuf5WFYBaqLWv2ydoUfoY01m41V+y+IGHHkhtyvOG
         PeKg==
X-Forwarded-Encrypted: i=1; AKwUvBzs7D1Cc643KEYiXTpzLrZN1R3581KOP8EzZxC8QGQRFJK6bcBxLrX4YtHkTuDvVhd1Zh9qVwZic80Vld4=@vger.kernel.org
X-Gm-Message-State: AFq9FYKyH527sUIKOMTStBBhrRN4GPc8eJ36sPF1feN4RSIiPaPSd9bI
	5Btb6zEhijxSYdA46OYQZXonwM3h0dvakv6j3b/P4YFSlIObx5U7rynM
X-Gm-Gg: AYBFou2StvwN5Lo5OloPm69TF8w0TrGosgh+9FXvB4uM34PMsx1494ZZvwRM9yIX/xl
	mz8GMtCmMHfH5bB9myPM99yHWrWqjX6o6MK+PvcXcUp4V+rKKMRjIAJd2MSHmj+gnxZqlhPeAYK
	qHJROfQp5HnQwHlOQB+5Q4SMClTW4bfHfdE0VMFI1mabh6zFVfKayswNaQfMuSR/3+6+txCCyVR
	95R+VCY9rE186ea0KZujW+0gdapitzIzQ1ySnU9/5NG+E9sqjSzevYuix3aS6U6BUCn6EPes/g1
	uWCwUh88v7/ctOZ2wIu1dykWVHxZZtA4uY10L82B8jJk9f/tXz3DW2YXqLGxKVi8SeSLtdvn3m4
	/4RX5MDuujt7AOB8+zOH8gWuuLTeHbEKVlHHs+C/cYMvKZ+lVeKXT90+Y0c4uHrWtNjblVtjBz8
	CMu+fSs3g5soAbxABfOKpUutz4vCEflkvwd1KRSe4k+ND5hjAIzyZcVEmo+bypq3+TTM3Rff5tZ
	M2yNNmpfbqLsNCPq1wRxwe8v2SPZt3YAED9pfdK9Qtqd04kivuSVu7PL0hiCYNBi/N+4BlhnA6V
	+z2PtYM/OK+s4JAlAjwv9kbezoK/kNGxGtVnS5APcXtWcd09wI+K5V7wnW2BRK5jURZTLHeNoxU
	oSs8k/8v8vLYg0Th9wb6Zmpn6Gg97q7uMi266YTpfMRRXj5N7blOAZIL8vMcKPqBjomj4Pb6sl6
	u36EmXEx2b4hA1rSVJCE/LGbZN9djXUbQmtglzLbnrFfwKtif079A=
X-Received: by 2002:a05:6808:1798:b0:561:fa43:1b17 with SMTP id 5614622812f47-5640de03ce9mr7895795b6e.42.1793648062116;
        Mon, 02 Nov 2026 11:34:22 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-5640fd93451sm8558249b6e.3.2026.11.02.11.34.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 11:34:21 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Mon, 02 Nov 2026 12:34:15 -0700
Subject: [PATCH v5 03/10] dmaengine: dw: complete cookies before releasing
 the channel lock
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
Message-Id: <20261102-submit-dw-dma-synchronize-v1-v5-3-d3207758fbf9@gmail.com>
References: <20261102-submit-dw-dma-synchronize-v1-v5-0-d3207758fbf9@gmail.com>
In-Reply-To: <20261102-submit-dw-dma-synchronize-v1-v5-0-d3207758fbf9@gmail.com>
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

Completion detaches a descriptor from the active list under the channel
lock, but updates its cookie later when freeing it. Termination can take
the lock in between and complete newer descriptors. Completing the older
cookie afterwards moves completed_cookie backwards and makes an already
terminated transfer appear outstanding again.

Complete cookies while detaching descriptors in the completion, error
recovery and termination paths. Keep the active-before-queued ordering
when terminating so completed_cookie advances in submission order.
Descriptor freeing and client notification no longer update cookies.

Fixes: 3bfb1d20b547 ("dmaengine: Driver for the Synopsys DesignWare DMA controller")
Cc: stable@vger.kernel.org
Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/dma/dw/core.c | 24 +++++++++++++++---------
 1 file changed, 15 insertions(+), 9 deletions(-)

diff --git a/drivers/dma/dw/core.c b/drivers/dma/dw/core.c
index f7ca9da5af90..2d69fab06601 100644
--- a/drivers/dma/dw/core.c
+++ b/drivers/dma/dw/core.c
@@ -231,18 +231,17 @@ static void dwc_dostart_first_queued(struct dw_dma_chan *dwc)
 /*----------------------------------------------------------------------*/
 
 static void
-dwc_descriptor_complete(struct dw_dma_chan *dwc, struct dw_desc *desc,
-		bool callback_required)
+dwc_descriptor_free(struct dw_dma_chan *dwc, struct dw_desc *desc,
+		    bool callback_required)
 {
 	struct dma_async_tx_descriptor	*txd = &desc->txd;
 	struct dw_desc			*child;
 	unsigned long			flags;
 	struct dmaengine_desc_callback	cb;
 
-	dev_vdbg(dmaengine_chan_dev(&dwc->chan), "descriptor %u complete\n", txd->cookie);
+	dev_vdbg(dmaengine_chan_dev(&dwc->chan), "freeing descriptor %p\n", desc);
 
 	spin_lock_irqsave(&dwc->lock, flags);
-	dma_cookie_complete(txd);
 	if (callback_required)
 		dmaengine_desc_get_callback(txd, &cb);
 	else
@@ -329,12 +328,14 @@ static void dwc_scan_descriptors(struct dw_dma *dw, struct dw_dma_chan *dwc)
 
 		/* Detach the completed transfer before starting queued work. */
 		list_splice_init(&dwc->active_list, &list);
+		list_for_each_entry(desc, &list, desc_node)
+			dma_cookie_complete(&desc->txd);
 		dwc_dostart_first_queued(dwc);
 		spin_unlock_irqrestore(&dwc->lock, flags);
 
 		list_for_each_entry_safe(desc, _desc, &list, desc_node) {
 			list_del_init(&desc->desc_node);
-			dwc_descriptor_complete(dwc, desc, true);
+			dwc_descriptor_free(dwc, desc, true);
 		}
 		return;
 	}
@@ -436,10 +437,11 @@ static void dwc_handle_error(struct dw_dma *dw, struct dw_dma_chan *dwc)
 	list_for_each_entry(child, &bad_desc->tx_list, desc_node)
 		dwc_dump_lli(dwc, child);
 
+	/* Pretend the descriptor completed successfully */
+	dma_cookie_complete(&bad_desc->txd);
 	spin_unlock_irqrestore(&dwc->lock, flags);
 
-	/* Pretend the descriptor completed successfully */
-	dwc_descriptor_complete(dwc, bad_desc, true);
+	dwc_descriptor_free(dwc, bad_desc, true);
 	return;
 
 unlock:
@@ -940,12 +942,16 @@ static int dwc_terminate_all(struct dma_chan *chan)
 	/* active_list entries will end up before queued entries */
 	list_splice_init(&dwc->queue, &list);
 	list_splice_init(&dwc->active_list, &list);
+	list_for_each_entry(desc, &list, desc_node)
+		dma_cookie_complete(&desc->txd);
 
 	spin_unlock_irqrestore(&dwc->lock, flags);
 
 	/* Flush all pending and queued descriptors */
-	list_for_each_entry_safe(desc, _desc, &list, desc_node)
-		dwc_descriptor_complete(dwc, desc, false);
+	list_for_each_entry_safe(desc, _desc, &list, desc_node) {
+		list_del_init(&desc->desc_node);
+		dwc_descriptor_free(dwc, desc, false);
+	}
 
 	return 0;
 }

-- 
2.53.0

