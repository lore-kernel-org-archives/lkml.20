Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.216.41
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794851353;
	b=wgr8a+vAahKJfyI9xqWmSwVjc4LVWKxKTmvmfiPMmEq76HSH/JrkctcBOVZfACmvSCf7
	 youJ+R6ab9Z3T6ceAXh3DYWLDlsEE47JzP/7QwCDFvIr9R125/7/Vo1UumqRz5T9p+jvk
	 SviWXQpTJfx6Rtp/3E4UUMmc3GQrywP2dxz3UvOcbgr/G6hGZ+AvU/txPzAVSioYxCzzu
	 2zdhhu1elLu42tA9cb5Qm+Bhj30PcaHlR9pyGYfnIwLpWfIe07BwcBHVsDTpih0ji/Cg9
	 PZfnPW7/dfVc4s+rUAR0z0MHwk8axH4gtpoObOiec4ctwV/FhPtJ+gAVVcHJgnY2HsQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794851353;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=k8eRcybjrdDMglrYGKeBlpIcbBQ3QdhJtvgYlBD8b+U=;
	b=kX9jGWI0pwMJj8jbin1X7JwQxmumatlF3HWMsVldpcqn9/o8k3qZmXLlppFtNT/oiUiG
	 TCJ8fbRkq7k+eNdbHZjz9lCVI0yPWBsQguFqkPb13h7GTSMKIh/IZ8Nupu3PVyrS//Ff7
	 8hMNa7ZKdKB+URI87ciQZd8GeuFxB9v5KtHXjQ4Lnhs0LTxfhtyHLazMq/7T3gJShS0di
	 WJbguVx+KqoICiYEy4YUvxN3scBIorxnE0nbIAlTqHshPSZu+swMD+NZvsCUnSjxoVsF5
	 BkBWEJ1uK2m3D9r79E7AG+wHlYIpMsjPHcBP+lvowBBh+gww8JqCnm+0sKhINXF1TAA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gU4scvE5;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.216.41
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82DD0606A334
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 17:49:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 82DD0606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gU4scvE5
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-3b1535be329so2786728a91.3
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 09:49:12 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794851352; cv=none;
        d=google.com; s=arc-20260327;
        b=l423UJvuQ3fmZZGbS1PdfGzyB48JUhWsAW6RsohZJUviYyzcc2RY+4llbOftKja24O
         LW+wOvoIScwbvXK8nfKXeq1HTCJxPU/bTXdJnfI9aBr6IWkF2lJapRRfJr+m4rikqcCk
         RQro6nPwGOQRWoUCn8wiZGcH49bvnzExkFKtk2ELZLF8GOXYLh+mBtxqJUnWEhkTIyo8
         tj1so6eD8NcqfzjtMjwfkYzsNIO0rpKt3njVa+r0G2lBd2FzMUVV7V4DvNRvbO74u9SX
         CEzt3UVXtSdfuJ3CAtFDjbBODGtGNXdwYnkPO8PQ1ctoUlQDqAEU9jyyS7MAHmWLqF0d
         cvqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=k8eRcybjrdDMglrYGKeBlpIcbBQ3QdhJtvgYlBD8b+U=;
        fh=tBLLzTY7TP+YmqBK+XNzMQN6H9I1X1vEs9dIPYqR610=;
        b=ncMXn3ejT19Xj4eg09iROM3v2XuF7yvzDhrrgLa5gMp8+jdpv9otsETV8sz/dRRvfw
         /h+tFVdrAUhackUTVFz7boPNWihjTczMbBSy981zuwhgycjTwWRKdVFhQbqWVoycB7Oy
         o3mRG1SIRhSJBLXDaMvVdf7lx1BG+QvgMpFqUU5lLqScL6DAHaIOrZcBv2kFBQU64N8b
         ET2h2niyLtF1Zs7X5y4pI1rFDBAwIkH05KCIHggbitTX7P0HcPhKKepFu4OLLuxO9rxx
         slEoadYtis3zvlvn0rkJuTyHxAVCri+dIzq8hdl6TTozb9Y/R7UhsiaM5bh6MtcrSNsh
         xUwQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794851352; x=1795456152; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=k8eRcybjrdDMglrYGKeBlpIcbBQ3QdhJtvgYlBD8b+U=;
        b=gU4scvE5tqrBconnBUEpPW4QB8gCOBLAI02bJ2DRkIFpNrj+RGHcFZpMivuaL6Ndl1
         XV/w9xehKGtyQw38SsTVf6wqdNzZK5tlfu+6h/SzJmFWr+wmPLKQYtrzqDgJxtt6fKpT
         FCuFmMlVIaS2NOt4SqYpU3A1gc5bTP02tROTPAiwgaZdyp+Wh1RZAoPdS4G4d7uc6k7s
         mq/1uYqEJDpbqSCOffuP8LhDfz63UBlfLKj8Z6SaAOsEgRlrMwJxIDIvPL80fWSzVnOY
         rA/LRN1qmiod4GHpGbBvesdzFRLa3F3DDsUoCrMC1Mx8g3d/foNhG/OAWW3FalQJncJN
         RRhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794851352; x=1795456152;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=k8eRcybjrdDMglrYGKeBlpIcbBQ3QdhJtvgYlBD8b+U=;
        b=bAKI3HZUs9NCcYi12/GONHra2ncDvKHY10VWCTz6B+6ii8/8sOGGmrQblg3vdOTYGf
         S+LzuctY5EbxRp+wugRLSHqI2iwfWGnHtRoDGBUNwz9I05ReQ5BHBHqqd8yNmv6EgAvy
         cWTNcmSaJCkMthXSAITERPEiF4Z1DDts8VOznox9wJwF8kFCtE+I2RFmuSlxO6aCHpOj
         WbbkDWT97ah2jctWJVU/YEj3zpbnw776JpWA7U78xwREtvg182+EPX/QwFd5SXj/G1oy
         QOAx6Js7iFiimN+KOEn5AoLBJ0ZjcvHA8ah9PkMTp5MPMQuA2/HBKbz0jIUd4+K6djt/
         Lz6A==
