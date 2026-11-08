Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=213.167.242.64
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794133564;
	b=MS9fFgOfsK38PrXeGVt2XvDzoCGhWHwWy67RjojPeLIY5FI4vc2niKgXDtZxA6s7FFjM
	 JnQkYGaIX5QcJOLfuv+f5gH39xMyNGy4LtYXWaJsvOoVIBNNKV+2DM8ZvC6zeQlq0uBpS
	 FoQVOJdovHaoaMPkvTLljvyX+wxad8u5wt3x24lVVs/and/vB7BQtQ5W5m7l2nscjTm7A
	 K0iwGnIn7ED+/BYn/lP5xswY4vDXkeIB2JIgc/YqYbVq8ca7sU2OKE6ed6R7Ry9olUOI5
	 DdfkKqA2TZDSEjM3Z6zVEhjxDg/IPRDImc0VQX3V+MGf954sg8oMT9IQYzNDuXC1//w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794133564;
	h=DMARC-Filter:Received:DKIM-Signature:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To;
	bh=OZKd7UL0PMg7SZvKKrHXQKu1+Br0xSNuwmhcAnHuW3Q=;
	b=ueC8IcsA8EYSyT5osBwK6SHXGKpVc3MuaSnsyckCKZ4Wkf2Zktd+X1cOJoeenoLM+rSf
	 J0gbQAjNfNk1qmqmP59rx1D7lDrdL1GKmxJtxUybQE27rABBBPhbcCvDR12ftRIn2COxe
	 wPsAQO3sve7hEZYZV9ZGceWIgPS9rtZnfjf7j/aohJfOydiJkNDTNplLXPqpgHlzb5sXn
	 7YVRRbUbf9OXd8UyxxL4xXaGMbov4Fx6eIMCkDR8kJrpe4abC+0x9wyV6u2AMKOUyqM0s
	 daj8vB7QDmk2LIC5g/ygQVkUpGIo8gMxqsaq+qezZDB37ICnIc2xjj1rPSItW6eS69g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ideasonboard.com;
	spf=pass smtp.mailfrom=ideasonboard.com;
	dkim=pass header.d=ideasonboard.com header.i=@ideasonboard.com header.a=rsa-sha256 header.s=mail header.b=bgG1KZaR;
	arc=none smtp.remote-ip=213.167.242.64
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C71FF606A332;
	Sun,  8 Nov 2026 10:26:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C71FF606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.a=rsa-sha256 header.s=mail header.b=bgG1KZaR
Received: from killaraus.ideasonboard.com (2001-14ba-7086-3000--a06.rev.dnainternet.fi [IPv6:2001:14ba:7086:3000::a06])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 786BC82A;
	Sun,  8 Nov 2026 11:23:39 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1794133419;
	bh=NavTTZ7ZkEEOB6jJh+9OjoHvxAWHwRxZqBP52iXkHls=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bgG1KZaRHxWxcpTl/7rEJoSb4atW020FZAK2wFeryszSYNa28Iz5Z9RG2QVHBJmbT
	 NSOPAU3JbWNsFV3tvPH7FsvPbB0S9X743+3RW5tblsQWcs4Ene/Pt/Zk1FblWht5RU
	 S2EJWWv/yvphZxaiLl08R2j/PMpeVa8R4h6hjkcE=
Date: Sun, 8 Nov 2026 12:25:59 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: DelaySystem <DelaySystem@tubot.lat>
Cc: linux-media@vger.kernel.org, Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	linux-kernel@vger.kernel.org
Subject: Re: What should bridge drivers use instead of
 __v4l2_subdev_state_alloc()?
Message-ID: <20261108102559.GA103930@killaraus.ideasonboard.com>
References: <20261108013106.1162346-1-DelaySystem@tubot.lat>
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
In-Reply-To: <20261108013106.1162346-1-DelaySystem@tubot.lat>

On Sat, Nov 07, 2026 at 05:31:06PM -0800, DelaySystem wrote:
> 
> Hello,
> 
> While working on drivers/staging/media/tegra-video I ran into the FIXME
> above __tegra_channel_try_format() in vi.c (added by commit 40aaab9d773b
> in 2022):
> 
> 	/* FIXME: Drop this call, drivers are not supposed to use
> 	 * __v4l2_subdev_state_alloc(). */
> 
> The driver needs a scratch TRY state to negotiate formats with the remote
> sensor subdev from video-node ioctl context, where no subdev file handle
> exists. I looked for the intended replacement, but:
> 
> - there is no non-dunder allocator in drivers/media or include/media;
> - v4l2_subdev_call_state_try() is documented for legacy non-MC drivers
>   only, has no in-tree users, and allocates one state per call, while the
>   driver needs one state across enum_frame_size + set_fmt + get_crop;
> - the active-state APIs have the wrong semantics here, since try_fmt must
>   not disturb ACTIVE state;
> - the same FIXME is still present in mainline vsp1 and staging atomisp,
>   and mainline stm32-dcmi still calls the dunder directly, with (as far
>   as I can tell) zero conversions since the 2022 rename.
> 
> So my question: is a new core helper the intended direction for the
> bridge-driver scratch-TRY-state case, and if so, is there any guidance
> on the shape it should take? Or is there an existing pattern I missed?
> 
> If a new helper is the answer, I am happy to implement it and convert
> the in-tree users.

No, that's not the answer.

-- 
Regards,

Laurent Pinchart
