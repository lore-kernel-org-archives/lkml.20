Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED69431B10B
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 13:56:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790085397; cv=none; b=cZh+ASAj6eig0HQGto01NFwu7Bp31i7OYdIRkDYNaUBITiuM0rQLOnauBlsdfaVbS5Cvka/04BjC2IDac8yMyLT7NDQ3MqUItdj9gAI6MUxsOwv3BZOyDOyig1oHfCzQuj3hS0RZ2C+Xr/F8IUuFsAhxnxFHc/Nmtg0zbAgh+mk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790085397; c=relaxed/simple;
	bh=xpzff7gTANmin7ayImKqNSwtv/jMmdVMSrHmqXKpE6g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kp8HhV9+6gbyCkHqeR6XCMC4V5nE0GqAA52EUXhd5Rp9BOnYELtSZk7FTkfdksidcpOx5PJyIj/5+WQLfWBkKTQxuzesbz5eZuiAh6ioIKcZrW+TpZVo6sCCR1psnVHGHiAdkNVdM8Wn725rSk1fhELvneUwuhz6U5zSdvQxxsg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=P7vSUrwo; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=pesz3oLA; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="P7vSUrwo";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="pesz3oLA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1790085394;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=CSAJceS2lTxo7RYYkwSiAWcerJGzn5wbrFBMDwrG220=;
	b=P7vSUrwo4CXnq27JHh8T8DHgqpeAEMW9gsUJ55nGRjINrMKTuyrqenbbqZbgFVJm7Ny4jr
	OezWmUxIqKTTw787/z2kEWkWO7dcGHD/HOfjicx2QVza8MM/iIFy/7SOYVFepeoD6rdD9D
	B7ohlkf17xKW2Fvp19uUpLHzGSLOUVA=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-398-c12IEFIzNNmT2-9druNN-Q-1; Tue, 22 Sep 2026 09:56:29 -0400
X-MC-Unique: c12IEFIzNNmT2-9druNN-Q-1
X-Mimecast-MFC-AGG-ID: c12IEFIzNNmT2-9druNN-Q_1790085388
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-49ccfbe060aso31561055e9.0
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 06:56:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1790085388; x=1790690188; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=CSAJceS2lTxo7RYYkwSiAWcerJGzn5wbrFBMDwrG220=;
        b=pesz3oLA7oNsGimyIwn6ibbE477R4MFL0Ikop4LsCzdWs3+IaWKZYbhLl8atuJ4AT3
         JSmrKOorR2wJa5par0Xwb6s4nwZxPodWNh8BtUFDeDGEdEdpZz3kSK/DhM0lIOO9Vce+
         O8VeDwCQUMZTx3GNTvTeO1IFengKpfVuEAxYh5Dy25Eu0a1sh+//Sd238R48Vchs5orX
         ZCHQIcV94Mzts17BNy845bnMKLCYrEy307t5BXODaJjG8/hNkyEFWteSgx+lzEDCh5Qf
         iPCUU0yGXbzEOCOTcbQJzU62JU31NpwnpdTjuQC+j6iDYMDb+VO25FQz/pSOzIZGO+/+
         JA+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790085388; x=1790690188;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CSAJceS2lTxo7RYYkwSiAWcerJGzn5wbrFBMDwrG220=;
        b=tbrvUCqzpSW0HrwS5DMAtmCrrGZsKaKfEulxxP1+Xl6GBB8Nl9cdc/D2hA2E7BGd1/
         QrjSRVlkr1s3oU7SYr19Yu/kfcn2x6vmYjqRmJcJYEGBpqUhto8HdaDFi4aPk7xbIwYE
         nKAhj8f/yeR48RwDH3Lyy1VB5Y9yLEVe3mcrQRTnfMzpihyIIXtcZkXXgePflkIgW9ki
         qPcEZC03zBaz0wMkQh0essUJ3yjU1nh6ffXenFuTstAjYl4te/HjPnwNjV15Sc6EHAAX
         PsecywEMz0k10JKDZqVQg71lWO3e5uKMLVr/aa3JkgqZaTjj9E06NiUyJnuFEhLP0WDK
         DkAg==
X-Forwarded-Encrypted: i=1; AKwUvBwW5tyB9384K2haDebe20ZrANqeFTYrcbt9KH8MjIWf6sRrbpsCV1k8TWw8ctNSy6PPHpdx3kMFE2milhw=@vger.kernel.org
X-Gm-Message-State: AFuF++m5ky+ShQtyEzhPZ8vI1P0wq7wEO/WVp+8UAoTkCzIjus8PUwiH
	x9BGpQVCUZkB2eeWpKy6GZAcBYm++CWiRbRnQdpgb21vuPK8LXGUxJmVTEJHCwv4tX0UyGkwkk6
	x4aeIijX9Xh5T/nT83K31+tA0NyU/9jpGwzMCYF4P/4hTzGy0KpKER1LGo43yj1OtUQ==
X-Gm-Gg: AYBFou3vHpRnhVgZBB2RF09BUyQkjgO1+Okjh9NaF+sbTPBEt4yYewWIduj2WJ+8Vf0
	D9pou4te3cmGHFsDjU3lyu+HRIbou4tEuyBCkBRVTf3fFB3vCkc3XE7HA51938qXzlotM0F3Zz4
	gbD1niKAcTIBQre7o1wwroEjcgKuK96YzMF+8uW1su7RcnX3055DPGVyxPTFq1G0Iku4xCECsE2
	blpPXj9u32YsOIwYtWMScj+OMCyGXk+O9VfahZcEW3joTgYYxg3lqXRxPIH94z48sTxt0QfhEMS
	ExL7D/0swUR0t5QpdVOdS1bpWjPRu1jupUWJuw5o15S/52/+nGIYXk26Ws4WmBwIeUqidOdDmbF
	zZPZEahz3YeM5lXxy2zmBzTwjXRm50jArJcxmVHs9hVLTr0VlUJ8=