X-Forwarded-Encrypted: i=1; AL+hErHJZjG+BAp66mm6Q9IRhbp2Rpw1gKxinbC3Ky2cDuKzcu6olS3WGfDNfEapwyl1ik2tqaqVwNAk7wmonJ8=@vger.kernel.org
X-Gm-Message-State: APuU4Z+KdmQCrmogQ6I1lFYSt9VinXO3Cj/dR7zgS7huwk3uttHJbbSO
	aSVoGoEUX00izSxl50X2o9eKSTDlOfRpUpVilRapjn2xLbVzepBB1L7zTppcspUiA+JVs+qc7JX
	7l42aA1sW2YBjqsO9LQnaPPtoTJka3z8=
X-Gm-Gg: AZFdTZciTUY20ecVSzTx7dcVSTASbhnS/xuCwFExr0RvtOBv35cMf8WYexA1hgfWiWz
	1Chxz7UzQbP3LvgMMy9f5sByIPv8KC8TKIx2ybbrEaVyD1S+KPo8XcytHQcOQvNImUv4WwkpXgU
	RuQrRfBE34Offf9iWVHXQn3xpDj3sw1vxKb23UuMq2lddtGW7CKabWvHcQseiK7yEO264EYZ940
	V8IE3w/8fEG0z7oO2uyENlI6knx+BtVn/LjWKYYTZSlmDs1X2LNRO8DmL0M72MD/pTvdF1kqosb
	IeBhOuY0PFh9S21OAhFk7/KyHnnilNneEvDvwbPpiQzpcO94ye+XB933/erkv4pmp4WTYPsQCU3
	AQh/ToN5D9EzxXpdd0E1lhP05PeBW1LwKKMVaXYI2p5Gu2l4wrq+ZEUqr2LBHwoqUYEE3jc6Fzq
	GmkDz9890ikhLcyFgQ
X-Received: by 2002:a17:90a:c88b:b0:3ac:8741:e2e4 with SMTP id
 98e67ed59e1d1-3b1b0a4e341mr10606541a91.52.1794851351473; Mon, 16 Nov 2026
 09:49:11 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261011202406.1869441-1-mhun512@gmail.com>
In-Reply-To: <20261011202406.1869441-1-mhun512@gmail.com>
From: Allen <allen.lkml@gmail.com>
Date: Mon, 16 Nov 2026 10:48:59 -0700
X-Gm-Features: AclHuK_Kl0DspNDrEKp-YEz0pV4NOcqF_Nq6hbXh0I_C-bUeC2RYqKCw6K1g_1I
Message-ID: <CAOMdWSJ8Wejc5+k0c1zKV1L+97GtDrW2xh4TF2+sMVqUYaUiWQ@mail.gmail.com>
Subject: Re: [PATCH] dmaengine: mmp_tdma: Release IRQs before channel tasklets
 and storage
To: Myeonghun Pak <mhun512@gmail.com>
Cc: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>, dmaengine@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Ijae Kim <ae878000@gmail.com>
Content-Type: text/plain; charset="UTF-8"

