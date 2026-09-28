Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA0A52E7369;
	Mon, 28 Sep 2026 12:36:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790598990; cv=none; b=ZsBa/HZ3UlOShSLT/ORK+9p7Fwe257pP+xyHpy7s0QEMxNh4euWxGViLhW0OzLM+A/C20U+4KeE9uhbPGl9FD4rmmV9D0YBH0jj9p+fXaG0z6vWmuC6k5qrij/UDzRE3m1I/0IrVLkq+oOZRRHo8zoMXMxR6hBklBSEii7aIGGM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790598990; c=relaxed/simple;
	bh=uZraZvbQFEAbh+rjj7F1JQi75lAteRsDKCzDVpM8x5w=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=EMXqW85/Lhv4MeHQvKK1/owb/UNXcg38Czy0VyjuL8t6R9GTdtNTLF/zsZL7n3ZGDp05lgAWTh8TKHEos2mYYusAy2aE3zJCinDzkoUJAgG5I72eMbSaLYI4p3GemOK2d9CTPhQKZw6LuZ0fWBOh5pBsFjfOxyPOwE7aX2mH5DY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=SuCJne2A; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=ePHOP+/X; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=DvZ22CDL; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=QMogQ8ZY; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="SuCJne2A";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="ePHOP+/X";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="DvZ22CDL";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="QMogQ8ZY"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 8C04F1FB56;
	Mon, 28 Sep 2026 12:36:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1790598982; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=t7jLXsYSLYlq+lM+yZpw3+NX9DD++jf4LFnqjHkoKKA=;
	b=SuCJne2A1NFqCw0WbINUFgzcMGqb7GXaGjjlqG4lOJ8zD/+9/a2Gz+7TvrhjE7cVcpFho8
	g7SpCOoGnfBO2UU8H1B5F50k20mZkdOzYNJo82TkddO5+iYOv+hBVXMrMeIlC6e8gzwW/N
	oqHoT9itcSXRc9Xx3TaWJnYbX94p8WE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1790598982;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=t7jLXsYSLYlq+lM+yZpw3+NX9DD++jf4LFnqjHkoKKA=;
	b=ePHOP+/XoLJaLF7rrsvxts2i4tvI9CwCofNn35FuDWZNPaAnIY+eTYmu2hfildni8DUj2Z
	L0TgBZd0gCPDRHCg==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=DvZ22CDL;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=QMogQ8ZY
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1790598978; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=t7jLXsYSLYlq+lM+yZpw3+NX9DD++jf4LFnqjHkoKKA=;
	b=DvZ22CDLoshdySlRYdBfR2Ebe9DrpzHe3U1XexF7Kyidaea2p6us1KJADNDV0se83PN2AJ
	l/8hjIB5wJSjDS4pAFZfQfXWh9ChUvFu7IU0TWUaaQb767E7rSwnROE3XkpPZaDSWzdBjX
	G/sUvfso8rsHPq3KO3lQHa2AWT2GgW4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1790598978;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=t7jLXsYSLYlq+lM+yZpw3+NX9DD++jf4LFnqjHkoKKA=;
	b=QMogQ8ZYkYa2THhiNROHxbKQozSZX+KK4QbPk6t+hy6Ci2tgCxEYr3+FJ7a9WFzRhIR/OJ
	QcA9T8KyHVMPjeCw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 33ABC133F1;
	Mon, 28 Sep 2026 12:36:18 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 1sLHAUJfumqfAwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 28 Sep 2026 12:36:18 +0000
Date: Mon, 28 Sep 2026 14:36:17 +0200
Message-ID: <87bj9h5z9a.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Akhil Arul <akhilarul324@gmail.com>
Cc: tiwai@suse.com,
	tiwai@suse.de,
	perex@perex.cz,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	syzkaller-bugs@googlegroups.com,
	syzbot+825b7e3a03dd072c187f@syzkaller.appspotmail.com
Subject: Re: [PATCH] ALSA: rawmidi: give up draining output when the device stops draining
In-Reply-To: <20260920130620.61431-1-akhilarul324@gmail.com>
References: <87tsnng8kl.wl-tiwai@suse.de>
	<20260920130620.61431-1-akhilarul324@gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Level: 
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Queue-Id: 8C04F1FB56
X-Spamd-Result: default: False [-2.01 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	RCVD_TLS_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received,2a07:de40:b281:104:10:150:64:97:from];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[825b7e3a03dd072c187f];
	DBL_BLOCKED_OPENRESOLVER(0.00)[syzkaller.appspot.com:url,suse.de:dkim,suse.de:mid,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,appspotmail.com:email]
X-Spam-Flag: NO
X-Spam-Score: -2.01

