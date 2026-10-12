Received: from mail-ot1-f46.google.com (mail-ot1-f46.google.com [209.85.210.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B834247043A
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 22:02:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791842578; cv=none; b=YUqqVcWX6eRYG0TFN7av0MIVjKc/f/K6mP9IeVMmIbyLprQnu7YXccd/t0FfgpxwpSEXHE3U7oP8rm5bl/3ryOODZJ1+5dKLboEvczP60JLLhVopDrjYH2i8tlIJyyT1Pixlmad4yGgWdGyAZY1lt+zQvu+lc4EImsZn+eIQylI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791842578; c=relaxed/simple;
	bh=xrEfK09sOgKPL8tRakdgdLoY5A4I63z1FJ2ZQnHI7pc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gIwVwnTzPSkqJxb5vPs1huQ3QsvspTfLVIm3BY90Phntsm+BO3sTXf/klqFXNwa/MnNsi+ndjTldunMg6uDwnULg4E0K9Rt0G5J2dk3aNs5vQSxvAzgYx0Sj0E2B6kYjy9vLQpmN2Cwtt6hskO7812CYtSO4XxH/hT852zkGwnU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kRiydYkw; arc=none smtp.client-ip=209.85.210.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kRiydYkw"
Received: by mail-ot1-f46.google.com with SMTP id 46e09a7af769-823545ce223so1882705a34.2
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 15:02:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791842575; x=1792447375; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=I34AgC3qXFsIWry2eO2C25CSCiy4N0N7n6VOFiD93pA=;
        b=kRiydYkwm255TVNGaaXvWy0gF4ej5bPf3TqHDwP3qKW0UQGyjZQ780kY3RNVw4HJup
         7FWZPEJde/7aULp3ql+ntkK990fXm/oUCr0HaTgLyKms9PnoQVCl2iG/tULiR4UBQFnq
         ylW+eb1e+rPaNKFkzqApVWG2dHMFnNBsxACTFeCYL0KpzlLT4Qt4jSlpm7i0kcJTWW5B
         OcOJt6mQwDfU3fUU6Lq/UqZRaBmRZl1o7GcaHzUh6ADz16dTNwoWs8tjvtByTesE2+3L
         yK8SWpsslmB23wVOL8Y2F4wAyUyFKBBd9gkkuvveLznuZwf6OJLWdIS5W9WXbmvbfrtt
         SKDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791842575; x=1792447375;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=I34AgC3qXFsIWry2eO2C25CSCiy4N0N7n6VOFiD93pA=;
        b=CaGt3K3wPPIcu+0OcR417t+uPV6aEuLqZAteNf5qZ7Zq+gRpuNK7K05zo/UOGwziPz
         H9KnU8ZU5sthcbheTc+H8thNyxVPdCns25chB8YYV2CqGB/cw1SvFPPAbPtw8XyY4jHb
         fGnApCDKbPxjSmqPqy4HRrVXIhkTO0qfCJXNUEiyY4HJ6bgciKgWI2o8pWsfbCD57jZb
         wxVZIvN3DItShXFZuwsPvTAMqZsy9HWCXmnEUYOt/F0Dr2981Os+fgOt4jaQou7+gxdC
         DM078ZHRpgANSErIvEEc3gV00nr4X3RLX7bv7SIvUH8fO8VaWChYpBpDI8SVXWSlrUCx
         QSVA==
X-Forwarded-Encrypted: i=1; AKwUvBz9fxs548PDEwp+HFBnHV/RQVf0xobpEKqVanK2kSH6LoU9U0D007KDhXEpDXLQgvPhEdU/IvMRNDaQEKU=@vger.kernel.org
X-Gm-Message-State: AFq9FYL/g4qU2+ho4CQqiRXWzhNCGxCnqRv8x6JUaPyJJtJQ6HL6IEmM
	83oqz872q1jsX3lite8k7mBhNPEFtR7K1EB2M94nJ1P0HEU02731OyTG
X-Gm-Gg: AYBFou2p7LLEyHPk9IcKUI+UrOAQC9z7eDg4KuPtz+TCYJw+QTfehuU3lIHbwKAu+Ds
	GuD+S9Q9qb+7XKaWWGkPttUzNFcoYsAz35m7TvzJWXVrVHF4N8E6hp35EZJkgsGIBXrOVstl9Jm
	O9DARscHWmMWY7q20LW1BlDNvzTgjECCJoO+0Mxkqfe++2OTRd+6J1yYfrRuv0CmMVGjkH7I6cY
	hVpthN13j0+o5kBIf5BDivoDXslCse/rzzpHvS+ZN4vQFPCVpkZ8dyVm5uG8pgALJNjoATHrkh0
	M3pjEHC77LpH1MW/e212hV3tFFOttFCLsmpyied27ZCDHqpUH2u3ZVRtbkLgtH2b6mM6x24HY1k
	o6//vaJJqv3KCrKogNo2TsIltIOdIXB6afgI8qYT4EjMJ3cWJn/ko7aKOb1xuTyaVEgo4iOJUYD
	T8dl82umcfJQizmWVKPzGYQ/GXRq7/YDbytiU1EC/78QOIFyGzfxhW97JlfIEbdhBiI9KuPyMrW
	dFPC8ri7SfePKKRWtvuvndV0iR1Mw==
X-Received: by 2002:a05:6830:43a0:b0:81c:4784:a5e2 with SMTP id 46e09a7af769-83094e738d8mr9929561a34.6.1791842575557;
        Mon, 12 Oct 2026 15:02:55 -0700 (PDT)
Received: from devvm29614.prn0.facebook.com ([2a03:2880:ff:4::])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-8303494f64csm10655830a34.3.2026.10.12.15.02.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 15:02:53 -0700 (PDT)
Date: Mon, 12 Oct 2026 15:02:50 -0700
From: Bobby Eshleman <bobbyeshleman@gmail.com>
To: Jia Jia <physicalmtea@gmail.com>
Cc: stefanha@redhat.com, sgarzare@redhat.com, netdev@vger.kernel.org,
	virtualization@lists.linux.dev, kvm@vger.kernel.org, mst@redhat.com,
	jasowangio@gmail.com, eperezma@redhat.com,
	xuanzhuo@linux.alibaba.com, davem@davemloft.net,
	edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com,
	horms@kernel.org, linux-kernel@vger.kernel.org, bpf@vger.kernel.org
Subject: Re: [PATCH net-next v2 1/5] vsock/virtio: split socket lookup from
 locked RX processing
Message-ID: <as1ZCkbya2jn72ip@devvm29614.prn0.facebook.com>
References: <20261010142247.99223-1-physicalmtea@gmail.com>
 <20261010142247.99223-2-physicalmtea@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261010142247.99223-2-physicalmtea@gmail.com>

On Sat, Oct 10, 2026 at 10:22:43PM +0800, Jia Jia wrote:
> Split virtio_transport_recv_pkt() so socket lookup is separate from the
> receive state machine that runs under the socket lock.
> 
> Keep virtio_transport_recv_pkt() on its existing per-packet locking path.
> Pass the source and destination addresses used for lookup to the locked
> receive path so they are decoded only once.
> 
> Pass the network namespace and decoded address tuple through a packet
> context to the locked receive path.
> 
> Preserve source validation and failure handling. Keep the lookup reference
> separate from the skb owner reference so the locked receive path can manage
> the two lifetimes independently.
> 
> Signed-off-by: Jia Jia <physicalmtea@gmail.com>
> ---
>  net/vmw_vsock/virtio_transport_common.c | 139 ++++++++++++++++--------
>  1 file changed, 96 insertions(+), 43 deletions(-)
> 

[...]

> +/*
> + * The caller holds sk's socket lock and must free skb if this returns true.
> + */
> +static bool
> +virtio_transport_recv_pkt_locked(struct virtio_transport *t,
> +				 struct sk_buff *skb, struct sock *sk,
> +				 const struct virtio_transport_rx_pkt_ctx *ctx)
> +{
> +	const struct sockaddr_vm *src = ctx->src;
> +	const struct sockaddr_vm *dst = ctx->dst;
> +	struct vsock_sock *vsk = vsock_sk(sk);
> +	struct net *net = ctx->net;
> +	bool space_available;
>  
> -	/* Check if sk has been closed or assigned to another transport before
> -	 * lock_sock (note: listener sockets are not assigned to any transport)
> +	/* Check after acquiring the socket lock. Listener sockets accept packets
> +	 * from any source and are not assigned to a transport.
>  	 */
>  	if (sock_flag(sk, SOCK_DONE) ||
>  	    (sk->sk_state != TCP_LISTEN &&
> -	     !vsock_check_source(vsk, &t->transport, &src))) {
> +	     !vsock_check_source(vsk, &t->transport, src))) {
>  		(void)virtio_transport_reset_no_sock(t, skb, net);
> -		release_sock(sk);
> -		sock_put(sk);
> -		goto free_pkt;
> +		return true;
>  	}
>  
>  	space_available = virtio_transport_space_update(sk, skb);
>  
>  	/* Update CID in case it has changed after a transport reset event */
>  	if (vsk->local_addr.svm_cid != VMADDR_CID_ANY)
> -		vsk->local_addr.svm_cid = dst.svm_cid;
> +		vsk->local_addr.svm_cid = dst->svm_cid;
>  
>  	if (space_available)
>  		sk->sk_write_space(sk);
> @@ -1875,12 +1891,49 @@ void virtio_transport_recv_pkt(struct virtio_transport *t,
>  		break;
>  	}
>  
> +	return false;
> +}
> +
> +/* We are under the virtio-vsock's vsock->rx_lock or vhost-vsock's vq->mutex
> + * lock.
> + */
> +void virtio_transport_recv_pkt(struct virtio_transport *t,
> +			       struct sk_buff *skb, struct net *net)
> +{
> +	struct virtio_transport_rx_pkt_ctx ctx;
> +	struct sockaddr_vm src, dst;
> +	struct sock *sk;
> +	bool free_pkt;
> +
> +	virtio_transport_recv_pkt_init_addrs(skb, &src, &dst);
> +	virtio_transport_trace_recv_pkt(skb, &src, &dst);
> +
> +	sk = virtio_transport_recv_pkt_find_socket(skb, &src, &dst, net);
> +	if (!sk) {
> +		(void)virtio_transport_reset_no_sock(t, skb, net);
> +		goto free_pkt;
> +	}
> +
> +	if (!skb_set_owner_sk_safe(skb, sk)) {
> +		WARN_ONCE(1, "receiving vsock socket has sk_refcnt == 0\n");
> +		goto free_pkt;
> +	}
> +
> +	lock_sock(sk);
> +	ctx = (struct virtio_transport_rx_pkt_ctx) {
> +		.net = net,
> +		.src = &src,
> +		.dst = &dst,
> +	};
> +	free_pkt = virtio_transport_recv_pkt_locked(t, skb, sk, &ctx);

At this point the socket lookup succeeded with src/dst/net, why not just
pass sk which already has all of them?

Best,
Bobby
