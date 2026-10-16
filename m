Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73DFF25B09C;
	Fri, 16 Oct 2026 13:03:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792155785; cv=none; b=LXRAIgQBshh7dBj81iUW49GJdK/Q5SxaQPMHVe5UyW5DPS6/ot2x6kInsqa7hpzYTrlERkbD+tPYabQ+pUcse3kt5FSGjYVmJ+m5ViZ96UsF5xZ45aLcP2Y+laTv0WzSE2NsWIsK1mpwoHY5FUlMXNcvytgHkxSLq7eiSREKmEw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792155785; c=relaxed/simple;
	bh=O4LNga2mnJ7sNgCcPqaLw1T4hei2WbpcRmhr6aXBMQU=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=shlUVWx0PzE06G9H+VeWmVKZJ6I+T1yaPEfPb+XrBwkjoj5quXK1ur+jGfST8sqHFSBGe1G6vgnNHtwe7S793dAan8D5sEz2V6rjzAjxy1b9TKMGZpiCXY2f8GrNVH7sUlTqa/7SAaGoTHZs1yrFusMwW8/dod3Xvu4lXhslHtc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=C7K6ldlT; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=7LnQ6iNc; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=C7K6ldlT; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=7LnQ6iNc; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="C7K6ldlT";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="7LnQ6iNc";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="C7K6ldlT";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="7LnQ6iNc"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id BBCD01F397;
	Fri, 16 Oct 2026 13:03:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1792155780; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=3BFS9b78naOexr6W781V5BkFYIeJmwtTCJbXfYFhpb4=;
	b=C7K6ldlT5P7Kr8HK8YVDgckmWkIDN+U0yjlDjzBWL4ic1ac+eAHSzuAty7v4wLXEDSdJqn
	BuiWsSq2LwHPFAzNvqQn5hEgcugi5RlVcH8llMFrR1mT9X/G1YBVwPbVN2BNOvmPw2vpwg
	bjutypbBqg2OLKlhDQrRnOmr+XImaYE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1792155780;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=3BFS9b78naOexr6W781V5BkFYIeJmwtTCJbXfYFhpb4=;
	b=7LnQ6iNcp4NY9nfntyTGhKrUoL46mM5GUyJIWBTM9rTHB8ADvLhriZjAoSffbfXFtiR/aP
	GLc4Q2qrJPfluODw==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=C7K6ldlT;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=7LnQ6iNc
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1792155780; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=3BFS9b78naOexr6W781V5BkFYIeJmwtTCJbXfYFhpb4=;
	b=C7K6ldlT5P7Kr8HK8YVDgckmWkIDN+U0yjlDjzBWL4ic1ac+eAHSzuAty7v4wLXEDSdJqn
	BuiWsSq2LwHPFAzNvqQn5hEgcugi5RlVcH8llMFrR1mT9X/G1YBVwPbVN2BNOvmPw2vpwg
	bjutypbBqg2OLKlhDQrRnOmr+XImaYE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1792155780;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=3BFS9b78naOexr6W781V5BkFYIeJmwtTCJbXfYFhpb4=;
	b=7LnQ6iNcp4NY9nfntyTGhKrUoL46mM5GUyJIWBTM9rTHB8ADvLhriZjAoSffbfXFtiR/aP
	GLc4Q2qrJPfluODw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 3B9A61378C;
	Fri, 16 Oct 2026 13:03:00 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id mWH1BIQg0mo9cAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 16 Oct 2026 13:03:00 +0000
Date: Fri, 16 Oct 2026 15:02:59 +0200
Message-ID: <87ecdpu7b0.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Cen Zhang <zzzccc427@gmail.com>
Cc: Takashi Iwai <tiwai@suse.de>,
	perex@perex.cz,
	tiwai@suse.com,
	thomas.weissschuh@linutronix.de,
	kees@kernel.org,
	phucduc.bui@gmail.com,
	sammiee5311@gmail.com,
	clemens@ladisch.de,
	tglx@kernel.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	baijiaju1990@gmail.com,
	jjzuming@gmail.com
Subject: Re: [PATCH] ALSA: dummy: Refresh the CD capture switch before use
In-Reply-To: <CAFRLqsUi3te_Dq=o8jDCQyXMO+OmjEKMqa7n8KiRLbifRuHnsQ@mail.gmail.com>
References: <pm-pmb-7364ede2179b8830f660-v2-ca37049bc2e3679bb65f@gmail.com>
	<87h5iluaqg.wl-tiwai@suse.de>
	<CAFRLqsUi3te_Dq=o8jDCQyXMO+OmjEKMqa7n8KiRLbifRuHnsQ@mail.gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=ISO-2022-JP
X-Rspamd-Action: no action
X-Spam-Score: -2.01
X-Spam-Flag: NO
X-Spamd-Result: default: False [-2.01 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCPT_COUNT_TWELVE(0.00)[14];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[suse.de,perex.cz,suse.com,linutronix.de,kernel.org,gmail.com,ladisch.de,vger.kernel.org];
	RCVD_TLS_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	TAGGED_RCPT(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	DKIM_TRACE(0.00)[suse.de:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,suse.de:dkim,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns]
X-Spam-Level: 
X-Rspamd-Queue-Id: BBCD01F397
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org

On Fri, 16 Oct 2026 14:50:04 +0200,
Cen Zhang wrote:
> 
> Hi Takashi,
> 
> Takashi Iwai <tiwai@suse.de> 于2026年10月16日周五 19:49写道：
> >
> > On Fri, 16 Oct 2026 04:01:10 +0200,
> > Cen Zhang wrote:
> > >
> > > The CD Capture Switch control must remain live while
> > > snd_dummy_iobox_put() updates its access flags and uses its ID for
> > > notification. snd_card_dummy_new_mixer() caches the control pointer, but
> > > snd_ctl_remove_id() can unlink and free it without updating that cache.
> > >
> > > This requires a kernel caller to remove the switch while the dummy card
> > > stays connected and External I/O Box remains writable. Userspace
> > > ELEM_REMOVE rejects this driver control because it lacks
> > > SNDRV_CTL_ELEM_ACCESS_USER.
> >
> > So, the removal shouldn't happen, but...
> >
> > > With I/O Box initially 1 and CD Volume still
> > > present, the following ordered sequence is possible:
> > >
> > >   1. snd_ctl_remove_id() takes controls_rwsem for write, finds and
> > >      unlinks CD Capture Switch, sends removal notifications and calls
> > >      snd_ctl_free_one(), then drops the semaphore and returns.
> >
> > ... how this happens at all?  Unless 1 really happens, the rest are
> > fictional dreams.
> >
> > The same for another dummy driver patch.  Does it really happen at
> > all?
> >
> >
> > thanks,
> >
> > Takashi
> 
> Thanks very much for the review. You're right. It is AI obfuscation.
> After carefully checking the code myself, I could not find a real path
> that removes them.
> 
> I'm very, very sorry for this noise. Please disregard both patches.
> I'll be much more careful in the future.

Don't worry, your patches have been appreciated.

But, I guess that we can ask the model to provide a PoC code for
triggering the bug, at least for the case like dummy driver, and
verify the actual crash?  This would show more clearly whether it's a
real issue or not.


thanks,

Takashi
