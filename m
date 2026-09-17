Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91E534349A5;
	Thu, 17 Sep 2026 16:13:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789661608; cv=none; b=Z2abFwg9firZzibdRqdYHmIBJJr3YEEnuKzqSzjz7vxZh6a/Uuq4TIkum+/BR0gpemVamI9/MdMd6xRze27oWM2pcdTnRYiiLTciBRupc06NbswKZDjCcoxv7zYLN2fD1WbpYo3KiUuoaPwB0GQcIQ6Ypw1rwcJp8YUEA06YCvY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789661608; c=relaxed/simple;
	bh=cA5DmSTWjD9VWoXqMaXMNvqz400dkgdJ2jXwvsNFVaU=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=BgpnfblopNsXicZ9OEafJYtfF1bPeNeXRiXXLwx4kIAHEltIPN58dPGaPXMsfr3zbx+ar9KhfNhCx1fd60RFndqhnP+7kffzVhIGdDiy0OHDzrpAFjDRKgtd1I4LzF+k6yoskmyiP/FU/b4zj3TODk0Yab5v2H6epphYz5M7o18=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=ckmW6ErN; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=+Dvw4T2R; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=iR5WZl66; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=tZ+USSjs; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="ckmW6ErN";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="+Dvw4T2R";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="iR5WZl66";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="tZ+USSjs"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 1B5991FF12;
	Thu, 17 Sep 2026 16:13:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1789661599; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=sxD0gm7muTCJpzMjncWMOJ7Y7x4DkQMt/t69IKVzSng=;
	b=ckmW6ErN6bXLxRGrn3CSTYSHpAAAPbvVj4I4DJJPT9elfqc412RfofNBjODqx0fezPWehR
	VjASMdXVTcoXKsOhNTeMwpIIFDGqKKrkFD6SCIhgqDtlK4EhlnBLaoxnou+xpCOtgsvj93
	bbb+/sB7dQ0QWxjuDkVnD++a3gRapAE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1789661599;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=sxD0gm7muTCJpzMjncWMOJ7Y7x4DkQMt/t69IKVzSng=;
	b=+Dvw4T2RelE42UOqSKJ+AIiRvlTb2CZAXOWsXyXN0m9d2+9B5Bn7hEIPj8ertYS8/3qEpa
	utXmTZB5bOeQ1fDw==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1789661595; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=sxD0gm7muTCJpzMjncWMOJ7Y7x4DkQMt/t69IKVzSng=;
	b=iR5WZl66FVpjyEVOW/eHui00r/CvHrUWLWjrQBk8BcWQlsIOZraSuNIvSIh45Rmy7J+4Ru
	EdgYDhPmV0hsml313c+8QkyaO1QF4/MOHT6ueMiXEGcp9mmRHB3Xcrh+W1YWy8sSaaN0t7
	6GCYrclu0fBaPboaOxIeMaS4QoTorlc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1789661595;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=sxD0gm7muTCJpzMjncWMOJ7Y7x4DkQMt/t69IKVzSng=;
	b=tZ+USSjsjuQdQl1tz8mJkm/CY5084OUKSFnC4935n6n5NTSohVM19frUq8K82xMtkRR6vn
	40N8r1a1A+hLMAAA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id B1AAA1374A;
	Thu, 17 Sep 2026 16:13:14 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 3Wq2I5oRrGogeAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 17 Sep 2026 16:13:14 +0000
Date: Thu, 17 Sep 2026 18:13:14 +0200
Message-ID: <87tsnng8kl.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: A Akhil <akhilarul324@gmail.com>
Cc: Takashi Iwai <tiwai@suse.de>,
	tiwai@suse.com,
	perex@perex.cz,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	syzkaller-bugs@googlegroups.com
