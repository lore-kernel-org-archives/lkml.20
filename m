Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 797504EE85E
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 12:30:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789561830; cv=none; b=Uce3GGQoYbbJEyujGbREha4VbkwfrhXH+V+Q1gnDMcA5Lw+isNMCNX3cfvEqljRPbrfsaTF4cM3hLz+7F7XtMGzvan3e1XHZoH8XUfFuDP3SQKtqz4RNLjiRzm5IUPL9qndpZ0itL+y4BheFo1uh+S3RCqW2TSrMWTHsu3EecYE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789561830; c=relaxed/simple;
	bh=Fmhcgo0917MgP6Yewu3ZjCmJzTY2NacAiSJbTsPkO7k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FvHicsBFMXNQEb7FRB6pcB2v6dfFazGI6J/Qc2cpgkou/aymnk4ankDazTo1WbHlY5sSnupZ1F0o5PzcgVnChcXzzFzAqENTVkxmCcHMt9ESngAJjd0LUW5XxxQd+C/oWPbj8C3hxLEfgg7GV9uNFKv4nPoJeBI3X2SS9vhwHSs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=GbOhXTj+; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=gEL8QAVM; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="GbOhXTj+";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="gEL8QAVM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1789561826;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Rqm8tyx2h9IoJaqWWUmjhp0Aa68nUfNy8FsMl7kX/nI=;
	b=GbOhXTj+GjnkT6eTxu5kJTjFGcEKEjBl8L+zID14kE4d6h1+yN9C6+cHeldmkyz55AnAUJ
	8Ox1Hxs4KCtGHb2M9vmq2xAaER5Tb5JqKSCu3URF8HqH1yKvY3Es26PZFIf1N4I5ZYARtI
	Fw4T8dAl9SqSBr64X/tTTn8uVDxcSSQ=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-443-yEo3zRA8MVCzefY_McjjHQ-1; Wed, 16 Sep 2026 08:30:23 -0400
X-MC-Unique: yEo3zRA8MVCzefY_McjjHQ-1
X-Mimecast-MFC-AGG-ID: yEo3zRA8MVCzefY_McjjHQ_1789561823
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-486f1ecf9bbso1254805f8f.0
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 05:30:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1789561822; x=1790166622; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Rqm8tyx2h9IoJaqWWUmjhp0Aa68nUfNy8FsMl7kX/nI=;
        b=gEL8QAVM+uTzeFyDj8Fo0B1Bnboxr3hiqPOHoxCqsnGp8AOJ4cncQb8H7QNbsz4hMf
         TxKnkv7WqKBN00wwF7cyTkMo+Bhdp1Ejr9MXEZCQ95kJ/L1cMj2D27VBNdi2+KNS5Wt5
         HYsiw4PjlFkW/JTEtd1jIKirB+VOFjIijfZjKCrBI94A4eGZCttCladspb8tQyxFg+XZ
         7TK/KwOx9VvlfuSiCEyaslKeGzLzi8O3ohO6Vw9jyWRL3yeFQQfnVVu3iIjqCVga4DoV
         fpENBwQgt1GsiuRHPg1euRt7bZc3gmu3FpO9MT0YX42J5D+j1y5BK7y/Lb9C+wFhj0Ah
         abdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789561822; x=1790166622;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Rqm8tyx2h9IoJaqWWUmjhp0Aa68nUfNy8FsMl7kX/nI=;
        b=LRWvM3kf/L/poxmqB59eI8UPYAPH1jW5exuqMa0MN/qlSXZhLfAGzO3fplQNYmnqZn
         6L6yoOJyEE7P0W1ElQz0CTY6rlg1cnjeSIXPCT5AqaCH4VA1QtlMRbk0cCmQGxdJnEj2
         gqWOGM+zHaWXeNEPsRUN2fC70WjniMipNug9v7ST09BOX0EhMKWvnXF4Z32QDT7tVAUc
         Uy4S9WLymCFmL7vgUU/xZcpm4nxAhNHyLknV95Kghw555D4k5JMpT4lvyvo0JX5ZNTfg
         AZayUcsKTV+AjbW+EOMV8tS5yothsoRFGJU8XXgCk8VGY5WoYkF7ZXYs0Kx1qrXgh3c+
         eszg==
X-Forwarded-Encrypted: i=1; AKwUvBz/mS4XP7pY0VK9u8kLL5vNXAoYQAmPtQTteKLbT9o4jCqqVRSy/IFq37NOQcT5MxJFlWvk9JBY2IMVZKg=@vger.kernel.org
X-Gm-Message-State: AFuF++nWs2niHXJEQ8hG4bIZK/8XAi/gj8hKAvT/n38yrQMrUFcnAi3J
	C6U/GmZ8jgGXIqdQXb9FQ9tYmuG10YfawUFkisuxdu4L9CLsbywTlR8brpRXM/1NzBPNiBr3PAb
	4DT0nLqfWZPzBHsEbC2MdRSOv1JgEHI8crU/5FR0WgSGzUIOZb78TamUqWff8Vifkqg==
