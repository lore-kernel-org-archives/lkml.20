Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793624968;
	b=CtEc3TrhC4haFzN3jvHdbPjy+u6GU8Q5RkI4WzeXcx2c6u7/GWlg+psnv6vB0pvFO8mu
	 8lHT+Zhax+1JT+7LssioXBV/K8WYw/8qASos8u8KsQtUNuBtFT0d4deQiEdVoyiEvXgDd
	 7Rw/3+53FTPYlZ1HuCrLRTQ1Bi8q73UY8WKBlm1F7fN18gU5D2bPklOdoFMSxtWFUQnZm
	 PqSGZmkxDGgYBPTrEB2YhEw+uoacWYomyCSpLwsllrTEQVhafBLnIaTF8hxpnuys10+gz
	 cvIZVifhtSlKoUIfWexYeDYyqeLRDZKGkwCRp02Og4ybmS+uaRJq+SoYfv/+iLmPR5g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793624968;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To;
	bh=lPg1Z+kih2x3BmRrSyzS6hP0pvAD1UHy/E1nPZhrbok=;
	b=oTziWyB/rnUhRkI9MUuvfFgVrQpfhxqCsgQuJSTUVY7Vy2RBz3TR3bbDLMPTpzSdH7eA
	 g6yVk84lCXoeewSYSolDHL/qQ2TAuTCmiuKZCG+sWHPiXSxkbOArFhjsS82CS91iMIAp4
	 b2JDPnLKhsb0RF/5XcscTo0jXcHEOrmKaJt7f07eVEOxUcwo3jEsWDFfvnWQ7VgAV5fRB
	 33cZuLlnlEyPdbGF65Yd/3nRpuvagRlSuqnKj8SILdptTTGyUae+HTTBDAXEkb1IglhzT
	 bN+osAsowO6UQSbzmg5YGmwKNJOItnggN0eLeGRf8rFovR5uWW04Nr3rX3K2Zv8HlQA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Tssq+V3m;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=cL3RR7GZ;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71357606A333
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 13:09:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 71357606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Tssq+V3m;
	dkim=pass (2048-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=cL3RR7GZ
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1793624966;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lPg1Z+kih2x3BmRrSyzS6hP0pvAD1UHy/E1nPZhrbok=;
	b=Tssq+V3m/XH7wBrcP53CxDc3d20bC0g/HtQno7TOudzYWqVwBkPdwRnSmWWNDLy2+VyyOK
	rInqteqXllWsYCLA6eR+LdsbfAALwdFUUDoe909X8Cl1U5NzPh2GOyzkRMUiYurhRau6cb
	MEWPHFMYCjNL6ohzmzo0PrObzYL6vYo=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-682-AB8999R-NUCGUcj3dBYG8Q-1; Mon, 02 Nov 2026 08:09:23 -0500
X-MC-Unique: AB8999R-NUCGUcj3dBYG8Q-1
X-Mimecast-MFC-AGG-ID: AB8999R-NUCGUcj3dBYG8Q_1793624962
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-49febef74e3so27416815e9.0
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 05:09:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1793624962; x=1794229762; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=lPg1Z+kih2x3BmRrSyzS6hP0pvAD1UHy/E1nPZhrbok=;
        b=cL3RR7GZBRF6RxRO5aA8KKOgpPdRhYdFFBnb4dctlIcD+KreV6GFg3g03oX3+FRBD6
         ksSc1cAgMnSVc969CRkchN72goHDtzU3x5azAcE/g61/9FjN6jIzkImyi6aWzFxb+Zpn
         FnKE1H0uqoyMb3eH2a/b6P5FzSCrti17GbL4Wa3E+VjKO9tcKW5zlxrw5CUWyRwdk5g8
         ozYLh7OQ5tijJ7kLpxJ6demb5AU1VLByziEzOGiknX4rz/TpdTbF2jOuzXNmNsCiPRYq
         /bY7NIIAIdCpALH6YVf126irtz8uRkWEnxUoQlAgLaCGGIgcWC+wrTRnMzWc2CV7mgVU
         zg3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793624962; x=1794229762;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=lPg1Z+kih2x3BmRrSyzS6hP0pvAD1UHy/E1nPZhrbok=;
        b=2e7CXJCAKyI72UEoSZbgQMIx3Ry7kQ0+Qspumx8IFyRzyiuY1MvHUzgkElqDNtEX+B
         DIXIPjYLoM6gHCjE5Xfrc9Ch6iZkYCgtfWBq8nCqrJYZqH3xRIvag+a0y0OQ2p6C0ovx
         bZ2s4I0VY6il2KMAgVz8NmgDFwo+g8jbbJZ6X5S+xhS5g3xHZR56gVHFA3c4v5czBMO0
         baa9vAF0VpVN0Qb2AMO8Yi/hkHyJBL9oiDHI4Cj6g4KWDn7X5KjQlTwPV3eF83ftTUlX
         ebxgk3DNtYWLGkVpPqctkTyGiT3jDWH/9cMCd0zFkIAbmdZVr6LdcRfhapFiJ6BJ0w84
         xRwA==
X-Forwarded-Encrypted: i=1; AKwUvBwrtNTzT4KOvJei+vPIV4jcwke3E7m5tEXCTzx851XwMipMLhx+2GykP1YYbC0g/dUxgrsnvz40r64H2N8=@vger.kernel.org
X-Gm-Message-State: AFq9FYL7FAQRF++Kub3B2/zZZh8nqihl2Smldo+d2mULnK9CO3ue/OMj
	cI6S+HtWG3eNxgE7R8mPt3LN02DrZHXlSa9QYN7S+I672gYOO8zDWafaiZOQLfY01QvLEuMWcok
	2WaRS4HYVj9sNcFGvneEWNIouLpcTrVg8BaE8ltyXRXB336pffH18ftzh/DdoNbshKQ==
X-Gm-Gg: AYBFou05ENY1DlXcr9u6aRPHvJ4AQceqm39ZpC91Avb1eIKftItA7nzip5eT8w36DnB
	r+lDX9B+aytKw2xSOA/YbXTbz9tdoxP9bjf8KqPqy9FlCz8jddk9c8Rpu5ct8yiLkct0pI58IC+
	bbdP6yp4aly0uranAXXrulKAA27m8yxLk9Un3BoMbo4mVJyofGmSmjJqpbT4kudaIijeKhZuV6V
	gnikdjZhSP0+ruxidjJjUIhPKjsgaO5P4FB4Y0A/8ZOXwfmIfygaKD5XfqSNqn7pjJqRGrr8On2
	5Cvubxdmv0mZkrrI+ELz2Yf3UJNXid6wxGTGxiKjxU0kbD2b0Y0cHYsug0mjf95HwIqZFts1YZg
	5PbPgoQvfvS0i67xVa9yND65tritxkFw8qBoULCTnFQ==
X-Received: by 2002:a05:600d:1a:b0:4a1:d49e:9ce with SMTP id 5b1f17b1804b1-4aa86e16223mr303262785e9.2.1793624961747;
        Mon, 02 Nov 2026 05:09:21 -0800 (PST)
X-Received: by 2002:a05:600d:1a:b0:4a1:d49e:9ce with SMTP id 5b1f17b1804b1-4aa86e16223mr303261555e9.2.1793624961001;
        Mon, 02 Nov 2026 05:09:21 -0800 (PST)
Received: from redhat.com ([2a0d:6fc0:1501:b100:9ea2:fd21:b361:8dab])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71bae25dsm18089160f8f.59.2026.11.02.05.09.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 05:09:20 -0800 (PST)
Date: Mon, 2 Nov 2026 08:09:17 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: =?utf-8?Q?Bart=C5=82omiej?= Dmitruk <bartlomiej.dmitruk@isec.pl>
Cc: Stefan Hajnoczi <stefanha@redhat.com>,
	Stefano Garzarella <sgarzare@redhat.com>,
	Jason Wang <jasowangio@gmail.com>,
	Eugenio =?iso-8859-1?Q?P=E9rez?= <eperezma@redhat.com>,
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>, kvm@vger.kernel.org,
	virtualization@lists.linux.dev, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] vsock: keep SOCK_SEQPACKET message boundaries on
 interrupted send
