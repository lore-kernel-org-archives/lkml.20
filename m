Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A65DD4B4051;
	Mon, 28 Sep 2026 11:49:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790596146; cv=none; b=B7Q3oSNbSWM/LQZYFL+TMOIakNFtu4EednGDjN475jZJWay55u7quhnsN93lnQGvDc1J7gulWulGTM8/jSClz0U6Wy8tgul7Jtc482n+jNfJy2OA/UPsVygLizWmwQ4B7flT6L5Nfk66QV5p4jd9ATegQoJaDASvjsYy+KC49Y8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790596146; c=relaxed/simple;
	bh=q6PoaKN9iIEau/KmRPHWF51XnmHHGgWe/7tgT8DwTrY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UMPXmjf/5XjF2yDMPqOyajOKTVM0SuqVVUPjKxlSPH3MAt5qXx9nYgvrq/VuSGo81wpQIYODthmGQ6uysTiRRtTa6g2DSUx8hOpYWfOTJ8G55IySsdM05sfGnJdlT7roYQIiiphrX+hzDQrdnVsBFZgY1DyjDh4lJcm/o9Mybzg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=jfQcEwF9; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="jfQcEwF9"
Received: from killaraus.ideasonboard.com (2001-14ba-70f3-e800--a06.rev.dnainternet.fi [IPv6:2001:14ba:70f3:e800::a06])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 198D9B07;
	Mon, 28 Sep 2026 13:47:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1790596032;
	bh=q6PoaKN9iIEau/KmRPHWF51XnmHHGgWe/7tgT8DwTrY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jfQcEwF9OMkqUc8jl7A4WzuJ6FX2m0CKE/F67+V1gLWzvyGl4Z0hv6dcP1AYcW5Qv
	 elNfY3Od2uuA611rECdOmhxzkw13E5LeBAOQ3nI9EEjSlNbv+f3h4wB75wySt0QVuu
	 sWACo92byoTwpg7fG8QPaUFJyF572E9Pc7EoZwuE=
Date: Mon, 28 Sep 2026 14:49:00 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Hans de Goede <hansg@kernel.org>
Cc: Michael Jordan <jordan.mymail@gmail.com>,
	Ricardo Ribalda <ribalda@chromium.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/3] media: uvcvideo: live pan/tilt/zoom readback on
 the OBSBOT Tiny 2
Message-ID: <20260928114900.GC157191@killaraus.ideasonboard.com>
References: <20260902002553.34839-1-jordan.mymail@gmail.com>
 <f8134f74-9f32-4c98-96b3-ceeb978abb11@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <f8134f74-9f32-4c98-96b3-ceeb978abb11@kernel.org>

On Mon, Sep 28, 2026 at 01:01:11PM +0200, Hans de Goede wrote:
> Hi All,
> 
> On 2-Sep-26 02:25, Michael Jordan wrote:
> > The OBSBOT Tiny 2's GET_INFO strips the AUTOUPDATE bit from its pan,
> > tilt and zoom controls, so uvcvideo caches them and userspace can never
> > observe the actuator's live state. This series reports AUTO_UPDATE
> > controls as volatile to userspace, generalises the existing XU flags
> > fixup table to all controls, and adds entries for the three affected
> > controls on this camera.
> > 
> > Changes in v2 (following Ricardo's review of v1 [1]):
> > 
> > - Patch 1: unchanged; picked up Ricardo's Reviewed-by.
> > - Patch 2: uvc_ctrl_fixup_flags() now returns bool and runs at the
> >   start of uvc_ctrl_get_flags(), before the allocation, skipping the
> >   GET_INFO query entirely for controls the table covers (Ricardo).
> > - Patch 3: as asked, I checked whether the camera's other
> >   AUTO_UPDATE-flagged controls suffer the same bug. Two more do:
> >   CT_PANTILT_RELATIVE and CT_ZOOM_ABSOLUTE, both verified on hardware
> >   to change autonomously and report live values on GET_CUR; entries
> >   added for both. Exposure, white balance and focus turned out to be
> >   write-only on this firmware (their autos work, but GET_CUR echoes the
> >   last SET_CUR), so they gain nothing from AUTO_UPDATE and were left
> >   alone; details in the commit message. The commit message also no
> >   longer claims the capability byte is the same for every control --
> >   probing every control showed it is computed per control, just wrong
> >   for the PTZ ones. Dropped Ricardo's Reviewed-by since the patch
> >   changed materially.
> > 
> > The full lsusb -v output was posted in reply to v1's patch 3, in the
> > thread at [1].
> > 
> > [1] https://lore.kernel.org/linux-media/20260828152557.653475-1-jordan.mymail@gmail.com/
> 
> Michael, thank you for the patch. Patches 1/2 look good to me:
> 
> Reviewed-by: Hans de Goede <johannes.goede@oss.qualcomm.com>
> 
> Ricardo (and Michael, I wonder, in the light of Michael already having
> found a second camera with the same issue and also in the light of your
> "media: uvcvideo: Automatically handle invalid uvc_versions" series
> if it would not be better to try to fix this up automatically instead
> of relying on device quirks?
> 
> Specifically the UVC_CTRL_FLAG_AUTO_UPDATE flag is already there
> in the default flags for these controls (and a bunch of others)
> in uvc_ctrls[].

The UVC_CTRL_FLAG_AUTO_UPDATE flag in uvc_ctrls indicates which control
*may* be auto-update controls. In many devices, lots of those will not
be auto-update controls. For instance, UVC_PU_HUE_CONTROL may only
auto-update when auto-hue is enabled. Devices that implement manual hue
only will not update this control.

We use the flags in uvc_ctrls as a fallback if getting control info from
the device fails (in uvc_ctrl_get_flags()). I think that's the right
thing to do.

> I wonder if we should simply always honor UVC_CTRL_FLAG_AUTO_UPDATE
> from uvc_ctrls[] even when we do get a valid GET_INFO request and
> simply or in the UVC_CTRL_FLAG_AUTO_UPDATE from uvc_ctrls[] if it
> is there?
> 
> That avoids needing to adding more and more quirks for this.
> 
> Regards,
> 
> Hans
> 
> > Michael Jordan (3):
> >   media: uvcvideo: report AUTO_UPDATE controls as volatile
> >   media: uvcvideo: generalise the XU flags fixup to all controls
> >   media: uvcvideo: fix up missing AUTO_UPDATE on the OBSBOT Tiny 2
> > 
> >  drivers/media/usb/uvc/uvc_ctrl.c | 122 ++++++++++++++++++++-----------
> >  1 file changed, 81 insertions(+), 41 deletions(-)

-- 
Regards,

Laurent Pinchart
