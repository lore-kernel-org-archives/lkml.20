Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=170.10.129.124
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794831369;
	b=R0xUTC/wPHdIlZZgQTF4O5fVidUklct4OzDLLUh7AM1iDojxZzmOvmOEJ3CE28f4q6HX
	 tYYGAkTtFFEZlsZEB8at+crxIRGDEOIMQcjPXNcnwm4xDDCSnNWGU8cDeJ4jdF3blcPnn
	 xmWD5JWabuCrBN33fOh3pVUCKu8z3970pmo23uK94OBlRBpmf5bp+Y0qFK2r/hm28RCzT
	 BF3N2DDzYEkt3nbcuKxYrMgyTfw4aykOthpzzM64rwWn7UKgFaph6t7p3r0cWg6JnA0WK
	 DQfF7C+5BFqslGQy4Ex7HGi3OvouwUnuB4x92NDdkS5wqBnWLpdjwlDIOhyJlr49ilQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794831369;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:MIME-Version:References:In-Reply-To:From:Date:
	 X-Gm-Features:Message-ID:Subject:To:Cc:Content-Type:
	 Content-Transfer-Encoding;
	bh=hagfi1157KenUDCT/Gf/vwimxfuG+ZLb+Q+ggtjfRr8=;
	b=T4vMY/VE6PLeeMaSyvjp21A1Mh8DJTemN8qPN2jVM6nHDrTuWee91BdhOmkWYvkWWb8t
	 UXtRWFHZyql/iVrFS0PXXreIglnTnW6vqQtb+TS8z/fH8UsAFmVcbg0i25LDL5uq9WbD0
	 ISep9yxFnP0sSh7VHmWvqecvUaNw4lmDjuzP9pcjybpE043QhThJB3QhzigAJWMlHP+mj
	 lYhpsg+21Ztdol4T7xsluYwNTlixiboSpihnWaRd9kFg7sW4zxlDzxFMnfLnzeX+jCM7M
	 wwIx4Mp4E93Czkyr3UG8J+R7mqlU0nYPcytBanJ+FrQ511mKv2t+QmmK3lfbV8RJgFg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=LBnZiDCx;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=cCyDJ2BK;
	arc=pass header.oldest-pass=0 smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B679E606A329
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 12:16:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B679E606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=LBnZiDCx;
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=cCyDJ2BK
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1794831367;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hagfi1157KenUDCT/Gf/vwimxfuG+ZLb+Q+ggtjfRr8=;
	b=LBnZiDCxJCSDN019YTAbFmVjeXRw4sJiunSV+PuxZXApcDWfWy3tF/mEhB4KynDwBKSUvk
	YlVhM+q9DlqLhe3Do8KED4HApnxFF9I1pX8qPalYpe21S7T/JeTVWnSVPHYmeQ1EdB5ITD
	sn2j8j71s7Ti4V8i8dBqj8Zh/HjKTVg=
