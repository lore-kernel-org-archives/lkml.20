Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5871836B912
	for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 09:08:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789895338; cv=none; b=CQ13f8sffX014UvDxzkTf/BJ8pFh3sfESZgsOk/0imsUsYcSmUQYoADarV9r17UZKnM3oLwp+3zoxzCwQEqYDa5Div1FnLoHbyuHiH+4lQnif6ljSxjphmC4M3PuvB5n5y9u/o4tBHAXiEghIIq+yLZfUvVAL3AtTgUyenarDuU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789895338; c=relaxed/simple;
	bh=Kpj/3YYcrWVRQOfZB3Vpm+urkRgZJqiel/b4w8mA/z0=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=OYwSXDfuuiYOdOx5vrd2PhmZcNDuYxsDSaijN89t6PrIl+nKbfhZg8fp1Dd8CNZ9TA0GavYicMaW632s8pwOaLZPwAAwpeIQJgxZdU3ZjL9CkMGjZFRbUD1FhQj9e6JqYoL3SabgHIXsIr7hR6zb7EV85ZVzqmId24E/6x4zjGM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LeabTi5s; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LeabTi5s"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-4843f22dcb8so1369277f8f.0
        for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 02:08:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789895334; x=1790500134; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=LuoIcNR8M3VmrQ/YOAKp2aarikMbYVcQakxWPsHNlLI=;
        b=LeabTi5s/d/Ots26bQ144ovQnBC9eyVCJeAym7jI92YkWo+wH+BwT0ouRnBixnQXSB
         8JOozWbVprLkVsjArHJER+NDHmBF1Bzpg4U+5Gs8YvSWIYcS/dp7wOhBA+v4LQmCAtMl
         r93xCIMeK8cm0GxiQx6++5fNAQyh9/Dr0pyNaSUlIZggVfyCPd4uKQkz4AljlsGUK17j
         kKdsWRtxA6W6Wnt6ndkedtHByyWypAu3ERWsmusHh+cCJCfG1+OZCyfBGt6fzGzhqBch
         +wZQJuTvckfpnuvOsMqsixVxZx1D/+WvtE0aaICkBjkn74ictn3slb+DFGH+zEbkONI7
         hXdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789895334; x=1790500134;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LuoIcNR8M3VmrQ/YOAKp2aarikMbYVcQakxWPsHNlLI=;
        b=qRpauPy0nb/8lclfkJa4rlqW8aO5EsHZr0ZldKJZpewpY7aYM0sLVsV2+SIFKS1GiW
         bphVVbClNqEGPPlxp0i3qndIGiLhqCyoXIdiZKT9tykT2HCjJmJSw3cM2yFA2QlYj6Vf
         gutlkvKMVp9JP6MRDfLTQ8VjmAsWuSq1WwaLUSObhB8Xkotu/WOxQuU9rVZOHHQ2kfDL
         3k3z/eoSF0pn5u1T3jcnQgPkc7VIARWVDNgWdE3CLrc3NMx/e4tcgYqfmYsksjw57F2Y
         8xokWf8WcQ90gu7ga5o9aBL0XJ44UPK46VGFl1WKdw5sWPc1T7pCltETd9krpHnycowX
         KSGQ==
X-Forwarded-Encrypted: i=1; AKwUvBxTB/TLOQZDh4mddX4NIu/qEU4akSr5w1/3/sW8JN9C4ZRBAPdvHturl0CW9iKuFWMUQcDrtGtPKQs5Byg=@vger.kernel.org
X-Gm-Message-State: AFuF++lOlpBqqJ8l0PfBmHQyd3oZcumbU7HLl+XkU7TxOIMEHjctk+QH
	OiCLK6VGeSqDlDooP/PGn1MkD6qPKoXKZUi6RR+6JJLwRPbf5R2t4MIb
