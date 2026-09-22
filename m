Received: from mail-qk2-f42.google.com (mail-qk2-f42.google.com [74.125.230.234])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00F1D3B14CE
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 20:13:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.230.234
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790108030; cv=pass; b=p8fLRoL7At0g4v36AcaqZ+CbjkiV0YikdlPpSvX3ROeM6Y1d6LXsehOcCjSsCabnCz7j39AzESyXdiJ2k1FLrKrbD2LhSWu70+mAzX5njlqi6H0O0vmPAYbIZosxUGmX60pxFeV938Vt1g/sNIX2R4Txw2xkqi2O/WsP78DO8NU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790108030; c=relaxed/simple;
	bh=1UA9a1hfBrb0xbFFf8Sc7ugr9w51WvMuM9aXktICUvE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dyNKBG3jU5gX5GIt9PGcnttnyibBOLEsBp5PazvJV0MDeICwy5yXekCABhipQ08Woo5JPyyPpkxZwO2qjMWvQi/u9h6r3g9NjlsC7JOtFuCiWwg1pgPy5q5I02oy07lqbqQYu6B2Ebrqlj4sefAGcgRtvPoG/IpS7qgGJIHbNJo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Qxn5g8Xm; arc=pass smtp.client-ip=74.125.230.234
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Qxn5g8Xm"
Received: by mail-qk2-f42.google.com with SMTP id af79cd13be357-93bef17c191so23872185a.2
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 13:13:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790108001; cv=none;
        d=google.com; s=arc-20260327;
        b=SaTxIkPaSXxdixwbn5HYgRYHV6kPd7gP85bofZLgxP9aEL9ERBLZEZQBr04rzLTASs
         ff0OvtDtmHLF5yePONXDjiF4KynBZAIhOlJxmJjOt9mVpVtgEGe+tFbuclsN7n3HnA2h
         id4qgTfYFCBc6rGHV+xQ2Kt2BPfABl9Zbe9D9PbGCERRNEV3JGoQoSZ6sFMRpAeY/3Ic
         tLMx+eAaX7LjLDPbiB87px+OYUYXJJhL63EXsdXTTJKYgA/Pb3C7U9OcuXj1spdIs1ZN
         /0y9P4TX0XA/njrQlJ/SF/iSH7esYESZwHpkOGXN1wfLjV+EVmqPvEd/W/s1Nwc0kJTO
         KDgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=k8LLV/hFwxGdE2PSJD1a575Lox+2W1a0UsvegnWw/g0=;
        fh=zYacFNw8VYWg3GiU9utvM7wkh6BkR6k8ztEAXMiaIuw=;
        b=Os2JbQp1qs7uzOKfPQpEPPA2xRgfnfA68YTOzuIHxwP8e8nEoQi2qo4S/tSMI8vawx
         e/GA6fhfDdSZUlKnK66MXme3kbEJMfskvUaksRLB2wi0WstY/dq33fCKZH3s71dAprcy
         EUN/dOw4L79eYxU2pqYmln+RcSXxiIjXXjFHR+ClLwpZOPqNwLusIaIPCa1XvoXeMVHz
         GPrIu5e7z8ikioJHJWAj81xX6UEseaCXqu9iXAY5nArcmLdDeO3rOLpwPrIxRvG1I+t/
         PX9jeQceJTG1eb/8xJr4FooLU8lN+501YAmgoEdzT9+Dt6GIPgbTKAuTN615in4KyyJG
         lI4g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790108001; x=1790712801; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=k8LLV/hFwxGdE2PSJD1a575Lox+2W1a0UsvegnWw/g0=;
        b=Qxn5g8XmZrvgB1FAjCZ5uDIKR8QCELWNU/tS6bIyD57fSI/1bLd5zcByZhuoW2cJYE
         aXsYOXZbpCFC2hQf3ZQtaSzUreW9u6KvPYgG1oDLpsACrWhvfQezz+kNhKR5pOyHQZkT
         F5tkOiA2Vs5oIZDHuvcqrfzCnvpelklQEgfwRr9ZnR23qFpMybaz7gkxusCOVtHJWJza
         gWksqFv5v2SbaGqsde4+hLYfJjmxsg+6sVTW+goqg9J3zZThfYwYLdNHppzyn3ltS3pt
         vgjl1jWGe229sPoBoWRXktnfD65jf5ULFj4y0+zzgLhgyvyc+Qe/hrfNx5lqHeiWKy09
         JCYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790108001; x=1790712801;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=k8LLV/hFwxGdE2PSJD1a575Lox+2W1a0UsvegnWw/g0=;
        b=NpKh7OKQu2irLA9F5XR9UYUQJf61A87lWt2t6SEQIcNPtJ+CJbPlwAXqycHxJNXeXc
         fIEgxTcH8Rjw2Ty1la0VuxVbaq8g08vkC26Os87tdAvSNee8kBC1hczCl193tpqMK659
         ibcaUltGhggAlAX7nPmTRcfhod8TUaYLZxNgte61aNZfG7ZZsvH3JOFN9HU9g9kpe/O9
         VHIbj3fMFoIFJ7sanXgC/Nkf+O942e7XORrpUimnfH+gFa/FRsoyAQ/rMraytBSNlUnp
         kALt0dMqasjO1ZfFBD6ZRWircNV1VzGjqSCBTcWyOCd9TGOPs0mRNWrsPXoeTq5gxFeU
         tcqw==
