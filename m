Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=170.10.133.124
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792567808;
	b=HbOFDFd1RNmVBimhM4z3/6KqehGsxh5KzM9Nz7NwnlmCVkEA4raHskWJ2fZ9JJ3mrlJ6
	 MKCFZL4p5/jskksaVbENF10B2iNjA2P/zQ4x79VuRpWMxRW1J9/B8UrwelAUSUM5lP1Ul
	 VLnlougx+qtxwsq3xa2eWufDvRI/TRlupxhprfKBh9wQ4lV9JsMf2VNXZhDxKar2AZ9t5
	 VZqv2QzCr8+egD65YIth/gSFmPXPnggUb5FuqOo7P4KKCnloV6QFEPwZb9d1w/TpS00Ho
	 iqSROIK669zvHKZl5RqWVrO/Hx7GIHR/NFIloGXTOsLgV9pcWY6MSM/cdlIxv4Wt0hA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792567808;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:MIME-Version:References:In-Reply-To:From:Date:
	 X-Gm-Features:Message-ID:Subject:To:Cc:Content-Type:
	 Content-Transfer-Encoding;
	bh=ruNbPegljZ2HSbDe2VgJL7losQAaVxHulyE93NG9OdQ=;
	b=R3XdwlrxBpLgF9dyaL+gaFVzGuSerSYkAxmJs64pTA9ice2sRpxxBmefKSad94kWHRjJ
	 OJODGcjLntLghCLS5QGxDPvniiTkN4jCMqFKe72iFsO5av/Xh69CMT42+bK1ODdAKVRMO
	 pqICZSkzibC2dU35aScGS3MxKr1I25Agw900e3nFHOiUxZjIrnJSYWbP61OQH18uqG6kG
	 rlWZIIYdoqIGmC5FgS+M9R5egGOvt4n6fk7UuHqG82bjMeiHAQKcPJrj33zOFn1Jv7fu9
	 bibkLJYNFsb5+HJYE9CVQTHaUn8a9IRoDE8fB89fRp0hNW6wuWXqhhkF0ElEFfF9dLA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=iSbFvEFP;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=iPKj99OK;
	arc=pass header.oldest-pass=0 smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A8C1606A31A
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 07:30:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0A8C1606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=iSbFvEFP;
	dkim=pass (2048-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=iPKj99OK
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1792567807;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ruNbPegljZ2HSbDe2VgJL7losQAaVxHulyE93NG9OdQ=;
	b=iSbFvEFP3jYrOvDjujAZL/JHLZ0nHSPvWkMtEdoZ+hf30gLgNkUfk5WMwi4pQZ0QoXIeh6
	tvFZHcwvc7PiBlFvEpVRZ+6F3M0UTYob6Cdi+1Tv8Zzkgf7jE/x/qAVYGjXmeYn21z+wtC
	1WRBw/qwGmsHRZ9njMErbqQr84C94Es=
Received: from mail-yw1-f199.google.com (mail-yw1-f199.google.com
 [209.85.128.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-458-ysBFTMrKM-yjATWAdjEeUA-1; Wed, 21 Oct 2026 07:29:59 +0000
X-MC-Unique: ysBFTMrKM-yjATWAdjEeUA-1
X-Mimecast-MFC-AGG-ID: ysBFTMrKM-yjATWAdjEeUA_1792567799
Received: by mail-yw1-f199.google.com with SMTP id 00721157ae682-8afde3fe132so7411597b3.0
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 00:29:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792567799; cv=none;
        d=google.com; s=arc-20260327;
        b=sd0ars33Y5uHRm2cC/zNnrinYxH+a8DSpWmazk3Apaz4LGXuW+NKJK/8RYmbG9ahDw
         X/OOrAXxROuQNr2Bxs6WC+kmomRfI5LRs8p2X5EDRbO4nR1SB98a1I7TKnD30wEgYZf6
         IoXAl0V5Dd7hmGKjBySW7lzQLnJaJ/hwfx4UVL/Xv1YNNu3NWXET7o/EnR8KniQ1Ckir
         16EtaFfN1mnbrwZkzJZBSTKxmeVj2AsiCJPKldRiLL8LwH4/du2YeokpNmSc7paBaUR0
         2fgYJOAhIMGxrfMDoEyj/DiOHfl2e5J4lGFEx+Z+4MFppw+S57/CfTAUYiB7sUtWMkY1
         pqwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ruNbPegljZ2HSbDe2VgJL7losQAaVxHulyE93NG9OdQ=;
        fh=65MXG1RHxTZdW9cWY8XxCbV613VHptnd2j04Wyml7aM=;
        b=M7RbLVSs5xLt0GIgB1J5CgIIP7QTTs5ATAJ+Tp0kRtFD7cWKEmrknsGX7DKNVG1ARj
         afmFkFMo/wV/WT6kw99aw0pFKNpX1I5W3FwseI00IcWH8gSn3nOLhPUtUmz+udxZ7Cj8
         64n7nYmNa2E5jLThQJFr27pkxGytFSuD0eSjTJOhD6I7PrPUfm+mCkZ8dst/WHTnqqk8
         GAunsypA+fp1rqDsCQtA5mivHsPzk4Y0likkU7lmb6nlNL3uckmq2D962SC60w1VktS2
         c/ypfMqZxcS3dgZe0dl3Zb6pAN2GFy1Y6h7ptJFwsc0n4CnsoxBE4TFjRi3K2QZseLr/
         8TtA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1792567799; x=1793172599; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ruNbPegljZ2HSbDe2VgJL7losQAaVxHulyE93NG9OdQ=;
        b=iPKj99OKCYBLxKoFRZQf2Hg6XfmZny80yGZlMAmrHp5kx5XGo0TgWwOm1D8U1+QkFs
         UERYQore2pDeV1iNLK/bRlznsPf785W4T+NrHK/BAf18mYAiDfpZM/nVmxT27tawAbFd
         XsQVcFDBnTpT0wR8MAtQ9B/oS0eK085+i7rMB0YbRIyFnv7lD6qH+ZNDHWZeuKxmXnri
         EboiCCaMxHi9C1T91+RZpQUHX2EfDuCBuWDo7KFZ7OLZdbcK5IpbHsC4PpR5r5GXnYzx
         rT1z5IzF+foNu4wQnWwAjH9ek8D/VK41l8kXhSuAsNfYzEv/SS3IVpywD7hRuiA9z/rL
         AJIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792567799; x=1793172599;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ruNbPegljZ2HSbDe2VgJL7losQAaVxHulyE93NG9OdQ=;
        b=gnAUTjdK9zv8T61CB+7Q9ZaqveGd+4+xFJIgkeAtgp2S99GZsZ3RqiB5VF2pZ7w37v
         HcDmpYAJDRDtI1U0C/ztVkBhQIr0e69VIE7aJDIUmWXrAKxLSOVXPJI4RJIFu93IvTwT
         4dnWqdaG9+GgixjWnAsGLopMQ7Nzjp9NnUcGrBFT8rNGjKEzqYSJl2S0qkfIzWm82S5C
         70EsKsM26QnQuRqzn7lxa1L86spn9ppz6hUGeKA9ZtId80DS+rFqQvRYK7O9LcX4pBen
         DWE5Tt/sEZ4Uk8PsG7Bj8Ybx9g6swbXjOSldV6WV4OQ/1msK1oK8az3bStt60V8OalyN
         QhuQ==
X-Forwarded-Encrypted: i=1; AKwUvBzsz4apegacI68FMG8GAVoNQMcSiUWogjUSpTS7NBhPskwzkGw9F8PkQ86c3djMRUoc05kVnp8dD4UvLcE=@vger.kernel.org
X-Gm-Message-State: AFq9FYIpICbC8ZDGssQAgsTL+T9ba2x+yZxDdjBbvLWkSFVHs9PCJxK/
	W63rPSbv2GM30mmeU+WDKLKESRlAqG6D52WoPx/57lV+pAjsQicSiDiHBBEfbpet2WAkAiKrXFH
	rOPEo2e9MkIRcpqNHKwXMgalCLu5Y6cmfLYZOfso+hmhPaA0XeNNLT6MA852d5fxGHpa28odwc3
	0LvH4KYSEeMArq1xcGJnFYhuWrh4T2biHB/DUJdIcY
X-Gm-Gg: AYBFou2vZLLvd02iBUrgml1T3Ibg3zNq8nknx9aWt8ec1vgJW5Irdqkkcxf6TrQbQfT
	I1oQHtjWoESSe20LFGl+XfFp0s+bePUt5EWbwCTpcwpakfcZUL9zlXgr7cpt/MiLw48Odkjg6nH
	krNZfErh3TMNrUXQAxVxWyyWP+OtFaPiaVSQ3PdrYyJJa1nykIMBvHXs+yPoH7AVXArAqS9VmDa
	mcqd+X43OO8lfGl7cN9LDEXYqelCbAt6uzgQeUYdXlpHbrlr+L9TM+mAzk=
X-Received: by 2002:a05:690c:a909:10b0:8b0:e238:2719 with SMTP id 00721157ae682-8b133fff1d6mr5006387b3.31.1792567798913;
        Wed, 21 Oct 2026 00:29:58 -0700 (PDT)
X-Received: by 2002:a05:690c:a909:10b0:8b0:e238:2719 with SMTP id
 00721157ae682-8b133fff1d6mr5006297b3.31.1792567798485; Wed, 21 Oct 2026
 00:29:58 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261020232956.99970-1-fangxy@xiaopeng.com>
In-Reply-To: <20261020232956.99970-1-fangxy@xiaopeng.com>
From: Eugenio Perez Martin <eperezma@redhat.com>
Date: Wed, 21 Oct 2026 09:29:21 +0200
X-Gm-Features: AclHuK-PqFWCN8ST8zFxglfpmVJtYh8ceAExLMaLATIvJ8UfZfghlr_8jg8ahUM
Message-ID: <CAJaqyWdoQXHiWEh6aCGt7T+U4U4S8Z79hhp5=QYzzkODeDVyOw@mail.gmail.com>
Subject: Re: [PATCH] vhost: fix used ring index wrap in vhost_add_used_n_in_order
To: Fang Xieyan <fangxy@xiaopeng.com>
Cc: "Michael S . Tsirkin" <mst@redhat.com>, Jason Wang <jasowangio@redhat.com>, 
	virtualization@lists.linux.dev, kvm@vger.kernel.org, netdev@vger.kernel.org, 
	stable@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Weibin Liu <liuwb@xiaopeng.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 21, 2026 at 1:30=E2=80=AFAM Fang Xieyan <fangxy@xiaopeng.com> w=
rote:
>
> vhost_add_used_n_in_order() advances start by nheads[i] but wraps it
> with a single subtraction.  If start + nheads[i] >=3D 2 * vq->num, start
> can remain outside the ring.
>
> With used-ring logging enabled, start > vq->num makes (vq->num - start)
> underflow.  log_write() then sets bits beyond the dirty-log bitmap,
> potentially corrupting adjacent userspace memory.  This is reachable on
> the vhost-net TX path with VIRTIO_F_IN_ORDER: done_idx can reach
> VHOST_NET_BATCH (64), triggering the issue with a 32-entry ring.
>
> Wrap start with a mask to keep it within the ring.  VHOST_SET_VRING_NUM
> enforces a nonzero power-of-two ring size, allowing start to be wrapped
> using & (vq->num - 1).
>
> Fixes: 67a873df0c41 ("vhost: basic in order support")
> Cc: stable@vger.kernel.org
> Reviewed-by: Weibin Liu <liuwb@xiaopeng.com>
> Signed-off-by: Fang Xieyan <fangxy@xiaopeng.com>
> ---
> Reproducer (verified on a kernel containing commit 67a873df0c41 with a
> temporary WARN_ON_ONCE probe in log_used(); the probe is not part of
> this patch):
>
> With VIRTIO_F_IN_ORDER, num=3D32, and used-ring dirty logging enabled, th=
e
> TX batch reaches done_idx=3D64.

Can you send the reproducer? I'm very curious about how vhost_net
reaches to done_idx=3D64. It seems some bound needs to be added there
too, isn't it?

The patch itself looks good to me, even if we will need to modify it
for packed vqs, so

Acked-by: Eugenio P=C3=A9rez <eperezma@redhat.com>

>  In the observed run, the initial index is
> 3, so the single subtraction leaves start=3D35.  The resulting length
> calculation wraps to 34359738344 bytes, as confirmed by the log_used()
> probe.
>
> A 64-byte canary immediately after the 512-byte log bitmap changes from
> 0xA5 to 0xFF, confirming the out-of-bounds write.  The used-ring canary
> remains intact because vhost_put_used() runs before start is advanced;
> the demonstrated corruption is in the dirty-log bitmap.
>
>  drivers/vhost/vhost.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/drivers/vhost/vhost.c b/drivers/vhost/vhost.c
> index 44cac11b68d2..0226c4c59709 100644
> --- a/drivers/vhost/vhost.c
> +++ b/drivers/vhost/vhost.c
> @@ -3172,8 +3172,7 @@ static int vhost_add_used_n_in_order(struct vhost_v=
irtqueue *vq,
>                 }
>                 start +=3D nheads[i];
>                 new +=3D nheads[i];
> -               if (start >=3D vq->num)
> -                       start -=3D vq->num;
> +               start &=3D vq->num - 1;
>         }
>
>         if (unlikely(vq->log_used)) {
> --
> 2.50.1
>

