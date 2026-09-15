Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A01747A0A6
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 10:16:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789467418; cv=none; b=VixsbPfUM5N8/T1pIdGFT295Bp0oiOcOOw4c+zLVCmyUKtgRk2bjC3EHICIgkzIGTsJL+qNV8MpAjhuKUci1iQR0Nt1/ViK1/RcaUpM6kS2VeQ4Z57qBKWncuZ6Rx8XIu+P1CwLCAHDxDFibCP3mx2+s+F1iU1+Kqgbk9aASs2s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789467418; c=relaxed/simple;
	bh=N4fsCDWKXj8cFUOuROoEasUX7c1f/yp1SRGQJLzc1Nw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Pc4KvDbZ7SSkVeMG4eDUsxvQBRJpw4IK0reWrG5hbTFn9A52zZE3gMImPxtd4ncb2D9c8E8p/a4SnlJvKkUQrRRStjFfzZCfnhyqX+hjlO1KJ0GreaE3edH4xNGXd1554axOYEWeHd1Qt0hZd1KzLrGB+87Wd+iTz0Uoiwjtsi4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=cpIm+PFw; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=fDzT2FM3; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="cpIm+PFw";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="fDzT2FM3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1789467415;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Nl7n8UtlhHNNnQK/R4cfZiAkVCgsHC/OU98HtE4D5Wg=;
	b=cpIm+PFwCQwe6DdkUPdE5TAd7DghtihlWWYPw5djzD3pxCq9R+KMTq4eEL3QP8ZKYOZyKC
	VsjGHfinbp5odzwlyNeAXcAc+UmWH+gMdVnK0V55jmKcoJrazeNR62d44mg0pz0Mn1IAFn
	76TPZmgDMupwBWXzlLkPeL8C1gSgORU=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-685-AkZIYkNwMhCLTlbq5sfGRw-1; Tue, 15 Sep 2026 06:16:54 -0400
X-MC-Unique: AkZIYkNwMhCLTlbq5sfGRw-1
X-Mimecast-MFC-AGG-ID: AkZIYkNwMhCLTlbq5sfGRw_1789467413
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-49d0ae342b9so30498105e9.1
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 03:16:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1789467413; x=1790072213; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Nl7n8UtlhHNNnQK/R4cfZiAkVCgsHC/OU98HtE4D5Wg=;
        b=fDzT2FM30uTs0LU8vhtVg5yeVQN664cEEkCTbixot3m+6/dO7U5lxsnFfbKLcWePW0
         eealzO3XEQDavNBjpD9orzsFIlLnEa7MAcD3J9KC6W4poj9EAGnQ3jY0UbrxE8gJPo/d
         bVGQ6M5S7pklM4DGoamszHM82CMo/WO7uK/Wm/4d53iphplLWH7HopoYUWhlM6B9ysWh
         H8MDPflENfIyhtTJoyHGzBeVKdEplSxwrXzfSDC10fcGT1V45/zRMt7kW94b416jJGIA
         KrDITQIAhy4oqXDY27d5wxWQRQv3g6mfRPL4ONLlFirJBcJfOPd3cLVhJ9nyq7XQhQcz
         RIGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789467413; x=1790072213;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Nl7n8UtlhHNNnQK/R4cfZiAkVCgsHC/OU98HtE4D5Wg=;
        b=MUhLCLQETItpOiPa1br9mvcYBcdinPul91qslRDuIApKKfdK0igXWJSi/9l7GEa58X
         7t+1rvBiHSg3vt7khlB/FXLJI4uGuZT37lfi7XVrCczXph6WyYNwSO+VvObY+DhtiP6R
         fv2iJFxGQ3BXHLlMdM96NM+4d08oJKDgWnczsQb5+pMBctlONoy+w441bUVaCgum9mxJ
         Xdr+mSW9MhxkK8FqkKoKtZH/0z6SzrBwPJFauECbOY+rY7Iav7o4dPL2wKKGGz6Y8hTu
         X3D417/ySqh/v3th7Pp1beyAEYretsFEkhn5YledKZtfnLE1WoY0ab/lXkE8gxygbE+V
         e0Rw==
X-Forwarded-Encrypted: i=1; AKwUvBwVo4xVbTIKU0VKi208o93Vph28EzFDR1fgh2wktfcn98C/R9ZKYUpIuay4SCISCWcLdz+FUvXfZFT6hdk=@vger.kernel.org
X-Gm-Message-State: AFuF++nDS7EUg6cF+fxkv7fXGir3PVk7qh/t+i3I76vzK2DRhNbIyqkc
	CuhErahg4fsJ/xGmkJak9IH65UsXLdeZY4Q6v1PRGEDeXT+O09mvIe7LQIvSu2YcPjFYb/opIQc
	amFn1UBjLAMTL+d0BBRZ+2G+IYhPC30HoUNN2ecQ9tE9ptYfAAygdy+Om7y9Bj7du4Q==
X-Gm-Gg: AYBFou3I7QxWotIV+e5fxhHXxBuUlmO2Jh0cy5xC7bCb2e9289NgQrH0D/Hfve+q8jD
	JGxHkclr0a98asmFGfmVpbH+M4sgyYGiqQv7fGM0scJ9LLKAp4/mDe7+Rh227bXxki8vJy92qvQ
	Eg1A23+GTBjVag4PT9s0JoXGgB9PZWivsYQoUDu+jEjmMOVFzgsqFw4XH+TIG2A2K58JkD8Slyx
	qDHoyFd2WGWCO6CObayTgHg22DK1GIFcukSb3XBYodi8oMMjnQq4auMKRWN0dCtmQrFo3lHbJfE
	Ftjjxcrykka6+MexyCUkMwLpjdO/ZTfmMQKeIGgO4DxWKAQbb0dRRYA0n3aD/5FiVwQ0VKsqkrF
	tg+37WWG2jJFPfWX7YgTV0+CR7Dhs3tHzuD7csOeK4KhWPw==
