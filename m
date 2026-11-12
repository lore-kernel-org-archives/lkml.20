Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794502970;
	b=EI5ss3hSarwEM9p201Ro3ts682jUCPlxYwydUye7136QA9zvyFgHM7QF0YbY+v9t5z6z
	 EdR2z3lIiZhWCUI8Qth2XMtnGuwiSOjj2ZokPYQ37rvXjdjUC4kImKzyY7LelqNKviYeW
	 DKGq1DH9ST2EMhutGuw4Cf4//SpIk+J9uQdZsijaLJ1krANUSAwGQggyjZUbU+xLXZvJI
	 mXzVhSPQvjiWCreH78GDwkHoUZpbI3nxPIR2/0aSiZ6hamq6i05mssVBHoGFaUwnWPOlc
	 U3624HdlA9wEpQvmi5nyREJbXqinssIUZatxr/SVzjBa6YbYxhFzQGd5xEw7/SHhKSw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794502970;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=4SSAg38Nw3BE7JWsNPS6tFWOPRz76x2WFPMI2JzvcWc=;
	b=BpR+t2eaDkRYIhX+4Ovf2SJMuQTkxEaSQiQuXbdGM7kMNNb7PQyymVizzJW05wOw+Mqh
	 Ph+8RP6lSkKy3Vl0gq8AieGC4wJ6IdKr7E+/XtOuyKfM5yi5T96qb+r3bWyQrky1wvW/V
	 VY+QuBjxj2uND0h+d1L38mkdFSRu66cq+KPGH5+2aJXxHgeqnsxcjmBzWYHwNPsF3K45y
	 S0PWpQ9akiUMihliwG5r4/yJvo0s0BAMoZOIQzz8/wT05l1tijsNQq7yFMLNB5CNgabTA
	 srNguTzCX3Gmet5jLvKljklaVhmlAxAVf1xyooKnnPU4C2VG3N57AJIW4hCQb9d/iZw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=UQ3lHNAj;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=Fq7YFxue;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82B8E606A31C
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 17:02:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 82B8E606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=UQ3lHNAj;
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=Fq7YFxue
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1794502968;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=4SSAg38Nw3BE7JWsNPS6tFWOPRz76x2WFPMI2JzvcWc=;
	b=UQ3lHNAjeOXsmCES4hWjxHOYer6q8c+25QErNO+A2n1KnP5/5APW2ESjNvPWYQc56JgQEN
	MZGJmmOZMVt05+xi0OZ8C8iW+paIyNhLJDRnWxxOJm0h/+h2YbWmcNVg9v9IkOfsSl1Fnb
	kudmPfuvFpNzGevPcZUjA7CKnZWu05k=
