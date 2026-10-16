Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74DDB384CD8
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 08:14:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792138487; cv=none; b=Sq8mLCF+jpSY/nlkxhnei7TCBhjVTj8cHKnrw3VbVAlyOQsWeulTJ9gHAnX6AXayiLpCB5D1ltXzJok3sjc6a5U1UM1l630aI4ck4rdXCgqr98TC/tHVm+fFgW3BSk4GAvyhVkDTPYu9mZNIcG5GZmiSTxxLuhG8Hf5ah5k4Yuw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792138487; c=relaxed/simple;
	bh=6URY0D6oYme6xz01rwrlqB2zCECHzV8y7FzNmRlu6EY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PemFL8D/6cUWZcsRV+qYWECGbKFQDdKckNRZv8yj1Cm1Tdv/SVEbWHKIx+ToQ4orqxazARnw8mZ2sPSwPl2lJ6TY4MZHxT3cXe6KD2sF2nTwjAK3c31X6ACv20f9h7kBcU9fFg+xWatwNVnpRU4vtJhC11TT9EUcNo3gAYc8yls=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=M5piqYmh; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=Lzc/A7Ga; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="M5piqYmh";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="Lzc/A7Ga"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1792138484;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=56RICpgwGhNm6LSWh8AoomM8aDXtuq7tL8RIbQGojuE=;
	b=M5piqYmh/ljmPlI/iQu4YfRZBvRXdMRXb4nFhe+g3fWv3GnyhZqwoCKkQyCeogLKyLlEeQ
	+4Iqa2UVfJdC9On0rd3swGsNOsWJvIQuxgB/yj5vY2DlZf+Y53SL6m74l+wZ2LkfaBBUee
	eFfIo8Xh6IEZKtOIQzmuHiuQ1Jwou24=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-504-a0SC3R1NOPexmTu2YHiRiw-1; Fri, 16 Oct 2026 08:14:42 +0000
X-MC-Unique: a0SC3R1NOPexmTu2YHiRiw-1
X-Mimecast-MFC-AGG-ID: a0SC3R1NOPexmTu2YHiRiw_1792138481
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-4a01b112fa2so40565005e9.1
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 01:14:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1792138481; x=1792743281; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=56RICpgwGhNm6LSWh8AoomM8aDXtuq7tL8RIbQGojuE=;
        b=Lzc/A7Gamz+gQPJhr4UEKRx2WeSl3HpfGfE3m2fkB5kNU2Si/Q1+3tNYW2cUBaJZ15
         dfK+eIU0Ut9JdMoBR2fy/d2D1tovzOMLnPftfh+42Yd0SBHTjG+wnX/JYqjSavCfqV+C
         5htEfdRGJ96STAmEY2GshKIjiX5jXdR5M7G+OGjHd17Xy3omGYxFYj+ZkyOX3M/4JsHT
         SWQsTMuq4tfWzW5dD/5shyKKfTsFxVT8RXa9sE3hJ0jM3Rijs97ZPWekGuYOeiMfkrs8
         0LmWgDOwB06H8VvDeFc1b24hvCLPPTGujNSGzkeVrVViL/r8zz+Ror4N+BjrRNPPSap8
         Ktwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792138481; x=1792743281;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=56RICpgwGhNm6LSWh8AoomM8aDXtuq7tL8RIbQGojuE=;
        b=bhlrg0BAlYKr32rdfi7rGEpQIWJhy6gUuBAi/AsSTMTjSoIWjWYn6UNbdrwbF985QG
         sOJCfLVlQCo9ioadtMVqqcHj1kpIXghn9dQTxMHEVumZYn4fwIbl3k0SSyGA8dgbkleb
         lrhFQjcFkaAmmXkWeQR2y/jnLQtGEADX9GwncGFv2cnd0jRyNmf2ieQPJjbSw5/AYrhc
         +R0gxNwK5Exvc6aAdE18fvJCBCzUrapaGAPtbI1SVHAl/hY3jie1OfR22FGHNUOu14qj
         5JHv7KkmhTMxrAqxp2TP7nWoZwcAcqI9Gpy29pXxUnHa3Kdq63K98yE4VmulObFZ+hV2
         DBhQ==
