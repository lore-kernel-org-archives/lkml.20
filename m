Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3774F3D1CD7
	for <linux-kernel@vger.kernel.org>; Tue,  6 Oct 2026 21:27:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791322061; cv=none; b=W5WOFTmfeZpWsAPeNYNc/xwBn8CE4PcsDu0BGortrKeOjg1W+ajmTFLxjH7awtNW09gXHCYJhMUxaIw8WacUk1+aqQ592xYZLYhSME0NPGv5l8PGa9u3p41NUKW4v9hc1sPublJ0YoxyUroVRDjm/GKt/nkTC7daeCVaVPbd+aw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791322061; c=relaxed/simple;
	bh=J518TeBei26VEQXbPGvt3y4HnC5DH/HWj48vtTb4u5k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fRyGpPyTbiVe/fVwROV6i80mIZrJwTi6X+EvkMMxBrwDmaDF72zDimoSEJNXdGjYLfl/hmZRQRB/bHg355tQVUtTMRivN4ilWfOjZZEavgNb4NwvRxqR34eE2zYezDYDZcYum1K64/XJ996wTjFUW03WIzeC1HWgYALKBiMVXjA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=BsznIeAj; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=bbfH83Ds; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="BsznIeAj";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="bbfH83Ds"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1791322058;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ZLYqLTXYL+33FHGPoAQIFrwweKpAyRzDOJvC/lVBZus=;
	b=BsznIeAjSR3qjDG49YUmAnzW302ftg/0ULYsp3Mcp4/zF5A+j0jTngxhAINTR6LMbTEdIK
	j2R74Ax5mze/+00eh8XMWfhtaihip9PBJSw4PYSXVIBm+nzqkEGnXrP3hb4fowQgNQYL3M
	Hh2vQGCleIBwpB6n/YpvjYTKCtHGv3I=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-652-LNXwlo8IO6CqipeFUvqVwg-1; Tue, 06 Oct 2026 17:27:37 -0400
X-MC-Unique: LNXwlo8IO6CqipeFUvqVwg-1
X-Mimecast-MFC-AGG-ID: LNXwlo8IO6CqipeFUvqVwg_1791322056
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-4a17ec7a49cso2786335e9.2
        for <linux-kernel@vger.kernel.org>; Tue, 06 Oct 2026 14:27:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1791322056; x=1791926856; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ZLYqLTXYL+33FHGPoAQIFrwweKpAyRzDOJvC/lVBZus=;
        b=bbfH83DsMbvkrurd4IHtSqzHwuMuwH+9d9V/tpHhSuoO5gW1W6EMud5slqeO/t3WMg
         v4zgYCAyrwlOYvZZQBbfGBWFODk66KAl+Y3oWte1So3j4XvZ6XPUmsefCDvc1+O8uy0D
         ayv5PlhKw14L0qCkouu45Qd/lHxB22FAxLMv/a/9Ynew/dz0o8Mdj9BKngpcGM3V2817
         2KWxyDUgZnRcGn9sjJWKvih0Zk6ic7WUiKOWCWJfaBn+gLN5Zgvtw4i0WYEvQoEpzGUI
         NSH3v/tYgPv4rqk7DnAMZe6/ksbeCeulNT2uvo1Mq/zSvz9aQTlBmWzzKc3Sew7j+i3c
         bIBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791322056; x=1791926856;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZLYqLTXYL+33FHGPoAQIFrwweKpAyRzDOJvC/lVBZus=;
        b=bo3sOqLzwpGQ2ZLeAXvSZJYukOUReaZkgnwYZG4zt2ztTLhAjw6o/b3XtACxdn+wlo
         qp4Zc0vTGYFWPnGI741PVxwIHeSS77wg1nE6wBGb0ndJON6T0Rl7VizjHL2JLKfFVxBo
         VSgEL5mq7ikKUx+x/24Q4DNzSaEVUCY66lL6dKcYRU7XpEvH2qzGq0AZEBd/5Iyq45Fu
         3yK/RPgyQKpi+pSfX0Bxhs0X+QQvk/BZf0LLtt2QDqBIr+ulc2kWGwJN7AqaAKoP9yUb
         Sh9i6m2CKaR68WnCDjg18Ul34Qwo0X6boqQ0DuWas6ZFIhz3w+vFEfmvHpr+7Xl6hIUf
         WX9g==
X-Forwarded-Encrypted: i=1; AKwUvBxx8N0FCWMmG+p8SvH5SpmOUFQdYBu4MBPAatt9JOr0khtDPfnN2Eul+jJI3Kgqk7aYSEturhr4A5ye0R8=@vger.kernel.org
X-Gm-Message-State: AFuF++lJyuJ1Jhtp4nYXg+BBlAPN3HksXyNu0ybC6XwuHTkaj2rX//YX
	QXwy5myEhaYMRpNAuBmOBWVTqG0oDGCJiUug2q/vTZFsSG/ydM+YvYOg6tn9nkoEzuvZrhsrcTP
	q7JhaluNiKKlymQHnvTz2T1G3X9HrVVUi0LjqgTae0z77WrJ0Lz2XcszV9JZ1CW9QbA==