X-Received: by 2002:a05:600c:3145:b0:49e:74c6:d973 with SMTP id 5b1f17b1804b1-49e822c5633mr7079215e9.31.1789467412932;
        Tue, 15 Sep 2026 03:16:52 -0700 (PDT)
X-Received: by 2002:a05:600c:3145:b0:49e:74c6:d973 with SMTP id 5b1f17b1804b1-49e822c5633mr7078495e9.31.1789467412452;
        Tue, 15 Sep 2026 03:16:52 -0700 (PDT)
Received: from sgarzare-redhat (host-79-53-30-11.retail.telecomitalia.it. [79.53.30.11])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e7d69f3c0sm57509095e9.6.2026.09.15.03.16.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 03:16:51 -0700 (PDT)
Date: Tue, 15 Sep 2026 12:16:47 +0200
From: Stefano Garzarella <sgarzare@redhat.com>
To: Bobby Eshleman <bobbyeshleman@gmail.com>
Cc: "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, 
	Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Stefan Hajnoczi <stefanha@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>, 
	Jason Wang <jasowangio@gmail.com>, Xuan Zhuo <xuanzhuo@linux.alibaba.com>, 
	Eugenio =?utf-8?B?UMOpcmV6?= <eperezma@redhat.com>, Shuah Khan <shuah@kernel.org>, 
	Randy Dunlap <rdunlap@infradead.org>, virtualization@lists.linux.dev, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, kvm@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, sargun@sargun.me, jlinbox@meta.com, 
	Bobby Eshleman <bobbyeshleman@meta.com>
Subject: Re: [PATCH net-next 0/6] vsock: assign the guest vsock device to a
 network namespace
Message-ID: <aqkaTXHDf5nfPL9w@sgarzare-redhat>
References: <20260902-vsock-guest-ns-v1-0-9995383e9a8b@meta.com>
 <apqGcFDFm9_Wtw4q@sgarzare-redhat>
 <apsANK7ySuRzzK0V@devvm29614.prn0.facebook.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <apsANK7ySuRzzK0V@devvm29614.prn0.facebook.com>

On Fri, Sep 04, 2026 at 10:30:28AM -0700, Bobby Eshleman wrote:
>On Fri, Sep 04, 2026 at 10:55:17AM +0200, Stefano Garzarella wrote:
>> On Wed, Sep 02, 2026 at 04:00:46PM -0700, Bobby Eshleman wrote:
>> > vsock network namespaces let a host put each VM in a namespace of its
>> > own. A guest has no equivalent yet. It has a single G2H device that
>> > cannot be assigned to a network namespace.
>>
>> Thanks for this, I'll do a proper review next week, in the mean time some
>> comments below:
>>
>> >
>> > This series lets a guest move that device into a network namespace. A
>> > new ioctl on /dev/vsock, IOCTL_VM_SOCKETS_ASSIGN_G2H_NETNS, assigns the
>> > device to the namespace of the calling process. The namespace's existing
>>
>> Why an ioctl?
>>
>> I'm asking because I'd like to know if you've already considered any
>> alternatives (sysfs, netlink, etc.)
>>
>> How do you think the ioctl should be used? Should we provide an userspace
>> tool, or extending some existing tools?
>>
>> Thanks,
>> Stefano
>
>Really only because /dev/vsock exists and the prior series used it.

Yeah, I vaguely remember that we may have discussed switching to netlink 
in that thread, but I can't find it.

>
>Considering netlink, it might be the better option because there is a
>lot of prior art solving problems we might have in the future. For
>example, I was thinking about when users suddenly lose access to vsock,
>with just the current assign ioctl there is no way for apps or users to
>figure out why this happened. We can have an ioctl() setter for user,
>but in netdev world users can actually get a notification via netlink as
>to which namespace the device went to and what its ifindex is there (see
>__dev_change_net_namespace() for the RTM_DELLINK and RTM_NEWLINK
>messages). There is probably more, but that's the case that comes to
>mind.

netlink seems like the right way to go, do you think it'll be a real 
pain to implement?

>
>>
>> > ns_mode then decides who may use it: a "global" namespace shares the
>> > device with every other global namespace, and a "local" namespace keeps
>> > the host connection to itself. The device starts out in the initial
>> > namespace, so until the ioctl is issued nothing has moved and no mode
>> > has changed. There is no explicit unassign as assigning the device back
>> > to the initial namespace is equivalent.
>> >
>> > The ioctl requires CAP_NET_ADMIN in the initial user namespace.
>> >
>> > Connections that can no longer reach the device after a move are reset,
>> > so that a namespace which has lost access cannot keep using a socket it
>> > opened while it still had access. Following netdevs, the device returns
>> > to the initial namespace when the namespace it was moved to is deleted.
>> >
>> > Transports opt in through a new netns_assign_allow callback. Only
>> > virtio-vsock implements it here.
>>
>> Why? (Not asking to support all the others, asking to explain the reason or
>> ask helps from others to extend it)
>>
>> Thanks,
>> Stefano
>
>Sure, can add a note here about extending it. I just didn't want to
>implement code without having an environment allowing me to test it.

It's fine, I'm not asking you to do it ;-)

Sorry again for the delay, I hope to review this series today/tomorrow.

Thanks,
Stefano

