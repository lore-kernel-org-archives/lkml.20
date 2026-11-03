Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793744786;
	b=T4h+m4jITgoO5Sijxuy6AulFz9B4HYuZl/H4HWMPqzBQNYT3xMIJjZhi+K/mfd4ebDO5
	 1ns9fWpLDGTZ+84oH4T6X+b8zl0Aqy5kRsrtP2GUOnQO0H9xer6AxkoANlw/0+KysykSn
	 zhJo8JbjrB7S5zNUCAbXlDgHfea66FDWmJMu0OjsN5tjbxK7cDKRg0ycYdkuUFrMWcJmE
	 f+iYmm+HD+NnH5Fr4TAQTAHUFC/Wt8Pt1ZXooOIgkNLXEUSRtlOks8NoOG/+zBv/zzRyx
	 LdMcQ07jnGWMZgqciCGFJLMdc2ShefsGsa9JwjpLdhp7KboPfdUkSc+Z+p4HNPtXRww==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793744786;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=7xV7K67o452vhJBNNJkVqcceAfykbkpk6Y6a+s1Bbb0=;
	b=3oQoM8oyj5cCMRkCX0jAso8QT7hmUnn2dckTq8h0xWXRBHB/6CVmJt26gflTZ+Vwa8kg
	 XluLYRXW3WI4mOtkd7kiGty+tq6fErbyopZp4Rfkq4VobQCdGRTLNsgluCwmsjufsJLPP
	 mSLUutrjmwxolR4/gugaT6kzKjfWOBcStUwnYPacwdSYaHPyGdOl8J+i5VyJTpOYysm+n
	 OiSBt6vyugukgxTOxld2MppBi9NjWLv4zGg+FNMFDxfQzgo35ZSoCyweWIB9iaODyP7lt
	 kDInyTYQqnR1vCDbAI0dht1S/kzMtMkNBSe3Vzw8I68h9VmT0Su0W9AgpQQF0f1pGVA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GhPrm8II;
	arc=none smtp.remote-ip=209.85.210.47
