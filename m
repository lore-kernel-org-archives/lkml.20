Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD8AE3E49EE
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 09:59:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788170396; cv=none; b=P5lqF6265IxJyRFiBTl6xcUTYzBxNVuG3rA6MpRlf6GL0zhZXDilZnEFEnUY+D+qIqBfvjrVorRE8TrjjRGEMEduQnSWoHn5MbW0PFYpT0juIlTF+LZndmHBDY2XmKuBrB5jnULXgNmvKnfhI4mAufhE3Z3YkkDvQZGHbXxKs38=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788170396; c=relaxed/simple;
	bh=ZeYhAm7eqIm86q4h2XtbyDnpgNB/HP6heJ+Xlgb9ARQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=n9r8ne+PJlvSa5k6I+omW94sRDpJQCaRYJJUL2ZrrRHN3tzZDYaArOm8avTri5ce69EJ/5Rm7KNjOFoEaznQUHqMBUoZbxd4LHYxXBjBygR+y7d2fC/rln+6iTFp7fNFbTITCId0A8AWdzr4Lew+Y3IRYSTsDPU6GgxvDMZ5L/U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ESfbsf3b; arc=none smtp.client-ip=209.85.215.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ESfbsf3b"
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-cc147d86bebso3751307a12.0
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 02:59:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788170394; x=1788775194; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=THrUgKzhRsf3n6+V7nW7vARyj/3BTZ0nOxBCb6HB/4c=;
        b=ESfbsf3bFFRUNUvUkZQzuoaIbFNnIP7bdmfaKiVcGc+yYZCw5kFTBCVer+L5EaXPVU
         9N+9Tb8rXO6m4rUy9VCdMVwEnMdNftfVQDa3n7Uq5sRwAhpMvk3SFYfSNI+KlNtFYXh8
         wPLVaubuBC6M3sKKY0AKKEZFl3VBnLOpmZmpYmkPB8BrP0w9pYNvAuR6HqZm9wzBTKuQ
         ZYr70R+cCVVtfPzqmFjUxBYo76SnbkNzhyVvlemseh3A3Picla6rBBlHOo/QvXZNzrBh
         Ltc509zR1pyohFKV61z2CPqkOv7YLuhV96/rsNN1qVWsAbSEnM500LEwQqSuvfcFfl66
         sd5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788170394; x=1788775194;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=THrUgKzhRsf3n6+V7nW7vARyj/3BTZ0nOxBCb6HB/4c=;
        b=g6JozkchMdrelrwlQNjl2TAj3WsavIRUsAz/LFnl2QPYAtlBzLUEZT3EqBBbsInRJB
         Icy+/W2fG1z1HfpFLs6jgqeu76AxVAsn34GJG0g5sDN0GrLA6nVktusgrCrG+JhJiFHu
         /l0Ksx7EeePHsU+9w/B2DD0HtNLoYzkn/aGJoyhvPb7cHtktAUa2l+BjpDIAdAb40Ypt
         ltRxt22zbeJe3Iq9fiDRC91/K1jbtCZxQt7nxN6RX06zWGndNKUtfacfBxRQwRFE7MZP
         ss2wRUfWQX3ZLANGdJ3c20ya7c/YFVsdCQLoqWiYm5Sd8keyaue/S8ZIKDINcpvQQLEV
         VvSg==
X-Forwarded-Encrypted: i=1; AHgh+RoBLIHGsF7IxV+gLIPxqAREWcQj9kSUQw7PW8JqsJlreLczJQ0GMbpMj+F69Mh12G2KIvykFGHvnImgr5k=@vger.kernel.org
X-Gm-Message-State: AFuF++mqITcT99jPz1h1TjrjsleWCQ4hf5jJcaFkmbUCP5Hnz1gLuMi3
	Df8um7RhAX5+YBzat5JNZyRxwT+GhNEfG6hmDuIzFPX1n4fpkVhR8q/v