X-Gm-Gg: AYBFou1l7hWoLzAiX9dqkyBsSCwiq+rHJyEDwtsJxKMlqEES/hlYzkTIW/4QIHt9wkm
	4qfSxmUYQksPXT5ZV6rqaVPhaIXdCClvlP7i1Zze4W1VdqT5k29qVAVWojyDqPhqp6HZaiw4xeQ
	1edWyzs2HbVRWNgIN4LX0xfPiIdjFM5sO3wwxIwZapfvS4sCng/tksW5b+THv8wnCIp0xS5H3P1
	s5WImvuc4iGdBFeU5Qikim+wxwn47kWStbLj6GcMT6TVfMV+ALBDq0SZdY4yXwL0tRLXtRpxZ5I
	sT2q5lGGRV6zSJSbL2WNzHOjjB0O93YF9qLS8mz5MUwcrJNJRZ4/hbmJSQ0vR2qgmSzWcAs=
X-Received: by 2002:a05:600c:468f:b0:49f:ce78:356d with SMTP id 5b1f17b1804b1-4a1806508edmr1608045e9.30.1791322055545;
        Tue, 06 Oct 2026 14:27:35 -0700 (PDT)
X-Received: by 2002:a05:600c:468f:b0:49f:ce78:356d with SMTP id 5b1f17b1804b1-4a1806508edmr1607885e9.30.1791322055050;
        Tue, 06 Oct 2026 14:27:35 -0700 (PDT)
Received: from redhat.com ([2a0d:6fc0:3fd7:5300:3d6b:52a4:a23f:9d0b])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a17f51beffsm14516105e9.2.2026.10.06.14.27.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2026 14:27:34 -0700 (PDT)
Date: Tue, 6 Oct 2026 17:27:31 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: sungbyeongchan <tjdqudcks0424@naver.com>,
	German Maglione <gmaglione@redhat.com>,
	Vivek Goyal <vgoyal@redhat.com>,
	Stefan Hajnoczi <stefanha@redhat.com>,
	Miklos Szeredi <miklos@szeredi.hu>,
	Eugenio =?iso-8859-1?Q?P=E9rez?= <eperezma@redhat.com>,
	virtualization@lists.linux.dev, fuse-devel@lists.linux.dev,
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH v2] virtiofs: validate fixed-output response length
Message-ID: <20261006172721-mutt-send-email-mst@kernel.org>
References: <20261004123405.586168-1-tjdqudcks0424@naver.com>
 <20261006182408.1301152-1-tjdqudcks0424@naver.com>
 <2026100633-roping-stardust-a6ab@gregkh>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2026100633-roping-stardust-a6ab@gregkh>

On Tue, Oct 06, 2026 at 11:11:14PM +0200, Greg Kroah-Hartman wrote:
> On Wed, Oct 07, 2026 at 03:24:08AM +0900, sungbyeongchan wrote:
> > A short successful virtiofs response can leave the fixed-output
> > portion of the request argument buffer unwritten. The completion path
> > nevertheless copies the full declared output to the request destination,
> > allowing stale allocator contents to reach callers such as
> > fuse_statfs().
> > 
> > Require successful fixed-output responses to contain their complete
> > declared output. Continue to permit a shorter final argument only for
> > out_argvar requests. Reject positive and internal restart error values,
> > require valid error replies to be header-only, and do not copy output
> > arguments from error replies.
> > 
> > A header-only FUSE_STATFS success returned stale fields in nine of
> > nine calls across three boots. The fixed kernel rejected the short
> > response and preserved complete replies, valid error replies, and
> > variable-output controls.
> > 
> > Fixes: a62a8ef9d97d ("virtio-fs: add virtiofs filesystem")
> > Cc: stable@vger.kernel.org
> > Assisted-by: LLM
> > Signed-off-by: sungbyeongchan <tjdqudcks0424@naver.com>
> 
> Real name please.

a missing space I guess?

> > ---
> > Changes in v2:
> > - Reject positive and internal restart error values.
> > - Require error replies to be header-only.
> > - Rate-limit malformed-response warnings.
> > - Rely on the existing FUSE pr_fmt prefix.
> > - Add Cc: stable@vger.kernel.org.
> > - Use the reporter identity consistently.
> > 
> >  fs/fuse/virtio_fs.c | 43 ++++++++++++++++++++++++++++++++++++++-----
> >  1 file changed, 38 insertions(+), 5 deletions(-)
> > 
> > diff --git a/fs/fuse/virtio_fs.c b/fs/fuse/virtio_fs.c
> > index f15e516ebcb5c..fffbe08d9114a 100644
> > --- a/fs/fuse/virtio_fs.c
> > +++ b/fs/fuse/virtio_fs.c
> > @@ -4,6 +4,8 @@
> >   * Copyright (C) 2018 Red Hat, Inc.
> >   */
> >  
> > +#include "fuse_i.h"
> > +
> 
> Why is this moved?
> 
> 
> 
> >  #include <linux/fs.h>
> >  #include <linux/dax.h>
> >  #include <linux/pci.h>
> > @@ -20,7 +22,6 @@
> >  #include <linux/cleanup.h>
> >  #include <linux/uio.h>
> >  #include "dev.h"
> > -#include "fuse_i.h"
> >  #include "fuse_dev_i.h"
> >  
> >  /* Used to help calculate the FUSE connection's max_pages limit for a request's
> > @@ -730,6 +731,10 @@ static void copy_args_from_argbuf(struct fuse_args *args, struct fuse_req *req)
> >  	unsigned int num_out;
> >  	unsigned int i;
> >  
> > +	/* Error replies contain only the output header. */
> > +	if (req->out.h.error)
> > +		goto out;
> 
> But no error is returned?
> 
> >  	if (len < sizeof(*oh)) {
> > -		pr_warn("virtio-fs: response too short (%u)\n", len);
> > +		pr_warn_ratelimited("response too short (%u)\n", len);
> 
> Isn't these ratelimited() changes separate from the original issue here?
> That should be a separate patch.
> 
> thanks,
> 
> greg k-h

