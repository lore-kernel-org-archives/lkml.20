Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8716737F748
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 14:54:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791989669; cv=none; b=SNnnW5r+xcMqmwsVZU8PwdvizwZQdV1Owb9SogI01ByZ6rQLwYe8bhsW7aC2JOHIuZ9JdG9bhdNL9YNtIBjFwoWlT1HWMXItJRLK4hZxze+tYdupncEfSykQhaHbzje1smgIhzRYMmCl4vgDhh4Zd6ibpNkpgfmVdxFVQJL7Ugs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791989669; c=relaxed/simple;
	bh=JNJ2mkf1aS97iDdeFypVQOfe5YFm/Vd8eRrpAdBGi4M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=e9hfY72Wos6tR9nCLdMCw621dK7LJW3xPoh11zq3zXK80MDmsVHbLvQCcZeZL6PuHrM0kMe3bDJXftPt5m7UV7GuneyBbc6DyCTk+WdiOZrT0TB6h0e1SJOsVKmJ+5vtpeu0ElUxPChtt0ZdmeuYI7LIobt6XyLjk54L6eWlhYI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=fQP310bW; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=A9ZqPqs3; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="fQP310bW";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="A9ZqPqs3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1791989661;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Ev9q41EABKY/fJg5x9H90/ZDMZ6m9JIZEHM4S386mkY=;
	b=fQP310bWFNDUM27pS21jJg2Ug0dvzAaxgoPuHDaWZrymMrQDPSEvKOwRRjzaVjMT5WL049
	+Qmxz1OiTYDif1/NvYG3j97xRQH4fHmyDtiPgYJ5RVVKN+kD6mimMgm+Woi9/ZyoxoIT3p
	jecuXhLjb6pldZlJn+V3ExRbVstPhpU=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-264-kqaxQbD2MxmDWcy2CS2qnw-1; Wed, 14 Oct 2026 14:54:14 +0000
X-MC-Unique: kqaxQbD2MxmDWcy2CS2qnw-1
X-Mimecast-MFC-AGG-ID: kqaxQbD2MxmDWcy2CS2qnw_1791989653
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-486f9d150c3so2631722f8f.3
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 07:54:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1791989653; x=1792594453; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Ev9q41EABKY/fJg5x9H90/ZDMZ6m9JIZEHM4S386mkY=;
        b=A9ZqPqs3aM2kdgm1HlQaPLnZqa0uQi106NNAcN4VLhE9ODUtYBg4/2JgKjhz5i527l
         fwB/BD4Uk5E4XX5g44SD14vBsBkIVj8v57eGxqJyxeOx3kppUoXNRdwOMcHXfIWyMytj
         6BMYzL8wO9KYWzSf84qS/Xm7AVTs1uBdSClyB+2AkdRuJIXRucrBjpBblEe+lDyoJkeI
         p1aMMIcYxDKSFgHYyNbVXeEk80w5NkjkdIZLFqoQbv8LktRQX8ZpSbJZjWXHwFqUXG50
         jquiHVkHERzPAnIemIurEq+zZf+viXxs5PI+6Xy2oeojRSATOX/l3ay8vf1cF77z++Lr
         FT5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791989653; x=1792594453;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ev9q41EABKY/fJg5x9H90/ZDMZ6m9JIZEHM4S386mkY=;
        b=GwNEimDELLUDoyb4rPqsQmPy+tgaDXMltYigutWJhPnCXZvdgLEBaDOKMeszTWsxV9
         bNTXXqkdyEDnoOgXJMxv1SN9K6WI4raX/RqT3u8voDI8xlEjgEtdvduCAQyIURpt5lzR
         gf2gK2Kx5EAVluUvNZ4oMBPQzuKoCTCOEL3HXD+X9oPAUFvYu5nJKoIQQRLOQXE4XOms
         7BGG/aZbaGKOCHTUmQ3BjTwq0qnVrQxqAiC/GA2qVTuuZep5bZJeRsavmocVYQ7DdNTs
         jKVazxYrWHD1FAN4JSBigV/f7Y2OrDyHa/SHDjXqOgeaOKfCxuMthnkATbxIWHe3vTTf
         NwRA==
X-Forwarded-Encrypted: i=1; AKwUvBwrVqFb8yZ0cSQ12KgG+zUp2Jwh9b98SsSTJ0O+bFqHCIF7vnkZj7qmHykwEYhg2N59tPW3123P+QOt+y4=@vger.kernel.org
X-Gm-Message-State: AFq9FYKEQ/XUMFaeMsuU3XNZrlEdXci/PEdsYwwQsKe5T5CDsvIkcBMj
	UM+V1VzkgE7pd5PTSaPAtAuBdUUGG4z2bMeYQWtSdeWR1sS2hu4pEu55zQqEdNX3JGbRxY0iXAI
	fflhRPvW8CqQ7ozZ17wWJktKZGcsGNj5JoA6R4NTdPt/Uwqxv/DOISUE9bN/dt+l8Bg==
X-Gm-Gg: AYBFou2fjwSVZ/svIG8FmH7pWIWKIxEDVMEYAhts93o2c7DBxz4K/Y2tW7ZeKiul2yx
	/bxu/6SZRqKMiDpUDCC4tXLbOzAqpSQ1uF90/Or8lbYaGGrEUm1UpNaZINv9PECB1c+ZX4RpAcN
	oyALc+OuO6K8P+RTYid8rSciuLzQBBcpVJXMjvsEZH8iFBs/FUCuuM9hsqSxbbFSw8u6NodcGjT
	i01D9j6T4IPrFUHsDstmoGtFa1wyELF8oi8oWGCm1Ie4cRuPcnbEdzvhXUZQObfEt4F2ZgH4CwU
	CvuekDo0v3N+yXyDiT73SMIdgCG/U9HkO1IT89CVp7yeb8iEJ6am/CZyhLhSMUNysFMd7UL2dZx
	mCWgpmg==
