Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F16F236D9E0
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 07:31:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787815871; cv=none; b=RftrMMEe/qlFiMe5Xj3e61Zl88hOSJU2nDJUjk22b7OD861iqlVlEdC/aCJ00RTRMaGrXcM1X2U8c6EYWK/D7M+lhGnqryFp4R90sa4Q5P/UlY3/WSbPAKNJ+A2GRsfBDCHjFmfRJKqNXJoD+pVTxVNge0LXy5SIB8sIQrgXA60=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787815871; c=relaxed/simple;
	bh=PfIIOf3/SBUFiL4ggSPb5GvlN1y9GHqRMpF2ptnXpIc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZnJ21wxx5Aw9bhC9Cjp5bUltbivmxBu4WcrIQvs8zBx5mL4YIIIGVyFTKJkpA1PVUchGCggozMY9wd/czU75OFuJSUOvm66JiYPApUvg+0XeTBLGJmxBYTF7klCD4cDh3tgFAGE0b8mXoXGd2gdhxXmnqP7RGQ3kke+el/rDrRA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=dwYDffc1; arc=none smtp.client-ip=209.85.215.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="dwYDffc1"
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-cc1c9879395so1455399a12.1
        for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 00:31:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1787815869; x=1788420669; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BVRAfpWY0FEi1i3sGThUrg+YWV/e8fwxPwV0PaJXEV0=;
        b=dwYDffc1UYDFeY3Koe71LumsB2jUBrwNVLc6itMjAA1/ZqWDEIgoWsO9+N6cZlUXfd
         oKh/De7pQYY7p32jCjTPG1kJAfyVwbYCIHR9/6rUfhZw0l4F43ztu8OOhSq8/tCgXJY5
         HbQD1BAsehdhh+3Xq6TaDJvdm9lMQIpvDCdfk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787815869; x=1788420669;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=BVRAfpWY0FEi1i3sGThUrg+YWV/e8fwxPwV0PaJXEV0=;
        b=bf8SO29M+CXmEOMfG+/UWTW63mgnWNadESi6uxcEHlmD6vrD0y/gBwE7/8iA0OIw68
         XVDrGA9V2EQcXEWsqXNMWn51T7lntI3RQTYNTsutPgeXALNWFT4DMNbMehbBvedAi5Zd
         g6q0sL8LiSOI5zwhzFt2qLnu2JdvkGoPsx1jy+2DB/e6hSGfPmko7Iz0V7xpNPzbZBqS
         OEsB9d7D7YZ2QWrkN6Jspg9mSP++j91yEdXBQJ1IpluOSOukaZ8WM+qAOflTBmo5OveE
         5k9YyasD08e7199gnlhkOHFL1mHr8m8Qw9bLz5zekMKLqxYaL0iBMGSBPe0gNNviw1Rc
         0x3g==
X-Forwarded-Encrypted: i=1; AHgh+RqRsbqUWCEAI45G0W6bGib26gO1+5fUMaefWqFBhD25S1iRlnL3gRLz24q81HrjAgXrPuR2WOQwrT13GGE=@vger.kernel.org
X-Gm-Message-State: AFuF++m9IYBmyKcOV4Qhh4e1hQ9s9lxSaiPLeq6/j69HrSUuhYsbNGgu
	xpIKQE85OC3+/kacPhp8gg1Qb/D4kQNd1lYxcCYTRVSocx0KK+StxI4jKqFDpqR+4XlmBmux8HD
	q7rpaI9VE
X-Gm-Gg: AR+sD10WYErVIrYWXRE8XflWE5r0jLfuK0Mig+7dk1TbLeQbRHwRs2cX8pd3YyzXtoG
	o8h0G1kntB771HmHVV4w++DFhkHcWXcbZ8DAb94KebW4PRsDzPLITRCMyh8FwtCDuSGN+2NmJq6
	uVUrqC04b6yNiU8ILEs4+JWBj+Z4EXGVGUn0FWDXM77u0tZjRT7kzQ3Q2+APQc68aHUmu9/lGx+
	vbTHSrzxiJw+n1fM3mMaXbyDO4jDruvY5DNvp/kTjGoKotf7I5GIQRUxDfXHduymnkrwYU3hpao
	xF/F5I9YIlb66/wv/9uZh0/Rn+x+TzT4Xd1BGREvxprO1dG5Forp8PFGh5gl9nQu6oJDcwNdrkK
	WVNf3SJ4M+p1K8Y6e/P69lAqopUgOo0I+s6NV+FOEn1WFpdFeVle9HYKGUv8m4Lp+W6mAiZo4Bu
	aBSVrJcvaltdWOIEHkfxC09MHdAbDwAPSyy2PvTDUW+zh1ke9qoDlCr4OBJuws5pI/6c9I+uTZ0
	471i79Y8xCHGIaoP/hj3W10iJ46dAgh57OJ
