Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792528161;
	b=y4r+DuewGxUSfMfhzR0H2W/vnt43+r+TvoFcILwd1OCNUhu5It3YmwTlgoiwIzcN/4xk
	 IFwB+vnoJZkBOcQkTpVbDj7LpHvmGft/FLJ0YS+CyipN0AdkaXSgz2n1oVJfu0EyghiEX
	 BM9JzmavO0ayHmw7EoDhiwVPWV8ofcW9xmuPSfLQQiJ463OZP8c59P1RkMimB06Tv9zlU
	 ZY/XwmTf1rZ1EW+j5XQMy07vIctPM+G3OO9x11qdKXR0KWR9wa9U3IMJ0WgWdU65RB882
	 FBPn5yBWY1YS0YhIwwYaoybKda0pTmXiMe7v0axyoXfyhtteKrQhTZDy/Z+eFc3r31A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792528161;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=V6L8IJssLFGh2DkVvUNXp3YRELoRcMsg2OWBMxI6lEQ=;
	b=xhH42ayVDv3jt6KftR2Wpxhw9+VmsLu0t30MAfbisG55FTsBjApfjQ/17VqoDzuXpt1M
	 AwDs0GavL8titJRkiRcpBIoCWfdDDdQg+vTCgqaLphAjt5HprxhbfpLoaU3tWBUDLtmTZ
	 xehBjZhnt74bODLNT7r5/raQJllf/zvz7SsyqVXm8X7l0IWuSvGXnPpPY90e7wI0v0ozG
	 35Bem1P62dhr4hKj/nVqcNbxb6UHXA9sISylDGDGfweC/BgjOG4lwJ25iUu6S5ZUkqjRC
	 MQnWziwIieA+xCzVI/Csse/gQ4Nm+4jR3MEK1k1UMcBV2rbPHg0e+fQbCIm56RgsrJA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=HzDfSyjU;
	arc=none smtp.remote-ip=209.85.128.42
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BF39606A31B
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 20:29:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7BF39606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=HzDfSyjU
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4a1d2ec9aadso3515e9.1
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 13:29:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792528159; x=1793132959; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=V6L8IJssLFGh2DkVvUNXp3YRELoRcMsg2OWBMxI6lEQ=;
        b=HzDfSyjUxpCF5oKd7tPhPgvjWBwQSySht2EDa8laW4ycSImd+4voevTEazzhUa1pwV
         lDziNmQo6kYwSNFc5YGca5nKkALN13XlLn9jna3OgUojXY7AvOPVMqUPQPi85FBPAW6V
         uvoFANgV5X4Y1LyEzKOHPZbm+Fv+UgFazxmA1Uqy3/offXu3TKhiX5UMNCHj2zctOVi6
         5+EE+0+bCc8n3CEF3oErA6Ys7mYijsAb1GmPLhwO/Y8OvOIUJ32Erk9Nviv89d3bacC+
         R10VR3SlyR1XrFqlowRXzT34ie5xc7D0jap37J+Nu//FV5hHBSBYDR5Hotf/6dOTiu5K
         VYbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792528159; x=1793132959;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=V6L8IJssLFGh2DkVvUNXp3YRELoRcMsg2OWBMxI6lEQ=;
        b=NCi15JOi3a14h8FMjSgvygrONiv+sX2m1NiqAsSUgHe3ouztMQ0T99McE7OxfSqCG4
         SY6xDBCiZaPelUUoljuKC2F3EYfJvBHDpVt48Xw/IpzinhCTKWp96/3acF1c0+w9WQeg
         uwRA/km6vaxc4/dN5hiKbIzzj4tlgLjO8fy01UYCOgA3WeXcmOfNwZ6aDByqxWUdVzGA
         ylBri0vBfMn0SUhb0/6TkyjUsn/WXcbkW+C5KawsbflcANG6omaAgvKsIuNg7Huu5q3q
         rnv/jaoKtnlJSLwf/4EP+BAoYsTGKom6W/SOkfbP4VjsxlyKi/0B1ejXKY0cudiVNU8p
         RrKg==
X-Gm-Message-State: AFq9FYI/yw08h14cOAtq/3v/QrhXzJVHeqr2FZpbVBj8hjl+FZ5teMMA
	+pc9GNyq2w8DY8/lphOC6Rzm4A5iskD5197pw19XgepJV1oxv0C9o0AZwCRncZTMYA==