Received: from mail-oo1-f69.google.com (mail-oo1-f69.google.com
 [209.85.161.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-564-kzmhd2TfODakGKAIwCLI_Q-1; Thu, 12 Nov 2026 12:02:46 -0500
X-MC-Unique: kzmhd2TfODakGKAIwCLI_Q-1
X-Mimecast-MFC-AGG-ID: kzmhd2TfODakGKAIwCLI_Q_1794502966
Received: by mail-oo1-f69.google.com with SMTP id 006d021491bc7-70b87b40030so4822529eaf.0
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 09:02:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1794502966; x=1795107766; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=4SSAg38Nw3BE7JWsNPS6tFWOPRz76x2WFPMI2JzvcWc=;
        b=Fq7YFxuew4y7VYWcjll5e78rzl8lIIgzpNXpaYN/Q8NWnVIoAajywtbu6NvnCpqxUW
         +1IAiKP12pJlcr+LGTE6q7iwkNzffOFimZkthIQn5OnHflCcBpuOIU4F2vmUVcgEigUo
         XuvFw8xYfhpop8HoWiKm3c498ITO9JXm68E4K22WtAijG3eEqrT4s0Z2oJMcj3QxRKV1
         JPbF2XywvRdd+B1f0ik6ycufeWJuRVIF8Xa2OS9nDUvAIJhq8q6xdaL3vBluXbncjohj
         GrWaYnh80smBPTcYIj4VqyDEw+RsqxujDxB13NBxbkVpU7nsfJToThSwbqKFLRBVEKK9
         gjnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794502966; x=1795107766;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4SSAg38Nw3BE7JWsNPS6tFWOPRz76x2WFPMI2JzvcWc=;
        b=fJtxXkRnwA2MAhI6FyBh6qx9mGkpvCcoQhrJtDM2GuFndXOEdg+fCYEbfqgw2sKGop
         7JnBr42E14vprf+hQKfkRVFkYD7duTM5GTOLvoPTwq1/S5HWRdipSBbbJb44inTPi7tx
         o34WC4Ri8ca+FrR3H3txy+cDCWVeTX/+JOwhDgl2lmU36ITwYkjmXxt+KCc+mn8Fzbkv
         p/syl1Tbcer9fnTFrh4h05XIjBCyJPGpsvynDNdHzFuPqQqQ1yCBgsXno1kH0p0Q+Oen
         GFk5so1G3FO0AEg+8dkBI5qVCz6SPXy+Y5RQIEB5t3X/dzMkr6OFT1umAFvyV/mKJhBv
         htqw==
X-Forwarded-Encrypted: i=1; AL+hErFXFYgb4eXdObx+4QH10MOs0YTkWaEYiVAD8hA2Pv/lmKrn7/kkn+09Unfp+VO8RxQz1GFcaac3vhafOsA=@vger.kernel.org
X-Gm-Message-State: APuU4Z9SwkQpr/rB6aW2yZpEvijnKh6F/frcIQtjzH63lBwD80MbMFfl
	W//7meZf7J3YjOHAi5HhwIvYVKfGvHYwwx16I0mBsbP+SGjQDDkXJSTX+e9V7Dbv6qg2j2AjFKC
	2nsvaBMpIIBcSXYGsxnw0jKJUUhwcdYQcI+HQ3+nAVJGLTKcBihKHnhzxAhOzaKWsHg==
X-Gm-Gg: AYBFou0aQPc+whXWAv6+/1eHr8VUPp8KviaV8HlEn0nQiYx39BRJXKfJ1aXYo4+2nL8
	Hg/QZvD88iJve5+s/8RUOXB2zXlvw3YdJuau/e1l/LsqyKg8ByIhRzv74BwJBrSyQDG+n5YvL7t
	NcvNRD8UzsieYNhda9gHA/zAxyWsNoJ1n2tkRvPmq3zd2BrYka+n6xPbKzmyrABy4sAZkWsbmoY
	DRpASoiAxd8vaRoc/61SeOnMPbzcbsaesNW4h+jYnxCoZ1W+jqBYFJ4s0stw6zWaXobUm4ZI4fx
	injbsXyfF+CZrFgnYAVWsB/1BaDoDFWzQfu6RhwMtaVpx42W2jn+vEXSp50vn70S+bb/Qnn/4MS
	hRAJoALjmjYK83WzYGIxKlps4+Res3CAZ6Y5WSuLcVliBkjkMERLS
X-Received: by 2002:a05:6820:83c2:10b0:6dc:e1c3:b2ac with SMTP id 006d021491bc7-7191798a171mr2797258eaf.73.1794502965932;
        Thu, 12 Nov 2026 09:02:45 -0800 (PST)
X-Received: by 2002:a05:6820:83c2:10b0:6dc:e1c3:b2ac with SMTP id 006d021491bc7-7191798a171mr2797227eaf.73.1794502965373;
        Thu, 12 Nov 2026 09:02:45 -0800 (PST)
Received: from sgarzare-redhat ([209.52.143.85])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4ae22f6a1c7sm5433524fac.6.2026.11.12.09.02.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 09:02:44 -0800 (PST)
Date: Thu, 12 Nov 2026 18:02:40 +0100
From: Stefano Garzarella <sgarzare@redhat.com>
To: jrmmhm.kernel@eldare.de
Cc: Stefan Hajnoczi <stefanha@redhat.com>, 
	Bobby Eshleman <bobbyeshleman@meta.com>, "Michael S. Tsirkin" <mst@redhat.com>, 
	Jason Wang <jasowangio@gmail.com>, Eugenio =?utf-8?B?UMOpcmV6?= <eperezma@redhat.com>, 
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, 
	Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, virtualization@lists.linux.dev, 
	kvm@vger.kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Subject: Re: [PATCH net v4] vsock/virtio: clear vqs[] to avoid a UAF on a
 failed PM restore
Message-ID: <avXxFnqVLMgBMjBP@sgarzare-redhat>
References: <20261109-vsock-restore-uaf-send-v4-1-1df8dfb5d5de@eldare.de>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20261109-vsock-restore-uaf-send-v4-1-1df8dfb5d5de@eldare.de>

On Mon, Nov 09, 2026 at 08:39:24PM +0100, Jerome Mohm via B4 Relay wrote:
>From: Jerome Mohm <jrmmhm.kernel@eldare.de>
>
>virtio_vsock_vqs_del() frees the virtqueues but leaves vsock->vqs[]
>pointing at them. If virtio_vsock_restore() then fails, the driver
>stays bound with a dangling vqs[], and the next freeze or unbind
>passes a freed virtqueue to virtqueue_detach_unused_buf():
>
>  BUG: KASAN: slab-use-after-free in virtqueue_detach_unused_buf
>   virtio_vsock_vqs_del (net/vmw_vsock/virtio_transport.c:785)
>   virtio_vsock_remove
>  Freed by task ...:
>   vp_del_vqs
>   virtio_vsock_freeze
>
>Clear vqs[] after del_vqs() and when virtio_find_vqs() fails. Return
>early from virtio_vsock_vqs_del() when vqs[] is empty: the detach
>loops would pass NULL to virtqueue_detach_unused_buf(), and a second
>del_vqs() would free virtio-mmio's IRQ again, which only WARNs in
>free_irq() ("Trying to free already-free IRQ").
>
>Found with the help of Anthropic's Claude and reproduced on virtio-pci
>and virtio-mmio by failing the restore with failslab, without other
>kernel changes; the virtio-mmio WARN was found by the netdev Sashiko
>review and reproduced with v1 of this patch. With this patch neither
>report appears on virtio-pci or virtio-mmio guests, and the vsock
>vmtest.sh single-VM tests pass. A find_vqs() failure after some
>virtqueues were set up was not exercised.
>
>Fixes: bd50c5dc182b ("vsock/virtio: add support for device suspend/resume")
>Cc: stable@vger.kernel.org
>Signed-off-by: Jerome Mohm <jrmmhm.kernel@eldare.de>
>---
>Changes in v4:
>- Say why the early return is needed: the detach loops would pass NULL
>  to virtqueue_detach_unused_buf() (answering Stefano).
>- Say in the message and the comment that freeing virtio-mmio's IRQ
>  again only WARNs (Stefano).
>- Move the send queue purge before virtio_reset_device() (Stefano).
>- Message: the use-after-free also reproduces on virtio-mmio.
>- Rebase onto current net; rebuilt and retested on virtio-pci and
>  virtio-mmio, and the vmtest.sh single-VM tests rerun on this version.
>  The moved purge ran with an empty send queue only; the ns_* tests of
>  vmtest.sh were not run (they need root on the host). The reproducers
>  are available on request.
>- Link to v3: https://patch.msgid.link/20261104-vsock-restore-uaf-send-v3-1-d60d06488b57@eldare.de
>---
> net/vmw_vsock/virtio_transport.c | 16 +++++++++++++---
> 1 file changed, 13 insertions(+), 3 deletions(-)

Reviewed-by: Stefano Garzarella <sgarzare@redhat.com>

Thanks,
Stefano

