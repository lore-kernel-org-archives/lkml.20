Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.42
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793033960;
	b=e5Bz19ybN6Lbr6CUcxwhhDbV/vmXyf3MB7AEHX5/yxTsRNKM7QTu73TY/DBVcHQAh5I8
	 S/9WTblI4MhEiWZYHX5JrhFk1/UkwqaS2aiH1Mixa70qcXee/iPKPDljx/qiEHfy0uAIW
	 zh9bhT1xu000fTTvI2jS5sJX2esuvjTeIVu+Tntt7FhU28ve7636Z7kLq07MQbdaKqOSD
	 1obI3J9/PGj8Jmgv0TXJiayTdI8qM+ErgSgdZVN6+sB4jB3t1O6QRwlp6NRT2Rdq2TQH9
	 UWLG1jo+tn7KHE9fqEXhiNHnldnrDJVxDcJGs1qooDNEvTkimv/QWLEkjjUz4PreTgw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793033960;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=RY1bDffZa37/A+dDgtm1Ka+aoSB+3ffBuKxboX/oHfA=;
	b=Dafk6RyuCglcUjTzNB83BV0B0al2PQt3vD9OLt4zWkTUnh7ETPqNmU1SkKtrB6RQABoH
	 i0rT0E6g7b+ZnD70k12+Huk+Ii2/K930XI7HWujLSAhFZP1FLlr2szqGA/JgHMZS0D0oC
	 POz+82K9xsa6ZhdGwWdbrKqE+zu/IZOSY7h+1hkCnuRHqdxZUTWsOIwnO+m7nAeR+/uBB
	 nR69fhAH2Gbcsmbw+TDjx0zRmBYEpUjwkHczZ74sn7Mnzz2lm5VY0dvHlVOmAM3K3Ebco
	 5MuQLLp2BqEpaRplpa89CqlAQPA7GK5pBQ4Lfgv2XehQV1Br6Xt4SZBcB56dMaIHNVQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=pQ5w20z8;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.42
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCEAC606A31E
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 16:59:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DCEAC606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=pQ5w20z8
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-6b1d8944cb0so5120343a12.3
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 09:59:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793033958; cv=none;
        d=google.com; s=arc-20260327;
        b=CjTJdf/sJ5+QXoFK9JXIG3LfjBEkNtdYBumaAu0i55xMqOhUknpZa580W1h5IxFEiI
         3noTIFT6nYDADdsrGc4NMpL9LzMRJm80aqHTaGrxZCl447gcK2EnGn0drbt9ah7b/zZ2
         ducNQQS87uUoz+TidrDDq3ZCRlZjHsqktVSrptQ+rKaAWwReZw+Ul93dpjiujkxr5NKe
         vwwtVETkaRQNv9lJhVwk7/izkW1hnZCRELU39crB2XHFcnsPstU4a2fler5hipsDWp/g
         0AHQdF4ZwZQgZAuRX8rn7mQMD7L5TjHfeq1IKiyG47XRLvg324teSPe8yLMLUHBS2zyG
         JLUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=RY1bDffZa37/A+dDgtm1Ka+aoSB+3ffBuKxboX/oHfA=;
        fh=sw9J1v8H/sUNpMpK0Fjj8rPQncjwUOFfsBf3faT4WsA=;
        b=PlSQhBgvDIJNIHdpd4wtJasE8Sfc9HbLjvvWrzaddLlkXCLOaRyLWIskqLJs6q53B1
         hQkGV/3evVotNygPhTHQ51+yiJfinxiw42e874WE/op/WZOv9sUxdZZxLRq79rRfbuYu
         6aDJdXXSyzcNKSHX6WcyTKOvxFTEJ9YX+fNru6xmZQEiS7mrOJ49Ju28L1FvE1nXXfmq
         XVYgqYLCrx+A2c1mTfHdhdZuLhGoYHpXDSf27xDCgXdEosiScGIOCIQ7P05xslSW1O5L
         00q73J346E4y9D5bbJidmod6m6qE3phSoi9Cq6k7f1ZWWuCrXwnWaJkZVK4ztXvYW2zW
         pmVQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793033958; x=1793638758; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RY1bDffZa37/A+dDgtm1Ka+aoSB+3ffBuKxboX/oHfA=;
        b=pQ5w20z8DrbUxd5zhXXVhM5YDxnuQR2dNzyNn2LMDVx+NaMR1QzpqE9wS018QY0Lud
         INFzO80PR/U796ITsqku0tn2oFBzOuTu27zPnAQhMse3+OXCKXfVAkrqvyzu0Wr4uCGm
         rSQOX3/3FlVD7MRnwUArQ7NGFtrtmDD/kWvLV6Zh8BI8v/JiTXzi3kW9T4cCYQvlroyq
         4hvQeDxec8KnIR66YuCdM9KiCAqGxRyMhEJuUt6oKqLY300n/6GkIZqz1iPR1ym/KvTu
         vQSnVYdI7zN2YqWTc6uBs0H0bmD1dBnb7StrJLxS5BptdlUlajmFmq9nbrSzMw2a/cov
         IhRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793033958; x=1793638758;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=RY1bDffZa37/A+dDgtm1Ka+aoSB+3ffBuKxboX/oHfA=;
        b=JKgFKFJKOqsvOlhO2mAe6amw2BDiB0Q6COfrNmw8yLPx2/C+y/qk1Nd9qfctRR5YFX
         czpHd4KLElvcndywXkbzmDVnTSbE1GJzXVNsHK+4+Es1trisTFJFd5lrmc0+Et8to91G
         feGADViaPH4proW5M7J/YSIgwxC3mUW+7RnEZUG1HGt0pn7okB2PNXwkNIYAWBYwKbrG
         BJ0xQ1SAPcKeyPNd1D3HwdHRrRIwjXBxpUa5RsKunyEm/neO9bssbD1Kd1arUtbiWdE2
         su6hmD8cEyv7J/yJd1zlvSQKjvxbAX4lEQzFalexqZaorsROi9zCNcbhNMd9Xkqx81Sw
         5ZMg==
