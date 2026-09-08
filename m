Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E66E381EAB;
	Tue,  8 Sep 2026 06:28:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788848932; cv=none; b=pxE4pfY2ImudEqSfU4LVFxp663LrfftwsSukU+GbQJcdlCjgcMtLQj9e/dNUue8AgoK5fgQk/dEGzFkVIR2iFJgn65sMIncol5AG0Q0RITEUl5keMuqj1+hypdydMHh0n6jEl/RTZITbt9Qr/8vdQSuYWFhBjhnrHNC5mWR1FfU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788848932; c=relaxed/simple;
	bh=LhWyxNFF5/h/QNyoCyyxMYBjcwXsgrhpPBSROaSrQZY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WdBWjYxwePWKB1Eu8w3XidiPAakrmMdtOY2fISnMkT3sSt3dZqCODQEG7tpPhNdFUibSH8oEegUuUirJ+OJ7cFky1LLVxfsob7nB3l7pPdctiu4ZLQGBd5ZMT87ML1/tR+nG6lMW7/m0MyTIttAdAgpEvKjxECQazN/7BwFEoEs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=ZyGrn1G9; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="ZyGrn1G9"
Received: from [192.168.88.20] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id D553CC24;
	Tue,  8 Sep 2026 08:27:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1788848831;
	bh=LhWyxNFF5/h/QNyoCyyxMYBjcwXsgrhpPBSROaSrQZY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=ZyGrn1G9z+JkVfsC844vkJ7jFpV4SaW2LZm2G+58+CUymvkc/BLy3zOMjxmpuShqR
	 yMjDsEu0eBl8WdVoyo0vMQ1Y5zFNzyLKpb0hJTNcBq7zQC0efu+5c4JDqxFg3w6aZx
	 Z2YFfmfTyu9+lf1s0V8u5ERYZ3o05c8dDtHZxlXE=
Message-ID: <7e3af3a6-ec41-4d82-b294-d1b9d78964c7@ideasonboard.com>
Date: Tue, 8 Sep 2026 09:28:42 +0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 00/11] media: rcar: Streams support
To: =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>, linux-media@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
References: <20260617-rcar-streams-v6-0-1260eb72dff7@ideasonboard.com>
 <20260907192520.GM3497753@ragnatech.se>
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Content-Language: en-US
In-Reply-To: <20260907192520.GM3497753@ragnatech.se>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi,

On 07/09/2026 22:25, Niklas Söderlund wrote:
> Hi Tomi,
> 
> Thanks for your work.
> 
> On 2026-06-17 14:54:53 +0300, Tomi Valkeinen wrote:
>> Add streams support to Renesas rcar platform driver.
>>
>> The series keeps compatibility with the current upstream for a single
>> stream use case. However, in upstream there's a limited custom
>> multi-stream support implemented to the rcar driver, which will be
>> replaced with the upstream's Streams API.
>>
>> I have tested this series on Sparrow-Hawk board, with a few different
>> setups:
>>
>> 1) IMX219 on the CSI0 connector (video)
>>
>> 2) Arducam FPD-Link board + 4 x IMX219 on the CSI0 connector (video)
>>    - Only two extra patches needed for testing: one to enable the V4L2
>>      Streams API, another to add .get_frame_desc() to imx219.
> 
> Out of curiosity, is the IMX219 patch posted somewhere?

I think it has been posted a few times in different forms. One of the 
later ones is "[PATCH] media: imx219: Report streams using frame 
descriptors" from me.

But I think the current direction is not to do that, but instead make 
the framework cook up the frame desc for cases where the subdev doesn't 
have .get_frame_desc (i.e. a standard single-stream video case).

>>
>> 3) IMX219 on the CSI0 connector (video + emb)
>> - A bunch of other patches applied to enable full streams support,
>>    internal pads and embedded data support in imx219 and v4l2 framework
>>   
>> 4) Arducam FPD-Link board + 4 x IMX219 on the CSI0 connector (video + emb)
>> - A bunch of other patches applied to enable full streams support,
>>    internal pads and embedded data support in imx219 and v4l2 framework
>> - Tested with video and embedded data streams from all four cameras (so
>>    8 streams in total)
>>
>> I can't properly test the error recovery, but I did trigger it manually
>> with the FPD-Link setup running, and it worked fine.
>>
>> I have observed one issue with the embedded data (i.e. a test case not
>> supported in upstream kernel): when stopping streaming, VIN says that it
>> cannot stop the stream. I haven't debugged that, but a possible issue is
>> that if the video stream for the imx219 is stopped first, the embedded
>> data stops also, and VIN does not get the frame-end it is waiting for.
>>
>> This needs further study, but I don't see it as a blocker for this
>> series as embedded data support is not in upstream.
>>
>>   Tomi
>>
>> Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
> 
> For single stream use-cases (as before this change), for the whole
> series.
> 
> Tested-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

Thanks!

  Tomi

