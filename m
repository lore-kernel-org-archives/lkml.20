Received: from mail-yx1-f46.google.com (mail-yx1-f46.google.com [74.125.224.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D43B81FF7C8
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 03:08:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788404899; cv=pass; b=MTRN7rCQnf0GkJcFIOyF0Hu8DdispbaYRrbfPajFX2DJ8alvoAU4ZuKVAIeY/Caa/WykIaoLsJTWflTDU5qLE+LvXHSdWBrxCJEZC1Y2AptlqEJTvIFAuL9bxfvcxUBTasiO8IU/ct7bZhD7xS/50Qd7t9EHB3FRtz0qsJ7JPSM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788404899; c=relaxed/simple;
	bh=ZQN9NJXDj89uzGf2iFwIqxTSP9mMueIpc4XZFDO0eY8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aVgs9H83xkt+t40C/xiGGEsw1KIvABGM408Mtqym7Ry25LAY16JriJgH97Zho9lCxMP4Mfmg2k2JSmFvGQtnZ5jnPvBYmeRo4dy4wDeVq+t0FhONv6hT1ARvaMd//PX4LSZp3tNaimIlSx+LniY64fq2MmtX2SabIUgNuhFIKK4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=L4IuB2P2; arc=pass smtp.client-ip=74.125.224.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="L4IuB2P2"
Received: by mail-yx1-f46.google.com with SMTP id 956f58d0204a3-66f78cba2e1so2019484d50.3
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 20:08:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788404895; cv=none;
        d=google.com; s=arc-20260327;
        b=ox1CQfGG2liSjZ5kDypRX3ilBI0z6ExmXCXe0YT8vjNLGhXtJzOanWqcYY/rMAd7yb
         mCT6D3XV2FGKJTJKbB2X6E5x9lfBNaYScJZoAbF2ivaWt6KuRN0d4m4TApLyIjQSQwfG
         Bx+eFuEGPa4/+kQmlOojenucjmlbFnNB8eCgi3JKZWWUCa0oi4UQhddAr32X2xF0QDNX
         l97sDKOqHEyt4+xVQzUC1qGqRA57R7ZmQe2vdDgIuwL+iSgNKSvIxWjfXpe2Jv232QXN
         0EDFQ3xwa0KAQRrnDOgkhOGCR1ALj2SjB2RO5xnvAVgwUqZVDOAAEaso6HWpKCCCR+lD
         gR9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=SnzwBfRZpBf2cJeykyMmu4E583GVHfgU8A+PMrUbmFE=;
        fh=VJL6hCeTIEeti+uQZwWtkHG4Ku+EPSf3XNhLLp+j9bs=;
        b=AUVGD5obW3699i79BDjQO2Fk0NKFBg+PpcmaGzLJoDTMQVshDA1459d5/qWKntis4u
         /O+wyVzGY0VHoFY1QYmhZ3HtW87wxy+JuoizsxFo/8hOQjIvVwYaOlSU8KHXDE/g/eR+
         yTt1qciaVxnsK8EZ/8Sf5ooLm6o4jLrJkENdVsm6C6rHg4uW0bAC1aP5nJSbAHQh1sm7
         G2RkR2PCD3mlfclugwnnw/qyUKhHx+VJaXtOAhe/NAf6o5E5vnn2VoMMnWa8SQwtpIzH
         3+Cog0piUIUxDeqXtVbDH1aTWt+oKcSZzjJXjW0938XIJsMRu9JPptcvGy7TeLo5SNOI
         hyAQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1788404895; x=1789009695; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=SnzwBfRZpBf2cJeykyMmu4E583GVHfgU8A+PMrUbmFE=;
        b=L4IuB2P2bfPMhdVwhT1ESkP/jySNZTWEdvmTRd2KCRZulIL8ZLPJl/1kK7KU2Zeqgc
         +GaMVXf3mPMcxVxuEgBAGh0AcfuPgHNHI8Mn+138/wx7jQnnpPucgPKYs6duxQpawrwo
         orWwHYmlMQTmctncyO6+sA9u8AFi0hsnZlsGo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788404895; x=1789009695;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SnzwBfRZpBf2cJeykyMmu4E583GVHfgU8A+PMrUbmFE=;
        b=gXiEhRB3oIggmJyuO7w6/5uko9oBimLubMhbjB9Plml739ozDEZXtzRwWB55rBfmta
         OPWqDV/pf64rrDNxqvWWZmHsnw9VL88Q2JAwUPMszZGCGz8QH1hHWWtcj1LJCRHDJYc4
         vwd/SOhookzOCx9iTzSBwFgrTDx2UR9+PRxt9AAz1+v9WJbHkZb+hwXz2X/TCr+ZzjUq
         6sSdpAAgAgWZiH4o7a2lr/DidgDAFeb/K7vbKw2R9AcGlovFllQzK3pojsCiFZMXC75t
         nLc4MwYBCvrajN1TtFTk6pX7fL+mt4d27sUYa0T4OJ9/5nrPwg7gbxmI79Z+8tjxPZ/H
         cLnA==
X-Forwarded-Encrypted: i=1; AKwUvByUO/OLXwOIeZ/ZjC58SZkFcsXlbfekIcwWEmfU+VY40N0PjtpDGaSaM0wLI4CbOQArLxmsLTRtViKy6aQ=@vger.kernel.org
X-Gm-Message-State: AFuF++k8EDHwbKLT63/uTqjmUDef2naqzpIpck8XhsjLkwqa2EC7+Lwq
	xktk79Zhz9UUU5AYEvFfwGH1AIG3vb69Mxk6HGBAn4FXTn/KbAl3Ma60nMEfnP7ujeCkJtlm0HT
	JvtUj+1GCK0uRoXZGCR5XhoBTnXLF/5Ab1rpZSNh3
X-Gm-Gg: AYBFou3pE3NDnmkpUEb8D3EEPafoHLAPt2hjPoKGmnx7bQb02TwwoPsLgmd/ooqPZ8p
	fNQhCbwBCelG5jqS6WCbEBifk/XXbBHk6JE0ecsWQvSU6Jp74s2+8CacY2MdfZDQLe1Uijw7cSv
	GrZ5bDhTzTFKxbmK5MT4cqdpzEfP9CzhDd/l/i6RHCPn2rjJwuuS+q/4lcCBWZEdSoLG7jnOGLI
	7jeLy6ehUY1NFDoOVRqcaNhGMOVW3GSViIVA87kGG5aE2kM6PTOmJJ0zNmNlymR/gJTDrMyVQKV
	TfuyE+2t5do4ldm+Qzbbh1sjVsEohMq9WdOdRg3U0BV3OstGRuOQuDD83hqDPfIElM7z/KHrb3Y
	=
X-Received: by 2002:a05:690e:400f:b0:66d:113a:3928 with SMTP id
 956f58d0204a3-66f9bb6f3famr3574226d50.12.1788404894746; Wed, 02 Sep 2026
 20:08:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260902200703.2016410-1-mukesh.ojha@oss.qualcomm.com> <20260902200703.2016410-6-mukesh.ojha@oss.qualcomm.com>
In-Reply-To: <20260902200703.2016410-6-mukesh.ojha@oss.qualcomm.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Thu, 3 Sep 2026 11:08:02 +0800
X-Gm-Features: AcwNN1Wn32BWTc7gvrI5NCynGubfvPlrWgUmvLkoMfGnpAB8yTnTJoIOOvbhgBM
Message-ID: <CAGXv+5E9zs7LsK=d08NB6QcuHkaPw4GcifuDuMDz0CVB6gB=8A@mail.gmail.com>
Subject: Re: [PATCH v2 5/6] media: mediatek: vpu: Use devm_of_reserved_mem_device_init()
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Cc: Daniel Scally <dan.scally@ideasonboard.com>, 
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Eddie James <eajames@linux.ibm.com>, Joel Stanley <joel@jms.id.au>, 
	Andrew Jeffery <andrew@codeconstruct.com.au>, Minghsiu Tsai <minghsiu.tsai@mediatek.com>, 
	Houlong Wei <houlong.wei@mediatek.com>, Andrew-CT Chen <andrew-ct.chen@mediatek.com>, 
	Tiffany Lin <tiffany.lin@mediatek.com>, Yunfei Dong <yunfei.dong@mediatek.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Joseph Liu <kwliu@nuvoton.com>, 
	Marvin Lin <kflin@nuvoton.com>, Dmitry Osipenko <dmitry.osipenko@collabora.com>, 
	Maxime Ripard <mripard@kernel.org>, Paul Kocialkowski <paulk@sys-base.io>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Chen-Yu Tsai <wens@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Ryan Chen <ryan_chen@aspeedtech.com>, Billy Tsai <billy_tsai@aspeedtech.com>, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	openbmc@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, 
	linux-aspeed@lists.ozlabs.org, linux-mediatek@lists.infradead.org, 
	kernel@collabora.com, linux-staging@lists.linux.dev, 
	linux-sunxi@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 3, 2026 at 4:08=E2=80=AFAM Mukesh Ojha <mukesh.ojha@oss.qualcom=
m.com> wrote:
>
> Use the devres-managed devm_of_reserved_mem_device_init() instead of
> the manual of_reserved_mem_device_init()/of_reserved_mem_device_release()
> pair, letting the device resource manager handle cleanup automatically.
>
> Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> ---
>  drivers/media/platform/mediatek/vpu/mtk_vpu.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/drivers/media/platform/mediatek/vpu/mtk_vpu.c b/drivers/medi=
a/platform/mediatek/vpu/mtk_vpu.c
> index 8d8319f0cd22..557bffb2c2f1 100644
> --- a/drivers/media/platform/mediatek/vpu/mtk_vpu.c
> +++ b/drivers/media/platform/mediatek/vpu/mtk_vpu.c
> @@ -888,7 +888,7 @@ static int mtk_vpu_probe(struct platform_device *pdev=
)
>         dev_info(dev, "4GB mode %u\n", vpu->enable_4GB);
>
>         if (vpu->enable_4GB) {
> -               ret =3D of_reserved_mem_device_init(dev);
> +               ret =3D devm_of_reserved_mem_device_init(dev);

There are non-devm calls before this. Inserting a devm call in here
messes up the unwind order and leads to confusion. In other words
this is a bad idea.


OOTH, the remove function is missing a release call.

>                 if (ret)
>                         dev_info(dev, "init reserved memory failed\n");
>                         /* continue to use dynamic allocation if failed *=
/
> @@ -930,7 +930,6 @@ static int mtk_vpu_probe(struct platform_device *pdev=
)
>  free_d_mem:
>         vpu_free_ext_mem(vpu, D_FW);
>  remove_debugfs:
> -       of_reserved_mem_device_release(dev);
>  #ifdef CONFIG_DEBUG_FS
>         debugfs_remove(vpu_debugfs);
>  #endif
> --
> 2.55.0
>
>
