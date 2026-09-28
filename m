Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7D29499F12;
	Mon, 28 Sep 2026 11:14:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790594068; cv=none; b=a8kOkr+hTk5/cCWacvfAp5QfnMEqI+UtozvQG/O9wFEQGlBlCwXu22grV5a7HWUtP9F0pIuHaeusaD+KKTmNS9D9yRp/hY8t9EH8AyZNs44uwVKuEWcBjlmRQ4AjfkmxrH+wHvDxo5zkas319GRoouX52+znG4ZyDjaKNOY4pLM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790594068; c=relaxed/simple;
	bh=Nvi7yT2zERZzoVCZi/MyL1utt5grZbcQIKo8DtdS47c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CqCtyOEiRdiPln8nv5m0CqoB0W5TMS3xJ4MuTKlZTGpnclxMGTz+V1CkpkjzlKT86mgMOMU9RFCyOsztcONJcOryBe74eSm8+p+kKTw8keRMojAZ6SXcwBAg9WdJIU1ivryEbGejMs+FZeyP7zDDmAvgpSAYxEQcpL1QF7dSF8U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XqV0oqil; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XqV0oqil"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C9CA61F000FF;
	Mon, 28 Sep 2026 11:14:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790594066;
	bh=gzbpqWZcipsH+vQ9FlTGOSNDRZHbqYpdVqOFpdeXOpM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=XqV0oqilMx09LY0bCBO7vAuKxcMveDfATeWQ9VKVLp1+/Angk5jdH3ko73oYCy09w
	 nG63125Se48xPfnao3LJw9C5+YM5DZUUG2OsLMW4UG6kX4E1hQdsy49pbO9ks76mg7
	 FEIahyAUZsfU64pPYeltzmsTSaSodR5he6LqGhoqe8jlJsTn0TgvxPGfjT44QJTNn5
	 HZqMV8+iEIQnS5EDG+lg6XN74gCeVUCRyE6ajppev5KH63oMe5l2QG1c75QaLV9o1I
	 rZLdXpvYrrLk+xn00YZ3S/ibCElSedgRU9+hpcFnghFsYtiqq0drD8hido26gkmO47
	 Pg0b/HKdNLgGw==
Message-ID: <bacea756-d36f-4e01-a778-24260e0c83a5@kernel.org>
Date: Mon, 28 Sep 2026 13:14:23 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/3] media: uvcvideo: live pan/tilt/zoom readback on
 the OBSBOT Tiny 2
To: Ricardo Ribalda <ribalda@chromium.org>
Cc: Michael Jordan <jordan.mymail@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Hans Verkuil <hverkuil+cisco@kernel.org>, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260902002553.34839-1-jordan.mymail@gmail.com>
 <f8134f74-9f32-4c98-96b3-ceeb978abb11@kernel.org>
 <CANiDSCtR2Du=d_e-EnFGqX4sbR70O0tZFofDNy8_XXMnOsoRRQ@mail.gmail.com>
From: Hans de Goede <hansg@kernel.org>
Content-Language: en-US, nl
In-Reply-To: <CANiDSCtR2Du=d_e-EnFGqX4sbR70O0tZFofDNy8_XXMnOsoRRQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 28-Sep-26 13:12, Ricardo Ribalda wrote:
> Hi Hans
> 
> On Mon, 28 Sept 2026 at 13:01, Hans de Goede <hansg@kernel.org> wrote:
>>
>> Hi All,
>>
>> On 2-Sep-26 02:25, Michael Jordan wrote:
>>> The OBSBOT Tiny 2's GET_INFO strips the AUTOUPDATE bit from its pan,
>>> tilt and zoom controls, so uvcvideo caches them and userspace can never
>>> observe the actuator's live state. This series reports AUTO_UPDATE
>>> controls as volatile to userspace, generalises the existing XU flags
>>> fixup table to all controls, and adds entries for the three affected
>>> controls on this camera.
>>>
>>> Changes in v2 (following Ricardo's review of v1 [1]):
>>>
>>> - Patch 1: unchanged; picked up Ricardo's Reviewed-by.
>>> - Patch 2: uvc_ctrl_fixup_flags() now returns bool and runs at the
>>>   start of uvc_ctrl_get_flags(), before the allocation, skipping the
>>>   GET_INFO query entirely for controls the table covers (Ricardo).
>>> - Patch 3: as asked, I checked whether the camera's other
>>>   AUTO_UPDATE-flagged controls suffer the same bug. Two more do:
>>>   CT_PANTILT_RELATIVE and CT_ZOOM_ABSOLUTE, both verified on hardware
>>>   to change autonomously and report live values on GET_CUR; entries
>>>   added for both. Exposure, white balance and focus turned out to be
>>>   write-only on this firmware (their autos work, but GET_CUR echoes the
>>>   last SET_CUR), so they gain nothing from AUTO_UPDATE and were left
>>>   alone; details in the commit message. The commit message also no
>>>   longer claims the capability byte is the same for every control --
>>>   probing every control showed it is computed per control, just wrong
>>>   for the PTZ ones. Dropped Ricardo's Reviewed-by since the patch
>>>   changed materially.
>>>
>>> The full lsusb -v output was posted in reply to v1's patch 3, in the
>>> thread at [1].
>>>
>>> [1] https://lore.kernel.org/linux-media/20260828152557.653475-1-jordan.mymail@gmail.com/
>>
>> Michael, thank you for the patch. Patches 1/2 look good to me:
>>
>> Reviewed-by: Hans de Goede <johannes.goede@oss.qualcomm.com>
>>
>> Ricardo (and Michael, I wonder, in the light of Michael already having
>> found a second camera with the same issue and also in the light of your
>> "media: uvcvideo: Automatically handle invalid uvc_versions" series
>> if it would not be better to try to fix this up automatically instead
>> of relying on device quirks?
>>
>> Specifically the UVC_CTRL_FLAG_AUTO_UPDATE flag is already there
>> in the default flags for these controls (and a bunch of others)
>> in uvc_ctrls[].
>>
>> I wonder if we should simply always honor UVC_CTRL_FLAG_AUTO_UPDATE
>> from uvc_ctrls[] even when we do get a valid GET_INFO request and
>> simply or in the UVC_CTRL_FLAG_AUTO_UPDATE from uvc_ctrls[] if it
>> is there?
> 
> I would say that for now we can add quirks, and if we see a big
> proliferation of them, we can implement something automatic.
> 
> My fear is that bypassing the device flags might trigger errors that
> could disable the affected controls.
> 
> Since the two devices that Michael mentioned come from the same
> manufacturer, I do not think they justify automatic handling just yet.
> And who knows maybe OBSBOT will fix their firmware? (Yes I also
> believe in Santa)

Ok, fair enough lets go with this series as is then.

I'll go and merge these 3 patches into uvc/for-next sometime today.

Regards,

Hans


