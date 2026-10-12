Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1FAD3546F4
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 01:36:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791769001; cv=pass; b=GBHNJCZOv/KC157A3PHqjeYrqaxnhFGZvfo1LbGveXxJEm0DScmCWGgCW1E6c95bG2N7dJiSj+ejRcwLAs3G5kYxJKS8at/yql0xyiO99IREh5LSxrcwaV+Oc2BgNGUy/+vUaHlIoUn+c9KXjPigOe+5Jna3rv0Ne3MJ6T2AHJE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791769001; c=relaxed/simple;
	bh=k7cEPBY0M9HJpO8NZ1kFN/9ydut0XOF0A6dmljcEM08=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jd7obUxQSxeGzOKav98D2Yv4CxEo3aeISAbYY2VKqIffGKv1XZiDpccMaepxgB8TrF2BsCCpxesW0zKALK1nheD2MbCcMXKOYIbAfd9sXlq3a4R2q2MutqqznFIXVqT4M/d57Pz9bmKkYQgO8FQ688U/TG8/LYtkLsYq78Ez3TY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KU165k99; arc=pass smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KU165k99"
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-6b1a86c0316so1079845a12.0
        for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 18:36:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791768998; cv=none;
        d=google.com; s=arc-20260327;
        b=ghM/3p8lc+JsULJ23tU8Hvf2HaxSkRBlL+LlP47mvWCSXP3BSlk3ORdaGKAxrjPaP7
         0v9SH+D9VMIaZBkFl577ANhN/luY5VVGH5PoblLMc+xnrU+X3z6kh2tJgAZbXtm+Lo+z
         uTm2Hyc7FCSO9s4pJkjdB6suP7RdOw2LvPJxXsuH4TavjIR2pSqax71uVmP59T0pmRY9
         GAiofIOWFZZeAqAt3hnx1UpMaHn4Gb369LSV8cUpqgTrnr7R2e6zdxwBCkqwJL1sQhNL
         SQsncbfJuFrsozn0e5DYjP3PSTqsXz1z8NqIVpTw+CMtaO88ZxKUjeVMCcE732GiNH0T
         dB5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=5SdnfbVL9pFpAWd31O9CWnKNvkrdORI7jh1LOwMsM0M=;
        fh=Ce3c8AKIB5wx3HvhczjF8ZMUBOEbyMuedR1wFEGqHWs=;
        b=TbbwsXbRJU+Ed+/lRentTsMU2RHHb+FcMC2KwEru7Rr+eitIZEf/v0KJ9Sjndcajgl
         +FxfqfEhHqV0dzGaiv6fwijNV0tBuqKdXkPNqMQKus8UEttZ8PXETFsJXFasRqHFxFKX
         9wF8UfcUxooZcu41a23S/GvXJb4B3g0oK91FjaHsL/SEG4Po3zlbO3bDoV6SAmBhfoTQ
         uhXssdStwQN9FF0+eXAwPI88fZtvU1jzSBIlAQ1WN12KKRB+riwSox2Wa+WTwz4M11Co
         sTQZTNqgzv5yM+z1/qpRIp1tMtzA8zr18VhFK28dF7rAMUwjYw3GJZZhk72Pukee7/Pg
         bLhw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791768998; x=1792373798; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=5SdnfbVL9pFpAWd31O9CWnKNvkrdORI7jh1LOwMsM0M=;
        b=KU165k99OY9xFXdhIcC1vkwr3LFa3mk4ke6QWisDv8FHDeSc2gJLV67Nrlqyzc3U9L
         YgRkJDnldo7/gEjn+hCaDqH1za+JZ26R5U6+obcZ3EQ3FHcGkyuPR/6UThv329g8zGUR
         N0VWXMOPSsuIpvu4UnBgTHPJWDFadPlU1o0wcXvR2LNKtaOvvcP3GWKJlOorkGthfL+m
         LenyqYET+puiFs76+rmTxwYjkYsNI5yJ72vH+S1oEk/o7eG6tAf6gxX5MuFsCKKMdi0P
         AxrfbGBYftMbwouWGQFR4H4AUMwaqpVEhL1gFcoLzP4onT/UUC50lTHnq5KeSGYoE0ox
         EJDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791768998; x=1792373798;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5SdnfbVL9pFpAWd31O9CWnKNvkrdORI7jh1LOwMsM0M=;
        b=htDDRgAvc4s5wsXYK3WOCjCYKJOMfcpOxnpDD+IbIjwQ38BGmH/TiRLrS0HO/t8M4f
         nN40d/lv7KaAIPRTOUfmhP2ffve1rp+KLvdxGQJAYB284fUJNfTmV3gf4XT1O1ZNomUQ
         0NAc6joRFH93nh5V0qqUnPUjCD1yMR1dc4EW//GEJveXBXTJCMogtnnJjfkzYWFvUzFl
         sPAUjO2lvxikgfV3/Ymr5/E/uMjxRQ2sswm3lRrqJZS+pMVJLH31eWyw6QcZHcnJcM3n
         bB30PvuUKwI5CHiT4ou7nee7u324jWBmioTfW69jLLfC7Flgv7YVLFPRouu4S0V0OpcB
         wJig==