X-Gm-Gg: AYBFou1Kb5pVpPFgSUuEo+E7Djo1C6UdsDGtXiMCRmEsjY7h3FocV6uf0IRe1JzBp48
	MzB7AUOavxaq3KSKU5mtn59+d6xWtrgm+jIaxRCm24EksQatP2kVHucL5g8UhQxpTsLX80vjVH6
	pnKQ/2qbwasZW6QnP5zulGwdt2MJ7TUln4nb/oAMwhenWMc9wPwRL/dmLPFNzmRcX5NxcE/e0dj
	Ru6ug0igRcv11vgFzyyfsgwLrfAbw60i6wS9J3EPqysfM7omWLivpPdQurpJbNsn5Af+Irk7Fap
	TNijMXDReVG3jRc20BIEMSIQ3f5XimsG3gYjGeFIxuoDAvfskbWEA/lHIiyrCjSv01N6Lg1Pe1a
	jBvzkJWTnNMiqgNKOtVeK1IZIyL1f54h3+Vw/2v57XgAumQFJaoaARwL4MO6Oa9BtJ/FO2gMpzb
	y4NdW8e+lr7JXy4k1kEiohnqRBxT25oaX62RnCL2XHW/WgoP8J5wpgU6laJxXtc0pEac2YT6fl/
	KeH9a7ESZTav5kEXNtj7TapLS7QBkJFt/0=
X-Received: by 2002:a05:6000:2210:b0:487:b4a:3f54 with SMTP id ffacd0b85a97d-4871e269d90mr11394524f8f.29.1789895334332;
        Sun, 20 Sep 2026 02:08:54 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-487244229d5sm13813240f8f.2.2026.09.20.02.08.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Sep 2026 02:08:53 -0700 (PDT)
Date: Sun, 20 Sep 2026 10:08:52 +0100
From: David Laight <david.laight.linux@gmail.com>
To: =?UTF-8?B?QmFydMWCb21pZWo=?= Dmitruk <bartlomiej.dmitruk@isec.pl>
Cc: Stefan Hajnoczi <stefanha@redhat.com>, Stefano Garzarella
 <sgarzare@redhat.com>, "Michael S . Tsirkin" <mst@redhat.com>, Jason Wang
 <jasowangio@gmail.com>, Eugenio =?UTF-8?B?UMOpcmV6?= <eperezma@redhat.com>,
 Xuan Zhuo <xuanzhuo@linux.alibaba.com>, "David S . Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub Kicinski
 <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Simon Horman
 <horms@kernel.org>, kvm@vger.kernel.org, virtualization@lists.linux.dev,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] vsock: keep SOCK_SEQPACKET message boundaries on
 interrupted send
Message-ID: <20260920100852.7806895b@pumpkin>
In-Reply-To: <20260919122916.28226-1-bartlomiej.dmitruk@isec.pl>
References: <20260919122916.28226-1-bartlomiej.dmitruk@isec.pl>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Sat, 19 Sep 2026 14:29:15 +0200
Bart=C5=82omiej Dmitruk <bartlomiej.dmitruk@isec.pl> wrote:

> A credit-limited SOCK_SEQPACKET send transmits fragments as credit becomes
> available, and the VIRTIO_VSOCK_SEQ_EOM flag is set only on the fragment
> where msg_data_left() reaches 0. If vsock_connectible_sendmsg() exits via
> out_err after a partial send -- notably the non-terminal -EINTR path
> (signal_pending while blocked for credit), but also sk_err / peer
> RCV_SHUTDOWN -- the already-transmitted fragments carry no EOM. The recei=
ver
> only advances msg_count / sets msg_ready on an EOM skb, so the orphaned
> fragments are silently merged into the next message, violating SOCK_SEQPA=
CKET
> atomicity.

Should the unsent fragments just get requeued with an EOM flag?
The receiving system will have a partial message (and should be allowed to
pass that to an application) and will append the fragments to it when
they arrive.

