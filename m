Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 669B33DDAFA
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 02:18:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789093090; cv=pass; b=Rxq6v1lj+Brug63cpfZ7BcDd9NEV/6RFy1U1jT05b4S3LEz2ChzBbVtJNueWgyuXKyQPmyDXuN1hwXEbVsDXtzMZqF/AlpjWsqXaa2OciAJtYApgDzORIAe8iqem88/ObmySunS1Y8NflrM2aEXOXGQqM+SUf4WL/1x35uewX0Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789093090; c=relaxed/simple;
	bh=fSxVRMq132kOj2ATc0wCqEK6btSyS1N+nOlxjKOO1SI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=B+rtvo5v3UWux1szwv44nkIkMAT5XQBS0DHS+/592EcCkQoIBwTiO2qzDN0mo+C0YRUZ6qRJqrk30KwW0pOVuKhZHlWYBRGVdRnDhp3j57qQjdgtm73qtU3YU0CqFsxFNC10Lq9fhVOGdjy2F0oYbnxlXt2LHOvQ9IsU7vZA47E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NsqziPQm; arc=pass smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NsqziPQm"
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-6a9bd4db6ccso78634a12.0
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 19:18:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789093085; cv=none;
        d=google.com; s=arc-20260327;
        b=Un3qnTvAUCBDGSRZjSI+9yGj9qVJK2ty2/qX8D3TmfLWDngpzWXFpDMYnkKaOoP/fZ
         QlC6SK41YZASyBWvSLINDO9nb3DiI5+3GrmxVlyRJFAiE6JtxxzIa9F85xSDWOu1aTJI
         giVlf80Cm47c/3+SlVuI1cEuOutX25yA/NNrgQEfWBL/IETMXInngs2TH91gSGVjaFEn
         m0wsTaC/nZ2CfvddHdKX7XzXQ3MUj5Fio0BPyq5hF44CCrkXyetnueK6TjME2/nRHJWE
         FUhhyQkhdo1702mQ9bwqWL97NR4vbe1L6c2zYdpNo2ykm7gChQyaob/TUTIwiMAxvQiX
         w7ww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=VOf8wCMzpNS46oThIuz/r1xf8XxutZ0hada+Stru3rY=;
        fh=yokjfeV04BPpbMZdYhvuR0KDhk3sYz/sAWzMOqJ3TPM=;
        b=ZgtfAh2rytzslKd/Y+wIUefIXUVjuWg157AnURTMU8DtXfbEiEiBHyYel1wu8sJOsq
         PnwldkM9Di9dokawE3q+ghIbeamH9Ii5loMal5EYMmjtQSfQRcDglpzYkhGB2kZz3qPp
         pH6g6IQGU1FtN0wqBQ0cXJl5LBDT1zWw3SQP7qhIA+aKEoc/fS8PKD/9bBsF5dV41noF
         +Bov9FbU71cvEZbvidOEAKZg5osaKw6FBI7JOOudYPOzrFpzDz4AY0pRvhXVrJ+L/uJA
         /h9O4B3XYdM1l+1q8KQJusSb3xpmla7CKOUoI5AKhhLhlbumB2Su0rHRto1GGFCLf8f7
         ZK+g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789093085; x=1789697885; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=VOf8wCMzpNS46oThIuz/r1xf8XxutZ0hada+Stru3rY=;
        b=NsqziPQmRuJ67Y6R/gAwrBmusYWrnskSOcW2fT9HKv3YIxm+42/0vmQuPpv6y7ZK78
         SoTLP5HIg4F4ovhmX2xps++NGUHJFkAODl7+ffhhoB7TaYADqoYZ7mWXEmWSi0lwYX1f
         oDpNgQOqPHiKUwqAphhIHEFXZQBKw/biKla0JfgRgFvX4Vmv3MQwjMN4CHzCzI3tVRLs
         EMZllASCQ+6tGhkTkGIdaQPLPRk4IwuoLwL8aJwh89begODF6ggrEhOekXMsySi2+87F
         cMGVC82Y2wEQWTiQ5g/2Jea48SzOrhn5G362BWsMiB9kvBYDJMHRSi5XKfr1aJZoVHoG
         nhHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789093085; x=1789697885;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VOf8wCMzpNS46oThIuz/r1xf8XxutZ0hada+Stru3rY=;
        b=R4yEVX4opqhbFo8tZ+8uvN+DYe1ycPvTLMn1LjGZ8gTITfSvq+vUmzbgrkhdrxDjLa
         Dv4/6cPZozIjVQ+foYTADHM7wR17SaShwlH2w+aRMc9VWa3HM4PCfeSJO9aRxItp2K05
         MmjmP1MGAiABqhW5DfS2O4t8PoBTu+dUdNzOHG0SuBP/VSYzh++RjjWhZehB9Yqf6Vrc
         n22ljtOVIT7YqRu6BKatXgsZB6ry63L4fUsktbfKhyP8oe/DRUevEsvVfBZdwrfxCHKa
         Yx2nVCWM/1H7goyGy4U1sbCttvsQ8zX12qJ0jTRxV+L1LGtc3dspNUtCubegv7ch9V+a
         Zz4A==