X-Gm-Gg: AR+sD133U5ZyrWdG6P+k2BiniX0yBYsvwyePNoLIdju1pmSLa1vfg9aVQJcWjPqau0X
	+Z+c6bCRixoJLPy7xAKsY8EzhooBfMVkOS9bmEhxbovSY7wvYvHAUswl2JvN392Lxp0ME2f7Pey
	nRjMa7ud6wiixee5NShYdHH2oJxqJFZFtj3PjltNi2cUMljwUEVbSLZuKhPySppmwguPlW6+3Vi
	miSn/qdqjktMoaCKNRl6Ofau5mT3kywJ2uTz0uBOdHFhBlJPRevF9ReeyoCExGcQecs40OARHMe
	GckXGY77lIr4ZJkd23EFogrm+14SfEssgJhxBm1v9ByWpRBqUP7/RCCbLGMV0EE7yzKKVFx/jc0
	ZLfgm1CCUKSntkKxGheHjyRg9vaFYWHP0wvMGKMfuR1NJ9AAc1RseVer2wnqby2gWQr9Y//GSnn
	PKJTZTK1lFC4GIm7aUVwZ+92X1D5cmUt18SdTfMME9zr6JWCSBMoT+gs+o2hJoE+43eKZ8MZGtd
	4AXQoOXJ6nsz82jiQb4Lw==
X-Received: by 2002:a05:6a21:458f:b0:3b2:8674:9830 with SMTP id adf61e73a8af0-3d5d9281d59mr6078501637.14.1788170393811;
        Mon, 31 Aug 2026 02:59:53 -0700 (PDT)
Received: from niharika-QEMU-Virtual-Machine ([223.181.115.95])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3286f9e2a95sm27345377eec.23.2026.08.31.02.59.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 02:59:53 -0700 (PDT)
Date: Mon, 31 Aug 2026 13:50:11 +0530
From: Niharika Khare <niharikakhare2101@gmail.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: sakari.ailus@linux.intel.com, mchehab@kernel.org,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	syzkaller-bugs@googlegroups.com
Subject: Re: [PATCH] media: mc: Remove spurious WARN_ON in
 __media_pipeline_start
Message-ID: <apU5O6ahkYlvioju@niharika-QEMU-Virtual-Machine>
References: <20260821165833.10042-1-niharikakhare2101@gmail.com>
 <20260821193326.GI59206@killaraus.ideasonboard.com>
 <aokkTcorNSJOnJFj@niharika-QEMU-Virtual-Machine>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aokkTcorNSJOnJFj@niharika-QEMU-Virtual-Machine>

On Sat, Aug 22, 2026 at 09:53:46AM +0530, Niharika Khare wrote:
> On Fri, Aug 21, 2026 at 09:33:26PM +0200, Laurent Pinchart wrote:
> > On Fri, Aug 21, 2026 at 10:28:07PM +0530, Niharika Khare wrote:
> > > Vimc driver's entity topology has three capture nodes and two of
> > > those (Raw Capture 0 and RGB/YUV Capture) are reachable from each
> > > other via enabled links. The crash report and the C repro show that
> > > the two capture nodes attempt to invoke a STREAMON session one after
> > > the other, which resulted in the WARNING getting triggered by the
> > > media controller.
> > > 
> > >   vimc link validate: Sensor A:src:640x480 (0x42474752, 0, 0, 0, 0) Raw Capture 0:snk:640x480 (0x42474752, 8, 0, 0, 0)
> > >   vimc link validate: Scaler:src:640x480 (0x33424752, 8, 0, 0, 0) RGB/YUV Capture:snk:640x480 (0x33424752, 8, 0, 0, 0)
> > >   origin->pipe && origin->pipe != pipe
> > >   WARNING: drivers/media/mc/mc-entity.c:785 at __media_pipeline_start+0x1add/0x22b0, CPU#1: syz.0.17/5912
> > > 
> > > The graph walk originating from Raw Capture 0 (first STREAMON in C
> > > repro on /dev/video0) reaches RGB/YUV Capture and marks its origin
> > > pad's pipe with its own pipe. When RGB/YUV Capture's graph walk starts
> > > (second STREAMON in C repro on /dev/video4), the pad is already
> > > claimed. This is a legitimate userspace request but not something that
> > 
> > No, that's not supposed to be a legitimate use case. The WARN_ON
> > indicates a driver bug.
> 
> Thanks for the direction Laurent, I'll look into vimc's architecture to
> check on how the two capture nodes ended up starting the pipeline back
> to back.

