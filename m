Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F31233B3C0A
	for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 21:58:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792360688; cv=none; b=gRjQKwGqyH6Os2+h+WADEY6cJ68xvwaTaQw9f9w0byBcui7Kv2Y5r5a8cFrUTW+arbbkOsarFQZHA+vsYHQX7WKRouxQneR76xyzOPeRH/c3fuy1dw1PFyPscyF51PDZJGBM+ZCW+9/0uI19hM6cmA5ivCD15fFAhm7rQj7Y4oU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792360688; c=relaxed/simple;
	bh=zrU6pncxkNvGO8lsm0RmeCOS8yCv8qbs+XOEF524iU4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uD4eu6CGe9Ir3ewkZyzWlLqW1rkqOnaarTkreqL3simK08d1U0c0MVJ9mf2Lvq8eTLuwiHNNOKweykQIKKpHjtdi/ryLrsuhN3quyfd2YytJAkahTk/nK1trvqYfJyjAD/oOmKI+vFAuGP1aGuf/S4w8ULUQMfAZC1nt/fFOmAc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=HksklKOd; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=bn5CuQgG; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="HksklKOd";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="bn5CuQgG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1792360686;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=SW7smKPvwjLXka19f8Byx3O0NkEWaQaf/H2rebSp6ws=;
	b=HksklKOdGU0/xOFgAkphij/sURxBF3eMTpqho3yLCHStsd7sU4oT9q1Fxk+0/KJ3OvBfCQ
	UrOuYXG8JEf7De5bnEsXod4HYNGr+LGXSA41XO6wgL+9yfKFK0489jlubj8Lsk0iOuZISe
	YjUjEvhNBceLh6hJTfuIRhWlw/2S4ps=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-66-bAm2c-zaPbaEB0FI4kpVbw-1; Sun, 18 Oct 2026 21:58:04 +0000
X-MC-Unique: bAm2c-zaPbaEB0FI4kpVbw-1
X-Mimecast-MFC-AGG-ID: bAm2c-zaPbaEB0FI4kpVbw_1792360683
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-48b0a199b20so1301616f8f.1
        for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 14:58:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1792360683; x=1792965483; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=SW7smKPvwjLXka19f8Byx3O0NkEWaQaf/H2rebSp6ws=;
        b=bn5CuQgGxwT7QhbmoRfxAUQMWL+M98ql5vbyoyPz8/OhejUwYrYdSkeJFJL7zs+4aq
         V/eOU1MBHPO3ChvBnNHHO+QQY3x25f4Y9K1ePRJH7DTP07JHsmgS8WyCsB9HztKjJw0M
         7LdXTG66rJ2+5EQZuwHEsFPjDaaQROAPGfiT4xroMoj/QImNqlios7BXe+XOXks3lEpg
         UFAr7zzBiz1ZrK/fk9ajb93EugDvSJHxCwIgN5FKldNWcpL8NMFGfa3paEwQP8o0IYc6
         PlvJraMsLRjVmPyy36XD6u9UjzrHygD2o7kfilLnMXT5/CtWu8+5RMaa97S7EUz2HynI
         4DNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792360683; x=1792965483;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SW7smKPvwjLXka19f8Byx3O0NkEWaQaf/H2rebSp6ws=;
        b=RCrehDRvCupBZB9GfCDABgzHGCk+BPKQEl4EeqbQA/UKjjxkm9/RH9JBEPy1SzzZha
         bll+/QbOEDNQpGkTwqvEuR8pvpiIcrRVpqESPZCNb3PzG1EYIngy2Cy+Wlyuv/0Va9ng
         xo5MKHdn0bmJ3j3sF2FF28eC/mDVnKeKNXFwfXFiT8ji7YEfzALepbdFpC03vOwc/ZZY
         P29O/R+5u3sruUebOoZZGy0hlbTnk4JSLM99RWek2s2Sqio7nW2zgaIuVKB/aA0tp1QI
         1jWRU9wXDAs3BHtMERpZ2UH7fNVOsY/v3GcfPiRh8bn4nNqb4B2fVrXEaq1UvzSN73tL
         GYbw==
X-Forwarded-Encrypted: i=1; AKwUvBy6H81GZIlLmCZTrqDtkD7E40fpVCTsiF8kNq5p7zdn/CjC1qdZc1EzwKMvU+nsctHpxxxmdxL1ZC3zA10=@vger.kernel.org
X-Gm-Message-State: AFq9FYKTokFX9NSdA0LjKEV65yyo3sYL5xI+Nd9SAWB97JJI0FXvHcIS
	6WKjyorY31Mqs0z5i4Py3YTiAHszBEWN9IO7Be29IhONgruzGbf1G5d9aewPJBIC0esThnV/svc
	UGuGHpwZxxJ2TJ4ioGru4k77qILVbq92KjevR9I2GQbOavPBZZhFP9XstcnxuAG4iU8r0CGqdng
	==
