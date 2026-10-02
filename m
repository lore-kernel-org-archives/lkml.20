Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94D4C441638;
	Fri,  2 Oct 2026 08:14:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790928892; cv=none; b=XVrn6qe+yGIybIPqzCqWDZzqZYEqXySJNKTcS7dXIfBn4kauXNEVyDA8sO3teJDFVhLYtIxVUPKYj7Mc43L61saNa1wBUFKLjz/GQCGE5QF1NP+HZMLibPam0Vccb6T15yJrAp50899Lwk1URtfym85DDx6rPvoh+zm0K9dsa30=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790928892; c=relaxed/simple;
	bh=erYGbIRrWtJb1+j02O81IVszObniECReenwS2ZoONiY=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=lK4pnmRyzFOk4Ff+YCDIL2+TrecEpW87355qs6peQaHmbngvwgxlvSCvCKT4new0pU4oygrWnVIyPDPkeRy+1Ppnhr90v6Okn30Jvpw4t1z6pyCfnjhPEAPy5AK98Efz/LavlnvLPyvWqXmg343wGkpD3d03FeJ6AvBXpJ+z2EM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mFnZLCWL; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mFnZLCWL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B55821F000FF;
	Fri,  2 Oct 2026 08:14:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790928890;
	bh=gYpBi5Zk0dLOCEznpyY1Ixa34yUWTcPJyBAin120Seg=;
	h=Date:From:Subject:To:Cc:References:In-Reply-To;
	b=mFnZLCWLXep2um3gMRemcTugYiiALgL62QB/U1xjAn8mDOykDUgOF8GnRSU0660bt
	 7d1q7tmSc94OZZ4S9RxCbbVOA2LFyah5kqcyV7BJmfoG4cj+KF3DBRK3SodS3Nusx4
	 7Vhqwqu4BgCFu/ZNhD1MiXCC9OahvMqFYX7SuDvu/pUm6Dz8WvT4w6JyaIDJNqdyKl
	 J64WR8RDjFtg/EWK56ehfIlPnSOvJBlAB5l9xQyeut8WLYDu1B+UD8rc2g0F9cABia
	 wcTuA5y9OJXKoCq38YQEmJiLjsBpv3YgbZCLHFgEHzFHdI9QinGq/s/scCUyj5M0x9
	 y+fD2MKnc1vuA==
Message-ID: <60efdb3c-e669-403d-b2d5-fee993e16217@kernel.org>
Date: Fri, 2 Oct 2026 10:14:46 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Hans Verkuil <hverkuil+cisco@kernel.org>
Subject: Re: [PATCH v4 1/4] media: uvcvideo: report AUTO_UPDATE controls as
 volatile
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Michael Jordan <jordan.mymail@gmail.com>
Cc: Hans de Goede <hansg@kernel.org>, Ricardo Ribalda <ribalda@chromium.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org, Hans de Goede <johannes.goede@oss.qualcomm.com>
References: <20260928215021.819064-1-jordan.mymail@gmail.com>
 <20260928215021.819064-2-jordan.mymail@gmail.com>
 <20260929123422.GA349401@killaraus.ideasonboard.com>
Content-Language: en-US, nl
In-Reply-To: <20260929123422.GA349401@killaraus.ideasonboard.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 29/09/2026 14:34, Laurent Pinchart wrote:
> On Mon, Sep 28, 2026 at 05:50:18PM -0400, Michael Jordan wrote:
>> AUTO_UPDATE controls can change on their own, and the driver already
>> re-reads them from the device. Tell userspace by setting
>> V4L2_CTRL_FLAG_VOLATILE, plus EXECUTE_ON_WRITE for writable controls
>> so that writes are not ignored.
> 
> Writes are not ignored by the driver regardless of whether or not
> V4L2_CTRL_FLAG_EXECUTE_ON_WRITE is reported to userspace.
> 
>> Suggested-by: Ricardo Ribalda <ribalda@chromium.org>
>> Reviewed-by: Ricardo Ribalda <ribalda@chromium.org>
>> Reviewed-by: Hans de Goede <johannes.goede@oss.qualcomm.com>
>> Assisted-by: LLM
>> Signed-off-by: Michael Jordan <jordan.mymail@gmail.com>
>> ---
>>  drivers/media/usb/uvc/uvc_ctrl.c | 11 +++++++++++
>>  1 file changed, 11 insertions(+)
>>
>> diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
>> index 3ca108b83f1d..aceb263103e9 100644
>> --- a/drivers/media/usb/uvc/uvc_ctrl.c
>> +++ b/drivers/media/usb/uvc/uvc_ctrl.c
>> @@ -1840,6 +1840,17 @@ static int __uvc_query_v4l2_ctrl(struct uvc_video_chain *chain,
>>  	if ((ctrl->info.flags & UVC_CTRL_FLAG_GET_MAX) &&
>>  	    (ctrl->info.flags & UVC_CTRL_FLAG_GET_MIN))
>>  		v4l2_ctrl->flags |= V4L2_CTRL_FLAG_HAS_WHICH_MIN_MAX;
> 
> A blank line here would be nice.
> 
>> +	if (ctrl->info.flags & UVC_CTRL_FLAG_AUTO_UPDATE) {
>> +		v4l2_ctrl->flags |= V4L2_CTRL_FLAG_VOLATILE;
>> +		/*
>> +		 * Writes to a volatile control are documented to be ignored
>> +		 * unless EXECUTE_ON_WRITE is also reported. The driver sends
>> +		 * every write of a writable control to the device, so report
>> +		 * the flag accordingly.
>> +		 */
>> +		if (ctrl->info.flags & UVC_CTRL_FLAG_SET_CUR)
>> +			v4l2_ctrl->flags |= V4L2_CTRL_FLAG_EXECUTE_ON_WRITE;
>> +	}
> 
> The V4L2 documentation also states
> 
>   Setting a new value for a volatile control will never trigger a
>   V4L2_EVENT_CTRL_CH_VALUE event.
> 
> This patch seems to break that as we unconditionally send
> V4L2_EVENT_CTRL_CH_VALUE events on control write for controls that don't
> have UVC_CTRL_FLAG_ASYNCHRONOUS set.
> 
>>  
>>  	if (mapping->master_id)
>>  		__uvc_find_control(ctrl->entity, mapping->master_id,
> 

So this is not correct. The best place to see how this should be done in this
driver is the kernel doc comment for v4l2_ctrl_auto_cluster() in include/media/v4l2-ctrls.h.

A driver that uses the control framework can mark a set of controls as a cluster where
the first control switches between automatic and manual handling, and the other controls
are only active if manual handling is selected. If automatic handling is selected, then
the INACTIVE flag is automatically set. In addition, if the 'set_volatile' flag is true
when v4l2_ctrl_auto_cluster is called, then the VOLATILE flag is also set when automatic
handling is selected. That flag is cleared when you switch to manual mode.

So when in manual mode these are all normal, non-volatile controls. When in automatic mode,
and if set_volatile is true, then all but the first control are marked as inactive and
volatile, so reading one of those controls will call g_volatile_ctrl. Setting a volatile
control is just ignored as expected, since it is meaningless.

So don't set V4L2_CTRL_FLAG_EXECUTE_ON_WRITE, instead you have to modify the flags on
the fly whenever you switch between manual and automatic mode.

I hope this helps!

Regards,

	Hans
