Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B416F35B657
	for <linux-kernel@vger.kernel.org>; Tue,  6 Oct 2026 06:23:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.179
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791267815; cv=pass; b=F6cx8tyewdCwHO0sPtnJK/zAh116tlBpxVrwV299htVGIUrOI+RwL2EIxhph8vf0ZBCZU3QvtHi109I9fCoyCVCgRfyHxxbj17hI+LWe2ZukuMf2NauW65JvOLsaCEm8DazqgEIgLSGYAo18qsKkIQfcVmGt2RpRH3WogpI2nOM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791267815; c=relaxed/simple;
	bh=6yj3IjznaS3BQd8hYYaLqUQxrXsV+yww0L4Bwh7JzCw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RHtCPDTr72rDtoD13GSSUeT+4hMaq13Tiuqqlwbwv7m4VpApqT7wqYTI5u92WfuUzTEwKa37RwWjUkrBq7K1C5fNzLNqmIndwOvRYB+JdoPI2DFJG8UBnDukpdj4lF/yN5L8NNCrAv2ne0jzCtG9rZI2TLaS2TViAFD2uO4geQc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=cI6nAbVx; arc=pass smtp.client-ip=209.85.160.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="cI6nAbVx"
Received: by mail-qt1-f179.google.com with SMTP id d75a77b69052e-5351f9dbfe0so85581cf.1
        for <linux-kernel@vger.kernel.org>; Mon, 05 Oct 2026 23:23:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791267812; cv=none;
        d=google.com; s=arc-20260327;
        b=oByxVfxKAp8ymC2wnTvDH34zN/5D0+XAh4UZf/me2rtcsn6Kc58i6tgaljeBgv5Igc
         jMeoq41inNnB9SwIC1Agkc2sK2xI+n6aAOdIrO7CCx8hLh8v/2yims99oS0JkGEOQqfj
         Z5SzTKAS4JhSfXsApk6oExt/fBPKnQ+GdghRMhcYNTecpqcopHp+pzpyHowjj797a8wQ
         RTGnDqQY9J5rpdKgxlpwIWski/j+lGEcv2CHkVbNSqEs/Ff1UOrK0yrWdkDgrMoEfem2
         VNjmfiJnQGTlU+ggKuAEq58gsPzxi1E2JC5woZL7e1MKFUhqpHrY+jUPBbKJ5EteZiUa
         dU0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=d6+kRSXQFgdihasqR6LMoeFY3+MY7JRLIu/SoS6ybio=;
        fh=rOTIWdSoBCQDzZaFJmIOg48086XYJuJeeApGU2FUocQ=;
        b=WlixGubL3Lr4YzABXSTmEUUJZSOXnwgArJZWcpeIdJw26aTjW8VA5bbETaryxCfems
         tykET+gvEl+HptQ3DbBXSx6ITnwwl06cPoVTwbjtjQmcR6/HY16uY3SUn5xb9TeI9aiE
         JRm36O7HSrbLviPYQTfJ30ObZYYMhbzL7k8gSS59QHWBmcXJNvWBzu3cdxJLPd0FH05t
         VYaHvJGtt63bmFwdzZ5XumrI2G5/myp/YxxY+2GON3iFhsSzNXCrxhWWXI/AKpx5/xuV
         QYeyPor7q8tewyC6GEwV/dSp4Oyru5RdYHj8vtC1rplNdbB+L5RcnbrxyrLe1a7rWm2U
         xuTA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1791267812; x=1791872612; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=d6+kRSXQFgdihasqR6LMoeFY3+MY7JRLIu/SoS6ybio=;
        b=cI6nAbVx89HOyEZPNUsfw401h55kopF/Y4YLHhHLK1THv259ACIoLPIwO8VK0WdQhz
         ivvt9VNPooUGVnwcz8rPzLDoczD8JSBpfAYbIyzxHxzt+vzsH8VguKZA3+uMB3FedlSS
         kelEvRjOUTopWCNrYgKUqwq2L+6yUrXVGyCw+nY3VpFFQo2+jHeIke7vKtBmR01h3X6p
         TrMOrlHGApFFy/iAxEDg6R7Owl+v2Jiyf0/nAzYLykEe7mcFr7MPhBcIUQcGfAAU906D
         +bxZk5fD2ywW4IazAkDp7dvZEZPC8lB3vsH+gKlt5H4dLTujiZg/e52hTQJ25fy8Ccfg
         3UtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791267812; x=1791872612;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=d6+kRSXQFgdihasqR6LMoeFY3+MY7JRLIu/SoS6ybio=;
        b=qybw4xnV8nZ+ksipgxbMzPAM/EF+Sm5jRYbJxQz3m199sFhgDCwBBKECfr2VAWfJHP
         hmCLHkZ7jI34LNB6s59SyNL+Rjl3tK4tE6u7XYhF8IkPxAR8p5qgmZHbMRi8rRpCyYuP
         T0/eydoTkl/0bABqHOSsr1+yzp0ryLVmibIVMv2hsgQe1it2CYw0ocK2MjngBen9eFvJ
         J8vFTIUzZTabNqQD9sk4ZKJoKnirbcfBH25vdMA7N9gv4ZUyhs90wNwsN9gHNpCCKOCA
         IJvf9ZgnFPXL6hcAL9SORLcCzYGMpBu2eyC/3kJBZpp3eZPKGeCuwGHIQrBI27uRJZ8N
         gZSQ==