Message-ID: <20261102080902-mutt-send-email-mst@kernel.org>
References: <20260919122916.28226-1-bartlomiej.dmitruk@isec.pl>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260919122916.28226-1-bartlomiej.dmitruk@isec.pl>

On Sat, Sep 19, 2026 at 02:29:15PM +0200, Bartłomiej Dmitruk wrote:
> A credit-limited SOCK_SEQPACKET send transmits fragments as credit becomes
> available, and the VIRTIO_VSOCK_SEQ_EOM flag is set only on the fragment
> where msg_data_left() reaches 0. If vsock_connectible_sendmsg() exits via
> out_err after a partial send -- notably the non-terminal -EINTR path
> (signal_pending while blocked for credit), but also sk_err / peer
> RCV_SHUTDOWN -- the already-transmitted fragments carry no EOM. The receiver
> only advances msg_count / sets msg_ready on an EOM skb, so the orphaned
> fragments are silently merged into the next message, violating SOCK_SEQPACKET
> atomicity.
> 
> Wait until the whole remaining SEQPACKET message fits before enqueuing, so a
> message is committed atomically (with its EOM) or not started; an error while
> waiting then leaves nothing on the wire. SOCK_STREAM behaviour is unchanged
> (min_space == 1 reproduces the old "wait while space == 0").
> 
> To avoid blocking forever on a message that can never fit -- a peer can
> advertise a small buf_alloc, or the message can simply exceed the transmit
> buffer -- reject such a message up front with -EMSGSIZE (the same error the
> transport already returns for an oversized message) instead of waiting. This
> needs the transport's maximum message size, added as a new optional
> seqpacket_max_size() transport op implemented by the virtio/loopback
> transports.
> 
> Signed-off-by: Bartłomiej Dmitruk <bartlomiej.dmitruk@isec.pl>
> Assisted-by: Claude (Anthropic)

