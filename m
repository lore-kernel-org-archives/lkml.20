Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793312994;
	b=nSoJDup4/+1QsdvYVqnEpGMdNRDA7e0vS63LZrnAlS9iaOQfvaOH3R64UoMqGexNYbuF
	 DPLF2Pkc5MuJi0hmfr71cRCk/+tef19KywwtpJxaH+9QIz7iMAcYfk8+K+YsjtLFfwmu3
	 V/PkZP4MmTo/681GLdHOUIIOBOf0JkUr+E8xY+9FK25ZeWvwK/djqFl2ZulmYw0le35aR
	 64pNAklWch+q3WNL5aW6omPQ7+9D0kLtO/LkX/FVjM1hTYKVr/VqLWTxVci7CkIeJmlGl
	 QZmG+YQh9/a2r2SLKgI3yefY96Il2X8LSdZBtDW/DkEnArO8BKIm1jaTwYDL9xMaAoA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793312994;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=94WZMClHJfI/hK5hnDLaJYjY1fIJ24YVjNi0D7Blgz4=;
	b=ZJW6GgHTo/JpMFu3Kk+JqNxslstNqS3leWO8fwJxkyMB3wHo7AnLNfgpbeanS3FgpoRU
	 MDBW2TFZRh4BKIEesFFBu1sCT4tQvkqm0hLtBNSp86Unu/7zKa4des2n/qH23TyV6iaSG
	 J95/KgwyBi+P9y0f+dLr0Tv4xNhdGtLz16Ao6FdQ/9U0htWdLKHI/7X38bJzec9SzWtgQ
	 w1JyLW5QxVp3j3otRS07eF0POMVJ4O71S2UFZSnqxnHHDwb+ikgXT9ElZk5fq2/aLr/gW
	 Cs7pRr2mYJPlq2c5bPjO6rjahe3TF8LL52f7ULzKeg/O8V5Qt+BZYdvLbs7DyuzD0vA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JcfI8QcX;
	arc=none smtp.remote-ip=209.85.210.47
