Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=170.10.129.124
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792575899;
	b=NBv6NUm/PV14x/UUcwaxda3KD0XjaPyCNaBPZZnOKKkbzADswmchBVg5TKpsOnXLYgbL
	 w5hI6z4zb916MAx99PNUDvrOmp52wNNNmAODNpzFUwzsuyH9jWdm1j1hDivo3Yby8WSim
	 X1bzCFqiiLEHIqR7NMjZLdgzi6d5wK/hqkGd0FddhsmuQKSCoeZ0geGxfG+1sbhYA4gEF
	 Dn052gZ7AyqeF1VaD6G+YSfO7iVqZ0t7DWBRCIsWzlwhXgMgl9nG+zUnS7rp/tmPmFGi4
	 +GqYj/ImjFXyLxK4PtDzYgAbVY13/w5H+mLqEDr0iqZ8B8BgNDd3Qadx4SO2JQx9hlA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792575899;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:MIME-Version:References:In-Reply-To:From:Date:
	 X-Gm-Features:Message-ID:Subject:To:Cc:Content-Type:
	 Content-Transfer-Encoding;
	bh=WTnrhlz2njHci/JTrFv5X7Hjh7ZdaN63OI8KvKNXce4=;
	b=Q3qFDR5RzBeFz1RbcS4ygssGBfHOFUw3VXbvJ63DMswDQ5o1HuV9gxI9d4lB+vpBRYi0
	 dP+e7FSPOGS5i7p4Yqa115YwTyov4Q2vjNce9bXfVqZGn3TPZiPxWBfu9eKIX5nTmF6Wk
	 D9iTeeb6y/O8svNDwP1AONKvpszO9yeF0OQCYVYgo9TBNCzTdRaxb7PyG0mLIRw7MAwVh
	 hhylRdyUk4KVT1H99v2ckwMM71GaScBbaEIu9yufT004kgozgdB2KCNfBy1HdE0lZFPpF
	 O/auBHDgC4dnJMufkvosQ9GgYgbhHVcwG9TylCzLzChJxfOvT+Aca2wtrcSlGja5dRA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=HY24k0Xc;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=ZQi3KFiv;
	arc=pass header.oldest-pass=0 smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FFC2606A31D
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 09:44:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8FFC2606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=HY24k0Xc;
	dkim=pass (2048-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=ZQi3KFiv
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1792575897;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WTnrhlz2njHci/JTrFv5X7Hjh7ZdaN63OI8KvKNXce4=;
	b=HY24k0XcpN515UNGwDTIbHkzIJ6lk+joMEC9exHja2ROLze/730tr83eU9+oDLWEaqJunL
	OtdXhyqGhAoImcdFRXUOT1ERJEV4YPWwCThSMld6YL4cyY2wdXtFObHhexq7Gfyw68axh2
	s0WEsEdblxqsS6rDHuZ2/GtsKl4hrYk=
Received: from mail-yx1-f70.google.com (mail-yx1-f70.google.com
 [74.125.224.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-495-oHl0WSFiMK-yI0CZczkmHA-1; Wed, 21 Oct 2026 09:44:50 +0000
X-MC-Unique: oHl0WSFiMK-yI0CZczkmHA-1
X-Mimecast-MFC-AGG-ID: oHl0WSFiMK-yI0CZczkmHA_1792575890
Received: by mail-yx1-f70.google.com with SMTP id 956f58d0204a3-6798fd97f3aso900926d50.1
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 02:44:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792575890; cv=none;
        d=google.com; s=arc-20260327;
        b=AojCjR7hwidzF5xSyYIuTUYUKS5GcJrthCwr+jlUFwWMzPB+GNO8P7pJ8LNIwuQnGC
         HWTTXYO37MgLTO6ihKol+Pt4TFyfMj4y+syK3R5Knm++1GARhPB7nLE2E4Vyo0yf5ZRI
         5MS4aq1cCZ7HmUyjvWHjHhSVlYWpYgJ59RVUWf7fgcq2qk/RmDCtfAmZzDe1yj+BpSN9
         6+AUsj08Vnoy+qiYE1o2Rr6IYPCpRaQlasf/9ZPcqDPolpczqWfBmy8ndu4j5idkrj+T
         Maw3wrlbHUL5umvuPd/wHaFMiXkeYw0NYCtd+yMD/ZvZdmYXTBXLRwZFZ9xyMzgS5A3+
         u03Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=WTnrhlz2njHci/JTrFv5X7Hjh7ZdaN63OI8KvKNXce4=;
        fh=3N2+qAg/V0PAgce2hawfPMdi5SqN9U3E7EZtEqiPEf4=;
        b=VKz670zrmLBiKR3RBKGqsorwhkA1iz25BhuHW3CKa2/Q+El/6zJe5bsWTt/cHEwrBy
         0dqB9rvkFJkUEIMsmKz1z0CI5qZ0gZxk2CvJbAwRW0M0JHejyCcr3aPZN7u8uWA2t3iq
         IbfV902NHG0AX+jaUYGFMx7MBQdkrvpx1lkh+j//szmVus3jiTsWWFM6HZV0EbhvLUZk
         e3HrrZCTuhjorU0kg4/beLAL8+V1M1amF7jinKd5pljWCgW5TK+gLbWXW72uWXXrw/lK
         81TatFM3P53tfa7+YppNA/gopNTq9YbsrpIvRAIhw6PFo9m4RKAJiG0qLE5lm3Gxaao+
         uGuw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1792575890; x=1793180690; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=WTnrhlz2njHci/JTrFv5X7Hjh7ZdaN63OI8KvKNXce4=;
        b=ZQi3KFiv/3J2Zvya0ZRXissRXuB9mGcamaEpY5UnT/JT/TlfTAxHc8vL6aLGp9raKz
         jaDqeW9q66l3unri6UhmdtfcmeywXvgRuEHEGNhzo7u10ClCRwnUcXCQv20zn8bBNNWp
         x2ERsErrcpLX8gfQflr1o8UtpVU+dWgC7pk9D8AVTfLuUWwBeFw1px8AWmYDxeuaclaQ
         sElWjQIt2FZO+w90nX1HR+fLqW5m5pKhytAZQhPGlk3LSBcTZPEXifhaeQcY539eOY+U
         LEjCguWXmQU3L6jlvwG10Y5N19tPlW6kAZXsNa9eBCKqKtbff9+AcfG7nDeHFuW7xClN
         PFNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792575890; x=1793180690;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WTnrhlz2njHci/JTrFv5X7Hjh7ZdaN63OI8KvKNXce4=;
        b=OrWXRv+4BkPzC4cXUWlraNH693VHliWnFnaGrnFpQgCL894bQcW76nTy4LcVmdbFm5
         9pb+9hJvAbhOcK24Qe0lmFcF4xCokwKfesc91avYyJrjlYm9LMM5/xbl6qIlrFj7exdt
         ema91D2FSZPTyrYnsvkLNi9BDVEXyp9HL4SHtvNZCcEuMMmURK9xkBe1FBQRJNvN3qaw
         8DOeZc4iiCwgEnmzNMbA8X3s6RHAbqta2ptcJoVWNpfhDibuio90y3bwpTIDtR4HN6ln
         G3T1W9YdlRSTIb53zz1O98+aA6ldWbXQ6x5NqhXVQLWP3zJMozO2BVY0dOQcvlakt5tc
         jfzw==
X-Forwarded-Encrypted: i=1; AKwUvBxwYMNeYZIuhJ1G+CySVMRSlqpsfHkl9zb2f8bryfy7xzeKobqN0cZpzGPItXd/YZxThtOm9CfYyY1ZvKo=@vger.kernel.org
X-Gm-Message-State: AFq9FYLG3E0ACfmDmPczx+aP0Orpb2x73bNDAjEHW3LiGxA2yESaLyqt
	bAq/DMsEhGcoKhFCOF62cg50C4iQnnhb3+Hnt5ieBYjkUc/ftYwSMR01KL1qFghrTWF/QKGcwy5
	pJCz96hX1lqar/DmPqlpYq+PPFqmuG5jDHpBHKHhiVuGLDXcbKzp3bMGX6yi6A6zLvDmTK1mD2B
	10vgeBR2jGkF/WRNnBWLrgeP1eMpQRYFATg5Csr3wo
X-Gm-Gg: AYBFou1i9DLTIK6dQkGeSAZw7WbvtbILZm3GFn1ejOu/VlbsCN2sxtF+ohhxLLZqMAy
	rThkMyZ/87EPxtxP7QDCMdfVyl1ZQ9KwOuJ6GU7gzMwoO3fYNaugaLAftjFWde5JWM6pJ0mO6+V
	QbTD5n8YTFT8mC3Tpi3RGAp2NvcI/td8Oi0n79k+njNFc/GVOLjVt6aNn7jNvTNpBGBhZefVE3p
	ul/ImepkBITRs92+5I7bnIyrU+/YlQ9TGjnChcNWTQ4T6L2cfPJ/CyRt2s=
X-Received: by 2002:a05:690c:962:b0:8b0:acc6:8e89 with SMTP id 00721157ae682-8b133fa1bc8mr6189337b3.11.1792575890145;
        Wed, 21 Oct 2026 02:44:50 -0700 (PDT)
X-Received: by 2002:a05:690c:962:b0:8b0:acc6:8e89 with SMTP id
 00721157ae682-8b133fa1bc8mr6189277b3.11.1792575889747; Wed, 21 Oct 2026
 02:44:49 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261020032958.1930203-1-liam@infradead.org> <20261020032958.1930203-3-liam@infradead.org>
In-Reply-To: <20261020032958.1930203-3-liam@infradead.org>
From: Eugenio Perez Martin <eperezma@redhat.com>
Date: Wed, 21 Oct 2026 11:44:12 +0200
X-Gm-Features: AclHuK_jKi01q0VmVHTsa2S8ArDqG757g4K4BNVLj8KlbA8R5_nv2rY1xUcuj7A
Message-ID: <CAJaqyWcBq4gyB3KCjjeGbrCbfsUenBWKZA+xTOOLPG-cxoHYnw@mail.gmail.com>
Subject: Re: [PATCH 2/2] tools/virtio: check posix_memalign() for failure
To: liam@infradead.org
Cc: "Michael S . Tsirkin" <mst@redhat.com>, Jason Wang <jasowangio@gmail.com>, 
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>, 
	=?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@baylibre.com>, 
	virtualization@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 20, 2026 at 5:30=E2=80=AFAM Liam R. Howlett (Google)
<liam@infradead.org> wrote:
>
> posix_memalign() returns zero or a positive error number and does not set
> errno.  virtio_test and vhost_net_test assert that the return is not
> negative, which will always be true, and the userspace __get_free_page()
> ignores it, so a failed allocation continues without setting the pointer
>
> Assert a zero return in the tests, and return 0 from __get_free_page() on
> failure, as the kernel's does.
>

Acked-by: Eugenio P=C3=A9rez <eperezma@redhat.com>

Thanks!

> Signed-off-by: Liam R. Howlett (Google) <liam@infradead.org>
> ---
>  tools/virtio/linux/kernel.h   | 3 ++-
>  tools/virtio/vhost_net_test.c | 2 +-
>  tools/virtio/virtio_test.c    | 2 +-
>  3 files changed, 4 insertions(+), 3 deletions(-)
>
> diff --git a/tools/virtio/linux/kernel.h b/tools/virtio/linux/kernel.h
> index 104abf9d1aee5..3497660c690a9 100644
> --- a/tools/virtio/linux/kernel.h
> +++ b/tools/virtio/linux/kernel.h
> @@ -106,7 +106,8 @@ static inline unsigned long __get_free_page(gfp_t gfp=
)
>  {
>         void *p;
>
> -       posix_memalign(&p, PAGE_SIZE, PAGE_SIZE);
> +       if (posix_memalign(&p, PAGE_SIZE, PAGE_SIZE))
> +               return 0;
>         return (unsigned long)p;
>  }
>
> diff --git a/tools/virtio/vhost_net_test.c b/tools/virtio/vhost_net_test.=
c
> index 566e15420bb65..3122ea0970568 100644
> --- a/tools/virtio/vhost_net_test.c
> +++ b/tools/virtio/vhost_net_test.c
> @@ -197,7 +197,7 @@ static void vq_info_add(struct vdev_info *dev, int id=
x, int num, int fd)
>         info->idx =3D idx;
>         info->kick =3D eventfd(0, EFD_NONBLOCK);
>         r =3D posix_memalign(&info->ring, 4096, vring_size(num, 4096));
> -       assert(r >=3D 0);
> +       assert(!r);
>         vq_reset(info, num, &dev->vdev);
>         vhost_vq_setup(dev, info);
>
> diff --git a/tools/virtio/virtio_test.c b/tools/virtio/virtio_test.c
> index 028f54e6854a8..9d61463f6e09b 100644
> --- a/tools/virtio/virtio_test.c
> +++ b/tools/virtio/virtio_test.c
> @@ -116,7 +116,7 @@ static void vq_info_add(struct vdev_info *dev, int nu=
m)
>         info->kick =3D eventfd(0, EFD_NONBLOCK);
>         info->call =3D eventfd(0, EFD_NONBLOCK);
>         r =3D posix_memalign(&info->ring, 4096, vring_size(num, 4096));
> -       assert(r >=3D 0);
> +       assert(!r);
>         vq_reset(info, num, &dev->vdev);
>         vhost_vq_setup(dev, info);
>         dev->fds[info->idx].fd =3D info->call;
> --
> 2.47.3
>
>

