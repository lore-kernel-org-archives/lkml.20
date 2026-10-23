Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792772858;
	b=46r91SXxUesSFa9aAMxMAgm/nZs//zdzioDvzXH8Mc17XaVeWXeONkKFpXhTCtPbsdh3
	 NnY+nxLxQZIV1KYUHvKPNlpalT6UqI1507IwN1W8X3uJMibNWyv1twHvCbkN3DOKq/AQC
	 fnjhOE9le+V4X3EwWYDgNzMnruCRD6dqdIAK6ks5eP+/xRUUvXGZakP7nGM5pE+oR8O+c
	 PNzqEkGXdkg20/FnGI5644V+uY9GIwb8dBhF037AaddfHfgyNld3+D5pt0+o53CZXx2Ln
	 7VNzCGMI04JzTo1jEKvRdfqoei/zhbC1NVsZZCBWf1tPTrIo21e8NEvGK7onFd+IPNg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792772858;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=NcEoJJHS6s0Ldxcf7QTPPdL5n5yIYzYW/l921a9eHYI=;
	b=bcCShm9h20+tPh2oUoSwM01CFmHtjY4nndvT8d6BnwEmKffvQ7QJlZpQ1qZ8qO7WDd9h
	 zAio2NfGqEO8Wu1jVtE3Ug6T13OqXtGGE6jXRQGm52/Db5aKh/CO+1IIv3BR6iMw3znDh
	 LpXCtyLAS6xiI4FBZ80AWLOyF6+DEtbv06CfsPovVYg1ttFyaqgpRkdUFErEZWMbm7A5s
	 zJENgMiQIPNsjcITI2fdAzqbtzqfDUYavLHFTMNyj5ZG5qN2Wptcj7IFl3d0bN53M2apn
	 8w6zauedVdFH98MBOnmCjsF0ST7bh7+C2j1fcRFNUVazv5YmtxCPbk92s54nTa3Jl/g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=bstAkr43;
	arc=none smtp.remote-ip=209.85.161.41
