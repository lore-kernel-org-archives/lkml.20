Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09A8D47140F;
	Thu,  3 Sep 2026 10:03:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788429828; cv=none; b=PzFmyJm26LxviSryyi8CKVXl1crPgxPiWqJ3Ibrq7hga7T7d4tlM39XgP0AbBnbZs5h28G+EoY6e1kE3WB9UJ6OZUYeJnWImoF/Soczkq5DCyimmAPmt7FYvBC91wdW3i/ctpHrknZ6S1lvOKwRgqBwCiXxzPwE77XIQvhBp3hI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788429828; c=relaxed/simple;
	bh=5o2Z5iihaPAXJmysuF8lolU3Gl8eBrlvHAdx3etDJAU=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=q7mo15uILWM0xecES5TttMsuKph1zxrLGdJTsPQTuDIi4rNPDClifXeybwh+GELjghHi9w+ULuoeoUhBW8HledMvOfgRUT8aC9T96OzKIBghO/GnI80p0h5wWcwZK0pXQnkNb6A85RKlc4/b2SQNYPUY29+epcyvu/kTX4Wti04=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=MhdgDkw+; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=0iS8egTn; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=psYehznY; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=UAvCA+jv; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="MhdgDkw+";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="0iS8egTn";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="psYehznY";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="UAvCA+jv"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 60C711FE1F;
	Thu,  3 Sep 2026 10:03:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1788429814; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=mT3oFnEKkRlFGdUsPV9BhGcECbwiB6l/zXuZP7hjPVY=;
	b=MhdgDkw+p83s4QVKInBh2qugaWm2k67HQgcTUlQTCdMis2xlXWCaflgT9WWqE2iXI1AZnq
	xcAmLDv4pgYVXcl5zOILWtp1waX74ajJiALGqAlbeR1npUwtFQBl2PFkkUZx2uLXsGksla
	Z8jhkVBf8m9EduoCN0ERw4KZ+TJpTWc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1788429814;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=mT3oFnEKkRlFGdUsPV9BhGcECbwiB6l/zXuZP7hjPVY=;
	b=0iS8egTnfe3SBkb1Wa0S/iyZDc2xXZESYrgOvb/S9pJgh8g7PQ/B1s281cwYauYEojjlbS
	8sPF7HQX34oJNPAg==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1788429810; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=mT3oFnEKkRlFGdUsPV9BhGcECbwiB6l/zXuZP7hjPVY=;
	b=psYehznYIWvF5qeQV9ulAABv8om5d4xQfonm9QoJ/dlmeWJhfAm+bzRJZ5UpcyAhcCazFU
	Wc7F4B8GBV5Tr0l0adBK4hZAd1I5I5pE7njecNp776Ck2vmp32ah6a9p5f21JIiWGb3gVF
	Q84aRyAeYCgK5Jzs8puap/LxZ9QDv/M=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1788429810;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=mT3oFnEKkRlFGdUsPV9BhGcECbwiB6l/zXuZP7hjPVY=;
	b=UAvCA+jvbv37w45bfOGQWXNlVK8O6SCSzUi++Ydk/9ctmPqOOYS8eh4GmvJ8wXUbMfXXdx
	nhKG9LGwm8lAreAA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id EF2D8136D9;
	Thu,  3 Sep 2026 10:03:29 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id YnAgOfFFmWoxCAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 03 Sep 2026 10:03:29 +0000
Date: Thu, 03 Sep 2026 12:03:29 +0200
Message-ID: <87ld9i8xe6.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Edward Adam Davis <eadavis@sina.com>
Cc: tiwai@suse.de,
	daniel@caiaq.org,
	gregkh@linuxfoundation.org,
	linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	linux-usb@vger.kernel.org,
	perex@perex.cz,
	syzbot+832ce9fa3face1b7d44d@syzkaller.appspotmail.com,
	syzkaller-bugs@googlegroups.com,
	tiwai@suse.com,
	zonque@gmail.com
Subject: Re: [PATCH] ALSA: caiaq: Decoupling ep1_in_urb in caiaq dev
In-Reply-To: <20260903094105.539519-1-eadavis@sina.com>
References: <87pkyu8yu1.wl-tiwai@suse.de>
	<20260903094105.539519-1-eadavis@sina.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Score: -1.80
