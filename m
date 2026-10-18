Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E52F11CAA6C;
	Sun, 18 Oct 2026 11:54:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792324454; cv=none; b=LpoPuvFnpdpRGHLDsFcS3QbWG59hK7UVkreJunkRXG201swkddZOFjiM+xwpGnBRlNME3mfFkRCbqLubUyNGopyT+LQQpToZhCMauV4+LIdS2lMtc5mpHx77rtpBGVFgzktmMn+9fVBKE8mfvK1kGHBLo892CE21/b3HBvCvvxo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792324454; c=relaxed/simple;
	bh=hiHhKuksdZujGA/aDcmGGj0nLd3a+1A3Hw7I3O+wd9w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kA9pSMf53gPM5z8FPoVAVB1lgc7eeYWI/hot/rjnfXygjMsrHLVcp1QCxAQpG7C48B+A6iXYopzKfrhSPQo3wvrpvn2x8KX8rt18wT0WHYWo+3PGkymoQtITvc6aM+eAe9mq4ZOWlOUDJRN7w2Oioyyn2fvCMvGnZnBqw+f2GI4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=xs7KNnRO; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="xs7KNnRO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D7C2D1F000C4;
	Sun, 18 Oct 2026 11:54:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1792324452;
	bh=U7Q6qTpNera28QrG1YQvLOrdU2TIODSUx+ob+tyFF90=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=xs7KNnROQGzTtfyp97JuJ2q7xzAUXrVD8IMgek9o9/V49wMWfas3MU9ou4g0NLmDs
	 epNyP4/lH/paFqFztuASt3JKeRf8qxQ9C2B8IW8z7Bk8QYPXv1NAq+4kQsOuz1xTl8
	 WQzlWkHVYum+M4ja0bWqqkIGBKT9pgyg3Iu7Q2aA=
Date: Sun, 18 Oct 2026 13:54:07 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Deepanshu Kartikey <kartikey406@gmail.com>
Cc: kees@kernel.org, pavel.hofman@ivitera.com, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	syzbot+e1d0e66badecc32d45eb@syzkaller.appspotmail.com
Subject: Re: [PATCH] usb: gadget: u_audio: reject srate request for
 unconfigured direction
Message-ID: <2026101828-oxidation-squishy-51e3@gregkh>
References: <20260821114854.12218-1-kartikey406@gmail.com>
 <2026092925-licorice-strode-7905@gregkh>
 <CADhLXY6t7UL9Ys65qDSBBAUzj+sQkS26xFZX3YjkFZ8ufS16wQ@mail.gmail.com>
 <CADhLXY55XwzujRCg+xgm4v4UJmfdgUQ0oihS39f3iMwFDzXTRw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CADhLXY55XwzujRCg+xgm4v4UJmfdgUQ0oihS39f3iMwFDzXTRw@mail.gmail.com>

On Sun, Oct 18, 2026 at 04:28:49PM +0530, Deepanshu Kartikey wrote:
> On Wed, Sep 30, 2026 at 1:48 PM Deepanshu Kartikey
> <kartikey406@gmail.com> wrote:
> >
> > On Tue, Sep 29, 2026 at 6:53 PM Greg KH <gregkh@linuxfoundation.org> wrote:
> > >
> > > On Fri, Aug 21, 2026 at 05:18:54PM +0530, Deepanshu Kartikey wrote:
> > > > u_audio_get_playback_srate() unconditionally locks and reads
> > > > uac->p_prm.lock/srate, but g_audio_setup() only initializes
> > > > p_prm.lock when p_chmask is set. On a UAC2 instance configured
> > > > without a playback direction, this results in acquiring a
> > > > never spin_lock_init()'d lock when a GET_CUR sample rate
> > > > request targets playback, triggering a lockdep "trying to
> > > > register non-static key" warning.
> > > >
> > > > Reject the request with -EOPNOTSUPP when p_chmask is not set,
> > > > before touching prm->lock.
> > > >
> > > > Fixes: eb3a1ce6f5ed ("usb: gadget: u_audio: Add capture/playback srate getter")
> > > > Reported-by: syzbot+e1d0e66badecc32d45eb@syzkaller.appspotmail.com
> > > > Closes: http://syzkaller.appspot.com/bug?extid=e1d0e66badecc32d45eb
> > > > Signed-off-by: Deepanshu Kartikey <kartikey406@gmail.com>
> > > > ---
> > >
> > > How was this tested?
> >
> > I have not been able to test this since there is no
> > repro present in syzbot.
> >
> > I verified the fix by static analysis of the call path in the report
> > (afunc_setup -> in_rq_cur -> u_audio_get_playback_srate) and confirmed
> > in g_audio_setup() that uac->p_prm.lock is only passed through
> > spin_lock_init() inside the "if (p_chmask)" block, so it is left
> > uninitialized whenever p_chmask is 0. Leading to lock splat issue.
> >
> > This patch is compile test only
> >
> > > Did you forget a Assisted-by: tag?
> >
> > Sure I will add assisted by tag
> >
> > thanks
> >
> > Deepanshu
> 
> Hi Greg,
> 
> Please let me know the status of this patch.

Burried with 2000+ other pending USB patches, please be patient, there
is no rush here as this is not affecting any real device you have,
right?

thanks,

greg k-h
