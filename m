Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793399105;
	b=l+DDuHCRHJTeP6aksUv0cm92kWqx/9s8AJC1xRYZKNHOZrGM+wDiUnxqzQaByArtLRws
	 5Tk7oYNjlW67OzB5La5LsCg+z175yxZTdMICAfbOmZaj0IgQboJIVHL7NmkuN9eeLibMo
	 +Dy4qlLzrM8KOkKlkfffpAhFk5jHgLEs/O491y3WA1WY0WArE5tIbdSRqVziIAQUuYtX2
	 zhBjUiQv9Onjd9brFARRaHTUP5rhrLerIHF0FjNnJ9D8Ql/VjzwxYDBItIKgWefbP0yuz
	 4CJjHF45elYdM4l7nrn/LoVTIuFdkS7heBHKv0k/KUsQNKOrLghXbpv4c1VtH5II00A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793399105;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=/+KneAP5j4JycW2Osy6h4oU9OQtsTeRD6BdS9+k/6qE=;
	b=Z6uDajnOqGcSZE0nJxDnxpcbNcGVE3VuMLaOhmIKV+P51zocUbhfHAa/okn1qd8J/cbi
	 tdno15+XUxCNBFFYKlu6sGKzaCcrid8RTFNvm/sfk7t6FL4JKlRNpp92/5UxevlisAN7G
	 JZM8zaTbzN/vYFGXjbTj7DHOkHNTjVfa1UUybvo2GH06l/zQhOhH/fnO92oydnEbH7SGj
	 3iBSRy1MBSusli+weIfgDYVJHKW8jbUuHvGosGmYbB1zEjvIAQ0JEhpSrAhcsXFLaqBMK
	 e2UnCudPw8mHdg8apEUmqRjg67FijHkv8QEtKclHYmLSfRqY0hacoTi8EmA6SDlNC0w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fON+oxNo;
	arc=none smtp.remote-ip=209.85.128.174
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D64E606A31A
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 22:25:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6D64E606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fON+oxNo
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-8b0d91601bdso19581047b3.1
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 15:25:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793399104; x=1794003904; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/+KneAP5j4JycW2Osy6h4oU9OQtsTeRD6BdS9+k/6qE=;
        b=fON+oxNodYAgFJVlp9NMyimkvkAqRKgDVxsc7oPe5/oKL+jFJcDMbJD7JyAAlKDN6X
         Ulrgfg5oRZHZvrJt1/wumsGGM6hnegz6txsFgooLxk17khHW2ooVi/Ebs0ftClD4SO5k
         n87A+Wy9KTW+fTdyYvj8B78qf8da4YbMqPpTFvdhHzQbqLrSLrSxEbLO9sF5YhJ5aLZH
         YzEujhIVn4WLLXO+6Is1F/CV7tGZSvmR9kqFIziZ6PFOz+Ezxqzc11v/PzKOrWmTKfIJ
         HvRSkgc7fXxGW5Y1gE7/dvg5HajVlh5gjWdFt2sz6g7JoT2qcYV/r5PoHimftmTExgD9
         ApVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793399104; x=1794003904;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/+KneAP5j4JycW2Osy6h4oU9OQtsTeRD6BdS9+k/6qE=;
        b=pP72qY30Dv7WvM6QTe333D19o/HhBwOklA1uBYmnzLl9qdpcDaGqGP/1RhsLrODRcr
         OjYlPg4FazHGKtTE9k5Rp5G7TWD4Ah7VAU8PGS8auL1/TTIAJDCLZQVT/C8VGj+k8AtH
         ePukVVugku2umhHw/NMkkDCe3ip1f3d91qXNzjV4rOUDi9flhGRjMIE4cZR7P61hLNa8
         YaTOnMKe5QpKyKIVqByb+wtaxZ7dFNd9YIDUmFsovP/M0BJDXZNZiz1w12zPUMFY7k0L
         aOZkbdeP+IUeEd3qigw52I17NA9EXKfNpzbMS2wIk1X+1/uXStly9AT+dQ3yl3ka04PB
         IClg==
X-Forwarded-Encrypted: i=1; AKwUvBxVgd37JxhDmb9KvTnp8QKME15K0HFlZ+OOlhl7yeMJDu+erHlvlfXW3FHBEdqqW0JlPyqW3o1UWVKJGfc=@vger.kernel.org
X-Gm-Message-State: AFq9FYIJaYbi8bfU0JvCWsEp802tSU1aHS1Oobm/LQJC1q5vYKhEVgO3
	7BrI83YimfdE9gGKI8zexyx0L5r0d9kvoq4hhu9a7ZTpXvdt8mO9+mXZZKuxSA==
