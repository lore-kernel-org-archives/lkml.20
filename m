Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793648069;
	b=Oa5tc4BuW/f9TVKDLeCv4W2ePmNAxpbR9TEFTEsryWLRfa2HsHeWu0UuYaZF325tI2I6
	 MN6GMhJMvfUeZUW/JTLdiw/u+sgkzlJMr+/V722wEn6OsGmSq01bW8hnbCaLpZklS0Qph
	 ncYV6KFXsGBZ8cuqVcy6oGfJj05iw7QpAR/FWZXJTD/Zp3h3RDHBR40FnekYS298xvlhi
	 MrBY5buy3bI6t0d8QKSg+kOFu+D0XymmHwn6qtMuVAUHSOY96ZQKOHi2tazo66p2EF4WH
	 +Jl6TamwUoYSttnHAqgF7gm5uYzeWsRyNVqx5j50tWerGe1oiMeTcu5WG9rWnTkFQag==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793648069;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=E7gBCzFYvmg/wm0ZG+Fa6cYfj054waIZVNwZet2Fyzo=;
	b=ttxdu8wNEIJIp+a900pQhEDYJT40njy/yryHVajq0APJvxlcOvJfdQAKkq5mi/MKCmzr
	 HXhi3+9DLRtAsKe9W8x0DBAmOO18/UOWF2IVz7vHw3LIRgFPPJ9+rND51XGc2zkectnMH
	 t11VJ6j3T0w6R0otk/BfHDAcvO0rzoR2Phtj0eILNfktZRXMUBnzdJbZi1q3zaTeQyb96
	 FFbeeo7AYhxqtLl5VyAziH8k3L6i1qntVceMpRj8eDVyAAEcCxfunrkihhk5ljFiAF4LL
	 W6IJtCEuEr7cod7UZM7T5Dp9vSO93bGHUGkg52+lYJra0dzX3cE0JOY0o6hwt9VqFGw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XxQzlu+B;
	arc=none smtp.remote-ip=209.85.160.49
