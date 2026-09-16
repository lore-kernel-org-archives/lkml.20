Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B43E0372EE2
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 12:31:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789561906; cv=none; b=uaVaNm0cj/w8/zKxMggHyOTTwfsPTQUxB09xPK2UU0G8PbfqZKkBIFQTpVWh6xK1eAl1XO5TWtvh5BdqmMK1p0TXmCqsx40QCKU32kcSAX7TRJn71h5E3wUnRaCihxrrQs6RBZmvPZbZErlf91GmufGk3VQKHvwg8lGwEO05r78=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789561906; c=relaxed/simple;
	bh=nhAs5NaETTRV4ggb9S2xjW6cdn9Yst6vjKb89fLknJo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=efHQvf8W8tftFXWQNI5LhjP/07Z8UDzHZmPOt/hlbMuc3ey2XbaukZ1byT3FLKRLVwhGibKCCguwfAE2YG7ymoOnZeLoFon/Zyv7wHQQ9Y8Cw/6nwX+QEEdamq3XV9DSu4sU1/SbooBCIXFYX1OLGqiW6MhiYwPqIBX9Xmzr4Do=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=O+ydnonu; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=cnYI9gLZ; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="O+ydnonu";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="cnYI9gLZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1789561903;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=MuADGtRtcHr4ScjMyRSxePIFnAMKQr7pseg7z3igueM=;
	b=O+ydnonucX8HNLxnzVdGJ9nCFLv7a1rpvd7nNRTXU/0fuLKjlPDg0l4jeTL5Th3asDyn5R
	aig1ZuOpgPbjMciIB0qUOHvQEhNjItMD1fejRLxSO6Ahb5FhoGUyP9es02nWBUbMhcTJoB
	ViA715ktmeBlxoRk3Uy7yjl+sSLyG8I=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-474-lAvT0Pk0O5C3tII897nNHw-1; Wed, 16 Sep 2026 08:31:42 -0400
X-MC-Unique: lAvT0Pk0O5C3tII897nNHw-1
X-Mimecast-MFC-AGG-ID: lAvT0Pk0O5C3tII897nNHw_1789561901
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-49e6683d48fso49138185e9.0
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 05:31:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1789561901; x=1790166701; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=MuADGtRtcHr4ScjMyRSxePIFnAMKQr7pseg7z3igueM=;
        b=cnYI9gLZThw+Z7Uvr87CrJfiMYd4X2kOcf30FN76B8cmtFrG2+MWBW6UUMHxZcKclX
         YCoYO4hxItkj5KSNNHxby6YkDkL0+T503ori8XMgUzi3qRxAqkTYP38cTBo6qiILrOr3
         byc8LalsknCKAvjZgzv8ShwGPMNzPB7ChY8q1DSaf0p5lXjGwdscthg0F/oZSFSh9YM2
         JS4HCYLjLH8Xt0k4b58GIDZ0ytLwKN19pxjBN71iYmb+iUlIycmo89PT+VwcCUgspFej
         dRoyYjDo7QZfTq0uJYzK5IZZCRsMYYGAjSxqFc9ZsXVhuEINmaZhv9qu3Q0psa1Zkg6i
         5xkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789561901; x=1790166701;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=MuADGtRtcHr4ScjMyRSxePIFnAMKQr7pseg7z3igueM=;
        b=CmnFTcinL3tZMNZkvHBuWQkhEuY3eRA4oFmg36qb2QTPh6qtTFbpVyB811pixxc+6Q
         VT3zANXotrzaRGcJbgD/mz/TF+JKXAyNdlaFfuYYOZtqtrxlRHV5nm8UdXU7+fnHEGML
         IoxMZaYcALyfJOKS3VbMAr3Ta6xx7Nqk4FlsNIYGO57F57WZMRI3nXQxHqwh8FaG7zG/
         JbL5FFXr0gVgvrs2Aqqa9A6JKoVyliskPW1gutyrZ38ZKi8CeIh4pBSkKSZxZPOlVLyK
         RMsgsbezf+ZVI34XfB+F4TB90gHOq55k28+3E2kxv1334tSf/iqOde0TTwG0gFMipVMY
         irvg==
