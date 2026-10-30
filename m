Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793368297;
	b=lwPwmhVMuctQmDEPf/5RZUm79leX61CK4WfRBUL1aqy5dzzmyNHrytaF8q+Hm6aV/iLM
	 0rEuAo/wQ6IJD4+YpZZA1CW0ZfoEj313e4HCEX6kBIzBxlOfoen9T8VhzcO4VxdOyNpQU
	 6dA+g2MCXxtkCE7gGIzESOtsditifvtWAFHefc/NGMjuBU81tW9Q3Vhns6wxE2NXDREci
	 RSaz2G/ZD0SJF0mhGvrMLf3Pbgob04LrOnbUS9bkzdm0tE2Ei3JrZHv7/Pb5GFEubF48U
	 b6+mvqvkpLmJfseMQQpiIftGqwCPaz24NcxR9BT5ZXfQAyvTu4hOfAOw2RkBAUPwBGg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793368297;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=szKIQcK4Y6tUERhcrUwO9hhUFFsNv+m6pizPQ1yqDLY=;
	b=FLlA4V9alw7frZVe8H2Zf1V6PgCDFUVxIY3LgqSS2v8wVs7MHfuk+ul7x2Nrrp/wJhDl
	 biB5q1PR4shBgFkhtp4pFvsHx3Gd1dbMX5s9J810URmAuz0U8Vq0SQWLXGfJ02HFKECj0
	 Y0xuASCwIINeZjyATz51+nXoM3q0kmFY3N1FOBfUgb1o0iMoX6tp03tu2wBdLPujz8TW+
	 LqGykMeHTgg3rkmDuLlVqzYLJWAKUaLiMLUJBofi3fP6lbtpCz8ACGbsovBRv1qk+Ke2Y
	 Snz+fy2pe/HyJcpzC+j9jIyyfTyyavp2MadA5R9ihbHAQQpMKAggWX2h5dGhatk88ag==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=YIIXnog8;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=Qi7Skn7b;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC3E1606A32A
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 13:51:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DC3E1606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=YIIXnog8;
	dkim=pass (2048-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=Qi7Skn7b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1793368296;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=szKIQcK4Y6tUERhcrUwO9hhUFFsNv+m6pizPQ1yqDLY=;
	b=YIIXnog8DVjryCXSB2Fpf4qfxw00H1O/a0Sqvgps01cvRY25vI65DHIHRFP6EKp7NIBw+n
	5cCcFY60CgizDmMS6MyTTG7A+2PD/1NScrhUkrRpKbKr+kO1VFPRVeOuAbTyusxmWOmb0N
	Fu39TXvoP7tpvmPZf+LQWn4BHdIV+oo=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-608-cr_lnQI-P-6l9SiFaQl76Q-1; Fri, 30 Oct 2026 09:51:33 -0400
X-MC-Unique: cr_lnQI-P-6l9SiFaQl76Q-1
X-Mimecast-MFC-AGG-ID: cr_lnQI-P-6l9SiFaQl76Q_1793368293
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-4a1e489f97fso9940555e9.0
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 06:51:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1793368292; x=1793973092; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=szKIQcK4Y6tUERhcrUwO9hhUFFsNv+m6pizPQ1yqDLY=;
        b=Qi7Skn7bfOy9qAj3skXrKNZ9uwBXg1SEm3VN5CPFoa4VPi7hhXivkjq4rJq/6KEIhj
         MvmrR1AoCr3OyPuqH5Ru6Uj9vf+gEh931QvVwRdjzPsUttv4krlnI1a++L4wI0y+/NSk
         aFV/fcds3DYFB6IVEGzJx4WqEpFlcrH+9ua6RdA+lkLgyz8xmlIHW1SwtbWxmygso64d
         wQFlh0p0tMvcR6iEzVLnv/K4w9fxFCUeJjcXtNcFuFD99TWIPvQHtqjbgq3o4MGn6F3A
         5f6MpfIPbAZPHbHNFYuQ3TVbhBMx53KqEnqH+owlteVcgKUBLKkWKlTUTijrXrND0oVR
         KKHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793368292; x=1793973092;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=szKIQcK4Y6tUERhcrUwO9hhUFFsNv+m6pizPQ1yqDLY=;
        b=p1OxygZLvQLwoSZ4LuUXCkRW9vi5Ya5+yjpfr5vuZjyGTFIYgS/u008ZBUP7kN4tzJ
         Kg9EFn1mbM2xB8h+rYpFSbnzRO3qmFa1u5pViKNOUgsO29DiSgYaon81DqgnHQK6KFoL
         JTEvYBueQzZqBYL24gv9ohGCXH7DHyvd8TrOSUayFlwOtK8Nrli0LMjnO0TgGHrjJlUZ
         6yimofjqeQGs2bltyTYJWyD8r5I1CvuV6vuIhnLgJPeJKt4zBbo84b/pZY2fFHnKqNNn
         1YFPYhYIb97WQh57fBbcuNpJLzZhEAn4k5vjLvqdK6UiDHOpoGyUBXX+g4c80ZDRR8Lu
         438g==
X-Forwarded-Encrypted: i=1; AKwUvBxwm71Jp1AL7UsuK8iBwMK0jwmZ8dUcBauuelcZALskTns4Ps6DcBjilgNNiXZFNdZ244Qve3t9aheuf/k=@vger.kernel.org
X-Gm-Message-State: AFq9FYKZc4Sl0/0mVUn9klRuZWor0LL0tesyFXM01U+qPnO5Q3FiPAOW
	SKgouPurfes7u2ZZyhgT4Q3JM/17mCS1z1m3XZamynSSbV/CCxHXUMoubl7LXagdxxRzWljIMFD
	+x7tg92R/5EHAnyhdG+iJXDBy43VjbK607QLPwi4bgkbRlz52rkdYDF5F5SXGFF+e1A==
X-Gm-Gg: AYBFou27Ei28fjwLf01rFD6AnUpsTtA4IfAYOyJiNIv8XoJRigajDZcCwEdiOtEgoUN
	ZzDaXXU9eKyKtg+BpwLwxKNtqMxGtYjzVU4rbPsfuUa5FyrX1PcZk7DKMNnow1ySbDPY3+xdZMi
	ZvjHyoPpJxkbOqj+G1nX8yWxT+TCCWA6khh51r/58eo6bV8Ydc0gKcx0S0CH2h/l5AyUOe0xcPI
	TPMJM751zZg3a0Q+XkQx0GgIxQTMPPAeoaWAvvFXl9AClEqsZSJj9bU1Q/wbv/3NoiDGzoefj8n
	59rjCeY3AbzZV9vaiV5R75BOr9AOYO9Zi36rh2CMKIs1UdUdMMTtn1CrammyMftnPutCc5PNzwd
	291+Yy/yf1ARUVsN1TuSXPoVOm6WJwM//2CkZXweXVW9U8Ac9Hq+nch8x0YaMzf4Ttvj2hN4ZuM
	jldsIruNXnjyeYuqw=
X-Received: by 2002:a05:600c:8183:b0:4a1:f9e6:f418 with SMTP id 5b1f17b1804b1-4ac19802178mr43295495e9.34.1793368292575;
        Fri, 30 Oct 2026 06:51:32 -0700 (PDT)
X-Received: by 2002:a05:600c:8183:b0:4a1:f9e6:f418 with SMTP id 5b1f17b1804b1-4ac19802178mr43295065e9.34.1793368292109;
        Fri, 30 Oct 2026 06:51:32 -0700 (PDT)
Received: from sgarzare-redhat (ip190-139-192-82.pool-bba.aruba.it. [82.192.139.190])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71b80ecbsm3458621f8f.35.2026.10.30.06.51.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 06:51:31 -0700 (PDT)
Date: Fri, 30 Oct 2026 14:51:26 +0100
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
Subject: Re: [PATCH net v2] vsock/virtio: clear vqs[] to avoid a UAF on a
 failed PM restore
Message-ID: <auSZtMqcTz3r1nRk@sgarzare-redhat>
References: <20261028-vsock-restore-uaf-send-v2-1-675aad6da714@eldare.de>
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
In-Reply-To: <20261028-vsock-restore-uaf-send-v2-1-675aad6da714@eldare.de>

On Wed, Oct 28, 2026 at 07:22:43PM +0100, Jerome Mohm via B4 Relay wrote:
>From: Jerome Mohm <jrmmhm.kernel@eldare.de>
>
>virtio_vsock_vqs_del() frees the virtqueues via del_vqs() but never
>clears vsock->vqs[]. If a later virtio_vsock_restore() fails to
>reallocate them (its error path is a bare "goto out" that only unlocks
>and returns), the driver is left bound with a dangling vqs[]. The next
>virtio_vsock_vqs_del() - on a second freeze or on remove/unbind - then
>passes a freed vring_virtqueue to virtqueue_detach_unused_buf(), a slab
>use-after-free. KASAN on a guest with a virtio-vsock device on
>virtio-pci, after a restore made to fail by fault injection:
>
>  BUG: KASAN: slab-use-after-free in virtqueue_detach_unused_buf
>  Read of size 4 at addr ... by task repro
>   virtqueue_detach_unused_buf
>   virtio_vsock_vqs_del (net/vmw_vsock/virtio_transport.c:785)
>   virtio_vsock_remove
>   virtio_dev_remove
>   ... unbind_store
>  Freed by task ...:
>   kfree
>   vp_del_vqs
>   virtio_vsock_freeze          <- the preceding freeze freed the vq
>  Allocated by task 1:
>   vring_create_virtqueue
>   virtio_vsock_vqs_init
>   virtio_vsock_probe           <- original allocation at probe
>
>That second virtio_vsock_vqs_del() also repeats del_vqs(), which not
>every transport tolerates. virtio-mmio's vm_del_vqs() always ends in
>free_irq(), but after the failed vm_find_vqs() the device no longer
>holds its IRQ, so on virtio-mmio the second call also warns:
>
>  Trying to free already-free IRQ 51
>  WARNING: kernel/irq/manage.c:1894 at free_irq+0x23e/0x840
>   vm_del_vqs
>   virtio_vsock_vqs_del
>   virtio_vsock_remove          (or virtio_vsock_freeze)
>
>virtio-pci's vp_del_vqs() is idempotent, so the PCI case shows only
>the use-after-free.
>
>Clear vsock->vqs[] after del_vqs() and when virtio_find_vqs() fails in
>virtio_vsock_vqs_init(), and treat an empty vqs[] as "no virtqueues
>are live": virtio_vsock_vqs_del() then still resets the device
>(virtio_dev_remove() expects a reset device) and purges the send
>queue, but skips the detach loops and del_vqs(). find_vqs() cleans up
>after itself on failure, so skipping the second del_vqs() leaks
>nothing. Clearing the stale pointers follows virtio_blk
>commit 0739c2c6a015 ("virtio_blk: NULL out vqs to avoid double free on
>failed resume").
>
>The use-after-free was found with the help of an LLM coding assistant
>(Anthropic's Claude); the free_irq() warning on virtio-mmio was reported
>by the netdev Sashiko AI review of an earlier version of this patch.
>
>Testing: on a private VM with a KASAN fuzz kernel, over virtio-pci and
>over virtio-mmio (QEMU microvm). The restore allocation failure was
>forced with CONFIG_FAILSLAB steered by the fault-injection stacktrace
>filter to the virtio-vsock restore path only; a guest-root program
>drives a pm_test=devices freeze/restore cycle (so .restore returns
>-ENOMEM) and then unbinds the device, or runs a second freeze/restore
>cycle. Without a fix (v7.3-rc5 based) the PCI run reports the
>slab-use-after-free above. With only the vqs[] clearing (v1 of this
>patch, on net 363c8c79220d) the MMIO runs report the free_irq warning on
>remove and on the second freeze. With this patch on the same base,
>restore still fails with -ENOMEM on both transports and neither report
>appears; the device works again after a second, successful
>freeze/restore cycle and after unbind/bind, and a normal freeze/restore
>and unbind/bind still leave a working device. A find_vqs() failure after
>some virtqueues were set up was not exercised (each restore attempt
>failed at its first allocation, before any virtqueue was set up); that
>clear is covered by code reading only. The three single-VM tests of
>tools/testing/selftests/vsock/vmtest.sh (vm_server_host_client,
>vm_client_host_server, vm_loopback; 44 vsock_test cases each) pass on
>this tree, as on net; on both kernels the host-side runs skip the SO_INQ
>cases (SO_INQ not supported by the host kernel). The ns_* tests of
>vmtest.sh were not run (they need root on the host). checkpatch.pl
>--strict is clean and the fuzz-config build is warning-free. The

Do we really need to write in a commit message that checkpatch.pl 
--strict is clean?

Descriptive commits are great, but we're going a bit too far here. 
Please include only the relevant information; for example, I think the 
part after "Testing:" could be summarized in a few lines or removed 
altogether.

>reproducer needs guest root, CONFIG_FAILSLAB with
>CONFIG_FAULT_INJECTION_DEBUG_FS and
>CONFIG_FAULT_INJECTION_STACKTRACE_FILTER, and CONFIG_HIBERNATION with
>CONFIG_PM_DEBUG for pm_test; it is available on request.
>
>Fixes: bd50c5dc182b ("vsock/virtio: add support for device suspend/resume")
>Cc: stable@vger.kernel.org
>Signed-off-by: Jerome Mohm <jrmmhm.kernel@eldare.de>
>---
>The use-after-free was found with the help of Anthropic's Claude; the
>virtio-mmio warning comes from the netdev Sashiko review.

This is already in the commit description, no?

>
>Changes in v2:
>- Skip the detach loops and del_vqs() in virtio_vsock_vqs_del() when no
>  virtqueues are live, so the teardown after a failed restore does not
>  free virtio-mmio's IRQ a second time (Sashiko review).
>- Use an empty vqs[] as the 'no live virtqueues' marker instead of v1's
>  per-loop NULL checks, and purge the send queue before the early
>  return.
>- Commit message: cite only virtio_blk 0739c2c6a015; drop the wrong
>  virtio_rtc and virtio_console references (Sashiko review). Drop the
>  commit ID from the code comment.
>- Tested on virtio-mmio (QEMU microvm) as well as virtio-pci.
>- Drop the Assisted-by trailer (removed upstream); tool use is
>  disclosed above instead.
>- Link to v1: https://patch.msgid.link/20261001-vsock-restore-uaf-send-v1-1-5da60f707506@eldare.de
>---
> net/vmw_vsock/virtio_transport.c | 24 +++++++++++++++++++++---
> 1 file changed, 21 insertions(+), 3 deletions(-)
>
>diff --git a/net/vmw_vsock/virtio_transport.c b/net/vmw_vsock/virtio_transport.c
>index 4f9aa9c4c3aa..bba594b7fc14 100644
>--- a/net/vmw_vsock/virtio_transport.c
>+++ b/net/vmw_vsock/virtio_transport.c
>@@ -714,8 +714,14 @@ static int virtio_vsock_vqs_init(struct virtio_vsock *vsock)
> 	atomic_set(&vsock->queued_replies, 0);
>
> 	ret = virtio_find_vqs(vdev, VSOCK_VQ_MAX, vsock->vqs, vqs_info, NULL);
>-	if (ret < 0)
>+	if (ret < 0) {
>+		/* On failure virtio_find_vqs() can leave freed virtqueues or
>+		 * error pointers in vsock->vqs[]. Clear it: an empty vqs[]
>+		 * tells virtio_vsock_vqs_del() that no virtqueues are live.
>+		 */
>+		memset(vsock->vqs, 0, sizeof(vsock->vqs));

Should we move this in the virtio_find_vqs() ?

Maybe not for this patch, but for long term it could be a good idea IMO.

> 		return ret;
>+	}
>
> 	virtio_vsock_update_guest_cid(vsock);
>
>@@ -781,6 +787,15 @@ static void virtio_vsock_vqs_del(struct virtio_vsock *vsock)
> 	 */
> 	virtio_reset_device(vdev);
>
>+	virtio_vsock_skb_queue_purge(&vsock->send_pkt_queue);
>+
>+	/* No virtqueues are live, e.g. after a failed restore: they were
>+	 * already deleted, and a second del_vqs() is not safe on every
>+	 * transport (virtio-mmio would free its IRQ again).
>+	 */
>+	if (!vsock->vqs[VSOCK_VQ_RX])
>+		return;
>+
> 	mutex_lock(&vsock->rx_lock);
> 	while ((skb = virtqueue_detach_unused_buf(vsock->vqs[VSOCK_VQ_RX])))
> 		kfree_skb(skb);
>@@ -791,10 +806,13 @@ static void virtio_vsock_vqs_del(struct virtio_vsock *vsock)
> 		kfree_skb(skb);
> 	mutex_unlock(&vsock->tx_lock);
>
>-	virtio_vsock_skb_queue_purge(&vsock->send_pkt_queue);
>-
> 	/* Delete virtqueues and flush outstanding callbacks if any */
> 	vdev->config->del_vqs(vdev);
>+
>+	/* The virtqueues are freed: clear the stale pointers, so that a
>+	 * virtio_vsock_vqs_del() after a failed restore skips them.
>+	 */
>+	memset(vsock->vqs, 0, sizeof(vsock->vqs));

Same above, should we introduce a virtio_del_vqs() to do both and call 
it in all drivers?

Or skip del_vqs() if vdev->vqs is empty.

I guess this issue could be spread around virtio drivers, so would be 
nice to add common API in the virtio core to be used in all of them.

That said, for a fix, this patch LGTM, my comments were more for a long 
term work.

With a fixed commit message I can give my R-b.

Thanks,
Stefano

> }
>
> static int virtio_vsock_probe(struct virtio_device *vdev)
>
>---
>base-commit: 363c8c79220d0db4d65dcd570529ddda15067cb5
>change-id: 20261001-vsock-restore-uaf-send-1fc7396fa1bd
>
>Best regards,
>--
>Jerome Mohm <jrmmhm.kernel@eldare.de>
>
>