X-Forwarded-Encrypted: i=1; AKwUvByHOwL00fbFbV4EodZ7TEAC7i+dFZxkEJ7/gSE8AzslyFRiM9dAqf0ZvJmOvwAZi5NNoTF64u0G7nIhFYA=@vger.kernel.org
X-Gm-Message-State: AFq9FYI5w/zyroMSllJJ74mp4T+7R3ydUflpHFege9u0CL6u70qD9hYi
	oUQYNdKkD0ZwRA0tbX+vs+2CN3NQhR0ud+Ef8EPz3ADE+EOBXgzPnjjF54WRubfu3P06lbIWDgs
	IvDE+9Z/p0W6muCRm5RBp9UMYpGI3GMgtx9HVMU3A97djbzkeGbpPmbGS3dbycA1dGg==
X-Gm-Gg: AYBFou392Msh7bu0yqIygJ60JtpqoydtMgJyDzPwjq+LYOPVj+jixjoHik+TVOM8bbD
	b+QFINkfnsFXpIMhVEXA6wlSAEI56PVJZcZMil1YvAdFC7QPwXlDPFUcB54+HBVMcPrYgt8YxHQ
	syUfGYWLqDLCIxqtK7CHdAELBArAp6KKr5J5+CviGi/ysWnfkLB9wVIV1E2PluHHtfDjiy5BAQK
	rTZBV9Uj6/whmwDNtQTx0JvdrnC+7lePeJj45z697FZhC+yhKACMPe30QOCcHNml0e/RDWwtaWk
	pHPHH8bkISBcB7LY/vqji4fOhTt6m03Tjms9cK63Haqem5aN1dkTkmXQ8xNhTT84eJyyfsrwtNq
	YqqoQ
X-Received: by 2002:a05:600c:19cf:b0:4a0:168f:d962 with SMTP id 5b1f17b1804b1-4a18e44363dmr423676135e9.3.1792138481284;
        Fri, 16 Oct 2026 01:14:41 -0700 (PDT)
X-Received: by 2002:a05:600c:19cf:b0:4a0:168f:d962 with SMTP id 5b1f17b1804b1-4a18e44363dmr423675585e9.3.1792138480725;
        Fri, 16 Oct 2026 01:14:40 -0700 (PDT)
Received: from sgarzare-redhat ([80.116.137.133])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd47104csm3835450f8f.8.2026.10.16.01.14.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 01:14:39 -0700 (PDT)
Date: Fri, 16 Oct 2026 10:14:37 +0200
From: Stefano Garzarella <sgarzare@redhat.com>
To: David Carlier <devnexen@gmail.com>
Cc: netdev@vger.kernel.org, bobbyeshleman@gmail.com, davem@davemloft.net, 
	edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com, horms@kernel.org, 
	virtualization@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next v2 1/2] vsock: support SO_INQ on stream sockets
Message-ID: <atHT4vOo39HBEBva@sgarzare-redhat>
References: <20261015154334.3217358-1-devnexen@gmail.com>
 <20261015154334.3217358-2-devnexen@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20261015154334.3217358-2-devnexen@gmail.com>

