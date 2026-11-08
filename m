Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=213.167.242.64
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794154450;
	b=2Dw9k8q1AUTW+Wu24ssayp/kjjbeN0RyGd3FX9+RqkTA8Jgs/TyS2e6aHKXYfJYdoW/Y
	 11up5ehc/+7J2Dgev7hEf/r2EkghdN8BkIMrfE73BZyHMwbD70lnTOM7HPLAdqwLUz8rE
	 8Csos2uMzCifGvcwEJQGmSp8c13//Gzg5icXTf4LbfmKJ4NRe6et+L74/E4vULQOGsGxQ
	 1z20D6AN39vR5Eh1faTPTqZDMSdusE3jBDUNyR8t7ZTFR9vMQk2vKcjL2A2sfn9jRxj4q
	 EG8l+E/rbFowppstvj4ZGiAnkA/PwbmzoT/CknbDrs3Ts9H/VjU8I7DQPc2inPpLurQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794154450;
	h=DMARC-Filter:Received:DKIM-Signature:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To;
	bh=4ftTgckbl1ODql5/FQANMjVzgS4tTajuIhR2VprvcVQ=;
	b=if0FzJNTaO+Y29Z0B8igPgg13dh+Qf381n29HnijqSXKIyGa4YL0au9XmAVOWCJcdzBF
	 masc030ugy8B7XIH2+SJgqV6JAkp3Qp1pTo8YNqqkZik3qv8GQ2DukL0EExRo+dUTE9oQ
	 aMxGKlhiBj2KL3Ted4355fEvy9DCcQsa3dzP48/gI3eZDk2xKE7iYq8OEFwskUXvQ6513
	 IgZdsMKvQn40x4rrQ2OJMfsTpgFao7loWuYkIV+Vv8LIJowocBYB/2bNFgEuHUJysytVt
	 dV/j7T8pb7bJOM3bgpmBBEK1pbSNomxDkj/TfOF30/OIYG0AUdNvUWWNdtLVVzkum4Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ideasonboard.com;
	spf=pass smtp.mailfrom=ideasonboard.com;
	dkim=pass header.d=ideasonboard.com header.i=@ideasonboard.com header.a=rsa-sha256 header.s=mail header.b=sQcRI8Em;
	arc=none smtp.remote-ip=213.167.242.64
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CB94606A31C;
	Sun,  8 Nov 2026 16:14:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4CB94606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.a=rsa-sha256 header.s=mail header.b=sQcRI8Em
Received: from killaraus.ideasonboard.com (2001-14ba-7086-3000--a06.rev.dnainternet.fi [IPv6:2001:14ba:7086:3000::a06])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 1EB6C33D;
	Sun,  8 Nov 2026 17:11:46 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1794154306;
	bh=0+gRNyy2p3ymBWrW9A49x9wOm9n8HgRUP5+3AYhBX/U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=sQcRI8EmpVaAQ/HUGGr1phufIikoE88EGL3XOa+MPmJZWYSEjWUHtlkwwMsuiJDPg
	 uB6M1dHOanLTMExNIwRfuTKqpuVPDzjF250zLacQS5iA0WwFhFkHaQ5Dl0snzGZBg0
	 LzrbjJTeNcVWiOdt/jpOvZA5fYIx2mYgE9YCjcAM=
Date: Sun, 8 Nov 2026 18:14:05 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: DelaySystem <DelaySystem@tubot.lat>, linux-media@vger.kernel.org,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	linux-kernel@vger.kernel.org
Subject: Re: What should bridge drivers use instead of
 __v4l2_subdev_state_alloc()?
Message-ID: <20261108161405.GB103930@killaraus.ideasonboard.com>
References: <20261108013106.1162346-1-DelaySystem@tubot.lat>
 <20261108102559.GA103930@killaraus.ideasonboard.com>
 <8a1ff8b8-93b6-4853-a108-a3d0a45ca055@ideasonboard.com>
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
In-Reply-To: <8a1ff8b8-93b6-4853-a108-a3d0a45ca055@ideasonboard.com>

On Sun, Nov 08, 2026 at 06:05:34PM +0200, Tomi Valkeinen wrote:
> On 08/11/2026 12:25, Laurent Pinchart wrote:
> > On Sat, Nov 07, 2026 at 05:31:06PM -0800, DelaySystem wrote:
> >>
> >> Hello,
> >>
> >> While working on drivers/staging/media/tegra-video I ran into the FIXME
> >> above __tegra_channel_try_format() in vi.c (added by commit 40aaab9d773b
> >> in 2022):
> >>
> >> 	/* FIXME: Drop this call, drivers are not supposed to use
> >> 	 * __v4l2_subdev_state_alloc(). */
> >>
> >> The driver needs a scratch TRY state to negotiate formats with the remote
> >> sensor subdev from video-node ioctl context, where no subdev file handle
> >> exists. I looked for the intended replacement, but:
> >>
> >> - there is no non-dunder allocator in drivers/media or include/media;
> >> - v4l2_subdev_call_state_try() is documented for legacy non-MC drivers
> >>    only, has no in-tree users, and allocates one state per call, while the
> >>    driver needs one state across enum_frame_size + set_fmt + get_crop;
> >> - the active-state APIs have the wrong semantics here, since try_fmt must
> >>    not disturb ACTIVE state;
> >> - the same FIXME is still present in mainline vsp1 and staging atomisp,
> >>    and mainline stm32-dcmi still calls the dunder directly, with (as far
> >>    as I can tell) zero conversions since the 2022 rename.
> >>
> >> So my question: is a new core helper the intended direction for the
> >> bridge-driver scratch-TRY-state case, and if so, is there any guidance
> >> on the shape it should take? Or is there an existing pattern I missed?
> >>
> >> If a new helper is the answer, I am happy to implement it and convert
> >> the in-tree users.
> > 
> > No, that's not the answer.
> 
> I think converting to MC is the answer. At least for a staging driver.

Note that usage of LLMs is not allowed in drivers/staging/

-- 
Regards,

Laurent Pinchart
