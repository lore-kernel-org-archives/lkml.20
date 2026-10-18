Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2C59411FBB
	for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 22:13:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792361617; cv=none; b=JQofeHQhJrXV6G2QdLxDNrRaRC5heCOepcx26eyCjWws9NjkxHvCMSRjgcASfa7pR20e3+MWx1VB9/Gm37i5T5nwmYX6zVhwmTUtynBecZfUR05qUIEUPhQl4hxeJLK6VxBH20z6khxUrFkGBtoqY/dhTCtFjdwM520BDDI/PCE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792361617; c=relaxed/simple;
	bh=JBnh6g8/khXfo/xjv3nRYstO4SCCAW5vzbTZ2OoUIp4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tOl+zySvrifB88lcuVfJVXfJ89UKFTZ48zsWk6ROll1KM1aApyS+6uVIUN4xhIvHXp3GoIQRPNtXuLQPNZz4ful78XBLLp1SbdbpzcQ3gxcrJ2FwRe9KqDDJV5L+RMlG2U01I6G9TMTHJAAdxWx83Ke6nVSjgt2vZlnMowr8rJ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=gsLpHUv6; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=UK7LpVC5; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="gsLpHUv6";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="UK7LpVC5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1792361614;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=D2nWTmEzSlPTSS6/bv2DXBvJ1IMAaQG+TiNBhHr6z6k=;
	b=gsLpHUv6XRn7KQb2DbuEhMEV3nhOb/rQk+DoA4pjYS0Iw5sVuo16T4nEk0HZIBNtIUaYbj
	E2J47yTC4/R+IlflrVA9rrGeO86tUOsyF8trKct0jn7dd8sVH2V+sJv8aMmH5uF+Zo5BFz
	Qj4jLTJyXwF53IqbiQwPVLcFXgRg6Co=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-149-4YQfalDvOlKd2-hlHQBRzg-1; Sun, 18 Oct 2026 22:13:33 +0000
X-MC-Unique: 4YQfalDvOlKd2-hlHQBRzg-1
X-Mimecast-MFC-AGG-ID: 4YQfalDvOlKd2-hlHQBRzg_1792361612
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-48e1291432aso341392f8f.2
        for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 15:13:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1792361612; x=1792966412; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=D2nWTmEzSlPTSS6/bv2DXBvJ1IMAaQG+TiNBhHr6z6k=;
        b=UK7LpVC5ynnkkWWJnerT/vvL6GRVLxZzYw9dSFiA6TOTwmacWDvb0JnUgfqZmrU8Z8
         Cqva6B7MOWfLsFoBx3RczGjP/5sFmiMGMFft6qiJfRVi7n96+3FQG1fuKZbSlUF1/6jA
         ye8xT6ayeZhCESJZKPq5LdloJ1Vtfgq+VAFSA0xzdNIS7bj/S1kGfxqkdf9weUrwo+ue
         jFELfkq/ZEz7Rgmnvhxk+hbZM61kD+qbxIwGVTHPUuJ0IdMNZ/E0DHAsrZN+54OrCYeM
         EYguIh+BrZ6pLnjzr8zB4URPOVw86L0c8Tc43OZmU3a18hHx9dXmOpn1VI1GOP+Z4UHF
         RKPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792361612; x=1792966412;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=D2nWTmEzSlPTSS6/bv2DXBvJ1IMAaQG+TiNBhHr6z6k=;
        b=vAZDiHx207EuotWfSqFj9Nn1pQOtZ8G8qxPo8ZmYoqo9T4FLouI++kYjket5Bl5vVe
         i5ieytUGUwb3dirh0XiraJkChfZgdD532FTrgC6ieA6j3ML988bxkcY2ZDZyTHiJh791
         4/L+c2ogz5/z/4oZu7vhAR8TkRFt6XF2FEX1lsc/JMxoR39c3dEuGfGtGydtcuuafUuA
         NWOJD39RfIjqxd3OXqucqDBu47RKKuHBk+HgygfGAexFMg7osynafWZ9gSognmthCl5b
         MF258/IQFDDi5CkJYdJ9j0tDoxKt9LIHFZ/iFLzvT1U0jFLnznPKnCa9KdEDXC3vVEEW
         8PHQ==