>> ---
>> Changes in v6:
>> - Rebase on v7.1, dropping the need for any dependency patches
>> - New patch "media: rcar-vin: Fix comment related to stride handling"
>> - Add comment wrt. not allowing get_frame_desc on rcar-csi2 for gen3
>> - Fix rcar-csi2 error recovery. In the previous version it just disabled
>>    and enabled the CSI2 RX, now it also disables and enables the streams
>>    on the source device.
>> - As part of the previous change, we now track enabled_sink_streams_mask
>>    in rcar-csi2 instead of stream_count (the previous code also wasn't
>>    quite right, as it assumed enable/disable streams ops would only be
>>    called with a single stream. which is true, but was a hidden
>>    assumption).
>> - Fix issue in rcar-csi2, v4l2_subdev_state_xlate_streams() was always
>>    called with RCAR_CSI2_SOURCE_VC0, instead of the actual source_pad.
>> - Link to v5: https://lore.kernel.org/r/20260311-rcar-streams-v5-0-3e6c957d7567@ideasonboard.com
>>
>> Changes in v5:
>> - Rebase on v7.0-rc2, with the streams preparation series and
>>    get_frame_desc_passthrough series as dependencies
>> - This series is now smaller, as the non-streams parts are in the
>>    streams preparation series
>> - Fix "variable ‘format’ set but not used" warning
>> - Link to v4: https://lore.kernel.org/r/20251216-rcar-streams-v4-0-f28b4831cc67@ideasonboard.com
>>
>> Changes in v4:
>> - Rebased on v6.18, with minor conflicts resolved
>> - Improved patch descriptions
>> - Re-ordered the patches a bit to move changes that could be applied
>>    without the full streams support to the beginning of the series
>> - Added "media: rcar-vin: Link VINs on Gen3 to a single channel on each
>>    CSI-2" which removes possibility of wrong routing config on Gen3
>> - Added "media: rcar-csi2: Improve FLD_FLD_EN macros" which was part of
>>    another patch in v3
>> - Addressed minor comments (constifyings, cosmetics)
>> - Fixed the missing stream_count checks in disable_streams ops
>> - Fixed a few instances in csisp and csi2 where
>>    v4l2_subdev_state_get_format() was called with hardcoded pad/stream,
>>    instead of using the data from the route
>> - Dropped unnecessary ISPPROCMODE_DT_REG register clears
>> - Squashed "media: rcar-csi2: Add more stream support to
>>    rcsi2_calc_mbps()" into a previous patch
>> - Dropped wrong use_isp check from csi2's rcsi2_set_routing()
>> - Link to v3: https://lore.kernel.org/r/20250530-rcar-streams-v3-0-026655df7138@ideasonboard.com
>>
>> Changes in v3:
>> - Rebased on top of latest linux-media
>> - Dropped dependencies which are already in linux-media (only remaining
>>    dependency is v4l2_subdev_get_frame_desc_passthrough)
>> - Tested on white-hawk board, using the staging deser TPG
>> - Also tested in a WIP branch for GMSL2 (two video streams)
>> - Link to v2: https://lore.kernel.org/r/20250326-rcar-streams-v2-0-d0d7002c641f@ideasonboard.com
>>
>> Changes in v2:
>> - Rebased on top of latest upstream, and updated the dependencies to
>>    match the latest serieses sent.
>> - Add new patch "media: rcar-csi2: Use the pad version of v4l2_get_link_freq()"
>> - Drop "media: rcar-csi2: Fix typo" (it was not a typo)
>> - Update the code in calc_mbps(). The previous method relied on
>>    V4L2_CID_LINK_FREQ, but that's not available if the link-freq is
>>    provided via get_mbus_config().
>> - Dropped dependencies to Niklas' old series which doesn't apply
>>    cleanly. It's needed for multi-stream, but not for the current
>>    upstream which only has a single stream use case.
>> - Link to v1: https://lore.kernel.org/r/20250219-rcar-streams-v1-0-f1b93e370aab@ideasonboard.com
>>
>> ---
>> Tomi Valkeinen (11):
>>        media: rcar-vin: Fix comment related to stride handling
>>        media: rcar-vin: Link VINs on Gen3 to a single channel on each CSI-2
>>        media: rcar-isp: Move {enable|disable}_streams() calls
>>        media: rcar-csi2: Move {enable|disable}_streams() calls
>>        media: rcar-csi2: Switch to Streams API
>>        media: rcar-isp: Switch to Streams API
>>        media: rcar-csi2: Add .get_frame_desc op
>>        media: rcar-isp: Call get_frame_desc to find out VC & DT
>>        media: rcar-csi2: Call get_frame_desc to find out VC & DT (Gen3)
>>        media: rcar-csi2: Add full streams support
>>        media: rcar-isp: Add full streams support
>>
>>   drivers/media/platform/renesas/rcar-csi2.c         | 373 ++++++++++++++++-----
>>   drivers/media/platform/renesas/rcar-isp/csisp.c    | 227 ++++++++++---
>>   .../media/platform/renesas/rcar-vin/rcar-core.c    |  27 +-
>>   drivers/media/platform/renesas/rcar-vin/rcar-dma.c |   2 +-
>>   4 files changed, 487 insertions(+), 142 deletions(-)
>> ---
>> base-commit: 8cd9520d35a6c38db6567e97dd93b1f11f185dc6
>> change-id: 20250219-rcar-streams-1fdea8860e5e
>>
>> Best regards,
>> --
>> Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
>>
> 