Received: from mail-oa1-f49.google.com (mail-oa1-f49.google.com [209.85.160.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BC8C6082BD4
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 19:34:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0BC8C6082BD4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XxQzlu+B
Received: by mail-oa1-f49.google.com with SMTP id 586e51a60fabf-486f013db83so859105fac.0
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 11:34:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793648068; x=1794252868; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=E7gBCzFYvmg/wm0ZG+Fa6cYfj054waIZVNwZet2Fyzo=;
        b=XxQzlu+BSk1rbUr3fSK3jJwHiSV/vHO2sI9CexZymuWrVQVZFQ5EgJ8lB+oxsZ5mYI
         gF4lxzQn6U4UwVH6JjmVsogo/vmycOgclfKwkcy7lJZ6uvB64287SHnhG/a1mAxBKW8e
         eTjFzmR0CMhp8EtpV7ENV2FNhhlltgGPghxnOcxxQrXs/h+YFYLCljA2Awr/OA7ZxT82
         OcpOFy+Iyv3HB5m41M2hP6xB8cpbWoO0dVTGBE2D5tk/RXRACcgrkbcVZ2Vb8qLQCI5H
         Y+5NnRzZfU028nkHnxKO0pre5/Gq/AovnbqE9i4+F7w1YSKc6Beh+0VKrJWiXNAimo2L
         LHhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793648068; x=1794252868;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=E7gBCzFYvmg/wm0ZG+Fa6cYfj054waIZVNwZet2Fyzo=;
        b=QolwHJceZ8Ynpcis+HbXgo+skFkVeuzgT7OHt/v62p1CC3G6aTZ+iskDsU4YdeUKQs
         qB7n+qhg4k7YJZyrg7yurYsUd4HkQ75aHdyiKdHEFDudpSzrhnZrcVDr6zIgaCDSIKdk
         lTSPXMFJd9SdTffv4Nx9qs2tVS4WpsCFpCidnFR7Af2maCl3LLRzYXb4Gkosvv7g6PQ1
         W6TbitrD/M0KZxoPtUyZSAHOHxhO44xLGDYmr/JauodEEFsIOYPHauGwvEilL+YpzdSa
         5ybRvW93WqguJqyLJAC911ZcV5Sjvr7uX2r94gkWofWrdM3DqiOVMf/xNz9Hx5BTr2iK
         911A==
X-Forwarded-Encrypted: i=1; AKwUvBzE5qTNZeXd+OYmrtWVD925ZCAQ5ms+VJahF/UH2UAmyy64yYeZpKiR2yCPr1SdndXVHOqVaRP7JNKbEmw=@vger.kernel.org
X-Gm-Message-State: AFq9FYLYx/ORm5S033rM6R5kF559bm2jtx/mJleaUNAAigezt78eFS4+
	hJVxwS5nqZDf6/IMfuhAEewlHKapNi0BNhg0PQGSojiehxZkXNEm7QVG
X-Gm-Gg: AYBFou2x3gKtwknAHsupB3JacbD0m+dKQLTXj8dTL+8N4e2OKq/PmhNYBrbFpiYA6i8
	ATOJQUebM+LAaIkOsw4bR0FmRvTyBd9qJJQjhaJjuTBd8bdiZVnAs0MxbWF8TnWXoRs2j41VP/s
	X/7IEH0XPaTBgr5L2VKDOuPiEbSw0io14bOkhSH7FnXmUTzKNQML7Vpmac8ERMT5Mt7n0j/PvqR
	+XVzNI5ANGw6uoZrS5PR2U0g2w66IfkR2hLYksY8Dzp9WOajFQQe32v6tDCE6I4mF0yCY3bsS2Q
	Gn5olEUws5R2YvT8y4Yj9hKyuwme2asxBQl98o78H4kJLR+2ux/VCMsjSQdztZoc00jgXHwa/UX
	lqgv6NUfFViQU8enE5+5MnwIcypptdUx2P+9s60uH7slk0U2x8SCynk+pAb/lQUBI9t9JNYgqdJ
	zo5JRlMI4VGItpfwOmusi4tNCn8VRBl2NdcjciI/SXc1zTzhy/FTCf7QpZA65uJFDHqvu0umnlq
	0SWzuCO8DQZI/dDPf5vCgVSqJP93iPb+k+nhVEm1/V8t/8n/rDfIEvFsLbgKV/KB5Ic6mUMLyZ+
	Hosc8hZDEru4ku2Rm2jVowr666hjKi/5T47FFx4V3fgYUNg1VLECGGkflLWZ+yCSw3k+r5N2toY
	m3YXBdm7MeXbLVtqNK/6pyLinPET/77s4uM91GMBHLu1JV1Y+6p85wNU94VgkGQp1xCA2H9/96T
	gDHBGMTWpFsfwYr8CyUJhR+N2DgkBwAk82nfVJE430mj/ykHCzZ/s=
X-Received: by 2002:a05:6808:f13:b0:4e4:627a:e094 with SMTP id 5614622812f47-5640dc2c8a7mr7309751b6e.11.1793648067810;
        Mon, 02 Nov 2026 11:34:27 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-5640fd93451sm8558249b6e.3.2026.11.02.11.34.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 11:34:27 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Mon, 02 Nov 2026 12:34:20 -0700
Subject: [PATCH v5 08/10] dmaengine: dw: drain the tasklet before releasing
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
Message-Id: <20261102-submit-dw-dma-synchronize-v1-v5-8-d3207758fbf9@gmail.com>
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
index 0fd49ff9257f..339ca85952fa 100644
--- a/drivers/dma/dw/core.c
+++ b/drivers/dma/dw/core.c
@@ -393,6 +393,10 @@ static void dw_dma_tasklet(struct tasklet_struct *t)
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