X-Forwarded-Encrypted: i=1; AKwUvBwF0NuLdMVRyyXviq2fZ7MzFgxe6HCPsc8hv5ZLC0jFfi2hs9oWhoEvKYGydr+ElqgYpzgT1KowdHs0ahg=@vger.kernel.org
X-Gm-Message-State: AFq9FYIlNJLI7M464eY5V1hVosPpsL/pPo0CvTXuRRpmTsNvsdVTr+nT
	fk9ZMC/f12J70n5bI8GslK3DkK5wpEgLJqio53Dxq0mw6vjntQnHn1782xezju7aFm5J49nJOaj
	gFFttfzV8YcJ1Ydg5S3zvHGhBQSG6X5VVyyp/caHHYQ==
X-Gm-Gg: AYBFou0XtOb/tcse0vElWbfLZpB9SBqD2CQgaHO7X+b5z4JCfvL+FRe26eF1Sp86bVR
	x9iKe/hbeJJ9s9oFB8QPHoDY38edTN7PtNLkXASQUNCtNF63hs9sJqk9TUAaBZjDewQJ0YQPLxv
	V8/p8kVcEVYvCZPW3h0jJHrl0odKeRkuZ6gU2bqHdQbhtKNRX5+MpduB6sFG7LoSpYM69digQ/I
	sHlIPxWavlJLXQtLUyqJoqqo7LwF0pm4mN9ljHfgMb8uVDx83Lx6X+YqepTGLmbQpCcp1XypGBd
	y8gkrwzu5hr3O7TWd70Nk3dpPCkW8cyDx19AGbqcR4Aw5Pg4/Dt5RjkaL+eJfj4LcW4MgXzfH8w
	0h9nkp13+JsVu3rpe5OsDGJBmjr7ErudJ69O1V7J6Er1pfqgta/dlk/Rn+q4uPiI62LKZug==
X-Received: by 2002:aa7:d350:0:b0:6b1:b97b:745 with SMTP id
 4fb4d7f45d1cf-6b442fdf606mr5057802a12.29.1793033958250; Mon, 26 Oct 2026
 09:59:18 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261022194129.2233880-1-karin0.zst@gmail.com>
