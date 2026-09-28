Received: from mail-pz2-f39.google.com (mail-pz2-f39.google.com [74.125.228.39])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0146C49CF56
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 11:12:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.39
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790593975; cv=none; b=eTieHtJSVzhqT+4FxzybDy5g075AeuqhE6wza4mR6WBmI3Ix2QVfSH0kXfKEFLcphwj6k3HbBUFmUMG0rWtDr0SrSCwdNqeRGLH4CriebBfAJ1UR/fFec9n3+BLG+kuEZ0jJKcoZ63XSv8nA0kRlVJrb3QE/82KRK/mwyQ4P6Nk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790593975; c=relaxed/simple;
	bh=MdHAEneTGZd8tlu2d6KsEa2w6TC7UGnErd9wvoikag4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YY8edfsXZFrE4GdvZGp1LjrRmJOd+k0FgQt3Lz9DKtTFTR61mnF/D+zSotuKoHd6CuYog56cv1EnYABKegXT9IxnMua6iRMgdNWwOJTFum7tNAIZzH0wvemIMgL8nNcjAJ9ADFD6z9LwpeJzLedYeSkQH1gLKVZ2ASa1/pgLrpM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=lWRqcHW9; arc=none smtp.client-ip=74.125.228.39
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="lWRqcHW9"
Received: by mail-pz2-f39.google.com with SMTP id d2e1a72fcca58-880fcd3790bso783871b3a.1
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 04:12:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1790593973; x=1791198773; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fyKYaorKPcIe/TCq0Lg2CHLgQOYPty34zw50iqYXh5Y=;
        b=lWRqcHW9ZXI1J5wFekcUe4b6Xb2zThL6OIMIQVUJiN+K4oFFxLn0nUOdBngyP2/2KU
         xd2njfdYvZJEeUHlItZhyNEyB7nZwn4mFtuj+thyN1MsE6rejLbgmK1aiFFmgMuVpawf
         pG9m0dCC+7v1W2VksjrTJTlMIrze7Rrm7Muqo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790593973; x=1791198773;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=fyKYaorKPcIe/TCq0Lg2CHLgQOYPty34zw50iqYXh5Y=;
        b=sX3if/A7xCGMJ0WovfMbtQpgpkOQTEBKEqUKVvBFSff0zc6xeZjchtionKWVnw4ssT
         w52iBkPz7pXIAl1vnldxxFfjuyduikJWipnTL06RBzZZWT169H/+usSpA0R5kCTADprv
         O7PpDJ+hQ2x5fafBIpgBxa1KAUijjfCJne0lUyk6w2M2AixwLpEmd8nVNIpplfgtXGQo
         s+1y74UxqTFG/lbDhCYZRQV5ZeuzTrN7XjY53MSrE8gZYcRS/dUYhcnay96ZOqRh4T3r
         nQJtiNRf1YB29KNA8oNoqgtCBmOH3DIMZt+c4l78lKlyJHwhBqofoPvrA2OGJo+EuJHO
         5qag==
X-Forwarded-Encrypted: i=1; AKwUvBzsGgAJVH5QmPVaoVd2H+nW6rzWzMeBJDEpsxy0u4NK3YTJElx809ZQQ2Qu+TJjR3qLo9jxivAlM3HrfMM=@vger.kernel.org
X-Gm-Message-State: AFuF++k4bOxPwzqZ8hPnrx+OjVf74ODXbhqHmVhwvGOzGKbeozJEVH8Q
	TzArkQJyf+2mMb3sVeP0ul7vuTtR223ItxFTF6UDVTKjPDA7Mc3C4nyWeywV/jUtzd6CUac7kGa
	UiGw=
X-Gm-Gg: AYBFou1BQ7lQR88rCAgNl8P0oDcgA6K3xUBiD/P0/uPIYgeJP3rxpn5FXqT9yH2R1AQ
	2cRsCknVJ6pTIhRaLM1qj/AJWR0XLB9A5jCafRHioFtEKV1rR998giMDPV+behWcPa3nDQ6XIOr
	DHhVP3JOTkWIsUYs5Fm1NTzzcKOHtdnP23KVc/gnJoiUc2zPhc47OJdo7SmGz6KhE8PaSZl5n0u
	ZLa2q54jF1Er7VaSf9uC54PCH5Ff0+Qu/HoQFEp80BCttEaNy3V542z2/e+cJQEVIOcO0S1t30L
	Z2PMcOlQQEr+ElSU3rC+kOPv6K3Kh2pR4104bKGGEWlRyznwwoQLGpyO2tVFaTGTyQuuawIOoOK
	lBXrvbFa9kG0DAJSGLFdcQY196mVJfTIX0SO1CDA184Xd6UE/2QYOs1Hti6kw6iBgoZxp2RGevV
	6RhcFJ3HoSs5wGpl/iUqSqd5nVwnGv7yXj751Pbt6p0FMgZnEQGQI/ovUlP1E4oeAULE9kOza9Y
	IQhcR+8CNGZsN2n7E8swhqJI3VtNNYG+eSzSA==
