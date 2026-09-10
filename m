Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93E6F3D954F
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 09:41:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789033289; cv=none; b=LeK5KTpVTPMp1lgvGwcfHsQSMhImuj+20JD79cacRYwZP6wFGM5FnK15PzQqRXPe+bM3R86UcSZkQa2pjWAuR6tdzJ2JIFAnr00WcZvG49V0pDg1tV8QI8XdeIULIG3w9kzSmQI9DOJS8ETt+qLmyhusmt2eR5h9rWT4OfpTGk0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789033289; c=relaxed/simple;
	bh=AtB30fOLmd9xwlz6s0ctJOk/nEgmq4K3+nf0Vx4MVUs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JpC/q4tmOeSxDnwaqHwpeEARilcbEr7bhX41p44vdggfZsN4MuZFLWlR8SRX/krvKrh34oOPv1TQ4SW6zddVivJIC3KAm/xHHFMQgHofcW/BM7/T0LO0LaHLRRiXn6tf4AmOeTzrKT5oXhtFtydQRu1/FNDJmTPL9oX1DuWtQTI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pyPZZkr6; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pyPZZkr6"
Received: by mail-pj2-f12.google.com with SMTP id d9443c01a7336-2d8fe517774so24801515ad.0
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 02:41:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789033288; x=1789638088; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=fquBE/d9+HqRv4rij8w/7PsKGJjDt7mpnvyWxy9ryZI=;
        b=pyPZZkr6lBZfjvC8biQrHE2YeNckaxKDXeye51mnAX3xxwcFrbn1T+nMt+SPJugr6g
         ZCOBv6LqVXxFIwXMC/ccbW/iBAUvectL3DN7KjNINEty02Lu0d8cQ1HQnrF3GyGLwkNJ
         GYfTU+fsygXgrn5Isp4UfQ05asitPU/8IZpyKTGXlkvtgqs+oahteTMq4eJGieAENLNz
         iGECnnRzHDkS7hPjrGsi4h5mcRpMyh8Rbp+O6/8xJP7gEPf2cNRFzZ6WHEU9OEAwFTnr
         bea3Bv9IpFM6buj6WQ80zTLjqXsqvBTHUIcJdlTO23hLatbrb3L3BU2uCfw7aP1TouDX
         9McQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789033288; x=1789638088;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=fquBE/d9+HqRv4rij8w/7PsKGJjDt7mpnvyWxy9ryZI=;
        b=oGjLdaukNMLa+pr3Yn8etVJz/xXBEFMqxg4OrfrhVpdHIay9lI25RaNrmvbbnWAymU
         mbaiyIQysLAmWzJpnYFARqmj4uup3em9p178LT5tubb+BUKQIugL4AIrmPZwBZ87eMHW
         xwWzncDrFTpNg2QrC6f55i4adCmktb1f19HyboZlHuqjuLZ0XatqyYr8TYVeaOGb4GZ9
         wryn8lZLkA9ABj3KeDCnod/D08psYaozEHax2v2IxY19Rk2IG4d8RTiKMUdcuxnNnXyx
         XvMHhOpGNTIkw2Kyx2zw0hSAgHhR1+jp/tgaTXolQCK/f9TB+H+ATCOiXQM96XfFqFpk
         bedQ==
X-Forwarded-Encrypted: i=1; AKwUvByMBQ44VjC3iQQKVlXziSMYyHkhBKyBo2Dz97D0SfkCTP8M8Y71Xvn0g1TIkByWrWVE/4g8Xo3BebSY9Ts=@vger.kernel.org
X-Gm-Message-State: AFuF++kV2kXv69rXO1bkpikw+IQA9bJxA1krvtBHBVZhwz/TNhW1bckB
	IhLVf7KJwtixusZ5eylTcUMDWI2lnmbV2Q1WxBufomrHsVYgUQ+aF6It
X-Gm-Gg: AYBFou1nRu8c0Nm0ybN462m5FRLnKSxqDUYHuc9M/VPCZYdWzo1SqWC0D/t75FUJkgT
	BU0rVLn8pP64qeB5vMuW017axVgHUxiQFX51iyhWZHrujxh2swhmps2Nq4hpOBygukaY/2JppnS
	AJibDAQGZF4AvDuVoQrQGgNLw+bNCFYRCXuzA+7WI+NT+2cBKMgWJUSoVn/SDr+Gnne52G4UH/Y
	XbrAyBbeW3n8DRlJX3Wbsd+eADepLwqx285+ORtWPikkhAUTEvccveKSq9ALCtCJiw49KqLgste
	UM64HLUYG1tbCID2tvFgR8XXHZE4xpi0wXRROc79HQ86djA4LCimM8s3jJ4XEotFw51e/k7mZAw
	FJYt76LQpZhzI9QdUqXOJSWij+hT3G8HPUYiBK1j/F4FQ+qgj+bQ9uqYx/Qpglr6tYzJTjbavjr
	Wlw68DTJsspuwgDK5PuivfpsuXuN9gIgr6uCbWMNQq2rH3ZP4zxbs3uSYOmA8MmUPp3dSzFBCwN
	z+G2Kza6weFylrjqaPgcmA2/Mv8Li++lA==
