Received: from fhigh-b4-smtp.messagingengine.com (fhigh-b4-smtp.messagingengine.com [202.12.124.155])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 011FE46A5FB;
	Mon,  7 Sep 2026 19:25:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.155
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788809125; cv=none; b=TxOoD4NRZj/3nFxQKU46x2zfjsRCsrg2iJLuczco94zkQYIsGL96iADqu9oxELE0sA1VPotw3p6/3MBKoNQZ0oJx/oAIjltC57/sny+N1z/l1Yp7Ylw1URZKW9H5LVmVTJYVitvplBP5XOURb5buyXyv7irnEmlo0ah8UA2d3lw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788809125; c=relaxed/simple;
	bh=oYdlgJSDIvKBvQGNFXSfe0YeivKgTs8XbMTdISkuo4M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uPICfp4Ta3AnzU0YQnnHg8HZdPPZ/YdBRtyYep3jbi5D09hDS+nBub9uXrCZpTzDIE8kuqeWN4ADHex+L45tL6M96ydoHcfkf1Mk+EIB2AOdEqDFhORC0DdW0tO4dq+Q6/O/OUr9/8Fo/ZngbaidFFzmoTHQu1N20n66ntyrTkw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=xVb8OiM1; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=rS56Fap4; arc=none smtp.client-ip=202.12.124.155
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="xVb8OiM1";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="rS56Fap4"
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailfhigh.stl.internal (Postfix) with ESMTP id B6EA97A00F9;
	Mon,  7 Sep 2026 15:25:22 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-05.internal (MEProxy); Mon, 07 Sep 2026 15:25:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1788809122;
	 x=1788895522; bh=eAklshV4jWGamoSPHqbqpjqzf/9XrzUuJWeE1GzZwYk=; b=
	xVb8OiM1ZLXfiFNsWxHGdm+PGDxt3PaZF4LC5L3lV1o3MQUjUtr/Xin2+WfBP3My
	Q1PZ+eHW4b+8BGZvKU1Zbxi8n7iy62bjcTB4P7ixcwoGyi1JzNGRAGj+tnxvhHNB
	TXud/MS7kRn40x7Z4Oi+8jdeQYVeVyPvsSIwRtQd0+oQxe1+iLA5IZuShGmMJ+xy
	r4azYi1U+xrMbYmSGEiSCfDkgRjE2KX83oCZMdISKuBhWIOFVC3ZZ13yEyN/bIgZ
	lh0ngL06QQFkrI2piVOZhy7PBEdfKThHcIMO3QhQ2BIdYckyNfqY9hKAWZE5vMve
	DfgVkoQU1Ph01GGmnEM3Eg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1788809122; x=
	1788895522; bh=eAklshV4jWGamoSPHqbqpjqzf/9XrzUuJWeE1GzZwYk=; b=r
	S56Fap4CXD5qQBzg13uSp3SBziddrwkLErPvwbwoMFDRonaSKtLQ2ZL2VrpR1rVE
	j3dtmiLCbRBwi32xd5dumO6A0wHdT+W1M5fAGjnJs37qD5BHJKcCpLbwgyVhfQX+
	IVsj1xZ+19I/3FBP+VjarzhY4LMpNRBN/hNiV8gbWyXtXPu4mYHQNvVJ/Yo5adKf
	2OMKiwU3jz1UjJ8q9zHEmN2VRpS7byF/F9Pv7E/7hBYbMrH0pyHYziZ3fdhBSWwq
	K/7IxqdojawkzGjrsXxo1cdr+QqTzXTe9wQqk+pH5oyuutLIW8AxIXBQjw46/cSR
	1M9wSA8yFWhhehqYckPiA==
X-ME-Sender: <xms:og-faqZ3TrlTzCuejyVeoWYoGtmxUqu1u3ItBPJLORYPBaZ0G5TSxA>
    <xme:og-falkmYmktCau3tviVQuovneoQwSQmlpDSGfp2gOaq01dPBnArF3yJ1ZC1NZLpX
    -0kBZRBIiy6iaTtF7ffcD59tcQhe3AfQxK8GzU1XSZ2IHgvy11WbdY>
