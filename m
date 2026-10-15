Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CF6250AC05
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 09:45:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=170.10.129.124
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792057532; cv=pass; b=jaQx3qdQIWqt5YtOfcuUV6R6dtEnfg1jCnGaSU4Yncji1GiRcTl63p55dh5T9p5XHOqyTxd+59UM+z4u/QqVdcZHyOh+Wh8DgByNhZcymo0Fkuqplf9TQZNKUTCt5+S8D1Irhx2Ojo11Wi5XHDFJD56ZjHiu2pqzBeR+d0wFBg8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792057532; c=relaxed/simple;
	bh=hQ/O1jXrg7vtXtaXIgXlSw0Yo6Wdunyn/TqAF45Oh2k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QDSx0jXpOgRLEXS4MgI0Sal5GXKx1CpkUw92AAE8/syF1JS6wiFJeGirYN8037wR8wPogwoi7ti71B36rhOiFbYhbbKXNjYix9sEHloJrJNR9OsLVBEk1Ufv1rVThYEdXmldOkfD6+lZwOPdH9vFIjdP1YXobdZmiYSXVgKFZGs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ANE+qzCU; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=l2iRU/jv; arc=pass smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ANE+qzCU";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="l2iRU/jv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1792057528;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=t/+KZUJjxU9hKUHG/eUaO/FcCKTpYENEUj2QT3nk9hY=;
	b=ANE+qzCUspuZM0k9H6fvnqisyDMaG8ZkbZ0Zc/5a4CXBGg+Kbn3K65P/tS6Yh4kB/YObxX
	bCdPuCnPSs8sG1AqGI3uXMsf2aS6cy3lqiNv9CizJ4zjjiRK4Mc2zlSwBmZEhCzZLXoXfL
	OggnX7KVNEqyGnXsHXGq1XQ3NC92NVE=