Received: from mail-ot1-f47.google.com (mail-ot1-f47.google.com [209.85.210.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18C48606EE9F
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 22:26:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 18C48606EE9F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GhPrm8II
Received: by mail-ot1-f47.google.com with SMTP id 46e09a7af769-8479f46ecd8so24936a34.0
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 14:26:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793744785; x=1794349585; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7xV7K67o452vhJBNNJkVqcceAfykbkpk6Y6a+s1Bbb0=;
        b=GhPrm8IIBrtjPnVeqbElAzArzQ1IWq+ouDe7FcEjHnZV2NsRy4MCfOjR5Vz29F+p1C
         iL5Ul3vDwGGwLDRQ6+I7dZD6LaZRCt/2Vynaohts9U+h0pKPumMuQwZsjf8am6/LepD6
         iwPduU1z5CSM41kp33QpRUqd8hijDNbvoa3EudiVfF0ZTYvRkT+PM5qPNSA7ubHT68Yc
         5m97VSgKccvzKqzNZaP1RocVUnbbyPN1tCayy3BV4BukpBra6IFZsUN8Hjv4ijG+MKZ5
         2ZKlbGHmVq8QKoqJQFr4cNTTU3VKq0+LC0PXqxpYAkpWRVgY5voNHGomx2nkiOE6xDvv
         A9Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793744785; x=1794349585;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7xV7K67o452vhJBNNJkVqcceAfykbkpk6Y6a+s1Bbb0=;
        b=x4x2ZNbz0nwI1rDfgI48xS329o4A0BNzJBVX+P4nxE34X9KZPz+tUdr9qHiKPIpDck
         DxmIfByVEWWoQiiRTK6MJWuSKkHRBmNZSaJVaOG7tfwti2Hfs+4zt8hisza/KPYk6jF9
         R2sTB5avgJM2tRXgWvLapuY6clBXaOj1k+sZ3I9sCEmPuc2OpBMTgD3gBrcwvacwrnbt
         k/GS+A9JAhn51KES5I6UphQh5HF/BPQGOBUFOKCO9aYrMOMlml3sXIfZ0+stif9jzX/n
         6JAQdaEVfsAVYCXrSAozhCmn69Qg3UmSs3jUL5WjeYM1Fb1fa5gWXEy2/QzZGwKbtccQ
         2o5Q==
X-Forwarded-Encrypted: i=1; AKwUvBw/h1uxmiY7ExE3YaGCAtFfyMdQrccei9nI7sVO3g7roPaybPtpk4UjqRhLSOvynMftzKWvXHMaylQ8tpA=@vger.kernel.org
X-Gm-Message-State: APuU4Z+KYr5zqxC4xAYywNziRgjOSu2H0ILXK7RqP4UyNDj4/JmjjWvo
	UB7u71MH3kYAouL3MuI5RRdXIz+lqD93ljHRiRACaCamHirdXcSpChs3
X-Gm-Gg: AYBFou3vIqm3iQEaSl9vVhnCg4V08OZDFwcxWgUuveeeJOBsSjZoaVk/DljPZZdx/Dz
	bY/nmu6cIR700tLs0I+rh/VWWrRZVO2P+2vKfju8mA3VV9RIY5b7D3dmsFKP6I3nHUhUDvd+ZYh
	uN22E9aSAIFbCyvgfJyrYJbxkOFnTIsYubkBsxSW1QPmHX0tlk3SMvlL9M7wEPbxu+OCh65Vho7
	K+A0BfGf2a74Lo7xvUHxfmiT+t2GSqGWUeylEVHp4ZextNCtuGeP+rm0uOCiVPWYycrG3hgrK0h
	VOp+ilhULdJFvni5niiO/pxWCqi4tRsQ0JZ5pKpDFbX7c1VO9Pu6izGhDyK5LHq/kvtkrG50F+l
	ysmDEJkeQc/1na9Qd98T2zNQSVg+NMaNspfNpQTz/ZzrLGQr8egYEgrSE3FIJuFaMRp2rkOawlG
	oM3IyVZVdvuyhqKh4ChlQ5RlDyTlj0+9MpNqEHXGpIl7SLm6S62X5qhWPBY+b/XftxlgJNDDCz1
	e73YCjJhHRdxJqnQDoFpHio/+WdYlEEuuDC/HNpeHk0VaxcpZBUiqHxN8/3QKdNtTnum1fOncF2
	SAGlePlI8MvDiA1IBCX+3jqVk2aamfCwsr3LYg7Sb9bc+OBnfJ5ADqjagmFwzeKZUO6udWTwXn8
	Ifl5VaEO/QS2kx3wwrJF0G+MX+zXnWm1m3S/9WmDr+z9hWl/yaxiNakxR0BIgJNjSckDEHn5FC6
	ncw42SnqzeE0SjHS1EqIbVm//vdi78TvjYT39xJW1EzLlGzAXJuB0=
X-Received: by 2002:a05:6808:c122:b0:55e:fa63:7001 with SMTP id 5614622812f47-5640ddca9edmr10561090b6e.36.1793744785023;
        Tue, 03 Nov 2026 14:26:25 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-567a9ef58b1sm128435b6e.3.2026.11.03.14.26.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 14:26:24 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 03 Nov 2026 15:26:10 -0700
Subject: [PATCH v6 08/10] dmaengine: dw: drain the tasklet before releasing
 channel resources
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
Message-Id: <20261103-submit-dw-dma-synchronize-v1-v6-8-2ee0c348224d@gmail.com>
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

The controller tasklet invokes callbacks after dropping the channel lock.
Releasing a channel can therefore clear its configuration and disable the
controller while that tasklet run is still using them.

Disable the tasklet before clearing channel resources and re-enable it
after updating the controller's in-use mask. This waits for an executing
run while preserving pending schedules for the other channels. Have a
pending run return before accessing registers when the last channel has
already been released.

Fixes: 3bfb1d20b547 ("dmaengine: Driver for the Synopsys DesignWare DMA controller")
Cc: stable@vger.kernel.org
Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/dma/dw/core.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/dma/dw/core.c b/drivers/dma/dw/core.c
index c602ea01cb83..56a422ba14c1 100644
--- a/drivers/dma/dw/core.c
+++ b/drivers/dma/dw/core.c
@@ -419,6 +419,10 @@ static void dw_dma_tasklet(struct tasklet_struct *t)
 	u32 status_err;
 	unsigned int i;
 
+	/* Channel release may have drained a polled completion before this run. */
+	if (!dw->in_use)
+		return;
+
 	status_xfer = dma_readl(dw, RAW.XFER);
 	status_err = dma_readl(dw, RAW.ERROR);
 
@@ -1062,6 +1066,8 @@ static void dwc_free_chan_resources(struct dma_chan *chan)
 	struct dw_dma		*dw = to_dw_dma(chan->device);
 	unsigned long		flags;
 
+	tasklet_disable(&dw->tasklet);
+
 	dev_dbg(dmaengine_chan_dev(chan), "%s: descs allocated=%u\n", __func__,
 			dwc->descs_allocated);
 
@@ -1087,6 +1093,8 @@ static void dwc_free_chan_resources(struct dma_chan *chan)
 	if (!dw->in_use)
 		do_dw_dma_off(dw);
 
+	tasklet_enable(&dw->tasklet);
+
 	dev_vdbg(dmaengine_chan_dev(chan), "%s: done\n", __func__);
 }
 

-- 
2.53.0

