Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.178
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794293777;
	b=GDOD72BAiqtEA5vGZem7nSdwFPqyAAIyy9ZapEY5fTz1O+S63fuOIQWjCgxk8d7C0KyF
	 aF4fNLVtY6y+oOzMyciYAYqB41yXh7qJxFMXi7WLEaViw09ZRaaDsLBT/pEzo/5oOf/Ns
	 Xw6shuLtjMbyLaoLhCNyOp2TFBkleX/oin7EZTh4J3AQwGxMX5m3ip5/DJCiZjp9C/uIx
	 buw9WR+fQvfab7BTt72KWB/QYwLKCezackpWYx6gY3UP9cS1twRV4d/SzmWHgzuTbFQ5x
	 sSccYrx7hUHNAvIUT6L4yfPYCdnOw2waG0Q69YaKZfYwM6bJseMnGC8KwYwxLNP80+w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794293777;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=gv29PVlI4VqmDiKhon5UhDcIb7a0X1gnIhvI6TovMh8=;
	b=LJPqBedyqFyoo75V0/gCd/ThJgxp/opcIxJ1jKZsvfRcCXzgdgC4uapadFKa7EcRRD64
	 ECejpLj8ZYPW2mHealpSqBuMEQDRUCTyEsGcSK+eMADbv0GhoUBt7TlR2Vui+Hk+n1VmE
	 ciN0PLDXWtreQXBswWMg/dq3TF+0/U8hhpr/IdkkL6f8kFJ/1BiiQ80S6VJPcU5D4K+3u
	 VgfcjYOB+F1D5bc4zzhqORQoM8jaPPZFAMaX0rhGg8/UG0NSXv4kRhDkNpoEa/eDE7nx4
	 iQI990XGpqZSeIknJJxZCZqI+aWdCY26x8DOaQE9zMn38JQYO2NakEq2I5tat7FSbsA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=INdN09EU;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.178
Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13D4A606A321
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 06:56:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 13D4A606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=INdN09EU
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-36ff9c9da34so2891748eec.1
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 22:56:16 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794293776; cv=none;
        d=google.com; s=arc-20260327;
        b=DT9eTKiTiG/2FuzUkuRngLfiku4aCCryjU28MLOvQTCde4VYBy47vN1B2fx3O5w8Ex
         9NR9JrMSi5hD5whiwdtfQ7y+7Nf4zNdmZWByqevhSoTHMdYFU7g0ERx0fh0tAadJA0oe
         lLaMmVjjsyVcebQ+rviZHjRHypnjYn9GYM2N227VNcwoDaA3y5p9AjgseARVVCqGidpp
         UkNduaIS8KN+0ZT1aCmQDVfdjEgjxruhmUe1gMK37lpo++QOl/FZSPmG13mMsB5S0R8B
         pMJ9YGELOzdzm0Ybi/g3rd6bJGPQdu6aWXMP1v98vFvz+GbOSKK3Wv++KfQuhkvLYj7d
         l3Bw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=gv29PVlI4VqmDiKhon5UhDcIb7a0X1gnIhvI6TovMh8=;
        fh=UWFZi5oa268YXwwBp09AnriILJmLpvuFa1xGlRMk8D4=;
        b=MUJ8X8bqPpkB4UvcyGa7gyo7qLN3Lhmwt0BWaFX8ekhIzM4vkaF9pvdS3QNrklLmC+
         TnOG7gJHoX8HpnqkN8762CDfs1HrSxwhAAXjBO5o3k/tZNf61CC2KwWY2XQd/Q/h6emR
         BdWhilE3Heme5HQ17dDS3MOV3SGzr2XxLdwZobQ/9kSJbnM30ERMqvVSLjBaIyD4oHJ5
         NHit1EVkrAOqF1CVzRWBM+DRgKzOM24Ymfv2b1gk668DkkDM2tzoTmO8QS6FCecWDIS6
         C+FP41o5+hPPXla986eeSEFQA/liwZ5kRceehyY8q6Jag3zllLUiix9MArRm5K+LFX75
         zg8w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794293776; x=1794898576; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=gv29PVlI4VqmDiKhon5UhDcIb7a0X1gnIhvI6TovMh8=;
        b=INdN09EUKAvnXut6IrHtz1ZA3BVBr9e6B+gc+BjVw2cdz0pXF2Db7DalKQlpoAatMo
         TrIc7sDgF+cmqIsTWU6zycIytSh7Tg+7F0mLcts/6UjZDwdeysRU/UJkYrgCTGNAQKsp
         vTCSDGFsS+dIpLgli2l9b+sk7Io2i2hXi473fGg0jOCCJ8IvlkiNKSjtHWP19eQ32u+1
         z073VEPcI5i0u/KLM56dnc1j692W2S+GSwEiLlG7M5oniuV+Q621Yr0j71BIYRh2p8Qe
         FtMXzJxpGWxI9m6LhaxBVUbfXmdAinIc1jjWTG2fpEZ1PljUHdNipQl39fSq99zBVvj5
         4ahQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794293776; x=1794898576;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gv29PVlI4VqmDiKhon5UhDcIb7a0X1gnIhvI6TovMh8=;
        b=WXbx96HIA+wcGBSOZD8626blJ6BSVpXIwSGx8u1Pe3jVCOvpq/uEPngKq2sMniBx5o
         XjM3IGmbWq1OiBWegfHDH0DB3Ckj33rYCl6yye/1p7eM8yzZy53DYNFD7wXYLRQ1R0nk
         eSOFhQjMP6PHhiPcmltkBO9+BuITfOxhXPy7LOq2/qtwD2jyUMQ5mG0A0tR3IqWMq5N2
         fsI9M+6gUoRt85CNp7/eGplb7qN+bw6pnsMN3m+mpLr+InDWuJpV4bzhYtBmBvSQ2tg3
         5a/LTK+Oz23GTrC4QdvBvblV0FPY/fd8vM2VNfx0jLy09qAcvXZ60OeUdn1mYDJiUr+X
         Tryw==