X-Forwarded-Encrypted: i=1; AKwUvBypEf3X/qzk3FdhMcnGsyA8C0DRamE4T4UkJNufaeDFjmtrxXE8EhVyNO1/eZF4qepTMYjXUUcfA7zbMV0=@vger.kernel.org
X-Gm-Message-State: AFuF++mX6ZVrUNlhVYqrGO0U0Le8mj7kwBZlL/FqteYtL0DSjLjSnDkE
	IjoLipWQ6RM6pWTp2IX6hPDy1A0YbtxL8Vt/6EQxSLyzq+MzIEAK4/yeL/W4M2n6c8eygIQdNxJ
	KJ2PZljbL+5ZB6N76fAzm705U2Fpy9srk2Hzsv1AU+7jJV3adEa+/nloPaOsgnOgybQ==
X-Gm-Gg: AYBFou0wBB83KuJB0px44eTOaP92CGFPRrPokKeZxSCLsIWpDr4Vmyq3BKrC7YgSa+D
	bLylqLpSPDgT+yTzINkBSPN29O74lrzCyre1G542rkb5z8VpxzXqIBzGD9nzMvhPvlCW8qHexhL
	PJsIIYCO3PzRbx6zdVAZBkLveEZs8k52bm73ES5ivUx3f1yazlz5gRgfO1PAypHL+uOd7Lc6Fdc
	Z/74hj1+rjYfLCSamE6bRGOo1k/5/NGmjCp5frHZmi70no0016kkHvM6PVu5QAqGDtu3HxH1TZ0
	ekfTXE6/cAtV91MVlGHpe59F3+iKcWGeiUDyhZINKCD0xVyQI7ZPlokuC2vBKN0iL/1v0GiZctp
	eanoW7DpOHWFgcoM0apyty/hFKk7qgGoRb90/tVEpPb6g1g==
X-Received: by 2002:a05:600d:640e:10b0:49b:9202:6f80 with SMTP id 5b1f17b1804b1-49eb7314c13mr20983795e9.6.1789561900512;
        Wed, 16 Sep 2026 05:31:40 -0700 (PDT)
X-Received: by 2002:a05:600d:640e:10b0:49b:9202:6f80 with SMTP id 5b1f17b1804b1-49eb7314c13mr20983095e9.6.1789561899813;
        Wed, 16 Sep 2026 05:31:39 -0700 (PDT)
Received: from sgarzare-redhat (host-79-53-30-11.retail.telecomitalia.it. [79.53.30.11])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e847fcbdfsm43541255e9.4.2026.09.16.05.31.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 05:31:39 -0700 (PDT)
Date: Wed, 16 Sep 2026 14:31:29 +0200
From: Stefano Garzarella <sgarzare@redhat.com>
To: Michal Luczaj <mhal@rbox.co>
Cc: Stefan Hajnoczi <stefanha@redhat.com>, 
	"Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowangio@gmail.com>, 
	Eugenio =?utf-8?B?UMOpcmV6?= <eperezma@redhat.com>, "David S. Miller" <davem@davemloft.net>, 
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	Asias He <asias@redhat.com>, kvm@vger.kernel.org, virtualization@lists.linux.dev, 
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH net v2 5/5] vsock: Handle sudden TCP_CLOSE during connect
Message-ID: <aqqIuUadZ_E1skmR@sgarzare-redhat>
References: <20260915-vsock-connect-reset-closing-v2-0-a1d9abb472f7@rbox.co>
 <20260915-vsock-connect-reset-closing-v2-5-a1d9abb472f7@rbox.co>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260915-vsock-connect-reset-closing-v2-5-a1d9abb472f7@rbox.co>