X-Received: by 2002:a17:90b:4c8d:b0:395:4de4:92c7 with SMTP id 98e67ed59e1d1-3966d1443a1mr27214012a91.3.1787815869004;
        Thu, 27 Aug 2026 00:31:09 -0700 (PDT)
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com. [209.85.216.51])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-396b0fd55a4sm1659192a91.7.2026.08.27.00.31.06
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Aug 2026 00:31:07 -0700 (PDT)
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-38759bcd877so2536208a91.2
        for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 00:31:06 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RqbiC+cLWc0MmKUDLWQM3JdPRCkGhmqokI6/oBmn5ZYEbfgl9st/sCzLbbI3hMvz+n+O9x/SmR6cZb+O9Q=@vger.kernel.org
X-Received: by 2002:a17:90a:dfd0:b0:38f:bbc:6a0f with SMTP id
 98e67ed59e1d1-3966d144247mr27737511a91.1.1787815865480; Thu, 27 Aug 2026
 00:31:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260725212332.64927-1-jordan.mymail@gmail.com>
 <CANiDSCsyVYanm5MowQv5-rGy1EYs080WRsZYJCT=J=SesPFnjQ@mail.gmail.com>
 <20260731151509.577383-1-jordan.mymail@gmail.com> <CANiDSCsS-JJrGMaoBqR-XX54dtp_uQEVVSct-BWL0gQNL4OfRQ@mail.gmail.com>
 <20260801050049.984234-1-jordan.mymail@gmail.com> <CAMdm4Cz-oREZfk2-_eQ16umQawWF+c9vA_AV4tBuHHvsbP0vqw@mail.gmail.com>
 <CANiDSCuNhC0-rDiBChZ02Q-PKtc=_a1ptukNUtMNMRWLUa2HeQ@mail.gmail.com> <20260821090340.3041867-1-jordan.mymail@gmail.com>
In-Reply-To: <20260821090340.3041867-1-jordan.mymail@gmail.com>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Thu, 27 Aug 2026 09:30:50 +0200
X-Gmail-Original-Message-ID: <CANiDSCvbOgth3U_3-Hqa=Pm-03UOi_9k1pQHnneQHy92g91xwA@mail.gmail.com>
X-Gm-Features: AcwNN1WJlLceSvOUz3hEhGsDkqRtrZ3r0PTLIwDh4GGQfd6sssZD7TJUVjpH1sY
Message-ID: <CANiDSCvbOgth3U_3-Hqa=Pm-03UOi_9k1pQHnneQHy92g91xwA@mail.gmail.com>
Subject: Re: [PATCH] media: uvcvideo: query pan/tilt position from the device
 on every read
To: Michael Jordan <jordan.mymail@gmail.com>
Cc: linux-media@vger.kernel.org, hverkuil+cisco@kernel.org, 
	laurent.pinchart@ideasonboard.com, hansg@kernel.org, mchehab@kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Michael