X-Gm-Gg: AYBFou0+jEzHCc+lOXu6UNrDrsmsj+GVSEJzlyNzDXs7kvvddWFjnwJNUre7BVdqFVp
	CwO7+zxOdWaPpDoHxF3LR4nJw+1MPwRmh6VJs0t+2qdHCUTJxWcrIXuiHFkkUAAs+bExjfn1DX/
	Caxzjo3O4zgDuFr5H9xw/+OM7Ehv0iPIKHiQeS438YCmq/YEaH4O/33PnhwqdIYOa/JY8mD2Onm
	tz/4HycAO11gxYPlFIoM8jHla1yoIC85icJxq+pf76TKuNQNTLNqFprrcwkxSAAHM6HzUE580t2
	HYW0P5Sg3FeCBQETdEN8RIEUpgp++t9o9ZOiiBw4a7wYyiJmOi/MIvSrRoGKlPwjCt/pFhq5a5O
	RN0QTC5UOfY2ZUi6GJhCzlgKnrcbZsDySVKoN8lZ/GtPbIQ==
X-Received: by 2002:a05:6000:2003:b0:487:41c:175e with SMTP id ffacd0b85a97d-4870d03fdabmr2882248f8f.22.1789561822276;
        Wed, 16 Sep 2026 05:30:22 -0700 (PDT)
X-Received: by 2002:a05:6000:2003:b0:487:41c:175e with SMTP id ffacd0b85a97d-4870d03fdabmr2882180f8f.22.1789561821702;
        Wed, 16 Sep 2026 05:30:21 -0700 (PDT)
Received: from sgarzare-redhat (host-79-53-30-11.retail.telecomitalia.it. [79.53.30.11])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4870bf413dcsm6941143f8f.31.2026.09.16.05.30.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 05:30:21 -0700 (PDT)
Date: Wed, 16 Sep 2026 14:30:14 +0200
From: Stefano Garzarella <sgarzare@redhat.com>
To: Michal Luczaj <mhal@rbox.co>
Cc: Stefan Hajnoczi <stefanha@redhat.com>, 
	"Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowangio@gmail.com>, 
	Eugenio =?utf-8?B?UMOpcmV6?= <eperezma@redhat.com>, "David S. Miller" <davem@davemloft.net>, 
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	Asias He <asias@redhat.com>, kvm@vger.kernel.org, virtualization@lists.linux.dev, 
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH net v2 2/5] vsock/virtio: Streamline socket reset on
 transport/PM event
Message-ID: <aqp3Po7OcubJboM_@sgarzare-redhat>
References: <20260915-vsock-connect-reset-closing-v2-0-a1d9abb472f7@rbox.co>
 <20260915-vsock-connect-reset-closing-v2-2-a1d9abb472f7@rbox.co>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20260915-vsock-connect-reset-closing-v2-2-a1d9abb472f7@rbox.co>

On Tue, Sep 15, 2026 at 03:15:13PM +0200, Michal Luczaj wrote:
>Follow vhost's vhost_vsock_reset_orphans() and VMCI's
>vmci_transport_handle_detach(): set SHUTDOWN_MASK, which will come handy
>later in the series.

IMO it would be better to include the reason here as well. Every commit 
should explain why doing a change.

>
>Note that commit c38f57da428b ("vhost/vsock: fix reset orphans race with
>close timeout") fixed a race between pending close timer, i.e.
>virtio_transport_close_timeout(), and a transport/PM reset. But here we
>never set SOCK_DONE, hence no race.
>
>Fixes: 0ea9e1d3a9e3 ("VSOCK: Introduce virtio_transport.ko")
>Signed-off-by: Michal Luczaj <mhal@rbox.co>
>---
> net/vmw_vsock/virtio_transport.c | 3 +++
> 1 file changed, 3 insertions(+)
>
>diff --git a/net/vmw_vsock/virtio_transport.c b/net/vmw_vsock/virtio_transport.c
>index 4f9aa9c4c3aa..4d6991321699 100644
>--- a/net/vmw_vsock/virtio_transport.c
>+++ b/net/vmw_vsock/virtio_transport.c
>@@ -413,11 +413,14 @@ static void virtio_vsock_event_fill(struct virtio_vsock *vsock)
>
> static void virtio_vsock_reset_sock(struct sock *sk)
> {
>+	struct vsock_sock *vsk = vsock_sk(sk);
>+
> 	/* vmci_transport.c doesn't take sk_lock here either.  At least we're
> 	 * under vsock_table_lock so the sock cannot disappear while we're
> 	 * executing.
> 	 */
>
>+	vsk->peer_shutdown = SHUTDOWN_MASK;

In all other places we use WRITE_ONCE/READ_ONCE on vsk->peer_shutdown, 
should we do the same here?

Thanks,
Stefano

> 	sk->sk_state = TCP_CLOSE;
> 	sk->sk_err = ECONNRESET;
> 	sk_error_report(sk);
>
>-- 2.55.0
>