>=20
> Wait until the whole remaining SEQPACKET message fits before enqueuing, s=
o a
> message is committed atomically (with its EOM) or not started; an error w=
hile
> waiting then leaves nothing on the wire. SOCK_STREAM behaviour is unchang=
ed
> (min_space =3D=3D 1 reproduces the old "wait while space =3D=3D 0").

Why should the message ever fit?
ISO transport (which no one really uses any more) maps to SEQPACKET.
It is perfectly valid for a file transfer program to send the entire file
as one 'message' by not sending EOM until the end of file fragment.

David

>=20
> To avoid blocking forever on a message that can never fit -- a peer can
> advertise a small buf_alloc, or the message can simply exceed the transmit
> buffer -- reject such a message up front with -EMSGSIZE (the same error t=
he
> transport already returns for an oversized message) instead of waiting. T=
his
> needs the transport's maximum message size, added as a new optional
> seqpacket_max_size() transport op implemented by the virtio/loopback
> transports.
>=20
> Signed-off-by: Bart=C5=82omiej Dmitruk <bartlomiej.dmitruk@isec.pl>
> Assisted-by: Claude (Anthropic)
> ---
> Changes in v2:
>  - Fix an indefinite wait the v1 approach introduced for oversized
>    SOCK_SEQPACKET messages (reported by the Sashiko AI review on v1): the
>    atomic-wait could never be satisfied when len > the transport's max
>    message size (e.g. a peer advertising a small peer_buf_alloc), so the
>    sender blocked instead of returning -EMSGSIZE. v2 checks this up front=
 via