X-Forwarded-Encrypted: i=1; AKwUvByr3JaljPXlrqz9hwa8AoboEqlYSGYOWgodGRKn1/TXHMJz3P3jRnSh2fqYBkO1owTP6ES4Gy6mm+0ayNM=@vger.kernel.org
X-Gm-Message-State: AFuF++mdIzgzVWnW1sQ9KEheIS2DYveUnz8pLaU1yTtLcFYig86tzPA3
	iaNRn/rhPnQKuj2bEbMF+oB4anIN/ceSpWhdOEPjX3crKcc1L9OL0wV9aUpsZU76I74FHGUmEnu
	6iOx0meyHAfUjSC9YMikGDtuEp1CXILw=
X-Gm-Gg: AYBFou1Ee08ELUlG39M1C7h+arI7WXGZuzsdz3uZ2+MNJACXrVGIS4aiJ+cSoSss/Gg
	ho7JGmieX4rSQkFSBl3+hc4pOXr7Td0uYTCwr36j4si+LDhokEvEA1/gEOB+yZCS4JFe+NwVhLl
	zVF8ez4wFTDK93kl9zElcm3w/hE+DuTo4tpfhUIJkdf19UPo8QlUq/4OJxuUD5YcHlWgFe9KWas
	m/qP1w3kSR2SLelW1QFkY2vJdVnx2OtPWf+ieWqZkleRZ461hkE5xkrsumW9ml7RrePEKObiRic
	EfWwpzFucMx3w0zBgmwU2fh2EbiClKH/XrAfmpUqnBeRjEsCjJ6W
X-Received: by 2002:a05:620a:808e:b0:93b:d7a2:dd2c with SMTP id
 af79cd13be357-93c251f05f6mr87457685a.60.1790108001557; Tue, 22 Sep 2026
 13:13:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260918234339.54105-1-raghunathpalla.0209@gmail.com> <956ce83b-ef24-56f1-d70a-f7378f55cdf8@redhat.com>
In-Reply-To: <956ce83b-ef24-56f1-d70a-f7378f55cdf8@redhat.com>
From: Raghunath Palla <raghunathpalla.0209@gmail.com>
Date: Tue, 22 Sep 2026 21:13:07 +0100
X-Gm-Features: AcwNN1VD5iYZ19XInMPbyYu2owj3fTmlHfD_4JMZ-WTtNT8yf3_9qcVRQyoqqYM
Message-ID: <CABNt8qNjztQ-TmKPtS7iY5csniFasfYGSfiJ=O+qxe7DySFWuw@mail.gmail.com>
Subject: Re: [PATCH] dm ioctl: don't let data_start run past the buffer
To: Mikulas Patocka <mpatocka@redhat.com>
Cc: Alasdair Kergon <agk@redhat.com>, Mike Snitzer <snitzer@kernel.org>, 
	Benjamin Marzinski <bmarzins@redhat.com>, Milan Broz <mbroz@redhat.com>, dm-devel@lists.linux.dev, 
	Shuah Khan <shuah@kernel.org>, Brigham Campbell <me@brighamcampbell.com>, linux-kernel@vger.kernel.org, 
	linux-kernel-mentees@lists.linux.dev, 
	syzbot+48d935cf48a4a76be346@syzkaller.appspotmail.com
