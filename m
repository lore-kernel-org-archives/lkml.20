Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57E8C4F4745
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 12:36:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789562181; cv=none; b=aFLGJgtnTHpLMjt7ES8+nX+5VGTBJEuOoqx6Rz3WyjknQ9pTxOo9iBQmy5OKWQQjbnYWV2zl6stJK0BAePq8fwIB5tNYOJkOU8ABpRMnIoEO6NDb9PMin5YSJKwWSnh3wXv0O3HH5vR/PjlVE/XmYJzg/4YpFMtKvL8EzgweKLg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789562181; c=relaxed/simple;
	bh=j43LFPCZ7rUBOiUq13DB94/P46Wvh+c5n7GJVgSSa8E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ajMYOl0ED/urtB+Mu18JiB/3rkpyX/tvhMPnNYKPviMK0w+GpebFxw2tjozAlu5pOmRCQ/f2WyrlYLddvqsY2YK5JxLuI/2x8EFrdJ4lvZyh36nK9YqKd+hKcR+ziZXZN4/rhqp9cDvyVQ6btJdKVSfBue1fEUyA+w+iYSgp0+g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=EvAfabXl; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=YYc1visy; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="EvAfabXl";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="YYc1visy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1789562178;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=j43LFPCZ7rUBOiUq13DB94/P46Wvh+c5n7GJVgSSa8E=;
	b=EvAfabXl/qEudjdbqezYT4ZZbT77u0m8hnuQmMLdpNQHaETG7Gf72TtaCJm2oJltK3rW76
	wTmq3vka6ru0GrV5Rj0e+aDxLzYi9cqcyqMRcicg115lk0RklPa6koSK+Yuf614XKOYdh3
	2mzl096OoQ6rKQ5RkAlT9dS6KnSlfUE=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-214-5CD5ATVjMtqM_D5ZoO5WUw-1; Wed, 16 Sep 2026 08:36:17 -0400
X-MC-Unique: 5CD5ATVjMtqM_D5ZoO5WUw-1
X-Mimecast-MFC-AGG-ID: 5CD5ATVjMtqM_D5ZoO5WUw_1789562176
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-49cf9df1eadso54739265e9.3
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 05:36:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1789562176; x=1790166976; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=j43LFPCZ7rUBOiUq13DB94/P46Wvh+c5n7GJVgSSa8E=;
        b=YYc1visyh8PXArrTA+XwsfeLFH14WxoYaEXVDUj0c2YxbPSvh54vhL/397jKtiFHPr
         o+jBWB3gL4FjzeOtZnOuDpVdm+WzAj/UjIqoL5UoO96iw8SScXq5C09I82zZ1M5T2tGf
         gNinBCZ4OJ4l7jNOi00H2tyexKqY1H0uFwihQHZ79KbGBeLimSWTAHDrt3+GkTxzqb7m
         KP2f7A3ShvtxEETEsEYrItZOj9vgH73wkqzPpACvoar64Xyt8hIOFVgJfa09+m9985/K
         yf3yAHa9iVKwyj4uKLjE3VbcE84XWll5rX+Z1rHV18gAvb0vHkqxodsMi3ho3XtWv1KI
         NcyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789562176; x=1790166976;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=j43LFPCZ7rUBOiUq13DB94/P46Wvh+c5n7GJVgSSa8E=;
        b=tfuyTiOKgKP0yL+m8IJIKtNixSslYKliKAPtX0pMF7jk9zvDLckhxDD4EAf3/+SkgZ
         FzWS5EBhQqZ8ggYtBX8WDRO7dmqSpf4OLxRDr4Ww+FWWlCGC2ct853GhOIcgPtuTpMsJ
         u8JusZsc23b9VzfRPW3uKhBdBDnhn1C8nheez9HWAamXnxx5SHFeNf6xjNDG2XFLrY7I
         Oayx3ip+F9f6u/dURbXSjVzhRSuo7OOFtZY8RTJZ8CSauS98F6TJBaGTV0++GsQqY49g
         Ad50Pga+UyMZjdpPzJO/NYQYGxFx3xh+ZR4dEtyzSixB8H8pSpYk9CUaIy1E5bfTTcLZ
         Ow7Q==
X-Forwarded-Encrypted: i=1; AKwUvByKHAAJuh4Q1E+24Hss5cse4qX59RPoGUSU+LfZGVAWS8rFCoRSF9j6Ed/keROBpuIfuHngNLZYb8ZQE/k=@vger.kernel.org
X-Gm-Message-State: AFuF++kO87NFoJyYvImVHpiAzY23lrzGOb4AQ0GfGQ3MO9DjR9YAWZIs
	wXfj1jarYFOmYO7Bk1ZEG8AO+paSxUxcVfJiNAn5ydvjqngGJnm69eF4FlbVeZ/hNZgHPOfaxHb
	Fs1mAvTncoYJZ3M2/Bx7y5PK6eeireXiO/fGHSfWZs07lRe3axB53+k1LDvIWuxZT1A==