Received: from mail-ot1-f47.google.com (mail-ot1-f47.google.com [209.85.210.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89965606A33E
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 22:29:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 89965606A33E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JcfI8QcX
Received: by mail-ot1-f47.google.com with SMTP id 46e09a7af769-823e4047037so104388a34.2
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 15:29:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793312993; x=1793917793; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=94WZMClHJfI/hK5hnDLaJYjY1fIJ24YVjNi0D7Blgz4=;
        b=JcfI8QcX0MkbuJpYSDzzNklIPIfn0nH7EJu8TYdFgebu+YQVrQhDw+mvk1wGbaKMGq
         xXY8+WzzD737OMw3GX0zgsKKqQ9YH4TuqEoT1YoDbARN6o1chKnJcJoPFErnm+vJ+FSm
         mZ9oUf/MyGxkQ7u9HVFZdxFYzHEVrB9+L31XZQKFeX/f1nZAj+yXbzHI+oWBCQBke45s
         ceFmyKnZfwWgN3YGJP+6huiuqz8HgijQwNUpOeyOEvATYJyRFxub0h0P59AjByjU3Sxg
         /sfcdJ/FPTo+xawFPEj749PiJlPbsg9E3yRB4iGMhZpW/uN7xGBhaqqoCq4yVJUqjKXs
         hntw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793312993; x=1793917793;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=94WZMClHJfI/hK5hnDLaJYjY1fIJ24YVjNi0D7Blgz4=;
        b=Qm08ZZCKdBCLRKkvk+R1dr2Xw1woT2BSjVW6AedbpgH0z+HKRm328UrlfftPPYcZj8
         WvQM1AZiKHklI8XnCTdfoYLN2ltprprzEVnczHavzGnKQyBt+YYQnXQ9pi+H+9KshATD
         wg/A4+lN51VfBvzcKJnGfLSqlNEQFTDujyaVzOIa9XQ7e23yj8otZqMFsWAWspz62ibn
         Fhsp5cEqe74ytymdsOgwIugDJtTEXoUdQZRRsl8yXVMhUlYLx8Tib4VFPNgS1gU/Nwoq
         hAZC5PxVL5ugxL8VoJbk8uBEeTPn0lCzCOBrz0K0rHJbh8s89iNYjEFciTKHNML7rC6/
         hKqg==
X-Forwarded-Encrypted: i=1; AKwUvBwFjGoc96zp9M5EEcOwDzM7QACtQB0ImekaMwdS4vo/3rA4dd/ylfhzLvrKbwOqihRwA4c+ozp69E+NFYU=@vger.kernel.org
X-Gm-Message-State: AFq9FYLhAHR86q2yvnI8yASzarhaCqigNMr0QDbNpvoZ/REjn1H6mMZm
	d2O3YvSjrxnmJSEAbbS5UG9g8A4QyLOmZV9VOa5o7MBr4u5QpFQjIGgc
X-Gm-Gg: AYBFou2PQIDp3CFeCRTgSgwerkmuOFzWK0cBKrNE2A5I5dE9fA5PaARCF7ReDGXCLgN
	tUIx9z+dFRNDuEa4ATsShVgSxVZ8qYl4B9dLi3CQ+/W4bjHNji/mo6IQH1qeFKXIVaC47I5vx6/
	qByyaw0Z8TWIb3X9IBo2Pndj6UyzcW9TewEvHdfpwWvs5odHOlTCwbOT9k9bot5cDU88Bd7Y6jn
	2pE3TS79ltJP9p+tf1echDYvw2JOkoPBJNyp+e3YAk5Mi4TKZnPgMIPaOWTcLfvDGFO236QVL3S
	tsk12kTnKrZH2kOFeEQUcZTM8Kf4KMG28EzQxjtrvxJX4BsQYUSGTaGCal0ArcyuknOi8HBgN5d
	FfQfbNF2L4o32Qr5SjWI5il9jPIUc4OjrHUGmYGpZl2aGR3thNPe0uQz1eiCqYh9ZlcoRStMeCz
	VLLwD1tA5R9eFY3XdBl1G0R7GCYJAaS+9bsQA8dlxgogNrGP53OpvW7jFVjCzSn+8+rte53RM9k
	BHKMd6EVc3bakRpqTCyCE3z59Q3mjzEZCM8D1YDQfEAHbT5QAGuOfl06RLi2hX7V4ExxYJWlLLo
	9wAa5wCZ3n0RQSQnTvKYmN15qs+DMKQNle6i+DMhN1xkWcbkerdYoARbE0OM8k6WlbwrryUjVko
	MViRKY7DGmNd7Uzo9ftshcy2fq0xSgnXdm+FzlAA+g3VwO6yqyEMTCDF0OsgTJ8I0nITFKuvWoW
	1vPvrQJV/7oZT1c7lm3J/ECBPWYMzQI4ylBnqGmW4B9VksVbCYN1gb
X-Received: by 2002:a05:6808:1244:b0:510:7dc8:5ff7 with SMTP id 5614622812f47-5640deea651mr505285b6e.19.1793312993474;
        Thu, 29 Oct 2026 15:29:53 -0700 (PDT)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-5640fc49880sm236130b6e.2.2026.10.29.15.29.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 15:29:53 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Thu, 29 Oct 2026 16:29:39 -0600
Subject: [PATCH v4 5/7] dmaengine: dw: drain the tasklet before releasing
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
Message-Id: <20261029-submit-dw-dma-synchronize-v1-v4-5-fea447d9f285@gmail.com>
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
 James Hilliard <james.hilliard1@gmail.com>, stable@vger.kernel.org
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
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/dma/dw/core.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/dma/dw/core.c b/drivers/dma/dw/core.c
index 1d6419e1cd3c..3bda85adbeee 100644
--- a/drivers/dma/dw/core.c
+++ b/drivers/dma/dw/core.c
@@ -398,6 +398,10 @@ static void dw_dma_tasklet(struct tasklet_struct *t)
 	u32 status_err;
 	unsigned int i;
 
+	/* Channel release may have drained a polled completion before this run. */
+	if (!dw->in_use)
+		return;
+
 	status_xfer = dma_readl(dw, RAW.XFER);
 	status_err = dma_readl(dw, RAW.ERROR);
 
@@ -1067,6 +1071,8 @@ static void dwc_free_chan_resources(struct dma_chan *chan)
 	struct dw_dma		*dw = to_dw_dma(chan->device);
 	unsigned long		flags;
 
+	tasklet_disable(&dw->tasklet);
+
 	dev_dbg(chan2dev(chan), "%s: descs allocated=%u\n", __func__,
 			dwc->descs_allocated);
 
@@ -1092,6 +1098,8 @@ static void dwc_free_chan_resources(struct dma_chan *chan)
 	if (!dw->in_use)
 		do_dw_dma_off(dw);
 
+	tasklet_enable(&dw->tasklet);
+
 	dev_vdbg(chan2dev(chan), "%s: done\n", __func__);
 }
 

-- 
2.53.0