X-Gm-Gg: AYBFou1WVQSCdNoync+b5Qv1Yh+IXXd3Gttb0TGbH8fXnMAexwM2M5S4paySEIXgr2a
	PT8xw28errif2a1AExQO+tDgGe4Ex1GfMBCwZc/+3MtPoBgjFcMI0DGAdBm59IWL/BLlA3B5SFQ
	AOzx+TpPHy5Hc1dBHeTAOmJJ1j8cRaUzrhMIcC/uHahp20xQ52tATdtWC9xe4RrK472NIBfRZM7
	DZ19/heI/7H3py6S2ZDLwKSJrYn56JQg9sq74VK9YrenVty+wA/XgVCXcIxfmkI7tqobKXzxgRM
	nGgJcHdRkxOirCpOJZsZHvDj1M3qD5xuBJ/vr/RY0RLPZVub/c8fKdZvUIg0M/WL/ZHEmYa+s0w
	4SGi2RX5dXI9u/nOzVyY6WhPUO8O0GXwNBaGETQRufP3uarhUGoscY7OUZMQGdpdrUwztP6zLcN
	B+3FBwguS62XGC5OLlceRlJ9axn2CX/XoAXv57SrM05VpB4pVo8THaEi2QrFGLEMNXeLTcoWqUn
	bboolvhfrpNqp/F08/vBWf+0ywlr5XqRj0H54gM
X-Received: by 2002:a05:600c:c11b:b0:49e:65b0:7b7c with SMTP id 5b1f17b1804b1-4a1f598638amr1043095e9.7.1792528158429;
        Tue, 20 Oct 2026 13:29:18 -0700 (PDT)
Received: from google.com (250.192.189.35.bc.googleusercontent.com. [35.189.192.250])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e2581f0e2sm644857f8f.15.2026.10.20.13.29.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 13:29:16 -0700 (PDT)
Date: Tue, 20 Oct 2026 20:29:12 +0000
From: Mostafa Saleh <smostafa@google.com>
To: Frank Li <Frank.li@oss.nxp.com>
Cc: linux-kernel@vger.kernel.org, dmaengine@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, vkoul@kernel.org,
	Frank.Li@kernel.org, bartosz.golaszewski@oss.qualcomm.com,
	pramod.gurav@linaro.org, andy.gross@linaro.org
Subject: Re: [PATCH 1/2] dmaengine: qcom: bam_dma: Take a PM ref at remove()
Message-ID: <atfPGHuujGny2dVo@google.com>
References: <20261020180804.140766-1-smostafa@google.com>
 <20261020180804.140766-2-smostafa@google.com>
 <ate3QoD2ESDtB9wq@SMW015318>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ate3QoD2ESDtB9wq@SMW015318>

