Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3ADA3F6610
	for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 12:48:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=170.10.129.124
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787748494; cv=pass; b=Z3JXqTufM+b6sh2/JEpLQwbUqex3h2Hgv0GL87oNjfCdzlTvLTSKLJjR+sHXcyxkIVUznlfxLqf7FYuumU6ImCUGHwpNFfbeKMXfZhI8vosI1yqSgTS8TIsQzMfmHaEQaTNkjeFnm1eD3hrkbu59KL+Veg7eaz0t6VV9aFWes9Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787748494; c=relaxed/simple;
	bh=mkg4QtfwwYq+ORlh9nX9VTEW1ZKT45yMar29IcyWmQg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IpFTR3c2suHQww0FgNi/jnEbhq1l7wfcH1Z0xGXdwzjYJEWFuHj3uP9Up6ZSSIwV32TIfuzaF9qY4r7uij7VicV/0E7Yh6B/aX9PQ7LGAYH/8d+T85I4K3dNn6O4nweTLpOP1qdPY7zdHvfKNIQhmz/GTP+okTGdiwtgnnbyIMI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=BOn/Puhg; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=SiEyz307; arc=pass smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="BOn/Puhg";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="SiEyz307"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1787748490;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=oXf2T/BqatZTg+2wDJYVSXJ3LOzaGDIbEOiIluWNByM=;
	b=BOn/PuhgvvgdA3amw9yIBpD89ovCfj8UYrPhxeMigLWjxYV/3vG/WFy0RJptXp7WzkID7Q
	0kzy44QjqsxISOJ0wu77UUzEA0jywuY1TOkNZuKMQoZTEsauKTkA0ZiwSe9+UdAFy+pQwx
	5QmQPw0nqDj75cVhtXtVWWYnfktyPtA=
