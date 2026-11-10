Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=213.167.242.64
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794299125;
	b=WJDe7sPW21exPZRBJoEDu02CuUZdlCH33ZxB/ujtA8bFQTNOFbTmzprdhrbg4LyMhDg2
	 5RVHyPZmz8gzkcssrSt/00wGLGVUoHssFCqQ0eCL9ofYB4MlvTYWt786z4bcNkVWHARua
	 9vtNMjgOdWzFFC8S1um7L9pLqTZNVen0uqKCv9YrGhsMnHjQDMstPWSJSrutyvlImd2sW
	 voqARjhgKb9rTnLY23Jk4ATOKrs+9rVvo0sCEt1O1/mGkY46J5zgyD7zSzlKghzJy2t8W
	 CmxL+EK6+yJJImWnsFo4qUw1EEHjpF95+yPcOQRgKD7F6jzZQgQfBoOmf/i+G7/p7/w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794299125;
	h=DMARC-Filter:Received:DKIM-Signature:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To;
	bh=ufmIDOh2L6uh/i4ech0rAzXFt49ugypcaTJasZ0KXIA=;
	b=oHjhLfWntZxCg49c6M+TonKx4QgdG6qlQGT4lhHJOM0WV56g+un9rfZza+mwE34Z8MAY
	 YiQA2zqHE9dLYQh/evUiXDhhJE5IBVnYn3x8u5nfJP75Z5Yq32TmAErJ+UDYOipZOAqpP
	 gbESr4884Su4/cUYUXUxu86WkJJ3er6RX09V6d61XsldgI1LsEQu4Ez0T72iDGS17pdbS
	 a4J7UsmuvLHcSPCAw/j5Z8z7KGOPj+1ileGh0i+rqOkI55eUzFfRYw3JNRcpsjT0dItnf
	 tZ5Fqqr9WW/aSnYHA5tTYhP76FSwRJyUA1PAs8jpMXCbECZb18hhSjwYJyTOEsOt51A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ideasonboard.com;
	spf=pass smtp.mailfrom=ideasonboard.com;
	dkim=pass header.d=ideasonboard.com header.i=@ideasonboard.com header.a=rsa-sha256 header.s=mail header.b=foSXU7sT;
	arc=none smtp.remote-ip=213.167.242.64
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6E0860A5BDA;
	Tue, 10 Nov 2026 08:25:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E6E0860A5BDA
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.a=rsa-sha256 header.s=mail header.b=foSXU7sT
Received: from ideasonboard.com (unknown [93.65.100.155])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id C006033D;
	Tue, 10 Nov 2026 09:23:00 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1794298980;
	bh=ufmIDOh2L6uh/i4ech0rAzXFt49ugypcaTJasZ0KXIA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=foSXU7sTr1YE6Lp1YJEFK9R/jZzWDqhTuY2amVPC2qzcxAeaeLH+ro1kRTo9AjvpX
	 wrXm3M8EYLx+6qhwcsaHkXvtuO2whpQgkRkRqRICfYKvKuFDFu0U+uqzc5GyppD6gg
	 z719R5aijWNsYkCIXZNSQa/lZ/cF+IGU24RNNpmk=
Date: Tue, 10 Nov 2026 09:25:19 +0100
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: David CARLIER <devnexen@gmail.com>
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
	dan.scally@ideasonboard.com, nayden.kanchev@arm.com, mchehab@kernel.org, 
	hverkuil+cisco@kernel.org, linusw@kernel.org, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] media: mali-c55: Require an enabled link to start a
 video node
Message-ID: <avLQuNJ_KPOH7Ao8@zed>
References: <20261105231626.7152-1-devnexen@gmail.com>
 <avHo8IXKwjsWNzO3@zed>
 <CA+XhMqyKNd2maRXmmpL=aOMB-z4X3JgCD5ofiHpMubtFHuS_0g@mail.gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CA+XhMqyKNd2maRXmmpL=aOMB-z4X3JgCD5ofiHpMubtFHuS_0g@mail.gmail.com>

Hi David

please don't cut out context from replies, especially if they're not
super long.

On Mon, Nov 09, 2026 at 07:57:31PM +0000, David CARLIER wrote:
> Hi Jacopo,
>
> On Mon, Nov 09, 2026 at 04:52:50PM +0100, Jacopo Mondi wrote:
> > Can you elaborate on how this could happen ?
> >
> > How can streaming start if you VIDIOC_STREAMON() on a capture device
> > without an enabled link to the resizer subdev ?
>
> video_device_pipeline_alloc_start() only walks enabled links, so with
> the link disabled the pipeline is the video node pad alone. Nothing in
> it fails validation, as the only -ENOLINK check in
> __media_pipeline_start() is for MUST_CONNECT pads. start_streaming()
> then enables cap_dev->rsz directly rather than through the graph.

What does it mean "rather than through the graph" ?
enable_streams() is propagated by drivers along the pipeline by design

> So with the ds link disabled: STREAMON ds, then fr, params and stats
> (the last one starts the ISP), then STREAMOFF ds.
> mali_c55_pipeline_ready() skips ds and returns true, so the ISP is
> stopped under fr.

so a STREAMOFF on a disconnected capture node could potentially stop
the other. Feels like mali_c55_pipeline_ready() is not the right
function to use, but if we mandate that a capture node has to be
connected if STREAMON is called on it, then we're safe ?

>
> > Why not the resizer ?
>
> The ISP to resizer links are immutable and enabled, so the sink pads
> are always connected. Flagging the resizer source pad would break the
> valid case instead: starting fr walks through the ISP into resizer ds

Is this a typo ? From FR we can't go to the DS resizer.

> and its source pad via the internal route, so fr only capture with ds
> disabled would fail with -ENOLINK. The video node pad is where the walk
> starts and what pipeline_ready() checks, so the flag goes there.

Anyway, yes, there is a single link between the resizer's source pad
and the capture device, if the SINK pad of the capture device is
marked as MUST_CONNECT then the link between the two is enabled.

>
> Cheers.
