Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.47
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792896713;
	b=bzqqAp16vxQRQ+r+crYmpIh6aiLSu58jtAfd5rFIxpVrnHjckosuCVEYZmNVhsO7Y52r
	 mS0cpAr6ocyz6GbKt9Z242EFnOUhJ5Hzd6Hq/F/pKS2j7m7aRtHyF/Y9Br5ueuHGZR0dz
	 ELuCbwehJElgxZvBX6n1zqL+VHqvEw6OEG7Li1N8t/Iwd4Vds0hwE68Zw/NoZyrgJeI/A
	 3QermyG9Pv5iCzq8heECl/o8RL6Xe1kXM78iq6su2nP8APrrcBT8pZwgNXCtU0Iz8jaEs
	 vpaXBLL23sjL4YRTPSLrHBhNo6M22K1rm3tVsuIbdADkRK+xDKuYDbQeq8yRY/4xOUg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792896713;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=FU5RTsamiHXtFoFdGVctPWi31ZfViWT4/lAqub7SSi4=;
	b=uXCsCbI7uj094lCI5kBex1hZPI5l9nJurL0H5uwcvcxfHublXvPoNNWzuVkFsi9td0ga
	 Kpvm+ZLJ22jzsdQdp2QmdNyKsEXv8b/9F4//zomC86yPzR9KD41JTq2p5L2jzX9N5Nff+
	 vT5RgV89GujPlBp2GMqLRL3ULnIcLeqNGJFpLDKKyLtK6UD8ecvNphXqokkcmF58Fo60Y
	 R4+kjbpcggzKMwOgP9Rou33yuvpymhBcmkr4saJW4OohgrOpqRGmHIH7FUGtO1G8lRmYl
	 y7iUq15DyFd/XFNhvNW6Z+5T0mOZRjoMlJ22Rqu3ohui6DfN0XiS0E0674ElwO5RUoQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=aTtfRWF7;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.47
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F33E606A31E
	for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 02:51:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3F33E606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=aTtfRWF7
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-5ba36cc21cdso2202697e87.1
        for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 19:51:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792896711; cv=none;
        d=google.com; s=arc-20260327;
        b=a7qEvrzuTR5UawQVa3Lx52wciDjq1FtfSx1F+hASfwiwCbwVLKDzusJ3KUdbT9xqMj
         x5GnET0HL+y6L3oHAJvLgN98nVlqhc0CsmiFBNGz3prhlYPNiLkhbj066gz/AmhRGfWC
         AGE3phWFiMlWD6k6YzZxyMhJ1nZOO5irIIpUvxxGpkzs/8JxvpRl2ZelAsMU7OesxcAH
         y88YRgfoOuisse/Axi96EZMUwFfpXRPXbyKTVsTPSpa9A1pIXO+pkVwUKc+YvWw2JMET
         nfw6MsksIy4JHlqAwrtD4m+j0tfHXbaXgTAzWbcBGHUJwFXq3srr92M+QJwCkQpVVwej
         BnFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=FU5RTsamiHXtFoFdGVctPWi31ZfViWT4/lAqub7SSi4=;
        fh=j1CGeMF08pyNIEjV686kzp5062vIgCpohG5OWu0UuoU=;
        b=Iten/5ZBRexnf3q/lxL1pldoGume6ft921DybzBUTmWIop5rYzUaUbDBhRQG3vLIU7
         3YPm3tz8+X28yvpawCEYLYfXLSegWaPhELr5eIjF4U+elSdiM+Z7qRqfj1h9dQqh4tW9
         VIDJ3s6zP/mzNc9rPCc67NHeXqh+cttzsIdtXw9XqHJ/1g1OoKjyT+nK1JwKzSuBFABU
         GCIXL/8rK5/UIzFxAG0/0lJ2C/UXlZAPNj2sVFhm/RnKC7OBcSfiqZ6pDxBDJZkHGtIz
         NTeNYccRjn0Zgb374pGGFEwVnPAEf1oOceGHpJKknCKz6G9fXp+U7LjlizIUVwU7Qd+4
         wF1Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792896711; x=1793501511; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=FU5RTsamiHXtFoFdGVctPWi31ZfViWT4/lAqub7SSi4=;
        b=aTtfRWF7LQ4aK7mY7nYUpzL3kyQ6x7PsBZmvPrbianfoppIvuf0nfUQKIpNnpVKJ1s
         MpAAKClCDQ0ycO8erRcVLScqW7Xnx9gmwbimL69V5ZlKrdetpWfYxJ0tHpHAlB8i4gSO
         8ulg2HkHqkZRnHit0VKY1gmWFyplDc6TZHpAgP5btHf2fYtDBQjsO8ajz00B9Yh8hBT+
         er/+xI/iSMvlfdZrhUF2NLOz3Jno6+jX7o9ZZKLskp/x5q4pUyNJ9eWFwmohXeWDxdzQ
         xWT3yv7UFlCgIazWEP23ahkjiPvGh0HVvXZuLLpookcU4mz6FkGhJlZ4v0U4h+sKgo5+
         P1xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792896711; x=1793501511;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FU5RTsamiHXtFoFdGVctPWi31ZfViWT4/lAqub7SSi4=;
        b=pxfBeqz5MdOFc7YNkz/HH5MmAXB71PD+EZ5tK7d+9DFEk464xcIy4/5Yw0bCKwcO4i
         pFYw/6Fh+3kCifH8MpmSmQDBaS//Wg4KClNddRQjyKnkOgMSr9rtxFrQxxaM+R7P0knX
         fGhjragWcD+45n/H+Hu++qKF54JqN23DJCRdaOv/1VaLXFi8hLMIxPkXBKfqqClGFNdT
         Z+tyiKpCftxWgKqHm9/VHLqynSvw0S0dQ3DJHbedVdQ+0Kv7oxAsxf16d9K/MYAJ+1zv
         fx2lnNZ4aoRZ6PyLYFmdzMvKYRziQa/X5tyLp24yFc3OkMaXijb8spoI/vZCKDtR3Wks
         IrJw==
