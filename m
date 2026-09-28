Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E29F49D591;
	Mon, 28 Sep 2026 11:01:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790593276; cv=none; b=HwZUyc+Q++EZg2SYT9GNNCJJBAJNVJ37gWLRZV2PZEFeai/4Hm+ULsfW2PiNngnJ2lubT/8m39XbJT8xmfH0lVfgftL1+FXYjxtHVKZfXxS7JKlAOwiLxmdOdNqjWIv7rhhaZZNWvyWsFRw26I6qIO21iVAvYoPwsMMK6YiD+6A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790593276; c=relaxed/simple;
	bh=H5GJo30dYhNz75snjmBEb0ElTlWtvvb4awXplYQPNAE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oHO7zoKPRgUHdnRlfhPpRtYDEn0m3kCUCb4jcxu4NdlPg1bSjwNXMZ/2eQ2v7gQKC9btaq31a4ZlfLDKWXlmjn8JrQsT9JSD+ST5BLpazP9KIXRNmlcjiGoK9Ka1kqgPCWvVYJQmLBCiN+/j8k2Qkx+phCA8fGL3RW/wcTcMKsc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oeOkvjpU; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oeOkvjpU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D92861F000FF;
	Mon, 28 Sep 2026 11:01:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790593275;
	bh=Z1dV9FCQly0CWHqQuaTSa7O+l6RmeTF0onjzPx6pDUo=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=oeOkvjpU6728sz4DkNmIeIls8bKV/Ws+XCVHOy5FHbvZ+RwxW+gF8gqG8ecYdiPjh
	 IUjl66/weJ/BQ+Comj1vyA0bjwBJ9ER9GYVlmMRxbcwUmdlB+f8BESu/w1nilUt49t
	 Qg3v4xzeX0W03fkT3AwjD4vQKuCej2rfoHO9BP0swe0+hTeZXpEHdU1Uv4k3Zl3zDg
	 7vcaWCrSru2MznYWgqWRPu3HJCHACZ93O0t7IjIaABAciH0niMVc5K99BUKFlOWZ/d
	 gYzYbnhsus52iiGp5spQUzA6Pvn4A1i/tskOeaAeN1Ux0VLVU6rUysNUyPb7MOzeB2
	 vD7w0NbkpbU3w==
Message-ID: <f8134f74-9f32-4c98-96b3-ceeb978abb11@kernel.org>
Date: Mon, 28 Sep 2026 13:01:11 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/3] media: uvcvideo: live pan/tilt/zoom readback on
 the OBSBOT Tiny 2
To: Michael Jordan <jordan.mymail@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Ricardo Ribalda <ribalda@chromium.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
 Hans Verkuil <hverkuil+cisco@kernel.org>, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260902002553.34839-1-jordan.mymail@gmail.com>
From: Hans de Goede <hansg@kernel.org>
Content-Language: en-US, nl
In-Reply-To: <20260902002553.34839-1-jordan.mymail@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi All,

On 2-Sep-26 02:25, Michael Jordan wrote:
> The OBSBOT Tiny 2's GET_INFO strips the AUTOUPDATE bit from its pan,
> tilt and zoom controls, so uvcvideo caches them and userspace can never
> observe the actuator's live state. This series reports AUTO_UPDATE
> controls as volatile to userspace, generalises the existing XU flags
> fixup table to all controls, and adds entries for the three affected
> controls on this camera.
> 
> Changes in v2 (following Ricardo's review of v1 [1]):
> 
> - Patch 1: unchanged; picked up Ricardo's Reviewed-by.
> - Patch 2: uvc_ctrl_fixup_flags() now returns bool and runs at the
>   start of uvc_ctrl_get_flags(), before the allocation, skipping the
>   GET_INFO query entirely for controls the table covers (Ricardo).
> - Patch 3: as asked, I checked whether the camera's other
>   AUTO_UPDATE-flagged controls suffer the same bug. Two more do:
>   CT_PANTILT_RELATIVE and CT_ZOOM_ABSOLUTE, both verified on hardware
>   to change autonomously and report live values on GET_CUR; entries
>   added for both. Exposure, white balance and focus turned out to be
>   write-only on this firmware (their autos work, but GET_CUR echoes the
>   last SET_CUR), so they gain nothing from AUTO_UPDATE and were left
>   alone; details in the commit message. The commit message also no
>   longer claims the capability byte is the same for every control --
>   probing every control showed it is computed per control, just wrong
>   for the PTZ ones. Dropped Ricardo's Reviewed-by since the patch
>   changed materially.
> 
> The full lsusb -v output was posted in reply to v1's patch 3, in the
> thread at [1].
> 
> [1] https://lore.kernel.org/linux-media/20260828152557.653475-1-jordan.mymail@gmail.com/

Michael, thank you for the patch. Patches 1/2 look good to me:

Reviewed-by: Hans de Goede <johannes.goede@oss.qualcomm.com>

Ricardo (and Michael, I wonder, in the light of Michael already having
found a second camera with the same issue and also in the light of your
"media: uvcvideo: Automatically handle invalid uvc_versions" series
if it would not be better to try to fix this up automatically instead
of relying on device quirks?

Specifically the UVC_CTRL_FLAG_AUTO_UPDATE flag is already there
in the default flags for these controls (and a bunch of others)
in uvc_ctrls[].

I wonder if we should simply always honor UVC_CTRL_FLAG_AUTO_UPDATE
from uvc_ctrls[] even when we do get a valid GET_INFO request and
simply or in the UVC_CTRL_FLAG_AUTO_UPDATE from uvc_ctrls[] if it
is there?

That avoids needing to adding more and more quirks for this.

Regards,

Hans




> Michael Jordan (3):
>   media: uvcvideo: report AUTO_UPDATE controls as volatile
>   media: uvcvideo: generalise the XU flags fixup to all controls
>   media: uvcvideo: fix up missing AUTO_UPDATE on the OBSBOT Tiny 2
> 
>  drivers/media/usb/uvc/uvc_ctrl.c | 122 ++++++++++++++++++++-----------
>  1 file changed, 81 insertions(+), 41 deletions(-)
> 

