Received: from mail-oa1-f54.google.com (mail-oa1-f54.google.com [209.85.160.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1654646AF08
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 23:58:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788393505; cv=none; b=u/H0PQNTXE9dxzsjtcKCTFU8/f9RUZWPql6FdbkPx8LFvt5KbrqP/aYebPZp7FL/fwHoHGTd5i5aUw+P3Bz5HcKSou5nRz/6yK7QervTq9MFWhBDf0XsaApOLqyWaTVWmzuUp+Auaa6zeLB6DcOZobJPjMGaUmlBSKu+qbeK0es=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788393505; c=relaxed/simple;
	bh=y0BmfY76mN/0WPfH4Hr0Ikh4CCr4ip0xHhPT2cF1Sd0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XUVqYnWM7A5JZup4vVe+oyUshVTusqAdSTHWBns0sc0ixxW9+RCwv/wV1nI7HNgTubRG3alSreGiWktLHtWBKRfM7olTWeeloxdlWDWw8qiuHjaIDD+p6pKtVtp7QdxbNtsPfCFvUHlln63wnJIhPnbTtFy+HGrmpdUx4C2dzbw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UEdOUHVf; arc=none smtp.client-ip=209.85.160.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UEdOUHVf"
Received: by mail-oa1-f54.google.com with SMTP id 586e51a60fabf-459281bc13bso1224948fac.2
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 16:58:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788393499; x=1788998299; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=o6TxE/PuYRNxck14tJMx6uhlVO4Uxr/vKzSJJkM4qzE=;
        b=UEdOUHVfSio8B+/4dM4jV06dcybCNduoYcyLhiSa7adKNY4niM8QiLriUdwA83jyjZ
         CmwYdf8FH4RwJ2KeSlBbbF/BIJcKBZaow2l2Ly5TaZ4ly+GHSrLdlYTmCH3RP+WjdG/q
         P+NmQnMi6eTff/mH6Ufkx396ThYmRiziHf3skgb3TvqJHxHOi8rMRwF/dU8RF+kYeVnE
         Q0823yATERFU7Prvd5NdqsktbGuC6jSmEji3NSc0SsS+kDt/+MIPrXsD8+ZhfRzC4gkf
         uxYr1h1xizIUWxEm2gThxF5+1MFl7LrerD8/IM5xJLTW+XurNJCcetK3Jn0Tcutulgfv
         CXUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788393499; x=1788998299;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=o6TxE/PuYRNxck14tJMx6uhlVO4Uxr/vKzSJJkM4qzE=;
        b=q7cT5vxY0tPEe+2n74CSwY6wwc562z3bKxCdNBf59RIBzQNImCs4RwMjkuruJF5FQv
         JcDQurVjVlzBFrOZQXdD3rvpmrvmuR3vwo9Vxlsgk5zRzmFxY4uqC/cOiqTiT+0eFvav
         z2HxVWpCI+L7/0PjFOvCdcH0X6NkatDiLc7k8FpbqZQ9QMfAHBVm0B6lrkTpR/+ckfTB
         FV37t0lC5WW4D+P4jnmsjzRsko0XtiU7MUyHyfebmjqYLDacPYC0wYgauzVlBpwlkNzU
         NlUZ8uQkDM/DN3PkV8SKUR6MdK2xRiJPY3Gv10H8wOJCwvwu9kxBFljtGoTCilrp+uMB
         yfPg==
X-Forwarded-Encrypted: i=1; AKwUvBxOBvbHCfHGWB5NNyYNZCDTc3orgMKiWNiKBF1n0a+5TpuxBNxwFxDyjb6zRVPMuTR7v2h8beQnSsoCgMA=@vger.kernel.org
X-Gm-Message-State: AFuF++nuLpay3ciMNrPwZLpj/alpnyWQGhvt5juXfIyQN1Xzvt54t98j
	f6fSGj10WiiAl8zSagzCJDahECsrpkSD00VFtjST9RA/917/EHhphXRq
X-Gm-Gg: AYBFou1LrpyOjSMqOUVvCl2laQGyW1YpghhNaMUJLncan4Ox1FOtJv4up/a5ZGSC2Xb
	2r6LoNbGaYxwQ63ke6vOyHH7aFvP50iJeQ5ZuDELQO6FqmOAqDO5/O72Ivndt9F80BWAQBZYn4A
	Q1SPSPAFkEm29G5TgGeQPIv2/Z1IX6AmDzTtkeUDBdBjuLXa6TDPO7YgTuy+1PHZgiXYa1uBesm
	UCzHoWidT4fL1iP8LuT7/cp+A7g5+rNwuVx2xntZ6DdpcHHMeo3XwIf5v6knPICwdEjN8FHY/hU
	qYmkdG2zIOxZoYAvGhUa5VfDNxq3CEqXdVwFyMRHdBq5x5oVVdcKcWywToZSvdr0qjaJDrkmMCR
	6SlzL+c9I+4u5ct/+Q1vxnmZQhJoJfeLQ46oWxAAd/P/gDJt3Ksr97q5tVcOnQP+BkopTxPd92j
	TdQrBONj27VzMuhzq6S5SUEXz5otjGzzb/hBOOQMiIgeqKiMgZj3rbI2nu+hCaI2DlmzmzGzbV1
	5DhHRvhu8ea24/q/rOx
X-Received: by 2002:a05:6871:c8dc:b0:465:8554:94b7 with SMTP id 586e51a60fabf-46f87ca935fmr7744412fac.12.1788393499274;
        Wed, 02 Sep 2026 16:58:19 -0700 (PDT)
Received: from devvm29614.prn0.facebook.com ([2a03:2880:ff:58::])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-46f330822basm5626041fac.15.2026.09.02.16.58.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 16:58:18 -0700 (PDT)
Date: Wed, 2 Sep 2026 16:58:06 -0700
From: Bobby Eshleman <bobbyeshleman@gmail.com>
To: Randy Dunlap <rdunlap@infradead.org>
Cc: Stefano Garzarella <sgarzare@redhat.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Stefan Hajnoczi <stefanha@redhat.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Jason Wang <jasowangio@gmail.com>,
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
	Eugenio =?iso-8859-1?Q?P=E9rez?= <eperezma@redhat.com>,
	Shuah Khan <shuah@kernel.org>, virtualization@lists.linux.dev,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org, kvm@vger.kernel.org,
	linux-kselftest@vger.kernel.org, sargun@sargun.me, jlinbox@meta.com,
	Bobby Eshleman <bobbyeshleman@meta.com>
Subject: Re: [PATCH net-next 2/6] vsock: add IOCTL_VM_SOCKETS_ASSIGN_G2H_NETNS
Message-ID: <api4Du1bQzieFvA9@devvm29614.prn0.facebook.com>
References: <20260902-vsock-guest-ns-v1-0-9995383e9a8b@meta.com>
 <20260902-vsock-guest-ns-v1-2-9995383e9a8b@meta.com>
 <3a581439-6664-4339-8627-f1704db35bb0@infradead.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3a581439-6664-4339-8627-f1704db35bb0@infradead.org>

On Wed, Sep 02, 2026 at 04:35:59PM -0700, Randy Dunlap wrote:
> Hi,
> 
> On 9/2/26 4:00 PM, Bobby Eshleman wrote:
> > From: Bobby Eshleman <bobbyeshleman@meta.com>
> > 
> > Namespaces let a host isolate a VM's vsock traffic to a specific
> > namespace, but in a guest vsock traffic cannot be isolated to a
> > namespace. The vsock device is hardcoded to global mode and can't be
> > moved into a local-mode namespace.
> > 
> > Introduce ioctl IOCTL_VM_SOCKETS_ASSIGN_G2H_NETNS on /dev/vsock that
> > gives userspace a way to move the device to the calling pid's namespace.
> > The call requires CAP_NET_ADMIN in the root user namespace. A privileged
> > user wishing to "unassign" the device can move it to the init_netns,
> > which is hardcoded to global mode (so no unassign call is necessary).
> > 
> > A getter to read the current assignment back was considered, returning
> > either the namespace's net_cookie or its nsfs inode number, but neither
> > seemed useful enough to bake into the uAPI now. It can be added later if
> > a user turns up that needs it.
> > 
> > Add a transport hook to indicate support for guest namespacing, so that
> > transports may opt in/out. A transport that opts out keeps the
> > reachability rules it had before this ioctl existed.
> > 
> > Sockets are reset when the underlying device moves to a different
> > namespace, so as to prevent reachability from the previous and now
> > disallowed namespace.
> > 
> > Following the approach of netdevs, the device returns to init_net when
> 
> I'm confused by the use of "init_net" several times and "init_netns" at
> least 2 times. "init_net" is the initial, boot-time net namespace.
> 
> And is one of these what is referred to in the Documentation/ file below
> as "initial namespace"?

Good point, init_netns should be init_net everywhere here (and in the
Documentation/).

> 
> > its namespace is removed. Care is taken to not break flows when the
> > device is inside a global namespace that is being torn down and alive
> > sockets are in a different global namespace. In this scenario, the
> > device's netns getter pre-emptively falls back to the init_net (always
> > global) so that these flows are not disrupted. If init_netns ever
> 
>                                            maybe    init_netns()
> if you are referring to a function...

Same here, should be init_net.

> 
> > supports local-mode in the future, this logic will have to be changed.
> > 
> > Suggested-by: Stefano Garzarella <sgarzare@redhat.com>
> > Link: https://lore.kernel.org/all/20200427142518.uwssa6dtasrp3bfc@steredhat/
> > Signed-off-by: Bobby Eshleman <bobbyeshleman@meta.com>
> > ---
> >  Documentation/admin-guide/sysctl/net.rst |  18 +++
> >  include/net/af_vsock.h                   |   7 ++
> >  include/uapi/linux/vm_sockets.h          |   6 +
> >  net/vmw_vsock/af_vsock.c                 | 198 ++++++++++++++++++++++++++++++-
> >  4 files changed, 228 insertions(+), 1 deletion(-)
> > 
> > diff --git a/Documentation/admin-guide/sysctl/net.rst b/Documentation/admin-guide/sysctl/net.rst
> > index e586e17fc7a5..1e9c0d2be7b8 100644
> > --- a/Documentation/admin-guide/sysctl/net.rst
> > +++ b/Documentation/admin-guide/sysctl/net.rst
> > @@ -515,6 +515,24 @@ their hosts. The behavior of VSOCK sockets in a network namespace is determined
> >  by the namespace's mode (``global`` or ``local``), which controls how CIDs
> >  (Context IDs) are allocated and how sockets interact across namespaces.
> >  
> > +In a guest, the vsock device owned by the guest-to-host (G2H) transport belongs
> > +to one network namespace at a time. The ``IOCTL_VM_SOCKETS_ASSIGN_G2H_NETNS``
> > +ioctl on ``/dev/vsock`` moves it to the namespace of the calling process, which
> > +requires ``CAP_NET_ADMIN`` in the initial user namespace. The namespace's mode
> 
>                               Is this the caller's namespace?

Yes. I'll clarify that in the next revision.

> 
> > +decides who may then use the device:
> > +
> > +- ``global`` - every ``global`` mode namespace may use it.
> > +- ``local`` - only that namespace may use it, which reserves the connection to
> > +  the host for it alone.
> > +
> > +The device starts out in the initial namespace, so until the ioctl is issued
> > +nothing has moved and no mode has changed.
> > +
> > +Connections made before the move, from a namespace that can no longer reach the
> > +device, are reset. The device returns to the initial namespace when the
> > +namespace it was moved to is deleted, so assigning it to the initial namespace
> > +is how an assignment is undone.
> > +
> >  ns_mode
> >  -------
> >  
> thanks.
> -- 
> ~Randy
> 

Thanks for the review.

Best,
Bobby