X-Forwarded-Encrypted: i=1; AKwUvBzFvee5OJqTzDpW+mTiit8jZo5WaY3kEPUZnfIXxfQ63j8EWU1zMjwczO09SyOhCqodr6QDdIN27AdetJM=@vger.kernel.org
X-Gm-Message-State: AFq9FYJUU3iIoKics/J2JVLDu1+3Nom21/yck6vTa7LSoo6BHwpnxOPA
	aze302A0VCZvtLKeAyQJc2dW/G17tzdgtnxZzV4uWPyfQcwwS33vaWSp+Axqb94getVu07qroPd
	hnvQXWtrfrEL8vS1jmfwjgtG9r4Bubqo=
X-Gm-Gg: AYBFou22TuLr+SCRiwjiTczv2cUIZ3iNgtws3yufyzD+leIqRD8QrS0FotP4XsKxZ6V
	e/kmdhw+u4rGhy5Virz3jVveDK7Mxf3SUJ1RmXI0V1QTtjSJu8OCC8IlG0K8OM7KOOhidhk9rSR
	6Ykgx0KQuY1ZK6FrjRbTCQknvHb7CYc/VfqTDFeu9t19KrTzBsxCuF3E+jei/+v03UjyRG6MYJv
	T5OsoEJNCE0P/x0jXXofIq81Xyl4KT/2nGHd3roSt/xoYCLEe8C2hUXPK9OJyuhWidNbEhsG1to
	L39tPflREui4X+3Xw6yo40ZGu3NbnY+KnbLc+gD/Q5J7XqIvUprJwg/MexhSTBgJPFOxEDMI+I1
	MMeicHecj2sFamoVzIcGoT7QpmPkfbRXDIm6tkg1tkQlL+lw3AT1qw/rMdLjTKfzrdVqleSGOTI
	aBpGFSLHhy1dMbxIH0DxVJtrYPKpSDaF5yiW7/gRPhbPUQPYENjv8E
X-Received: by 2002:a05:6512:2345:b0:5be:4386:8072 with SMTP id
 2adb3069b0e04-5bfb71efc33mr1010116e87.56.1792896711058; Sat, 24 Oct 2026
 19:51:51 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261024091256.17918-1-testwrzwrz@gmail.com> <20261024141157.59301-1-testwrzwrz@gmail.com>
 <20261024141157.59301-2-testwrzwrz@gmail.com>