Do you want to address the bot review?



> ---
> Changes in v2:
>  - Fix an indefinite wait the v1 approach introduced for oversized
>    SOCK_SEQPACKET messages (reported by the Sashiko AI review on v1): the
>    atomic-wait could never be satisfied when len > the transport's max
>    message size (e.g. a peer advertising a small peer_buf_alloc), so the
>    sender blocked instead of returning -EMSGSIZE. v2 checks this up front via
>    the new seqpacket_max_size() op and returns -EMSGSIZE without waiting.
>  - v1: https://lore.kernel.org/netdev/20260917220101.55744-1-bartlomiej.dmitruk@isec.pl/
> 
> Testing (vsock_loopback, unprivileged):
>  - Interrupted partial send (-EINTR) no longer leaks orphan bytes into the
>    next message (recv() returns only the next message).
>  - Oversized message and small-peer_buf_alloc cases return -EMSGSIZE promptly
>    instead of blocking.
>  - Normal SEQPACKET send/recv unaffected.
> 
> diff --git a/include/linux/virtio_vsock.h b/include/linux/virtio_vsock.h
> index f91704731..e96790c03 100644
> --- a/include/linux/virtio_vsock.h
> +++ b/include/linux/virtio_vsock.h
> @@ -219,6 +219,7 @@ virtio_transport_seqpacket_dequeue(struct vsock_sock *vsk,
>  s64 virtio_transport_stream_has_data(struct vsock_sock *vsk);
>  s64 virtio_transport_stream_has_space(struct vsock_sock *vsk);
>  u32 virtio_transport_seqpacket_has_data(struct vsock_sock *vsk);
> +u32 virtio_transport_seqpacket_max_size(struct vsock_sock *vsk);
>  
>  ssize_t virtio_transport_unsent_bytes(struct vsock_sock *vsk);
>  
> diff --git a/include/net/af_vsock.h b/include/net/af_vsock.h
> index 5549298c1..d94c613ef 100644
> --- a/include/net/af_vsock.h
> +++ b/include/net/af_vsock.h
> @@ -143,6 +143,7 @@ struct vsock_transport {
>  				 size_t len);
>  	bool (*seqpacket_allow)(struct vsock_sock *vsk, u32 remote_cid);
>  	u32 (*seqpacket_has_data)(struct vsock_sock *vsk);
> +	u32 (*seqpacket_max_size)(struct vsock_sock *vsk);
>  
>  	/* Notification. */
>  	int (*notify_poll_in)(struct vsock_sock *, size_t, bool *);
> diff --git a/net/vmw_vsock/af_vsock.c b/net/vmw_vsock/af_vsock.c
> index f840498b5..ac64cb957 100644
> --- a/net/vmw_vsock/af_vsock.c
> +++ b/net/vmw_vsock/af_vsock.c
> @@ -2250,9 +2250,32 @@ static int vsock_connectible_sendmsg(struct socket *sock, struct msghdr *msg,
>  
>  	while (total_written < len) {
>  		ssize_t written;
> +		s64 min_space;
> +
> +		if (sk->sk_type == SOCK_SEQPACKET) {
> +			/* A SEQPACKET message must be delivered atomically, so
> +			 * wait until the whole remaining message fits before
> +			 * enqueuing.  Otherwise a credit-limited partial send that
> +			 * later errors out (e.g. -EINTR) leaves EOM-less fragments
> +			 * that the peer merges into the next message.
> +			 *
> +			 * Reject a message that can never fit up front so the wait
> +			 * below cannot block forever (a peer may advertise a small
> +			 * buf_alloc); this mirrors the -EMSGSIZE the transport
> +			 * returns for an oversized message.
> +			 */
> +			if (transport->seqpacket_max_size &&
> +			    len > transport->seqpacket_max_size(vsk)) {
> +				err = -EMSGSIZE;
> +				goto out_err;
> +			}
> +			min_space = len - total_written;
> +		} else {
> +			min_space = 1;
> +		}
>  
>  		add_wait_queue(sk_sleep(sk), &wait);
> -		while (vsock_stream_has_space(vsk) == 0 &&
> +		while (vsock_stream_has_space(vsk) < min_space &&
>  		       sk->sk_err == 0 &&
>  		       !(sk->sk_shutdown & SEND_SHUTDOWN) &&
>  		       !(vsk->peer_shutdown & RCV_SHUTDOWN)) {
> diff --git a/net/vmw_vsock/virtio_transport.c b/net/vmw_vsock/virtio_transport.c
> index 4f9aa9c4c..b7d587a20 100644
> --- a/net/vmw_vsock/virtio_transport.c
> +++ b/net/vmw_vsock/virtio_transport.c
> @@ -585,6 +585,7 @@ static struct virtio_transport virtio_transport = {
>  		.seqpacket_enqueue        = virtio_transport_seqpacket_enqueue,
>  		.seqpacket_allow          = virtio_transport_seqpacket_allow,
>  		.seqpacket_has_data       = virtio_transport_seqpacket_has_data,
> +		.seqpacket_max_size       = virtio_transport_seqpacket_max_size,
>  
>  		.msgzerocopy_allow        = virtio_transport_msgzerocopy_allow,
>  
> diff --git a/net/vmw_vsock/virtio_transport_common.c b/net/vmw_vsock/virtio_transport_common.c
> index f225f53ed..e10e7b958 100644
> --- a/net/vmw_vsock/virtio_transport_common.c
> +++ b/net/vmw_vsock/virtio_transport_common.c
> @@ -994,6 +994,19 @@ virtio_transport_seqpacket_enqueue(struct vsock_sock *vsk,
>  }
>  EXPORT_SYMBOL_GPL(virtio_transport_seqpacket_enqueue);
>  
> +u32 virtio_transport_seqpacket_max_size(struct vsock_sock *vsk)
> +{
> +	struct virtio_vsock_sock *vvs = vsk->trans;
> +	u32 max_size;
> +
> +	spin_lock_bh(&vvs->tx_lock);
> +	max_size = virtio_transport_tx_buf_size(vvs);
> +	spin_unlock_bh(&vvs->tx_lock);
> +
> +	return max_size;
> +}
> +EXPORT_SYMBOL_GPL(virtio_transport_seqpacket_max_size);
> +
>  int
>  virtio_transport_dgram_dequeue(struct vsock_sock *vsk,
>  			       struct msghdr *msg,
> diff --git a/net/vmw_vsock/vsock_loopback.c b/net/vmw_vsock/vsock_loopback.c
> index 8068d1b6e..b9a0cc861 100644
> --- a/net/vmw_vsock/vsock_loopback.c
> +++ b/net/vmw_vsock/vsock_loopback.c
> @@ -90,6 +90,7 @@ static struct virtio_transport loopback_transport = {
>  		.seqpacket_enqueue        = virtio_transport_seqpacket_enqueue,
>  		.seqpacket_allow          = vsock_loopback_seqpacket_allow,
>  		.seqpacket_has_data       = virtio_transport_seqpacket_has_data,
> +		.seqpacket_max_size       = virtio_transport_seqpacket_max_size,
>  
>  		.msgzerocopy_allow        = vsock_loopback_msgzerocopy_allow,
>  

