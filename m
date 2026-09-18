Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 544584DE72D
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 14:27:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789741679; cv=none; b=lD5XgYSxNekG10o+kaKAl7t48MDXqraGlGPA8dimhZHjd3gCKRyWQfXul4DISLnSd4XO2J2bqoqyQ3FqP6HXPnRrUPXx9xJYCs/0BZcvZIPo6aYBJkmEyLLchk2nubaxRPaLx421NLcs/QJ2/zRLcvmcqZvkg1+b9N1j47bF9+I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789741679; c=relaxed/simple;
	bh=qWPM8mEcQAiZiBe5wIuy4aqUTDeswnrEyUyg1zkQHi0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GozbgF/UreriEvT3A3N6sqQMGKJX2KPwlLDRNW/zps04yU/iV1mOrYpGDXNMNZCywtGMKrJPnPIaXcw2qwGwlFkaEQukXOYX00GPGoV9apICSp2ze/ti2GZ/wz/gZUbBZR3isNYxFd9xFdJ2CkLOiA1XctIcTX0NQT2azPIPS1c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=YkYrkVSK; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=VuApddnk; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="YkYrkVSK";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="VuApddnk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1789741676;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Tzy4rg64m2nfrHznucdcUVmAGxkvGHwxFBaPQdjr128=;
	b=YkYrkVSK+1em0CaBrSnAFiTUIwgfaX3bMTKCTXJ5nOl38OrSUaOSEAZQPg1DHtEzFTbno2
	RHcaR1Dg03346Knt8dNZFn5gT3yfwsNcXNzn1OIYcsLyEU6HwIVI26xpf/k3P0K7ek/JPL
	m8tCLbaP8J5nJlxDYWs4JxaLd9iddKM=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-682-FdF6Coe1OoCDc8RwYf24jQ-1; Fri, 18 Sep 2026 10:27:55 -0400
X-MC-Unique: FdF6Coe1OoCDc8RwYf24jQ-1
X-Mimecast-MFC-AGG-ID: FdF6Coe1OoCDc8RwYf24jQ_1789741674
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-472c330e555so383845f8f.1
        for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 07:27:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1789741674; x=1790346474; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Tzy4rg64m2nfrHznucdcUVmAGxkvGHwxFBaPQdjr128=;
        b=VuApddnk/9f1dbbIDkrhZdd49nsYl55RFr7buqScLO4uZUY7MCD5IguFyR4lEjT6zz
         v3iWSWt8GCxuz1KrV/3ut0kiw6DvvLOXGRu4pYwMliXydBroNCIYNgBW6Aprm+S2YQ6s
         f9Df0bFyE1wXxnj8sSt1uXCMFn0dkbzMNvxYULapRZZzL/I5yXwbGF4yne2GIl3hCK9U
         YPHRaflnHVtL/blt9lE8VjdLEeONNiu8wY3zD3elw9z7/46zo4SAwGAlhk5op/PAMXCD
         MJQJH320bmG7tCrqYgW2hIJruoswKCJQxXGxOj+FekBgHjHlXbPyAh9p+y+qCGOVnyFb
         ZnUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789741674; x=1790346474;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Tzy4rg64m2nfrHznucdcUVmAGxkvGHwxFBaPQdjr128=;
        b=clonzYAxK8TQVRvxWzcOHytoIKFrxluTMXTd2HpOklpgvWGwwm22vNNIt81DX4bx1p
         qu5kVO5pWEw+iFHvop3mCr6t6P3jdCtYEScECLAnb6RlJhuum3AaVV8GRUdbaRMm3ghq
         /102rBv6XQuMLQw/atMQYtiNhpsGl1oCGOwOFuBlhSwMg7+uDHQIJ84zwP5ywn6Q/ROc
         r1x8b7eMFH0hKV9gArm7ktI+4YscaQoSfEI8YR+wZ8ArXU8thFoD5GobS1Uy2mL8llww
         j/ApPvzGewkX4Mfp0OAgjNdNMpuBofoHkorvbumOkYOCXhJ9iqiD+clfwHzfQnWP7teZ
         GpJQ==
