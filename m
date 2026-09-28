Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65B924E36CF
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 15:00:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790607629; cv=none; b=oTlMeFboLrl7qwdMuDvKLX0dieRE/Mf593OQjat+Ofp1NvMLJnt5fyxNLmG2dPsV14hEGd1QPwnjgiplZPWufrwLRCfpQs5Nh96N8Frx6nwD50k4GbO8KcQ14YW/9Q33QahAa5IpGhaJnGqGynb3PNOttSaJz8z7AbXnxRut5nU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790607629; c=relaxed/simple;
	bh=FarrX1AXajp0rcAMMevqe1ADxQNLZJK0VOe0E5fUEKU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GZsFrVbExMBcF4RZzFdCUZp0zo7QkRLSYcZ2tykdGq0oyDLf5/6E1f5czJo0hHAiAFp9JmPsFQs6f4BRCzP+rWA4j+uwuxj+x3bD0jPIdzjPjHG5sc6N3fTjzGO05/iKZuufaBUAvQ3SIyws1EsIpw/wvPOt94bfKS2IF+PFIGg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ThqJkgJg; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=kVUhd8t6; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ThqJkgJg";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="kVUhd8t6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1790607626;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=eLs8yZfJYGp54djsbn71UyAfwiNLWW6mOvXDf6yGk6E=;
	b=ThqJkgJgSY+RQS7XyVRXqEsqQW5RDy5O0dZgNFj29grhRAP3RY059NKK/xUkXJJ7wjz6jd
	vonHaPV5wFPAVhYDIR52zR7RfqxZrAT21NnawyhJ6KOZc3Akuhy6QmSFg9DO34Kgky1mkX
	V7DY3gWyOqIAVgU6VjWQBlu85yUiprw=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-375-_69SQ4KpMdSggDVtSZiOzw-1; Mon, 28 Sep 2026 11:00:22 -0400
X-MC-Unique: _69SQ4KpMdSggDVtSZiOzw-1
X-Mimecast-MFC-AGG-ID: _69SQ4KpMdSggDVtSZiOzw_1790607621
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-48589603501so2123854f8f.3
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 08:00:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1790607621; x=1791212421; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=eLs8yZfJYGp54djsbn71UyAfwiNLWW6mOvXDf6yGk6E=;
        b=kVUhd8t63D+j3O51VASIOK0p2f7DLjaWKg1FZ/wrkFTfosbtaAz9e3KZrWFAdVnpnk
         fdsEl8YlwVYUHNmLal+tuOzBsMV5JPIFPXRIvunCbhIFsE+ZTqJdbyNhRIbzvx83amZb
         3yMzFjV/TyZZXOBJokYzd6F7wAky/tQQW9NXcWnIfLukZtX6u0d7MpXHOJo60qOw4zUh
         O425Mw0y8qV3OoLE5485BVMrjtNdU/YYXavj5UjK0dkKo+xhaGPYpF+wdi+XsNhMpkLI
         aeJSg9TzT0SZTI/b/iW3tGFjtjSuN3+M6FX3dZrPHuDKgnPc7eFRwvYWjyjTBq6z+Gyb
         oWjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790607621; x=1791212421;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eLs8yZfJYGp54djsbn71UyAfwiNLWW6mOvXDf6yGk6E=;
        b=FORrQXSj8CPhMfYjab+F7kh8ZRWim88v2juTES7SJHdQTQR2ruDfkZ2mUCqy76ryr2
         lO0JrV485tWyzs59lP5kCi3xVp3Os2toSHF0EEllQV21bF4hPuNWcOcZ8zvEy24baZGc
         W9CNmwqmIlM4A6bBHUP0/wEQg0ShMpSrogy3p57A0b1Vxgy/gyYKqF80SwVoq2RLK6Ay
         52DoV7gZxaAgg010i7WzuPs0EvUHVohDT9qsUvHrZSZVUHsKQR/51Yr+U11Eh4eanvwW
         HKQylV9X9SojXA2m+8Djn/2XWzH2SoJtM74TK6efo2GjMVhCoFifUXYJF7BEEMy3n84r
         XEdg==
X-Forwarded-Encrypted: i=1; AKwUvByBQnlGbAQbViwCjx/NFVJYUf/WYmW+QSJCaldIhFND92zCreVZ6+A4P/DcYujsYLh3tpRibIeMjoTaA00=@vger.kernel.org
X-Gm-Message-State: AFq9FYLjGasNRYbNzYUeSLjWIX/bjrRgtAR1bPBKFzO6PwtPz9pZ6Ejp
	zBgNkxiGQJMKKi2WzhuiB8tHtYO727YiCxJJVE9WNaUQXDCwbstavAP8iVDiKcfjRuC7KDytQc6
	PNVtVPtGWbkdZMXEM+0v80N6I//2nsTv5mhY5AKcCTNTJZkxbBKZiVx7LOfbJ2tfi1g==
X-Gm-Gg: AYBFou24w0sOvw26+uiPrtf59b4II5rT233Vu4M4y8RGkSuAUScaZqS68NfFLGQXxXG
	FoAKI9HvkDiNLjPZyr4rqdObm7vr9DngquHkUZy1UcxVUPVyTWX8b9sJ7bcyrtSH5tGtvN3NzVd
	CqjHKQFbzw4q0yuX3QSRfN7/Cq5OvSLnRmzOBTUGeN5gp7FTIq+X5MAbXF/stwkUO/cn3hulXgJ
	hK1H7Xc5rnj+p1+yflbJFVOwB/NRmmnoXe5QCFghXSvyHVYNSoQZOxSGPVo2lTfj2NBABT//GpK
	BMiWGBbqPV+A5T+qKauSpHuxO3qFznurwH81yOxgkMtB+FPpNuaRACjyTg8gYi87cQXMVWdQrKe
	lEbc=