Received: from mail-yx1-f69.google.com (mail-yx1-f69.google.com
 [74.125.224.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-561-c9omtm-2N6WybGOPNfjccA-1; Mon, 16 Nov 2026 07:16:06 -0500
X-MC-Unique: c9omtm-2N6WybGOPNfjccA-1
X-Mimecast-MFC-AGG-ID: c9omtm-2N6WybGOPNfjccA_1794831366
Received: by mail-yx1-f69.google.com with SMTP id 956f58d0204a3-679a3664e1fso4900970d50.1
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 04:16:06 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794831366; cv=none;
        d=google.com; s=arc-20260327;
        b=DD1uinOrqzlAA00+1JYcMoL2xDgOXYxmye4bQvUTbzhS4Y0QHwVKGnAnsj/D1ycmgP
         OykugoG0yVuQO6iNAsQ5Hsd9PVx65ToYjtgW2INQ5RfWujozimDKBUh65pa4dT45L4k5
         JAefU1c8anqu2ScDTZGUHJVt3ya23g/dfgPPppDkkbjkAEx+PjOaeibXrYBXwPNBDZPG
         rpDc1ettX/uTlUDJeP9zB/FGIJovYDn9z+aizkFR2x71NKEaUCPribBaCJzpp4Ta0WKi
         ybOT3TufJbmOPwFZzi3Pmq9cir170o9nqF2SeRUG8dcRqhMD7Kl7CzQlY1yAz6XPVFZ8
         e6fg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=hagfi1157KenUDCT/Gf/vwimxfuG+ZLb+Q+ggtjfRr8=;
        fh=94x/tGiY908J2fUZCkher6jCqK+CTEwlBRGXZlEdchE=;
        b=U589b13CUEqHFjMRkSAqqnpxEAGZaaPs9qRWPrGLoo5llt8lHscyZlEnlWBdnkM2ij
         MIdFPA6I5gHO+wqw8FL+mh2cD3JP8UuJuUj0i3SXygpJuRP/QooaSxyZRjUD1JNJ4DZa
         5HPTK8GZtm3QS43+MEioSnZ/OZVzH9XURNOoxweAh8QnKF9NDxxsKAz0POawwkUmOM0i
         //K9EsHCq06dTvpA0sfERXZSaGcayd6laI3oltsr48cFDrXMxNKtN+Laj993YN0CSdut
         CzMh+LgkIxi+n83FqqfSuVyNSeNGx6CmZ/FnzldLbc3JFhxdlxxvwtflmaIjG27skrr6
         ht2g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1794831366; x=1795436166; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=hagfi1157KenUDCT/Gf/vwimxfuG+ZLb+Q+ggtjfRr8=;
        b=cCyDJ2BKwUXeOCvgUXQHo40/SyHzF1IYjR6WQVkRqMquEZUy7h6/A6lxIUef3V0/y7
         nEzxF1sDf3tCKhagtW8s7YcwQoqZ/4Ioqp3n/zjwT+Pf7d2OhQOFCw1uYGXV1s3kFSWs
         W7W57amZjOJFcWkcEMMK8vUL7At6h3ysJIXKSPQCCnaqo9fIHFjl0Huq7GkJ5D8P26Ii
         222FaIx0f/3fe2ulGadev3hlJlp6FdGBwujCw7doGgk/FLjwiVTtqt4CzSNpkFCTBGpu
         BS1ZlDXK5syaBE3dCXEImblNuQT/5rixJCUg8bia8ApSIWfwmuQw/nl0YQ9ztKorcVbJ
         39pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794831366; x=1795436166;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hagfi1157KenUDCT/Gf/vwimxfuG+ZLb+Q+ggtjfRr8=;
        b=q7EyNEihuHqIKx+CX0CjTmqDvZ/yZo75oGW3CZYxcAxJ7DgLpzPQ6zQ3ksPnxXlK16
         tfhB0MKXAUwlWnehK4wmXmRWNhUzF/ishP6NXlxM0XIxH/O3Xsxkwi+UdUiHNtvX7AeV
         Jd0WdIBj4Eqy8VRj9+EACb5oqT4xeMOHe12XJxIfi8ceN4ofCymKdmkwCpgG5x1jJEEJ
         58a1NbXkgIMJuMl09D9EVwEpuKkfd0cbzE+HV68mBY89H6Iby27OLkEzDo0S1d8OZVnr
         R8b5RlRK5JWCFiEQKLwxnUR6tRfOcKWBC5MT+mo708gDOi12um//rl0NxiHdlRUPqabi
         STWw==
X-Forwarded-Encrypted: i=1; AL+hErHHr93+PALHkdJdWhgBR963zDWN+pg3ozE+QZlXzIyWYe7LyScu4+Oex10xfVWRfDCzMmVvwW9xo3jYrIk=@vger.kernel.org
X-Gm-Message-State: APuU4Z+H//lYvDtvD7yqbI+4VvK4a5pbO+TzLJweNXheTdHbV6t2VRNx
	mo6AEoPzv3Sci7JwbH2bLcCDmQJT3UC00ep9E6F9UAhTKoAPZmJLYtzPYe9ztnOKXIPygEJ4eDh
	PjgMO1g91hAZxk9cZHadzd4O+TGuUfKroUvc+9FKidHY1kHxKnaW3Jl/Iv0E89T+UYLg5+AcTas
	hVpNXzlyjOB1X7kN0nAKMLFS94VwvKBDsUu0sO2z8r
X-Gm-Gg: AZFdTZdFpD3bbAmTEEM2muk3iYsoIcEeOIOvzTtGLrf6mSJlCm+yCrcF7joCqrwEZdI
	Dwd/gPIPqwPVcdrJcKjjWaVPOrXg19jHHi6XwemugVn2Bi9pSobA3j9EEvymOiNbASgt6HeK8N2
	efTqpD+OxZruAw5UcYB0rfriHZwjcuZuukB14IjNflmexOC352PFQiCvf5QcatFodJg9FfZHDqR
	U8/PuYsvbwOvhTNAWTPp9RLvieROU4OuZNEu2Lus/IUGigS/LVwJYUdF7o=
X-Received: by 2002:a05:690e:1447:b0:67c:11c9:2d10 with SMTP id 956f58d0204a3-67d89828203mr7426505d50.89.1794831365816;
        Mon, 16 Nov 2026 04:16:05 -0800 (PST)
X-Received: by 2002:a05:690e:1447:b0:67c:11c9:2d10 with SMTP id
 956f58d0204a3-67d89828203mr7426492d50.89.1794831365223; Mon, 16 Nov 2026
 04:16:05 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261112154927.4004184-1-stjepan.poljak@gmail.com> <20261112154927.4004184-2-stjepan.poljak@gmail.com>
In-Reply-To: <20261112154927.4004184-2-stjepan.poljak@gmail.com>
From: Eugenio Perez Martin <eperezma@redhat.com>
Date: Mon, 16 Nov 2026 13:15:26 +0100
X-Gm-Features: AclHuK9hknMzCwQmnyctLW_nYU9P8TLzSSsy1qjPj1v2VPieAeY0m88QS7tIYa4
Message-ID: <CAJaqyWdB=qZddhEPmKPOdUDALM-3M3z2OvwWq6hzfTAjETQnVA@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] virtio_ring: reject a split ring size that is not
 a power of two again
To: Stjepan Poljak <stjepan.poljak@gmail.com>
Cc: "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowangio@gmail.com>, 
	Francesco Valla <francesco@valla.it>, Xuan Zhuo <xuanzhuo@linux.alibaba.com>, 
	Andy Lutomirski <luto@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
	Mathieu Poirier <mathieu.poirier@linaro.org>, virtualization@lists.linux.dev, 
	linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 12, 2026 at 4:49=E2=80=AFPM Stjepan Poljak <stjepan.poljak@gmai=
l.com> wrote:
>
> The split ring indexes its avail and used rings with num - 1 as a mask,
> so its size must be a power of two. Commit 2a2d1382fe9d ("virtio: Add
> improved queue allocation API") moved that check from
> vring_new_virtqueue() into the new allocation path, which
> vring_new_virtqueue() does not use.
>
> remoteproc calls vring_new_virtqueue() with a ring size from the
> firmware, checked only to be non-zero. With 100 entries, for example,
> the driver would put buffers 4 and 8 in avail slot 0. The device would
> look for them at slots 4 and 8, possibly reading the wrong data.
>
> Put the check back for the split ring; the packed ring has no such
> restriction.
>
> Fixes: 2a2d1382fe9d ("virtio: Add improved queue allocation API")

Acked-by: Eugenio P=C3=A9rez <eperezma@redhat.com>

Thanks!

> Signed-off-by: Stjepan Poljak <stjepan.poljak@gmail.com>
> ---
> remoteproc still reports this as -ENOMEM, although the "Bad virtqueue
> length" error names the cause. Returning an error pointer from
> vring_new_virtqueue() is left for later; the same change for
> vring_create_virtqueue() is here:
> https://lore.kernel.org/r/20261106055635.3019889-1-stjepan.poljak@gmail.c=
om
>
> v2:
> - Log with dev_err() rather than dev_warn(), and say in the message why
>   the length is bad (Francesco)
> ---
>  drivers/virtio/virtio_ring.c | 7 +++++++
>  1 file changed, 7 insertions(+)
>
> diff --git a/drivers/virtio/virtio_ring.c b/drivers/virtio/virtio_ring.c
> index f683a2d6a200..f855b8d41575 100644
> --- a/drivers/virtio/virtio_ring.c
> +++ b/drivers/virtio/virtio_ring.c
> @@ -3513,6 +3513,13 @@ struct virtqueue *vring_new_virtqueue(unsigned int=
 index,
>                                                     name, map);
>         }
>
> +       /* The split ring indexes its rings with num - 1 as a mask. */
> +       if (!is_power_of_2(num)) {
> +               dev_err(&vdev->dev,
> +                       "Bad virtqueue length %u (not a power of two)\n",=
 num);
> +               return NULL;
> +       }
> +
>         vring_init(&vring_split.vring, num, pages, vring_align);
>         return __vring_new_virtqueue_split(index, &vring_split, vdev, wea=
k_barriers,
>                                      context, notify, callback, name,
> --
> 2.53.0
>