X-Gm-Gg: AYBFou1whSVijOhPEkd2SJa10eYsvjU7JPUsL4x17PXsceK10r74gOZQlOrIuakujF5
	8gxksmmrgwZvG+A+8bjGkZ8AHCyCfcvdKVpzcvfOc8UTOONN/0PhYyVV+wYZtpjo5zIsaMb9z5T
	SK6mjoRdf+UTCMfNj3xb1OTs6mDLhcLDeFBODrz0ZlRtls06aJ4LlL4hBrdh61lJt1AhggOuR6/
	9476IARUZIA3YSGNloOkTlH8UWsb5e6VNuXb/EVfCnQt5bL8svJfAhdkSAaTnoh4bNiJ84lqGUV
	1kEHe4Ydh7Jwrunga0PKDzgyIY9XFnNm1GXoR0zr90O5MU2/8FzQXFd4G2ZTJQSho255Xg==
X-Received: by 2002:a05:6000:2887:b0:48c:571a:a1aa with SMTP id ffacd0b85a97d-48e07bbc6e6mr11848841f8f.19.1792360683021;
        Sun, 18 Oct 2026 14:58:03 -0700 (PDT)
X-Received: by 2002:a05:6000:2887:b0:48c:571a:a1aa with SMTP id ffacd0b85a97d-48e07bbc6e6mr11848818f8f.19.1792360682562;
        Sun, 18 Oct 2026 14:58:02 -0700 (PDT)
Received: from redhat.com ([2a0d:6fc0:3fd7:5300:3d6b:52a4:a23f:9d0b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd5008e7sm18703089f8f.43.2026.10.18.14.58.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Oct 2026 14:58:01 -0700 (PDT)
Date: Sun, 18 Oct 2026 17:57:58 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: David Laight <david.laight.linux@gmail.com>
Cc: Haoran Wang <haoranwangsec@gmail.com>, jasowangio@gmail.com,
	kvm@vger.kernel.org, virtualization@lists.linux.dev,
	netdev@vger.kernel.org, eperezma@redhat.com,
	linux-kernel@vger.kernel.org, security@kernel.org
Subject: Re: [BUG] vhost/vringh: __get_user without access_ok leaks kernel
 memory via vDPA passthrough
Message-ID: <20261018175347-mutt-send-email-mst@kernel.org>
References: <6ad07f8a.a0c71a5e.2d2efd.977a@mx.google.com>
 <20261018152358-mutt-send-email-mst@kernel.org>
 <20261018204838.4080b238@pumpkin>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261018204838.4080b238@pumpkin>

On Sun, Oct 18, 2026 at 08:48:38PM +0100, David Laight wrote:
> On Sun, 18 Oct 2026 15:24:41 -0400
> "Michael S. Tsirkin" <mst@redhat.com> wrote:
> 
> > On Thu, Oct 15, 2026 at 03:23:45PM +0800, Haoran Wang wrote:
> > > I'd like to report an issue in drivers/vhost/vringh.c:1216 (function
> > > getu16_iotlb), found via static analysis of Linux 7.0.11 and verified
> > > against the 7.2.10 source tree. I have reproduced the leak on an
> > > unmodified 7.2.10 kernel.  
> > 
> > 
> > This should fix it I think? Can you confirm pls?
> > 
> > Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
> > ---
> >  drivers/vhost/vringh.c | 11 ++++++++---
> >  1 file changed, 8 insertions(+), 3 deletions(-)
> > 
> > diff --git a/drivers/vhost/vringh.c b/drivers/vhost/vringh.c
> > index 9066f9f12ba1..4b097170bd36 100644
> > --- a/drivers/vhost/vringh.c
> > +++ b/drivers/vhost/vringh.c
> > @@ -1213,7 +1213,11 @@ static inline int getu16_iotlb(const struct vringh *vrh,
> >  		return ret;
> >  
> >  	if (vrh->use_va) {
> > -		ret = __get_user(tmp, (__virtio16 __user *)ivec.iov.iovec[0].iov_base);
> > +		__virtio16 __user *uaddr = ivec.iov.iovec[0].iov_base;
> > +
> > +		if (!access_ok(uaddr, sizeof(*p)))
> > +			return -EFAULT;
> > +		ret = __get_user(tmp, uaddr);
> 
> Can't that be a normal get_user() call?
> 
> David

Ugh, actually no. This is called under local_bh_disable.

get_user would splat on might_sleep.


> >  		if (ret)
> >  			return ret;
> >  	} else {
> > @@ -1251,7 +1255,11 @@ static inline int putu16_iotlb(const struct vringh *vrh,
> >  	tmp = cpu_to_vringh16(vrh, val);
> >  
> >  	if (vrh->use_va) {
> > -		ret = __put_user(tmp, (__virtio16 __user *)ivec.iov.iovec[0].iov_base);
> > +		__virtio16 __user *uaddr = ivec.iov.iovec[0].iov_base;
> > +
> > +		if (!access_ok(uaddr, sizeof(*p)))
> > +			return -EFAULT;
> > +		ret = __put_user(tmp, uaddr);
> >  		if (ret)
> >  			return ret;
> >  	} else {
> > 
> > 

