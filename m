Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792973972;
	b=lJmqSM6fL2n1pLC0i4avi0VNWhituYcfhfIJlbbhSit1wpjPpSNPYurBbliL7V2s3h02
	 QQIaVgmYWORewsDHdU2gni4qMqinotTFixAhhMYmuomfjoJfwv8wGTlXcedzo4ZN0Lk7y
	 i1Bw2vGc8DDQFibP5N9G0z6polXlQN91MRkpDDj4Igkz8m3joGNOEqxqMbqgcQoeK/dKg
	 fZ4Bf7I1j8Tqj2XvrJYWj6CZixB7/fO/z3qSq4Gg8gw3+HXTwZWngDrs8Qz5b28/GwWQS
	 nJI/onrTOnptsHoERWBdZU9HKp9yYJlLJwhPJutfMwd2RM3le2F5NhHqszNvX7lqp/g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792973972;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=UuDZU2l0/plv8oJ7vGm49nlGR3QZROefBx4Sih+ejb8=;
	b=Or0PtMBJPXHqS44pUXl2Ccn/0x+rX9TVF3au0nsnYiJqAoygOS3Wy+sC0AEiTcwMO7Eu
	 xBVX0b0/xGZcP4oBjPAQkC3QT+rLc5xIdworMJcuew12llYRaKQwfIbp8oluMLgt8U/dQ
	 gIVvj41+pHZLbYNtDFRgb+xkWBUbF75JIrlvEIgDn3T1Oqp30wnEzf1qxUJO9+clo2hbQ
	 0jMj99N9SUpW1BIrqU8nzV4U5cwoI0MaxGfSZymbZbeo8PaJ29vsuVBA36PhYJ783nq27
	 rwWj13Lg/RjZmU3pFOfx93peoxcfK/437SI1Eu/OgqaNCeimP5TYeSJ3KD7mK23YFwA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=aKeQ07Ls;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=QbrGLLTr;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4DA3606A31A
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 00:19:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D4DA3606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=aKeQ07Ls;
	dkim=pass (2048-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=QbrGLLTr
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1792973970;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=UuDZU2l0/plv8oJ7vGm49nlGR3QZROefBx4Sih+ejb8=;
	b=aKeQ07LsIGxfz1y/Ng0OjYjLmpgyVpHKzRNUID8qXbh/bGcFz+k7DI98BStQ2o7oqTE/Fc
	7GZ4oCB31cRVtVAYk+ghJ6tSTPuq7X4yc/gi798807SiLoaEM9itKht6McJ8kX6lP4UI+N
	nj6xsd57D3/FRf1Awuye9aAgLlZiiuM=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-612-s42k7pC9N7-iKm-Q9iKrBQ-1; Sun, 25 Oct 2026 20:19:29 -0400
X-MC-Unique: s42k7pC9N7-iKm-Q9iKrBQ-1
X-Mimecast-MFC-AGG-ID: s42k7pC9N7-iKm-Q9iKrBQ_1792973968
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-4a20a40d3e9so13888775e9.0
        for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 17:19:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1792973968; x=1793578768; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=UuDZU2l0/plv8oJ7vGm49nlGR3QZROefBx4Sih+ejb8=;
        b=QbrGLLTr5AnX+BLk9ESkwdF6kIkXTpUCSxcVN9N4JvuhH+DOt6Xrp4K4eYIMYfOsW/
         NPz5HdA1YjkfNmy+JzrFqH1y+ELkZCO0q1HNk0McI+RHxGczQ/i0i49Zs2GoP2W/MWBH
         QeTJrGBNLnmn80A6ZBUTSHBcvEY+vXdTVxdDtpVhqE15cDNZOLSI0zXcjvjy91C1iENc
         NSvoQGQOGSSHNmvplH2iARJOMTPvvOPmI5xle6uPqZNkVYJ6A62cKtndp9+gI3vK3CQG
         pHEcFHVnZp8fUb+QlTRfnpOfIK0nCgcAN9QQDbYoZ1VYnaQFfCKvU+1BiSu+B869P55J
         tzug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792973968; x=1793578768;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UuDZU2l0/plv8oJ7vGm49nlGR3QZROefBx4Sih+ejb8=;
        b=CaFDF5WakKKPeToBGWQRLaq0c3AYfEsR9/2WBslm/vB3mf18E1LAtZarekXNMAqcSn
         jHO5jg/ylsWkRpKwz4CZnc8BVjxJH1KyYccxZocr//XST9RG/+ytQ+RNG5iJ1OmuCpeD
         SfPdnTpKcA1Cx+gjKngTGZqIBOkTzQIoGRUt2MXFYuxOrbOJeKHtJTo8qBRhT51acn7+
         t4MrB7RipbveZObJpYQUbekfKQzVJbJe+S88fiGM7WGYesDRbHzxCJQWHzQpLnqbsdGI
         5krCNnOYWtNWuzJTfjRwUGdE+68R45UTSoI3qZgAL3cDjRy00c6UcjBtdVWq2Q34vOgf
         j3Iw==
X-Forwarded-Encrypted: i=1; AKwUvBzdzNCCJEGTid2QvQSHVYScPUGg7UeJmaCWEhvRXIBYFIQwaeEm2XRSLGej+biWcYGs95PBMJNf5CEUajA=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ2AAoog+aU7pYA+5C50b3IsbZep6CNtguFViuCqkVULiDNXPXX
	h5LZzzV8Ongnm49Z6XsSvjAQ4hpkNhoAxFboT22kEIWzp2dIDKffndsXIxSKHofJqocJiDBqJrh
	RxjMuRAfYsiBZIC4FS77AtFYIbSAHig0alZwhx4bGsg5YVmtCREoH8aiy0JkvVF5BGg==
X-Gm-Gg: AYBFou29WF+hhWx6kOXEroFYgzbkH2UaUGiSedRk1LWLa/Xt/4NsWKrxYHd9tE9hqua
	Q//RFqoDqmyJYCxo/tTz1D8qACwd2ewa8NEnf4Ld9Gh61MB5N/2LaOqlBRk5CDJQuUdofnYY2vg
	Ku8lqgSUA/SohBC5oHjkUtOkxX/sajsKlccPy+05AA50I5SBfulJ4xJpNbp+vbtUA2ZK7ZiOcA1
	zlcb2Fs4JRDyYhxz7J0vz32YDk1jmJcsA7wbkM8Sp54wKy6ibafuD3xrhLnTlPEDVjh8/ix+muR
	js4TdvNDxjE7+1ml3yWNd0yLLNFGt3IZRd6Hzr6zyjTHF8KeO/Phg2O1UNNXsWA2dBk=
X-Received: by 2002:a05:600c:8184:b0:4a1:ac66:6059 with SMTP id 5b1f17b1804b1-4a35aca6b82mr83802705e9.26.1792973968239;
        Sun, 25 Oct 2026 17:19:28 -0700 (PDT)
X-Received: by 2002:a05:600c:8184:b0:4a1:ac66:6059 with SMTP id 5b1f17b1804b1-4a35aca6b82mr83802215e9.26.1792973967640;
        Sun, 25 Oct 2026 17:19:27 -0700 (PDT)
Received: from redhat.com ([2a0d:6fc0:1536:fc00:b838:383:1c7:6e81])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ebd4be6sm11667327f8f.37.2026.10.25.17.19.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2026 17:19:26 -0700 (PDT)
Date: Sun, 25 Oct 2026 20:19:22 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Ruben Hakobyan <hruben@meta.com>
Cc: David Hildenbrand <david@kernel.org>, Breno Leitao <leitao@debian.org>,
	Atish Patra <atishp@meta.com>, Jason Wang <jasowangio@gmail.com>,
	Eugenio =?iso-8859-1?Q?P=E9rez?= <eperezma@redhat.com>,
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
	Alexander Duyck <alexander.h.duyck@linux.intel.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	virtualization@lists.linux.dev, linux-kernel@vger.kernel.org,
	virtio-comment@lists.linux.dev
Subject: Re: [PATCH] virtio_balloon: batch large descriptor chains for page
 reporting
Message-ID: <20261025200808-mutt-send-email-mst@kernel.org>
References: <20261023042737-mutt-send-email-mst@kernel.org>
 <20261025235641.601299-1-hruben@meta.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261025235641.601299-1-hruben@meta.com>

On Sun, Oct 25, 2026 at 04:56:41PM -0700, Ruben Hakobyan wrote:
> On Fri, Oct 23, 2026 at 11:04 AM Michael S. Tsirkin <mst@redhat.com> wrote:
> >
> > Great patch, thanks!
> >
> > On Fri, Oct 23, 2026 at 01:19:19AM -0700, Ruben Hakobyan wrote:
> > > The virtio_balloon driver reports a scatter-gather list of free pages
> > > to the VMM so it may discard unused pages.
> ...
> >
> > It's not just a question of convenient, is it?
> > Rust is buggy wrt to spec as it allows only U32_MAX.
> > So it is also to make it work.
> > So should we maybe fix Rust to be spec compliant and allow 2^32 too?
> >
> > I think we should definitely recommend U32_MAX in the spec
> > because otherwise it can not fit in the used length.
> >
> 
> Thanks for the review!
> 
> Sounds good to me, I will CC virtio-comment@lists.linux.dev as
> per your recommendation.
> 
> Agreed that Rust-VMM should also be fixed in case 2^32 needs to
> stay the hard limit. I think here for the driver, we can be more
> conservative as long as we stay below 2^32.
> 
> ...
> 
> > > ---
> > > The wording in the spec is a bit ambiguous because it uses "chain
> > > length" for both descriptor counts and the total size of the memory
> > > ranges referenced by the descriptors. My read is that the byte limit
> > > applies to the sum of descriptor lengths, which is also what rust-vmm
> > > checks.
> >
> >
> > quote what you are referring to please, also in the commit log
> > not after ---.
> 
> I will update with quotes in v2, thanks.
> 
> >
> > I would also CC virtio-comment@lists.linux.dev - spec should recommend
> > U32_MAX.
> >
> > >
> > > Another option I considered was to limit reporting capacity based
> > > on the largest possible block. E.g. for 64 KiB pages, the largest
> > > block is 512 MiB, so limit the reporting capacity to 7 to stay
> > > below 4GiB. Although simpler, I found that the time to reclaim
> > > was quite a bit longer.
> >
> >
> >
> > So I was going to apply this actually:
> >
> > https://lore.kernel.org/all/b541ff170218bd5d45b551b5132e7cf2c490d761.1780906288.git.mst@redhat.com/
> >
> > which makes the question completely moot.
> >
> > Does this have any effect on performance?
> >
> > Thanks!
> 
> Thanks for sharing this. Yes, this would also make sure we stay below
> the limit. Regarding performance, I tested this on QEMU and it calls
> virtio_notify() after each completion.

Who, QEMU does?

> Using one chain per entry
> creates more chains, so QEMU can use more CPU time to reclaim the same
> amount of memory.
> 
> If we go with this, I think a QEMU patch to batch notifications
> could reduce the overhead. Alternatively, I think we could create
> larger chains here but make sure they stay within the 2^32 limit,
> and keeping your approach of queuing them all before kicking.
> 
> I am happy to share a patch with my thinking here.
> 
> ...

Oh. It's just the driver being silly and never disabling
callbacks.

pls just add virtqueue_enable_cb_delayed and this will fix it.