Content-Type: text/plain; charset="UTF-8"

Hi Mikulas,

Thanks for applying the patch and for the cleanup. The change looks good
to me.

Thanks,
Palla Raghunath


On Mon, 21 Sept 2026 at 15:29, Mikulas Patocka <mpatocka@redhat.com> wrote:
>
>
>
> On Sat, 19 Sep 2026, Palla Raghunath wrote:
>
> > struct dm_ioctl has seven bytes of trailing padding, so the smallest
> > buffer userspace is allowed to ask for, offsetof(struct dm_ioctl, data),
> > is seven bytes shorter than sizeof(struct dm_ioctl).
> >
> > get_result_buffer() sets data_start to sizeof(struct dm_ioctl) without
> > looking at how big the buffer actually is. Ask for the minimum and
> > data_start ends up seven bytes past the end. Callers add it to
> > data_size, and ctl_ioctl() copies that much back to userspace:
> >
> >   BUG: KASAN: slab-out-of-bounds in _copy_to_user+0xad/0xd0
> >   Read of size 312 at addr ffff8880169e4c00 by task repro-dm/140
> >    ctl_ioctl+0x5e3/0xcb0
> >    dm_ctl_ioctl+0x25/0x40
> >   allocated 305-byte region [ffff8880169e4c00, ffff8880169e4d31)
> >
> > A DM_LIST_DEVICES with data_size set to 305 is enough to hit it, and the
> > seven bytes that leak are whatever sat next to the allocation.
> >
> > Clamp data_start to the buffer size.
> >
> > Reported-by: syzbot+48d935cf48a4a76be346@syzkaller.appspotmail.com
> > Closes: https://syzkaller.appspot.com/bug?extid=48d935cf48a4a76be346
> > Fixes: 76c072b48e39 ("dm ioctl: move compat code")
> > Cc: stable@vger.kernel.org
> > Signed-off-by: Palla Raghunath <raghunathpalla.0209@gmail.com>
> > ---
> >  drivers/md/dm-ioctl.c | 7 +++++++
> >  1 file changed, 7 insertions(+)
> >
> > diff --git a/drivers/md/dm-ioctl.c b/drivers/md/dm-ioctl.c
> > index a6b8e97755cd..211569dd3c54 100644
> > --- a/drivers/md/dm-ioctl.c
> > +++ b/drivers/md/dm-ioctl.c
> > @@ -656,6 +656,13 @@ static void *get_result_buffer(struct dm_ioctl *param, size_t param_size,
> >  {
> >       param->data_start = align_ptr(param + 1) - (void *) param;
> >
> > +     /*
> > +      * The buffer can be as small as offsetof(*param, data), which is
> > +      * less than sizeof(*param), so don't run off the end of it.
> > +      */
> > +     if (param->data_start > param_size)
> > +             param->data_start = param_size;
> > +
> >       if (param->data_start < param_size)
> >               *len = param_size - param->data_start;
> >       else
> > --
> > 2.34.1
>
> Hi
>
> I accepted the patch, but I changed it slightly, so that there is just one
> condition in get_result_buffer. The resulting function is:
>
> static void *get_result_buffer(struct dm_ioctl *param, size_t param_size,
>                                size_t *len)
> {
>         param->data_start = align_ptr(param + 1) - (void *) param;
>
>         if (param->data_start < param_size) {
>                 *len = param_size - param->data_start;
>         } else {
>                 /*
>                  * The buffer can be as small as offsetof(*param, data), which
>                  * is less than sizeof(*param), so don't run off the end of it.
>                  */
>                 *len = 0;
>                 param->data_start = param_size;
>         }
>
>         return ((void *) param) + param->data_start;
> }
>
> Mikulas
>