X-ME-Received: <xmr:og-faggMxR74a33xNPTh0Bsi0FAui7CwWI6SlI4Ydmi4cyQkFFF2cT0A32QL1P06rc2b2WNi4lloyAdI0q3plRHD0KcwUsU>
X-ME-Proxy-Cause: dmFkZTFeONICinVVsrQJbhDrKPBbN8LXcdQ8xy/e2PSoCgV8ANv5ELhOptWxgxtwhr37PN
    s5HCUBBk7qTR+jPkz71PCUoBi+3qwOFkm0MSeLZ7MrGYAxKKnmahv4xvo7aG8VWe+CjM3t
    2lgHI9v3QOAp7n9QsBv8sqqqoJ5BdpCh2cqTEZPhPhMtI/M2a355z0dJwP677oiT+9gT1F
    IJJ0oN9ZfkZk1uaEZa8fx8KrBEGn7hL+zHmgnf6z6TLXX2IJPtTzMk42fdGwTNKh8Y1w23
    /w1oDto6XHtGWtC+ZoBSnMCjpajB0ipdD+V+FINr1a0HuHlLPPZzyu6s0T+U5cEHUOUepW
    VlNaK/EuAfU3r4mGy+z9okhwaYKoX3XAXZuawEp72AEC/AuKW/MlI8RU9PaJtg8vbfNoH1
    jJhJ074Tdulb3wKKy3kce3jZz7ZBxzDf3/ZbP/3XBvGoLrPSFCg0jG3rCKeE5FOcvWPXlj
    xpciD8uZlRnsO4hOGb3/zQLZKJqwDVKR/2k2YVA3tE1BiHVn9BC8v6bEcFIOLIcsiI7VwD
    Dqwk2FXHmhNB+LxvaZVtqWZvV09Gz/gwv2/q65y9ZVuj9dWlHVKHFrXYDcG7kQN34kYWwW
    GqE2pj1zN3QSARx6UK6IEAqGxvpbtDfgcWYKHSdGIfEIi5zKUL65TVsghPFQ
X-ME-Proxy: <xmx:og-fanTVjYy0ilQwSxMhsCOF02x9t89KhjHUP00qT7AGYSqREdQnGw>
    <xmx:og-fahZeaJxlENG5SeP5edAMHfGvt7bfrXb9inOIl9HR_4cqyzY8vg>
    <xmx:og-fakSmJCQBTXJllrGPoJodQxaLP83BH2OgkY4OSz5cFRSaftmd_w>
    <xmx:og-fag_-dl9-poZ50dDDcVFKFTA3O8Tvaop_phyd8ezQYGXU2-RW7Q>
    <xmx:og-favskPTB46wR08qjgXrIDBWQQg_Y2qIw0KXtqYO5uOEPZBufOknNR>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 7 Sep 2026 15:25:21 -0400 (EDT)
Date: Mon, 7 Sep 2026 21:25:20 +0200
From: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
To: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Subject: Re: [PATCH v6 00/11] media: rcar: Streams support
Message-ID: <20260907192520.GM3497753@ragnatech.se>
References: <20260617-rcar-streams-v6-0-1260eb72dff7@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260617-rcar-streams-v6-0-1260eb72dff7@ideasonboard.com>

Hi Tomi,

Thanks for your work.

On 2026-06-17 14:54:53 +0300, Tomi Valkeinen wrote:
> Add streams support to Renesas rcar platform driver.
> 
> The series keeps compatibility with the current upstream for a single
> stream use case. However, in upstream there's a limited custom
> multi-stream support implemented to the rcar driver, which will be
> replaced with the upstream's Streams API.
> 
> I have tested this series on Sparrow-Hawk board, with a few different
> setups:
> 
> 1) IMX219 on the CSI0 connector (video)
> 
> 2) Arducam FPD-Link board + 4 x IMX219 on the CSI0 connector (video)
>   - Only two extra patches needed for testing: one to enable the V4L2
>     Streams API, another to add .get_frame_desc() to imx219.

Out of curiosity, is the IMX219 patch posted somewhere?

> 
> 3) IMX219 on the CSI0 connector (video + emb)
> - A bunch of other patches applied to enable full streams support,
>   internal pads and embedded data support in imx219 and v4l2 framework
>  
> 4) Arducam FPD-Link board + 4 x IMX219 on the CSI0 connector (video + emb)
> - A bunch of other patches applied to enable full streams support,
>   internal pads and embedded data support in imx219 and v4l2 framework
> - Tested with video and embedded data streams from all four cameras (so
>   8 streams in total)
> 
> I can't properly test the error recovery, but I did trigger it manually
> with the FPD-Link setup running, and it worked fine.
> 
> I have observed one issue with the embedded data (i.e. a test case not
> supported in upstream kernel): when stopping streaming, VIN says that it
> cannot stop the stream. I haven't debugged that, but a possible issue is
> that if the video stream for the imx219 is stopped first, the embedded
> data stops also, and VIN does not get the frame-end it is waiting for.
> 
> This needs further study, but I don't see it as a blocker for this
> series as embedded data support is not in upstream.
> 
>  Tomi
> 
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>

For single stream use-cases (as before this change), for the whole 
series.

Tested-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

