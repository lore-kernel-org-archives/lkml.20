Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84D3A4DE737;
	Thu, 17 Sep 2026 14:55:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789656966; cv=none; b=X5h5v9NwNQtwQZO0YrcKZ2QgzLXnbTZV3YQFKTVeNIbiWLu83Vmxag5DBCbIamms1+Bl1YDEqFSAgx4UQNUiYgpncuPOVO+hz0yueqK50AqMLx523PdcS1kqphL+fD5WrqxEwc7SM8I5rHoo4Qdl/6XJ6bjplTCPlNx31NN0fMc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789656966; c=relaxed/simple;
	bh=3d+APZaK6f+c/Hm0WMy6ApD3u4icz3XjiLmArWXpfhY=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=TTPwpliBYjiup49p2BQ2fpjaV7EvP0/iNoObERrYXRP7JGhMYXQ6dHlDBZbaOcKxUoJbuOZigd1ItYegN/2JStbPHx9T2AbWtZlaf/UyRa+tkvpHL6b7uNEEisFmmbB4VX/pry0ukrtZjGFQ0ELnuIGicsci0pK9XGFO3tGpUKs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=ITQrNT+0; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=nMBJYl+k; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=mu+RtV1S; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=wdg4rEnG; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="ITQrNT+0";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="nMBJYl+k";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="mu+RtV1S";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="wdg4rEnG"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 2750D1FF8D;
	Thu, 17 Sep 2026 14:55:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1789656943; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=RZq+sreTraaTm2En6adeZRkMjvHPx5PIFVVNzD9BhTw=;
	b=ITQrNT+0eqRA0czC7uaiNW/qXfKkJtSpwkG7YdW7riZjGoTDp+kWHEMSl5EDcSv76q2VhH
	IG7S4MWkqmdLnIs4Ugl7k6lNXzFjgNkvJipfdryh4CSFgswlAVSmBrbyoPlhGeWfaunCCY
	gwiBi5Hc0+rTfiueT2o2a/f4n7zqtU0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1789656943;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=RZq+sreTraaTm2En6adeZRkMjvHPx5PIFVVNzD9BhTw=;
	b=nMBJYl+k9Rh0BsgLtaxiBYNX5v6xDfWg1iAy5h9Q9kLpT+4Clz39sXB4GlROBqwKgBkpN0
	Ns8cFYhI7D5y9zDA==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=mu+RtV1S;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=wdg4rEnG
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1789656939; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=RZq+sreTraaTm2En6adeZRkMjvHPx5PIFVVNzD9BhTw=;
	b=mu+RtV1S+mTPE0yuwb1VjD4QySwI1elM0tWqDFh4sPxChODdKCEk45pOYUJtcwG1EbscmB
	yPeQ99/PiwRUQSCILMCQbOOC6zMmBSsR+dZGM7FJ2C9JJueNLMMYq4rEA4zvWhlWMEavsf
	gARhvz3MJB/oJETZdktEWbHoVQ5nNUg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1789656939;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=RZq+sreTraaTm2En6adeZRkMjvHPx5PIFVVNzD9BhTw=;
	b=wdg4rEnGQaTYyqxFfZKIfbxTxsj1Pc2RlPRvS2dUl2RZhoeFRGCl77y4dvNuGMFyNzi4SZ
	kBWI3hTMHU6z0OCw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id BC2491374A;
	Thu, 17 Sep 2026 14:55:38 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id YMhZJGr/q2rgIwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 17 Sep 2026 14:55:38 +0000
Date: Thu, 17 Sep 2026 16:55:38 +0200
Message-ID: <874ifogc5x.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: A Akhil <akhilarul324@gmail.com>
Cc: Takashi Iwai <tiwai@suse.de>,
	tiwai@suse.com,
	perex@perex.cz,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	syzkaller-bugs@googlegroups.com
Subject: Re: Sound/seq: hung task in odev_open - unuse callback sleeps under list_mutex
In-Reply-To: <CACygGA9h-qehZVFxRMOgtt8y-kHMwSCuuvZwBSi_7R0xpp-dRg@mail.gmail.com>
References: <CACygGA9s1oWO53NPamL5tkaNhUt-W8S736OVAJZcYCU_UOni+A@mail.gmail.com>
	<87zexggmqt.wl-tiwai@suse.de>
	<CACygGA9h-qehZVFxRMOgtt8y-kHMwSCuuvZwBSi_7R0xpp-dRg@mail.gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Score: -4.51