X-Forwarded-Encrypted: i=1; AL+hErHtRPwh0plxOO/aeVCLRpikn0MCLmqKvJgJ9s80GH9QmP91ZQF4Q6jhZdo/IDtKOWqFQocl75bR76RvlEo=@vger.kernel.org
X-Gm-Message-State: APuU4Z+x8iBRfeRvAvNiJwm9+EX1T4zZ1/EgSvIBXIrT88VVbELp+nEW
	URJzeRW2ZJBA9DV7Jt/PLP4fArtsWJZmWd4ywzmCiuWaz3663B/xd8glnIsUpl09H5YZchDc721
	8oOP2LlK5neWi8qdV3YhFLWTeUSu5fIU=
X-Gm-Gg: AYBFou1ZHmWZVsiypMLu/cYR/KnVeRDLLRyZ+OuWt9zzdi0IEy3VpxytFg4sm+N7LS/
	Xy0Mmw4TBfvsS4OLnbGzOe4PtK0oCIZ8ue6QCuxj84ncvC1uRWkr+iWG30afLtuTzqBoO72orjs
	u1zkflrq0qsLV7FQa65oHSviNz341Awla1RLdoE/+GqM7IODTQCf/kPJuu0gHUgPLNlZK3YhmL8
	czLeO/xtJUwc7ZrJXSsqW10t0stz/5umoMkWRI0UqExp8wzRZwpGAQGFTMJSY+BfLLYsCeaDc57
	YjwZKkat/HY9mnevgGShcSSs9reWpYtoinr8RCTxr+V9dZtErStP8JVrHWGqr7YO7y6+HBcBIKA
	lFw6bjnYT/vBf1jB1dk5a0iTb70mmFifqbdYBojvH9XSONJAKj4TVJHWEqKQjEbYoCXK0
X-Received: by 2002:a05:7301:18ad:b0:36a:1294:59e0 with SMTP id
 5a478bee46e88-3751f462675mr2049626eec.24.1794293775810; Mon, 09 Nov 2026
 22:56:15 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261109045307.1167784-1-hj351016@gmail.com>
In-Reply-To: <20261109045307.1167784-1-hj351016@gmail.com>
From: khj <hj351016@gmail.com>
Date: Tue, 10 Nov 2026 15:56:04 +0900
X-Gm-Features: AclHuK-sqbPvnKyMJ84OYA3XkEoK-7U1o08imiJGCwa7o_TRyFoPrgq9Cv4NOyQ
Message-ID: <CAGr5VtOXSDR+ZAHy-e+baVjvWSeUCrShdaAF23zLRfbwiJ7W3w@mail.gmail.com>
Subject: Re: [PATCH] media: mgb4: cancel err_work on teardown to avoid use-after-free
To: Martin Tuma <martin.tuma@digiteqautomotive.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Hans Verkuil <hverkuil@kernel.org>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Please disregard this patch -- it is an accidental duplicate of

  [PATCH] media: mgb4: cancel err_work before freeing the vin device
  https://lore.kernel.org/linux-media/20261106043541.1902730-1-hj351016@gma=
il.com/

which is the same one-line fix and already carries

  Reviewed-by: Martin T=C5=AFma <martin.tuma@digiteqautomotive.com>

Please apply that reviewed version instead; sorry for the noise.

Thanks,
Hyunjung

2026=EB=85=84 11=EC=9B=94 9=EC=9D=BC (=EC=9B=94) =EC=98=A4=ED=9B=84 1:53, h=
yunjungg <hj351016@gmail.com>=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=84=B1:
>
> From: Hyunjung Ko <hj351016@gmail.com>
>
> The err IRQ handler (err_handler) schedules vindev->err_work
> (signal_change), which dereferences vindev (vindev->mgbdev, vindev->vdev,
> vindev->queue). mgb4_vin_free() disables and frees the err IRQ, so no new
> err_work is scheduled, but it never cancels an err_work that was already
> queued by the last interrupt before kfree(vindev). As err_work runs on
> the system workqueue with no timing bound, it can execute after vindev is
> freed, dereferencing freed memory -- a use-after-free.
>
> Cancel err_work after the interrupts are freed (so it cannot be
> re-queued) and before vindev is freed, mirroring the existing
> cancel_work_sync(&vindev->dma_work) in stop_streaming().
>
> Fixes: 0ab13674a9bd ("media: pci: mgb4: Added Digiteq Automotive MGB4 dri=
ver")
> Cc: stable@vger.kernel.org
> Signed-off-by: Hyunjung Ko <hj351016@gmail.com>
> ---
>  drivers/media/pci/mgb4/mgb4_vin.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/drivers/media/pci/mgb4/mgb4_vin.c b/drivers/media/pci/mgb4/m=
gb4_vin.c
> index b247854..64b7a9b 100644
> --- a/drivers/media/pci/mgb4/mgb4_vin.c
> +++ b/drivers/media/pci/mgb4/mgb4_vin.c
> @@ -1068,6 +1068,8 @@ void mgb4_vin_free(struct mgb4_vin_dev *vindev)
>         free_irq(vin_irq, vindev);
>         free_irq(err_irq, vindev);
>
> +       cancel_work_sync(&vindev->err_work);
> +
>         device_remove_groups(&vindev->vdev.dev, module_groups(vindev->mgb=
dev));
>
>         mgb4_i2c_free(&vindev->deser);
> --
> 2.43.0
>