X-Forwarded-Encrypted: i=1; AKwUvBxR6tFUp6FYUHqMT+lW3kgUU0RV0WY9ubP6u4U5CbmmeABYf9Z8VwrxBz5QxurvsFUhSrfRYoe2Mpnwv4M=@vger.kernel.org
X-Gm-Message-State: AFuF++msQx4h/fkXjzirVs5T6Vb+/lareL9fYuZhedySQ9+4xFPJMueX
	OfIFSvW9JfEyACZGrPo/CQY2OcRvCRxbEU19P2ETtKHFzYKRYIXDbiyYzSTuJgqdrFGtXJBzF1J
	n0IfyLW+D5e9VcsRu/W0tXmrY6X9imeQ3m8h6fmO8
X-Gm-Gg: AYBFou3+O3DD51Le7hn9hdjfOHek2Ck4ZwB3IhrEF6AnbJ51o/gRIJDgGzdKQKWIkZK
	7jyoIeK7ZCQ1HRJHe++3gnirrRHHNWvKU3ErPe7W0WLqL98ttXyh0s5s/hfXk650/gOtUfZ+fdp
	H+IErbviuCzhQDKMJnn0nxq2xjzKUqIn8/AmwwRYamrACM6wcDmvDrGFBR0XgtPMHq1dK8mSSLf
	/6/FYCLL2tHAf3JwZYBpizcoJMo/aVfZLYVXxrKuXnq/WA6bJL6rqjjMcL3nsJyDPaSv3SkcmNU
	mwARsPk5Mw3s7GuQ6A5KYMEQMbtJaYFmky5mJzGV5sudM3lgAEaiSkyI3AqYQ5uo0muRAED76LR
	qJ2vWkmqxWrixiDhifpTZXOJCHQ38OXtzK2cCEt7Ner7KWqoHpVEN8iD0ohkcACoq19Ij6P1nxW
	Dyo3utY4bYYq8zSEF8GAFSguL36mg=
X-Received: by 2002:a05:622a:244c:b0:533:9746:9a86 with SMTP id
 d75a77b69052e-535406abef8mr12178981cf.5.1791267811940; Mon, 05 Oct 2026
 23:23:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261005122036.718976-1-senozhatsky@chromium.org> <20261005122036.718976-7-senozhatsky@chromium.org>
In-Reply-To: <20261005122036.718976-7-senozhatsky@chromium.org>
From: Brian Geffon <bgeffon@google.com>
Date: Tue, 6 Oct 2026 15:22:54 +0900
X-Gm-Features: AclHuK8LYHoepKR1DX5jKzVYXr3tve8RqbZuZnlBMtj7jR1SkDVBcQxir3QS8S0
Message-ID: <CADyq12wEtNYBi=gDaWxMGOaaxTPYj2DKg25YE4owBOxFuSbCpQ@mail.gmail.com>
Subject: Re: [PATCH 06/10] zram: lz4hc: use LZ4_decompress_safe_usingDict()
To: Sergey Senozhatsky <senozhatsky@chromium.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, Minchan Kim <minchan@kernel.org>, 
	Richard Chang <richardycc@google.com>, linux-kernel@vger.kernel.org, 
	linux-block@vger.kernel.org, linux-mm@kvack.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 5, 2026 at 9:21=E2=80=AFPM Sergey Senozhatsky
<senozhatsky@chromium.org> wrote:
>
> Use LZ4_decompress_safe_usingDict() in lz4hc_decompress() to avoid
> needing a per-CPU LZ4_streamDecode_t structure.  Drop struct lz4hc_ctx
> as well and store the compression workspace directly in ctx->context,
> matching backend_lz4.
>
> Using vmalloc(LZ4HC_MEM_COMPRESS) instead of kzalloc() for cstrm when a
> dictionary is configured also avoids power-of-2 page rounding (~256 KB
> rounded up to 512 KB), saving ~252 KB per CPU.
>
> Signed-off-by: Sergey Senozhatsky <senozhatsky@chromium.org>

Acked-by: Brian Geffon <bgeffon@google.com>