Received: from mail-yx1-f69.google.com (mail-yx1-f69.google.com
 [74.125.224.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-573-BPTi7CAuPpS_auQcPdtAiQ-1; Wed, 26 Aug 2026 08:48:09 -0400
X-MC-Unique: BPTi7CAuPpS_auQcPdtAiQ-1
X-Mimecast-MFC-AGG-ID: BPTi7CAuPpS_auQcPdtAiQ_1787748488
Received: by mail-yx1-f69.google.com with SMTP id 956f58d0204a3-66c70eeacd7so1364003d50.1
        for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 05:48:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787748488; cv=none;
        d=google.com; s=arc-20260327;
        b=P8E3LlCHiPW7DMafe5zXxNK4BLCu+IUGUMZtO081BdO52zzcZJJs1682bvqB9/KNWO
         0gN5IjVid8S7ih0F+Gd4CODaIfpMuEWe6SrOSufHnW6+9yGXhkhfCc1E/2WaINzZiB9C
         P7ngHJfQqChbjSIPmHYRn8wKqL911hT9c9Zri8UakCo3/iSClYKOVM8lHkx+JJC7sgPT
         OLSJ4HmM4kL1Rh+il2KdJN+eS7dqoaNiXJnMTQ06paf64S0YIJyTPxXJgvACdowE45vs
         1e1CoTLN5K7O6dfwJL7ZNWQ/Z/EIywnQ6ZtlKdxnAyJUd0ddyZIjrjQI7n82fueN6IMd
         t+gA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=oXf2T/BqatZTg+2wDJYVSXJ3LOzaGDIbEOiIluWNByM=;
        fh=sy9qnoWClMTG1AqQY9U+7pIYWhIypcV+z+xh4IS/VIg=;
        b=sYL3P4EpP7Z8x11evL7ydU9nXAyzOaH2TFnWGFeetC0EmUssjJYIQQmRuWvSngi2++
         rezmqo4yK6xS7P47ZTsQN6rjHr9NbKLG/v4Mr/g5fksaP/v3huKC9VnjE6arHJ9XW6pd
         0cPtQgk3UaePa3BTYKCITIB7mwixIlaQTu3YhE1Q8mA2P/PTRpF+/0OLai+Y+pOiYxWt
         kyR1zbAh2I+gDIimfKgcHeVX/SGNkie/a2MgFpLVI/1g8+Gr1LAo27YF3OxPuzbHjsIE
         C4wcsBOKPkRHQJQeQmcdC0wkLgNDlbaDMXweG3ghU/UlZPWSvIRXEZFnGb7wAV5D+4fQ
         aMzQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1787748488; x=1788353288; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=oXf2T/BqatZTg+2wDJYVSXJ3LOzaGDIbEOiIluWNByM=;
        b=SiEyz307zmSXHZEpstIzCdnlOqthy78iBVXKXWwEbTMdnUzswsOmLUeARejpGiSqvF
         koaMugVkoE4QMjbbx5r85BjWRSlUzYxGHmy3dn2jwMrmjThtcwdgaEUWBr52uEDNHYMT
         f5Ut+LsopOuidQ18P3Anbmu9N9hlHLEfggkr+H+u4XpIkRNVP1Uyu+NZd+s2r9RKGoM6
         ru3zHwU0MBd/XmMe4DkYsgw7kvp+qdLDBoG4YlZNxymYcS2ZJMDwGm9ukKOfbE305vFb
         v5McYIXx041HSQLkWsmHIRMQaeaWN2BcRv2f4WrxKqDppsWvDCjUw/sJJwDFDw66IjBY
         RKHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787748488; x=1788353288;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oXf2T/BqatZTg+2wDJYVSXJ3LOzaGDIbEOiIluWNByM=;
        b=or0dsTV3xIJ5s5TcQp31w/P1kAAWfrOTab7V9EmtYi8Atontlgb08ovFdZL9MJcELt
         oFDLBh4kucoeE9lmMqOPjW12ZeslccPv+W0PFn6CbajdEnPGE5sPgGcEnZ/OP9IPS+O2
         bhPpNLpH6ZDwgqMMmTi7tUyIEBLWo18doACwMsCjSu3hHCdlF6D+NqeHkA4khDkg15iq
         pO0l3wL3BiBhy+xKBOTn1xh6D5IQjm9cQpm7+nUd0EoGOirFkkCnF7fWVOV+lCgL1EfR
         MpKWTc0xodBP3BNA2tVmBpBtpog5UgX/+npPrJTLqutkUFyGkSQ52WU7Di20Mgt8Y2Ks
         g1Bg==
X-Forwarded-Encrypted: i=1; AHgh+Rod/Lat7m7NHZOudxie17V7XE5WfvmGMlg4iS/KYwPIx/sx5YfiZK3gEBTjKHHj+sMnvtr6e12LXdBYNqo=@vger.kernel.org
X-Gm-Message-State: AFuF++lIVuBktNwwZ8pwaAQCt/yNNNXBN2ebISue57WLCznhn+YFbnCf
	2rQKkY3h7LOq9nh/sqwkF+3sW+72amIxgg4IK7KijtLoMDjhKLuI/EfzWDaerHRdgBfN5Dm8WUT
	Mud+gV8rjdGEGRRqKKnLmGAxPLqopXQ0IjzMy+hQetAVUgU1d8arQKoN7S08QI7GtiUJRH8UclT
	JOgT5F8SPUELgWc4yv1jFt7TyC1RxxLakVR0OfhiQU
X-Gm-Gg: AR+sD13o+fyI+yjbEjRLPQnByZOujjoUcFNDjxUNrqik6ta7GD37R+lW7plNXkS1BTF
	P+uGt9l9rx4lpphDhH0bg8Y6yw/g1c+iFTBRaCM/X0/QpsiO4V3z3Pp7qNruwRqvdpR+EOs8gnN
	W7Tzzr2iT7KBEw3hLNroXxZj2OsIgxdFPSa3Vii4vgY6cf9hLY67cEaQ2Sr6kn4EXY+AvsxwmfR
	51rV3M4163ssfrD9ZFn7/LKokHgpHZoL3H+aMvx8igovzOOF94fTA7xjhs=
X-Received: by 2002:a53:b1c3:0:b0:667:a284:2280 with SMTP id 956f58d0204a3-66d257553bbmr1814835d50.31.1787748488338;
        Wed, 26 Aug 2026 05:48:08 -0700 (PDT)
X-Received: by 2002:a53:b1c3:0:b0:667:a284:2280 with SMTP id
 956f58d0204a3-66d257553bbmr1814777d50.31.1787748487508; Wed, 26 Aug 2026
 05:48:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260818211425.91009-1-graf@amazon.com> <20260818211425.91009-5-graf@amazon.com>
In-Reply-To: <20260818211425.91009-5-graf@amazon.com>
From: Eugenio Perez Martin <eperezma@redhat.com>
Date: Wed, 26 Aug 2026 14:47:30 +0200
X-Gm-Features: AcwNN1W8ysCimXnJZvwZvGr-gYddX4GyUVQdS7mpv4OZzTkI-4qi7uKvuCVZlWA
Message-ID: <CAJaqyWeGaoamHzYRd1ZVUJ+6fx_4RWDim+jLO964qKtgZ=zogQ@mail.gmail.com>
Subject: Re: [PATCH v2 04/12] virtio_ring: return -ENOMEM when a packed ring
 mapping fails
To: Alexander Graf <graf@amazon.com>
Cc: "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowangio@gmail.com>, nh-open-source@amazon.com, 
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>, Halil Pasic <pasic@linux.ibm.com>, 
	virtualization@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 18, 2026 at 11:15=E2=80=AFPM Alexander Graf <graf@amazon.com> w=
rote:
>
> Commit f7728002c1c7 ("virtio_ring: fix return code on DMA mapping
> fails") moved virtqueue_add_split() and virtqueue_add_indirect_packed()
> to -ENOMEM, because virtio_queue_rq() maps -EIO to BLK_STS_IOERR and
> the request fails. We still return -EIO from virtqueue_add_packed(),
> and virtqueue_add_packed_in_order() copied that when it was added later.
>
> Guests that bounce their I/O through swiotlb (SEV-SNP, TDX, s390 secure
> execution) run the pool out with enough I/O in flight. On a split ring
> virtio_queue_rq() reports BLK_STS_RESOURCE and the block layer requeues
> the request. On a packed ring virtio_queue_rq() reports BLK_STS_IOERR
> instead and the error reaches the filesystem.
>
> Return -ENOMEM from the packed unmap_release paths too. Both are reached
> from a single goto on a failed mapping, which is where
> vring_map_one_sg() already produces -ENOMEM.
>
> That way every ring layout reports the same errno, and the block layer
> requeues the request instead of failing it.
>
> Fixes: f7728002c1c7 ("virtio_ring: fix return code on DMA mapping fails")
> Fixes: f6a15d854986 ("virtio_ring: add in order support")

Acked-by: Eugenio P=C3=A9rez <eperezma@redhat.com>

> Assisted-by: Kiro:claude-opus-5 checkpatch sparse
> Signed-off-by: Alexander Graf <graf@amazon.com>
> ---
>  drivers/virtio/virtio_ring.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/virtio/virtio_ring.c b/drivers/virtio/virtio_ring.c
> index ea8e774b6d8e..b7b03166a301 100644
> --- a/drivers/virtio/virtio_ring.c
> +++ b/drivers/virtio/virtio_ring.c
> @@ -1810,7 +1810,7 @@ static inline int virtqueue_add_packed(struct vring=
_virtqueue *vq,
>         }
>
>         END_USE(vq);
> -       return -EIO;
> +       return -ENOMEM;
>  }
>
>  static inline int virtqueue_add_packed_in_order(struct vring_virtqueue *=
vq,
> @@ -1966,7 +1966,7 @@ static inline int virtqueue_add_packed_in_order(str=
uct vring_virtqueue *vq,
>         }
>
>         END_USE(vq);
> -       return -EIO;
> +       return -ENOMEM;
>  }
>
>  static bool virtqueue_kick_prepare_packed(struct vring_virtqueue *vq)
>