> ---
> Changes in v6:
> - Rebase on v7.1, dropping the need for any dependency patches
> - New patch "media: rcar-vin: Fix comment related to stride handling"
> - Add comment wrt. not allowing get_frame_desc on rcar-csi2 for gen3
> - Fix rcar-csi2 error recovery. In the previous version it just disabled
>   and enabled the CSI2 RX, now it also disables and enables the streams
>   on the source device.
> - As part of the previous change, we now track enabled_sink_streams_mask
>   in rcar-csi2 instead of stream_count (the previous code also wasn't
>   quite right, as it assumed enable/disable streams ops would only be
>   called with a single stream. which is true, but was a hidden
>   assumption).
> - Fix issue in rcar-csi2, v4l2_subdev_state_xlate_streams() was always
>   called with RCAR_CSI2_SOURCE_VC0, instead of the actual source_pad.
> - Link to v5: https://lore.kernel.org/r/20260311-rcar-streams-v5-0-3e6c957d7567@ideasonboard.com
> 
> Changes in v5:
> - Rebase on v7.0-rc2, with the streams preparation series and
>   get_frame_desc_passthrough series as dependencies
> - This series is now smaller, as the non-streams parts are in the
>   streams preparation series
> - Fix "variable ‘format’ set but not used" warning
> - Link to v4: https://lore.kernel.org/r/20251216-rcar-streams-v4-0-f28b4831cc67@ideasonboard.com
> 
> Changes in v4:
> - Rebased on v6.18, with minor conflicts resolved
> - Improved patch descriptions
> - Re-ordered the patches a bit to move changes that could be applied
>   without the full streams support to the beginning of the series
> - Added "media: rcar-vin: Link VINs on Gen3 to a single channel on each
>   CSI-2" which removes possibility of wrong routing config on Gen3
> - Added "media: rcar-csi2: Improve FLD_FLD_EN macros" which was part of
>   another patch in v3
> - Addressed minor comments (constifyings, cosmetics)
> - Fixed the missing stream_count checks in disable_streams ops
> - Fixed a few instances in csisp and csi2 where
>   v4l2_subdev_state_get_format() was called with hardcoded pad/stream,
>   instead of using the data from the route
> - Dropped unnecessary ISPPROCMODE_DT_REG register clears
> - Squashed "media: rcar-csi2: Add more stream support to
>   rcsi2_calc_mbps()" into a previous patch
> - Dropped wrong use_isp check from csi2's rcsi2_set_routing()
> - Link to v3: https://lore.kernel.org/r/20250530-rcar-streams-v3-0-026655df7138@ideasonboard.com
> 
> Changes in v3:
> - Rebased on top of latest linux-media
> - Dropped dependencies which are already in linux-media (only remaining
>   dependency is v4l2_subdev_get_frame_desc_passthrough)
> - Tested on white-hawk board, using the staging deser TPG
> - Also tested in a WIP branch for GMSL2 (two video streams)
> - Link to v2: https://lore.kernel.org/r/20250326-rcar-streams-v2-0-d0d7002c641f@ideasonboard.com
> 
> Changes in v2:
> - Rebased on top of latest upstream, and updated the dependencies to
>   match the latest serieses sent.
> - Add new patch "media: rcar-csi2: Use the pad version of v4l2_get_link_freq()"
> - Drop "media: rcar-csi2: Fix typo" (it was not a typo)
> - Update the code in calc_mbps(). The previous method relied on
>   V4L2_CID_LINK_FREQ, but that's not available if the link-freq is
>   provided via get_mbus_config().
> - Dropped dependencies to Niklas' old series which doesn't apply
>   cleanly. It's needed for multi-stream, but not for the current
>   upstream which only has a single stream use case.
> - Link to v1: https://lore.kernel.org/r/20250219-rcar-streams-v1-0-f1b93e370aab@ideasonboard.com
> 
> ---
> Tomi Valkeinen (11):
>       media: rcar-vin: Fix comment related to stride handling
>       media: rcar-vin: Link VINs on Gen3 to a single channel on each CSI-2
>       media: rcar-isp: Move {enable|disable}_streams() calls
>       media: rcar-csi2: Move {enable|disable}_streams() calls
>       media: rcar-csi2: Switch to Streams API
>       media: rcar-isp: Switch to Streams API
>       media: rcar-csi2: Add .get_frame_desc op
>       media: rcar-isp: Call get_frame_desc to find out VC & DT
>       media: rcar-csi2: Call get_frame_desc to find out VC & DT (Gen3)
>       media: rcar-csi2: Add full streams support
>       media: rcar-isp: Add full streams support
> 
>  drivers/media/platform/renesas/rcar-csi2.c         | 373 ++++++++++++++++-----
>  drivers/media/platform/renesas/rcar-isp/csisp.c    | 227 ++++++++++---
>  .../media/platform/renesas/rcar-vin/rcar-core.c    |  27 +-
>  drivers/media/platform/renesas/rcar-vin/rcar-dma.c |   2 +-
>  4 files changed, 487 insertions(+), 142 deletions(-)
> ---
> base-commit: 8cd9520d35a6c38db6567e97dd93b1f11f185dc6
> change-id: 20250219-rcar-streams-1fdea8860e5e
> 
> Best regards,
> --  
> Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
> 

-- 
Kind Regards,
Niklas Söderlund