X-Gm-Gg: AYBFou1p2Z9rPOUvwwBlWj1MCnLrLJoduzU4RNviCsv+d6+9T0Y3kGm6L/OLMh/47o0
	uSrVZYjZssmiwYOfvSHtsHU3969lII/vnEvcabJ+bGxm90teuiD+R0n+XFYT1X+FZCPr/XBW2nq
	qF5PeTu67yOWrPH9SR7qax8Lf2+xjGoORgnAUhVQ88Eghx97qzr8qCElzpCquhLKFtdYQY/vDDP
	dnZk3O83uBGDwLlaFe4hbTxTpZhh7z4c/dD6Vn3IgxhK69ZlaPk+P92h8ASE0F9rQ+Hc+Bqkq53
	k6Hd9D9cP3nWkKqZOKLmHrIhr9hfckJizJLVWlkH1f+hdSEqHxAW+CiWSQZhSwhOSZnaDJvxrc1
	e72P6dRZqrFcp/jyV9qCXprudhTjYdQnEZ8rSEY714B5ood2k/AZVwfPb6/NV2eiJfGMP4mN+A0
	Vyz5PASMvoYic9y9OVricPq0IWrjkaULwhk0Qs8Uz7Iii32wvnrWeb2tmuJ/IQtrhQZEMb/XNuM
	SrkN6rlZ3eJukZqmwo+8YJ9Z5d2UFSWfaFcSZNO2DLizV0SqUfpCmyY5G+V/0S/vwR3fwuytGOl
	aNmhHsVkRR0tOt/hLTR8oj59bw==
X-Received: by 2002:a05:690c:92:b0:8a9:8744:c07d with SMTP id 00721157ae682-8b1c67060e0mr55008757b3.18.1793399104308;
        Fri, 30 Oct 2026 15:25:04 -0700 (PDT)
Received: from localhost ([2a03:2880:ff:72::])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-67baf147246sm730246d50.1.2026.10.30.15.25.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 15:25:03 -0700 (PDT)
Date: Fri, 30 Oct 2026 15:25:02 -0700
From: Bobby Eshleman <bobbyeshleman@gmail.com>
To: jrmmhm.kernel@eldare.de
Cc: "Michael S. Tsirkin" <mst@redhat.com>,
	Jason Wang <jasowangio@gmail.com>,
	Eugenio =?iso-8859-1?Q?P=E9rez?= <eperezma@redhat.com>,
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
	Stefan Hajnoczi <stefanha@redhat.com>,
	Stefano Garzarella <sgarzare@redhat.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>, kvm@vger.kernel.org,
	virtualization@lists.linux.dev, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH net] vsock/virtio: clear vqs[] to avoid a UAF on a failed
 PM restore
Message-ID: <auUZPiXDIPpQ2/vK@devvm29614.prn0.facebook.com>
References: <20261001-vsock-restore-uaf-send-v1-1-5da60f707506@eldare.de>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261001-vsock-restore-uaf-send-v1-1-5da60f707506@eldare.de>

