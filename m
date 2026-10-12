Received: from mail-ot1-f42.google.com (mail-ot1-f42.google.com [209.85.210.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AD7D4F797D
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 21:34:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791840866; cv=none; b=c/3MfPEY7gqur7GwpdEE2954OJcPVs8LwKIbt92AHlkRfA2/FhLeemyKp8lbs1rFlFkjMVsHI1vrgY1nrt9nKnyVjYMUKq9DQQRSGn2aSs49VypzveGhvtLp+Hv/moyW4fwb6VlthFeixRU7ZAOvaWquuHHVjMM9XvZslRYo8NU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791840866; c=relaxed/simple;
	bh=Hc1ijqb78M+KCiboOG1eU95mN0RQFKIJR2c7e4qGr2g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qJlislBJOB9rNed4fHyk8ag+ms8XUnNikyf97wolVXo2TFCpTdiv11Z9uLJJQEmejrNetvpCIP7UOQkjrm6s9Fds0PfmCwz7NRs4IpDeiegDRb5KrzDFDslR7yYGJjqs/2+7zw+hQITqv5K3U4Ya+haSVEWaePA0tn29eAIKW84=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CSlGCtoJ; arc=none smtp.client-ip=209.85.210.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CSlGCtoJ"
Received: by mail-ot1-f42.google.com with SMTP id 46e09a7af769-7f432ac553fso2799868a34.3
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 14:34:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791840863; x=1792445663; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Wtcrbd6Cgz3Ugy3PXt8EJcehRCAPru4qEFOiOsw7Yk8=;
        b=CSlGCtoJY274zs2yLfnnW/EvvrLSzrH1eHdv3PUmD1wSlMEDqWXKa43fEGcacZnapO
         CTCfBp0oAKfuuA73J86lYpgpMARKxT60b2SOobhTHUaPrQyGOw5bW8J3sPfLrX7T3enk
         2LTcrpUNAjk+Oh/kpw0LUqe/FfTNbBZGperGCp1kod30d9E+y9lX4ZSFa8TRpHMBCdaU
         i+SlborerQNhyVrpx4/lUjtKwDYNyoDAUU6WJY4wZPTdE0BOhp7MlvQ5OKCYdVGG+nlE
         cKzMpXw1JMcgMN8zRtSLWQHglgUj4PuBbhdd/a5MKRaBLPE7iUZHY7oDpunzoFew+YoO
         8lYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791840863; x=1792445663;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Wtcrbd6Cgz3Ugy3PXt8EJcehRCAPru4qEFOiOsw7Yk8=;
        b=LEJ1W7euVHQc7Yw8CcrYxKu3xrWKEAXFGxaZB9U2EBT/9Y4nV970kvhfbaZVa3oJGT
         uCthpO3grQP5uR4uqUYQfdYE1a2vbQAToSnYMAHhlzHx8w+8er8dRmu58mZUpsnV3kfr
         UslBL38smNfxMwk5qdtSLbSzZZ+C7c59ND44ZfR3xHNV2iNTikZzMTnWoauYUyVqMDdM
         a6eNAqcUJKoHflJE3eaJ4C8RfWE4Y6zkG5G6dIpuSqm6FOGQSw5lAOX9l4DW57xaY0CY
         j99ejrwP6wPycMtchrhN/M/thV/ZnlvQofm7DdmpYvSDPSegQDm8EQYdiAjDAjOtHDYL
         PB8g==
X-Forwarded-Encrypted: i=1; AKwUvBwlTiEi3LyCWNoAuZVrxbGOPGJscHoJWbyOZwludsgcEUY8ZK/sPHzsVC9G1dJrT5nWbYUL70i56E12J7c=@vger.kernel.org
X-Gm-Message-State: AFq9FYKt3V96GvkHKpenw38cFHGWBKWiHA/8X9ZySBNCdSuvqIk6N+yP
	QqkUCbzTGNAxWgWGKf++KknYutU8LTp0/mrqjPkamrnYcQo6g0Ln+/79
X-Gm-Gg: AYBFou0BjWSFpwFpy+uraHhiS0OmCSUHnFruITHJq+pL9GgKso6D8RFDiWZ8G0M8paD
	DtgUwJ0hiVcyupV2nWzCgPFs7DURLDcm5K6ouTLCAP8asR5KRqyqtAfO4pUZ4NAToinKqN/rTlC
	1+ybdYkQnqaK4F6KuUaAzmIN1zwPJJqo6RsYdx6alWS9yubJmvGSl5p8QJFwPwoFvabgKjKaOqt
	bLIXLRhiYhzGCW3QW4exe3+vGIQUOcVv/LQmsW5QZU9jJ6EWO/EwtFSMuf91KEtaf6BAmu2t1t3
	q14/MHL+Sz783n2w2/RymTEeUyDMk5uRVvmEAVRAWLV7BOmmxwzNM7F6WbpidkvuE6YmE48IdVf
	RFVeInoHrBTQ4tFF7MFTCx06zPjInFcro0IKYeQZ6Of+hEdOgaS7MTMljXVvVLDyiMxP0ZQhZoF
	AIHhe/xrb/Cy+cVavuzTExLC/F9HuIXLy4aSzqUrjTzWwu93zpbF3yyO/fut93WwBihGamzcKTM
	Vr2nLhxGrC+Ui6DaBQq
X-Received: by 2002:a05:6830:4c0a:b0:80a:b8da:2792 with SMTP id 46e09a7af769-83094e783camr11556972a34.6.1791840863000;
        Mon, 12 Oct 2026 14:34:23 -0700 (PDT)
Received: from devvm29614.prn0.facebook.com ([2a03:2880:ff:49::])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-8303a515aa9sm11078644a34.25.2026.10.12.14.34.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 14:34:21 -0700 (PDT)
Date: Mon, 12 Oct 2026 14:34:18 -0700
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
Message-ID: <as1SWsJw2dSrPYcL@devvm29614.prn0.facebook.com>
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
> diff --git a/net/vmw_vsock/virtio_transport_common.c b/net/vmw_vsock/virtio_transport_common.c
> index f225f53..e3e75e5 100644
> --- a/net/vmw_vsock/virtio_transport_common.c
> +++ b/net/vmw_vsock/virtio_transport_common.c
> @@ -1774,81 +1774,97 @@ static bool virtio_transport_valid_type(u16 type)
>  	       (type == VIRTIO_VSOCK_TYPE_SEQPACKET);
>  }
>  
> -/* We are under the virtio-vsock's vsock->rx_lock or vhost-vsock's vq->mutex
> - * lock.
> - */
> -void virtio_transport_recv_pkt(struct virtio_transport *t,
> -			       struct sk_buff *skb, struct net *net)
> +static void
> +virtio_transport_recv_pkt_init_addrs(struct sk_buff *skb,
> +				     struct sockaddr_vm *src,
> +				     struct sockaddr_vm *dst)

I'd prefer these calls stay inline, there is nothing complex enough here
to justify abstracting IMHO.

Could we move things around so that we don't have the arbitrary move of
virtio_transport_recv_pkt()? It tends to create noise and makes it
harder to focus on the more important parts of the patch.

>  {
>  	struct virtio_vsock_hdr *hdr = virtio_vsock_hdr(skb);
> -	struct sockaddr_vm src, dst;
> -	struct vsock_sock *vsk;
> -	struct sock *sk;
> -	bool space_available;
>  
> -	vsock_addr_init(&src, le64_to_cpu(hdr->src_cid),
> +	vsock_addr_init(src, le64_to_cpu(hdr->src_cid),
>  			le32_to_cpu(hdr->src_port));
> -	vsock_addr_init(&dst, le64_to_cpu(hdr->dst_cid),
> +	vsock_addr_init(dst, le64_to_cpu(hdr->dst_cid),
>  			le32_to_cpu(hdr->dst_port));
> +}
> +
> +static void
> +virtio_transport_trace_recv_pkt(struct sk_buff *skb,
> +				const struct sockaddr_vm *src,
> +				const struct sockaddr_vm *dst)
> +{
> +	struct virtio_vsock_hdr *hdr = virtio_vsock_hdr(skb);
>  
> -	trace_virtio_transport_recv_pkt(src.svm_cid, src.svm_port,
> -					dst.svm_cid, dst.svm_port,
> +	trace_virtio_transport_recv_pkt(src->svm_cid, src->svm_port,
> +					dst->svm_cid, dst->svm_port,
>  					le32_to_cpu(hdr->len),
>  					le16_to_cpu(hdr->type),
>  					le16_to_cpu(hdr->op),
>  					le32_to_cpu(hdr->flags),
>  					le32_to_cpu(hdr->buf_alloc),
>  					le32_to_cpu(hdr->fwd_cnt));
> +}

Any chance we can get rid of this wrapper and just call
trace_virtio_transport_recv_pkt() directly? Even from multiple call
sites I don't think this is a big simplification win.

>  
> -	if (!virtio_transport_valid_type(le16_to_cpu(hdr->type))) {
> -		(void)virtio_transport_reset_no_sock(t, skb, net);
> -		goto free_pkt;
> -	}
> +static struct sock *
> +virtio_transport_recv_pkt_find_socket(struct sk_buff *skb,
> +				      struct sockaddr_vm *src,
> +				      struct sockaddr_vm *dst,
> +				      struct net *net)
> +{
> +	struct virtio_vsock_hdr *hdr = virtio_vsock_hdr(skb);
> +	struct sock *sk;
>  
> -	/* The socket must be in connected or bound table
> -	 * otherwise send reset back
> -	 */
> -	sk = vsock_find_connected_socket_net(&src, &dst, net);
> -	if (!sk) {
> -		sk = vsock_find_bound_socket_net(&dst, net);
> -		if (!sk) {
> -			(void)virtio_transport_reset_no_sock(t, skb, net);
> -			goto free_pkt;
> -		}
> -	}
> +	if (!virtio_transport_valid_type(le16_to_cpu(hdr->type)))
> +		return NULL;
> +
> +	sk = vsock_find_connected_socket_net(src, dst, net);
> +	if (!sk)
> +		sk = vsock_find_bound_socket_net(dst, net);
> +	if (!sk)
> +		return NULL;
>  
>  	if (virtio_transport_get_type(sk) != le16_to_cpu(hdr->type)) {
> -		(void)virtio_transport_reset_no_sock(t, skb, net);
>  		sock_put(sk);
> -		goto free_pkt;
> +		return NULL;
>  	}
>  
> -	if (!skb_set_owner_sk_safe(skb, sk)) {
> -		WARN_ONCE(1, "receiving vsock socket has sk_refcnt == 0\n");
> -		goto free_pkt;
> -	}
> +	return sk;
> +}

Similarly here, the unrelated functions blending makes for a harder
read. Maybe worth moving things around or trying a different diff
algorithm?

nit: maybe we could just call this virtio_transport_find_socket()? AFAIK
the tx side doesn't need a socket lookup since we already have the
socket there, so we can omit the disambiguation if it lends a nicer
name.

>  
> -	vsk = vsock_sk(sk);
> +struct virtio_transport_rx_pkt_ctx {
> +	struct net *net;
> +	const struct sockaddr_vm *src;
> +	const struct sockaddr_vm *dst;
> +};

Let's just pass these directly too...

>  
> -	lock_sock(sk);
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

We can probably remove the first sentence since the function-level
comment already declares we are holding the socket lock.

Best,
Bobby

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
> +	}
> +	free_pkt = virtio_transport_recv_pkt_locked(t, skb, sk, &ctx);
>  	release_sock(sk);
>  
>  	/* Release refcnt obtained when we fetched this socket out of the
>  	 * bound or connected list.
>  	 */
>  	sock_put(sk);
> +	if (free_pkt)
> +		kfree_skb(skb);
>  	return;
>  
>  free_pkt:
> -- 
> 2.34.1
> 