X-Forwarded-Encrypted: i=1; AKwUvBxOtrPingJ771EnfT5aIqzDOcVIZ2LTe3au0lD2Z8CFGNB53FlM0U98QErGnPVKpCYTwR1RRKwXnyERNY8=@vger.kernel.org
X-Gm-Message-State: AFuF++nUknfMz7JGV8X2K8ivO6cssH3fF0H30cAypa6V0N9tBc8RlHiT
	oKd60ykTdsq0tIdJrFQg9m5irTOaILxT4OcBIdlBV3rs7Kon6TTGFEuoxFwPZrY8xbtdrocTAQ9
	GBlo2D2rMpQLDhRPcvWN2E3BnAXjZFVIioHLb
X-Gm-Gg: AYBFou39tCHhrESO86AwZ6qOg2u5ixCiHYavEmXCEKFDl/Hzz0em6huPn1TVXIUHqkf
	RIKQu7TEH3k2EEdhj494YBOKPBtnTIT1foGzP07EpKiGpd73RQlcZ/KsLSpVJ3vcSjsjcJ74wbj
	m+5PYGgWEuQYiQEVVJ9guHxmCGUZE1bTFXhDbscHY8s+ZbNzc2TYLNmGSIo63LGLIqISTUE4Bfx
	/Qe8PZW9Y+NXokfMqoxv2Obbpybx3KL6F0NVH8VCTegloaBTpAqz0vK6zQaTvMQoFSM3p/E7QLU
	erj4BjvNeVewuYfOwdLK7T/w/N1ZMWB5gXWSyfttKM4L00lLotmxQQuNq2arRIGk32mbeiLByRC
	ew4Ejzz7k3bH+ZnNTQcohqQ==
X-Received: by 2002:a05:6402:434c:b0:6a7:ee54:f89b with SMTP id
 4fb4d7f45d1cf-6a9b56b92aemr845829a12.31.1789093084498; Thu, 10 Sep 2026
 19:18:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260910123903.1717-1-lirongqing@baidu.com>
In-Reply-To: <20260910123903.1717-1-lirongqing@baidu.com>
From: Jason Wang <jasowangio@gmail.com>
Date: Fri, 11 Sep 2026 10:17:52 +0800
X-Gm-Features: AcwNN1Vwyl3IOS3-AfXLFBbOtS2xium60bWgjIdD1Wj01boHjLIsh_FiFaULx-Y
Message-ID: <CAAf7B_M=tfyL33WGkxSX68FwPaRRRBcASVx92EGwPMXaFtUdzQ@mail.gmail.com>
Subject: Re: [PATCH] virtio_ring: reset IN_ORDER state in virtqueue_init()
To: lirongqing <lirongqing@baidu.com>
Cc: "Michael S . Tsirkin" <mst@redhat.com>, =?UTF-8?Q?Eugenio_P=C3=A9rez?= <eperezma@redhat.com>, 
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>, virtualization@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 10, 2026 at 8:39=E2=80=AFPM lirongqing <lirongqing@baidu.com> w=
rote:
>
> From: Li RongQing <lirongqing@baidu.com>
>
> The IN_ORDER feature uses additional software state to track the next
> available descriptor and in-flight descriptor batches.
>
> virtqueue_init() resets the common virtqueue state, but free_head and
> batch_last.id are initialized only when the virtqueue is created. When
> an IN_ORDER virtqueue is reset, these fields can retain state from the
> previous queue instance.
>
> Reset free_head and invalidate batch_last when initializing an IN_ORDER
> virtqueue. Keep this in virtqueue_init() so the state is initialized
> consistently for both newly created and reset virtqueues.
>
> Fixes: f6a15d854986 ("virtio_ring: add in order support")

I think this is needed for -stable.

> Signed-off-by: Li RongQing <lirongqing@baidu.com>
> ---
>  drivers/virtio/virtio_ring.c | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/drivers/virtio/virtio_ring.c b/drivers/virtio/virtio_ring.c
> index db678f5..d0dc464 100644
> --- a/drivers/virtio/virtio_ring.c
> +++ b/drivers/virtio/virtio_ring.c
> @@ -559,6 +559,11 @@ static void virtqueue_init(struct vring_virtqueue *v=
q, u32 num)
>         vq->in_use =3D false;
>         vq->last_add_time_valid =3D false;
>  #endif
> +
> +       if (virtqueue_is_in_order(vq)) {
> +               vq->free_head =3D 0;
> +               vq->batch_last.id =3D UINT_MAX;
> +       }

I would try to reuse or refactor virtqueue_vring_attach_split() to
reduce code duplication.

Btw have you checked Qemu shadow virtqueue as it might suffer from the
same issue.

Thanks

>  }
>
>
> --
> 2.9.4
>