> ---
>  drivers/block/zram/backend_lz4hc.c | 70 +++++-------------------------
>  1 file changed, 11 insertions(+), 59 deletions(-)
>
> diff --git a/drivers/block/zram/backend_lz4hc.c b/drivers/block/zram/back=
end_lz4hc.c
> index f3656c27af21..b62736b26622 100644
> --- a/drivers/block/zram/backend_lz4hc.c
> +++ b/drivers/block/zram/backend_lz4hc.c
> @@ -4,18 +4,10 @@
>
>  #include <linux/kernel.h>
>  #include <linux/lz4.h>
> -#include <linux/slab.h>
>  #include <linux/vmalloc.h>
>
>  #include "backend_lz4hc.h"
>
> -struct lz4hc_ctx {
> -       void *mem;
> -
> -       LZ4_streamDecode_t *dstrm;
> -       LZ4_streamHC_t *cstrm;
> -};
> -
>  static void lz4hc_release_params(struct zcomp_params *params)
>  {
>         LZ4_streamHC_t *dict_stream =3D params->drv_data;
> @@ -65,61 +57,32 @@ static int lz4hc_setup_params(struct zcomp_params *pa=
rams)
>
>  static void lz4hc_destroy(struct zcomp_ctx *ctx)
>  {
> -       struct lz4hc_ctx *zctx =3D ctx->context;
> -
> -       if (!zctx)
> -               return;
> -
> -       kfree(zctx->dstrm);
> -       kfree(zctx->cstrm);
> -       vfree(zctx->mem);
> -       kfree(zctx);
> +       vfree(ctx->context);
>  }
>
>  static int lz4hc_create(struct zcomp_params *params, struct zcomp_ctx *c=
tx)
>  {
> -       struct lz4hc_ctx *zctx;
> +       BUILD_BUG_ON(sizeof(LZ4_streamHC_t) !=3D LZ4HC_MEM_COMPRESS);
>
> -       zctx =3D kzalloc_obj(*zctx);
> -       if (!zctx)
> +       ctx->context =3D vmalloc(LZ4HC_MEM_COMPRESS);
> +       if (!ctx->context)
>                 return -ENOMEM;
> -
> -       ctx->context =3D zctx;
> -       if (params->dict_sz =3D=3D 0) {
> -               zctx->mem =3D vmalloc(LZ4HC_MEM_COMPRESS);
> -               if (!zctx->mem)
> -                       goto error;
> -       } else {
> -               zctx->dstrm =3D kzalloc_obj(*zctx->dstrm);
> -               if (!zctx->dstrm)
> -                       goto error;
> -
> -               zctx->cstrm =3D kzalloc_obj(*zctx->cstrm);
> -               if (!zctx->cstrm)
> -                       goto error;
> -       }
> -
>         return 0;
> -
> -error:
> -       lz4hc_destroy(ctx);
> -       return -EINVAL;
>  }
>
>  static int lz4hc_compress(struct zcomp_params *params, struct zcomp_ctx =
*ctx,
>                           struct zcomp_req *req)
>  {
> -       struct lz4hc_ctx *zctx =3D ctx->context;
>         int ret;
>
> -       if (!zctx->cstrm) {
> +       if (!params->drv_data) {
>                 ret =3D LZ4_compress_HC(req->src, req->dst, req->src_len,
>                                       req->dst_len, params->level,
> -                                     zctx->mem);
> +                                     ctx->context);
>         } else {
>                 /* Cstrm needs to be reset */
> -               memcpy(zctx->cstrm, params->drv_data, sizeof(*zctx->cstrm=
));
> -               ret =3D LZ4_compress_HC_continue(zctx->cstrm, req->src, r=
eq->dst,
> +               memcpy(ctx->context, params->drv_data, sizeof(LZ4_streamH=
C_t));
> +               ret =3D LZ4_compress_HC_continue(ctx->context, req->src, =
req->dst,
>                                                req->src_len, req->dst_len=
);
>         }
>         if (!ret)
> @@ -131,22 +94,11 @@ static int lz4hc_compress(struct zcomp_params *param=
s, struct zcomp_ctx *ctx,
>  static int lz4hc_decompress(struct zcomp_params *params, struct zcomp_ct=
x *ctx,
>                             struct zcomp_req *req)
>  {
> -       struct lz4hc_ctx *zctx =3D ctx->context;
>         int ret;
>
> -       if (!zctx->dstrm) {
> -               ret =3D LZ4_decompress_safe(req->src, req->dst, req->src_=
len,
> -                                         req->dst_len);
> -       } else {
> -               /* Dstrm needs to be reset */
> -               ret =3D LZ4_setStreamDecode(zctx->dstrm, params->dict,
> -                                         params->dict_sz);
> -               if (!ret)
> -                       return -EINVAL;
> -               ret =3D LZ4_decompress_safe_continue(zctx->dstrm, req->sr=
c,
> -                                                  req->dst, req->src_len=
,
> -                                                  req->dst_len);
> -       }
> +       ret =3D LZ4_decompress_safe_usingDict(req->src, req->dst, req->sr=
c_len,
> +                                           req->dst_len, params->dict,
> +                                           params->dict_sz);
>         if (ret < 0)
>                 return -EINVAL;
>         return 0;
> --
> 2.56.0.rc1.315.gc6ed9934b7-goog
>