In-Reply-To: <20261022194129.2233880-1-karin0.zst@gmail.com>
From: Mathieu Poirier <mathieu.poirier@linaro.org>
Date: Mon, 26 Oct 2026 10:59:07 -0600
X-Gm-Features: AclHuK_fb4qQ-ybEQXexGd9Hx8PzUJoph_QuN68jKKcKteDOI7Hi4AR1Bo4gazE
Message-ID: <CANLsYkz6yjvDtV138pYZ1fAKgVcTvULu3QPC0MyZGkLSYMX+NQ@mail.gmail.com>
Subject: Re: [PATCH] rpmsg: virtio: bound the buffer sizes read from config space
To: Lianjie Wang <karin0.zst@gmail.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Tanmay Shah <tanmay.shah@amd.com>, 
	Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>, linux-remoteproc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 22 Oct 2026 at 13:41, Lianjie Wang <karin0.zst@gmail.com> wrote:
>
> With VIRTIO_RPMSG_F_BUFSZ, rpmsg_virtio_get_buf_size() reads the rx and
> tx buffer sizes from the config space as u32 values and checks only that
> each can hold the message header. The probe multiplies them by the
> buffer counts in unsigned int arithmetic to size the buffer area. An rx
> buffer size of 0x1000000 with 256 rx buffers wraps the rx part to zero,
> so the allocation covers only the tx buffers, and the driver posts the
> rx buffers at offsets up to 4 GiB past its start for the device to
> write.
>
> Reject a buffer larger than the header plus U16_MAX, since the 16-bit
> msg->len cannot describe a longer payload. With at most 256 buffers in
> each direction, this bound also keeps the size of the buffer area from
> wrapping.
>
> This patch is assisted by Claude Opus 5.5.
>
> Fixes: ca96ea25e51a ("rpmsg: virtio_rpmsg_bus: Get buffer size from config space")
> Signed-off-by: Lianjie Wang <karin0.zst@gmail.com>
> ---
> The patch is tested against a virtio-rpmsg device added to QEMU. With
> buffer sizes in config space that wrap the size of the buffer area, the
> unpatched driver probes and warns in rpmsg_sg_init() while posting
> buffers past its allocation. With the patch, the probe fails with "bad
> vdev config".
>
>  drivers/rpmsg/virtio_rpmsg_bus.c | 10 ++++++++--
>  1 file changed, 8 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/rpmsg/virtio_rpmsg_bus.c b/drivers/rpmsg/virtio_rpmsg_bus.c
> index 23ff6c8b7a20b..de4af75ee1620 100644
> --- a/drivers/rpmsg/virtio_rpmsg_bus.c
> +++ b/drivers/rpmsg/virtio_rpmsg_bus.c
> @@ -91,6 +91,7 @@ struct rpmsg_hdr {
>         u8 data[];
>  } __packed;
>
> +#define MAX_RPMSG_BUF_SIZE     (sizeof(struct rpmsg_hdr) + U16_MAX)
>
>  /**
>   * struct virtio_rpmsg_channel - rpmsg channel descriptor
> @@ -851,9 +852,14 @@ static int rpmsg_virtio_get_buf_size(struct virtproc_info *vrp)
>                 virtio_cread(vdev, struct virtio_rpmsg_config,
>                              rxbuf_size, &vrp->tx_buf_size);
>
> -               /* The buffers must hold at least the rpmsg header */
> +               /*
> +                * The buffers must hold at least the rpmsg header, and at most
> +                * the header and the largest payload its 16-bit len describes.
> +                */
>                 if (vrp->rx_buf_size < sizeof(struct rpmsg_hdr) ||
> -                   vrp->tx_buf_size < sizeof(struct rpmsg_hdr)) {
> +                   vrp->tx_buf_size < sizeof(struct rpmsg_hdr) ||
> +                   vrp->rx_buf_size > MAX_RPMSG_BUF_SIZE ||
> +                   vrp->tx_buf_size > MAX_RPMSG_BUF_SIZE) {

I will apply this patch when 7.4-rc1 comes out.

Thanks,
Mathieu

>                         dev_err(&vdev->dev,
>                                 "bad vdev config: rx buf sz = %u, tx buf sz = %u\n",
>                                 vrp->rx_buf_size, vrp->tx_buf_size);
>
> base-commit: bd1ecbb61afefc6a8b876ccbc31e9228b44e9eab
> --
> 2.56.0
>