X-Rspamd-Queue-Id: 2750D1FF8D
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Level: 
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-4.51 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	DWL_DNSWL_LOW(-1.00)[suse.de:dkim];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCVD_TLS_ALL(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:mid,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Flag: NO

On Thu, 17 Sep 2026 16:11:27 +0200,
A Akhil wrote:
> 
> Hi Takashi,
> 
> Thanks for the quick patch. Right, it's not a deadlock, that was my
> reading of it too. Nothing locks up permanently, it's just a wait long
> enough to trip the detector. That's the reason I bothered with it though.
> On the syzbot run the wait was over 140 s, and for the whole of that
> anything else touching the sequencer is stuck behind it.
> 
> I ran it on the setup I used to find this in the first place. One thread
> opening and closing /dev/sequencer2 while two others try to open it,
> hung_task_timeout_secs=30, three runs each.
> 
>   variant                       hung tasks    worst opener block
>   ---------------------------------------------------------------
>   unpatched                     10, 10, 10    ~130 s
>   your patch                    0, 0, 7       30.7 / 30.6 / 129.9 s
>   yours + open_mutex narrowed   7, 0, 0       129.9 / 41.3 / 40.9 s
>   drain bounded to 1s           0, 0, 0       20.6 / 18.4 / 21.8 s
>   drop instead of drain         0, 0, 0       4.0 / 2.4 / 2.4 s
> 
> Your patch builds clean and clearly helps, two of the three runs were
> completely quiet. The third still hung though, and when it does it's
> coming from the opening side rather than the closing side.
> 
>   task 98:  odev_open                      holds register_mutex
>              snd_seq_oss_open
>               snd_seq_oss_synth_setup_midi
>                snd_seq_oss_midi_open+0x8e  blocked on mdev->open_mutex
>   tasks 97, 99: blocked on register_mutex owned by 98 -> hung task
> 
> An opener grabs register_mutex, blocks deeper down, and sits on it while
> it waits.
> 
> I tried stacking my earlier open_mutex narrowing in snd_seq_oss_midi_close
> on top of yours, so the closer would be holding neither lock over the
> drain. Still hung 1 in 3, and the wait had just moved further down again,
> this time into snd_seq_port_connect() on grp->list_mutex.
> 
> Three attempts at moving locks around now (mine, yours, both together) and
> every one of them just shifts where the wait happens. I don't think the
> locking is really the problem here. It's the 10*HZ per substream.
> 
> Bounding the drain to 1*HZ in midisynth_unuse() does stop the hangs, but
> the cap is per substream and there are about twenty of them, so teardown
> still runs ~20 s. Capping the total across the teardown would do better,
> though that's more surgery.
> 
> The one that actually worked was swapping snd_rawmidi_drain_output() for
> snd_rawmidi_drop_output() in midisynth_unuse(). ~2.4 s, nothing hung in
> any run. Most of what's left there isn't even the data wait, it's the
> msleep(50) per substream for the Tx FIFOs.
> 
> I did wonder about throwing the data away, so I went and looked. As far as
> I can tell snd_rawmidi_drain_output() already drops the buffer once the
> 10*HZ expires, so the bytes are gone either way and dropping early only
> costs whatever the device would have taken during the timeout. For a
> device that isn't draining, which is the case that gets us here, that's
> nothing. Tell me if I've misread that.
> 
> So, do you want me to send the drop version as a proper patch? Or would
> you rather bound the drain, in which case I can try a total cap instead of
> a per substream one. I can also test a revised version of yours if you'd
> prefer to keep this inside seq_oss.

Hm, dropping isn't optimal, as that's a clear behavior change; there
can be pending bytes even in the real use case.

Actually, shortening the drain limit would be an easier way.
Practically seen, 1 second should be enough for the real hardware.
If this is enough for the syzkaller report, we can take it quickly.

Another option would be to offload the snd_seq_kernel_client_ctl()
calls in seq_oss_midi.c snd_seq_oss_midi_open() and close() to a work,
as you pointed out previously.  This would be relatively safe, I
suppose.

In general, I'd like to avoid touching too much outside the OSS
emulation layer.  The shortening of the drain limit would be OK, but
restructuring else isn't preferred.

In anyway, if you can pitch some good workaround, I'll happily take.

(But I'm going to be off from tomorrow, so it'll be continued after my
vacation.)


thanks,

Takashi
