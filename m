Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D51093CC7F8
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 12:30:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789561851; cv=none; b=HaWy3jI3oAPyiESrp5e+iepstuSBvSrJLJ8SYJ2lvRJ4mE7K3hagarTO8+giN/DUxrSdFQR+IpPCbkaHD285K1Gts0JTRsGzMherFbe5AZfnmRWyamQ/S41oD4HyV2lhxkmdnT/DeDxF7zbD7jjqzdQBu/1Acn3bV7VNYxnloaU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789561851; c=relaxed/simple;
	bh=FrcWMoDVbMbpzp4CIH1n1Jf3KfV7MxTjfsHaS9A0FCc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pEj1121Pibq2G6rVGYpUsRumzQuZ6yX5jFBCh5Kcswzi059SjRBvzh0ytf6NYDVIJYdh3aWM1+UjfOBf4BfSee4ch2NIvJKCJJyYID1I9w64kejvxqxHzAwdcATG7OdlekSFp3FOzxTD3UjBkIkyliio/uL4umJ1s7LnVgQntKs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=GH8sI7q8; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=XAWmEGsM; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="GH8sI7q8";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="XAWmEGsM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1789561846;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=y/lsJ0PSjJUTTQP4j3h3/faX0ng/XvkH6X4rWSQ3RUA=;
	b=GH8sI7q8u3uXlnWzND6MTU+GX3dpATMJ16Einyab2uHbiMpC1f/vlwGZAuuga5SylKCOXr
	Q0qReBxRQNggTcIk7SuonRHNMuaL+IQzNvQneX1L6VZOH0Eqg1ThtXmVmntxSk4F4FjSE/
	wxazINgjaWGHdo2v+mJ8XnPCgG2jrJk=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-217-zPm_ijrKOFqJ0l3jK9Dy1w-1; Wed, 16 Sep 2026 08:30:45 -0400
X-MC-Unique: zPm_ijrKOFqJ0l3jK9Dy1w-1
X-Mimecast-MFC-AGG-ID: zPm_ijrKOFqJ0l3jK9Dy1w_1789561844
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-49e73659ac5so40926015e9.2
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 05:30:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1789561844; x=1790166644; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=y/lsJ0PSjJUTTQP4j3h3/faX0ng/XvkH6X4rWSQ3RUA=;
        b=XAWmEGsMHw35Ajbokq2rmA08Ye2RzOdlWs1wrp2KWaobTHRosLAizxaEU1QtEgTll3
         IXKvXHL9eZ426KSEI3YaDhH2NXCxT9JlH+3tv2vQqVUv54hzGm2gtMo9w+ThT4ivQyLh
         LkXT99FovFTqb5uGpOM53UirHN1djK7HvN+mtqf/EhT6dtpd0PQ86TPfPcWMSEdWBS2n
         FbJ0Rw8gqME96qAH8E2NVzUhOd9Dsnn7J/QldkzED48MgI5tXEK4E7Kj+aKj8ICcniRP
         dtmCP2i8dyNdVZ5ugB2/3FAVU5KbwuvGQ2uMgTbvJMTf7w+9MLmVGoArq2eels6mBr/R
         z8OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789561844; x=1790166644;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=y/lsJ0PSjJUTTQP4j3h3/faX0ng/XvkH6X4rWSQ3RUA=;
        b=b5sqbeGF4EoMOjBS/jaab/5u7tSeWY1+QPnQZtK1sAKEdAXDEEka9FYrT4dDL0Xz4C
         JRzknGs6IxLjr7Npm6mU+RLqV/UvErz+1Y2s+FsAMszbICCoKyjamAhZ0KBF3jmjDiGY
         NJ9w2NGUyALbdjgmvONJrakj3sDKsUqSTw490IHmq/4FhTz0yOV4G+5ptM4KFDUNjA5r
         DEwczdtIKscowRKxlaJ1TyM+5bhOSTlgNcUBc9DiRk3aMZ2TTwsRnhVch3Odi8Tf1/mR
         EcBSjesTz4XvgaZ9rbBbYLujx1AGEuluHNrLXM/pfVqDSlsbqdcPbi60RC3joY/uP0NJ
         0GxQ==
X-Forwarded-Encrypted: i=1; AKwUvBwo1EAQ5rlGK5K8BAyOE2GH5nWiBYgqdEfyFkRrtYDp/H5i1u1EDvdGEZ2qg+q8uXPNMJHtOsFPJ4WYwgA=@vger.kernel.org
X-Gm-Message-State: AFuF++kEbdKsyuj1ourX2MTXh+S6yy2JqRJ3ReNoDdAn1/hrHruEtwv/
	o3iTnd0gyoj9hL48G/MCAmmYcJBDNoQ7RE4JRQRkSRjc+AQn0J3Cf03pltYQTuOYuiEuxrk+nhj
	3PGY6y0E6OIVTJHwl5jTl24Rksv84lsYkdrl8PKe5PQBmYbOvjyaMNQvtCHCk1lpCtg==
