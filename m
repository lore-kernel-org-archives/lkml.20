Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793312996;
	b=IXchv448H/8Ak5teXcqcQP8fjUzzy8YiP7KO71d3fcZYCsiJvgUCz+J2Nc2f5UZI3jqC
	 88ih9RECi+0XhhrdC8lWzLuxgWvPc3ln+hVl6EPQ+9oIXwerNepdW8iVhQAgGYjXlCIL0
	 J2brQMooBKfmdAqH1UuC6tlcPUZKPXyMeQ/PSUc8AcIIeyWBSr+emZrStAk4a9aqGuYVi
	 hsIMzSKcc4P4X1wkveZzwpv7ABAbKFvRvnK5lvN5FtGlDigsNsnZk5z8SCjRV1RftntKX
	 wuwpaqysS9l6G9SE6VWzrLOR128lwvvbxy8EPJ0Bjob7yaK4n7ZD/QcTwHf4sMYtj4w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793312996;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=wkIhisdDZBkDpi2Ngf0GdoFEgXXogA5sytIiQ5NQ4z8=;
	b=4ApMJV0GYBpmQ7paBRnhQ5DR57gbhiqL4YhJgqB4fOWrbfJ1VpQXeLhp0tpz8ctiJ0oT
	 Ygwnd7TLHvI/CF5fIQq90z+BLgHSHMh21+McSDS5oncHnPOTPP3AIvwrQM44qkr1r7+Hr
	 8ec+di6OsQZrMQnjgpo0C20gMNRuaeFE1OPW67cz8fOoPBrYsNP+B8ptfH4ldt/pm3+rr
	 aIi0hiV8HxTaxAggSLZVblykMtZFgSPXPKHZ8b+YQun4+hnTzaERGNcipDB+5Vxr2Rl6e
	 dK/XRyfYQCahXdKpk8h0OdAkePk6GI4HJ836NmHrltiH2M3LnRXLfj/0duIK/9PSpzw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RNR9Efno;
	arc=none smtp.remote-ip=209.85.167.177