On Tue, Sep 15, 2026 at 03:15:16PM +0200, Michal Luczaj wrote:
>Virtio/PM events are serviced by virtio_vsock_reset_sock(), which resets

What "PM" means here?

>each connected socket. The reset is done under vsock_table_lock but without
>taking lock_sock(), so from the point of view of vsock_connect() -
>locklessly. The same pattern exists in VMCI's
>vmci_transport_handle_detach() and vhost's vhost_vsock_reset_orphans().
>
>The complexity of connect() comes from the fact that:
>1. the virtio transport can be reassigned, so the old transport must be
>   safely released;
>2. a failed connect can be followed by a retry, so the socket must be
>   reverted to a sensible state.
>Both cases apply only as long as the socket has not yet established a
>connection.
>
>While connect() waits for TCP_SYN_SENT -> TCP_ESTABLISHED, other
>transitions can also occur:
>
>  TCP_SYN_SENT -> TCP_CLOSE on connection failure, timeout or signal
>  TCP_SYN_SENT -> TCP_ESTABLISHED -> TCP_CLOSING on VIRTIO_VSOCK_OP_RST
>  TCP_SYN_SENT -> TCP_ESTABLISHED -> [TCP_CLOSING ->] TCP_CLOSE on event
>
>This further complicates connect(). Rather than making every event handler
>drop the socket from connected_table or adapting connect() to handle more
>transitions (while missing proper locking), use vsk->peer_shutdown as a
>poison flag. Whatever state an event leaves the socket in, the flag bricks
>it and prevents suspicious transport reassignments or TCP_SYN_SENT
>retransmissions.
>
>Fixes: d021c344051a ("VSOCK: Introduce VM Sockets")
>Signed-off-by: Michal Luczaj <mhal@rbox.co>
>---
> net/vmw_vsock/af_vsock.c | 6 ++++++
> 1 file changed, 6 insertions(+)
>
>diff --git a/net/vmw_vsock/af_vsock.c b/net/vmw_vsock/af_vsock.c
>index adf3f018347e..972952d04a81 100644
>--- a/net/vmw_vsock/af_vsock.c
>+++ b/net/vmw_vsock/af_vsock.c
>@@ -1743,6 +1743,12 @@ static int vsock_connect(struct socket *sock, struct sockaddr_unsized *addr,
> 			goto out;
> 		}
>
>+		/* Virtio/PM events are serviced locklessly. */

IMO we should be generic here (i.e. don't mention virtio or mention it 
like one of the transport, but IIUC also VMCI does something similar) 
and also we should explain better why we are doing this, like you did in 
the commit description.

Maybe we should document this behaviour also on top of this file.

>+		if (READ_ONCE(vsk->peer_shutdown)) {
>+			err = -ECONNRESET;

Is ECONNRESET a valid connect() error to return?

>+			goto out;
>+		}
>+

 From LLM reviewing, can you check if it's valid? :
   - M (net/vmw_vsock/af_vsock.c:1747): VMCI regression.  vmci_transport_handle_detach() sets
     peer_shutdown = SHUTDOWN_MASK unconditionally and then special-cases TCP_SYN_SENT with the
     comment "we treat the detach event like a reset" — i.e. a connect() retry is the expected
     recovery. It is reachable for a non-connected socket via vmci_transport_peer_detach_cb() (which
     uses trans->sk, not the connected table). Since vsock_assign_transport() only clears
     peer_shutdown when the transport actually changes (af_vsock.c:671-689), the retry now hits the
     new check and returns -ECONNRESET forever: the fd is permanently bricked where it previously
     reconnected.

Thanks,
Stefano

> 		/* Set the remote address that we are connecting to. */
> 		memcpy(&vsk->remote_addr, remote_addr,
> 		       sizeof(vsk->remote_addr));
>
>-- 
>2.55.0
>