> The shared IRQ is requested before the channels are initialized and
> released after their storage is freed. Its handler can therefore
> dereference NULL pointers or freed channel state. Pending tasklets can
> also outlive the channels.
>
> Initialize both channels before requesting the shared IRQ and add managed
> tasklet cleanup for each channel. This releases IRQs before draining each
> tasklet and freeing its channel storage.
>
> This issue was found by static analysis.
>
> Fixes: c6da0ba8dfc8 ("dmaengine: mmp_tdma: add mmp tdma support")
> Assisted-by: LLM
> Co-developed-by: Ijae Kim <ae878000@gmail.com>
> Signed-off-by: Ijae Kim <ae878000@gmail.com>
> Signed-off-by: Myeonghun Pak <mhun512@gmail.com>
> ---
> Compile-tested with GCC, W=1 (arm). No runtime testing.
>
> This fix overlaps with Allen Pais's DMAengine BH v3 conversion. If that
> series lands first, the cleanup should use dmaengine_kill_bh().
> Link: https://lore.kernel.org/r/3cd07c8bcab908e352bf1570fb7a3c24cc0fe516.1786384168.git.allen.lkml@gmail.com/
>

Reviewed-by: Allen Pais <allen.lkml@gmail.com>

Thanks.
>  drivers/dma/mmp_tdma.c | 28 ++++++++++++++++++++--------
>  1 file changed, 20 insertions(+), 8 deletions(-)
>
> diff --git a/drivers/dma/mmp_tdma.c b/drivers/dma/mmp_tdma.c
> index ba03321..965cdd6 100644
> --- a/drivers/dma/mmp_tdma.c
> +++ b/drivers/dma/mmp_tdma.c
> @@ -353,6 +353,13 @@ static void dma_do_tasklet(struct tasklet_struct *t)
>         dmaengine_desc_get_callback_invoke(&tdmac->desc, NULL);
>  }
>
> +static void mmp_tdma_kill_tasklet(void *data)
> +{
> +       struct mmp_tdma_chan *tdmac = data;
> +
> +       tasklet_kill(&tdmac->tasklet);
> +}
> +
>  static void mmp_tdma_free_descriptor(struct mmp_tdma_chan *tdmac)
>  {
>         struct gen_pool *gpool;
> @@ -562,6 +569,7 @@ static int mmp_tdma_chan_init(struct mmp_tdma_device *tdev,
>                                         int type, struct gen_pool *pool)
>  {
>         struct mmp_tdma_chan *tdmac;
> +       int ret;
>
>         if (idx >= TDMA_CHANNEL_NUM) {
>                 dev_err(tdev->dev, "too many channels for device!\n");
> @@ -584,6 +592,9 @@ static int mmp_tdma_chan_init(struct mmp_tdma_device *tdev,
>         tdmac->status = DMA_COMPLETE;
>         tdev->tdmac[tdmac->idx] = tdmac;
>         tasklet_setup(&tdmac->tasklet, dma_do_tasklet);
> +       ret = devm_add_action_or_reset(tdev->dev, mmp_tdma_kill_tasklet, tdmac);
> +       if (ret)
> +               return ret;
>
>         /* add the channel to tdma_chan list */
>         list_add_tail(&tdmac->chan.device_node,
> @@ -666,14 +677,6 @@ static int mmp_tdma_probe(struct platform_device *pdev)
>                 return -ENOMEM;
>         }
>
> -       if (irq_num != chan_num) {
> -               irq = platform_get_irq(pdev, 0);
> -               ret = devm_request_irq(&pdev->dev, irq,
> -                       mmp_tdma_int_handler, IRQF_SHARED, "tdma", tdev);
> -               if (ret)
> -                       return ret;
> -       }
> -
>         /* initialize channel parameters */
>         for (i = 0; i < chan_num; i++) {
>                 irq = (irq_num != chan_num) ? 0 : platform_get_irq(pdev, i);
> @@ -682,6 +685,15 @@ static int mmp_tdma_probe(struct platform_device *pdev)
>                         return ret;
>         }
>
> +       /* Release the shared IRQ before draining and freeing the channels. */
> +       if (irq_num != chan_num) {
> +               irq = platform_get_irq(pdev, 0);
> +               ret = devm_request_irq(&pdev->dev, irq, mmp_tdma_int_handler,
> +                                      IRQF_SHARED, "tdma", tdev);
> +               if (ret)
> +                       return ret;
> +       }
> +
>         dma_cap_set(DMA_SLAVE, tdev->device.cap_mask);
>         dma_cap_set(DMA_CYCLIC, tdev->device.cap_mask);
>         tdev->device.dev = &pdev->dev;



-- 
       - Allen