Received: from mail-oi1-f177.google.com (mail-oi1-f177.google.com [209.85.167.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1F8160A2604
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 22:29:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B1F8160A2604
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RNR9Efno
Received: by mail-oi1-f177.google.com with SMTP id 5614622812f47-4f14642adb4so71151b6e.1
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 15:29:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793312995; x=1793917795; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wkIhisdDZBkDpi2Ngf0GdoFEgXXogA5sytIiQ5NQ4z8=;
        b=RNR9Efnolrr+Tv9pm9QqjboB94rb3QbKuu+iJXO4ui75czgSEYX97arGLUAsN9mwo2
         B50CHn1wvxCqxQCsXAFdR+7ydwiXXqH0SYNxsKZp6tGp+lzWZBCuGO7d6NaT6SWqAah/
         4oh5JKgWkM6Mn4xhGHrO/636qy3uWRezfa2BPyUK2oVVonW2O/EQe5p0bOJ0CI9J0n9B
         uKvmM+L6elc+Qm+WjsLg58z2wgo/+S2tZiMvIJAPe+Dgz8dWV8WyL/smx5HUOKvydH3w
         lowo1cfPCa8eR5h8J4jeIoEziEYkFV7djX03DDN1ASjBCGAAarILZr7aTW+aQ25QklH9
         dMJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793312995; x=1793917795;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wkIhisdDZBkDpi2Ngf0GdoFEgXXogA5sytIiQ5NQ4z8=;
        b=s8penwoIB9eBqvPAub9R09+yePMJ3rGMCcBriu0+rOlnnQ+rVHDUjQPs6T7WAjHjwE
         QpYJS3E+dHjS4XiBc9mJY4BKjpSJ2Bv8HWFvTGIQz3c5qcz22yNdL427vmUTLOiqWGgW
         MLQ/hKfMAiySsUssazORHpIbuEVrXy5w4WS5oo9bvAIiHcYSvgT9t6hrGO3jCbMym8fm
         ZywRRjJtxldy6rXguChVofgm/ErL1NXpJ8GwtYvY6KkGEHjEQc/kjAcS2oshYY8vKGef
         1lkDEJxj8g9B6q+hafHEKU8gSXrtgn2YjvXWmp02tHNNBqt4yJx7k9Pji6paFhGJRdR9
         RU0w==
X-Forwarded-Encrypted: i=1; AKwUvByB61e4f1YdQ24JTdqN1MMfHt/Gj+IyZKZ+Za+wlhwp2XJ6iGk68qiXvuYtAKdFLNrxbXwg/+ne54mlpLU=@vger.kernel.org
X-Gm-Message-State: AFq9FYLwr+b2Be47f16UWgdh9TNqDiZzZN7S3mqzuso3cZceVpYlC/A8
	48GfTLnrNYG+mKd2hrZYUDWJ7S7DykK61tAhetZ1QCkSr0eY2QqSUzlF
X-Gm-Gg: AYBFou0nT0I2jXGt/lLKwEwOKZOQgJM0lEVig+21LUnSRaIy72Hwp1/N2QqgfXOC++R
	JXH9O416GB94JSwuJr+A8ZYYzNXtQO0e8E8hBGWd/CclQpw5FCTI8IMp80qF1B6GyMZKJIzPLAH
	pqelNIQHc6dvMh5YuK8PEkpLNGJfsQfZWoK/25OxhzqdLjaDtf1q5tK9nWm/gW8xon41pQBmoqI
	mCSBL1OoxmLfZswBRAk6pRrnNHIFo3QR+JwEb6fJCiSU6sdC3zUlConnlprMH3/7y6DZzFO6P3Z
	xbeZIzjZR8KETNO9kJhCYz2p14x1FJaB73sG6ulfP+mmrJrRzSt1DCZZyGL1GzXHEohhi+syM9r
	CyR4lWrGtcT0+OFC4NhN6gwAmlX2VisOdQ9twTPH5bCKyi7CyUdatnt+1UFH0JI59S8UeKXjCyI
	Uu+qZfmVA1B/9n10995lnNrMoL5/p00ShL0vi6EzbTtXk6Rxyf9ruZmhYoin/DUKY0rHVF0KN2n
	T+SeyvCt95iWkuM3iwawP8fnQX81Gr9Lant3oqW1r4tHLKFbnjYkQi5Z+uBLlBbCqwvykQTINvY
	SEtytsgkoWSBfASMrihcAeOeuJs04I+dV2jbw88PY1moNV9Srm9V0SLVN4M9xXEm4TtrRiHTrAZ
	m7KAAiOXdKza7AJ1mHlyBmr33zjg+nUdS6RUvaKzJcLkVioQCrwiqq/n+Y2xKH3LmvOdIhDX1Mm
	FnMg/mZ8VRoX9qABq7jJTxaUGK5/3JIDiVbgFHf8fMmZaRgmbUT9EC
X-Received: by 2002:a05:6808:1383:b0:4e7:3fd7:2752 with SMTP id 5614622812f47-5640e02af93mr409218b6e.54.1793312994747;
        Thu, 29 Oct 2026 15:29:54 -0700 (PDT)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-5640fc49880sm236130b6e.2.2026.10.29.15.29.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 15:29:54 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Thu, 29 Oct 2026 16:29:40 -0600
Subject: [PATCH v4 6/7] dmaengine: dw: synchronize completion callbacks
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
Message-Id: <20261029-submit-dw-dma-synchronize-v1-v4-6-fea447d9f285@gmail.com>
References: <20261029-submit-dw-dma-synchronize-v1-v4-0-fea447d9f285@gmail.com>
In-Reply-To: <20261029-submit-dw-dma-synchronize-v1-v4-0-fea447d9f285@gmail.com>
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
Reviewed-by: Frank Li <Frank.Li@nxp.com>
---
 drivers/dma/dw/core.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/drivers/dma/dw/core.c b/drivers/dma/dw/core.c
index 3bda85adbeee..66065d7b26ae 100644
--- a/drivers/dma/dw/core.c
+++ b/drivers/dma/dw/core.c
@@ -902,6 +902,19 @@ static int dwc_terminate_all(struct dma_chan *chan)
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
@@ -1295,6 +1308,7 @@ int do_dma_probe(struct dw_dma_chip *chip)
 	dw->dma.device_pause = dwc_pause;
 	dw->dma.device_resume = dwc_resume;
 	dw->dma.device_terminate_all = dwc_terminate_all;
+	dw->dma.device_synchronize = dwc_synchronize;
 
 	dw->dma.device_tx_status = dwc_tx_status;
 	dw->dma.device_issue_pending = dwc_issue_pending;

-- 
2.53.0