Received: from mail-oo1-f41.google.com (mail-oo1-f41.google.com [209.85.161.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A06560A2607
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 16:27:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3A06560A2607
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=bstAkr43
Received: by mail-oo1-f41.google.com with SMTP id 006d021491bc7-6dd4f3f696aso647704eaf.1
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 09:27:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792772857; x=1793377657; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NcEoJJHS6s0Ldxcf7QTPPdL5n5yIYzYW/l921a9eHYI=;
        b=bstAkr43KzEfnOvQVvQpkrC8EZcMp6H2yQHgpP4YuHjnzJC+a17LoDM5bdUOUNW14R
         HMEgiATvdmlwKaaPHQqESqvPfVEEWC3ZiMmMAFGk6/Zn4oSNgmztKNNiyTt7IW/zV/O5
         Z6rMDPxCaqmVFUycbjRBX85w6Hegt/Z3CWp8SLFIs4wrlAhwK3f/uw1WRvmzsNkGFTHh
         xDNPJXpn4thBivAWoiAar5mDqWYGhYwUCC9TuD++5KpUkDGnmr7j0/t4oPdwO6olyMod
         cHDZA5MKEuAWrlB6q6F1VAPAmY5VqZiDyA83jr44FUA0obY5NInDglv2mqUQRUUqzxQp
         vtJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792772857; x=1793377657;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NcEoJJHS6s0Ldxcf7QTPPdL5n5yIYzYW/l921a9eHYI=;
        b=EomOQMsHYp79wWsvKCXI4wMMll/ow1POOBhZtsQM7Y3OtFfLvfitr+41qAFbBwOoHd
         loO0BhE7F7l2LYUXiYybjBbjrUbQ5BEWYbgsAlW19EcLOPLvdzo46/WYP1QrrP4w27OT
         mp1dBWGsVsSwq6cAFMcumCnTsxz0CNLkFNjZR8j9c6+I1obXBNDg7KJ8c1sPXhwJHiuT
         kpU0GnwR7kCiGRff6yxpBX1M1Y/7IfPqBb9RCNfkDbBUDgd+o7rjnVDK7NEVbFxJHr+x
         SS2luaG/reDCXC0lZIH1dwSM6gHgAAQOciqVI+IELA/N0UyQrpjWebTkEsX01x6t1sIq
         Ur3w==
X-Forwarded-Encrypted: i=1; AKwUvBzBrVoMXJvD859LM56gcpIKu0jNHO5d2LcbfcBQP9CaMCqXs68spx++iGH0mekRIlSafxeFZFMBXB6As1k=@vger.kernel.org
X-Gm-Message-State: AFq9FYJo9FfdjZhVFvS0dYD6Tc/S6tKKSPJJcCRxhlVqK6euIFUmuIAs
	kaSjjsLkPORSa4kugkE+056IlhVYimbr2IYAY4rJKl99O6DntmmDOhdT
X-Gm-Gg: AYBFou2W1wvNp4WNkUwGZGT5P7HHazQ49+EYwARlDCczb/xTW7+zmYzoVv6LUpxL+z8
	kNJG/9+vCJv74S/ri4ySl+woK3QWMui59A6VfPtiYcpDE3kHwes0LNymBaMTuryrhbNR1VMkv0W
	1dUapZDm/7GwC/cHHDNp2u6knM8qXQA9NcjptQ5QwgDALzMyA9pzScQc/UFjSQB5kCBYI3wB7Ay
	Zdt4K0KU2tNqEvKiNbW5Ses8km9I6U++DSHY7XIOgB34kK/+jfYfBitZQR3TmPy+5Y4qwMIkB0w
	AOI8R4qR8ZmigxE1/r20+z1Mqt9tG0TrjPjE2JG0yxeFlutnyDx9coRUjlTnFwTmfE3yNE5rFR7
	X6WYtaYpDf4sBYPk1Bwp/rYFrTnOImUvNaXpiCCS32hrs9B9WY9gDg9kBxo7NlZ43+rE8SwDIcE
	wqkk72Xl/uQaXeTJbDdPAB7En8Uyb6+sVWNJ5gc8W/svBZ+58EUIgbGDk5CUBHhsTLYVuyVYkI/
	yEFAX0+gEW8BvDCesm5xgGTu89hjpRq0fQwVrYSOPh96UQ4mZL++CSko7atICyiXxke7aM7WEbX
	6/Pxck/AdQSgdSNa0SUdMTxIpAUoPyjq70RBN9VdE+hpDE1PTYMhbBgDs+3nzVZZzhwN3EQyOgb
	09qRGp1GtREW0gDmnpV0XlHZG0udmBk3THPruL7fSeBiK33tQphG0TVs11Ud9LRQEJsaNK4Bnaz
	8YazU=
X-Received: by 2002:a05:6820:1621:b0:70b:8379:c170 with SMTP id 006d021491bc7-70b889b7a5emr1671116eaf.27.1792772857121;
        Fri, 23 Oct 2026 09:27:37 -0700 (PDT)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-70b9aed3144sm372801eaf.12.2026.10.23.09.27.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 09:27:36 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 23 Oct 2026 10:27:25 -0600
Subject: [PATCH v3 4/4] dmaengine: dw: synchronize completion callbacks
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
Message-Id: <20261023-submit-dw-dma-synchronize-v1-v3-4-c62bf048f5ce@gmail.com>
References: <20261023-submit-dw-dma-synchronize-v1-v3-0-c62bf048f5ce@gmail.com>
In-Reply-To: <20261023-submit-dw-dma-synchronize-v1-v3-0-c62bf048f5ce@gmail.com>
To: Viresh Kumar <vireshk@kernel.org>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>, 
 Maciej Sosnowski <maciej.sosnowski@intel.com>, 
 Dan Williams <djbw@kernel.org>, 
 Haavard Skinnemoen <haavard.skinnemoen@atmel.com>
Cc: Serge Semin <fancer.lancer@gmail.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
 dmaengine@vger.kernel.org, linux-serial@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Sashiko <sashiko-bot@kernel.org>, 
 Lars-Peter Clausen <lars@metafoo.de>, 
 James Hilliard <james.hilliard1@gmail.com>, stable@vger.kernel.org
X-Mailer: b4 0.15.2

The controller tasklet can detach completed descriptors and invoke their
callbacks outside the channel lock. Terminating the channel does not wait
for those callbacks, and there is no device_synchronize hook. A client can
therefore reuse callback state or release its buffers after
dmaengine_synchronize() while an old callback still uses them.

Disable and re-enable the controller tasklet from device_synchronize,
outside the channel lock. Disabling waits for an executing tasklet,
including descriptors it already removed from the channel lists. After
termination, a later tasklet run cannot acquire another descriptor from
the terminated channel. Clients must continue to exclude new submissions
on that channel until synchronization finishes.

The tasklet is shared, so other channels may schedule it while this wait
is in progress. Preserve those pending runs: tasklet_kill() temporarily
owns the scheduling bit and can consume a concurrent scheduling request,
leaving controller interrupts masked. The disable/enable pair leaves the
scheduling bit and pending tasklet queue intact. Other channels' hardware
transfers continue, though their callbacks may be briefly deferred.

Fixes: b36f09c3c441 ("dmaengine: Add transfer termination synchronization support")
Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://lore.kernel.org/r/sashiko-outbox-180707@kernel.org
Cc: stable@vger.kernel.org
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/dma/dw/core.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/drivers/dma/dw/core.c b/drivers/dma/dw/core.c
index 6d27af3c0f2d..d80be93f0c49 100644
--- a/drivers/dma/dw/core.c
+++ b/drivers/dma/dw/core.c
@@ -910,6 +910,19 @@ static int dwc_terminate_all(struct dma_chan *chan)
 	return 0;
 }
 
+static void dwc_synchronize(struct dma_chan *chan)
+{
+	struct dw_dma *dw = to_dw_dma(chan->device);
+
+	/*
+	 * Termination removes the channel's descriptors from the lists, but a
+	 * running tasklet may still own a completed descriptor and its callback.
+	 * Wait for that run without losing schedules from the other channels.
+	 */
+	tasklet_disable(&dw->tasklet);
+	tasklet_enable(&dw->tasklet);
+}
+
 static struct dw_desc *dwc_find_desc(struct dw_dma_chan *dwc, dma_cookie_t c)
 {
 	struct dw_desc *desc;
@@ -1318,6 +1331,7 @@ int do_dma_probe(struct dw_dma_chip *chip)
 	dw->dma.device_pause = dwc_pause;
 	dw->dma.device_resume = dwc_resume;
 	dw->dma.device_terminate_all = dwc_terminate_all;
+	dw->dma.device_synchronize = dwc_synchronize;
 
 	dw->dma.device_tx_status = dwc_tx_status;
 	dw->dma.device_issue_pending = dwc_issue_pending;

-- 
2.53.0

