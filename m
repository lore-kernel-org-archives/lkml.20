Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6664522EE9;
	Tue, 29 Sep 2026 13:23:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790688204; cv=none; b=tA23I3fxeeLp7rEMK8lEp8KXN0VWdYplCnJnnjLpPP0FpRodbszVwswIIupJenR+A0A19+cvgtaTA9djjEfk5tgy63tggcNuc2ZDt4l6cuFprjYxpO84SMzdV7wSWCpAbcan8q6TRlxMN+t/aAOTZ6dm7lOlxhKzozt4p1dowOo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790688204; c=relaxed/simple;
	bh=NJH/Ty8hKP11++YpXLnTJJPsPzbKTq9BBXn27D/ZbSI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FjWamkoe2XYX1p2IB22K5r1COdE3bJDZnpPGpNcduB2qzTrk9wH3bzc51xx2u/BsSa4+tEiIvm/lnjVLHkAU23cCpDYefQQcQCMsEmluOnpbgAOM2FLP1M4FNZGJWatlVR0+oLvBH3kOpbWWf+sbludKVRi8Zu2mvIUlqorP8pk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=tly6v/su; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="tly6v/su"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DDC341F000FF;
	Tue, 29 Sep 2026 13:23:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1790688202;
	bh=HI4C/jiwYX/N7CjDzRld5LnyGnL1nqi8ibv/C0CS1oA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=tly6v/su15EynZHHdSsoPNT7mLwdxusdKLx+1tg4vAYxaU2MqkHBKU/mmo7CxPxWe
	 TPBrsoh8/rRVY1gepROlqaBHq5m0MgSPWxDEJVQZYy6b6nGLW6AliWpu1Nnlylg8Vu
	 R0ccA75fBmOyK+WdpIY/HBXMufUN40UbqztET66s=
Date: Tue, 29 Sep 2026 15:23:16 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Deepanshu Kartikey <kartikey406@gmail.com>
Cc: kees@kernel.org, pavel.hofman@ivitera.com, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	syzbot+e1d0e66badecc32d45eb@syzkaller.appspotmail.com
Subject: Re: [PATCH] usb: gadget: u_audio: reject srate request for
 unconfigured direction
Message-ID: <2026092951-catlike-psychic-e321@gregkh>
References: <20260821114854.12218-1-kartikey406@gmail.com>
 <CADhLXY7fD6jo+xzPPLTh28n9Rw-yhhKYb6ymcyT8iMUjri_GsQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CADhLXY7fD6jo+xzPPLTh28n9Rw-yhhKYb6ymcyT8iMUjri_GsQ@mail.gmail.com>

On Wed, Sep 23, 2026 at 09:01:22AM +0530, Deepanshu Kartikey wrote:
> On Fri, Aug 21, 2026 at 5:19 PM Deepanshu Kartikey
> <kartikey406@gmail.com> wrote:
> >
> > u_audio_get_playback_srate() unconditionally locks and reads
> > uac->p_prm.lock/srate, but g_audio_setup() only initializes
> > p_prm.lock when p_chmask is set. On a UAC2 instance configured
> > without a playback direction, this results in acquiring a
> > never spin_lock_init()'d lock when a GET_CUR sample rate
> > request targets playback, triggering a lockdep "trying to
> > register non-static key" warning.
> >
> > Reject the request with -EOPNOTSUPP when p_chmask is not set,
> > before touching prm->lock.
> >
> > Fixes: eb3a1ce6f5ed ("usb: gadget: u_audio: Add capture/playback srate getter")
> > Reported-by: syzbot+e1d0e66badecc32d45eb@syzkaller.appspotmail.com
> > Closes: http://syzkaller.appspot.com/bug?extid=e1d0e66badecc32d45eb
> > Signed-off-by: Deepanshu Kartikey <kartikey406@gmail.com>
> > ---
> >  drivers/usb/gadget/function/u_audio.c | 3 +++
> >  1 file changed, 3 insertions(+)
> >
> > diff --git a/drivers/usb/gadget/function/u_audio.c b/drivers/usb/gadget/function/u_audio.c
> > index e53f2927b539..ff811ea1e25a 100644
> > --- a/drivers/usb/gadget/function/u_audio.c
> > +++ b/drivers/usb/gadget/function/u_audio.c
> > @@ -575,6 +575,9 @@ int u_audio_get_playback_srate(struct g_audio *audio_dev, u32 *val)
> >         struct uac_rtd_params *prm;
> >         unsigned long flags;
> >
> > +       if (!audio_dev->params.p_chmask)
> > +               return -EOPNOTSUPP;
> > +
> >         prm = &uac->p_prm;
> >         spin_lock_irqsave(&prm->lock, flags);
> >         *val = prm->srate;
> > --
> > 2.43.0
> >
> 
> Gentle Reminder. Please let me know the status of this patch.

If you wish to see patches reviewed quicker, please help out and review
other submissions which will cause your patch to move to the top.

thanks,

greg k-h