X-Received: by 2002:a05:6000:2c06:b0:48d:ed3c:4cdd with SMTP id ffacd0b85a97d-48ded3c5789mr3738202f8f.49.1791989652765;
        Wed, 14 Oct 2026 07:54:12 -0700 (PDT)
X-Received: by 2002:a05:6000:2c06:b0:48d:ed3c:4cdd with SMTP id ffacd0b85a97d-48ded3c5789mr3738153f8f.49.1791989652230;
        Wed, 14 Oct 2026 07:54:12 -0700 (PDT)
Received: from sgarzare-redhat ([193.207.157.253])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48de0aaa5dbsm13020646f8f.12.2026.10.14.07.54.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 07:54:11 -0700 (PDT)
Date: Wed, 14 Oct 2026 16:54:06 +0200
From: Stefano Garzarella <sgarzare@redhat.com>
To: David Carlier <devnexen@gmail.com>
Cc: netdev@vger.kernel.org, bobbyeshleman@gmail.com, davem@davemloft.net, 
	edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com, horms@kernel.org, 
	virtualization@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next 1/2] vsock: support SO_INQ on stream sockets
Message-ID: <as-T4oWG4W3wdQTg@sgarzare-redhat>
References: <20261012235524.41468-1-devnexen@gmail.com>
 <20261012235524.41468-2-devnexen@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20261012235524.41468-2-devnexen@gmail.com>

On Tue, Oct 13, 2026 at 12:55:23AM +0100, David Carlier wrote:
>SO_INQ makes recvmsg() return the bytes left in the receive queue in an
>SCM_INQ cmsg, saving a SIOCINQ call per receive. AF_UNIX stream sockets
>support it, AF_VSOCK fails with ENOPROTOOPT.
>
>Add it for SOCK_STREAM, reusing the hint already computed for io_uring.
>As with TCP_INQ, 1 is reported once the stream is finished so the caller
>reads again and sees EOF. No cmsg is sent when the transport cannot
>report the queue length.
>
>SOCK_SEQPACKET is refused, as on AF_UNIX: its transport callback counts
>messages, not bytes.
>
>Signed-off-by: David Carlier <devnexen@gmail.com>
>---
> include/net/af_vsock.h   |  1 +
> net/vmw_vsock/af_vsock.c | 41 +++++++++++++++++++++++++++++++---------
> 2 files changed, 33 insertions(+), 9 deletions(-)
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
>index 1c2d1cea67f4..874dc1545a35 100644
>--- a/net/vmw_vsock/af_vsock.c
>+++ b/net/vmw_vsock/af_vsock.c
>@@ -2050,29 +2050,38 @@ static int vsock_connectible_setsockopt(struct socket *sock,
> 	transport = vsk->transport;
>
> 	if (level == SOL_SOCKET) {
>-		int zerocopy;
>+		int v;

Please use a variable with a better name. 

>
>-		if (optname != SO_ZEROCOPY) {
>+		if (optname != SO_ZEROCOPY && optname != SO_INQ) {

Can we add something like unix_custom_sockopt()?

> 			release_sock(sk);
> 			return sock_setsockopt(sock, level, optname, optval, optlen);
> 		}
>
> 		/* Use 'int' type here, because variable to
>-		 * set this option usually has this type.
>+		 * set these options usually has this type.
> 		 */
>-		COPY_IN(zerocopy);
>+		COPY_IN(v);
>
>-		if (zerocopy < 0 || zerocopy > 1) {
>+		if (v < 0 || v > 1) {
> 			err = -EINVAL;
> 			goto exit;
> 		}
>
>+		if (optname == SO_INQ) {
>+			if (sk->sk_type != SOCK_STREAM) {
>+				err = -ENOPROTOOPT;
>+				goto exit;
>+			}
>+			vsk->recvmsg_inq = v;

Should child sockets inherit this from a listener socket?

>+			goto exit;
>+		}

Please add a switch to handle SO_INQ and SO_ZEROCOPY clearly.

>+
> 		if (transport && !vsock_msgzerocopy_allow(transport)) {
> 			err = -EOPNOTSUPP;
> 			goto exit;
> 		}
>
>-		sock_valbool_flag(sk, SOCK_ZEROCOPY, zerocopy);
>+		sock_valbool_flag(sk, SOCK_ZEROCOPY, v);
> 		goto exit;
> 	}

Maybe we can add a new function to handle SOL_SOCKET level, but I don't 
have a strong opinion on that.

>
>@@ -2581,6 +2590,7 @@ __vsock_connectible_recvmsg(struct socket *sock, struct msghdr *msg, size_t len,
> 	struct sock *sk;
> 	struct vsock_sock *vsk;
> 	const struct vsock_transport *transport;
>+	bool do_cmsg = false;
> 	int err;
>
> 	sk = sock->sk;
>@@ -2637,13 +2647,26 @@ __vsock_connectible_recvmsg(struct socket *sock, struct msghdr *msg, size_t len,
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
>+	if ((vsk->recvmsg_inq | msg->msg_get_inq) && err >= 0 &&

Is the bitwise or what we want here?

Thanks,
Stefano

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