On Tue, Oct 20, 2026 at 01:47:30PM -0500, Frank Li wrote:
> On Tue, Oct 20, 2026 at 06:08:02PM +0000, Mostafa Saleh wrote:
> > [You don't often get email from smostafa@google.com. Learn why this is important at https://aka.ms/LearnAboutSenderIdentification ]
> >
> > bam_dma_remove() calls pm_runtime_dont_use_autosuspend() and
> > pm_runtime_force_suspend(), which on a BAM with its own clock disables
> > bam_clk, and only then writes BAM_IRQ_SRCS_MSK_EE and terminates the
> > channels, touching registers of a block whose clock has just been
> > removed, causing the board to reset.
> >
> > Sashiko(Locally) also reports, it then calls clk_disable_unprepare()
> > on a clock that runtime suspend already disabled, which can trigger
> > "already disabled" warning in clk_core_disable().
> >
> > Hold a runtime PM reference across the register accesses and the
> > channel teardown. Once the hardware is quiet, disable runtime PM with
> > the device still active and drop the clock exactly once, balancing the
> > clk_prepare_enable() in probe.
> >
> > Fixes: 7d2545599f5b ("dmaengine: qcom-bam-dma: Add pm_runtime support")
> > Signed-off-by: Mostafa Saleh <smostafa@google.com>
> > ---
> >  drivers/dma/qcom/bam_dma.c | 7 ++++---
> >  1 file changed, 4 insertions(+), 3 deletions(-)
> >
> > diff --git a/drivers/dma/qcom/bam_dma.c b/drivers/dma/qcom/bam_dma.c
> > index f67a93a37d48..bd583f78e0c1 100644
> > --- a/drivers/dma/qcom/bam_dma.c
> > +++ b/drivers/dma/qcom/bam_dma.c
> > @@ -1403,12 +1403,10 @@ static void bam_dma_remove(struct platform_device *pdev)
> >         struct bam_device *bdev = platform_get_drvdata(pdev);
> >         u32 i;
> >
> > -       pm_runtime_dont_use_autosuspend(&pdev->dev);
> > -       pm_runtime_force_suspend(&pdev->dev);
> > -
> >         of_dma_controller_free(pdev->dev.of_node);
> >         dma_async_device_unregister(&bdev->common);
> >
> > +       pm_runtime_get_sync(&pdev->dev);
> >         /* mask all interrupts for this execution environment */
> >         writel_relaxed(0, bam_addr(bdev, 0,  BAM_IRQ_SRCS_MSK_EE));
> >
> > @@ -1428,6 +1426,9 @@ static void bam_dma_remove(struct platform_device *pdev)
> >
> >         tasklet_kill(&bdev->task);
> >
> > +       pm_runtime_dont_use_autosuspend(&pdev->dev);
> 
> After
> 
> commit d1706f9da9f40dffe8621cc0ee03b847f41f1d6d
> Author: Joshua Crofts <joshua.crofts1@gmail.com>
> Date:   Sat Sep 19 10:24:28 2026 +0200
> 
>     PM: runtime: call pm_runtime_dont_use_autosuspend() on reinit()
> 
>     Add a pm_runtime_dont_use_autosuspend() call to pm_runtime_reinit() to
>     ensure autosuspend is disabled on driver teardown.
> 
>     Suggested-by: Frank Li <Frank.Li@nxp.com>
>     Signed-off-by: Joshua Crofts <joshua.crofts1@gmail.com>
>     Link: https://patch.msgid.link/20260919-move-dont-use-autosuspend-v1-1-f6e2d1315c23@gmail.com
>     Signed-off-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
> 
> 
> Needn't call pm_runtime_dont_use_autosuspend()

I see, thanks for pointing that out, I will remove it in v2.

> 
> 
> > +       pm_runtime_disable(&pdev->dev);
> 
> Can you use devm_pm_*() call to fix this problem.

AFAICT, in that case we need to gate the clk_disable_unprepare()
in remove() as the suspend() also runs after remove(), so
clk_disable() would be called twice.

The problem seems to be bam_dma_runtime_resume/suspend() calling
clk_enable/disable() but also remove() calls disable(), so something
as:

--- a/drivers/dma/qcom/bam_dma.c
+++ b/drivers/dma/qcom/bam_dma.c
@@ -1379,7 +1379,7 @@ static int bam_dma_probe(struct platform_device *pdev)
        pm_runtime_use_autosuspend(&pdev->dev);
        pm_runtime_mark_last_busy(&pdev->dev);
        pm_runtime_set_active(&pdev->dev);
-       pm_runtime_enable(&pdev->dev);
+       devm_pm_runtime_enable(&pdev->dev);
 
        return 0;
 
@@ -1433,9 +1433,10 @@ static void bam_dma_remove(struct platform_device *pdev)
 
        tasklet_kill(&bdev->task);
 
-       pm_runtime_disable(&pdev->dev);
        pm_runtime_put_noidle(&pdev->dev);
+#ifndef CONFIG_PM
        clk_disable_unprepare(bdev->bamclk);
+#endif
 }
 
 static int __maybe_unused bam_dma_runtime_suspend(struct device *dev)


I can see example for both patterns in tree. However, 2) seems to
be more common:
1) Gating CONFIG_PM: drivers/mailbox/mtk-cmdq-mailbox.c
2) Get/disable/put_noidle then clk_disable(): drivers/mmc/host/sdhci-msm.c

Thanks,
Mostafa
> 
> Frank
> > +       pm_runtime_put_noidle(&pdev->dev);
> >         clk_disable_unprepare(bdev->bamclk);
> >  }
> >
> > --
> > 2.56.0.212.g129ede20d9-goog
> >