On Fri, 21 Aug 2026 at 11:03, Michael Jordan <jordan.mymail@gmail.com> wrote:
>
> Hi Ricardo,
>
> On Tue, 18 Aug 2026 13:30:57 +0200, Ricardo Ribalda <ribalda@chromium.org> wrote:
> > I believe that if AUTO_UPDATE would be properly initialized, then, the
> > values will always be fresh when you run G_CTRL o G_EXT_CTRLS from
> > userspace:
> >
> > G_EXT_CTRLS
> >  uvc_ioctl_g_ext_ctls()
> >    uvc_ctrl_rollback()
> >      uvc_ctrl_commit()
> >         uvc_ctrl_commit_entity()
> >             ctrl->loaded=0
>
> You are right, and this corrects what I wrote on 14 August. The rollback
> at the end of every G_EXT_CTRLS runs uvc_ctrl_commit_entity(), which
> clears ->loaded for an AUTO_UPDATE control at the top of the loop, before
> the dirty/rollback checks, so the following read re-queries the device. I
> had only counted the Control Change interrupt and the SET_CUR commit as
> cache-invalidation points and missed that the read path invalidates its
> own cache. So on this device, once AUTO_UPDATE is restored, polling
> G_EXT_CTRLS returns fresh data with no volatile flag involved. My claim
> that "correcting the firmware would not make the position observable" was
> wrong.
>
> > Until they reply maybe you want to:
> >   - rename uvc_ctrl_fixup_xu_info to uvc_ctrl_fixup_flags
> >   - modify uvc_ctrl_get_flags so it calls uvc_ctrl_fixup_flags
> >   - add your device information to uvc_ctrl_fixup_flags
>
> I did this and tested it on the hardware. For the record, the device's
> GET_INFO for CT_PANTILT_ABSOLUTE (entity 1, selector 0x0d) returns 0x03 --
> GET|SET, no AUTOUPDATE bit -- so uvc_ctrl_get_flags() masks off the
> UVC_CTRL_FLAG_AUTO_UPDATE that the static uvc_ctrls[] entry sets for this
> control. Calling the fixup from uvc_ctrl_get_flags() unconditionally (so it
> also runs when GET_INFO succeeds) and adding
>
>   { USB_DEVICE(0x3564, 0xfef8), 1, UVC_CT_PANTILT_ABSOLUTE_CONTROL,
>     UVC_CTRL_FLAG_SET_CUR | UVC_CTRL_FLAG_GET_RANGE |
>     UVC_CTRL_FLAG_RESTORE | UVC_CTRL_FLAG_AUTO_UPDATE }
>
> restores it. One detail worth noting: the existing fixup does
> info->flags = fixups[i].flags, a full replace rather than a masked OR, so
> a standard-control entry has to spell out the whole flag set, not just the
> missing bit.
>
> With that in place I verified on an OBSBOT Tiny 2 (3564:fef8) that polling
> G_EXT_CTRLS tracks a physical slew on both axes, including motion the host
> never commanded (moving the gimbal by hand), while a stock module returns
> the stale value indefinitely for the same reads. So your suggestion covers
> my use case, and I am going to carry the quirk rather than the volatile
> change.
>
> I have also switched my userspace to always send both axes in one
> S_EXT_CTRLS, as you suggested. Both mappings land in UVC_CTRL_DATA_CURRENT
> before the single commit, so whatever the read-modify-write loaded is fully
> overwritten and the merge source stops mattering -- the write side is a
> non-issue now regardless of the flags.
>
> Given the rollback point, the general-case argument for the volatile patch
> is weaker than I framed it: for the ioctl polling path a device with
> correct (or fixed-up) flags does not need it. The only things it still does
> that the quirk does not are to advertise V4L2_CTRL_FLAG_VOLATILE to
> userspace and to keep the write-side RMW reading from a separate buffer,
> and with always-send-both-axes I need neither. So I will not push the
> volatile patch further unless you or Hans think the userspace-visible
> VOLATILE flag is worth having on its own.
>
> If it is useful I am happy to send the fixup as a proper patch with a
> Suggested-by: you, or to leave it to you if you would rather fold it in.
> Thanks for the review and the pointer -- both were right.


Happy to hear that it works for you! A proper patchset would be
awesome. I do not think we have to wait for Hans(es) to start
reviewing it.

How does this sound?:

1) A patch to add V4L2_CTRL_FLAG_VOLATILE for all the
UVC_CTRL_FLAG_AUTO_UPDATE controls ( I think that is missing)
2) A patch to rename uvc_ctrl_fixup_xu_info to uvc_ctrl_fixup_flags
and modify uvc_ctrl_get_flags so it calls it.
3) A patch to add the quirk for your device. In the commit message,
please include the lsusb -v output of your device and mention that you
pinged the vendor to fix their firmware.

The Suggested-by tag would be great :)

Regards!


>
> Best regards,
> Michael Jordan



-- 
Ricardo Ribalda