Hi Laurent,

The WARN reproduces without the syzkaller reproducer by configuring
formats with media-ctl, then concurrently running VIDIOC_STREAMON on
/dev/video0 and /dev/video2. Both sit in the same connected component
via Sensor A.

I tried checking the pad in vimc before video_device_pipeline_start()
and returning -EBUSY, and this removes the WARN.

However, a couple of other drivers are structured differently:

1. rkisp1 embeds a single media_pipeline in struct rkisp1_device; both
   capture nodes pass it to video_device_pipeline_start(), serialized
   by stream_lock. vimc embeds one per vimc_capture_device, so the
   second STREAMON sees a different pipe pointer.

2. imx8-isi acquires the pipeline with media_entity_pipeline(), falling
   back to the node's own pipe, under graph_mutex.

I also tried the imx8-isi approach in vimc. Both nodes stream, but
teardown NULL-derefs in kthread_stop() as the core refcounts one
pipeline while vimc keeps a kthread per capture node.

Before working on the teardown: should vimc share a pipeline across a
connected component like these drivers, or refuse the second STREAMON?

Regards,

Niharika
 
> > > kernel should allow while the pad remains claimed. Hence, the kernel
> > > checks the pipe and returns -EBUSY instead of raising a bug, same as
> > > the other non-origin pads. The check on origin pad's pipe needs to stay
> > > otherwise the origin pad case would go through the increment on the
> > > start_count path, even though there exists a loop few lines below this
> > > block to check the pad and return -EBUSY. The check also provides early
> > > failure detection and prevents the complete graph walk.
> > > 
> > > Fixes: ae219872834a ("media: mc: entity: Rewrite media_pipeline_start()")
> > > Reported-by: syzbot+68e901d044baaea1f60c@syzkaller.appspotmail.com
> > > Closes: https://syzkaller.appspot.com/bug?extid=68e901d044baaea1f60c
> > > Tested-by: syzbot+68e901d044baaea1f60c@syzkaller.appspotmail.com
> > > Signed-off-by: Niharika Khare <niharikakhare2101@gmail.com>
> > > ---
> > >  drivers/media/mc/mc-entity.c | 18 ++++++++++++------
> > >  1 file changed, 12 insertions(+), 6 deletions(-)
> > > 
> > > diff --git a/drivers/media/mc/mc-entity.c b/drivers/media/mc/mc-entity.c
> > > index 3fa0bc687..7b4ef2c95 100644
> > > --- a/drivers/media/mc/mc-entity.c
> > > +++ b/drivers/media/mc/mc-entity.c
> > > @@ -778,12 +778,18 @@ __must_check int __media_pipeline_start(struct media_pad *origin,
> > >  
> > >  	lockdep_assert_held(&mdev->graph_mutex);
> > >  
> > > -	/*
> > > -	 * If the pad is already part of a pipeline, that pipeline must be the
> > > -	 * same as the pipe given to media_pipeline_start().
> > > -	 */
> > > -	if (WARN_ON(origin->pipe && origin->pipe != pipe))
> > > -		return -EINVAL;
> > > +	/*
> > > +	 * If the pad is part of a different pipeline than the one passed on to
> > > +	 * media_pipeline_start(), the pad must wait for the ongoing session on
> > > +	 * this previous pipeline to complete before it starts a new session.
> > > +	 * The request for starting the pipeline, although valid, cannot be
> > > +	 * served until the ongoing request finishes.
> > > +	 */
> > > +	if (origin->pipe && origin->pipe != pipe) {
> > > +		dev_dbg(mdev->dev, "Failed to start pipeline: pad '%s':%u busy\n",
> > > +			origin->entity->name, origin->index);
> > > +		return -EBUSY;
> > > +	}
> > >  
> > >  	/*
> > >  	 * If the pipeline has already been started, it is guaranteed to be
> > 
> > -- 
> > Regards,
> > 
> > Laurent Pinchart
> 
> Regards,
> 
> Niharika Khare