Subject: Re: Sound/seq: hung task in odev_open - unuse callback sleeps under list_mutex
In-Reply-To: <CACygGA839V5fg=C7nBTTyT0hy=4LV7kKMz1AH-+E9z3s75p3Zg@mail.gmail.com>
References: <CACygGA9s1oWO53NPamL5tkaNhUt-W8S736OVAJZcYCU_UOni+A@mail.gmail.com>
	<87zexggmqt.wl-tiwai@suse.de>
	<CACygGA9h-qehZVFxRMOgtt8y-kHMwSCuuvZwBSi_7R0xpp-dRg@mail.gmail.com>
	<874ifogc5x.wl-tiwai@suse.de>
	<CACygGA839V5fg=C7nBTTyT0hy=4LV7kKMz1AH-+E9z3s75p3Zg@mail.gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Score: -3.30
X-Spam-Level: 
X-Spamd-Result: default: False [-3.30 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_SHORT(-0.20)[-0.999];
	MIME_GOOD(-0.10)[text/plain];
	RCPT_COUNT_SEVEN(0.00)[7];
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_TLS_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:mid,suse.de:email]
X-Spam-Flag: NO

On Thu, 17 Sep 2026 17:42:36 +0200,
A Akhil wrote:
> 
> Hi Takashi,
> 
> Fair enough on dropping, I'll leave that alone.
> 
> I'd actually already tried the 1 second limit before your mail came in, so
> the short answer is yes, it holds up. Same rig as before, one thread
> opening and closing /dev/sequencer2 while two others open it, three runs
> each:
> 
>   unpatched              hung 10, 10, 10    worst block ~130 s
>   your patch             hung  0,  0,  7    30.7 / 30.6 / 129.9 s
>   drain capped at 1*HZ   hung  0,  0,  0    20.6 / 18.4 / 21.8 s
>   progress detection     hung  0,  0,  0    11.0 / 11.1 / 11.6 s  <- new
> 
> I was running with hung_task_timeout_secs=30 to make the failures turn up
> faster, so at the 120 s default the 1*HZ cap has plenty of room.
> 
> The last row is new, and it's the one I'd rather pitch. Rather than
> picking a constant, it just checks whether the device is draining at all:
> wait in HZ/5 slices and give up once avail stops changing, with 10*HZ
> still there as the outer bound. A device that works drains completely as
> before, nothing gets truncated, and a stalled one gets spotted in about
> 400 ms. Comes out at roughly half the teardown time of the 1 s cap here,
> and it's about 20 lines inside snd_rawmidi_drain_output(), nothing
> outside it.

Sounds like a good idea.

> One note in case you do go with the cap. MIDI is 3125 bytes/s and the
> buffer is PAGE_SIZE, so a completely full 4K buffer needs 1.31 s to get
> out. 1*HZ would clip that, and 10*HZ already clips a full buffer on 64K
> page kernels. Unlikely to bite in practice since the buffer is rarely
> full at close, but it's the reason I went looking for something that
> doesn't depend on a fixed number.

Fair enough.

> Also a correction to my last mail: I said about twenty substreams, which
> was wrong. It's one rawmidi device, midiC0D0, and the teardown just calls
> the drain repeatedly, around 31 times per cycle.
> 
> If either of these looks fine to you I'll send it as a proper patch. And
> if I find something better in the meantime I'll pitch that instead.

The idea with an adaptive timeout looks promising, so I'd like to
check this primarily, unless it becomes too complex.

> Enjoy your vacation.

Thanks!


Takashi