X-Forwarded-Encrypted: i=1; AKwUvBxLQ03fKas7z8VLN8G90BS5UTp/D3aKAhotlD2vfmYWX0zBOL7WQnaCKkEycRhb6v9WWR964X8UJXDnr7Y=@vger.kernel.org
X-Gm-Message-State: AFq9FYJyO16lhuAVulgZzBzauJRuyX03mzIoKHu9rvu4koMHCLKQ2gfB
	FygnXcopl9IBmVqgvrVRdd1Q7CtbDG1BX1Xfjyn1iDh9GEZC9SLs1Nsa7kmRXYwSUI8UqaYm26r
	ovmwcjtsEuuUc34LUZFCQUHqZfXCl094wd5/47dCjMbrbR2QlvZeYLqn85YtwsNWYMw==
X-Gm-Gg: AYBFou1E9LH0mmUeaf5CZyjvb1IDDx0Ao+YQD9u9DIqAtxxDZJ343OQ+2jurVZVubrV
	QOPopUNwyu+VNEAb44DtnBUadqqi0d4irn79jLupD+ueBbKo8RfGxo/8yTKCHarMdinHu75Xs/5
	cJYIp0zAIC5Qg9yNEajDTlGHLglN30BcY+Ht0tR5KiR9q3vz4r66Qw/uNyoZGBtwFea3JdGOIlf
	Tjrh/WemIM39IZi1ELYaWXPRbVDUih5wflu6LDwGSfG6pIUD1vJ+i8v/K5cbomPGz1Wdelia0ea
	ao3Cc5tvXZuvJZCMVizNPawkueNORvEVAgkocXwP6mf3jB5+S5iQ2yxJXyFW7vCHQ81wOA==
X-Received: by 2002:a05:600c:548d:b0:4a1:e250:b191 with SMTP id 5b1f17b1804b1-4a1e250b1c7mr52451185e9.17.1792361611687;
        Sun, 18 Oct 2026 15:13:31 -0700 (PDT)
X-Received: by 2002:a05:600c:548d:b0:4a1:e250:b191 with SMTP id 5b1f17b1804b1-4a1e250b1c7mr52450995e9.17.1792361611317;
        Sun, 18 Oct 2026 15:13:31 -0700 (PDT)
Received: from redhat.com ([2a0d:6fc0:3fd7:5300:3d6b:52a4:a23f:9d0b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd471a72sm20914904f8f.4.2026.10.18.15.13.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Oct 2026 15:13:29 -0700 (PDT)
Date: Sun, 18 Oct 2026 18:13:26 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Linus Torvalds <torvalds@linuxfoundation.org>
Cc: David Laight <david.laight.linux@gmail.com>,
	Haoran Wang <haoranwangsec@gmail.com>, jasowangio@gmail.com,
	KVM list <kvm@vger.kernel.org>, virtualization@lists.linux.dev,
	Netdev <netdev@vger.kernel.org>,
	Eugenio =?iso-8859-1?Q?P=E9rez?= <eperezma@redhat.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Security Officers <security@kernel.org>
Subject: Re: [BUG] vhost/vringh: __get_user without access_ok leaks kernel
 memory via vDPA passthrough
Message-ID: <20261018181202-mutt-send-email-mst@kernel.org>
References: <6ad07f8a.a0c71a5e.2d2efd.977a@mx.google.com>
 <20261018152358-mutt-send-email-mst@kernel.org>
 <20261018204838.4080b238@pumpkin>
 <20261018175347-mutt-send-email-mst@kernel.org>
 <CAHk-=wjneFJ7XmZ6ux-LsHq4apDgANcKfERztmAG9sGVY_TxAg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAHk-=wjneFJ7XmZ6ux-LsHq4apDgANcKfERztmAG9sGVY_TxAg@mail.gmail.com>

On Sun, Oct 18, 2026 at 12:06:36PM -1000, Linus Torvalds wrote:
> >     > > +
> >     > > +           if (!access_ok(uaddr, sizeof(*p)))
> >     > > +                   return -EFAULT;
> >     > > +           ret = __get_user(tmp, uaddr);
> >     >
> >     > Can't that be a normal get_user() call?
> >     >
> >     > David
> 
> 
> >     Ugh, actually no. This is called under local_bh_disable.
> > 
> >     get_user would splat on might_sleep.


> I[ sorry for html - driving around ]
> 
> That's a separate bug, and you really shouldn't use __get_user to work around
> it just because it doesn't check. 
> 
> You should use pagefault_disable() around the access. And if there is still a
> sleep_on() complaint, that should be fixed. 
> 
>         Linus


Thanks Linus, will look into this.

-- 
MST