>    the new seqpacket_max_size() op and returns -EMSGSIZE without waiting.
>  - v1: https://lore.kernel.org/netdev/20260917220101.55744-1-bartlomiej.d=
mitruk@isec.pl/
>=20
> Testing (vsock_loopback, unprivileged):
>  - Interrupted partial send (-EINTR) no longer leaks orphan bytes into the
>    next message (recv() returns only the next message).
>  - Oversized message and small-peer_buf_alloc cases return -EMSGSIZE prom=
ptly
>    instead of blocking.
>  - Normal SEQPACKET send/recv unaffected.
>=20
> diff --git a/include/linux/virtio_vsock.h b/include/linux/virtio_vsock.h
> index f91704731..e96790c03 100644
> --- a/include/linux/virtio_vsock.h
> +++ b/include/linux/virtio_vsock.h
> @@ -219,6 +219,7 @@ virtio_transport_seqpacket_dequeue(struct vsock_sock =
*vsk,
>  s64 virtio_transport_stream_has_data(struct vsock_sock *vsk);
>  s64 virtio_transport_stream_has_space(struct vsock_sock *vsk);
>  u32 virtio_transport_seqpacket_has_data(struct vsock_sock *vsk);
> +u32 virtio_transport_seqpacket_max_size(struct vsock_sock *vsk);
> =20
>  ssize_t virtio_transport_unsent_bytes(struct vsock_sock *vsk);
> =20
> diff --git a/include/net/af_vsock.h b/include/net/af_vsock.h
> index 5549298c1..d94c613ef 100644
> --- a/include/net/af_vsock.h
> +++ b/include/net/af_vsock.h
> @@ -143,6 +143,7 @@ struct vsock_transport {
>  				 size_t len);
>  	bool (*seqpacket_allow)(struct vsock_sock *vsk, u32 remote_cid);
>  	u32 (*seqpacket_has_data)(struct vsock_sock *vsk);
> +	u32 (*seqpacket_max_size)(struct vsock_sock *vsk);
> =20
>  	/* Notification. */
>  	int (*notify_poll_in)(struct vsock_sock *, size_t, bool *);
> diff --git a/net/vmw_vsock/af_vsock.c b/net/vmw_vsock/af_vsock.c
> index f840498b5..ac64cb957 100644
> --- a/net/vmw_vsock/af_vsock.c
> +++ b/net/vmw_vsock/af_vsock.c
> @@ -2250,9 +2250,32 @@ static int vsock_connectible_sendmsg(struct socket=
 *sock, struct msghdr *msg,
> =20
>  	while (total_written < len) {
>  		ssize_t written;
> +		s64 min_space;
> +
> +		if (sk->sk_type =3D=3D SOCK_SEQPACKET) {
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
> +				err =3D -EMSGSIZE;
> +				goto out_err;
> +			}
> +			min_space =3D len - total_written;
> +		} else {
> +			min_space =3D 1;
> +		}
> =20
>  		add_wait_queue(sk_sleep(sk), &wait);
> -		while (vsock_stream_has_space(vsk) =3D=3D 0 &&
> +		while (vsock_stream_has_space(vsk) < min_space &&
>  		       sk->sk_err =3D=3D 0 &&
>  		       !(sk->sk_shutdown & SEND_SHUTDOWN) &&
>  		       !(vsk->peer_shutdown & RCV_SHUTDOWN)) {
> diff --git a/net/vmw_vsock/virtio_transport.c b/net/vmw_vsock/virtio_tran=
sport.c
> index 4f9aa9c4c..b7d587a20 100644
> --- a/net/vmw_vsock/virtio_transport.c
> +++ b/net/vmw_vsock/virtio_transport.c
> @@ -585,6 +585,7 @@ static struct virtio_transport virtio_transport =3D {
>  		.seqpacket_enqueue        =3D virtio_transport_seqpacket_enqueue,
>  		.seqpacket_allow          =3D virtio_transport_seqpacket_allow,
>  		.seqpacket_has_data       =3D virtio_transport_seqpacket_has_data,
> +		.seqpacket_max_size       =3D virtio_transport_seqpacket_max_size,
> =20
>  		.msgzerocopy_allow        =3D virtio_transport_msgzerocopy_allow,
> =20
> diff --git a/net/vmw_vsock/virtio_transport_common.c b/net/vmw_vsock/virt=
io_transport_common.c
> index f225f53ed..e10e7b958 100644
> --- a/net/vmw_vsock/virtio_transport_common.c
> +++ b/net/vmw_vsock/virtio_transport_common.c
> @@ -994,6 +994,19 @@ virtio_transport_seqpacket_enqueue(struct vsock_sock=
 *vsk,
>  }
>  EXPORT_SYMBOL_GPL(virtio_transport_seqpacket_enqueue);
> =20
> +u32 virtio_transport_seqpacket_max_size(struct vsock_sock *vsk)
> +{
> +	struct virtio_vsock_sock *vvs =3D vsk->trans;
> +	u32 max_size;
> +
> +	spin_lock_bh(&vvs->tx_lock);
> +	max_size =3D virtio_transport_tx_buf_size(vvs);
> +	spin_unlock_bh(&vvs->tx_lock);
> +
> +	return max_size;
> +}
> +EXPORT_SYMBOL_GPL(virtio_transport_seqpacket_max_size);
> +
>  int
>  virtio_transport_dgram_dequeue(struct vsock_sock *vsk,
>  			       struct msghdr *msg,
> diff --git a/net/vmw_vsock/vsock_loopback.c b/net/vmw_vsock/vsock_loopbac=
k.c
> index 8068d1b6e..b9a0cc861 100644
> --- a/net/vmw_vsock/vsock_loopback.c
> +++ b/net/vmw_vsock/vsock_loopback.c
> @@ -90,6 +90,7 @@ static struct virtio_transport loopback_transport =3D {
>  		.seqpacket_enqueue        =3D virtio_transport_seqpacket_enqueue,
>  		.seqpacket_allow          =3D vsock_loopback_seqpacket_allow,
>  		.seqpacket_has_data       =3D virtio_transport_seqpacket_has_data,
> +		.seqpacket_max_size       =3D virtio_transport_seqpacket_max_size,
> =20
>  		.msgzerocopy_allow        =3D vsock_loopback_msgzerocopy_allow,
> =20
>=20