X-Forwarded-Encrypted: i=1; AKwUvBwTcMU7WdHk81UghybkhXQwc4JtVy97yluzX6HRQk9pvYCudKWU5nK/uOmPGyBPlth9glX/oWaGII5oKeE=@vger.kernel.org
X-Gm-Message-State: AFuF++lQic7g3dotPSJoG07wg3u2O8/EtvkPlg0dIZJYghQ7BzBTXUHC
	4fmoHYArSElDvJRAwUfBi28AynTiop3cqxGBfcnSjJ+Gnxln8lCH7NXzQKQIIXkUrUb9grXqXXi
	CV4r2CiGgl1g9/AcmPeRg3QNsBs45iD/njsO7mEl+1bcDF5NFdKyAWMHUTd4RgSZN7Q==
X-Gm-Gg: AYBFou0ogwEA1tED2XQHuKIfa9mZh1QzIoPnnqjX4SV37G0C4ZEDp7z+L/dOA4Xp7TI
	xZgS3UaNw/KCkFkRg1F9fT43x3eOWh0ELvJz39yuGaTkq5XcoLqkvRQNG7ESbdbcgHQIoYKlqum
	+K1ILvev1cvb3rrqf587Dv+KqBfJl5UGoa6aobdMdgcfBqwnK7+nIUxMUkraZGHdWYLeKHhq+zr
	p0hu5sLnQR8ZEodsBky1/U6aWTVLPpfYtn2SHIqKa1gg7+Dk+b3UE2vBSzPS1IiFJTo7ArYpDPg
	Ns4ooNKsVHdepJJPNshiObIiSjrJqs9KvndOcXulue9AxlsSpQ1NxpbtPntiRyucMaemikaysV+
	Kp0+MkR4NTXw4B5+0dQ9eSNDLMEg0AmYQqwCZF3n01097pg==
X-Received: by 2002:a05:600d:4449:10b0:49f:cc2a:f73a with SMTP id 5b1f17b1804b1-49fcc2af743mr10053865e9.25.1789741673686;
        Fri, 18 Sep 2026 07:27:53 -0700 (PDT)
X-Received: by 2002:a05:600d:4449:10b0:49f:cc2a:f73a with SMTP id 5b1f17b1804b1-49fcc2af743mr10053175e9.25.1789741672904;
        Fri, 18 Sep 2026 07:27:52 -0700 (PDT)
Received: from sgarzare-redhat (host-79-53-30-11.retail.telecomitalia.it. [79.53.30.11])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48720081426sm4196721f8f.33.2026.09.18.07.27.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 07:27:52 -0700 (PDT)
Date: Fri, 18 Sep 2026 16:27:46 +0200
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
Subject: Re: [PATCH net-next 2/6] vsock: add IOCTL_VM_SOCKETS_ASSIGN_G2H_NETNS
Message-ID: <aq1D1S9p9vRl7eV_@sgarzare-redhat>
References: <20260902-vsock-guest-ns-v1-0-9995383e9a8b@meta.com>
 <20260902-vsock-guest-ns-v1-2-9995383e9a8b@meta.com>
 <aqlTlFvQL34-WViB@sgarzare-redhat>
 <aqmTYoCMmzx1BM1v@devvm29614.prn0.facebook.com>
 <aqqPXr2LNJUM4yMW@sgarzare-redhat>
 <aqsI5BXRB96dkIHm@devvm29614.prn0.facebook.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <aqsI5BXRB96dkIHm@devvm29614.prn0.facebook.com>

