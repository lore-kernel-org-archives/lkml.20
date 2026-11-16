Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794839244;
	b=ffr4VM/pJkKpRkAe9AHfwyjf/q6bnsFmkYX30UlOdc5N3MXqrwnHjWIroI8IBwCLcmCp
	 6mPn2o70yjW5Dv7Mj2r6MZ819C47o+Xr25brqXGP96+l2MK7RITFwpr0eWnB9Cfh6QWWs
	 v5307ifiK4/3/FgxrfVbqLt+1ozdomozhs8kfPT2/wDtZGFMPAJv+7NPXePWg81ytLKsv
	 iAZ6SRwWT8qXWHFKcnXv9vtsiD6jPHUs57I2APtoIHIlYhxLxrbEvg1MA+IRZBozhqfzO
	 9yQACsrNtVdGcE5U8rG7U6VFVfZWMjsdbotAgEYTnB4wja6VlaGegeaIGH+kwlg5GvQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794839244;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:X-Forwarded-Encrypted:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=yZqYyYz6dpLdL8GHBDQVwB9zUDWf7FNjz92hLeD5y5Q=;
	b=rBiCSxI6JeiVlSKhns5AE9gx7U0FR1UXqQF/BPG2BTNePUbeX6g/bF2kiqYvUWiFmRWE
	 lryqLXge4+sRH3C7ujUZh16gIARuvFiksHdjORfKASQMLT4p+VR6epBkbd5ju5lePkJIW
	 zbSWgAjNhRW78MmXwxChOcK/2WSNl58BmFnEE9U80FHkNQvrxHexowhXQyERF57A0Aktb
	 Cq7c13ZVnKwzs51haczxqen1oNvUfzt5rMfyVMpknPJBFPrfsXoc10NSrl5YxrIFuNg6/
	 LDI/kKJG0OUydY4b1MDLGok7tznpMEo4QPRQPLB2nZ2XZpW26AOhbt2nz6Ahq+TB1Rw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=T50zmCMu;
	arc=none smtp.remote-ip=209.85.216.44
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03FCE606A323
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 14:27:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 03FCE606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=T50zmCMu
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-3ac91ac8924so1863089a91.1
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 06:27:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1794839243; x=1795444043; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yZqYyYz6dpLdL8GHBDQVwB9zUDWf7FNjz92hLeD5y5Q=;
        b=T50zmCMutFQMf12qCJ9uwW4p4HoqLyAg9G0VLLlY1VlWSlAQ7o3XoEosx/OmNOPYRz
         iaBbkJwXIvfIhUfmnmqFuuLLloBcgk7G+eiUc9bRXRnhcHb5BrKeH/IqYh/tz0DbNa1Z
         2DmcpMMQ4p+6r3+aHH0dmuG+Yhms33ilXG6dI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794839243; x=1795444043;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=yZqYyYz6dpLdL8GHBDQVwB9zUDWf7FNjz92hLeD5y5Q=;
        b=TNBaRdSIMxiUlwtv8xmY19jJudXjm/P4eErOKwsyR2AxcdHUiojMkJAvwXqK0SleZh
         FEjBG7Frj2o2xJR42aVjRKGYLesND1O5jrft3NrdROMOdQ9avM/iX1ywynJLhWIN1FPb
         LWhsOuplVdCPlE54L5lbm0N7rIDcr0QaGIncEHAhtOOygFDY73dGrxeFIX5J1zfvZi/g
         gb9mtERwud9aLQx+wWYq2RiRnhWiANlm+dqb/oyiiS66uC+FB+M2NeNjtftykko/z9qH
         56mhwjbam2QOHiH5oJOKwKLnk+ZIwqQGlCxDKeVHZczXSrxUldJ8qCFEhsHmA+cfR5GW
         iUOA==
X-Forwarded-Encrypted: i=1; AL+hErE38CIhc4usmBKSFvK7F/Y7lQ35u0j9pJ32uEKyJ/GzjZChHc8qv68SJoIXKtwH1fMHiRTbUyuujhTeO3A=@vger.kernel.org
X-Gm-Message-State: APuU4Z9nPt+8Rbp/TSQ7QPuj/2VdTN7cd25dOOwNPG+TNivgYk3CMBEi
	AfEArBhkohiz3jKUGULLT8iP1ILZIEl+qjRkvRuCJ84CmCnazw9u4fMeoLANG6LmXl7PTFBgqVj
	WuXAYRQEW
X-Gm-Gg: AZFdTZf7YHHfPtLVh+kAIUOHirgDYY4vGDstpHhJBdFJU7s0JrWsAVQiL/TSASbDHtT
	M8q5pskokXO0h1vbJlN/oWR2boAEzhixwtkZJMObozMpGQIvIlawgpiztyb0h2ee2n1zVqaceWh
	PXVVo/k2X+6oDbi7C+BVg9UBT+7YGxqpvTqKKm1pNS5FCyZGJ/T/t6+A7moik/aemqB97MpMI1t
	f/EMkkChhmj5Fw/UqO/JJpKcVBjv6+DwjKIvTqRDcHFMZcJ4aB7ol1A31fbe4iZkq/Uk4tkH/Wc
	LctwhSVVN042DCKoSzk2xhjjopqtu7jBGTyZbxSdM2Ofg78CkZ8RSvNa+XB3q2o3CaVBRUnPeRQ
	gHwbQKXafDLlDDy2IULpZYDO0tGxMlUKJ+xYwPwi9lDgV3ZMkCGILNz+DtewCl3JIaY3BKbE7Rn
	Jqco9hzVmOQWoTEN77fWT4jxqOom1mKmx0+/hACk5O9XLZbhIa2xrg53DBdH4HPn+dmPUHPFz/X
	BbjIeSHterdXDJXntmV4NAa8G8PdjK4Xk1hLrbsQ5jAVCRNxWRHRMxZ3vPMVHA2bNSrqGk+PlSn
	x8e4ayXo7uCYlYpzbWJwZMjL1cGnH3Jod/nuxyM/h7DRFaV6LZzI5GeaVrQdkSM5VA==