X-Received: by 2002:a05:6a00:1144:b0:874:705d:f657 with SMTP id d2e1a72fcca58-87e9b3b896fmr9369559b3a.37.1790593973231;
        Mon, 28 Sep 2026 04:12:53 -0700 (PDT)
Received: from mail-dl2-f43.google.com (mail-dl2-f43.google.com. [74.125.229.171])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-87feb97e845sm3978875b3a.54.2026.09.28.04.12.51
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Sep 2026 04:12:52 -0700 (PDT)
Received: by mail-dl2-f43.google.com with SMTP id a92af1059eb24-142dd04be87so465072c88.1
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 04:12:51 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwIjpTfnG/+6GXOie6syHQyT9MMoeHSWNc/4lx8w8Lw9rA4RYoWOHtkksI0ED4z+il3fMC/E+EKW7yavuk=@vger.kernel.org
X-Received: by 2002:a05:701b:241a:b0:13e:5a50:1e17 with SMTP id
 a92af1059eb24-146cddbcfd2mr9909288c88.3.1790593970339; Mon, 28 Sep 2026
 04:12:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260902002553.34839-1-jordan.mymail@gmail.com> <f8134f74-9f32-4c98-96b3-ceeb978abb11@kernel.org>
In-Reply-To: <f8134f74-9f32-4c98-96b3-ceeb978abb11@kernel.org>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 28 Sep 2026 13:12:36 +0200
X-Gmail-Original-Message-ID: <CANiDSCtR2Du=d_e-EnFGqX4sbR70O0tZFofDNy8_XXMnOsoRRQ@mail.gmail.com>
X-Gm-Features: AclHuK-DM5OaieUx087-2iRdhdzS4pTu0geySt_FhcVzEkRT-AMZSZXWgLDyTRg
Message-ID: <CANiDSCtR2Du=d_e-EnFGqX4sbR70O0tZFofDNy8_XXMnOsoRRQ@mail.gmail.com>
Subject: Re: [PATCH v2 0/3] media: uvcvideo: live pan/tilt/zoom readback on
 the OBSBOT Tiny 2
To: Hans de Goede <hansg@kernel.org>
Cc: Michael Jordan <jordan.mymail@gmail.com>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Hans Verkuil <hverkuil+cisco@kernel.org>, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Hans

On Mon, 28 Sept 2026 at 13:01, Hans de Goede <hansg@kernel.org> wrote:
>
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
>
> I wonder if we should simply always honor UVC_CTRL_FLAG_AUTO_UPDATE
> from uvc_ctrls[] even when we do get a valid GET_INFO request and
> simply or in the UVC_CTRL_FLAG_AUTO_UPDATE from uvc_ctrls[] if it
> is there?

I would say that for now we can add quirks, and if we see a big
proliferation of them, we can implement something automatic.

My fear is that bypassing the device flags might trigger errors that
could disable the affected controls.

Since the two devices that Michael mentioned come from the same
manufacturer, I do not think they justify automatic handling just yet.
And who knows maybe OBSBOT will fix their firmware? (Yes I also
believe in Santa)


>
> That avoids needing to adding more and more quirks for this.
>
> Regards,
>
> Hans
>
>
>
>
> > Michael Jordan (3):
> >   media: uvcvideo: report AUTO_UPDATE controls as volatile
> >   media: uvcvideo: generalise the XU flags fixup to all controls
> >   media: uvcvideo: fix up missing AUTO_UPDATE on the OBSBOT Tiny 2
> >
> >  drivers/media/usb/uvc/uvc_ctrl.c | 122 ++++++++++++++++++++-----------
> >  1 file changed, 81 insertions(+), 41 deletions(-)
> >
>


-- 
Ricardo Ribalda