X-Spam-Level: 
X-Spamd-Result: default: False [-1.80 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_TLS_ALL(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	TAGGED_RCPT(0.00)[832ce9fa3face1b7d44d];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	FREEMAIL_ENVRCPT(0.00)[gmail.com,sina.com];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[suse.de,caiaq.org,linuxfoundation.org,vger.kernel.org,perex.cz,syzkaller.appspotmail.com,googlegroups.com,suse.com,gmail.com];
	FREEMAIL_TO(0.00)[sina.com];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DBL_BLOCKED_OPENRESOLVER(0.00)[syzkaller.appspot.com:url,imap1.dmz-prg2.suse.org:helo,appspotmail.com:email,sina.com:email,suse.de:mid]
X-Spam-Flag: NO

On Thu, 03 Sep 2026 11:41:05 +0200,
Edward Adam Davis wrote:
> 
> From: Edward Aadm Davis <eadavis@sina.com>
> 
> On Thu, 03 Sep 2026 11:32:22 +0200, Takashi Iwai wrote:
> > > The epq_in_urb object belonging to the caiaq device is coupled within
> > > the struct snd_usb_caiaqdev. After usb_submit_urb(epq_in_urb, GFP_KERNEL)
> > > executes successfully, epq_in_urb is successfully added to the urbp_list
> > > queue of the dummy HCD driver (userspace specifies dummy_hcd as the HCD
> > > layer driver for the caiaq USB device).
> > >
> > > When init_card() calls snd_usb_caiaq_send_command() which subsequently
> > > fails due to a timeout, and proceeds to call snd_card_free() to release
> > > the card, the embedded ep1_in_urb object is also freed. When the dummy
> > > HCD driver detects that the URB has been unlinked, it returns the URB
> > > (by usb_hcd_giveback_urb()), which triggers [1].
> > >
> > > Decouple the ep1_in_urb object from the struct snd_usb_caiaqdev and switch
> > > to using a pointer instead. Separately allocate and manage the memory for
> > > ep1_in_urb to prevent the release of the snd_card memory object from
> > > interfering with it.
> > >
> > > [1]
> > > BUG: KASAN: slab-use-after-free in usb_free_urb+0x24/0x120 drivers/usb/core/urb.c:96
> > > Write of size 4 at addr ffff88803cee1050 by task ktimers/1/29
> > > Call Trace:
> > >  usb_free_urb+0x24/0x120 drivers/usb/core/urb.c:96
> > >  dummy_timer+0xaac/0x4d50 drivers/usb/gadget/udc/dummy_hcd.c:2019
> > >  __run_hrtimer kernel/time/hrtimer.c:2067 [inline]
> > >  __hrtimer_run_queues+0x3eb/0xaf0 kernel/time/hrtimer.c:2124
> > >  hrtimer_run_softirq+0x1e1/0x2e0 kernel/time/hrtimer.c:2141
> > >
> > > Allocated by task 36:
> > >  snd_card_new+0x7b/0x110 sound/core/init.c:184
> > >  create_card sound/usb/caiaq/device.c:429 [inline]
> > >  snd_probe+0x236/0x1af0 sound/usb/caiaq/device.c:544
> > >
> > > Freed by task 36:
> > >  snd_card_free_when_closed sound/core/init.c:630 [inline]
> > >  snd_card_free+0x138/0x1d0 sound/core/init.c:662
> > >  snd_probe+0x162b/0x1af0 sound/usb/caiaq/device.c:553
> > >
> > > Reported-by: syzbot+832ce9fa3face1b7d44d@syzkaller.appspotmail.com
> > > Fixes: 523f1dce3743 ("[ALSA] Add Native Instrument usb audio device support")
> > > Closes: https://syzkaller.appspot.com/bug?extid=832ce9fa3face1b7d44d
> > > Tested-by: syzbot+832ce9fa3face1b7d44d@syzkaller.appspotmail.com
> > > Signed-off-by: Edward Adam Davis <eadavis@sina.com>
> > > ---
> > >  sound/usb/caiaq/device.c | 19 +++++++++++--------
> > >  sound/usb/caiaq/device.h |  2 +-
> > >  2 files changed, 12 insertions(+), 9 deletions(-)
> > >
> > > diff --git a/sound/usb/caiaq/device.c b/sound/usb/caiaq/device.c
> > > index a16e59248480..138b58914f1c 100644
> > > --- a/sound/usb/caiaq/device.c
> > > +++ b/sound/usb/caiaq/device.c
> > > @@ -192,8 +192,8 @@ static void usb_ep1_command_reply_dispatch (struct urb* urb)
> > >  		break;
> > >  	}
> > >
> > > -	cdev->ep1_in_urb.actual_length = 0;
> > > -	ret = usb_submit_urb(&cdev->ep1_in_urb, GFP_ATOMIC);
> > > +	cdev->ep1_in_urb->actual_length = 0;
> > > +	ret = usb_submit_urb(cdev->ep1_in_urb, GFP_ATOMIC);
> > >  	if (ret < 0)
> > >  		dev_err(dev, "unable to submit urb. OOM!?\n");
> > >  }
> > > @@ -408,6 +408,8 @@ static void card_free(struct snd_card *card)
> > >  #endif
> > >  	snd_usb_caiaq_audio_free(cdev);
> > >  	usb_put_dev(cdev->chip.dev);
> > > +	usb_free_urb(cdev->ep1_in_urb);
> > > +	cdev->ep1_in_urb = NULL;
> > >  }
> > >
> > >  static int create_card(struct usb_device *usb_dev,
> > > @@ -457,10 +459,11 @@ static int init_card(struct snd_usb_caiaqdev *cdev)
> > >  		return -EIO;
> > >  	}
> > >
> > > -	usb_init_urb(&cdev->ep1_in_urb);
> > > +	cdev->ep1_in_urb = usb_alloc_urb(0, GFP_KERNEL);
> > > +	usb_init_urb(cdev->ep1_in_urb);
> > 
> > The error check is missing here, as sashiko review pointed out.
> > Could you fix and resubmit?
> OK. I will fix and resubmit.
> > 
> > (The other issues reported there -- the potential-double-free and the
> > midi_out_urb handling can be skipped here; I'll fix those
> > individually.)
> I can handle `midi_out_urb` as well.

OK, then let's shoot both URBs in a shot.


thanks,

Takashi