X-Received: by 2002:a17:90b:184d:b0:3ac:7116:434a with SMTP id 98e67ed59e1d1-3b1b0a1f032mr9502680a91.15.1794839242999;
        Mon, 16 Nov 2026 06:27:22 -0800 (PST)
Received: from mail-dl1-f45.google.com (mail-dl1-f45.google.com. [74.125.82.45])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b197ce49d6sm22751093a91.4.2026.11.16.06.27.22
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Nov 2026 06:27:22 -0800 (PST)
Received: by mail-dl1-f45.google.com with SMTP id a92af1059eb24-15ea896ddc8so5246343c88.0
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 06:27:22 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErHsRHhehsLX5yywxOLme/T88NVfkcM7C29wYsUu2A9zrMBAjG97ScNa3yq/mvogn2DPQvc+ppDyU4+e/vY=@vger.kernel.org
X-Received: by 2002:a05:701a:844a:20b0:1b5:1a41:f3b6 with SMTP id
 a92af1059eb24-1b51a41f403mr6681578c88.4.1794839241010; Mon, 16 Nov 2026
 06:27:21 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261116-uvc-shortmeta-v1-0-487cfe42fa89@chromium.org>
 <20261116-uvc-shortmeta-v1-3-487cfe42fa89@chromium.org> <20261116140114.GC1714298@killaraus.ideasonboard.com>
In-Reply-To: <20261116140114.GC1714298@killaraus.ideasonboard.com>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 16 Nov 2026 15:27:06 +0100
X-Gmail-Original-Message-ID: <CANiDSCvitQJU+RTO0MLJgJLPK3BZVPHPcrtU_7iJygGRxKpCgA@mail.gmail.com>
X-Gm-Features: AclHuK9EY-9Q3Zcf3NUEcs1Z5UODzPpXwEEXxHoNI2jIHFloOBFHm9IQER-8PH4
Message-ID: <CANiDSCvitQJU+RTO0MLJgJLPK3BZVPHPcrtU_7iJygGRxKpCgA@mail.gmail.com>
Subject: Re: [PATCH 3/3] media: uvcvideo: Fix unaligned and OOB access
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Hans de Goede <hansg@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Guennadi Liakhovetski <guennadi.liakhovetski@intel.com>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Laurent


On Mon, 16 Nov 2026 at 15:01, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> On Mon, Nov 16, 2026 at 11:56:39AM +0000, Ricardo Ribalda wrote:
> > meta->buf and scr point to packed metadata and USB packet memory that do
> > not need to be aligned to anything. Also, scr + 4 is a 16-bit field, so
> > reading it as a u32 reads 2 bytes out of bounds.
> >
> > We use *_unaligned() in the rest of uvc_video_decode_meta(), but not in
> > the debug print.
> >
> > Fix this.
> >
> > Fixes: 088ead255245 ("media: uvcvideo: Add a metadata device node")
> > Cc: stable@vger.kernel.org
> > Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> > ---
> >  drivers/media/usb/uvc/uvc_video.c | 6 +++---
> >  1 file changed, 3 insertions(+), 3 deletions(-)
> >
> > diff --git a/drivers/media/usb/uvc/uvc_video.c b/drivers/media/usb/uvc/uvc_video.c
> > index e9be0a627033..3e3296ec5c65 100644
> > --- a/drivers/media/usb/uvc/uvc_video.c
> > +++ b/drivers/media/usb/uvc/uvc_video.c
> > @@ -1532,9 +1532,9 @@ static void uvc_video_decode_meta(struct uvc_streaming *stream,
> >               "%s(): t-sys %lluns, SOF %u, len %u, flags 0x%x, PTS %u, STC %u frame SOF %u\n",
> >               __func__, ktime_to_ns(time), meta->sof, meta->length,
> >               meta->flags,
> > -             has_pts ? *(u32 *)meta->buf : 0,
> > -             has_scr ? *(u32 *)scr : 0,
> > -             has_scr ? *(u32 *)(scr + 4) & 0x7ff : 0);
> > +             has_pts ? get_unaligned_le32(meta->buf) : 0,
> > +             has_scr ? get_unaligned_le32(scr) : 0,
> > +             has_scr ? get_unaligned_le16(scr + 4) & 0x7ff : 0);
>
> I wonder if things would look cleaner if we introduced a struct uvc_scr
> instead of fiddling with manual access to buffer offsets. What do you
> think N It would look like this:

I do not see a big point in introducing the struct: we still do the
manual offset math and get_unaligned_le*() in the callers (and meta->buf
is still unaligned), and marking an in-memory struct __packed just
makes slower for no reason. I think it would make more sense to have a
helper like uvc_video_parse_stc_sof_pts(*data, *stc, *sof, *pts) that
processes the header for clock, stats, and meta.

Comparing only SCR.STC in uvc_video_decode_meta() does look nicer
though.

Let me give it a try, and if I think that it looks nicer I will send a
v3 with it; otherwise I will send a version of your proposal with my own
added personal and funny bugs.

> --
> Regards,
>
> Laurent Pinchart



-- 
Ricardo Ribalda