Received: from mail-yw1-f198.google.com (mail-yw1-f198.google.com
 [209.85.128.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-677-814nvIuTNZSLjmiu624adw-1; Thu, 15 Oct 2026 09:45:14 +0000
X-MC-Unique: 814nvIuTNZSLjmiu624adw-1
X-Mimecast-MFC-AGG-ID: 814nvIuTNZSLjmiu624adw_1792057514
Received: by mail-yw1-f198.google.com with SMTP id 00721157ae682-8461ade272bso46655737b3.1
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 02:45:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792057514; cv=none;
        d=google.com; s=arc-20260327;
        b=NG3lGHAsCUjyCZIC1452UMjkPUgCGDrhKcxXl2+gdTWISXYCd+cUJPG7v7OpKpjI03
         ZGb5f9tTKPbdoxbV5tpqoOszOKRz3L7Wdz8hoe08G1vd/wVrNzHz3hWXgiZFEmXu6kEf
         LQHD2sflaBu09nlKdMpq8808To7trdAVHWwpFUM2ZKQeJeBpVQC8UMOngkwTA/tZZb+E
         3LU7xa9EGUxreRFbYbIhMPaElMN3P6jbVo/0nRWAYoClAAk5WUHZEecqXU25KJyPf/Af
         yvTHfg6rqGf59ctTteFLCwnpR3IWwdxpgWXcx9diqcZ7rNl81/9zJgPB2B5eac6LT2xa
         XQvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=t/+KZUJjxU9hKUHG/eUaO/FcCKTpYENEUj2QT3nk9hY=;
        fh=149cWARQxig0gLrQKrxhLFAk0XewSh3da6bP7NJLI3M=;
        b=eaIKZAOy12TRKxKdU5Aysek0S52pWntKBDNkLYXPtJdV71oz4ML2vgptbtsEKDU7wM
         Pa0iEhix/EBdS9lC6C3mwMCEUua+4fm3qWSc4DV3WJSsqG5a2lXtwymEL374fBUKEUEN
         sCa7jaeFHRKBeDOG/5iCgD8Hr0vfO8s/QLXK3zsKNsAQfLxp9sBTjp9X3IYDMUcHWlW8
         +qmZz9cwOfcgp++JBNRPnBL0yX1IN8mlxU8xG83WN7fUh9fOHVSypGOrOyC1FdhoKYBl
         nn/BZWL/c7jNxSqGjWt44Gc8Qa3/78ulcDZ7Eg78TBOMVUmyKpoPMEwQPlMQE5cn38P2
         CkhA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1792057514; x=1792662314; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=t/+KZUJjxU9hKUHG/eUaO/FcCKTpYENEUj2QT3nk9hY=;
        b=l2iRU/jvrxxfBZdF0B2TR119tsmjZmDimXtzaNAcmk8EfmKsvz80fj114rq2UmmGu6
         j7nfABcJjFJr2cHU6iF7Xhd5MHg7hPBCarSItA8dB0EW3Lx0nl/ky3M3W8NSN8Fbibp/
         ZKmkY5Z9cJr3EdRcVyWI0lkEEvZ70W0VJvrEjCm37gypJC6KC+xIzG+IvsE2KGZhEVYt
         aF7TG0ivSXy/OMfprDIvFK+xzzahnAr8gntAWL7XpJiaHYmKhIvyHGg+yGRRroeC72/b
         pJiNrS55EQKmMdVnOXUq6hVb2mtoiwn+EMsraQ8CJ4MaFEmE4k+OQZCxCPbHFRXlsirW
         o7+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792057514; x=1792662314;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=t/+KZUJjxU9hKUHG/eUaO/FcCKTpYENEUj2QT3nk9hY=;
        b=RyP1kNVXb7Za46a2ZQzg8uIQKrJqJszQh0BjibGKmIblqEIWEGUDhUNaHN0A7uFMUH
         fqOPMiUgqNiio/ONpJWDVzSqjCylMdNS3weHbkTuBh5ox+qp9VTvuG7P6g9VIqWkgYv0
         L0KuF685wVahEr5DYt7HVQCR9xrMvJetd1VA1Aea1cZVlYp2qK7O/yDPwTV14n+gKuPm
         bUybi8OqaxdxgnL3PjW4yVlR8GW7mcOgGf0Rs5oG53QeibFXFbY2Hu9FoOwZB2xlucWt
         D81BU+J8TWKxojkjopStCagN3sEY9lYR+Hw3ZFv0DCENDj2fXYwjPHqsHf5yXmIs8cTn
         WFAg==
X-Forwarded-Encrypted: i=1; AKwUvBwHh14vDzU5EjRpydYUCVbr1ubtBqIzKicF01GOtilC58ODJOu/gR3/Vn3sxKlhXn1XWQljsDHTg2st0aQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYIjQc9Yu0FW+6K1WksqrVE/sQjgqKay1eMcNEzi3Unk9RTymTNM
	gyQ66P4UmTEZ4OOHd926+4YBlVCObM1g8fEaZQnM7fpCYxxuVPxXwBK33eHFxOysii5sxBvvrC+
	gRPfnv/1FZlQEiGWoj413S6d98wqF4KnuuMkiN7jJVM2Y/vrkN37uZrBMjP27EpCuPaO7wsOfFC
	8JEgNCOM39RQtzSFUOirjjPlsXdhUSvVuucUPUBppp1BlIqdM3xYE=
X-Gm-Gg: AYBFou3iYihLY6C+ljegvZ88k8/ha3/LCF6dmDRbbUnCcjY9QRolORk8P+oYyH7JZRp
	HjSSeYaeyi634S3yIL9xs1vFXyWQ2doIEQo8eA7qpmOZ8P/ij0ZpydM+KUby3FabZzLZV6ocFlI
	sdEC2XbHsUFzSfYP3siahvaj3haDl4IEhWSSgwyPkLAbr6dRlO4x5t3I17mP/M9JXhZUWDYsG1t
	nR4kOzVWJkqPWKtzLxJ9HJgdAjhncMt/uK45zzmhKuIWOtCvnNjWPgvp0U=
X-Received: by 2002:a05:690c:e3c8:b0:8b0:a352:f99b with SMTP id 00721157ae682-8b0a352fd39mr45441657b3.5.1792057514216;
        Thu, 15 Oct 2026 02:45:14 -0700 (PDT)
X-Received: by 2002:a05:690c:e3c8:b0:8b0:a352:f99b with SMTP id
 00721157ae682-8b0a352fd39mr45441587b3.5.1792057513796; Thu, 15 Oct 2026
 02:45:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261015094049.107999-1-eperezma@redhat.com>
In-Reply-To: <20261015094049.107999-1-eperezma@redhat.com>
From: Eugenio Perez Martin <eperezma@redhat.com>
Date: Thu, 15 Oct 2026 11:44:37 +0200
X-Gm-Features: AclHuK-LzQXrraKcjrq2gn14rhkXoC0CRIcZZIDODKUQmzqbCXSFbFDTcemdS_k
Message-ID: <CAJaqyWeozDb=fgxNvcN7-ZYGBmAMZ1pABj=h_nv9T=4GAaSNGw@mail.gmail.com>
Subject: Re: [PATCH] MAINTAINERS: add missing virtio/vdpa/vduse/vhost headers
To: mst@redhat.com
Cc: Stefano Garzarella <sgarzare@redhat.com>, linux-kernel@vger.kernel.org, 
	Laurent Vivier <lvivier@redhat.com>, virtualization@lists.linux.dev, 
	Jason Wang <jasowangio@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 15, 2026 at 11:40=E2=80=AFAM Eugenio P=C3=A9rez <eperezma@redha=
t.com> wrote:
>
> Several headers related to virtio, vDPA, VDUSE and vhost were not
> covered by any specific MAINTAINERS entry and fell through to the
> catch-all THE REST section:
>
> - include/linux/device-id/virtio.h: not matched by the existing
>   "include/linux/virtio*.h" glob, which only matches files directly
>   under include/linux/ and does not recurse into subdirectories.
>
> - include/uapi/linux/vdpa.h: the in-kernel include/linux/vdpa.h was
>   listed under VIRTIO CORE but its UAPI companion was missing; the
>   "include/uapi/linux/virtio_*.h" pattern does not match it because
>   the filename lacks the "virtio_" prefix.
>
> - include/uapi/linux/vduse.h: there is no dedicated VDUSE section in
>   MAINTAINERS; the driver lives under drivers/vdpa/ which is already
>   covered by VIRTIO CORE, so the UAPI header belongs there too.
>
> - include/uapi/linux/vhost_types.h: the VIRTIO HOST (VHOST) section
>   explicitly lists include/uapi/linux/vhost.h but omits its companion
>   types header.
>
> Assisted-by: claude-sonnet 4.6

I forgot:
Suggested-by: Michael S. Tsirkin <mst@redhat.com>

Also, in case it is useful, the model looked for all the potentially
missed files.

> Signed-off-by: Eugenio P=C3=A9rez <eperezma@redhat.com>
> ---
>  MAINTAINERS | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index f53047aa8d3c..9f85882f307e 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -28903,9 +28903,12 @@ F:     drivers/block/virtio_blk.c
>  F:     drivers/crypto/virtio/
>  F:     drivers/vdpa/
>  F:     drivers/virtio/
> +F:     include/linux/device-id/virtio.h
>  F:     include/linux/vdpa.h
>  F:     include/linux/virtio*.h
>  F:     include/linux/vringh.h
> +F:     include/uapi/linux/vdpa.h
> +F:     include/uapi/linux/vduse.h
>  F:     include/uapi/linux/virtio_*.h
>  F:     net/vmw_vsock/virtio*
>  F:     tools/virtio/
> @@ -28979,6 +28982,7 @@ F:      drivers/vhost/
>  F:     include/linux/sched/vhost_task.h
>  F:     include/linux/vhost_iotlb.h
>  F:     include/uapi/linux/vhost.h
> +F:     include/uapi/linux/vhost_types.h
>  F:     kernel/vhost_task.c
>
>  VIRTIO HOST (VHOST-SCSI)
> --
> 2.56.0
>