On Thu, Oct 15, 2026 at 04:43:33PM +0100, David Carlier wrote:
>SO_INQ makes recvmsg() return the bytes left in the receive queue in an
>SCM_INQ cmsg, saving a SIOCINQ call per receive. AF_UNIX stream sockets
>support it, AF_VSOCK fails with ENOPROTOOPT.
>
>Add it for SOCK_STREAM, reusing the hint already computed for io_uring.
>As with TCP_INQ, 1 is reported once the stream is finished so the caller
>reads again and sees EOF, and accepted sockets inherit the setting from
>the listener. No cmsg is sent when the transport cannot report the queue
>length.
>
>SOCK_SEQPACKET is refused, as on AF_UNIX: its transport callback counts
>messages, not bytes.
>
>Signed-off-by: David Carlier <devnexen@gmail.com>
>---
> include/net/af_vsock.h   |   1 +
> net/vmw_vsock/af_vsock.c | 111 +++++++++++++++++++++++++++++----------
> 2 files changed, 84 insertions(+), 28 deletions(-)
>
>diff --git a/include/net/af_vsock.h b/include/net/af_vsock.h
>index 5549298c1ec6..e8481f12312e 100644
>--- a/include/net/af_vsock.h
>+++ b/include/net/af_vsock.h
>@@ -68,6 +68,7 @@ struct vsock_sock {
> 	u64 buffer_size;
> 	u64 buffer_min_size;
> 	u64 buffer_max_size;
>+	bool recvmsg_inq;
>
> 	/* Private to transport. */
> 	void *trans;
>diff --git a/net/vmw_vsock/af_vsock.c b/net/vmw_vsock/af_vsock.c
>index 1c2d1cea67f4..186ed57fd797 100644
>--- a/net/vmw_vsock/af_vsock.c
>+++ b/net/vmw_vsock/af_vsock.c
>@@ -984,6 +984,7 @@ static struct sock *__vsock_create(struct net *net,
> 		vsk->buffer_size = psk->buffer_size;
> 		vsk->buffer_min_size = psk->buffer_min_size;
> 		vsk->buffer_max_size = psk->buffer_max_size;
>+		vsk->recvmsg_inq = psk->recvmsg_inq;
> 		security_sk_clone(parent, sk);
> 	} else {
> 		vsk->trusted = ns_capable_noaudit(&init_user_ns, CAP_NET_ADMIN);
>@@ -2014,6 +2015,66 @@ static void vsock_update_buffer_size(struct vsock_sock *vsk,
> 	vsk->buffer_size = val;
> }
>
>+static bool vsock_custom_sockopt(int optname)

Looking at the other function, what about vsock_sol_socket_custom()?

>+{
>+	switch (optname) {
>+	case SO_ZEROCOPY:
>+	case SO_INQ:
>+		return true;
>+	default:
>+		return false;
>+	}
>+}
>+
>+static int vsock_sol_socket_setsockopt(struct sock *sk, int optname,
>+				       sockptr_t optval, unsigned int optlen)
>+{
>+	struct vsock_sock *vsk = vsock_sk(sk);
>+	int err = 0;
>+	int val;
>+
>+	/* Use 'int' type here, because variable to

nit: why not using at least 80 columns for this comment?

>+	 * set these options usually has this type.
>+	 */
>+	if (optlen < sizeof(val))
>+		return -EINVAL;
>+
>+	if (copy_from_sockptr(&val, optval, sizeof(val)))
>+		return -EFAULT;
>+
>+	if (val < 0 || val > 1)
>+		return -EINVAL;

What about adding an helper with this code, and call it after checks for 
each SO_, in this way using SO_INQ on sock_dgram with 2 will return 
-ENOPROTOOPT.

Oh wait, we can use COPY_IN and duplicate the check in each place or add 
an helper just for that.

>+
>+	lock_sock(sk);
>+
>+	switch (optname) {
>+	case SO_ZEROCOPY:
>+		if (vsk->transport && !vsock_msgzerocopy_allow(vsk->transport)) {
>+			err = -EOPNOTSUPP;
>+			break;
>+		}
>+
>+		sock_valbool_flag(sk, SOCK_ZEROCOPY, val);
>+		break;
>+
>+	case SO_INQ:
>+		if (sk->sk_type != SOCK_STREAM) {
>+			err = -ENOPROTOOPT;
>+			break;
>+		}
>+
>+		vsk->recvmsg_inq = val;
>+		break;
>+
>+	default:
>+		err = -ENOPROTOOPT;
>+		break;
>+	}
>+
>+	release_sock(sk);
>+	return err;
>+}

Now it's much better, but we should not mix a refactoring with a new 
feature, so please split this patch in 2 patches, first one introducing 
vsock_sol_socket_setsockopt() just for SO_ZEROCOPY, second one 
introducing SO_INQ handling.

In this way, if we have to backport a fix to SO_ZEROCOPY handling in a 
stable branch, we can do it easily.

The rest LGTM,
Stefano

>+
> static int vsock_connectible_setsockopt(struct socket *sock,
> 					int level,
> 					int optname,
>@@ -2045,36 +2106,16 @@ static int vsock_connectible_setsockopt(struct socket *sock,
> 	sk = sock->sk;
> 	vsk = vsock_sk(sk);
>
>-	lock_sock(sk);
>-
>-	transport = vsk->transport;
>-
> 	if (level == SOL_SOCKET) {
>-		int zerocopy;
>-
>-		if (optname != SO_ZEROCOPY) {
>-			release_sock(sk);
>+		if (!vsock_custom_sockopt(optname))
> 			return sock_setsockopt(sock, level, optname, optval, optlen);
>-		}
>-
>-		/* Use 'int' type here, because variable to
>-		 * set this option usually has this type.
>-		 */
>-		COPY_IN(zerocopy);
>
>-		if (zerocopy < 0 || zerocopy > 1) {
>-			err = -EINVAL;
>-			goto exit;
>-		}
>+		return vsock_sol_socket_setsockopt(sk, optname, optval, optlen);
>+	}
>
>-		if (transport && !vsock_msgzerocopy_allow(transport)) {
>-			err = -EOPNOTSUPP;
>-			goto exit;
>-		}
>+	lock_sock(sk);
>
>-		sock_valbool_flag(sk, SOCK_ZEROCOPY, zerocopy);
>-		goto exit;
>-	}
>+	transport = vsk->transport;
>
> 	switch (optname) {
> 	case SO_VM_SOCKETS_BUFFER_SIZE:
>@@ -2581,6 +2622,7 @@ __vsock_connectible_recvmsg(struct socket *sock, struct msghdr *msg, size_t len,
> 	struct sock *sk;
> 	struct vsock_sock *vsk;
> 	const struct vsock_transport *transport;
>+	bool do_cmsg = false;
> 	int err;
>
> 	sk = sock->sk;
>@@ -2637,13 +2679,26 @@ __vsock_connectible_recvmsg(struct socket *sock, struct msghdr *msg, size_t len,
> 		err = __vsock_seqpacket_recvmsg(sk, msg, len, flags);
>
> out:
>-	/* Seqpacket has_data counts messages, while io_uring treats msg_inq as
>-	 * a byte length when sizing retries, so only streams report a hint.
>+	/* Seqpacket has_data counts messages, while SCM_INQ reports bytes and
>+	 * io_uring treats msg_inq as a byte length when sizing retries, so
>+	 * only streams report it.
> 	 */
>-	if (msg->msg_get_inq && err >= 0 && sk->sk_type == SOCK_STREAM)
>+	if ((vsk->recvmsg_inq || msg->msg_get_inq) && err >= 0 &&
>+	    sk->sk_type == SOCK_STREAM) {
> 		msg->msg_inq = vsock_stream_inq_hint(sk);
>
>+		/* A negative hint means the transport could not tell. SCM_INQ
>+		 * has no encoding for that, so report nothing.
>+		 */
>+		do_cmsg = vsk->recvmsg_inq && msg->msg_inq >= 0;
>+	}
>+
> 	release_sock(sk);
>+
>+	if (do_cmsg)
>+		put_cmsg(msg, SOL_SOCKET, SCM_INQ, sizeof(msg->msg_inq),
>+			 &msg->msg_inq);
>+
> 	return err;
> }
>
>-- 
>2.55.0
>