In-Reply-To: <20261024141157.59301-2-testwrzwrz@gmail.com>
From: Jason Xing <kerneljasonxing@gmail.com>
Date: Sun, 25 Oct 2026 10:51:12 +0800
X-Gm-Features: AclHuK8kPBK2Oi4nOLhCm4MhUs2zF2fhZ4bu5005K1BW9G6XUx9rptsm45CJV3A
Message-ID: <CAL+tcoBQHudeQC+B0J0mwqbh1CH82XQWfQrtyXqVMF3ybopr3w@mail.gmail.com>
Subject: Re: [PATCH net v2 1/2] xsk: defer software checksum until the skb is complete
To: Rongzheng Wang <testwrzwrz@gmail.com>
Cc: Magnus Karlsson <magnus.karlsson@intel.com>, 
	Maciej Fijalkowski <maciej.fijalkowski@intel.com>, Stanislav Fomichev <sdf@fomichev.me>, 
	Jesper Dangaard Brouer <hawk@kernel.org>, stable@vger.kernel.org, netdev@vger.kernel.org, 
	bpf@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Oct 24, 2026 at 10:12=E2=80=AFPM Rongzheng Wang <testwrzwrz@gmail.c=
om> wrote:
>
> When XDP_UMEM_TX_SW_CSUM is used with multi-buffer TX, xsk_skb_metadata()
> calls skb_checksum_help() while only the first descriptor has been added =
to
> the skb. The checksum therefore covers just the first fragment, and
> skb_checksum_help() sets ip_summed to CHECKSUM_NONE, so the remaining
> fragments are never included in the checksum.
>
> Move the software checksum calculation to the point where the last
> descriptor has been added to the skb.
>
> On a checksum failure the packet is now dropped instead of being returned
> to the application for a retry. This path is not reachable with the
> existing metadata validation, but the behavior change is intentional.
>
> Fixes: 11614723af26 ("xsk: Add option to calculate TX checksum in SW")
> Cc: stable@vger.kernel.org
> Signed-off-by: Rongzheng Wang <testwrzwrz@gmail.com>

Please do not post patches within 24 hours; we need more time for
other maintainers to give feedback, especially for weekend.

Do not reply to the old version patch if you're trying to submit a new one.

You didn't respond to my questions. At least, discussions there are
obviously welcome and needed.

Thanks,
Jason

> ---
>  net/xdp/xsk.c | 22 ++++++++++++++--------
>  1 file changed, 14 insertions(+), 8 deletions(-)
>
> diff --git a/net/xdp/xsk.c b/net/xdp/xsk.c
> index 33475b180ea6..65be2a368325 100644
> --- a/net/xdp/xsk.c
> +++ b/net/xdp/xsk.c
> @@ -1011,14 +1011,6 @@ static int xsk_skb_metadata(struct sk_buff *skb, v=
oid *buffer,
>                 skb->csum_start =3D hr + csum_start;
>                 skb->csum_offset =3D csum_offset;
>                 skb->ip_summed =3D CHECKSUM_PARTIAL;
> -
> -               if (unlikely(pool->tx_sw_csum)) {
> -                       int err;
> -
> -                       err =3D skb_checksum_help(skb);
> -                       if (err)
> -                               return err;
> -               }
>         }
>
>         if (flags & XDP_TXMD_FLAGS_LAUNCH_TIME)
> @@ -1030,6 +1022,14 @@ static int xsk_skb_metadata(struct sk_buff *skb, v=
oid *buffer,
>         return 0;
>  }
>
> +static int xsk_skb_sw_csum(struct sk_buff *skb, struct xsk_buff_pool *po=
ol)
> +{
> +       if (!pool->tx_sw_csum || skb->ip_summed !=3D CHECKSUM_PARTIAL)
> +               return 0;
> +
> +       return skb_checksum_help(skb);
> +}
> +
>  static struct sk_buff *xsk_build_skb_zerocopy(struct xdp_sock *xs,
>                                               struct xdp_desc *desc)
>  {
> @@ -1275,6 +1275,12 @@ static int __xsk_generic_xmit(struct sock *sk)
>                 if (xp_mb_desc(&desc)) {
>                         xs->skb =3D skb;
>                         continue;
> +               } else {
> +                       err =3D xsk_skb_sw_csum(skb, xs->pool);
> +                       if (unlikely(err)) {
> +                               xsk_drop_skb(skb);
> +                               goto out;
> +                       }
>                 }
>
>                 err =3D __dev_direct_xmit(skb, xs->queue_id);
> --
> 2.39.5 (Apple Git-154)
>