X-Received: by 2002:a05:6000:4b0a:b0:488:823d:507b with SMTP id ffacd0b85a97d-488823d5296mr15209784f8f.52.1790607621232;
        Mon, 28 Sep 2026 08:00:21 -0700 (PDT)
X-Received: by 2002:a05:6000:4b0a:b0:488:823d:507b with SMTP id ffacd0b85a97d-488823d5296mr15209714f8f.52.1790607620571;
        Mon, 28 Sep 2026 08:00:20 -0700 (PDT)
Received: from sgarzare-redhat ([5.179.146.191])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4887a349731sm28558683f8f.12.2026.09.28.08.00.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 08:00:19 -0700 (PDT)
Date: Mon, 28 Sep 2026 17:00:12 +0200
From: Stefano Garzarella <sgarzare@redhat.com>
To: David Carlier <devnexen@gmail.com>
Cc: netdev@vger.kernel.org, bobbyeshleman@gmail.com, davem@davemloft.net, 
	edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, horms@kernel.org, 
	virtualization@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next v2 1/2] vsock: report pending receive data to
 io_uring
Message-ID: <arqAF53k2arP4enr@sgarzare-redhat>
References: <20260923184008.153541-1-devnexen@gmail.com>
 <20260923184008.153541-2-devnexen@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260923184008.153541-2-devnexen@gmail.com>

On Wed, Sep 23, 2026 at 07:40:07PM +0100, David Carlier wrote:
> AF_VSOCK stream receives never fill msghdr.msg_inq, so io_uring cannot set
> IORING_CQE_F_SOCK_NONEMPTY and retries a multishot receive even after the
> queue has been drained.
> 
> Fill the hint at the common receive exit using the transport callback that
> SIOCINQ already uses, and report 1 once the connection is finished so the
> caller performs the receive which observes EOF, as TCP does after a FIN.
> 
> A vsock loopback ping-pong with io_uring multishot receive drops entries
> into __vsock_connectible_recvmsg from 1.97 to 1.00 per delivered message,
> and receiver CPU time by about 3% (25 runs of 50000 messages, p=0.006).
> 
> Signed-off-by: David Carlier <devnexen@gmail.com>
> ---
>  net/vmw_vsock/af_vsock.c | 35 +++++++++++++++++++++++++++++++++++
>  1 file changed, 35 insertions(+)
> 
> diff --git a/net/vmw_vsock/af_vsock.c b/net/vmw_vsock/af_vsock.c
> index f840498b58af..20d6f9ca6a96 100644
> --- a/net/vmw_vsock/af_vsock.c
> +++ b/net/vmw_vsock/af_vsock.c
> @@ -2543,6 +2543,35 @@ static int __vsock_seqpacket_recvmsg(struct sock *sk, struct msghdr *msg,
>  	return err;
>  }
>  
> +/* Bytes a following receive can consume, 1 if it would only see EOF, or -1
> + * if the transport cannot tell.
> + *
> + * Called under the socket lock after a nonnegative stream receive, so a NULL
> + * transport implies SOCK_DONE.
> + */
> +static int vsock_stream_inq_hint(struct sock *sk)
> +{
> +	struct vsock_sock *vsk = vsock_sk(sk);
> +	s64 data;
> +
> +	if ((sk->sk_shutdown & RCV_SHUTDOWN) || !vsk->transport ||
> +	    (sock_flag(sk, SOCK_DONE) && sk->sk_state != TCP_ESTABLISHED))
> +		return 1;
> +
> +	data = vsock_stream_has_data(vsk);
> +	if (data < 0)
> +		return -1;
> +	if (data > 0)
> +		return min_t(s64, data, INT_MAX);
> +
> +	/* Empty but finished: keep the caller reading so it sees EOF. */
> +	if (sock_flag(sk, SOCK_DONE) ||
> +	    (READ_ONCE(vsk->peer_shutdown) & SEND_SHUTDOWN))
> +		return 1;
> +
> +	return 0;
> +}
> +
>  int
>  __vsock_connectible_recvmsg(struct socket *sock, struct msghdr *msg, size_t len,
>  			    int flags)
> @@ -2606,6 +2635,12 @@ __vsock_connectible_recvmsg(struct socket *sock, struct msghdr *msg, size_t len,
>  		err = __vsock_seqpacket_recvmsg(sk, msg, len, flags);
>  
>  out:
> +	/* Seqpacket has_data counts messages, while io_uring treats msg_inq as

Do you mean vsock_stream_has_data() on SOCK_SEQPACKET doesn't return 
bytes?

IMO names are confusing, but it should return number of bytes, we should 
fix it, but of course not in this patch.

LGTM:

Reviewed-by: Stefano Garzarella <sgarzare@redhat.com>


> +	 * a byte length when sizing retries, so only streams report a hint.
> +	 */
> +	if (msg->msg_get_inq && err >= 0 && sk->sk_type == SOCK_STREAM)
> +		msg->msg_inq = vsock_stream_inq_hint(sk);
> +
>  	release_sock(sk);
>  	return err;
>  }
> -- 
> 2.55.0
> 