X-Gm-Gg: AYBFou1Vc5nyKxFibwHjuv2wYCNrQjUzAt+sN5f4Bzy5IMeppW3NDf7Y0ZhD1exq9e2
	E2c4Z4ORqw/ZtY0mOVuwkQiBAT7e2osSgL/x72pW2vDxPQl9vypFF/nrqrbDh9rB0E4lKiFNX4Y
	hHb6qKIe3QfO/d5+mNUhptV+7yWWmZkiBAbvp3CNPE3xFtx0aYm8tCPBszkgLnLypLg8jqjkBBN
	GJYnzbfAbkbAiwHQRs3KCokl5GqF46zRtJ/7GD9Q5QZk+sX29H1wjfm43GVjG+6kq1kHtuhOv3k
	zRd6c2SiK8Bi46NEIVH6o5IMdywxYwJtOnXIdFDMvgCZg/WqvlI9FZk0fM0G+TNVUlkltAbpRhS
	ulYwXFHgl2KASBysqDEcenEqyNIjwx/4rghC5MCSGL9lSXg==
X-Received: by 2002:a05:600c:19c6:b0:49e:645e:2616 with SMTP id 5b1f17b1804b1-49eac463955mr25967095e9.5.1789561843687;
        Wed, 16 Sep 2026 05:30:43 -0700 (PDT)
X-Received: by 2002:a05:600c:19c6:b0:49e:645e:2616 with SMTP id 5b1f17b1804b1-49eac463955mr25966565e9.5.1789561843075;
        Wed, 16 Sep 2026 05:30:43 -0700 (PDT)
Received: from sgarzare-redhat (host-79-53-30-11.retail.telecomitalia.it. [79.53.30.11])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e83addf36sm76621175e9.5.2026.09.16.05.30.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 05:30:42 -0700 (PDT)
Date: Wed, 16 Sep 2026 14:30:39 +0200
From: Stefano Garzarella <sgarzare@redhat.com>
To: Michal Luczaj <mhal@rbox.co>
Cc: Stefan Hajnoczi <stefanha@redhat.com>, 
	"Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowangio@gmail.com>, 
	Eugenio =?utf-8?B?UMOpcmV6?= <eperezma@redhat.com>, "David S. Miller" <davem@davemloft.net>, 
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	Asias He <asias@redhat.com>, kvm@vger.kernel.org, virtualization@lists.linux.dev, 
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH net v2 3/5] vsock: Enforce no-transport invariant for
 TCP_LISTEN sockets
Message-ID: <aqp7CV9DnfsG1GJc@sgarzare-redhat>
References: <20260915-vsock-connect-reset-closing-v2-0-a1d9abb472f7@rbox.co>
 <20260915-vsock-connect-reset-closing-v2-3-a1d9abb472f7@rbox.co>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20260915-vsock-connect-reset-closing-v2-3-a1d9abb472f7@rbox.co>

On Tue, Sep 15, 2026 at 03:15:14PM +0200, Michal Luczaj wrote:
>A non-blocking connect() running in parallel with a blocking connect(),
>combined with a racy listen() that hits right after a connect timeout:
>TCP_SYN_SENT -> TCP_CLOSE -> TCP_LISTEN, while the connect() loop is still
>in progress.
>
>Enforce the invariant. Prevent a socket from becoming a listener after
>acquiring a transport.

We should improve this comment; it's not entirely clear to me, TBH.

>
>Fixes: c0cfa2d8a788 ("vsock: add multi-transports support")
>Signed-off-by: Michal Luczaj <mhal@rbox.co>
>---
> net/vmw_vsock/af_vsock.c | 6 +++---
> 1 file changed, 3 insertions(+), 3 deletions(-)
>
>diff --git a/net/vmw_vsock/af_vsock.c b/net/vmw_vsock/af_vsock.c
>index f840498b58af..499e902becfa 100644
>--- a/net/vmw_vsock/af_vsock.c
>+++ b/net/vmw_vsock/af_vsock.c
>@@ -1973,13 +1973,13 @@ static int vsock_listen(struct socket *sock, int backlog)
> 		goto out;
> 	}
>
>-	if (sock->state != SS_UNCONNECTED) {
>+	vsk = vsock_sk(sk);
>+
>+	if (sock->state != SS_UNCONNECTED || vsk->transport) {

Are we changing the behavior when an error occurs?

If we call `connect()` on a socket (with no others running in parallel), 
it fails, and then when we call `listen()`, it now fails, whereas before 
it didn't. Can this happen? Is that what we want?

If so, we should mention it at least in the commit description; if not, 
perhaps we should unassign the transport in the `connect` call.

Thanks,
Stefano

> 		err = -EINVAL;
> 		goto out;
> 	}
>
>-	vsk = vsock_sk(sk);
>-
> 	if (!vsock_addr_bound(&vsk->local_addr)) {
> 		err = -EINVAL;
> 		goto out;
>
>-- 
>2.55.0
>