X-Forwarded-Encrypted: i=1; AKwUvBxzBMS7zubIL2XStGUexki17v13IgOX41612qqHgbo9bx5c+rpGrwi1YD+hw+ehSs7kkLYvY3pO9oQAYnQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYK2iBJ+CLwanLyhijizAAcZHowDsDfGOVlr9sQSax0SE3OuOL3G
	u+mwlUIYv1mQTIm39FcA9OT3Yb3uU+3tB0Ep+Im0HRHt5S/g1FT27fTS0BHyv0zuByC9uJr4WPH
	YLWfYbXXOQDxIT8cuArDf/h+3x86daqk=
X-Gm-Gg: AYBFou1PaM1tTP1ktuvXCajbqyt4zCXzYNvH9KmgPeWjuPJGbyju4WBw3MQkwMKYjXC
	TzfK+Al28nFH1iDhwrN2ExTXY+KKkVqqT20W6biLUxEIdgb7Xk+uysuXsd6CBb2Yc5K5O54wpkX
	GnqLHq+huhC8Xi6CSIJOLFqboYgmzw8hnVxD1ro1+4tcNNP1n4G8dKO9QatRPu2BtHYMILZa9s3
	Mmwi7TtY48B1WZh/6B58iSPbUsIxB8szLp9g64HasxUcXcODdk64DquRASXuAMN9kvqTzGFyL2O
	4jz+vXc7yTlqjV+5UZENsJtcRxGGu+Q/OEzTVic86yALh0LVb9YP6Pmq
X-Received: by 2002:a05:6402:4512:b0:6ac:7d0c:2cb8 with SMTP id
 4fb4d7f45d1cf-6b17c26e26cmr7148152a12.30.1791768997999; Sun, 11 Oct 2026
 18:36:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260917093923.2145007-1-vulab@iscas.ac.cn>
In-Reply-To: <20260917093923.2145007-1-vulab@iscas.ac.cn>
From: Jassi Brar <jassisinghbrar@gmail.com>
Date: Sun, 11 Oct 2026 20:36:24 -0500
X-Gm-Features: AclHuK8Xsk6vNaWsbsfsc6m-jN-PLUBFBJUyFrXzBO7nFbW8E4MZEEKbb4KwlQY
Message-ID: <CABb+yY2ZnisPFR1mXU-E-KEa6SWz2pKicYMeo13PCeHwpW6oAg@mail.gmail.com>
Subject: Re: [PATCH] mailbox: mtk-cmdq: Fix runtime PM leak in cmdq_mbox_flush()
To: Wentao Liang <vulab@iscas.ac.cn>
Cc: angelogioacchino.delregno@collabora.com, bibby.hsieh@mediatek.com, 
	ck.hu@mediatek.com, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, 
	matthias.bgg@gmail.com, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 17, 2026 at 4:39=E2=80=AFAM Wentao Liang <vulab@iscas.ac.cn> wr=
ote:
>
> pm_runtime_get_sync() leaves the runtime PM usage counter incremented
> even when it fails, but cmdq_mbox_flush() returns the error without
> dropping it.  The same happens when the GCE thread does not drain in
> time and the function bails out with -EFAULT.
>
> Undo the reference on both error paths.
>
> Fixes: b0524f7c9635 ("mailbox: mediatek: implement flush function")
> Cc: stable@vger.kernel.org
> Signed-off-by: Wentao Liang <vulab@iscas.ac.cn>
> ---
>  drivers/mailbox/mtk-cmdq-mailbox.c | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/mailbox/mtk-cmdq-mailbox.c b/drivers/mailbox/mtk-cmd=
q-mailbox.c
> index eadd340f8fee..07a8c2382c93 100644
> --- a/drivers/mailbox/mtk-cmdq-mailbox.c
> +++ b/drivers/mailbox/mtk-cmdq-mailbox.c
> @@ -565,8 +565,10 @@ static int cmdq_mbox_flush(struct mbox_chan *chan, u=
nsigned long timeout)
>         int ret;
>
>         ret =3D pm_runtime_get_sync(cmdq->mbox.dev);
> -       if (ret < 0)
> +       if (ret < 0) {
> +               pm_runtime_put_noidle(cmdq->mbox.dev);
>                 return ret;
> +       }
>
>         spin_lock_irqsave(&thread->chan->lock, flags);
>         if (list_empty(&thread->task_busy_list))
> @@ -603,6 +605,9 @@ static int cmdq_mbox_flush(struct mbox_chan *chan, un=
signed long timeout)
>                 dev_err(cmdq->mbox.dev, "Fail to wait GCE thread 0x%x don=
e\n",
>                         (u32)(thread->base - cmdq->base));
>
> +               pm_runtime_mark_last_busy(cmdq->mbox.dev);
> +               pm_runtime_put_autosuspend(cmdq->mbox.dev);
> +
>                 return -EFAULT;
>         }
>         pm_runtime_mark_last_busy(cmdq->mbox.dev);
> --
> 2.34.1
>
Applied to mailbox/for-next

Thanks
Jassi
