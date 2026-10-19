Received: from mailout3.samsung.com (mailout3.samsung.com [203.254.224.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EA83489FB1
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 07:36:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792395401; cv=none; b=iFa750H2YKdDLzTZAacxKk+1wR+a1jIL9khBiIckOWNjMBGcw0yLDmgsP5xJWM7hIfGg51LSsWpdlw7iUWpJqdhjTAErTS7BkD6RQl6bUfPDMn7wx5aQ/kmBgA6JmaNHMp9UOfynpvemKH75UgFE1wuX/ENAACA2iseOq7WRiGs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792395401; c=relaxed/simple;
	bh=ZnhBH6xejyos4DyoGWw62BoGBRcmHEc6anlCo0N1LH0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:In-Reply-To:
	 Content-Type:References; b=kmWv4mKItrlP2powrO5C7pTk6geT9F42pO42J+iv8ePNvqR8raNOu8wl+Hh0bBPkHrKpTZygLcJ+p173rH04VGE6DukPU1GRqecpBOq7LkVl4NDipRoTUM96XWcRnqt2RTJr3oY8+UXXgF5VsZdzpiXUASXLTpeVB7OfkcMzC9s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=gSEOh5fV; arc=none smtp.client-ip=203.254.224.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="gSEOh5fV"
Received: from epcas2p2.samsung.com (unknown [182.195.41.54])
	by mailout3.samsung.com (KnoxPortal) with ESMTP id 20261019072925epoutp039048ef532eaa8ed2380e59e043890365~f3bmZjb070258002580epoutp03J
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 07:29:25 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com 20261019072925epoutp039048ef532eaa8ed2380e59e043890365~f3bmZjb070258002580epoutp03J
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1792394965;
	bh=zsA3QPvVoDO5xet0EVA3xJCoFnkSHMjMs4TsySAJyME=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=gSEOh5fVPqLM+hqHc0AY3GQFekxWEe28QqKLfrhkFqtl0qbPiXHCle2vF6tTjImAC
	 ZAy4xzWAD+PpPz+OKJiRKtGs1Cs+PxM69erXyqSPDRz1Or/2BgKTKFlhRkVIVTm0Kp
	 tvmd8lEhP9V7Q6mea0AUa9xSnVhulxYPDH2tl0s4=
Received: from epsnrtp01.localdomain (unknown [182.195.42.153]) by
	epcas2p1.samsung.com (KnoxPortal) with ESMTPS id
	20261019072925epcas2p1a0fde087bb8affcc22a720a2c4e2d4a3~f3bl56fJW2455924559epcas2p1E;
	Mon, 19 Oct 2026 07:29:25 +0000 (GMT)
Received: from epcas2p2.samsung.com (unknown [182.195.38.207]) by
	epsnrtp01.localdomain (Postfix) with ESMTP id 4j7Rxx06z4z6B9m4; Mon, 19 Oct
	2026 07:29:25 +0000 (GMT)
Received: from epsmtip2.samsung.com (unknown [182.195.34.31]) by
	epcas2p1.samsung.com (KnoxPortal) with ESMTPA id
	20261019072924epcas2p1d445e24b396d930a9f23659594f868a6~f3blAvTvc3241732417epcas2p1B;
	Mon, 19 Oct 2026 07:29:24 +0000 (GMT)
Received: from ubuntu (unknown [12.81.221.204]) by epsmtip2.samsung.com
	(KnoxPortal) with ESMTPA id
	20261019072924epsmtip2dca62f5eabde878a763363de3018f2d4~f3bk9uL1I0877308773epsmtip22;
	Mon, 19 Oct 2026 07:29:24 +0000 (GMT)
Date: Mon, 19 Oct 2026 16:25:15 +0900
From: Daehwan Jung <dh10.jung@samsung.com>
To: Avichal Rakesh <arakesh@google.com>
Cc: "open list:USB SUBSYSTEM" <linux-usb@vger.kernel.org>, open list
	<linux-kernel@vger.kernel.org>, selvarasu.g@samsung.com, Greg Kroah-Hartman
	<gregkh@linuxfoundation.org>, jchowdhary@google.com
Subject: Re: [PATCH] usb: gadget: uvc: reserve frame interval headroom for
 the zero length backlog
Message-ID: <atXF1OT2GUkSgRi+@ubuntu>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <ebf20112-a767-4eb6-a6cd-4d2f724bd19f@google.com>
X-CMS-MailID: 20261019072924epcas2p1d445e24b396d930a9f23659594f868a6
X-Msg-Generator: CA
Content-Type: multipart/mixed;
	boundary="----RPJGqzha0o.ukxohDL6eKGn_d.IhylQoay3C4kM4INy2jZlW=_1ab9b8_"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
cpgsPolicy: CPGSC10-234,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20261012034422epcas2p486b38818b542d2fff5b5fed58863ec6e
References: <CGME20261012034422epcas2p486b38818b542d2fff5b5fed58863ec6e@epcas2p4.samsung.com>
	<20261012034018.3193146-1-dh10.jung@samsung.com>
	<ebf20112-a767-4eb6-a6cd-4d2f724bd19f@google.com>

------RPJGqzha0o.ukxohDL6eKGn_d.IhylQoay3C4kM4INy2jZlW=_1ab9b8_
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Tue, Oct 13, 2026 at 02:15:36PM -0700, Avichal Rakesh wrote:
> 
> On 10/11/26 8:40 PM, Daehwan Jung wrote:
> > uvc_video_prep_requests() spreads a frame over every service interval of
> > the negotiated frame interval:
> > 
> > 	nreq = DIV_ROUND_UP(video->interval, interval_duration);
> > 
> > and uvc_buffer_prepare() then splits every buffer into exactly
> > reqs_per_frame requests - only the request size varies, never the count.
> > So transmitting one frame always occupies nreq service intervals, 100% of
> > the frame interval, with nothing left over.
> > 
> > That budget cannot be met. While no video buffer is available,
> > uvcg_video_hw_submit() deliberately keeps a backlog of zero length
> > requests queued to the endpoint:
> > 
> > 	if (list_empty(&video->req_free) ||
> > 	    (atomic_read(&video->queued) > UVCG_REQ_MAX_ZERO_COUNT)) {
> > 
> > Up to UVCG_REQ_MAX_ZERO_COUNT + 1 of them are in flight whenever the
> > encoder is late, each occupying a service interval that carries no
> > payload, and the ring is FIFO so they all drain before the next frame's
> > payload moves. The frame period is therefore reqs_per_frame plus that
> > backlog, always longer than the frame interval the host asked for. The
> > UVCG_REQ_MAX_ZERO_COUNT compensation already in this function only sizes
> > the request pool; it buys the backlog no time.
> > 
> > At 60fps over SuperSpeed with bInterval 1 the backlog is 33 of the 133
> > intervals a frame interval has - 4.125ms, a quarter of the budget. The
> > waste is a fixed count, so it hurts in inverse proportion to the frame
> > interval: 24.8% at 60fps down to 6.2% at 15fps.
> > 
> > Reserve it. Measured on a SuperSpeed gadget (isoc IN, wMaxPacketSize
> > 1024, bMaxBurst 2, bInterval 1) running the Android DeviceAsWebcam
> > service, as reported by the CTS Verifier "Camera - Webcam" test, next to
> > the rate the microframe accounting predicts:
> > 
> >    target   predicted  measured  |  predicted  measured
> >              (before)  (before)  |   (after)    (after)
> >      60        47.9       46     |    59.7        56
> >      30        26.7       26     |    30.0        28
> >      24        21.8       22     |    24.5        22
> >      15        14.1       13     |    16.0        13
> 
> We recently fixed this exact issue in Android's DeviceAsWebcam client. In
> our case, DeviceAsWebcam was only queuing a frame when the previous one was
> returned.
> 
> With the changes to uvc_video_prep_requests(), a frame stays queued for one
> frame interval, and subsequent ioctl/scheduling delays meant that the gadget
> driver had to insert empty requests between two frames bringing down the
> effective FPS.
> 
> Our fix was to maintain two queued buffers to UVC Gadget Driver ensuring
> that the UVC gadget driver has a frame ready to send immediately after one
> is complete. This prevents insertion of zero length requests between two
> consecutive frames (fixing the FPS degradation you see) and gives
> DeviceAsWebcam a little bit of breathing room for ioctl and scheduling
> delays.
> 
> It is not clear if you are working with Android or not. If not, it is well
> worth checking if you have the same issue as us instead of adding an
> arbitrary headroom here. The numbers you report are extremely similar to
> what we were seeing.
> 
> If this was motivated from Android's DeviceAsWebcam, take a look at
> https://android-review.googlesource.com/c/platform/packages/services/DeviceAsWebcam/+/4353888
> and the comments in that change.
> 
> The change itself has been abandoned but it has context on the underlying
> issue, fix, and where to find the fix until it makes its way to AOSP.
> 
> Best Regards,
> Avi
> 

Thanks for sharing it. I'm working with Android.
Let me check AOSP.

Best Regards,
Daehwan Jung

------RPJGqzha0o.ukxohDL6eKGn_d.IhylQoay3C4kM4INy2jZlW=_1ab9b8_
Content-Type: text/plain; charset="utf-8"


------RPJGqzha0o.ukxohDL6eKGn_d.IhylQoay3C4kM4INy2jZlW=_1ab9b8_--