X-Gm-Gg: AYBFou08X++1jUCuFX7V4rtyP0L7q2o+sKmRKUEqH3OtlwD17evzEdlD2UdWB95rN5G
	NA4G8FwWFHF80c37wI/bzqByyCKJYOaL8A9M+WlpqzjPBfKlN1s+d+oI70MvElksiISwehW9fSr
	D1La+8YEG+tRJs10x3GQYaYFxYtyduteWrJ5Q6+PMepDifgqbJhInYF5S5IN99VRFcvQ/MrPYJ7
	/vmbjBe95E63kWvCW+GrnWEifEK9LkemCyQzYV2JJCQIU5quzpDYobW8qrmHnS15yltT9jxerG5
	MLGjoPzmtXrEM2RomN+cVFnl0q4Xln51L9UhgcmbVKVZ7HSaruZdOiT8Sz5zhDa/+GjPoaLy9AU
	jdXiWoOF8KzdOr9Olft5vNlHdJdsu8xnkOXVfuYCvO9c4Zw==
X-Received: by 2002:a05:600c:698e:b0:49c:dada:f57f with SMTP id 5b1f17b1804b1-49eac4638d8mr29033695e9.7.1789562175620;
        Wed, 16 Sep 2026 05:36:15 -0700 (PDT)
X-Received: by 2002:a05:600c:698e:b0:49c:dada:f57f with SMTP id 5b1f17b1804b1-49eac4638d8mr29033135e9.7.1789562175106;
        Wed, 16 Sep 2026 05:36:15 -0700 (PDT)
Received: from sgarzare-redhat (host-79-53-30-11.retail.telecomitalia.it. [79.53.30.11])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e83da071asm93775155e9.8.2026.09.16.05.36.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 05:36:14 -0700 (PDT)
Date: Wed, 16 Sep 2026 14:36:07 +0200
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
Message-ID: <aqqNEl6Hyk_h9C8r@sgarzare-redhat>
References: <20260902-vsock-guest-ns-v1-0-9995383e9a8b@meta.com>
 <apqGcFDFm9_Wtw4q@sgarzare-redhat>
 <apsANK7ySuRzzK0V@devvm29614.prn0.facebook.com>
 <aqkaTXHDf5nfPL9w@sgarzare-redhat>
 <aqmDuxMuEN5lS/0J@devvm29614.prn0.facebook.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <aqmDuxMuEN5lS/0J@devvm29614.prn0.facebook.com>

On Tue, Sep 15, 2026 at 10:43:23AM -0700, Bobby Eshleman wrote:
>On Tue, Sep 15, 2026 at 12:16:47PM +0200, Stefano Garzarella wrote:
>> On Fri, Sep 04, 2026 at 10:30:28AM -0700, Bobby Eshleman wrote:
>> > On Fri, Sep 04, 2026 at 10:55:17AM +0200, Stefano Garzarella wrote:
>> > > On Wed, Sep 02, 2026 at 04:00:46PM -0700, Bobby Eshleman wrote:
>> > > > vsock network namespaces let a host put each VM in a namespace of its
>> > > > own. A guest has no equivalent yet. It has a single G2H device that
>> > > > cannot be assigned to a network namespace.
>> > >
>> > > Thanks for this, I'll do a proper review next week, in the mean time some
>> > > comments below:
>> > >
>> > > >
>> > > > This series lets a guest move that device into a network namespace. A
>> > > > new ioctl on /dev/vsock, IOCTL_VM_SOCKETS_ASSIGN_G2H_NETNS, assigns the
>> > > > device to the namespace of the calling process. The namespace's existing
>> > >
>> > > Why an ioctl?
>> > >
>> > > I'm asking because I'd like to know if you've already considered any
>> > > alternatives (sysfs, netlink, etc.)
>> > >
>> > > How do you think the ioctl should be used? Should we provide an userspace
>> > > tool, or extending some existing tools?
>> > >
>> > > Thanks,
>> > > Stefano
>> >
>> > Really only because /dev/vsock exists and the prior series used it.
>>
>> Yeah, I vaguely remember that we may have discussed switching to netlink in
>> that thread, but I can't find it.
>>
>> >
>> > Considering netlink, it might be the better option because there is a
>> > lot of prior art solving problems we might have in the future. For
>> > example, I was thinking about when users suddenly lose access to vsock,
>> > with just the current assign ioctl there is no way for apps or users to
>> > figure out why this happened. We can have an ioctl() setter for user,
>> > but in netdev world users can actually get a notification via netlink as
>> > to which namespace the device went to and what its ifindex is there (see
>> > __dev_change_net_namespace() for the RTM_DELLINK and RTM_NEWLINK
>> > messages). There is probably more, but that's the case that comes to
>> > mind.
>>
>> netlink seems like the right way to go, do you think it'll be a real pain to
>> implement?
>
>It is really not bad... it'll include a yaml spec in
>Documentation/netlink/specs/ of call names and perms, a new target for
>generated code in the Makefile, a handler, and then
>tools/net/ynl/ynl-regen.sh generates the plumbing.

Ah, nice! So, do you want to try that direction?

Thanks,
Stefano