On Sun, 20 Sep 2026 15:06:20 +0200,
Akhil Arul wrote:
> 
> snd_rawmidi_drain_output() waits up to 10 seconds for the output buffer
> to empty.  The wait is unconditional, so a substream that has stopped
> being consumed costs the full timeout on every call.
> 
> The sequencer OSS emulation makes that expensive.  midisynth_unuse() runs
> as the port unuse callback with grp->list_mutex held for write, and calls
> snd_rawmidi_drain_output().  A single teardown closes every OSS midi port
> of the device, so an unresponsive device exposing many ports holds the
> rwsem for minutes.  snd_seq_port_connect() needs the same rwsem, and in
> the OSS path it runs under register_mutex, so every other odev_open()
> queues up behind it until the hung task detector fires:
> 
>   INFO: task syz.4.21:6176 blocked for more than 143 seconds.
>     __mutex_lock
>     odev_open
>     chrdev_open
>     vfs_open
>     path_openat
> 
> Detect a stalled drain by sampling the free space instead of always
> sleeping for the whole timeout, and give up once it has not increased for
> a second.  A substream that is still making progress is given as long as
> it needs, within the same overall 10 second limit as before, and each
> wait is clipped to the remaining time so that limit is not overshot.
> 
> The warning is rate limited because a stalled drain is now detected much
> more often than once per 10 seconds.
> 
> Closing one such device in qemu, with the syzkaller reproducer supplying
> the gadget, took 72-103 seconds before and 9-11 seconds after.
> 
> Reported-by: syzbot+825b7e3a03dd072c187f@syzkaller.appspotmail.com
> Closes: https://syzkaller.appspot.com/bug?extid=825b7e3a03dd072c187f
> Signed-off-by: Akhil Arul <akhilarul324@gmail.com>
> ---
> Went with the adaptive one in the end.
> 
> I tried the fixed cap first and couldn't make it stand up. buffer_size is
> PAGE_SIZE, so 16K or 64K on arm64, and PARAMS goes to 1MiB, so any constant
> I pick is really a guess about the buffer. Test device consuming at the
> MIDI-1 wire rate:
> 
>   buffer    unpatched      2*HZ cap        adaptive
>    4096     ok 1.42s       ok 1.44s        ok 1.43s
>   16384     ok 5.60s       -EIO 2.06s      ok 5.63s
>   65536     -EIO 10.06s    -EIO 2.06s      -EIO 10.06s
> 
> The middle row is a healthy device at full rate failing because the kernel
> has 16K pages. That killed it for me.
> 
> The adaptive version keeps the 10s ceiling and only bails out when avail
> hasn't moved for a second, so those rows stay as they are. It also happens
> to fix the hang better than the cap did. Closing one /dev/sequencer2 with
> the syzkaller gadget attached, three runs each:
> 
>   unpatched   72.0s   102.7s   102.3s
>   adaptive    10.7s     8.7s    11.6s
>   2*HZ cap    18.4s    12.4s    16.5s
> 
> The teardown still calls the drain the same ~31 times either way, 9 to 15
> of which time out; only the cost of each timeout moves. Hung task detector
> at the default 120s stays quiet over three runs of about four minutes, with
> the repro plus two threads opening /dev/sequencer2.
> 
> The cost is that a substream which goes quiet for a second with data still
> queued now gets -EIO. Same device, pausing once and then resuming:
> 
>   pause    unpatched     patched
>    950ms   ok 3.53s      ok 3.53s
>   1050ms   ok 3.83s      ok 3.84s
>   1200ms   ok 4.28s      -EIO 1.30s
>   2000ms   ok 6.68s      -EIO 1.31s
> 
> So it's 1.05-1.2s rather than exactly a second. The poll grid is 200ms and
> the cutoff drifts depending on where the pause lands against it.
> 
> I said 400ms in my last mail. That turned out to cut off a device pausing
> for half a second, which a real one might do, so I widened it to a second.
> 
> Worth saying that avail isn't monotonic here - drain doesn't gate writers,
> it only forces the wakeup in snd_rawmidi_transmit_ack(). That's why the
> test is whether avail increased rather than whether it reached buffer_size.
> I checked a shared append substream with a second writer refilling it, in
> case that read as a stall. It doesn't: avail jitters instead of sitting
> flat, the counter keeps resetting and the drain runs the full deadline.
> With the refill matched to the consumption rate, unpatched gives -EIO at
> 10.07s and patched at 10.06s.
> 
> I couldn't find a way to bound the teardown without putting a cutoff
> somewhere. Whether a second of silence is enough to call a device stopped
> is your call.
> 
> No Fixes: tag, the 10s wait predates git.

I like the idea, but the code is for the core part and non-trivial, I
put this to for-next branch (for 7.4) now.  Thanks!


Takashi