> 
> Thanks,
> Akhil Arul
> 
> 
> On Thu, 17 Sept 2026 at 20:25, Takashi Iwai <tiwai@suse.de> wrote:
> >
> > On Thu, 17 Sep 2026 16:11:27 +0200,
> > A Akhil wrote:
> > >
> > > Hi Takashi,
> > >
> > > Thanks for the quick patch. Right, it's not a deadlock, that was my
> > > reading of it too. Nothing locks up permanently, it's just a wait long
> > > enough to trip the detector. That's the reason I bothered with it though.
> > > On the syzbot run the wait was over 140 s, and for the whole of that
> > > anything else touching the sequencer is stuck behind it.
> > >
> > > I ran it on the setup I used to find this in the first place. One thread
> > > opening and closing /dev/sequencer2 while two others try to open it,
> > > hung_task_timeout_secs=30, three runs each.
> > >
> > >   variant                       hung tasks    worst opener block
> > >   ---------------------------------------------------------------
> > >   unpatched                     10, 10, 10    ~130 s
> > >   your patch                    0, 0, 7       30.7 / 30.6 / 129.9 s
> > >   yours + open_mutex narrowed   7, 0, 0       129.9 / 41.3 / 40.9 s
> > >   drain bounded to 1s           0, 0, 0       20.6 / 18.4 / 21.8 s
> > >   drop instead of drain         0, 0, 0       4.0 / 2.4 / 2.4 s
> > >
> > > Your patch builds clean and clearly helps, two of the three runs were
> > > completely quiet. The third still hung though, and when it does it's
> > > coming from the opening side rather than the closing side.
> > >
> > >   task 98:  odev_open                      holds register_mutex
> > >              snd_seq_oss_open
> > >               snd_seq_oss_synth_setup_midi
> > >                snd_seq_oss_midi_open+0x8e  blocked on mdev->open_mutex
> > >   tasks 97, 99: blocked on register_mutex owned by 98 -> hung task
> > >
> > > An opener grabs register_mutex, blocks deeper down, and sits on it while
> > > it waits.
> > >
> > > I tried stacking my earlier open_mutex narrowing in snd_seq_oss_midi_close
> > > on top of yours, so the closer would be holding neither lock over the
> > > drain. Still hung 1 in 3, and the wait had just moved further down again,
> > > this time into snd_seq_port_connect() on grp->list_mutex.
> > >
> > > Three attempts at moving locks around now (mine, yours, both together) and
> > > every one of them just shifts where the wait happens. I don't think the
> > > locking is really the problem here. It's the 10*HZ per substream.
> > >
> > > Bounding the drain to 1*HZ in midisynth_unuse() does stop the hangs, but
> > > the cap is per substream and there are about twenty of them, so teardown
> > > still runs ~20 s. Capping the total across the teardown would do better,
> > > though that's more surgery.
> > >
> > > The one that actually worked was swapping snd_rawmidi_drain_output() for
> > > snd_rawmidi_drop_output() in midisynth_unuse(). ~2.4 s, nothing hung in
> > > any run. Most of what's left there isn't even the data wait, it's the
> > > msleep(50) per substream for the Tx FIFOs.
> > >
> > > I did wonder about throwing the data away, so I went and looked. As far as
> > > I can tell snd_rawmidi_drain_output() already drops the buffer once the
> > > 10*HZ expires, so the bytes are gone either way and dropping early only
> > > costs whatever the device would have taken during the timeout. For a
> > > device that isn't draining, which is the case that gets us here, that's
> > > nothing. Tell me if I've misread that.
> > >
> > > So, do you want me to send the drop version as a proper patch? Or would
> > > you rather bound the drain, in which case I can try a total cap instead of
> > > a per substream one. I can also test a revised version of yours if you'd
> > > prefer to keep this inside seq_oss.
> >
> > Hm, dropping isn't optimal, as that's a clear behavior change; there
> > can be pending bytes even in the real use case.
> >
> > Actually, shortening the drain limit would be an easier way.
> > Practically seen, 1 second should be enough for the real hardware.
> > If this is enough for the syzkaller report, we can take it quickly.
> >
> > Another option would be to offload the snd_seq_kernel_client_ctl()
> > calls in seq_oss_midi.c snd_seq_oss_midi_open() and close() to a work,
> > as you pointed out previously.  This would be relatively safe, I
> > suppose.
> >
> > In general, I'd like to avoid touching too much outside the OSS
> > emulation layer.  The shortening of the drain limit would be OK, but
> > restructuring else isn't preferred.
> >
> > In anyway, if you can pitch some good workaround, I'll happily take.
> >
> > (But I'm going to be off from tomorrow, so it'll be continued after my
> > vacation.)
> >
> >
> > thanks,
> >
> > Takashi