On Thu, Oct 01, 2026 at 07:13:29PM +0200, Jerome Mohm via B4 Relay wrote:
> From: Jerome Mohm <jrmmhm.kernel@eldare.de>
> 
> virtio_vsock_vqs_del() frees the virtqueues via del_vqs() but never
> clears vsock->vqs[]. If a later virtio_vsock_restore() fails to
> reallocate them (its error path is a bare "goto out" that only unlocks
> and returns), the driver is left bound with a dangling vqs[]. The next
> virtio_vsock_vqs_del() - on a second freeze or on remove/unbind - then
> passes a freed vring_virtqueue to virtqueue_detach_unused_buf(), a slab
> use-after-free. KASAN on a guest with a virtio-vsock device, after a
> restore made to fail by fault injection:
> 
>   BUG: KASAN: slab-use-after-free in virtqueue_detach_unused_buf
>   Read of size 4 at addr ... by task repro
>    virtqueue_detach_unused_buf
>    virtio_vsock_vqs_del (net/vmw_vsock/virtio_transport.c:785)
>    virtio_vsock_remove
>    virtio_dev_remove
>    ... unbind_store
>   Freed by task ...:
>    kfree
>    vp_del_vqs
>    virtio_vsock_freeze          <- the preceding freeze freed the vq
>   Allocated by task 1:
>    vring_create_virtqueue
>    virtio_vsock_vqs_init
>    virtio_vsock_probe           <- original allocation at probe
> 
> The object is the RX vring_virtqueue freed during the freeze;
> vsock->vqs[RX] still points at it. virtqueue_detach_unused_buf() does
> not guard a NULL vq, so a bare NULL-out is not enough on its own.
> 
> Clear vsock->vqs[] after del_vqs() in virtio_vsock_vqs_del(), skip the
> detach loops when a vq pointer is NULL, and also clear the array when
> virtio_find_vqs() fails partway in virtio_vsock_vqs_init() (which can
> leave freed pointers behind). This mirrors virtio_blk
> commit 0739c2c6a015 ("virtio_blk: NULL out vqs to avoid double free on
> failed resume") and virtio_rtc commit 548d2208455f ("virtio: rtc: tear
> down old virtqueues before restore"); virtio_console carries the same
> stale-pointers-after-failed-restore fix.
> 
> Testing: reproduced on a private VM with a KASAN fuzz kernel based on
> v7.3-rc5. The restore allocation failure was forced with CONFIG_FAILSLAB
> steered by the fault-injection stacktrace filter to the virtio-vsock
> restore path only; a guest-root program drives a pm_test=devices
> freeze/restore cycle (so .restore returns -ENOMEM) and then unbinds the
> device. The unfixed kernel reports the slab-use-after-free above; with
> this patch the same run makes restore fail identically yet produces no
> KASAN report. checkpatch.pl --strict is clean and the build is
> warning-free. The reproducer is available on request.
> 
> Fixes: bd50c5dc182b ("vsock/virtio: add support for device suspend/resume")
> Cc: stable@vger.kernel.org
> Assisted-by: LLM
> Signed-off-by: Jerome Mohm <jrmmhm.kernel@eldare.de>
> ---
>  net/vmw_vsock/virtio_transport.c | 28 +++++++++++++++++++++++-----
>  1 file changed, 23 insertions(+), 5 deletions(-)
> 
> diff --git a/net/vmw_vsock/virtio_transport.c b/net/vmw_vsock/virtio_transport.c
> index 4f9aa9c4c3aa..0553c0641fd2 100644
> --- a/net/vmw_vsock/virtio_transport.c
> +++ b/net/vmw_vsock/virtio_transport.c
> @@ -714,8 +714,15 @@ static int virtio_vsock_vqs_init(struct virtio_vsock *vsock)
>  	atomic_set(&vsock->queued_replies, 0);
>  
>  	ret = virtio_find_vqs(vdev, VSOCK_VQ_MAX, vsock->vqs, vqs_info, NULL);
> -	if (ret < 0)
> +	if (ret < 0) {
> +		/*
> +		 * On a partial failure virtio_find_vqs() can leave freed
> +		 * virtqueue pointers in vsock->vqs[]; clear them so a later
> +		 * virtio_vsock_vqs_del() does not detach a freed virtqueue.
> +		 */

IMHO we can drop this comment. Clearing after failure is common enough.

> +		memset(vsock->vqs, 0, sizeof(vsock->vqs));
>  		return ret;
> +	}
>  
>  	virtio_vsock_update_guest_cid(vsock);
>  
> @@ -782,19 +789,30 @@ static void virtio_vsock_vqs_del(struct virtio_vsock *vsock)
>  	virtio_reset_device(vdev);
>  
>  	mutex_lock(&vsock->rx_lock);
> -	while ((skb = virtqueue_detach_unused_buf(vsock->vqs[VSOCK_VQ_RX])))
> -		kfree_skb(skb);
> +	if (vsock->vqs[VSOCK_VQ_RX])
> +		while ((skb = virtqueue_detach_unused_buf(vsock->vqs[VSOCK_VQ_RX])))
> +			kfree_skb(skb);
>  	mutex_unlock(&vsock->rx_lock);
>  
>  	mutex_lock(&vsock->tx_lock);
> -	while ((skb = virtqueue_detach_unused_buf(vsock->vqs[VSOCK_VQ_TX])))
> -		kfree_skb(skb);
> +	if (vsock->vqs[VSOCK_VQ_TX])
> +		while ((skb = virtqueue_detach_unused_buf(vsock->vqs[VSOCK_VQ_TX])))
> +			kfree_skb(skb);
>  	mutex_unlock(&vsock->tx_lock);
>  
>  	virtio_vsock_skb_queue_purge(&vsock->send_pkt_queue);
>  
>  	/* Delete virtqueues and flush outstanding callbacks if any */
>  	vdev->config->del_vqs(vdev);
> +
> +	/*
> +	 * del_vqs() has freed the virtqueues. Clear the stale pointers: if a
> +	 * later virtio_vsock_restore() fails to allocate new ones, the driver
> +	 * stays bound with a dangling vqs[] and the next virtio_vsock_vqs_del()
> +	 * would detach a freed virtqueue (use-after-free). Mirrors virtio_blk
> +	 * commit 0739c2c6a015.
> +	 */

Ditto here.

> +	memset(vsock->vqs, 0, sizeof(vsock->vqs));
>  }
>  
>  static int virtio_vsock_probe(struct virtio_device *vdev)
> 
> ---
> base-commit: a7bfaba4823e3c165bb2004c74eff7c096672bc7
> change-id: 20261001-vsock-restore-uaf-send-1fc7396fa1bd
> 
> Best regards,
> --  
> Jerome Mohm <jrmmhm.kernel@eldare.de>
> 
> 

The rest LGTM.

Best,
Bobby
