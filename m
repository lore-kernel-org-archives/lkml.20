Received: from mail-ot1-f51.google.com (mail-ot1-f51.google.com [209.85.210.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98FA751121D
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 17:30:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788543037; cv=none; b=cTgVMLMaC4+KFKsX6jIlmig3vnU0LtcI5DkEN+18Ag/2M36lHSEfXBDbCPWNrnu3e1W0IhJRZ5CSyxje8h6OqmKDJjwKUMGZXTvLvORP8TJ7Wwl0x//w/PWENpwEMdek9wz2cgNFXo5bh4+KkOLSVd584Yp79gcNP2SaXb0TZ1c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788543037; c=relaxed/simple;
	bh=uFS7CqJ/4WMuU0sv4h1FMLN2xytbZtd+0px5/4cj4zo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AZL7a2qPzxm7r1fZCWrx9ulyq0E/85s//4ttaUu9VtzvME3PN9IW0i+nwdcsLB9oK107mS8d+1EosfvDuvUys2eE5EbBa4uSnoLdfxlyfYVXjFDuBY067/ycufw6CKugLThskgrHbZL/oHckiQnt1A9+tUpMkUxYL9GikFuOI68=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dlp4D8Nr; arc=none smtp.client-ip=209.85.210.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dlp4D8Nr"
Received: by mail-ot1-f51.google.com with SMTP id 46e09a7af769-7eb5bdb50fcso1210164a34.1
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 10:30:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788543034; x=1789147834; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+yXuzXtZ9/rSTTLjcAorY8DG6JyAA49nbzxpJiEv6qQ=;
        b=dlp4D8NrLCfOaml28Rfdy2UhZF7UzLr8y67EdqEca+eOC6vhG/NIYXhT0BI/YIe1DG
         0FRo3ZqT1MFTMyUmHteUK8cGOhsjMtoxEt7Vzdo47oxkEEb79Esj4qg6VKYLXBme/Dey
         SLIQVcK3eBN1TlS6oS7xrEvOuTSAPu959xKfLhOhY/4vKju4y14xNKSxs3S+L7R8kXCk
         8iWjcJl64v+zxd9EWmMFP2Cka3FdyGDWnSHQiR6ATzNMWXXrgCDWT0pxCSWhakswsG+G
         obQvno+V7z20U1QE1/cnNmy4Pa8pZ3KCDCoxW5TyQuKb7woDkhFFN/NgfBWvpg3p9Nh5
         zRYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788543034; x=1789147834;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+yXuzXtZ9/rSTTLjcAorY8DG6JyAA49nbzxpJiEv6qQ=;
        b=BWNABEJ7NPzlGfrS/BRp1Ar4dT1Vs29LHmFKzAG8ajjUFGdoGNMjpYAmkMCfOtIFr9
         PWX4zj366abg5KhlY4Ypaar3kOXIN1wxgT1kIiQ6Whmlmrii4ea/NiErG09SGDDW4kRe
         LoxOIDHqqe4UOxnL+dKSZidt8P4eW/dDl5VqlAm1rhFdW/EvbBeKlRRjYO73gWgre28D
         F9YXuP4NYeauBAEuL+2evrXXjsR5B0Hxi8wa1ZD0UMEiPuAHY3rYJKNqQ3JSh8+2YaTH
         r6zZA3QPbAmCwavWT2X2CWvbVnC9tyEcoNeADNb146DGvzhfrtzzPdGgNvXNP1IL+MLV
         35yg==
X-Forwarded-Encrypted: i=1; AKwUvBy9KmB1a3Wg7vHKjtY51s0JEY/bONHTKxpVbVM6sz4EJC6JPYwZOT1OODtqLtdy5b0yhzOaHiMw2HPgWAM=@vger.kernel.org
X-Gm-Message-State: AFuF++kZUh8VOKoMDTy0wcveHctNa7lcqRdCUXeiu/OBHmBbb29cV0b+
	UJofkqZoghugNjLC8AThzVA1m88smwWtVVH8htIl4PZHKaCt0wvG69ca
X-Gm-Gg: AYBFou1r8LSnr1POvDZrDW5duR3kzQmr2yxqUzjDVkJWXUrdiEfyjmHf7P6eLUwDYRE
	sDqRH5XzgeXHUT4I+v4iXyDwE9K9qLPfOVksQBQoI8PPJTIWaz38bRVplxH/s6wQR61G84BX23A
	w8QkfuZx61BeQJzCIUWsXG3WbixcW5L8aPGaDo3/B7DqT5Fd786vNjEsa3KHN66r8m31GjCu493
	BxUUNC5EzssTNfjCwCODDUTIKs6GzECR8MOlT0TtJNPN7ByquGDolGPNCPfdCcZFL2DIBBfYabF
	e4zZs35gn33whNOJP8itS/UUyFL6co4K8dHa+eWbL2pTN5I02dxLiBvYS0SB/wgZV2hv+i6n9BS
	LwdgloAy59WvzYEaGhgdoE+dLEno37aJ5EbLrG5DBfJPzJPwJiw96YOj1KYw+u+7uLtIdgSlQ9P
	CVeEoriutBEE1pgu1jWCtch6f/yAloKW/QDp73beKuMjcvyyS8WbIO+B+JYoBL10ewyMHuEslsQ
	sV91ySS9prh08W7mzbF
X-Received: by 2002:a05:6830:6684:b0:7e4:163:49cc with SMTP id 46e09a7af769-7fa1e2c7eabmr7139441a34.7.1788543034170;
        Fri, 04 Sep 2026 10:30:34 -0700 (PDT)
Received: from devvm29614.prn0.facebook.com ([2a03:2880:ff:5b::])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7f9f6da9a3esm3454794a34.10.2026.09.04.10.30.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 10:30:33 -0700 (PDT)
Date: Fri, 4 Sep 2026 10:30:28 -0700
From: Bobby Eshleman <bobbyeshleman@gmail.com>
To: Stefano Garzarella <sgarzare@redhat.com>
Cc: "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Stefan Hajnoczi <stefanha@redhat.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Jason Wang <jasowangio@gmail.com>,
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
	Eugenio =?iso-8859-1?Q?P=E9rez?= <eperezma@redhat.com>,
	Shuah Khan <shuah@kernel.org>, Randy Dunlap <rdunlap@infradead.org>,
	virtualization@lists.linux.dev, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
	kvm@vger.kernel.org, linux-kselftest@vger.kernel.org,
	sargun@sargun.me, jlinbox@meta.com,
	Bobby Eshleman <bobbyeshleman@meta.com>
Subject: Re: [PATCH net-next 0/6] vsock: assign the guest vsock device to a
 network namespace
Message-ID: <apsANK7ySuRzzK0V@devvm29614.prn0.facebook.com>
References: <20260902-vsock-guest-ns-v1-0-9995383e9a8b@meta.com>
 <apqGcFDFm9_Wtw4q@sgarzare-redhat>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <apqGcFDFm9_Wtw4q@sgarzare-redhat>

On Fri, Sep 04, 2026 at 10:55:17AM +0200, Stefano Garzarella wrote:
> On Wed, Sep 02, 2026 at 04:00:46PM -0700, Bobby Eshleman wrote:
> > vsock network namespaces let a host put each VM in a namespace of its
> > own. A guest has no equivalent yet. It has a single G2H device that
> > cannot be assigned to a network namespace.
> 
> Thanks for this, I'll do a proper review next week, in the mean time some
> comments below:
> 
> > 
> > This series lets a guest move that device into a network namespace. A
> > new ioctl on /dev/vsock, IOCTL_VM_SOCKETS_ASSIGN_G2H_NETNS, assigns the
> > device to the namespace of the calling process. The namespace's existing
> 
> Why an ioctl?
> 
> I'm asking because I'd like to know if you've already considered any
> alternatives (sysfs, netlink, etc.)
> 
> How do you think the ioctl should be used? Should we provide an userspace
> tool, or extending some existing tools?
> 
> Thanks,
> Stefano

Really only because /dev/vsock exists and the prior series used it.

Considering netlink, it might be the better option because there is a
lot of prior art solving problems we might have in the future. For
example, I was thinking about when users suddenly lose access to vsock,
with just the current assign ioctl there is no way for apps or users to
figure out why this happened. We can have an ioctl() setter for user,
but in netdev world users can actually get a notification via netlink as
to which namespace the device went to and what its ifindex is there (see
__dev_change_net_namespace() for the RTM_DELLINK and RTM_NEWLINK
messages). There is probably more, but that's the case that comes to
mind.

> 
> > ns_mode then decides who may use it: a "global" namespace shares the
> > device with every other global namespace, and a "local" namespace keeps
> > the host connection to itself. The device starts out in the initial
> > namespace, so until the ioctl is issued nothing has moved and no mode
> > has changed. There is no explicit unassign as assigning the device back
> > to the initial namespace is equivalent.
> > 
> > The ioctl requires CAP_NET_ADMIN in the initial user namespace.
> > 
> > Connections that can no longer reach the device after a move are reset,
> > so that a namespace which has lost access cannot keep using a socket it
> > opened while it still had access. Following netdevs, the device returns
> > to the initial namespace when the namespace it was moved to is deleted.
> > 
> > Transports opt in through a new netns_assign_allow callback. Only
> > virtio-vsock implements it here.
> 
> Why? (Not asking to support all the others, asking to explain the reason or
> ask helps from others to extend it)
> 
> Thanks,
> Stefano

Sure, can add a note here about extending it. I just didn't want to
implement code without having an environment allowing me to test it.

Best,
Bobby