On Wed, Sep 16, 2026 at 02:23:48PM -0700, Bobby Eshleman wrote:
>On Wed, Sep 16, 2026 at 02:57:43PM +0200, Stefano Garzarella wrote:
>> On Tue, Sep 15, 2026 at 11:50:10AM -0700, Bobby Eshleman wrote:
>> > On Tue, Sep 15, 2026 at 05:28:25PM +0200, Stefano Garzarella wrote:
>> > > On Wed, Sep 02, 2026 at 04:00:48PM -0700, Bobby Eshleman wrote:
>> > > > From: Bobby Eshleman <bobbyeshleman@meta.com>
>> > > >
>> > > > Namespaces let a host isolate a VM's vsock traffic to a specific
>> > > > namespace, but in a guest vsock traffic cannot be isolated to a
>> > > > namespace. The vsock device is hardcoded to global mode and can't be
>> > > > moved into a local-mode namespace.
>> > > >
>> > > > Introduce ioctl IOCTL_VM_SOCKETS_ASSIGN_G2H_NETNS on /dev/vsock that
>> > >
>> > > We already discussed about netlink, but I'm not sure how much work can
>> > > take, here just another alternative, what about adding
>> > > /proc/sys/net/vsock/g2h_owner sysctl that can be read/write where:
>> > > 0 - no owner
>> > > 1 - owner
>> > >
>> > > 0 -> 1 transition, move the device in the new nets
>> > > 1 -> 0 transition, reset back to init_ns
>> >
>> > That seems reasonable, but if multi-device support ever lands, this
>> > might be harder to adapt cleanly?
>>
>> I see, but maybe we can have a dev0/ dev1/ subfolders in that case.
>>
>> >
>> > >
>> > > > gives userspace a way to move the device to the calling pid's namespace.
>> > > > The call requires CAP_NET_ADMIN in the root user namespace. A privileged
>> > > > user wishing to "unassign" the device can move it to the init_netns,
>> > > > which is hardcoded to global mode (so no unassign call is necessary).
>> > > >
>> > > > A getter to read the current assignment back was considered, returning
>> > > > either the namespace's net_cookie or its nsfs inode number, but neither
>> > > > seemed useful enough to bake into the uAPI now. It can be added later if
>> > > > a user turns up that needs it.
>> > > >
>> > > > Add a transport hook to indicate support for guest namespacing, so that
>> > > > transports may opt in/out. A transport that opts out keeps the
>> > > > reachability rules it had before this ioctl existed.
>> > > >
>> > > > Sockets are reset when the underlying device moves to a different
>> > > > namespace, so as to prevent reachability from the previous and now
>> > > > disallowed namespace.
>> > > >
>> > > > Following the approach of netdevs, the device returns to init_net when
>> > > > its namespace is removed. Care is taken to not break flows when the
>> > > > device is inside a global namespace that is being torn down and alive
>> > > > sockets are in a different global namespace. In this scenario, the
>> > > > device's netns getter pre-emptively falls back to the init_net (always
>> > > > global) so that these flows are not disrupted. If init_netns ever
>> > > > supports local-mode in the future, this logic will have to be changed.
>> > > >
>> > > > Suggested-by: Stefano Garzarella <sgarzare@redhat.com>
>> > > > Link: https://lore.kernel.org/all/20200427142518.uwssa6dtasrp3bfc@steredhat/
>> > > > Signed-off-by: Bobby Eshleman <bobbyeshleman@meta.com>
>> > > > ---
>> > > > Documentation/admin-guide/sysctl/net.rst |  18 +++
>> > > > include/net/af_vsock.h                   |   7 ++
>> > > > include/uapi/linux/vm_sockets.h          |   6 +
>> > > > net/vmw_vsock/af_vsock.c                 | 198 ++++++++++++++++++++++++++++++-
>> > > > 4 files changed, 228 insertions(+), 1 deletion(-)
>> > > >
>>
>> [...]
>>
>> >
>> > One thing I realized when answering your uAPI questions and looking at
>> > the code is that IOCTL_VM_SOCKETS_GET_LOCAL_CID is not namespace aware,
>> > but I think it probably should be? I remember for host ns we strived for
>> > truly strong isolation.
>>
>> Can you elabore a bit more?
>>
>
>I'm wondering if IOCTL_VM_SOCKETS_GET_LOCAL_CID should not reveal the

Okay, I see now, too many IOCTL_VM_SOCKETS involved and I didn't get you 
were referring to the GET_LOCAL_CID xD

>CID of the g2h device if the device has been moved to an inaccessible
>namespace? In this case, fallback to the results of h2g/local and
>through to returning VMADDR_CID_ANY if neither of those transports are
>loaded.

Yeah, I agree. I'm not 100% sure if it's really an issue if we reveal it 
to any workspace, but I also don't see why we should do that. So, yeah, 
if possible we should reveal it only in the namespace assigned to the 
G2H.

>
>I also considered whether or not /dev/vsock should even be visible from
>within an inaccessible namespace in order to not leak even the mere
>presence of the vsock device, but it seems to me that /dev/vsock's
>presence doesn't leak anything besides the presence of the vsock module.
>

Will this break userspace doing IOCTL_VM_SOCKETS_GET_LOCAL_CID on 
loopback, etc. ?

Thanks,
Stefano