X-Received: by 2002:a17:903:2301:b0:2d6:fd55:3a9d with SMTP id d9443c01a7336-2db8d8179b5mr148221695ad.3.1789033287530;
        Thu, 10 Sep 2026 02:41:27 -0700 (PDT)
Received: from niharika-QEMU-Virtual-Machine ([223.181.118.171])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3397d6d1becsm13201260eec.22.2026.09.10.02.41.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 02:41:26 -0700 (PDT)
Date: Thu, 10 Sep 2026 15:11:23 +0530
From: Niharika Khare <niharikakhare2101@gmail.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: sakari.ailus@linux.intel.com, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com
Subject: Re: [PATCH] media: mc: Remove spurious WARN_ON in
 __media_pipeline_start
Message-ID: <aqJ7QxGa9s70LXwp@niharika-QEMU-Virtual-Machine>
References: <20260821165833.10042-1-niharikakhare2101@gmail.com>
 <20260821193326.GI59206@killaraus.ideasonboard.com>
 <aokkTcorNSJOnJFj@niharika-QEMU-Virtual-Machine>
 <apU5O6ahkYlvioju@niharika-QEMU-Virtual-Machine>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <apU5O6ahkYlvioju@niharika-QEMU-Virtual-Machine>

On Mon, Aug 31, 2026 at 01:50:22PM +0530, Niharika Khare wrote:
> On Sat, Aug 22, 2026 at 09:53:46AM +0530, Niharika Khare wrote:
> > On Fri, Aug 21, 2026 at 09:33:26PM +0200, Laurent Pinchart wrote:
> > > On Fri, Aug 21, 2026 at 10:28:07PM +0530, Niharika Khare wrote:
> > > > Vimc driver's entity topology has three capture nodes and two of
> > > > those (Raw Capture 0 and RGB/YUV Capture) are reachable from each
> > > > other via enabled links. The crash report and the C repro show that
> > > > the two capture nodes attempt to invoke a STREAMON session one after
> > > > the other, which resulted in the WARNING getting triggered by the
> > > > media controller.
> > > > 
> > > >   vimc link validate: Sensor A:src:640x480 (0x42474752, 0, 0, 0, 0) Raw Capture 0:snk:640x480 (0x42474752, 8, 0, 0, 0)
> > > >   vimc link validate: Scaler:src:640x480 (0x33424752, 8, 0, 0, 0) RGB/YUV Capture:snk:640x480 (0x33424752, 8, 0, 0, 0)
> > > >   origin->pipe && origin->pipe != pipe
> > > >   WARNING: drivers/media/mc/mc-entity.c:785 at __media_pipeline_start+0x1add/0x22b0, CPU#1: syz.0.17/5912
> > > > 
> > > > The graph walk originating from Raw Capture 0 (first STREAMON in C
> > > > repro on /dev/video0) reaches RGB/YUV Capture and marks its origin
> > > > pad's pipe with its own pipe. When RGB/YUV Capture's graph walk starts
> > > > (second STREAMON in C repro on /dev/video4), the pad is already
> > > > claimed. This is a legitimate userspace request but not something that
> > > 
> > > No, that's not supposed to be a legitimate use case. The WARN_ON
> > > indicates a driver bug.
> > 
> > Thanks for the direction Laurent, I'll look into vimc's architecture to
> > check on how the two capture nodes ended up starting the pipeline back
> > to back.
> 
> Hi Laurent,
> 
> The WARN reproduces without the syzkaller reproducer by configuring
> formats with media-ctl, then concurrently running VIDIOC_STREAMON on
> /dev/video0 and /dev/video2. Both sit in the same connected component
> via Sensor A.
> 
> I tried checking the pad in vimc before video_device_pipeline_start()
> and returning -EBUSY, and this removes the WARN.
> 
> However, a couple of other drivers are structured differently:
> 
> 1. rkisp1 embeds a single media_pipeline in struct rkisp1_device; both
>    capture nodes pass it to video_device_pipeline_start(), serialized
>    by stream_lock. vimc embeds one per vimc_capture_device, so the
>    second STREAMON sees a different pipe pointer.
> 
> 2. imx8-isi acquires the pipeline with media_entity_pipeline(), falling
>    back to the node's own pipe, under graph_mutex.
> 
> I also tried the imx8-isi approach in vimc. Both nodes stream, but
> teardown NULL-derefs in kthread_stop() as the core refcounts one
> pipeline while vimc keeps a kthread per capture node.
> 
> Before working on the teardown: should vimc share a pipeline across a
> connected component like these drivers, or refuse the second STREAMON?
> 
> Regards,
> 
> Niharika

Adding the vimc maintainers as well, since the open question is about
vimc's design rather than the core.

Short restatement: should vimc share a single media_pipeline across a
connected component (as rkisp1 does at rkisp1-capture.c:1152), or
refuse the second STREAMON with -EBUSY?

Details and the rkisp1/imx8-isi comparison are upstream in this thread.
  

Best Regards,

Niharika Khare