X-Received: by 2002:a05:600c:6298:b0:499:bf0e:95c8 with SMTP id 5b1f17b1804b1-49fc5687adamr193025345e9.1.1790085388313;
        Tue, 22 Sep 2026 06:56:28 -0700 (PDT)
X-Received: by 2002:a05:600c:6298:b0:499:bf0e:95c8 with SMTP id 5b1f17b1804b1-49fc5687adamr193024815e9.1.1790085387814;
        Tue, 22 Sep 2026 06:56:27 -0700 (PDT)
Received: from sgarzare-redhat (host-82-53-134-131.retail.telecomitalia.it. [82.53.134.131])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fdace7941sm63084875e9.2.2026.09.22.06.56.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 06:56:27 -0700 (PDT)
Date: Tue, 22 Sep 2026 15:56:19 +0200
From: Stefano Garzarella <sgarzare@redhat.com>
To: David Carlier <devnexen@gmail.com>
Cc: netdev@vger.kernel.org, davem@davemloft.net, edumazet@google.com, 
	kuba@kernel.org, pabeni@redhat.com, horms@kernel.org, 
	virtualization@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next 1/2] vsock: report pending receive data to
 io_uring
Message-ID: <arKF7P9gqq7ehX-k@sgarzare-redhat>
References: <20260920194710.1114748-1-devnexen@gmail.com>
 <20260920194710.1114748-2-devnexen@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20260920194710.1114748-2-devnexen@gmail.com>

On Sun, Sep 20, 2026 at 08:47:09PM +0100, David Carlier wrote:
>AF_VSOCK stream receives never fill msghdr.msg_inq, so io_uring cannot set
>IORING_CQE_F_SOCK_NONEMPTY and retries a multishot receive even after the
>queue has been drained.
>
>Fill the hint at the common receive exit using the transport callback that
>SIOCINQ already uses, and report 1 once the connection is finished so the
>caller performs the receive which observes EOF, as TCP does after a FIN.
>
>A vsock loopback ping-pong with io_uring multishot receive drops entries
>into __vsock_connectible_recvmsg from 1.97 to 1.00 per delivered message,
>and receiver CPU time by about 3% (25 runs of 50000 messages, p=0.006).
>
>Signed-off-by: David Carlier <devnexen@gmail.com>
>---
> net/vmw_vsock/af_vsock.c | 39 +++++++++++++++++++++++++++++++++++++++
> 1 file changed, 39 insertions(+)
>
>diff --git a/net/vmw_vsock/af_vsock.c b/net/vmw_vsock/af_vsock.c
>index f840498b58af..63309708c916 100644
>--- a/net/vmw_vsock/af_vsock.c
>+++ b/net/vmw_vsock/af_vsock.c
>@@ -2543,6 +2543,38 @@ static int __vsock_seqpacket_recvmsg(struct sock *sk, struct msghdr *msg,
> 	return err;
> }
>
>+/* Bytes a following receive can consume, 1 if it would only see EOF, or a
>+ * negative value to leave the caller's hint alone.
>+ *
>+ * Called under the socket lock after a nonnegative stream receive, so a NULL
>+ * transport implies SOCK_DONE.
>+ */
>+static int vsock_inq_hint(struct sock *sk)

can we add "stream" in the name so it's clear that is stream only?

(e.g. vsock_stream_inq_hint)

>+{
>+	struct vsock_sock *vsk = vsock_sk(sk);
>+	s64 data;
>+
>+	if ((sk->sk_shutdown & RCV_SHUTDOWN) ||
>+	    (sock_flag(sk, SOCK_DONE) && sk->sk_state != TCP_ESTABLISHED))
>+		return 1;
>+
>+	if (!vsk->transport)
>+		return 1;

Can we squash this in the previous block?

>+
>+	data = vsock_stream_has_data(vsk);
>+	if (data < 0)
>+		return -1;
>+	if (data > 0)
>+		return (int)min_t(s64, data, INT_MAX);

nit: IMO we can remove the int cast.

>+
>+	/* Empty but finished: keep the caller reading so it sees EOF. */
>+	if (sock_flag(sk, SOCK_DONE) ||
>+	    (READ_ONCE(vsk->peer_shutdown) & SEND_SHUTDOWN))
>+		return 1;
>+
>+	return 0;
>+}
>+
> int
> __vsock_connectible_recvmsg(struct socket *sock, struct msghdr *msg, size_t len,
> 			    int flags)
>@@ -2606,6 +2638,13 @@ __vsock_connectible_recvmsg(struct socket *sock, struct msghdr *msg, size_t len,
> 		err = __vsock_seqpacket_recvmsg(sk, msg, len, flags);
>
> out:
>+	if (msg->msg_get_inq && err >= 0 && sk->sk_type == SOCK_STREAM) {

Why only STREAM?
A comment here and in the commit would be nice.



>+		int inq = vsock_inq_hint(sk);
>+
>+		if (inq >= 0)

Why assigning only >= 0 values?

Thanks,
Stefano


>+			msg->msg_inq = inq;
>+	}
>+
> 	release_sock(sk);
> 	return err;
> }
>-- 
>2.55.0
>

